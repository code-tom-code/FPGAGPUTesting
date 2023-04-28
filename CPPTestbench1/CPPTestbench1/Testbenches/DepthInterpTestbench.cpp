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

static const float frand()
{
	return rand() / (const float)RAND_MAX;
}

enum depthInterpStateType
{
	waitingForRead, // 0

	// Convert our input barycentrics from int32 to float32
	barycentricConversion0, // 1
	barycentricConversion1, // 2
	barycentricConversion2, // 3
	barycentricConversion3, // 4
	barycentricConversion4, // 5
	barycentricConversion5, // 6

	// Normalize our barycentrics by multiplying the [0.0f, 16777215.0f] values by the barycentric normalization factor (computed by the TriSetup block previously) to
	// get them into the [0.0f, 1.0f] range.
	barycentricNormalization0, // 7
	barycentricNormalization1, // 8
	barycentricNormalization2, // 9
	barycentricNormalization3, // 10
	barycentricNormalization4, // 11
	barycentricNormalization5, // 12
	barycentricNormalization6, // 13
	barycentricNormalization7, // 14

	// Multiply the normalized barycentrics with the Z (zN) values
	barycentricMultiply0, // 15
	barycentricMultiply1, // 16
	barycentricMultiply2, // 17
	barycentricMultiply3, // 18
	barycentricMultiply4, // 19
	barycentricMultiply5, // 20
	barycentricMultiply6, // 21
	barycentricMultiply7, // 22
	barycentricMultiply8, // 23
	barycentricMultiply9, // 24

	// Sum the products together to complete the dot product
	barycentricDotProductSums0, // 25
	barycentricDotProductSums1, // 26
	barycentricDotProductSums2, // 27
	barycentricDotProductSums3, // 28
	barycentricDotProductSums4, // 29
	barycentricDotProductSums5, // 30
	barycentricDotProductSums6, // 31
	barycentricDotProductSums7, // 32
	barycentricDotProductSums8, // 33
	barycentricDotProductSums9, // 34

	// Take the dot product (dot(normbary.abc, Z.xyz) ) to yield the per-pixel depth value and 
	// take the inverse dot product (1.0f / (dot(normbary.abc, invW.xyz) ) ) to yield the per-pixel W value as a float32
	barycentricDotProductRecip0, // 35
	barycentricDotProductRecip1, // 36
	barycentricDotProductRecip2, // 37
	barycentricDotProductRecip3, // 38
	barycentricDotProductRecip4, // 39
	barycentricDotProductRecip5, // 40
	barycentricDotProductRecip6, // 41
	barycentricDotProductRecip7, // 42
	barycentricDotProductRecip8, // 43
	barycentricDotProductRecip9, // 44
	barycentricDotProductRecip10, // 45
	barycentricDotProductRecip11, // 46
	barycentricDotProductRecip12, // 47
	barycentricDotProductRecip13, // 48
	barycentricDotProductRecip14, // 49
	barycentricDotProductRecip15, // 50
	barycentricDotProductRecip16, // 51

	// If depth testing is enabled, perform the depth test now. Otherwise, skip these stages entirely.
	depthTestState0, // 52
	depthTestState1, // 53
	depthTestState2, // 54
	depthTestState3, // 55
	depthTestState4, // 56
	depthTestState5, // 57
	depthTestState6, // 58
	depthTestState7, // 59
	depthTestState8, // 60
	depthTestState9, // 61
	depthTestState10, // 62

	// When it's ready we can send the now depth-test-passed pixel off to the next block for attribute interpolation
	sendPixelForAttrInterpolation, // 63

	setNewPrimitiveSlot, // 64
	signalPrimitiveComplete // 65
};

