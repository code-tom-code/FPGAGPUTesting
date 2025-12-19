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
#include "..\..\\Software_d3d9_Driver\\Driver\\GPUReturnTracker.h"
#include "..\..\\Software_d3d9_Driver\\Driver\\PacketDisassembler.h"
#include "..\..\Endpoints\Common\EndpointDLLInterface.h"

static const DLLEndpointMajorVersions hostMajorVersion = InitialVersion;
static const unsigned hostMinorVersion = 0u;
static HWND endpointWindow = NULL;
static bool bInfiniteLoop = true;
static LARGE_INTEGER freq = {0};
static double ldfreq = 0.0;

std::vector<DWORD> thisFrameWaitForIdleIdentifiers;
std::vector<const gpuvoid*> thisFrameWaitForReadAddresses;

// Only define this option for x64 builds, since for x86 builds we won't have enough virtual address space to be able to do this:
#ifdef _M_X64
	#define USE_PLAYBACK_LOCAL_MEMORY 1
#else
	#undef USE_PLAYBACK_LOCAL_MEMORY
#endif

enum playbackMode
{
	playing = 0,
	singleFrameStep
};
static playbackMode currentPlaybackMode = playing;
static unsigned playbackFramerate = 60;
static bool playToNextFrame = true;
static bool restartAtBeginning = false;
static bool dumpCurrentFrameDisassembly = false;

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

struct registeredKey
{
	typedef void (*CallbackFunc)();
	int vKey;
	bool keyIsDown;
	const CallbackFunc onKeyDown;
	const CallbackFunc onKeyUp;

	registeredKey(int _vKey, const CallbackFunc keyDownCallback, const CallbackFunc keyUpCallback) :
		vKey(_vKey), keyIsDown(false), onKeyDown(keyDownCallback), onKeyUp(keyUpCallback)
	{
	}
};
static std::vector<registeredKey> registeredKeys;

static void SpaceDownCallback()
{
	if (currentPlaybackMode == playing)
	{
		currentPlaybackMode = singleFrameStep;
		playbackFramerate = 0;
		playToNextFrame = true;
	}
	else
	{
		currentPlaybackMode = playing;
		playbackFramerate = 60;
		playToNextFrame = true;
	}
}

static void RightCallback()
{
	currentPlaybackMode = singleFrameStep;
	playbackFramerate = 0;
	playToNextFrame = true;
}

static void PageDownCallback()
{
	switch (playbackFramerate)
	{
	case 0xFFFFFFFF:
		playbackFramerate = 120;
		break;
	case 120:
		playbackFramerate = 60;
		break;
	case 60:
		playbackFramerate = 30;
		break;
	case 30:
		playbackFramerate = 15;
		break;
	case 15:
		playbackFramerate = 5;
		break;
	case 5:
		playbackFramerate = 1;
		break;
	case 1:
		playbackFramerate = 0;
		currentPlaybackMode = singleFrameStep;
		break;
	}
}

static void PageUpCallback()
{
	switch (playbackFramerate)
	{
	case 120:
		playbackFramerate = 0xFFFFFFFF;
		break;
	case 60:
		playbackFramerate = 120;
		break;
	case 30:
		playbackFramerate = 60;
		break;
	case 15:
		playbackFramerate = 30;
		break;
	case 5:
		playbackFramerate = 15;
		break;
	case 1:
		playbackFramerate = 5;
		break;
	case 0:
		playbackFramerate = 1;
		currentPlaybackMode = playing;
		playToNextFrame = true;
		break;
	}
}

static void ResetButtonCallback()
{
	if (MessageBoxA(NULL, "Reset to beginning?", "Are you sure?", MB_YESNO) == IDYES)
	{
		restartAtBeginning = true;
	}
}

static void DisassembleFrameCommandStreamButtonCallback()
{
	if (MessageBoxA(NULL, "Disassemble current frame command list?", "Are you sure?", MB_YESNO) == IDYES)
	{
		dumpCurrentFrameDisassembly = true;
	}
}

