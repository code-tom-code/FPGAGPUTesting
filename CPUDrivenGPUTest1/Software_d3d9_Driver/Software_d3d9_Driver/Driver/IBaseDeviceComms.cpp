#include "IBaseDeviceComms.h"
#include "PacketDefs.h"
#include <stdio.h>
#include <vector>
#include "GPUAllocator.h"

/*static*/ IBaseDeviceComms* IBaseDeviceComms::globalDeviceComms = NULL;

// Sets device memory from deviceDestAddr to deviceDestAddr + dwByteLength with the DWORD value specified in dwSetVal.
__declspec(nothrow) HRESULT __stdcall IBaseDeviceComms::DeviceMemSet(gpuvoid* const deviceDestAddr, const DWORD dwSetVal, const DWORD dwByteLength)
{
	if (dwByteLength % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can only set whole-DWORD byte lengths!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength < sizeof(DWORD) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can't set less than 1 DWORD's worth of data!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory write start!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr + dwByteLength >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory write end!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Device address must be DWORD-aligned!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Cannot read/write from the NULL page!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(deviceDestAddr, dwByteLength) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	const unsigned numDwords = dwByteLength / sizeof(DWORD);
	for (unsigned dwordID = 0; dwordID < numDwords; ++dwordID)
	{
		writeMemCommand newWriteMemPacket;
		newWriteMemPacket.writeDWORDAddr = dwordID * sizeof(DWORD) + (const DWORD)deviceDestAddr;
		newWriteMemPacket.writeVal = dwSetVal;
		newWriteMemPacket.SetComputeChecksum(&newWriteMemPacket);
		HRESULT sendHR = SendLoop( (const BYTE* const)&newWriteMemPacket, sizeof(newWriteMemPacket) );
		if (FAILED(sendHR) )
			return sendHR;
	}

	return S_OK;
}

// Copies a block of memory from host memory to device memory.
__declspec(nothrow) HRESULT __stdcall IBaseDeviceComms::DeviceMemCopy(gpuvoid* const deviceDestAddr, const void* const sourceCPUAddr, const DWORD dwByteLength)
{
	if (!sourceCPUAddr)
	{
#ifdef _DEBUG
		__debugbreak(); // NULL is not a valid source CPU address!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can only set whole-DWORD byte lengths!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength < sizeof(DWORD) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can't set less than 1 DWORD's worth of data!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory write start!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr + dwByteLength >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory write end!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Device address must be DWORD-aligned!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceDestAddr < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Cannot read/write from the NULL page!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(deviceDestAddr, dwByteLength) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	const DWORD* const readMem = (const DWORD* const)sourceCPUAddr;
	const unsigned numDwords = dwByteLength / sizeof(DWORD);
	for (unsigned dwordID = 0; dwordID < numDwords; ++dwordID)
	{
		const DWORD newVal = readMem[dwordID];
		writeMemCommand newWriteMemPacket;
		newWriteMemPacket.writeDWORDAddr = dwordID * sizeof(DWORD) + (const DWORD)deviceDestAddr;
		newWriteMemPacket.writeVal = newVal;
		newWriteMemPacket.SetComputeChecksum(&newWriteMemPacket);
		HRESULT sendHR = SendLoop( (const BYTE* const)&newWriteMemPacket, sizeof(newWriteMemPacket) );
		if (FAILED(sendHR) )
			return sendHR;
	}

	// Validate copies by reading the values back and then comparing the memory for equality:

#ifdef _DEBUG
	if (FAILED(DeviceValidateMemory(deviceDestAddr, sourceCPUAddr, dwByteLength) ) )
		return E_FAIL;
#endif

	return S_OK;
}

// Copies a block of memory from device memory to host memory.
__declspec(nothrow) HRESULT __stdcall IBaseDeviceComms::ReadFromDevice(const gpuvoid* const deviceSrcAddr, void* const destCPUAddr, const DWORD dwByteLength)
{
	if (!destCPUAddr)
	{
#ifdef _DEBUG
		__debugbreak(); // NULL is not a valid dest CPU address!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can only set whole-DWORD byte lengths!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength < sizeof(DWORD) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can't copy less than 1 DWORD's worth of data!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory read start!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr + dwByteLength >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory read end!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Device address must be DWORD-aligned!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Cannot read/write from the NULL page!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(deviceSrcAddr, dwByteLength) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

#ifdef PRINT_COMMS
	printf("Reading back %u bytes from device (0x%08X)%s\n", dwByteLength, (const DWORD)deviceSrcAddr, dwByteLength >= 1024 ? "..." : "");
#endif

	DWORD* const writeMem = (DWORD* const)destCPUAddr;
	const unsigned numDwords = dwByteLength / sizeof(DWORD);
	const DWORD startingTick = GetTickCount();
	for (unsigned dwordID = 0; dwordID < numDwords; ++dwordID)
	{
		readMemCommand newReadMemPacket;
		newReadMemPacket.readDWORDAddr = (const DWORD)deviceSrcAddr + dwordID * sizeof(DWORD);
		newReadMemPacket.dwordSelect = (newReadMemPacket.readDWORDAddr >> 2) & 0x7; // Mask off these three bits
		newReadMemPacket.readDWORDAddr &= ~0x1F; // Mask off the bottommost 5 bits in order to align our read address to the next lowest DRAM line
		newReadMemPacket.SetComputeChecksum(&newReadMemPacket);
		HRESULT sendHR = SendLoop( (const BYTE* const)&newReadMemPacket, sizeof(newReadMemPacket) );
		if (FAILED(sendHR) )
			return sendHR;

		readMemResponse memResponse;
		HRESULT recvHR = RecvLoop( (BYTE* const)&memResponse, sizeof(memResponse) );
		if (FAILED(recvHR) )
			return recvHR;

		if (!command::IsValidPacket(&memResponse, sizeof(memResponse) ) )
		{
			printf("Invalid response packet received!\n");
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_FAIL;
		}
		if (memResponse.readDWORDAddr == newReadMemPacket.readDWORDAddr)
		{
			writeMem[dwordID] = memResponse.value;
		}
		else
		{
			printf("Unexpected response packet address received!\n");
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_FAIL;
		}
	}
	const DWORD endingTick = GetTickCount();

#ifdef PRINT_COMMS
	if (dwByteLength >= 1024)
		printf("...done with read in %ums!\n", endingTick - startingTick);
#endif

	return S_OK;
}

// Validates that the block of memory on the device matches the data in the block of memory on the CPU.
// Returns S_OK if the memory is equal between the CPU and the GPU pointers or E_FAIL otherwise. It is the caller's responsibility to ensure that the GPU is not writing to this region
// as we are reading from it.
__declspec(nothrow) HRESULT __stdcall IBaseDeviceComms::DeviceValidateMemory(const gpuvoid* const deviceSrcAddr, const void* const compareCPUAddr, const DWORD dwByteLength)
{
	if (!compareCPUAddr)
	{
#ifdef _DEBUG
		__debugbreak(); // NULL is not a valid dest CPU address!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can only set whole-DWORD byte lengths!
#endif
		return E_INVALIDARG;
	}
	if (dwByteLength < sizeof(DWORD) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Can't copy less than 1 DWORD's worth of data!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory read start!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr + dwByteLength >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Out of bounds memory read end!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr % sizeof(DWORD) != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Device address must be DWORD-aligned!
#endif
		return E_INVALIDARG;
	}
	if ( (const DWORD)deviceSrcAddr < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Cannot read/write from the NULL page!
#endif
		return E_INVALIDARG;
	}

	if (!ValidateMemoryRangeExistsInsideAllocation(deviceSrcAddr, dwByteLength) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}

	// It uses more memory, but it's more easily debugable to download the entire GPU memory region all at once and then analyze it on the CPU
	// rather than performing comparisons as we go. This way, we can find errors by looking at the whole region and seeing if parts are missing or corrupted.
	std::vector<BYTE> gpuBytes;
	gpuBytes.resize(dwByteLength);
	const HRESULT hrReadResult = ReadFromDevice(deviceSrcAddr, &(gpuBytes.front() ), dwByteLength);
	if (memcmp(&(gpuBytes.front() ), compareCPUAddr, dwByteLength) != 0)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_FAIL;
	}
	else
		return hrReadResult;
}
