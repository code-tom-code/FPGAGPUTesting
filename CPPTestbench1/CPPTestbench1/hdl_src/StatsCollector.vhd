library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity StatsCollector is
	Port ( clk : in STD_LOGIC;

	-- Command Processor interface begin
		CMD_PresentSignal : in STD_LOGIC;
		CMD_SetNewStatsConfig : in STD_LOGIC;
		CMD_WriteFrameStatsAddress : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_EnableEventTimestamps : in STD_LOGIC;
		CMD_WriteEventTimestampsAddress : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_WriteEventTimestampOrders : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_CountTimestampsMemoryWrites : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		CMD_CountTimestampsOrdersMemoryWrites : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		CMD_StatsSaveComplete : out STD_LOGIC := '0';
	-- Command Processor interface end

	-- Memory Controller FIFO interface begin
		MEM_StatsWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(30+256+256/32-1 downto 0) := (others => '0');
        MEM_StatsWriteRequestsFIFO_full : in STD_LOGIC;
        MEM_StatsWriteRequestsFIFO_wr_en : out STD_LOGIC := '0';
	-- Memory Controller FIFO interface end

	-- WriteOrderNibbles FIFO interface begin
		STAT_WriteOrderNibblesFIFO_wr_data : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
        STAT_WriteOrderNibblesFIFO_full : in STD_LOGIC;
        STAT_WriteOrderNibblesFIFO_wr_en : out STD_LOGIC := '0';

		STAT_WriteOrderNibblesFIFO_rd_data : in STD_LOGIC_VECTOR(15 downto 0);
        STAT_WriteOrderNibblesFIFO_empty : in STD_LOGIC;
        STAT_WriteOrderNibblesFIFO_rd_en : out STD_LOGIC := '0';

		STAT_ResetWriteOrderNibblesFIFO : out STD_LOGIC := '0';
	-- WriteOrderNibbles FIFO interface end

	-- Stats interface begin
		VBB_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		VBB_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		VBB_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		VBB_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);

		VSHADER_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		VSHADER_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		VSHADER_CyclesExecShaderCode : in STD_LOGIC_VECTOR(31 downto 0);
		VSHADER_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		VSHADER_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);

		IA_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		IA_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		IA_CyclesLoadingDataToCache : in STD_LOGIC_VECTOR(31 downto 0);
		IA_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		IA_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);

		CLIP_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		CLIP_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);

		TRISETUP_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);

		RAST_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		RAST_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		RAST_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		RAST_CyclesWaitingForTriWorkCache : in STD_LOGIC_VECTOR(31 downto 0);
		RAST_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);

		DINTERP_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		DINTERP_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);

		INTERP_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		INTERP_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		INTERP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		INTERP_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);

		TEXSAMP_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		TEXSAMP_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		TEXSAMP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		TEXSAMP_CyclesWaitingCacheLoad : in STD_LOGIC_VECTOR(31 downto 0);
		TEXSAMP_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);

		ROP_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		ROP_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		ROP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		ROP_CyclesWaitingForMemoryRead : in STD_LOGIC_VECTOR(31 downto 0);
		ROP_CountCacheHits : in STD_LOGIC_VECTOR(31 downto 0);
		ROP_CountCacheMisses : in STD_LOGIC_VECTOR(31 downto 0);
		ROP_CurrentDrawEventID : in STD_LOGIC_VECTOR(15 downto 0);

		CMD_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		CMD_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);

		MEM_ReadCyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		MEM_ReadCyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		MEM_WriteCyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		MEM_WriteCyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		MEM_MemReadCountBytesTransferred : in STD_LOGIC_VECTOR(31 downto 0);
		MEM_MemReadCountTransactions : in STD_LOGIC_VECTOR(31 downto 0);
		MEM_MemReadCountNonScanoutBytesTransferred : in STD_LOGIC_VECTOR(31 downto 0);
		MEM_MemReadCountNonScanoutTransactions : in STD_LOGIC_VECTOR(31 downto 0);
		MEM_MemWriteCountBytesTransferred : in STD_LOGIC_VECTOR(31 downto 0);
		MEM_MemWriteCountTransactions : in STD_LOGIC_VECTOR(31 downto 0);
	-- Stats interface end

	-- Debug signals
		DBG_CurrentState : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_EventsWriteIsReady : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		DBG_EventsWriteIsReadyAck : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		DBG_CurrentWriteOrderNibbles : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_CurrentWriteData : out STD_LOGIC_VECTOR(30+256+256/32-1 downto 0) := (others => '0');
		DBG_CurrentWriteEn : out STD_LOGIC := '0'
		);
end StatsCollector;

architecture Behavioral of StatsCollector is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

ATTRIBUTE X_INTERFACE_INFO of MEM_StatsWriteRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_StatsWriteRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_StatsWriteRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO FULL";

ATTRIBUTE X_INTERFACE_INFO of STAT_WriteOrderNibblesFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of STAT_WriteOrderNibblesFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR WR_EN";
ATTRIBUTE X_INTERFACE_INFO of STAT_WriteOrderNibblesFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR FULL";

ATTRIBUTE X_INTERFACE_INFO of STAT_WriteOrderNibblesFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of STAT_WriteOrderNibblesFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD RD_EN";
ATTRIBUTE X_INTERFACE_INFO of STAT_WriteOrderNibblesFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD EMPTY";

type StatsCollectorStateType is 
(
	waitingForCommand, -- 0
	waitingForCommandCooldown, -- 1
	flushEventStats, -- 2
	finishEventWrites, -- 3
	finishEventWritesCooldown, -- 4
	finishEventOrderNibbles, -- 5
	writeNibblesToMemory, -- 6
	writeNibblesToMemoryCooldown, -- 7
	writeEndFrameHeaderToMemory, -- 8
	endFrameCapture, -- 9
	saveStatsToMem0, -- 10
	saveStatsToMem1, -- 11
	saveStatsToMem2, -- 12
	saveStatsToMem3, -- 13
	saveStatsToMem4, -- 14
	saveStatsToMem5, -- 15
	saveStatsToMem6, -- 16
	startFrameCapture, -- 17
	startFrameCapture2 -- 18
);

