#pragma once

#include "GPUAllocator.h"
#include "IBaseDeviceComms.h"
#include "PacketDefs.h"
#include <vector>

struct IBaseGPUDevice;

struct GPUFrameStats
{
	struct BaseTimerStats
	{
		DWORD cyclesIdle;
		DWORD cyclesWorking;

		const DWORD GetTotalCycleCount() const
		{
			return cyclesIdle + cyclesWorking;
		}
	};

	struct StreamThroughTimerStats : BaseTimerStats
	{
		DWORD cyclesWaitingForOutput;

		const DWORD GetTotalCycleCount() const
		{
			return BaseTimerStats::GetTotalCycleCount() + cyclesWaitingForOutput;
		}
	};

	struct _IATimerStats : StreamThroughTimerStats
	{
		DWORD cyclesLoadingDataToCache;

		const DWORD GetTotalCycleCount() const
		{
			return StreamThroughTimerStats::GetTotalCycleCount() + cyclesLoadingDataToCache;
		}
	} IATimerStats;

	struct _TriSetupTimerStats : StreamThroughTimerStats
	{
	} TriSetupTimerStats;

	struct _RasterizerTimerStats : StreamThroughTimerStats
	{
		DWORD cyclesWaitingForTriWorkCache;

		const DWORD GetTotalCycleCount() const
		{
			return StreamThroughTimerStats::GetTotalCycleCount() + cyclesWaitingForTriWorkCache;
		}
	} RasterizerTimerStats;

	struct _AttrInterpolatorTimerStats : StreamThroughTimerStats
	{
	} AttrInterpolatorTimerStats;

	struct _TexSamplerTimerStats : StreamThroughTimerStats
	{
		DWORD cyclesLoadingTexCache;

		const DWORD GetTotalCycleCount() const
		{
			return StreamThroughTimerStats::GetTotalCycleCount() + cyclesLoadingTexCache;
		}
	} TexSamplerTimerStats;

	struct _ROPTimerStats : StreamThroughTimerStats
	{
		DWORD cyclesWaitingForMemoryRead;

		const DWORD GetTotalCycleCount() const
		{
			return StreamThroughTimerStats::GetTotalCycleCount() + cyclesWaitingForMemoryRead;
		}
	} ROPTimerStats;

	struct _CommandProcessorTimerStats : BaseTimerStats
	{
	} CommandProcessorTimerStats;

	struct _MemControllerReadTimerStats : BaseTimerStats
	{
	} MemControllerReadTimerStats;

	struct _MemControllerWriteTimerStats : BaseTimerStats
	{
	} MemControllerWriteTimerStats;

	struct _VShaderTimerStats : StreamThroughTimerStats
	{
		DWORD cyclesExecShaderCode;

		const DWORD GetTotalCycleCount() const
		{
			return StreamThroughTimerStats::GetTotalCycleCount() + cyclesExecShaderCode;
		}
	} VShaderTimerStats;

	struct _DepthInterpolatorTimerStats : StreamThroughTimerStats
	{
	} DepthInterpolatorTimerStats;

	DWORD zeroPadding;

	struct _ROPCacheStats
	{
		DWORD ROPCounterCacheHits;
		DWORD ROPCounterCacheMisses;

		const DWORD GetTotalCacheLookups() const
		{
			return ROPCounterCacheHits + ROPCounterCacheMisses;
		}
	} ROPCacheCounterStats;

	struct MemReadCounterStats
	{
		DWORD BytesTransferred;
		DWORD NumTransactions;

		DWORD BytesTransferredNonScanout;
		DWORD NumTransactionsNonScanout;
	};

	struct MemWriteCounterStats
	{
		DWORD BytesTransferred;
		DWORD NumTransactions;
	};

	MemReadCounterStats ReadMemCounterStats;
	MemWriteCounterStats WriteMemCounterStats;
};
static_assert(sizeof(GPUFrameStats) == sizeof(DWORD) * endFrameStatsResponse::TotalAllStatsCount, "Error: Unexpected struct padding!");

constexpr const unsigned cVal = sizeof(GPUFrameStats);

struct GPUStats
{
	GPUStats();
	~GPUStats();

	void CreateStatsDialog(HWND parentWindow);
	void UpdateDialog();
	void UpdateDialogStats();

	void InitStatsBuffer();
	gpuvoid* const GetStatsBuffer() const;
	HRESULT DownloadEndOfFrameStats(IBaseGPUDevice* const deviceBase);

	void PrintTimeStat(const int dlgItemID, const float percentTime, const unsigned cycles) const;
	void PrintCounterStat(const int dlgItemID, const unsigned count) const;

	union
	{
		DWORD rawCPUStatsBuffer[endFrameStatsResponse::TotalAllStatsCount];
		GPUFrameStats typedFrameStats;
	} uStats;

	HWND GPUStatsDialog = NULL;
	bool displayTimesAsPercentages = true; // If false, then the times are shown as cycles instead

private:
	gpuvoid* GPUStatsBuffer = NULL;
};
