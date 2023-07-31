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

// Comment out this line to disable the use of queries
#define USE_QUERIES 1

static const char* const windowClassName = "TomsWindowClass";
static const char* const windowName = "TomsWindow";

static const unsigned windowWidth = 640u;
static const unsigned windowHeight = 480u;

static LPDIRECT3D9 d3d9 = NULL;
static LPDIRECT3DDEVICE9 d3d9dev = NULL;
static LPDIRECT3DSURFACE9 originalBackbuffer = NULL;
static LPD3DXMESH cubeMesh = NULL;
static LPDIRECT3DVERTEXBUFFER9 planeMesh = NULL;
static LPDIRECT3DTEXTURE9 sunTexture = NULL;
static LPDIRECT3DTEXTURE9 whiteTex = NULL;
#ifdef USE_QUERIES
	static LPDIRECT3DQUERY9 occlusionQuery = NULL;
	static LPDIRECT3DQUERY9 timestampQueryTopFrame = NULL;
	static LPDIRECT3DQUERY9 timestampQueryBottomFrame = NULL;
	static LPDIRECT3DQUERY9 timestampQueryFreq = NULL;
	static LPDIRECT3DQUERY9 timestampQueryDisjoint = NULL;
#endif

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
	D3DXVECTOR3 pos;
	D3DXVECTOR2 texcoord;
};

static inline void RenderFrame(const long double timeDelta)
{
	static long double currentTime = 0.0f;
	currentTime += timeDelta;

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0, 0, 255), 1.0f, 0x00000000);
	d3d9dev->BeginScene();

#ifdef USE_QUERIES
	timestampQueryDisjoint->Issue(D3DISSUE_BEGIN);
	timestampQueryTopFrame->Issue(D3DISSUE_END);
