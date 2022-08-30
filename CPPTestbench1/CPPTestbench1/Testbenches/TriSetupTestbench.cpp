#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "ShaderCoreALUCommon.h" // Include the Float ALU Common from the ShaderCore
#include "../D3DTriRasterizeTestData.h"
#include "PixelPipelineShared.h"
#include <algorithm> // for std::min/std::max

static inline const int computeEdgeSidedness(const int ax, const int ay, const int bx, const int by, const int cx, const int cy)
{
	return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax);
}

static inline const bool isTopLeftEdge(const int v0x, const int v0y, const int v1x, const int v1y)
{
	const int dx = v1x - v0x;
	const int dy = v1y - v0y;
	return ( (dy < 0) || ( (dy == 0) && (dx < 0) ) );
}

triSetupResultType EmulateCPUTriSetup(const triSetupInput& inTriData, triSetupOutput& outTriSetupOutput)
{
	const signed short vx0 = inTriData.v0.xPos;
	const signed short vy0 = inTriData.v0.yPos;
	const signed short vx1 = inTriData.v1.xPos;
	const signed short vy1 = inTriData.v1.yPos;
	const signed short vx2 = inTriData.v2.xPos;
	const signed short vy2 = inTriData.v2.yPos;
	const float vinvz0 = inTriData.v0.invZ;
	const float vinvz1 = inTriData.v1.invZ;
	const float vinvz2 = inTriData.v2.invZ;

	if ( (vx0 == vx1 && vy0 == vy1) ||
		(vx0 == vx2 && vy0 == vy2) ||
		(vx1 == vx2 && vy1 == vy2) )
		return triSetup_DuplicateVertexCull;

	if ( (vinvz0 < 0.0f || vinvz0 < 1.0f) ||
		(vinvz1 < 0.0f || vinvz1 < 1.0f) ||
		(vinvz2 < 0.0f || vinvz2 < 1.0f) )
		return triSetup_CulledZClip;

	signed short minX = std::min(std::min(vx0, vx1), vx2);
	signed short maxX = std::max(std::max(vx0, vx1), vx2);
	signed short minY = std::min(std::min(vy0, vy1), vy2);
	signed short maxY = std::max(std::max(vy0, vy1), vy2);

	// Clip our triangle's 2D AABB bounds to (0, 0) and to (640-1, 480-1):
	minX = std::max(minX, (signed short)0);
	minY = std::max(minY, (signed short)0);
	maxX = std::min(maxX, (signed short)(640-1) );
	maxY = std::min(maxY, (signed short)(480-1) );

	if ( (minX >= maxX) ||
		(minY >= maxY) )
		return triSetup_ZeroBounds;

	const int twiceTriangleArea = computeEdgeSidedness(vx0, vy0, vx1, vy1, vx2, vy2);
	if (twiceTriangleArea < 0)
		return triSetup_BackfaceCull;
	else if (twiceTriangleArea == 0)
		return triSetup_ZeroAreaCull;

	const float barycentricNormalizeFactor = 1.0f / (const float)twiceTriangleArea;

	// barycentricXDelta = int3(y012 - y120).yzx
	const signed short barycentricXDeltaA = vy1 - vy2;
	const signed short barycentricXDeltaB = vy2 - vy0;
	const signed short barycentricXDeltaC = vy0 - vy1;

	// barycentricYDelta = int3(x120 - x012).yzx
	const signed short barycentricYDeltaA = vx2 - vx1;
	const signed short barycentricYDeltaB = vx0 - vx2;
	const signed short barycentricYDeltaC = vx1 - vx0;

	// Correct for top-left rule. Source: https://fgiesen.wordpress.com/2013/02/08/triangle-rasterization-in-practice/
	const char topLeftEdgeBias0 = isTopLeftEdge(vx1, vy1, vx2, vy2) ? 0 : -1;
	const char topLeftEdgeBias1 = isTopLeftEdge(vx2, vy2, vx0, vy0) ? 0 : -1;
	const char topLeftEdgeBias2 = isTopLeftEdge(vx0, vy0, vx1, vy1) ? 0 : -1;

	const int barycentricRowResetA = computeEdgeSidedness(vx1, vy1, vx2, vy2, minX, minY) + topLeftEdgeBias0;
	const int barycentricRowResetB = computeEdgeSidedness(vx2, vy2, vx0, vy0, minX, minY) + topLeftEdgeBias1;
	const int barycentricRowResetC = computeEdgeSidedness(vx0, vy0, vx1, vy1, minX, minY) + topLeftEdgeBias2;

	outTriSetupOutput.barycentricInverse = barycentricNormalizeFactor;
	outTriSetupOutput.triBoundsAABB.minX = minX;
	outTriSetupOutput.triBoundsAABB.maxX = maxX;
	outTriSetupOutput.triBoundsAABB.minY = minY;
	outTriSetupOutput.triBoundsAABB.maxY = maxY;
	outTriSetupOutput.initialBarycentricRowResetA = barycentricRowResetA;
	outTriSetupOutput.initialBarycentricRowResetB = barycentricRowResetB;
	outTriSetupOutput.initialBarycentricRowResetC = barycentricRowResetC;
	outTriSetupOutput.isTopLeftEdgeA = (topLeftEdgeBias0 == 0);
	outTriSetupOutput.isTopLeftEdgeB = (topLeftEdgeBias1 == 0);
	outTriSetupOutput.isTopLeftEdgeC = (topLeftEdgeBias2 == 0);
	outTriSetupOutput.xDeltas.a = barycentricXDeltaA;
	outTriSetupOutput.xDeltas.b = barycentricXDeltaB;
	outTriSetupOutput.xDeltas.c = barycentricXDeltaC;
	outTriSetupOutput.yDeltas.a = barycentricYDeltaA;
	outTriSetupOutput.yDeltas.b = barycentricYDeltaB;
	outTriSetupOutput.yDeltas.c = barycentricYDeltaC;
	outTriSetupOutput.v0.invZ = vinvz0;
	outTriSetupOutput.v1.invZ = vinvz1;
	outTriSetupOutput.v2.invZ = vinvz2;
	outTriSetupOutput.v0.rgba = inTriData.v0.rgba;
	outTriSetupOutput.v1.rgba = inTriData.v1.rgba;
	outTriSetupOutput.v2.rgba = inTriData.v2.rgba;
	outTriSetupOutput.v0.xTex = inTriData.v0.xTex;
	outTriSetupOutput.v0.yTex = inTriData.v0.yTex;
	outTriSetupOutput.v1.xTex = inTriData.v1.xTex;
	outTriSetupOutput.v1.yTex = inTriData.v1.yTex;
	outTriSetupOutput.v2.xTex = inTriData.v2.xTex;
	outTriSetupOutput.v2.yTex = inTriData.v2.yTex;

	return triSetup_OK;
}

