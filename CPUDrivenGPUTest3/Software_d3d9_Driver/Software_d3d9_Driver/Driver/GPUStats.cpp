#include "GPUStats.h"
#include "IBaseGPUDevice.h"
#include <stdio.h>
#include "..\resource.h"

static const UINT WM_USER_DLG_INIT_MSG = WM_USER + 0x3E9E;

GPUStats::GPUStats()
{
	memset(&uStats, 0, sizeof(uStats) );
	memset(&downloadedEventTimestamps, 0, sizeof(downloadedEventTimestamps) );
	memset(&downloadedEventOrders, 0, sizeof(downloadedEventOrders) );
}

GPUStats::~GPUStats()
{
	if (GPUStatsDialog != NULL)
	{
		CloseWindow(GPUStatsDialog);
		DestroyWindow(GPUStatsDialog);
	}
}

void GPUStats::InitStatsBuffer()
{
	if (GPUStatsBuffer != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Don't call this function more than once or it'll clobber its own memory allocation!
#endif
		return;
	}

	GPUStatsBuffer = GPUAlloc(sizeof(CyclesCount) * endFrameStatsResponse::TotalAllStatsCount, endFrameStatsResponse::TotalAllStatsCount, 0, 0, 0, GPUVAT_StatsMemory, gpuFormat::GPUFMT_StatsBuffer, this
#ifdef _DEBUG
		, "StatsBuffer"
#endif
	);
}

void GPUStats::InitEventsBuffers()
{
	if (GPUEventTimestampsBuffer != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Don't call this function more than once or it'll clobber its own memory allocation!
#endif
		return;
	}

	GPUEventTimestampsBuffer = GPUAlloc(sizeof(EventTimestamp) * NUM_GPU_EVENT_SYSTEMS_TRACKED * MAX_NUM_EVENTS_PER_FRAME + 32 * 2, MAX_NUM_EVENTS_PER_FRAME, 0, 0, 0, GPUVAT_StatsMemory, gpuFormat::GPUFMT_EventTimestampsBuffer, this
#ifdef _DEBUG
		, "EventTimestamps"
#endif
	);

	if (GPUEventOrdersBuffer != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Don't call this function more than once or it'll clobber its own memory allocation!
#endif
		return;
	}

	GPUEventOrdersBuffer = GPUAlloc(sizeof(USHORT) * NUM_GPU_EVENT_SYSTEMS_TRACKED * MAX_NUM_EVENTS_PER_FRAME + 32 * 2, MAX_NUM_EVENTS_PER_FRAME, 0, 0, 0, GPUVAT_StatsMemory, gpuFormat::GPUFMT_EventOrderBuffer, this
#ifdef _DEBUG
		, "EventsOrder"
#endif
	);
}

gpuvoid* const GPUStats::GetStatsBuffer() const
{
#ifdef _DEBUG
	if (GPUStatsBuffer == NULL)
	{
		__debugbreak(); // Error: Must call InitStatsBuffer() to create the buffer before getting it!
	}
#endif
	return GPUStatsBuffer;
}

gpuvoid* const GPUStats::GetEventTimestampsBuffer() const
{
#ifdef _DEBUG
	if (GPUEventTimestampsBuffer == NULL)
	{
		__debugbreak(); // Error: Must call InitEventsBuffers() to create the buffer before getting it!
	}
#endif
	return GPUEventTimestampsBuffer;
}

gpuvoid* const GPUStats::GetEventsOrderBuffer() const
{
#ifdef _DEBUG
	if (GPUEventOrdersBuffer == NULL)
	{
		__debugbreak(); // Error: Must call InitEventsBuffers() to create the buffer before getting it!
	}
#endif
	return GPUEventOrdersBuffer;
}

HRESULT GPUStats::DownloadEndOfFrameStats(IBaseGPUDevice* const deviceBase)
{
	if (!deviceBase)
	{
#ifdef _DEBUG
		__debugbreak(); // Uhhh, don't call this function with a NULL device pointer!
#endif
		return E_INVALIDARG;
	}

	return deviceBase->DeviceDownloadEndOfFrameStats(GetStatsBuffer(), uStats.rawCPUStatsBuffer);
}

HRESULT GPUStats::CollectEventDataThisFrame()
{
	if (!armCollectEventDataNextFrame)
	{
#ifdef _DEBUG
		__debugbreak(); // We're already armed to record next frame's events!
#endif
		return E_INVALIDARG;
	}

	if (isCollectingEventDataThisFrame)
	{
#ifdef _DEBUG
		__debugbreak(); // We're already collecting event data on this current frame!
#endif
		return E_INVALIDARG;
	}

	armCollectEventDataNextFrame = false;
	isCollectingEventDataThisFrame = true;
	return S_OK;
}

HRESULT GPUStats::ArmCollectEventDataNextFrame()
{
	if (armCollectEventDataNextFrame)
	{
#ifdef _DEBUG
		__debugbreak(); // We're already armed to record next frame's events!
#endif
		return E_INVALIDARG;
	}

	armCollectEventDataNextFrame = true;
	return S_OK;
}

