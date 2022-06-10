library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity AttrInterpolator is
	Port ( clk : in STD_LOGIC;

	-- TriWorkCache per-triangle interface begin
		TRICACHE_inBarycentricInverse : in STD_LOGIC_VECTOR(23 downto 0);
		TRICACHE_inInvZ0 : in STD_LOGIC_VECTOR(23 downto 0);
		TRICACHE_inInvZ1 : in STD_LOGIC_VECTOR(23 downto 0);
		TRICACHE_inInvZ2 : in STD_LOGIC_VECTOR(23 downto 0);
		TRICACHE_inT0X : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inT0Y : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inT1X : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inT1Y : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inT2X : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inT2Y : in STD_LOGIC_VECTOR(15 downto 0);
		TRICACHE_inColorRGBA0 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inColorRGBA1 : in STD_LOGIC_VECTOR(31 downto 0);
		TRICACHE_inColorRGBA2 : in STD_LOGIC_VECTOR(31 downto 0);

		TRICACHE_CurrentSlotIndex : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		TRICACHE_SignalSlotComplete : out STD_LOGIC := '0';
	-- TriWorkCache per-triangle interface end

	-- Rasterizer Output per-pixel interface begin
		RASTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR(32+32+32+16+16 - 1 downto 0);
		RASTOUT_FIFO_empty : in STD_LOGIC;
		RASTOUT_FIFO_rd_en : out STD_LOGIC := '0';
	-- Rasterizer Output per-pixel interface end

	-- Reciprocal unit interfaces begin
		RECIP_InputVal : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		RECIP_ReadyForNewInput : in STD_LOGIC;
		RECIP_NewInputValIsValid : out STD_LOGIC := '0';

		RECIP_OutputVal : in STD_LOGIC_VECTOR(23 downto 0);
		RECIP_ReadyForValOut : out STD_LOGIC := '0';
		RECIP_NewOutValIsValid : in STD_LOGIC;
	-- Reciprocal unit interfaces end

	-- Texture Sampler interface begin
		TEXSAMP_outInterpolatedTexcoordX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TEXSAMP_outInterpolatedTexcoordY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TEXSAMP_outInterpolatedColorRGBA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TEXSAMP_outPixelX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TEXSAMP_outPixelY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TEXSAMP_outPixelInterpolatedDepth : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');

		TEXSAMP_writeIsValid : out STD_LOGIC := '0';
		TEXSAMP_readyForWrite : in STD_LOGIC;
	-- Texture Sampler interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_AttrInterpolator_State : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		DBG_RastBarycentricA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RastBarycentricB : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_RastBarycentricC : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
		);
end AttrInterpolator;

architecture Behavioral of AttrInterpolator is

ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 RASTOUT_FIFO EMPTY";

constant noperspective : STD_LOGIC := '1';
constant flatshading : STD_LOGIC := '0';