void EmulateDepthInterpCPU(const triSetupOutput& triSetupData, const std::vector<rasterizedPixelData>& rasterizedPixels, std::vector<depthInterpOutputData>& outDepthInterpData)
{
	const unsigned numPixels = (const unsigned)rasterizedPixels.size();
	for (unsigned x = 0; x < numPixels; ++x)
	{
		const rasterizedPixelData& thisPixelData = rasterizedPixels[x];
		if (thisPixelData.pixelX == startNewTriangleSlotCommand ||
			thisPixelData.pixelX == finishCurrentTriangleCommand)
			continue;

		const float normalizedBarycentricB = thisPixelData.barycentricB * triSetupData.barycentricInverse;
		const float normalizedBarycentricC = thisPixelData.barycentricC * triSetupData.barycentricInverse;

		const float Z0 = triSetupData.v0.Z;
		const float Z10 = triSetupData.v10.Z;
		const float Z20 = triSetupData.v20.Z;
		const float dotproductResultZ = Z10 * normalizedBarycentricB + Z20 * normalizedBarycentricC + Z0;

		const float interpolatedPixelDepth = dotproductResultZ;

		// Might need to add a slight epsilon here to account for floating-point imprecision
		if (interpolatedPixelDepth > 1.0f || interpolatedPixelDepth < 0.0f)
		{
			__debugbreak(); // Should never be here since we should only ever be processing post-clipped triangles. Nothing should ever be beyond the far-plane or behind the near-plane!
		}

		const unsigned u24Depth = (const unsigned)(interpolatedPixelDepth * 16777215.0f);

		// Perform depth testing (assuming lessequals depth test mode against a cleared zbuffer with 1.0f):
		if (u24Depth <= 0xFFFFFFFF)
		{
			// Interpolate per-pixel W (uses the same calculation as per-pixel Z):
			const float invW0 = triSetupData.v0.invW;
			const float invW10 = triSetupData.v10.invW;
			const float invW20 = triSetupData.v20.invW;
			const float dotproductResultW = invW10 * normalizedBarycentricB + invW20 * normalizedBarycentricC + invW0;

			const float interpolatedPixelW = 1.0f / dotproductResultW;

			depthInterpOutputData newDepthInterpOutput;
			newDepthInterpOutput.pixelX = thisPixelData.pixelX;
			newDepthInterpOutput.pixelY = thisPixelData.pixelY;
			newDepthInterpOutput.interpolatedPixelW = interpolatedPixelW;
			newDepthInterpOutput.normalizedBarycentricB = normalizedBarycentricB;
			newDepthInterpOutput.normalizedBarycentricC = normalizedBarycentricC;
			newDepthInterpOutput.dbgDepthU24 = u24Depth;
			outDepthInterpData.push_back(newDepthInterpOutput);
		}
	}
}

struct simulatedDepthBuffer
{
	static const unsigned NUM_DEPTHBUFFER_CYCLES = 4u;

	struct perCycleData
	{
		bool pixelReady;
		unsigned short pixelX;
		unsigned short pixelY;
		unsigned long pixelDepth;
	};

	perCycleData pipeStages[NUM_DEPTHBUFFER_CYCLES + 3] = {0};

	void Update(std_logic_port& DEPTH_PixelReady, std_logic_vector_port<10>& DEPTH_PosX, std_logic_vector_port<10>& DEPTH_PosY, std_logic_vector_port<24>& DEPTH_OutPixelDepth, 
		std_logic_port& DEPTH_PixelPassedDepthTest, std_logic_port& DEPTH_PixelFailedDepthTest)
	{
		// Advance our pipeline:
		for (unsigned x = 0; x < ARRAYSIZE(pipeStages) - 1; ++x)
		{
			pipeStages[x] = pipeStages[x + 1];
		}
		pipeStages[ARRAYSIZE(pipeStages) - 1] = {0};

		if (pipeStages[0].pixelReady)
		{
			DEPTH_PixelPassedDepthTest = (pipeStages[0].pixelDepth <= 16777215);
			DEPTH_PixelFailedDepthTest = false;
		}
		else
		{
			DEPTH_PixelPassedDepthTest = false;
			DEPTH_PixelFailedDepthTest = false;
		}

		if (DEPTH_PixelReady.GetBoolVal() )
		{
			pipeStages[NUM_DEPTHBUFFER_CYCLES + 2].pixelReady = true;
			pipeStages[NUM_DEPTHBUFFER_CYCLES + 2].pixelX = DEPTH_PosX.GetUint16Val();
			pipeStages[NUM_DEPTHBUFFER_CYCLES + 2].pixelY = DEPTH_PosY.GetUint16Val();
			pipeStages[NUM_DEPTHBUFFER_CYCLES + 2].pixelDepth = DEPTH_OutPixelDepth.GetUint32Val();
		}
	}
};

