#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include <vector>

struct EmulatedState
{
	struct StateSlot
	{
		unsigned short DrawID;
		unsigned short StateData;
		bool stateIsValid;
	};

	void Update(bool bDoReset, bool bSetNewState, bool bConsumeCurrentState, unsigned short newStateData, unsigned short newStateDrawID)
	{
		if (bDoReset)
		{
			const StateSlot resetSlot = {0};
			for (unsigned x = 0; x < ARRAYSIZE(states); ++x)
			{
				states[x] = resetSlot;
			}
			readStateID = 0;
			writeStateID = 0;
		}
		else
		{
			if (bConsumeCurrentState)
			{
				if (states[readStateID].stateIsValid == false)
				{
					__debugbreak();
				}
				states[readStateID].stateIsValid = false;
				states[readStateID++].DrawID = 0x0000;
			}

			if (bSetNewState)
			{
				if (states[writeStateID].stateIsValid == true)
				{
					__debugbreak();
				}
				states[writeStateID].stateIsValid = true;
				states[writeStateID].DrawID = newStateDrawID;
				states[writeStateID++].StateData = newStateData;
			}
		}
	}

	unsigned char readStateID = 0;
	unsigned char writeStateID = 0;
	StateSlot states[4] = {0};
};

const int RunTestsStateBlock(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

// Command Processor interface begin
	std_logic_port CMD_SetNewState(PD_IN, loader, "CMD_SetNewState");
	std_logic_port CMD_EndFrameReset(PD_IN, loader, "CMD_EndFrameReset");
	std_logic_vector_port<3> CMD_NumFreeSlots(PD_OUT, loader, "CMD_NumFreeSlots");
	std_logic_vector_port<16> CMD_NewStateBits(PD_IN, loader, "CMD_NewStateBits");
	std_logic_vector_port<16> CMD_NewStateDrawEventID(PD_IN, loader, "CMD_NewStateDrawEventID");
// Command Processor interface end

// Stage interface begin
	std_logic_vector_port<16> STAGE_StateBitsAtDrawID(PD_OUT, loader, "STAGE_StateBitsAtDrawID");
	std_logic_vector_port<16> STAGE_NextDrawID(PD_OUT, loader, "STAGE_NextDrawID");
	std_logic_port STAGE_StateIsValid(PD_OUT, loader, "STAGE_StateIsValid");
	std_logic_port STAGE_ConsumeStateSlot(PD_IN, loader, "STAGE_ConsumeStateSlot");
// Stage interface end

// Debug signals begin
	std_logic_vector_port<4> DBG_SlotsValid(PD_OUT, loader, "DBG_SlotsValid");
	std_logic_vector_port<2> DBG_CurrentReadSlotIndex(PD_OUT, loader, "DBG_CurrentReadSlotIndex");
	std_logic_vector_port<2> DBG_CurrentWriteSlotIndex(PD_OUT, loader, "DBG_CurrentWriteSlotIndex");
	std_logic_vector_port<16> DBG_Slot0(PD_OUT, loader, "DBG_Slot0");
	std_logic_vector_port<16> DBG_Slot1(PD_OUT, loader, "DBG_Slot1");
	std_logic_vector_port<16> DBG_Slot2(PD_OUT, loader, "DBG_Slot2");
	std_logic_vector_port<16> DBG_Slot3(PD_OUT, loader, "DBG_Slot3");

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		CMD_EndFrameReset = true;
	}
	CMD_EndFrameReset = false;

	bool successResult = true;

	return successResult ? S_OK : E_FAIL;
}
