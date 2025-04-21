#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include "D3D9Endpoint.h"
#include "..\..\Software_d3d9_Driver\INIVar.h"

#include <stdio.h>

static bool endpointInitialized = false;
HWND endpointWindow = NULL;
static const char* const windowClassName = "GPURenderer_D3D9";
static const char* const windowName = "GPURenderer_D3D9";
static const char* const dllEndpointName = "GPURenderer_D3D9";
static const unsigned windowWidth = 640u;
static const unsigned windowHeight = 480u;
static ATOM classAtom = 0;
static HINSTANCE dllHInst = NULL;
static bool bDone = false;
static const DLLEndpointMajorVersions ThisMajorVersion = InitialVersion;
static const unsigned ThisMinorVersion = 0;
ReturnMessageSignature E2HReturnMessageCallback = NULL;

BOOL WINAPI DllMain(
    _In_ HINSTANCE hinstDLL,  // handle to DLL module
    _In_ DWORD fdwReason,     // reason for calling function
    _In_ LPVOID lpvReserved )  // reserved
{
	switch (fdwReason)
	{
	case DLL_PROCESS_ATTACH:
#ifdef _DEBUG
		if (endpointInitialized == true)
		{
			__debugbreak(); // Should never have this called twice in a row...
		}
#endif
		dllHInst = hinstDLL;

		INIRegistry::InitLoadAllINIData();
		break;

	case DLL_THREAD_ATTACH:
		break;

	case DLL_THREAD_DETACH:
		break;

	case DLL_PROCESS_DETACH:
#ifdef _DEBUG
		if (endpointInitialized == true)
		{
			__debugbreak(); // Host didn't call ShutdownEndpoint() before calling FreeLibrary()
		}
#endif
		dllHInst = NULL;
		break;
	}
	return TRUE; // Success!
}

// Call this function first from the host! Returns true on success, or false on failure.
bool __stdcall InitEndpointImpl(const ReturnMessageSignature D2HReplyCallback)
{
	// Do not call this function more than once per DLL endpoint!
	if (endpointInitialized == true)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

#ifdef _DEBUG
	if (E2HReturnMessageCallback != NULL)
	{
		__debugbreak(); // This should never happen!
	}
#endif
	E2HReturnMessageCallback = D2HReplyCallback;

	endpointInitialized = true;

	return true;
}

static LRESULT CALLBACK MyWindowProc(_In_ HWND hwnd, _In_ UINT uMsg, _In_ WPARAM wParam, _In_ LPARAM lParam)
{
	switch (uMsg)
	{
	case WM_CLOSE:
		printf("WM_CLOSE\n");
		bDone = true;
		break;
	}
	return DefWindowProcA(hwnd, uMsg, wParam, lParam);
}

// Host calls this to create a window for this DLL. Returns true on success, or false on failure. Do not call this function if this is a windowless endpoint!
bool __stdcall SpawnWindowImpl(void* hwndPtrOut)
{
#ifdef _DEBUG
	if (endpointWindow != NULL)
	{
		__debugbreak(); // Only call this function once per endpoint!
	}
#endif

	WNDCLASSEXA classParams = {0};
	classParams.cbSize = sizeof(WNDCLASSEX);
	classParams.lpfnWndProc = &MyWindowProc;
	classParams.style = CS_BYTEALIGNCLIENT | CS_BYTEALIGNWINDOW | CS_HREDRAW | CS_VREDRAW;
	classParams.hInstance = dllHInst;
	classParams.lpszClassName = windowClassName;
	classAtom = RegisterClassExA(&classParams);
	if (!classAtom)
	{
		printf("Error in RegisterClassExA. GLE: %u\n", GetLastError() );
		return false;
	}

	HWND wnd = CreateWindowExA(0L, (LPCSTR)classAtom, windowName, WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, windowWidth, windowHeight, NULL, NULL, classParams.hInstance, NULL);
	if (!wnd)
	{
		printf("Error in CreateWindowExA. GLE: %u\n", GetLastError() );
		return false;
	}

	ShowWindow(wnd, SW_SHOW);
	UpdateWindow(wnd);

	if (!D3D9CreateDevice(wnd, windowWidth, windowHeight) )
	{
		printf("Error in creating and setting up the D3D9 device!\n");
		return false;
	}

	HWND* const ptrOut = static_cast<HWND* const>(hwndPtrOut);
	*ptrOut = wnd;
	endpointWindow = wnd;

	return true;
}

