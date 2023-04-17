#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "../D3DTriRasterizeTestData.h"
#include "ShaderCoreALUCommon.h"
#include "PixelPipelineShared.h"
#include <vector>
#include <intrin.h>

// Uncomment this line to enable debugging the DBG_* output ports.
// This slows down simulation significantly, so it's not recommended unless HDL debugging is needed.
// #define DEBUG_PORTS_DEBUG 1

static unsigned currentTriCacheIndex = 0;
static unsigned memoryWriteDWORDCount = 0;
static unsigned memoryWriteTransactionsCount = 0;
static unsigned memoryReadDWORDCount = 0;
static unsigned memoryReadTransactionsCount = 0;

#define D3DCOLOR_ABGR(a,r,g,b) \
    ((D3DCOLOR)((((a)&0xff)<<24)|(((b)&0xff)<<16)|(((g)&0xff)<<8)|((r)&0xff)))

enum blendModeSourcesRGB : unsigned
{
	blendRGB_0, // 0
	blendRGB_srcColor, // 1
	blendRGB_srcAlpha, // 2
	blendRGB_destAlpha, // 3
	blendRGB_destColor, // 4
	blendRGB_srcAlphaSat, // 5
	blendRGB_blendFactor // 6
};

enum blendModeSourcesA : unsigned
{
	blendA_0, // 0
	blendA_srcAlpha, // 1
	blendA_destAlpha, // 2
	blendA_blendFactor // 3
};

enum blendOp : unsigned
{
	bop_add, // 0
	bop_subtract, // 1
	bop_revsubtract, // 2
	bop_min, // 3
	bop_max // 4
};

struct dbgTempOutputRGB
{
	unsigned short srcBlendRProduct;
	unsigned short srcBlendGProduct;
	unsigned short srcBlendBProduct;
	unsigned short destBlendRProduct;
	unsigned short destBlendGProduct;
	unsigned short destBlendBProduct;
};
static_assert(sizeof(dbgTempOutputRGB) == 12, "Error: Unexpected struct packing!");

struct dbgTempOutputA
{
	unsigned short srcBlendProduct;
	unsigned short destBlendProduct;
};
static_assert(sizeof(dbgTempOutputA) == 4, "Error: Unexpected struct packing!");

struct blendStateBlock
{
	blendStateBlock() : blendModeSrcRGB(blendRGB_0), blendModeSrcRGBInvert(true), // D3DRS_SRCBLEND defaults to D3DBLEND_ONE
		blendModeDestRGB(blendRGB_0), blendModeDestRGBInvert(false), // D3DRS_DESTBLEND defaults to D3DBLEND_ZERO
		blendOpRGB(bop_add), // D3DRS_BLENDOP defaults to D3DBLENDOP_ADD
		blendModeSrcA(blendA_0), blendModeSrcAInvert(true), // D3DRS_SRCBLENDALPHA defaults to D3DBLEND_ONE
		blendModeDestA(blendA_0), blendModeDestAInvert(false), // D3DRS_DESTBLENDALPHA defaults to D3DBLEND_ZERO
		blendOpA(bop_add), // D3DRS_BLENDOPALPHA defaults to D3DBLENDOP_ADD
		doLoadSrcColor(true), doLoadDestColor(false),
		unusedPadding(0x000)
	{
	}

