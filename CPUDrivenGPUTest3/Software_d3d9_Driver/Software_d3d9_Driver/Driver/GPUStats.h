#pragma once

#include "GPUAllocator.h"
#include "IBaseDeviceComms.h"
#include "PacketDefs.h"
#include "..\d3d9include.h"
#include "..\DebuggableEnums.h"
#include <vector>

struct IBaseGPUDevice;
typedef DWORD EventTimestamp;
typedef DWORD CyclesCount;
static const UINT NUM_GPU_EVENT_SYSTEMS_TRACKED = 10u;
static const UINT MAX_NUM_EVENTS_PER_FRAME = 1024u;

// Stores driver-side info about each draw/clear call in a frame in which we are recording events:
struct RecordedDrawCallStat
{
	enum _DrawType : unsigned char
	{
		DT_Clear = 0u,
		DT_DrawPrimitive,
		DT_DrawIndexedPrimitive,
		DT_VertexShaderLoad,
		DT_TextureLoad,
		DT_DirtyBufferUpload
	} DrawType;

	// The CPU timestamp of when the program called DrawPrimitive()/DrawIndexedPrimitive()/Clear().
	// This is used for tracking the latency between CPU and GPU timelines, as well as tracking app CPU time inbetween Draw() calls.
	LARGE_INTEGER drawCallCPUTimestamp;

	// The GPU timestamp read back from the timestamp query that is executed just after the Draw()/Clear() call is issued:
	LARGE_INTEGER drawCallFinishGPUTimestamp;

	union
	{
		struct
		{
			BYTE primType;
			bool isDrawUP;
			UINT PrimCount;
			debuggableFVF CurrentFVF;
			INT BaseVertexIndex;
			UINT MinVertexIndex;
			UINT NumVertices;
			UINT StartIndex;
			D3DFORMAT IndexFormat;
			UINT VertexWavesCount;
			UINT ActiveLanesCount;
			UINT InactiveLanesCount;
		} DrawData;

		struct
		{
			DWORD ClearFlags;
			D3DCOLOR ClearColor;
			float ClearDepth;
			BYTE ClearStencil;
			UINT BytesCleared;
		} ClearData;

		struct
		{
			const gpuvoid* ShaderAddress;
			USHORT ShaderLengthBytes;
			USHORT ShaderLoadOffset;
		} VertexShaderLoadData;

		struct
		{
			const gpuvoid* TextureAddress;
			UINT TextureLoadLengthBytes;
			UINT TextureLoadNumMemReadTransactions;
			D3DFORMAT TextureFormat;
			USHORT TextureWidth;
			USHORT TextureHeight;
			BYTE TextureNumMips;
		} TextureLoadData;

		struct
		{
			const gpuvoid* BufferBaseAddress;
			UINT NumDirtyBytesUploaded;
			union
			{
				debuggableFVF VertexBufferFVF;
				D3DFORMAT IndexBufferFormat;
				D3DFORMAT TextureFormat;
			} UploadFormat;
			enum _UploadType : unsigned char
			{
				VertexBuffer = 0,
				IndexBuffer = 1,
				Texture = 2,
				ConstantBuffer = 3
			} UploadType;
		} DirtyBufferUploadData;
	} DrawCallStatUnion;
};

struct GPUFrameStats
{
	struct BaseTimerStats
	{
		CyclesCount cyclesIdle;
		CyclesCount cyclesWorking;

		const CyclesCount GetTotalCycleCount() const
		{
			return cyclesIdle + cyclesWorking;
		}
	};

	struct StreamThroughTimerStats : BaseTimerStats
	{
		CyclesCount cyclesWaitingForOutput;

		const CyclesCount GetTotalCycleCount() const
		{
			return BaseTimerStats::GetTotalCycleCount() + cyclesWaitingForOutput;
		}
	};

	struct _IATimerStats : StreamThroughTimerStats
	{
		CyclesCount cyclesLoadingDataToCache;

		const CyclesCount GetTotalCycleCount() const
		{
			return StreamThroughTimerStats::GetTotalCycleCount() + cyclesLoadingDataToCache;
		}
	} IATimerStats;

	struct _TriSetupTimerStats : StreamThroughTimerStats
	{
	} TriSetupTimerStats;

	struct _RasterizerTimerStats : StreamThroughTimerStats
	{
		CyclesCount cyclesWaitingForTriWorkCache;

		const CyclesCount GetTotalCycleCount() const
		{
			return StreamThroughTimerStats::GetTotalCycleCount() + cyclesWaitingForTriWorkCache;
		}
	} RasterizerTimerStats;

	struct _AttrInterpolatorTimerStats : StreamThroughTimerStats
	{
	} AttrInterpolatorTimerStats;

	struct _TexSamplerTimerStats : StreamThroughTimerStats
	{
		CyclesCount cyclesLoadingTexCache;

		const CyclesCount GetTotalCycleCount() const
		{
			return StreamThroughTimerStats::GetTotalCycleCount() + cyclesLoadingTexCache;
		}
	} TexSamplerTimerStats;

	struct _ROPTimerStats : StreamThroughTimerStats
	{
		CyclesCount cyclesWaitingForMemoryRead;

		const CyclesCount GetTotalCycleCount() const
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
		CyclesCount cyclesExecShaderCode;

