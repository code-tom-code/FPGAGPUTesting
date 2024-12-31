#include "d3d9include.h"
#include "LiveResourcesRegistry.h"
#include "..\\..\\Software_d3d9_Driver\\Driver\\GPUAllocator.h"
#include <unordered_map>

#include "ReverseShaderCompilerD3D9.h"

// Global D3D9EX device:
extern LPDIRECT3DDEVICE9EX d3d9dev;
extern __declspec(align(128) ) BYTE LocalMemory[GPU_DRAM_TOTAL_CAPACITY_BYTES];
extern __declspec(align(128) ) DWORD LocalMemoryWriteDWORDsBitmap[GPU_DRAM_TOTAL_CAPACITY_BYTES / (sizeof(DWORD) * 32)];
extern __declspec(align(128) ) DWORD LocalMemoryPagesDirtyBitmap[GPU_DRAM_TOTAL_CAPACITY_BYTES / GPU_PAGE_SIZE_BYTES / (sizeof(DWORD) * 8)];

static const unsigned GetSingleElementSizeBytes(const D3DFORMAT fmt)
{
	switch (fmt)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Unknown format type!
#endif
	case D3DFMT_UNKNOWN:
		return sizeof(BYTE);
	case D3DFMT_R8G8B8:
		return 3;
	case D3DFMT_A8R8G8B8:
	case D3DFMT_X8R8G8B8:
	case D3DFMT_A2B10G10R10:
	case D3DFMT_A8B8G8R8:
	case D3DFMT_X8B8G8R8:
	case D3DFMT_G16R16:
	case D3DFMT_A2R10G10B10:
	case D3DFMT_X8L8V8U8:
	case D3DFMT_Q8W8V8U8:
	case D3DFMT_V16U16:
	case D3DFMT_A2W10V10U10:
	case D3DFMT_G16R16F:
	case D3DFMT_R32F:
		return sizeof(D3DCOLOR);
	case D3DFMT_R5G6B5:
	case D3DFMT_X1R5G5B5:
	case D3DFMT_A1R5G5B5:
	case D3DFMT_A4R4G4B4:
	case D3DFMT_A8R3G3B2:
	case D3DFMT_X4R4G4B4:
	case D3DFMT_A8P8:
	case D3DFMT_A8L8:
	case D3DFMT_V8U8:
	case D3DFMT_L6V5U5:
	case D3DFMT_R16F:
		return sizeof(USHORT);
	case D3DFMT_R3G3B2:
	case D3DFMT_A8:
	case D3DFMT_P8:		
	case D3DFMT_L8:
	case D3DFMT_A4L4:
		return sizeof(BYTE);
	case D3DFMT_A16B16G16R16:
	case D3DFMT_A16B16G16R16F:
	case D3DFMT_G32R32F:
		return 8;
	case D3DFMT_A32B32G32R32F:
		return 16;

		// Not super sure on these video formats:
	case D3DFMT_UYVY:
	case D3DFMT_R8G8_B8G8:
	case D3DFMT_YUY2:
	case D3DFMT_G8R8_G8B8:
		return 4;

		// Compressed texture formats:
	case D3DFMT_DXT1:
	case D3DFMT_DXT2:
	case D3DFMT_DXT3:
	case D3DFMT_DXT4:
	case D3DFMT_DXT5:
		return 1;

		// Depth/stencil formats:
	case D3DFMT_S8_LOCKABLE:
		return 1;
	case D3DFMT_D16_LOCKABLE:
	case D3DFMT_D15S1:
	case D3DFMT_D16:
		return 2;
	case D3DFMT_D24S8:
	case D3DFMT_D24X8:
	case D3DFMT_D24X4S4:
	case D3DFMT_D32:
	case D3DFMT_D32F_LOCKABLE:
	case D3DFMT_D24FS8:
	case D3DFMT_D32_LOCKABLE:
		return 4;

	case D3DFMT_L16:
		return 2;
	case D3DFMT_VERTEXDATA:
		return 1;
	case D3DFMT_INDEX16:
		return sizeof(unsigned short);
	case D3DFMT_INDEX32:
		return sizeof(unsigned long);
	case D3DFMT_Q16W16V16U16:
		return 8;
	case D3DFMT_MULTI2_ARGB8:
		return 8;

	case D3DFMT_CxV8U8:
		return 2;
	case D3DFMT_A1:
		return 1;
	case D3DFMT_A2B10G10R10_XR_BIAS:
		return 4;
	case D3DFMT_BINARYBUFFER:
		return 1;
	}
}

static inline const bool IsPageDirty(const unsigned pageIndex)
{
	const unsigned DWORDIndex = pageIndex / 32;
	const unsigned DWORDBitIndex = pageIndex % 32;
	return (LocalMemoryPagesDirtyBitmap[DWORDIndex] & (1 << DWORDBitIndex) ) != 0;
}

