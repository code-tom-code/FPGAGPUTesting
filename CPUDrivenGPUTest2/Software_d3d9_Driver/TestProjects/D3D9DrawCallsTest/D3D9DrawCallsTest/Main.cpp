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

#include <vector> // for being lazy. This is just a test app after all.

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

static bool drawFromUserPointers = false;
static bool drawUsingPretransformedVerts = false;
static bool drawUsingVertexShader = false;
static unsigned sceneID = 0;

static HWND wnd = NULL;
static LPDIRECT3D9 d3d9 = NULL;
static LPDIRECT3DDEVICE9 d3d9dev = NULL;
static LPDIRECT3DSURFACE9 originalBackbuffer = NULL;
static LPDIRECT3DTEXTURE9 checkerboardTexture = NULL;
static LPDIRECT3DVERTEXSHADER9 testVS = NULL;

static bool bDone = false;

struct vert3D
{
	D3DXVECTOR3 xyz; // This is a position in clip-space since we're using identity-matrices for World, View, and Proj matrices just to keep things as simple as possible
	D3DCOLOR diffuse;
	D3DXVECTOR2 texcoord0;
};

struct vert3Dpretransform
{
	D3DXVECTOR4 xyzRhw; // This is a position in screen-space
	D3DCOLOR diffuse;
	D3DXVECTOR2 texcoord0;
};

struct VB
{
	std::vector<vert3D> vertsCPU;
	std::vector<vert3Dpretransform> vertsPretransformedCPU;

	static void ConvertVertex(const vert3D& inVertUntransformed, vert3Dpretransform& outVertPretransformed)
	{
		outVertPretransformed.xyzRhw.x = inVertUntransformed.xyz.x * 320.0f + 320.0f;
		outVertPretransformed.xyzRhw.y = inVertUntransformed.xyz.y * -240.0f + 240.0f;
		outVertPretransformed.xyzRhw.z = inVertUntransformed.xyz.z;
		outVertPretransformed.xyzRhw.w = 1.0f;
		outVertPretransformed.diffuse = inVertUntransformed.diffuse;
		outVertPretransformed.texcoord0.x = inVertUntransformed.texcoord0.x;
		outVertPretransformed.texcoord0.y = inVertUntransformed.texcoord0.y;
	}

	static void ConvertVertex(const vert3Dpretransform& inVertPretransformed, vert3D& outVertUntransformed)
	{
		const float invW = 1.0f / inVertPretransformed.xyzRhw.w;
		outVertUntransformed.xyz.x = (inVertPretransformed.xyzRhw.x - 320.0f) * (1.0f / 320.0f) * invW;
		outVertUntransformed.xyz.y = (inVertPretransformed.xyzRhw.y - 240.0f) * (1.0f / -240.0f) * invW;
		outVertUntransformed.xyz.z = inVertPretransformed.xyzRhw.z * invW;
		outVertUntransformed.diffuse = inVertPretransformed.diffuse;
		outVertUntransformed.texcoord0.x = inVertPretransformed.texcoord0.x;
		outVertUntransformed.texcoord0.y = inVertPretransformed.texcoord0.y;
	}

	LPDIRECT3DVERTEXBUFFER9 vbUntransformed = NULL;
	LPDIRECT3DVERTEXBUFFER9 vbPretransformed = NULL;

	void UpdateVertexBufferUntransformed()
	{
		if (vbUntransformed == NULL)
		{
			d3d9dev->CreateVertexBuffer(vertsCPU.size() * sizeof(vert3D), D3DUSAGE_WRITEONLY, D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0), D3DPOOL_DEFAULT, &vbUntransformed, NULL);
		}

		vert3D* lockedVB = NULL;
		vbUntransformed->Lock(0, 0, (void**)&lockedVB, 0);
		memcpy(lockedVB, &vertsCPU.front(), vertsCPU.size() * sizeof(vert3D) );
		vbUntransformed->Unlock();
	}

	void UpdateVertexBufferPretransformed()
	{
		if (vbPretransformed == NULL)
		{
			d3d9dev->CreateVertexBuffer(vertsPretransformedCPU.size() * sizeof(vert3Dpretransform), D3DUSAGE_WRITEONLY, D3DFVF_XYZRHW | D3DFVF_DIFFUSE | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0), D3DPOOL_DEFAULT, &vbPretransformed, NULL);
		}

		vert3Dpretransform* lockedVB = NULL;
		vbPretransformed->Lock(0, 0, (void**)&lockedVB, 0);
		memcpy(lockedVB, &vertsPretransformedCPU.front(), vertsPretransformedCPU.size() * sizeof(vert3Dpretransform) );
		vbPretransformed->Unlock();
	}

	const void* const GetVertexCPUData() const
	{
		if (drawUsingPretransformedVerts)
		{
			return &vertsPretransformedCPU.front();
		}
		else
		{
			return &vertsCPU.front();
		}
	}

	const unsigned GetVertexSize() const
	{
		if (drawUsingPretransformedVerts)
		{
			return sizeof(vert3Dpretransform);
		}
		else
		{
			return sizeof(vert3D);
		}
	}

	LPDIRECT3DVERTEXBUFFER9 GetGPUVB() const
	{
		if (drawUsingPretransformedVerts)
		{
			return vbPretransformed;
		}
		else
		{
			return vbUntransformed;
		}
	}
};

struct IB
{
	std::vector<unsigned short> indicesCPU16;
	std::vector<unsigned> indicesCPU32;

	D3DFORMAT indexFormat = D3DFMT_INDEX16;
	LPDIRECT3DINDEXBUFFER9 ib = NULL;

	const void* const GetIndexCPUData() const
	{
		if (indexFormat == D3DFMT_INDEX32)
		{
			return &indicesCPU32.front();
		}
		else
		{
			return &indicesCPU16.front();
		}
	}

	void UpdateIndexBuffer()
	{
		if (!indicesCPU16.empty() )
		{
			if (ib == NULL)
			{
				d3d9dev->CreateIndexBuffer(indicesCPU16.size() * sizeof(unsigned short), D3DUSAGE_WRITEONLY, D3DFMT_INDEX16, D3DPOOL_DEFAULT, &ib, NULL);
			}

			unsigned short* lockedIB = NULL;
			ib->Lock(0, 0, (void**)&lockedIB, 0);
			memcpy(lockedIB, &indicesCPU16.front(), indicesCPU16.size() * sizeof(unsigned short) );
			ib->Unlock();
		}
		else
		{
			if (ib == NULL)
			{
				d3d9dev->CreateIndexBuffer(indicesCPU32.size() * sizeof(unsigned), D3DUSAGE_WRITEONLY, D3DFMT_INDEX32, D3DPOOL_DEFAULT, &ib, NULL);
			}

			unsigned* lockedIB = NULL;
			ib->Lock(0, 0, (void**)&lockedIB, 0);
			memcpy(lockedIB, &indicesCPU32.front(), indicesCPU32.size() * sizeof(unsigned) );
			ib->Unlock();
		}
	}
};

struct Mesh
{
	unsigned primCount = 0; // This is the prim count per draw call. The vertex/index buffers may be larger than this due to draw offsetting!
	D3DPRIMITIVETYPE primType = D3DPT_TRIANGLELIST;
	bool indexedDraw = false;

	VB meshVB;
	IB meshIB;

