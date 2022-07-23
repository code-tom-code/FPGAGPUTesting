#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "LargeIndexBufferTest.h"

static bool enablePrints = false;

struct triangleIndices
{
	unsigned a, b, c;
};

struct vertexBatch
{
	const bool IsIndexedDrawBatch() const
	{
		return batchStartingIndex != batchEndingIndex;
	}

	unsigned short indices[16];
	unsigned short batchStartingIndex; // If batchStartingIndex and batchEndingIndex are the same, then this is a non-indexed draw call
	unsigned short batchEndingIndex;
};
static_assert(sizeof(vertexBatch) == (sizeof(unsigned short) * 16 + sizeof(unsigned short) * 2), "Error: Unexpected struct size!");

const int RunTestsVertexBatchBuilder(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

	std_logic_port IBC_ReadEnable(PD_OUT, loader, "IBC_ReadEnable");
	std_logic_vector_port<30> IBC_ReadAddr(PD_OUT, loader, "IBC_ReadAddr");
	std_logic_vector_port<32> IBC_ReadData(PD_IN, loader, "IBC_ReadData");
	std_logic_port IBC_ReadReady(PD_IN, loader, "IBC_ReadReady");

	std_logic_vector_port<2> CMD_SendCommand(PD_IN, loader, "CMD_SendCommand");
	std_logic_vector_port<32> CMD_CommandArg0(PD_IN, loader, "CMD_CommandArg0");
	std_logic_vector_port<32> CMD_CommandArg1(PD_IN, loader, "CMD_CommandArg1");
	std_logic_vector_port<3> CMD_CommandArgType(PD_IN, loader, "CMD_CommandArgType");
	std_logic_port CMD_ReadyState(PD_OUT, loader, "CMD_ReadyState");

	std_logic_vector_port<4> DBG_CurrentState(PD_OUT, loader, "DBG_CurrentState");
	std_logic_vector_port<5> DBG_CurrentBatchLength(PD_OUT, loader, "DBG_CurrentBatchLength");
	std_logic_vector_port<32> DBG_CurrentBatchRemainingPrims(PD_OUT, loader, "DBG_CurrentBatchRemainingPrims");
	std_logic_vector_port<32> DBG_CurrentIndexID(PD_OUT, loader, "DBG_CurrentIndexID");
	std_logic_vector_port<32> DBG_CurrentIndexIDPlus1(PD_OUT, loader, "DBG_CurrentIndexIDPlus1");
	std_logic_vector_port<32> DBG_CurrentIndexIDPlus2(PD_OUT, loader, "DBG_CurrentIndexIDPlus2");

	std_logic_port VERTBATCH_FIFO_full(PD_IN, loader, "VERTBATCH_FIFO_full");
	std_logic_vector_port<18*16> VERTBATCH_FIFO_wr_data(PD_OUT, loader, "VERTBATCH_FIFO_wr_data");
	std_logic_port VERTBATCH_FIFO_wr_en(PD_OUT, loader, "VERTBATCH_FIFO_wr_en");

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		IBC_ReadReady = false;
		IBC_ReadData = 0x00000000;

		CMD_SendCommand = 0;
		CMD_CommandArg0 = 0x00000000;
		CMD_CommandArg1 = 0x00000000;
		CMD_CommandArgType = 0;

		VERTBATCH_FIFO_full = false;
	}

	const auto emulatedIndexBufferCache = [&IBC_ReadEnable, &IBC_ReadAddr, &IBC_ReadData, &IBC_ReadReady]()
	{
		// TODO: Add random 0-10 cycle delays in here to simulate cache misses
		if (IBC_ReadEnable.GetBoolVal() )
		{
			IBC_ReadReady = true;
			const unsigned readAddr = IBC_ReadAddr.GetUint32Val();
			const unsigned* const indicesAddr = reinterpret_cast<const unsigned* const>(readAddr);
			if (indicesAddr)
			{
				IBC_ReadData = *indicesAddr;
				if (enablePrints)
					printf("Index buffer read address [%u] returns value %u\n", readAddr - (const unsigned)largeIB16, *indicesAddr & 0xFFFF);
			}
			else
			{
				IBC_ReadData = 0x00000000;
			}
		}
		else
		{
			IBC_ReadReady = false;
		}
	};

	const auto emulatedVertexBatchFIFO = [&VERTBATCH_FIFO_wr_en, &VERTBATCH_FIFO_wr_data](std::vector<triangleIndices>& outputPrims, unsigned& batchCount, const unsigned* const ibPtr, const unsigned char ibFmt)
	{
		if (VERTBATCH_FIFO_wr_en.GetBoolVal() )
		{
			if (enablePrints)
				printf("Writing new batch FIFO entry\n");

			vertexBatch newBatch = {0};
			VERTBATCH_FIFO_wr_data.GetStructVal(newBatch);

			++batchCount;

			if (newBatch.IsIndexedDrawBatch() ) // Indexed case:
			{
				const int batchRange = newBatch.batchEndingIndex - newBatch.batchStartingIndex;
				if (batchRange <= 0)
				{
					__debugbreak();
				}
				if (batchRange % 3 != 0)
				{
					__debugbreak();
				}
				// TODO: Support prim types other than triangle lists:
				for (unsigned x = newBatch.batchStartingIndex; x < newBatch.batchEndingIndex; x += 3)
				{
					triangleIndices newTri = {0};
					switch (ibFmt)
					{
					case 0: // IB16
						newTri.a = ( (const unsigned short* const)ibPtr)[x + 0];
						newTri.b = ( (const unsigned short* const)ibPtr)[x + 1];
						newTri.c = ( (const unsigned short* const)ibPtr)[x + 2];
						break;
					case 1: // IB32
						newTri.a = ibPtr[x + 0];
						newTri.b = ibPtr[x + 1];
						newTri.c = ibPtr[x + 2];
						break;
					case 2: // IB8
						newTri.a = ( (const unsigned char* const)ibPtr)[x + 0];
						newTri.b = ( (const unsigned char* const)ibPtr)[x + 1];
						newTri.c = ( (const unsigned char* const)ibPtr)[x + 2];
						break;
					}
					outputPrims.push_back(newTri);
				}
			}
			else // Non-indexed case:
			{
				// TODO: Support prim types other than triangle lists:
				for (unsigned x = 0; x < ARRAYSIZE(newBatch.indices) / 3; ++x)
				{
					triangleIndices newTri = {0};
					newTri.a = newBatch.indices[x * 3 + 0];
					newTri.b = newBatch.indices[x * 3 + 1];
					newTri.c = newBatch.indices[x * 3 + 2];

					if (newTri.a != 0xFFFF && newTri.b != 0xFFFF && newTri.c != 0xFFFF)
						outputPrims.push_back(newTri);
					else if (newTri.a != 0xFFFF || newTri.b != 0xFFFF || newTri.c != 0xFFFF)
					{
						__debugbreak();
					}
				}
				if (newBatch.indices[15] != 0xFFFF)
				{
					__debugbreak(); // For triangle lists, the last index should always be -1
				}
			}
		}
	};

	const auto drawCommand = [&](const unsigned* const ibPtr, const unsigned char ibFmt, const unsigned startingVertex, const unsigned indexOffset, const unsigned numPrimsToRender, const unsigned char primType, unsigned& vertexBatchCount) -> std::vector<triangleIndices>
	{
		vertexBatchCount = 0; // Clear out our batch counter

		while (CMD_ReadyState.GetBoolVal() == false) // Wait until the VBB is ready to process another draw call
		{
			scoped_timestep time(loader, clk, 100);
			const unsigned char currentState = DBG_CurrentState.GetUint8Val();
			printf("");
		}

		if (ibPtr != NULL)
		{
			if ( (const unsigned)ibPtr >= 0x40000000)
			{
				__debugbreak(); // Index buffer pointer out of range!
			}
			scoped_timestep time(loader, clk, 100);
			CMD_SendCommand = 1; // SetIndexBuffer command
			CMD_CommandArg0 = reinterpret_cast<const unsigned>(ibPtr) | ( (ibFmt & 0x3) << 30);
		}

		// Send our draw call command data:
		{
			scoped_timestep time(loader, clk, 100);

			CMD_CommandArg0 = numPrimsToRender;
			CMD_CommandArg1 = startingVertex;
			CMD_CommandArgType = primType;

			if (ibPtr != NULL)
			{
				CMD_SendCommand = 3; // DrawIndexedPrimitive
			}
			else
			{
				CMD_SendCommand = 2; // DrawPrimitive
			}
		}

		CMD_SendCommand = 0; // Reset back to no-op after we've begun the draw call by strobing the draw command for 1 clock cycle

		std::vector<triangleIndices> outputPrims;
		while (CMD_ReadyState.GetBoolVal() == false) // Wait until the VBB is finished processing our draw call
		{
			scoped_timestep time(loader, clk, 100);

			const unsigned char currentState = DBG_CurrentState.GetUint8Val();
			const unsigned char currentBatchLength = DBG_CurrentBatchLength.GetUint8Val();
			const unsigned currentBatchRemainingPrims = DBG_CurrentBatchRemainingPrims.GetUint32Val();
			const unsigned currentIndexID = DBG_CurrentIndexID.GetUint32Val();
			const unsigned currentIndexIDPlus1 = DBG_CurrentIndexIDPlus1.GetUint32Val();
			const unsigned currentIndexIDPlus2 = DBG_CurrentIndexIDPlus2.GetUint32Val();

			// Emulate the index buffer cache:
			emulatedIndexBufferCache();

			if (enablePrints)
				printf("Current state: %u\n", currentState);

			// Emulate the output FIFO
			emulatedVertexBatchFIFO(outputPrims, vertexBatchCount, ibPtr, ibFmt);
		}

		while (VERTBATCH_FIFO_wr_en.GetBoolVal() == true)
		{
			scoped_timestep time(loader, clk, 100);

			emulatedVertexBatchFIFO(outputPrims, vertexBatchCount, ibPtr, ibFmt);
		}

		if (outputPrims.size() != numPrimsToRender)
		{
			__debugbreak(); // Mismatch on number of prims to render and number of prims in the vertex batch
		}

		return outputPrims;
	};

	unsigned vertexBatchCount = 0;
	std::vector<triangleIndices> draw0Test = drawCommand(NULL, 0, 0, 0, 2, 3, vertexBatchCount); // DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}
	std::vector<triangleIndices> draw1Test = drawCommand(NULL, 0, 0, 0, 5, 3, vertexBatchCount); // DrawPrimitive(D3DPT_TRIANGLELIST, 0, 5);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}
	std::vector<triangleIndices> draw2Test = drawCommand(NULL, 0, 0, 0, 6, 3, vertexBatchCount); // DrawPrimitive(D3DPT_TRIANGLELIST, 0, 6);
	if (vertexBatchCount != 2)
	{
		__debugbreak();
	}
	std::vector<triangleIndices> draw3Test = drawCommand(NULL, 0, 0, 0, 167, 3, vertexBatchCount); // DrawPrimitive(D3DPT_TRIANGLELIST, 0, 167);
	if (vertexBatchCount != 34)
	{
		__debugbreak();
	}

	static const unsigned char minQuadIB[6] = {0, 1, 2, 1, 3, 2};
	std::vector<triangleIndices> draw4Test = drawCommand( (const unsigned* const)&minQuadIB, 2, 0, 0, 2, 3, vertexBatchCount); // SetIndices(minQuadIB); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 4, 0, 2);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}
	static const unsigned short fivePolyIB[15] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14};
	std::vector<triangleIndices> draw5Test = drawCommand( (const unsigned* const)&fivePolyIB, 0, 0, 0, 5, 3, vertexBatchCount); // SetIndices(fivePolyIB); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 15, 0, 5);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}

	static const unsigned short minCubeIB[36] = {/*256 +*/ 0, /*256 +*/ 1, /*256 +*/ 2, 
		/*512 +*/ 2, /*512 +*/ 3, /*512 +*/ 0, 
		/*1024 +*/ 1, /*1024 +*/ 5, /*1024 +*/ 6, 
		6, 2, 1, 
		7, 6, 5, 
		5, 4, 7, 
		4, 0, 3, 
		3, 7, 4, 
		4, 5, 1, 
		1, 0, 4, 
		3, 2, 6, 
		6, 7, 3};
	std::vector<triangleIndices> draw6Test = drawCommand( (const unsigned* const)&minCubeIB, 0, 0, 0, 12, 3, vertexBatchCount); // SetIndices(minCubeIB); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 8, 0, 12);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}
	static const unsigned cubeIB32[36] = {0x10000 + 0, 0x10000 + 1, 0x10000 + 2, 
		0x20000 + 2, 0x20000 + 3, 0x20000 + 0, 
		0x40000 + 1, 5, 6, 
		6, 2, 1, 
		7, 6, 5, 
		5, 4, 7, 
		4, 0, 3, 
		3, 7, 4, 
		4, 5, 1, 
		1, 0, 4, 
		3, 2, 6, 
		6, 7, 3
	};
	std::vector<triangleIndices> draw7Test = drawCommand( (const unsigned* const)&cubeIB32, 1, 0, 0, 12, 3, vertexBatchCount); // SetIndices(cubeIB32); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 8, 0, 12);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}

	enablePrints = true;
	std::vector<triangleIndices> draw8Test = drawCommand( (const unsigned* const)&largeIB16, 0, 0, 0, 671, 3, vertexBatchCount); // SetIndices(largeIB16); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 874, 0, 671);
	if (vertexBatchCount < 100) // Is this number even true? I think it's just a ballpark guess.
	{
		__debugbreak();
	}

	return S_OK;
}