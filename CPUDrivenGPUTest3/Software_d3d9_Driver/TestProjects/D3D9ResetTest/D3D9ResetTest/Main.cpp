#pragma once

#ifdef _DEBUG
	#define D3D_DEBUG_INFO 1
#else
	#undef D3D_DEBUG_INFO
#endif

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>

#include <stdio.h> // for printf

#include <d3d9.h> // for D3D9
#include <d3dx9.h> // for D3DX9

#include <vector> // for being lazy. This is just a test app after all.

#ifdef _DEBUG
	#pragma comment (lib, "d3d9.lib")
	#pragma comment (lib, "d3dx9d.lib")
#else
	#pragma comment (lib, "d3d9.lib")
	#pragma comment (lib, "d3dx9.lib")
#endif

static const char* const windowClassName = "TomsWindowClass";
static const char* const windowName = "TomsWindow";

static const unsigned windowWidth = 640u;
static const unsigned windowHeight = 480u;

static bool drawFromUserPointers = false;
static bool drawUsingPretransformedVerts = false;
static bool drawUsingVertexShader = false;
static unsigned sceneID = 0;

static WNDCLASSEXA classParams = {0};
static ATOM classAtom = 0;
static HWND wnd = NULL;
static LPDIRECT3D9 d3d9 = NULL;
static LPDIRECT3DDEVICE9 d3d9dev = NULL;
static LPDIRECT3DSURFACE9 originalBackbuffer = NULL;
static LPDIRECT3DVERTEXSHADER9 testVS = NULL;

static std::vector<LPDIRECT3D9> d3d9s;

static bool bDone = false;

struct vert3D
{
	D3DXVECTOR3 xyz; // This is a position in clip-space since we're using identity-matrices for World, View, and Proj matrices just to keep things as simple as possible
	D3DCOLOR diffuse;
	D3DXVECTOR2 texcoord0;
};

struct vert3Dpretransform
{
	D3DXVECTOR4 xyzRhw; // This is a position in screen-space
	D3DCOLOR diffuse;
	D3DXVECTOR2 texcoord0;
};

static inline const int PumpWindowsMessageLoop(HWND wnd)
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


static inline void RenderFrame(const long double timeDelta)
{
	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0, 0, 255), 1.0f, 0x00000000);
	d3d9dev->BeginScene();

	// Render stuff here!

	d3d9dev->EndScene();
	d3d9dev->Present(NULL, NULL, NULL, NULL);
}

