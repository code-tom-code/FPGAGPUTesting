
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;
use work.FloatCommon.all;

entity StandaloneFloatALU_MUL is
    Port (clk : in STD_LOGIC;

		-- Common ports shared across multiple stages:
		IN_A : in STD_LOGIC_VECTOR(31 downto 0);
		IN_B : in STD_LOGIC_VECTOR(31 downto 0);
		OMUL : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		-- MUL pipe operates in 5 clock cycles
		IMUL_GO : in STD_LOGIC
		);
end StandaloneFloatALU_MUL;

architecture Behavioral of StandaloneFloatALU_MUL is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

-- attribute KEEP : string;

-- Signals common to all pipes:
signal comAIsNaN : std_logic := '0';
signal comBIsNaN : std_logic := '0';
signal comAIsReal : std_logic := '0';
signal comBIsReal : std_logic := '0';
signal comAIsDenormal : std_logic := '0';
signal comBIsDenormal : std_logic := '0';
signal comASign : std_logic := '0';
signal comBSign : std_logic := '0';
signal comSignedExponentA : signed(7 downto 0) := (others => '0');
signal comSignedExponentB : signed(7 downto 0) := (others => '0');
signal comRawMantissaA : unsigned(22 downto 0) := (others => '0');
signal comRawMantissaB : unsigned(22 downto 0) := (others => '0');

-- Multiplication (MUL) pipe signals:
signal mulPipelineValidStage0 : std_logic := '0';
signal mulPipelineValidStage1 : std_logic := '0';
signal mulPipelineValidStage2 : std_logic := '0';
signal mulPipelineValidStage3 : std_logic := '0';

signal mulEarlyOutBypassEnable0 : std_logic := '0';
signal mulEarlyOutBypassEnable1 : std_logic := '0';
signal mulEarlyOutBypassEnable2 : std_logic := '0';
signal mulEarlyOutBypassEnable3 : std_logic := '0';

signal mulAssembledMantissaA : unsigned(23 downto 0) := (others => '0');
signal mulAssembledMantissaB : unsigned(23 downto 0) := (others => '0');

signal mulEarlyOutBypass0 : f32 := (others => '0');
signal mulEarlyOutBypass1 : f32 := (others => '0');
signal mulEarlyOutBypass2 : f32 := (others => '0');
signal mulEarlyOutBypass3 : f32 := (others => '0');

signal mulResultMantissa1 : unsigned(47 downto 0) := (others => '0');
signal mulResultMantissa2 : unsigned(47 downto 0) := (others => '0');
signal mulResultMantissa3 : unsigned(47 downto 0) := (others => '0');

signal mulResultExp0 : signed(8 downto 0) := (others => '0');
signal mulResultExp1 : signed(8 downto 0) := (others => '0');
signal mulResultExp2 : signed(8 downto 0) := (others => '0');
signal mulResultExp3 : signed(8 downto 0) := (others => '0');

signal mulResultSign0 : std_logic := '0';
signal mulResultSign1 : std_logic := '0';
signal mulResultSign2 : std_logic := '0';
signal mulResultSign3 : std_logic := '0';

begin

comAIsNaN <= GetFloatIsNAN(f32(IN_A) );
comBIsNaN <= GetFloatIsNAN(f32(IN_B) );
comAIsReal <= GetFloatIsReal(f32(IN_A) );
comBIsReal <= GetFloatIsReal(f32(IN_B) );
comAIsDenormal <= '1' when (GetRawExponent(f32(IN_A) ) = X"00") else '0';
comBIsDenormal <= '1' when (GetRawExponent(f32(IN_B) ) = X"00") else '0';
comASign <= GetFloatIsNegative(f32(IN_A) );
comBSign <= GetFloatIsNegative(f32(IN_B) );
comSignedExponentA <= GetSignedExponent(f32(IN_A) );
comSignedExponentB <= GetSignedExponent(f32(IN_B) );
comRawMantissaA <= GetMantissa(f32(IN_A) );
comRawMantissaB <= GetMantissa(f32(IN_B) );

-- Multiplication (MUL) pipe process (cycle 1 of 5):
MULStage0 : process(clk)
	variable resultSign : std_logic;
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage0 <= IMUL_GO;
		if (IMUL_GO = '1') then
			-- Calculate the result sign:
			resultSign := comASign xor comBSign;
			mulResultSign0 <= resultSign;

			if (comAIsReal = '0') then -- Handle INF and NaN inputs as special-case early outs:
				mulEarlyOutBypassEnable0 <= '1';

				if (comRawMantissaA = "00000000000000000000000") then -- INF * b
					if (comBIsDenormal = '1') then -- INF * 0 = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					elsif (comBIsNaN = '1') then -- INF * NaN = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					else -- INF * b = INF
						mulEarlyOutBypass0 <= resultSign & X"FF" & "00000000000000000000000";
					end if;
				else -- NaN * b = NaN
					mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
				end if;
			elsif (comBIsReal = '0') then
				mulEarlyOutBypassEnable0 <= '1';

				if (comRawMantissaB = "00000000000000000000000") then -- a * INF
					if (comAIsDenormal = '1') then -- 0 * INF = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					elsif (comAIsNaN = '1') then -- NaN * INF = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					else -- a * INF = INF
						mulEarlyOutBypass0 <= resultSign & X"FF" & "00000000000000000000000";
					end if;
				else -- a * NaN = NaN
					mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
				end if;
			elsif ( (comAIsDenormal = '1') or (comBIsDenormal = '1') ) then -- Handle multiplication by zero (or denormals, which get flushed to zero) as a special-case early out:
				mulEarlyOutBypassEnable0 <= '1';
				mulEarlyOutBypass0 <= resultSign & X"00" & "00000000000000000000000";
			else -- Primary multiplication case:
				mulEarlyOutBypassEnable0 <= '0';
				mulResultExp0 <= resize(comSignedExponentA, 9) + resize(comSignedExponentB, 9);
				mulAssembledMantissaA <= '1' & comRawMantissaA;
				mulAssembledMantissaB <= '1' & comRawMantissaB;
			end if;
		end if;
	end if;
