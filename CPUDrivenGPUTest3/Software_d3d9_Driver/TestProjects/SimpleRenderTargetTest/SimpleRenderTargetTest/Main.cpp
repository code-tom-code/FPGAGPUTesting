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

static LPDIRECT3DTEXTURE9 unfoggedBackgroundTex = NULL;
static LPDIRECT3DTEXTURE9 foggedRT = NULL;

static LPDIRECT3DTEXTURE9 gaussianBrush = NULL;

static bool bDone = false;

static const unsigned BRUSH_WIDTH = 32u;
static const unsigned BRUSH_HEIGHT = BRUSH_WIDTH;

struct vert2D
{
	D3DXVECTOR4 xyzRhw;
	D3DXVECTOR3 normal;
	D3DCOLOR diffuse;
	D3DXVECTOR2 texCoord0;
	D3DXVECTOR2 texCoord1;
};

static void InitGaussianBrushTex(LPDIRECT3DTEXTURE9 brushTex)
{
	D3DLOCKED_RECT d3dlr = {0};
	brushTex->LockRect(0, &d3dlr, NULL, 0);

	// Let's do a circular gaussian falloff:
	BYTE* const byteBuf = reinterpret_cast<BYTE* const>(d3dlr.pBits);
	const D3DXVECTOR2 centerPoint(BRUSH_WIDTH/2, BRUSH_HEIGHT/2);
	const float maxEdgeDistance = max(centerPoint.x, centerPoint.y);
	for (unsigned y = 0; y < BRUSH_HEIGHT; ++y)
	{
		D3DCOLOR* const texelsRow = reinterpret_cast<D3DCOLOR* const>(byteBuf + d3dlr.Pitch * y);
		for (unsigned x = 0; x < BRUSH_WIDTH; ++x)
		{
			const D3DXVECTOR2 currentTexelPos( (const float)x, (const float)y);
			const D3DXVECTOR2 texelToCenter = centerPoint - currentTexelPos;
			float normalizedDistanceFromCenter = D3DXVec2Length(&texelToCenter) / maxEdgeDistance; // 0.0f = at center, 1.0f = edge, > 1.0f at furthest corner
			if (normalizedDistanceFromCenter > 1.0f)
				normalizedDistanceFromCenter = 1.0f;
			const float brushOpacity = 1.0f - normalizedDistanceFromCenter;
			const BYTE brushOpacityByte = (const BYTE)(brushOpacity * 255.0f);
			texelsRow[x] = D3DCOLOR_ARGB(255, brushOpacityByte, brushOpacityByte, brushOpacityByte);
		}
	}

	brushTex->UnlockRect(0);
}

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

static void ClearFogRenderTarget(void)
{
	d3d9dev->BeginScene();

	LPDIRECT3DSURFACE9 renderTargetSurface = NULL;
	foggedRT->GetSurfaceLevel(0, &renderTargetSurface);

	d3d9dev->SetRenderTarget(0, renderTargetSurface);

	// Clear our render target to all black:
	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET, D3DCOLOR_ARGB(255, 0, 0, 0), 0.0f, 0x00);

	d3d9dev->SetRenderTarget(0, originalBackbuffer);

	renderTargetSurface->Release();
	renderTargetSurface = NULL;

	d3d9dev->EndScene();
}