static inline void MarkPageClean(const unsigned pageIndex)
{
	const unsigned DWORDIndex = pageIndex / 32;
	const unsigned DWORDBitIndex = pageIndex % 32;
	LocalMemoryPagesDirtyBitmap[DWORDIndex] &= (~(1 << DWORDBitIndex) );
}

// Returns true if any of this resource's dirty page bits are set, or false if they are not
static inline const bool IsResourceDirty(const unsigned gpuStartingAddress, const unsigned byteLength)
{
	const unsigned gpuEndingAddress = gpuStartingAddress + byteLength - 1;
	const unsigned startingPageIndex = gpuStartingAddress / GPU_PAGE_SIZE_BYTES;
	const unsigned endingPageIndex = gpuEndingAddress / GPU_PAGE_SIZE_BYTES;
	for (unsigned pageIndex = startingPageIndex; pageIndex <= endingPageIndex; ++pageIndex)
	{
		if (IsPageDirty(pageIndex) )
			return true;
	}
	return false;
}

// Marks all pages that this resource intersects as clean (clears the dirty flag)
static inline void MarkDirtyResourceClean(const unsigned gpuStartingAddress, const unsigned byteLength)
{
	const unsigned gpuEndingAddress = gpuStartingAddress + byteLength - 1;
	const unsigned startingPageIndex = gpuStartingAddress / GPU_PAGE_SIZE_BYTES;
	const unsigned endingPageIndex = gpuEndingAddress / GPU_PAGE_SIZE_BYTES;
	for (unsigned pageIndex = startingPageIndex; pageIndex <= endingPageIndex; ++pageIndex)
	{
		MarkPageClean(pageIndex);
	}
}

const unsigned AllocObjectParams::GetResourceSizeBytes() const
{
	switch (type)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Should never be here!
	}
#endif
	case OT_Unknown:
		return 2048; // For now just return the size of one minimum DRAM allocation

	case OT_RenderTarget:
	case OT_DepthBuffer:
		return GetSingleElementSizeBytes(objectTypeParams.renderTargetDepthStencilParams.RTDSFormat) * objectTypeParams.renderTargetDepthStencilParams.width * objectTypeParams.renderTargetDepthStencilParams.height;

	case OT_Texture:
		return GetSingleElementSizeBytes(objectTypeParams.textureParams.texFormat) * objectTypeParams.textureParams.width * objectTypeParams.textureParams.height * objectTypeParams.textureParams.numMipLevels;

	case OT_VertexBuffer:
		return objectTypeParams.vertexBuffer.byteCount;

	case OT_IndexBuffer:
		return GetSingleElementSizeBytes(objectTypeParams.indexBuffer.indexFormat) * objectTypeParams.indexBuffer.indexCount;

	case OT_VertexShader:
		return objectTypeParams.vertexShaderBytecode.tokensCount * sizeof(UINT64);

	case OT_QueryMemory:
		switch (objectTypeParams.queryMemory.queryType)
		{
		default:
#ifdef _DEBUG
			__debugbreak(); // The driver doesn't really support these other types of queries, not sure how we'd be leaking one through to here...
#endif
			return sizeof(DWORD);
		case D3DQUERYTYPE_EVENT:
			return sizeof(BOOL);
		case D3DQUERYTYPE_OCCLUSION:
			return sizeof(DWORD);
		case D3DQUERYTYPE_TIMESTAMP:
			return sizeof(UINT64);
		}

	case OT_StatsBuffer:
		return objectTypeParams.statsMemory.byteCount;
	}
}

const bool AllocObjectParams::operator==(const AllocObjectParams& rhs) const
{
	if (type == rhs.type)
	{
		switch (type)
		{
			default:
#ifdef _DEBUG
		{
			__debugbreak(); // Should never be here!
		}
#endif
		case OT_Unknown:
			return false;

		case OT_RenderTarget:
		case OT_DepthBuffer:
			return memcmp(&rhs.objectTypeParams.renderTargetDepthStencilParams, &objectTypeParams.renderTargetDepthStencilParams, sizeof(objectTypeParams.renderTargetDepthStencilParams) ) == 0;

		case OT_Texture:
			return memcmp(&rhs.objectTypeParams.textureParams, &objectTypeParams.textureParams, sizeof(objectTypeParams.textureParams) ) == 0;

		case OT_VertexBuffer:
			return memcmp(&rhs.objectTypeParams.vertexBuffer, &objectTypeParams.vertexBuffer, sizeof(objectTypeParams.vertexBuffer) ) == 0;

		case OT_IndexBuffer:
			return memcmp(&rhs.objectTypeParams.indexBuffer, &objectTypeParams.indexBuffer, sizeof(objectTypeParams.indexBuffer) ) == 0;

		case OT_VertexShader:
			return memcmp(&rhs.objectTypeParams.vertexShaderBytecode, &objectTypeParams.vertexShaderBytecode, sizeof(objectTypeParams.vertexShaderBytecode) ) == 0;

		case OT_QueryMemory:
			return memcmp(&rhs.objectTypeParams.queryMemory, &objectTypeParams.queryMemory, sizeof(objectTypeParams.queryMemory) ) == 0;

		case OT_StatsBuffer:
			return memcmp(&rhs.objectTypeParams.statsMemory, &objectTypeParams.statsMemory, sizeof(objectTypeParams.statsMemory) ) == 0;
		}
	}
	return false;
}

