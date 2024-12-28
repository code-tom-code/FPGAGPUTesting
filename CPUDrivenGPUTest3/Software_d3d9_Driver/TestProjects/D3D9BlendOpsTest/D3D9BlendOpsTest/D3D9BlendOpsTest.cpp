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
#include <vector>

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
static LPDIRECT3DVERTEXBUFFER9 quadsVB = NULL;
static LPDIRECT3DINDEXBUFFER9 quadsIB = NULL;
static HWND wnd = NULL;

struct vert2D
{
	D3DXVECTOR3 xyz;
	D3DXVECTOR2 texcoord;
};

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

static const char* const blendOpStrings[5] = 
{
	"ADD",
	"SUBTRACT",
	"REVSUBTRACT",
	"MIN",
	"MAX"
};

void RenderFrame(const long double deltaSeconds)
{
	static long double time = 0.0;
	time += deltaSeconds;

	const float sinWav = (const float)sin(time);
	const unsigned sinVal = (const unsigned)(sinWav * 127 + 127);

	static unsigned blendOpSelect = 0;

	if (GetAsyncKeyState(VK_RIGHT) & 0x1)
		++blendOpSelect;
	if (GetAsyncKeyState(VK_LEFT) & 0x1)
		if (--blendOpSelect > 0x8000)
			blendOpSelect = 4;
	blendOpSelect %= 5;
	char buffer[256] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(buffer, "BlendOp: %s", blendOpStrings[blendOpSelect]);
#pragma warning(pop)
	SetWindowTextA(wnd, buffer);

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET, D3DCOLOR_ARGB(255, sinVal, sinVal, sinVal), 1.0f, 0x00000000);

	d3d9dev->BeginScene();

	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_TEX1);

	if (!quadsVB)
	{
		std::vector<vert2D> allVerts;
		std::vector<unsigned short> allIndices;
		allVerts.reserve(15 * 15 * 4);
		allIndices.reserve(6 * 15 * 15);
		static const unsigned short quadIB[6] = { 0, 1, 2, 1, 3, 2 };
		for (unsigned y = 0; y < 15; ++y)
		{
			for (unsigned x = 0; x < 15; ++x)
			{
				for (unsigned z = 0; z < 4; ++z)
				{
					vert2D newVert;
					newVert.texcoord.x = (const float)(z & 0x1);
					newVert.texcoord.y = (const float)( (z >> 1) & 0x1);

					newVert.xyz.x = x * (640.0f / 15.0f) + newVert.texcoord.x * (640.0f / 15.0f) - 0.5f;
					newVert.xyz.y = y * (480.0f / 15.0f) + newVert.texcoord.y * (480.0f / 15.0f) - 0.5f;

					newVert.xyz.x /= 320.0f;
					newVert.xyz.y /= 240.0f;
					newVert.xyz.x -= 1.0f;
					newVert.xyz.y -= 1.0f;

					newVert.xyz.z = 1.0f;
					allVerts.push_back(newVert);
				}

				for (unsigned z = 0; z < 6; ++z)
				{
					const unsigned quadID = y * 15 + x;
					allIndices.push_back(quadIB[z] + quadID * 4);
				}
			}
		}
		d3d9dev->CreateVertexBuffer(allVerts.size() * sizeof(vert2D), 0, D3DFVF_XYZ | D3DFVF_TEX1, D3DPOOL_MANAGED, &quadsVB, NULL);
		vert2D* lockedVB = NULL;
		quadsVB->Lock(0, 0, (void**)&lockedVB, 0);
		memcpy(lockedVB, &allVerts.front(), allVerts.size() * sizeof(vert2D) );
		quadsVB->Unlock();

		d3d9dev->CreateIndexBuffer(allIndices.size() * sizeof(unsigned short), 0, D3DFMT_INDEX16, D3DPOOL_MANAGED, &quadsIB, NULL);
		unsigned short* lockedIB = NULL;
		quadsIB->Lock(0, 0, (void**)&lockedIB, 0);
		memcpy(lockedIB, &allIndices.front(), allIndices.size() * sizeof(unsigned short) );
		quadsIB->Unlock();
	}

	d3d9dev->SetStreamSource(0, quadsVB, 0, sizeof(vert2D) );
	d3d9dev->SetIndices(quadsIB);

	d3d9dev->SetRenderState(D3DRS_ZENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_ZWRITEENABLE, FALSE);

	d3d9dev->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(0, D3DSAMP_MAXANISOTROPY, 1);

	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
	d3d9dev->SetRenderState(D3DRS_ALPHABLENDENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_SEPARATEALPHABLENDENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_BLENDOP, D3DBLENDOP_ADD + blendOpSelect);
	d3d9dev->SetRenderState(D3DRS_COLORVERTEX, FALSE);
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_BLENDFACTOR, D3DCOLOR_ARGB(64, 192, 192, 32) );

	for (unsigned y = 0; y < 15; ++y)
	{
		const D3DBLEND destBlend = (const D3DBLEND)(y + 1);
		for (unsigned x = 0; x < 15; ++x)
		{
			const D3DBLEND srcBlend = (const D3DBLEND)(x + 1);
			d3d9dev->SetRenderState(D3DRS_SRCBLEND, srcBlend);
			d3d9dev->SetRenderState(D3DRS_DESTBLEND, destBlend);
			d3d9dev->DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, (x + y * 15) * 4, 4, (x + y * 15) * 6, 2);
		}
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

	wnd = CreateWindowExA(0L, (LPCSTR)classAtom, windowName, WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, windowWidth, windowHeight, NULL, NULL, classParams.hInstance, NULL);
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
	HRESULT createDeviceHR = d3d9->CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, wnd, D3DCREATE_HARDWARE_VERTEXPROCESSING | D3DCREATE_PUREDEVICE, &d3dpp, &d3d9dev);
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

	LPDIRECT3DTEXTURE9 colorfulParrotTexture = NULL;
	D3DXCreateTextureFromFileA(d3d9dev, "ColorfulParrotSample.jpg", &colorfulParrotTexture);
	d3d9dev->SetTexture(0, colorfulParrotTexture);

	LPDIRECT3DVERTEXSHADER9 simpleVS = LoadVertexShader("SimpleVertexShader");
	if (!simpleVS)
	{
		printf("Error loading vertex shader!\n");
		return 1;
	}

	/*LPDIRECT3DPIXELSHADER9 simplePS = LoadPixelShader("SimplePixelShader");
	if (!simplePS)
	{
		printf("Erorr loading pixel shader!\n");
		return 1;
	}*/

	d3d9dev->SetVertexShader(simpleVS);
	//d3d9dev->SetPixelShader(simplePS);

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
