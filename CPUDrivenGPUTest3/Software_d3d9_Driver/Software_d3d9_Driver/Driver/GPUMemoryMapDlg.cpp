#include "GPUMemoryMapDlg.h"
#include "GPUAllocator.h"
#include <stdio.h>
#include <CommCtrl.h> // Need to include this in order to use the List-View control
#include <map>
#include "..\resource.h"

static const UINT WM_USER_DLG_INIT_MSG = WM_USER + 0x3E9F;

static const D3DCOLOR UNALLOCATED_COLOR = 0xFFFFFFFF;

static const D3DCOLOR ColorsMap[] =
{
	0xFF000000, // GPUVAT_Unknown
	0xFF0000FF, // GPUVAT_CommandBuffer
	0xFFFF0000, // GPUVAT_VertexStreamData
	0xFFFF8000, // GPUVAT_IndexData
	0xFFFFFF00, // GPUVAT_Texture
	0xFF00FF00, // GPUVAT_RenderTarget
	0xFFFF00FF, // GPUVAT_DepthStencil
	0xFF00FFFF, // GPUVAT_QueryMemory
	0xFF401000, // GPUVAT_ConstantBufferData
	0xFFFFE090, // GPUVAT_ShaderInstructionsMemory
	0xFF5000D0, // GPUVAT_StatsMemory
	0xFF006000 // GPUVAT_RegisterFileDumpMemory
};
static_assert(ARRAYSIZE(ColorsMap) == GPUVAT_MAX_NUM_ALLOCATION_USAGES, "Error: Unexpected array length!");

static const char* const UsageStringsMap[] =
{
	"Unknown", // GPUVAT_Unknown
	"CommandBuffer", // GPUVAT_CommandBuffer
	"VertexData", // GPUVAT_VertexStreamData
	"IndexData", // GPUVAT_IndexData
	"Texture", // GPUVAT_Texture
	"RenderTarget", // GPUVAT_RenderTarget
	"DepthStencil", // GPUVAT_DepthStencil
	"Query", // GPUVAT_QueryMemory
	"ConstantBuffer", // GPUVAT_ConstantBufferData
	"ShaderInstructions", // GPUVAT_ShaderInstructionsMemory
	"StatsMemory", // GPUVAT_StatsMemory
	"RegFileDump" // GPUVAT_RegisterFileDumpMemory
};
static_assert(ARRAYSIZE(UsageStringsMap) == GPUVAT_MAX_NUM_ALLOCATION_USAGES, "Error: Unexpected array length!");

enum ColumnEnum : unsigned char
{
	CE_Name = 0,
	CE_Address,
	CE_Size,
	CE_Width,
	CE_Height,
	CE_Depth,
	CE_Mips,
	CE_Usage,
	CE_Format,

	// This must always be last
	CE_COUNT
};
static const char* const ColumnNamesMap[] =
{
	"Resource Name",
	"Address",
	"Size (Bytes)",
	"Width",
	"Height",
	"Depth",
	"MipCount",
	"Usage",
	"Format"
};
static_assert(ARRAYSIZE(ColumnNamesMap) == CE_COUNT, "Error: Missing enum string entry");

static const char* const nullBaseAddress = NULL;
const unsigned GPUAddrToMemoryMapTexelOffset(const gpuvoid* const gpuAddr)
{
	const unsigned long ulAddr = (const unsigned long)( (const char* const)gpuAddr - nullBaseAddress);

	// Convert ulAddr from bytes 0-1GB into DRAM Pages 0-512K
	const unsigned long DRAMPageIndex = ulAddr / GPU_PAGE_SIZE_BYTES;

	return DRAMPageIndex;
}

