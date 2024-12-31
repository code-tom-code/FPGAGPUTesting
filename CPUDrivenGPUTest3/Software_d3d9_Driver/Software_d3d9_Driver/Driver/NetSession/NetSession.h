#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <WinSock2.h>
#include <MSWSock.h> // For the new RIO extension definitions
#include <ws2ipdef.h> // For the SOCKADDR_INET struct definition
#include <intrin.h>
#include <vector>
#include <deque>
#include "..\PacketDefs.h"

#define NET_PROTO_MAJOR_VERSION 1
#define NET_PROTO_MINOR_VERSION 0
#define NET_PROTO_UDP_PORT_D2H 3128
#define NET_PROTO_UDP_PORT_H2D (NET_PROTO_UDP_PORT_D2H + 1)

#define PROTO_MAGIC_BYTE 0xA5
#define MAX_PACKET_WIRE_MTU_BYTES 1500u // The 1500-byte default MTU does *not* include the size of the Ethernet packet header
#define MAX_PACKET_UDP_MTU_BYTES 1472u // This equates to exactly a 1500-byte wire MTU once you add in the IPv4 and UDP headers sizes
#define COMPLETION_QUEUE_SIZE (32u * 1024u) // The maximum depth of the completion queue determines how many outstanding recv or send operations may be in flight at any one time

// This was calculated from an approximate average of how many min-size packets could be sent from a PC within 3 round trips on a low-latency LAN at gigabit ethernet speeds
#ifdef _DEBUG
	//#define MAX_UNACKED_PACKETS_RESEND_WINDOW 4u // Use a smaller number for testing
	#define MAX_UNACKED_PACKETS_RESEND_WINDOW 1u // Use a smaller number for testing
#else
	#define MAX_UNACKED_PACKETS_RESEND_WINDOW 64u // It's calcuated that we can send at least 82 max-size packets per millisecond using gigabit ethernet
#endif
//#define MAX_UNACKED_SENT_PACKETS_WINDOW_SIZE 1024u
// #define MAX_UNACKED_SENT_PACKETS_WINDOW_SIZE 1u // For now, let's simplify things by only handling a single unacked packet at a time (this is exactly how the D2H send channel works)
#define MAX_UNACKED_SENT_PACKETS_WINDOW_SIZE MAX_UNACKED_PACKETS_RESEND_WINDOW // Full blast!
#define FULL_PACKET_TOTAL_SIZE_BYTES 1500u // This includes the sizes of the packet header, UDP header, and IPv4 header

// Defines the number of entries in the rolling average window for calculating roundtrip packet latencies
#define LATENCY_ROLLING_TIMESTAMPS_WINDOW 10u

// Defines the number of entries in the rolling average window for calculating packet batch window sizes
#define PACKET_ACKS_ROLLING_AVERAGE_WINDOW 16u

// This define will increase the system's timer frequency up from the default of 16ms to 1ms which may improve latency significantly
#define INCREASE_TIMER_FREQUENCY 1

// When this version flag is detected, that means that the device is being software emulated rather than being run on real hardware
static const unsigned char VERSION_FLAG_SOFTWARE_EMULATION = 0x80;

typedef void gpuvoid;

typedef DWORD ThreadID;

#pragma pack(push)
#pragma pack(1)

struct EthernetHeader
{
	unsigned char preamble[7] = { 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55 }; // Should always be 0x55
	unsigned char SFD = 0xD5; // Should always be 0xD5
	unsigned char destMAC[6]; // Destination MAC address
	unsigned char srcMAC[6]; // Source MAC address
	unsigned short etherType;

	// Ethernet payload goes here!
	// unsigned char payload[1500];

	unsigned long FCS_CRC32; // Finally the Ethernet frame ends with a 32-bit CRC for the entire packet data called the "Frame Check Sequence"

	// Following this Ethernet frame are at minimum 12 bytes of IPG (inter-packet gap)
};
static_assert(sizeof(EthernetHeader) == 26, "Error: Unexpected struct padding!");

