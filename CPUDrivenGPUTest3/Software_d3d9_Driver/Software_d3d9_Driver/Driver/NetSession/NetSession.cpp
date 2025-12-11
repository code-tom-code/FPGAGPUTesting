#include "NetSession.h"
#include <timeapi.h>
#pragma comment(lib, "winmm.lib")

#include "..\..\SimpleInstrumentedProfiler.h"
#include "..\..\Utilities\ThreadNaming.h"

#pragma comment(lib, "ws2_32.lib")
#pragma comment(lib, "Synchronization.lib")

// Uncomment this to have the send thread and the receive thread spin all the time rather than sleeping when there's no packets to send/receive
// #define NO_SLEEPS_RECV 1
// #define NO_SLEEPS_SEND 1

static bool InitWinSock = false;
static const unsigned SHUTDOWN_TIMEOUT_MS = 1000u;
static const unsigned THREAD_SLEEP_MS =
#ifdef _DEBUG
	16u;
#else
	1u;
#endif
static bool Verbose_PrintAllPackets = false;
static bool Verbose_AlwaysPrintPacketBytes = false;

static const unsigned SEND_BUFFER_TOTAL_SIZE_BYTES = 1024 * 1024 * 64;
static const unsigned RECV_BUFFER_TOTAL_SIZE_BYTES = SEND_BUFFER_TOTAL_SIZE_BYTES;
static const unsigned ADDRESS_BUFFER_TOTAL_SIZE_BYTES = 1024 * 1024 * 4;
static_assert(COMPLETION_QUEUE_SIZE * RIOAllocBuffer::PACKET_SLICE_SIZE_BYTES <= SEND_BUFFER_TOTAL_SIZE_BYTES, "Error: Send buffer is too small to hold our desired number of concurrent sends!");
static_assert(COMPLETION_QUEUE_SIZE * RIOAllocBuffer::PACKET_SLICE_SIZE_BYTES <= RECV_BUFFER_TOTAL_SIZE_BYTES, "Error: Recv buffer is too small to hold our desired number of concurrent receives!");
static_assert(COMPLETION_QUEUE_SIZE * RIOAllocBuffer::ADDRESS_SLICE_SIZE_BYTES <= ADDRESS_BUFFER_TOTAL_SIZE_BYTES, "Error: Address buffer is too small to hold our desired number of concurrent receives!");

static const unsigned __int64 RECVFROM_REQUEST_FLAG = (1llu << 63llu);
static const unsigned SEND_DEQUEUE_BATCH_LIMIT = COMPLETION_QUEUE_SIZE / 2;
static_assert(SEND_DEQUEUE_BATCH_LIMIT < COMPLETION_QUEUE_SIZE, "Error: Cannot batch-send more packets than our completion queue allows!");

static const unsigned TIME_BETWEEN_SESSION_CONNECT_REQUESTS_MS = 256u;

static_assert(NET_PROTO_UDP_PORT_D2H != 0, "Error: 0 is not a valid UDP port number!");
static_assert(NET_PROTO_UDP_PORT_H2D != 0, "Error: 0 is not a valid UDP port number!");
static_assert(RIOAllocBuffer::PACKET_SLICE_SIZE_BYTES >= DeviceSessionPacket::MAX_USER_PACKET_SIZE, "Error: Send/Receive buffer is too small to contain a max-length packet!");

// Call this once at startup so that we don't have to keep calling it every time
static const unsigned short NETORDER_UDP_PORT_D2H = htons(NET_PROTO_UDP_PORT_D2H);
static const unsigned short NETORDER_UDP_PORT_H2D = htons(NET_PROTO_UDP_PORT_H2D);

#define SEND_ACK_RESEND_DUPLICATES 3
#define DISCONNECT_RESEND_DUPLICATES 3

// How long, in milliseconds, to wait between resends to avoid flooding the network
#ifdef _DEBUG
	#define SEND_RESEND_DELAY_MILLISECONDS 16.0f
#else
	#define SEND_RESEND_DELAY_MILLISECONDS 0.25f
#endif

static const BYTE ZERO_MAC_ADDR[6] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
static const BYTE BROADCAST_MAC_ADDR[6] = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };

static constexpr const GUID functionTableId = WSAID_MULTIPLE_RIO;
static RIO_EXTENSION_FUNCTION_TABLE RIOFunctionsTable = {NULL};

struct PIXScoped
{
	PIXScoped(const unsigned char colorIndex, const char* const eventString)
	{
#ifdef ENABLE_PIX_PROFILER
		PIXBeginEvent(PIX_COLOR_INDEX(colorIndex), eventString);
#endif
	}

	~PIXScoped()
	{
#ifdef ENABLE_PIX_PROFILER
		PIXEndEvent();
#endif
	}

private:
};

#ifndef ENABLE_PIX_PROFILER
	#define PIX_COLOR_INDEX(x) (x)
#endif

// Rounds up the number of bytes to the next multiple of 2MB:
static const unsigned _2MB = 2u * 1024u * 1024u;
static inline const unsigned RoundUpToNextMultiple_2MB(const unsigned inBytes)
{
	return ( (inBytes + _2MB - 1) / _2MB) * _2MB;
}

static void DebugPrintPacket(const char* const buf, const unsigned len, const bool isH2DPacket)
{
	bool printPacketBytes = Verbose_AlwaysPrintPacketBytes;
	if (len >= sizeof(PacketHeaderMagic) )
	{
		const PacketHeaderMagic* const packetHeader = reinterpret_cast<const PacketHeaderMagic* const>(buf);
		printf("\tPacket magic byte: 0x%02X (%s)\n", packetHeader->magicProtoValue, 
			packetHeader->magicProtoValue == PROTO_MAGIC_BYTE ? "VALID" : "INVALID");
		if (packetHeader->magicProtoValue != PROTO_MAGIC_BYTE)
		{
			printPacketBytes = true;
		}
		if (packetHeader->packetType >= command::PT_MAX_PACKET_TYPES)
		{
			printf("\tPacket type: %u (\"%s\")\n", packetHeader->packetType, "OUT_OF_BOUNDS_PACKET_TYPE");
		}
		else
		{
			printf("\tPacket type: %u (\"%s\")\n", packetHeader->packetType, packetTypeStrings[packetHeader->packetType]);
		}
		switch (packetHeader->packetType)
		{
		default:
			printf("\tUnhandled packet type. No packet disassembly available!\n");
			printPacketBytes = true;
			break;
		case command::PT_CONNBROADCAST:
		{
			const DeviceBroadcastPacket* const deviceBroadcastPacket = reinterpret_cast<const DeviceBroadcastPacket* const>(packetHeader);
			printf("\tDeviceNetProtoVersion: %u.%u\n", deviceBroadcastPacket->netProtoVersionMajorDevice, deviceBroadcastPacket->netProtoVersionMinorDevice);
			printf("\tDeviceMACAddress: %02X-%02X-%02X-%02X-%02X-%02X\n", 
				deviceBroadcastPacket->deviceMACAddress[0], 
				deviceBroadcastPacket->deviceMACAddress[1], 
				deviceBroadcastPacket->deviceMACAddress[2], 
				deviceBroadcastPacket->deviceMACAddress[3], 
				deviceBroadcastPacket->deviceMACAddress[4], 
				deviceBroadcastPacket->deviceMACAddress[5]);
			printf("\tDeviceIPv4Address: %u.%u.%u.%u\n", 
				deviceBroadcastPacket->deviceIPv4Address[0],
				deviceBroadcastPacket->deviceIPv4Address[1],
				deviceBroadcastPacket->deviceIPv4Address[2],
				deviceBroadcastPacket->deviceIPv4Address[3]);
			printf("\tNumBroadcastsSinceReset: %u\n", deviceBroadcastPacket->numBroadcastsSinceReset);
			printf("\tHasLostSession: %s\n", deviceBroadcastPacket->hasLostSession ? "TRUE" : "FALSE");
		}
			break;
		case command::PT_CONNREQUEST:
		{
			const HostRequestConnectSessionPacket* const sessionRequestPacket = reinterpret_cast<const HostRequestConnectSessionPacket* const>(packetHeader);
			printf("\tHostNetProtoVersion: %u.%u\n", sessionRequestPacket->netProtoVersionMajorHost, sessionRequestPacket->netProtoVersionMinorHost);
			printf("\tHostIPv4Address: %u.%u.%u.%u\n", 
				sessionRequestPacket->hostIPv4Address[3], // These are sent in reverse byte order for ease of reconstructing on the FPGA end
				sessionRequestPacket->hostIPv4Address[2],
				sessionRequestPacket->hostIPv4Address[1],
				sessionRequestPacket->hostIPv4Address[0]);
		}
			break;
		case command::PT_CONNRESPONSE:
		{
			const DeviceConnectSessionResponsePacket* const sessionResponsePacket = reinterpret_cast<const DeviceConnectSessionResponsePacket* const>(packetHeader);
			printf("\tStatus: %u (\"%s\")\n", sessionResponsePacket->status, 
				sessionResponsePacket->status < MAX_NUM_SESSION_CONNECT_RESPONSE_STATUS ? sessionConnectRequestReplyStatusStrings[sessionResponsePacket->status] : "OUT_OF_BOUNDS_STATUS");
		}
			break;
		case command::PT_DISCONNECT:
		{
			const SessionDisconnectPacket* const disconnectPacket = reinterpret_cast<const SessionDisconnectPacket* const>(packetHeader);
			printf("\tSenderIPv4Address: %u.%u.%u.%u\n", disconnectPacket->senderIPv4Address[0],
				disconnectPacket->senderIPv4Address[1],
				disconnectPacket->senderIPv4Address[2],
				disconnectPacket->senderIPv4Address[3]);
			printf("\tDisconnectReason: %u (\"%s\")\n", disconnectPacket->disconnectReason, 
				disconnectPacket->disconnectReason < MAX_NUM_SESSION_DISCONNECT_REASON ? sessionDisconnectReasonStrings[disconnectPacket->disconnectReason] : "OUT_OF_BOUNDS_REASON");
		}
			break;
		case command::PT_SESSIONCOMBOPACKET:
		{
			const DeviceSessionPacket* const sessionPacket = reinterpret_cast<const DeviceSessionPacket* const>(packetHeader);
			const Subpacket* const subpackets = reinterpret_cast<const Subpacket* const>(sessionPacket + 1);
			printf("\tPacketID: %c%u\n", isH2DPacket ? 'H' : 'D', sessionPacket->thisPacketID);
			printf("\tLastAckedPacketID: %c%u\n", isH2DPacket ? 'D' : 'H', sessionPacket->lastAckedPacketID);
			printf("\tPacketChecksum: 0x%02X (%s)\n", 
				sessionPacket->packetChecksum, 
				sessionPacket->CalculateHeaderChecksum() == sessionPacket->packetChecksum ? "VALID" : "INVALID");
			printf("\tPacketFlags: 0x%02X\n", sessionPacket->packetFlags);
			printf("\tSubpacketCount: %u\n", sessionPacket->subpacketCount);
			for (unsigned x = 0; x < sessionPacket->subpacketCount; ++x)
			{
				const Subpacket& thisSubpacket = subpackets[x];
				printf("\t\tSubpacket %u: SubpacketType: %u (\"%s\"); Payload0: 0x%08X; Payload1: 0x%08X;\n", 
					x,
					thisSubpacket.subpacketType,
					thisSubpacket.subpacketType < command::PT_MAX_PACKET_TYPES ? packetTypeStrings[thisSubpacket.subpacketType] : "OUT_OF_BOUNDS_PACKET_TYPE",
					thisSubpacket.payload0,
					thisSubpacket.payload1);
			}
		}
			break;
		}
	}

	if (printPacketBytes)
	{
		for (unsigned x = 0; x < len; ++x)
		{
			printf("%08X", buf[x]);
		}
		printf("\n");
	}
	printf("\n");
}