	void Draw(unsigned baseOffset = 0, unsigned indexOffset = 0)
	{
		// Populate vertex buffers, possibly converting from one vertex type to the other if necessary:
		if (drawUsingPretransformedVerts)
		{
			if (meshVB.vertsPretransformedCPU.empty() )
			{
				const unsigned numVerts = (const unsigned)(meshVB.vertsCPU.size() );
				meshVB.vertsPretransformedCPU.resize(numVerts);
				for (unsigned x = 0; x < numVerts; ++x)
				{
					VB::ConvertVertex(meshVB.vertsCPU[x], meshVB.vertsPretransformedCPU[x]);
				}
				meshVB.UpdateVertexBufferPretransformed();
			}
		}
		else
		{
			if (meshVB.vertsCPU.empty() )
			{
				const unsigned numVerts = (const unsigned)(meshVB.vertsPretransformedCPU.size() );
				meshVB.vertsCPU.resize(numVerts);
				for (unsigned x = 0; x < numVerts; ++x)
				{
					VB::ConvertVertex(meshVB.vertsPretransformedCPU[x], meshVB.vertsCPU[x]);
				}
				meshVB.UpdateVertexBufferUntransformed();
			}
		}

		const unsigned vertSize = meshVB.GetVertexSize();
		if (drawFromUserPointers)
		{
			const char* VBBase = (const char* const)meshVB.GetVertexCPUData();
			VBBase += vertSize * baseOffset;
			if (indexedDraw)
			{
				const char* IBBase = (const char* const)meshIB.GetIndexCPUData();
				const unsigned indexSize = (meshIB.indexFormat == D3DFMT_INDEX32 ? sizeof(DWORD) : sizeof(unsigned short) );
				IBBase += indexSize * indexOffset;
				d3d9dev->DrawIndexedPrimitiveUP(primType, 0, meshVB.vertsCPU.size(), primCount, IBBase, meshIB.indexFormat, (const void* const)VBBase, vertSize);
			}
			else
			{
				d3d9dev->DrawPrimitiveUP(primType, primCount, (const void* const)VBBase, vertSize);
			}
		}
		else
		{
			d3d9dev->SetStreamSource(0, meshVB.GetGPUVB(), 0, vertSize);
			if (indexedDraw)
			{
				d3d9dev->SetIndices(meshIB.ib);
				d3d9dev->DrawIndexedPrimitive(primType, baseOffset, 0, meshVB.vertsCPU.size(), indexOffset, primCount);
			}
			else
			{
				d3d9dev->DrawPrimitive(primType, baseOffset, primCount);
			}
		}
	}
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

vert3D TransformClipSpace(const vert3D& inModelSpaceVert, const float uniformScale, const D3DXVECTOR3& translation)
{
	vert3D outVert = inModelSpaceVert;
	outVert.xyz.x *= uniformScale;
	outVert.xyz.y *= uniformScale;

	outVert.xyz.x += translation.x;
	outVert.xyz.y += translation.y;
	return outVert;
}

vert3D TransformClipSpace(const vert3D& inModelSpaceVert, const D3DXMATRIXA16& mat)
{
	vert3D out = inModelSpaceVert;
	D3DXVec3TransformCoord(&out.xyz, &inModelSpaceVert.xyz, &mat);
	return out;
}

// [0]/[r] Scene 0:
// DrawPrimitive(TriList) quad
// DrawPrimitive(TriFan) quad
// DrawPrimitive(TriStrip) quad
// DrawPrimitive(TriList) circle mesh
// DrawPrimitive(TriFan) circle mesh
// DrawPrimitive(TriStrip) circle mesh
static Mesh s0quad_triList;
static Mesh s0quad_triFan;
static Mesh s0quad_triStrip;
static Mesh s0circle_triList;
static Mesh s0circle_triFan;
static Mesh s0circle_triStrip;
static void RenderScene0(void)
{
	static bool init = false;
	if (!init)
	{
		init = true;

		// This is a quad with width and height 1.0f with its origin at the bottom left corner at (0.0f, 0.0f)
		vert3D quadVerts[4];
		for (unsigned x = 0; x < 4; ++x)
		{
			vert3D& thisVert = quadVerts[x];
			thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
			thisVert.texcoord0.x = (const float)(x & 0x1);
			thisVert.texcoord0.y = (const float)( (x >> 1) & 0x1);
			thisVert.xyz.x = thisVert.texcoord0.x;
			thisVert.xyz.y = thisVert.texcoord0.y;
			thisVert.xyz.z = 0.5f;
		}

		// This is a circle with diameter 1.0f (radius is 0.5f) and its center-point is at (0.5f, 0.5f)
		vert3D circleVerts[1 + 12];
		circleVerts[0].diffuse = D3DCOLOR_ARGB(255, 255, 255, 255); // The 0th vertex is always the center vertex of our circle
		circleVerts[0].texcoord0.x = 0.5f;
		circleVerts[0].texcoord0.y = 0.5f;
		circleVerts[0].xyz.x = circleVerts[0].texcoord0.x;
		circleVerts[0].xyz.y = circleVerts[0].texcoord0.y;
		circleVerts[0].xyz.z = 0.5f;
		for (unsigned x = 0; x < 12; ++x)
		{
			vert3D& thisVert = circleVerts[1 + x];
			const float circlePercent = x / 12.0f; // 0/12 thru 11/12
			const float circleRadians = D3DX_PI * 2.0f * circlePercent;
			thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
			thisVert.texcoord0.x = cosf(circleRadians) * 0.5f + 0.5f; // Shift from [-1,1] to [0,1] space
			thisVert.texcoord0.y = sinf(circleRadians) * 0.5f + 0.5f;
			thisVert.xyz.x = thisVert.texcoord0.x;
			thisVert.xyz.y = thisVert.texcoord0.y;
			thisVert.xyz.z = 0.5f;
		}

		const float meshScaleUniform = 0.95f * 2.0f / 3.0f;

		// Quad triangle list:
		const D3DXVECTOR3 quadTriListOffset(-1.0f + 0.0f * 2.0f / 3.0f, 0.0f, 0.0f);
		s0quad_triList.primCount = 2;
		s0quad_triList.primType = D3DPT_TRIANGLELIST;
		s0quad_triList.indexedDraw = false;
		s0quad_triList.meshVB.vertsCPU.reserve(s0quad_triList.primCount * 3);
		s0quad_triList.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[0], meshScaleUniform, quadTriListOffset) );
		s0quad_triList.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[1], meshScaleUniform, quadTriListOffset) );
		s0quad_triList.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[2], meshScaleUniform, quadTriListOffset) );
		s0quad_triList.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[1], meshScaleUniform, quadTriListOffset) );
		s0quad_triList.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[3], meshScaleUniform, quadTriListOffset) );
		s0quad_triList.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[2], meshScaleUniform, quadTriListOffset) );
		s0quad_triList.meshVB.UpdateVertexBufferUntransformed();

		// Quad triangle fan:
		const D3DXVECTOR3 quadTriFanOffset(-1.0f + 1.0f * 2.0f / 3.0f, 0.0f, 0.0f);
		s0quad_triFan.primCount = 2;
		s0quad_triFan.primType = D3DPT_TRIANGLEFAN;
		s0quad_triFan.indexedDraw = false;
		s0quad_triFan.meshVB.vertsCPU.reserve(s0quad_triFan.primCount + 2);
		s0quad_triFan.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[1], meshScaleUniform, quadTriFanOffset) );
		s0quad_triFan.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[3], meshScaleUniform, quadTriFanOffset) );
		s0quad_triFan.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[2], meshScaleUniform, quadTriFanOffset) );
		s0quad_triFan.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[0], meshScaleUniform, quadTriFanOffset) );
		s0quad_triFan.meshVB.UpdateVertexBufferUntransformed();

		// Quad triangle strip:
		const D3DXVECTOR3 quadTriStripOffset(-1.0f + 2.0f * 2.0f / 3.0f, 0.0f, 0.0f);
		s0quad_triStrip.primCount = 2;
		s0quad_triStrip.primType = D3DPT_TRIANGLESTRIP;
		s0quad_triStrip.indexedDraw = false;
		s0quad_triStrip.meshVB.vertsCPU.reserve(s0quad_triStrip.primCount + 2);
		s0quad_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[0], meshScaleUniform, quadTriStripOffset) );
		s0quad_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[1], meshScaleUniform, quadTriStripOffset) );
		s0quad_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[2], meshScaleUniform, quadTriStripOffset) );
		s0quad_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(quadVerts[3], meshScaleUniform, quadTriStripOffset) );
		s0quad_triStrip.meshVB.UpdateVertexBufferUntransformed();

		// Circle triangle list:
		const D3DXVECTOR3 circleTriListOffset(-1.0f + 0.0f * 2.0f / 3.0f, -1.0f, 0.0f);
		s0circle_triList.primCount = 12;
		s0circle_triList.primType = D3DPT_TRIANGLELIST;
		s0circle_triList.indexedDraw = false;
		s0circle_triList.meshVB.vertsCPU.reserve(s0circle_triList.primCount * 3);
		for (unsigned x = 0; x < s0circle_triList.primCount - 1; ++x)
		{
			s0circle_triList.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[0], meshScaleUniform, circleTriListOffset) );
			s0circle_triList.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[x + 1], meshScaleUniform, circleTriListOffset) );
			s0circle_triList.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[x + 2], meshScaleUniform, circleTriListOffset) );
		}
		s0circle_triList.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[0], meshScaleUniform, circleTriListOffset) ); // Complete the circle with our final triangle slice that connects the last and first outside vertices:
		s0circle_triList.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[s0circle_triList.primCount], meshScaleUniform, circleTriListOffset) );
		s0circle_triList.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[1], meshScaleUniform, circleTriListOffset) );
		s0circle_triList.meshVB.UpdateVertexBufferUntransformed();

		// Circle triangle fan:
		const D3DXVECTOR3 circleTriFanOffset(-1.0f + 1.0f * 2.0f / 3.0f, -1.0f, 0.0f);
		s0circle_triFan.primCount = 12;
		s0circle_triFan.primType = D3DPT_TRIANGLEFAN;
		s0circle_triFan.indexedDraw = false;
		s0circle_triFan.meshVB.vertsCPU.reserve(s0circle_triFan.primCount + 2);
		for (unsigned x = 0; x < ARRAYSIZE(circleVerts); ++x)
		{
			s0circle_triFan.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[x], meshScaleUniform, circleTriFanOffset) );
		}
		s0circle_triFan.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[1], meshScaleUniform, circleTriFanOffset) ); // Complete the circle with our final triangle slice that connects the last and first outside vertices:
		s0circle_triFan.meshVB.UpdateVertexBufferUntransformed();

		// Circle triangle strip:
		const D3DXVECTOR3 circleTriStripOffset(-1.0f + 2.0f * 2.0f / 3.0f, -1.0f, 0.0f);
		s0circle_triStrip.primCount = 21; // Needs to be higher in order to account for the multiple degenerate triangles we'll need to use to restart our triangles, since we don't have strip-restarts available due to no index buffer
		s0circle_triStrip.primType = D3DPT_TRIANGLESTRIP;
		s0circle_triStrip.indexedDraw = false;
		s0circle_triStrip.meshVB.vertsCPU.reserve(s0circle_triStrip.primCount + 2);
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[1], meshScaleUniform, circleTriStripOffset) ); // 1, 2, 0
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[2], meshScaleUniform, circleTriStripOffset) );
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[0], meshScaleUniform, circleTriStripOffset) );
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[3], meshScaleUniform, circleTriStripOffset) ); // 2, 0, 3
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[4], meshScaleUniform, circleTriStripOffset) ); // 0, 3, 4
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[4], meshScaleUniform, circleTriStripOffset) ); // Degenerate tri 3, 4, 4
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[4], meshScaleUniform, circleTriStripOffset) ); // Degenerate tri 4, 4, 4
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[5], meshScaleUniform, circleTriStripOffset) ); // Degenerate tri 4, 4, 5
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[0], meshScaleUniform, circleTriStripOffset) ); // 4, 5, 0
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[6], meshScaleUniform, circleTriStripOffset) ); // 5, 0, 6
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[7], meshScaleUniform, circleTriStripOffset) ); // 0, 6, 7
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[7], meshScaleUniform, circleTriStripOffset) ); // Degenerate tri 6, 7, 7
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[7], meshScaleUniform, circleTriStripOffset) ); // Degenerate tri 7, 7, 7
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[8], meshScaleUniform, circleTriStripOffset) ); // Degenerate tri 7, 7, 8
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[0], meshScaleUniform, circleTriStripOffset) ); // 7, 8, 0
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[9], meshScaleUniform, circleTriStripOffset) ); // 8, 0, 9
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[10], meshScaleUniform, circleTriStripOffset) ); // 0, 9, 10
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[10], meshScaleUniform, circleTriStripOffset) ); // Degenerate tri 9, 10, 10
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[10], meshScaleUniform, circleTriStripOffset) ); // Degenerate tri 10, 10, 10
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[11], meshScaleUniform, circleTriStripOffset) ); // Degenerate tri 10, 10, 11
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[0], meshScaleUniform, circleTriStripOffset) ); // 10, 11, 0
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[12], meshScaleUniform, circleTriStripOffset) ); // 11, 0, 12
		s0circle_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(circleVerts[1], meshScaleUniform, circleTriStripOffset) ); // 0, 12, 1
		s0circle_triStrip.meshVB.UpdateVertexBufferUntransformed();
	}

	s0quad_triList.Draw();
	s0quad_triFan.Draw();
	s0quad_triStrip.Draw();
	s0circle_triList.Draw();
	s0circle_triFan.Draw();
	s0circle_triStrip.Draw();
}