type interpStateType is 
(
	init, -- 0
	waitingForRead, -- 1

	-- Used for perspective attribute interpolation
	barycentricNormalization0, -- 2
	barycentricNormalization1, -- 3
	barycentricNormalization2, -- 4
	barycentricNormalizationShift, -- 5
	barycentricTexcoord, -- 6
	barycentricTexcoord1, -- 7
	barycentricTexcoord2, -- 8
	barycentricTexcoord3, -- 9
	barycentricTexcoord4, -- 10
	barycentricTexcoordShift, -- 11
	barycentricTexcoordShift2, -- 12

	-- Used for noperspective attribute interpolation
	barycentricNoperspectiveTexcoord1, -- 13
	barycentricNoperspectiveTexcoord2, -- 14
	barycentricNoperspectiveHorizontalAdd, -- 15

	sumBarycentrics0, -- 16
	sumBarycentrics1, -- 17
	loadRecipUnit, -- 18
	waitingForRecipResult, -- 19

	-- Used for (more typical) perspective-correct attribute interpolation
	invertTexcoords, -- 20

	waitingForWrite, -- 21

	setNewPrimitiveSlot, -- 22
	signalPrimitiveComplete -- 23
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

signal currentState : interpStateType := init;

signal storedPixelX : unsigned(15 downto 0) := (others => '0');
signal storedPixelY : unsigned(15 downto 0) := (others => '0');

signal tempMultBarycentricA : unsigned(32+24-1 downto 0) := (others => '0');
signal tempMultBarycentricB : unsigned(32+24-1 downto 0) := (others => '0');
signal tempMultBarycentricC : unsigned(32+24-1 downto 0) := (others => '0');
signal tempMultBarycentricA1 : unsigned(24-1 downto 0) := (others => '0');
signal tempMultBarycentricB1 : unsigned(24-1 downto 0) := (others => '0');
signal tempMultBarycentricC1 : unsigned(24-1 downto 0) := (others => '0');
signal tempMultBarycentricA2 : unsigned(24-1 downto 0) := (others => '0');
signal tempMultBarycentricB2 : unsigned(24-1 downto 0) := (others => '0');
signal tempMultBarycentricC2 : unsigned(24-1 downto 0) := (others => '0');
signal normalizedBarycentricA : unsigned(31 downto 0) := (others => '0');
signal normalizedBarycentricB : unsigned(31 downto 0) := (others => '0');
signal normalizedBarycentricC : unsigned(31 downto 0) := (others => '0');

-- These numbers are the product of two 17-bit multiplicands in 1.16 unsigned fixed-point format
signal tempMulBarycentricTexcoord0X : unsigned(24+1+16 downto 0) := (others => '0');
signal tempMulBarycentricTexcoord0Y : unsigned(24+1+16 downto 0) := (others => '0');
signal tempMulBarycentricTexcoord1X : unsigned(24+1+16 downto 0) := (others => '0');
signal tempMulBarycentricTexcoord1Y : unsigned(24+1+16 downto 0) := (others => '0');
signal tempMulBarycentricTexcoord2X : unsigned(24+1+16 downto 0) := (others => '0');
signal tempMulBarycentricTexcoord2Y : unsigned(24+1+16 downto 0) := (others => '0');

-- These numbers are the product of a Q0.16 and a Q0.24 fixed-point format
signal noperspectiveBarycentricTexcoord0X : unsigned(24+16-1 downto 0) := (others => '0');
signal noperspectiveBarycentricTexcoord0Y : unsigned(24+16-1 downto 0) := (others => '0');
signal noperspectiveBarycentricTexcoord1X : unsigned(24+16-1 downto 0) := (others => '0');
signal noperspectiveBarycentricTexcoord1Y : unsigned(24+16-1 downto 0) := (others => '0');
signal noperspectiveBarycentricTexcoord2X : unsigned(24+16-1 downto 0) := (others => '0');
signal noperspectiveBarycentricTexcoord2Y : unsigned(24+16-1 downto 0) := (others => '0');

signal noperspectiveBarycentricColor0R : unsigned(24+8-1 downto 0) := (others => '0');
signal noperspectiveBarycentricColor0G : unsigned(24+8-1 downto 0) := (others => '0');
signal noperspectiveBarycentricColor0B : unsigned(24+8-1 downto 0) := (others => '0');
signal noperspectiveBarycentricColor0A : unsigned(24+8-1 downto 0) := (others => '0');
signal noperspectiveBarycentricColor1R : unsigned(24+8-1 downto 0) := (others => '0');
signal noperspectiveBarycentricColor1G : unsigned(24+8-1 downto 0) := (others => '0');
signal noperspectiveBarycentricColor1B : unsigned(24+8-1 downto 0) := (others => '0');
signal noperspectiveBarycentricColor1A : unsigned(24+8-1 downto 0) := (others => '0');
signal noperspectiveBarycentricColor2R : unsigned(24+8-1 downto 0) := (others => '0');
signal noperspectiveBarycentricColor2G : unsigned(24+8-1 downto 0) := (others => '0');
signal noperspectiveBarycentricColor2B : unsigned(24+8-1 downto 0) := (others => '0');
signal noperspectiveBarycentricColor2A : unsigned(24+8-1 downto 0) := (others => '0');

signal tempInvZDP3A : unsigned(24+32+1 downto 0) := (others => '0');
signal tempInvZDP3B : unsigned(24+32+1 downto 0) := (others => '0');
signal tempInvZDP3C : unsigned(24+32+1 downto 0) := (others => '0');
signal interpolatedInversePixelDepth : unsigned(24+32+1 downto 0) := (others => '0');
signal interpolatedTexcoordX : unsigned(24+16+1 downto 0) := (others => '0');
signal interpolatedTexcoordY : unsigned(24+16+1 downto 0) := (others => '0');
signal interpolatedVertColorR : unsigned(23 downto 0) := (others => '0');
signal interpolatedVertColorG : unsigned(23 downto 0) := (others => '0');
signal interpolatedVertColorB : unsigned(23 downto 0) := (others => '0');
signal interpolatedVertColorA : unsigned(23 downto 0) := (others => '0');

signal pixelDepth : unsigned(23 downto 0) := (others => '0');

signal storedBarycentricInverse : unsigned(23 downto 0) := (others => '0');
signal storedInvZ0 : unsigned(23+1 downto 0) := (others => '0'); -- Q1.24
signal storedInvZ1 : unsigned(23+1 downto 0) := (others => '0');
signal storedInvZ2 : unsigned(23+1 downto 0) := (others => '0');
signal storedTX0 : unsigned(15+1 downto 0) := (others => '0');
signal storedTY0 : unsigned(15+1 downto 0) := (others => '0');
signal storedTX1 : unsigned(15+1 downto 0) := (others => '0');
signal storedTY1 : unsigned(15+1 downto 0) := (others => '0');
signal storedTX2 : unsigned(15+1 downto 0) := (others => '0');
signal storedTY2 : unsigned(15+1 downto 0) := (others => '0');
signal storedColorRGBA0 : unsigned(31 downto 0) := (others => '0');
signal storedColorRGBA1 : unsigned(31 downto 0) := (others => '0');
signal storedColorRGBA2 : unsigned(31 downto 0) := (others => '0');

signal storedDbgBarycentricA : unsigned(31 downto 0) := (others => '0');
signal storedDbgBarycentricB : unsigned(31 downto 0) := (others => '0');
signal storedDbgBarycentricC : unsigned(31 downto 0) := (others => '0');

signal recipInputIsValid : std_logic := '0';
signal recipReadyForValOut : std_logic := '0';

signal readFromFifo : std_logic := '0';

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

begin

RASTOUT_FIFO_rd_en <= readFromFifo;
RECIP_NewInputValIsValid <= recipInputIsValid;
RECIP_ReadyForValOut <= recipReadyForValOut;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);

