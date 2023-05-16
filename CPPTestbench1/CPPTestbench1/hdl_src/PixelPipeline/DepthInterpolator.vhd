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
	Port ( clk : in STD_LOGIC;

	-- TriWorkCache per-triangle interface begin
		TRICACHE_inBarycentricInverse : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inZ0 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inZ10 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inZ20 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inInvW0 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inInvW10 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inInvW20 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT0X : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT0Y : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT10X : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT10Y : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT20X : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT20Y : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inColorRGBA0 : in STD_LOGIC_VECTOR(127 downto 0);
		TRICACHE_inColorRGBA10 : in STD_LOGIC_VECTOR(127 downto 0);
		TRICACHE_inColorRGBA20 : in STD_LOGIC_VECTOR(127 downto 0);

		TRICACHE_CurrentSlotIndex : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		TRICACHE_SignalSlotComplete : out STD_LOGIC := '0';
	-- TriWorkCache per-triangle interface end

	-- Rasterizer Output per-pixel interface begin
		RASTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR(32+32+16+16 - 1 downto 0);
		RASTOUT_FIFO_empty : in STD_LOGIC;
		RASTOUT_FIFO_rd_en : out STD_LOGIC := '0';
	-- Rasterizer Output per-pixel interface end

	-- Depth Interpolator State Block interface begin
		STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR(DEPTH_INTERPOLATOR_STATE_SIZE_BITS-1 downto 0);
		STATE_NextDrawID : in STD_LOGIC_VECTOR(15 downto 0);
		STATE_StateIsValid : in STD_LOGIC;
		STATE_ConsumeStateSlot : out STD_LOGIC := '0';
	-- Depth Interpolator State Block interface end

	-- FPU interfaces begin
		FPU_A : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_B : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FPU_Mode : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		FPU_ISHFT_GO : out STD_LOGIC := '0'; -- Unused
		FPU_IMUL_GO : out STD_LOGIC := '0';
		FPU_IADD_GO : out STD_LOGIC := '0';
		FPU_ICMP_GO : out STD_LOGIC := '0'; -- Unused
		FPU_ICNV_GO : out STD_LOGIC := '0';
		FPU_ISPEC_GO : out STD_LOGIC := '0';
		FPU_IBIT_GO : out STD_LOGIC := '0'; -- Unused
		FPU_OUT : in STD_LOGIC_VECTOR(31 downto 0);
	-- FPU interfaces end

	-- Depth Buffer interface begin
		DEPTH_PixelReady : out STD_LOGIC := '0';
		DEPTH_PosX : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		DEPTH_PosY : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		DEPTH_OutPixelDepth : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		DEPTH_PixelPassedDepthTest : in STD_LOGIC;
		DEPTH_PixelFailedDepthTest : in STD_LOGIC;

		DEPTH_SetDepthParams : out STD_LOGIC := '0';
		DEPTH_DepthWriteEnable : out STD_LOGIC := '0';
		DEPTH_DepthFunction : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		DEPTH_DepthIsIdle : in STD_LOGIC;
	-- Depth Buffer interface end

	-- Attribute Interpolator interface begin
		ATTR_ReadyForNewPixel : in STD_LOGIC;
		ATTR_NewPixelValid : out STD_LOGIC := '0';
		ATTR_PosX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		ATTR_PosY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		ATTR_TX0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_TX10 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_TX20 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_TY0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_TY10 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_TY20 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_VC0 : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		ATTR_VC10 : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		ATTR_VC20 : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		ATTR_NormalizedBarycentricB : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_NormalizedBarycentricC : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_OutPixelW : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Attribute Interpolator interface end

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
		DBG_DepthInterpolator_State : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
		DBG_RastBarycentricB : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RastBarycentricC : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_InterpolatedDepthU24 : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0')
		);
end DepthInterpolator;

architecture Behavioral of DepthInterpolator is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO EMPTY";

constant noperspective : STD_LOGIC := '1';

