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

struct GPUDeviceState
{
	const gpuvoid* deviceCachedSetTexture = nullptr;
	const gpuvoid* deviceCachedScanoutBuffer = nullptr;
	const gpuvoid* deviceSetIndexBuffer = nullptr; // This is the *pre*transform index cache
	const gpuvoid* deviceCachedRenderTarget = nullptr;
	const gpuvoid* deviceCachedIAIndexBuffer = nullptr; // This is the *post*transform index cache
	const gpuvoid* deviceCachedVertexShader = nullptr;
	unsigned texStateWidth = 0;
	unsigned texStateHeight = 0;
	unsigned texSetWidth = 0;
	unsigned texSetHeight = 0;
	unsigned deviceCachedSetVertexStartAddress = 0x0000;
	eCullMode deviceCachedCullMode = eCullMode_NUM_CULL_MODES;
	ePrimTopology deviceCachedPrimTop = primTop_NUM_PRIM_TOPOLOGIES;
	eStripCutType deviceCachedStripCut = sct_NUM_STRIP_CUT_TYPES;
	eIndexFormat deviceCachedIndexFormat = ibfmt_NUM_INDEX_FORMATS;
	eTexFormat deviceCachedTexFormat = eTexFmtNumFormats;
	eBlendMode deviceCachedBlendMode = blendModeMaxBlendModes;
	eBlendMask deviceCachedWriteMask = (eBlendMask)0xFF;
	eTexFilterMode deviceCachedTexFilter = TF_MAXFILTER;
	eTexChannelMUX deviceCachedTexR = tcm_MAX;
	eTexChannelMUX deviceCachedTexG = tcm_MAX;
	eTexChannelMUX deviceCachedTexB = tcm_MAX;
	eTexChannelMUX deviceCachedTexA = tcm_MAX;
	combinerMode deviceCachedCombinerModeColor = cbm_MAX_NUM_COMBINER_MODES;
	combinerMode deviceCachedCombinerModeAlpha = cbm_MAX_NUM_COMBINER_MODES;
	bool deviceCachedZTestEnabled = false;
	bool deviceCachedZWriteEnabled = false;
	bool deviceCachedAlphaTestEnabled = false;
	BYTE deviceCachedAlphaTestRefVal = 0x00;
	eCmpFunc deviceCachedAlphaTestCmpFunc = cmp_MAX_CMP_FUNCS;
	CachedVertexStream deviceCachedVertexStreams[GPU_MAX_NUM_VERTEX_STREAMS];
	float4 deviceCachedConstantRegisters[GPU_SHADER_MAX_NUM_CONSTANT_FLOAT_REG];

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

	// Not yet implemented!
	HRESULT __stdcall DeviceClearDepthStencil(gpuvoid* const zStencilMemory, const bool bDoClearDepth, const bool bDoClearStencil, 
		const float clearDepth = 1.0f, const BYTE clearStencil = 0x00);

	HRESULT __stdcall DeviceSetTexture(const gpuvoid* const textureMemory, const eTexFormat textureFormat, const unsigned texWidth, const unsigned texHeight);

	HRESULT __stdcall DeviceSetTextureState(const unsigned texWidth, const unsigned texHeight, const eTexFilterMode filterMode, 
		const eTexChannelMUX rChannel, const eTexChannelMUX gChannel, const eTexChannelMUX bChannel, const eTexChannelMUX aChannel, const combinerMode cbModeColor, const combinerMode cbModeAlpha);

	HRESULT __stdcall DeviceSetBlendState(gpuvoid* const renderTargetMemory, const eBlendMode blendingMode, const eBlendMask writeMask, const bool zTestEnabled, const bool zWriteEnabled, 
		const bool alphaTestEnabled, const BYTE alphaTestRefVal, const eCmpFunc alphaTestCmpFunc);

	HRESULT __stdcall DeviceSetIAState(const eCullMode cullMode, const ePrimTopology primTopology, const eStripCutType stripCut, const eIndexFormat indexFormat, const gpuvoid* const indexBufferBaseAddr);

	HRESULT __stdcall DeviceSetScanoutBuffer(const gpuvoid* const renderTargetMemory, const bool bEnableScanout = true);
	HRESULT __stdcall DeviceDownloadEndOfFrameStats(const gpuvoid* const statsMemory, DWORD* const outReadbackStatsData);

	HRESULT __stdcall DeviceSetIndexBuffer(const gpuvoid* const indexBufferMemory, const unsigned indexBuffer16LengthIndices, const eIndexFormat indexFormat);

	HRESULT __stdcall DeviceLoadVertexShader(const gpuvoid* const vertexShaderMemory, const unsigned short numShaderTokensToLoad, const bool forceLoadVertexShader = false, const unsigned short targetAddressToLoadTo = 0);
	HRESULT __stdcall DeviceSetVertexShaderStartAddr(const unsigned short shaderStartAddress);

	HRESULT __stdcall DeviceSetVertexStreamData(const gpuvoid* const vertexStreamData, const unsigned vertexBufferLengthBytes, const BYTE dwordCount, const BYTE streamID, 
		const bool isD3DCOLOR, const BYTE shaderInputRegIndex, const BYTE dwordStride, const BYTE dwordOffset, const BYTE numVertexStreamsTotal);

	HRESULT __stdcall DeviceSetConstantData(const gpuvoid* const constantBufferMemory, const float4* const baseCPUFloat4RegisterFile, const BYTE startingRegisterIndex, const BYTE numFloat4Registers);

	HRESULT __stdcall DeviceSetConstantDataSingleSpecial(const float4& registerData, const BYTE registerIndex);

	HRESULT __stdcall DeviceEnableShaderDebuggingForNextDrawCall(const gpuvoid* registerFileDumpAddress);

	HRESULT __stdcall DeviceDrawIndexedPrimitive(const D3DPRIMITIVETYPE primType, const unsigned primitiveCount);
	HRESULT __stdcall DeviceDrawPrimitive(const D3DPRIMITIVETYPE primType, const unsigned primitiveCount);

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
