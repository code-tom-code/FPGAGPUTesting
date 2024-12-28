#include "IBaseGPUDevice.h"
#include "GPUCommandList.h"

static const unsigned numSimplifiedPacketsPerDRAMLine = GPU_DRAM_TRANSACTION_SIZE_BYTES / sizeof(SimplifiedCommandPacket);

union dramLinePackedPacket
{
	SimplifiedCommandPacket simplifiedPackets[numSimplifiedPacketsPerDRAMLine];
	DWORD dwords[8];
};
static_assert(sizeof(dramLinePackedPacket) == 32, "Error: Unexpected struct padding!");

/*static*/ void GPUCommandList::ConvertCommandPacketToSimplifiedCommandPacket(const command* const inFullPacket, SimplifiedCommandPacket* const outSimplifiedPacket)
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

/*static*/ void GPUCommandList::ConvertSimplifiedCommandPacketToCommandPacket(const SimplifiedCommandPacket* const inSimplifiedPacket, command* const outFullPacket)
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

void GPUCommandList::AllocateAndUpload(IBaseDeviceComms* const deviceComms)
{
#ifdef _DEBUG
	if (gpuAllocatedAddress != NULL)
	{
		__debugbreak(); // Only allocate once per command list!
	}
	if (commands.empty() )
	{
		__debugbreak(); // Cannot allocate + upload an empty command list!
	}
#endif

	gpuAllocatedAddress = GPUAlloc(GetCommandListSize_bytes(), GetCommandListCommandCount(), 0, 0, 0, GPUVAT_CommandBuffer, GPUFMT_CommandBufferPacketData
#ifdef _DEBUG
		, "CommandListAllocation"
#endif
	);

	if (!gpuAllocatedAddress)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}

	const unsigned numCommands = commands.size();

	std::vector<dramLinePackedPacket> uploadBuffer;
	uploadBuffer.resize( (numCommands + numSimplifiedPacketsPerDRAMLine - 1) / numSimplifiedPacketsPerDRAMLine);

	for (unsigned x = 0; x < numCommands; ++x)
	{
		const genericCommand& thisReadPacket = commands[x];
		dramLinePackedPacket& thisDramLine = uploadBuffer[x / numSimplifiedPacketsPerDRAMLine];
		SimplifiedCommandPacket& thisSimplifiedPacket = thisDramLine.simplifiedPackets[x % numSimplifiedPacketsPerDRAMLine];
		ConvertCommandPacketToSimplifiedCommandPacket(&thisReadPacket, &thisSimplifiedPacket);
	}

	if (FAILED(deviceComms->DeviceMemCopy(gpuAllocatedAddress, &(uploadBuffer.front() ), sizeof(dramLinePackedPacket) * uploadBuffer.size() ) ) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
	}
}

void GPUCommandList::AddPacketToCommandList(const command& newPacket)
{
	if (recordingState != recording)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Can only add packets to command lists that are in the recording state!
#endif
		return;
	}

	if (gpuAllocatedAddress != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Recording packets into a command list that has already been allocated and uploaded onto the GPU!
#endif
		return;
	}

	const genericCommand* const genericPtr = reinterpret_cast<const genericCommand* const>(&newPacket);
	commands.push_back(*genericPtr);
}

const unsigned GPUCommandList::GetCommandListSize_bytes() const
{
#ifdef _DEBUG
	if (commands.empty() )
	{
		__debugbreak(); // Not legal to have an empty command list!
	}
#endif
	const unsigned numDRAMLinesRequired = (commands.size() + (numSimplifiedPacketsPerDRAMLine - 1) ) / numSimplifiedPacketsPerDRAMLine; // Round up to the next highest DRAM line, since we'll fill the whole line in
	return GPU_DRAM_TRANSACTION_SIZE_BYTES * numDRAMLinesRequired;
}

void GPUCommandList::BeginRecording()
{
	if (recordingState != notRecording)
	{
#ifdef _DEBUG
		__debugbreak(); // Can only call this function on command lists that haven't started recorded yet!
#endif
		return;
	}

	recordingState = recording;
}

static const unsigned __int64 ComputeMemoryHash(const BYTE* mem, unsigned len)
{
	unsigned __int64 ret = 0;

	if (len >= sizeof(DWORD) )
	{
		const DWORD* const dwordMemory = (const DWORD* const)mem;
		ret ^= *dwordMemory;
		ret = _rotl64(ret, 32 - 3);

		mem += sizeof(DWORD);
		len -= sizeof(DWORD);
	}

	while (len > 0)
	{
		ret ^= *mem;
		ret = _rotl64(ret, 8 - 3);
		++mem;
		--len;
	}

	return ret;
}

const unsigned __int64 GPUCommandList::ComputeCommandsHash() const
{
	return ComputeMemoryHash( (const BYTE* const)&(commands.front() ), commands.size() * sizeof(genericCommand) );
}

void GPUCommandList::FinishRecordingAndUpload(IBaseDeviceComms* const deviceComms)
{
	if (recordingState != recording)
	{
#ifdef _DEBUG
		__debugbreak(); // Can only call this function on command lists that have already called BeginRecording()!
#endif
		return;
	}

	AllocateAndUpload(deviceComms);

	recordingState = uploaded;
}
