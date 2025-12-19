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
static LPDIRECT3DTEXTURE9 fenceAlphaTex = NULL;
static LPDIRECT3DTEXTURE9 ventGrateColorKeyTex = NULL;
static LPDIRECT3DTEXTURE9 mazeTex = NULL;
static LPDIRECT3DTEXTURE9 bricksTex = NULL;
static LPDIRECT3DTEXTURE9 blackTex = NULL;
static LPDIRECT3DVERTEXBUFFER9 cubeVB = NULL;
static LPDIRECT3DINDEXBUFFER9 cubeIB = NULL;
static LPDIRECT3DVERTEXBUFFER9 planeVB = NULL;
static LPD3DXMESH teapotMesh = NULL;

struct vert3D
{
	D3DXVECTOR3 pos;
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

static inline void RenderScene0(const long double currentTime)
{
	D3DXMATRIXA16 boxRotation, teapotRotation, teapotScale, teapotWorld;
	D3DXMatrixRotationY(&boxRotation, (const float)(currentTime / 10.0) );
	D3DXMatrixRotationY(&teapotRotation, (const float)(-currentTime / 20.0) );
	D3DXMatrixScaling(&teapotScale, 0.5f, 0.5f, 0.5f);
	teapotWorld = teapotScale * teapotRotation;

	const float alphaSine = (const float)(sin(currentTime * 0.5) * 0.5 + 0.5);
	const unsigned alphaRef = (const unsigned)(alphaSine * 255.0f);
	d3d9dev->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_ALPHAREF, alphaRef);
	d3d9dev->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_LESS);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
	d3d9dev->SetStreamSource(0, cubeVB, 0, sizeof(vert3D) );
	d3d9dev->SetIndices(cubeIB);
	d3d9dev->SetTexture(0, bricksTex);
	d3d9dev->SetTransform(D3DTS_WORLD, &boxRotation);
	d3d9dev->DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 4*6, 0, 2*6);

	d3d9dev->SetRenderState(D3DRS_ALPHATESTENABLE, FALSE);
	d3d9dev->SetTexture(0, NULL);
	d3d9dev->SetTransform(D3DTS_WORLD, &teapotWorld);
	teapotMesh->DrawSubset(0);
}

static inline void RenderScene1(const long double currentTime)
{
	D3DXMATRIXA16 boxScaledUp;
	D3DXMatrixScaling(&boxScaledUp, 4.0f, 4.0f, 4.0f);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
	d3d9dev->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_ALPHAREF, 0x60);
	d3d9dev->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_GREATEREQUAL);
	d3d9dev->SetStreamSource(0, planeVB, 0, sizeof(vert3D) );
	d3d9dev->SetIndices(NULL);
	d3d9dev->SetTexture(0, ventGrateColorKeyTex);
	d3d9dev->SetTransform(D3DTS_WORLD, &boxScaledUp);
	d3d9dev->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);
}

static inline void RenderScene2(const long double currentTime)
{
	D3DXMATRIXA16 boxScaledUp;
	D3DXMatrixScaling(&boxScaledUp, 4.0f, 4.0f, 4.0f);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
	d3d9dev->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_ALPHAREF, 0x60);
	d3d9dev->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_GREATER);
	d3d9dev->SetStreamSource(0, planeVB, 0, sizeof(vert3D) );
	d3d9dev->SetIndices(NULL);
	d3d9dev->SetTexture(0, fenceAlphaTex);
	d3d9dev->SetTransform(D3DTS_WORLD, &boxScaledUp);
	d3d9dev->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);
}