-- Typedef our counter types to uint32:
subtype CycleCounter is unsigned(31 downto 0);
subtype CounterStat is unsigned(31 downto 0);

component StatsEventTracker
port(
	clk : in STD_LOGIC;

	STAGE_CurrentEventID : in STD_LOGIC_VECTOR(15 downto 0);
	STAT_Reset : in std_logic;
	STAT_CurrentTimestamp : in STD_LOGIC_VECTOR(31 downto 0);
	STAT_WriteIsReady : out STD_LOGIC := '0';
	STAT_WriteDRAMLine : out STD_LOGIC_VECTOR(255 downto 0);
	STAT_FlushWrite : in STD_LOGIC;
	STAT_AckWrite : in STD_LOGIC
);
end component;

type FrameCaptureCycleCounters is record
	VertBatchBuilderCyclesIdle : CycleCounter;
	VertBatchBuilderCyclesWorking : CycleCounter;
	VertBatchBuilderCyclesWaitingForOutput : CycleCounter;

	VShaderCyclesIdle : CycleCounter;
	VShaderCyclesWorking : CycleCounter;
	VShaderCyclesWaitingForOutput : CycleCounter;
	VShaderCyclesExecShaderCode : CycleCounter;
	
	IACyclesIdle : CycleCounter;
	IACyclesWorking : CycleCounter;
	IACyclesWaitingForOutput : CycleCounter;
	IACyclesLoadingToCache : CycleCounter;

	ClipCyclesIdle : CycleCounter;
	ClipCyclesWorking : CycleCounter;
	ClipCyclesWaitingForOutput : CycleCounter;

	TriSetupCyclesIdle : CycleCounter;
	TriSetupCyclesWorking : CycleCounter;
	TriSetupCyclesWaitingForOutput : CycleCounter;

	RasterizerCyclesIdle : CycleCounter;
	RasterizerCyclesWorking : CycleCounter;
	RasterizerCyclesWaitingForOutput : CycleCounter;
	RasterizerCyclesWaitingForTriWorkCache : CycleCounter;

	DInterpCyclesIdle : CycleCounter;
	DInterpCyclesWorking : CycleCounter;
	DInterpCyclesWaitingForOutput : CycleCounter;

	AttrInterpolatorCyclesIdle : CycleCounter;
	AttrInterpolatorCyclesWorking : CycleCounter;
	AttrInterpolatorCyclesWaitingForOutput : CycleCounter;

	TexSamplerCyclesIdle : CycleCounter;
	TexSamplerCyclesWorking : CycleCounter;
	TexSamplerCyclesWaitingForOutput : CycleCounter;
	TexSamplerCyclesLoadingToCache : CycleCounter;

	ROPCyclesIdle : CycleCounter;
	ROPCyclesWorking : CycleCounter;
	ROPCyclesWaitingForOutput : CycleCounter;
	ROPCyclesMemoryRead : CycleCounter;

	CommandProcCyclesIdle : CycleCounter;
	CommandProcCyclesWorking : CycleCounter;

	MemControllerReadCyclesIdle : CycleCounter;
	MemControllerReadCyclesWorking : CycleCounter;

	MemControllerWriteCyclesIdle : CycleCounter;
	MemControllerWriteCyclesWorking : CycleCounter;
end record FrameCaptureCycleCounters;

type FrameCaptureCounterStats is record
	ROPCounterCacheHits : CounterStat;
	ROPCounterCacheMisses : CounterStat;

	MemReadCounterBytesTransferred : CounterStat;
	MemReadCounterNumTransactions : CounterStat;

	MemReadCounterNonScanoutBytesTransferred : CounterStat;
	MemReadCounterNonScanoutNumTransactions : CounterStat;

	MemWriteCounterBytesTransferred : CounterStat;
	MemWriteCounterNumTransactions : CounterStat;
end record FrameCaptureCounterStats;

type FrameStatState is record
	EnableEventCollectorsThisFrame : std_logic;
	EventTimestampsBaseAddress : unsigned(29 downto 0);
	EventOrderingsBaseAddress : unsigned(29 downto 0);
	StatsWriteBaseAddress : unsigned(29 downto 0);
end record FrameStatState;

signal currentState : StatsCollectorStateType := waitingForCommand;
signal currentEventRecordingState : FrameStatState := (EnableEventCollectorsThisFrame => '0', EventTimestampsBaseAddress => (others => '0'), EventOrderingsBaseAddress => (others => '0'), StatsWriteBaseAddress => (others => '0') );

signal currentTimestamp : unsigned(31 downto 0) := (others => '0');
signal eventsFlushAllWrites : std_logic := '0';
signal flushCycles : unsigned(3 downto 0) := (others => '0');

signal startFrameTimeCounters : FrameCaptureCycleCounters := (others => (others => '0') );
signal startFrameCounterStats : FrameCaptureCounterStats := (others => (others => '0') );

signal endFrameTimeCounters : FrameCaptureCycleCounters := (others => (others => '0') );
signal endFrameCounterStats : FrameCaptureCounterStats := (others => (others => '0') );

signal memoryWriteAddressBase : unsigned(29 downto 0) := (others => '0');
signal memoryWriteAddressOffset : unsigned(19 downto 0) := (others => '0');
constant memoryWriteDWORDEnables : unsigned(7 downto 0) := (others => '1');
signal memoryWriteOutgoingData : unsigned(255 downto 0) := (others => '0');
signal memoryWriteEnable : std_logic := '0';

signal topOfPipeCurrentDrawID : unsigned(15 downto 0) := (others => '0');
signal bottomOfPipeCurrentDrawID : unsigned(15 downto 0) := (others => '0');

signal frameStartTimestamp : unsigned(31 downto 0) := (others => '0');
signal frameEndTimestamp : unsigned(31 downto 0) := (others => '0');

