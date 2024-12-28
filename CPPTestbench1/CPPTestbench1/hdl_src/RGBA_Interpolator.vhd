
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RGBA_Interpolator is
    Port (clk : in STD_LOGIC;

		IN_RGBA_Color0 : in STD_LOGIC_VECTOR(31 downto 0);
		IN_RGBA_Color1 : in STD_LOGIC_VECTOR(31 downto 0);
		IN_InterpFrac : in STD_LOGIC_VECTOR(7 downto 0);

		-- This RGBA INTERP pipe operates in 4 clock cycles.
		OINTERP : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
		);
end RGBA_Interpolator;

architecture Behavioral of RGBA_Interpolator is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

type RGBVec4 is record
	R : unsigned(7 downto 0);
	G : unsigned(7 downto 0);
	B : unsigned(7 downto 0);
	A : unsigned(7 downto 0);
end record RGBVec4;

type interpVec4 is record
	X : unsigned(7 downto 0);
	Y : unsigned(7 downto 0);
	Z : unsigned(7 downto 0);
	W : unsigned(7 downto 0);
end record interpVec4;

type mulTemporary4 is record
	X : unsigned(15 downto 0);
	Y : unsigned(15 downto 0);
	Z : unsigned(15 downto 0);
	W : unsigned(15 downto 0);
end record mulTemporary4;

pure function LoadVec4(RGBA : unsigned(31 downto 0) ) return RGBVec4 is
	variable ret : RGBVec4;
begin
	ret.R := RGBA(7 downto 0);
	ret.G := RGBA(15 downto 8);
	ret.B := RGBA(23 downto 16);
	ret.A := RGBA(31 downto 24);
	return ret;
end function;

pure function minBits(aVec : RGBVec4; bVec : RGBVec4) return std_logic_vector is
	variable ret : std_logic_vector(3 downto 0);
begin
	if (aVec.R < bVec.R) then
		ret(0) := '1';
	else
		ret(0) := '0';
	end if;
	if (aVec.G < bVec.G) then
		ret(1) := '1';
	else
		ret(1) := '0';
	end if;
	if (aVec.B < bVec.B) then
		ret(2) := '1';
	else
		ret(2) := '0';
	end if;
	if (aVec.A < bVec.A) then
		ret(3) := '1';
	else
		ret(3) := '0';
	end if;
	return ret;
end function;

pure function assembleMin(aVec : RGBVec4; bVec : RGBVec4; minBitsVec : STD_LOGIC_VECTOR(3 downto 0) ) return RGBVec4 is
	variable ret : RGBVec4;
begin
	if (minBitsVec(0) = '1') then
		ret.R := aVec.R;
	else
		ret.R := bVec.R;
	end if;
	if (minBitsVec(1) = '1') then
		ret.G := aVec.G;
	else
		ret.G := bVec.G;
	end if;
	if (minBitsVec(2) = '1') then
		ret.B := aVec.B;
	else
		ret.B := bVec.B;
	end if;
	if (minBitsVec(3) = '1') then
		ret.A := aVec.A;
	else
		ret.A := bVec.A;
	end if;
	return ret;
end function;

pure function assembleMax(aVec : RGBVec4; bVec : RGBVec4; minBitsVec : STD_LOGIC_VECTOR(3 downto 0) ) return RGBVec4 is
	variable ret : RGBVec4;
begin
	if (minBitsVec(0) = '1') then
		ret.R := bVec.R;
	else
		ret.R := aVec.R;
	end if;
	if (minBitsVec(1) = '1') then
		ret.G := bVec.G;
	else
		ret.G := aVec.G;
	end if;
	if (minBitsVec(2) = '1') then
		ret.B := bVec.B;
	else
		ret.B := aVec.B;
	end if;
	if (minBitsVec(3) = '1') then
		ret.A := bVec.A;
	else
		ret.A := aVec.A;
	end if;
	return ret;
end function;