static const char* const AllocUsageToString(const allocationUsage usage)
{
	switch (usage)
	{
	case GPUVAT_Unknown:
		return "Unknown";
	case GPUVAT_CommandBuffer:
		return "CommandBuffer";
	case GPUVAT_VertexStreamData:
		return "VertexStreamData";
	case GPUVAT_IndexData:
		return "IndexData";
	case GPUVAT_Texture:
		return "Texture";
	case GPUVAT_RenderTarget:
		return "RenderTarget";
	case GPUVAT_DepthStencil:
		return "DepthStencil";
	case GPUVAT_QueryMemory:
		return "Query";
	case GPUVAT_ConstantBufferData:
		return "ConstantBuffer";
	case GPUVAT_ShaderInstructionsMemory:
		return "ShaderInstructions";
	case GPUVAT_StatsMemory:
		return "Stats";
	case GPUVAT_RegisterFileDumpMemory:
		return "RegFileDump";
	default:
		return "(Unknown)";
	}
}

static const char* const AllocFormatToString(const gpuFormat fmt)
{
	switch (fmt)
	{
	case GPUFMT_Unknown:
		return "Unknown";

	case GPUFMT_CommandBufferPacketData:
		return "Command";
	case GPUFMT_VertexGeneral: // Generalized vertex data (could be any underlying type)
		return "General";
	case GPUFMT_VertexPosT_UINT16:
		return "PosT_UINT16";
	case GPUFMT_VertexInvPosT_UNORM24: // Special format, only used for transformed (UNORM 24-bit) inverse-Z position
		return "InvPosT_UNORM24";
	case GPUFMT_VertexTexcoord_UNORM16:
		return "Texcoord_UNORM16";
	case GPUFMT_VertexColor_R8G8B8A8_UNORM8:
		return "Color_R8G8B8A8_UNORM8";

	case GPUFMT_Index_UINT8: // Not yet implemented
		return "UINT8";
	case GPUFMT_Index_UINT16:
		return "UINT16";
	case GPUFMT_Index_UINT32: // Not yet implemented
		return "UINT32";

	case GPUFMT_TexR8G8B8A8:
		return "TexR8G8B8A8";
	case GPUFMT_TexR8G8B8X8:
		return "TexR8G8B8X8";
	case GPUFMT_TexR4G4B4A4:
		return "TexR4G4B4A4";
	case GPUFMT_TexR5G6B5:
		return "TexR5G6B5";
	case GPUFMT_TexR3G3B2: // Not yet implemented
		return "TexR3G3B2";

	case GPUFMT_TexDXT1: // Not yet implemented
		return "TexDXT1";
	case GPUFMT_TexDXT3: // Not yet implemented
		return "TexDXT3";
	case GPUFMT_TexDXT5: // Not yet implemented
		return "TexDXT5";

	case GPUFMT_TexD16: // Not yet implemented
		return "TexD16";
	case GPUFMT_TexD24: // Not yet implemented
		return "TexD24";
	case GPUFMT_TexD24S8: // Not yet implemented
		return "TexD24S8";

	case GPUFMT_QueryData: // Not yet implemented
		return "QueryData";

	case GPUFMT_ConstFBufferData:
		return "ConstFloat";
	case GPUFMT_ConstIBufferData: // Not yet implemented
		return "ConstInt";
	case GPUFMT_ConstBBufferData: // Not yet implemented
		return "ConstBool";

	case GPUFMT_VertexShaderInstructions:
		return "VertexShader";
	case GPUFMT_PixelShaderInstructions: // Not yet implemented
		return "PixelShader";
	
	case GPUFMT_StatsBuffer:
		return "Stats";

	case GPUFMT_RegFileDump:
		return "RegFileDump";

	default:
		return "(Unknown)";
	}
}

static void ultostr_commas(unsigned val, char* outBuf)
{
	bool extend = false;
#pragma warning(push)
#pragma warning(disable:4996)
	if (val >= 1000000000)
	{
		outBuf += sprintf(outBuf, "%u,", val / 1000000000);
		extend = true;
	}
	if (val >= 1000000)
	{
		outBuf += sprintf(outBuf, extend ? "%03u," : "%u,", (val / 1000000) % 1000);
		extend = true;
	}
	if (val >= 1000)
	{
		outBuf += sprintf(outBuf, extend ? "%03u," : "%u,", (val / 1000) % 1000);
		extend = true;
	}
	sprintf(outBuf, extend ? "%03u" : "%u", val % 1000);
#pragma warning(pop)
}

