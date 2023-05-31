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
	Generic ( MAX_OCCUPANCY : positive := 8
	);
	Port ( clk : in STD_LOGIC;

	-- Depth Interpolator FIFO interface begin
		DINTERP_FIFO_rd_data : in STD_LOGIC_VECTOR(INTERPOLATOR_DATA_BITS-1 downto 0);
        DINTERP_FIFO_empty : in STD_LOGIC;
        DINTERP_FIFO_rd_en : out STD_LOGIC := '0';
	-- Depth Interpolator FIFO interface end

	-- Triangle Cache interfaces begin
		TRICACHE_inT0X : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT0Y : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT10X : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT10Y : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT20X : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT20Y : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inColorRGBA0 : in STD_LOGIC_VECTOR(127 downto 0);
		TRICACHE_inColorRGBA10 : in STD_LOGIC_VECTOR(127 downto 0);
		TRICACHE_inColorRGBA20 : in STD_LOGIC_VECTOR(127 downto 0);

		TRICACHE_PopTriangleSlot : out STD_LOGIC := '0';
	-- Triangle Cache interfaces end

	-- FPU interfaces begin
		-- MUL pipe for multiplication:
		FPU_MUL_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_MUL_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_MUL_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_MUL_GO : out STD_LOGIC := '0';

		-- First CNV pipe for float-to-int conversions and frac():
		FPU_CNV0_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_CNV0_Mode : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		FPU_CNV0_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_CNV0_GO : out STD_LOGIC := '0';

		-- Second CNV pipe for float-to-int conversions and frac():
		FPU_CNV1_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_CNV1_Mode : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		FPU_CNV1_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_CNV1_GO : out STD_LOGIC := '0';
	-- FPU interfaces end

	-- Texture Sampler FIFO interface begin
		TEXSAMP_OutFIFO_wr_data : out STD_LOGIC_VECTOR(95 downto 0) := (others => '0'); -- 12 bytes per pixel of output data to the texture sampler
        TEXSAMP_OutFIFO_full : in STD_LOGIC;
        TEXSAMP_OutFIFO_wr_en : out STD_LOGIC := '0';
		TEXSAMP_OutFIFO_almost_full : in STD_LOGIC; -- Don't dispatch any more waves if our output FIFO is almost full - that means it wouldn't be able to hold their data!
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
		DBG_AttrInterpolator_State : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DBG_InterpolatorDriver_State : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DBG_MultiplierDriver_State : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DBG_ConverterDriver_State : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DBG_OutputDriver_State : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DBG_PixelWFIFO : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
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

ATTRIBUTE X_INTERFACE_INFO of DINTERP_FIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of DINTERP_FIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of DINTERP_FIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ATTR_FIFO EMPTY";

constant flatshading : STD_LOGIC := '0';

type attrInterpStateType is 
(
	waitingForRead, -- 0

	dispatchNewPixel, -- 1
	dispatchNewSpecialMessage, -- 2
	waitingForWrite, -- 3
	setNewPrimitive, -- 4
	terminateCurrentPrimitive -- 5
);

type VertexFloatData is record
	tx : f32;
	ty : f32;

	color_r : f32;
	color_g : f32;
	color_b : f32;
	color_a : f32;
end record VertexFloatData;

COMPONENT FloatALU_Interpolator
	Port (clk : in STD_LOGIC;

		IN_B : in STD_LOGIC_VECTOR(31 downto 0);
		IN_C : in STD_LOGIC_VECTOR(31 downto 0);
		IN_Attr0 : in STD_LOGIC_VECTOR(31 downto 0);
		IN_Attr10 : in STD_LOGIC_VECTOR(31 downto 0);
		IN_Attr20 : in STD_LOGIC_VECTOR(31 downto 0);

		OINTERP : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		-- INTERP pipe operates in 5+4+4=13 clock cycles.
		IINTERP_GO : in STD_LOGIC
		);
end component;

COMPONENT SimpleFIFO
	Generic ( FIFO_Depth : positive := 4;
			FIFO_Bit_Width : positive := 16
	);
	Port ( clk : in STD_LOGIC;

		FIFO_NextElementDataRd : out STD_LOGIC_VECTOR(FIFO_Bit_Width-1 downto 0) := (others => '0');
		FIFO_IsEmpty : out STD_LOGIC := '1';
		FIFO_PopLastElement : in STD_LOGIC;

		FIFO_IsFull : out STD_LOGIC := '0';
		FIFO_NewElementDataWr : in STD_LOGIC_VECTOR(FIFO_Bit_Width-1 downto 0);
		FIFO_PushNewElement : in STD_LOGIC
		);
end component;

constant DefaultVertexFloatData : VertexFloatData := (others => (others => '0') );

type InterpolatorStateType is
(
	IS_TX, -- 0
	IS_TY, -- 1
	IS_R, -- 2
	IS_G, -- 3
	IS_B, -- 4
	IS_A -- 5
);

signal readyForNewPixel : std_logic := '0';

signal newWaveIsReady : std_logic := '0'; -- Written by the main coordinator process, read by the interpolator driver process
signal interpDriverReadyForNextPixel : std_logic := '0'; -- Written by the interpolator driver process, read by the main coordinator process

signal currentState : attrInterpStateType := waitingForRead;
signal currentInterpolatorState : InterpolatorStateType := IS_TX;
signal currentMultiplierState : InterpolatorStateType := IS_TX;
signal currentConverterState : InterpolatorStateType := IS_TX;
signal currentOutputCollectorState : InterpolatorStateType := IS_TX;

-- Go signals for the various drivers
signal outputCollectorMainProcessGoSignal : std_logic := '0';
signal outputCollectorConverterProcessGoSignal : std_logic := '0';
signal outputCollectorGoSignal : std_logic := '0';

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
signal computedPixelData : VertexFloatData := DefaultVertexFloatData;

signal dotProductTemporarySumTX : f32 := (others => '0');
signal dotProductTemporarySumTY : f32 := (others => '0');
signal dotProductTemporarySumColorR : f32 := (others => '0');
signal dotProductTemporarySumColorG : f32 := (others => '0');
signal dotProductTemporarySumColorB : f32 := (others => '0');
signal dotProductTemporarySumColorA : f32 := (others => '0');

signal clampedTexcoordTX : f32 := (others => '0');
signal clampedTexcoordTY : f32 := (others => '0');
signal compressedOutPixelDataTX : unsigned(15 downto 0) := (others => '0');
signal compressedOutPixelDataColorR : unsigned(7 downto 0) := (others => '0');
signal compressedOutPixelDataColorG : unsigned(7 downto 0) := (others => '0');
signal compressedOutPixelDataColorB : unsigned(7 downto 0) := (others => '0');

signal interpInputB : f32 := (others => '0');
signal interpInputC : f32 := (others => '0');
signal interpInputAttr0 : f32 := (others => '0');
signal interpInputAttr10 : f32 := (others => '0');
signal interpInputAttr20 : f32 := (others => '0');
signal interpGoSignal : std_logic := '0';
signal interpOutput : std_logic_vector(31 downto 0) := (others => '0');

signal newMulWaveIsReady : std_logic_vector(9 downto 0) := (others => '0');
signal mulGoSignal : std_logic := '0';

signal newCnvWaveIsReady : std_logic := '0';
signal cnv0GoSignal : std_logic := '0';
signal cnv1GoSignal : std_logic := '0';

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

-- Idle signals:
signal InterpolatorDriverIsIdle : std_logic := '1';
signal MultiplierDriverIsIdle : std_logic := '1';
signal ConverterDriverIsIdle : std_logic := '1';
signal OutputDriverIsIdle : std_logic := '1';

-- FIFO signals:
signal BarycentricBCFIFO_IsFull : std_logic := '0';
signal BarycentricBCFIFO_IsEmpty : std_logic := '1';
signal BarycentricBCFIFO_PopElement : std_logic := '0';
signal BarycentricBCFIFO_PushElement : std_logic := '0';
signal BarycentricBCFIFO_OutCurrentData : std_logic_vector(63 downto 0) := (others => '0');
signal BarycentricBCFIFO_InNewData : std_logic_vector(63 downto 0) := (others => '0');

signal PixelWFIFO_IsFull : std_logic := '0';
signal PixelWFIFO_IsEmpty : std_logic := '1';
signal PixelWFIFO_PopElement : std_logic := '0';
signal PixelWFIFO_PushElement : std_logic := '0';
signal PixelWFIFO_OutCurrentData : std_logic_vector(31 downto 0) := (others => '0');
signal PixelWFIFO_InNewData : std_logic_vector(31 downto 0) := (others => '0');

signal PixelXYFIFO_IsFull : std_logic := '0';
signal PixelXYFIFO_IsEmpty : std_logic := '1';
signal PixelXYFIFO_PopElement : std_logic := '0';
signal PixelXYFIFO_PushElement : std_logic := '0';
signal PixelXYFIFO_OutCurrentData : std_logic_vector(31 downto 0) := (others => '0');
signal PixelXYFIFO_InNewData : std_logic_vector(31 downto 0) := (others => '0');


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

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);

