#include "IBaseGPUDevice.h"
#include <intrin.h>
#include <stdio.h>
#include "../IDirect3DSurface9Hook.h"
#include "..\..\DriverShaderCompiler\DeviceShaderBytecode.h"
#include "..\..\ShaderTraceViewer\ShaderTrace.h"
#include "GPUCommandList.h"
#include "GPUDeviceLimits.h"

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

const eDepthFormat ConvertToDeviceDepthFormat(const D3DFORMAT zFormat)
{
	switch (zFormat)
	{
	case D3DFMT_D24S8:
	case D3DFMT_D24X8:
	case D3DFMT_D24X4S4:
	case D3DFMT_D24FS8:
		return eDepthFmtD24;
	case D3DFMT_D16:
	case D3DFMT_D16_LOCKABLE:
		return eDepthFmtD16;
	case D3DFMT_D15S1:
		return eDepthFmtD15;
	default:
#ifdef _DEBUG
		__debugbreak();
#endif
		return eDepthFmtD24;
	}
}

// TODO: Include address alignment in this validation also
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

HRESULT __stdcall IBaseGPUDevice::DeviceClearDepthStencil(gpuvoid* const zStencilMemory, const bool bDoClearDepth, const bool bDoClearStencil, 
	const float clearDepth/* = 1.0f*/, const BYTE clearStencil/* = 0x00*/)
{
	//if (!ValidateAddress(zStencilMemory) )
		//return E_INVALIDARG;

	if (clearDepth < 0.0f)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (clearDepth > 1.0f)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (isnan(clearDepth) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	clearZStencilCommand::eZSType clearComboType;
	switch ( ( (const unsigned)bDoClearDepth) | ( ( (const unsigned)bDoClearStencil) << 1) )
	{
	case 0:
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	case 1:
		clearComboType = clearZStencilCommand::EZS_ZClear;
		break;
	case 2:
		clearComboType = clearZStencilCommand::EZS_StencilClear;
		break;
	case 3:
		clearComboType = clearZStencilCommand::EZS_Both;
		break;
	}

	clearZStencilCommand clearZStencil;
	clearZStencil.clearType = clearComboType;
	clearZStencil.writeZValue = *(reinterpret_cast<const DWORD* const>(&clearDepth) );
	clearZStencil.writeStencilValue = clearStencil;

	if (clearDepth == 1.0f)
	{
		--clearZStencil.writeZValue;
	}
	else if (clearDepth < 0.5f)
	{
		clearZStencil.writeZValue = 0x00000000;
	}

	clearZStencil.checksum = command::ComputeChecksum(&clearZStencil, sizeof(clearZStencil) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&clearZStencil, sizeof(clearZStencil) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT clearZStencilHR = SendOrStorePacket(&clearZStencil);
	if (FAILED(clearZStencilHR) )
		return clearZStencilHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return clearZStencilHR;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetTextureState(const unsigned texWidth, const unsigned texHeight, const eTexFilterMode filterMode, 
		const eTexChannelMUX rChannel, const eTexChannelMUX gChannel, const eTexChannelMUX bChannel, const eTexChannelMUX aChannel, const combinerMode cbModeColor, const combinerMode cbModeAlpha,
		const gpuvoid* const textureMemory, const eTexFormat textureFormat)
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

	if (texWidth * texHeight > 0xFFFF || texWidth * texHeight < 1)
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

	if (DoCacheDeviceState() && currentCachedState.deviceCachedTextureState.texStateWidth == texWidth && currentCachedState.deviceCachedTextureState.texStateHeight == texHeight && currentCachedState.deviceCachedTextureState.deviceCachedTexFilter == filterMode && 
		currentCachedState.deviceCachedTextureState.deviceCachedTexR == rChannel && currentCachedState.deviceCachedTextureState.deviceCachedTexG == gChannel && currentCachedState.deviceCachedTextureState.deviceCachedTexB == bChannel && currentCachedState.deviceCachedTextureState.deviceCachedTexA == aChannel && 
		currentCachedState.deviceCachedTextureState.deviceCachedCombinerModeColor == cbModeColor && currentCachedState.deviceCachedTextureState.deviceCachedCombinerModeAlpha == cbModeAlpha &&
		currentCachedState.deviceCachedTextureState.deviceCachedSetTexture == textureMemory && currentCachedState.deviceCachedTextureState.deviceCachedTexFormat == textureFormat)
		return S_OK;

	setTextureStateCommand setTextureState;
	setTextureState.texWidthLog2 = (const BYTE)GetLog2TexDimension(texWidth);
	setTextureState.texHeightLog2 = (const BYTE)GetLog2TexDimension(texHeight);
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
	const HRESULT hRetSetState = SendOrStorePacket(&setTextureState);
	const HRESULT hRetLoadTexCache = SendOrStorePacket(&loadTexCache);
	if (SUCCEEDED(hRetSetState) && SUCCEEDED(hRetLoadTexCache) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedTextureState.texStateWidth = texWidth;
		currentCachedState.deviceCachedTextureState.texStateHeight = texHeight;
		currentCachedState.deviceCachedTextureState.deviceCachedTexFilter = filterMode;
		currentCachedState.deviceCachedTextureState.deviceCachedTexR = rChannel;
		currentCachedState.deviceCachedTextureState.deviceCachedTexG = gChannel;
		currentCachedState.deviceCachedTextureState.deviceCachedTexB = bChannel;
		currentCachedState.deviceCachedTextureState.deviceCachedTexA = aChannel;
		currentCachedState.deviceCachedTextureState.deviceCachedCombinerModeColor = cbModeColor;
		currentCachedState.deviceCachedTextureState.deviceCachedCombinerModeAlpha = cbModeAlpha;
		currentCachedState.deviceCachedTextureState.deviceCachedSetTexture = textureMemory;
		currentCachedState.deviceCachedTextureState.deviceCachedTexFormat = textureFormat;
	}
	if (FAILED(hRetSetState) )
		return hRetSetState;
	if (FAILED(hRetLoadTexCache) )
		return hRetLoadTexCache;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRetSetState;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetNullTextureState(const eTexFilterMode filterMode, 
		const eTexChannelMUX rChannel, const eTexChannelMUX gChannel, const eTexChannelMUX bChannel, const eTexChannelMUX aChannel, const combinerMode cbModeColor, const combinerMode cbModeAlpha)
{
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

	if (DoCacheDeviceState() && currentCachedState.deviceCachedTextureState.texStateWidth == 0 && currentCachedState.deviceCachedTextureState.texStateHeight == 0 && currentCachedState.deviceCachedTextureState.deviceCachedTexFilter == filterMode && 
		currentCachedState.deviceCachedTextureState.deviceCachedTexR == rChannel && currentCachedState.deviceCachedTextureState.deviceCachedTexG == gChannel && currentCachedState.deviceCachedTextureState.deviceCachedTexB == bChannel && currentCachedState.deviceCachedTextureState.deviceCachedTexA == aChannel && 
		currentCachedState.deviceCachedTextureState.deviceCachedCombinerModeColor == cbModeColor && currentCachedState.deviceCachedTextureState.deviceCachedCombinerModeAlpha == cbModeAlpha &&
		currentCachedState.deviceCachedTextureState.deviceCachedSetTexture == NULL && currentCachedState.deviceCachedTextureState.deviceCachedTexFormat == eTexFmtA8R8G8B8)
		return S_OK;

	setTextureStateCommand setTextureState;
	setTextureState.texWidthLog2 = 0;
	setTextureState.texHeightLog2 = 0;
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

	loadTexCacheDataCommand loadTexCache;
	loadTexCache.sourceRAMAddr = (const DWORD)NULL;
	loadTexCache.loadSourceFormat = eTexFmtA8R8G8B8;
	loadTexCache.loadTexelCount = (const USHORT)0;
	loadTexCache.checksum = command::ComputeChecksum(&loadTexCache, sizeof(loadTexCache) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&loadTexCache, sizeof(loadTexCache) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRetSetState = SendOrStorePacket(&setTextureState);
	const HRESULT hRetLoadTexCache = SendOrStorePacket(&loadTexCache);
	if (SUCCEEDED(hRetSetState) && SUCCEEDED(hRetLoadTexCache) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedTextureState.texStateWidth = 0;
		currentCachedState.deviceCachedTextureState.texStateHeight = 0;
		currentCachedState.deviceCachedTextureState.deviceCachedTexFilter = filterMode;
		currentCachedState.deviceCachedTextureState.deviceCachedTexR = rChannel;
		currentCachedState.deviceCachedTextureState.deviceCachedTexG = gChannel;
		currentCachedState.deviceCachedTextureState.deviceCachedTexB = bChannel;
		currentCachedState.deviceCachedTextureState.deviceCachedTexA = aChannel;
		currentCachedState.deviceCachedTextureState.deviceCachedCombinerModeColor = cbModeColor;
		currentCachedState.deviceCachedTextureState.deviceCachedCombinerModeAlpha = cbModeAlpha;
		currentCachedState.deviceCachedTextureState.deviceCachedSetTexture = NULL;
		currentCachedState.deviceCachedTextureState.deviceCachedTexFormat = eTexFmtA8R8G8B8;
	}
	if (FAILED(hRetSetState) )
		return hRetSetState;
	if (FAILED(hRetLoadTexCache) )
		return hRetLoadTexCache;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRetSetState;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetROPState(gpuvoid* const renderTargetMemory, const eBlendMask writeMask, const bool alphaTestEnabled, const BYTE alphaTestRefVal, const eCmpFunc alphaTestCmpFunc,
		const bool alphaBlendingEnabled, const D3DBLEND srcColorBlend, const D3DBLEND destColorBlend, const D3DBLENDOP colorBlendOp, 
		const D3DBLEND srcAlphaBlend, const D3DBLEND destAlphaBlend, const D3DBLENDOP alphaBlendOp, const D3DCOLOR blendFactorARGB)
{
	if (!ValidateAddress(renderTargetMemory) )
		return E_INVALIDARG;

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

	if (srcColorBlend > D3DBLEND_INVSRCCOLOR2 || srcColorBlend < D3DBLEND_ZERO)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (destColorBlend > D3DBLEND_INVSRCCOLOR2 || destColorBlend < D3DBLEND_ZERO)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (colorBlendOp > D3DBLENDOP_MAX || colorBlendOp < D3DBLENDOP_ADD)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (srcAlphaBlend > D3DBLEND_INVSRCCOLOR2 || srcAlphaBlend < D3DBLEND_ZERO)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (destAlphaBlend > D3DBLEND_INVSRCCOLOR2 || destAlphaBlend < D3DBLEND_ZERO)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (alphaBlendOp > D3DBLENDOP_MAX || alphaBlendOp < D3DBLENDOP_ADD)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (srcColorBlend > D3DBLEND_SRCCOLOR2) // We don't support dual source blending yet
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (destColorBlend > D3DBLEND_SRCCOLOR2) // We don't support dual source blending yet
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (srcAlphaBlend > D3DBLEND_SRCCOLOR2) // We don't support dual source blending yet
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (destAlphaBlend > D3DBLEND_SRCCOLOR2) // We don't support dual source blending yet
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	ROPBlock deviceROPState;
	deviceROPState.ConvertBlendStateFromD3DRS(alphaBlendingEnabled, srcColorBlend, destColorBlend, colorBlendOp, srcAlphaBlend, destAlphaBlend, alphaBlendOp, blendFactorARGB);
	deviceROPState.deviceCachedAlphaTestEnabled = alphaTestEnabled;
	deviceROPState.deviceCachedAlphaTestRefVal = alphaTestRefVal;
	deviceROPState.deviceCachedAlphaTestCmpFunc = alphaTestCmpFunc;
	deviceROPState.deviceCachedWriteMask = writeMask;
	deviceROPState.deviceCachedAlphaBlendEnabled = alphaBlendingEnabled;

	if (DoCacheDeviceState() && currentCachedState.deviceCachedROPState == deviceROPState && renderTargetMemory == currentCachedState.deviceCachedRenderTarget)
		return S_OK;

	setAlphaTestAndRTAddressStateCommand setAlphaTestAndRTAddrState;
	setAlphaTestAndRTAddrState.renderTargetBaseAddress = (const DWORD)renderTargetMemory;
	setAlphaTestAndRTAddrState.writeMask = writeMask;
	setAlphaTestAndRTAddrState.alphaTestEnabled = alphaTestEnabled;
	setAlphaTestAndRTAddrState.alphaTestRefValue = alphaTestRefVal;
	setAlphaTestAndRTAddrState.alphaTestFunc = alphaTestCmpFunc;
	setAlphaTestAndRTAddrState.checksum = command::ComputeChecksum(&setAlphaTestAndRTAddrState, sizeof(setAlphaTestAndRTAddrState) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setAlphaTestAndRTAddrState, sizeof(setAlphaTestAndRTAddrState) ) )
	{
		__debugbreak();
	}
#endif

	// Convert our D3DCOLOR ARGB color to an ABGR color for the blend factor:
	const unsigned char blendFactorA = blendFactorARGB >> 24;
	const unsigned char blendFactorR = (blendFactorARGB >> 16) & 0xFF;
	const unsigned char blendFactorG = (blendFactorARGB >> 8) & 0xFF;
	const unsigned char blendFactorB = blendFactorARGB & 0xFF;
	const DWORD blendFactorABGR = (blendFactorA << 24) | (blendFactorB << 16) | (blendFactorG << 8) | (blendFactorR);

	setBlendStateCommand setBlendState;
	setBlendState.blendStateBlock = deviceROPState.dataUnion.solidDWORD;
	setBlendState.alphaBlendingEnabled = alphaBlendingEnabled;
	setBlendState.blendFactorABGR = blendFactorABGR;
	setBlendState.checksum = command::ComputeChecksum(&setBlendState, sizeof(setBlendState) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setBlendState, sizeof(setBlendState) ) )
	{
		__debugbreak();
	}
#endif

	const HRESULT hRetAlphaTest = SendOrStorePacket(&setAlphaTestAndRTAddrState);

	// Blend state must always be sent after the alpha-test/rendertarget state because it's the blend state update that makes the
	// command processor trigger a push of the new states to the ROP unit.
	const HRESULT hRetBlendState = SendOrStorePacket(&setBlendState);
	if (SUCCEEDED(hRetAlphaTest) && SUCCEEDED(hRetBlendState) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedROPState = deviceROPState;
		currentCachedState.deviceCachedRenderTarget = renderTargetMemory;
	}
	if (FAILED(hRetAlphaTest) )
		return hRetAlphaTest;
	if (FAILED(hRetBlendState) )
		return hRetBlendState;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return S_OK;
}

static inline const unsigned GetLog2ExactFloat(const float f)
{
	const unsigned ret = (const unsigned)log2f(f);
#ifdef _DEBUG
	if ( (1 << ret) != f)
	{
		__debugbreak(); // Value passed in must be an exact positive integer power of 2
	}
#endif
	return ret;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetTriSetupState(const float viewportHalfWidth, const float viewportHalfHeight, const float viewportZScale, const float viewportZOffset,
	const unsigned short scissorRectLeft, const unsigned short scissorRectRight, const unsigned short scissorRectTop, const unsigned short scissorRectBottom)
{
	if (viewportHalfWidth < 0.5f || viewportHalfHeight < 0.5f)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (scissorRectLeft > scissorRectRight || scissorRectTop > scissorRectBottom)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	TriangleSetupStateBlock newTriSetupState;
	newTriSetupState.deviceCachedViewportHalfWidth = viewportHalfWidth;
	newTriSetupState.deviceCachedViewportHalfHeight = viewportHalfHeight;
	newTriSetupState.deviceCachedViewportZScale = viewportZScale;
	newTriSetupState.deviceCachedViewportZOffset = viewportZOffset;
	newTriSetupState.deviceCachedScissorLeft = scissorRectLeft;
	newTriSetupState.deviceCachedScissorRight = scissorRectRight;
	newTriSetupState.deviceCachedScissorTop = scissorRectTop;
	newTriSetupState.deviceCachedScissorBottom = scissorRectBottom;

	if (DoCacheDeviceState() && currentCachedState.deviceCachedTriSetupState == newTriSetupState)
		return S_OK;

	setViewportState0Command setViewport0;
	setViewport0.viewportHalfWidth = viewportHalfWidth;
	setViewport0.viewportHalfHeight = viewportHalfHeight;
	setViewport0.checksum = command::ComputeChecksum(&setViewport0, sizeof(setViewport0) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setViewport0, sizeof(setViewport0) ) )
	{
		__debugbreak();
	}
#endif

	setViewportState1Command setViewport1;
	setViewport1.viewportZScale = viewportZScale;
	setViewport1.viewportZOffset = viewportZOffset;
	setViewport1.checksum = command::ComputeChecksum(&setViewport1, sizeof(setViewport1) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setViewport1, sizeof(setViewport1) ) )
	{
		__debugbreak();
	}
#endif

	setScissorRectCommand setScissorRect;
	setScissorRect.scissorLeft = scissorRectLeft;
	setScissorRect.scissorRight = scissorRectRight;
	setScissorRect.scissorTop = scissorRectTop;
	setScissorRect.scissorBottom = scissorRectBottom;
	setScissorRect.checksum = command::ComputeChecksum(&setScissorRect, sizeof(setScissorRect) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setScissorRect, sizeof(setScissorRect) ) )
	{
		__debugbreak();
	}
#endif

	const HRESULT hRetViewport0 = SendOrStorePacket(&setViewport0);
	const HRESULT hRetViewport1 = SendOrStorePacket(&setViewport1);
	const HRESULT hRetScissorRect = SendOrStorePacket(&setScissorRect);
	if (SUCCEEDED(hRetViewport0) && SUCCEEDED(hRetViewport1) && SUCCEEDED(hRetScissorRect) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedTriSetupState = newTriSetupState;
	}
	if (FAILED(hRetViewport0) )
		return hRetViewport0;
	if (FAILED(hRetViewport1) )
		return hRetViewport1;
	if (FAILED(hRetScissorRect) )
		return hRetScissorRect;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRetViewport0;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetClipState(const bool depthClipEnabled, const bool useOpenGLNearZClip, const float guardBandXScale, const float guardBandYScale)
{
	if (guardBandXScale < 1.0f || guardBandXScale > 32768.0f || guardBandYScale < 1.0f || guardBandYScale > 32768.0f)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	const unsigned guardBandXScaleLog2 = GetLog2ExactFloat(guardBandXScale);
	const unsigned guardBandYScaleLog2 = GetLog2ExactFloat(guardBandYScale);
	if (guardBandXScaleLog2 > 15 || guardBandYScaleLog2 > 15)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() && currentCachedState.deviceCachedDepthClipEnable == depthClipEnabled && currentCachedState.deviceCachedOpenGLNearZClipMode == useOpenGLNearZClip 
			&& currentCachedState.deviceCachedGuardBandXScale == guardBandXScaleLog2 && currentCachedState.deviceCachedGuardBandYScale == guardBandYScaleLog2)
		return S_OK;

	setClipperStateCommand setClipState;
	setClipState.depthClipEnable = depthClipEnabled;
	setClipState.useOpenGLNearZClip = useOpenGLNearZClip;
	setClipState.guardBandScaleX = guardBandXScaleLog2;
	setClipState.guardBandScaleY = guardBandYScaleLog2;

	setClipState.checksum = command::ComputeChecksum(&setClipState, sizeof(setClipState) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setClipState, sizeof(setClipState) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRet = SendOrStorePacket(&setClipState);
	if (SUCCEEDED(hRet) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedDepthClipEnable = depthClipEnabled;
		currentCachedState.deviceCachedOpenGLNearZClipMode = useOpenGLNearZClip;
		currentCachedState.deviceCachedGuardBandXScale = guardBandXScaleLog2;
		currentCachedState.deviceCachedGuardBandYScale = guardBandYScaleLog2;
	}
	if (FAILED(hRet) )
		return hRet;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetDepthState(const bool zEnabled, const bool zWriteEnabled, const bool colorWriteEnabled, const eCmpFunc zTestCmpFunc, const eDepthFormat zFormat, const float depthBias)
{
	if (zTestCmpFunc >= cmp_MAX_CMP_FUNCS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	DepthStateBlock newDepthState;
	newDepthState.deviceCachedZEnabled = zEnabled;
	newDepthState.deviceCachedZWriteEnabled = zWriteEnabled;
	newDepthState.deviceColorWritesEnabled = colorWriteEnabled;
	newDepthState.deviceCachedDepthTestCmpFunc = zTestCmpFunc;
	newDepthState.deviceDepthBias = depthBias;
	newDepthState.deviceDepthFormat = zFormat;

	if (DoCacheDeviceState() && currentCachedState.deviceCachedDepthState == newDepthState)
		return S_OK;

	setDepthStateCommand setDepthState;

	setDepthState.DepthTestEnable = zEnabled;
	if (zEnabled)
	{
		setDepthState.DepthWriteEnable = zWriteEnabled;
		setDepthState.zFunc = zTestCmpFunc;
	}
	else
	{
		setDepthState.DepthWriteEnable = false;
		setDepthState.zFunc = cmp_always;
	}
	setDepthState.DepthFormat = zFormat;
	const unsigned long ulDepthBias = *(const unsigned long* const)&depthBias;
	setDepthState.DepthBiasLowBits = ulDepthBias & ( (1 << 27) - 1);
	setDepthState.DepthBiasHighBits = ulDepthBias >> 27;
	setDepthState.ColorWritesEnabled = colorWriteEnabled;

	setDepthState.checksum = command::ComputeChecksum(&setDepthState, sizeof(setDepthState) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setDepthState, sizeof(setDepthState) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRet = SendOrStorePacket(&setDepthState);
	if (SUCCEEDED(hRet) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedDepthState = newDepthState;
	}
	if (FAILED(hRet) )
		return hRet;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetIAState(const eCullMode cullMode, const ePrimTopology primTopology, const eStripCutType stripCut, const eIndexFormat indexFormat, const unsigned indexBufferLengthBytes, const gpuvoid* const indexBufferBaseAddr)
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

	if (indexBufferBaseAddr != NULL)
	{
		if (indexFormat == ibfmt_noIndices)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_INVALIDARG;
		}

		if (!ValidateAddress(indexBufferBaseAddr) )
			return E_INVALIDARG;

		if (indexBufferLengthBytes == 0)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_INVALIDARG;
		}

		if (!ValidateMemoryRangeExistsInsideAllocation(indexBufferBaseAddr, indexBufferLengthBytes) )
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_INVALIDARG;
		}
	}
	else
	{
		if (indexFormat != ibfmt_noIndices)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_INVALIDARG;
		}
	}

	if (DoCacheDeviceState() && cullMode == currentCachedState.deviceCachedCullMode && primTopology == currentCachedState.deviceCachedPrimTop && stripCut == currentCachedState.deviceCachedStripCut 
		&& indexFormat == currentCachedState.deviceCachedIndexFormat && indexBufferBaseAddr == currentCachedState.deviceCachedIAIndexBuffer)
		return S_OK;

	setIAStateCommand setIACmd;
	setIACmd.IBBaseAddr = reinterpret_cast<const DWORD>(indexBufferBaseAddr);
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
		currentCachedState.deviceCachedIAIndexBuffer = indexBufferBaseAddr;
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

HRESULT __stdcall IBaseGPUDevice::DeviceSetScanoutBuffer(const gpuvoid* const renderTargetMemory, const bool bEnableScanout/* = true*/, const bool invertScanoutColors /*= false*/, 
		const setScanoutPointerCommand::eDisplayChannelSwizzle redChannelSwizzle /*= setScanoutPointerCommand::dcs_red*/, const setScanoutPointerCommand::eDisplayChannelSwizzle greenChannelSwizzle /*= setScanoutPointerCommand::dcs_green*/, const setScanoutPointerCommand::eDisplayChannelSwizzle blueChannelSwizzle /*= setScanoutPointerCommand::dcs_blue*/)
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

	if (redChannelSwizzle >= setScanoutPointerCommand::dcs_undefined1)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (greenChannelSwizzle >= setScanoutPointerCommand::dcs_undefined1)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (blueChannelSwizzle >= setScanoutPointerCommand::dcs_undefined1)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() && currentCachedState.deviceCachedScanoutBuffer == renderTargetMemory && currentCachedState.deviceCachedScanoutEnabled == bEnableScanout && currentCachedState.deviceCachedScanoutInvertColors == invertScanoutColors &&
		currentCachedState.deviceScanoutSwizzleR == redChannelSwizzle && currentCachedState.deviceScanoutSwizzleG == greenChannelSwizzle && currentCachedState.deviceScanoutSwizzleB == blueChannelSwizzle)
		return S_OK;

	setScanoutPointerCommand setScanoutCmd;
	setScanoutCmd.bufferAddress = (const DWORD)renderTargetMemory;
	setScanoutCmd.displayMode = setScanoutPointerCommand::dm_640x480_60Hz;
	setScanoutCmd.scanoutEnable = bEnableScanout;
	setScanoutCmd.invertColor = invertScanoutColors;
	setScanoutCmd.channelSwizzleR = redChannelSwizzle;
	setScanoutCmd.channelSwizzleG = greenChannelSwizzle;
	setScanoutCmd.channelSwizzleB = blueChannelSwizzle;
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
		currentCachedState.deviceCachedScanoutEnabled = bEnableScanout;
		currentCachedState.deviceCachedScanoutInvertColors = invertScanoutColors;
		currentCachedState.deviceScanoutSwizzleR = redChannelSwizzle;
		currentCachedState.deviceScanoutSwizzleG = greenChannelSwizzle;
		currentCachedState.deviceScanoutSwizzleB = blueChannelSwizzle;
	}
	if (FAILED(hRet) )
		return hRet;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