end process MULStage0;

-- Multiplication (MUL) pipe process (cycle 2 of 5):
MULStage1 : process(clk)
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage1 <= mulPipelineValidStage0;
		if (mulPipelineValidStage0 = '1') then
			mulEarlyOutBypassEnable1 <= mulEarlyOutBypassEnable0;
			mulEarlyOutBypass1 <= mulEarlyOutBypass0;
			mulResultExp1 <= mulResultExp0;
			mulResultSign1 <= mulResultSign0;
			if (mulEarlyOutBypassEnable0 = '0') then
				-- TODO: See if this can be broken up into just one DSP usage with an 18x17 multiply and then some smaller 6x18 multiplies added together rather than the current two DSP multiplies
				mulResultMantissa1 <= mulAssembledMantissaA * mulAssembledMantissaB;
			end if;
		end if;
	end if;
end process MULStage1;

-- Multiplication (MUL) pipe process (cycle 3 of 5):
MULStage2 : process(clk)
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage2 <= mulPipelineValidStage1;
		if (mulPipelineValidStage1 = '1') then
			mulEarlyOutBypassEnable2 <= mulEarlyOutBypassEnable1;
			mulEarlyOutBypass2 <= mulEarlyOutBypass1;
			mulResultExp2 <= mulResultExp1;
			mulResultMantissa2 <= mulResultMantissa1;
			mulResultSign2 <= mulResultSign1;
		end if;
	end if;
end process MULStage2;

-- Multiplication (MUL) pipe process (cycle 4 of 5):
MULStage3 : process(clk)
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage3 <= mulPipelineValidStage2;
		if (mulPipelineValidStage2 = '1') then
			mulEarlyOutBypassEnable3 <= mulEarlyOutBypassEnable2;
			mulEarlyOutBypass3 <= mulEarlyOutBypass2;
			mulResultExp3 <= mulResultExp2;
			mulResultMantissa3 <= mulResultMantissa2;
			mulResultSign3 <= mulResultSign2;
		end if;
	end if;
end process MULStage3;

-- Multiplication (MUL) pipe process (cycle 5 of 5):
-- TODO: Handle proper rounding. About half of all of the output values aren't rounded as they should be!
MULStage4 : process(clk)
	variable finalMantissa : unsigned(47 downto 0);
begin
	if (rising_edge(clk) ) then
		if (mulPipelineValidStage3 = '1') then
			if (mulEarlyOutBypassEnable3 = '1') then -- Mul bypass case
				OMUL <= std_logic_vector(mulEarlyOutBypass3);
			else -- Non-bypass standard case
				if (mulResultExp3 > to_signed(127, 9) ) then -- Saturate to INF if we end up overflowing to +/- INF
					OMUL <= mulResultSign3 & X"FF" & "00000000000000000000000";
				elsif (mulResultExp3 < to_signed(-126, 9) ) then -- Saturate to 0 if we end up underflowing into 0 or denormals
					OMUL <= mulResultSign3 & X"00" & "00000000000000000000000";
				else -- Standard case
					finalMantissa := mulResultMantissa3 srl 23;
					if (finalMantissa(24) = '1') then -- If the mantissa overflows into the exponent, we need to renormalize
						if (mulResultExp3 = to_signed(127, 9) ) then -- Our overflow could cause us to overflow into INF
							OMUL <= mulResultSign3 & X"FF" & "00000000000000000000000";
						else
							finalMantissa := finalMantissa srl 1; -- Handle renormalize by adding 1 to the exponent and shifting the mantissa to the right by 1
							OMUL <= mulResultSign3 & MakeExponentFromSigned(mulResultExp3(7 downto 0) + to_signed(1, 8) ) & std_logic_vector(finalMantissa(22 downto 0) );
						end if;
					else -- No mantissa overflow case
						OMUL <= mulResultSign3 & MakeExponentFromSigned(mulResultExp3(7 downto 0) ) & std_logic_vector(finalMantissa(22 downto 0) );
					end if;
				end if;
			end if;
		end if;
	end if;
end process MULStage4;

end Behavioral;
