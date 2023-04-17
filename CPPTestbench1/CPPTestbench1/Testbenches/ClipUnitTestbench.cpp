#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "PixelPipelineShared.h"
#include "ShaderCoreALUCommon.h"
#include <vector>
#include <functional>

static const float GuardBandXScale = 16.0f;
static const float GuardBandYScale = 32.0f;
static const float W_CLIP_EPSILON = 1.0f / 8388608.0f; // This needs to be slightly larger than zero
static const float VIEWPORT_HALF_WIDTH = 640.0f / 2.0f;
static const float VIEWPORT_HALF_HEIGHT = 480.0f / 2.0f;
static D3DXMATRIXA16 projMatrix = {};

enum clipper_state_t : uint8_t
{
	idleState, // 0
	clip_computeClipMask, // 1
	clip_computeClipDistance0, // Issue first add/sub (insideW +/- insideAxis) and (outsideW +/- outsideAxis) // 2
	clip_computeClipDistance1, // Issue second add/sub (insideW +/- insideAxis) and (outsideW +/- outsideAxis) // 3
	clip_computeClipDistance2, // Wait for first issue to complete // 4
	clip_computeClipDistance3, // Wait for first issue to complete // 5
	clip_computeClipDistance4, // Wait for first issue to complete // 6
	clip_computeClipDistance5, // Issue next first stage sub (insideWAxis - outsideWAxis) // 7
	clip_computeClipDistance6, // Issue next second stage sub (insideWAxis - outsideWAxis) // 8
	clip_computeClipDistance7, // Wait for next issue to complete // 9
	clip_computeClipDistance8, // Wait for next issue to complete // 10
	clip_computeClipDistance9, // Wait for next issue to complete // 11
	clip_computeClipDistance10, // Issue first reciprocal (1.0 / (insideWAxis - outsideWAxis) ) // 12
	clip_computeClipDistance11, // Issue second reciprocal (1.0 / (insideWAxis - outsideWAxis) ) // 13
	clip_computeClipDistance12, // Wait for reciprocals to complete // 14
	clip_computeClipDistance13, // Wait for reciprocals to complete // 15
	clip_computeClipDistance14,	// Wait for reciprocals to complete // 16
	clip_computeClipDistance15,	// Wait for reciprocals to complete // 17
	clip_computeClipDistance16,	// Wait for reciprocals to complete // 18
	clip_computeClipDistance17,	// Wait for reciprocals to complete // 19
	clip_computeClipDistance18,	// Wait for reciprocals to complete // 20
	clip_computeClipDistance19,	// Wait for reciprocals to complete // 21
	clip_computeClipDistance20,	// Wait for reciprocals to complete // 22
	clip_computeClipDistance21,	// Wait for reciprocals to complete // 23
	clip_computeClipDistance22,	// Wait for reciprocals to complete // 24
	clip_computeClipDistance23,	// Wait for reciprocals to complete // 25
	clip_computeClipDistance24,	// Wait for reciprocals to complete // 26
	clip_computeClipDistance25, // Use first reciprocal result to issue the first multiply (insideWAxis / (insideWAxis - outsideWAxis) ) // 27
	clip_computeClipDistance26, // Use second reciprocal result to issue the second multiply (insideWAxis / (insideWAxis - outsideWAxis) ) // 28
	clip_computeClipDistance27, // Wait for multiplies to complete // 29
	clip_computeClipDistance28, // Wait for multiplies to complete // 30
	clip_computeClipDistance29,	// Wait for multiplies to complete // 31
	clip_computeClipDistance30,	// Wait for multiplies to complete // 32
	clip_computeClipDistance31, // Store first clip distance, calc invClipDistance // 33
	clip_computeClipDistance32, // Store second clip distance, calc invClipDistance // 34
	clip_computeClipDistance33, // Wait for subtracts to complete // 35
	clip_computeClipDistance34, // Wait for subtracts to complete // 36
	clip_computeClipDistance35, // Wait for subtracts to complete // 37
	clip_computeClipDistance36, // Store first invClipDistance // 38
	clip_computeClipDistance37, // Store second invClipDistance // 39
	clip_clipVertInPlace0, // 40
	clip_clipVertInPlace1, // 41
	clip_clipVertInPlace2, // 42
	clip_clipVertInPlace3, // 43
	clip_clipVertInPlace4, // 44
	clip_clipVertInPlace5, // 45
	clip_clipVertInPlace6, // 46
	clip_clipVertInPlace7, // 47
	clip_clipVertInPlace8, // 48
	clip_clipVertInPlace9, // 49
	clip_clipVertInPlace10, // 50
	clip_clipVertInPlace11, // 51
	clip_clipVertInPlace12, // 52
	clip_clipVertInPlace13, // 53
	clip_clipVertInPlace14, // 54
	clip_clipVertInPlace15, // 55
	clip_clipVertInPlace16, // 56
	clip_clipVertInPlace17, // 57
	clip_clipVertInPlace18, // 58
	clip_clipVertInPlace19, // 59
	clip_clipVertInPlace20, // 60
	clip_clipVertInPlace21, // 61
	clip_clipVertInPlace22, // 62
	clip_clipVertInPlace23, // 63
	clip_clipVertInPlace24, // 64
	clip_clipVertInPlace25, // 65
	clip_clipVertInPlace26, // 66
	clip_clipVertInPlace27, // 67
	clip_clipVertInPlace28, // 68
	clip_clipVertInPlace29, // 69
	clip_clipVertInPlace30, // 70
	clip_reconstructTriangles, // 71
	clip_recomputeClipOutcodes, // 72
	clip_finishOrNextPlane, // 73
	clip_sendToNextStage, // 74
	clip_popNextChildTriangle0, // 75
	clip_popNextChildTriangle1 // 76
};

static const char* const clipperStateStrings[] =
{
	"idleState", // 0
	"clip_computeClipMask", // 1
	"clip_computeClipDistance0", // Issue first add/sub (insideW +/- insideAxis) and (outsideW +/- outsideAxis) // 2
	"clip_computeClipDistance1", // Issue second add/sub (insideW +/- insideAxis) and (outsideW +/- outsideAxis) // 3
	"clip_computeClipDistance2", // Wait for first issue to complete // 4
	"clip_computeClipDistance3", // Wait for first issue to complete // 5
	"clip_computeClipDistance4", // Wait for first issue to complete // 6
	"clip_computeClipDistance5", // Issue next first stage sub (insideWAxis - outsideWAxis) // 7
	"clip_computeClipDistance6", // Issue next second stage sub (insideWAxis - outsideWAxis) // 8
	"clip_computeClipDistance7", // Wait for next issue to complete // 9
	"clip_computeClipDistance8", // Wait for next issue to complete // 10
	"clip_computeClipDistance9", // Wait for next issue to complete // 11
	"clip_computeClipDistance10", // Issue first reciprocal (1.0 / (insideWAxis - outsideWAxis) ) // 12
	"clip_computeClipDistance11", // Issue second reciprocal (1.0 / (insideWAxis - outsideWAxis) ) // 13
	"clip_computeClipDistance12", // Wait for reciprocals to complete // 14
	"clip_computeClipDistance13", // Wait for reciprocals to complete // 15
	"clip_computeClipDistance14",	// Wait for reciprocals to complete // 16
	"clip_computeClipDistance15",	// Wait for reciprocals to complete // 17
	"clip_computeClipDistance16",	// Wait for reciprocals to complete // 18
	"clip_computeClipDistance17",	// Wait for reciprocals to complete // 19
	"clip_computeClipDistance18",	// Wait for reciprocals to complete // 20
	"clip_computeClipDistance19",	// Wait for reciprocals to complete // 21
	"clip_computeClipDistance20",	// Wait for reciprocals to complete // 22
	"clip_computeClipDistance21",	// Wait for reciprocals to complete // 23
	"clip_computeClipDistance22",	// Wait for reciprocals to complete // 24
	"clip_computeClipDistance23",	// Wait for reciprocals to complete // 25
	"clip_computeClipDistance24",	// Wait for reciprocals to complete // 26
	"clip_computeClipDistance25", // Use first reciprocal result to issue the first multiply (insideWAxis / (insideWAxis - outsideWAxis) ) // 27
	"clip_computeClipDistance26", // Use second reciprocal result to issue the second multiply (insideWAxis / (insideWAxis - outsideWAxis) ) // 28
	"clip_computeClipDistance27", // Wait for multiplies to complete // 29
	"clip_computeClipDistance28", // Wait for multiplies to complete // 30
	"clip_computeClipDistance29",	// Wait for multiplies to complete // 31
	"clip_computeClipDistance30",	// Wait for multiplies to complete // 32
	"clip_computeClipDistance31", // Store first clip distance, calc invClipDistance // 33
	"clip_computeClipDistance32", // Store second clip distance, calc invClipDistance // 34
	"clip_computeClipDistance33", // Wait for subtracts to complete // 35
	"clip_computeClipDistance34", // Wait for subtracts to complete // 36
	"clip_computeClipDistance35", // Wait for subtracts to complete // 37
	"clip_computeClipDistance36", // Store first invClipDistance // 38
	"clip_computeClipDistance37", // Store second invClipDistance // 39
	"clip_clipVertInPlace0", // 40
	"clip_clipVertInPlace1", // 41
	"clip_clipVertInPlace2", // 42
	"clip_clipVertInPlace3", // 43
	"clip_clipVertInPlace4", // 44
	"clip_clipVertInPlace5", // 45
	"clip_clipVertInPlace6", // 46
	"clip_clipVertInPlace7", // 47
	"clip_clipVertInPlace8", // 48
	"clip_clipVertInPlace9", // 49
	"clip_clipVertInPlace10", // 50
	"clip_clipVertInPlace11", // 51
	"clip_clipVertInPlace12", // 52
	"clip_clipVertInPlace13", // 53
	"clip_clipVertInPlace14", // 54
	"clip_clipVertInPlace15", // 55
	"clip_clipVertInPlace16", // 56
	"clip_clipVertInPlace17", // 57
	"clip_clipVertInPlace18", // 58
	"clip_clipVertInPlace19", // 59
	"clip_clipVertInPlace20", // 60
	"clip_clipVertInPlace21", // 61
	"clip_clipVertInPlace22", // 62
	"clip_clipVertInPlace23", // 63
	"clip_clipVertInPlace24", // 64
	"clip_clipVertInPlace25", // 65
	"clip_clipVertInPlace26", // 66
	"clip_clipVertInPlace27", // 67
	"clip_clipVertInPlace28", // 68
	"clip_clipVertInPlace29", // 69
	"clip_clipVertInPlace30", // 70
	"clip_reconstructTriangles", // 71
	"clip_recomputeClipOutcodes", // 72
	"clip_finishOrNextPlane", // 73
	"clip_sendToNextStage", // 74
	"clip_popNextChildTriangle0", // 75
	"clip_popNextChildTriangle1" // 76
};

struct triangleClipStatuses
{
	unsigned short clip0;
	unsigned short clip1;
	unsigned short clip2;
};

enum eClipPlane : unsigned short
{
	CP_W0 = 0, // 0x0001
	CP_Front, // 0x0002
	CP_Back, // 0x0004
	CP_Right, // 0x0008
	CP_Left, // 0x0010
	CP_Top, // 0x0020
	CP_Bottom, // 0x0040
	CP_GBRight, // 0x0080
	CP_GBLeft, // 0x0100
	CP_GBTop, // 0x0200
	CP_GBBottom, // 0x0400
	CP_ClipDone // 0x0800
};

static const char* const clipPlaneStrings[] =
{
	"CP_W0",
	"CP_Front",
	"CP_Back",
	"CP_Right",
	"CP_Left",
	"CP_Top",
	"CP_Bottom",
	"CP_GBRight",
	"CP_GBLeft",
	"CP_GBTop",
	"CP_GBBottom",
	"CP_ClipDone"
};

static D3DXPLANE ClipPlanes[11];

static const float GetClipDistanceAxisNegative(const float insideVertAxis, const float insideVertW, const float outsideVertAxis, const float outsideVertW, const float scaleW = 1.0f)
{
	const float insideScaledW = insideVertW * scaleW;
	const float outsideScaledW = outsideVertW * scaleW;
	const float insideWZ = insideScaledW + insideVertAxis;
	const float outsideWZ = outsideScaledW + outsideVertAxis;
	const float intersectionPoint = insideWZ / (insideWZ - outsideWZ);
	return intersectionPoint;
}

static const float GetClipDistanceAxisPositive(const float insideVertAxis, const float insideVertW, const float outsideVertAxis, const float outsideVertW, const float scaleW = 1.0f)
{
	const float insideScaledW = insideVertW * scaleW;
	const float outsideScaledW = outsideVertW * scaleW;
	const float insideWZ = insideScaledW - insideVertAxis;
	const float outsideWZ = outsideScaledW - outsideVertAxis;
	const float intersectionPoint = insideWZ / (insideWZ - outsideWZ);
	return intersectionPoint;
}

