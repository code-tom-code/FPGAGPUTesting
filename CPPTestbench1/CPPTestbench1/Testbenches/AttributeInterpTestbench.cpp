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
extern bool enableDebugOutput;

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

	dispatchNewPixel, // 1
	dispatchNewSpecialMessage, // 2
	waitingForWrite, // 3
	setNewPrimitive, // 4
	terminateCurrentPrimitive // 5
};

enum InterpolatorStateType
{
	IS_TX, // 0
	IS_TY, // 1
	IS_R, // 2
	IS_G, // 3
	IS_B, // 4
	IS_A // 5
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

void EmulateAttributeInterpCPU(const AttrInterpTriCache& attrTriCache, const std::vector<depthInterpOutputData>& depthInterpData, const bool validateNormalizedTexcoords, std::vector<attributeInterpOutputData>& outAttributeInterpData)
{
	AttrInterpTriCache attrTriCacheLocalCopy = attrTriCache;

	D3DXVECTOR2 tex0, tex10, tex20;
	D3DXVECTOR4 vc0, vc10, vc20;

	const unsigned numPixels = (const unsigned)depthInterpData.size();
	for (unsigned x = 0; x < numPixels; ++x)
	{
		const depthInterpOutputData& thisPixelData = depthInterpData[x];
		if (IsSpecialCodePixel(thisPixelData.pixelX) )
		{
			if (thisPixelData.pixelX == startNewTriangleSlotCommand)
			{
				const AttrInterpTriCache::AttrTriCacheData& currentTriData = attrTriCacheLocalCopy.dataFifo.front();
				tex0.x = currentTriData.TX0;
				tex0.y = currentTriData.TY0;
				tex10.x = currentTriData.TX10;
				tex10.y = currentTriData.TY10;
				tex20.x = currentTriData.TX20;
				tex20.y = currentTriData.TY20;
				vc0.x = currentTriData.RGBA0.r;
				vc0.y = currentTriData.RGBA0.g;
				vc0.z = currentTriData.RGBA0.b;
				vc0.w = currentTriData.RGBA0.a;
				vc10.x = currentTriData.RGBA10.r;
				vc10.y = currentTriData.RGBA10.g;
				vc10.z = currentTriData.RGBA10.b;
				vc10.w = currentTriData.RGBA10.a;
				vc20.x = currentTriData.RGBA20.r;
				vc20.y = currentTriData.RGBA20.g;
				vc20.z = currentTriData.RGBA20.b;
				vc20.w = currentTriData.RGBA20.a;
			}
			else if (thisPixelData.pixelX == finishCurrentTriangleCommand)
			{
				attrTriCacheLocalCopy.dataFifo.erase(attrTriCacheLocalCopy.dataFifo.begin() );
			}

			// Don't pass these messages along to the next stage since subsequent stages just ignore these messages anyway
			continue;
		}

		const D3DXVECTOR2 t0divW = tex0;
		const D3DXVECTOR2 t10divW = tex10;
		const D3DXVECTOR2 t20divW = tex20;

		const D3DXVECTOR2 texSum10 = thisPixelData.normalizedBarycentricB * t10divW;
		const D3DXVECTOR2 texSum20 = thisPixelData.normalizedBarycentricC * t20divW;
		const D3DXVECTOR2 dotProdTex = texSum10 + texSum20 + t0divW;

		D3DXVECTOR2 interpolatedTexcoord = dotProdTex * thisPixelData.interpolatedPixelW;

		if (validateNormalizedTexcoords)
		{
			// Add a tiny epsilon to account for occasional floating point imprecision causing the attribute interpolation to go very slightly out of bounds:
			if (interpolatedTexcoord.x > 1.00000025f || interpolatedTexcoord.x < -0.00000025f || interpolatedTexcoord.y > 1.00000025f || interpolatedTexcoord.y < -0.00000025f)
			{
				__debugbreak();
			}
		}

		// Clamp our texcoords:
		/*if (interpolatedTexcoord.x > 1.0f)
			interpolatedTexcoord.x = 1.0f;
		else if (interpolatedTexcoord.x < 0.0f)
			interpolatedTexcoord.x = 0.0f;
		if (interpolatedTexcoord.y > 1.0f)
			interpolatedTexcoord.y = 1.0f;
		else if (interpolatedTexcoord.y < 0.0f)
			interpolatedTexcoord.y = 0.0f;*/

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

static const unsigned CountPixelsNotIncludingSpecials(const std::vector<depthInterpOutputData>& depthInterpFIFOData)
{
	unsigned countPixels = 0;
	const unsigned numMessages = (const unsigned)depthInterpFIFOData.size();
	for (unsigned x = 0; x < numMessages; ++x)
	{
		if (!IsSpecialCodePixel(depthInterpFIFOData[x].pixelX) )
		{
			++countPixels;
		}
	}
	return countPixels;
}

const int RunTestsAttributeInterp(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

// Depth Interpolator interface begin
	std_logic_vector_port<128> DINTERP_FIFO_rd_data(PD_IN, loader, "DINTERP_FIFO_rd_data");
	std_logic_port DINTERP_FIFO_empty(PD_IN, loader, "DINTERP_FIFO_empty");
	std_logic_port DINTERP_FIFO_rd_en(PD_OUT, loader, "DINTERP_FIFO_rd_en");
// Depth Interpolator interface end

// Triangle Cache interfaces begin
	std_logic_vector_port<32> TRICACHE_inT0X(PD_IN, loader, "TRICACHE_inT0X");
	std_logic_vector_port<32> TRICACHE_inT0Y(PD_IN, loader, "TRICACHE_inT0Y");
	std_logic_vector_port<32> TRICACHE_inT10X(PD_IN, loader, "TRICACHE_inT10X");
	std_logic_vector_port<32> TRICACHE_inT10Y(PD_IN, loader, "TRICACHE_inT10Y");
	std_logic_vector_port<32> TRICACHE_inT20X(PD_IN, loader, "TRICACHE_inT20X");
	std_logic_vector_port<32> TRICACHE_inT20Y(PD_IN, loader, "TRICACHE_inT20Y");
	std_logic_vector_port<128> TRICACHE_inColorRGBA0(PD_IN, loader, "TRICACHE_inColorRGBA0");
	std_logic_vector_port<128> TRICACHE_inColorRGBA10(PD_IN, loader, "TRICACHE_inColorRGBA10");
	std_logic_vector_port<128> TRICACHE_inColorRGBA20(PD_IN, loader, "TRICACHE_inColorRGBA20");

	std_logic_port TRICACHE_PopTriangleSlot(PD_OUT, loader, "TRICACHE_PopTriangleSlot");
// Triangle Cache interfaces end

// Command Processor interface begin
	std_logic_port CMD_IsIdle(PD_OUT, loader, "CMD_IsIdle");
// Command Processor interface end

// FPU interfaces begin
	// MUL pipe for multiplication:
	std_logic_vector_port<32> FPU_MUL_A(PD_OUT, loader, "FPU_MUL_A");
	std_logic_vector_port<32> FPU_MUL_B(PD_OUT, loader, "FPU_MUL_B");
	std_logic_vector_port<32> FPU_MUL_OUT(PD_IN, loader, "FPU_MUL_OUT");
	std_logic_port FPU_MUL_GO(PD_OUT, loader, "FPU_MUL_GO");

	// First CNV pipe for float-to-int conversions and frac():
	std_logic_vector_port<32> FPU_CNV0_A(PD_OUT, loader, "FPU_CNV0_A");
	std_logic_vector_port<3> FPU_CNV0_Mode(PD_OUT, loader, "FPU_CNV0_Mode");
	std_logic_vector_port<32> FPU_CNV0_OUT(PD_IN, loader, "FPU_CNV0_OUT");
	std_logic_port FPU_CNV0_GO(PD_OUT, loader, "FPU_CNV0_GO");

	// Second CNV pipe for float-to-int conversions and frac():
	std_logic_vector_port<32> FPU_CNV1_A(PD_OUT, loader, "FPU_CNV1_A");
	std_logic_vector_port<3> FPU_CNV1_Mode(PD_OUT, loader, "FPU_CNV1_Mode");
	std_logic_vector_port<32> FPU_CNV1_OUT(PD_IN, loader, "FPU_CNV1_OUT");
	std_logic_port FPU_CNV1_GO(PD_OUT, loader, "FPU_CNV1_GO");
// FPU interfaces end

// Texture Sampler interface begin
	std_logic_vector_port<96> TEXSAMP_OutFIFO_wr_data(PD_OUT, loader, "TEXSAMP_OutFIFO_wr_data");
	std_logic_port TEXSAMP_OutFIFO_full(PD_IN, loader, "TEXSAMP_OutFIFO_full");
	std_logic_port TEXSAMP_OutFIFO_wr_en(PD_OUT, loader, "TEXSAMP_OutFIFO_wr_en");
	std_logic_port TEXSAMP_OutFIFO_almost_full(PD_IN, loader, "TEXSAMP_OutFIFO_almost_full");
// Texture Sampler interface end

// Debug signals
	std_logic_vector_port<3> DBG_AttrInterpolator_State(PD_OUT, loader, "DBG_AttrInterpolator_State");
	std_logic_vector_port<3> DBG_InterpolatorDriver_State(PD_OUT, loader, "DBG_InterpolatorDriver_State");
	std_logic_vector_port<3> DBG_MultiplierDriver_State(PD_OUT, loader, "DBG_MultiplierDriver_State");
	std_logic_vector_port<3> DBG_ConverterDriver_State(PD_OUT, loader, "DBG_ConverterDriver_State");
	std_logic_vector_port<3> DBG_OutputDriver_State(PD_OUT, loader, "DBG_OutputDriver_State");
	std_logic_vector_port<32> DBG_PixelWFIFO(PD_OUT, loader, "DBG_PixelWFIFO");
	std_logic_vector_port<32> DBG_RastBarycentricB(PD_OUT, loader, "DBG_RastBarycentricB");
	std_logic_vector_port<32> DBG_RastBarycentricC(PD_OUT, loader, "DBG_RastBarycentricC");

	FPU attrInterpFPU_MUL(0);
	FPU attrInterpFPU_CNV0(0);
	FPU attrInterpFPU_CNV1(1);
	DepthInterpTriCache depthTriCache;
	AttrInterpTriCache triCache;
	unsigned totalTriCount = 0;
	unsigned totalPixelCount = 0;
	unsigned totalCycleCount = 0;

	bool successResult = true;

	srand(3); // Pick a stable seed so we get consistent random results

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		FPU_MUL_OUT = 0.0f;
		FPU_CNV0_OUT = 0.0f;
		FPU_CNV1_OUT = 0.0f;
		DINTERP_FIFO_empty = true;
		TEXSAMP_OutFIFO_full = false;
		TEXSAMP_OutFIFO_almost_full = false;
	}

	auto simulateRTLAttributeInterp = [&](const std::vector<depthInterpOutputData>& depthInterpData, std::vector<attributeInterpOutputData>& outAttributeInterpData)
	{
		DINTERP_FIFO_empty = true;

		std::vector<depthInterpOutputData> depthInterpLocalCopy = depthInterpData;

		triCache.Update(TRICACHE_PopTriangleSlot, TRICACHE_inT0X, TRICACHE_inT10X, TRICACHE_inT20X,
			TRICACHE_inT0Y, TRICACHE_inT10Y, TRICACHE_inT20Y,
			TRICACHE_inColorRGBA0, TRICACHE_inColorRGBA10, TRICACHE_inColorRGBA20);

		attrInterpStateType currentState = (const attrInterpStateType)DBG_AttrInterpolator_State.GetUint8Val();
		InterpolatorStateType currentInterpolatorState = (const InterpolatorStateType)DBG_InterpolatorDriver_State.GetUint8Val();
		InterpolatorStateType currentMultiplierState = (const InterpolatorStateType)DBG_MultiplierDriver_State.GetUint8Val();
		InterpolatorStateType currentConverterState = (const InterpolatorStateType)DBG_ConverterDriver_State.GetUint8Val();
		InterpolatorStateType currentOutputState = (const InterpolatorStateType)DBG_OutputDriver_State.GetUint8Val();
		float currentPixelWPop = DBG_PixelWFIFO.GetFloat32Val();

		const unsigned numPixels = (const unsigned)depthInterpData.size();
		while (!depthInterpLocalCopy.empty() )
		{
			DINTERP_FIFO_rd_data.SetStructVal(depthInterpLocalCopy.empty() ? depthInterpOutputData() : depthInterpLocalCopy.front() );
			DINTERP_FIFO_empty = depthInterpLocalCopy.empty();

			while (CMD_IsIdle.GetBoolVal() )
			{
				scoped_timestep time(loader, clk, 100);

				const depthInterpOutputData& thisPixelData = depthInterpLocalCopy.empty() ? depthInterpOutputData() : depthInterpLocalCopy.front();

				++totalCycleCount;
				currentState = (const attrInterpStateType)DBG_AttrInterpolator_State.GetUint8Val();
				currentInterpolatorState = (const InterpolatorStateType)DBG_InterpolatorDriver_State.GetUint8Val();
				currentMultiplierState = (const InterpolatorStateType)DBG_MultiplierDriver_State.GetUint8Val();
				currentConverterState = (const InterpolatorStateType)DBG_ConverterDriver_State.GetUint8Val();
				currentOutputState = (const InterpolatorStateType)DBG_OutputDriver_State.GetUint8Val();
				currentPixelWPop = DBG_PixelWFIFO.GetFloat32Val();

				if (DINTERP_FIFO_rd_en.GetBoolVal() )
				{
					depthInterpLocalCopy.erase(depthInterpLocalCopy.begin() );
					DINTERP_FIFO_rd_data.SetStructVal(depthInterpLocalCopy.empty() ? depthInterpOutputData() : depthInterpLocalCopy.front());
					DINTERP_FIFO_empty = depthInterpLocalCopy.empty();
				}

				attrInterpFPU_MUL.UpdateMulOnly(FPU_MUL_GO, FPU_MUL_A, FPU_MUL_B, FPU_MUL_OUT);
				attrInterpFPU_CNV0.UpdateCnvOnly(FPU_CNV0_GO, FPU_CNV0_Mode, FPU_CNV0_A, FPU_CNV0_OUT);
				attrInterpFPU_CNV1.UpdateCnvOnly(FPU_CNV1_GO, FPU_CNV1_Mode, FPU_CNV1_A, FPU_CNV1_OUT);
				triCache.Update(TRICACHE_PopTriangleSlot, TRICACHE_inT0X, TRICACHE_inT10X, TRICACHE_inT20X,
					TRICACHE_inT0Y, TRICACHE_inT10Y, TRICACHE_inT20Y,
					TRICACHE_inColorRGBA0, TRICACHE_inColorRGBA10, TRICACHE_inColorRGBA20);
				UpdateOutputFIFO(outAttributeInterpData, TEXSAMP_OutFIFO_wr_data, TEXSAMP_OutFIFO_full, TEXSAMP_OutFIFO_wr_en);
			}

			currentState = (const attrInterpStateType)DBG_AttrInterpolator_State.GetUint8Val();
			currentInterpolatorState = (const InterpolatorStateType)DBG_InterpolatorDriver_State.GetUint8Val();
			currentMultiplierState = (const InterpolatorStateType)DBG_MultiplierDriver_State.GetUint8Val();
			currentConverterState = (const InterpolatorStateType)DBG_ConverterDriver_State.GetUint8Val();
			currentOutputState = (const InterpolatorStateType)DBG_OutputDriver_State.GetUint8Val();
			currentPixelWPop = DBG_PixelWFIFO.GetFloat32Val();

			while (!CMD_IsIdle.GetBoolVal() )
			{
				scoped_timestep time(loader, clk, 100);
				++totalCycleCount;

				const depthInterpOutputData& thisPixelData = depthInterpLocalCopy.empty() ? depthInterpOutputData() : depthInterpLocalCopy.front();

				currentState = (const attrInterpStateType)DBG_AttrInterpolator_State.GetUint8Val();
				currentInterpolatorState = (const InterpolatorStateType)DBG_InterpolatorDriver_State.GetUint8Val();
				currentMultiplierState = (const InterpolatorStateType)DBG_MultiplierDriver_State.GetUint8Val();
				currentConverterState = (const InterpolatorStateType)DBG_ConverterDriver_State.GetUint8Val();
				currentOutputState = (const InterpolatorStateType)DBG_OutputDriver_State.GetUint8Val();
				currentPixelWPop = DBG_PixelWFIFO.GetFloat32Val();
				
				if (DINTERP_FIFO_rd_en.GetBoolVal() )
				{
					depthInterpLocalCopy.erase(depthInterpLocalCopy.begin() );
					DINTERP_FIFO_rd_data.SetStructVal(depthInterpLocalCopy.empty() ? depthInterpOutputData() : depthInterpLocalCopy.front() );
					DINTERP_FIFO_empty = depthInterpLocalCopy.empty();
				}

				attrInterpFPU_MUL.UpdateMulOnly(FPU_MUL_GO, FPU_MUL_A, FPU_MUL_B, FPU_MUL_OUT);
				attrInterpFPU_CNV0.UpdateCnvOnly(FPU_CNV0_GO, FPU_CNV0_Mode, FPU_CNV0_A, FPU_CNV0_OUT);
				attrInterpFPU_CNV1.UpdateCnvOnly(FPU_CNV1_GO, FPU_CNV1_Mode, FPU_CNV1_A, FPU_CNV1_OUT);
				triCache.Update(TRICACHE_PopTriangleSlot, TRICACHE_inT0X, TRICACHE_inT10X, TRICACHE_inT20X,
					TRICACHE_inT0Y, TRICACHE_inT10Y, TRICACHE_inT20Y,
					TRICACHE_inColorRGBA0, TRICACHE_inColorRGBA10, TRICACHE_inColorRGBA20);
				UpdateOutputFIFO(outAttributeInterpData, TEXSAMP_OutFIFO_wr_data, TEXSAMP_OutFIFO_full, TEXSAMP_OutFIFO_wr_en);
			}
		}
	};

	auto validateAttributeInterpTest = [&](const bool validateTexcoordsNormalized, 
		const std::vector<attributeInterpOutputData>& emulatedCPUAttributeInterpData, const std::vector<attributeInterpOutputData>& simulatedRTLAttrInterpData) -> bool
	{
		if (simulatedRTLAttrInterpData.size() != emulatedCPUAttributeInterpData.size() )
		{
			__debugbreak();
			return false;
		}

		const unsigned numOutputPixels = (const unsigned)emulatedCPUAttributeInterpData.size();
		for (unsigned x = 0; x < numOutputPixels; ++x)
		{
			const attributeInterpOutputData& emulatedCPUPixel = emulatedCPUAttributeInterpData[x];
			const attributeInterpOutputData& simulatedRTLPixel = simulatedRTLAttrInterpData[x];
			
			if (!(emulatedCPUPixel == simulatedRTLPixel) )
			{
				__debugbreak();
				return false;
			}

			// Check for out of range pixel coords:
			if (!IsSpecialCodePixel(simulatedRTLPixel.pixelX) )
			{
				if (simulatedRTLPixel.pixelX < 0 ||
					simulatedRTLPixel.pixelY < 0 ||
					simulatedRTLPixel.pixelX > 639 ||
					simulatedRTLPixel.pixelY > 479)
				{
					__debugbreak();
					return false;
				}
			}
		}

		return true;
	};

	// Indices are expected to arrive in CCW order:
	auto testSimpleDrawCall = [&](const testVert* const vertices, const unsigned short* const indicesCCW, const unsigned numPrims, const bool randomAttributes = false)
	{
		std::vector<depthInterpOutputData> emulatedCPUDepthInterpData;
		std::vector<unsigned> emulatedCPUDepthValues;

		std::vector<attributeInterpOutputData> emulatedCPUAttributeInterpData;
		std::vector<attributeInterpOutputData> simulatedRTLAttrInterpData;

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

				DepthInterpTriCache::DepthTriCacheData newDepthTriData;
				newDepthTriData.BarycentricInverse = triSetupData.barycentricInverse;
				newDepthTriData.Z0 = triSetupData.v0.Z;
				newDepthTriData.Z10 = triSetupData.v10.Z;
				newDepthTriData.Z20 = triSetupData.v20.Z;
				newDepthTriData.InvW0 = triSetupData.v0.invW;
				newDepthTriData.InvW10 = triSetupData.v10.invW;
				newDepthTriData.InvW20 = triSetupData.v20.invW;
				depthTriCache.dataFifo.push_back(newDepthTriData);

				AttrInterpTriCache::AttrTriCacheData newTriData;
				newTriData.TX0 = triSetupData.v0.xTex;
				newTriData.TX10 = triSetupData.v10.xTex;
				newTriData.TX20 = triSetupData.v20.xTex;
				newTriData.TY0 = triSetupData.v0.yTex;
				newTriData.TY10 = triSetupData.v10.yTex;
				newTriData.TY20 = triSetupData.v20.yTex;
				newTriData.RGBA0.r = triSetupData.v0.rgba.r;
				newTriData.RGBA0.g = triSetupData.v0.rgba.g;
				newTriData.RGBA0.b = triSetupData.v0.rgba.b;
				newTriData.RGBA0.a = triSetupData.v0.rgba.a;
				newTriData.RGBA10.r = triSetupData.v10.rgba.r;
				newTriData.RGBA10.g = triSetupData.v10.rgba.g;
				newTriData.RGBA10.b = triSetupData.v10.rgba.b;
				newTriData.RGBA10.a = triSetupData.v10.rgba.a;
				newTriData.RGBA20.r = triSetupData.v20.rgba.r;
				newTriData.RGBA20.g = triSetupData.v20.rgba.g;
				newTriData.RGBA20.b = triSetupData.v20.rgba.b;
				newTriData.RGBA20.a = triSetupData.v20.rgba.a;
				triCache.dataFifo.push_back(newTriData);

				++totalTriCount;

				rasterizedPixelData startNewTriMessage = {0};
				startNewTriMessage.pixelX = startNewTriangleSlotCommand;
				startNewTriMessage.pixelY = (currentTriCacheIndex) % 8;
				rasterizedPixels.push_back(startNewTriMessage);

				EmulateCPURasterizer(triSetupData, rasterizedPixels);

				rasterizedPixelData endTriMessage = {0};
				endTriMessage.pixelX = finishCurrentTriangleCommand;
				endTriMessage.pixelY = (currentTriCacheIndex++) % 8;
				rasterizedPixels.push_back(endTriMessage);

				EmulateDepthInterpCPU(depthTriCache, rasterizedPixels, emulatedCPUDepthInterpData, emulatedCPUDepthValues);
			}
		}

		totalPixelCount += CountPixelsNotIncludingSpecials(emulatedCPUDepthInterpData);

		EmulateAttributeInterpCPU(triCache, emulatedCPUDepthInterpData, !randomAttributes, emulatedCPUAttributeInterpData);
		simulateRTLAttributeInterp(emulatedCPUDepthInterpData, simulatedRTLAttrInterpData);

		successResult &= validateAttributeInterpTest(!randomAttributes, emulatedCPUAttributeInterpData, simulatedRTLAttrInterpData);

		if (!depthTriCache.dataFifo.empty() )
		{
			__debugbreak(); // The depth triangle cache should be empty at this point!
		}
		if (!triCache.dataFifo.empty() )
		{
			__debugbreak(); // The attr triangle cache should be empty at this point!
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
		static const unsigned numTestPrims = 128u;
		std::vector<testVert> testVerts;
		std::vector<unsigned short> testIndices;
		testVerts.reserve(numTestPrims * 3);
		testIndices.reserve(numTestPrims * 3);
		for (unsigned x = 0; x < numTestPrims; ++x)
		{
			testVert verts[3];
			verts[0].posX = ( (rand() % 800) - 80) + 0.5f; // Random xPos between -80 and +720
			verts[0].posY = ( (rand() % 600) - 60) + 0.5f; // Random yPos between -60 and +540

			verts[1].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
			verts[1].posY = verts[0].posY + ( (rand() % 100) - 50); // Random xOffset between -50 and +50

			verts[2].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
			verts[2].posY = verts[0].posY + ( (rand() % 100) - 50); // Random xOffset between -50 and +50

			testVerts.push_back(verts[0]);
			testVerts.push_back(verts[1]);
			testVerts.push_back(verts[2]);
			testIndices.push_back(x * 3 + 0);
			testIndices.push_back(x * 3 + 1);
			testIndices.push_back(x * 3 + 2);
		}

		const bool useRandomAttributes = true;
		testSimpleDrawCall(&testVerts.front(), &testIndices.front(), numTestPrims, useRandomAttributes);
	}

	printf("Total simulated prims: %u\n", totalTriCount);
	printf("Total simulated pixels: %u\n", totalPixelCount);
	printf("Total simulated RTL cycles: %u\n", totalCycleCount);
	printf("Average cycles per pixel: %f\n", totalCycleCount / (const float)totalPixelCount);

	return successResult ? S_OK : E_FAIL;
}