static RIORESULT sendCompletionResults[COMPLETION_QUEUE_SIZE] = {0};
void NetSession::WrappedSend(_In_reads_bytes_(len) const char* const buf, 
	_In_ const unsigned len, 
	_In_ const SOCKADDR_IN& sendAddr,
	_In_ const bool isBroadcastSend /*= false*/)
{
	if (Verbose_PrintAllPackets)
	{
		if (len < 1)
		{
			__debugbreak();
		}
		if (sendAddr.sin_addr.S_un.S_addr == INADDR_BROADCAST)
		{
			printf("[Verbose] Packet Send to (broadcast):%u. Packet length = %u bytes.\n", 
				ntohs(sendAddr.sin_port), 
				len);
		}
		else
		{
			printf("[Verbose] Packet Send to %u.%u.%u.%u:%u. Packet length = %u bytes.\n", 
				sendAddr.sin_addr.S_un.S_un_b.s_b1,
				sendAddr.sin_addr.S_un.S_un_b.s_b2,
				sendAddr.sin_addr.S_un.S_un_b.s_b3,
				sendAddr.sin_addr.S_un.S_un_b.s_b4,
				ntohs(sendAddr.sin_port),
				len);
		}

		DebugPrintPacket(buf, (const unsigned)len, true);
	}

	PIXScoped scope(5, "RIO Send");

	while (sendDataBuffer.GetNumAvailableSlices() < SEND_DEQUEUE_BATCH_LIMIT)
	{
		const unsigned numSendsCompleted = RIOFunctionsTable.RIODequeueCompletion(sendCQueue, sendCompletionResults, ARRAYSIZE(sendCompletionResults) );
		sendDataBuffer.ReleaseSlicesMultiple(numSendsCompleted);
	}

	const unsigned writeSliceID = sendDataBuffer.ConsumeNextAvailableSlice();
	RIO_BUF& sendSliceDesc = sendDataBuffer.GetSliceDescriptor(writeSliceID);
	sendSliceDesc.Length = len;
	char* const packetSendBuffer = sendDataBuffer.GetPacketSliceDataWrite(writeSliceID);
	memcpy(packetSendBuffer, buf, len);

	if (!RIOFunctionsTable.RIOSend(isBroadcastSend ? sendBroadcastRQueue : sendRQueue, &sendSliceDesc, 1, RIO_MSG_DONT_NOTIFY, reinterpret_cast<void* const>( (size_t)writeSliceID) ) )
	{
		__debugbreak();
	}
}

const unsigned NetSession::WrappedRecvFrom(_Out_ const char*& buf, 
	_Out_ const SOCKADDR_IN*& fromAddr)
{
	RIORESULT dequeueResult = {0};
	{
		PIXScoped scopedA(PIX_COLOR_INDEX(3), "RIO RecvFrom");

		const unsigned numDequeued = RIOFunctionsTable.RIODequeueCompletion(recvCQueue, &dequeueResult, 1);
		if (numDequeued == 0)
		{
			buf = NULL;
			fromAddr = NULL;
			return 0;
		}

	#ifdef _DEBUG
		if (!(dequeueResult.RequestContext & RECVFROM_REQUEST_FLAG) )
		{
			__debugbreak(); // Unexpected getting back a recv() completion result rather than a recvfrom() completion result.
		}
	#endif

		const unsigned incomingReadSliceID = static_cast<const unsigned>(dequeueResult.RequestContext);
		recvDataBuffer.ReleaseSlice(incomingReadSliceID);

		if (dequeueResult.RequestContext & RECVFROM_REQUEST_FLAG)
		{
			recvAddressBuffer.ReleaseSlice(incomingReadSliceID);
		}

		const unsigned nextWriteSliceID = recvDataBuffer.ConsumeNextAvailableSlice();
		const unsigned nextWriteAddrSliceID = recvAddressBuffer.ConsumeNextAvailableSlice();
	#ifdef _DEBUG
		if (nextWriteSliceID != nextWriteAddrSliceID)
		{
			__debugbreak();
		}
	#endif
	
		// Queue up another receiveFrom in our requests queue to replenish the previous request that we just dequeued
		if (!RIOFunctionsTable.RIOReceiveEx(recvRQueue, &recvDataBuffer.GetSliceDescriptor(nextWriteSliceID), 1, NULL, &recvAddressBuffer.GetSliceDescriptor(nextWriteAddrSliceID), NULL, NULL, 0, reinterpret_cast<void* const>(RECVFROM_REQUEST_FLAG | (size_t)nextWriteSliceID) ) )
		{
			__debugbreak();
		}
		buf = recvDataBuffer.GetPacketSliceDataRead(incomingReadSliceID);
		fromAddr = &(recvAddressBuffer.GetAddressSliceDataRead(incomingReadSliceID)->Ipv4);
	}

	if (Verbose_PrintAllPackets && dequeueResult.BytesTransferred > 0)
	{
		const unsigned packetLen = dequeueResult.BytesTransferred;
		if (fromAddr->sin_addr.S_un.S_addr == INADDR_BROADCAST)
		{
			printf("[Verbose] Packet Recv from (broadcast):%u. Packet length = %u bytes.\n", 
				ntohs(fromAddr->sin_port), 
				packetLen);
		}
		else
		{
			printf("[Verbose] Packet Recv from %u.%u.%u.%u:%u. Packet length = %u bytes.\n", 
				fromAddr->sin_addr.S_un.S_un_b.s_b1,
				fromAddr->sin_addr.S_un.S_un_b.s_b2,
				fromAddr->sin_addr.S_un.S_un_b.s_b3,
				fromAddr->sin_addr.S_un.S_un_b.s_b4,
				ntohs(fromAddr->sin_port),
				packetLen);
		}

		DebugPrintPacket(buf, packetLen, false);
	}

	return dequeueResult.BytesTransferred;
}

const unsigned NetSession::WrappedRecv(_Out_ const char*& buf,
	_In_ const SOCKADDR_IN& recvAddr)
{
	RIORESULT dequeueResult = {0};
	{
		PIXScoped scopeA(PIX_COLOR_INDEX(2), "RIO Recv");

		const unsigned numDequeued = RIOFunctionsTable.RIODequeueCompletion(recvCQueue, &dequeueResult, 1);
		if (numDequeued == 0)
		{
			buf = NULL;
			return 0;
		}

		const unsigned incomingReadSliceID = static_cast<const unsigned>(dequeueResult.RequestContext & 0xFFFFFFFF);
		recvDataBuffer.ReleaseSlice(incomingReadSliceID);

		if (dequeueResult.RequestContext & RECVFROM_REQUEST_FLAG)
		{
			recvAddressBuffer.ReleaseSlice(incomingReadSliceID);
		}

		const unsigned nextWriteSliceID = recvDataBuffer.ConsumeNextAvailableSlice();
	
		// Queue up another receive in our requests queue to replenish the previous request that we just dequeued
		if (!RIOFunctionsTable.RIOReceive(recvRQueue, &recvDataBuffer.GetSliceDescriptor(nextWriteSliceID), 1, 0, reinterpret_cast<void* const>( (size_t)nextWriteSliceID) ) )
		{
			__debugbreak();
		}
		buf = recvDataBuffer.GetPacketSliceDataRead(incomingReadSliceID);
	}

	if (Verbose_PrintAllPackets && dequeueResult.BytesTransferred > 0)
	{
		const unsigned packetLen = dequeueResult.BytesTransferred;
		if (recvAddr.sin_addr.S_un.S_addr == INADDR_BROADCAST)
		{
			printf("[Verbose] Packet Recv from (broadcast):%u. Packet length = %u bytes.\n", 
				ntohs(recvAddr.sin_port), 
				packetLen);
		}
		else
		{
			printf("[Verbose] Packet Recv from %u.%u.%u.%u:%u. Packet length = %u bytes.\n", 
				recvAddr.sin_addr.S_un.S_un_b.s_b1,
				recvAddr.sin_addr.S_un.S_un_b.s_b2,
				recvAddr.sin_addr.S_un.S_un_b.s_b3,
				recvAddr.sin_addr.S_un.S_un_b.s_b4,
				ntohs(recvAddr.sin_port),
				packetLen);
		}

		DebugPrintPacket(buf, packetLen, false);
	}

	return dequeueResult.BytesTransferred;
}

void RIOAllocBuffer::InitBuffer(const unsigned bufferSize_bytes)
{
	if (RIOFunctionsTable.RIORegisterBuffer == NULL)
	{
		printf("Error: May not call InitBuffer() before the RIO functions table is initialized!\n");
		__debugbreak();
		return;
	}

	// TODO: See about using the MEM_LARGE_PAGES flag on x64 processes:
	dataPtr = static_cast<char* const>(VirtualAlloc(NULL, bufferSize_bytes, MEM_COMMIT | MEM_RESERVE /*| MEM_LARGE_PAGES*/, PAGE_READWRITE) );
	if (!dataPtr)
	{
		printf("Error: VirtualAlloc(%u bytes) failed with error code: %u\n", bufferSize_bytes, GetLastError() );
		__debugbreak();
		return;
	}

	bufferID = RIOFunctionsTable.RIORegisterBuffer(dataPtr, bufferSize_bytes);
	if (bufferID == RIO_INVALID_BUFFERID)
	{
		printf("Error: RIORegisterBuffer() failed with error code: %i\n", WSAGetLastError() );
		__debugbreak();
		return;
	}
}

RIOAllocBuffer::~RIOAllocBuffer()
{
	if (dataPtr)
	{
		if (RIOFunctionsTable.RIODeregisterBuffer != NULL)
		{
			RIOFunctionsTable.RIODeregisterBuffer(bufferID);
		}
		bufferID = RIO_INVALID_BUFFERID;

		VirtualFree(dataPtr, 0, MEM_RELEASE);
		dataPtr = NULL;
	}
}

void NetworkStats::IncNetSend(const unsigned appPacketLenBytes)
{
	++numPacketsSentTotal;
	numEthBytesSentTotal += (appPacketLenBytes + sizeof(IPv4Header) + sizeof(UDPHeader) + sizeof(EthernetHeader) );
	numAppBytesSentTotal += appPacketLenBytes;
}

void NetworkStats::IncNetRecv(const unsigned appPacketLenBytes)
{
	++numPacketsRecvTotal;
	numEthBytesRecvTotal += (appPacketLenBytes + sizeof(IPv4Header) + sizeof(UDPHeader) + sizeof(EthernetHeader) );
	numAppBytesRecvTotal += appPacketLenBytes;
}

void ConnectedSessionStats::IncSessionSend(const unsigned char numSubpackets, bool isResendPacket /*= false*/)
{
	++numSessionPacketsSent;
	if (isResendPacket)
	{
		++numSessionPacketResends;
	}
	numSessionSubpacketsSent += numSubpackets;
	numSessionSubpacketsBytesSent += (numSubpackets * sizeof(Subpacket) );
}

void ConnectedSessionStats::IncSessionValidRecv(const unsigned char numSubpackets, bool isDuplicatePacket /*= false*/)
{
	++numSessionPacketsValidRecv;
	if (isDuplicatePacket)
	{
		++numSessionPacketDuplicatesRecv;
	}
	else // These subpacket recv stats only count valid and non-duplicated session packets:
	{
		numSessionSubpacketsRecv += numSubpackets;
		numSessionSubpacketsBytesRecv += (numSubpackets * sizeof(Subpacket) );
	}
}

void ConnectedSessionStats::IncSessionInvalidRecv()
{
	++numSessionPacketInvalidRecv;
}

CSObj::CSObj()
{
	InitializeCriticalSection(&cs);
}

CSObj::~CSObj()
{
	DeleteCriticalSection(&cs);
}

