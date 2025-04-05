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

static const unsigned planeSubdivisions = 32u;

static LPDIRECT3D9 d3d9 = NULL;
static LPDIRECT3DDEVICE9 d3d9dev = NULL;
static LPDIRECT3DSURFACE9 originalBackbuffer = NULL;
static LPD3DXMESH teapot = NULL;
static LPDIRECT3DTEXTURE9 graniteTex = NULL;
static LPDIRECT3DVERTEXBUFFER9 vb = NULL;
static LPDIRECT3DINDEXBUFFER9 ib = NULL;
static LPD3DXMESH sphereMesh = NULL;
static LPD3DXMESH textMesh = NULL;

static const D3DCOLOR graniteColorPalette[32] =
{
	0xFFb5ada5,
	0xFFada59c,
	0xFFa59c94,
	0xFFbdb5ad,
	0xFF9c948c,
	0xFFc5bdb5,
	0xFFb5ad9c,
	0xFFb5a59c,
	0xFFad9c94,
	0xFF948c84,
	0xFFbdb5a5,
	0xFFada594,
	0xFFb5b5ad,
	0xFFbdada5,
	0xFFc5b5ad,
	0xFFadada5,
	0xFFb5a594,
	0xFFa5948c,
	0xFFcec5bd,
	0xFF9c9c94,
	0xFFa5a59c,
	0xFF94948c,
	0xFFbdad9c,
	0xFF8c847b,
	0xFFc5bdad,
	0xFFcebdb5,
	0xFFbdbdb5,
	0xFFa59c8c,
	0xFF9c9484,
	0xFFa59c9c,
	0xFF9c9494,
	0xFFcec5b5
};

