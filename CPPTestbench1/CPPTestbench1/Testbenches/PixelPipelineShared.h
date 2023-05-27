#pragma once

enum eSpecialPixelCodeBits
{
	SetNewPrimSlot, // 0
	TerminateCurrentPrimSlot, // 1
	SetNewDrawEventID, // 2
	TerminateCurrentDrawEventID, // 3
	Unused4, // 4
	Unused5, // 5
	Unused6, // 6
	Unused7, // 7
	Unused8, // 8
	Unused9, // 9
	Unused10, // 10
	Unused11, // 11
	Unused12, // 12
	Unused13, // 13
	Unused14, // 14
	SpecialCodeBit // 15
};

const unsigned short PixelMsg_SetNewPrimSlot = 0x8001;
const unsigned short PixelMsg_TermCurrentPrimSlot = 0x8002;
const unsigned short PixelMsg_SetNewDrawEventID = 0x8004;
const unsigned short PixelMsg_TermCurrentDrawEventID = 0x8008;

inline const bool IsSpecialCodePixel(const signed short pixelCoord)
{
	const unsigned short uPixelCoord = (const unsigned short)pixelCoord;
	return (uPixelCoord & (1 << SpecialCodeBit) ) != 0;
}

inline const eSpecialPixelCodeBits GetPixelSpecialCode(const signed short pixelCoord)
{
#ifdef _DEBUG
	if (!IsSpecialCodePixel(pixelCoord) )
	{
		__debugbreak(); // Only call this on pixels that are already known to have the special code bit set!
	}
#endif

	if (pixelCoord & (1 << SetNewPrimSlot) )
		return SetNewPrimSlot;
	else if (pixelCoord & (1 << TerminateCurrentPrimSlot) )
		return TerminateCurrentPrimSlot;
	else if (pixelCoord & (1 << SetNewDrawEventID) )
		return SetNewDrawEventID;
	else if (pixelCoord & (1 << TerminateCurrentDrawEventID) )
		return TerminateCurrentDrawEventID;
	else
	{
#ifdef _DEBUG
		__debugbreak(); // Should never be here! Invalid/unknown pixel special code!
#endif
		return Unused14;
	}
}

inline bool FloatCompareEpsilon(const float a, const float b, const float epsilon)
{
	return fabs(a - b) <= epsilon;
}

struct vertInputClipSpace
{
	const bool operator==(const vertInputClipSpace& rhs) const
	{
		const bool xSame = FloatCompareEpsilon(xPos, rhs.xPos, 1.0f / 1024.0f);
		const bool ySame = FloatCompareEpsilon(yPos, rhs.yPos, 1.0f / 1024.0f);
		const float projectedZ = zPos / wPos;
		const float rhsProjectedZ = rhs.zPos / rhs.wPos;
		const int iprojectedZ = *(const int* const)&projectedZ;
		const int irhsProjectedZ = *(const int* const)&rhsProjectedZ;
		const bool zSame = FloatCompareEpsilon(projectedZ, rhsProjectedZ, 1.0f / 8388608.0f) || abs(iprojectedZ - irhsProjectedZ) <= 128;
		const int iw = *(const int* const)&wPos;
		const int irhsw = *(const int* const)&rhs.wPos;
		const bool wSame = FloatCompareEpsilon(wPos, rhs.wPos, 1.0f / 8388608.0f) || abs(iw - irhsw) <= 128;
		const bool txSame = FloatCompareEpsilon(xTex, rhs.xTex, 1.0f / 1024.0f);
		const bool tySame = FloatCompareEpsilon(yTex, rhs.yTex, 1.0f / 1024.0f);
		const bool rSame = FloatCompareEpsilon(rgba.r, rhs.rgba.r, 1.0f / 256.0f);
		const bool gSame = FloatCompareEpsilon(rgba.g, rhs.rgba.g, 1.0f / 256.0f);
		const bool bSame = FloatCompareEpsilon(rgba.b, rhs.rgba.b, 1.0f / 256.0f);
		const bool aSame = FloatCompareEpsilon(rgba.a, rhs.rgba.a, 1.0f / 256.0f);
		const bool ret = xSame && ySame && 
			zSame && wSame && 
			txSame && tySame && 
			rSame && gSame && bSame && aSame;
		return ret;
	}

