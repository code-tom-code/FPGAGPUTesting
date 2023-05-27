#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "../D3DTriRasterizeTestData.h"
#include "ShaderCoreALUCommon.h"
#include "PixelPipelineShared.h"
#include <vector>

enum texSampleStateType
{
	waitingForRead, // 0
    
	// Tex sample entry points (one for point-sampling and the other for bilinear)
	texSample_point_address, // 1
	texSample_point_read, // 2
	texSample_point_read2, // 3
	texSample_point_read3, // 4
	texSample_bilinear_readTL, // 5
	texSample_bilinear_readTR, // 6
	texSample_bilinear_readBL, // 7
	texSample_bilinear_readBR, // 8
	texSample_bilinear_waitReadsComplete1, // 9
	texSample_bilinear_waitReadsComplete2, // 10
	texSample_bilinear_waitReadsComplete3, // 11

	// These stages are used for bilinear interpolation only
	bilinear_xMinMax, // 12
	bilinear_xDelta, // 13
	bilinear_xMultiply, // 14
	bilinear_xCombine, // 15
	bilinear_yMinMax, // 16
	bilinear_yDelta, // 17
	bilinear_yMultiply, // 18
	bilinear_yCombine, // 19

	// These latter stages are once again shared by both point and bilinear sampling:
	swizzleTexColors, // 20
	modulateTexWithVertexColor, // 21
	setupOutput, // 22
	waitingForWrite, // 23

	loadTextureState_memRequest, // 24
	loadTextureState_memResponse, // 25
	loadTextureState_cacheLine, // 26
	loadNullTextureState // 27
};

static unsigned currentTriCacheIndex = 0;

struct memResponse
{
	BYTE data[32];
};
static_assert(sizeof(memResponse) == 32, "Error: Unexpected struct size!");

#define COLOR4_ARGB(a,r,g,b) \
    ((D3DCOLOR)((((a)&0xff)<<24)|(((b)&0xff)<<16)|(((g)&0xff)<<8)|((r)&0xff)))

static const unsigned TEX_SAMPLER_STATE_SIZE_BITS = 74u;

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

struct sTexSamplerState // Currently 74 bits in total
{
	unsigned TextureBaseAddr : 30; // 29 : 0 // This could probably be a lot smaller due to minimum texture alignment but whatever
	unsigned /*eTexFormat*/ TextureFormat : 3; // 32 : 30
	unsigned TextureWidthLog2 : 3; // 35 : 33
	unsigned TextureHeightLog2 : 3; // 38 : 36
	unsigned TotalTexelCount : 16; // 54 : 39
	unsigned /*bool*/ UseBilinearFiltering : 1; // 55
	unsigned /*combinerMode*/ ColorCombinerMode : 3; // 58 : 56
	unsigned /*combinerMode*/ AlphaCombinerMode : 3; // 61 : 59
	unsigned /*eTexChannelMUX*/ ChannelSwizzleR : 3; // 64 : 62
	unsigned /*eTexChannelMUX*/ ChannelSwizzleG : 3; // 67 : 65
	unsigned /*eTexChannelMUX*/ ChannelSwizzleB : 3; // 70 : 68
	unsigned /*eTexChannelMUX*/ ChannelSwizzleA : 3; // 73 : 71
};
static_assert(sizeof(sTexSamplerState) * 8 >= TEX_SAMPLER_STATE_SIZE_BITS, "Error: Unexpected struct padding!");

const unsigned char GetLog2TexDimension(const unsigned short textureDimension)
{
	switch (textureDimension)
	{
	default:
		__debugbreak(); // Texture resolution is too high, or not a power of 2 (currently unsupported)!
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
	case 128: // This is the highest currently-supported texture resolution
		return 7;
	}
}

const eTexFormat GetDeviceFormatFromD3DFormat(const D3DFORMAT texFmt)
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
	}
}

const unsigned char GetBPPFromD3DFormat(const D3DFORMAT texFmt)
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
	}
}

static const float frand()
{
	return rand() / (const float)RAND_MAX;
}

