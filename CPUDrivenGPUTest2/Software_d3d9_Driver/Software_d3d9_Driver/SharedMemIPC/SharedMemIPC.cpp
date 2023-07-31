#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include "SharedMemIPC.h"

#include <Windows.h>
#include <stdio.h>
#include <string>

static const char* const DirectoryFilePath = "Local\\IPC_DirectoryMemory";
static const char* const IPCRingBuffersPath = "Local\\IPC_RingBufferMemory_PID%u";

/*static*/ void IPC_RingBuffer::AdvancePointer(volatile unsigned* const ptr, const unsigned advanceBytes)
{
	const unsigned startingPointer = *ptr;
	const unsigned newPointer = (startingPointer + advanceBytes) & (ARRAYSIZE(bufferData) - 1);

	// Because we don't have concurrent writers in this case, we don't need to use atomics here (ie. the reader
	// may only advance the read pointer, and the writer may only advance the write pointer).
	*ptr = newPointer;
}

// The write function blocks internally until enough space is available in the ring buffer for writing.
void IPC_RingBuffer::WriteData(const void* const newData, const unsigned numBytesToWrite)
{
#ifdef _DEBUG
	if (numBytesToWrite >= ARRAYSIZE(bufferData) - 2)
	{
		__debugbreak(); // Error: Can never write this many bytes into the ring buffer without overflowing!
	}
#endif
	while (!CanWriteBytes(numBytesToWrite) )
	{
		YieldProcessor(); // Hot spin-loop to wait for the read pointer to advance
	}

	const unsigned char* newWriteByteData = reinterpret_cast<const unsigned char* const>(newData);

	// Memcpy first half of write data (or all of it in the common case)
	const unsigned initialWriteSlackFirstPart = ARRAYSIZE(bufferData) - writePtr;
	const unsigned firstWritePartSize = min(numBytesToWrite, initialWriteSlackFirstPart);
	memcpy( (void* const)(bufferData + writePtr), newData, firstWritePartSize);

	// Memcpy second half of write data if there's any remaining
	const unsigned secondWritePartSize = numBytesToWrite - firstWritePartSize;
	if (secondWritePartSize > 0)
	{
		memcpy( (void* const)bufferData, newWriteByteData + firstWritePartSize, secondWritePartSize);
	}

	// Advance our write pointer:
	AdvancePointer(&writePtr, numBytesToWrite);
}

void IPC_RingBuffer::ReadData(void* const newReadData, const unsigned numBytesToRead)
{
	while (GetCurrentSize() < numBytesToRead)
	{
		YieldProcessor(); // Sit in a hot spin-loop blocking the thread while waiting for our data to arrive!
	}
#ifdef _DEBUG
	if (IsReadEmpty() )
	{
		__debugbreak(); // Error: Don't call this function unless there's data to be read!
	}
#endif

	unsigned char* newReadByteData = reinterpret_cast<unsigned char* const>(newReadData);

	// Memcpy first half of read data (or all of it in the common case)
	const unsigned initialReadSlackFirstPart = ARRAYSIZE(bufferData) - readPtr;
	const unsigned firstReadPartSize = min(numBytesToRead, initialReadSlackFirstPart);
	memcpy(newReadData, (const void* const)(bufferData + readPtr), firstReadPartSize);

	// Memcpy second half of read data if there's any remaining
	const unsigned secondReadPartSize = numBytesToRead - firstReadPartSize;
	if (secondReadPartSize > 0)
	{
		memcpy(newReadByteData + firstReadPartSize, (const void* const)bufferData, secondReadPartSize);
	}

	// Advance our read pointer:
	AdvancePointer(&readPtr, numBytesToRead);
}

// If we're full on write data, then the writer *must* wait for the reader to catch up and read some more data before it's allowed to write any more
const bool IPC_RingBuffer::IsWriteFull() const
{
	return writePtr == ( (readPtr - 1) & (ARRAYSIZE(bufferData) - 1) );
}

