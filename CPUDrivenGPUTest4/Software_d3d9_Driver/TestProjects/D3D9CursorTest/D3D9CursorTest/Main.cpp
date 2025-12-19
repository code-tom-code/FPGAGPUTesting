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
#include <windowsx.h>

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
static LPDIRECT3DSURFACE9 backbuffer = NULL;

static int gdiCursorRefCount = 0;
static int d3d9CursorRefCount = 0;

static void GDIShowCursor(const bool bShow)
{
	if (bShow)
		++gdiCursorRefCount;
	else
		--gdiCursorRefCount;

	ShowCursor(bShow);
}

static void GDIResetCursor()
{
	while (gdiCursorRefCount < 0)
	{
		++gdiCursorRefCount;
		ShowCursor(true);
	}
}

static void D3D9ShowCursor(const bool bShow)
{
	if (bShow)
		++d3d9CursorRefCount;
	else
		--d3d9CursorRefCount;

	d3d9dev->ShowCursor(bShow);
}

static void D3D9ResetCursor()
{
	while (d3d9CursorRefCount < 0)
	{
		++d3d9CursorRefCount;
		d3d9dev->ShowCursor(true);
	}
}

static void ResetAll()
{
	D3D9ResetCursor();
	GDIResetCursor();
}

enum cursorMode : unsigned char
{
	defaultCursor = 0, // Use Win32 default cursor with no modifications
	gdiHideCursor, // ShowCursor(FALSE)
	gdiDrawCursor, // SetCursor()
	d3d9HideCursor, // D3D9's ShowCursor(FALSE)
	d3d9DrawCursor, // D3D9's SetCursorProperties()
	softEmulateDrawCursorStretchRect, // StretchRect()
	softEmulateDrawCursorTexturedQuad // DrawPrimitiveUP()
};

enum faceMode : unsigned char
{
	eyesOpen = 0,
	winkLeft,
	winkRight,
	eyesClosed,

	NUM_FACE_MODES
};

static cursorMode currentCursorMode = d3d9DrawCursor;
static faceMode currentFaceMode = eyesOpen;
static POINT currentCursorPos = {0};

static HCURSOR gdiCursor32[NUM_FACE_MODES] = {NULL};
static LPDIRECT3DSURFACE9 cursorSurface32[NUM_FACE_MODES] = {NULL};
static LPDIRECT3DTEXTURE9 cursorTexture32[NUM_FACE_MODES] = {NULL};

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

static void UpdateHardwareCursor()
{
	if (currentCursorMode == d3d9DrawCursor)
	{
		d3d9dev->SetCursorProperties(0, 0, cursorSurface32[currentFaceMode]);
		D3D9ShowCursor(TRUE);
	}
	else if (currentCursorMode == gdiDrawCursor)
	{
		SetCursor(gdiCursor32[currentFaceMode]);
		GDIShowCursor(TRUE);
	}
}

static void UpdateWindowText(HWND wnd)
{
	const char* cursorModeText = "";
	switch (currentCursorMode)
	{
	case defaultCursor: // Use Win32 default cursor with no modifications
		cursorModeText = "Default Win32 Cursor";
		break;
	case gdiHideCursor: // ShowCursor(FALSE)
		cursorModeText = "Hide Cursor (GDI)";
		break;
	case gdiDrawCursor: // SetCursor()
		cursorModeText = "Draw Hardware Cursor (GDI)";
		break;
	case d3d9HideCursor: // D3D9's ShowCursor(FALSE)
		cursorModeText = "Hide Cursor (D3D9)";
		break;
	case d3d9DrawCursor: // D3D9's SetCursorProperties()
		cursorModeText = "Draw Hardware Cursor (D3D9)";
		break;
	case softEmulateDrawCursorStretchRect: // StretchRect()
		cursorModeText = "Draw Software Emulated Cursor (StretchRect)";
		break;
	case softEmulateDrawCursorTexturedQuad: // DrawPrimitiveUP()
		cursorModeText = "Draw Software Emulated Cursor (Textured Quad)";
		break;
	}

	SetWindowTextA(wnd, cursorModeText);
}

