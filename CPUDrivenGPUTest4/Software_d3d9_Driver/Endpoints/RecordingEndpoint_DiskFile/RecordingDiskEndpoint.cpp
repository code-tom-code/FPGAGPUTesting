#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include <ctime>
#include <Windows.h>
#include <stdio.h>
#include "RecordingDiskEndpoint.h"
#include "..\..\Software_d3d9_Driver\SimpleInstrumentedProfiler.h"
#include "..\..\Software_d3d9_Driver\Utilities\ThreadNaming.h"
#include <vector>
#include "..\..\Software_d3d9_Driver\INIVar.h"

static HANDLE hRecordingFile = INVALID_HANDLE_VALUE;
INIVar RecordingDirectoryBase("RecordingDiskEndpoint", "RecordingDirectoryBase", "C:\\CommandStreamRecordings");
static CRITICAL_SECTION lockCS = {0};
static std::vector<genericCommand> callerSideWritePacketsBuffer; // This is the buffer that the caller of this endpoint writes into. It's just a simple vector push_back on a local thread, so there's no thread contention or IO.
static std::vector<genericCommand> bufferedWritePackets; // This is the locked buffer that is contended between the endpoint thread and the IO thread.
static HANDLE hWriterThread = NULL;
static BOOL bDone = FALSE;

static DWORD WINAPI WorkerThreadStart(LPVOID lpThreadParameter)
{
	UtilSetThreadName("RecordingDiskEndpoint Worker");

	std::vector<genericCommand> localCopyPackets;
	while (!bDone)
	{
		if (localCopyPackets.empty() )
		{
			EnterCriticalSection(&lockCS);
			bufferedWritePackets.swap(localCopyPackets);
			LeaveCriticalSection(&lockCS);
		}
		else
		{
			EnterCriticalSection(&lockCS);
			if (!bufferedWritePackets.empty() )
			{
				localCopyPackets.insert(localCopyPackets.end(), bufferedWritePackets.begin(), bufferedWritePackets.end() );
				bufferedWritePackets.clear();
			}
			LeaveCriticalSection(&lockCS);
		}

		if (localCopyPackets.size() < 1024)
		{
			Sleep(1);
			continue;
		}

		if (hRecordingFile != INVALID_HANDLE_VALUE)
		{
			SIMPLE_NAME_SCOPE("RecordingDiskEndpointThread:WriteFileData");
			DWORD numBytesWritten = 0;
			const DWORD writeSize = (const DWORD)(localCopyPackets.size() * sizeof(genericCommand) );
			if (!WriteFile(hRecordingFile, &localCopyPackets.front(), writeSize, &numBytesWritten, NULL) || numBytesWritten != writeSize)
			{
#ifdef _DEBUG
				__debugbreak(); // Error in writing to the file!
#endif
			}
		}
#ifdef _DEBUG
		else
		{
			__debugbreak(); // Should never call this after the file handle has been closed!
		}
#endif
		localCopyPackets.clear();
	}

	EnterCriticalSection(&lockCS);
	if (!bufferedWritePackets.empty() )
	{
		localCopyPackets.insert(localCopyPackets.end(), bufferedWritePackets.begin(), bufferedWritePackets.end() );
		bufferedWritePackets.clear();
	}
	LeaveCriticalSection(&lockCS);

	// Flush our buffer on shutdown!
	if (hRecordingFile != INVALID_HANDLE_VALUE && !localCopyPackets.empty() )
	{
		DWORD numBytesWritten = 0;
		const DWORD writeSize = (const DWORD)(localCopyPackets.size() * sizeof(genericCommand) );
		if (!WriteFile(hRecordingFile, &localCopyPackets.front(), writeSize, &numBytesWritten, NULL) || numBytesWritten != writeSize)
		{
#ifdef _DEBUG
			__debugbreak(); // Error in writing to the file!
#endif
		}
	}

	return 0;
}