struct vert3d
{
	D3DXVECTOR3 pos;
	D3DXVECTOR3 normal;
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

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0, 0, 255), 1.0f, 0x00000000);
	d3d9dev->BeginScene();

	// Render stuff here!
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CW);
	d3d9dev->SetRenderState(D3DRS_LIGHTING, TRUE);
	d3d9dev->SetRenderState(D3DRS_AMBIENTMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_DIFFUSEMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_EMISSIVEMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_SPECULARMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_SPECULARENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_ZENABLE, TRUE);

	D3DMATERIAL9 teapotMat = {0};
	teapotMat.Ambient.a = teapotMat.Ambient.r = teapotMat.Ambient.g = teapotMat.Ambient.b = 1.0f;
	teapotMat.Diffuse = teapotMat.Ambient;
	teapotMat.Specular = teapotMat.Ambient;
	teapotMat.Ambient.r = 0.1f;
	teapotMat.Ambient.g = 0.1f;
	teapotMat.Ambient.b = 0.1f;
	teapotMat.Diffuse.r = 0.9f;
	teapotMat.Diffuse.g = 0.9f;
	teapotMat.Diffuse.b = 0.9f;
	teapotMat.Specular.r = 0.5f;
	teapotMat.Specular.g = 0.5f;
	teapotMat.Specular.b = 0.5f;
	teapotMat.Power = 4.0f;
	d3d9dev->SetMaterial(&teapotMat);

	d3d9dev->SetRenderState(D3DRS_AMBIENT, D3DCOLOR_ARGB(32, 32, 32, 32) );
	D3DLIGHT9 dirLight = {};
	dirLight.Ambient.a = dirLight.Ambient.r = dirLight.Ambient.g = dirLight.Ambient.b = 1.0f;
	dirLight.Diffuse = dirLight.Ambient;
	dirLight.Specular = dirLight.Ambient;
	dirLight.Diffuse.r = 0.9f;
	dirLight.Diffuse.g = 0.9f;
	dirLight.Diffuse.b = 0.9f;
	dirLight.Position = D3DXVECTOR3(0.0f, 0.0f, 0.0f);
	dirLight.Type = D3DLIGHT_DIRECTIONAL;
	dirLight.Direction = D3DXVECTOR3(0.1f, -1.0f, -0.1f);
	dirLight.Phi = D3DX_PI;
	dirLight.Theta = 0.0f;
	dirLight.Falloff = 1.0f;
	D3DXVec3Normalize( (D3DXVECTOR3* const)&dirLight.Direction, (D3DXVECTOR3* const)&dirLight.Direction);
	d3d9dev->SetLight(0, &dirLight);
	d3d9dev->LightEnable(0, TRUE);

	D3DLIGHT9 pointLight = {};
	pointLight.Ambient.a = pointLight.Ambient.r = pointLight.Ambient.g = pointLight.Ambient.b = 1.0f;
	pointLight.Diffuse = pointLight.Ambient;
	pointLight.Specular = pointLight.Ambient;
	D3DXVECTOR3 pointLightColor = paletteColor( (const float)time / 10.0f, D3DXVECTOR3(0.5f, 0.5f, 0.5f), D3DXVECTOR3(0.5f, 0.5f, 0.5f), D3DXVECTOR3(1.0f, 1.0f, 1.0f), D3DXVECTOR3(0.0f, 1.0f / 3.0f, 2.0f / 3.0f) );
	pointLight.Diffuse.r = pointLightColor.x;
	pointLight.Diffuse.g = pointLightColor.y;
	pointLight.Diffuse.b = pointLightColor.z;
	pointLight.Range = 6.0f;
	pointLight.Position = D3DXVECTOR3(cosf( (const float)time) * 2.5f, 0.0f, sinf( (const float)time) * 2.5f);
	pointLight.Type = D3DLIGHT_POINT;
	pointLight.Direction.x = pointLight.Direction.y = pointLight.Direction.z = 0.0f;
	pointLight.Phi = D3DX_PI;
	pointLight.Attenuation1 = 1.0f;
	pointLight.Theta = 0.0f;
	pointLight.Falloff = 1.0f;
	d3d9dev->SetLight(1, &pointLight);
	d3d9dev->LightEnable(1, TRUE);

	static D3DXVECTOR3 camPos(0.01f, 1.75f, -1.5f);

	float moveAmount = 0.01f;
	if (GetAsyncKeyState(VK_SHIFT) )
	{
		moveAmount *= 10.0f;
	}
	else if (GetAsyncKeyState(VK_CONTROL) )
	{
		moveAmount /= 10.0f;
	}

	if (GetAsyncKeyState(VK_RIGHT) )
	{
		camPos.x += moveAmount;
	}
	if (GetAsyncKeyState(VK_LEFT) )
	{
		camPos.x -= moveAmount;
	}
	if (GetAsyncKeyState(VK_UP) )
	{
		camPos.z += moveAmount;
	}
	if (GetAsyncKeyState(VK_DOWN) )
	{
		camPos.z -= moveAmount;
	}
	if (GetAsyncKeyState(VK_SPACE) )
	{
		camPos.y += moveAmount;
	}
	if (GetAsyncKeyState('C') )
	{
		camPos.y -= moveAmount;
	}

	D3DXVECTOR3 at(0.0f, 0.0f, 0.0f);
	D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
	D3DXMATRIXA16 world, world2, view, proj, wvp, wv;
	D3DXMatrixLookAtRH(&view, &camPos, &at, &up);
	D3DXMatrixPerspectiveFovRH(&proj, D3DXToRadian(90.0f), 640.0f / 480.0f, 0.01f, 100.0f);
	D3DXMatrixRotationY(&world, D3DXToRadian(180.0f) );
	d3d9dev->SetTransform(D3DTS_VIEW, &view);
	d3d9dev->SetTransform(D3DTS_PROJECTION, &proj);
	d3d9dev->SetTransform(D3DTS_WORLD, &world);

	wvp = world * view * proj;
	d3d9dev->SetVertexShaderConstantF(0, &wvp.m[0][0], 4);

	D3DXMatrixInverse(&wv, NULL, &view);
	D3DXMatrixTranspose(&wv, &wv);
	d3d9dev->SetVertexShaderConstantF(4, &wv.m[0][0], 4);

	d3d9dev->SetTexture(0, NULL);
	teapot->DrawSubset(0);

	D3DMATERIAL9 graniteMat = {0};
	graniteMat.Ambient.a = graniteMat.Ambient.r = graniteMat.Ambient.g = graniteMat.Ambient.b = 1.0f;
	graniteMat.Diffuse = graniteMat.Ambient;
	graniteMat.Specular = graniteMat.Ambient;
	graniteMat.Ambient.r = 0.25f;
	graniteMat.Ambient.g = 0.25f;
	graniteMat.Ambient.b = 0.25f;
	graniteMat.Diffuse.r = 1.0f;
	graniteMat.Diffuse.g = 1.0f;
	graniteMat.Diffuse.b = 1.0f;
	graniteMat.Specular.r = 0.5f;
	graniteMat.Specular.g = 0.5f;
	graniteMat.Specular.b = 0.5f;
	graniteMat.Power = 4.0f;
	d3d9dev->SetMaterial(&graniteMat);

	d3d9dev->SetRenderState(D3DRS_AMBIENT, D3DCOLOR_ARGB(255, 255, 255, 255) );

	d3d9dev->SetTexture(0, graniteTex);
	d3d9dev->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_LINEAR);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CW);
	d3d9dev->SetStreamSource(0, vb, 0, sizeof(vert3d) );
	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_TEX1 | D3DFVF_NORMAL);
	d3d9dev->SetIndices(ib);
	D3DXVECTOR3 planeScale(13.0f, 13.0f, 13.0f);
	D3DXVECTOR3 planeTranslate(-6.5f, -0.5f, -4.0f);
	D3DXMatrixTransformation(&world, NULL, NULL, &planeScale, NULL, NULL, &planeTranslate);
	d3d9dev->SetTransform(D3DTS_WORLD, &world);

	wvp = world * view * proj;
	d3d9dev->SetVertexShaderConstantF(0, &wvp.m[0][0], 4);

	D3DXMatrixInverse(&wv, NULL, &view);
	D3DXMatrixTranspose(&wv, &wv);
	d3d9dev->SetVertexShaderConstantF(4, &wv.m[0][0], 4);

	d3d9dev->DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, (planeSubdivisions + 1) * (planeSubdivisions + 1), 0, planeSubdivisions * planeSubdivisions * 2);

	D3DXQUATERNION backRotQuat = {};
	D3DXVECTOR3 backRotQuatAxis(1.0f, 0.0f, 0.0f);
	D3DXVECTOR3 backRotationCenter(4.0f, 0.0f, 4.0f);
	D3DXVECTOR3 backPlaneTranslate(-6.5f, -0.5f, 3.0f);
	D3DXQuaternionRotationAxis(&backRotQuat, &backRotQuatAxis, D3DXToRadian(-45.0f) );
	D3DXMatrixTransformation(&world, NULL, NULL, &planeScale, NULL, &backRotQuat, &backPlaneTranslate);
	d3d9dev->SetTransform(D3DTS_WORLD, &world);

	wvp = world * view * proj;
	d3d9dev->SetVertexShaderConstantF(0, &wvp.m[0][0], 4);

	D3DXMatrixInverse(&wv, NULL, &view);
	D3DXMatrixTranspose(&wv, &wv);
	d3d9dev->SetVertexShaderConstantF(4, &wv.m[0][0], 4);

	d3d9dev->DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, (planeSubdivisions + 1) * (planeSubdivisions + 1), 0, planeSubdivisions * planeSubdivisions * 2);

	D3DMATERIAL9 sphereMat = {0};
	sphereMat.Ambient.a = sphereMat.Ambient.r = sphereMat.Ambient.g = sphereMat.Ambient.b = 1.0f;
	sphereMat.Diffuse = sphereMat.Ambient;
	sphereMat.Specular = sphereMat.Ambient;
	sphereMat.Ambient.r = 0.0f;
	sphereMat.Ambient.g = 0.0f;
	sphereMat.Ambient.b = 0.0f;
	sphereMat.Diffuse.r = 0.0f;
	sphereMat.Diffuse.g = 0.0f;
	sphereMat.Diffuse.b = 0.0f;
	sphereMat.Specular.r = 0.0f;
	sphereMat.Specular.g = 0.0f;
	sphereMat.Specular.b = 0.0f;
	sphereMat.Emissive.a = 1.0f;
	sphereMat.Emissive.r = pointLightColor.x * 2.0f;
	sphereMat.Emissive.g = pointLightColor.y * 2.0f;
	sphereMat.Emissive.b = pointLightColor.z * 2.0f;
	sphereMat.Power = 0.0f;
	d3d9dev->SetMaterial(&sphereMat);
	D3DXVECTOR3 sphereScale(0.075f, 0.075f, 0.075f);
	D3DXVECTOR3 spherePosition = pointLight.Position;
	D3DXMatrixTransformation(&world, NULL, NULL, &sphereScale, NULL, NULL, &spherePosition);
	d3d9dev->SetTransform(D3DTS_WORLD, &world);

	wvp = world * view * proj;
	d3d9dev->SetVertexShaderConstantF(0, &wvp.m[0][0], 4);

	D3DXMatrixInverse(&wv, NULL, &view);
	D3DXMatrixTranspose(&wv, &wv);
	d3d9dev->SetVertexShaderConstantF(4, &wv.m[0][0], 4);

	sphereMesh->DrawSubset(0);

	D3DMATERIAL9 textMat = {0};
	textMat.Ambient.a = textMat.Ambient.r = textMat.Ambient.g = textMat.Ambient.b = 1.0f;
	textMat.Diffuse = textMat.Ambient;
	textMat.Specular = textMat.Ambient;
	textMat.Ambient.r = 0.0f;
	textMat.Ambient.g = 0.0f;
	textMat.Ambient.b = 0.0f;
	textMat.Diffuse.r = 0.0f;
	textMat.Diffuse.g = 0.0f;
	textMat.Diffuse.b = 0.0f;
	textMat.Specular.r = 0.0f;
	textMat.Specular.g = 0.0f;
	textMat.Specular.b = 0.0f;
	textMat.Emissive.a = 1.0f;
	textMat.Emissive.r = pointLightColor.x * 2.0f;
	textMat.Emissive.g = pointLightColor.y * 2.0f;
	textMat.Emissive.b = pointLightColor.z * 2.0f;
	textMat.Power = 0.0f;
	d3d9dev->SetMaterial(&textMat);
	D3DXVECTOR3 textScale(0.5f, 0.5f, 0.5f);
	D3DXVECTOR3 textPosition = pointLight.Position;
	textPosition *= 0.5f;
	textPosition += D3DXVECTOR3(0.0f, 0.75f, 0.0f);
	textPosition += D3DXVECTOR3(1.5f, 0.0f, 0.0f);
	D3DXQUATERNION textQuat = {};
	D3DXQuaternionRotationYawPitchRoll(&textQuat, D3DXToRadian(180.0f), 0.0f, 0.0f);
	D3DXMatrixTransformation(&world, NULL, NULL, &textScale, NULL, &textQuat, &textPosition);
	d3d9dev->SetTransform(D3DTS_WORLD, &world);
	d3d9dev->LightEnable(0, FALSE);

	wvp = world * view * proj;
	d3d9dev->SetVertexShaderConstantF(0, &wvp.m[0][0], 4);

	D3DXMatrixInverse(&wv, NULL, &view);
	D3DXMatrixTranspose(&wv, &wv);
	d3d9dev->SetVertexShaderConstantF(4, &wv.m[0][0], 4);

	textMesh->DrawSubset(0);

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
#ifdef _M_X64
#ifdef _DEBUG
		sprintf(buffer, "..\\x64\\Debug\\%s.cso", filename);