// [1] Scene 1:
// DrawPrimitive(TriList) tessellated plane mesh
// DrawPrimitive(TriStrip) tessellated plane mesh to test degenerate primitives
static Mesh s1terrain_triList;
static Mesh s1terrain_triStrip;
static void RenderScene1(void)
{
	static bool init = false;
	if (!init)
	{
		init = true;

		const unsigned gridWidthVerts = 64;
		const unsigned gridHeightVerts = 64;
		const unsigned gridWidthQuads = gridWidthVerts-1;
		const unsigned gridHeightQuads = gridHeightVerts-1;
		std::vector<vert3D> gridVertices;
		gridVertices.reserve(gridWidthVerts * gridHeightVerts);
		for (unsigned y = 0; y < gridHeightVerts; ++y)
		{
			for (unsigned x = 0; x < gridWidthVerts; ++x)
			{
				vert3D newVert;
				newVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
				newVert.texcoord0.x = x / (const float)(gridWidthVerts-1);
				newVert.texcoord0.y = y / (const float)(gridHeightVerts-1);
				newVert.xyz.x = newVert.texcoord0.x;
				newVert.xyz.y = newVert.texcoord0.y;
				newVert.xyz.z = (rand() / (const float)RAND_MAX) * 0.0625f + (0.5f - 0.0625f/2.0f); // Center our terrain mesh in our depth range between 0.0f and 1.0f
				gridVertices.push_back(newVert);
			}
		}

		// Terrain triangle list:
		const D3DXVECTOR3 terrainTriListOffset(-1.0f, 0.0f, 0.0f);
		s1terrain_triList.primCount = gridWidthQuads*gridHeightQuads*2;
		s1terrain_triList.primType = D3DPT_TRIANGLELIST;
		s1terrain_triList.indexedDraw = false;
		s1terrain_triList.meshVB.vertsCPU.reserve(s1terrain_triList.primCount * 3);
		for (unsigned y = 0; y < gridHeightQuads; ++y)
		{
			for (unsigned x = 0; x < gridWidthQuads; ++x)
			{
				const unsigned quadLeadingVert = y * gridWidthVerts + x;
				const unsigned botRight = quadLeadingVert + 1;
				const unsigned topLeft = quadLeadingVert + gridWidthVerts;
				const unsigned topRight = topLeft + 1;
				s1terrain_triList.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[quadLeadingVert], 0.95f, terrainTriListOffset) );
				s1terrain_triList.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[botRight], 0.95f, terrainTriListOffset) );
				s1terrain_triList.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[topRight], 0.95f, terrainTriListOffset) );

				s1terrain_triList.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[topRight], 0.95f, terrainTriListOffset) );
				s1terrain_triList.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[topLeft], 0.95f, terrainTriListOffset) );
				s1terrain_triList.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[quadLeadingVert], 0.95f, terrainTriListOffset) );
			}
		}
		s1terrain_triList.meshVB.UpdateVertexBufferUntransformed();

		// Terrain triangle strip:
		const D3DXVECTOR3 terrainTriStripOffset(0.0f, 0.0f, 0.0f);
		s1terrain_triStrip.primCount = gridWidthQuads*gridHeightQuads*2;
		s1terrain_triStrip.primType = D3DPT_TRIANGLESTRIP;
		s1terrain_triStrip.indexedDraw = false;
		s1terrain_triStrip.meshVB.vertsCPU.reserve(gridWidthQuads*gridHeightQuads*2);
		for (unsigned y = 0; y < gridHeightQuads; ++y)
		{
			for (unsigned x = 0; x < gridWidthQuads; ++x)
			{
				const unsigned quadLeadingVert = y * gridWidthVerts + x;
				const unsigned botRight = quadLeadingVert + 1;
				const unsigned topLeft = quadLeadingVert + gridWidthVerts;
				const unsigned topRight = topLeft + 1;
				if (x == 0 && y == 0)
				{
					s1terrain_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[topLeft], 0.95f, terrainTriStripOffset) );
					s1terrain_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[quadLeadingVert], 0.95f, terrainTriStripOffset) );
					s1terrain_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[topRight], 0.95f, terrainTriStripOffset) );

					s1terrain_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[botRight], 0.95f, terrainTriStripOffset) );
				}
				else
				{
					s1terrain_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[topRight], 0.95f, terrainTriStripOffset) );

					s1terrain_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[botRight], 0.95f, terrainTriStripOffset) );
				}
			}

			// Do post-row fixups to get us to the next row:
			if (y != gridHeightQuads-1) // If we're not on the final row...
			{
				// Create our first degen triangle by duplicating the last vertex used
				s1terrain_triStrip.meshVB.vertsCPU.push_back(s1terrain_triStrip.meshVB.vertsCPU.back() ); // Make sure not to retransform it
				++s1terrain_triStrip.primCount;

				const unsigned newRowQuadBotLeft = (y + 1) * gridWidthVerts + 0/*x*/;
				const unsigned newRowQuadTopLeft = newRowQuadBotLeft + gridWidthVerts;
				const unsigned newRowQuadTopRight = newRowQuadTopLeft + 1;

				s1terrain_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[newRowQuadTopLeft], 0.95f, terrainTriStripOffset) ); // Add the first vertex of our new quad
				++s1terrain_triStrip.primCount;
				s1terrain_triStrip.meshVB.vertsCPU.push_back(s1terrain_triStrip.meshVB.vertsCPU.back() ); // Duplicate it again
				++s1terrain_triStrip.primCount;
				s1terrain_triStrip.meshVB.vertsCPU.push_back(TransformClipSpace(gridVertices[newRowQuadBotLeft], 0.95f, terrainTriStripOffset) ); // Add the second vertex of our new quad
				++s1terrain_triStrip.primCount;

				// After this point we should be set up to draw the next row of tris again!
			}
		}
		s1terrain_triStrip.meshVB.UpdateVertexBufferUntransformed();
	}

	s1terrain_triList.Draw();
	s1terrain_triStrip.Draw();
}