static const float GetClipDistanceW0(const float insideVertW, const float outsideVertW)
{
	return (insideVertW - W_CLIP_EPSILON) / (insideVertW - outsideVertW);
}

static const float GetClipDistanceZNear(const float insideVertZ, const float outsideVertZ)
{
	const float intersectionPointZ0 = insideVertZ / (insideVertZ - outsideVertZ);
	return intersectionPointZ0;
}

static const float GetClipDistanceForPlane(const vertInputClipSpace& insideVert, const vertInputClipSpace& outsideVert, const eClipPlane clipPlane)
{
	switch (clipPlane)
	{
	default:
		__debugbreak(); // Should never be here!
		return 0.0f;
	case CP_Left:
	{
		const float insideDist = D3DXPlaneDot(&ClipPlanes[CP_Left], (const D3DXVECTOR4* const)&insideVert.xPos);
		const float outsideDist = D3DXPlaneDot(&ClipPlanes[CP_Left], (const D3DXVECTOR4* const)&outsideVert.xPos);
		const float planeDist = insideDist / (insideDist - outsideDist);
		const float funcDist = GetClipDistanceAxisNegative(insideVert.xPos, insideVert.wPos, outsideVert.xPos, outsideVert.wPos, 1.0f);
		if (planeDist != funcDist) { __debugbreak(); }
		return planeDist;
	}
	case CP_Right:
	{
		const float insideDist = D3DXPlaneDot(&ClipPlanes[CP_Right], (const D3DXVECTOR4* const)&insideVert.xPos);
		const float outsideDist = D3DXPlaneDot(&ClipPlanes[CP_Right], (const D3DXVECTOR4* const)&outsideVert.xPos);
		const float planeDist = insideDist / (insideDist - outsideDist);
		const float funcDist = GetClipDistanceAxisPositive(insideVert.xPos, insideVert.wPos, outsideVert.xPos, outsideVert.wPos, 1.0f);
		if (planeDist != funcDist) { __debugbreak(); }
		return planeDist;
	}
	case CP_Top:
	{
		const float insideDist = D3DXPlaneDot(&ClipPlanes[CP_Top], (const D3DXVECTOR4* const)&insideVert.xPos);
		const float outsideDist = D3DXPlaneDot(&ClipPlanes[CP_Top], (const D3DXVECTOR4* const)&outsideVert.xPos);
		const float planeDist = insideDist / (insideDist - outsideDist);
		const float funcDist = GetClipDistanceAxisPositive(insideVert.yPos, insideVert.wPos, outsideVert.yPos, outsideVert.wPos, 1.0f);
		if (planeDist != funcDist) { __debugbreak(); }
		return planeDist;
	}
	case CP_Bottom:
	{
		const float insideDist = D3DXPlaneDot(&ClipPlanes[CP_Bottom], (const D3DXVECTOR4* const)&insideVert.xPos);
		const float outsideDist = D3DXPlaneDot(&ClipPlanes[CP_Bottom], (const D3DXVECTOR4* const)&outsideVert.xPos);
		const float planeDist = insideDist / (insideDist - outsideDist);
		const float funcDist = GetClipDistanceAxisNegative(insideVert.yPos, insideVert.wPos, outsideVert.yPos, outsideVert.wPos, 1.0f);
		if (planeDist != funcDist) { __debugbreak(); }
		return planeDist;
	}
	case CP_Front:
	{
		const float insideDist = D3DXPlaneDot(&ClipPlanes[CP_Front], (const D3DXVECTOR4* const)&insideVert.xPos);
		const float outsideDist = D3DXPlaneDot(&ClipPlanes[CP_Front], (const D3DXVECTOR4* const)&outsideVert.xPos);
		const float planeDist = insideDist / (insideDist - outsideDist);
		const float funcDist = GetClipDistanceZNear(insideVert.zPos, outsideVert.zPos);
		if (planeDist != funcDist) { __debugbreak(); }
		return planeDist;
	}
	case CP_Back:
	{
		const float insideDist = D3DXPlaneDot(&ClipPlanes[CP_Back], (const D3DXVECTOR4* const)&insideVert.xPos);
		const float outsideDist = D3DXPlaneDot(&ClipPlanes[CP_Back], (const D3DXVECTOR4* const)&outsideVert.xPos);
		const float planeDist = insideDist / (insideDist - outsideDist);
		const float funcDist = GetClipDistanceAxisPositive(insideVert.zPos, insideVert.wPos, outsideVert.zPos, outsideVert.wPos, 1.0f);
		if (planeDist != funcDist) { __debugbreak(); }
		return planeDist;
	}
	case CP_W0:
	{
		return GetClipDistanceW0(insideVert.wPos, outsideVert.wPos);
	}
	case CP_GBLeft:
	{
		const float insideDist = D3DXPlaneDot(&ClipPlanes[CP_GBLeft], (const D3DXVECTOR4* const)&insideVert.xPos);
		const float outsideDist = D3DXPlaneDot(&ClipPlanes[CP_GBLeft], (const D3DXVECTOR4* const)&outsideVert.xPos);
		const float planeDist = insideDist / (insideDist - outsideDist);
		const float funcDist = GetClipDistanceAxisNegative(insideVert.xPos, insideVert.wPos, outsideVert.xPos, outsideVert.wPos, GuardBandXScale);
		if (planeDist != funcDist) { __debugbreak(); }
		return planeDist;
	}
	case CP_GBRight:
	{
		const float insideDist = D3DXPlaneDot(&ClipPlanes[CP_GBRight], (const D3DXVECTOR4* const)&insideVert.xPos);
		const float outsideDist = D3DXPlaneDot(&ClipPlanes[CP_GBRight], (const D3DXVECTOR4* const)&outsideVert.xPos);
		const float planeDist = insideDist / (insideDist - outsideDist);
		const float funcDist = GetClipDistanceAxisPositive(insideVert.xPos, insideVert.wPos, outsideVert.xPos, outsideVert.wPos, GuardBandXScale);
		if (planeDist != funcDist) { __debugbreak(); }
		return planeDist;
	}
	case CP_GBTop:
	{
		const float insideDist = D3DXPlaneDot(&ClipPlanes[CP_GBTop], (const D3DXVECTOR4* const)&insideVert.xPos);
		const float outsideDist = D3DXPlaneDot(&ClipPlanes[CP_GBTop], (const D3DXVECTOR4* const)&outsideVert.xPos);
		const float planeDist = insideDist / (insideDist - outsideDist);
		const float funcDist = GetClipDistanceAxisPositive(insideVert.yPos, insideVert.wPos, outsideVert.yPos, outsideVert.wPos, GuardBandYScale);
		if (planeDist != funcDist) { __debugbreak(); }
		return planeDist;
	}
	case CP_GBBottom:
	{
		const float insideDist = D3DXPlaneDot(&ClipPlanes[CP_GBBottom], (const D3DXVECTOR4* const)&insideVert.xPos);
		const float outsideDist = D3DXPlaneDot(&ClipPlanes[CP_GBBottom], (const D3DXVECTOR4* const)&outsideVert.xPos);
		const float planeDist = insideDist / (insideDist - outsideDist);
		const float funcDist = GetClipDistanceAxisNegative(insideVert.yPos, insideVert.wPos, outsideVert.yPos, outsideVert.wPos, GuardBandYScale);
		if (planeDist != funcDist) { __debugbreak(); }
		return planeDist;
	}
	}
}

static void ClampToPlane(vertInputClipSpace& outsideVert, const eClipPlane clipPlane)
{
	const float w = outsideVert.wPos;
	const float negW = -w;
	switch (clipPlane)
	{
	default:
		__debugbreak(); // Should never be here!
		return;
	case CP_Left:
		if (outsideVert.xPos < negW)
			outsideVert.xPos = negW;
		return;
	case CP_Right:
		if (outsideVert.xPos > w)
			outsideVert.xPos = w;
		return;
	case CP_Top:
		if (outsideVert.yPos > w)
			outsideVert.yPos = w;
		return;
	case CP_Bottom:
		if (outsideVert.yPos < negW)
			outsideVert.yPos = negW;
		return;
	case CP_Front:
		if (outsideVert.zPos < 0.0f)
			outsideVert.zPos = 0.0f;
		return;
	case CP_Back:
		if (outsideVert.zPos > w)
			outsideVert.zPos = w;
		return;
	case CP_W0:
		if (outsideVert.wPos < W_CLIP_EPSILON)
			outsideVert.wPos = W_CLIP_EPSILON; // Note that this will end up causing a division by zero when we perform the perspective divide later on, but that's okay
		return;
	case CP_GBLeft:
		if (outsideVert.xPos < negW * GuardBandXScale)
			outsideVert.xPos = negW * GuardBandXScale;
		return;
	case CP_GBRight:
		if (outsideVert.xPos > w * GuardBandXScale)
			outsideVert.xPos = w * GuardBandXScale;
		return;
	case CP_GBTop:
		if (outsideVert.yPos > w * GuardBandYScale)
			outsideVert.yPos = w * GuardBandYScale;
		return;
	case CP_GBBottom:
		if (outsideVert.yPos < negW * GuardBandYScale)
			outsideVert.yPos = negW * GuardBandYScale;
		return;
	}
}

static void ClampToAllPreviouslyClippedPlanes(vertInputClipSpace& outsideVert, const unsigned short clippedPlanesBitmap)
{
	if (clippedPlanesBitmap & (1 << CP_W0) )
		ClampToPlane(outsideVert, CP_W0);
	if (clippedPlanesBitmap & (1 << CP_Front) )
		ClampToPlane(outsideVert, CP_Front);
	if (clippedPlanesBitmap & (1 << CP_Back) )
		ClampToPlane(outsideVert, CP_Back);
	// Note that we don't actually need to ever clamp to the Left/Right/Top/Bottom planes since we're clamping to the guard band planes instead:
	if (clippedPlanesBitmap & (1 << CP_GBLeft) )
		ClampToPlane(outsideVert, CP_GBLeft);
	if (clippedPlanesBitmap & (1 << CP_GBRight) )
		ClampToPlane(outsideVert, CP_GBRight);
	if (clippedPlanesBitmap & (1 << CP_GBTop) )
		ClampToPlane(outsideVert, CP_GBTop);
	if (clippedPlanesBitmap & (1 << CP_GBBottom) )
		ClampToPlane(outsideVert, CP_GBBottom);
}

static void LerpAttribute(const float lerpAlpha, const float invLerpAlpha, const float insideAttr, float& outsideAttr)
{
	// Maybe better stability with this method:
	const float lhs = invLerpAlpha * insideAttr;
	const float rhs = lerpAlpha * outsideAttr;
	outsideAttr = lhs + rhs;

	// Classic lerp method:
	//outsideAttr = insideAttr + lerpAlpha * (outsideAttr - insideAttr);
}

static void ClipVertexInPlace(const vertInputClipSpace& insideVert, vertInputClipSpace& outsideVert, const float clipDistance, const unsigned short clippedPlanesBitmap)
{
	const float invIntersection = 1.0f - clipDistance;

	// Clip position:
	LerpAttribute(clipDistance, invIntersection, insideVert.xPos, outsideVert.xPos);
	LerpAttribute(clipDistance, invIntersection, insideVert.yPos, outsideVert.yPos);
	LerpAttribute(clipDistance, invIntersection, insideVert.zPos, outsideVert.zPos);
	LerpAttribute(clipDistance, invIntersection, insideVert.wPos, outsideVert.wPos);

	// Clip vertex color too:
	LerpAttribute(clipDistance, invIntersection, insideVert.rgba.r, outsideVert.rgba.r);
	LerpAttribute(clipDistance, invIntersection, insideVert.rgba.g, outsideVert.rgba.g);
	LerpAttribute(clipDistance, invIntersection, insideVert.rgba.b, outsideVert.rgba.b);
	LerpAttribute(clipDistance, invIntersection, insideVert.rgba.a, outsideVert.rgba.a);

	// Clip texcoords too:
	LerpAttribute(clipDistance, invIntersection, insideVert.xTex, outsideVert.xTex);
	LerpAttribute(clipDistance, invIntersection, insideVert.yTex, outsideVert.yTex);

#ifdef _DEBUG
	if (outsideVert.wPos < 0.0f)
	{
		//__debugbreak();
	}
#endif

	// Make sure that the position-interpolation from clipping didn't put us just sliiiightly outside of one of the clipping planes that we have previously clipped against:
	ClampToAllPreviouslyClippedPlanes(outsideVert, clippedPlanesBitmap);

#ifdef _DEBUG
	if (outsideVert.wPos < 0.0f)
	{
		__debugbreak();
	}
#endif
}

struct clipWorkingTriangle
{
	triSetupInput geomData;
	triangleClipStatuses clipData;
	unsigned short alreadyClippedPlanes;