static void ConvertCOLOR4ToFloat4(const uint32_t inColor, float& outColorX, float& outColorY, float& outColorZ, float& outColorW)
{
	const unsigned ur = inColor & 0xFF;
	const unsigned ug = (inColor >> 8) & 0xFF;
	const unsigned ub = (inColor >> 16) & 0xFF;
	const unsigned ua = (inColor >> 24) & 0xFF;
	outColorX = ur / 255.0f;
	outColorY = ug / 255.0f;
	outColorZ = ub / 255.0f;
	outColorW = ua / 255.0f;
}

void ReadTexelWithFormat(const unsigned char* const texelPtr, const D3DFORMAT format, D3DXVECTOR4& outVec)
{
	float rVal = 0.0f;
	float gVal = 0.0f;
	float bVal = 0.0f;
	float aVal = 0.0f;
	switch (format)
	{
	default:
		__debugbreak(); // Other tex formats are not yet implemented!
	case D3DFMT_A8R8G8B8:
	case D3DFMT_X8R8G8B8:
	{
		const D3DCOLOR readColor = *(const D3DCOLOR* const)texelPtr;
		const unsigned ur = (readColor >> 16) & 0xFF;
		const unsigned ug = (readColor >> 8) & 0xFF;
		const unsigned ub = (readColor) & 0xFF;
		const unsigned ua = (readColor >> 24) & 0xFF;
		rVal = ur / 255.0f;
		gVal = ug / 255.0f;
		bVal = ub / 255.0f;
		if (format == D3DFMT_A8R8G8B8)
			aVal = ua / 255.0f;
		else
			aVal = 1.0f;
	}
		break;
	case D3DFMT_A4R4G4B4:
	{
		const unsigned short readColor = *(const unsigned short* const)texelPtr;
		const unsigned ur = (readColor >> 8) & 0xF;
		const unsigned ug = (readColor >> 4) & 0xF;
		const unsigned ub = (readColor) & 0xF;
		const unsigned ua = (readColor >> 12) & 0xF;
		rVal = ur / 16.0f;
		gVal = ug / 16.0f;
		bVal = ub / 16.0f;
		aVal = ua / 16.0f;
	}
		break;
	case D3DFMT_R5G6B5:
	{
		const unsigned short readColor = *(const unsigned short* const)texelPtr;
		const unsigned ur = (readColor >> 11) & 0x1F;
		const unsigned ug = (readColor >> 5) & 0x3F;
		const unsigned ub = (readColor) & 0x1F;
		rVal = ur / 32.0f;
		gVal = ug / 64.0f;
		bVal = ub / 32.0f;
		aVal = 1.0f;
	}
		break;
	case D3DFMT_A1R5G5B5:
	case D3DFMT_X1R5G5B5:
	{
		const unsigned short readColor = *(const unsigned short* const)texelPtr;
		const unsigned ur = (readColor >> 10) & 0x1F;
		const unsigned ug = (readColor >> 5) & 0x1F;
		const unsigned ub = (readColor) & 0x1F;
		const unsigned ua = (readColor >> 15) & 0x1;
		rVal = ur / 32.0f;
		gVal = ug / 32.0f;
		bVal = ub / 32.0f;
		if (format == D3DFMT_A1R5G5B5)
			aVal = (const float)ua;
		else
			aVal = 1.0f;
	}
		break;
	}

	outVec.x = rVal;
	outVec.y = gVal;
	outVec.z = bVal;
	outVec.w = aVal;
}

static void UpdateInputFIFO(std::vector<attributeInterpOutputData>& inFIFO, std_logic_vector_port<96>& INTERP_InFIFO_rd_data, std_logic_port& INTERP_InFIFO_empty, std_logic_port& INTERP_InFIFO_rd_en)
{
	INTERP_InFIFO_empty = inFIFO.empty();
	if (INTERP_InFIFO_rd_en.GetBoolVal() )
	{
		inFIFO.erase(inFIFO.begin() );
	}
	if (!inFIFO.empty() )
	{
		INTERP_InFIFO_rd_data.SetStructVal(inFIFO.front() );
	}
	else
	{
		INTERP_InFIFO_rd_data.SetToZero();
	}
}

