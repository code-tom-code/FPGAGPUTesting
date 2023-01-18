#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"

#define D3DCOLOR_ARGB(a,r,g,b) ((DWORD)((((a)&0xff)<<24)|(((r)&0xff)<<16)|(((g)&0xff)<<8)|((b)&0xff)))

// Simulate DRAM reads as taking a lot of cycles:
static const unsigned DRAMCyclesForRead = 25u;

struct float3
{
	float x, y, z;
};

struct float2
{
	float x, y;
};

struct InterleavedVertex
{
	float3 pos;
	float3 normal;
	DWORD diffuse;
	float2 texcoord;
};
static_assert(sizeof(InterleavedVertex) == 36, "Error: Unexpected struct size!");

struct InterleavedVertexBreakout
{
	float posX, posY, posZ;
	float normalX, normalY, normalZ;
	unsigned char diffuseR, diffuseG, diffuseB, diffuseA;
	float texcoordX, texcoordY;
};
static_assert(sizeof(InterleavedVertexBreakout) == 36, "Error: Unexpected struct size!");

#include "LargeVertexBufferData.h"
#include "LargeIndexBufferTest.h"

union BRAMCacheType
{
	struct CacheLine
	{
		DWORD dwords[8];
	} cacheLines[128];

	DWORD dwords[1024];
};
static_assert(sizeof(BRAMCacheType) == sizeof(DWORD) * 1024, "Error: Unexpected struct size!");
static_assert(sizeof(BRAMCacheType) == sizeof(BRAMCacheType::CacheLine) * 128, "Error: Unexpected struct size!");
static_assert(sizeof(BRAMCacheType::CacheLine) == sizeof(DWORD) * 8, "Error: Unexpected struct size!");

static BRAMCacheType BRAMCache;

struct DRAMResponse
{
	union _DRAMLine
	{
		DWORD memory32[8];
		uint8_t memory8[32];
	} DRAMLine;
};
static_assert(sizeof(DRAMResponse) == 32, "Error: Unexpected struct size!");

struct DRAMPendingRequest
{
	DWORD address;
	unsigned pendingCycles = 0;
};

static void InitializeVertexStreamsData()
{
	// We only have 30 bits worth of address space here, so we need to check and make sure that
	// none of the pointers we're going to be passing are beyond that limit:
	if (reinterpret_cast<unsigned __int64>(&vertexBufferDataStreams_Position + 1) >= 0x40000000)
	{
		__debugbreak();
	}
	if (reinterpret_cast<unsigned __int64>(&vertexBufferDataStreams_Normal + 1) >= 0x40000000)
	{
		__debugbreak();
	}
	if (reinterpret_cast<unsigned __int64>(&vertexBufferDataStreams_Diffuse + 1) >= 0x40000000)
	{
		__debugbreak();
	}
	if (reinterpret_cast<unsigned __int64>(&vertexBufferDataStreams_Texcoord + 1) >= 0x40000000)
	{
		__debugbreak();
	}
	if (reinterpret_cast<unsigned __int64>(&vertexBufferDataInterleavedBreakout + 1) >= 0x40000000)
	{
		__debugbreak();
	}
	for (unsigned vertexID = 0; vertexID < ARRAYSIZE(vertexBufferDataInterleavedBreakout); ++vertexID)
	{
		vertexBufferDataStreams_Position[vertexID].x = vertexBufferDataInterleavedBreakout[vertexID].posX;
		vertexBufferDataStreams_Position[vertexID].y = vertexBufferDataInterleavedBreakout[vertexID].posY;
		vertexBufferDataStreams_Position[vertexID].z = vertexBufferDataInterleavedBreakout[vertexID].posZ;

		vertexBufferDataStreams_Normal[vertexID].x = vertexBufferDataInterleavedBreakout[vertexID].normalX;
		vertexBufferDataStreams_Normal[vertexID].y = vertexBufferDataInterleavedBreakout[vertexID].normalY;
		vertexBufferDataStreams_Normal[vertexID].z = vertexBufferDataInterleavedBreakout[vertexID].normalZ;

		vertexBufferDataStreams_Diffuse[vertexID] = D3DCOLOR_ARGB(vertexBufferDataInterleavedBreakout[vertexID].diffuseA, vertexBufferDataInterleavedBreakout[vertexID].diffuseB, vertexBufferDataInterleavedBreakout[vertexID].diffuseG, vertexBufferDataInterleavedBreakout[vertexID].diffuseR);

		vertexBufferDataStreams_Texcoord[vertexID].x = vertexBufferDataInterleavedBreakout[vertexID].texcoordX;
		vertexBufferDataStreams_Texcoord[vertexID].y = vertexBufferDataInterleavedBreakout[vertexID].texcoordY;
	}
}

