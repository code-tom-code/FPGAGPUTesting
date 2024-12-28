#pragma once

#include <map>

enum D3D9ObjectType : unsigned char
{
	OT_Unknown = 0,
	OT_RenderTarget,
	OT_DepthBuffer,
	OT_Texture,
	OT_VertexBuffer,
	OT_IndexBuffer,
	OT_VertexShader,
	OT_QueryMemory,
	OT_StatsBuffer,
};

struct AllocObjectParams
{
	D3D9ObjectType type;
	union _objectTypeParams
	{
		struct
		{
			D3DFORMAT RTDSFormat;
			unsigned short width;
			unsigned short height;
		} renderTargetDepthStencilParams;
		struct
		{
			D3DFORMAT texFormat;
			unsigned short width;
			unsigned short height;
			unsigned char numMipLevels;
		} textureParams;
		struct
		{
			unsigned byteCount;
		} vertexBuffer;
		struct
		{
			unsigned indexCount;
			D3DFORMAT indexFormat : 8;
		} indexBuffer;
		struct
		{
			unsigned short tokensCount;
		} vertexShaderBytecode;
		struct
		{
			D3DQUERYTYPE queryType : 8;
		} queryMemory;
		struct
		{
			unsigned byteCount;
		} statsMemory;
	} objectTypeParams;

	// Computes the size of this resource, in bytes, based on its parameters and format:
	const unsigned GetResourceSizeBytes() const;

	const bool operator==(const AllocObjectParams& rhs) const;
};

void AddMemoryBitmapDWORDWrite(const unsigned gpuAddress);
const unsigned GetContiguousWriteRegionSizeBytes(const unsigned gpuStartingAddress);

// Contains a mapping of each resource to its address in the virtual GPU VRAM address-space
struct LiveResourcesRegistry
{
	struct liveResource
	{
		IUnknown* liveObject;
		AllocObjectParams params;
	};
	std::map<DWORD, liveResource> allLiveResources;
	std::map<DWORD, LPDIRECT3DVERTEXDECLARATION9> allLiveVertexDecls;

	IUnknown* FindMatchingResourceAtAddress(const unsigned gpuAddress, const AllocObjectParams& objParams) const;
	void CreateNewResourceAtAddress(const unsigned gpuAddress, const AllocObjectParams& objParams, IUnknown* const newResource);

	LPDIRECT3DVERTEXDECLARATION9 GetFindOrCreateVertexDeclaration(const D3DVERTEXELEMENT9* const pElements);
	LPDIRECT3DTEXTURE9 GetFindOrCreateTextureAtAddress(const unsigned gpuAddress, const unsigned short width, const unsigned short height, const unsigned char mipLevels, const D3DFORMAT format);
	LPDIRECT3DQUERY9 GetFindOrCreateQueryAtAddress(const unsigned gpuAddress, const D3DQUERYTYPE queryType);
	LPDIRECT3DVERTEXBUFFER9 GetFindOrCreateVertexBufferAtAddress(const unsigned gpuAddress, const unsigned lengthBytes);
	LPDIRECT3DINDEXBUFFER9 GetFindOrCreateIndexBufferAtAddress(const unsigned gpuAddress, const unsigned lengthIndices, const D3DFORMAT format);
	LPDIRECT3DVERTEXSHADER9 GetFindOrCreateVertexShaderAtAddress(const unsigned gpuAddress, const unsigned lengthTokens);
};