	static const unsigned short ComputeClipCodeForVertex(vertInputClipSpace vert)
	{
		unsigned short outClipCodes = 0x0000;
		unsigned short planeOutClipCodes = 0x0000;

		/*if (vert.wPos < 0.0f)
		{
			outClipCodes |= (1 << CP_W0);

			vert.xPos *= -1.0f;
			vert.yPos *= -1.0f;
			vert.zPos *= -1.0f;
			//vert.wPos *= -1.0f;
		}*/

		const float w = vert.wPos;
		const float negW = -w;

		const float clipDistanceLeft = D3DXPlaneDot(&ClipPlanes[CP_Left], (const D3DXVECTOR4* const)&vert.xPos);
		const float clipDistanceRight = D3DXPlaneDot(&ClipPlanes[CP_Right], (const D3DXVECTOR4* const)&vert.xPos);
		const float clipDistanceTop = D3DXPlaneDot(&ClipPlanes[CP_Top], (const D3DXVECTOR4* const)&vert.xPos);
		const float clipDistanceBottom = D3DXPlaneDot(&ClipPlanes[CP_Bottom], (const D3DXVECTOR4* const)&vert.xPos);
		const float clipDistanceFront = D3DXPlaneDot(&ClipPlanes[CP_Front], (const D3DXVECTOR4* const)&vert.xPos);
		const float clipDistanceBack = D3DXPlaneDot(&ClipPlanes[CP_Back], (const D3DXVECTOR4* const)&vert.xPos);
		const float clipDistanceGBLeft = D3DXPlaneDot(&ClipPlanes[CP_GBLeft], (const D3DXVECTOR4* const)&vert.xPos);
		const float clipDistanceGBRight = D3DXPlaneDot(&ClipPlanes[CP_GBRight], (const D3DXVECTOR4* const)&vert.xPos);
		const float clipDistanceGBTop = D3DXPlaneDot(&ClipPlanes[CP_GBTop], (const D3DXVECTOR4* const)&vert.xPos);
		const float clipDistanceGBBottom = D3DXPlaneDot(&ClipPlanes[CP_GBBottom], (const D3DXVECTOR4* const)&vert.xPos);

		if (vert.xPos < negW)
			outClipCodes |= (1 << CP_Left);
		if (vert.xPos > w)
			outClipCodes |= (1 << CP_Right);
		if (vert.yPos < negW)
			outClipCodes |= (1 << CP_Bottom);
		if (vert.yPos > w)
			outClipCodes |= (1 << CP_Top);
		if (vert.zPos < 0.0f)
			outClipCodes |= (1 << CP_Front);
		if (vert.zPos > w)
			outClipCodes |= (1 << CP_Back);

		if (vert.xPos < GuardBandXScale * negW)
			outClipCodes |= (1 << CP_GBLeft);
		if (vert.xPos > GuardBandXScale * w)
			outClipCodes |= (1 << CP_GBRight);
		if (vert.yPos < GuardBandYScale * negW)
			outClipCodes |= (1 << CP_GBBottom);
		if (vert.yPos > GuardBandYScale * w)
			outClipCodes |= (1 << CP_GBTop);

		if (clipDistanceLeft < 0.0f)
			planeOutClipCodes |= (1 << CP_Left);
		if (clipDistanceRight < 0.0f)
			planeOutClipCodes |= (1 << CP_Right);
		if (clipDistanceTop < 0.0f)
			planeOutClipCodes |= (1 << CP_Top);
		if (clipDistanceBottom < 0.0f)
			planeOutClipCodes |= (1 << CP_Bottom);
		if (clipDistanceFront < 0.0f)
			planeOutClipCodes |= (1 << CP_Front);
		if (clipDistanceBack < 0.0f)
			planeOutClipCodes |= (1 << CP_Back);
		if (clipDistanceGBLeft < 0.0f)
			planeOutClipCodes |= (1 << CP_GBLeft);
		if (clipDistanceGBRight < 0.0f)
			planeOutClipCodes |= (1 << CP_GBRight);
		if (clipDistanceGBTop < 0.0f)
			planeOutClipCodes |= (1 << CP_GBTop);
		if (clipDistanceGBBottom < 0.0f)
			planeOutClipCodes |= (1 << CP_GBBottom);

		/*if (outClipCodes != planeOutClipCodes)
		{
			__debugbreak();
		}*/

		return outClipCodes;
	}

	void ComputeClipCodes()
	{
		clipData.clip0 = ComputeClipCodeForVertex(geomData.v0);
		clipData.clip1 = ComputeClipCodeForVertex(geomData.v1);
		clipData.clip2 = ComputeClipCodeForVertex(geomData.v2);
	}
};

// This is the order that we actually clip our verts against!
static const eClipPlane orderedClipPlanes[] =
{
	CP_Front,
	CP_Back,
	/*CP_Left,
	CP_Right,
	CP_Bottom,
	CP_Top*/
	CP_GBLeft,
	CP_GBRight,
	CP_GBBottom,
	CP_GBTop,
	CP_W0
};

const bool IsDebugVertDifferent(const vertInputClipSpace& existingVert, std_logic_vector_port<32>& DBG_VPosX, std_logic_vector_port<32>& DBG_VPosY, std_logic_vector_port<32>& DBG_VPosZ, std_logic_vector_port<32>& DBG_VPosW)
{
	const float newX = DBG_VPosX.GetFloat32Val();
	const float newY = DBG_VPosY.GetFloat32Val();
	const float newZ = DBG_VPosZ.GetFloat32Val();
	const float newW = DBG_VPosW.GetFloat32Val();
	return (existingVert.xPos != newX) || (existingVert.yPos != newY) || (existingVert.zPos != newZ) || (existingVert.wPos != newW);
}

void AssignDebugVert(vertInputClipSpace& newDebugVert, std_logic_vector_port<32>& DBG_VPosX, std_logic_vector_port<32>& DBG_VPosY, std_logic_vector_port<32>& DBG_VPosZ, std_logic_vector_port<32>& DBG_VPosW)
{
	const float newX = DBG_VPosX.GetFloat32Val();
	const float newY = DBG_VPosY.GetFloat32Val();
	const float newZ = DBG_VPosZ.GetFloat32Val();
	const float newW = DBG_VPosW.GetFloat32Val();
	newDebugVert.xPos = newX;
	newDebugVert.yPos = newY;
	newDebugVert.zPos = newZ;
	newDebugVert.wPos = newW;
}

// Note that the output triangle list may be longer or shorter than the input triangle list!
static void SimulateHDLClipper(Xsi::Loader& loader, const std::vector<triSetupInput>& inputUnclippedTriangles, std::vector<triSetupInput>& outputClippedTriangles, std_logic_port& clk, 
	std_logic_port& TRISETUP_inNextStageisReady, std_logic_port& IA_inPreviousStageIsValid, std_logic_port& IA_outPreviousStageIsReady, 
	std_logic_vector_port<8>& DBG_CurrentState, std_logic_vector_port<4>& DBG_CurrentClipPlane, std_logic_vector_port<3>& DBG_CurrentClipBitmask, std_logic_vector_port<3>& DBG_ChildTriStackSize, 
	std_logic_vector_port<32>& DBG_ClipDistance0, std_logic_vector_port<32>& DBG_ClipDistance1,
	std_logic_vector_port<32>& DBG_V0PosX, std_logic_vector_port<32>& DBG_V0PosY, std_logic_vector_port<32>& DBG_V0PosZ, std_logic_vector_port<32>& DBG_V0PosW,
	std_logic_vector_port<32>& DBG_V1PosX, std_logic_vector_port<32>& DBG_V1PosY, std_logic_vector_port<32>& DBG_V1PosZ, std_logic_vector_port<32>& DBG_V1PosW,
	std_logic_vector_port<32>& DBG_V2PosX, std_logic_vector_port<32>& DBG_V2PosY, std_logic_vector_port<32>& DBG_V2PosZ, std_logic_vector_port<32>& DBG_V2PosW,
	std_logic_vector_port<11>& DBG_ClipOutcodes0, std_logic_vector_port<11>& DBG_ClipOutcodes1, std_logic_vector_port<11>& DBG_ClipOutcodes2,
	std::function<void()> UpdateFPUs, std::function<void(const triSetupInput& newInput)> SetNewPendingInput, std::function<void(std::vector<triSetupInput>& clippedOutputTris)> UpdateNewOutput)
{
	// Mark our next-stage as always ready to receive new tris
	TRISETUP_inNextStageisReady = true;

	clipper_state_t currentState = (const clipper_state_t)(DBG_CurrentState.GetUint8Val() );
	eClipPlane currentClipPlane = CP_ClipDone;
	unsigned char currentClipBitmask = 0;
	unsigned char currentChildTriStackSize = DBG_ChildTriStackSize.GetUint8Val();
	float clipDistance0 = DBG_ClipDistance0.GetFloat32Val();
	float clipDistance1 = DBG_ClipDistance1.GetFloat32Val();
	vertInputClipSpace dbgV0;
	vertInputClipSpace dbgV1;
	vertInputClipSpace dbgV2;
	AssignDebugVert(dbgV0, DBG_V0PosX, DBG_V0PosY, DBG_V0PosZ, DBG_V0PosW);
	AssignDebugVert(dbgV1, DBG_V1PosX, DBG_V1PosY, DBG_V1PosZ, DBG_V1PosW);
	AssignDebugVert(dbgV2, DBG_V2PosX, DBG_V2PosY, DBG_V2PosZ, DBG_V2PosW);
	eClipPlane clipOutcodes0 = (eClipPlane)0;
	eClipPlane clipOutcodes1 = (eClipPlane)0;
	eClipPlane clipOutcodes2 = (eClipPlane)0;

	const unsigned numInputTris = (const unsigned)inputUnclippedTriangles.size();
	for (unsigned x = 0; x < numInputTris; ++x)
	{
		const triSetupInput& newInputTri = inputUnclippedTriangles[x];
		printf("New triangle %u:\n\t(%f,%f,%f,%f),\n\t(%f,%f,%f,%f),\n\t(%f,%f,%f,%f)\n\n", x,
			newInputTri.v0.xPos, newInputTri.v0.yPos, newInputTri.v0.zPos, newInputTri.v0.wPos,
			newInputTri.v1.xPos, newInputTri.v1.yPos, newInputTri.v1.zPos, newInputTri.v1.wPos,
			newInputTri.v2.xPos, newInputTri.v2.yPos, newInputTri.v2.zPos, newInputTri.v2.wPos);
		currentState = (const clipper_state_t)(DBG_CurrentState.GetUint8Val() );
		if (currentState != idleState)
		{
			__debugbreak(); // We should always start in the idle state!
		}
		SetNewPendingInput(newInputTri);
		do
		{
			scoped_timestep time(loader, clk, 100);
			UpdateFPUs();
			UpdateNewOutput(outputClippedTriangles);
			currentState = (const clipper_state_t)(DBG_CurrentState.GetUint8Val() );
		} while (currentState == idleState && IA_outPreviousStageIsReady.GetBoolVal() != true); // Wait for the clipper core to pick up this new tri...
		IA_inPreviousStageIsValid = false;

		while ( (currentState = (const clipper_state_t)(DBG_CurrentState.GetUint8Val() ) ) != idleState) // Wait for the clipper core to finish with the tri
		{
			printf("Current state = %s (%u)\n", clipperStateStrings[currentState], currentState);
			scoped_timestep time(loader, clk, 100);
			UpdateFPUs();
			UpdateNewOutput(outputClippedTriangles);

			if (DBG_CurrentClipPlane.GetUint8Val() != currentClipPlane)
			{
				currentClipPlane = (const eClipPlane)(DBG_CurrentClipPlane.GetUint8Val() );
				printf("New clip plane: %s (%u)\n", clipPlaneStrings[currentClipPlane], currentClipPlane);
			}

			//if (currentState == clip_recomputeClipOutcodes || currentState == clip_popNextChildTriangle1 || currentState == clip_sendToNextStage || currentState == clip_computeClipMask || currentState == clip_computeClipDistance0)
			{
				if (IsDebugVertDifferent(dbgV0, DBG_V0PosX, DBG_V0PosY, DBG_V0PosZ, DBG_V0PosW) )
				{
					AssignDebugVert(dbgV0, DBG_V0PosX, DBG_V0PosY, DBG_V0PosZ, DBG_V0PosW);
					printf("v0 changed to: (%f,%f,%f,%f)\n", dbgV0.xPos, dbgV0.yPos, dbgV0.zPos, dbgV0.wPos);
				}
				if (IsDebugVertDifferent(dbgV1, DBG_V1PosX, DBG_V1PosY, DBG_V1PosZ, DBG_V1PosW) )
				{
					AssignDebugVert(dbgV1, DBG_V1PosX, DBG_V1PosY, DBG_V1PosZ, DBG_V1PosW);
					printf("v1 changed to: (%f,%f,%f,%f)\n", dbgV1.xPos, dbgV1.yPos, dbgV1.zPos, dbgV1.wPos);
				}
				if (IsDebugVertDifferent(dbgV2, DBG_V2PosX, DBG_V2PosY, DBG_V2PosZ, DBG_V2PosW) )
				{
					AssignDebugVert(dbgV2, DBG_V2PosX, DBG_V2PosY, DBG_V2PosZ, DBG_V2PosW);
					printf("v2 changed to: (%f,%f,%f,%f)\n", dbgV2.xPos, dbgV2.yPos, dbgV2.zPos, dbgV2.wPos);
				}
			}
			
			if (DBG_CurrentClipBitmask.GetUint8Val() != currentClipBitmask)
			{
				currentClipBitmask = DBG_CurrentClipBitmask.GetUint8Val();
				printf("New clip bitmask: %u\n", currentClipBitmask);
			}

			if (DBG_ClipOutcodes0.GetUint16Val() != clipOutcodes0)
			{
				clipOutcodes0 = (const eClipPlane)DBG_ClipOutcodes0.GetUint16Val();
				printf("New clipOutcodes0: 0x%04X\n", clipOutcodes0);
			}
			if (DBG_ClipOutcodes1.GetUint16Val() != clipOutcodes1)
			{
				clipOutcodes1 = (const eClipPlane)DBG_ClipOutcodes1.GetUint16Val();
				printf("New clipOutcodes1: 0x%04X\n", clipOutcodes1);
			}
			if (DBG_ClipOutcodes2.GetUint16Val() != clipOutcodes2)
			{
				clipOutcodes2 = (const eClipPlane)DBG_ClipOutcodes2.GetUint16Val();
				printf("New clipOutcodes2: 0x%04X\n", clipOutcodes2);
			}

			if (DBG_ChildTriStackSize.GetUint8Val() != currentChildTriStackSize)
			{
				if (DBG_ChildTriStackSize.GetUint8Val() > currentChildTriStackSize)
				{
					printf("Push new child triangle\n");
				}
				else
				{
					printf("Pop new child triangle\n");
				}
				currentChildTriStackSize = DBG_ChildTriStackSize.GetUint8Val();
			}
			if (currentChildTriStackSize > 6)
			{
				__debugbreak();
			}
			clipDistance0 = DBG_ClipDistance0.GetFloat32Val();
			clipDistance1 = DBG_ClipDistance1.GetFloat32Val();
		}

		// Wait until the clip unit is ready to receive another tri:
		do
		{
			scoped_timestep time(loader, clk, 100);
			UpdateFPUs();
			UpdateNewOutput(outputClippedTriangles);
			currentState = (const clipper_state_t)(DBG_CurrentState.GetUint8Val() );
		} while(currentState == idleState && IA_outPreviousStageIsReady.GetBoolVal() != true);
	}

	currentState = (const clipper_state_t)(DBG_CurrentState.GetUint8Val() );

	;
}

