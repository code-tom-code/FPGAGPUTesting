library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;
use work.PixelPipeline_Types.all;
use work.PacketType.all;
use work.AttrInterpolatorState.all;

entity AttrInterpolator is
	Port ( clk : in STD_LOGIC;

	-- Depth Interpolator interface begin
		DINTERP_ReadyForNewPixel : out STD_LOGIC := '0';
		DINTERP_NewPixelValid : in STD_LOGIC;
		DINTERP_PosX : in STD_LOGIC_VECTOR(15 downto 0);
		DINTERP_PosY : in STD_LOGIC_VECTOR(15 downto 0);
		DINTERP_TX0 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_TX10 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_TX20 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_TY0 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_TY10 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_TY20 : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_VC0 : in STD_LOGIC_VECTOR(127 downto 0);
		DINTERP_VC10 : in STD_LOGIC_VECTOR(127 downto 0);
		DINTERP_VC20 : in STD_LOGIC_VECTOR(127 downto 0);
		DINTERP_NormalizedBarycentricB : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_NormalizedBarycentricC : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_OutPixelW : in STD_LOGIC_VECTOR(31 downto 0);
	-- Depth Interpolator interface end

	-- FPU interfaces begin
		FPU_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Mode : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		FPU_ISHFT_GO : out STD_LOGIC := '0'; -- Unused
		FPU_IMUL_GO : out STD_LOGIC := '0';
		FPU_IADD_GO : out STD_LOGIC := '0';
		FPU_ICMP_GO : out STD_LOGIC := '0'; -- Unused
		FPU_ICNV_GO : out STD_LOGIC := '0';
		FPU_ISPEC_GO : out STD_LOGIC := '0'; -- Unused
		FPU_IBIT_GO : out STD_LOGIC := '0'; -- Unused
		FPU_OUT : in STD_LOGIC_VECTOR(31 downto 0);
	-- FPU interfaces end

	-- Texture Sampler FIFO interface begin
		TEXSAMP_OutFIFO_wr_data : out STD_LOGIC_VECTOR(95 downto 0) := (others => '0'); -- 12 bytes per pixel of output data to the texture sampler
        TEXSAMP_OutFIFO_full : in STD_LOGIC;
        TEXSAMP_OutFIFO_wr_en : out STD_LOGIC := '0';
	-- Texture Sampler FIFO interface end

	-- Attribute Interpolator State Block interface begin
		STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR(ATTR_INTERPOLATOR_STATE_SIZE_BITS-1 downto 0);
		STATE_NextDrawID : in STD_LOGIC_VECTOR(15 downto 0);
		STATE_StateIsValid : in STD_LOGIC;
		STATE_ConsumeStateSlot : out STD_LOGIC := '0';
	-- Attribute Interpolator State Block interface end

	-- Command Processor interface begin
		CMD_IsIdle : out STD_LOGIC := '0';
	-- Command Processor interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_AttrInterpolator_State : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
		DBG_RastBarycentricB : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RastBarycentricC : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
		);
end AttrInterpolator;

architecture Behavioral of AttrInterpolator is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

ATTRIBUTE X_INTERFACE_INFO of TEXSAMP_OutFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of TEXSAMP_OutFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of TEXSAMP_OutFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TEXSAMP_OUT_FIFO FULL";

constant flatshading : STD_LOGIC := '0';

