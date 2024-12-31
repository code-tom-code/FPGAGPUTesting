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

static const char* const depthOverrideStrings[] =
{
	"Default",
	"Z Disable",
	"Z On + Write",
	"Z On No Write"
};
static_assert(ARRAYSIZE(depthOverrideStrings) == DepthOverrideSettings::DOS_NUM_ENTRIES, "Error: String table/enum mismatch!");

static const char* const stencilOverrideStrings[] =
{
	"Default",
	"Stencil Off",
	"Stencil On"
};
static_assert(ARRAYSIZE(stencilOverrideStrings) == StencilOverrideSettings::SOS_NUM_ENTRIES, "Error: String table/enum mismatch!");

static const char* const fillModeOverrideStrings[] =
{
	"Default",
	"Solid",
	"Wireframe",
	"Point"
};
static_assert(ARRAYSIZE(fillModeOverrideStrings) == FillModeOverrideSettings::FMOS_NUM_ENTRIES, "Error: String table/enum mismatch!");

static const char* const shadeModeOverrideStrings[] =
{
	"Default",
	"Flat",
	"Gouraud"
};
static_assert(ARRAYSIZE(shadeModeOverrideStrings) == ShadeModeOverrideSettings::SMOS_NUM_ENTRIES, "Error: String table/enum mismatch!");

static const char* const cullModeOverrideStrings[] =
{
	"Default",
	"CW",
	"CCW",
	"None"
};
static_assert(ARRAYSIZE(cullModeOverrideStrings) == CullModeOverrideSettings::CMOS_NUM_ENTRIES, "Error: String table/enum mismatch!");

static const char* const fogModeOverrideStrings[] =
{
	"Default",
	"No Fog",
	"Pixel Fog",
	"Vertex Fog"
};
static_assert(ARRAYSIZE(fogModeOverrideStrings) == FogModeOverrideSettings::FOGOS_NUM_ENTRIES, "Error: String table/enum mismatch!");

static const char* const alphaBlendOverrideStrings[] =
{
	"Default",
	"Disable",
	"Multiplicative",
	"Additive",
	"Alpha",
	"Mod2x"
};
static_assert(ARRAYSIZE(alphaBlendOverrideStrings) == AlphaBlendOverrideSettings::ABOS_NUM_ENTRIES, "Error: String table/enum mismatch!");

static const char* const alphaTestOverrideStrings[] =
{
	"Default",
	"Disable",
	">= 1",
	"< 128",
	"= 255",
	"!= 0"
};
static_assert(ARRAYSIZE(alphaTestOverrideStrings) == AlphaTestOverrideSettings::ATOS_NUM_ENTRIES, "Error: String table/enum mismatch!");

static const char* const texAddressOverrideStrings[] =
{
	"Default",
	"Wrap",
	"Mirror",
	"Clamp",
	"MirrorOnce",
	"BorderDefault",
	"BorderOpaqueBlack",
	"BorderTransparentBlack",
	"BorderOpaqueWhite"
};
static_assert(ARRAYSIZE(texAddressOverrideStrings) == TexAddressOverrideSettings::TAOS_NUM_ENTRIES, "Error: String table/enum mismatch!");

static const char* const texModeOverrideStrings[] =
{
	"Default",
	"Black",
	"White",
	"Texture",
	"VertexColor",
	"Texcoords",
	"BilinearInterp",
	"TexModVC",
	"Depth",
	"Stencil"
};
static_assert(ARRAYSIZE(texModeOverrideStrings) == TexModeOverrideSettings::TMOS_NUM_ENTRIES, "Error: String table/enum mismatch!");

static const char* const texFilterOverrideStrings[] =
{
	"Default",
	"Point",
	"Linear/Point",
	"Point/Linear",
	"Trilinear",
	"Anisotropic",
};
static_assert(ARRAYSIZE(texFilterOverrideStrings) == TexFilterOverrideSettings::TFOS_NUM_ENTRIES, "Error: String table/enum mismatch!");

static void PopulateDropdownListFromStringTable(_In_ HWND hWnd, _In_ const int dialogItemID, const char* const * const stringTable, const unsigned numEntries)
{
	for (unsigned x = 0; x < numEntries; ++x)
	{
		SendDlgItemMessageA(hWnd, dialogItemID, CB_ADDSTRING, 0, (LPARAM)(stringTable[x]) );
	}
}

