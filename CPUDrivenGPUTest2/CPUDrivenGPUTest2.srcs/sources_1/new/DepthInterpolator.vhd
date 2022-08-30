library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;

entity DepthInterpolator is
	Port ( clk : in STD_LOGIC;

	-- TriWorkCache per-triangle interface begin
		TRICACHE_inBarycentricInverse : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inInvZ0 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inInvZ1 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inInvZ2 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inT0X : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inT0Y : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inT1X : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inT1Y : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inT2X : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inT2Y : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inColorRGBA0 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inColorRGBA1 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inColorRGBA2 : in STD_LOGIC_VECTOR(31 downto 0);

		TRICACHE_CurrentSlotIndex : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
		TRICACHE_SignalSlotComplete : out STD_LOGIC := '0';
	-- TriWorkCache per-triangle interface end

	-- Rasterizer Output per-pixel interface begin
		RASTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR(32+32+32+16+16 - 1 downto 0);
		RASTOUT_FIFO_empty : in STD_LOGIC;
		RASTOUT_FIFO_rd_en : out STD_LOGIC := '0';
	-- Rasterizer Output per-pixel interface end

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

	-- Depth Buffer interface begin
		DEPTH_PixelReady : out STD_LOGIC := '0';
		DEPTH_PosX : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		DEPTH_PosY : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		DEPTH_OutPixelDepth : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		DEPTH_PixelPassedDepthTest : in STD_LOGIC;
		DEPTH_PixelFailedDepthTest : in STD_LOGIC;
		DEPTH_DepthTestEnabled : in STD_LOGIC;
	-- Depth Buffer interface end

	-- Attribute Interpolator interface begin
		ATTR_ReadyForNewPixel : in STD_LOGIC;
		ATTR_NewPixelValid : out STD_LOGIC := '0';
		ATTR_PosX : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		ATTR_PosY : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		ATTR_TX0 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		ATTR_TX1 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		ATTR_TX2 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		ATTR_TY0 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		ATTR_TY1 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		ATTR_TY2 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		ATTR_VC0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_VC1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_VC2 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_NormalizedBarycentricDivZ0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_NormalizedBarycentricDivZ1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_NormalizedBarycentricDivZ2 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		ATTR_OutPixelDepth : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Attribute Interpolator interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_DepthInterpolator_State : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
		DBG_RastBarycentricA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RastBarycentricB : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RastBarycentricC : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
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
	init, -- 0
	waitingForRead, -- 1

	-- Convert our input barycentrics from int32 to float32
	barycentricConversion0, -- 2
	barycentricConversion1, -- 3
	barycentricConversion2, -- 4
	barycentricConversion3, -- 5
	barycentricConversion4, -- 6
	barycentricConversion5, -- 7
	barycentricConversion6, -- 8

	-- Normalize our barycentrics by multiplying the [0.0f, 16777216.0f] values by the barycentric normalization factor (computed by the TriSetup block previously) to
	-- get them into the [0.0f, 1.0f] range.
	barycentricNormalization0, -- 9
	barycentricNormalization1, -- 10
	barycentricNormalization2, -- 11
	barycentricNormalization3, -- 12
	barycentricNormalization4, -- 13
	barycentricNormalization5, -- 14
	barycentricNormalization6, -- 15
	barycentricNormalization7, -- 16
	barycentricNormalization8, -- 17

	-- Multiply the normalized barycentrics with the inverseZ (1.0f/zN) values
	barycentricMultiply0, -- 18
	barycentricMultiply1, -- 19
	barycentricMultiply2, -- 20
	barycentricMultiply3, -- 21
	barycentricMultiply4, -- 22
	barycentricMultiply5, -- 23
	barycentricMultiply6, -- 24
	barycentricMultiply7, -- 25
	barycentricMultiply8, -- 26
	barycentricMultiply9, -- 27

	-- Sum the products together to complete the dot product
	barycentricDotProductSums0, -- 28
	barycentricDotProductSums1, -- 29
	barycentricDotProductSums2, -- 30
	barycentricDotProductSums3, -- 31
	barycentricDotProductSums4, -- 32
	barycentricDotProductSums5, -- 33
	barycentricDotProductSums6, -- 34
	barycentricDotProductSums7, -- 35
	barycentricDotProductSums8, -- 36
	barycentricDotProductSums9, -- 37

	-- Take the reciprocal of the dot product (1.0f / dot(normbary.abc, inverseZ.xyz) ) to yield the per-pixel depth value as a float32
	barycentricDotProductRecip0, -- 38
	barycentricDotProductRecip1, -- 39
	barycentricDotProductRecip2, -- 40
	barycentricDotProductRecip3, -- 41
	barycentricDotProductRecip4, -- 42
	barycentricDotProductRecip5, -- 43
	barycentricDotProductRecip6, -- 44
	barycentricDotProductRecip7, -- 45
	barycentricDotProductRecip8, -- 46
	barycentricDotProductRecip9, -- 47
	barycentricDotProductRecip10, -- 48
	barycentricDotProductRecip11, -- 49
	barycentricDotProductRecip12, -- 50
	barycentricDotProductRecip13, -- 51
	barycentricDotProductRecip14, -- 52
	barycentricDotProductRecip15, -- 53

	-- If depth testing is enabled, perform the depth test now. Otherwise, skip these stages entirely.
	depthTestState0, -- 54
	depthTestState1, -- 55
	depthTestState2, -- 56
	depthTestState3, -- 57
	depthTestState4, -- 58
	depthTestState5, -- 59
	depthTestState6, -- 60
	depthTestState7, -- 61

	-- When it's ready we can send the now depth-test-passed pixel off to the next block for attribute interpolation
	sendPixelForAttrInterpolation, -- 62

	setNewPrimitiveSlot, -- 63
	signalPrimitiveComplete -- 64
);