type attrInterpStateType is 
(
	waitingForRead, -- 0

	multBarycentricsAndAttr0, -- 1
	multBarycentricsAndAttr1, -- 2
	multBarycentricsAndAttr2, -- 3
	multBarycentricsAndAttr3, -- 4
	multBarycentricsAndAttr4, -- 5
	multBarycentricsAndAttr5, -- 6
	multBarycentricsAndAttr6, -- 7
	multBarycentricsAndAttr7, -- 8
	multBarycentricsAndAttr8, -- 9
	multBarycentricsAndAttr9, -- 10
	multBarycentricsAndAttr10, -- 11
	multBarycentricsAndAttr11, -- 12
	multBarycentricsAndAttr12, -- 13
	multBarycentricsAndAttr13, -- 14
	multBarycentricsAndAttr14, -- 15
	multBarycentricsAndAttr15, -- 16
	multBarycentricsAndAttr16, -- 17
	multBarycentricsAndAttr17, -- 18

	addDotProductTerms0, -- 19
	addDotProductTerms1, -- 20
	addDotProductTerms2, -- 21
	addDotProductTerms3, -- 22
	addDotProductTerms4, -- 23
	addDotProductTerms5, -- 24
	addDotProductTerms6, -- 25
	addDotProductTerms7, -- 26
	addDotProductTerms8, -- 27
	addDotProductTerms9, -- 28
	addDotProductTerms10, -- 29
	addDotProductTerms11, -- 30
	addDotProductTerms12, -- 31
	addDotProductTerms13, -- 32
	addDotProductTerms14, -- 33
	addDotProductTerms15, -- 34
	addDotProductTerms16, -- 35

	multiplyPixelW0, -- 36
	multiplyPixelW1, -- 37
	multiplyPixelW2, -- 38
	multiplyPixelW3, -- 39
	multiplyPixelW4, -- 40
	multiplyPixelW5, -- 41
	multiplyPixelW6, -- 42
	multiplyPixelW7, -- 43
	multiplyPixelW8, -- 44
	multiplyPixelW9, -- 45
	multiplyPixelW10, -- 46
	multiplyPixelW11, -- 47

	compressOutput0, -- 48
	compressOutput1, -- 49
	compressOutput2, -- 50
	compressOutput3, -- 51
	compressOutput4, -- 52
	compressOutput5, -- 53
	compressOutput6, -- 54
	compressOutput7, -- 55
	compressOutput8, -- 56
	compressOutput9, -- 57
	compressOutput10, -- 58
	compressOutput11, -- 59

	waitingForWrite -- 60
);

type VertexFloatData is record
	tx : f32;
	ty : f32;

	color_r : f32;
	color_g : f32;
	color_b : f32;
	color_a : f32;
end record VertexFloatData;

constant DefaultVertexFloatData : VertexFloatData := (others => (others => '0') );

signal readyForNewPixel : std_logic := '0';

signal currentState : attrInterpStateType := waitingForRead;

signal storedPixelX : unsigned(15 downto 0) := (others => '0');
signal storedPixelY : unsigned(15 downto 0) := (others => '0');
signal currentDrawEventID : unsigned(15 downto 0) := (others => '0');

signal pixelW : f32 := (others => '0'); -- float32 format (0.0f to 1.0f) pixel W value
signal normalizedBarycentricB : f32 := (others => '0'); -- float32 format
signal normalizedBarycentricC : f32 := (others => '0'); -- float32 format
signal useFlatShading : std_logic := '0';
signal texcoord0AddressingModeU : eTexcoordAddressingMode := TAM_Wrap; -- Default to wrap mode.
signal texcoord0AddressingModeV : eTexcoordAddressingMode := TAM_Wrap; -- Default to wrap mode.

signal unpackedVertex0 : VertexFloatData := DefaultVertexFloatData;
signal unpackedVertex10 : VertexFloatData := DefaultVertexFloatData;
signal unpackedVertex20 : VertexFloatData := DefaultVertexFloatData;

signal dotProductTemporarySumTX : f32 := (others => '0');
signal dotProductTemporarySumTY : f32 := (others => '0');
signal dotProductTemporarySumColorR : f32 := (others => '0');
signal dotProductTemporarySumColorG : f32 := (others => '0');
signal dotProductTemporarySumColorB : f32 := (others => '0');
signal dotProductTemporarySumColorA : f32 := (others => '0');

