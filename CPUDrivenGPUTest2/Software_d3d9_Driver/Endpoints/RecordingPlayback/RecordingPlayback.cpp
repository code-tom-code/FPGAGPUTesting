#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <commdlg.h>
#include <stdio.h>
#include <vector>
#include "..\..\Software_d3d9_Driver\Driver\PacketDefs.h"
#include "..\..\\Software_d3d9_Driver\\Driver\\GPUAllocator.h"
#include "..\..\\Software_d3d9_Driver\\Driver\\GPUCommandList.h"
#include "..\..\Endpoints\Common\EndpointDLLInterface.h"

static const DLLEndpointMajorVersions hostMajorVersion = InitialVersion;
static const unsigned hostMinorVersion = 0u;
static HWND endpointWindow = NULL;
static bool bInfiniteLoop = true;

// Only define this option for x64 builds, since for x86 builds we won't have enough virtual address space to be able to do this:
#ifdef _M_X64
	#define USE_PLAYBACK_LOCAL_MEMORY 1
#else
	#undef USE_PLAYBACK_LOCAL_MEMORY
#endif

// TODO: Don't hardcode these paths
static const char* const LoadDLLPath =
#ifdef _M_X64
	#ifdef _DEBUG
		"C:\\Users\\Tom\\Documents\\Visual Studio 2017\\Projects\\Software_d3d9_Driver\\x64\\Debug\\Endpoints\\GPUEndpoint_D3D9.dll";
	#else
		"C:\\Users\\Tom\\Documents\\Visual Studio 2017\\Projects\\Software_d3d9_Driver\\x64\\Release\\Endpoints\\GPUEndpoint_D3D9.dll";
	#endif
#else
	#ifdef _DEBUG
		"C:\\Users\\Tom\\Documents\\Visual Studio 2017\\Projects\\Software_d3d9_Driver\\Debug\\Endpoints\\GPUEndpoint_D3D9.dll";
	#else
		"C:\\Users\\Tom\\Documents\\Visual Studio 2017\\Projects\\Software_d3d9_Driver\\Release\\Endpoints\\GPUEndpoint_D3D9.dll";
	#endif
#endif

struct renderEvent
{
	enum renderEventType : unsigned __int64
	{
		otherEvent = 0,
		drawEvent = 1,
		clearEvent = 2,
		endFrameEvent = 3,
		runCommandList = 4
	};

	renderEventType eventType : 3;
	unsigned __int64 fileOffset_bytes : 61;
};
static_assert(sizeof(renderEvent) == sizeof(unsigned __int64), "Error: Unexpected struct packing!");

#ifdef USE_PLAYBACK_LOCAL_MEMORY
// This large 1GB region of memory is used as a mirror for the GPU's VRAM:
__declspec(align(128) ) BYTE LocalMemory[GPU_DRAM_TOTAL_CAPACITY_BYTES] = {0};
#endif // #ifdef USE_PLAYBACK_LOCAL_MEMORY

static const unsigned numSimplifiedPacketsPerDRAMLine = GPU_DRAM_TRANSACTION_SIZE_BYTES / sizeof(SimplifiedCommandPacket);
union dramLinePackedPacket
{
	SimplifiedCommandPacket simplifiedPackets[numSimplifiedPacketsPerDRAMLine];
	DWORD dwords[8];
};
static_assert(sizeof(dramLinePackedPacket) == 32, "Error: Unexpected struct padding!");

// For IO efficiency, read from our file in 64KB chunks at a time:
static const unsigned READ_SIZE_BYTES = 64u * 1024u;
struct readCache
{
	char readBufferA[READ_SIZE_BYTES] = {0};
	char readBufferB[READ_SIZE_BYTES] = {0};

	bool isCurrentBufferA = true;
	unsigned __int64 readPtr = 0;
	unsigned __int64 bufferReadPtr = 0;
	unsigned __int64 readLimit = 0;