static inline const unsigned RoundUpToNextMultipleOf8(const unsigned x)
{
	return ( (x + 7) / 8) * 8;
}

void GPUStats::ProcessDrawEventsData()
{
	// Erase the last frame's processed draw data:
	ProcessedDrawEventData.clear();

	unsigned numDrawEvents = 0;
	const unsigned numDrawStats = (const unsigned)flippedRecordedDrawEvents.size();
	for (unsigned x = 0; x < numDrawStats; ++x)
	{
		switch (flippedRecordedDrawEvents[x].DrawType)
		{
		default:
#ifdef _DEBUG
			__debugbreak(); // Should never be here!
#endif
		case RecordedDrawCallStat::DT_Clear: // Clear events don't get tracked by the hardware, so skip them when counting draw events
			break;
		case RecordedDrawCallStat::DT_DrawPrimitive:
		case RecordedDrawCallStat::DT_DrawIndexedPrimitive:
			++numDrawEvents;
			break;
		}
	}

	const unsigned writeBlockCount = RoundUpToNextMultipleOf8(numDrawEvents) / 8 * NUM_GPU_EVENT_SYSTEMS_TRACKED;

	std::vector<EventTimestamp> RawTimestampsPerSystem[NUM_GPU_EVENT_SYSTEMS_TRACKED];
	for (unsigned x = 0; x < NUM_GPU_EVENT_SYSTEMS_TRACKED; ++x)
	{
		RawTimestampsPerSystem[x].reserve(writeBlockCount * 8);
	}

	std::vector<ProcessedEventData::TimestampRange> ParsedTimestamps[NUM_GPU_EVENT_SYSTEMS_TRACKED];
	std::vector<ProcessedEventData::EventStatSystems> SystemBlockTypes;
	SystemBlockTypes.reserve(numDrawEvents * NUM_GPU_EVENT_SYSTEMS_TRACKED);

	for (unsigned x = 0; x < writeBlockCount * 8; ++x)
	{
		const ProcessedEventData::EventStatSystems thisWriteBlockSystem = (const ProcessedEventData::EventStatSystems)( (downloadedEventOrders[x / 4] >> ( (3 - (x % 4) ) * 4) ) & 0xF);
		SystemBlockTypes.push_back(thisWriteBlockSystem);
	}

	for (unsigned x = 0; x < writeBlockCount; ++x)
	{
		const EventTimestamp* writeBlock = downloadedEventTimestamps + (x * 8);
		const ProcessedEventData::EventStatSystems thisWriteBlockType = SystemBlockTypes[x];
		if (thisWriteBlockType < ProcessedEventData::MAX_EVENT_STAT_SYSTEMS) // Skip any padding blocks
		{
			for (unsigned y = 0; y < 8; ++y)
			{
				const EventTimestamp thisTimestamp = writeBlock[y];
				if (thisTimestamp != 0x00000000)
				{
					RawTimestampsPerSystem[thisWriteBlockType].push_back(thisTimestamp);
				}
			}
		}
	}

	// All other frame events should be keyed relative to this one!
	const EventTimestamp FrameOriginTimestamp = downloadedEventDataHeader.FrameStartTimestamp;
	const EventTimestamp FrameEndTimestamp = downloadedEventDataHeader.FrameEndTimestamp;

	// Go through and make all frame timestamps relative to the frame origin timestamp:
	for (unsigned x = 0; x < NUM_GPU_EVENT_SYSTEMS_TRACKED; ++x)
	{
		std::vector<EventTimestamp>& currentSystemTimestamps = RawTimestampsPerSystem[x];
		const unsigned numTimestamps = (const unsigned)currentSystemTimestamps.size();
		for (unsigned y = 0; y < numTimestamps; ++y)
		{
			EventTimestamp& thisTimestamp = currentSystemTimestamps[y];
			thisTimestamp -= FrameOriginTimestamp;
		}
	}

	EventTimestamp PerSystemLastTimestamp[NUM_GPU_EVENT_SYSTEMS_TRACKED] = {0};
	for (unsigned x = 0; x < NUM_GPU_EVENT_SYSTEMS_TRACKED; ++x)
	{
		if (!RawTimestampsPerSystem[x].empty() )
		{
			PerSystemLastTimestamp[x] = RawTimestampsPerSystem[x][0];
		}
	}

	unsigned currentHardwareDrawEventIndex = 0;
	for (unsigned x = 0; x < numDrawStats; ++x)
	{
		switch (flippedRecordedDrawEvents[x].DrawType)
		{
		default:
#ifdef _DEBUG
			__debugbreak(); // Should never be here!
#endif
		case RecordedDrawCallStat::DT_Clear: // Clear events don't get tracked by the hardware, so skip them when counting draw events
			break;
		case RecordedDrawCallStat::DT_DrawPrimitive:
		case RecordedDrawCallStat::DT_DrawIndexedPrimitive:
		{
			ProcessedEventData newProcessedEvent;
			newProcessedEvent.DrawPtr = &(flippedRecordedDrawEvents[x]);
			newProcessedEvent.DrawEventIndex = currentHardwareDrawEventIndex + 1; // The hardware always starts with DrawID 1
			for (unsigned y = 0; y < NUM_GPU_EVENT_SYSTEMS_TRACKED; ++y)
			{
				newProcessedEvent.EventTimestamps[y].BeginTimestamp = PerSystemLastTimestamp[y];
				newProcessedEvent.EventTimestamps[y].EndTimestamp = RawTimestampsPerSystem[y][currentHardwareDrawEventIndex + 1];
				PerSystemLastTimestamp[y] = newProcessedEvent.EventTimestamps[y].EndTimestamp;
			}
			ProcessedDrawEventData.push_back(newProcessedEvent);
		}
			++currentHardwareDrawEventIndex;
			break;
		}
	}

	// Print out the column headers:
	printf("System, DrawEventIndex, BeginTimestamp, EndTimestamp, PrimCount\n");

	const unsigned numDrawEventsToPrint = (const unsigned)ProcessedDrawEventData.size();
	for (unsigned x = 0; x < numDrawEventsToPrint; ++x)
	{
		const ProcessedEventData& thisEvent = ProcessedDrawEventData[x];

		printf("VBB, %u, %u, %u, %u\n", thisEvent.DrawEventIndex, thisEvent.EventTimestamps[ProcessedEventData::ESS_VertexBatchBuilder].BeginTimestamp, thisEvent.EventTimestamps[ProcessedEventData::ESS_VertexBatchBuilder].EndTimestamp, thisEvent.DrawPtr->DrawCallStatUnion.DrawData.PrimCount);
		printf("VS, %u, %u, %u, %u\n", thisEvent.DrawEventIndex, thisEvent.EventTimestamps[ProcessedEventData::ESS_VertexShader].BeginTimestamp, thisEvent.EventTimestamps[ProcessedEventData::ESS_VertexShader].EndTimestamp, thisEvent.DrawPtr->DrawCallStatUnion.DrawData.PrimCount);
		printf("IA, %u, %u, %u, %u\n", thisEvent.DrawEventIndex, thisEvent.EventTimestamps[ProcessedEventData::ESS_InputAssembler].BeginTimestamp, thisEvent.EventTimestamps[ProcessedEventData::ESS_InputAssembler].EndTimestamp, thisEvent.DrawPtr->DrawCallStatUnion.DrawData.PrimCount);
		printf("CLIP, %u, %u, %u, %u\n", thisEvent.DrawEventIndex, thisEvent.EventTimestamps[ProcessedEventData::ESS_ClipUnit].BeginTimestamp, thisEvent.EventTimestamps[ProcessedEventData::ESS_ClipUnit].EndTimestamp, thisEvent.DrawPtr->DrawCallStatUnion.DrawData.PrimCount);
		printf("TRISETUP, %u, %u, %u, %u\n", thisEvent.DrawEventIndex, thisEvent.EventTimestamps[ProcessedEventData::ESS_TriangleSetup].BeginTimestamp, thisEvent.EventTimestamps[ProcessedEventData::ESS_TriangleSetup].EndTimestamp, thisEvent.DrawPtr->DrawCallStatUnion.DrawData.PrimCount);
		printf("RAST, %u, %u, %u, %u\n", thisEvent.DrawEventIndex, thisEvent.EventTimestamps[ProcessedEventData::ESS_Rasterizer].BeginTimestamp, thisEvent.EventTimestamps[ProcessedEventData::ESS_Rasterizer].EndTimestamp, thisEvent.DrawPtr->DrawCallStatUnion.DrawData.PrimCount);
		printf("DINTERP, %u, %u, %u, %u\n", thisEvent.DrawEventIndex, thisEvent.EventTimestamps[ProcessedEventData::ESS_DepthInterpolator].BeginTimestamp, thisEvent.EventTimestamps[ProcessedEventData::ESS_DepthInterpolator].EndTimestamp, thisEvent.DrawPtr->DrawCallStatUnion.DrawData.PrimCount);
		printf("INTERP, %u, %u, %u, %u\n", thisEvent.DrawEventIndex, thisEvent.EventTimestamps[ProcessedEventData::ESS_AttributeInterpolator].BeginTimestamp, thisEvent.EventTimestamps[ProcessedEventData::ESS_AttributeInterpolator].EndTimestamp, thisEvent.DrawPtr->DrawCallStatUnion.DrawData.PrimCount);
		printf("TEXSAMP, %u, %u, %u, %u\n", thisEvent.DrawEventIndex, thisEvent.EventTimestamps[ProcessedEventData::ESS_TextureSampler].BeginTimestamp, thisEvent.EventTimestamps[ProcessedEventData::ESS_TextureSampler].EndTimestamp, thisEvent.DrawPtr->DrawCallStatUnion.DrawData.PrimCount);
		printf("ROP, %u, %u, %u, %u\n", thisEvent.DrawEventIndex, thisEvent.EventTimestamps[ProcessedEventData::ESS_ROP].BeginTimestamp, thisEvent.EventTimestamps[ProcessedEventData::ESS_ROP].EndTimestamp, thisEvent.DrawPtr->DrawCallStatUnion.DrawData.PrimCount);
	}
}