const unsigned IPC_RingBuffer::GetCurrentSize() const
{
	return (writePtr - readPtr) & (ARRAYSIZE(bufferData) - 1);
}

// If we're empty on read data, then the reader is fully caught up to the writer and there is no more new data to be read
const bool IPC_RingBuffer::IsReadEmpty() const
{
	return readPtr == writePtr;
}

// Returns true if the specified number of bytes are available to be written by the writer, or false if there's not enough space in the ring buffer
const bool IPC_RingBuffer::CanWriteBytes(const unsigned byteLength) const
{
	const unsigned testAgainstLength = byteLength + 1;
	return (ARRAYSIZE(bufferData) - GetCurrentSize() ) > testAgainstLength;
	/*const unsigned potentialNewWritePtr = (writePtr + byteLength) & (ARRAYSIZE(bufferData) - 1);
	const unsigned newWriteSlack = (readPtr - potentialNewWritePtr) & (ARRAYSIZE(bufferData) - 1);
	return newWriteSlack >= 1; // The write pointer is *never* allowed to catch up to the read pointer. If it did, then our ring buffer would become "empty".
	*/
}

/*static*/ const bool IPC_ConnectionManager::DoesDirectoryFileExist()
{
	HANDLE mappedFile = OpenFileMappingA(FILE_MAP_ALL_ACCESS, FALSE, DirectoryFilePath);
	if (mappedFile != NULL)
	{
		CloseHandle(mappedFile);
		mappedFile = NULL;
		return true;
	}
	return false;
}

const std::string GetIPCRingBufferFileName(const DWORD pid)
{
	char IPCRingBufferFileName[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(IPCRingBufferFileName, IPCRingBuffersPath, pid);
#pragma warning(pop)
	return std::string(IPCRingBufferFileName);
}

// This function blocks until the server's directory file is created, so if the client starts up before the server, the client will block here and wait for the server to init.
void IPC_ConnectionManager::ClientRegisterWithServerDirectory()
{
	ValidateExpectedModeMatch(IPCM_Client);

	// Block this function until the directory file is created by the server:
	DirectorySharedFile = NULL;
	while (DirectorySharedFile == NULL)
	{
		DirectorySharedFile = OpenFileMappingA(FILE_MAP_ALL_ACCESS, FALSE, DirectoryFilePath);
		if (!DirectorySharedFile)
		{
			Sleep(1);
		}
	}

	DirectoryMappedMemory = reinterpret_cast<DirectoryStruct* const>(MapViewOfFile(DirectorySharedFile, FILE_MAP_ALL_ACCESS, 0, 0, sizeof(DirectoryStruct) ) );
	if (!DirectoryMappedMemory)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		printf("Error in MapViewOfFile(). GLE: %u\n", GetLastError() );
		CloseHandle(DirectorySharedFile);
		DirectorySharedFile = NULL;
		return;
	}

	const DWORD currentProcessID = GetCurrentProcessId();
	ClientRegisteredSlotIndex = -1;
	for (unsigned x = 0; x < ARRAYSIZE(DirectoryStruct::directoryEntries); ++x)
	{
		if (DirectoryMappedMemory->directoryEntries[x] == 0)
		{
			if (InterlockedCompareExchange(&DirectoryMappedMemory->directoryEntries[x], currentProcessID, 0) == 0)
			{
				ClientRegisteredSlotIndex = x;
				break;
			}
		}
	}

	if (ClientRegisteredSlotIndex < 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Registration failed! Couldn't find a free registration slot to use!
#endif
		printf("Error: Client registration to server directory failed! No free registration slots available!\n");
		CloseHandle(DirectorySharedFile);
		DirectorySharedFile = NULL;
		return;
	}

	const std::string IPCRingBufferFileName = GetIPCRingBufferFileName(currentProcessID);
	ActiveConnections[0].RingBufferFileHandle = CreateFileMappingA(INVALID_HANDLE_VALUE, NULL, PAGE_READWRITE, 0, sizeof(IPC_FileStruct), IPCRingBufferFileName.c_str() );
	if (!ActiveConnections[0].RingBufferFileHandle)
	{
		const DWORD lastErr = GetLastError();
#ifdef _DEBUG
		__debugbreak();
#endif
		printf("Error trying to create new IPC ring buffer memory file: \"%s\". GLE: %u\n", IPCRingBufferFileName.c_str(), lastErr);
		ClientUnregisterWithServerDirectory();
		return;
	}

	ActiveConnections[0].RingBufferMappedMemory = reinterpret_cast<IPC_FileStruct* const>(MapViewOfFile(ActiveConnections[0].RingBufferFileHandle, FILE_MAP_ALL_ACCESS, 0, 0, sizeof(IPC_FileStruct) ) );
	if (!ActiveConnections[0].RingBufferMappedMemory)
	{
		const unsigned lastErr = GetLastError();
#ifdef _DEBUG
		__debugbreak();
#endif
		printf("Error in MapViewOfFile(). GLE: %u\n", lastErr);
		CloseHandle(ActiveConnections[0].RingBufferFileHandle);
		ActiveConnections[0].RingBufferFileHandle = NULL;
		ClientUnregisterWithServerDirectory();
		return;
	}

	ActiveConnections[0].ConnectionPID = DirectoryMappedMemory->serverOwnerPID;
#ifdef _DEBUG
	if (DirectoryMappedMemory->serverOwnerPID == 0)
	{
		__debugbreak(); // Error: Server PID should never be 0!
	}
#endif

	// Increment the generation index to let the server know that we've registered a new client:
	InterlockedIncrement(&DirectoryMappedMemory->generationIndex);

	printf("Client (PID: %u) has successfully connected to server (PID: %u)\n", GetCurrentProcessId(), ActiveConnections[0].ConnectionPID);
}

