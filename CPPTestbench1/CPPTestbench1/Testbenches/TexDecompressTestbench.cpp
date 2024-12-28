#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "../D3DTriRasterizeTestData.h"
#include "ShaderCoreALUCommon.h"
#include "PixelPipelineShared.h"
#include <vector>

#define COLOR4_ABGR(a,r,g,b) \
    ((D3DCOLOR)((((a)&0xff)<<24)|(((r)&0xff)<<16)|(((g)&0xff)<<8)|((b)&0xff)))

enum eTexFormat : unsigned char
{
	eTexFmtA8R8G8B8 = 0,
	eTexFmtX8R8G8B8 = 1,
	eTexFmtA4R4G4B4 = 2,
	eTexFmtR5G6B5 = 3,
	eTexFmtA1R5G5B5 = 4,
	eTexFmtX1R5G5B5 = 5,
	eTexFmtX4R4G4B4 = 6,
	eTexFmtA8 = 7,
	eTexFmtL8 = 8,
	eTexFmtDXT1 = 9,
	eTexFmtDXT3 = 10,
	eTexFmtDXT5 = 11,

	eTexFmtNumFormats // This must always be last!
};

struct formatTestBlockPair
{
	eTexFormat texFmt;
	D3DFORMAT texFmtD3D9;
	const char* textureFilename;
};

enum eCompressionType : unsigned char
{
	eCompTypUncompressed = 0,
	eCompTypDXT1 = 1,
	eCompTypDXT3 = 2,
	eCompTypDXT5 = 4
};

enum eUncompressedFormat : unsigned char
{
	eUncompFmtR5G6B5 = 1 << 0,
	eUncompFmtA1R5G5B5 = 1 << 1,
	eUncompFmtA4R4G4B4 = 1 << 2,
	eUncompFmtA8 = 1 << 3,
	eUncompFmtA8R8G8B8 = 1 << 4
};

struct DXT1ColorBlock
{
	uint16_t color0; // Colors are encoded using RGB565
	uint16_t color1;
	uint32_t colorIndices; // Each texel's color index is exactly 2 bits
};
static_assert(sizeof(DXT1ColorBlock) == 8, "Error: Unexpected packing!");

struct DXT3AlphaBlock
{
	uint64_t quantizedAlphas; // Each DXT3 texel's alpha value is quantized to 4 bits
};
static_assert(sizeof(DXT3AlphaBlock) == 8, "Error: Unexpected packing!");

struct DXT3Block
{
	DXT3AlphaBlock alphaBlock;
	DXT1ColorBlock colorBlock;
};
static_assert(sizeof(DXT3Block) == 16, "Error: Unexpected packing!");

struct DXT5AlphaBlock
{
	BYTE alpha0;
	BYTE alpha1;
	BYTE alphaIndices[6]; // Each DXT5 texel's alpha index is exactly 3 bits
};
static_assert(sizeof(DXT5AlphaBlock) == 8, "Error: Unexpected packing!");

struct DXT5Block
{
	DXT5AlphaBlock alphaBlock;
	DXT1ColorBlock colorBlock;
};
static_assert(sizeof(DXT5Block) == 16, "Error: Unexpected packing!");

static const bool GetDeviceFormatHasAlphaChannel(const eTexFormat texFmt)
{
	switch (texFmt)
	{
		default:
			__debugbreak(); // Case not handled!
		case eTexFmtA8R8G8B8:
		case eTexFmtA4R4G4B4:
		case eTexFmtA1R5G5B5:
		case eTexFmtA8:
		case eTexFmtDXT1:
		case eTexFmtDXT3:
		case eTexFmtDXT5:
			return true;
		case eTexFmtR5G6B5:
		case eTexFmtX8R8G8B8:
		case eTexFmtX1R5G5B5:
		case eTexFmtX4R4G4B4:
		case eTexFmtL8:
			return false;
	}
}

static const eTexFormat GetDeviceFormatFromD3DFormat(const D3DFORMAT texFmt)
{
	switch (texFmt)
	{
	default:
		__debugbreak(); // Other tex formats are not yet implemented!
	case D3DFMT_A8R8G8B8:
		return eTexFmtA8R8G8B8;
	case D3DFMT_X8R8G8B8:
		return eTexFmtX8R8G8B8;
	case D3DFMT_A4R4G4B4:
		return eTexFmtA4R4G4B4;
	case D3DFMT_R5G6B5:
		return eTexFmtR5G6B5;
	case D3DFMT_A1R5G5B5:
		return eTexFmtA1R5G5B5;
	case D3DFMT_X1R5G5B5:
		return eTexFmtX1R5G5B5;
	case D3DFMT_X4R4G4B4:
		return eTexFmtX4R4G4B4;
	case D3DFMT_A8:
		return eTexFmtA8;
	case D3DFMT_L8:
		return eTexFmtL8;
	case D3DFMT_DXT1:
		return eTexFmtDXT1;
	case D3DFMT_DXT3:
		return eTexFmtDXT3;
	case D3DFMT_DXT5:
		return eTexFmtDXT5;
	}
}