void GPUStats::FlipRecordedDrawEventsToStats(std::vector<RecordedDrawCallStat>& deviceRecordedDrawEvents)
{
	flippedRecordedDrawEvents.clear();
	deviceRecordedDrawEvents.swap(flippedRecordedDrawEvents);
}

HRESULT GPUStats::FinishDownloadingEndOfFrameEvents(IBaseGPUDevice* const deviceBase)
{
	if (!deviceBase)
	{
#ifdef _DEBUG
		__debugbreak(); // Uhhh, don't call this function with a NULL device pointer!
#endif
		return E_INVALIDARG;
	}

	if (armCollectEventDataNextFrame)
	{
#ifdef _DEBUG
		__debugbreak(); // Need to run the frame with event data collection enabled first!
#endif
		return E_INVALIDARG;
	}

	if (!isCollectingEventDataThisFrame)
	{
#ifdef _DEBUG
		__debugbreak(); // Can't download any event data if we haven't recorded any yet!
#endif
		return E_INVALIDARG;
	}

	memset(&downloadedEventTimestamps, 0, sizeof(downloadedEventTimestamps) );
	memset(&downloadedEventOrders, 0, sizeof(downloadedEventOrders) );

	const HRESULT ret = deviceBase->DeviceEndFrameAndFinishEventRecording(GetEventTimestampsBuffer(), GetEventsOrderBuffer(), downloadedEventTimestamps, downloadedEventOrders, &downloadedEventDataHeader.FrameStartTimestamp);

	isCollectingEventDataThisFrame = false;

	return ret;
}

