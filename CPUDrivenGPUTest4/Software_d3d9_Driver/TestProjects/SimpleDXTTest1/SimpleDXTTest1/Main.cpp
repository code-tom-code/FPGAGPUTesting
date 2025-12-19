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

static unsigned textureNumber = 0;
static bool alphaTesting = false;
static LPDIRECT3DTEXTURE9 TestDXT1_NoAlpha = NULL;
static LPDIRECT3DTEXTURE9 TestDXT1_Alpha = NULL;
static LPDIRECT3DTEXTURE9 TestDXT3 = NULL;
static LPDIRECT3DTEXTURE9 TestDXT5 = NULL;

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

struct vert2D
{
	D3DXVECTOR4 xyzRhw;
	D3DXVECTOR2 texcoord;
};

static inline const D3DXVECTOR3 paletteColor(const float t, const D3DXVECTOR3& a, const D3DXVECTOR3& b, const D3DXVECTOR3& c, const D3DXVECTOR3& d)
{
	D3DXVECTOR3 tempCosineTerm;
	tempCosineTerm.x = a.x + b.x * cosf(D3DX_PI * 2.0f * (c.x * t + d.x) );
	tempCosineTerm.y = a.y + b.y * cosf(D3DX_PI * 2.0f * (c.y * t + d.y) );
	tempCosineTerm.z = a.z + b.z * cosf(D3DX_PI * 2.0f * (c.z * t + d.z) );
	return tempCosineTerm;
}

static inline void RenderFrame(const long double timeDelta)
{
	static double time = 0.0;
	time += timeDelta;

	const D3DXVECTOR3 clearColor = paletteColor( (const float)time, D3DXVECTOR3(0.5f, 0.5f, 0.5f), D3DXVECTOR3(0.5f, 0.5f, 0.5f), D3DXVECTOR3(1.0f, 1.0f, 1.0f), D3DXVECTOR3(0.0f, 1.0f / 3.0f, 2.0f / 3.0f) );

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB( (const unsigned)(clearColor.x * 255.0f), (const unsigned)(clearColor.y * 255.0f), (const unsigned)(clearColor.z * 255.0f) ), 1.0f, 0x00000000);
	d3d9dev->BeginScene();

	// Render stuff here!
	d3d9dev->SetFVF(D3DFVF_TEX1 | D3DFVF_XYZRHW);
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_ALPHABLENDENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
	d3d9dev->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);

	if (GetAsyncKeyState('A') & 0x1)
	{
		alphaTesting = !alphaTesting;
	}

	if (alphaTesting)
	{
		d3d9dev->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
		d3d9dev->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_GREATER);
		d3d9dev->SetRenderState(D3DRS_ALPHAREF, 240);
	}
	else
	{
		d3d9dev->SetRenderState(D3DRS_ALPHATESTENABLE, FALSE);
	}

	for (unsigned x = 0; x < 10; ++x)
	{
		if (GetAsyncKeyState('0' + x) )
		{
			textureNumber = x;
			break;
		}
	}

	switch (textureNumber)
	{
	default:
	case 0:
		d3d9dev->SetTexture(0, TestDXT1_Alpha);
		break;
	case 1:
		d3d9dev->SetTexture(0, TestDXT1_NoAlpha);
		break;
	case 3:
		d3d9dev->SetTexture(0, TestDXT3);
		break;
	case 5:
		d3d9dev->SetTexture(0, TestDXT5);
		break;
	}

	vert2D verts[4];
	for (unsigned x = 0; x < 4; ++x)
	{
		vert2D& thisVert = verts[x];
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);

		thisVert.xyzRhw.x = thisVert.texcoord.x * windowWidth - 0.5f;
		thisVert.xyzRhw.y = thisVert.texcoord.y * windowHeight - 0.5f;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &verts, sizeof(vert2D) );

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

void PrintWelcomeAndControlsMessage()
{
	printf("Simple DXT Test\n");
	printf("\n");
	printf("Controls:\n");
	printf("[A]: Toggles alpha-testing on/off\n");
	printf("[0]-[9]: Selects texture 0-9\n");
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
		printf("Error in Direct3DCreate9Ex(). GLE: %u\n", GetLastError() );
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
	HRESULT createDeviceHR = d3d9->CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, wnd, D3DCREATE_HARDWARE_VERTEXPROCESSING, &d3dpp, &d3d9dev);
	if (FAILED(createDeviceHR) || !d3d9dev)
	{
		printf("Error in CreateDevice(). HRESULT: 0x%08X. GLE: %u\n", createDeviceHR, GetLastError() );
		return 1;
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(127, 127, 127), 1.0f, 0x00000000);
	d3d9dev->Present(NULL, NULL, NULL, NULL);

	//PALETTEENTRY entries[256] = {0};
	//d3d9dev->SetPaletteEntries(0, entries);
	//UINT currentTexturePalette = 0;
	//d3d9dev->SetCurrentTexturePalette(0xFFFF);
	
	if (FAILED(d3d9dev->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &originalBackbuffer) ) || !originalBackbuffer)
	{
		printf("Error in GetBackBuffer()\n");
		return 1;
	}

	if (FAILED(D3DXCreateTextureFromFileA(d3d9dev, "TestDXT1_NoAlpha.dds", &TestDXT1_NoAlpha) ) )
	{
		printf("Failed to load texture\n");
		return 1;
	}

	if (FAILED(D3DXCreateTextureFromFileA(d3d9dev, "TestDXT1_Alpha.dds", &TestDXT1_Alpha) ) )
	{
		printf("Failed to load texture\n");
		return 1;
	}

	if (FAILED(D3DXCreateTextureFromFileA(d3d9dev, "TestDXT3.dds", &TestDXT3) ) )
	{
		printf("Failed to load texture\n");
		return 1;
	}

	// This DXT5 image is under the CC BY-SA 3.0 license. I have modified the image by cropping and resizing it from the original 800x600 to the new 256x256 resolution, and also converting the file from PNG to DDS format.
	// Original source image and its original license is from Wikipedia here: https://commons.wikimedia.org/wiki/File:PNG_transparency_demonstration_1.png
	if (FAILED(D3DXCreateTextureFromFileA(d3d9dev, "TestDXT5.dds", &TestDXT5) ) )
	{
		printf("Failed to load texture\n");
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
	}

	DestroyWindow(wnd);
	UnregisterClassA( (LPCSTR)classAtom, classParams.hInstance);

	return 0;
}