type depthInterpStateType is 
(
	waitingForRead, -- 0

	-- Convert our input barycentrics from int32 to float32
	barycentricConversion0, -- 1
	barycentricConversion1, -- 2
	barycentricConversion2, -- 3
	barycentricConversion3, -- 4
	barycentricConversion4, -- 5
	barycentricConversion5, -- 6

	-- Normalize our barycentrics by multiplying the [0.0f, 16777215.0f] values by the barycentric normalization factor (computed by the TriSetup block previously) to
	-- get them into the [0.0f, 1.0f] range.
	barycentricNormalization0, -- 7
	barycentricNormalization1, -- 8
	barycentricNormalization2, -- 9
	barycentricNormalization3, -- 10
	barycentricNormalization4, -- 11
	barycentricNormalization5, -- 12
	barycentricNormalization6, -- 13
	barycentricNormalization7, -- 14

	-- Multiply the normalized barycentrics with the inverseZ (1.0f/zN) values
	barycentricMultiply0, -- 15
	barycentricMultiply1, -- 16
	barycentricMultiply2, -- 17
	barycentricMultiply3, -- 18
	barycentricMultiply4, -- 19
	barycentricMultiply5, -- 20
	barycentricMultiply6, -- 21
	barycentricMultiply7, -- 22
	barycentricMultiply8, -- 23
	barycentricMultiply9, -- 24

	-- Sum the products together to complete the dot product
	barycentricDotProductSums0, -- 25
	barycentricDotProductSums1, -- 26
	barycentricDotProductSums2, -- 27
	barycentricDotProductSums3, -- 28
	barycentricDotProductSums4, -- 29
	barycentricDotProductSums5, -- 30
	barycentricDotProductSums6, -- 31
	barycentricDotProductSums7, -- 32
	barycentricDotProductSums8, -- 33
	barycentricDotProductSums9, -- 34

	-- Take the dot product (dot(normbary.abc, Z.xyz) ) to yield the per-pixel depth value and 
	-- take the inverse dot product (1.0f / (dot(normbary.abc, invW.xyz) ) ) to yield the per-pixel W value as a float32
	barycentricDotProductRecip0, -- 35
	barycentricDotProductRecip1, -- 36
	barycentricDotProductRecip2, -- 37
	barycentricDotProductRecip3, -- 38
	barycentricDotProductRecip4, -- 39
	barycentricDotProductRecip5, -- 40
	barycentricDotProductRecip6, -- 41
	barycentricDotProductRecip7, -- 42
	barycentricDotProductRecip8, -- 43
	barycentricDotProductRecip9, -- 44
	barycentricDotProductRecip10, -- 45
	barycentricDotProductRecip11, -- 46
	barycentricDotProductRecip12, -- 47
	barycentricDotProductRecip13, -- 48
	barycentricDotProductRecip14, -- 49
	barycentricDotProductRecip15, -- 50
	barycentricDotProductRecip16, -- 51

	-- If depth testing is enabled, perform the depth test now. Otherwise, skip these stages entirely.
	depthTestState0, -- 52
	depthTestState1, -- 53
	depthTestState2, -- 54
	depthTestState3, -- 55
	depthTestState4, -- 56
	depthTestState5, -- 57
	depthTestState6, -- 58
	depthTestState7, -- 59
	depthTestState8, -- 60
	depthTestState9, -- 61
	depthTestState10, -- 62

	-- When it's ready we can send the now depth-test-passed pixel off to the next block for attribute interpolation
	sendPixelForAttrInterpolation, -- 63

	setNewPrimitiveSlot, -- 64
	signalPrimitiveComplete, -- 65
	signalNewDrawEventID, -- 66
	signalTerminateDrawEventID, -- 67
	setDepthState -- 68
);

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

signal currentDepthState : sDepthInterpolatorState := DEFAULT_DEPTH_INTERPOLATOR_STATE;

signal newPixelValid : std_logic := '0';

signal storedPixelX : unsigned(15 downto 0) := (others => '0');
signal storedPixelY : unsigned(15 downto 0) := (others => '0');
signal currentDrawEventID : unsigned(15 downto 0) := (others => '0');