IUnknown* LiveResourcesRegistry::FindMatchingResourceAtAddress(const unsigned gpuAddress, const AllocObjectParams& objParams) const
{
	if (gpuAddress == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate a resource at the NULL address!
#endif
		return NULL;
	}

	std::map<DWORD, liveResource>::const_iterator findIt = allLiveResources.find(gpuAddress);
	if (findIt == allLiveResources.end() )
	{
		// No resource was found at this address!
		return NULL;
	}

	if (objParams == findIt->second.params)
	{
		return findIt->second.liveObject;
	}
	else
	{
		// Non-matching resource found at this address!
		return NULL;
	}
}

void LiveResourcesRegistry::CreateNewResourceAtAddress(const unsigned gpuAddress, const AllocObjectParams& objParams, IUnknown* const newResource)
{
	if (gpuAddress == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate a resource at the NULL address!
#endif
		return;
	}

	if (newResource == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Do not call this function with a null pointer!
#endif
		return;
	}

	std::map<DWORD, liveResource>::iterator findIt = allLiveResources.find(gpuAddress);
	if (findIt != allLiveResources.end() )
	{
		findIt->second.liveObject->Release();
		findIt->second.liveObject = NULL;

		allLiveResources.erase(findIt);
	}

	liveResource newLiveResource;
	newLiveResource.liveObject = newResource;
	newLiveResource.params = objParams;
	allLiveResources.insert(std::make_pair(gpuAddress, newLiveResource) );
}

struct StagingTexParams
{
	unsigned short Width;
	unsigned short Height;
	unsigned char MipLevels;
	unsigned char FormatHash;

	void InitParams(const unsigned _Width, const unsigned _Height, const unsigned _MipLevels, const D3DFORMAT format)
	{
		Width = (const unsigned short)_Width;
		Height = (const unsigned short)_Height;
		MipLevels = (const unsigned char)_MipLevels;
		FormatHash = HashFormat(format);
	}

	inline const bool operator==(const StagingTexParams& rhs) const
	{
		return Width == rhs.Width &&
			Height == rhs.Height &&
			MipLevels == rhs.MipLevels &&
			FormatHash == rhs.FormatHash;
	}

	// Try to compress the 32-bit D3DFORMAT into an 8-bit value:
	static const unsigned char HashFormat(const D3DFORMAT fmt)
	{
		if (fmt < 200)
		{
			return (const unsigned char)fmt;
		}

		switch (fmt)
		{
		case D3DFMT_DXT1:
			return 201;
		case D3DFMT_DXT2:
			return 202;
		case D3DFMT_DXT3:
			return 203;
		case D3DFMT_DXT4:
			return 204;
		case D3DFMT_DXT5:
			return 205;
		case D3DFMT_UYVY:
			return 206;
		case D3DFMT_YUY2:
			return 207;
		case D3DFMT_R8G8_B8G8:
			return 208;
		case D3DFMT_G8R8_G8B8:
			return 209;
		case D3DFMT_MULTI2_ARGB8:
			return 210;
		default:
			return 255;
		}
	}
};

template <>
struct std::hash<StagingTexParams>
{
	std::size_t operator()(const StagingTexParams& key) const
	{
		std::size_t ret0 = 0;
		ret0 |= key.Width;
		ret0 |= ( (const unsigned)key.Height) << 16;
		ret0 |= ( (const unsigned)key.MipLevels) << 8;
		ret0 |= ( (const unsigned)key.FormatHash) << 24;
		std::size_t ret1 = 0;
		ret1 |= key.Width;
		ret1 = _rotl(ret1, 13);
		ret1 ^= key.Height;
		ret1 = _rotl(ret1, 17);
		ret1 ^= key.MipLevels;
		ret1 = _rotl(ret1, 17);
		ret1 ^= key.FormatHash;
		return ret0 ^ ret1;
	}
};

// Cache our CPU-side staging textures so that we don't have to constantly recreate & delete them all the time
static std::unordered_map<StagingTexParams, LPDIRECT3DTEXTURE9> StagingTexturesCache;