pure function isSpecialReadPacket(rd_data : STD_LOGIC_VECTOR(32+32+32+16+16 - 1 downto 0) ) return std_logic is
begin
	if (rd_data(32*3+16-1 downto 32*3) = x"FFFF" or
		rd_data(32*3+16-1 downto 32*3) = x"FFFE") then
		return '1';
	else
		return '0';
	end if;
end function;

pure function Int32toUint32(intVal : signed(31 downto 0); signBit : std_logic) return unsigned is
begin
	if (signBit = '0') then
		return '0' & unsigned(intVal(30 downto 0) );
	else
		return unsigned(-intVal);
	end if;
end function;

signal currentState : depthInterpStateType := init;

signal storedPixelX : unsigned(15 downto 0) := (others => '0');
signal storedPixelY : unsigned(15 downto 0) := (others => '0');

signal tempMultBarycentricA : signed(31 downto 0) := (others => '0'); -- int32 format of the input barycentric
signal tempMultBarycentricB : signed(31 downto 0) := (others => '0'); -- int32 format of the input barycentric
signal tempMultBarycentricC : signed(31 downto 0) := (others => '0'); -- int32 format of the input barycentric
signal tempMultBarycentricAIsNegative : std_logic := '0'; -- Save off the sign bit for restoring later
signal tempMultBarycentricBIsNegative : std_logic := '0';
signal tempMultBarycentricCIsNegative : std_logic := '0';
signal tempFloatBarycentricA : unsigned(31 downto 0) := (others => '0'); -- float32 format of the input barycentric
signal tempFloatBarycentricB : unsigned(31 downto 0) := (others => '0'); -- float32 format of the input barycentric
signal tempFloatBarycentricC : unsigned(31 downto 0) := (others => '0'); -- float32 format of the input barycentric

signal normalizedBarycentricA : unsigned(31 downto 0) := (others => '0'); -- float32 format of barycentricNormalizeFactor * float(barycentricA)
signal normalizedBarycentricB : unsigned(31 downto 0) := (others => '0'); -- float32 format of barycentricNormalizeFactor * float(barycentricB)
signal normalizedBarycentricC : unsigned(31 downto 0) := (others => '0'); -- float32 format of barycentricNormalizeFactor * float(barycentricC)

