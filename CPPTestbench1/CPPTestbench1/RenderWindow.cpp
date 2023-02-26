#pragma once

#ifdef _DEBUG
	#define D3D_DEBUG_INFO 1
#else
	#undef D3D_DEBUG_INFO
#endif

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include "RenderWindow.h"
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

RenderWindow::RenderWindow()
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
		return;
	}

	wnd = CreateWindowExA(0L, (LPCSTR)classAtom, windowName, WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, windowWidth, windowHeight, NULL, NULL, classParams.hInstance, NULL);
	if (!wnd)
	{
		printf("Error in CreateWindowExA. GLE: %u\n", GetLastError() );
		return;
	}

	ShowWindow(wnd, SW_SHOW);
	UpdateWindow(wnd);

	d3d9 = Direct3DCreate9(D3D_SDK_VERSION);
	if (!d3d9)
	{
		printf("Error in Direct3DCreate9(). GLE: %u\n", GetLastError() );
		return;
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
	d3dpp.AutoDepthStencilFormat = D3DFMT_D24S8;
	d3dpp.Flags = 0;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
	HRESULT createDeviceHR = d3d9->CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, wnd, D3DCREATE_HARDWARE_VERTEXPROCESSING | D3DCREATE_MULTITHREADED, &d3dpp, &d3d9dev);
	if (FAILED(createDeviceHR) || !d3d9dev)
	{
		printf("Error in CreateDevice(). HRESULT: 0x%08X. GLE: %u\n", createDeviceHR, GetLastError() );
		return;
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(127, 127, 127), 1.0f, 0x00000000);
	d3d9dev->Present(NULL, NULL, NULL, NULL);

	PumpWindowsMessageLoop(wnd);
	
	if (FAILED(d3d9dev->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &originalBackbuffer) ) || !originalBackbuffer)
	{
		printf("Error in GetBackBuffer()\n");
		return;
	}

	if (FAILED(d3d9dev->CreateTexture(640, 480, 1, D3DUSAGE_DYNAMIC, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, &dynamicTex, NULL) ) )
	{
		printf("Error in CreateTexture()\n");
		return;
	}

	PumpWindowsMessageLoop(wnd);
}

RenderWindow::~RenderWindow()
{
	dynamicTex->Release();
	dynamicTex = NULL;
	originalBackbuffer->Release();
	originalBackbuffer = NULL;
	d3d9dev->Release();
	d3d9dev = NULL;
	d3d9->Release();
	d3d9 = NULL;
	CloseWindow(wnd);
	wnd = NULL;
}

void RenderWindow::DisplayLine(const void* const texelData, const unsigned lineNumber)
{
	D3DLOCKED_RECT d3dlr = {0};
	dynamicTex->LockRect(0, &d3dlr, NULL, 0);

	D3DCOLOR* const targetWrite = ( (D3DCOLOR* const)d3dlr.pBits) + lineNumber * 640;

	memcpy(targetWrite, texelData, sizeof(D3DCOLOR) * 640);

	dynamicTex->UnlockRect(0);
}

void RenderWindow::DisplayTexture(const void* const texelData)
{
	D3DLOCKED_RECT d3dlr = {0};
	dynamicTex->LockRect(0, &d3dlr, NULL, 0);

	memcpy(d3dlr.pBits, texelData, sizeof(D3DCOLOR) * 640 * 480);

	dynamicTex->UnlockRect(0);
}

struct vert2D
{
	D3DXVECTOR4 xyzRhw;
	D3DCOLOR diffuse;
	D3DXVECTOR2 texcoord;
};

void RenderWindow::RenderLoop()
{
	PumpWindowsMessageLoop(wnd);

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER | D3DCLEAR_STENCIL, D3DCOLOR_XRGB(0, 0, 255), 1.0f, 0x00000000);
	
	d3d9dev->BeginScene();
	// Render stuff here!

	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_COLORVERTEX, TRUE);

	d3d9dev->SetFVF(D3DFVF_XYZRHW | D3DFVF_DIFFUSE | D3DFVF_TEX1);
	d3d9dev->SetTexture(0, dynamicTex);

	vert2D quadVerts[4];
	for (unsigned x = 0; x < 4; ++x)
	{
		vert2D& thisVert = quadVerts[x];
		thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);

		thisVert.xyzRhw.x = thisVert.texcoord.x * windowWidth - 0.5f;
		thisVert.xyzRhw.y = thisVert.texcoord.y * windowHeight - 0.5f;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &quadVerts, sizeof(vert2D) );

	d3d9dev->EndScene();

	d3d9dev->Present(NULL, NULL, NULL, NULL);
}