static DWORD lastInputUpdate = 0x00000000;
static void UpdateInput()
{
	const DWORD currentTime = GetTickCount();
	if (currentTime == lastInputUpdate) // Only pump input once per millisecond (1000FPS at most)
		return;
	lastInputUpdate = currentTime;

	const unsigned numRegisteredKeys = (const unsigned)registeredKeys.size();
	for (unsigned x = 0; x < numRegisteredKeys; ++x)
	{
		registeredKey& thisRegisteredKey = registeredKeys[x];
		const bool keyCurrentlyDown = GetAsyncKeyState(thisRegisteredKey.vKey) & 0x8000;
		if (keyCurrentlyDown != thisRegisteredKey.keyIsDown)
		{
			if (thisRegisteredKey.keyIsDown && !keyCurrentlyDown)
			{
				if (thisRegisteredKey.onKeyUp)
				{
					(*thisRegisteredKey.onKeyUp)();
				}
			}
			else if (!thisRegisteredKey.keyIsDown && keyCurrentlyDown)
			{
				if (thisRegisteredKey.onKeyDown)
				{
					(*thisRegisteredKey.onKeyDown)();
				}
			}

			thisRegisteredKey.keyIsDown = keyCurrentlyDown;
		}
	}
}

#ifdef USE_PLAYBACK_LOCAL_MEMORY
// This large 1GB region of memory is used as a mirror for the GPU's VRAM:
static __declspec(align(128) ) BYTE LocalMemory[GPU_DRAM_TOTAL_CAPACITY_BYTES] = {0};
static BYTE* currentBatchMemoryWritePtr = LocalMemory;
static DWORD currentBatchWriteData[8] = {0};
#endif // #ifdef USE_PLAYBACK_LOCAL_MEMORY

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
	GetReturnTrackerSingleton().HandleIncomingReturnPacket(D2HReplyPacket);
}

static void WaitUntilTime(const LARGE_INTEGER& waitStopTime)
{
	while (true)
	{
		LARGE_INTEGER currentTime = {0};
		QueryPerformanceCounter(&currentTime);
		if (currentTime.QuadPart > waitStopTime.QuadPart)
			return;

		const __int64 waitTicks = currentTime.QuadPart - waitStopTime.QuadPart;
		const double waitSeconds = waitTicks / ldfreq;
		const double waitMilliseconds = waitSeconds * 1000.0;
		if (waitMilliseconds >= 1.0)
		{
			Sleep( (const unsigned)waitMilliseconds);
			continue;
		}
		else
		{
			// Micro-sleep wait spin-loop:
			while (currentTime.QuadPart < waitStopTime.QuadPart)
			{
				QueryPerformanceCounter(&currentTime);
				YieldProcessor();
			}
		}
	}
}

// This callback function returns true if it successfully resolved a packet from within an indirect command list, or false if it couldn't do that for any reason.
bool __stdcall ResolveCommandListPacket(const gpuvoid* const commandListBeginGPUAddress, const unsigned commandIndex, genericCommand& resolvedPacketData)
{
#ifndef USE_PLAYBACK_LOCAL_MEMORY
#ifdef _DEBUG
	__debugbreak(); // Error: Should never be here!
#endif
	return false;
#else // #ifndef USE_PLAYBACK_LOCAL_MEMORY
	const dramLinePackedPacket* const recordedCommandListPacketDataStart = (const dramLinePackedPacket* const)(LocalMemory + (const DWORD)commandListBeginGPUAddress);
	const unsigned dramIndex = commandIndex / numSimplifiedPacketsPerDRAMLine;
	const unsigned localDramReadIndex = commandIndex % numSimplifiedPacketsPerDRAMLine;
	const dramLinePackedPacket& thisDramLine = recordedCommandListPacketDataStart[dramIndex];
	const SimplifiedCommandPacket& thisSimplifiedCommand = thisDramLine.simplifiedPackets[localDramReadIndex];
#ifdef _DEBUG
	if ( (const BYTE* const)(&thisSimplifiedCommand + 1) - LocalMemory > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Error: Reading outside of VRAM not allowed!
	}
#endif
	GPUCommandList::ConvertSimplifiedCommandPacketToCommandPacket(&thisSimplifiedCommand, &resolvedPacketData);
	return true;
#endif // #ifndef USE_PLAYBACK_LOCAL_MEMORY
}