	float xPos;
	float yPos;
	float zPos;
	float wPos;
	float xTex;
	float yTex;
	struct _rgba
	{
		float r;
		float g;
		float b;
		float a;
	} rgba;
};

struct vertInputScreenSpace
{
	float xPos;
	float yPos;
	float Z;
	float invW;
	float xTex;
	float yTex;
	struct _rgba
	{
		float r;
		float g;
		float b;
		float a;
	} rgba;
};

// Vertex struct without the xPos or yPos attached
struct vertAttributes
{
	float xTex;
	float yTex;
	float Z;
	float invW;
	struct _rgba
	{
		float r;
		float g;
		float b;
		float a;
	} rgba;

	const bool operator==(const vertAttributes& rhs) const
	{
		return memcmp(this, &rhs, sizeof(*this) ) == 0;
		/*return xTex == rhs.xTex && yTex == rhs.yTex &&
			Z == rhs.Z && invW == rhs.invW &&
			rgba.r == rhs.rgba.r && rgba.g == rhs.rgba.g && rgba.b == rhs.rgba.b && rgba.a == rhs.rgba.a;*/
	}
};

struct triSetupBounds
{
	signed short minX;
	signed short maxX;
	signed short minY;
	signed short maxY;

	const bool operator==(const triSetupBounds& rhs) const
	{
		return (minX == rhs.minX) && 
			(maxX == rhs.maxX) && 
			(minY == rhs.minY) && 
			(maxY == rhs.maxY);
	}
};

struct barycentricDeltas
{
	signed short a;
	signed short b;
	signed short c;

	const bool operator==(const barycentricDeltas& rhs) const
	{
		return (a == rhs.a) && (b == rhs.b) && (c == rhs.c);
	}
};

static const bool IsFloatCloseEnough(const float a, const float b)
{
	const int iDiff = *(const int* const)&a - *(const int* const)&b;
	return abs(iDiff) <= 1;
}

struct triSetupOutput
{
	float barycentricInverse; // 1.0f / twiceTriangleArea
	vertAttributes v0, v10, v20; // Base vertex v0, plus delta vertices v10 (v1 - v0) and v20 (v2 - v0)
	triSetupBounds triBoundsAABB;
	int initialBarycentricRowResetA, initialBarycentricRowResetB, initialBarycentricRowResetC;
	bool isTopLeftEdgeA, isTopLeftEdgeB, isTopLeftEdgeC;
	barycentricDeltas xDeltas, yDeltas;

	const bool operator==(const triSetupOutput& rhs) const
	{
		return IsFloatCloseEnough(barycentricInverse, rhs.barycentricInverse) &&
			v0 == rhs.v0 &&
			v10 == rhs.v10 &&
			v20 == rhs.v20 &&
			triBoundsAABB == rhs.triBoundsAABB &&
			initialBarycentricRowResetA == rhs.initialBarycentricRowResetA &&
			initialBarycentricRowResetB == rhs.initialBarycentricRowResetB &&
			initialBarycentricRowResetC == rhs.initialBarycentricRowResetC &&
			isTopLeftEdgeA == rhs.isTopLeftEdgeA &&
			isTopLeftEdgeB == rhs.isTopLeftEdgeB &&
			isTopLeftEdgeC == rhs.isTopLeftEdgeC &&
			xDeltas == rhs.xDeltas && yDeltas == rhs.yDeltas;
	}

