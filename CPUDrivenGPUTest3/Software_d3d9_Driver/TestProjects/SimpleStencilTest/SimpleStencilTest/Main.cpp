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
static HWND wnd = NULL;
static unsigned sceneID = 0;

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
	case WM_KEYDOWN:
		if (wParam >= '0' && wParam <= '9')
		{
			sceneID = wParam - '0';
		}
		else if (wParam == 'R' || wParam == 'r')
		{
			sceneID = 0;
		}
		break;
	}
	return DefWindowProcA(hwnd, uMsg, wParam, lParam);
}

struct vert2D
{
	D3DXVECTOR4 xyzRhw;
	D3DCOLOR color;
};

static inline void RenderScene0(const long double timeDelta)
{
	static LPDIRECT3DVERTEXBUFFER9 vb = NULL;
	if (!vb)
	{
		if (FAILED(d3d9dev->CreateVertexBuffer(sizeof(vert2D) * 6, 0, D3DFVF_XYZRHW | D3DFVF_DIFFUSE, D3DPOOL_DEFAULT, &vb, NULL) ) )
		{
			__debugbreak();
		}

		vert2D* lockedVB = NULL;
		vb->Lock(0, 0, (void** const)&lockedVB, 0);

		vert2D* triangleDown = lockedVB;
		for (unsigned x = 0; x < 3; ++x)
		{
			vert2D& thisVert = triangleDown[x];
			thisVert.color = D3DCOLOR_ARGB(255, 255, 0, 0);

			D3DXVECTOR2 tex2D;
			tex2D.x = (const float)(x & 0x1);
			tex2D.y = (const float)( (x >> 1) & 0x1);

			thisVert.xyzRhw.x = tex2D.x * 0.75f * windowWidth + 0.125f * windowWidth - 0.5f;
			thisVert.xyzRhw.y = tex2D.y * 0.75f * windowHeight + 0.125f * windowHeight - 0.5f;
			thisVert.xyzRhw.z = 0.0f;
			thisVert.xyzRhw.w = 1.0f;
		}

		vert2D* triangleUp = lockedVB + 3;
		for (unsigned x = 0; x < 3; ++x)
		{
			vert2D& thisVert = triangleUp[x];
			thisVert.color = D3DCOLOR_ARGB(255, 0, 255, 0);

			D3DXVECTOR2 tex2D;
			tex2D.x = (const float)( (x + 1) & 0x1);
			tex2D.y = 1.0f - (const float)( ( ( (x + 1) >> 1) & 0x1) );

			thisVert.xyzRhw.x = tex2D.x * 0.75f * windowWidth + 0.125f * windowWidth - 0.5f;
			thisVert.xyzRhw.y = tex2D.y * 0.75f * windowHeight + 0.125f * windowHeight - 0.5f;
			thisVert.xyzRhw.z = 0.0f;
			thisVert.xyzRhw.w = 1.0f;
		}

		vb->Unlock();
	}
	d3d9dev->SetStreamSource(0, vb, 0, sizeof(vert2D) );

	vert2D triangleDown[3];
	for (unsigned x = 0; x < 3; ++x)
	{
		vert2D& thisVert = triangleDown[x];
		thisVert.color = D3DCOLOR_ARGB(255, 255, 0, 0);

		D3DXVECTOR2 tex2D;
		tex2D.x = (const float)(x & 0x1);
		tex2D.y = (const float)( (x >> 1) & 0x1);

		thisVert.xyzRhw.x = tex2D.x * 0.75f * windowWidth + 0.125f * windowWidth - 0.5f;
		thisVert.xyzRhw.y = tex2D.y * 0.75f * windowHeight + 0.125f * windowHeight - 0.5f;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
	}

	vert2D triangleUp[3];
	for (unsigned x = 0; x < 3; ++x)
	{
		vert2D& thisVert = triangleUp[x];
		thisVert.color = D3DCOLOR_ARGB(255, 0, 255, 0);

		D3DXVECTOR2 tex2D;
		tex2D.x = (const float)( (x + 1) & 0x1);
		tex2D.y = 1.0f - (const float)( ( ( (x + 1) >> 1) & 0x1) );

		thisVert.xyzRhw.x = tex2D.x * 0.75f * windowWidth + 0.125f * windowWidth - 0.5f;
		thisVert.xyzRhw.y = tex2D.y * 0.75f * windowHeight + 0.125f * windowHeight - 0.5f;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
	}

	d3d9dev->SetRenderState(D3DRS_STENCILENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_STENCILREF, 0x1);
	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_ALWAYS);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_INCRSAT);
	d3d9dev->SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_ZENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_ZWRITEENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);

	//d3d9dev->DrawPrimitive(D3DPT_TRIANGLESTRIP, 0, 1);
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 1, &triangleDown, sizeof(vert2D) );

	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_EQUAL);

	//d3d9dev->DrawPrimitive(D3DPT_TRIANGLESTRIP, 3, 1);
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 1, &triangleUp, sizeof(vert2D) );
}

