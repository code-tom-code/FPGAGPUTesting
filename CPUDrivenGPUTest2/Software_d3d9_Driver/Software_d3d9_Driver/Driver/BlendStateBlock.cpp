#include "IBaseGPUDevice.h"

// TODO: Include information about which channels are available in the output render target format (does it have alpha? does it have color?) and use that info (along with the write mask)
// in the determination for whether to load srcColor and whether to load destColor.
void ROPBlock::ComputeDoLoadSrcDest(const D3DCOLOR blendFactor_ARGB)
{
	// These modes short-circuit the blending unit and force either a min or a max which requires both the incoming pixel color and the framebuffer color
	if (dataUnion.bitsStruct.blendOpRGB >= bop_min || dataUnion.bitsStruct.blendOpA >= bop_min)
	{
		dataUnion.bitsStruct.doLoadSrcColor = TRUE;
		dataUnion.bitsStruct.doLoadDestColor = TRUE;
		return;
	}

	// TODO: We can go even further and check the write mask against the individual blend factor channels, but that's probably mostly unnecessary
	const unsigned char blendFactorR = (blendFactor_ARGB >> 16) & 0xFF;
	const unsigned char blendFactorG = (blendFactor_ARGB >> 8) & 0xFF;
	const unsigned char blendFactorB = (blendFactor_ARGB) & 0xFF;
	const unsigned char blendFactorA = blendFactor_ARGB >> 24;
	const bool blendFactorColorIsZero = (blendFactorR == 0 && blendFactorG == 0 && blendFactorB == 0);
	const bool blendFactorAlphaIsZero = (blendFactorA == 0);

	bool srcLoad = false;
	bool destLoad = false;

	switch (dataUnion.bitsStruct.blendModeSrcRGB)
	{
	case blendRGB_0:
		if (dataUnion.bitsStruct.blendModeSrcRGBInvert)
			srcLoad = true; // Note that D3DBLEND_ZERO would not generate a load here
		break;
	case blendRGB_srcColor:
	case blendRGB_srcAlpha:
		srcLoad = true;
		break;
	case blendRGB_srcAlphaSat: // Note that even though it's called "srcAlphaSat", it actually needs to read both src and dest alpha channels!
	case blendRGB_destAlpha:
	case blendRGB_destColor:
		destLoad = true;
		srcLoad = true;
		break;
	case blendRGB_blendFactor:
		if (!blendFactorColorIsZero)
			srcLoad = true;
		break;
	}

	switch (dataUnion.bitsStruct.blendModeDestRGB)
	{
	case blendRGB_0:
		if (dataUnion.bitsStruct.blendModeDestRGBInvert)
			destLoad = true; // Note that D3DBLEND_ZERO would not generate a load here
		break;
	case blendRGB_srcColor:
	case blendRGB_srcAlpha:
	case blendRGB_srcAlphaSat: // Note that even though it's called "srcAlphaSat", it actually needs to read both src and dest alpha channels!
		srcLoad = true;
		destLoad = true;
		break;
	case blendRGB_destAlpha:
	case blendRGB_destColor:
		destLoad = true;
		break;
	case blendRGB_blendFactor:
		if (!blendFactorColorIsZero)
			destLoad = true;
		break;
	}

	switch (dataUnion.bitsStruct.blendModeSrcA)
	{
	case blendA_0:
		if (dataUnion.bitsStruct.blendModeSrcAInvert)
			srcLoad = true; // Note that D3DBLEND_ZERO would not generate a load here
		break;
	case blendA_srcAlpha:
		srcLoad = true;
		break;
	case blendA_destAlpha:
		destLoad = true;
		srcLoad = true;
		break;
	case blendA_blendFactor:
		if (!blendFactorAlphaIsZero)
			srcLoad = true;
		break;
	}

	switch (dataUnion.bitsStruct.blendModeDestA)
	{
	case blendA_0:
		if (dataUnion.bitsStruct.blendModeDestAInvert)
			destLoad = true; // Note that D3DBLEND_ZERO would not generate a load here
		break;
	case blendA_srcAlpha:
		srcLoad = true;
		destLoad = true;
		break;
	case blendA_destAlpha:
		destLoad = true;
		break;
	case blendA_blendFactor:
		if (!blendFactorAlphaIsZero)
			destLoad = true;
		break;
	}

	dataUnion.bitsStruct.doLoadSrcColor = (const BOOL)srcLoad;
	dataUnion.bitsStruct.doLoadDestColor = (const BOOL)destLoad;
}