	void SerializeTriSetupOutput(const std_logic_vector_port<32>& outBarycentricInverse,
		const std_logic_vector_port<32>& outZ0, const std_logic_vector_port<32>& outZ10, const std_logic_vector_port<32>& outZ20,
		const std_logic_vector_port<32>& outInvW0, const std_logic_vector_port<32>& outInvW10, const std_logic_vector_port<32>& outInvW20,
		const std_logic_vector_port<32>& outTX0, const std_logic_vector_port<32>& outTX10, const std_logic_vector_port<32>& outTX20,
		const std_logic_vector_port<32>& outTY0, const std_logic_vector_port<32>& outTY10, const std_logic_vector_port<32>& outTY20,
		std_logic_vector_port<128>& outVC0, std_logic_vector_port<128>& outVC10, std_logic_vector_port<128>& outVC20,
		const std_logic_vector_port<16>& outMinX, const std_logic_vector_port<16>& outMinY, const std_logic_vector_port<16>& outMaxX, const std_logic_vector_port<16>& outMaxY,
		const std_logic_vector_port<32>& outBarycentricRowResetA, const std_logic_vector_port<32>& outBarycentricRowResetB, const std_logic_vector_port<32>& outBarycentricRowResetC,
		const std_logic_port& outIsTopLeftEdgeA, const std_logic_port& outIsTopLeftEdgeB, const std_logic_port& outIsTopLeftEdgeC,
		const std_logic_vector_port<16>& outBarycentricXDeltaA, const std_logic_vector_port<16>& outBarycentricXDeltaB, const std_logic_vector_port<16>& outBarycentricXDeltaC,
		const std_logic_vector_port<16>& outBarycentricYDeltaA, const std_logic_vector_port<16>& outBarycentricYDeltaB, const std_logic_vector_port<16>& outBarycentricYDeltaC)
	{
		barycentricInverse = outBarycentricInverse.GetFloat32Val();
		v0.Z = outZ0.GetFloat32Val(); v10.Z = outZ10.GetFloat32Val(); v20.Z = outZ20.GetFloat32Val();
		v0.invW = outInvW0.GetFloat32Val(); v10.invW = outInvW10.GetFloat32Val(); v20.invW = outInvW20.GetFloat32Val();
		v0.xTex = outTX0.GetFloat32Val(); v10.xTex = outTX10.GetFloat32Val(); v20.xTex = outTX20.GetFloat32Val();
		v0.yTex = outTY0.GetFloat32Val(); v10.yTex = outTY10.GetFloat32Val(); v20.yTex = outTY20.GetFloat32Val();
		outVC0.GetStructVal(v0.rgba);
		outVC10.GetStructVal(v10.rgba);
		outVC20.GetStructVal(v20.rgba);
		triBoundsAABB.minX = outMinX.GetInt16Val(); triBoundsAABB.maxX = outMaxX.GetInt16Val();
		triBoundsAABB.minY = outMinY.GetInt16Val(); triBoundsAABB.maxY = outMaxY.GetInt16Val();
		initialBarycentricRowResetA = outBarycentricRowResetA.GetInt32Val(); initialBarycentricRowResetB = outBarycentricRowResetB.GetInt32Val(); initialBarycentricRowResetC = outBarycentricRowResetC.GetInt32Val();
		isTopLeftEdgeA = outIsTopLeftEdgeA.GetBoolVal(); isTopLeftEdgeB = outIsTopLeftEdgeB.GetBoolVal(); isTopLeftEdgeC = outIsTopLeftEdgeC.GetBoolVal();
		xDeltas.a = outBarycentricXDeltaA.GetInt16Val(); xDeltas.b = outBarycentricXDeltaB.GetInt16Val(); xDeltas.c = outBarycentricXDeltaC.GetInt16Val();
		yDeltas.a = outBarycentricYDeltaA.GetInt16Val(); yDeltas.b = outBarycentricYDeltaB.GetInt16Val(); yDeltas.c = outBarycentricYDeltaC.GetInt16Val();
	}

