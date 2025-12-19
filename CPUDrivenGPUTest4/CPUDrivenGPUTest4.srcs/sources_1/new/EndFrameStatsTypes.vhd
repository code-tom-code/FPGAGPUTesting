library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;

package EndFrameStatsTypes is

	-- Be sure that if the C++ side enum changes to update this here too! Unknown packet types will simply get dropped!
	type eSystemType is
	(
		ST_NULL, -- 0
		ST_IA, -- 1
		ST_TRISETUP, -- 2
		ST_RASTERIZER, -- 3
		ST_ATTRIBUTEINTERPOLATOR, -- 4
		ST_TEXTURESAMPLER, -- 5
		ST_ROP, -- 6
		ST_COMMANDPROCESSOR, -- 7
		ST_MEMORYSYSTEMREAD, -- 8
		ST_MEMORYSYSTEMWRITE, -- 9
		ST_SCANOUT, -- 10

		ST_MAX_SYSTEM_TYPES -- Must always be last
	);

	type eMetricSpace is
	(
		MS_UnknownMetrics, -- 0
		MS_TimeMetrics, -- 1
		MS_CounterStatMetrics, -- 2

		MS_MAX_NUM_METRIC_SPACES -- Must always be last
	);

	type eIATimerStats is
	(
		IACyclesWaitingForDrawCommand, -- 0
		IACyclesSpentWorking, -- 1
		IACyclesLoadingDataToCache, -- 2
		IACyclesWaitingForTriSetup -- 3
	);

	type eTriSetupTimerStats is
	(
		TriSetupCyclesWaitingForIA, -- 0
		TriSetupCyclesSpentWorking, -- 1
		TriSetupCyclesWaitingForRasterizer -- 2
	);

	type eRasterizerTimerStats is
	(
		RasterizerCyclesWaitingForTriSetup, -- 0
		RasterizerCyclesSpentWorking, -- 1
		RasterizerCyclesWaitingForTriWorkCache, -- 2
		RasterizerCyclesWaitingForRastOutputFIFO -- 3
	);

	type eAttrInterpolatorTimerStats is
	(
		AttrInterpCyclesWaitingForRasterizer, -- 0
		AttrInterpCyclesSpentWorking, -- 1
		AttrInterpCyclesWaitingForTexSampler -- 2
	);

	type eTexSamplerTimerStats is
	(
		TexSamplerCyclesWaitingForAttrInterpolator, -- 0
		TexSamplerCyclesSpentWorking, -- 1
		TexSamplerCyclesWaitingForROP, -- 2
		TexSamplerCyclesLoadingDataToCache, -- 3
	);

	type eROPTimerStats is
	(
		ROPCyclesWaitingForTexSampler, -- 0
		ROPCyclesSpentWorking, -- 1
		ROPCyclesWaitingForMemoryRead, -- 2
		ROPCyclesWaitingForMemoryWrite -- 3
	);

	type eCommandProcessorTimerStats is
	(
		CommandProcCyclesWaitingForNewPacket, -- 0
		CommandProcCyclesSpentWorking -- 1
	);

	type eMemControllerReadTimerStats is
	(
		MemControllerReadCyclesWaitingForRequest, -- 0
		MemControllerReadCyclesSpentWorking -- 1
	);

	type eMemControllerWriteTimerStats is
	(
		MemControllerWriteCyclesWaitingForRequest, -- 0
		MemControllerWriteCyclesSpentWorking -- 1
	);

	type eROPCounterStats is
	(
		ROPCounterCacheHits, -- 0
		ROPCounterCacheMisses -- 1
	);

	type eMemCounterStats is
	(
		MemCounterBytesTransferred, -- 0
		MemCounterNumTransactions -- 1
	);

end package EndFrameStatsTypes;