// Make sure to call free() on the memory after you're done with it
DWORD* const LoadShaderToMemory(const char* const filename)
{
	if (!filename)
	{
		printf("Error: NULL filename passed to LoadShaderToMemory!\n");
		return NULL;
	}

	if (!*filename)
	{
		printf("Error: Empty filename passed to LoadShaderToMemory!\n");
		return NULL;
	}

	char buffer[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(buffer, "%s.cso", filename);
#pragma warning(pop)
	HANDLE hFile = CreateFileA(buffer, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN, NULL);
	if (hFile == INVALID_HANDLE_VALUE)
	{
#pragma warning(push)
#pragma warning(disable:4996)
#ifdef _M_X64
#ifdef _DEBUG
		sprintf(buffer, "..\\x64\\Debug\\%s.cso", filename);
#else
		sprintf(buffer, "..\\x64\\Release\\%s.cso", filename);
#endif
#else
#ifdef _DEBUG
		sprintf(buffer, "..\\Debug\\%s.cso", filename);
#else
		sprintf(buffer, "..\\Release\\%s.cso", filename);
#endif
#endif
#pragma warning(pop)
		hFile = CreateFileA(buffer, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN, NULL);
		if (hFile == INVALID_HANDLE_VALUE)
		{
			printf("Error: Cannot open file \"%s\" for reading!\n", filename);
			return NULL;
		}
	}

	const DWORD fileSize = GetFileSize(hFile, NULL);
	if (!fileSize)
	{
		CloseHandle(hFile);
		printf("Error getting file size\n");
		return NULL;
	}

	DWORD* const data = (DWORD* const)malloc(fileSize);
	if (!data)
	{
		CloseHandle(hFile);
		printf("Error mallocing %u bytes!\n", fileSize);
		return NULL;
	}

	DWORD bytesRead = 0;
	if (!ReadFile(hFile, data, fileSize, &bytesRead, NULL) || bytesRead != fileSize)
	{
		free(data);
		CloseHandle(hFile);
		printf("Error in ReadFile!\n");
		return NULL;
	}
	CloseHandle(hFile);

	return data;
}

LPDIRECT3DPIXELSHADER9 LoadPixelShader(const char* const filename)
{
	DWORD* const shaderMemory = LoadShaderToMemory(filename);

	LPDIRECT3DPIXELSHADER9 ret = NULL;
	if (FAILED(d3d9dev->CreatePixelShader(shaderMemory, &ret) ) || !ret)
	{
		free(shaderMemory);
		printf("Error in CreatePixelShader!\n");
		return NULL;
	}

	free(shaderMemory);

	return ret;
}

LPDIRECT3DVERTEXSHADER9 LoadVertexShader(const char* const filename)
{
	DWORD* const shaderMemory = LoadShaderToMemory(filename);

	LPDIRECT3DVERTEXSHADER9 ret = NULL;
	if (FAILED(d3d9dev->CreateVertexShader(shaderMemory, &ret) ) || !ret)
	{
		free(shaderMemory);
		printf("Error in CreateVertexShader!\n");
		return NULL;
	}

	free(shaderMemory);

	return ret;
}

void PrintWelcomeAndOptions()
{
	printf("Device Reset Test\n");
	printf("\n");
	printf("Controls:\n");
	printf("None\n");
	printf("\n");
}

static const char* const FormatToStr(const D3DFORMAT fmt)
{
	switch (fmt)
	{
	case D3DFMT_X8R8G8B8:
		return "X8R8G8B8";
	case D3DFMT_A8R8G8B8:
		return "A8R8G8G8";
	case D3DFMT_A2R10G10B10:
		return "A2R10G10B10";
	case D3DFMT_A1R5G5B5:
		return "A1R5G5B5";
	case D3DFMT_X1R5G5B5:
		return "X1R5G5B5";
	case D3DFMT_R5G6B5:
		return "R5G6B5";
	case D3DFMT_D16_LOCKABLE:
		return "D16_LOCKABLE";
	case D3DFMT_D16:
		return "D16";
	case D3DFMT_D24S8:
		return "D24S8";
	case D3DFMT_D24X8:
		return "D24X8";
	case D3DFMT_D15S1:
		return "D15S1";
	case D3DFMT_D32:
		return "D32";
	case D3DFMT_D24X4S4:
		return "D24X4S4";
	case D3DFMT_D32F_LOCKABLE:
		return "D32F_LOCKABLE";
	case D3DFMT_D32_LOCKABLE:
		return "D32_LOCKABLE";
	case D3DFMT_S8_LOCKABLE:
		return "S8_LOCKABLE";
	case D3DFMT_D24FS8:
		return "D24FS8";
	case D3DFMT_R16F:
		return "R16F";
	case D3DFMT_G16R16F:
		return "G16R16F";
	case D3DFMT_A16B16G16R16F:
		return "A16B16G16R16F";
	case D3DFMT_R32F:
		return "R32F";
	case D3DFMT_G32R32F:
		return "G32R32F";
	case D3DFMT_A32B32G32R32F:
		return "A32B32G32R32F";
	case D3DFMT_R8G8B8:
		return "R8G8B8";
	case D3DFMT_A4R4G4B4:
		return "A4R4G4B4";
	case D3DFMT_R3G3B2:
		return "R3G3B2";
	case D3DFMT_A8:
		return "A8";
	case D3DFMT_L8:
		return "L8";
	case D3DFMT_A8R3G3B2:
		return "A8R3G3B2";
	case D3DFMT_X4R4G4B4:
		return "X4R4G4B4";
	case D3DFMT_A16B16G16R16:
		return "A16B16G16R16";
	case D3DFMT_P8:
		return "P8";
	case D3DFMT_A8P8:
		return "A8P8";
	case D3DFMT_L16:
		return "L16";
	case D3DFMT_A8L8:
		return "A8L8";
	case D3DFMT_A4L4:
		return "A4L4";
	case D3DFMT_A2B10G10R10_XR_BIAS:
		return "A2B10G10R10_XR_BIAS";
	case D3DFMT_DXT1:
		return "DXT1";
	case D3DFMT_DXT2:
		return "DXT2";
	case D3DFMT_DXT3:
		return "DXT3";
	case D3DFMT_DXT4:
		return "DXT4";
	case D3DFMT_DXT5:
		return "DXT5";

	default:
		return "UnknownFmt";
	}
}

int TomCreateWindow()
{
	classParams.cbSize = sizeof(WNDCLASSEX);
	classParams.lpfnWndProc = &MyWindowProc;
	classParams.style = CS_BYTEALIGNCLIENT | CS_BYTEALIGNWINDOW | CS_HREDRAW | CS_VREDRAW;
	classParams.hInstance = (const HINSTANCE)GetModuleHandle(NULL);
	classParams.lpszClassName = windowClassName;
	classAtom = RegisterClassExA(&classParams);
	if (!classAtom)
	{
		printf("Error in RegisterClassExA. GLE: %u\n", GetLastError() );
		return 1;
	}

	wnd = CreateWindowExA(0L, (LPCSTR)classAtom, windowName, WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, windowWidth, windowHeight, NULL, NULL, classParams.hInstance, NULL);
	if (!wnd)
	{
		printf("Error in CreateWindowExA. GLE: %u\n", GetLastError() );
		return 1;
	}

	ShowWindow(wnd, SW_SHOW);
	UpdateWindow(wnd);

	return 0;
}

void TomDestroyWindow()
{
	DestroyWindow(wnd);
	wnd = NULL;
	UnregisterClassA( (LPCSTR)classAtom, classParams.hInstance);
	classAtom = 0;
	memset(&classParams, 0, sizeof(classParams) );
}

int main(const unsigned argc, const char* const argv[])
{
	PrintWelcomeAndOptions();

	if (TomCreateWindow() != 0)
		return 1;

	for (unsigned x = 0; x < 257; ++x)
	{
		LPDIRECT3D9 thisD3D9 = Direct3DCreate9(D3D_SDK_VERSION);
		d3d9s.push_back(thisD3D9);
		if (thisD3D9 == NULL)
		{
			printf("Error in Direct3DCreate9(). GLE: %u\n", GetLastError() );
			return 1;
		}
	}

	for (unsigned x = 0; x < 127; ++x)
	{
		d3d9s[x]->Release();
		d3d9s[x] = NULL;
	}

	d3d9 = d3d9s[129];

	d3d9->AddRef(); // 1
	d3d9->AddRef(); // 2
	d3d9->AddRef(); // 3
	d3d9->Release(); // 2
	d3d9->AddRef(); // 3
	d3d9->AddRef(); // 4
	d3d9->Release(); // 3
	d3d9->Release(); // 2
	d3d9->Release(); // 1
	d3d9->Release(); // 0

	const unsigned numAdapters = d3d9->GetAdapterCount();
	for (unsigned adapterID = 0; adapterID < numAdapters; ++adapterID)
	{
		D3DDISPLAYMODE currentDisplayMode = {0};
		HRESULT hr = d3d9->GetAdapterDisplayMode(adapterID, &currentDisplayMode);
		if (FAILED(hr) )
		{
			printf("Error in GetAdapterDisplayMode(%u). HR: %u\n", adapterID, hr);
			return 1;
		}

		printf("Adapter %u. Current display mode:\n", adapterID);
		const char* const displayFormat = FormatToStr(currentDisplayMode.Format);
		if (currentDisplayMode.RefreshRate)
		{
			printf("\t%ux%u@%uHz - %s (%u)\n", currentDisplayMode.Width, currentDisplayMode.Height, currentDisplayMode.RefreshRate, displayFormat, currentDisplayMode.Format);
		}
		else
		{
			printf("\t%ux%u@Default Hz - %s (%u)\n", currentDisplayMode.Width, currentDisplayMode.Height, displayFormat, currentDisplayMode.Format);
		}

		D3DADAPTER_IDENTIFIER9 ident = {0};
		hr = d3d9->GetAdapterIdentifier(adapterID, 0, &ident);
		if (FAILED(hr) )
		{
			printf("Error in GetAdapterIdentifier(%u). HR: %u\n", adapterID, hr);
			return 1;
		}
		ident.Driver[MAX_DEVICE_IDENTIFIER_STRING-1] = '\0';
		ident.Description[MAX_DEVICE_IDENTIFIER_STRING-1] = '\0';
		ident.DeviceName[31] = '\0';

		printf("Identifier info:\n");
		printf("Driver: %s\n", ident.Driver);
		printf("Description: %s\n", ident.Description);
		printf("GDI Device Name: %s\n", ident.DeviceName);
		printf("Driver Version: 0x%I64X (%I64u)\n", ident.DriverVersion.QuadPart, ident.DriverVersion.QuadPart);
		printf("\tProduct Version: 0x%04X (%u)\n", HIWORD(ident.DriverVersion.HighPart), HIWORD(ident.DriverVersion.HighPart) );
		printf("\tDriver Version: 0x%04X (%u)\n", LOWORD(ident.DriverVersion.HighPart), LOWORD(ident.DriverVersion.HighPart) );
		printf("\tDriver SubVersion: 0x%04X (%u)\n", HIWORD(ident.DriverVersion.LowPart), HIWORD(ident.DriverVersion.LowPart) );
		printf("\tDriver Build: 0x%04X (%u)\n", LOWORD(ident.DriverVersion.LowPart), LOWORD(ident.DriverVersion.LowPart) );
		printf("VendorID: 0x%08X (%u)\n", ident.VendorId, ident.VendorId);
		printf("DeviceId: 0x%08X (%u)\n", ident.DeviceId, ident.DeviceId);
		printf("SubSysId: 0x%08X (%u)\n", ident.SubSysId, ident.SubSysId);
		printf("Revision: 0x%08X (%u)\n", ident.Revision, ident.Revision);
		printf("WHQL Level: 0x%08X (%u)\n", ident.WHQLLevel, ident.WHQLLevel);
		printf("Device GUID: {%08X-%04X-%04X-%02X%02X-%02X%02X%02X%02X%02X%02X}\n", ident.DeviceIdentifier.Data1, ident.DeviceIdentifier.Data2, ident.DeviceIdentifier.Data3,
			ident.DeviceIdentifier.Data4[0], ident.DeviceIdentifier.Data4[1], ident.DeviceIdentifier.Data4[2], ident.DeviceIdentifier.Data4[3],
			ident.DeviceIdentifier.Data4[4], ident.DeviceIdentifier.Data4[5], ident.DeviceIdentifier.Data4[6], ident.DeviceIdentifier.Data4[7]);

		const unsigned numModes = d3d9->GetAdapterModeCount(adapterID, D3DFMT_X8R8G8B8);
		for (unsigned y = 0; y < numModes; ++y)
		{
			D3DDISPLAYMODE dispMode = {0};
			hr = d3d9->EnumAdapterModes(adapterID, D3DFMT_X8R8G8B8, y, &dispMode);
			if (FAILED(hr) )
			{
				printf("Error in EnumAdapterModes(adapterID=%u, FMT=%s, modeID=%u). HR=%u\n", adapterID, FormatToStr(D3DFMT_X8R8G8B8), y, hr);
				return 1;
			}

			printf("Mode %u: %ux%u@%uHz Fmt: %s (%u)\n", y, dispMode.Width, dispMode.Height, dispMode.RefreshRate, FormatToStr(dispMode.Format), dispMode.Format);
		}

		D3DCAPS9 devCaps = {};
		hr = d3d9->GetDeviceCaps(adapterID, D3DDEVTYPE_HAL, &devCaps);
		if (FAILED(hr) )
		{
			printf("Error in GetDeviceCaps(%u). HR=%u\n", adapterID, hr);
			return 1;
		}

		hr = d3d9->CheckDeviceType(adapterID, D3DDEVTYPE_HAL, D3DFMT_X8R8G8B8, D3DFMT_X8R8G8B8, FALSE);
		if (FAILED(hr) )
		{
			printf("Error in CheckDeviceType(%u). HR=%u\n", adapterID, hr);
			return 1;
		}

		hr = d3d9->CheckDeviceType(adapterID, D3DDEVTYPE_HAL, D3DFMT_X8R8G8B8, D3DFMT_X8R8G8B8, TRUE);
		if (FAILED(hr) )
		{
			printf("Error in CheckDeviceType(%u). HR=%u\n", adapterID, hr);
			return 1;
		}
	}

	D3DPRESENT_PARAMETERS d3dpp = {0};
	d3dpp.BackBufferWidth = windowWidth;
	d3dpp.BackBufferHeight = windowHeight;
	d3dpp.BackBufferFormat = D3DFMT_X8R8G8B8;
	d3dpp.BackBufferCount = 1;
	d3dpp.SwapEffect = D3DSWAPEFFECT_DISCARD;
	d3dpp.hDeviceWindow = wnd;
	d3dpp.Windowed = TRUE;
	d3dpp.EnableAutoDepthStencil = TRUE;
	d3dpp.AutoDepthStencilFormat = D3DFMT_D24X8;
	d3dpp.Flags = D3DPRESENTFLAG_DEVICECLIP | D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
	HRESULT createDeviceHR = d3d9->CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, wnd, D3DCREATE_HARDWARE_VERTEXPROCESSING | D3DCREATE_PUREDEVICE, &d3dpp, &d3d9dev);
	if (FAILED(createDeviceHR) || !d3d9dev)
	{
		printf("Error in CreateDevice(). HRESULT: 0x%08X. GLE: %u\n", createDeviceHR, GetLastError() );
		return 1;
	}

	HRESULT hr = d3d9dev->TestCooperativeLevel();
	if (FAILED(hr) )
	{
		printf("Error: TestCooperativeLevel() failed with HR=%u\n", hr);
		return 1;
	}

	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1);

	DWORD numPasses = 0;
	hr = d3d9dev->ValidateDevice(&numPasses);
	if (FAILED(hr) )
	{
		printf("Error: ValidateDevice() failed with HR=%u\n", hr);
		return 1;
	}

	d3d9dev->AddRef();
	d3d9dev->AddRef();
	d3d9dev->Release();
	d3d9dev->AddRef();
	d3d9dev->Release();
	d3d9dev->Release();

	// This is the true release:
	d3d9dev->Release();
	d3d9dev = NULL;

	TomDestroyWindow();

	if (TomCreateWindow() != 0)
		return 1;

	d3dpp.BackBufferWidth = windowWidth;
	d3dpp.BackBufferHeight = windowHeight;
	d3dpp.BackBufferFormat = D3DFMT_UNKNOWN;
	d3dpp.BackBufferCount = 1;
	d3dpp.SwapEffect = D3DSWAPEFFECT_FLIP;
	d3dpp.hDeviceWindow = wnd;
	d3dpp.Windowed = TRUE;
	d3dpp.EnableAutoDepthStencil = FALSE;
	d3dpp.AutoDepthStencilFormat = D3DFMT_UNKNOWN;
	d3dpp.Flags = 0;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_ONE;

	createDeviceHR = d3d9->CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, wnd, D3DCREATE_HARDWARE_VERTEXPROCESSING, &d3dpp, &d3d9dev);
	if (FAILED(createDeviceHR) || !d3d9dev)
	{
		printf("Error in CreateDevice(). HRESULT: 0x%08X. GLE: %u\n", createDeviceHR, GetLastError() );
		return 1;
	}

	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1);

	hr = d3d9dev->ValidateDevice(&numPasses);
	if (FAILED(hr) )
	{
		printf("Error: ValidateDevice() failed with HR=%u\n", hr);
		return 1;
	}

	d3d9dev->AddRef();
	d3d9dev->AddRef();
	d3d9dev->Release();
	d3d9dev->AddRef();
	d3d9dev->Release();
	d3d9dev->Release();

	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1);

	hr = d3d9dev->TestCooperativeLevel();
	if (FAILED(hr) )
	{
		printf("Error: TestCooperativeLevel() failed with HR=%u\n", hr);
		return 1;
	}

	hr = d3d9dev->ValidateDevice(&numPasses);
	if (FAILED(hr) )
	{
		printf("Error: ValidateDevice() failed with HR=%u\n", hr);
		return 1;
	}

	d3d9dev->Release();
	d3d9dev = NULL;

	TomDestroyWindow();

	if (TomCreateWindow() != 0)
		return 1;

	d3dpp.BackBufferWidth = windowWidth;
	d3dpp.BackBufferHeight = windowHeight;
	d3dpp.BackBufferFormat = D3DFMT_X8R8G8B8;
	d3dpp.BackBufferCount = 1;
	d3dpp.SwapEffect = D3DSWAPEFFECT_DISCARD;
	d3dpp.hDeviceWindow = wnd;
	d3dpp.Windowed = TRUE;
	d3dpp.EnableAutoDepthStencil = TRUE;
	d3dpp.AutoDepthStencilFormat = D3DFMT_D24X8;
	d3dpp.Flags = D3DPRESENTFLAG_DEVICECLIP | D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;

	createDeviceHR = d3d9->CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, wnd, D3DCREATE_HARDWARE_VERTEXPROCESSING, &d3dpp, &d3d9dev);
	if (FAILED(createDeviceHR) || !d3d9dev)
	{
		printf("Error in CreateDevice(). HRESULT: 0x%08X. GLE: %u\n", createDeviceHR, GetLastError() );
		return 1;
	}

	d3d9dev->AddRef();
	d3d9dev->AddRef();
	d3d9dev->Release();
	d3d9dev->AddRef();
	d3d9dev->Release();
	d3d9dev->Release();

	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1);

	hr = d3d9dev->TestCooperativeLevel();
	if (FAILED(hr) )
	{
		printf("Error: TestCooperativeLevel() failed with HR=%u\n", hr);
		return 1;
	}

	hr = d3d9dev->ValidateDevice(&numPasses);
	if (FAILED(hr) )
	{
		printf("Error: ValidateDevice() failed with HR=%u\n", hr);
		return 1;
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(127, 127, 127), 1.0f, 0x00000000);
	d3d9dev->Present(NULL, NULL, NULL, NULL);

	hr = d3d9dev->EvictManagedResources();
	if (FAILED(hr) )
	{
		printf("Error: EvictManagedResources() failed with HR=%u\n", hr);
		return 1;
	}

	d3dpp.BackBufferWidth = 320;
	d3dpp.BackBufferHeight = 240;
	d3dpp.BackBufferFormat = D3DFMT_X8R8G8B8;
	d3dpp.BackBufferCount = 1;
	d3dpp.SwapEffect = D3DSWAPEFFECT_DISCARD;
	d3dpp.hDeviceWindow = wnd;
	d3dpp.Windowed = TRUE;
	d3dpp.EnableAutoDepthStencil = TRUE;
	d3dpp.AutoDepthStencilFormat = D3DFMT_D24X8;
	d3dpp.Flags = D3DPRESENTFLAG_DEVICECLIP | D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
	hr = d3d9dev->Reset(&d3dpp);
	if (FAILED(hr) )
	{
		printf("Error: Reset() failed with HR=%u\n", hr);
		return 1;
	}

	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1);

	hr = d3d9dev->TestCooperativeLevel();
	if (FAILED(hr) )
	{
		printf("Error: TestCooperativeLevel() failed with HR=%u\n", hr);
		return 1;
	}

	hr = d3d9dev->ValidateDevice(&numPasses);
	if (FAILED(hr) )
	{
		printf("Error: ValidateDevice() failed with HR=%u\n", hr);
		return 1;
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(255, 127, 127), 1.0f, 0x00000000);
	d3d9dev->Present(NULL, NULL, NULL, NULL);

	Sleep(512);

	hr = d3d9dev->EvictManagedResources();
	if (FAILED(hr) )
	{
		printf("Error: EvictManagedResources() failed with HR=%u\n", hr);
		return 1;
	}

	d3dpp.BackBufferWidth = 640;
	d3dpp.BackBufferHeight = 480;
	d3dpp.BackBufferFormat = D3DFMT_X8R8G8B8;
	d3dpp.BackBufferCount = 1;
	d3dpp.SwapEffect = D3DSWAPEFFECT_DISCARD;
	d3dpp.hDeviceWindow = wnd;
	d3dpp.Windowed = TRUE;
	d3dpp.EnableAutoDepthStencil = TRUE;
	d3dpp.AutoDepthStencilFormat = D3DFMT_D24X8;
	d3dpp.Flags = D3DPRESENTFLAG_DEVICECLIP | D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
	hr = d3d9dev->Reset(&d3dpp);
	if (FAILED(hr) )
	{
		printf("Error: Reset() failed with HR=%u\n", hr);
		return 1;
	}

	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1);

	hr = d3d9dev->TestCooperativeLevel();
	if (FAILED(hr) )
	{
		printf("Error: TestCooperativeLevel() failed with HR=%u\n", hr);
		return 1;
	}

	hr = d3d9dev->ValidateDevice(&numPasses);
	if (FAILED(hr) )
	{
		printf("Error: ValidateDevice() failed with HR=%u\n", hr);
		return 1;
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(255, 127, 127), 1.0f, 0x00000000);
	d3d9dev->Present(NULL, NULL, NULL, NULL);
	
	if (FAILED(d3d9dev->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &originalBackbuffer) ) || !originalBackbuffer)
	{
		printf("Error in GetBackBuffer()\n");
		return 1;
	}

	const unsigned texMemoryAvailable = d3d9dev->GetAvailableTextureMem(); // I think the return value here is in bytes?
	printf("Available tex memory: %u\n", texMemoryAvailable);

	testVS = LoadVertexShader("testVS");
	if (!testVS)
	{
		printf("Error in LoadVertexShader()\n");
		return 1;
	}

	LARGE_INTEGER freq = {0};
	QueryPerformanceFrequency(&freq);
	const long double ldFreq = (const long double)freq.QuadPart;

	LARGE_INTEGER lastTime = {0};
	QueryPerformanceCounter(&lastTime);

	MSG msg = {0};
	while (!bDone)
	{
		if (PumpWindowsMessageLoop(wnd) < 1)
			break;

		LARGE_INTEGER currentTime = {0};
		QueryPerformanceCounter(&currentTime);
		const long double timeDeltaSeconds = (currentTime.QuadPart - lastTime.QuadPart) / ldFreq;
		lastTime = currentTime;

		RenderFrame(timeDeltaSeconds);

		Sleep(16);

		D3DRASTER_STATUS status = {0};
		d3d9dev->GetRasterStatus(0, &status); // This may be a pain to emulate (or not possible with our driver), but it shouldn't crash
	}

	DestroyWindow(wnd);
	UnregisterClassA( (LPCSTR)classAtom, classParams.hInstance);

	return 0;
}
