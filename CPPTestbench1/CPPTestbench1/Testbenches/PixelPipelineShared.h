#pragma once

struct vertInput
{
	float xPos;
	float yPos;
	float invZ;
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
	float invZ;
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
		return xTex == rhs.xTex && yTex == rhs.yTex &&
			invZ == rhs.invZ && invW == rhs.invW &&
			rgba.r == rhs.rgba.r && rgba.g == rhs.rgba.g && rgba.b == rhs.rgba.b && rgba.a == rhs.rgba.a;
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
		const std_logic_vector_port<32>& outInvZ0, const std_logic_vector_port<32>& outInvZ10, const std_logic_vector_port<32>& outInvZ20,
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
		v0.invZ = outInvZ0.GetFloat32Val(); v10.invZ = outInvZ10.GetFloat32Val(); v20.invZ = outInvZ20.GetFloat32Val();
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
		std_logic_vector_port<32>& inInvZ0, std_logic_vector_port<32>& inInvZ10, std_logic_vector_port<32>& inInvZ20,
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
		inInvZ0 = v0.invZ; inInvZ10 = v10.invZ; inInvZ20 = v20.invZ;
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
		std_logic_vector_port<32>& inInvZ0, std_logic_vector_port<32>& inInvZ10, std_logic_vector_port<32>& inInvZ20,
		std_logic_vector_port<32>& inInvW0, std_logic_vector_port<32>& inInvW10, std_logic_vector_port<32>& inInvW20,
		std_logic_vector_port<32>& inTX0, std_logic_vector_port<32>& inTX10, std_logic_vector_port<32>& inTX20,
		std_logic_vector_port<32>& inTY0, std_logic_vector_port<32>& inTY10, std_logic_vector_port<32>& inTY20,
		std_logic_vector_port<128>& inVC0, std_logic_vector_port<128>& inVC10, std_logic_vector_port<128>& inVC20) const
	{
		inBarycentricInverse = barycentricInverse;
		inInvZ0 = v0.invZ; inInvZ10 = v10.invZ; inInvZ20 = v20.invZ;
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
	float interpolatedPixelW;
	float normalizedBarycentricB;
	float normalizedBarycentricC;

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
		const std_logic_vector_port<32>& ATTR_OutPixelW)
	{
		pixelX = ATTR_PosX.GetInt16Val();
		pixelY = ATTR_PosY.GetInt16Val();
		normalizedBarycentricB = ATTR_NormalizedBarycentricB.GetFloat32Val();
		normalizedBarycentricC = ATTR_NormalizedBarycentricC.GetFloat32Val();
		interpolatedPixelW = ATTR_OutPixelW.GetFloat32Val();
	}

	const bool operator==(const depthInterpOutputData& rhs) const
	{
		// Might need to do float-epsilon comparisons here instead
		return pixelX == rhs.pixelX && pixelY == rhs.pixelY &&
			interpolatedPixelW == rhs.interpolatedPixelW &&
			normalizedBarycentricB == rhs.normalizedBarycentricB && normalizedBarycentricC == rhs.normalizedBarycentricC;
	}
};

enum triSetupResultType
{
	// Passed triangle culling:
	triSetup_OK,

	// Cull results:
	triSetup_NAN_INF_Cull, // NAN/INF culling on the XYZW position components for each of the vertices
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