static const unsigned char GetBPPFromD3DFormat(const D3DFORMAT texFmt)
{
	switch (texFmt)
	{
	default:
		__debugbreak(); // Other tex formats are not yet implemented!
	case D3DFMT_A8R8G8B8:
		return 32;
	case D3DFMT_X8R8G8B8:
		return 32;
	case D3DFMT_A4R4G4B4:
		return 16;
	case D3DFMT_R5G6B5:
		return 16;
	case D3DFMT_A1R5G5B5:
		return 16;
	case D3DFMT_X1R5G5B5:
		return 16;
	case D3DFMT_X4R4G4B4:
		return 16;
	case D3DFMT_A8:
		return 8;
	case D3DFMT_L8:
		return 8;
	case D3DFMT_DXT1:
		return 4;
	case D3DFMT_DXT3:
		return 8;
	case D3DFMT_DXT5:
		return 8;
	}
}

static const unsigned char IsD3DFormatCompressed(const D3DFORMAT texFmt)
{
	switch (texFmt)
	{
	default:
		__debugbreak(); // Other tex formats are not yet implemented!
	case D3DFMT_A8R8G8B8:
	case D3DFMT_X8R8G8B8:
	case D3DFMT_A4R4G4B4:
	case D3DFMT_R5G6B5:
	case D3DFMT_A1R5G5B5:
	case D3DFMT_X1R5G5B5:
	case D3DFMT_X4R4G4B4:
	case D3DFMT_A8:
	case D3DFMT_L8:
		return false;
	case D3DFMT_DXT1:
	case D3DFMT_DXT3:
	case D3DFMT_DXT5:
		return true;
	}
}

static const float frand()
{
	return rand() / (const float)RAND_MAX;
}

unsigned char ColorBits4To8(const unsigned char bits4)
{
#ifdef _DEBUG
	if (bits4 >= 16)
	{
		__debugbreak();
	}
#endif
	return bits4 << 4 | bits4;
}

unsigned char ColorBits5To8(const unsigned char bits5)
{
	return (bits5 << 3) | (bits5 >> 2);
	static const unsigned char bits5to8[] =
	{
		0x00,
		0x08,
		0x10,
		0x19,
		0x21,
		0x29,
		0x31,
		0x3A,
		0x42,
		0x4A,
		0x52,
		0x5A,
		0x63,
		0x6B,
		0x73,
		0x7B,
		0x84,
		0x8C,
		0x94,
		0x9C,
		0xA5,
		0xAD,
		0xB5,
		0xBD,
		0xC5,
		0xCE,
		0xD6,
		0xDE,
		0xE6,
		0xEF,
		0xF7,
		0xFF
	};
#ifdef _DEBUG
	if (bits5 >= 32)
	{
		__debugbreak();
	}
#endif
	return bits5to8[bits5];
}

unsigned char ColorBits6To8(const unsigned char bits6)
{
	return (bits6 << 2) | (bits6 >> 4);
	static const unsigned char bits6to8[] =
	{
		0x00,
		0x04,
		0x08,
		0x0C,
		0x10,
		0x14,
		0x18,
		0x1C,
		0x20,
		0x24,
		0x28,
		0x2D,
		0x31,
		0x35,
		0x39,
		0x3D,
		0x41,
		0x45,
		0x49,
		0x4D,
		0x51,
		0x55,
		0x59,
		0x5D,
		0x61,
		0x65,
		0x69,
		0x6D,
		0x71,
		0x75,
		0x79,
		0x7D,
		0x82,
		0x86,
		0x8A,
		0x8E,
		0x92,
		0x96,
		0x9A,
		0x9E,
		0xA2,
		0xA6,
		0xAA,
		0xAE,
		0xB2,
		0xB6,
		0xBA,
		0xBE,
		0xC2,
		0xC6,
		0xCA,
		0xCE,
		0xD2,
		0xD7,
		0xDB,
		0xDF,
		0xE3,
		0xE7,
		0xEB,
		0xEF,
		0xF3,
		0xF7,
		0xFB,
		0xFF
	};
#ifdef _DEBUG
	if (bits6 >= 64)
	{
		__debugbreak();
	}
#endif
	return bits6to8[bits6];
}

template <const bool hasAlpha>
D3DCOLOR DecompressA4R4G4B4(const uint16_t texel)
{
	const unsigned char b = ColorBits4To8(texel & 0x000F);
	const unsigned char g = ColorBits4To8( (texel & 0x00F0) >> 4);
	const unsigned char r = ColorBits4To8( (texel & 0x0F00) >> 8);
	const unsigned char a = ColorBits4To8(hasAlpha ? ( (texel & 0xF000) >> 12) : 0xF);

	return COLOR4_ABGR(a, r, g, b);
}

template <const bool hasAlpha>
D3DCOLOR DecompressA1R5G5B5(const uint16_t texel)
{
	const unsigned char b = ColorBits5To8(texel & 0x001F);
	const unsigned char g = ColorBits5To8( (texel & 0x03E0) >> 5);
	const unsigned char r = ColorBits5To8( (texel & 0x7C00) >> 10);
	const unsigned char a = hasAlpha ? ( (texel & 0x8000) ? 0xFF : 0x00) : 0xFF;

	return COLOR4_ABGR(a, r, g, b);
}