NetSession::NetSession()
{
	if (!InitWinSock)
	{
		WSAData wsaStartupData = {0};
		if (WSAStartup(MAKEWORD(2, 2), &wsaStartupData) != 0)
		{
			__debugbreak();
		}
		InitWinSock = true;

#ifdef INCREASE_TIMER_FREQUENCY
		const unsigned newTimerFrequencyMS = 1u;
		timeBeginPeriod(newTimerFrequencyMS);

		HMODULE ntdll = LoadLibraryA("ntdll.dll");
		if (!ntdll)
		{
			__debugbreak(); // This should always work, even under WINE.
		}

		typedef LONG (NTAPI *NtSetTimerResolutionType)(IN ULONG DesiredResolution, IN BOOLEAN SetResolution, OUT PULONG CurrentResolution);
		typedef LONG (NTAPI *NtQueryTimerResolutionType)(OUT PULONG MinimumResolution, OUT PULONG MaximumResolution, OUT PULONG CurrentResolution);

		NtSetTimerResolutionType NtSetTimerResolutionPtr = reinterpret_cast<NtSetTimerResolutionType>(GetProcAddress(ntdll, "NtSetTimerResolution") );
		NtQueryTimerResolutionType NtQueryTimerResolutionPtr = reinterpret_cast<NtQueryTimerResolutionType>(GetProcAddress(ntdll, "NtQueryTimerResolution") );
		if (NtSetTimerResolutionPtr != NULL && NtQueryTimerResolutionPtr != NULL)
		{
			unsigned long minimumResolution = 0;
			unsigned long maximumResolution = 0;
			unsigned long currentResolution = 0;
			NtQueryTimerResolutionPtr(&minimumResolution, &maximumResolution, &currentResolution);

			if (maximumResolution < currentResolution)
			{
				NtSetTimerResolutionPtr(maximumResolution, TRUE, &currentResolution);
			}
		}
#endif // INCREASE_TIMER_FREQUENCY
	}

	IncomingSubpacketsQueue.reserve(SUBPACKET_VECTOR_RESERVE_SIZE);
	OutgoingSubpacketsQueue.reserve(SUBPACKET_VECTOR_RESERVE_SIZE);
	H2DUnackedPackets.reserve(PACKET_VECTOR_RESERVE_SIZE);
	D2HUnorderedPackets.reserve(PACKET_VECTOR_RESERVE_SIZE);

	LARGE_INTEGER freq = {0};
	QueryPerformanceFrequency(&freq);
	ldFreq = 1.0 / freq.QuadPart;

	sendSocket = WSASocketW(AF_INET, SOCK_DGRAM, IPPROTO_UDP, NULL, 0, WSA_FLAG_REGISTERED_IO);
	if (sendSocket == INVALID_SOCKET)
	{
		printf("Error creating send socket with WSASocketW() returning %i\n", WSAGetLastError() );
		__debugbreak();
	}
	sendBroadcastSocket = WSASocketW(AF_INET, SOCK_DGRAM, IPPROTO_UDP, NULL, 0, WSA_FLAG_REGISTERED_IO);
	if (sendBroadcastSocket == INVALID_SOCKET)
	{
		printf("Error creating send broadcast socket with WSASocketW() returning %i\n", WSAGetLastError() );
		__debugbreak();
	}
	recvSocket = WSASocketW(AF_INET, SOCK_DGRAM, IPPROTO_UDP, NULL, 0, WSA_FLAG_REGISTERED_IO);
	if (recvSocket == INVALID_SOCKET)
	{
		printf("Error creating recv socket with WSASocketW() returning %i\n", WSAGetLastError() );
		__debugbreak();
	}

	if (RIOFunctionsTable.RIOCreateRequestQueue == NULL)
	{
		DWORD numBytesReturned = 0;
		RIOFunctionsTable.cbSize = sizeof(RIOFunctionsTable);
		if (WSAIoctl(sendSocket, SIO_GET_MULTIPLE_EXTENSION_FUNCTION_POINTER, (LPVOID)&functionTableId, sizeof(functionTableId), &RIOFunctionsTable, sizeof(RIOFunctionsTable), &numBytesReturned, NULL, NULL) != 0 ||
			numBytesReturned == 0 ||
			RIOFunctionsTable.RIOCreateRequestQueue == NULL)
		{
			__debugbreak();
		}
	}

	// Set this to true to allow broadcasting from this socket (sends to IPv4 address 255.255.255.255)
	const BOOL broadcast = TRUE;
	if (setsockopt(sendBroadcastSocket, SOL_SOCKET, SO_BROADCAST, (const char* const)&broadcast, sizeof(broadcast) ) != 0)
	{
		__debugbreak();
	}

	// Set this to tell the router not to fragment our sent UDP packets
	// Commented out for now because this option seems to cause problems with our IP offload. Wireshark sees the outgoing packets just
	// fine, but they never make it to the router for some reason with this option on!
	/*BOOL dontFragment = 1;
	if (setsockopt(sendSocket, IPPROTO_IP, IP_DONTFRAGMENT, (const char* const)&dontFragment, sizeof(dontFragment) ) != 0)
	{
		__debugbreak();
	}*/

	unsigned maxMsgSize = 0;
	int maxMsgSizeLen = sizeof(maxMsgSize);
	if (getsockopt(sendSocket, SOL_SOCKET, SO_MAX_MSG_SIZE, (char* const)&maxMsgSize, &maxMsgSizeLen) != 0)
	{
		__debugbreak();
	}
	if (maxMsgSize < FULL_PACKET_TOTAL_SIZE_BYTES) // This would mean that we couldn't send max-length packets!
	{
		__debugbreak();
	}

	maxMsgSize = 0;
	maxMsgSizeLen = sizeof(maxMsgSize);
	if (getsockopt(sendBroadcastSocket, SOL_SOCKET, SO_MAX_MSG_SIZE, (char* const)&maxMsgSize, &maxMsgSizeLen) != 0)
	{
		__debugbreak();
	}
	if (maxMsgSize < FULL_PACKET_TOTAL_SIZE_BYTES) // This would mean that we couldn't broadcast max-length packets!
	{
		__debugbreak();
	}

	maxMsgSize = 0;
	maxMsgSizeLen = sizeof(maxMsgSize);
	if (getsockopt(recvSocket, SOL_SOCKET, SO_MAX_MSG_SIZE, (char* const)&maxMsgSize, &maxMsgSizeLen) != 0)
	{
		__debugbreak();
	}
	if (maxMsgSize < FULL_PACKET_TOTAL_SIZE_BYTES) // This would mean that we couldn't receive max-length packets!
	{
		__debugbreak();
	}

	// Make sure that our socket internal send and recv buffers are large enough to hold an entire window's worth of packets.
	// If they aren't large enough, then we're going to be dropping a lot of UDP packets! D:
	const int requestedBufSize = RoundUpToNextMultiple_2MB(FULL_PACKET_TOTAL_SIZE_BYTES * MAX_UNACKED_PACKETS_RESEND_WINDOW);
	int sendBufSize = 0;
	int sendBufSizeLen = sizeof(sendBufSize);
	if (getsockopt(sendSocket, SOL_SOCKET, SO_SNDBUF, (char* const)&sendBufSize, &sendBufSizeLen) != 0)
	{
		__debugbreak();
	}
	if (sendBufSize < requestedBufSize)
	{
		if (setsockopt(sendSocket, SOL_SOCKET, SO_SNDBUF, (const char* const)&requestedBufSize, sizeof(requestedBufSize) ) != 0)
		{
			__debugbreak();
		}
	}

	sendBufSize = 0;
	sendBufSizeLen = sizeof(sendBufSize);
	if (getsockopt(sendBroadcastSocket, SOL_SOCKET, SO_SNDBUF, (char* const)&sendBufSize, &sendBufSizeLen) != 0)
	{
		__debugbreak();
	}
	if (sendBufSize < requestedBufSize)
	{
		if (setsockopt(sendBroadcastSocket, SOL_SOCKET, SO_SNDBUF, (const char* const)&requestedBufSize, sizeof(requestedBufSize) ) != 0)
		{
			__debugbreak();
		}
	}

	int recvBufSize = 0;
	int recvBufSizeLen = sizeof(recvBufSize);
	if (getsockopt(recvSocket, SOL_SOCKET, SO_RCVBUF, (char* const)&recvBufSize, &recvBufSizeLen) != 0)
	{
		__debugbreak();
	}
	if (recvBufSize < requestedBufSize)
	{
		if (setsockopt(recvSocket, SOL_SOCKET, SO_RCVBUF, (const char* const)&requestedBufSize, sizeof(requestedBufSize) ) != 0)
		{
			__debugbreak();
		}
	}

	SOCKADDR_IN bindAddr = {0};
	bindAddr.sin_family = AF_INET;
	bindAddr.sin_addr.S_un.S_addr = INADDR_ANY;
	bindAddr.sin_port = NETORDER_UDP_PORT_D2H; // Recv socket needs to be listening on our protocol's Device-to-Host port for packets
	if (bind(recvSocket, (const sockaddr* const)&bindAddr, sizeof(bindAddr) ) != 0)
	{
		printf("Error: bind() failed to bind the receive socket to address %u.%u.%u.%u:%u. WSAGLE: %i\n",
			bindAddr.sin_addr.S_un.S_un_b.s_b1, bindAddr.sin_addr.S_un.S_un_b.s_b2, bindAddr.sin_addr.S_un.S_un_b.s_b3, bindAddr.sin_addr.S_un.S_un_b.s_b4,
			ntohs(bindAddr.sin_port), WSAGetLastError() );
		__debugbreak();
	}
	bindAddr.sin_family = AF_INET;
	bindAddr.sin_addr.S_un.S_addr = INADDR_ANY;
	bindAddr.sin_port = 0; // Send socket doesn't really care what port it's bound to. We can send to any destination port regardless.
	if (bind(sendSocket, (const sockaddr* const)&bindAddr, sizeof(bindAddr) ) != 0)
	{
		printf("Error: bind() failed to bind the send socket to address %u.%u.%u.%u:%u. WSAGLE: %i\n",
			bindAddr.sin_addr.S_un.S_un_b.s_b1, bindAddr.sin_addr.S_un.S_un_b.s_b2, bindAddr.sin_addr.S_un.S_un_b.s_b3, bindAddr.sin_addr.S_un.S_un_b.s_b4,
			ntohs(bindAddr.sin_port), WSAGetLastError() );
		__debugbreak();
	}
	bindAddr.sin_family = AF_INET;
	bindAddr.sin_addr.S_un.S_addr = INADDR_ANY;
	bindAddr.sin_port = 0; // Broadcast send socket doesn't really care what port it's bound to. We can send to any destination port regardless.
	if (bind(sendBroadcastSocket, (const sockaddr* const)&bindAddr, sizeof(bindAddr) ) != 0)
	{
		printf("Error: bind() failed to bind the broadcast socket to address %u.%u.%u.%u:%u. WSAGLE: %i\n",
			bindAddr.sin_addr.S_un.S_un_b.s_b1, bindAddr.sin_addr.S_un.S_un_b.s_b2, bindAddr.sin_addr.S_un.S_un_b.s_b3, bindAddr.sin_addr.S_un.S_un_b.s_b4,
			ntohs(bindAddr.sin_port), WSAGetLastError() );
		__debugbreak();
	}

	SOCKADDR_IN broadcastConnectAddr = {0};
	broadcastConnectAddr.sin_family = AF_INET;
	broadcastConnectAddr.sin_addr.S_un.S_addr = INADDR_BROADCAST;
	broadcastConnectAddr.sin_port = NETORDER_UDP_PORT_H2D;
	if (connect(sendBroadcastSocket, (const sockaddr* const)&broadcastConnectAddr, sizeof(broadcastConnectAddr) ) != 0)
	{
		printf("Error: connect() failed to connect the broadcast socket to address %u.%u.%u.%u:%u. WSAGLE: %i\n",
			broadcastConnectAddr.sin_addr.S_un.S_un_b.s_b1, broadcastConnectAddr.sin_addr.S_un.S_un_b.s_b2, broadcastConnectAddr.sin_addr.S_un.S_un_b.s_b3, broadcastConnectAddr.sin_addr.S_un.S_un_b.s_b4,
			NET_PROTO_UDP_PORT_H2D, WSAGetLastError() );
		__debugbreak();
	}

	// Allocate our buffers and register them with RIO:
	sendDataBuffer.InitBuffer(SEND_BUFFER_TOTAL_SIZE_BYTES);
	recvDataBuffer.InitBuffer(RECV_BUFFER_TOTAL_SIZE_BYTES);
	recvAddressBuffer.InitBuffer(ADDRESS_BUFFER_TOTAL_SIZE_BYTES);

	// Initialize all of our RIO_BUF slice descriptors:
	for (unsigned sliceIndex = 0; sliceIndex < COMPLETION_QUEUE_SIZE; ++sliceIndex)
	{
		RIO_BUF& sendSliceDesc = sendDataBuffer.GetSliceDescriptor(sliceIndex);
		sendSliceDesc.BufferId = sendDataBuffer.GetRIOBufferID();
		sendSliceDesc.Offset = RIOAllocBuffer::PACKET_SLICE_SIZE_BYTES * sliceIndex;
		sendSliceDesc.Length = 0; // To be filled in later by the send function
	}
	for (unsigned sliceIndex = 0; sliceIndex < COMPLETION_QUEUE_SIZE; ++sliceIndex)
	{
		RIO_BUF& recvSliceDesc = recvDataBuffer.GetSliceDescriptor(sliceIndex);
		recvSliceDesc.BufferId = recvDataBuffer.GetRIOBufferID();
		recvSliceDesc.Offset = RIOAllocBuffer::PACKET_SLICE_SIZE_BYTES * sliceIndex;
		recvSliceDesc.Length = RIOAllocBuffer::PACKET_SLICE_SIZE_BYTES;
	}
	for (unsigned sliceIndex = 0; sliceIndex < COMPLETION_QUEUE_SIZE; ++sliceIndex)
	{
		RIO_BUF& addrSliceDesc = recvAddressBuffer.GetSliceDescriptor(sliceIndex);
		addrSliceDesc.BufferId = recvAddressBuffer.GetRIOBufferID();
		addrSliceDesc.Offset = RIOAllocBuffer::ADDRESS_SLICE_SIZE_BYTES * sliceIndex;
		addrSliceDesc.Length = sizeof(SOCKADDR_INET);

		SOCKADDR_INET* const recvFromAddr = recvAddressBuffer.GetAddressSliceDataWrite(sliceIndex);
		memset(recvFromAddr, 0, sizeof(SOCKADDR_INET) );
		recvFromAddr->si_family = AF_INET;
		recvFromAddr->Ipv4.sin_family = AF_INET;
	}

	sendCQueue = RIOFunctionsTable.RIOCreateCompletionQueue(COMPLETION_QUEUE_SIZE * 2, NULL); // x2 here because it needs to be able to handle send completions for both the send and the send-broadcast sockets
	if (sendCQueue == RIO_INVALID_CQ)
	{
		__debugbreak();
	}

	recvEvent = WSACreateEvent();
	if (recvEvent == WSA_INVALID_EVENT)
	{
		__debugbreak();
	}

	RIO_NOTIFICATION_COMPLETION recvNotifyConfig = {};
	recvNotifyConfig.Type = RIO_EVENT_COMPLETION; // We want to use event notification here
	recvNotifyConfig.Event.EventHandle = recvEvent;
	recvNotifyConfig.Event.NotifyReset = TRUE;
	recvCQueue = RIOFunctionsTable.RIOCreateCompletionQueue(COMPLETION_QUEUE_SIZE, &recvNotifyConfig);
	if (recvCQueue == RIO_INVALID_CQ)
	{
		__debugbreak();
	}

	sendRQueue = RIOFunctionsTable.RIOCreateRequestQueue(sendSocket, 0, 1, COMPLETION_QUEUE_SIZE, 1, sendCQueue, sendCQueue, (void* const)1);
	if (sendRQueue == RIO_INVALID_RQ)
	{
		__debugbreak();
	}

	sendBroadcastRQueue = RIOFunctionsTable.RIOCreateRequestQueue(sendBroadcastSocket, 0, 1, COMPLETION_QUEUE_SIZE, 1, sendCQueue, sendCQueue, (void* const)1);
	if (sendBroadcastRQueue == RIO_INVALID_RQ)
	{
		__debugbreak();
	}

	recvRQueue = RIOFunctionsTable.RIOCreateRequestQueue(recvSocket, COMPLETION_QUEUE_SIZE, 1, 0, 1, recvCQueue, recvCQueue, (void* const)2);
	if (recvRQueue == RIO_INVALID_RQ)
	{
		__debugbreak();
	}

#ifndef NO_SLEEPS_RECV
	const int notifyResult = RIOFunctionsTable.RIONotify(recvCQueue);
	if (notifyResult != ERROR_SUCCESS)
	{
		__debugbreak();
	}
#endif // !NO_SLEEPS_RECV

	// Queue up our initial recvfrom's so that we don't drop any packets:
	for (unsigned recvPacketSliceIndex = 0; recvPacketSliceIndex < COMPLETION_QUEUE_SIZE; ++recvPacketSliceIndex)
	{
		const unsigned recvSliceIndex = recvDataBuffer.ConsumeNextAvailableSlice();
		const unsigned addrSliceIndex = recvAddressBuffer.ConsumeNextAvailableSlice();
#ifdef _DEBUG
		if (recvSliceIndex != addrSliceIndex)
		{
			__debugbreak();
		}
#endif
		if (!RIOFunctionsTable.RIOReceiveEx(recvRQueue, &recvDataBuffer.GetSliceDescriptor(recvSliceIndex), 1, NULL, &recvAddressBuffer.GetSliceDescriptor(addrSliceIndex), NULL, NULL, RIO_MSG_DEFER, reinterpret_cast<void* const>(RECVFROM_REQUEST_FLAG | (size_t)recvSliceIndex) ) )
		{
			__debugbreak();
		}
	}
	if (!RIOFunctionsTable.RIOReceiveEx(recvRQueue, NULL, 0, NULL, NULL, NULL, NULL, RIO_MSG_COMMIT_ONLY, NULL) ) // Commit all of our queue'd up receives at once
	{
		__debugbreak();
	}

	H2DUnackedPackets.reserve(MAX_UNACKED_SENT_PACKETS_WINDOW_SIZE * 2);

	SendSocketThread = CreateThread(NULL, 0, &NetSessionSendThreadEntry, this, 0, &SendSocketTID);
	if (!SendSocketThread || !SendSocketTID)
	{
		__debugbreak();
	}
	RecvSocketThread = CreateThread(NULL, 0, &NetSessionRecvThreadEntry, this, 0, &RecvSocketTID);
	if (!RecvSocketThread || !RecvSocketTID)
	{
		__debugbreak();
	}
}