signal wrappedTexcoordTX : f32 := (others => '0');
signal wrappedTexcoordTY : f32 := (others => '0');
signal compressedOutPixelDataTX : unsigned(15 downto 0) := (others => '0');
signal compressedOutPixelDataTY : unsigned(15 downto 0) := (others => '0');
signal compressedOutPixelDataColorR : unsigned(7 downto 0) := (others => '0');
signal compressedOutPixelDataColorG : unsigned(7 downto 0) := (others => '0');
signal compressedOutPixelDataColorB : unsigned(7 downto 0) := (others => '0');
signal compressedOutPixelDataColorA : unsigned(7 downto 0) := (others => '0');

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

pure function SaturateFloat(inFloat : f32) return f32 is
begin
	if (inFloat(31) = '1') then
		return X"00000000";
	elsif (inFloat(30 downto 0) > "111111100000000000000000000000") then
		return X"3F800000";
	else
		return inFloat;
	end if;
end function;

pure function PackOutputData(pixelX : unsigned(15 downto 0); pixelY : unsigned(15 downto 0); texcoordX : unsigned(15 downto 0); texcoordY : unsigned(15 downto 0); colorR : unsigned(7 downto 0); colorG : unsigned(7 downto 0); colorB : unsigned(7 downto 0); colorA : unsigned(7 downto 0) ) return unsigned is
begin
	return colorA & colorB & colorG & colorR & texcoordY & texcoordX & pixelY & pixelX;
end function;

begin

DINTERP_ReadyForNewPixel <= readyForNewPixel;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);