/*static*/ void ROPBlock::ConvertColorBlend(const D3DBLEND colorBlend, blendModeSourcesRGB& outBlendMode, bool& outBlendInvert, const bool isDestination)
{
	if (colorBlend == D3DBLEND_BOTHSRCALPHA)
	{
		// The BOTHSRCALPHA blend mode acts like srcBlend = D3DBLEND_SRCALPHA, destBlend = D3DBLEND_INVSRCALPHA
		outBlendMode = blendRGB_srcAlpha;
		outBlendInvert = isDestination;
		return;
	}
	else if (colorBlend == D3DBLEND_BOTHINVSRCALPHA)
	{
		// The BOTHINVSRCALPHA blend mode acts like srcBlend = D3DBLEND_INVSRCALPHA, destBlend = D3DBLEND_SRCALPHA
		outBlendMode = blendRGB_srcAlpha;
		outBlendInvert = !isDestination;
		return;
	}

	outBlendInvert = false;
	switch (colorBlend)
	{
	case D3DBLEND_ONE:
		outBlendInvert = true;
		// Intentional fall-through:
	case D3DBLEND_ZERO:
		outBlendMode = blendRGB_0;
		break;
	case D3DBLEND_INVSRCCOLOR:
		outBlendInvert = true;
		// Intentional fall-through:
	case D3DBLEND_SRCCOLOR:
		outBlendMode = blendRGB_srcColor;
		break;
	case D3DBLEND_INVSRCALPHA:
		outBlendInvert = true;
		// Intentional fall-through:
	case D3DBLEND_SRCALPHA:
		outBlendMode = blendRGB_srcAlpha;
		break;
	case D3DBLEND_INVDESTALPHA:
		outBlendInvert = true;
		// Intentional fall-through:
	case D3DBLEND_DESTALPHA:
		outBlendMode = blendRGB_destAlpha;
		break;
	case D3DBLEND_INVDESTCOLOR:
		outBlendInvert = true;
		// Intentional fall-through:
	case D3DBLEND_DESTCOLOR:
		outBlendMode = blendRGB_destColor;
		break;
	case D3DBLEND_SRCALPHASAT:
		outBlendMode = blendRGB_srcAlphaSat;
		break;
	case D3DBLEND_INVBLENDFACTOR:
		outBlendInvert = true;
		// Intentional fall-through:
	case D3DBLEND_BLENDFACTOR:
		outBlendMode = blendRGB_blendFactor;
		break;
	case D3DBLEND_SRCCOLOR2:
	case D3DBLEND_INVSRCCOLOR2:
		__debugbreak(); // Dual source color blending is not yet implemented!
		outBlendMode = blendRGB_0;
		break;
	}
}

/*static*/ void ROPBlock::ConvertAlphaBlend(const D3DBLEND alphaBlend, blendModeSourcesA& outBlendMode, bool& outBlendInvert, const bool isDestination)
{
	if (alphaBlend == D3DBLEND_BOTHSRCALPHA)
	{
		// The BOTHSRCALPHA blend mode acts like srcBlend = D3DBLEND_SRCALPHA, destBlend = D3DBLEND_INVSRCALPHA
		outBlendMode = blendA_srcAlpha;
		outBlendInvert = isDestination;
		return;
	}
	else if (alphaBlend == D3DBLEND_BOTHINVSRCALPHA)
	{
		// The BOTHINVSRCALPHA blend mode acts like srcBlend = D3DBLEND_INVSRCALPHA, destBlend = D3DBLEND_SRCALPHA
		outBlendMode = blendA_srcAlpha;
		outBlendInvert = !isDestination;
		return;
	}

	outBlendInvert = false;
	switch (alphaBlend)
	{
	case D3DBLEND_ONE:
	case D3DBLEND_SRCALPHASAT:
		outBlendInvert = true;
		// Intentional fall-through:
	case D3DBLEND_ZERO:
		outBlendMode = blendA_0;
		break;
	case D3DBLEND_INVSRCCOLOR:
	case D3DBLEND_INVSRCALPHA:
		outBlendInvert = true;
		// Intentional fall-through:
	case D3DBLEND_SRCCOLOR:
	case D3DBLEND_SRCALPHA:
		outBlendMode = blendA_srcAlpha;
		break;
	case D3DBLEND_INVDESTCOLOR:
	case D3DBLEND_INVDESTALPHA:
		outBlendInvert = true;
		// Intentional fall-through:
	case D3DBLEND_DESTCOLOR:
	case D3DBLEND_DESTALPHA:
		outBlendMode = blendA_destAlpha;
		break;
	case D3DBLEND_INVBLENDFACTOR:
		outBlendInvert = true;
		// Intentional fall-through:
	case D3DBLEND_BLENDFACTOR:
		outBlendMode = blendA_blendFactor;
		break;
	case D3DBLEND_SRCCOLOR2:
	case D3DBLEND_INVSRCCOLOR2:
		__debugbreak(); // Dual source color blending is not yet implemented!
		outBlendMode = blendA_0;
		break;
	}
}