struct IPv4Header
{
	unsigned char version : 4; // This is always equal to 4 for IPv4
	unsigned char IHL : 4; // This should always equal 5. It defines the length of the IPv4 header in DWORD's and our default/expected header size is 5*4=20
	unsigned char DSCP : 6;
	unsigned char ECN : 2;
	unsigned short totalLength; // The total length of the IPv4 packet including the packet header, in bytes (so the minimum length here is 20).
	unsigned short packetID;
	unsigned short flags_RESERVED_ZERO : 1; // This first packet flag bit is reserved and must always be set to 0
	unsigned short flags_DF : 1; // This is the "Don't Fragment" bit, which marks a packet as not being allowed to be fragmented.
	unsigned short flags_MF : 1; // This is the "More Fragments" bit which denotes that there are more packet fragments following this one (is 0 for the last packet fragment, also is 0 for regular unfragmented packets).
	unsigned short frag_offset : 13;
	signed char TTL; // Time to live counts down with each router hop and when it reaches 0, the packet may be discarded. It's used for preventing infinite packet loops.
	unsigned char protocolID; // Which IP protocol this is. Commonly used entries include IPPROTO_TCP and IPPROTO_UDP.
	unsigned short headerChecksum; // The IPv4 checksum only includes the IPv4 header and ignores the payload data
	unsigned long sourceIPv4Address;
	unsigned long destIPv4Address;
};
static_assert(sizeof(IPv4Header) == 20, "Error: Unexpected struct padding!");

struct UDPHeader
{
	unsigned short sourcePort;
	unsigned short destPort;
	unsigned short totalLength; // The total packet length including the UDP header and its contained data, in bytes. The minimum size is 8 bytes for a packet with just a header and no data.
	unsigned short UDPchecksum; // The TCP and UDP checksums are the exact same algorithm as the IPv4 checksum algorithm, except they also include an IPv4 pseudoheader in their checksum calculation.
};
static_assert(sizeof(UDPHeader) == 8, "Error: Unexpected struct padding!");

static_assert(MAX_PACKET_UDP_MTU_BYTES + sizeof(UDPHeader) + sizeof(IPv4Header) == MAX_PACKET_WIRE_MTU_BYTES, "Error: Unexpected MTU sizes!");

struct PacketBuffer
{
	unsigned __int64 originalSendTime; // The QueryPerformanceCounter() timestamp of when this packet was originally first sent and added into the unacked packets queue
	USHORT packetNumber;
	USHORT packetLenBytes;
	bool hasPacketBeenSent; // Determines if this packet has yet been sent (and is thus a resend packet) or if it has not yet been sent. This field only has a meaning for H2D packets.

	BYTE packetBytes[1];
};
static_assert(sizeof(PacketBuffer) == 14, "Error: Unexpected struct padding!");

// All packets start with the same magic byte.
// It is how we verify that packets received are intended for our protocol and not some other one, and also how we ensure that the packet is not corrupted (at least the first byte isn't corrupted):
struct PacketHeaderMagic
{
	BYTE magicProtoValue = PROTO_MAGIC_BYTE;
	command::ePacketType packetType; // This defines which type of packet this is!
};
static_assert(sizeof(PacketHeaderMagic) == 2, "Error: Unexpected struct padding!");

struct DeviceBroadcastPacket : PacketHeaderMagic
{
	// PacketType is always "PT_CONNBROADCAST" (29 or 0x1D)
	
	// The version of the network protocol that the sending device uses to communicate.
	BYTE netProtoVersionMajorDevice; // The host and device may establish a session only if their MAJOR network protocol versions match.
	BYTE netProtoVersionMinorDevice; // The minor version of the network protocol is allowed to differ between the host and device.
	
	// Broadcast payload data follows:
	BYTE deviceMACAddress[6]; // The MAC address of the broadcasting device
	BYTE deviceIPv4Address[4]; // The IPv4 address of the broadcasting device
	USHORT numBroadcastsSinceReset; // The number of broadcasts that this device has emitted since power-on, or since the last host disconnected (wraps around to 0 on overflow)
	BYTE hasLostSession; // 0 if this device has just powered on, or 1 if this device has previously lost a session with a host.
};
static_assert(sizeof(DeviceBroadcastPacket) == 17, "Error: Unexpected struct padding!");

struct HostRequestConnectSessionPacket : PacketHeaderMagic
{
	// PacketType is always "PT_CONNREQUEST" (30 or 0x1E)
	
