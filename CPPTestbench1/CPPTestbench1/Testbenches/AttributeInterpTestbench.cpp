#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "../D3DTriRasterizeTestData.h"
#include "ShaderCoreALUCommon.h"
#include "PixelPipelineShared.h"
#include <vector>

static unsigned currentTriCacheIndex = 0;

#define COLOR4_ARGB(a,r,g,b) \
    ((D3DCOLOR)((((a)&0xff)<<24)|(((b)&0xff)<<16)|(((g)&0xff)<<8)|((r)&0xff)))

static const float frand()
{
	return rand() / (const float)RAND_MAX;
}

static const float SoftFrac(const float f)
{
	return f - floor(f);
}

enum attrInterpStateType
{
	waitingForRead, // 0

	multBarycentricsAndAttr0, // 1
	multBarycentricsAndAttr1, // 2
	multBarycentricsAndAttr2, // 3
	multBarycentricsAndAttr3, // 4
	multBarycentricsAndAttr4, // 5
	multBarycentricsAndAttr5, // 6
	multBarycentricsAndAttr6, // 7
	multBarycentricsAndAttr7, // 8
	multBarycentricsAndAttr8, // 9
	multBarycentricsAndAttr9, // 10
	multBarycentricsAndAttr10, // 11
	multBarycentricsAndAttr11, // 12
	multBarycentricsAndAttr12, // 13
	multBarycentricsAndAttr13, // 14
	multBarycentricsAndAttr14, // 15
	multBarycentricsAndAttr15, // 16
	multBarycentricsAndAttr16, // 17
	multBarycentricsAndAttr17, // 18

	addDotProductTerms0, // 19
	addDotProductTerms1, // 20
	addDotProductTerms2, // 21
	addDotProductTerms3, // 22
	addDotProductTerms4, // 23
	addDotProductTerms5, // 24
	addDotProductTerms6, // 25
	addDotProductTerms7, // 26
	addDotProductTerms8, // 27
	addDotProductTerms9, // 28
	addDotProductTerms10, // 29
	addDotProductTerms11, // 30
	addDotProductTerms12, // 31
	addDotProductTerms13, // 32
	addDotProductTerms14, // 33
	addDotProductTerms15, // 34
	addDotProductTerms16, // 35

	multiplyPixelW0, // 36
	multiplyPixelW1, // 37
	multiplyPixelW2, // 38
	multiplyPixelW3, // 39
	multiplyPixelW4, // 40
	multiplyPixelW5, // 41
	multiplyPixelW6, // 42
	multiplyPixelW7, // 43
	multiplyPixelW8, // 44
	multiplyPixelW9, // 45
	multiplyPixelW10, // 46
	multiplyPixelW11, // 47

	compressOutput0, // 48
	compressOutput1, // 49
	compressOutput2, // 50
	compressOutput3, // 51
	compressOutput4, // 52
	compressOutput5, // 53
	compressOutput6, // 54
	compressOutput7, // 55
	compressOutput8, // 56
	compressOutput9, // 57
	compressOutput10, // 58
	compressOutput11, // 59

	waitingForWrite // 60
};

static void ConvertCOLOR4ToFloat4(const vertAttributes::_rgba& inColor, float& outColorX, float& outColorY, float& outColorZ, float& outColorW)
{
	outColorX = inColor.r;
	outColorY = inColor.g;
	outColorZ = inColor.b;
	outColorW = inColor.a;
}

static void ConvertFloat4ToUBYTE4(const D3DXVECTOR4& inColor, uint32_t& outByte4)
{
	const D3DXVECTOR4 scaledVector = inColor * 255.0f;
	const unsigned byteR = (const unsigned char)scaledVector.x;
	const unsigned byteG = (const unsigned char)scaledVector.y;
	const unsigned byteB = (const unsigned char)scaledVector.z;
	const unsigned byteA = (const unsigned char)scaledVector.w;
	outByte4 = byteR | (byteG << 8) | (byteB << 16) | (byteA << 24);
}

