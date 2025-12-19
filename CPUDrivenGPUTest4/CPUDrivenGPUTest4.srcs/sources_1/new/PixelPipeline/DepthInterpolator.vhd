library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.PacketType.all;
use work.FloatALU_Types.all;
use work.FloatCommon.all;
use work.PixelPipeline_Types.all;
use work.DepthInterpolatorState.all;

entity DepthInterpolator is
	Generic ( MAX_OCCUPANCY : positive := 32
	);
	Port ( clk : in STD_LOGIC;

	-- TriWorkCache per-triangle interface begin
		TRICACHE_inBarycentricInverse : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inZ0 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inZ10 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inZ20 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inInvW0 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inInvW10 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inInvW20 : in STD_LOGIC_VECTOR(31 downto 0);

		TRICACHE_PopTriangleSlot : out STD_LOGIC := '0';
	-- TriWorkCache per-triangle interface end

	-- Rasterizer Output per-pixel interface begin
		RASTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR(32+32+16+16 - 1 downto 0);
		RASTOUT_FIFO_empty : in STD_LOGIC;
		RASTOUT_FIFO_almost_empty : in STD_LOGIC;
		RASTOUT_FIFO_rd_en : out STD_LOGIC := '0';
	-- Rasterizer Output per-pixel interface end

	-- Depth Interpolator State Block interface begin
		STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR(DEPTH_INTERPOLATOR_STATE_SIZE_BITS-1 downto 0);
		STATE_NextDrawID : in STD_LOGIC_VECTOR(15 downto 0);
		STATE_StateIsValid : in STD_LOGIC;
		STATE_ConsumeStateSlot : out STD_LOGIC := '0';
	-- Depth Interpolator State Block interface end

	-- FPU interfaces begin
		-- MUL pipe for multiplication:
		FPU_MUL_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_MUL_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_MUL_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_MUL_GO : out STD_LOGIC := '0';

		-- CNV pipe for u32 to f32 conversions:
		FPU_CNV0_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_CNV0_Mode : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		FPU_CNV0_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_CNV0_GO : out STD_LOGIC := '0';

		-- CNV pipe for f32 to u24 conversion:
		FPU_CNV1_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_CNV1_Mode : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		FPU_CNV1_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_CNV1_GO : out STD_LOGIC := '0';

		-- SPEC pipe for float reciprocal:
		FPU_SPEC_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_SPEC_OUT : in STD_LOGIC_VECTOR(31 downto 0);
		FPU_SPEC_GO : out STD_LOGIC := '0';
	-- FPU interfaces end

	-- Depth Buffer interface begin
		DEPTH_PixelReady : out STD_LOGIC := '0';
		DEPTH_PosX : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		DEPTH_PosY : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		DEPTH_OutPixelDepth : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		DEPTH_PixelPassedDepthStencilTest : in STD_LOGIC;
		DEPTH_PixelFailedDepthTest : in STD_LOGIC;
		DEPTH_PixelFailedStencilTest : in STD_LOGIC;

		DEPTH_SetDepthParams : out STD_LOGIC := '0';
		DEPTH_DepthWriteEnable : out STD_LOGIC := '0';
		DEPTH_DepthFunction : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DEPTH_StencilWriteEnable : out STD_LOGIC := '0';
		DEPTH_StencilRefVal : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DEPTH_StencilReadMask : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DEPTH_StencilWriteMask : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DEPTH_StencilCmpFunc : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DEPTH_StencilFailOp : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DEPTH_StencilZFailOp : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DEPTH_StencilPassOp : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DEPTH_DepthIsIdle : in STD_LOGIC;
	-- Depth Buffer interface end

	-- Attribute Interpolator FIFO interface begin
		ATTR_FIFO_wr_data : out STD_LOGIC_VECTOR(INTERPOLATOR_DATA_BITS-1 downto 0) := (others => '0');
		ATTR_FIFO_wr_en : out STD_LOGIC := '0';
		ATTR_FIFO_full : in STD_LOGIC;
		ATTR_FIFO_almost_full : in STD_LOGIC; -- Don't dispatch any more waves if our output FIFO is almost full - that means it wouldn't be able to hold their data!
	-- Attribute Interpolator FIFO interface end

	-- Command Processor interface begin
		CMD_IsIdle : out STD_LOGIC := '0';
	-- Command Processor interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		STAT_DepthOnlyPixelsPassed : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_DepthInterpolator_State : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
		DBG_BarycentricConvertState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_BarycentricNormalizeState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_InterpolatorDriverState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_ShiftConvertZState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_DepthTestDriverZState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_RastBarycentricB : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RastBarycentricC : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_InterpolatedDepthU24 : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		DBG_IdleVector : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		DBG_BarycentricBCFIFO : out STD_LOGIC_VECTOR(63 downto 0) := (others => '0');
		DBG_CurrentDepthStencilState : out STD_LOGIC_VECTOR(DEPTH_INTERPOLATOR_STATE_SIZE_BITS-1 downto 0) := (others => '0');
		
		DBG_Message : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MessageData : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_NewMessage : out STD_LOGIC := '0'
		);
end DepthInterpolator;

architecture Behavioral of DepthInterpolator is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
ATTRIBUTE X_INTERFACE_MODE : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";

