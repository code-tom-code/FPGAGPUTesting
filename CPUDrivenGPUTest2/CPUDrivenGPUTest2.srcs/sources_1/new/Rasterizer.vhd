library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity Rasterizer is
	Port ( clk : in STD_LOGIC;

	-- Triangle Setup interface begin
		TRISETUP_newTriBegin : in STD_LOGIC;
		TRISETUP_readyForNewTri : out STD_LOGIC := '0';

		TRISETUP_inMinX : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inMaxX : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inMinY : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inMaxY : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inInitialBarycentricRowResetA : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_inInitialBarycentricRowResetB : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_inInitialBarycentricRowResetC : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_inIsTopLeftEdgeA : in STD_LOGIC;
		TRISETUP_inIsTopLeftEdgeB : in STD_LOGIC;
		TRISETUP_inIsTopLeftEdgeC : in STD_LOGIC;
		TRISETUP_inBarycentricXDeltaA : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inBarycentricXDeltaB : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inBarycentricXDeltaC : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inBarycentricYDeltaA : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inBarycentricYDeltaB : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inBarycentricYDeltaC : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inBarycentricInverse : in STD_LOGIC_VECTOR(31 downto 0);

		TRISETUP_inInvZ0 : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_inInvZ1 : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_inInvZ2 : in STD_LOGIC_VECTOR(31 downto 0);

		TRISETUP_inTX0 : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inTY0 : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inTX1 : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inTY1 : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inTX2 : in STD_LOGIC_VECTOR(15 downto 0);
		TRISETUP_inTY2 : in STD_LOGIC_VECTOR(15 downto 0);

		TRISETUP_inVertColor0 : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_inVertColor1 : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_inVertColor2 : in STD_LOGIC_VECTOR(31 downto 0);
	-- Triangle Setup interface end

	-- Rasterizer Output FIFO interface begin
		RASTOUT_FIFO_full : in STD_LOGIC;
		RASTOUT_FIFO_almost_full : in STD_LOGIC;
		RASTOUT_FIFO_wr_data : out STD_LOGIC_VECTOR(32+32+32+16+16 - 1 downto 0) := (others => '0');
		RASTOUT_FIFO_wr_en : out STD_LOGIC := '0';
	-- Rasterizer Output FIFO interface end
		
	-- TriWorkCache interface begin
		TRICACHE_BarycentricInverse : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRICACHE_PrimitiveID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRICACHE_DrawCallID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRICACHE_VFACE : out STD_LOGIC := '0';

		TRICACHE_InvZ0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRICACHE_InvZ1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRICACHE_InvZ2 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		TRICACHE_TX0 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRICACHE_TX1 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRICACHE_TX2 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

		TRICACHE_TY0 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRICACHE_TY1 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRICACHE_TY2 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

		TRICACHE_VertColor0 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRICACHE_VertColor1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRICACHE_VertColor2 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		TRICACHE_RequestNewTriSlot : out STD_LOGIC := '0';
		TRICACHE_NewTriSlotIndexValid : in STD_LOGIC;
		TRICACHE_NewTriSlotIndex : in STD_LOGIC_VECTOR(2 downto 0);
	-- TriWorkCache interface end

	-- Command Processor system interface begin
		CMD_Rasterizer_Idle : out STD_LOGIC := '0';
	-- Command Processor system interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForTriWorkCache : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_Rasterizer_State : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_PixelXPos : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_PixelYPos : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_BarycentricA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_BarycentricB : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_BarycentricC : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_MinX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MaxX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MinY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MaxY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0')
		);
end Rasterizer;

architecture Behavioral of Rasterizer is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO FULL";
ATTRIBUTE X_INTERFACE_INFO of RASTOUT_FIFO_almost_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 RASTOUT_FIFO ALMOST_FULL";

	type state_t is (
		triRasterize_waitForTriData, -- 0

		-- Finally, loop over and rasterize the whole triangle
		triRasterize_mainLoop, -- 1
		triRasterize_waitForWriteComplete, -- 2
		triRasterize_allocateNewTriCacheSlot, -- 3
		triRasterize_sendSetNewTriSlotCommand, -- 4
		triRasterize_sendFinishTriCommand -- 5
		);

type vertexTexcoord is record
	tx : unsigned(15 downto 0);
	ty : unsigned(15 downto 0);
end record vertexTexcoord;

type vertexColor is record
	r : unsigned(7 downto 0);
	g : unsigned(7 downto 0);
	b : unsigned(7 downto 0);
	a : unsigned(7 downto 0);
end record vertexColor;

