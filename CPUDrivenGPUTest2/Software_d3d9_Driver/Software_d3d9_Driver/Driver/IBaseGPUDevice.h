#pragma once

#include "GPUAllocator.h"
#include "IBaseDeviceComms.h"
#include "PacketDefs.h"
#include "GPUCommandList.h"
#include "GPUDeviceLimits.h"
#include "..\ShaderBase.h"

typedef unsigned long DWORD;
typedef DWORD D3DCOLOR;
typedef unsigned char BYTE;
typedef enum _D3DPRIMITIVETYPE D3DPRIMITIVETYPE;

typedef enum _D3DCMPFUNC D3DCMPFUNC;
const eCmpFunc ConvertToDeviceCmpFunc(const D3DCMPFUNC cmpFunc);
const eDepthFormat ConvertToDeviceDepthFormat(const D3DFORMAT zFormat);

struct CachedVertexStream
{
	const bool operator==(const CachedVertexStream& rhs) const
	{
		return (rhs.deviceCachedVertexBuffer == deviceCachedVertexBuffer &&
			rhs.streamID == streamID &&
			rhs.dwordCount == dwordCount &&
			rhs.isD3DCOLOR == isD3DCOLOR &&
			rhs.shaderInputRegIndex == shaderInputRegIndex &&
			rhs.dwordStride == dwordStride &&
			rhs.dwordOffset == dwordOffset);
	}

	void Reset(const BYTE _streamID)
	{
		memset(this, 0, sizeof(*this) );
		streamID = _streamID;
	}

	const gpuvoid* deviceCachedVertexBuffer = nullptr;
	BYTE streamID = 0;
	BYTE dwordCount = 0;
	bool isD3DCOLOR = false;
	BYTE shaderInputRegIndex = 0;
	BYTE dwordStride = 0;
	BYTE dwordOffset = 0;
};

struct ROPBlock
{
	ROPBlock()
	{
		dataUnion.bitsStruct.blendModeSrcRGB = blendRGB_0; dataUnion.bitsStruct.blendModeSrcRGBInvert = true; // D3DRS_SRCBLEND defaults to D3DBLEND_ONE
		dataUnion.bitsStruct.blendModeDestRGB = blendRGB_0; dataUnion.bitsStruct.blendModeDestRGBInvert = false; // D3DRS_DESTBLEND defaults to D3DBLEND_ZERO
		dataUnion.bitsStruct.blendOpRGB = bop_add; // D3DRS_BLENDOP defaults to D3DBLENDOP_ADD
		dataUnion.bitsStruct.blendModeSrcA = blendA_0; dataUnion.bitsStruct.blendModeSrcAInvert = true; // D3DRS_SRCBLENDALPHA defaults to D3DBLEND_ONE
		dataUnion.bitsStruct.blendModeDestA = blendA_0; dataUnion.bitsStruct.blendModeDestAInvert = false; // D3DRS_DESTBLENDALPHA defaults to D3DBLEND_ZERO
		dataUnion.bitsStruct.blendOpA = bop_add; // D3DRS_BLENDOPALPHA defaults to D3DBLENDOP_ADD
		dataUnion.bitsStruct.doLoadSrcColor = true; dataUnion.bitsStruct.doLoadDestColor = false;
		dataUnion.bitsStruct.unusedPadding = 0x000;
	}

	const bool operator==(const ROPBlock& rhs) const
	{
		return dataUnion.solidDWORD == rhs.dataUnion.solidDWORD && 
			deviceCachedAlphaTestEnabled == rhs.deviceCachedAlphaTestEnabled &&
			deviceCachedAlphaTestRefVal == rhs.deviceCachedAlphaTestRefVal &&
			deviceCachedAlphaTestCmpFunc == rhs.deviceCachedAlphaTestCmpFunc &&
			deviceCachedWriteMask == rhs.deviceCachedWriteMask;
	}

	// Conversion entrypoint:
	void ConvertBlendStateFromD3DRS(const bool alphaBlendEnable,
		const D3DBLEND srcColorBlend, const D3DBLEND destColorBlend, const D3DBLENDOP colorBlendOp,
		const D3DBLEND srcAlphaBlend, const D3DBLEND destAlphaBlend, const D3DBLENDOP alphaBlendOp,
		const D3DCOLOR blendFactor_ARGB);

	// Bitfield data members:
	union _dataUnion
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
	} dataUnion;
	static_assert(sizeof(dataUnion) == sizeof(unsigned), "Error: Unexpected union packing!");

	bool deviceCachedAlphaTestEnabled = false;
	BYTE deviceCachedAlphaTestRefVal = 0x00;
	eCmpFunc deviceCachedAlphaTestCmpFunc = cmp_MAX_CMP_FUNCS;
	eBlendMask deviceCachedWriteMask = (eBlendMask)0xFF;
	bool deviceCachedAlphaBlendEnabled = false;

