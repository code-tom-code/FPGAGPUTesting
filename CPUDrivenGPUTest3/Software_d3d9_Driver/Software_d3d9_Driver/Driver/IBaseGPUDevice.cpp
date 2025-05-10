#include "IBaseGPUDevice.h"
#include <intrin.h>
#include <stdio.h>
#include "../IDirect3DSurface9Hook.h"
#include "..\..\DriverShaderCompiler\DeviceShaderBytecode.h"
#include "..\..\ShaderTraceViewer\ShaderTrace.h"
#include "GPUCommandList.h"
#include "GPUDeviceLimits.h"
#include "DeviceConversions.h"
#include "GPUReturnTracker.h"

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

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceClearRendertarget(gpuvoid* const renderTargetMemory, const D3DCOLOR clearColor, const unsigned width, const unsigned height)
{
	if (!ValidateAddress(renderTargetMemory) )
		return E_INVALIDARG;

	if (width == 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Invalid for a render target to have 0-dimensions!
#endif
		return E_INVALIDARG;
	}

	if (height == 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Invalid for a render target to have 0-dimensions!
#endif
		return E_INVALIDARG;
	}

	if (width > 1024)
	{
#ifdef _DEBUG
		__debugbreak(); // Out of range render target size!
#endif
		return E_INVALIDARG;
	}

	if (height > 1024)
	{
#ifdef _DEBUG
		__debugbreak(); // Out of range render target size!
#endif
		return E_INVALIDARG;
	}

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

	if (!ValidateMemoryRangeExistsInsideAllocation(renderTargetMemory, width * height * sizeof(D3DCOLOR) ) )
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

	const HRESULT clearHR = SendOrStorePacket(&clearCommand);
	if (FAILED(clearHR) )
		return clearHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return clearHR;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceClearDepthStencil(gpuvoid* const zStencilMemory, const bool bDoClearDepth, const bool bDoClearStencil, 
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

	const HRESULT clearZStencilHR = SendOrStorePacket(&clearZStencil);
	if (FAILED(clearZStencilHR) )
		return clearZStencilHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return clearZStencilHR;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetTextureState(const unsigned texWidth, const unsigned texHeight, const eTexFilterMode filterMode, 
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

	loadTexCacheDataCommand loadTexCache;
	loadTexCache.sourceRAMAddr = (const DWORD)textureMemory;
	loadTexCache.loadSourceFormat = textureFormat;
	loadTexCache.loadTexelCount = (const USHORT)(texWidth * texHeight);
	loadTexCache.checksum = command::ComputeChecksum(&loadTexCache, sizeof(loadTexCache) );

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

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetNullTextureState(const eTexFilterMode filterMode, 
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

	loadTexCacheDataCommand loadTexCache;
	loadTexCache.sourceRAMAddr = (const DWORD)NULL;
	loadTexCache.loadSourceFormat = eTexFmtA8R8G8B8;
	loadTexCache.loadTexelCount = (const USHORT)0;
	loadTexCache.checksum = command::ComputeChecksum(&loadTexCache, sizeof(loadTexCache) );

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

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetROPState(gpuvoid* const renderTargetMemory, const eBlendMask writeMask, const bool alphaTestEnabled, const BYTE alphaTestRefVal, const eCmpFunc alphaTestCmpFunc,
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
	const unsigned uf = *(const unsigned* const)&f;
	const unsigned biasedExponent = (uf & 0x7FFFFFFF) >> 23;
	const int signedExponent = biasedExponent - 127;
	const unsigned ret = (const unsigned)signedExponent;
#ifdef _DEBUG
	if ( (1 << ret) != f)
	{
		__debugbreak(); // Value passed in must be an exact positive integer power of 2
	}
#endif
	return ret;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetTriSetupState(const float viewportHalfWidth, const float viewportHalfHeight,
	const float viewportXOffset, const float viewportYOffset,
	const float viewportZScale, const float viewportZOffset,
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
	newTriSetupState.deviceCachedViewportXOffset = viewportXOffset;
	newTriSetupState.deviceCachedViewportYOffset = viewportYOffset;
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

	setViewportStateXYCommand setViewportXY;
	setViewportXY.viewportXOffset = viewportXOffset;
	setViewportXY.viewportYOffset = viewportYOffset;
	setViewportXY.checksum = command::ComputeChecksum(&setViewportXY, sizeof(setViewportXY) );

	setViewportState1Command setViewport1;
	setViewport1.viewportZScale = viewportZScale;
	setViewport1.viewportZOffset = viewportZOffset;
	setViewport1.checksum = command::ComputeChecksum(&setViewport1, sizeof(setViewport1) );

	setScissorRectCommand setScissorRect;
	setScissorRect.scissorLeft = scissorRectLeft;
	setScissorRect.scissorRight = scissorRectRight;
	setScissorRect.scissorTop = scissorRectTop;
	setScissorRect.scissorBottom = scissorRectBottom;
	setScissorRect.checksum = command::ComputeChecksum(&setScissorRect, sizeof(setScissorRect) );

	const HRESULT hRetViewport0 = SendOrStorePacket(&setViewport0);
	const HRESULT hRetViewportXY = SendOrStorePacket(&setViewportXY);
	const HRESULT hRetViewport1 = SendOrStorePacket(&setViewport1);
	const HRESULT hRetScissorRect = SendOrStorePacket(&setScissorRect);
	if (SUCCEEDED(hRetViewport0) && SUCCEEDED(hRetViewportXY) && SUCCEEDED(hRetViewport1) && SUCCEEDED(hRetScissorRect) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedTriSetupState = newTriSetupState;
	}
	if (FAILED(hRetViewport0) )
		return hRetViewport0;
	if (FAILED(hRetViewportXY) )
		return hRetViewportXY;
	if (FAILED(hRetViewport1) )
		return hRetViewport1;
	if (FAILED(hRetScissorRect) )
		return hRetScissorRect;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRetViewport0;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetClipState(const bool depthClipEnabled, const bool useOpenGLNearZClip, const float guardBandXScale, const float guardBandYScale, const bool clippingEnabled)
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
			&& currentCachedState.deviceCachedGuardBandXScale == guardBandXScaleLog2 && currentCachedState.deviceCachedGuardBandYScale == guardBandYScaleLog2 && currentCachedState.deviceCachedClippingEnable == clippingEnabled)
		return S_OK;

	setClipperStateCommand setClipState;
	setClipState.depthClipEnable = depthClipEnabled;
	setClipState.useOpenGLNearZClip = useOpenGLNearZClip;
	setClipState.guardBandScaleX = guardBandXScaleLog2;
	setClipState.guardBandScaleY = guardBandYScaleLog2;
	setClipState.clippingEnabled = clippingEnabled;
	setClipState.checksum = command::ComputeChecksum(&setClipState, sizeof(setClipState) );

	const HRESULT hRet = SendOrStorePacket(&setClipState);
	if (SUCCEEDED(hRet) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedDepthClipEnable = depthClipEnabled;
		currentCachedState.deviceCachedOpenGLNearZClipMode = useOpenGLNearZClip;
		currentCachedState.deviceCachedGuardBandXScale = guardBandXScaleLog2;
		currentCachedState.deviceCachedGuardBandYScale = guardBandYScaleLog2;
		currentCachedState.deviceCachedClippingEnable = clippingEnabled;
	}
	if (FAILED(hRet) )
		return hRet;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetAttrInterpolatorState(const bool useFlatShadingColor, const eTexcoordAddressingMode addressU, const eTexcoordAddressingMode addressV)
{
	if (addressU >= eTexcoordAddressingMode_NUM_ADDR_MODES)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (addressV >= eTexcoordAddressingMode_NUM_ADDR_MODES)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() && currentCachedState.deviceAddressingU == addressU && currentCachedState.deviceAddressingV == addressV && currentCachedState.deviceCachedUseFlatShadingColor == useFlatShadingColor)
		return S_OK;

	setAttrInterpolatorStateCommand setAttrInterpolatorState;
	setAttrInterpolatorState.addressingU = addressU;
	setAttrInterpolatorState.addressingV = addressV;
	setAttrInterpolatorState.useFlatShadingColor = useFlatShadingColor;
	setAttrInterpolatorState.checksum = command::ComputeChecksum(&setAttrInterpolatorState, sizeof(setAttrInterpolatorState) );

	const HRESULT hRet = SendOrStorePacket(&setAttrInterpolatorState);
	if (SUCCEEDED(hRet) && DoCacheDeviceState() )
	{
		currentCachedState.deviceAddressingU = addressU;
		currentCachedState.deviceAddressingV = addressV;
		currentCachedState.deviceCachedUseFlatShadingColor = useFlatShadingColor;
	}
	if (FAILED(hRet) )
		return hRet;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetDepthStencilState(const bool zEnabled, const bool zWriteEnabled, const bool colorWriteEnabled, const eCmpFunc zTestCmpFunc, const eDepthFormat zFormat, const float depthBias,
	const bool stencilWriteEnabled, const unsigned char stencilRef, const unsigned char stencilReadMask, const unsigned char stencilWriteMask, const eCmpFunc stencilFunc,
	const eStencilOp stencilFailOp, const eStencilOp stencilZFailOp, const eStencilOp stencilPassOp)
{
	if (zTestCmpFunc >= cmp_MAX_CMP_FUNCS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (stencilFunc >= cmp_MAX_CMP_FUNCS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (stencilFailOp >= sop_MAX_STENCIL_OPS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (stencilZFailOp >= sop_MAX_STENCIL_OPS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	if (stencilPassOp >= sop_MAX_STENCIL_OPS)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	DepthStencilStateBlock newDepthStencilState;

	// Depth states:
	newDepthStencilState.deviceCachedZEnabled = zEnabled;
	newDepthStencilState.deviceCachedZWriteEnabled = zWriteEnabled;
	newDepthStencilState.deviceColorWritesEnabled = colorWriteEnabled;
	newDepthStencilState.deviceCachedDepthTestCmpFunc = zTestCmpFunc;
	newDepthStencilState.deviceDepthBias = depthBias;
	newDepthStencilState.deviceDepthFormat = zFormat;

	// Stencil states:
	newDepthStencilState.deviceStencilWriteEnabled = stencilWriteEnabled;
	newDepthStencilState.deviceStencilRef = stencilRef;
	newDepthStencilState.deviceStencilReadMask = stencilReadMask;
	newDepthStencilState.deviceStencilWriteMask = stencilWriteMask;
	newDepthStencilState.deviceStencilFunc = stencilFunc;
	newDepthStencilState.deviceStencilFailOp = stencilFailOp;
	newDepthStencilState.deviceStencilZFailOp = stencilZFailOp;
	newDepthStencilState.deviceStencilPassOp = stencilPassOp;

	if (DoCacheDeviceState() && currentCachedState.deviceCachedDepthStencilState == newDepthStencilState)
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
	setDepthState.hasStencilStateFollowing = newDepthStencilState.IsStencilEnabled();
	setDepthState.checksum = command::ComputeChecksum(&setDepthState, sizeof(setDepthState) );

	setStencilStateCommand setStencilState;
	setStencilState.stencilRefVal = stencilRef;
	setStencilState.stencilReadMask = stencilReadMask;
	setStencilState.stencilWriteMask = stencilWriteMask;
	setStencilState.stencilWriteEnable = stencilWriteEnabled;
	setStencilState.stencilCmpFunc = stencilFunc;
	setStencilState.stencilFailOp = stencilFailOp;
	setStencilState.stencilZFailOp = stencilZFailOp;
	setStencilState.stencilPassOp = stencilPassOp;
	setStencilState.checksum = command::ComputeChecksum(&setStencilState, sizeof(setStencilState) );

	HRESULT hRetDepthStencil = SendOrStorePacket(&setDepthState);
	if (setDepthState.hasStencilStateFollowing && SUCCEEDED(hRetDepthStencil) )
	{
		hRetDepthStencil = SendOrStorePacket(&setStencilState);
	}
	if (SUCCEEDED(hRetDepthStencil) && DoCacheDeviceState() )
	{
		currentCachedState.deviceCachedDepthStencilState = newDepthStencilState;
	}
	if (FAILED(hRetDepthStencil) )
		return hRetDepthStencil;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRetDepthStencil;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetIAState(const eCullMode cullMode, const ePrimTopology primTopology, const eStripCutType stripCut, const eIndexFormat indexFormat, const unsigned indexBufferLengthBytes, const gpuvoid* const indexBufferBaseAddr)
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

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetScanoutBuffer(const gpuvoid* const renderTargetMemory, const bool bEnableScanout/* = true*/, const bool invertScanoutColors /*= false*/, 
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

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceDownloadEndOfFrameStats(const gpuvoid* const statsMemory, DWORD* const outReadbackStatsData)
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
	endFrameStatsReadbackCmd.checksum = command::ComputeChecksum(&endFrameStatsReadbackCmd, sizeof(endFrameStatsReadbackCmd) );

	const HRESULT hRet = SendOrStorePacket(&endFrameStatsReadbackCmd);
	if (FAILED(hRet) )
		return hRet;

	if (DoSyncEveryCall() )
		DeviceWaitForIdle();

	setStatsEventConfigCommand configNoEventFrame;
	configNoEventFrame.eventsOrStatsAddress = (const DWORD)statsMemory;
	configNoEventFrame.eventOrdersAddress = NULL;
	configNoEventFrame.enableEventRecording = false;
	configNoEventFrame.checksum = command::ComputeChecksum(&configNoEventFrame, sizeof(configNoEventFrame) );

	const HRESULT hEventConfigRet = SendOrStorePacket(&configNoEventFrame);
	if (FAILED(hEventConfigRet) )
		return hEventConfigRet;

	if (DoSyncEveryCall() )
		DeviceWaitForIdle();

	// Wait for the memory controller to be done working before we try to read back our stats data from the frame
	DeviceWaitForIdle(waitForDeviceIdleCommand::waitForMemControllerIdle);

	return SyncReadFromDevice(statsMemory, outReadbackStatsData, sizeof(DWORD) * endFrameStatsResponse::TotalAllStatsCount);
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceEndFrameAndFinishEventRecording(const gpuvoid* const eventTimestampsMemory, const gpuvoid* const eventOrderingMemory, DWORD* const outReadbackEventTimestamps, USHORT* const outReadbackEventOrderings, DWORD* const outReadbackEventsHeaderBlock)
{
	if (currentlyRecordingCommandList != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Illegal to call this function while we are recording a command list!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateAddress(eventTimestampsMemory) )
		return E_INVALIDARG;

	if (!ValidateAddress(eventOrderingMemory) )
		return E_INVALIDARG;

	if (!ValidateMemoryRangeExistsInsideAllocation(eventTimestampsMemory, sizeof(EventTimestamp) * NUM_GPU_EVENT_SYSTEMS_TRACKED * MAX_NUM_EVENTS_PER_FRAME) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(eventOrderingMemory, sizeof(USHORT) * NUM_GPU_EVENT_SYSTEMS_TRACKED * MAX_NUM_EVENTS_PER_FRAME) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (!outReadbackEventTimestamps)
	{
#ifdef _DEBUG
		__debugbreak(); // Can't pass in a null pointer for the return data
#endif
		return E_INVALIDARG;
	}

	if (!outReadbackEventOrderings)
	{
#ifdef _DEBUG
		__debugbreak(); // Can't pass in a null pointer for the return data
#endif
		return E_INVALIDARG;
	}

	if (!outReadbackEventsHeaderBlock)
	{
#ifdef _DEBUG
		__debugbreak(); // Can't pass in a null pointer for the return data
#endif
		return E_INVALIDARG;
	}

	endFrameCommand endFrameCmd;
	endFrameCmd.checksum = command::ComputeChecksum(&endFrameCmd, sizeof(endFrameCmd) );

	const HRESULT hRet = SendOrStorePacket(&endFrameCmd);
	if (FAILED(hRet) )
		return hRet;

	if (DoSyncEveryCall() )
		DeviceWaitForIdle();

	// Wait for the memory controller and everything else to be done working before we try to read back our stats event data from the frame
	DeviceWaitForIdle(waitForDeviceIdleCommand::waitForFullPipelineFlush);

	// Offset our reads by +32 bytes to account for the fact that the events header block comes first followed by the actual event data after that
	printf("Downloading %u bytes from device for event timestamps (GPU 0x%08X -> CPU 0x%08X)...\n", (const DWORD)(sizeof(EventTimestamp) * NUM_GPU_EVENT_SYSTEMS_TRACKED * MAX_NUM_EVENTS_PER_FRAME), reinterpret_cast<const DWORD>( (const BYTE* const)eventTimestampsMemory + sizeof(EventDataHeaderBlock) ), reinterpret_cast<const DWORD>(outReadbackEventTimestamps) );
	SyncReadFromDevice( (const gpuvoid* const)( (const BYTE* const)eventTimestampsMemory + sizeof(EventDataHeaderBlock) ), outReadbackEventTimestamps, sizeof(EventTimestamp) * NUM_GPU_EVENT_SYSTEMS_TRACKED * MAX_NUM_EVENTS_PER_FRAME);
	printf("Downloading %u bytes from device for event orderings (GPU 0x%08X -> CPU 0x%08X)...\n", (const DWORD)(sizeof(USHORT) * NUM_GPU_EVENT_SYSTEMS_TRACKED * MAX_NUM_EVENTS_PER_FRAME), reinterpret_cast<const DWORD>( (const BYTE* const)eventOrderingMemory + sizeof(EventDataHeaderBlock) ), reinterpret_cast<const DWORD>(outReadbackEventOrderings) );
	SyncReadFromDevice( (const gpuvoid* const)( (const BYTE* const)eventOrderingMemory + sizeof(EventDataHeaderBlock) ), outReadbackEventOrderings, sizeof(USHORT) * NUM_GPU_EVENT_SYSTEMS_TRACKED * MAX_NUM_EVENTS_PER_FRAME);
	printf("Downloading %u bytes from device for event block header (GPU 0x%08X -> CPU 0x%08X)...\n", (const DWORD)(sizeof(EventDataHeaderBlock) ), reinterpret_cast<const DWORD>(eventTimestampsMemory), reinterpret_cast<const DWORD>(outReadbackEventsHeaderBlock) );
	SyncReadFromDevice(eventTimestampsMemory, outReadbackEventsHeaderBlock, sizeof(EventDataHeaderBlock) );

	setStatsEventConfigCommand configNoEventFrame;
	configNoEventFrame.eventsOrStatsAddress = (const DWORD)eventTimestampsMemory;
	configNoEventFrame.eventOrdersAddress = (const DWORD)eventOrderingMemory;
	configNoEventFrame.enableEventRecording = true;
	configNoEventFrame.checksum = command::ComputeChecksum(&configNoEventFrame, sizeof(configNoEventFrame) );

	const HRESULT hEventConfigRet = SendOrStorePacket(&configNoEventFrame);
	if (FAILED(hEventConfigRet) )
		return hEventConfigRet;

	if (DoSyncEveryCall() )
		DeviceWaitForIdle();

	return hEventConfigRet;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceEndFrameAndQueueEventRecording(gpuvoid* const eventTimestampsMemory, gpuvoid* const eventOrderingMemory)
{
	if (currentlyRecordingCommandList != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Illegal to call this function while we are recording a command list!
#endif
		return E_INVALIDARG;
	}

	endFrameCommand endFrameCmd;
	endFrameCmd.checksum = command::ComputeChecksum(&endFrameCmd, sizeof(endFrameCmd) );

	const HRESULT hRet = SendOrStorePacket(&endFrameCmd);
	if (FAILED(hRet) )
		return hRet;

	if (DoSyncEveryCall() )
		DeviceWaitForIdle();

	setStatsEventConfigCommand configEventRecordingNextFrame;
	configEventRecordingNextFrame.eventsOrStatsAddress = (DWORD)eventTimestampsMemory;
	configEventRecordingNextFrame.eventOrdersAddress = (DWORD)eventOrderingMemory;
	configEventRecordingNextFrame.enableEventRecording = true; // Queue event recording next frame
	configEventRecordingNextFrame.checksum = command::ComputeChecksum(&configEventRecordingNextFrame, sizeof(configEventRecordingNextFrame) );

	const HRESULT hEventConfigRet = SendOrStorePacket(&configEventRecordingNextFrame);
	if (FAILED(hEventConfigRet) )
		return hEventConfigRet;

	if (DoSyncEveryCall() )
		DeviceWaitForIdle();

	return S_OK;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceEndFrame()
{
	if (currentlyRecordingCommandList != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Illegal to call this function while we are recording a command list!
#endif
		return E_INVALIDARG;
	}

	endFrameCommand endFrameCmd;
	endFrameCmd.checksum = command::ComputeChecksum(&endFrameCmd, sizeof(endFrameCmd) );

	const HRESULT hRet = SendOrStorePacket(&endFrameCmd);
	if (FAILED(hRet) )
		return hRet;

	if (DoSyncEveryCall() )
		DeviceWaitForIdle();

	setStatsEventConfigCommand configNoEventFrame;
	configNoEventFrame.eventsOrStatsAddress = NULL;
	configNoEventFrame.eventOrdersAddress = NULL;
	configNoEventFrame.enableEventRecording = false;
	configNoEventFrame.checksum = command::ComputeChecksum(&configNoEventFrame, sizeof(configNoEventFrame) );

	const HRESULT hEventConfigRet = SendOrStorePacket(&configNoEventFrame);
	if (FAILED(hEventConfigRet) )
		return hEventConfigRet;

	if (DoSyncEveryCall() )
		DeviceWaitForIdle();

	return S_OK;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceIssueQuery(const gpuvoid* const queryAddress, const bool isEndEvent, const eQueryType queryType)
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

	const HRESULT hRet = SendOrStorePacket(&issueQuery);
	if (FAILED(hRet) )
		return hRet;
	
	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return hRet;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceLoadVertexShader(const gpuvoid* const vertexShaderMemory, const unsigned short numShaderTokensToLoad, const bool forceLoadVertexShader/* = false*/, const unsigned short targetAddressToLoadTo/* = 0*/)
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

	if (!ValidateMemoryRangeExistsInsideAllocation(vertexShaderMemory, numShaderTokensToLoad * sizeof(instructionSlot) + sizeof(DeviceShaderHeader) ) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	if (DoCacheDeviceState() && currentCachedState.deviceCachedVertexShader == vertexShaderMemory && !forceLoadVertexShader)
		return S_OK;

	loadShaderInstructionsCommand loadShaderInstructions;
	loadShaderInstructions.shaderStartAddress = (const DWORD)vertexShaderMemory + sizeof(DeviceShaderHeader); // Advance past the shader header block, since the GPU won't be reading that part into the instruction-RAM
	loadShaderInstructions.shaderLengthTokens = numShaderTokensToLoad;
	loadShaderInstructions.shaderLoadTargetOffset = targetAddressToLoadTo;
	loadShaderInstructions.checksum = command::ComputeChecksum(&loadShaderInstructions, sizeof(loadShaderInstructions) );

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
		currentCachedState.deviceCachedVertexStreams[0].usageType = UT_Position;
		currentCachedState.deviceCachedVertexStreams[0].usageIndex = 0;

		currentCachedState.deviceCachedVertexShader = vertexShaderMemory;
	}

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return loadVertexShaderHR;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetVertexShaderStartAddr(const unsigned short shaderStartAddress)
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

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetVertexStreamData(const gpuvoid* const vertexStreamData, const unsigned vertexBufferLengthBytes, const BYTE dwordCount, const BYTE streamID, 
	const bool isD3DCOLOR, const BYTE shaderInputRegIndex, const BYTE dwordStride, const BYTE dwordOffset, const BYTE numVertexStreamsTotal, const D3DDECLUSAGE usage, const BYTE usageIndex)
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

	if (usage < D3DDECLUSAGE_POSITION || usage > D3DDECLUSAGE_SAMPLE)
	{
#ifdef _DEBUG
		__debugbreak(); // Out of range usage type!
#endif
		return E_INVALIDARG;
	}

	if (usageIndex > 7)
	{
#ifdef _DEBUG
		__debugbreak(); // Out of range usage index!
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
	compareVertexStream.usageType = ConvertToDeviceDeclUsage(usage);
	compareVertexStream.usageIndex = usageIndex;

	//if (DoCacheDeviceState() && currentCachedState.deviceCachedVertexStreams[streamID] == compareVertexStream) // TODO: DO we actually want to cache this? What if we have a dynamic vertex buffer?
		//return S_OK;

	setVertexStreamDataCommand setVertexStreamData;
	setVertexStreamData.streamBaseAddress = (const DWORD)vertexStreamData;
	setVertexStreamData.dwordCount = (const setVertexStreamDataCommand::dwordCountType)(dwordCount - 1); // Convert from 0-based to 1-based element DWORD count here
	setVertexStreamData.streamID = streamID;
	setVertexStreamData.isD3DCOLOR = isD3DCOLOR ? TRUE : FALSE;
	setVertexStreamData.shaderInputRegIndex = shaderInputRegIndex;
	setVertexStreamData.dwordStride = dwordStride;
	setVertexStreamData.dwordOffset = dwordOffset;
	setVertexStreamData.inputUsage = ConvertToDeviceDeclUsage(usage);
#ifdef _DEBUG
	if (usageIndex > 1)
	{
		__debugbreak(); // We technically don't support usage indices beyond 1 (for COLOR1 or TEXCOORD1)
	}
#endif
	setVertexStreamData.inputUsageIndex = usageIndex;
	setVertexStreamData.numVertexStreamsTotal = numVertexStreamsTotal;
	setVertexStreamData.checksum = command::ComputeChecksum(&setVertexStreamData, sizeof(setVertexStreamData) );

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
	component = fabsf(component);

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

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetConstantDataSingleSpecial(const float4& registerData, const BYTE registerIndex)
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

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceSetConstantData(const gpuvoid* const constantBufferMemory, const float4* const baseCPUFloat4RegisterFile, const BYTE startingRegisterIndex, const BYTE numFloat4Registers)
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

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceEnableShaderDebuggingForNextDrawCall(const gpuvoid* registerFileDumpAddress)
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

	const HRESULT debugHR = SendOrStorePacket(&debugCommand);
	if (FAILED(debugHR) )
		return debugHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return debugHR;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceDrawIndexedPrimitive(const D3DPRIMITIVETYPE primType, const unsigned primitiveCount, const unsigned startIndex /*= 0*/, const int BaseVertexIndex /*= 0*/)
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

		if (currentCachedState.deviceCachedIAIndexBuffer == NULL)
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

	const HRESULT drawHR = SendOrStorePacket(&drawCommand);
	if (FAILED(drawHR) )
		return drawHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return drawHR;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceDrawPrimitive(const D3DPRIMITIVETYPE primType, const unsigned primitiveCount, const unsigned StartVertex /*= 0*/)
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

	const HRESULT drawHR = SendOrStorePacket(&drawCommand);
	if (FAILED(drawHR) )
		return drawHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return drawHR;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceExecuteCommandList(const GPUCommandList& commandList)
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

	const HRESULT runCommandListHR = SendOrStorePacket(&execCommandListCommand);
	if (FAILED(runCommandListHR) )
		return runCommandListHR;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();
	return runCommandListHR;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceEmulateExecuteCommandList(const GPUCommandList& commandList)
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

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceFlushROPCache()
{
	flushROPCacheCommand flushCommand;
	flushCommand.checksum = command::ComputeChecksum(&flushCommand, sizeof(flushCommand) );

	const HRESULT hrSend = SendOrStorePacket(&flushCommand);
	if (FAILED(hrSend) )
		return hrSend;

	if (DoSyncEveryCall() )
		return DeviceWaitForIdle();

	return hrSend;
}

__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceWaitForIdle(const waitForDeviceIdleCommand::waitForDeviceSubsystem waitFlags/* = waitForDeviceIdleCommand::waitForFullPipelineFlush*/, const bool cpuGpuSync /*= false*/, const bool printStatus /*= false*/)
{
	if (currentlyRecordingCommandList != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Illegal to call this function while recording a command list!
#endif
		return E_INVALIDARG;
	}

#ifdef PRINT_COMMS
	if (printStatus && cpuGpuSync)
		printf("Entering device wait for idle (0x%08X)...\n", waitFlags);
#endif

	waitForDeviceIdleCommand waitCommand;
	waitCommand.waitBitmask = waitFlags;
	waitCommand.returnCPUValue = cpuGpuSync; // Should we bother having the GPU return the wait-complete message back to the CPU after it's finished waiting?
	if (cpuGpuSync)
		waitCommand.returnValueToCPU = currentWaitLabel++;
	else
		waitCommand.returnValueToCPU = 0;
	waitCommand.checksum = command::ComputeChecksum(&waitCommand, sizeof(waitCommand) );

	if (cpuGpuSync)
		GetReturnTrackerSingleton().RegisterNewWaitForIdleReturn(&waitCommand);
	const HRESULT hrSend = SendOrStorePacket(&waitCommand);
	if (FAILED(hrSend) )
		return hrSend;

	if (cpuGpuSync)
	{
		const DWORD startingTick = GetTickCount();
		GetReturnTrackerSingleton().SyncGetWaitReturn(waitCommand.returnValueToCPU, deviceComms);
		const DWORD endingTick = GetTickCount();
#ifdef PRINT_COMMS
		if (printStatus)
			printf("...Finished wait after %ums\n", endingTick - startingTick);
#endif
	}

	return S_OK;
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
	case command::PT_SETVIEWPORTPARAMSXY:
	case command::PT_SETVIEWPORTPARAMS1:
	case command::PT_SETSCISSORRECT:
	case command::PT_SETSTATSEVENTCONFIG:
	case command::PT_SETINTERPOLATORSTATE:
	case command::PT_WRITEMEMBATCHCONFIG:
	case command::PT_WRITEMEMBATCH0:
	case command::PT_WRITEMEMBATCH1:
	case command::PT_WRITEMEMBATCH2:
	case command::PT_WRITEMEMBATCH3WRITE:
	case command::PT_SETSTENCILSTATE:
		return true;
	default:
#ifdef _DEBUG
		__debugbreak(); // Error: Unknown packet type!
#endif
	// Disallow all of the packet types that return data or read back data from the GPU to the CPU, since when executing a recorded command list
	// there won't be anybody listening to acknowledge that data:
	case command::PT_READMEM:
	case command::PT_READMEMRESPONSE:
	case command::PT_WAITFORDEVICEIDLE:
	case command::PT_WAITRESPONSE:
	case command::PT_ENDFRAMESTATS:
	case command::PT_ENDFRAME:
	case command::PT_RUNCOMMANDLIST: // No recursive recorded command lists allowed!
	case command::PT_DEBUGSHADERNEXTDRAWCALL:

	// These networking-only packets should not show up at all in recorded command lists!
	case command::PT_CONNBROADCAST:
	case command::PT_CONNREQUEST:
	case command::PT_CONNRESPONSE:
	case command::PT_SESSIONCOMBOPACKET:
	case command::PT_DISCONNECT:
		return false;
	}
	static_assert(command::PT_MAX_PACKET_TYPES == 46, "Reminder: Need to update this switch statement with new cases when adding new packets!");
}

__declspec(nothrow) HRESULT IBaseGPUDevice::SendOrStorePacket(const command* const sendPacket)
{
	if (sendPacket == NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot send a NULL packet!
#endif
		return E_INVALIDARG;
	}

#ifdef _DEBUG
	if (!command::IsValidPacket(sendPacket, sizeof(genericCommand) ) )
	{
		__debugbreak();
	}
#endif

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

	currentlyRecordingCommandList->FinishRecordingAndUpload(this);

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

// Sets device memory from deviceDestAddr to deviceDestAddr + dwByteLength with the DWORD value specified in dwSetVal.
__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceMemSet(gpuvoid* const deviceDestAddr, const DWORD dwSetVal, const DWORD dwByteLength)
{
	if (dwByteLength % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can only set whole-DWORD byte lengths!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength < sizeof(DWORD) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can't set less than 1 DWORD's worth of data!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory write start!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr + dwByteLength >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory write end!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Device address must be DWORD-aligned!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Cannot read/write from the NULL page!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(deviceDestAddr, dwByteLength) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	const unsigned numDwords = dwByteLength / sizeof(DWORD);
	bool hasConfiguredBatchWrites = false;
	for (unsigned dwordID = 0; dwordID < numDwords;)
	{
		const DWORD thisWriteAddr = dwordID * sizeof(DWORD) + (const DWORD)deviceDestAddr;
		if (thisWriteAddr % GPU_DRAM_TRANSACTION_SIZE_BYTES == 0 && 
			numDwords - dwordID >= 8) // Aligned batched writes of entire DRAM rows:
		{
			BYTE stackPackets[sizeof(genericCommand) * 5];
			if (hasConfiguredBatchWrites == false)
			{
				writeMemBatchConfigCommand* const batchConfigPacket = new (stackPackets) writeMemBatchConfigCommand();
				batchConfigPacket->writeBeginAddr = thisWriteAddr;
				batchConfigPacket->SetComputeChecksum(batchConfigPacket);
			}

			writeMemBatchData0Command* const writeData0Packet = new (stackPackets + sizeof(genericCommand) * 1) writeMemBatchData0Command();
			writeMemBatchData1Command* const writeData1Packet = new (stackPackets + sizeof(genericCommand) * 2) writeMemBatchData1Command();
			writeMemBatchData2Command* const writeData2Packet = new (stackPackets + sizeof(genericCommand) * 3) writeMemBatchData2Command();
			writeMemBatchData3WriteCommand* const writeData3Packet = new (stackPackets + sizeof(genericCommand) * 4) writeMemBatchData3WriteCommand();

			writeData0Packet->writeDWORDData0 = dwSetVal;
			writeData0Packet->writeDWORDData1 = dwSetVal;
			writeData1Packet->writeDWORDData2 = dwSetVal;
			writeData1Packet->writeDWORDData3 = dwSetVal;
			writeData2Packet->writeDWORDData4 = dwSetVal;
			writeData2Packet->writeDWORDData5 = dwSetVal;
			writeData3Packet->writeDWORDData6 = dwSetVal;
			writeData3Packet->writeDWORDData7 = dwSetVal;
			writeData0Packet->SetComputeChecksum(writeData0Packet);
			writeData1Packet->SetComputeChecksum(writeData1Packet);
			writeData2Packet->SetComputeChecksum(writeData2Packet);
			writeData3Packet->SetComputeChecksum(writeData3Packet);

			if (hasConfiguredBatchWrites == false)
			{
				const HRESULT sendHR = deviceComms->SendLoop(stackPackets, sizeof(genericCommand) * 5);
				if (FAILED(sendHR) )
					return sendHR;
				hasConfiguredBatchWrites = true;
			}
			else
			{
				const HRESULT sendHR = deviceComms->SendLoop(stackPackets + sizeof(genericCommand), sizeof(genericCommand) * 4);
				if (FAILED(sendHR) )
					return sendHR;
			}

			dwordID += 8;
		}
		else
		{
			writeMemCommand newWriteMemPacket;
			newWriteMemPacket.writeDWORDAddr = thisWriteAddr;
			newWriteMemPacket.writeVal = dwSetVal;
			newWriteMemPacket.SetComputeChecksum(&newWriteMemPacket);

			const HRESULT sendHR = deviceComms->SendLoop( (const BYTE* const)&newWriteMemPacket, sizeof(newWriteMemPacket) );
			if (FAILED(sendHR) )
				return sendHR;

			++dwordID;
		}
	}

	return S_OK;
}

// Copies a block of memory from host memory to device memory.
__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceMemCopy(gpuvoid* const deviceDestAddr, const void* const sourceCPUAddr, const DWORD dwByteLength)
{
	if (!sourceCPUAddr)
	{
#ifdef _DEBUG
		__debugbreak(); // NULL is not a valid source CPU address!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can only set whole-DWORD byte lengths!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength < sizeof(DWORD) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can't set less than 1 DWORD's worth of data!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory write start!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr + dwByteLength >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory write end!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Device address must be DWORD-aligned!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Cannot read/write from the NULL page!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(deviceDestAddr, dwByteLength) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	const DWORD* const readMem = (const DWORD* const)sourceCPUAddr;
	const unsigned numDwords = dwByteLength / sizeof(DWORD);
	bool hasConfiguredBatchWrites = false;
	for (unsigned dwordID = 0; dwordID < numDwords;)
	{
		const DWORD thisWriteAddr = dwordID * sizeof(DWORD) + (const DWORD)deviceDestAddr;
		if (thisWriteAddr % GPU_DRAM_TRANSACTION_SIZE_BYTES == 0 && 
			numDwords - dwordID >= 8) // Aligned batched writes of entire DRAM rows:
		{
			BYTE stackPackets[sizeof(genericCommand) * 5];
			if (hasConfiguredBatchWrites == false)
			{
				writeMemBatchConfigCommand* const batchConfigPacket = new (stackPackets) writeMemBatchConfigCommand();
				batchConfigPacket->writeBeginAddr = thisWriteAddr;
				batchConfigPacket->SetComputeChecksum(batchConfigPacket);
			}

			writeMemBatchData0Command* const writeData0Packet = new (stackPackets + sizeof(genericCommand) * 1) writeMemBatchData0Command();
			writeMemBatchData1Command* const writeData1Packet = new (stackPackets + sizeof(genericCommand) * 2) writeMemBatchData1Command();
			writeMemBatchData2Command* const writeData2Packet = new (stackPackets + sizeof(genericCommand) * 3) writeMemBatchData2Command();
			writeMemBatchData3WriteCommand* const writeData3Packet = new (stackPackets + sizeof(genericCommand) * 4) writeMemBatchData3WriteCommand();

			writeData0Packet->writeDWORDData0 = readMem[dwordID + 0];
			writeData0Packet->writeDWORDData1 = readMem[dwordID + 1];
			writeData1Packet->writeDWORDData2 = readMem[dwordID + 2];
			writeData1Packet->writeDWORDData3 = readMem[dwordID + 3];
			writeData2Packet->writeDWORDData4 = readMem[dwordID + 4];
			writeData2Packet->writeDWORDData5 = readMem[dwordID + 5];
			writeData3Packet->writeDWORDData6 = readMem[dwordID + 6];
			writeData3Packet->writeDWORDData7 = readMem[dwordID + 7];
			writeData0Packet->SetComputeChecksum(writeData0Packet);
			writeData1Packet->SetComputeChecksum(writeData1Packet);
			writeData2Packet->SetComputeChecksum(writeData2Packet);
			writeData3Packet->SetComputeChecksum(writeData3Packet);

			if (hasConfiguredBatchWrites == false)
			{
				const HRESULT sendHR = deviceComms->SendLoop(stackPackets, sizeof(genericCommand) * 5);
				if (FAILED(sendHR) )
					return sendHR;
				hasConfiguredBatchWrites = true;
			}
			else
			{
				const HRESULT sendHR = deviceComms->SendLoop(stackPackets + sizeof(genericCommand), sizeof(genericCommand) * 4);
				if (FAILED(sendHR) )
					return sendHR;
			}

			dwordID += 8;
		}
		else // Single-DWORD writes
		{
			const DWORD newVal = readMem[dwordID];
			writeMemCommand newWriteMemPacket;
			newWriteMemPacket.writeDWORDAddr = thisWriteAddr;
			newWriteMemPacket.writeVal = newVal;
			newWriteMemPacket.SetComputeChecksum(&newWriteMemPacket);

			const HRESULT sendHR = deviceComms->SendLoop( (const BYTE* const)&newWriteMemPacket, sizeof(newWriteMemPacket) );
			if (FAILED(sendHR) )
				return sendHR;
			++dwordID;
		}
	}

	// Validate copies by reading the values back and then comparing the memory for equality:
#ifdef _DEBUG
	if (FAILED(DeviceValidateMemory(deviceDestAddr, sourceCPUAddr, dwByteLength) ) )
		return E_FAIL;
#endif

	return S_OK;
}

// Copies a block of memory from device memory to host memory.
// This function pushes read requests onto the GPU command buffer and then returns immediately. The read does not complete until you later call AsyncReadFromDeviceWaitComplete().
__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::AsyncReadFromDeviceBegin(const gpuvoid* const deviceSrcAddr, const DWORD dwByteLength)
{
	if (dwByteLength % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can only set whole-DWORD byte lengths!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength < sizeof(DWORD) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can't copy less than 1 DWORD's worth of data!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory read start!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr + dwByteLength >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory read end!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Device address must be DWORD-aligned!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Cannot read/write from the NULL page!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(deviceSrcAddr, dwByteLength) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	// Skip the actual memory readback in case this endpoint doesn't support it:
	if (!deviceComms->EndpointSupportsMemReadback() )
	{
		return S_OK;
	}

	const unsigned numDwords = dwByteLength / sizeof(DWORD);
	for (unsigned dwordID = 0; dwordID < numDwords; ++dwordID)
	{
		readMemCommand newReadMemPacket;
		newReadMemPacket.readDWORDAddr = (const DWORD)deviceSrcAddr + dwordID * sizeof(DWORD);
		newReadMemPacket.dwordSelect = (newReadMemPacket.readDWORDAddr >> 2) & 0x7; // Mask off these three bits
		newReadMemPacket.readDWORDAddr &= ~0x1F; // Mask off the bottommost 5 bits in order to align our read address to the next lowest DRAM line
		newReadMemPacket.SetComputeChecksum(&newReadMemPacket);

		GetReturnTrackerSingleton().RegisterNewReadReturn(&newReadMemPacket);
		const HRESULT sendHR = deviceComms->SendLoop( (const BYTE* const)&newReadMemPacket, sizeof(newReadMemPacket) );
		if (FAILED(sendHR) )
			return sendHR;
	}

	return S_OK;
}

// Copies a block of memory from device memory to host memory.
// This function waits for the previously issued memory read from AsyncReadFromDeviceBegin() to complete. It won't return until the memory read response has been returned.
__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::AsyncReadFromDeviceWaitComplete(const gpuvoid* const deviceSrcAddr, void* const destCPUAddr, const DWORD dwByteLength)
{
	if (!destCPUAddr)
	{
#ifdef _DEBUG
		__debugbreak(); // NULL is not a valid dest CPU address!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can only set whole-DWORD byte lengths!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength < sizeof(DWORD) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can't copy less than 1 DWORD's worth of data!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory read start!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr + dwByteLength >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory read end!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Device address must be DWORD-aligned!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Cannot read/write from the NULL page!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(deviceSrcAddr, dwByteLength) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	// Skip the actual memory readback in case this endpoint doesn't support it:
	if (!deviceComms->EndpointSupportsMemReadback() )
	{
		return S_OK;
	}

	const unsigned numDwords = dwByteLength / sizeof(DWORD);
	DWORD* const writeMem = (DWORD* const)destCPUAddr;
	for (unsigned dwordID = 0; dwordID < numDwords; ++dwordID)
	{
		DWORD readDWORDAddr = (const DWORD)deviceSrcAddr + dwordID * sizeof(DWORD);

		DWORD memResponse;
		GetReturnTrackerSingleton().SyncGetReadReturn( (const gpuvoid* const)readDWORDAddr, &memResponse, deviceComms);
		writeMem[dwordID] = memResponse;
	}

	return S_OK;
}

// Copies a block of memory from device memory to host memory. This function does not return until the memory has been fully read and copied into CPU memory.
__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::SyncReadFromDevice(const gpuvoid* const deviceSrcAddr, void* const destCPUAddr, const DWORD dwByteLength)
{
	HRESULT hr = AsyncReadFromDeviceBegin(deviceSrcAddr, dwByteLength);
	if (FAILED(hr) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return hr;
	}

	hr = AsyncReadFromDeviceWaitComplete(deviceSrcAddr, destCPUAddr, dwByteLength);
	return hr;
}

// Validates that the block of memory on the device matches the data in the block of memory on the CPU.
// Note that this function contains an implied CPU-GPU synchronization (the CPU needs to stop and wait for the GPU to complete all previous commands, then to wait for the data to be returned).
// Returns S_OK if the memory is equal between the CPU and the GPU pointers or E_FAIL otherwise. It is the caller's responsibility to ensure that the GPU is not writing to this region
// as we are reading from it.
__declspec(nothrow) HRESULT __stdcall IBaseGPUDevice::DeviceValidateMemory(const gpuvoid* const deviceSrcAddr, const void* const compareCPUAddr, const DWORD dwByteLength)
{
	if (!compareCPUAddr)
	{
#ifdef _DEBUG
		__debugbreak(); // NULL is not a valid dest CPU address!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can only set whole-DWORD byte lengths!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength < sizeof(DWORD) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can't copy less than 1 DWORD's worth of data!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory read start!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr + dwByteLength >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory read end!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Device address must be DWORD-aligned!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Cannot read/write from the NULL page!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(deviceSrcAddr, dwByteLength) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	// It uses more memory, but it's more easily debugable to download the entire GPU memory region all at once and then analyze it on the CPU
	// rather than performing comparisons as we go. This way, we can find errors by looking at the whole region and seeing if parts are missing or corrupted.
	std::vector<BYTE> gpuBytes;
	gpuBytes.resize(dwByteLength);
	const HRESULT hrReadResult = SyncReadFromDevice(deviceSrcAddr, &(gpuBytes.front() ), dwByteLength);
	if (deviceComms->EndpointSupportsMemReadback() )
	{
		if (memcmp(&(gpuBytes.front() ), compareCPUAddr, dwByteLength) != 0)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_FAIL;
		}
		else
			return hrReadResult;
	}
	else
		return S_OK;
}
