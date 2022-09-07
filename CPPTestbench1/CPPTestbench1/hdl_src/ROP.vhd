library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet definition file so that we can use the eBlendMode enum type defined in there
library work;
use work.PacketType.all;

entity ROP is
	Port ( clk : in STD_LOGIC;

	-- Memory Controller FIFO interface begin
		-- DRAM read requests FIFO:
		MEM_ROPReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
        MEM_ROPReadRequestsFIFO_full : in STD_LOGIC;
        MEM_ROPReadRequestsFIFO_wr_en : out STD_LOGIC := '0';

		-- DRAM read responses FIFO:
		MEM_ROPReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR(256+30-1 downto 0);
        MEM_ROPReadResponsesFIFO_empty : in STD_LOGIC;
        MEM_ROPReadResponsesFIFO_rd_en : out STD_LOGIC := '0';

		-- DRAM write requests FIFO:
		MEM_ROPWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(30+256+256/32-1 downto 0) := (others => '0');
        MEM_ROPWriteRequestsFIFO_full : in STD_LOGIC;
        MEM_ROPWriteRequestsFIFO_wr_en : out STD_LOGIC := '0';
	-- Memory Controller FIFO interface end

	-- Command Processor block interface begin
		CMD_SetBlendStateSignal : in STD_LOGIC;
		CMD_SetBlendStateSigAck : out STD_LOGIC := '0';

		CMD_SetClearColor : in STD_LOGIC_VECTOR(31 downto 0);
		CMD_ClearSignal : in STD_LOGIC;
		CMD_ClearSignalAck : out STD_LOGIC := '0';

		CMD_FlushCacheSignal : in STD_LOGIC;
		CMD_FlushCacheAck : out STD_LOGIC := '0';

		CMD_ROPIsIdle : out STD_LOGIC := '0';
		CMD_SetRenderTargetBaseAddr : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_SetBlendMask : in STD_LOGIC_VECTOR(3 downto 0);
		CMD_SetBlendMode : in STD_LOGIC_VECTOR(1 downto 0);
		CMD_SetAlphaTestEnabled : in STD_LOGIC;
		CMD_SetAlphaTestRefVal : in STD_LOGIC_VECTOR(7 downto 0);
		CMD_SetAlphaTestFunc : in STD_LOGIC_VECTOR(2 downto 0);
	-- Command Processor block interface end

	-- Texture Sampler interface begin
		TEXSAMP_outPixelX : in STD_LOGIC_VECTOR(15 downto 0);
		TEXSAMP_outPixelY : in STD_LOGIC_VECTOR(15 downto 0);
		TEXSAMP_outR : in STD_LOGIC_VECTOR(7 downto 0);
		TEXSAMP_outG : in STD_LOGIC_VECTOR(7 downto 0);
		TEXSAMP_outB : in STD_LOGIC_VECTOR(7 downto 0);
		TEXSAMP_outA : in STD_LOGIC_VECTOR(7 downto 0);

		TEXSAMP_writeIsValid : in STD_LOGIC;
		TEXSAMP_writeAck : out STD_LOGIC := '0';
	-- Texture Sampler interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForMemoryRead : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CountCacheHits : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CountCacheMisses : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_ROP_State : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_CurrentPixelAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		DBG_CurrentBlendedColor : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_PreviousFramebufferColor : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_CurrentCacheLineDirtyFlags : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_ReadRequestFIFOFull : out STD_LOGIC := '0'
		);
end ROP;

architecture Behavioral of ROP is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

ATTRIBUTE X_INTERFACE_INFO of MEM_ROPReadRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_ROPReadRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_ROPReadRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO FULL";

ATTRIBUTE X_INTERFACE_INFO of MEM_ROPReadResponsesFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ROPReadResponses RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_ROPReadResponsesFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ROPReadResponses RD_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_ROPReadResponsesFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ROPReadResponses EMPTY";

ATTRIBUTE X_INTERFACE_INFO of MEM_ROPWriteRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_ROPWriteRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_ROPWriteRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO FULL";