signal tempMultBarycentricB : signed(31 downto 0) := (others => '0'); -- int32 format of the input barycentric
signal tempMultBarycentricC : signed(31 downto 0) := (others => '0'); -- int32 format of the input barycentric
signal tempMultBarycentricBIsNegative : std_logic := '0'; -- Save off the sign bit for restoring later
signal tempMultBarycentricCIsNegative : std_logic := '0';
signal tempFloatBarycentricB : f32 := (others => '0'); -- float32 format of the input barycentric
signal tempFloatBarycentricC : f32 := (others => '0'); -- float32 format of the input barycentric

signal normalizedBarycentricB : f32 := (others => '0'); -- float32 format of barycentricNormalizeFactor * float(barycentricB)
signal normalizedBarycentricC : f32 := (others => '0'); -- float32 format of barycentricNormalizeFactor * float(barycentricC)

signal tempZDP3B : f32 := (others => '0'); -- float32 format of (z1 * normalizedBarycentricB)
signal tempZDP3C : f32 := (others => '0'); -- float32 format of (z2 * normalizedBarycentricC)

signal tempInvWDP3B : f32 := (others => '0'); -- float32 format of (1/w1 * normalizedBarycentricB)
signal tempInvWDP3C : f32 := (others => '0'); -- float32 format of (1/w2 * normalizedBarycentricC)

signal pixelDepth : f32 := (others => '0'); -- float32 format (0.0f to 1.0f) pixel depth value
signal pixelW : f32 := (others => '0'); -- float32 format (0.0f to 1.0f) pixel W value
signal pixelDepthU24 : unsigned(23 downto 0) := (others => '0');

signal storedBarycentricInverse : f32 := (others => '0'); -- float32 format (this is 1.0f / twiceTriangleArea)
signal storedZ0 : f32 := (others => '0'); -- float32 format (this is z0)
signal storedZ10 : f32 := (others => '0'); -- float32 format (this is z1 - z0)
signal storedZ20 : f32 := (others => '0'); -- float32 format (this is z2 - z0)
signal storedInvW0 : f32 := (others => '0'); -- float32 format (this is 1.0f / w0)
signal storedInvW10 : f32 := (others => '0'); -- float32 format (this is 1.0f / w1)
signal storedInvW20 : f32 := (others => '0'); -- float32 format (this is 1.0f / w2)
signal storedTX0 : f32 := (others => '0'); -- float32 format texcoords
signal storedTY0 : f32 := (others => '0'); -- float32 format texcoords
signal storedTX10 : f32 := (others => '0'); -- float32 format texcoords
signal storedTY10 : f32 := (others => '0'); -- float32 format texcoords
signal storedTX20 : f32 := (others => '0'); -- float32 format texcoords
signal storedTY20 : f32 := (others => '0'); -- float32 format texcoords
signal storedColorRGBA0 : unsigned(127 downto 0) := (others => '0');
signal storedColorRGBA10 : unsigned(127 downto 0) := (others => '0');
signal storedColorRGBA20 : unsigned(127 downto 0) := (others => '0');

signal storedDbgBarycentricB : signed(31 downto 0) := (others => '0');
signal storedDbgBarycentricC : signed(31 downto 0) := (others => '0');

signal readFromFifo : std_logic := '0';

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

begin

RASTOUT_FIFO_rd_en <= readFromFifo;
ATTR_NewPixelValid <= newPixelValid;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);