static void DrawBrushOnRenderTarget(const float tx, const float ty)
{
	d3d9dev->BeginScene();

	LPDIRECT3DSURFACE9 renderTargetSurface = NULL;
	foggedRT->GetSurfaceLevel(0, &renderTargetSurface);

	d3d9dev->SetRenderTarget(0, renderTargetSurface);

	D3DSURFACE_DESC renderTargetDesc = {};
	renderTargetSurface->GetDesc(&renderTargetDesc);

	d3d9dev->SetTexture(0, gaussianBrush);

	// Set up the blend mode to be additive color blending:
	d3d9dev->SetRenderState(D3DRS_ALPHABLENDENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_SEPARATEALPHABLENDENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_SRCBLEND, D3DBLEND_ONE);
	d3d9dev->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_ONE);
	d3d9dev->SetRenderState(D3DRS_BLENDOP, D3DBLENDOP_ADD);
	d3d9dev->SetRenderState(D3DRS_SRCBLENDALPHA, D3DBLEND_ONE);
	d3d9dev->SetRenderState(D3DRS_DESTBLENDALPHA, D3DBLEND_ZERO);
	d3d9dev->SetRenderState(D3DRS_BLENDOPALPHA, D3DBLENDOP_ADD);

	// Set our texture stage state to do a simple diffuse * texcolor:
	d3d9dev->SetTextureStageState(0, D3DTSS_COLOROP, D3DTOP_MODULATE);
	d3d9dev->SetTextureStageState(0, D3DTSS_COLORARG1, D3DTA_TEXTURE);
	d3d9dev->SetTextureStageState(0, D3DTSS_COLORARG2, D3DTA_DIFFUSE);
	d3d9dev->SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1);
	d3d9dev->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_DIFFUSE);
	d3d9dev->SetTextureStageState(1, D3DTSS_COLOROP, D3DTOP_DISABLE);
	d3d9dev->SetTextureStageState(1, D3DTSS_ALPHAOP, D3DTOP_DISABLE);

	d3d9dev->SetFVF(D3DFVF_XYZRHW | D3DFVF_NORMAL | D3DFVF_DIFFUSE | D3DFVF_TEX1);

	const float brushScale = 0.15f;

	// Construct our brush quad as a square centered around the given tx,ty coords:
	vert2D verts[4];
	for (unsigned x = 0; x < 4; ++x)
	{
		vert2D& thisVert = verts[x];
		thisVert.texCoord0.x = (const float)(x & 0x1);
		thisVert.texCoord0.y = (const float)( (x >> 1) & 0x1);
		thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
		thisVert.xyzRhw.x = tx * renderTargetDesc.Width - 0.5f + (thisVert.texCoord0.x - 0.5f) * brushScale * renderTargetDesc.Width;
		thisVert.xyzRhw.y = ty * renderTargetDesc.Height - 0.5f + (thisVert.texCoord0.y - 0.5f) * brushScale * renderTargetDesc.Height;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
		thisVert.normal.x = 0.0f;
		thisVert.normal.y = 0.0f;
		thisVert.normal.z = 1.0f;

		thisVert.texCoord1 = thisVert.texCoord0;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &verts, sizeof(vert2D) );

	d3d9dev->SetRenderTarget(0, originalBackbuffer);

	renderTargetSurface->Release();
	renderTargetSurface = NULL;

	d3d9dev->EndScene();
}

static void DumpFogmapToFile()
{
	HRESULT hr = D3DXSaveTextureToFileA("FogMap.png", D3DXIFF_PNG, foggedRT, NULL);
	if (FAILED(hr) )
	{
		printf("Error in D3DXSaveTextureToFile(): 0x%08X\n", hr);
	}
	else
	{
		printf("Fog map saved successfully!\n");
	}
}

static LRESULT CALLBACK MyWindowProc(_In_ HWND hwnd, _In_ UINT uMsg, _In_ WPARAM wParam, _In_ LPARAM lParam)
{
	switch (uMsg)
	{
	case WM_CLOSE:
		printf("WM_CLOSE\n");
		bDone = true;
		break;
	case WM_KEYDOWN:
		if (wParam == 'R' && ( (lParam >> 30) & 0x1) == 0)
		{
			ClearFogRenderTarget();
		}
		if (wParam == 'D' && ( (lParam >> 30) & 0x1) == 0)
		{
			DumpFogmapToFile();
		}
		return 0;
	case WM_LBUTTONDOWN:
	{
		const SHORT xClientCoord = lParam & 0xFFFF;
		const SHORT yClientCoord = (lParam >> 16) & 0xFFFF;
		RECT clientRect = {0};
		GetClientRect(hwnd, &clientRect);
		const float tx = xClientCoord / (const float)(clientRect.right - clientRect.left);
		const float ty = yClientCoord / (const float)(clientRect.bottom - clientRect.top);
		DrawBrushOnRenderTarget(tx, ty);
	}
		return 0;
	case WM_MOUSEMOVE:
	{
		if (wParam & MK_LBUTTON)
		{
			const SHORT xClientCoord = lParam & 0xFFFF;
			const SHORT yClientCoord = (lParam >> 16) & 0xFFFF;
			RECT clientRect = {0};
			GetClientRect(hwnd, &clientRect);
			const float tx = xClientCoord / (const float)(clientRect.right - clientRect.left);
			const float ty = yClientCoord / (const float)(clientRect.bottom - clientRect.top);
			DrawBrushOnRenderTarget(tx, ty);
		}
	}
		return 0;
	}
	return DefWindowProcA(hwnd, uMsg, wParam, lParam);
}