static inline void RenderScene1(const long double timeDelta)
{
	static long double time = 0.0;
	time += timeDelta;
	d3d9dev->SetRenderState(D3DRS_STENCILENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_ALWAYS);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_REPLACE);
	d3d9dev->SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_ZENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_ZWRITEENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);

	const float tileWidth = windowWidth / 16.0f;
	const float tileHeight = windowHeight / 16.0f;
	vert2D rectVerts[4];
	for (unsigned y = 0; y < 16; ++y)
	{
		for (unsigned x = 0; x < 16; ++x)
		{
			d3d9dev->SetRenderState(D3DRS_STENCILREF, y * 16 + x);
			for (unsigned z = 0; z < 4; ++z)
			{
				vert2D& thisVert = rectVerts[z];
				thisVert.color = D3DCOLOR_ARGB(255, 0, 255, 0);

				D3DXVECTOR2 tex2D;
				tex2D.x = (const float)( (z) & 0x1);
				tex2D.y = (const float)( ( (z >> 1) & 0x1) );

				thisVert.xyzRhw.x = tileWidth * x + tex2D.x * tileWidth - 0.5f;
				thisVert.xyzRhw.y = tileHeight * y + tex2D.y * tileHeight - 0.5f;
				thisVert.xyzRhw.z = 0.0f;
				thisVert.xyzRhw.w = 1.0f;
			}
			d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &rectVerts, sizeof(vert2D) );
		}
	}
	vert2D fullscreenRectVerts[4];
	const float fStencilRef = (const float)( (sin(time / 4.0f) + 1.0) * 0.5 * 256.0);
	d3d9dev->SetRenderState(D3DRS_STENCILREF, (const unsigned char)(fStencilRef) );
	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_LESSEQUAL);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_KEEP);
	for (unsigned z = 0; z < 4; ++z)
	{
		vert2D& thisVert = rectVerts[z];
		thisVert.color = D3DCOLOR_ARGB(255, 255, 255, 0);

		D3DXVECTOR2 tex2D;
		tex2D.x = (const float)( (z) & 0x1);
		tex2D.y = (const float)( ( (z >> 1) & 0x1) );

		thisVert.xyzRhw.x = windowWidth * tex2D.x - 0.5f;
		thisVert.xyzRhw.y = windowHeight * tex2D.y - 0.5f;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &rectVerts, sizeof(vert2D) );
}