type vertexAttributes is record
	texcoord : vertexTexcoord;
	color : vertexColor;
	invZ : unsigned(31 downto 0);
end record vertexAttributes;

type rasterizedPixelData is record
	barycentricA : signed(31 downto 0);
	barycentricB : signed(31 downto 0);
	barycentricC : signed(31 downto 0);
	pixelX : unsigned(15 downto 0);
	pixelY : unsigned(15 downto 0);
end record rasterizedPixelData;

constant zeroInitPixelData : rasterizedPixelData := (barycentricA => (others => '0'), barycentricB => (others => '0'), barycentricC => (others => '0'), pixelX => (others => '0'), pixelY => (others => '0') );

	pure function barycentricInside(barycentricVal : signed(31 downto 0) ) return boolean is
	begin
		return (barycentricVal > -1);
	end function;

	procedure StoreRasterizedPixelData(signal inPixelX : in unsigned(15 downto 0); signal inPixelY : in unsigned(15 downto 0); 
		variable inBarycentricA : in signed(31 downto 0); variable inBarycentricB : in signed(31 downto 0); variable inBarycentricC : in signed(31 downto 0);
		signal fillPixelData : out rasterizedPixelData) is
	begin
		fillPixelData.barycentricA <= inBarycentricA;
		fillPixelData.barycentricB <= inBarycentricB;
		fillPixelData.barycentricC <= inBarycentricC;
		fillPixelData.pixelX <= inPixelX;
		fillPixelData.pixelY <= inPixelY;
	end procedure;

signal minX : unsigned(15 downto 0) := (others => '0');
signal minY : unsigned(15 downto 0) := (others => '0');
signal maxX : unsigned(15 downto 0) := (others => '0');
signal maxY : unsigned(15 downto 0) := (others => '0');

signal barycentricA : signed(31 downto 0) := (others => '0');
signal barycentricB : signed(31 downto 0) := (others => '0');
signal barycentricC : signed(31 downto 0) := (others => '0');

signal isTopLeftEdgeA : STD_LOGIC := '0';
signal isTopLeftEdgeB : STD_LOGIC := '0';
signal isTopLeftEdgeC : STD_LOGIC := '0';

signal barycentricRowResetA : signed(31 downto 0) := (others => '0');
signal barycentricRowResetB : signed(31 downto 0) := (others => '0');
signal barycentricRowResetC : signed(31 downto 0) := (others => '0');

signal barycentricXDeltaA : signed(15 downto 0) := (others => '0');
signal barycentricXDeltaB : signed(15 downto 0) := (others => '0');
signal barycentricXDeltaC : signed(15 downto 0) := (others => '0');

signal barycentricYDeltaA : signed(15 downto 0) := (others => '0');
signal barycentricYDeltaB : signed(15 downto 0) := (others => '0');
signal barycentricYDeltaC : signed(15 downto 0) := (others => '0');

signal barycentricInverse : unsigned(31 downto 0) := (others => '0');

signal pixelXPos : unsigned(15 downto 0) := (others => '0'); -- stores values from 0 to 64k, but we only need from 0 to 800
signal pixelYPos : unsigned(15 downto 0) := (others => '0'); -- stores values from 0 to 64k, but we only need from 0 to 525

signal currentState : state_t := triRasterize_waitForTriData;

signal stats_totalPixelsRasterized : unsigned(31 downto 0) := (others => '0');

signal readyForNewTri : STD_LOGIC := '0';

signal hasWrittenPixelsForThisTriangle : std_logic := '0';
signal currentTriangleAllocatedSlot : unsigned(2 downto 0) := (others => '0');

signal fifoWriteData : STD_LOGIC_VECTOR(32+32+32+16+16 - 1 downto 0) := (others => '0');
signal fifoWriteEnable : STD_LOGIC := '0';

signal vertDataA : vertexAttributes;
signal vertDataB : vertexAttributes;
signal vertDataC : vertexAttributes;

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForTriWorkCache : unsigned(31 downto 0) := (others => '0');

signal writeOutPixelData : rasterizedPixelData := zeroInitPixelData;

begin

TRISETUP_readyForNewTri <= readyForNewTri;
RASTOUT_FIFO_wr_data <= fifoWriteData;
RASTOUT_FIFO_wr_en <= fifoWriteEnable;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);
STAT_CyclesWaitingForTriWorkCache <= std_logic_vector(statCyclesWaitingForTriWorkCache);