static inline void RenderFrame(const long double timeDelta)
{
	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET, D3DCOLOR_XRGB(0, 0, 255), 1.0f, 0x00000000);
	d3d9dev->BeginScene();

	d3d9dev->SetFVF(D3DFVF_XYZRHW | D3DFVF_NORMAL | D3DFVF_DIFFUSE | D3DFVF_TEX2);

	// Render stuff here!
	d3d9dev->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_NONE);
	d3d9dev->SetSamplerState(0, D3DSAMP_MAXMIPLEVEL, 0);
	d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSU, D3DTADDRESS_CLAMP);
	d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSV, D3DTADDRESS_CLAMP);
	d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSW, D3DTADDRESS_CLAMP);
	d3d9dev->SetSamplerState(1, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(1, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(1, D3DSAMP_MIPFILTER, D3DTEXF_NONE);
	d3d9dev->SetSamplerState(1, D3DSAMP_MAXMIPLEVEL, 0);
	d3d9dev->SetSamplerState(1, D3DSAMP_ADDRESSU, D3DTADDRESS_CLAMP);
	d3d9dev->SetSamplerState(1, D3DSAMP_ADDRESSV, D3DTADDRESS_CLAMP);
	d3d9dev->SetSamplerState(1, D3DSAMP_ADDRESSW, D3DTADDRESS_CLAMP);

	d3d9dev->SetTextureStageState(0, D3DTSS_COLOROP, D3DTOP_MODULATE);
	d3d9dev->SetTextureStageState(0, D3DTSS_COLORARG1, D3DTA_TEXTURE);
	d3d9dev->SetTextureStageState(0, D3DTSS_COLORARG2, D3DTA_DIFFUSE);
	d3d9dev->SetTextureStageState(0, D3DTSS_COLORARG0, D3DTA_TFACTOR);
	d3d9dev->SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_MODULATE);
	d3d9dev->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
	d3d9dev->SetTextureStageState(0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE);
	d3d9dev->SetTextureStageState(0, D3DTSS_ALPHAARG0, D3DTA_TFACTOR);
	d3d9dev->SetTextureStageState(0, D3DTSS_TEXCOORDINDEX, 0);
	static const float oneFlt = 1.0f;
	static const DWORD oneF = *(const DWORD* const)&oneFlt;
	d3d9dev->SetTextureStageState(0, D3DTSS_BUMPENVLSCALE, oneF);

	d3d9dev->SetTextureStageState(1, D3DTSS_COLOROP, D3DTOP_MODULATE);
	d3d9dev->SetTextureStageState(1, D3DTSS_COLORARG1, D3DTA_TEXTURE);
	d3d9dev->SetTextureStageState(1, D3DTSS_COLORARG2, D3DTA_CURRENT);
	d3d9dev->SetTextureStageState(1, D3DTSS_COLORARG0, D3DTA_TFACTOR);
	d3d9dev->SetTextureStageState(1, D3DTSS_ALPHAOP, D3DTOP_MODULATE);
	d3d9dev->SetTextureStageState(1, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
	d3d9dev->SetTextureStageState(1, D3DTSS_ALPHAARG2, D3DTA_CURRENT);
	d3d9dev->SetTextureStageState(1, D3DTSS_ALPHAARG0, D3DTA_TFACTOR);
	d3d9dev->SetTextureStageState(1, D3DTSS_TEXCOORDINDEX, 1);
	d3d9dev->SetTextureStageState(1, D3DTSS_BUMPENVLSCALE, oneF);

	d3d9dev->SetTextureStageState(2, D3DTSS_COLOROP, D3DTOP_DISABLE);
	d3d9dev->SetTextureStageState(2, D3DTSS_ALPHAOP, D3DTOP_DISABLE);

	d3d9dev->SetTexture(0, unfoggedBackgroundTex);
	d3d9dev->SetTexture(1, foggedRT);

	d3d9dev->SetRenderState(D3DRS_ALPHABLENDENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_SEPARATEALPHABLENDENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
	d3d9dev->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);

	vert2D verts[4];
	for (unsigned x = 0; x < 4; ++x)
	{
		vert2D& thisVert = verts[x];
		thisVert.texCoord0.x = (const float)(x & 0x1);
		thisVert.texCoord0.y = (const float)( (x >> 1) & 0x1);
		thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
		thisVert.xyzRhw.x = thisVert.texCoord0.x * windowWidth - 0.5f;
		thisVert.xyzRhw.y = thisVert.texCoord0.y * windowHeight - 0.5f;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
		thisVert.normal.x = 0.0f;
		thisVert.normal.y = 0.0f;
		thisVert.normal.z = 1.0f;

		thisVert.texCoord1 = thisVert.texCoord0;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &verts, sizeof(vert2D) );

	d3d9dev->SetTexture(1, NULL);

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
	d3dpp.EnableAutoDepthStencil = FALSE;
	d3dpp.Flags = D3DPRESENTFLAG_DEVICECLIP;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
	HRESULT createDeviceHR = d3d9->CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, wnd, D3DCREATE_HARDWARE_VERTEXPROCESSING | D3DCREATE_PUREDEVICE | D3DCREATE_MULTITHREADED, &d3dpp, &d3d9dev);
	if (FAILED(createDeviceHR) || !d3d9dev)
	{
		printf("Error in CreateDevice(). HRESULT: 0x%08X. GLE: %u\n", createDeviceHR, GetLastError() );
		return 1;
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET, D3DCOLOR_XRGB(127, 127, 127), 1.0f, 0x00000000);
	d3d9dev->Present(NULL, NULL, NULL, NULL);
	
	if (FAILED(d3d9dev->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &originalBackbuffer) ) || !originalBackbuffer)
	{
		printf("Error in GetBackBuffer()\n");
		return 1;
	}

	if (FAILED(D3DXCreateTextureFromFileExA(d3d9dev, "UnfoggedMapTexture.png", D3DX_FROM_FILE, D3DX_FROM_FILE, 1, 0, D3DFMT_X8R8G8B8, D3DPOOL_MANAGED, D3DX_DEFAULT, D3DX_DEFAULT, 0x00000000, NULL, NULL, &unfoggedBackgroundTex) ) )
	{
		return 1;
	}
	/*d3d9dev->CreateTexture(1, 1, 1, 0, D3DFMT_X8R8G8B8, D3DPOOL_MANAGED, &unfoggedBackgroundTex, NULL);
	D3DLOCKED_RECT d3dlr = {0};
	unfoggedBackgroundTex->LockRect(0, &d3dlr, NULL, 0);
	D3DCOLOR* const texel = (D3DCOLOR* const)d3dlr.pBits;
	*texel = D3DCOLOR_ARGB(255, 255, 0, 0);
	unfoggedBackgroundTex->UnlockRect(0);*/

	if (FAILED(D3DXCreateTextureFromFileExA(d3d9dev, "FogMap.png", D3DX_FROM_FILE, D3DX_FROM_FILE, 1, D3DUSAGE_RENDERTARGET, D3DFMT_X8R8G8B8, D3DPOOL_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0x00000000, NULL, NULL, &foggedRT) ) )
	{
		return 1;
	}

	if (FAILED(d3d9dev->CreateTexture(BRUSH_WIDTH, BRUSH_HEIGHT, 1, 0, D3DFMT_X8R8G8B8, D3DPOOL_MANAGED, &gaussianBrush, NULL) ) )
	{
		return 1;
	}

	InitGaussianBrushTex(gaussianBrush);

	d3d9dev->SetRenderState(D3DRS_ZENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_ZWRITEENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_ZFUNC, D3DCMP_ALWAYS);
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);

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