NetSession::~NetSession()
{
	// Set our shutdown signal:
	ShutdownSystem = TRUE;
	printf("Shutting down net system!\n");
	WaitForSingleObject(SendSocketThread, SHUTDOWN_TIMEOUT_MS);
	WaitForSingleObject(RecvSocketThread, SHUTDOWN_TIMEOUT_MS);
	DWORD threadExitCode = 0;
	if (GetExitCodeThread(SendSocketThread, &threadExitCode) && threadExitCode == STILL_ACTIVE)
	{
		TerminateThread(SendSocketThread, 1);
	}
	threadExitCode = 0;
	if (GetExitCodeThread(RecvSocketThread, &threadExitCode) && threadExitCode == STILL_ACTIVE)
	{
		TerminateThread(RecvSocketThread, 1);
	}
	CloseHandle(SendSocketThread);
	CloseHandle(RecvSocketThread);

	SendShutdownPacket();

	WSACloseEvent(recvEvent);

	{
		const AutoCS H2D(H2DLock);
		const unsigned numUnackedH2DPackets = (const unsigned)H2DUnackedPackets.size();
		for (unsigned x = 0; x < numUnackedH2DPackets; ++x)
			free(H2DUnackedPackets[x]);
		H2DUnackedPackets.clear();
	}

	{
		const AutoCS D2H(D2HLock);
		const unsigned numUnackedD2HPackets = (const unsigned)D2HUnorderedPackets.size();
		for (unsigned x = 0; x < numUnackedD2HPackets; ++x)
			free(D2HUnorderedPackets[x]);
		D2HUnorderedPackets.clear();
	}

	RIOFunctionsTable.RIOCloseCompletionQueue(recvCQueue);
	RIOFunctionsTable.RIOCloseCompletionQueue(sendCQueue);

	closesocket(recvSocket);
	closesocket(sendBroadcastSocket);
	closesocket(sendSocket);
	printf("Net system shutdown complete\n");
}

// NetSession-owned threads may *not* call these functions!
void NetSession::DisallowNetworkingThreadCalls() const
{
#ifdef _DEBUG
	const ThreadID currentTID = GetCurrentThreadId();
	if (currentTID == SendSocketTID)
	{
		__debugbreak(); // Don't call this function from this thread!
	}
	if (currentTID == RecvSocketTID)
	{
		__debugbreak(); // Don't call this function from this thread!
	}
#endif
}

// Threads that are not the recv thread may *not* call these functions!
void NetSession::DisallowNonRecvThreadCalls() const
{
#ifdef _DEBUG
	const ThreadID currentTID = GetCurrentThreadId();
	if (currentTID != RecvSocketTID)
	{
		__debugbreak(); // Don't call this function from this thread!
	}
#endif
}

// Threads that are not the send thread may *not* call these functions!
void NetSession::DisallowNonSendThreadCalls() const
{
#ifdef _DEBUG
	const ThreadID currentTID = GetCurrentThreadId();
	if (currentTID != SendSocketTID)
	{
		__debugbreak(); // Don't call this function from this thread!
	}
#endif
}

// Sends a DMA write of a (usually large) block of bytes from the PC Host to the FPGA Device.
void NetSession::SendDMAWrite(const unsigned numWriteBytes, const DWORD* const writeHostData, gpuvoid* const writeDeviceAddr)
{
	// TODO: Implement DMA
	DisallowNetworkingThreadCalls();

	// Flush the currently-pending batch of subpackets. This ensures that all of those packets are received by the command processor *before* we
	// initiate our DMA write.
	FlushSendBatch();
}

// Requests a DMA read of a (usually large) block of bytes from the FPGA Device to the PC Host.
// This function does not return until the full DMA read has completed!
void NetSession::SendDMAReadSync(const unsigned numReadBytes, DWORD* const readHostBuffer, const gpuvoid* const readDeviceAddr)
{
	// TODO: Implement DMA
	DisallowNetworkingThreadCalls();

	// Flush the currently-pending batch of subpackets. This ensures that all of those packets are received by the command processor *before* we
	// initiate our DMA read.
	FlushSendBatch();
}

// Requests a DMA read of a (usually large) block of bytes from the FPGA Device to the PC Host.
// This function returns immediately and memory will be DMA-streamed back from the Device to the Host asynchronously.
void NetSession::SendDMAReadAsync(const unsigned numReadBytes, DWORD* const readHostBuffer, const gpuvoid* const readDeviceAddr)
{
	// TODO: Implement DMA
	DisallowNetworkingThreadCalls();

	// Flush the currently-pending batch of subpackets. This ensures that all of those packets are received by the command processor *before* we
	// initiate our DMA read.
	FlushSendBatch();
}

// Gets incoming packets (packets sent from Device to Host).
// Returns the number of subpackets received (or 0 if there are no new packets available)
const unsigned NetSession::GetReadPacketsD2H(std::vector<Subpacket>& outPacketsD2H)
{
	DisallowNetworkingThreadCalls();

	const AutoCS autoLock(IncomingSubpacketsLock);
	if (IncomingSubpacketsQueue.empty() )
	{
		ReadSubpacketsAreReady = false;
		return 0;
	}

	// This is the most efficient case. If possible, pass in empty packet vectors to this function!
	if (outPacketsD2H.empty() )
	{
		outPacketsD2H.swap(IncomingSubpacketsQueue);
		ReadSubpacketsAreReady = false;
		return (const unsigned)outPacketsD2H.size();
	}
	else
	{
		const unsigned numPackets = (const unsigned)IncomingSubpacketsQueue.size();
		outPacketsD2H.insert(outPacketsD2H.end(), IncomingSubpacketsQueue.begin(), IncomingSubpacketsQueue.end() );
		IncomingSubpacketsQueue.clear();
		ReadSubpacketsAreReady = false;
		return numPackets;
	}
}

// Queues another subpacket up for being sent in the next batch
void NetSession::SendBatchSubpacket(const Subpacket& sendSubpacket)
{
	DisallowNetworkingThreadCalls();

	const AutoCS autoLock(OutgoingSubpacketsLock);
	OutgoingSubpacketsQueue.push_back(sendSubpacket);
}

// Queues more subpackets up for being sent in the next batch. Optionally may force a batch-split if the subpackets need
// to be kept together in the same packet.
void NetSession::SendBatchSubpackets(const unsigned numSubpackets, const Subpacket* const psendSubpackets, const bool forceKeepPacketsTogether /*= false*/)
{
	DisallowNetworkingThreadCalls();

#ifdef _DEBUG
	if (forceKeepPacketsTogether && numSubpackets >= DeviceSessionPacket::MAX_SUBPACKET_COUNT)
	{
		__debugbreak(); // It's not possible to keep more than the max subpacket count number of packets together. They must
		// end up getting split into multiple different packets.
	}
#endif

	const AutoCS autoLock(OutgoingSubpacketsLock);
	if (forceKeepPacketsTogether)
	{
		if (OutgoingSubpacketsQueue.size() + numSubpackets >= DeviceSessionPacket::MAX_SUBPACKET_COUNT)
		{
			FlushSendBatch();
		}
	}
	OutgoingSubpacketsQueue.reserve(OutgoingSubpacketsQueue.size() + numSubpackets);
	for (unsigned x = 0; x < numSubpackets; ++x)
	{
		const Subpacket& thisSubpacket = psendSubpackets[x];
		OutgoingSubpacketsQueue.push_back(thisSubpacket);
	}
}