DBG_DepthInterpolator_State <= std_logic_vector(to_unsigned(depthInterpStateType'pos(currentState), 7) );
DBG_RastBarycentricB <= std_logic_vector(storedDbgBarycentricB);
DBG_RastBarycentricC <= std_logic_vector(storedDbgBarycentricC);

	StatsProcess : process(clk)
	begin
		if (rising_edge(clk) ) then
			STAT_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);
			case currentState is
				when waitingForRead =>
					statCyclesIdle <= statCyclesIdle + 1;

				when sendPixelForAttrInterpolation | signalNewDrawEventID | signalTerminateDrawEventID =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when others =>
					statCyclesWorking <= statCyclesWorking + 1;
			end case;
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

			case currentState is
				when waitingForRead =>
					newPixelValid <= '0'; -- Deassert after one clock cycle
					TRICACHE_SignalSlotComplete <= '0'; -- Deassert after one clock cycle
					DEPTH_PixelReady <= '0';

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
					storedBarycentricInverse <= unsigned(TRICACHE_inBarycentricInverse);
					storedZ0 <= f32(TRICACHE_inZ0);
					storedZ10 <= f32(TRICACHE_inZ10);
					storedZ20 <= f32(TRICACHE_inZ20);
					storedInvW0 <= f32(TRICACHE_inInvW0);
					storedInvW10 <= f32(TRICACHE_inInvW10);
					storedInvW20 <= f32(TRICACHE_inInvW20);
					storedTX0 <= f32(TRICACHE_inT0X);
					storedTY0 <= f32(TRICACHE_inT0Y);
					storedTX10 <= f32(TRICACHE_inT10X);
					storedTY10 <= f32(TRICACHE_inT10Y);
					storedTX20 <= f32(TRICACHE_inT20X);
					storedTY20 <= f32(TRICACHE_inT20Y);
					storedColorRGBA0 <= unsigned(TRICACHE_inColorRGBA0);
					storedColorRGBA10 <= unsigned(TRICACHE_inColorRGBA10);
					storedColorRGBA20 <= unsigned(TRICACHE_inColorRGBA20);

					if (STATE_StateIsValid = '1' and currentDrawEventID = unsigned(STATE_NextDrawID) ) then
						STATE_ConsumeStateSlot <= '1';

						currentDepthState <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID);
						currentState <= setDepthState;
					elsif (RASTOUT_FIFO_empty = '0') then
						if (IsSpecialPixelMessage(GetPixelCoordinateX(unsigned(RASTOUT_FIFO_rd_data) ) ) ) then
							if (tempPixelX(eSpecialPixelCodeBits'pos(TerminateCurrentPrimSlot) ) = '1') then -- "terminate primitive slot"
								currentState <= signalPrimitiveComplete;
							end if;
							if (tempPixelX(eSpecialPixelCodeBits'pos(SetNewPrimSlot) ) = '1') then -- "set new primitive slot"
								currentState <= setNewPrimitiveSlot;
							end if;
							if (tempPixelX(eSpecialPixelCodeBits'pos(SetNewDrawEventID) ) = '1') then -- "set new draw event ID"
								currentDrawEventID <= GetPixelCoordinateY(unsigned(RASTOUT_FIFO_rd_data) );
								currentState <= signalNewDrawEventID;
							end if;
							if (tempPixelX(eSpecialPixelCodeBits'pos(TerminateCurrentDrawEventID) ) = '1') then -- "terminate current draw event ID"
								currentState <= signalTerminateDrawEventID;
							end if;
						else
							currentState <= barycentricConversion0;
						end if;

						readFromFifo <= '1'; -- Signal the read request
					else
						if (readFromFifo = '0') then
							CMD_IsIdle <= '1';
						end if;

						readFromFifo <= '0';
					end if;

				when barycentricConversion0 =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					FPU_ICNV_GO <= '1';
					FPU_A <= std_logic_vector(Int32toUint32(tempMultBarycentricB, tempMultBarycentricBIsNegative) );
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(U32_to_F), 3) );
					currentState <= barycentricConversion1;

				when barycentricConversion1 =>
					FPU_ICNV_GO <= '1';
					FPU_A <= std_logic_vector(Int32toUint32(tempMultBarycentricC, tempMultBarycentricCIsNegative) );
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(U32_to_F), 3) );
					currentState <= barycentricConversion2;

				when barycentricConversion2 =>
					FPU_ICNV_GO <= '0';
					currentState <= barycentricConversion3;

				when barycentricConversion3 =>
					currentState <= barycentricConversion4;

				when barycentricConversion4 =>
					tempFloatBarycentricB(31) <= tempMultBarycentricBIsNegative;
					tempFloatBarycentricB(30 downto 0) <= unsigned(FPU_OUT(30 downto 0) );
					currentState <= barycentricConversion5;

				when barycentricConversion5 =>
					tempFloatBarycentricC(31) <= tempMultBarycentricCIsNegative;
					tempFloatBarycentricC(30 downto 0) <= unsigned(FPU_OUT(30 downto 0) );
					currentState <= barycentricNormalization0;

				when barycentricNormalization0 =>
					FPU_A <= std_logic_vector(storedBarycentricInverse);
					FPU_B <= std_logic_vector(tempFloatBarycentricB);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricNormalization1;

				when barycentricNormalization1 =>
					FPU_A <= std_logic_vector(storedBarycentricInverse);
					FPU_B <= std_logic_vector(tempFloatBarycentricC);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricNormalization2;

				when barycentricNormalization2 =>
					FPU_IMUL_GO <= '0';
					currentState <= barycentricNormalization3;

				when barycentricNormalization3 =>
					currentState <= barycentricNormalization4;

				when barycentricNormalization4 =>
					currentState <= barycentricNormalization5;

				when barycentricNormalization5 =>
					currentState <= barycentricNormalization6;

				when barycentricNormalization6 =>
					normalizedBarycentricB <= f32(FPU_OUT);
					currentState <= barycentricNormalization7;

				when barycentricNormalization7 =>
					normalizedBarycentricC <= f32(FPU_OUT);
					currentState <= barycentricMultiply0;

				when barycentricMultiply0 =>
					FPU_A <= std_logic_vector(normalizedBarycentricB);
					FPU_B <= std_logic_vector(storedZ10);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricMultiply1;

				when barycentricMultiply1 =>
					FPU_A <= std_logic_vector(normalizedBarycentricB);
					FPU_B <= std_logic_vector(storedInvW10);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricMultiply2;

				when barycentricMultiply2 =>
					FPU_A <= std_logic_vector(normalizedBarycentricC);
					FPU_B <= std_logic_vector(storedZ20);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricMultiply3;

				when barycentricMultiply3 =>
					FPU_A <= std_logic_vector(normalizedBarycentricC);
					FPU_B <= std_logic_vector(storedInvW20);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricMultiply4;

				when barycentricMultiply4 =>
					FPU_IMUL_GO <= '0';
					currentState <= barycentricMultiply5;

				when barycentricMultiply5 =>
					currentState <= barycentricMultiply6;

				when barycentricMultiply6 =>
					tempZDP3B <= f32(FPU_OUT);
					currentState <= barycentricMultiply7;

				when barycentricMultiply7 =>
					tempInvWDP3B <= f32(FPU_OUT);
					currentState <= barycentricMultiply8;

				when barycentricMultiply8 =>
					tempZDP3C <= f32(FPU_OUT);
					currentState <= barycentricMultiply9;

				when barycentricMultiply9 =>
					tempInvWDP3C <= f32(FPU_OUT);
					currentState <= barycentricDotProductSums0;

				when barycentricDotProductSums0 =>
					FPU_A <= std_logic_vector(tempZDP3B);
					FPU_B <= std_logic_vector(tempZDP3C);
					FPU_IADD_GO <= '1';
					currentState <= barycentricDotProductSums1;

				when barycentricDotProductSums1 =>
					FPU_A <= std_logic_vector(tempInvWDP3B);
					FPU_B <= std_logic_vector(tempInvWDP3C);
					FPU_IADD_GO <= '1';
					currentState <= barycentricDotProductSums2;

				when barycentricDotProductSums2 =>
					FPU_IADD_GO <= '0';
					currentState <= barycentricDotProductSums3;

				when barycentricDotProductSums3 =>
					currentState <= barycentricDotProductSums4;

				when barycentricDotProductSums4 =>
					currentState <= barycentricDotProductSums5;

				when barycentricDotProductSums5 =>
					FPU_A <= FPU_OUT;
					FPU_B <= std_logic_vector(storedZ0);
					FPU_IADD_GO <= '1';
					currentState <= barycentricDotProductSums6;

				when barycentricDotProductSums6 =>
					FPU_A <= FPU_OUT;
					FPU_B <= std_logic_vector(storedInvW0);
					FPU_IADD_GO <= '1';
					currentState <= barycentricDotProductSums7;

				when barycentricDotProductSums7 =>
					FPU_IADD_GO <= '0';
					currentState <= barycentricDotProductSums8;

				when barycentricDotProductSums8 =>
					currentState <= barycentricDotProductSums9;

				when barycentricDotProductSums9 =>
					currentState <= barycentricDotProductRecip0;

				when barycentricDotProductRecip0 =>
					pixelDepth <= f32(FPU_OUT);
					currentState <= barycentricDotProductRecip1;

				when barycentricDotProductRecip1 =>
					FPU_A <= FPU_OUT;
					FPU_ISPEC_GO <= '1';
					pixelDepth <= FloatSaturate(pixelDepth);
					currentState <= barycentricDotProductRecip2;

				when barycentricDotProductRecip2 =>
					FPU_ISPEC_GO <= '0';
					pixelDepth <= FloatMultiplyBy2_24(pixelDepth);
					currentState <= barycentricDotProductRecip3;

				when barycentricDotProductRecip3 =>
					currentState <= barycentricDotProductRecip4;

				when barycentricDotProductRecip4 =>
					currentState <= barycentricDotProductRecip5;

				when barycentricDotProductRecip5 =>
					currentState <= barycentricDotProductRecip6;

				when barycentricDotProductRecip6 =>
					currentState <= barycentricDotProductRecip7;

				when barycentricDotProductRecip7 =>
					currentState <= barycentricDotProductRecip8;

				when barycentricDotProductRecip8 =>
					currentState <= barycentricDotProductRecip9;

				when barycentricDotProductRecip9 =>
					currentState <= barycentricDotProductRecip10;

				when barycentricDotProductRecip10 =>
					currentState <= barycentricDotProductRecip11;

				when barycentricDotProductRecip11 =>
					currentState <= barycentricDotProductRecip12;

				when barycentricDotProductRecip12 =>
					currentState <= barycentricDotProductRecip13;

				when barycentricDotProductRecip13 =>
					currentState <= barycentricDotProductRecip14;

				when barycentricDotProductRecip14 =>
					currentState <= barycentricDotProductRecip15;

				when barycentricDotProductRecip15 =>
					currentState <= barycentricDotProductRecip16;

				when barycentricDotProductRecip16 =>
					pixelW <= f32(FPU_OUT); -- Do *not* saturate the interpolated per-pixel W-value! It is supposed to be allowed outside of the [0.0f, 1.0f] range.
					FPU_A <= std_logic_vector(pixelDepth);
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(F_to_U24_RoundNearestEven), 3) );
					FPU_ICNV_GO <= '1';
					if (currentDepthState.DepthTestEnable = '1') then
						currentState <= depthTestState0;
					else
						currentState <= sendPixelForAttrInterpolation;
					end if;

				when depthTestState0 =>
					FPU_ICNV_GO <= '0';
					currentState <= depthTestState1;

				when depthTestState1 =>
					currentState <= depthTestState2;

				when depthTestState2 =>
					currentState <= depthTestState3;

				when depthTestState3 =>
					pixelDepthU24 <= unsigned(FPU_OUT(23 downto 0) );
					DBG_InterpolatedDepthU24 <= FPU_OUT(23 downto 0);

					DEPTH_OutPixelDepth <= FPU_OUT(23 downto 0);
					DEPTH_PosX <= std_logic_vector(storedPixelX(9 downto 0) );
					DEPTH_PosY <= std_logic_vector(storedPixelY(9 downto 0) );
					DEPTH_PixelReady <= '1';
					currentState <= depthTestState4;

				when depthTestState4 =>
					DEPTH_PixelReady <= '0';
					currentState <= depthTestState5;

				when depthTestState5 =>
					currentState <= depthTestState6;

				when depthTestState6 =>
					currentState <= depthTestState7;

				when depthTestState7 =>
					currentState <= depthTestState8;

				when depthTestState8 =>
					currentState <= depthTestState9;

				when depthTestState9 =>
					currentState <= depthTestState10;

				when depthTestState10 =>
					if (DEPTH_PixelPassedDepthTest = '1' and currentDepthState.ColorWritesEnabled = '1') then
						currentState <= sendPixelForAttrInterpolation;
					else
						currentState <= waitingForRead; -- We failed the depth test, kill this pixel!
					end if;

				when sendPixelForAttrInterpolation =>
					FPU_ICNV_GO <= '0';
					ATTR_PosX <= std_logic_vector(storedPixelX);
					ATTR_PosY <= std_logic_vector(storedPixelY);
					ATTR_TX0 <= std_logic_vector(storedTX0);
					ATTR_TX10 <= std_logic_vector(storedTX10);
					ATTR_TX20 <= std_logic_vector(storedTX20);
					ATTR_TY0 <= std_logic_vector(storedTY0);
					ATTR_TY10 <= std_logic_vector(storedTY10);
					ATTR_TY20 <= std_logic_vector(storedTY20);
					ATTR_VC0 <= std_logic_vector(storedColorRGBA0);
					ATTR_VC10 <= std_logic_vector(storedColorRGBA10);
					ATTR_VC20 <= std_logic_vector(storedColorRGBA20);
					ATTR_NormalizedBarycentricB <= std_logic_vector(normalizedBarycentricB);
					ATTR_NormalizedBarycentricC <= std_logic_vector(normalizedBarycentricC);
					ATTR_OutPixelW <= std_logic_vector(pixelW);

					if (ATTR_ReadyForNewPixel = '1' and newPixelValid = '1') then
						newPixelValid <= '0';

						currentState <= waitingForRead;
					else
						newPixelValid <= '1';
					end if;

				when setNewPrimitiveSlot =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					TRICACHE_CurrentSlotIndex <= std_logic_vector(storedPixelY(2 downto 0) );
					currentState <= waitingForRead;

				when signalPrimitiveComplete =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					TRICACHE_CurrentSlotIndex <= std_logic_vector(storedPixelY(2 downto 0) ); -- This set isn't really necessary...
					TRICACHE_SignalSlotComplete <= '1';
					currentState <= waitingForRead;

				when signalNewDrawEventID =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					ATTR_PosX <= std_logic_vector(PixelMsg_SetNewDrawEventID);
					ATTR_PosY <= std_logic_vector(currentDrawEventID);
					if (ATTR_ReadyForNewPixel = '1' and newPixelValid = '1') then
						newPixelValid <= '0';

						currentState <= waitingForRead;
					else
						newPixelValid <= '1';
					end if;

				when signalTerminateDrawEventID =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					ATTR_PosX <= std_logic_vector(PixelMsg_TermCurrentDrawEventID);
					ATTR_PosY <= std_logic_vector(currentDrawEventID);
					if (ATTR_ReadyForNewPixel = '1' and newPixelValid = '1') then
						newPixelValid <= '0';

						currentState <= waitingForRead;
					else
						newPixelValid <= '1';
					end if;

				when setDepthState =>
					if (DEPTH_DepthIsIdle = '1') then -- Wait for the depth block to fully drain its pipeline before we change its state
						DEPTH_SetDepthParams <= '1';
						DEPTH_DepthWriteEnable <= currentDepthState.DepthWriteEnable;
						DEPTH_DepthFunction <= std_logic_vector(to_unsigned(eCmpFunc'pos(currentDepthState.DepthCompareFunction), 3) );
						currentState <= waitingForRead;
					end if;

			end case;
		end if;
	end process MainProcess;

end Behavioral;