#endif

	d3d9dev->SetRenderState(D3DRS_LIGHTING, true);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CW);
	d3d9dev->SetRenderState(D3DRS_SPECULARENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_AMBIENT, D3DCOLOR_ARGB(255, 255, 255, 255) );
	d3d9dev->SetRenderState(D3DRS_AMBIENTMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_DIFFUSEMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_SPECULARMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_EMISSIVEMATERIALSOURCE, D3DMCS_MATERIAL);

	// Render stuff here!
	D3DXMATRIXA16 world, view, proj, ident;
	const D3DXVECTOR3 eye(0.0f, 0.0f, -1.5f);
	const D3DXVECTOR3 at(0.0f, 0.0f, 0.0f);
	const D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
	D3DXMatrixIdentity(&ident);
	D3DXMatrixPerspectiveFovRH(&proj, D3DXToRadian(90.0f), windowWidth / (const float)windowHeight, 0.01f, 100.0f);
	D3DXMatrixLookAtRH(&view, &eye, &at, &up);
	D3DXMatrixTranslation(&world, cosf( (const float)currentTime), 0.0f, 0.0f);
	d3d9dev->SetTransform(D3DTS_PROJECTION, &proj);
	d3d9dev->SetTransform(D3DTS_VIEW, &view);
	d3d9dev->SetTransform(D3DTS_WORLD, &world);
	//d3d9dev->SetTexture(0, whiteTex);
	d3d9dev->SetTexture(0, NULL);
	D3DMATERIAL9 cubeMaterial = {0};
	cubeMaterial.Diffuse.r = cubeMaterial.Diffuse.g = cubeMaterial.Diffuse.b = cubeMaterial.Diffuse.a = 1.0f;
	cubeMaterial.Specular = cubeMaterial.Diffuse;
	cubeMaterial.Ambient.r = 0.75f;
	cubeMaterial.Ambient.g = 0.25f;
	cubeMaterial.Ambient.b = 0.75f;
	cubeMaterial.Ambient.a = 1.0f;
	d3d9dev->SetMaterial(&cubeMaterial);

	cubeMesh->DrawSubset(0);

	if (!planeMesh)
	{
		d3d9dev->CreateVertexBuffer(sizeof(vert3D) * 4, 0, D3DFVF_XYZ | D3DFVF_TEX1, D3DPOOL_DEFAULT, &planeMesh, NULL);
		vert3D* lockedVB = NULL;
		planeMesh->Lock(0, 0, (void**)&lockedVB, 0);
		for (unsigned x = 0; x < 4; ++x)
		{
			lockedVB[x].texcoord.x = (const float)(x & 0x1);
			lockedVB[x].texcoord.y = (const float)( (x >> 1) & 0x1);
			lockedVB[x].pos.x = lockedVB[x].texcoord.x * 2.0f - 1.0f;
			lockedVB[x].pos.y = lockedVB[x].texcoord.y * 2.0f - 1.0f;
			lockedVB[x].pos.z = 1.0f;
		}
		planeMesh->Unlock();
	}

	if (!sunTexture)
	{
		d3d9dev->CreateTexture(32, 32, 1, 0, D3DFMT_A8R8G8B8, D3DPOOL_MANAGED, &sunTexture, NULL);
		D3DLOCKED_RECT d3dlr = {0};
		sunTexture->LockRect(0, &d3dlr, NULL, 0);
		const unsigned pitchInTexels = d3dlr.Pitch / sizeof(D3DCOLOR);
		D3DCOLOR* const lockedTexels = (D3DCOLOR* const)d3dlr.pBits;
		for (unsigned y = 0; y < 32; ++y)
		{
			D3DCOLOR* const rowTexels = lockedTexels + pitchInTexels * y;
			for (unsigned x = 0; x < 32; ++x)
			{
				const float xDelta = x - 15.5f;
				const float yDelta = y - 15.5f;
				const float distFromCenter = (xDelta * xDelta + yDelta * yDelta);
				float normalizedDistFromCenter = distFromCenter / 240.25f;
				if (normalizedDistFromCenter > 1.0f)
					normalizedDistFromCenter = 1.0f;
				const float oneMinusNormalizedDist = 1.0f - normalizedDistFromCenter;
				rowTexels[x] = D3DCOLOR_ARGB( (const unsigned)(oneMinusNormalizedDist * 255.0f), (const unsigned)(oneMinusNormalizedDist * 255.0f), (const unsigned)(oneMinusNormalizedDist * 255.0f), (const unsigned)(oneMinusNormalizedDist * 255.0f) );
			}
		}
		sunTexture->UnlockRect(0);
	}

	d3d9dev->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_ALPHAREF, 0x01);
	d3d9dev->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_GREATEREQUAL);
	d3d9dev->SetRenderState(D3DRS_ALPHABLENDENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_SRCBLEND, D3DBLEND_SRCALPHA);
	d3d9dev->SetRenderState(D3DRS_DESTBLEND, D3DBLEND_INVSRCALPHA);
	d3d9dev->SetTexture(0, sunTexture);
	d3d9dev->SetTransform(D3DTS_WORLD, &ident);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);
	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_TEX1);
	d3d9dev->SetStreamSource(0, planeMesh, 0, sizeof(vert3D) );
	D3DMATERIAL9 lensFlareMaterial = {0};
	lensFlareMaterial.Diffuse.r = lensFlareMaterial.Diffuse.g = lensFlareMaterial.Diffuse.b = lensFlareMaterial.Diffuse.a = 1.0f;
	lensFlareMaterial.Specular = lensFlareMaterial.Diffuse;
	lensFlareMaterial.Ambient = lensFlareMaterial.Diffuse;
	DWORD lastFrameVisiblePixels = 0;
#ifdef USE_QUERIES
	while (S_FALSE == occlusionQuery->GetData(&lastFrameVisiblePixels, sizeof(lastFrameVisiblePixels), D3DGETDATA_FLUSH) );
	if (lastFrameVisiblePixels < 1024.0f * 24.0f)
	{
		lensFlareMaterial.Ambient.g = lastFrameVisiblePixels / (1024.0f * 24.0f);
		lensFlareMaterial.Ambient.b = lensFlareMaterial.Ambient.g;
	}
	else
#endif
	{
		lensFlareMaterial.Ambient.g = 1.0f;
		lensFlareMaterial.Ambient.b = 1.0f;
	}
	d3d9dev->SetMaterial(&lensFlareMaterial);
#ifdef USE_QUERIES
	occlusionQuery->Issue(D3DISSUE_BEGIN);
#endif
	d3d9dev->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);
#ifdef USE_QUERIES
	occlusionQuery->Issue(D3DISSUE_END);