D3DCOLOR DecompressR5G6B5(const uint16_t texel)
{
	const unsigned char b = ColorBits5To8(texel & 0x001F);
	const unsigned char g = ColorBits6To8( (texel & 0x07E0) >> 5);
	const unsigned char r = ColorBits5To8( (texel & 0xF800) >> 11);
	const unsigned char a = 0xFF;

	return COLOR4_ABGR(a, r, g, b);
}

void DecompressDXT1(const DXT1ColorBlock& compressedBlock, D3DCOLOR (&decompressedTexels)[4*4])
{
	const bool useLargeColorTable = compressedBlock.color0 > compressedBlock.color1;
	D3DCOLOR colorTable[4];
	colorTable[0] = DecompressR5G6B5(compressedBlock.color0);
	colorTable[1] = DecompressR5G6B5(compressedBlock.color1);

	unsigned short r0 = (colorTable[0] >> 16) & 0xFF;
	unsigned short g0 = (colorTable[0] >> 8) & 0xFF;
	unsigned short b0 = colorTable[0] & 0xFF;

	unsigned short r1 = (colorTable[1] >> 16) & 0xFF;
	unsigned short g1 = (colorTable[1] >> 8) & 0xFF;
	unsigned short b1 = colorTable[1] & 0xFF;

	if (useLargeColorTable)
	{
		// c2 = (2/3)c0 + (1/3)c1
		colorTable[2] = COLOR4_ABGR(0xFF, (r0 * 2 + r1) / 3, (g0 * 2 + g1) / 3, (b0 * 2 + b1) / 3);

		// c3 = (1/3)c0 + (2/3)c1
		colorTable[3] = COLOR4_ABGR(0xFF, (r0 + r1 * 2) / 3, (g0 + g1 * 2) / 3, (b0 + b1 * 2) / 3);
	}
	else
	{
		// c2 = (1/2)c0 + (1/2)c1
		colorTable[2] = COLOR4_ABGR(0xFF, (r0 + r1) / 2, (g0 + g1) / 2, (b0 + b1) / 2);

		// c3 = 0x00000000
		colorTable[3] = 0x00000000;
	}

	for (unsigned x = 0; x < 4*4; ++x)
	{
		const unsigned char colorIndex = (compressedBlock.colorIndices >> (x * 2) ) & 0x3;
		decompressedTexels[x] = colorTable[colorIndex];
	}
}

void DecompressDXT3(const DXT3Block& compressedBlock, D3DCOLOR (&decompressedTexels)[4*4])
{
	DecompressDXT1(compressedBlock.colorBlock, decompressedTexels);

	for (unsigned x = 0; x < 4*4; ++x)
	{
		D3DCOLOR& thisTexel = decompressedTexels[x];
		const unsigned char quantizedAlpha4 = (compressedBlock.alphaBlock.quantizedAlphas >> (x * 4) ) & 0xF;
		const unsigned char expandedAlpha4 = ColorBits4To8(quantizedAlpha4); // Expand from 4-bit alpha to 8-bit alpha
		thisTexel = (thisTexel & 0x00FFFFFF) | (expandedAlpha4 << 24);
	}
}

void DecompressDXT5(const DXT5Block& compressedBlock, D3DCOLOR (&decompressedTexels)[4*4])
{
	DecompressDXT1(compressedBlock.colorBlock, decompressedTexels);

	unsigned char alphaTable[8];
	alphaTable[0] = compressedBlock.alphaBlock.alpha0;
	alphaTable[1] = compressedBlock.alphaBlock.alpha1;

	const unsigned short a0 = compressedBlock.alphaBlock.alpha0;
	const unsigned short a1 = compressedBlock.alphaBlock.alpha1;
	const unsigned __int64* const alphaIndicesPtr = reinterpret_cast<const unsigned __int64* const>(&compressedBlock.alphaBlock.alphaIndices);

	const bool usesLargeAlphasTable = a0 > a1;

	if (usesLargeAlphasTable)
	{
		alphaTable[2] = (6 * a0 + 1 * a1) / 7;
		alphaTable[3] = (5 * a0 + 2 * a1) / 7;
		alphaTable[4] = (4 * a0 + 3 * a1) / 7;
		alphaTable[5] = (3 * a0 + 4 * a1) / 7;
		alphaTable[6] = (2 * a0 + 5 * a1) / 7;
		alphaTable[7] = (1 * a0 + 6 * a1) / 7;
	}
	else
	{
		alphaTable[2] = (4 * a0 + 1 * a1) / 5;
		alphaTable[3] = (3 * a0 + 2 * a1) / 5;
		alphaTable[4] = (2 * a0 + 3 * a1) / 5;
		alphaTable[5] = (1 * a0 + 4 * a1) / 5;
		alphaTable[6] = 0x00;
		alphaTable[7] = 0xFF;
	}

	for (unsigned x = 0; x < 4*4; ++x)
	{
		D3DCOLOR& thisTexel = decompressedTexels[x];
		const unsigned char quantizedAlphaIndex3 = (*alphaIndicesPtr >> (x * 3) ) & 0x7;
		const unsigned char tableAlpha = alphaTable[quantizedAlphaIndex3];
		thisTexel = (thisTexel & 0x00FFFFFF) | (tableAlpha << 24);
	}
}