void IPC_ConnectionManager::ClientUnregisterWithServerDirectory()
{
	ValidateExpectedModeMatch(IPCM_Client);

	DirectoryMappedMemory->directoryEntries[ClientRegisteredSlotIndex] = 0;

	// Increment the generation index to let the server know that we've unregistered a new client:
	InterlockedIncrement(&DirectoryMappedMemory->generationIndex);

	UnmapViewOfFile(DirectoryMappedMemory);
	DirectoryMappedMemory = NULL;

	CloseHandle(DirectorySharedFile);
	DirectorySharedFile = NULL;
}

void IPC_ConnectionManager::ServerBroadcastDataToAllClients(const void* const broadcastData, const unsigned broadcastSizeBytes)
{
	ValidateExpectedModeMatch(IPCM_Server);

	for (unsigned x = 0; x < ARRAYSIZE(ActiveConnections); ++x)
	{
		if (ActiveConnections[x].RingBufferMappedMemory)
		{
			ActiveConnections[x].RingBufferMappedMemory->S2CRing.WriteData(broadcastData, broadcastSizeBytes);
		}
	}
}

const bool IPC_ConnectionManager::ServerDoesBroadcastFitAllClients(const unsigned broadcastSizeBytes) const
{
	ValidateExpectedModeMatch(IPCM_Server);

	for (unsigned x = 0; x < ARRAYSIZE(ActiveConnections); ++x)
	{
		if (ServerIsClientActive(x) )
		{
			if (!ActiveConnections[x].RingBufferMappedMemory->S2CRing.CanWriteBytes(broadcastSizeBytes) )
				return false;
		}
	}

	return true;
}

const bool IPC_ConnectionManager::ServerIsClientActive(const unsigned clientIndex) const
{
	ValidateExpectedModeMatch(IPCM_Server);

	// Guard our more expensive volatile memory read with a cheaper non-volatile memory read
	if (ActiveConnections[clientIndex].RingBufferMappedMemory != NULL)
	{
		return DirectoryMappedMemory->directoryEntries[clientIndex] != 0;
	}
	return false;
}