static inline void RenderScene3(const long double currentTime)
{
	D3DXMATRIXA16 boxScaledUp, boxScaledUp2, view;
	D3DXMatrixScaling(&boxScaledUp, 4.001f, 4.001f, 4.001f);
	D3DXMatrixScaling(&boxScaledUp2, 4.002f, 4.002f, 4.002f);

	D3DXVECTOR3 eye(0.0f, 0.0f, -2.05f);
	D3DXVECTOR3 at(0.0f, 0.0f, 0.0f);
	D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
	D3DXMatrixLookAtRH(&view, &eye, &at, &up);
	d3d9dev->SetTransform(D3DTS_VIEW, &view);

	d3d9dev->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_POINT);
	d3d9dev->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_POINT);
	d3d9dev->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_NONE);
	d3d9dev->SetRenderState(D3DRS_ZENABLE, FALSE);

	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_NONE);
	d3d9dev->SetRenderState(D3DRS_ALPHATESTENABLE, FALSE);
	d3d9dev->SetStreamSource(0, planeVB, 0, sizeof(vert3D) );
	d3d9dev->SetIndices(NULL);
	d3d9dev->SetTransform(D3DTS_WORLD, &boxScaledUp);
	d3d9dev->SetTexture(0, blackTex);
	d3d9dev->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);

	d3d9dev->SetRenderState(D3DRS_ALPHATESTENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_ALPHAREF, 255);
	d3d9dev->SetRenderState(D3DRS_ALPHAFUNC, D3DCMP_EQUAL);
	d3d9dev->SetTexture(0, mazeTex);
	d3d9dev->SetTransform(D3DTS_WORLD, &boxScaledUp);
	d3d9dev->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);

	unsigned alphaRef = ( (const unsigned)(currentTime * 10.0) ) & 0xFF;
	if (alphaRef == 0xFF)
		alphaRef = 0x00;
	d3d9dev->SetRenderState(D3DRS_ALPHAREF, alphaRef);
	d3d9dev->SetTransform(D3DTS_WORLD, &boxScaledUp2);
	d3d9dev->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);

	/*alphaRef++;
	if (alphaRef == 0xFF)
		alphaRef = 0x00;
	d3d9dev->SetRenderState(D3DRS_ALPHAREF, alphaRef);
	d3d9dev->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);

	alphaRef++;
	if (alphaRef == 0xFF)
		alphaRef = 0x00;
	d3d9dev->SetRenderState(D3DRS_ALPHAREF, alphaRef);
	d3d9dev->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 2);*/
}

