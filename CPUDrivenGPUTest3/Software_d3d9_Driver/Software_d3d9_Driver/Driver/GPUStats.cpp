#include "GPUStats.h"
#include "IBaseGPUDevice.h"
#include <stdio.h>
#include "..\resource.h"
#include "DriverOptions.h"

static const UINT WM_USER_DLG_INIT_MSG = WM_USER + 0x3E9E;

GPUStats::GPUStats()
{
	memset(&uStats, 0, sizeof(uStats) );
	memset(&downloadedEventTimestamps, 0, sizeof(downloadedEventTimestamps) );
	memset(&downloadedEventOrders, 0, sizeof(downloadedEventOrders) );

	if (WriteStatsToDisk.Bool() )
	{
#ifdef _DEBUG
		if (!StatsWriteFilename.String() || !*StatsWriteFilename.String() )
		{
			__debugbreak(); // Invalid stats filename!
		}
#endif
#pragma warning(push)
#pragma warning(disable:4996)
		statsWriteFile = fopen(StatsWriteFilename.String(), "wb");
#pragma warning(pop)
#ifdef _DEBUG
		if (!statsWriteFile)
		{
			__debugbreak(); // Error opening stats file for writing!
		}
#endif
		WriteStatsColumnHeaders();
	}
}

GPUStats::~GPUStats()
{
	if (statsWriteFile != NULL)
	{
		fclose(statsWriteFile);
		statsWriteFile = NULL;
	}

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

static const char* const ClearFlagsString[] =
{
	"0", // None (0)
	"TARGET", // TARGET (1)
	"ZBUFFER", // ZBUFFER (2)
	"TARGET | ZBUFFER", // TARGET | ZBUFFER (3)
	"STENCIL", // STENCIL (4)
	"TARGET | STENCIL", // TARGET | STENCIL (5)
	"ZBUFFER | STENCIL", // ZBUFFER | STENCIL (6)
	"TARGET | ZBUFFER | STENCIL", // TARGET | ZBUFFER | STENCIL (7)
};

static const char* const PrimitiveTypeString[] =
{
	"D3DPT_UNKNOWN", // 0
	"D3DPT_POINTLIST", // 1
	"D3DPT_LINELIST", // 2
	"D3DPT_LINESTRIP", // 3
	"D3DPT_TRIANGLELIST", // 4
	"D3DPT_TRIANGLESTRIP", // 5
	"D3DPT_TRIANGLEFAN", // 6
};

void GPUStats::ProcessDrawEventsData(const LARGE_INTEGER frameBeginGPUTimestamp, const LARGE_INTEGER frameEndGPUTimestamp, const LARGE_INTEGER frameBeginCPUTimestamp, const LARGE_INTEGER frameEndCPUTimestamp)
{
	// Erase the last frame's processed draw data:
	ProcessedDrawEventData.clear();

	/*unsigned numDrawEvents = 0;
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
	}*/
#pragma warning(push)
#pragma warning(disable:4996)
	FILE* const f = fopen("DrawEventTimestamps.csv", "wb");
#pragma warning(pop)
	fprintf(f, "EventIndex,DrawType,DrawParams,VertexWavesCount,CPURecordTimestamp,GPUEndTimestamp\n");

	fprintf(f, "0,FRAME_BEGIN,%s,0,%I64u,%I64u\n", "BEGIN", frameBeginCPUTimestamp.QuadPart, frameBeginGPUTimestamp.QuadPart);

	const unsigned numDrawStats = (const unsigned)flippedRecordedDrawEvents.size();
	for (unsigned drawEventID = 0; drawEventID < numDrawStats; ++drawEventID)
	{
		const RecordedDrawCallStat& thisRecordedDrawStat = flippedRecordedDrawEvents[drawEventID];
		const char* drawTypeString = "";
		char drawParamsBuffer[128] = {0};
		const unsigned wavesCount = thisRecordedDrawStat.DrawType == RecordedDrawCallStat::DT_Clear ? 0 : thisRecordedDrawStat.DrawCallStatUnion.DrawData.VertexWavesCount;
		switch (thisRecordedDrawStat.DrawType)
		{
#ifdef _DEBUG
		default:
		{
			__debugbreak(); // Should never be here!
		}
			break;
#endif
		case RecordedDrawCallStat::DT_Clear:
		{
			drawTypeString = "Clear";
			const char* clearFlagsString = ClearFlagsString[thisRecordedDrawStat.DrawCallStatUnion.ClearData.ClearFlags & 0x7];
			const unsigned char clearB = (const unsigned char)(thisRecordedDrawStat.DrawCallStatUnion.ClearData.ClearColor & 0xFF);
			const unsigned char clearG = (const unsigned char)( (thisRecordedDrawStat.DrawCallStatUnion.ClearData.ClearColor >> 8) & 0xFF);
			const unsigned char clearR = (const unsigned char)( (thisRecordedDrawStat.DrawCallStatUnion.ClearData.ClearColor >> 16) & 0xFF);
			const unsigned char clearA = (const unsigned char)( (thisRecordedDrawStat.DrawCallStatUnion.ClearData.ClearColor >> 24) & 0xFF);
			const float depth = thisRecordedDrawStat.DrawCallStatUnion.ClearData.ClearDepth;
			const unsigned char stencil = thisRecordedDrawStat.DrawCallStatUnion.ClearData.ClearStencil;
			sprintf_s(drawParamsBuffer, "\"(%s, ARGB(%u, %u, %u, %u), %f, 0x%02X)\"", clearFlagsString, clearA, clearR, clearG, clearB, depth, stencil);
		}
			break;
		case RecordedDrawCallStat::DT_DrawPrimitive:
		{
			drawTypeString = thisRecordedDrawStat.DrawCallStatUnion.DrawData.isDrawUP ? "DrawPrimitiveUP" : "DrawPrimitive";
			const char* const primTypeString = PrimitiveTypeString[thisRecordedDrawStat.DrawCallStatUnion.DrawData.primType];
			const unsigned startVert = thisRecordedDrawStat.DrawCallStatUnion.DrawData.BaseVertexIndex;
			const unsigned primCount = thisRecordedDrawStat.DrawCallStatUnion.DrawData.PrimCount;
			sprintf_s(drawParamsBuffer, "\"(%s, %u, %u)\"", primTypeString, startVert, primCount);
		}
			break;
		case RecordedDrawCallStat::DT_DrawIndexedPrimitive:
		{
			drawTypeString = thisRecordedDrawStat.DrawCallStatUnion.DrawData.isDrawUP ? "DrawIndexedPrimitiveUP" : "DrawIndexedPrimitive";
			const char* const primTypeString = PrimitiveTypeString[thisRecordedDrawStat.DrawCallStatUnion.DrawData.primType];
			const int baseVertexIndex = thisRecordedDrawStat.DrawCallStatUnion.DrawData.BaseVertexIndex;
			const unsigned minVertexIndex = thisRecordedDrawStat.DrawCallStatUnion.DrawData.MinVertexIndex;
			const unsigned numVertices = thisRecordedDrawStat.DrawCallStatUnion.DrawData.NumVertices;
			const unsigned startIndex = thisRecordedDrawStat.DrawCallStatUnion.DrawData.StartIndex;
			const unsigned primCount = thisRecordedDrawStat.DrawCallStatUnion.DrawData.PrimCount;
			sprintf_s(drawParamsBuffer, "\"(%s, %i, %u, %u, %u, %u)\"", primTypeString, baseVertexIndex, minVertexIndex, numVertices, startIndex, primCount);
		}
			break;
		}
		fprintf(f, "%u,%s,%s,%u,%I64u,%I64u\n", drawEventID + 1, drawTypeString, drawParamsBuffer, wavesCount, thisRecordedDrawStat.drawCallCPUTimestamp.QuadPart, thisRecordedDrawStat.drawCallFinishGPUTimestamp.QuadPart);
	}

	fprintf(f, "%u,FRAME_END,%s,0,%I64u,%I64u\n", numDrawStats + 2, "END", frameEndCPUTimestamp.QuadPart, frameEndGPUTimestamp.QuadPart);
	fclose(f);
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

static const char statsFileHeaderColumnsString[] = "FrameID,"\
	"VBBCyclesTotal,"\
	"VBBCyclesIdle,VBBCyclesOutWait,VBBCyclesWorking,"\
	"VBBPercentIdle,VBBPercentOutWait,VBBPercentWorking,"\
	"VShaderCyclesTotal,"\
	"VShaderCyclesIdle,VShaderCyclesOutWait,VShaderCyclesExecShaderCode,VShaderCyclesWorking,"\
	"VShaderPercentIdle,VShaderPercentOutWait,VShaderPercentExecShaderCode,VShaderPercentWorking,"\
	"IACyclesTotal,"\
	"IACyclesIdle,IACyclesOutWait,IACyclesWaitCache,IACyclesWorking,"\
	"IAPercentIdle,IAPercentOutWait,IAPercentWaitCache,IAPercentWorking,"\
	"ClipUnitCyclesTotal,"\
	"ClipUnitCyclesIdle,ClipUnitCyclesOutWait,ClipUnitCyclesWorking,"\
	"ClipUnitPercentIdle,ClipUnitPercentOutWait,ClipUnitPercentWorking,"\
	"TriSetupCyclesTotal,"\
	"TriSetupCyclesIdle,TriSetupCyclesOutWait,TriSetupCyclesWorking,"\
	"TriSetupPercentIdle,TriSetupPercentOutWait,TriSetupPercentWorking,"\
	"RastCyclesTotal,"\
	"RastCyclesIdle,RastCyclesOutWait,RastCyclesWaitTriWorkCache,RastCyclesWorking,"\
	"RastPercentIdle,RastPercentOutWait,RastPercentWaitTriWorkCache,RastPercentWorking,"\
	"DInterpCyclesTotal,"\
	"DInterpCyclesIdle,DInterpCyclesOutWait,DInterpCyclesWorking,"\
	"DInterpPercentIdle,DInterpPercentOutWait,DInterpPercentWorking,"\
	"InterpCyclesTotal,"\
	"InterpCyclesIdle,InterpCyclesOutWait,InterpCyclesWorking,"\
	"InterpPercentIdle,InterpPercentOutWait,InterpPercentWorking,"\
	"TexSampCyclesTotal,"\
	"TexSampCyclesIdle,TexSampCyclesOutWait,TexSampCyclesWaitCache,TexSampCyclesWorking,"\
	"TexSampPercentIdle,TexSampPercentOutWait,TexSampPercentWaitCache,TexSampPercentWorking,"\
	"ROPCyclesTotal,"\
	"ROPCyclesIdle,ROPCyclesOutWait,ROPCyclesWaitCache,ROPCyclesWorking,"\
	"ROPPercentIdle,ROPPercentOutWait,ROPPercentWaitCache,ROPPercentWorking,"\
	"CMDCyclesTotal,"\
	"CMDCyclesIdle,CMDCyclesWorking,"\
	"CMDPercentIdle,CMDPercentWorking,"\
	"MemReadCyclesTotal,"\
	"MemReadCyclesIdle,MemReadCyclesWorking,"\
	"MemReadPercentIdle,MemReadPercentWorking,"\
	"MemWriteCyclesTotal,"\
	"MemWriteCyclesIdle,MemWriteCyclesWorking,"\
	"MemWritePercentIdle,MemWritePercentWorking,"\
	"ROPCacheTransactionsTotal,"\
	"ROPCacheHits,ROPCacheMisses,"\
	"ROPCachePercentHits,ROPCachePercentMisses,"\
	"MemReadNumBytes,MemReadNumTransactions,"\
	"MemReadNumBytesNonScanout,MemReadNumTransactionsNonScanout,"\
	"MemWriteNumBytes,MemWriteNumTransactions"\
	"\n";

static const char statsFileLineFormatString[] =  "%u," /* "FrameID,"*/ \
	"%u," /* "VBBCyclesTotal,"*/ \
	"%u,%u,%u," /* "VBBCyclesIdle,VBBCyclesOutWait,VBBCyclesWorking,"*/ \
	"%f,%f,%f," /* "VBBPercentIdle,VBBPercentOutWait,VBBPercentWorking"*/ \
	"%u," /* "VShaderCyclesTotal,"*/ \
	"%u,%u,%u,%u," /* "VShaderCyclesIdle,VShaderCyclesOutWait,VShaderCyclesExecShaderCode,VShaderCyclesWorking,"*/ \
	"%f,%f,%f,%f," /* "VShaderPercentIdle,VShaderPercentOutWait,VShaderPercentExecShaderCode,VShaderPercentWorking"*/ \
	"%u," /* "IACyclesTotal,"*/ \
	"%u,%u,%u,%u," /* "IACyclesIdle,IACyclesOutWait,IACyclesWaitCache,IACyclesWorking,"*/ \
	"%f,%f,%f,%f," /* "IAPercentIdle,IAPercentOutWait,IAPercentWaitCache,IAPercentWorking"*/ \
	"%u," /* "ClipUnitCyclesTotal,"*/ \
	"%u,%u,%u," /* "ClipUnitCyclesIdle,ClipUnitCyclesOutWait,ClipUnitCyclesWorking,"*/ \
	"%f,%f,%f," /* "ClipUnitPercentIdle,ClipUnitPercentOutWait,ClipUnitPercentWorking"*/ \
	"%u," /* "TriSetupCyclesTotal,"*/ \
	"%u,%u,%u," /* "TriSetupCyclesIdle,TriSetupCyclesOutWait,TriSetupCyclesWorking,"*/ \
	"%f,%f,%f," /* "TriSetupPercentIdle,TriSetupPercentOutWait,TriSetupPercentWorking"*/ \
	"%u," /* "RastCyclesTotal,"*/ \
	"%u,%u,%u,%u," /* "RastCyclesIdle,RastCyclesOutWait,RastCyclesWaitTriWorkCache,RastCyclesWorking,"*/ \
	"%f,%f,%f,%f," /* "RastPercentIdle,RastPercentOutWait,RastPercentWaitTriWorkCache,RastPercentWorking"*/ \
	"%u," /* "DInterpCyclesTotal,"*/ \
	"%u,%u,%u," /* "DInterpCyclesIdle,DInterpCyclesOutWait,DInterpCyclesWorking,"*/ \
	"%f,%f,%f," /* "DInterpPercentIdle,DInterpPercentOutWait,DInterpPercentWorking"*/ \
	"%u," /* "InterpCyclesTotal,"*/ \
	"%u,%u,%u," /* "InterpCyclesIdle,InterpCyclesOutWait,InterpCyclesWorking,"*/ \
	"%f,%f,%f," /* "InterpPercentIdle,InterpPercentOutWait,InterpPercentWorking"*/ \
	"%u," /* "TexSampCyclesTotal,"*/ \
	"%u,%u,%u,%u," /* "TexSampCyclesIdle,TexSampCyclesOutWait,TexSampCyclesWaitCache,TexSampCyclesWorking,"*/ \
	"%f,%f,%f,%f," /* "TexSampPercentIdle,TexSampPercentOutWait,TexSampPercentWaitCache,TexSampPercentWorking"*/ \
	"%u," /* "ROPCyclesTotal,"*/ \
	"%u,%u,%u,%u," /* "ROPCyclesIdle,ROPCyclesOutWait,ROPCyclesWaitCache,ROPCyclesWorking,"*/ \
	"%f,%f,%f,%f," /* "ROPPercentIdle,ROPPercentOutWait,ROPPercentWaitCache,ROPPercentWorking"*/ \
	"%u," /* "CMDCyclesTotal,"*/ \
	"%u,%u," /* "CMDCyclesIdle,CMDCyclesWorking,"*/ \
	"%f,%f," /* "CMDPercentIdle,CMDPercentWorking"*/ \
	"%u," /* "MemReadCyclesTotal,"*/ \
	"%u,%u," /* "MemReadCyclesIdle,MemReadCyclesWorking,"*/ \
	"%f,%f," /* "MemReadPercentIdle,MemReadPercentWorking"*/ \
	"%u," /* "MemWriteCyclesTotal,"*/ \
	"%u,%u," /* "MemWriteCyclesIdle,MemWriteCyclesWorking,"*/ \
	"%f,%f," /* "MemWritePercentIdle,MemWritePercentWorking"*/ \
	"%u," /* "ROPCacheTransactionsTotal,"*/ \
	"%u,%u," /* "ROPCacheHits,ROPCacheMisses"*/ \
	"%f,%f," /* "ROPCachePercentHits,ROPCachePercentMisses"*/ \
	"%u,%u," /* "MemReadNumBytes,MemReadNumTransactions"*/ \
	"%u,%u," /* "MemReadNumBytesNonScanout,MemReadNumTransactionsNonScanout"*/ \
	"%u,%u" /* "MemWriteNumBytes,MemWriteNumTransactions"*/ \
	"\n";
void GPUStats::WriteStatsColumnHeaders()
{
	if (!statsWriteFile)
	{
#ifdef _DEBUG
		__debugbreak(); // Don't call this function if we're not supposed to have an opened stats file!
#endif
		return;
	}

	fwrite(statsFileHeaderColumnsString, sizeof(statsFileHeaderColumnsString), 1, statsWriteFile);
}

const float GetReciprocalPercentageCycleCount(const unsigned totalCycleCount)
{
	if (totalCycleCount == 0)
		return 0.0f;
	return 100.0f / totalCycleCount;
}

static char printBuffer[8192] = {0};
void GPUStats::WritePerFrameStats(const unsigned currentFrameID)
{
	if (!statsWriteFile)
		return;

	const GPUFrameStats& frameStats = uStats.typedFrameStats;

	const float rcpVBBTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.VBBTimerStats.GetTotalCycleCount() );
	const float rcpVShaderTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.VShaderTimerStats.GetTotalCycleCount() );
	const float rcpIATotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.IATimerStats.GetTotalCycleCount() );
	const float rcpClipUnitTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.ClipUnitTimerStats.GetTotalCycleCount() );
	const float rcpTriSetupTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.TriSetupTimerStats.GetTotalCycleCount() );
	const float rcpRastTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.RasterizerTimerStats.GetTotalCycleCount() );
	const float rcpDInterpTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.DepthInterpolatorTimerStats.GetTotalCycleCount() );
	const float rcpInterpTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.AttrInterpolatorTimerStats.GetTotalCycleCount() );
	const float rcpTexSampTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.TexSamplerTimerStats.GetTotalCycleCount() );
	const float rcpROPTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.ROPTimerStats.GetTotalCycleCount() );
	const float rcpCommandTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.CommandProcessorTimerStats.GetTotalCycleCount() );
	const float rcpMemReadTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.MemControllerReadTimerStats.GetTotalCycleCount() );
	const float rcpMemWriteTotalCyclesPercent = GetReciprocalPercentageCycleCount(frameStats.MemControllerWriteTimerStats.GetTotalCycleCount() );
	const float rcpROPTransactionsPercent = GetReciprocalPercentageCycleCount(frameStats.ROPCacheCounterStats.GetTotalCacheLookups() );

	const int length = sprintf_s(printBuffer, statsFileLineFormatString, currentFrameID, /* "FrameID,"*/ \
		frameStats.VBBTimerStats.GetTotalCycleCount(), /* "VBBCyclesTotal,"*/
		frameStats.VBBTimerStats.cyclesIdle, frameStats.VBBTimerStats.cyclesWaitingForOutput, frameStats.VBBTimerStats.cyclesWorking, /* "VBBCyclesIdle,VBBCyclesOutWait,VBBCyclesWorking,"*/
		frameStats.VBBTimerStats.cyclesIdle * rcpVBBTotalCyclesPercent, frameStats.VBBTimerStats.cyclesWaitingForOutput * rcpVBBTotalCyclesPercent, frameStats.VBBTimerStats.cyclesWorking * rcpVBBTotalCyclesPercent, /* "VBBPercentIdle,VBBPercentOutWait,VBBPercentWorking"*/
		frameStats.VShaderTimerStats.GetTotalCycleCount(), /* "VShaderCyclesTotal,"*/
		frameStats.VShaderTimerStats.cyclesIdle, frameStats.VShaderTimerStats.cyclesWaitingForOutput, frameStats.VShaderTimerStats.cyclesExecShaderCode, frameStats.VShaderTimerStats.cyclesWorking, /* "VShaderCyclesIdle,VShaderCyclesOutWait,VShaderCyclesExecShaderCode,VShaderCyclesWorking,"*/
		frameStats.VShaderTimerStats.cyclesIdle * rcpVShaderTotalCyclesPercent, frameStats.VShaderTimerStats.cyclesWaitingForOutput * rcpVShaderTotalCyclesPercent, frameStats.VShaderTimerStats.cyclesExecShaderCode * rcpVShaderTotalCyclesPercent, frameStats.VShaderTimerStats.cyclesWorking * rcpVShaderTotalCyclesPercent, /* "VShaderPercentIdle,VShaderPercentOutWait,VShaderPercentExecShaderCode,VShaderPercentWorking"*/
		frameStats.IATimerStats.GetTotalCycleCount(), /* "IACyclesTotal,"*/
		frameStats.IATimerStats.cyclesIdle, frameStats.IATimerStats.cyclesWaitingForOutput, frameStats.IATimerStats.cyclesLoadingDataToCache, frameStats.IATimerStats.cyclesWorking, /* "IACyclesIdle,IACyclesOutWait,IACyclesWaitCache,IACyclesWorking,"*/
		frameStats.IATimerStats.cyclesIdle * rcpIATotalCyclesPercent, frameStats.IATimerStats.cyclesWaitingForOutput * rcpIATotalCyclesPercent, frameStats.IATimerStats.cyclesLoadingDataToCache * rcpIATotalCyclesPercent, frameStats.IATimerStats.cyclesWorking * rcpIATotalCyclesPercent, /* "IAPercentIdle,IAPercentOutWait,IAPercentWaitCache,IAPercentWorking"*/
		frameStats.ClipUnitTimerStats.GetTotalCycleCount(), /* "ClipUnitCyclesTotal,"*/
		frameStats.ClipUnitTimerStats.cyclesIdle, frameStats.ClipUnitTimerStats.cyclesWaitingForOutput, frameStats.ClipUnitTimerStats.cyclesWorking, /* "ClipUnitCyclesIdle,ClipUnitCyclesOutWait,ClipUnitCyclesWorking,"*/
		frameStats.ClipUnitTimerStats.cyclesIdle * rcpClipUnitTotalCyclesPercent, frameStats.ClipUnitTimerStats.cyclesWaitingForOutput * rcpClipUnitTotalCyclesPercent, frameStats.ClipUnitTimerStats.cyclesWorking * rcpClipUnitTotalCyclesPercent, /* "ClipUnitPercentIdle,ClipUnitPercentOutWait,ClipUnitPercentWorking"*/
		frameStats.TriSetupTimerStats.GetTotalCycleCount(), /* "TriSetupCyclesTotal,"*/
		frameStats.TriSetupTimerStats.cyclesIdle, frameStats.TriSetupTimerStats.cyclesWaitingForOutput, frameStats.TriSetupTimerStats.cyclesWorking, /* "TriSetupCyclesIdle,TriSetupCyclesOutWait,TriSetupCyclesWorking,"*/
		frameStats.TriSetupTimerStats.cyclesIdle * rcpTriSetupTotalCyclesPercent, frameStats.TriSetupTimerStats.cyclesWaitingForOutput * rcpTriSetupTotalCyclesPercent, frameStats.TriSetupTimerStats.cyclesWorking * rcpTriSetupTotalCyclesPercent, /* "TriSetupPercentIdle,TriSetupPercentOutWait,TriSetupPercentWorking"*/
		frameStats.RasterizerTimerStats.GetTotalCycleCount(), /* "RastCyclesTotal,"*/
		frameStats.RasterizerTimerStats.cyclesIdle, frameStats.RasterizerTimerStats.cyclesWaitingForOutput, frameStats.RasterizerTimerStats.cyclesWaitingForTriWorkCache, frameStats.RasterizerTimerStats.cyclesWorking, /* "RastCyclesIdle,RastCyclesOutWait,RastCyclesWaitTriWorkCache,RastCyclesWorking,"*/
		frameStats.RasterizerTimerStats.cyclesIdle * rcpRastTotalCyclesPercent, frameStats.RasterizerTimerStats.cyclesWaitingForOutput * rcpRastTotalCyclesPercent, frameStats.RasterizerTimerStats.cyclesWaitingForTriWorkCache * rcpRastTotalCyclesPercent, frameStats.RasterizerTimerStats.cyclesWorking * rcpRastTotalCyclesPercent, /* "RastPercentIdle,RastPercentOutWait,RastPercentWaitTriWorkCache,RastPercentWorking"*/
		frameStats.DepthInterpolatorTimerStats.GetTotalCycleCount(), /* "DInterpCyclesTotal,"*/
		frameStats.DepthInterpolatorTimerStats.cyclesIdle, frameStats.DepthInterpolatorTimerStats.cyclesWaitingForOutput, frameStats.DepthInterpolatorTimerStats.cyclesWorking, /* "DInterpCyclesIdle,DInterpCyclesOutWait,DInterpCyclesWorking,"*/
		frameStats.DepthInterpolatorTimerStats.cyclesIdle * rcpDInterpTotalCyclesPercent, frameStats.DepthInterpolatorTimerStats.cyclesWaitingForOutput * rcpDInterpTotalCyclesPercent, frameStats.DepthInterpolatorTimerStats.cyclesWorking * rcpDInterpTotalCyclesPercent, /* "DInterpPercentIdle,DInterpPercentOutWait,DInterpPercentWorking"*/
		frameStats.AttrInterpolatorTimerStats.GetTotalCycleCount(), /* "InterpCyclesTotal,"*/
		frameStats.AttrInterpolatorTimerStats.cyclesIdle, frameStats.AttrInterpolatorTimerStats.cyclesWaitingForOutput, frameStats.AttrInterpolatorTimerStats.cyclesWorking, /* "InterpCyclesIdle,InterpCyclesOutWait,InterpCyclesWorking,"*/
		frameStats.AttrInterpolatorTimerStats.cyclesIdle * rcpInterpTotalCyclesPercent, frameStats.AttrInterpolatorTimerStats.cyclesWaitingForOutput * rcpInterpTotalCyclesPercent, frameStats.AttrInterpolatorTimerStats.cyclesWorking * rcpInterpTotalCyclesPercent, /* "InterpPercentIdle,InterpPercentOutWait,InterpPercentWorking"*/
		frameStats.TexSamplerTimerStats.GetTotalCycleCount(), /* "TexSampCyclesTotal,"*/
		frameStats.TexSamplerTimerStats.cyclesIdle, frameStats.TexSamplerTimerStats.cyclesWaitingForOutput, frameStats.TexSamplerTimerStats.cyclesLoadingTexCache, frameStats.TexSamplerTimerStats.cyclesWorking, /* "TexSampCyclesIdle,TexSampCyclesOutWait,TexSampCyclesWaitCache,TexSampCyclesWorking,"*/
		frameStats.TexSamplerTimerStats.cyclesIdle * rcpTexSampTotalCyclesPercent, frameStats.TexSamplerTimerStats.cyclesWaitingForOutput * rcpTexSampTotalCyclesPercent, frameStats.TexSamplerTimerStats.cyclesLoadingTexCache * rcpTexSampTotalCyclesPercent, frameStats.TexSamplerTimerStats.cyclesWorking * rcpTexSampTotalCyclesPercent, /* "TexSampPercentIdle,TexSampPercentOutWait,TexSampPercentWaitCache,TexSampPercentWorking"*/
		frameStats.ROPTimerStats.GetTotalCycleCount(), /* "ROPCyclesTotal,"*/
		frameStats.ROPTimerStats.cyclesIdle, frameStats.ROPTimerStats.cyclesWaitingForOutput, frameStats.ROPTimerStats.cyclesWaitingForMemoryRead, frameStats.ROPTimerStats.cyclesWorking, /* "ROPCyclesIdle,ROPCyclesOutWait,ROPCyclesWaitCache,ROPCyclesWorking,"*/
		frameStats.ROPTimerStats.cyclesIdle * rcpROPTotalCyclesPercent, frameStats.ROPTimerStats.cyclesWaitingForOutput * rcpROPTotalCyclesPercent, frameStats.ROPTimerStats.cyclesWaitingForMemoryRead * rcpROPTotalCyclesPercent, frameStats.ROPTimerStats.cyclesWorking * rcpROPTotalCyclesPercent, /* "ROPPercentIdle,ROPPercentOutWait,ROPPercentWaitCache,ROPPercentWorking"*/
		frameStats.CommandProcessorTimerStats.GetTotalCycleCount(), /* "CMDCyclesTotal,"*/
		frameStats.CommandProcessorTimerStats.cyclesIdle, frameStats.CommandProcessorTimerStats.cyclesWorking, /* "CMDCyclesIdle,CMDCyclesWorking,"*/
		frameStats.CommandProcessorTimerStats.cyclesIdle * rcpCommandTotalCyclesPercent, frameStats.CommandProcessorTimerStats.cyclesWorking * rcpCommandTotalCyclesPercent, /* "CMDPercentIdle,CMDPercentWorking"*/
		frameStats.MemControllerReadTimerStats.GetTotalCycleCount(), /* "MemReadCyclesTotal,"*/
		frameStats.MemControllerReadTimerStats.cyclesIdle, frameStats.MemControllerReadTimerStats.cyclesWorking, /* "MemReadCyclesIdle,MemReadCyclesWorking,"*/
		frameStats.MemControllerReadTimerStats.cyclesIdle * rcpMemReadTotalCyclesPercent, frameStats.MemControllerReadTimerStats.cyclesWorking * rcpMemReadTotalCyclesPercent, /* "MemReadPercentIdle,MemReadPercentWorking"*/
		frameStats.MemControllerWriteTimerStats.GetTotalCycleCount(), /* "MemWriteCyclesTotal,"*/
		frameStats.MemControllerWriteTimerStats.cyclesIdle, frameStats.MemControllerWriteTimerStats.cyclesWorking, /* "MemWriteCyclesIdle,MemWriteCyclesWorking,"*/
		frameStats.MemControllerWriteTimerStats.cyclesIdle * rcpMemWriteTotalCyclesPercent, frameStats.MemControllerWriteTimerStats.cyclesWorking * rcpMemWriteTotalCyclesPercent, /* "MemWritePercentIdle,MemWritePercentWorking"*/
		frameStats.ROPCacheCounterStats.GetTotalCacheLookups(), /* "ROPCacheTransactionsTotal,"*/
		frameStats.ROPCacheCounterStats.ROPCounterCacheHits, frameStats.ROPCacheCounterStats.ROPCounterCacheMisses, /* "ROPCacheHits,ROPCacheMisses"*/
		frameStats.ROPCacheCounterStats.ROPCounterCacheHits * rcpROPTransactionsPercent, frameStats.ROPCacheCounterStats.ROPCounterCacheMisses * rcpROPTransactionsPercent, /* "ROPCachePercentHits,ROPCachePercentMisses"*/
		frameStats.ReadMemCounterStats.BytesTransferred, frameStats.ReadMemCounterStats.NumTransactions, /* "MemReadNumBytes,MemReadNumTransactions"*/
		frameStats.ReadMemCounterStats.BytesTransferredNonScanout, frameStats.ReadMemCounterStats.NumTransactionsNonScanout, /* "MemReadNumBytesNonScanout,MemReadNumTransactionsNonScanout"*/
		frameStats.WriteMemCounterStats.BytesTransferred, frameStats.WriteMemCounterStats.NumTransactions /* "MemWriteNumBytes,MemWriteNumTransactions"*/
		);

	fwrite(printBuffer, length, 1, statsWriteFile);
}

