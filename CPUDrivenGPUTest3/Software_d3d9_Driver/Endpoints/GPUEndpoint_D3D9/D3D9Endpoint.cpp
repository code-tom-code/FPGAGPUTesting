#include "d3d9include.h"

#include "D3D9Endpoint.h"

#include "..\\..\\Software_d3d9_Driver\\Driver\\GPUAllocator.h"
#include "..\\..\\Software_d3d9_Driver\\Driver\\GPUCommandList.h"
#include "ConversionHelpers_GPU_To_D3D9.h"
#include "LiveResourcesRegistry.h"

#ifdef _DEBUG
	#pragma comment (lib, "d3d9.lib")
	#pragma comment (lib, "d3dx9d.lib")
#else
	#pragma comment (lib, "d3d9.lib")
	#pragma comment (lib, "d3dx9.lib")
#endif

static LPDIRECT3D9EX d3d9ex = NULL;
LPDIRECT3DDEVICE9EX d3d9dev = NULL;
static HWND renderWindow_g = NULL;
static LPDIRECT3DSURFACE9 originalBackbuffer = NULL;
static LPDIRECT3DQUERY9 mainEventQuery = NULL;
static bool begunSceneState = false;
static bool needToRebindVertexShader = false;
static unsigned short currentShaderInstructionStartAddress = 0;
static bool hasModifiedVertexDecl = true;
static D3DVERTEXELEMENT9 buildingVertexDecl[24] = {D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END(),D3DDECL_END()};
static unsigned currentTextureWidthLog2 = 0;
static unsigned currentTextureHeightLog2 = 0;
static double ldFreq = 0.0;

struct streamSourceStruct
{
	LPDIRECT3DVERTEXBUFFER9 vertBuffer;
	UINT streamOffset;
	UINT streamStride;
};

struct samplerStateStruct
{
	DWORD samplerStateValues[D3DSAMP_DMAPOFFSET + 1];
};

struct textureStageStateStruct
{
	DWORD textureStageStateValues[D3DTSS_CONSTANT + 1];
};

static DWORD currentCachedRenderStates[256] = {0};
static LPDIRECT3DINDEXBUFFER9 currentCachedIndexBuffer = NULL;
static LPDIRECT3DTEXTURE9 currentTextures[16] = { NULL };
static LPDIRECT3DVERTEXSHADER9 currentVertexShader = NULL;
static D3DVIEWPORT9 currentViewport = {0};
static RECT currentScissorRect = {0};
static D3DXVECTOR4 currentVSConstantsF[256] = {};
static LPDIRECT3DVERTEXDECLARATION9 currentVertexDecl = NULL;
static samplerStateStruct currentSamplerStates[16] = {0};
static textureStageStateStruct currentTextureStageStates[16] = {0};
static streamSourceStruct currentStreamSources[16] = {0};

// This large 1GB region of memory is used as a mirror for the GPU's VRAM:
__declspec(align(128) ) BYTE LocalMemory[GPU_DRAM_TOTAL_CAPACITY_BYTES] = {0};

// This large bitmap keeps track of which DWORDs have been written to from the driver (via the "write DWORD" packets):
__declspec(align(128) ) DWORD LocalMemoryWriteDWORDsBitmap[GPU_DRAM_TOTAL_CAPACITY_BYTES / (sizeof(DWORD) * 32)] = {0};

// This bitmap tracks which whole GPU memory pages are dirty (1 bit set) and which pages are unmodified (0 bit set):
__declspec(align(128) ) DWORD LocalMemoryPagesDirtyBitmap[GPU_DRAM_TOTAL_CAPACITY_BYTES / GPU_PAGE_SIZE_BYTES / (sizeof(DWORD) * 8)] = {0};

// This array tracks what vertex shader programs are assigned to which slots in shader instruction-memory:
static __declspec(align(128) ) LPDIRECT3DVERTEXSHADER9 ShaderInstructionMemory[512] = {NULL};

static __declspec(align(128) ) BYTE* currentBatchWritePtr = LocalMemory;
static __declspec(align(128) ) DWORD currentBatchWriteData[8] = {0};

static LiveResourcesRegistry resourcesRegistry;

static void HandlePacket(const doNothingCommand* const typedPacket)
{
	UNREFERENCED_PARAMETER(typedPacket); // Do nothing with this. This is our no-op packet!
}

// TODO: For all of these reads and writes and clears, make sure that the range (start address plus resource size) does not extend outside of or wrap around the VRAM space!
// TODO: Add validation that all of the "unused" and "padding" bits are always set to all 0's
static void HandlePacket(const writeMemCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->writeDWORDAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot write outside of VRAM!
	}
	if (typedPacket->writeDWORDAddr % sizeof(DWORD) != 0)
	{
		__debugbreak(); // Write address must be DWORD-aligned!
	}
#endif
	DWORD* const dwordMem = reinterpret_cast<DWORD* const>(LocalMemory + (typedPacket->writeDWORDAddr & (GPU_DRAM_TOTAL_CAPACITY_BYTES - 1) ) );
	*dwordMem = typedPacket->writeVal;

	// Track our write in the DWORD writes bitmap:
	AddMemoryBitmapDWORDWrite(typedPacket->writeDWORDAddr);
}

static void HandlePacket(const readMemCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->readDWORDAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot read outside of VRAM!
	}
	if (typedPacket->readDWORDAddr % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
		__debugbreak(); // Read address must be DRAM-line aligned!
	}
#endif
	const unsigned readAddress = typedPacket->readDWORDAddr + typedPacket->dwordSelect * sizeof(DWORD);
	const DWORD* const dwordMem = reinterpret_cast<const DWORD* const>(LocalMemory + (readAddress & (GPU_DRAM_TOTAL_CAPACITY_BYTES - 1) ) );

	// Send back a return packet containing the read memory:
	readMemResponse readResponse;
	readResponse.readDWORDAddr = typedPacket->readDWORDAddr;
	readResponse.value = *dwordMem;
	readResponse.checksum = 0;
	readResponse.checksum = command::ComputeChecksum(&readResponse, sizeof(readResponse) );
	(*E2HReturnMessageCallback)(reinterpret_cast<const genericCommand* const>(&readResponse) );
}

static void SetCachedStreamSource(const UINT streamIndex, LPDIRECT3DVERTEXBUFFER9 vertexBuffer, const UINT streamOffset, const UINT streamStride)
{
	if (streamIndex > ARRAYSIZE(currentStreamSources) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Out of range stream index!
#endif
		return;
	}

	streamSourceStruct compareStruct;
	compareStruct.vertBuffer = vertexBuffer;
	compareStruct.streamOffset = streamOffset;
	compareStruct.streamStride = streamStride;
	if (memcmp(&compareStruct, &currentStreamSources[streamIndex], sizeof(streamSourceStruct) ) != 0)
	{
		d3d9dev->SetStreamSource(streamIndex, vertexBuffer, streamOffset, streamStride);
		memcpy(&currentStreamSources[streamIndex], &compareStruct, sizeof(streamSourceStruct) );
	}
}

static void SetCachedRenderState(const D3DRENDERSTATETYPE renderState, const DWORD value)
{
	if (renderState >= ARRAYSIZE(currentCachedRenderStates) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Invalid render state set!
#endif
		return;
	}

	if (currentCachedRenderStates[renderState] == value)
	{
		return; // We already have this value cached. Don't set it again!
	}

	d3d9dev->SetRenderState(renderState, value);
	currentCachedRenderStates[renderState] = value;
}

static void CachedSetTextureStageState(const DWORD samplerIndex, const D3DTEXTURESTAGESTATETYPE stageType, const DWORD value)
{
	if (samplerIndex >= ARRAYSIZE(currentTextureStageStates) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Out of bounds sampler index!
#endif
		return;
	}

	if (stageType < D3DTSS_COLOROP || stageType > D3DTSS_CONSTANT)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Out of bounds stage type!
#endif
		return;
	}

	if (currentTextureStageStates[samplerIndex].textureStageStateValues[stageType] == value)
	{
		return;
	}
	else
	{
		d3d9dev->SetTextureStageState(samplerIndex, stageType, value);
		currentTextureStageStates[samplerIndex].textureStageStateValues[stageType] = value;
	}
}

static void HandlePacket(const readMemResponse* const typedPacket)
{
#ifdef _DEBUG
	__debugbreak(); // We should never be receiving this packet, we should only ever be sending this packet. This is a D2H packet.
#endif
	// Do nothing!
}