// [2] Scene 2: Stress-test sphere
// DrawIndexedPrimitive(TriList) triangle list mesh (very big: > 64K indices, > 64K verts, > 64K tris)
static Mesh s2sphere_triList;
static void RenderScene2(void)
{
	static const unsigned numRings = 128;
	static const unsigned numVertsPerRing = 4096;

	static bool init = false;
	if (!init)
	{
		init = true;

		s2sphere_triList.indexedDraw = true;
		s2sphere_triList.primType = D3DPT_TRIANGLELIST;
		s2sphere_triList.primCount = (numRings - 1) * (numVertsPerRing - 1);
		s2sphere_triList.meshIB.indexFormat = D3DFMT_INDEX32;

		s2sphere_triList.meshVB.vertsCPU.reserve(numRings * numVertsPerRing);
		for (unsigned ring = 0; ring < numRings; ++ring)
		{
			const float ringHeight = ring / (const float)(numRings - 1); // 0 to 1 for each ring
			const float sinTheta = sinf(ringHeight * D3DX_PI * 2.0f);
			const float cosTheta = cosf(ringHeight * D3DX_PI * 2.0f);
			for (unsigned vertID = 0; vertID < numVertsPerRing; ++vertID)
			{
				const float vertAngle = vertID / (const float)numVertsPerRing;
				const float sinPhi = sinf(vertAngle * D3DX_PI * 2.0f);
				const float cosPhi = cosf(vertAngle * D3DX_PI * 2.0f);

				vert3D newVert;
				newVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
				newVert.texcoord0.x = vertAngle;
				newVert.texcoord0.y = ringHeight;
				newVert.xyz.x = sinTheta * cosPhi * 0.95f;
				newVert.xyz.y = cosTheta * 0.95f;
				newVert.xyz.z = (sinTheta * sinPhi * 0.5f + 0.5f) * 0.95f;
				s2sphere_triList.meshVB.vertsCPU.push_back(newVert);
			}
		}
		s2sphere_triList.meshVB.UpdateVertexBufferUntransformed();

		s2sphere_triList.meshIB.indicesCPU32.reserve(s2sphere_triList.primCount * 3);
		for (unsigned ringLevel = 0; ringLevel < (numRings - 1); ++ringLevel)
		{
			for (unsigned quadID = 0; quadID < (numVertsPerRing - 1); ++quadID)
			{
				const unsigned topLeftIndex = ringLevel * numVertsPerRing + quadID;
				const unsigned topRightIndex = topLeftIndex + 1;
				const unsigned botLeftIndex = topLeftIndex + numVertsPerRing;
				const unsigned botRightIndex = botLeftIndex + 1;

				s2sphere_triList.meshIB.indicesCPU32.push_back(topLeftIndex);
				s2sphere_triList.meshIB.indicesCPU32.push_back(botLeftIndex);
				s2sphere_triList.meshIB.indicesCPU32.push_back(topRightIndex);

				s2sphere_triList.meshIB.indicesCPU32.push_back(topRightIndex);
				s2sphere_triList.meshIB.indicesCPU32.push_back(botLeftIndex);
				s2sphere_triList.meshIB.indicesCPU32.push_back(botRightIndex);
			}
		}
		s2sphere_triList.meshIB.UpdateIndexBuffer();
	}

	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CCW);
	s2sphere_triList.Draw();
}