static void InsertItemIntoReport(const liveAllocation& thisAlloc, HWND dialogWnd)
{
	const unsigned itemCount = (const unsigned)SendDlgItemMessageA(dialogWnd, IDC_LST_ALLOCINFO, LVM_GETITEMCOUNT, 0, 0);
	LVITEMA itemStruct = {0};
	itemStruct.mask = LVIF_COLUMNS;
	itemStruct.iItem = itemCount;
	itemStruct.iSubItem = 0;
	itemStruct.cColumns = CE_COUNT;
	const int itemIndex = (const int)SendDlgItemMessageA(dialogWnd, IDC_LST_ALLOCINFO, LVM_INSERTITEM, 0, (LPARAM)&itemStruct);

	if (itemIndex >= 0)
	{
		itemStruct.mask = LVIF_TEXT;
		itemStruct.iItem = itemIndex;
		for (ColumnEnum x = CE_Name; x < CE_COUNT; x = (const ColumnEnum)(x + 1) )
		{
			itemStruct.iSubItem = x;
			char printBuffer[256] = {0};
			switch (x)
			{
			case CE_Name:
#ifdef _DEBUG
				itemStruct.pszText = thisAlloc.debugAllocationName ? (LPSTR)thisAlloc.debugAllocationName : (LPSTR)"(None)";
#else
				itemStruct.pszText = (LPSTR)"(None)";
#endif
				break;
			case CE_Address:
#pragma warning(push)
#pragma warning(disable:4996)
				sprintf(printBuffer, "0x%08X", static_cast<const unsigned>( (const char* const)thisAlloc.allocAddress - nullBaseAddress) );
				itemStruct.pszText = (LPSTR)printBuffer;
				break;
			case CE_Size:
				ultostr_commas(thisAlloc.allocSize, printBuffer);
				break;
			case CE_Width:
				sprintf(printBuffer, "%u", thisAlloc.width);
				itemStruct.pszText = (LPSTR)printBuffer;
				break;
			case CE_Height:
				sprintf(printBuffer, "%u", thisAlloc.height);
				itemStruct.pszText = (LPSTR)printBuffer;
				break;
			case CE_Depth:
				sprintf(printBuffer, "%u", thisAlloc.depth);
				itemStruct.pszText = (LPSTR)printBuffer;
				break;
			case CE_Mips:
				sprintf(printBuffer, "%u", thisAlloc.numMipLevels);
#pragma warning(pop)
				itemStruct.pszText = (LPSTR)printBuffer;
				break;
			case CE_Usage:
				itemStruct.pszText = (LPSTR)AllocUsageToString(thisAlloc.usage);
				break;
			case CE_Format:
				itemStruct.pszText = (LPSTR)AllocFormatToString(thisAlloc.format);
				break;
			}

			SendDlgItemMessageA(dialogWnd, IDC_LST_ALLOCINFO, LVM_SETITEMTEXT, itemIndex, (LPARAM)&itemStruct);
		}
	}
}

GPUMemoryMapDlg::GPUMemoryMapDlg()
{
}

GPUMemoryMapDlg::~GPUMemoryMapDlg()
{
	ResetDialog();
}

void GPUMemoryMapDlg::UpdateDialog()
{
	if (GPUMemoryMapDialog == NULL)
		return;

	// Check to see if we're already up to date with the latest allocator generation:
	const unsigned currentAllocGeneration = GPUGetAllocatorGeneration();
	if (lastUpdatedAllocGeneration == currentAllocGeneration)
		return;
	lastUpdatedAllocGeneration = currentAllocGeneration;

	unsigned allocationSizesTotalBytes[GPUVAT_MAX_NUM_ALLOCATION_USAGES] = {0};
	unsigned totalAllocationSizeBytes = 0;
	unsigned totalRequestedSizeBytes = 0;

	RedrawBitmapsAndFillData(totalAllocationSizeBytes, totalRequestedSizeBytes, allocationSizesTotalBytes);
	RedrawDialogs(totalAllocationSizeBytes, totalRequestedSizeBytes, allocationSizesTotalBytes);

	RedrawWindow(GPUMemoryMapDialog, NULL, NULL, RDW_INVALIDATE | RDW_ERASE);

	PumpDialogMessages();
}

