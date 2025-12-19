#include "DebugOverlay.h"
#include "..\IDirect3DDevice9Hook.h"

void UpdateAndDrawOverlay_WelcomeScreen(class IDirect3DDevice9Hook* const hookDev)
{
	OverlaySetDeviceStateForText(hookDev);

	const long double lastFrameDurationSeconds = hookDev->GetLastFrameDurationSeconds();
	const long double lastFrameDurationMilliseconds = lastFrameDurationSeconds * 1000.0;
	const long double lastFrameFPS = 1.0 / lastFrameDurationSeconds;

	char overlayPrintBuffer[256] = {0};
	sprintf_s(overlayPrintBuffer, "Welcome!\n"
		"Press Ctrl + Shift + F8 at any time to disable all\n"
		"overlays.\n"
		"\n"
		"Frame %u\n"
		"%gms\n"
		"%gFPS\n"
		"\n"
		"Overlays menu:\n"
		"0: Welcome Screen\n"
		"1: Device State\n",
		hookDev->GetCurrentFrameIndex(),
		lastFrameDurationMilliseconds,
		lastFrameFPS);

	OverlayDrawString(hookDev, overlayPrintBuffer, 0, 0, D3DCOLOR_ARGB(255, 255, 255, 255) );

	if (GetAsyncKeyState('0') & 0x1)
		SetOverlayScreenState(hookDev, overlay_welcomeScreen);
	else if (GetAsyncKeyState('1') & 0x1)
		SetOverlayScreenState(hookDev, overlay_deviceState);
}