	void DeserializeTriSetupOutput(std_logic_vector_port<32>& inBarycentricInverse,
		std_logic_vector_port<32>& inZ0, std_logic_vector_port<32>& inZ10, std_logic_vector_port<32>& inZ20,
		std_logic_vector_port<32>& inInvW0, std_logic_vector_port<32>& inInvW10, std_logic_vector_port<32>& inInvW20,
		std_logic_vector_port<32>& inTX0, std_logic_vector_port<32>& inTX10, std_logic_vector_port<32>& inTX20,
		std_logic_vector_port<32>& inTY0, std_logic_vector_port<32>& inTY10, std_logic_vector_port<32>& inTY20,
		std_logic_vector_port<128>& inVC0, std_logic_vector_port<128>& inVC10, std_logic_vector_port<128>& inVC20,
		std_logic_vector_port<16>& inMinX, std_logic_vector_port<16>& inMinY, std_logic_vector_port<16>& inMaxX, std_logic_vector_port<16>& inMaxY,
		std_logic_vector_port<32>& inBarycentricRowResetA, std_logic_vector_port<32>& inBarycentricRowResetB, std_logic_vector_port<32>& inBarycentricRowResetC,
		std_logic_port& inIsTopLeftEdgeA, std_logic_port& inIsTopLeftEdgeB, std_logic_port& inIsTopLeftEdgeC,
		std_logic_vector_port<16>& inBarycentricXDeltaA, std_logic_vector_port<16>& inBarycentricXDeltaB, std_logic_vector_port<16>& inBarycentricXDeltaC,
		std_logic_vector_port<16>& inBarycentricYDeltaA, std_logic_vector_port<16>& inBarycentricYDeltaB, std_logic_vector_port<16>& inBarycentricYDeltaC) const
	{
		inBarycentricInverse = barycentricInverse;
		inZ0 = v0.Z; inZ10 = v10.Z; inZ20 = v20.Z;
		inInvW0 = v0.invW; inInvW10 = v10.invW; inInvW20 = v20.invW;
		inTX0 = v0.xTex; inTX10 = v10.xTex; inTX20 = v20.xTex;
		inTY0 = v0.yTex; inTY10 = v10.yTex; inTY20 = v20.yTex;
		inVC0.SetStructVal(v0.rgba);
		inVC10.SetStructVal(v10.rgba);
		inVC20.SetStructVal(v20.rgba);
		inMinX = triBoundsAABB.minX; inMaxX = triBoundsAABB.maxX; inMinY = triBoundsAABB.minY; inMaxY = triBoundsAABB.maxY;
		inBarycentricRowResetA = initialBarycentricRowResetA; inBarycentricRowResetB = initialBarycentricRowResetB; inBarycentricRowResetC = initialBarycentricRowResetC;
		inIsTopLeftEdgeA = isTopLeftEdgeA; inIsTopLeftEdgeB = isTopLeftEdgeB; inIsTopLeftEdgeC = isTopLeftEdgeC;
		inBarycentricXDeltaA = xDeltas.a; inBarycentricXDeltaB = xDeltas.b; inBarycentricXDeltaC = xDeltas.c;
		inBarycentricYDeltaA = yDeltas.a; inBarycentricYDeltaB = yDeltas.b; inBarycentricYDeltaC = yDeltas.c;
	}

	void DeserializeTriSetupOutput(std_logic_vector_port<32>& inBarycentricInverse,
		std_logic_vector_port<32>& inZ0, std_logic_vector_port<32>& inZ10, std_logic_vector_port<32>& inZ20,
		std_logic_vector_port<32>& inInvW0, std_logic_vector_port<32>& inInvW10, std_logic_vector_port<32>& inInvW20,
		std_logic_vector_port<32>& inTX0, std_logic_vector_port<32>& inTX10, std_logic_vector_port<32>& inTX20,
		std_logic_vector_port<32>& inTY0, std_logic_vector_port<32>& inTY10, std_logic_vector_port<32>& inTY20,
		std_logic_vector_port<128>& inVC0, std_logic_vector_port<128>& inVC10, std_logic_vector_port<128>& inVC20) const
	{
		inBarycentricInverse = barycentricInverse;
		inZ0 = v0.Z; inZ10 = v10.Z; inZ20 = v20.Z;
		inInvW0 = v0.invW; inInvW10 = v10.invW; inInvW20 = v20.invW;
		inTX0 = v0.xTex; inTX10 = v10.xTex; inTX20 = v20.xTex;
		inTY0 = v0.yTex; inTY10 = v10.yTex; inTY20 = v20.yTex;
		inVC0.SetStructVal(v0.rgba);
		inVC10.SetStructVal(v10.rgba);
		inVC20.SetStructVal(v20.rgba);
	}