static inline void RenderFrame(const long double timeDelta)
{
	static long double currentTime = 0.0;
	currentTime += timeDelta;
	
	static unsigned sceneID = 0;
	if ( (GetAsyncKeyState('0') & 0x8000) || (GetAsyncKeyState('R') & 0x8000) )
		sceneID = 0;
	else if (GetAsyncKeyState('1') & 0x8000)
		sceneID = 1;
	else if (GetAsyncKeyState('2') & 0x8000)
		sceneID = 2;
	else if (GetAsyncKeyState('3') & 0x8000)
		sceneID = 3;

	switch (sceneID)
	{
	default:
	case 0:
	case 3:
		d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(127, 127, 127), 1.0f, 0x00000000);
		break;
	case 1:
	case 2:
		d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0, 0, 255), 1.0f, 0x00000000);
		break;
	}
	d3d9dev->BeginScene();

	// Set our global renderstates here:
	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0) );
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_COLORVERTEX, TRUE);
	d3d9dev->SetRenderState(D3DRS_DIFFUSEMATERIALSOURCE, D3DMCS_COLOR1);
	d3d9dev->SetRenderState(D3DRS_AMBIENTMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_SPECULARMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_EMISSIVEMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSU, D3DTADDRESS_WRAP);
	d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSV, D3DTADDRESS_WRAP);
	d3d9dev->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_NONE);
	d3d9dev->SetRenderState(D3DRS_ZENABLE, TRUE);

	D3DXMATRIXA16 world, view, proj;
	D3DXMatrixIdentity(&world);
	D3DXVECTOR3 eye(0.0f, 1.5f, -1.5f);
	D3DXVECTOR3 at(0.0f, 0.0f, 0.0f);
	D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
	D3DXMatrixLookAtRH(&view, &eye, &at, &up);
	D3DXMatrixPerspectiveFovRH(&proj, D3DXToRadian(90.0f), 640.0f / 480.0f, 0.01f, 100.0f);
	d3d9dev->SetTransform(D3DTS_WORLD, &world);
	d3d9dev->SetTransform(D3DTS_VIEW, &view);
	d3d9dev->SetTransform(D3DTS_PROJECTION, &proj);

	// Render stuff here!
	switch (sceneID)
	{
	default:
	case 0:
		RenderScene0(currentTime);
		break;
	case 1:
		RenderScene1(currentTime);
		break;
	case 2:
		RenderScene2(currentTime);
		break;
	case 3:
		RenderScene3(currentTime);
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

void AddDissolveAlphaToBricksTex(LPDIRECT3DTEXTURE9 bricksTex)
{
	D3DLOCKED_RECT d3dlr = {0};
	D3DSURFACE_DESC desc = {};
	bricksTex->GetLevelDesc(0, &desc);
	bricksTex->LockRect(0, &d3dlr, NULL, 0);
	D3DCOLOR* const startingTexel = (D3DCOLOR* const)d3dlr.pBits;
	for (unsigned y = 0; y < desc.Height; ++y)
	{
		D3DCOLOR* const rowStart = (D3DCOLOR* const)( (const char* const)startingTexel + d3dlr.Pitch * y);
		for (unsigned x = 0; x < desc.Width; ++x)
		{
			D3DCOLOR& thisTexel = rowStart[x];
			const unsigned texelB = thisTexel & 0xFF;
			const unsigned texelG = (thisTexel >> 8) & 0xFF;
			const unsigned texelR = (thisTexel >> 16) & 0xFF;
			const unsigned texelA = 255 - (rand() % 224 + 16); // Invert our alpha so that we can use D3DCMP_LESS as the alpha-test
			thisTexel = D3DCOLOR_ARGB(texelA, texelR, texelG, texelB);
		}
	}
	bricksTex->UnlockRect(0);
}

struct uint2
{
	unsigned x;
	unsigned y;

	inline const bool operator==(const uint2& rhs) const
	{
		return x == rhs.x && y == rhs.y;
	}
};

static inline const bool IsTexelMazePath(const D3DCOLOR color)
{
	const unsigned thisColorR = (color >> 16) & 0xFF;
	return thisColorR > 0x80;
}

static inline const bool IsPointAlreadyInSet(const uint2& newPoint, const std::vector<uint2>& foundMazePoints)
{
	const unsigned numPoints = (const unsigned)foundMazePoints.size();
	for (unsigned x = 0; x < numPoints; ++x)
	{
		if (newPoint == foundMazePoints[x])
			return true;
	}
	return false;
}

void AddAlphaToMazeTex(LPDIRECT3DTEXTURE9 mazeTex)
{
	D3DLOCKED_RECT d3dlr = {0};
	D3DSURFACE_DESC desc = {};
	mazeTex->GetLevelDesc(0, &desc);
	mazeTex->LockRect(0, &d3dlr, NULL, 0);
	std::vector<uint2> foundMazePathInOrder;
	std::vector<D3DCOLOR> textureCopy;
	textureCopy.resize(128 * 128);
	D3DCOLOR* const startingTexel = (D3DCOLOR* const)d3dlr.pBits;
	for (unsigned y = 0; y < desc.Height; ++y)
	{
		D3DCOLOR* const rowStart = (D3DCOLOR* const)( (const char* const)startingTexel + d3dlr.Pitch * y);
		memcpy(&textureCopy[y * 128], rowStart, 128 * sizeof(D3DCOLOR) );
	}
	unsigned firstMazeLineFound = 0;
	for (unsigned x = 0; x < 128; ++x)
	{
		const D3DCOLOR thisTexel = textureCopy[x];
		if (IsTexelMazePath(thisTexel) )
		{
			firstMazeLineFound = x;
			break;
		}
	}
	uint2 startingPos = { firstMazeLineFound, 0 };
	foundMazePathInOrder.push_back(startingPos);

	while (true)
	{
		const uint2 currentPos = foundMazePathInOrder.back();
		const D3DCOLOR* const currentTexel = &textureCopy[currentPos.y * 128 + currentPos.x];
		const D3DCOLOR* rightTexel = NULL;
		const D3DCOLOR* leftTexel = NULL;
		const D3DCOLOR* topTexel = NULL;
		const D3DCOLOR* bottomTexel = NULL;
		uint2 rightPoint, leftPoint, topPoint, bottomPoint;
		if (currentPos.x < 127)
		{
			rightPoint = currentPos;
			rightPoint.x += 1;
			rightTexel = &textureCopy[rightPoint.y * 128 + rightPoint.x];
		}
		if (currentPos.x > 0)
		{
			leftPoint = currentPos;
			leftPoint.x -= 1;
			leftTexel = &textureCopy[leftPoint.y * 128 + leftPoint.x];
		}
		if (currentPos.y > 0)
		{
			topPoint = currentPos;
			topPoint.y -= 1;
			topTexel = &textureCopy[topPoint.y * 128 + topPoint.x];
		}
		if (currentPos.y < 127)
		{
			bottomPoint = currentPos;
			bottomPoint.y += 1;
			bottomTexel = &textureCopy[bottomPoint.y * 128 + bottomPoint.x];
		}
		if (rightTexel && IsTexelMazePath(*rightTexel) && !IsPointAlreadyInSet(rightPoint, foundMazePathInOrder) )
		{
			foundMazePathInOrder.push_back(rightPoint);
		}
		else if (leftTexel && IsTexelMazePath(*leftTexel) && !IsPointAlreadyInSet(leftPoint, foundMazePathInOrder) )
		{
			foundMazePathInOrder.push_back(leftPoint);
		}
		else if (topTexel && IsTexelMazePath(*topTexel) && !IsPointAlreadyInSet(topPoint, foundMazePathInOrder) )
		{
			foundMazePathInOrder.push_back(topPoint);
		}
		else if (bottomTexel && IsTexelMazePath(*bottomTexel) && !IsPointAlreadyInSet(bottomPoint, foundMazePathInOrder) )
		{
			foundMazePathInOrder.push_back(bottomPoint);
		}
		else
		{
			// We're done! No more points to be discovered
			break;
		}
	}

	const unsigned numMazeLineEntries = (const unsigned)foundMazePathInOrder.size();
	const float iterAlpha = 254.0f / numMazeLineEntries;
	float currentAlpha = 0.0f;
	for (unsigned mazeLineIndex = 0; mazeLineIndex < numMazeLineEntries; ++mazeLineIndex)
	{
		const uint2& thisPoint = foundMazePathInOrder[mazeLineIndex];
		D3DCOLOR* const rowStart = (D3DCOLOR* const)( (const char* const)startingTexel + d3dlr.Pitch * thisPoint.y);
		D3DCOLOR& thisTexel = rowStart[thisPoint.x];
		const unsigned texelB = thisTexel & 0xFF;
		const unsigned texelG = (thisTexel >> 8) & 0xFF;
		const unsigned texelR = (thisTexel >> 16) & 0xFF;
		const unsigned texelA = (const unsigned)currentAlpha;
		thisTexel = D3DCOLOR_ARGB(texelA, texelR, texelG, texelB);

		currentAlpha += iterAlpha;
	}

	mazeTex->UnlockRect(0);
}

static void CreateCube()
{
	if (FAILED(d3d9dev->CreateVertexBuffer(4 * 6 * sizeof(vert3D), D3DUSAGE_WRITEONLY, D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0), D3DPOOL_DEFAULT, &cubeVB, NULL) ) )
	{
		printf("Error in CreateVertexBuffer()\n");
		return;
	}

	if (FAILED(d3d9dev->CreateIndexBuffer(2 * 3 * 6 * sizeof(unsigned short), D3DUSAGE_WRITEONLY, D3DFMT_INDEX16, D3DPOOL_DEFAULT, &cubeIB, NULL) ) )
	{
		printf("Error in CreateIndexBuffer()\n");
		return;
	}

	vert3D* lockedVB = NULL;
	cubeVB->Lock(0, 0, (void**)&lockedVB, NULL);
	// -x face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 0];
		thisVert.vertColor = D3DCOLOR_ARGB(255, 255, 255, 255);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(-1.0f, thisVert.texcoord.x * 2.0f - 1.0f, thisVert.texcoord.y * 2.0f - 1.0f);
		thisVert.texcoord.x *= 2.0f;
		thisVert.texcoord.y *= 2.0f;
	}
	// +x face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 4];
		thisVert.vertColor = D3DCOLOR_ARGB(255, 255, 255, 255);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(1.0f, thisVert.texcoord.x * 2.0f - 1.0f, thisVert.texcoord.y * 2.0f - 1.0f);
		thisVert.texcoord.x *= 2.0f;
		thisVert.texcoord.y *= 2.0f;
	}
	// -y face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 8];
		thisVert.vertColor = D3DCOLOR_ARGB(255, 255, 255, 255);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(thisVert.texcoord.x * 2.0f - 1.0f, -1.0f, thisVert.texcoord.y * 2.0f - 1.0f);
		thisVert.texcoord.x *= 2.0f;
		thisVert.texcoord.y *= 2.0f;
	}
	// +y face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 12];
		thisVert.vertColor = D3DCOLOR_ARGB(255, 255, 255, 255);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(thisVert.texcoord.x * 2.0f - 1.0f, 1.0f, thisVert.texcoord.y * 2.0f - 1.0f);
		thisVert.texcoord.x *= 2.0f;
		thisVert.texcoord.y *= 2.0f;
	}
	// -z face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 16];
		thisVert.vertColor = D3DCOLOR_ARGB(255, 255, 255, 255);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(thisVert.texcoord.x * 2.0f - 1.0f, thisVert.texcoord.y * 2.0f - 1.0f, -1.0f);
		thisVert.texcoord.x *= 2.0f;
		thisVert.texcoord.y *= 2.0f;
	}
	// +z face
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x + 20];
		thisVert.vertColor = D3DCOLOR_ARGB(255, 255, 255, 255);
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.pos = D3DXVECTOR3(thisVert.texcoord.x * 2.0f - 1.0f, thisVert.texcoord.y * 2.0f - 1.0f, 1.0f);
		thisVert.texcoord.x *= 2.0f;
		thisVert.texcoord.y *= 2.0f;
	}
	cubeVB->Unlock();

	unsigned short* lockedIB = NULL;
	cubeIB->Lock(0, 0, (void**)&lockedIB, NULL);
	memcpy(lockedIB, staticIndices, sizeof(staticIndices) );
	cubeIB->Unlock();
}

