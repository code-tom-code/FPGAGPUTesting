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

static LPDIRECT3DVERTEXBUFFER9 cubeVB = NULL;
static LPDIRECT3DINDEXBUFFER9 cubeIB = NULL;
static LPDIRECT3DTEXTURE9 checkerboardTexture = NULL;

struct vert3D
{
	D3DXVECTOR3 pos;
	D3DXVECTOR3 normal;
	D3DCOLOR vertColor;
	D3DXVECTOR2 texcoord;
};

static bool bDone = false;

static const unsigned short staticIndices[] =
{
	0 + 0, 1 + 0, 2 + 0,
	1 + 0, 3 + 0, 2 + 0,

	0 + 4, 1 + 4, 2 + 4,
	1 + 4, 3 + 4, 2 + 4,

	0 + 8, 1 + 8, 2 + 8,
	1 + 8, 3 + 8, 2 + 8,

	0 + 12, 1 + 12, 2 + 12,
	1 + 12, 3 + 12, 2 + 12,

	0 + 16, 1 + 16, 2 + 16,
	1 + 16, 3 + 16, 2 + 16,

	0 + 20, 1 + 20, 2 + 20,
	1 + 20, 3 + 20, 2 + 20
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
	static long double time = 0.0;
	time += timeDelta;

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(127, 127, 127), 1.0f, 0x00000000);
	d3d9dev->BeginScene();

	static bool useBilinearFiltering = false;
	static bool useWrapMode = true;
	if (GetAsyncKeyState('B') & 0x8000)
	{
		useBilinearFiltering = true;
	}
	else if (GetAsyncKeyState('P') & 0x8000)
	{
		useBilinearFiltering = false;
	}
	else if (GetAsyncKeyState('W') & 0x8000)
	{
		useWrapMode = true;
	}
	else if (GetAsyncKeyState('C') & 0x8000)
	{
		useWrapMode = false;
	}
	else if (GetAsyncKeyState('R') & 0x8000)
	{
		useBilinearFiltering = false;
		useWrapMode = true;
	}

	// Render stuff here!
	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_NORMAL | D3DFVF_DIFFUSE | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0) );
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_SPECULARENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_COLORVERTEX, TRUE);
	d3d9dev->SetRenderState(D3DRS_DIFFUSEMATERIALSOURCE, D3DMCS_COLOR1);
	d3d9dev->SetRenderState(D3DRS_AMBIENTMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_EMISSIVEMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_SPECULARMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
	d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSU, useWrapMode ? D3DTADDRESS_WRAP : D3DTADDRESS_CLAMP);
	d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSV, useWrapMode ? D3DTADDRESS_WRAP : D3DTADDRESS_CLAMP);
	if (useBilinearFiltering)
	{
		d3d9dev->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
		d3d9dev->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
	}
	else
	{
		d3d9dev->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_POINT);
		d3d9dev->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_POINT);
	}
	d3d9dev->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_NONE);
	d3d9dev->SetSamplerState(0, D3DSAMP_MAXANISOTROPY, 1);
	d3d9dev->SetSamplerState(0, D3DSAMP_MAXMIPLEVEL, 0);
	d3d9dev->SetSamplerState(0, D3DSAMP_MIPMAPLODBIAS, 0);

	D3DXMATRIXA16 world, view, proj;
	D3DXVECTOR3 eye(0.0f, 1.5f, -2.0f);
	D3DXVECTOR3 at(0.0f, 0.0f, 0.0f);
	D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
	D3DXMatrixLookAtRH(&view, &eye, &at, &up);

	D3DXMatrixPerspectiveFovRH(&proj, D3DXToRadian(90.0f), 640.0f / 480.0f, 0.01f, 10.0f);

	D3DXMatrixRotationYawPitchRoll(&world, (const float)time, (const float)time * 3.0f, (const float)time / 7.0f);

	d3d9dev->SetTransform(D3DTS_WORLD, &world);
	d3d9dev->SetTransform(D3DTS_VIEW, &view);
	d3d9dev->SetTransform(D3DTS_PROJECTION, &proj);

	d3d9dev->SetTexture(0, checkerboardTexture);

	d3d9dev->SetStreamSource(0, cubeVB, 0, sizeof(vert3D) );
	d3d9dev->SetIndices(cubeIB);
	d3d9dev->DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 4*6, 0, 2*6);

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