LPDIRECT3DTEXTURE9 GetCreateCachedStagingTexture(const unsigned short width, const unsigned short height, const unsigned char mipLevels, const D3DFORMAT format)
{
	StagingTexParams texParams;
	texParams.InitParams(width, height, mipLevels, format);

	std::unordered_map<StagingTexParams, LPDIRECT3DTEXTURE9>::iterator findIt = StagingTexturesCache.find(texParams);
	if (findIt != StagingTexturesCache.end() )
	{
		return findIt->second;
	}

	LPDIRECT3DTEXTURE9 newTex = NULL;
	d3d9dev->CreateTexture(width, height, mipLevels, 0, format, D3DPOOL_SYSTEMMEM, &newTex, NULL);

	StagingTexturesCache.insert(std::make_pair(texParams, newTex) );

	return newTex;
}

static void UpdateTextureData(LPDIRECT3DTEXTURE9 pTex, const unsigned gpuAddress, const unsigned short width, const unsigned short height, const unsigned char mipLevels, const D3DFORMAT format)
{
	LPDIRECT3DTEXTURE9 tempCPUTex = GetCreateCachedStagingTexture(width, height, mipLevels, format);

	const unsigned mipLevelLinearSize = GetSingleElementSizeBytes(format) * (const unsigned)width * (const unsigned)height;
	unsigned gpuMemoryOffset = gpuAddress;
	for (unsigned mipLevel = 0; mipLevel < mipLevels; ++mipLevel)
	{
		D3DLOCKED_RECT d3dlr = {0};
		tempCPUTex->LockRect(mipLevel, &d3dlr, NULL, 0);
		BYTE* currentLockedRowStartAddress = reinterpret_cast<BYTE* const>(d3dlr.pBits);
		const D3DCOLOR* const mipLevelStartAddress = reinterpret_cast<const D3DCOLOR* const>(LocalMemory + gpuMemoryOffset);
		const unsigned texelRowLinearSize = GetSingleElementSizeBytes(format) * (const unsigned)width;
		for (unsigned y = 0; y < height; ++y)
		{
			const D3DCOLOR* const texelRowStartAddress = reinterpret_cast<const D3DCOLOR* const>(LocalMemory + gpuMemoryOffset + y * texelRowLinearSize);
			memcpy(currentLockedRowStartAddress, texelRowStartAddress, texelRowLinearSize);
			currentLockedRowStartAddress += d3dlr.Pitch; // The row Pitch is in bytes
		}
		tempCPUTex->UnlockRect(mipLevel);

		gpuMemoryOffset += mipLevelLinearSize;
	}

	if (FAILED(d3d9dev->UpdateTexture(tempCPUTex, pTex) ) )
	{
		__debugbreak();
	}
}

LPDIRECT3DTEXTURE9 LiveResourcesRegistry::GetFindOrCreateTextureAtAddress(const unsigned gpuAddress, const unsigned short width, const unsigned short height, const unsigned char mipLevels, const D3DFORMAT format)
{
	if (gpuAddress == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate a resource at the NULL address!
#endif
		return NULL;
	}

	if (mipLevels == 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Have to calculate the mip-count and pass it to this function. Cannot use 0 here!
#endif
		return NULL;
	}

	AllocObjectParams textureObjectParams;
	textureObjectParams.type = OT_Texture;
	textureObjectParams.objectTypeParams.textureParams.width = width;
	textureObjectParams.objectTypeParams.textureParams.height = height;
	textureObjectParams.objectTypeParams.textureParams.numMipLevels = mipLevels;
	textureObjectParams.objectTypeParams.textureParams.texFormat = format;

	const unsigned mipLevelLinearSize = GetSingleElementSizeBytes(format) * (const unsigned)width * (const unsigned)height;
	const unsigned totalTextureLinearSize = mipLevelLinearSize * mipLevels;

	LPDIRECT3DTEXTURE9 foundTex = static_cast<LPDIRECT3DTEXTURE9>(FindMatchingResourceAtAddress(gpuAddress, textureObjectParams) );
	if (foundTex)
	{
		if (IsResourceDirty(gpuAddress, totalTextureLinearSize) )
		{
			MarkDirtyResourceClean(gpuAddress, totalTextureLinearSize);

			UpdateTextureData(foundTex, gpuAddress, width, height, mipLevels, format);
		}
		return foundTex;
	}

	LPDIRECT3DTEXTURE9 newlyCreatedTex = NULL;
	if (FAILED(d3d9dev->CreateTexture(width, height, mipLevels, 0, format, D3DPOOL_DEFAULT, &newlyCreatedTex, NULL) ) )
	{
//#ifdef _DEBUG
		__debugbreak(); // Failed to create a new texture!
//#endif
		return NULL;
	}

	UpdateTextureData(newlyCreatedTex, gpuAddress, width, height, mipLevels, format);

	CreateNewResourceAtAddress(gpuAddress, textureObjectParams, newlyCreatedTex);
	MarkDirtyResourceClean(gpuAddress, totalTextureLinearSize);
	return newlyCreatedTex;
}