// Forces the current batch to send now (if it has anything in it) even if it's not full (improves latency, may end up wasting bandwidth if this is done too often).
// Recommended to call this once per set of draw calls and also call it at the end of the frame after submitting the rest of the commands.
static const bool TrueTrigger = true;
void NetSession::FlushSendBatch()
{
	DisallowNetworkingThreadCalls();
#ifdef _DEBUG
	if (sessionState.isConnected == false)
	{
		__debugbreak();
	}
	if (WakeSendThreadAtomic[FlushTrigger] != 0x00)
	{
		__debugbreak();
	}
#endif

	WakeSendThread(FlushTrigger);

	// Wait for the send thread to clear the trigger flag (should happen on the next send frame in which the send packet window is not full)
	while (WakeSendThreadAtomic[FlushTrigger] == true)
	{
		WaitOnAddress(&WakeSendThreadAtomic[FlushTrigger], (void* const)&(WakeSendThreadAtomic[FlushTrigger]), sizeof(WakeSendThreadAtomic[FlushTrigger]), INFINITE);
	}
}

// Waits until all queued sends have been delivered to the device and acked back that they have been received:
void NetSession::WaitForAllSendsCompletedAndAcked()
{
	DisallowNetworkingThreadCalls();
#ifdef _DEBUG
	if (sessionState.isConnected == false)
	{
		__debugbreak();
	}
#endif

	const bool nonEmptyFlag = true;

	// First wait for the local send buffer to be emptied. This means that all of the subpackets have been batched into packets and
	// have been added to the H2DUnackedPackets buffer:
	{
		bool capturedEmptyFlag = LocalSendBufferIsEmpty;
		while (capturedEmptyFlag != nonEmptyFlag)
		{
			const unsigned sleepMS = 1u;
			WaitOnAddress(&LocalSendBufferIsEmpty, (PVOID)&nonEmptyFlag, sizeof(bool), sleepMS);
			capturedEmptyFlag = LocalSendBufferIsEmpty;
		}
	}

	// Finally, wait for the H2DUnackedPackets buffer to be empty. This means that all of our packets have been sent, received, and acked:
	{
		bool capturedEmptyFlag = H2DUnackedPacketsIsEmpty;
		while (capturedEmptyFlag != nonEmptyFlag)
		{
			const unsigned sleepMS = 1u;
			WaitOnAddress(&H2DUnackedPacketsIsEmpty, (PVOID)&nonEmptyFlag, sizeof(bool), sleepMS);
			capturedEmptyFlag = H2DUnackedPacketsIsEmpty;
		}
	}
}

// Sleeps the calling thread until there's new read packets available to be consumed.
void NetSession::WaitForReadPacketsAvailable()
{
	DisallowNetworkingThreadCalls();

#ifdef _DEBUG
	if (sessionState.isConnected == false)
	{
		__debugbreak();
	}
#endif
	const bool nonEmptyFlag = true;
	bool capturedEmptyFlag = ReadSubpacketsAreReady;
	while (capturedEmptyFlag != nonEmptyFlag)
	{
		const unsigned sleepMS = 1u;
		WaitOnAddress(&ReadSubpacketsAreReady, (PVOID)&nonEmptyFlag, sizeof(bool), sleepMS);
		capturedEmptyFlag = ReadSubpacketsAreReady;
	}
}

/*static*/ DWORD WINAPI NetSession::NetSessionSendThreadEntry(LPVOID thisPtr)
{
	UtilSetThreadName("NetSession SendThread");

	NetSession* const thisNetSession = (NetSession* const)thisPtr;
	thisNetSession->NetSessionSendThreadMain();
	return 0;
}

/*static*/ DWORD WINAPI NetSession::NetSessionRecvThreadEntry(LPVOID thisPtr)
{
	UtilSetThreadName("NetSession RecvThread");

	NetSession* const thisNetSession = (NetSession* const)thisPtr;
	thisNetSession->NetSessionRecvThreadMain();
	return 0;
}

void NetSession::SendShutdownPacket(const SessionDisconnectReason disconnectReason /*= errShutdown*/)
{
	// Note that since this packet may be sent in an emergency, it is permitted for threads other than the send thread to call this function

	SessionDisconnectPacket targetedSessionDisconnect;
	targetedSessionDisconnect.packetType = command::PT_DISCONNECT;
	targetedSessionDisconnect.senderIPv4Address[0] = 158; // TODO: Don't hardcode our host IPv4 address
	targetedSessionDisconnect.senderIPv4Address[1] = 1;
	targetedSessionDisconnect.senderIPv4Address[2] = 168;
	targetedSessionDisconnect.senderIPv4Address[3] = 192;
	targetedSessionDisconnect.unusedPadding[0] = 0;
	targetedSessionDisconnect.unusedPadding[1] = 0;
	targetedSessionDisconnect.disconnectReason = disconnectReason;

	if (sessionState.isConnected)
	{
		for (unsigned x = 0; x < DISCONNECT_RESEND_DUPLICATES; ++x)
		{
			Sleep(1);
			netStats.IncNetSend( (const unsigned)sizeof(targetedSessionDisconnect) );
			WrappedSend( (const char* const)&targetedSessionDisconnect, sizeof(targetedSessionDisconnect), sessionState.sendAddr);
		}
		sessionState.ClearSessionState();

		Sleep(16);
	}

	// The reason to send to broadcast in addition to the directed session device address is that if we lose ARP for some reason
	// then the broadcast packet will still get to the device even if we don't know their IP address anymore.
	SOCKADDR_IN broadcastAddress = {0};
	broadcastAddress.sin_family = AF_INET;
	broadcastAddress.sin_port = NETORDER_UDP_PORT_H2D;
	broadcastAddress.sin_addr.S_un.S_addr = INADDR_BROADCAST;
	for (unsigned x = 0; x < DISCONNECT_RESEND_DUPLICATES; ++x)
	{
		Sleep(1);
		netStats.IncNetSend( (const unsigned)sizeof(targetedSessionDisconnect) );
		const bool isBroadcastSend = true;
		WrappedSend( (const char* const)&targetedSessionDisconnect, sizeof(targetedSessionDisconnect), broadcastAddress, isBroadcastSend);
	}
}

void NetSession::SendLoop(const void* const packetBytes, const unsigned packetLenBytes)
{
	DisallowNonSendThreadCalls();

	netStats.IncNetSend(packetLenBytes);
	WrappedSend( (const char* const)packetBytes, packetLenBytes, sessionState.sendAddr);
	QueryPerformanceCounter(&sessionState.H2D_LastPacketSendTime);
}

void NetSession::HandleSessionUnconnectedSendLoop()
{
	PIXScoped scope(11, "HandleSessionUnconnectedSendLoop");

	DisallowNonSendThreadCalls();

	if (sessionState.isReadyToSendConnectRequest)
	{
		// Set sessionState.hasSentConnectRequest=true when it does send that out
		LARGE_INTEGER currentTime = {0};
		QueryPerformanceCounter(&currentTime);

		currentTime.QuadPart -= sessionState.H2D_LastPacketSendTime.QuadPart;
		const float millisecondsSinceLastSend = (const float)(ldFreq * currentTime.QuadPart) * 1000.0f;
		if (millisecondsSinceLastSend > TIME_BETWEEN_SESSION_CONNECT_REQUESTS_MS)
		{
			SOCKADDR_IN deviceAddr = {0};
			deviceAddr.sin_family = AF_INET;
			deviceAddr.sin_port = NETORDER_UDP_PORT_H2D;
			deviceAddr.sin_addr.S_un.S_un_b.s_b1 = sessionState.deviceIPv4Address[0];
			deviceAddr.sin_addr.S_un.S_un_b.s_b2 = sessionState.deviceIPv4Address[1];
			deviceAddr.sin_addr.S_un.S_un_b.s_b3 = sessionState.deviceIPv4Address[2];
			deviceAddr.sin_addr.S_un.S_un_b.s_b4 = sessionState.deviceIPv4Address[3];

			sessionState.sendAddr = deviceAddr;

			if (connect(sendSocket, (const sockaddr* const)&deviceAddr, sizeof(deviceAddr) ) != 0)
			{
				printf("Error: connect() failed to connect the send socket to address %u.%u.%u.%u:%u. WSAGLE: %i\n", sessionState.deviceIPv4Address[0],
					sessionState.deviceIPv4Address[1], sessionState.deviceIPv4Address[2], sessionState.deviceIPv4Address[3], NET_PROTO_UDP_PORT_H2D, WSAGetLastError() );
				__debugbreak();
			}

			SOCKADDR_IN hostAddr = {0};
			int hostAddrLen = sizeof(hostAddr);
			// Note: Can only call getsockname() *after* a successful connect() to implicitly bind the socket to an interface.
			if (getsockname(sendSocket, (sockaddr* const)&hostAddr, &hostAddrLen) != 0)
			{
				printf("Error: getsockname() failed to get the name of the send socket. WSAGLE: %i\n", WSAGetLastError() );
				__debugbreak();
			}

			if (hostAddr.sin_addr.S_un.S_addr == 0x00000000 || hostAddr.sin_addr.S_un.S_addr == INADDR_LOOPBACK || hostAddr.sin_addr.S_un.S_addr == INADDR_NONE)
			{
				printf("Error: getsockname() couldn't resolve our send socket address\n");
				__debugbreak();
			}

			HostRequestConnectSessionPacket requestSessionConnect;
			requestSessionConnect.magicProtoValue = PROTO_MAGIC_BYTE;
			requestSessionConnect.packetType = command::PT_CONNREQUEST;
			requestSessionConnect.netProtoVersionMajorHost = NET_PROTO_MAJOR_VERSION;
			requestSessionConnect.netProtoVersionMinorHost = NET_PROTO_MINOR_VERSION;
			requestSessionConnect.unusedPadding = 0x00;
			requestSessionConnect.hostIPv4Address[0] = hostAddr.sin_addr.S_un.S_un_b.s_b4;
			requestSessionConnect.hostIPv4Address[1] = hostAddr.sin_addr.S_un.S_un_b.s_b3;
			requestSessionConnect.hostIPv4Address[2] = hostAddr.sin_addr.S_un.S_un_b.s_b2;
			requestSessionConnect.hostIPv4Address[3] = hostAddr.sin_addr.S_un.S_un_b.s_b1;

			SendLoop(&requestSessionConnect, sizeof(requestSessionConnect) );
			sessionState.hasSentConnectRequest = true;
		}
	}
}

const unsigned NetSession::CalculateSendPacketBatchWindowSize() const
{
	/*const unsigned ret = static_cast<const unsigned>(PacketAcksWindowSizeRollingAverage + 1.5f);
	if (ret == 0)
		return 1;
	else if (ret > MAX_UNACKED_PACKETS_RESEND_WINDOW)
		return MAX_UNACKED_PACKETS_RESEND_WINDOW;*/

	// Believe it or not, but a hardcoded window size of 20 seems to work amazingly here compared to actually using a scaling window size.
	// TODO: See if a scaling window could end up being better in the future.
#ifdef _DEBUG
	return 1;
#else
	return 20;
#endif
	//return ret;
}