	// The version of the network protocol that the sending host uses to communicate.
	BYTE netProtoVersionMajorHost; // The host and device may establish a session only if their MAJOR network protocol versions match.
	BYTE netProtoVersionMinorHost; // The minor version of the network protocol is allowed to differ between the host and device.
	BYTE unusedPadding; // This byte is currently unused, and just pads the packet payload to 8 bytes
	
	BYTE hostIPv4Address[4]; // The IPv4 address of the connecting host. This is checked against the actual IPv4 address that the packet comes in on to make sure it matches.
};
static_assert(sizeof(HostRequestConnectSessionPacket) == 9, "Error: Unexpected struct padding!");

enum SessionConnectRequestReplyStatus : BYTE
{
	// Success! We have a new session!
	acceptNewSession = 0, // 0

	// Error status codes follow:
	errInvalidRequestLength, // 1 -- The length of the host's "request session connect" packet was not valid.
	errInvalidNetProtoMajorVer, // 2 -- The major net proto version doesn't match between the host and device.
	errInvalidPacketType, // 3 -- The only packet type allowed from a host before a session is established is the "request session connect" packet.
	errInvalidIPv4Addr, // 4 -- The host used an invalid IPv4 address (0x00000000 or 0xFFFFFFFF are both considered "invalid")
	errMismatchIPv4Addr, // 5 -- The IPv4 address that the host used doesn't match the IPv4 address of the sent packet.
	errInvalidMagic, // 6 -- The magic byte at the start of the packet is not valid.

	MAX_NUM_SESSION_CONNECT_RESPONSE_STATUS // This must always be last
};

const char* const sessionConnectRequestReplyStatusStrings[] =
{
	"acceptNewSession", // 0

	// Error status codes follow:
	"errInvalidRequestLength", // 1 -- The length of the host's "request session connect" packet was not valid.
	"errInvalidNetProtoMajorVer", // 2 -- The major net proto version doesn't match between the host and device.
	"errInvalidPacketType", // 3 -- The only packet type allowed from a host before a session is established is the "request session connect" packet.
	"errInvalidIPv4Addr", // 4 -- The host used an invalid IPv4 address (0x00000000 or 0xFFFFFFFF are both considered "invalid")
	"errMismatchIPv4Addr", // 5 -- The IPv4 address that the host used doesn't match the IPv4 address of the sent packet.
	"errInvalidMagic" // 6 -- The magic byte at the start of the packet is not valid.
};
static_assert(ARRAYSIZE(sessionConnectRequestReplyStatusStrings) == MAX_NUM_SESSION_CONNECT_RESPONSE_STATUS, "Error: String table mismatches enum!");

struct DeviceConnectSessionResponsePacket : PacketHeaderMagic
{
	// PacketType is always "PT_CONNRESPONSE" (31 or 0x1F)
	
	SessionConnectRequestReplyStatus status; // Status can be "0" which means that the session is accepted, or it can be a nonzero error code status value that explains why the session failed to be created.
};
static_assert(sizeof(DeviceConnectSessionResponsePacket) == 3, "Error: Unexpected struct padding!");

enum SessionDisconnectReason : BYTE
{
	errUserRequestedClose = 0, // User requested session close
	errShutdown, // The program is shutting down, so we're trying to close the session gracefully.
	errSessionError, // Session Error
	errWindowOverrun, // Send Window Overrun - too many packets sent without any acks received. Session gets closed rather than unbounded memory leak.
	errARPLost, // ARP Lost - packets can no longer be delivered due to the entry falling out of our ARP table
	errTimeout, // We haven't received a packet from the other end in too long of a time. It probably locked up or hung somehow, or the router inbetween us stopped responding.
	errOther, // Some other error has resulted in this disconnect

	MAX_NUM_SESSION_DISCONNECT_REASON // This must always be last
};

const char* const sessionDisconnectReasonStrings[] =
{
	"errUserRequestedClose", // User requested session close
	"errShutdown", // The program is shutting down, so we're trying to close the session gracefully.
	"errSessionError", // Session Error
	"errWindowOverrun", // Send Window Overrun - too many packets sent without any acks received. Session gets closed rather than unbounded memory leak.
	"errARPLost", // ARP Lost - packets can no longer be delivered due to the entry falling out of our ARP table
	"errTimeout", // We haven't received a packet from the other end in too long of a time. It probably locked up or hung somehow, or the router inbetween us stopped responding.
	"errOther" // Some other error has resulted in this disconnect
};
static_assert(ARRAYSIZE(sessionDisconnectReasonStrings) == MAX_NUM_SESSION_DISCONNECT_REASON, "Error: String table mismatches enum!");