static void UpdateOutputFIFO(std::vector<texSampOutput>& outFIFO, std_logic_vector_port<64>& ROP_OutFIFO_wr_data, std_logic_port& ROP_OutFIFO_full, std_logic_port& ROP_OutFIFO_wr_en)
{
	ROP_OutFIFO_full = false;
	if (ROP_OutFIFO_wr_en.GetBoolVal() )
	{
		texSampOutput newOutput;
		ROP_OutFIFO_wr_data.GetStructVal(newOutput);
		outFIFO.push_back(newOutput);
	}
}

void EmulateTexSamplerCPU(const std::vector<attributeInterpOutputData>& interpolatedData, std::vector<texSampOutput>& outTexSampData, const bool useBilinearInterp, const D3DSURFACE_DESC& texDesc, const D3DLOCKED_RECT& d3dlr)
{
	static const float invUNORM16 = 1.0f / 65535.0f;
	const unsigned numPixels = (const unsigned)interpolatedData.size();
	const unsigned char* const texelsArray = (const unsigned char* const)d3dlr.pBits;
	const unsigned char numBytesPerTexel = GetBPPFromD3DFormat(texDesc.Format) / 8;
	for (unsigned x = 0; x < numPixels; ++x)
	{
		const attributeInterpOutputData& thisPixelData = interpolatedData[x];

		//printf("Emulator pixel %u:\n", x);

		D3DXVECTOR2 texcoord;
		texcoord.x = thisPixelData.texcoordX * invUNORM16;
		texcoord.y = thisPixelData.texcoordY * invUNORM16;

		const int xWholeTexel = (const int)(texDesc.Width * texcoord.x);
		const int yWholeTexel = (const int)(texDesc.Height * texcoord.y);

		if (xWholeTexel < 0 || xWholeTexel >= (const int)texDesc.Width)
		{
			__debugbreak();
		}
		if (yWholeTexel < 0 || yWholeTexel >= (const int)texDesc.Height)
		{
			__debugbreak();
		}

		const unsigned char* const topRowPtr = texelsArray + (d3dlr.Pitch * yWholeTexel);
		const unsigned char* const topLeftTexelPtr = topRowPtr + (numBytesPerTexel * xWholeTexel);
		D3DXVECTOR4 topLeftTexel;
		ReadTexelWithFormat(topLeftTexelPtr, texDesc.Format, topLeftTexel);
		//printf("Emulator sampling from (%i, %i): (%f, %f, %f, %f)\n", xWholeTexel, yWholeTexel, topLeftTexel.x, topLeftTexel.y, topLeftTexel.z, topLeftTexel.w);

		D3DXVECTOR4 texBlendedPixel;

		if (useBilinearInterp == false)
		{
			texBlendedPixel = topLeftTexel;
		}
		else
		{
			const int xTopRightWholeTexel = (xWholeTexel + 1) % texDesc.Width;
			const int yTopRightWholeTexel = yWholeTexel;

			const int xBotLeftWholeTexel = xWholeTexel;
			const int yBotLeftWholeTexel = (yWholeTexel + 1) % texDesc.Height;

			const int xBotRightWholeTexel = xTopRightWholeTexel;
			const int yBotRightWholeTexel = yBotLeftWholeTexel;

			const unsigned char* const topRightTexelPtr = topRowPtr + (numBytesPerTexel * xTopRightWholeTexel);
			const unsigned char* const botRowPtr = texelsArray + (d3dlr.Pitch * yBotLeftWholeTexel);
			const unsigned char* const botLeftTexelPtr = botRowPtr + (numBytesPerTexel * xBotLeftWholeTexel);
			const unsigned char* const botRightTexelPtr = botRowPtr + (numBytesPerTexel * xBotRightWholeTexel);

			D3DXVECTOR4 topRightTexel, botLeftTexel, botRightTexel;
			ReadTexelWithFormat(topRightTexelPtr, texDesc.Format, topRightTexel);
			ReadTexelWithFormat(botLeftTexelPtr, texDesc.Format, botLeftTexel);
			ReadTexelWithFormat(botRightTexelPtr, texDesc.Format, botRightTexel);

			//printf("Emulator sampling TR from (%i, %i): (%f, %f, %f, %f)\n", xTopRightWholeTexel, yTopRightWholeTexel, topRightTexel.x, topRightTexel.y, topRightTexel.z, topRightTexel.w);
			//printf("Emulator sampling BL from (%i, %i): (%f, %f, %f, %f)\n", xBotLeftWholeTexel, yBotLeftWholeTexel, botLeftTexel.x, botLeftTexel.y, botLeftTexel.z, botLeftTexel.w);
			//printf("Emulator sampling BR from (%i, %i): (%f, %f, %f, %f)\n", xBotRightWholeTexel, yBotRightWholeTexel, botRightTexel.x, botRightTexel.y, botRightTexel.z, botRightTexel.w);

			const float xFracTexel = (texDesc.Width * texcoord.x) - (const float)xWholeTexel;
			const float yFracTexel = (texDesc.Height * texcoord.y) - (const float)yWholeTexel;

			D3DXVECTOR4 topXBlend = (topRightTexel - topLeftTexel) * xFracTexel + topLeftTexel;
			D3DXVECTOR4 botXBlend = (botRightTexel - botLeftTexel) * xFracTexel + botLeftTexel;

			texBlendedPixel = (botXBlend - topXBlend) * yFracTexel + topXBlend;
		}

		D3DXVECTOR4 vertColorVector;
		ConvertCOLOR4ToFloat4(thisPixelData.vertexColorRGBA, vertColorVector.x, vertColorVector.y, vertColorVector.z, vertColorVector.w);

		const D3DXVECTOR4 texModVColor = D3DXVECTOR4(texBlendedPixel.x * vertColorVector.x, texBlendedPixel.y * vertColorVector.y, texBlendedPixel.z * vertColorVector.z, texBlendedPixel.w * vertColorVector.w);

		texSampOutput outPixel;
		outPixel.pixelX = thisPixelData.pixelX;
		outPixel.pixelY = thisPixelData.pixelY;
		outPixel.colorR = (const unsigned char)(texModVColor.x * 255.0f);
		outPixel.colorG = (const unsigned char)(texModVColor.y * 255.0f);
		outPixel.colorB = (const unsigned char)(texModVColor.z * 255.0f);
		outPixel.colorA = (const unsigned char)(texModVColor.w * 255.0f);
		outTexSampData.push_back(outPixel);
	}
}