void SoftwareDecompressBlock(const BYTE* const rawBlockData, D3DCOLOR (&decompressedTexels)[4*4], const eTexFormat format)
{
	switch (format)
	{
		case eTexFmtA8R8G8B8:
		case eTexFmtX8R8G8B8:
			memcpy(&decompressedTexels, rawBlockData, 4*4*sizeof(D3DCOLOR) );
			break;
		case eTexFmtA4R4G4B4:
		{
			const uint16_t* const typedBlockData = reinterpret_cast<const uint16_t* const>(rawBlockData);
			for (unsigned x = 0; x < 4*4; ++x)
			{
				decompressedTexels[x] = DecompressA4R4G4B4<true>(typedBlockData[x]);
			}
		}
			break;
		case eTexFmtR5G6B5:
		{
			const uint16_t* const typedBlockData = reinterpret_cast<const uint16_t* const>(rawBlockData);
			for (unsigned x = 0; x < 4*4; ++x)
			{
				decompressedTexels[x] = DecompressR5G6B5(typedBlockData[x]);
			}
		}
			break;
		case eTexFmtA1R5G5B5:
		{
			const uint16_t* const typedBlockData = reinterpret_cast<const uint16_t* const>(rawBlockData);
			for (unsigned x = 0; x < 4*4; ++x)
			{
				decompressedTexels[x] = DecompressA1R5G5B5<true>(typedBlockData[x]);
			}
		}
			break;
		case eTexFmtX1R5G5B5:
		{
			const uint16_t* const typedBlockData = reinterpret_cast<const uint16_t* const>(rawBlockData);
			for (unsigned x = 0; x < 4*4; ++x)
			{
				decompressedTexels[x] = DecompressA1R5G5B5<false>(typedBlockData[x]);
			}
		}
			break;
		case eTexFmtX4R4G4B4:
		{
			const uint16_t* const typedBlockData = reinterpret_cast<const uint16_t* const>(rawBlockData);
			for (unsigned x = 0; x < 4*4; ++x)
			{
				decompressedTexels[x] = DecompressA4R4G4B4<false>(typedBlockData[x]);
			}
		}
			break;
		case eTexFmtA8:
		{
			for (unsigned x = 0; x < 4*4; ++x)
			{
				const BYTE alphaVal = rawBlockData[x];
				decompressedTexels[x] = COLOR4_ABGR(alphaVal, 0, 0, 0);
			}
		}
			break;
		case eTexFmtL8:
		{
			for (unsigned x = 0; x < 4*4; ++x)
			{
				const BYTE lumaVal = rawBlockData[x];
				decompressedTexels[x] = COLOR4_ABGR(0xFF, lumaVal, lumaVal, lumaVal);
			}
		}
			break;
		case eTexFmtDXT1:
		{
			const DXT1ColorBlock& dxt1Block = *(reinterpret_cast<const DXT1ColorBlock* const>(rawBlockData) );
			DecompressDXT1(dxt1Block, decompressedTexels);
		}
			break;
		case eTexFmtDXT3:
		{
			const DXT3Block& dxt3Block = *(reinterpret_cast<const DXT3Block* const>(rawBlockData) );
			DecompressDXT3(dxt3Block, decompressedTexels);
		}
			break;
		case eTexFmtDXT5:
		{
			const DXT5Block& dxt5Block = *(reinterpret_cast<const DXT5Block* const>(rawBlockData) );
			DecompressDXT5(dxt5Block, decompressedTexels);
		}
			break;
		default:
			__debugbreak(); // Unimplemented texture format!
			break;
	}
}

// Returns true if the comparison is equal, or false if not equal (uses slightly fuzzy comparison to allow for off-by-one texel color values):
const bool CompareDecompressedLinearizedTexels(const D3DCOLOR (&texelsA)[4*4], const D3DCOLOR (&texelsB)[4*4])
{
	//return memcmp(texelsA, texelsB, sizeof(texelsA) ) == 0;
	for (unsigned x = 0; x < 4*4; ++x)
	{
		const D3DCOLOR texelA = texelsA[x];
		const D3DCOLOR texelB = texelsB[x];

		const unsigned char ab = texelA & 0xFF;
		const unsigned char ag = (texelA >> 8) & 0xFF;
		const unsigned char ar = (texelA >> 16) & 0xFF;
		const unsigned char aa = (texelA >> 24) & 0xFF;

		const unsigned char bb = texelB & 0xFF;
		const unsigned char bg = (texelB >> 8) & 0xFF;
		const unsigned char br = (texelB >> 16) & 0xFF;
		const unsigned char ba = (texelB >> 24) & 0xFF;

		const short deltab = (const short)ab - (const short)bb;
		const short deltag = (const short)ag - (const short)bg;
		const short deltar = (const short)ar - (const short)br;
		const short deltaa = (const short)aa - (const short)ba;

		if (abs(deltab) > 1)
		{
			return false;
		}
		if (abs(deltag) > 1)
		{
			return false;
		}
		if (abs(deltar) > 1)
		{
			return false;
		}
		if (abs(deltaa) > 1)
		{
			return false;
		}
	}
	return true;
}

