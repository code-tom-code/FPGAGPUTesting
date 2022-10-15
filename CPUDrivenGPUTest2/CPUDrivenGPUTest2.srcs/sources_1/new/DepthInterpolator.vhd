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
		TRICACHE_inInvZ10 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inInvZ20 : in STD_LOGIC_VECTOR(31 downto 0);
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

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_DepthInterpolator_State : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
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

	-- Normalize our barycentrics by multiplying the [0.0f, 16777216.0f] values by the barycentric normalization factor (computed by the TriSetup block previously) to
	-- get them into the [0.0f, 1.0f] range.
	barycentricNormalization0, -- 8
	barycentricNormalization1, -- 9
	barycentricNormalization2, -- 10
	barycentricNormalization3, -- 11
	barycentricNormalization4, -- 12
	barycentricNormalization5, -- 13
	barycentricNormalization6, -- 14
	barycentricNormalization7, -- 15

	-- Multiply the normalized barycentrics with the inverseZ (1.0f/zN) values
	barycentricMultiply0, -- 16
	barycentricMultiply1, -- 17
	barycentricMultiply2, -- 18
	barycentricMultiply3, -- 19
	barycentricMultiply4, -- 20
	barycentricMultiply5, -- 21
	barycentricMultiply6, -- 22
	barycentricMultiply7, -- 23
	barycentricMultiply8, -- 24
	barycentricMultiply9, -- 25

	-- Sum the products together to complete the dot product
	barycentricDotProductSums0, -- 26
	barycentricDotProductSums1, -- 27
	barycentricDotProductSums2, -- 28
	barycentricDotProductSums3, -- 29
	barycentricDotProductSums4, -- 30
	barycentricDotProductSums5, -- 31
	barycentricDotProductSums6, -- 32
	barycentricDotProductSums7, -- 33
	barycentricDotProductSums8, -- 34
	barycentricDotProductSums9, -- 35

	-- Take the reciprocals of the dot product (1.0f / dot(normbary.abc, inverseZ.xyz) ) to yield the per-pixel depth value and per-pixel W value as a float32
	barycentricDotProductRecip0, -- 36
	barycentricDotProductRecip1, -- 37
	barycentricDotProductRecip2, -- 38
	barycentricDotProductRecip3, -- 39
	barycentricDotProductRecip4, -- 40
	barycentricDotProductRecip5, -- 41
	barycentricDotProductRecip6, -- 42
	barycentricDotProductRecip7, -- 43
	barycentricDotProductRecip8, -- 44
	barycentricDotProductRecip9, -- 45
	barycentricDotProductRecip10, -- 46
	barycentricDotProductRecip11, -- 47
	barycentricDotProductRecip12, -- 48
	barycentricDotProductRecip13, -- 49
	barycentricDotProductRecip14, -- 50
	barycentricDotProductRecip15, -- 51
	barycentricDotProductRecip16, -- 52

	-- If depth testing is enabled, perform the depth test now. Otherwise, skip these stages entirely.
	depthTestState0, -- 53
	depthTestState1, -- 54
	depthTestState2, -- 55
	depthTestState3, -- 56
	depthTestState4, -- 57
	depthTestState5, -- 58
	depthTestState6, -- 59
	depthTestState7, -- 60

	-- When it's ready we can send the now depth-test-passed pixel off to the next block for attribute interpolation
	sendPixelForAttrInterpolation, -- 61

	setNewPrimitiveSlot, -- 62
	signalPrimitiveComplete -- 63
);

pure function isSpecialReadPacket(rd_data : STD_LOGIC_VECTOR(32+32+16+16 - 1 downto 0) ) return std_logic is
begin
	if (rd_data(32*2+16-1 downto 32*2) = x"FFFF" or
		rd_data(32*2+16-1 downto 32*2) = x"FFFE") then
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

signal tempMultBarycentricB : signed(31 downto 0) := (others => '0'); -- int32 format of the input barycentric
signal tempMultBarycentricC : signed(31 downto 0) := (others => '0'); -- int32 format of the input barycentric
signal tempMultBarycentricBIsNegative : std_logic := '0'; -- Save off the sign bit for restoring later
signal tempMultBarycentricCIsNegative : std_logic := '0';
signal tempFloatBarycentricB : unsigned(31 downto 0) := (others => '0'); -- float32 format of the input barycentric
signal tempFloatBarycentricC : unsigned(31 downto 0) := (others => '0'); -- float32 format of the input barycentric

