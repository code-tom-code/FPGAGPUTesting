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
#include <Mmsystem.h> // for timeBeginPeriod

#pragma comment (lib, "Winmm.lib") // for timeBeginPeriod

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

static LPDIRECT3DTEXTURE9 gridTexMips = NULL;

static LPDIRECT3DVERTEXBUFFER9 gridVB = NULL;
static LPDIRECT3DINDEXBUFFER9 gridIB = NULL;

static const unsigned GRIDWIDTH = 32;
static const unsigned GRIDHEIGHT = GRIDWIDTH;
static bool mipmappingEnabled = true;
static long double ldFreq = 0.0;
static unsigned __int64 startTicks = 0;

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

struct vert3D
{
	D3DXVECTOR3 xyz;
	D3DXVECTOR2 texcoord;
};

void ComputeVertices(const bool enableNoise)
{
	LARGE_INTEGER ticks = {0};
	QueryPerformanceCounter(&ticks);
	ticks.QuadPart -= startTicks;

	const long double time = ticks.QuadPart / ldFreq;

	vert3D* lockedVB = NULL;
	gridVB->Lock(0, 0, (void** const)&lockedVB, D3DLOCK_DISCARD);
	for (unsigned y = 0; y < 33; ++y)
	{
		for (unsigned x = 0; x < 33; ++x)
		{
			vert3D& thisVert = lockedVB[y * 33 + x];
			thisVert.xyz.x = x / 33.0f;
			if (enableNoise)
			{
				const float baseHeightOffsetX = cosf(x * 8 / 30.0f) / 12.0f;
				const float baseHeightOffsetY = cosf(y * 8 / 30.0f) / 14.0f;
				const float baseHeightOffset = max(baseHeightOffsetX, baseHeightOffsetY);
				thisVert.xyz.y = cos(time) * baseHeightOffset;
			}
			else
			{
				thisVert.xyz.y = 0.0f;
			}
			thisVert.xyz.z = y / 33.0f;
			thisVert.texcoord.x = thisVert.xyz.x;
			thisVert.texcoord.y = thisVert.xyz.z;
			thisVert.xyz.x -= 0.5f;
		}
	}
	gridVB->Unlock();
}

static inline void RenderFrame(const long double timeDelta, HWND wnd)
{
	static const float GRID_LENGTH_WORLDSPACE = 4.0f;
	static const float BILLBOARD_LENGTH_WORLDSPACE = 1.0f;
	static const float TEXWRAPREPEAT = 4.0f;
	static long double timeElapsed = 0.0;
	timeElapsed += timeDelta;

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0, 0, 64), 1.0f, 0x00000000);
	d3d9dev->BeginScene();

	// Render stuff here!
	d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSU, D3DTADDRESS_WRAP);
	d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSV, D3DTADDRESS_WRAP);
	d3d9dev->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_COLORVERTEX, FALSE);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CW);
	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0) );

	LPDIRECT3DTEXTURE9 gridTex = gridTexMips;

	D3DXMATRIXA16 world, view, proj;
	D3DXMatrixIdentity(&world);
	D3DXVECTOR3 camPos(0.0f, 0.1f, 0.0f);
	D3DXVECTOR3 camAt(0.0f, 0.0f, 1.0f);
	D3DXVECTOR3 camUp(0.0f, 1.0f, 0.0f);
	D3DXMatrixLookAtRH(&view, &camPos, &camAt, &camUp);
	D3DXMatrixPerspectiveFovRH(&proj, D3DXToRadian(90.0f), windowWidth / (const float)windowHeight, 0.01f, 1000.0f);
	d3d9dev->SetTransform(D3DTS_WORLD, &world);
	d3d9dev->SetTransform(D3DTS_VIEW, &view);
	d3d9dev->SetTransform(D3DTS_PROJECTION, &proj);

	ComputeVertices(true);

	/*vert3D gridVerts[4];
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = gridVerts[x];
		thisVert.xyz.x = (x & 0x1) * GRID_LENGTH_WORLDSPACE - GRID_LENGTH_WORLDSPACE * 0.5f;
		thisVert.xyz.y = 0.0f;
		thisVert.xyz.z = ( (x >> 1) & 0x1) * GRID_LENGTH_WORLDSPACE - GRID_LENGTH_WORLDSPACE * 0.5f;
		thisVert.texcoord.x = (x & 0x1) * TEXWRAPREPEAT;
		thisVert.texcoord.y = ( (x >> 1) & 0x1) * TEXWRAPREPEAT;
	}*/
	d3d9dev->SetTexture(0, gridTex);
	d3d9dev->SetIndices(gridIB);
	d3d9dev->SetStreamSource(0, gridVB, 0, sizeof(vert3D) );
	d3d9dev->DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 33 * 33, 0, 32 * 32 * 2);
	//d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &gridVerts, sizeof(vert3D) );

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