private:
	// Internal conversion helper functions:
	void ComputeDoLoadSrcDest(const D3DCOLOR blendFactor_ARGB);
	static void ConvertColorBlend(const D3DBLEND colorBlend, blendModeSourcesRGB& outBlendMode, bool& outBlendInvert, const bool isDestination);
	static void ConvertAlphaBlend(const D3DBLEND alphaBlend, blendModeSourcesA& outBlendMode, bool& outBlendInvert, const bool isDestination);
};

struct TextureBlock
{
	const gpuvoid* deviceCachedSetTexture = nullptr;
	eTexFormat deviceCachedTexFormat = eTexFmtNumFormats;
	unsigned texStateWidth = 0;
	unsigned texStateHeight = 0;
	eTexFilterMode deviceCachedTexFilter = TF_MAXFILTER;
	eTexChannelMUX deviceCachedTexR = tcm_MAX;
	eTexChannelMUX deviceCachedTexG = tcm_MAX;
	eTexChannelMUX deviceCachedTexB = tcm_MAX;
	eTexChannelMUX deviceCachedTexA = tcm_MAX;
	combinerMode deviceCachedCombinerModeColor = cbm_MAX_NUM_COMBINER_MODES;
	combinerMode deviceCachedCombinerModeAlpha = cbm_MAX_NUM_COMBINER_MODES;
};

struct DepthStateBlock
{
	bool deviceCachedZEnabled = false;
	bool deviceCachedZWriteEnabled = false;
	bool deviceColorWritesEnabled = false;
	eCmpFunc deviceCachedDepthTestCmpFunc = cmp_MAX_CMP_FUNCS;
	float deviceDepthBias = 0.0f;
	eDepthFormat deviceDepthFormat = eDepthFmtD24;

	const bool operator==(const DepthStateBlock& rhs) const
	{
		return memcmp(this, &rhs, sizeof(*this) ) == 0;
	}
};

struct TriangleSetupStateBlock
{
	float deviceCachedViewportHalfWidth = 0.0f;
	float deviceCachedViewportHalfHeight = 0.0f;
	float deviceCachedViewportZScale = 0.0f;
	float deviceCachedViewportZOffset = 0.0f;
	unsigned short deviceCachedScissorLeft = 0xFFFF;
	unsigned short deviceCachedScissorRight = 0xFFFF;
	unsigned short deviceCachedScissorTop = 0xFFFF;
	unsigned short deviceCachedScissorBottom = 0xFFFF;

	const bool operator==(const TriangleSetupStateBlock& rhs) const
	{
		return memcmp(this, &rhs, sizeof(*this) ) == 0;
	}
};

struct GPUDeviceState
{
	const gpuvoid* deviceCachedScanoutBuffer = nullptr;
	const gpuvoid* deviceSetIndexBuffer = nullptr; // This is the *pre*transform index cache
	const gpuvoid* deviceCachedRenderTarget = nullptr;
	const gpuvoid* deviceCachedIAIndexBuffer = nullptr; // This is the *post*transform index cache
	const gpuvoid* deviceCachedVertexShader = nullptr;
	unsigned deviceCachedSetVertexStartAddress = 0x0000;
	eCullMode deviceCachedCullMode = eCullMode_NUM_CULL_MODES;
	ePrimTopology deviceCachedPrimTop = primTop_NUM_PRIM_TOPOLOGIES;
	eStripCutType deviceCachedStripCut = sct_NUM_STRIP_CUT_TYPES;
	eIndexFormat deviceCachedIndexFormat = ibfmt_NUM_INDEX_FORMATS;
	setScanoutPointerCommand::eDisplayChannelSwizzle deviceScanoutSwizzleR = setScanoutPointerCommand::dcs_red;
	setScanoutPointerCommand::eDisplayChannelSwizzle deviceScanoutSwizzleG = setScanoutPointerCommand::dcs_green;
	setScanoutPointerCommand::eDisplayChannelSwizzle deviceScanoutSwizzleB = setScanoutPointerCommand::dcs_blue;
	bool deviceCachedScanoutEnabled = false;
	bool deviceCachedScanoutInvertColors = false;
	bool deviceCachedDepthClipEnable = true;
	bool deviceCachedOpenGLNearZClipMode = false;
	unsigned deviceCachedGuardBandXScale = 4;
	unsigned deviceCachedGuardBandYScale = 5;
	CachedVertexStream deviceCachedVertexStreams[GPU_MAX_NUM_VERTEX_STREAMS];
	float4 deviceCachedConstantRegisters[GPU_SHADER_MAX_NUM_CONSTANT_FLOAT_REG];
	TriangleSetupStateBlock deviceCachedTriSetupState;
	DepthStateBlock deviceCachedDepthState;
	TextureBlock deviceCachedTextureState;
	ROPBlock deviceCachedROPState;

