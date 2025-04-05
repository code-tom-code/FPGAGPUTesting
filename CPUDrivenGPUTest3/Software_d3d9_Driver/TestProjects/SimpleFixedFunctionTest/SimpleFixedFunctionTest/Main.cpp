// Look Ma, no shaders!
// This Fixed-function test is meant to exercise some of the D3D9 fixed-function features.
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

static LPDIRECT3D9 d3d9 = NULL;
static LPDIRECT3DDEVICE9 d3d9dev = NULL;
static LPDIRECT3DSURFACE9 originalBackbuffer = NULL;
static LPDIRECT3DTEXTURE9 boundTexture2D = NULL;

static bool bDone = false;

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

static const unsigned short cubeIndices[2 * 3 * 6] =
{
	0, 1, 2,    // side 1
    2, 1, 3,
    4, 0, 6,    // side 2
    6, 0, 2,
    7, 5, 6,    // side 3
    6, 5, 4,
    3, 1, 7,    // side 4
    7, 1, 5,
    4, 5, 0,    // side 5
    0, 5, 1,
    3, 7, 2,    // side 6
    2, 7, 6,
};

struct protoVert3D
{
	D3DXVECTOR3 xyz;
	D3DXVECTOR2 texcoord;
};

static inline void RenderFrame(const long double timeDelta)
{
	protoVert3D cubeVerts[8];
	for (unsigned z = 0; z < 2; ++z)
	{
		for (unsigned y = 0; y < 2; ++y)
		{
			for (unsigned x = 0; x < 2; ++x)
			{
				protoVert3D& thisVert = cubeVerts[x + y * 2 + z * 4];
				thisVert.xyz.x = (const float)(x & 0x1) - 0.5f;
				thisVert.xyz.y = (const float)(y & 0x1) - 0.5f;
				thisVert.xyz.z = (const float)(z & 0x1) - 0.5f;

				thisVert.texcoord.x = (const float)(x & 0x1);
				thisVert.texcoord.y = (const float)(z & 0x1);
			}
		}
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0, 0, 255), 1.0f, 0x00000000);
	d3d9dev->BeginScene();

	D3DXMATRIXA16 world, view, proj;
	D3DXMatrixPerspectiveFovRH(&proj, D3DXToRadian(90.0f), 1.0f, 1.0f / 1024.0f, 1024.0f);

	const D3DXVECTOR3 eye(0.0f, 1.0f, -1.0f);
	const D3DXVECTOR3 at(0.0f, 0.0f, 0.0f);
	const D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
	D3DXMatrixLookAtRH(&view, &eye, &at, &up);

	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);

	d3d9dev->SetTransform(D3DTS_VIEW, &view);
	d3d9dev->SetTransform(D3DTS_PROJECTION, &proj);

	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_TEX1);

	d3d9dev->SetTexture(0, boundTexture2D);
	d3d9dev->SetTexture(1, boundTexture2D);

	const float oneF = 1.0f;
	const float zeroF = 0.0f;

	static float angle = 0.0f;

	D3DXMATRIXA16 texRotMat;
	D3DXMatrixRotationZ(&texRotMat, angle);

	d3d9dev->SetTextureStageState(0, D3DTSS_COLOROP, D3DTOP_BUMPENVMAPLUMINANCE);
	d3d9dev->SetTextureStageState(0, D3DTSS_BUMPENVMAT00, *(const DWORD* const)&(texRotMat.m[0][0]) );
	d3d9dev->SetTextureStageState(0, D3DTSS_BUMPENVMAT01, *(const DWORD* const)&(texRotMat.m[1][0]));
	d3d9dev->SetTextureStageState(0, D3DTSS_BUMPENVMAT10, *(const DWORD* const)&(texRotMat.m[0][1]));
	d3d9dev->SetTextureStageState(0, D3DTSS_BUMPENVMAT11, *(const DWORD* const)&(texRotMat.m[1][1]));
	d3d9dev->SetTextureStageState(0, D3DTSS_BUMPENVLSCALE, *(const DWORD* const)&oneF);
	d3d9dev->SetTextureStageState(0, D3DTSS_BUMPENVLOFFSET, *(const DWORD* const)&zeroF);
	d3d9dev->SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1);
	d3d9dev->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_DIFFUSE);
	d3d9dev->SetTextureStageState(1, D3DTSS_COLOROP, D3DTOP_MODULATE);
	d3d9dev->SetTextureStageState(1, D3DTSS_COLORARG1, D3DTA_DIFFUSE);
	d3d9dev->SetTextureStageState(1, D3DTSS_COLORARG2, D3DTA_TEXTURE);
	d3d9dev->SetTextureStageState(1, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1);
	d3d9dev->SetTextureStageState(1, D3DTSS_ALPHAARG1, D3DTA_CURRENT);

	d3d9dev->SetRenderState(D3DRS_COLORVERTEX, FALSE);

	//d3d9dev->SetTransform(D3DTS_TEXTURE0, &texRotMat);

	D3DXMatrixRotationY(&world, D3DXToRadian(45.0f + angle * 10.0f) );
	d3d9dev->SetTransform(D3DTS_WORLD, &world);

	angle = (const float)(timeDelta + angle);

	D3DXMATRIXA16 wv;
	D3DXMATRIXA16 wvp;
	D3DXMatrixMultiply(&wv, &world, &view);
	D3DXMatrixMultiply(&wvp, &wv, &proj);
	d3d9dev->SetVertexShaderConstantF(0, &wvp.m[0][0], (sizeof(wvp) + 0xF) / (sizeof(float) * 4) );

	d3d9dev->SetVertexShader(NULL);
	d3d9dev->SetPixelShader(NULL);

	d3d9dev->DrawIndexedPrimitiveUP(D3DPT_TRIANGLELIST, 0, 8, 2 * 6, cubeIndices, D3DFMT_INDEX16, &cubeVerts, sizeof(cubeVerts[0]) );

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
#ifdef _DEBUG
		sprintf(buffer, "..\\Debug\\%s.cso", filename);
