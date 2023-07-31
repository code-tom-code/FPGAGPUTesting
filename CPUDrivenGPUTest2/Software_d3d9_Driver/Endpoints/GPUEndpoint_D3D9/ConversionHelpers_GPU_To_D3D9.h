#pragma once

static const D3DCMPFUNC ConvertCmpFunc(const eCmpFunc deviceCmpFunc)
{
	switch (deviceCmpFunc)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case cmp_always:
		return D3DCMP_ALWAYS;
	case cmp_never:
		return D3DCMP_NEVER;
	case cmp_less:
		return D3DCMP_LESS;
	case cmp_equal:
		return D3DCMP_EQUAL;
	case cmp_lessequal:
		return D3DCMP_LESSEQUAL;
	case cmp_greater:
		return D3DCMP_GREATER;
	case cmp_notequal:
		return D3DCMP_NOTEQUAL;
	case cmp_greaterequal:
		return D3DCMP_GREATEREQUAL;
	}
}

static const D3DBLENDOP ConvertBlendOp(const blendOp deviceBlendOp)
{
	switch (deviceBlendOp)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case bop_add:
		return D3DBLENDOP_ADD;
	case bop_subtract:
		return D3DBLENDOP_SUBTRACT;
	case bop_revsubtract:
		return D3DBLENDOP_REVSUBTRACT;
	case bop_min:
		return D3DBLENDOP_MIN;
	case bop_max:
		return D3DBLENDOP_MAX;
	}
}

static const D3DBLEND ConvertBlendArgRGB(const blendModeSourcesRGB deviceBlendArgColor, const bool isInverted)
{
	switch (deviceBlendArgColor)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case blendRGB_0:
		return isInverted ? D3DBLEND_ONE : D3DBLEND_ZERO;
	case blendRGB_srcColor:
		return isInverted ? D3DBLEND_INVSRCCOLOR : D3DBLEND_SRCCOLOR;
	case blendRGB_srcAlpha:
		return isInverted ? D3DBLEND_INVSRCALPHA : D3DBLEND_SRCALPHA;
	case blendRGB_destAlpha:
		return isInverted ? D3DBLEND_INVDESTALPHA : D3DBLEND_DESTALPHA;
	case blendRGB_destColor:
		return isInverted ? D3DBLEND_INVDESTCOLOR : D3DBLEND_DESTCOLOR;
	case blendRGB_srcAlphaSat:
#ifdef _DEBUG
		if (isInverted)
		{
			__debugbreak(); // Error: Can't convert this blend arg back to D3D9
		}
#endif
		return D3DBLEND_SRCALPHASAT;
	case blendRGB_blendFactor:
		return isInverted ? D3DBLEND_INVBLENDFACTOR : D3DBLEND_BLENDFACTOR;
	}
}

static const D3DBLEND ConvertBlendArgA(const blendModeSourcesA deviceBlendArgAlpha, const bool isInverted)
{
	switch (deviceBlendArgAlpha)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case blendA_0:
		return isInverted ? D3DBLEND_ONE : D3DBLEND_ZERO;
	case blendA_srcAlpha:
		return isInverted ? D3DBLEND_INVSRCALPHA : D3DBLEND_SRCALPHA;
	case blendA_destAlpha:
		return isInverted ? D3DBLEND_INVDESTALPHA : D3DBLEND_DESTALPHA;
	case blendA_blendFactor:
		return isInverted ? D3DBLEND_INVBLENDFACTOR : D3DBLEND_BLENDFACTOR;
	}
}

static const D3DQUERYTYPE ConvertQueryType(const eQueryType deviceQueryType)
{
	switch (deviceQueryType)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case eQTEvent:
		return D3DQUERYTYPE_EVENT;
	case eQTOcclusion:
	case eQTBinaryOcclusion: // D3D9 doesn't support binary occlusion queries, so just treat this as a regular occlusion query for now
		return D3DQUERYTYPE_OCCLUSION;
	case eQTTimestamp: // D3D9 doesn't support binary occlusion queries, so just treat this as a regular occlusion query for now
		return D3DQUERYTYPE_TIMESTAMP;
	}
}

static const D3DFORMAT ConvertFormat(const eTexFormat deviceFormat)
{
	switch (deviceFormat)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case eTexFmtA8R8G8B8:
		return D3DFMT_A8R8G8B8;
	case eTexFmtX8R8G8B8:
		return D3DFMT_X8R8G8B8;
	case eTexFmtA4R4G4B4:
		return D3DFMT_A4R4G4B4;
	case eTexFmtR5G6B5:
		return D3DFMT_R5G6B5;
	case eTexFmtA1R5G5B5:
		return D3DFMT_A1R5G5B5;
	case eTexFmtX1R5G5B5:
		return D3DFMT_X1R5G5B5;
	}
}

static const D3DFORMAT ConvertFormat(const eIndexFormat deviceFormat)
{
	switch (deviceFormat)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case ibfmt_index16:
		return D3DFMT_INDEX16;
	case ibfmt_index32:
		return D3DFMT_INDEX32;
	case ibfmt_index8:
		return D3DFMT_L8;
	case ibfmt_noIndices:
		return D3DFMT_UNKNOWN;
	}
}