-- We're using the ASSOCIATED_BUSIF parameter here to associate these other interfaces' clocks with the main clock (which is this module's primary driving clock for everything).
-- Doing this fixes the following IPI import warning: WARNING: [IP_Flow 19-11886] Bus Interface 'clk' is not associated with any clock interface
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000, ASSOCIATED_BUSIF RASTOUT_FIFO:ATTR_FIFO";

-- We're using the X_INTERFACE_MODE attribute here to set the interface mode to "master" mode. Options include "master", "slave", and "monitor" (used for monitoring an interface that is driven by another master/slave).
-- Doing this fixes the following IPI import warnings:
-- WARNING: [IP_Flow 19-5462] Defaulting to slave bus interface due to conflicts in bus interface inference.
-- WARNING: [IP_Flow 19-3480] Bus Interface 'RASTOUT_FIFO': Portmap direction mismatched between component port 'RASTOUT_FIFO_rd_data' and definition port 'RD_DATA'.
ATTRIBUTE X_INTERFACE_MODE of RASTOUT_FIFO_rd_data: SIGNAL is "master";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO EMPTY";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_almost_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO ALMOST_EMPTY";

ATTRIBUTE X_INTERFACE_MODE of ATTR_FIFO_wr_data: SIGNAL is "master";
ATTRIBUTE X_INTERFACE_INFO of ATTR_FIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ATTR_FIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of ATTR_FIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ATTR_FIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of ATTR_FIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ATTR_FIFO FULL";

constant noperspective : STD_LOGIC := '1';

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

type depthInterpStateType is 
(
	waitingForRead, -- 0
	kickNewPixel, -- 1
	setNewPrimitiveSlot, -- 2
	setDepthState, -- 3
	signalSpecialPixelMessage -- 4
);

type barycentricConversionState is
(
	CS_Stage0, -- 0
	CS_Stage1 -- 1
);

type barycentricNormalizationState is
(
	MS_Stage0, -- 0
	MS_Stage1 -- 1
);

type interpolatorDriverState is
(
	IS_StageZ, -- 0
	IS_StageInvW -- 1
);

type shiftConvertZState is
(
	SC_ShiftZ, -- 0
	SC_ConvertZ -- 1
);

type depthTestIssueState is
(
	DTS_Issue0, -- 0
	DTS_Issue1 -- 1
);

type outputDataSourceType is
(
	ODS_DepthPipeline, -- 0
	ODS_SpecialPixelMessage -- 1
);

type TriangleAttributesData is record
	BarycentricInverse : f32; -- float32 format (this is 1.0f / twiceTriangleArea)
	Z0 : f32; -- float32 format (this is z0)
	Z10 : f32; -- float32 format (this is z1 - z0)
	Z20 : f32; -- float32 format (this is z2 - z0)
	InvW0 : f32; -- float32 format (this is 1.0f / w0)
	InvW10 : f32; -- float32 format (this is 1.0f / w1)
	InvW20 : f32; -- float32 format (this is 1.0f / w2)
end record;

pure function Int32toUint32(intVal : signed(31 downto 0); signBit : std_logic) return unsigned is
begin
	if (signBit = '0') then
		return '0' & unsigned(intVal(30 downto 0) );
	else
		return unsigned(-intVal);
	end if;
end function;

-- Multiplies a float value by 2^24-1 (16777215 or 0x00FFFFFF) using fast shifting.
-- Assumes input value is already in the [0.0f, 1.0f] range!
pure function FloatMultiplyBy2_24(fltVal : f32) return f32 is
	variable tempResult : unsigned(30 downto 0);
begin
	if (GetFloatIsDenorm(fltVal) = '1') then
		return X"00000000"; -- Anything times 0.0f is 0.0f
	else
		tempResult := (fltVal(30 downto 23) + 24) & fltVal(22 downto 0);
		return fltVal(31) & (tempResult - 1);
	end if;
end function;

pure function FloatSaturate(fltVal : f32) return f32 is
begin
	if (fltVal(31) = '1') then
		return X"00000000";
	elsif (fltVal(30 downto 0) > X"3F800000") then
		return X"3F800000";
	else
		return fltVal;
	end if;
end function;

pure function GetPixelCoordinateX(depthInterpolatorFifoPacket : unsigned(32+32+16+16 - 1 downto 0) ) return unsigned is
begin
	return depthInterpolatorFifoPacket(32*2+16-1 downto 32*2);
end function;

pure function GetPixelCoordinateY(depthInterpolatorFifoPacket : unsigned(32+32+16+16 - 1 downto 0) ) return unsigned is
begin
	return depthInterpolatorFifoPacket(32*2+16*2-1 downto 32*2+16);
end function;

pure function GetBarycentricCoordinateB(depthInterpolatorFifoPacket : unsigned(32+32+16+16 - 1 downto 0) ) return signed is
begin
	return signed(depthInterpolatorFifoPacket(32*1-1 downto 32*0) );
end function;

pure function GetBarycentricCoordinateC(depthInterpolatorFifoPacket : unsigned(32+32+16+16 - 1 downto 0) ) return signed is
begin
	return signed(depthInterpolatorFifoPacket(32*2-1 downto 32*1) );
end function;

signal currentState : depthInterpStateType := waitingForRead;
signal barycentricConvertCurrentState : barycentricConversionState := CS_Stage0;
signal barycentricNormalizationCurrentState : barycentricNormalizationState := MS_Stage0;
signal interpolatorDriverCurrentState : interpolatorDriverState := IS_StageZ;
signal shiftConvertZCurrentState : shiftConvertZState := SC_ShiftZ;
signal depthTestDriverCurrentState : depthTestIssueState := DTS_Issue0;

signal currentDepthState : sDepthInterpolatorState := DEFAULT_DEPTH_INTERPOLATOR_STATE;

signal storedPixelX : unsigned(15 downto 0) := (others => '0');
signal storedPixelY : unsigned(15 downto 0) := (others => '0');
signal currentDrawEventID : unsigned(15 downto 0) := (others => '0');

signal tempMultBarycentricB : signed(31 downto 0) := (others => '0'); -- int32 format of the input barycentric
signal tempMultBarycentricC : signed(31 downto 0) := (others => '0'); -- int32 format of the input barycentric
signal tempMultBarycentricCStored : signed(31 downto 0) := (others => '0'); -- int32 format of the input barycentric

signal tempMultBarycentricBIsNegative : std_logic := '0'; -- Save off the sign bit for restoring later
signal tempMultBarycentricCIsNegative : std_logic := '0';
signal tempMultBarycentricCIsNegativeStored : std_logic := '0';
signal tempFloatBarycentricB : f32 := (others => '0'); -- float32 format of the input barycentric
signal tempFloatBarycentricC : f32 := (others => '0'); -- float32 format of the input barycentric

signal normalizedBarycentricB : f32 := (others => '0'); -- float32 format of barycentricNormalizeFactor * float(barycentricB)
signal normalizedBarycentricC : f32 := (others => '0'); -- float32 format of barycentricNormalizeFactor * float(barycentricC)

signal pixelDepth : f32 := (others => '0'); -- float32 format (0.0f to 1.0f) pixel depth value
signal pixelW : f32 := (others => '0'); -- float32 format (0.0f to 1.0f) pixel W value
signal pixelDepthU24 : unsigned(23 downto 0) := (others => '0');
signal depthOnlyPixelsPassed : unsigned(31 downto 0) := (others => '0');

signal mainProcessOutputGoSignal : std_logic := '0'; -- Written by the main process, read by the output process
signal outputProcessGoSignal : std_logic := '0'; -- Read by the output process
signal outputDataSource : outputDataSourceType := ODS_DepthPipeline;

-- These are the current triangle's attributes:
signal currentTriData : TriangleAttributesData;

signal storedDbgBarycentricB : signed(31 downto 0) := (others => '0');
signal storedDbgBarycentricC : signed(31 downto 0) := (others => '0');

signal readFromFifo : std_logic := '0';

signal interpBarycentrics0 : f32 := (others => '0');
signal interpBarycentrics1 : f32 := (others => '0');
signal lastCycleDepthTestValue : unsigned(23 downto 0) := (others => '0');
signal lastCyclePosX : unsigned(9 downto 0) := (others => '0');
signal lastCyclePosY : unsigned(9 downto 0) := (others => '0');

-- Stats signals:
signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

-- Driver idle signals:
signal barycentricConvertIsIdle : std_logic := '1';
signal barycentricNormalizationIsIdle : std_logic := '1';
signal interpolatorDriverIsIdle : std_logic := '1';
signal reciprocalDriverIsIdle : std_logic := '1';
signal shiftConvertZIsIdle : std_logic := '1';
signal depthTestDriverIsIdle : std_logic := '1';
signal depthTestProcessResultsIsIdle : std_logic := '1';
signal outputProcessIsIdle : std_logic := '1';

-- Go signals and pipeline shift registers:
signal barycentricConversionGoSignal : std_logic := '0';
signal newMulWaveIsReady : std_logic_vector(2 downto 0) := (others => '0');
signal signBitShiftReg : std_logic_vector(2 downto 0) := (others => '0');
signal newInterpWaveIsReady : std_logic_vector(5 downto 0) := (others => '0');
signal newRcpWaveIsReady : std_logic_vector(14 downto 0) := (others => '0');
signal newShiftConvertDepthWaveIsReady : std_logic_vector(14 downto 0) := (others => '0');
signal newDepthTestWaveIsReady : std_logic_vector(3 downto 0) := (others => '0');
signal depthTestResultsReady : std_logic_vector(6 downto 0) := (others => '0');
signal passedPixelColorAndWValueReady : std_logic_vector(2 downto 0) := (others => '0');

type PassedPixelXYShiftRegType is array(9 downto 0) of std_logic_vector(31 downto 0);
signal passedPixelXYShiftReg : PassedPixelXYShiftRegType := (others => (others => '0') );

type PassedBarycentricBCShiftRegType is array(2 downto 0) of std_logic_vector(63 downto 0);
signal passedBarycentricBCShiftReg : PassedBarycentricBCShiftRegType := (others => (others => '0') );

-- Interpolator signals:
signal interpInputB : f32 := (others => '0');
signal interpInputC : f32 := (others => '0');
signal interpInputAttr0 : f32 := (others => '0');
signal interpInputAttr10 : f32 := (others => '0');
signal interpInputAttr20 : f32 := (others => '0');
signal interpGoSignal : std_logic := '0';
signal interpOutput : std_logic_vector(31 downto 0) := (others => '0');

-- FIFO signals:
signal PixelXYFIFO_IsFull : std_logic := '0';
signal PixelXYFIFO_IsEmpty : std_logic := '1';
signal PixelXYFIFO_PopElement : std_logic := '0';
signal PixelXYFIFO_PushElement : std_logic := '0';
signal PixelXYFIFO_OutCurrentData : std_logic_vector(31 downto 0) := (others => '0');
signal PixelXYFIFO_InNewData : std_logic_vector(31 downto 0) := (others => '0');

signal BarycentricBCFIFO_IsFull : std_logic := '0';
signal BarycentricBCFIFO_IsEmpty : std_logic := '1';
signal BarycentricBCFIFO_PopElement : std_logic := '0';
signal BarycentricBCFIFO_PushElement : std_logic := '0';
signal BarycentricBCFIFO_OutCurrentData : std_logic_vector(63 downto 0) := (others => '0');
signal BarycentricBCFIFO_InNewData : std_logic_vector(63 downto 0) := (others => '0');

begin

RASTOUT_FIFO_rd_en <= readFromFifo;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);
STAT_DepthOnlyPixelsPassed <= std_logic_vector(depthOnlyPixelsPassed);

