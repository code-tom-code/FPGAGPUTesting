#include "DriverSettingsDlg.h"
#include "..\IDirect3DDevice9Hook.h"
#include "..\resource.h"

static const UINT WM_USER_DLG_INIT_MSG = WM_USER + 0x3E9F;

static const char* const scanoutSwizzleStrings[] =
{
	"Red",
	"Green",
	"Blue",
	"Alpha",
	"Black",
	"White"
};
static_assert(ARRAYSIZE(scanoutSwizzleStrings) == setScanoutPointerCommand::dcs_MAX_ITEMS, "Error: Need to update string list to match enum entries!");

static void PopulateScanoutSwizzleDropdownList(_In_ HWND hWnd, _In_ const int dialogItemID)
{
	for (unsigned x = 0; x < ARRAYSIZE(scanoutSwizzleStrings); ++x)
	{
		SendDlgItemMessageA(hWnd, dialogItemID, CB_ADDSTRING, 0, (LPARAM)(scanoutSwizzleStrings[x]) );
	}
}

static INT_PTR CALLBACK DriverSettingsDialogProc(_In_ HWND hWnd, _In_ UINT MSG, _In_ WPARAM wParam, _In_ LPARAM lParam)
{
	IDirect3DDevice9Hook* const d3d9devhook = (IDirect3DDevice9Hook* const)GetWindowLongPtrA(hWnd, DWL_USER);
	switch (MSG)
	{
	case WM_INITDIALOG:
		return TRUE;
	case WM_USER_DLG_INIT_MSG:
		if (d3d9devhook != NULL)
		{
			CheckDlgButton(hWnd, IDC_CHK_SOFTWARERAST, d3d9devhook->GetEnableSoftwareRenderingVisualization() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_ENABLESTATS, d3d9devhook->DoEnableGPUStats() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_ENABLESCANOUT, d3d9devhook->GetScanoutEnabled() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_DOUBLEBUFFERING, d3d9devhook->GetUseDoubleBuffering() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_OVERRIDETEXMODE, d3d9devhook->DoOverrideTexCombinerMode() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_SYNCEVERYCOMMAND, d3d9devhook->GetBaseDevice()->GetSyncEveryCommand() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_EMULATECOMMANDLISTS, d3d9devhook->GetEmulateCommandLists() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_PRINTSCRNSAVESSCREENSHOT, d3d9devhook->GetPrintScreenCapturesScreenshot() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_DISABLESTATECACHING, d3d9devhook->GetBaseDevice()->GetDisallowDeviceStateCaching() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_INVERTSCANOUTCOLORS, d3d9devhook->GetInvertScanoutColors() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_WAITFORVSYNC, d3d9devhook->GetEnableVSyncWait() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_FORCEDISABLEDEPTH, d3d9devhook->GetForceDisableDepth() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_SINGLESTEPDRAWCALLS, d3d9devhook->GetSingleStepDrawCallMode() ? BST_CHECKED : BST_UNCHECKED);
			PopulateScanoutSwizzleDropdownList(hWnd, IDC_CMB_SCANOUTSWIZZLER);
			PopulateScanoutSwizzleDropdownList(hWnd, IDC_CMB_SCANOUTSWIZZLEG);
			PopulateScanoutSwizzleDropdownList(hWnd, IDC_CMB_SCANOUTSWIZZLEB);
			SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLER, CB_SETCURSEL, d3d9devhook->GetScanoutSwizzleR(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLEG, CB_SETCURSEL, d3d9devhook->GetScanoutSwizzleG(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLEB, CB_SETCURSEL, d3d9devhook->GetScanoutSwizzleB(), 0);
			EnableWindow(GetDlgItem(hWnd, IDC_LST_OVERRIDETEXMODE), d3d9devhook->DoOverrideTexCombinerMode() ? TRUE : FALSE);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(0)Black"), 0);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(1)White"), 1);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(2)Texture"), 2);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(3)VertColor"), 3);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(4)Texcoords"), 4);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(5)BilinearInterp"), 5);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(6)TexModVC"), 6);
			char textBuffer[256] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
			_itoa(d3d9devhook->GetDrawCallSleepMicros(), textBuffer, 10);
