library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity StatsCollector is
	Port ( clk : in STD_LOGIC;

	-- Command Processor interface begin
		CMD_PresentSignal : in STD_LOGIC;
		CMD_WriteFrameStatsAddress : in STD_LOGIC_VECTOR(29 downto 0);
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
		DBG_CurrentState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0')
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

type StatsCollectorStateType is 
(
	waitingForCommand, -- 0
	endFrameCapture, -- 1
	saveStatsToMem0, -- 2
	saveStatsToMem1, -- 3
	saveStatsToMem2, -- 4
	saveStatsToMem3, -- 5
	saveStatsToMem4, -- 6
	saveStatsToMem5, -- 7
	saveStatsToMem6, -- 8
	startFrameCapture, -- 9
	startFrameCapture2 -- 10
);

-- Typedef our counter types to uint32:
subtype CycleCounter is unsigned(31 downto 0);
subtype CounterStat is unsigned(31 downto 0);

component StatsEventTracker
port(
	clk : in STD_LOGIC;

	STAGE_CurrentEventID : in STD_LOGIC_VECTOR(15 downto 0);
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

signal currentState : StatsCollectorStateType := waitingForCommand;

signal currentTimestamp : unsigned(31 downto 0) := (others => '0');
signal eventsFlushAllWrites : std_logic := '0';

signal startFrameTimeCounters : FrameCaptureCycleCounters := (others => (others => '0') );
signal startFrameCounterStats : FrameCaptureCounterStats := (others => (others => '0') );

signal endFrameTimeCounters : FrameCaptureCycleCounters := (others => (others => '0') );
signal endFrameCounterStats : FrameCaptureCounterStats := (others => (others => '0') );

signal memoryWriteAddress : unsigned(29 downto 0) := (others => '0');
signal memoryWriteDWORDEnables : unsigned(7 downto 0) := (others => '1');
signal memoryWriteOutgoingData : unsigned(255 downto 0) := (others => '0');
signal memoryWriteEnable : std_logic := '0';

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

signal eventsWriteIsReady : std_logic_vector(9 downto 0) := (others => '0');
signal eventsAckWrite : std_logic_vector(9 downto 0) := (others => '0');
signal eventsCurrentWriteOrderNibble : unsigned(15 downto 0) := (others => '0');
signal eventsCurrentWriteOrderSize : unsigned(1 downto 0) := (others => '0');

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

MEM_StatsWriteRequestsFIFO_wr_data <= std_logic_vector(memoryWriteAddress) & std_logic_vector(memoryWriteOutgoingData) & std_logic_vector(memoryWriteDWORDEnables);
MEM_StatsWriteRequestsFIFO_wr_en <= memoryWriteEnable;

DBG_CurrentState <= std_logic_vector(to_unsigned(StatsCollectorStateType'pos(currentState), 4) );

VBBEventTracker : StatsEventTracker port map (clk => clk, STAGE_CurrentEventID => VBB_CurrentDrawEventID, STAT_CurrentTimestamp => currentTimestamp, STAT_WriteIsReady => eventsWriteIsReady(0), STAT_WriteDRAMLine => eventsDataVBB, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(0) );
VSHADEREventTracker : StatsEventTracker port map (clk => clk, STAGE_CurrentEventID => VSHADER_CurrentDrawEventID, STAT_CurrentTimestamp => currentTimestamp, STAT_WriteIsReady => eventsWriteIsReady(1), STAT_WriteDRAMLine => eventsDataVSHADER, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(1) );
IAEventTracker : StatsEventTracker port map (clk => clk, STAGE_CurrentEventID => IA_CurrentDrawEventID, STAT_CurrentTimestamp => currentTimestamp, STAT_WriteIsReady => eventsWriteIsReady(2), STAT_WriteDRAMLine => eventsDataIA, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(2) );
CLIPEventTracker : StatsEventTracker port map (clk => clk, STAGE_CurrentEventID => CLIP_CurrentDrawEventID, STAT_CurrentTimestamp => currentTimestamp, STAT_WriteIsReady => eventsWriteIsReady(3), STAT_WriteDRAMLine => eventsDataCLIP, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(3) );
TRISETUPEventTracker : StatsEventTracker port map (clk => clk, STAGE_CurrentEventID => TRISETUP_CurrentDrawEventID, STAT_CurrentTimestamp => currentTimestamp, STAT_WriteIsReady => eventsWriteIsReady(4), STAT_WriteDRAMLine => eventsDataTRISETUP, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(4) );
RASTEventTracker : StatsEventTracker port map (clk => clk, STAGE_CurrentEventID => RAST_CurrentDrawEventID, STAT_CurrentTimestamp => currentTimestamp, STAT_WriteIsReady => eventsWriteIsReady(5), STAT_WriteDRAMLine => eventsDataRAST, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(5) );
DINTERPEventTracker : StatsEventTracker port map (clk => clk, STAGE_CurrentEventID => DINTERP_CurrentDrawEventID, STAT_CurrentTimestamp => currentTimestamp, STAT_WriteIsReady => eventsWriteIsReady(6), STAT_WriteDRAMLine => eventsDataDINTERP, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(6) );
INTERPEventTracker : StatsEventTracker port map (clk => clk, STAGE_CurrentEventID => INTERP_CurrentDrawEventID, STAT_CurrentTimestamp => currentTimestamp, STAT_WriteIsReady => eventsWriteIsReady(7), STAT_WriteDRAMLine => eventsDataINTERP, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(7) );
TEXSAMPLEEventTracker : StatsEventTracker port map (clk => clk, STAGE_CurrentEventID => TEXSAMP_CurrentDrawEventID, STAT_CurrentTimestamp => currentTimestamp, STAT_WriteIsReady => eventsWriteIsReady(8), STAT_WriteDRAMLine => eventsDataTEXSAMPLE, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(8) );
ROPEventTracker : StatsEventTracker port map (clk => clk, STAGE_CurrentEventID => ROP_CurrentDrawEventID, STAT_CurrentTimestamp => currentTimestamp, STAT_WriteIsReady => eventsWriteIsReady(9), STAT_WriteDRAMLine => eventsDataROP, STAT_FlushWrite => eventsFlushAllWrites, STAT_AckWrite => eventsAckWrite(9) );

	process(clk)
	begin
		if (rising_edge(clk) ) then
			currentTimestamp <= currentTimestamp + 1;
		end if;
	end process;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when waitingForCommand =>
					eventsAckWrite <= (others => '0');
					memoryWriteEnable <= '0';
					STAT_WriteOrderNibblesFIFO_wr_en <= '0';

					if (CMD_PresentSignal = '1') then
						memoryWriteAddress <= unsigned(CMD_WriteFrameStatsAddress);
						currentState <= endFrameCapture;
					else
						if (IsAnyWriterReady(eventsWriteIsReady) and MEM_StatsWriteRequestsFIFO_full = '0') then
							memoryWriteEnable <= '1';
							memoryWriteDWORDEnables <= (others => '1');
							memoryWriteAddress <= memoryWriteAddress + 32;
							case GetNextWriterIndex(eventsWriteIsReady) is
								when "0000" =>
									memoryWriteOutgoingData <= eventsDataVBB;
								when "0001" =>
									memoryWriteOutgoingData <= eventsDataVSHADER;
								when "0010" =>
									memoryWriteOutgoingData <= eventsDataIA;
								when "0011" =>
									memoryWriteOutgoingData <= eventsDataCLIP;
								when "0100" =>
									memoryWriteOutgoingData <= eventsDataTRISETUP;
								when "0101" =>
									memoryWriteOutgoingData <= eventsDataRAST;
								when "0110" =>
									memoryWriteOutgoingData <= eventsDataDINTERP;
								when "0111" =>
									memoryWriteOutgoingData <= eventsDataINTERP;
								when "1000" =>
									memoryWriteOutgoingData <= eventsDataTEXSAMPLE;
								when others => --when "1001" =>
									memoryWriteOutgoingData <= eventsDataROP;
							end case;
							eventsAckWrite(to_integer(GetNextWriterIndex(eventsWriteIsReady) ) ) <= '1';

							if (eventsCurrentWriteOrderSize = 3) then
								STAT_WriteOrderNibblesFIFO_wr_data <= std_logic_vector(eventsCurrentWriteOrderNibble(15 downto 4) & GetNextWriterIndex(eventsWriteIsReady) );
								STAT_WriteOrderNibblesFIFO_wr_en <= '1';
							end if;
							eventsCurrentWriteOrderNibble <= eventsCurrentWriteOrderNibble(15 downto 4) & GetNextWriterIndex(eventsWriteIsReady);
							eventsCurrentWriteOrderSize <= eventsCurrentWriteOrderSize + 1;
						end if;
					end if;

				when endFrameCapture =>
					CaptureFrameCounters(endFrameTimeCounters, endFrameCounterStats);
					currentState <= saveStatsToMem0;

				when saveStatsToMem0 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteDWORDEnables <= (others => '1');
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameTimeCounters.IACyclesIdle, startFrameTimeCounters.IACyclesIdle,
							endFrameTimeCounters.IACyclesWorking, startFrameTimeCounters.IACyclesWorking,
							endFrameTimeCounters.IACyclesWaitingForOutput, startFrameTimeCounters.IACyclesWaitingForOutput,
							endFrameTimeCounters.IACyclesLoadingToCache, startFrameTimeCounters.IACyclesLoadingToCache,
							endFrameTimeCounters.TriSetupCyclesIdle, startFrameTimeCounters.TriSetupCyclesIdle,
							endFrameTimeCounters.TriSetupCyclesWorking, startFrameTimeCounters.TriSetupCyclesWorking,
							endFrameTimeCounters.TriSetupCyclesWaitingForOutput, startFrameTimeCounters.TriSetupCyclesWaitingForOutput,
							endFrameTimeCounters.RasterizerCyclesIdle, startFrameTimeCounters.RasterizerCyclesIdle);
						currentState <= saveStatsToMem1;
					else
						memoryWriteEnable <= '0';
					end if;

				when saveStatsToMem1 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddress <= memoryWriteAddress + 32;
						memoryWriteDWORDEnables <= (others => '1');
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameTimeCounters.RasterizerCyclesWorking, startFrameTimeCounters.RasterizerCyclesWorking,
							endFrameTimeCounters.RasterizerCyclesWaitingForOutput, startFrameTimeCounters.RasterizerCyclesWaitingForOutput,
							endFrameTimeCounters.RasterizerCyclesWaitingForTriWorkCache, startFrameTimeCounters.RasterizerCyclesWaitingForTriWorkCache,
							endFrameTimeCounters.AttrInterpolatorCyclesIdle, startFrameTimeCounters.AttrInterpolatorCyclesIdle,
							endFrameTimeCounters.AttrInterpolatorCyclesWorking, startFrameTimeCounters.AttrInterpolatorCyclesWorking,
							endFrameTimeCounters.AttrInterpolatorCyclesWaitingForOutput, startFrameTimeCounters.AttrInterpolatorCyclesWaitingForOutput,
							endFrameTimeCounters.TexSamplerCyclesIdle, startFrameTimeCounters.TexSamplerCyclesIdle,
							endFrameTimeCounters.TexSamplerCyclesWorking, startFrameTimeCounters.TexSamplerCyclesWorking);
						currentState <= saveStatsToMem2;
					else
						memoryWriteEnable <= '0';
					end if;

				when saveStatsToMem2 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddress <= memoryWriteAddress + 32;
						memoryWriteDWORDEnables <= (others => '1');
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameTimeCounters.TexSamplerCyclesWaitingForOutput, startFrameTimeCounters.TexSamplerCyclesWaitingForOutput,
							endFrameTimeCounters.TexSamplerCyclesLoadingToCache, startFrameTimeCounters.TexSamplerCyclesLoadingToCache,
							endFrameTimeCounters.ROPCyclesIdle, startFrameTimeCounters.ROPCyclesIdle,
							endFrameTimeCounters.ROPCyclesWorking, startFrameTimeCounters.ROPCyclesWorking,
							endFrameTimeCounters.ROPCyclesWaitingForOutput, startFrameTimeCounters.ROPCyclesWaitingForOutput,
							endFrameTimeCounters.ROPCyclesMemoryRead, startFrameTimeCounters.ROPCyclesMemoryRead,
							endFrameTimeCounters.CommandProcCyclesIdle, startFrameTimeCounters.CommandProcCyclesIdle,
							endFrameTimeCounters.CommandProcCyclesWorking, startFrameTimeCounters.CommandProcCyclesWorking);
						currentState <= saveStatsToMem3;
					else
						memoryWriteEnable <= '0';
					end if;

				when saveStatsToMem3 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddress <= memoryWriteAddress + 32;
						memoryWriteDWORDEnables <= (others => '1');
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameTimeCounters.MemControllerReadCyclesIdle, startFrameTimeCounters.MemControllerReadCyclesIdle,
							endFrameTimeCounters.MemControllerReadCyclesWorking, startFrameTimeCounters.MemControllerReadCyclesWorking,
							endFrameTimeCounters.MemControllerWriteCyclesIdle, startFrameTimeCounters.MemControllerWriteCyclesIdle,
							endFrameTimeCounters.MemControllerWriteCyclesWorking, startFrameTimeCounters.MemControllerWriteCyclesWorking,
							endFrameTimeCounters.VShaderCyclesIdle, startFrameTimeCounters.VShaderCyclesIdle,
							endFrameTimeCounters.VShaderCyclesWorking, startFrameTimeCounters.VShaderCyclesWorking,
							endFrameTimeCounters.VShaderCyclesWaitingForOutput, startFrameTimeCounters.VShaderCyclesWaitingForOutput,
							endFrameTimeCounters.VShaderCyclesExecShaderCode, startFrameTimeCounters.VShaderCyclesExecShaderCode);
						currentState <= saveStatsToMem4;
					else
						memoryWriteEnable <= '0';
					end if;

				when saveStatsToMem4 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddress <= memoryWriteAddress + 32;
						memoryWriteDWORDEnables <= (others => '1');
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
					else
						memoryWriteEnable <= '0';
					end if;

				when saveStatsToMem5 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddress <= memoryWriteAddress + 32;
						memoryWriteDWORDEnables <= (others => '1');
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameCounterStats.MemReadCounterNonScanoutBytesTransferred, startFrameCounterStats.MemReadCounterNonScanoutBytesTransferred,
							endFrameCounterStats.MemReadCounterNonScanoutNumTransactions, startFrameCounterStats.MemReadCounterNonScanoutNumTransactions,
							endFrameCounterStats.MemWriteCounterBytesTransferred, startFrameCounterStats.MemWriteCounterBytesTransferred,
							endFrameCounterStats.MemWriteCounterNumTransactions, startFrameCounterStats.MemWriteCounterNumTransactions,
							endFrameTimeCounters.ClipCyclesIdle, startFrameTimeCounters.ClipCyclesIdle,
							endFrameTimeCounters.ClipCyclesWorking, startFrameTimeCounters.ClipCyclesWorking,
							endFrameTimeCounters.ClipCyclesWaitingForOutput, startFrameTimeCounters.ClipCyclesWaitingForOutput,
							constUint0, constUint0);
						currentState <= saveStatsToMem6;
					else
						memoryWriteEnable <= '0';
					end if;

				when saveStatsToMem6 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddress <= memoryWriteAddress + 32;
						memoryWriteDWORDEnables <= (others => '1');
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameTimeCounters.VertBatchBuilderCyclesIdle, startFrameTimeCounters.VertBatchBuilderCyclesIdle,
							endFrameTimeCounters.VertBatchBuilderCyclesWorking, startFrameTimeCounters.VertBatchBuilderCyclesWorking,
							endFrameTimeCounters.VertBatchBuilderCyclesWaitingForOutput, startFrameTimeCounters.VertBatchBuilderCyclesWaitingForOutput,
							constUint0, constUint0,
							constUint0, constUint0,
							constUint0, constUint0,
							constUint0, constUint0,
							constUint0, constUint0);
						CMD_StatsSaveComplete <= '1'; -- Signal to the CommandProcessor who is waiting on us to finish writing out stats that we are done
						currentState <= startFrameCapture;
					else
						memoryWriteEnable <= '0';
					end if;
				
				when startFrameCapture =>
					memoryWriteEnable <= '0'; -- Deassert after one clock cycle
					CMD_StatsSaveComplete <= '0'; -- Deassert after one clock cycle
					startFrameTimeCounters <= endFrameTimeCounters;
					startFrameCounterStats <= endFrameCounterStats;
					currentState <= startFrameCapture2;

				when startFrameCapture2 =>
					currentState <= waitingForCommand;

			end case;
		end if;
	end process;

end Behavioral;