signal tempInvZDP3A : unsigned(31 downto 0) := (others => '0'); -- float32 format of (1/z0 * normalizedBarycentricA)
signal tempInvZDP3B : unsigned(31 downto 0) := (others => '0'); -- float32 format of (1/z0 * normalizedBarycentricB)
signal tempInvZDP3C : unsigned(31 downto 0) := (others => '0'); -- float32 format of (1/z0 * normalizedBarycentricC)

signal pixelDepth : unsigned(31 downto 0) := (others => '0'); -- float32 format (0.0f to 1.0f) pixel depth value

signal storedBarycentricInverse : unsigned(31 downto 0) := (others => '0'); -- float32 format (this is 1.0f / twiceTriangleArea)
signal storedInvZ0 : unsigned(31 downto 0) := (others => '0'); -- float32 format (this is 1.0f / z0)
signal storedInvZ1 : unsigned(31 downto 0) := (others => '0'); -- float32 format (this is 1.0f / z1)
signal storedInvZ2 : unsigned(31 downto 0) := (others => '0'); -- float32 format (this is 1.0f / z2)
signal storedTX0 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedTY0 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedTX1 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedTY1 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedTX2 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedTY2 : unsigned(15 downto 0) := (others => '0'); -- half (float16) format texcoords
signal storedColorRGBA0 : unsigned(31 downto 0) := (others => '0');
signal storedColorRGBA1 : unsigned(31 downto 0) := (others => '0');
signal storedColorRGBA2 : unsigned(31 downto 0) := (others => '0');

signal storedDbgBarycentricA : signed(31 downto 0) := (others => '0');
signal storedDbgBarycentricB : signed(31 downto 0) := (others => '0');
signal storedDbgBarycentricC : signed(31 downto 0) := (others => '0');

signal readFromFifo : std_logic := '0';

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

begin

RASTOUT_FIFO_rd_en <= readFromFifo;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);

