#pragma once

#include "PacketDefs.h"
#include <vector>
#include <string>

typedef void gpuvoid;

// This callback function returns true if it successfully resolved a packet from within an indirect command list, or false if it couldn't do that for any reason.
typedef bool (__stdcall *ResolveCommandListPacketCallback)(const gpuvoid* const commandListBeginGPUAddress, const unsigned commandIndex, genericCommand& resolvedPacketData);

// You must call InitPacketDisassembly() before invoking the big DisassemblePacketsStream() call later
void InitPacketDisassembly(const ResolveCommandListPacketCallback CommandListResolveCallback);

// After calling this function, it is the caller's responsibility to delete all of the std::string's out of the return vector
void DisassemblePacketsStream(std::vector<const std::string*>& outDisassembledPackets, const bool disassembleReferencedCommandLists, const genericCommand* const firstPacketPtr, const unsigned outerPacketCount = 1u);