#else
		sprintf(buffer, "..\\x64\\Release\\%s.cso", filename);
#endif
#else
#ifdef _DEBUG
		sprintf(buffer, "..\\Debug\\%s.cso", filename);
#else
		sprintf(buffer, "..\\Release\\%s.cso", filename);
#endif
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

void CreatePlaneMesh(unsigned subdivisions)
{
	d3d9dev->CreateVertexBuffer(sizeof(vert3d) * (subdivisions + 1) * (subdivisions + 1), 0, D3DFVF_XYZ | D3DFVF_TEX1 | D3DFVF_NORMAL, D3DPOOL_DEFAULT, &vb, NULL);
	vert3d* lockedVB = NULL;
	vb->Lock(0, 0, (void**)&lockedVB, 0);
	for (unsigned y = 0; y < subdivisions + 1; ++y)
	{
		for (unsigned x = 0; x < subdivisions + 1; ++x)
		{
			vert3d thisVert;
			thisVert.pos.x = x / (const float)(subdivisions);
			thisVert.pos.y = 0.0f;
			thisVert.pos.z = y / (const float)(subdivisions);
			thisVert.normal.x = 0.0f;
			thisVert.normal.y = 1.0f;
			thisVert.normal.z = 0.0f;
			thisVert.texcoord.x = thisVert.pos.x * 4.0f;
			thisVert.texcoord.y = thisVert.pos.z * 4.0f;
			*lockedVB++ = thisVert;
		}
	}
	vb->Unlock();

	d3d9dev->CreateIndexBuffer(6 * sizeof(unsigned short) * subdivisions * subdivisions, 0, D3DFMT_INDEX16, D3DPOOL_DEFAULT, &ib, NULL);
	unsigned short* lockedIB = NULL;
	ib->Lock(0, 0, (void**)&lockedIB, 0);
	for (unsigned y = 0; y < subdivisions; ++y)
	{
		for (unsigned x = 0; x < subdivisions; ++x)
		{
			unsigned short topLeft = y * (subdivisions + 1) + x;
			unsigned short topRight = topLeft + 1;
			unsigned short botLeft = topLeft + subdivisions + 1;
			unsigned short botRight = botLeft + 1;

			*lockedIB++ = topLeft;
			*lockedIB++ = botLeft;
			*lockedIB++ = topRight;

			*lockedIB++ = topRight;
			*lockedIB++ = botLeft;
			*lockedIB++ = botRight;
		}
	}
	ib->Unlock();
}

