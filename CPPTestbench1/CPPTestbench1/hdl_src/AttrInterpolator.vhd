library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;

entity AttrInterpolator is
	Port ( clk : in STD_LOGIC;

	-- Command Processor interface begin
		CMD_UseFlatShading : in STD_LOGIC;
	-- Command Processor interface end

	-- Attribute Interpolator interface begin
		DINTERP_ReadyForNewPixel : out STD_LOGIC := '0';
		DINTERP_NewPixelValid : in STD_LOGIC;
		DINTERP_PosX : in STD_LOGIC_VECTOR(9 downto 0);
		DINTERP_PosY : in STD_LOGIC_VECTOR(9 downto 0);
		DINTERP_TX0 : in STD_LOGIC_VECTOR(15 downto 0);
		DINTERP_TX1 : in STD_LOGIC_VECTOR(15 downto 0);
		DINTERP_TX2 : in STD_LOGIC_VECTOR(15 downto 0);
		DINTERP_TY0 : in STD_LOGIC_VECTOR(15 downto 0);
		DINTERP_TY1 : in STD_LOGIC_VECTOR(15 downto 0);
		DINTERP_TY2 : in STD_LOGIC_VECTOR(15 downto 0);
		DINTERP_VC0 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_VC1 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_VC2 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_NormalizedBarycentricDivZ0 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_NormalizedBarycentricDivZ1 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_NormalizedBarycentricDivZ2 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_OutPixelDepth : in STD_LOGIC_VECTOR(31 downto 0);
	-- Attribute Interpolator interface end

	-- FPU interfaces begin
		FPU_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Mode : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		FPU_ISHFT_GO : out STD_LOGIC := '0';
		FPU_IMUL_GO : out STD_LOGIC := '0';
		FPU_IADD_GO : out STD_LOGIC := '0';
		FPU_ICMP_GO : out STD_LOGIC := '0';
		FPU_ICNV_GO : out STD_LOGIC := '0';
		FPU_ISPEC_GO : out STD_LOGIC := '0';
		FPU_IBIT_GO : out STD_LOGIC := '0';
		FPU_OUT : in STD_LOGIC_VECTOR(31 downto 0);
	-- FPU interfaces end

	-- UNORM8ToFloat signals begin
		UNORM8ToFloat_Enable : out STD_LOGIC := '0';
		UNORM8ToFloat_ColorIn : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		UNORM8ToFloat_ConvertedX : in STD_LOGIC_VECTOR(31 downto 0);
		UNORM8ToFloat_ConvertedY : in STD_LOGIC_VECTOR(31 downto 0);
		UNORM8ToFloat_ConvertedZ : in STD_LOGIC_VECTOR(31 downto 0);
		UNORM8ToFloat_ConvertedW : in STD_LOGIC_VECTOR(31 downto 0);
	-- UNORM8ToFloat signals end

	-- Texture Sampler interface begin
		TEXSAMP_outInterpolatedTexcoordX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TEXSAMP_outInterpolatedTexcoordY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TEXSAMP_outInterpolatedColorRGBA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TEXSAMP_outPixelX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TEXSAMP_outPixelY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

		TEXSAMP_writeIsValid : out STD_LOGIC := '0';
		TEXSAMP_readyForWrite : in STD_LOGIC;
	-- Texture Sampler interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_AttrInterpolator_State : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
		DBG_RastBarycentricA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RastBarycentricB : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RastBarycentricC : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
		);
end AttrInterpolator;

architecture Behavioral of AttrInterpolator is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

constant flatshading : STD_LOGIC := '0';