	void DeserializeTriSetupOutput(std_logic_vector_port<32>& inTX0, std_logic_vector_port<32>& inTX10, std_logic_vector_port<32>& inTX20,
		std_logic_vector_port<32>& inTY0, std_logic_vector_port<32>& inTY10, std_logic_vector_port<32>& inTY20,
		std_logic_vector_port<128>& inVC0, std_logic_vector_port<128>& inVC10, std_logic_vector_port<128>& inVC20) const
	{
		inTX0 = v0.xTex; inTX10 = v10.xTex; inTX20 = v20.xTex;
		inTY0 = v0.yTex; inTY10 = v10.yTex; inTY20 = v20.yTex;
		inVC0.SetStructVal(v0.rgba);
		inVC10.SetStructVal(v10.rgba);
		inVC20.SetStructVal(v20.rgba);
	}
};

struct depthInterpOutputData
{
	signed short pixelX;
	signed short pixelY;
	float tx0;
	float tx10;
	float tx20;
	float ty0;
	float ty10;
	float ty20;
	D3DCOLORVALUE vc0;
	D3DCOLORVALUE vc10;
	D3DCOLORVALUE vc20;
	float normalizedBarycentricB;
	float normalizedBarycentricC;
	float interpolatedPixelW;

	void Deserialize(std_logic_vector_port<10>& ATTR_PosX, std_logic_vector_port<10>& ATTR_PosY,
		std_logic_vector_port<32>& ATTR_NormalizedBarycentricB,
		std_logic_vector_port<32>& ATTR_NormalizedBarycentricC,
		std_logic_vector_port<32>& ATTR_OutPixelW) const
	{
		ATTR_PosX = pixelX;
		ATTR_PosY = pixelY;
		ATTR_NormalizedBarycentricB = normalizedBarycentricB;
		ATTR_NormalizedBarycentricC = normalizedBarycentricC;
		ATTR_OutPixelW = interpolatedPixelW;
	}

	void Serialize(const std_logic_vector_port<10>& ATTR_PosX, const std_logic_vector_port<10>& ATTR_PosY,
		const std_logic_vector_port<32>& ATTR_NormalizedBarycentricB,
		const std_logic_vector_port<32>& ATTR_NormalizedBarycentricC,
		const std_logic_vector_port<32>& ATTR_OutPixelW,
		const std_logic_vector_port<24>& DBG_InterpolatedDepthU24)
	{
		pixelX = ATTR_PosX.GetInt16Val();
		pixelY = ATTR_PosY.GetInt16Val();
		normalizedBarycentricB = ATTR_NormalizedBarycentricB.GetFloat32Val();
		normalizedBarycentricC = ATTR_NormalizedBarycentricC.GetFloat32Val();
		interpolatedPixelW = ATTR_OutPixelW.GetFloat32Val();
	}

	inline const bool InterpolatedWCloseEnough(const float rhsInterpolatedW) const
	{
		return abs(*(const int* const)&interpolatedPixelW - *(const int* const)&rhsInterpolatedW) <= 29;
	}

