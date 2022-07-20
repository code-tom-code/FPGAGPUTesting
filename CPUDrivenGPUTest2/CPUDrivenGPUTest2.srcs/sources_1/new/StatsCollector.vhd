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

	-- Stats interface begin
		IA_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		IA_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		IA_CyclesLoadingDataToCache : in STD_LOGIC_VECTOR(31 downto 0);
		IA_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);

		TRISETUP_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		TRISETUP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);

		RAST_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		RAST_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		RAST_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		RAST_CyclesWaitingForTriWorkCache : in STD_LOGIC_VECTOR(31 downto 0);

		INTERP_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		INTERP_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		INTERP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);

		TEXSAMP_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		TEXSAMP_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		TEXSAMP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		TEXSAMP_CyclesWaitingCacheLoad : in STD_LOGIC_VECTOR(31 downto 0);

		ROP_CyclesIdle : in STD_LOGIC_VECTOR(31 downto 0);
		ROP_CyclesSpentWorking : in STD_LOGIC_VECTOR(31 downto 0);
		ROP_CyclesWaitingForOutput : in STD_LOGIC_VECTOR(31 downto 0);
		ROP_CyclesWaitingForMemoryRead : in STD_LOGIC_VECTOR(31 downto 0);
		ROP_CountCacheHits : in STD_LOGIC_VECTOR(31 downto 0);
		ROP_CountCacheMisses : in STD_LOGIC_VECTOR(31 downto 0);

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
	init, -- 0
	waitingForCommand, -- 1
	endFrameCapture, -- 2
	saveStatsToMem0, -- 3
	saveStatsToMem1, -- 4
	saveStatsToMem2, -- 5
	saveStatsToMem3, -- 6
	saveStatsToMem4, -- 7
	startFrameCapture -- 8
);

-- Typedef our counter types to uint32:
subtype CycleCounter is unsigned(31 downto 0);
subtype CounterStat is unsigned(31 downto 0);

type FrameCaptureCycleCounters is record
	IACyclesIdle : CycleCounter;
	IACyclesWorking : CycleCounter;
	IACyclesWaitingForOutput : CycleCounter;
	IACyclesLoadingToCache : CycleCounter;

	TriSetupCyclesIdle : CycleCounter;
	TriSetupCyclesWorking : CycleCounter;
	TriSetupCyclesWaitingForOutput : CycleCounter;

	RasterizerCyclesIdle : CycleCounter;
	RasterizerCyclesWorking : CycleCounter;
	RasterizerCyclesWaitingForOutput : CycleCounter;
	RasterizerCyclesWaitingForTriWorkCache : CycleCounter;

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

signal currentState : StatsCollectorStateType := init;

signal startFrameTimeCounters : FrameCaptureCycleCounters;
signal startFrameCounterStats : FrameCaptureCounterStats;

signal endFrameTimeCounters : FrameCaptureCycleCounters;
signal endFrameCounterStats : FrameCaptureCounterStats;

signal memoryWriteAddress : unsigned(29 downto 0) := (others => '0');
signal memoryWriteDWORDEnables : unsigned(7 downto 0) := (others => '1');
signal memoryWriteOutgoingData : unsigned(255 downto 0) := (others => '0');
signal memoryWriteEnable : std_logic := '0';

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

procedure InitializeFrameCounters(signal timeCounters : out FrameCaptureCycleCounters; signal counterStats : out FrameCaptureCounterStats) is
begin
	timeCounters.IACyclesIdle <= (others => '0');
	timeCounters.IACyclesWorking <= (others => '0');
	timeCounters.IACyclesWaitingForOutput <= (others => '0');
	timeCounters.IACyclesLoadingToCache <= (others => '0');

	timeCounters.TriSetupCyclesIdle <= (others => '0');
	timeCounters.TriSetupCyclesWorking <= (others => '0');
	timeCounters.TriSetupCyclesWaitingForOutput <= (others => '0');

	timeCounters.RasterizerCyclesIdle <= (others => '0');
	timeCounters.RasterizerCyclesWorking <= (others => '0');
	timeCounters.RasterizerCyclesWaitingForOutput <= (others => '0');
	timeCounters.RasterizerCyclesWaitingForTriWorkCache <= (others => '0');

	timeCounters.AttrInterpolatorCyclesIdle <= (others => '0');
	timeCounters.AttrInterpolatorCyclesWorking <= (others => '0');
	timeCounters.AttrInterpolatorCyclesWaitingForOutput <= (others => '0');

	timeCounters.TexSamplerCyclesIdle <= (others => '0');
	timeCounters.TexSamplerCyclesWorking <= (others => '0');
	timeCounters.TexSamplerCyclesWaitingForOutput <= (others => '0');
	timeCounters.TexSamplerCyclesLoadingToCache <= (others => '0');

	timeCounters.ROPCyclesIdle <= (others => '0');
	timeCounters.ROPCyclesWorking <= (others => '0');
	timeCounters.ROPCyclesWaitingForOutput <= (others => '0');
	timeCounters.ROPCyclesMemoryRead <= (others => '0');

	timeCounters.CommandProcCyclesIdle <= (others => '0');
	timeCounters.CommandProcCyclesWorking <= (others => '0');

	timeCounters.MemControllerReadCyclesIdle <= (others => '0');
	timeCounters.MemControllerReadCyclesWorking <= (others => '0');

	timeCounters.MemControllerWriteCyclesIdle <= (others => '0');
	timeCounters.MemControllerWriteCyclesWorking <= (others => '0');

	counterStats.ROPCounterCacheHits <= (others => '0');
	counterStats.ROPCounterCacheMisses <= (others => '0');
	counterStats.MemReadCounterBytesTransferred <= (others => '0');
	counterStats.MemReadCounterNumTransactions <= (others => '0');
	counterStats.MemReadCounterNonScanoutBytesTransferred <= (others => '0');
	counterStats.MemReadCounterNonScanoutNumTransactions <= (others => '0');
	counterStats.MemWriteCounterBytesTransferred <= (others => '0');
	counterStats.MemWriteCounterNumTransactions <= (others => '0');