type ROPStateType is 
(
	init, -- 0
	waitingForPixelData, -- 1

	doAlphaTest, -- 2
	calcPixelAddress, -- 3
	checkCache, -- 4
	autoFlushSingleCacheLine, -- 5
	requestReadPixel, -- 6
	waitForReadPixel, -- 7
	blendPixel0, -- 8
	blendPixel1, -- 9
	writePixel, -- 10

	setNewBlendState, -- 11
	setNewClear, -- 12
	manualFlushFullCache, -- 13
	manualFlushFullCacheFinish -- 14
);

type alphaTestStateType is record
	alphaTestEnable : std_logic;
	alphaTestRefVal : unsigned(7 downto 0);
	alphaTestFunc : eCmpFunc;
end record alphaTestStateType;

type ROPCacheEntryType is record
	cacheAddrBase : unsigned(24 downto 0);
	cacheData : unsigned(255 downto 0);
	cacheAge : unsigned(1 downto 0); -- 0 is the youngest LRU cache whereas 3 is the oldest cache that is going to get replaced next
	cacheValidWriteDWORDs : unsigned(7 downto 0);
end record ROPCacheEntryType;

type ROPCacheEntries is array(3 downto 0) of ROPCacheEntryType;

signal currentState : ROPStateType := init;
signal newPixelAck : std_logic := '0';
signal setBlendStateAck : std_logic := '0';
signal clearSignalAck : std_logic := '0';
signal flushCacheCommandAck : std_logic := '0';
signal isIdleSig : std_logic := '0';

signal currentPixelX : unsigned(15 downto 0) := (others => '0');
signal currentPixelY : unsigned(15 downto 0) := (others => '0');
signal incomingPixelRGBA : unsigned(31 downto 0) := x"FF000000";
signal baseRenderTargetAddress : unsigned(29 downto 0) := (others => '0');
signal currentPixelAddress : unsigned(29 downto 0) := (others => '0');
signal previousPixelBackbufferRGBA : unsigned(31 downto 0) := x"FF000000";
signal blendedOutputRGBA : unsigned(31 downto 0) := x"FF000000";
signal currentBlendMode : eBlendMode := noBlending;
signal outputDRAMWrite : unsigned(30+256+256/32-1 downto 0) := (others => '0');
signal outputDWORDEnable : unsigned(256/32-1 downto 0) := (others => '1');
signal writeMask : unsigned(3 downto 0) := "1111";
signal currentClearColor : unsigned(31 downto 0) := x"FF000000";
type clearedBlocksArray is array(59 downto 0) of STD_LOGIC_VECTOR(79 downto 0);
signal clearedBlocksBits : clearedBlocksArray := (others => (others => '0') );
signal currentClearRow : unsigned(5 downto 0) := (others => '0');
signal flushCachesLineIndex : unsigned(1 downto 0) := (others => '0');

signal ROPCache : ROPCacheEntries;
signal currentlyUsingCacheEntry : unsigned(1 downto 0) := (others => '0');

signal currentAlphaTestState : alphaTestStateType := (alphaTestEnable => '0', alphaTestRefVal => to_unsigned(0, 8), alphaTestFunc => cmp_always);

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForMemRead : unsigned(31 downto 0) := (others => '0');
signal statCountCacheHits : unsigned(31 downto 0) := (others => '0');
signal statCountCacheMisses : unsigned(31 downto 0) := (others => '0');

-- Implement a multiply by 640 with just bit-shifts and adds (no DSP blocks) as:
-- x * 640 = (x * 512) + (x * 128)
pure function MultBy640(pixelRow : unsigned(15 downto 0) ) return unsigned is
	variable mult512 : unsigned(29 downto 0) := (others => '0');
	variable mult128 : unsigned(29 downto 0) := (others => '0');