void PrintWelcomeAndControlsMessage()
{
	printf("Alpha Testing Test\n");
	printf("\n");
	printf("Controls:\n");
	printf("[0]-[9]: Selects scene 0-9\n");
	printf("[R]: Resets everything to the defaults, including the scene\n");
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

	if (FAILED(D3DXCreateTextureFromFileExA(d3d9dev, "FenceCrosshatchAlpha128x128.png", D3DX_FROM_FILE, D3DX_FROM_FILE, 1, 0, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0x00000000, NULL, NULL, &fenceAlphaTex) ) )
	{
		printf("Error loading texture\n");
		return 1;
	}

	if (FAILED(D3DXCreateTextureFromFileExA(d3d9dev, "VentGrate128x128.png", D3DX_FROM_FILE, D3DX_FROM_FILE, 1, 0, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, D3DCOLOR_ARGB(255, 255, 0, 255), NULL, NULL, &ventGrateColorKeyTex) ) )
	{
		printf("Error loading texture\n");
		return 1;
	}

	if (FAILED(D3DXCreateTextureFromFileExA(d3d9dev, "MazeOpaque128x128.png", D3DX_FROM_FILE, D3DX_FROM_FILE, 1, 0, D3DFMT_A8R8G8B8, D3DPOOL_MANAGED, D3DX_DEFAULT, D3DX_DEFAULT, 0x00000000, NULL, NULL, &mazeTex) ) )
	{
		printf("Error loading texture\n");
		return 1;
	}
	AddAlphaToMazeTex(mazeTex);

	if (FAILED(D3DXCreateTextureFromFileExA(d3d9dev, "TilingBricks64x64.png", D3DX_FROM_FILE, D3DX_FROM_FILE, 1, 0, D3DFMT_A8R8G8B8, D3DPOOL_MANAGED, D3DX_DEFAULT, D3DX_DEFAULT, 0x00000000, NULL, NULL, &bricksTex) ) )
	{
		printf("Error loading texture\n");
		return 1;
	}
	AddDissolveAlphaToBricksTex(bricksTex);

	if (FAILED(d3d9dev->CreateTexture(1, 1, 0, 0, D3DFMT_A8R8G8B8, D3DPOOL_MANAGED, &blackTex, NULL) ) )
	{
		printf("Error creating texture\n");
		return 1;
	}

	if (FAILED(d3d9dev->CreateVertexBuffer(4 * sizeof(vert3D), D3DUSAGE_WRITEONLY, D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0), D3DPOOL_DEFAULT, &planeVB, NULL) ) )
	{
		printf("Error creating vertex buffer\n");
		return 1;
	}
	vert3D* lockedVB = NULL;
	planeVB->Lock(0, 0, (void**)&lockedVB, 0);
	for (unsigned x = 0; x < 4; ++x)
	{
		vert3D& thisVert = lockedVB[x];
		thisVert.texcoord.x = (const float)(x & 0x1);
		thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
		thisVert.vertColor = D3DCOLOR_ARGB(255, 255, 255, 255);
		thisVert.pos.x = thisVert.texcoord.x - 0.5f;
		thisVert.pos.y = thisVert.texcoord.y - 0.5f;
		thisVert.pos.z = 0.0f;
		thisVert.texcoord.x *= 2.0f;
		thisVert.texcoord.y *= 2.0f;
	}
	planeVB->Unlock();

	D3DLOCKED_RECT d3dlr = {0};
	blackTex->LockRect(0, &d3dlr, NULL, 0);
	{
		D3DCOLOR* const texels = (D3DCOLOR* const)d3dlr.pBits;
		*texels = D3DCOLOR_ARGB(255, 0, 0, 0);
	}
	blackTex->UnlockRect(0);

	CreateCube();

	if (FAILED(D3DXCreateTeapot(d3d9dev, &teapotMesh, NULL) ) )
	{
		printf("Failed to create sphere mesh\n");
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