bool GPUStats::IsArmedForEventCollectionNextFrame() const
{
	return armCollectEventDataNextFrame;
}

bool GPUStats::IsCollectingEventDataThisFrame() const
{
	return isCollectingEventDataThisFrame;
}

static INT_PTR CALLBACK GPUStatsDialogProc(_In_ HWND hWnd, _In_ UINT MSG, _In_ WPARAM wParam, _In_ LPARAM lParam)
{
	GPUStats* const gpuStats = (GPUStats* const)GetWindowLongPtrA(hWnd, DWLP_USER);
	switch (MSG)
	{
	case WM_INITDIALOG:
		return TRUE;
	case WM_USER_DLG_INIT_MSG:
		if (gpuStats != NULL)
		{
			if (gpuStats->displayTimesAsPercentages)
				CheckRadioButton(hWnd, IDC_RDB_SHOWPERCENT, IDC_RDB_SHOWCYCLE, IDC_RDB_SHOWPERCENT);
			else
				CheckRadioButton(hWnd, IDC_RDB_SHOWPERCENT, IDC_RDB_SHOWCYCLE, IDC_RDB_SHOWCYCLE);
		}
		return TRUE;
	case WM_CLOSE:
		DestroyWindow(hWnd);
		if (gpuStats != NULL)
		{
			gpuStats->GPUStatsDialog = NULL;
		}
		return TRUE;
	case WM_COMMAND:
		if (gpuStats != NULL)
		{
			switch (LOWORD(wParam) )
			{
			case IDC_RDB_SHOWPERCENT:
				gpuStats->displayTimesAsPercentages = true;
				CheckRadioButton(hWnd, IDC_RDB_SHOWPERCENT, IDC_RDB_SHOWCYCLE, IDC_RDB_SHOWPERCENT);
				gpuStats->UpdateDialogStats();
				return TRUE;
			case IDC_RDB_SHOWCYCLE:
				gpuStats->displayTimesAsPercentages = false;
				CheckRadioButton(hWnd, IDC_RDB_SHOWPERCENT, IDC_RDB_SHOWCYCLE, IDC_RDB_SHOWCYCLE);
				gpuStats->UpdateDialogStats();
				return TRUE;
			}
		}
	}
	return FALSE;
}

void GPUStats::CreateStatsDialog(HWND parentWindow)
{
	if (GPUStatsDialog != NULL) // Only create the window once
		return;

	HMODULE currentDLLModule = NULL;
	GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, "String in module", &currentDLLModule);
	if (!currentDLLModule)
	{
		__debugbreak();
	}
	GPUStatsDialog = CreateDialogA(currentDLLModule, MAKEINTRESOURCEA(IDD_DLG_GPUSTATS), parentWindow, &GPUStatsDialogProc);
	if (GPUStatsDialog)
	{
		SetWindowLongPtrA(GPUStatsDialog, DWLP_USER, (const LONG_PTR)this);
		ShowWindow(GPUStatsDialog, SW_SHOW);
		UpdateWindow(GPUStatsDialog);
		SendMessageA(GPUStatsDialog, WM_USER_DLG_INIT_MSG, NULL, NULL);
	}
}