static const float ColorDistance(const D3DCOLOR a, const D3DCOLOR b)
{
	const unsigned ra = (a >> 16) & 0xFF;
	const unsigned ga = (a >> 8) & 0xFF;
	const unsigned ba = (a) & 0xFF;
	const unsigned rb = (b >> 16) & 0xFF;
	const unsigned gb = (b >> 8) & 0xFF;
	const unsigned bb = (b) & 0xFF;
	const int deltaR = (const int)ra - (const int)rb;
	const int deltaG = (const int)ga - (const int)gb;
	const int deltaB = (const int)ba - (const int)bb;
	const unsigned rsq = deltaR * deltaR;
	const unsigned gsq = deltaG * deltaG;
	const unsigned bsq = deltaB * deltaB;
	const unsigned distSquared = rsq + gsq + bsq;
	return sqrtf( (const float)distSquared);
}

static unsigned char FindClosestColorIndex(const D3DCOLOR color)
{
	unsigned char closestColorIndex = 0;
	float closestColorDistance = ColorDistance(color, graniteColorPalette[0]);
	for (unsigned x = 1; x < 32; ++x)
	{
		const float thisColorDistance = ColorDistance(color, graniteColorPalette[x]);
		if (thisColorDistance < closestColorDistance)
		{
			closestColorIndex = x;
			closestColorDistance = thisColorDistance;
		}
	}
	return closestColorIndex;
}

