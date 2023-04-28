#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "ShaderCoreALUCommon.h" // Include the Float ALU Common from the ShaderCore
#include "../D3DTriRasterizeTestData.h"
#include "PixelPipelineShared.h"
#include <algorithm> // for std::min/std::max

static const float VIEWPORT_WIDTH = 640.0f;
static const float VIEWPORT_HEIGHT = 480.0f;
static const float VIEWPORT_HALF_WIDTH = VIEWPORT_WIDTH * 0.5f;
static const float VIEWPORT_HALF_HEIGHT = VIEWPORT_HEIGHT * 0.5f;

extern bool enableDebugOutput;

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
	triSetup_FloatDegenerateTriDuplicateVert, // 2

	// Computing invW:
	triSetup_InvWSubmitRcpW0, // 3 // rcp w0; mul x0 * VIEWPORT_HALF_WIDTH
	triSetup_InvWSubmitRcpW1, // 4 // rcp w1; mul x1 * VIEWPORT_HALF_WIDTH
	triSetup_InvWSubmitRcpW2, // 5 // rcp w2; mul x2 * VIEWPORT_HALF_WIDTH
	triSetup_InvWWait0, // 6 // mul y0 * -VIEWPORT_HALF_HEIGHT
	triSetup_InvWWait1, // 7 // mul y1 * -VIEWPORT_HALF_HEIGHT
	triSetup_InvWWait2, // 8 // mul y2 * -VIEWPORT_HALF_HEIGHT
	triSetup_InvWWait3, // 9 // mul z0 * zScale
	triSetup_InvWWait4, // 10 // mul z1 * zScale
	triSetup_InvWWait5, // 11 // mul z2 * zScale
	triSetup_InvWWait6, // 12 // Wait for rcp w0 to finish
	triSetup_InvWWait7,	// 13 // Wait for rcp w0 to finish
	triSetup_InvWWait8,	// 14 // Wait for rcp w0 to finish
	triSetup_InvWWait9,	// 15 // Wait for rcp w0 to finish
	triSetup_InvWWait10, // 16 // Wait for rcp w0 to finish
	triSetup_InvWWait11, // 17 // Wait for rcp w0 to finish
	triSetup_InvWMultX0, // 18 // mul x0 * rcp_w0
	triSetup_InvWMultX1, // 19 // mul x1 * rcp_w1
	triSetup_InvWMultX2, // 20 // mul x2 * rcp_w2
	triSetup_InvWMultY0, // 21 // mul y0 * rcp_w0
	triSetup_InvWMultY1, // 22 // mul y1 * rcp_w1
	triSetup_InvWMultY2, // 23 // mul y2 * rcp_w2
	triSetup_InvWMultZ0, // 24 // mul z0 * rcp_w0; add x0 + VIEWPORT_HALF_WIDTH
	triSetup_InvWMultZ1, // 25 // mul z1 * rcp_w1; add x1 + VIEWPORT_HALF_WIDTH
	triSetup_InvWMultZ2, // 26 // mul z2 * rcp_w2; add x2 + VIEWPORT_HALF_WIDTH
	triSetup_InvWMultR0, // 27 // add y0 + VIEWPORT_HALF_HEIGHT; mul r0 * rcp_w0
	triSetup_InvWMultG0, // 28 // add y1 + VIEWPORT_HALF_HEIGHT; mul g0 * rcp_w0
	triSetup_InvWMultB0, // 29 // add y2 + VIEWPORT_HALF_HEIGHT; mul b0 * rcp_w0
	triSetup_InvWAddZ0, // 30 // add z0 + zOffset
	triSetup_InvWAddZ1, // 31 // add z1 + zOffset
	triSetup_InvWAddZ2, // 32 // add z2 + zOffset

	// Converting the float32 x/y coordinates to fixed-point integers
	triSetup_QuantizeSnapToGridX0, // 33 // cnv_F_to_I16_rne x0; mul a0 * rcp_w0
	triSetup_QuantizeSnapToGridX1, // 34 // cnv_F_to_I16_rne x1; mul tx0 * rcp_w0
	triSetup_QuantizeSnapToGridX2, // 35 // cnv_F_to_I16_rne x2; mul ty0 * rcp_w0
	triSetup_QuantizeSnapToGridY0, // 36 // cnv_F_to_I16_rne y0; mul r1 * rcp_w1; rcp z0
	triSetup_QuantizeSnapToGridY1, // 37 // cnv_F_to_I16_rne y1; mul g1 * rcp_w1; rcp z1
	triSetup_QuantizeSnapToGridY2, // 38 // cnv_F_to_I16_rne y2; mul b1 * rcp_w1; rcp z2
	triSetup_QuantizeSnapToGridWait0, // 39 // mul a1 * rcp_w1
	triSetup_QuantizeSnapToGridWait1, // 40 // mul tx1 * rcp_w1
	triSetup_QuantizeSnapToGridWait2, // 41 // mul ty1 * rcp_w1
	triSetup_QuantizeSnapToGridWait3, // 42 // mul r2 * rcp_w2

	triSetup_duplicateVertexCull, // 43 // mul g2 * rcp_w2

	// Bounds calculations and trivial rejection culling:
	triSetup_bounds, // 44 // mul b2 * rcp_w2
	triSetup_boundsClamp, // 45 // mul a2 * rcp_w2
	triSetup_boundsCull, // 46 // mul tx2 * rcp_w2

	// Compute cross-product to get (signed) twiceTriangleArea
	triSetup_crossProduct, // 47 // mul ty2 * rcp_w2
	triSetup_crossProduct2, // 48
	triSetup_crossProduct4, // 49

	// Backface cull (cull if twiceTriangleArea <= 0)
	triSetup_backfaceCull, // 50

	// Send data to reciprocal unit
	triSetup_sendToRecip, // 51
	triSetup_waitForConvert0, // 52
	triSetup_waitForConvert1, // 53
	triSetup_waitForConvert2, // 54
	triSetup_setupRecip, // 55

	// Compute top-left edge rule offsets
	triSetup_topLeftBiasA, // 56

	// Compute barycentric deltas
	triSetup_barycentricXDeltaA, // 57

	// Compute barycentric values
	triSetup_leftInner0, // 58
	triSetup_leftProduct0, // 59
	triSetup_crossProductSumA, // 60
	triSetup_applyTopLeftRule, // 61

	triSetup_waitForReciprocalResult, // 62

	// Compute 10 and 20 delta values for each of our interpolated components:
	triSetup_calculateTX10Delta, // 63
	triSetup_calculateTX20Delta, // 64
	triSetup_calculateTY10Delta, // 65
	triSetup_calculateTY20Delta, // 66
	triSetup_calculateColorR10Delta, // 67
	triSetup_calculateColorR20Delta, // 68
	triSetup_calculateColorG10Delta, // 69
	triSetup_calculateColorG20Delta, // 70
	triSetup_calculateColorB10Delta, // 71
	triSetup_calculateColorB20Delta, // 72
	triSetup_calculateColorA10Delta, // 73
	triSetup_calculateColorA20Delta, // 74
	triSetup_calculateZ10Delta, // 75
	triSetup_calculateZ20Delta, // 76
	triSetup_calculateInvW10Delta, // 77
	triSetup_calculateInvW20Delta, // 78
	triSetup_waitForDeltasCompletion0, // 79
	triSetup_waitForDeltasCompletion1, // 80
	triSetup_waitForDeltasCompletion2, // 81
	triSetup_waitForDeltasCompletion3, // 82
	triSetup_waitForDeltasCompletion4, // 83

	// Finally, send our setup tri result data to the rasterizer
	triSetup_broadcastOutput // 84
};

