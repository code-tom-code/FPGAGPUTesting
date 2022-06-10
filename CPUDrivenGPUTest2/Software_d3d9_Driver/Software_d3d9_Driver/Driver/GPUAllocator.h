#pragma once

/*
For this current FPGA configuration (Xilinx KCU116), DRAM pages are 2KBytes in size. So for efficiency, try to allocate small objects (small buffers) along 2KByte boundaries.
Larger objects (textures, large buffers) should be allocated at 32KByte boundaries. This is the row size for the device.
Very large objects (render targets, depth buffers) should be allocated on 1MB boundaries. This is the column size for the device.

Chip attributes: 4Gbits per chip (two chips) arranged as 256Mbits x16 each
Row addressing: 15 bits (32 KBytes per row)
Page size: 2KBytes per DRAM page

Row addressing: 15 bits
Column addressing: 10 bits
Bank addressing: 2 bits
Bank group addressing: 1 bits
Rank addressing: 1 bits
*/

const constexpr unsigned GPU_DRAM_TOTAL_CAPACITY_BYTES = 1024u * 1024u * 1024u; // Total DRAM capacity is currently 1GByte
const constexpr unsigned GPU_DRAM_TRANSACTION_SIZE_BITS = 256u; // DRAM memory is read & written in 256-bit transactions
const constexpr unsigned GPU_DRAM_TRANSACTION_SIZE_BYTES = GPU_DRAM_TRANSACTION_SIZE_BITS / 8u;
const constexpr unsigned GPU_PAGE_SIZE_BYTES = 2u * 1024u; // DRAM pages are 2K in size. For maximum efficiency, perform consecutive reads/writes within the same single DRAM page.
const constexpr unsigned GPU_PAGE_SIZE_BITS = GPU_PAGE_SIZE_BYTES * 8u;
const constexpr unsigned GPU_ROW_SIZE_BYTES = 32u * 1024u;
const constexpr unsigned GPU_ROW_SIZE_BITS = GPU_ROW_SIZE_BYTES * 8u;
const constexpr unsigned GPU_COL_SIZE_BYTES = 1024u * 1024u;
const constexpr unsigned GPU_COL_SIZE_BITS = GPU_COL_SIZE_BYTES * 8u;
const constexpr unsigned GPU_NUM_PAGES_PER_COLUMN = GPU_COL_SIZE_BYTES / GPU_PAGE_SIZE_BYTES;

enum allocationUsage : unsigned char
{
	GPUVAT_Unknown = 0u,

	GPUVAT_CommandBuffer,
	GPUVAT_VertexStreamData,
	GPUVAT_IndexData,
	GPUVAT_Texture,
	GPUVAT_RenderTarget,
	GPUVAT_DepthStencil,
	GPUVAT_QueryMemory,
	GPUVAT_ConstantBufferData,
	GPUVAT_ShaderInstructionsMemory,
	GPUVAT_StatsMemory,

	GPUVAT_MAX_NUM_ALLOCATION_USAGES // This must always be last!
};

enum gpuFormat : unsigned char
{
	GPUFMT_Unknown = 0u,

	GPUFMT_CommandBufferPacketData,
	GPUFMT_StartValidCommandBufferFormats = GPUFMT_CommandBufferPacketData,
	GPUFMT_EndValidCommandBufferFormats = GPUFMT_CommandBufferPacketData,

	GPUFMT_VertexGeneral, // Generalized vertex data (could be any underlying type)
	GPUFMT_VertexPosT_UINT16,
	GPUFMT_VertexInvPosT_UNORM24, // Special format, only used for transformed (UNORM 24-bit) inverse-Z position
	GPUFMT_VertexTexcoord_UNORM16,
	GPUFMT_VertexColor_R8G8B8A8_UNORM8,
	GPUFMT_StartValidVertexFormats = GPUFMT_VertexGeneral,
	GPUFMT_EndValidVertexFormats = GPUFMT_VertexColor_R8G8B8A8_UNORM8,

