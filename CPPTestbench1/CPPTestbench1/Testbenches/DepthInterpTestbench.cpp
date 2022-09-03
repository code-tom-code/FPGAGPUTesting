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
	init, // 0
	waitingForRead, // 1

	// Convert our input barycentrics from int32 to float32
	barycentricConversion0, // 2
	barycentricConversion1, // 3
	barycentricConversion2, // 4
	barycentricConversion3, // 5
	barycentricConversion4, // 6
	barycentricConversion5, // 7

	// Normalize our barycentrics by multiplying the [0.0f, 16777216.0f] values by the barycentric normalization factor (computed by the TriSetup block previously) to
	// get them into the [0.0f, 1.0f] range.
	barycentricNormalization0, // 8
	barycentricNormalization1, // 9
	barycentricNormalization2, // 10
	barycentricNormalization3, // 11
	barycentricNormalization4, // 12
	barycentricNormalization5, // 13
	barycentricNormalization6, // 14
	barycentricNormalization7, // 15

	// Multiply the normalized barycentrics with the inverseZ (1.0f/zN) values
	barycentricMultiply0, // 16
	barycentricMultiply1, // 17
	barycentricMultiply2, // 18
	barycentricMultiply3, // 19
	barycentricMultiply4, // 20
	barycentricMultiply5, // 21
	barycentricMultiply6, // 22
	barycentricMultiply7, // 23
	barycentricMultiply8, // 24
	barycentricMultiply9, // 25

	// Sum the products together to complete the dot product
	barycentricDotProductSums0, // 26
	barycentricDotProductSums1, // 27
	barycentricDotProductSums2, // 28
	barycentricDotProductSums3, // 29
	barycentricDotProductSums4, // 30
	barycentricDotProductSums5, // 31
	barycentricDotProductSums6, // 32
	barycentricDotProductSums7, // 33
	barycentricDotProductSums8, // 34
	barycentricDotProductSums9, // 35

	// Take the reciprocals of the dot product (1.0f / dot(normbary.abc, inverseZ.xyz) ) to yield the per-pixel depth value and per-pixel W value as a float32
	barycentricDotProductRecip0, // 36
	barycentricDotProductRecip1, // 37
	barycentricDotProductRecip2, // 38
	barycentricDotProductRecip3, // 39
	barycentricDotProductRecip4, // 40
	barycentricDotProductRecip5, // 41
	barycentricDotProductRecip6, // 42
	barycentricDotProductRecip7, // 43
	barycentricDotProductRecip8, // 44
	barycentricDotProductRecip9, // 45
	barycentricDotProductRecip10, // 46
	barycentricDotProductRecip11, // 47
	barycentricDotProductRecip12, // 48
	barycentricDotProductRecip13, // 49
	barycentricDotProductRecip14, // 50
	barycentricDotProductRecip15, // 51
	barycentricDotProductRecip16, // 52

	// If depth testing is enabled, perform the depth test now. Otherwise, skip these stages entirely.
	depthTestState0, // 53
	depthTestState1, // 54
	depthTestState2, // 55
	depthTestState3, // 56
	depthTestState4, // 57
	depthTestState5, // 58
	depthTestState6, // 59
	depthTestState7, // 60

	// When it's ready we can send the now depth-test-passed pixel off to the next block for attribute interpolation
	sendPixelForAttrInterpolation, // 61

	setNewPrimitiveSlot, // 62
	signalPrimitiveComplete // 63
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

		const float invZ0 = triSetupData.v0.invZ;
		const float invZ10 = triSetupData.v10.invZ;
		const float invZ20 = triSetupData.v20.invZ;
		const float dotproductResultZ = invZ10 * normalizedBarycentricB + invZ20 * normalizedBarycentricC + invZ0;

		const float interpolatedPixelDepth = 1.0f / dotproductResultZ;

		// Perform depth testing (assuming lessequals depth test mode against a cleared zbuffer with 1.0f):
		if (interpolatedPixelDepth <= 1.0f)
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
			DEPTH_PixelPassedDepthTest = true;
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
	std_logic_vector_port<32> TRICACHE_inInvZ0(PD_IN, loader, "TRICACHE_inInvZ0");
	std_logic_vector_port<32> TRICACHE_inInvZ10(PD_IN, loader, "TRICACHE_inInvZ10");
	std_logic_vector_port<32> TRICACHE_inInvZ20(PD_IN, loader, "TRICACHE_inInvZ20");
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
		triSetupData.DeserializeTriSetupOutput(TRICACHE_inBarycentricInverse, TRICACHE_inInvZ0, TRICACHE_inInvZ10, TRICACHE_inInvZ20,
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
				newOutData.Serialize(ATTR_PosX, ATTR_PosY, ATTR_NormalizedBarycentricB, ATTR_NormalizedBarycentricC, ATTR_OutPixelW);
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

	auto runDepthInterpTest = [&](const triSetupOutput& triSetupData, const std::vector<rasterizedPixelData>& rasterizedPixels, const bool useRandomZWPositions) -> bool
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

			// Check for out of range depth values:
			if (useRandomZWPositions)
			{
				if (simulatedRTLPixel.interpolatedPixelW < 0.5f ||
					simulatedRTLPixel.interpolatedPixelW > 1.0f)
				{
					__debugbreak();
					return false;
				}
			}
		}

		return true;
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
			primTriData.v0.invZ = 2.0f;
			primTriData.v0.invW = 1.0f;
			primTriData.v0.xTex = 1.0f / 15.0f;
			primTriData.v0.yTex = 2.0f / 15.0f;
			primTriData.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
			primTriData.v1.xPos = vertices[indicesCCW[x * 3 + 2] ].posX;
			primTriData.v1.yPos = vertices[indicesCCW[x * 3 + 2] ].posY;
			primTriData.v1.invZ = 2.0f;
			primTriData.v1.invW = 1.0f;
			primTriData.v1.xTex = 3.0f / 15.0f;
			primTriData.v1.yTex = 4.0f / 15.0f;
			primTriData.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
			primTriData.v2.xPos = vertices[indicesCCW[x * 3 + 1] ].posX;
			primTriData.v2.yPos = vertices[indicesCCW[x * 3 + 1] ].posY;
			primTriData.v2.invZ = 2.0f;
			primTriData.v2.invW = 1.0f;
			primTriData.v2.xTex = -5.0f / 15.0f;
			primTriData.v2.yTex = -6.0f / 15.0f;
			primTriData.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };
			if (randomZWPositions)
			{
				const float randomZ0 = frand() * 0.5f + 0.5f; // We currently only support depth values between 0.5f and 1.0f
				const float randomZ1 = frand() * 0.5f + 0.5f;
				const float randomZ2 = frand() * 0.5f + 0.5f;
				primTriData.v0.invZ = 1.0f / randomZ0;
				primTriData.v1.invZ = 1.0f / randomZ1;
				primTriData.v2.invZ = 1.0f / randomZ2;
				const float randomW0 = frand() * 0.5f + 0.5f; // We currently only support W values between 0.5f and 1.0f too
				const float randomW1 = frand() * 0.5f + 0.5f;
				const float randomW2 = frand() * 0.5f + 0.5f;
				primTriData.v0.invW = 1.0f / randomW0;
				primTriData.v1.invW = 1.0f / randomW1;
				primTriData.v2.invW = 1.0f / randomW2;
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

			successResult &= runDepthInterpTest(triSetupData, rasterizedPixels, randomZWPositions);
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

			const bool useRandomZWPositions = true;
			testSimpleDrawCall(verts, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3, useRandomZWPositions);
		}
	}

	return successResult ? S_OK : E_FAIL;
}