void GPUConvertTexture(LPDIRECT3DDEVICE9 dev, LPDIRECT3DTEXTURE9 sourceTex, LPDIRECT3DTEXTURE9& convertedDestTex)
{
	dev->CreateTexture(4, 4, 1, 0, D3DFMT_A8R8G8B8, D3DPOOL_SYSTEMMEM, &convertedDestTex, NULL);

	LPDIRECT3DTEXTURE9 renderTargetTempTexture = NULL;
	dev->CreateTexture(4, 4, 1, D3DUSAGE_RENDERTARGET, D3DFMT_A8R8G8B8, D3DPOOL_DEFAULT, &renderTargetTempTexture, NULL);

	// Use hardware texture filtering to have the GPU convert between our texture format and A8R8G8B8:
	{
		dev->SetTexture(0, sourceTex);
		dev->SetRenderState(D3DRS_ZENABLE, FALSE);
		dev->SetRenderState(D3DRS_LIGHTING, FALSE);

		dev->SetFVF(D3DFVF_XYZRHW | D3DFVF_DIFFUSE | D3DFVF_TEX1);

		LPDIRECT3DSURFACE9 originalRenderTarget = NULL;
		if (FAILED(dev->GetBackBuffer(0, 0, D3DBACKBUFFER_TYPE::D3DBACKBUFFER_TYPE_MONO, &originalRenderTarget) ) )
		{
			__debugbreak();
		}

		vert2D verts[4];
		for (unsigned x = 0; x < 4; ++x)
		{
			vert2D& thisVert = verts[x];
			thisVert.texcoord.x = (const float)(x & 0x1);
			thisVert.texcoord.y = (const float)( (x >> 1) & 0x1);
			thisVert.diffuse = D3DCOLOR_ARGB(255, 255, 255, 255);
			thisVert.xyzRhw.x = thisVert.texcoord.x * 4.0f;
			thisVert.xyzRhw.y = thisVert.texcoord.y * 4.0f;
			thisVert.xyzRhw.z = 1.0f;
			thisVert.xyzRhw.w = 1.0f;
		}

		LPDIRECT3DSURFACE9 destSurface = NULL;
		renderTargetTempTexture->GetSurfaceLevel(0, &destSurface);

		if (FAILED(dev->BeginScene() ) )
		{
			__debugbreak();
		}

		if (FAILED(dev->SetRenderTarget(0, destSurface) ) )
		{
			__debugbreak();
		}

		if (FAILED(dev->DrawPrimitiveUP(D3DPT_TRIANGLESTRIP, 2, verts, sizeof(vert2D) ) ) )
		{
			__debugbreak();
		}

		if (FAILED(dev->SetRenderTarget(0, originalRenderTarget) ) )
		{
			__debugbreak();
		}

		if (FAILED(dev->EndScene() ) )
		{
			__debugbreak();
		}

		/*LPDIRECT3DSURFACE9 srcSurface = NULL;
		sourceTex->GetSurfaceLevel(0, &srcSurface);

		if (FAILED(dev->StretchRect(srcSurface, NULL, destSurface, NULL, D3DTEXF_NONE) ) )
		{
			__debugbreak();
		}

		srcSurface->Release();*/
		destSurface->Release();
	}

	{
		LPDIRECT3DSURFACE9 srcSurface = NULL;
		renderTargetTempTexture->GetSurfaceLevel(0, &srcSurface);

		LPDIRECT3DSURFACE9 destSurface = NULL;
		convertedDestTex->GetSurfaceLevel(0, &destSurface);

		if (FAILED(dev->GetRenderTargetData(srcSurface, destSurface) ) )
		{
			__debugbreak();
		}

		srcSurface->Release();
		destSurface->Release();
	}

	renderTargetTempTexture->Release();
}