DBG_DepthInterpolator_State <= std_logic_vector(to_unsigned(depthInterpStateType'pos(currentState), 7) );
DBG_RastBarycentricA <= std_logic_vector(storedDbgBarycentricA);
DBG_RastBarycentricB <= std_logic_vector(storedDbgBarycentricB);
DBG_RastBarycentricC <= std_logic_vector(storedDbgBarycentricC);

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when waitingForRead =>
					statCyclesIdle <= statCyclesIdle + 1;

				when sendPixelForAttrInterpolation =>
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
					readFromFifo <= '0';
					currentState <= waitingForRead;
					TRICACHE_SignalSlotComplete <= '0';

				when waitingForRead =>
					ATTR_NewPixelValid <= '0'; -- Deassert after one clock cycle
					TRICACHE_SignalSlotComplete <= '0'; -- Deassert after one clock cycle
					DEPTH_PixelReady <= '0';
					if (RASTOUT_FIFO_empty = '0') then
						if (isSpecialReadPacket(RASTOUT_FIFO_rd_data) = '1') then
							if (RASTOUT_FIFO_rd_data(32*3+16-1 downto 32*3) = x"FFFF") then -- "FFFF" means "terminate primitive slot"
								storedPixelY <= unsigned(RASTOUT_FIFO_rd_data(32*3+16*2-1 downto 32*3+16) );
								currentState <= signalPrimitiveComplete;
							else -- "FFFE" means "set new primitive slot"
								storedPixelY <= unsigned(RASTOUT_FIFO_rd_data(32*3+16*2-1 downto 32*3+16) );
								currentState <= setNewPrimitiveSlot;
							end if;
						else
							tempMultBarycentricA <= signed(RASTOUT_FIFO_rd_data(32*1-1 downto 32*0) );
							tempMultBarycentricB <= signed(RASTOUT_FIFO_rd_data(32*2-1 downto 32*1) );
							tempMultBarycentricC <= signed(RASTOUT_FIFO_rd_data(32*3-1 downto 32*2) );
							tempMultBarycentricAIsNegative <= RASTOUT_FIFO_rd_data(32*1-1); -- Save off the sign bit for restoring later
							tempMultBarycentricBIsNegative <= RASTOUT_FIFO_rd_data(32*2-1);
							tempMultBarycentricCIsNegative <= RASTOUT_FIFO_rd_data(32*3-1);
							storedDbgBarycentricA <= signed(RASTOUT_FIFO_rd_data(32*1-1 downto 32*0) );
							storedDbgBarycentricB <= signed(RASTOUT_FIFO_rd_data(32*2-1 downto 32*1) );
							storedDbgBarycentricC <= signed(RASTOUT_FIFO_rd_data(32*3-1 downto 32*2) );
							storedPixelX <= unsigned(RASTOUT_FIFO_rd_data(32*3+16-1 downto 32*3) );
							storedPixelY <= unsigned(RASTOUT_FIFO_rd_data(32*3+16*2-1 downto 32*3+16) );
							storedBarycentricInverse <= unsigned(TRICACHE_inBarycentricInverse);
							storedInvZ0 <= unsigned(TRICACHE_inInvZ0);
							storedInvZ1 <= unsigned(TRICACHE_inInvZ1);
							storedInvZ2 <= unsigned(TRICACHE_inInvZ2);
							storedTX0 <= unsigned(TRICACHE_inT0X);
							storedTY0 <= unsigned(TRICACHE_inT0Y);
							storedTX1 <= unsigned(TRICACHE_inT1X);
							storedTY1 <= unsigned(TRICACHE_inT1Y);
							storedTX2 <= unsigned(TRICACHE_inT2X);
							storedTY2 <= unsigned(TRICACHE_inT2Y);
							storedColorRGBA0 <= unsigned(TRICACHE_inColorRGBA0);
							storedColorRGBA1 <= unsigned(TRICACHE_inColorRGBA1);
							storedColorRGBA2 <= unsigned(TRICACHE_inColorRGBA2);

							currentState <= barycentricConversion0;
						end if;

						readFromFifo <= '1'; -- Signal the read request
					else
						readFromFifo <= '0';
					end if;

				when barycentricConversion0 =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					FPU_ICNV_GO <= '1';
					FPU_A <= std_logic_vector(Int32toUint32(tempMultBarycentricA, tempMultBarycentricAIsNegative) );
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(U32_to_F), 3) );
					currentState <= barycentricConversion1;

				when barycentricConversion1 =>
					FPU_ICNV_GO <= '1';
					FPU_A <= std_logic_vector(Int32toUint32(tempMultBarycentricB, tempMultBarycentricBIsNegative) );
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(U32_to_F), 3) );
					currentState <= barycentricConversion2;

				when barycentricConversion2 =>
					FPU_ICNV_GO <= '1';
					FPU_A <= std_logic_vector(Int32toUint32(tempMultBarycentricC, tempMultBarycentricCIsNegative) );
					FPU_Mode <= std_logic_vector(to_unsigned(eConvertMode'pos(U32_to_F), 3) );
					currentState <= barycentricConversion3;

				when barycentricConversion3 =>
					FPU_ICNV_GO <= '0';
					currentState <= barycentricConversion4;

				when barycentricConversion4 =>
					tempFloatBarycentricA(31) <= tempMultBarycentricAIsNegative;
					tempFloatBarycentricA(30 downto 0) <= unsigned(FPU_OUT(30 downto 0) );
					currentState <= barycentricConversion5;

				when barycentricConversion5 =>
					tempFloatBarycentricB(31) <= tempMultBarycentricBIsNegative;
					tempFloatBarycentricB(30 downto 0) <= unsigned(FPU_OUT(30 downto 0) );
					currentState <= barycentricConversion6;

				when barycentricConversion6 =>
					tempFloatBarycentricC(31) <= tempMultBarycentricCIsNegative;
					tempFloatBarycentricC(30 downto 0) <= unsigned(FPU_OUT(30 downto 0) );
					currentState <= barycentricNormalization0;

				when barycentricNormalization0 =>
					FPU_A <= std_logic_vector(storedBarycentricInverse);
					FPU_B <= std_logic_vector(tempFloatBarycentricA);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricNormalization1;

				when barycentricNormalization1 =>
					FPU_A <= std_logic_vector(storedBarycentricInverse);
					FPU_B <= std_logic_vector(tempFloatBarycentricB);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricNormalization2;

				when barycentricNormalization2 =>
					FPU_A <= std_logic_vector(storedBarycentricInverse);
					FPU_B <= std_logic_vector(tempFloatBarycentricC);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricNormalization3;

				when barycentricNormalization3 =>
					FPU_IMUL_GO <= '0';
					currentState <= barycentricNormalization4;

				when barycentricNormalization4 =>
					currentState <= barycentricNormalization5;

				when barycentricNormalization5 =>
					currentState <= barycentricNormalization6;

				when barycentricNormalization6 =>
					normalizedBarycentricA <= unsigned(FPU_OUT);
					currentState <= barycentricNormalization7;

				when barycentricNormalization7 =>
					normalizedBarycentricB <= unsigned(FPU_OUT);
					currentState <= barycentricNormalization8;

				when barycentricNormalization8 =>
					normalizedBarycentricC <= unsigned(FPU_OUT);
					currentState <= barycentricMultiply0;

				when barycentricMultiply0 =>
					-- Wait one extra cycle for the results of the multiply to finish
					currentState <= barycentricMultiply1;

				when barycentricMultiply1 =>
					FPU_A <= std_logic_vector(normalizedBarycentricA);
					FPU_B <= std_logic_vector(storedInvZ0);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricMultiply2;

				when barycentricMultiply2 =>
					FPU_A <= std_logic_vector(normalizedBarycentricB);
					FPU_B <= std_logic_vector(storedInvZ1);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricMultiply3;

				when barycentricMultiply3 =>
					FPU_A <= std_logic_vector(normalizedBarycentricC);
					FPU_B <= std_logic_vector(storedInvZ2);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricMultiply4;

				when barycentricMultiply4 =>
					FPU_IMUL_GO <= '0';
					currentState <= barycentricMultiply5;

				when barycentricMultiply5 =>
					currentState <= barycentricMultiply6;

				when barycentricMultiply6 =>
					currentState <= barycentricMultiply7;

				when barycentricMultiply7 =>
					tempInvZDP3A <= unsigned(FPU_OUT);
					currentState <= barycentricMultiply8;

				when barycentricMultiply8 =>
					tempInvZDP3B <= unsigned(FPU_OUT);
					currentState <= barycentricMultiply9;

				when barycentricMultiply9 =>
					tempInvZDP3C <= unsigned(FPU_OUT);
					currentState <= barycentricDotProductSums0;

				when barycentricDotProductSums0 =>
					FPU_A <= std_logic_vector(tempInvZDP3A);
					FPU_B <= std_logic_vector(tempInvZDP3B);
					FPU_IADD_GO <= '1';
					currentState <= barycentricDotProductSums1;

				when barycentricDotProductSums1 =>
					FPU_IADD_GO <= '0';
					currentState <= barycentricDotProductSums2;

				when barycentricDotProductSums2 =>
					currentState <= barycentricDotProductSums3;

				when barycentricDotProductSums3 =>
					currentState <= barycentricDotProductSums4;

				when barycentricDotProductSums4 =>
					currentState <= barycentricDotProductSums5;

				when barycentricDotProductSums5 =>
					FPU_A <= FPU_OUT;
					FPU_B <= std_logic_vector(tempInvZDP3C);
					FPU_IADD_GO <= '1';
					currentState <= barycentricDotProductSums6;

				when barycentricDotProductSums6 =>
					FPU_IADD_GO <= '0';
					currentState <= barycentricDotProductSums7;

				when barycentricDotProductSums7 =>
					currentState <= barycentricDotProductSums8;

				when barycentricDotProductSums8 =>
					currentState <= barycentricDotProductSums9;

				when barycentricDotProductSums9 =>
					currentState <= barycentricDotProductRecip0;

				when barycentricDotProductRecip0 =>
					FPU_A <= FPU_OUT;
					FPU_ISPEC_GO <= '1';
					currentState <= barycentricDotProductRecip1;

				when barycentricDotProductRecip1 =>
					FPU_ISPEC_GO <= '0';
					currentState <= barycentricDotProductRecip2;

				when barycentricDotProductRecip2 =>
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
					pixelDepth <= unsigned(FPU_OUT); -- Should we saturate() depth here just in case it's outside the [0.0f, 1.0f] range?
					if (DEPTH_DepthTestEnabled = '1') then
						currentState <= depthTestState0;
					else
						currentState <= sendPixelForAttrInterpolation;
					end if;

				when depthTestState0 =>
					-- Using the mantissa of the float assumes that the float is in the (0.5f, 1.0f) range, which it very likely is due to not many older D3D8/D3D9 games using reversed depth ranges or consuming the entirety of the depth range
					DEPTH_OutPixelDepth <= '1' & std_logic_vector(pixelDepth(22 downto 0) );
					DEPTH_PosX <= std_logic_vector(storedPixelX(9 downto 0) );
					DEPTH_PosY <= std_logic_vector(storedPixelY(9 downto 0) );
					DEPTH_PixelReady <= '1';
					currentState <= depthTestState1;

				when depthTestState1 =>
					DEPTH_PixelReady <= '0';
					currentState <= depthTestState2;

				when depthTestState2 =>
					currentState <= depthTestState3;

				when depthTestState3 =>
					currentState <= depthTestState4;

				when depthTestState4 =>
					currentState <= depthTestState5;

				when depthTestState5 =>
					currentState <= depthTestState6;

				when depthTestState6 =>
					currentState <= depthTestState7;

				when depthTestState7 =>
					if (DEPTH_PixelPassedDepthTest = '1') then
						currentState <= sendPixelForAttrInterpolation;
					else
						currentState <= waitingForRead; -- We failed the depth test, kill this pixel!
					end if;

				when sendPixelForAttrInterpolation =>
					if (ATTR_ReadyForNewPixel = '1') then
						ATTR_NewPixelValid <= '1';

						ATTR_PosX <= std_logic_vector(storedPixelX(9 downto 0) );
						ATTR_PosY <= std_logic_vector(storedPixelY(9 downto 0) );
						ATTR_TX0 <= std_logic_vector(storedTX0);
						ATTR_TX1 <= std_logic_vector(storedTX1);
						ATTR_TX2 <= std_logic_vector(storedTX2);
						ATTR_TY0 <= std_logic_vector(storedTY0);
						ATTR_TY1 <= std_logic_vector(storedTY1);
						ATTR_TY2 <= std_logic_vector(storedTY2);
						ATTR_VC0 <= std_logic_vector(storedColorRGBA0);
						ATTR_VC1 <= std_logic_vector(storedColorRGBA1);
						ATTR_VC2 <= std_logic_vector(storedColorRGBA2);
						ATTR_NormalizedBarycentricDivZ0 <= std_logic_vector(tempInvZDP3A);
						ATTR_NormalizedBarycentricDivZ1 <= std_logic_vector(tempInvZDP3B);
						ATTR_NormalizedBarycentricDivZ2 <= std_logic_vector(tempInvZDP3C);
						ATTR_OutPixelDepth <= std_logic_vector(pixelDepth);

						currentState <= waitingForRead;
					else
						ATTR_NewPixelValid <= '0';
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

			end case;
		end if;
	end process;

end Behavioral;