static void HandlePacket(const clearMemCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->writeDWORDAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot write outside of VRAM!
	}
	if (typedPacket->writeDWORDAddr % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
		__debugbreak(); // Starting write address must be DRAM-line aligned!
	}
	if (typedPacket->clearNumDRAMLines == 0)
	{
		__debugbreak(); // Why did you call this packet if you didn't want it to do anything?
	}
#endif
	D3DCOLOR writeColor = 0x00000000;
	switch (typedPacket->clearValue)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Error: Enum is out of range!
	}
#endif
	case clearMemCommand::EC_TRANSPARENTBLACK:
		writeColor = D3DCOLOR_ARGB(0, 0, 0, 0);
		break;
	case clearMemCommand::EC_OPAQUEWHITE:
		writeColor = D3DCOLOR_ARGB(255, 255, 255, 255);
		break;
	case clearMemCommand::EC_OPAQUEBLACK:
		writeColor = D3DCOLOR_ARGB(255, 0, 0, 0);
		break;
	case clearMemCommand::EC_TRANSPARENTWHITE:
		writeColor = D3DCOLOR_ARGB(0, 255, 255, 255);
		break;
	}

	D3DCOLOR* colorMem = reinterpret_cast<D3DCOLOR* const>(LocalMemory + (typedPacket->writeDWORDAddr & (GPU_DRAM_TOTAL_CAPACITY_BYTES - 1) ) );
	for (unsigned dramRowID = 0; dramRowID < typedPacket->clearNumDRAMLines; ++dramRowID)
	{
		for (unsigned pixelID = 0; pixelID < (GPU_DRAM_TRANSACTION_SIZE_BYTES / sizeof(D3DCOLOR) ); ++pixelID)
		{
			colorMem[pixelID] = writeColor;
		}

		// Advance our write pointer by another DRAM line:
		colorMem += (GPU_DRAM_TRANSACTION_SIZE_BYTES / sizeof(D3DCOLOR) );
	}
}

// Swizzles from RGBA -> BGRA keeping everything as a DWORD (not converting to float and then converting back)
inline const D3DCOLOR D3DColorToRGBAColor(const DWORD inColorBGRA)
{
	const unsigned char r = (const unsigned char)(inColorBGRA & 0xFF);
	const unsigned char g = (const unsigned char)( (inColorBGRA >> 8) & 0xFF);
	const unsigned char b = (const unsigned char)( (inColorBGRA >> 16) & 0xFF);
	const unsigned char a = (const unsigned char)( (inColorBGRA >> 24) & 0xFF);

	return D3DCOLOR_ARGB(a, r, g, b);
}

static void HandlePacket(const clearBackbufferCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->renderTargetAddress >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot write outside of VRAM!
	}
	if (typedPacket->renderTargetAddress % GPU_COL_SIZE_BYTES != 0)
	{
		__debugbreak(); // Render target address must be DRAM-page aligned!
	}
#endif
	const DWORD writeColorBGRA = typedPacket->writeColorRGBA;
	const D3DCOLOR writeColor = D3DColorToRGBAColor(typedPacket->writeColorRGBA); // Swizzle BGRA -> RGBA
	D3DCOLOR* const colorMem = reinterpret_cast<D3DCOLOR* const>(LocalMemory + (typedPacket->renderTargetAddress & (GPU_DRAM_TOTAL_CAPACITY_BYTES - 1) ) );
	const unsigned renderTargetWidth = 640u;
	const unsigned renderTargetHeight = 480u;
	const unsigned renderTargetResolution = renderTargetWidth * renderTargetHeight;
	for (unsigned pixelID = 0; pixelID < renderTargetResolution; ++pixelID)
	{
		colorMem[pixelID] = writeColorBGRA;
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET, writeColor, 0.0f, 0x00);
}

static void HandlePacket(const clearZStencilCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->clearType > clearZStencilCommand::EZS_Both)
	{
		__debugbreak(); // Unknown flag!
	}
	if (typedPacket->clearType == 0)
	{
		__debugbreak(); // Why did you call this if you didn't want anything to get cleared?
	}
#endif
	DWORD d3dclear = 0x00000000;
	if (typedPacket->clearType & clearZStencilCommand::EZS_ZClear)
		d3dclear |= D3DCLEAR_ZBUFFER;
	if (typedPacket->clearType & clearZStencilCommand::EZS_StencilClear)
		d3dclear |= D3DCLEAR_STENCIL;
	float clearDepth = *reinterpret_cast<const float* const>(&typedPacket->writeZValue);
	if ( (*(const DWORD* const)&clearDepth) == 0x3F7FFFFF)
		clearDepth = 1.0f; // The driver meant to use 1.0f here, but it's not allowed to send exactly 1.0f to the FPGA GPU

	d3d9dev->Clear(0, NULL, d3dclear, 0x00000000, clearDepth, (const UINT)(typedPacket->writeStencilValue) );
}

static void HandlePacket(const loadTexCacheDataCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->sourceRAMAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot load a texture from outside of VRAM!
	}
	if (typedPacket->sourceRAMAddr % GPU_ROW_SIZE_BYTES != 0)
	{
		__debugbreak(); // Texture base address must be DRAM-row aligned!
	}
#endif

	const unsigned texelByteSize = GetSizePerPixel(typedPacket->loadSourceFormat);
	if (typedPacket->loadTexelCount == 0) // A texel count of 0 is valid! That means we're setting a null texture!
	{
		if (currentTextures[0] != NULL)
		{
			d3d9dev->SetTexture(0, NULL);
			currentTextures[0] = NULL;
		}
	}
	else
	{
		const unsigned texWidth = 1 << currentTextureWidthLog2;
		const unsigned texHeight = 1 << currentTextureHeightLog2;

		// If a texture already exists at this address and it matches our resolution, then that's great! Set it!
		// If a texture already exists and doesn't match, then destroy+delete the old texture and create a new texture with the updated resolution in its place!
		// If a texture doesn't exist at this address already, then create a new one
		LPDIRECT3DTEXTURE9 setNewTexture = resourcesRegistry.GetFindOrCreateTextureAtAddress(typedPacket->sourceRAMAddr, texWidth, texHeight, 1, ConvertFormat(typedPacket->loadSourceFormat) );
		if (currentTextures[0] != setNewTexture)
		{
			d3d9dev->SetTexture(0, setNewTexture);
			currentTextures[0] = setNewTexture;
		}
	}
}

static void HandlePacket(const setAlphaTestAndRTAddressStateCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->renderTargetBaseAddress > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot set a render target that is outside of VRAM!
	}
	if (typedPacket->unused0 != 0)
	{
		__debugbreak(); // Error: Invalid render target address unused bits
	}
	if (typedPacket->writeMask > wm_writeAll)
	{
		__debugbreak(); // Error: Out of range write mask!
	}
	// Note that write mask of 0 is valid in cases when we only want to write to the depth buffer and skip all writes to the color buffer!
#endif
	DWORD colorWriteEnableMask = 0x0;
	if (typedPacket->writeMask & wm_writeR)
		colorWriteEnableMask |= D3DCOLORWRITEENABLE_RED;
	if (typedPacket->writeMask & wm_writeG)
		colorWriteEnableMask |= D3DCOLORWRITEENABLE_GREEN;
	if (typedPacket->writeMask & wm_writeB)
		colorWriteEnableMask |= D3DCOLORWRITEENABLE_BLUE;
	if (typedPacket->writeMask & wm_writeA)
		colorWriteEnableMask |= D3DCOLORWRITEENABLE_ALPHA;
	SetCachedRenderState(D3DRS_COLORWRITEENABLE, colorWriteEnableMask);

	SetCachedRenderState(D3DRS_ALPHATESTENABLE, typedPacket->alphaTestEnabled ? TRUE : FALSE);
	SetCachedRenderState(D3DRS_ALPHAREF, typedPacket->alphaTestRefValue);
	SetCachedRenderState(D3DRS_ALPHAFUNC, ConvertCmpFunc(typedPacket->alphaTestFunc) );

	// TODO: Look up the address of the render target it's trying to set:
	//LPDIRECT3DSURFACE9 newSetBackbuffer = NULL;
	//d3d9dev->SetRenderTarget(0, newSetBackbuffer);
}

