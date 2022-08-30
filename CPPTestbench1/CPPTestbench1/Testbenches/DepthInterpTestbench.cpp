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
	barycentricConversion6, // 8

	// Normalize our barycentrics by multiplying the [0.0f, 16777216.0f] values by the barycentric normalization factor (computed by the TriSetup block previously) to
	// get them into the [0.0f, 1.0f] range.
	barycentricNormalization0, // 9
	barycentricNormalization1, // 10
	barycentricNormalization2, // 11
	barycentricNormalization3, // 12
	barycentricNormalization4, // 13
	barycentricNormalization5, // 14
	barycentricNormalization6, // 15
	barycentricNormalization7, // 16
	barycentricNormalization8, // 17

	// Multiply the normalized barycentrics with the inverseZ (1.0f/zN) values
	barycentricMultiply0, // 18
	barycentricMultiply1, // 19
	barycentricMultiply2, // 20
	barycentricMultiply3, // 21
	barycentricMultiply4, // 22
	barycentricMultiply5, // 23
	barycentricMultiply6, // 24
	barycentricMultiply7, // 25
	barycentricMultiply8, // 26
	barycentricMultiply9, // 27

	// Sum the products together to complete the dot product
	barycentricDotProductSums0, // 28
	barycentricDotProductSums1, // 29
	barycentricDotProductSums2, // 30
	barycentricDotProductSums3, // 31
	barycentricDotProductSums4, // 32
	barycentricDotProductSums5, // 33
	barycentricDotProductSums6, // 34
	barycentricDotProductSums7, // 35
	barycentricDotProductSums8, // 36
	barycentricDotProductSums9, // 37

	// Take the reciprocal of the dot product (1.0f / dot(normbary.abc, inverseZ.xyz) ) to yield the per-pixel depth value as a float32
	barycentricDotProductRecip0, // 38
	barycentricDotProductRecip1, // 39
	barycentricDotProductRecip2, // 40
	barycentricDotProductRecip3, // 41
	barycentricDotProductRecip4, // 42
	barycentricDotProductRecip5, // 43
	barycentricDotProductRecip6, // 44
	barycentricDotProductRecip7, // 45
	barycentricDotProductRecip8, // 46
	barycentricDotProductRecip9, // 47
	barycentricDotProductRecip10, // 48
	barycentricDotProductRecip11, // 49
	barycentricDotProductRecip12, // 50
	barycentricDotProductRecip13, // 51
	barycentricDotProductRecip14, // 52
	barycentricDotProductRecip15, // 53

	// If depth testing is enabled, perform the depth test now. Otherwise, skip these stages entirely.
	depthTestState0, // 54
	depthTestState1, // 55
	depthTestState2, // 56
	depthTestState3, // 57
	depthTestState4, // 58
	depthTestState5, // 59
	depthTestState6, // 60
	depthTestState7, // 61

	// When it's ready we can send the now depth-test-passed pixel off to the next block for attribute interpolation
	sendPixelForAttrInterpolation, // 62

	setNewPrimitiveSlot, // 63
	signalPrimitiveComplete // 64
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

		const float normalizedBarycentricA = thisPixelData.barycentricA * triSetupData.barycentricInverse;
		const float normalizedBarycentricB = thisPixelData.barycentricB * triSetupData.barycentricInverse;
		const float normalizedBarycentricC = thisPixelData.barycentricC * triSetupData.barycentricInverse;

		const float normBarycentricDivZ0 = normalizedBarycentricA * triSetupData.v0.invZ;
		const float normBarycentricDivZ1 = normalizedBarycentricB * triSetupData.v1.invZ;
		const float normBarycentricDivZ2 = normalizedBarycentricC * triSetupData.v2.invZ;

		const float dotproductResult = normBarycentricDivZ0 + normBarycentricDivZ1 + normBarycentricDivZ2;

		const float interpolatedPixelDepth = 1.0f / dotproductResult;

		// Perform depth testing (assuming lessequals depth test mode against a cleared zbuffer with 1.0f):
		if (interpolatedPixelDepth <= 1.0f)
		{
			depthInterpOutputData newDepthInterpOutput;
			newDepthInterpOutput.pixelX = thisPixelData.pixelX;
			newDepthInterpOutput.pixelY = thisPixelData.pixelY;
			newDepthInterpOutput.interpolatedPixelDepth = interpolatedPixelDepth;
			newDepthInterpOutput.normalizedBarycentricDivZ0 = normBarycentricDivZ0;
			newDepthInterpOutput.normalizedBarycentricDivZ1 = normBarycentricDivZ1;
			newDepthInterpOutput.normalizedBarycentricDivZ2 = normBarycentricDivZ2;
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
	std_logic_vector_port<32> TRICACHE_inInvZ1(PD_IN, loader, "TRICACHE_inInvZ1");
	std_logic_vector_port<32> TRICACHE_inInvZ2(PD_IN, loader, "TRICACHE_inInvZ2");
	std_logic_vector_port<16> TRICACHE_inT0X(PD_IN, loader, "TRICACHE_inT0X");
	std_logic_vector_port<16> TRICACHE_inT0Y(PD_IN, loader, "TRICACHE_inT0Y");
	std_logic_vector_port<16> TRICACHE_inT1X(PD_IN, loader, "TRICACHE_inT1X");
	std_logic_vector_port<16> TRICACHE_inT1Y(PD_IN, loader, "TRICACHE_inT1Y");
	std_logic_vector_port<16> TRICACHE_inT2X(PD_IN, loader, "TRICACHE_inT2X");
	std_logic_vector_port<16> TRICACHE_inT2Y(PD_IN, loader, "TRICACHE_inT2Y");
	std_logic_vector_port<32> TRICACHE_inColorRGBA0(PD_IN, loader, "TRICACHE_inColorRGBA0");
	std_logic_vector_port<32> TRICACHE_inColorRGBA1(PD_IN, loader, "TRICACHE_inColorRGBA1");
	std_logic_vector_port<32> TRICACHE_inColorRGBA2(PD_IN, loader, "TRICACHE_inColorRGBA2");

	std_logic_vector_port<3> TRICACHE_CurrentSlotIndex(PD_OUT, loader, "TRICACHE_CurrentSlotIndex");
	std_logic_port TRICACHE_SignalSlotComplete(PD_OUT, loader, "TRICACHE_SignalSlotComplete");
// TriWorkCache per-triangle interface end

// Rasterizer Output per-pixel interface begin
	std_logic_vector_port<32+32+32+16+16> RASTOUT_FIFO_rd_data(PD_IN, loader, "RASTOUT_FIFO_rd_data");
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
	std_logic_vector_port<16> ATTR_TX0(PD_OUT, loader, "ATTR_TX0");
	std_logic_vector_port<16> ATTR_TX1(PD_OUT, loader, "ATTR_TX1");
	std_logic_vector_port<16> ATTR_TX2(PD_OUT, loader, "ATTR_TX2");
	std_logic_vector_port<16> ATTR_TY0(PD_OUT, loader, "ATTR_TY0");
	std_logic_vector_port<16> ATTR_TY1(PD_OUT, loader, "ATTR_TY1");
	std_logic_vector_port<16> ATTR_TY2(PD_OUT, loader, "ATTR_TY2");
	std_logic_vector_port<32> ATTR_VC0(PD_OUT, loader, "ATTR_VC0");
	std_logic_vector_port<32> ATTR_VC1(PD_OUT, loader, "ATTR_VC1");
	std_logic_vector_port<32> ATTR_VC2(PD_OUT, loader, "ATTR_VC2");
	std_logic_vector_port<32> ATTR_NormalizedBarycentricDivZ0(PD_OUT, loader, "ATTR_NormalizedBarycentricDivZ0");
	std_logic_vector_port<32> ATTR_NormalizedBarycentricDivZ1(PD_OUT, loader, "ATTR_NormalizedBarycentricDivZ1");
	std_logic_vector_port<32> ATTR_NormalizedBarycentricDivZ2(PD_OUT, loader, "ATTR_NormalizedBarycentricDivZ2");
	std_logic_vector_port<32> ATTR_OutPixelDepth(PD_OUT, loader, "ATTR_OutPixelDepth");
// Attribute Interpolator interface end

// Debug signals
	std_logic_vector_port<7> DBG_DepthInterpolator_State(PD_OUT, loader, "DBG_DepthInterpolator_State");
	std_logic_vector_port<32> DBG_RastBarycentricA(PD_OUT, loader, "DBG_RastBarycentricA");
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
		triSetupData.DeserializeTriSetupOutput(TRICACHE_inBarycentricInverse, TRICACHE_inInvZ0, TRICACHE_inInvZ1, TRICACHE_inInvZ2,
			TRICACHE_inT0X, TRICACHE_inT0Y, TRICACHE_inT1X, TRICACHE_inT1Y, TRICACHE_inT2X, TRICACHE_inT2Y,
			TRICACHE_inColorRGBA0, TRICACHE_inColorRGBA1, TRICACHE_inColorRGBA2);
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
				newOutData.Serialize(ATTR_PosX, ATTR_PosY, ATTR_NormalizedBarycentricDivZ0, ATTR_NormalizedBarycentricDivZ1, ATTR_NormalizedBarycentricDivZ2, ATTR_OutPixelDepth);
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

	auto runDepthInterpTest = [&](const triSetupOutput& triSetupData, const std::vector<rasterizedPixelData>& rasterizedPixels, const bool useRandomZPositions) -> bool
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
			if (useRandomZPositions)
			{
				if (simulatedRTLPixel.interpolatedPixelDepth < 0.5f ||
					simulatedRTLPixel.interpolatedPixelDepth > 1.0f)
				{
					__debugbreak();
					return false;
				}
			}
		}

		return true;
	};

	// Indices are expected to arrive in CCW order:
	auto testSimpleDrawCall = [&](const testVert* const vertices, const unsigned short* const indicesCCW, const unsigned numPrims, const bool randomZPositions = false)
	{
		for (unsigned x = 0; x < numPrims; ++x)
		{
			triSetupInput primTriData; 
			
			// Draw vertices in "0, 2, 1" order to swizzle CCW to CW ordering for our triangle setup to not consider them backfacing:
			primTriData.v0.xPos = (const signed short)(vertices[indicesCCW[x * 3] ].posX + 0.5f);
			primTriData.v0.yPos = (const signed short)(vertices[indicesCCW[x * 3] ].posY + 0.5f);
			primTriData.v0.invZ = 2.0f;
			primTriData.v0.xTex = 0x1111;
			primTriData.v0.yTex = 0x2222;
			primTriData.v0.rgba = D3DCOLOR_ARGB(255, 255, 0, 0);
			primTriData.v1.xPos = (const signed short)(vertices[indicesCCW[x * 3 + 2] ].posX + 0.5f);
			primTriData.v1.yPos = (const signed short)(vertices[indicesCCW[x * 3 + 2] ].posY + 0.5f);
			primTriData.v1.invZ = 2.0f;
			primTriData.v1.xTex = 0x3333;
			primTriData.v1.yTex = 0x4444;
			primTriData.v1.rgba = D3DCOLOR_ARGB(255, 0, 255, 0);
			primTriData.v2.xPos = (const signed short)(vertices[indicesCCW[x * 3 + 1] ].posX + 0.5f);
			primTriData.v2.yPos = (const signed short)(vertices[indicesCCW[x * 3 + 1] ].posY + 0.5f);
			primTriData.v2.invZ = 2.0f;
			primTriData.v2.xTex = -0x5555;
			primTriData.v2.yTex = -0x6666;
			primTriData.v2.rgba = D3DCOLOR_ARGB(255, 0, 0, 255);
			if (randomZPositions)
			{
				const float randomZ0 = frand() * 0.5f + 0.5f; // We currently only support depth values between 0.5f and 1.0f
				const float randomZ1 = frand() * 0.5f + 0.5f;
				const float randomZ2 = frand() * 0.5f + 0.5f;
				primTriData.v0.invZ = 1.0f / randomZ0;
				primTriData.v1.invZ = 1.0f / randomZ1;
				primTriData.v2.invZ = 1.0f / randomZ2;
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

			successResult &= runDepthInterpTest(triSetupData, rasterizedPixels, randomZPositions);
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

			const bool useRandomZPositions = true;
			testSimpleDrawCall(verts, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3, useRandomZPositions);
		}
	}

	return successResult ? S_OK : E_FAIL;
}
