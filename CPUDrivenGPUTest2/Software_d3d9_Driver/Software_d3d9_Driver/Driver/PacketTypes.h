#pragma once

#pragma pack(push) // Start pragma pack 1 region
#pragma pack(1)

// One full DRAM line. DRAM is accessed in 256-bit lines.
struct DRAM_LINE
{
	union
	{
		BYTE bytes[32];
		USHORT shorts[16];
		DWORD dwords[8];
		float floats[8];
		unsigned __int64 qwords[4];
		double doubles[4];
	};
};
static_assert(sizeof(DRAM_LINE) * 8 == 256, "Error: Unexpected struct size!");

enum eTexFormat : unsigned char
{
	eTexFmtA8R8G8B8 = 0,
	eTexFmtX8R8G8B8 = 1,
	eTexFmtA4R4G4B4 = 2,
	eTexFmtR5G6B5 = 3,
	eTexFmtA1R5G5B5 = 4,
	eTexFmtX1R5G5B5 = 5,

	eTexFmtNumFormats // This must always be last!
};

inline const unsigned GetSizePerPixel(const eTexFormat fmt)
{
	switch (fmt)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Unknown format!
#endif
	case eTexFmtA8R8G8B8:
	case eTexFmtX8R8G8B8:
		return sizeof(DWORD);
	case eTexFmtA4R4G4B4:
	case eTexFmtR5G6B5:
	case eTexFmtA1R5G5B5:
	case eTexFmtX1R5G5B5:
		return sizeof(USHORT);
	}
}

enum eLoadVertexStreamType : unsigned char
{
	vst_xPos = 0,
	vst_yPos = 1,
	vst_invZPos = 2,
	vst_tx = 3,
	vst_ty = 4,
	vst_vertColor = 5,
	vst_index = 6,

	vst_eLoadVertStreamNumTypes // This must always be last!
};

inline const unsigned GetSizePerVertexData(const eLoadVertexStreamType type)
{
	switch (type)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Unknown type!
#endif
	case vst_xPos:
	case vst_yPos:
	case vst_tx:
	case vst_ty:
	case vst_index:
		return sizeof(SHORT);
	case vst_invZPos:
	case vst_vertColor:
		return sizeof(DWORD);
	}
}

enum eCullMode : unsigned char
{
	cullCCW = 0,
	cullCW = 1,
	cullNone = 2,
	cullBoth = 3,

	eCullMode_NUM_CULL_MODES // This must always be last
};

enum ePrimTopology : unsigned char
{
	primTop_PointList = 0, // Not yet implemented
	primTop_LineList = 1, // Not yet implemented
	primTop_LineStrip = 2, // Not yet implemented
	primTop_TriangleList = 3,
	primTop_TriangleStrip = 4, // Not yet implemented
	primTop_TriangleFan = 5, // Not yet implemented
	primTop_ScreenAlignedQuad = 6, // Not yet implemented

	primTop_NUM_PRIM_TOPOLOGIES // This must always be last
};

enum eStripCutType : unsigned char
{
	sct_CutDisabled = 0,
	sct_Cut0xFFFF = 1, // Not yet implemented
	sct_Cut0xFFFFFFFF = 2, // Not yet implemented

	sct_NUM_STRIP_CUT_TYPES // This must always be last
};

enum eIndexFormat : unsigned char
{
	ibfmt_noIndices = 0,
	ibfmt_index8 = 1, // Not yet implemented
	ibfmt_index16 = 2,
	ibfmt_index32 = 3, // Not yet implemented

	ibfmt_NUM_INDEX_FORMATS // This must always be last
};

enum eTexFilterMode : unsigned char
{
	TF_pointFilter = 0,
	TF_bilinearFilter = 1,
	TF_trilinearFilter = 2, // Not yet implemented!
	TF_anisotropicFilter = 3, // Not yet implemented!

	TF_MAXFILTER // This must always be last!
};

enum eTexChannelMUX : unsigned char
{
	tcm_r = 0,
	tcm_g = 1,
	tcm_b = 2,
	tcm_a = 3,
	tcm_0 = 4,
	tcm_1 = 5,

	tcm_MAX // This must always be last!
};

// The various sources for color-channel blend modes (note that these may select either color channels or alpha channels)
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

// The various sources for alpha-channel blend modes (note that these cannot ever select the color channels)
enum blendModeSourcesA : unsigned
{
	blendA_0, // 0
	blendA_srcAlpha, // 1
	blendA_destAlpha, // 2
	blendA_blendFactor // 3
};

// Note that this enum matches the D3DBLENDOP enum, except all the values are one lower
enum blendOp : unsigned
{
	bop_add, // 0
	bop_subtract, // 1
	bop_revsubtract, // 2
	bop_min, // 3
	bop_max // 4
};

enum eCmpFunc : unsigned char
{
	cmp_never = 0,
	cmp_less = 1,
	cmp_equal = 2,
	cmp_lessequal = 3,
	cmp_greater = 4,
	cmp_notequal = 5,
	cmp_greaterequal = 6,
	cmp_always = 7,

	cmp_MAX_CMP_FUNCS // This must always be last!
};

// These are meant to be OR'd together to form a complete render target write mask
enum eBlendMask : unsigned char
{
	wm_writeNone = 0x0,
	wm_writeR = 0x1,
	wm_writeG = 0x2,
	wm_writeB = 0x4,
	wm_writeA = 0x8,

	wm_writeAll = wm_writeR | wm_writeG | wm_writeB | wm_writeA
};

// This will eventually evolve into D3DTEXTURESTAGESTATETYPE as this whole "TexSample" block turns into our per-pixel register combiner block and eventually into our pixel shader block
enum combinerMode : unsigned char
{
	cbm_allBlack = 0,
	cbm_allWhite = 1,
	cbm_textureOnly = 2,
	cbm_vertexColorOnly = 3,
	cbm_debugTexcoords = 4,
	cbm_debugBilinearInterpolants = 5,
	cbm_textureModulateVertexColor = 6,

	cbm_MAX_NUM_COMBINER_MODES // This must always be last!
};

#pragma pack(pop) // End pragma pack 1 region