// [3] Scene 3:
// DrawIndexedPrimitive(TriStrip) triangle strip (terrain?) mesh (high-ish poly) to test strip restarts. Never mind, strip restarts aren't supported until D3D10.0.
static Mesh s3terrain_triList;
static Mesh s3terrain_triStrip;
static void RenderScene3(void)
{
	static bool init = false;
	if (!init)
	{
		init = true;

		const unsigned gridWidthVerts = 64;
		const unsigned gridHeightVerts = 64;
		const unsigned gridWidthQuads = gridWidthVerts-1;
		const unsigned gridHeightQuads = gridHeightVerts-1;
		std::vector<vert3D> gridVertices;
		gridVertices.reserve(gridWidthVerts * gridHeightVerts);
		for (unsigned y = 0; y < gridHeightVerts; ++y)
		{
			for (unsigned x = 0; x < gridWidthVerts; ++x)
			{
				vert3D newVert;
				newVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
				newVert.texcoord0.x = x / (const float)(gridWidthVerts-1);
				newVert.texcoord0.y = y / (const float)(gridHeightVerts-1);
				newVert.xyz.x = newVert.texcoord0.x;
				newVert.xyz.y = newVert.texcoord0.y;
				newVert.xyz.z = (rand() / (const float)RAND_MAX) * 0.0625f + (0.5f - 0.0625f/2.0f); // Center our terrain mesh in our depth range between 0.0f and 1.0f
				gridVertices.push_back(newVert);
			}
		}

		// Terrain triangle list:
		const D3DXVECTOR3 terrainTriListOffset(-1.0f, 0.0f, 0.0f);
		s3terrain_triList.primCount = gridWidthQuads*gridHeightQuads*2;
		s3terrain_triList.primType = D3DPT_TRIANGLELIST;
		s3terrain_triList.indexedDraw = true;
		s3terrain_triList.meshIB.indexFormat = D3DFMT_INDEX32;
		s3terrain_triList.meshVB.vertsCPU = gridVertices;
		for (unsigned x = 0; x < gridWidthVerts * gridHeightVerts; ++x)
		{
			vert3D& thisVert = s3terrain_triList.meshVB.vertsCPU[x];
			thisVert = TransformClipSpace(thisVert, 0.95f, terrainTriListOffset);
		}
		s3terrain_triList.meshIB.indicesCPU32.reserve(s3terrain_triList.primCount * 3);
		for (unsigned y = 0; y < gridHeightQuads; ++y)
		{
			for (unsigned x = 0; x < gridWidthQuads; ++x)
			{
				const unsigned quadLeadingVert = y * gridWidthVerts + x;
				const unsigned botRight = quadLeadingVert + 1;
				const unsigned topLeft = quadLeadingVert + gridWidthVerts;
				const unsigned topRight = topLeft + 1;

				s3terrain_triList.meshIB.indicesCPU32.push_back( (const unsigned short)quadLeadingVert);
				s3terrain_triList.meshIB.indicesCPU32.push_back( (const unsigned short)botRight);
				s3terrain_triList.meshIB.indicesCPU32.push_back( (const unsigned short)topRight);

				s3terrain_triList.meshIB.indicesCPU32.push_back( (const unsigned short)topRight);
				s3terrain_triList.meshIB.indicesCPU32.push_back( (const unsigned short)topLeft);
				s3terrain_triList.meshIB.indicesCPU32.push_back( (const unsigned short)quadLeadingVert);
			}
		}
		s3terrain_triList.meshVB.UpdateVertexBufferUntransformed();
		s3terrain_triList.meshIB.UpdateIndexBuffer();

		// Terrain triangle strip:
		const D3DXVECTOR3 terrainTriStripOffset(0.0f, 0.0f, 0.0f);
		s3terrain_triStrip.primCount = gridWidthQuads*gridHeightQuads*2;
		s3terrain_triStrip.primType = D3DPT_TRIANGLESTRIP;
		s3terrain_triStrip.indexedDraw = true;
		s3terrain_triStrip.meshIB.indexFormat = D3DFMT_INDEX32;
		s3terrain_triStrip.meshVB.vertsCPU = gridVertices;
		for (unsigned x = 0; x < gridWidthVerts * gridHeightVerts; ++x)
		{
			vert3D& thisVert = s3terrain_triStrip.meshVB.vertsCPU[x];
			thisVert = TransformClipSpace(thisVert, 0.95f, terrainTriStripOffset);
		}
		s3terrain_triStrip.meshIB.indicesCPU32.reserve(s3terrain_triStrip.primCount * 3);
		for (unsigned y = 0; y < gridHeightQuads; ++y)
		{
			for (unsigned x = 0; x < gridWidthQuads; ++x)
			{
				const unsigned quadLeadingVert = y * gridWidthVerts + x;
				const unsigned botRight = quadLeadingVert + 1;
				const unsigned topLeft = quadLeadingVert + gridWidthVerts;
				const unsigned topRight = topLeft + 1;
				if (x == 0 && y == 0)
				{
					s3terrain_triStrip.meshIB.indicesCPU32.push_back( (const unsigned short)topLeft);
					s3terrain_triStrip.meshIB.indicesCPU32.push_back( (const unsigned short)quadLeadingVert);
					s3terrain_triStrip.meshIB.indicesCPU32.push_back( (const unsigned short)topRight);

					s3terrain_triStrip.meshIB.indicesCPU32.push_back( (const unsigned short)botRight);
				}
				else
				{
					s3terrain_triStrip.meshIB.indicesCPU32.push_back( (const unsigned short)topRight);

					s3terrain_triStrip.meshIB.indicesCPU32.push_back( (const unsigned short)botRight);
				}
			}

			// Do post-row fixups to get us to the next row:
			if (y != gridHeightQuads-1) // If we're not on the final row...
			{
				// Create our first degen triangle by duplicating the last vertex used
				s3terrain_triStrip.meshIB.indicesCPU32.push_back(s3terrain_triStrip.meshIB.indicesCPU32.back() );
				++s3terrain_triStrip.primCount;

				const unsigned newRowQuadBotLeft = (y + 1) * gridWidthVerts + 0/*x*/;
				const unsigned newRowQuadTopLeft = newRowQuadBotLeft + gridWidthVerts;
				const unsigned newRowQuadTopRight = newRowQuadTopLeft + 1;

				s3terrain_triStrip.meshIB.indicesCPU32.push_back( (const unsigned short)newRowQuadTopLeft); // Add the first vertex of our new quad
				++s3terrain_triStrip.primCount;
				s3terrain_triStrip.meshIB.indicesCPU32.push_back(s3terrain_triStrip.meshIB.indicesCPU32.back() ); // Duplicate it again
				++s3terrain_triStrip.primCount;
				s3terrain_triStrip.meshIB.indicesCPU32.push_back( (const unsigned short)newRowQuadBotLeft); // Add the second vertex of our new quad
				++s3terrain_triStrip.primCount;

				// After this point we should be set up to draw the next row of tris again!
			}
		}
		s3terrain_triStrip.meshVB.UpdateVertexBufferUntransformed();
		s3terrain_triStrip.meshIB.UpdateIndexBuffer();
	}

	s3terrain_triList.Draw();
	s3terrain_triStrip.Draw();
}

// [4] Scene 4:
// DrawIndexedPrimitive(TriFan) triangle fan cone mesh (high-ish poly)
static Mesh s4cone_triFan;
static void RenderScene4(void)
{
	static const unsigned numVertsPerRing = 4096;

	static bool init = false;
	if (!init)
	{
		init = true;

		s4cone_triFan.indexedDraw = true;
		s4cone_triFan.meshIB.indexFormat = D3DFMT_INDEX32;
		s4cone_triFan.primType = D3DPT_TRIANGLEFAN;
		s4cone_triFan.primCount = numVertsPerRing;

		s4cone_triFan.meshVB.vertsCPU.reserve(s4cone_triFan.primCount + 2);
		vert3D centerVert;
		centerVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
		centerVert.texcoord0.x = 0.5f;
		centerVert.texcoord0.y = 1.0f;
		centerVert.xyz.x = 0.0f;
		centerVert.xyz.y = 1.0f;
		centerVert.xyz.z = 0.5f;
		s4cone_triFan.meshVB.vertsCPU.push_back(centerVert);
		for (unsigned vertID = 0; vertID < numVertsPerRing; ++vertID)
		{
			const float vertAngle = vertID / (const float)numVertsPerRing;
			const float sinPhi = sinf(vertAngle * D3DX_PI * 2.0f);
			const float cosPhi = cosf(vertAngle * D3DX_PI * 2.0f);

			vert3D newVert;
			newVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
			newVert.texcoord0.x = vertAngle;
			newVert.texcoord0.y = 0.0f;
			newVert.xyz.x = cosPhi * 0.95f;
			newVert.xyz.y = -1.0f * 0.95f;
			newVert.xyz.z = (sinPhi * 0.5f + 0.5f) * 0.95f;
			s4cone_triFan.meshVB.vertsCPU.push_back(newVert);
		}
		s4cone_triFan.meshVB.UpdateVertexBufferUntransformed();

		s4cone_triFan.meshIB.indicesCPU32.reserve(s4cone_triFan.primCount + 2);
		s4cone_triFan.meshIB.indicesCPU32.push_back(0); // Start with the center/top vertex
		for (unsigned ringVertex = 1; ringVertex < numVertsPerRing + 1; ++ringVertex)
		{
			s4cone_triFan.meshIB.indicesCPU32.push_back(ringVertex);
		}
		s4cone_triFan.meshIB.indicesCPU32.push_back(1); // Connect back to the first vertex again
		s4cone_triFan.meshIB.UpdateIndexBuffer();
	}

	s4cone_triFan.Draw();
}

static unsigned short cubeIB_triList[3 * 2 * 6] =
{
	0, 1, 2, // Bottom
	1, 3, 2,
	6, 5, 4, // Top
	6, 7, 5,
	4, 1, 0, // Front
	4, 5, 1,
	6, 2, 3, // Back
	6, 3, 7,
	4, 0, 6, // Left
	6, 0, 2,
	5, 3, 1, // Right
	7, 3, 5
};

// Note that it's possible to lay out a cube such that it can be rendered using one triangle strip without any degenerate triangles.
// That's cool and smaller/faster and all, but I'd rather make sure that degenerate triangles work properly for this test:
static unsigned short cubeIB_triStrip[20] =
{
	4, 6, 5, // Top
	7,
	1, // Right
	3,
	0, // Bottom
	2,
	4, // Left
	6,
	6, // Degen triangle 0: 4, 6, 6
	2, // Degen triangle 1: 6, 6, 2
	7, // Back
	3,
	3, // Degen triangle 2: 7, 3, 3
	1, // Degen triangle 3: 3, 3, 1
	1, // Degen triangle 4: 3, 1, 1
	0, // Degen triangle 5: 1, 1, 0
	5, // Front
	4
};