static const bool GetTriangleNeedsZClipping(const clipWorkingTriangle& triangle)
{
	return ( (triangle.clipData.clip0 | triangle.clipData.clip1 | triangle.clipData.clip2) & ( (1 << CP_Front) | (1 << CP_Back) ) ) != 0;
}

// Returns true if this AABB intersects the CVV clipspace viewport in 2D or not
static const bool AABBIntersectViewport2D(const float minX, const float maxX, const float minY, const float maxY)
{
	return (minX <= 1.0f && maxX >= -1.0f) &&
		(minY <= 1.0f && maxY >= -1.0f);
}

static const float minf(const float a, const float b)
{
	return (a < b) ? a : b;
}

static const float maxf(const float a, const float b)
{
	return (a > b) ? a : b;
}

// Note that this is not a fully complete test for viewport-triangle intersection, we're just killing off the easy-to-compute test cases.
// A full test would involve separating axis theorem between the viewport AABB and the triangle in 2D space
static const bool GetTriangleNeedsEdgeClipping(const clipWorkingTriangle& triangle)
{
	const bool oneVertOutsideGuardBand = ( (triangle.clipData.clip0 | triangle.clipData.clip1 | triangle.clipData.clip2) & ( (1 << CP_GBLeft) | (1 << CP_GBRight) | (1 << CP_GBTop) | (1 << CP_GBBottom) ) ) != 0;
	if (!oneVertOutsideGuardBand)
		return false;

	const float unclippedTriangleAABBMinX = minf(minf(triangle.geomData.v0.xPos, triangle.geomData.v1.xPos), triangle.geomData.v2.xPos);
	const float unclippedTriangleAABBMaxX = maxf(maxf(triangle.geomData.v0.xPos, triangle.geomData.v1.xPos), triangle.geomData.v2.xPos);
	const float unclippedTriangleAABBMinY = minf(minf(triangle.geomData.v0.yPos, triangle.geomData.v1.yPos), triangle.geomData.v2.yPos);
	const float unclippedTriangleAABBMaxY = maxf(maxf(triangle.geomData.v0.yPos, triangle.geomData.v1.yPos), triangle.geomData.v2.yPos);
	const bool triangleAABBOverlapViewport = AABBIntersectViewport2D(unclippedTriangleAABBMinX, unclippedTriangleAABBMaxX, unclippedTriangleAABBMinY, unclippedTriangleAABBMaxY);

	const bool v0InsideViewport = ( (triangle.clipData.clip0 & ( (1 << CP_Left) | (1 << CP_Right) | (1 << CP_Top) | (1 << CP_Bottom) ) ) == 0);
	const bool v1InsideViewport = ( (triangle.clipData.clip1 & ( (1 << CP_Left) | (1 << CP_Right) | (1 << CP_Top) | (1 << CP_Bottom) ) ) == 0);
	const bool v2InsideViewport = ( (triangle.clipData.clip2 & ( (1 << CP_Left) | (1 << CP_Right) | (1 << CP_Top) | (1 << CP_Bottom) ) ) == 0);

	return triangleAABBOverlapViewport || (v0InsideViewport | v1InsideViewport | v2InsideViewport);
}

// Note that the output triangle list may be longer or shorter than the input triangle list!
void EmulateCPUClipper(const std::vector<triSetupInput>& inputUnclippedTriangles, std::vector<triSetupInput>& outputClippedTriangles)
{
	//outputClippedTriangles = inputUnclippedTriangles;
	//return;
	std::vector<clipWorkingTriangle> workingClipTriangles;

	clipWorkingTriangle mainWorkingClipTriangle;
	mainWorkingClipTriangle.alreadyClippedPlanes = 0x0000;

	const unsigned numInputTrianglesToClip = (const unsigned)inputUnclippedTriangles.size();
	for (unsigned inputTriangleID = 0; inputTriangleID < numInputTrianglesToClip; ++inputTriangleID)
	{
		const triSetupInput& thisTriangle = inputUnclippedTriangles[inputTriangleID];

		mainWorkingClipTriangle.geomData = thisTriangle;
		mainWorkingClipTriangle.ComputeClipCodes();
		mainWorkingClipTriangle.alreadyClippedPlanes = 0x0000;
		workingClipTriangles.push_back(mainWorkingClipTriangle);

		while (!workingClipTriangles.empty() )
		{
			mainWorkingClipTriangle = workingClipTriangles.back();
			workingClipTriangles.pop_back();

			// Early-out and remove any +/-INF or +/-NaN vertex position triangles:
			if (isnan(mainWorkingClipTriangle.geomData.v0.xPos) || isnan(mainWorkingClipTriangle.geomData.v0.yPos) || isnan(mainWorkingClipTriangle.geomData.v0.zPos) || isnan(mainWorkingClipTriangle.geomData.v0.wPos) ||
				isnan(mainWorkingClipTriangle.geomData.v1.xPos) || isnan(mainWorkingClipTriangle.geomData.v1.yPos) || isnan(mainWorkingClipTriangle.geomData.v1.zPos) || isnan(mainWorkingClipTriangle.geomData.v1.wPos) ||
				isnan(mainWorkingClipTriangle.geomData.v2.xPos) || isnan(mainWorkingClipTriangle.geomData.v2.yPos) || isnan(mainWorkingClipTriangle.geomData.v2.zPos) || isnan(mainWorkingClipTriangle.geomData.v2.wPos) ||
				isinf(mainWorkingClipTriangle.geomData.v0.xPos) || isinf(mainWorkingClipTriangle.geomData.v0.yPos) || isinf(mainWorkingClipTriangle.geomData.v0.zPos) || isinf(mainWorkingClipTriangle.geomData.v0.wPos) ||
				isinf(mainWorkingClipTriangle.geomData.v1.xPos) || isinf(mainWorkingClipTriangle.geomData.v1.yPos) || isinf(mainWorkingClipTriangle.geomData.v1.zPos) || isinf(mainWorkingClipTriangle.geomData.v1.wPos) ||
				isinf(mainWorkingClipTriangle.geomData.v2.xPos) || isinf(mainWorkingClipTriangle.geomData.v2.yPos) || isinf(mainWorkingClipTriangle.geomData.v2.zPos) || isinf(mainWorkingClipTriangle.geomData.v2.wPos) )
			{
				continue;
			}

			// Do early-out discard of this triangle if all three verts are outside of any one clipping plane
			if ( ( (mainWorkingClipTriangle.clipData.clip0 & mainWorkingClipTriangle.clipData.clip1 & mainWorkingClipTriangle.clipData.clip2) & (1 << CP_Left) ) ||
				( (mainWorkingClipTriangle.clipData.clip0 & mainWorkingClipTriangle.clipData.clip1 & mainWorkingClipTriangle.clipData.clip2) & (1 << CP_Right) ) ||
				( (mainWorkingClipTriangle.clipData.clip0 & mainWorkingClipTriangle.clipData.clip1 & mainWorkingClipTriangle.clipData.clip2) & (1 << CP_Top) ) ||
				( (mainWorkingClipTriangle.clipData.clip0 & mainWorkingClipTriangle.clipData.clip1 & mainWorkingClipTriangle.clipData.clip2) & (1 << CP_Bottom) ) ||
				( (mainWorkingClipTriangle.clipData.clip0 & mainWorkingClipTriangle.clipData.clip1 & mainWorkingClipTriangle.clipData.clip2) & (1 << CP_Front) ) ||
				( (mainWorkingClipTriangle.clipData.clip0 & mainWorkingClipTriangle.clipData.clip1 & mainWorkingClipTriangle.clipData.clip2) & (1 << CP_Back) ) ||
				( (mainWorkingClipTriangle.clipData.clip0 & mainWorkingClipTriangle.clipData.clip1 & mainWorkingClipTriangle.clipData.clip2) & (1 << CP_W0) ) )
			{
				continue;
			}

			bool mainTriangleIsValid = true;

			// Iterate through the seven important clipping planes in a specific order (W0, ZNear, ZFar, GBLeft, GBRight, GBTop, GBBottom) and clip against each edge, producing new triangles as necessary
			for (unsigned clipPlaneIndex = 0; clipPlaneIndex < ARRAYSIZE(orderedClipPlanes); ++clipPlaneIndex)
			{
				const eClipPlane thisClipPlane = orderedClipPlanes[clipPlaneIndex];
				const unsigned short outcodeBitmap = ( (mainWorkingClipTriangle.clipData.clip0 >> thisClipPlane) & 0x1) |
					( ( (mainWorkingClipTriangle.clipData.clip1 >> thisClipPlane) & 0x1) << 1) |
					( ( (mainWorkingClipTriangle.clipData.clip2 >> thisClipPlane) & 0x1) << 2);

				// If all verts are inside of this clipping plane, then good! We don't need to do any clipping here
				if (outcodeBitmap == 0x0)
					continue;

				// If we've gotten clipped outside of any one of the clipping planes, then discard this triangle
				if (outcodeBitmap == 0x7)
				{
					mainTriangleIsValid = false;
					break;
				}

				switch (thisClipPlane)
				{
				default:
					break;
				case CP_GBLeft:
				case CP_GBRight:
				case CP_GBTop:
				case CP_GBBottom:
					if (!GetTriangleNeedsEdgeClipping(mainWorkingClipTriangle) )
						continue;
					break;
				}

				// Add our new clipping plane to the bitmap of clipped planes
				mainWorkingClipTriangle.alreadyClippedPlanes |= (1 << thisClipPlane);

				/*if (thisClipPlane == CP_W0)
				{
					if (mainWorkingClipTriangle.geomData.v0.wPos < 0)
					{
						mainWorkingClipTriangle.geomData.v0.xPos *= -1.0f;
						mainWorkingClipTriangle.geomData.v0.yPos *= -1.0f;
						mainWorkingClipTriangle.geomData.v0.zPos *= -1.0f;
						mainWorkingClipTriangle.geomData.v0.wPos *= -1.0f;
					}
					if (mainWorkingClipTriangle.geomData.v1.wPos < 0)
					{
						mainWorkingClipTriangle.geomData.v1.xPos *= -1.0f;
						mainWorkingClipTriangle.geomData.v1.yPos *= -1.0f;
						mainWorkingClipTriangle.geomData.v1.zPos *= -1.0f;
						mainWorkingClipTriangle.geomData.v1.wPos *= -1.0f;
					}
					if (mainWorkingClipTriangle.geomData.v2.wPos < 0)
					{
						mainWorkingClipTriangle.geomData.v2.xPos *= -1.0f;
						mainWorkingClipTriangle.geomData.v2.yPos *= -1.0f;
						mainWorkingClipTriangle.geomData.v2.zPos *= -1.0f;
						mainWorkingClipTriangle.geomData.v2.wPos *= -1.0f;
					}
					continue;
				}*/

				clipWorkingTriangle newChildTriangle = mainWorkingClipTriangle;

				const vertInputClipSpace* inside0 = NULL;
				const vertInputClipSpace* inside1 = NULL;
				vertInputClipSpace* outside0 = NULL;
				vertInputClipSpace* outside1 = NULL;

				switch (outcodeBitmap)
				{
				case 1: // 001 - A is outside, BC are inside
					outside0 = &mainWorkingClipTriangle.geomData.v0; // BA
					outside1 = &newChildTriangle.geomData.v0; // CA
					inside0 = &mainWorkingClipTriangle.geomData.v1;
					inside1 = &mainWorkingClipTriangle.geomData.v2;
					break;
				case 2: // 010 - B is outside, AC are inside
					outside0 = &newChildTriangle.geomData.v1; // AB
					outside1 = &mainWorkingClipTriangle.geomData.v1; // CB
					inside0 = &mainWorkingClipTriangle.geomData.v0;
					inside1 = &mainWorkingClipTriangle.geomData.v2;
					break;
				case 4: // 100 - C is outside, AB are inside
					outside0 = &mainWorkingClipTriangle.geomData.v2; // AC
					outside1 = &newChildTriangle.geomData.v2; // BC
					inside0 = &mainWorkingClipTriangle.geomData.v0;
					inside1 = &mainWorkingClipTriangle.geomData.v1;
					break;
					
				case 3: // 011 - AB are outside, C is inside
					outside0 = &newChildTriangle.geomData.v0;
					outside1 = &newChildTriangle.geomData.v1;
					inside0 = &mainWorkingClipTriangle.geomData.v2;
					inside1 = &mainWorkingClipTriangle.geomData.v2; // Assign inside1 to the same pointer as inside0
					break;
				case 5: // 101 - AC are outside, B is inside
					outside0 = &newChildTriangle.geomData.v0;
					outside1 = &newChildTriangle.geomData.v2;
					inside0 = &mainWorkingClipTriangle.geomData.v1;
					inside1 = &mainWorkingClipTriangle.geomData.v1; // Assign inside1 to the same pointer as inside0
					break;
				case 6: // 110 - BC are outside, A is inside
					outside0 = &newChildTriangle.geomData.v1;
					outside1 = &newChildTriangle.geomData.v2;
					inside0 = &mainWorkingClipTriangle.geomData.v0;
					inside1 = &mainWorkingClipTriangle.geomData.v0; // Assign inside1 to the same pointer as inside0
					break;
				}

				const float clipDistanceEdge0 = GetClipDistanceForPlane(*inside0, *outside0, thisClipPlane);
				const float clipDistanceEdge1 = GetClipDistanceForPlane(*inside1, *outside1, thisClipPlane);
				ClipVertexInPlace(*inside0, *outside0, clipDistanceEdge0, mainWorkingClipTriangle.alreadyClippedPlanes);
				ClipVertexInPlace(*inside1, *outside1, clipDistanceEdge1, mainWorkingClipTriangle.alreadyClippedPlanes);

				// Special child triangle swizzling:
				switch (outcodeBitmap)
				{
				case 1:
					newChildTriangle.geomData.v1 = mainWorkingClipTriangle.geomData.v0;
					break;
				case 2:
					newChildTriangle.geomData.v2 = mainWorkingClipTriangle.geomData.v1;
					break;
				case 4:
					newChildTriangle.geomData.v0 = mainWorkingClipTriangle.geomData.v2;
					break;
				}
				newChildTriangle.ComputeClipCodes();

				const unsigned clearClipPlanes = ~mainWorkingClipTriangle.alreadyClippedPlanes;
				newChildTriangle.clipData.clip0 &= clearClipPlanes;
				newChildTriangle.clipData.clip1 &= clearClipPlanes;
				newChildTriangle.clipData.clip2 &= clearClipPlanes;

				switch (outcodeBitmap)
				{
				case 1: // 001 - A is outside, BC are inside
				case 2: // 010 - B is outside, AC are inside
				case 4: // 100 - C is outside, AB are inside
				{
					mainWorkingClipTriangle.ComputeClipCodes();

					// Add child triangles to the array of working clip triangles
					workingClipTriangles.push_back(newChildTriangle);
				}
					break;

					// All of these bitmasks don't create any additional child triangles. They all just clip-modify the original triangle in place:
				case 3: // 011 - AB are outside, C is inside
				case 5: // 101 - AC are outside, B is inside
				case 6: // 110 - BC are outside, A is inside
				{
					mainWorkingClipTriangle = newChildTriangle;
				}
					break;
				}
			}

			// If our main triangle survives clipping, then output it by adding it to the output list of clipped triangles
			if (mainTriangleIsValid)
			{
				outputClippedTriangles.push_back(mainWorkingClipTriangle.geomData);
			}
		};
	}
}