type attrInterpStateType is 
(
	init, -- 0
	waitingForRead, -- 1

	convertVertexAttributes0, -- 2
	convertVertexAttributes1, -- 3
	convertVertexAttributes2, -- 4
	convertVertexAttributes3, -- 5
	convertVertexAttributes4, -- 6
	convertVertexAttributes5, -- 7
	convertVertexAttributes6, -- 8
	convertVertexAttributes7, -- 9
	convertVertexAttributes8, -- 10
	convertVertexAttributes9, -- 11

	multBarycentricsAndAttr0, -- 12
	multBarycentricsAndAttr1, -- 13
	multBarycentricsAndAttr2, -- 14
	multBarycentricsAndAttr3, -- 15
	multBarycentricsAndAttr4, -- 16
	multBarycentricsAndAttr5, -- 17
	multBarycentricsAndAttr6, -- 18
	multBarycentricsAndAttr7, -- 19
	multBarycentricsAndAttr8, -- 20
	multBarycentricsAndAttr9, -- 21
	multBarycentricsAndAttr10, -- 22
	multBarycentricsAndAttr11, -- 23
	multBarycentricsAndAttr12, -- 24
	multBarycentricsAndAttr13, -- 25
	multBarycentricsAndAttr14, -- 26
	multBarycentricsAndAttr15, -- 27
	multBarycentricsAndAttr16, -- 28
	multBarycentricsAndAttr17, -- 29
	multBarycentricsAndAttr18, -- 30
	multBarycentricsAndAttr19, -- 31
	multBarycentricsAndAttr20, -- 32
	multBarycentricsAndAttr21, -- 33
	multBarycentricsAndAttr22, -- 34
	multBarycentricsAndAttr23, -- 35

	addDotProductTerms0, -- 36
	addDotProductTerms1, -- 37
	addDotProductTerms2, -- 38
	addDotProductTerms3, -- 39
	addDotProductTerms4, -- 40
	addDotProductTerms5, -- 41
	addDotProductTerms6, -- 42
	addDotProductTerms7, -- 43
	addDotProductTerms8, -- 44
	addDotProductTerms9, -- 45
	addDotProductTerms10, -- 46
	addDotProductTerms11, -- 47
	addDotProductTerms12, -- 48
	addDotProductTerms13, -- 49
	addDotProductTerms14, -- 50
	addDotProductTerms15, -- 51
	addDotProductTerms16, -- 52

	multiplyPixelDepth0, -- 53
	multiplyPixelDepth1, -- 54
	multiplyPixelDepth2, -- 55
	multiplyPixelDepth3, -- 56
	multiplyPixelDepth4, -- 57
	multiplyPixelDepth5, -- 58
	multiplyPixelDepth6, -- 59
	multiplyPixelDepth7, -- 60
	multiplyPixelDepth8, -- 61
	multiplyPixelDepth9, -- 62
	multiplyPixelDepth10, -- 63
	multiplyPixelDepth11, -- 64

	compressOutput0, -- 65
	compressOutput1, -- 66
	compressOutput2, -- 67
	compressOutput3, -- 68
	compressOutput4, -- 69
	compressOutput5, -- 70
	compressOutput6, -- 71
	compressOutput7, -- 72
	compressOutput8, -- 73
	compressOutput9, -- 74
	compressOutput10, -- 75
	compressOutput11, -- 76

	waitingForWrite -- 77
);

type VertexFloatData is record
	tx : unsigned(31 downto 0);
	ty : unsigned(31 downto 0);

	color_r : unsigned(31 downto 0);
	color_g : unsigned(31 downto 0);
	color_b : unsigned(31 downto 0);
	color_a : unsigned(31 downto 0);
end record VertexFloatData;

constant DefaultVertexFloatData : VertexFloatData := (others => (others => '0') );

signal currentState : attrInterpStateType := init;

signal storedPixelX : unsigned(15 downto 0) := (others => '0');
signal storedPixelY : unsigned(15 downto 0) := (others => '0');

signal pixelDepth : unsigned(31 downto 0) := (others => '0'); -- float32 format (0.0f to 1.0f) pixel depth value
signal storedTX0 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedTY0 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedTX1 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedTY1 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedTX2 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedTY2 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedColorRGBA0 : unsigned(31 downto 0) := (others => '0');
signal storedColorRGBA1 : unsigned(31 downto 0) := (others => '0');
signal storedColorRGBA2 : unsigned(31 downto 0) := (others => '0');
signal normalizedBarycentricDivZ0 : unsigned(31 downto 0) := (others => '0'); -- float32 format result of (1/z0 * normalizedBarycentricA)
signal normalizedBarycentricDivZ1 : unsigned(31 downto 0) := (others => '0'); -- float32 format result of (1/z0 * normalizedBarycentricB)
signal normalizedBarycentricDivZ2 : unsigned(31 downto 0) := (others => '0'); -- float32 format result of (1/z0 * normalizedBarycentricC)
signal useFlatShading : std_logic := '0';

