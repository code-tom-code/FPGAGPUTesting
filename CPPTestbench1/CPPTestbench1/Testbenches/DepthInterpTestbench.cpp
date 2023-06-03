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

static const float frand()
{
	return rand() / (const float)RAND_MAX;
}

enum depthInterpStateType
{
	waitingForRead, // 0
	kickNewPixel, // 1
	setNewPrimitiveSlot, // 2
	setDepthState, // 3
	signalSpecialPixelMessage // 4
};

void EmulateDepthInterpCPU(const DepthInterpTriCache& depthInterpTriCache, const std::vector<rasterizedPixelData>& rasterizedPixels, std::vector<depthInterpOutputData>& outDepthInterpData, std::vector<unsigned>& outDebugDepthValues)
{
	DepthInterpTriCache localDepthTriCacheCopy = depthInterpTriCache;

	float currentTriBarycentricInverse = 1.0f;
	float Z0 = 0.5f;
	float Z10 = 0.0f;
	float Z20 = 0.0f;
	float InvW0 = 1.0f;
	float InvW10 = 0.0f;
	float InvW20 = 0.0f;

	const unsigned numPixels = (const unsigned)rasterizedPixels.size();
	for (unsigned x = 0; x < numPixels; ++x)
	{
		const rasterizedPixelData& thisPixelData = rasterizedPixels[x];
		if (IsSpecialCodePixel(thisPixelData.pixelX) )
		{
			if (thisPixelData.pixelX == startNewTriangleSlotCommand)
			{
				const DepthInterpTriCache::DepthTriCacheData& currentTriData = localDepthTriCacheCopy.dataFifo.front();
				currentTriBarycentricInverse = currentTriData.BarycentricInverse;
				Z0 = currentTriData.Z0;
				Z10 = currentTriData.Z10;
				Z20 = currentTriData.Z20;
				InvW0 = currentTriData.InvW0;
				InvW10 = currentTriData.InvW10;
				InvW20 = currentTriData.InvW20;
			}
			else if (thisPixelData.pixelX == finishCurrentTriangleCommand)
			{
				localDepthTriCacheCopy.dataFifo.erase(localDepthTriCacheCopy.dataFifo.begin() );
			}

			// Pass through these special messages to the next stage:
			depthInterpOutputData newDepthInterpOutput;
			newDepthInterpOutput.pixelX = thisPixelData.pixelX;
			newDepthInterpOutput.pixelY = thisPixelData.pixelY;
			newDepthInterpOutput.normalizedBarycentricB = 0.0f;
			newDepthInterpOutput.normalizedBarycentricC = 0.0f;
			newDepthInterpOutput.interpolatedPixelW = 0.0f;
			outDepthInterpData.push_back(newDepthInterpOutput);
			continue;
		}

		const float normalizedBarycentricB = thisPixelData.barycentricB * currentTriBarycentricInverse;
		const float normalizedBarycentricC = thisPixelData.barycentricC * currentTriBarycentricInverse;

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
			const float dotproductResultW = InvW10 * normalizedBarycentricB + InvW20 * normalizedBarycentricC + InvW0;

			const float interpolatedPixelW = 1.0f / dotproductResultW;

			depthInterpOutputData newDepthInterpOutput;
			newDepthInterpOutput.pixelX = thisPixelData.pixelX;
			newDepthInterpOutput.pixelY = thisPixelData.pixelY;
			newDepthInterpOutput.normalizedBarycentricB = normalizedBarycentricB;
			newDepthInterpOutput.normalizedBarycentricC = normalizedBarycentricC;
			newDepthInterpOutput.interpolatedPixelW = interpolatedPixelW;
			outDepthInterpData.push_back(newDepthInterpOutput);

			outDebugDepthValues.push_back(u24Depth);
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
			DEPTH_PixelFailedDepthTest = !(pipeStages[0].pixelDepth <= 16777215);
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

	std_logic_port TRICACHE_PopTriangleSlot(PD_OUT, loader, "TRICACHE_PopTriangleSlot");
// TriWorkCache per-triangle interface end

// Rasterizer Output per-pixel interface begin
	std_logic_vector_port<32+32+16+16> RASTOUT_FIFO_rd_data(PD_IN, loader, "RASTOUT_FIFO_rd_data");
	std_logic_port RASTOUT_FIFO_empty(PD_IN, loader, "RASTOUT_FIFO_empty");
	std_logic_port RASTOUT_FIFO_rd_en(PD_OUT, loader, "RASTOUT_FIFO_rd_en");
// Rasterizer Output per-pixel interface end

// Command Processor interface begin
	std_logic_port CMD_IsIdle(PD_OUT, loader, "CMD_IsIdle");
// Command Processor interface end

// Depth Interpolator State Block interface begin
	std_logic_vector_port<40> STATE_StateBitsAtDrawID(PD_IN, loader, "STATE_StateBitsAtDrawID");
	std_logic_vector_port<16> STATE_NextDrawID(PD_IN, loader, "STATE_NextDrawID");
	std_logic_port STATE_StateIsValid(PD_IN, loader, "STATE_StateIsValid");
	std_logic_port STATE_ConsumeStateSlot(PD_OUT, loader, "STATE_ConsumeStateSlot");
// Depth Interpolator State Block interface end

// FPU interfaces begin
	// MUL pipe for multiplication:
	std_logic_vector_port<32> FPU_MUL_A(PD_OUT, loader, "FPU_MUL_A");
	std_logic_vector_port<32> FPU_MUL_B(PD_OUT, loader, "FPU_MUL_B");
	std_logic_vector_port<32> FPU_MUL_OUT(PD_IN, loader, "FPU_MUL_OUT");
	std_logic_port FPU_MUL_GO(PD_OUT, loader, "FPU_MUL_GO");

	// CNV pipe for u32 to f32 conversions:
	std_logic_vector_port<32> FPU_CNV0_A(PD_OUT, loader, "FPU_CNV0_A");
	std_logic_vector_port<3> FPU_CNV0_Mode(PD_OUT, loader, "FPU_CNV0_Mode");
	std_logic_vector_port<32> FPU_CNV0_OUT(PD_IN, loader, "FPU_CNV0_OUT");
	std_logic_port FPU_CNV0_GO(PD_OUT, loader, "FPU_CNV0_GO");

	// CNV pipe for f32 to u24 conversion:
	std_logic_vector_port<32> FPU_CNV1_A(PD_OUT, loader, "FPU_CNV1_A");
	std_logic_vector_port<3> FPU_CNV1_Mode(PD_OUT, loader, "FPU_CNV1_Mode");
	std_logic_vector_port<32> FPU_CNV1_OUT(PD_IN, loader, "FPU_CNV1_OUT");
	std_logic_port FPU_CNV1_GO(PD_OUT, loader, "FPU_CNV1_GO");

	// SPEC pipe for float reciprocal:
	std_logic_vector_port<32> FPU_SPEC_A(PD_OUT, loader, "FPU_SPEC_A");
	std_logic_vector_port<32> FPU_SPEC_OUT(PD_IN, loader, "FPU_SPEC_OUT");
	std_logic_port FPU_SPEC_GO(PD_OUT, loader, "FPU_SPEC_GO");
// FPU interfaces end

// Depth Buffer interface begin
	std_logic_port DEPTH_PixelReady(PD_OUT, loader, "DEPTH_PixelReady");
	std_logic_vector_port<10> DEPTH_PosX(PD_OUT, loader, "DEPTH_PosX");
	std_logic_vector_port<10> DEPTH_PosY(PD_OUT, loader, "DEPTH_PosY");
	std_logic_vector_port<24> DEPTH_OutPixelDepth(PD_OUT, loader, "DEPTH_OutPixelDepth");
	std_logic_port DEPTH_PixelPassedDepthTest(PD_IN, loader, "DEPTH_PixelPassedDepthTest");
	std_logic_port DEPTH_PixelFailedDepthTest(PD_IN, loader, "DEPTH_PixelFailedDepthTest");

	std_logic_port DEPTH_SetDepthParams(PD_OUT, loader, "DEPTH_SetDepthParams");
	std_logic_port DEPTH_DepthWriteEnable(PD_OUT, loader, "DEPTH_DepthWriteEnable");
	std_logic_vector_port<3> DEPTH_DepthFunction(PD_OUT, loader, "DEPTH_DepthFunction");
	std_logic_port DEPTH_DepthIsIdle(PD_IN, loader, "DEPTH_DepthIsIdle");
// Depth Buffer interface end

// Attribute Interpolator FIFO interface begin
	std_logic_port ATTR_FIFO_full(PD_IN, loader, "ATTR_FIFO_full");
	std_logic_port ATTR_FIFO_wr_en(PD_OUT, loader, "ATTR_FIFO_wr_en");
	std_logic_vector_port<128> ATTR_FIFO_wr_data(PD_OUT, loader, "ATTR_FIFO_wr_data");
	std_logic_port ATTR_FIFO_almost_full(PD_IN, loader, "ATTR_FIFO_almost_full");
// Attribute Interpolator FIFO interface end

// Debug signals
	std_logic_vector_port<7> DBG_DepthInterpolator_State(PD_OUT, loader, "DBG_DepthInterpolator_State");
	std_logic_vector_port<4> DBG_BarycentricConvertState(PD_OUT, loader, "DBG_BarycentricConvertState");
	std_logic_vector_port<4> DBG_BarycentricNormalizeState(PD_OUT, loader, "DBG_BarycentricNormalizeState");
	std_logic_vector_port<4> DBG_InterpolatorDriverState(PD_OUT, loader, "DBG_InterpolatorDriverState");
	std_logic_vector_port<4> DBG_ShiftConvertZState(PD_OUT, loader, "DBG_ShiftConvertZState");
	std_logic_vector_port<4> DBG_DepthTestDriverZState(PD_OUT, loader, "DBG_DepthTestDriverZState");
	std_logic_vector_port<32> DBG_RastBarycentricB(PD_OUT, loader, "DBG_RastBarycentricB");
	std_logic_vector_port<32> DBG_RastBarycentricC(PD_OUT, loader, "DBG_RastBarycentricC");
	std_logic_vector_port<24> DBG_InterpolatedDepthU24(PD_OUT, loader, "DBG_InterpolatedDepthU24");
	std_logic_vector_port<10> DBG_IdleVector(PD_OUT, loader, "DBG_IdleVector");
	std_logic_vector_port<64> DBG_BarycentricBCFIFO(PD_OUT, loader, "DBG_BarycentricBCFIFO");

	FPU depthInterpFPU_MUL(0);
	FPU depthInterpFPU_CNV0(0);
	FPU depthInterpFPU_CNV1(1);
	FPU depthInterpFPU_SPEC(0);
	simulatedDepthBuffer depthInterpDepthBuffer;
	DepthInterpTriCache depthInterpTriCache;
	unsigned totalTriCount = 0;
	unsigned totalPixelCount = 0;
	unsigned totalCycleCount = 0;

	bool successResult = true;

	srand(3); // Pick a stable seed so we get consistent random results

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		RASTOUT_FIFO_empty = true;
		ATTR_FIFO_almost_full = false;
		FPU_MUL_OUT = 0.0f;
		FPU_CNV0_OUT = 0.0f;
		FPU_CNV1_OUT = 0.0f;
		FPU_SPEC_OUT = 0.0f;
		DEPTH_PixelPassedDepthTest = false;
		DEPTH_PixelFailedDepthTest = false;
		ATTR_FIFO_full = false;
		DEPTH_DepthIsIdle = true;
		STATE_StateIsValid = false;
		STATE_NextDrawID = 0x0000;
		STATE_StateBitsAtDrawID.SetToZero();
	}

	auto simulateRTLDepthInterp = [&](std::vector<rasterizedPixelData> rasterizedPixels, std::vector<depthInterpOutputData>& outDepthInterpData, std::vector<unsigned>& outDebugDepthValues)
	{
		depthInterpTriCache.Update(TRICACHE_PopTriangleSlot,
			TRICACHE_inBarycentricInverse, TRICACHE_inZ0, TRICACHE_inZ10, TRICACHE_inZ20,
			TRICACHE_inInvW0, TRICACHE_inInvW10, TRICACHE_inInvW20);
		RASTOUT_FIFO_rd_data.SetStructVal(rasterizedPixels[0]);

		totalPixelCount += (const unsigned)rasterizedPixels.size();

		bool isEvenDepthSubmit = true;

		while (!rasterizedPixels.empty() || CMD_IsIdle.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);

			++totalCycleCount;

			const depthInterpStateType depthInterpState = (const depthInterpStateType)DBG_DepthInterpolator_State.GetUint8Val();
			const uint8_t barycentricConvertState = DBG_BarycentricConvertState.GetUint8Val();
			const uint8_t barycentricNormalizeState = DBG_BarycentricNormalizeState.GetUint8Val();
			const uint8_t interpolatorDriverState = DBG_InterpolatorDriverState.GetUint8Val();
			const uint8_t shiftConvertZState = DBG_ShiftConvertZState.GetUint8Val();
			const uint8_t depthTestDriverState = DBG_DepthTestDriverZState.GetUint8Val();
			const uint16_t idleVector = DBG_IdleVector.GetUint16Val();
			const uint64_t bcData = DBG_BarycentricBCFIFO.GetUint64Val();

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
			if (ATTR_FIFO_wr_en.GetBoolVal() )
			{
				depthInterpOutputData newOutData;
				ATTR_FIFO_wr_data.GetStructVal(newOutData);
				outDepthInterpData.push_back(newOutData);
			}
			depthInterpFPU_MUL.UpdateMulOnly(FPU_MUL_GO, FPU_MUL_A, FPU_MUL_B, FPU_MUL_OUT);
			depthInterpFPU_CNV0.UpdateCnvOnly(FPU_CNV0_GO, FPU_CNV0_Mode, FPU_CNV0_A, FPU_CNV0_OUT);
			depthInterpFPU_CNV1.UpdateCnvOnly(FPU_CNV1_GO, FPU_CNV1_Mode, FPU_CNV1_A, FPU_CNV1_OUT);
			depthInterpFPU_SPEC.UpdateRcpOnly(FPU_SPEC_GO, FPU_SPEC_A, FPU_SPEC_OUT);
			depthInterpDepthBuffer.Update(DEPTH_PixelReady, DEPTH_PosX, DEPTH_PosY, DEPTH_OutPixelDepth, DEPTH_PixelPassedDepthTest, DEPTH_PixelFailedDepthTest);
			if (DEPTH_PixelReady.GetBoolVal() )
			{
				const unsigned dbgDepth24 = DBG_InterpolatedDepthU24.GetUint32Val();
				if (enableDebugOutput)
				{
					printf("Depth output: [%i, %i] Value: 0x%06X (%u)\n", DEPTH_PosX.GetInt16Val(), DEPTH_PosY.GetInt16Val(), dbgDepth24, dbgDepth24);
				}

				// Since we pulse the depth test twice for every pixel, we only want to capture every other depth test:
				if (isEvenDepthSubmit)
				{
					outDebugDepthValues.push_back(dbgDepth24);
				}
				isEvenDepthSubmit = !isEvenDepthSubmit;
			}
			depthInterpTriCache.Update(TRICACHE_PopTriangleSlot,
				TRICACHE_inBarycentricInverse, TRICACHE_inZ0, TRICACHE_inZ10, TRICACHE_inZ20,
				TRICACHE_inInvW0, TRICACHE_inInvW10, TRICACHE_inInvW20);
		}
	};

	auto runDepthInterpTest = [&](const std::vector<rasterizedPixelData>& rasterizedPixels, const bool useRandomZWPositions) -> bool
	{
		std::vector<depthInterpOutputData> emulatedCPUDepthInterpData;
		std::vector<depthInterpOutputData> simulatedRTLDepthInterpData;
		std::vector<unsigned> emulatedCPUDepthValues;
		std::vector<unsigned> simulatedRTLDepthValues;
		EmulateDepthInterpCPU(depthInterpTriCache, rasterizedPixels, emulatedCPUDepthInterpData, emulatedCPUDepthValues);
		simulateRTLDepthInterp(rasterizedPixels, simulatedRTLDepthInterpData, simulatedRTLDepthValues);

		if (emulatedCPUDepthInterpData.size() != simulatedRTLDepthInterpData.size() )
		{
			__debugbreak();
			return false;
		}

		if (emulatedCPUDepthValues.size() != simulatedRTLDepthValues.size() )
		{
			__debugbreak();
			return false;
		}

		/*const float z0 = clipspaceOutTri.v0.zPos / clipspaceOutTri.v0.wPos;
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
		const unsigned zMaxU24 = (const unsigned)(16777215.0f * zMax);*/

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

			if (!IsSpecialCodePixel(simulatedRTLPixel.pixelX) )
			{
				// Check for out of range pixel coords:
				if (simulatedRTLPixel.pixelX < 0 ||
					simulatedRTLPixel.pixelY < 0 ||
					simulatedRTLPixel.pixelX > 639 ||
					simulatedRTLPixel.pixelY > 479)
				{
					__debugbreak();
					return false;
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
		}

		const unsigned numOutputDepths = (const unsigned)emulatedCPUDepthValues.size();
		for (unsigned x = 0; x < numOutputDepths; ++x)
		{
			const unsigned emulatedCPUDepthValue = emulatedCPUDepthValues[x];
			const unsigned simulatedRTLDepthValue = simulatedRTLDepthValues[x];

			const int delta = (const int)simulatedRTLDepthValue - (const int)emulatedCPUDepthValue;
			if (!(abs(delta) <= 3) )
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
			}
			if (emulatedCPUDepthValue + 1 < zMinU24) // Fudge by one depth unit just in case we have some float precision issues
			{
				__debugbreak();
			}
			if (emulatedCPUDepthValue - 1 > zMaxU24)
			{
				__debugbreak();
			}*/
		}

		return true;
	};

	auto addSingleTriToDrawCall = [&](const triSetupInput& singleTri, std::vector<rasterizedPixelData>& rasterizedPixels, const bool testRandomZWPositions = false)
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

			DepthInterpTriCache::DepthTriCacheData newTriData;
			newTriData.BarycentricInverse = triSetupData.barycentricInverse;
			newTriData.Z0 = triSetupData.v0.Z;
			newTriData.Z10 = triSetupData.v10.Z;
			newTriData.Z20 = triSetupData.v20.Z;
			newTriData.InvW0 = triSetupData.v0.invW;
			newTriData.InvW10 = triSetupData.v10.invW;
			newTriData.InvW20 = triSetupData.v20.invW;
			depthInterpTriCache.dataFifo.push_back(newTriData);

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
		}
	};

	// Indices are expected to arrive in CCW order:
	auto testSimpleDrawCall = [&](const testVert* const vertices, const unsigned short* const indicesCCW, const unsigned numPrims, const bool randomZWPositions = false)
	{
		std::vector<rasterizedPixelData> rasterizedPixels;
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

			addSingleTriToDrawCall(primTriData, rasterizedPixels, randomZWPositions);
		}

		successResult &= runDepthInterpTest(rasterizedPixels, randomZWPositions);

		if (!depthInterpTriCache.dataFifo.empty() )
		{
			__debugbreak(); // The depth triangle cache should be empty at this point!
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

	//enableDebugOutput = true;

	// Test case with three triangles using data from a PIX capture (warning: may take a little while to rasterize and validate - this is not a super small triangle):
	{
		std::vector<rasterizedPixelData> rasterizedPixels;
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
		addSingleTriToDrawCall(testTri, rasterizedPixels);
		const bool useRandomZWPositions = false;
		successResult &= runDepthInterpTest(rasterizedPixels, useRandomZWPositions);
	}

	// Let's try doing 128 random small triangles (about half will get backface culled, and some others may get degenerate triangle culled or clipped off the screen):
	{
		srand(3); // Set a deterministic seed so we get the same results every time
		static const unsigned primCount = 128u;
		std::vector<testVert> testVerts;
		std::vector<unsigned short> testIndices;
		testVerts.reserve(3 * primCount);
		testIndices.reserve(3 * primCount);
		for (unsigned x = 0; x < primCount; ++x)
		{
			testVert verts[3];
			verts[0].posX = ( (rand() % 800) - 80) + 0.5f; // Random xPos between -80 and +720
			verts[0].posY = ( (rand() % 600) - 60) + 0.5f; // Random yPos between -60 and +540

			verts[1].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
			verts[1].posY = verts[0].posY + ( (rand() % 100) - 50); // Random yOffset between -50 and +50
			
			verts[2].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
			verts[2].posY = verts[0].posY + ( (rand() % 100) - 50); // Random yOffset between -50 and +50

			testVerts.push_back(verts[0]);
			testVerts.push_back(verts[1]);
			testVerts.push_back(verts[2]);
			testIndices.push_back(x * 3 + 0);
			testIndices.push_back(x * 3 + 1);
			testIndices.push_back(x * 3 + 2);
		}

		const bool useRandomZWPositions = true;
		testSimpleDrawCall(&testVerts.front(), &testIndices.front(), primCount, useRandomZWPositions);
	}

	printf("Total simulated prims: %u\n", totalTriCount);
	printf("Total simulated pixels: %u\n", totalPixelCount);
	printf("Total simulated RTL cycles: %u\n", totalCycleCount);
	printf("Average cycles per pixel: %f\n", totalCycleCount / (const float)totalPixelCount);
	
	return successResult ? S_OK : E_FAIL;
}