DBG_AttrInterpolator_State <= std_logic_vector(to_unsigned(attrInterpStateType'pos(currentState), 7) );
DBG_RastBarycentricB <= std_logic_vector(normalizedBarycentricB);
DBG_RastBarycentricC <= std_logic_vector(normalizedBarycentricC);

	process(clk)
	begin
		if (rising_edge(clk) ) then
			STAT_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);
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
			CMD_IsIdle <= '0';
			STATE_ConsumeStateSlot <= '0';

			case currentState is
				when waitingForRead =>
					readyForNewPixel <= '0';

					storedPixelX <= unsigned(DINTERP_PosX);
					storedPixelY <= unsigned(DINTERP_PosY);
					unpackedVertex0.tx <= f32(DINTERP_TX0);
					unpackedVertex0.ty <= f32(DINTERP_TY0);
					unpackedVertex10.tx <= f32(DINTERP_TX10);
					unpackedVertex10.ty <= f32(DINTERP_TY10);
					unpackedVertex20.tx <= f32(DINTERP_TX20);
					unpackedVertex20.ty <= f32(DINTERP_TY20);
					unpackedVertex0.color_r <= f32(DINTERP_VC0(31 downto 0) );
					unpackedVertex0.color_g <= f32(DINTERP_VC0(63 downto 32) );
					unpackedVertex0.color_b <= f32(DINTERP_VC0(95 downto 64) );
					unpackedVertex0.color_a <= f32(DINTERP_VC0(127 downto 96) );
					unpackedVertex10.color_r <= f32(DINTERP_VC10(31 downto 0) );
					unpackedVertex10.color_g <= f32(DINTERP_VC10(63 downto 32) );
					unpackedVertex10.color_b <= f32(DINTERP_VC10(95 downto 64) );
					unpackedVertex10.color_a <= f32(DINTERP_VC10(127 downto 96) );
					unpackedVertex20.color_r <= f32(DINTERP_VC20(31 downto 0) );
					unpackedVertex20.color_g <= f32(DINTERP_VC20(63 downto 32) );
					unpackedVertex20.color_b <= f32(DINTERP_VC20(95 downto 64) );
					unpackedVertex20.color_a <= f32(DINTERP_VC20(127 downto 96) );
					normalizedBarycentricB <= f32(DINTERP_NormalizedBarycentricB);
					normalizedBarycentricC <= f32(DINTERP_NormalizedBarycentricC);
					pixelW <= f32(DINTERP_OutPixelW);

					TEXSAMP_OutFIFO_wr_en <= '0'; -- Deassert after one clock cycle

					if (STATE_StateIsValid = '1' and currentDrawEventID = unsigned(STATE_NextDrawID) ) then
						STATE_ConsumeStateSlot <= '1';

						useFlatShading <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).UseFlatShadingColors;
						texcoord0AddressingModeU <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).Texcoord0AddressingModeU;
						texcoord0AddressingModeV <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).Texcoord0AddressingModeV;
					elsif (DINTERP_NewPixelValid = '1' and readyForNewPixel = '1') then
						readyForNewPixel <= '0';

						if (IsSpecialPixelMessage(unsigned(DINTERP_PosX) ) ) then
							if (DINTERP_PosX(eSpecialPixelCodeBits'pos(SetNewDrawEventID) ) = '1') then
								currentDrawEventID <= unsigned(DINTERP_PosY);
								currentState <= waitingForWrite;
							end if;
							if (DINTERP_PosX(eSpecialPixelCodeBits'pos(TerminateCurrentDrawEventID) ) = '1') then
								currentState <= waitingForWrite;
							end if;
						else
							if (useFlatShading = '1') then -- If we're doing flat shading then we should skip all of this interpolation math
								currentState <= compressOutput0;
							else
								currentState <= multBarycentricsAndAttr0;
							end if;
						end if;
					else
						if (readyForNewPixel = '1') then
							CMD_IsIdle <= '1';
						end if;

						readyForNewPixel <= '1';
					end if;

				when multBarycentricsAndAttr0 =>
					FPU_A <= std_logic_vector(normalizedBarycentricB);
					FPU_B <= std_logic_vector(unpackedVertex10.tx);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr1;

				when multBarycentricsAndAttr1 =>
					FPU_A <= std_logic_vector(normalizedBarycentricB);
					FPU_B <= std_logic_vector(unpackedVertex10.ty);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr2;

				when multBarycentricsAndAttr2 =>
					FPU_A <= std_logic_vector(normalizedBarycentricB);
					FPU_B <= std_logic_vector(unpackedVertex10.color_r);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr3;

				when multBarycentricsAndAttr3 =>
					FPU_A <= std_logic_vector(normalizedBarycentricB);
					FPU_B <= std_logic_vector(unpackedVertex10.color_g);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr4;

				when multBarycentricsAndAttr4 =>
					FPU_A <= std_logic_vector(normalizedBarycentricB);
					FPU_B <= std_logic_vector(unpackedVertex10.color_b);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr5;

				when multBarycentricsAndAttr5 =>
					FPU_A <= std_logic_vector(normalizedBarycentricB);
					FPU_B <= std_logic_vector(unpackedVertex10.color_a);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr6;

				when multBarycentricsAndAttr6 =>
					unpackedVertex10.tx <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricC);
					FPU_B <= std_logic_vector(unpackedVertex20.tx);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr7;

				when multBarycentricsAndAttr7 =>
					unpackedVertex10.ty <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricC);
					FPU_B <= std_logic_vector(unpackedVertex20.ty);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr8;

				when multBarycentricsAndAttr8 =>
					unpackedVertex10.color_r <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricC);
					FPU_B <= std_logic_vector(unpackedVertex20.color_r);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr9;

				when multBarycentricsAndAttr9 =>
					unpackedVertex10.color_g <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricC);
					FPU_B <= std_logic_vector(unpackedVertex20.color_g);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr10;

				when multBarycentricsAndAttr10 =>
					unpackedVertex10.color_b <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricC);
					FPU_B <= std_logic_vector(unpackedVertex20.color_b);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr11;

				when multBarycentricsAndAttr11 =>
					unpackedVertex10.color_a <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(normalizedBarycentricC);
					FPU_B <= std_logic_vector(unpackedVertex20.color_a);
					FPU_IMUL_GO <= '1';
					currentState <= multBarycentricsAndAttr12;

				when multBarycentricsAndAttr12 =>
					unpackedVertex20.tx <= f32(FPU_OUT);

					FPU_IMUL_GO <= '0';
					currentState <= multBarycentricsAndAttr13;

				when multBarycentricsAndAttr13 =>
					unpackedVertex20.ty <= f32(FPU_OUT);
					currentState <= multBarycentricsAndAttr14;

				when multBarycentricsAndAttr14 =>
					unpackedVertex20.color_r <= f32(FPU_OUT);
					currentState <= multBarycentricsAndAttr15;

				when multBarycentricsAndAttr15 =>
					unpackedVertex20.color_g <= f32(FPU_OUT);
					currentState <= multBarycentricsAndAttr16;

				when multBarycentricsAndAttr16 =>
					unpackedVertex20.color_b <= f32(FPU_OUT);
					currentState <= multBarycentricsAndAttr17;

				when multBarycentricsAndAttr17 =>
					unpackedVertex20.color_a <= f32(FPU_OUT);
					currentState <= addDotProductTerms0;

				when addDotProductTerms0 =>
					FPU_A <= std_logic_vector(unpackedVertex10.tx);
					FPU_B <= std_logic_vector(unpackedVertex20.tx);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms1;

				when addDotProductTerms1 =>
					FPU_A <= std_logic_vector(unpackedVertex10.ty);
					FPU_B <= std_logic_vector(unpackedVertex20.ty);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms2;

				when addDotProductTerms2 =>
					FPU_A <= std_logic_vector(unpackedVertex10.color_r);
					FPU_B <= std_logic_vector(unpackedVertex20.color_r);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms3;

				when addDotProductTerms3 =>
					FPU_A <= std_logic_vector(unpackedVertex10.color_g);
					FPU_B <= std_logic_vector(unpackedVertex20.color_g);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms4;

				when addDotProductTerms4 =>
					FPU_A <= std_logic_vector(unpackedVertex10.color_b);
					FPU_B <= std_logic_vector(unpackedVertex20.color_b);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms5;

				when addDotProductTerms5 =>
					dotProductTemporarySumTX <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(unpackedVertex10.color_a);
					FPU_B <= std_logic_vector(unpackedVertex20.color_a);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms6;

				when addDotProductTerms6 =>
					dotProductTemporarySumTY <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumTX);
					FPU_B <= std_logic_vector(unpackedVertex0.tx);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms7;

				when addDotProductTerms7 =>
					dotProductTemporarySumColorR <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumTY);
					FPU_B <= std_logic_vector(unpackedVertex0.ty);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms8;

				when addDotProductTerms8 =>
					dotProductTemporarySumColorG <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumColorR);
					FPU_B <= std_logic_vector(unpackedVertex0.color_r);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms9;

				when addDotProductTerms9 =>
					dotProductTemporarySumColorB <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumColorG);
					FPU_B <= std_logic_vector(unpackedVertex0.color_g);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms10;

				when addDotProductTerms10 =>
					dotProductTemporarySumColorA <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumColorB);
					FPU_B <= std_logic_vector(unpackedVertex0.color_b);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms11;

				when addDotProductTerms11 =>
					dotProductTemporarySumTX <= f32(FPU_OUT);

					FPU_A <= std_logic_vector(dotProductTemporarySumColorA);
					FPU_B <= std_logic_vector(unpackedVertex0.color_a);
					FPU_IADD_GO <= '1';
					currentState <= addDotProductTerms12;

				when addDotProductTerms12 =>
					dotProductTemporarySumTY <= f32(FPU_OUT);

					FPU_IADD_GO <= '0';
					currentState <= addDotProductTerms13;

				when addDotProductTerms13 =>
					dotProductTemporarySumColorR <= f32(FPU_OUT);
					currentState <= addDotProductTerms14;

				when addDotProductTerms14 =>
					dotProductTemporarySumColorG <= f32(FPU_OUT);
					currentState <= addDotProductTerms15;

				when addDotProductTerms15 =>
					dotProductTemporarySumColorB <= f32(FPU_OUT);
					currentState <= addDotProductTerms16;

				when addDotProductTerms16 =>
					dotProductTemporarySumColorA <= f32(FPU_OUT);
					currentState <= multiplyPixelW0;

				when multiplyPixelW0 =>
					FPU_A <= std_logic_vector(dotProductTemporarySumTX);
					FPU_B <= std_logic_vector(pixelW);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelW1;

				when multiplyPixelW1 =>
					FPU_A <= std_logic_vector(dotProductTemporarySumTY);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelW2;

				when multiplyPixelW2 =>
					FPU_A <= std_logic_vector(dotProductTemporarySumColorR);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelW3;

				when multiplyPixelW3=>
					FPU_A <= std_logic_vector(dotProductTemporarySumColorG);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelW4;

				when multiplyPixelW4 =>
					FPU_A <= std_logic_vector(dotProductTemporarySumColorB);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelW5;

				when multiplyPixelW5 =>
					FPU_A <= std_logic_vector(dotProductTemporarySumColorA);
					FPU_IMUL_GO <= '1';
					currentState <= multiplyPixelW6;

				when multiplyPixelW6 =>
					unpackedVertex0.tx <= f32(FPU_OUT);
					FPU_IMUL_GO <= '0';
					currentState <= multiplyPixelW7;

				when multiplyPixelW7 =>
					unpackedVertex0.ty <= f32(FPU_OUT);
					currentState <= multiplyPixelW8;

				when multiplyPixelW8 =>
					unpackedVertex0.color_r <= f32(FPU_OUT);
					currentState <= multiplyPixelW9;

				when multiplyPixelW9 =>
					unpackedVertex0.color_g <= f32(FPU_OUT);
					currentState <= multiplyPixelW10;

				when multiplyPixelW10 =>
					unpackedVertex0.color_b <= f32(FPU_OUT);
					currentState <= multiplyPixelW11;

				when multiplyPixelW11 =>
					unpackedVertex0.color_a <= f32(FPU_OUT);
					if (texcoord0AddressingModeU = TAM_Clamp) then
						wrappedTexcoordTX <= SaturateFloat(unpackedVertex0.tx);
					end if;

					if (texcoord0AddressingModeV = TAM_Clamp) then
						wrappedTexcoordTY <= SaturateFloat(unpackedVertex0.ty);
					end if;

					if (texcoord0AddressingModeU = TAM_Clamp and texcoord0AddressingModeV = TAM_Clamp) then
						currentState <= compressOutput2;
					else
						currentState <= compressOutput0;
					end if;

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
					if (texcoord0AddressingModeU = TAM_Wrap) then
						wrappedTexcoordTX <= f32(FPU_OUT);
					end if;
					FPU_A <= std_logic_vector(SaturateFloat(unpackedVertex0.color_b) );
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM8), 3) );
					FPU_ICNV_GO <= '1';
					currentState <= compressOutput5;

				when compressOutput5 =>
					if (texcoord0AddressingModeV = TAM_Wrap) then
						wrappedTexcoordTY <= f32(FPU_OUT);
					end if;
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
					if (TEXSAMP_OutFIFO_full = '0') then
						TEXSAMP_OutFIFO_wr_data <= std_logic_vector(PackOutputData(storedPixelX, storedPixelY, compressedOutPixelDataTX, compressedOutPixelDataTY, 
							compressedOutPixelDataColorR, compressedOutPixelDataColorG, compressedOutPixelDataColorB, compressedOutPixelDataColorA) );

						TEXSAMP_OutFIFO_wr_en <= '1'; -- Strobe the write request

						currentState <= waitingForRead;
					else
						TEXSAMP_OutFIFO_wr_en <= '0';
					end if;

			end case;
		end if;
	end process;

end Behavioral;