signal unpackedVertex0 : VertexFloatData := DefaultVertexFloatData;
signal unpackedVertex1 : VertexFloatData := DefaultVertexFloatData;
signal unpackedVertex2 : VertexFloatData := DefaultVertexFloatData;

signal dotProductTemporarySumTX : unsigned(31 downto 0) := (others => '0');
signal dotProductTemporarySumTY : unsigned(31 downto 0) := (others => '0');
signal dotProductTemporarySumColorR : unsigned(31 downto 0) := (others => '0');
signal dotProductTemporarySumColorG : unsigned(31 downto 0) := (others => '0');
signal dotProductTemporarySumColorB : unsigned(31 downto 0) := (others => '0');
signal dotProductTemporarySumColorA : unsigned(31 downto 0) := (others => '0');

signal wrappedTexcoordTX : unsigned(31 downto 0) := (others => '0');
signal wrappedTexcoordTY : unsigned(31 downto 0) := (others => '0');
signal compressedOutPixelDataTX : unsigned(15 downto 0) := (others => '0');
signal compressedOutPixelDataTY : unsigned(15 downto 0) := (others => '0');
signal compressedOutPixelDataColorR : unsigned(7 downto 0) := (others => '0');
signal compressedOutPixelDataColorG : unsigned(7 downto 0) := (others => '0');
signal compressedOutPixelDataColorB : unsigned(7 downto 0) := (others => '0');
signal compressedOutPixelDataColorA : unsigned(7 downto 0) := (others => '0');

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

pure function SwizzleRGBAToARGB(colorRGBA : unsigned(31 downto 0) ) return unsigned is
begin
	return colorRGBA(31 downto 24) & -- A
		colorRGBA(7 downto 0) & -- R
		colorRGBA(15 downto 8) & -- G
		colorRGBA(23 downto 16); -- B
end function;

pure function SaturateFloat(inFloat : unsigned(31 downto 0) ) return unsigned is
begin
	if (inFloat(31) = '1') then
		return X"00000000";
	elsif (inFloat(30 downto 0) > "111111100000000000000000000000") then
		return X"3F800000";
	else
		return inFloat;
	end if;
end function;

begin

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);