	void ResetFile(HANDLE hFile, const unsigned __int64 newFileMaxSize)
	{
		isCurrentBufferA = true;
		readPtr = 0;
		readLimit = newFileMaxSize;

		memset(readBufferA, 0, sizeof(readBufferA) );
		memset(readBufferB, 0, sizeof(readBufferB) );

		DWORD numBytesRead = 0;
		const DWORD initialReadSize = READ_SIZE_BYTES < readLimit ? READ_SIZE_BYTES : (const DWORD)readLimit;
		if (!ReadFile(hFile, readBufferA, initialReadSize, &numBytesRead, NULL) )
		{
#ifdef _DEBUG
			__debugbreak(); // Error in ReadFile!
#endif
		}
		bufferReadPtr = initialReadSize;
	}

	const bool ReadBytes(HANDLE hFile, void* const outData, const unsigned numBytes)
	{
		if (numBytes >= (READ_SIZE_BYTES / 2) )
		{
#ifdef _DEBUG
			__debugbreak(); // Cannot read too many bytes at once!
#endif
			return false;
		}

		// We're at the end of the file!
		const unsigned __int64 postReadPtr = readPtr + numBytes;
		if (postReadPtr > readLimit)
		{
#ifdef _DEBUG
			__debugbreak(); // Cannot read off the end of the file!
#endif
			return false;
		}

		// If we are reading from within the same buffer (common case):
		if (readPtr / READ_SIZE_BYTES == postReadPtr / READ_SIZE_BYTES)
		{
			const char* currentBuffer = isCurrentBufferA ? readBufferA : readBufferB;
			memcpy(outData, currentBuffer + (readPtr % READ_SIZE_BYTES), numBytes);
			readPtr = postReadPtr;
		}
		else // If we have to straddle between different buffers
		{
			DWORD nextReadSize = READ_SIZE_BYTES;
			if (bufferReadPtr + READ_SIZE_BYTES > readLimit)
			{
				nextReadSize = (const DWORD)(readLimit - bufferReadPtr);
			}

			DWORD numBytesRead = 0;
#ifdef _DEBUG
			memset(isCurrentBufferA ? readBufferB : readBufferA, 0, sizeof(readBufferA) );
#endif
			if (!ReadFile(hFile, isCurrentBufferA ? readBufferB : readBufferA, nextReadSize, &numBytesRead, NULL) )
			{
#ifdef _DEBUG
				__debugbreak(); // Error in ReadFile!
#endif
			}
			bufferReadPtr += nextReadSize;

			unsigned bytesRemainingThisBuffer = READ_SIZE_BYTES - (readPtr % READ_SIZE_BYTES);
			if (bytesRemainingThisBuffer > 0)
				memcpy(outData, (isCurrentBufferA ? readBufferA : readBufferB) + (readPtr % READ_SIZE_BYTES), bytesRemainingThisBuffer);
			readPtr += bytesRemainingThisBuffer;

			isCurrentBufferA = !isCurrentBufferA; // Flip our current buffers

			if (numBytes - bytesRemainingThisBuffer > 0)
				memcpy( ( (char* const)outData) + bytesRemainingThisBuffer, isCurrentBufferA ? readBufferA : readBufferB, numBytes - bytesRemainingThisBuffer);
			readPtr += (numBytes - bytesRemainingThisBuffer);
		}

		return true;
	}
};

static std::vector<renderEvent> renderEvents;