HRESULT __stdcall IBaseGPUDevice::DeviceDownloadEndOfFrameStats(const gpuvoid* const statsMemory, DWORD* const outReadbackStatsData)
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

	endFrameCommand endFrameStatsReadbackCmd;
	endFrameStatsReadbackCmd.statsMemoryAddress = (const DWORD)statsMemory;
	endFrameStatsReadbackCmd.finalizeStatsCollection = true;
	endFrameStatsReadbackCmd.checksum = command::ComputeChecksum(&endFrameStatsReadbackCmd, sizeof(endFrameStatsReadbackCmd) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&endFrameStatsReadbackCmd, sizeof(endFrameStatsReadbackCmd) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRet = SendOrStorePacket(&endFrameStatsReadbackCmd);
	if (FAILED(hRet) )
		return hRet;

	if (DoSyncEveryCall() )
		DeviceWaitForIdle();

	// Wait for the memory controller to be done working before we try to read back our stats data from the frame
	DeviceWaitForIdle(waitForDeviceIdleCommand::waitForMemControllerIdle);

	return deviceComms->ReadFromDevice(statsMemory, outReadbackStatsData, sizeof(DWORD) * endFrameStatsResponse::TotalAllStatsCount);
}

HRESULT __stdcall IBaseGPUDevice::DeviceEndFrame()
{
	if (currentlyRecordingCommandList != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Illegal to call this function while we are recording a command list!
#endif
		return E_INVALIDARG;
	}

	endFrameCommand endFrameCmd;
	endFrameCmd.statsMemoryAddress = 0x00000000;
	endFrameCmd.finalizeStatsCollection = false;
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

	return S_OK;
}