const int RunTestsVertexStreamCache(Xsi::Loader& loader)
{
	InitializeVertexStreamsData();

	// Start everything off at the beginning:
	loader.restart();

	// Vertex Shader Core interfaces begin
	std_logic_port clk(PD_IN, loader, "clk");

	std_logic_port VSC_ReadEnable(PD_IN, loader, "VSC_ReadEnable");
	std_logic_vector_port<3> VSC_ReadStreamIndex(PD_IN, loader, "VSC_ReadStreamIndex");
	std_logic_vector_port<22> VSC_ReadDWORDAddr(PD_IN, loader, "VSC_ReadDWORDAddr");
	std_logic_vector_port<32> VSC_ReadData(PD_OUT, loader, "VSC_ReadData");
	std_logic_port VSC_ReadReady(PD_OUT, loader, "VSC_ReadReady");

	std_logic_port VSC_SetStreamVBAddress(PD_IN, loader, "VSC_SetStreamVBAddress");
	std_logic_vector_port<3> VSC_StreamIndex(PD_IN, loader, "VSC_StreamIndex");
	std_logic_vector_port<30> VSC_StreamVBAddress(PD_IN, loader, "VSC_StreamVBAddress");

	std_logic_port VSC_InvalidateCache(PD_IN, loader, "VSC_InvalidateCache");
	// Vertex Shader Core interfaces end

	// BRAM interface begin
	std_logic_vector_port<10> VertexCache_addra(PD_OUT, loader, "VertexCache_addra");
	std_logic_vector_port<32> VertexCache_dina(PD_OUT, loader, "VertexCache_dina");
	std_logic_vector_port<32> VertexCache_douta(PD_IN, loader, "VertexCache_douta");
	std_logic_port VertexCache_ena(PD_OUT, loader, "VertexCache_ena");
	std_logic_vector_port<1> VertexCache_wea(PD_OUT, loader, "VertexCache_wea");
	// BRAM interface end

	// Memory controller interfaces begin
	std_logic_port VSCReadRequestsFIFO_full(PD_IN, loader, "VSCReadRequestsFIFO_full");
	std_logic_port VSCReadRequestsFIFO_wr_en(PD_OUT, loader, "VSCReadRequestsFIFO_wr_en");
	std_logic_vector_port<30> VSCReadRequestsFIFO_wr_data(PD_OUT, loader, "VSCReadRequestsFIFO_wr_data");

	std_logic_port VSCReadResponsesFIFO_empty(PD_IN, loader, "VSCReadResponsesFIFO_empty");
	std_logic_port VSCReadResponsesFIFO_rd_en(PD_OUT, loader, "VSCReadResponsesFIFO_rd_en");
	std_logic_vector_port<256> VSCReadResponsesFIFO_rd_data(PD_IN, loader, "VSCReadResponsesFIFO_rd_data");
	// Memory controller interfaces end

	// Debug interfaces begin
	std_logic_vector_port<4> DBG_State(PD_OUT, loader, "DBG_State");
	// Debug interfaces end

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		VSC_ReadEnable = false;
		VSC_ReadStreamIndex = 0;
		VSC_ReadDWORDAddr = 0;
		VSC_SetStreamVBAddress = false;
		VSC_StreamIndex = 0;
		VSC_StreamVBAddress = 0;
		VSC_InvalidateCache = false;
		VertexCache_douta = 0;
		VSCReadRequestsFIFO_full = false;
		VSCReadResponsesFIFO_empty = true;

		VSCReadResponsesFIFO_rd_data.SetToZero();
	}

	std::vector<DWORD> DRAMReadRequestsFIFO;
	std::vector<DRAMResponse> DRAMReadResponsesFIFO;
	DRAMResponse DRAMCurrentReadResponse;
	std::vector<DRAMPendingRequest> DRAMPendingRequests;

	unsigned currentState = 0;

	// Let's count the number of DRAM requests (cache misses)
	unsigned DRAMRequestsSent = 0;

	// Count the number of BRAM reads/writes also:
	unsigned BRAMReads = 0;
	unsigned BRAMWrites = 0;

	// Let's count the number of cycles it takes to burn through our simulated draw calls
	unsigned cycles = 0;

	struct BRAMRequest
	{
		bool isWrite;
		uint32_t address;
		uint32_t writeData;
	};

	static const constexpr unsigned BRAM_PIPELINE_LATENCY = 2u;
	BRAMRequest BRAMPipeline[BRAM_PIPELINE_LATENCY] = {0};

	const auto BRAMUpdate = [&]()
	{
		if (VertexCache_ena.GetBoolVal() )
		{
			const uint32_t BRAMAddress = VertexCache_addra.GetUint32Val();
			const bool isWrite = (VertexCache_wea.GetUint8Val() != 0);

			BRAMRequest newRequest;
			newRequest.isWrite = isWrite;
			newRequest.writeData = 0;
			newRequest.address = BRAMAddress;
			if (isWrite)
			{
				const DWORD BRAMWriteData = static_cast<DWORD>(VertexCache_dina.GetUint32Val() );
				newRequest.writeData = BRAMWriteData;
			}
			BRAMPipeline[ARRAYSIZE(BRAMPipeline) - 1] = newRequest;

			if (!BRAMPipeline[0].isWrite) // Read cache
			{
				VertexCache_douta = static_cast<uint32_t>(BRAMCache.dwords[BRAMPipeline[0].address]);
				++BRAMReads;
			}
			else // Write cache
			{
				BRAMCache.dwords[BRAMPipeline[0].address] = BRAMPipeline[0].writeData;
				++BRAMWrites;
			}

			for (unsigned x = 0; x < ARRAYSIZE(BRAMPipeline) - 1; ++x)
			{
				BRAMPipeline[x] = BRAMPipeline[x + 1];
			}
		}
	};

	const auto DRAMUpdate = [&]()
	{
		if (VSCReadRequestsFIFO_wr_en.GetBoolVal() )
		{
			DRAMPendingRequest newPendingRequest;
			newPendingRequest.address = VSCReadRequestsFIFO_wr_data.GetUint32Val();
			newPendingRequest.pendingCycles = 0;
			DRAMPendingRequests.push_back(newPendingRequest);

			++DRAMRequestsSent;
		}

		for (auto iter = DRAMPendingRequests.begin(); iter != DRAMPendingRequests.end();)
		{
			if (iter->pendingCycles > DRAMCyclesForRead)
			{
				DRAMResponse readResponse;
				memcpy(&readResponse.DRAMLine, (const void* const)(iter->address), sizeof(readResponse.DRAMLine) );
				DRAMReadResponsesFIFO.push_back(readResponse);

				iter = DRAMPendingRequests.erase(iter);
			}
			else
			{
				++(iter->pendingCycles);
				++iter;
			}
		}

		if (!DRAMReadResponsesFIFO.empty() )
			DRAMCurrentReadResponse = DRAMReadResponsesFIFO[0];

		VSCReadRequestsFIFO_full = (DRAMReadRequestsFIFO.size() > 2);
		VSCReadResponsesFIFO_empty = DRAMReadResponsesFIFO.empty();
		VSCReadResponsesFIFO_rd_data.SetToByteMemory(&DRAMCurrentReadResponse);

		if (VSCReadResponsesFIFO_rd_en.GetBoolVal() )
		{
			DRAMReadResponsesFIFO.erase(DRAMReadResponsesFIFO.begin() );
		}
	};

	// Let's start our first test by reading out of an interleaved vertex buffer

	// Set up our vertex streams:
	{
		scoped_timestep time(loader, clk, 100);
		VSC_SetStreamVBAddress = true;
		VSC_StreamIndex = 0;
		VSC_StreamVBAddress = reinterpret_cast<uint32_t>(&vertexBufferDataInterleavedBreakout);
	}
	{
		scoped_timestep time(loader, clk, 100);
		VSC_SetStreamVBAddress = false; // Be sure to deassert when we are finished
	}

	// Strobe our cache invalidate signal:
	{
		scoped_timestep time(loader, clk, 100);
		VSC_InvalidateCache = true;
	}
	{
		scoped_timestep time(loader, clk, 100);
		VSC_InvalidateCache = false;
	}

	std::vector<InterleavedVertexBreakout> readInterleavedVerts;
	readInterleavedVerts.resize(ARRAYSIZE(vertexBufferDataInterleavedBreakout) );

	std::vector<bool> readVertOnce;
	readVertOnce.resize(ARRAYSIZE(vertexBufferDataInterleavedBreakout), false);

	static const unsigned DWORDOffsets[] =
	{
		0, 1, 2, // Position
		3, 4, 5, // Normal
		6, // Diffuse
		7, 8 // Texcoord
	};
	static const unsigned interleavedVertexStride = sizeof(InterleavedVertexBreakout);
	static const unsigned interleavedVertexDWORDStride = interleavedVertexStride / sizeof(DWORD);

	for (unsigned indexID = 0; indexID < ARRAYSIZE(largeIB16); ++indexID)
	{
		const unsigned short thisIndex = largeIB16[indexID];
		if (readVertOnce[thisIndex] == true)
			continue;

		InterleavedVertexBreakout* const thisWriteVertex = &(readInterleavedVerts[thisIndex]);

		for (unsigned vertexDWORD = 0; vertexDWORD < ARRAYSIZE(DWORDOffsets); ++vertexDWORD)
		{
			const unsigned thisDWORDOffset = DWORDOffsets[vertexDWORD];

			while (VSC_ReadReady.GetBoolVal() == false)
			{
				scoped_timestep time(loader, clk, 100);
				currentState = DBG_State.GetUint8Val();
				VSC_ReadEnable = true;
				VSC_ReadStreamIndex = 0;
				const unsigned thisDWORDAddr = (thisIndex * interleavedVertexDWORDStride) + thisDWORDOffset;
				VSC_ReadDWORDAddr = thisDWORDAddr;

				BRAMUpdate();
				DRAMUpdate();

				++cycles;
			}
			currentState = DBG_State.GetUint8Val();

			const uint32_t readData = VSC_ReadData.GetUint32Val();
			memcpy( ( (DWORD* const)thisWriteVertex) + thisDWORDOffset, &readData, sizeof(DWORD) );

			while (VSC_ReadReady.GetBoolVal() == true)
			{
				scoped_timestep time(loader, clk, 100);
				currentState = DBG_State.GetUint8Val();
				VSC_ReadEnable = false;

				BRAMUpdate();
				DRAMUpdate();

				++cycles;
			}
			currentState = DBG_State.GetUint8Val();
		}

		readVertOnce[thisIndex] = true;
	}

	for (unsigned verifyVertID = 0; verifyVertID < ARRAYSIZE(vertexBufferDataInterleavedBreakout); ++verifyVertID)
	{
		const InterleavedVertexBreakout* const originalVert = vertexBufferDataInterleavedBreakout + verifyVertID;
		const InterleavedVertexBreakout* const readBackVert = &(readInterleavedVerts[verifyVertID]);
		if (memcmp(originalVert, readBackVert, sizeof(InterleavedVertexBreakout) ) != 0)
		{
			__debugbreak();
		}
	}

	// Clear our output buffers to reset the test data
	readInterleavedVerts.clear();
	readInterleavedVerts.resize(ARRAYSIZE(vertexBufferDataInterleavedBreakout) );
	readVertOnce.clear();
	readVertOnce.resize(ARRAYSIZE(vertexBufferDataInterleavedBreakout), false);
	cycles = 0;
	DRAMRequestsSent = 0;
	BRAMReads = 0;
	BRAMWrites = 0;

	// Let's do another test. This time, with separate vertex streams

	static const unsigned streamIndices[] =
	{
		0, 1, 2, 3
	};

	static const void* const streamSources[] =
	{
		&vertexBufferDataStreams_Position,
		&vertexBufferDataStreams_Normal,
		&vertexBufferDataStreams_Diffuse,
		&vertexBufferDataStreams_Texcoord
	};
	static_assert(ARRAYSIZE(streamIndices) == ARRAYSIZE(streamSources), "Error: Unexpected arrays mismatch!");

	// Set up our vertex streams:
	for (unsigned streamIndex = 0; streamIndex < ARRAYSIZE(streamIndices); ++streamIndex)
	{
		scoped_timestep time(loader, clk, 100);
		VSC_SetStreamVBAddress = true;
		VSC_StreamIndex = streamIndices[streamIndex];
		VSC_StreamVBAddress = reinterpret_cast<uint32_t>(streamSources[streamIndex]);
	}
	{
		scoped_timestep time(loader, clk, 100);
		VSC_SetStreamVBAddress = false; // Be sure to deassert when we are finished
	}

	struct streamOffsetPair
	{
		unsigned streamIndex; // Index of which vertex stream to read from
		unsigned DWORDOffset; // Offset, in DWORD's, from the start of the stream element to this element
		unsigned vertexDwordOffset; // Offset, in DWORD's, from the start of the output vertex to this element
	};

	static const streamOffsetPair vertexDeclPairs[] =
	{
		{0, 0, 0}, {0, 1, 1}, {0, 2, 2}, // Position X, Y, Z
		{1, 0, 3}, {1, 1, 4}, {1, 2, 5}, // Normal X, Y, Z
		{2, 0, 6}, // Diffuse color
		{3, 0, 7}, {3, 1, 8} // Texcoord X, Y
	};

	static const unsigned streamStrideDWORDs[] =
	{
		3,
		3,
		1,
		2
	};

	for (unsigned indexID = 0; indexID < ARRAYSIZE(largeIB16); ++indexID)
	{
		const unsigned short thisIndex = largeIB16[indexID];
		if (readVertOnce[thisIndex] == true)
			continue;

		InterleavedVertexBreakout* const thisWriteVertex = &(readInterleavedVerts[thisIndex]);

		for (unsigned vertexDWORD = 0; vertexDWORD < ARRAYSIZE(vertexDeclPairs); ++vertexDWORD)
		{
			const streamOffsetPair& thisStreamOffsetPair = vertexDeclPairs[vertexDWORD];

			while (VSC_ReadReady.GetBoolVal() == false)
			{
				scoped_timestep time(loader, clk, 100);
				currentState = DBG_State.GetUint8Val();
				VSC_ReadEnable = true;
				VSC_ReadStreamIndex = thisStreamOffsetPair.streamIndex;
				const unsigned thisDWORDAddr = (thisIndex * streamStrideDWORDs[thisStreamOffsetPair.streamIndex]) + thisStreamOffsetPair.DWORDOffset;
				VSC_ReadDWORDAddr = thisDWORDAddr;

				BRAMUpdate();
				DRAMUpdate();

				++cycles;
			}
			currentState = DBG_State.GetUint8Val();

			const uint32_t readData = VSC_ReadData.GetUint32Val();
			memcpy( ( (DWORD* const)thisWriteVertex) + thisStreamOffsetPair.vertexDwordOffset, &readData, sizeof(DWORD) );

			while (VSC_ReadReady.GetBoolVal() == true)
			{
				scoped_timestep time(loader, clk, 100);
				currentState = DBG_State.GetUint8Val();
				VSC_ReadEnable = false;

				BRAMUpdate();
				DRAMUpdate();

				++cycles;
			}
			currentState = DBG_State.GetUint8Val();
		}

		readVertOnce[thisIndex] = true;
	}

	for (unsigned verifyVertID = 0; verifyVertID < ARRAYSIZE(vertexBufferDataInterleavedBreakout); ++verifyVertID)
	{
		const InterleavedVertexBreakout* const originalVert = vertexBufferDataInterleavedBreakout + verifyVertID;
		const InterleavedVertexBreakout* const readBackVert = &(readInterleavedVerts[verifyVertID]);
		if (memcmp(originalVert, readBackVert, sizeof(InterleavedVertexBreakout) ) != 0)
		{
			__debugbreak();
		}
	}

	return S_OK;
}
