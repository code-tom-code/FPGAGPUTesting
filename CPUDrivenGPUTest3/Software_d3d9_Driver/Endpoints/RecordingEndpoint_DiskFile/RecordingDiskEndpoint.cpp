#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include <ctime>
#include <Windows.h>
#include <stdio.h>
#include "RecordingDiskEndpoint.h"
#include <vector>

static HANDLE hRecordingFile = INVALID_HANDLE_VALUE;
static const char* const RecordingDirectoryBase = "C:\\CommandStreamRecordings";
static std::vector<genericCommand> bufferedWritePackets;

const bool InitRecording()
{
	bufferedWritePackets.clear();

	const time_t currentTime = time(NULL);
#pragma warning(push)
#pragma warning(disable:4996)
	const tm timeStruct = *localtime(&currentTime);
#pragma warning(pop)

	if (!CreateDirectoryA(RecordingDirectoryBase, NULL) )
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

	char recordingFilepath[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(recordingFilepath, "%s\\CommandStreamRecord_%i-%02i-%02i_%02i-%02i-%02i.rsd", RecordingDirectoryBase, 
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
		return false;

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
		readResponse.readDWORDAddr = readMemPacket->readDWORDAddr;
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

	bufferedWritePackets.push_back(*H2DCommandPacket);

	if (bufferedWritePackets.size() >= 5958)
	{
		if (hRecordingFile != INVALID_HANDLE_VALUE)
		{
			DWORD numBytesWritten = 0;
			const DWORD writeSize = (const DWORD)(bufferedWritePackets.size() * sizeof(genericCommand) );
			if (!WriteFile(hRecordingFile, &bufferedWritePackets.front(), writeSize, &numBytesWritten, NULL) || numBytesWritten != writeSize)
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

		bufferedWritePackets.clear();
	}
}

void ShutdownRecording()
{
	// Flush our buffer on shutdown!
	if (!bufferedWritePackets.empty() )
	{
		DWORD numBytesWritten = 0;
		const DWORD writeSize = (const DWORD)(bufferedWritePackets.size() * sizeof(genericCommand) );
		if (!WriteFile(hRecordingFile, &bufferedWritePackets.front(), writeSize, &numBytesWritten, NULL) || numBytesWritten != writeSize)
		{
#ifdef _DEBUG
			__debugbreak(); // Error in writing to the file!
#endif
		}
		bufferedWritePackets.clear();
	}
	CloseHandle(hRecordingFile);
	hRecordingFile = INVALID_HANDLE_VALUE;
}
