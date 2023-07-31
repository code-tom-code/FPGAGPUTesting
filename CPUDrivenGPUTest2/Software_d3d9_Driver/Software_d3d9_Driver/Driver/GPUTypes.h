#pragma once

#include "..\d3d9include.h"

enum eInputUsageType : DWORD
{
	UT_Position = 0,
	UT_Texcoord = 1,
	UT_Color = 2,
	UT_Normal = 3,
	UT_BlendWeight = 4,
	UT_BlendIndices = 5,
	UT_PSize = 6,
	UT_Fog = 7
};

static const eInputUsageType ConvertToDeviceDeclUsage(const D3DDECLUSAGE declUsage)
{
	eInputUsageType usageType;
	switch (declUsage)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Unknown/undefined decl usage!
#endif
	case D3DDECLUSAGE_TANGENT:
	case D3DDECLUSAGE_BINORMAL:
	case D3DDECLUSAGE_TESSFACTOR:
	case D3DDECLUSAGE_DEPTH:
	case D3DDECLUSAGE_SAMPLE:
#ifdef _DEBUG
		__debugbreak(); // These are all technically not supported by the driver at this time
#endif
	case D3DDECLUSAGE_TEXCOORD:
		usageType = UT_Texcoord;
		break;
	case D3DDECLUSAGE_POSITIONT:
	case D3DDECLUSAGE_POSITION:
		usageType = UT_Position;
		break;
	case D3DDECLUSAGE_BLENDWEIGHT:
		usageType = UT_BlendWeight;
		break;
	case D3DDECLUSAGE_BLENDINDICES:
		usageType = UT_BlendIndices;
		break;
	case D3DDECLUSAGE_NORMAL:
		usageType = UT_Normal;
		break;
	case D3DDECLUSAGE_PSIZE:
		usageType = UT_PSize;
		break;
	case D3DDECLUSAGE_COLOR:
		usageType = UT_Color;
		break;
	case D3DDECLUSAGE_FOG:
		usageType = UT_Fog;
		break;
	}
	return usageType;
}