void ApplyViewportTransform(vertInputClipSpace& vert)
{
	// Do division by W:
	const float reciprocalW = 1.0f / vert.wPos;
	vert.xPos *= reciprocalW;
	vert.yPos *= reciprocalW;
	vert.zPos *= reciprocalW;
	vert.wPos = reciprocalW;

	// Apply the viewport scaling and offsetting:
	vert.xPos *= VIEWPORT_HALF_WIDTH;
	vert.xPos += VIEWPORT_HALF_WIDTH;

	// Flip the Y axis here
	vert.yPos *= -VIEWPORT_HALF_HEIGHT;
	vert.yPos += VIEWPORT_HALF_HEIGHT;
}

const float frand()
{
	return rand() / (const float)RAND_MAX;
}

const D3DCOLOR ConvertColorToD3DCOLOR(const vertInputClipSpace::_rgba& color)
{
	const unsigned r = (const unsigned)(color.r * 255.0f);
	const unsigned g = (const unsigned)(color.g * 255.0f);
	const unsigned b = (const unsigned)(color.b * 255.0f);
	const unsigned a = (const unsigned)(color.a * 255.0f);
	return D3DCOLOR_ARGB(a, r, g, b);
}

void ApplyProjectionTransform(vertInputClipSpace& vert)
{
	D3DXVec3Transform( (D3DXVECTOR4* const)&vert.xPos, (const D3DXVECTOR3* const)&vert.xPos, &projMatrix);
}

const float MakeInfNanFloat(bool isNan, bool isNeg)
{
	uint32_t val = 0xFF000000 >> 1;
	if (isNeg)
		val |= (1 << 31);
	if (isNan)
		val |= ( (1 << 23) - 1);
	return *(const float* const)&val;
}

void InitClipPlanes()
{
	{
		const D3DXVECTOR3 leftPlanePoint(-1.0f, 0.0f, 0.0f);
		const D3DXVECTOR3 leftPlaneNormal(1.0f, 0.0f, 0.0f);
		D3DXPlaneFromPointNormal(&ClipPlanes[CP_Left], &leftPlanePoint, &leftPlaneNormal);
	}
	{
		const D3DXVECTOR3 rightPlanePoint(1.0f, 0.0f, 0.0f);
		const D3DXVECTOR3 rightPlaneNormal(-1.0f, 0.0f, 0.0f);
		D3DXPlaneFromPointNormal(&ClipPlanes[CP_Right], &rightPlanePoint, &rightPlaneNormal);
	}
	{
		const D3DXVECTOR3 topPlanePoint(0.0f, 1.0f, 0.0f);
		const D3DXVECTOR3 topPlaneNormal(0.0f, -1.0f, 0.0f);
		D3DXPlaneFromPointNormal(&ClipPlanes[CP_Top], &topPlanePoint, &topPlaneNormal);
	}
	{
		const D3DXVECTOR3 bottomPlanePoint(0.0f, -1.0f, 0.0f);
		const D3DXVECTOR3 bottomPlaneNormal(0.0f, 1.0f, 0.0f);
		D3DXPlaneFromPointNormal(&ClipPlanes[CP_Bottom], &bottomPlanePoint, &bottomPlaneNormal);
	}
	{
		const D3DXVECTOR3 frontPlanePoint(0.0f, 0.0f, 0.0f);
		const D3DXVECTOR3 frontPlaneNormal(0.0f, 0.0f, 1.0f);
		D3DXPlaneFromPointNormal(&ClipPlanes[CP_Front], &frontPlanePoint, &frontPlaneNormal);
	}
	{
		const D3DXVECTOR3 backPlanePoint(0.0f, 0.0f, 1.0f);
		const D3DXVECTOR3 backPlaneNormal(0.0f, 0.0f, -1.0f);
		D3DXPlaneFromPointNormal(&ClipPlanes[CP_Back], &backPlanePoint, &backPlaneNormal);
	}
	{
		const D3DXVECTOR3 GBLeftPlanePoint(-1.0f * GuardBandXScale, 0.0f, 0.0f);
		const D3DXVECTOR3 leftPlaneNormal(1.0f, 0.0f, 0.0f);
		D3DXPlaneFromPointNormal(&ClipPlanes[CP_GBLeft], &GBLeftPlanePoint, &leftPlaneNormal);
	}
	{
		const D3DXVECTOR3 GBRightPlanePoint(1.0f * GuardBandXScale, 0.0f, 0.0f);
		const D3DXVECTOR3 rightPlaneNormal(-1.0f, 0.0f, 0.0f);
		D3DXPlaneFromPointNormal(&ClipPlanes[CP_GBRight], &GBRightPlanePoint, &rightPlaneNormal);
	}
	{
		const D3DXVECTOR3 GBTopPlanePoint(0.0f, 1.0f * GuardBandYScale, 0.0f);
		const D3DXVECTOR3 topPlaneNormal(0.0f, -1.0f, 0.0f);
		D3DXPlaneFromPointNormal(&ClipPlanes[CP_GBTop], &GBTopPlanePoint, &topPlaneNormal);
	}
	{
		const D3DXVECTOR3 GBBottomPlanePoint(0.0f, -1.0f * GuardBandYScale, 0.0f);
		const D3DXVECTOR3 bottomPlaneNormal(0.0f, 1.0f, 0.0f);
		D3DXPlaneFromPointNormal(&ClipPlanes[CP_GBBottom], &GBBottomPlanePoint, &bottomPlaneNormal);
	}
}