static inline void RenderScene2(const long double timeDelta)
{
	static long double time = 0.0;
	time += timeDelta;
	d3d9dev->SetRenderState(D3DRS_STENCILENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_GREATER);
	d3d9dev->SetRenderState(D3DRS_STENCILREF, 0x40);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_REPLACE);
	d3d9dev->SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_ZENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_ZWRITEENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);

	vert2D windowRectVerts[4];
	for (unsigned z = 0; z < 4; ++z)
	{
		vert2D& thisVert = windowRectVerts[z];
		thisVert.color = D3DCOLOR_ARGB(255, 255, 255, 0);

		D3DXVECTOR2 tex2D;
		tex2D.x = (const float)( (z) & 0x1);
		tex2D.y = (const float)( ( (z >> 1) & 0x1) );

		thisVert.xyzRhw.x = windowWidth * tex2D.x * 0.5f + 0.25f * windowWidth - 0.5f;
		thisVert.xyzRhw.y = windowHeight * tex2D.y * 0.5f + 0.25f * windowHeight - 0.5f;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &windowRectVerts, sizeof(vert2D) );

	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_EQUAL);
	d3d9dev->SetRenderState(D3DRS_STENCILREF, 0x40);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_KEEP);
	vert2D flyingRectVerts[4];
	const float fx = cosf( (const float)time) * 0.3f + 0.4f;
	const float fy = sinf( (const float)time * 1.13f) * 0.4f + 0.5f;
	for (unsigned z = 0; z < 4; ++z)
	{
		vert2D& thisVert = flyingRectVerts[z];
		thisVert.color = D3DCOLOR_ARGB(255, 255, 0, 0);

		D3DXVECTOR2 tex2D;
		tex2D.x = (const float)( (z) & 0x1);
		tex2D.y = (const float)( ( (z >> 1) & 0x1) );

		thisVert.xyzRhw.x = windowWidth * tex2D.x * 0.25f + fx * windowWidth - 0.5f;
		thisVert.xyzRhw.y = windowHeight * tex2D.y * 0.25f + fy * windowHeight - 0.5f;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &flyingRectVerts, sizeof(vert2D) );
}

static inline void RenderScene3(const long double timeDelta)
{
	static long double time = 0.0;
	time += timeDelta;
	d3d9dev->SetRenderState(D3DRS_STENCILENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_GREATER);
	d3d9dev->SetRenderState(D3DRS_STENCILREF, 0x40);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_REPLACE);
	d3d9dev->SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_ZENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_ZWRITEENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);

	vert2D fullscreenRectVerts[4];
	const float fStencilRef = (const float)( (sin(time / 4.0f) + 1.0) * 0.5 * 256.0);
	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_ALWAYS);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_INVERT);
	for (unsigned z = 0; z < 4; ++z)
	{
		vert2D& thisVert = fullscreenRectVerts[z];
		thisVert.color = D3DCOLOR_ARGB(255, 255, 255, 255);

		D3DXVECTOR2 tex2D;
		tex2D.x = (const float)( (z) & 0x1);
		tex2D.y = (const float)( ( (z >> 1) & 0x1) );

		thisVert.xyzRhw.x = windowWidth * tex2D.x - 0.5f;
		thisVert.xyzRhw.y = windowHeight * tex2D.y - 0.5f;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &fullscreenRectVerts, sizeof(vert2D) );

	d3d9dev->SetRenderState(D3DRS_COLORWRITEENABLE, 0);
	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_ALWAYS);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_INCR);
	const float tileWidth = windowWidth / 16.0f;
	const float tileHeight = windowHeight / 16.0f;
	vert2D rectVerts[4];
	for (unsigned y = 0; y < 16; ++y)
	{
		for (unsigned x = 0; x < 16; ++x)
		{
			if (y & 0x1)
			{
				if (x & 0x1)
					continue;
			}
			else
			{
				if (!(x & 0x1) )
					continue;
			}
			for (unsigned z = 0; z < 4; ++z)
			{
				vert2D& thisVert = rectVerts[z];
				thisVert.color = D3DCOLOR_ARGB(255, 0, 255, 0);

				D3DXVECTOR2 tex2D;
				tex2D.x = (const float)( (z) & 0x1);
				tex2D.y = (const float)( ( (z >> 1) & 0x1) );

				thisVert.xyzRhw.x = tileWidth * x + tex2D.x * tileWidth - 0.5f;
				thisVert.xyzRhw.y = tileHeight * y + tex2D.y * tileHeight - 0.5f;
				thisVert.xyzRhw.z = 0.0f;
				thisVert.xyzRhw.w = 1.0f;
			}
			d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &rectVerts, sizeof(vert2D) );
		}
	}

	d3d9dev->SetRenderState(D3DRS_COLORWRITEENABLE, D3DCOLORWRITEENABLE_ALPHA | D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE);
	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_EQUAL);
	d3d9dev->SetRenderState(D3DRS_STENCILREF, 0x00);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_KEEP);
	for (unsigned z = 0; z < 4; ++z)
	{
		vert2D& thisVert = fullscreenRectVerts[z];
		thisVert.color = D3DCOLOR_ARGB(255, 0, 0, 0);

		D3DXVECTOR2 tex2D;
		tex2D.x = (const float)( (z) & 0x1);
		tex2D.y = (const float)( ( (z >> 1) & 0x1) );

		thisVert.xyzRhw.x = windowWidth * tex2D.x - 0.5f;
		thisVert.xyzRhw.y = windowHeight * tex2D.y - 0.5f;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &fullscreenRectVerts, sizeof(vert2D) );
}