void NetSession::HandleSessionConnectedSendLoop(std::deque<Subpacket>& localSubpacketsQueue)
{
	PIXScoped scope(12, "HandleSessionConnectedSendLoop");

	DisallowNonSendThreadCalls();

	const unsigned windowSizeTargetThisFrame = CalculateSendPacketBatchWindowSize();

	bool windowIsFull = false;
	bool windowIsEmpty;
	{
		{
			const AutoCS lockUnackedPackets(H2DLock);
			if (H2DUnackedPackets.size() >= windowSizeTargetThisFrame)
			{
				windowIsFull = true;
			}
			windowIsEmpty = H2DUnackedPackets.empty();
		}

		if (!windowIsFull)
		{
			PIXScoped scope(13, "Outgoing Subpackets Add");
			const AutoCS autoLock(OutgoingSubpacketsLock);
			if (!OutgoingSubpacketsQueue.empty() )
			{
				localSubpacketsQueue.insert(localSubpacketsQueue.end(), OutgoingSubpacketsQueue.begin(), OutgoingSubpacketsQueue.end() );
				OutgoingSubpacketsQueue.clear();
			}

			// Don't clear the Flush trigger if our window is already full.
			// Let the flushing thread sleep and wait until we have received enough acks to clear out the window.
			if (WakeSendThreadAtomic[FlushTrigger] == true)
			{
				InterlockedAnd8( (char* const)&(WakeSendThreadAtomic[FlushTrigger]), false);
				WakeByAddressSingle( (void* const)&(WakeSendThreadAtomic[FlushTrigger]) );
			}
		}
	}

	{
		PIXScoped scope(14, "Queue Outgoing Packets");
		while (!localSubpacketsQueue.empty() && !windowIsFull)
		{
			const unsigned char newPacketSubpacketCount = (localSubpacketsQueue.size() >= DeviceSessionPacket::MAX_SUBPACKET_COUNT) ? (DeviceSessionPacket::MAX_SUBPACKET_COUNT - 1) : (const unsigned char)localSubpacketsQueue.size();
			const unsigned short packetLenBytes = sizeof(DeviceSessionPacket) + sizeof(Subpacket) * newPacketSubpacketCount;

			PacketBuffer* const newBufferedPacket = (PacketBuffer* const)malloc( (sizeof(PacketBuffer) - 1) + packetLenBytes);
			QueryPerformanceCounter( (LARGE_INTEGER*)&newBufferedPacket->originalSendTime);
			newBufferedPacket->packetNumber = sessionState.H2D_CurrentPacketID++;
			newBufferedPacket->packetLenBytes = packetLenBytes;
			newBufferedPacket->hasPacketBeenSent = false;
			DeviceSessionPacket* const sessionHeader = (DeviceSessionPacket* const)(newBufferedPacket->packetBytes);
			sessionHeader->lastAckedPacketID = 0; // This will get overridden by the most recent value when we actually send the packet
			sessionHeader->magicProtoValue = PROTO_MAGIC_BYTE;
			sessionHeader->packetFlags = 0;
			sessionHeader->subpacketCount = newPacketSubpacketCount;
			sessionHeader->thisPacketID = newBufferedPacket->packetNumber;
			sessionHeader->packetChecksum = 0; // This will get recalculated when we send the packet out and have to update the last acked packet ID anyway, so don't bother computing it now
			sessionHeader->packetType = command::PT_SESSIONCOMBOPACKET;

			Subpacket* const subpacketsWriteMemory = reinterpret_cast<Subpacket* const>(sessionHeader + 1);
			for (unsigned x = 0; x < newPacketSubpacketCount; ++x)
			{
				memcpy(subpacketsWriteMemory + x, &localSubpacketsQueue[x], sizeof(Subpacket) );
			}
			localSubpacketsQueue.erase(localSubpacketsQueue.begin(), localSubpacketsQueue.begin() + newPacketSubpacketCount);

			if (windowIsEmpty)
			{
				// Reset our time-since-last-resend counter in order to force an immediate send:
				lastResendTimestamp = 0;
			}

			{
				const AutoCS lockUnackedPackets(H2DLock);
				H2DUnackedPackets.push_back(newBufferedPacket);
				H2DUnackedPacketsIsEmpty = false;
				WakeByAddressSingle(&H2DUnackedPacketsIsEmpty);
				windowIsEmpty = false;
				if (H2DUnackedPackets.size() >= windowSizeTargetThisFrame)
				{
					windowIsFull = true;
					break;
				}
			}
		}
	}

	if (localSubpacketsQueue.empty() )
	{
		LocalSendBufferIsEmpty = true;
		WakeByAddressSingle(&LocalSendBufferIsEmpty);
	}
	else
	{
		if (LocalSendBufferIsEmpty)
		{
			LocalSendBufferIsEmpty = false;
			WakeByAddressSingle(&LocalSendBufferIsEmpty);
		}
	}

	if (sessionState.NeedSendDataPacketAck)
	{
		PIXScoped scope(15, "Send Ack-Only Packet");
		sessionState.NeedSendDataPacketAck = false;
		// TODO: Do we really need to keep resending the same "empty ack" packets over and over again?
		// Isn't this a big waste of bandwidth?
		// Maybe just send 3 empty ack's (spaced out to one per send-frame) per packetID and then stop?
		// This along with a small, infrequent (~1 per second) session keepalive might be good enough.

		// Send an "empty" ack-only packet if we need to
		DeviceSessionPacket emptyAckPacket;
		emptyAckPacket.magicProtoValue = PROTO_MAGIC_BYTE;
		emptyAckPacket.packetType = command::PT_SESSIONCOMBOPACKET;
		emptyAckPacket.packetFlags = 0;
		emptyAckPacket.subpacketCount = 0;
		emptyAckPacket.thisPacketID = sessionState.H2D_LastAckedPacketID + 1;//sessionState.H2D_CurrentPacketID; // Important! Do *not* increment the packet ID for empty packets! Only packets containing data payloads should have unique packet IDs!

		sessionState.sessionStats.IncSessionSend(emptyAckPacket.subpacketCount, false);

		// Write these last to minimize latency:
		emptyAckPacket.lastAckedPacketID = sessionState.D2H_LastRecvPacketID;
		emptyAckPacket.packetChecksum = emptyAckPacket.CalculateHeaderChecksum();
		SendLoop(&emptyAckPacket, sizeof(emptyAckPacket) );

		// Reset our time-since-last-resend counter:
		lastResendTimestamp = 0;

		/*if (emptyAckPacket.lastAckedPacketID != (lastSentAckID & 0xFFFF) )
		{
			lastSentAckID = emptyAckPacket.lastAckedPacketID;

			// Send our empty ack packet:
			SendLoop(&emptyAckPacket, sizeof(emptyAckPacket) );
		}
		else if ( (lastSentAckID >> 16) < SEND_ACK_RESEND_DUPLICATES)
		{
			const unsigned newAckResentCount = (lastSentAckID >> 16) + 1;
			lastSentAckID = (lastSentAckID & 0xFFFF) | (newAckResentCount << 16);

			// Send our empty ack packet:
			SendLoop(&emptyAckPacket, sizeof(emptyAckPacket), sendAddr);
		}
		else
		{
			// We have reached our ack-resend limit for this packet ID! Do not resend the ack any more until we get a new packet ID!
		}*/
	}
	{
		PIXScoped scope(16, "Test Resend Timer");
		// Throttle our resends to avoid flooding the network:
		unsigned __int64 currentTime = 0;
		QueryPerformanceCounter( (LARGE_INTEGER*)&currentTime);
		const unsigned __int64 timeSinceLastResend = currentTime - lastResendTimestamp;
		const float millisecondsSinceLastResend = (const float)( (timeSinceLastResend * ldFreq) * 1000.0);
		if (millisecondsSinceLastResend >= SEND_RESEND_DELAY_MILLISECONDS)
		{
			PIXScoped scope(17, "Do Resend");

			lastResendTimestamp = currentTime;
			const AutoCS lockUnackedPackets(H2DLock);

			bool doClearNeedSendFlag = false;
			if (sessionState.NeedSendDataPacketAck)
				doClearNeedSendFlag = true;

			const unsigned numPacketsToResend = (H2DUnackedPackets.size() > windowSizeTargetThisFrame) ? windowSizeTargetThisFrame : (const unsigned)H2DUnackedPackets.size();
			for (unsigned x = 0; x < numPacketsToResend; ++x)
			{
				PacketBuffer* const thisUnackedPacket = H2DUnackedPackets[x];
				DeviceSessionPacket* const sessionHeader = (DeviceSessionPacket* const)(thisUnackedPacket->packetBytes);
#ifdef _DEBUG
				if (sessionHeader->thisPacketID != thisUnackedPacket->packetNumber)
				{
					__debugbreak();
				}
#endif
				// Send our data payload packet:
				const bool isResendPacket = thisUnackedPacket->hasPacketBeenSent;
				sessionState.sessionStats.IncSessionSend(sessionHeader->subpacketCount, isResendPacket);

				// Write these last to minimize latency:
				sessionHeader->lastAckedPacketID = sessionState.D2H_LastRecvPacketID;
				sessionHeader->packetChecksum = sessionHeader->CalculateHeaderChecksum();

				SendLoop(thisUnackedPacket->packetBytes, thisUnackedPacket->packetLenBytes);
				thisUnackedPacket->hasPacketBeenSent = true;
			}

			if (doClearNeedSendFlag)
			{
				sessionState.NeedSendDataPacketAck = false;
			}
		}
	}
}

void NetSession::SendSleepWait()
{
	DisallowNonSendThreadCalls();
	
	// Check our wake signals just before we go to sleep:
}

static const char WakeAllUnset[NetSession::NUM_WAKE_SEND_THREAD_REASONS] = {0};

void NetSession::NetSessionSendThreadMain()
{
	DisallowNonSendThreadCalls();

	std::deque<Subpacket> localSubpacketsQueue;

	PIXScoped scopeThread(1, "SendThread");

	while (ShutdownSystem == FALSE)
	{
#ifndef NO_SLEEPS_SEND
		// Wait so as not to constantly burn CPU time sending tiny packets
		{
			PIXScoped scopeWait(10, "SendThread Wait");
			WaitOnAddress(WakeSendThreadAtomic, (void* const)WakeAllUnset, sizeof(WakeAllUnset), THREAD_SLEEP_MS);
		}
#endif // NO_SLEEPS_SEND

		if (ShutdownSystem)
			break;

		PIXScoped scopeFrame(1, "SendFrame");

		if (WakeSendThreadAtomic[NewValidRecvPacket])
		{
			InterlockedAnd8( (char* const)&(WakeSendThreadAtomic[NewValidRecvPacket]), false); // Clear our wake flag if we've just been woken up
		}

		if (sessionState.isConnected)
		{
			HandleSessionConnectedSendLoop(localSubpacketsQueue);
		}
		else
		{
			HandleSessionUnconnectedSendLoop();
		}
	}
}