#else
		sprintf(buffer, "..\\Release\\%s.cso", filename);
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

static inline void CreateTextureResources()
{
	LPDIRECT3DTEXTURE9& currentTex2D = boundTexture2D;
	if (FAILED(d3d9dev->CreateTexture(64, 64, 1, 0, D3DFMT_A8R8G8B8, D3DPOOL_MANAGED, &currentTex2D, NULL) ) )
	{
		__debugbreak();
	}

	D3DLOCKED_RECT d3dlr = {0};
	currentTex2D->LockRect(0, &d3dlr, NULL, 0);

	D3DCOLOR* const lockedColor = (D3DCOLOR* const)d3dlr.pBits;
	for (unsigned y = 0; y < 64; ++y)
	{
		for (unsigned x = 0; x < 64; ++x)
		{
			lockedColor[x + y * 64] = D3DCOLOR_ARGB(rand() & 0xFF, rand() & 0xFF, rand() & 0xFF, rand() & 0xFF);
		}
	}
	currentTex2D->UnlockRect(0);

	d3d9dev->SetTexture(0, boundTexture2D);
}

void PrintWelcomeAndControlsMessage()
{
	printf("Simple Fixed-Function Test\n");
	printf("\n");
	printf("Controls:\n");
	printf("None\n");
	printf("\n");
}

int main(const unsigned argc, const char* const argv[])
{
	PrintWelcomeAndControlsMessage();


	WNDCLASSEXA classParams = {0};
	classParams.cbSize = sizeof(WNDCLASSEX);
	classParams.lpfnWndProc = &MyWindowProc;
	classParams.style = CS_BYTEALIGNCLIENT | CS_BYTEALIGNWINDOW | CS_HREDRAW | CS_VREDRAW;
	classParams.hInstance = (const HINSTANCE)GetModuleHandle(NULL);
	classParams.lpszClassName = windowClassName;
	const ATOM classAtom = RegisterClassExA(&classParams);
	if (!classAtom)
	{
		printf("Error in RegisterClassExA. GLE: %u\n", GetLastError() );
		return 1;
	}

	HWND wnd = CreateWindowExA(0L, (LPCSTR)classAtom, windowName, WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, windowWidth, windowHeight, NULL, NULL, classParams.hInstance, NULL);
	if (!wnd)
	{
		printf("Error in CreateWindowExA. GLE: %u\n", GetLastError() );
		return 1;
	}

	ShowWindow(wnd, SW_SHOW);
	UpdateWindow(wnd);

	d3d9 = Direct3DCreate9(D3D_SDK_VERSION);
	if (!d3d9)
	{
		printf("Error in Direct3DCreate9(). GLE: %u\n", GetLastError() );
		return 1;
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

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(127, 127, 127), 1.0f, 0x00000000);
	d3d9dev->Present(NULL, NULL, NULL, NULL);
	
	if (FAILED(d3d9dev->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &originalBackbuffer) ) || !originalBackbuffer)
	{
		printf("Error in GetBackBuffer()\n");
		return 1;
	}

	CreateTextureResources();

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
	}

	DestroyWindow(wnd);
	UnregisterClassA( (LPCSTR)classAtom, classParams.hInstance);

	return 0;
}