struct textureCachePipelineState
{
	bool isEnabled;
	bool isWrite;
	unsigned short cacheAddress;
	uint32_t writeData;
};

const int RunTestsTexSampler(Xsi::Loader& loader, RenderWindow* renderWindow)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

// Attribute Interpolator interface begin
	std_logic_vector_port<96> INTERP_InFIFO_rd_data(PD_IN, loader, "INTERP_InFIFO_rd_data");
	std_logic_port INTERP_InFIFO_empty(PD_IN, loader, "INTERP_InFIFO_empty");
	std_logic_port INTERP_InFIFO_rd_en(PD_OUT, loader, "INTERP_InFIFO_rd_en");
// Attribute Interpolator interface end

// Memory Controller FIFO interface begin
	// DRAM read requests FIFO:
	std_logic_vector_port<30> MEM_TexSampReadRequestsFIFO_wr_data(PD_OUT, loader, "MEM_TexSampReadRequestsFIFO_wr_data");
	std_logic_port MEM_TexSampReadRequestsFIFO_full(PD_IN, loader, "MEM_TexSampReadRequestsFIFO_full");
	std_logic_port MEM_TexSampReadRequestsFIFO_wr_en(PD_OUT, loader, "MEM_TexSampReadRequestsFIFO_wr_en");

	// DRAM read responses FIFO:
	std_logic_vector_port<256> MEM_TexSampReadResponsesFIFO_rd_data(PD_IN, loader, "MEM_TexSampReadResponsesFIFO_rd_data");
	std_logic_port MEM_TexSampReadResponsesFIFO_empty(PD_IN, loader, "MEM_TexSampReadResponsesFIFO_empty");
	std_logic_port MEM_TexSampReadResponsesFIFO_rd_en(PD_OUT, loader, "MEM_TexSampReadResponsesFIFO_rd_en");
// Memory Controller FIFO interface end

// Texture Sampler State Block interface begin
	std_logic_vector_port<TEX_SAMPLER_STATE_SIZE_BITS> STATE_StateBitsAtDrawID(PD_IN, loader, "STATE_StateBitsAtDrawID");
	std_logic_vector_port<16> STATE_NextDrawID(PD_IN, loader, "STATE_NextDrawID");
	std_logic_port STATE_ConsumeStateSlot(PD_OUT, loader, "STATE_ConsumeStateSlot");