end procedure;

procedure CaptureFrameCounters(signal timeCounters : out FrameCaptureCycleCounters; signal counterStats : out FrameCaptureCounterStats) is
begin
	timeCounters.IACyclesIdle <= unsigned(IA_CyclesIdle);
	timeCounters.IACyclesWorking <= unsigned(IA_CyclesSpentWorking);
	timeCounters.IACyclesWaitingForOutput <= unsigned(IA_CyclesWaitingForOutput);
	timeCounters.IACyclesLoadingToCache <= unsigned(IA_CyclesLoadingDataToCache);

	timeCounters.TriSetupCyclesIdle <= unsigned(TRISETUP_CyclesIdle);
	timeCounters.TriSetupCyclesWorking <= unsigned(TRISETUP_CyclesSpentWorking);
	timeCounters.TriSetupCyclesWaitingForOutput <= unsigned(TRISETUP_CyclesWaitingForOutput);

	timeCounters.RasterizerCyclesIdle <= unsigned(RAST_CyclesIdle);
	timeCounters.RasterizerCyclesWorking <= unsigned(RAST_CyclesSpentWorking);
	timeCounters.RasterizerCyclesWaitingForOutput <= unsigned(RAST_CyclesWaitingForOutput);
	timeCounters.RasterizerCyclesWaitingForTriWorkCache <= unsigned(RAST_CyclesWaitingForTriWorkCache);

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

begin

MEM_StatsWriteRequestsFIFO_wr_data <= std_logic_vector(memoryWriteAddress) & std_logic_vector(memoryWriteOutgoingData) & std_logic_vector(memoryWriteDWORDEnables);
MEM_StatsWriteRequestsFIFO_wr_en <= memoryWriteEnable;

DBG_CurrentState <= std_logic_vector(to_unsigned(StatsCollectorStateType'pos(currentState), 4) );

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when init =>
					InitializeFrameCounters(startFrameTimeCounters, startFrameCounterStats);
					InitializeFrameCounters(endFrameTimeCounters, endFrameCounterStats);
					memoryWriteEnable <= '0';
					currentState <= waitingForCommand;

				when waitingForCommand =>
					if (CMD_PresentSignal = '1') then
						memoryWriteAddress <= unsigned(CMD_WriteFrameStatsAddress);
						currentState <= endFrameCapture;
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
							endFrameCounterStats.ROPCounterCacheHits, startFrameCounterStats.ROPCounterCacheHits,
							endFrameCounterStats.ROPCounterCacheMisses, startFrameCounterStats.ROPCounterCacheMisses,
							endFrameCounterStats.MemReadCounterBytesTransferred, startFrameCounterStats.MemReadCounterBytesTransferred,
							endFrameCounterStats.MemReadCounterNumTransactions, startFrameCounterStats.MemReadCounterNumTransactions);
						currentState <= saveStatsToMem4;
					else
						memoryWriteEnable <= '0';
					end if;

				when saveStatsToMem4 =>
					if (MEM_StatsWriteRequestsFIFO_full = '0') then
						memoryWriteEnable <= '1';
						memoryWriteAddress <= memoryWriteAddress + 32;
						memoryWriteDWORDEnables <= (others => '1');
						memoryWriteOutgoingData <= ComputeWriteStatsData(endFrameCounterStats.MemReadCounterNonScanoutBytesTransferred, startFrameCounterStats.MemReadCounterNonScanoutBytesTransferred,
							endFrameCounterStats.MemReadCounterNonScanoutNumTransactions, startFrameCounterStats.MemReadCounterNonScanoutNumTransactions,
							endFrameCounterStats.MemWriteCounterBytesTransferred, startFrameCounterStats.MemWriteCounterBytesTransferred,
							endFrameCounterStats.MemWriteCounterNumTransactions, startFrameCounterStats.MemWriteCounterNumTransactions,
							constUint0, constUint0,
							constUint0, constUint0,
							constUint0, constUint0,
							constUint0, constUint0);
						CMD_StatsSaveComplete <= '1';
						currentState <= startFrameCapture;
					else
						memoryWriteEnable <= '0';
					end if;
				
				when startFrameCapture =>
					memoryWriteEnable <= '0'; -- Deassert after one clock cycle
					CMD_StatsSaveComplete <= '0'; -- Deassert after one clock cycle
					startFrameTimeCounters <= endFrameTimeCounters;
					startFrameCounterStats <= endFrameCounterStats;
					currentState <= waitingForCommand;

			end case;
		end if;
	end process;

end Behavioral;