struct SessionDisconnectPacket : PacketHeaderMagic
{
	// PacketType is always "PT_DISCONNECT" (33 or 0x21)

	BYTE senderIPv4Address[4];
	BYTE unusedPadding[2]; // Padding to ensure that the final packet size ends up being 8 bytes (ignoring the magic byte)
	SessionDisconnectReason disconnectReason;
};
static_assert(sizeof(SessionDisconnectPacket) == 9, "Error: Unexpected struct padding!");

struct Subpacket
{
	command::ePacketType subpacketType;
	DWORD payload0;
	DWORD payload1;
};
static_assert(sizeof(Subpacket) == 9, "Error: Unexpected struct padding!");

struct DeviceSessionPacket : PacketHeaderMagic
{
	// PacketType may be any packet type
	USHORT thisPacketID; // Packet ID of this current packet (drop packet if valid duplicates are detected)
	USHORT lastAckedPacketID; // Packet ID that the sender has last received
	BYTE packetChecksum; // Checksum for the header to ensure it's valid. This checksum only validates that the header is intact, it does not checksum all of the subpackets too.
	BYTE packetFlags; // Currently only bit 0 is used
	BYTE subpacketCount; // Number of subpackets included in this packet (valid for this to be 0 in the case of an ACK-only packet with no data). May go up to 1472/sizeof(SimplifiedCommandListPacket) = 163.

	static constexpr unsigned MIN_SUBPACKET_COUNT = 0u; // It *is* valid to send a session packet with 0 subpackets (this is typically only done in the case of heartbeat keepalives, or ack-only packets).
	static constexpr unsigned EXPECTED_SESSION_PACKET_HEADER_SIZE = 9u; // Our session packet header should be this many bytes (not including the subpackets payload)
	static constexpr unsigned MAX_SUBPACKET_COUNT = (MAX_PACKET_WIRE_MTU_BYTES - sizeof(IPv4Header) - sizeof(UDPHeader) - EXPECTED_SESSION_PACKET_HEADER_SIZE) / sizeof(Subpacket); // This is the maximum number of subpackets that will fit into a session packet that fits into one standard network packet MTU.
	static constexpr unsigned MAX_USER_PACKET_SIZE = EXPECTED_SESSION_PACKET_HEADER_SIZE + MAX_SUBPACKET_COUNT * sizeof(Subpacket);

	const BYTE CalculateHeaderChecksum() const
	{
		BYTE ret = PROTO_MAGIC_BYTE;
		ret += _rotl8(packetType, 1);
		ret += _rotr8(thisPacketID & 0xFF, 1);
		ret += _rotl8(thisPacketID >> 8, 2);
		ret += _rotr8(lastAckedPacketID & 0xFF, 2);
		ret += _rotl8(lastAckedPacketID >> 8, 3);
		// ret += _rotr8(packetChecksum, 3); // Skip the checksum byte since it'll logically be 0x00 for the purposes of checksum computation
		ret += _rotl8(packetFlags, 4);
		ret += _rotr8(subpacketCount, 4);
		return ret;
	}
};
static_assert(sizeof(DeviceSessionPacket) == DeviceSessionPacket::EXPECTED_SESSION_PACKET_HEADER_SIZE, "Error: Unexpected struct padding!");
#pragma pack(pop)

struct CSObj
{
	CSObj();
	~CSObj();

	CRITICAL_SECTION cs;
};

struct AutoCS
{
	AutoCS(CSObj& cs) : _cs(cs)
	{
		EnterCriticalSection(&cs.cs);
	}

	~AutoCS()
	{
		LeaveCriticalSection(&_cs.cs);
	}

private:
	CSObj& _cs;
};

static constexpr const bool IsPowerOf2(const unsigned x)
{
	return x && (!(x & (x - 1) ) );
}

