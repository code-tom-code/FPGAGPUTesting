#pragma once

struct vertInput
{
	signed short xPos;
	signed short yPos;
	unsigned short xTex;
	unsigned short yTex;
	float invZ;
	D3DCOLOR rgba;
};

// Vertex struct without the xPos or yPos
struct vertAttributes
{
	signed short xTex;
	signed short yTex;
	float invZ;
	D3DCOLOR rgba;
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
	vertAttributes v0, v1, v2;
	triSetupBounds triBoundsAABB;
	int initialBarycentricRowResetA, initialBarycentricRowResetB, initialBarycentricRowResetC;
	bool isTopLeftEdgeA, isTopLeftEdgeB, isTopLeftEdgeC;
	barycentricDeltas xDeltas, yDeltas;

	const bool operator==(const triSetupOutput& rhs) const
	{
		return IsFloatCloseEnough(barycentricInverse, rhs.barycentricInverse) &&
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
		const std_logic_vector_port<32>& outInvZ0, const std_logic_vector_port<32>& outInvZ1, const std_logic_vector_port<32>& outInvZ2,
		const std_logic_vector_port<16>& outTX0, const std_logic_vector_port<16>& outTX1, const std_logic_vector_port<16>& outTX2,
		const std_logic_vector_port<16>& outTY0, const std_logic_vector_port<16>& outTY1, const std_logic_vector_port<16>& outTY2,
		const std_logic_vector_port<32>& outVC0, const std_logic_vector_port<32>& outVC1, const std_logic_vector_port<32>& outVC2,
		const std_logic_vector_port<16>& outMinX, const std_logic_vector_port<16>& outMinY, const std_logic_vector_port<16>& outMaxX, const std_logic_vector_port<16>& outMaxY,
		const std_logic_vector_port<32>& outBarycentricRowResetA, const std_logic_vector_port<32>& outBarycentricRowResetB, const std_logic_vector_port<32>& outBarycentricRowResetC,
		const std_logic_port& outIsTopLeftEdgeA, const std_logic_port& outIsTopLeftEdgeB, const std_logic_port& outIsTopLeftEdgeC,
		const std_logic_vector_port<16>& outBarycentricXDeltaA, const std_logic_vector_port<16>& outBarycentricXDeltaB, const std_logic_vector_port<16>& outBarycentricXDeltaC,
		const std_logic_vector_port<16>& outBarycentricYDeltaA, const std_logic_vector_port<16>& outBarycentricYDeltaB, const std_logic_vector_port<16>& outBarycentricYDeltaC)
	{
		barycentricInverse = outBarycentricInverse.GetFloat32Val();
		v0.invZ = outInvZ0.GetFloat32Val(); v1.invZ = outInvZ1.GetFloat32Val(); v2.invZ = outInvZ2.GetFloat32Val();
		v0.xTex = outTX0.GetInt16Val(); v1.xTex = outTX1.GetInt16Val(); v2.xTex = outTX2.GetInt16Val();
		v0.yTex = outTY0.GetInt16Val(); v1.yTex = outTY1.GetInt16Val(); v2.yTex = outTY2.GetInt16Val();
		v0.rgba = outVC0.GetUint32Val(); v1.rgba = outVC1.GetUint32Val(); v2.rgba = outVC2.GetUint32Val();
		triBoundsAABB.minX = outMinX.GetInt16Val(); triBoundsAABB.maxX = outMaxX.GetInt16Val();
		triBoundsAABB.minY = outMinY.GetInt16Val(); triBoundsAABB.maxY = outMaxY.GetInt16Val();
		initialBarycentricRowResetA = outBarycentricRowResetA.GetInt32Val(); initialBarycentricRowResetB = outBarycentricRowResetB.GetInt32Val(); initialBarycentricRowResetC = outBarycentricRowResetC.GetInt32Val();
		isTopLeftEdgeA = outIsTopLeftEdgeA.GetBoolVal(); isTopLeftEdgeB = outIsTopLeftEdgeB.GetBoolVal(); isTopLeftEdgeC = outIsTopLeftEdgeC.GetBoolVal();
		xDeltas.a = outBarycentricXDeltaA.GetInt16Val(); xDeltas.b = outBarycentricXDeltaB.GetInt16Val(); xDeltas.c = outBarycentricXDeltaC.GetInt16Val();
		yDeltas.a = outBarycentricYDeltaA.GetInt16Val(); yDeltas.b = outBarycentricYDeltaB.GetInt16Val(); yDeltas.c = outBarycentricYDeltaC.GetInt16Val();
	}