void GPUMemoryMapDlg::RedrawDialogs(const unsigned totalAllocationSizeBytes, const unsigned totalRequestedSizeBytes, const unsigned (&allocationSizesTotalBytes)[GPUVAT_MAX_NUM_ALLOCATION_USAGES])
{
	if (GPUMemoryMapDialog == NULL)
		return;

	SendDlgItemMessageA(GPUMemoryMapDialog, IDC_LST_CATEGORYLIST, LB_RESETCONTENT, 0, 0);

#pragma warning(push)
#pragma warning(disable:4996)
	char stringBuffer[256] = {0};
	sprintf(stringBuffer, "Unallocated: %uKB (%f%%)", (GPU_DRAM_TOTAL_CAPACITY_BYTES - totalAllocationSizeBytes) / 1024, (GPU_DRAM_TOTAL_CAPACITY_BYTES - totalAllocationSizeBytes) / (const float)GPU_DRAM_TOTAL_CAPACITY_BYTES * 100.0f);
	SendDlgItemMessageA(GPUMemoryMapDialog, IDC_LST_CATEGORYLIST, LB_INSERTSTRING, -1, (LPARAM)stringBuffer);

	for (unsigned x = 0; x < GPUVAT_MAX_NUM_ALLOCATION_USAGES; ++x)
	{
		if (allocationSizesTotalBytes[x] < 1024)
			sprintf(stringBuffer, "%s: %uB (%f%%)", UsageStringsMap[x], allocationSizesTotalBytes[x], allocationSizesTotalBytes[x] / (const float)GPU_DRAM_TOTAL_CAPACITY_BYTES * 100.0f);
		else
			sprintf(stringBuffer, "%s: %uKB (%f%%)", UsageStringsMap[x], allocationSizesTotalBytes[x] / 1024, allocationSizesTotalBytes[x] / (const float)GPU_DRAM_TOTAL_CAPACITY_BYTES * 100.0f);
		SendDlgItemMessageA(GPUMemoryMapDialog, IDC_LST_CATEGORYLIST, LB_INSERTSTRING, -1, (LPARAM)stringBuffer);
	}

	sprintf(stringBuffer, "Wasted Padding: %uKB (%f%%)", (totalAllocationSizeBytes - totalRequestedSizeBytes) / 1024, (totalAllocationSizeBytes - totalRequestedSizeBytes) / (const float)GPU_DRAM_TOTAL_CAPACITY_BYTES * 100.0f);
	SendDlgItemMessageA(GPUMemoryMapDialog, IDC_LST_CATEGORYLIST, LB_INSERTSTRING, -1, (LPARAM)stringBuffer);
#pragma warning(pop)

	// Restore our original selected item:
	SendDlgItemMessageA(GPUMemoryMapDialog, IDC_LST_CATEGORYLIST, LB_SETCURSEL, (currentFilterUsage == GPUVAT_Unknown) ? -1 : currentFilterUsage + 1, 0); // +1 because GPUVAT_Unknown occupies the first slot, so everything else gets bumped down by +1

	// Repopulate our alloc info list-view:
	SendDlgItemMessageA(GPUMemoryMapDialog, IDC_LST_ALLOCINFO, LVM_DELETEALLITEMS, 0, 0);

	const auto insertItemsFilteredCallback = [this](const liveAllocation& thisAllocation)
	{
		if (currentFilterUsage == GPUVAT_Unknown ||
			currentFilterUsage == thisAllocation.usage)
		{
			InsertItemIntoReport(thisAllocation, GPUMemoryMapDialog);
		}
	};

	IterateAllLiveAllocs(insertItemsFilteredCallback);
}

