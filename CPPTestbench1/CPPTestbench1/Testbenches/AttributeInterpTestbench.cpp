#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "../D3DTriRasterizeTestData.h"
#include "ShaderCoreALUCommon.h"
#include "PixelPipelineShared.h"
#include <vector>
#include <DirectXMath.h>
#include <DirectXPackedVector.h>

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

	convertVertexAttributes0, // 2
	convertVertexAttributes1, // 3
	convertVertexAttributes2, // 4
	convertVertexAttributes3, // 5
	convertVertexAttributes4, // 6
	convertVertexAttributes5, // 7
	convertVertexAttributes6, // 8
	convertVertexAttributes7, // 9
	convertVertexAttributes8, // 10
	convertVertexAttributes9, // 11

	multBarycentricsAndAttr0, // 12
	multBarycentricsAndAttr1, // 13
	multBarycentricsAndAttr2, // 14
	multBarycentricsAndAttr3, // 15
	multBarycentricsAndAttr4, // 16
	multBarycentricsAndAttr5, // 17
	multBarycentricsAndAttr6, // 18
	multBarycentricsAndAttr7, // 19
	multBarycentricsAndAttr8, // 20
	multBarycentricsAndAttr9, // 21
	multBarycentricsAndAttr10, // 22
	multBarycentricsAndAttr11, // 23
	multBarycentricsAndAttr12, // 24
	multBarycentricsAndAttr13, // 25
	multBarycentricsAndAttr14, // 26
	multBarycentricsAndAttr15, // 27
	multBarycentricsAndAttr16, // 28
	multBarycentricsAndAttr17, // 29
	multBarycentricsAndAttr18, // 30
	multBarycentricsAndAttr19, // 31
	multBarycentricsAndAttr20, // 32
	multBarycentricsAndAttr21, // 33
	multBarycentricsAndAttr22, // 34
	multBarycentricsAndAttr23, // 35

	addDotProductTerms0, // 36
	addDotProductTerms1, // 37
	addDotProductTerms2, // 38
	addDotProductTerms3, // 39
	addDotProductTerms4, // 40
	addDotProductTerms5, // 41
	addDotProductTerms6, // 42
	addDotProductTerms7, // 43
	addDotProductTerms8, // 44
	addDotProductTerms9, // 45
	addDotProductTerms10, // 46
	addDotProductTerms11, // 47
	addDotProductTerms12, // 48
	addDotProductTerms13, // 49
	addDotProductTerms14, // 50
	addDotProductTerms15, // 51
	addDotProductTerms16, // 52

	multiplyPixelDepth0, // 53
	multiplyPixelDepth1, // 54
	multiplyPixelDepth2, // 55
	multiplyPixelDepth3, // 56
	multiplyPixelDepth4, // 57
	multiplyPixelDepth5, // 58
	multiplyPixelDepth6, // 59
	multiplyPixelDepth7, // 60
	multiplyPixelDepth8, // 61
	multiplyPixelDepth9, // 62
	multiplyPixelDepth10, // 63
	multiplyPixelDepth11, // 64

	compressOutput0, // 65
	compressOutput1, // 66
	compressOutput2, // 67
	compressOutput3, // 68
	compressOutput4, // 69
	compressOutput5, // 70
	compressOutput6, // 71
	compressOutput7, // 72
	compressOutput8, // 73
	compressOutput9, // 74
	compressOutput10, // 75
	compressOutput11, // 76

	waitingForWrite // 77
};

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

