#include "IBaseGPUDevice.h"
#include <intrin.h>
#include <stdio.h>
#include "../IDirect3DSurface9Hook.h"
#include "GPUCommandList.h"

const eCmpFunc ConvertToDeviceCmpFunc(const D3DCMPFUNC cmpFunc)
{
	if (cmpFunc == 0)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return cmp_always;
	}

	if (cmpFunc > D3DCMP_ALWAYS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return cmp_always;
	}

	return (const eCmpFunc)(cmpFunc - 1);
}

static const bool ValidateAddress(const gpuvoid* const deviceMemoryPtr)
{
	if ( (const DWORD)deviceMemoryPtr < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Null pointer passed!
#endif
		return false;
	}
	if ( (const DWORD)deviceMemoryPtr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Out of range pointer!
#endif
		return false;
	}
	return true;
}

static const bool ValidateTextureDimension(const unsigned texDim)
{
	if (texDim == 0) // 0-sized textures are never allowed!
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

	if (texDim > 128u) // Currently, 128x128 is the maximum supported texture resolution
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

	if (__popcnt(texDim) > 1) // Only exact powers of 2 are currently supported!
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

	return true;
}

static const bool ValidateTexChannelMUX(const eTexChannelMUX texChannel)
{
	if (texChannel >= tcm_MAX)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

	return true;
}

static const BYTE GetLog2TexDimension(const unsigned inTexDim)
{
	switch (inTexDim)
	{
	case 1:
		return 0;
	case 2:
		return 1;
	case 4:
		return 2;
	case 8:
		return 3;
	case 16:
		return 4;
	case 32:
		return 5;
	case 64:
		return 6;
	case 128:
		return 7;
	default:
#ifdef _DEBUG
		__debugbreak();
#endif
		return 0;
	}
}