	const bool operator==(const depthInterpOutputData& rhs) const
	{
		// Might need to do float-epsilon comparisons here instead
		return pixelX == rhs.pixelX && pixelY == rhs.pixelY &&
			tx0 == rhs.tx0 && tx10 == rhs.tx10 && tx20 == rhs.tx20 &&
			ty0 == rhs.ty0 && ty10 == rhs.ty10 && ty20 == rhs.ty20 &&
			vc0.r == rhs.vc0.r && vc0.g == rhs.vc0.g && vc0.b == rhs.vc0.b && vc0.a == rhs.vc0.a && 
			vc10.r == rhs.vc10.r && vc10.g == rhs.vc10.g && vc10.b == rhs.vc10.b && vc10.a == rhs.vc10.a && 
			vc20.r == rhs.vc20.r && vc20.g == rhs.vc20.g && vc20.b == rhs.vc20.b && vc20.a == rhs.vc20.a && 
			normalizedBarycentricB == rhs.normalizedBarycentricB && normalizedBarycentricC == rhs.normalizedBarycentricC &&
			InterpolatedWCloseEnough(rhs.interpolatedPixelW);
	}
};

enum triSetupResultType
{
	// Passed triangle culling:
	triSetup_OK,
	triSetup_MULTI,

	// Cull results:
	triSetup_NAN_INF_Cull, // NAN/INF culling on the XYZW position components for each of the vertices
	triSetup_DuplicateVertexCull, // Degenerate triangle culling
	triSetup_ZeroBounds, // Triangle has zero bounds
	triSetup_BackfaceCull, // Triangle is back-facing
	triSetup_ZeroAreaCull, // Triangle has area less than 1 pixel
};

struct triSetupInput
{
	const bool operator==(const triSetupInput& rhs) const
	{
		return v0 == rhs.v0 && v1 == rhs.v1 && v2 == rhs.v2;
	}

	const bool operator!=(const triSetupInput& rhs) const
	{
		return !(*this == rhs);
	}

	vertInputClipSpace v0, v1, v2;
};

struct triSetupScreenspace
{
	vertInputScreenSpace v0, v1, v2;
};

struct rasterizedPixelData
{
	signed long barycentricB;
	signed long barycentricC;
	signed short pixelX;
	signed short pixelY;

	const bool operator==(const rasterizedPixelData& rhs) const
	{
		return (pixelX == rhs.pixelX) && (pixelY == rhs.pixelY) &&
			(barycentricB == rhs.barycentricB) && (barycentricC == rhs.barycentricC);
	}
};
static_assert(sizeof(rasterizedPixelData) == 12, "Error: Unexpected struct packing!");

enum triCacheCommand : signed short
{
	startNewTriangleSlotCommand = -2,
	finishCurrentTriangleCommand = -1
};

struct attributeInterpOutputData
{
	signed short pixelX;
	signed short pixelY;
	unsigned short texcoordX; // Stored in fixed-point unsigned 8.8 format
	unsigned short texcoordY;
	uint32_t vertexColorRGBA;

	void Serialize(const std_logic_vector_port<16>& inPixelX, const std_logic_vector_port<16>& inPixelY,
		const std_logic_vector_port<16>& interpolatedTexcoordX, const std_logic_vector_port<16>& interpolatedTexcoordY,
		const std_logic_vector_port<32>& interpolatedColorRGBA)
	{
		pixelX = inPixelX.GetInt16Val();
		pixelY = inPixelY.GetInt16Val();
		texcoordX = interpolatedTexcoordX.GetUint16Val();
		texcoordY = interpolatedTexcoordY.GetUint16Val();
		vertexColorRGBA = interpolatedColorRGBA.GetUint32Val();
	}

	void Deserialize(std_logic_vector_port<16>& outPixelX, std_logic_vector_port<16>& outPixelY,
		std_logic_vector_port<16>& interpolatedTexcoordX, std_logic_vector_port<16>& interpolatedTexcoordY,
		std_logic_vector_port<32>& interpolatedColorRGBA) const
	{
		outPixelX = pixelX;
		outPixelY = pixelY;
		interpolatedTexcoordX = texcoordX;
		interpolatedTexcoordY = texcoordY;
		interpolatedColorRGBA = vertexColorRGBA;
	}