DBG_Rasterizer_State <= std_logic_vector(to_unsigned(state_t'pos(currentState), 4) );
DBG_PixelXPos <= std_logic_vector(pixelXPos);
DBG_PixelYPos <= std_logic_vector(pixelYPos);
DBG_BarycentricA <= std_logic_vector(barycentricA);
DBG_BarycentricB <= std_logic_vector(barycentricB);
DBG_BarycentricC <= std_logic_vector(barycentricC);
DBG_MinX <= std_logic_vector(minX);
DBG_MaxX <= std_logic_vector(maxX);
DBG_MinY <= std_logic_vector(minY);
DBG_MaxY <= std_logic_vector(maxY);

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when triRasterize_waitForTriData =>
					statCyclesIdle <= statCyclesIdle + 1;

				when triRasterize_waitForWriteComplete | triRasterize_sendSetNewTriSlotCommand | triRasterize_sendFinishTriCommand =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when triRasterize_allocateNewTriCacheSlot =>
					statCyclesWaitingForTriWorkCache <= statCyclesWaitingForTriWorkCache + 1;

				when others =>
					statCyclesWorking <= statCyclesWorking + 1;
			end case;
		end if;
	end process;

	process(clk)
		variable tempBarycentricA : signed(31 downto 0);
		variable tempBarycentricB : signed(31 downto 0);
		variable tempBarycentricC : signed(31 downto 0);
	begin
		if (rising_edge(clk) ) then
			case currentState is
				-- Load new triangle data
				when triRasterize_waitForTriData =>
					fifoWriteEnable <= '0';
					if (TRISETUP_newTriBegin = '1' and readyForNewTri = '1') then
						pixelXPos <= unsigned(TRISETUP_inMinX);
						pixelYPos <= unsigned(TRISETUP_inMinY);

						CMD_Rasterizer_Idle <= '0'; -- We just got some new work, cancel our idle state!

						fifoWriteEnable <= '0';

						-- Read in all of our variables from Triangle Setup so that TriSetup can move on to processing the next triangle and
						-- so that we can work on rasterizing our triangles purely from internal registers alone
						minX <= unsigned(TRISETUP_inMinX);
						maxX <= unsigned(TRISETUP_inMaxX);
						minY <= unsigned(TRISETUP_inMinY);
						maxY <= unsigned(TRISETUP_inMaxY);
						isTopLeftEdgeA <= TRISETUP_inIsTopLeftEdgeA;
						isTopLeftEdgeB <= TRISETUP_inIsTopLeftEdgeB;
						isTopLeftEdgeC <= TRISETUP_inIsTopLeftEdgeC;
						barycentricRowResetA <= signed(TRISETUP_inInitialBarycentricRowResetA);
						barycentricRowResetB <= signed(TRISETUP_inInitialBarycentricRowResetB);
						barycentricRowResetC <= signed(TRISETUP_inInitialBarycentricRowResetC);
						barycentricXDeltaA <= signed(TRISETUP_inBarycentricXDeltaA);
						barycentricXDeltaB <= signed(TRISETUP_inBarycentricXDeltaB);
						barycentricXDeltaC <= signed(TRISETUP_inBarycentricXDeltaC);
						barycentricYDeltaA <= signed(TRISETUP_inBarycentricYDeltaA);
						barycentricYDeltaB <= signed(TRISETUP_inBarycentricYDeltaB);
						barycentricYDeltaC <= signed(TRISETUP_inBarycentricYDeltaC);
						barycentricInverse <= unsigned(TRISETUP_inBarycentricInverse);

						vertDataA.texcoord.tx <= unsigned(TRISETUP_inTX0);
						vertDataA.texcoord.ty <= unsigned(TRISETUP_inTY0);
						vertDataA.color.r <= unsigned(TRISETUP_inVertColor0(7 downto 0) );
						vertDataA.color.g <= unsigned(TRISETUP_inVertColor0(15 downto 8) );
						vertDataA.color.b <= unsigned(TRISETUP_inVertColor0(23 downto 16) );
						vertDataA.color.a <= unsigned(TRISETUP_inVertColor0(31 downto 24) );
						vertDataA.invZ <= unsigned(TRISETUP_inInvZ0);

						vertDataB.texcoord.tx <= unsigned(TRISETUP_inTX1);
						vertDataB.texcoord.ty <= unsigned(TRISETUP_inTY1);
						vertDataB.color.r <= unsigned(TRISETUP_inVertColor1(7 downto 0) );
						vertDataB.color.g <= unsigned(TRISETUP_inVertColor1(15 downto 8) );
						vertDataB.color.b <= unsigned(TRISETUP_inVertColor1(23 downto 16) );
						vertDataB.color.a <= unsigned(TRISETUP_inVertColor1(31 downto 24) );
						vertDataB.invZ <= unsigned(TRISETUP_inInvZ1);

						vertDataC.texcoord.tx <= unsigned(TRISETUP_inTX2);
						vertDataC.texcoord.ty <= unsigned(TRISETUP_inTY2);
						vertDataC.color.r <= unsigned(TRISETUP_inVertColor2(7 downto 0) );
						vertDataC.color.g <= unsigned(TRISETUP_inVertColor2(15 downto 8) );
						vertDataC.color.b <= unsigned(TRISETUP_inVertColor2(23 downto 16) );
						vertDataC.color.a <= unsigned(TRISETUP_inVertColor2(31 downto 24) );
						vertDataC.invZ <= unsigned(TRISETUP_inInvZ2);

						-- Set the initial values of our barycentric coordinates to the starting row reset values:
						barycentricA <= signed(TRISETUP_inInitialBarycentricRowResetA) + resize(signed(TRISETUP_inBarycentricXDeltaA), barycentricA'length);
						barycentricB <= signed(TRISETUP_inInitialBarycentricRowResetB) + resize(signed(TRISETUP_inBarycentricXDeltaB), barycentricB'length);
						barycentricC <= signed(TRISETUP_inInitialBarycentricRowResetC) + resize(signed(TRISETUP_inBarycentricXDeltaC), barycentricC'length);

						hasWrittenPixelsForThisTriangle <= '0';

						readyForNewTri <= '0';
						currentState <= triRasterize_mainLoop;
					else
						if (readyForNewTri = '1') then
							CMD_Rasterizer_Idle <= '1'; -- Waiting for more than one cycle in a row means that we're idle
						else
							readyForNewTri <= '1';
						end if;
					end if;

				when triRasterize_mainLoop =>
					fifoWriteEnable <= '0';
					if (pixelXPos < maxX and pixelYPos <= maxY) then
						if (barycentricInside(barycentricA) and barycentricInside(barycentricB) and barycentricInside(barycentricC) ) then
							if (isTopLeftEdgeA = '0') then
								tempBarycentricA := barycentricA + 1;
							else
								tempBarycentricA := barycentricA;
							end if;
							if (isTopLeftEdgeB = '0') then
								tempBarycentricB := barycentricB + 1;
							else
								tempBarycentricB := barycentricB;
							end if;
							if (isTopLeftEdgeC = '0') then
								tempBarycentricC := barycentricC + 1;
							else
								tempBarycentricC := barycentricC;
							end if;

							if (RASTOUT_FIFO_full = '0' and RASTOUT_FIFO_almost_full = '0' and hasWrittenPixelsForThisTriangle = '1') then
								fifoWriteEnable <= '1';
								fifoWriteData <= std_logic_vector(pixelYPos) & std_logic_vector(pixelXPos) & 
									std_logic_vector(tempBarycentricC) & std_logic_vector(tempBarycentricB) & std_logic_vector(tempBarycentricA);
								hasWrittenPixelsForThisTriangle <= '1';
								stats_totalPixelsRasterized <= stats_totalPixelsRasterized + 1;
							else
								StoreRasterizedPixelData(pixelXPos, pixelYPos, tempBarycentricA, tempBarycentricB, tempBarycentricC, writeOutPixelData);
								currentState <= triRasterize_waitForWriteComplete;
							end if;

							if (hasWrittenPixelsForThisTriangle = '0') then
								currentState <= triRasterize_allocateNewTriCacheSlot;
							end if;
						end if;

						-- We haven't reached anything, keep marching pixels along to the right (+X direction)
						pixelXPos <= pixelXPos + 1;
						barycentricA <= barycentricA + resize(barycentricXDeltaA, barycentricA'length);
						barycentricB <= barycentricB + resize(barycentricXDeltaB, barycentricB'length);
						barycentricC <= barycentricC + resize(barycentricXDeltaC, barycentricC'length);
					elsif (pixelYPos > maxY) then
						-- We've reached the bottom! We're done with this triangle!
						if (hasWrittenPixelsForThisTriangle = '1') then
							currentState <= triRasterize_sendFinishTriCommand;
						else
							currentState <= triRasterize_waitForTriData;
						end if;
					else --elsif (pixelXPos = maxX) then
						-- We've reached the rightmost pixel, time to restart at the left again:
						pixelXPos <= minX;
						pixelYPos <= pixelYPos + 1;
						barycentricA <= barycentricRowResetA + resize(barycentricYDeltaA, barycentricRowResetA'length) + resize(barycentricXDeltaA, barycentricRowResetA'length);
						barycentricB <= barycentricRowResetB + resize(barycentricYDeltaB, barycentricRowResetB'length) + resize(barycentricXDeltaB, barycentricRowResetB'length);
						barycentricC <= barycentricRowResetC + resize(barycentricYDeltaC, barycentricRowResetC'length) + resize(barycentricXDeltaC, barycentricRowResetC'length);
						barycentricRowResetA <= barycentricRowResetA + resize(barycentricYDeltaA, barycentricRowResetA'length);
						barycentricRowResetB <= barycentricRowResetB + resize(barycentricYDeltaB, barycentricRowResetB'length);
						barycentricRowResetC <= barycentricRowResetC + resize(barycentricYDeltaC, barycentricRowResetC'length);
					end if;

				when triRasterize_waitForWriteComplete =>
					if (RASTOUT_FIFO_full = '0' and RASTOUT_FIFO_almost_full = '0') then
						fifoWriteEnable <= '1';
						fifoWriteData <= std_logic_vector(writeOutPixelData.pixelY) & std_logic_vector(writeOutPixelData.pixelX) & 
							std_logic_vector(writeOutPixelData.barycentricC) & std_logic_vector(writeOutPixelData.barycentricB) & std_logic_vector(writeOutPixelData.barycentricA);

						hasWrittenPixelsForThisTriangle <= '1';
						stats_totalPixelsRasterized <= stats_totalPixelsRasterized + 1;

						currentState <= triRasterize_mainLoop;
					else
						fifoWriteEnable <= '0';
					end if;

				when triRasterize_allocateNewTriCacheSlot =>
					if (TRICACHE_NewTriSlotIndexValid = '1') then
						currentTriangleAllocatedSlot <= unsigned(TRICACHE_NewTriSlotIndex);
						TRICACHE_RequestNewTriSlot <= '0';
						currentState <= triRasterize_sendSetNewTriSlotCommand;
					else
						TRICACHE_TX0 <= std_logic_vector(vertDataA.texcoord.tx);
						TRICACHE_TY0 <= std_logic_vector(vertDataA.texcoord.ty);
						TRICACHE_VertColor0 <= std_logic_vector(vertDataA.color.a & vertDataA.color.b & vertDataA.color.g & vertDataA.color.r);
						TRICACHE_InvZ0 <= std_logic_vector(vertDataA.invZ);

						TRICACHE_TX1 <= std_logic_vector(vertDataB.texcoord.tx);
						TRICACHE_TY1 <= std_logic_vector(vertDataB.texcoord.ty);
						TRICACHE_VertColor1 <= std_logic_vector(vertDataB.color.a & vertDataB.color.b & vertDataB.color.g & vertDataB.color.r);
						TRICACHE_InvZ1 <= std_logic_vector(vertDataB.invZ);

						TRICACHE_TX2 <= std_logic_vector(vertDataC.texcoord.tx);
						TRICACHE_TY2 <= std_logic_vector(vertDataC.texcoord.ty);
						TRICACHE_VertColor2 <= std_logic_vector(vertDataC.color.a & vertDataC.color.b & vertDataC.color.g & vertDataC.color.r);
						TRICACHE_InvZ2 <= std_logic_vector(vertDataC.invZ);

						TRICACHE_BarycentricInverse <= std_logic_vector(barycentricInverse);
						TRICACHE_PrimitiveID <= (others => '0'); -- TODO: Implement primitive ID
						TRICACHE_DrawCallID <= (others => '0');
						TRICACHE_VFACE <= '1';

						TRICACHE_RequestNewTriSlot <= '1';
					end if;

				when triRasterize_sendSetNewTriSlotCommand =>
					if (RASTOUT_FIFO_full = '0' and RASTOUT_FIFO_almost_full = '0') then
						fifoWriteEnable <= '1';
						fifoWriteData <= "0000000000000" & std_logic_vector(currentTriangleAllocatedSlot) & x"FFFE" & -- FFFE means "set this new triangle slot"
							x"00000000" & x"00000000" & x"00000000";

						currentState <= triRasterize_waitForWriteComplete;
					else
						fifoWriteEnable <= '0';
					end if;

				when triRasterize_sendFinishTriCommand =>
					if (RASTOUT_FIFO_full = '0' and RASTOUT_FIFO_almost_full = '0') then
						fifoWriteEnable <= '1';
						fifoWriteData <= "0000000000000" & std_logic_vector(currentTriangleAllocatedSlot) & x"FFFF" & -- FFFF means "finish this triangle"
							x"00000000" & x"00000000" & x"00000000";

						currentState <= triRasterize_waitForTriData;
					else
						fifoWriteEnable <= '0';
					end if;
			end case;
		end if;
	end process;

end Behavioral;