static void CachedSetSamplerState(const DWORD samplerIndex, const D3DSAMPLERSTATETYPE samplerStateType, const DWORD value)
{
	if (samplerStateType < D3DSAMP_ADDRESSU || samplerStateType > D3DSAMP_DMAPOFFSET)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Invalid sampler state type!
#endif
		return;
	}

	if (samplerIndex >= ARRAYSIZE(currentSamplerStates) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Out of bounds sampler index!
#endif
		return;
	}

	if (currentSamplerStates[samplerIndex].samplerStateValues[samplerStateType] == value)
	{
		return;
	}

	d3d9dev->SetSamplerState(samplerIndex, samplerStateType, value);
	currentSamplerStates[samplerIndex].samplerStateValues[samplerStateType] = value;
}

static void HandlePacket(const setTextureStateCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->unused0 != 0)
	{
		__debugbreak(); // Error: Extra unused texture width bits out of range
	}
	if (typedPacket->unused1 != 0)
	{
		__debugbreak(); // Error: Extra unused texture height bits out of range
	}
#endif

	currentTextureWidthLog2 = typedPacket->texWidthLog2;
	currentTextureHeightLog2 = typedPacket->texHeightLog2;

	const D3DTEXTUREFILTERTYPE minMagFilter = ConvertTexFilterMinMag(typedPacket->filterMode);
	const D3DTEXTUREFILTERTYPE mipFilter = ConvertTexFilterMip(typedPacket->filterMode);
	CachedSetSamplerState(0, D3DSAMP_MINFILTER, minMagFilter);
	CachedSetSamplerState(0, D3DSAMP_MAGFILTER, minMagFilter);
	CachedSetSamplerState(0, D3DSAMP_MIPFILTER, mipFilter);

	const D3DTEXTUREADDRESS uAddressMode = ConvertTexAddress(typedPacket->addressU);
	const D3DTEXTUREADDRESS vAddressMode = ConvertTexAddress(typedPacket->addressV);
	CachedSetSamplerState(0, D3DSAMP_ADDRESSU, uAddressMode);
	CachedSetSamplerState(0, D3DSAMP_ADDRESSV, vAddressMode);

	switch (typedPacket->cbModeColor)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case cbm_textureModulateVertexColor:
		CachedSetTextureStageState(0, D3DTSS_COLOROP, D3DTOP_MODULATE);
		CachedSetTextureStageState(0, D3DTSS_COLORARG1, D3DTA_TEXTURE);
		CachedSetTextureStageState(0, D3DTSS_COLORARG2, D3DTA_DIFFUSE);
		break;
	case cbm_allBlack:
		CachedSetTextureStageState(0, D3DTSS_COLOROP, D3DTOP_SELECTARG1);
		CachedSetTextureStageState(0, D3DTSS_COLORARG1, D3DTA_TEMP); // The default value for the TEMP register is float4(0.0f, 0.0f, 0.0f, 0.0f)
		break;
	case cbm_allWhite:
		CachedSetTextureStageState(0, D3DTSS_COLOROP, D3DTOP_SELECTARG1);
		CachedSetTextureStageState(0, D3DTSS_COLORARG1, D3DTA_COMPLEMENT | D3DTA_TEMP); // The default value for the TEMP register is float4(0.0f, 0.0f, 0.0f, 0.0f)
		break;
	case cbm_textureOnly:
		CachedSetTextureStageState(0, D3DTSS_COLOROP, D3DTOP_SELECTARG1);
		CachedSetTextureStageState(0, D3DTSS_COLORARG1, D3DTA_TEXTURE);
		break;
	case cbm_vertexColorOnly:
		CachedSetTextureStageState(0, D3DTSS_COLOROP, D3DTOP_SELECTARG1);
		CachedSetTextureStageState(0, D3DTSS_COLORARG1, D3DTA_DIFFUSE);
		break;
	}

	switch (typedPacket->cbModeAlpha)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case cbm_textureModulateVertexColor:
		CachedSetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_MODULATE);
		CachedSetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
		CachedSetTextureStageState(0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE);
		break;
	case cbm_allBlack:
		CachedSetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1);
		CachedSetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEMP); // The default value for the TEMP register is float4(0.0f, 0.0f, 0.0f, 0.0f)
		break;
	case cbm_allWhite:
		CachedSetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1);
		CachedSetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_COMPLEMENT | D3DTA_TEMP); // The default value for the TEMP register is float4(0.0f, 0.0f, 0.0f, 0.0f)
		break;
	case cbm_textureOnly:
		CachedSetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1);
		CachedSetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
		break;
	case cbm_vertexColorOnly:
		CachedSetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1);
		CachedSetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_DIFFUSE);
		break;
	}
}

static void HandlePacket(const waitForDeviceIdleCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->waitBitmask > waitForDeviceIdleCommand::waitForFullPipelineFlushAndVSync)
	{
		__debugbreak(); // Error: Out of range enum!
	}
	if (typedPacket->unused0 != 0)
	{
		__debugbreak(); // Error: Non-zero unused bits!
	}
#endif

	mainEventQuery->Issue(D3DISSUE_END);
	BOOL endQuery = FALSE;
	while (mainEventQuery->GetData(&endQuery, sizeof(endQuery), D3DGETDATA_FLUSH) == S_FALSE)
	{
		YieldProcessor(); // Do a hot spin-loop to wait for the GPU to be done working
	};

	if (typedPacket->returnCPUValue)
	{
		// Return the value to the Host so that it knows we're done processing:
		waitResponse response;
		response.value = typedPacket->returnValueToCPU;
		response.checksum = 0;
		response.checksum = command::ComputeChecksum(&response, sizeof(response) );
		(*E2HReturnMessageCallback)(reinterpret_cast<const genericCommand* const>(&response) );
	}
}

static void HandlePacket(const waitResponse* const typedPacket)
{
#ifdef _DEBUG
	__debugbreak(); // We should never be receiving this packet, we should only ever be sending this packet. This is a D2H packet.
#endif
	// Do nothing!
}

static const unsigned GetNumVertsFromPrimCount(const D3DPRIMITIVETYPE primTopology, const unsigned primCount)
{
	switch (primTopology)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Should never be here! Invalid primitive topology!
	}
#endif
	case D3DPT_TRIANGLELIST:
		return primCount * 3;
	case D3DPT_POINTLIST:
		return primCount;
	case D3DPT_LINELIST:
		return primCount * 2;
	case D3DPT_LINESTRIP:
		return primCount + 1;
	case D3DPT_TRIANGLESTRIP:
	case D3DPT_TRIANGLEFAN:
		return primCount + 2;
	}
}

static void HandlePacket(const setShaderStartAddressCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->unused0 != 0)
	{
		__debugbreak(); // Error: Extra bits of address are not zeroed!
	}
#endif

	currentShaderInstructionStartAddress = typedPacket->shaderStartAddress;
	needToRebindVertexShader = true;
}

static void HandlePacket(const drawIndexedCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->numPrimitivesToDraw == 0)
	{
		__debugbreak(); // Why did you call this if you didn't want to draw anything?
	}
#endif

	const D3DPRIMITIVETYPE primTopology = ConvertPrimTopology(static_cast<const ePrimTopology>(typedPacket->primTopology) );

	if (hasModifiedVertexDecl)
	{
		LPDIRECT3DVERTEXDECLARATION9 vertDecl = resourcesRegistry.GetFindOrCreateVertexDeclaration(buildingVertexDecl);
		if (currentVertexDecl != vertDecl)
		{
			d3d9dev->SetVertexDeclaration(vertDecl);
			currentVertexDecl = vertDecl;
		}
		hasModifiedVertexDecl = false;
	}

	if (needToRebindVertexShader)
	{
		// Look up and find our new VS in terms of the VS instruction-RAM:
		LPDIRECT3DVERTEXSHADER9 setNewVS = NULL;
		setNewVS = ShaderInstructionMemory[currentShaderInstructionStartAddress];
		if (currentVertexShader != setNewVS)
		{
			d3d9dev->SetVertexShader(setNewVS);
			currentVertexShader = setNewVS;
		}
		needToRebindVertexShader = false;
	}

	if (typedPacket->isIndexedDrawCall)
	{
		const UINT startIndex = (typedPacket->startIndexHigh << 13) | typedPacket->startIndexLow;
		const unsigned numVertices = GetNumVertsFromPrimCount(primTopology, typedPacket->numPrimitivesToDraw);
		d3d9dev->DrawIndexedPrimitive(primTopology, typedPacket->BaseVertexIndex, 0, numVertices, startIndex, typedPacket->numPrimitivesToDraw);
	}
	else
	{
		const UINT vertexOffset = (typedPacket->startIndexHigh << 13) | typedPacket->startIndexLow;
		d3d9dev->DrawPrimitive(primTopology, vertexOffset, typedPacket->numPrimitivesToDraw);
	}
}

