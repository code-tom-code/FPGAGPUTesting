#pragma once

#include "DeviceShaderBytecode.h"
#include <vector>

// Simulates the pipeline of the compiled shader to determine how many cycles executing this shader will take and how many cycles will be wasted due to waits/stalls
const unsigned short SimulateShaderCycles(const std::vector<instructionSlot>& inFinalDeviceInstructionStream, unsigned short& outCyclesWastedToWaits);