	const bool operator==(const attributeInterpOutputData& rhs) const
	{
		return (pixelX == rhs.pixelX) && (pixelY == rhs.pixelY) &&
			(abs( (const short)texcoordX - (const short)rhs.texcoordX) <= 2) && (abs( (const short)texcoordY == (const short)rhs.texcoordY) <= 2) &&
			(vertexColorRGBA == rhs.vertexColorRGBA);
	}
};
static_assert(sizeof(attributeInterpOutputData) == 12, "Error: Unexpected struct padding!");

struct texSampOutput
{
	signed short pixelX;
	signed short pixelY;
	unsigned char colorR;
	unsigned char colorG;
	unsigned char colorB;
	unsigned char colorA;

	// Use a non-exact comparison in color channel data to account for minor discrepancies caused by the emulator using floating-point math and the
	// simulator using fixed-point math.
	static const bool ColorChannelCloseEnough(const unsigned char a, const unsigned char b)
	{
		const int delta = (const int)a - (const int)b;
		return abs(delta) <= 2;
	}

	const bool operator==(const texSampOutput& rhs) const
	{
		return (pixelX == rhs.pixelX) && (pixelY == rhs.pixelY) &&
			ColorChannelCloseEnough(colorR, rhs.colorR) && ColorChannelCloseEnough(colorG, rhs.colorG) && ColorChannelCloseEnough(colorB, rhs.colorB) && ColorChannelCloseEnough(colorA, rhs.colorA);
	}

	void Serialize(const std_logic_vector_port<16>& outPixelX, const std_logic_vector_port<16>& outPixelY,
		const std_logic_vector_port<8>& outR, const std_logic_vector_port<8>& outG, const std_logic_vector_port<8>& outB, const std_logic_vector_port<8>& outA)
	{
		pixelX = outPixelX.GetInt16Val();
		pixelY = outPixelY.GetInt16Val();
		colorR = outR.GetUint8Val();
		colorG = outG.GetUint8Val();
		colorB = outB.GetUint8Val();
		colorA = outA.GetUint8Val();
	}

	void Deserialize(std_logic_vector_port<16>& outPixelX, std_logic_vector_port<16>& outPixelY,
		std_logic_vector_port<8>& outR, std_logic_vector_port<8>& outG, std_logic_vector_port<8>& outB, std_logic_vector_port<8>& outA) const
	{
		outPixelX = pixelX;
		outPixelY = pixelY;
		outR = colorR;
		outG = colorG;
		outB = colorB;
		outA = colorA;
	}
};
static_assert(sizeof(texSampOutput) == 8, "Error: Unexpected struct padding!");

// Performs the reverse viewport transform on the data
void UntransformViewport(triSetupInput& inoutTriData);

// Note that the output triangle list may be longer or shorter than the input triangle list!
void EmulateCPUClipper(const std::vector<triSetupInput>& inputUnclippedTriangles, std::vector<triSetupInput>& outputClippedTriangles);

triSetupResultType EmulateCPUTriSetup(const triSetupInput& inTriData, triSetupOutput& outTriSetupOutput);

// This rasterization algorithm, while it does work in most cases, is not fully correct with respect to the D3D11 rasterization rules: https://docs.microsoft.com/en-us/windows/win32/direct3d11/d3d10-graphics-programming-guide-rasterizer-stage-rules
void EmulateCPURasterizer(const triSetupOutput& triSetupData, std::vector<rasterizedPixelData>& outRasterizedPixels);

void EmulateDepthInterpCPU(const triSetupOutput& triSetupData, const std::vector<rasterizedPixelData>& rasterizedPixels, std::vector<depthInterpOutputData>& outDepthInterpData, std::vector<unsigned>& outDebugDepthValues);
void EmulateAttributeInterpCPU(const triSetupOutput& triSetupData, const std::vector<depthInterpOutputData>& depthInterpData, const bool validateNormalizedTexcoords, std::vector<attributeInterpOutputData>& outAttributeInterpData);
void EmulateTexSamplerCPU(const std::vector<attributeInterpOutputData>& interpolatedData, std::vector<texSampOutput>& outTexSampData, const bool useBilinearInterp, const D3DSURFACE_DESC& texDesc, const D3DLOCKED_RECT& d3dlr);