signal normalizedBarycentricB : unsigned(31 downto 0) := (others => '0'); -- float32 format of barycentricNormalizeFactor * float(barycentricB)
signal normalizedBarycentricC : unsigned(31 downto 0) := (others => '0'); -- float32 format of barycentricNormalizeFactor * float(barycentricC)

signal tempInvZDP3B : unsigned(31 downto 0) := (others => '0'); -- float32 format of (1/z1 * normalizedBarycentricB)
signal tempInvZDP3C : unsigned(31 downto 0) := (others => '0'); -- float32 format of (1/z2 * normalizedBarycentricC)

signal tempInvWDP3B : unsigned(31 downto 0) := (others => '0'); -- float32 format of (1/w1 * normalizedBarycentricB)
signal tempInvWDP3C : unsigned(31 downto 0) := (others => '0'); -- float32 format of (1/w2 * normalizedBarycentricC)

signal pixelDepth : unsigned(31 downto 0) := (others => '0'); -- float32 format (0.0f to 1.0f) pixel depth value
signal pixelW : unsigned(31 downto 0) := (others => '0'); -- float32 format (0.0f to 1.0f) pixel W value

signal storedBarycentricInverse : unsigned(31 downto 0) := (others => '0'); -- float32 format (this is 1.0f / twiceTriangleArea)
signal storedInvZ0 : unsigned(31 downto 0) := (others => '0'); -- float32 format (this is 1.0f / z0)
signal storedInvZ10 : unsigned(31 downto 0) := (others => '0'); -- float32 format (this is 1.0f / z1)
signal storedInvZ20 : unsigned(31 downto 0) := (others => '0'); -- float32 format (this is 1.0f / z2)
signal storedInvW0 : unsigned(31 downto 0) := (others => '0'); -- float32 format (this is 1.0f / w0)
signal storedInvW10 : unsigned(31 downto 0) := (others => '0'); -- float32 format (this is 1.0f / w1)
signal storedInvW20 : unsigned(31 downto 0) := (others => '0'); -- float32 format (this is 1.0f / w2)
signal storedTX0 : unsigned(31 downto 0) := (others => '0'); -- float32 format texcoords
signal storedTY0 : unsigned(31 downto 0) := (others => '0'); -- float32 format texcoords
signal storedTX10 : unsigned(31 downto 0) := (others => '0'); -- float32 format texcoords
signal storedTY10 : unsigned(31 downto 0) := (others => '0'); -- float32 format texcoords
signal storedTX20 : unsigned(31 downto 0) := (others => '0'); -- float32 format texcoords
signal storedTY20 : unsigned(31 downto 0) := (others => '0'); -- float32 format texcoords
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

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);

