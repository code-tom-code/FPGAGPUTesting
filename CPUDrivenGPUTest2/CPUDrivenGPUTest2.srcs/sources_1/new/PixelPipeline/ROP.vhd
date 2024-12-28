library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet definition file so that we can use the eCmpFunc enum type defined in there
library work;
use work.PacketType.all;
use work.PixelPipeline_Types.all;
use work.ROPState.all;

entity ROP is
	Port ( clk : in STD_LOGIC;

	-- Memory Controller FIFO interface begin
		-- DRAM read requests FIFO:
		MEM_ROPReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
        MEM_ROPReadRequestsFIFO_full : in STD_LOGIC;
        MEM_ROPReadRequestsFIFO_wr_en : out STD_LOGIC := '0';

		-- DRAM read responses FIFO:
		MEM_ROPReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR(256-1 downto 0);
        MEM_ROPReadResponsesFIFO_empty : in STD_LOGIC;
        MEM_ROPReadResponsesFIFO_rd_en : out STD_LOGIC := '0';

		-- DRAM write requests FIFO:
		MEM_ROPWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(30+256+256/32-1 downto 0) := (others => '0');
        MEM_ROPWriteRequestsFIFO_full : in STD_LOGIC;
        MEM_ROPWriteRequestsFIFO_wr_en : out STD_LOGIC := '0';
	-- Memory Controller FIFO interface end

	-- Command Processor block interface begin
		CMD_SetClearColor : in STD_LOGIC_VECTOR(31 downto 0);
		CMD_ClearSignal : in STD_LOGIC;
		CMD_ClearSignalAck : out STD_LOGIC := '0';

		CMD_FlushCacheSignal : in STD_LOGIC;
		CMD_FlushCacheAck : out STD_LOGIC := '0';

		CMD_ROPIsIdle : out STD_LOGIC := '0';
	-- Command Processor block interface end

	-- ROP State Block interface begin
		STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR(ROP_STATE_SIZE_BITS-1 downto 0);
		STATE_NextDrawID : in STD_LOGIC_VECTOR(15 downto 0);
		STATE_StateIsValid : in STD_LOGIC;
		STATE_ConsumeStateSlot : out STD_LOGIC := '0';
	-- ROP State Block interface end

	-- Texture Sampler FIFO interface begin
		TEXSAMP_InFIFO_rd_data : in STD_LOGIC_VECTOR(63 downto 0); -- 8 bytes of input data per pixel to the ROP unit
        TEXSAMP_InFIFO_empty : in STD_LOGIC;
        TEXSAMP_InFIFO_rd_en : out STD_LOGIC := '0';
	-- Texture Sampler FIFO interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForMemoryRead : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CountCacheHits : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CountCacheMisses : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		STAT_CountPixelsPassed : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_ROP_State : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_CurrentPixelAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		DBG_CurrentBlendedColor : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_PreviousFramebufferColor : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_CurrentCacheLineDirtyFlags : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_TempSelectedOutputRGB : out STD_LOGIC_VECTOR(47 downto 0) := (others => '0');
		DBG_TempSelectedOutputA : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_TempBlendedOutputRGB : out STD_LOGIC_VECTOR(95 downto 0) := (others => '0');
		DBG_TempBlendedOutputA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
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

ATTRIBUTE X_INTERFACE_INFO of TEXSAMP_InFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of TEXSAMP_InFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of TEXSAMP_InFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO EMPTY";

type ROPStateType is 
(
	waitingForPixelData, -- 0

	doAlphaTest, -- 1
	calcPixelAddress, -- 2
	checkCache, -- 3
	autoFlushSingleCacheLine, -- 4
	requestReadPixel, -- 5
	waitForReadPixel, -- 6
	blendPixel0, -- 7
	blendPixel1, -- 8
	blendPixel2, -- 9
	writePixel, -- 10

	setNewClear, -- 11
	manualFlushFullCache, -- 12
	manualFlushFullCacheFinish, -- 13
	setNewState -- 14
);

type blendStateBlock is record
	blendEnable : std_logic;

	blendModeSrcRGB : blendModeRGB;
	blendModeSrcRGBInvert : std_logic;
	blendModeDestRGB : blendModeRGB;
	blendModeDestRGBInvert : std_logic;
	blendOpRGB : blendOp;

	blendModeSrcA : blendModeA;
	blendModeSrcAInvert : std_logic;
	blendModeDestA : blendModeA;
	blendModeDestAInvert : std_logic;
	blendOpA : blendOp;

	blendFactorRGB : unsigned(23 downto 0);
	blendFactorA : unsigned(7 downto 0);
	invBlendFactorRGB : unsigned(23 downto 0);
	invBlendFactorA : unsigned(7 downto 0);

	needsLoadSrcColor : std_logic;
	needsLoadDestColor : std_logic;
end record blendStateBlock;

constant DefaultBlendState : blendStateBlock := (blendEnable => '0', -- D3DRS_ALPHABLENDENABLE defaults to FALSE
	blendModeSrcRGB => blendRGB_0, -- D3DRS_SRCBLEND defaults to D3DBLEND_ONE
	blendModeSrcRGBInvert => '1',
	blendModeDestRGB => blendRGB_0, -- D3DRS_DESTBLEND defaults to D3DBLEND_ZERO
	blendModeDestRGBInvert => '0',
	blendOpRGB => bop_add, -- D3DRS_BLENDOP defaults to D3DBLENDOP_ADD
	blendModeSrcA => blendA_0, -- D3DRS_SRCBLENDALPHA defaults to D3DBLEND_ONE
	blendModeSrcAInvert => '1',
	blendModeDestA => blendA_0, -- D3DRS_DESTBLENDALPHA defaults to D3DBLEND_ZERO
	blendModeDestAInvert => '0',
	blendOpA => bop_add, -- D3DRS_BLENDOPALPHA defaults to D3DBLENDOP_ADD
	blendFactorRGB => (others => '1'), -- D3DRS_BLENDFACTOR defaults to 0xFFFFFFFF
	blendFactorA => (others => '1'),
	invBlendFactorRGB => (others => '0'), -- D3DRS_BLENDFACTOR defaults to 0xFFFFFFFF
	invBlendFactorA => (others => '0'),
	needsLoadSrcColor => '1',
	needsLoadDestColor => '0');

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

constant DefaultROPCacheEntry : ROPCacheEntryType := (cacheAddrBase => (others => '0'), cacheData => (others => '0'), cacheAge => (others => '0'), cacheValidWriteDWORDs => (others => '0') );

type ROPCacheEntries is array(3 downto 0) of ROPCacheEntryType;

signal currentState : ROPStateType := waitingForPixelData;
signal clearSignalAck : std_logic := '0';
signal flushCacheCommandAck : std_logic := '0';
signal isIdleSig : std_logic := '0';

signal currentPixelX : unsigned(15 downto 0) := (others => '0');
signal currentPixelY : unsigned(15 downto 0) := (others => '0');
signal currentDrawEventID : unsigned(15 downto 0) := (others => '0');
signal incomingPixelRGBA : unsigned(31 downto 0) := x"FF000000";
signal baseRenderTargetAddress : unsigned(29 downto 0) := (others => '0');
signal currentPixelAddress : unsigned(29 downto 0) := (others => '0');
signal previousPixelBackbufferRGBA : unsigned(31 downto 0) := x"FF000000";
signal blendedOutputRGBA : unsigned(31 downto 0) := x"FF000000";
signal tempSelectedOutputRGB : unsigned(47 downto 0) := (others => '0');
signal tempSelectedOutputA : unsigned(15 downto 0) := (others => '0');
signal tempBlendedOutputSrcRGB : unsigned(47 downto 0) := (others => '0');
signal tempBlendedOutputDestRGB : unsigned(47 downto 0) := (others => '0');
signal tempBlendedOutputSrcA : unsigned(15 downto 0) := (others => '0');
signal tempBlendedOutputDestA : unsigned(15 downto 0) := (others => '0');
signal outputDRAMWrite : unsigned(30+256+256/32-1 downto 0) := (others => '0');
signal outputDWORDEnable : unsigned(256/32-1 downto 0) := (others => '1');
signal writeMask : unsigned(3 downto 0) := "1111";
signal currentClearColor : unsigned(31 downto 0) := x"FF000000";
type clearedBlocksArray is array(59 downto 0) of STD_LOGIC_VECTOR(79 downto 0);
signal clearedBlocksBits : clearedBlocksArray := (others => (others => '0') );
signal currentClearRow : unsigned(5 downto 0) := (others => '0');
signal flushCachesLineIndex : unsigned(1 downto 0) := (others => '0');
signal currentOcclusionQueryCount : unsigned(31 downto 0) := (others => '0');

signal ROPCache : ROPCacheEntries := (0 => DefaultROPCacheEntry,
	1 => (cacheAddrBase => (others => '0'), cacheData => (others => '0'), cacheAge => "01", cacheValidWriteDWORDs => (others => '0') ),
	2 => (cacheAddrBase => (others => '0'), cacheData => (others => '0'), cacheAge => "10", cacheValidWriteDWORDs => (others => '0') ),
	3 => (cacheAddrBase => (others => '0'), cacheData => (others => '0'), cacheAge => (others => '1'), cacheValidWriteDWORDs => (others => '0') ) );
signal currentlyUsingCacheEntry : unsigned(1 downto 0) := (others => '0');

signal currentAlphaTestState : alphaTestStateType := (alphaTestEnable => '0', alphaTestRefVal => to_unsigned(0, 8), alphaTestFunc => cmp_always);

signal currentBlendState : blendStateBlock := DefaultBlendState;

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

pure function GetIsCacheLineDirty(originalColorRGBA : unsigned(31 downto 0); incomingColorRGBA : unsigned(31 downto 0); writeMask : unsigned(3 downto 0); currentBlendState : blendStateBlock) return std_logic is
begin
	if (currentBlendState.needsLoadDestColor = '0') then
		return '1';
	end if;

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

-- Return values of 'true' indicate that this fragment *passed* the alpha test and should be drawn.
-- Return values of 'false' indicate that the fragment *failed* the alpha test and that it should be discarded.
pure function AlphaTest(fragmentAlpha : unsigned(7 downto 0); alphaTestRefVal : unsigned(7 downto 0); alphaTestFunc : eCmpFunc) return boolean is
	variable lessTest : boolean;
	variable equalTest : boolean;
begin
	-- We only need to perform two actual comparisons to be able to support the 8 possible comparison functions using combinations of just "less" and "equal":
	lessTest := fragmentAlpha < alphaTestRefVal;
	equalTest := fragmentAlpha = alphaTestRefVal;

	case alphaTestFunc is
		when cmp_less =>
			return lessTest;
		when cmp_equal =>
			return equalTest;
		when cmp_lessequal =>
			return lessTest or equalTest;
		when cmp_greater =>
			return not (lessTest or equalTest);
		when cmp_notequal =>
			return not equalTest;
		when cmp_greaterequal =>
			return not lessTest;
		when cmp_always =>
			return true;
		when others => -- when cmp_never =>
			return false;
	end case;
end function;

pure function BlendRGBSrcDest(previousFramebufferRGBA : unsigned(31 downto 0); incomingPixelRGBA : unsigned(31 downto 0); currentBlendState : blendStateBlock) return unsigned is
	variable srcR : unsigned(7 downto 0);
	variable srcG : unsigned(7 downto 0);
	variable srcB : unsigned(7 downto 0);
	variable destR : unsigned(7 downto 0);
	variable destG : unsigned(7 downto 0);
	variable destB : unsigned(7 downto 0);
begin
	case currentBlendState.blendOpRGB is
		when bop_min =>
			if (previousFramebufferRGBA(7 downto 0) < incomingPixelRGBA(7 downto 0) ) then
				srcR := previousFramebufferRGBA(7 downto 0);
			else
				srcR := incomingPixelRGBA(7 downto 0);
			end if;
			if (previousFramebufferRGBA(15 downto 8) < incomingPixelRGBA(15 downto 8) ) then
				srcG := previousFramebufferRGBA(15 downto 8);
			else
				srcG := incomingPixelRGBA(15 downto 8);
			end if;
			if (previousFramebufferRGBA(23 downto 16) < incomingPixelRGBA(23 downto 16) ) then
				srcB := previousFramebufferRGBA(23 downto 16);
			else
				srcB := incomingPixelRGBA(23 downto 16);
			end if;
			return srcB & srcG & srcR & srcB & srcG & srcR;
		when bop_max =>
			if (previousFramebufferRGBA(7 downto 0) > incomingPixelRGBA(7 downto 0) ) then
				srcR(7 downto 0) := previousFramebufferRGBA(7 downto 0);
			else
				srcR(7 downto 0) := incomingPixelRGBA(7 downto 0);
			end if;
			if (previousFramebufferRGBA(15 downto 8) > incomingPixelRGBA(15 downto 8) ) then
				srcG(7 downto 0) := previousFramebufferRGBA(15 downto 8);
			else
				srcG(7 downto 0) := incomingPixelRGBA(15 downto 8);
			end if;
			if (previousFramebufferRGBA(23 downto 16) > incomingPixelRGBA(23 downto 16) ) then
				srcB(7 downto 0) := previousFramebufferRGBA(23 downto 16);
			else
				srcB(7 downto 0) := incomingPixelRGBA(23 downto 16);
			end if;
			return srcB & srcG & srcR & srcB & srcG & srcR;
		when others =>
	end case;

	case currentBlendState.blendModeSrcRGB is
		when blendRGB_0 =>
			if (currentBlendState.blendModeSrcRGBInvert = '0') then
				srcR := (others => '0');
				srcG := (others => '0');
				srcB := (others => '0');
			else
				srcR := X"FF";
				srcG := X"FF";
				srcB := X"FF";
			end if;
		when blendRGB_srcColor =>
			if (currentBlendState.blendModeSrcRGBInvert = '0') then
				srcR := incomingPixelRGBA(7 downto 0);
				srcG := incomingPixelRGBA(15 downto 8);
				srcB := incomingPixelRGBA(23 downto 16);
			else
				srcR := (not incomingPixelRGBA(7 downto 0) );
				srcG := (not incomingPixelRGBA(15 downto 8) );
				srcB := (not incomingPixelRGBA(23 downto 16) );
			end if;
		when blendRGB_srcAlpha =>
			if (currentBlendState.blendModeSrcRGBInvert = '0') then
				srcR := incomingPixelRGBA(31 downto 24);
				srcG := incomingPixelRGBA(31 downto 24);
				srcB := incomingPixelRGBA(31 downto 24);
			else
				srcR := (not incomingPixelRGBA(31 downto 24) );
				srcG := (not incomingPixelRGBA(31 downto 24) );
				srcB := (not incomingPixelRGBA(31 downto 24) );
			end if;
		when blendRGB_destAlpha =>
			if (currentBlendState.blendModeSrcRGBInvert = '0') then
				srcR := previousFramebufferRGBA(31 downto 24);
				srcG := previousFramebufferRGBA(31 downto 24);
				srcB := previousFramebufferRGBA(31 downto 24);
			else
				srcR := (not previousFramebufferRGBA(31 downto 24) );
				srcG := (not previousFramebufferRGBA(31 downto 24) );
				srcB := (not previousFramebufferRGBA(31 downto 24) );
			end if;
		when blendRGB_destColor =>
			if (currentBlendState.blendModeSrcRGBInvert = '0') then
				srcR := previousFramebufferRGBA(7 downto 0);
				srcG := previousFramebufferRGBA(15 downto 8);
				srcB := previousFramebufferRGBA(23 downto 16);
			else
				srcR := (not previousFramebufferRGBA(7 downto 0) );
				srcG := (not previousFramebufferRGBA(15 downto 8) );
				srcB := (not previousFramebufferRGBA(23 downto 16) );
			end if;
		when blendRGB_srcAlphaSat => -- srcAlphaSat has no invert
			if (incomingPixelRGBA(31 downto 24) < (not previousFramebufferRGBA(31 downto 24) ) ) then
				srcR := incomingPixelRGBA(31 downto 24);
				srcG := incomingPixelRGBA(31 downto 24);
				srcB := incomingPixelRGBA(31 downto 24);
			else
				srcR := (not previousFramebufferRGBA(31 downto 24) );
				srcG := (not previousFramebufferRGBA(31 downto 24) );
				srcB := (not previousFramebufferRGBA(31 downto 24) );
			end if;
		when blendRGB_blendFactor =>
			if (currentBlendState.blendModeSrcRGBInvert = '0') then
				srcR := currentBlendState.blendFactorRGB(7 downto 0);
				srcG := currentBlendState.blendFactorRGB(15 downto 8);
				srcB := currentBlendState.blendFactorRGB(23 downto 16);
			else
				srcR := currentBlendState.invBlendFactorRGB(7 downto 0);
				srcG := currentBlendState.invBlendFactorRGB(15 downto 8);
				srcB := currentBlendState.invBlendFactorRGB(23 downto 16);
			end if;
	end case;

	case currentBlendState.blendModeDestRGB is
		when blendRGB_0 =>
			if (currentBlendState.blendModeDestRGBInvert = '0') then
				destR := (others => '0');
				destG := (others => '0');
				destB := (others => '0');
			else
				destR := X"FF";
				destG := X"FF";
				destB := X"FF";
			end if;
		when blendRGB_srcColor =>
			if (currentBlendState.blendModeDestRGBInvert = '0') then
				destR := incomingPixelRGBA(7 downto 0);
				destG := incomingPixelRGBA(15 downto 8);
				destB := incomingPixelRGBA(23 downto 16);
			else
				destR := (not incomingPixelRGBA(7 downto 0) );
				destG := (not incomingPixelRGBA(15 downto 8) );
				destB := (not incomingPixelRGBA(23 downto 16) );
			end if;
		when blendRGB_srcAlpha =>
			if (currentBlendState.blendModeDestRGBInvert = '0') then
				destR := incomingPixelRGBA(31 downto 24);
				destG := incomingPixelRGBA(31 downto 24);
				destB := incomingPixelRGBA(31 downto 24);
			else
				destR := (not incomingPixelRGBA(31 downto 24) );
				destG := (not incomingPixelRGBA(31 downto 24) );
				destB := (not incomingPixelRGBA(31 downto 24) );
			end if;
		when blendRGB_destAlpha =>
			if (currentBlendState.blendModeDestRGBInvert = '0') then
				destR := previousFramebufferRGBA(31 downto 24);
				destG := previousFramebufferRGBA(31 downto 24);
				destB := previousFramebufferRGBA(31 downto 24);
			else
				destR := (not previousFramebufferRGBA(31 downto 24) );
				destG := (not previousFramebufferRGBA(31 downto 24) );
				destB := (not previousFramebufferRGBA(31 downto 24) );
			end if;
		when blendRGB_destColor =>
			if (currentBlendState.blendModeDestRGBInvert = '0') then
				destR := previousFramebufferRGBA(7 downto 0);
				destG := previousFramebufferRGBA(15 downto 8);
				destB := previousFramebufferRGBA(23 downto 16);
			else
				destR := (not previousFramebufferRGBA(7 downto 0) );
				destG := (not previousFramebufferRGBA(15 downto 8) );
				destB := (not previousFramebufferRGBA(23 downto 16) );
			end if;
		when blendRGB_srcAlphaSat => -- srcAlphaSat has no invert
			if (incomingPixelRGBA(31 downto 24) < (not previousFramebufferRGBA(31 downto 24) ) ) then
				destR := incomingPixelRGBA(31 downto 24);
				destG := incomingPixelRGBA(31 downto 24);
				destB := incomingPixelRGBA(31 downto 24);
			else
				destR := (not previousFramebufferRGBA(31 downto 24) );
				destG := (not previousFramebufferRGBA(31 downto 24) );
				destB := (not previousFramebufferRGBA(31 downto 24) );
			end if;
		when blendRGB_blendFactor =>
			if (currentBlendState.blendModeDestRGBInvert = '0') then
				destR := currentBlendState.blendFactorRGB(7 downto 0);
				destG := currentBlendState.blendFactorRGB(15 downto 8);
				destB := currentBlendState.blendFactorRGB(23 downto 16);
			else
				destR := currentBlendState.invBlendFactorRGB(7 downto 0);
				destG := currentBlendState.invBlendFactorRGB(15 downto 8);
				destB := currentBlendState.invBlendFactorRGB(23 downto 16);
			end if;
	end case;

	return destB & destG & destR & srcB & srcG & srcR;
end function;

pure function BlendRGBBlendOp(srcR : unsigned(15 downto 0); srcG : unsigned(15 downto 0); srcB : unsigned(15 downto 0); destR : unsigned(15 downto 0); destG : unsigned(15 downto 0); destB : unsigned(15 downto 0); currentBlendState : blendStateBlock) return unsigned is
	variable summationR : unsigned(16 downto 0);
	variable summationG : unsigned(16 downto 0);
	variable summationB : unsigned(16 downto 0);
begin
	case currentBlendState.blendOpRGB is
		when bop_min | bop_max =>
			return srcB(15 downto 8) & srcG(15 downto 8) & srcR(15 downto 8);
		when bop_subtract =>
			summationR := ('0' & srcR) - ('0' & destR);
			summationG := ('0' & srcG) - ('0' & destG);
			summationB := ('0' & srcB) - ('0' & destB);
			if (summationR(16) = '1') then
				summationR(15 downto 8) := (others => '0');
			end if;
			if (summationG(16) = '1') then
				summationG(15 downto 8) := (others => '0');
			end if;
			if (summationB(16) = '1') then
				summationB(15 downto 8) := (others => '0');
			end if;
			return summationB(15 downto 8) & summationG(15 downto 8) & summationR(15 downto 8);
		when bop_revsubtract =>
			summationR := ('0' & destR) - ('0' & srcR);
			summationG := ('0' & destG) - ('0' & srcG);
			summationB := ('0' & destB) - ('0' & srcB);
			if (summationR(16) = '1') then
				summationR(15 downto 8) := (others => '0');
			end if;
			if (summationG(16) = '1') then
				summationG(15 downto 8) := (others => '0');
			end if;
			if (summationB(16) = '1') then
				summationB(15 downto 8) := (others => '0');
			end if;
			return summationB(15 downto 8) & summationG(15 downto 8) & summationR(15 downto 8);
		when others => -- when bop_add =>
			summationR := ('0' & srcR) + ('0' & destR);
			summationG := ('0' & srcG) + ('0' & destG);
			summationB := ('0' & srcB) + ('0' & destB);
			if (summationR(16) = '1') then
				summationR(15 downto 8) := (others => '1');
			end if;
			if (summationG(16) = '1') then
				summationG(15 downto 8) := (others => '1');
			end if;
			if (summationB(16) = '1') then
				summationB(15 downto 8) := (others => '1');
			end if;
			return summationB(15 downto 8) & summationG(15 downto 8) & summationR(15 downto 8);
	end case;
end function;

pure function BlendAlphaSrcDest(previousFramebufferAlpha : unsigned(7 downto 0); incomingPixelAlpha : unsigned(7 downto 0); currentBlendState : blendStateBlock) return unsigned is
	variable srcAlpha : unsigned(7 downto 0);
	variable destAlpha : unsigned(7 downto 0);
begin
	case currentBlendState.blendOpA is
		when bop_min =>
			if (previousFramebufferAlpha < incomingPixelAlpha) then
				return previousFramebufferAlpha & previousFramebufferAlpha;
			else
				return incomingPixelAlpha & incomingPixelAlpha;
			end if;
		when bop_max =>
			if (previousFramebufferAlpha > incomingPixelAlpha) then
				return previousFramebufferAlpha & previousFramebufferAlpha;
			else
				return incomingPixelAlpha & incomingPixelAlpha;
			end if;
		when others =>
	end case;

	case currentBlendState.blendModeSrcA is
		when blendA_0 =>
			if (currentBlendState.blendModeSrcAInvert = '0') then
				srcAlpha := (others => '0');
			else
				srcAlpha := unsigned'(X"FF");
			end if;
		when blendA_srcAlpha =>
			if (currentBlendState.blendModeSrcAInvert = '0') then
				srcAlpha := incomingPixelAlpha;
			else
				srcAlpha := (not incomingPixelAlpha);
			end if;
		when blendA_destAlpha =>
			if (currentBlendState.blendModeSrcAInvert = '0') then
				srcAlpha := previousFramebufferAlpha;
			else
				srcAlpha := (not previousFramebufferAlpha);
			end if;
		when blendA_blendFactor =>
			if (currentBlendState.blendModeSrcAInvert = '0') then
				srcAlpha := currentBlendState.blendFactorA;
			else
				srcAlpha := currentBlendState.invBlendFactorA;
			end if;
	end case;

	case currentBlendState.blendModeDestA is
		when blendA_0 =>
			if (currentBlendState.blendModeDestAInvert = '0') then
				destAlpha := (others => '0');
			else
				destAlpha := unsigned'(X"FF");
			end if;
		when blendA_srcAlpha =>
			if (currentBlendState.blendModeDestAInvert = '0') then
				destAlpha := incomingPixelAlpha;
			else
				destAlpha := (not incomingPixelAlpha);
			end if;
		when blendA_destAlpha =>
			if (currentBlendState.blendModeDestAInvert = '0') then
				destAlpha := previousFramebufferAlpha;
			else
				destAlpha := (not previousFramebufferAlpha);
			end if;
		when blendA_blendFactor =>
			if (currentBlendState.blendModeDestAInvert = '0') then
				destAlpha := currentBlendState.blendFactorA;
			else
				destAlpha := currentBlendState.invBlendFactorA;
			end if;
	end case;

	return destAlpha & srcAlpha;
end function;

pure function BlendColorMultiplySrc(incomingPixelColor : unsigned(7 downto 0); srcBlend : unsigned(7 downto 0); currentBlendState : blendStateBlock) return unsigned is
begin
	case currentBlendState.blendOpRGB is
		when bop_min | bop_max =>
			return srcBlend & X"00";
		when others =>
			return incomingPixelColor * srcBlend;
	end case;
end function;

pure function BlendAlphaMultiplySrc(incomingPixelAlpha : unsigned(7 downto 0); srcBlend : unsigned(7 downto 0); currentBlendState : blendStateBlock) return unsigned is
begin
	case currentBlendState.blendOpA is
		when bop_min | bop_max =>
			return srcBlend & X"00";
		when others =>
			return incomingPixelAlpha * srcBlend;
	end case;
end function;

pure function BlendColorMultiplyDest(previousFramebufferColor : unsigned(7 downto 0); destBlend : unsigned(7 downto 0); currentBlendState : blendStateBlock) return unsigned is
begin
	case currentBlendState.blendOpRGB is
		when bop_min | bop_max =>
			return destBlend & X"00";
		when others =>
			return previousFramebufferColor * destBlend;
	end case;
end function;

pure function BlendAlphaMultiplyDest(previousFramebufferAlpha : unsigned(7 downto 0); destBlend : unsigned(7 downto 0); currentBlendState : blendStateBlock) return unsigned is
begin
	case currentBlendState.blendOpA is
		when bop_min | bop_max =>
			return destBlend & X"00";
		when others =>
			return previousFramebufferAlpha * destBlend;
	end case;
end function;

pure function BlendAlphaBlendOp(srcAlpha : unsigned(15 downto 0); destAlpha : unsigned(15 downto 0); currentBlendState : blendStateBlock) return unsigned is
	variable summation : unsigned(16 downto 0);
begin
	case currentBlendState.blendOpA is
		when bop_min | bop_max =>
			return srcAlpha(15 downto 8);
		when bop_subtract =>
			summation := ('0' & srcAlpha) - ('0' & destAlpha);
			if (summation(16) = '1') then
				return X"00";
			else
				return summation(15 downto 8);
			end if;
		when bop_revsubtract =>
			summation := ('0' & destAlpha) - ('0' & srcAlpha);
			if (summation(16) = '1') then
				return X"00";
			else
				return summation(15 downto 8);
			end if;
		when others => -- when bop_add =>
			summation := ('0' & srcAlpha) + ('0' & destAlpha);
			if (summation(16) = '1') then
				return X"FF";
			else
				return summation(15 downto 8);
			end if;
	end case;
end function;

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

CMD_ClearSignalAck <= clearSignalAck;
CMD_FlushCacheAck <= flushCacheCommandAck;
CMD_ROPIsIdle <= '1' when (isIdleSig = '1' and TEXSAMP_InFIFO_empty = '1') else '0';
MEM_ROPWriteRequestsFIFO_wr_data <= std_logic_vector(outputDRAMWrite);

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);
STAT_CyclesWaitingForMemoryRead <= std_logic_vector(statCyclesWaitingForMemRead);
STAT_CountCacheHits <= std_logic_vector(statCountCacheHits);
STAT_CountCacheMisses <= std_logic_vector(statCountCacheMisses);
STAT_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);
STAT_CountPixelsPassed <= std_logic_vector(currentOcclusionQueryCount);