static INT_PTR CALLBACK DriverSettingsDialogProc(_In_ HWND hWnd, _In_ UINT MSG, _In_ WPARAM wParam, _In_ LPARAM lParam)
{
	IDirect3DDevice9Hook* const d3d9devhook = (IDirect3DDevice9Hook* const)GetWindowLongPtrA(hWnd, DWLP_USER);
	switch (MSG)
	{
	default:
		return FALSE; // Return FALSE in case of unhandled messages
	case WM_INITDIALOG:
		return TRUE;
	case WM_USER_DLG_INIT_MSG:
		if (d3d9devhook != NULL)
		{
			CheckDlgButton(hWnd, IDC_CHK_SOFTWARERAST, d3d9devhook->GetEnableSoftwareRenderingVisualization() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_ENABLESTATS, d3d9devhook->DoEnableGPUStats() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_ENABLESCANOUT, d3d9devhook->GetScanoutEnabled() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_DOUBLEBUFFERING, d3d9devhook->GetUseDoubleBuffering() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_SYNCEVERYCOMMAND, d3d9devhook->GetBaseDevice()->GetSyncEveryCommand() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_EMULATECOMMANDLISTS, d3d9devhook->GetEmulateCommandLists() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_PRINTSCRNSAVESSCREENSHOT, d3d9devhook->GetPrintScreenCapturesScreenshot() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_DISABLESTATECACHING, d3d9devhook->GetBaseDevice()->GetDisallowDeviceStateCaching() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_INVERTSCANOUTCOLORS, d3d9devhook->GetInvertScanoutColors() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_WAITFORVSYNC, d3d9devhook->GetEnableVSyncWait() ? BST_CHECKED : BST_UNCHECKED);
			CheckDlgButton(hWnd, IDC_CHK_SINGLESTEPDRAWCALLS, d3d9devhook->GetSingleStepDrawCallMode() ? BST_CHECKED : BST_UNCHECKED);

			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_SCANOUTSWIZZLER, scanoutSwizzleStrings, ARRAYSIZE(scanoutSwizzleStrings) );
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_SCANOUTSWIZZLEG, scanoutSwizzleStrings, ARRAYSIZE(scanoutSwizzleStrings) );
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_SCANOUTSWIZZLEB, scanoutSwizzleStrings, ARRAYSIZE(scanoutSwizzleStrings) );

			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_OVERRIDEZ, depthOverrideStrings, DepthOverrideSettings::DOS_NUM_ENTRIES);
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_OVERRIDESTENCIL, stencilOverrideStrings, StencilOverrideSettings::SOS_NUM_ENTRIES);
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_OVERRIDEFILLMODE, fillModeOverrideStrings, FillModeOverrideSettings::FMOS_NUM_ENTRIES);
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_OVERRIDESHADEMODE, shadeModeOverrideStrings, ShadeModeOverrideSettings::SMOS_NUM_ENTRIES);
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_OVERRIDECULLMODE, cullModeOverrideStrings, CullModeOverrideSettings::CMOS_NUM_ENTRIES);
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_OVERRIDEFOGMODE, fogModeOverrideStrings, FogModeOverrideSettings::FOGOS_NUM_ENTRIES);
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_OVERRIDEALPHABLEND, alphaBlendOverrideStrings, AlphaBlendOverrideSettings::ABOS_NUM_ENTRIES);
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_OVERRIDEALPHATEST, alphaTestOverrideStrings, AlphaTestOverrideSettings::ATOS_NUM_ENTRIES);
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_OVERRIDETEXTUREADDRESSING, texAddressOverrideStrings, TexAddressOverrideSettings::TAOS_NUM_ENTRIES);
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_OVERRIDETEXTURING, texModeOverrideStrings, TexModeOverrideSettings::TMOS_NUM_ENTRIES);
			PopulateDropdownListFromStringTable(hWnd, IDC_CMB_OVERRIDEFILTERING, texFilterOverrideStrings, TexFilterOverrideSettings::TFOS_NUM_ENTRIES);

			SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLER, CB_SETCURSEL, d3d9devhook->GetScanoutSwizzleR(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLEG, CB_SETCURSEL, d3d9devhook->GetScanoutSwizzleG(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLEB, CB_SETCURSEL, d3d9devhook->GetScanoutSwizzleB(), 0);

			SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEZ, CB_SETCURSEL, d3d9devhook->GetDepthOverride(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDESTENCIL, CB_SETCURSEL, d3d9devhook->GetStencilOverride(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEFILLMODE, CB_SETCURSEL, d3d9devhook->GetFillModeOverride(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDESHADEMODE, CB_SETCURSEL, d3d9devhook->GetShadeModeOverride(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDECULLMODE, CB_SETCURSEL, d3d9devhook->GetCullModeOverride(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEFOGMODE, CB_SETCURSEL, d3d9devhook->GetFogModeOverride(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEALPHABLEND, CB_SETCURSEL, d3d9devhook->GetAlphaBlendOverride(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEALPHATEST, CB_SETCURSEL, d3d9devhook->GetAlphaTestOverride(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDETEXTUREADDRESSING, CB_SETCURSEL, d3d9devhook->GetTexAddressOverride(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDETEXTURING, CB_SETCURSEL, d3d9devhook->GetTexModeOverride(), 0);
			SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEFILTERING, CB_SETCURSEL, d3d9devhook->GetTexFilterOverride(), 0);

			char textBuffer[256] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
			_itoa(d3d9devhook->GetDrawCallSleepMicros(), textBuffer, 10);
#pragma warning(pop)
			SetDlgItemTextA(hWnd, IDC_EDIT_DRAWSLEEPMICROS, textBuffer);
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
			default:
				break; // Do nothing in the case of unexpected WM_COMMAND messages
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
			case IDC_CHK_SINGLESTEPDRAWCALLS:
				d3d9devhook->SetSingleStepDrawCallMode(IsDlgButtonChecked(hWnd, IDC_CHK_SINGLESTEPDRAWCALLS) ? true : false);
				return TRUE;
			case IDC_CMB_SCANOUTSWIZZLER:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLER, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetScanoutSwizzleR( (const setScanoutPointerCommand::eDisplayChannelSwizzle)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_SCANOUTSWIZZLEG:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLEG, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetScanoutSwizzleG( (const setScanoutPointerCommand::eDisplayChannelSwizzle)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_SCANOUTSWIZZLEB:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_SCANOUTSWIZZLEB, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetScanoutSwizzleB( (const setScanoutPointerCommand::eDisplayChannelSwizzle)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_OVERRIDEZ:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEZ, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetDepthOverride( (const DepthOverrideSettings)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_OVERRIDESTENCIL:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDESTENCIL, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetStencilOverride( (const StencilOverrideSettings)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_OVERRIDEFILLMODE:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEFILLMODE, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetFillModeOverride( (const FillModeOverrideSettings)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_OVERRIDESHADEMODE:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDESHADEMODE, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetShadeModeOverride( (const ShadeModeOverrideSettings)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_OVERRIDECULLMODE:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDECULLMODE, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetCullModeOverride( (const CullModeOverrideSettings)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_OVERRIDEFOGMODE:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEFOGMODE, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetFogModeOverride( (const FogModeOverrideSettings)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_OVERRIDEALPHABLEND:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEALPHABLEND, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetAlphaBlendOverride( (const AlphaBlendOverrideSettings)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_OVERRIDEALPHATEST:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEALPHATEST, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetAlphaTestOverride( (const AlphaTestOverrideSettings)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_OVERRIDETEXTUREADDRESSING:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDETEXTUREADDRESSING, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetTexAddressOverride( (const TexAddressOverrideSettings)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_OVERRIDETEXTURING:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDETEXTURING, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetTexModeOverride( (const TexModeOverrideSettings)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_CMB_OVERRIDEFILTERING:
			{
				const LRESULT comboboxIndex = SendDlgItemMessageA(hWnd, IDC_CMB_OVERRIDEFILTERING, CB_GETCURSEL, 0, 0);
				if (comboboxIndex >= 0)
				{
					d3d9devhook->SetTexFilterOverride( (const TexFilterOverrideSettings)comboboxIndex);
				}
			}
				return TRUE;
			case IDC_EDIT_DRAWSLEEPMICROS:
			{
				char buffer[256] = {0};
				GetDlgItemTextA(hWnd, IDC_EDIT_DRAWSLEEPMICROS, buffer, sizeof(buffer) - 1);
				d3d9devhook->SetDrawCallSleepMicros(strtoul(buffer, NULL, 10) );
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
		driverOptionsDlgWnd = NULL;//CreateDialogA(currentDLLModule, MAKEINTRESOURCEA(IDD_DRIVEROPTIONS), /*driverOptionsDlgParentWnd*/NULL, &DriverSettingsDialogProc);
		if (driverOptionsDlgWnd)
		{
			SetWindowLongPtrA(driverOptionsDlgWnd, DWLP_USER, (const LONG_PTR)d3d9devhook);
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