	void ResetFields(const GPUDeviceState& defaultRhs)
	{
		// Preserve the current scanout buffer and render target across resets:
		const gpuvoid* const savedCachedScanout = deviceCachedScanoutBuffer;
		const gpuvoid* const savedCachedRenderTarget = deviceCachedRenderTarget;

		*this = defaultRhs;
		memset(deviceCachedConstantRegisters, 0, sizeof(deviceCachedConstantRegisters) );

		deviceCachedScanoutBuffer = savedCachedScanout;
		deviceCachedRenderTarget = savedCachedRenderTarget;
	}
};

__declspec(align(16) ) struct IBaseGPUDevice
{
	IBaseGPUDevice(IBaseDeviceComms* const baseComms)
	{
		AssociateComms(baseComms);
	}

	~IBaseGPUDevice()
	{
		deviceComms = NULL;
	}

	HRESULT __stdcall DeviceClearRendertarget(gpuvoid* const renderTargetMemory, const D3DCOLOR clearColor);

	HRESULT __stdcall DeviceClearDepthStencil(gpuvoid* const zStencilMemory, const bool bDoClearDepth, const bool bDoClearStencil, 
		const float clearDepth = 1.0f, const BYTE clearStencil = 0x00);

	HRESULT __stdcall DeviceSetTextureState(const unsigned texWidth, const unsigned texHeight, const eTexFilterMode filterMode, 
		const eTexChannelMUX rChannel, const eTexChannelMUX gChannel, const eTexChannelMUX bChannel, const eTexChannelMUX aChannel, const combinerMode cbModeColor, const combinerMode cbModeAlpha,
		const gpuvoid* const textureMemory, const eTexFormat textureFormat);
	HRESULT __stdcall DeviceSetNullTextureState(const eTexFilterMode filterMode, 
		const eTexChannelMUX rChannel, const eTexChannelMUX gChannel, const eTexChannelMUX bChannel, const eTexChannelMUX aChannel, const combinerMode cbModeColor, const combinerMode cbModeAlpha);

	HRESULT __stdcall DeviceSetROPState(gpuvoid* const renderTargetMemory, const eBlendMask writeMask, const bool alphaTestEnabled, const BYTE alphaTestRefVal, const eCmpFunc alphaTestCmpFunc,
		const bool alphaBlendingEnabled, const D3DBLEND srcColorBlend, const D3DBLEND destColorBlend, const D3DBLENDOP colorBlendOp, 
		const D3DBLEND srcAlphaBlend, const D3DBLEND destAlphaBlend, const D3DBLENDOP alphaBlendOp, const D3DCOLOR blendFactorARGB);

	HRESULT __stdcall DeviceSetTriSetupState(const float viewportHalfWidth, const float viewportHalfHeight, const float viewportZScale, const float viewportZOffset,
		const unsigned short scissorRectLeft, const unsigned short scissorRectRight, const unsigned short scissorRectTop, const unsigned short scissorRectBottom);
	HRESULT __stdcall DeviceSetClipState(const bool depthClipEnabled, const bool useOpenGLNearZClip, const float guardBandXScale, const float guardBandYScale);
	HRESULT __stdcall DeviceSetDepthState(const bool zEnabled, const bool zWriteEnabled, const bool colorWriteEnabled, const eCmpFunc zTestCmpFunc, const eDepthFormat zFormat, const float depthBias);

	HRESULT __stdcall DeviceSetIAState(const eCullMode cullMode, const ePrimTopology primTopology, const eStripCutType stripCut, const eIndexFormat indexFormat, const gpuvoid* const indexBufferBaseAddr);

	HRESULT __stdcall DeviceSetScanoutBuffer(const gpuvoid* const renderTargetMemory, const bool bEnableScanout = true, const bool invertScanoutColors = false, 
		const setScanoutPointerCommand::eDisplayChannelSwizzle redChannelSwizzle = setScanoutPointerCommand::dcs_red, const setScanoutPointerCommand::eDisplayChannelSwizzle greenChannelSwizzle = setScanoutPointerCommand::dcs_green, const setScanoutPointerCommand::eDisplayChannelSwizzle blueChannelSwizzle = setScanoutPointerCommand::dcs_blue);
	HRESULT __stdcall DeviceDownloadEndOfFrameStats(const gpuvoid* const statsMemory, DWORD* const outReadbackStatsData);
	HRESULT __stdcall DeviceEndFrame();

	HRESULT __stdcall DeviceIssueQuery(const gpuvoid* const queryAddress, const bool isEndEvent, const eQueryType queryType);

	HRESULT __stdcall DeviceSetIndexBuffer(const gpuvoid* const indexBufferMemory, const unsigned indexBuffer16LengthIndices, const eIndexFormat indexFormat);

	HRESULT __stdcall DeviceLoadVertexShader(const gpuvoid* const vertexShaderMemory, const unsigned short numShaderTokensToLoad, const bool forceLoadVertexShader = false, const unsigned short targetAddressToLoadTo = 0);
	HRESULT __stdcall DeviceSetVertexShaderStartAddr(const unsigned short shaderStartAddress);

	HRESULT __stdcall DeviceSetVertexStreamData(const gpuvoid* const vertexStreamData, const unsigned vertexBufferLengthBytes, const BYTE dwordCount, const BYTE streamID, 
		const bool isD3DCOLOR, const BYTE shaderInputRegIndex, const BYTE dwordStride, const BYTE dwordOffset, const BYTE numVertexStreamsTotal);

	HRESULT __stdcall DeviceSetConstantData(const gpuvoid* const constantBufferMemory, const float4* const baseCPUFloat4RegisterFile, const BYTE startingRegisterIndex, const BYTE numFloat4Registers);

	HRESULT __stdcall DeviceSetConstantDataSingleSpecial(const float4& registerData, const BYTE registerIndex);

	HRESULT __stdcall DeviceEnableShaderDebuggingForNextDrawCall(const gpuvoid* registerFileDumpAddress);

	HRESULT __stdcall DeviceDrawIndexedPrimitive(const D3DPRIMITIVETYPE primType, const unsigned primitiveCount, const unsigned startIndex = 0, const int BaseVertexIndex = 0);
	HRESULT __stdcall DeviceDrawPrimitive(const D3DPRIMITIVETYPE primType, const unsigned primitiveCount, const unsigned StartVertex = 0);

	// Runs a command list on the GPU's command processor
	HRESULT __stdcall DeviceExecuteCommandList(const GPUCommandList& commandList);

	// Runs a command list on the CPU, rather than on the GPU
	HRESULT __stdcall DeviceEmulateExecuteCommandList(const GPUCommandList& commandList);

	// Call this function before using a render target as a texture, or before Present()'ing the render target as a new back buffer
	HRESULT __stdcall DeviceFlushROPCache();

	HRESULT __stdcall DeviceWaitForIdle(const waitForDeviceIdleCommand::waitForDeviceSubsystem waitFlags = waitForDeviceIdleCommand::waitForFullPipelineFlush, const bool printStatus = false);

	const bool GetSyncEveryCommand() const
	{
		return syncEveryCall;
	}

	void SetSyncEveryCommand(const bool newSyncEveryCommand)
	{
		syncEveryCall = newSyncEveryCommand;
	}

	const bool GetDisallowDeviceStateCaching() const
	{
		return disallowDeviceStateCaching;
	}

	void SetDisallowDeviceStateCaching(const bool newDisallowDeviceStateCaching)
	{
		disallowDeviceStateCaching = newDisallowDeviceStateCaching;
	}

	const bool PacketIsValidForRecording(const command::ePacketType packetType) const;

	void ResetInvalidateDeviceState();

	const bool DoCacheDeviceState() const
	{
		// Only enable device state caching if we are not recording a command list!
		return currentlyRecordingCommandList == NULL && !disallowDeviceStateCaching;
	}

	const bool DoSyncEveryCall() const
	{
		// Do not sync calls during command list recording!
		return (currentlyRecordingCommandList == NULL) && syncEveryCall;
	}

	void BeginRecordingCommandList(GPUCommandList* const newCommandList);
	void CompleteRecordingCommandList();
	void TerminateAbortRecordingCommandList();

protected:
	void __stdcall AssociateComms(IBaseDeviceComms* const baseComms);
	const bool __stdcall ValidateDeviceStateIsSetForDraw() const;
	HRESULT SendOrStorePacket(const command* const sendPacket);

private:
	IBaseDeviceComms* deviceComms = nullptr;

	GPUDeviceState currentCachedState;

	GPUCommandList* currentlyRecordingCommandList = nullptr;

	bool disallowDeviceStateCaching = false;
	
	bool syncEveryCall = 
#ifdef _DEBUG
		true;
#else
		false;
#endif
};

// Assorted helper functions:
const bool IsFloatRegCompressible(const float4& reg);
const bool IsFloatCompressible(const float component);