static void DumpCommandDisassemblyToFile(const std::vector<genericCommand>& thisFrameCommands, const char* const filenameBase, const unsigned __int64 frameID)
{
	char outputFilepath[MAX_PATH] = {0};
	sprintf_s(outputFilepath, "%s_Frame%I64u.log", filenameBase, frameID);
#pragma warning(push)
#pragma warning(disable:4996)
	FILE* f = fopen(outputFilepath, "wb");
#pragma warning(pop)
	if (!f)
	{
		printf("Error: Cannot open frame-dump logfile \"%s\" for writing!\n", outputFilepath);
		return;
	}

	std::vector<const std::string*> disassembledCommandStrings;
	const bool disassembleReferencedCommandLists =
#ifdef USE_PLAYBACK_LOCAL_MEMORY
		true;
#else
		false;
#endif
	DisassemblePacketsStream(disassembledCommandStrings, disassembleReferencedCommandLists, &thisFrameCommands.front(), thisFrameCommands.size() );

	const unsigned numCommandStrings = disassembledCommandStrings.size();
	for (unsigned x = 0; x < numCommandStrings; ++x)
	{
		const std::string* const thisCommandString = disassembledCommandStrings[x];
		fwrite(&thisCommandString->front(), thisCommandString->length(), 1, f);
		delete thisCommandString;
	}
	disassembledCommandStrings.clear();

	fclose(f);
	f = NULL;
}