const int RunTestsTriSetup(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

	std_logic_port TEXCFG_nointerpolation(PD_IN, loader, "TEXCFG_nointerpolation");

	std_logic_port IA_newTriBegin(PD_IN, loader, "IA_newTriBegin");
	std_logic_port IA_readyForNewTri(PD_OUT, loader, "IA_readyForNewTri");

	std_logic_vector_port<16> IA_v0_in_x(PD_IN, loader, "IA_v0_in_x");
	std_logic_vector_port<16> IA_v0_in_y(PD_IN, loader, "IA_v0_in_y");
	std_logic_vector_port<32> IA_v0_in_invZ(PD_IN, loader, "IA_v0_in_invZ");
	std_logic_vector_port<16> IA_t0_in_x(PD_IN, loader, "IA_t0_in_x");
	std_logic_vector_port<16> IA_t0_in_y(PD_IN, loader, "IA_t0_in_y");
	std_logic_vector_port<32> IA_v0_in_RGBA(PD_IN, loader, "IA_v0_in_RGBA");
	std_logic_vector_port<16> IA_v1_in_x(PD_IN, loader, "IA_v1_in_x");
	std_logic_vector_port<16> IA_v1_in_y(PD_IN, loader, "IA_v1_in_y");
	std_logic_vector_port<32> IA_v1_in_invZ(PD_IN, loader, "IA_v1_in_invZ");
	std_logic_vector_port<16> IA_t1_in_x(PD_IN, loader, "IA_t1_in_x");
	std_logic_vector_port<16> IA_t1_in_y(PD_IN, loader, "IA_t1_in_y");
	std_logic_vector_port<32> IA_v1_in_RGBA(PD_IN, loader, "IA_v1_in_RGBA");
	std_logic_vector_port<16> IA_v2_in_x(PD_IN, loader, "IA_v2_in_x");
	std_logic_vector_port<16> IA_v2_in_y(PD_IN, loader, "IA_v2_in_y");
	std_logic_vector_port<32> IA_v2_in_invZ(PD_IN, loader, "IA_v2_in_invZ");
	std_logic_vector_port<16> IA_t2_in_x(PD_IN, loader, "IA_t2_in_x");
	std_logic_vector_port<16> IA_t2_in_y(PD_IN, loader, "IA_t2_in_y");
	std_logic_vector_port<32> IA_v2_in_RGBA(PD_IN, loader, "IA_v2_in_RGBA");

	std_logic_port RAST_readyForTriSetupData(PD_IN, loader, "RAST_readyForTriSetupData");
	std_logic_port RAST_triSetupDataIsValid(PD_OUT, loader, "RAST_triSetupDataIsValid");

	std_logic_vector_port<32> RAST_outBarycentricInverse(PD_OUT, loader, "RAST_outBarycentricInverse");
	std_logic_vector_port<32> RAST_v0_out_invZ(PD_OUT, loader, "RAST_v0_out_invZ");
	std_logic_vector_port<32> RAST_v1_out_invZ(PD_OUT, loader, "RAST_v1_out_invZ");
	std_logic_vector_port<32> RAST_v2_out_invZ(PD_OUT, loader, "RAST_v2_out_invZ");
	std_logic_vector_port<16> RAST_t0_out_x(PD_OUT, loader, "RAST_t0_out_x");
	std_logic_vector_port<16> RAST_t0_out_y(PD_OUT, loader, "RAST_t0_out_y");
	std_logic_vector_port<16> RAST_t1_out_x(PD_OUT, loader, "RAST_t1_out_x");
	std_logic_vector_port<16> RAST_t1_out_y(PD_OUT, loader, "RAST_t1_out_y");
	std_logic_vector_port<16> RAST_t2_out_x(PD_OUT, loader, "RAST_t2_out_x");
	std_logic_vector_port<16> RAST_t2_out_y(PD_OUT, loader, "RAST_t2_out_y");
	std_logic_vector_port<32> RAST_v0_out_colorRGBA(PD_OUT, loader, "RAST_v0_out_colorRGBA");
	std_logic_vector_port<32> RAST_v1_out_colorRGBA(PD_OUT, loader, "RAST_v1_out_colorRGBA");
	std_logic_vector_port<32> RAST_v2_out_colorRGBA(PD_OUT, loader, "RAST_v2_out_colorRGBA");
	std_logic_vector_port<16> RAST_outMinX(PD_OUT, loader, "RAST_outMinX");
	std_logic_vector_port<16> RAST_outMaxX(PD_OUT, loader, "RAST_outMaxX");
	std_logic_vector_port<16> RAST_outMinY(PD_OUT, loader, "RAST_outMinY");
	std_logic_vector_port<16> RAST_outMaxY(PD_OUT, loader, "RAST_outMaxY");
	std_logic_vector_port<32> RAST_outInitialBarycentricRowResetA(PD_OUT, loader, "RAST_outInitialBarycentricRowResetA");
	std_logic_vector_port<32> RAST_outInitialBarycentricRowResetB(PD_OUT, loader, "RAST_outInitialBarycentricRowResetB");
	std_logic_vector_port<32> RAST_outInitialBarycentricRowResetC(PD_OUT, loader, "RAST_outInitialBarycentricRowResetC");
	std_logic_port RAST_outIsTopLeftEdgeA(PD_OUT, loader, "RAST_outIsTopLeftEdgeA");
	std_logic_port RAST_outIsTopLeftEdgeB(PD_OUT, loader, "RAST_outIsTopLeftEdgeB");
	std_logic_port RAST_outIsTopLeftEdgeC(PD_OUT, loader, "RAST_outIsTopLeftEdgeC");
	std_logic_vector_port<16> RAST_outBarycentricXDeltaA(PD_OUT, loader, "RAST_outBarycentricXDeltaA");
	std_logic_vector_port<16> RAST_outBarycentricXDeltaB(PD_OUT, loader, "RAST_outBarycentricXDeltaB");
	std_logic_vector_port<16> RAST_outBarycentricXDeltaC(PD_OUT, loader, "RAST_outBarycentricXDeltaC");
	std_logic_vector_port<16> RAST_outBarycentricYDeltaA(PD_OUT, loader, "RAST_outBarycentricYDeltaA");
	std_logic_vector_port<16> RAST_outBarycentricYDeltaB(PD_OUT, loader, "RAST_outBarycentricYDeltaB");
	std_logic_vector_port<16> RAST_outBarycentricYDeltaC(PD_OUT, loader, "RAST_outBarycentricYDeltaC");

	// FPU signals:
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

	// Debug signals:
	std_logic_vector_port<5> DBG_TriSetup_State(PD_OUT, loader, "DBG_TriSetup_State");

	FPU triSetupFPU(0);

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		IA_newTriBegin = false;
		TEXCFG_nointerpolation = false;
		RAST_readyForTriSetupData = true;
		FPU_OUT = 0.0f;
	}

	const auto runTriSetupTest = [&](const triSetupInput& inTriData, const triSetupResultType expectedResult) -> bool
	{
		unsigned dbgCurrentState = DBG_TriSetup_State.GetUint8Val();

		// Wait for the triSetup block to be ready
		while (IA_readyForNewTri.GetBoolVal() == false)
		{
			IA_newTriBegin = false;
			scoped_timestep time(loader, clk, 100);
			dbgCurrentState = DBG_TriSetup_State.GetUint8Val();
		}

		IA_v0_in_x = inTriData.v0.xPos;
		IA_v0_in_y = inTriData.v0.yPos;
		IA_v0_in_invZ = inTriData.v0.invZ;
		IA_t0_in_x = inTriData.v0.xTex;
		IA_t0_in_y = inTriData.v0.yTex;
		IA_v0_in_RGBA = (const uint32_t)(inTriData.v0.rgba);
		IA_v1_in_x = inTriData.v1.xPos;
		IA_v1_in_y = inTriData.v1.yPos;
		IA_v1_in_invZ = inTriData.v1.invZ;
		IA_t1_in_x = inTriData.v1.xTex;
		IA_t1_in_y = inTriData.v1.yTex;
		IA_v1_in_RGBA = (const uint32_t)(inTriData.v1.rgba);
		IA_v2_in_x = inTriData.v2.xPos;
		IA_v2_in_y = inTriData.v2.yPos;
		IA_v2_in_invZ = inTriData.v2.invZ;
		IA_t2_in_x = inTriData.v2.xTex;
		IA_t2_in_y = inTriData.v2.yTex;
		IA_v2_in_RGBA = (const uint32_t)(inTriData.v2.rgba);

		// Pulse the "go signal" on for just one cycle, then turn it off:
		{
			scoped_timestep time(loader, clk, 100);
			IA_newTriBegin = true;
			dbgCurrentState = DBG_TriSetup_State.GetUint8Val();
		}
		IA_newTriBegin = false;

		unsigned triSetupOutputCount = 0;

		triSetupOutput simulatedRTLOutput = {0};
		triSetupOutput emulatedCPUOutput = {0};

		while (IA_readyForNewTri.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);

			dbgCurrentState = DBG_TriSetup_State.GetUint8Val();

			triSetupFPU.Update(FPU_ISHFT_GO, FPU_IMUL_GO, FPU_IADD_GO, FPU_ICMP_GO, FPU_ISPEC_GO, FPU_ICNV_GO, FPU_IBIT_GO,	FPU_A, FPU_B, FPU_Mode, FPU_OUT);
			if (RAST_triSetupDataIsValid.GetBoolVal() )
			{
				if (triSetupOutputCount++ == 0)
				{
					simulatedRTLOutput.SerializeTriSetupOutput(RAST_outBarycentricInverse,
						RAST_v0_out_invZ, RAST_v1_out_invZ, RAST_v2_out_invZ,
						RAST_t0_out_x, RAST_t1_out_x, RAST_t2_out_x,
						RAST_t0_out_y, RAST_t1_out_y, RAST_t2_out_y,
						RAST_v0_out_colorRGBA, RAST_v1_out_colorRGBA, RAST_v2_out_colorRGBA,
						RAST_outMinX, RAST_outMinY, RAST_outMaxX, RAST_outMaxY,
						RAST_outInitialBarycentricRowResetA, RAST_outInitialBarycentricRowResetB, RAST_outInitialBarycentricRowResetC,
						RAST_outIsTopLeftEdgeA, RAST_outIsTopLeftEdgeB, RAST_outIsTopLeftEdgeC,
						RAST_outBarycentricXDeltaA, RAST_outBarycentricXDeltaB, RAST_outBarycentricXDeltaC,
						RAST_outBarycentricYDeltaA, RAST_outBarycentricYDeltaB, RAST_outBarycentricYDeltaC);
				}
			}
		}

		dbgCurrentState = DBG_TriSetup_State.GetUint8Val();

		const triSetupResultType emulatedCPUResult = EmulateCPUTriSetup(inTriData, emulatedCPUOutput);
		if (emulatedCPUResult != expectedResult)
		{
			if (emulatedCPUResult == triSetup_BackfaceCull && expectedResult == triSetup_ZeroAreaCull)
			{
				// This is fine. We can't distinguish between zero-area culling and backface culling in the emulator
			}
			else
			{
				__debugbreak(); // This usually means that the test case was not set up correctly!
				return false;
			}
		}

		if (triSetupOutputCount > 1)
		{
			__debugbreak();
			return false;
		}

		if (expectedResult == triSetup_OK && triSetupOutputCount != 1)
		{
			__debugbreak();
			return false;
		}
		else if (expectedResult != triSetup_OK && triSetupOutputCount != 0)
		{
			__debugbreak();
			return false;
		}

		if (expectedResult == triSetup_OK && emulatedCPUResult == triSetup_OK)
		{
			if (!(emulatedCPUOutput == simulatedRTLOutput) )
			{
				__debugbreak();
				return false;
			}
		}

		return true;
	};

	const auto runTriSetupTestRand = [&](const triSetupInput& inTriData) -> bool
	{
		unsigned dbgCurrentState = DBG_TriSetup_State.GetUint8Val();

		// Wait for the triSetup block to be ready
		while (IA_readyForNewTri.GetBoolVal() == false)
		{
			IA_newTriBegin = false;
			scoped_timestep time(loader, clk, 100);
			dbgCurrentState = DBG_TriSetup_State.GetUint8Val();
		}

		IA_v0_in_x = inTriData.v0.xPos;
		IA_v0_in_y = inTriData.v0.yPos;
		IA_v0_in_invZ = inTriData.v0.invZ;
		IA_t0_in_x = inTriData.v0.xTex;
		IA_t0_in_y = inTriData.v0.yTex;
		IA_v0_in_RGBA = (const uint32_t)(inTriData.v0.rgba);
		IA_v1_in_x = inTriData.v1.xPos;
		IA_v1_in_y = inTriData.v1.yPos;
		IA_v1_in_invZ = inTriData.v1.invZ;
		IA_t1_in_x = inTriData.v1.xTex;
		IA_t1_in_y = inTriData.v1.yTex;
		IA_v1_in_RGBA = (const uint32_t)(inTriData.v1.rgba);
		IA_v2_in_x = inTriData.v2.xPos;
		IA_v2_in_y = inTriData.v2.yPos;
		IA_v2_in_invZ = inTriData.v2.invZ;
		IA_t2_in_x = inTriData.v2.xTex;
		IA_t2_in_y = inTriData.v2.yTex;
		IA_v2_in_RGBA = (const uint32_t)(inTriData.v2.rgba);

		// Pulse the "go signal" on for just one cycle, then turn it off:
		{
			scoped_timestep time(loader, clk, 100);
			IA_newTriBegin = true;
			dbgCurrentState = DBG_TriSetup_State.GetUint8Val();
		}
		IA_newTriBegin = false;

		unsigned triSetupOutputCount = 0;

		triSetupOutput simulatedRTLOutput = {0};
		triSetupOutput emulatedCPUOutput = {0};

		while (IA_readyForNewTri.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);

			dbgCurrentState = DBG_TriSetup_State.GetUint8Val();

			triSetupFPU.Update(FPU_ISHFT_GO, FPU_IMUL_GO, FPU_IADD_GO, FPU_ICMP_GO, FPU_ISPEC_GO, FPU_ICNV_GO, FPU_IBIT_GO,	FPU_A, FPU_B, FPU_Mode, FPU_OUT);
			if (RAST_triSetupDataIsValid.GetBoolVal() )
			{
				if (triSetupOutputCount++ == 0)
				{
					simulatedRTLOutput.SerializeTriSetupOutput(RAST_outBarycentricInverse,
						RAST_v0_out_invZ, RAST_v1_out_invZ, RAST_v2_out_invZ,
						RAST_t0_out_x, RAST_t1_out_x, RAST_t2_out_x,
						RAST_t0_out_y, RAST_t1_out_y, RAST_t2_out_y,
						RAST_v0_out_colorRGBA, RAST_v1_out_colorRGBA, RAST_v2_out_colorRGBA,
						RAST_outMinX, RAST_outMinY, RAST_outMaxX, RAST_outMaxY,
						RAST_outInitialBarycentricRowResetA, RAST_outInitialBarycentricRowResetB, RAST_outInitialBarycentricRowResetC,
						RAST_outIsTopLeftEdgeA, RAST_outIsTopLeftEdgeB, RAST_outIsTopLeftEdgeC,
						RAST_outBarycentricXDeltaA, RAST_outBarycentricXDeltaB, RAST_outBarycentricXDeltaC,
						RAST_outBarycentricYDeltaA, RAST_outBarycentricYDeltaB, RAST_outBarycentricYDeltaC);
				}
			}
		}

		dbgCurrentState = DBG_TriSetup_State.GetUint8Val();

		const triSetupResultType emulatedCPUResult = EmulateCPUTriSetup(inTriData, emulatedCPUOutput);

		if (triSetupOutputCount > 1)
		{
			__debugbreak();
			return false;
		}

		if (emulatedCPUResult == triSetup_OK && triSetupOutputCount != 1)
		{
			__debugbreak();
			return false;
		}
		else if (emulatedCPUResult != triSetup_OK && triSetupOutputCount != 0)
		{
			__debugbreak();
			return false;
		}

		if (emulatedCPUResult == triSetup_OK && triSetupOutputCount == 1)
		{
			if (!(emulatedCPUOutput == simulatedRTLOutput) )
			{
				__debugbreak();
				return false;
			}
		}

		return true;
	};

	bool successResult = true;

	// Test a 3/3 trivial rejection degenerate triangle:
	{
		triSetupInput degenerateTriangleDataABC = {0};
		degenerateTriangleDataABC.v0.xPos = (const signed short)(degenTriangleZeroArea[0].posX + 0.5f);
		degenerateTriangleDataABC.v0.yPos = (const signed short)(degenTriangleZeroArea[0].posY + 0.5f);
		degenerateTriangleDataABC.v0.invZ = 2.0f;
		degenerateTriangleDataABC.v0.rgba = D3DCOLOR_ARGB(255, 255, 0, 0);
		degenerateTriangleDataABC.v1.xPos = (const signed short)(degenTriangleZeroArea[1].posX + 0.5f);
		degenerateTriangleDataABC.v1.yPos = (const signed short)(degenTriangleZeroArea[1].posY + 0.5f);
		degenerateTriangleDataABC.v1.invZ = degenerateTriangleDataABC.v0.invZ;
		degenerateTriangleDataABC.v1.rgba = degenerateTriangleDataABC.v0.rgba;
		degenerateTriangleDataABC.v2.xPos = (const signed short)(degenTriangleZeroArea[2].posX + 0.5f);
		degenerateTriangleDataABC.v2.yPos = (const signed short)(degenTriangleZeroArea[2].posY + 0.5f);
		degenerateTriangleDataABC.v2.invZ = degenerateTriangleDataABC.v0.invZ;
		degenerateTriangleDataABC.v2.rgba = degenerateTriangleDataABC.v0.rgba;
		successResult &= runTriSetupTest(degenerateTriangleDataABC, triSetup_DuplicateVertexCull);
	}

	// Test a 2/3 rejection degenerate triangle (A/B duplicate):
	{
		triSetupInput degenerateTriangleDataAB = {0};
		degenerateTriangleDataAB.v0.xPos = (const signed short)(degenTriangleZeroArea[0].posX + 0.5f);
		degenerateTriangleDataAB.v0.yPos = (const signed short)(degenTriangleZeroArea[0].posY + 0.5f);
		degenerateTriangleDataAB.v0.invZ = 2.0f;
		degenerateTriangleDataAB.v0.rgba = D3DCOLOR_ARGB(255, 255, 0, 0);
		degenerateTriangleDataAB.v1.xPos = (const signed short)(degenTriangleZeroArea[1].posX + 0.5f);
		degenerateTriangleDataAB.v1.yPos = (const signed short)(degenTriangleZeroArea[1].posY + 0.5f);
		degenerateTriangleDataAB.v1.invZ = degenerateTriangleDataAB.v0.invZ;
		degenerateTriangleDataAB.v1.rgba = degenerateTriangleDataAB.v0.rgba;
		degenerateTriangleDataAB.v2.xPos = (const signed short)(fullTriangle0[2].posX + 0.5f);
		degenerateTriangleDataAB.v2.yPos = (const signed short)(fullTriangle0[2].posY + 0.5f);
		degenerateTriangleDataAB.v2.invZ = degenerateTriangleDataAB.v0.invZ;
		degenerateTriangleDataAB.v2.rgba = degenerateTriangleDataAB.v0.rgba;
		successResult &= runTriSetupTest(degenerateTriangleDataAB, triSetup_DuplicateVertexCull);
	}

	// Test a 2/3 rejection degenerate triangle (A/C duplicate):
	{
		triSetupInput degenerateTriangleDataAC = {0};
		degenerateTriangleDataAC.v0.xPos = (const signed short)(degenTriangleZeroArea[0].posX + 0.5f);
		degenerateTriangleDataAC.v0.yPos = (const signed short)(degenTriangleZeroArea[0].posY + 0.5f);
		degenerateTriangleDataAC.v0.invZ = 2.0f;
		degenerateTriangleDataAC.v0.rgba = D3DCOLOR_ARGB(255, 255, 0, 0);
		degenerateTriangleDataAC.v1.xPos = (const signed short)(fullTriangle0[1].posX + 0.5f);
		degenerateTriangleDataAC.v1.yPos = (const signed short)(fullTriangle0[1].posY + 0.5f);
		degenerateTriangleDataAC.v1.invZ = degenerateTriangleDataAC.v0.invZ;
		degenerateTriangleDataAC.v1.rgba = degenerateTriangleDataAC.v0.rgba;
		degenerateTriangleDataAC.v2.xPos = (const signed short)(degenTriangleZeroArea[2].posX + 0.5f);
		degenerateTriangleDataAC.v2.yPos = (const signed short)(degenTriangleZeroArea[2].posY + 0.5f);
		degenerateTriangleDataAC.v2.invZ = degenerateTriangleDataAC.v0.invZ;
		degenerateTriangleDataAC.v2.rgba = degenerateTriangleDataAC.v0.rgba;
		successResult &= runTriSetupTest(degenerateTriangleDataAC, triSetup_DuplicateVertexCull);
	}

	// Test a 2/3 rejection degenerate triangle (B/C duplicate):
	{
		triSetupInput degenerateTriangleDataBC = {0};
		degenerateTriangleDataBC.v0.xPos = (const signed short)(fullTriangle0[0].posX + 0.5f);
		degenerateTriangleDataBC.v0.yPos = (const signed short)(fullTriangle0[0].posY + 0.5f);
		degenerateTriangleDataBC.v0.invZ = 2.0f;
		degenerateTriangleDataBC.v0.rgba = D3DCOLOR_ARGB(255, 255, 0, 0);
		degenerateTriangleDataBC.v1.xPos = (const signed short)(degenTriangleZeroArea[1].posX + 0.5f);
		degenerateTriangleDataBC.v1.yPos = (const signed short)(degenTriangleZeroArea[1].posY + 0.5f);
		degenerateTriangleDataBC.v1.invZ = degenerateTriangleDataBC.v0.invZ;
		degenerateTriangleDataBC.v1.rgba = degenerateTriangleDataBC.v0.rgba;
		degenerateTriangleDataBC.v2.xPos = (const signed short)(degenTriangleZeroArea[2].posX + 0.5f);
		degenerateTriangleDataBC.v2.yPos = (const signed short)(degenTriangleZeroArea[2].posY + 0.5f);
		degenerateTriangleDataBC.v2.invZ = degenerateTriangleDataBC.v0.invZ;
		degenerateTriangleDataBC.v2.rgba = degenerateTriangleDataBC.v0.rgba;
		successResult &= runTriSetupTest(degenerateTriangleDataBC, triSetup_DuplicateVertexCull);
	}

	// Test a case of a triangle with one of its vertices behind the near-clip plane:
	{
		triSetupInput triangleNearClipData = {0};
		triangleNearClipData.v0.xPos = (const signed short)(fullTriangle0[0].posX + 0.5f);
		triangleNearClipData.v0.yPos = (const signed short)(fullTriangle0[0].posY + 0.5f);
		triangleNearClipData.v0.invZ = 2.0f;
		triangleNearClipData.v1.xPos = (const signed short)(fullTriangle0[1].posX + 0.5f);
		triangleNearClipData.v1.yPos = (const signed short)(fullTriangle0[1].posY + 0.5f);
		triangleNearClipData.v1.invZ = -2.0f;
		triangleNearClipData.v2.xPos = (const signed short)(fullTriangle0[2].posX + 0.5f);
		triangleNearClipData.v2.yPos = (const signed short)(fullTriangle0[2].posY + 0.5f);
		triangleNearClipData.v2.invZ = 2.0f;
		successResult &= runTriSetupTest(triangleNearClipData, triSetup_CulledZClip);
	}

	// Test a case of a triangle with one of its vertices past the far-clip plane:
	{
		triSetupInput triangleNearClipData = {0};
		triangleNearClipData.v0.xPos = (const signed short)(fullTriangle0[0].posX + 0.5f);
		triangleNearClipData.v0.yPos = (const signed short)(fullTriangle0[0].posY + 0.5f);
		triangleNearClipData.v0.invZ = 2.0f;
		triangleNearClipData.v1.xPos = (const signed short)(fullTriangle0[1].posX + 0.5f);
		triangleNearClipData.v1.yPos = (const signed short)(fullTriangle0[1].posY + 0.5f);
		triangleNearClipData.v1.invZ = 0.75f;
		triangleNearClipData.v2.xPos = (const signed short)(fullTriangle0[2].posX + 0.5f);
		triangleNearClipData.v2.yPos = (const signed short)(fullTriangle0[2].posY + 0.5f);
		triangleNearClipData.v2.invZ = 2.0f;
		successResult &= runTriSetupTest(triangleNearClipData, triSetup_CulledZClip);
	}

	// Test a case of backface culling:
	{
		triSetupInput triangleBackfacingData = {0};
		triangleBackfacingData.v0.xPos = (const signed short)(fullTriangle0[0].posX + 0.5f);
		triangleBackfacingData.v0.yPos = (const signed short)(fullTriangle0[0].posY + 0.5f);
		triangleBackfacingData.v0.invZ = 2.0f;
		triangleBackfacingData.v1.xPos = (const signed short)(fullTriangle0[1].posX + 0.5f);
		triangleBackfacingData.v1.yPos = (const signed short)(fullTriangle0[1].posY + 0.5f);
		triangleBackfacingData.v1.invZ = 2.0f;
		triangleBackfacingData.v2.xPos = (const signed short)(fullTriangle0[2].posX + 0.5f);
		triangleBackfacingData.v2.yPos = (const signed short)(fullTriangle0[2].posY + 0.5f);
		triangleBackfacingData.v2.invZ = 2.0f;
		successResult &= runTriSetupTest(triangleBackfacingData, triSetup_BackfaceCull);
	}

	// Test a case of zero-area culling:
	{
		triSetupInput triangleZeroAreaData = {0};
		triangleZeroAreaData.v0.xPos = (const signed short)(smallTriangleZeroPixels[0].posX + 0.5f);
		triangleZeroAreaData.v0.yPos = (const signed short)(smallTriangleZeroPixels[0].posY + 0.5f);
		triangleZeroAreaData.v0.invZ = 2.0f;
		triangleZeroAreaData.v1.xPos = (const signed short)(smallTriangleZeroPixels[1].posX + 0.5f);
		triangleZeroAreaData.v1.yPos = (const signed short)(smallTriangleZeroPixels[1].posY + 0.5f);
		triangleZeroAreaData.v1.invZ = 2.0f;
		triangleZeroAreaData.v2.xPos = (const signed short)(smallTriangleZeroPixels[2].posX + 0.5f);
		triangleZeroAreaData.v2.yPos = (const signed short)(smallTriangleZeroPixels[2].posY + 0.5f);
		triangleZeroAreaData.v2.invZ = 2.0f;
		successResult &= runTriSetupTest(triangleZeroAreaData, triSetup_ZeroAreaCull);
	}

	// Test another (offset) case of zero-area culling:
	{
		triSetupInput triangleOffsetZeroAreaData = {0};
		triangleOffsetZeroAreaData.v0.xPos = (const signed short)(smallOffsetTriangleZeroPixels[0].posX + 0.5f);
		triangleOffsetZeroAreaData.v0.yPos = (const signed short)(smallOffsetTriangleZeroPixels[0].posY + 0.5f);
		triangleOffsetZeroAreaData.v0.invZ = 2.0f;
		triangleOffsetZeroAreaData.v1.xPos = (const signed short)(smallOffsetTriangleZeroPixels[1].posX + 0.5f);
		triangleOffsetZeroAreaData.v1.yPos = (const signed short)(smallOffsetTriangleZeroPixels[1].posY + 0.5f);
		triangleOffsetZeroAreaData.v1.invZ = 2.0f;
		triangleOffsetZeroAreaData.v2.xPos = (const signed short)(smallOffsetTriangleZeroPixels[2].posX + 0.5f);
		triangleOffsetZeroAreaData.v2.yPos = (const signed short)(smallOffsetTriangleZeroPixels[2].posY + 0.5f);
		triangleOffsetZeroAreaData.v2.invZ = 2.0f;
		successResult &= runTriSetupTest(triangleOffsetZeroAreaData, triSetup_ZeroAreaCull);
	}

	// Test a case of bounds clipping off the left edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffLeftEdgeData = {0};
		triangleOffLeftEdgeData.v0.xPos = (const signed short)(triangleOffLeftEdgeZeroPixels[0].posX + 0.5f);
		triangleOffLeftEdgeData.v0.yPos = (const signed short)(triangleOffLeftEdgeZeroPixels[0].posY + 0.5f);
		triangleOffLeftEdgeData.v0.invZ = 2.0f;
		triangleOffLeftEdgeData.v1.xPos = (const signed short)(triangleOffLeftEdgeZeroPixels[1].posX + 0.5f);
		triangleOffLeftEdgeData.v1.yPos = (const signed short)(triangleOffLeftEdgeZeroPixels[1].posY + 0.5f);
		triangleOffLeftEdgeData.v1.invZ = 2.0f;
		triangleOffLeftEdgeData.v2.xPos = (const signed short)(triangleOffLeftEdgeZeroPixels[2].posX + 0.5f);
		triangleOffLeftEdgeData.v2.yPos = (const signed short)(triangleOffLeftEdgeZeroPixels[2].posY + 0.5f);
		triangleOffLeftEdgeData.v2.invZ = 2.0f;
		successResult &= runTriSetupTest(triangleOffLeftEdgeData, triSetup_ZeroBounds);
	}

	// Test a case of bounds clipping off the top edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffTopEdgeData = {0};
		triangleOffTopEdgeData.v0.xPos = (const signed short)(triangleOffTopEdgeZeroPixels[0].posX + 0.5f);
		triangleOffTopEdgeData.v0.yPos = (const signed short)(triangleOffTopEdgeZeroPixels[0].posY + 0.5f);
		triangleOffTopEdgeData.v0.invZ = 2.0f;
		triangleOffTopEdgeData.v1.xPos = (const signed short)(triangleOffTopEdgeZeroPixels[1].posX + 0.5f);
		triangleOffTopEdgeData.v1.yPos = (const signed short)(triangleOffTopEdgeZeroPixels[1].posY + 0.5f);
		triangleOffTopEdgeData.v1.invZ = 2.0f;
		triangleOffTopEdgeData.v2.xPos = (const signed short)(triangleOffTopEdgeZeroPixels[2].posX + 0.5f);
		triangleOffTopEdgeData.v2.yPos = (const signed short)(triangleOffTopEdgeZeroPixels[2].posY + 0.5f);
		triangleOffTopEdgeData.v2.invZ = 2.0f;
		successResult &= runTriSetupTest(triangleOffTopEdgeData, triSetup_ZeroBounds);
	}

	// Test a case of bounds clipping off the right edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffRightEdgeData = {0};
		triangleOffRightEdgeData.v0.xPos = (const signed short)(triangleOffRightEdgeZeroPixels[0].posX + 0.5f);
		triangleOffRightEdgeData.v0.yPos = (const signed short)(triangleOffRightEdgeZeroPixels[0].posY + 0.5f);
		triangleOffRightEdgeData.v0.invZ = 2.0f;
		triangleOffRightEdgeData.v1.xPos = (const signed short)(triangleOffRightEdgeZeroPixels[1].posX + 0.5f);
		triangleOffRightEdgeData.v1.yPos = (const signed short)(triangleOffRightEdgeZeroPixels[1].posY + 0.5f);
		triangleOffRightEdgeData.v1.invZ = 2.0f;
		triangleOffRightEdgeData.v2.xPos = (const signed short)(triangleOffRightEdgeZeroPixels[2].posX + 0.5f);
		triangleOffRightEdgeData.v2.yPos = (const signed short)(triangleOffRightEdgeZeroPixels[2].posY + 0.5f);
		triangleOffRightEdgeData.v2.invZ = 2.0f;
		successResult &= runTriSetupTest(triangleOffRightEdgeData, triSetup_ZeroBounds);
	}

	// Test a case of bounds clipping off the bottom edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffBottomEdgeData = {0};
		triangleOffBottomEdgeData.v0.xPos = (const signed short)(triangleOffBottomEdgeZeroPixels[0].posX + 0.5f);
		triangleOffBottomEdgeData.v0.yPos = (const signed short)(triangleOffBottomEdgeZeroPixels[0].posY + 0.5f);
		triangleOffBottomEdgeData.v0.invZ = 2.0f;
		triangleOffBottomEdgeData.v1.xPos = (const signed short)(triangleOffBottomEdgeZeroPixels[1].posX + 0.5f);
		triangleOffBottomEdgeData.v1.yPos = (const signed short)(triangleOffBottomEdgeZeroPixels[1].posY + 0.5f);
		triangleOffBottomEdgeData.v1.invZ = 2.0f;
		triangleOffBottomEdgeData.v2.xPos = (const signed short)(triangleOffBottomEdgeZeroPixels[2].posX + 0.5f);
		triangleOffBottomEdgeData.v2.yPos = (const signed short)(triangleOffBottomEdgeZeroPixels[2].posY + 0.5f);
		triangleOffBottomEdgeData.v2.invZ = 2.0f;
		successResult &= runTriSetupTest(triangleOffBottomEdgeData, triSetup_ZeroBounds);
	}

	// Test a simple case of a single triangle:
	{
		triSetupInput fullTriangle0Data = {0};
		fullTriangle0Data.v0.xPos = (const signed short)(fullTriangle0[0].posX + 0.5f);
		fullTriangle0Data.v0.yPos = (const signed short)(fullTriangle0[0].posY + 0.5f);
		fullTriangle0Data.v0.invZ = 2.0f;
		fullTriangle0Data.v0.xTex = 0x1111;
		fullTriangle0Data.v0.yTex = 0x2222;
		fullTriangle0Data.v0.rgba = D3DCOLOR_ARGB(255, 255, 0, 0);
		fullTriangle0Data.v1.xPos = (const signed short)(fullTriangle0[2].posX + 0.5f);
		fullTriangle0Data.v1.yPos = (const signed short)(fullTriangle0[2].posY + 0.5f);
		fullTriangle0Data.v1.invZ = 2.0f;
		fullTriangle0Data.v1.xTex = 0x3333;
		fullTriangle0Data.v1.yTex = 0x4444;
		fullTriangle0Data.v1.rgba = D3DCOLOR_ARGB(255, 0, 255, 0);
		fullTriangle0Data.v2.xPos = (const signed short)(fullTriangle0[1].posX + 0.5f);
		fullTriangle0Data.v2.yPos = (const signed short)(fullTriangle0[1].posY + 0.5f);
		fullTriangle0Data.v2.invZ = 2.0f;
		fullTriangle0Data.v2.xTex = -0x5555;
		fullTriangle0Data.v2.yTex = -0x6666;
		fullTriangle0Data.v2.rgba = D3DCOLOR_ARGB(255, 0, 0, 255);
		successResult &= runTriSetupTest(fullTriangle0Data, triSetup_OK);
	}

	// Test a case where all three vertices are off the screen but the resulting polygon fills the screenspace
	{
		triSetupInput singleTriangleFillScreenData = {0};
		singleTriangleFillScreenData.v0.xPos = (const signed short)(triangleOffScreenFill[0].posX + 0.5f);
		singleTriangleFillScreenData.v0.yPos = (const signed short)(triangleOffScreenFill[0].posY + 0.5f);
		singleTriangleFillScreenData.v0.invZ = 2.0f;
		singleTriangleFillScreenData.v0.xTex = 0x1111;
		singleTriangleFillScreenData.v0.yTex = 0x2222;
		singleTriangleFillScreenData.v0.rgba = D3DCOLOR_ARGB(255, 255, 0, 0);
		singleTriangleFillScreenData.v1.xPos = (const signed short)(triangleOffScreenFill[2].posX + 0.5f);
		singleTriangleFillScreenData.v1.yPos = (const signed short)(triangleOffScreenFill[2].posY + 0.5f);
		singleTriangleFillScreenData.v1.invZ = 2.0f;
		singleTriangleFillScreenData.v1.xTex = 0x3333;
		singleTriangleFillScreenData.v1.yTex = 0x4444;
		singleTriangleFillScreenData.v1.rgba = D3DCOLOR_ARGB(255, 0, 255, 0);
		singleTriangleFillScreenData.v2.xPos = (const signed short)(triangleOffScreenFill[1].posX + 0.5f);
		singleTriangleFillScreenData.v2.yPos = (const signed short)(triangleOffScreenFill[1].posY + 0.5f);
		singleTriangleFillScreenData.v2.invZ = 2.0f;
		singleTriangleFillScreenData.v2.xTex = -0x5555;
		singleTriangleFillScreenData.v2.yTex = -0x6666;
		singleTriangleFillScreenData.v2.rgba = D3DCOLOR_ARGB(255, 0, 0, 255);
		successResult &= runTriSetupTest(singleTriangleFillScreenData, triSetup_OK);
	}

	// Test a case where three of the vertices occupy three cornerpoints of the screen
	{
		triSetupInput triangleMatchesScreenCornersData = {0};
		triangleMatchesScreenCornersData.v0.xPos = (const signed short)(triangleBottomCornerScreen[0].posX + 0.5f);
		triangleMatchesScreenCornersData.v0.yPos = (const signed short)(triangleBottomCornerScreen[0].posY + 0.5f);
		triangleMatchesScreenCornersData.v0.invZ = 2.0f;
		triangleMatchesScreenCornersData.v0.xTex = 0x1111;
		triangleMatchesScreenCornersData.v0.yTex = 0x2222;
		triangleMatchesScreenCornersData.v0.rgba = D3DCOLOR_ARGB(255, 255, 0, 0);
		triangleMatchesScreenCornersData.v1.xPos = (const signed short)(triangleBottomCornerScreen[2].posX + 0.5f);
		triangleMatchesScreenCornersData.v1.yPos = (const signed short)(triangleBottomCornerScreen[2].posY + 0.5f);
		triangleMatchesScreenCornersData.v1.invZ = 2.0f;
		triangleMatchesScreenCornersData.v1.xTex = 0x3333;
		triangleMatchesScreenCornersData.v1.yTex = 0x4444;
		triangleMatchesScreenCornersData.v1.rgba = D3DCOLOR_ARGB(255, 0, 255, 0);
		triangleMatchesScreenCornersData.v2.xPos = (const signed short)(triangleBottomCornerScreen[1].posX + 0.5f);
		triangleMatchesScreenCornersData.v2.yPos = (const signed short)(triangleBottomCornerScreen[1].posY + 0.5f);
		triangleMatchesScreenCornersData.v2.invZ = 2.0f;
		triangleMatchesScreenCornersData.v2.xTex = -0x5555;
		triangleMatchesScreenCornersData.v2.yTex = -0x6666;
		triangleMatchesScreenCornersData.v2.rgba = D3DCOLOR_ARGB(255, 0, 0, 255);
		successResult &= runTriSetupTest(triangleMatchesScreenCornersData, triSetup_OK);
	}

	srand(3); // Start with the same random seed every time

	// Try it with 1024 * 16 random triangles with vertex positions between -16k and +16k
	for (unsigned x = 0; x < 1024 * 16; ++x)
	{
		triSetupInput randomTriangleData = {0};
		randomTriangleData.v0.xPos = (const signed short)(rand() - (RAND_MAX / 2) );
		randomTriangleData.v0.yPos = (const signed short)(rand() - (RAND_MAX / 2) );
		randomTriangleData.v0.invZ = 2.0f;
		randomTriangleData.v0.xTex = 0x1111;
		randomTriangleData.v0.yTex = 0x2222;
		randomTriangleData.v0.rgba = D3DCOLOR_ARGB(255, 255, 0, 0);
		randomTriangleData.v1.xPos = (const signed short)(rand() - (RAND_MAX / 2) );
		randomTriangleData.v1.yPos = (const signed short)(rand() - (RAND_MAX / 2) );
		randomTriangleData.v1.invZ = 2.0f;
		randomTriangleData.v1.xTex = 0x3333;
		randomTriangleData.v1.yTex = 0x4444;
		randomTriangleData.v1.rgba = D3DCOLOR_ARGB(255, 0, 255, 0);
		randomTriangleData.v2.xPos = (const signed short)(rand() - (RAND_MAX / 2) );
		randomTriangleData.v2.yPos = (const signed short)(rand() - (RAND_MAX / 2) );
		randomTriangleData.v2.invZ = 2.0f;
		randomTriangleData.v2.xTex = -0x5555;
		randomTriangleData.v2.yTex = -0x6666;
		randomTriangleData.v2.rgba = D3DCOLOR_ARGB(255, 0, 0, 255);
		successResult &= runTriSetupTestRand(randomTriangleData);
	}

	return successResult ? S_OK : E_FAIL;
}