LPDIRECT3DQUERY9 LiveResourcesRegistry::GetFindOrCreateQueryAtAddress(const unsigned gpuAddress, const D3DQUERYTYPE queryType)
{
	if (gpuAddress == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate a resource at the NULL address!
#endif
		return NULL;
	}

	AllocObjectParams queryObjectParams;
	queryObjectParams.type = OT_QueryMemory;
	queryObjectParams.objectTypeParams.queryMemory.queryType = queryType;

	LPDIRECT3DQUERY9 foundQuery = static_cast<LPDIRECT3DQUERY9>(FindMatchingResourceAtAddress(gpuAddress, queryObjectParams) );
	if (foundQuery)
		return foundQuery;

	LPDIRECT3DQUERY9 newlyCreatedQuery = NULL;
	if (FAILED(d3d9dev->CreateQuery(queryType, &newlyCreatedQuery) ) )
	{
#ifdef _DEBUG
		__debugbreak(); // Failed to create a new query!
#endif
		return NULL;
	}

	CreateNewResourceAtAddress(gpuAddress, queryObjectParams, newlyCreatedQuery);
	return newlyCreatedQuery;
}

static const char* const GetVertexDeclTypeString(const D3DDECLTYPE type)
{
	switch (type)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Should never be here!
#endif
		return "Unknown";
	case D3DDECLTYPE_FLOAT1:  // 1D float expanded to (value, 0., 0., 1.)
		return "D3DDECLTYPE_FLOAT1";
    case D3DDECLTYPE_FLOAT2:  // 2D float expanded to (value, value, 0., 1.)
		return "D3DDECLTYPE_FLOAT2";
    case D3DDECLTYPE_FLOAT3:  // 3D float expanded to (value, value, value, 1.)
		return "D3DDECLTYPE_FLOAT3";
    case D3DDECLTYPE_FLOAT4:  // 4D float
		return "D3DDECLTYPE_FLOAT4";
	case D3DDECLTYPE_D3DCOLOR:  // 4D packed unsigned bytes mapped to 0. to 1. range
		return "D3DDECLTYPE_D3DCOLOR";
    case D3DDECLTYPE_UBYTE4:  // 4D unsigned byte
		return "D3DDECLTYPE_UBYTE4";
    case D3DDECLTYPE_SHORT2:  // 2D signed short expanded to (value, value, 0., 1.)
		return "D3DDECLTYPE_SHORT2";
    case D3DDECLTYPE_SHORT4:  // 4D signed short
		return "D3DDECLTYPE_SHORT4";
    case D3DDECLTYPE_UBYTE4N:  // Each of 4 bytes is normalized by dividing to 255.0
		return "D3DDECLTYPE_UBYTE4N";
    case D3DDECLTYPE_SHORT2N:  // 2D signed short normalized (v[0]/32767.0,v[1]/32767.0,0,1)
		return "D3DDECLTYPE_SHORT2N";
    case D3DDECLTYPE_SHORT4N:  // 4D signed short normalized (v[0]/32767.0,v[1]/32767.0,v[2]/32767.0,v[3]/32767.0)
		return "D3DDECLTYPE_SHORT4N";
    case D3DDECLTYPE_USHORT2N:  // 2D unsigned short normalized (v[0]/65535.0,v[1]/65535.0,0,1)
		return "D3DDECLTYPE_USHORT2N";
    case D3DDECLTYPE_USHORT4N:  // 4D unsigned short normalized (v[0]/65535.0,v[1]/65535.0,v[2]/65535.0,v[3]/65535.0)
		return "D3DDECLTYPE_USHORT4N";
    case D3DDECLTYPE_UDEC3:  // 3D unsigned 10 10 10 format expanded to (value, value, value, 1)
		return "D3DDECLTYPE_UDEC3";
    case D3DDECLTYPE_DEC3N:  // 3D signed 10 10 10 format normalized and expanded to (v[0]/511.0, v[1]/511.0, v[2]/511.0, 1)
		return "D3DDECLTYPE_DEC3N";
    case D3DDECLTYPE_FLOAT16_2:  // Two 16-bit floating point values, expanded to (value, value, 0, 1)
		return "D3DDECLTYPE_FLOAT16_2";
    case D3DDECLTYPE_FLOAT16_4:  // Four 16-bit floating point values
		return "D3DDECLTYPE_FLOAT16_4";
	case D3DDECLTYPE_UNUSED:  // When the type field in a decl is unused.
		return "D3DDECLTYPE_UNUSED";
	}
}

