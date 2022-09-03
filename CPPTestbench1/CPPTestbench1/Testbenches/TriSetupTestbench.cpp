#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "ShaderCoreALUCommon.h" // Include the Float ALU Common from the ShaderCore
#include "../D3DTriRasterizeTestData.h"
#include "PixelPipelineShared.h"
#include <algorithm> // for std::min/std::max

static const float frand()
{
	return rand() / (const float)RAND_MAX;
}

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

enum triSetupState
{
	triSetup_waitForTriData, // 0

	// Initial vertex value culling (NaN/INF/Zero invW cause the triangle to be culled)
	triSetup_NAN_INF_ZeroW_Cull, // 1
	triSetup_zVertexCull, // 2

	// Converting the float32 x/y coordinates to fixed-point integers
	triSetup_QuantizeSnapToGridX0, // 3
	triSetup_QuantizeSnapToGridX1, // 4
	triSetup_QuantizeSnapToGridX2, // 5
	triSetup_QuantizeSnapToGridY0, // 6
	triSetup_QuantizeSnapToGridY1, // 7
	triSetup_QuantizeSnapToGridY2, // 8
	triSetup_QuantizeSnapToGridWait0, // 9
	triSetup_QuantizeSnapToGridWait1, // 10
	triSetup_QuantizeSnapToGridWait2, // 11
	triSetup_QuantizeSnapToGridWait3, // 12

	triSetup_duplicateVertexCull, // 13

	// Bounds calculations and trivial rejection culling:
	triSetup_bounds, // 14
	triSetup_boundsClamp, // 15
	triSetup_boundsCull, // 16

	// Compute cross-product to get (signed) twiceTriangleArea
	triSetup_crossProduct, // 17
	triSetup_crossProduct2, // 18
	triSetup_crossProduct4, // 19

	// Backface cull (cull if twiceTriangleArea <= 0)
	triSetup_backfaceCull, // 20

	// Send data to reciprocal unit
	triSetup_sendToRecip, // 21
	triSetup_waitForConvert0, // 22
	triSetup_waitForConvert1, // 23
	triSetup_waitForConvert2, // 24
	triSetup_setupRecip, // 25

	// Compute top-left edge rule offsets
	triSetup_topLeftBiasA, // 26

	// Compute barycentric deltas
	triSetup_barycentricXDeltaA, // 27

	// Compute barycentric values
	triSetup_leftInner0, // 28
	triSetup_leftProduct0, // 29
	triSetup_crossProductSumA, // 30
	triSetup_applyTopLeftRule, //31

	triSetup_waitForReciprocalResult, // 32

	// Compute 10 and 20 delta values for each of our interpolated components:
	triSetup_calculateTX10Delta, // 33
	triSetup_calculateTX20Delta, // 34
	triSetup_calculateTY10Delta, // 35
	triSetup_calculateTY20Delta, // 36
	triSetup_calculateColorR10Delta, // 37
	triSetup_calculateColorR20Delta, // 38
	triSetup_calculateColorG10Delta, // 39
	triSetup_calculateColorG20Delta, // 40
	triSetup_calculateColorB10Delta, // 41
	triSetup_calculateColorB20Delta, // 42
	triSetup_calculateColorA10Delta, // 43
	triSetup_calculateColorA20Delta, // 44
	triSetup_calculateInvZ10Delta, // 45
	triSetup_calculateInvZ20Delta, // 46
	triSetup_calculateInvW10Delta, // 47
	triSetup_calculateInvW20Delta, // 48
	triSetup_waitForDeltasCompletion0, // 49
	triSetup_waitForDeltasCompletion1, // 50
	triSetup_waitForDeltasCompletion2, // 51
	triSetup_waitForDeltasCompletion3, // 52
	triSetup_waitForDeltasCompletion4, // 53

	// Finally, send our setup tri result data to the rasterizer
	triSetup_broadcastOutput // 54
};

// This is the same rounding algorithm that is used in the FPU core, so we should get identical results
static const signed short RoundFloatToI16NE(const float a)
{
	if (a > 32767)
		return 32767;
	else if (a < -32768)
		return -32768;
	else
	{
		if (a >= 0.0f)
			return (const int)(a + 0.5f);
		else
			return (const int)(a - 0.5f);
	}
}