void ROPBlock::ConvertBlendStateFromD3DRS(const bool alphaBlendEnable,
	const D3DBLEND srcColorBlend, const D3DBLEND destColorBlend, const D3DBLENDOP colorBlendOp,
	const D3DBLEND srcAlphaBlend, const D3DBLEND destAlphaBlend, const D3DBLENDOP alphaBlendOp,
	const D3DCOLOR blendFactor_ARGB)
{
	if (!alphaBlendEnable)
	{
		dataUnion.bitsStruct.blendModeSrcRGB = blendRGB_0; dataUnion.bitsStruct.blendModeSrcRGBInvert = TRUE; // D3DRS_SRCBLEND defaults to D3DBLEND_ONE
		dataUnion.bitsStruct.blendModeDestRGB = blendRGB_0; dataUnion.bitsStruct.blendModeDestRGBInvert = FALSE; // D3DRS_DESTBLEND defaults to D3DBLEND_ZERO
		dataUnion.bitsStruct.blendOpRGB = bop_add; // D3DRS_BLENDOP defaults to D3DBLENDOP_ADD
		dataUnion.bitsStruct.blendModeSrcA = blendA_0; dataUnion.bitsStruct.blendModeSrcAInvert = TRUE; // D3DRS_SRCBLENDALPHA defaults to D3DBLEND_ONE
		dataUnion.bitsStruct.blendModeDestA = blendA_0; dataUnion.bitsStruct.blendModeDestAInvert = FALSE; // D3DRS_DESTBLENDALPHA defaults to D3DBLEND_ZERO
		dataUnion.bitsStruct.blendOpA = bop_add; // D3DRS_BLENDOPALPHA defaults to D3DBLENDOP_ADD
		dataUnion.bitsStruct.doLoadSrcColor = TRUE; dataUnion.bitsStruct.doLoadDestColor = FALSE;
		return;
	}

	blendModeSourcesRGB srcColor, destColor;
	blendModeSourcesA srcAlpha, destAlpha;
	bool srcColorInvert, destColorInvert, srcAlphaInvert, destAlphaInvert;
	ConvertColorBlend(srcColorBlend, srcColor, srcColorInvert, false);
	ConvertColorBlend(destColorBlend, destColor, destColorInvert, true);
	ConvertAlphaBlend(srcAlphaBlend, srcAlpha, srcAlphaInvert, false);
	ConvertAlphaBlend(destAlphaBlend, destAlpha, destAlphaInvert, true);
	dataUnion.bitsStruct.blendModeSrcRGB = srcColor; dataUnion.bitsStruct.blendModeSrcRGBInvert = srcColorInvert;
	dataUnion.bitsStruct.blendModeDestRGB = destColor; dataUnion.bitsStruct.blendModeDestRGBInvert = destColorInvert;
	dataUnion.bitsStruct.blendOpRGB = (const blendOp)(colorBlendOp - 1);
	dataUnion.bitsStruct.blendModeSrcA = srcAlpha; dataUnion.bitsStruct.blendModeSrcAInvert = srcAlphaInvert;
	dataUnion.bitsStruct.blendModeDestA = destAlpha; dataUnion.bitsStruct.blendModeDestAInvert = destAlphaInvert;
	dataUnion.bitsStruct.blendOpA = (const blendOp)(alphaBlendOp - 1);

	ComputeDoLoadSrcDest(blendFactor_ARGB);
}