void __stdcall ReturnMessageImpl(const genericCommand* const D2HReplyPacket)
{
	// Do nothing! Since we're just playing back a previously-recorded stream, there's nowhere for our return messages to go anyway
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

int main(const unsigned argc, const char* const argv[])
{
	const char* recordingFilePath = NULL;
	char recordingFile[MAX_PATH] = {0};
	if (argc > 1)
	{
		recordingFilePath = argv[1];
	}
	else
	{
		OPENFILENAMEA openFilenameStruct = {0};
		openFilenameStruct.lStructSize = sizeof(openFilenameStruct);
		openFilenameStruct.lpstrFilter = "Recorded Stream Data (*.rsd)\0*.RSD";
		openFilenameStruct.lpstrFile = recordingFile;
		openFilenameStruct.nMaxFile = ARRAYSIZE(recordingFile);
		openFilenameStruct.lpstrTitle = "Load a recording file to playback";
		openFilenameStruct.Flags = OFN_ENABLESIZING | OFN_FILEMUSTEXIST | OFN_NOCHANGEDIR | OFN_PATHMUSTEXIST;
		openFilenameStruct.lpstrDefExt = "RSD";
		if (GetOpenFileNameA(&openFilenameStruct) )
		{
			recordingFilePath = openFilenameStruct.lpstrFile;
		}
	}

	if (!recordingFilePath || !*recordingFilePath)
	{
		printf("Error: No recorded stream file selected! You must specify a recorded stream file to load.\n");
		return 1;
	}

	HANDLE hRecordingFile = CreateFileA(recordingFilePath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL | FILE_FLAG_SEQUENTIAL_SCAN, NULL);
	if (hRecordingFile == INVALID_HANDLE_VALUE)
	{
		printf("Error in CreateFileA(\"%s\"). GLE: %u\n", recordingFilePath, GetLastError() );
		return 1;
	}

	LARGE_INTEGER fileSize = {0};
	GetFileSizeEx(hRecordingFile, &fileSize);

	readCache readFileCache;
	readFileCache.ResetFile(hRecordingFile, fileSize.QuadPart);

	printf("Parsing recorded stream file...\n");

#ifdef _DEBUG
	if (fileSize.QuadPart % sizeof(genericCommand) != 0)
	{
		__debugbreak(); // Error: File is incomplete or contains a non-integer number of packets!
	}
#endif

	unsigned __int64 drawEventCount = 0;
	unsigned __int64 runCommandListEventCount = 0;
	unsigned __int64 clearEventCount = 0;
	unsigned __int64 endFrameEventCount = 0;
	for (unsigned __int64 readSoFar = 0; readSoFar < (const unsigned __int64)fileSize.QuadPart; readSoFar += sizeof(genericCommand) )
	{
		genericCommand nextPacket;
		if (!readFileCache.ReadBytes(hRecordingFile, &nextPacket, sizeof(nextPacket) ) )
		{
#ifdef _DEBUG
			__debugbreak(); // Error reading bytes from read cache!
#endif
		}

		if (nextPacket.magicProtoHeader != PACKET_MAGIC_VALUE)
		{
			printf("Error: Dropping packet with incorrect magic header value detected at file offset %llu bytes! Expected '%c' (0x%02X), read '%c' (0x%02X)!\n", 
				readSoFar, PACKET_MAGIC_VALUE, PACKET_MAGIC_VALUE, nextPacket.magicProtoHeader, nextPacket.magicProtoHeader);
#ifdef _DEBUG
			__debugbreak();
#endif
			continue;
		}

		const unsigned char computedChecksum = command::ComputeChecksum(&nextPacket, sizeof(nextPacket) );
		if (computedChecksum != nextPacket.checksum)
		{
			printf("Error: Dropping packet with incorrect checksum value detected at file offset %llu bytes! Computed 0x%02X, read 0x%02X!\n",
				readSoFar, computedChecksum, nextPacket.checksum);
#ifdef _DEBUG
			__debugbreak();
#endif
			continue;
		}

		if (nextPacket.type >= command::PT_MAX_PACKET_TYPES)
		{
			printf("Error: Dropping packet with out of range packet type detected at file offset %llu bytes! Unexpected packet type 0x%02X read!\n",
				readSoFar, nextPacket.type);
#ifdef _DEBUG
			__debugbreak();
#endif
			continue;
		}

		renderEvent newEvent;

		switch (nextPacket.type)
		{
		default:
			continue;
		case command::PT_CLEARBACKBUFFER:
		case command::PT_CLEARZSTENCILBUFFER:
			++clearEventCount;
			newEvent.eventType = renderEvent::clearEvent;
			break;
		case command::PT_DRAWINDEXED:
			++drawEventCount;
			newEvent.eventType = renderEvent::drawEvent;
			break;
		case command::PT_WRITEMEM:
		{
#ifdef USE_PLAYBACK_LOCAL_MEMORY
			const writeMemCommand* const writeMemPacket = reinterpret_cast<const writeMemCommand* const>(&nextPacket);
			*(DWORD* const)(LocalMemory + writeMemPacket->writeDWORDAddr) = writeMemPacket->writeVal; // Write our memory
#endif // #ifdef USE_PLAYBACK_LOCAL_MEMORY
		}
			continue;
		case command::PT_RUNCOMMANDLIST:
		{
#ifdef USE_PLAYBACK_LOCAL_MEMORY
			const runCommandListCommand* const runCommandListPacket = reinterpret_cast<const runCommandListCommand* const>(&nextPacket);
			const dramLinePackedPacket* const dramLinePackedSimplifiedPacketsMem = reinterpret_cast<const dramLinePackedPacket* const>(LocalMemory + runCommandListPacket->commandListStartAddress);
			for (unsigned commandListPacketIndex = 0; commandListPacketIndex < runCommandListPacket->numCommands; ++commandListPacketIndex)
			{
				genericCommand fullCommandPacket;
				const SimplifiedCommandPacket& thisSimplifiedPacket = dramLinePackedSimplifiedPacketsMem[commandListPacketIndex / numSimplifiedPacketsPerDRAMLine].simplifiedPackets[commandListPacketIndex % numSimplifiedPacketsPerDRAMLine];
				GPUCommandList::ConvertSimplifiedCommandPacketToCommandPacket(&thisSimplifiedPacket, &fullCommandPacket);

				// Draw events are the only ones we need to worry about inside these sub command-lists. This is because clear, runcommandlist, and endframe packets are not allowed
				// to be recorded into these sub command-lists.
				if (fullCommandPacket.type == command::PT_DRAWINDEXED)
				{
					++drawEventCount;
					renderEvent newSubCommandListEvent;
					newSubCommandListEvent.eventType = renderEvent::drawEvent;
					newSubCommandListEvent.fileOffset_bytes = readSoFar;
					renderEvents.push_back(newSubCommandListEvent);
				}
			}
#endif // #ifdef USE_PLAYBACK_LOCAL_MEMORY

			++runCommandListEventCount;
			newEvent.eventType = renderEvent::runCommandList;
			break;
		}
		case command::PT_ENDFRAME:
			++endFrameEventCount;
			newEvent.eventType = renderEvent::endFrameEvent;
			break;
		}
		newEvent.fileOffset_bytes = readSoFar;

		renderEvents.push_back(newEvent);
	}

	printf("%llu packets parsed:\n\t%llu draw events found\n\t%llu command list executions\n\t%llu clear events found\n\t%llu end frame events found\n", fileSize.QuadPart / sizeof(genericCommand), drawEventCount, runCommandListEventCount, clearEventCount, endFrameEventCount);


	HMODULE loadedDLL = LoadLibraryA(LoadDLLPath);
	if (!loadedDLL)
	{
		printf("Error in LoadLibrary(\"%s\"). GLE: %u\n", LoadDLLPath, GetLastError() );
#ifdef _DEBUG
		__debugbreak();
#endif
		return 1;
	}

	const GetDLLInfoFuncType getDllInfoPtr = reinterpret_cast<const GetDLLInfoFuncType>(GetProcAddress(loadedDLL, "GetDLLInfo") );
	if (!getDllInfoPtr)
	{
		printf("Error in GetProcAddress(\"GetDLLInfo\"). GLE: %u\n", GetLastError() );
		FreeLibrary(loadedDLL);
		return 1;
	}

	DLLInfo dllInfo;
	dllInfo.versionMajor = hostMajorVersion;
	dllInfo.versionMinor = hostMinorVersion;
	if (!(*getDllInfoPtr)(&dllInfo) )
	{
		// Version mismatches are the most common source of failure here:
		if (dllInfo.MAGIC == DLLINFO_MAGIC && dllInfo.versionMajor != hostMajorVersion)
			printf("Error in GetDLLInfo(): Incompatible host/endpoint versions. Host version: %u.%u, Endpoint version: %u.%u\n", hostMajorVersion, hostMinorVersion, dllInfo.versionMajor, dllInfo.versionMinor);
		else
			printf("Unknown error in GetDLLInfo().\n");
		FreeLibrary(loadedDLL);
		return 1;
	}

	if (dllInfo.MAGIC != DLLINFO_MAGIC)
	{
		printf("Error: MAGIC field check failed. Found 0x%08X, expected 0x%08X\n", dllInfo.MAGIC, DLLINFO_MAGIC);
		FreeLibrary(loadedDLL);
		return 1;
	}

	if (dllInfo.versionMajor != hostMajorVersion)
	{
		printf("Error: Major version incompatability detected. Host version: %u.%u, Endpoint version: %u.%u\n", hostMajorVersion, hostMinorVersion, dllInfo.versionMajor, dllInfo.versionMinor);
		FreeLibrary(loadedDLL);
		return 1;
	}

	if (!dllInfo.H2DFunctions.InitEndpoint || 
		!dllInfo.H2DFunctions.ProcessNewMessage || 
		!dllInfo.H2DFunctions.ShutdownEndpoint || 
		(!(dllInfo.endpointOptions & NoWindow) && (!dllInfo.H2DFunctions.SpawnWindow) ) )
	{
		printf("Error: Endpoint DLL does not implement all required functions in DLL interface!\n");
		FreeLibrary(loadedDLL);
		return 1;
	}

	printf("Loaded Endpoint into host process: \"%s\"\n", dllInfo.endpointName);

	if (!(*dllInfo.H2DFunctions.InitEndpoint)(&ReturnMessageImpl) )
	{
		printf("Error in InitEndpoint(). Endpoint failed to init!\n");
		FreeLibrary(loadedDLL);
		return 1;
	}

	if (!(dllInfo.endpointOptions & NoWindow) )
	{
		if (!(*dllInfo.H2DFunctions.SpawnWindow)(&endpointWindow) )
		{
			printf("Error in SpawnWindow(). Endpoint window failed to spawn!\n");
			(*dllInfo.H2DFunctions.ShutdownEndpoint)();
			FreeLibrary(loadedDLL);
			return 1;
		}
	}

	printf("Endpoint is running!\n");

	do
	{
		// Reset our recorded file pointer to the beginning of the file:
		const LARGE_INTEGER resetBeginningFilePointer = {0};
		if (!SetFilePointerEx(hRecordingFile, resetBeginningFilePointer, NULL, FILE_BEGIN) )
		{
			printf("Error: Failed to reset the file pointer! GLE: %u\n", GetLastError() );
#ifdef _DEBUG
			__debugbreak();
#endif
			return 1;
		}
		readFileCache.ResetFile(hRecordingFile, fileSize.QuadPart);

		for (unsigned __int64 readSoFar = 0; readSoFar < (const unsigned __int64)fileSize.QuadPart; readSoFar += sizeof(genericCommand) )
		{
			genericCommand nextPacket;
			if (!readFileCache.ReadBytes(hRecordingFile, &nextPacket, sizeof(nextPacket) ) )
			{
#ifdef _DEBUG
				__debugbreak(); // Error reading bytes from read cache!
#endif
			}

#ifdef _DEBUG
			if (nextPacket.magicProtoHeader != PACKET_MAGIC_VALUE)
			{
				printf("Error: Dropping packet with incorrect magic header value detected at file offset %llu bytes! Expected '%c' (0x%02X), read '%c' (0x%02X)!\n", 
					readSoFar, PACKET_MAGIC_VALUE, PACKET_MAGIC_VALUE, nextPacket.magicProtoHeader, nextPacket.magicProtoHeader);
				__debugbreak();
			}

			const unsigned char computedChecksum = command::ComputeChecksum(&nextPacket, sizeof(nextPacket) );
			if (computedChecksum != nextPacket.checksum)
			{
				printf("Error: Dropping packet with incorrect checksum value detected at file offset %llu bytes! Computed 0x%02X, read 0x%02X!\n",
					readSoFar, computedChecksum, nextPacket.checksum);
				__debugbreak();
			}

			if (nextPacket.type >= command::PT_MAX_PACKET_TYPES)
			{
				printf("Error: Dropping packet with out of range packet type detected at file offset %llu bytes! Unexpected packet type 0x%02X read!\n",
					readSoFar, nextPacket.type);
				__debugbreak();
			}
#endif
			(*dllInfo.H2DFunctions.ProcessNewMessage)(&nextPacket);
		}
	}
	while (bInfiniteLoop);

    return 0;
}