HRESULT __stdcall IBaseGPUDevice::DeviceIssueQuery(const gpuvoid* const queryAddress, const bool isEndEvent, const eQueryType queryType)
{
	if (!ValidateAddress(queryAddress) )
		return E_INVALIDARG;

	if (!ValidateMemoryRangeExistsInsideAllocation(queryAddress, 32) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (queryType > eQTTimestamp)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	issueQueryCommand issueQuery;
	issueQuery.queryAddress = (const DWORD)queryAddress;
	issueQuery.isEndQuery = isEndEvent;
	issueQuery.queryType = queryType;

	issueQuery.checksum = command::ComputeChecksum(&issueQuery, sizeof(issueQuery) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&issueQuery, sizeof(issueQuery) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT hRet = SendOrStorePacket(&issueQuery);
	if (FAILED(hRet) )
		return hRet;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

HRESULT __stdcall IBaseGPUDevice::DeviceLoadVertexShader(const gpuvoid* const vertexShaderMemory, const unsigned short numShaderTokensToLoad, const bool forceLoadVertexShader/* = false*/, const unsigned short targetAddressToLoadTo/* = 0*/)
{
	if (!ValidateAddress(vertexShaderMemory) )
		return E_INVALIDARG;

	if (numShaderTokensToLoad < 1)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (numShaderTokensToLoad >= GPU_SHADER_MAX_NUM_INSTRUCTIONS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (targetAddressToLoadTo >= GPU_SHADER_MAX_NUM_INSTRUCTIONS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (numShaderTokensToLoad + targetAddressToLoadTo >= GPU_SHADER_MAX_NUM_INSTRUCTIONS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(vertexShaderMemory, numShaderTokensToLoad * sizeof(instructionSlot) ) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() && currentCachedState.deviceCachedVertexShader == vertexShaderMemory && !forceLoadVertexShader)
		return S_OK;

	loadShaderInstructionsCommand loadShaderInstructions;
	loadShaderInstructions.shaderStartAddress = (const DWORD)vertexShaderMemory;
	loadShaderInstructions.shaderLengthTokens = numShaderTokensToLoad;
	loadShaderInstructions.shaderLoadTargetOffset = targetAddressToLoadTo;
	loadShaderInstructions.checksum = command::ComputeChecksum(&loadShaderInstructions, sizeof(loadShaderInstructions) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&loadShaderInstructions, sizeof(loadShaderInstructions) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT loadVertexShaderHR = SendOrStorePacket(&loadShaderInstructions);
	if (FAILED(loadVertexShaderHR) )
		return loadVertexShaderHR;

	if (DoCacheDeviceState() )
	{
		// When we call SetVertexShader, the Command Processor instructs the ShaderCore to load the new vertex shader program into
		// the instruction cache. The ShaderCore's only way to access memory is through the VertexStreamCache, so it has to overwrite
		// vertex stream 0 to do this. Here we'll clobber whatever was cached in stream 0 so that the caching logic will make sure to
		// reset it on the next draw call:
		currentCachedState.deviceCachedVertexStreams[0].deviceCachedVertexBuffer = NULL;
		currentCachedState.deviceCachedVertexStreams[0].dwordOffset = 0;
		currentCachedState.deviceCachedVertexStreams[0].dwordCount = sizeof(instructionSlot) / sizeof(DWORD);
		currentCachedState.deviceCachedVertexStreams[0].dwordStride = sizeof(instructionSlot) / sizeof(DWORD);
		currentCachedState.deviceCachedVertexStreams[0].isD3DCOLOR = false;
		currentCachedState.deviceCachedVertexStreams[0].streamID = 0;
		currentCachedState.deviceCachedVertexStreams[0].shaderInputRegIndex = 0;

		currentCachedState.deviceCachedVertexShader = vertexShaderMemory;
	}

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return loadVertexShaderHR;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetVertexShaderStartAddr(const unsigned short shaderStartAddress)
{
	if (shaderStartAddress >= GPU_SHADER_MAX_NUM_INSTRUCTIONS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() && currentCachedState.deviceCachedSetVertexStartAddress == shaderStartAddress)
		return S_OK;

	setShaderStartAddressCommand setShaderStartAddress;
	setShaderStartAddress.shaderStartAddress = shaderStartAddress;
	setShaderStartAddress.checksum = command::ComputeChecksum(&setShaderStartAddress, sizeof(setShaderStartAddress) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setShaderStartAddress, sizeof(setShaderStartAddress) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT setShaderStartAddressHR = SendOrStorePacket(&setShaderStartAddress);
	if (FAILED(setShaderStartAddressHR) )
		return setShaderStartAddressHR;

	if (DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedSetVertexStartAddress = shaderStartAddress;
	}

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return setShaderStartAddressHR;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetVertexStreamData(const gpuvoid* const vertexStreamData, const unsigned vertexBufferLengthBytes, const BYTE dwordCount, const BYTE streamID, 
	const bool isD3DCOLOR, const BYTE shaderInputRegIndex, const BYTE dwordStride, const BYTE dwordOffset, const BYTE numVertexStreamsTotal)
{
	if (!ValidateAddress(vertexStreamData) )
		return E_INVALIDARG;

	if (vertexBufferLengthBytes == 0)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (vertexBufferLengthBytes > GPU_MAX_VERTEX_BUFFER_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (dwordCount < 1)
	{
#ifdef _DEBUG
		__debugbreak(); // Only 1, 2, 3, or 4 (4, 8, 12, or 16 bytes) are valid inputs for the dwordCount of an element
#endif
		return E_INVALIDARG;
	}

	if (dwordCount > 4)
	{
#ifdef _DEBUG
		__debugbreak(); // Only 1, 2, 3, or 4 (4, 8, 12, or 16 bytes) are valid inputs for the dwordCount of an element
#endif
		return E_INVALIDARG;
	}

	if (streamID >= GPU_MAX_NUM_VERTEX_STREAMS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (shaderInputRegIndex >= GPU_SHADER_MAX_NUM_INPUT_REG)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (dwordStride > GPU_MAX_VERTEX_ELEMENT_STRIDE_DWORDS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (dwordOffset > GPU_MAX_VERTEX_ELEMENT_OFFSET_DWORDS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (numVertexStreamsTotal >= GPU_MAX_NUM_VERTEX_STREAMS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (numVertexStreamsTotal == 0)
	{
#ifdef _DEBUG
		__debugbreak(); // D3D9 doesn't really allow draw calls without vertex buffers bound. This wouldn't technically break the device, but it's probably not what you wanted to do either.
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(vertexStreamData, vertexBufferLengthBytes) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	CachedVertexStream compareVertexStream;
	compareVertexStream.deviceCachedVertexBuffer = vertexStreamData;
	compareVertexStream.streamID = streamID;
	compareVertexStream.dwordCount = dwordCount;
	compareVertexStream.isD3DCOLOR = isD3DCOLOR;
	compareVertexStream.shaderInputRegIndex = shaderInputRegIndex;
	compareVertexStream.dwordStride = dwordStride;
	compareVertexStream.dwordOffset = dwordOffset;

	//if (DoCacheDeviceState() && currentCachedState.deviceCachedVertexStreams[streamID] == compareVertexStream) // TODO: DO we actually want to cache this? What if we have a dynamic vertex buffer?
		//return S_OK;

	setVertexStreamDataCommand setVertexStreamData;
	setVertexStreamData.streamBaseAddress = (const DWORD)vertexStreamData;
	setVertexStreamData.dwordCount = dwordCount - 1; // Convert from 0-based to 1-based element DWORD count here
	setVertexStreamData.streamID = streamID;
	setVertexStreamData.isD3DCOLOR = isD3DCOLOR;
	setVertexStreamData.shaderInputRegIndex = shaderInputRegIndex;
	setVertexStreamData.dwordStride = dwordStride;
	setVertexStreamData.dwordOffset = dwordOffset;
	setVertexStreamData.numVertexStreamsTotal = numVertexStreamsTotal;
	setVertexStreamData.checksum = command::ComputeChecksum(&setVertexStreamData, sizeof(setVertexStreamData) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setVertexStreamData, sizeof(setVertexStreamData) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT setStreamHR = SendOrStorePacket(&setVertexStreamData);
	if (FAILED(setStreamHR) )
		return setStreamHR;

	if (DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedVertexStreams[streamID] = compareVertexStream;
	}

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return setStreamHR;
}

const bool IsFloatCloseEnoughIgnoringSign(const float a, const float b)
{
	const int iFloatA = *reinterpret_cast<const int* const>(&a) & 0x7FFFFFFF;
	const int iFloatB = *reinterpret_cast<const int* const>(&b) & 0x7FFFFFFF;

	return abs(iFloatA - iFloatB) < 3;
}

const bool IsFloatCompressible(const float component)
{
	if (isinf(component) )
		return false;

	if (isnan(component) )
		return false;

	const unsigned uFloat = *reinterpret_cast<const unsigned* const>(&component);
	if ( (uFloat & 0x7FFFFF) == 0x000000)
	{
		// This includes 0, which is also compressible as a special
		if (component >= (1.0f / 128.0f) )
		{
			return component >= (1.0f / 128.0f) && component <= (256.0f);
		}
		else if (component <= (-1.0f / 128.0f) )
		{
			return component >= -(256.0f) && component <= -(1.0f / 128.0f);
		}
		else if (component == 0.0f)
		{
			return true;
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // Should never be here!
#endif
			return false;
		}
	}
	else
	{
		// List out our specials here:
		static const float zeroF = 0.0f;
		static const float pi = 3.1415926535897932384626433832795f;
		static const float two_pi = 6.283185307179586476925286766559f;
		static const float e = 2.7182818284590452353602874713527f;
		static const float xFF = 255.0f;
		static const float rcpFF = 1.0f / 255.0f;

		return IsFloatCloseEnoughIgnoringSign(component, pi) ||
			IsFloatCloseEnoughIgnoringSign(component, two_pi) ||
			IsFloatCloseEnoughIgnoringSign(component, e) ||
			IsFloatCloseEnoughIgnoringSign(component, xFF) ||
			IsFloatCloseEnoughIgnoringSign(component, rcpFF) ||
			IsFloatCloseEnoughIgnoringSign(component, zeroF);
	}

	return false;
}

// This assumes that the float being passed to it has already been approved to be compressible via IsFloatCompressible() prior to calling this function.
// Encodes our 32-bit float as a 7-bit unsigned integer that the hardware knows how to decode.
const unsigned CompressFloat(float component)
{
	unsigned compressedBits = 0x00;
	if (component < 0)
		compressedBits = (0x01 << 0); // Negative bit

	// Strip off the negative bit
	component = fabs(component);

	int foundIndex = -1;

	const unsigned uFloat = *reinterpret_cast<const unsigned* const>(&component);
	if ( (uFloat & 0x7FFFFF) == 0x000000 && component >= (1.0f / 128.0f) && component <= (256.0f) && component != 0.0f)
	{
		compressedBits |= (0x1 << 1); // Set the "Is power of 2" bit
		const unsigned unbiasedMantissa = (uFloat >> 23) & 0xFF;
#ifdef _DEBUG
		if (unbiasedMantissa > 135) // Larger than 256.0f
		{
			__debugbreak();
		}
		else if (unbiasedMantissa < 120) // Smaller than 0.0078125f
		{
			__debugbreak();
		}
#endif
		foundIndex = unbiasedMantissa - 120;
	}
	else
	{
		compressedBits |= (0x1 << 2); // Set the "Is special number" bit (assumed to always be set if the power of 2 bit is not set)

		// List out our specials here:
		static const float zeroF = 0.0f;
		static const float pi = 3.1415926535897932384626433832795f;
		static const float two_pi = 6.283185307179586476925286766559f;
		static const float e = 2.7182818284590452353602874713527f;
		static const float xFF = 255.0f;
		static const float rcpFF = 1.0f / 255.0f;

		if (IsFloatCloseEnoughIgnoringSign(component, pi) )
			foundIndex = 1;
		else if (IsFloatCloseEnoughIgnoringSign(component, e) )
			foundIndex = 2;
		else if (IsFloatCloseEnoughIgnoringSign(component, two_pi) )
			foundIndex = 3;
		else if (IsFloatCloseEnoughIgnoringSign(component, xFF) )
			foundIndex = 4;
		else if (IsFloatCloseEnoughIgnoringSign(component, rcpFF) )
			foundIndex = 5;
		else if (IsFloatCloseEnoughIgnoringSign(component, zeroF) )
			foundIndex = 0;
	}

	if (foundIndex < 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Should never be here!
#endif
		return 0;
	}
	compressedBits |= (foundIndex << 3);
	return compressedBits;
}

const bool IsFloatRegCompressible(const float4& reg)
{
	return IsFloatCompressible(reg.x) && IsFloatCompressible(reg.y) &&
		IsFloatCompressible(reg.z) && IsFloatCompressible(reg.w);
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetConstantDataSingleSpecial(const float4& registerData, const BYTE registerIndex)
{
	if (!IsFloatRegCompressible(registerData) )
	{
#ifdef _DEBUG
		__debugbreak(); // Not a compressible special value!
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() )
	{
		if (memcmp(&registerData, currentCachedState.deviceCachedConstantRegisters + registerIndex, sizeof(float4) ) == 0)
			return S_OK;
	}

	const unsigned compX = CompressFloat(registerData.x);
	const unsigned compY = CompressFloat(registerData.y);
	const unsigned compZ = CompressFloat(registerData.z);
	const unsigned compW = CompressFloat(registerData.w);
	setShaderConstantSpecialCommand setShaderConstantSpecial;

	setShaderConstantSpecial.shaderRegIndex = registerIndex;

	setShaderConstantSpecial.isXNegative = (compX & (0x1 << 0) ) ? true : false;
	setShaderConstantSpecial.isXPow2 = (compX & (0x1 << 1) ) ? true : false;
	setShaderConstantSpecial.isXSpec = (compX & (0x1 << 2) ) ? true : false;
	setShaderConstantSpecial.XIndex = ( (compX >> 3) & 0xF);

	setShaderConstantSpecial.isYNegative = (compY & (0x1 << 0) ) ? true : false;
	setShaderConstantSpecial.isYPow2 = (compY & (0x1 << 1) ) ? true : false;
	setShaderConstantSpecial.isYSpec = (compY & (0x1 << 2) ) ? true : false;
	setShaderConstantSpecial.YIndex = ( (compY >> 3) & 0xF);

	setShaderConstantSpecial.isZNegative = (compZ & (0x1 << 0) ) ? true : false;
	setShaderConstantSpecial.isZPow2 = (compZ & (0x1 << 1) ) ? true : false;
	setShaderConstantSpecial.isZSpec = (compZ & (0x1 << 2) ) ? true : false;
	setShaderConstantSpecial.ZIndex = ( (compZ >> 3) & 0xF);

	setShaderConstantSpecial.isWNegative = (compW & (0x1 << 0) ) ? true : false;
	setShaderConstantSpecial.isWPow2 = (compW & (0x1 << 1) ) ? true : false;
	setShaderConstantSpecial.isWSpec = (compW & (0x1 << 2) ) ? true : false;
	setShaderConstantSpecial.WIndex = ( (compW >> 3) & 0xF);

	setShaderConstantSpecial.checksum = command::ComputeChecksum(&setShaderConstantSpecial, sizeof(setShaderConstantSpecial) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setShaderConstantSpecial, sizeof(setShaderConstantSpecial) ) )
	{
		__debugbreak();
	}
#endif

	const HRESULT setShaderConstSpecialHR = SendOrStorePacket(&setShaderConstantSpecial);
	if (FAILED(setShaderConstSpecialHR) )
		return setShaderConstSpecialHR;

	if (DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedConstantRegisters[registerIndex] = registerData;
	}

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return setShaderConstSpecialHR;
}

HRESULT __stdcall IBaseGPUDevice::DeviceSetConstantData(const gpuvoid* const constantBufferMemory, const float4* const baseCPUFloat4RegisterFile, const BYTE startingRegisterIndex, const BYTE numFloat4Registers)
{
	if (!baseCPUFloat4RegisterFile)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (numFloat4Registers == 1 && IsFloatRegCompressible(baseCPUFloat4RegisterFile[startingRegisterIndex]) )
	{
		return DeviceSetConstantDataSingleSpecial(baseCPUFloat4RegisterFile[startingRegisterIndex], startingRegisterIndex);
	}

	if (!ValidateAddress(constantBufferMemory) )
		return E_INVALIDARG;

	if ( (const DWORD)constantBufferMemory % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Invalid pointer alignment! The buffer memory for the start of each constant range *must* be 32-byte aligned!
#endif
		return E_INVALIDARG;
	}

	if (numFloat4Registers == 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Need to specify at least one register
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation( (const gpuvoid* const)( (const DWORD)constantBufferMemory), numFloat4Registers * sizeof(float4) ) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() )
	{
		if (memcmp(baseCPUFloat4RegisterFile + startingRegisterIndex, currentCachedState.deviceCachedConstantRegisters + startingRegisterIndex, numFloat4Registers * sizeof(float4) ) == 0)
			return S_OK;
	}

	setShaderConstantCommand setShaderConstant;
	setShaderConstant.constantDataPointer = (const DWORD)constantBufferMemory;
	setShaderConstant.constantBaseRegisterIndex = startingRegisterIndex;
	setShaderConstant.numFloat4Registers = numFloat4Registers;
	setShaderConstant.checksum = command::ComputeChecksum(&setShaderConstant, sizeof(setShaderConstant) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&setShaderConstant, sizeof(setShaderConstant) ) )
	{
		__debugbreak();
	}
#endif

	const HRESULT setShaderConstHR = SendOrStorePacket(&setShaderConstant);
	if (FAILED(setShaderConstHR) )
		return setShaderConstHR;

	if (DoCacheDeviceState() )
	{
		memcpy(currentCachedState.deviceCachedConstantRegisters + startingRegisterIndex, baseCPUFloat4RegisterFile + startingRegisterIndex, numFloat4Registers * sizeof(float4) );
	}

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return setShaderConstHR;
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

HRESULT __stdcall IBaseGPUDevice::DeviceEnableShaderDebuggingForNextDrawCall(const gpuvoid* registerFileDumpAddress)
{
	if (!ValidateAddress(registerFileDumpAddress) )
		return E_INVALIDARG;

	if ( (const DWORD)registerFileDumpAddress % GPU_DRAM_TRANSACTION_SIZE_BYTES != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Invalid pointer alignment! The register file dump memory *must* be 2-kilobyte aligned!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(registerFileDumpAddress, sizeof(DeviceRegisterFile) ) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	debugShaderNextDrawCallCommand debugCommand;
	debugCommand.dumpRegistersAddress = (const DWORD)registerFileDumpAddress;

	debugCommand.checksum = command::ComputeChecksum(&debugCommand, sizeof(debugCommand) );
#ifdef _DEBUG
	if (!command::IsValidPacket(&debugCommand, sizeof(debugCommand) ) )
	{
		__debugbreak();
	}
#endif
	const HRESULT debugHR = SendOrStorePacket(&debugCommand);
	if (FAILED(debugHR) )
		return debugHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return debugHR;
}

HRESULT __stdcall IBaseGPUDevice::DeviceDrawIndexedPrimitive(const D3DPRIMITIVETYPE primType, const unsigned primitiveCount, const unsigned startIndex /*= 0*/, const int BaseVertexIndex /*= 0*/)
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

	// For "reasons", the startIndex is smaller for DrawPrimitive() (16 bits) than it is for DrawIndexedPrimitive() (20 bits)
	if (startIndex >= (1 << 20) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error: startIndex is out of range for our device!
#endif
		return E_INVALIDARG;
	}

	if (BaseVertexIndex >= MAXSHORT)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: BaseVertexIndex is out of range for our device!
#endif
		return E_INVALIDARG;
	}
	if (BaseVertexIndex <= (const int)( (const short)MINSHORT) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error: BaseVertexIndex is out of range for our device!
#endif
		return E_INVALIDARG;
	}

	// Can't render more than the maximum number of vertices allowed per draw call (2^24 vertices per draw call)
	if (primitiveCount > 0xFFFFFF / 3)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	drawIndexedCommand drawCommand;
	drawCommand.isIndexedDrawCall = true;
	drawCommand.numPrimitivesToDraw = primitiveCount;
	drawCommand.startIndexHigh = drawIndexedCommand::GetStartIndexHighBits(startIndex);
	drawCommand.startIndexLow = drawIndexedCommand::GetStartIndexLowBits(startIndex);
	drawCommand.BaseVertexIndex = drawIndexedCommand::ConvertBaseVertexIndex(BaseVertexIndex);
	drawCommand.primTopology = primType - 1;

#ifdef _DEBUG
	if (drawCommand.ExtractStartIndex() != startIndex)
	{
		__debugbreak();
	}
	if (drawCommand.ExtractBaseVertexIndex() != BaseVertexIndex)
	{
		__debugbreak();
	}
#endif

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

HRESULT __stdcall IBaseGPUDevice::DeviceDrawPrimitive(const D3DPRIMITIVETYPE primType, const unsigned primitiveCount, const unsigned StartVertex /*= 0*/)
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

	// For "reasons", the StartVertex is smaller for DrawPrimitive() (16 bits) than it is for DrawIndexedPrimitive() (20 bits)
	if (StartVertex >= (1 << 16) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error: StartVertex is out of range for our device!
#endif
		return E_INVALIDARG;
	}

	// Can't render more than the maximum number of vertices allowed per draw call (2^24 vertices per draw call)
	if (primitiveCount > 0xFFFFFF / 3)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	drawIndexedCommand drawCommand;
	drawCommand.isIndexedDrawCall = false;
	drawCommand.startIndexHigh = drawIndexedCommand::GetStartIndexHighBits(StartVertex);
	drawCommand.startIndexLow = drawIndexedCommand::GetStartIndexLowBits(StartVertex);
	drawCommand.BaseVertexIndex = 0;
	drawCommand.numPrimitivesToDraw = primitiveCount;
	drawCommand.primTopology = primType - 1;

#ifdef _DEBUG
	if (drawCommand.ExtractStartIndex() != StartVertex)
	{
		__debugbreak();
	}
#endif

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

	if (currentCachedState.deviceCachedROPState.deviceCachedWriteMask > wm_writeAll)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

	// Vertex stream 0 must *always* be set before a draw call!
	const bool vertexStream0IsValid = currentCachedState.deviceCachedVertexStreams[0].deviceCachedVertexBuffer != NULL;
	if (!vertexStream0IsValid)
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
	// Allow all of the standard configuration, setup, and CPU to GPU upload packets in a recorded command list:
	case command::PT_DONOTHING:
	case command::PT_WRITEMEM:
	case command::PT_CLEARMEM:
	case command::PT_CLEARBACKBUFFER:
	case command::PT_CLEARZSTENCILBUFFER:
	case command::PT_LOADTEXCACHEDATA:
	case command::PT_SETALPHATESTANDRTADDRESSSTATE:
	case command::PT_SETTEXTURESTATE:
	case command::PT_DRAWINDEXED:
	case command::PT_SETSCANOUTPOINTER:
	case command::PT_SETIASTATE:
	case command::PT_FLUSHROPCACHE:
	case command::PT_LOADSHADERINSTRUCTIONS:
	case command::PT_SETSHADERCONSTANT:
	case command::PT_SETVERTEXSTREAMDATA:
	case command::PT_SETSHADERCONSTANTSPECIAL:
	case command::PT_SETSHADERSTARTADDRESS:
	case command::PT_SETDEPTHSTATE:
	case command::PT_SETBLENDSTATE:
	case command::PT_SETCLIPSTATE:
	case command::PT_ISSUEQUERY:
	case command::PT_SETVIEWPORTPARAMS0:
	case command::PT_SETVIEWPORTPARAMS1:
	case command::PT_SETSCISSORRECT:
		return true;
	default:
#ifdef _DEBUG
		__debugbreak(); // Error: Unknown packet type!
#endif
	// Disallow all of the packet types that return data or read back data from the GPU to the CPU, since when executing a recorded command list
	// there won't be anybody listening to acknowledge that data:
	case command::PT_REMOVED7: // Don't allow removed packets in our recorded command buffers
	case command::PT_UNUSED23: // Don't allow removed packets in our recorded command buffers
	case command::PT_READMEM:
	case command::PT_READMEMRESPONSE:
	case command::PT_WAITFORDEVICEIDLE:
	case command::PT_WAITRESPONSE:
	case command::PT_ENDFRAMESTATS:
	case command::PT_ENDFRAME:
	case command::PT_RUNCOMMANDLIST: // No recursive recorded command lists allowed!
	case command::PT_DEBUGSHADERNEXTDRAWCALL:
		return false;
	}
	static_assert(command::PT_MAX_PACKET_TYPES == 39, "Reminder: Need to update this switch statement with new cases when adding new packets!");
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
