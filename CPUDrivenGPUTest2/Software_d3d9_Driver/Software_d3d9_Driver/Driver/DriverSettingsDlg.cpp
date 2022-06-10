#include "DriverSettingsDlg.h"
#include "..\IDirect3DDevice9Hook.h"
#include "..\resource.h"

static const UINT WM_USER_DLG_INIT_MSG = WM_USER + 0x3E9F;

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
			EnableWindow(GetDlgItem(hWnd, IDC_LST_OVERRIDETEXMODE), d3d9devhook->DoOverrideTexCombinerMode() ? TRUE : FALSE);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(0)Black"), 0);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(1)White"), 1);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(2)Texture"), 2);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(3)VertColor"), 3);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(4)Texcoords"), 4);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(5)BilinearInterp"), 5);
			SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_SETITEMDATA, SendDlgItemMessageA(hWnd, IDC_LST_OVERRIDETEXMODE, LB_ADDSTRING, NULL, (LPARAM)"(6)TexModVC"), 6);
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
		while (PeekMessageA(&msg, driverOptionsDlgWnd, 0, 0, PM_REMOVE) )
		{
			// Dispatch message to dialog box window if it's a dialogue message
			IsDialogMessageA(driverOptionsDlgWnd, &msg);
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
