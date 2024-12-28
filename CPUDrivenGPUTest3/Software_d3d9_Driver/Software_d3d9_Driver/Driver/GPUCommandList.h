#pragma once

#include "PacketDefs.h"
#include "GPUAllocator.h"
#include <vector>

// Forward-declares:
struct IBaseDeviceComms;

// A simpler, smaller packet struct that we can fit more of into a 32-byte DRAM read line than our fatter over-the-wire command packet format
#pragma pack(push)
#pragma pack(1)
struct SimplifiedCommandPacket
{
	command::ePacketType type;

	DWORD payload0; // 31 downto 0

	DWORD payload1; // 31 downto 0
};
#pragma pack(pop)
static_assert(sizeof(SimplifiedCommandPacket) == 9, "Error: Unexpected struct padding!");

struct GPUCommandList
{
	unsigned __int64 commandsHash = 0;
	gpuvoid* gpuAllocatedAddress = NULL;
	std::vector<genericCommand> commands;

	void BeginRecording();
	void AddPacketToCommandList(const command& newPacket);
	const unsigned __int64 ComputeCommandsHash() const;
	void FinishRecordingAndUpload(IBaseDeviceComms* const deviceComms);

	static void ConvertCommandPacketToSimplifiedCommandPacket(const command* const inFullPacket, SimplifiedCommandPacket* const outSimplifiedPacket);
	static void ConvertSimplifiedCommandPacketToCommandPacket(const SimplifiedCommandPacket* const inSimplifiedPacket, command* const outFullPacket);

	const unsigned GetCommandListSize_bytes() const;
	const unsigned GetCommandListCommandCount() const { return (const unsigned)commands.size(); }

private:
	enum _recordingState : unsigned char
	{
		notRecording = 0,
		recording = 1,
		uploaded = 2
	} recordingState = notRecording;

	void AllocateAndUpload(IBaseDeviceComms* const deviceComms);
};