static void HandlePacket(const setScanoutPointerCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->bufferAddress > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot set a scanout source that is outside of VRAM!
	}
#endif
	// TODO: Implement this!
	// We can replicate the scanout on/off with a post-render copy (or just a black screen clear), and we can
	// replicate the scanout R/G/B swizzling with a custom pixel shader.
}

static void HandlePacket(const setIAStateCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->IBBaseAddr > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot set an index buffer that is outside of VRAM!
	}
	if (typedPacket->unused2 != 0)
	{
		__debugbreak(); // Error: Extra bits for index buffer address found to be non-zero!
	}
#endif

	const D3DCULL cullMode = ConvertCullMode(typedPacket->cull);
	SetCachedRenderState(D3DRS_CULLMODE, cullMode);

	// Implement this by looking up the index buffer address and format, and then setting it:
	if (typedPacket->indexFmt == ibfmt_noIndices)
	{
		if (currentCachedIndexBuffer != NULL)
		{
			currentCachedIndexBuffer = NULL;
			d3d9dev->SetIndices(NULL);
		}
	}
	else
	{
		LPDIRECT3DINDEXBUFFER9 setNewIB = NULL;
		const unsigned estimatedIndexBufferSizeBytes = GetContiguousWriteRegionSizeBytes(typedPacket->IBBaseAddr);
		unsigned estimatedIndexCount = 0;
		switch (typedPacket->indexFmt)
		{
		default:
		case ibfmt_noIndices:
#ifdef _DEBUG
			__debugbreak(); // Should never be here!
#endif
			estimatedIndexCount = 0;
			break;
		case ibfmt_index8:
			estimatedIndexCount = estimatedIndexBufferSizeBytes;
			break;
		case ibfmt_index16:
			estimatedIndexCount = estimatedIndexBufferSizeBytes / sizeof(USHORT);
			break;
		case ibfmt_index32:
			estimatedIndexCount = estimatedIndexBufferSizeBytes / sizeof(DWORD);
			break;
		}
		setNewIB = resourcesRegistry.GetFindOrCreateIndexBufferAtAddress(typedPacket->IBBaseAddr, estimatedIndexCount, ConvertFormat(typedPacket->indexFmt) );

		if (currentCachedIndexBuffer != setNewIB)
		{
			d3d9dev->SetIndices(setNewIB);
			currentCachedIndexBuffer = setNewIB;
		}
	}
}

static void HandlePacket(const flushROPCacheCommand* const typedPacket)
{
	// Do nothing when this is received!
	// The real D3D9 hardware already handles flushing the ROP write cache for us automatically.
}

static void HandlePacket(const endFrameStatsResponse* const typedPacket)
{
#ifdef _DEBUG
	__debugbreak(); // We should never be receiving this packet, this packet never actually gets sent!
#endif
	// Do nothing!
}

static void HandlePacket(const endFrameCommand* const typedPacket)
{
	if (begunSceneState)
		d3d9dev->EndScene();
	HRESULT hrPresent = d3d9dev->Present(NULL, NULL, NULL, NULL);
	if (FAILED(hrPresent) )
	{
		__debugbreak();
		printf("%u", hrPresent);
	}

	static LARGE_INTEGER lastPresentTime = {0};

	LARGE_INTEGER currentTime = {0};
	QueryPerformanceCounter(&currentTime);

	unsigned __int64 deltaTime = currentTime.QuadPart - lastPresentTime.QuadPart;
	const double deltaSeconds = deltaTime / ldFreq;
	const double deltaMilliseconds = deltaSeconds * 1000.0;

	static unsigned frameCount = 0;

	char buffer[256] = {0};
	sprintf_s(buffer, "GPURenderer_D3D9 - Frame %u - %3.3f FPS (%4.3fms)", frameCount, 1.0 / deltaSeconds, deltaMilliseconds);
	SetWindowTextA(renderWindow_g, buffer);

	++frameCount;

	lastPresentTime = currentTime;

	PumpWindowsMessageLoop(renderWindow_g);

	d3d9dev->BeginScene();
	begunSceneState = true;
}

/*static*/ void GPUCommandList::ConvertSimplifiedCommandPacketToCommandPacket(const SimplifiedCommandPacket* const inSimplifiedPacket, command* const outFullPacket)
{
	#ifdef _DEBUG
	if (!inSimplifiedPacket)
	{
		__debugbreak();
	}

	if (!outFullPacket)
	{
		__debugbreak();
	}

	if ( (const void* const)inSimplifiedPacket == (const void* const)outFullPacket)
	{
		__debugbreak();
	}
#endif
	genericCommand* const packetWithData = reinterpret_cast<genericCommand* const>(outFullPacket);

	packetWithData->magicProtoHeader = PACKET_MAGIC_VALUE;
	packetWithData->checksum = 0;
	packetWithData->type = inSimplifiedPacket->type;
	packetWithData->payload0 = inSimplifiedPacket->payload0;
	packetWithData->payload1 = inSimplifiedPacket->payload1;
	packetWithData->checksum = command::ComputeChecksum(packetWithData, sizeof(genericCommand) );
}

static const unsigned numSimplifiedPacketsPerDRAMLine = GPU_DRAM_TRANSACTION_SIZE_BYTES / sizeof(SimplifiedCommandPacket);
union dramLinePackedPacket
{
	SimplifiedCommandPacket simplifiedPackets[numSimplifiedPacketsPerDRAMLine];
	DWORD dwords[8];
};
static_assert(sizeof(dramLinePackedPacket) == 32, "Error: Unexpected struct padding!");
static void HandlePacket(const runCommandListCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->commandListStartAddress > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot execute a command list that is outside of VRAM!
	}
	if (typedPacket->commandListStartAddress % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
		__debugbreak(); // Error: Command list addresses must begin on a DRAM-line boundary!
	}
	if (typedPacket->numCommands < 1)
	{
		__debugbreak(); // Error: Why'd you try to run a command list with 0 commands?
	}
#endif

	const dramLinePackedPacket* const dramLinePackedSimplifiedPacketsMem = reinterpret_cast<const dramLinePackedPacket* const>(LocalMemory + (typedPacket->commandListStartAddress & (GPU_DRAM_TOTAL_CAPACITY_BYTES - 1) ) );
	for (unsigned commandListPacketIndex = 0; commandListPacketIndex < typedPacket->numCommands; ++commandListPacketIndex)
	{
		genericCommand fullCommandPacket;
		const SimplifiedCommandPacket& thisSimplifiedPacket = dramLinePackedSimplifiedPacketsMem[commandListPacketIndex / numSimplifiedPacketsPerDRAMLine].simplifiedPackets[commandListPacketIndex % numSimplifiedPacketsPerDRAMLine];
		GPUCommandList::ConvertSimplifiedCommandPacketToCommandPacket(&thisSimplifiedPacket, &fullCommandPacket);
		D3D9HandleIncomingPacket(&fullCommandPacket);
	}
}

static void HandlePacket(const loadShaderInstructionsCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->shaderStartAddress > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot load a vertex shader that is outside of VRAM!
	}
	if (typedPacket->shaderStartAddress % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
		__debugbreak(); // Error: Vertex shader load addresses must begin on a DRAM-line boundary!
	}
	if (typedPacket->shaderLengthTokens < 1)
	{
		__debugbreak(); // Error: Why'd you try to load a vertex shader with 0 tokens?
	}
#endif

	// Convert the GPU device bytecode back to D3D9 VS bytecode, and then create that as a vertex shader.
	// Note that this packet does not actually change our currently set vertex shader, it only loads a shader from VRAM into the specified location in VS Instruction-RAM (usually slot 0).
	LPDIRECT3DVERTEXSHADER9 newLoadedVS = resourcesRegistry.GetFindOrCreateVertexShaderAtAddress(typedPacket->shaderStartAddress, typedPacket->shaderLengthTokens);
	for (unsigned shaderTokenIndex = 0; shaderTokenIndex < typedPacket->shaderLengthTokens; ++shaderTokenIndex)
	{
		ShaderInstructionMemory[shaderTokenIndex + typedPacket->shaderLoadTargetOffset] = newLoadedVS;
	}
	needToRebindVertexShader = true;
}

