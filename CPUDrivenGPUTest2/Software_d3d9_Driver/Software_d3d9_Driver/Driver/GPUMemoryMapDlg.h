#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h> // For HWND
#include "GPUAllocator.h"

typedef unsigned long D3DCOLOR;

static const unsigned MAP_BITMAP_WIDTH_PIXELS = 1024u;
static const unsigned MAP_BITMAP_HEIGHT_PIXELS = 512u;

static const unsigned BAR_BITMAP_WIDTH_PIXELS = 1024u;
static const unsigned BAR_BITMAP_HEIGHT_PIXELS = 64u;

struct GPUMemoryMapDlg
{
	GPUMemoryMapDlg();
	~GPUMemoryMapDlg();

	__declspec(noinline) void CreateMemoryMapDialog(HWND parentWindow);
	void UpdateDialog();
	INT_PTR ClassDialogProc(_In_ HWND hWnd, _In_ UINT MSG, _In_ WPARAM wParam, _In_ LPARAM lParam);
	void ResetDialog();

	HWND GPUMemoryMapDialog = NULL;

private:
	void PumpDialogMessages();
	void RedrawBitmapsAndFillData(unsigned& totalAllocationSizeBytes, unsigned& totalRequestedSizeBytes, unsigned (&allocationSizesTotalBytes)[GPUVAT_MAX_NUM_ALLOCATION_USAGES]);
	void RedrawDialogs(const unsigned totalAllocationSizeBytes, const unsigned totalRequestedSizeBytes, const unsigned (&allocationSizesTotalBytes)[GPUVAT_MAX_NUM_ALLOCATION_USAGES]);

	unsigned lastUpdatedAllocGeneration = 0xFFFFFFFF;
	allocationUsage currentFilterUsage = GPUVAT_Unknown;

	HBITMAP mapBitmap = NULL;
	D3DCOLOR* mapBitmapBits = NULL;

	HBITMAP barBitmap = NULL;
	D3DCOLOR* barBitmapBits = NULL;
};