static const char* const GetVertexDeclUsageString(const D3DDECLUSAGE usage)
{
	switch (usage)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Should never be here!
#endif
		return "Unknown";
	case D3DDECLUSAGE_POSITION:
		return "D3DDECLUSAGE_POSITION";
	case D3DDECLUSAGE_BLENDWEIGHT:   // 1
		return "D3DDECLUSAGE_BLENDWEIGHT";
	case D3DDECLUSAGE_BLENDINDICES:  // 2
		return "D3DDECLUSAGE_BLENDINDICES";
	case D3DDECLUSAGE_NORMAL:        // 3
		return "D3DDECLUSAGE_NORMAL";
	case D3DDECLUSAGE_PSIZE:         // 4
		return "D3DDECLUSAGE_PSIZE";
	case D3DDECLUSAGE_TEXCOORD:      // 5
		return "D3DDECLUSAGE_TEXCOORD";
	case D3DDECLUSAGE_TANGENT:       // 6
		return "D3DDECLUSAGE_TANGENT";
	case D3DDECLUSAGE_BINORMAL:      // 7
		return "D3DDECLUSAGE_BINORMAL";
	case D3DDECLUSAGE_TESSFACTOR:    // 8
		return "D3DDECLUSAGE_TESSFACTOR";
	case D3DDECLUSAGE_POSITIONT:     // 9
		return "D3DDECLUSAGE_POSITIONT";
	case D3DDECLUSAGE_COLOR:         // 10
		return "D3DDECLUSAGE_COLOR";
	case D3DDECLUSAGE_FOG:           // 11
		return "D3DDECLUSAGE_FOG";
	case D3DDECLUSAGE_DEPTH:         // 12
		return "D3DDECLUSAGE_DEPTH";
	case D3DDECLUSAGE_SAMPLE:        // 13
		return "D3DDECLUSAGE_SAMPLE";
	}
}

static const D3DVERTEXELEMENT9 endElement = D3DDECL_END();
LPDIRECT3DVERTEXDECLARATION9 LiveResourcesRegistry::GetFindOrCreateVertexDeclaration(const D3DVERTEXELEMENT9* const pElements)
{
	unsigned numElements = 0;
	for (unsigned elementID = 0; elementID < 24; ++elementID)
	{
		if (memcmp(&(pElements[elementID]), &endElement, sizeof(endElement) ) == 0)
		{
			numElements = elementID;
			break;
		}
	}
	const unsigned numBytes = numElements * sizeof(D3DVERTEXELEMENT9);
	DWORD elementsHash = 0x00000000;
	const BYTE* const byteElements = (const BYTE* const)pElements;
	for (unsigned x = 0; x < numBytes; ++x)
	{
		elementsHash ^= byteElements[x];
		elementsHash = RotateRight32(elementsHash, 5);
	}

	std::map<DWORD, LPDIRECT3DVERTEXDECLARATION9>::const_iterator findIt = allLiveVertexDecls.find(elementsHash);
	if (findIt != allLiveVertexDecls.end() )
		return findIt->second;

	LPDIRECT3DVERTEXDECLARATION9 newVertexDecl = NULL;
	if (FAILED(d3d9dev->CreateVertexDeclaration(pElements, &newVertexDecl) ) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Failed to create a new vertex decl!
#endif
		printf("Error in CreateVertexDeclaration(). Process will likely crash!\n");
		for (unsigned elementIndex = 0; elementIndex < numElements; ++elementIndex)
		{
			printf("Vertex element %u:\n", elementIndex);
			printf("\t{ Stream: %u; Offset: %u bytes; Type: %s; Method: %u; Usage: %s; UsageIndex: %u }\n", 
				pElements[elementIndex].Stream,
				pElements[elementIndex].Offset,
				GetVertexDeclTypeString( (const D3DDECLTYPE)(pElements[elementIndex].Type) ),
				pElements[elementIndex].Method,
				GetVertexDeclUsageString( (const D3DDECLUSAGE)(pElements[elementIndex].Usage) ),
				pElements[elementIndex].UsageIndex);
		}
		printf("\n");
		return NULL;
	}
	allLiveVertexDecls.insert(std::make_pair(elementsHash, newVertexDecl) );
	return newVertexDecl;
}

static void UpdateVertexBufferData(LPDIRECT3DVERTEXBUFFER9 pVB, const unsigned gpuAddress, const unsigned lengthBytes)
{
	BYTE* lockedVB = NULL;
	pVB->Lock(0, 0, (void**)&lockedVB, D3DLOCK_DISCARD);
	memcpy(lockedVB, LocalMemory + gpuAddress, lengthBytes);
	pVB->Unlock();
}