void IPC_ConnectionManager::ServerInitDirectory()
{
	ValidateExpectedModeMatch(IPCM_Server);

	if (DoesDirectoryFileExist() != false)
	{
#ifdef _DEBUG
		__debugbreak(); // Error! There's already another server process running! We only support one single process being the server on a machine at any one time!
#endif
		printf("Error: Server directory file found already existing (\"%s\"). Cannot overwrite existing server directory. Only one server can be running per-machine! Clients from a previous session may be holding onto the handle!\n", DirectoryFilePath);
		return;
	}
	DirectorySharedFile = CreateFileMappingA(INVALID_HANDLE_VALUE, NULL, PAGE_READWRITE, 0, sizeof(DirectoryStruct), DirectoryFilePath);
	if (!DirectorySharedFile)
	{
		const DWORD lastErr = GetLastError();
#ifdef _DEBUG
		__debugbreak();
#endif
		printf("Error trying to create IPC directory file: \"%s\". GLE: %u\n", DirectoryFilePath, lastErr);
		return;
	}

	DirectoryMappedMemory = reinterpret_cast<DirectoryStruct* const>(MapViewOfFile(DirectorySharedFile, FILE_MAP_ALL_ACCESS, 0, 0, sizeof(DirectoryStruct) ) );
	if (!DirectoryMappedMemory)
	{
		const DWORD lastErr = GetLastError();
#ifdef _DEBUG
		__debugbreak();
#endif
		printf("Error in MapViewOfFile(). GLE: %u\n", lastErr);
		return;
	}

	DirectoryMappedMemory->serverOwnerPID = GetCurrentProcessId();
}

IPC_ConnectionManager::~IPC_ConnectionManager()
{
	Shutdown();
}

void IPC_ConnectionManager::Shutdown()
{
	// Shut down all of our active connections:
	for (unsigned x = 0; x < ARRAYSIZE(ActiveConnections); ++x)
	{
		ActiveConnection& thisConnection = ActiveConnections[x];
		if (thisConnection.RingBufferMappedMemory)
		{
			if (ManagerMode == IPCM_Server)
			{
				if (!thisConnection.RingBufferMappedMemory->C2SRing.IsReadEmpty() )
				{
					thisConnection.RingBufferMappedMemory->C2SRing.readPtr = thisConnection.RingBufferMappedMemory->C2SRing.writePtr;
				}
			}
			else
			{
				if (!thisConnection.RingBufferMappedMemory->S2CRing.IsReadEmpty() )
				{
					thisConnection.RingBufferMappedMemory->S2CRing.readPtr = thisConnection.RingBufferMappedMemory->S2CRing.writePtr;
				}
			}

			UnmapViewOfFile(thisConnection.RingBufferMappedMemory);
			thisConnection.RingBufferMappedMemory = NULL;

			CloseHandle(thisConnection.RingBufferFileHandle);
			thisConnection.RingBufferFileHandle = NULL;

			thisConnection.ConnectionPID = 0;
		}
	}

	if (ManagerMode == IPCM_Client)
	{
		ClientUnregisterWithServerDirectory();
	}
	else
	{
		if (DirectoryMappedMemory)
		{
			UnmapViewOfFile(DirectoryMappedMemory);
			DirectoryMappedMemory = NULL;

			CloseHandle(DirectorySharedFile);
			DirectorySharedFile = NULL;
		}
	}
}

const unsigned IPC_ConnectionManager::GetCurrentActiveConnectionCount() const
{
	unsigned activeConnectionsCount = 0;
	for (unsigned x = 0; x < ARRAYSIZE(ActiveConnections); ++x)
	{
		if (ActiveConnections[x].RingBufferMappedMemory != NULL)
			++activeConnectionsCount;
	}

	return activeConnectionsCount;
}