static void ConvertD3DCOLORToFloat4(const D3DCOLOR inColor, float& outColorX, float& outColorY, float& outColorZ, float& outColorW)
{
	const unsigned ub = inColor & 0xFF;
	const unsigned ug = (inColor >> 8) & 0xFF;
	const unsigned ur = (inColor >> 16) & 0xFF;
	const unsigned ua = (inColor >> 24) & 0xFF;
	outColorX = ur / 255.0f;
	outColorY = ug / 255.0f;
	outColorZ = ub / 255.0f;
	outColorW = ua / 255.0f;
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
	D3DXVECTOR2 tex0, tex1, tex2;
	tex0.x = DirectX::PackedVector::XMConvertHalfToFloat(triSetupData.v0.xTex);
	tex0.y = DirectX::PackedVector::XMConvertHalfToFloat(triSetupData.v0.yTex);
	tex1.x = DirectX::PackedVector::XMConvertHalfToFloat(triSetupData.v1.xTex);
	tex1.y = DirectX::PackedVector::XMConvertHalfToFloat(triSetupData.v1.yTex);
	tex2.x = DirectX::PackedVector::XMConvertHalfToFloat(triSetupData.v2.xTex);
	tex2.y = DirectX::PackedVector::XMConvertHalfToFloat(triSetupData.v2.yTex);
	D3DXVECTOR4 vc0, vc1, vc2;
	ConvertCOLOR4ToFloat4(triSetupData.v0.rgba, vc0.x, vc0.y, vc0.z, vc0.w);
	ConvertCOLOR4ToFloat4(triSetupData.v1.rgba, vc1.x, vc1.y, vc1.z, vc1.w);
	ConvertCOLOR4ToFloat4(triSetupData.v2.rgba, vc2.x, vc2.y, vc2.z, vc2.w);

	const unsigned numPixels = (const unsigned)depthInterpData.size();
	for (unsigned x = 0; x < numPixels; ++x)
	{
		const depthInterpOutputData& thisPixelData = depthInterpData[x];

		const D3DXVECTOR2 texSum0 = thisPixelData.normalizedBarycentricDivZ0 * tex0;
		const D3DXVECTOR2 texSum1 = thisPixelData.normalizedBarycentricDivZ1 * tex1;
		const D3DXVECTOR2 texSum2 = thisPixelData.normalizedBarycentricDivZ2 * tex2;
		const D3DXVECTOR2 dotProdTex = texSum0 + texSum1 + texSum2;
		const D3DXVECTOR2 interpolatedTexcoord = dotProdTex * thisPixelData.interpolatedPixelDepth;

		const D3DXVECTOR4 vcSum0 = thisPixelData.normalizedBarycentricDivZ0 * vc0;
		const D3DXVECTOR4 vcSum1 = thisPixelData.normalizedBarycentricDivZ1 * vc1;
		const D3DXVECTOR4 vcSum2 = thisPixelData.normalizedBarycentricDivZ2 * vc2;
		const D3DXVECTOR4 dotProdVertColor = vcSum0 + vcSum1 + vcSum2;
		const D3DXVECTOR4 interpolatedVertColor = dotProdVertColor * thisPixelData.interpolatedPixelDepth;

		attributeInterpOutputData outInterpolatedData;
		outInterpolatedData.pixelX = thisPixelData.pixelX;
		outInterpolatedData.pixelY = thisPixelData.pixelY;
		outInterpolatedData.texcoordX = ConvertFloatToUNORM16(interpolatedTexcoord.x);
		outInterpolatedData.texcoordY = ConvertFloatToUNORM16(interpolatedTexcoord.y);
		ConvertFloat4ToUBYTE4(interpolatedVertColor, outInterpolatedData.vertexColorRGBA);
		outAttributeInterpData.push_back(outInterpolatedData);
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

// Attribute Interpolator interface begin
	std_logic_port DINTERP_ReadyForNewPixel(PD_OUT, loader, "DINTERP_ReadyForNewPixel");
	std_logic_port DINTERP_NewPixelValid(PD_IN, loader, "DINTERP_NewPixelValid");
	std_logic_vector_port<10> DINTERP_PosX(PD_IN, loader, "DINTERP_PosX");
	std_logic_vector_port<10> DINTERP_PosY(PD_IN, loader, "DINTERP_PosY");
	std_logic_vector_port<16> DINTERP_TX0(PD_IN, loader, "DINTERP_TX0");
	std_logic_vector_port<16> DINTERP_TY0(PD_IN, loader, "DINTERP_TY0");
	std_logic_vector_port<16> DINTERP_TX1(PD_IN, loader, "DINTERP_TX1");
	std_logic_vector_port<16> DINTERP_TY1(PD_IN, loader, "DINTERP_TY1");
	std_logic_vector_port<16> DINTERP_TX2(PD_IN, loader, "DINTERP_TX2");
	std_logic_vector_port<16> DINTERP_TY2(PD_IN, loader, "DINTERP_TY2");
	std_logic_vector_port<32> DINTERP_VC0(PD_IN, loader, "DINTERP_VC0");
	std_logic_vector_port<32> DINTERP_VC1(PD_IN, loader, "DINTERP_VC1");
	std_logic_vector_port<32> DINTERP_VC2(PD_IN, loader, "DINTERP_VC2");
	std_logic_vector_port<32> DINTERP_NormalizedBarycentricDivZ0(PD_IN, loader, "DINTERP_NormalizedBarycentricDivZ0");
	std_logic_vector_port<32> DINTERP_NormalizedBarycentricDivZ1(PD_IN, loader, "DINTERP_NormalizedBarycentricDivZ1");
	std_logic_vector_port<32> DINTERP_NormalizedBarycentricDivZ2(PD_IN, loader, "DINTERP_NormalizedBarycentricDivZ2");
	std_logic_vector_port<32> DINTERP_OutPixelDepth(PD_IN, loader, "DINTERP_OutPixelDepth");
// Attribute Interpolator interface end

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

// UNORM8ToFloat signals begin
	std_logic_port UNORM8ToFloat_Enable(PD_OUT, loader, "UNORM8ToFloat_Enable");
	std_logic_vector_port<32> UNORM8ToFloat_ColorIn(PD_OUT, loader, "UNORM8ToFloat_ColorIn");
	std_logic_vector_port<32> UNORM8ToFloat_ConvertedX(PD_IN, loader, "UNORM8ToFloat_ConvertedX");
	std_logic_vector_port<32> UNORM8ToFloat_ConvertedY(PD_IN, loader, "UNORM8ToFloat_ConvertedY");
	std_logic_vector_port<32> UNORM8ToFloat_ConvertedZ(PD_IN, loader, "UNORM8ToFloat_ConvertedZ");
	std_logic_vector_port<32> UNORM8ToFloat_ConvertedW(PD_IN, loader, "UNORM8ToFloat_ConvertedW");
// UNORM8ToFloat signals end

// Texture Sampler interface begin
	std_logic_vector_port<16> TEXSAMP_outInterpolatedTexcoordX(PD_OUT, loader, "TEXSAMP_outInterpolatedTexcoordX");
	std_logic_vector_port<16> TEXSAMP_outInterpolatedTexcoordY(PD_OUT, loader, "TEXSAMP_outInterpolatedTexcoordY");
	std_logic_vector_port<32> TEXSAMP_outInterpolatedColorRGBA(PD_OUT, loader, "TEXSAMP_outInterpolatedColorRGBA");
	std_logic_vector_port<16> TEXSAMP_outPixelX(PD_OUT, loader, "TEXSAMP_outPixelX");
	std_logic_vector_port<16> TEXSAMP_outPixelY(PD_OUT, loader, "TEXSAMP_outPixelY");

	std_logic_port TEXSAMP_writeIsValid(PD_OUT, loader, "TEXSAMP_writeIsValid");
	std_logic_port TEXSAMP_readyForWrite(PD_IN, loader, "TEXSAMP_readyForWrite");
// Texture Sampler interface end

// Debug signals
	std_logic_vector_port<7> DBG_AttrInterpolator_State(PD_OUT, loader, "DBG_AttrInterpolator_State");
	std_logic_vector_port<32> DBG_RastBarycentricA(PD_OUT, loader, "DBG_RastBarycentricA");
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
		UNORM8ToFloat_ConvertedX = 0.0f;
		UNORM8ToFloat_ConvertedY = 0.0f;
		UNORM8ToFloat_ConvertedZ = 0.0f;
		UNORM8ToFloat_ConvertedW = 0.0f;
		TEXSAMP_readyForWrite = true;
	}

	auto simulateRTLAttributeInterp = [&](const triSetupOutput& triSetupData, const std::vector<depthInterpOutputData>& depthInterpData, std::vector<attributeInterpOutputData>& outAttributeInterpData)
	{
		triSetupData.DeserializeTriSetupOutput(DINTERP_TX0, DINTERP_TX1, DINTERP_TX2, DINTERP_TY0, DINTERP_TY1, DINTERP_TY2, DINTERP_VC0, DINTERP_VC1, DINTERP_VC2);

		const unsigned numPixels = (const unsigned)depthInterpData.size();
		for (unsigned x = 0; x < numPixels; ++x)
		{
			const depthInterpOutputData& thisPixelData = depthInterpData[x];

			// Wait for the attribute interpolator core to be ready for a new pixel:
			while (!DINTERP_ReadyForNewPixel.GetBoolVal() )
			{
				scoped_timestep time(loader, clk, 100);
			}

			thisPixelData.Deserialize(DINTERP_PosX, DINTERP_PosY, DINTERP_NormalizedBarycentricDivZ0, DINTERP_NormalizedBarycentricDivZ1, DINTERP_NormalizedBarycentricDivZ2, DINTERP_OutPixelDepth);

			// Just pulse this "go signal" for one clock cycle:
			{
				scoped_timestep time(loader, clk, 100);
				DINTERP_NewPixelValid = true;
			}
			{
				scoped_timestep time(loader, clk, 100);
				DINTERP_NewPixelValid = false;
			}

			// Buffer these to simulate a one cycle latency on the D3DCOLOR to Float4 conversion:
			float convertedColorsLastCycle[4] = {0};

			while (!TEXSAMP_writeIsValid.GetBoolVal() )
			{
				scoped_timestep time(loader, clk, 100);

				attrInterpFPU.Update(FPU_ISHFT_GO, FPU_IMUL_GO, FPU_IADD_GO, FPU_ICMP_GO, FPU_ISPEC_GO, FPU_ICNV_GO, FPU_IBIT_GO, FPU_A, FPU_B, FPU_Mode, FPU_OUT);

				UNORM8ToFloat_ConvertedX = convertedColorsLastCycle[0];
				UNORM8ToFloat_ConvertedY = convertedColorsLastCycle[1];
				UNORM8ToFloat_ConvertedZ = convertedColorsLastCycle[2];
				UNORM8ToFloat_ConvertedW = convertedColorsLastCycle[3];

				if (UNORM8ToFloat_Enable.GetBoolVal() )
				{
					const D3DCOLOR convertColor = UNORM8ToFloat_ColorIn.GetUint32Val();
					float convertedX = 0.0f;
					float convertedY = 0.0f;
					float convertedZ = 0.0f;
					float convertedW = 0.0f;
					ConvertD3DCOLORToFloat4(convertColor, convertedX, convertedY, convertedZ, convertedW);
					convertedColorsLastCycle[0] = convertedX;
					convertedColorsLastCycle[1] = convertedY;
					convertedColorsLastCycle[2] = convertedZ;
					convertedColorsLastCycle[3] = convertedW;
				}
				else
				{
					convertedColorsLastCycle[0] = 0.0f;
					convertedColorsLastCycle[1] = 0.0f;
					convertedColorsLastCycle[2] = 0.0f;
					convertedColorsLastCycle[3] = 0.0f;
				}
			}

			attributeInterpOutputData newOutData;
			newOutData.Serialize(TEXSAMP_outPixelX, TEXSAMP_outPixelY, TEXSAMP_outInterpolatedTexcoordX, TEXSAMP_outInterpolatedTexcoordY, TEXSAMP_outInterpolatedColorRGBA);
			outAttributeInterpData.push_back(newOutData);
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
			primTriData.v0.xPos = (const signed short)(vertices[indicesCCW[x * 3] ].posX + 0.5f);
			primTriData.v0.yPos = (const signed short)(vertices[indicesCCW[x * 3] ].posY + 0.5f);
			primTriData.v0.invZ = 2.0f;
			primTriData.v0.xTex = DirectX::PackedVector::XMConvertFloatToHalf(0.0f);
			primTriData.v0.yTex = DirectX::PackedVector::XMConvertFloatToHalf(1.0f);
			primTriData.v0.rgba = COLOR4_ARGB(255, 255, 0, 0);
			primTriData.v1.xPos = (const signed short)(vertices[indicesCCW[x * 3 + 2] ].posX + 0.5f);
			primTriData.v1.yPos = (const signed short)(vertices[indicesCCW[x * 3 + 2] ].posY + 0.5f);
			primTriData.v1.invZ = 2.0f;
			primTriData.v1.xTex = DirectX::PackedVector::XMConvertFloatToHalf(1.0f);
			primTriData.v1.yTex = DirectX::PackedVector::XMConvertFloatToHalf(0.0f);
			primTriData.v1.rgba = COLOR4_ARGB(255, 0, 255, 0);
			primTriData.v2.xPos = (const signed short)(vertices[indicesCCW[x * 3 + 1] ].posX + 0.5f);
			primTriData.v2.yPos = (const signed short)(vertices[indicesCCW[x * 3 + 1] ].posY + 0.5f);
			primTriData.v2.invZ = 2.0f;
			primTriData.v2.xTex = DirectX::PackedVector::XMConvertFloatToHalf(0.0f);
			primTriData.v2.yTex = DirectX::PackedVector::XMConvertFloatToHalf(0.0f);
			primTriData.v2.rgba = COLOR4_ARGB(255, 0, 0, 255);
			if (randomAttributes)
			{
				const float randomZ0 = frand() * 0.5f + 0.5f; // We currently only support depth values between 0.5f and 1.0f
				const float randomZ1 = frand() * 0.5f + 0.5f;
				const float randomZ2 = frand() * 0.5f + 0.5f;
				primTriData.v0.invZ = 1.0f / randomZ0;
				primTriData.v1.invZ = 1.0f / randomZ1;
				primTriData.v2.invZ = 1.0f / randomZ2;

				primTriData.v0.rgba = COLOR4_ARGB(rand() & 0xFF, rand() & 0xFF, rand() & 0xFF, rand() & 0xFF);
				primTriData.v1.rgba = COLOR4_ARGB(rand() & 0xFF, rand() & 0xFF, rand() & 0xFF, rand() & 0xFF);
				primTriData.v2.rgba = COLOR4_ARGB(rand() & 0xFF, rand() & 0xFF, rand() & 0xFF, rand() & 0xFF);

				primTriData.v0.xTex = DirectX::PackedVector::XMConvertFloatToHalf(frand() * 32.0f - 16.0f);
				primTriData.v0.yTex = DirectX::PackedVector::XMConvertFloatToHalf(frand() * 32.0f - 16.0f);
				primTriData.v1.xTex = DirectX::PackedVector::XMConvertFloatToHalf(frand() * 32.0f - 16.0f);
				primTriData.v1.yTex = DirectX::PackedVector::XMConvertFloatToHalf(frand() * 32.0f - 16.0f);
				primTriData.v2.xTex = DirectX::PackedVector::XMConvertFloatToHalf(frand() * 32.0f - 16.0f);
				primTriData.v2.yTex = DirectX::PackedVector::XMConvertFloatToHalf(frand() * 32.0f - 16.0f);
			}
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
