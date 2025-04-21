#pragma once

#include "PacketDefs.h"
#include "GPUAllocator.h"
#include <vector>

// Forward-declares:
struct IBaseGPUDevice;

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

static const unsigned numSimplifiedPacketsPerDRAMLine = GPU_DRAM_TRANSACTION_SIZE_BYTES / sizeof(SimplifiedCommandPacket);
union dramLinePackedPacket
{
	SimplifiedCommandPacket simplifiedPackets[numSimplifiedPacketsPerDRAMLine];
	DWORD dwords[8];
};
static_assert(sizeof(dramLinePackedPacket) == 32, "Error: Unexpected struct padding!");

struct GPUCommandList
{
	unsigned __int64 commandsHash = 0;
	gpuvoid* gpuAllocatedAddress = NULL;
	std::vector<genericCommand> commands;

	void BeginRecording();
	void AddPacketToCommandList(const command& newPacket);
	const unsigned __int64 ComputeCommandsHash() const;
	void FinishRecordingAndUpload(IBaseGPUDevice* const baseDevice);
	void ResetCommandListForPooling();

	static void ConvertCommandPacketToSimplifiedCommandPacket(const command* const inFullPacket, SimplifiedCommandPacket* const outSimplifiedPacket)
	{
#ifdef _DEBUG
		if (!inFullPacket)
		{
			__debugbreak();
		}

		if (!outSimplifiedPacket)
		{
			__debugbreak();
		}

		if ( (const void* const)inFullPacket == (const void* const)outSimplifiedPacket)
		{
			__debugbreak();
		}
#endif
		const genericCommand* const packetWithData = reinterpret_cast<const genericCommand* const>(inFullPacket);
		outSimplifiedPacket->type = packetWithData->type;
		outSimplifiedPacket->payload0 = packetWithData->payload0;
		outSimplifiedPacket->payload1 = packetWithData->payload1;
	}

	static void ConvertSimplifiedCommandPacketToCommandPacket(const SimplifiedCommandPacket* const inSimplifiedPacket, command* const outFullPacket)
	{
#ifdef _DEBUG
		if (!inSimplifiedPacket)
		{
			__debugbreak();
		}

		if (!outFullPacket)
		{
			__debugbreak();
		}

		if ( (const void* const)inSimplifiedPacket == (const void* const)outFullPacket)
		{
			__debugbreak();
		}
#endif
		genericCommand* const packetWithData = reinterpret_cast<genericCommand* const>(outFullPacket);

		packetWithData->magicProtoHeader = PACKET_MAGIC_VALUE;
		packetWithData->checksum = 0;
		packetWithData->type = inSimplifiedPacket->type;
		packetWithData->payload0 = inSimplifiedPacket->payload0;
		packetWithData->payload1 = inSimplifiedPacket->payload1;
		packetWithData->checksum = command::ComputeChecksum(packetWithData, sizeof(genericCommand) );
	}

	const unsigned GetCommandListSize_bytes() const;
	const unsigned GetCommandListCommandCount() const { return (const unsigned)commands.size(); }

private:
	enum _recordingState : unsigned char
	{
		notRecording = 0,
		recording = 1,
		uploaded = 2
	} recordingState = notRecording;

#ifdef _DEBUG
	char debugObjectName[256] = {0};
#endif

	static unsigned CommandListsCreatedCounter;

	void AllocateAndUpload(IBaseGPUDevice* const baseDevice);
};
