#pragma once

#include "d3d9include.h"

enum LiveObjectType : unsigned char
{
	LOT_D3D9 = 0, // IDirect3D9/Ex (has no parent)
	LOT_Device, // IDirect3DDevice9/Ex (parent is IDirect3D9)
	LOT_Surface, // Parent is IDirect3DDevice9
	LOT_Texture, // Parent is IDirect3DDevice9
	LOT_VertexBuffer, // Parent is IDirect3DDevice9
	LOT_IndexBuffer, // Parent is IDirect3DDevice9
	LOT_PixelShader, // Parent is IDirect3DDevice9
	LOT_VertexShader, // Parent is IDirect3DDevice9
	LOT_VertexDeclaration, // Parent is IDirect3DDevice9
	LOT_StateBlock, // Parent is IDirect3DDevice9
	LOT_Query,// Parent is IDirect3DDevice9
	
	LOT_COUNT // This must always be last
};

// Call this once on startup to initialize the system
void InitLiveObjectCounters();

// Register a new object when it is created
void RegisterNewLiveObject(const LiveObjectType type, const void* const ptr, const void* const parentPtr);

// Unregister an object when it is destroyed
void UnregisterLiveObject(const LiveObjectType type, const void* const ptr, const void* const parentPtr);

// Query how many objects of a given type are currently live
const unsigned GetLiveObjectsCount(const LiveObjectType type);

// Call this once on shutdown to terminate the system
void ShutdownLiveObjectCounters();