static void HandlePacket(const setShaderConstantCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->constantDataPointer > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot set a shader constant that is outside of VRAM!
	}
	if (typedPacket->constantDataPointer % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
		__debugbreak(); // Error: Shader constant load addresses must begin on a DRAM-line boundary!
	}
	if (typedPacket->numFloat4Registers < 1)
	{
		__debugbreak(); // Error: Why'd you try to set 0 shader constants?
	}
	if ( (const unsigned)typedPacket->constantBaseRegisterIndex + (const unsigned)typedPacket->numFloat4Registers > 256)
	{
		__debugbreak(); // Error: Setting vertex shader constant registers outside of the valid range
	}
#endif

	const D3DXVECTOR4* const float4Mem = reinterpret_cast<const D3DXVECTOR4* const>(LocalMemory + (typedPacket->constantDataPointer & (GPU_DRAM_TOTAL_CAPACITY_BYTES - 1) ) );
	if (memcmp(currentVSConstantsF[typedPacket->constantBaseRegisterIndex], &float4Mem->x, typedPacket->numFloat4Registers * sizeof(D3DXVECTOR4) ) != 0)
	{
		d3d9dev->SetVertexShaderConstantF(typedPacket->constantBaseRegisterIndex, &float4Mem->x, typedPacket->numFloat4Registers);
		memcpy(currentVSConstantsF[typedPacket->constantBaseRegisterIndex], &float4Mem->x, typedPacket->numFloat4Registers * sizeof(D3DXVECTOR4) );
	}
}

static void HandlePacket(const setVertexStreamDataCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->streamBaseAddress > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot set a vertex stream address that is outside of VRAM!
	}
	if (typedPacket->streamBaseAddress % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
		__debugbreak(); // Error: Vertex stream addresses must begin on a DRAM-line boundary!
	}
	if (typedPacket->numVertexStreamsTotal < 1)
	{
		__debugbreak(); // Error: Why'd you try to set 0 vertex streams?
	}
#endif

	// We need to modify the building vertex declaration here too:
	D3DVERTEXELEMENT9& newVertDeclElement = buildingVertexDecl[typedPacket->shaderInputRegIndex];
	newVertDeclElement.Stream = typedPacket->streamID;
	newVertDeclElement.Method = D3DDECLMETHOD_DEFAULT;
	newVertDeclElement.Type = GetVertexDeclType(typedPacket->dwordCount, typedPacket->isD3DCOLOR ? true : false);
	newVertDeclElement.Offset = (const WORD)(typedPacket->dwordOffset * sizeof(DWORD) ); // Don't apply a double-offset!
	newVertDeclElement.Usage = GetVertexDeclUsage(typedPacket->inputUsage);
	newVertDeclElement.UsageIndex = typedPacket->inputUsageIndex;
	buildingVertexDecl[typedPacket->numVertexStreamsTotal] = D3DDECL_END();
	hasModifiedVertexDecl = true;

	// Look up the vertex buffer based on the stream set address:
	LPDIRECT3DVERTEXBUFFER9 setNewVB = NULL;
	const unsigned estimatedVertexBufferSize = GetContiguousWriteRegionSizeBytes(typedPacket->streamBaseAddress);
	setNewVB = resourcesRegistry.GetFindOrCreateVertexBufferAtAddress(typedPacket->streamBaseAddress, estimatedVertexBufferSize ? estimatedVertexBufferSize : GPU_PAGE_SIZE_BYTES);
	SetCachedStreamSource(typedPacket->streamID, setNewVB, 0, typedPacket->dwordStride * sizeof(DWORD) );
}

static void HandlePacket(const setStatsEventConfigCommand* const typedPacket)
{
	// Do nothing when this is received for now!

	// TODO: Emulate stats gathering.
}

static const float GetCompressedPow2(const unsigned pow2)
{
#ifdef _DEBUG
	if (pow2 > 15)
	{
		__debugbreak(); // Error: Input pow2 value is out of range of our expected 4 bits input
	}
#endif
	if (pow2 >= 8)
	{
		return (const float)(1 << (pow2 - 8) );
	}
	else
	{
		return (const float)(1.0f / (8 - pow2) );
	}
}

static const float GetCompressedSpecial(const unsigned specialIndex)
{
	switch (specialIndex)
	{
	default:
	{
		__debugbreak(); // Error: Invalid compressed special index!
	}
	case 0: // zero
		return 0.0f;
	case 1: // pi
		return 3.1415926535897932384626433832795f;
	case 2: // e
		return 2.7182818284590452353602874713527f;
	case 3: // 2*pi
		return 6.283185307179586476925286766559f;
	case 4: // 255 (0xFF)
		return 255.0f;
	case 5: // 1.0f / 255.0f
		return 1.0f / 255.0f;
	}
}

static void HandlePacket(const setShaderConstantSpecialCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->isXPow2 == typedPacket->isXSpec)
	{
		__debugbreak(); // Error: Only one of these two bits is expected to be set at once!
	}
	if (typedPacket->isYPow2 == typedPacket->isYSpec)
	{
		__debugbreak(); // Error: Only one of these two bits is expected to be set at once!
	}
	if (typedPacket->isZPow2 == typedPacket->isZSpec)
	{
		__debugbreak(); // Error: Only one of these two bits is expected to be set at once!
	}
	if (typedPacket->isWPow2 == typedPacket->isWSpec)
	{
		__debugbreak(); // Error: Only one of these two bits is expected to be set at once!
	}
#endif

	D3DXVECTOR4 setNewShaderConstant(0.0f, 0.0f, 0.0f, 0.0f);

	if (typedPacket->isXPow2)
		setNewShaderConstant.x = GetCompressedPow2(typedPacket->XIndex);
	else
		setNewShaderConstant.x = GetCompressedSpecial(typedPacket->XIndex);
	if (typedPacket->isYPow2)
		setNewShaderConstant.y = GetCompressedPow2(typedPacket->YIndex);
	else
		setNewShaderConstant.y = GetCompressedSpecial(typedPacket->YIndex);
	if (typedPacket->isZPow2)
		setNewShaderConstant.z = GetCompressedPow2(typedPacket->ZIndex);
	else
		setNewShaderConstant.z = GetCompressedSpecial(typedPacket->ZIndex);
	if (typedPacket->isWPow2)
		setNewShaderConstant.w = GetCompressedPow2(typedPacket->WIndex);
	else
		setNewShaderConstant.w = GetCompressedSpecial(typedPacket->WIndex);

	if (typedPacket->isXNegative)
		setNewShaderConstant.x = -setNewShaderConstant.x;
	if (typedPacket->isYNegative)
		setNewShaderConstant.y = -setNewShaderConstant.y;
	if (typedPacket->isZNegative)
		setNewShaderConstant.z = -setNewShaderConstant.z;
	if (typedPacket->isWNegative)
		setNewShaderConstant.w = -setNewShaderConstant.w;

	d3d9dev->SetVertexShaderConstantF(typedPacket->shaderRegIndex, &setNewShaderConstant.x, 1);
}

static void HandlePacket(const debugShaderNextDrawCallCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->dumpRegistersAddress > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot set a registers dump address that is outside of VRAM!
	}
	if (typedPacket->dumpRegistersAddress % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
		__debugbreak(); // Error: Register dump addresses must begin on a DRAM-line boundary!
	}
#endif

	// Do nothing here. Emulated devices like ours don't really support dumping registers to VRAM.
}

static void HandlePacket(const setDepthStateCommand* const typedPacket)
{
	const D3DCMPFUNC zFunc = ConvertCmpFunc(static_cast<const eCmpFunc>(typedPacket->zFunc) );
	const DWORD depthBiasDWORD = (typedPacket->DepthBiasHighBits << 27) | typedPacket->DepthBiasLowBits;
	const float depthBiasFloat = *reinterpret_cast<const float* const>(&depthBiasDWORD);
	SetCachedRenderState(D3DRS_ZENABLE, typedPacket->DepthTestEnable ? D3DZB_TRUE : D3DZB_FALSE);
	SetCachedRenderState(D3DRS_ZWRITEENABLE, typedPacket->DepthWriteEnable ? TRUE : FALSE);
	SetCachedRenderState(D3DRS_ZFUNC, zFunc);
	SetCachedRenderState(D3DRS_DEPTHBIAS, depthBiasDWORD);
	if (typedPacket->ColorWritesEnabled)
		SetCachedRenderState(D3DRS_COLORWRITEENABLE, D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_ALPHA);
	else
		SetCachedRenderState(D3DRS_COLORWRITEENABLE, 0x0);
}