		const CyclesCount GetTotalCycleCount() const
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

	struct _ClipUnitTimerStats : StreamThroughTimerStats
	{
	} ClipUnitTimerStats;

	DWORD zeroPadding2;

	struct _VBBTimerStats : StreamThroughTimerStats
	{
	} VBBTimerStats;
};
static_assert(sizeof(GPUFrameStats) == sizeof(CyclesCount) * endFrameStatsResponse::TotalAllStatsCount, "Error: Unexpected struct padding!");

struct EventDataHeaderBlock
{
	EventTimestamp FrameStartTimestamp; // Offset 0
	EventTimestamp FrameEndTimestamp; // Offset 4
	USHORT NumEventDRAMBlocks; // Offset 8
	USHORT unusedPadding0;
	USHORT NumEventOrderingDRAMBlocks; // Offset 12
	USHORT unusedPadding1;
	USHORT TopOfPipeCurrentDrawID; // Offset 16
	USHORT unusedPadding2;
	USHORT BottomOfPipeCurrentDrawID; // Offset 20
	USHORT unusedPadding3;
	DWORD unusedPadding4;
	DWORD unusedPadding5;
};
static_assert(sizeof(EventDataHeaderBlock) == 32, "Error: Unexpected struct padding!");

struct ProcessedEventData
{
	struct TimestampRange
	{
		EventTimestamp BeginTimestamp; // The starting timestamp for this event, relative to the start of the frame (timestamp 0x00000000)
		EventTimestamp EndTimestamp;
	};

	enum EventStatSystems : unsigned char
	{
		ESS_VertexBatchBuilder = 0,
		ESS_VertexShader = 1,
		ESS_InputAssembler = 2,
		ESS_ClipUnit = 3,
		ESS_TriangleSetup = 4,
		ESS_Rasterizer = 5,
		ESS_DepthInterpolator = 6,
		ESS_AttributeInterpolator = 7,
		ESS_TextureSampler = 8,
		ESS_ROP = 9,

		MAX_EVENT_STAT_SYSTEMS // This must always be last
	};

	unsigned DrawEventIndex;
	const RecordedDrawCallStat* DrawPtr;
	TimestampRange EventTimestamps[MAX_EVENT_STAT_SYSTEMS];
};

constexpr const unsigned cVal = sizeof(GPUFrameStats);
static_assert(NUM_GPU_EVENT_SYSTEMS_TRACKED == ProcessedEventData::MAX_EVENT_STAT_SYSTEMS, "Error: Enum mismatch!");

struct GPUStats
{
	GPUStats();
	~GPUStats();

	void CreateStatsDialog(HWND parentWindow);
	void UpdateDialog();
	void UpdateDialogStats();
	void WritePerFrameStats(const unsigned currentFrameID);
	void WriteStatsColumnHeaders();

	void InitStatsBuffer();
	void InitEventsBuffers();
	gpuvoid* const GetStatsBuffer() const;
	gpuvoid* const GetEventTimestampsBuffer() const;
	gpuvoid* const GetEventsOrderBuffer() const;
	HRESULT DownloadEndOfFrameStats(IBaseGPUDevice* const deviceBase);
	HRESULT ArmCollectEventDataNextFrame();
	bool IsArmedForEventCollectionNextFrame() const;
	HRESULT CollectEventDataThisFrame();
	bool IsCollectingEventDataThisFrame() const;
	HRESULT FinishDownloadingEndOfFrameEvents(IBaseGPUDevice* const deviceBase);

	void PrintTimeStat(const int dlgItemID, const float percentTime, const unsigned cycles) const;
	void PrintCounterStat(const int dlgItemID, const unsigned count) const;

	void FlipRecordedDrawEventsToStats(std::vector<RecordedDrawCallStat>& deviceRecordedDrawEvents);
	void ProcessDrawEventsData(const LARGE_INTEGER frameBeginGPUTimestamp, const LARGE_INTEGER frameEndGPUTimestamp, const LARGE_INTEGER frameBeginCPUTimestamp, const LARGE_INTEGER frameEndCPUTimestamp);

	union
	{
		CyclesCount rawCPUStatsBuffer[endFrameStatsResponse::TotalAllStatsCount];
		GPUFrameStats typedFrameStats;
	} uStats;

	EventDataHeaderBlock downloadedEventDataHeader = {0};
	EventTimestamp downloadedEventTimestamps[NUM_GPU_EVENT_SYSTEMS_TRACKED * MAX_NUM_EVENTS_PER_FRAME];
	USHORT downloadedEventOrders[NUM_GPU_EVENT_SYSTEMS_TRACKED * MAX_NUM_EVENTS_PER_FRAME];

	HWND GPUStatsDialog = NULL;
	bool displayTimesAsPercentages = true; // If false, then the times are shown as cycles instead

private:
	gpuvoid* GPUStatsBuffer = NULL;
	gpuvoid* GPUEventTimestampsBuffer = NULL;
	gpuvoid* GPUEventOrdersBuffer = NULL;
	FILE* statsWriteFile = NULL;
	bool armCollectEventDataNextFrame = false;
	bool isCollectingEventDataThisFrame = false;

	std::vector<RecordedDrawCallStat> flippedRecordedDrawEvents;
	std::vector<ProcessedEventData> ProcessedDrawEventData;
};