static const D3DCULL ConvertCullMode(const eCullMode deviceCullMode)
{
	switch (deviceCullMode)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case cullCCW:
		return D3DCULL_CCW;
	case cullCW:
		return D3DCULL_CW;
	case cullNone:
		return D3DCULL_NONE;
	}
}

static const D3DPRIMITIVETYPE ConvertPrimTopology(const ePrimTopology devicePrimTopology)
{
	switch (devicePrimTopology)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case primTop_ScreenAlignedQuad:
		// Doesn't have a D3D9 equivalent, at least not outside of NVAPI
	case primTop_TriangleList:
		return D3DPT_TRIANGLELIST;
	case primTop_PointList:
		return D3DPT_POINTLIST;
	case primTop_LineList:
		return D3DPT_LINELIST;
	case primTop_LineStrip:
		return D3DPT_LINESTRIP;
	case primTop_TriangleStrip:
		return D3DPT_TRIANGLESTRIP;
	case primTop_TriangleFan:
		return D3DPT_TRIANGLEFAN;
	}
}

static const D3DTEXTUREADDRESS ConvertTexAddress(const setTextureStateCommand::texAddressMode deviceTexAddressMode)
{
	switch (deviceTexAddressMode)
	{
	default:
	{
		__debugbreak(); // Out of range or invalid enum!
	}
	case setTextureStateCommand::ta_wrap:
		return D3DTADDRESS_WRAP;
	case setTextureStateCommand::ta_clamp:
		return D3DTADDRESS_CLAMP;
	case setTextureStateCommand::ta_mirror:
		return D3DTADDRESS_MIRROR;
	case setTextureStateCommand::ta_mirrorOnce:
		return D3DTADDRESS_MIRRORONCE;
	case setTextureStateCommand::ta_border:
		return D3DTADDRESS_BORDER;
	}
}

static const D3DTEXTUREADDRESS ConvertTexAddress(const eTexcoordAddressingMode deviceTexAddressMode)
{
	switch (deviceTexAddressMode)
	{
	default:
	{
		__debugbreak(); // Out of range or invalid enum!
	}
	case TAM_Wrap:
		return D3DTADDRESS_WRAP;
	case TAM_Clamp:
		return D3DTADDRESS_CLAMP;
	case TAM_Mirror:
		return D3DTADDRESS_MIRROR;
	case TAM_MirrorOnce:
		return D3DTADDRESS_MIRRORONCE;
	case TAM_BorderColor:
		return D3DTADDRESS_BORDER;
	}
}

static const D3DTEXTUREFILTERTYPE ConvertTexFilterMinMag(const eTexFilterMode deviceTexFilterMode)
{
	switch (deviceTexFilterMode)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case TF_pointFilter:
		return D3DTEXF_POINT;
	case TF_bilinearFilter:
	case TF_trilinearFilter:
		return D3DTEXF_LINEAR;
	case TF_anisotropicFilter:
		return D3DTEXF_ANISOTROPIC;
	}
}

static const D3DTEXTUREFILTERTYPE ConvertTexFilterMip(const eTexFilterMode deviceTexFilterMode)
{
	switch (deviceTexFilterMode)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range or invalid enum!
	}
#endif
	case TF_pointFilter:
	case TF_bilinearFilter:
		return D3DTEXF_NONE;
	case TF_trilinearFilter:
	case TF_anisotropicFilter:
		return D3DTEXF_LINEAR;
	}
}

static const D3DDECLTYPE GetVertexDeclType(const setVertexStreamDataCommand::dwordCountType dwordCount, const bool isD3DCOLOR)
{
	if (isD3DCOLOR)
	{
#ifdef _DEBUG
		if (dwordCount != setVertexStreamDataCommand::DWC_D3DCOLOR)
		{
			__debugbreak(); // Error: Unexpected dword count for D3DCOLOR type!
		}
#endif
		return D3DDECLTYPE_D3DCOLOR;
	}
	switch (dwordCount)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Should never be here!
#endif
	case setVertexStreamDataCommand::DWC_Float1:
		return D3DDECLTYPE_FLOAT1;
	case setVertexStreamDataCommand::DWC_Float2:
		return D3DDECLTYPE_FLOAT2;
	case setVertexStreamDataCommand::DWC_Float3:
		return D3DDECLTYPE_FLOAT3;
	case setVertexStreamDataCommand::DWC_Float4:
		return D3DDECLTYPE_FLOAT4;
	}
}

static const D3DDECLUSAGE GetVertexDeclUsage(const eInputUsageType vertexShaderInputRegisterUsage)
{
	switch (vertexShaderInputRegisterUsage)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Should never be here!
#endif
	case UT_Texcoord:
		return D3DDECLUSAGE_TEXCOORD;
	case UT_Position:
		return D3DDECLUSAGE_POSITION;
	case UT_Color:
		return D3DDECLUSAGE_COLOR;
	case UT_Normal:
		return D3DDECLUSAGE_NORMAL;
	case UT_BlendWeight:
		return D3DDECLUSAGE_BLENDWEIGHT;
	case UT_BlendIndices:
		return D3DDECLUSAGE_BLENDINDICES;
	case UT_PSize:
		return D3DDECLUSAGE_PSIZE;
	case UT_Fog:
		return D3DDECLUSAGE_FOG;
	}
}