// Blend state block data members:
union _blendStateDataUnion
{
	struct _bitsStruct
	{
		blendModeSourcesRGB blendModeSrcRGB : 3;
		BOOL blendModeSrcRGBInvert : 1;
		blendModeSourcesRGB blendModeDestRGB : 3;
		BOOL blendModeDestRGBInvert : 1;
		blendOp blendOpRGB : 3;

		blendModeSourcesA blendModeSrcA : 2;
		BOOL blendModeSrcAInvert : 1;
		blendModeSourcesA blendModeDestA : 2;
		BOOL blendModeDestAInvert : 1;
		blendOp blendOpA : 3;

		BOOL doLoadSrcColor : 1; // Should the ROP unit load the incoming pixel (src) data?
		BOOL doLoadDestColor : 1; // Should the ROP unit load the existing framebuffer pixel (dest) data? (This one is a big bandwidth savings if it's computed as 0)

		unsigned unusedPadding : 10;
	} bitsStruct;

	DWORD solidDWORD;
};
static_assert(sizeof(_blendStateDataUnion) == sizeof(unsigned), "Error: Unexpected blend state union packing!");

static void HandlePacket(const setBlendStateCommand* const typedPacket)
{
	_blendStateDataUnion blendStateData;
	blendStateData.solidDWORD = typedPacket->blendStateBlock;

	const D3DBLENDOP colorBlendOp = ConvertBlendOp(blendStateData.bitsStruct.blendOpRGB);
	const D3DBLENDOP alphaBlendOp = ConvertBlendOp(blendStateData.bitsStruct.blendOpA);
	const D3DBLEND srcColorArg = ConvertBlendArgRGB(blendStateData.bitsStruct.blendModeSrcRGB, blendStateData.bitsStruct.blendModeSrcRGBInvert ? true : false);
	const D3DBLEND destColorArg = ConvertBlendArgRGB(blendStateData.bitsStruct.blendModeDestRGB, blendStateData.bitsStruct.blendModeDestRGBInvert ? true : false);
	const D3DBLEND srcAlphaArg = ConvertBlendArgA(blendStateData.bitsStruct.blendModeSrcA, blendStateData.bitsStruct.blendModeSrcAInvert ? true : false);
	const D3DBLEND destAlphaArg = ConvertBlendArgA(blendStateData.bitsStruct.blendModeDestA, blendStateData.bitsStruct.blendModeDestAInvert ? true : false);

	BOOL separateAlphaBlendEnable = FALSE;
	if (srcColorArg != srcAlphaArg || destColorArg != destAlphaArg || colorBlendOp != alphaBlendOp)
		separateAlphaBlendEnable = TRUE;

	SetCachedRenderState(D3DRS_ALPHABLENDENABLE, typedPacket->alphaBlendingEnabled ? TRUE : FALSE);
	SetCachedRenderState(D3DRS_BLENDOP, colorBlendOp);
	SetCachedRenderState(D3DRS_SRCBLEND, srcColorArg);
	SetCachedRenderState(D3DRS_DESTBLEND, destColorArg);
	SetCachedRenderState(D3DRS_BLENDOPALPHA, alphaBlendOp);
	SetCachedRenderState(D3DRS_SRCBLENDALPHA, srcAlphaArg);
	SetCachedRenderState(D3DRS_DESTBLENDALPHA, destAlphaArg);
	SetCachedRenderState(D3DRS_SEPARATEALPHABLENDENABLE, separateAlphaBlendEnable);
	SetCachedRenderState(D3DRS_BLENDFACTOR, typedPacket->blendFactorABGR); // Unsure if we need to swizzle this color to ARGB or not?
}

static void HandlePacket(const setClipperStateCommand* const typedPacket)
{
	const BOOL isClippingEnabled = typedPacket->clippingEnabled ? TRUE : FALSE;
	SetCachedRenderState(D3DRS_CLIPPING, isClippingEnabled);
}

static void HandlePacket(const issueQueryCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->queryAddress > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Cannot issue a query that is outside of VRAM!
	}
	if (typedPacket->queryAddress % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
		__debugbreak(); // Error: Query issue addresses must begin on a DRAM-line boundary!
		// Is this actually true, or do queries only need to be DWORD-aligned?
	}
#endif

	const D3DQUERYTYPE queryType = ConvertQueryType(static_cast<const eQueryType>(typedPacket->queryType) );

	unsigned queryResultSize = 0;
	switch (static_cast<const eQueryType>(typedPacket->queryType) )
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Invalid or out of range enum!
	}
#endif
	case eQTEvent:
		queryResultSize = sizeof(BOOL);
		break;
	case eQTOcclusion:
	case eQTBinaryOcclusion:
		queryResultSize = sizeof(DWORD);
		break;
	case eQTTimestamp:
		queryResultSize = sizeof(LARGE_INTEGER);
		break;
	}

	// Look up the query based on its address and type, or create a new query if we've never seen this query used before
	LPDIRECT3DQUERY9 foundQuery = NULL;
	foundQuery = resourcesRegistry.GetFindOrCreateQueryAtAddress(typedPacket->queryAddress, queryType);
	if (foundQuery)
	{
		if (!typedPacket->isEndQuery)
		{
			foundQuery->Issue(D3DISSUE_BEGIN);
		}
		else
		{
			foundQuery->Issue(D3DISSUE_END);
			BYTE* const queryResultWriteMem = LocalMemory + (typedPacket->queryAddress & (GPU_DRAM_TOTAL_CAPACITY_BYTES - 1) );
			while (foundQuery->GetData(queryResultWriteMem, queryResultSize, D3DGETDATA_FLUSH) == S_FALSE)
			{
				YieldProcessor(); // Hot spin-loop
			}
		}
	}
}

static D3DVIEWPORT9 buildingViewport = 
{
	0, 0, // x, y
	640, 480, // width, height
	0.0f, 1.0f // minZ, maxZ
};
static void HandlePacket(const setViewportState0Command* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->viewportHalfWidth < 0.5f)
	{
		__debugbreak(); // Error: Viewport is zero or negative size!
	}
	if (typedPacket->viewportHalfHeight < 0.5f)
	{
		__debugbreak(); // Error: Viewport is zero or negative size!
	}
#endif
	buildingViewport.Width = (const DWORD)(typedPacket->viewportHalfWidth * 2.0f); // TODO: Watch out for this one in case we add the +0.5f half-pixel offset to it for D3D9 in the future
	buildingViewport.Height = (const DWORD)(typedPacket->viewportHalfHeight * 2.0f);

	// Do not call SetViewport() from here. Wait until the driver sends us the next packet and then we'll set up our viewport.
}

static void HandlePacket(const setViewportStateXYCommand* const typedPacket)
{
	buildingViewport.X = (const DWORD)(typedPacket->viewportXOffset); // TODO: Watch out for this one in case we add the +0.5f half-pixel offset to it for D3D9 in the future
	buildingViewport.Y = (const DWORD)(typedPacket->viewportYOffset);

	// Do not call SetViewport() from here. Wait until the driver sends us the next packet and then we'll set up our viewport.
}

static void HandlePacket(const setViewportState1Command* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->viewportZOffset < 0.0f)
	{
		__debugbreak(); // Error: Viewport cannot have negative Z offset!
	}
	if (typedPacket->viewportZScale > 1.0f)
	{
		__debugbreak(); // Error: Viewport scale is out of range!
	}
#endif
	buildingViewport.MinZ = typedPacket->viewportZOffset;
	buildingViewport.MaxZ = typedPacket->viewportZOffset + typedPacket->viewportZScale;

	if (memcmp(&buildingViewport, &currentViewport, sizeof(D3DVIEWPORT9) ) != 0)
	{
		d3d9dev->SetViewport(&buildingViewport);
		memcpy(&currentViewport, &buildingViewport, sizeof(D3DVIEWPORT9) );
	}
}

static void HandlePacket(const setScissorRectCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->scissorLeft >= typedPacket->scissorRight)
	{
		__debugbreak(); // Error: Zero or negative-area scissor rect!
	}
	if (typedPacket->scissorTop >= typedPacket->scissorBottom)
	{
		__debugbreak(); // Error: Zero or negative-area scissor rect!
	}
