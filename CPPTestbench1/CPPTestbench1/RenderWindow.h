#pragma once

#include <d3d9.h>
#include <d3dx9.h>

class RenderWindow
{
public:
	RenderWindow();

	void DisplayTexture(const void* const texelData);
	void RenderLoop();

	~RenderWindow();

private:
	HWND wnd = NULL;
	LPDIRECT3D9 d3d9 = NULL;
	LPDIRECT3DDEVICE9 d3d9dev = NULL;
	LPDIRECT3DSURFACE9 originalBackbuffer = NULL;
	LPDIRECT3DTEXTURE9 dynamicTex = NULL;
};