static const char* const TriSetupStateToString[] =
{
	"triSetup_waitForTriData", // 0

	// Initial vertex value culling (NaN/INF/Zero invW cause the triangle to be culled)
	"triSetup_NAN_INF_ZeroW_Cull", // 1
	"triSetup_FloatDegenerateTriDuplicateVert", // 2

	// Computing invW:
	"triSetup_InvWSubmitRcpW0", // 3 // rcp w0; mul x0 * VIEWPORT_HALF_WIDTH
	"triSetup_InvWSubmitRcpW1", // 4 // rcp w1; mul x1 * VIEWPORT_HALF_WIDTH
	"triSetup_InvWSubmitRcpW2", // 5 // rcp w2; mul x2 * VIEWPORT_HALF_WIDTH
	"triSetup_InvWWait0", // 6 // mul y0 * -VIEWPORT_HALF_HEIGHT
	"triSetup_InvWWait1", // 7 // mul y1 * -VIEWPORT_HALF_HEIGHT
	"triSetup_InvWWait2", // 8 // mul y2 * -VIEWPORT_HALF_HEIGHT
	"triSetup_InvWWait3", // 9 // mul z0 * zScale
	"triSetup_InvWWait4", // 10 // mul z1 * zScale
	"triSetup_InvWWait5", // 11 // mul z2 * zScale
	"triSetup_InvWWait6", // 12 // Wait for rcp w0 to finish
	"triSetup_InvWWait7",	// 13 // Wait for rcp w0 to finish
	"triSetup_InvWWait8",	// 14 // Wait for rcp w0 to finish
	"triSetup_InvWWait9",	// 15 // Wait for rcp w0 to finish
	"triSetup_InvWWait10", // 16 // Wait for rcp w0 to finish
	"triSetup_InvWWait11", // 17 // Wait for rcp w0 to finish
	"triSetup_InvWMultX0", // 18 // mul x0 * rcp_w0
	"triSetup_InvWMultX1", // 19 // mul x1 * rcp_w1
	"triSetup_InvWMultX2", // 20 // mul x2 * rcp_w2
	"triSetup_InvWMultY0", // 21 // mul y0 * rcp_w0
	"triSetup_InvWMultY1", // 22 // mul y1 * rcp_w1
	"triSetup_InvWMultY2", // 23 // mul y2 * rcp_w2
	"triSetup_InvWMultZ0", // 24 // mul z0 * rcp_w0; add x0 + VIEWPORT_HALF_WIDTH
	"triSetup_InvWMultZ1", // 25 // mul z1 * rcp_w1; add x1 + VIEWPORT_HALF_WIDTH
	"triSetup_InvWMultZ2", // 26 // mul z2 * rcp_w2; add x2 + VIEWPORT_HALF_WIDTH
	"triSetup_InvWMultR0", // 27 // add y0 + VIEWPORT_HALF_HEIGHT; mul r0 * rcp_w0
	"triSetup_InvWMultG0", // 28 // add y1 + VIEWPORT_HALF_HEIGHT; mul g0 * rcp_w0
	"triSetup_InvWMultB0", // 29 // add y2 + VIEWPORT_HALF_HEIGHT; mul b0 * rcp_w0
	"triSetup_InvWAddZ0", // 30 // add z0 + zOffset
	"triSetup_InvWAddZ1", // 31 // add z1 + zOffset
	"triSetup_InvWAddZ2", // 32 // add z2 + zOffset

	// Converting the float32 x/y coordinates to fixed-point integers
	"triSetup_QuantizeSnapToGridX0", // 33 // cnv_F_to_I16_rne x0; mul a0 * rcp_w0
	"triSetup_QuantizeSnapToGridX1", // 34 // cnv_F_to_I16_rne x1; mul tx0 * rcp_w0
	"triSetup_QuantizeSnapToGridX2", // 35 // cnv_F_to_I16_rne x2; mul ty0 * rcp_w0
	"triSetup_QuantizeSnapToGridY0", // 36 // cnv_F_to_I16_rne y0; mul r1 * rcp_w1; rcp z0
	"triSetup_QuantizeSnapToGridY1", // 37 // cnv_F_to_I16_rne y1; mul g1 * rcp_w1; rcp z1
	"triSetup_QuantizeSnapToGridY2", // 38 // cnv_F_to_I16_rne y2; mul b1 * rcp_w1; rcp z2
	"triSetup_QuantizeSnapToGridWait0", // 39 // mul a1 * rcp_w1
	"triSetup_QuantizeSnapToGridWait1", // 40 // mul tx1 * rcp_w1
	"triSetup_QuantizeSnapToGridWait2", // 41 // mul ty1 * rcp_w1
	"triSetup_QuantizeSnapToGridWait3", // 42 // mul r2 * rcp_w2

	"triSetup_duplicateVertexCull", // 43 // mul g2 * rcp_w2

	// Bounds calculations and trivial rejection culling:
	"triSetup_bounds", // 44 // mul b2 * rcp_w2
	"triSetup_boundsClamp", // 45 // mul a2 * rcp_w2
	"triSetup_boundsCull", // 46 // mul tx2 * rcp_w2

	// Compute cross-product to get (signed) twiceTriangleArea
	"triSetup_crossProduct", // 47 // mul ty2 * rcp_w2
	"triSetup_crossProduct2", // 48
	"triSetup_crossProduct4", // 49

	// Backface cull (cull if twiceTriangleArea <= 0)
	"triSetup_backfaceCull", // 50

	// Send data to reciprocal unit
	"triSetup_sendToRecip", // 51
	"triSetup_waitForConvert0", // 52
	"triSetup_waitForConvert1", // 53
	"triSetup_waitForConvert2", // 54
	"triSetup_setupRecip", // 55

	// Compute top-left edge rule offsets
	"triSetup_topLeftBiasA", // 56

	// Compute barycentric deltas
	"triSetup_barycentricXDeltaA", // 57

	// Compute barycentric values
	"triSetup_leftInner0", // 58
	"triSetup_leftProduct0", // 59
	"triSetup_crossProductSumA", // 60
	"triSetup_applyTopLeftRule", // 61

	"triSetup_waitForReciprocalResult", // 62

	// Compute 10 and 20 delta values for each of our interpolated components:
	"triSetup_calculateTX10Delta", // 63
	"triSetup_calculateTX20Delta", // 64
	"triSetup_calculateTY10Delta", // 65
	"triSetup_calculateTY20Delta", // 66
	"triSetup_calculateColorR10Delta", // 67
	"triSetup_calculateColorR20Delta", // 68
	"triSetup_calculateColorG10Delta", // 69
	"triSetup_calculateColorG20Delta", // 70
	"triSetup_calculateColorB10Delta", // 71
	"triSetup_calculateColorB20Delta", // 72
	"triSetup_calculateColorA10Delta", // 73
	"triSetup_calculateColorA20Delta", // 74
	"triSetup_calculateZ10Delta", // 75
	"triSetup_calculateZ20Delta", // 76
	"triSetup_calculateInvW10Delta", // 77
	"triSetup_calculateInvW20Delta", // 78
	"triSetup_waitForDeltasCompletion0", // 79
	"triSetup_waitForDeltasCompletion1", // 80
	"triSetup_waitForDeltasCompletion2", // 81
	"triSetup_waitForDeltasCompletion3", // 82
	"triSetup_waitForDeltasCompletion4", // 83

	// Finally, send our setup tri result data to the rasterizer
	"triSetup_broadcastOutput" // 84
};

// Performs the reverse viewport transform on the data
void UntransformViewport(triSetupInput& inoutTriData)
{
	inoutTriData.v0.xPos -= VIEWPORT_HALF_WIDTH;
	inoutTriData.v0.xPos /= VIEWPORT_HALF_WIDTH;
	inoutTriData.v1.xPos -= VIEWPORT_HALF_WIDTH;
	inoutTriData.v1.xPos /= VIEWPORT_HALF_WIDTH;
	inoutTriData.v2.xPos -= VIEWPORT_HALF_WIDTH;
	inoutTriData.v2.xPos /= VIEWPORT_HALF_WIDTH;

	inoutTriData.v0.yPos -= VIEWPORT_HALF_HEIGHT;
	inoutTriData.v0.yPos /= -VIEWPORT_HALF_HEIGHT;
	inoutTriData.v1.yPos -= VIEWPORT_HALF_HEIGHT;
	inoutTriData.v1.yPos /= -VIEWPORT_HALF_HEIGHT;
	inoutTriData.v2.yPos -= VIEWPORT_HALF_HEIGHT;
	inoutTriData.v2.yPos /= -VIEWPORT_HALF_HEIGHT;
}

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

triSetupScreenspace ApplyViewportAndDivideByW(const triSetupInput& inTri)
{
	triSetupScreenspace ret;

	const float invW0 = 1.0f / inTri.v0.wPos;
	const float invW1 = 1.0f / inTri.v1.wPos;
	const float invW2 = 1.0f / inTri.v2.wPos;

	ret.v0.xPos = inTri.v0.xPos * invW0 * VIEWPORT_HALF_WIDTH + VIEWPORT_HALF_WIDTH;
	ret.v1.xPos = inTri.v1.xPos * invW1 * VIEWPORT_HALF_WIDTH + VIEWPORT_HALF_WIDTH;
	ret.v2.xPos = inTri.v2.xPos * invW2 * VIEWPORT_HALF_WIDTH + VIEWPORT_HALF_WIDTH;

	ret.v0.yPos = inTri.v0.yPos * invW0 * -VIEWPORT_HALF_HEIGHT + VIEWPORT_HALF_HEIGHT;
	ret.v1.yPos = inTri.v1.yPos * invW1 * -VIEWPORT_HALF_HEIGHT + VIEWPORT_HALF_HEIGHT;
	ret.v2.yPos = inTri.v2.yPos * invW2 * -VIEWPORT_HALF_HEIGHT + VIEWPORT_HALF_HEIGHT;

	ret.v0.Z = inTri.v0.zPos * invW0;
	ret.v1.Z = inTri.v1.zPos * invW1;
	ret.v2.Z = inTri.v2.zPos * invW2;

	ret.v0.invW = invW0;
	ret.v1.invW = invW1;
	ret.v2.invW = invW2;

	ret.v0.xTex = inTri.v0.xTex * invW0;
	ret.v1.xTex = inTri.v1.xTex * invW1;
	ret.v2.xTex = inTri.v2.xTex * invW2;

	ret.v0.yTex = inTri.v0.yTex * invW0;
	ret.v1.yTex = inTri.v1.yTex * invW1;
	ret.v2.yTex = inTri.v2.yTex * invW2;

	ret.v0.rgba.r = inTri.v0.rgba.r * invW0;
	ret.v1.rgba.r = inTri.v1.rgba.r * invW1;
	ret.v2.rgba.r = inTri.v2.rgba.r * invW2;

	ret.v0.rgba.g = inTri.v0.rgba.g * invW0;
	ret.v1.rgba.g = inTri.v1.rgba.g * invW1;
	ret.v2.rgba.g = inTri.v2.rgba.g * invW2;

	ret.v0.rgba.b = inTri.v0.rgba.b * invW0;
	ret.v1.rgba.b = inTri.v1.rgba.b * invW1;
	ret.v2.rgba.b = inTri.v2.rgba.b * invW2;

	ret.v0.rgba.a = inTri.v0.rgba.a * invW0;
	ret.v1.rgba.a = inTri.v1.rgba.a * invW1;
	ret.v2.rgba.a = inTri.v2.rgba.a * invW2;

	return ret;
}