void GPUMemoryMapDlg::RedrawBitmapsAndFillData(unsigned& totalAllocationSizeBytes, unsigned& totalRequestedSizeBytes, unsigned (&allocationSizesTotalBytes)[GPUVAT_MAX_NUM_ALLOCATION_USAGES])
{
	if (!mapBitmapBits || !barBitmapBits)
		return;

	memset(mapBitmapBits, UNALLOCATED_COLOR, MAP_BITMAP_WIDTH_PIXELS * MAP_BITMAP_HEIGHT_PIXELS * sizeof(D3DCOLOR) );
	memset(barBitmapBits, UNALLOCATED_COLOR, BAR_BITMAP_WIDTH_PIXELS * BAR_BITMAP_HEIGHT_PIXELS * sizeof(D3DCOLOR) );

	const auto updateMapBitmapDataCallback = [&](const liveAllocation& thisAlloc)
	{
		const D3DCOLOR allocationColor = ColorsMap[thisAlloc.usage];

		allocationSizesTotalBytes[thisAlloc.usage] += thisAlloc.allocSize;
		totalAllocationSizeBytes += thisAlloc.allocSize;
		totalRequestedSizeBytes += thisAlloc.requestedSize;

		D3DCOLOR* const startAddr = mapBitmapBits + GPUAddrToMemoryMapTexelOffset(thisAlloc.allocAddress);
		D3DCOLOR* const endAddr = mapBitmapBits + GPUAddrToMemoryMapTexelOffset( ( (const char*)thisAlloc.allocAddress) + thisAlloc.allocSize);

		for (D3DCOLOR* addr = startAddr; addr < endAddr; ++addr)
		{
			*addr = allocationColor;
		}
	};

	IterateAllLiveAllocs(updateMapBitmapDataCallback);

	float startPercentage = 0.0f;
	for (allocationUsage allocType = GPUVAT_Unknown; allocType < GPUVAT_MAX_NUM_ALLOCATION_USAGES; allocType = (const allocationUsage)(allocType + 1) )
	{
		if (allocationSizesTotalBytes[allocType] == 0) // Skip drawing colors that have 0 allocations
			continue;

		float endPercentage = startPercentage + allocationSizesTotalBytes[allocType] / (const float)(1024 * 1024 * 1024);

		if (allocationSizesTotalBytes[allocType] / (const float)(1024 * 1024 * 1024) < (1.0f / 1024.0f) )
			endPercentage = startPercentage + (1.0f / 1024.0f);

		if (endPercentage >= 1.0f)
			endPercentage = 1.0f;

		const D3DCOLOR allocationColor = ColorsMap[allocType];

		const unsigned rowStart = (const unsigned)(startPercentage * 1024.0f);
		const unsigned rowEnd = (const unsigned)(endPercentage * 1024.0f);
		const unsigned rowLength = rowEnd - rowStart;
		for (unsigned y = 0; y < 64; ++y)
		{
			D3DCOLOR* const startPtr = barBitmapBits + (y * 1024 + rowStart);
			D3DCOLOR* const endPtr = barBitmapBits + (y * 1024 + rowEnd);
			for (D3DCOLOR* writePtr = startPtr; writePtr < endPtr; ++writePtr)
			{
				*writePtr = allocationColor;
			}
		}

		startPercentage = endPercentage;
	}
}