pure function assembleInterpVec(interpBits : unsigned(7 downto 0); directionBits : STD_LOGIC_VECTOR(3 downto 0) ) return interpVec4 is
	variable ret : interpVec4;
	variable oneMinusInterpBits : unsigned(7 downto 0);
begin
	-- For unsigned integers, you can implement the max value inversion by using the bitwise not operator instead (this avoids having to implement a carry chain that would normally be needed for a true subtractor)
	oneMinusInterpBits := not interpBits;
	if (directionBits(0) = '1') then
		ret.X := interpBits;
	else
		ret.X := oneMinusInterpBits;
	end if;
	if (directionBits(1) = '1') then
		ret.Y := interpBits;
	else
		ret.Y := oneMinusInterpBits;
	end if;
	if (directionBits(2) = '1') then
		ret.Z := interpBits;
	else
		ret.Z := oneMinusInterpBits;
	end if;
	if (directionBits(3) = '1') then
		ret.W := interpBits;
	else
		ret.W := oneMinusInterpBits;
	end if;
	return ret;
end function;

signal Color0 : RGBVec4;
signal Color1 : RGBVec4;
signal lerpDirections : STD_LOGIC_VECTOR(3 downto 0); -- Bool-vector of Color0.RGBA < Color1.RGBA
signal InterpFrac : unsigned(7 downto 0) := (others => '0');
signal interpFracsVec : interpVec4;
signal deltaColor : RGBVec4;
signal minVec : RGBVec4;
signal minVec2 : RGBVec4;
signal mulTemporary : mulTemporary4; -- Stores 16-bit intermediary products before they get shifted down to 8 bits once again

begin

minMaxProc : process(clk)
	variable TempColor0 : RGBVec4;
	variable TempColor1 : RGBVec4;
begin
	if (rising_edge(clk) ) then
		TempColor0 := LoadVec4(unsigned(IN_RGBA_Color0) );
		TempColor1 := LoadVec4(unsigned(IN_RGBA_Color1) );

		lerpDirections <= minBits(TempColor0, TempColor1);

		Color0 <= TempColor0;
		Color1 <= TempColor1;

		InterpFrac <= unsigned(IN_InterpFrac);
	end if;
end process minMaxProc;

deltaProc : process(clk)
	variable tempMin : RGBVec4;
	variable tempMax : RGBVec4;
begin
	if (rising_edge(clk) ) then
		tempMin := assembleMin(Color0, Color1, lerpDirections);
		tempMax := assembleMax(Color0, Color1, lerpDirections);
		interpFracsVec <= assembleInterpVec(InterpFrac, lerpDirections);

		deltaColor.R <= tempMax.R - tempMin.R;
		deltaColor.G <= tempMax.G - tempMin.G;
		deltaColor.B <= tempMax.B - tempMin.B;
		deltaColor.A <= tempMax.A - tempMin.A;

		minVec <= tempMin;
	end if;
end process deltaProc;

multiplyProc : process(clk)
begin
	if (rising_edge(clk) ) then
		mulTemporary.X <= deltaColor.R * interpFracsVec.X;
		mulTemporary.Y <= deltaColor.G * interpFracsVec.Y;
		mulTemporary.Z <= deltaColor.B * interpFracsVec.Z;
		mulTemporary.W <= deltaColor.A * interpFracsVec.W;

		minVec2 <= minVec;
	end if;
end process multiplyProc;

combineProc : process(clk)
begin
	if (rising_edge(clk) ) then
		OINTERP(7 downto 0) <= std_logic_vector(minVec2.R + mulTemporary.X(15 downto 8) );
		OINTERP(15 downto 8) <= std_logic_vector(minVec2.G + mulTemporary.Y(15 downto 8) );
		OINTERP(23 downto 16) <= std_logic_vector(minVec2.B + mulTemporary.Z(15 downto 8) );
		OINTERP(31 downto 24) <= std_logic_vector(minVec2.A + mulTemporary.W(15 downto 8) );
	end if;
end process combineProc;

end Behavioral;