void IPC_ConnectionManager::ServerUpdateDirectoryAndAcceptNewClients()
{
	ValidateExpectedModeMatch(IPCM_Server);

	// There's nothing to do! We're fully up to date with the latest generation update!
	const unsigned currentGenerationIndex = DirectoryMappedMemory->generationIndex;
	if (ServerPreviousGenerationUpdate == currentGenerationIndex)
		return;

	bool doRetryOpenConnection = false;

	for (unsigned x = 0; x < ARRAYSIZE(DirectoryMappedMemory->directoryEntries); ++x)
	{
		const unsigned currentEntryPID = DirectoryMappedMemory->directoryEntries[x];

		// If our client has unregistered from this slot, then we need to close this connection on our end too:
		if (currentEntryPID == 0 && ActiveConnections[x].RingBufferMappedMemory)
		{
			const unsigned clientClosingPID = ActiveConnections[x].ConnectionPID;
			UnmapViewOfFile(ActiveConnections[x].RingBufferMappedMemory);
			ActiveConnections[x].RingBufferMappedMemory = NULL;
			CloseHandle(ActiveConnections[x].RingBufferFileHandle);
			ActiveConnections[x].RingBufferFileHandle = NULL;
			ActiveConnections[x].ConnectionPID = 0;

			printf("Server closing disconnected client connection (client PID: %u)\n", clientClosingPID);
		}
		else if (currentEntryPID != 0 && ActiveConnections[x].RingBufferMappedMemory == NULL) // If our client has just registered for this slot, then we need to open up a new connection to it:
		{
			const std::string ringBufferFilename = GetIPCRingBufferFileName(currentEntryPID);
			ActiveConnections[x].RingBufferFileHandle = OpenFileMappingA(FILE_MAP_ALL_ACCESS, FALSE, ringBufferFilename.c_str() );
			if (!ActiveConnections[x].RingBufferFileHandle)
			{
				printf("Warning: Was unable to open ring buffer IPC file \"%s\". GLE: %u\n", ringBufferFilename.c_str(), GetLastError() );
				doRetryOpenConnection = true;
				continue;
			}

			ActiveConnections[x].RingBufferMappedMemory = reinterpret_cast<IPC_FileStruct* const>(MapViewOfFile(ActiveConnections[x].RingBufferFileHandle, FILE_MAP_ALL_ACCESS, 0, 0, sizeof(IPC_FileStruct) ) );
			if (!ActiveConnections[x].RingBufferMappedMemory)
			{
				printf("Warning: Was unable to map IPC file \"%s\". GLE: %u\n", ringBufferFilename.c_str(), GetLastError() );
				doRetryOpenConnection = true;

				CloseHandle(ActiveConnections[x].RingBufferFileHandle);
				ActiveConnections[x].RingBufferFileHandle = NULL;
				continue;
			}

			// Success! We now have an active connction to this client!
			ActiveConnections[x].ConnectionPID = currentEntryPID;

			printf("Server: New client connection established to client PID %u\n", currentEntryPID);
		}
		else if (currentEntryPID != ActiveConnections[x].ConnectionPID && ActiveConnections[x].RingBufferMappedMemory != NULL) // If we need to reopen this client connection because its PID has changed:
		{
			const unsigned oldClientPID = ActiveConnections[x].ConnectionPID;

			// Close this client connection; we'll reopen it next time we run through this update loop:
			UnmapViewOfFile(ActiveConnections[x].RingBufferMappedMemory);
			ActiveConnections[x].RingBufferMappedMemory = NULL;
			CloseHandle(ActiveConnections[x].RingBufferFileHandle);
			ActiveConnections[x].RingBufferFileHandle = NULL;
			ActiveConnections[x].ConnectionPID = 0;

			printf("Server closing disconnected + replaced client connection (client PID: %u)\n", oldClientPID);

			doRetryOpenConnection = true;
		}
	}

	// Finally, update our last-updated generation index:
	if (!doRetryOpenConnection)
	{
		ServerPreviousGenerationUpdate = currentGenerationIndex;
	}
}

void IPC_ConnectionManager::ValidateExpectedModeMatch(const IPC_ManagerMode testMode) const
{
#ifdef _DEBUG
	if (testMode != ManagerMode)
	{
		__debugbreak(); // Error: Cannot call this function from this client/server!
	}
#else
	UNREFERENCED_PARAMETER(testMode);
#endif
}