// [5] Scene 5:
// DrawPrimitive(TriList with a StartVertex offset) mesh (just draw a bunch of cubes)
// DrawPrimitive(TriFan with a StartVertex offset) mesh (just draw a bunch of flying-saucer shapes)
// DrawPrimitive(TriStrip with a StartVertex offset) mesh (just draw a bunch of cubes again)
static Mesh s5cubes_triList;
static Mesh s5discs_triFan;
static Mesh s5cubes_triStrip;
static void RenderScene5(void)
{
	static bool init = false;
	if (!init)
	{
		init = true;

		vert3D cubeVerts[8];
		for (unsigned n = 0; n < 8; ++n)
		{
			vert3D& thisVert = cubeVerts[n];
			thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
			thisVert.xyz.x = (const float)(n & 0x1);
			thisVert.xyz.z = (const float)( (n >> 1) & 0x1);
			thisVert.xyz.y = (const float)( (n >> 2) & 0x1);
			thisVert.texcoord0.x = thisVert.xyz.x;
			thisVert.texcoord0.y = thisVert.xyz.y;
		}

		vert3D discTopVerts[20];
		vert3D& topCenterVert = discTopVerts[0];
		topCenterVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
		topCenterVert.xyz.x = (const float)0.0f;
		topCenterVert.xyz.y = (const float)1.0f;
		topCenterVert.xyz.z = (const float)0.5f;
		topCenterVert.texcoord0.x = 0.5f;
		topCenterVert.texcoord0.y = 0.5f;
		for (unsigned rimVert = 0; rimVert < 18; ++rimVert)
		{
			vert3D& thisVert = discTopVerts[rimVert + 1];
			thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);

			const float phi = 1.0f - rimVert / 17.0f; // Reverse the rim order of one of the halves in order for it to match the same CW/CCW winding of the other half
			const float phiAngle = phi * 2.0f * D3DX_PI;
			thisVert.xyz.x = cosf(phiAngle);
			thisVert.xyz.y = 0.5f;
			thisVert.xyz.z = sinf(phiAngle) * 0.5f + 0.5f;
			thisVert.texcoord0.x = thisVert.xyz.x * 0.5f + 0.5f;
			thisVert.texcoord0.y = thisVert.xyz.z;
		}
		discTopVerts[19] = discTopVerts[1];
		vert3D discBotVerts[20];
		vert3D& botCenterVert = discBotVerts[0];
		botCenterVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
		botCenterVert.xyz.x = (const float)0.0f;
		botCenterVert.xyz.y = (const float)0.0f;
		botCenterVert.xyz.z = (const float)0.5f;
		botCenterVert.texcoord0.x = 0.5f;
		botCenterVert.texcoord0.y = 0.5f;
		for (unsigned rimVert = 0; rimVert < 18; ++rimVert)
		{
			vert3D& thisVert = discBotVerts[rimVert + 1];
			thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);

			const float phi = rimVert / 17.0f;
			const float phiAngle = phi * 2.0f * D3DX_PI;
			thisVert.xyz.x = cosf(phiAngle);
			thisVert.xyz.y = 0.5f;
			thisVert.xyz.z = sinf(phiAngle) * 0.5f + 0.5f;
			thisVert.texcoord0.x = thisVert.xyz.x * 0.5f + 0.5f;
			thisVert.texcoord0.y = thisVert.xyz.z;
		}
		discBotVerts[19] = discBotVerts[1];

		s5cubes_triList.primCount = 6 * 2;
		s5cubes_triList.indexedDraw = false;
		s5cubes_triList.primType = D3DPT_TRIANGLELIST;
		s5cubes_triList.meshVB.vertsCPU.reserve(6 * 2 * 3 * 6);

		for (unsigned modelID = 0; modelID < 6; ++modelID)
		{
			D3DXMATRIXA16 world, view, proj, wvp;
			D3DXMatrixTranslation(&world, (modelID % 3) * 2.0f, (modelID / 3) * -2.0f, 0.0f);
			D3DXVECTOR3 eye(-0.5f, 1.25f, -0.75f);
			D3DXVECTOR3 at(0.5f, 0.5f, 0.5f);
			D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
			D3DXMatrixLookAtRH(&view, &eye, &at, &up);
			D3DXMatrixPerspectiveFovRH(&proj, D3DXToRadian(90.0f), 640.0f / 480.0f, 0.001f, 100.0f);
			wvp = world * view * proj;

			for (unsigned primID = 0; primID < 6 * 2; ++primID)
			{
				const unsigned short aIndex = cubeIB_triList[primID * 3];
				const unsigned short bIndex = cubeIB_triList[primID * 3 + 1];
				const unsigned short cIndex = cubeIB_triList[primID * 3 + 2];

				vert3D tempVertA = TransformClipSpace(cubeVerts[aIndex], wvp);
				tempVertA.xyz.x *= 0.5f;
				tempVertA.xyz.x -= 0.5f;
				vert3D tempVertB = TransformClipSpace(cubeVerts[bIndex], wvp);
				tempVertB.xyz.x *= 0.5f;
				tempVertB.xyz.x -= 0.5f;
				vert3D tempVertC = TransformClipSpace(cubeVerts[cIndex], wvp);
				tempVertC.xyz.x *= 0.5f;
				tempVertC.xyz.x -= 0.5f;

				s5cubes_triList.meshVB.vertsCPU.push_back(tempVertA);
				s5cubes_triList.meshVB.vertsCPU.push_back(tempVertB);
				s5cubes_triList.meshVB.vertsCPU.push_back(tempVertC);
			}
		}
		s5cubes_triList.meshVB.UpdateVertexBufferUntransformed();

		s5discs_triFan.primCount = 18;
		s5discs_triFan.indexedDraw = false;
		s5discs_triFan.primType = D3DPT_TRIANGLEFAN;
		s5discs_triFan.meshVB.vertsCPU.reserve(20 * 2 * 6);
		for (unsigned modelID = 0; modelID < 6; ++modelID)
		{
			const float modelScale = 0.25f;
			const D3DXVECTOR3 modelTranslate(0.0f, 0.75f - (modelID / 3.0f), 0.0f);
			for (unsigned vertID = 0; vertID < 20; ++vertID)
				s5discs_triFan.meshVB.vertsCPU.push_back(TransformClipSpace(discTopVerts[vertID], modelScale, modelTranslate) );
			for (unsigned vertID = 0; vertID < 20; ++vertID)
				s5discs_triFan.meshVB.vertsCPU.push_back(TransformClipSpace(discBotVerts[vertID], modelScale, modelTranslate) );
		}
		s5discs_triFan.meshVB.UpdateVertexBufferUntransformed();

		s5cubes_triStrip.primCount = 18;
		s5cubes_triStrip.indexedDraw = false;
		s5cubes_triStrip.primType = D3DPT_TRIANGLESTRIP;
		s5cubes_triStrip.meshVB.vertsCPU.reserve(20 * 6);
		for (unsigned modelID = 0; modelID < 6; ++modelID)
		{
			D3DXMATRIXA16 world, view, proj, wvp;
			D3DXMatrixTranslation(&world, (modelID % 3) * 2.0f, (modelID / 3) * -2.0f, 0.0f);
			D3DXVECTOR3 eye(3.5f, 2.0f, -1.0f);
			D3DXVECTOR3 at(2.5f, -0.5f, 0.5f);
			D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
			D3DXMatrixLookAtRH(&view, &eye, &at, &up);
			D3DXMatrixPerspectiveFovRH(&proj, D3DXToRadian(90.0f), 640.0f / 480.0f, 0.001f, 100.0f);
			wvp = world * view * proj;

			for (unsigned index = 0; index < 20; ++index)
			{
				const unsigned short thisVertIndex = cubeIB_triStrip[index];
				vert3D tempVert = TransformClipSpace(cubeVerts[thisVertIndex], wvp);
				tempVert.xyz.x *= 0.5f;
				tempVert.xyz.x += 0.5f + 0.1f;
				s5cubes_triStrip.meshVB.vertsCPU.push_back(tempVert);
			}
		}
		s5cubes_triStrip.meshVB.UpdateVertexBufferUntransformed();
	}

	s5cubes_triList.Draw(36 * 0); // Draw cube 0
	s5cubes_triList.Draw(36 * 2); // Draw cube 2
	s5cubes_triList.Draw(36 * 4); // Draw cube 4
	s5discs_triFan.Draw(20 * 0); // Top half, mesh 0
	s5discs_triFan.Draw(20 * 1); // Bottom half, mesh 0
	s5discs_triFan.Draw(20 * 4); // Top half, mesh 2
	s5discs_triFan.Draw(20 * 5); // Bottom half, mesh 2
	s5discs_triFan.Draw(20 * 8); // Top half, mesh 4
	s5discs_triFan.Draw(20 * 9); // Bottom half, mesh 4
	s5cubes_triStrip.Draw(20 * 1); // Draw cube 1
	s5cubes_triStrip.Draw(20 * 3); // Draw cube 3
	s5cubes_triStrip.Draw(20 * 5); // Draw cube 5
}