begin
	mult512 := resize(pixelRow, mult512'length) sll 9;
	mult128 := resize(pixelRow, mult128'length) sll 7;
	return mult512 + mult128;
end function;

pure function AdditiveBlendSat(originalColorRGBA : unsigned(31 downto 0); incomingColorRGBA : unsigned(31 downto 0) ) return unsigned is
	variable RSat : unsigned(8 downto 0);
	variable GSat : unsigned(8 downto 0);
	variable BSat : unsigned(8 downto 0);
	variable ASat : unsigned(8 downto 0);
begin
	RSat := resize(originalColorRGBA(7 downto 0), RSat'length) + resize(incomingColorRGBA(7 downto 0), RSat'length);
	if (RSat(8) = '1') then
		RSat := (others => '1');
	end if;
	GSat := resize(originalColorRGBA(15 downto 8), GSat'length) + resize(incomingColorRGBA(15 downto 8), GSat'length);
	if (GSat(8) = '1') then
		GSat := (others => '1');
	end if;
	BSat := resize(originalColorRGBA(23 downto 16), BSat'length) + resize(incomingColorRGBA(23 downto 16), BSat'length);
	if (BSat(8) = '1') then
		BSat := (others => '1');
	end if;
	ASat := resize(originalColorRGBA(31 downto 24), ASat'length) + resize(incomingColorRGBA(31 downto 24), ASat'length);
	if (ASat(8) = '1') then
		ASat := (others => '1');
	end if;
	return ASat(7 downto 0) & BSat(7 downto 0) & GSat(7 downto 0) & RSat(7 downto 0);
end function;

pure function AlphaBlend(originalColorRGBA : unsigned(31 downto 0); incomingColorRGBA : unsigned(31 downto 0) ) return unsigned is
	variable rTemp : unsigned(15 downto 0);
	variable gTemp : unsigned(15 downto 0);
	variable bTemp : unsigned(15 downto 0);
	variable aTemp : unsigned(15 downto 0);
begin
	rTemp := (incomingColorRGBA(31 downto 24) * incomingColorRGBA(7 downto 0) ) + ( (not incomingColorRGBA(31 downto 24) ) * originalColorRGBA(7 downto 0) );
	gTemp := (incomingColorRGBA(31 downto 24) * incomingColorRGBA(15 downto 8) ) + ( (not incomingColorRGBA(31 downto 24) ) * originalColorRGBA(15 downto 8) );
	bTemp := (incomingColorRGBA(31 downto 24) * incomingColorRGBA(23 downto 16) ) + ( (not incomingColorRGBA(31 downto 24) ) * originalColorRGBA(23 downto 16) );
	aTemp := (incomingColorRGBA(31 downto 24) * incomingColorRGBA(31 downto 24) ) + ( (not incomingColorRGBA(31 downto 24) ) * originalColorRGBA(31 downto 24) );
	return aTemp(15 downto 8) & bTemp(15 downto 8) & gTemp(15 downto 8) & rTemp(15 downto 8);
end function;

pure function ApplyWriteMask(originalColorRGBA : unsigned(31 downto 0); incomingColorRGBA : unsigned(31 downto 0); writeMask : unsigned(3 downto 0) ) return unsigned is
	variable retVal : unsigned(31 downto 0) := (others => '0');
begin
	if (writeMask(0) = '1') then -- r
		retVal(7 downto 0) := incomingColorRGBA(7 downto 0);
	else
		retVal(7 downto 0) := originalColorRGBA(7 downto 0);
	end if;
	if (writeMask(1) = '1') then -- g
		retVal(15 downto 8) := incomingColorRGBA(15 downto 8);
	else
		retVal(15 downto 8) := originalColorRGBA(15 downto 8);
	end if;
	if (writeMask(2) = '1') then -- b
		retVal(23 downto 16) := incomingColorRGBA(23 downto 16);
	else
		retVal(23 downto 16) := originalColorRGBA(23 downto 16);
	end if;
	if (writeMask(3) = '1') then -- a
		retVal(31 downto 24) := incomingColorRGBA(31 downto 24);
	else
		retVal(31 downto 24) := originalColorRGBA(31 downto 24);
	end if;
	return retVal;
end function;

pure function GetIsCacheLineDirty(originalColorRGBA : unsigned(31 downto 0); incomingColorRGBA : unsigned(31 downto 0); writeMask : unsigned(3 downto 0) ) return std_logic is
begin
	if (writeMask(0) = '1') then -- r
		if (incomingColorRGBA(7 downto 0) /= originalColorRGBA(7 downto 0) ) then
			return '1';
		end if;
	end if;
	if (writeMask(1) = '1') then -- g
		if (incomingColorRGBA(15 downto 8) /= originalColorRGBA(15 downto 8) ) then
			return '1';
		end if;
	end if;
	if (writeMask(2) = '1') then -- b
		if (incomingColorRGBA(23 downto 16) /= originalColorRGBA(23 downto 16) ) then
			return '1';
		end if;
	end if;
	if (writeMask(3) = '1') then -- a
		if (incomingColorRGBA(31 downto 24) /= originalColorRGBA(31 downto 24) ) then
			return '1';
		end if;
	end if;
	return '0';
end function;

-- Return values of '1' indicate that this fragment *passed* the alpha test and should be drawn.
-- Return values of '0' indicate that the fragment *failed* the alpha test and that it should be discarded.
pure function AlphaTest(fragmentAlpha : unsigned(7 downto 0); alphaTestRefVal : unsigned(7 downto 0); alphaTestFunc : eCmpFunc) return std_logic is
begin
	case alphaTestFunc is
		when cmp_never =>
			return '0';

		when cmp_less =>
			if (fragmentAlpha < alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_equal =>
			if (fragmentAlpha = alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_lessequal =>
			if (fragmentAlpha <= alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_greater =>
			if (fragmentAlpha > alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_notequal =>
			if (fragmentAlpha /= alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_greaterequal =>
			if (fragmentAlpha >= alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_always =>
			return '1';

	end case;
end function;

procedure InitializeCacheEntries(signal cacheEntry : out ROPCacheEntryType; constant entryInitialAge : in unsigned(1 downto 0) ) is
begin
	cacheEntry.cacheAddrBase <= (others => '0');
	cacheEntry.cacheData <= (others => '0');
	cacheEntry.cacheAge <= entryInitialAge;
	cacheEntry.cacheValidWriteDWORDs <= (others => '0');
end procedure;

pure function ExpandCacheLineAddress(cacheLineBaseAddress : unsigned(24 downto 0) ) return unsigned is
begin
	return cacheLineBaseAddress & "00000";
end function;

impure function IsPixelAddressInCache(testCacheLineBaseAddr : unsigned(24 downto 0) ) return std_logic is
begin
	if (ROPCache(0).cacheAddrBase = testCacheLineBaseAddr) then
		return '1';
	elsif (ROPCache(1).cacheAddrBase = testCacheLineBaseAddr) then
		return '1';
	elsif (ROPCache(2).cacheAddrBase = testCacheLineBaseAddr) then
		return '1';
	elsif (ROPCache(3).cacheAddrBase = testCacheLineBaseAddr) then
		return '1';
	else
		return '0';
	end if;
end function;

impure function GetCacheIndexForPixel(cacheLineBaseAddr : unsigned(24 downto 0) ) return unsigned is
begin
	if (ROPCache(0).cacheAddrBase = cacheLineBaseAddr) then
		return to_unsigned(0, 2);
	elsif (ROPCache(1).cacheAddrBase = cacheLineBaseAddr) then
		return to_unsigned(1, 2);
	elsif (ROPCache(2).cacheAddrBase = cacheLineBaseAddr) then
		return to_unsigned(2, 2);
	else
		return to_unsigned(3, 2);
	end if;
end function;

-- VHDL syntax looks super weird when making functions that take no arguments. Not only does the function definition look weird, but
-- when you call the function it also has no parenthesis either, which makes it look more like a variable than a function...
impure function GetOldestCacheLineForReplacement return unsigned is
begin
	if (ROPCache(0).cacheAge = 3) then
		return to_unsigned(0, 2);
	elsif (ROPCache(1).cacheAge = 3) then
		return to_unsigned(1, 2);
	elsif (ROPCache(2).cacheAge = 3) then
		return to_unsigned(2, 2);
	else
		return to_unsigned(3, 2);
	end if;
end function;

procedure UpdateCacheLineAges(signal indexOfOldestCacheLine : unsigned(1 downto 0); signal cacheLines : inout ROPCacheEntries) is
begin
	case indexOfOldestCacheLine is
		when "00" =>
			cacheLines(0).cacheAge <= (others => '0');
			cacheLines(1).cacheAge <= cacheLines(1).cacheAge + 1;
			cacheLines(2).cacheAge <= cacheLines(2).cacheAge + 1;
			cacheLines(3).cacheAge <= cacheLines(3).cacheAge + 1;
		when "01" =>
			cacheLines(0).cacheAge <= cacheLines(0).cacheAge + 1;
			cacheLines(1).cacheAge <= (others => '0');
			cacheLines(2).cacheAge <= cacheLines(2).cacheAge + 1;
			cacheLines(3).cacheAge <= cacheLines(3).cacheAge + 1;
		when "10" =>
			cacheLines(0).cacheAge <= cacheLines(0).cacheAge + 1;
			cacheLines(1).cacheAge <= cacheLines(1).cacheAge + 1;
			cacheLines(2).cacheAge <= (others => '0');
			cacheLines(3).cacheAge <= cacheLines(3).cacheAge + 1;
		when others => -- when "11"
			cacheLines(0).cacheAge <= cacheLines(0).cacheAge + 1;
			cacheLines(1).cacheAge <= cacheLines(1).cacheAge + 1;
			cacheLines(2).cacheAge <= cacheLines(2).cacheAge + 1;
			cacheLines(3).cacheAge <= (others => '0');
	end case;
end procedure;

begin

TEXSAMP_writeAck <= newPixelAck;
CMD_SetBlendStateSigAck <= setBlendStateAck;
CMD_ClearSignalAck <= clearSignalAck;
CMD_FlushCacheAck <= flushCacheCommandAck;
CMD_ROPIsIdle <= isIdleSig;
MEM_ROPWriteRequestsFIFO_wr_data <= std_logic_vector(outputDRAMWrite);

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);
STAT_CyclesWaitingForMemoryRead <= std_logic_vector(statCyclesWaitingForMemRead);
STAT_CountCacheHits <= std_logic_vector(statCountCacheHits);
STAT_CountCacheMisses <= std_logic_vector(statCountCacheMisses);

DBG_ROP_State <= std_logic_vector(to_unsigned(ROPStateType'pos(currentState), 4) );
DBG_CurrentPixelAddr <= std_logic_vector(currentPixelAddress);
DBG_ReadRequestFIFOFull <= MEM_ROPReadRequestsFIFO_full;
DBG_CurrentBlendedColor <= std_logic_vector(blendedOutputRGBA);
DBG_PreviousFramebufferColor <= std_logic_vector(previousPixelBackbufferRGBA);
DBG_CurrentCacheLineDirtyFlags <= std_logic_vector(ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs);

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when waitingForPixelData =>
					statCyclesIdle <= statCyclesIdle + 1;

				when checkCache | manualFlushFullCache | manualFlushFullCacheFinish =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when requestReadPixel | waitForReadPixel =>
					statCyclesWaitingForMemRead <= statCyclesWaitingForMemRead + 1;

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
					MEM_ROPReadRequestsFIFO_wr_en <= '0';
					MEM_ROPReadResponsesFIFO_rd_en <= '0';
					MEM_ROPWriteRequestsFIFO_wr_en <= '0';
					setBlendStateAck <= '0';
					isIdleSig <= '0';

					-- TOMTODO: Move this initialization to the default startup value so that we don't need to have the init state actually do as much work
					-- Init cache entries:
					InitializeCacheEntries(ROPCache(0), to_unsigned(0, 2) );
					InitializeCacheEntries(ROPCache(1), to_unsigned(1, 2) );
					InitializeCacheEntries(ROPCache(2), to_unsigned(2, 2) );
					InitializeCacheEntries(ROPCache(3), to_unsigned(3, 2) );

					currentState <= waitingForPixelData;

				when waitingForPixelData =>
					MEM_ROPWriteRequestsFIFO_wr_en <= '0'; -- Deassert after one clock cycle
					setBlendStateAck <= '0'; -- Deassert after one clock cycle
					clearSignalAck <= '0'; -- Deassert after one clock cycle
					flushCacheCommandAck <= '0'; -- Deassert after one clock cycle
					if (CMD_FlushCacheSignal = '1') then
						isIdleSig <= '0';
						flushCachesLineIndex <= (others => '0');
						currentState <= manualFlushFullCache;
					elsif (CMD_SetBlendStateSignal = '1') then
						isIdleSig <= '0';
						currentState <= setNewBlendState;
					elsif (CMD_ClearSignal = '1') then
						isIdleSig <= '0';
						currentState <= setNewClear;
					elsif (TEXSAMP_writeIsValid = '1') then
						newPixelAck <= '1';
						currentPixelX <= unsigned(TEXSAMP_outPixelX);
						currentPixelY <= unsigned(TEXSAMP_outPixelY);
						incomingPixelRGBA <= unsigned(TEXSAMP_outA) & unsigned(TEXSAMP_outB) & unsigned(TEXSAMP_outG) & unsigned(TEXSAMP_outR);
						isIdleSig <= '0';
						if (currentAlphaTestState.alphaTestEnable = '1') then
							currentState <= doAlphaTest;
						else
							currentState <= calcPixelAddress; -- Skip the alpha test if it's not enabled
						end if;
					else
						newPixelAck <= '0';
						isIdleSig <= '1';
					end if;

				when doAlphaTest =>
					if (AlphaTest(incomingPixelRGBA(31 downto 24), currentAlphaTestState.alphaTestRefVal, currentAlphaTestState.alphaTestFunc) = '1') then
						currentState <= calcPixelAddress; -- We passed the alpha test, continue drawing this pixel!
					else
						currentState <= waitingForPixelData; -- We failed the alpha test, discard this pixel!
					end if;

				when calcPixelAddress =>
					newPixelAck <= '0'; -- Deassert after one clock cycle
					currentPixelAddress <= ( (MultBy640(currentPixelY) + resize(currentPixelX, currentPixelAddress'length) ) sll 2) + baseRenderTargetAddress; -- sll 2 because sizeof(RGBAPixel) == 4
					currentState <= checkCache;

				when checkCache =>
					MEM_ROPReadResponsesFIFO_rd_en <= '0';
					if (IsPixelAddressInCache(currentPixelAddress(29 downto 5) ) = '1') then
						case currentPixelX(2 downto 0) is
							when "111" =>
								previousPixelBackbufferRGBA <= ROPCache(to_integer(GetCacheIndexForPixel(currentPixelAddress(29 downto 5) ) ) ).cacheData(32*8-1 downto 32*7);
							when "110" =>
								previousPixelBackbufferRGBA <= ROPCache(to_integer(GetCacheIndexForPixel(currentPixelAddress(29 downto 5) ) ) ).cacheData(32*7-1 downto 32*6);
							when "101" =>
								previousPixelBackbufferRGBA <= ROPCache(to_integer(GetCacheIndexForPixel(currentPixelAddress(29 downto 5) ) ) ).cacheData(32*6-1 downto 32*5);
							when "100" =>
								previousPixelBackbufferRGBA <= ROPCache(to_integer(GetCacheIndexForPixel(currentPixelAddress(29 downto 5) ) ) ).cacheData(32*5-1 downto 32*4);
							when "011" =>
								previousPixelBackbufferRGBA <= ROPCache(to_integer(GetCacheIndexForPixel(currentPixelAddress(29 downto 5) ) ) ).cacheData(32*4-1 downto 32*3);
							when "010" =>
								previousPixelBackbufferRGBA <= ROPCache(to_integer(GetCacheIndexForPixel(currentPixelAddress(29 downto 5) ) ) ).cacheData(32*3-1 downto 32*2);
							when "001" =>
								previousPixelBackbufferRGBA <= ROPCache(to_integer(GetCacheIndexForPixel(currentPixelAddress(29 downto 5) ) ) ).cacheData(32*2-1 downto 32*1);
							when others => -- when "000" =>
								previousPixelBackbufferRGBA <= ROPCache(to_integer(GetCacheIndexForPixel(currentPixelAddress(29 downto 5) ) ) ).cacheData(32*1-1 downto 32*0);
						end case;
						currentlyUsingCacheEntry <= GetCacheIndexForPixel(currentPixelAddress(29 downto 5) );
						statCountCacheHits <= statCountCacheHits + 1;

						if (currentBlendMode /= noBlending) then
							currentState <= blendPixel0;
						else
							blendedOutputRGBA <= incomingPixelRGBA;
							currentState <= writePixel;
						end if;
					else
						if (MEM_ROPWriteRequestsFIFO_full = '0') then
							if (ROPCache(to_integer(GetOldestCacheLineForReplacement ) ).cacheValidWriteDWORDs /= "00000000") then
								MEM_ROPWriteRequestsFIFO_wr_en <= '1';
								outputDRAMWrite(7 downto 0) <= ROPCache(to_integer(GetOldestCacheLineForReplacement ) ).cacheValidWriteDWORDs;
								outputDRAMWrite(256+256/32-1 downto 256/32) <= ROPCache(to_integer(GetOldestCacheLineForReplacement ) ).cacheData;
								outputDRAMWrite(30+256+256/32-1 downto 256+256/32) <= ExpandCacheLineAddress(ROPCache(to_integer(GetOldestCacheLineForReplacement ) ).cacheAddrBase);
							end if;
							currentlyUsingCacheEntry <= GetOldestCacheLineForReplacement;
							statCountCacheMisses <= statCountCacheMisses + 1;
							currentState <= autoFlushSingleCacheLine;
						end if;
					end if;

				when autoFlushSingleCacheLine =>
					MEM_ROPWriteRequestsFIFO_wr_en <= '0'; -- Deassert after one clock
					ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs <= (others => '0');
					ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheAddrBase <= currentPixelAddress(29 downto 5);
					currentState <= requestReadPixel;

				when requestReadPixel =>
					if (MEM_ROPReadRequestsFIFO_full = '0') then
						MEM_ROPReadRequestsFIFO_wr_data <= std_logic_vector(currentPixelAddress and "111111111111111111111111100000");
						MEM_ROPReadRequestsFIFO_wr_en <= '1';
						currentState <= waitForReadPixel;
					else
						MEM_ROPReadRequestsFIFO_wr_en <= '0';
					end if;

				when waitForReadPixel =>
					MEM_ROPReadRequestsFIFO_wr_en <= '0'; -- Deassert after one clock cycle
					if (MEM_ROPReadResponsesFIFO_empty = '0') then
						ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData <= unsigned(MEM_ROPReadResponsesFIFO_rd_data(255 downto 0) );
						MEM_ROPReadResponsesFIFO_rd_en <= '1';
						UpdateCacheLineAges(currentlyUsingCacheEntry, ROPCache); -- Update the cache ages for all of our cache lines (youngest becomes 0, oldest to 3)
						currentState <= checkCache;
					end if;

				when blendPixel0 =>
					MEM_ROPReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
					case currentBlendMode is
						when additiveColorBlend =>
							blendedOutputRGBA <= AdditiveBlendSat(previousPixelBackbufferRGBA, incomingPixelRGBA);
						when alphaBlend =>
							blendedOutputRGBA <= AlphaBlend(previousPixelBackbufferRGBA, incomingPixelRGBA);
						when others => -- when noBlending =>
							blendedOutputRGBA <= incomingPixelRGBA;
					end case;
					currentState <= blendPixel1;

				when blendPixel1 => -- We need an extra clock cycle for the alpha blend DSP multipliers to settle
					currentState <= writePixel;

				when writePixel =>
					case currentPixelX(2 downto 0) is
						when "111" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*8-1 downto 32*7) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(7) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(7) );
						when "110" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*7-1 downto 32*6) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(6) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(6) );
						when "101" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*6-1 downto 32*5) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(5) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(5) );
						when "100" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*5-1 downto 32*4) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(4) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(4) );
						when "011" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*4-1 downto 32*3) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(3) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(3) );
						when "010" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*3-1 downto 32*2) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(2) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(2) );
						when "001" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*2-1 downto 32*1) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(1) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(1) );
						when others => -- when "000" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*1-1 downto 32*0) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(0) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(0) );
					end case;
					currentState <= waitingForPixelData;

				when setNewBlendState =>
					baseRenderTargetAddress <= unsigned(CMD_SetRenderTargetBaseAddr);
					writeMask <= unsigned(CMD_SetBlendMask);
					currentBlendMode <= eBlendMode'val(to_integer(unsigned(CMD_SetBlendMode) ) );

					-- Set our new alpha test states:
					currentAlphaTestState.alphaTestEnable <= CMD_SetAlphaTestEnabled;
					currentAlphaTestState.alphaTestRefVal <= unsigned(CMD_SetAlphaTestRefVal);
					currentAlphaTestState.alphaTestFunc <= eCmpFunc'val(to_integer(unsigned(CMD_SetAlphaTestFunc) ) );

					setBlendStateAck <= '1'; -- Signal an ack for our new blend mode

					currentState <= waitingForPixelData;

				when setNewClear =>
					clearSignalAck <= '1';
					currentClearColor <= unsigned(CMD_SetClearColor);

					if (currentClearRow >= 60) then
						currentState <= waitingForPixelData;
					else
						clearedBlocksBits(to_integer(currentClearRow) ) <= (others => '1');
						currentClearRow <= currentClearRow + 1;
					end if;

				when manualFlushFullCache =>
					if (MEM_ROPWriteRequestsFIFO_full = '0') then
						if (ROPCache(to_integer(flushCachesLineIndex) ).cacheValidWriteDWORDs /= "00000000") then
							MEM_ROPWriteRequestsFIFO_wr_en <= '1';
							outputDRAMWrite(7 downto 0) <= ROPCache(to_integer(flushCachesLineIndex) ).cacheValidWriteDWORDs;
							outputDRAMWrite(30+256+256/32-1 downto 256+256/32) <= ExpandCacheLineAddress(ROPCache(to_integer(flushCachesLineIndex) ).cacheAddrBase);
							outputDRAMWrite(256+256/32-1 downto 256/32) <= ROPCache(to_integer(flushCachesLineIndex) ).cacheData;
						else
							MEM_ROPWriteRequestsFIFO_wr_en <= '0';
						end if;

						-- Reset the cache line after writing its data into the memory write FIFO:
						ROPCache(to_integer(flushCachesLineIndex) ).cacheAddrBase <= (others => '0');
						ROPCache(to_integer(flushCachesLineIndex) ).cacheValidWriteDWORDs <= (others => '0');
						ROPCache(to_integer(flushCachesLineIndex) ).cacheAge <= flushCachesLineIndex;

						flushCachesLineIndex <= flushCachesLineIndex + 1;

						if (flushCachesLineIndex = 3) then
							currentState <= manualFlushFullCacheFinish;
						end if;
					else
						MEM_ROPWriteRequestsFIFO_wr_en <= '0';
					end if;

				when manualFlushFullCacheFinish =>
					MEM_ROPWriteRequestsFIFO_wr_en <= '0'; -- Deassert after one clock cycle
					flushCacheCommandAck <= '1';
					currentState <= waitingForPixelData;

			end case;
		end if;
	end process;

end Behavioral;