#endif
	RECT scissorRect = {0};
	scissorRect.left = typedPacket->scissorLeft;
	scissorRect.right = typedPacket->scissorRight;
	scissorRect.top = typedPacket->scissorTop;
	scissorRect.bottom = typedPacket->scissorBottom;

	if (memcmp(&currentScissorRect, &scissorRect, sizeof(RECT) ) != 0)
	{
		d3d9dev->SetScissorRect(&scissorRect);
		memcpy(&currentScissorRect, &scissorRect, sizeof(RECT) );
	}
}

static void HandlePacket(const setAttrInterpolatorStateCommand* const typedPacket)
{
	const D3DSHADEMODE shadeMode = typedPacket->useFlatShadingColor ? D3DSHADE_FLAT : D3DSHADE_GOURAUD;
	SetCachedRenderState(D3DRS_SHADEMODE, shadeMode);

	const D3DTEXTUREADDRESS addressU = ConvertTexAddress(typedPacket->addressingU);
	const D3DTEXTUREADDRESS addressV = ConvertTexAddress(typedPacket->addressingV);
	CachedSetSamplerState(0, D3DSAMP_ADDRESSU, addressU);
	CachedSetSamplerState(0, D3DSAMP_ADDRESSV, addressV);
}

static void HandlePacket(const writeMemBatchConfigCommand* const typedPacket)
{
#ifdef _DEBUG
	if (typedPacket->writeBeginAddr % 32 != 0)
	{
		__debugbreak(); // Error: Unaligned DRAM row write address
	}
	if (typedPacket->writeBeginAddr > (GPU_DRAM_TOTAL_CAPACITY_BYTES - 32) )
	{
		__debugbreak(); // Error: Cannot set the write pointer to be out of bounds!
	}
#endif
	currentBatchWritePtr = LocalMemory + typedPacket->writeBeginAddr;
}

static void HandlePacket(const writeMemBatchData0Command* const typedPacket)
{
	currentBatchWriteData[0] = typedPacket->writeDWORDData0;
	currentBatchWriteData[1] = typedPacket->writeDWORDData1;
}

static void HandlePacket(const writeMemBatchData1Command* const typedPacket)
{
	currentBatchWriteData[2] = typedPacket->writeDWORDData2;
	currentBatchWriteData[3] = typedPacket->writeDWORDData3;
}

static void HandlePacket(const writeMemBatchData2Command* const typedPacket)
{
	currentBatchWriteData[4] = typedPacket->writeDWORDData4;
	currentBatchWriteData[5] = typedPacket->writeDWORDData5;
}

static void HandlePacket(const writeMemBatchData3WriteCommand* const typedPacket)
{
	if (currentBatchWritePtr >= (LocalMemory + sizeof(LocalMemory) ) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Cannot write out of bounds!
#endif
		currentBatchWritePtr = LocalMemory;
	}

	currentBatchWriteData[6] = typedPacket->writeDWORDData6;
	currentBatchWriteData[7] = typedPacket->writeDWORDData7;

	memcpy(currentBatchWritePtr, currentBatchWriteData, sizeof(currentBatchWriteData) );

	// Track our writes in the DWORD writes bitmap:
	const DWORD currentWritePtrOffset = static_cast<DWORD>(currentBatchWritePtr - LocalMemory);
	AddMemoryBitmapDWORDWrite(currentWritePtrOffset);
	AddMemoryBitmapDWORDWrite(currentWritePtrOffset + 4);
	AddMemoryBitmapDWORDWrite(currentWritePtrOffset + 8);
	AddMemoryBitmapDWORDWrite(currentWritePtrOffset + 12);
	AddMemoryBitmapDWORDWrite(currentWritePtrOffset + 16);
	AddMemoryBitmapDWORDWrite(currentWritePtrOffset + 20);
	AddMemoryBitmapDWORDWrite(currentWritePtrOffset + 24);
	AddMemoryBitmapDWORDWrite(currentWritePtrOffset + 28);

	currentBatchWritePtr += 32;
}

template <typename packetStructType>
static
#ifndef _DEBUG
inline
#endif
void CallHandlePacket(const genericCommand* const newGenericPacket)
{
	const packetStructType* const typedPacket = reinterpret_cast<const packetStructType* const>(newGenericPacket);
	HandlePacket(typedPacket);
}