	void DeserializeTriSetupOutput(std_logic_vector_port<32>& inBarycentricInverse,
		std_logic_vector_port<32>& inInvZ0, std_logic_vector_port<32>& inInvZ1, std_logic_vector_port<32>& inInvZ2,
		std_logic_vector_port<16>& inTX0, std_logic_vector_port<16>& inTX1, std_logic_vector_port<16>& inTX2,
		std_logic_vector_port<16>& inTY0, std_logic_vector_port<16>& inTY1, std_logic_vector_port<16>& inTY2,
		std_logic_vector_port<32>& inVC0, std_logic_vector_port<32>& inVC1, std_logic_vector_port<32>& inVC2,
		std_logic_vector_port<16>& inMinX, std_logic_vector_port<16>& inMinY, std_logic_vector_port<16>& inMaxX, std_logic_vector_port<16>& inMaxY,
		std_logic_vector_port<32>& inBarycentricRowResetA, std_logic_vector_port<32>& inBarycentricRowResetB, std_logic_vector_port<32>& inBarycentricRowResetC,
		std_logic_port& inIsTopLeftEdgeA, std_logic_port& inIsTopLeftEdgeB, std_logic_port& inIsTopLeftEdgeC,
		std_logic_vector_port<16>& inBarycentricXDeltaA, std_logic_vector_port<16>& inBarycentricXDeltaB, std_logic_vector_port<16>& inBarycentricXDeltaC,
		std_logic_vector_port<16>& inBarycentricYDeltaA, std_logic_vector_port<16>& inBarycentricYDeltaB, std_logic_vector_port<16>& inBarycentricYDeltaC) const
	{
		inBarycentricInverse = barycentricInverse;
		inInvZ0 = v0.invZ; inInvZ1 = v1.invZ; inInvZ2 = v2.invZ;
		inTX0 = v0.xTex; inTX1 = v1.xTex; inTX2 = v2.xTex;
		inTY0 = v0.yTex; inTY1 = v1.yTex; inTY2 = v2.yTex;
		inVC0 = static_cast<uint32_t>(v0.rgba); inVC1 = static_cast<uint32_t>(v1.rgba); inVC2 = static_cast<uint32_t>(v2.rgba);
		inMinX = triBoundsAABB.minX; inMaxX = triBoundsAABB.maxX; inMinY = triBoundsAABB.minY; inMaxY = triBoundsAABB.maxY;
		inBarycentricRowResetA = initialBarycentricRowResetA; inBarycentricRowResetB = initialBarycentricRowResetB; inBarycentricRowResetC = initialBarycentricRowResetC;
		inIsTopLeftEdgeA = isTopLeftEdgeA; inIsTopLeftEdgeB = isTopLeftEdgeB; inIsTopLeftEdgeC = isTopLeftEdgeC;
		inBarycentricXDeltaA = xDeltas.a; inBarycentricXDeltaB = xDeltas.b; inBarycentricXDeltaC = xDeltas.c;
		inBarycentricYDeltaA = yDeltas.a; inBarycentricYDeltaB = yDeltas.b; inBarycentricYDeltaC = yDeltas.c;
	}

	void DeserializeTriSetupOutput(std_logic_vector_port<32>& inBarycentricInverse,
		std_logic_vector_port<32>& inInvZ0, std_logic_vector_port<32>& inInvZ1, std_logic_vector_port<32>& inInvZ2,
		std_logic_vector_port<16>& inTX0, std_logic_vector_port<16>& inTX1, std_logic_vector_port<16>& inTX2,
		std_logic_vector_port<16>& inTY0, std_logic_vector_port<16>& inTY1, std_logic_vector_port<16>& inTY2,
		std_logic_vector_port<32>& inVC0, std_logic_vector_port<32>& inVC1, std_logic_vector_port<32>& inVC2) const
	{
		inBarycentricInverse = barycentricInverse;
		inInvZ0 = v0.invZ; inInvZ1 = v1.invZ; inInvZ2 = v2.invZ;
		inTX0 = v0.xTex; inTX1 = v1.xTex; inTX2 = v2.xTex;
		inTY0 = v0.yTex; inTY1 = v1.yTex; inTY2 = v2.yTex;
		inVC0 = static_cast<uint32_t>(v0.rgba); inVC1 = static_cast<uint32_t>(v1.rgba); inVC2 = static_cast<uint32_t>(v2.rgba);
	}

	void DeserializeTriSetupOutput(std_logic_vector_port<16>& inTX0, std_logic_vector_port<16>& inTX1, std_logic_vector_port<16>& inTX2,
		std_logic_vector_port<16>& inTY0, std_logic_vector_port<16>& inTY1, std_logic_vector_port<16>& inTY2,
		std_logic_vector_port<32>& inVC0, std_logic_vector_port<32>& inVC1, std_logic_vector_port<32>& inVC2) const
	{
		inTX0 = v0.xTex; inTX1 = v1.xTex; inTX2 = v2.xTex;
		inTY0 = v0.yTex; inTY1 = v1.yTex; inTY2 = v2.yTex;
		inVC0 = static_cast<uint32_t>(v0.rgba); inVC1 = static_cast<uint32_t>(v1.rgba); inVC2 = static_cast<uint32_t>(v2.rgba);
	}
};

struct depthInterpOutputData
{
	signed short pixelX;
	signed short pixelY;
	float interpolatedPixelDepth;
	float normalizedBarycentricDivZ0;
	float normalizedBarycentricDivZ1;
	float normalizedBarycentricDivZ2;