DBG_ROP_State <= std_logic_vector(to_unsigned(ROPStateType'pos(currentState), 5) );
DBG_CurrentPixelAddr <= std_logic_vector(currentPixelAddress);
DBG_ReadRequestFIFOFull <= MEM_ROPReadRequestsFIFO_full;
DBG_CurrentBlendedColor <= std_logic_vector(blendedOutputRGBA);
DBG_PreviousFramebufferColor <= std_logic_vector(previousPixelBackbufferRGBA);
DBG_TempSelectedOutputRGB <= std_logic_vector(tempSelectedOutputRGB);
DBG_TempSelectedOutputA <= std_logic_vector(tempSelectedOutputA);
DBG_TempBlendedOutputRGB <= std_logic_vector(tempBlendedOutputDestRGB & tempBlendedOutputSrcRGB);
DBG_TempBlendedOutputA <= std_logic_vector(tempBlendedOutputDestA & tempBlendedOutputSrcA);
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
			STATE_ConsumeStateSlot <= '0';
			isIdleSig <= '0';
			TEXSAMP_InFIFO_rd_en <= '0';
			clearSignalAck <= '0';
			flushCacheCommandAck <= '0';

			case currentState is
				when waitingForPixelData =>
					MEM_ROPWriteRequestsFIFO_wr_en <= '0'; -- Deassert after one clock cycle

					currentPixelX <= unsigned(TEXSAMP_InFIFO_rd_data(15 downto 0) );
					currentPixelY <= unsigned(TEXSAMP_InFIFO_rd_data(31 downto 16) );
					incomingPixelRGBA <= unsigned(TEXSAMP_InFIFO_rd_data(63 downto 56) ) & unsigned(TEXSAMP_InFIFO_rd_data(55 downto 48) ) & unsigned(TEXSAMP_InFIFO_rd_data(47 downto 40) ) & unsigned(TEXSAMP_InFIFO_rd_data(39 downto 32) );

					if (STATE_StateIsValid = '1' and currentDrawEventID = unsigned(STATE_NextDrawID) ) then
						STATE_ConsumeStateSlot <= '1';

						baseRenderTargetAddress <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).RenderTargetBaseAddress;
						writeMask <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).ColorWriteMask;

						-- Set our new alpha test states:
						currentAlphaTestState.alphaTestEnable <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaTestEnabled;
						currentAlphaTestState.alphaTestRefVal <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaTestRefValue;
						currentAlphaTestState.alphaTestFunc <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaTestCompareFunc;

						-- Set our new alpha blend states:
						currentBlendState.blendEnable <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendEnable;

						currentBlendState.blendModeSrcRGB <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.blendModeSrcRGB;
						currentBlendState.blendModeSrcRGBInvert <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.blendModeSrcRGBInvert;
						currentBlendState.blendModeDestRGB <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.blendModeDestRGB;
						currentBlendState.blendModeDestRGBInvert <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.blendModeDestRGBInvert;
						currentBlendState.blendOpRGB <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.blendOpRGB;

						currentBlendState.blendModeSrcA <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.blendModeSrcA;
						currentBlendState.blendModeSrcAInvert <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.blendModeSrcAInvert;
						currentBlendState.blendModeDestA <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.blendModeDestA;
						currentBlendState.blendModeDestAInvert <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.blendModeDestAInvert;
						currentBlendState.blendOpA <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.blendOpA;

						currentBlendState.blendFactorRGB <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).BlendFactorRGBA(23 downto 0);
						currentBlendState.blendFactorA <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).BlendFactorRGBA(31 downto 24);
						currentBlendState.invBlendFactorRGB <= (not DeserializeBitsToStruct(STATE_StateBitsAtDrawID).BlendFactorRGBA(23 downto 0) );
						currentBlendState.invBlendFactorA <= (not DeserializeBitsToStruct(STATE_StateBitsAtDrawID).BlendFactorRGBA(31 downto 24) );

						currentBlendState.needsLoadSrcColor <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.needsLoadSrcColor;
						currentBlendState.needsLoadDestColor <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaBlendConfigBlock.needsLoadDestColor;
						currentState <= setNewState;
					elsif (CMD_FlushCacheSignal = '1') then
						flushCachesLineIndex <= (others => '0');
						currentState <= manualFlushFullCache;
					elsif (CMD_ClearSignal = '1') then
						currentState <= setNewClear;
					elsif (TEXSAMP_InFIFO_empty = '0') then
						TEXSAMP_InFIFO_rd_en <= '1';

						if (IsSpecialPixelMessage(unsigned(TEXSAMP_InFIFO_rd_data(15 downto 0) ) ) ) then
							if (TEXSAMP_InFIFO_rd_data(eSpecialPixelCodeBits'pos(SetNewDrawEventID) ) = '1') then
								currentDrawEventID <= unsigned(TEXSAMP_InFIFO_rd_data(31 downto 16) );
							end if;
							if (TEXSAMP_InFIFO_rd_data(eSpecialPixelCodeBits'pos(TerminateCurrentDrawEventID) ) = '1') then
							end if;
						else
							if (currentAlphaTestState.alphaTestEnable = '1') then
								currentState <= doAlphaTest;
							else
								currentState <= calcPixelAddress; -- Skip the alpha test if it's not enabled
							end if;
						end if;
					else
						isIdleSig <= '1';
					end if;

				when doAlphaTest =>
					if (AlphaTest(incomingPixelRGBA(31 downto 24), currentAlphaTestState.alphaTestRefVal, currentAlphaTestState.alphaTestFunc) ) then
						currentState <= calcPixelAddress; -- We passed the alpha test, continue drawing this pixel!
					else
						currentState <= waitingForPixelData; -- We failed the alpha test, discard this pixel!
					end if;

				when calcPixelAddress =>
					-- This pixel has now survived the depth, stencil, and alpha-tests and should now be counted as contributing to our occlusion query.
					currentOcclusionQueryCount <= currentOcclusionQueryCount + 1;

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

						if (currentBlendState.blendEnable = '1') then
							currentState <= blendPixel0;
						else
							blendedOutputRGBA <= incomingPixelRGBA;
							currentState <= writePixel;
						end if;
					else
						if (MEM_ROPWriteRequestsFIFO_full = '0') then
							if (ROPCache(to_integer(GetOldestCacheLineForReplacement ) ).cacheValidWriteDWORDs /= "00000000") then -- Skip writing out cache lines that aren't dirty (big bandwidth savings!)
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

					-- Skip loading our cache line if the blending mode will always overwrite the full framebuffer data anyway (big bandwidth and latency savings!)
					if (currentBlendState.needsLoadDestColor = '0' and writeMask = "1111") then
						ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData <= (others => '0'); -- We need to clear our cache line to all zeroes for write-masking purposes
						UpdateCacheLineAges(currentlyUsingCacheEntry, ROPCache); -- Update the cache ages for all of our cache lines (youngest becomes 0, oldest to 3)
						currentState <= checkCache;
					else
						currentState <= requestReadPixel;
					end if;

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
						ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData <= unsigned(MEM_ROPReadResponsesFIFO_rd_data);
						MEM_ROPReadResponsesFIFO_rd_en <= '1';
						UpdateCacheLineAges(currentlyUsingCacheEntry, ROPCache); -- Update the cache ages for all of our cache lines (youngest becomes 0, oldest to 3)
						currentState <= checkCache;
					end if;

				when blendPixel0 => -- Cycle 1: Select arguments for blending
					MEM_ROPReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
					tempSelectedOutputRGB <= BlendRGBSrcDest(previousPixelBackbufferRGBA, incomingPixelRGBA, currentBlendState);
					tempSelectedOutputA <= BlendAlphaSrcDest(previousPixelBackbufferRGBA(31 downto 24), incomingPixelRGBA(31 downto 24), currentBlendState);
					currentState <= blendPixel1;

				when blendPixel1 => -- Cycle 2: Perform multiplies
					tempBlendedOutputSrcRGB(15 downto 0) <= BlendColorMultiplySrc(incomingPixelRGBA(7 downto 0), tempSelectedOutputRGB(7 downto 0), currentBlendState);
					tempBlendedOutputSrcRGB(31 downto 16) <= BlendColorMultiplySrc(incomingPixelRGBA(15 downto 8), tempSelectedOutputRGB(15 downto 8), currentBlendState);
					tempBlendedOutputSrcRGB(47 downto 32) <= BlendColorMultiplySrc(incomingPixelRGBA(23 downto 16), tempSelectedOutputRGB(23 downto 16), currentBlendState);
					tempBlendedOutputDestRGB(15 downto 0) <= BlendColorMultiplyDest(previousPixelBackbufferRGBA(7 downto 0), tempSelectedOutputRGB(31 downto 24), currentBlendState);
					tempBlendedOutputDestRGB(31 downto 16) <= BlendColorMultiplyDest(previousPixelBackbufferRGBA(15 downto 8), tempSelectedOutputRGB(39 downto 32), currentBlendState);
					tempBlendedOutputDestRGB(47 downto 32) <= BlendColorMultiplyDest(previousPixelBackbufferRGBA(23 downto 16), tempSelectedOutputRGB(47 downto 40), currentBlendState);
					tempBlendedOutputSrcA <= BlendAlphaMultiplySrc(incomingPixelRGBA(31 downto 24), tempSelectedOutputA(7 downto 0), currentBlendState);
					tempBlendedOutputDestA <= BlendAlphaMultiplyDest(previousPixelBackbufferRGBA(31 downto 24), tempSelectedOutputA(15 downto 8), currentBlendState);
					currentState <= blendPixel2;

				when blendPixel2 => -- Cycle 3: Finish blending -- We need an extra clock cycle for the alpha blend DSP multipliers to settle. Can't do everything in a single cycle.
					blendedOutputRGBA(23 downto 0) <= BlendRGBBlendOp(tempBlendedOutputSrcRGB(15 downto 0), tempBlendedOutputSrcRGB(31 downto 16), tempBlendedOutputSrcRGB(47 downto 32), 
						tempBlendedOutputDestRGB(15 downto 0), tempBlendedOutputDestRGB(31 downto 16), tempBlendedOutputDestRGB(47 downto 32), currentBlendState);
					blendedOutputRGBA(31 downto 24) <= BlendAlphaBlendOp(tempBlendedOutputSrcA, tempBlendedOutputDestA, currentBlendState);
					currentState <= writePixel;

				when writePixel =>
					case currentPixelX(2 downto 0) is
						when "111" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*8-1 downto 32*7) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(7) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask, currentBlendState) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(7) );
						when "110" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*7-1 downto 32*6) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(6) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask, currentBlendState) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(6) );
						when "101" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*6-1 downto 32*5) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(5) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask, currentBlendState) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(5) );
						when "100" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*5-1 downto 32*4) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(4) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask, currentBlendState) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(4) );
						when "011" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*4-1 downto 32*3) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(3) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask, currentBlendState) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(3) );
						when "010" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*3-1 downto 32*2) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(2) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask, currentBlendState) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(2) );
						when "001" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*2-1 downto 32*1) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(1) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask, currentBlendState) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(1) );
						when others => -- when "000" =>
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheData(32*1-1 downto 32*0) <= ApplyWriteMask(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask);
							ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(0) <= (GetIsCacheLineDirty(previousPixelBackbufferRGBA, blendedOutputRGBA, writeMask, currentBlendState) or ROPCache(to_integer(currentlyUsingCacheEntry) ).cacheValidWriteDWORDs(0) );
					end case;
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
						if (ROPCache(to_integer(flushCachesLineIndex) ).cacheValidWriteDWORDs /= "00000000") then -- Skip writing out cache lines that aren't dirty (big bandwidth savings!)
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

				when setNewState =>
					currentState <= waitingForPixelData;

			end case;
		end if;
	end process;

end Behavioral;