int main(const int argc, const char* const argv[])
{
	InitPacketDisassembly(&ResolveCommandListPacket);

	const char* recordingFilePath = NULL;
	char recordingFile[MAX_PATH] = {0};
	const char* LoadDLLPath = NULL;
	char endpointDLLPath[MAX_PATH] = {0};
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
		openFilenameStruct.lpstrTitle = "Load a recording file to play";
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

	{
		OPENFILENAMEA openFilenameStruct = {0};
		openFilenameStruct.lStructSize = sizeof(openFilenameStruct);
		openFilenameStruct.lpstrFilter = "Endpoint DLL (*.dll)\0*.DLL";
		openFilenameStruct.lpstrFile = endpointDLLPath;
		openFilenameStruct.nMaxFile = ARRAYSIZE(endpointDLLPath);
		openFilenameStruct.lpstrTitle = "Load an endpoint DLL as the playback engine";
		openFilenameStruct.Flags = OFN_ENABLESIZING | OFN_FILEMUSTEXIST | OFN_NOCHANGEDIR | OFN_PATHMUSTEXIST;
		openFilenameStruct.lpstrDefExt = "DLL";
		if (GetOpenFileNameA(&openFilenameStruct) )
		{
			LoadDLLPath = openFilenameStruct.lpstrFile;
		}
	}

	if (!LoadDLLPath || !*LoadDLLPath)
	{
		printf("Error: No endpoint DLL selected! You must specify an endpoint DLL to load.\n");
		return 1;
	}

	HANDLE hRecordingFile = CreateFileA(recordingFilePath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL | FILE_FLAG_SEQUENTIAL_SCAN, NULL);
	if (hRecordingFile == INVALID_HANDLE_VALUE)
	{
		printf("Error in CreateFileA(\"%s\"). GLE: %u\n", recordingFilePath, GetLastError() );
		return 1;
	}

	char fname[_MAX_FNAME + 1] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	_splitpath(recordingFilePath, NULL, NULL, fname, NULL);
#pragma warning(pop)

	LARGE_INTEGER fileSize = {0};
	GetFileSizeEx(hRecordingFile, &fileSize);

	readCache* const readFileCache = new readCache;
	readFileCache->ResetFile(hRecordingFile, fileSize.QuadPart);

	printf("Parsing recorded stream file \"%s\"...\n", recordingFilePath);

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
		if (!readFileCache->ReadBytes(hRecordingFile, &nextPacket, sizeof(nextPacket) ) )
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
		case command::PT_WRITEMEMBATCHCONFIG:
		{
#ifdef USE_PLAYBACK_LOCAL_MEMORY
			const writeMemBatchConfigCommand* const writeMemBatchConfigPacket = reinterpret_cast<const writeMemBatchConfigCommand* const>(&nextPacket);
			currentBatchMemoryWritePtr = LocalMemory + writeMemBatchConfigPacket->writeBeginAddr;
#endif // #ifdef USE_PLAYBACK_LOCAL_MEMORY
		}
			continue;
		case command::PT_WRITEMEMBATCH0:
		{
#ifdef USE_PLAYBACK_LOCAL_MEMORY
			const writeMemBatchData0Command* const writeMemBatchData0Packet = reinterpret_cast<const writeMemBatchData0Command* const>(&nextPacket);
			currentBatchWriteData[0] = writeMemBatchData0Packet->writeDWORDData0;
			currentBatchWriteData[1] = writeMemBatchData0Packet->writeDWORDData1;
#endif // #ifdef USE_PLAYBACK_LOCAL_MEMORY
		}
			continue;
		case command::PT_WRITEMEMBATCH1:
		{
#ifdef USE_PLAYBACK_LOCAL_MEMORY
			const writeMemBatchData1Command* const writeMemBatchData1Packet = reinterpret_cast<const writeMemBatchData1Command* const>(&nextPacket);
			currentBatchWriteData[2] = writeMemBatchData1Packet->writeDWORDData2;
			currentBatchWriteData[3] = writeMemBatchData1Packet->writeDWORDData3;
#endif // #ifdef USE_PLAYBACK_LOCAL_MEMORY
		}
			continue;
		case command::PT_WRITEMEMBATCH2:
		{
#ifdef USE_PLAYBACK_LOCAL_MEMORY
			const writeMemBatchData2Command* const writeMemBatchData2Packet = reinterpret_cast<const writeMemBatchData2Command* const>(&nextPacket);
			currentBatchWriteData[4] = writeMemBatchData2Packet->writeDWORDData4;
			currentBatchWriteData[5] = writeMemBatchData2Packet->writeDWORDData5;
#endif // #ifdef USE_PLAYBACK_LOCAL_MEMORY
		}
			continue;
		case command::PT_WRITEMEMBATCH3WRITE:
		{
#ifdef USE_PLAYBACK_LOCAL_MEMORY
			const writeMemBatchData3WriteCommand* const writeMemBatchData3WritePacket = reinterpret_cast<const writeMemBatchData3WriteCommand* const>(&nextPacket);
			currentBatchWriteData[6] = writeMemBatchData3WritePacket->writeDWORDData6;
			currentBatchWriteData[7] = writeMemBatchData3WritePacket->writeDWORDData7;

			memcpy(currentBatchMemoryWritePtr, currentBatchWriteData, sizeof(currentBatchWriteData) );
			currentBatchMemoryWritePtr += 32;
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
		!dllInfo.H2DFunctions.EndFrame || 
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

	registeredKeys.push_back(registeredKey(VK_SPACE, SpaceDownCallback, (registeredKey::CallbackFunc)NULL) );
	registeredKeys.push_back(registeredKey(VK_RIGHT, RightCallback, (registeredKey::CallbackFunc)NULL) );
	registeredKeys.push_back(registeredKey(VK_NEXT, PageDownCallback, (registeredKey::CallbackFunc)NULL) );
	registeredKeys.push_back(registeredKey(VK_PRIOR, PageUpCallback, (registeredKey::CallbackFunc)NULL) );
	registeredKeys.push_back(registeredKey('R', ResetButtonCallback, (registeredKey::CallbackFunc)NULL) );
	registeredKeys.push_back(registeredKey('D', DisassembleFrameCommandStreamButtonCallback, (registeredKey::CallbackFunc)NULL) );

	std::vector<genericCommand> thisFrameCommands;

	unsigned __int64 currentFrame = 0;
	DWORD lastInputTimestamp = 0x00000000;
	LARGE_INTEGER nextFrameTick = {0};
	QueryPerformanceFrequency(&freq);
	ldfreq = (const double)freq.QuadPart;
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
		readFileCache->ResetFile(hRecordingFile, fileSize.QuadPart);

		// Reset our frame-counter:
		currentFrame = 0;

		for (unsigned __int64 readSoFar = 0; readSoFar < (const unsigned __int64)fileSize.QuadPart; readSoFar += sizeof(genericCommand) )
		{
			const DWORD currentTimestamp = GetTickCount();
			if (currentTimestamp != lastInputTimestamp)
			{
				lastInputTimestamp = currentTimestamp;

				UpdateInput();

				if (restartAtBeginning)
				{
					restartAtBeginning = false;
					break;
				}

				if (endpointWindow)
				{
					char buffer[128] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
					sprintf(buffer, "[%s] [%u FPS] Frame %llu/%llu", 
						currentPlaybackMode == playing ? "Playing" : "Paused", 
						playbackFramerate > 1000 ? 9999 : playbackFramerate, 
						currentFrame, 
						endFrameEventCount);
#pragma warning(pop)
					SetWindowTextA(endpointWindow, buffer);
				}
			}

			if (playToNextFrame == false)
			{
				if (playbackFramerate > 0)
				{
					WaitUntilTime(nextFrameTick);
					QueryPerformanceCounter(&nextFrameTick);
					nextFrameTick.QuadPart += (const unsigned __int64)(ldfreq / (const double)playbackFramerate);
					playToNextFrame = true;
				}
				else
				{
					while (playToNextFrame == false)
					{
						UpdateInput();

						doNothingCommand noopPacket;
						noopPacket.checksum = command::ComputeChecksum(&noopPacket, sizeof(noopPacket) );
						(*dllInfo.H2DFunctions.ProcessNewMessage)(reinterpret_cast<const genericCommand* const>(&noopPacket) );

						Sleep(16);
					}
				}
			}

			genericCommand nextPacket;
			if (!readFileCache->ReadBytes(hRecordingFile, &nextPacket, sizeof(nextPacket) ) )
			{
#ifdef _DEBUG
				__debugbreak(); // Error reading bytes from read cache!
#endif
			}

			thisFrameCommands.push_back(nextPacket);

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
			switch (nextPacket.type)
			{
			case command::PT_WAITFORDEVICEIDLE:
			{
				const waitForDeviceIdleCommand* const nextWaitPacket = (const waitForDeviceIdleCommand* const)&nextPacket;
				if (nextWaitPacket->returnCPUValue)
				{
					GetReturnTrackerSingleton().RegisterNewWaitForIdleReturn(nextWaitPacket);
					thisFrameWaitForIdleIdentifiers.push_back(nextWaitPacket->returnValueToCPU);
				}
			}
				break;
			case command::PT_READMEM:
			{
				const readMemCommand* const nextReadRequestPacket = (const readMemCommand* const)&nextPacket;
				GetReturnTrackerSingleton().RegisterNewReadReturn(nextReadRequestPacket);
				const DWORD dwByteAddr = nextReadRequestPacket->readDWORDAddr + (nextReadRequestPacket->dwordSelect * sizeof(DWORD) );
				thisFrameWaitForReadAddresses.push_back( (const gpuvoid* const)dwByteAddr);
			}
				break;
			case command::PT_ENDFRAME:
				if (dumpCurrentFrameDisassembly)
				{
					DumpCommandDisassemblyToFile(thisFrameCommands, fname, currentFrame);

					dumpCurrentFrameDisassembly = false;
				}

				++currentFrame;
				playToNextFrame = false;

				thisFrameCommands.clear();
				break;
			default:
				break;
			}

			(*dllInfo.H2DFunctions.ProcessNewMessage)(&nextPacket);

			if (nextPacket.type == command::PT_ENDFRAME)
			{
				(*dllInfo.H2DFunctions.EndFrame)();

				const unsigned numWaitForIdles = thisFrameWaitForIdleIdentifiers.size();
				for (unsigned x = 0; x < numWaitForIdles; ++x)
				{
					while (GetReturnTrackerSingleton().AsyncTryGetWaitReturn(thisFrameWaitForIdleIdentifiers[x]) == false)
					{
						(*dllInfo.H2DFunctions.RecvNextPacket)();
					}
				}
				thisFrameWaitForIdleIdentifiers.clear();

				const unsigned numWaitForReads = thisFrameWaitForReadAddresses.size();
				for (unsigned x = 0; x < numWaitForReads; ++x)
				{
					DWORD discardReadData;
					while (GetReturnTrackerSingleton().AsyncTryGetReadReturn(thisFrameWaitForReadAddresses[x], &discardReadData) == false)
					{
						(*dllInfo.H2DFunctions.RecvNextPacket)();
					}
				}
				thisFrameWaitForReadAddresses.clear();
			}
		}
	}
	while (bInfiniteLoop);

	// Call ShutdownEndpoint() to destruct our endpoint before we call FreeLibrary() to unload the DLL:
	(*dllInfo.H2DFunctions.ShutdownEndpoint)();

	delete readFileCache;

	FreeLibrary(loadedDLL);
	loadedDLL = NULL;

    return 0;
}