DBG_DepthInterpolator_State <= std_logic_vector(to_unsigned(depthInterpStateType'pos(currentState), 7) );
DBG_BarycentricConvertState <= std_logic_vector(to_unsigned(barycentricConversionState'pos(barycentricConvertCurrentState), 4) );
DBG_BarycentricNormalizeState <= std_logic_vector(to_unsigned(barycentricNormalizationState'pos(barycentricNormalizationCurrentState), 4) );
DBG_InterpolatorDriverState <= std_logic_vector(to_unsigned(interpolatorDriverState'pos(interpolatorDriverCurrentState), 4) );
DBG_ShiftConvertZState <= std_logic_vector(to_unsigned(shiftConvertZState'pos(shiftConvertZCurrentState), 4) );
DBG_DepthTestDriverZState <= std_logic_vector(to_unsigned(depthTestIssueState'pos(depthTestDriverCurrentState), 4) );
DBG_RastBarycentricB <= std_logic_vector(storedDbgBarycentricB);
DBG_RastBarycentricC <= std_logic_vector(storedDbgBarycentricC);
DBG_IdleVector <= BarycentricBCFIFO_IsEmpty & PixelXYFIFO_IsEmpty & outputProcessIsIdle & depthTestProcessResultsIsIdle & depthTestDriverIsIdle & shiftConvertZIsIdle & 
	reciprocalDriverIsIdle & interpolatorDriverIsIdle & barycentricNormalizationIsIdle & barycentricConvertIsIdle;
DBG_CurrentDepthStencilState <= SerializeStructToBits(currentDepthState);

FPU_CNV0_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(U32_to_F), 3) );
FPU_CNV1_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_U24_RoundNearestEven), 3) );

outputProcessGoSignal <= passedPixelColorAndWValueReady(0) or mainProcessOutputGoSignal;

Interpolator : FloatALU_Interpolator port map(clk => clk, IN_B => std_logic_vector(interpInputB), IN_C => std_logic_vector(interpInputC), IN_Attr0 => std_logic_vector(interpInputAttr0), IN_Attr10 => std_logic_vector(interpInputAttr10), IN_Attr20 => std_logic_vector(interpInputAttr20), OINTERP => interpOutput, IINTERP_GO => interpGoSignal);
PixelXYFIFO : SimpleFIFO generic map(FIFO_Depth => MAX_OCCUPANCY, FIFO_Bit_Width => 16*2) port map(clk => clk, FIFO_IsEmpty => PixelXYFIFO_IsEmpty, FIFO_IsFull => PixelXYFIFO_IsFull, FIFO_PushNewElement => PixelXYFIFO_PushElement, FIFO_PopLastElement => PixelXYFIFO_PopElement, FIFO_NewElementDataWr => PixelXYFIFO_InNewData, FIFO_NextElementDataRd => PixelXYFIFO_OutCurrentData);
BarycentricBCFIFO : SimpleFIFO generic map(FIFO_Depth => MAX_OCCUPANCY, FIFO_Bit_Width => 32*2) port map(clk => clk, FIFO_IsEmpty => BarycentricBCFIFO_IsEmpty, FIFO_IsFull => BarycentricBCFIFO_IsFull, FIFO_PushNewElement => BarycentricBCFIFO_PushElement, FIFO_PopLastElement => BarycentricBCFIFO_PopElement, FIFO_NewElementDataWr => BarycentricBCFIFO_InNewData, FIFO_NextElementDataRd => BarycentricBCFIFO_OutCurrentData);

	StatsProcess : process(clk)
	begin
		if (rising_edge(clk) ) then
			STAT_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);

			if (currentState = waitingForRead and barycentricConvertIsIdle = '1' and barycentricNormalizationIsIdle = '1' and interpolatorDriverIsIdle = '1' and reciprocalDriverIsIdle = '1' and
				shiftConvertZIsIdle = '1' and depthTestDriverIsIdle = '1' and depthTestProcessResultsIsIdle = '1' and outputProcessIsIdle = '1' and PixelXYFIFO_IsEmpty = '1' and BarycentricBCFIFO_IsEmpty = '1' and outputProcessGoSignal = '0') then
				statCyclesIdle <= statCyclesIdle + 1;
			elsif (currentState = waitingForRead and ATTR_FIFO_almost_full = '1') then
				statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;
			else
				statCyclesWorking <= statCyclesWorking + 1;
			end if;
		end if;
	end process StatsProcess;

	MainProcess : process(clk)
		variable barycentricB : signed(31 downto 0);
		variable barycentricC : signed(31 downto 0);
		variable tempPixelX : unsigned(15 downto 0);
	begin
		if (rising_edge(clk) ) then
			CMD_IsIdle <= '0';
			STATE_ConsumeStateSlot <= '0';
			DEPTH_SetDepthParams <= '0';
			TRICACHE_PopTriangleSlot <= '0';
			readFromFifo <= '0';
			PixelXYFIFO_PushElement <= '0';
			PixelXYFIFO_InNewData <= std_logic_vector(GetPixelCoordinateY(unsigned(RASTOUT_FIFO_rd_data) ) & GetPixelCoordinateX(unsigned(RASTOUT_FIFO_rd_data) ) );
			mainProcessOutputGoSignal <= '0';
			barycentricConversionGoSignal <= '0';
			outputDataSource <= ODS_DepthPipeline;

			case currentState is
				when waitingForRead =>
					barycentricB := GetBarycentricCoordinateB(unsigned(RASTOUT_FIFO_rd_data) );
					barycentricC := GetBarycentricCoordinateC(unsigned(RASTOUT_FIFO_rd_data) );
					tempMultBarycentricB <= GetBarycentricCoordinateB(unsigned(RASTOUT_FIFO_rd_data) );
					tempMultBarycentricC <= GetBarycentricCoordinateC(unsigned(RASTOUT_FIFO_rd_data) );
					tempMultBarycentricBIsNegative <= barycentricB(31); -- Save off the sign bit for restoring later
					tempMultBarycentricCIsNegative <= barycentricC(31);
					storedDbgBarycentricB <= GetBarycentricCoordinateB(unsigned(RASTOUT_FIFO_rd_data) );
					storedDbgBarycentricC <= GetBarycentricCoordinateC(unsigned(RASTOUT_FIFO_rd_data) );
					storedPixelX <= GetPixelCoordinateX(unsigned(RASTOUT_FIFO_rd_data) );
					storedPixelY <= GetPixelCoordinateY(unsigned(RASTOUT_FIFO_rd_data) );
					tempPixelX := GetPixelCoordinateX(unsigned(RASTOUT_FIFO_rd_data) );

					if (STATE_StateIsValid = '1' and currentDrawEventID = unsigned(STATE_NextDrawID) ) then
						if (barycentricConvertIsIdle = '1' and barycentricNormalizationIsIdle = '1' and interpolatorDriverIsIdle = '1' and reciprocalDriverIsIdle = '1' and shiftConvertZIsIdle = '1' and
							depthTestDriverIsIdle = '1' and depthTestProcessResultsIsIdle = '1' and outputProcessIsIdle = '1' and PixelXYFIFO_IsEmpty = '1' and BarycentricBCFIFO_IsEmpty = '1') then -- Wait for a full unit flush before changing state out from under us
							STATE_ConsumeStateSlot <= '1';

							currentDepthState <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID);
							currentState <= setDepthState;
						end if;
					elsif (RASTOUT_FIFO_empty = '0' and ATTR_FIFO_almost_full = '0' and PixelXYFIFO_IsFull = '0' and BarycentricBCFIFO_IsFull = '0') then
						if (IsSpecialPixelMessage(GetPixelCoordinateX(unsigned(RASTOUT_FIFO_rd_data) ) ) ) then
							if (barycentricConvertIsIdle = '1' and barycentricNormalizationIsIdle = '1' and interpolatorDriverIsIdle = '1' and reciprocalDriverIsIdle = '1' and shiftConvertZIsIdle = '1' and 
								depthTestDriverIsIdle = '1' and depthTestProcessResultsIsIdle = '1' and outputProcessIsIdle = '1' and PixelXYFIFO_IsEmpty = '1' and BarycentricBCFIFO_IsEmpty = '1' and outputProcessGoSignal = '0') then
								if (tempPixelX(eSpecialPixelCodeBits'pos(TerminateCurrentPrimSlot) ) = '1') then -- "terminate primitive slot"
									TRICACHE_PopTriangleSlot <= '1';
								end if;
								if (tempPixelX(eSpecialPixelCodeBits'pos(SetNewDrawEventID) ) = '1') then -- "set new draw event ID"
									currentDrawEventID <= GetPixelCoordinateY(unsigned(RASTOUT_FIFO_rd_data) );
								end if;
								if (tempPixelX(eSpecialPixelCodeBits'pos(SetNewPrimSlot) ) = '1') then -- "set new primitive slot"
									currentState <= setNewPrimitiveSlot;
								else
									currentState <= signalSpecialPixelMessage;
								end if;
								outputDataSource <= ODS_SpecialPixelMessage;
								readFromFifo <= '1'; -- Signal the read request
							end if;
						else
							barycentricConversionGoSignal <= '1';
							PixelXYFIFO_PushElement <= '1'; -- Push our new pixel
							readFromFifo <= '1'; -- Signal the read request
							currentState <= kickNewPixel;
						end if;
					else
						if (readFromFifo = '0') then
							CMD_IsIdle <= barycentricConvertIsIdle and barycentricNormalizationIsIdle and interpolatorDriverIsIdle and reciprocalDriverIsIdle and shiftConvertZIsIdle and 
								depthTestDriverIsIdle and depthTestProcessResultsIsIdle and outputProcessIsIdle and PixelXYFIFO_IsEmpty and BarycentricBCFIFO_IsEmpty and not outputProcessGoSignal;
						end if;
					end if;

				when kickNewPixel =>
					currentState <= waitingForRead;

				when setNewPrimitiveSlot =>
					currentTriData.BarycentricInverse <= f32(TRICACHE_inBarycentricInverse);
					currentTriData.Z0 <= f32(TRICACHE_inZ0);
					currentTriData.Z10 <= f32(TRICACHE_inZ10);
					currentTriData.Z20 <= f32(TRICACHE_inZ20);
					currentTriData.InvW0 <= f32(TRICACHE_inInvW0);
					currentTriData.InvW10 <= f32(TRICACHE_inInvW10);
					currentTriData.InvW20 <= f32(TRICACHE_inInvW20);
					outputDataSource <= ODS_SpecialPixelMessage;

					currentState <= signalSpecialPixelMessage;

				when setDepthState =>
					if (DEPTH_DepthIsIdle = '1') then -- Wait for the depth block to fully drain its pipeline before we change its state
						DEPTH_SetDepthParams <= '1';
						DEPTH_DepthWriteEnable <= currentDepthState.DepthWriteEnable;
						DEPTH_DepthFunction <= std_logic_vector(to_unsigned(eCmpFunc'pos(currentDepthState.DepthCompareFunction), 3) );
						DEPTH_StencilWriteEnable <= currentDepthState.StencilWriteEnable;
						DEPTH_StencilRefVal <= std_logic_vector(currentDepthState.StencilRefVal);
						DEPTH_StencilReadMask <= std_logic_vector(currentDepthState.StencilReadMask);
						DEPTH_StencilWriteMask <= std_logic_vector(currentDepthState.StencilWriteMask);
						DEPTH_StencilCmpFunc <= std_logic_vector(to_unsigned(eCmpFunc'pos(currentDepthState.StencilCmpFunc), 3) );
						DEPTH_StencilFailOp <= std_logic_vector(to_unsigned(eStencilOp'pos(currentDepthState.StencilFailOp), 3) );
						DEPTH_StencilZFailOp <= std_logic_vector(to_unsigned(eStencilOp'pos(currentDepthState.StencilZFailOp), 3) );
						DEPTH_StencilPassOp <= std_logic_vector(to_unsigned(eStencilOp'pos(currentDepthState.StencilPassOp), 3) );
						currentState <= waitingForRead;
					end if;

				when signalSpecialPixelMessage =>
					outputDataSource <= ODS_SpecialPixelMessage;
					mainProcessOutputGoSignal <= '1';
					currentState <= waitingForRead;

			end case;
		end if;
	end process MainProcess;

	BarycentricConversion : process(clk)
	begin
		if (rising_edge(clk) ) then
			FPU_CNV0_GO <= '0';
			barycentricConvertIsIdle <= '0';

			newMulWaveIsReady(0) <= newMulWaveIsReady(1);
			newMulWaveIsReady(1) <= newMulWaveIsReady(2);
			newMulWaveIsReady(2) <= '0';

			signBitShiftReg(0) <= signBitShiftReg(1);
			signBitShiftReg(1) <= signBitShiftReg(2);
			signBitShiftReg(2) <= '0';

			tempMultBarycentricCStored <= tempMultBarycentricC;

			case barycentricConvertCurrentState is
				when CS_Stage0 =>
					FPU_CNV0_A <= std_logic_vector(Int32toUint32(tempMultBarycentricB, tempMultBarycentricBIsNegative) );
					FPU_CNV0_A(31) <= '0'; -- We are always converting positive values
					FPU_CNV0_GO <= barycentricConversionGoSignal;
					signBitShiftReg(2) <= tempMultBarycentricBIsNegative;
					if (barycentricConversionGoSignal = '1') then
						barycentricConvertCurrentState <= CS_Stage1;
					elsif (newMulWaveIsReady = "000") then
						barycentricConvertIsIdle <= '1';
					end if;

				when CS_Stage1 =>
					FPU_CNV0_A <= std_logic_vector(Int32toUint32(tempMultBarycentricC, tempMultBarycentricCIsNegative) );
					FPU_CNV0_A(31) <= '0'; -- We are always converting positive values
					FPU_CNV0_GO <= '1';
					newMulWaveIsReady(2) <= '1';
					signBitShiftReg(2) <= tempMultBarycentricCIsNegative;
					barycentricConvertCurrentState <= CS_Stage0;
			end case;
		end if;
	end process BarycentricConversion;

	BarycentricNormalization : process(clk)
	begin
		if (rising_edge(clk) ) then
			FPU_MUL_GO <= '0';
			FPU_MUL_A <= std_logic_vector(currentTriData.BarycentricInverse);
			FPU_MUL_B <= (others => '0');
			barycentricNormalizationIsIdle <= '0';

			newInterpWaveIsReady(0) <= newInterpWaveIsReady(1);
			newInterpWaveIsReady(1) <= newInterpWaveIsReady(2);
			newInterpWaveIsReady(2) <= newInterpWaveIsReady(3);
			newInterpWaveIsReady(3) <= newInterpWaveIsReady(4);
			newInterpWaveIsReady(4) <= newInterpWaveIsReady(5);
			newInterpWaveIsReady(5) <= '0';

			case barycentricNormalizationCurrentState is
				when MS_Stage0 =>
					FPU_MUL_B(30 downto 0) <= FPU_CNV0_OUT(30 downto 0);
					FPU_MUL_B(31) <= signBitShiftReg(0);
					FPU_MUL_GO <= newMulWaveIsReady(0);
					if (newMulWaveIsReady(0) = '1') then
						barycentricNormalizationCurrentState <= MS_Stage1;
					elsif (newInterpWaveIsReady = "000000") then
						barycentricNormalizationIsIdle <= '1';
					end if;

				when MS_Stage1 =>
					FPU_MUL_B(30 downto 0) <= FPU_CNV0_OUT(30 downto 0);
					FPU_MUL_B(31) <= signBitShiftReg(0);
					FPU_MUL_GO <= '1';
					newInterpWaveIsReady(5) <= '1';
					barycentricNormalizationCurrentState <= MS_Stage0;
			end case;
		end if;
	end process BarycentricNormalization;

	InterpolatorDriver : process(clk)
	begin
		if (rising_edge(clk) ) then
			interpGoSignal <= '0';
			interpolatorDriverIsIdle <= '0';
			interpInputB <= (others => '0');
			interpInputC <= (others => '0');
			interpInputAttr0 <= (others => '0');
			interpInputAttr10 <= (others => '0');
			interpInputAttr20 <= (others => '0');
			BarycentricBCFIFO_PushElement <= '0';

			interpBarycentrics0 <= interpBarycentrics1;
			interpBarycentrics1 <= f32(FPU_MUL_OUT);

			BarycentricBCFIFO_InNewData <= std_logic_vector(interpBarycentrics1 & interpBarycentrics0);

			newRcpWaveIsReady(0) <= newRcpWaveIsReady(1);
			newRcpWaveIsReady(1) <= newRcpWaveIsReady(2);
			newRcpWaveIsReady(2) <= newRcpWaveIsReady(3);
			newRcpWaveIsReady(3) <= newRcpWaveIsReady(4);
			newRcpWaveIsReady(4) <= newRcpWaveIsReady(5);
			newRcpWaveIsReady(5) <= newRcpWaveIsReady(6);
			newRcpWaveIsReady(6) <= newRcpWaveIsReady(7);
			newRcpWaveIsReady(7) <= newRcpWaveIsReady(8);
			newRcpWaveIsReady(8) <= newRcpWaveIsReady(9);
			newRcpWaveIsReady(9) <= newRcpWaveIsReady(10);
			newRcpWaveIsReady(10) <= newRcpWaveIsReady(11);
			newRcpWaveIsReady(11) <= newRcpWaveIsReady(12);
			newRcpWaveIsReady(12) <= newRcpWaveIsReady(13);
			newRcpWaveIsReady(13) <= '0';
			newRcpWaveIsReady(14) <= '0';

			newShiftConvertDepthWaveIsReady(0) <= newShiftConvertDepthWaveIsReady(1);
			newShiftConvertDepthWaveIsReady(1) <= newShiftConvertDepthWaveIsReady(2);
			newShiftConvertDepthWaveIsReady(2) <= newShiftConvertDepthWaveIsReady(3);
			newShiftConvertDepthWaveIsReady(3) <= newShiftConvertDepthWaveIsReady(4);
			newShiftConvertDepthWaveIsReady(4) <= newShiftConvertDepthWaveIsReady(5);
			newShiftConvertDepthWaveIsReady(5) <= newShiftConvertDepthWaveIsReady(6);
			newShiftConvertDepthWaveIsReady(6) <= newShiftConvertDepthWaveIsReady(7);
			newShiftConvertDepthWaveIsReady(7) <= newShiftConvertDepthWaveIsReady(8);
			newShiftConvertDepthWaveIsReady(8) <= newShiftConvertDepthWaveIsReady(9);
			newShiftConvertDepthWaveIsReady(9) <= newShiftConvertDepthWaveIsReady(10);
			newShiftConvertDepthWaveIsReady(10) <= newShiftConvertDepthWaveIsReady(11);
			newShiftConvertDepthWaveIsReady(11) <= newShiftConvertDepthWaveIsReady(12);
			newShiftConvertDepthWaveIsReady(12) <= newShiftConvertDepthWaveIsReady(13);
			newShiftConvertDepthWaveIsReady(13) <= '0';
			newShiftConvertDepthWaveIsReady(14) <= '0';

			case interpolatorDriverCurrentState is
				when IS_StageZ =>
					interpInputB <= interpBarycentrics1;
					interpInputC <= f32(FPU_MUL_OUT);
					interpInputAttr0 <= currentTriData.Z0;
					interpInputAttr10 <= currentTriData.Z10;
					interpInputAttr20 <= currentTriData.Z20;
					interpGoSignal <= newInterpWaveIsReady(0);
					if (newInterpWaveIsReady(0) = '1') then
						newShiftConvertDepthWaveIsReady(13) <= '1';
						DBG_BarycentricBCFIFO <= std_logic_vector(f32(FPU_MUL_OUT) & interpBarycentrics1);
						interpolatorDriverCurrentState <= IS_StageInvW;
					elsif (newRcpWaveIsReady = "000000000000000" and newShiftConvertDepthWaveIsReady = "000000000000000") then
						interpolatorDriverIsIdle <= '1';
					end if;

				when IS_StageInvW =>
					interpInputB <= interpBarycentrics0;
					interpInputC <= interpBarycentrics1;
					interpInputAttr0 <= currentTriData.InvW0;
					interpInputAttr10 <= currentTriData.InvW10;
					interpInputAttr20 <= currentTriData.InvW20;
					interpGoSignal <= '1';

					BarycentricBCFIFO_PushElement <= '1';

					newRcpWaveIsReady(13) <= '1';

					interpolatorDriverCurrentState <= IS_StageZ;
			end case;
		end if;
	end process InterpolatorDriver;

	ReciprocalDriver : process(clk)
	begin
		if (rising_edge(clk) ) then
			FPU_SPEC_A <= interpOutput;
			FPU_SPEC_GO <= newRcpWaveIsReady(0);
			reciprocalDriverIsIdle <= not newRcpWaveIsReady(0);
		end if;
	end process ReciprocalDriver;

	ShiftConvertZ : process(clk)
	begin
		if (rising_edge(clk) ) then
			pixelDepth <= FloatMultiplyBy2_24(FloatSaturate(f32(interpOutput) ) );
			FPU_CNV1_A <= std_logic_vector(pixelDepth);
			FPU_CNV1_GO <= '0';
			shiftConvertZIsIdle <= '0';

			newDepthTestWaveIsReady(0) <= newDepthTestWaveIsReady(1);
			newDepthTestWaveIsReady(1) <= newDepthTestWaveIsReady(2);
			newDepthTestWaveIsReady(2) <= newDepthTestWaveIsReady(3);
			newDepthTestWaveIsReady(3) <= '0';

			case shiftConvertZCurrentState is
				when SC_ShiftZ =>
					if (newShiftConvertDepthWaveIsReady(0) = '1') then
						shiftConvertZCurrentState <= SC_ConvertZ;
					elsif (newDepthTestWaveIsReady = "0000") then
						shiftConvertZIsIdle <= '1';
					end if;

				when SC_ConvertZ =>
					FPU_CNV1_GO <= '1';
					newDepthTestWaveIsReady(3) <= '1';
					shiftConvertZCurrentState <= SC_ShiftZ;
			end case;
		end if;
	end process ShiftConvertZ;

	DepthTestDriver : process(clk)
	begin
		if (rising_edge(clk) ) then
			lastCycleDepthTestValue <= unsigned(FPU_CNV1_OUT(23 downto 0) );
			lastCyclePosX <= unsigned(PixelXYFIFO_OutCurrentData(9 downto 0) );
			lastCyclePosY <= unsigned(PixelXYFIFO_OutCurrentData(25 downto 16) );
			depthTestDriverIsIdle <= '0';

			depthTestResultsReady(0) <= depthTestResultsReady(1);
			depthTestResultsReady(1) <= depthTestResultsReady(2);
			depthTestResultsReady(2) <= depthTestResultsReady(3);
			depthTestResultsReady(3) <= depthTestResultsReady(4);
			depthTestResultsReady(4) <= depthTestResultsReady(5);
			depthTestResultsReady(5) <= depthTestResultsReady(6);
			depthTestResultsReady(6) <= '0';

			passedPixelXYShiftReg(0) <= passedPixelXYShiftReg(1);
			passedPixelXYShiftReg(1) <= passedPixelXYShiftReg(2);
			passedPixelXYShiftReg(2) <= passedPixelXYShiftReg(3);
			passedPixelXYShiftReg(3) <= passedPixelXYShiftReg(4);
			passedPixelXYShiftReg(4) <= passedPixelXYShiftReg(5);
			passedPixelXYShiftReg(5) <= passedPixelXYShiftReg(6);
			passedPixelXYShiftReg(6) <= passedPixelXYShiftReg(7);
			passedPixelXYShiftReg(7) <= passedPixelXYShiftReg(8);
			passedPixelXYShiftReg(8) <= passedPixelXYShiftReg(9);
			passedPixelXYShiftReg(9) <= PixelXYFIFO_OutCurrentData;

			PixelXYFIFO_PopElement <= newDepthTestWaveIsReady(0);

			case depthTestDriverCurrentState is
				when DTS_Issue0 =>
					pixelDepthU24 <= unsigned(FPU_CNV1_OUT(23 downto 0) );
					DEPTH_OutPixelDepth <= FPU_CNV1_OUT(23 downto 0);
					DEPTH_PosX <= PixelXYFIFO_OutCurrentData(9 downto 0);
					DEPTH_PosY <= PixelXYFIFO_OutCurrentData(25 downto 16);
					DEPTH_PixelReady <= newDepthTestWaveIsReady(0);
					if (newDepthTestWaveIsReady(0) = '1') then
						DBG_InterpolatedDepthU24 <= FPU_CNV1_OUT(23 downto 0);
						depthTestDriverCurrentState <= DTS_Issue1;
					elsif (depthTestResultsReady = "0000000") then
						depthTestDriverIsIdle <= '1';
					end if;

				when DTS_Issue1 =>
					DEPTH_OutPixelDepth <= std_logic_vector(lastCycleDepthTestValue);
					DEPTH_PosX <= std_logic_vector(lastCyclePosX);
					DEPTH_PosY <= std_logic_vector(lastCyclePosY);
					DEPTH_PixelReady <= '1';
					depthTestResultsReady(6) <= '1';
					depthTestDriverCurrentState <= DTS_Issue0;
			end case;
		end if;
	end process DepthTestDriver;

	DepthTestProcessResults : process(clk)
	begin
		if (rising_edge(clk) ) then
			depthTestProcessResultsIsIdle <= '0';
			passedPixelColorAndWValueReady(0) <= passedPixelColorAndWValueReady(1);
			passedPixelColorAndWValueReady(1) <= passedPixelColorAndWValueReady(2);
			passedPixelColorAndWValueReady(2) <= '0';

			passedBarycentricBCShiftReg(0) <= passedBarycentricBCShiftReg(1);
			passedBarycentricBCShiftReg(1) <= passedBarycentricBCShiftReg(2);
			passedBarycentricBCShiftReg(2) <= BarycentricBCFIFO_OutCurrentData;

			BarycentricBCFIFO_PopElement <= depthTestResultsReady(0);

			if (depthTestResultsReady(0) = '1') then
				--if (DEPTH_PixelPassedDepthStencilTest = '1' and currentDepthState.ColorWritesEnabled = '1' and currentDepthState.DepthTestEnable = '1') then
					--passedPixelColorAndWValueReady(2) <= '1'; -- Pixel with color passed, output this pixel along down the pipeline
				if (DEPTH_PixelPassedDepthStencilTest = '1' and currentDepthState.ColorWritesEnabled = '0' and currentDepthState.DepthTestEnable = '1' and currentDepthState.StencilWriteEnable = '0') then
					depthOnlyPixelsPassed <= depthOnlyPixelsPassed + 1; -- Count this depth-only pixel as passed (this counter is needed for occlusion queries which often don't render to the color-buffer)
					passedPixelColorAndWValueReady(2) <= '0'; -- Don't actually output this passed pixel further down the pipeline as it doesn't have any color data
				--elsif (currentDepthState.DepthTestEnable = '0') then
					--passedPixelColorAndWValueReady(2) <= '1'; -- Depth testing was disabled, so we don't care what the depth buffer says. Output this pixel anyway!
				--else
					--passedPixelColorAndWValueReady(2) <= '0'; -- We failed the depth/stencil tests, kill this pixel!
				else
					passedPixelColorAndWValueReady(2) <= DEPTH_PixelPassedDepthStencilTest;
				end if;
			elsif (passedPixelColorAndWValueReady = "000") then
				depthTestProcessResultsIsIdle <= '1';
			end if;
		end if;
	end process DepthTestProcessResults;

	OutputProcess : process(clk)
	begin
		if (rising_edge(clk) ) then
			if (outputDataSource = ODS_DepthPipeline) then
				ATTR_FIFO_wr_data <= SerializeAttributeData(MakeStructFromMembers(unsigned(passedPixelXYShiftReg(0)(15 downto 0) ), unsigned(passedPixelXYShiftReg(0)(31 downto 16) ),
					f32(passedBarycentricBCShiftReg(0)(31 downto 0) ), f32(passedBarycentricBCShiftReg(0)(63 downto 32) ),
					f32(FPU_SPEC_OUT) ) );
				DBG_Message <= passedPixelXYShiftReg(0)(15 downto 0);
				DBG_MessageData <= passedPixelXYShiftReg(0)(31 downto 16);
			else
				ATTR_FIFO_wr_data <= "--------------------------------" & -- PixelW
					"--------------------------------" & "--------------------------------" & -- Normalized Barycentrics B and C
					std_logic_vector(storedPixelY) & std_logic_vector(storedPixelX);
				DBG_Message <= std_logic_vector(storedPixelX);
				DBG_MessageData <= std_logic_vector(storedPixelY);
			end if;

			ATTR_FIFO_wr_en <= outputProcessGoSignal;
			DBG_NewMessage <= outputProcessGoSignal;
			outputProcessIsIdle <= not outputProcessGoSignal;
		end if;
	end process;

end Behavioral;