__declspec(noinline)  LPDIRECT3DVERTEXBUFFER9 LiveResourcesRegistry::GetFindOrCreateVertexBufferAtAddress(const unsigned gpuAddress, const unsigned lengthBytes)
{
	if (gpuAddress == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate a resource at the NULL address!
#endif
		return NULL;
	}
	
	if (lengthBytes == 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate a resource with 0 size!
#endif
		return NULL;
	}

	AllocObjectParams vertexBufferObjectParams;
	vertexBufferObjectParams.type = OT_VertexBuffer;
	vertexBufferObjectParams.objectTypeParams.vertexBuffer.byteCount = lengthBytes;

	LPDIRECT3DVERTEXBUFFER9 foundVB = static_cast<LPDIRECT3DVERTEXBUFFER9>(FindMatchingResourceAtAddress(gpuAddress, vertexBufferObjectParams) );
	if (foundVB)
	{
		if (IsResourceDirty(gpuAddress, lengthBytes) )
		{
			MarkDirtyResourceClean(gpuAddress, lengthBytes);
			UpdateVertexBufferData(foundVB, gpuAddress, lengthBytes);
		}
		return foundVB;
	}

	LPDIRECT3DVERTEXBUFFER9 newlyCreatedVB = NULL;
	if (FAILED(d3d9dev->CreateVertexBuffer(lengthBytes, D3DUSAGE_WRITEONLY | D3DUSAGE_DYNAMIC, 0, D3DPOOL_DEFAULT, &newlyCreatedVB, NULL) ) )
	{
#ifdef _DEBUG
		__debugbreak(); // Failed to create a new vertex buffer!
#endif
		return NULL;
	}

	UpdateVertexBufferData(newlyCreatedVB, gpuAddress, lengthBytes);

	CreateNewResourceAtAddress(gpuAddress, vertexBufferObjectParams, newlyCreatedVB);
	MarkDirtyResourceClean(gpuAddress, lengthBytes);
	return newlyCreatedVB;
}

static void UpdateIndexBufferData(LPDIRECT3DINDEXBUFFER9 pIB, const unsigned gpuAddress, const unsigned lengthIndices, const D3DFORMAT format)
{
	const unsigned lengthBytes = lengthIndices * GetSingleElementSizeBytes(format);
	BYTE* lockedIB = NULL;
	pIB->Lock(0, 0, (void**)&lockedIB, D3DLOCK_DISCARD);
	memcpy(lockedIB, LocalMemory + gpuAddress, lengthBytes);
	pIB->Unlock();
}

__declspec(noinline) LPDIRECT3DINDEXBUFFER9 LiveResourcesRegistry::GetFindOrCreateIndexBufferAtAddress(const unsigned gpuAddress, const unsigned lengthIndices, const D3DFORMAT format)
{
	if (gpuAddress == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate a resource at the NULL address!
#endif
		return NULL;
	}
	
	if (lengthIndices == 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate an index buffer with 0 indices!
#endif
		return NULL;
	}

	AllocObjectParams indexBufferObjectParams;
	indexBufferObjectParams.type = OT_IndexBuffer;
	indexBufferObjectParams.objectTypeParams.indexBuffer.indexCount = lengthIndices;
	indexBufferObjectParams.objectTypeParams.indexBuffer.indexFormat = format;

	const unsigned lengthBytes = lengthIndices * GetSingleElementSizeBytes(format);

	LPDIRECT3DINDEXBUFFER9 foundIB = static_cast<LPDIRECT3DINDEXBUFFER9>(FindMatchingResourceAtAddress(gpuAddress, indexBufferObjectParams) );
	if (foundIB)
	{
		if (IsResourceDirty(gpuAddress, lengthBytes) )
		{
			MarkDirtyResourceClean(gpuAddress, lengthBytes);

			UpdateIndexBufferData(foundIB, gpuAddress, lengthIndices, format);
		}
		return foundIB;
	}

	LPDIRECT3DINDEXBUFFER9 newlyCreatedIB = NULL;
	if (FAILED(d3d9dev->CreateIndexBuffer(lengthBytes, D3DUSAGE_WRITEONLY | D3DUSAGE_DYNAMIC, format, D3DPOOL_DEFAULT, &newlyCreatedIB, NULL) ) )
	{
#ifdef _DEBUG
		__debugbreak(); // Failed to create a new index buffer!
#endif
		return NULL;
	}

	UpdateIndexBufferData(newlyCreatedIB, gpuAddress, lengthIndices, format);

	CreateNewResourceAtAddress(gpuAddress, indexBufferObjectParams, newlyCreatedIB);
	MarkDirtyResourceClean(gpuAddress, lengthBytes);
	return newlyCreatedIB;
}

