#include "DeviceConversions.h"

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

const eStencilOp ConvertToDeviceStencilOp(const D3DSTENCILOP stencilOp)
{
	if (stencilOp == 0)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return sop_keep;
	}

	if (stencilOp > D3DSTENCILOP_DECR)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return sop_keep;
	}

	return (const eStencilOp)(stencilOp - 1);
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

const eCullMode ConvertToDeviceCullMode(const D3DCULL cullMode)
{
	eCullMode ret;
	switch (cullMode)
	{
	default:
#ifdef _DEBUG
		__debugbreak();
#endif
	case D3DCULL_NONE:
		ret = cullNone;
		break;
	case D3DCULL_CW:
		ret = cullCW;
		break;
	case D3DCULL_CCW:
		ret = cullCCW;
		break;
	}
	return ret;
}

const ePrimTopology ConvertToDevicePrimTopology(const D3DPRIMITIVETYPE primType)
{
	ePrimTopology primTopology;
	switch (primType)
	{
	case D3DPT_POINTLIST:
		primTopology = primTop_PointList;
		break;
	case D3DPT_LINELIST:
		primTopology = primTop_LineList;
		break;
	case D3DPT_LINESTRIP:
		primTopology = primTop_LineStrip;
		break;
	default:
#ifdef _DEBUG
		__debugbreak();
#endif
	case D3DPT_TRIANGLELIST:
		primTopology = primTop_TriangleList;
		break;
	case D3DPT_TRIANGLESTRIP:
		primTopology = primTop_TriangleStrip;
		break;
	case D3DPT_TRIANGLEFAN:
		primTopology = primTop_TriangleFan;
		break;
	}
	return primTopology;
}

const eIndexFormat ConvertToDeviceIndexFormat(const class IDirect3DIndexBuffer9Hook* const indexBuffer, const D3DFORMAT indexBufferFormat)
{
	if (indexBuffer == NULL)
		return ibfmt_noIndices;

	eIndexFormat indexFormat;
	switch (indexBufferFormat)
	{
	default:
#ifdef _DEBUG
		__debugbreak();
#endif
	case D3DFMT_UNKNOWN:
		indexFormat = ibfmt_noIndices;
		break;
	case D3DFMT_A8: // Not supported by D3D, but index8 is a custom format that the driver can understand
		indexFormat = ibfmt_index8;
		break;
	case D3DFMT_INDEX16:
		indexFormat = ibfmt_index16;
		break;
	case D3DFMT_INDEX32:
		indexFormat = ibfmt_index32;
		break;
	}
	return indexFormat;
}

const eBlendMask ConvertToDeviceBlendMask(const DWORD colorWriteEnable)
{
	if (colorWriteEnable > 0xF)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return wm_writeAll;
	}

	return (const eBlendMask)(colorWriteEnable & 0xF);
}

const eTexFormat ConvertToDeviceTextureFormat(const D3DFORMAT texFormat)
{
	eTexFormat deviceFormat;
	switch (texFormat)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // This texture format is unknown or not yet supported!
#endif
	case D3DFMT_DXT1:
	case D3DFMT_DXT2:
	case D3DFMT_DXT3:
	case D3DFMT_DXT4:
	case D3DFMT_DXT5:
	case D3DFMT_A8R8G8B8:
		deviceFormat = eTexFmtA8R8G8B8;
		break;
	case D3DFMT_X8R8G8B8:
		deviceFormat = eTexFmtX8R8G8B8;
		break;
	case D3DFMT_A4R4G4B4:
		deviceFormat = eTexFmtA4R4G4B4;
		break;
	case D3DFMT_R5G6B5:
		deviceFormat = eTexFmtR5G6B5;
		break;
	case D3DFMT_A1R5G5B5:
		deviceFormat = eTexFmtA1R5G5B5;
		break;
	case D3DFMT_X1R5G5B5:
		deviceFormat = eTexFmtX1R5G5B5;
		break;
	}
	return deviceFormat;
}

const eTexcoordAddressingMode ConvertToDeviceTexAddressMode(const D3DTEXTUREADDRESS texAddressMode)
{
	eTexcoordAddressingMode addressMode;
	switch (texAddressMode)
	{
	default:
#ifdef _DEBUG
		__debugbreak();
#endif
	case D3DTADDRESS_WRAP:
		addressMode = TAM_Wrap;
		break;
	case D3DTADDRESS_MIRROR:
		addressMode = TAM_Mirror;
		break;
	case D3DTADDRESS_CLAMP:
		addressMode = TAM_Clamp;
		break;
	case D3DTADDRESS_BORDER:
		addressMode = TAM_BorderColor;
		break;
	case D3DTADDRESS_MIRRORONCE:
		addressMode = TAM_MirrorOnce;
		break;
	}
	return addressMode;
}

void ComputeTextureChannelMUX(const D3DFORMAT d3dTextureFormat, eTexChannelMUX& rChannel, eTexChannelMUX& gChannel, eTexChannelMUX& bChannel, eTexChannelMUX& aChannel)
{
	bool hasAlphaChannel = false;
	switch (d3dTextureFormat)
	{
	default:
	case D3DFMT_X8B8G8R8:
	case D3DFMT_X1R5G5B5:
	case D3DFMT_X4R4G4B4:
	case D3DFMT_R3G3B2:
	case D3DFMT_R5G6B5:
		hasAlphaChannel = false;
		break;
	case D3DFMT_A1:
	case D3DFMT_A1R5G5B5:
	case D3DFMT_A8:
	case D3DFMT_A8R8G8B8:
	case D3DFMT_A4R4G4B4:
	case D3DFMT_DXT1:
	case D3DFMT_DXT2:
	case D3DFMT_DXT3:
	case D3DFMT_DXT4:
	case D3DFMT_DXT5:
		hasAlphaChannel = true;
		break;
	}

	rChannel = tcm_r;
	gChannel = tcm_g;
	bChannel = tcm_b;
	aChannel = hasAlphaChannel ? tcm_a : tcm_1;
	switch (d3dTextureFormat)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // This texture format is unknown or not yet supported!
#endif
	case D3DFMT_DXT1:
	case D3DFMT_DXT3:
	case D3DFMT_DXT5:
	case D3DFMT_A8R8G8B8:
		bChannel = tcm_r; // D3D9 likes to store ARGB textures as ABGR, so we need to flip the R and B channels here
		rChannel = tcm_b;
		break;
	case D3DFMT_X8R8G8B8:
		bChannel = tcm_r;
		rChannel = tcm_b;
		break;
	case D3DFMT_A4R4G4B4:
		bChannel = tcm_r;
		rChannel = tcm_b;
		break;
	case D3DFMT_R5G6B5:
		bChannel = tcm_r; 
		rChannel = tcm_b;
		break;
	case D3DFMT_A1R5G5B5:
		bChannel = tcm_r;
		rChannel = tcm_b;
		break;
	case D3DFMT_X1R5G5B5:
		bChannel = tcm_r;
		rChannel = tcm_b;
		break;
	}
}