static LRESULT CALLBACK MyWindowProc(_In_ HWND hwnd, _In_ UINT uMsg, _In_ WPARAM wParam, _In_ LPARAM lParam)
{
	switch (uMsg)
	{
	case WM_CLOSE:
		printf("WM_CLOSE\n");
		bDone = true;
		break;
	case WM_SETCURSOR:
		if (LOWORD(lParam) == HTCLIENT)
		{
			switch (currentCursorMode)
			{
			default:
				__debugbreak(); // Should never be here!
			case defaultCursor: // Use Win32 default cursor with no modifications
				return DefWindowProcA(hwnd, uMsg, wParam, lParam); // Just do the default Win32 behavior
			case gdiHideCursor: // ShowCursor(FALSE)
				GDIShowCursor(FALSE);
				break;
			case gdiDrawCursor: // SetCursor()
				UpdateHardwareCursor();
				break;
			case d3d9HideCursor: // D3D9's ShowCursor(FALSE)
				D3D9ShowCursor(FALSE);
				break;
			case d3d9DrawCursor: // D3D9's SetCursorProperties()
				UpdateHardwareCursor();
				break;
			case softEmulateDrawCursorStretchRect: // StretchRect()
				GDIShowCursor(FALSE);
				break;
			case softEmulateDrawCursorTexturedQuad: // DrawPrimitiveUP()
				GDIShowCursor(FALSE);
				break;
			}
			return TRUE; // return TRUE to override the default behavior
		}
		break;
	case WM_KEYDOWN:
		switch (wParam)
		{
		case '0':
		case 'r':
		case 'R':
			currentCursorMode = defaultCursor;
			ResetAll();
			break;
		case '1':
			currentCursorMode = gdiHideCursor;
			ResetAll();
			GDIShowCursor(FALSE);
			break;
		case '2':
			currentCursorMode = gdiDrawCursor;
			ResetAll();
			UpdateHardwareCursor();
			break;
		case '3':
			currentCursorMode = d3d9HideCursor;
			ResetAll();
			D3D9ShowCursor(FALSE);
			break;
		case '4':
			currentCursorMode = d3d9DrawCursor;
			ResetAll();
			UpdateHardwareCursor();
			break;
		case '5':
			currentCursorMode = softEmulateDrawCursorStretchRect;
			ResetAll();
			GDIShowCursor(FALSE);
			break;
		case '6':
			currentCursorMode = softEmulateDrawCursorTexturedQuad;
			ResetAll();
			GDIShowCursor(FALSE);
			break;
		}
		UpdateWindowText(hwnd);
		break;
	case WM_LBUTTONDOWN:
		currentFaceMode = (const faceMode)(currentFaceMode | 0x1);
		UpdateHardwareCursor();
		break;
	case WM_LBUTTONUP:
		currentFaceMode = (const faceMode)(currentFaceMode & ~0x1);
		UpdateHardwareCursor();
		break;
	case WM_RBUTTONDOWN:
		currentFaceMode = (const faceMode)(currentFaceMode | 0x2);
		UpdateHardwareCursor();
		break;
	case WM_RBUTTONUP:
		currentFaceMode = (const faceMode)(currentFaceMode & ~0x2);
		UpdateHardwareCursor();
		break;
	case WM_MOUSEMOVE:
	{
		currentCursorPos.x = GET_X_LPARAM(lParam);
		currentCursorPos.y = GET_Y_LPARAM(lParam);

		unsigned char newFaceMode = 0x00;
		if (wParam & MK_LBUTTON)
			newFaceMode |= 0x1;
		if (wParam & MK_RBUTTON)
			newFaceMode |= 0x2;

		if (newFaceMode != currentFaceMode)
			UpdateHardwareCursor();

		currentFaceMode = (const faceMode)newFaceMode;
	}
		break;
	}
	return DefWindowProcA(hwnd, uMsg, wParam, lParam);
}

struct vert2D
{
	D3DXVECTOR4 xyzRhw;
	D3DXVECTOR2 texcoord;
};