const int PumpWindowsMessageLoop(HWND wnd)
{
	MSG msg = {0};
	while (!bDone)
	{
		if (PeekMessageA(&msg, wnd, 0, 0, PM_NOREMOVE) )
		{
			switch (GetMessageA(&msg, wnd, 0, 0) )
			{
			case -1:
				printf("Error in GetMessageA. GLE: %u\n", GetLastError() );
				return -1;
			case 0:
				printf("WM_QUIT received, done!\n");
				return 0;
			default:
				TranslateMessage(&msg);
				DispatchMessageA(&msg);
				break;
			}
		}
		else
		{
			// No more messages
			return 1;
		}
	}
	return 1;
}

static DWORD lastMessagePumpTimestamp = 0;

// Host calls this function every time a new message needs to be processed
void __stdcall ProcessNewMessageImpl(const genericCommand* H2DCommandPacket)
{
	if (endpointWindow == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Host must first create the window with SpawnWindow() before processing any messages
#endif
		return;
	}

	if (H2DCommandPacket == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Host should never call this function with an invalid packet pointer!
#endif
		return;
	}

	const DWORD currentTimestamp = GetTickCount();
	if (currentTimestamp - lastMessagePumpTimestamp > 0)
	{
		lastMessagePumpTimestamp = currentTimestamp;
		PumpWindowsMessageLoop(endpointWindow);
	}

	D3D9HandleIncomingPacket(H2DCommandPacket);
}

void __stdcall ProcessIdleImpl()
{
	if (endpointWindow == NULL)
	{
		return;
	}

	PumpWindowsMessageLoop(endpointWindow);
}

void __stdcall ShutdownEndpointImpl()
{
#ifdef _DEBUG
	if (!endpointInitialized)
	{
		__debugbreak(); // Shutdown called on a non-initialized endpoint DLL!
	}
#endif

	bDone = true;

	D3D9ShutdownDevice();

	if (endpointWindow != NULL)
	{
		DestroyWindow(endpointWindow);
		UnregisterClassA( (LPCSTR)classAtom, dllHInst);
	}

	E2HReturnMessageCallback = NULL;

	endpointInitialized = false;
}

void __stdcall EndFrameImpl()
{
}

// It is legal for the host process to call GetDLLInfo() as many times as they would like. It should not allocate anything or change any state!
// Function returns true on success, or false on failure.
extern "C" bool __stdcall GetDLLInfo(DLLInfo* const outDLLInfo)
{
	if (!outDLLInfo)
	{
#ifdef _DEBUG
		__debugbreak(); // The host/caller may not pass a NULL pointer into this function!
#endif
		return false;
	}

	if (outDLLInfo->MAGIC != DLLINFO_MAGIC)
	{
#ifdef _DEBUG
		__debugbreak(); // DLLInfo struct is not initialized! The MAGIC and major version number fields must be filled in by the caller prior to the call to GetDLLInfo().
#endif
		return false;
	}

	if (outDLLInfo->versionMajor != ThisMajorVersion)
	{
#ifdef _DEBUG
		__debugbreak(); // Major version numbers do not match! This endpoint DLL is not compatible with this host due to an interface mismatch!
#endif
		// Overwrite the major/minor version pair in the host-given buffer so that the host knows which version this endpoint is using:
		outDLLInfo->versionMajor = ThisMajorVersion;
		outDLLInfo->versionMinor = ThisMinorVersion;
		return false;
	}

#ifdef _DEBUG
	if (dllHInst == NULL)
	{
		__debugbreak(); // Somehow this function got called before DLLMain(DLL_PROCESS_ATTACH). This should never happen!
	}
#endif

	DLLInfo endpointDLLInfo;

	endpointDLLInfo.versionMajor = ThisMajorVersion;
	endpointDLLInfo.versionMinor = ThisMinorVersion;

	endpointDLLInfo.H2DFunctions.InitEndpoint = &InitEndpointImpl;
	endpointDLLInfo.H2DFunctions.SpawnWindow = &SpawnWindowImpl;
	endpointDLLInfo.H2DFunctions.ProcessNewMessage = &ProcessNewMessageImpl;
	endpointDLLInfo.H2DFunctions.ShutdownEndpoint = &ShutdownEndpointImpl;
	endpointDLLInfo.H2DFunctions.ProcessIdle = &ProcessIdleImpl;
	endpointDLLInfo.H2DFunctions.EndFrame = &EndFrameImpl;

#pragma warning(push)
#pragma warning(disable:4996)
	strcpy(endpointDLLInfo.endpointName, dllEndpointName);
#pragma warning(pop)

	memcpy(outDLLInfo, &endpointDLLInfo, sizeof(endpointDLLInfo) );

	return true;
}
