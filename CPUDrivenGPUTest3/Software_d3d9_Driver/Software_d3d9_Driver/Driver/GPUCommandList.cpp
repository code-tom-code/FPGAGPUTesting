#include "IBaseGPUDevice.h"
#include "GPUCommandList.h"

/*static*/ unsigned GPUCommandList::CommandListsCreatedCounter = 0;

#ifdef _DEBUG
void PrintDebugCommandListName(char* const outString, const UINT CommandCount, const unsigned CommandListCounter)
{
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(outString, "CommandList%u (Len: %u commands)", CommandListCounter, CommandCount);
#pragma warning(pop)
}
#endif // #ifdef _DEBUG

void GPUCommandList::AllocateAndUpload(IBaseGPUDevice* const baseDevice)
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

	gpuAllocatedAddress = GPUAlloc(GetCommandListSize_bytes(), GetCommandListCommandCount(), 0, 0, 0, GPUVAT_CommandBuffer, GPUFMT_CommandBufferPacketData, this
#ifdef _DEBUG
		, debugObjectName
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

	if (FAILED(baseDevice->DeviceMemCopy(gpuAllocatedAddress, &(uploadBuffer.front() ), sizeof(dramLinePackedPacket) * uploadBuffer.size() ) ) )
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

void GPUCommandList::FinishRecordingAndUpload(IBaseGPUDevice* const baseDevice)
{
	if (recordingState != recording)
	{
#ifdef _DEBUG
		__debugbreak(); // Can only call this function on command lists that have already called BeginRecording()!
#endif
		return;
	}

#ifdef _DEBUG
	PrintDebugCommandListName(debugObjectName, GetCommandListCommandCount(), CommandListsCreatedCounter);
#endif

	++CommandListsCreatedCounter;

	AllocateAndUpload(baseDevice);

	recordingState = uploaded;
}

void GPUCommandList::ResetCommandListForPooling()
{
	commandsHash = 0;
	gpuAllocatedAddress = NULL;
	commands.clear();
#ifdef _DEBUG
	memset(debugObjectName, 0, sizeof(debugObjectName) );
#endif
	recordingState = notRecording;
}