	void Deserialize(std_logic_vector_port<10>& ATTR_PosX, std_logic_vector_port<10>& ATTR_PosY,
		std_logic_vector_port<32>& ATTR_NormalizedBarycentricDivZ0,
		std_logic_vector_port<32>& ATTR_NormalizedBarycentricDivZ1,
		std_logic_vector_port<32>& ATTR_NormalizedBarycentricDivZ2,
		std_logic_vector_port<32>& ATTR_OutPixelDepth) const
	{
		ATTR_PosX = pixelX;
		ATTR_PosY = pixelY;
		ATTR_NormalizedBarycentricDivZ0 = normalizedBarycentricDivZ0;
		ATTR_NormalizedBarycentricDivZ1 = normalizedBarycentricDivZ1;
		ATTR_NormalizedBarycentricDivZ2 = normalizedBarycentricDivZ2;
		ATTR_OutPixelDepth = interpolatedPixelDepth;
	}

	void Serialize(const std_logic_vector_port<10>& ATTR_PosX, const std_logic_vector_port<10>& ATTR_PosY,
		const std_logic_vector_port<32>& ATTR_NormalizedBarycentricDivZ0,
		const std_logic_vector_port<32>& ATTR_NormalizedBarycentricDivZ1,
		const std_logic_vector_port<32>& ATTR_NormalizedBarycentricDivZ2,
		const std_logic_vector_port<32>& ATTR_OutPixelDepth)
	{
		pixelX = ATTR_PosX.GetInt16Val();
		pixelY = ATTR_PosY.GetInt16Val();
		normalizedBarycentricDivZ0 = ATTR_NormalizedBarycentricDivZ0.GetFloat32Val();
		normalizedBarycentricDivZ1 = ATTR_NormalizedBarycentricDivZ1.GetFloat32Val();
		normalizedBarycentricDivZ2 = ATTR_NormalizedBarycentricDivZ2.GetFloat32Val();
		interpolatedPixelDepth = ATTR_OutPixelDepth.GetFloat32Val();
	}

	const bool operator==(const depthInterpOutputData& rhs) const
	{
		// Might need to do float-epsilon comparisons here instead
		return pixelX == rhs.pixelX && pixelY == rhs.pixelY &&
			interpolatedPixelDepth == rhs.interpolatedPixelDepth &&
			normalizedBarycentricDivZ0 == rhs.normalizedBarycentricDivZ0 && normalizedBarycentricDivZ1 == rhs.normalizedBarycentricDivZ1 && normalizedBarycentricDivZ2 == rhs.normalizedBarycentricDivZ2;
	}
};

enum triSetupResultType
{
	// Passed triangle culling:
	triSetup_OK,

	// Cull results:
	triSetup_DuplicateVertexCull, // Degenerate triangle culling
	triSetup_CulledZClip, // Triangle intersects near or far clip planes. We need to cull it because we don't support clipping currently.
	triSetup_ZeroBounds, // Triangle has zero bounds
	triSetup_BackfaceCull, // Triangle is back-facing
	triSetup_ZeroAreaCull, // Triangle has area less than 1 pixel
};

struct triSetupInput
{
	vertInput v0, v1, v2;
};

struct rasterizedPixelData
{
	signed long barycentricA;
	signed long barycentricB;
	signed long barycentricC;
	signed short pixelX;
	signed short pixelY;

	const bool operator==(const rasterizedPixelData& rhs) const
	{
		return (pixelX == rhs.pixelX) && (pixelY == rhs.pixelY) &&
			(barycentricA == rhs.barycentricA) && (barycentricB == rhs.barycentricB) && (barycentricC == rhs.barycentricC);
	}
};
static_assert(sizeof(rasterizedPixelData) == 16, "Error: Unexpected struct packing!");

enum triCacheCommand : signed short
{
	startNewTriangleSlotCommand = -2,
	finishCurrentTriangleCommand = -1
};

struct attributeInterpOutputData
{
	signed short pixelX;
	signed short pixelY;
	unsigned short texcoordX;
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
			(texcoordX == rhs.texcoordX) && (texcoordY == rhs.texcoordY) &&
			(vertexColorRGBA == rhs.vertexColorRGBA);
	}
};

triSetupResultType EmulateCPUTriSetup(const triSetupInput& inTriData, triSetupOutput& outTriSetupOutput);

// This rasterization algorithm, while it does work in most cases, is not fully correct with respect to the D3D11 rasterization rules: https://docs.microsoft.com/en-us/windows/win32/direct3d11/d3d10-graphics-programming-guide-rasterizer-stage-rules
void EmulateCPURasterizer(const triSetupOutput& triSetupData, std::vector<rasterizedPixelData>& outRasterizedPixels);

void EmulateDepthInterpCPU(const triSetupOutput& triSetupData, const std::vector<rasterizedPixelData>& rasterizedPixels, std::vector<depthInterpOutputData>& outDepthInterpData);
void EmulateAttributeInterpCPU(const triSetupOutput& triSetupData, const std::vector<depthInterpOutputData>& depthInterpData, std::vector<attributeInterpOutputData>& outAttributeInterpData);