LPDIRECT3DVERTEXSHADER9 LiveResourcesRegistry::GetFindOrCreateVertexShaderAtAddress(const unsigned gpuAddress, const unsigned lengthTokens)
{
	if (gpuAddress == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate a resource at the NULL address!
#endif
		return NULL;
	}
	
	if (lengthTokens == 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot create a vertex shader with 0 tokens
#endif
		return NULL;
	}

	AllocObjectParams vertexShaderObjectParams;
	vertexShaderObjectParams.type = OT_VertexShader;
	vertexShaderObjectParams.objectTypeParams.vertexShaderBytecode.tokensCount = lengthTokens;

	LPDIRECT3DVERTEXSHADER9 foundVS = static_cast<LPDIRECT3DVERTEXSHADER9>(FindMatchingResourceAtAddress(gpuAddress, vertexShaderObjectParams) );
	if (foundVS)
	{
		if (IsResourceDirty(gpuAddress, lengthTokens * sizeof(UINT64) ) )
		{
			MarkDirtyResourceClean(gpuAddress, lengthTokens);

			// We can't really "update" a vertex shader if it has been modified in-place at runtime. D3D9 doesn't support that!
#ifdef _DEBUG
			__debugbreak(); // What the heck is goin' on to cause this?
#endif
		}
		return foundVS;
	}

	LPDIRECT3DVERTEXSHADER9 newlyCreatedVS = NULL;
	const UINT64* const shaderTokenMem = reinterpret_cast<const UINT64* const>(LocalMemory + (gpuAddress & (GPU_DRAM_TOTAL_CAPACITY_BYTES - 1) ) );
	LPD3DXBUFFER shaderBytecode = ReverseCompileShaderToD3D9Bytecode(shaderTokenMem - (GPU_DRAM_TRANSACTION_SIZE_BYTES / sizeof(UINT64) ), shaderTokenMem, lengthTokens);
	if (!shaderBytecode)
	{
#ifdef _DEBUG
		__debugbreak(); // Failed to decompile vertex shader back to HLSL!
#endif
		return NULL;
	}
	else
	{
		LPDIRECT3DVERTEXSHADER9 newLoadedVS = NULL;
		if (FAILED(d3d9dev->CreateVertexShader(static_cast<const DWORD* const>(shaderBytecode->GetBufferPointer() ), &newLoadedVS) ) )
		{
#ifdef _DEBUG
			__debugbreak(); // Failed to create vertex shader!
#endif
			return NULL;
		}

		// Free our compiled shader bytecode so as not to leak any memory:
		shaderBytecode->Release();
		shaderBytecode = NULL;

		CreateNewResourceAtAddress(gpuAddress, vertexShaderObjectParams, newLoadedVS);
		MarkDirtyResourceClean(gpuAddress, lengthTokens);
		return newLoadedVS;
	}
}

// TODO: We should probably also use this same function for tracking when live resources are modified by the driver,
// detect them as being dirty, and update their memory.
void AddMemoryBitmapDWORDWrite(const unsigned gpuAddress)
{
#ifdef _DEBUG
	if (gpuAddress == NULL)
	{
		__debugbreak(); // Error: Driver is writing to NULL address!
	}
	if (gpuAddress % sizeof(DWORD) != 0)
	{
		__debugbreak(); // Error: GPU address is not DWORD-aligned!
	}
	if (gpuAddress >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Error: GPU address is out of range!
	}
#endif
	const unsigned WholeMemoryDWORDIndex = gpuAddress / sizeof(DWORD);
	const unsigned DWORDIndex = WholeMemoryDWORDIndex / 32;
	const unsigned DWORDBitIndex = WholeMemoryDWORDIndex % 32;
#ifdef _DEBUG
	if (DWORDIndex >= ARRAYSIZE(LocalMemoryWriteDWORDsBitmap) )
	{
		__debugbreak(); // Error: Out of bounds write in our bitmap!
	}
#endif
	LocalMemoryWriteDWORDsBitmap[DWORDIndex] |= (1 << DWORDBitIndex);

	const unsigned pageIndex = gpuAddress / GPU_PAGE_SIZE_BYTES;
	const unsigned pageDWORDIndex = pageIndex / 32;
	const unsigned pageDWORDBitIndex = pageIndex % 32;
#ifdef _DEBUG
	if (pageDWORDIndex >= ARRAYSIZE(LocalMemoryPagesDirtyBitmap) )
	{
		__debugbreak(); // Error: Out of bounds write in our dirty pages bitmap!
	}
#endif
	LocalMemoryPagesDirtyBitmap[pageDWORDIndex] |= (1 << pageDWORDBitIndex);
}

static inline const bool IsDWORDWritten(const unsigned dwordIndex)
{
	const unsigned DWORDIndex = dwordIndex / 32;
	const unsigned DWORDBitIndex = dwordIndex % 32;
	return (LocalMemoryWriteDWORDsBitmap[DWORDIndex] & (1 << DWORDBitIndex) ) != 0;
}

const unsigned GetContiguousWriteRegionSizeBytes(const unsigned gpuStartingAddress)
{
#ifdef _DEBUG
	if (gpuStartingAddress == NULL)
	{
		__debugbreak(); // Error: NULL address is not valid!
	}
	if (gpuStartingAddress % sizeof(DWORD) != 0)
	{
		__debugbreak(); // Error: GPU starting address is not DWORD-aligned!
	}
#endif
	unsigned totalWriteRegionSize = 0;
	for (unsigned WholeMemoryDWORDIndex = gpuStartingAddress / sizeof(DWORD); WholeMemoryDWORDIndex < GPU_DRAM_TOTAL_CAPACITY_BYTES / sizeof(DWORD); ++WholeMemoryDWORDIndex)
	{
		if (IsDWORDWritten(WholeMemoryDWORDIndex) )
		{
			totalWriteRegionSize += sizeof(DWORD);
		}
		else
		{
			break;
		}
	}
	return totalWriteRegionSize;
}