void D3D9HandleIncomingPacket(const genericCommand* const newGenericPacket)
{
	if (newGenericPacket->type < command::PT_MAX_PACKET_TYPES)
	{
		const unsigned char computedChecksum = command::ComputeChecksum(newGenericPacket, sizeof(genericCommand) );
		if (newGenericPacket->checksum == computedChecksum)
		{
			switch (newGenericPacket->type)
			{
			default:
#ifdef _DEBUG
			{
				__debugbreak(); // Should never be here! We already checked for out-of-range packet type earlier!
			}
#endif
			case command::PT_DONOTHING:
				CallHandlePacket<doNothingCommand>(newGenericPacket);
				break;

			case command::PT_WRITEMEM:
				CallHandlePacket<writeMemCommand>(newGenericPacket);
				break;

			case command::PT_READMEM:
				CallHandlePacket<readMemCommand>(newGenericPacket);
				break;

			case command::PT_READMEMRESPONSE:
				CallHandlePacket<readMemResponse>(newGenericPacket);
				break;

			case command::PT_CLEARMEM:
				CallHandlePacket<clearMemCommand>(newGenericPacket);
				break;

			case command::PT_CLEARBACKBUFFER:
				CallHandlePacket<clearBackbufferCommand>(newGenericPacket);
				break;

			case command::PT_CLEARZSTENCILBUFFER:
				CallHandlePacket<clearZStencilCommand>(newGenericPacket);
				break;

			case command::PT_LOADTEXCACHEDATA:
				CallHandlePacket<loadTexCacheDataCommand>(newGenericPacket);
				break;

			case command::PT_SETALPHATESTANDRTADDRESSSTATE:
				CallHandlePacket<setAlphaTestAndRTAddressStateCommand>(newGenericPacket);
				break;

			case command::PT_SETTEXTURESTATE:
				CallHandlePacket<setTextureStateCommand>(newGenericPacket);
				break;

			case command::PT_WAITFORDEVICEIDLE:
				CallHandlePacket<waitForDeviceIdleCommand>(newGenericPacket);
				break;

			case command::PT_WAITRESPONSE:
				CallHandlePacket<waitResponse>(newGenericPacket);
				break;

			case command::PT_DRAWINDEXED:
				CallHandlePacket<drawIndexedCommand>(newGenericPacket);
				break;

			case command::PT_SETSCANOUTPOINTER:
				CallHandlePacket<setScanoutPointerCommand>(newGenericPacket);
				break;

			case command::PT_SETIASTATE:
				CallHandlePacket<setIAStateCommand>(newGenericPacket);
				break;

			case command::PT_FLUSHROPCACHE:
				CallHandlePacket<flushROPCacheCommand>(newGenericPacket);
				break;

			case command::PT_ENDFRAMESTATS:
				CallHandlePacket<endFrameStatsResponse>(newGenericPacket);
				break;

			case command::PT_ENDFRAME:
				CallHandlePacket<endFrameCommand>(newGenericPacket);
				break;

			case command::PT_RUNCOMMANDLIST:
				CallHandlePacket<runCommandListCommand>(newGenericPacket);
				break;

			case command::PT_LOADSHADERINSTRUCTIONS:
				CallHandlePacket<loadShaderInstructionsCommand>(newGenericPacket);
				break;

			case command::PT_SETSHADERCONSTANT:
				CallHandlePacket<setShaderConstantCommand>(newGenericPacket);
				break;

			case command::PT_SETVERTEXSTREAMDATA:
				CallHandlePacket<setVertexStreamDataCommand>(newGenericPacket);
				break;

			case command::PT_SETSTATSEVENTCONFIG:
				CallHandlePacket<setStatsEventConfigCommand>(newGenericPacket);
				break;

			case command::PT_SETSHADERCONSTANTSPECIAL:
				CallHandlePacket<setShaderConstantSpecialCommand>(newGenericPacket);
				break;

			case command::PT_SETSHADERSTARTADDRESS:
				CallHandlePacket<setShaderStartAddressCommand>(newGenericPacket);
				break;

			case command::PT_DEBUGSHADERNEXTDRAWCALL:
				CallHandlePacket<debugShaderNextDrawCallCommand>(newGenericPacket);
				break;

			case command::PT_SETDEPTHSTATE:
				CallHandlePacket<setDepthStateCommand>(newGenericPacket);
				break;

			case command::PT_SETBLENDSTATE:
				CallHandlePacket<setBlendStateCommand>(newGenericPacket);
				break;

			case command::PT_CONNBROADCAST:
			case command::PT_CONNREQUEST:
			case command::PT_CONNRESPONSE:
			case command::PT_SESSIONCOMBOPACKET:
			case command::PT_DISCONNECT:
				CallHandlePacket<doNothingCommand>(newGenericPacket); // We don't handle network packets yet, so just do nothing
				break;

			case command::PT_SETCLIPSTATE:
				CallHandlePacket<setClipperStateCommand>(newGenericPacket);
				break;

			case command::PT_ISSUEQUERY:
				CallHandlePacket<issueQueryCommand>(newGenericPacket);
				break;

			case command::PT_SETVIEWPORTPARAMS0:
				CallHandlePacket<setViewportState0Command>(newGenericPacket);
				break;

			case command::PT_SETVIEWPORTPARAMSXY:
				CallHandlePacket<setViewportStateXYCommand>(newGenericPacket);
				break;

			case command::PT_SETVIEWPORTPARAMS1:
				CallHandlePacket<setViewportState1Command>(newGenericPacket);
				break;

			case command::PT_SETSCISSORRECT:
				CallHandlePacket<setScissorRectCommand>(newGenericPacket);
				break;

			case command::PT_SETINTERPOLATORSTATE:
				CallHandlePacket<setAttrInterpolatorStateCommand>(newGenericPacket);
				break;

			case command::PT_WRITEMEMBATCHCONFIG:
				CallHandlePacket<writeMemBatchConfigCommand>(newGenericPacket);
				break;

			case command::PT_WRITEMEMBATCH0:
				CallHandlePacket<writeMemBatchData0Command>(newGenericPacket);
				break;

			case command::PT_WRITEMEMBATCH1:
				CallHandlePacket<writeMemBatchData1Command>(newGenericPacket);
				break;

			case command::PT_WRITEMEMBATCH2:
				CallHandlePacket<writeMemBatchData2Command>(newGenericPacket);
				break;

			case command::PT_WRITEMEMBATCH3WRITE:
				CallHandlePacket<writeMemBatchData3WriteCommand>(newGenericPacket);
				break;
			}
		}
		else
		{
			// Error: Invalid packet checksum!
			printf("Error: Invalid packet checksum received (checksum = 0x%02X; expected = 0x%02X)! Dropping packet...\n", (const unsigned)(newGenericPacket->checksum), (const unsigned)computedChecksum);
		}
	}
	else
	{
		// Error: Invalid packet type received!
		printf("Error: Invalid packet type received %u! Dropping packet...\n", newGenericPacket->type);
	}
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

static void SetInitialState()
{
	// TODO: Set all of the other default render-states here so that our device has a known initial starting state:
	d3d9dev->SetFVF(D3DFVF_XYZ | D3DFVF_DIFFUSE | D3DFVF_TEX1 | D3DFVF_TEXCOORDSIZE2(0) );

	// Populate our cached render states array with our actual render state values:
	for (unsigned renderStateIndex = 0; renderStateIndex <= D3DRS_BLENDOPALPHA; ++renderStateIndex)
	{
		const D3DRENDERSTATETYPE thisRenderState = (const D3DRENDERSTATETYPE)renderStateIndex;
		d3d9dev->GetRenderState(thisRenderState, &currentCachedRenderStates[renderStateIndex]);
	}

	for (unsigned textureIndex = 0; textureIndex < 16; ++textureIndex)
	{
		// Populate our sampler states array with actual sampler state values:
		samplerStateStruct& thisSampler = currentSamplerStates[textureIndex];
		for (unsigned stateType = D3DSAMP_ADDRESSU; stateType <= D3DSAMP_DMAPOFFSET; ++stateType)
		{
			const D3DSAMPLERSTATETYPE thisSamplerStateType = (const D3DSAMPLERSTATETYPE)stateType;
			d3d9dev->GetSamplerState(textureIndex, thisSamplerStateType, &thisSampler.samplerStateValues[thisSamplerStateType]);
		}

		// Populate our texture stage states array with actual texture stage state values:
		textureStageStateStruct& thisTextureStageStates = currentTextureStageStates[textureIndex];
		for (unsigned stageStateType = D3DTSS_COLOROP; stageStateType <= D3DTSS_CONSTANT; ++stageStateType)
		{
			const D3DTEXTURESTAGESTATETYPE thisStageStateType = (const D3DTEXTURESTAGESTATETYPE)stageStateType;
			d3d9dev->GetTextureStageState(textureIndex, thisStageStateType, &thisTextureStageStates.textureStageStateValues[stageStateType]);
		}
	}

	currentViewport.Width = 640;
	currentViewport.Height = 480;
	currentViewport.MaxZ = 1.0f;

	currentScissorRect.right = 640;
	currentScissorRect.bottom = 480;

	d3d9dev->BeginScene();
	begunSceneState = true;
}

const bool D3D9CreateDevice(HWND renderWindow, const unsigned windowWidth, const unsigned windowHeight)
{
	LARGE_INTEGER freq = {0};
	QueryPerformanceFrequency(&freq);
	ldFreq = (const double)freq.QuadPart;

#ifdef _DEBUG
	if (d3d9ex != NULL)
	{
		__debugbreak(); // Only call this function once!
	}
	if (d3d9dev != NULL)
	{
		__debugbreak(); // Only call this function once!
	}
#endif
	if (FAILED(Direct3DCreate9Ex(D3D_SDK_VERSION, &d3d9ex) ) || !d3d9ex)
	{
		printf("Error in Direct3DCreate9Ex(). GLE: %u\n", GetLastError() );
		return false;
	}

	D3DPRESENT_PARAMETERS d3dpp = {0};
	d3dpp.BackBufferWidth = windowWidth;
	d3dpp.BackBufferHeight = windowHeight;
	d3dpp.BackBufferFormat = D3DFMT_X8R8G8B8;
	d3dpp.BackBufferCount = 1;
	d3dpp.SwapEffect = D3DSWAPEFFECT_FLIPEX;
	d3dpp.hDeviceWindow = renderWindow;
	d3dpp.Windowed = TRUE;
	d3dpp.EnableAutoDepthStencil = TRUE;
	d3dpp.AutoDepthStencilFormat = D3DFMT_D24S8;
	d3dpp.PresentationInterval = D3DPRESENT_INTERVAL_IMMEDIATE;
	HRESULT createDeviceHR = d3d9ex->CreateDeviceEx(D3DADAPTER_DEFAULT, D3DDEVTYPE_HAL, renderWindow, D3DCREATE_HARDWARE_VERTEXPROCESSING, &d3dpp, NULL, &d3d9dev);
	if (FAILED(createDeviceHR) || !d3d9dev)
	{
		printf("Error in CreateDevice(). HRESULT: 0x%08X. GLE: %u\n", createDeviceHR, GetLastError() );
		return false;
	}

	if (FAILED(d3d9dev->CreateQuery(D3DQUERYTYPE_EVENT, &mainEventQuery) ) )
	{
		printf("Error in CreateQuery()\n");
		return false;
	}

	d3d9dev->Clear(0, NULL, D3DCLEAR_TARGET | D3DCLEAR_ZBUFFER, D3DCOLOR_XRGB(127, 127, 127), 1.0f, 0x00000000);
	d3d9dev->Present(NULL, NULL, NULL, NULL);
	
	if (FAILED(d3d9dev->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE_MONO, &originalBackbuffer) ) || !originalBackbuffer)
	{
		printf("Error in GetBackBuffer()\n");
		return false;
	}

	SetInitialState();

	renderWindow_g = renderWindow;

	return true;
}

void D3D9ShutdownDevice()
{
#ifdef _DEBUG
	if (d3d9dev == NULL)
	{
		__debugbreak(); // Can't shutdown the D3D9EX device if it has never been initialized in the first place!
	}
	if (d3d9ex == NULL)
	{
		__debugbreak(); // Can't shutdown the D3D9EX interface if it has never been initialized in the first place!
	}
#endif
	d3d9dev->Release();
	d3d9dev = NULL;

	d3d9ex->Release();
	d3d9ex = NULL;
}
