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
	init, // 0
	waitingForRead, // 1

	multBarycentricsAndAttr0, // 2
	multBarycentricsAndAttr1, // 3
	multBarycentricsAndAttr2, // 4
	multBarycentricsAndAttr3, // 5
	multBarycentricsAndAttr4, // 6
	multBarycentricsAndAttr5, // 7
	multBarycentricsAndAttr6, // 8
	multBarycentricsAndAttr7, // 9
	multBarycentricsAndAttr8, // 10
	multBarycentricsAndAttr9, // 11
	multBarycentricsAndAttr10, // 12
	multBarycentricsAndAttr11, // 13
	multBarycentricsAndAttr12, // 14
	multBarycentricsAndAttr13, // 15
	multBarycentricsAndAttr14, // 16
	multBarycentricsAndAttr15, // 17
	multBarycentricsAndAttr16, // 18
	multBarycentricsAndAttr17, // 19

	addDotProductTerms0, // 20
	addDotProductTerms1, // 21
	addDotProductTerms2, // 22
	addDotProductTerms3, // 23
	addDotProductTerms4, // 24
	addDotProductTerms5, // 25
	addDotProductTerms6, // 26
	addDotProductTerms7, // 27
	addDotProductTerms8, // 28
	addDotProductTerms9, // 29
	addDotProductTerms10, // 30
	addDotProductTerms11, // 31
	addDotProductTerms12, // 32
	addDotProductTerms13, // 33
	addDotProductTerms14, // 34
	addDotProductTerms15, // 35
	addDotProductTerms16, // 36

	multiplyPixelW0, // 37
	multiplyPixelW1, // 38
	multiplyPixelW2, // 39
	multiplyPixelW3, // 40
	multiplyPixelW4, // 41
	multiplyPixelW5, // 42
	multiplyPixelW6, // 43
	multiplyPixelW7, // 44
	multiplyPixelW8, // 45
	multiplyPixelW9, // 46
	multiplyPixelW10, // 47
	multiplyPixelW11, // 48

	compressOutput0, // 49
	compressOutput1, // 50
	compressOutput2, // 51
	compressOutput3, // 52
	compressOutput4, // 53
	compressOutput5, // 54
	compressOutput6, // 55
	compressOutput7, // 56
	compressOutput8, // 57
	compressOutput9, // 58
	compressOutput10, // 59
	compressOutput11, // 60

	waitingForWrite // 61
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

void EmulateAttributeInterpCPU(const triSetupOutput& triSetupData, const std::vector<depthInterpOutputData>& depthInterpData, std::vector<attributeInterpOutputData>& outAttributeInterpData)
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

		const D3DXVECTOR4 vc0divW = vc0;
		const D3DXVECTOR4 vc10divW = vc10;
		const D3DXVECTOR4 vc20divW = vc20;

		const D3DXVECTOR4 vcSum10 = thisPixelData.normalizedBarycentricB * vc10divW;
		const D3DXVECTOR4 vcSum20 = thisPixelData.normalizedBarycentricC * vc20divW;
		const D3DXVECTOR4 dotProdVertColor = vcSum10 + vcSum20 + vc0divW;

		const D3DXVECTOR4 interpolatedVertColor = dotProdVertColor * thisPixelData.interpolatedPixelW;

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

	auto runAttributeInterpTest = [&](const triSetupOutput& triSetupData, const std::vector<depthInterpOutputData>& depthInterpOutput) -> bool
	{
		std::vector<attributeInterpOutputData> emulatedCPUAttributeInterpData;
		std::vector<attributeInterpOutputData> simulatedRTLDepthInterpData;
		EmulateAttributeInterpCPU(triSetupData, depthInterpOutput, emulatedCPUAttributeInterpData);
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
			primTriData.v0.invZ = 2.0f;
			primTriData.v0.invW = 1.0f;
			primTriData.v0.xTex = 0.0f;
			primTriData.v0.yTex = 1.0f;
			primTriData.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
			primTriData.v1.xPos = vertices[indicesCCW[x * 3 + 2] ].posX;
			primTriData.v1.yPos = vertices[indicesCCW[x * 3 + 2] ].posY;
			primTriData.v1.invZ = 2.0f;
			primTriData.v1.invW = 1.0f;
			primTriData.v1.xTex = 1.0f;
			primTriData.v1.yTex = 0.0f;
			primTriData.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
			primTriData.v2.xPos = vertices[indicesCCW[x * 3 + 1] ].posX;
			primTriData.v2.yPos = vertices[indicesCCW[x * 3 + 1] ].posY;
			primTriData.v2.invZ = 2.0f;
			primTriData.v2.invW = 1.0f;
			primTriData.v2.xTex = 0.0f;
			primTriData.v2.yTex = 0.0f;
			primTriData.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };
			if (randomAttributes)
			{
				const float randomZ0 = frand() * 0.5f + 0.5f; // We currently only support depth values between 0.5f and 1.0f
				const float randomZ1 = frand() * 0.5f + 0.5f;
				const float randomZ2 = frand() * 0.5f + 0.5f;
				primTriData.v0.invZ = 1.0f / randomZ0;
				primTriData.v1.invZ = 1.0f / randomZ1;
				primTriData.v2.invZ = 1.0f / randomZ2;

				const float randomW0 = frand() * 0.5f + 0.5f; // We currently only support W values between 0.5f and 1.0f
				const float randomW1 = frand() * 0.5f + 0.5f;
				const float randomW2 = frand() * 0.5f + 0.5f;
				primTriData.v0.invW = 1.0f / randomW0;
				primTriData.v1.invW = 1.0f / randomW1;
				primTriData.v2.invW = 1.0f / randomW2;

				primTriData.v0.rgba = { frand(), frand(), frand(), frand() };
				primTriData.v1.rgba = { frand(), frand(), frand(), frand() };
				primTriData.v2.rgba = { frand(), frand(), frand(), frand() };

				primTriData.v0.xTex = frand() * 32.0f - 16.0f;
				primTriData.v0.yTex = frand() * 32.0f - 16.0f;
				primTriData.v1.xTex = frand() * 32.0f - 16.0f;
				primTriData.v1.yTex = frand() * 32.0f - 16.0f;
				primTriData.v2.xTex = frand() * 32.0f - 16.0f;
				primTriData.v2.yTex = frand() * 32.0f - 16.0f;
			}

			// Emulate the vertex shader by pre-dividing the perspective-interpolated attributes by W:
			primTriData.v0.xTex *= primTriData.v0.invW;
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
			primTriData.v2.rgba.a *= primTriData.v2.invW;

			triSetupOutput triSetupData;
			if (EmulateCPUTriSetup(primTriData, triSetupData) != triSetup_OK) // If this fails, then it's because our triangle got culled or clipped or backface-killed or something
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

			successResult &= runAttributeInterpTest(triSetupData, emulatedCPUDepthInterpData);
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
