#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "LargeIndexBufferTest.h"

static bool enablePrints = false;

enum VBBState
{
	readyState, // 0
	fillBatch, // 1
	startupState, // 2
	comparitorState, // 3
	comparitorState2, // 4
	batchInsertState, // 5
	finishAndSubmitBatch, // 6
	finishAndSubmitBatch2, // 7
	submitBatch, // 8
	finishCooldown, // 9
	fillBatch_constantOut // 10
};

struct triangleIndices
{
	unsigned a, b, c;

	const bool operator==(const triangleIndices& rhs) const
	{
		return (a == rhs.a && b == rhs.b && c == rhs.c);
	}

	const bool operator!=(const triangleIndices& rhs) const
	{
		return !(*this == rhs);
	}
};

enum ePrimTopology
{
	pointList = 0, // 0

	lineList, // 1
	lineStrip, // 2

	triList, // 3
	triStrip, // 4
	triFan, // 5

	// Not currently supported:
	quadList // 6
};

enum eIndexFormat
{
	index16 = 0, // 0
	index32, // 1
	index8 // 2
};

struct vertexBatch
{
	vertexBatch()
	{
		ClearBatch();
	}

	const bool IsIndexedDrawBatch() const
	{
		return isDrawCallIndexed;
	}

	// Returns true if the new index is already present in the batch, or false if it is not present yet
	const bool IsIndexInBatch(const unsigned short newIndex) const
	{
		for (unsigned x = 0; x < 16; ++x)
		{
			if (vertexIndices[x] == newIndex)
				return true;
		}
		return false;
	}

	const unsigned char GetBatchRelativeIndexFromPackedIndex(const unsigned char indexSlot) const
	{
		const unsigned byteIndex = indexSlot >> 1;
		const unsigned byteValue = batchRelativeIndices[byteIndex];
		if (indexSlot & 1)
			return byteValue >> 4;
		else
			return byteValue & 0xF;
	}

	void ClearBatch()
	{
		for (unsigned x = 0; x < 16; ++x)
			vertexIndices[x] = 0xFFFF;
		numVerticesInBatch = 0;
		numIndicesInBatch = 0;
		isDrawCallIndexed = false;
		memset(batchRelativeIndices, 0, sizeof(batchRelativeIndices) );
	}

	unsigned short vertexIndices[16];
	unsigned char numVerticesInBatch;
	unsigned char batchRelativeIndices[32];
	unsigned char numIndicesInBatch : 7;
	unsigned char isDrawCallIndexed : 1;
};
static_assert(sizeof(vertexBatch) == (sizeof(unsigned char) * (528 / 8) ), "Error: Unexpected struct size!");

const bool CompareBatchLists(const std::vector<triangleIndices>& lhs, const std::vector<triangleIndices>& rhs)
{
	if (lhs.size() != rhs.size() )
	{
#ifdef _DEBUG
		__debugbreak(); // Mismatched polygon counts!
#endif
		return false;
	}

	const unsigned len = (const unsigned)lhs.size();
	for (unsigned x = 0; x < len; ++x)
	{
		if (lhs[x] != rhs[x])
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return false;
		}
	}

	return true;
}

const std::vector<triangleIndices> SoftwareBatchBuilder(const unsigned* const ibPtr, const eIndexFormat ibFmt, const unsigned startingVertex, const unsigned indexOffset, unsigned numPrimsToRender, const ePrimTopology primType)
{
	switch (primType)
	{
	default:
		__debugbreak(); // Not yet supported!
	case triList:
		break;
	}

	switch (ibFmt)
	{
	default:
		__debugbreak(); // Out of range enum input!
	case index16:
	case index8:
	case index32:
		break;
	}

	std::vector<triangleIndices> ret;
	if (ibPtr) // DrawIndexedPrimitive
	{
		vertexBatch currentBatch;
		currentBatch.ClearBatch();
		unsigned currentIndex = startingVertex;
		triangleIndices newPrim;
		for (unsigned x = 0; x < numPrimsToRender; ++x)
		{

		}
	}
	else // DrawPrimitive
	{
		unsigned currentVertex = startingVertex;
		while (numPrimsToRender > 0)
		{
			const unsigned numPrimsThisBatch = (numPrimsToRender <= 5) ? numPrimsToRender : 5;
			numPrimsToRender -= numPrimsThisBatch;
			for (unsigned x = 0; x < numPrimsThisBatch; ++x)
			{
				triangleIndices newPrim;
				newPrim.a = currentVertex;
				newPrim.b = currentVertex + 1;
				newPrim.c = currentVertex + 2;
				ret.push_back(newPrim);

				currentVertex += 3;
			}
		}
	}

	return ret;
}