INT_PTR GPUMemoryMapDlg::ClassDialogProc(_In_ HWND hWnd, _In_ UINT MSG, _In_ WPARAM wParam, _In_ LPARAM lParam)
{
	switch (MSG)
	{
	case WM_COMMAND:
		switch (LOWORD(wParam) )
		{
			// Any clicks on the category list-box should redraw the dialog because our filtering category may have changed
			case IDC_LST_CATEGORYLIST:
			{
				const int currSelectionIndex = (const int)SendDlgItemMessageA(GPUMemoryMapDialog, IDC_LST_CATEGORYLIST, LB_GETCURSEL, 0, 0);
				if (currSelectionIndex == LB_ERR || currSelectionIndex == GPUVAT_Unknown || currSelectionIndex > GPUVAT_MAX_NUM_ALLOCATION_USAGES)
					currentFilterUsage = GPUVAT_Unknown;
				else
					currentFilterUsage = (const allocationUsage)(currSelectionIndex - 1); // - 1 because there's an extra "Total Stats" slot that comes before "Unkown" that takes up one entry
			}
		}
		return TRUE;
	case WM_PAINT:
	{
		PAINTSTRUCT ps = {0};
		HDC dc = BeginPaint(hWnd, &ps);
		if (!dc) __debugbreak();

		// Clear the background to the default window color:
		FillRect(dc, &ps.rcPaint, (HBRUSH)(COLOR_WINDOWFRAME+1) );

		HDC memoryDC = CreateCompatibleDC(dc);
		if (!memoryDC) __debugbreak();

		if (!mapBitmap)
		{
			BITMAPINFO bmi = {0};
			bmi.bmiHeader.biSize = sizeof(bmi.bmiHeader);
			bmi.bmiHeader.biWidth = MAP_BITMAP_WIDTH_PIXELS;
			bmi.bmiHeader.biHeight = -(const int)MAP_BITMAP_HEIGHT_PIXELS;
			bmi.bmiHeader.biPlanes = 1u;
			bmi.bmiHeader.biBitCount = 32u;
			bmi.bmiHeader.biCompression = BI_RGB;
			bmi.bmiHeader.biSizeImage = 0;

			mapBitmap = CreateDIBSection(dc, &bmi, DIB_RGB_COLORS, (void**)&(mapBitmapBits), NULL, 0);
			if (!mapBitmap || !mapBitmapBits) __debugbreak();
			memset(mapBitmapBits, UNALLOCATED_COLOR, MAP_BITMAP_WIDTH_PIXELS * MAP_BITMAP_HEIGHT_PIXELS * sizeof(D3DCOLOR) );
		}

		if (!barBitmap)
		{
			BITMAPINFO bmi = {0};
			bmi.bmiHeader.biSize = sizeof(bmi.bmiHeader);
			bmi.bmiHeader.biWidth = BAR_BITMAP_WIDTH_PIXELS;
			bmi.bmiHeader.biHeight = -(const int)BAR_BITMAP_HEIGHT_PIXELS;
			bmi.bmiHeader.biPlanes = 1u;
			bmi.bmiHeader.biBitCount = 32u;
			bmi.bmiHeader.biCompression = BI_RGB;
			bmi.bmiHeader.biSizeImage = 0;

			barBitmap = CreateDIBSection(dc, &bmi, DIB_RGB_COLORS, (void**)&(barBitmapBits), NULL, 0);
			if (!barBitmap || !barBitmapBits) __debugbreak();
			memset(barBitmapBits, UNALLOCATED_COLOR, BAR_BITMAP_WIDTH_PIXELS * BAR_BITMAP_HEIGHT_PIXELS * sizeof(D3DCOLOR) );
		}

		HGDIOBJ oldSelect = SelectObject(memoryDC, mapBitmap);

		const unsigned paddingAroundEdges = 8u;

		BitBlt(dc, paddingAroundEdges, paddingAroundEdges, MAP_BITMAP_WIDTH_PIXELS, MAP_BITMAP_HEIGHT_PIXELS, memoryDC, 0, 0, SRCCOPY);

		SelectObject(memoryDC, oldSelect);

		oldSelect = (HBITMAP)SelectObject(memoryDC, barBitmap);

		const unsigned paddingBetweenGraphs = 8u;
		BitBlt(dc, paddingAroundEdges, paddingAroundEdges + MAP_BITMAP_HEIGHT_PIXELS + paddingBetweenGraphs, BAR_BITMAP_WIDTH_PIXELS, BAR_BITMAP_HEIGHT_PIXELS, memoryDC, 0, 0, SRCCOPY);

		SelectObject(memoryDC, oldSelect);

		DeleteDC(memoryDC);

		EndPaint(hWnd, &ps);
	}
		return 0;
	}
	return FALSE;
}