const unsigned short ConvertFloatToUNORM16(const float fVal)
{
	const float frcF = SoftFrac(fVal);
	return (const unsigned short)(frcF * 65535.0f);
}

void EmulateAttributeInterpCPU(const triSetupOutput& triSetupData, const std::vector<depthInterpOutputData>& depthInterpData, const bool validateNormalizedTexcoords, std::vector<attributeInterpOutputData>& outAttributeInterpData)
{
	D3DXVECTOR2 tex0, tex10, tex20;
	tex0.x = triSetupData.v0.xTex;
	tex0.y = triSetupData.v0.yTex;
	tex10.x = triSetupData.v10.xTex;
	tex10.y = triSetupData.v10.yTex;
	tex20.x = triSetupData.v20.xTex;
	tex20.y = triSetupData.v20.yTex;
	D3DXVECTOR4 vc0, vc10, vc20;
	ConvertCOLOR4ToFloat4(triSetupData.v0.rgba, vc0.x, vc0.y, vc0.z, vc0.w);
	ConvertCOLOR4ToFloat4(triSetupData.v10.rgba, vc10.x, vc10.y, vc10.z, vc10.w);
	ConvertCOLOR4ToFloat4(triSetupData.v20.rgba, vc20.x, vc20.y, vc20.z, vc20.w);

	const unsigned numPixels = (const unsigned)depthInterpData.size();
	for (unsigned x = 0; x < numPixels; ++x)
	{
		const depthInterpOutputData& thisPixelData = depthInterpData[x];

		const D3DXVECTOR2 t0divW = tex0;
		const D3DXVECTOR2 t10divW = tex10;
		const D3DXVECTOR2 t20divW = tex20;

		const D3DXVECTOR2 texSum10 = thisPixelData.normalizedBarycentricB * t10divW;
		const D3DXVECTOR2 texSum20 = thisPixelData.normalizedBarycentricC * t20divW;
		const D3DXVECTOR2 dotProdTex = texSum10 + texSum20 + t0divW;

		const D3DXVECTOR2 interpolatedTexcoord = dotProdTex * thisPixelData.interpolatedPixelW;

		if (validateNormalizedTexcoords)
		{
			// Add a tiny epsilon to account for occasional floating point imprecision causing the attribute interpolation to go very slightly out of bounds:
			if (interpolatedTexcoord.x > 1.00000025f || interpolatedTexcoord.x < -0.00000025f || interpolatedTexcoord.y > 1.00000025f || interpolatedTexcoord.y < -0.00000025f)
			{
				__debugbreak();
			}
		}

		const D3DXVECTOR4 vc0divW = vc0;
		const D3DXVECTOR4 vc10divW = vc10;
		const D3DXVECTOR4 vc20divW = vc20;

		const D3DXVECTOR4 vcSum10 = thisPixelData.normalizedBarycentricB * vc10divW;
		const D3DXVECTOR4 vcSum20 = thisPixelData.normalizedBarycentricC * vc20divW;
		const D3DXVECTOR4 dotProdVertColor = vcSum10 + vcSum20 + vc0divW;

		const D3DXVECTOR4 interpolatedVertColor = dotProdVertColor * thisPixelData.interpolatedPixelW;
		// Add a tiny epsilon to account for occasional floating point imprecision causing the attribute interpolation to go very slightly out of bounds:
		if (interpolatedVertColor.x < -0.00000025f || interpolatedVertColor.x > 1.00000025f)
		{
			__debugbreak();
		}
		if (interpolatedVertColor.y < -0.00000025f || interpolatedVertColor.y > 1.00000025f)
		{
			__debugbreak();
		}
		if (interpolatedVertColor.z < -0.00000025f || interpolatedVertColor.z > 1.00000025f)
		{
			__debugbreak();
		}
		if (interpolatedVertColor.w < -0.00000025f || interpolatedVertColor.w > 1.00000025f)
		{
			__debugbreak();
		}

		attributeInterpOutputData outInterpolatedData;
		outInterpolatedData.pixelX = thisPixelData.pixelX;
		outInterpolatedData.pixelY = thisPixelData.pixelY;
		outInterpolatedData.texcoordX = ConvertFloatToUNORM16(interpolatedTexcoord.x);
		outInterpolatedData.texcoordY = ConvertFloatToUNORM16(interpolatedTexcoord.y);
		ConvertFloat4ToUBYTE4(interpolatedVertColor, outInterpolatedData.vertexColorRGBA);
		outAttributeInterpData.push_back(outInterpolatedData);
	}
}

