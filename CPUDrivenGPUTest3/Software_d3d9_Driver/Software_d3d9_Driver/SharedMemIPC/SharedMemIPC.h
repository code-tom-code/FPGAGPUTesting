#pragma once

typedef void *HANDLE;

// Plan:
// Host process creates the directory file. If the directory file doesn't exist yet, then the host is not active yet. The client processes
// must wait for the directory file to exist - they cannot create their own.

static const unsigned MAX_SIMULTANEOUS_SERVER_CONNECTIONS = 8u;

enum IPC_ManagerMode : unsigned char
{
	IPCM_Server = 0,
	IPCM_Client
};

struct IPC_ConnectionManager
{
	struct DirectoryStruct
	{
		volatile __declspec(align(128) ) unsigned generationIndex = 0; // Clients atomically increment this in order to notify the server that they have updated the directory
		unsigned serverOwnerPID = 0;
		volatile __declspec(align(128) ) unsigned directoryEntries[MAX_SIMULTANEOUS_SERVER_CONNECTIONS] = {0};
	};

	HANDLE DirectorySharedFile = 0;
	DirectoryStruct* DirectoryMappedMemory = 0;
	IPC_ManagerMode ManagerMode = IPCM_Server;
	int ClientRegisteredSlotIndex = -1;
	unsigned ServerPreviousGenerationUpdate = 0;

	IPC_ConnectionManager(const IPC_ManagerMode mode) : ManagerMode(mode)
	{
	}

	~IPC_ConnectionManager();
	static const bool DoesDirectoryFileExist();

	// This function blocks until the server's directory file is created, so if the client starts up before the server, the client will block here and wait for the server to init.
	void ClientRegisterWithServerDirectory();

	void ClientUnregisterWithServerDirectory();
	void ServerInitDirectory();
	void ServerUpdateDirectoryAndAcceptNewClients();
	void Shutdown();
	const unsigned GetCurrentActiveConnectionCount() const;
	void ServerBroadcastDataToAllClients(const void* const broadcastData, const unsigned broadcastSizeBytes);
	const bool ServerDoesBroadcastFitAllClients(const unsigned broadcastSizeBytes) const;
	const bool ServerIsClientActive(const unsigned clientIndex) const;
	void ValidateExpectedModeMatch(const IPC_ManagerMode testMode) const;

	struct ActiveConnection
	{
		HANDLE RingBufferFileHandle = 0;
		struct IPC_FileStruct* RingBufferMappedMemory = 0;
		unsigned ConnectionPID = 0; // The PID of the process on the other end of this connection (so if we're a server, this is the client's PID, and if we're a client, then this is the server's PID).
	};
	
	// The client only ever has a single one of these (index 0), the server can have one for each directory entry:
	ActiveConnection ActiveConnections[MAX_SIMULTANEOUS_SERVER_CONNECTIONS] = {0};
};

// There's one of these rings for S2C comms, and another one for the C2S channel:
struct IPC_RingBuffer
{
	volatile __declspec(align(128) ) unsigned writePtr = 0;
	volatile __declspec(align(128) ) unsigned readPtr = 0;
	volatile __declspec(align(128) ) unsigned char bufferData[256 * 1024] = {0}; // This is 256KB, which should be plenty of data for our ring buffers

	// The write function blocks internally until enough space is available in the ring buffer for writing.
	void WriteData(const void* const newData, const unsigned numBytesToWrite);

	// The read function is not legal to call unless you call IsReadEmpty() and GetCurrentSize() first!
	void ReadData(void* const newReadData, const unsigned numBytesToRead);

	const unsigned GetCurrentSize() const; // Gets how much data is currently available for the reader to read
	const bool IsWriteFull() const; // If we're full on write data, then the writer *must* wait for the reader to catch up and read some more data before it's allowed to write any more
	const bool IsReadEmpty() const; // If we're empty on read data, then the reader is fully caught up to the writer and there is no more new data to be read
	const bool CanWriteBytes(const unsigned byteLength) const; // Returns true if the specified number of bytes are available to be written by the writer, or false if there's not enough space in the ring buffer
	static void AdvancePointer(volatile unsigned* const ptr, const unsigned advanceBytes);
};

struct IPC_FileStruct
{
	// Ring buffer for data sent from server to clients. The server writes, the client reads.
	__declspec(align(128) ) IPC_RingBuffer S2CRing = {0};

	volatile unsigned char paddingBuffer[128] = {0};

	// Ring buffer for data sent from clients to server. The client writes, the server reads.
	__declspec(align(128) ) IPC_RingBuffer C2SRing = {0};
};