struct NetworkStats
{
	unsigned __int64 numPacketsSentTotal = 0; // Number of UDP packets sent, in total, for the entire lifetime of this application
	unsigned __int64 numPacketsRecvTotal = 0; // Number of UDP packets received, in total, for the entire lifetime of this application
	unsigned __int64 numEthBytesSentTotal = 0; // Number of bytes sent at the Ethernet level (including Ethernet header, IPv4 header, UDP header, and packet body)
	unsigned __int64 numEthBytesRecvTotal = 0; // Number of bytes received at the Ethernet level (including Ethernet header, IPv4 header, UDP header, and packet body)
	unsigned __int64 numAppBytesSentTotal = 0; // Number of bytes sent at the application level (ignoring Ethernet header, IPv4 header, and UDP header)
	unsigned __int64 numAppBytesRecvTotal = 0; // Number of bytes received at the application level (ignoring Ethernet header, IPv4 header, and UDP header)
	std::vector<unsigned __int64> rollingRoundtripTimestamps; // Timestamps for the previous N roundtrip packet latencies
	double rollingAverageRoundtripLatencyMilliseconds = 0.0;

	// Call this function when a packet is sent to increment the packet send stats
	void IncNetSend(const unsigned appPacketLenBytes);

	// Call this function when a packet is received to increment the packet recv stats
	void IncNetRecv(const unsigned appPacketLenBytes);
};

struct ConnectedSessionStats
{
	unsigned __int64 numSessionPacketsSent = 0; // Number of session packets sent for the duration of this session (includes resends)
	unsigned __int64 numSessionPacketsValidRecv = 0; // Number of valid session packets received for the duration of this session
	unsigned __int64 numSessionPacketResends = 0; // Number of session packets that were resent due to not being ack'd in time
	unsigned __int64 numSessionPacketDuplicatesRecv = 0; // Number of session packets that were discarded due to being received as duplicates of packets that we already had
	unsigned __int64 numSessionPacketInvalidRecv = 0; // Number of invalid (corrupted, failed checksum, etc.) packets received for the duration of this session
	unsigned __int64 numSessionSubpacketsSent = 0; // Number of session subpackets sent for the duration of this session
	unsigned __int64 numSessionSubpacketsRecv = 0; // Number of session subpackets received for the duration of this session (excludes invalid packets or duplicate packets)
	unsigned __int64 numSessionSubpacketsBytesSent = 0; // Number of bytes of data sent in subpackets for the duration of this session
	unsigned __int64 numSessionSubpacketsBytesRecv = 0; // Number of bytes of data received in subpackets for the duration of this session (excludes invalid packets or duplicate packets)

	// Call this function when a session is reset to wipe the session stats
	inline void ResetSessionStats()
	{
		memset(this, 0, sizeof(*this) );
	}

	void IncSessionSend(const unsigned char numSubpackets, bool isResendPacket = false);
	void IncSessionValidRecv(const unsigned char numSubpackets, bool isDuplicatePacket = false);
	void IncSessionInvalidRecv();
};

struct RIOAllocBuffer
{
	void InitBuffer(const unsigned bufferSize_bytes);

	~RIOAllocBuffer();

	const static constexpr unsigned PACKET_SLICE_SIZE_BYTES = 2048u;
	const static constexpr unsigned ADDRESS_SLICE_SIZE_BYTES = 128u;

	static_assert(PACKET_SLICE_SIZE_BYTES >= MAX_PACKET_WIRE_MTU_BYTES, "Error: Packet buffer slice is not large enough to store a max-sized packet!");
	static_assert(ADDRESS_SLICE_SIZE_BYTES >= sizeof(SOCKADDR_INET), "Error: Address buffer slice is not large enough to store an address struct!");

	inline char* GetDataWriteable() const
	{
		return dataPtr;
	}

	inline const char* const GetDataRead() const
	{
		return dataPtr;
	}

	inline RIO_BUFFERID GetRIOBufferID() const
	{
		return bufferID;
	}

	inline const char* const GetPacketSliceDataRead(const unsigned sliceIndex) const
	{
		return dataPtr + (PACKET_SLICE_SIZE_BYTES * sliceIndex);
	}

	inline char* const GetPacketSliceDataWrite(const unsigned sliceIndex) const
	{
		return dataPtr + (PACKET_SLICE_SIZE_BYTES * sliceIndex);
	}

	inline const SOCKADDR_INET* const GetAddressSliceDataRead(const unsigned sliceIndex) const
	{
		return reinterpret_cast<const SOCKADDR_INET* const>(dataPtr + (ADDRESS_SLICE_SIZE_BYTES * sliceIndex) );
	}

