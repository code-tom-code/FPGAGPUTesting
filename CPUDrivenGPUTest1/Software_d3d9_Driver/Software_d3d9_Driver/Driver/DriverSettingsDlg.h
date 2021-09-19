#pragma once

#include "..\d3d9include.h"
class IDirect3DDevice9Hook;

struct DriverSettingsDlg
{
	~DriverSettingsDlg();
	void InitDialog(HWND initialCreateFocusWindow, HWND initialCreateDeviceWindow, IDirect3DDevice9Hook* const d3d9devhook);
	void UpdateDialog();

	HWND driverOptionsDlgWnd = NULL;
};