void NetSession::HandleSessionUnconnectedPacket(const PacketHeaderMagic* const recvPacketData, const unsigned recvLenBytes, const SOCKADDR_IN& recvAddr)
{
	PIXScoped scope(6, "HandleSessionUnconnectedPacket");

	DisallowNonRecvThreadCalls();

	if (sessionState.hasSentConnectRequest)
	{
		if (recvLenBytes == sizeof(DeviceConnectSessionResponsePacket) )
		{
			if (recvPacketData->packetType == command::PT_CONNRESPONSE)
			{
				if (recvAddr.sin_addr.S_un.S_un_b.s_b1 == sessionState.deviceIPv4Address[0] &&
					recvAddr.sin_addr.S_un.S_un_b.s_b2 == sessionState.deviceIPv4Address[1] &&
					recvAddr.sin_addr.S_un.S_un_b.s_b3 == sessionState.deviceIPv4Address[2] &&
					recvAddr.sin_addr.S_un.S_un_b.s_b4 == sessionState.deviceIPv4Address[3])
				{
					// Packet is valid at this point:
					QueryPerformanceCounter(&sessionState.D2H_LastPacketRecvTime);

					const DeviceConnectSessionResponsePacket* const sessionResponseHeader = (const DeviceConnectSessionResponsePacket* const)recvPacketData;
					if (sessionResponseHeader->status == acceptNewSession)
					{
						// Success! Let's start up our new session :)
						sessionState.isConnected = true;
						printf("Connection request accepted! Session now connected!\n");
						return;
					}
					else
					{
						printf("Connection request rejected! Error code: %u!\n", sessionResponseHeader->status);
					}
				}
				else
				{
					printf("Error: An unexpected IPv4 address tried to accept our session connection request! Expected %u.%u.%u.%u, got %u.%u.%u.%u\n",
						sessionState.deviceIPv4Address[0], sessionState.deviceIPv4Address[1], sessionState.deviceIPv4Address[2], sessionState.deviceIPv4Address[3],
						recvAddr.sin_addr.S_un.S_un_b.s_b1, recvAddr.sin_addr.S_un.S_un_b.s_b2, recvAddr.sin_addr.S_un.S_un_b.s_b3, recvAddr.sin_addr.S_un.S_un_b.s_b4);
				}
			}
			else
			{
				printf("Unknown non-session packet type received: type %u, size %u\n", recvPacketData->packetType, recvLenBytes);
			}
		}
	}

	if (recvLenBytes != sizeof(DeviceBroadcastPacket) )
	{
		printf("Unexpected non-session packet size received: size %u\n", recvLenBytes);
		return; // Drop any packets that aren't big enough to be a broadcast advertisement packet
	}

	if (recvPacketData->packetType != command::PT_CONNBROADCAST)
	{
		printf("Unknown non-session packet type received: type %u, size %u\n", recvPacketData->packetType, recvLenBytes);
		return; // Drop any packets that don't match the broadcast advertisement packet type
	}

	const DeviceBroadcastPacket* const broadcastHeader = (const DeviceBroadcastPacket* const)recvPacketData;
	if (broadcastHeader->netProtoVersionMajorDevice != NET_PROTO_MAJOR_VERSION)
	{
		printf("Error: Broadcast header contains incompatible net proto major version. ProtoMajorVer: %u, expected: %u\n",
			broadcastHeader->netProtoVersionMajorDevice, NET_PROTO_MAJOR_VERSION);
		return; // Error: Incompatible net proto version!
	}

	if (*( (const unsigned* const)broadcastHeader->deviceIPv4Address) == INADDR_ANY ||
		*( (const unsigned* const)broadcastHeader->deviceIPv4Address) == INADDR_BROADCAST)
	{
		printf("Error: Broadcast header contains invalid IPv4 address: %u.%u.%u.%u\n", 
			broadcastHeader->deviceIPv4Address[0], broadcastHeader->deviceIPv4Address[1], broadcastHeader->deviceIPv4Address[2], broadcastHeader->deviceIPv4Address[3]);
		return; // Error: Invalid IPv4 address!
	}

	if (memcmp(ZERO_MAC_ADDR, broadcastHeader->deviceMACAddress, sizeof(ZERO_MAC_ADDR) ) == 0 ||
		memcmp(BROADCAST_MAC_ADDR, broadcastHeader->deviceMACAddress, sizeof(BROADCAST_MAC_ADDR) ) == 0)
	{
		printf("Error: Broadcast header contains invalid MAC address: %02X-%02X-%02X-%02X-%02X-%02X\n", 
			broadcastHeader->deviceMACAddress[0], broadcastHeader->deviceMACAddress[1], broadcastHeader->deviceMACAddress[2], 
			broadcastHeader->deviceMACAddress[3], broadcastHeader->deviceMACAddress[4], broadcastHeader->deviceMACAddress[5]);
		return; // Error: Invalid MAC address!
	}

	if (!(recvAddr.sin_addr.S_un.S_un_b.s_b1 == broadcastHeader->deviceIPv4Address[0] &&
		recvAddr.sin_addr.S_un.S_un_b.s_b2 == broadcastHeader->deviceIPv4Address[1] &&
		recvAddr.sin_addr.S_un.S_un_b.s_b3 == broadcastHeader->deviceIPv4Address[2] &&
		recvAddr.sin_addr.S_un.S_un_b.s_b4 == broadcastHeader->deviceIPv4Address[3]) )
	{
		printf("Error: Broadcast packet IPv4 address mismatches send IPv4 address: PacketIPv4: %u.%u.%u.%u, SenderIPv4: %u.%u.%u.%u\n", 
			broadcastHeader->deviceIPv4Address[0], broadcastHeader->deviceIPv4Address[1], broadcastHeader->deviceIPv4Address[2], broadcastHeader->deviceIPv4Address[3],
			recvAddr.sin_addr.S_un.S_un_b.s_b1, recvAddr.sin_addr.S_un.S_un_b.s_b2, recvAddr.sin_addr.S_un.S_un_b.s_b3, recvAddr.sin_addr.S_un.S_un_b.s_b4);
		return; // Error: This IPv4 address is not owned by the broadcasting device!
	}

	// Success! This is a valid broadcast packet. We should accept the offer and request to create a new session!
	QueryPerformanceCounter(&sessionState.D2H_LastPacketRecvTime);

	if (sessionState.deviceIPv4Address[0] == broadcastHeader->deviceIPv4Address[0] &&
	sessionState.deviceIPv4Address[1] == broadcastHeader->deviceIPv4Address[1] &&
	sessionState.deviceIPv4Address[2] == broadcastHeader->deviceIPv4Address[2] &&
	sessionState.deviceIPv4Address[3] == broadcastHeader->deviceIPv4Address[3])
		return; // Just ignore any duplicate broadcasts from the same address after the first one that we receive

	sessionState.deviceIPv4Address[0] = broadcastHeader->deviceIPv4Address[0];
	sessionState.deviceIPv4Address[1] = broadcastHeader->deviceIPv4Address[1];
	sessionState.deviceIPv4Address[2] = broadcastHeader->deviceIPv4Address[2];
	sessionState.deviceIPv4Address[3] = broadcastHeader->deviceIPv4Address[3];

	sessionState.deviceMACAddress[0] = broadcastHeader->deviceMACAddress[0];
	sessionState.deviceMACAddress[1] = broadcastHeader->deviceMACAddress[1];
	sessionState.deviceMACAddress[2] = broadcastHeader->deviceMACAddress[2];
	sessionState.deviceMACAddress[3] = broadcastHeader->deviceMACAddress[3];
	sessionState.deviceMACAddress[4] = broadcastHeader->deviceMACAddress[4];
	sessionState.deviceMACAddress[5] = broadcastHeader->deviceMACAddress[5];

	sessionState.netProtoVersionMajorDevice = broadcastHeader->netProtoVersionMajorDevice;
	sessionState.netProtoVersionMinorDevice = broadcastHeader->netProtoVersionMinorDevice;
	
	// Signal to the send thread that we would like to send a request packet to this device
	sessionState.isReadyToSendConnectRequest = true;

	sessionState.recvAddr = recvAddr;

	if (connect(recvSocket, (const sockaddr* const)&recvAddr, sizeof(recvAddr) ) != 0)
	{
		printf("Error: connect() failed to connect the receive socket to address %u.%u.%u.%u:%u. WSAGLE: %i\n",
			recvAddr.sin_addr.S_un.S_un_b.s_b1, recvAddr.sin_addr.S_un.S_un_b.s_b2, recvAddr.sin_addr.S_un.S_un_b.s_b3, recvAddr.sin_addr.S_un.S_un_b.s_b4,
			ntohs(recvAddr.sin_port), WSAGetLastError() );
		__debugbreak();
	}

	printf("Received valid broadcast packet for device IPv4 %u.%u.%u.%u and NetProto version %u.%u! Replying with session-request packet...\n",
		broadcastHeader->deviceIPv4Address[0], broadcastHeader->deviceIPv4Address[1], broadcastHeader->deviceIPv4Address[2], broadcastHeader->deviceIPv4Address[3],
		broadcastHeader->netProtoVersionMajorDevice, broadcastHeader->netProtoVersionMinorDevice);
}

// Ack and free any pending packets in the sent-and-unacked packets queue:
// Returns the number of packets acked.
const unsigned NetSession::DeviceAcksHostSentPackets(const unsigned short beginAckPacketID, const unsigned short endAckPacketID)
{
	DisallowNonRecvThreadCalls();
	
	// Careful, the range can and will wrap around at 0xFFFF:
	const unsigned short ackRange = endAckPacketID - beginAckPacketID;

	if (ackRange > MAX_UNACKED_SENT_PACKETS_WINDOW_SIZE)
	{
		__debugbreak();
	}

	LARGE_INTEGER packetsRecvTime;
	QueryPerformanceCounter(&packetsRecvTime);

	unsigned numPacketsAcked = 0;

	{
		const AutoCS autoLock(H2DLock);
		unsigned numUnackedSentPackets = (const unsigned)H2DUnackedPackets.size();
		for (unsigned x = 0; x < numUnackedSentPackets;)
		{
			PacketBuffer* const thisUnackedSentPacket = H2DUnackedPackets[x];
			const unsigned short rebasedID = thisUnackedSentPacket->packetNumber - beginAckPacketID;
			if (rebasedID <= ackRange)
			{
				// This is the number of QPF ticks between the packet being sent and the packet being ack'd as being received by the device end (round-trip time)
				const unsigned __int64 latencyDeltaTicks = packetsRecvTime.QuadPart - thisUnackedSentPacket->originalSendTime;
				while (netStats.rollingRoundtripTimestamps.size() >= LATENCY_ROLLING_TIMESTAMPS_WINDOW)
				{
					netStats.rollingRoundtripTimestamps.erase(netStats.rollingRoundtripTimestamps.begin() );
				}
				netStats.rollingRoundtripTimestamps.push_back(latencyDeltaTicks);

				H2DUnackedPackets.erase(H2DUnackedPackets.begin() + x);
				--numUnackedSentPackets;
				++numPacketsAcked;

				free(thisUnackedSentPacket);
			}
			else
			{
				++x;
			}
		}
		if (H2DUnackedPackets.empty() && H2DUnackedPacketsIsEmpty == false)
		{
			H2DUnackedPacketsIsEmpty = true;
			WakeByAddressSingle(&H2DUnackedPacketsIsEmpty);
		}
	}

	if (numPacketsAcked != 0)
	{
		unsigned __int64 sumTicks = 0;
		const unsigned numElements = (const unsigned)netStats.rollingRoundtripTimestamps.size();
		for (unsigned x = 0; x < numElements; ++x)
		{
			sumTicks += netStats.rollingRoundtripTimestamps[x];
		}
		const unsigned __int64 averageTick = sumTicks / numElements;
		netStats.rollingAverageRoundtripLatencyMilliseconds = (sumTicks * ldFreq) * 1000.0;
	}

	return numPacketsAcked;
}

void NetSession::ProcessValidSessionSubpackets(const DeviceSessionPacket* const validSessionHeader)
{
	DisallowNonRecvThreadCalls();

	const Subpacket* const subpacketsArray = (const Subpacket* const)(validSessionHeader + 1);

	if (validSessionHeader->subpacketCount > 0)
	{
		const AutoCS autoLock(IncomingSubpacketsLock);
		IncomingSubpacketsQueue.reserve(IncomingSubpacketsQueue.size() + validSessionHeader->subpacketCount);
		for (unsigned char x = 0; x < validSessionHeader->subpacketCount; ++x)
		{
			IncomingSubpacketsQueue.push_back(subpacketsArray[x]);
		}
		//if (ReadSubpacketsAreReady == false) // For lower wake latency, do this all the time
		{
#ifdef ENABLE_PIX_PROFILER
			PIXSetMarker(PIX_COLOR_INDEX(9), "WakeMainThread (New read data is ready)");
#endif
			ReadSubpacketsAreReady = true;
			WakeByAddressSingle(&ReadSubpacketsAreReady);
		}
	}
}

void NetSession::WakeSendThread(const NetSession::WakeSendThreadReason wakeReason)
{
#ifdef _DEBUG
	if (wakeReason >= NUM_WAKE_SEND_THREAD_REASONS)
	{
		__debugbreak();
	}
#endif

	InterlockedOr8( (char* const)&(WakeSendThreadAtomic[wakeReason]), true);
	WakeByAddressSingle( (void* const)WakeSendThreadAtomic);
}