const int RunTestsTexDecompress(Xsi::Loader& loader, RenderWindow* renderWindow)
{
	// Start everything off at the beginning:
	loader.restart();

	bool successResult = true;

	std_logic_port clk(PD_IN, loader, "clk");

// Texture Sampler interface begin
	std_logic_port TEXSAMP_NewBlockIsValid(PD_IN, loader, "TEXSAMP_NewBlockIsValid");
	std_logic_port TEXSAMP_CompressionResultsValid(PD_OUT, loader, "TEXSAMP_CompressionResultsValid");

	std_logic_port TEXSAMP_IsCompressed(PD_IN, loader, "TEXSAMP_IsCompressed");
	std_logic_vector_port<3> TEXSAMP_CompressionType(PD_IN, loader, "TEXSAMP_CompressionType");

	std_logic_port TEXSAMP_UncompressedOpaqueAlpha(PD_IN, loader, "TEXSAMP_UncompressedOpaqueAlpha");
	std_logic_vector_port<5> TEXSAMP_UncompressedFormat(PD_IN, loader, "TEXSAMP_UncompressedFormat");

	std_logic_vector_port<16*32> TEXSAMP_InCompressedPixelBits(PD_IN, loader, "TEXSAMP_InCompressedPixelBits");
	std_logic_vector_port<16*32> TEXSAMP_OutDecompressedPixels4x4(PD_OUT, loader, "TEXSAMP_OutDecompressedPixels4x4");
// Texture Sampler interface end

// Debug signals
	std_logic_vector_port<8> DBG_InU(PD_IN, loader, "DBG_InU");
	std_logic_vector_port<8> DBG_OutU(PD_OUT, loader, "DBG_OutU");
	std_logic_vector_port<24> DBG_ColorTable0(PD_OUT, loader, "DBG_ColorTable0");
	std_logic_vector_port<24> DBG_ColorTable1(PD_OUT, loader, "DBG_ColorTable1");
	std_logic_vector_port<24> DBG_ColorTable2(PD_OUT, loader, "DBG_ColorTable2");
	std_logic_vector_port<24> DBG_ColorTable3(PD_OUT, loader, "DBG_ColorTable3");
	std_logic_vector_port<16> DBG_Color0(PD_OUT, loader, "DBG_Color0");
	std_logic_vector_port<16> DBG_Color1(PD_OUT, loader, "DBG_Color1");
	std_logic_vector_port<8> DBG_Alpha0(PD_OUT, loader, "DBG_Alpha0");
	std_logic_vector_port<8> DBG_Alpha1(PD_OUT, loader, "DBG_Alpha1");
	std_logic_vector_port<8> DBG_AlphaTable0(PD_OUT, loader, "DBG_AlphaTable0");
	std_logic_vector_port<8> DBG_AlphaTable1(PD_OUT, loader, "DBG_AlphaTable1");
	std_logic_vector_port<8> DBG_AlphaTable2(PD_OUT, loader, "DBG_AlphaTable2");
	std_logic_vector_port<8> DBG_AlphaTable3(PD_OUT, loader, "DBG_AlphaTable3");
	std_logic_vector_port<8> DBG_AlphaTable4(PD_OUT, loader, "DBG_AlphaTable4");
	std_logic_vector_port<8> DBG_AlphaTable5(PD_OUT, loader, "DBG_AlphaTable5");
	std_logic_vector_port<8> DBG_AlphaTable6(PD_OUT, loader, "DBG_AlphaTable6");
	std_logic_vector_port<8> DBG_AlphaTable7(PD_OUT, loader, "DBG_AlphaTable7");

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		TEXSAMP_NewBlockIsValid = false;
		TEXSAMP_IsCompressed = false;
		TEXSAMP_CompressionType = eCompTypUncompressed;
		TEXSAMP_UncompressedOpaqueAlpha = false;
		TEXSAMP_UncompressedFormat = eUncompFmtA8R8G8B8;
		TEXSAMP_InCompressedPixelBits.SetToZero();
		DBG_InU = (const unsigned char)0u;
	}

	const formatTestBlockPair testSingleBlockTextures[] =
	{
		{eTexFmtX8R8G8B8, D3DFMT_X8R8G8B8, "TestColors4x4_X8R8G8B8.dds"},
		{eTexFmtA1R5G5B5, D3DFMT_A1R5G5B5, "TestColors4x4_A1R5G5B5.dds"},
		{eTexFmtX1R5G5B5, D3DFMT_X1R5G5B5, "TestColors3_4x4_X1R5G5B5.dds"},
		{eTexFmtA4R4G4B4, D3DFMT_A4R4G4B4, "TestColors4x4_A4R4G4B4.dds"},
		{eTexFmtX4R4G4B4, D3DFMT_X4R4G4B4, "TestColors4x4_X4R4G4B4.dds"},
		{eTexFmtR5G6B5, D3DFMT_R5G6B5, "TestColors4x4_R5G6B5.dds"},
		{eTexFmtL8, D3DFMT_L8, "TestColors4x4_L8.dds"},
		{eTexFmtDXT1, D3DFMT_DXT1, "TestColors4x4_DXT1.dds"},
		{eTexFmtDXT3, D3DFMT_DXT3, "TestColors4x4_DXT3.dds"},
		{eTexFmtDXT5, D3DFMT_DXT5, "TestColors4x4_DXT5.dds"},
		{eTexFmtDXT1, D3DFMT_DXT1, "TestColors3_4x4_DXT1.dds"},
		{eTexFmtDXT3, D3DFMT_DXT3, "TestColors1_4x4_DXT3.dds"},
		{eTexFmtDXT5, D3DFMT_DXT5, "TestColors2_4x4_DXT5.dds"},
		{eTexFmtA1R5G5B5, D3DFMT_A1R5G5B5, "TestAlphas_4x4_A1R5G5B5.dds"},
		{eTexFmtA4R4G4B4, D3DFMT_A4R4G4B4, "TestAlphas2_4x4_A4R4G4B4.dds"},
		{eTexFmtA8R8G8B8, D3DFMT_A8R8G8B8, "TestAlphas3_4x4_A8R8G8B8.dds"},
		{eTexFmtA8, D3DFMT_A8, "TestAlphas4_4x4_A8.dds"},
		{eTexFmtDXT1, D3DFMT_DXT1, "TestAlphas_4x4_DXT1.dds"},
		{eTexFmtDXT3, D3DFMT_DXT3, "TestAlphas2_4x4_DXT3.dds"},
		{eTexFmtDXT5, D3DFMT_DXT5, "TestAlphas3_4x4_DXT5.dds"},
		{eTexFmtDXT5, D3DFMT_DXT5, "TestAlphas4_4x4_DXT5.dds"},
		{eTexFmtDXT5, D3DFMT_DXT5, "TestAlphas5_4x4_DXT5.dds"}
	};

	const auto verifyHDLSingleBlockDecompress = [&](const formatTestBlockPair& testBlock, const BYTE (&compressedLinearizedTexels)[64], const D3DCOLOR (&decompressedGroundTruthBlock)[4*4]) -> bool
	{
		TEXSAMP_InCompressedPixelBits.SetToByteMemory(compressedLinearizedTexels);
		TEXSAMP_UncompressedOpaqueAlpha = !GetDeviceFormatHasAlphaChannel(testBlock.texFmt);
		TEXSAMP_IsCompressed = IsD3DFormatCompressed(testBlock.texFmtD3D9);
		switch (testBlock.texFmtD3D9)
		{
		case D3DFMT_DXT1:
			TEXSAMP_CompressionType = eCompTypDXT1;
			TEXSAMP_UncompressedFormat = eUncompFmtA8R8G8B8;
			break;
		case D3DFMT_DXT3:
			TEXSAMP_CompressionType = eCompTypDXT3;
			TEXSAMP_UncompressedFormat = eUncompFmtA8R8G8B8;
			break;
		case D3DFMT_DXT5:
			TEXSAMP_CompressionType = eCompTypDXT5;
			TEXSAMP_UncompressedFormat = eUncompFmtA8R8G8B8;
			break;
		default:
			TEXSAMP_CompressionType = eCompTypUncompressed;
			switch (testBlock.texFmtD3D9)
			{
			case D3DFMT_R5G6B5:
				TEXSAMP_UncompressedFormat = eUncompFmtR5G6B5;
				break;
			case D3DFMT_A1R5G5B5:
			case D3DFMT_X1R5G5B5:
				TEXSAMP_UncompressedFormat = eUncompFmtA1R5G5B5;
				break;
			case D3DFMT_A4R4G4B4:
			case D3DFMT_X4R4G4B4:
				TEXSAMP_UncompressedFormat = eUncompFmtA4R4G4B4;
				break;
			case D3DFMT_A8:
			case D3DFMT_L8:
				TEXSAMP_UncompressedFormat = eUncompFmtA8;
				break;
			case D3DFMT_A8R8G8B8:
			case D3DFMT_X8R8G8B8:
				TEXSAMP_UncompressedFormat = eUncompFmtA8R8G8B8;
				break;
			}
			break;
		}

		D3DCOLOR HDLDecompressionOutput[4*4] = {0};
		/*D3DCOLOR ColorTable[4] = {0};
		unsigned short ColorPalette[2] = {0};
		unsigned char AlphaPalette[2] = {0};
		unsigned char AlphaTable[8] = {0};*/

		for (unsigned decompressCyclesCount = 0; true; ++decompressCyclesCount)
		{
			scoped_timestep time(loader, clk, 100);
			TEXSAMP_NewBlockIsValid = (decompressCyclesCount == 0);
			//printf("%u\n", DBG_OutU.GetUint8Val() );
			if (TEXSAMP_CompressionResultsValid.GetBoolVal() )
			{
				TEXSAMP_OutDecompressedPixels4x4.GetStructVal(HDLDecompressionOutput);
				/*ColorTable[0] = DBG_ColorTable0.GetUint32Val() | 0xFF000000;
				ColorTable[1] = DBG_ColorTable1.GetUint32Val() | 0xFF000000;
				ColorTable[2] = DBG_ColorTable2.GetUint32Val() | 0xFF000000;
				ColorTable[3] = DBG_ColorTable3.GetUint32Val() | 0xFF000000;
				ColorPalette[0] = DBG_Color0.GetUint16Val();
				ColorPalette[1] = DBG_Color1.GetUint16Val();
				AlphaPalette[0] = DBG_Alpha0.GetUint8Val();
				AlphaPalette[1] = DBG_Alpha1.GetUint8Val();
				AlphaTable[0] = DBG_AlphaTable0.GetUint8Val();
				AlphaTable[1] = DBG_AlphaTable1.GetUint8Val();
				AlphaTable[2] = DBG_AlphaTable2.GetUint8Val();
				AlphaTable[3] = DBG_AlphaTable3.GetUint8Val();
				AlphaTable[4] = DBG_AlphaTable4.GetUint8Val();
				AlphaTable[5] = DBG_AlphaTable5.GetUint8Val();
				AlphaTable[6] = DBG_AlphaTable6.GetUint8Val();
				AlphaTable[7] = DBG_AlphaTable7.GetUint8Val();*/
				break;
			}
		}

		if (CompareDecompressedLinearizedTexels(decompressedGroundTruthBlock, HDLDecompressionOutput) == false)
		{
			__debugbreak();
			return false;
		}

		return true;
	};

	for (unsigned testID = 0; testID < ARRAYSIZE(testSingleBlockTextures); ++testID)
	{
		const formatTestBlockPair& thisTestPair = testSingleBlockTextures[testID];

		const unsigned blockDimension = 4u;
		const unsigned textureWidth = blockDimension;
		const unsigned textureHeight = blockDimension;
		const unsigned textureMipCount = 1u;

		LPDIRECT3DTEXTURE9 testTexture = NULL;
		if (FAILED(D3DXCreateTextureFromFileExA(renderWindow->GetD3D9Dev(), thisTestPair.textureFilename, textureWidth, textureHeight, textureMipCount, 0, thisTestPair.texFmtD3D9, D3DPOOL_MANAGED, D3DX_DEFAULT, D3DX_DEFAULT, 0, NULL, NULL, &testTexture) ) || !testTexture)
		{
			__debugbreak();
			return E_FAIL;
		}

		BYTE compressedLinearizedTexels[64] = {0}; // Not all texture formats will use all 64 bytes (in fact, most of them will be much less)
		D3DLOCKED_RECT compressedRect = {0};
		const unsigned compressedBPP = GetBPPFromD3DFormat(thisTestPair.texFmtD3D9);
		const unsigned compressedBytesPerRow = 4 * (compressedBPP / 8);
		testTexture->LockRect(0, &compressedRect, NULL, D3DLOCK_READONLY);
		const BYTE* const compressedTexelBytes = reinterpret_cast<const BYTE* const>(compressedRect.pBits);
		if (IsD3DFormatCompressed(thisTestPair.texFmtD3D9) )
		{
			if (thisTestPair.texFmtD3D9 == D3DFMT_DXT1)
			{
				static const unsigned DXT1_BlockSize = 8u; // The block-size of a DXT1 block is 8 bytes
				memcpy(compressedLinearizedTexels, compressedTexelBytes, DXT1_BlockSize);
			}
			else
			{
				static const unsigned DXT35_BlockSize = 16u; // The block-size of a DXT3/DXT5 block is 16 bytes
				memcpy(compressedLinearizedTexels, compressedTexelBytes, DXT35_BlockSize);
			}
		}
		else
		{
			memcpy(compressedLinearizedTexels, compressedTexelBytes, compressedBytesPerRow);
			memcpy(compressedLinearizedTexels + compressedBytesPerRow, compressedTexelBytes + compressedRect.Pitch, compressedBytesPerRow);
			memcpy(compressedLinearizedTexels + compressedBytesPerRow * 2, compressedTexelBytes + compressedRect.Pitch * 2, compressedBytesPerRow);
			memcpy(compressedLinearizedTexels + compressedBytesPerRow * 3, compressedTexelBytes + compressedRect.Pitch * 3, compressedBytesPerRow);
		}
		testTexture->UnlockRect(0);

		LPDIRECT3DTEXTURE9 testTextureDecompressed = NULL;
		// Have D3DX9 automatically decompress to A8R8G8B8 for us so that we can compare our algorithm with theirs:
		/*if (FAILED(D3DXCreateTextureFromFileExA(renderWindow->GetD3D9Dev(), thisTestPair.textureFilename, textureWidth, textureHeight, textureMipCount, 0, D3DFMT_A8R8G8B8, D3DPOOL_MANAGED, D3DX_DEFAULT, D3DX_DEFAULT, 0, NULL, NULL, &testTextureDecompressed) ) || !testTextureDecompressed)
		{
			__debugbreak();
			return E_FAIL;
		}*/

		LPDIRECT3DTEXTURE9 testTextureDefault = NULL;
		if (FAILED(D3DXCreateTextureFromFileExA(renderWindow->GetD3D9Dev(), thisTestPair.textureFilename, textureWidth, textureHeight, textureMipCount, 0, thisTestPair.texFmtD3D9, D3DPOOL_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, NULL, NULL, &testTextureDefault) ) || !testTextureDefault)
		{
			__debugbreak();
			return E_FAIL;
		}
		GPUConvertTexture(renderWindow->GetD3D9Dev(), testTextureDefault, testTextureDecompressed);

		D3DCOLOR D3DX9_decompressedLinearizedTexels[4*4] = {0};
		D3DLOCKED_RECT decompressedRect = {0};
		testTextureDecompressed->LockRect(0, &decompressedRect, NULL, D3DLOCK_READONLY);
		const BYTE* const decompressedTexelBytes = reinterpret_cast<const BYTE* const>(decompressedRect.pBits);
		memcpy(D3DX9_decompressedLinearizedTexels, decompressedTexelBytes, 4 * sizeof(D3DCOLOR) );
		memcpy(D3DX9_decompressedLinearizedTexels + 4, decompressedTexelBytes + decompressedRect.Pitch, 4 * sizeof(D3DCOLOR) );
		memcpy(D3DX9_decompressedLinearizedTexels + 8, decompressedTexelBytes + decompressedRect.Pitch * 2, 4 * sizeof(D3DCOLOR) );
		memcpy(D3DX9_decompressedLinearizedTexels + 12, decompressedTexelBytes + decompressedRect.Pitch * 3, 4 * sizeof(D3DCOLOR) );
		testTextureDecompressed->UnlockRect(0);

		D3DCOLOR CPU_decompressedLinearizedTexels[4*4] = {0};
		SoftwareDecompressBlock(compressedLinearizedTexels, CPU_decompressedLinearizedTexels, thisTestPair.texFmt);

		if (CompareDecompressedLinearizedTexels(CPU_decompressedLinearizedTexels, D3DX9_decompressedLinearizedTexels) == false)
		{
			__debugbreak(); // Error detected: Difference between D3DX9 decompressor and the video card hardware and our software decompressor!
		}

		if (!verifyHDLSingleBlockDecompress(thisTestPair, compressedLinearizedTexels, CPU_decompressedLinearizedTexels) )
		{
			__debugbreak();
			successResult = false;
		}
	}

	return successResult ? S_OK : E_FAIL;
}