const bool InitRecording()
{
	bufferedWritePackets.clear();

	const time_t currentTime = time(NULL);
#pragma warning(push)
#pragma warning(disable:4996)
	const tm timeStruct = *localtime(&currentTime);
#pragma warning(pop)

	if (!CreateDirectoryA(RecordingDirectoryBase.String(), NULL) )
	{
		const DWORD lastErr = GetLastError();
		if (lastErr != ERROR_ALREADY_EXISTS)
		{
#ifdef _DEBUG
			__debugbreak(); // Error! Failed to ensure that the host directory exists!
#endif
			return false;
		}
	}

	char exeFilepath[MAX_PATH] = {0};
	GetModuleFileNameA(NULL, exeFilepath, ARRAYSIZE(exeFilepath) - 1);

	char exeFilename[MAX_PATH] = {0};
	_splitpath_s(exeFilepath, NULL, 0, NULL, 0, exeFilename, ARRAYSIZE(exeFilename) - 1, NULL, 0);

	char recordingFilepath[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(recordingFilepath, "%s\\%s_%i-%02i-%02i_%02i-%02i-%02i.rsd", RecordingDirectoryBase.String(), 
		exeFilename,
		timeStruct.tm_year + 1900, // Year
		timeStruct.tm_mon + 1, // Month
		timeStruct.tm_mday, // Day
		timeStruct.tm_hour, // Hour
		timeStruct.tm_min, // Minute
		timeStruct.tm_sec // Second
		);
#pragma warning(pop)
	hRecordingFile = CreateFileA(recordingFilepath, GENERIC_WRITE, FILE_SHARE_READ, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hRecordingFile == INVALID_HANDLE_VALUE)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

	InitializeCriticalSection(&lockCS);

	hWriterThread = CreateThread(NULL, NULL, &WorkerThreadStart, NULL, 0, NULL);
	if (hWriterThread == NULL)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return false;
	}

	return true;
}

// TODO: Record using some sort of frame format so that we can include Present() timestamps for each frame so that our frame timeline is correct for playback
void RecordNewIncomingPacket(const genericCommand* H2DCommandPacket)
{
	if (!H2DCommandPacket)
	{
#ifdef _DEBUG
		__debugbreak(); // Never call this function with a null packet pointer!
#endif
		return;
	}

	// Handle packets that we need to send responses to:
	switch (H2DCommandPacket->type)
	{
	default: // Don't send a response to most packets!
		break;
	case command::PT_READMEM:
	{
		const readMemCommand* const readMemPacket = reinterpret_cast<const readMemCommand* const>(H2DCommandPacket);

		// Send back a return packet containing the read memory:
		readMemResponse readResponse;
		readResponse.readDWORDAddr = readMemPacket->readDWORDAddr | (readMemPacket->dwordSelect << 2);
		readResponse.value = 0x00000000; // Don't actually read the memory. Since this is a recording endpoint, we don't have access to the memory anyway.
		readResponse.checksum = 0;
		readResponse.checksum = command::ComputeChecksum(&readResponse, sizeof(readResponse) );
		(*E2HReturnMessageCallback)(reinterpret_cast<const genericCommand* const>(&readResponse) );
	}
		break;
	case command::PT_WAITFORDEVICEIDLE:
	{
		const waitForDeviceIdleCommand* const waitForDeviceIdlePacket = reinterpret_cast<const waitForDeviceIdleCommand* const>(H2DCommandPacket);
		if (waitForDeviceIdlePacket->returnCPUValue)
		{
			// Return the value to the Host so that it knows we're done processing:
			waitResponse response;
			response.value = waitForDeviceIdlePacket->returnValueToCPU;
			response.checksum = 0;
			response.checksum = command::ComputeChecksum(&response, sizeof(response) );
			(*E2HReturnMessageCallback)(reinterpret_cast<const genericCommand* const>(&response) );
		}
	}
		break;
	}

	callerSideWritePacketsBuffer.push_back(*H2DCommandPacket);

	if (callerSideWritePacketsBuffer.size() >= 64)
	{
		SIMPLE_NAME_SCOPE("RecordingDiskEndpoint: Main Thread Flush");
		EnterCriticalSection(&lockCS);
		bufferedWritePackets.insert(bufferedWritePackets.end(), callerSideWritePacketsBuffer.begin(), callerSideWritePacketsBuffer.end() );
		LeaveCriticalSection(&lockCS);
		callerSideWritePacketsBuffer.clear();
	}
}

void ShutdownRecording()
{
	bDone = true;
	if (hWriterThread != NULL)
	{
		if (!callerSideWritePacketsBuffer.empty() )
		{
			EnterCriticalSection(&lockCS);
			bufferedWritePackets.insert(bufferedWritePackets.end(), callerSideWritePacketsBuffer.begin(), callerSideWritePacketsBuffer.end() );
			LeaveCriticalSection(&lockCS);
			callerSideWritePacketsBuffer.clear();
		}

		WaitForSingleObject(hWriterThread, 2048);
#ifdef _DEBUG
		DWORD threadExitCode = 0;
		if (!GetExitCodeThread(hWriterThread, &threadExitCode) || threadExitCode != 0)
		{
			__debugbreak();
		}
#endif
	}

	CloseHandle(hRecordingFile);
	hRecordingFile = INVALID_HANDLE_VALUE;
}