// Texture Sampler State Block interface end

// Texture cache BRAM interfaces begin
	std_logic_vector_port<14> TexCache_addra(PD_OUT, loader, "TexCache_addra");
	std_logic_vector_port<32> TexCache_dina(PD_OUT, loader, "TexCache_dina");
	std_logic_vector_port<32> TexCache_douta(PD_IN, loader, "TexCache_douta");
	std_logic_port TexCache_ena(PD_OUT, loader, "TexCache_ena");
	std_logic_vector_port<1> TexCache_wea(PD_OUT, loader, "TexCache_wea");
// Texture cache BRAM interfaces end

// Command Processor block interface begin
	std_logic_port CMD_TexSampleIsIdle(PD_OUT, loader, "CMD_TexSampleIsIdle");
// Command Processor block interface end

// ROP interface begin
	std_logic_vector_port<64> ROP_OutFIFO_wr_data(PD_OUT, loader, "ROP_OutFIFO_wr_data");
	std_logic_port ROP_OutFIFO_full(PD_IN, loader, "ROP_OutFIFO_full");
	std_logic_port ROP_OutFIFO_wr_en(PD_OUT, loader, "ROP_OutFIFO_wr_en");
// ROP interface end

// Debug signals
	std_logic_vector_port<6> DBG_TexSample_State(PD_OUT, loader, "DBG_TexSample_State");
	std_logic_vector_port<32> DBG_TexCache_douta(PD_OUT, loader, "DBG_TexCache_douta");
	std_logic_vector_port<32> DBG_TexCache_dina(PD_OUT, loader, "DBG_TexCache_dina");
	std_logic_vector_port<14> DBG_TexCache_addra(PD_OUT, loader, "DBG_TexCache_addra");

	bool successResult = true;

	LPDIRECT3DTEXTURE9 gridTexture128x128 = NULL;
	if (FAILED(D3DXCreateTextureFromFileExA(renderWindow->GetD3D9Dev(), /*"TestGrid.png"*/"RedGreenGradient128x128.png", D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_X8R8G8B8, D3DPOOL_MANAGED, D3DX_DEFAULT, D3DX_DEFAULT, 0, NULL, NULL, &gridTexture128x128) ) || !gridTexture128x128)
	{
		__debugbreak();
		return E_FAIL;
	}

	srand(3); // Pick a stable seed so we get consistent random results

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		ROP_OutFIFO_full = false;
		INTERP_InFIFO_rd_data.SetToZero();
		INTERP_InFIFO_empty = true;
		MEM_TexSampReadRequestsFIFO_full = false;
		MEM_TexSampReadResponsesFIFO_empty = true;
		TexCache_douta = 0x00000000;

		sTexSamplerState defaultZeroState;
		defaultZeroState.TextureBaseAddr = 0x00000000;
		defaultZeroState.TextureFormat = eTexFmtA8R8G8B8;
		defaultZeroState.TextureWidthLog2 = 6; // 64x64
		defaultZeroState.TextureHeightLog2 = 6; // 64x64
		defaultZeroState.UseBilinearFiltering = true;
		defaultZeroState.ColorCombinerMode = cbm_textureModulateVertexColor;
		defaultZeroState.AlphaCombinerMode = cbm_textureModulateVertexColor;
		defaultZeroState.TotalTexelCount = 0;
		defaultZeroState.ChannelSwizzleR = tcm_r;
		defaultZeroState.ChannelSwizzleG = tcm_g;
		defaultZeroState.ChannelSwizzleB = tcm_b;
		defaultZeroState.ChannelSwizzleA = tcm_a;

		STATE_StateBitsAtDrawID.SetToByteMemory(&defaultZeroState);

		STATE_NextDrawID = (const uint16_t)0u;
	}

	const char* textureMemoryUpperBits = NULL;
	unsigned currentTexWidth = 0;
	unsigned currentTexHeight = 0;

	std::vector<memResponse> memResponses;
	std::vector<uint32_t> textureCache;
	textureCache.resize(128 * 128, 0x00000000);

	// Validate that the texture cache has been correctly filled with texture memory:
	auto ValidateTextureCache = [&]()
	{
		const D3DCOLOR* const textureBackedMemory = (const D3DCOLOR* const)textureMemoryUpperBits;
		for (unsigned y = 0; y < currentTexHeight; ++y)
		{
			for (unsigned x = 0; x < currentTexWidth; ++x)
			{
				const D3DCOLOR textureCacheColor = textureCache[y * currentTexWidth + x];
				const D3DCOLOR textureMemoryColor = textureBackedMemory[y * currentTexWidth + x];
				if (textureCacheColor != textureMemoryColor)
				{
					__debugbreak();
				}
			}
		}
	};

	auto updateMemoryController = [&]()
	{
		MEM_TexSampReadRequestsFIFO_full = false;
		if (MEM_TexSampReadRequestsFIFO_wr_en.GetBoolVal() )
		{
			const uint32_t readBaseAddress = MEM_TexSampReadRequestsFIFO_wr_data.GetUint32Val();

			const char* const readStartAddress = (const char* const)( (reinterpret_cast<const unsigned __int64>(textureMemoryUpperBits) & (~0x3FFFFFFFull) ) | readBaseAddress);

			memResponse newMemRead;
			memcpy(newMemRead.data, readStartAddress, 32);
			memResponses.push_back(newMemRead);
		}

		MEM_TexSampReadResponsesFIFO_empty = memResponses.empty();
		if (!memResponses.empty() )
		{
			MEM_TexSampReadResponsesFIFO_rd_data.SetToByteMemory(&memResponses.front() );
		}
		if (MEM_TexSampReadResponsesFIFO_rd_en.GetBoolVal() )
		{
			memResponses.erase(memResponses.begin() );
			MEM_TexSampReadResponsesFIFO_empty = memResponses.empty();
			if (!memResponses.empty() )
			{
				MEM_TexSampReadResponsesFIFO_rd_data.SetToByteMemory(&memResponses.front() );
			}
		}
	};

	auto updateTextureCache = [&]()
	{
		static const unsigned NUM_TEXCACHE_PIPE_STAGES = 2;
		static textureCachePipelineState pipeStates[NUM_TEXCACHE_PIPE_STAGES + 1];
		if (TexCache_ena.GetBoolVal() )
		{
			for (unsigned x = 0; x < NUM_TEXCACHE_PIPE_STAGES; ++x)
			{
				pipeStates[x] = pipeStates[x + 1];
			}
			pipeStates[NUM_TEXCACHE_PIPE_STAGES] = {0};

			const unsigned texCacheAddr = TexCache_addra.GetUint16Val();
			if (TexCache_wea.GetUint8Val() ) // Write
			{
				pipeStates[NUM_TEXCACHE_PIPE_STAGES].isEnabled = true;
				pipeStates[NUM_TEXCACHE_PIPE_STAGES].isWrite = true;
				pipeStates[NUM_TEXCACHE_PIPE_STAGES].cacheAddress = texCacheAddr;
				pipeStates[NUM_TEXCACHE_PIPE_STAGES].writeData = TexCache_dina.GetUint32Val();
			}
			else // Read
			{
				pipeStates[NUM_TEXCACHE_PIPE_STAGES].isEnabled = true;
				pipeStates[NUM_TEXCACHE_PIPE_STAGES].isWrite = false;
				pipeStates[NUM_TEXCACHE_PIPE_STAGES].cacheAddress = texCacheAddr;
				pipeStates[NUM_TEXCACHE_PIPE_STAGES].writeData = 0x00000000;
			}

			if (pipeStates[0].isEnabled)
			{
				if (pipeStates[0].isWrite)
				{
					textureCache[pipeStates[0].cacheAddress] = pipeStates[0].writeData;
				}
				else
				{
					//printf("Simulator reading from (%i, %i): 0x%08X\n", pipeStates[0].cacheAddress % currentTexWidth, pipeStates[0].cacheAddress / currentTexWidth, textureCache[pipeStates[0].cacheAddress]);
					TexCache_douta = textureCache[pipeStates[0].cacheAddress];
				}
			}
		}
	};

	auto simulateRTLTexSampler = [&](const std::vector<attributeInterpOutputData>& attrInterpData, std::vector<texSampOutput>& outTexSampData, const bool useBilinearInterp, const D3DSURFACE_DESC& texDesc, const D3DLOCKED_RECT& d3dlr)
	{
		if (attrInterpData.empty() )
		{
			return;
		}

		// Make a copy of the array so that we can reuse the same data for the simulation as for the emulation
		std::vector<attributeInterpOutputData> localInterpData = attrInterpData;
		std::vector<attributeInterpOutputData> emptyVector;

		// Wait for CMD Idle first:
		while (CMD_TexSampleIsIdle.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
		}

		// Configure texture state:
		const eTexFormat deviceTexFormat = GetDeviceFormatFromD3DFormat(texDesc.Format);
		const unsigned char log2width = GetLog2TexDimension(texDesc.Width);
		const unsigned char log2height = GetLog2TexDimension(texDesc.Height);

		sTexSamplerState newTexSamplerState;
		newTexSamplerState.TextureBaseAddr = ( ( (const unsigned)(d3dlr.pBits) ) & 0x3FFFFFFF);
		newTexSamplerState.TotalTexelCount = texDesc.Width * texDesc.Height;
		newTexSamplerState.TextureFormat = deviceTexFormat;
		newTexSamplerState.TextureWidthLog2 = log2width;
		newTexSamplerState.TextureHeightLog2 = log2height;
		newTexSamplerState.UseBilinearFiltering = useBilinearInterp;
		newTexSamplerState.ColorCombinerMode = cbm_textureModulateVertexColor;
		newTexSamplerState.AlphaCombinerMode = cbm_textureModulateVertexColor;
		newTexSamplerState.ChannelSwizzleR = tcm_b; // Swizzle BGRA to RGBA
		newTexSamplerState.ChannelSwizzleG = tcm_g;
		newTexSamplerState.ChannelSwizzleB = tcm_r;
		newTexSamplerState.ChannelSwizzleA = tcm_a;

		STATE_StateBitsAtDrawID.SetToByteMemory(&newTexSamplerState);
		STATE_NextDrawID = (const uint16_t)1u;

		{
			scoped_timestep time(loader, clk, 100);
		}
		while (CMD_TexSampleIsIdle.GetBoolVal() == false) // Wait for idle again
		{
			scoped_timestep time(loader, clk, 100);
		}

		while (CMD_TexSampleIsIdle.GetBoolVal() == false) // Wait for the texture cache to fill up
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
			updateTextureCache();
			UpdateInputFIFO(emptyVector, INTERP_InFIFO_rd_data, INTERP_InFIFO_empty, INTERP_InFIFO_rd_en);
			UpdateOutputFIFO(outTexSampData, ROP_OutFIFO_wr_data, ROP_OutFIFO_full, ROP_OutFIFO_wr_en);
		}

		bool hasValidatedTextureCache = false;

		while (!localInterpData.empty() || CMD_TexSampleIsIdle.GetBoolVal() == false)
		{
			const attributeInterpOutputData& thisPixelData = localInterpData.empty() ? attributeInterpOutputData() : localInterpData.front();

			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
			updateTextureCache();
			UpdateInputFIFO(localInterpData, INTERP_InFIFO_rd_data, INTERP_InFIFO_empty, INTERP_InFIFO_rd_en);
			UpdateOutputFIFO(outTexSampData, ROP_OutFIFO_wr_data, ROP_OutFIFO_full, ROP_OutFIFO_wr_en);

			if (!hasValidatedTextureCache && ROP_OutFIFO_wr_en.GetBoolVal() == true)
			{
				ValidateTextureCache();
				hasValidatedTextureCache = true;
			}
		}

		if (!memResponses.empty() )
		{
			__debugbreak(); // This means that we have an unconsumed memory request
		}
	};

	auto runTexSamplerTest = [&](const std::vector<attributeInterpOutputData>& attrInterpData, const bool useBilinearInterp, const D3DSURFACE_DESC& texDesc, const D3DLOCKED_RECT& d3dlr) -> bool
	{
		textureMemoryUpperBits = (const char* const)d3dlr.pBits;

		std::vector<texSampOutput> emulatedCPUTexSampData;
		std::vector<texSampOutput> simulatedRTLTexSampData;

		EmulateTexSamplerCPU(attrInterpData, emulatedCPUTexSampData, useBilinearInterp, texDesc, d3dlr);
		simulateRTLTexSampler(attrInterpData, simulatedRTLTexSampData, useBilinearInterp, texDesc, d3dlr);

		if (simulatedRTLTexSampData.size() != emulatedCPUTexSampData.size() )
		{
			__debugbreak();
			return false;
		}

		const unsigned numOutputPixels = (const unsigned)emulatedCPUTexSampData.size();
		for (unsigned x = 0; x < numOutputPixels; ++x)
		{
			const texSampOutput& emulatedCPUPixel = emulatedCPUTexSampData[x];
			const texSampOutput& simulatedRTLPixel = simulatedRTLTexSampData[x];

			if (!(emulatedCPUPixel == simulatedRTLPixel) )
			{
				__debugbreak();
				return false;
			}

			// Check for out of range pixel coords:
			if (simulatedRTLPixel.pixelX < 0 ||
				simulatedRTLPixel.pixelY < 0 ||
				simulatedRTLPixel.pixelX > 639 ||
				simulatedRTLPixel.pixelY > 479)
			{
				__debugbreak();
				return false;
			}
		}

		return true;
	};

	// Indices are expected to arrive in CCW order:
	auto testSimpleDrawCall = [&](const testVert* const vertices, const unsigned short* const indicesCCW, const unsigned numPrims, const bool useBilinearInterp, LPDIRECT3DTEXTURE9 setTexture, const bool randomAttributes = false)
	{
		D3DSURFACE_DESC texDesc = {};
		setTexture->GetLevelDesc(0, &texDesc);
		D3DLOCKED_RECT d3dlr = {0};
		setTexture->LockRect(0, &d3dlr, NULL, D3DLOCK_READONLY);
		currentTexWidth = texDesc.Width;
		currentTexHeight = texDesc.Height;
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

			std::vector<triSetupInput> unclippedTris;
			unclippedTris.push_back(primTriData);
			std::vector<triSetupInput> clippedTris;
			EmulateCPUClipper(unclippedTris, clippedTris);

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
				std::vector<unsigned> emulatedCPUDepthValues;
				EmulateDepthInterpCPU(triSetupData, rasterizedPixels, emulatedCPUDepthInterpData, emulatedCPUDepthValues);

				std::vector<attributeInterpOutputData> emulatedCPUAttributeInterpData;
				EmulateAttributeInterpCPU(triSetupData, emulatedCPUDepthInterpData, !randomAttributes, emulatedCPUAttributeInterpData);

				successResult &= runTexSamplerTest(emulatedCPUAttributeInterpData, useBilinearInterp, texDesc, d3dlr);
			}
		}
		setTexture->UnlockRect(0);
	};

	// Do a simple point-sampled triangle first:
	{
		const unsigned short fullTriangle0IB[] = { 0, 1, 2 };
		const bool useBilinearInterp = false;
		testSimpleDrawCall(fullTriangle0, fullTriangle0IB, ARRAYSIZE(fullTriangle0IB) / 3, useBilinearInterp, gridTexture128x128);
	}

	// Test case with three triangles that share a single vertex:
	{
		static const unsigned short sharedVertex3TrianglesIndices[] =
		{
			0, 1, 2,
			0, 2, 3,
			0, 3, 4
		};
		const bool useBilinearInterp = true;
		testSimpleDrawCall(threeTrisSharedVertex, sharedVertex3TrianglesIndices, ARRAYSIZE(sharedVertex3TrianglesIndices) / 3, useBilinearInterp, gridTexture128x128);
	}

	// Let's try doing 128 random small triangles (about half will get backface culled, and some others may get degenerate triangle culled or clipped off the screen):
	{
		srand(3); // Set a deterministic seed so we get the same results every time
		const unsigned short fullTriangleIB[] = { 0, 1, 2 };
		for (unsigned x = 0; x < 128; ++x)
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
			testSimpleDrawCall(verts, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3, useBilinearInterp, gridTexture128x128, useRandomAttributes);
		}
	}

	return successResult ? S_OK : E_FAIL;
}