static inline void RenderScene4(const long double timeDelta)
{
	static long double time = 0.0;
	time += timeDelta;
	d3d9dev->SetRenderState(D3DRS_STENCILENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_NEVER);
	d3d9dev->SetRenderState(D3DRS_STENCILREF, 0x00);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_ZENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_ZWRITEENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);

	vert2D windowRectVerts[4];
	for (unsigned z = 0; z < 4; ++z)
	{
		vert2D& thisVert = windowRectVerts[z];
		thisVert.color = D3DCOLOR_ARGB(255, 255, 255, 0);

		D3DXVECTOR2 tex2D;
		tex2D.x = (const float)( (z) & 0x1);
		tex2D.y = (const float)( ( (z >> 1) & 0x1) );

		thisVert.xyzRhw.x = windowWidth * tex2D.x * 0.5f + 0.25f * windowWidth - 0.5f;
		thisVert.xyzRhw.y = windowHeight * tex2D.y * 0.5f + 0.25f * windowHeight - 0.5f;
		thisVert.xyzRhw.z = 0.5f;
		thisVert.xyzRhw.w = 1.0f;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &windowRectVerts, sizeof(vert2D) );

	d3d9dev->SetRenderState(D3DRS_STENCILENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_ZWRITEENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_COLORWRITEENABLE, /*D3DCOLORWRITEENABLE_ALPHA | D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE*/0);
	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_ALWAYS);
	d3d9dev->SetRenderState(D3DRS_STENCILREF, 0x00);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_INCRSAT);
	d3d9dev->SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_KEEP);
	vert2D flyingRectVerts[4];
	const float fx = cosf( (const float)time) * 0.3f + 0.4f;
	const float fy = sinf( (const float)time * 1.13f) * 0.4f + 0.5f;
	for (unsigned z = 0; z < 4; ++z)
	{
		vert2D& thisVert = flyingRectVerts[z];
		thisVert.color = D3DCOLOR_ARGB(255, 0, 0, 0);

		D3DXVECTOR2 tex2D;
		tex2D.x = (const float)( (z) & 0x1);
		tex2D.y = (const float)( ( (z >> 1) & 0x1) );

		thisVert.xyzRhw.x = windowWidth * tex2D.x * 0.25f + fx * windowWidth - 0.5f;
		thisVert.xyzRhw.y = windowHeight * tex2D.y * 0.25f + fy * windowHeight - 0.5f;
		thisVert.xyzRhw.z = ( (z >> 1) & 0x1) ? 0.0f : 1.0f;
		thisVert.xyzRhw.w = 1.0f;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &flyingRectVerts, sizeof(vert2D) );

	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_DECRSAT);
	d3d9dev->SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CW); // Flip the cull winding for drawing backfaces!
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &flyingRectVerts, sizeof(vert2D) );

	d3d9dev->SetRenderState(D3DRS_COLORWRITEENABLE, D3DCOLORWRITEENABLE_ALPHA | D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE);
	d3d9dev->SetRenderState(D3DRS_ZENABLE, TRUE);
	d3d9dev->SetRenderState(D3DRS_ZWRITEENABLE, FALSE);
	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW); // Back to the normal winding again
	d3d9dev->SetRenderState(D3DRS_STENCILFUNC, D3DCMP_NOTEQUAL);
	d3d9dev->SetRenderState(D3DRS_STENCILREF, 0x00);
	d3d9dev->SetRenderState(D3DRS_STENCILPASS, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_STENCILZFAIL, D3DSTENCILOP_KEEP);
	d3d9dev->SetRenderState(D3DRS_STENCILFAIL, D3DSTENCILOP_KEEP);
	vert2D fullscreenRectVerts[4];
	for (unsigned z = 0; z < 4; ++z)
	{
		vert2D& thisVert = fullscreenRectVerts[z];
		thisVert.color = D3DCOLOR_ARGB(255, 255, 0, 255);

		D3DXVECTOR2 tex2D;
		tex2D.x = (const float)( (z) & 0x1);
		tex2D.y = (const float)( ( (z >> 1) & 0x1) );

		thisVert.xyzRhw.x = windowWidth * tex2D.x - 0.5f;
		thisVert.xyzRhw.y = windowHeight * tex2D.y - 0.5f;
		thisVert.xyzRhw.z = 0.0f;
		thisVert.xyzRhw.w = 1.0f;
	}
	d3d9dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, &fullscreenRectVerts, sizeof(vert2D) );
}