// [6] Scene 6:
// DrawIndexedPrimitive(TriList with both BaseVertexIndex and StartIndex) mesh
// DrawIndexedPrimitive(TriStrip with both BaseVertexIndex and StartIndex) mesh
// DrawIndexedPrimitive(TriFan with both BaseVertexIndex and StartIndex) mesh
static Mesh s6cubes_triList;
static Mesh s6discs_triFan;
static Mesh s6cubes_triStrip;
static void RenderScene6(void)
{
	static bool init = false;
	if (!init)
	{
		init = true;

		vert3D cubeVerts[8];
		for (unsigned n = 0; n < 8; ++n)
		{
			vert3D& thisVert = cubeVerts[n];
			thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
			thisVert.xyz.x = (const float)(n & 0x1);
			thisVert.xyz.z = (const float)( (n >> 1) & 0x1);
			thisVert.xyz.y = (const float)( (n >> 2) & 0x1);
			thisVert.texcoord0.x = thisVert.xyz.x;
			thisVert.texcoord0.y = thisVert.xyz.y;
		}

		vert3D discTopVerts[19];
		vert3D& topCenterVert = discTopVerts[0];
		topCenterVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
		topCenterVert.xyz.x = (const float)0.0f;
		topCenterVert.xyz.y = (const float)1.0f;
		topCenterVert.xyz.z = (const float)0.5f;
		topCenterVert.texcoord0.x = 0.5f;
		topCenterVert.texcoord0.y = 0.5f;
		for (unsigned rimVert = 0; rimVert < 18; ++rimVert)
		{
			vert3D& thisVert = discTopVerts[rimVert + 1];
			thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);

			const float phi = 1.0f - rimVert / 17.0f; // Reverse the rim order of one of the halves in order for it to match the same CW/CCW winding of the other half
			const float phiAngle = phi * 2.0f * D3DX_PI;
			thisVert.xyz.x = cosf(phiAngle);
			thisVert.xyz.y = 0.5f;
			thisVert.xyz.z = sinf(phiAngle) * 0.5f + 0.5f;
			thisVert.texcoord0.x = thisVert.xyz.x * 0.5f + 0.5f;
			thisVert.texcoord0.y = thisVert.xyz.z;
		}
		vert3D discBotVerts[19];
		vert3D& botCenterVert = discBotVerts[0];
		botCenterVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
		botCenterVert.xyz.x = (const float)0.0f;
		botCenterVert.xyz.y = (const float)0.0f;
		botCenterVert.xyz.z = (const float)0.5f;
		botCenterVert.texcoord0.x = 0.5f;
		botCenterVert.texcoord0.y = 0.5f;
		for (unsigned rimVert = 0; rimVert < 18; ++rimVert)
		{
			vert3D& thisVert = discBotVerts[rimVert + 1];
			thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);

			const float phi = rimVert / 17.0f;
			const float phiAngle = phi * 2.0f * D3DX_PI;
			thisVert.xyz.x = cosf(phiAngle);
			thisVert.xyz.y = 0.5f;
			thisVert.xyz.z = sinf(phiAngle) * 0.5f + 0.5f;
			thisVert.texcoord0.x = thisVert.xyz.x * 0.5f + 0.5f;
			thisVert.texcoord0.y = thisVert.xyz.z;
		}

		s6cubes_triList.primCount = 6 * 2;
		s6cubes_triList.indexedDraw = true;
		s6cubes_triList.primType = D3DPT_TRIANGLELIST;
		s6cubes_triList.meshVB.vertsCPU.reserve(6 * 8);
		s6cubes_triList.meshIB.indexFormat = D3DFMT_INDEX32;
		s6cubes_triList.meshIB.indicesCPU32.reserve(6 * 3 * 2 * 6);
		for (unsigned modelID = 0; modelID < 6; ++modelID)
		{
			D3DXMATRIXA16 world, view, proj, wvp;
			D3DXMatrixTranslation(&world, (modelID % 3) * 2.0f, (modelID / 3) * -2.0f, 0.0f);
			D3DXVECTOR3 eye(-0.5f, 1.25f, -0.75f);
			D3DXVECTOR3 at(0.5f, 0.5f, 0.5f);
			D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
			D3DXMatrixLookAtRH(&view, &eye, &at, &up);
			D3DXMatrixPerspectiveFovRH(&proj, D3DXToRadian(90.0f), 640.0f / 480.0f, 0.001f, 100.0f);
			wvp = world * view * proj;

			for (unsigned vertID = 0; vertID < 8; ++vertID)
			{
				vert3D tempVert = TransformClipSpace(cubeVerts[vertID], wvp);
				tempVert.xyz.x *= 0.5f;
				tempVert.xyz.x -= 0.5f;
				s6cubes_triList.meshVB.vertsCPU.push_back(tempVert);
			}

			for (unsigned primID = 0; primID < 6 * 2; ++primID)
			{
				const unsigned short aIndex = cubeIB_triList[primID * 3];
				const unsigned short bIndex = cubeIB_triList[primID * 3 + 1];
				const unsigned short cIndex = cubeIB_triList[primID * 3 + 2];

				s6cubes_triList.meshIB.indicesCPU32.push_back(aIndex + modelID * 8);
				s6cubes_triList.meshIB.indicesCPU32.push_back(bIndex + modelID * 8);
				s6cubes_triList.meshIB.indicesCPU32.push_back(cIndex + modelID * 8);
			}
		}
		s6cubes_triList.meshVB.UpdateVertexBufferUntransformed();
		s6cubes_triList.meshIB.UpdateIndexBuffer();

		s6discs_triFan.primCount = 18;
		s6discs_triFan.indexedDraw = true;
		s6discs_triFan.primType = D3DPT_TRIANGLEFAN;
		s6discs_triFan.meshIB.indexFormat = D3DFMT_INDEX32;
		s6discs_triFan.meshVB.vertsCPU.reserve(19 * 2 * 6);
		s6discs_triFan.meshIB.indicesCPU32.reserve(20 * 2 * 6);
		for (unsigned modelID = 0; modelID < 6; ++modelID)
		{
			const float modelScale = 0.25f;
			const D3DXVECTOR3 modelTranslate(0.0f, 0.75f - (modelID / 3.0f), 0.0f);
			for (unsigned vertID = 0; vertID < 19; ++vertID) // Top
				s6discs_triFan.meshVB.vertsCPU.push_back(TransformClipSpace(discTopVerts[vertID], modelScale, modelTranslate) );
			for (unsigned vertID = 0; vertID < 19; ++vertID) // Bottom
				s6discs_triFan.meshVB.vertsCPU.push_back(TransformClipSpace(discBotVerts[vertID], modelScale, modelTranslate) );

			// Top half:
			s6discs_triFan.meshIB.indicesCPU32.push_back(0 + modelID * 19 * 2);
			for (unsigned indexID = 0; indexID < 18; ++indexID)
				s6discs_triFan.meshIB.indicesCPU32.push_back(indexID + 1 + modelID * 19 * 2);
			s6discs_triFan.meshIB.indicesCPU32.push_back(1 + modelID * 19 * 2);

			s6discs_triFan.meshIB.indicesCPU32.push_back(19 + modelID * 19 * 2);
			for (unsigned indexID = 0; indexID < 18; ++indexID)
				s6discs_triFan.meshIB.indicesCPU32.push_back(19 + indexID + 1 + modelID * 19 * 2);
			s6discs_triFan.meshIB.indicesCPU32.push_back(19 + 1 + modelID * 19 * 2);
		}
		s6discs_triFan.meshVB.UpdateVertexBufferUntransformed();
		s6discs_triFan.meshIB.UpdateIndexBuffer();

		s6cubes_triStrip.primCount = 18;
		s6cubes_triStrip.indexedDraw = true;
		s6cubes_triStrip.primType = D3DPT_TRIANGLESTRIP;
		s6cubes_triStrip.meshIB.indexFormat = D3DFMT_INDEX32;
		s6cubes_triStrip.meshVB.vertsCPU.reserve(8 * 6);
		s6cubes_triStrip.meshIB.indicesCPU32.reserve(ARRAYSIZE(cubeIB_triStrip) * 6);
		for (unsigned modelID = 0; modelID < 6; ++modelID)
		{
			D3DXMATRIXA16 world, view, proj, wvp;
			D3DXMatrixTranslation(&world, (modelID % 3) * 2.0f, (modelID / 3) * -2.0f, 0.0f);
			D3DXVECTOR3 eye(3.5f, 2.0f, -1.0f);
			D3DXVECTOR3 at(2.5f, -0.5f, 0.5f);
			D3DXVECTOR3 up(0.0f, 1.0f, 0.0f);
			D3DXMatrixLookAtRH(&view, &eye, &at, &up);
			D3DXMatrixPerspectiveFovRH(&proj, D3DXToRadian(90.0f), 640.0f / 480.0f, 0.001f, 100.0f);
			wvp = world * view * proj;

			for (unsigned vertID = 0; vertID < 8; ++vertID)
			{
				vert3D tempVert = TransformClipSpace(cubeVerts[vertID], wvp);
				tempVert.xyz.x *= 0.5f;
				tempVert.xyz.x += 0.5f + 0.25f;
				s6cubes_triStrip.meshVB.vertsCPU.push_back(tempVert);
			}

			for (unsigned indexID = 0; indexID < ARRAYSIZE(cubeIB_triStrip); ++indexID)
			{
				const unsigned short thisIndex = cubeIB_triStrip[indexID];
				s6cubes_triStrip.meshIB.indicesCPU32.push_back(thisIndex + 8 * modelID);
			}
		}
		s6cubes_triStrip.meshVB.UpdateVertexBufferUntransformed();
		s6cubes_triStrip.meshIB.UpdateIndexBuffer();
	}

	s6cubes_triList.Draw(0, 36 * 1); // Draw cube 1
	s6cubes_triList.Draw(0, 36 * 3); // Draw cube 3
	s6cubes_triList.Draw(0, 36 * 5); // Draw cube 5
	s6cubes_triList.Draw(8, 36 * 1); // Draw cube 2 using both offsets at once
	s6discs_triFan.Draw(0, 20 * 2); // Top half, mesh 1
	s6discs_triFan.Draw(0, 20 * 3); // Bottom half, mesh 1
	s6discs_triFan.Draw(19*2, 20 * 2); // Top half, mesh 2 using both offsets at once
	s6discs_triFan.Draw(19*2, 20 * 3); // Bottom half, mesh 2 using both offsets at once
	s6discs_triFan.Draw(0, 20 * 6); // Top half, mesh 3
	s6discs_triFan.Draw(0, 20 * 7);	// Bottom half, mesh 3
	s6discs_triFan.Draw(0, 20 * 10); // Top half, mesh 5
	s6discs_triFan.Draw(0, 20 * 11); // Bottom half, mesh 5
	s6cubes_triStrip.Draw(0, 20 * 0); // Draw cube 0
	s6cubes_triStrip.Draw(0, 20 * 2); // Draw cube 2
	s6cubes_triStrip.Draw(8, 20 * 2); // Draw cube 3 using both offsets at once
	s6cubes_triStrip.Draw(0, 20 * 4); // Draw cube 4
}