void GPUStats::PrintTimeStat(const int dlgItemID, const float percentTime, const unsigned cycles) const
{
	char statBuffer[256] = {0};

#pragma warning(push)
#pragma warning(disable:4996)
	if (displayTimesAsPercentages)
		sprintf(statBuffer, "%08.5f%%", percentTime * 100.0f);
	else
		sprintf(statBuffer, "%09u", cycles);
#pragma warning(pop)

	SetDlgItemTextA(GPUStatsDialog, dlgItemID, statBuffer);
}

void GPUStats::PrintCounterStat(const int dlgItemID, const unsigned count) const
{
	char statBuffer[256] = {0};

#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(statBuffer, "%u", count);
#pragma warning(pop)

	SetDlgItemTextA(GPUStatsDialog, dlgItemID, statBuffer);
}

void GPUStats::UpdateDialogStats()
{
	if (!GPUStatsDialog)
		return;

	const float VBBIdlePercent = uStats.typedFrameStats.VBBTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.VBBTimerStats.GetTotalCycleCount();
	const float VBBOutWaitPercent = uStats.typedFrameStats.VBBTimerStats.cyclesWaitingForOutput / (const float)uStats.typedFrameStats.VBBTimerStats.GetTotalCycleCount();
	const float VBBWorkingPercent = uStats.typedFrameStats.VBBTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.VBBTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_VBB_STAT1, VBBIdlePercent, uStats.typedFrameStats.VBBTimerStats.cyclesIdle);
	PrintTimeStat(IDC_VBB_STAT2, VBBOutWaitPercent, uStats.typedFrameStats.VBBTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_VBB_STAT3, VBBWorkingPercent, uStats.typedFrameStats.VBBTimerStats.cyclesWorking);

	const float VShaderIdlePercent = uStats.typedFrameStats.VShaderTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.VShaderTimerStats.GetTotalCycleCount();
	const float VShaderOutWaitPercent = uStats.typedFrameStats.VShaderTimerStats.cyclesWaitingForOutput / (const float)uStats.typedFrameStats.VShaderTimerStats.GetTotalCycleCount();
	const float VShaderExecShaderCode = uStats.typedFrameStats.VShaderTimerStats.cyclesExecShaderCode / (const float)uStats.typedFrameStats.VShaderTimerStats.GetTotalCycleCount();
	const float VShaderWorkingPercent = uStats.typedFrameStats.VShaderTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.VShaderTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_VS_STAT1, VShaderIdlePercent, uStats.typedFrameStats.VShaderTimerStats.cyclesIdle);
	PrintTimeStat(IDC_VS_STAT2, VShaderOutWaitPercent, uStats.typedFrameStats.VShaderTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_VS_STAT3, VShaderExecShaderCode, uStats.typedFrameStats.VShaderTimerStats.cyclesExecShaderCode);
	PrintTimeStat(IDC_VS_STAT4, VShaderWorkingPercent, uStats.typedFrameStats.VShaderTimerStats.cyclesWorking);

	const float IAIdlePercent = uStats.typedFrameStats.IATimerStats.cyclesIdle / (const float)uStats.typedFrameStats.IATimerStats.GetTotalCycleCount();
	const float IAOutWaitPercent = uStats.typedFrameStats.IATimerStats.cyclesWaitingForOutput / (const float)uStats.typedFrameStats.IATimerStats.GetTotalCycleCount();
	const float IAWaitCachePercent = uStats.typedFrameStats.IATimerStats.cyclesLoadingDataToCache / (const float)uStats.typedFrameStats.IATimerStats.GetTotalCycleCount();
	const float IAWorkingPercent = uStats.typedFrameStats.IATimerStats.cyclesWorking / (const float)uStats.typedFrameStats.IATimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_IA_STAT1, IAIdlePercent, uStats.typedFrameStats.IATimerStats.cyclesIdle);
	PrintTimeStat(IDC_IA_STAT2, IAOutWaitPercent, uStats.typedFrameStats.IATimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_IA_STAT3, IAWaitCachePercent, uStats.typedFrameStats.IATimerStats.cyclesLoadingDataToCache);
	PrintTimeStat(IDC_IA_STAT4, IAWorkingPercent, uStats.typedFrameStats.IATimerStats.cyclesWorking);

	const float ClipUnitIdlePercent = uStats.typedFrameStats.ClipUnitTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.ClipUnitTimerStats.GetTotalCycleCount();
	const float ClipUnitOutWaitPercent = uStats.typedFrameStats.ClipUnitTimerStats.cyclesWaitingForOutput / (const float)uStats.typedFrameStats.ClipUnitTimerStats.GetTotalCycleCount();
	const float ClipUnitWorkingPercent = uStats.typedFrameStats.ClipUnitTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.ClipUnitTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_CLIPUNIT_STAT1, ClipUnitIdlePercent, uStats.typedFrameStats.ClipUnitTimerStats.cyclesIdle);
	PrintTimeStat(IDC_CLIPUNIT_STAT2, ClipUnitOutWaitPercent, uStats.typedFrameStats.ClipUnitTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_CLIPUNIT_STAT3, ClipUnitWorkingPercent, uStats.typedFrameStats.ClipUnitTimerStats.cyclesWorking);

	const float TriSetupIdlePercent = uStats.typedFrameStats.TriSetupTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.TriSetupTimerStats.GetTotalCycleCount();
	const float TriSetupOutWaitPercent = uStats.typedFrameStats.TriSetupTimerStats.cyclesWaitingForOutput / (const float)uStats.typedFrameStats.TriSetupTimerStats.GetTotalCycleCount();
	const float TriSetupWorkingPercent = uStats.typedFrameStats.TriSetupTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.TriSetupTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_TRISETUP_STAT1, TriSetupIdlePercent, uStats.typedFrameStats.TriSetupTimerStats.cyclesIdle);
	PrintTimeStat(IDC_TRISETUP_STAT2, TriSetupOutWaitPercent, uStats.typedFrameStats.TriSetupTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_TRISETUP_STAT3, TriSetupWorkingPercent, uStats.typedFrameStats.TriSetupTimerStats.cyclesWorking);

	const float RastIdlePercent = uStats.typedFrameStats.RasterizerTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.RasterizerTimerStats.GetTotalCycleCount();
	const float RastOutWaitPercent = uStats.typedFrameStats.RasterizerTimerStats.cyclesWaitingForOutput / (const float)uStats.typedFrameStats.RasterizerTimerStats.GetTotalCycleCount();
	const float RastWaitTriWorkCachePercent = uStats.typedFrameStats.RasterizerTimerStats.cyclesWaitingForTriWorkCache / (const float)uStats.typedFrameStats.RasterizerTimerStats.GetTotalCycleCount();
	const float RastWorkingPercent = uStats.typedFrameStats.RasterizerTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.RasterizerTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_RAST_STAT1, RastIdlePercent, uStats.typedFrameStats.RasterizerTimerStats.cyclesIdle);
	PrintTimeStat(IDC_RAST_STAT2, RastOutWaitPercent, uStats.typedFrameStats.RasterizerTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_RAST_STAT3, RastWaitTriWorkCachePercent, uStats.typedFrameStats.RasterizerTimerStats.cyclesWaitingForTriWorkCache);
	PrintTimeStat(IDC_RAST_STAT4, RastWorkingPercent, uStats.typedFrameStats.RasterizerTimerStats.cyclesWorking);

	const float DepthInterpIdlePercent = uStats.typedFrameStats.DepthInterpolatorTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.DepthInterpolatorTimerStats.GetTotalCycleCount();
	const float DepthInterpOutWaitPercent = uStats.typedFrameStats.DepthInterpolatorTimerStats.cyclesWaitingForOutput / (const float)uStats.typedFrameStats.DepthInterpolatorTimerStats.GetTotalCycleCount();
	const float DepthInterpWorkingPercent = uStats.typedFrameStats.DepthInterpolatorTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.DepthInterpolatorTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_DINTERP_STAT1, DepthInterpIdlePercent, uStats.typedFrameStats.DepthInterpolatorTimerStats.cyclesIdle);
	PrintTimeStat(IDC_DINTERP_STAT2, DepthInterpOutWaitPercent, uStats.typedFrameStats.DepthInterpolatorTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_DINTERP_STAT3, DepthInterpWorkingPercent, uStats.typedFrameStats.DepthInterpolatorTimerStats.cyclesWorking);

	const float AttrInterpIdlePercent = uStats.typedFrameStats.AttrInterpolatorTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.AttrInterpolatorTimerStats.GetTotalCycleCount();
	const float AttrInterpOutWaitPercent = uStats.typedFrameStats.AttrInterpolatorTimerStats.cyclesWaitingForOutput / (const float)uStats.typedFrameStats.AttrInterpolatorTimerStats.GetTotalCycleCount();
	const float AttrInterpWorkingPercent = uStats.typedFrameStats.AttrInterpolatorTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.AttrInterpolatorTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_INTERP_STAT1, AttrInterpIdlePercent, uStats.typedFrameStats.AttrInterpolatorTimerStats.cyclesIdle);
	PrintTimeStat(IDC_INTERP_STAT2, AttrInterpOutWaitPercent, uStats.typedFrameStats.AttrInterpolatorTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_INTERP_STAT3, AttrInterpWorkingPercent, uStats.typedFrameStats.AttrInterpolatorTimerStats.cyclesWorking);

	const float TexSampIdlePercent = uStats.typedFrameStats.TexSamplerTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.TexSamplerTimerStats.GetTotalCycleCount();
	const float TexSampOutWaitPercent = uStats.typedFrameStats.TexSamplerTimerStats.cyclesWaitingForOutput / (const float)uStats.typedFrameStats.TexSamplerTimerStats.GetTotalCycleCount();
	const float TexSampWaitCachePercent = uStats.typedFrameStats.TexSamplerTimerStats.cyclesLoadingTexCache / (const float)uStats.typedFrameStats.TexSamplerTimerStats.GetTotalCycleCount();
	const float TexSampWorkingPercent = uStats.typedFrameStats.TexSamplerTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.TexSamplerTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_TEXSAMP_STAT1, TexSampIdlePercent, uStats.typedFrameStats.TexSamplerTimerStats.cyclesIdle);
	PrintTimeStat(IDC_TEXSAMP_STAT2, TexSampOutWaitPercent, uStats.typedFrameStats.TexSamplerTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_TEXSAMP_STAT3, TexSampWaitCachePercent, uStats.typedFrameStats.TexSamplerTimerStats.cyclesLoadingTexCache);
	PrintTimeStat(IDC_TEXSAMP_STAT4, TexSampWorkingPercent, uStats.typedFrameStats.TexSamplerTimerStats.cyclesWorking);

	const float ROPIdlePercent = uStats.typedFrameStats.ROPTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.ROPTimerStats.GetTotalCycleCount();
	const float ROPOutWaitPercent = uStats.typedFrameStats.ROPTimerStats.cyclesWaitingForOutput / (const float)uStats.typedFrameStats.ROPTimerStats.GetTotalCycleCount();
	const float ROPWaitMemReadPercent = uStats.typedFrameStats.ROPTimerStats.cyclesWaitingForMemoryRead / (const float)uStats.typedFrameStats.ROPTimerStats.GetTotalCycleCount();
	const float ROPWorkingPercent = uStats.typedFrameStats.ROPTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.ROPTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_ROP_STAT1, ROPIdlePercent, uStats.typedFrameStats.ROPTimerStats.cyclesIdle);
	PrintTimeStat(IDC_ROP_STAT2, ROPOutWaitPercent, uStats.typedFrameStats.ROPTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_ROP_STAT3, ROPWaitMemReadPercent, uStats.typedFrameStats.ROPTimerStats.cyclesWaitingForMemoryRead);
	PrintTimeStat(IDC_ROP_STAT4, ROPWorkingPercent, uStats.typedFrameStats.ROPTimerStats.cyclesWorking);

	const float CmdIdlePercent = uStats.typedFrameStats.CommandProcessorTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.CommandProcessorTimerStats.GetTotalCycleCount();
	const float CmdWorkingPercent = uStats.typedFrameStats.CommandProcessorTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.CommandProcessorTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_CMD_STAT1, CmdIdlePercent, uStats.typedFrameStats.CommandProcessorTimerStats.cyclesIdle);
	PrintTimeStat(IDC_CMD_STAT2, CmdWorkingPercent, uStats.typedFrameStats.CommandProcessorTimerStats.cyclesWorking);

	const float MemReadIdlePercent = uStats.typedFrameStats.MemControllerReadTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.MemControllerReadTimerStats.GetTotalCycleCount();
	const float MemRedWorkingPercent = uStats.typedFrameStats.MemControllerReadTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.MemControllerReadTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_MEMREAD_STAT1, MemReadIdlePercent, uStats.typedFrameStats.MemControllerReadTimerStats.cyclesIdle);
	PrintTimeStat(IDC_MEMREAD_STAT2, MemRedWorkingPercent, uStats.typedFrameStats.MemControllerReadTimerStats.cyclesWorking);

	const float MemWriteIdlePercent = uStats.typedFrameStats.MemControllerWriteTimerStats.cyclesIdle / (const float)uStats.typedFrameStats.MemControllerWriteTimerStats.GetTotalCycleCount();
	const float MemWriteWorkingPercent = uStats.typedFrameStats.MemControllerWriteTimerStats.cyclesWorking / (const float)uStats.typedFrameStats.MemControllerWriteTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_MEMWRITE_STAT1, MemWriteIdlePercent, uStats.typedFrameStats.MemControllerWriteTimerStats.cyclesIdle);
	PrintTimeStat(IDC_MEMWRITE_STAT2, MemWriteWorkingPercent, uStats.typedFrameStats.MemControllerWriteTimerStats.cyclesWorking);

	PrintCounterStat(IDC_ROPCACHE_COUNT1, uStats.typedFrameStats.ROPCacheCounterStats.ROPCounterCacheHits);
	PrintCounterStat(IDC_ROPCACHE_COUNT2, uStats.typedFrameStats.ROPCacheCounterStats.ROPCounterCacheMisses);

	PrintCounterStat(IDC_MEMREAD_COUNT1, uStats.typedFrameStats.ReadMemCounterStats.BytesTransferred);
	PrintCounterStat(IDC_MEMREAD_COUNT2, uStats.typedFrameStats.ReadMemCounterStats.NumTransactions);
	PrintCounterStat(IDC_MEMREAD_COUNT3, uStats.typedFrameStats.ReadMemCounterStats.BytesTransferredNonScanout);
	PrintCounterStat(IDC_MEMREAD_COUNT4, uStats.typedFrameStats.ReadMemCounterStats.NumTransactionsNonScanout);

	PrintCounterStat(IDC_MEMWRITE_COUNT1, uStats.typedFrameStats.WriteMemCounterStats.BytesTransferred);
	PrintCounterStat(IDC_MEMWRITE_COUNT2, uStats.typedFrameStats.WriteMemCounterStats.NumTransactions);
}