#endif

	d3d9dev->EndScene();

#ifdef USE_QUERIES
	timestampQueryBottomFrame->Issue(D3DISSUE_END);
	timestampQueryDisjoint->Issue(D3DISSUE_END);
	timestampQueryFreq->Issue(D3DISSUE_END);

	LARGE_INTEGER topFrameTimestamp = {0};
	LARGE_INTEGER bottomFrameTimestamp = {0};
	LARGE_INTEGER timestampFreq = {0};
	BOOL timestampWasDisjoint = FALSE;
	while (S_FALSE == timestampQueryTopFrame->GetData(&topFrameTimestamp, sizeof(topFrameTimestamp), D3DGETDATA_FLUSH) );
	while (S_FALSE == timestampQueryBottomFrame->GetData(&bottomFrameTimestamp, sizeof(bottomFrameTimestamp), D3DGETDATA_FLUSH) );
	while (S_FALSE == timestampQueryFreq->GetData(&timestampFreq, sizeof(timestampFreq), D3DGETDATA_FLUSH) );
	while (S_FALSE == timestampQueryDisjoint->GetData(&timestampWasDisjoint, sizeof(timestampWasDisjoint), D3DGETDATA_FLUSH) );
	const unsigned __int64 frameTimeTicks = bottomFrameTimestamp.QuadPart - topFrameTimestamp.QuadPart;
	const long double ldSecondsPerFrame = frameTimeTicks / (const long double)timestampFreq.QuadPart;
	printf("Disjoint: %s; Freq: %I64u ticks per second; %I64u ticks per frame; %gms per frame\n", timestampWasDisjoint ? "TRUE" : "FALSE", timestampFreq.QuadPart,
		frameTimeTicks, ldSecondsPerFrame * 1000.0);
#endif

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

	{
		d3d9dev->CreateTexture(1, 1, 1, 0, D3DFMT_A8R8G8B8, D3DPOOL_MANAGED, &whiteTex, NULL);
		D3DLOCKED_RECT d3dlr = {0};
		whiteTex->LockRect(0, &d3dlr, NULL, 0);
		D3DCOLOR* const lockedTexels = (D3DCOLOR* const)d3dlr.pBits;
		*lockedTexels = D3DCOLOR_ARGB(255, 255, 255, 255);
		whiteTex->UnlockRect(0);
	}

#ifdef USE_QUERIES
	if (FAILED(d3d9dev->CreateQuery(D3DQUERYTYPE_OCCLUSION, &occlusionQuery) ) )
	{
		printf("Error in CreateQuery()\n");
		return 1;
	}
	occlusionQuery->Issue(D3DISSUE_BEGIN);
	occlusionQuery->Issue(D3DISSUE_END);

	if (FAILED(d3d9dev->CreateQuery(D3DQUERYTYPE_TIMESTAMP, &timestampQueryTopFrame) ) )
	{
		printf("Error in CreateQuery()\n");
		return 1;
	}
	if (FAILED(d3d9dev->CreateQuery(D3DQUERYTYPE_TIMESTAMP, &timestampQueryBottomFrame) ) )
	{
		printf("Error in CreateQuery()\n");
		return 1;
	}
	if (FAILED(d3d9dev->CreateQuery(D3DQUERYTYPE_TIMESTAMPFREQ, &timestampQueryFreq) ) )
	{
		printf("Error in CreateQuery()\n");
		return 1;
	}
	if (FAILED(d3d9dev->CreateQuery(D3DQUERYTYPE_TIMESTAMPDISJOINT, &timestampQueryDisjoint) ) )
	{
		printf("Error in CreateQuery()\n");
		return 1;
	}
#endif

	if (FAILED(D3DXCreateBox(d3d9dev, 1.0f, 1.0f, 1.0f, &cubeMesh, NULL) ) )
	{
		printf("Error in D3DXCreateBox()\n");
		return 1;
	}
	
	if (FAILED(d3d9dev->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &originalBackbuffer) ) || !originalBackbuffer)
	{
		printf("Error in GetBackBuffer()\n");
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

		//Sleep(16);
	}

	DestroyWindow(wnd);
	UnregisterClassA( (LPCSTR)classAtom, classParams.hInstance);

	return 0;
}