static inline void RenderFrame(const long double timeDelta)
{
	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0, 0, 255), 1.0f, 0x00000000);
	d3d9dev->BeginScene();

	// Render stuff here!
	switch (currentCursorMode)
	{
	case softEmulateDrawCursorStretchRect:
	{
		RECT sourceRect = {0};
		sourceRect.right = 32;
		sourceRect.bottom = 32;

		RECT targetRect = {0};
		// TODO: Account for hotspot offset
		targetRect.left = currentCursorPos.x;
		targetRect.top = currentCursorPos.y;
		targetRect.right = targetRect.left + 32;
		targetRect.bottom = targetRect.top + 32;

		// Clip rect to window (it's illegal to call StretchRect with any part of the dest. rect being outside of the target surface):
		if (targetRect.right > windowWidth)
		{
			sourceRect.right -= (targetRect.right - windowWidth);
			targetRect.right = windowWidth;
		}
		if (targetRect.bottom > windowHeight)
		{
			sourceRect.bottom -= (targetRect.bottom - windowHeight);
			targetRect.bottom = windowHeight;
		}

		if (sourceRect.right <= 0 || sourceRect.bottom <= 0)
		{
			// Skip drawing a 0-size rect!
		}
		else if (FAILED(d3d9dev->StretchRect(cursorSurface32[currentFaceMode], &sourceRect, backbuffer, &targetRect, D3DTEXF_NONE) ) )
		{
			__debugbreak();
		}
	}
		break;
	case softEmulateDrawCursorTexturedQuad:
	{
		d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
		d3d9dev->SetRenderState(D3DRS_COLORVERTEX, FALSE);
		d3d9dev->SetFVF(D3DFVF_XYZRHW | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0) );
		d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSU, D3DTADDRESS_CLAMP);
		d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSV, D3DTADDRESS_CLAMP);
		d3d9dev->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_POINT);
		d3d9dev->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_POINT);
		d3d9dev->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_NONE);
		d3d9dev->SetSamplerState(0, D3DSAMP_MAXANISOTROPY, 1);
		d3d9dev->SetTexture(0, cursorTexture32[currentFaceMode]);
		d3d9dev->SetRenderState(D3DRS_ALPHABLENDENABLE, FALSE);
		d3d9dev->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
		d3d9dev->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_GREATEREQUAL);
		d3d9dev->SetRenderState(D3DRS_ALPHAREF, 0x80);

		vert2D cursorQuad[4];
		for (unsigned z = 0; z < 4; ++z)
		{
			vert2D& currentVert = cursorQuad[z];
			currentVert.texcoord.x = (const float)(z & 0x1);
			currentVert.texcoord.y = (const float)( (z >> 1) & 0x1);
			currentVert.xyzRhw.x = currentCursorPos.x + currentVert.texcoord.x * 32.0f - 0.5f;
			currentVert.xyzRhw.y = currentCursorPos.y + currentVert.texcoord.y * 32.0f - 0.5f;
			currentVert.xyzRhw.z = 0.0f;
			currentVert.xyzRhw.w = 1.0f;
		}
		// TODO: Account for hotspot offset
		if (FAILED(d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &cursorQuad, sizeof(vert2D) ) ) )
		{
			__debugbreak();
		}
	}
		break;
	}

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

void LoadCursorGDI(const faceMode faceID)
{
	const char* faceFileName = NULL;
	switch (faceID)
	{
	case eyesOpen:
		faceFileName = "Smile32.ico";
		break;
	case winkLeft:
		faceFileName = "WinkLeft32.ico";
		break;
	case winkRight:
		faceFileName = "WinkRight32.ico";
		break;
	case eyesClosed:
		faceFileName = "BothClosed32.ico";
		break;
	}

	HCURSOR loadedCursor = LoadCursorFromFileA(faceFileName);
	if (!loadedCursor)
	{
		printf("GLE: %u\n", GetLastError() );
		__debugbreak();
	}
	gdiCursor32[faceID] = loadedCursor;
}

