#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "../D3DTriRasterizeTestData.h"
#include "PixelPipelineShared.h"
#include <vector>

static unsigned char triDataSlotIndex = 0;

// This rasterization algorithm, while it does work in most cases, is not fully correct with respect to the D3D11 rasterization rules: https://docs.microsoft.com/en-us/windows/win32/direct3d11/d3d10-graphics-programming-guide-rasterizer-stage-rules
void EmulateCPURasterizer(const triSetupOutput& triSetupData, std::vector<rasterizedPixelData>& outRasterizedPixels)
{
	int rowResetBarycentricA = triSetupData.initialBarycentricRowResetA;
	int rowResetBarycentricB = triSetupData.initialBarycentricRowResetB;
	int rowResetBarycentricC = triSetupData.initialBarycentricRowResetC;
	
	int currentBarycentricA = rowResetBarycentricA;
	int currentBarycentricB = rowResetBarycentricB;
	int currentBarycentricC = rowResetBarycentricC;

	const unsigned char topLeftEdgeBiasA = triSetupData.isTopLeftEdgeA ? 0 : 1;
	const unsigned char topLeftEdgeBiasB = triSetupData.isTopLeftEdgeB ? 0 : 1;
	const unsigned char topLeftEdgeBiasC = triSetupData.isTopLeftEdgeC ? 0 : 1;

	for (int y = triSetupData.triBoundsAABB.minY; y <= triSetupData.triBoundsAABB.maxY; ++y)
	{
		// Reset at the next row:
		currentBarycentricA = rowResetBarycentricA;
		currentBarycentricB = rowResetBarycentricB;
		currentBarycentricC = rowResetBarycentricC;

		for (int x = triSetupData.triBoundsAABB.minX; x < triSetupData.triBoundsAABB.maxX; ++x)
		{
			currentBarycentricA += triSetupData.xDeltas.a;
			currentBarycentricB += triSetupData.xDeltas.b;
			currentBarycentricC += triSetupData.xDeltas.c;

			if (currentBarycentricA > -1 && currentBarycentricB > -1 && currentBarycentricC > -1) // If all barycentrics are inside the triangle:
			{
				const int adjustedBarycentricA = currentBarycentricA + topLeftEdgeBiasA;
				const int adjustedBarycentricB = currentBarycentricB + topLeftEdgeBiasB;
				const int adjustedBarycentricC = currentBarycentricC + topLeftEdgeBiasC;

				rasterizedPixelData newPixel;
				newPixel.pixelX = x;
				newPixel.pixelY = y;
				newPixel.barycentricA = adjustedBarycentricA;
				newPixel.barycentricB = adjustedBarycentricB;
				newPixel.barycentricC = adjustedBarycentricC;
				outRasterizedPixels.push_back(newPixel);
			}
		}

		rowResetBarycentricA += triSetupData.yDeltas.a;
		rowResetBarycentricB += triSetupData.yDeltas.b;
		rowResetBarycentricC += triSetupData.yDeltas.c;
	}
}

