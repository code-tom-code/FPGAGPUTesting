#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <d3d9.h>
#include <d3dx9.h>

struct vert2D
{
	D3DXVECTOR4 xyzRhw;
	D3DCOLOR diffuse;
	D3DXVECTOR2 texcoord;
};

struct HardwareTriangle2D
{
	vert2D verts[3];
};

class RenderWindow
{
public:
	RenderWindow();

	void DisplayTexture(const void* const texelData);
	void DisplayLine(const void* const texelData, const unsigned lineNumber);
	void RenderLoop();

	void RenderTrianglesBegin();
	void RenderTriangle(const HardwareTriangle2D& newTriangle);
	void RenderTrianglesFinish();

	LPDIRECT3DDEVICE9 GetD3D9Dev()
	{
		return d3d9dev;
	}

	~RenderWindow();

private:
	HWND wnd = NULL;
	LPDIRECT3D9 d3d9 = NULL;
	LPDIRECT3DDEVICE9 d3d9dev = NULL;
	LPDIRECT3DSURFACE9 originalBackbuffer = NULL;
	LPDIRECT3DTEXTURE9 dynamicTex = NULL;
};