signal eventsDataVBB : std_logic_vector(255 downto 0) := (others => '0');
signal eventsDataVSHADER : std_logic_vector(255 downto 0) := (others => '0');
signal eventsDataIA : std_logic_vector(255 downto 0) := (others => '0');
signal eventsDataCLIP : std_logic_vector(255 downto 0) := (others => '0');
signal eventsDataTRISETUP : std_logic_vector(255 downto 0) := (others => '0');
signal eventsDataRAST : std_logic_vector(255 downto 0) := (others => '0');
signal eventsDataDINTERP : std_logic_vector(255 downto 0) := (others => '0');
signal eventsDataINTERP : std_logic_vector(255 downto 0) := (others => '0');
signal eventsDataTEXSAMPLE : std_logic_vector(255 downto 0) := (others => '0');
signal eventsDataROP : std_logic_vector(255 downto 0) := (others => '0');

signal resetAllEventCollectors : std_logic := '0';
signal eventsWriteIsReady : std_logic_vector(9 downto 0) := (others => '0');
signal eventsAckWrite : std_logic_vector(9 downto 0) := (others => '0');
signal eventsCurrentWriteOrderNibble : unsigned(15 downto 0) := (others => '0');
signal eventsCurrentWriteOrderSize : unsigned(1 downto 0) := (others => '0');
signal eventsWriteOrderNibblesMemoryBuffer : unsigned(255 downto 0) := (others => '0');
signal eventsWriteOrderNibbleOffset : unsigned(4 downto 0) := (others => '0');
signal eventsNumDRAMWrites : unsigned(15 downto 0) := (others => '0');
signal eventsOrdersNumDRAMWrites : unsigned(15 downto 0) := (others => '0');

constant constUint0 : unsigned(31 downto 0) := (others => '0');

pure function ComputeWriteStatsData(endFrameCounter0 : CounterStat; startFrameCounter0 : CounterStat;
	endFrameCounter1 : CounterStat; startFrameCounter1 : CounterStat;
	endFrameCounter2 : CounterStat; startFrameCounter2 : CounterStat;
	endFrameCounter3 : CounterStat; startFrameCounter3 : CounterStat;
	endFrameCounter4 : CounterStat; startFrameCounter4 : CounterStat;
	endFrameCounter5 : CounterStat; startFrameCounter5 : CounterStat;
	endFrameCounter6 : CounterStat; startFrameCounter6 : CounterStat;
	endFrameCounter7 : CounterStat; startFrameCounter7 : CounterStat) return unsigned is
begin
	return (endFrameCounter7 - startFrameCounter7) & (endFrameCounter6 - startFrameCounter6) & 
	(endFrameCounter5 - startFrameCounter5) & (endFrameCounter4 - startFrameCounter4) & 
	(endFrameCounter3 - startFrameCounter3) & (endFrameCounter2 - startFrameCounter2) &
	(endFrameCounter1 - startFrameCounter1) & (endFrameCounter0 - startFrameCounter0);
end function;

procedure CaptureFrameCounters(signal timeCounters : out FrameCaptureCycleCounters; signal counterStats : out FrameCaptureCounterStats) is
begin
	timeCounters.VertBatchBuilderCyclesIdle <= unsigned(VBB_CyclesIdle);
	timeCounters.VertBatchBuilderCyclesWorking <= unsigned(VBB_CyclesSpentWorking);
	timeCounters.VertBatchBuilderCyclesWaitingForOutput <= unsigned(VBB_CyclesWaitingForOutput);

	timeCounters.VShaderCyclesIdle <= unsigned(VSHADER_CyclesIdle);
	timeCounters.VShaderCyclesWorking <= unsigned(VSHADER_CyclesSpentWorking);
	timeCounters.VShaderCyclesWaitingForOutput <= unsigned(VSHADER_CyclesWaitingForOutput);
	timeCounters.VShaderCyclesExecShaderCode <= unsigned(VSHADER_CyclesExecShaderCode);

	timeCounters.IACyclesIdle <= unsigned(IA_CyclesIdle);
	timeCounters.IACyclesWorking <= unsigned(IA_CyclesSpentWorking);
	timeCounters.IACyclesWaitingForOutput <= unsigned(IA_CyclesWaitingForOutput);
	timeCounters.IACyclesLoadingToCache <= unsigned(IA_CyclesLoadingDataToCache);

	timeCounters.ClipCyclesIdle <= unsigned(CLIP_CyclesIdle);
	timeCounters.ClipCyclesWorking <= unsigned(CLIP_CyclesSpentWorking);
	timeCounters.ClipCyclesWaitingForOutput <= unsigned(CLIP_CyclesWaitingForOutput);

	timeCounters.TriSetupCyclesIdle <= unsigned(TRISETUP_CyclesIdle);
	timeCounters.TriSetupCyclesWorking <= unsigned(TRISETUP_CyclesSpentWorking);
	timeCounters.TriSetupCyclesWaitingForOutput <= unsigned(TRISETUP_CyclesWaitingForOutput);

	timeCounters.RasterizerCyclesIdle <= unsigned(RAST_CyclesIdle);
	timeCounters.RasterizerCyclesWorking <= unsigned(RAST_CyclesSpentWorking);
	timeCounters.RasterizerCyclesWaitingForOutput <= unsigned(RAST_CyclesWaitingForOutput);
	timeCounters.RasterizerCyclesWaitingForTriWorkCache <= unsigned(RAST_CyclesWaitingForTriWorkCache);

	timeCounters.DInterpCyclesIdle <= unsigned(DINTERP_CyclesIdle);
	timeCounters.DInterpCyclesWorking <= unsigned(DINTERP_CyclesSpentWorking);
	timeCounters.DInterpCyclesWaitingForOutput <= unsigned(DINTERP_CyclesWaitingForOutput);

	timeCounters.AttrInterpolatorCyclesIdle <= unsigned(INTERP_CyclesIdle);
	timeCounters.AttrInterpolatorCyclesWorking <= unsigned(INTERP_CyclesSpentWorking);
	timeCounters.AttrInterpolatorCyclesWaitingForOutput <= unsigned(INTERP_CyclesWaitingForOutput);

	timeCounters.TexSamplerCyclesIdle <= unsigned(TEXSAMP_CyclesIdle);
	timeCounters.TexSamplerCyclesWorking <= unsigned(TEXSAMP_CyclesSpentWorking);
	timeCounters.TexSamplerCyclesWaitingForOutput <= unsigned(TEXSAMP_CyclesWaitingForOutput);
	timeCounters.TexSamplerCyclesLoadingToCache <= unsigned(TEXSAMP_CyclesWaitingCacheLoad);

	timeCounters.ROPCyclesIdle <= unsigned(ROP_CyclesIdle);
	timeCounters.ROPCyclesWorking <= unsigned(ROP_CyclesSpentWorking);
	timeCounters.ROPCyclesWaitingForOutput <= unsigned(ROP_CyclesWaitingForOutput);
	timeCounters.ROPCyclesMemoryRead <= unsigned(ROP_CyclesWaitingForMemoryRead);

	timeCounters.CommandProcCyclesIdle <= unsigned(CMD_CyclesIdle);
	timeCounters.CommandProcCyclesWorking <= unsigned(CMD_CyclesSpentWorking);

	timeCounters.MemControllerReadCyclesIdle <= unsigned(MEM_ReadCyclesIdle);
	timeCounters.MemControllerReadCyclesWorking <= unsigned(MEM_ReadCyclesSpentWorking);

	timeCounters.MemControllerWriteCyclesIdle <= unsigned(MEM_WriteCyclesIdle);
	timeCounters.MemControllerWriteCyclesWorking <= unsigned(MEM_WriteCyclesSpentWorking);

	counterStats.ROPCounterCacheHits <= unsigned(ROP_CountCacheHits);
	counterStats.ROPCounterCacheMisses <= unsigned(ROP_CountCacheMisses);
	counterStats.MemReadCounterBytesTransferred <= unsigned(MEM_MemReadCountBytesTransferred);
	counterStats.MemReadCounterNumTransactions <= unsigned(MEM_MemReadCountTransactions);
	counterStats.MemReadCounterNonScanoutBytesTransferred <= unsigned(MEM_MemReadCountNonScanoutBytesTransferred);
	counterStats.MemReadCounterNonScanoutNumTransactions <= unsigned(MEM_MemReadCountNonScanoutTransactions);
	counterStats.MemWriteCounterBytesTransferred <= unsigned(MEM_MemWriteCountBytesTransferred);
	counterStats.MemWriteCounterNumTransactions <= unsigned(MEM_MemWriteCountTransactions);