void PrintWelcomeAndControlsMessage()
{
	printf("Teapot Test\n");
	printf("\n");
	printf("Orbital Camera Controls:\n");
	printf("[Shift]: Speed up the camera\n");
	printf("[Control]: Slow down the camera\n");
	printf("[Right]/[Left]/[Up]/[Down]: Rotate the camera left/right/over/under\n");
	printf("[Space]: Raise the camera up\n");
	printf("[C]: Lower the camera down\n");
	printf("\n");
}

int main(const unsigned argc, const char* const argv[])
{
	PrintWelcomeAndControlsMessage();


	srand(3);

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

	LPDIRECT3DVERTEXSHADER9 vs = LoadVertexShader("TestVS");
	if (!vs)
	{
		printf("Error in LoadVertexShader()\n");
		return 1;
	}
	//d3d9dev->SetVertexShader(vs);

	LPDIRECT3DPIXELSHADER9 ps = LoadPixelShader("TestPS");
	if (!ps)
	{
		printf("Error in LoadPixelShader()\n");
		return 1;
	}
	//d3d9dev->SetPixelShader(ps);
	//d3d9dev->SetRenderState(D3DRS_SHADEMODE, D3DSHADE_FLAT);

	if (FAILED(D3DXCreateTextureFromFileExA(d3d9dev, "Granite128.png", 128, 128, 1, 0, D3DFMT_X8R8G8B8, D3DPOOL_MANAGED, D3DX_DEFAULT, D3DX_DEFAULT, 0, NULL, NULL, &graniteTex) ) )
	{
		printf("Error in D3DXCreateTextureFromFileExA()\n");
		return 1;
	}
	D3DLOCKED_RECT d3dlr = {0};
	graniteTex->LockRect(0, &d3dlr, NULL, 0);
	const BYTE* texelBytes = (const BYTE* const)d3dlr.pBits;
	unsigned char closestIndex[128*128] = {0};
	for (unsigned y = 0; y < 128; ++y)
	{
		const D3DCOLOR* const rowTexels = (const D3DCOLOR* const)(texelBytes + y * d3dlr.Pitch);
		for (unsigned x = 0; x < 128; ++x)
		{
			closestIndex[y * 128 + x] = FindClosestColorIndex(rowTexels[x]);
		}
	}
	unsigned indexHistogram[32] = {0};
	for (unsigned x = 0; x < 128 * 128; ++x)
	{
		++(indexHistogram[closestIndex[x] ]);
	}
	float indexFlatProbability[32] = {0.0f};
	for (unsigned x = 0; x < 32; ++x)
	{
		indexFlatProbability[x] = indexHistogram[x] / (const float)(128 * 128);
	}

	for (unsigned y = 0; y < 128; ++y)
	{
		D3DCOLOR* const rowTexels = (D3DCOLOR* const)(texelBytes + y * d3dlr.Pitch);
		for (unsigned x = 0; x < 128; ++x)
		{
			int randRoll = rand() % (128 * 128);
			D3DCOLOR pickedColor = graniteColorPalette[0];
			for (unsigned z = 0; z < 32; ++z)
			{
				randRoll -= indexHistogram[z];
				if (randRoll <= 0)
				{
					pickedColor = graniteColorPalette[z];
					break;
				}
			}
			rowTexels[x] = pickedColor;
		}
	}
	graniteTex->UnlockRect(0);

	if (FAILED(D3DXCreateTeapot(d3d9dev, &teapot, NULL) ) )
	{
		printf("Error in D3DXCreateTeapot()\n");
		return 1;
	}
	
	if (FAILED(d3d9dev->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &originalBackbuffer) ) || !originalBackbuffer)
	{
		printf("Error in GetBackBuffer()\n");
		return 1;
	}

	if (FAILED(D3DXCreateSphere(d3d9dev, 1.0f, 5, 5, &sphereMesh, NULL) ) )
	{
		printf("Error in D3DXCreateSphere()\n");
		return 1;
	}

	{
		HDC hdc = CreateCompatibleDC( NULL );

		HFONT font;



		font=CreateFont(10, //Height
		0, //Width
		0, //Escapement
		0, //Orientation
		FW_NORMAL, //Weight
		false, //Italic
		false, //Underline
		false, //Strikeout
		DEFAULT_CHARSET,//Charset
		OUT_DEFAULT_PRECIS, //Output Precision
		CLIP_DEFAULT_PRECIS, //Clipping Precision
		DEFAULT_QUALITY, //Quality
		DEFAULT_PITCH|FF_DONTCARE, //Pitch and Family
		"Arial");

		SelectObject(hdc, font);

		if (FAILED(D3DXCreateTextA(d3d9dev, hdc, "Happy wedding!", 0.001f, 0.25f, &textMesh, NULL, NULL) ) )
		{
			printf("Error in D3DXCreateTextA()\n");
			return 1;
		}
	}

	CreatePlaneMesh(planeSubdivisions);

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