static inline void RenderFrame(const long double timeDelta)
{
	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER | D3DCLEAR_STENCIL, D3DCOLOR_XRGB(0, 0, 255), 1.0f, 0x00000000);
	d3d9dev->BeginScene();
	// Render stuff here!

	d3d9dev->SetFVF(D3DFVF_XYZRHW | D3DFVF_DIFFUSE);

	char windowText[64] = {0};
	sprintf_s(windowText, "Simple Stencil Test --- SceneID: %u", sceneID);
	SetWindowTextA(wnd, windowText);

	switch (sceneID)
	{
	default:
	case 0:
		RenderScene0(timeDelta);
		break;
	case 1:
		RenderScene1(timeDelta);
		break;
	case 2:
		RenderScene2(timeDelta);
		break;
	case 3:
		RenderScene3(timeDelta);
		break;
	case 4:
		RenderScene4(timeDelta);
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

void PrintWelcomeAndControlsMessage()
{
	printf("Simple Stencil Test\n");
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
	d3dpp.EnableAutoDepthStencil = TRUE;
	d3dpp.AutoDepthStencilFormat = D3DFMT_D24S8;
	d3dpp.Flags = D3DPRESENTFLAG_DEVICECLIP | D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
	HRESULT createDeviceHR = d3d9->CreateDevice(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, wnd, D3DCREATE_HARDWARE_VERTEXPROCESSING | D3DCREATE_PUREDEVICE, &d3dpp, &d3d9dev);
	if (FAILED(createDeviceHR) || !d3d9dev)
	{
		printf("Error in CreateDevice(). HRESULT: 0x%08X. GLE: %u\n", createDeviceHR, GetLastError() );
		return 1;
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER | D3DCLEAR_STENCIL, D3DCOLOR_XRGB(127, 127, 127), 1.0f, 0x00000000);
	d3d9dev->Present(NULL, NULL, NULL, NULL);
	
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

		Sleep(16);
	}

	DestroyWindow(wnd);
	UnregisterClassA( (LPCSTR)classAtom, classParams.hInstance);

	return 0;
}