void LoadCursorSurface(const faceMode faceID)
{
	const char* faceTextureName = NULL;
	switch (faceID)
	{
	case eyesOpen:
		faceTextureName = "Smile32.bmp";
		break;
	case winkLeft:
		faceTextureName = "WinkLeft32.bmp";
		break;
	case winkRight:
		faceTextureName = "WinkRight32.bmp";
		break;
	case eyesClosed:
		faceTextureName = "BothClosed32.bmp";
		break;
	}
	if (FAILED(d3d9dev->CreateOffscreenPlainSurface(32, 32, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, &cursorSurface32[faceID], NULL) ) || !cursorSurface32[faceID])
	{
		__debugbreak();
	}

	if (FAILED(D3DXLoadSurfaceFromFileA(cursorSurface32[faceID], NULL, NULL, faceTextureName, NULL, D3DX_DEFAULT, D3DCOLOR_ARGB(255, 255, 0, 255), NULL) ) )
	{
		__debugbreak();
	}
}

void LoadCursorTexture(const faceMode faceID)
{
	const char* faceTextureName = NULL;
	switch (faceID)
	{
	case eyesOpen:
		faceTextureName = "Smile32.bmp";
		break;
	case winkLeft:
		faceTextureName = "WinkLeft32.bmp";
		break;
	case winkRight:
		faceTextureName = "WinkRight32.bmp";
		break;
	case eyesClosed:
		faceTextureName = "BothClosed32.bmp";
		break;
	}
	if (FAILED(D3DXCreateTextureFromFileExA(d3d9dev, faceTextureName, D3DX_FROM_FILE, D3DX_FROM_FILE, 1, 0, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, D3DCOLOR_ARGB(255, 255, 0, 255), NULL, NULL, &cursorTexture32[faceID]) ) || !cursorTexture32[faceID])
	{
		__debugbreak();
	}
}

void PrintWelcomeAndControlsMessage()
{
	printf("Cursor Test\n");
	printf("\n");
	printf("Controls:\n");
	printf("[R]: Resets everything to the initial state again\n");
	printf("[Left Click]: Wink left eye\n");
	printf("[Right Click]: Wink right eye\n");
	printf("[0]: Default: Use default Win32 cursor with no modifications\n");
	printf("[1]: GDI Hide: Hides the cursor using GDI\n");
	printf("[2]: GDI Cursor: Draws a hardware cursor using GDI\n");
	printf("[3]: D3D9 Hide: Hides the cursor using D3D9\n");
	printf("[4]: D3D9 Cursor: Draws a hardware cursor using D3D9\n");
	printf("[5]: D3D9 Soft StretchRect: Draws a software cursor using D3D9's StretchRect functionality\n");
	printf("[6]: D3D9 Soft Texture: Draws a software cursor using D3D9 to perform texture sampling that can perform alpha-blending\n");
	printf("\n");
}

int main(const unsigned argc, const char* const argv[])
{
	PrintWelcomeAndControlsMessage();


	// Try to set the system timeslice quantum to 1ms
	timeBeginPeriod(1);

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
	d3dpp.Flags = D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
	HRESULT createDeviceHR = d3d9->CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, wnd, D3DCREATE_HARDWARE_VERTEXPROCESSING | D3DCREATE_PUREDEVICE, &d3dpp, &d3d9dev);
	if (FAILED(createDeviceHR) || !d3d9dev)
	{
		printf("Error in CreateDevice(). HRESULT: 0x%08X. GLE: %u\n", createDeviceHR, GetLastError() );
		return 1;
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(127, 127, 127), 1.0f, 0x00000000);
	d3d9dev->Present(NULL, NULL, NULL, NULL);

	if (FAILED(d3d9dev->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &backbuffer) ) || !backbuffer)
	{
		__debugbreak();
	}

	// Load all of our cursor sprites:
	for (unsigned x = 0; x < NUM_FACE_MODES; ++x)
	{
		const faceMode thisFaceMode = (const faceMode)x;
		LoadCursorGDI(thisFaceMode);
		LoadCursorSurface(thisFaceMode);
		LoadCursorTexture(thisFaceMode);
	}

	UpdateWindowText(wnd);

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

	// End the 1ms system quantum resolution period
	timeEndPeriod(1);

	return 0;
}