DBG_DepthInterpolator_State <= std_logic_vector(to_unsigned(depthInterpStateType'pos(currentState), 7) );
DBG_RastBarycentricB <= std_logic_vector(storedDbgBarycentricB);
DBG_RastBarycentricC <= std_logic_vector(storedDbgBarycentricC);

	StatsProcess : process(clk)
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
	end process StatsProcess;

	MainProcess : process(clk)
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
							if (RASTOUT_FIFO_rd_data(32*2+16-1 downto 32*2) = x"FFFF") then -- "FFFF" means "terminate primitive slot"
								storedPixelY <= unsigned(RASTOUT_FIFO_rd_data(32*2+16*2-1 downto 32*2+16) );
								currentState <= signalPrimitiveComplete;
							else -- "FFFE" means "set new primitive slot"
								storedPixelY <= unsigned(RASTOUT_FIFO_rd_data(32*2+16*2-1 downto 32*2+16) );
								currentState <= setNewPrimitiveSlot;
							end if;
						else
							tempMultBarycentricB <= signed(RASTOUT_FIFO_rd_data(32*1-1 downto 32*0) );
							tempMultBarycentricC <= signed(RASTOUT_FIFO_rd_data(32*2-1 downto 32*1) );
							tempMultBarycentricBIsNegative <= RASTOUT_FIFO_rd_data(32*1-1); -- Save off the sign bit for restoring later
							tempMultBarycentricCIsNegative <= RASTOUT_FIFO_rd_data(32*2-1);
							storedDbgBarycentricB <= signed(RASTOUT_FIFO_rd_data(32*1-1 downto 32*0) );
							storedDbgBarycentricC <= signed(RASTOUT_FIFO_rd_data(32*2-1 downto 32*1) );
							storedPixelX <= unsigned(RASTOUT_FIFO_rd_data(32*2+16-1 downto 32*2) );
							storedPixelY <= unsigned(RASTOUT_FIFO_rd_data(32*2+16*2-1 downto 32*2+16) );
							storedBarycentricInverse <= unsigned(TRICACHE_inBarycentricInverse);
							storedInvZ0 <= unsigned(TRICACHE_inInvZ0);
							storedInvZ10 <= unsigned(TRICACHE_inInvZ10);
							storedInvZ20 <= unsigned(TRICACHE_inInvZ20);
							storedInvW0 <= unsigned(TRICACHE_inInvW0);
							storedInvW10 <= unsigned(TRICACHE_inInvW10);
							storedInvW20 <= unsigned(TRICACHE_inInvW20);
							storedTX0 <= unsigned(TRICACHE_inT0X);
							storedTY0 <= unsigned(TRICACHE_inT0Y);
							storedTX10 <= unsigned(TRICACHE_inT10X);
							storedTY10 <= unsigned(TRICACHE_inT10Y);
							storedTX20 <= unsigned(TRICACHE_inT20X);
							storedTY20 <= unsigned(TRICACHE_inT20Y);
							storedColorRGBA0 <= unsigned(TRICACHE_inColorRGBA0);
							storedColorRGBA10 <= unsigned(TRICACHE_inColorRGBA10);
							storedColorRGBA20 <= unsigned(TRICACHE_inColorRGBA20);

							currentState <= barycentricConversion0;
						end if;

						readFromFifo <= '1'; -- Signal the read request
					else
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
					normalizedBarycentricB <= unsigned(FPU_OUT);
					currentState <= barycentricNormalization7;

				when barycentricNormalization7 =>
					normalizedBarycentricC <= unsigned(FPU_OUT);
					currentState <= barycentricMultiply0;

				when barycentricMultiply0 =>
					FPU_A <= std_logic_vector(normalizedBarycentricB);
					FPU_B <= std_logic_vector(storedInvZ10);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricMultiply1;

				when barycentricMultiply1 =>
					FPU_A <= std_logic_vector(normalizedBarycentricB);
					FPU_B <= std_logic_vector(storedInvW10);
					FPU_IMUL_GO <= '1';
					currentState <= barycentricMultiply2;

				when barycentricMultiply2 =>
					FPU_A <= std_logic_vector(normalizedBarycentricC);
					FPU_B <= std_logic_vector(storedInvZ20);
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
					tempInvZDP3B <= unsigned(FPU_OUT);
					currentState <= barycentricMultiply7;

				when barycentricMultiply7 =>
					tempInvWDP3B <= unsigned(FPU_OUT);
					currentState <= barycentricMultiply8;

				when barycentricMultiply8 =>
					tempInvZDP3C <= unsigned(FPU_OUT);
					currentState <= barycentricMultiply9;

				when barycentricMultiply9 =>
					tempInvWDP3C <= unsigned(FPU_OUT);
					currentState <= barycentricDotProductSums0;

				when barycentricDotProductSums0 =>
					FPU_A <= std_logic_vector(tempInvZDP3B);
					FPU_B <= std_logic_vector(tempInvZDP3C);
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
					FPU_B <= std_logic_vector(storedInvZ0);
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
					FPU_A <= FPU_OUT;
					FPU_ISPEC_GO <= '1';
					currentState <= barycentricDotProductRecip1;

				when barycentricDotProductRecip1 =>
					FPU_A <= FPU_OUT;
					FPU_ISPEC_GO <= '1';
					currentState <= barycentricDotProductRecip2;

				when barycentricDotProductRecip2 =>
					FPU_ISPEC_GO <= '0';
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
					pixelDepth <= unsigned(FPU_OUT); -- Should we saturate() the interpolated per-pixel depth here just in case it's outside the [0.0f, 1.0f] range?
					currentState <= barycentricDotProductRecip16;

				when barycentricDotProductRecip16 =>
					pixelW <= unsigned(FPU_OUT); -- Should we saturate() the interpolated per-pixel W here just in case it's outside the [0.0f, 1.0f] range?
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
	end process MainProcess;

end Behavioral;