	GPUFMT_Index_UINT8, // Not yet implemented
	GPUFMT_Index_UINT16,
	GPUFMT_Index_UINT32, // Not yet implemented
	GPUFMT_StartValidIndexFormats = GPUFMT_Index_UINT8,
	GPUFMT_EndValidIndexFormats = GPUFMT_Index_UINT32,

	GPUFMT_TexR8G8B8A8,
	GPUFMT_TexR8G8B8X8,
	GPUFMT_TexR4G4B4A4,
	GPUFMT_TexR5G6B5,
	GPUFMT_TexR3G3B2, // Not yet implemented
	GPUFMT_StartValidUncompressedTexFormats = GPUFMT_TexR8G8B8A8,
	GPUFMT_EndValidUncompressedTexFormats = GPUFMT_TexR3G3B2,

	GPUFMT_TexDXT1, // Not yet implemented
	GPUFMT_TexDXT3, // Not yet implemented
	GPUFMT_TexDXT5, // Not yet implemented
	GPUFMT_StartValidCompressedTexFormats = GPUFMT_TexDXT1,
	GPUFMT_EndValidCompressedTexFormats = GPUFMT_TexDXT5,

	GPUFMT_TexD16, // Not yet implemented
	GPUFMT_TexD24, // Not yet implemented
	GPUFMT_TexD24S8, // Not yet implemented
	GPUFMT_StartValidDepthStencilFormats = GPUFMT_TexD16,
	GPUFMT_EndValidDepthStencilFormats = GPUFMT_TexD24S8,

	GPUFMT_QueryData, // Not yet implemented
	GPUFMT_StartValidQueryFormats = GPUFMT_QueryData,
	GPUFMT_EndValidQueryFormats = GPUFMT_QueryData,

	GPUFMT_ConstFBufferData,
	GPUFMT_ConstIBufferData, // Not yet implemented
	GPUFMT_ConstBBufferData, // Not yet implemented
	GPUFMT_StartValidConstBufferFormats = GPUFMT_ConstFBufferData,
	GPUFMT_EndValidConstBufferFormats = GPUFMT_ConstBBufferData,

	GPUFMT_VertexShaderInstructions,
	GPUFMT_PixelShaderInstructions, // Not yet implemented
	GPUFMT_StartValidShaderInstructionsFormats = GPUFMT_VertexShaderInstructions,
	GPUFMT_EndValidShaderInstructionsFormats = GPUFMT_PixelShaderInstructions,
	
	GPUFMT_StatsBuffer,
	GPUFMT_StartValidStatsFormats = GPUFMT_StatsBuffer,
	GPUFMT_EndValidStatsFormats = GPUFMT_StatsBuffer,

	GPUFMT_MAX_NUM_FORMATS // This must always be last
};

enum _D3DFORMAT;
typedef _D3DFORMAT D3DFORMAT;

// Returns a gpuFormat from a D3D format
const gpuFormat ConvertD3DFormatToDeviceFormat(const D3DFORMAT fmt);

typedef void gpuvoid;

// Must be called once at startup!
void GPUInitializeAllocator();

// Returns NULL if allocation fails (due to out of GPU memory, out of GPU address space, etc.)
gpuvoid* GPUAlloc(const unsigned allocationSizeBytes, const allocationUsage usage, const gpuFormat format
#ifdef _DEBUG
	, const char* const debugAllocationString
#endif
);

// Returns the base address of the allocation the range is contained in, or NULL otherwise. The range may not straddle multiple adjacent allocations.
const gpuvoid* const ValidateMemoryRangeExistsInsideAllocation(const gpuvoid* const rangeBegin, const unsigned rangeLengthBytes);

// Frees an existing allocation
void GPUFree(gpuvoid* gpuAlloc);

// Returns how much usable free memory is available, in bytes
const unsigned GPUGetUsableFreeMemory();

// Returns NULL if allocation fails (due to out of GPU memory, cannot fit allocation at the requested address, out of GPU address space, etc.)
gpuvoid* GPUAllocAtAddress(gpuvoid* const placementAddress, const unsigned allocationSizeBytes, const allocationUsage usage, const gpuFormat format
#ifdef _DEBUG
	, const char* const debugAllocationString
#endif
);