static INT_PTR CALLBACK GPUMemoryMapDialogProc(_In_ HWND hWnd, _In_ UINT MSG, _In_ WPARAM wParam, _In_ LPARAM lParam)
{
	GPUMemoryMapDlg* const gpuMemoryMap = (GPUMemoryMapDlg* const)GetWindowLongPtrA(hWnd, DWLP_USER);
	switch (MSG)
	{
	case WM_INITDIALOG:
		return TRUE;
	case WM_USER_DLG_INIT_MSG:
		return TRUE;
	case WM_CLOSE:
		if (gpuMemoryMap != NULL)
		{
			gpuMemoryMap->ResetDialog();
		}
		DestroyWindow(hWnd);
		return TRUE;
	case WM_COMMAND:
		if (gpuMemoryMap != NULL)
		{
			return gpuMemoryMap->ClassDialogProc(hWnd, MSG, wParam, lParam);
		}
		break;

	case WM_PAINT:
	{
		if (gpuMemoryMap != NULL)
		{
			return gpuMemoryMap->ClassDialogProc(hWnd, MSG, wParam, lParam);
		}
		break;
	}
	}
	return FALSE;
}

void GPUMemoryMapDlg::ResetDialog()
{
	lastUpdatedAllocGeneration = 0xFFFFFFFF;
	currentFilterUsage = GPUVAT_Unknown;

	if (mapBitmap)
	{
		DeleteObject(mapBitmap);
		mapBitmap = NULL;
		mapBitmapBits = NULL;
	}
	if (barBitmap)
	{
		DeleteObject(barBitmap);
		barBitmap = NULL;
		barBitmapBits = NULL;
	}

	if (GPUMemoryMapDialog != NULL)
	{
		CloseWindow(GPUMemoryMapDialog);
		DestroyWindow(GPUMemoryMapDialog);

		GPUMemoryMapDialog = NULL;
	}
}

__declspec(noinline) void GPUMemoryMapDlg::CreateMemoryMapDialog(HWND parentWindow)
{
	if (GPUMemoryMapDialog != NULL) // Only create the window once
		return;

	HMODULE currentDLLModule = NULL;
	GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, "String in module", &currentDLLModule);
	if (!currentDLLModule)
	{
		__debugbreak();
	}
	GPUMemoryMapDialog = CreateDialogA(currentDLLModule, MAKEINTRESOURCEA(IDD_DLG_GPUMEMORYMAP), parentWindow, &GPUMemoryMapDialogProc);
	if (GPUMemoryMapDialog)
	{
		SetWindowLongPtrA(GPUMemoryMapDialog, DWLP_USER, (const LONG_PTR)this);
		ShowWindow(GPUMemoryMapDialog, SW_SHOW);
		UpdateWindow(GPUMemoryMapDialog);
		SendMessageA(GPUMemoryMapDialog, WM_USER_DLG_INIT_MSG, NULL, NULL);
	}

	// Set up our columns in the allocinfo window:
	LVCOLUMNA columnStruct = {0};
	columnStruct.mask = LVCF_FMT | LVCF_TEXT | LVCF_WIDTH | LVCF_SUBITEM;
	columnStruct.fmt = LVCFMT_LEFT | LVCFMT_FIXED_WIDTH;
	for (ColumnEnum x = CE_Format; x < CE_COUNT; x = (const ColumnEnum)(x - 1) )
	{
		switch (x)
		{
		case CE_Name:
			columnStruct.cx = 400;
			break;
		case CE_Usage:
			columnStruct.cx = 110;
			break;
		case CE_Size:
			columnStruct.cx = 85;
			break;
		case CE_Format:
			columnStruct.cx = 100;
			break;
		default:
			columnStruct.cx = 75;
			break;
		}
		columnStruct.pszText = (const LPSTR)ColumnNamesMap[x];
		columnStruct.iSubItem = x;
		SendDlgItemMessageA(GPUMemoryMapDialog, IDC_LST_ALLOCINFO, LVM_INSERTCOLUMN, 0, (LPARAM)&columnStruct);
	}
}

void GPUMemoryMapDlg::PumpDialogMessages()
{
	if (!GPUMemoryMapDialog)
		return;

	// Pump the window message loop:
	MSG msg = {0};
	while (PeekMessageA(&msg, GPUMemoryMapDialog, 0, 0, PM_REMOVE) )
	{
		// Dispatch message to dialog box window if it's a dialogue message
		IsDialogMessageA(GPUMemoryMapDialog, &msg);
	}
}