triSetupResultType EmulateCPUTriSetup(const triSetupInput& inTriData, triSetupOutput& outTriSetupOutput)
{
	// D3D spec mandates that any triangle that contains a NaN in any of its oPos components *must* be culled:
	if (isnan(inTriData.v0.xPos) || isnan(inTriData.v0.yPos) || isnan(inTriData.v0.zPos) || isnan(inTriData.v0.wPos) ||
		isnan(inTriData.v1.xPos) || isnan(inTriData.v1.yPos) || isnan(inTriData.v1.zPos) || isnan(inTriData.v1.wPos) ||
		isnan(inTriData.v2.xPos) || isnan(inTriData.v2.yPos) || isnan(inTriData.v2.zPos) || isnan(inTriData.v2.wPos) )
		return triSetup_NAN_INF_Cull;

	// D3D spec mandates that any triangle that contains an INF in any of its oPos components *may* optionally be culled:
	if (isinf(inTriData.v0.xPos) || isinf(inTriData.v0.yPos) || isinf(inTriData.v0.zPos) || isinf(inTriData.v0.wPos) ||
		isinf(inTriData.v1.xPos) || isinf(inTriData.v1.yPos) || isinf(inTriData.v1.zPos) || isinf(inTriData.v1.wPos) ||
		isinf(inTriData.v2.xPos) || isinf(inTriData.v2.yPos) || isinf(inTriData.v2.zPos) || isinf(inTriData.v2.wPos) )
		return triSetup_NAN_INF_Cull;

	// If any of our verts' invW is 0 (or a degenerate value that gets degenerate-flushed into 0) then we need to cull this triangle
	if (fabs(inTriData.v0.wPos) <= 1.17549421069244107549e-38f || fabs(inTriData.v1.wPos) <= 1.17549421069244107549e-38f || fabs(inTriData.v2.wPos) <= 1.17549421069244107549e-38f)
		return triSetup_NAN_INF_Cull;

	if ( (inTriData.v0.xPos == inTriData.v1.xPos && inTriData.v0.yPos == inTriData.v1.yPos && inTriData.v0.zPos == inTriData.v1.zPos && inTriData.v0.wPos == inTriData.v1.wPos) ||
		(inTriData.v0.xPos == inTriData.v2.xPos && inTriData.v0.yPos == inTriData.v2.yPos && inTriData.v0.zPos == inTriData.v2.zPos && inTriData.v0.wPos == inTriData.v2.wPos) ||
		(inTriData.v1.xPos == inTriData.v2.xPos && inTriData.v1.yPos == inTriData.v2.yPos && inTriData.v1.zPos == inTriData.v2.zPos && inTriData.v1.wPos == inTriData.v2.wPos) )
		return triSetup_DuplicateVertexCull;

	// Apply division by W and the viewport transform to convert our vertices from clip-space into screen-space:
	const triSetupScreenspace screenspaceTri = ApplyViewportAndDivideByW(inTriData);

	// Technically this isn't yet fully correct, as D3D mandates snapping to at least a 16.8 fixed-point integer grid (using round-to-nearest integer), and here
	// we're snapping to a 16.0 fixed-point integer grid instead:
	const signed short vx0 = RoundFloatToI16NE(screenspaceTri.v0.xPos);
	const signed short vy0 = RoundFloatToI16NE(screenspaceTri.v0.yPos);
	const signed short vx1 = RoundFloatToI16NE(screenspaceTri.v1.xPos);
	const signed short vy1 = RoundFloatToI16NE(screenspaceTri.v1.yPos);
	const signed short vx2 = RoundFloatToI16NE(screenspaceTri.v2.xPos);
	const signed short vy2 = RoundFloatToI16NE(screenspaceTri.v2.yPos);
	const float vz0 = screenspaceTri.v0.Z;
	const float vz1 = screenspaceTri.v1.Z;
	const float vz2 = screenspaceTri.v2.Z;
	const float vinvw0 = screenspaceTri.v0.invW;
	const float vinvw1 = screenspaceTri.v1.invW;
	const float vinvw2 = screenspaceTri.v2.invW;

	if ( (vx0 == vx1 && vy0 == vy1) ||
		(vx0 == vx2 && vy0 == vy2) ||
		(vx1 == vx2 && vy1 == vy2) )
		return triSetup_DuplicateVertexCull;

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
	const float Z0 = vz0;
	const float Z10 = vz1 - Z0;
	const float Z20 = vz2 - Z0;
	const float invW0 = vinvw0;
	const float invW10 = vinvw1 - invW0;
	const float invW20 = vinvw2 - invW0;
	const float tx0 = screenspaceTri.v0.xTex;
	const float tx10 = screenspaceTri.v1.xTex - screenspaceTri.v0.xTex;
	const float tx20 = screenspaceTri.v2.xTex - screenspaceTri.v0.xTex;
	const float ty0 = screenspaceTri.v0.yTex;
	const float ty10 = screenspaceTri.v1.yTex - screenspaceTri.v0.yTex;
	const float ty20 = screenspaceTri.v2.yTex - screenspaceTri.v0.yTex;
	const float colorR0 = screenspaceTri.v0.rgba.r;
	const float colorR10 = screenspaceTri.v1.rgba.r - screenspaceTri.v0.rgba.r;
	const float colorR20 = screenspaceTri.v2.rgba.r - screenspaceTri.v0.rgba.r;
	const float colorG0 = screenspaceTri.v0.rgba.g;
	const float colorG10 = screenspaceTri.v1.rgba.g - screenspaceTri.v0.rgba.g;
	const float colorG20 = screenspaceTri.v2.rgba.g - screenspaceTri.v0.rgba.g;
	const float colorB0 = screenspaceTri.v0.rgba.b;
	const float colorB10 = screenspaceTri.v1.rgba.b - screenspaceTri.v0.rgba.b;
	const float colorB20 = screenspaceTri.v2.rgba.b - screenspaceTri.v0.rgba.b;
	const float colorA0 = screenspaceTri.v0.rgba.a;
	const float colorA10 = screenspaceTri.v1.rgba.a - screenspaceTri.v0.rgba.a;
	const float colorA20 = screenspaceTri.v2.rgba.a - screenspaceTri.v0.rgba.a;

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
	outTriSetupOutput.v0.Z = Z0;
	outTriSetupOutput.v10.Z = Z10;
	outTriSetupOutput.v20.Z = Z20;
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

	std_logic_port CLIP_newTriBegin(PD_IN, loader, "CLIP_newTriBegin");
	std_logic_port CLIP_readyForNewTri(PD_OUT, loader, "CLIP_readyForNewTri");

	std_logic_vector_port<32> CLIP_v0_in_x(PD_IN, loader, "CLIP_v0_in_x");
	std_logic_vector_port<32> CLIP_v0_in_y(PD_IN, loader, "CLIP_v0_in_y");
	std_logic_vector_port<32> CLIP_v0_in_z(PD_IN, loader, "CLIP_v0_in_z");
	std_logic_vector_port<32> CLIP_v0_in_w(PD_IN, loader, "CLIP_v0_in_w");
	std_logic_vector_port<32> CLIP_t0_in_x(PD_IN, loader, "CLIP_t0_in_x");
	std_logic_vector_port<32> CLIP_t0_in_y(PD_IN, loader, "CLIP_t0_in_y");
	std_logic_vector_port<128> CLIP_v0_in_RGBA(PD_IN, loader, "CLIP_v0_in_RGBA");
	std_logic_vector_port<32> CLIP_v1_in_x(PD_IN, loader, "CLIP_v1_in_x");
	std_logic_vector_port<32> CLIP_v1_in_y(PD_IN, loader, "CLIP_v1_in_y");
	std_logic_vector_port<32> CLIP_v1_in_z(PD_IN, loader, "CLIP_v1_in_z");
	std_logic_vector_port<32> CLIP_v1_in_w(PD_IN, loader, "CLIP_v1_in_w");
	std_logic_vector_port<32> CLIP_t1_in_x(PD_IN, loader, "CLIP_t1_in_x");
	std_logic_vector_port<32> CLIP_t1_in_y(PD_IN, loader, "CLIP_t1_in_y");
	std_logic_vector_port<128> CLIP_v1_in_RGBA(PD_IN, loader, "CLIP_v1_in_RGBA");
	std_logic_vector_port<32> CLIP_v2_in_x(PD_IN, loader, "CLIP_v2_in_x");
	std_logic_vector_port<32> CLIP_v2_in_y(PD_IN, loader, "CLIP_v2_in_y");
	std_logic_vector_port<32> CLIP_v2_in_z(PD_IN, loader, "CLIP_v2_in_z");
	std_logic_vector_port<32> CLIP_v2_in_w(PD_IN, loader, "CLIP_v2_in_w");
	std_logic_vector_port<32> CLIP_t2_in_x(PD_IN, loader, "CLIP_t2_in_x");
	std_logic_vector_port<32> CLIP_t2_in_y(PD_IN, loader, "CLIP_t2_in_y");
	std_logic_vector_port<128> CLIP_v2_in_RGBA(PD_IN, loader, "CLIP_v2_in_RGBA");

	std_logic_port RAST_readyForTriSetupData(PD_IN, loader, "RAST_readyForTriSetupData");
	std_logic_port RAST_triSetupDataIsValid(PD_OUT, loader, "RAST_triSetupDataIsValid");

	std_logic_vector_port<32> RAST_outBarycentricInverse(PD_OUT, loader, "RAST_outBarycentricInverse");
	std_logic_vector_port<32> RAST_v0_out_Z(PD_OUT, loader, "RAST_v0_out_Z");
	std_logic_vector_port<32> RAST_v10_out_Z(PD_OUT, loader, "RAST_v10_out_Z");
	std_logic_vector_port<32> RAST_v20_out_Z(PD_OUT, loader, "RAST_v20_out_Z");
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
	std_logic_vector_port<32> FPU_ADD_A(PD_OUT, loader, "FPU_ADD_A");
	std_logic_vector_port<32> FPU_ADD_B(PD_OUT, loader, "FPU_ADD_B");
	std_logic_vector_port<32> FPU_ADD_OUT(PD_IN, loader, "FPU_ADD_OUT");
	std_logic_port FPU_ADD_GO(PD_OUT, loader, "FPU_ADD_GO");

	std_logic_vector_port<32> FPU_MUL_A(PD_OUT, loader, "FPU_MUL_A");
	std_logic_vector_port<32> FPU_MUL_B(PD_OUT, loader, "FPU_MUL_B");
	std_logic_vector_port<32> FPU_MUL_OUT(PD_IN, loader, "FPU_MUL_OUT");
	std_logic_port FPU_MUL_GO(PD_OUT, loader, "FPU_MUL_GO");

	std_logic_vector_port<32> FPU_CNV_A(PD_OUT, loader, "FPU_CNV_A");
	std_logic_vector_port<3> FPU_CNV_Mode(PD_OUT, loader, "FPU_CNV_Mode");
	std_logic_vector_port<32> FPU_CNV_OUT(PD_IN, loader, "FPU_CNV_OUT");
	std_logic_port FPU_CNV_GO(PD_OUT, loader, "FPU_CNV_GO");

	std_logic_vector_port<32> FPU_SPEC_A(PD_OUT, loader, "FPU_SPEC_A");
	std_logic_vector_port<32> FPU_SPEC_OUT(PD_IN, loader, "FPU_SPEC_OUT");
	std_logic_port FPU_SPEC_GO(PD_OUT, loader, "FPU_SPEC_GO");

	// Command processor signals:
	std_logic_port CMD_TriSetupIsIdle(PD_OUT, loader, "CMD_TriSetupIsIdle");
	std_logic_vector_port<2> CMD_SetViewportParams(PD_IN, loader, "CMD_SetViewportParams");
	std_logic_vector_port<32> CMD_ViewportParams0(PD_IN, loader, "CMD_ViewportParams0");
	std_logic_vector_port<32> CMD_ViewportParams1(PD_IN, loader, "CMD_ViewportParams1");

	// Stats signals:
	std_logic_vector_port<32> STAT_CyclesIdle(PD_OUT, loader, "STAT_CyclesIdle");
	std_logic_vector_port<32> STAT_CyclesSpentWorking(PD_OUT, loader, "STAT_CyclesSpentWorking");
	std_logic_vector_port<32> STAT_CyclesWaitingForOutput(PD_OUT, loader, "STAT_CyclesWaitingForOutput");

	// Debug signals:
	std_logic_vector_port<8> DBG_TriSetup_State(PD_OUT, loader, "DBG_TriSetup_State");
	std_logic_vector_port<32> DBG_LeftProd0(PD_OUT, loader, "DBG_LeftProd0");
	std_logic_vector_port<32> DBG_LeftProd1(PD_OUT, loader, "DBG_LeftProd1");
	std_logic_vector_port<32> DBG_LeftProd2(PD_OUT, loader, "DBG_LeftProd2");
	std_logic_vector_port<32> DBG_RightProd0(PD_OUT, loader, "DBG_RightProd0");
	std_logic_vector_port<32> DBG_RightProd1(PD_OUT, loader, "DBG_RightProd1");
	std_logic_vector_port<32> DBG_RightProd2(PD_OUT, loader, "DBG_RightProd2");
	std_logic_vector_port<32> DBG_LeftFirstTermInner1(PD_OUT, loader, "DBG_LeftFirstTermInner1");
	std_logic_vector_port<32> DBG_LeftSecondTermInner1(PD_OUT, loader, "DBG_LeftSecondTermInner1");

	FPU triSetupFPU_ADD(0);
	FPU triSetupFPU_MUL(0);
	FPU triSetupFPU_CNV(0);
	FPU triSetupFPU_SPEC(0);

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		CLIP_newTriBegin = false;
		TEXCFG_nointerpolation = false;
		RAST_readyForTriSetupData = true;
		FPU_ADD_OUT = 0.0f;
		FPU_MUL_OUT = 0.0f;
		FPU_CNV_OUT = 0.0f;
		FPU_SPEC_OUT = 0.0f;
	}

	const auto runTriSetupTest = [&](const triSetupInput& inTriData, const triSetupResultType expectedResult) -> bool
	{
		std::vector<triSetupInput> unclippedTris;
		unclippedTris.push_back(inTriData);
		std::vector<triSetupInput> clippedTris;
		EmulateCPUClipper(unclippedTris, clippedTris);

		const unsigned numClippedTris = (const unsigned)clippedTris.size();
		for (unsigned x = 0; x < numClippedTris; ++x)
		{
			printf("RTL Sim new triangle\n");

			const triSetupInput& thisClippedTri = clippedTris[x];

			triSetupState dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();

			// Wait for the triSetup block to be ready
			while (CLIP_readyForNewTri.GetBoolVal() == false && CMD_TriSetupIsIdle.GetBoolVal() == true)
			{
				CLIP_newTriBegin = false;
				CMD_SetViewportParams = 0;
				scoped_timestep time(loader, clk, 100);
				dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();
			}

			CLIP_v0_in_x = thisClippedTri.v0.xPos;
			CLIP_v0_in_y = thisClippedTri.v0.yPos;
			CLIP_v0_in_z = thisClippedTri.v0.zPos;
			CLIP_v0_in_w = thisClippedTri.v0.wPos;
			CLIP_t0_in_x = thisClippedTri.v0.xTex;
			CLIP_t0_in_y = thisClippedTri.v0.yTex;
			CLIP_v0_in_RGBA.SetStructVal(thisClippedTri.v0.rgba);
			CLIP_v1_in_x = thisClippedTri.v1.xPos;
			CLIP_v1_in_y = thisClippedTri.v1.yPos;
			CLIP_v1_in_z = thisClippedTri.v1.zPos;
			CLIP_v1_in_w = thisClippedTri.v1.wPos;
			CLIP_t1_in_x = thisClippedTri.v1.xTex;
			CLIP_t1_in_y = thisClippedTri.v1.yTex;
			CLIP_v1_in_RGBA.SetStructVal(thisClippedTri.v1.rgba);
			CLIP_v2_in_x = thisClippedTri.v2.xPos;
			CLIP_v2_in_y = thisClippedTri.v2.yPos;
			CLIP_v2_in_z = thisClippedTri.v2.zPos;
			CLIP_v2_in_w = thisClippedTri.v2.wPos;
			CLIP_t2_in_x = thisClippedTri.v2.xTex;
			CLIP_t2_in_y = thisClippedTri.v2.yTex;
			CLIP_v2_in_RGBA.SetStructVal(thisClippedTri.v2.rgba);

			// Pulse the "go signal" on for just one cycle, then turn it off:
			{
				scoped_timestep time(loader, clk, 100);
				CLIP_newTriBegin = true;
				dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();

				CMD_SetViewportParams = 0x1;
				CMD_ViewportParams0 = VIEWPORT_HALF_WIDTH;
				CMD_ViewportParams1 = VIEWPORT_HALF_HEIGHT;
			}
			CLIP_newTriBegin = false;

			unsigned triSetupOutputCount = 0;

			triSetupOutput simulatedRTLOutput = {0};
			triSetupOutput emulatedCPUOutput = {0};

			unsigned cyclesPerTri = 0;

			while (CLIP_readyForNewTri.GetBoolVal() == false)
			{
				scoped_timestep time(loader, clk, 100);

				if (cyclesPerTri == 0)
				{
					CMD_SetViewportParams = 0x2;
					CMD_ViewportParams0 = 1.0f;
					CMD_ViewportParams1 = 0.0f;
				}
				else if (cyclesPerTri == 1)
				{
					CMD_SetViewportParams = 0x0;
				}

				++cyclesPerTri;

				dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();

				triSetupFPU_ADD.UpdateAddOnly(FPU_ADD_GO, FPU_ADD_A, FPU_ADD_B, FPU_ADD_OUT);
				triSetupFPU_MUL.UpdateMulOnly(FPU_MUL_GO, FPU_MUL_A, FPU_MUL_B, FPU_MUL_OUT);
				triSetupFPU_CNV.UpdateCnvOnly(FPU_CNV_GO, FPU_CNV_Mode, FPU_CNV_A, FPU_CNV_OUT);
				triSetupFPU_SPEC.UpdateRcpOnly(FPU_SPEC_GO, FPU_SPEC_A, FPU_SPEC_OUT);

				printf("RTL Sim new state: \"%s\" (%u)\n", TriSetupStateToString[dbgCurrentState], dbgCurrentState);

				if (RAST_triSetupDataIsValid.GetBoolVal() )
				{
					if (triSetupOutputCount++ == 0)
					{
						simulatedRTLOutput.SerializeTriSetupOutput(RAST_outBarycentricInverse,
							RAST_v0_out_Z, RAST_v10_out_Z, RAST_v20_out_Z,
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
			printf("RTL Sim new state: \"%s\" (%u)\n", TriSetupStateToString[dbgCurrentState], dbgCurrentState);

			const triSetupResultType emulatedCPUResult = EmulateCPUTriSetup(thisClippedTri, emulatedCPUOutput);
			if (emulatedCPUResult != expectedResult && expectedResult != triSetup_MULTI)
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
			else if (expectedResult != triSetup_OK && expectedResult != triSetup_MULTI && triSetupOutputCount != 0)
			{
				__debugbreak();
				return false;
			}

			if ( (expectedResult == triSetup_OK || expectedResult == triSetup_MULTI) && emulatedCPUResult == triSetup_OK)
			{
				if (!(emulatedCPUOutput == simulatedRTLOutput) )
				{
					__debugbreak();
					return false;
				}
			}

		}

		return true;
	};

	const auto runTriSetupTestRand = [&](const triSetupInput& inTriData) -> bool
	{
		std::vector<triSetupInput> unclippedTris;
		unclippedTris.push_back(inTriData);
		std::vector<triSetupInput> clippedTris;
		EmulateCPUClipper(unclippedTris, clippedTris);

		const unsigned numClippedTris = (const unsigned)clippedTris.size();
		for (unsigned x = 0; x < numClippedTris; ++x)
		{
			//printf("RTL Sim new triangle\n");

			const triSetupInput& thisClippedTri = clippedTris[x];

			triSetupState dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();

			// Wait for the triSetup block to be ready
			while (CLIP_readyForNewTri.GetBoolVal() == false && CMD_TriSetupIsIdle.GetBoolVal() == true)
			{
				CLIP_newTriBegin = false;
				CMD_SetViewportParams = 0;
				scoped_timestep time(loader, clk, 100);
				dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();
			}

			CLIP_v0_in_x = thisClippedTri.v0.xPos;
			CLIP_v0_in_y = thisClippedTri.v0.yPos;
			CLIP_v0_in_z = thisClippedTri.v0.zPos;
			CLIP_v0_in_w = thisClippedTri.v0.wPos;
			CLIP_t0_in_x = thisClippedTri.v0.xTex;
			CLIP_t0_in_y = thisClippedTri.v0.yTex;
			CLIP_v0_in_RGBA.SetStructVal(thisClippedTri.v0.rgba);
			CLIP_v1_in_x = thisClippedTri.v1.xPos;
			CLIP_v1_in_y = thisClippedTri.v1.yPos;
			CLIP_v1_in_z = thisClippedTri.v1.zPos;
			CLIP_v1_in_w = thisClippedTri.v1.wPos;
			CLIP_t1_in_x = thisClippedTri.v1.xTex;
			CLIP_t1_in_y = thisClippedTri.v1.yTex;
			CLIP_v1_in_RGBA.SetStructVal(thisClippedTri.v1.rgba);
			CLIP_v2_in_x = thisClippedTri.v2.xPos;
			CLIP_v2_in_y = thisClippedTri.v2.yPos;
			CLIP_v2_in_z = thisClippedTri.v2.zPos;
			CLIP_v2_in_w = thisClippedTri.v2.wPos;
			CLIP_t2_in_x = thisClippedTri.v2.xTex;
			CLIP_t2_in_y = thisClippedTri.v2.yTex;
			CLIP_v2_in_RGBA.SetStructVal(thisClippedTri.v2.rgba);

			// Pulse the "go signal" on for just one cycle, then turn it off:
			{
				scoped_timestep time(loader, clk, 100);
				CLIP_newTriBegin = true;
				dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();

				CMD_SetViewportParams = 0x1;
				CMD_ViewportParams0 = VIEWPORT_HALF_WIDTH;
				CMD_ViewportParams1 = VIEWPORT_HALF_HEIGHT;
			}
			CLIP_newTriBegin = false;

			unsigned triSetupOutputCount = 0;

			triSetupOutput simulatedRTLOutput = {0};
			triSetupOutput emulatedCPUOutput = {0};

			unsigned cyclesPerTri = 0;

			int leftProd0 = 0;
			int leftProd1 = 0;
			int leftProd2 = 0;
			int rightProd0 = 0;
			int rightProd1 = 0;
			int rightProd2 = 0;
			int firstTermInner1 = 0;
			int secondTermInner1 = 0;

			while (CLIP_readyForNewTri.GetBoolVal() == false)
			{
				scoped_timestep time(loader, clk, 100);

				if (cyclesPerTri == 0)
				{
					CMD_SetViewportParams = 0x2;
					CMD_ViewportParams0 = 1.0f;
					CMD_ViewportParams1 = 0.0f;
				}
				else if (cyclesPerTri == 1)
				{
					CMD_SetViewportParams = 0x0;
				}

				++cyclesPerTri;

				dbgCurrentState = (const triSetupState)DBG_TriSetup_State.GetUint8Val();

				triSetupFPU_ADD.UpdateAddOnly(FPU_ADD_GO, FPU_ADD_A, FPU_ADD_B, FPU_ADD_OUT);
				triSetupFPU_MUL.UpdateMulOnly(FPU_MUL_GO, FPU_MUL_A, FPU_MUL_B, FPU_MUL_OUT);
				triSetupFPU_CNV.UpdateCnvOnly(FPU_CNV_GO, FPU_CNV_Mode, FPU_CNV_A, FPU_CNV_OUT);
				triSetupFPU_SPEC.UpdateRcpOnly(FPU_SPEC_GO, FPU_SPEC_A, FPU_SPEC_OUT);

				//printf("RTL Sim new state: \"%s\" (%u)\n", TriSetupStateToString[dbgCurrentState], dbgCurrentState);

				if (enableDebugOutput)
				{
					leftProd0 = DBG_LeftProd0.GetInt32Val();
					leftProd1 = DBG_LeftProd1.GetInt32Val();
					leftProd2 = DBG_LeftProd2.GetInt32Val();
					rightProd0 = DBG_RightProd0.GetInt32Val();
					rightProd1 = DBG_RightProd1.GetInt32Val();
					rightProd2 = DBG_RightProd2.GetInt32Val();
					firstTermInner1 = DBG_LeftFirstTermInner1.GetInt32Val();
					secondTermInner1 = DBG_LeftSecondTermInner1.GetInt32Val();
				}

				if (RAST_triSetupDataIsValid.GetBoolVal() )
				{
					if (triSetupOutputCount++ == 0)
					{
						simulatedRTLOutput.SerializeTriSetupOutput(RAST_outBarycentricInverse,
							RAST_v0_out_Z, RAST_v10_out_Z, RAST_v20_out_Z,
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
			//printf("RTL Sim new state: \"%s\" (%u)\n", TriSetupStateToString[dbgCurrentState], dbgCurrentState);

			const triSetupResultType emulatedCPUResult = EmulateCPUTriSetup(thisClippedTri, emulatedCPUOutput);
			if (emulatedCPUResult == triSetup_OK)
			{
				if (!(emulatedCPUOutput == simulatedRTLOutput) )
				{
					__debugbreak();
					return false;
				}
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
		degenerateTriangleDataABC.v0.zPos = 0.5f;
		degenerateTriangleDataABC.v0.wPos = 1.0f;
		degenerateTriangleDataABC.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		degenerateTriangleDataABC.v1.xPos = degenTriangleZeroArea[1].posX;
		degenerateTriangleDataABC.v1.yPos = degenTriangleZeroArea[1].posY;
		degenerateTriangleDataABC.v1.zPos = degenerateTriangleDataABC.v0.zPos;
		degenerateTriangleDataABC.v1.wPos = degenerateTriangleDataABC.v0.wPos;
		degenerateTriangleDataABC.v1.rgba = degenerateTriangleDataABC.v0.rgba;
		degenerateTriangleDataABC.v2.xPos = degenTriangleZeroArea[2].posX;
		degenerateTriangleDataABC.v2.yPos = degenTriangleZeroArea[2].posY;
		degenerateTriangleDataABC.v2.zPos = degenerateTriangleDataABC.v0.zPos;
		degenerateTriangleDataABC.v2.wPos = degenerateTriangleDataABC.v0.wPos;
		degenerateTriangleDataABC.v2.rgba = degenerateTriangleDataABC.v0.rgba;

		UntransformViewport(degenerateTriangleDataABC);

		successResult &= runTriSetupTest(degenerateTriangleDataABC, triSetup_DuplicateVertexCull);
	}

	// Test a 2/3 rejection degenerate triangle (A/B duplicate):
	{
		triSetupInput degenerateTriangleDataAB = {0};
		degenerateTriangleDataAB.v0.xPos = degenTriangleZeroArea[0].posX;
		degenerateTriangleDataAB.v0.yPos = degenTriangleZeroArea[0].posY;
		degenerateTriangleDataAB.v0.zPos = 0.5f;
		degenerateTriangleDataAB.v0.wPos = 1.0f;
		degenerateTriangleDataAB.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		degenerateTriangleDataAB.v1.xPos = degenTriangleZeroArea[1].posX;
		degenerateTriangleDataAB.v1.yPos = degenTriangleZeroArea[1].posY;
		degenerateTriangleDataAB.v1.zPos = degenerateTriangleDataAB.v0.zPos;
		degenerateTriangleDataAB.v1.wPos = degenerateTriangleDataAB.v0.wPos;
		degenerateTriangleDataAB.v1.rgba = degenerateTriangleDataAB.v0.rgba;
		degenerateTriangleDataAB.v2.xPos = fullTriangle0[2].posX;
		degenerateTriangleDataAB.v2.yPos = fullTriangle0[2].posY;
		degenerateTriangleDataAB.v2.zPos = degenerateTriangleDataAB.v0.zPos;
		degenerateTriangleDataAB.v2.wPos = degenerateTriangleDataAB.v0.wPos;
		degenerateTriangleDataAB.v2.rgba = degenerateTriangleDataAB.v0.rgba;

		UntransformViewport(degenerateTriangleDataAB);

		successResult &= runTriSetupTest(degenerateTriangleDataAB, triSetup_DuplicateVertexCull);
	}

	// Test a 2/3 rejection degenerate triangle (A/C duplicate):
	{
		triSetupInput degenerateTriangleDataAC = {0};
		degenerateTriangleDataAC.v0.xPos = degenTriangleZeroArea[0].posX;
		degenerateTriangleDataAC.v0.yPos = degenTriangleZeroArea[0].posY;
		degenerateTriangleDataAC.v0.zPos = 0.5f;
		degenerateTriangleDataAC.v0.wPos = 1.0f;
		degenerateTriangleDataAC.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		degenerateTriangleDataAC.v1.xPos = fullTriangle0[1].posX;
		degenerateTriangleDataAC.v1.yPos = fullTriangle0[1].posY;
		degenerateTriangleDataAC.v1.zPos = degenerateTriangleDataAC.v0.zPos;
		degenerateTriangleDataAC.v1.wPos = degenerateTriangleDataAC.v0.wPos;
		degenerateTriangleDataAC.v1.rgba = degenerateTriangleDataAC.v0.rgba;
		degenerateTriangleDataAC.v2.xPos = degenTriangleZeroArea[2].posX;
		degenerateTriangleDataAC.v2.yPos = degenTriangleZeroArea[2].posY;
		degenerateTriangleDataAC.v2.zPos = degenerateTriangleDataAC.v0.zPos;
		degenerateTriangleDataAC.v2.wPos = degenerateTriangleDataAC.v0.wPos;
		degenerateTriangleDataAC.v2.rgba = degenerateTriangleDataAC.v0.rgba;

		UntransformViewport(degenerateTriangleDataAC);

		successResult &= runTriSetupTest(degenerateTriangleDataAC, triSetup_DuplicateVertexCull);
	}

	// Test a 2/3 rejection degenerate triangle (B/C duplicate):
	{
		triSetupInput degenerateTriangleDataBC = {0};
		degenerateTriangleDataBC.v0.xPos = fullTriangle0[0].posX;
		degenerateTriangleDataBC.v0.yPos = fullTriangle0[0].posY;
		degenerateTriangleDataBC.v0.zPos = 0.5f;
		degenerateTriangleDataBC.v0.wPos = 1.0f;
		degenerateTriangleDataBC.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		degenerateTriangleDataBC.v1.xPos = degenTriangleZeroArea[1].posX;
		degenerateTriangleDataBC.v1.yPos = degenTriangleZeroArea[1].posY;
		degenerateTriangleDataBC.v1.zPos = degenerateTriangleDataBC.v0.zPos;
		degenerateTriangleDataBC.v1.wPos = degenerateTriangleDataBC.v0.wPos;
		degenerateTriangleDataBC.v1.rgba = degenerateTriangleDataBC.v0.rgba;
		degenerateTriangleDataBC.v2.xPos = degenTriangleZeroArea[2].posX;
		degenerateTriangleDataBC.v2.yPos = degenTriangleZeroArea[2].posY;
		degenerateTriangleDataBC.v2.zPos = degenerateTriangleDataBC.v0.zPos;
		degenerateTriangleDataBC.v2.wPos = degenerateTriangleDataBC.v0.wPos;
		degenerateTriangleDataBC.v2.rgba = degenerateTriangleDataBC.v0.rgba;

		UntransformViewport(degenerateTriangleDataBC);

		successResult &= runTriSetupTest(degenerateTriangleDataBC, triSetup_DuplicateVertexCull);
	}

	// Test a case of a triangle with one of its vertices having a NaN value:
	{
		triSetupInput triangleNANData = {0};
		triangleNANData.v0.xPos = fullTriangle0[0].posX;
		triangleNANData.v0.yPos = fullTriangle0[0].posY;
		triangleNANData.v0.zPos = 0.5f;
		triangleNANData.v0.wPos = 1.0f;
		triangleNANData.v1.xPos = fullTriangle0[1].posX;
		triangleNANData.v1.yPos = NAN;
		triangleNANData.v1.zPos = -0.5f;
		triangleNANData.v1.wPos = 1.0f;
		triangleNANData.v2.xPos = fullTriangle0[2].posX;
		triangleNANData.v2.yPos = fullTriangle0[2].posY;
		triangleNANData.v2.zPos = 0.5f;
		triangleNANData.v2.wPos = 1.0f;

		UntransformViewport(triangleNANData);

		successResult &= runTriSetupTest(triangleNANData, triSetup_NAN_INF_Cull);
	}

	// Test a case of a triangle with one of its vertices having an INF value:
	{
		triSetupInput triangleINFData = {0};
		triangleINFData.v0.xPos = fullTriangle0[0].posX;
		triangleINFData.v0.yPos = fullTriangle0[0].posY;
		triangleINFData.v0.zPos = 0.5f;
		triangleINFData.v0.wPos = 1.0f;
		triangleINFData.v1.xPos = fullTriangle0[1].posX;
		triangleINFData.v1.yPos = fullTriangle0[1].posY;
		triangleINFData.v1.zPos = -INFINITY;
		triangleINFData.v1.wPos = 1.0f;
		triangleINFData.v2.xPos = fullTriangle0[2].posX;
		triangleINFData.v2.yPos = fullTriangle0[2].posY;
		triangleINFData.v2.zPos = 0.5f;
		triangleINFData.v2.wPos = 1.0f;

		UntransformViewport(triangleINFData);

		successResult &= runTriSetupTest(triangleINFData, triSetup_NAN_INF_Cull);
	}

	// Test a case where the snapped coords round to a zero-area triangle, but where the input clipspace coords are very slightly not equal
	{
		triSetupInput degenerateRoundingTriangleDataABC = {0};
		degenerateRoundingTriangleDataABC.v0.xPos = degenTriangleZeroArea[0].posX + (1.0f / (128*256) );
		degenerateRoundingTriangleDataABC.v0.yPos = degenTriangleZeroArea[0].posY + (1.0f / (128*256) );
		degenerateRoundingTriangleDataABC.v0.zPos = 0.5f;
		degenerateRoundingTriangleDataABC.v0.wPos = 1.0f;
		degenerateRoundingTriangleDataABC.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		degenerateRoundingTriangleDataABC.v1.xPos = degenTriangleZeroArea[1].posX + (2.0f / (128*256) );
		degenerateRoundingTriangleDataABC.v1.yPos = degenTriangleZeroArea[1].posY + (2.0f / (128*256) );
		degenerateRoundingTriangleDataABC.v1.zPos = degenerateRoundingTriangleDataABC.v0.zPos;
		degenerateRoundingTriangleDataABC.v1.wPos = degenerateRoundingTriangleDataABC.v0.wPos;
		degenerateRoundingTriangleDataABC.v1.rgba = degenerateRoundingTriangleDataABC.v0.rgba;
		degenerateRoundingTriangleDataABC.v2.xPos = degenTriangleZeroArea[2].posX + (1.0f / (128*256) );
		degenerateRoundingTriangleDataABC.v2.yPos = degenTriangleZeroArea[2].posY + (2.0f / (128*256) );
		degenerateRoundingTriangleDataABC.v2.zPos = degenerateRoundingTriangleDataABC.v0.zPos;
		degenerateRoundingTriangleDataABC.v2.wPos = degenerateRoundingTriangleDataABC.v0.wPos;
		degenerateRoundingTriangleDataABC.v2.rgba = degenerateRoundingTriangleDataABC.v0.rgba;

		UntransformViewport(degenerateRoundingTriangleDataABC);

		successResult &= runTriSetupTest(degenerateRoundingTriangleDataABC, triSetup_DuplicateVertexCull);
	}

	// Test a case of backface culling:
	{
		triSetupInput triangleBackfacingData = {0};
		triangleBackfacingData.v0.xPos = fullTriangle0[0].posX;
		triangleBackfacingData.v0.yPos = fullTriangle0[0].posY;
		triangleBackfacingData.v0.zPos = 0.5f;
		triangleBackfacingData.v0.wPos = 1.0f;
		triangleBackfacingData.v1.xPos = fullTriangle0[1].posX;
		triangleBackfacingData.v1.yPos = fullTriangle0[1].posY;
		triangleBackfacingData.v1.zPos = 0.5f;
		triangleBackfacingData.v1.wPos = 1.0f;
		triangleBackfacingData.v2.xPos = fullTriangle0[2].posX;
		triangleBackfacingData.v2.yPos = fullTriangle0[2].posY;
		triangleBackfacingData.v2.zPos = 0.5f;
		triangleBackfacingData.v2.wPos = 1.0f;

		UntransformViewport(triangleBackfacingData);

		successResult &= runTriSetupTest(triangleBackfacingData, triSetup_BackfaceCull);
	}

	// Test a case of zero-area culling:
	{
		triSetupInput triangleZeroAreaData = {0};
		triangleZeroAreaData.v0.xPos = smallTriangleZeroPixels[0].posX;
		triangleZeroAreaData.v0.yPos = smallTriangleZeroPixels[0].posY;
		triangleZeroAreaData.v0.zPos = 0.5f;
		triangleZeroAreaData.v0.wPos = 1.0f;
		triangleZeroAreaData.v1.xPos = smallTriangleZeroPixels[1].posX;
		triangleZeroAreaData.v1.yPos = smallTriangleZeroPixels[1].posY;
		triangleZeroAreaData.v1.zPos = 0.5f;
		triangleZeroAreaData.v1.wPos = 1.0f;
		triangleZeroAreaData.v2.xPos = smallTriangleZeroPixels[2].posX;
		triangleZeroAreaData.v2.yPos = smallTriangleZeroPixels[2].posY;
		triangleZeroAreaData.v2.zPos = 0.5f;
		triangleZeroAreaData.v2.wPos = 1.0f;

		UntransformViewport(triangleZeroAreaData);

		successResult &= runTriSetupTest(triangleZeroAreaData, triSetup_ZeroAreaCull);
	}

	// Test another (offset) case of zero-area culling:
	{
		triSetupInput triangleOffsetZeroAreaData = {0};
		triangleOffsetZeroAreaData.v0.xPos = smallOffsetTriangleZeroPixels[0].posX;
		triangleOffsetZeroAreaData.v0.yPos = smallOffsetTriangleZeroPixels[0].posY;
		triangleOffsetZeroAreaData.v0.zPos = 0.5f;
		triangleOffsetZeroAreaData.v0.wPos = 1.0f;
		triangleOffsetZeroAreaData.v1.xPos = smallOffsetTriangleZeroPixels[1].posX;
		triangleOffsetZeroAreaData.v1.yPos = smallOffsetTriangleZeroPixels[1].posY;
		triangleOffsetZeroAreaData.v1.zPos = 0.5f;
		triangleOffsetZeroAreaData.v1.wPos = 1.0f;
		triangleOffsetZeroAreaData.v2.xPos = smallOffsetTriangleZeroPixels[2].posX;
		triangleOffsetZeroAreaData.v2.yPos = smallOffsetTriangleZeroPixels[2].posY;
		triangleOffsetZeroAreaData.v2.zPos = 0.5f;
		triangleOffsetZeroAreaData.v2.wPos = 1.0f;

		UntransformViewport(triangleOffsetZeroAreaData);

		successResult &= runTriSetupTest(triangleOffsetZeroAreaData, triSetup_ZeroAreaCull);
	}

	// Test a case of bounds clipping off the left edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffLeftEdgeData = {0};
		triangleOffLeftEdgeData.v0.xPos = triangleOffLeftEdgeZeroPixels[0].posX;
		triangleOffLeftEdgeData.v0.yPos = triangleOffLeftEdgeZeroPixels[0].posY;
		triangleOffLeftEdgeData.v0.zPos = 0.5f;
		triangleOffLeftEdgeData.v0.wPos = 1.0f;
		triangleOffLeftEdgeData.v1.xPos = triangleOffLeftEdgeZeroPixels[1].posX;
		triangleOffLeftEdgeData.v1.yPos = triangleOffLeftEdgeZeroPixels[1].posY;
		triangleOffLeftEdgeData.v1.zPos = 0.5f;
		triangleOffLeftEdgeData.v1.wPos = 1.0f;
		triangleOffLeftEdgeData.v2.xPos = triangleOffLeftEdgeZeroPixels[2].posX;
		triangleOffLeftEdgeData.v2.yPos = triangleOffLeftEdgeZeroPixels[2].posY;
		triangleOffLeftEdgeData.v2.zPos = 0.5f;
		triangleOffLeftEdgeData.v2.wPos = 1.0f;

		UntransformViewport(triangleOffLeftEdgeData);

		successResult &= runTriSetupTest(triangleOffLeftEdgeData, triSetup_ZeroBounds);
	}

	// Test a case of bounds clipping off the top edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffTopEdgeData = {0};
		triangleOffTopEdgeData.v0.xPos = triangleOffTopEdgeZeroPixels[0].posX;
		triangleOffTopEdgeData.v0.yPos = triangleOffTopEdgeZeroPixels[0].posY;
		triangleOffTopEdgeData.v0.zPos = 0.5f;
		triangleOffTopEdgeData.v0.wPos = 1.0f;
		triangleOffTopEdgeData.v1.xPos = triangleOffTopEdgeZeroPixels[1].posX;
		triangleOffTopEdgeData.v1.yPos = triangleOffTopEdgeZeroPixels[1].posY;
		triangleOffTopEdgeData.v1.zPos = 0.5f;
		triangleOffTopEdgeData.v1.wPos = 1.0f;
		triangleOffTopEdgeData.v2.xPos = triangleOffTopEdgeZeroPixels[2].posX;
		triangleOffTopEdgeData.v2.yPos = triangleOffTopEdgeZeroPixels[2].posY;
		triangleOffTopEdgeData.v2.zPos = 0.5f;
		triangleOffTopEdgeData.v2.wPos = 1.0f;

		UntransformViewport(triangleOffTopEdgeData);

		successResult &= runTriSetupTest(triangleOffTopEdgeData, triSetup_ZeroBounds);
	}

	// Test a case of bounds clipping off the right edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffRightEdgeData = {0};
		triangleOffRightEdgeData.v0.xPos = triangleOffRightEdgeZeroPixels[0].posX;
		triangleOffRightEdgeData.v0.yPos = triangleOffRightEdgeZeroPixels[0].posY;
		triangleOffRightEdgeData.v0.zPos = 0.5f;
		triangleOffRightEdgeData.v0.wPos = 1.0f;
		triangleOffRightEdgeData.v1.xPos = triangleOffRightEdgeZeroPixels[1].posX;
		triangleOffRightEdgeData.v1.yPos = triangleOffRightEdgeZeroPixels[1].posY;
		triangleOffRightEdgeData.v1.zPos = 0.5f;
		triangleOffRightEdgeData.v1.wPos = 1.0f;
		triangleOffRightEdgeData.v2.xPos = triangleOffRightEdgeZeroPixels[2].posX;
		triangleOffRightEdgeData.v2.yPos = triangleOffRightEdgeZeroPixels[2].posY;
		triangleOffRightEdgeData.v2.zPos = 0.5f;
		triangleOffRightEdgeData.v2.wPos = 1.0f;

		UntransformViewport(triangleOffRightEdgeData);

		successResult &= runTriSetupTest(triangleOffRightEdgeData, triSetup_ZeroBounds);
	}

	// Test a case of bounds clipping off the bottom edge of the screen resulting in a 0-pixel bounds:
	{
		triSetupInput triangleOffBottomEdgeData = {0};
		triangleOffBottomEdgeData.v0.xPos = triangleOffBottomEdgeZeroPixels[0].posX;
		triangleOffBottomEdgeData.v0.yPos = triangleOffBottomEdgeZeroPixels[0].posY;
		triangleOffBottomEdgeData.v0.zPos = 0.5f;
		triangleOffBottomEdgeData.v0.wPos = 1.0f;
		triangleOffBottomEdgeData.v1.xPos = triangleOffBottomEdgeZeroPixels[1].posX;
		triangleOffBottomEdgeData.v1.yPos = triangleOffBottomEdgeZeroPixels[1].posY;
		triangleOffBottomEdgeData.v1.zPos = 0.5f;
		triangleOffBottomEdgeData.v1.wPos = 1.0f;
		triangleOffBottomEdgeData.v2.xPos = triangleOffBottomEdgeZeroPixels[2].posX;
		triangleOffBottomEdgeData.v2.yPos = triangleOffBottomEdgeZeroPixels[2].posY;
		triangleOffBottomEdgeData.v2.zPos = 0.5f;
		triangleOffBottomEdgeData.v2.wPos = 1.0f;

		UntransformViewport(triangleOffBottomEdgeData);

		successResult &= runTriSetupTest(triangleOffBottomEdgeData, triSetup_ZeroBounds);
	}

	// Test a case of a triangle with one of its vertices behind the near-clip plane (the rest of the triangle should get clipped on-screen thanks to the new clipper unit):
	{
		triSetupInput triangleNearClipData = {0};
		triangleNearClipData.v0.xPos = fullTriangle0[0].posX;
		triangleNearClipData.v0.yPos = fullTriangle0[0].posY;
		triangleNearClipData.v0.zPos = 0.5f;
		triangleNearClipData.v0.wPos = 1.0f;
		triangleNearClipData.v1.xPos = fullTriangle0[1].posX;
		triangleNearClipData.v1.yPos = fullTriangle0[1].posY;
		triangleNearClipData.v1.zPos = -0.5f;
		triangleNearClipData.v1.wPos = 1.0f;
		triangleNearClipData.v2.xPos = fullTriangle0[2].posX;
		triangleNearClipData.v2.yPos = fullTriangle0[2].posY;
		triangleNearClipData.v2.zPos = 0.5f;
		triangleNearClipData.v2.wPos = 1.0f;

		UntransformViewport(triangleNearClipData);

		successResult &= runTriSetupTest(triangleNearClipData, triSetup_MULTI);
	}

	// Test a case of a triangle with one of its vertices past the far-clip plane (the rest of the triangle should get clipped on-screen thanks to the new clipper unit):
	{
		triSetupInput triangleFarClipData = {0};
		triangleFarClipData.v0.xPos = fullTriangle0[0].posX;
		triangleFarClipData.v0.yPos = fullTriangle0[0].posY;
		triangleFarClipData.v0.zPos = 0.5f;
		triangleFarClipData.v0.wPos = 1.0f;
		triangleFarClipData.v1.xPos = fullTriangle0[1].posX;
		triangleFarClipData.v1.yPos = fullTriangle0[1].posY;
		triangleFarClipData.v1.zPos = 1.5f;
		triangleFarClipData.v1.wPos = 1.0f;
		triangleFarClipData.v2.xPos = fullTriangle0[2].posX;
		triangleFarClipData.v2.yPos = fullTriangle0[2].posY;
		triangleFarClipData.v2.zPos = 0.5f;
		triangleFarClipData.v2.wPos = 1.0f;

		UntransformViewport(triangleFarClipData);

		successResult &= runTriSetupTest(triangleFarClipData, triSetup_MULTI);
	}

	// Test a case of a triangle with one of its vertices having a 0 W-value (which would lead to an INF when inverted):
	{
		triSetupInput triangleZeroWData = {0};
		triangleZeroWData.v0.xPos = fullTriangle0[0].posX;
		triangleZeroWData.v0.yPos = fullTriangle0[0].posY;
		triangleZeroWData.v0.zPos = 0.5f;
		triangleZeroWData.v0.wPos = 1.0f;
		triangleZeroWData.v1.xPos = fullTriangle0[1].posX;
		triangleZeroWData.v1.yPos = fullTriangle0[1].posY;
		triangleZeroWData.v1.zPos = 0.5f;
		triangleZeroWData.v1.wPos = 0.0f;
		triangleZeroWData.v2.xPos = fullTriangle0[2].posX;
		triangleZeroWData.v2.yPos = fullTriangle0[2].posY;
		triangleZeroWData.v2.zPos = 0.5f;
		triangleZeroWData.v2.wPos = 1.0f;

		UntransformViewport(triangleZeroWData);

		successResult &= runTriSetupTest(triangleZeroWData, triSetup_MULTI);
	}

	// Test a simple case of a single triangle that is fully visible on-screen:
	{
		triSetupInput fullTriangle0Data = {0};
		fullTriangle0Data.v0.xPos = fullTriangle0[0].posX;
		fullTriangle0Data.v0.yPos = fullTriangle0[0].posY;
		fullTriangle0Data.v0.zPos = 0.5f;
		fullTriangle0Data.v0.wPos = 1.0f;
		fullTriangle0Data.v0.xTex = 1.0f / 15.0f;
		fullTriangle0Data.v0.yTex = 2.0f / 15.0f;
		fullTriangle0Data.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		fullTriangle0Data.v1.xPos = fullTriangle0[2].posX;
		fullTriangle0Data.v1.yPos = fullTriangle0[2].posY;
		fullTriangle0Data.v1.zPos = 0.5f;
		fullTriangle0Data.v1.wPos = 1.0f;
		fullTriangle0Data.v1.xTex = 3.0f / 15.0f;
		fullTriangle0Data.v1.yTex = 4.0f / 15.0f;
		fullTriangle0Data.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
		fullTriangle0Data.v2.xPos = fullTriangle0[1].posX;
		fullTriangle0Data.v2.yPos = fullTriangle0[1].posY;
		fullTriangle0Data.v2.zPos = 0.5f;
		fullTriangle0Data.v2.wPos = 1.0f;
		fullTriangle0Data.v2.xTex = -5.0f / 15.0f;
		fullTriangle0Data.v2.yTex = -6.0f / 15.0f;
		fullTriangle0Data.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };

		UntransformViewport(fullTriangle0Data);

		successResult &= runTriSetupTest(fullTriangle0Data, triSetup_OK);
	}

	// Test a simple case of a single triangle that is fully visible on-screen with varying Z/W coordinates:
	{
		triSetupInput fullTriangleVaryingZW0Data = {0};
		fullTriangleVaryingZW0Data.v0.xPos = fullTriangle0[0].posX;
		fullTriangleVaryingZW0Data.v0.yPos = fullTriangle0[0].posY;
		fullTriangleVaryingZW0Data.v0.zPos = 0.35f;
		fullTriangleVaryingZW0Data.v0.wPos = 0.75f;
		fullTriangleVaryingZW0Data.v0.xTex = 1.0f / 15.0f;
		fullTriangleVaryingZW0Data.v0.yTex = 2.0f / 15.0f;
		fullTriangleVaryingZW0Data.v0.rgba = { 0.98f, 0.0f, 0.0f, 0.9f };
		fullTriangleVaryingZW0Data.v1.xPos = fullTriangle0[2].posX;
		fullTriangleVaryingZW0Data.v1.yPos = fullTriangle0[2].posY;
		fullTriangleVaryingZW0Data.v1.zPos = 0.55f;
		fullTriangleVaryingZW0Data.v1.wPos = 1.66666666666f;
		fullTriangleVaryingZW0Data.v1.xTex = 3.0f / 15.0f;
		fullTriangleVaryingZW0Data.v1.yTex = 4.0f / 15.0f;
		fullTriangleVaryingZW0Data.v1.rgba = { 0.0f, 0.89f, 0.0f, 0.8f };
		fullTriangleVaryingZW0Data.v2.xPos = fullTriangle0[1].posX;
		fullTriangleVaryingZW0Data.v2.yPos = fullTriangle0[1].posY;
		fullTriangleVaryingZW0Data.v2.zPos = 0.8f;
		fullTriangleVaryingZW0Data.v2.wPos = 1.41f;
		fullTriangleVaryingZW0Data.v2.xTex = -5.0f / 15.0f;
		fullTriangleVaryingZW0Data.v2.yTex = -6.0f / 15.0f;
		fullTriangleVaryingZW0Data.v2.rgba = { 0.0f, 0.0f, 0.79f, 0.7f };

		UntransformViewport(fullTriangleVaryingZW0Data);

		successResult &= runTriSetupTest(fullTriangleVaryingZW0Data, triSetup_OK);
	}

	// Test a case where all three vertices are off the screen but the resulting polygon fills the screenspace
	{
		triSetupInput singleTriangleFillScreenData = {0};
		singleTriangleFillScreenData.v0.xPos = triangleOffScreenFill[0].posX;
		singleTriangleFillScreenData.v0.yPos = triangleOffScreenFill[0].posY;
		singleTriangleFillScreenData.v0.zPos = 0.5f;
		singleTriangleFillScreenData.v0.wPos = 1.0f;
		singleTriangleFillScreenData.v0.xTex = 1.0f / 15.0f;
		singleTriangleFillScreenData.v0.yTex = 2.0f / 15.0f;
		singleTriangleFillScreenData.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		singleTriangleFillScreenData.v1.xPos = triangleOffScreenFill[2].posX;
		singleTriangleFillScreenData.v1.yPos = triangleOffScreenFill[2].posY;
		singleTriangleFillScreenData.v1.zPos = 0.5f;
		singleTriangleFillScreenData.v1.wPos = 1.0f;
		singleTriangleFillScreenData.v1.xTex = 3.0f / 15.0f;
		singleTriangleFillScreenData.v1.yTex = 4.0f / 15.0f;
		singleTriangleFillScreenData.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
		singleTriangleFillScreenData.v2.xPos = triangleOffScreenFill[1].posX;
		singleTriangleFillScreenData.v2.yPos = triangleOffScreenFill[1].posY;
		singleTriangleFillScreenData.v2.zPos = 0.5f;
		singleTriangleFillScreenData.v2.wPos = 1.0f;
		singleTriangleFillScreenData.v2.xTex = -5.0f / 15.0f;
		singleTriangleFillScreenData.v2.yTex = -6.0f / 15.0f;
		singleTriangleFillScreenData.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };

		UntransformViewport(singleTriangleFillScreenData);

		successResult &= runTriSetupTest(singleTriangleFillScreenData, triSetup_OK);
	}

	// Test a case where three of the vertices occupy three cornerpoints of the screen
	{
		triSetupInput triangleMatchesScreenCornersData = {0};
		triangleMatchesScreenCornersData.v0.xPos = triangleBottomCornerScreen[0].posX;
		triangleMatchesScreenCornersData.v0.yPos = triangleBottomCornerScreen[0].posY;
		triangleMatchesScreenCornersData.v0.zPos = 0.5f;
		triangleMatchesScreenCornersData.v0.wPos = 1.0f;
		triangleMatchesScreenCornersData.v0.xTex = 1.0f / 15.0f;
		triangleMatchesScreenCornersData.v0.yTex = 2.0f / 15.0f;
		triangleMatchesScreenCornersData.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		triangleMatchesScreenCornersData.v1.xPos = triangleBottomCornerScreen[2].posX;
		triangleMatchesScreenCornersData.v1.yPos = triangleBottomCornerScreen[2].posY;
		triangleMatchesScreenCornersData.v1.zPos = 0.5f;
		triangleMatchesScreenCornersData.v1.wPos = 1.0f;
		triangleMatchesScreenCornersData.v1.xTex = 3.0f / 15.0f;
		triangleMatchesScreenCornersData.v1.yTex = 4.0f / 15.0f;
		triangleMatchesScreenCornersData.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
		triangleMatchesScreenCornersData.v2.xPos = triangleBottomCornerScreen[1].posX;
		triangleMatchesScreenCornersData.v2.yPos = triangleBottomCornerScreen[1].posY;
		triangleMatchesScreenCornersData.v2.zPos = 0.5f;
		triangleMatchesScreenCornersData.v2.wPos = 1.0f;
		triangleMatchesScreenCornersData.v2.xTex = -5.0f / 15.0f;
		triangleMatchesScreenCornersData.v2.yTex = -6.0f / 15.0f;
		triangleMatchesScreenCornersData.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };

		UntransformViewport(triangleMatchesScreenCornersData);

		successResult &= runTriSetupTest(triangleMatchesScreenCornersData, triSetup_OK);
	}

	// Test a case where one of the vertices has a zero Z-value
	{
		triSetupInput triangleHasZeroZData = {0};
		triangleHasZeroZData.v0.xPos = triangleBottomCornerScreen[0].posX;
		triangleHasZeroZData.v0.yPos = triangleBottomCornerScreen[0].posY;
		triangleHasZeroZData.v0.zPos = 0.5f;
		triangleHasZeroZData.v0.wPos = 1.0f;
		triangleHasZeroZData.v0.xTex = 1.0f / 15.0f;
		triangleHasZeroZData.v0.yTex = 2.0f / 15.0f;
		triangleHasZeroZData.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
		triangleHasZeroZData.v1.xPos = triangleBottomCornerScreen[2].posX;
		triangleHasZeroZData.v1.yPos = triangleBottomCornerScreen[2].posY;
		triangleHasZeroZData.v1.zPos = 0.0f;
		triangleHasZeroZData.v1.wPos = 1.0f;
		triangleHasZeroZData.v1.xTex = 3.0f / 15.0f;
		triangleHasZeroZData.v1.yTex = 4.0f / 15.0f;
		triangleHasZeroZData.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
		triangleHasZeroZData.v2.xPos = triangleBottomCornerScreen[1].posX;
		triangleHasZeroZData.v2.yPos = triangleBottomCornerScreen[1].posY;
		triangleHasZeroZData.v2.zPos = 0.5f;
		triangleHasZeroZData.v2.wPos = 1.0f;
		triangleHasZeroZData.v2.xTex = -5.0f / 15.0f;
		triangleHasZeroZData.v2.yTex = -6.0f / 15.0f;
		triangleHasZeroZData.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };

		UntransformViewport(triangleHasZeroZData);

		successResult &= runTriSetupTest(triangleHasZeroZData, triSetup_OK);
	}

	srand(3); // Start with the same random seed every time

	// Try it with 1024 * 16 random triangles with vertex positions between -16k and +16k
	for (unsigned x = 0; x < 1024 * 16; ++x)
	{
		triSetupInput randomTriangleData = {0};
		randomTriangleData.v0.xPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v0.yPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v0.zPos = frand() * 4.0f; // It is okay if Z or W go to exactly 0.0f. Our triangle setup won't produce any INF's or NaN's because of that.
		randomTriangleData.v0.wPos = frand() * 4.0f;
		randomTriangleData.v0.xTex = 1.0f / 15.0f;
		randomTriangleData.v0.yTex = 2.0f / 15.0f;
		randomTriangleData.v0.rgba = { frand(), frand(), frand(), 1.0f };
		randomTriangleData.v1.xPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v1.yPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v1.zPos = frand() * 4.0f;
		randomTriangleData.v1.wPos = frand() * 4.0f;
		randomTriangleData.v1.xTex = 3.0f / 15.0f;
		randomTriangleData.v1.yTex = 4.0f / 15.0f;
		randomTriangleData.v1.rgba = { frand(), frand(), frand(), 1.0f };
		randomTriangleData.v2.xPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v2.yPos = rand() - (RAND_MAX / 2) + frand();
		randomTriangleData.v2.zPos = frand() * 4.0f;
		randomTriangleData.v2.wPos = frand() * 4.0f;
		randomTriangleData.v2.xTex = -5.0f / 15.0f;
		randomTriangleData.v2.yTex = -6.0f / 15.0f;
		randomTriangleData.v2.rgba = { frand(), frand(), frand(), 1.0f };

		UntransformViewport(randomTriangleData);

		/*if (x == 4909)
			enableDebugOutput = true;
		else
			enableDebugOutput = false;*/

		successResult &= runTriSetupTestRand(randomTriangleData);
	}

	return successResult ? S_OK : E_FAIL;
}