DBG_AttrInterpolator_State <= std_logic_vector(to_unsigned(attrInterpStateType'pos(currentState), 3) );
DBG_InterpolatorDriver_State <= std_logic_vector(to_unsigned(InterpolatorStateType'pos(currentInterpolatorState), 3) );
DBG_MultiplierDriver_State <= std_logic_vector(to_unsigned(InterpolatorStateType'pos(currentMultiplierState), 3) );
DBG_ConverterDriver_State <= std_logic_vector(to_unsigned(InterpolatorStateType'pos(currentConverterState), 3) );
DBG_OutputDriver_State <= std_logic_vector(to_unsigned(InterpolatorStateType'pos(currentOutputCollectorState), 3) );
DBG_RastBarycentricB <= std_logic_vector(interpInputAttr0);
DBG_RastBarycentricC <= std_logic_vector(interpInputAttr20);
DBG_PixelWFIFO <= PixelWFIFO_OutCurrentData;

Interpolator : FloatALU_Interpolator port map(clk => clk, IN_B => std_logic_vector(interpInputB), IN_C => std_logic_vector(interpInputC), IN_Attr0 => std_logic_vector(interpInputAttr0), IN_Attr10 => std_logic_vector(interpInputAttr10), IN_Attr20 => std_logic_vector(interpInputAttr20), OINTERP => interpOutput, IINTERP_GO => interpGoSignal);
BarycentricBCFIFO : SimpleFIFO generic map(FIFO_Depth => MAX_OCCUPANCY, FIFO_Bit_Width => 64) port map(clk => clk, FIFO_IsEmpty => BarycentricBCFIFO_IsEmpty, FIFO_IsFull => BarycentricBCFIFO_IsFull, FIFO_PushNewElement => BarycentricBCFIFO_PushElement, FIFO_PopLastElement => BarycentricBCFIFO_PopElement, FIFO_NewElementDataWr => BarycentricBCFIFO_InNewData, FIFO_NextElementDataRd => BarycentricBCFIFO_OutCurrentData);
PixelWFIFO : SimpleFIFO generic map(FIFO_Depth => MAX_OCCUPANCY, FIFO_Bit_Width => 32) port map(clk => clk, FIFO_IsEmpty => PixelWFIFO_IsEmpty, FIFO_IsFull => PixelWFIFO_IsFull, FIFO_PushNewElement => PixelWFIFO_PushElement, FIFO_PopLastElement => PixelWFIFO_PopElement, FIFO_NewElementDataWr => PixelWFIFO_InNewData, FIFO_NextElementDataRd => PixelWFIFO_OutCurrentData);
PixelXYFIFO : SimpleFIFO generic map(FIFO_Depth => MAX_OCCUPANCY, FIFO_Bit_Width => 32) port map(clk => clk, FIFO_IsEmpty => PixelXYFIFO_IsEmpty, FIFO_IsFull => PixelXYFIFO_IsFull, FIFO_PushNewElement => PixelXYFIFO_PushElement, FIFO_PopLastElement => PixelXYFIFO_PopElement, FIFO_NewElementDataWr => PixelXYFIFO_InNewData, FIFO_NextElementDataRd => PixelXYFIFO_OutCurrentData);
FPU_MUL_GO <= mulGoSignal;
FPU_CNV0_GO <= cnv0GoSignal;
FPU_CNV1_GO <= cnv1GoSignal;
outputCollectorGoSignal <= outputCollectorConverterProcessGoSignal or outputCollectorMainProcessGoSignal;

	StatsProcess : process(clk)
	begin
		if (rising_edge(clk) ) then
			STAT_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);

			if (currentState = waitingForRead and InterpolatorDriverIsIdle = '1' and MultiplierDriverIsIdle = '1' and
				ConverterDriverIsIdle = '1' and OutputDriverIsIdle = '1') then
				statCyclesIdle <= statCyclesIdle + 1;
			elsif (currentState = waitingForWrite or (currentState = waitingForRead and TEXSAMP_OutFIFO_almost_full = '1') ) then
				statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;
			else
				statCyclesWorking <= statCyclesWorking + 1;
			end if;
		end if;
	end process StatsProcess;

	MainStateMachine : process(clk)
	begin
		if (rising_edge(clk) ) then
			CMD_IsIdle <= '0';
			STATE_ConsumeStateSlot <= '0';
			DINTERP_FIFO_rd_en <= '0';
			newWaveIsReady <= '0';
			TRICACHE_PopTriangleSlot <= '0';
			BarycentricBCFIFO_PushElement <= '0';
			BarycentricBCFIFO_InNewData <= std_logic_vector(DeserializeAttributeData(DINTERP_FIFO_rd_data).NormalizedBarycentricC & DeserializeAttributeData(DINTERP_FIFO_rd_data).NormalizedBarycentricB);
			PixelWFIFO_PushElement <= '0';
			PixelWFIFO_InNewData <= std_logic_vector(DeserializeAttributeData(DINTERP_FIFO_rd_data).InterpolatedPixelW);
			PixelXYFIFO_PushElement <= '0';
			PixelXYFIFO_InNewData <= std_logic_vector(DeserializeAttributeData(DINTERP_FIFO_rd_data).PosY & DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX);
			outputCollectorMainProcessGoSignal <= '0';

			case currentState is
				when waitingForRead =>
					readyForNewPixel <= '0';

					storedPixelX <= DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX;
					storedPixelY <= DeserializeAttributeData(DINTERP_FIFO_rd_data).PosY;
					normalizedBarycentricB <= DeserializeAttributeData(DINTERP_FIFO_rd_data).NormalizedBarycentricB;
					normalizedBarycentricC <= DeserializeAttributeData(DINTERP_FIFO_rd_data).NormalizedBarycentricC;
					pixelW <= DeserializeAttributeData(DINTERP_FIFO_rd_data).InterpolatedPixelW;

					if (STATE_StateIsValid = '1' and currentDrawEventID = unsigned(STATE_NextDrawID) ) then
						if (InterpolatorDriverIsIdle = '1' and MultiplierDriverIsIdle = '1' and ConverterDriverIsIdle = '1' and OutputDriverIsIdle = '1') then -- Wait for a full unit flush before changing state out from under us
							STATE_ConsumeStateSlot <= '1';

							useFlatShading <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).UseFlatShadingColors;
							texcoord0AddressingModeU <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).Texcoord0AddressingModeU;
							texcoord0AddressingModeV <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).Texcoord0AddressingModeV;
						end if;
					elsif (DINTERP_FIFO_empty = '0' and readyForNewPixel = '1' and TEXSAMP_OutFIFO_almost_full = '0'
						and BarycentricBCFIFO_IsFull = '0' and PixelWFIFO_IsFull = '0' and PixelXYFIFO_IsFull = '0' and interpDriverReadyForNextPixel = '1') then
						readyForNewPixel <= '0';

						if (IsSpecialPixelMessage(DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX) ) then
							if (InterpolatorDriverIsIdle = '1' and MultiplierDriverIsIdle = '1' and ConverterDriverIsIdle = '1' and OutputDriverIsIdle = '1') then -- Wait for a full unit flush before reloading triangle data out from under us
								DINTERP_FIFO_rd_en <= '1';

								if (DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX(eSpecialPixelCodeBits'pos(SetNewDrawEventID) ) = '1') then
									currentDrawEventID <= unsigned(DeserializeAttributeData(DINTERP_FIFO_rd_data).PosY);
									PixelXYFIFO_PushElement <= '1';
									outputCollectorMainProcessGoSignal <= '1';
									currentState <= dispatchNewSpecialMessage;
								end if;
								if (DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX(eSpecialPixelCodeBits'pos(TerminateCurrentDrawEventID) ) = '1') then
									PixelXYFIFO_PushElement <= '1';
									outputCollectorMainProcessGoSignal <= '1';
									currentState <= dispatchNewSpecialMessage;
								end if;
								if (DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX(eSpecialPixelCodeBits'pos(SetNewPrimSlot) ) = '1') then
									currentState <= setNewPrimitive;
								end if;
								if (DeserializeAttributeData(DINTERP_FIFO_rd_data).PosX(eSpecialPixelCodeBits'pos(TerminateCurrentPrimSlot) ) = '1') then
									TRICACHE_PopTriangleSlot <= '1';
									currentState <= terminateCurrentPrimitive;
								end if;
							end if;
						else
							DINTERP_FIFO_rd_en <= '1';

							BarycentricBCFIFO_PushElement <= '1';
							PixelWFIFO_PushElement <= '1';
							PixelXYFIFO_PushElement <= '1';
	
							currentState <= dispatchNewPixel;
						end if;
					else
						if (readyForNewPixel = '1') then
							CMD_IsIdle <= '1';
						end if;

						readyForNewPixel <= '1';
					end if;

				when dispatchNewPixel =>
					newWaveIsReady <= '1';
					currentState <= waitingForRead;

				when dispatchNewSpecialMessage =>
					currentState <= waitingForWrite;

				when waitingForWrite =>
					if (OutputDriverIsIdle = '1') then
						currentState <= waitingForRead;
					end if;

				when setNewPrimitive =>
					unpackedVertex0.tx <= f32(TRICACHE_inT0X);
					unpackedVertex0.ty <= f32(TRICACHE_inT0Y);
					unpackedVertex10.tx <= f32(TRICACHE_inT10X);
					unpackedVertex10.ty <= f32(TRICACHE_inT10Y);
					unpackedVertex20.tx <= f32(TRICACHE_inT20X);
					unpackedVertex20.ty <= f32(TRICACHE_inT20Y);
					unpackedVertex0.color_r <= f32(TRICACHE_inColorRGBA0(31 downto 0) );
					unpackedVertex0.color_g <= f32(TRICACHE_inColorRGBA0(63 downto 32) );
					unpackedVertex0.color_b <= f32(TRICACHE_inColorRGBA0(95 downto 64) );
					unpackedVertex0.color_a <= f32(TRICACHE_inColorRGBA0(127 downto 96) );
					unpackedVertex10.color_r <= f32(TRICACHE_inColorRGBA10(31 downto 0) );
					unpackedVertex10.color_g <= f32(TRICACHE_inColorRGBA10(63 downto 32) );
					unpackedVertex10.color_b <= f32(TRICACHE_inColorRGBA10(95 downto 64) );
					unpackedVertex10.color_a <= f32(TRICACHE_inColorRGBA10(127 downto 96) );
					unpackedVertex20.color_r <= f32(TRICACHE_inColorRGBA20(31 downto 0) );
					unpackedVertex20.color_g <= f32(TRICACHE_inColorRGBA20(63 downto 32) );
					unpackedVertex20.color_b <= f32(TRICACHE_inColorRGBA20(95 downto 64) );
					unpackedVertex20.color_a <= f32(TRICACHE_inColorRGBA20(127 downto 96) );

					currentState <= waitingForRead;

				when terminateCurrentPrimitive =>
					currentState <= waitingForRead;

			end case;
		end if;
	end process MainStateMachine;

	InterpolatorDriver : process(clk)
	begin
		if (rising_edge(clk) ) then
			interpGoSignal <= '0';
			BarycentricBCFIFO_PopElement <= '0';
			interpInputB <= f32(BarycentricBCFIFO_OutCurrentData(31 downto 0) );
			interpInputC <= f32(BarycentricBCFIFO_OutCurrentData(63 downto 32) );
			
			newMulWaveIsReady(0) <= newMulWaveIsReady(1);
			newMulWaveIsReady(1) <= newMulWaveIsReady(2);
			newMulWaveIsReady(2) <= newMulWaveIsReady(3);
			newMulWaveIsReady(3) <= newMulWaveIsReady(4);
			newMulWaveIsReady(4) <= newMulWaveIsReady(5);
			newMulWaveIsReady(5) <= newMulWaveIsReady(6);
			newMulWaveIsReady(6) <= newMulWaveIsReady(7);
			newMulWaveIsReady(7) <= newMulWaveIsReady(8);
			--newMulWaveIsReady(8) <= newMulWaveIsReady(9);
			--newMulWaveIsReady(9) <= '0';
			newMulWaveIsReady(8) <= '0';

			InterpolatorDriverIsIdle <= '0';
			interpDriverReadyForNextPixel <= '0';

			case currentInterpolatorState is
				when IS_TX =>
					interpInputAttr0 <= unpackedVertex0.tx;
					interpInputAttr10 <= unpackedVertex10.tx;
					interpInputAttr20 <= unpackedVertex20.tx;

					if (newWaveIsReady = '1') then
						interpGoSignal <= '1';
						currentInterpolatorState <= IS_TY;
					else
						interpDriverReadyForNextPixel <= '1';
						InterpolatorDriverIsIdle <= '1';
					end if;

				when IS_TY =>
					interpInputAttr0 <= unpackedVertex0.ty;
					interpInputAttr10 <= unpackedVertex10.ty;
					interpInputAttr20 <= unpackedVertex20.ty;
					interpGoSignal <= '1';

					currentInterpolatorState <= IS_R;

				when IS_R =>
					interpInputAttr0 <= unpackedVertex0.color_r;
					interpInputAttr10 <= unpackedVertex10.color_r;
					interpInputAttr20 <= unpackedVertex20.color_r;
					interpGoSignal <= '1';

					currentInterpolatorState <= IS_G;

				when IS_G =>
					interpInputAttr0 <= unpackedVertex0.color_g;
					interpInputAttr10 <= unpackedVertex10.color_g;
					interpInputAttr20 <= unpackedVertex20.color_g;
					interpGoSignal <= '1';

					currentInterpolatorState <= IS_B;

				when IS_B =>
					interpInputAttr0 <= unpackedVertex0.color_b;
					interpInputAttr10 <= unpackedVertex10.color_b;
					interpInputAttr20 <= unpackedVertex20.color_b;
					interpGoSignal <= '1';

					currentInterpolatorState <= IS_A;

				when IS_A =>
					interpInputAttr0 <= unpackedVertex0.color_a;
					interpInputAttr10 <= unpackedVertex10.color_a;
					interpInputAttr20 <= unpackedVertex20.color_a;
					interpGoSignal <= '1';

					newMulWaveIsReady(8) <= '1';
					BarycentricBCFIFO_PopElement <= '1';
					interpDriverReadyForNextPixel <= '1';

					currentInterpolatorState <= IS_TX;

			end case;
		end if;
	end process InterpolatorDriver;

	MultiplierDriver : process(clk)
	begin
		if (rising_edge(clk) ) then
			mulGoSignal <= '0';
			PixelWFIFO_PopElement <= '0';
			FPU_MUL_A <= interpOutput;
			FPU_MUL_B <= PixelWFIFO_OutCurrentData;
			MultiplierDriverIsIdle <= '0';

			newCnvWaveIsReady <= '0';

			case currentMultiplierState is
				when IS_TX =>
					mulGoSignal <= newMulWaveIsReady(0);

					if (newMulWaveIsReady(0) = '1') then
						currentMultiplierState <= IS_TY;
					else
						MultiplierDriverIsIdle <= '1';
					end if;

				when IS_TY =>
					mulGoSignal <= '1';

					currentMultiplierState <= IS_R;

				when IS_R =>
					mulGoSignal <= '1';

					currentMultiplierState <= IS_G;

				when IS_G =>
					mulGoSignal <= '1';

					currentMultiplierState <= IS_B;

				when IS_B =>
					mulGoSignal <= '1';

					currentMultiplierState <= IS_A;

				when IS_A =>
					mulGoSignal <= '1';
					newCnvWaveIsReady <= '1';
					PixelWFIFO_PopElement <= '1';

					currentMultiplierState <= IS_TX;

			end case;
		end if;
	end process MultiplierDriver;

	ConverterDriver : process(clk)
	begin
		if (rising_edge(clk) ) then
			cnv0GoSignal <= '0';
			cnv1GoSignal <= '0';
			outputCollectorConverterProcessGoSignal <= '0';
			ConverterDriverIsIdle <= '0';

			case currentConverterState is
				when IS_TX =>
					clampedTexcoordTX <= SaturateFloat(f32(FPU_MUL_OUT) );
					FPU_CNV0_A <= FPU_MUL_OUT; -- tx * pixelW
					FPU_CNV0_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_Frc), 3) );
					FPU_CNV1_Mode <= (others => '-');

					if (newCnvWaveIsReady = '1') then
						if (texcoord0AddressingModeU = TAM_Wrap) then
							cnv0GoSignal <= '1';
						end if;
						currentConverterState <= IS_TY;
					else
						ConverterDriverIsIdle <= '1';
					end if;

				when IS_TY =>
					clampedTexcoordTY <= SaturateFloat(f32(FPU_MUL_OUT) );
					FPU_CNV0_A <= FPU_MUL_OUT; -- ty * pixelW
					FPU_CNV0_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_Frc), 3) );
					FPU_CNV1_Mode <= (others => '-');
					if (texcoord0AddressingModeV = TAM_Wrap) then
						cnv0GoSignal <= '1';
					end if;

					currentConverterState <= IS_R;

				when IS_R =>
					cnv0GoSignal <= '1';
					FPU_CNV0_A <= std_logic_vector(SaturateFloat(f32(FPU_MUL_OUT) ) ); -- r * pixelW
					FPU_CNV0_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM8), 3) );
					FPU_CNV1_Mode <= (others => '-');

					currentConverterState <= IS_G;

				when IS_G =>
					cnv0GoSignal <= '1';
					FPU_CNV0_A <= std_logic_vector(SaturateFloat(f32(FPU_MUL_OUT) ) ); -- g * pixelW
					FPU_CNV0_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM8), 3) );
					FPU_CNV1_Mode <= (others => '-');

					currentConverterState <= IS_B;

				when IS_B =>
					cnv0GoSignal <= '1';
					cnv1GoSignal <= '1';
					FPU_CNV0_A <= std_logic_vector(SaturateFloat(f32(FPU_MUL_OUT) ) ); -- b * pixelW
					FPU_CNV0_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM8), 3) );
					FPU_CNV1_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM16), 3) );
					if (texcoord0AddressingModeU = TAM_Wrap) then
						FPU_CNV1_A <= FPU_CNV0_OUT; -- If this is wrap mode, then source our texcoord from the frac() output
					else
						FPU_CNV1_A <= std_logic_vector(clampedTexcoordTX); -- If this is clamp mode, then just use our clamped texcoord
					end if;

					currentConverterState <= IS_A;

				when IS_A =>
					cnv0GoSignal <= '1';
					cnv1GoSignal <= '1';
					FPU_CNV0_A <= std_logic_vector(SaturateFloat(f32(FPU_MUL_OUT) ) ); -- a * pixelW
					FPU_CNV0_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM8), 3) );
					FPU_CNV1_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_UNORM16), 3) );
					if (texcoord0AddressingModeV = TAM_Wrap) then
						FPU_CNV1_A <= FPU_CNV0_OUT; -- If this is wrap mode, then source our texcoord from the frac() output
					else
						FPU_CNV1_A <= std_logic_vector(clampedTexcoordTY); -- If this is clamp mode, then just use our clamped texcoord
					end if;
					outputCollectorConverterProcessGoSignal <= '1';

					currentConverterState <= IS_TX;

			end case;
		end if;
	end process ConverterDriver;

	OutputCollectorDriver : process(clk)
	begin
		if (rising_edge(clk) ) then
			TEXSAMP_OutFIFO_wr_en <= '0';
			PixelXYFIFO_PopElement <= '0';
			TEXSAMP_OutFIFO_wr_data <= std_logic_vector(PackOutputData(unsigned(PixelXYFIFO_OutCurrentData(15 downto 0) ), unsigned(PixelXYFIFO_OutCurrentData(31 downto 16) ), compressedOutPixelDataTX, unsigned(FPU_CNV1_OUT(15 downto 0) ), 
				compressedOutPixelDataColorR, compressedOutPixelDataColorG, compressedOutPixelDataColorB, unsigned(FPU_CNV0_OUT(7 downto 0) ) ) );
			OutputDriverIsIdle <= '0';

			case currentOutputCollectorState is
				when IS_TX =>
					if (outputCollectorGoSignal = '1') then
						compressedOutPixelDataColorR <= unsigned(FPU_CNV0_OUT(7 downto 0) );
						currentOutputCollectorState <= IS_TY;
					else
						OutputDriverIsIdle <= '1';
					end if;

				when IS_TY =>
					compressedOutPixelDataColorG <= unsigned(FPU_CNV0_OUT(7 downto 0) );
					currentOutputCollectorState <= IS_R;

				when IS_R =>
					compressedOutPixelDataColorB <= unsigned(FPU_CNV0_OUT(7 downto 0) );
					compressedOutPixelDataTX <= unsigned(FPU_CNV1_OUT(15 downto 0) );
					currentOutputCollectorState <= IS_G;

				when others =>
					TEXSAMP_OutFIFO_wr_en <= '1';
					PixelXYFIFO_PopElement <= '1';
					currentOutputCollectorState <= IS_TX;

			end case;
		end if;
	end process OutputCollectorDriver;

end Behavioral;