void GPUStats::UpdateDialog()
{
	if (!GPUStatsDialog)
		return;

	// Send our new data over to the controls
	UpdateDialogStats();

	// Pump the window message loop:
	MSG msg = {0};
	while (PeekMessageA(&msg, GPUStatsDialog, 0, 0, PM_REMOVE) )
	{
		// Dispatch message to dialog box window if it's a dialogue message
		IsDialogMessageA(GPUStatsDialog, &msg);
	}
}

/*void GPUStats::PrintStatsToStdout() const
{
	// Man this is way too slow, time to upgrade to win32 controls...
	printf("Time breakdown:\n");
	printf("\tIA: Idle: %f%%; OutWait: %f%%; CacheFill: %f%%; Work: %f%% (%u)\n", IAIdlePercent * 100.0f, IAOutWaitPercent * 100.0f, IAWaitCachePercent * 100.0f, IAWorkingPercent * 100.0f, uStats.typedFrameStats.IATimerStats.GetTotalCycleCount() );
	printf("\tTriSetup: Idle: %f%%; OutWait: %f%%; Work: %f%% (%u)\n", TriSetupIdlePercent * 100.0f, TriSetupOutWaitPercent * 100.0f, TriSetupWorkingPercent * 100.0f, uStats.typedFrameStats.TriSetupTimerStats.GetTotalCycleCount() );
	printf("\tRast: Idle: %f%%; OutWait: %f%%; TriWorkWait: %f%%; Work: %f%% (%u)\n", RastIdlePercent * 100.0f, RastOutWaitPercent * 100.0f, RastWaitTriWorkCachePercent * 100.0f, RastWorkingPercent * 100.0f, uStats.typedFrameStats.RasterizerTimerStats.GetTotalCycleCount() );
	printf("\tInterp: Idle: %f%%; OutWait: %f%%; Work: %f%% (%u)\n", InterpIdlePercent * 100.0f, InterpOutWaitPercent * 100.0f, InterpWorkingPercent * 100.0f, uStats.typedFrameStats.AttrInterpolatorTimerStats.GetTotalCycleCount() );
	printf("\tTexSamp: Idle: %f%%; OutWait: %f%%; CacheFill: %f%%; Work: %f%% (%u)\n", TexSampIdlePercent * 100.0f, TexSampOutWaitPercent * 100.0f, TexSampWaitCachePercent * 100.0f, TexSampWorkingPercent * 100.0f, uStats.typedFrameStats.TexSamplerTimerStats.GetTotalCycleCount() );
	printf("\tROP: Idle: %f%%; MemWrite: %f%%; MemRead: %f%%; Work: %f%% (%u)\n", ROPIdlePercent * 100.0f, ROPOutWaitPercent * 100.0f, ROPWaitMemReadPercent * 100.0f, ROPWorkingPercent * 100.0f, uStats.typedFrameStats.ROPTimerStats.GetTotalCycleCount() );
	printf("\tROP Cache Hits\\Frame: %u; ROP Cache Misses\\Frame: %u\n", uStats.typedFrameStats.ROPCacheCounterStats.ROPCounterCacheHits, uStats.typedFrameStats.ROPCacheCounterStats.ROPCounterCacheMisses); 
	printf("\tCMD: Idle: %f%%; Work: %f%% (%u)\n", CmdIdlePercent * 100.0f, CmdWorkingPercent * 100.0f, uStats.typedFrameStats.CommandProcessorTimerStats.GetTotalCycleCount() );
	printf("\tMemReadControl: Idle: %f%%; Work: %f%% (%u)\n", MemReadIdlePercent * 100.0f, MemRedWorkingPercent * 100.0f, uStats.typedFrameStats.MemControllerReadTimerStats.GetTotalCycleCount() );
	printf("\tMemReadBytes\\Frame: %u; MemReadTransactions\\Frame: %u\n", uStats.typedFrameStats.ReadMemCounterStats.BytesTransferred, uStats.typedFrameStats.ReadMemCounterStats.NumTransactions);
	printf("\tMemWriteControl: Idle: %f%%; Work: %f%% (%u)\n", MemWriteIdlePercent * 100.0f, MemWriteWorkingPercent * 100.0f, uStats.typedFrameStats.MemControllerWriteTimerStats.GetTotalCycleCount() );
	printf("\tMemWriteBytes\\Frame: %u; MemWriteTransactions\\Frame: %u\n", uStats.typedFrameStats.WriteMemCounterStats.BytesTransferred, uStats.typedFrameStats.WriteMemCounterStats.NumTransactions);
	printf("\n\n");
}*/