	// TODO: Include information about which channels are available in the output render target format (does it have alpha? does it have color?) and use that info (along with the write mask)
	// in the determination for whether to load srcColor and whether to load destColor.
	void ComputeDoLoadSrcDest(const D3DCOLOR blendFactor_ARGB)
	{
		// These modes short-circuit the blending unit and force either a min or a max which requires both the incoming pixel color and the framebuffer color
		if (blendOpRGB >= bop_min || blendOpA >= bop_min)
		{
			doLoadSrcColor = TRUE;
			doLoadDestColor = TRUE;
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

		switch (blendModeSrcRGB)
		{
		case blendRGB_0:
			if (blendModeSrcRGBInvert)
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

		switch (blendModeDestRGB)
		{
		case blendRGB_0:
			if (blendModeDestRGBInvert)
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

		switch (blendModeSrcA)
		{
		case blendA_0:
			if (blendModeSrcAInvert)
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

		switch (blendModeDestA)
		{
		case blendA_0:
			if (blendModeDestAInvert)
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

		doLoadSrcColor = (const BOOL)srcLoad;
		doLoadDestColor = (const BOOL)destLoad;
	}

	static void ConvertColorBlend(const D3DBLEND colorBlend, blendModeSourcesRGB& outBlendMode, bool& outBlendInvert, const bool isDestination)
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

	static void ConvertAlphaBlend(const D3DBLEND alphaBlend, blendModeSourcesA& outBlendMode, bool& outBlendInvert, const bool isDestination)
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

	void ConvertFromD3DRS(const bool alphaBlendEnable,
		const D3DBLEND srcColorBlend, const D3DBLEND destColorBlend, const D3DBLENDOP colorBlendOp,
		const D3DBLEND srcAlphaBlend, const D3DBLEND destAlphaBlend, const D3DBLENDOP alphaBlendOp,
		const D3DCOLOR blendFactor_ARGB)
	{
		if (!alphaBlendEnable)
		{
			blendModeSrcRGB = blendRGB_0; blendModeSrcRGBInvert = TRUE; // D3DRS_SRCBLEND defaults to D3DBLEND_ONE
			blendModeDestRGB = blendRGB_0; blendModeDestRGBInvert = FALSE; // D3DRS_DESTBLEND defaults to D3DBLEND_ZERO
			blendOpRGB = bop_add; // D3DRS_BLENDOP defaults to D3DBLENDOP_ADD
			blendModeSrcA = blendA_0; blendModeSrcAInvert = TRUE; // D3DRS_SRCBLENDALPHA defaults to D3DBLEND_ONE
			blendModeDestA = blendA_0; blendModeDestAInvert = FALSE; // D3DRS_DESTBLENDALPHA defaults to D3DBLEND_ZERO
			blendOpA = bop_add; // D3DRS_BLENDOPALPHA defaults to D3DBLENDOP_ADD
			doLoadSrcColor = TRUE; doLoadDestColor = FALSE;
			return;
		}

		blendModeSourcesRGB srcColor, destColor;
		blendModeSourcesA srcAlpha, destAlpha;
		bool srcColorInvert, destColorInvert, srcAlphaInvert, destAlphaInvert;
		ConvertColorBlend(srcColorBlend, srcColor, srcColorInvert, false);
		ConvertColorBlend(destColorBlend, destColor, destColorInvert, true);
		ConvertAlphaBlend(srcAlphaBlend, srcAlpha, srcAlphaInvert, false);
		ConvertAlphaBlend(destAlphaBlend, destAlpha, destAlphaInvert, true);
		blendModeSrcRGB = srcColor; blendModeSrcRGBInvert = srcColorInvert;
		blendModeDestRGB = destColor; blendModeDestRGBInvert = destColorInvert;
		blendOpRGB = (const blendOp)(colorBlendOp - 1);
		blendModeSrcA = srcAlpha; blendModeSrcAInvert = srcAlphaInvert;
		blendModeDestA = destAlpha; blendModeDestAInvert = destAlphaInvert;
		blendOpA = (const blendOp)(alphaBlendOp - 1);

		ComputeDoLoadSrcDest(blendFactor_ARGB);
	}

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
	BOOL doLoadDestColor : 1; // Should the ROP unit load the existing framebuffer pixel (dest) data? (This one is a big bandwidth savings if it's 0)

	unsigned unusedPadding : 10;
};
static_assert(sizeof(blendStateBlock) == sizeof(unsigned), "Error: Unexpected struct packing!");

enum ROPStateType : unsigned char
{
	init, // 0
	waitingForPixelData, // 1

	doAlphaTest, // 2
	calcPixelAddress, // 3
	checkCache, // 4
	autoFlushSingleCacheLine, // 5
	requestReadPixel, // 6
	waitForReadPixel, // 7
	blendPixel0, // 8
	blendPixel1, // 9
	blendPixel2, // 10
	writePixel, // 11

	setNewAlphaTestAndRenderTargetState, // 12
	setNewBlendState, // 13
	setNewClear, // 14
	manualFlushFullCache, // 15
	manualFlushFullCacheFinish // 16
};

struct memResponse
{
	BYTE data[32];
};
static_assert(sizeof(memResponse) == 32, "Error: Unexpected struct size!");

static const float frand()
{
	return rand() / (const float)RAND_MAX;
}

#pragma pack(push)
#pragma pack(1)
struct memWriteRequestStruct
{
	unsigned char DWORDWriteEnableMask; // 8 bits
	unsigned writeData[8]; // 8 * 32 bits
	unsigned writeAddr; // 30 bits
};
#pragma pack(pop)

// Returns true if the pixel passed the alpha test (ie. we should draw this pixel), or false if the pixel failed the alpha test (ie. we should discard this pixel)
const bool AlphaTest(const unsigned char testPixelAlpha, const unsigned char alphaReferenceVal, const D3DCMPFUNC cmpFunc)
{
	switch (cmpFunc)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Should never be here!
#endif
	case D3DCMP_NEVER:
		return false;
	case D3DCMP_LESS:
		return testPixelAlpha < alphaReferenceVal;
	case D3DCMP_EQUAL:
		return testPixelAlpha == alphaReferenceVal;
	case D3DCMP_LESSEQUAL:
		return testPixelAlpha <= alphaReferenceVal;
	case D3DCMP_GREATER:
		return testPixelAlpha > alphaReferenceVal;
	case D3DCMP_NOTEQUAL:
		return testPixelAlpha != alphaReferenceVal;
	case D3DCMP_GREATEREQUAL:
		return testPixelAlpha >= alphaReferenceVal;
	case D3DCMP_ALWAYS:
		return true;
	}
}

union COLOR_UBYTE4_ARGB
{
	struct _bgra
	{
		unsigned char r;
		unsigned char g;
		unsigned char b;
		unsigned char a;
	} bgra;

	D3DCOLOR dwordColor;
};
static_assert(sizeof(COLOR_UBYTE4_ARGB) == sizeof(D3DCOLOR), "Error: Unexpected union packing!");

const D3DCOLOR PerformBlending(const D3DCOLOR incomingNewPixelColor, const D3DCOLOR existingFramebufferColor, const bool blendingEnabled,
	const D3DBLEND srcColorBlend, const D3DBLEND destColorBlend, const D3DBLENDOP colorBlendOp,
	const D3DBLEND srcAlphaBlend, const D3DBLEND destAlphaBlend, const D3DBLENDOP alphaBlendOp, const D3DCOLOR blendFactorABGR)
{
	if (!blendingEnabled)
		return incomingNewPixelColor;

	COLOR_UBYTE4_ARGB newPixelCol, framebufferCol, blendFactorCol, blendedOutputCol, srcBlend, destBlend;
	newPixelCol.dwordColor = incomingNewPixelColor;
	framebufferCol.dwordColor = existingFramebufferColor;
	blendFactorCol.bgra.a = blendFactorABGR >> 24; // The BlendFactor comes in in 0xAABBGGRR format which is *not* how a D3DCOLOR typically stores colors
	blendFactorCol.bgra.b = (blendFactorABGR >> 16) & 0xFF;
	blendFactorCol.bgra.g = (blendFactorABGR >> 8) & 0xFF;
	blendFactorCol.bgra.r = blendFactorABGR & 0xFF;

	switch (colorBlendOp)
	{
	case D3DBLENDOP_MIN:
		blendedOutputCol.bgra.r = (newPixelCol.bgra.r < framebufferCol.bgra.r) ? newPixelCol.bgra.r : framebufferCol.bgra.r;
		blendedOutputCol.bgra.g = (newPixelCol.bgra.g < framebufferCol.bgra.g) ? newPixelCol.bgra.g : framebufferCol.bgra.g;
		blendedOutputCol.bgra.b = (newPixelCol.bgra.b < framebufferCol.bgra.b) ? newPixelCol.bgra.b : framebufferCol.bgra.b;
		break;
	case D3DBLENDOP_MAX:
		blendedOutputCol.bgra.r = (newPixelCol.bgra.r > framebufferCol.bgra.r) ? newPixelCol.bgra.r : framebufferCol.bgra.r;
		blendedOutputCol.bgra.g = (newPixelCol.bgra.g > framebufferCol.bgra.g) ? newPixelCol.bgra.g : framebufferCol.bgra.g;
		blendedOutputCol.bgra.b = (newPixelCol.bgra.b > framebufferCol.bgra.b) ? newPixelCol.bgra.b : framebufferCol.bgra.b;
		break;
	default:
		switch (srcColorBlend)
		{
		case D3DBLEND_ZERO:
			srcBlend.bgra.r = 0;
			srcBlend.bgra.g = 0;
			srcBlend.bgra.b = 0; break;
		case D3DBLEND_ONE:
			srcBlend.bgra.r = 0xFF;
			srcBlend.bgra.g = 0xFF;
			srcBlend.bgra.b = 0xFF; break;
		case D3DBLEND_SRCCOLOR:
			srcBlend.bgra.r = newPixelCol.bgra.r;
			srcBlend.bgra.g = newPixelCol.bgra.g;
			srcBlend.bgra.b = newPixelCol.bgra.b; break;
		case D3DBLEND_SRCALPHA:
		case D3DBLEND_BOTHSRCALPHA:
			srcBlend.bgra.r = newPixelCol.bgra.a;
			srcBlend.bgra.g = newPixelCol.bgra.a;
			srcBlend.bgra.b = newPixelCol.bgra.a; break;
		case D3DBLEND_INVSRCCOLOR:
			srcBlend.bgra.r = 0xFF - newPixelCol.bgra.r;
			srcBlend.bgra.g = 0xFF - newPixelCol.bgra.g;
			srcBlend.bgra.b = 0xFF - newPixelCol.bgra.b; break;
		case D3DBLEND_INVSRCALPHA:
		case D3DBLEND_BOTHINVSRCALPHA:
			srcBlend.bgra.r = 0xFF - newPixelCol.bgra.a;
			srcBlend.bgra.g = 0xFF - newPixelCol.bgra.a;
			srcBlend.bgra.b = 0xFF - newPixelCol.bgra.a; break;
		case D3DBLEND_DESTALPHA:
			srcBlend.bgra.r = framebufferCol.bgra.a;
			srcBlend.bgra.g = framebufferCol.bgra.a;
			srcBlend.bgra.b = framebufferCol.bgra.a; break;
		case D3DBLEND_INVDESTALPHA:
			srcBlend.bgra.r = 0xFF - framebufferCol.bgra.a;
			srcBlend.bgra.g = 0xFF - framebufferCol.bgra.a;
			srcBlend.bgra.b = 0xFF - framebufferCol.bgra.a; break;
		case D3DBLEND_DESTCOLOR:
			srcBlend.bgra.r = framebufferCol.bgra.r;
			srcBlend.bgra.g = framebufferCol.bgra.g;
			srcBlend.bgra.b = framebufferCol.bgra.b; break;
		case D3DBLEND_INVDESTCOLOR:
			srcBlend.bgra.r = 0xFF - framebufferCol.bgra.r;
			srcBlend.bgra.g = 0xFF - framebufferCol.bgra.g;
			srcBlend.bgra.b = 0xFF - framebufferCol.bgra.b; break;
		case D3DBLEND_BLENDFACTOR:
			srcBlend.bgra.r = blendFactorCol.bgra.r;
			srcBlend.bgra.g = blendFactorCol.bgra.g;
			srcBlend.bgra.b = blendFactorCol.bgra.b; break;
		case D3DBLEND_INVBLENDFACTOR:
			srcBlend.bgra.r = 0xFF - blendFactorCol.bgra.r;
			srcBlend.bgra.g = 0xFF - blendFactorCol.bgra.g;
			srcBlend.bgra.b = 0xFF - blendFactorCol.bgra.b; break;
		case D3DBLEND_SRCALPHASAT:
		{
			const unsigned char minAlpha = (newPixelCol.bgra.a < (0xFF - framebufferCol.bgra.a) ) ? newPixelCol.bgra.a : (0xFF - framebufferCol.bgra.a);
			srcBlend.bgra.r = minAlpha;
			srcBlend.bgra.g = minAlpha;
			srcBlend.bgra.b = minAlpha; break;
		}
			break;
		case D3DBLEND_SRCCOLOR2:
		case D3DBLEND_INVSRCCOLOR2:
			__debugbreak(); // Dual source blending is not yet implemented!
			break;
		}

		switch (destColorBlend)
		{
		case D3DBLEND_ZERO:
			destBlend.bgra.r = 0;
			destBlend.bgra.g = 0;
			destBlend.bgra.b = 0; break;
		case D3DBLEND_ONE:
			destBlend.bgra.r = 0xFF;
			destBlend.bgra.g = 0xFF;
			destBlend.bgra.b = 0xFF; break;
		case D3DBLEND_SRCCOLOR:
			destBlend.bgra.r = newPixelCol.bgra.r;
			destBlend.bgra.g = newPixelCol.bgra.g;
			destBlend.bgra.b = newPixelCol.bgra.b; break;
		case D3DBLEND_SRCALPHA:
		case D3DBLEND_BOTHINVSRCALPHA:
			destBlend.bgra.r = newPixelCol.bgra.a;
			destBlend.bgra.g = newPixelCol.bgra.a;
			destBlend.bgra.b = newPixelCol.bgra.a; break;
		case D3DBLEND_INVSRCCOLOR:
			destBlend.bgra.r = 0xFF - newPixelCol.bgra.r;
			destBlend.bgra.g = 0xFF - newPixelCol.bgra.g;
			destBlend.bgra.b = 0xFF - newPixelCol.bgra.b; break;
		case D3DBLEND_INVSRCALPHA:
		case D3DBLEND_BOTHSRCALPHA:
			destBlend.bgra.r = 0xFF - newPixelCol.bgra.a;
			destBlend.bgra.g = 0xFF - newPixelCol.bgra.a;
			destBlend.bgra.b = 0xFF - newPixelCol.bgra.a; break;
		case D3DBLEND_DESTALPHA:
			destBlend.bgra.r = framebufferCol.bgra.a;
			destBlend.bgra.g = framebufferCol.bgra.a;
			destBlend.bgra.b = framebufferCol.bgra.a; break;
		case D3DBLEND_INVDESTALPHA:
			destBlend.bgra.r = 0xFF - framebufferCol.bgra.a;
			destBlend.bgra.g = 0xFF - framebufferCol.bgra.a;
			destBlend.bgra.b = 0xFF - framebufferCol.bgra.a; break;
		case D3DBLEND_DESTCOLOR:
			destBlend.bgra.r = framebufferCol.bgra.r;
			destBlend.bgra.g = framebufferCol.bgra.g;
			destBlend.bgra.b = framebufferCol.bgra.b; break;
		case D3DBLEND_INVDESTCOLOR:
			destBlend.bgra.r = 0xFF - framebufferCol.bgra.r;
			destBlend.bgra.g = 0xFF - framebufferCol.bgra.g;
			destBlend.bgra.b = 0xFF - framebufferCol.bgra.b; break;
		case D3DBLEND_BLENDFACTOR:
			destBlend.bgra.r = blendFactorCol.bgra.r;
			destBlend.bgra.g = blendFactorCol.bgra.g;
			destBlend.bgra.b = blendFactorCol.bgra.b; break;
		case D3DBLEND_INVBLENDFACTOR:
			destBlend.bgra.r = 0xFF - blendFactorCol.bgra.r;
			destBlend.bgra.g = 0xFF - blendFactorCol.bgra.g;
			destBlend.bgra.b = 0xFF - blendFactorCol.bgra.b; break;
		case D3DBLEND_SRCALPHASAT:
		{
			const unsigned char minAlpha = (newPixelCol.bgra.a < (0xFF - framebufferCol.bgra.a) ) ? newPixelCol.bgra.a : (0xFF - framebufferCol.bgra.a);
			destBlend.bgra.r = minAlpha;
			destBlend.bgra.g = minAlpha;
			destBlend.bgra.b = minAlpha; break;
		}
			break;
		case D3DBLEND_SRCCOLOR2:
		case D3DBLEND_INVSRCCOLOR2:
			__debugbreak(); // Dual source blending is not yet implemented!
			break;
		}

		switch (colorBlendOp)
		{
		case D3DBLENDOP_ADD:
		{
			const unsigned r = ( ( (unsigned)newPixelCol.bgra.r * srcBlend.bgra.r) + ( (unsigned)framebufferCol.bgra.r * destBlend.bgra.r) ) >> 8;
			const unsigned g = ( ( (unsigned)newPixelCol.bgra.g * srcBlend.bgra.g) + ( (unsigned)framebufferCol.bgra.g * destBlend.bgra.g) ) >> 8;
			const unsigned b = ( ( (unsigned)newPixelCol.bgra.b * srcBlend.bgra.b) + ( (unsigned)framebufferCol.bgra.b * destBlend.bgra.b) ) >> 8;
			if (r > 0xFF) blendedOutputCol.bgra.r = 0xFF; else blendedOutputCol.bgra.r = (const unsigned char)r;
			if (g > 0xFF) blendedOutputCol.bgra.g = 0xFF; else blendedOutputCol.bgra.g = (const unsigned char)g;
			if (b > 0xFF) blendedOutputCol.bgra.b = 0xFF; else blendedOutputCol.bgra.b = (const unsigned char)b;
		}
			break;
		case D3DBLENDOP_SUBTRACT:
		{
			const unsigned r = ( ( (unsigned)newPixelCol.bgra.r * srcBlend.bgra.r) - ( (unsigned)framebufferCol.bgra.r * destBlend.bgra.r) ) >> 8;
			const unsigned g = ( ( (unsigned)newPixelCol.bgra.g * srcBlend.bgra.g) - ( (unsigned)framebufferCol.bgra.g * destBlend.bgra.g) ) >> 8;
			const unsigned b = ( ( (unsigned)newPixelCol.bgra.b * srcBlend.bgra.b) - ( (unsigned)framebufferCol.bgra.b * destBlend.bgra.b) ) >> 8;
			if (r > 0xFF) blendedOutputCol.bgra.r = 0x00; else blendedOutputCol.bgra.r = (const unsigned char)r;
			if (g > 0xFF) blendedOutputCol.bgra.g = 0x00; else blendedOutputCol.bgra.g = (const unsigned char)g;
			if (b > 0xFF) blendedOutputCol.bgra.b = 0x00; else blendedOutputCol.bgra.b = (const unsigned char)b;
		}
			break;
		case D3DBLENDOP_REVSUBTRACT:
		{
			const unsigned r = ( ( (unsigned)framebufferCol.bgra.r * destBlend.bgra.r) - ( (unsigned)newPixelCol.bgra.r * srcBlend.bgra.r) ) >> 8;
			const unsigned g = ( ( (unsigned)framebufferCol.bgra.g * destBlend.bgra.g) - ( (unsigned)newPixelCol.bgra.g * srcBlend.bgra.g) ) >> 8;
			const unsigned b = ( ( (unsigned)framebufferCol.bgra.b * destBlend.bgra.b) - ( (unsigned)newPixelCol.bgra.b * srcBlend.bgra.b) ) >> 8;
			if (r > 0xFF) blendedOutputCol.bgra.r = 0x00; else blendedOutputCol.bgra.r = (const unsigned char)r;
			if (g > 0xFF) blendedOutputCol.bgra.g = 0x00; else blendedOutputCol.bgra.g = (const unsigned char)g;
			if (b > 0xFF) blendedOutputCol.bgra.b = 0x00; else blendedOutputCol.bgra.b = (const unsigned char)b;
		}
			break;
		}
		break;
	}

	switch (alphaBlendOp)
	{
	case D3DBLENDOP_MIN:
		blendedOutputCol.bgra.a = (newPixelCol.bgra.a < framebufferCol.bgra.a) ? newPixelCol.bgra.a : framebufferCol.bgra.a;
		break;
	case D3DBLENDOP_MAX:
		blendedOutputCol.bgra.a = (newPixelCol.bgra.a > framebufferCol.bgra.a) ? newPixelCol.bgra.a : framebufferCol.bgra.a;
		break;
	default:
		switch (srcAlphaBlend)
		{
		case D3DBLEND_ZERO:
			srcBlend.bgra.a = 0; break;
		case D3DBLEND_ONE:
		case D3DBLEND_SRCALPHASAT:
			srcBlend.bgra.a = 0xFF; break;
		case D3DBLEND_SRCCOLOR:
		case D3DBLEND_SRCALPHA:
		case D3DBLEND_BOTHSRCALPHA:
			srcBlend.bgra.a = newPixelCol.bgra.a; break;
		case D3DBLEND_INVSRCCOLOR:
		case D3DBLEND_INVSRCALPHA:
		case D3DBLEND_BOTHINVSRCALPHA:
			srcBlend.bgra.a = 0xFF - newPixelCol.bgra.a; break;
		case D3DBLEND_DESTALPHA:
		case D3DBLEND_DESTCOLOR:
			srcBlend.bgra.a = framebufferCol.bgra.a; break;
		case D3DBLEND_INVDESTALPHA:
		case D3DBLEND_INVDESTCOLOR:
			srcBlend.bgra.a = 0xFF - framebufferCol.bgra.a; break;
		case D3DBLEND_BLENDFACTOR:
			srcBlend.bgra.a = blendFactorCol.bgra.a; break;
		case D3DBLEND_INVBLENDFACTOR:
			srcBlend.bgra.a = 0xFF - blendFactorCol.bgra.a; break;
		case D3DBLEND_SRCCOLOR2:
		case D3DBLEND_INVSRCCOLOR2:
			__debugbreak(); // Dual source blending is not yet implemented!
			break;
		}

		switch (destAlphaBlend)
		{
		case D3DBLEND_ZERO:
			destBlend.bgra.a = 0; break;
		case D3DBLEND_ONE:
		case D3DBLEND_SRCALPHASAT:
			destBlend.bgra.a = 0xFF; break;
		case D3DBLEND_SRCCOLOR:
		case D3DBLEND_SRCALPHA:
		case D3DBLEND_BOTHINVSRCALPHA:
			destBlend.bgra.a = newPixelCol.bgra.a; break;
		case D3DBLEND_INVSRCCOLOR:
		case D3DBLEND_INVSRCALPHA:
		case D3DBLEND_BOTHSRCALPHA:
			destBlend.bgra.a = 0xFF - newPixelCol.bgra.a; break;
		case D3DBLEND_DESTALPHA:
		case D3DBLEND_DESTCOLOR:
			destBlend.bgra.a = framebufferCol.bgra.a; break;
		case D3DBLEND_INVDESTALPHA:
		case D3DBLEND_INVDESTCOLOR:
			destBlend.bgra.a = 0xFF - framebufferCol.bgra.a; break;
		case D3DBLEND_BLENDFACTOR:
			destBlend.bgra.a = blendFactorCol.bgra.a; break;
		case D3DBLEND_INVBLENDFACTOR:
			destBlend.bgra.a = 0xFF - blendFactorCol.bgra.a; break;
		case D3DBLEND_SRCCOLOR2:
		case D3DBLEND_INVSRCCOLOR2:
			__debugbreak(); // Dual source blending is not yet implemented!
			break;
		}

		switch (alphaBlendOp)
		{
		case D3DBLENDOP_ADD:
		{
			const unsigned a = ( ( (unsigned)newPixelCol.bgra.a * srcBlend.bgra.a) + ( (unsigned)framebufferCol.bgra.a * destBlend.bgra.a) ) >> 8;
			if (a > 0xFF) blendedOutputCol.bgra.a = 0xFF; else blendedOutputCol.bgra.a = (const unsigned char)a;
		}
			break;
		case D3DBLENDOP_SUBTRACT:
		{
			const unsigned a = ( ( (unsigned)newPixelCol.bgra.a * srcBlend.bgra.a) - ( (unsigned)framebufferCol.bgra.a * destBlend.bgra.a) ) >> 8;
			if (a > 0xFF) blendedOutputCol.bgra.a = 0x00; else blendedOutputCol.bgra.a = (const unsigned char)a;
		}
			break;
		case D3DBLENDOP_REVSUBTRACT:
		{
			const unsigned a = ( ( (unsigned)framebufferCol.bgra.a * destBlend.bgra.a) - ( (unsigned)newPixelCol.bgra.a * srcBlend.bgra.a) ) >> 8;
			if (a > 0xFF) blendedOutputCol.bgra.a = 0x00; else blendedOutputCol.bgra.a = (const unsigned char)a;
		}
			break;
		}
		break;
	}

	return D3DCOLOR_ABGR(blendedOutputCol.bgra.a, blendedOutputCol.bgra.r, blendedOutputCol.bgra.g, blendedOutputCol.bgra.b);
}

const D3DCOLOR ApplyWriteMask(const unsigned outputWriteMask, const D3DCOLOR blendedColor, const D3DCOLOR framebufferPixel)
{
	COLOR_UBYTE4_ARGB newPixelCol, framebufferCol, maskCombinedColor;
	newPixelCol.dwordColor = blendedColor;
	framebufferCol.dwordColor = framebufferPixel;

	maskCombinedColor.dwordColor = 0x00000000;
	if (outputWriteMask & D3DCOLORWRITEENABLE_RED)
		maskCombinedColor.bgra.r = newPixelCol.bgra.r;
	else
		maskCombinedColor.bgra.r = framebufferCol.bgra.r;
	if (outputWriteMask & D3DCOLORWRITEENABLE_GREEN)
		maskCombinedColor.bgra.g = newPixelCol.bgra.g;
	else
		maskCombinedColor.bgra.g = framebufferCol.bgra.g;
	if (outputWriteMask & D3DCOLORWRITEENABLE_BLUE)
		maskCombinedColor.bgra.b = newPixelCol.bgra.b;
	else
		maskCombinedColor.bgra.b = framebufferCol.bgra.b;
	if (outputWriteMask & D3DCOLORWRITEENABLE_ALPHA)
		maskCombinedColor.bgra.a = newPixelCol.bgra.a;
	else
		maskCombinedColor.bgra.a = framebufferCol.bgra.a;
	return maskCombinedColor.dwordColor;
}

const DWORD ColorSwizzleARGBToABGR(const D3DCOLOR colorARGB)
{
	const unsigned char colorA = (colorARGB >> 24) & 0xFF;
	const unsigned char colorR = (colorARGB >> 16) & 0xFF;
	const unsigned char colorG = (colorARGB >> 8) & 0xFF;
	const unsigned char colorB = colorARGB & 0xFF;

	return (colorA << 24) | (colorB << 16) | (colorG << 8) | (colorR);
}

void EmulateROPCPU(const std::vector<texSampOutput>& inputPixelColorData, std::vector<D3DCOLOR>& outFramebuffer, const unsigned outputWriteMask, const bool alphaTestEnabled, const unsigned char alphaTestRefVal, const D3DCMPFUNC alphaTestFunc,
	const bool blendingEnabled,
	const D3DBLEND srcColorBlend, const D3DBLEND destColorBlend, const D3DBLENDOP colorBlendOp,
	const D3DBLEND srcAlphaBlend, const D3DBLEND destAlphaBlend, const D3DBLENDOP alphaBlendOp, const D3DCOLOR blendFactorARGB)
{
	const unsigned numPixels = (const unsigned)(inputPixelColorData.size() );
	const DWORD blendFactorABGR = ColorSwizzleARGBToABGR(blendFactorARGB); // Convert our D3DCOLOR ARGB format color into an ABGR color
	for (unsigned x = 0; x < numPixels; ++x)
	{
		const texSampOutput& thisPixelInput = inputPixelColorData[x];
		const D3DCOLOR inputColor = D3DCOLOR_ABGR(thisPixelInput.colorA, thisPixelInput.colorR, thisPixelInput.colorG, thisPixelInput.colorB);

		if (alphaTestEnabled)
		{
			const bool alphaTestPassed = AlphaTest(inputColor >> 24, alphaTestRefVal, alphaTestFunc);
			if (!alphaTestPassed)
			{
				// Discard this pixel because it failed the alpha test
				continue;
			}
		}

		const D3DCOLOR framebufferPixel = outFramebuffer[thisPixelInput.pixelY * 640 + thisPixelInput.pixelX];

		// I'm pretty sure that blending happens *after* the alpha test, not before it. But if that's not actually true, then it's really easy to just swap the order of is and the AlphaTest function.
		const D3DCOLOR blendedColor = PerformBlending(inputColor, framebufferPixel, blendingEnabled,
			srcColorBlend, destColorBlend, colorBlendOp,
			srcAlphaBlend, destAlphaBlend, alphaBlendOp, blendFactorABGR);

		const D3DCOLOR writeMaskedColor = ApplyWriteMask(outputWriteMask, blendedColor, framebufferPixel);

		if (writeMaskedColor != framebufferPixel)
		{
			outFramebuffer[thisPixelInput.pixelY * 640 + thisPixelInput.pixelX] = writeMaskedColor;
		}
	}
}

static void UpdateInputFIFO(std::vector<texSampOutput>& fifoDataVec, std_logic_vector_port<64>& TEXSAMP_InFIFO_rd_data, std_logic_port& TEXSAMP_InFIFO_empty, std_logic_port& TEXSAMP_InFIFO_rd_en)
{
	TEXSAMP_InFIFO_empty = fifoDataVec.empty();
	if (TEXSAMP_InFIFO_rd_en.GetBoolVal() )
	{
		fifoDataVec.erase(fifoDataVec.begin() );
	}
	if (!fifoDataVec.empty() )
	{
		TEXSAMP_InFIFO_rd_data.SetStructVal(fifoDataVec.front() );
	}
	else
	{
		TEXSAMP_InFIFO_rd_data.SetToZero();
	}
}

const int RunTestsROP(Xsi::Loader& loader, RenderWindow* renderWindow)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

// Memory Controller FIFO interface begin
	// DRAM read requests FIFO:
	std_logic_vector_port<30> MEM_ROPReadRequestsFIFO_wr_data(PD_OUT, loader, "MEM_ROPReadRequestsFIFO_wr_data");
	std_logic_port MEM_ROPReadRequestsFIFO_full(PD_IN, loader, "MEM_ROPReadRequestsFIFO_full");
	std_logic_port MEM_ROPReadRequestsFIFO_wr_en(PD_OUT, loader, "MEM_ROPReadRequestsFIFO_wr_en");

	// DRAM read responses FIFO:
	std_logic_vector_port<256> MEM_ROPReadResponsesFIFO_rd_data(PD_IN, loader, "MEM_ROPReadResponsesFIFO_rd_data");
	std_logic_port MEM_ROPReadResponsesFIFO_empty(PD_IN, loader, "MEM_ROPReadResponsesFIFO_empty");
	std_logic_port MEM_ROPReadResponsesFIFO_rd_en(PD_OUT, loader, "MEM_ROPReadResponsesFIFO_rd_en");

	// DRAM write requests FIFO:
	std_logic_vector_port<30+256+256/32> MEM_ROPWriteRequestsFIFO_wr_data(PD_OUT, loader, "MEM_ROPWriteRequestsFIFO_wr_data");
	std_logic_port MEM_ROPWriteRequestsFIFO_full(PD_IN, loader, "MEM_ROPWriteRequestsFIFO_full");
	std_logic_port MEM_ROPWriteRequestsFIFO_wr_en(PD_OUT, loader, "MEM_ROPWriteRequestsFIFO_wr_en");
// Memory Controller FIFO interface end

// Command Processor block interface begin
	std_logic_vector_port<32> CMD_SetClearColor(PD_IN, loader, "CMD_SetClearColor");
	std_logic_port CMD_ClearSignal(PD_IN, loader, "CMD_ClearSignal");
	std_logic_port CMD_ClearSignalAck(PD_OUT, loader, "CMD_ClearSignalAck");

	std_logic_port CMD_FlushCacheSignal(PD_IN, loader, "CMD_FlushCacheSignal");
	std_logic_port CMD_FlushCacheAck(PD_OUT, loader, "CMD_FlushCacheAck");

	std_logic_port CMD_ROPIsIdle(PD_OUT, loader, "CMD_ROPIsIdle");

	std_logic_port CMD_SetBaseAddrAndAlphaTestSignal(PD_IN, loader, "CMD_SetBaseAddrAndAlphaTestSignal");
	std_logic_port CMD_SetBaseAddrAndAlphaTestSignalAck(PD_OUT, loader, "CMD_SetBaseAddrAndAlphaTestSignalAck");
	std_logic_vector_port<30> CMD_SetRenderTargetBaseAddr(PD_IN, loader, "CMD_SetRenderTargetBaseAddr");
	std_logic_vector_port<4> CMD_SetWriteMask(PD_IN, loader, "CMD_SetWriteMask");
	std_logic_port CMD_SetAlphaTestEnabled(PD_IN, loader, "CMD_SetAlphaTestEnabled");
	std_logic_vector_port<8> CMD_SetAlphaTestRefVal(PD_IN, loader, "CMD_SetAlphaTestRefVal");
	std_logic_vector_port<3> CMD_SetAlphaTestFunc(PD_IN, loader, "CMD_SetAlphaTestFunc");

	std_logic_port CMD_SetBlendStateSignal(PD_IN, loader, "CMD_SetBlendStateSignal");
	std_logic_port CMD_SetBlendStateSigAck(PD_OUT, loader, "CMD_SetBlendStateSigAck");
	std_logic_port CMD_SetAlphaBlendEnable(PD_IN, loader, "CMD_SetAlphaBlendEnable");
	std_logic_vector_port<32> CMD_SetAlphaBlendFactor(PD_IN, loader, "CMD_SetAlphaBlendFactor");
	std_logic_vector_port<22> CMD_SetAlphaBlendStateBlock(PD_IN, loader, "CMD_SetAlphaBlendStateBlock");
// Command Processor block interface end

// Texture Sampler interface begin
	std_logic_vector_port<64> TEXSAMP_InFIFO_rd_data(PD_IN, loader, "TEXSAMP_InFIFO_rd_data");
	std_logic_port TEXSAMP_InFIFO_empty(PD_IN, loader, "TEXSAMP_InFIFO_empty");
	std_logic_port TEXSAMP_InFIFO_rd_en(PD_OUT, loader, "TEXSAMP_InFIFO_rd_en");
// Texture Sampler interface end

// Debug signals
#ifdef DEBUG_PORTS_DEBUG
	std_logic_vector_port<5> DBG_ROP_State(PD_OUT, loader, "DBG_ROP_State");
	std_logic_vector_port<30> DBG_CurrentPixelAddr(PD_OUT, loader, "DBG_CurrentPixelAddr");
	std_logic_vector_port<32> DBG_CurrentBlendedColor(PD_OUT, loader, "DBG_CurrentBlendedColor");
	std_logic_vector_port<32> DBG_PreviousFramebufferColor(PD_OUT, loader, "DBG_PreviousFramebufferColor");
	std_logic_vector_port<8> DBG_CurrentCacheLineDirtyFlags(PD_OUT, loader, "DBG_CurrentCacheLineDirtyFlags");
	std_logic_vector_port<48> DBG_TempSelectedOutputRGB(PD_OUT, loader, "DBG_TempSelectedOutputRGB");
	std_logic_vector_port<16> DBG_TempSelectedOutputA(PD_OUT, loader, "DBG_TempSelectedOutputA");
	std_logic_vector_port<96> DBG_TempBlendedOutputRGB(PD_OUT, loader, "DBG_TempBlendedOutputRGB");
	std_logic_vector_port<32> DBG_TempBlendedOutputA(PD_OUT, loader, "DBG_TempBlendedOutputA");
	std_logic_port DBG_ReadRequestFIFOFull(PD_OUT, loader, "DBG_ReadRequestFIFOFull");
#endif // #ifdef DEBUG_PORTS_DEBUG

	bool successResult = true;

	LPDIRECT3DTEXTURE9 gradientTexture128x128 = NULL;
	if (FAILED(D3DXCreateTextureFromFileExA(renderWindow->GetD3D9Dev(), "RedGreenGradient128x128.png", D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_X8R8G8B8, D3DPOOL_MANAGED, D3DX_DEFAULT, D3DX_DEFAULT, 0, NULL, NULL, &gradientTexture128x128) ) || !gradientTexture128x128)
	{
		__debugbreak();
		return E_FAIL;
	}

	LPDIRECT3DTEXTURE9 rainbowTexture128x128 = NULL;
	if (FAILED(D3DXCreateTextureFromFileExA(renderWindow->GetD3D9Dev(), "TestRainbowRGBA_128x128.png", D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_A8R8G8B8, D3DPOOL_MANAGED, D3DX_DEFAULT, D3DX_DEFAULT, 0, NULL, NULL, &rainbowTexture128x128) ) || !rainbowTexture128x128)
	{
		__debugbreak();
		return E_FAIL;
	}

	srand(3); // Pick a stable seed so we get consistent random results

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		MEM_ROPReadRequestsFIFO_full = false;
		MEM_ROPReadResponsesFIFO_empty = false;
		MEM_ROPReadResponsesFIFO_rd_data;
		MEM_ROPWriteRequestsFIFO_full = false;
		CMD_SetBlendStateSignal = false;
		CMD_SetClearColor = (const uint32_t)D3DCOLOR_ARGB(255, 0, 0, 0);
		CMD_SetBaseAddrAndAlphaTestSignal = false;
		CMD_ClearSignal = false;
		CMD_FlushCacheSignal = false;
		CMD_SetRenderTargetBaseAddr = 0x00000000;
		CMD_SetWriteMask = 0x0;
		CMD_SetAlphaTestEnabled = false;
		CMD_SetAlphaTestRefVal = 0x00;
		CMD_SetAlphaTestFunc = (D3DCMP_ALWAYS - 1);
		CMD_SetAlphaBlendEnable = false;
		CMD_SetAlphaBlendFactor = 0xFFFFFFFF;
		CMD_SetAlphaBlendStateBlock = 0x00000000;
		TEXSAMP_InFIFO_empty = true;
		TEXSAMP_InFIFO_rd_data.SetToZero();
	}

	const char* framebufferMemoryUpperBits = NULL;

	std::vector<memResponse> memResponses;
	std::vector<D3DCOLOR> framebufferRTL;
	framebufferRTL.resize(640 * 480, D3DCOLOR_ARGB(255, 0, 0, 0) );

	std::vector<D3DCOLOR> emulatedCPUFramebuffer;
	emulatedCPUFramebuffer.resize(640 * 480, D3DCOLOR_ARGB(255, 0, 0, 0) );

	framebufferMemoryUpperBits = reinterpret_cast<char*>(&framebufferRTL.front() );

	auto updateMemoryController = [&]()
	{
		// Handle read requests:
		MEM_ROPReadRequestsFIFO_full = false;
		if (MEM_ROPReadRequestsFIFO_wr_en.GetBoolVal() )
		{
			const uint32_t readBaseAddress = MEM_ROPReadRequestsFIFO_wr_data.GetUint32Val();

			const char* const readStartAddress = (const char* const)( (reinterpret_cast<const unsigned __int64>(framebufferMemoryUpperBits) & (~0x3FFFFFFFull) ) | readBaseAddress);

			++memoryReadTransactionsCount;
			memoryReadDWORDCount += 8;

			memResponse newMemRead;
			memcpy(newMemRead.data, readStartAddress, 32);
			memResponses.push_back(newMemRead);
		}

		// Handle read responses:
		MEM_ROPReadResponsesFIFO_empty = memResponses.empty();
		if (!memResponses.empty() )
		{
			MEM_ROPReadResponsesFIFO_rd_data.SetToByteMemory(&memResponses.front() );
		}
		if (MEM_ROPReadResponsesFIFO_rd_en.GetBoolVal() )
		{
			memResponses.erase(memResponses.begin() );
			MEM_ROPReadResponsesFIFO_empty = memResponses.empty();
			if (!memResponses.empty() )
			{
				MEM_ROPReadResponsesFIFO_rd_data.SetToByteMemory(&memResponses.front() );
			}
		}

		// Handle memory writes:
		MEM_ROPWriteRequestsFIFO_full = false;
		if (MEM_ROPWriteRequestsFIFO_wr_en.GetBoolVal() )
		{
			memWriteRequestStruct memWriteRequest = {0};
			MEM_ROPWriteRequestsFIFO_wr_data.GetStructValPartialFit(memWriteRequest);

			++memoryWriteTransactionsCount;

			// Should never submit a write request that has nothing to write!
			if (memWriteRequest.DWORDWriteEnableMask == 0x00)
			{
				__debugbreak();
			}

			memoryWriteDWORDCount += __popcnt16(memWriteRequest.DWORDWriteEnableMask);

			const unsigned writeBaseAddress = memWriteRequest.writeAddr;
			unsigned* const writeStartAddress = (unsigned* const)( (reinterpret_cast<const unsigned __int64>(framebufferMemoryUpperBits) & (~0x3FFFFFFFull) ) | writeBaseAddress);
			for (unsigned x = 0; x < 8; ++x)
			{
				if (memWriteRequest.DWORDWriteEnableMask & (1 << x) )
				{
					writeStartAddress[x] = memWriteRequest.writeData[x];
				}
			}
		}
	};

	auto SimulateFlushROPCache = [&]()
	{
		// Wait for idle before doing anything else:
		while (CMD_ROPIsIdle.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
		}

		// Just pulse the "flush cache" signal for one cycle:
		{
			scoped_timestep time(loader, clk, 100);
			CMD_FlushCacheSignal = true;
			updateMemoryController();
		}
		{
			scoped_timestep time(loader, clk, 100);
			CMD_FlushCacheSignal = false;
			updateMemoryController();
		}

		// Wait for the ack that indicates flushing the cache is complete:
		while (CMD_FlushCacheAck.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
		}

		// Wait for idle before doing anything else:
		while (CMD_ROPIsIdle.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
		}
	};

	auto SimulateROPRTL = [&](const std::vector<texSampOutput>& inputPixelColorData, std::vector<D3DCOLOR>& outFramebuffer, const unsigned outputWriteMask, const bool alphaTestEnabled, const unsigned char alphaTestRefVal, const D3DCMPFUNC alphaTestFunc,
		const bool blendingEnabled,
		const D3DBLEND srcColorBlend, const D3DBLEND destColorBlend, const D3DBLENDOP colorBlendOp,
		const D3DBLEND srcAlphaBlend, const D3DBLEND destAlphaBlend, const D3DBLENDOP alphaBlendOp, const D3DCOLOR blendFactorARGB)
	{
		if (inputPixelColorData.empty() )
		{
			return;
		}

		// Duplicate our array so that the same array can be passed to both the simulator and to the emulation code
		std::vector<texSampOutput> inputTexSampData = inputPixelColorData;
		std::vector<texSampOutput> emptyVector;

		// Wait for idle first:
		while (CMD_ROPIsIdle.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
			UpdateInputFIFO(emptyVector, TEXSAMP_InFIFO_rd_data, TEXSAMP_InFIFO_empty, TEXSAMP_InFIFO_rd_en);
		}

		// Configure render target and alpha-testing state using the CMD signals:
		CMD_SetBaseAddrAndAlphaTestSignal = true;
		unsigned char* const renderTargetAddr = (unsigned char* const)&outFramebuffer.front();
		CMD_SetRenderTargetBaseAddr = reinterpret_cast<uint32_t>(renderTargetAddr);
		CMD_SetWriteMask = (const unsigned char)outputWriteMask;
		CMD_SetAlphaTestEnabled = alphaTestEnabled;
		CMD_SetAlphaTestRefVal = alphaTestRefVal;
		CMD_SetAlphaTestFunc = (const unsigned char)(alphaTestFunc - 1);
		while (CMD_SetBaseAddrAndAlphaTestSignalAck.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
			UpdateInputFIFO(emptyVector, TEXSAMP_InFIFO_rd_data, TEXSAMP_InFIFO_empty, TEXSAMP_InFIFO_rd_en);
		}
		CMD_SetBaseAddrAndAlphaTestSignal = false;

		// Configure blending state using the CMD signals:
		CMD_SetBlendStateSignal = true;
		CMD_SetAlphaBlendEnable = blendingEnabled;
		CMD_SetAlphaBlendFactor = (const uint32_t)ColorSwizzleARGBToABGR(blendFactorARGB); // The BlendFactor is expected to be in 0xAABBGGRR format (this is *not* how D3DCOLOR typically stores its bits)
		blendStateBlock blendState;
		blendState.ConvertFromD3DRS(blendingEnabled, srcColorBlend, destColorBlend, colorBlendOp,
			srcAlphaBlend, destAlphaBlend, alphaBlendOp, blendFactorARGB);
		CMD_SetAlphaBlendStateBlock.SetToByteMemory(&blendState);
		while (CMD_SetBlendStateSigAck.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
			UpdateInputFIFO(emptyVector, TEXSAMP_InFIFO_rd_data, TEXSAMP_InFIFO_empty, TEXSAMP_InFIFO_rd_en);
		}
		CMD_SetBlendStateSignal = false;

		// Flush the ROP cache so that we start our ROP blending with an empty cache:
		SimulateFlushROPCache();

		// Wait for idle before doing anything else:
		while (CMD_ROPIsIdle.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
			UpdateInputFIFO(emptyVector, TEXSAMP_InFIFO_rd_data, TEXSAMP_InFIFO_empty, TEXSAMP_InFIFO_rd_en);
		}

		// Now provide real work to do:
		while (CMD_ROPIsIdle.GetBoolVal() == true)
		{
			scoped_timestep time(loader, clk, 100);
#ifdef DEBUG_PORTS_DEBUG
			currentState = (const ROPStateType)DBG_ROP_State.GetUint8Val();
#endif // #ifdef DEBUG_PORTS_DEBUG
			updateMemoryController();
			UpdateInputFIFO(inputTexSampData, TEXSAMP_InFIFO_rd_data, TEXSAMP_InFIFO_empty, TEXSAMP_InFIFO_rd_en);
		}

		// Wait until the ROP unit is done processing all of its work:
		while (CMD_ROPIsIdle.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
			UpdateInputFIFO(inputTexSampData, TEXSAMP_InFIFO_rd_data, TEXSAMP_InFIFO_empty, TEXSAMP_InFIFO_rd_en);
#ifdef DEBUG_PORTS_DEBUG
			currentState = (const ROPStateType)DBG_ROP_State.GetUint8Val();
			currentBlendResult = DBG_CurrentBlendedColor.GetUint32Val();
			previousFramebufferColor = DBG_PreviousFramebufferColor.GetUint32Val();
			currentCacheLineDirtyFlags = DBG_CurrentCacheLineDirtyFlags.GetUint8Val();
			DBG_TempBlendedOutputRGB.GetStructVal(tempBlendedOutputRGB);
			DBG_TempBlendedOutputA.GetStructVal(tempBlendedOutputA);
#endif // #ifdef DEBUG_PORTS_DEBUG
		}

		// We need to flush the ROP cache when we're done writing all of our pixel data in order to force our writes to complete
		SimulateFlushROPCache();
	};

	auto runROPTest = [&](const std::vector<texSampOutput>& inputPixelColorData, const unsigned outputWriteMask, const bool alphaTestEnabled, const unsigned char alphaTestRefVal, const D3DCMPFUNC alphaTestFunc,
		const bool blendingEnabled,
		const D3DBLEND srcColorBlend, const D3DBLEND destColorBlend, const D3DBLENDOP colorBlendOp,
		const D3DBLEND srcAlphaBlend, const D3DBLEND destAlphaBlend, const D3DBLENDOP alphaBlendOp, const D3DCOLOR blendFactorARGB) -> bool
	{
		EmulateROPCPU(inputPixelColorData, emulatedCPUFramebuffer, outputWriteMask, alphaTestEnabled, alphaTestRefVal, alphaTestFunc,
			blendingEnabled,
			srcColorBlend, destColorBlend, colorBlendOp,
			srcAlphaBlend, destAlphaBlend, alphaBlendOp, blendFactorARGB);

		SimulateROPRTL(inputPixelColorData, framebufferRTL, outputWriteMask, alphaTestEnabled, alphaTestRefVal, alphaTestFunc,
			blendingEnabled,
			srcColorBlend, destColorBlend, colorBlendOp,
			srcAlphaBlend, destAlphaBlend, alphaBlendOp, blendFactorARGB);

		if (emulatedCPUFramebuffer.size() != framebufferRTL.size() )
		{
			__debugbreak();
		}

		const unsigned numInputPixels = (const unsigned)inputPixelColorData.size();
		for (unsigned y = 0; y < numInputPixels; ++y)
		{
			const texSampOutput& currentInputPixel = inputPixelColorData[y];

			/*const unsigned numPixels = (const unsigned)emulatedCPUFramebuffer.size();
			for (unsigned x = 0; x < numPixels; ++x)
			{*/
				const D3DCOLOR emulatedCPUPixel = emulatedCPUFramebuffer[currentInputPixel.pixelY * 640 + currentInputPixel.pixelX];
				const D3DCOLOR simulatedRTLPixel = framebufferRTL[currentInputPixel.pixelY * 640 + currentInputPixel.pixelX];

				if (emulatedCPUPixel != simulatedRTLPixel)
				{
					__debugbreak();
					return false;
				}
			//}
		}

		return true;
	};

	// Indices are expected to arrive in CCW order:
	auto testSimpleDrawCall = [&](const testVert* const vertices, const unsigned short* const indicesCCW, const unsigned numPrims, const bool useBilinearInterp, LPDIRECT3DTEXTURE9 setTexture, 
		unsigned outputWriteMask, bool alphaTestEnabled, unsigned char alphaTestRefVal, D3DCMPFUNC alphaTestFunc,
		const bool randomAttributes = false,
		bool blendingEnabled = false,
		D3DBLEND srcColorBlend = D3DBLEND_ONE, D3DBLEND destColorBlend = D3DBLEND_ZERO, D3DBLENDOP colorBlendOp = D3DBLENDOP_ADD,
		D3DBLEND srcAlphaBlend = D3DBLEND_ONE, D3DBLEND destAlphaBlend = D3DBLEND_ZERO, D3DBLENDOP alphaBlendOp = D3DBLENDOP_ADD, D3DCOLOR blendFactor = D3DCOLOR_ARGB(255, 255, 255, 255) ) -> bool
	{
		D3DSURFACE_DESC texDesc = {};
		setTexture->GetLevelDesc(0, &texDesc);
		D3DLOCKED_RECT d3dlr = {0};
		setTexture->LockRect(0, &d3dlr, NULL, D3DLOCK_READONLY);

		if (randomAttributes)
		{
			outputWriteMask = rand() & 0xF;
			blendingEnabled = true;
			srcColorBlend = (const D3DBLEND)( (rand() % 15) + 1);
			destColorBlend = (const D3DBLEND)( (rand() % 15) + 1);
			srcAlphaBlend = (const D3DBLEND)( (rand() % 15) + 1);
			destAlphaBlend = (const D3DBLEND)( (rand() % 15) + 1);
			colorBlendOp = (const D3DBLENDOP)( (rand() % 5) + 1);
			alphaBlendOp = (const D3DBLENDOP)( (rand() % 5) + 1);
			blendFactor = D3DCOLOR_ARGB(rand() & 0xFF, rand() & 0xFF, rand() & 0xFF, rand() & 0xFF);
			alphaTestEnabled = (rand() & 0x1) ? true : false;
			alphaTestRefVal = (rand() & 0xFF);
			alphaTestFunc = (const D3DCMPFUNC)( (rand() & 0x7) + 1);
		}

		unsigned numPrimsPassedTriCull = 0;

		for (unsigned x = 0; x < numPrims; ++x)
		{
			triSetupInput primTriData; 
			
			// Draw vertices in "0, 2, 1" order to swizzle CCW to CW ordering for our triangle setup to not consider them backfacing:
			primTriData.v0.xPos = vertices[indicesCCW[x * 3] ].posX;
			primTriData.v0.yPos = vertices[indicesCCW[x * 3] ].posY;
			primTriData.v0.zPos = 0.5f;
			primTriData.v0.wPos = 1.0f;
			primTriData.v0.xTex = 0.0f;
			primTriData.v0.yTex = 1.0f;
			primTriData.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
			primTriData.v1.xPos = vertices[indicesCCW[x * 3 + 2] ].posX;
			primTriData.v1.yPos = vertices[indicesCCW[x * 3 + 2] ].posY;
			primTriData.v1.zPos = 0.5f;
			primTriData.v1.wPos = 1.0f;
			primTriData.v1.xTex = 1.0f;
			primTriData.v1.yTex = 0.0f;
			primTriData.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
			primTriData.v2.xPos = vertices[indicesCCW[x * 3 + 1] ].posX;
			primTriData.v2.yPos = vertices[indicesCCW[x * 3 + 1] ].posY;
			primTriData.v2.zPos = 0.5f;
			primTriData.v2.wPos = 1.0f;
			primTriData.v2.xTex = 0.0f;
			primTriData.v2.yTex = 0.0f;
			primTriData.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };
			if (randomAttributes)
			{
				const float randomZ0 = frand() * 0.5f + 0.5f; // We currently only support depth values between 0.5f and 1.0f
				const float randomZ1 = frand() * 0.5f + 0.5f;
				const float randomZ2 = frand() * 0.5f + 0.5f;
				primTriData.v0.zPos = randomZ0;
				primTriData.v1.zPos = randomZ1;
				primTriData.v2.zPos = randomZ2;

				const float randomW0 = frand() * 0.5f + 0.5f; // We currently only support W values between 0.5f and 1.0f
				const float randomW1 = frand() * 0.5f + 0.5f;
				const float randomW2 = frand() * 0.5f + 0.5f;
				primTriData.v0.wPos = randomW0;
				primTriData.v1.wPos = randomW1;
				primTriData.v2.wPos = randomW2;

				primTriData.v0.rgba = { frand(), frand(), frand(), frand() };
				primTriData.v1.rgba = { frand(), frand(), frand(), frand() };
				primTriData.v2.rgba = { frand(), frand(), frand(), frand() };

				primTriData.v0.xTex = frand() * 32.0f - 16.0f;
				primTriData.v0.yTex = frand() * 32.0f - 16.0f;
				primTriData.v1.xTex = frand() * 32.0f - 16.0f;
				primTriData.v1.yTex = frand() * 32.0f - 16.0f;
				primTriData.v2.xTex = frand() * 32.0f - 16.0f;
				primTriData.v2.yTex = frand() * 32.0f - 16.0f;

				// Premultiply the Z-values by the W-values because we want these to be the post-divide-by-zero z-values:
				primTriData.v0.zPos *= primTriData.v0.wPos;
				primTriData.v1.zPos *= primTriData.v1.wPos;
				primTriData.v2.zPos *= primTriData.v2.wPos;
			}

			UntransformViewport(primTriData);

			std::vector<triSetupInput> unclippedTris;
			unclippedTris.push_back(primTriData);
			std::vector<triSetupInput> clippedTris;
			EmulateCPUClipper(unclippedTris, clippedTris);

			// Emulate the vertex shader by pre-dividing the perspective-interpolated attributes by W:
			/*primTriData.v0.xTex *= primTriData.v0.invW;
			primTriData.v0.yTex *= primTriData.v0.invW;
			primTriData.v0.rgba.r *= primTriData.v0.invW;
			primTriData.v0.rgba.g *= primTriData.v0.invW;
			primTriData.v0.rgba.b *= primTriData.v0.invW;
			primTriData.v0.rgba.a *= primTriData.v0.invW;
			primTriData.v1.xTex *= primTriData.v1.invW;
			primTriData.v1.yTex *= primTriData.v1.invW;
			primTriData.v1.rgba.r *= primTriData.v1.invW;
			primTriData.v1.rgba.g *= primTriData.v1.invW;
			primTriData.v1.rgba.b *= primTriData.v1.invW;
			primTriData.v1.rgba.a *= primTriData.v1.invW;
			primTriData.v2.xTex *= primTriData.v2.invW;
			primTriData.v2.yTex *= primTriData.v2.invW;
			primTriData.v2.rgba.r *= primTriData.v2.invW;
			primTriData.v2.rgba.g *= primTriData.v2.invW;
			primTriData.v2.rgba.b *= primTriData.v2.invW;
			primTriData.v2.rgba.a *= primTriData.v2.invW;*/

			const unsigned numClippedTris = (const unsigned)clippedTris.size();
			for (unsigned y = 0; y < numClippedTris; ++y)
			{
				const triSetupInput& thisClippedTri = clippedTris[y];

				triSetupOutput triSetupData;
				if (EmulateCPUTriSetup(thisClippedTri, triSetupData) != triSetup_OK) // If this fails, then it's because our triangle got culled or clipped or backface-killed or something
				{
					// __debugbreak();
					continue;
				}

				++numPrimsPassedTriCull;

				std::vector<rasterizedPixelData> rasterizedPixels;

				rasterizedPixelData startNewTriMessage = {0};
				startNewTriMessage.pixelX = startNewTriangleSlotCommand;
				startNewTriMessage.pixelY = (currentTriCacheIndex) % 8;
				rasterizedPixels.push_back(startNewTriMessage);

				EmulateCPURasterizer(triSetupData, rasterizedPixels);

				rasterizedPixelData endTriMessage = {0};
				endTriMessage.pixelX = finishCurrentTriangleCommand;
				endTriMessage.pixelY = (currentTriCacheIndex++) % 8;
				rasterizedPixels.push_back(endTriMessage);

				std::vector<depthInterpOutputData> emulatedCPUDepthInterpData;
				EmulateDepthInterpCPU(triSetupData, rasterizedPixels, emulatedCPUDepthInterpData);

				std::vector<attributeInterpOutputData> emulatedCPUAttributeInterpData;
				EmulateAttributeInterpCPU(triSetupData, emulatedCPUDepthInterpData, !randomAttributes, emulatedCPUAttributeInterpData);

				std::vector<texSampOutput> emulatedCPUTexSampleData;
				EmulateTexSamplerCPU(emulatedCPUAttributeInterpData, emulatedCPUTexSampleData, useBilinearInterp, texDesc, d3dlr);

				successResult &= runROPTest(emulatedCPUTexSampleData, outputWriteMask, alphaTestEnabled, alphaTestRefVal, alphaTestFunc,
					blendingEnabled,
					srcColorBlend, destColorBlend, colorBlendOp,
					srcAlphaBlend, destAlphaBlend, alphaBlendOp, blendFactor);
			}
		}
		setTexture->UnlockRect(0);

		return numPrimsPassedTriCull > 0;
	};

	// Do a simple point-sampled triangle first:
	{
		const unsigned writeTransactionsBefore = memoryWriteTransactionsCount;
		const unsigned readTransactionsBefore = memoryReadTransactionsCount;
		const unsigned short fullTriangle0IB[] = { 0, 1, 2 };
		const bool useBilinearInterp = false;
		const bool useRandomAttributes = false;
		testSimpleDrawCall(fullTriangle0, fullTriangle0IB, ARRAYSIZE(fullTriangle0IB) / 3, useBilinearInterp, gradientTexture128x128,
			D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_ALPHA, false, 0x00, D3DCMP_ALWAYS, useRandomAttributes);
		const unsigned readTransactionsAfter = memoryReadTransactionsCount;
		const unsigned writeTransactionsAfter = memoryWriteTransactionsCount;

		// Error, unexpected DRAM read!
		if (readTransactionsAfter != readTransactionsBefore)
		{
			__debugbreak();
		}

		// Error, unexpected to have no write transactions!
		if (writeTransactionsAfter <= writeTransactionsBefore)
		{
			__debugbreak();
		}
	}

	// Test case with three triangles that share a single vertex:
	{
		const unsigned writeTransactionsBefore = memoryWriteTransactionsCount;
		const unsigned readTransactionsBefore = memoryReadTransactionsCount;
		static const unsigned short sharedVertex3TrianglesIndices[] =
		{
			0, 1, 2,
			0, 2, 3,
			0, 3, 4
		};
		const bool useBilinearInterp = true;
		const bool useRandomAttributes = false;
		testSimpleDrawCall(threeTrisSharedVertex, sharedVertex3TrianglesIndices, ARRAYSIZE(sharedVertex3TrianglesIndices) / 3, useBilinearInterp, gradientTexture128x128,
			D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_ALPHA, false, 0x00, D3DCMP_ALWAYS, useRandomAttributes);
		const unsigned readTransactionsAfter = memoryReadTransactionsCount;
		const unsigned writeTransactionsAfter = memoryWriteTransactionsCount;

		// Error, unexpected DRAM read!
		if (readTransactionsAfter != readTransactionsBefore)
		{
			__debugbreak();
		}

		// Error, unexpected to have no write transactions!
		if (writeTransactionsAfter <= writeTransactionsBefore)
		{
			__debugbreak();
		}
	}

	// Test a blend mode combination that we know isn't supposed to do any framebuffer reads (D3DRS_DESTBLEND set to D3DBLEND_ZERO):
	{
		const unsigned writeTransactionsBefore = memoryWriteTransactionsCount;
		const unsigned readTransactionsBefore = memoryReadTransactionsCount;
		static const unsigned short sharedVertex3TrianglesIndices[] =
		{
			0, 1, 2,
			0, 2, 3,
			0, 3, 4
		};
		const bool useBilinearInterp = true;
		const bool useRandomAttributes = false;
		testSimpleDrawCall(threeTrisSharedVertex, sharedVertex3TrianglesIndices, ARRAYSIZE(sharedVertex3TrianglesIndices) / 3, useBilinearInterp, gradientTexture128x128,
			D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_ALPHA, false, 0x00, D3DCMP_ALWAYS, useRandomAttributes,
			true, D3DBLEND_ONE, D3DBLEND_ZERO, D3DBLENDOP_ADD,
			D3DBLEND_ONE, D3DBLEND_ZERO, D3DBLENDOP_ADD, D3DCOLOR_ARGB(255, 255, 255, 255) );
		const unsigned readTransactionsAfter = memoryReadTransactionsCount;
		const unsigned writeTransactionsAfter = memoryWriteTransactionsCount;

		// Error, unexpected DRAM read!
		if (readTransactionsAfter != readTransactionsBefore)
		{
			__debugbreak();
		}

		// Error, unexpected to have no write transactions!
		if (writeTransactionsAfter <= writeTransactionsBefore)
		{
			__debugbreak();
		}
	}

	// Test a blend mode combination that we know isn't supposed to do any framebuffer reads (zero blendfactor alpha):
	{
		const unsigned writeTransactionsBefore = memoryWriteTransactionsCount;
		const unsigned readTransactionsBefore = memoryReadTransactionsCount;
		static const unsigned short sharedVertex3TrianglesIndices[] =
		{
			0, 1, 2,
			0, 2, 3,
			0, 3, 4
		};
		const bool useBilinearInterp = true;
		const bool useRandomAttributes = false;
		testSimpleDrawCall(threeTrisSharedVertex, sharedVertex3TrianglesIndices, ARRAYSIZE(sharedVertex3TrianglesIndices) / 3, useBilinearInterp, gradientTexture128x128,
			D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_ALPHA, false, 0x00, D3DCMP_ALWAYS, useRandomAttributes,
			true, D3DBLEND_ONE, D3DBLEND_ZERO, D3DBLENDOP_ADD,
			D3DBLEND_INVBLENDFACTOR, D3DBLEND_BLENDFACTOR, D3DBLENDOP_ADD, D3DCOLOR_ARGB(0, 255, 255, 255) );
		const unsigned readTransactionsAfter = memoryReadTransactionsCount;
		const unsigned writeTransactionsAfter = memoryWriteTransactionsCount;

		// Error, unexpected DRAM read!
		if (readTransactionsAfter != readTransactionsBefore)
		{
			__debugbreak();
		}

		// Error, unexpected to have no write transactions!
		if (writeTransactionsAfter <= writeTransactionsBefore)
		{
			__debugbreak();
		}
	}

	// Test a blend mode combination that we know isn't supposed to do any framebuffer reads (zero blendfactor color):
	{
		const unsigned writeTransactionsBefore = memoryWriteTransactionsCount;
		const unsigned readTransactionsBefore = memoryReadTransactionsCount;
		static const unsigned short sharedVertex3TrianglesIndices[] =
		{
			0, 1, 2,
			0, 2, 3,
			0, 3, 4
		};
		const bool useBilinearInterp = true;
		const bool useRandomAttributes = false;
		testSimpleDrawCall(threeTrisSharedVertex, sharedVertex3TrianglesIndices, ARRAYSIZE(sharedVertex3TrianglesIndices) / 3, useBilinearInterp, gradientTexture128x128,
			D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_ALPHA, false, 0x00, D3DCMP_ALWAYS, useRandomAttributes,
			true, D3DBLEND_INVBLENDFACTOR, D3DBLEND_BLENDFACTOR, D3DBLENDOP_ADD,
			D3DBLEND_ONE, D3DBLEND_ZERO, D3DBLENDOP_ADD, D3DCOLOR_ARGB(192, 0, 0, 0) );
		const unsigned readTransactionsAfter = memoryReadTransactionsCount;
		const unsigned writeTransactionsAfter = memoryWriteTransactionsCount;

		// Error, unexpected DRAM read!
		if (readTransactionsAfter != readTransactionsBefore)
		{
			__debugbreak();
		}

		// Error, unexpected to have no write transactions!
		if (writeTransactionsAfter <= writeTransactionsBefore)
		{
			__debugbreak();
		}
	}

	// Let's do a very specific walking through the most common blend modes with random triangles:
	// (Warning: Slow to simulate this many pixels being blended!)
	{
		const unsigned short fullTriangleIB[] = { 0, 1, 2 };
		const D3DCOLOR blendFactor = D3DCOLOR_ARGB(192, 127, 96, 31);
		for (unsigned destBlend = 1; destBlend < 16; ++destBlend)
		{
			for (unsigned srcBlend = 1; srcBlend < 16; ++srcBlend)
			{
				for (unsigned blendOpIndex = 1; blendOpIndex < 6;)
				{
					testVert verts[3];
					verts[0].posX = ( (rand() % 640) ) + 0.5f; // Random xPos between 0 and +640
					verts[0].posY = ( (rand() % 480) ) + 0.5f; // Random yPos between 0 and +480

					verts[1].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
					verts[1].posY = verts[0].posY + ( (rand() % 100) - 50); // Random xOffset between -50 and +50

					verts[2].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
					verts[2].posY = verts[0].posY + ( (rand() % 100) - 50); // Random xOffset between -50 and +50

					const bool useBilinearInterp = true;
					const bool useRandomAttributes = false;
					const bool useBlending = true;
					const D3DBLEND srcBlendMode = (const D3DBLEND)srcBlend;
					const D3DBLEND destBlendMode = (const D3DBLEND)destBlend;
					const D3DBLENDOP blendOp = (const D3DBLENDOP)blendOpIndex;
					if (testSimpleDrawCall(verts, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3, useBilinearInterp, rainbowTexture128x128, 
						D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_ALPHA, false, 0x00, D3DCMP_ALWAYS, useRandomAttributes,
						useBlending, srcBlendMode, destBlendMode, blendOp,
						srcBlendMode, destBlendMode, blendOp, blendFactor) )
					{
						++blendOpIndex; // Keep rerolling our triangle vertex positions until we get one that doesn't get culled
					}
				}
			}
		}
	}

	// Let's try doing 4096 random small triangles (about half will get backface culled, and some others may get degenerate triangle culled or clipped off the screen) with a mix of all-random blend modes and write masks:
	// (Warning: Slow to simulate this many pixels being blended!)
	{
		srand(3); // Set a deterministic seed so we get the same results every time
		const unsigned short fullTriangleIB[] = { 0, 1, 2 };
		for (unsigned x = 0; x < 4096; ++x)
		{
			testVert verts[3];
			verts[0].posX = ( (rand() % 800) - 80) + 0.5f; // Random xPos between -80 and +720
			verts[0].posY = ( (rand() % 600) - 60) + 0.5f; // Random yPos between -60 and +540

			verts[1].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
			verts[1].posY = verts[0].posY + ( (rand() % 100) - 50); // Random xOffset between -50 and +50

			verts[2].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
			verts[2].posY = verts[0].posY + ( (rand() % 100) - 50); // Random xOffset between -50 and +50

			const bool useBilinearInterp = true;
			const bool useRandomAttributes = true;
			testSimpleDrawCall(verts, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3, useBilinearInterp, rainbowTexture128x128, 
				D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_ALPHA, false, 0x00, D3DCMP_ALWAYS, useRandomAttributes);
		}
	}

	return successResult ? S_OK : E_FAIL;
}