void GPUStats::UpdateDialogStats()
{
	if (!GPUStatsDialog)
		return;

	const GPUFrameStats& frameStats = uStats.typedFrameStats;

	const float VBBIdlePercent = frameStats.VBBTimerStats.cyclesIdle / (const float)frameStats.VBBTimerStats.GetTotalCycleCount();
	const float VBBOutWaitPercent = frameStats.VBBTimerStats.cyclesWaitingForOutput / (const float)frameStats.VBBTimerStats.GetTotalCycleCount();
	const float VBBWorkingPercent = frameStats.VBBTimerStats.cyclesWorking / (const float)frameStats.VBBTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_VBB_STAT1, VBBIdlePercent, frameStats.VBBTimerStats.cyclesIdle);
	PrintTimeStat(IDC_VBB_STAT2, VBBOutWaitPercent, frameStats.VBBTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_VBB_STAT3, VBBWorkingPercent, frameStats.VBBTimerStats.cyclesWorking);

	const float VShaderIdlePercent = frameStats.VShaderTimerStats.cyclesIdle / (const float)frameStats.VShaderTimerStats.GetTotalCycleCount();
	const float VShaderOutWaitPercent = frameStats.VShaderTimerStats.cyclesWaitingForOutput / (const float)frameStats.VShaderTimerStats.GetTotalCycleCount();
	const float VShaderExecShaderCode = frameStats.VShaderTimerStats.cyclesExecShaderCode / (const float)frameStats.VShaderTimerStats.GetTotalCycleCount();
	const float VShaderWorkingPercent = frameStats.VShaderTimerStats.cyclesWorking / (const float)frameStats.VShaderTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_VS_STAT1, VShaderIdlePercent, frameStats.VShaderTimerStats.cyclesIdle);
	PrintTimeStat(IDC_VS_STAT2, VShaderOutWaitPercent, frameStats.VShaderTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_VS_STAT3, VShaderExecShaderCode, frameStats.VShaderTimerStats.cyclesExecShaderCode);
	PrintTimeStat(IDC_VS_STAT4, VShaderWorkingPercent, frameStats.VShaderTimerStats.cyclesWorking);

	const float IAIdlePercent = frameStats.IATimerStats.cyclesIdle / (const float)frameStats.IATimerStats.GetTotalCycleCount();
	const float IAOutWaitPercent = frameStats.IATimerStats.cyclesWaitingForOutput / (const float)frameStats.IATimerStats.GetTotalCycleCount();
	const float IAWaitCachePercent = frameStats.IATimerStats.cyclesLoadingDataToCache / (const float)frameStats.IATimerStats.GetTotalCycleCount();
	const float IAWorkingPercent = frameStats.IATimerStats.cyclesWorking / (const float)frameStats.IATimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_IA_STAT1, IAIdlePercent, frameStats.IATimerStats.cyclesIdle);
	PrintTimeStat(IDC_IA_STAT2, IAOutWaitPercent, frameStats.IATimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_IA_STAT3, IAWaitCachePercent, frameStats.IATimerStats.cyclesLoadingDataToCache);
	PrintTimeStat(IDC_IA_STAT4, IAWorkingPercent, frameStats.IATimerStats.cyclesWorking);

	const float ClipUnitIdlePercent = frameStats.ClipUnitTimerStats.cyclesIdle / (const float)frameStats.ClipUnitTimerStats.GetTotalCycleCount();
	const float ClipUnitOutWaitPercent = frameStats.ClipUnitTimerStats.cyclesWaitingForOutput / (const float)frameStats.ClipUnitTimerStats.GetTotalCycleCount();
	const float ClipUnitWorkingPercent = frameStats.ClipUnitTimerStats.cyclesWorking / (const float)frameStats.ClipUnitTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_CLIPUNIT_STAT1, ClipUnitIdlePercent, frameStats.ClipUnitTimerStats.cyclesIdle);
	PrintTimeStat(IDC_CLIPUNIT_STAT2, ClipUnitOutWaitPercent, frameStats.ClipUnitTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_CLIPUNIT_STAT3, ClipUnitWorkingPercent, frameStats.ClipUnitTimerStats.cyclesWorking);

	const float TriSetupIdlePercent = frameStats.TriSetupTimerStats.cyclesIdle / (const float)frameStats.TriSetupTimerStats.GetTotalCycleCount();
	const float TriSetupOutWaitPercent = frameStats.TriSetupTimerStats.cyclesWaitingForOutput / (const float)frameStats.TriSetupTimerStats.GetTotalCycleCount();
	const float TriSetupWorkingPercent = frameStats.TriSetupTimerStats.cyclesWorking / (const float)frameStats.TriSetupTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_TRISETUP_STAT1, TriSetupIdlePercent, frameStats.TriSetupTimerStats.cyclesIdle);
	PrintTimeStat(IDC_TRISETUP_STAT2, TriSetupOutWaitPercent, frameStats.TriSetupTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_TRISETUP_STAT3, TriSetupWorkingPercent, frameStats.TriSetupTimerStats.cyclesWorking);

	const float RastIdlePercent = frameStats.RasterizerTimerStats.cyclesIdle / (const float)frameStats.RasterizerTimerStats.GetTotalCycleCount();
	const float RastOutWaitPercent = frameStats.RasterizerTimerStats.cyclesWaitingForOutput / (const float)frameStats.RasterizerTimerStats.GetTotalCycleCount();
	const float RastWaitTriWorkCachePercent = frameStats.RasterizerTimerStats.cyclesWaitingForTriWorkCache / (const float)frameStats.RasterizerTimerStats.GetTotalCycleCount();
	const float RastWorkingPercent = frameStats.RasterizerTimerStats.cyclesWorking / (const float)frameStats.RasterizerTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_RAST_STAT1, RastIdlePercent, frameStats.RasterizerTimerStats.cyclesIdle);
	PrintTimeStat(IDC_RAST_STAT2, RastOutWaitPercent, frameStats.RasterizerTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_RAST_STAT3, RastWaitTriWorkCachePercent, frameStats.RasterizerTimerStats.cyclesWaitingForTriWorkCache);
	PrintTimeStat(IDC_RAST_STAT4, RastWorkingPercent, frameStats.RasterizerTimerStats.cyclesWorking);

	const float DepthInterpIdlePercent = frameStats.DepthInterpolatorTimerStats.cyclesIdle / (const float)frameStats.DepthInterpolatorTimerStats.GetTotalCycleCount();
	const float DepthInterpOutWaitPercent = frameStats.DepthInterpolatorTimerStats.cyclesWaitingForOutput / (const float)frameStats.DepthInterpolatorTimerStats.GetTotalCycleCount();
	const float DepthInterpWorkingPercent = frameStats.DepthInterpolatorTimerStats.cyclesWorking / (const float)frameStats.DepthInterpolatorTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_DINTERP_STAT1, DepthInterpIdlePercent, frameStats.DepthInterpolatorTimerStats.cyclesIdle);
	PrintTimeStat(IDC_DINTERP_STAT2, DepthInterpOutWaitPercent, frameStats.DepthInterpolatorTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_DINTERP_STAT3, DepthInterpWorkingPercent, frameStats.DepthInterpolatorTimerStats.cyclesWorking);

	const float AttrInterpIdlePercent = frameStats.AttrInterpolatorTimerStats.cyclesIdle / (const float)frameStats.AttrInterpolatorTimerStats.GetTotalCycleCount();
	const float AttrInterpOutWaitPercent = frameStats.AttrInterpolatorTimerStats.cyclesWaitingForOutput / (const float)frameStats.AttrInterpolatorTimerStats.GetTotalCycleCount();
	const float AttrInterpWorkingPercent = frameStats.AttrInterpolatorTimerStats.cyclesWorking / (const float)frameStats.AttrInterpolatorTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_INTERP_STAT1, AttrInterpIdlePercent, frameStats.AttrInterpolatorTimerStats.cyclesIdle);
	PrintTimeStat(IDC_INTERP_STAT2, AttrInterpOutWaitPercent, frameStats.AttrInterpolatorTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_INTERP_STAT3, AttrInterpWorkingPercent, frameStats.AttrInterpolatorTimerStats.cyclesWorking);

	const float TexSampIdlePercent = frameStats.TexSamplerTimerStats.cyclesIdle / (const float)frameStats.TexSamplerTimerStats.GetTotalCycleCount();
	const float TexSampOutWaitPercent = frameStats.TexSamplerTimerStats.cyclesWaitingForOutput / (const float)frameStats.TexSamplerTimerStats.GetTotalCycleCount();
	const float TexSampWaitCachePercent = frameStats.TexSamplerTimerStats.cyclesLoadingTexCache / (const float)frameStats.TexSamplerTimerStats.GetTotalCycleCount();
	const float TexSampWorkingPercent = frameStats.TexSamplerTimerStats.cyclesWorking / (const float)frameStats.TexSamplerTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_TEXSAMP_STAT1, TexSampIdlePercent, frameStats.TexSamplerTimerStats.cyclesIdle);
	PrintTimeStat(IDC_TEXSAMP_STAT2, TexSampOutWaitPercent, frameStats.TexSamplerTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_TEXSAMP_STAT3, TexSampWaitCachePercent, frameStats.TexSamplerTimerStats.cyclesLoadingTexCache);
	PrintTimeStat(IDC_TEXSAMP_STAT4, TexSampWorkingPercent, frameStats.TexSamplerTimerStats.cyclesWorking);

	const float ROPIdlePercent = frameStats.ROPTimerStats.cyclesIdle / (const float)frameStats.ROPTimerStats.GetTotalCycleCount();
	const float ROPOutWaitPercent = frameStats.ROPTimerStats.cyclesWaitingForOutput / (const float)frameStats.ROPTimerStats.GetTotalCycleCount();
	const float ROPWaitMemReadPercent = frameStats.ROPTimerStats.cyclesWaitingForMemoryRead / (const float)frameStats.ROPTimerStats.GetTotalCycleCount();
	const float ROPWorkingPercent = frameStats.ROPTimerStats.cyclesWorking / (const float)frameStats.ROPTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_ROP_STAT1, ROPIdlePercent, frameStats.ROPTimerStats.cyclesIdle);
	PrintTimeStat(IDC_ROP_STAT2, ROPOutWaitPercent, frameStats.ROPTimerStats.cyclesWaitingForOutput);
	PrintTimeStat(IDC_ROP_STAT3, ROPWaitMemReadPercent, frameStats.ROPTimerStats.cyclesWaitingForMemoryRead);
	PrintTimeStat(IDC_ROP_STAT4, ROPWorkingPercent, frameStats.ROPTimerStats.cyclesWorking);

	const float CmdIdlePercent = frameStats.CommandProcessorTimerStats.cyclesIdle / (const float)frameStats.CommandProcessorTimerStats.GetTotalCycleCount();
	const float CmdWorkingPercent = frameStats.CommandProcessorTimerStats.cyclesWorking / (const float)frameStats.CommandProcessorTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_CMD_STAT1, CmdIdlePercent, frameStats.CommandProcessorTimerStats.cyclesIdle);
	PrintTimeStat(IDC_CMD_STAT2, CmdWorkingPercent, frameStats.CommandProcessorTimerStats.cyclesWorking);

	const float MemReadIdlePercent = frameStats.MemControllerReadTimerStats.cyclesIdle / (const float)frameStats.MemControllerReadTimerStats.GetTotalCycleCount();
	const float MemRedWorkingPercent = frameStats.MemControllerReadTimerStats.cyclesWorking / (const float)frameStats.MemControllerReadTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_MEMREAD_STAT1, MemReadIdlePercent, frameStats.MemControllerReadTimerStats.cyclesIdle);
	PrintTimeStat(IDC_MEMREAD_STAT2, MemRedWorkingPercent, frameStats.MemControllerReadTimerStats.cyclesWorking);

	const float MemWriteIdlePercent = frameStats.MemControllerWriteTimerStats.cyclesIdle / (const float)frameStats.MemControllerWriteTimerStats.GetTotalCycleCount();
	const float MemWriteWorkingPercent = frameStats.MemControllerWriteTimerStats.cyclesWorking / (const float)frameStats.MemControllerWriteTimerStats.GetTotalCycleCount();
	PrintTimeStat(IDC_MEMWRITE_STAT1, MemWriteIdlePercent, frameStats.MemControllerWriteTimerStats.cyclesIdle);
	PrintTimeStat(IDC_MEMWRITE_STAT2, MemWriteWorkingPercent, frameStats.MemControllerWriteTimerStats.cyclesWorking);

	PrintCounterStat(IDC_ROPCACHE_COUNT1, frameStats.ROPCacheCounterStats.ROPCounterCacheHits);
	PrintCounterStat(IDC_ROPCACHE_COUNT2, frameStats.ROPCacheCounterStats.ROPCounterCacheMisses);

	PrintCounterStat(IDC_MEMREAD_COUNT1, frameStats.ReadMemCounterStats.BytesTransferred);
	PrintCounterStat(IDC_MEMREAD_COUNT2, frameStats.ReadMemCounterStats.NumTransactions);
	PrintCounterStat(IDC_MEMREAD_COUNT3, frameStats.ReadMemCounterStats.BytesTransferredNonScanout);
	PrintCounterStat(IDC_MEMREAD_COUNT4, frameStats.ReadMemCounterStats.NumTransactionsNonScanout);

	PrintCounterStat(IDC_MEMWRITE_COUNT1, frameStats.WriteMemCounterStats.BytesTransferred);
	PrintCounterStat(IDC_MEMWRITE_COUNT2, frameStats.WriteMemCounterStats.NumTransactions);
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