DBG_AttrInterpolator_State <= std_logic_vector(to_unsigned(attrInterpStateType'pos(currentState), 7) );
DBG_RastBarycentricA <= std_logic_vector(normalizedBarycentricDivZ0);
DBG_RastBarycentricB <= std_logic_vector(normalizedBarycentricDivZ1);
DBG_RastBarycentricC <= std_logic_vector(normalizedBarycentricDivZ2);

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when waitingForRead =>
					statCyclesIdle <= statCyclesIdle + 1;

				when waitingForWrite =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when others =>
					statCyclesWorking <= statCyclesWorking + 1;
			end case;
		end if;
	end process;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when init =>
					TEXSAMP_writeIsValid <= '0';
					currentState <= waitingForRead;

				when waitingForRead =>
					TEXSAMP_writeIsValid <= '0';
					if (DINTERP_NewPixelValid = '1') then
						DINTERP_ReadyForNewPixel <= '0';

						storedPixelX <= "000000" & unsigned(DINTERP_PosX);
						storedPixelY <= "000000" & unsigned(DINTERP_PosY);
						storedTX0 <= unsigned(DINTERP_TX0);
						storedTX1 <= unsigned(DINTERP_TX1);
						storedTX2 <= unsigned(DINTERP_TX2);
						storedTY0 <= unsigned(DINTERP_TY0);
						storedTY1 <= unsigned(DINTERP_TY1);
						storedTY2 <= unsigned(DINTERP_TY2);
						storedColorRGBA0 <= unsigned(DINTERP_VC0);
						storedColorRGBA1 <= unsigned(DINTERP_VC1);
						storedColorRGBA2 <= unsigned(DINTERP_VC2);
						normalizedBarycentricDivZ0 <= unsigned(DINTERP_NormalizedBarycentricDivZ0);
						normalizedBarycentricDivZ1 <= unsigned(DINTERP_NormalizedBarycentricDivZ1);
						normalizedBarycentricDivZ2 <= unsigned(DINTERP_NormalizedBarycentricDivZ2);
						pixelDepth <= unsigned(DINTERP_OutPixelDepth);

						-- Sample our async command processor signal when we start a new pixel
						useFlatShading <= CMD_UseFlatShading;

						currentState <= convertVertexAttributes0;
					else
						DINTERP_ReadyForNewPixel <= '1';
					end if;

				when convertVertexAttributes0 =>
					DINTERP_ReadyForNewPixel <= '0';

					UNORM8ToFloat_ColorIn <= std_logic_vector(SwizzleRGBAToARGB(storedColorRGBA0) );
					UNORM8ToFloat_Enable <= '1';

					FPU_A <= X"0000" & std_logic_vector(storedTX0);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(Half_to_F), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= convertVertexAttributes1;

				when convertVertexAttributes1 =>
					UNORM8ToFloat_ColorIn <= std_logic_vector(SwizzleRGBAToARGB(storedColorRGBA1) );
					UNORM8ToFloat_Enable <= '1';

					FPU_A <= X"0000" & std_logic_vector(storedTX1);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(Half_to_F), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= convertVertexAttributes2;

				when convertVertexAttributes2 =>
					unpackedVertex0.color_r <= unsigned(UNORM8ToFloat_ConvertedX);
					unpackedVertex0.color_g <= unsigned(UNORM8ToFloat_ConvertedY);
					unpackedVertex0.color_b <= unsigned(UNORM8ToFloat_ConvertedZ);
					unpackedVertex0.color_a <= unsigned(UNORM8ToFloat_ConvertedW);

					UNORM8ToFloat_ColorIn <= std_logic_vector(SwizzleRGBAToARGB(storedColorRGBA2) );
					UNORM8ToFloat_Enable <= '1';

					FPU_A <= X"0000" & std_logic_vector(storedTX2);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(Half_to_F), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= convertVertexAttributes3;

				when convertVertexAttributes3 =>
					unpackedVertex1.color_r <= unsigned(UNORM8ToFloat_ConvertedX);
					unpackedVertex1.color_g <= unsigned(UNORM8ToFloat_ConvertedY);
					unpackedVertex1.color_b <= unsigned(UNORM8ToFloat_ConvertedZ);
					unpackedVertex1.color_a <= unsigned(UNORM8ToFloat_ConvertedW);

					UNORM8ToFloat_Enable <= '0';

					FPU_A <= X"0000" & std_logic_vector(storedTY0);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(Half_to_F), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= convertVertexAttributes4;

				when convertVertexAttributes4 =>
					unpackedVertex2.color_r <= unsigned(UNORM8ToFloat_ConvertedX);
					unpackedVertex2.color_g <= unsigned(UNORM8ToFloat_ConvertedY);
					unpackedVertex2.color_b <= unsigned(UNORM8ToFloat_ConvertedZ);
					unpackedVertex2.color_a <= unsigned(UNORM8ToFloat_ConvertedW);

					unpackedVertex0.tx <= unsigned(FPU_OUT);

					FPU_A <= X"0000" & std_logic_vector(storedTY1);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(Half_to_F), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= convertVertexAttributes5;

				when convertVertexAttributes5 =>
					unpackedVertex1.tx <= unsigned(FPU_OUT);

					FPU_A <= X"0000" & std_logic_vector(storedTY2);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(Half_to_F), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= convertVertexAttributes6;

				when convertVertexAttributes6 =>
					unpackedVertex2.tx <= unsigned(FPU_OUT);

					FPU_ICNV_GO <= '0';
					currentState <= convertVertexAttributes7;

				when convertVertexAttributes7 =>
					unpackedVertex0.ty <= unsigned(FPU_OUT);
					currentState <= convertVertexAttributes8;

				when convertVertexAttributes8 =>
					unpackedVertex1.ty <= unsigned(FPU_OUT);
					currentState <= convertVertexAttributes9;

				when convertVertexAttributes9 =>
					unpackedVertex2.ty <= unsigned(FPU_OUT);
					if (useFlatShading = '1') then -- If we're doing flat shading then we should skip all of this interpolation math
						currentState <= compressOutput0;
					else
						currentState <= multBarycentricsAndAttr0;
					end if;

				when multBarycentricsAndAttr0 =>
					FPU_A <= std_logic_vector(normalizedBarycentricDivZ0);
					FPU_B <= std_logic_vector(unpackedVertex0.tx);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr1;

				when multBarycentricsAndAttr1 =>
					FPU_A <= std_logic_vector(normalizedBarycentricDivZ1);
					FPU_B <= std_logic_vector(unpackedVertex1.tx);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr2;

				when multBarycentricsAndAttr2 =>
					FPU_A <= std_logic_vector(normalizedBarycentricDivZ2);
					FPU_B <= std_logic_vector(unpackedVertex2.tx);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr3;

				when multBarycentricsAndAttr3 =>
					FPU_A <= std_logic_vector(normalizedBarycentricDivZ0);
					FPU_B <= std_logic_vector(unpackedVertex0.ty);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr4;

				when multBarycentricsAndAttr4 =>
					FPU_A <= std_logic_vector(normalizedBarycentricDivZ1);
					FPU_B <= std_logic_vector(unpackedVertex1.ty);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr5;

				when multBarycentricsAndAttr5 =>
					FPU_A <= std_logic_vector(normalizedBarycentricDivZ2);
					FPU_B <= std_logic_vector(unpackedVertex2.ty);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr6;

				when multBarycentricsAndAttr6 =>
					unpackedVertex0.tx <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ0);
					FPU_B <= std_logic_vector(unpackedVertex0.color_r);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr7;

				when multBarycentricsAndAttr7 =>
					unpackedVertex1.tx <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ1);
					FPU_B <= std_logic_vector(unpackedVertex1.color_r);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr8;

				when multBarycentricsAndAttr8 =>
					unpackedVertex2.tx <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ2);
					FPU_B <= std_logic_vector(unpackedVertex2.color_r);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr9;

				when multBarycentricsAndAttr9 =>
					unpackedVertex0.ty <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ0);
					FPU_B <= std_logic_vector(unpackedVertex0.color_g);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr10;

				when multBarycentricsAndAttr10 =>
					unpackedVertex1.ty <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ1);
					FPU_B <= std_logic_vector(unpackedVertex1.color_g);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr11;

				when multBarycentricsAndAttr11 =>
					unpackedVertex2.ty <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ2);
					FPU_B <= std_logic_vector(unpackedVertex2.color_g);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr12;

				when multBarycentricsAndAttr12 =>
					unpackedVertex0.color_r <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ0);
					FPU_B <= std_logic_vector(unpackedVertex0.color_b);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr13;

				when multBarycentricsAndAttr13 =>
					unpackedVertex1.color_r <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ1);
					FPU_B <= std_logic_vector(unpackedVertex1.color_b);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr14;

				when multBarycentricsAndAttr14 =>
					unpackedVertex2.color_r <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ2);
					FPU_B <= std_logic_vector(unpackedVertex2.color_b);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr15;

				when multBarycentricsAndAttr15 =>
					unpackedVertex0.color_g <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ0);
					FPU_B <= std_logic_vector(unpackedVertex0.color_a);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr16;

				when multBarycentricsAndAttr16 =>
					unpackedVertex1.color_g <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ1);
					FPU_B <= std_logic_vector(unpackedVertex1.color_a);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr17;

				when multBarycentricsAndAttr17 =>
					unpackedVertex2.color_g <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricDivZ2);
					FPU_B <= std_logic_vector(unpackedVertex2.color_a);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr18;

				when multBarycentricsAndAttr18 =>
					unpackedVertex0.color_b <= unsigned(FPU_OUT);

					FPU_IMUL_GO <= '0';
					currentState <= multBarycentricsAndAttr19;

				when multBarycentricsAndAttr19 =>
					unpackedVertex1.color_b <= unsigned(FPU_OUT);
					currentState <= multBarycentricsAndAttr20;

				when multBarycentricsAndAttr20 =>
					unpackedVertex2.color_b <= unsigned(FPU_OUT);
					currentState <= multBarycentricsAndAttr21;

				when multBarycentricsAndAttr21 =>
					unpackedVertex0.color_a <= unsigned(FPU_OUT);
					currentState <= multBarycentricsAndAttr22;

				when multBarycentricsAndAttr22 =>
					unpackedVertex1.color_a <= unsigned(FPU_OUT);
					currentState <= multBarycentricsAndAttr23;

				when multBarycentricsAndAttr23 =>
					unpackedVertex2.color_a <= unsigned(FPU_OUT);
					currentState <= addDotProductTerms0;

				when addDotProductTerms0 =>
					FPU_A <= std_logic_vector(unpackedVertex0.tx);
					FPU_B <= std_logic_vector(unpackedVertex1.tx);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms1;

				when addDotProductTerms1 =>
					FPU_A <= std_logic_vector(unpackedVertex0.ty);
					FPU_B <= std_logic_vector(unpackedVertex1.ty);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms2;

				when addDotProductTerms2 =>
					FPU_A <= std_logic_vector(unpackedVertex0.color_r);
					FPU_B <= std_logic_vector(unpackedVertex1.color_r);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms3;

				when addDotProductTerms3 =>
					FPU_A <= std_logic_vector(unpackedVertex0.color_g);
					FPU_B <= std_logic_vector(unpackedVertex1.color_g);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms4;

				when addDotProductTerms4 =>
					FPU_A <= std_logic_vector(unpackedVertex0.color_b);
					FPU_B <= std_logic_vector(unpackedVertex1.color_b);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms5;

				when addDotProductTerms5 =>
					dotProductTemporarySumTX <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(unpackedVertex0.color_a);
					FPU_B <= std_logic_vector(unpackedVertex1.color_a);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms6;

				when addDotProductTerms6 =>
					dotProductTemporarySumTY <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumTX);
					FPU_B <= std_logic_vector(unpackedVertex2.tx);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms7;

				when addDotProductTerms7 =>
					dotProductTemporarySumColorR <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumTY);
					FPU_B <= std_logic_vector(unpackedVertex2.ty);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms8;

				when addDotProductTerms8 =>
					dotProductTemporarySumColorG <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumColorR);
					FPU_B <= std_logic_vector(unpackedVertex2.color_r);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms9;

				when addDotProductTerms9 =>
					dotProductTemporarySumColorB <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumColorG);
					FPU_B <= std_logic_vector(unpackedVertex2.color_g);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms10;

				when addDotProductTerms10 =>
					dotProductTemporarySumColorA <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumColorB);
					FPU_B <= std_logic_vector(unpackedVertex2.color_b);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms11;

				when addDotProductTerms11 =>
					dotProductTemporarySumTX <= unsigned(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumColorA);
					FPU_B <= std_logic_vector(unpackedVertex2.color_a);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms12;

				when addDotProductTerms12 =>
					dotProductTemporarySumTY <= unsigned(FPU_OUT);

					FPU_IADD_GO <= '0';
					currentState <= addDotProductTerms13;

				when addDotProductTerms13 =>
					dotProductTemporarySumColorR <= unsigned(FPU_OUT);
					currentState <= addDotProductTerms14;

				when addDotProductTerms14 =>
					dotProductTemporarySumColorG <= unsigned(FPU_OUT);
					currentState <= addDotProductTerms15;

				when addDotProductTerms15 =>
					dotProductTemporarySumColorB <= unsigned(FPU_OUT);
					currentState <= addDotProductTerms16;

				when addDotProductTerms16 =>
					dotProductTemporarySumColorA <= unsigned(FPU_OUT);
					currentState <= multiplyPixelDepth0;

				when multiplyPixelDepth0 =>
					FPU_A <= std_logic_vector(dotProductTemporarySumTX);
					FPU_B <= std_logic_vector(pixelDepth);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelDepth1;

				when multiplyPixelDepth1 =>
					FPU_A <= std_logic_vector(dotProductTemporarySumTY);
					FPU_B <= std_logic_vector(pixelDepth);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelDepth2;

				when multiplyPixelDepth2 =>
					FPU_A <= std_logic_vector(dotProductTemporarySumColorR);
					FPU_B <= std_logic_vector(pixelDepth);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelDepth3;

				when multiplyPixelDepth3=>
					FPU_A <= std_logic_vector(dotProductTemporarySumColorG);
					FPU_B <= std_logic_vector(pixelDepth);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelDepth4;

				when multiplyPixelDepth4 =>
					FPU_A <= std_logic_vector(dotProductTemporarySumColorB);
					FPU_B <= std_logic_vector(pixelDepth);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelDepth5;

				when multiplyPixelDepth5 =>
					FPU_A <= std_logic_vector(dotProductTemporarySumColorA);
					FPU_B <= std_logic_vector(pixelDepth);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelDepth6;

				when multiplyPixelDepth6 =>
					unpackedVertex0.tx <= unsigned(FPU_OUT);
					FPU_IMUL_GO <= '0';
					currentState <= multiplyPixelDepth7;

				when multiplyPixelDepth7 =>
					unpackedVertex0.ty <= unsigned(FPU_OUT);
					currentState <= multiplyPixelDepth8;

				when multiplyPixelDepth8 =>
					unpackedVertex0.color_r <= unsigned(FPU_OUT);
					currentState <= multiplyPixelDepth9;

				when multiplyPixelDepth9 =>
					unpackedVertex0.color_g <= unsigned(FPU_OUT);
					currentState <= multiplyPixelDepth10;

				when multiplyPixelDepth10 =>
					unpackedVertex0.color_b <= unsigned(FPU_OUT);
					currentState <= multiplyPixelDepth11;

				when multiplyPixelDepth11 =>
					unpackedVertex0.color_a <= unsigned(FPU_OUT);
					currentState <= compressOutput0;

				when compressOutput0 =>
					FPU_A <= std_logic_vector(unpackedVertex0.tx);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_Frc), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= compressOutput1;

				when compressOutput1 =>
					FPU_A <= std_logic_vector(unpackedVertex0.ty);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_Frc), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= compressOutput2;

				when compressOutput2 =>
					FPU_A <= std_logic_vector(SaturateFloat(unpackedVertex0.color_r) );
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM8), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= compressOutput3;

				when compressOutput3 =>
					FPU_A <= std_logic_vector(SaturateFloat(unpackedVertex0.color_g) );
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM8), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= compressOutput4;

				when compressOutput4 =>
					wrappedTexcoordTX <= unsigned(FPU_OUT);
					FPU_A <= std_logic_vector(SaturateFloat(unpackedVertex0.color_b) );
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM8), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= compressOutput5;

				when compressOutput5 =>
					wrappedTexcoordTY <= unsigned(FPU_OUT);
					FPU_A <= std_logic_vector(SaturateFloat(unpackedVertex0.color_a) );
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM8), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= compressOutput6;

				when compressOutput6 =>
					compressedOutPixelDataColorR <= unsigned(FPU_OUT(7 downto 0) );
					FPU_A <= std_logic_vector(wrappedTexcoordTX);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_To_UNORM16), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= compressOutput7;

				when compressOutput7 =>
					compressedOutPixelDataColorG <= unsigned(FPU_OUT(7 downto 0) );
					FPU_A <= std_logic_vector(wrappedTexcoordTY);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_To_UNORM16), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= compressOutput8;

				when compressOutput8 =>
					compressedOutPixelDataColorB <= unsigned(FPU_OUT(7 downto 0) );
					FPU_ICNV_GO <= '0';
					currentState <= compressOutput9;

				when compressOutput9 =>
					compressedOutPixelDataColorA <= unsigned(FPU_OUT(7 downto 0) );
					currentState <= compressOutput10;

				when compressOutput10 =>
					compressedOutPixelDataTX <= unsigned(FPU_OUT(15 downto 0) );
					currentState <= compressOutput11;

				when compressOutput11 =>
					compressedOutPixelDataTY <= unsigned(FPU_OUT(15 downto 0) );
					currentState <= waitingForWrite;

				when waitingForWrite =>
					if (TEXSAMP_readyForWrite = '1') then
						TEXSAMP_writeIsValid <= '1'; -- Strobe the write request

						TEXSAMP_outInterpolatedTexcoordX <= std_logic_vector(compressedOutPixelDataTX);
						TEXSAMP_outInterpolatedTexcoordY <= std_logic_vector(compressedOutPixelDataTY);

						TEXSAMP_outInterpolatedColorRGBA <= std_logic_vector(compressedOutPixelDataColorA & compressedOutPixelDataColorB & compressedOutPixelDataColorG & compressedOutPixelDataColorR);

						TEXSAMP_outPixelX <= std_logic_vector(storedPixelX);
						TEXSAMP_outPixelY <= std_logic_vector(storedPixelY);
						currentState <= waitingForRead;
					end if;

			end case;
		end if;
	end process;

end Behavioral;