	inline SOCKADDR_INET* const GetAddressSliceDataWrite(const unsigned sliceIndex)
	{
		return reinterpret_cast<SOCKADDR_INET* const>(dataPtr + (ADDRESS_SLICE_SIZE_BYTES * sliceIndex) );
	}

	inline RIO_BUF& GetSliceDescriptor(const unsigned sliceIndex)
	{
		return sliceDescriptors[sliceIndex];
	}

	inline const RIO_BUF& GetSliceDescriptor(const unsigned sliceIndex) const
	{
		return sliceDescriptors[sliceIndex];
	}

	inline const unsigned GetNumAvailableSlices() const
	{
		return availableSlices;
	}

	inline const unsigned ConsumeNextAvailableSlice()
	{
#ifdef _DEBUG
		if (GetNumAvailableSlices() == 0)
		{
			__debugbreak();
		}
#endif
		const unsigned nextAvailableSlice = currentWriteSliceID;
		currentWriteSliceID = (currentWriteSliceID + 1) % COMPLETION_QUEUE_SIZE;
		--availableSlices;
		return nextAvailableSlice;
	}

	inline void ReleaseSlice(const unsigned sliceID)
	{
#ifdef _DEBUG
		if (sliceID > ARRAYSIZE(sliceDescriptors) )
		{
			__debugbreak();
		}
#endif
		++availableSlices;
#ifdef _DEBUG
		if (availableSlices >= ARRAYSIZE(sliceDescriptors) )
		{
			__debugbreak();
		}
#endif
	}

	inline void ReleaseSlicesMultiple(const unsigned sliceCount)
	{
		availableSlices += sliceCount;
#ifdef _DEBUG
		if (availableSlices >= ARRAYSIZE(sliceDescriptors) )
		{
			__debugbreak();
		}
#endif
	}

private:
	char* dataPtr = NULL;
	RIO_BUFFERID bufferID = RIO_INVALID_BUFFERID;
	RIO_BUF sliceDescriptors[COMPLETION_QUEUE_SIZE] = {0};
	unsigned availableSlices = COMPLETION_QUEUE_SIZE;
	unsigned currentWriteSliceID = 0;
};

class NetSession
{
public:
	NetSession();
	~NetSession();

	struct ConnectedSessionState
	{
		bool isConnected = false;
		bool isReadyToSendConnectRequest = false;
		bool hasSentConnectRequest = false;
		unsigned char netProtoVersionMajorDevice = 0; // The host and device may establish a session only if their MAJOR network protocol versions match.
		unsigned char netProtoVersionMinorDevice = 0; // The minor version of the network protocol is allowed to differ between the host and device.
		unsigned char deviceIPv4Address[4] = {0};
		unsigned char deviceMACAddress[6] = {0};
		SOCKADDR_IN sendAddr = {0};
		SOCKADDR_IN recvAddr = {0}; // Should be identical to the sendAddr, but with a random (ephemeral) port number instead of the protocol-defined D2H port

		ConnectedSessionStats sessionStats = {0};

		__declspec(align(128) ) LARGE_INTEGER D2H_LastPacketRecvTime = {0}; // Written to by the recv process
		LARGE_INTEGER D2H_LastValidPacketRecvTime = {0};

		__declspec(align(128) ) LARGE_INTEGER H2D_LastPacketSendTime = {0}; // Written to by the send process

		__declspec(align(128) ) volatile unsigned short D2H_LastRecvPacketID = 0xFFFF; // Written to by the packet recv process, read by the packet send process
		__declspec(align(128) ) volatile unsigned short H2D_LastAckedPacketID = 0; // Written to by the packet recv process, read by the packet send process
		__declspec(align(128) ) volatile unsigned short H2D_CurrentPacketID = 1; // Written to by the packet send process, read by the packet recv process
		__declspec(align(128) ) volatile bool NeedSendDataPacketAck = false; // Written to by the packet recv process, read and written by the packet send process

		// This is called on session termination:
		void ClearSessionState()
		{
			*this = ConnectedSessionState();
		}
	} sessionState;

	const bool IsSessionConnected() const
	{
		return sessionState.isConnected;
	}