triSetupResultType EmulateCPUTriSetup(const triSetupInput& inTriData, triSetupOutput& outTriSetupOutput)
{
	// D3D spec mandates that any triangle that contains a NaN in any of its oPos components *must* be culled:
	if (isnan(inTriData.v0.xPos) || isnan(inTriData.v0.yPos) || isnan(inTriData.v0.invZ) || isnan(inTriData.v0.invW) ||
		isnan(inTriData.v1.xPos) || isnan(inTriData.v1.yPos) || isnan(inTriData.v1.invZ) || isnan(inTriData.v1.invW) ||
		isnan(inTriData.v2.xPos) || isnan(inTriData.v2.yPos) || isnan(inTriData.v2.invZ) || isnan(inTriData.v2.invW) )
		return triSetup_NAN_INF_Cull;

	// D3D spec mandates that any triangle that contains an INF in any of its oPos components *may* optionally be culled:
	if (isinf(inTriData.v0.xPos) || isinf(inTriData.v0.yPos) || isinf(inTriData.v0.invZ) || isinf(inTriData.v0.invW) ||
		isinf(inTriData.v1.xPos) || isinf(inTriData.v1.yPos) || isinf(inTriData.v1.invZ) || isinf(inTriData.v1.invW) ||
		isinf(inTriData.v2.xPos) || isinf(inTriData.v2.yPos) || isinf(inTriData.v2.invZ) || isinf(inTriData.v2.invW) )
		return triSetup_NAN_INF_Cull;

	// If any of our verts' invW is 0 (or a degenerate value that gets degenerate-flushed into 0) then we need to cull this triangle
	if (fabs(inTriData.v0.invW) <= 1.17549421069244107549e-38f || fabs(inTriData.v1.invW) <= 1.17549421069244107549e-38f || fabs(inTriData.v2.invW) <= 1.17549421069244107549e-38f)
		return triSetup_NAN_INF_Cull;

	// Technically this isn't yet fully correct, as D3D mandates snapping to at least a 16.8 fixed-point integer grid (using round-to-nearest integer), and here
	// we're snapping to a 16.0 fixed-point integer grid instead:
	const signed short vx0 = RoundFloatToI16NE(inTriData.v0.xPos);
	const signed short vy0 = RoundFloatToI16NE(inTriData.v0.yPos);
	const signed short vx1 = RoundFloatToI16NE(inTriData.v1.xPos);
	const signed short vy1 = RoundFloatToI16NE(inTriData.v1.yPos);
	const signed short vx2 = RoundFloatToI16NE(inTriData.v2.xPos);
	const signed short vy2 = RoundFloatToI16NE(inTriData.v2.yPos);
	const float vinvz0 = inTriData.v0.invZ;
	const float vinvz1 = inTriData.v1.invZ;
	const float vinvz2 = inTriData.v2.invZ;
	const float vinvw0 = inTriData.v0.invW;
	const float vinvw1 = inTriData.v1.invW;
	const float vinvw2 = inTriData.v2.invW;

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

	// Compute delta attribute vectors for more efficient per-pixel interpolation because (p0 + barycentricB * p10 + barycentricC * p20) is cheaper than (p0 * barycentricA + p1 * barycentricB + p2 * barycentricC):
	// It trades off 6 extra subtractions in per-triangle triSetup stage for fewer multiplies and adds in the per-pixel depthInterpolator and attributeInterpolator stages and less data transferred per-pixel too.
	const float invZ0 = vinvz0;
	const float invZ10 = vinvz1 - invZ0;
	const float invZ20 = vinvz2 - invZ0;
	const float invW0 = vinvw0;
	const float invW10 = vinvw1 - invW0;
	const float invW20 = vinvw2 - invW0;
	const float tx0 = inTriData.v0.xTex;
	const float tx10 = inTriData.v1.xTex - inTriData.v0.xTex;
	const float tx20 = inTriData.v2.xTex - inTriData.v0.xTex;
	const float ty0 = inTriData.v0.yTex;
	const float ty10 = inTriData.v1.yTex - inTriData.v0.yTex;
	const float ty20 = inTriData.v2.yTex - inTriData.v0.yTex;
	const float colorR0 = inTriData.v0.rgba.r;
	const float colorR10 = inTriData.v1.rgba.r - inTriData.v0.rgba.r;
	const float colorR20 = inTriData.v2.rgba.r - inTriData.v0.rgba.r;
	const float colorG0 = inTriData.v0.rgba.g;
	const float colorG10 = inTriData.v1.rgba.g - inTriData.v0.rgba.g;
	const float colorG20 = inTriData.v2.rgba.g - inTriData.v0.rgba.g;
	const float colorB0 = inTriData.v0.rgba.b;
	const float colorB10 = inTriData.v1.rgba.b - inTriData.v0.rgba.b;
	const float colorB20 = inTriData.v2.rgba.b - inTriData.v0.rgba.b;
	const float colorA0 = inTriData.v0.rgba.a;
	const float colorA10 = inTriData.v1.rgba.a - inTriData.v0.rgba.a;
	const float colorA20 = inTriData.v2.rgba.a - inTriData.v0.rgba.a;

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
	outTriSetupOutput.v0.invZ = invZ0;
	outTriSetupOutput.v10.invZ = invZ10;
	outTriSetupOutput.v20.invZ = invZ20;
	outTriSetupOutput.v0.invW = invW0;
	outTriSetupOutput.v10.invW = invW10;
	outTriSetupOutput.v20.invW = invW20;
	outTriSetupOutput.v0.rgba.r = colorR0;
	outTriSetupOutput.v10.rgba.r = colorR10;
	outTriSetupOutput.v20.rgba.r = colorR20;
	outTriSetupOutput.v0.rgba.g = colorG0;
	outTriSetupOutput.v10.rgba.g = colorG10;
	outTriSetupOutput.v20.rgba.g = colorG20;
	outTriSetupOutput.v0.rgba.b = colorB0;
	outTriSetupOutput.v10.rgba.b = colorB10;
	outTriSetupOutput.v20.rgba.b = colorB20;
	outTriSetupOutput.v0.rgba.a = colorA0;
	outTriSetupOutput.v10.rgba.a = colorA10;
	outTriSetupOutput.v20.rgba.a = colorA20;
	outTriSetupOutput.v0.xTex = tx0;
	outTriSetupOutput.v0.yTex = ty0;
	outTriSetupOutput.v10.xTex = tx10;
	outTriSetupOutput.v10.yTex = ty10;
	outTriSetupOutput.v20.xTex = tx20;
	outTriSetupOutput.v20.yTex = ty20;

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

	std_logic_vector_port<32> IA_v0_in_x(PD_IN, loader, "IA_v0_in_x");
	std_logic_vector_port<32> IA_v0_in_y(PD_IN, loader, "IA_v0_in_y");
	std_logic_vector_port<32> IA_v0_in_invZ(PD_IN, loader, "IA_v0_in_invZ");
	std_logic_vector_port<32> IA_v0_in_invW(PD_IN, loader, "IA_v0_in_invW");
	std_logic_vector_port<32> IA_t0_in_x(PD_IN, loader, "IA_t0_in_x");
	std_logic_vector_port<32> IA_t0_in_y(PD_IN, loader, "IA_t0_in_y");
	std_logic_vector_port<128> IA_v0_in_RGBA(PD_IN, loader, "IA_v0_in_RGBA");
	std_logic_vector_port<32> IA_v1_in_x(PD_IN, loader, "IA_v1_in_x");
	std_logic_vector_port<32> IA_v1_in_y(PD_IN, loader, "IA_v1_in_y");
	std_logic_vector_port<32> IA_v1_in_invZ(PD_IN, loader, "IA_v1_in_invZ");
	std_logic_vector_port<32> IA_v1_in_invW(PD_IN, loader, "IA_v1_in_invW");
	std_logic_vector_port<32> IA_t1_in_x(PD_IN, loader, "IA_t1_in_x");
	std_logic_vector_port<32> IA_t1_in_y(PD_IN, loader, "IA_t1_in_y");
	std_logic_vector_port<128> IA_v1_in_RGBA(PD_IN, loader, "IA_v1_in_RGBA");
	std_logic_vector_port<32> IA_v2_in_x(PD_IN, loader, "IA_v2_in_x");
	std_logic_vector_port<32> IA_v2_in_y(PD_IN, loader, "IA_v2_in_y");
	std_logic_vector_port<32> IA_v2_in_invZ(PD_IN, loader, "IA_v2_in_invZ");
	std_logic_vector_port<32> IA_v2_in_invW(PD_IN, loader, "IA_v2_in_invW");
	std_logic_vector_port<32> IA_t2_in_x(PD_IN, loader, "IA_t2_in_x");
	std_logic_vector_port<32> IA_t2_in_y(PD_IN, loader, "IA_t2_in_y");
	std_logic_vector_port<128> IA_v2_in_RGBA(PD_IN, loader, "IA_v2_in_RGBA");

	std_logic_port RAST_readyForTriSetupData(PD_IN, loader, "RAST_readyForTriSetupData");
	std_logic_port RAST_triSetupDataIsValid(PD_OUT, loader, "RAST_triSetupDataIsValid");

	std_logic_vector_port<32> RAST_outBarycentricInverse(PD_OUT, loader, "RAST_outBarycentricInverse");
	std_logic_vector_port<32> RAST_v0_out_invZ(PD_OUT, loader, "RAST_v0_out_invZ");
	std_logic_vector_port<32> RAST_v10_out_invZ(PD_OUT, loader, "RAST_v10_out_invZ");
	std_logic_vector_port<32> RAST_v20_out_invZ(PD_OUT, loader, "RAST_v20_out_invZ");
	std_logic_vector_port<32> RAST_v0_out_invW(PD_OUT, loader, "RAST_v0_out_invW");
	std_logic_vector_port<32> RAST_v10_out_invW(PD_OUT, loader, "RAST_v10_out_invW");
	std_logic_vector_port<32> RAST_v20_out_invW(PD_OUT, loader, "RAST_v20_out_invW");
	std_logic_vector_port<32> RAST_t0_out_x(PD_OUT, loader, "RAST_t0_out_x");
	std_logic_vector_port<32> RAST_t0_out_y(PD_OUT, loader, "RAST_t0_out_y");
	std_logic_vector_port<32> RAST_t10_out_x(PD_OUT, loader, "RAST_t10_out_x");
	std_logic_vector_port<32> RAST_t10_out_y(PD_OUT, loader, "RAST_t10_out_y");
	std_logic_vector_port<32> RAST_t20_out_x(PD_OUT, loader, "RAST_t20_out_x");
	std_logic_vector_port<32> RAST_t20_out_y(PD_OUT, loader, "RAST_t20_out_y");
	std_logic_vector_port<128> RAST_v0_out_colorRGBA(PD_OUT, loader, "RAST_v0_out_colorRGBA");
	std_logic_vector_port<128> RAST_v10_out_colorRGBA(PD_OUT, loader, "RAST_v10_out_colorRGBA");
	std_logic_vector_port<128> RAST_v20_out_colorRGBA(PD_OUT, loader, "RAST_v20_out_colorRGBA");
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
	std_logic_vector_port<6> DBG_TriSetup_State(PD_OUT, loader, "DBG_TriSetup_State");

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
		triSetupState dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();

		// Wait for the triSetup block to be ready
		while (IA_readyForNewTri.GetBoolVal() == false)
		{
			IA_newTriBegin = false;
			scoped_timestep time(loader, clk, 100);
			dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();
		}

		IA_v0_in_x = inTriData.v0.xPos;
		IA_v0_in_y = inTriData.v0.yPos;
		IA_v0_in_invZ = inTriData.v0.invZ;
		IA_v0_in_invW = inTriData.v0.invW;
		IA_t0_in_x = inTriData.v0.xTex;
		IA_t0_in_y = inTriData.v0.yTex;
		IA_v0_in_RGBA.SetStructVal(inTriData.v0.rgba);
		IA_v1_in_x = inTriData.v1.xPos;
		IA_v1_in_y = inTriData.v1.yPos;
		IA_v1_in_invZ = inTriData.v1.invZ;
		IA_v1_in_invW = inTriData.v1.invW;
		IA_t1_in_x = inTriData.v1.xTex;
		IA_t1_in_y = inTriData.v1.yTex;
		IA_v1_in_RGBA.SetStructVal(inTriData.v1.rgba);
		IA_v2_in_x = inTriData.v2.xPos;
		IA_v2_in_y = inTriData.v2.yPos;
		IA_v2_in_invZ = inTriData.v2.invZ;
		IA_v2_in_invW = inTriData.v2.invW;
		IA_t2_in_x = inTriData.v2.xTex;
		IA_t2_in_y = inTriData.v2.yTex;
		IA_v2_in_RGBA.SetStructVal(inTriData.v2.rgba);

		// Pulse the "go signal" on for just one cycle, then turn it off:
		{
			scoped_timestep time(loader, clk, 100);
			IA_newTriBegin = true;
			dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();
		}
		IA_newTriBegin = false;

		unsigned triSetupOutputCount = 0;

		triSetupOutput simulatedRTLOutput = {0};
		triSetupOutput emulatedCPUOutput = {0};

		while (IA_readyForNewTri.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);

			dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();

			triSetupFPU.Update(FPU_ISHFT_GO, FPU_IMUL_GO, FPU_IADD_GO, FPU_ICMP_GO, FPU_ISPEC_GO, FPU_ICNV_GO, FPU_IBIT_GO,	FPU_A, FPU_B, FPU_Mode, FPU_OUT);
			if (RAST_triSetupDataIsValid.GetBoolVal() )
			{
				if (triSetupOutputCount++ == 0)
				{
					simulatedRTLOutput.SerializeTriSetupOutput(RAST_outBarycentricInverse,
						RAST_v0_out_invZ, RAST_v10_out_invZ, RAST_v20_out_invZ,
						RAST_v0_out_invW, RAST_v10_out_invW, RAST_v20_out_invW,
						RAST_t0_out_x, RAST_t10_out_x, RAST_t20_out_x,
						RAST_t0_out_y, RAST_t10_out_y, RAST_t20_out_y,
						RAST_v0_out_colorRGBA, RAST_v10_out_colorRGBA, RAST_v20_out_colorRGBA,
						RAST_outMinX, RAST_outMinY, RAST_outMaxX, RAST_outMaxY,
						RAST_outInitialBarycentricRowResetA, RAST_outInitialBarycentricRowResetB, RAST_outInitialBarycentricRowResetC,
						RAST_outIsTopLeftEdgeA, RAST_outIsTopLeftEdgeB, RAST_outIsTopLeftEdgeC,
						RAST_outBarycentricXDeltaA, RAST_outBarycentricXDeltaB, RAST_outBarycentricXDeltaC,
						RAST_outBarycentricYDeltaA, RAST_outBarycentricYDeltaB, RAST_outBarycentricYDeltaC);
				}
			}
		}

		dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();

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
		IA_v0_in_invW = inTriData.v0.invW;
		IA_t0_in_x = inTriData.v0.xTex;
		IA_t0_in_y = inTriData.v0.yTex;
		IA_v0_in_RGBA.SetStructVal(inTriData.v0.rgba);
		IA_v1_in_x = inTriData.v1.xPos;
		IA_v1_in_y = inTriData.v1.yPos;
		IA_v1_in_invZ = inTriData.v1.invZ;
		IA_v1_in_invW = inTriData.v1.invW;
		IA_t1_in_x = inTriData.v1.xTex;
		IA_t1_in_y = inTriData.v1.yTex;
		IA_v1_in_RGBA.SetStructVal(inTriData.v1.rgba);
		IA_v2_in_x = inTriData.v2.xPos;
		IA_v2_in_y = inTriData.v2.yPos;
		IA_v2_in_invZ = inTriData.v2.invZ;
		IA_v2_in_invW = inTriData.v2.invW;
		IA_t2_in_x = inTriData.v2.xTex;
		IA_t2_in_y = inTriData.v2.yTex;
		IA_v2_in_RGBA.SetStructVal(inTriData.v2.rgba);

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
						RAST_v0_out_invZ, RAST_v10_out_invZ, RAST_v20_out_invZ,
						RAST_v0_out_invW, RAST_v10_out_invW, RAST_v20_out_invW,
						RAST_t0_out_x, RAST_t10_out_x, RAST_t20_out_x,
						RAST_t0_out_y, RAST_t10_out_y, RAST_t20_out_y,
						RAST_v0_out_colorRGBA, RAST_v10_out_colorRGBA, RAST_v20_out_colorRGBA,
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
		degenerateTriangleDataABC.v0.xPos = degenTriangleZeroArea[0].posX;
		degenerateTriangleDataABC.v0.yPos = degenTriangleZeroArea[0].posY;
		degenerateTriangleDataABC.v0.invZ = 2.0f;
		degenerateTriangleDataABC.v0.invW = 1.0f;
		degenerateTriangleDataABC.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		degenerateTriangleDataABC.v1.xPos = degenTriangleZeroArea[1].posX;
		degenerateTriangleDataABC.v1.yPos = degenTriangleZeroArea[1].posY;
		degenerateTriangleDataABC.v1.invZ = degenerateTriangleDataABC.v0.invZ;
		degenerateTriangleDataABC.v1.invW = degenerateTriangleDataABC.v0.invW;
		degenerateTriangleDataABC.v1.rgba = degenerateTriangleDataABC.v0.rgba;
		degenerateTriangleDataABC.v2.xPos = degenTriangleZeroArea[2].posX;
		degenerateTriangleDataABC.v2.yPos = degenTriangleZeroArea[2].posY;
		degenerateTriangleDataABC.v2.invZ = degenerateTriangleDataABC.v0.invZ;
		degenerateTriangleDataABC.v2.invW = degenerateTriangleDataABC.v0.invW;
		degenerateTriangleDataABC.v2.rgba = degenerateTriangleDataABC.v0.rgba;
		successResult &= runTriSetupTest(degenerateTriangleDataABC, triSetup_DuplicateVertexCull);
	}

	// Test a 2/3 rejection degenerate triangle (A/B duplicate):
	{
		triSetupInput degenerateTriangleDataAB = {0};
		degenerateTriangleDataAB.v0.xPos = degenTriangleZeroArea[0].posX;
		degenerateTriangleDataAB.v0.yPos = degenTriangleZeroArea[0].posY;
		degenerateTriangleDataAB.v0.invZ = 2.0f;
		degenerateTriangleDataAB.v0.invW = 1.0f;
		degenerateTriangleDataAB.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		degenerateTriangleDataAB.v1.xPos = degenTriangleZeroArea[1].posX;
		degenerateTriangleDataAB.v1.yPos = degenTriangleZeroArea[1].posY;
		degenerateTriangleDataAB.v1.invZ = degenerateTriangleDataAB.v0.invZ;
		degenerateTriangleDataAB.v1.invW = degenerateTriangleDataAB.v0.invW;
		degenerateTriangleDataAB.v1.rgba = degenerateTriangleDataAB.v0.rgba;
		degenerateTriangleDataAB.v2.xPos = fullTriangle0[2].posX;
		degenerateTriangleDataAB.v2.yPos = fullTriangle0[2].posY;
		degenerateTriangleDataAB.v2.invZ = degenerateTriangleDataAB.v0.invZ;
		degenerateTriangleDataAB.v2.invW = degenerateTriangleDataAB.v0.invW;
		degenerateTriangleDataAB.v2.rgba = degenerateTriangleDataAB.v0.rgba;
		successResult &= runTriSetupTest(degenerateTriangleDataAB, triSetup_DuplicateVertexCull);
	}

	// Test a 2/3 rejection degenerate triangle (A/C duplicate):
	{
		triSetupInput degenerateTriangleDataAC = {0};
		degenerateTriangleDataAC.v0.xPos = degenTriangleZeroArea[0].posX;
		degenerateTriangleDataAC.v0.yPos = degenTriangleZeroArea[0].posY;
		degenerateTriangleDataAC.v0.invZ = 2.0f;
		degenerateTriangleDataAC.v0.invW = 1.0f;
		degenerateTriangleDataAC.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		degenerateTriangleDataAC.v1.xPos = fullTriangle0[1].posX;
		degenerateTriangleDataAC.v1.yPos = fullTriangle0[1].posY;
		degenerateTriangleDataAC.v1.invZ = degenerateTriangleDataAC.v0.invZ;
		degenerateTriangleDataAC.v1.invW = degenerateTriangleDataAC.v0.invW;
		degenerateTriangleDataAC.v1.rgba = degenerateTriangleDataAC.v0.rgba;
		degenerateTriangleDataAC.v2.xPos = degenTriangleZeroArea[2].posX;
		degenerateTriangleDataAC.v2.yPos = degenTriangleZeroArea[2].posY;
		degenerateTriangleDataAC.v2.invZ = degenerateTriangleDataAC.v0.invZ;
		degenerateTriangleDataAC.v2.invW = degenerateTriangleDataAC.v0.invW;
		degenerateTriangleDataAC.v2.rgba = degenerateTriangleDataAC.v0.rgba;
		successResult &= runTriSetupTest(degenerateTriangleDataAC, triSetup_DuplicateVertexCull);
	}

	// Test a 2/3 rejection degenerate triangle (B/C duplicate):
	{
		triSetupInput degenerateTriangleDataBC = {0};
		degenerateTriangleDataBC.v0.xPos = fullTriangle0[0].posX;
		degenerateTriangleDataBC.v0.yPos = fullTriangle0[0].posY;
		degenerateTriangleDataBC.v0.invZ = 2.0f;
		degenerateTriangleDataBC.v0.invW = 1.0f;
		degenerateTriangleDataBC.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		degenerateTriangleDataBC.v1.xPos = degenTriangleZeroArea[1].posX;
		degenerateTriangleDataBC.v1.yPos = degenTriangleZeroArea[1].posY;
		degenerateTriangleDataBC.v1.invZ = degenerateTriangleDataBC.v0.invZ;
		degenerateTriangleDataBC.v1.invW = degenerateTriangleDataBC.v0.invW;
		degenerateTriangleDataBC.v1.rgba = degenerateTriangleDataBC.v0.rgba;
		degenerateTriangleDataBC.v2.xPos = degenTriangleZeroArea[2].posX;
		degenerateTriangleDataBC.v2.yPos = degenTriangleZeroArea[2].posY;
		degenerateTriangleDataBC.v2.invZ = degenerateTriangleDataBC.v0.invZ;
		degenerateTriangleDataBC.v2.invW = degenerateTriangleDataBC.v0.invW;
		degenerateTriangleDataBC.v2.rgba = degenerateTriangleDataBC.v0.rgba;
		successResult &= runTriSetupTest(degenerateTriangleDataBC, triSetup_DuplicateVertexCull);
	}

	// Test a case of a triangle with one of its vertices having a NaN value:
	{
		triSetupInput triangleNANData = {0};
		triangleNANData.v0.xPos = fullTriangle0[0].posX;
		triangleNANData.v0.yPos = fullTriangle0[0].posY;
		triangleNANData.v0.invZ = 2.0f;
		triangleNANData.v0.invW = 1.0f;
		triangleNANData.v1.xPos = fullTriangle0[1].posX;
		triangleNANData.v1.yPos = NAN;
		triangleNANData.v1.invZ = -2.0f;
		triangleNANData.v1.invW = 1.0f;
		triangleNANData.v2.xPos = fullTriangle0[2].posX;
		triangleNANData.v2.yPos = fullTriangle0[2].posY;
		triangleNANData.v2.invZ = 2.0f;
		triangleNANData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleNANData, triSetup_NAN_INF_Cull);
	}

	// Test a case of a triangle with one of its vertices having an INF value:
	{
		triSetupInput triangleINFData = {0};
		triangleINFData.v0.xPos = fullTriangle0[0].posX;
		triangleINFData.v0.yPos = fullTriangle0[0].posY;
		triangleINFData.v0.invZ = 2.0f;
		triangleINFData.v0.invW = 1.0f;
		triangleINFData.v1.xPos = fullTriangle0[1].posX;
		triangleINFData.v1.yPos = fullTriangle0[1].posY;
		triangleINFData.v1.invZ = -INFINITY;
		triangleINFData.v1.invW = 1.0f;
		triangleINFData.v2.xPos = fullTriangle0[2].posX;
		triangleINFData.v2.yPos = fullTriangle0[2].posY;
		triangleINFData.v2.invZ = 2.0f;
		triangleINFData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleINFData, triSetup_NAN_INF_Cull);
	}

	// Test a case of a triangle with one of its vertices having a 0 W-value (which would lead to an INF when inverted):
	{
		triSetupInput triangleZeroWData = {0};
		triangleZeroWData.v0.xPos = fullTriangle0[0].posX;
		triangleZeroWData.v0.yPos = fullTriangle0[0].posY;
		triangleZeroWData.v0.invZ = 2.0f;
		triangleZeroWData.v0.invW = 1.0f;
		triangleZeroWData.v1.xPos = fullTriangle0[1].posX;
		triangleZeroWData.v1.yPos = fullTriangle0[1].posY;
		triangleZeroWData.v1.invZ = 2.0f;
		triangleZeroWData.v1.invW = 0.0f;
		triangleZeroWData.v2.xPos = fullTriangle0[2].posX;
		triangleZeroWData.v2.yPos = fullTriangle0[2].posY;
		triangleZeroWData.v2.invZ = 2.0f;
		triangleZeroWData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleZeroWData, triSetup_NAN_INF_Cull);
	}

	// Test a case of a triangle with one of its vertices behind the near-clip plane:
	{
		triSetupInput triangleNearClipData = {0};
		triangleNearClipData.v0.xPos = fullTriangle0[0].posX;
		triangleNearClipData.v0.yPos = fullTriangle0[0].posY;
		triangleNearClipData.v0.invZ = 2.0f;
		triangleNearClipData.v0.invW = 1.0f;
		triangleNearClipData.v1.xPos = fullTriangle0[1].posX;
		triangleNearClipData.v1.yPos = fullTriangle0[1].posY;
		triangleNearClipData.v1.invZ = -2.0f;
		triangleNearClipData.v1.invW = 1.0f;
		triangleNearClipData.v2.xPos = fullTriangle0[2].posX;
		triangleNearClipData.v2.yPos = fullTriangle0[2].posY;
		triangleNearClipData.v2.invZ = 2.0f;
		triangleNearClipData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleNearClipData, triSetup_CulledZClip);
	}

	// Test a case of a triangle with one of its vertices past the far-clip plane:
	{
		triSetupInput triangleNearClipData = {0};
		triangleNearClipData.v0.xPos = fullTriangle0[0].posX;
		triangleNearClipData.v0.yPos = fullTriangle0[0].posY;
		triangleNearClipData.v0.invZ = 2.0f;
		triangleNearClipData.v0.invW = 1.0f;
		triangleNearClipData.v1.xPos = fullTriangle0[1].posX;
		triangleNearClipData.v1.yPos = fullTriangle0[1].posY;
		triangleNearClipData.v1.invZ = 0.75f;
		triangleNearClipData.v1.invW = 1.0f;
		triangleNearClipData.v2.xPos = fullTriangle0[2].posX;
		triangleNearClipData.v2.yPos = fullTriangle0[2].posY;
		triangleNearClipData.v2.invZ = 2.0f;
		triangleNearClipData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleNearClipData, triSetup_CulledZClip);
	}

	// Test a case of backface culling:
	{
		triSetupInput triangleBackfacingData = {0};
		triangleBackfacingData.v0.xPos = fullTriangle0[0].posX;
		triangleBackfacingData.v0.yPos = fullTriangle0[0].posY;
		triangleBackfacingData.v0.invZ = 2.0f;
		triangleBackfacingData.v0.invW = 1.0f;
		triangleBackfacingData.v1.xPos = fullTriangle0[1].posX;
		triangleBackfacingData.v1.yPos = fullTriangle0[1].posY;
		triangleBackfacingData.v1.invZ = 2.0f;
		triangleBackfacingData.v1.invW = 1.0f;
		triangleBackfacingData.v2.xPos = fullTriangle0[2].posX;
		triangleBackfacingData.v2.yPos = fullTriangle0[2].posY;
		triangleBackfacingData.v2.invZ = 2.0f;
		triangleBackfacingData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleBackfacingData, triSetup_BackfaceCull);
	}

	// Test a case of zero-area culling:
	{
		triSetupInput triangleZeroAreaData = {0};
		triangleZeroAreaData.v0.xPos = smallTriangleZeroPixels[0].posX;
		triangleZeroAreaData.v0.yPos = smallTriangleZeroPixels[0].posY;
		triangleZeroAreaData.v0.invZ = 2.0f;
		triangleZeroAreaData.v0.invW = 1.0f;
		triangleZeroAreaData.v1.xPos = smallTriangleZeroPixels[1].posX;
		triangleZeroAreaData.v1.yPos = smallTriangleZeroPixels[1].posY;
		triangleZeroAreaData.v1.invZ = 2.0f;
		triangleZeroAreaData.v1.invW = 1.0f;
		triangleZeroAreaData.v2.xPos = smallTriangleZeroPixels[2].posX;
		triangleZeroAreaData.v2.yPos = smallTriangleZeroPixels[2].posY;
		triangleZeroAreaData.v2.invZ = 2.0f;
		triangleZeroAreaData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleZeroAreaData, triSetup_ZeroAreaCull);
	}

	// Test another (offset) case of zero-area culling:
	{
		triSetupInput triangleOffsetZeroAreaData = {0};
		triangleOffsetZeroAreaData.v0.xPos = smallOffsetTriangleZeroPixels[0].posX;
		triangleOffsetZeroAreaData.v0.yPos = smallOffsetTriangleZeroPixels[0].posY;
		triangleOffsetZeroAreaData.v0.invZ = 2.0f;
		triangleOffsetZeroAreaData.v0.invW = 1.0f;
		triangleOffsetZeroAreaData.v1.xPos = smallOffsetTriangleZeroPixels[1].posX;
		triangleOffsetZeroAreaData.v1.yPos = smallOffsetTriangleZeroPixels[1].posY;
		triangleOffsetZeroAreaData.v1.invZ = 2.0f;
		triangleOffsetZeroAreaData.v1.invW = 1.0f;
		triangleOffsetZeroAreaData.v2.xPos = smallOffsetTriangleZeroPixels[2].posX;
		triangleOffsetZeroAreaData.v2.yPos = smallOffsetTriangleZeroPixels[2].posY;
		triangleOffsetZeroAreaData.v2.invZ = 2.0f;
		triangleOffsetZeroAreaData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleOffsetZeroAreaData, triSetup_ZeroAreaCull);
	}

	// Test a case of bounds clipping off the left edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffLeftEdgeData = {0};
		triangleOffLeftEdgeData.v0.xPos = triangleOffLeftEdgeZeroPixels[0].posX;
		triangleOffLeftEdgeData.v0.yPos = triangleOffLeftEdgeZeroPixels[0].posY;
		triangleOffLeftEdgeData.v0.invZ = 2.0f;
		triangleOffLeftEdgeData.v0.invW = 1.0f;
		triangleOffLeftEdgeData.v1.xPos = triangleOffLeftEdgeZeroPixels[1].posX;
		triangleOffLeftEdgeData.v1.yPos = triangleOffLeftEdgeZeroPixels[1].posY;
		triangleOffLeftEdgeData.v1.invZ = 2.0f;
		triangleOffLeftEdgeData.v1.invW = 1.0f;
		triangleOffLeftEdgeData.v2.xPos = triangleOffLeftEdgeZeroPixels[2].posX;
		triangleOffLeftEdgeData.v2.yPos = triangleOffLeftEdgeZeroPixels[2].posY;
		triangleOffLeftEdgeData.v2.invZ = 2.0f;
		triangleOffLeftEdgeData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleOffLeftEdgeData, triSetup_ZeroBounds);
	}

	// Test a case of bounds clipping off the top edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffTopEdgeData = {0};
		triangleOffTopEdgeData.v0.xPos = triangleOffTopEdgeZeroPixels[0].posX;
		triangleOffTopEdgeData.v0.yPos = triangleOffTopEdgeZeroPixels[0].posY;
		triangleOffTopEdgeData.v0.invZ = 2.0f;
		triangleOffTopEdgeData.v0.invW = 1.0f;
		triangleOffTopEdgeData.v1.xPos = triangleOffTopEdgeZeroPixels[1].posX;
		triangleOffTopEdgeData.v1.yPos = triangleOffTopEdgeZeroPixels[1].posY;
		triangleOffTopEdgeData.v1.invZ = 2.0f;
		triangleOffTopEdgeData.v1.invW = 1.0f;
		triangleOffTopEdgeData.v2.xPos = triangleOffTopEdgeZeroPixels[2].posX;
		triangleOffTopEdgeData.v2.yPos = triangleOffTopEdgeZeroPixels[2].posY;
		triangleOffTopEdgeData.v2.invZ = 2.0f;
		triangleOffTopEdgeData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleOffTopEdgeData, triSetup_ZeroBounds);
	}

	// Test a case of bounds clipping off the right edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffRightEdgeData = {0};
		triangleOffRightEdgeData.v0.xPos = triangleOffRightEdgeZeroPixels[0].posX;
		triangleOffRightEdgeData.v0.yPos = triangleOffRightEdgeZeroPixels[0].posY;
		triangleOffRightEdgeData.v0.invZ = 2.0f;
		triangleOffRightEdgeData.v0.invW = 1.0f;
		triangleOffRightEdgeData.v1.xPos = triangleOffRightEdgeZeroPixels[1].posX;
		triangleOffRightEdgeData.v1.yPos = triangleOffRightEdgeZeroPixels[1].posY;
		triangleOffRightEdgeData.v1.invZ = 2.0f;
		triangleOffRightEdgeData.v1.invW = 1.0f;
		triangleOffRightEdgeData.v2.xPos = triangleOffRightEdgeZeroPixels[2].posX;
		triangleOffRightEdgeData.v2.yPos = triangleOffRightEdgeZeroPixels[2].posY;
		triangleOffRightEdgeData.v2.invZ = 2.0f;
		triangleOffRightEdgeData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleOffRightEdgeData, triSetup_ZeroBounds);
	}

	// Test a case of bounds clipping off the bottom edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffBottomEdgeData = {0};
		triangleOffBottomEdgeData.v0.xPos = triangleOffBottomEdgeZeroPixels[0].posX;
		triangleOffBottomEdgeData.v0.yPos = triangleOffBottomEdgeZeroPixels[0].posY;
		triangleOffBottomEdgeData.v0.invZ = 2.0f;
		triangleOffBottomEdgeData.v0.invW = 1.0f;
		triangleOffBottomEdgeData.v1.xPos = triangleOffBottomEdgeZeroPixels[1].posX;
		triangleOffBottomEdgeData.v1.yPos = triangleOffBottomEdgeZeroPixels[1].posY;
		triangleOffBottomEdgeData.v1.invZ = 2.0f;
		triangleOffBottomEdgeData.v1.invW = 1.0f;
		triangleOffBottomEdgeData.v2.xPos = triangleOffBottomEdgeZeroPixels[2].posX;
		triangleOffBottomEdgeData.v2.yPos = triangleOffBottomEdgeZeroPixels[2].posY;
		triangleOffBottomEdgeData.v2.invZ = 2.0f;
		triangleOffBottomEdgeData.v2.invW = 1.0f;
		successResult &= runTriSetupTest(triangleOffBottomEdgeData, triSetup_ZeroBounds);
	}

	// Test a simple case of a single triangle:
	{
		triSetupInput fullTriangle0Data = {0};
		fullTriangle0Data.v0.xPos = fullTriangle0[0].posX;
		fullTriangle0Data.v0.yPos = fullTriangle0[0].posY;
		fullTriangle0Data.v0.invZ = 2.0f;
		fullTriangle0Data.v0.invW = 1.0f;
		fullTriangle0Data.v0.xTex = 1.0f / 15.0f;
		fullTriangle0Data.v0.yTex = 2.0f / 15.0f;
		fullTriangle0Data.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		fullTriangle0Data.v1.xPos = fullTriangle0[2].posX;
		fullTriangle0Data.v1.yPos = fullTriangle0[2].posY;
		fullTriangle0Data.v1.invZ = 2.0f;
		fullTriangle0Data.v1.invW = 1.0f;
		fullTriangle0Data.v1.xTex = 3.0f / 15.0f;
		fullTriangle0Data.v1.yTex = 4.0f / 15.0f;
		fullTriangle0Data.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
		fullTriangle0Data.v2.xPos = fullTriangle0[1].posX;
		fullTriangle0Data.v2.yPos = fullTriangle0[1].posY;
		fullTriangle0Data.v2.invZ = 2.0f;
		fullTriangle0Data.v2.invW = 1.0f;
		fullTriangle0Data.v2.xTex = -5.0f / 15.0f;
		fullTriangle0Data.v2.yTex = -6.0f / 15.0f;
		fullTriangle0Data.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };
		successResult &= runTriSetupTest(fullTriangle0Data, triSetup_OK);
	}

	// Test a case where all three vertices are off the screen but the resulting polygon fills the screenspace
	{
		triSetupInput singleTriangleFillScreenData = {0};
		singleTriangleFillScreenData.v0.xPos = triangleOffScreenFill[0].posX;
		singleTriangleFillScreenData.v0.yPos = triangleOffScreenFill[0].posY;
		singleTriangleFillScreenData.v0.invZ = 2.0f;
		singleTriangleFillScreenData.v0.invW = 1.0f;
		singleTriangleFillScreenData.v0.xTex = 1.0f / 15.0f;
		singleTriangleFillScreenData.v0.yTex = 2.0f / 15.0f;
		singleTriangleFillScreenData.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		singleTriangleFillScreenData.v1.xPos = triangleOffScreenFill[2].posX;
		singleTriangleFillScreenData.v1.yPos = triangleOffScreenFill[2].posY;
		singleTriangleFillScreenData.v1.invZ = 2.0f;
		singleTriangleFillScreenData.v1.invW = 1.0f;
		singleTriangleFillScreenData.v1.xTex = 3.0f / 15.0f;
		singleTriangleFillScreenData.v1.yTex = 4.0f / 15.0f;
		singleTriangleFillScreenData.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
		singleTriangleFillScreenData.v2.xPos = triangleOffScreenFill[1].posX;
		singleTriangleFillScreenData.v2.yPos = triangleOffScreenFill[1].posY;
		singleTriangleFillScreenData.v2.invZ = 2.0f;
		singleTriangleFillScreenData.v2.invW = 1.0f;
		singleTriangleFillScreenData.v2.xTex = -5.0f / 15.0f;
		singleTriangleFillScreenData.v2.yTex = -6.0f / 15.0f;
		singleTriangleFillScreenData.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };
		successResult &= runTriSetupTest(singleTriangleFillScreenData, triSetup_OK);
	}

	// Test a case where three of the vertices occupy three cornerpoints of the screen
	{
		triSetupInput triangleMatchesScreenCornersData = {0};
		triangleMatchesScreenCornersData.v0.xPos = triangleBottomCornerScreen[0].posX;
		triangleMatchesScreenCornersData.v0.yPos = triangleBottomCornerScreen[0].posY;
		triangleMatchesScreenCornersData.v0.invZ = 2.0f;
		triangleMatchesScreenCornersData.v0.invW = 1.0f;
		triangleMatchesScreenCornersData.v0.xTex = 1.0f / 15.0f;
		triangleMatchesScreenCornersData.v0.yTex = 2.0f / 15.0f;
		triangleMatchesScreenCornersData.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		triangleMatchesScreenCornersData.v1.xPos = triangleBottomCornerScreen[2].posX;
		triangleMatchesScreenCornersData.v1.yPos = triangleBottomCornerScreen[2].posY;
		triangleMatchesScreenCornersData.v1.invZ = 2.0f;
		triangleMatchesScreenCornersData.v1.invW = 1.0f;
		triangleMatchesScreenCornersData.v1.xTex = 3.0f / 15.0f;
		triangleMatchesScreenCornersData.v1.yTex = 4.0f / 15.0f;
		triangleMatchesScreenCornersData.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
		triangleMatchesScreenCornersData.v2.xPos = triangleBottomCornerScreen[1].posX;
		triangleMatchesScreenCornersData.v2.yPos = triangleBottomCornerScreen[1].posY;
		triangleMatchesScreenCornersData.v2.invZ = 2.0f;
		triangleMatchesScreenCornersData.v2.invW = 1.0f;
		triangleMatchesScreenCornersData.v2.xTex = -5.0f / 15.0f;
		triangleMatchesScreenCornersData.v2.yTex = -6.0f / 15.0f;
		triangleMatchesScreenCornersData.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };
		successResult &= runTriSetupTest(triangleMatchesScreenCornersData, triSetup_OK);
	}

	srand(3); // Start with the same random seed every time

	// Try it with 1024 * 16 random triangles with vertex positions between -16k and +16k
	for (unsigned x = 0; x < 1024 * 16; ++x)
	{
		triSetupInput randomTriangleData = {0};
		randomTriangleData.v0.xPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v0.yPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v0.invZ = 2.0f;
		randomTriangleData.v0.invW = 1.0f;
		randomTriangleData.v0.xTex = 1.0f / 15.0f;
		randomTriangleData.v0.yTex = 2.0f / 15.0f;
		randomTriangleData.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		randomTriangleData.v1.xPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v1.yPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v1.invZ = 2.0f;
		randomTriangleData.v1.invW = 1.0f;
		randomTriangleData.v1.xTex = 3.0f / 15.0f;
		randomTriangleData.v1.yTex = 4.0f / 15.0f;
		randomTriangleData.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
		randomTriangleData.v2.xPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v2.yPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v2.invZ = 2.0f;
		randomTriangleData.v2.invW = 1.0f;
		randomTriangleData.v2.xTex = -5.0f / 15.0f;
		randomTriangleData.v2.yTex = -6.0f / 15.0f;
		randomTriangleData.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };
		successResult &= runTriSetupTestRand(randomTriangleData);
	}

	return successResult ? S_OK : E_FAIL;
}