#pragma warning(pop)
			SetDlgItemTextA(hWnd, IDC_EDIT_DRAWSLEEPMICROS, textBuffer);
			if (d3d9devhook->DoOverrideTexCombinerMode() )
			{
				SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETCURSEL, d3d9devhook->GetOverrideTexCombinerMode(), 0);
			}
			static_assert(cbm_MAX_NUM_COMBINER_MODES == 7, "Must extend strings to match list of combiner modes!");
		}
		return TRUE;
	case WM_CLOSE:
		DestroyWindow(hWnd);
		return TRUE;
	case WM_COMMAND:
		if (d3d9devhook != NULL)
		{
			switch (LOWORD(wParam) )
			{
			case IDC_CHK_SOFTWARERAST:
				d3d9devhook->SetEnableSoftwareRenderingVisualization(IsDlgButtonChecked(hWnd, IDC_CHK_SOFTWARERAST) ? true : false);
				return TRUE;
			case IDC_CHK_ENABLESTATS:
				d3d9devhook->SetEnableGPUStats(IsDlgButtonChecked(hWnd, IDC_CHK_ENABLESTATS) ? true : false);
				if (IsDlgButtonChecked(hWnd, IDC_CHK_ENABLESTATS) )
				{
					d3d9devhook->GetDeviceStats().CreateStatsDialog(hWnd);
				}
				return TRUE;
			case IDC_BTN_OPENMEMORYSTATS:
				d3d9devhook->GetDeviceMemoryMapDialog().CreateMemoryMapDialog(hWnd);
				return TRUE;
			case IDC_CHK_ENABLESCANOUT:
				d3d9devhook->SetScanoutEnabled(IsDlgButtonChecked(hWnd, IDC_CHK_ENABLESCANOUT) ? true : false);
				return TRUE;
			case IDC_CHK_DOUBLEBUFFERING:
				d3d9devhook->SetUseDoubleBuffering(IsDlgButtonChecked(hWnd, IDC_CHK_DOUBLEBUFFERING) ? true : false);
				return TRUE;
			case IDC_CHK_SYNCEVERYCOMMAND:
				d3d9devhook->GetBaseDevice()->SetSyncEveryCommand(IsDlgButtonChecked(hWnd, IDC_CHK_SYNCEVERYCOMMAND) ? true : false);
				return TRUE;
			case IDC_CHK_EMULATECOMMANDLISTS:
				d3d9devhook->SetEmulateCommandLists(IsDlgButtonChecked(hWnd, IDC_CHK_EMULATECOMMANDLISTS) ? true : false);
				return TRUE;
			case IDC_CHK_PRINTSCRNSAVESSCREENSHOT:
				d3d9devhook->SetPrintScreenCapturesScreenshot(IsDlgButtonChecked(hWnd, IDC_CHK_PRINTSCRNSAVESSCREENSHOT) ? true : false);
				return TRUE;
			case IDC_CHK_DISABLESTATECACHING:
				d3d9devhook->GetBaseDevice()->SetDisallowDeviceStateCaching(IsDlgButtonChecked(hWnd, IDC_CHK_DISABLESTATECACHING) ? true : false);
				return TRUE;
			case IDC_CHK_INVERTSCANOUTCOLORS:
				d3d9devhook->SetInvertScanoutColors(IsDlgButtonChecked(hWnd, IDC_CHK_INVERTSCANOUTCOLORS) ? true : false);
				return TRUE;
			case IDC_CHK_WAITFORVSYNC:
				d3d9devhook->SetEnableVSyncWait(IsDlgButtonChecked(hWnd, IDC_CHK_WAITFORVSYNC) ? true : false);
				return TRUE;
			case IDC_CHK_FORCEDISABLEDEPTH:
				d3d9devhook->SetForceDisableDepth(IsDlgButtonChecked(hWnd, IDC_CHK_FORCEDISABLEDEPTH) ? true : false);
				return TRUE;
			case IDC_CHK_SINGLESTEPDRAWCALLS:
				d3d9devhook->SetSingleStepDrawCallMode(IsDlgButtonChecked(hWnd, IDC_CHK_SINGLESTEPDRAWCALLS) ? true : false);
				return TRUE;
			case IDC_CMB_SCANOUTSWIZZLER:
			{
				const int comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLER, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetScanoutSwizzleR( (const setScanoutPointerCommand::eDisplayChannelSwizzle)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_SCANOUTSWIZZLEG:
			{
				const int comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLEG, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetScanoutSwizzleG( (const setScanoutPointerCommand::eDisplayChannelSwizzle)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_SCANOUTSWIZZLEB:
			{
				const int comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLEB, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetScanoutSwizzleB( (const setScanoutPointerCommand::eDisplayChannelSwizzle)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CHK_OVERRIDETEXMODE:
				if (IsDlgButtonChecked(hWnd, IDC_CHK_OVERRIDETEXMODE) )
				{
					EnableWindow(GetDlgItem(hWnd, IDC_LST_OVERRIDETEXMODE), TRUE);
					d3d9devhook->SetOverrideTexCombinerMode(SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_GETCURSEL, NULL, NULL) );
				}
				else
				{
					EnableWindow(GetDlgItem(hWnd, IDC_LST_OVERRIDETEXMODE), FALSE);
					d3d9devhook->SetOverrideTexCombinerMode(-1);
					SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETCURSEL, (WPARAM)-1, NULL);
				}
				return TRUE;
			case IDC_EDIT_DRAWSLEEPMICROS:
			{
				char buffer[256] = {0};
				GetDlgItemTextA(hWnd, IDC_EDIT_DRAWSLEEPMICROS, buffer, sizeof(buffer) - 1);
				d3d9devhook->SetDrawCallSleepMicros(strtoul(buffer, NULL, 10) );
			}
				return TRUE;
			case IDC_LST_OVERRIDETEXMODE:
				switch (HIWORD(wParam))
				{
				case LBN_SELCHANGE:
					const int listboxIndex = SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_GETCURSEL, NULL, NULL);
					if (listboxIndex >= 0)
					{
						d3d9devhook->SetOverrideTexCombinerMode(SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_GETITEMDATA, listboxIndex, NULL) );
					}
					break;
				}
				return TRUE;
			}
			break;
		}
	}
	return FALSE;
}

