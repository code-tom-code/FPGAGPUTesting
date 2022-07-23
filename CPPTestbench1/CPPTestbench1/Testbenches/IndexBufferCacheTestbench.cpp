#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"

struct memResponse
{
	BYTE data[32];
	uint32_t requestAddr;
};
static_assert(sizeof(memResponse) == 32 + 4, "Error: Unexpected struct size!");

const int RunTestsIndexBufferCache(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

	std_logic_port VBB_ReadEnable(PD_IN, loader, "VBB_ReadEnable");
	std_logic_vector_port<30> VBB_ReadAddr(PD_IN, loader, "VBB_ReadAddr");
	std_logic_vector_port<32> VBB_ReadData(PD_OUT, loader, "VBB_ReadData");
	std_logic_port VBB_ReadReady(PD_OUT, loader, "VBB_ReadReady");
	std_logic_vector_port<2> DBG_State(PD_OUT, loader, "DBG_State");

	std_logic_port IBCReadRequestsFIFO_full(PD_IN, loader, "IBCReadRequestsFIFO_full");
	std_logic_vector_port<30> IBCReadRequestsFIFO_wr_data(PD_OUT, loader, "IBCReadRequestsFIFO_wr_data");
	std_logic_port IBCReadRequestsFIFO_wr_en(PD_OUT, loader, "IBCReadRequestsFIFO_wr_en");

	std_logic_port IBCReadResponsesFIFO_empty(PD_IN, loader, "IBCReadResponsesFIFO_empty");
	std_logic_vector_port<256+30> IBCReadResponsesFIFO_rd_data(PD_IN, loader, "IBCReadResponsesFIFO_rd_data");
	std_logic_port IBCReadResponsesFIFO_rd_en(PD_OUT, loader, "IBCReadResponsesFIFO_rd_en");

	std::vector<uint32_t> memReadRequests;
	std::vector<memResponse> memReadResponses;

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		VBB_ReadEnable = false;
		VBB_ReadAddr = 0x00000000;
		IBCReadRequestsFIFO_full = false;
		IBCReadResponsesFIFO_empty = true;
		IBCReadResponsesFIFO_rd_data = 0;
	}

	const auto readTest = [&](const void* const addr, uint32_t& cycleCount) -> DWORD
	{
		VBB_ReadEnable = true;
		VBB_ReadAddr = reinterpret_cast<const uint32_t>(addr);
		unsigned consecutiveCyclesMemRequestsPending = 25u;
		while (VBB_ReadReady.GetBoolVal() == false)
		{
			++cycleCount;
			uint32_t currentState = DBG_State.GetUint8Val();
			scoped_timestep time(loader, clk, 100);
			IBCReadRequestsFIFO_full = memReadRequests.size() > 2;
			IBCReadResponsesFIFO_empty = memReadResponses.empty();
			if (IBCReadRequestsFIFO_wr_en.GetBoolVal() == true)
			{
				memReadRequests.push_back(IBCReadRequestsFIFO_wr_data.GetUint32Val() );
			}
			if (IBCReadResponsesFIFO_rd_en.GetBoolVal() == true)
			{
				IBCReadResponsesFIFO_rd_data.SetToByteMemory(&memReadResponses.front() );
				memReadResponses.erase(memReadResponses.begin() );
				IBCReadResponsesFIFO_empty = memReadResponses.empty();
			}
			if (!memReadRequests.empty() )
			{
				if (--consecutiveCyclesMemRequestsPending == 0)
				{
					const uint32_t memRequest = memReadRequests[0];
					memReadRequests.erase(memReadRequests.begin() );

					memResponse response;
					memcpy(response.data, reinterpret_cast<const void* const>(memRequest), 32);
					response.requestAddr = memRequest;

					memReadResponses.push_back(response);
					IBCReadResponsesFIFO_rd_data.SetToByteMemory(&response);
					IBCReadResponsesFIFO_empty = false;
				}
			}
		}
		const DWORD ret = VBB_ReadData.GetUint32Val();
		VBB_ReadEnable = false;
		{
			++cycleCount;
			scoped_timestep time(loader, clk, 100);
		}
		return ret;
	};

	static const uint16_t index16[] = {
		0,1,2,2,1,3,2,3,4,4,3,5,4,5,6,6,5,7,6,7,8,8,7,9,8,9,10,10,9,11,10,11,12,12,11,13,12,13,
		14,14,13,15,14,15,16,16,15,17,16,17,18,18,17,19,18,19,20,20,19,21,20,21,22,22,21,23,22,
		23,24,24,23,25,24,25,26,26,25,27,26,27,28,28,27,29,28,29,30,30,29,31,30,31,0,0,31,1,14,
		0,2,14,2,4,14,4,6,14,6,8,14,8,10,14,10,12,14,16,18,14,18,20,14,20,22,14,22,24,14,24,26,
		14,26,28,14,28,30,14,0xFFFF,0
	};
	if ( (const BYTE* const)&index16 > (const BYTE* const)0xFFFFFFFF)
	{
		__debugbreak();
	}

	static const uint32_t index32[] = {
		0,1,2,2,1,3,2,3,4,4,3,5,4,5,6,6,5,7,6,7,8,8,7,9,8,9,10,10,9,11,10,11,12,12,11,13,12,13,
		14,14,13,15,14,15,16,16,15,17,16,17,18,18,17,19,18,19,20,20,19,21,20,21,22,22,21,23,22,
		23,24,24,23,25,24,25,26,26,25,27,26,27,28,28,27,29,28,29,30,30,29,31,30,31,0,0,31,1,14,
		0,2,14,2,4,14,4,6,14,6,8,14,8,10,14,10,12,14,16,18,14,18,20,14,20,22,14,22,24,14,24,26,
		14,26,28,14,28,30,14,0xFFFFFFFF,0
	};
	if ( (const BYTE* const)&index32 > (const BYTE* const)0xFFFFFFFF)
	{
		__debugbreak();
	}

	static const uint8_t index8[] = {
		0,1,2,2,1,3,2,3,4,4,3,5,4,5,6,6,5,7,6,7,8,8,7,9,8,9,10,10,9,11,10,11,12,12,11,13,12,13,
		14,14,13,15,14,15,16,16,15,17,16,17,18,18,17,19,18,19,20,20,19,21,20,21,22,22,21,23,22,
		23,24,24,23,25,24,25,26,26,25,27,26,27,28,28,27,29,28,29,30,30,29,31,30,31,0,0,31,1,14,
		0,2,14,2,4,14,4,6,14,6,8,14,8,10,14,10,12,14,16,18,14,18,20,14,20,22,14,22,24,14,24,26,
		14,26,28,14,28,30,14,0xFF,0
	};
	if ( (const BYTE* const)&index8 > (const BYTE* const)0xFFFFFFFF)
	{
		__debugbreak();
	}

	uint32_t cycleCountIndex16 = 0;
	for (unsigned x = 0; x < ARRAYSIZE(index16); ++x)
	{
		const DWORD ret = readTest(&(index16[x]), cycleCountIndex16);
		const uint16_t ret16 = (const uint16_t)(ret & 0xFFFF);
		if (ret16 != index16[x])
		{
			__debugbreak();
		}
	}

	uint32_t cycleCountIndex32 = 0;
	for (unsigned x = 0; x < ARRAYSIZE(index32); ++x)
	{
		const DWORD ret = readTest(&(index32[x]), cycleCountIndex32);
		if (ret != index32[x])
		{
			__debugbreak();
		}
	}

	uint32_t cycleCountIndex8 = 0;
	for (unsigned x = 0; x < ARRAYSIZE(index8); ++x)
	{
		const DWORD ret = readTest(&(index8[x]), cycleCountIndex8);
		const uint8_t ret8 = (const uint8_t)(ret & 0xFF);
		if (ret8 != index8[x])
		{
			__debugbreak();
		}
	}

	return S_OK;
}