int main(const unsigned argc, const char* const argv[])
{
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

	if (FAILED(d3d9dev->CreateVertexBuffer(4 * 6 * sizeof(vert3D), D3DUSAGE_WRITEONLY, D3DFVF_XYZ | D3DFVF_NORMAL | D3DFVF_DIFFUSE | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0), D3DPOOL_DEFAULT, &cubeVB, NULL) ) )
	{
		printf("Error in CreateVertexBuffer()\n");
		return 1;
	}

	if (FAILED(d3d9dev->CreateIndexBuffer(2 * 3 * 6 * sizeof(unsigned short), D3DUSAGE_WRITEONLY, D3DFMT_INDEX16, D3DPOOL_DEFAULT, &cubeIB, NULL) ) )
	{
		printf("Error in CreateIndexBuffer()\n");
		return 1;
	}

	vert3D* lockedVB = NULL;
	cubeVB->Lock(0, 0, (void**)&lockedVB, NULL);
	// -x face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 0];
		thisVert.normal = D3DXVECTOR3(-1.0f, 0.0f, 0.0f);
		thisVert.vertColor = D3DCOLOR_ARGB(255, 0, 255, 255);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(-1.0f, thisVert.texcoord.x * 2.0f - 1.0f, thisVert.texcoord.y * 2.0f - 1.0f);
		thisVert.texcoord.x *= 3.0f;
		thisVert.texcoord.y *= 3.0f;
		thisVert.texcoord.x -= 1.0f;
		thisVert.texcoord.y -= 1.0f;
	}
	// +x face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 4];
		thisVert.normal = D3DXVECTOR3(1.0f, 0.0f, 0.0f);
		thisVert.vertColor = D3DCOLOR_ARGB(255, 255, 0, 0);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(1.0f, thisVert.texcoord.x * 2.0f - 1.0f, thisVert.texcoord.y * 2.0f - 1.0f);
		thisVert.texcoord.x *= 3.0f;
		thisVert.texcoord.y *= 3.0f;
		thisVert.texcoord.x -= 1.0f;
		thisVert.texcoord.y -= 1.0f;
	}
	// -y face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 8];
		thisVert.normal = D3DXVECTOR3(0.0f, -1.0f, 0.0f);
		thisVert.vertColor = D3DCOLOR_ARGB(255, 255, 0, 255);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(thisVert.texcoord.x * 2.0f - 1.0f, -1.0f, thisVert.texcoord.y * 2.0f - 1.0f);
		thisVert.texcoord.x *= 3.0f;
		thisVert.texcoord.y *= 3.0f;
		thisVert.texcoord.x -= 1.0f;
		thisVert.texcoord.y -= 1.0f;
	}
	// +y face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 12];
		thisVert.normal = D3DXVECTOR3(0.0f, 1.0f, 0.0f);
		thisVert.vertColor = D3DCOLOR_ARGB(255, 0, 255, 0);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(thisVert.texcoord.x * 2.0f - 1.0f, 1.0f, thisVert.texcoord.y * 2.0f - 1.0f);
		thisVert.texcoord.x *= 3.0f;
		thisVert.texcoord.y *= 3.0f;
		thisVert.texcoord.x -= 1.0f;
		thisVert.texcoord.y -= 1.0f;
	}
	// -z face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 16];
		thisVert.normal = D3DXVECTOR3(0.0f, 0.0f, -1.0f);
		thisVert.vertColor = D3DCOLOR_ARGB(255, 255, 255, 0);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(thisVert.texcoord.x * 2.0f - 1.0f, thisVert.texcoord.y * 2.0f - 1.0f, -1.0f);
		thisVert.texcoord.x *= 3.0f;
		thisVert.texcoord.y *= 3.0f;
		thisVert.texcoord.x -= 1.0f;
		thisVert.texcoord.y -= 1.0f;
	}
	// +z face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 20];
		thisVert.normal = D3DXVECTOR3(0.0f, 0.0f, 1.0f);
		thisVert.vertColor = D3DCOLOR_ARGB(255, 0, 0, 255);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(thisVert.texcoord.x * 2.0f - 1.0f, thisVert.texcoord.y * 2.0f - 1.0f, 1.0f);
		thisVert.texcoord.x *= 3.0f;
		thisVert.texcoord.y *= 3.0f;
		thisVert.texcoord.x -= 1.0f;
		thisVert.texcoord.y -= 1.0f;
	}
	cubeVB->Unlock();

	unsigned short* lockedIB = NULL;
	cubeIB->Lock(0, 0, (void**)&lockedIB, NULL);
	memcpy(lockedIB, staticIndices, sizeof(staticIndices) );
	cubeIB->Unlock();

	if (FAILED(d3d9dev->CreateTexture(8, 8, 1, 0, D3DFMT_X8R8G8B8, D3DPOOL_MANAGED, &checkerboardTexture, NULL) ) )
	{
		printf("Error in CreateTexture()\n");
		return 1;
	}

	D3DLOCKED_RECT d3dlr = {0};
	checkerboardTexture->LockRect(0, &d3dlr, NULL, 0);
	bool currentSquareIsWhite = false;
	for (unsigned y = 0; y < 8; ++y)
	{
		D3DCOLOR* currentTexel = ( (D3DCOLOR*)d3dlr.pBits) + ( (y * d3dlr.Pitch) / sizeof(D3DCOLOR) );
		for (unsigned x = 0; x < 8; ++x)
		{
			*currentTexel++ = currentSquareIsWhite ? D3DCOLOR_ARGB(255, 255, 255, 255) : D3DCOLOR_ARGB(255, 0, 0, 0);
			currentSquareIsWhite = !currentSquareIsWhite;
		}
		currentSquareIsWhite = !currentSquareIsWhite;
	}
	checkerboardTexture->UnlockRect(0);

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

#ifdef _DEBUG
		Sleep(16);
#endif
	}

	DestroyWindow(wnd);
	UnregisterClassA( (LPCSTR)classAtom, classParams.hInstance);

	return 0;
}
