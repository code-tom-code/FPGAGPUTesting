#pragma once

#include "GPUAllocator.h"
#include "IBaseDeviceComms.h"
#include "PacketDefs.h"
#include "GPUCommandList.h"

typedef unsigned long DWORD;
typedef DWORD D3DCOLOR;
typedef unsigned char BYTE;
typedef enum _D3DPRIMITIVETYPE D3DPRIMITIVETYPE;

typedef enum _D3DCMPFUNC D3DCMPFUNC;
const eCmpFunc ConvertToDeviceCmpFunc(const D3DCMPFUNC cmpFunc);

struct GPUDeviceState
{
	gpuvoid* deviceCachedSetTexture = nullptr;
	gpuvoid* deviceCachedScanoutBuffer = nullptr;
	gpuvoid* deviceSetIndexBuffer = nullptr;
	gpuvoid* deviceCachedRenderTarget = nullptr;
	unsigned texStateWidth = 0;
	unsigned texStateHeight = 0;
	unsigned texSetWidth = 0;
	unsigned texSetHeight = 0;
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

	void ResetFields(const GPUDeviceState& defaultRhs)
	{
		gpuvoid* const savedCachedScanout = deviceCachedScanoutBuffer;
		gpuvoid* const savedCachedRenderTarget = deviceCachedRenderTarget;

		*this = defaultRhs;

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

	HRESULT __stdcall DeviceSetTexture(gpuvoid* const textureMemory, const eTexFormat textureFormat, const unsigned texWidth, const unsigned texHeight);

	HRESULT __stdcall DeviceSetTextureState(const unsigned texWidth, const unsigned texHeight, const eTexFilterMode filterMode, 
		const eTexChannelMUX rChannel, const eTexChannelMUX gChannel, const eTexChannelMUX bChannel, const eTexChannelMUX aChannel, const combinerMode cbModeColor, const combinerMode cbModeAlpha);

	HRESULT __stdcall DeviceSetBlendState(gpuvoid* const renderTargetMemory, const eBlendMode blendingMode, const eBlendMask writeMask, const bool zTestEnabled, const bool zWriteEnabled, 
		const bool alphaTestEnabled, const BYTE alphaTestRefVal, const eCmpFunc alphaTestCmpFunc);

	HRESULT __stdcall DeviceSetIAState(const eCullMode cullMode, const ePrimTopology primTopology, const eStripCutType stripCut, const eIndexFormat indexFormat);

	HRESULT __stdcall DeviceSetScanoutBuffer(gpuvoid* const renderTargetMemory, const bool bEnableScanout = true);
	HRESULT __stdcall DeviceDownloadEndOfFrameStats(gpuvoid* const statsMemory, DWORD* const outReadbackStatsData);

	HRESULT __stdcall DeviceSetIndexBuffer(gpuvoid* const indexBufferMemory, const unsigned indexBuffer16LengthIndices);

	HRESULT __stdcall DeviceSetVertexStreamData(gpuvoid* const vertexStreamData, const eLoadVertexStreamType vertexDataType, const unsigned numElementsToLoad, const bool allElementsAreIdentical, const DWORD identicalElement);

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

	const bool PacketIsValidForRecording(const command::ePacketType packetType) const;

	void ResetInvalidateDeviceState();

	const bool DoCacheDeviceState() const
	{
		// Only enable device state caching if we are not recording a command list!
		return currentlyRecordingCommandList == NULL;
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
	
	bool syncEveryCall = 
#ifdef _DEBUG
		true;
#else
		false;
#endif
};