static inline void RenderFrame(const long double timeDelta)
{
	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(0, 0, 255), 1.0f, 0x00000000);
	d3d9dev->BeginScene();

	// Render stuff here!

	d3d9dev->SetRenderState(D3DRS_CULLMODE, D3DCULL_CW);
	d3d9dev->SetRenderState(D3DRS_LIGHTING, FALSE);
	d3d9dev->SetRenderState(D3DRS_COLORVERTEX, TRUE);
	d3d9dev->SetRenderState(D3DRS_SHADEMODE, D3DSHADE_GOURAUD);
	d3d9dev->SetRenderState(D3DRS_DIFFUSEMATERIALSOURCE, D3DMCS_COLOR1);
	d3d9dev->SetRenderState(D3DRS_AMBIENTMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_EMISSIVEMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetRenderState(D3DRS_SPECULARMATERIALSOURCE, D3DMCS_MATERIAL);
	d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSU, D3DTADDRESS_WRAP);
	d3d9dev->SetSamplerState(0, D3DSAMP_ADDRESSV, D3DTADDRESS_WRAP);
	d3d9dev->SetSamplerState(0, D3DSAMP_MAGFILTER, D3DTEXF_POINT);
	d3d9dev->SetSamplerState(0, D3DSAMP_MINFILTER, D3DTEXF_POINT);
	d3d9dev->SetSamplerState(0, D3DSAMP_MIPFILTER, D3DTEXF_NONE);
	d3d9dev->SetTexture(0, checkerboardTexture);

	// Alternatives to every scene:
	// [u]/[b] - Use the *UP variants of each Draw function instead of the normal ones
	// [p]/[t] - Use fully pretransformed verts (D3DFVF_XYZRHW/POSITIONT) rather than relying on the transform pipeline
	// [v]/[t] - Use vertex shading rather than using the core fixed-function vertex pipeline
	// [f]/[g] - Use flat shading or gouraud shading
	if (GetAsyncKeyState('U') & 0x8000)
		drawFromUserPointers = true;
	else if (GetAsyncKeyState('B') & 0x8000)
		drawFromUserPointers = false;

	if (GetAsyncKeyState('P') & 0x8000)
	{
		drawUsingPretransformedVerts = true;
		drawUsingVertexShader = false;
	}
	else if (GetAsyncKeyState('T') & 0x8000)
	{
		drawUsingPretransformedVerts = false;
		drawUsingVertexShader = false;
	}

	if (GetAsyncKeyState('V') & 0x8000)
	{
		drawUsingVertexShader = true;
		drawUsingPretransformedVerts = false;
	}

	if (GetAsyncKeyState('0') & 0x8000)
		sceneID = 0;
	else if (GetAsyncKeyState('1') & 0x8000)
		sceneID = 1;
	else if (GetAsyncKeyState('2') & 0x8000)
		sceneID = 2;
	else if (GetAsyncKeyState('3') & 0x8000)
		sceneID = 3;
	else if (GetAsyncKeyState('4') & 0x8000)
		sceneID = 4;
	else if (GetAsyncKeyState('5') & 0x8000)
		sceneID = 5;
	else if (GetAsyncKeyState('6') & 0x8000)
		sceneID = 6;
	else if (GetAsyncKeyState('7') & 0x8000)
		sceneID = 7;

	if (GetAsyncKeyState('R') & 0x8000)
	{
		drawFromUserPointers = false;
		drawUsingPretransformedVerts = false;
		drawUsingVertexShader = false;
		sceneID = 0;
	}

	if (drawUsingPretransformedVerts)
		d3d9dev->SetFVF(D3DFVF_XYZRHW | D3DFVF_DIFFUSE | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0) );
	else
		d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0) );

	if (drawUsingVertexShader)
		d3d9dev->SetVertexShader(testVS);
	else
		d3d9dev->SetVertexShader(NULL);

	char windowText[128] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(windowText, "Scene %u; Source: %s; Transform: %s; Pipeline: %s", sceneID,
		drawFromUserPointers ? "UserPointer" : "VertBuffer",
		drawUsingPretransformedVerts ? "Pretransformed" : "Untransformed",
		drawUsingVertexShader ? "VertexShader" : "FixedFunction");
#pragma warning(pop)
	SetWindowTextA(wnd, windowText);

	switch (sceneID)
	{
	default:
	case 0:
		RenderScene0();
		break;
	case 1:
		RenderScene1();
		break;
	case 2:
		RenderScene2();
		break;
	case 3:
		RenderScene3();
		break;
	case 4:
		RenderScene4();
		break;
	case 5:
		RenderScene5();
		break;
	case 6:
		RenderScene6();
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

	testVS = LoadVertexShader("testVS");
	if (!testVS)
	{
		printf("Error in LoadVertexShader()\n");
		return 1;
	}

	if (FAILED(d3d9dev->CreateTexture(16, 16, 1, 0, D3DFMT_X8R8G8B8, D3DPOOL_MANAGED, &checkerboardTexture, NULL) ) )
	{
		printf("Error in CreateTexture()\n");
		return 1;
	}

	D3DLOCKED_RECT d3dlr = {0};
	checkerboardTexture->LockRect(0, &d3dlr, NULL, 0);
	D3DCOLOR* texels = (D3DCOLOR* const)(d3dlr.pBits);
	for (unsigned y = 0; y < 16; ++y)
	{
		for (unsigned x = 0; x < 16; ++x)
		{
			if (y & 0x1)
				texels[x] = (x & 0x1) ? 0x00000000 : 0xFFFFFFFF;
			else
				texels[x] = (x & 0x1) ? 0xFFFFFFFF : 0x00000000;
		}
		texels += (d3dlr.Pitch / sizeof(D3DCOLOR) );
	}
	checkerboardTexture->UnlockRect(0);

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