end procedure;

pure function IsAnyWriterReady(writersReady : std_logic_vector(9 downto 0) ) return boolean is
begin
	for i in 0 to 9 loop
		if (writersReady(i) = '1') then
			return true;
		end if;
	end loop;
	return false;
end function;

pure function GetNextWriterIndex(writersReady : std_logic_vector(9 downto 0) ) return unsigned is
begin
	for i in 0 to 8 loop
		if (writersReady(i) = '1') then
			return to_unsigned(i, 4);
		end if;
	end loop;
	return to_unsigned(9, 4);
end function;

begin

MEM_StatsWriteRequestsFIFO_wr_data <= std_logic_vector(memoryWriteAddressBase + memoryWriteAddressOffset) & std_logic_vector(memoryWriteOutgoingData) & std_logic_vector(memoryWriteDWORDEnables);
MEM_StatsWriteRequestsFIFO_wr_en <= memoryWriteEnable;

DBG_CurrentState <= std_logic_vector(to_unsigned(StatsCollectorStateType'pos(currentState), 5) );
DBG_CurrentWriteData <= std_logic_vector(memoryWriteAddressBase + memoryWriteAddressOffset) & std_logic_vector(memoryWriteOutgoingData) & std_logic_vector(memoryWriteDWORDEnables);
DBG_CurrentWriteEn <= memoryWriteEnable;
DBG_EventsWriteIsReady <= eventsWriteIsReady;
DBG_EventsWriteIsReadyAck <= eventsAckWrite;
DBG_CurrentWriteOrderNibbles <= std_logic_vector(eventsCurrentWriteOrderNibble);
CMD_CountTimestampsMemoryWrites <= std_logic_vector(eventsNumDRAMWrites);
CMD_CountTimestampsOrdersMemoryWrites <= std_logic_vector(eventsOrdersNumDRAMWrites);
STAT_ResetWriteOrderNibblesFIFO <= resetAllEventCollectors;

topOfPipeCurrentDrawID <= unsigned(VBB_CurrentDrawEventID);
bottomOfPipeCurrentDrawID <= unsigned(ROP_CurrentDrawEventID);

VBBEventTracker : StatsEventTracker port map (clk => clk, STAT_Reset => resetAllEventCollectors, STAGE_CurrentEventID => VBB_CurrentDrawEventID, STAT_CurrentTimestamp => std_logic_vector(currentTimestamp), STAT_WriteIsReady => eventsWriteIsReady(0), STAT_WriteDRAMLine => eventsDataVBB, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(0) );
VSHADEREventTracker : StatsEventTracker port map (clk => clk, STAT_Reset => resetAllEventCollectors, STAGE_CurrentEventID => VSHADER_CurrentDrawEventID, STAT_CurrentTimestamp => std_logic_vector(currentTimestamp), STAT_WriteIsReady => eventsWriteIsReady(1), STAT_WriteDRAMLine => eventsDataVSHADER, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(1) );
IAEventTracker : StatsEventTracker port map (clk => clk, STAT_Reset => resetAllEventCollectors, STAGE_CurrentEventID => IA_CurrentDrawEventID, STAT_CurrentTimestamp => std_logic_vector(currentTimestamp), STAT_WriteIsReady => eventsWriteIsReady(2), STAT_WriteDRAMLine => eventsDataIA, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(2) );
CLIPEventTracker : StatsEventTracker port map (clk => clk, STAT_Reset => resetAllEventCollectors, STAGE_CurrentEventID => CLIP_CurrentDrawEventID, STAT_CurrentTimestamp => std_logic_vector(currentTimestamp), STAT_WriteIsReady => eventsWriteIsReady(3), STAT_WriteDRAMLine => eventsDataCLIP, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(3) );
TRISETUPEventTracker : StatsEventTracker port map (clk => clk, STAT_Reset => resetAllEventCollectors, STAGE_CurrentEventID => TRISETUP_CurrentDrawEventID, STAT_CurrentTimestamp => std_logic_vector(currentTimestamp), STAT_WriteIsReady => eventsWriteIsReady(4), STAT_WriteDRAMLine => eventsDataTRISETUP, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(4) );
RASTEventTracker : StatsEventTracker port map (clk => clk, STAT_Reset => resetAllEventCollectors, STAGE_CurrentEventID => RAST_CurrentDrawEventID, STAT_CurrentTimestamp => std_logic_vector(currentTimestamp), STAT_WriteIsReady => eventsWriteIsReady(5), STAT_WriteDRAMLine => eventsDataRAST, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(5) );
DINTERPEventTracker : StatsEventTracker port map (clk => clk, STAT_Reset => resetAllEventCollectors, STAGE_CurrentEventID => DINTERP_CurrentDrawEventID, STAT_CurrentTimestamp => std_logic_vector(currentTimestamp), STAT_WriteIsReady => eventsWriteIsReady(6), STAT_WriteDRAMLine => eventsDataDINTERP, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(6) );
INTERPEventTracker : StatsEventTracker port map (clk => clk, STAT_Reset => resetAllEventCollectors, STAGE_CurrentEventID => INTERP_CurrentDrawEventID, STAT_CurrentTimestamp => std_logic_vector(currentTimestamp), STAT_WriteIsReady => eventsWriteIsReady(7), STAT_WriteDRAMLine => eventsDataINTERP, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(7) );
TEXSAMPLEEventTracker : StatsEventTracker port map (clk => clk, STAT_Reset => resetAllEventCollectors, STAGE_CurrentEventID => TEXSAMP_CurrentDrawEventID, STAT_CurrentTimestamp => std_logic_vector(currentTimestamp), STAT_WriteIsReady => eventsWriteIsReady(8), STAT_WriteDRAMLine => eventsDataTEXSAMPLE, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(8) );
ROPEventTracker : StatsEventTracker port map (clk => clk, STAT_Reset => resetAllEventCollectors, STAGE_CurrentEventID => ROP_CurrentDrawEventID, STAT_CurrentTimestamp => std_logic_vector(currentTimestamp), STAT_WriteIsReady => eventsWriteIsReady(9), STAT_WriteDRAMLine => eventsDataROP, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(9) );

	process(clk)
	begin
		if (rising_edge(clk) ) then
			currentTimestamp <= currentTimestamp + 1;
		end if;
	end process;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			eventsFlushAllWrites <= '0';
			memoryWriteEnable <= '0';
			CMD_StatsSaveComplete <= '0';
			STAT_WriteOrderNibblesFIFO_wr_en <= '0';
			STAT_WriteOrderNibblesFIFO_rd_en <= '0';
			eventsAckWrite <= (others => '0');
			resetAllEventCollectors <= '0';

			case currentState is
				when waitingForCommand =>
					if (CMD_SetNewStatsConfig = '1') then
						currentEventRecordingState.EnableEventCollectorsThisFrame <= CMD_EnableEventTimestamps;
						currentEventRecordingState.EventTimestampsBaseAddress <= unsigned(CMD_WriteEventTimestampsAddress);
						currentEventRecordingState.EventOrderingsBaseAddress <= unsigned(CMD_WriteEventTimestampOrders);
						currentEventRecordingState.StatsWriteBaseAddress <= unsigned(CMD_WriteFrameStatsAddress);
						resetAllEventCollectors <= '1';
						if (CMD_EnableEventTimestamps = '1') then
							memoryWriteAddressBase <= unsigned(CMD_WriteEventTimestampsAddress);
							memoryWriteAddressOffset <= (others => '0');
						else
							memoryWriteAddressBase <= unsigned(CMD_WriteFrameStatsAddress);
							memoryWriteAddressOffset <= (others => '0');
						end if;
						eventsNumDRAMWrites <= (others => '0');
						eventsOrdersNumDRAMWrites <= (others => '0');
						eventsCurrentWriteOrderNibble <= (others => '1');
						eventsCurrentWriteOrderSize <= (others => '0');
					elsif (CMD_PresentSignal = '1') then
						flushCycles <= to_unsigned(9, 4);
						frameEndTimestamp <= currentTimestamp;
						if (currentEventRecordingState.EnableEventCollectorsThisFrame = '0') then
							currentState <= endFrameCapture;
						else
							currentState <= flushEventStats;
						end if;
					else
						if (IsAnyWriterReady(eventsWriteIsReady) and MEM_StatsWriteRequestsFIFO_full = '0') then
							if (currentEventRecordingState.EnableEventCollectorsThisFrame = '1') then
								memoryWriteEnable <= '1';
								eventsNumDRAMWrites <= eventsNumDRAMWrites + 1;
								memoryWriteAddressOffset <= memoryWriteAddressOffset + 32;
							end if;
							case GetNextWriterIndex(eventsWriteIsReady) is
								when "0000" =>
									memoryWriteOutgoingData <= unsigned(eventsDataVBB);
								when "0001" =>
									memoryWriteOutgoingData <= unsigned(eventsDataVSHADER);
								when "0010" =>
									memoryWriteOutgoingData <= unsigned(eventsDataIA);
								when "0011" =>
									memoryWriteOutgoingData <= unsigned(eventsDataCLIP);
								when "0100" =>
									memoryWriteOutgoingData <= unsigned(eventsDataTRISETUP);
								when "0101" =>
									memoryWriteOutgoingData <= unsigned(eventsDataRAST);
								when "0110" =>
									memoryWriteOutgoingData <= unsigned(eventsDataDINTERP);
								when "0111" =>
									memoryWriteOutgoingData <= unsigned(eventsDataINTERP);
								when "1000" =>
									memoryWriteOutgoingData <= unsigned(eventsDataTEXSAMPLE);
								when others => --when "1001" =>
									memoryWriteOutgoingData <= unsigned(eventsDataROP);
							end case;
							eventsAckWrite(to_integer(GetNextWriterIndex(eventsWriteIsReady) ) ) <= '1';

							if (currentEventRecordingState.EnableEventCollectorsThisFrame = '1') then
								if (eventsCurrentWriteOrderSize = 3) then
									STAT_WriteOrderNibblesFIFO_wr_data <= std_logic_vector(eventsCurrentWriteOrderNibble(11 downto 0) & GetNextWriterIndex(eventsWriteIsReady) );
									STAT_WriteOrderNibblesFIFO_wr_en <= '1';
								end if;
								eventsCurrentWriteOrderNibble <= eventsCurrentWriteOrderNibble(11 downto 0) & GetNextWriterIndex(eventsWriteIsReady);
								eventsCurrentWriteOrderSize <= eventsCurrentWriteOrderSize + 1;
							end if;
							currentState <= waitingForCommandCooldown;
						end if;
					end if;

				when waitingForCommandCooldown =>
					currentState <= waitingForCommand;

				when flushEventStats =>
					eventsFlushAllWrites <= '1';
					if (flushCycles = 0) then
						currentState <= finishEventWrites;
					end if;
					flushCycles <= flushCycles - 1;

				when finishEventWrites =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						if (IsAnyWriterReady(eventsWriteIsReady) ) then
							if (currentEventRecordingState.EnableEventCollectorsThisFrame = '1') then
								memoryWriteEnable <= '1';
								memoryWriteAddressOffset <= memoryWriteAddressOffset + 32;
								eventsNumDRAMWrites <= eventsNumDRAMWrites + 1;
								case GetNextWriterIndex(eventsWriteIsReady) is
									when "0000" =>
										memoryWriteOutgoingData <= unsigned(eventsDataVBB);
									when "0001" =>
										memoryWriteOutgoingData <= unsigned(eventsDataVSHADER);
									when "0010" =>
										memoryWriteOutgoingData <= unsigned(eventsDataIA);
									when "0011" =>
										memoryWriteOutgoingData <= unsigned(eventsDataCLIP);
									when "0100" =>
										memoryWriteOutgoingData <= unsigned(eventsDataTRISETUP);
									when "0101" =>
										memoryWriteOutgoingData <= unsigned(eventsDataRAST);
									when "0110" =>
										memoryWriteOutgoingData <= unsigned(eventsDataDINTERP);
									when "0111" =>
										memoryWriteOutgoingData <= unsigned(eventsDataINTERP);
									when "1000" =>
										memoryWriteOutgoingData <= unsigned(eventsDataTEXSAMPLE);
									when others => --when "1001" =>
										memoryWriteOutgoingData <= unsigned(eventsDataROP);
								end case;
							end if;
							eventsAckWrite(to_integer(GetNextWriterIndex(eventsWriteIsReady) ) ) <= '1';

							if (currentEventRecordingState.EnableEventCollectorsThisFrame = '1') then
								if (eventsCurrentWriteOrderSize = 3) then
									STAT_WriteOrderNibblesFIFO_wr_data <= std_logic_vector(eventsCurrentWriteOrderNibble(11 downto 0) & GetNextWriterIndex(eventsWriteIsReady) );
									STAT_WriteOrderNibblesFIFO_wr_en <= '1';
								end if;
								eventsCurrentWriteOrderNibble <= eventsCurrentWriteOrderNibble(11 downto 0) & GetNextWriterIndex(eventsWriteIsReady);
								eventsCurrentWriteOrderSize <= eventsCurrentWriteOrderSize + 1;
							end if;

							currentState <= finishEventWritesCooldown;
						else
							currentState <= finishEventOrderNibbles;
						end if;
					end if;

				when finishEventWritesCooldown =>
					currentState <= finishEventWrites;

				when finishEventOrderNibbles =>
					if (eventsCurrentWriteOrderSize = 0) then
						eventsWriteOrderNibbleOffset <= (others => '0');
						memoryWriteAddressBase <= currentEventRecordingState.EventOrderingsBaseAddress;
						memoryWriteAddressOffset <= (others => '0');
						currentState <= writeNibblesToMemory;
					else
						if (eventsCurrentWriteOrderSize = 3 and currentEventRecordingState.EnableEventCollectorsThisFrame = '1') then
							STAT_WriteOrderNibblesFIFO_wr_data <= std_logic_vector(eventsCurrentWriteOrderNibble(11 downto 0) ) & X"F";
							STAT_WriteOrderNibblesFIFO_wr_en <= '1';
						end if;
						eventsCurrentWriteOrderNibble <= eventsCurrentWriteOrderNibble(11 downto 0) & X"F";
						eventsCurrentWriteOrderSize <= eventsCurrentWriteOrderSize + 1;
					end if;

				when writeNibblesToMemory =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						if (STAT_WriteOrderNibblesFIFO_empty = '0') then
							eventsWriteOrderNibblesMemoryBuffer <= unsigned(STAT_WriteOrderNibblesFIFO_rd_data) & eventsWriteOrderNibblesMemoryBuffer(255 downto 16);
							if (eventsWriteOrderNibbleOffset = 15) then
								if (currentEventRecordingState.EnableEventCollectorsThisFrame = '1') then
									memoryWriteEnable <= '1';
									eventsOrdersNumDRAMWrites <= eventsOrdersNumDRAMWrites + 1;
									memoryWriteAddressOffset <= memoryWriteAddressOffset + 32;
									memoryWriteOutgoingData <= unsigned(STAT_WriteOrderNibblesFIFO_rd_data) & eventsWriteOrderNibblesMemoryBuffer(255 downto 16);
								end if;
								eventsWriteOrderNibbleOffset <= (others => '0');
								currentState <= writeNibblesToMemoryCooldown;
							else
								eventsWriteOrderNibbleOffset <= eventsWriteOrderNibbleOffset + 1;
								currentState <= writeNibblesToMemoryCooldown;
							end if;
							STAT_WriteOrderNibblesFIFO_rd_en <= '1';
						else
							if (eventsWriteOrderNibbleOffset = 0) then
								memoryWriteAddressBase <= currentEventRecordingState.EventTimestampsBaseAddress;
								memoryWriteAddressOffset <= (others => '0');
								currentState <= writeEndFrameHeaderToMemory;
							else
								if (eventsWriteOrderNibbleOffset = 15) then
									if (currentEventRecordingState.EnableEventCollectorsThisFrame = '1') then
										memoryWriteEnable <= '1';
										eventsOrdersNumDRAMWrites <= eventsOrdersNumDRAMWrites + 1;
										memoryWriteAddressOffset <= memoryWriteAddressOffset + 32;
										memoryWriteOutgoingData <= X"FFFF" & eventsWriteOrderNibblesMemoryBuffer(255 downto 16);
										eventsWriteOrderNibbleOffset <= (others => '0');
									end if;
								else
									eventsWriteOrderNibbleOffset <= eventsWriteOrderNibbleOffset + 1;
								end if;
								eventsWriteOrderNibblesMemoryBuffer <= X"FFFF" & eventsWriteOrderNibblesMemoryBuffer(255 downto 16);
							end if;
						end if;
					end if;

				when writeNibblesToMemoryCooldown =>
					currentState <= writeNibblesToMemory;
					
				when writeEndFrameHeaderToMemory =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						if (currentEventRecordingState.EnableEventCollectorsThisFrame = '1') then
							memoryWriteAddressBase <= currentEventRecordingState.EventTimestampsBaseAddress;
							memoryWriteAddressOffset <= (others => '0');
							memoryWriteOutgoingData <= X"0000000000000000" 
								& X"0000" & bottomOfPipeCurrentDrawID & -- Offset 20 bytes
								X"0000" & topOfPipeCurrentDrawID & -- Offset 16 bytes
								X"0000" & eventsOrdersNumDRAMWrites & -- Offset 12 bytes
								X"0000" & eventsNumDRAMWrites &  -- Offset 8 bytes
								frameEndTimestamp & -- Offset 4 bytes
								frameStartTimestamp; -- Offset 0 bytes
							memoryWriteEnable <= '1';
						end if;

						currentState <= endFrameCapture;
					end if;

				when endFrameCapture =>
					CaptureFrameCounters(endFrameTimeCounters, endFrameCounterStats);
					memoryWriteAddressBase <= currentEventRecordingState.StatsWriteBaseAddress;
					memoryWriteAddressOffset <= (others => '0');
					currentState <= saveStatsToMem0;

				when saveStatsToMem0 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameTimeCounters.IACyclesIdle, startFrameTimeCounters.IACyclesIdle,
							endFrameTimeCounters.IACyclesWorking, startFrameTimeCounters.IACyclesWorking,
							endFrameTimeCounters.IACyclesWaitingForOutput, startFrameTimeCounters.IACyclesWaitingForOutput,
							endFrameTimeCounters.IACyclesLoadingToCache, startFrameTimeCounters.IACyclesLoadingToCache,
							endFrameTimeCounters.TriSetupCyclesIdle, startFrameTimeCounters.TriSetupCyclesIdle,
							endFrameTimeCounters.TriSetupCyclesWorking, startFrameTimeCounters.TriSetupCyclesWorking,
							endFrameTimeCounters.TriSetupCyclesWaitingForOutput, startFrameTimeCounters.TriSetupCyclesWaitingForOutput,
							endFrameTimeCounters.RasterizerCyclesIdle, startFrameTimeCounters.RasterizerCyclesIdle);
						currentState <= saveStatsToMem1;
					end if;

				when saveStatsToMem1 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddressOffset <= memoryWriteAddressOffset + 32;
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameTimeCounters.RasterizerCyclesWorking, startFrameTimeCounters.RasterizerCyclesWorking,
							endFrameTimeCounters.RasterizerCyclesWaitingForOutput, startFrameTimeCounters.RasterizerCyclesWaitingForOutput,
							endFrameTimeCounters.RasterizerCyclesWaitingForTriWorkCache, startFrameTimeCounters.RasterizerCyclesWaitingForTriWorkCache,
							endFrameTimeCounters.AttrInterpolatorCyclesIdle, startFrameTimeCounters.AttrInterpolatorCyclesIdle,
							endFrameTimeCounters.AttrInterpolatorCyclesWorking, startFrameTimeCounters.AttrInterpolatorCyclesWorking,
							endFrameTimeCounters.AttrInterpolatorCyclesWaitingForOutput, startFrameTimeCounters.AttrInterpolatorCyclesWaitingForOutput,
							endFrameTimeCounters.TexSamplerCyclesIdle, startFrameTimeCounters.TexSamplerCyclesIdle,
							endFrameTimeCounters.TexSamplerCyclesWorking, startFrameTimeCounters.TexSamplerCyclesWorking);
						currentState <= saveStatsToMem2;
					end if;

				when saveStatsToMem2 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddressOffset <= memoryWriteAddressOffset + 32;
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameTimeCounters.TexSamplerCyclesWaitingForOutput, startFrameTimeCounters.TexSamplerCyclesWaitingForOutput,
							endFrameTimeCounters.TexSamplerCyclesLoadingToCache, startFrameTimeCounters.TexSamplerCyclesLoadingToCache,
							endFrameTimeCounters.ROPCyclesIdle, startFrameTimeCounters.ROPCyclesIdle,
							endFrameTimeCounters.ROPCyclesWorking, startFrameTimeCounters.ROPCyclesWorking,
							endFrameTimeCounters.ROPCyclesWaitingForOutput, startFrameTimeCounters.ROPCyclesWaitingForOutput,
							endFrameTimeCounters.ROPCyclesMemoryRead, startFrameTimeCounters.ROPCyclesMemoryRead,
							endFrameTimeCounters.CommandProcCyclesIdle, startFrameTimeCounters.CommandProcCyclesIdle,
							endFrameTimeCounters.CommandProcCyclesWorking, startFrameTimeCounters.CommandProcCyclesWorking);
						currentState <= saveStatsToMem3;
					end if;

				when saveStatsToMem3 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddressOffset <= memoryWriteAddressOffset + 32;
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameTimeCounters.MemControllerReadCyclesIdle, startFrameTimeCounters.MemControllerReadCyclesIdle,
							endFrameTimeCounters.MemControllerReadCyclesWorking, startFrameTimeCounters.MemControllerReadCyclesWorking,
							endFrameTimeCounters.MemControllerWriteCyclesIdle, startFrameTimeCounters.MemControllerWriteCyclesIdle,
							endFrameTimeCounters.MemControllerWriteCyclesWorking, startFrameTimeCounters.MemControllerWriteCyclesWorking,
							endFrameTimeCounters.VShaderCyclesIdle, startFrameTimeCounters.VShaderCyclesIdle,
							endFrameTimeCounters.VShaderCyclesWorking, startFrameTimeCounters.VShaderCyclesWorking,
							endFrameTimeCounters.VShaderCyclesWaitingForOutput, startFrameTimeCounters.VShaderCyclesWaitingForOutput,
							endFrameTimeCounters.VShaderCyclesExecShaderCode, startFrameTimeCounters.VShaderCyclesExecShaderCode);
						currentState <= saveStatsToMem4;
					end if;

				when saveStatsToMem4 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddressOffset <= memoryWriteAddressOffset + 32;
						memoryWriteOutgoingData <= ComputeWriteStatsData(
							endFrameTimeCounters.DInterpCyclesIdle, startFrameTimeCounters.DInterpCyclesIdle,
							endFrameTimeCounters.DInterpCyclesWorking, startFrameTimeCounters.DInterpCyclesWorking,
							endFrameTimeCounters.DInterpCyclesWaitingForOutput, startFrameTimeCounters.DInterpCyclesWaitingForOutput,
							constUint0, constUint0,
							endFrameCounterStats.ROPCounterCacheHits, startFrameCounterStats.ROPCounterCacheHits,
							endFrameCounterStats.ROPCounterCacheMisses, startFrameCounterStats.ROPCounterCacheMisses,
							endFrameCounterStats.MemReadCounterBytesTransferred, startFrameCounterStats.MemReadCounterBytesTransferred,
							endFrameCounterStats.MemReadCounterNumTransactions, startFrameCounterStats.MemReadCounterNumTransactions);
						currentState <= saveStatsToMem5;
					end if;

				when saveStatsToMem5 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddressOffset <= memoryWriteAddressOffset + 32;
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameCounterStats.MemReadCounterNonScanoutBytesTransferred, startFrameCounterStats.MemReadCounterNonScanoutBytesTransferred,
							endFrameCounterStats.MemReadCounterNonScanoutNumTransactions, startFrameCounterStats.MemReadCounterNonScanoutNumTransactions,
							endFrameCounterStats.MemWriteCounterBytesTransferred, startFrameCounterStats.MemWriteCounterBytesTransferred,
							endFrameCounterStats.MemWriteCounterNumTransactions, startFrameCounterStats.MemWriteCounterNumTransactions,
							endFrameTimeCounters.ClipCyclesIdle, startFrameTimeCounters.ClipCyclesIdle,
							endFrameTimeCounters.ClipCyclesWorking, startFrameTimeCounters.ClipCyclesWorking,
							endFrameTimeCounters.ClipCyclesWaitingForOutput, startFrameTimeCounters.ClipCyclesWaitingForOutput,
							constUint0, constUint0);
						currentState <= saveStatsToMem6;
					end if;

				when saveStatsToMem6 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddressOffset <= memoryWriteAddressOffset + 32;
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameTimeCounters.VertBatchBuilderCyclesIdle, startFrameTimeCounters.VertBatchBuilderCyclesIdle,
							endFrameTimeCounters.VertBatchBuilderCyclesWorking, startFrameTimeCounters.VertBatchBuilderCyclesWorking,
							endFrameTimeCounters.VertBatchBuilderCyclesWaitingForOutput, startFrameTimeCounters.VertBatchBuilderCyclesWaitingForOutput,
							constUint0, constUint0,
							constUint0, constUint0,
							constUint0, constUint0,
							constUint0, constUint0,
							constUint0, constUint0);
						currentState <= startFrameCapture;
					end if;
				
				when startFrameCapture =>
					-- Reset our memory pointers and wipe out any lingering data from the previous frame:
					resetAllEventCollectors <= '1';
					memoryWriteAddressBase <= currentEventRecordingState.EventTimestampsBaseAddress;
					memoryWriteAddressOffset <= (others => '0');
					eventsNumDRAMWrites <= (others => '0');
					eventsOrdersNumDRAMWrites <= (others => '0');
					eventsCurrentWriteOrderNibble <= (others => '1');
					eventsCurrentWriteOrderSize <= (others => '0');

					-- Set our new timestamp:
					frameStartTimestamp <= currentTimestamp;

					-- Signal to the CommandProcessor who is waiting on us to finish writing out stats that we are done
					CMD_StatsSaveComplete <= '1';

					-- Flip our cycle counter buffers to start counting for the next frame:
					startFrameTimeCounters <= endFrameTimeCounters;
					startFrameCounterStats <= endFrameCounterStats;
					currentState <= startFrameCapture2;

				when startFrameCapture2 =>
					currentState <= waitingForCommand;

			end case;
		end if;
	end process;

end Behavioral;