const int RunTestsDepthInterp(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

// TriWorkCache per-triangle interface begin
	std_logic_vector_port<32> TRICACHE_inBarycentricInverse(PD_IN, loader, "TRICACHE_inBarycentricInverse");
	std_logic_vector_port<32> TRICACHE_inZ0(PD_IN, loader, "TRICACHE_inZ0");
	std_logic_vector_port<32> TRICACHE_inZ10(PD_IN, loader, "TRICACHE_inZ10");
	std_logic_vector_port<32> TRICACHE_inZ20(PD_IN, loader, "TRICACHE_inZ20");
	std_logic_vector_port<32> TRICACHE_inInvW0(PD_IN, loader, "TRICACHE_inInvW0");
	std_logic_vector_port<32> TRICACHE_inInvW10(PD_IN, loader, "TRICACHE_inInvW10");
	std_logic_vector_port<32> TRICACHE_inInvW20(PD_IN, loader, "TRICACHE_inInvW20");
	std_logic_vector_port<32> TRICACHE_inT0X(PD_IN, loader, "TRICACHE_inT0X");
	std_logic_vector_port<32> TRICACHE_inT0Y(PD_IN, loader, "TRICACHE_inT0Y");
	std_logic_vector_port<32> TRICACHE_inT10X(PD_IN, loader, "TRICACHE_inT10X");
	std_logic_vector_port<32> TRICACHE_inT10Y(PD_IN, loader, "TRICACHE_inT10Y");
	std_logic_vector_port<32> TRICACHE_inT20X(PD_IN, loader, "TRICACHE_inT20X");
	std_logic_vector_port<32> TRICACHE_inT20Y(PD_IN, loader, "TRICACHE_inT20Y");
	std_logic_vector_port<128> TRICACHE_inColorRGBA0(PD_IN, loader, "TRICACHE_inColorRGBA0");
	std_logic_vector_port<128> TRICACHE_inColorRGBA10(PD_IN, loader, "TRICACHE_inColorRGBA10");
	std_logic_vector_port<128> TRICACHE_inColorRGBA20(PD_IN, loader, "TRICACHE_inColorRGBA20");

	std_logic_vector_port<3> TRICACHE_CurrentSlotIndex(PD_OUT, loader, "TRICACHE_CurrentSlotIndex");
	std_logic_port TRICACHE_SignalSlotComplete(PD_OUT, loader, "TRICACHE_SignalSlotComplete");
// TriWorkCache per-triangle interface end

// Rasterizer Output per-pixel interface begin
	std_logic_vector_port<32+32+16+16> RASTOUT_FIFO_rd_data(PD_IN, loader, "RASTOUT_FIFO_rd_data");
	std_logic_port RASTOUT_FIFO_empty(PD_IN, loader, "RASTOUT_FIFO_empty");
	std_logic_port RASTOUT_FIFO_rd_en(PD_OUT, loader, "RASTOUT_FIFO_rd_en");
// Rasterizer Output per-pixel interface end

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

// Depth Buffer interface begin
	std_logic_port DEPTH_PixelReady(PD_OUT, loader, "DEPTH_PixelReady");
	std_logic_vector_port<10> DEPTH_PosX(PD_OUT, loader, "DEPTH_PosX");
	std_logic_vector_port<10> DEPTH_PosY(PD_OUT, loader, "DEPTH_PosY");
	std_logic_vector_port<24> DEPTH_OutPixelDepth(PD_OUT, loader, "DEPTH_OutPixelDepth");
	std_logic_port DEPTH_PixelPassedDepthTest(PD_IN, loader, "DEPTH_PixelPassedDepthTest");
	std_logic_port DEPTH_PixelFailedDepthTest(PD_IN, loader, "DEPTH_PixelFailedDepthTest");
	std_logic_port DEPTH_DepthTestEnabled(PD_IN, loader, "DEPTH_DepthTestEnabled");
// Depth Buffer interface end

// Attribute Interpolator interface begin
	std_logic_port ATTR_ReadyForNewPixel(PD_IN, loader, "ATTR_ReadyForNewPixel");
	std_logic_port ATTR_NewPixelValid(PD_OUT, loader, "ATTR_NewPixelValid");
	std_logic_vector_port<10> ATTR_PosX(PD_OUT, loader, "ATTR_PosX");
	std_logic_vector_port<10> ATTR_PosY(PD_OUT, loader, "ATTR_PosY");
	std_logic_vector_port<32> ATTR_TX0(PD_OUT, loader, "ATTR_TX0");
	std_logic_vector_port<32> ATTR_TX10(PD_OUT, loader, "ATTR_TX10");
	std_logic_vector_port<32> ATTR_TX20(PD_OUT, loader, "ATTR_TX20");
	std_logic_vector_port<32> ATTR_TY0(PD_OUT, loader, "ATTR_TY0");
	std_logic_vector_port<32> ATTR_TY10(PD_OUT, loader, "ATTR_TY10");
	std_logic_vector_port<32> ATTR_TY20(PD_OUT, loader, "ATTR_TY20");
	std_logic_vector_port<128> ATTR_VC0(PD_OUT, loader, "ATTR_VC0");
	std_logic_vector_port<128> ATTR_VC10(PD_OUT, loader, "ATTR_VC10");
	std_logic_vector_port<128> ATTR_VC20(PD_OUT, loader, "ATTR_VC20");
	std_logic_vector_port<32> ATTR_NormalizedBarycentricB(PD_OUT, loader, "ATTR_NormalizedBarycentricB");
	std_logic_vector_port<32> ATTR_NormalizedBarycentricC(PD_OUT, loader, "ATTR_NormalizedBarycentricC");
	std_logic_vector_port<32> ATTR_OutPixelW(PD_OUT, loader, "ATTR_OutPixelW");
// Attribute Interpolator interface end

// Debug signals
	std_logic_vector_port<7> DBG_DepthInterpolator_State(PD_OUT, loader, "DBG_DepthInterpolator_State");
	std_logic_vector_port<32> DBG_RastBarycentricB(PD_OUT, loader, "DBG_RastBarycentricB");
	std_logic_vector_port<32> DBG_RastBarycentricC(PD_OUT, loader, "DBG_RastBarycentricC");
	std_logic_vector_port<24> DBG_InterpolatedDepthU24(PD_OUT, loader, "DBG_InterpolatedDepthU24");

	FPU depthInterpFPU(0);
	simulatedDepthBuffer depthInterpDepthBuffer;

	bool successResult = true;

	srand(3); // Pick a stable seed so we get consistent random results

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		RASTOUT_FIFO_empty = true;
		FPU_OUT = 0.0f;
		DEPTH_PixelPassedDepthTest = false;
		DEPTH_PixelFailedDepthTest = false;
		DEPTH_DepthTestEnabled = true;
		ATTR_ReadyForNewPixel = true;
	}

	auto simulateRTLDepthInterp = [&](const triSetupOutput& triSetupData, std::vector<rasterizedPixelData> rasterizedPixels, std::vector<depthInterpOutputData>& outDepthInterpData)
	{
		// TODO: Simulate tricache with different slots
		triSetupData.DeserializeTriSetupOutput(TRICACHE_inBarycentricInverse, TRICACHE_inZ0, TRICACHE_inZ10, TRICACHE_inZ20,
			TRICACHE_inInvW0, TRICACHE_inInvW10, TRICACHE_inInvW20,
			TRICACHE_inT0X, TRICACHE_inT0Y, TRICACHE_inT10X, TRICACHE_inT10Y, TRICACHE_inT20X, TRICACHE_inT20Y,
			TRICACHE_inColorRGBA0, TRICACHE_inColorRGBA10, TRICACHE_inColorRGBA20);
		RASTOUT_FIFO_rd_data.SetStructVal(rasterizedPixels[0]);

		while (!rasterizedPixels.empty() && !TRICACHE_SignalSlotComplete.GetBoolVal() )
		{
			scoped_timestep time(loader, clk, 100);

			const depthInterpStateType depthInterpState = (const depthInterpStateType)DBG_DepthInterpolator_State.GetUint8Val();

			RASTOUT_FIFO_empty = rasterizedPixels.empty();
			if (RASTOUT_FIFO_rd_en.GetBoolVal() )
			{
				rasterizedPixels.erase(rasterizedPixels.begin() );
				RASTOUT_FIFO_empty = rasterizedPixels.empty();
				if (!rasterizedPixels.empty() )
				{
					RASTOUT_FIFO_rd_data.SetStructVal(rasterizedPixels[0]);
				}
				else
				{
					rasterizedPixelData emptyPixelData = {0};
					RASTOUT_FIFO_rd_data.SetStructVal(emptyPixelData);
				}
			}
			if (ATTR_NewPixelValid.GetBoolVal() )
			{
				depthInterpOutputData newOutData;
				newOutData.Serialize(ATTR_PosX, ATTR_PosY, ATTR_NormalizedBarycentricB, ATTR_NormalizedBarycentricC, ATTR_OutPixelW, DBG_InterpolatedDepthU24);
				outDepthInterpData.push_back(newOutData);
			}
			depthInterpFPU.Update(FPU_ISHFT_GO, FPU_IMUL_GO, FPU_IADD_GO, FPU_ICMP_GO, FPU_ISPEC_GO, FPU_ICNV_GO, FPU_IBIT_GO,	FPU_A, FPU_B, FPU_Mode, FPU_OUT);
			depthInterpDepthBuffer.Update(DEPTH_PixelReady, DEPTH_PosX, DEPTH_PosY, DEPTH_OutPixelDepth, DEPTH_PixelPassedDepthTest, DEPTH_PixelFailedDepthTest);
		}

		// Run one more clock cycle to allow the signal to the TRICACHE_SignalSlotComplete to fall off:
		{
			scoped_timestep time(loader, clk, 100);
		}
	};

	auto runDepthInterpTest = [&](const triSetupInput& clipspaceOutTri, const triSetupOutput& triSetupData, const std::vector<rasterizedPixelData>& rasterizedPixels, const bool useRandomZWPositions) -> bool
	{
		std::vector<depthInterpOutputData> emulatedCPUDepthInterpData;
		std::vector<depthInterpOutputData> simulatedRTLDepthInterpData;
		EmulateDepthInterpCPU(triSetupData, rasterizedPixels, emulatedCPUDepthInterpData);
		simulateRTLDepthInterp(triSetupData, rasterizedPixels, simulatedRTLDepthInterpData);

		if (emulatedCPUDepthInterpData.size() != simulatedRTLDepthInterpData.size() )
		{
			__debugbreak();
			return false;
		}

		const float z0 = clipspaceOutTri.v0.zPos / clipspaceOutTri.v0.wPos;
		const float z1 = clipspaceOutTri.v1.zPos / clipspaceOutTri.v1.wPos;
		const float z2 = clipspaceOutTri.v2.zPos / clipspaceOutTri.v2.wPos;
		float zMin, zMax;
		if (z0 < z1 && z0 < z2) zMin = z0;
		else if (z1 < z0 && z1 < z2) zMin = z1;
		else zMin = z2;

		if (z0 > z1 && z0 > z2) zMax = z0;
		else if (z1 > z0 && z1 > z2) zMax = z1;
		else zMax = z2;

		const unsigned zMinU24 = (const unsigned)(16777215.0f * zMin);
		const unsigned zMaxU24 = (const unsigned)(16777215.0f * zMax);

		const unsigned numOutputPixels = (const unsigned)emulatedCPUDepthInterpData.size();
		for (unsigned x = 0; x < numOutputPixels; ++x)
		{
			const depthInterpOutputData& emulatedCPUPixel = emulatedCPUDepthInterpData[x];
			const depthInterpOutputData& simulatedRTLPixel = simulatedRTLDepthInterpData[x];

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

			// Check for out of range depth values that might be due to accidental extrapolation rather than our interpolation:
			/*if (simulatedRTLPixel.dbgDepthU24 < zMinU24)
			{
				__debugbreak();
			}
			if (simulatedRTLPixel.dbgDepthU24 > zMaxU24)
			{
				__debugbreak();
			}*/
			if (simulatedRTLPixel.dbgDepthU24 + 1 < zMinU24) // Fudge by one depth unit just in case we have some float precision issues
			{
				__debugbreak();
			}
			if (simulatedRTLPixel.dbgDepthU24 - 1 > zMaxU24)
			{
				__debugbreak();
			}

			// Check for out of range interpolated W values:
			if (useRandomZWPositions)
			{
				if (simulatedRTLPixel.interpolatedPixelW <= 0.0f ||
					simulatedRTLPixel.interpolatedPixelW > 1.0f)
				{
					__debugbreak();
					return false;
				}
			}
		}

		return true;
	};

	auto testComplexDrawCallSingleTri = [&](const triSetupInput& singleTri, const bool testRandomZWPositions = false)
	{
		std::vector<triSetupInput> unclippedTris;
		unclippedTris.push_back(singleTri);
		std::vector<triSetupInput> clippedTris;
		EmulateCPUClipper(unclippedTris, clippedTris);

		const unsigned numOutClippedTris = (const unsigned)clippedTris.size();
		for (unsigned y = 0; y < numOutClippedTris; ++y)
		{
			const triSetupInput& thisInputTri = clippedTris[y];
			triSetupOutput triSetupData;
			if (EmulateCPUTriSetup(thisInputTri, triSetupData) != triSetup_OK) // If this fails, then it's because our triangle got culled or clipped or backface-killed or something
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

			successResult &= runDepthInterpTest(thisInputTri, triSetupData, rasterizedPixels, testRandomZWPositions);
		}
	};

	// Indices are expected to arrive in CCW order:
	auto testSimpleDrawCall = [&](const testVert* const vertices, const unsigned short* const indicesCCW, const unsigned numPrims, const bool randomZWPositions = false)
	{
		for (unsigned x = 0; x < numPrims; ++x)
		{
			triSetupInput primTriData; 
			
			// Draw vertices in "0, 2, 1" order to swizzle CCW to CW ordering for our triangle setup to not consider them backfacing:
			primTriData.v0.xPos = vertices[indicesCCW[x * 3] ].posX;
			primTriData.v0.yPos = vertices[indicesCCW[x * 3] ].posY;
			primTriData.v0.zPos = 0.5f;
			primTriData.v0.wPos = 1.0f;
			primTriData.v0.xTex = 1.0f / 15.0f;
			primTriData.v0.yTex = 2.0f / 15.0f;
			primTriData.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
			primTriData.v1.xPos = vertices[indicesCCW[x * 3 + 2] ].posX;
			primTriData.v1.yPos = vertices[indicesCCW[x * 3 + 2] ].posY;
			primTriData.v1.zPos = 0.5f;
			primTriData.v1.wPos = 1.0f;
			primTriData.v1.xTex = 3.0f / 15.0f;
			primTriData.v1.yTex = 4.0f / 15.0f;
			primTriData.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
			primTriData.v2.xPos = vertices[indicesCCW[x * 3 + 1] ].posX;
			primTriData.v2.yPos = vertices[indicesCCW[x * 3 + 1] ].posY;
			primTriData.v2.zPos = 0.5f;
			primTriData.v2.wPos = 1.0f;
			primTriData.v2.xTex = -5.0f / 15.0f;
			primTriData.v2.yTex = -6.0f / 15.0f;
			primTriData.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };

			UntransformViewport(primTriData);

			if (randomZWPositions)
			{
				const float randomZ0 = frand();
				const float randomZ1 = frand();
				const float randomZ2 = frand();
				primTriData.v0.zPos = randomZ0;
				primTriData.v1.zPos = randomZ1;
				primTriData.v2.zPos = randomZ2;
				float randomW0 = frand();
				float randomW1 = frand();
				float randomW2 = frand();
				if (randomW0 == 0.0f) randomW0 = 1.17549435082228750797e-38f;
				if (randomW1 == 0.0f) randomW1 = 1.17549435082228750797e-38f;
				if (randomW2 == 0.0f) randomW2 = 1.17549435082228750797e-38f;
				primTriData.v0.wPos = randomW0;
				primTriData.v1.wPos = randomW1;
				primTriData.v2.wPos = randomW2;

				// Premultiply the Z-values by the W-values because we want these to be the post-divide-by-zero z-values:
				primTriData.v0.zPos *= primTriData.v0.wPos;
				primTriData.v1.zPos *= primTriData.v1.wPos;
				primTriData.v2.zPos *= primTriData.v2.wPos;
			}

			testComplexDrawCallSingleTri(primTriData, randomZWPositions);
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

	// Test case with three triangles using data from a PIX capture (warning: may take a little while to rasterize and validate - this is not a super small triangle):
	{
		triSetupInput testTri; // This triangle will not get clipped. It is firmly inside our viewport:
		testTri.v0.rgba.r = testTri.v0.rgba.g = testTri.v0.rgba.b = testTri.v0.rgba.a = 1.0f;
		testTri.v1.rgba.r = testTri.v1.rgba.g = testTri.v1.rgba.b = testTri.v1.rgba.a = 1.0f;
		testTri.v2.rgba.r = testTri.v2.rgba.g = testTri.v2.rgba.b = testTri.v2.rgba.a = 1.0f;
		testTri.v0.xPos = -0.341374397f;
		testTri.v0.yPos = -0.031077266f;
		testTri.v0.zPos = 0.549123645f;
		testTri.v0.wPos = 0.558848858f;
		testTri.v0.xTex = 0.0f;
		testTri.v0.yTex = 0.035156f;
		testTri.v1.xPos = 0.200791836f;
		testTri.v1.yPos = 0.239187300f;
		testTri.v1.zPos = 1.613220334f;
		testTri.v1.wPos = 1.622413635f;
		testTri.v1.xTex = 3.972656012f;
		testTri.v1.yTex = 0.035156f;
		testTri.v2.xPos = 0.013064623f;
		testTri.v2.yPos = -0.107485890f;
		testTri.v2.zPos = 0.248284698f;
		testTri.v2.wPos = 0.258160591f;
		testTri.v2.xTex = 0.0f;
		testTri.v2.yTex = -0.9667976994f;
		testComplexDrawCallSingleTri(testTri);
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
			verts[1].posY = verts[0].posY + ( (rand() % 100) - 50); // Random yOffset between -50 and +50

			verts[2].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
			verts[2].posY = verts[0].posY + ( (rand() % 100) - 50); // Random yOffset between -50 and +50

			const bool useRandomZWPositions = true;
			testSimpleDrawCall(verts, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3, useRandomZWPositions);
		}
	}

	return successResult ? S_OK : E_FAIL;
}