void NetSession::ProcessValidSessionPacket(const DeviceSessionPacket* const validSessionHeader)
{
	PIXScoped scope(8, "ProcessValidSessionPacket");
	DisallowNonRecvThreadCalls();

	const unsigned short packetIdDelta = validSessionHeader->thisPacketID - sessionState.D2H_LastRecvPacketID;
	if (packetIdDelta > MAX_UNACKED_SENT_PACKETS_WINDOW_SIZE)
	{
		printf("Error: Received session packet with packetID outside of valid ID range. PacketID = D%u; LastRecvPacketID = D%u\n", 
			validSessionHeader->thisPacketID, sessionState.D2H_LastRecvPacketID);
		sessionState.sessionStats.IncSessionInvalidRecv();
		return; // Error: Drop this (likely stale retransmitted) packet due to being old so that it doesn't mess us up!
	}

	// Note that oldAckID may be greater than newAckID in the case of our packet ID's wrapping around!
	const USHORT oldAckID = sessionState.H2D_LastAckedPacketID;
	const USHORT newAckID = validSessionHeader->lastAckedPacketID;

	// Update our last acked packet ID
	sessionState.H2D_LastAckedPacketID = newAckID;

	// Ack and free any pending packets in the sent-and-unacked packets queue:
	NumPacketAcksThisReadFrame += DeviceAcksHostSentPackets(oldAckID, newAckID);

	if (validSessionHeader->subpacketCount == 0)
	{
		sessionState.sessionStats.IncSessionValidRecv(validSessionHeader->subpacketCount, false);

		// We should wake up the send thread at this point to reduce our ack latency
		WakeSendThread(NewValidRecvPacket);

#ifdef ENABLE_PIX_PROFILER
		PIXSetMarker(PIX_COLOR_INDEX(9), "WakeSendThread (Ack-Only NewValidRecvPacket)");
#endif

		return; // We're done in the case of an "empty" ACK-only packet
	}
	else
	{
		// Update our "last successfully received" packet ID to the ID of this most recent valid non-empty data packet:
		sessionState.D2H_LastRecvPacketID = validSessionHeader->thisPacketID;

		// Set the "needs to send an ack" flag:
		sessionState.NeedSendDataPacketAck = true;

		// We should wake up the send thread at this point to reduce our ack latency
		WakeSendThread(NewValidRecvPacket);
	}

#ifdef ENABLE_PIX_PROFILER
	PIXSetMarker(PIX_COLOR_INDEX(9), "WakeSendThread (Data NewValidRecvPacket)");
#endif

	if (packetIdDelta == 0)
	{
		if (validSessionHeader->subpacketCount > 0)
		{
			printf("Warning: Dropping duplicated session packet ID D%u\n", validSessionHeader->thisPacketID);

			const bool isDuplicatePacketRecv = true;
			sessionState.sessionStats.IncSessionValidRecv(validSessionHeader->subpacketCount, isDuplicatePacketRecv);
		}
		else
		{
			sessionState.sessionStats.IncSessionValidRecv(validSessionHeader->subpacketCount, false);
		}
		// We've already processed this packet (or this is an empty ack-only packet), so don't process its payload again!
		return;
	}
	else if (packetIdDelta == 1)
	{
		// Common case of this new packet being the in-order next expected packet. Simply process it directly and don't add it
		// to the out-of-order arrivals queue:
		sessionState.sessionStats.IncSessionValidRecv(validSessionHeader->subpacketCount);
		ProcessValidSessionSubpackets(validSessionHeader);
	}
	else
	{
		// This is a future packet that we don't have the intermediary packet data for just yet.
		// We should add this packet into the out-of-order arrivals queue so that we can process it later once
		// more packets have arrived.
		// Note that on the FPGA Device side, there exists no such logic to handle out of order packets and out of order packets are simply dropped on the floor and discarded. We are
		// only performing this extra logic here to improve performance in the case of out of order received packets because on the PC Host side of things we have more than enough memory
		// to store and sort a large out-of-order packets buffer.
		sessionState.sessionStats.IncSessionValidRecv(validSessionHeader->subpacketCount);

		const unsigned short packetLenBytes = sizeof(DeviceSessionPacket) + sizeof(Subpacket) * validSessionHeader->subpacketCount;

		PacketBuffer* const newBufferedPacket = (PacketBuffer* const)malloc( (sizeof(PacketBuffer) - 1) + packetLenBytes);
#ifdef _DEBUG
		if (!newBufferedPacket)
		{
			__debugbreak(); // Out of memory!
		}
#endif
		newBufferedPacket->packetNumber = validSessionHeader->thisPacketID;
		newBufferedPacket->packetLenBytes = packetLenBytes;
		newBufferedPacket->hasPacketBeenSent = true; // Received D2H packets have always been sent
		memcpy(newBufferedPacket->packetBytes, validSessionHeader, packetLenBytes);

		const AutoCS autoLock(D2HLock);
		unsigned numOutOfOrderArrivals = (const unsigned)D2HUnorderedPackets.size();

		// It's very important that we find and destroy any duplicates that might exist in order to prevent the out-of-order arrivals queue
		// from growing infinitely!
		for (unsigned x = 0; x < numOutOfOrderArrivals;)
		{
			PacketBuffer* const thisOutOfOrderPacket = D2HUnorderedPackets[x];
			if (thisOutOfOrderPacket->packetNumber == validSessionHeader->thisPacketID)
			{
				D2HUnorderedPackets.erase(D2HUnorderedPackets.begin() + x);
				--numOutOfOrderArrivals;
				free(thisOutOfOrderPacket); // Erase the old packet, replace with the new packet with the same packetID
				break;
			}
			else
			{
				++x;
			}
		}
		D2HUnorderedPackets.push_back(newBufferedPacket);
	}
}

void NetSession::HandleSessionConnectedPacket(const PacketHeaderMagic* const recvPacketData, const unsigned recvLenBytes)
{
	PIXScoped scope(7, "HandleSessionConnectedPacket");
	DisallowNonRecvThreadCalls();

	if (recvLenBytes < sizeof(DeviceSessionPacket) )
	{
		printf("Error: Received session packet too small to be valid (packet length %u bytes; expected minimum length = sizeof(DeviceSessionPacket) = %u bytes)\n", recvLenBytes, (const unsigned)sizeof(DeviceSessionPacket) );
		sessionState.sessionStats.IncSessionInvalidRecv();
		return; // Error: This packet is too small to be a valid session packet!
	}

	switch (recvPacketData->packetType)
	{
	// case command::PT_SESSION_DMA_REPLY: // TODO: Handle DMA later!
		//break;
	case command::PT_SESSIONCOMBOPACKET:
	{
		const DeviceSessionPacket* const sessionHeader = (const DeviceSessionPacket* const)recvPacketData;
		if (sessionHeader->subpacketCount > DeviceSessionPacket::MAX_SUBPACKET_COUNT)
		{
			printf("Error: Session packet with too many subpackets detected (subpacketCount: %u, max allowed subpackets: %u)\n", sessionHeader->subpacketCount, DeviceSessionPacket::MAX_SUBPACKET_COUNT);
			sessionState.sessionStats.IncSessionInvalidRecv();
			return; // Error: Invalid subpacket count. Likely corrupted/malformed packet.
		}

		const BYTE computedHeaderChecksum = sessionHeader->CalculateHeaderChecksum();
		if (computedHeaderChecksum != sessionHeader->packetChecksum)
		{
			printf("Error: Invalid session packet checksum detected (packet checksum: 0x%02X; expected checksum: 0x%02X)\n", sessionHeader->packetChecksum, computedHeaderChecksum);
			sessionState.sessionStats.IncSessionInvalidRecv();
			return; // Error: Invalid packet header checksum. Likely corrupted/malformed packet.
		}

		const unsigned expectedPacketLenBytes = sessionHeader->subpacketCount * sizeof(Subpacket) + sizeof(DeviceSessionPacket);
		if (recvLenBytes < expectedPacketLenBytes)
		{
			printf("Error: Session packet size error. Packet is not long enough to carry the claimed number of subpackets (packet len = %u; subpacketCount = %u; expected len = %u)\n", 
				recvLenBytes, sessionHeader->subpacketCount, expectedPacketLenBytes);
			sessionState.sessionStats.IncSessionInvalidRecv();
			return; // Error: Incomplete packet detected (not enough bytes).
		}

		QueryPerformanceCounter(&sessionState.D2H_LastPacketRecvTime);

		// Our session packet is valid! Let's process it:
		ProcessValidSessionPacket(sessionHeader);
	}
		break;
	case command::PT_DISCONNECT:
	{
		QueryPerformanceCounter(&sessionState.D2H_LastPacketRecvTime);

		const SessionDisconnectPacket* const disconnectHeader = (const SessionDisconnectPacket* const)recvPacketData;
		if (memcmp(disconnectHeader->senderIPv4Address, sessionState.deviceIPv4Address, sizeof(sessionState.deviceIPv4Address) ) == 0)
		{
			printf("Device end initiated session disconnection. Disconnect reason: %u\n", disconnectHeader->disconnectReason);
			SendShutdownPacket(errUserRequestedClose);
			return;
		}
	}
		break;
	default:
		printf("Error: Invalid session packet type received. PacketType = %u\n", recvPacketData->packetType);
		sessionState.sessionStats.IncSessionInvalidRecv();
		return; // Error: Unrecognized session packet type!
	}
}

const unsigned NetSession::RecvLoop()
{
	DisallowNonRecvThreadCalls();

	const char* recvData = NULL;
	const SOCKADDR_IN* recvFromAddr = NULL;
	bool processedPackets = false;
	unsigned recvPacketsCount = 0;
	while (true)
	{
		unsigned recvPacketLen;
		if (sessionState.isConnected)
			recvPacketLen = WrappedRecv(recvData, sessionState.recvAddr);
		else
			recvPacketLen = WrappedRecvFrom(recvData, recvFromAddr);
		if (recvPacketLen == 0)
		{
#ifndef NO_SLEEPS_RECV
			if (processedPackets)
			{
				const int notifyResult = RIOFunctionsTable.RIONotify(recvCQueue);
				if (notifyResult != ERROR_SUCCESS)
				{
					__debugbreak();
				}
			}
#endif // !NO_SLEEPS_RECV
			return recvPacketsCount;
		}
		else // recvRet is the number of bytes read
		{
			netStats.IncNetRecv( (const unsigned)recvPacketLen);
			++recvPacketsCount;

			QueryPerformanceCounter(&sessionState.D2H_LastPacketRecvTime);

			processedPackets = true;

			const PacketHeaderMagic* const header = (const PacketHeaderMagic* const)recvData;
			if (header->magicProtoValue != PROTO_MAGIC_BYTE)
			{
				printf("Error: Non-protocol received packet detected (incorrect magic byte specified: 0x%02X; expected magic byte: 0x%02X)\n", header->magicProtoValue, PROTO_MAGIC_BYTE);
				continue; // This is not a packet for our protocol, just drop it on the floor.
			}

			if (header->packetType >= command::PT_MAX_PACKET_TYPES)
			{
				printf("Error: Packet type detected as out of range (%u). Dropping invalid packet!\n", header->packetType);
				continue;
			}

			if (sessionState.isConnected)
				HandleSessionConnectedPacket(header, (const unsigned)recvPacketLen);
			else
				HandleSessionUnconnectedPacket(header, (const unsigned)recvPacketLen, *recvFromAddr);
		}
	}
	return recvPacketsCount;
}

// Sleeps the calling thread for 0.1ms
static void MicroSleep(const double ldFreq)
{
	LARGE_INTEGER sleepStartTime;
	QueryPerformanceCounter(&sleepStartTime);

	const unsigned __int64 sleepTickCount = static_cast<unsigned __int64>(1.0 / ldFreq) / 10000; // Calibrate this to be 0.1ms, in ticks
	unsigned __int64 ticksDelta;
	do
	{
		YieldProcessor();

		LARGE_INTEGER currentTime;
		QueryPerformanceCounter(&currentTime);

		ticksDelta = currentTime.QuadPart - sleepStartTime.QuadPart;
	} while (ticksDelta < sleepTickCount);
}

void NetSession::NetSessionRecvThreadMain()
{
	DisallowNonRecvThreadCalls();

	PIXScoped scopeThread(1, "RecvThread");

	while (ShutdownSystem == FALSE)
	{
#ifndef NO_SLEEPS_RECV
		{
			PIXScoped scopeWait(0, "RecvWait");
			if (WSAWaitForMultipleEvents(1, &recvEvent, FALSE, INFINITE, TRUE) == WSA_WAIT_FAILED)
			{
				__debugbreak();
			}
		}
#endif // !NO_SLEEPS_RECV

		if (ShutdownSystem)
			break;

		PIXScoped scopedFrame(1, "RecvFrame");

		do
		{
			// Keep pumping the recv loop until we run out of incoming packets
			RecvLoop();

			YieldProcessor();
		} while (RecvLoop() > 0);

		if (NumPacketAcksThisReadFrame > 0)
		{
			ReadPacketAcksRollingHistory.push_back(NumPacketAcksThisReadFrame);

			if (ReadPacketAcksRollingHistory.size() >= PACKET_ACKS_ROLLING_AVERAGE_WINDOW)
			{
				ReadPacketAcksRollingHistory.erase(ReadPacketAcksRollingHistory.begin() );
			}
			unsigned packetAcksSum = 0;
			const unsigned char historySize = static_cast<const unsigned char>(ReadPacketAcksRollingHistory.size() );
			static_assert(PACKET_ACKS_ROLLING_AVERAGE_WINDOW < UCHAR_MAX, "Error: Rolling average size is too large to store in a uint8!");
			for (unsigned x = 0; x < historySize; ++x)
			{
				packetAcksSum += ReadPacketAcksRollingHistory[x];
			}
			PacketAcksWindowSizeRollingAverage = packetAcksSum / static_cast<const float>(historySize);

			NumPacketAcksThisReadFrame = 0; // Clear our packet acks this frame counter
		}

		// At this point we need to check and see if the packet/s we just received have "filled a hole" in our list of future packets:
		PacketBuffer* foundNextValidPacket = NULL;
		while (true)
		{
			const unsigned short nextValidPacketID = sessionState.D2H_LastRecvPacketID + 1;
			foundNextValidPacket = NULL;
			{
				const AutoCS autoLock(D2HLock);
				const unsigned numOutOfOrderArrivals = (const unsigned)D2HUnorderedPackets.size();
				for (unsigned x = 0; x < numOutOfOrderArrivals; ++x)
				{
					PacketBuffer* const thisOutOfOrderPacket = D2HUnorderedPackets[x];
					if (thisOutOfOrderPacket->packetNumber == nextValidPacketID)
					{
						foundNextValidPacket = thisOutOfOrderPacket;
						D2HUnorderedPackets.erase(D2HUnorderedPackets.begin() + x);
						break;
					}
				}
			}
			if (foundNextValidPacket)
			{
				HandleSessionConnectedPacket( (const PacketHeaderMagic* const)foundNextValidPacket->packetBytes, foundNextValidPacket->packetLenBytes);
				free(foundNextValidPacket);
				continue;
			}
			else
			{
				// No more valid packets found. We're done!
				break;
			}
		}
	}
}