	static const constexpr unsigned VECTOR_RESERVE_SIZE_SCALE_FACTOR = 4u;
	static const constexpr unsigned PACKET_VECTOR_RESERVE_SIZE = MAX_UNACKED_PACKETS_RESEND_WINDOW * VECTOR_RESERVE_SIZE_SCALE_FACTOR;
	static const constexpr unsigned SUBPACKET_VECTOR_RESERVE_SIZE = PACKET_VECTOR_RESERVE_SIZE * DeviceSessionPacket::MAX_SUBPACKET_COUNT;

	// Sends a DMA write of a (usually large) block of bytes from the PC Host to the FPGA Device.
	void SendDMAWrite(const unsigned numWriteBytes, const DWORD* const writeHostData, gpuvoid* const writeDeviceAddr);

	// Requests a DMA read of a (usually large) block of bytes from the FPGA Device to the PC Host.
	// This function does not return until the full DMA read has completed!
	void SendDMAReadSync(const unsigned numReadBytes, DWORD* const readHostBuffer, const gpuvoid* const readDeviceAddr);

	// Requests a DMA read of a (usually large) block of bytes from the FPGA Device to the PC Host.
	// This function returns immediately and memory will be DMA-streamed back from the Device to the Host asynchronously.
	void SendDMAReadAsync(const unsigned numReadBytes, DWORD* const readHostBuffer, const gpuvoid* const readDeviceAddr);

	// Gets incoming packets (packets sent from Device to Host).
	// Returns the number of subpackets received (or 0 if there are no new packets available)
	const unsigned GetReadPacketsD2H(std::vector<Subpacket>& outPacketsD2H);

	// Sleeps the calling thread until there's new read packets available to be consumed.
	void WaitForReadPacketsAvailable();

	// Queues another subpacket up for being sent in the next batch
	void SendBatchSubpacket(const Subpacket& sendSubpacket);

	// Queues more subpackets up for being sent in the next batch. Optionally may force a batch-split if the subpackets need
	// to be kept together in the same packet.
	void SendBatchSubpackets(const unsigned numSubpackets, const Subpacket* const psendSubpackets, const bool forceKeepPacketsTogether = false);

	// Forces the current batch to send now (if it has anything in it) even if it's not full (improves latency, may end up wasting bandwidth if this is done too often).
	// Recommended to call this once per set of draw calls and also call it at the end of the frame after submitting the rest of the commands.
	void FlushSendBatch();

	// Waits until all queued sends have been delivered to the device and acked back that they have been received:
	void WaitForAllSendsCompletedAndAcked();

	// Queries the current network stats for this application
	const NetworkStats& GetNetworkStats() const
	{
		return netStats;
	}

	// Queries the current session's stats for this session's lifetime
	const ConnectedSessionStats& GetCurrentSessionStats() const
	{
		return sessionState.sessionStats;
	}

	enum WakeSendThreadReason
	{
		FlushTrigger = 0,
		NewValidRecvPacket,

		// This must always be last, and it must be 1, 2, 4, or 8. It may not be any other value!
		NUM_WAKE_SEND_THREAD_REASONS
	};

	// Returns the average round-trip network latency from the host to the device and back, in milliseconds.
	// Lower numbers are better. Returns exactly zero in case latency data is unavailable. For a LAN connection this value should usually be less than 1.0 milliseconds.
	const float GetAverageRoundTripLatencyMS() const
	{
		return (const float)netStats.rollingAverageRoundtripLatencyMilliseconds;
	}

private:
	static_assert(IsPowerOf2(NUM_WAKE_SEND_THREAD_REASONS) && 
		NUM_WAKE_SEND_THREAD_REASONS > 0 && 
		NUM_WAKE_SEND_THREAD_REASONS <= 8, 
		"Error: Must have power of 2 NUM_WAKE_SEND_THREAD_REASONS as QWORD or less!");

	__declspec(align(128) ) std::vector<Subpacket> IncomingSubpacketsQueue;
	CSObj IncomingSubpacketsLock;
	__declspec(align(128) ) bool ReadSubpacketsAreReady = false;
	unsigned NumPacketAcksThisReadFrame = 0;
	std::vector<unsigned> ReadPacketAcksRollingHistory;
	float PacketAcksWindowSizeRollingAverage = 1.0f;

	__declspec(align(128) ) std::vector<Subpacket> OutgoingSubpacketsQueue;
	CSObj OutgoingSubpacketsLock;