static void UpdateOutputFIFO(std::vector<attributeInterpOutputData>& outAttributeInterpData, std_logic_vector_port<96>& TEXSAMP_OutFIFO_wr_data, std_logic_port& TEXSAMP_OutFIFO_full, std_logic_port& TEXSAMP_OutFIFO_wr_en)
{
	TEXSAMP_OutFIFO_full = false;
	if (TEXSAMP_OutFIFO_wr_en.GetBoolVal() )
	{
		attributeInterpOutputData newOutput;
		TEXSAMP_OutFIFO_wr_data.GetStructVal(newOutput);
		outAttributeInterpData.push_back(newOutput);
	}
}

const int RunTestsAttributeInterp(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

// Command Processor interface begin
	std_logic_port CMD_UseFlatShading(PD_IN, loader, "CMD_UseFlatShading");
// Command Processor interface end

// Depth Interpolator interface begin
	std_logic_port DINTERP_ReadyForNewPixel(PD_OUT, loader, "DINTERP_ReadyForNewPixel");
	std_logic_port DINTERP_NewPixelValid(PD_IN, loader, "DINTERP_NewPixelValid");
	std_logic_vector_port<10> DINTERP_PosX(PD_IN, loader, "DINTERP_PosX");
	std_logic_vector_port<10> DINTERP_PosY(PD_IN, loader, "DINTERP_PosY");
	std_logic_vector_port<32> DINTERP_TX0(PD_IN, loader, "DINTERP_TX0");
	std_logic_vector_port<32> DINTERP_TY0(PD_IN, loader, "DINTERP_TY0");
	std_logic_vector_port<32> DINTERP_TX10(PD_IN, loader, "DINTERP_TX10");
	std_logic_vector_port<32> DINTERP_TY10(PD_IN, loader, "DINTERP_TY10");
	std_logic_vector_port<32> DINTERP_TX20(PD_IN, loader, "DINTERP_TX20");
	std_logic_vector_port<32> DINTERP_TY20(PD_IN, loader, "DINTERP_TY20");
	std_logic_vector_port<128> DINTERP_VC0(PD_IN, loader, "DINTERP_VC0");
	std_logic_vector_port<128> DINTERP_VC10(PD_IN, loader, "DINTERP_VC10");
	std_logic_vector_port<128> DINTERP_VC20(PD_IN, loader, "DINTERP_VC20");
	std_logic_vector_port<32> DINTERP_NormalizedBarycentricB(PD_IN, loader, "DINTERP_NormalizedBarycentricB");
	std_logic_vector_port<32> DINTERP_NormalizedBarycentricC(PD_IN, loader, "DINTERP_NormalizedBarycentricC");
	std_logic_vector_port<32> DINTERP_OutPixelW(PD_IN, loader, "DINTERP_OutPixelW");
// Depth Interpolator interface end

// FPU interfaces begin
	std_logic_vector_port<32> FPU_A(PD_OUT, loader, "FPU_A");
	std_logic_vector_port<32> FPU_B(PD_OUT, loader, "FPU_B");
	std_logic_vector_port<32> FPU_OUT(PD_IN, loader, "FPU_OUT");
	std_logic_vector_port<3> FPU_Mode(PD_OUT, loader, "FPU_Mode");
	std_logic_port FPU_ISHFT_GO(PD_OUT, loader, "FPU_ISHFT_GO");
	std_logic_port FPU_IMUL_GO(PD_OUT, loader, "FPU_IMUL_GO");
	std_logic_port FPU_IADD_GO(PD_OUT, loader, "FPU_IADD_GO");
	std_logic_port FPU_ICMP_GO(PD_OUT, loader, "FPU_ICMP_GO");
	std_logic_port FPU_ICNV_GO(PD_OUT, loader, "FPU_ICNV_GO");
	std_logic_port FPU_ISPEC_GO(PD_OUT, loader, "FPU_ISPEC_GO");
	std_logic_port FPU_IBIT_GO(PD_OUT, loader, "FPU_IBIT_GO");
// FPU interfaces end

// Texture Sampler interface begin
	std_logic_vector_port<96> TEXSAMP_OutFIFO_wr_data(PD_OUT, loader, "TEXSAMP_OutFIFO_wr_data");
	std_logic_port TEXSAMP_OutFIFO_full(PD_IN, loader, "TEXSAMP_OutFIFO_full");
	std_logic_port TEXSAMP_OutFIFO_wr_en(PD_OUT, loader, "TEXSAMP_OutFIFO_wr_en");
// Texture Sampler interface end

// Debug signals
	std_logic_vector_port<7> DBG_AttrInterpolator_State(PD_OUT, loader, "DBG_AttrInterpolator_State");
	std_logic_vector_port<32> DBG_RastBarycentricB(PD_OUT, loader, "DBG_RastBarycentricB");
	std_logic_vector_port<32> DBG_RastBarycentricC(PD_OUT, loader, "DBG_RastBarycentricC");

	FPU attrInterpFPU(0);

	bool successResult = true;

	srand(3); // Pick a stable seed so we get consistent random results

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		CMD_UseFlatShading = false;
		FPU_OUT = 0.0f;
		DINTERP_NewPixelValid = false;
		TEXSAMP_OutFIFO_full = false;
	}

	auto simulateRTLAttributeInterp = [&](const triSetupOutput& triSetupData, const std::vector<depthInterpOutputData>& depthInterpData, std::vector<attributeInterpOutputData>& outAttributeInterpData)
	{
		triSetupData.DeserializeTriSetupOutput(DINTERP_TX0, DINTERP_TX10, DINTERP_TX20, DINTERP_TY0, DINTERP_TY10, DINTERP_TY20, DINTERP_VC0, DINTERP_VC10, DINTERP_VC20);

		const unsigned numPixels = (const unsigned)depthInterpData.size();
		for (unsigned x = 0; x < numPixels; ++x)
		{
			const depthInterpOutputData& thisPixelData = depthInterpData[x];

			// Wait for the attribute interpolator core to be ready for a new pixel:
			while (!DINTERP_ReadyForNewPixel.GetBoolVal() )
			{
				scoped_timestep time(loader, clk, 100);
			}

			thisPixelData.Deserialize(DINTERP_PosX, DINTERP_PosY, DINTERP_NormalizedBarycentricB, DINTERP_NormalizedBarycentricC, DINTERP_OutPixelW);

			// Just pulse this "go signal" for one clock cycle:
			{
				scoped_timestep time(loader, clk, 100);
				DINTERP_NewPixelValid = true;
			}
			{
				scoped_timestep time(loader, clk, 100);
				DINTERP_NewPixelValid = false;
			}

			while (!TEXSAMP_OutFIFO_wr_en.GetBoolVal() )
			{
				scoped_timestep time(loader, clk, 100);

				attrInterpFPU.Update(FPU_ISHFT_GO, FPU_IMUL_GO, FPU_IADD_GO, FPU_ICMP_GO, FPU_ISPEC_GO, FPU_ICNV_GO, FPU_IBIT_GO, FPU_A, FPU_B, FPU_Mode, FPU_OUT);
				UpdateOutputFIFO(outAttributeInterpData, TEXSAMP_OutFIFO_wr_data, TEXSAMP_OutFIFO_full, TEXSAMP_OutFIFO_wr_en);
			}

			while (TEXSAMP_OutFIFO_wr_en.GetBoolVal() )
			{
				scoped_timestep time(loader, clk, 100);
				attrInterpFPU.Update(FPU_ISHFT_GO, FPU_IMUL_GO, FPU_IADD_GO, FPU_ICMP_GO, FPU_ISPEC_GO, FPU_ICNV_GO, FPU_IBIT_GO, FPU_A, FPU_B, FPU_Mode, FPU_OUT);
				UpdateOutputFIFO(outAttributeInterpData, TEXSAMP_OutFIFO_wr_data, TEXSAMP_OutFIFO_full, TEXSAMP_OutFIFO_wr_en);
			}
		}
	};

	auto runAttributeInterpTest = [&](const triSetupOutput& triSetupData, const std::vector<depthInterpOutputData>& depthInterpOutput, const bool validateTexcoordsNormalized) -> bool
	{
		std::vector<attributeInterpOutputData> emulatedCPUAttributeInterpData;
		std::vector<attributeInterpOutputData> simulatedRTLDepthInterpData;
		EmulateAttributeInterpCPU(triSetupData, depthInterpOutput, validateTexcoordsNormalized, emulatedCPUAttributeInterpData);
		simulateRTLAttributeInterp(triSetupData, depthInterpOutput, simulatedRTLDepthInterpData);

		if (depthInterpOutput.size() != emulatedCPUAttributeInterpData.size() )
		{
			__debugbreak();
			return false;
		}

		const unsigned numOutputPixels = (const unsigned)emulatedCPUAttributeInterpData.size();
		for (unsigned x = 0; x < numOutputPixels; ++x)
		{
			const attributeInterpOutputData& emulatedCPUPixel = emulatedCPUAttributeInterpData[x];
			const attributeInterpOutputData& simulatedRTLPixel = simulatedRTLDepthInterpData[x];

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
	auto testSimpleDrawCall = [&](const testVert* const vertices, const unsigned short* const indicesCCW, const unsigned numPrims, const bool randomAttributes = false)
	{
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

			UntransformViewport(primTriData);

			std::vector<triSetupInput> unclippedTris;
			unclippedTris.push_back(primTriData);
			std::vector<triSetupInput> clippedTris;
			EmulateCPUClipper(unclippedTris, clippedTris);

			const unsigned numClippedTris = (const unsigned)clippedTris.size();
			for (unsigned y = 0; y < numClippedTris; ++y)
			{
				const triSetupInput& thisClippedTri = clippedTris[y];

				triSetupOutput triSetupData;
				if (EmulateCPUTriSetup(thisClippedTri, triSetupData) != triSetup_OK) // If this fails, then it's because our triangle got culled or backface-killed or something
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
				EmulateDepthInterpCPU(triSetupData, rasterizedPixels, emulatedCPUDepthInterpData);

				successResult &= runAttributeInterpTest(triSetupData, emulatedCPUDepthInterpData, !randomAttributes);
			}
		}
	};

	{
		const unsigned short fullTriangle0IB[] = { 0, 1, 2 };
		testSimpleDrawCall(fullTriangle0, fullTriangle0IB, ARRAYSIZE(fullTriangle0IB) / 3);
	}

	// Test case with three triangles that share a single vertex:
	{
		static const unsigned short sharedVertex3TrianglesIndices[] =
		{
			0, 1, 2,
			0, 2, 3,
			0, 3, 4
		};
		testSimpleDrawCall(threeTrisSharedVertex, sharedVertex3TrianglesIndices, ARRAYSIZE(sharedVertex3TrianglesIndices) / 3);
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

			const bool useRandomAttributes = true;
			testSimpleDrawCall(verts, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3, useRandomAttributes);
		}
	}

	return successResult ? S_OK : E_FAIL;
}