void WriteGridTexels(LPDIRECT3DTEXTURE9 writeGridTex)
{
	D3DLOCKED_RECT d3dlr = {0};
	if (FAILED(writeGridTex->LockRect(0, &d3dlr, NULL, 0) ) || !d3dlr.pBits)
	{
		__debugbreak();
	}

	// Procedurally generate a simple black/white checkerboard texture:
	BYTE* rowBeginPtr = (BYTE* const)d3dlr.pBits;
	for (unsigned y = 0; y < GRIDHEIGHT; ++y)
	{
		D3DCOLOR* const rowColorsPtr = (D3DCOLOR* const)rowBeginPtr;
		for (unsigned x = 0; x < GRIDWIDTH; ++x)
		{
			const bool blackOrWhite = (y & 0x1) ^ (x & 0x1);
			rowColorsPtr[x] = blackOrWhite ? D3DCOLOR_ARGB(255, 255, 255, 255) : D3DCOLOR_ARGB(255, 0, 0, 0);
		}
		rowBeginPtr += d3dlr.Pitch;
	}

	if (FAILED(writeGridTex->UnlockRect(0) ) )
	{
		__debugbreak();
	}
}

void CreateGridTextures(LPDIRECT3DTEXTURE9& inGridTexGenMips)
{
	if (FAILED(d3d9dev->CreateTexture(GRIDWIDTH, GRIDHEIGHT, 0, 0, D3DFMT_A8R8G8B8, D3DPOOL_MANAGED, &inGridTexGenMips, NULL) ) || !inGridTexGenMips)
	{
		__debugbreak();
	}

	WriteGridTexels(inGridTexGenMips);

	// Have D3DX generate mipmaps for our texture:
	if (FAILED(D3DXFilterTexture(inGridTexGenMips, NULL, 0, D3DX_DEFAULT) ) )
	{
		__debugbreak();
	}
}

void PrintWelcomeAndControlsMessage()
{
	printf("Dynamic Vertex Buffer Test\n");
	printf("\n");
	printf("Controls:\n");
	printf("None\n");
	printf("\n");
}

int main(const unsigned argc, const char* const argv[])
{
	PrintWelcomeAndControlsMessage();


	// Try to set the system timeslice quantum to 1ms
	timeBeginPeriod(1);

	LARGE_INTEGER freq = {0};
	QueryPerformanceFrequency(&freq);
	ldFreq = (const long double)freq.QuadPart;

	LARGE_INTEGER startTick = {0};
	QueryPerformanceCounter(&startTick);
	startTicks = startTick.QuadPart;

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
	d3dpp.EnableAutoDepthStencil = TRUE;
	d3dpp.Windowed = TRUE;
	d3dpp.AutoDepthStencilFormat = D3DFMT_D24X8;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
	HRESULT createDeviceHR = d3d9->CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, wnd, D3DCREATE_HARDWARE_VERTEXPROCESSING | D3DCREATE_PUREDEVICE, &d3dpp, &d3d9dev);
	if (FAILED(createDeviceHR) || !d3d9dev)
	{
		printf("Error in CreateDevice(). HRESULT: 0x%08X. GLE: %u\n", createDeviceHR, GetLastError() );
		return 1;
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(127, 127, 127), 1.0f, 0x00000000);
	d3d9dev->Present(NULL, NULL, NULL, NULL);

	// Generate/load our mipmap textures:
	CreateGridTextures(gridTexMips);

	if (FAILED(d3d9dev->CreateVertexBuffer(sizeof(vert3D) * 33 * 33, D3DUSAGE_DYNAMIC, D3DFVF_XYZ | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0), D3DPOOL_DEFAULT, &gridVB, NULL) ) )
	{
		__debugbreak();
	}

	if (FAILED(d3d9dev->CreateIndexBuffer(sizeof(USHORT) * 32 * 32 * 2 * 3, D3DUSAGE_WRITEONLY, D3DFMT_INDEX16, D3DPOOL_DEFAULT, &gridIB, NULL) ) )
	{
		__debugbreak();
	}

	USHORT* idxPtr = NULL;
	gridIB->Lock(0, 0, (void** const)&idxPtr, 0);
	for (unsigned short y = 0; y < 32; ++y)
	{
		for (unsigned short x = 0; x < 32; ++x)
		{
			unsigned short tl = y * 33 + x;
			unsigned short tr = tl + 1;
			unsigned short bl = tl + 33;
			unsigned short br = bl + 1;

			*idxPtr++ = tl;
			*idxPtr++ = bl;
			*idxPtr++ = tr;

			*idxPtr++ = tr;
			*idxPtr++ = bl;
			*idxPtr++ = br;
		}
	}
	gridIB->Unlock();

	ComputeVertices(false);

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

		RenderFrame(timeDeltaSeconds, wnd);

		Sleep(16);
	}

	DestroyWindow(wnd);
	UnregisterClassA( (LPCSTR)classAtom, classParams.hInstance);

	// End the 1ms system quantum resolution period
	timeEndPeriod(1);

	return 0;
}