const int RunTestsRasterizer(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

// Triangle Setup interface begin
	std_logic_port TRISETUP_newTriBegin(PD_IN, loader, "TRISETUP_newTriBegin");
	std_logic_port TRISETUP_readyForNewTri(PD_OUT, loader, "TRISETUP_readyForNewTri");

	std_logic_vector_port<16> TRISETUP_inMinX(PD_IN, loader, "TRISETUP_inMinX");
	std_logic_vector_port<16> TRISETUP_inMaxX(PD_IN, loader, "TRISETUP_inMaxX");
	std_logic_vector_port<16> TRISETUP_inMinY(PD_IN, loader, "TRISETUP_inMinY");
	std_logic_vector_port<16> TRISETUP_inMaxY(PD_IN, loader, "TRISETUP_inMaxY");
	std_logic_vector_port<32> TRISETUP_inInitialBarycentricRowResetA(PD_IN, loader, "TRISETUP_inInitialBarycentricRowResetA");
	std_logic_vector_port<32> TRISETUP_inInitialBarycentricRowResetB(PD_IN, loader, "TRISETUP_inInitialBarycentricRowResetB");
	std_logic_vector_port<32> TRISETUP_inInitialBarycentricRowResetC(PD_IN, loader, "TRISETUP_inInitialBarycentricRowResetC");
	std_logic_port TRISETUP_inIsTopLeftEdgeA(PD_IN, loader, "TRISETUP_inIsTopLeftEdgeA");
	std_logic_port TRISETUP_inIsTopLeftEdgeB(PD_IN, loader, "TRISETUP_inIsTopLeftEdgeB");
	std_logic_port TRISETUP_inIsTopLeftEdgeC(PD_IN, loader, "TRISETUP_inIsTopLeftEdgeC");
	std_logic_vector_port<16> TRISETUP_inBarycentricXDeltaA(PD_IN, loader, "TRISETUP_inBarycentricXDeltaA");
	std_logic_vector_port<16> TRISETUP_inBarycentricXDeltaB(PD_IN, loader, "TRISETUP_inBarycentricXDeltaB");
	std_logic_vector_port<16> TRISETUP_inBarycentricXDeltaC(PD_IN, loader, "TRISETUP_inBarycentricXDeltaC");
	std_logic_vector_port<16> TRISETUP_inBarycentricYDeltaA(PD_IN, loader, "TRISETUP_inBarycentricYDeltaA");
	std_logic_vector_port<16> TRISETUP_inBarycentricYDeltaB(PD_IN, loader, "TRISETUP_inBarycentricYDeltaB");
	std_logic_vector_port<16> TRISETUP_inBarycentricYDeltaC(PD_IN, loader, "TRISETUP_inBarycentricYDeltaC");
	std_logic_vector_port<32> TRISETUP_inBarycentricInverse(PD_IN, loader, "TRISETUP_inBarycentricInverse");

	std_logic_vector_port<32> TRISETUP_inInvZ0(PD_IN, loader, "TRISETUP_inInvZ0");
	std_logic_vector_port<32> TRISETUP_inInvZ1(PD_IN, loader, "TRISETUP_inInvZ1");
	std_logic_vector_port<32> TRISETUP_inInvZ2(PD_IN, loader, "TRISETUP_inInvZ2");

	std_logic_vector_port<16> TRISETUP_inTX0(PD_IN, loader, "TRISETUP_inTX0");
	std_logic_vector_port<16> TRISETUP_inTY0(PD_IN, loader, "TRISETUP_inTY0");
	std_logic_vector_port<16> TRISETUP_inTX1(PD_IN, loader, "TRISETUP_inTX1");
	std_logic_vector_port<16> TRISETUP_inTY1(PD_IN, loader, "TRISETUP_inTY1");
	std_logic_vector_port<16> TRISETUP_inTX2(PD_IN, loader, "TRISETUP_inTX2");
	std_logic_vector_port<16> TRISETUP_inTY2(PD_IN, loader, "TRISETUP_inTY2");

	std_logic_vector_port<32> TRISETUP_inVertColor0(PD_IN, loader, "TRISETUP_inVertColor0");
	std_logic_vector_port<32> TRISETUP_inVertColor1(PD_IN, loader, "TRISETUP_inVertColor1");
	std_logic_vector_port<32> TRISETUP_inVertColor2(PD_IN, loader, "TRISETUP_inVertColor2");
// Triangle Setup interface end

// Rasterizer Output FIFO interface begin
	std_logic_port RASTOUT_FIFO_full(PD_IN, loader, "RASTOUT_FIFO_full");
	std_logic_port RASTOUT_FIFO_almost_full(PD_IN, loader, "RASTOUT_FIFO_almost_full");
	std_logic_vector_port<32+32+32+16+16> RASTOUT_FIFO_wr_data(PD_OUT, loader, "RASTOUT_FIFO_wr_data");
	std_logic_port RASTOUT_FIFO_wr_en(PD_OUT, loader, "RASTOUT_FIFO_wr_en");
// Rasterizer Output FIFO interface end
		
// TriWorkCache interface begin
	std_logic_vector_port<32> TRICACHE_BarycentricInverse(PD_OUT, loader, "TRICACHE_BarycentricInverse");
	std_logic_vector_port<16> TRICACHE_PrimitiveID(PD_OUT, loader, "TRICACHE_PrimitiveID");
	std_logic_vector_port<16> TRICACHE_DrawCallID(PD_OUT, loader, "TRICACHE_DrawCallID");
	std_logic_port TRICACHE_VFACE(PD_OUT, loader, "TRICACHE_VFACE");

	std_logic_vector_port<32> TRICACHE_InvZ0(PD_OUT, loader, "TRICACHE_InvZ0");
	std_logic_vector_port<32> TRICACHE_InvZ1(PD_OUT, loader, "TRICACHE_InvZ1");
	std_logic_vector_port<32> TRICACHE_InvZ2(PD_OUT, loader, "TRICACHE_InvZ2");

	std_logic_vector_port<16> TRICACHE_TX0(PD_OUT, loader, "TRICACHE_TX0");
	std_logic_vector_port<16> TRICACHE_TX1(PD_OUT, loader, "TRICACHE_TX1");
	std_logic_vector_port<16> TRICACHE_TX2(PD_OUT, loader, "TRICACHE_TX2");

	std_logic_vector_port<16> TRICACHE_TY0(PD_OUT, loader, "TRICACHE_TY0");
	std_logic_vector_port<16> TRICACHE_TY1(PD_OUT, loader, "TRICACHE_TY1");
	std_logic_vector_port<16> TRICACHE_TY2(PD_OUT, loader, "TRICACHE_TY2");

	std_logic_vector_port<32> TRICACHE_VertColor0(PD_OUT, loader, "TRICACHE_VertColor0");
	std_logic_vector_port<32> TRICACHE_VertColor1(PD_OUT, loader, "TRICACHE_VertColor1");
	std_logic_vector_port<32> TRICACHE_VertColor2(PD_OUT, loader, "TRICACHE_VertColor2");

	std_logic_port TRICACHE_RequestNewTriSlot(PD_OUT, loader, "TRICACHE_RequestNewTriSlot");
	std_logic_port TRICACHE_NewTriSlotIndexValid(PD_IN, loader, "TRICACHE_NewTriSlotIndexValid");

	std_logic_vector_port<3> TRICACHE_NewTriSlotIndex(PD_IN, loader, "TRICACHE_NewTriSlotIndex");
// TriWorkCache interface end

// Command Processor system interface begin
	std_logic_port CMD_Rasterizer_Idle(PD_OUT, loader, "CMD_Rasterizer_Idle");
// Command Processor system interface end

// Debug signals
	std_logic_vector_port<4> DBG_Rasterizer_State(PD_OUT, loader, "DBG_Rasterizer_State");
	std_logic_vector_port<16> DBG_PixelXPos(PD_OUT, loader, "DBG_PixelXPos");
	std_logic_vector_port<16> DBG_PixelYPos(PD_OUT, loader, "DBG_PixelYPos");
	std_logic_vector_port<32> DBG_BarycentricA(PD_OUT, loader, "DBG_BarycentricA");
	std_logic_vector_port<32> DBG_BarycentricB(PD_OUT, loader, "DBG_BarycentricB");
	std_logic_vector_port<32> DBG_BarycentricC(PD_OUT, loader, "DBG_BarycentricC");

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		RASTOUT_FIFO_full = false;
		RASTOUT_FIFO_almost_full = false;
		TRISETUP_newTriBegin = false;
	}

	auto validateTriCacheData = [&](const triSetupOutput& triData)
	{
		if (TRICACHE_BarycentricInverse.GetFloat32Val() != triData.barycentricInverse ||
			TRICACHE_InvZ0.GetFloat32Val() != triData.v0.invZ ||
			TRICACHE_InvZ1.GetFloat32Val() != triData.v1.invZ ||
			TRICACHE_InvZ2.GetFloat32Val() != triData.v2.invZ ||
			TRICACHE_TX0.GetInt16Val() != triData.v0.xTex ||
			TRICACHE_TX1.GetInt16Val() != triData.v1.xTex ||
			TRICACHE_TX2.GetInt16Val() != triData.v2.xTex ||
			TRICACHE_TY0.GetInt16Val() != triData.v0.yTex ||
			TRICACHE_TY1.GetInt16Val() != triData.v1.yTex ||
			TRICACHE_TY2.GetInt16Val() != triData.v2.yTex ||
			TRICACHE_VertColor0.GetUint32Val() != triData.v0.rgba ||
			TRICACHE_VertColor1.GetUint32Val() != triData.v1.rgba ||
			TRICACHE_VertColor2.GetUint32Val() != triData.v2.rgba)
		{
			__debugbreak();
		}
	};

	auto simulateRasterizer = [&](const triSetupOutput& triData, std::vector<rasterizedPixelData>& outPixelData) -> unsigned
	{
		while (TRISETUP_readyForNewTri.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
		}

		// Pulse the "go signal" on for just one cycle, then turn it off:
		{
			scoped_timestep time(loader, clk, 100);
			TRISETUP_newTriBegin = true;
		}
		TRISETUP_newTriBegin = false;

		unsigned numCyclesToRasterizeFullTriangle = 1;

		while (TRISETUP_readyForNewTri.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);

			++numCyclesToRasterizeFullTriangle;

			/*const signed short pixelX = DBG_PixelXPos.GetInt16Val();
			const signed short pixelY = DBG_PixelYPos.GetInt16Val();
			const int barycentricA = DBG_BarycentricA.GetInt32Val();
			const int barycentricB = DBG_BarycentricB.GetInt32Val();
			const int barycentricC = DBG_BarycentricC.GetInt32Val();
			const unsigned rasterizerState = DBG_Rasterizer_State.GetUint8Val();*/

			if (RASTOUT_FIFO_wr_en.GetBoolVal() )
			{
				rasterizedPixelData newPixelData;
				RASTOUT_FIFO_wr_data.GetStructVal(newPixelData);

				if (newPixelData.pixelX == startNewTriangleSlotCommand || 
					newPixelData.pixelX == finishCurrentTriangleCommand)
				{
					// Ignore in-band triangle command data
				}
				else
				{
					outPixelData.push_back(newPixelData);
				}
			}

			if (TRICACHE_RequestNewTriSlot.GetBoolVal() )
			{
				TRICACHE_NewTriSlotIndexValid = true;
				TRICACHE_NewTriSlotIndex = (triDataSlotIndex++) % 8;
				validateTriCacheData(triData);
			}
			else
			{
				TRICACHE_NewTriSlotIndexValid = false;
			}
		}

		return numCyclesToRasterizeFullTriangle;
	};

	auto runRasterizerTest = [&](const triSetupOutput& triData) -> bool
	{
		std::vector<rasterizedPixelData> simulatedHDLPixels;
		std::vector<rasterizedPixelData> emulatedCPUPixels;
		const unsigned numCyclesToRasterizeWholeTriangle = simulateRasterizer(triData, simulatedHDLPixels);
		EmulateCPURasterizer(triData, emulatedCPUPixels);

		if (simulatedHDLPixels.size() != emulatedCPUPixels.size() )
		{
			__debugbreak();
			return false;
		}

		const unsigned numPixelsRasterized = (const unsigned)emulatedCPUPixels.size();
		for (unsigned x = 0; x < numPixelsRasterized; ++x)
		{
			const rasterizedPixelData& emulatedPixel = emulatedCPUPixels[x];
			const rasterizedPixelData& simulatedPixel = simulatedHDLPixels[x];
			if (emulatedPixel == simulatedPixel)
			{
			}
			else
			{
				__debugbreak();
				return false;
			}
		}

		return true;
	};

	bool successResult = true;

	// Indices are expected to arrive in CCW order:
	auto testSimpleDrawCall = [&](const testVert* const vertices, const unsigned short* const indicesCCW, const unsigned numPrims)
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
			triSetupOutput triSetupData;
			if (EmulateCPUTriSetup(primTriData, triSetupData) != triSetup_OK) // If this fails, then it's because our triangle got culled or clipped or backface-killed or something
			{
				// __debugbreak();
				continue;
			}
			triSetupData.DeserializeTriSetupOutput(TRISETUP_inBarycentricInverse,
				TRISETUP_inInvZ0, TRISETUP_inInvZ1, TRISETUP_inInvZ2,
				TRISETUP_inTX0, TRISETUP_inTX1, TRISETUP_inTX2,
				TRISETUP_inTY0, TRISETUP_inTY1, TRISETUP_inTY2,
				TRISETUP_inVertColor0, TRISETUP_inVertColor1, TRISETUP_inVertColor2,
				TRISETUP_inMinX, TRISETUP_inMinY, TRISETUP_inMaxX, TRISETUP_inMaxY,
				TRISETUP_inInitialBarycentricRowResetA, TRISETUP_inInitialBarycentricRowResetB, TRISETUP_inInitialBarycentricRowResetC,
				TRISETUP_inIsTopLeftEdgeA, TRISETUP_inIsTopLeftEdgeB, TRISETUP_inIsTopLeftEdgeC,
				TRISETUP_inBarycentricXDeltaA, TRISETUP_inBarycentricXDeltaB, TRISETUP_inBarycentricXDeltaC,
				TRISETUP_inBarycentricYDeltaA, TRISETUP_inBarycentricYDeltaB, TRISETUP_inBarycentricYDeltaC);
			successResult &= runRasterizerTest(triSetupData);
		}
	};

	// Try a simple standard triangle first:
	{
		const unsigned short fullTriangle0IB[] = { 0, 1, 2 };
		testSimpleDrawCall(fullTriangle0, fullTriangle0IB, ARRAYSIZE(fullTriangle0IB) / 3);
	}

	// Let's do some triangles that are off the edge of the canvas next to literally test our "edge cases":
	{
		const unsigned short fullTriangleIB[] = { 0, 1, 2 };
		testSimpleDrawCall(triangleOffLeftEdgeZeroPixels, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3);
		testSimpleDrawCall(triangleOffTopEdgeZeroPixels, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3);
		testSimpleDrawCall(triangleOffRightEdgeZeroPixels, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3);
		testSimpleDrawCall(triangleOffBottomEdgeZeroPixels, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3);
	}

	// Next try out an axis-aligned quad made up of two triangles:
	{
		static const unsigned short topLeftFillRuleQuadIndices[] =
		{
			0, 1, 2,
			2, 1, 3
		};
		testSimpleDrawCall(topLeftFillRuleQuad, topLeftFillRuleQuadIndices, ARRAYSIZE(topLeftFillRuleQuadIndices) / 3);
	}

	// Next try two triangles that share an edge:
	{
		static const unsigned short sharedEdgeTrianglesIndices[] =
		{
			0, 1, 2,
			2, 1, 3
		};
		testSimpleDrawCall(twoTrisSharedEdge, sharedEdgeTrianglesIndices, ARRAYSIZE(sharedEdgeTrianglesIndices) / 3);
	}

	// Try another two triangles that share an edge:
	{
		static const unsigned short sharedEdge2TrianglesIndices[] =
		{
			0, 1, 2,
			2, 1, 3
		};
		testSimpleDrawCall(twoTrisSharedEdge2, sharedEdge2TrianglesIndices, ARRAYSIZE(sharedEdge2TrianglesIndices) / 3);
	}

	// How about three triangles that share a single vertex?
	{
		static const unsigned short sharedVertex3TrianglesIndices[] =
		{
			0, 1, 2,
			0, 2, 3,
			0, 3, 4
		};
		testSimpleDrawCall(threeTrisSharedVertex, sharedVertex3TrianglesIndices, ARRAYSIZE(sharedVertex3TrianglesIndices) / 3);
	}

	// Let's try doing 256 random small triangles (about half will get backface culled, and some others may get degenerate triangle culled or clipped off the screen):
	{
		srand(3); // Set a deterministic seed so we get the same results every time
		const unsigned short fullTriangleIB[] = { 0, 1, 2 };
		for (unsigned x = 0; x < 256; ++x)
		{
			testVert verts[3];
			verts[0].posX = ( (rand() % 800) - 80) + 0.5f; // Random xPos between -80 and +720
			verts[0].posY = ( (rand() % 600) - 60) + 0.5f; // Random yPos between -60 and +540

			verts[1].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
			verts[1].posY = verts[0].posY + ( (rand() % 100) - 50); // Random xOffset between -50 and +50

			verts[2].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
			verts[2].posY = verts[0].posY + ( (rand() % 100) - 50); // Random xOffset between -50 and +50

			testSimpleDrawCall(verts, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3);
		}
	}

	// How about one really big triangle that fills half the screen? (Warning: Slow to simulate this many pixels being rasterized!)
	{
		static const unsigned short halfScreenTriangle[] = { 0, 1, 2 };
		testSimpleDrawCall(triangleBottomCornerScreen, halfScreenTriangle, ARRAYSIZE(halfScreenTriangle) / 3);
	}

	// What about one really big triangle that fills the entire screen with how big it is? (Warning: Slow to simulate this many pixels being rasterized!)
	{
		static const unsigned short fullScreenTriangle[] = { 0, 1, 2 };
		testSimpleDrawCall(triangleOffScreenFill, fullScreenTriangle, ARRAYSIZE(fullScreenTriangle) / 3);
	}

	return successResult ? S_OK : E_FAIL;
}