HRESULT __stdcall IBaseGPUDevice::DeviceClearRendertarget(gpuvoid* const renderTargetMemory, const D3DCOLOR clearColor)
{
	if (!ValidateAddress(renderTargetMemory) )
		return E_INVALIDARG;

	if (DoCacheDeviceState() )
	{
		if (!currentCachedState.deviceCachedRenderTarget)
		{
#ifdef _DEBUG
			__debugbreak(); // Don't call this function before setting a render target first!
#endif
			return E_INVALIDARG;
		}
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(renderTargetMemory, 640 * 480 * sizeof(D3DCOLOR) ) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	clearBackbufferCommand clearCommand;
	clearCommand.renderTargetAddress = (const DWORD)renderTargetMemory;
	clearCommand.writeColorRGBA = D3DColorToRGBAColor(clearColor); // Swizzle D3DCOLOR BGRA -> RGBA
	clearCommand.checksum = command::ComputeChecksum(&clearCommand, sizeof(clearCommand) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&clearCommand, sizeof(clearCommand) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT clearHR = SendOrStorePacket(&clearCommand);
	if (FAILED(clearHR) )
		return clearHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return clearHR;
}

// Not yet implemented!
HRESULT __stdcall IBaseGPUDevice::DeviceClearDepthStencil(gpuvoid* const zStencilMemory, const bool bDoClearDepth, const bool bDoClearStencil, 
	const float clearDepth/* = 1.0f*/, const BYTE clearStencil/* = 0x00*/)
{
	if (!ValidateAddress(zStencilMemory) )
		return E_INVALIDARG;

	// Not yet implemented!
	return E_NOTIMPL;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetTexture(gpuvoid* const textureMemory, const eTexFormat textureFormat, const unsigned texWidth, const unsigned texHeight)
{
	if (!ValidateAddress(textureMemory) )
		return E_INVALIDARG;

	if (textureFormat >= eTexFmtNumFormats)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (!ValidateTextureDimension(texWidth) )
		return E_INVALIDARG;

	if (!ValidateTextureDimension(texHeight) )
		return E_INVALIDARG;

	if (texWidth * texHeight > 0xFFFF)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(textureMemory, texWidth * texHeight * GetSizePerPixel(textureFormat) ) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() && textureFormat == currentCachedState.deviceCachedTexFormat && currentCachedState.deviceCachedSetTexture == textureMemory && currentCachedState.texSetWidth == texWidth && currentCachedState.texSetHeight == texHeight)
		return S_OK;

	loadTexCacheDataCommand loadTexCache;
	loadTexCache.sourceRAMAddr = (const DWORD)textureMemory;
	loadTexCache.loadSourceFormat = textureFormat;
	loadTexCache.loadTexelCount = (const USHORT)(texWidth * texHeight);
	loadTexCache.checksum = command::ComputeChecksum(&loadTexCache, sizeof(loadTexCache) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&loadTexCache, sizeof(loadTexCache) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRet = SendOrStorePacket(&loadTexCache);
	if (SUCCEEDED(hRet) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedTexFormat = textureFormat;
		currentCachedState.deviceCachedSetTexture = textureMemory;
		currentCachedState.texSetWidth = texWidth;
		currentCachedState.texSetHeight = texHeight;
	}
	if (FAILED(hRet) )
		return hRet;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetTextureState(const unsigned texWidth, const unsigned texHeight, const eTexFilterMode filterMode, 
		const eTexChannelMUX rChannel, const eTexChannelMUX gChannel, const eTexChannelMUX bChannel, const eTexChannelMUX aChannel, const combinerMode cbModeColor, const combinerMode cbModeAlpha)
{
	if (!ValidateTextureDimension(texWidth) )
		return E_INVALIDARG;

	if (!ValidateTextureDimension(texHeight) )
		return E_INVALIDARG;

	if (filterMode >= TF_MAXFILTER)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (!ValidateTexChannelMUX(rChannel) )
		return E_INVALIDARG;

	if (!ValidateTexChannelMUX(gChannel) )
		return E_INVALIDARG;

	if (!ValidateTexChannelMUX(bChannel) )
		return E_INVALIDARG;

	if (!ValidateTexChannelMUX(aChannel) )
		return E_INVALIDARG;

	if (cbModeColor >= cbm_MAX_NUM_COMBINER_MODES)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (cbModeAlpha >= cbm_MAX_NUM_COMBINER_MODES)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() && currentCachedState.texStateWidth == texWidth && currentCachedState.texStateHeight == texHeight && currentCachedState.deviceCachedTexFilter == filterMode && 
		currentCachedState.deviceCachedTexR == rChannel && currentCachedState.deviceCachedTexG == gChannel && currentCachedState.deviceCachedTexB == bChannel && currentCachedState.deviceCachedTexA == aChannel && 
		currentCachedState.deviceCachedCombinerModeColor == cbModeColor && currentCachedState.deviceCachedCombinerModeAlpha == cbModeAlpha)
		return S_OK;

	setTextureStateCommand setTextureState;
	setTextureState.texWidth = (const BYTE)texWidth;//GetLog2TexDimension(texWidth); // Command processor will perform the log2 operation on these for us
	setTextureState.texHeight = (const BYTE)texHeight;//GetLog2TexDimension(texHeight);
	setTextureState.filterMode = filterMode;
	setTextureState.channel0 = rChannel;
	setTextureState.channel1 = gChannel;
	setTextureState.channel2 = bChannel;
	setTextureState.channel3 = aChannel;
	setTextureState.cbModeColor = cbModeColor;
	setTextureState.cbModeAlpha = cbModeAlpha;
	setTextureState.checksum = command::ComputeChecksum(&setTextureState, sizeof(setTextureState) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setTextureState, sizeof(setTextureState) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRet = SendOrStorePacket(&setTextureState);
	if (SUCCEEDED(hRet) && DoCacheDeviceState() )
	{
		currentCachedState.texStateWidth = texWidth;
		currentCachedState.texStateHeight = texHeight;
		currentCachedState.deviceCachedTexFilter = filterMode;
		currentCachedState.deviceCachedTexR = rChannel;
		currentCachedState.deviceCachedTexG = gChannel;
		currentCachedState.deviceCachedTexB = bChannel;
		currentCachedState.deviceCachedTexA = aChannel;
		currentCachedState.deviceCachedCombinerModeColor = cbModeColor;
		currentCachedState.deviceCachedCombinerModeAlpha = cbModeAlpha;
	}
	if (FAILED(hRet) )
		return hRet;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetBlendState(gpuvoid* const renderTargetMemory, const eBlendMode blendingMode, const eBlendMask writeMask, const bool zTestEnabled, const bool zWriteEnabled, 
		const bool alphaTestEnabled, const BYTE alphaTestRefVal, const eCmpFunc alphaTestCmpFunc)
{
	if (!ValidateAddress(renderTargetMemory) )
		return E_INVALIDARG;

	if (blendingMode >= blendModeMaxBlendModes)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (writeMask > wm_writeAll)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (alphaTestCmpFunc >= cmp_MAX_CMP_FUNCS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(renderTargetMemory, 640 * 480 * sizeof(D3DCOLOR) ) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() && currentCachedState.deviceCachedRenderTarget == renderTargetMemory && currentCachedState.deviceCachedBlendMode == blendingMode && currentCachedState.deviceCachedWriteMask == writeMask && currentCachedState.deviceCachedZTestEnabled == zTestEnabled && currentCachedState.deviceCachedZWriteEnabled == zWriteEnabled &&
		currentCachedState.deviceCachedAlphaTestEnabled == alphaTestEnabled && currentCachedState.deviceCachedAlphaTestRefVal == alphaTestRefVal && currentCachedState.deviceCachedAlphaTestCmpFunc == alphaTestCmpFunc)
		return S_OK;

	setBlendStateCommand setBlendState;
	setBlendState.renderTargetBaseAddress = (const DWORD)renderTargetMemory;
	setBlendState.newBlendType = blendingMode;
	setBlendState.writeMask = writeMask;
	setBlendState.zTestEnabled = zTestEnabled;
	setBlendState.zWriteEnabled = zWriteEnabled;
	setBlendState.alphaTestEnabled = alphaTestEnabled;
	setBlendState.alphaTestRefValue = alphaTestRefVal;
	setBlendState.alphaTestFunc = alphaTestCmpFunc;
	setBlendState.checksum = command::ComputeChecksum(&setBlendState, sizeof(setBlendState) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setBlendState, sizeof(setBlendState) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRet = SendOrStorePacket(&setBlendState);
	if (SUCCEEDED(hRet) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedRenderTarget = renderTargetMemory;
		currentCachedState.deviceCachedBlendMode = blendingMode;
		currentCachedState.deviceCachedWriteMask = writeMask;
		currentCachedState.deviceCachedZTestEnabled = zTestEnabled;
		currentCachedState.deviceCachedZWriteEnabled = zWriteEnabled;
		currentCachedState.deviceCachedAlphaTestEnabled = alphaTestEnabled;
		currentCachedState.deviceCachedAlphaTestRefVal = alphaTestRefVal;
		currentCachedState.deviceCachedAlphaTestCmpFunc = alphaTestCmpFunc;
	}
	if (FAILED(hRet) )
		return hRet;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetIAState(const eCullMode cullMode, const ePrimTopology primTopology, const eStripCutType stripCut, const eIndexFormat indexFormat)
{
	if (cullMode >= eCullMode_NUM_CULL_MODES)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (primTopology >= primTop_NUM_PRIM_TOPOLOGIES)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (stripCut >= sct_NUM_STRIP_CUT_TYPES)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (indexFormat >= ibfmt_NUM_INDEX_FORMATS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (stripCut != sct_CutDisabled && indexFormat == ibfmt_noIndices)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG; // Can only use strip cuts when rendering using indexed draw calls
	}

	if (DoCacheDeviceState() && cullMode == currentCachedState.deviceCachedCullMode && primTopology == currentCachedState.deviceCachedPrimTop && stripCut == currentCachedState.deviceCachedStripCut && indexFormat == currentCachedState.deviceCachedIndexFormat)
		return S_OK;

	setIAStateCommand setIACmd;
	setIACmd.cull = cullMode;
	setIACmd.topology = primTopology;
	setIACmd.stripCut = stripCut;
	setIACmd.indexFmt = indexFormat;
	setIACmd.checksum = command::ComputeChecksum(&setIACmd, sizeof(setIACmd) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setIACmd, sizeof(setIACmd) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRet = SendOrStorePacket(&setIACmd);
	if (SUCCEEDED(hRet) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedCullMode = cullMode;
		currentCachedState.deviceCachedPrimTop = primTopology;
		currentCachedState.deviceCachedStripCut = stripCut;
		currentCachedState.deviceCachedIndexFormat = indexFormat;
	}
	if (FAILED(hRet) )
		return hRet;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetScanoutBuffer(gpuvoid* const renderTargetMemory, const bool bEnableScanout/* = true*/)
{
	if (!ValidateAddress(renderTargetMemory) )
		return E_INVALIDARG;

	if (!ValidateMemoryRangeExistsInsideAllocation(renderTargetMemory, 640 * 480 * sizeof(D3DCOLOR) ) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() && currentCachedState.deviceCachedScanoutBuffer == renderTargetMemory)
		return S_OK;

	setScanoutPointerCommand setScanoutCmd;
	setScanoutCmd.bufferAddress = (const DWORD)renderTargetMemory;
	setScanoutCmd.displayMode = setScanoutPointerCommand::dm_640x480_60Hz;
	setScanoutCmd.scanoutEnable = bEnableScanout ? 0xFF : 0x00;
	setScanoutCmd.checksum = command::ComputeChecksum(&setScanoutCmd, sizeof(setScanoutCmd) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setScanoutCmd, sizeof(setScanoutCmd) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRet = SendOrStorePacket(&setScanoutCmd);
	if (SUCCEEDED(hRet) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedScanoutBuffer = renderTargetMemory;
	}
	if (FAILED(hRet) )
		return hRet;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

HRESULT __stdcall IBaseGPUDevice::DeviceDownloadEndOfFrameStats(gpuvoid* const statsMemory, DWORD* const outReadbackStatsData)
{
	if (currentlyRecordingCommandList != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Illegal to call this function while we are recording a command list!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateAddress(statsMemory) )
		return E_INVALIDARG;

	if (!ValidateMemoryRangeExistsInsideAllocation(statsMemory, sizeof(DWORD) * endFrameStatsResponse::TotalAllStatsCount) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (currentlyRecordingCommandList != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Cannot record this packet into a command list!
#endif
		return E_INVALIDARG;
	}

	endFrameCommand endFrameCmd;
	endFrameCmd.statsMemoryAddress = (const DWORD)statsMemory;
	endFrameCmd.checksum = command::ComputeChecksum(&endFrameCmd, sizeof(endFrameCmd) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&endFrameCmd, sizeof(endFrameCmd) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRet = SendOrStorePacket(&endFrameCmd);
	if (FAILED(hRet) )
		return hRet;

	if (DoSyncEveryCall() )
		DeviceWaitForIdle();

	// Wait for the memory controller to be done working before we try to read back our stats data from the frame
	DeviceWaitForIdle(waitForDeviceIdleCommand::waitForMemControllerIdle);

	return deviceComms->ReadFromDevice(statsMemory, outReadbackStatsData, sizeof(DWORD) * endFrameStatsResponse::TotalAllStatsCount);
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetIndexBuffer(gpuvoid* const indexBufferMemory, const unsigned indexBuffer16LengthIndices)
{
	if (!ValidateAddress(indexBufferMemory) )
		return E_INVALIDARG;

	if (indexBuffer16LengthIndices == 0)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (indexBuffer16LengthIndices > 2048) // The max size of the index16 IBCache is currently 2048 elements
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(indexBufferMemory, indexBuffer16LengthIndices * sizeof(USHORT) ) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() && currentCachedState.deviceSetIndexBuffer == indexBufferMemory) // TODO: DO we actually want to cache this? What if we have a dynamic index buffer?
		return S_OK;

	loadVertexStreamDataCommand loadStreamData;
	loadStreamData.payload0.sourceRAMAddr = (const DWORD)indexBufferMemory;
	loadStreamData.streamType = vst_index;
	loadStreamData.loadNumElements = static_cast<const USHORT>(indexBuffer16LengthIndices);
	loadStreamData.isDataConstant = false;
	loadStreamData.checksum = command::ComputeChecksum(&loadStreamData, sizeof(loadStreamData) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&loadStreamData, sizeof(loadStreamData) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRet = SendOrStorePacket(&loadStreamData);
	if (SUCCEEDED(hRet) && DoCacheDeviceState() )
	{
		currentCachedState.deviceSetIndexBuffer = indexBufferMemory;
	}
	if (FAILED(hRet) )
		return hRet;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetVertexStreamData(gpuvoid* const vertexStreamData, const eLoadVertexStreamType vertexDataType, const unsigned numElementsToLoad, const bool allElementsAreIdentical, const DWORD identicalElement)
{
	if (!ValidateAddress(vertexStreamData) )
		return E_INVALIDARG;

	if (numElementsToLoad == 0)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (numElementsToLoad > 1024) // Currently most of our vertex data caches are limited at 1k elements each in order to save on BRAM
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (vertexDataType >= vst_eLoadVertStreamNumTypes)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(vertexStreamData, numElementsToLoad * GetSizePerVertexData(vertexDataType) ) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	loadVertexStreamDataCommand loadStreamData;
	if (allElementsAreIdentical)
		loadStreamData.payload0.constantData = identicalElement;
	else
		loadStreamData.payload0.sourceRAMAddr = (const DWORD)vertexStreamData;
	loadStreamData.streamType = vertexDataType;
	loadStreamData.loadNumElements = static_cast<const USHORT>(numElementsToLoad);
	loadStreamData.isDataConstant = allElementsAreIdentical;
	loadStreamData.checksum = command::ComputeChecksum(&loadStreamData, sizeof(loadStreamData) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&loadStreamData, sizeof(loadStreamData) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT loadStreamHR = SendOrStorePacket(&loadStreamData);
	if (FAILED(loadStreamHR) )
		return loadStreamHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return loadStreamHR;
}

static const bool IsIAStateValid(const eCullMode cullMode, const ePrimTopology primTop, const eStripCutType stripCut, const eIndexFormat indexFormat)
{
	return (cullMode < eCullMode_NUM_CULL_MODES) &&
		(primTop < primTop_NUM_PRIM_TOPOLOGIES) &&
		(stripCut < sct_NUM_STRIP_CUT_TYPES) &&
		(indexFormat < ibfmt_NUM_INDEX_FORMATS);
}

static const unsigned GetIndexCountFromPrimitiveCount(const D3DPRIMITIVETYPE primType, const unsigned primitiveCount)
{
	switch (primType)
	{
	case D3DPT_POINTLIST:
		return primitiveCount;
	case D3DPT_LINELIST:
		return primitiveCount * 2;
	case D3DPT_LINESTRIP:
		return primitiveCount + 1;
	default:
#ifdef _DEBUG
		__debugbreak(); // Unsupported primitive type!
#endif
	case D3DPT_TRIANGLELIST:
		return primitiveCount * 3;
	case D3DPT_TRIANGLESTRIP:
	case D3DPT_TRIANGLEFAN:
		return primitiveCount + 2;
	}
}

HRESULT __stdcall IBaseGPUDevice::DeviceDrawIndexedPrimitive(const D3DPRIMITIVETYPE primType, const unsigned primitiveCount)
{
	if (DoCacheDeviceState() )
	{
		if (!ValidateDeviceStateIsSetForDraw() )
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_INVALIDARG;
		}

		if (currentCachedState.deviceSetIndexBuffer == NULL)
		{
#ifdef _DEBUG
			__debugbreak(); // Must set an index buffer before calling this function!
#endif
			return E_INVALIDARG;
		}

		if (!IsIAStateValid(currentCachedState.deviceCachedCullMode, currentCachedState.deviceCachedPrimTop, currentCachedState.deviceCachedStripCut, currentCachedState.deviceCachedIndexFormat) )
		{
#ifdef _DEBUG
			__debugbreak(); // Must call DeviceSetIAState() before calling a draw call!
#endif
			return E_INVALIDARG;
		}
	}

	const unsigned indexCount = GetIndexCountFromPrimitiveCount(primType, primitiveCount);

	if (indexCount == 0)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (indexCount >= 2048) // The index cache is currently only 2048 index16 elements long. Don't read off the end of it!
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	drawIndexedCommand drawCommand;
	drawCommand.numIndices = (const USHORT)(indexCount);
	drawCommand.useIndices = 0xFF;
	drawCommand.checksum = command::ComputeChecksum(&drawCommand, sizeof(drawCommand) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&drawCommand, sizeof(drawCommand) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT drawHR = SendOrStorePacket(&drawCommand);
	if (FAILED(drawHR) )
		return drawHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return drawHR;
}

HRESULT __stdcall IBaseGPUDevice::DeviceDrawPrimitive(const D3DPRIMITIVETYPE primType, const unsigned primitiveCount)
{
	if (DoCacheDeviceState() )
	{
		if (!ValidateDeviceStateIsSetForDraw() )
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_INVALIDARG;
		}

		if (!IsIAStateValid(currentCachedState.deviceCachedCullMode, currentCachedState.deviceCachedPrimTop, currentCachedState.deviceCachedStripCut, currentCachedState.deviceCachedIndexFormat) )
		{
#ifdef _DEBUG
			__debugbreak(); // Must call DeviceSetIAState() before calling a draw call!
#endif
			return E_INVALIDARG;
		}
	}

	if (primitiveCount == 0)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	const unsigned indexCount = GetIndexCountFromPrimitiveCount(primType, primitiveCount);
	if (indexCount >= 2048)
	{
#ifdef _DEBUG
		__debugbreak(); // The index cache is currently only 2048 index16 elements long. Don't read off the end of it!
#endif
		return E_INVALIDARG;
	}

	drawIndexedCommand drawCommand;
	drawCommand.numIndices = (const USHORT)indexCount;
	drawCommand.useIndices = 0x00;
	drawCommand.checksum = command::ComputeChecksum(&drawCommand, sizeof(drawCommand) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&drawCommand, sizeof(drawCommand) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT drawHR = SendOrStorePacket(&drawCommand);
	if (FAILED(drawHR) )
		return drawHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return drawHR;
}

HRESULT __stdcall IBaseGPUDevice::DeviceExecuteCommandList(const GPUCommandList& commandList)
{
	// Must allocate + upload command list before trying to execute it!
	if (!ValidateAddress(commandList.gpuAllocatedAddress) )
		return E_INVALIDARG;

	if ( (const size_t)(commandList.gpuAllocatedAddress) % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Command-lists must be 32-byte aligned at the minimum!
#endif
		return E_INVALIDARG;
	}

	if (commandList.commands.empty() )
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot execute an empty command list
#endif
		return E_INVALIDARG;
	}

	if (commandList.commands.size() > 0xFFFE)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot run more than this many commands in a single command list!
#endif
		return E_INVALIDARG;
	}

	if (currentlyRecordingCommandList != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Illegal to call this function while we are recording a command list!
#endif
		return E_INVALIDARG;
	}

	runCommandListCommand execCommandListCommand;
	execCommandListCommand.commandListStartAddress = (const DWORD)commandList.gpuAllocatedAddress;
	execCommandListCommand.numCommands = (const USHORT)(commandList.commands.size() );
	execCommandListCommand.checksum = command::ComputeChecksum(&execCommandListCommand, sizeof(execCommandListCommand) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&execCommandListCommand, sizeof(execCommandListCommand) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT runCommandListHR = SendOrStorePacket(&execCommandListCommand);
	if (FAILED(runCommandListHR) )
		return runCommandListHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return runCommandListHR;
}

HRESULT __stdcall IBaseGPUDevice::DeviceEmulateExecuteCommandList(const GPUCommandList& commandList)
{
	// Must allocate + upload command list before trying to execute it!
	if (!ValidateAddress(commandList.gpuAllocatedAddress) )
		return E_INVALIDARG;

	if ( (const size_t)(commandList.gpuAllocatedAddress) % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Command-lists must be 32-byte aligned at the minimum!
#endif
		return E_INVALIDARG;
	}

	if (commandList.commands.empty() )
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot execute an empty command list
#endif
		return E_INVALIDARG;
	}

	if (commandList.commands.size() > 0xFFFE)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot run more than this many commands in a single command list!
#endif
		return E_INVALIDARG;
	}

	if (currentlyRecordingCommandList != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Illegal to call this function while we are recording a command list!
#endif
		return E_INVALIDARG;
	}

	const unsigned numCommands = commandList.commands.size();
	std::vector<SimplifiedCommandPacket> simplifiedCommandsTemp;
	simplifiedCommandsTemp.resize(numCommands);
	for (unsigned x = 0; x < numCommands; ++x)
	{
		const genericCommand& thisInFullCommand = commandList.commands[x];
		SimplifiedCommandPacket& thisOutSimpleCommand = simplifiedCommandsTemp[x];
		GPUCommandList::ConvertCommandPacketToSimplifiedCommandPacket(&thisInFullCommand, &thisOutSimpleCommand);
	}

	const unsigned numConvertedCommands = simplifiedCommandsTemp.size();
	std::vector<genericCommand> reconvertedFullCommandsTemp;
	reconvertedFullCommandsTemp.resize(numConvertedCommands);
	for (unsigned y = 0; y < numConvertedCommands; ++y)
	{
		const SimplifiedCommandPacket& thisInSimpleCommand = simplifiedCommandsTemp[y];
		genericCommand& thisOutFullCommand = reconvertedFullCommandsTemp[y];
		GPUCommandList::ConvertSimplifiedCommandPacketToCommandPacket(&thisInSimpleCommand, &thisOutFullCommand);
	}

	HRESULT retHR = S_OK;
	for (unsigned z = 0; z < numConvertedCommands; ++z)
	{
		const genericCommand& thisFullCmd = reconvertedFullCommandsTemp[z];
		if (command::IsValidPacket(&thisFullCmd, sizeof(thisFullCmd) ) )
		{
			retHR = SendOrStorePacket(&thisFullCmd);
			if (FAILED(retHR) )
			{
#ifdef _DEBUG
				__debugbreak();
#endif
				return retHR;
			}
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // There's an error somewhere in our conversion process! It's not supposed to be lossy! D:
#endif
		}
	}

	return retHR;
}

void __stdcall IBaseGPUDevice::AssociateComms(IBaseDeviceComms* const baseComms)
{
#ifdef _DEBUG
	if (deviceComms != nullptr)
	{
		__debugbreak(); // Double-calling this function!
	}
#endif
	deviceComms = baseComms;
}

const bool __stdcall IBaseGPUDevice::ValidateDeviceStateIsSetForDraw() const
{
	if (currentCachedState.deviceCachedRenderTarget == NULL)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

	if (currentCachedState.deviceCachedScanoutBuffer == NULL)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

	if (currentCachedState.deviceCachedBlendMode >= blendModeMaxBlendModes)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

	if (currentCachedState.deviceCachedWriteMask > wm_writeAll)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

	return true;
}

HRESULT __stdcall IBaseGPUDevice::DeviceFlushROPCache()
{
	flushROPCacheCommand flushCommand;
	flushCommand.checksum = command::ComputeChecksum(&flushCommand, sizeof(flushCommand) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&flushCommand, sizeof(flushCommand) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hrSend = SendOrStorePacket(&flushCommand);
	if (FAILED(hrSend) )
		return hrSend;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();

	return hrSend;
}

HRESULT __stdcall IBaseGPUDevice::DeviceWaitForIdle(const waitForDeviceIdleCommand::waitForDeviceSubsystem waitFlags/* = waitForDeviceIdleCommand::waitForFullPipelineFlush*/, const bool printStatus /*= false*/)
{
	if (currentlyRecordingCommandList != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Illegal to call this function while recording a command list!
#endif
		return E_INVALIDARG;
	}

#ifdef PRINT_COMMS
	if (printStatus)
		printf("Entering device wait for idle (0x%08X)...\n", waitFlags);
#endif

	waitForDeviceIdleCommand waitCommand;
	waitCommand.waitBitmask = waitFlags;
	waitCommand.returnCPUValue = true;
	waitCommand.returnValueToCPU = 0x12345678;
	waitCommand.checksum = command::ComputeChecksum(&waitCommand, sizeof(waitCommand) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&waitCommand, sizeof(waitCommand) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hrSend = SendOrStorePacket(&waitCommand);
	if (FAILED(hrSend) )
		return hrSend;

	waitResponse response;
	const DWORD startingTick = GetTickCount();
	const HRESULT hrRecv = deviceComms->RecvLoop( (BYTE* const)&response, sizeof(response) );
	const DWORD endingTick = GetTickCount();
#ifdef PRINT_COMMS
	if (printStatus)
		printf("...Finished wait after %ums\n", endingTick - startingTick);
#endif

	if (!command::IsValidPacket(&response, sizeof(response) ) )
	{
#ifdef _DEBUG
		__debugbreak(); // Unexpected invalid packet received!
#endif
		return E_FAIL;
	}

	if (response.type != command::PT_WAITRESPONSE)
	{
#ifdef _DEBUG
		__debugbreak(); // Unexpected packet type received!
#endif
		return E_FAIL;
	}

	if (response.value != waitCommand.returnValueToCPU)
	{
#ifdef _DEBUG
		__debugbreak(); // Unexpected sequence number returned
#endif
		return E_FAIL;
	}

	return hrRecv;
}

const bool IBaseGPUDevice::PacketIsValidForRecording(const command::ePacketType packetType) const
{
	switch (packetType)
	{
	case command::PT_DONOTHING:
	case command::PT_WRITEMEM:
	case command::PT_CLEARMEM:
	case command::PT_CLEARBACKBUFFER:
	case command::PT_CLEARZSTENCILBUFFER:
	case command::PT_LOADVERTSTREAMDATA:
	case command::PT_LOADTEXCACHEDATA:
	case command::PT_SETBLENDSTATE:
	case command::PT_SETTEXTURESTATE:
	case command::PT_DRAWINDEXED:
	case command::PT_SETSCANOUTPOINTER:
	case command::PT_SETIASTATE:
	case command::PT_FLUSHROPCACHE:
		return true;
	default:
#ifdef _DEBUG
		__debugbreak(); // Error: Unknown packet type!
#endif
	case command::PT_READMEM:
	case command::PT_READMEMRESPONSE:
	case command::PT_WAITFORDEVICEIDLE:
	case command::PT_WAITRESPONSE:
	case command::PT_ENDFRAMESTATS:
	case command::PT_ENDFRAME:
	case command::PT_RUNCOMMANDLIST:
		return false;
	}
	static_assert(command::PT_MAX_PACKET_TYPES == 20, "Reminder: Need to update this switch statement with new cases when adding new packets!");
}

HRESULT IBaseGPUDevice::SendOrStorePacket(const command* const sendPacket)
{
	if (sendPacket == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot send a NULL packet!
#endif
		return E_INVALIDARG;
	}

	if (currentlyRecordingCommandList != NULL)
	{
		if (PacketIsValidForRecording(sendPacket->type) )
		{
			currentlyRecordingCommandList->AddPacketToCommandList(*sendPacket);
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // Don't call to record a packet that you're not allowed to record!
#endif
		}
		return S_OK;
	}
	else
	{
		const HRESULT hrSend = deviceComms->SendLoop(reinterpret_cast<const BYTE* const>(sendPacket), sizeof(genericCommand) );
		return hrSend;
	}
}

void IBaseGPUDevice::BeginRecordingCommandList(GPUCommandList* const newCommandList)
{
	if (currentlyRecordingCommandList != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot begin recording a command list while recording is already in progress!
#endif
		return;
	}

	newCommandList->BeginRecording();
	currentlyRecordingCommandList = newCommandList;
}

void IBaseGPUDevice::CompleteRecordingCommandList()
{
	if (currentlyRecordingCommandList == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot end recording a command list if you haven't started one first!
#endif
		return;
	}

	currentlyRecordingCommandList->FinishRecordingAndUpload(deviceComms);

	ResetInvalidateDeviceState();

	currentlyRecordingCommandList = NULL;
}

void IBaseGPUDevice::TerminateAbortRecordingCommandList()
{
	if (currentlyRecordingCommandList == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot end recording a command list if you haven't started one first!
#endif
		return;
	}

	ResetInvalidateDeviceState();

	currentlyRecordingCommandList = NULL;
}

void IBaseGPUDevice::ResetInvalidateDeviceState()
{
	currentCachedState.ResetFields(GPUDeviceState() );
}