DBG_AttrInterpolator_State <= std_logic_vector(to_unsigned(interpStateType'pos(currentState), 6) );
DBG_RastBarycentricA <= std_logic_vector(storedDbgBarycentricA);
DBG_RastBarycentricB <= std_logic_vector(storedDbgBarycentricB);
DBG_RastBarycentricC <= std_logic_vector(storedDbgBarycentricC);

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
		variable tempBarycentricTexcoordShiftAX : unsigned(24+16+1 downto 0) := (others => '0');
		variable tempBarycentricTexcoordShiftAY : unsigned(24+16+1 downto 0) := (others => '0');
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when init =>
					readFromFifo <= '0';
					TEXSAMP_writeIsValid <= '0';
					currentState <= waitingForRead;
					TRICACHE_SignalSlotComplete <= '0';

				when waitingForRead =>
					TEXSAMP_writeIsValid <= '0'; -- Deassert after one clock cycle
					TRICACHE_SignalSlotComplete <= '0'; -- Deassert after one clock cycle
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
							tempMultBarycentricA <= x"000000" & unsigned(RASTOUT_FIFO_rd_data(32*1-1 downto 32*0) );
							tempMultBarycentricB <= x"000000" & unsigned(RASTOUT_FIFO_rd_data(32*2-1 downto 32*1) );
							tempMultBarycentricC <= x"000000" & unsigned(RASTOUT_FIFO_rd_data(32*3-1 downto 32*2) );
							storedDbgBarycentricA <= unsigned(RASTOUT_FIFO_rd_data(32*1-1 downto 32*0) );
							storedDbgBarycentricB <= unsigned(RASTOUT_FIFO_rd_data(32*2-1 downto 32*1) );
							storedDbgBarycentricC <= unsigned(RASTOUT_FIFO_rd_data(32*3-1 downto 32*2) );
							storedPixelX <= unsigned(RASTOUT_FIFO_rd_data(32*3+16-1 downto 32*3) );
							storedPixelY <= unsigned(RASTOUT_FIFO_rd_data(32*3+16*2-1 downto 32*3+16) );
							storedBarycentricInverse <= unsigned(TRICACHE_inBarycentricInverse);
							storedInvZ0 <= unsigned('1' & TRICACHE_inInvZ0(23 downto 0) ); -- Convert from Q0.24 to Q1.24 by applying a +1.0f bias
							storedInvZ1 <= unsigned('1' & TRICACHE_inInvZ1(23 downto 0) );
							storedInvZ2 <= unsigned('1' & TRICACHE_inInvZ2(23 downto 0) );
							storedTX0 <= unsigned('0' & TRICACHE_inT0X);
							storedTY0 <= unsigned('0' & TRICACHE_inT0Y);
							storedTX1 <= unsigned('0' & TRICACHE_inT1X);
							storedTY1 <= unsigned('0' & TRICACHE_inT1Y);
							storedTX2 <= unsigned('0' & TRICACHE_inT2X);
							storedTY2 <= unsigned('0' & TRICACHE_inT2Y);
							storedColorRGBA0 <= unsigned(TRICACHE_inColorRGBA0);
							storedColorRGBA1 <= unsigned(TRICACHE_inColorRGBA1);
							storedColorRGBA2 <= unsigned(TRICACHE_inColorRGBA2);

							currentState <= barycentricNormalization0;
						end if;

						readFromFifo <= '1'; -- Signal the read request
					else
						readFromFifo <= '0';
					end if;

				when barycentricNormalization0 =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					tempMultBarycentricA <= tempMultBarycentricA(31 downto 0) * storedBarycentricInverse;
					tempMultBarycentricB <= tempMultBarycentricB(31 downto 0) * storedBarycentricInverse;
					tempMultBarycentricC <= tempMultBarycentricC(31 downto 0) * storedBarycentricInverse;
					currentState <= barycentricNormalization1;

				when barycentricNormalization1 =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					tempMultBarycentricA1 <= tempMultBarycentricA(23 downto 0);
					tempMultBarycentricB1 <= tempMultBarycentricB(23 downto 0);
					tempMultBarycentricC1 <= tempMultBarycentricC(23 downto 0);
					currentState <= barycentricNormalization2;

				when barycentricNormalization2 =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					tempMultBarycentricA2 <= tempMultBarycentricA1;
					tempMultBarycentricB2 <= tempMultBarycentricB1;
					tempMultBarycentricC2 <= tempMultBarycentricC1;
					currentState <= barycentricNormalizationShift;

				when barycentricNormalizationShift =>
					normalizedBarycentricA <= tempMultBarycentricA2 & x"00";
					normalizedBarycentricB <= tempMultBarycentricB2 & x"00";
					normalizedBarycentricC <= tempMultBarycentricC2 & x"00";
					currentState <= barycentricTexcoord;

				when barycentricTexcoord =>
					-- Wait one extra cycle for the results of the multiply to finish
					if (noperspective = '1') then
						currentState <= barycentricNoperspectiveTexcoord1;
					else
						currentState <= barycentricTexcoord1;
					end if;

				when barycentricTexcoord1 =>
					tempInvZDP3A <= '0' & normalizedBarycentricA * storedInvZ0;
					tempInvZDP3B <= '0' & normalizedBarycentricB * storedInvZ1;
					tempInvZDP3C <= '0' & normalizedBarycentricC * storedInvZ2;
					currentState <= barycentricTexcoord2;

				when barycentricTexcoord2 =>
					-- Wait one extra cycle for the results of the multiply to finish
					currentState <= barycentricTexcoord3;

				when barycentricTexcoord3 =>
					-- Wait two extra cycles for the results of the multiply to finish
					currentState <= barycentricTexcoord4;

				when barycentricTexcoord4 =>
					tempMulBarycentricTexcoord0X <= (tempInvZDP3A(24+32 downto 32) ) * storedTX0;
					tempMulBarycentricTexcoord0Y <= (tempInvZDP3A(24+32 downto 32) ) * storedTY0;

					tempMulBarycentricTexcoord1X <= (tempInvZDP3B(24+32 downto 32) ) * storedTX1;
					tempMulBarycentricTexcoord1Y <= (tempInvZDP3B(24+32 downto 32) ) * storedTY1;

					tempMulBarycentricTexcoord2X <= (tempInvZDP3C(24+32 downto 32) ) * storedTX2;
					tempMulBarycentricTexcoord2Y <= (tempInvZDP3C(24+32 downto 32) ) * storedTY2;
					currentState <= barycentricTexcoordShift;

				when barycentricTexcoordShift =>
					-- Wait one extra cycle for the results of the multiply to finish
					currentState <= barycentricTexcoordShift2;

				when barycentricTexcoordShift2 =>
					-- Wait two extra cycles for the results of the multiply to finish
					currentState <= sumBarycentrics0;

				when sumBarycentrics0 =>
					-- Add the three products to complete the dot-product
					interpolatedInversePixelDepth <= tempInvZDP3A + tempInvZDP3B + tempInvZDP3C;
					interpolatedTexcoordX <= tempMulBarycentricTexcoord0X + tempMulBarycentricTexcoord1X + tempMulBarycentricTexcoord2X;
					interpolatedTexcoordY <= tempMulBarycentricTexcoord0Y + tempMulBarycentricTexcoord1Y + tempMulBarycentricTexcoord2Y;

					currentState <= sumBarycentrics1;

				when sumBarycentrics1 =>
					currentState <= loadRecipUnit;

				when loadRecipUnit =>
					if (RECIP_ReadyForNewInput = '1' and recipInputIsValid = '1') then
						recipInputIsValid <= '0';
						RECIP_InputVal <= std_logic_vector(interpolatedInversePixelDepth(24+32-1 downto 32) );
						currentState <= waitingForRecipResult;
					else
						recipInputIsValid <= '1';
					end if;

				when waitingForRecipResult =>
					if (RECIP_NewOutValIsValid = '1' and recipReadyForValOut = '1') then
						recipReadyForValOut <= '0';
						pixelDepth <= unsigned(RECIP_OutputVal);
						currentState <= invertTexcoords;
					else
						recipReadyForValOut <= '1';
					end if;

				when invertTexcoords =>
					interpolatedTexcoordX <= interpolatedTexcoordX(24+16 downto 24) * ('0' & pixelDepth);
					interpolatedTexcoordY <= interpolatedTexcoordY(24+16 downto 24) * ('0' & pixelDepth);
					currentState <= waitingForWrite;

				when barycentricNoperspectiveTexcoord1 =>
					-- Compute barycentric texcoords in linear space:
					noperspectiveBarycentricTexcoord0X <= normalizedBarycentricA(31 downto 8) * storedTX0(15 downto 0);
					noperspectiveBarycentricTexcoord0Y <= normalizedBarycentricA(31 downto 8) * storedTY0(15 downto 0);

					noperspectiveBarycentricTexcoord1X <= normalizedBarycentricB(31 downto 8) * storedTX1(15 downto 0);
					noperspectiveBarycentricTexcoord1Y <= normalizedBarycentricB(31 downto 8) * storedTY1(15 downto 0);

					noperspectiveBarycentricTexcoord2X <= normalizedBarycentricC(31 downto 8) * storedTX2(15 downto 0);
					noperspectiveBarycentricTexcoord2Y <= normalizedBarycentricC(31 downto 8) * storedTY2(15 downto 0);

					-- Compute barycentric vertex color values in linear space:
					noperspectiveBarycentricColor0R <= normalizedBarycentricA(31 downto 8) * storedColorRGBA0(7 downto 0);
					noperspectiveBarycentricColor0G <= normalizedBarycentricA(31 downto 8) * storedColorRGBA0(15 downto 8);
					noperspectiveBarycentricColor0B <= normalizedBarycentricA(31 downto 8) * storedColorRGBA0(23 downto 16);
					noperspectiveBarycentricColor0A <= normalizedBarycentricA(31 downto 8) * storedColorRGBA0(31 downto 24);

					noperspectiveBarycentricColor1R <= normalizedBarycentricB(31 downto 8) * storedColorRGBA1(7 downto 0);
					noperspectiveBarycentricColor1G <= normalizedBarycentricB(31 downto 8) * storedColorRGBA1(15 downto 8);
					noperspectiveBarycentricColor1B <= normalizedBarycentricB(31 downto 8) * storedColorRGBA1(23 downto 16);
					noperspectiveBarycentricColor1A <= normalizedBarycentricB(31 downto 8) * storedColorRGBA1(31 downto 24);

					noperspectiveBarycentricColor2R <= normalizedBarycentricC(31 downto 8) * storedColorRGBA2(7 downto 0);
					noperspectiveBarycentricColor2G <= normalizedBarycentricC(31 downto 8) * storedColorRGBA2(15 downto 8);
					noperspectiveBarycentricColor2B <= normalizedBarycentricC(31 downto 8) * storedColorRGBA2(23 downto 16);
					noperspectiveBarycentricColor2A <= normalizedBarycentricC(31 downto 8) * storedColorRGBA2(31 downto 24);

					currentState <= barycentricNoperspectiveTexcoord2;

				when barycentricNoperspectiveTexcoord2 =>
					-- Wait one cycle for the multiply to finish
					currentState <= barycentricNoperspectiveHorizontalAdd;

				when barycentricNoperspectiveHorizontalAdd =>
					interpolatedTexcoordX <= "00" & (noperspectiveBarycentricTexcoord0X + noperspectiveBarycentricTexcoord1X + noperspectiveBarycentricTexcoord2X);
					interpolatedTexcoordY <= "00" & (noperspectiveBarycentricTexcoord0Y + noperspectiveBarycentricTexcoord1Y + noperspectiveBarycentricTexcoord2Y);
					interpolatedVertColorR <= noperspectiveBarycentricColor0R(31 downto 8) + noperspectiveBarycentricColor1R(31 downto 8) + noperspectiveBarycentricColor2R(31 downto 8);
					interpolatedVertColorG <= noperspectiveBarycentricColor0G(31 downto 8) + noperspectiveBarycentricColor1G(31 downto 8) + noperspectiveBarycentricColor2G(31 downto 8);
					interpolatedVertColorB <= noperspectiveBarycentricColor0B(31 downto 8) + noperspectiveBarycentricColor1B(31 downto 8) + noperspectiveBarycentricColor2B(31 downto 8);
					interpolatedVertColorA <= noperspectiveBarycentricColor0A(31 downto 8) + noperspectiveBarycentricColor1A(31 downto 8) + noperspectiveBarycentricColor2A(31 downto 8);
					currentState <= waitingForWrite;

				when waitingForWrite =>
					if (TEXSAMP_readyForWrite = '1') then
						TEXSAMP_writeIsValid <= '1'; -- Strobe the write request

						--tempBarycentricTexcoordShiftAX := interpolatedTexcoordX srl 1;
						--TEXSAMP_outInterpolatedTexcoordX <= std_logic_vector(tempBarycentricTexcoordShiftAX(15 downto 0) );
						--tempBarycentricTexcoordShiftAY := interpolatedTexcoordY srl 1;
						--TEXSAMP_outInterpolatedTexcoordY <= std_logic_vector(tempBarycentricTexcoordShiftAY(15 downto 0) );

						TEXSAMP_outInterpolatedTexcoordX <= std_logic_vector(interpolatedTexcoordX(24+16-1 downto 24) );
						TEXSAMP_outInterpolatedTexcoordY <= std_logic_vector(interpolatedTexcoordY(24+16-1 downto 24) );

						TEXSAMP_outPixelInterpolatedDepth <= std_logic_vector(pixelDepth);
						if (flatshading = '1') then
							TEXSAMP_outInterpolatedColorRGBA <= std_logic_vector(storedColorRGBA0);
						else
							TEXSAMP_outInterpolatedColorRGBA <= std_logic_vector(interpolatedVertColorA(23 downto 16) & interpolatedVertColorB(23 downto 16) & interpolatedVertColorG(23 downto 16) & interpolatedVertColorR(23 downto 16) );
						end if;
						TEXSAMP_outPixelX <= std_logic_vector(storedPixelX);
						TEXSAMP_outPixelY <= std_logic_vector(storedPixelY);
						currentState <= waitingForRead;
					end if;

				when setNewPrimitiveSlot =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					TRICACHE_CurrentSlotIndex <= std_logic_vector(storedPixelY(1 downto 0) );
					currentState <= waitingForRead;

				when signalPrimitiveComplete =>
					readFromFifo <= '0'; -- Stop reading from the FIFO after one cycle in order to not pull more than one item off of the queue
					TRICACHE_CurrentSlotIndex <= std_logic_vector(storedPixelY(1 downto 0) ); -- This set isn't really necessary...
					TRICACHE_SignalSlotComplete <= '1';
					currentState <= waitingForRead;

			end case;
		end if;
	end process;

end Behavioral;