	// Sent packets live in this buffer before they are acked. They are removed when the Device end acks the packets in their range.
	__declspec(align(128) ) std::vector<PacketBuffer*> H2DUnackedPackets;
	__declspec(align(128) ) bool H2DUnackedPacketsIsEmpty = true;
	__declspec(align(128) ) bool LocalSendBufferIsEmpty = true;
	unsigned __int64 lastResendTimestamp = 0;
	CSObj H2DLock;
	SOCKET sendSocket = INVALID_SOCKET;
	SOCKET sendBroadcastSocket = INVALID_SOCKET; // A second send socket that is only ever used for broadcasting
	//ULONG lastSentAckID = 0;
	__declspec(align(128) ) volatile bool WakeSendThreadAtomic[NUM_WAKE_SEND_THREAD_REASONS] = { false };

	// Received packets live in this buffer in case they arrive out of order (thanks, router). They are removed when we have received the in-order packets with the corresponding packet numbers.
	__declspec(align(128) ) std::vector<PacketBuffer*> D2HUnorderedPackets;
	CSObj D2HLock;
	SOCKET recvSocket = INVALID_SOCKET;
	WSAEVENT recvEvent = WSA_INVALID_EVENT;

	__declspec(align(128) ) ThreadID SendSocketTID = 0;
	ThreadID RecvSocketTID = 0;
	HANDLE SendSocketThread = NULL;
	HANDLE RecvSocketThread = NULL;
	double ldFreq = 0.0;
	BOOL ShutdownSystem = FALSE;
	NetworkStats netStats = {0};
	RIOAllocBuffer sendDataBuffer; // The send data buffer stores our outgoing sent packet data
	RIOAllocBuffer recvDataBuffer; // The recv data buffer handles our incoming received packet data
	RIOAllocBuffer recvAddressBuffer; // The recv address buffer is where we'll look up the address data for our incoming packets when we call the RIO recvfrom() equivalent function (RIOReceiveEx() )
	RIO_CQ sendCQueue = RIO_INVALID_CQ;
	RIO_CQ recvCQueue = RIO_INVALID_CQ;
	RIO_RQ recvRQueue = RIO_INVALID_RQ;
	RIO_RQ sendRQueue = RIO_INVALID_RQ;
	RIO_RQ sendBroadcastRQueue = RIO_INVALID_RQ;

	void DisallowNetworkingThreadCalls() const;
	void DisallowNonRecvThreadCalls() const;
	void DisallowNonSendThreadCalls() const;
	static DWORD WINAPI NetSessionSendThreadEntry(LPVOID thisPtr);
	static DWORD WINAPI NetSessionRecvThreadEntry(LPVOID thisPtr);
	void NetSessionSendThreadMain();
	void NetSessionRecvThreadMain();
	void SendShutdownPacket(const SessionDisconnectReason disconnectReason = errShutdown);
	const unsigned RecvLoop();
	void SendLoop(const void* const packetBytes, const unsigned packetLenBytes);
	void SendSleepWait();
	void HandleSessionUnconnectedSendLoop();
	const unsigned CalculateSendPacketBatchWindowSize() const;
	void HandleSessionConnectedSendLoop(std::deque<Subpacket>& localSubpacketsQueue);
	void HandleSessionUnconnectedPacket(const PacketHeaderMagic* const recvPacketData, const unsigned recvLenBytes, const SOCKADDR_IN& recvAddr);
	void HandleSessionConnectedPacket(const PacketHeaderMagic* const recvPacketData, const unsigned recvLenBytes);
	void ProcessValidSessionPacket(const DeviceSessionPacket* const validSessionHeader);
	void ProcessValidSessionSubpackets(const DeviceSessionPacket* const validSessionHeader);
	const unsigned DeviceAcksHostSentPackets(const unsigned short beginAckPacketID, const unsigned short endAckPacketID);
	void WakeSendThread(const WakeSendThreadReason wakeReason);
	void WrappedSend(_In_reads_bytes_(len) const char* const buf, _In_ const unsigned len, _In_ const SOCKADDR_IN& sendAddr, _In_ const bool isBroadcastSend = false);
	const unsigned WrappedRecvFrom(_Out_ const char*& buf, _Out_ const SOCKADDR_IN*& fromAddr);
	const unsigned WrappedRecv(_Out_ const char*& buf, _In_ const SOCKADDR_IN& recvAddr);
};