const unsigned GetIndexValueFromIndexBuffer(const eIndexFormat ibFmt, const unsigned char* const indexBufferPtr, const unsigned indexIntoIndexBuffer)
{
	switch (ibFmt)
	{
	default:
		__debugbreak();
	case index8:
		return indexBufferPtr[indexIntoIndexBuffer];
	case index16:
	{
		const unsigned short* const ib16 = (const unsigned short* const)indexBufferPtr;
		return ib16[indexIntoIndexBuffer];
	}
	case index32:
	{
		const unsigned* const ib32 = (const unsigned* const)indexBufferPtr;
		return ib32[indexIntoIndexBuffer];
	}
	}
}

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
	std_logic_vector_port<20> CMD_CommandArg1(PD_IN, loader, "CMD_CommandArg1");
	std_logic_vector_port<16> CMD_CommandArg2(PD_IN, loader, "CMD_CommandArg2");
	std_logic_vector_port<3> CMD_CommandArgType(PD_IN, loader, "CMD_CommandArgType");
	std_logic_port CMD_ReadyState(PD_OUT, loader, "CMD_ReadyState");

	std_logic_vector_port<4> DBG_CurrentState(PD_OUT, loader, "DBG_CurrentState");
	std_logic_vector_port<5> DBG_CurrentBatchLength(PD_OUT, loader, "DBG_CurrentBatchLength");
	std_logic_vector_port<7> DBG_CurrentIndexBatchLength(PD_OUT, loader, "DBG_CurrentIndexBatchLength");
	std_logic_vector_port<24> DBG_CurrentBatchRemainingPrims(PD_OUT, loader, "DBG_CurrentBatchRemainingPrims");
	std_logic_vector_port<24> DBG_IndexGeneratorRemainingPrims(PD_OUT, loader, "DBG_IndexGeneratorRemainingPrims");
	std_logic_port DBG_QueueIsFull(PD_OUT, loader, "DBG_QueueIsFull");
	std_logic_port DBG_QueueIsEmpty(PD_OUT, loader, "DBG_QueueIsEmpty");
	std_logic_port DBG_DoneGeneratingIndices(PD_OUT, loader, "DBG_DoneGeneratingIndices");
	std_logic_port DBG_UseConstantOutput(PD_IN, loader, "DBG_UseConstantOutput");

	std_logic_port VERTBATCH_FIFO_full(PD_IN, loader, "VERTBATCH_FIFO_full");
	std_logic_vector_port<528> VERTBATCH_FIFO_wr_data(PD_OUT, loader, "VERTBATCH_FIFO_wr_data");
	std_logic_port VERTBATCH_FIFO_wr_en(PD_OUT, loader, "VERTBATCH_FIFO_wr_en");

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		IBC_ReadReady = false;
		IBC_ReadData = 0x00000000;

		DBG_UseConstantOutput = false;

		CMD_SendCommand = 0;
		CMD_CommandArg0 = 0x00000000;
		CMD_CommandArg1 = 0x00000000;
		CMD_CommandArg2 = 0x0000;
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

	const auto emulatedVertexBatchFIFO = [&VERTBATCH_FIFO_wr_en, &VERTBATCH_FIFO_wr_data](std::vector<triangleIndices>& outputPrims, unsigned& batchCount, const unsigned* const ibPtr, const unsigned char ibFmt, const ePrimTopology primType)
	{
		if (VERTBATCH_FIFO_wr_en.GetBoolVal() )
		{
			if (enablePrints)
				printf("Writing new batch FIFO entry\n");

			vertexBatch newBatch;
			VERTBATCH_FIFO_wr_data.GetStructVal(newBatch);

			++batchCount;

			if (newBatch.numVerticesInBatch <= 0)
			{
				__debugbreak();
			}
			if (newBatch.numIndicesInBatch <= 0)
			{
				__debugbreak();
			}

			if (newBatch.vertexIndices[0] == 0xFFFF)
			{
				__debugbreak(); // The first vertex in a batch should never be -1
			}

			if (newBatch.numIndicesInBatch > 64)
			{
				__debugbreak();
			}

			if (newBatch.numVerticesInBatch > 16)
			{
				__debugbreak();
			}

			for (unsigned x = 0; x < newBatch.numVerticesInBatch; ++x)
			{
				if (newBatch.vertexIndices[x] == 0xFFFF) // -1 should only be used for our valid vertices
				{
					__debugbreak();
				}
			}

			switch (primType)
			{
			case pointList:
				for (unsigned x = 0; x < newBatch.numIndicesInBatch; ++x)
				{
					triangleIndices newPrim;
					const unsigned char batchRelativeIndexA = newBatch.GetBatchRelativeIndexFromPackedIndex(x);
					newPrim.a = newBatch.vertexIndices[batchRelativeIndexA];
					newPrim.b = 0xFFFFFFFF;
					newPrim.c = 0xFFFFFFFF;
					outputPrims.push_back(newPrim);
				}
				break;
			case lineList:
			case lineStrip:
				if (newBatch.numIndicesInBatch % 2 != 0)
				{
					__debugbreak();
				}
				for (unsigned x = 0; x < newBatch.numIndicesInBatch; x += 2)
				{
					triangleIndices newPrim;
					const unsigned char batchRelativeIndexA = newBatch.GetBatchRelativeIndexFromPackedIndex(x);
					const unsigned char batchRelativeIndexB = newBatch.GetBatchRelativeIndexFromPackedIndex(x + 1);
					newPrim.a = newBatch.vertexIndices[batchRelativeIndexA];
					newPrim.b = newBatch.vertexIndices[batchRelativeIndexB];
					newPrim.c = 0xFFFFFFFF;
					outputPrims.push_back(newPrim);
				}
				break;
			default:
#ifdef _DEBUG
				__debugbreak(); // Should never be here!
#endif
			case triList:
			case triStrip:
			case triFan:
				if (newBatch.numIndicesInBatch % 3 != 0)
				{
					__debugbreak();
				}
				for (unsigned x = 0; x < newBatch.numIndicesInBatch; x += 3)
				{
					triangleIndices newPrim;
					const unsigned char batchRelativeIndexA = newBatch.GetBatchRelativeIndexFromPackedIndex(x);
					const unsigned char batchRelativeIndexB = newBatch.GetBatchRelativeIndexFromPackedIndex(x + 1);
					const unsigned char batchRelativeIndexC = newBatch.GetBatchRelativeIndexFromPackedIndex(x + 2);
					newPrim.a = newBatch.vertexIndices[batchRelativeIndexA];
					newPrim.b = newBatch.vertexIndices[batchRelativeIndexB];
					newPrim.c = newBatch.vertexIndices[batchRelativeIndexC];
					outputPrims.push_back(newPrim);
				}
				break;
			}
		}
	};

	const auto drawCommand = [&](const unsigned* const ibPtr, const eIndexFormat ibFmt, const unsigned startingVertex, const unsigned indexOffset, const unsigned numPrimsToRender, const ePrimTopology primType, unsigned& vertexBatchCount) -> std::vector<triangleIndices>
	{
		vertexBatchCount = 0; // Clear out our batch counter

		while (CMD_ReadyState.GetBoolVal() == false) // Wait until the VBB is ready to process another draw call
		{
			scoped_timestep time(loader, clk, 100);
			const VBBState currentState = (const VBBState)DBG_CurrentState.GetUint8Val();
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
			CMD_CommandArg2 = 0x0000; // Base vertex index
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

			const VBBState currentState = (const VBBState)DBG_CurrentState.GetUint8Val();
			const unsigned char currentBatchLength = DBG_CurrentBatchLength.GetUint8Val();
			const unsigned char currentIndexBatchLength = DBG_CurrentIndexBatchLength.GetUint8Val();
			const unsigned currentBatchRemainingPrims = DBG_CurrentBatchRemainingPrims.GetUint32Val();
			const unsigned indexGeneratorRemainingPrims = DBG_IndexGeneratorRemainingPrims.GetUint32Val();
			const bool queueFull = DBG_QueueIsFull.GetBoolVal();
			const bool queueEmpty = DBG_QueueIsEmpty.GetBoolVal();
			const bool doneGeneratingIndices = DBG_DoneGeneratingIndices.GetBoolVal();

			// Emulate the index buffer cache:
			emulatedIndexBufferCache();
			
			if (enablePrints)
				printf("Current state: %u\n", currentState);

			// Emulate the output FIFO
			emulatedVertexBatchFIFO(outputPrims, vertexBatchCount, ibPtr, ibFmt, primType);
		}

		while (VERTBATCH_FIFO_wr_en.GetBoolVal() == true)
		{
			scoped_timestep time(loader, clk, 100);

			emulatedVertexBatchFIFO(outputPrims, vertexBatchCount, ibPtr, ibFmt, primType);
		}

		if (outputPrims.size() != numPrimsToRender)
		{
			__debugbreak(); // Mismatch on number of prims to render and number of prims in the vertex batch
		}

		for (unsigned x = 0; x < numPrimsToRender; ++x)
		{
		switch (primType)
		{
			case pointList:
				if (outputPrims[x].b != 0xFFFF)
				{
					__debugbreak();
				}
				if (outputPrims[x].c != 0xFFFF)
				{
					__debugbreak();
				}
				break;
			case lineList:
			case lineStrip:
				if (outputPrims[x].c != 0xFFFF)
				{
					__debugbreak();
				}
				break;
			default:
#ifdef _DEBUG
				__debugbreak();
#endif
			case triList:
			case triStrip:
			case triFan:
				break;
			}
		}

		if (ibPtr == NULL)
		{
			for (unsigned x = 0; x < numPrimsToRender; ++x)
			{
			switch (primType)
			{
				case pointList:
					if (outputPrims[x].a != x)
					{
						__debugbreak();
					}
					break;
				case lineList:
					if (outputPrims[x].a != x * 2)
					{
						__debugbreak();
					}
					if (outputPrims[x].b != x * 2 + 1)
					{
						__debugbreak();
					}
					break;
				case lineStrip:
					// TODO: Implement check for line list
					break;
				default:
#ifdef _DEBUG
					__debugbreak();
#endif
				case triList:
					if (outputPrims[x].a != x * 3)
					{
						__debugbreak();
					}
					if (outputPrims[x].b != x * 3 + 1)
					{
						__debugbreak();
					}
					if (outputPrims[x].c != x * 3 + 2)
					{
						__debugbreak();
					}
					break;
				case triStrip:
				case triFan:
					// TODO: Implement check for triStrip and triFan
					break;
				}
			}
		}
		else
		{
			const unsigned char* walkIB = (const unsigned char* const)ibPtr;
			for (unsigned x = 0; x < outputPrims.size(); ++x)
			{
				const triangleIndices& currentPrim = outputPrims[x];
				switch (primType)
				{
				case pointList:
					if (GetIndexValueFromIndexBuffer(ibFmt, (const unsigned char* const)ibPtr, x) != currentPrim.a)
					{
						__debugbreak();
					}
					break;
				case lineList:
					if (GetIndexValueFromIndexBuffer(ibFmt, (const unsigned char* const)ibPtr, x * 2) != currentPrim.a)
					{
						__debugbreak();
					}
					if (GetIndexValueFromIndexBuffer(ibFmt, (const unsigned char* const)ibPtr, x * 2 + 1) != currentPrim.b)
					{
						__debugbreak();
					}
					break;
				case lineStrip:
					break;
				default:
#ifdef _DEBUG
					__debugbreak();
#endif
				case triList:
					if (GetIndexValueFromIndexBuffer(ibFmt, (const unsigned char* const)ibPtr, x * 3) != currentPrim.a)
					{
						__debugbreak();
					}
					if (GetIndexValueFromIndexBuffer(ibFmt, (const unsigned char* const)ibPtr, x * 3 + 1) != currentPrim.b)
					{
						__debugbreak();
					}
					if (GetIndexValueFromIndexBuffer(ibFmt, (const unsigned char* const)ibPtr, x * 3 + 2) != currentPrim.c)
					{
						__debugbreak();
					}
					break;
				case triStrip:
				case triFan:
					break;
				}
			}
		}

		/*const std::vector<triangleIndices> softwareBatch = SoftwareBatchBuilder(ibPtr, ibFmt, startingVertex, indexOffset, numPrimsToRender, primType);
		if (!CompareBatchLists(softwareBatch, outputPrims) )
		{
			__debugbreak();
		}*/

		return outputPrims;
	};

	unsigned vertexBatchCount = 0;
	std::vector<triangleIndices> draw0Test = drawCommand(NULL, index16, 0, 0, 2, triList, vertexBatchCount); // DrawPrimitive(D3DPT_TRIANGLELIST, 0, 2);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}
	std::vector<triangleIndices> draw0Test2 = drawCommand(NULL, index16, 0, 0, 1, triList, vertexBatchCount); // DrawPrimitive(D3DPT_TRIANGLELIST, 0, 1);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}
	std::vector<triangleIndices> draw1Test = drawCommand(NULL, index16, 0, 0, 5, triList, vertexBatchCount); // DrawPrimitive(D3DPT_TRIANGLELIST, 0, 5);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}
	std::vector<triangleIndices> draw2Test = drawCommand(NULL, index16, 0, 0, 6, triList, vertexBatchCount); // DrawPrimitive(D3DPT_TRIANGLELIST, 0, 6);
	if (vertexBatchCount != 2)
	{
		__debugbreak();
	}
	std::vector<triangleIndices> draw3Test = drawCommand(NULL, index16, 0, 0, 167, triList, vertexBatchCount); // DrawPrimitive(D3DPT_TRIANGLELIST, 0, 167);
	if (vertexBatchCount != 34)
	{
		__debugbreak();
	}
	std::vector<triangleIndices> draw3Test2 = drawCommand(NULL, index16, 0, 0, 165, triList, vertexBatchCount); // DrawPrimitive(D3DPT_TRIANGLELIST, 0, 165);
	if (vertexBatchCount != 33)
	{
		__debugbreak();
	}

	static const unsigned char minQuadIB[6] = {0, 1, 2, 1, 3, 2};
	std::vector<triangleIndices> draw4Test = drawCommand( (const unsigned* const)&minQuadIB, index8, 0, 0, 2, triList, vertexBatchCount); // SetIndices(minQuadIB); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 4, 0, 2);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}
	static const unsigned short fivePolyIB[15] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14};
	std::vector<triangleIndices> draw5Test = drawCommand( (const unsigned* const)&fivePolyIB, index16, 0, 0, 5, triList, vertexBatchCount); // SetIndices(fivePolyIB); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 15, 0, 5);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}

	static const unsigned short minCubeIB[36] = {/*256 + */0, /*256 +*/ 1, /*256 +*/ 2, 
		512 + 2, 512 + 3, 512 + 0, 
		1024 + 1, 1024 + 5, 1024 + 6, 
		6, 2, 1, 
		7, 6, 5, 
		5, 4, 7, 
		4, 0, 3, 
		3, 7, 4, 
		4, 5, 1, 
		1, 0, 4, 
		3, 2, 6, 
		6, 7, 3};
	std::vector<triangleIndices> draw6Test = drawCommand( (const unsigned* const)&minCubeIB, index16, 0, 0, 12, triList, vertexBatchCount); // SetIndices(minCubeIB); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 8, 0, 12);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}

	static const unsigned short cubeIndices[6 * 6] =
	{
		0, 1, 2,    // side 1
		2, 1, 3,
		4, 0, 6,    // side 2
		6, 0, 2,
		7, 5, 6,    // side 3
		6, 5, 4,
		3, 1, 7,    // side 4
		7, 1, 5,
		4, 5, 0,    // side 5
		2, 7, 6,
		3, 7, 2,    // side 6
		0, 5, 1
	};
	std::vector<triangleIndices> draw6Test2 = drawCommand( (const unsigned* const)&cubeIndices, index16, 0, 0, 12, triList, vertexBatchCount); // SetIndices(cubeIndices); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 8, 0, 12);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}

	// Test case that exactly fits inside of one vertex batch:
	static const unsigned cubeIB32[36] = {0x1000 + 0, 0x1000 + 1, 0x1000 + 2, 
		0x2000 + 2, 0x2000 + 3, 0x2000 + 0, 
		0x4000 + 1, 0x4000 + 5, 6, 
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
	std::vector<triangleIndices> draw7Test = drawCommand( (const unsigned* const)&cubeIB32, index32, 0, 0, 12, triList, vertexBatchCount); // SetIndices(cubeIB32); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 8, 0, 12);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}

	// Test case that uses one too many vertices to fit into one batch and has to get split into two batches:
	static const unsigned cubeIB32_oneTooMany[36] = {0x1000 + 0, 0x1000 + 1, 0x1000 + 2, 
		0x2000 + 2, 0x2000 + 3, 0x2000 + 0, 
		0x4000 + 1, 0x4000 + 5, 0x4000 + 6, 
		6, 2, 1, 
		7, 6, 5, 
		4, 0, 3, // This is the split polygon (only has room to store 2 new verts, but this polygon has 3 new verts)
		5, 4, 7, 
		3, 7, 4, 
		4, 5, 1, 
		1, 0, 4, 
		3, 2, 6, 
		6, 7, 3
	};
	std::vector<triangleIndices> draw7Test1 = drawCommand( (const unsigned* const)&cubeIB32_oneTooMany, index32, 0, 0, 12, triList, vertexBatchCount); // SetIndices(cubeIB32_oneTooMany); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 8, 0, 12);
	if (vertexBatchCount != 2)
	{
		__debugbreak();
	}

	// Test case that uses two too many vertices to fit into one batch and has to get split into two batches:
	static const unsigned cubeIB32_twoTooMany[36] = {0x1000 + 0, 0x1000 + 1, 0x1000 + 2, 
		0x2000 + 2, 0x2000 + 3, 0x2000 + 0, 
		0x4000 + 1, 0x4000 + 5, 0x4000 + 6, 
		6, 2, 1, 
		7, 8, 5, 
		4, 0, 3, // This is the split polygon (only has room to store 1 new vert, but this polygon has 3 new verts)
		5, 4, 7, 
		3, 7, 4, 
		4, 5, 1, 
		1, 0, 4, 
		3, 2, 6, 
		6, 7, 3
	};
	std::vector<triangleIndices> draw7Test2 = drawCommand( (const unsigned* const)&cubeIB32_twoTooMany, index32, 0, 0, 12, triList, vertexBatchCount); // SetIndices(cubeIB32_twoTooMany); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 8, 0, 12);
	if (vertexBatchCount != 2)
	{
		__debugbreak();
	}

	// Test case that uses three too many vertices to fit into one batch and has to get split into two batches:
	static const unsigned cubeIB32_threeTooMany[36] = {0x1000 + 0, 0x1000 + 1, 0x1000 + 2, 
		0x2000 + 2, 0x2000 + 3, 0x2000 + 0, 
		0x4000 + 1, 0x4000 + 5, 0x4000 + 6, 
		6, 2, 1, 
		7, 8, 5, 
		5, 9, 7, 
		4, 0, 3, // This is the split polygon (only has room to store 0 new verts, but this polygon has 3 new verts)
		3, 7, 4, 
		4, 5, 1, 
		1, 0, 4, 
		3, 2, 6, 
		6, 7, 3
	};
	std::vector<triangleIndices> draw7Test3 = drawCommand( (const unsigned* const)&cubeIB32_threeTooMany, index32, 0, 0, 12, triList, vertexBatchCount); // SetIndices(cubeIB32_threeTooMany); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 8, 0, 12);
	if (vertexBatchCount != 2)
	{
		__debugbreak();
	}

	enablePrints = true;
	std::vector<triangleIndices> draw8Test = drawCommand( (const unsigned* const)&largeIB16, index16, 0, 0, 671, triList, vertexBatchCount); // SetIndices(largeIB16); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 874, 0, 671);
	if (vertexBatchCount > 77) // Is this number even true? I think it's just a ballpark guess.
	{
		__debugbreak();
	}

	// This is our high vertex reuse example how we can still draw 21 polys but fit inside the same batch
	static const unsigned short highReuseIB0[63] = {
		0, 1, 2, // 0
		0, 1, 3, // 1
		0, 1, 4, // 2
		1, 2, 3, // 3
		1, 2, 4, // 4
		2, 3, 4, // 5
		3, 4, 5, // 6
		4, 5, 6, // 7
		4, 6, 7, // 8
		4, 6, 8, // 9
		5, 6, 7, // 10
		5, 8, 9, // 11
		6, 10, 11, // 12
		6, 11, 12, // 13
		6, 12, 13, // 14
		7, 8, 9, // 15
		7, 9, 10, // 16
		7, 10, 11, // 17
		7, 12, 13, // 18
		13, 14, 15, // 19
		14, 15, 0, // 20
	};
	std::vector<triangleIndices> draw9Test = drawCommand( (const unsigned* const)&highReuseIB0, index16, 0, 0, 21, triList, vertexBatchCount); // SetIndices(highReuseIB0); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 8, 0, 21);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}

	// This is our test case for what happens when we overflow the index batch but not the vertex batch:
	static const unsigned short highReuseIB1[66] = {
		0, 1, 2, // 0
		0, 1, 3, // 1
		0, 1, 4, // 2
		1, 2, 3, // 3
		1, 2, 4, // 4
		2, 3, 4, // 5
		3, 4, 5, // 6
		4, 5, 6, // 7
		4, 6, 7, // 8
		4, 6, 8, // 9
		5, 6, 7, // 10
		5, 8, 9, // 11
		6, 10, 11, // 12
		6, 11, 12, // 13
		6, 12, 13, // 14
		7, 8, 9, // 15
		7, 9, 10, // 16
		7, 10, 11, // 17
		7, 12, 13, // 18
		13, 14, 15, // 19
		14, 15, 0, // 20
		0, 2, 4, // 21
	};
	std::vector<triangleIndices> draw9Test1 = drawCommand( (const unsigned* const)&highReuseIB1, index16, 0, 0, 22, triList, vertexBatchCount); // SetIndices(highReuseIB1); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 8, 0, 21);
	if (vertexBatchCount != 2)
	{
		__debugbreak();
	}

	static const unsigned short circleIndices[] =
	{
		0, 1, 2,
		0, 2, 3,
		0, 3, 4,
		0, 4, 5,
		0, 5, 6,
		0, 6, 7,
		0, 7, 8,
		0, 8, 9,
		0, 9, 10,
		0, 10, 11,
		0, 11, 12,
		0, 12, 13,
		0, 13, 14,
		0, 14, 15
	};
	std::vector<triangleIndices> draw9Test3 = drawCommand( (const unsigned* const)&circleIndices, index16, 0, 0, 14, triList, vertexBatchCount); // SetIndices(circleIndices); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 15, 0, 14);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}

	// This is our test case for index buffer degenerate triangle culling:
	static const unsigned short highReuseIBDegenerates[69] = {
		0, 1, 2, // 0
		0, 1, 3, // 1
		0, 1, 4, // 2
		1, 2, 3, // 3
		1, 2, 4, // 4
		1, 1, 2, // 5
		2, 3, 4, // 5
		3, 4, 5, // 6
		4, 5, 6, // 7
		4, 6, 7, // 8
		4, 6, 8, // 9
		5, 6, 7, // 10
		5, 8, 9, // 11
		6, 10, 11, // 12
		6, 11, 12, // 13
		6, 15, 6, // 14
		6, 12, 13, // 14
		7, 8, 9, // 15
		7, 9, 10, // 16
		7, 10, 11, // 17
		7, 12, 13, // 18
		13, 14, 15, // 19
		14, 15, 0, // 20
	};
	std::vector<triangleIndices> draw9Test2 = drawCommand( (const unsigned* const)&highReuseIBDegenerates, index16, 0, 0, 23, triList, vertexBatchCount); // SetIndices(highReuseIBDegenerates); DrawIndexedPrimitive(D3DPT_TRIANGLELIST, 0, 0, 8, 0, 23);
	if (vertexBatchCount != 1)
	{
		__debugbreak();
	}

	return S_OK;
}