const int RunTestsClipUnit(Xsi::Loader& loader, RenderWindow* renderWindow)
{
	// Clock signal
	std_logic_port clk(PD_IN, loader, "clk");

	// Control signals for the previous (IA) and next (TRISETUP) stages:
	std_logic_port IA_inPreviousStageIsValid(PD_IN, loader, "IA_inPreviousStageIsValid");
	std_logic_port IA_outPreviousStageIsReady(PD_OUT, loader, "IA_outPreviousStageIsReady");

	std_logic_port TRISETUP_outNextStageIsValid(PD_OUT, loader, "TRISETUP_outNextStageIsValid");
	std_logic_port TRISETUP_inNextStageisReady(PD_IN, loader, "TRISETUP_inNextStageisReady");

	// Triangle data in:
	std_logic_vector_port<32> IA_inv0x(PD_IN, loader, "IA_inv0x");
	std_logic_vector_port<32> IA_inv0y(PD_IN, loader, "IA_inv0y");
	std_logic_vector_port<32> IA_inv0z(PD_IN, loader, "IA_inv0z");
	std_logic_vector_port<32> IA_inv0w(PD_IN, loader, "IA_inv0w");
	std_logic_vector_port<128> IA_inv0rgba(PD_IN, loader, "IA_inv0rgba");
	std_logic_vector_port<32> IA_inv0tx(PD_IN, loader, "IA_inv0tx");
	std_logic_vector_port<32> IA_inv0ty(PD_IN, loader, "IA_inv0ty");
	std_logic_vector_port<11> IA_inv0ClipOutcodes(PD_IN, loader, "IA_inv0ClipOutcodes");

	std_logic_vector_port<32> IA_inv1x(PD_IN, loader, "IA_inv1x");
	std_logic_vector_port<32> IA_inv1y(PD_IN, loader, "IA_inv1y");
	std_logic_vector_port<32> IA_inv1z(PD_IN, loader, "IA_inv1z");
	std_logic_vector_port<32> IA_inv1w(PD_IN, loader, "IA_inv1w");
	std_logic_vector_port<128> IA_inv1rgba(PD_IN, loader, "IA_inv1rgba");
	std_logic_vector_port<32> IA_inv1tx(PD_IN, loader, "IA_inv1tx");
	std_logic_vector_port<32> IA_inv1ty(PD_IN, loader, "IA_inv1ty");
	std_logic_vector_port<11> IA_inv1ClipOutcodes(PD_IN, loader, "IA_inv1ClipOutcodes");

	std_logic_vector_port<32> IA_inv2x(PD_IN, loader, "IA_inv2x");
	std_logic_vector_port<32> IA_inv2y(PD_IN, loader, "IA_inv2y");
	std_logic_vector_port<32> IA_inv2z(PD_IN, loader, "IA_inv2z");
	std_logic_vector_port<32> IA_inv2w(PD_IN, loader, "IA_inv2w");
	std_logic_vector_port<128> IA_inv2rgba(PD_IN, loader, "IA_inv2rgba");
	std_logic_vector_port<32> IA_inv2tx(PD_IN, loader, "IA_inv2tx");
	std_logic_vector_port<32> IA_inv2ty(PD_IN, loader, "IA_inv2ty");
	std_logic_vector_port<11> IA_inv2ClipOutcodes(PD_IN, loader, "IA_inv2ClipOutcodes");

	std_logic_port IA_inWholeTriangleAABBIntersectsViewport(PD_IN, loader, "IA_inWholeTriangleAABBIntersectsViewport");
	// End Triangle data in

	// Triangle data out:
	std_logic_vector_port<32> TRISETUP_outv0x(PD_OUT, loader, "TRISETUP_outv0x");
	std_logic_vector_port<32> TRISETUP_outv0y(PD_OUT, loader, "TRISETUP_outv0y");
	std_logic_vector_port<32> TRISETUP_outv0z(PD_OUT, loader, "TRISETUP_outv0z");
	std_logic_vector_port<32> TRISETUP_outv0w(PD_OUT, loader, "TRISETUP_outv0w");
	std_logic_vector_port<128> TRISETUP_outv0rgba(PD_OUT, loader, "TRISETUP_outv0rgba");
	std_logic_vector_port<32> TRISETUP_outv0tx(PD_OUT, loader, "TRISETUP_outv0tx");
	std_logic_vector_port<32> TRISETUP_outv0ty(PD_OUT, loader, "TRISETUP_outv0ty");

	std_logic_vector_port<32> TRISETUP_outv1x(PD_OUT, loader, "TRISETUP_outv1x");
	std_logic_vector_port<32> TRISETUP_outv1y(PD_OUT, loader, "TRISETUP_outv1y");
	std_logic_vector_port<32> TRISETUP_outv1z(PD_OUT, loader, "TRISETUP_outv1z");
	std_logic_vector_port<32> TRISETUP_outv1w(PD_OUT, loader, "TRISETUP_outv1w");
	std_logic_vector_port<128> TRISETUP_outv1rgba(PD_OUT, loader, "TRISETUP_outv1rgba");
	std_logic_vector_port<32> TRISETUP_outv1tx(PD_OUT, loader, "TRISETUP_outv1tx");
	std_logic_vector_port<32> TRISETUP_outv1ty(PD_OUT, loader, "TRISETUP_outv1ty");

	std_logic_vector_port<32> TRISETUP_outv2x(PD_OUT, loader, "TRISETUP_outv2x");
	std_logic_vector_port<32> TRISETUP_outv2y(PD_OUT, loader, "TRISETUP_outv2y");
	std_logic_vector_port<32> TRISETUP_outv2z(PD_OUT, loader, "TRISETUP_outv2z");
	std_logic_vector_port<32> TRISETUP_outv2w(PD_OUT, loader, "TRISETUP_outv2w");
	std_logic_vector_port<128> TRISETUP_outv2rgba(PD_OUT, loader, "TRISETUP_outv2rgba");
	std_logic_vector_port<32> TRISETUP_outv2tx(PD_OUT, loader, "TRISETUP_outv2tx");
	std_logic_vector_port<32> TRISETUP_outv2ty(PD_OUT, loader, "TRISETUP_outv2ty");
	// End triangle data out

	// FPU interfaces begin:
	std_logic_vector_port<32> FPU_Add0_A(PD_OUT, loader, "FPU_Add0_A");
	std_logic_vector_port<32> FPU_Add0_B(PD_OUT, loader, "FPU_Add0_B");
	std_logic_port FPU_Add0_IADD_GO(PD_OUT, loader, "FPU_Add0_IADD_GO");
	std_logic_vector_port<32> FPU_Add0_OUT(PD_IN, loader, "FPU_Add0_OUT");

	std_logic_vector_port<32> FPU_Add1_A(PD_OUT, loader, "FPU_Add1_A");
	std_logic_vector_port<32> FPU_Add1_B(PD_OUT, loader, "FPU_Add1_B");
	std_logic_port FPU_Add1_IADD_GO(PD_OUT, loader, "FPU_Add1_IADD_GO");
	std_logic_vector_port<32> FPU_Add1_OUT(PD_IN, loader, "FPU_Add1_OUT");

	std_logic_vector_port<32> FPU_Mul0_A(PD_OUT, loader, "FPU_Mul0_A");
	std_logic_vector_port<32> FPU_Mul0_B(PD_OUT, loader, "FPU_Mul0_B");
	std_logic_port FPU_Mul0_IMUL_GO(PD_OUT, loader, "FPU_Mul0_IMUL_GO");
	std_logic_vector_port<32> FPU_Mul0_OUT(PD_IN, loader, "FPU_Mul0_OUT");

	std_logic_vector_port<32> FPU_Mul1_A(PD_OUT, loader, "FPU_Mul1_A");
	std_logic_vector_port<32> FPU_Mul1_B(PD_OUT, loader, "FPU_Mul1_B");
	std_logic_port FPU_Mul1_IMUL_GO(PD_OUT, loader, "FPU_Mul1_IMUL_GO");
	std_logic_vector_port<32> FPU_Mul1_OUT(PD_IN, loader, "FPU_Mul1_OUT");

	std_logic_vector_port<32> FPU_Rcp0_A(PD_OUT, loader, "FPU_Rcp0_A");
	std_logic_port FPU_Rcp0_ISPEC_GO(PD_OUT, loader, "FPU_Rcp0_ISPEC_GO");
	std_logic_vector_port<32> FPU_Rcp0_OUT(PD_IN, loader, "FPU_Rcp0_OUT");
	// FPU interfaces end

	// Stats interface begin
	std_logic_vector_port<32> STAT_CyclesIdle(PD_OUT, loader, "STAT_CyclesIdle");
	std_logic_vector_port<32> STAT_CyclesSpentWorking(PD_OUT, loader, "STAT_CyclesSpentWorking");
	std_logic_vector_port<32> STAT_CyclesWaitingForOutput(PD_OUT, loader, "STAT_CyclesWaitingForOutput");
	// Stats interface end

	// Debug signals:
	std_logic_vector_port<8> DBG_CurrentState(PD_OUT, loader, "DBG_CurrentState");
	std_logic_vector_port<4> DBG_CurrentClipPlane(PD_OUT, loader, "DBG_CurrentClipPlane");
	std_logic_vector_port<3> DBG_CurrentClipBitmask(PD_OUT, loader, "DBG_CurrentClipBitmask");
	std_logic_vector_port<3> DBG_ChildTriStackSize(PD_OUT, loader, "DBG_ChildTriStackSize");
	std_logic_vector_port<32> DBG_ClipDistance0(PD_OUT, loader, "DBG_ClipDistance0");
	std_logic_vector_port<32> DBG_ClipDistance1(PD_OUT, loader, "DBG_ClipDistance1");
	std_logic_vector_port<32> DBG_V0PosX(PD_OUT, loader, "DBG_V0PosX");
	std_logic_vector_port<32> DBG_V0PosY(PD_OUT, loader, "DBG_V0PosY");
	std_logic_vector_port<32> DBG_V0PosZ(PD_OUT, loader, "DBG_V0PosZ");
	std_logic_vector_port<32> DBG_V0PosW(PD_OUT, loader, "DBG_V0PosW");
	std_logic_vector_port<32> DBG_V1PosX(PD_OUT, loader, "DBG_V1PosX");
	std_logic_vector_port<32> DBG_V1PosY(PD_OUT, loader, "DBG_V1PosY");
	std_logic_vector_port<32> DBG_V1PosZ(PD_OUT, loader, "DBG_V1PosZ");
	std_logic_vector_port<32> DBG_V1PosW(PD_OUT, loader, "DBG_V1PosW");
	std_logic_vector_port<32> DBG_V2PosX(PD_OUT, loader, "DBG_V2PosX");
	std_logic_vector_port<32> DBG_V2PosY(PD_OUT, loader, "DBG_V2PosY");
	std_logic_vector_port<32> DBG_V2PosZ(PD_OUT, loader, "DBG_V2PosZ");
	std_logic_vector_port<32> DBG_V2PosW(PD_OUT, loader, "DBG_V2PosW");
	std_logic_vector_port<11> DBG_ClipOutcodes0(PD_OUT, loader, "DBG_ClipOutcodes0");
	std_logic_vector_port<11> DBG_ClipOutcodes1(PD_OUT, loader, "DBG_ClipOutcodes1");
	std_logic_vector_port<11> DBG_ClipOutcodes2(PD_OUT, loader, "DBG_ClipOutcodes2");

	FPU addFPU0(0);
	FPU addFPU1(1);
	FPU mulFPU0(0);
	FPU mulFPU1(1);
	FPU rcpFPU0(0);

	auto UpdateFPUs = [&]()
	{
		addFPU0.UpdateAddOnly(FPU_Add0_IADD_GO, FPU_Add0_A, FPU_Add0_B, FPU_Add0_OUT);
		addFPU1.UpdateAddOnly(FPU_Add1_IADD_GO, FPU_Add1_A, FPU_Add1_B, FPU_Add1_OUT);
		mulFPU0.UpdateMulOnly(FPU_Mul0_IMUL_GO, FPU_Mul0_A, FPU_Mul0_B, FPU_Mul0_OUT);
		mulFPU1.UpdateMulOnly(FPU_Mul1_IMUL_GO, FPU_Mul1_A, FPU_Mul1_B, FPU_Mul1_OUT);
		rcpFPU0.UpdateRcpOnly(FPU_Rcp0_ISPEC_GO, FPU_Rcp0_A, FPU_Rcp0_OUT);
	};

	auto SetNewPendingInput = [&](const triSetupInput& newInput)
	{
		IA_inv0x = newInput.v0.xPos;
		IA_inv0y = newInput.v0.yPos;
		IA_inv0z = newInput.v0.zPos;
		IA_inv0w = newInput.v0.wPos;
		IA_inv1x = newInput.v1.xPos;
		IA_inv1y = newInput.v1.yPos;
		IA_inv1z = newInput.v1.zPos;
		IA_inv1w = newInput.v1.wPos;
		IA_inv2x = newInput.v2.xPos;
		IA_inv2y = newInput.v2.yPos;
		IA_inv2z = newInput.v2.zPos;
		IA_inv2w = newInput.v2.wPos;
		IA_inv0tx = newInput.v0.xTex;
		IA_inv0ty = newInput.v0.yTex;
		IA_inv1tx = newInput.v1.xTex;
		IA_inv1ty = newInput.v1.yTex;
		IA_inv2tx = newInput.v2.xTex;
		IA_inv2ty = newInput.v2.yTex;
		IA_inv0rgba.SetStructVal(newInput.v0.rgba);
		IA_inv1rgba.SetStructVal(newInput.v1.rgba);
		IA_inv2rgba.SetStructVal(newInput.v2.rgba);

		clipWorkingTriangle clipWork;
		clipWork.geomData.v0 = newInput.v0;
		clipWork.geomData.v1 = newInput.v1;
		clipWork.geomData.v2 = newInput.v2;
		clipWork.ComputeClipCodes();

		IA_inv0ClipOutcodes = clipWork.clipData.clip0;
		IA_inv1ClipOutcodes = clipWork.clipData.clip1;
		IA_inv2ClipOutcodes = clipWork.clipData.clip2;

		IA_inWholeTriangleAABBIntersectsViewport = GetTriangleNeedsEdgeClipping(clipWork);

		IA_inPreviousStageIsValid = true;
	};

	auto UpdateNewOutput = [&](std::vector<triSetupInput>& clippedOutputTris)
	{
		if (TRISETUP_outNextStageIsValid.GetBoolVal() )
		{
			triSetupInput newClippedTri;
			
			newClippedTri.v0.xPos = TRISETUP_outv0x.GetFloat32Val();
			newClippedTri.v0.yPos = TRISETUP_outv0y.GetFloat32Val();
			newClippedTri.v0.zPos = TRISETUP_outv0z.GetFloat32Val();
			newClippedTri.v0.wPos = TRISETUP_outv0w.GetFloat32Val();
			newClippedTri.v1.xPos = TRISETUP_outv1x.GetFloat32Val();
			newClippedTri.v1.yPos = TRISETUP_outv1y.GetFloat32Val();
			newClippedTri.v1.zPos = TRISETUP_outv1z.GetFloat32Val();
			newClippedTri.v1.wPos = TRISETUP_outv1w.GetFloat32Val();
			newClippedTri.v2.xPos = TRISETUP_outv2x.GetFloat32Val();
			newClippedTri.v2.yPos = TRISETUP_outv2y.GetFloat32Val();
			newClippedTri.v2.zPos = TRISETUP_outv2z.GetFloat32Val();
			newClippedTri.v2.wPos = TRISETUP_outv2w.GetFloat32Val();

			newClippedTri.v0.xTex = TRISETUP_outv0tx.GetFloat32Val();
			newClippedTri.v0.yTex = TRISETUP_outv0ty.GetFloat32Val();
			newClippedTri.v1.xTex = TRISETUP_outv1tx.GetFloat32Val();
			newClippedTri.v1.yTex = TRISETUP_outv1ty.GetFloat32Val();
			newClippedTri.v2.xTex = TRISETUP_outv2tx.GetFloat32Val();
			newClippedTri.v2.yTex = TRISETUP_outv2ty.GetFloat32Val();

			TRISETUP_outv0rgba.GetStructVal(newClippedTri.v0.rgba);
			TRISETUP_outv1rgba.GetStructVal(newClippedTri.v1.rgba);
			TRISETUP_outv2rgba.GetStructVal(newClippedTri.v2.rgba);

			printf("New output tri %u:\n\t(%f,%f,%f,%f)\n\t(%f,%f,%f,%f)\n\t(%f,%f,%f,%f)\n\n", (const unsigned)clippedOutputTris.size(),
				newClippedTri.v0.xPos, newClippedTri.v0.yPos, newClippedTri.v0.zPos, newClippedTri.v0.wPos,
				newClippedTri.v1.xPos, newClippedTri.v1.yPos, newClippedTri.v1.zPos, newClippedTri.v1.wPos,
				newClippedTri.v2.xPos, newClippedTri.v2.yPos, newClippedTri.v2.zPos, newClippedTri.v2.wPos);

			clippedOutputTris.push_back(newClippedTri);
		}
	};

	// Start everything off at the beginning:
	loader.restart();

	srand(1);

	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		IA_inPreviousStageIsValid = false;
		IA_inWholeTriangleAABBIntersectsViewport = false;
		TRISETUP_inNextStageisReady = false;
	}

	bool successResult = true;

	D3DXMatrixPerspectiveFovRH(&projMatrix, D3DXToRadian(90.0f), 640.0f / 480.0f, 0.001f, 1000.0f);

	std::vector<triSetupInput> unclippedInputTris;

	triSetupInput goodclipTri;
	goodclipTri.v0.xPos = -0.5f;
	goodclipTri.v0.yPos = -0.5f;
	goodclipTri.v0.zPos = 0.0f;
	goodclipTri.v0.wPos = 1.0f;
	goodclipTri.v1.xPos = 0.1f;
	goodclipTri.v1.yPos = 3.0f;
	goodclipTri.v1.zPos = 1.0f;
	goodclipTri.v1.wPos = 1.0f;
	goodclipTri.v2.xPos = 1.75f;
	goodclipTri.v2.yPos = 0.85f;
	goodclipTri.v2.zPos = 2.0f;
	goodclipTri.v2.wPos = 2.5f;

	goodclipTri.v0.rgba.r = goodclipTri.v0.rgba.g = goodclipTri.v0.rgba.b = 0.0f;
	goodclipTri.v0.rgba.a = 1.0f;
	goodclipTri.v1.rgba = goodclipTri.v0.rgba;
	goodclipTri.v2.rgba = goodclipTri.v0.rgba;
	goodclipTri.v0.rgba.r = 1.0f;
	goodclipTri.v1.rgba.g = 1.0f;
	goodclipTri.v2.rgba.b = 1.0f;

	goodclipTri.v0.xTex = 0.0f;
	goodclipTri.v0.yTex = 0.0f;

	goodclipTri.v1.xTex = 0.5f;
	goodclipTri.v1.yTex = 0.5f;

	goodclipTri.v2.xTex = 1.0f;
	goodclipTri.v2.yTex = 1.0f;

	std::vector<triSetupInput> clippedOutputTris;
	std::vector<triSetupInput> HDLSimClippedOutputTris;

	// Test 1:
	// Add a bunch of known bad tris to our list first to make sure that they get culled immediately:
	{
		for (unsigned flt = 0; flt < 3*4; ++flt)
		{
			for (unsigned infNan = 0; infNan < 2; ++infNan)
			{
				for (unsigned sign = 0; sign < 2; ++sign)
				{
					triSetupInput badclipTri = goodclipTri;

					vertInputClipSpace* vertPtr = NULL;
					switch (flt / 4)
					{
					default:
						__debugbreak(); // Should never be here
					case 0:
						vertPtr = &badclipTri.v0;
						break;
					case 1:
						vertPtr = &badclipTri.v1;
						break;
					case 2:
						vertPtr = &badclipTri.v2;
						break;
					}

					float* const fltPtr = &vertPtr->xPos + (flt % 4);

					*fltPtr = MakeInfNanFloat(infNan == 1, sign == 1);

					unclippedInputTris.push_back(badclipTri);
				}
			}
		}
	}

	// Outside left edge tri:
	{
		triSetupInput leftClipTri = goodclipTri;

		while (leftClipTri.v0.xPos >= -leftClipTri.v0.wPos) leftClipTri.v0.xPos -= 0.001f;
		while (leftClipTri.v1.xPos >= -leftClipTri.v1.wPos) leftClipTri.v1.xPos -= 0.001f;
		while (leftClipTri.v2.xPos >= -leftClipTri.v2.wPos) leftClipTri.v2.xPos -= 0.001f;

		unclippedInputTris.push_back(leftClipTri);
	}

	// Outside right edge tri:
	{
		triSetupInput rightClipTri = goodclipTri;

		while (rightClipTri.v0.xPos <= rightClipTri.v0.wPos) rightClipTri.v0.xPos += 0.001f;
		while (rightClipTri.v1.xPos <= rightClipTri.v1.wPos) rightClipTri.v1.xPos += 0.001f;
		while (rightClipTri.v2.xPos <= rightClipTri.v2.wPos) rightClipTri.v2.xPos += 0.001f;

		unclippedInputTris.push_back(rightClipTri);
	}

	// Outside top edge tri:
	{
		triSetupInput topClipTri = goodclipTri;

		while (topClipTri.v0.yPos <= topClipTri.v0.wPos) topClipTri.v0.yPos += 0.001f;
		while (topClipTri.v1.yPos <= topClipTri.v1.wPos) topClipTri.v1.yPos += 0.001f;
		while (topClipTri.v2.yPos <= topClipTri.v2.wPos) topClipTri.v2.yPos += 0.001f;

		unclippedInputTris.push_back(topClipTri);
	}

	// Outside bottom edge tri:
	{
		triSetupInput bottomClipTri = goodclipTri;

		while (bottomClipTri.v0.yPos >= -bottomClipTri.v0.wPos) bottomClipTri.v0.yPos -= 0.001f;
		while (bottomClipTri.v1.yPos >= -bottomClipTri.v1.wPos) bottomClipTri.v1.yPos -= 0.001f;
		while (bottomClipTri.v2.yPos >= -bottomClipTri.v2.wPos) bottomClipTri.v2.yPos -= 0.001f;

		unclippedInputTris.push_back(bottomClipTri);
	}

	// Outside front (z-near) edge tri:
	{
		triSetupInput zFrontClipTri = goodclipTri;

		while (zFrontClipTri.v0.zPos >= 0.0f) zFrontClipTri.v0.zPos -= 0.001f;
		while (zFrontClipTri.v1.zPos >= 0.0f) zFrontClipTri.v1.zPos -= 0.001f;
		while (zFrontClipTri.v2.zPos >= 0.0f) zFrontClipTri.v2.zPos -= 0.001f;

		unclippedInputTris.push_back(zFrontClipTri);
	}

	// Outside back (z-far) edge tri:
	{
		triSetupInput zBackClipTri = goodclipTri;

		while (zBackClipTri.v0.zPos <= zBackClipTri.v0.wPos) zBackClipTri.v0.zPos += 0.001f;
		while (zBackClipTri.v1.zPos <= zBackClipTri.v1.wPos) zBackClipTri.v1.zPos += 0.001f;
		while (zBackClipTri.v2.zPos <= zBackClipTri.v2.wPos) zBackClipTri.v2.zPos += 0.001f;

		unclippedInputTris.push_back(zBackClipTri);
	}
	
	// Outside 0<W edge tri:
	{
		triSetupInput w0ClipTri = goodclipTri;

		if (w0ClipTri.v0.wPos > 0.0f)
			w0ClipTri.v0.wPos *= -1.0f;
		if (w0ClipTri.v1.wPos > 0.0f)
			w0ClipTri.v1.wPos *= -1.0f;
		if (w0ClipTri.v2.wPos > 0.0f)
			w0ClipTri.v2.wPos *= -1.0f;

		unclippedInputTris.push_back(w0ClipTri);
	}

	// Outside left guard band tri:
	{
		triSetupInput leftGBClipTri = goodclipTri;

		while (leftGBClipTri.v0.xPos >= -leftGBClipTri.v0.wPos * GuardBandXScale) leftGBClipTri.v0.xPos -= 0.0023f;
		while (leftGBClipTri.v1.xPos >= -leftGBClipTri.v1.wPos * GuardBandXScale) leftGBClipTri.v1.xPos -= 0.0023f;
		while (leftGBClipTri.v2.xPos >= -leftGBClipTri.v2.wPos * GuardBandXScale) leftGBClipTri.v2.xPos -= 0.0023f;

		unclippedInputTris.push_back(leftGBClipTri);
	}

	// Outside right guard band tri:
	{
		triSetupInput rightGBClipTri = goodclipTri;

		while (rightGBClipTri.v0.xPos <= rightGBClipTri.v0.wPos * GuardBandXScale) rightGBClipTri.v0.xPos += 0.0023f;
		while (rightGBClipTri.v1.xPos <= rightGBClipTri.v1.wPos * GuardBandXScale) rightGBClipTri.v1.xPos += 0.0023f;
		while (rightGBClipTri.v2.xPos <= rightGBClipTri.v2.wPos * GuardBandXScale) rightGBClipTri.v2.xPos += 0.0023f;

		unclippedInputTris.push_back(rightGBClipTri);
	}

	// Outside top guard band tri:
	{
		triSetupInput topGBClipTri = goodclipTri;

		while (topGBClipTri.v0.yPos <= topGBClipTri.v0.wPos * GuardBandYScale) topGBClipTri.v0.yPos += 0.0023f;
		while (topGBClipTri.v1.yPos <= topGBClipTri.v1.wPos * GuardBandYScale) topGBClipTri.v1.yPos += 0.0023f;
		while (topGBClipTri.v2.yPos <= topGBClipTri.v2.wPos * GuardBandYScale) topGBClipTri.v2.yPos += 0.0023f;

		unclippedInputTris.push_back(topGBClipTri);
	}

	// Outside bottom guard band tri:
	{
		triSetupInput bottomGBClipTri = goodclipTri;

		while (bottomGBClipTri.v0.yPos >= -bottomGBClipTri.v0.wPos * GuardBandYScale) bottomGBClipTri.v0.yPos -= 0.0023f;
		while (bottomGBClipTri.v1.yPos >= -bottomGBClipTri.v1.wPos * GuardBandYScale) bottomGBClipTri.v1.yPos -= 0.0023f;
		while (bottomGBClipTri.v2.yPos >= -bottomGBClipTri.v2.wPos * GuardBandYScale) bottomGBClipTri.v2.yPos -= 0.0023f;

		unclippedInputTris.push_back(bottomGBClipTri);
	}

	EmulateCPUClipper(unclippedInputTris, clippedOutputTris);
	SimulateHDLClipper(loader, unclippedInputTris, HDLSimClippedOutputTris, clk, TRISETUP_inNextStageisReady, IA_inPreviousStageIsValid, IA_outPreviousStageIsReady, 
		DBG_CurrentState, DBG_CurrentClipPlane, DBG_CurrentClipBitmask, DBG_ChildTriStackSize, 
		DBG_ClipDistance0, DBG_ClipDistance1,
		DBG_V0PosX, DBG_V0PosY, DBG_V0PosZ, DBG_V0PosW,
		DBG_V1PosX, DBG_V1PosY, DBG_V1PosZ, DBG_V1PosW,
		DBG_V2PosX, DBG_V2PosY, DBG_V2PosZ, DBG_V2PosW,
		DBG_ClipOutcodes0, DBG_ClipOutcodes1, DBG_ClipOutcodes2,
		UpdateFPUs, SetNewPendingInput, UpdateNewOutput);
	if (clippedOutputTris.size() != 0 || HDLSimClippedOutputTris.size() != 0)
	{
		__debugbreak();
	}
	unclippedInputTris.clear();

	// Add a known noclip tri to our list first:
	{
		// Inside all viewport planes:
		unclippedInputTris.push_back(goodclipTri);
	}

	// Outside left edge, inside left guard band:
	{
		triSetupInput leftNoClipTri = goodclipTri;
		leftNoClipTri.v0.xPos = -leftNoClipTri.v0.wPos * 1.25f;
		unclippedInputTris.push_back(leftNoClipTri);
		leftNoClipTri = goodclipTri;
		leftNoClipTri.v1.xPos = -leftNoClipTri.v1.wPos * 4.5f;
		unclippedInputTris.push_back(leftNoClipTri);
		leftNoClipTri = goodclipTri;
		leftNoClipTri.v2.xPos = -leftNoClipTri.v2.wPos * 12.333f;
		unclippedInputTris.push_back(leftNoClipTri);
		static_assert(12.333f < GuardBandXScale, "Error: Out of range test for this guard band!");
	}

	// Outside right edge, inside right guard band:
	{
		triSetupInput rightNoClipTri = goodclipTri;
		rightNoClipTri.v0.xPos = rightNoClipTri.v0.wPos * 2.75f;
		unclippedInputTris.push_back(rightNoClipTri);
		rightNoClipTri = goodclipTri;
		rightNoClipTri.v1.xPos = rightNoClipTri.v1.wPos * 5.5f;
		unclippedInputTris.push_back(rightNoClipTri);
		rightNoClipTri = goodclipTri;
		rightNoClipTri.v2.xPos = rightNoClipTri.v2.wPos * 13.667f;
		unclippedInputTris.push_back(rightNoClipTri);
		static_assert(13.667f < GuardBandXScale, "Error: Out of range test for this guard band!");
	}

	// Outside top edge, inside top guard band:
	{
		triSetupInput topNoClipTri = goodclipTri;
		topNoClipTri.v0.yPos = topNoClipTri.v0.wPos * 2.75f;
		unclippedInputTris.push_back(topNoClipTri);
		topNoClipTri = goodclipTri;
		topNoClipTri.v1.yPos = topNoClipTri.v1.wPos * 5.5f;
		unclippedInputTris.push_back(topNoClipTri);
		topNoClipTri = goodclipTri;
		topNoClipTri.v2.yPos = topNoClipTri.v2.wPos * 13.667f;
		unclippedInputTris.push_back(topNoClipTri);
		static_assert(13.667f < GuardBandYScale, "Error: Out of range test for this guard band!");
	}

	// Outside bottom edge, inside bottom guard band:
	{
		triSetupInput bottomNoClipTri = goodclipTri;
		bottomNoClipTri.v0.yPos = -bottomNoClipTri.v0.wPos * 1.25f;
		unclippedInputTris.push_back(bottomNoClipTri);
		bottomNoClipTri = goodclipTri;
		bottomNoClipTri.v1.yPos = -bottomNoClipTri.v1.wPos * 4.5f;
		unclippedInputTris.push_back(bottomNoClipTri);
		bottomNoClipTri = goodclipTri;
		bottomNoClipTri.v2.yPos = -bottomNoClipTri.v2.wPos * 12.333f;
		unclippedInputTris.push_back(bottomNoClipTri);
		static_assert(12.333f < GuardBandYScale, "Error: Out of range test for this guard band!");
	}

	EmulateCPUClipper(unclippedInputTris, clippedOutputTris);
	SimulateHDLClipper(loader, unclippedInputTris, HDLSimClippedOutputTris, clk, TRISETUP_inNextStageisReady, IA_inPreviousStageIsValid, IA_outPreviousStageIsReady, 
		DBG_CurrentState, DBG_CurrentClipPlane, DBG_CurrentClipBitmask, DBG_ChildTriStackSize, 
		DBG_ClipDistance0, DBG_ClipDistance1,
		DBG_V0PosX, DBG_V0PosY, DBG_V0PosZ, DBG_V0PosW,
		DBG_V1PosX, DBG_V1PosY, DBG_V1PosZ, DBG_V1PosW,
		DBG_V2PosX, DBG_V2PosY, DBG_V2PosZ, DBG_V2PosW,
		DBG_ClipOutcodes0, DBG_ClipOutcodes1, DBG_ClipOutcodes2,
		UpdateFPUs, SetNewPendingInput, UpdateNewOutput);
	if (clippedOutputTris.size() != unclippedInputTris.size() )
	{
		__debugbreak();
	}
	if (HDLSimClippedOutputTris.size() != unclippedInputTris.size() )
	{
		__debugbreak();
	}
	for (unsigned x = 0; x < unclippedInputTris.size(); ++x)
	{
		const triSetupInput& compareBase = unclippedInputTris[x];
		const triSetupInput& compareCPUEmu = clippedOutputTris[x];
		const triSetupInput& compareHDLSim = HDLSimClippedOutputTris[x];
		if (memcmp(&compareBase, &compareCPUEmu, sizeof(triSetupInput) ) != 0)
		{
			__debugbreak();
		}
		if (memcmp(&compareBase, &compareHDLSim, sizeof(triSetupInput) ) != 0)
		{
			__debugbreak();
		}
	}
	unclippedInputTris.clear();

	// Now generate a ton of random triangles, some of which need clipping, some need culling, and others don't need anything:
	for (unsigned x = 0; x < 64; ++x)
	{
		const unsigned randVec = rand();

		triSetupInput newUnclippedTri;
		newUnclippedTri.v0.xPos = frand() * 100.0f;
		newUnclippedTri.v0.yPos = frand() * 100.0f;
		newUnclippedTri.v0.zPos = frand() * 100.0f;
		newUnclippedTri.v0.wPos = frand() * 100.0f;

		newUnclippedTri.v0.xTex = frand();
		newUnclippedTri.v0.yTex = frand();

		newUnclippedTri.v0.rgba.r = frand();
		newUnclippedTri.v0.rgba.g = frand();
		newUnclippedTri.v0.rgba.b = frand();
		newUnclippedTri.v0.rgba.a = 1.0f;

		newUnclippedTri.v1.xPos = frand() * 100.0f;
		newUnclippedTri.v1.yPos = frand() * 100.0f;
		newUnclippedTri.v1.zPos = frand() * 100.0f;
		newUnclippedTri.v1.wPos = frand() * 100.0f;

		newUnclippedTri.v1.xTex = frand();
		newUnclippedTri.v1.yTex = frand();

		newUnclippedTri.v1.rgba.r = frand();
		newUnclippedTri.v1.rgba.g = frand();
		newUnclippedTri.v1.rgba.b = frand();
		newUnclippedTri.v1.rgba.a = 1.0f;

		newUnclippedTri.v2.xPos = frand() * 100.0f;
		newUnclippedTri.v2.yPos = frand() * 100.0f;
		newUnclippedTri.v2.zPos = frand() * 100.0f;
		newUnclippedTri.v2.wPos = frand() * 100.0f;

		newUnclippedTri.v2.xTex = frand();
		newUnclippedTri.v2.yTex = frand();

		newUnclippedTri.v2.rgba.r = frand();
		newUnclippedTri.v2.rgba.g = frand();
		newUnclippedTri.v2.rgba.b = frand();
		newUnclippedTri.v2.rgba.a = 1.0f;

		if (randVec & 0x1) newUnclippedTri.v0.xPos = -newUnclippedTri.v0.xPos;
		if (randVec & 0x2) newUnclippedTri.v0.yPos = -newUnclippedTri.v0.yPos;
		if (randVec & 0x4) newUnclippedTri.v0.zPos = -newUnclippedTri.v0.zPos;
		if (randVec & 0x8) newUnclippedTri.v0.wPos = -newUnclippedTri.v0.wPos;

		if (randVec & 0x10) newUnclippedTri.v1.xPos = -newUnclippedTri.v1.xPos;
		if (randVec & 0x20) newUnclippedTri.v1.yPos = -newUnclippedTri.v1.yPos;
		if (randVec & 0x40) newUnclippedTri.v1.zPos = -newUnclippedTri.v1.zPos;
		if (randVec & 0x80) newUnclippedTri.v1.wPos = -newUnclippedTri.v1.wPos;

		if (randVec & 0x100) newUnclippedTri.v2.xPos = -newUnclippedTri.v2.xPos;
		if (randVec & 0x200) newUnclippedTri.v2.yPos = -newUnclippedTri.v2.yPos;
		if (randVec & 0x400) newUnclippedTri.v2.zPos = -newUnclippedTri.v2.zPos;
		if (randVec & 0x800) newUnclippedTri.v2.wPos = -newUnclippedTri.v2.wPos;

		ApplyProjectionTransform(newUnclippedTri.v0);
		ApplyProjectionTransform(newUnclippedTri.v1);
		ApplyProjectionTransform(newUnclippedTri.v2);

		//if (x == 9)
			unclippedInputTris.push_back(newUnclippedTri);
	}

	EmulateCPUClipper(unclippedInputTris, clippedOutputTris);
	SimulateHDLClipper(loader, unclippedInputTris, HDLSimClippedOutputTris, clk, TRISETUP_inNextStageisReady, IA_inPreviousStageIsValid, IA_outPreviousStageIsReady, 
		DBG_CurrentState, DBG_CurrentClipPlane, DBG_CurrentClipBitmask, DBG_ChildTriStackSize, 
		DBG_ClipDistance0, DBG_ClipDistance1,
		DBG_V0PosX, DBG_V0PosY, DBG_V0PosZ, DBG_V0PosW,
		DBG_V1PosX, DBG_V1PosY, DBG_V1PosZ, DBG_V1PosW,
		DBG_V2PosX, DBG_V2PosY, DBG_V2PosZ, DBG_V2PosW,
		DBG_ClipOutcodes0, DBG_ClipOutcodes1, DBG_ClipOutcodes2,
		UpdateFPUs, SetNewPendingInput, UpdateNewOutput);

	if (HDLSimClippedOutputTris.size() != clippedOutputTris.size() )
	{
		__debugbreak();
	}

	while (true)
	{
		renderWindow->RenderTrianglesBegin();

		static unsigned frameCount = 0;
		++frameCount;
		static unsigned triCount = 0;

		unsigned numOutputTris = (const unsigned)( (frameCount % 3 == 0) ? clippedOutputTris.size() : (frameCount % 3 == 1) ? unclippedInputTris.size() : HDLSimClippedOutputTris.size() );
		for (unsigned x = 0; x < numOutputTris; ++x)
		{
			triSetupInput thisOutputTri = (frameCount % 3 == 0) ? clippedOutputTris[x] : (frameCount % 3 == 1) ? unclippedInputTris[x] : HDLSimClippedOutputTris[x];
			ApplyViewportTransform(thisOutputTri.v0);
			ApplyViewportTransform(thisOutputTri.v1);
			ApplyViewportTransform(thisOutputTri.v2);

			HardwareTriangle2D renderTri;
			renderTri.verts[0].xyzRhw.x = thisOutputTri.v0.xPos;
			renderTri.verts[0].xyzRhw.y = thisOutputTri.v0.yPos;
			renderTri.verts[0].xyzRhw.z = thisOutputTri.v0.zPos;
			renderTri.verts[0].xyzRhw.w = thisOutputTri.v0.wPos;
			renderTri.verts[0].texcoord.x = thisOutputTri.v0.xTex;
			renderTri.verts[0].texcoord.y = thisOutputTri.v0.yTex;
			renderTri.verts[0].diffuse = ConvertColorToD3DCOLOR(thisOutputTri.v0.rgba);

			renderTri.verts[1].xyzRhw.x = thisOutputTri.v1.xPos;
			renderTri.verts[1].xyzRhw.y = thisOutputTri.v1.yPos;
			renderTri.verts[1].xyzRhw.z = thisOutputTri.v1.zPos;
			renderTri.verts[1].xyzRhw.w = thisOutputTri.v1.wPos;
			renderTri.verts[1].texcoord.x = thisOutputTri.v1.xTex;
			renderTri.verts[1].texcoord.y = thisOutputTri.v1.yTex;
			renderTri.verts[1].diffuse = ConvertColorToD3DCOLOR(thisOutputTri.v1.rgba);

			renderTri.verts[2].xyzRhw.x = thisOutputTri.v2.xPos;
			renderTri.verts[2].xyzRhw.y = thisOutputTri.v2.yPos;
			renderTri.verts[2].xyzRhw.z = thisOutputTri.v2.zPos;
			renderTri.verts[2].xyzRhw.w = thisOutputTri.v2.wPos;
			renderTri.verts[2].texcoord.x = thisOutputTri.v2.xTex;
			renderTri.verts[2].texcoord.y = thisOutputTri.v2.yTex;
			renderTri.verts[2].diffuse = ConvertColorToD3DCOLOR(thisOutputTri.v2.rgba);

			renderWindow->RenderTriangle(renderTri);
		}
		renderWindow->RenderTrianglesFinish();

		if (++triCount >= numOutputTris)
			triCount = 0;

		Sleep(128);
	}

	return successResult ? S_OK : E_FAIL;
}