void DriverSettingsDlg::InitDialog(HWND initialCreateFocusWindow, HWND initialCreateDeviceWindow, IDirect3DDevice9Hook* const d3d9devhook)
{
	if (driverOptionsDlgWnd != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Only call this function once!
#endif
		return;
	}

	HWND driverOptionsDlgParentWnd = NULL;
	if (initialCreateFocusWindow)
		driverOptionsDlgParentWnd = initialCreateFocusWindow;
	else
		driverOptionsDlgParentWnd = initialCreateDeviceWindow;

	if (driverOptionsDlgParentWnd != NULL)
	{
		HMODULE currentDLLModule = NULL;
		GetModuleHandleExA(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, "String in module", &currentDLLModule);
		if (!currentDLLModule)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return;
		}
		driverOptionsDlgWnd = CreateDialogA(currentDLLModule, MAKEINTRESOURCEA(IDD_DRIVEROPTIONS), driverOptionsDlgParentWnd, &DriverSettingsDialogProc);
		if (driverOptionsDlgWnd)
		{
			SetWindowLongPtrA(driverOptionsDlgWnd, DWL_USER, (size_t)d3d9devhook);
			ShowWindow(driverOptionsDlgWnd, SW_SHOW);
			UpdateWindow(driverOptionsDlgWnd);
			SendMessageA(driverOptionsDlgWnd, WM_USER_DLG_INIT_MSG, NULL, NULL);
		}
	}
}

void DriverSettingsDlg::UpdateDialog()
{
	// Process dialog messages for our driver options dialog window:
	if (driverOptionsDlgWnd != NULL)
	{
		MSG msg = {0};
		while (PeekMessageA(&msg, NULL, 0, 0, PM_REMOVE) )
		{
			// Dispatch message to dialog box window if it's a dialog message
			if (IsDialogMessageA(driverOptionsDlgWnd, &msg) )
			{
			}
			else
			{
				TranslateMessage(&msg);
				DispatchMessageA(&msg);
			}
		}
	}
}

DriverSettingsDlg::~DriverSettingsDlg()
{
	if (driverOptionsDlgWnd != NULL)
	{
		CloseWindow(driverOptionsDlgWnd);
		DestroyWindow(driverOptionsDlgWnd);
	}
}
