#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h> // for HRESULT and BYTE
#include <vector> // for std::vector
#include "GPUAllocator.h"
#include "PacketDefs.h"

#ifdef _DEBUG
	#define PRINT_COMMS 1

#ifdef _M_X64
	#define MAX_SENT_PACKET_BUFFER_EVER_BYTES (1024 * 1024 * 512)
	#define MAX_RECV_PACKET_BUFFER_EVER_BYTES MAX_SENT_PACKET_BUFFER_EVER_BYTES
#else
	#define MAX_SENT_PACKET_BUFFER_EVER_BYTES (1024 * 1024 * 128)
	#define MAX_RECV_PACKET_BUFFER_EVER_BYTES MAX_SENT_PACKET_BUFFER_EVER_BYTES
#endif
#endif

struct PacketStats
{
	void Accumulate(const PacketStats& rhs)
	{
		numPacketsSent += rhs.numPacketsSent;
		numPacketsRecv += rhs.numPacketsRecv;
		numBytesSent += rhs.numBytesSent;
		numBytesRecv += rhs.numBytesRecv;
	}

	void Reset()
	{
		numPacketsSent = 0;
		numPacketsRecv = 0;
		numBytesSent = 0;
		numBytesRecv = 0;
	}

	unsigned __int64 numPacketsSent = 0;
	unsigned __int64 numPacketsRecv = 0;
	unsigned __int64 numBytesSent = 0;
	unsigned __int64 numBytesRecv = 0;
};

__declspec(align(16) ) struct __declspec(novtable) IBaseDeviceComms
{
	IBaseDeviceComms() // Do not call this directly!
	{
	}

	virtual ~IBaseDeviceComms()
	{
	}

	virtual __declspec(nothrow) HRESULT __stdcall SendLoop(const BYTE* const sendBuffer, const unsigned len) = 0;
	virtual __declspec(nothrow) HRESULT __stdcall RecvLoop(BYTE* const recvBuffer, const unsigned len) = 0;

	__declspec(nothrow) static IBaseDeviceComms* const GetGlobalDeviceComms()
	{
		return globalDeviceComms;
	}

	__declspec(nothrow) const PacketStats& GetCurrentFramePacketStats()
	{
		return packetStatsCurrentFrame;
	}

	__declspec(nothrow) const PacketStats& GetTotalPacketStats()
	{
		return packetStatsTotal;
	}

	__declspec(nothrow) virtual void EndFrame()
	{
		packetStatsTotal.Accumulate(packetStatsCurrentFrame);
		packetStatsCurrentFrame.Reset();

#ifdef _DEBUG
		if (!sentPacketsThisFrame.empty() )
		{
			sentPacketsEver.insert(sentPacketsEver.end(), sentPacketsThisFrame.begin(), sentPacketsThisFrame.end() );
			const unsigned currentSentPacketsBufferSize = sentPacketsEver.size() * sizeof(genericCommand);
			if (currentSentPacketsBufferSize > MAX_SENT_PACKET_BUFFER_EVER_BYTES)
			{
				const unsigned trimBytes = currentSentPacketsBufferSize - MAX_SENT_PACKET_BUFFER_EVER_BYTES;
				const unsigned trimPackets = trimBytes / sizeof(genericCommand);
				if (trimPackets > 0)
				{
					sentPacketsEver.erase(sentPacketsEver.begin(), sentPacketsEver.begin() + trimPackets);
				}
			}
		}
		if (!recvdPacketsThisFrame.empty() )
		{
			recvdPacketsEver.insert(recvdPacketsEver.end(), recvdPacketsThisFrame.begin(), recvdPacketsThisFrame.end() );
			const unsigned currentRecvPacketsBufferSize = recvdPacketsThisFrame.size() * sizeof(genericCommand);
			if (currentRecvPacketsBufferSize > MAX_RECV_PACKET_BUFFER_EVER_BYTES)
			{
				const unsigned trimBytes = currentRecvPacketsBufferSize - MAX_RECV_PACKET_BUFFER_EVER_BYTES;
				const unsigned trimPackets = trimBytes / sizeof(genericCommand);
				if (trimPackets > 0)
				{
					recvdPacketsEver.erase(recvdPacketsEver.begin(), recvdPacketsEver.begin() + trimPackets);
				}
			}
		}
#endif

		sentPacketsThisFrame.clear();
		recvdPacketsThisFrame.clear();
	}

	virtual void IncrementSentPacket(const unsigned packetSizeBytes)
	{
		++packetStatsCurrentFrame.numBytesSent;
		packetStatsCurrentFrame.numBytesSent += packetSizeBytes;
	}

	virtual void IncrementRecvPacket(const unsigned packetSizeBytes)
	{
		++packetStatsCurrentFrame.numBytesRecv;
		packetStatsCurrentFrame.numBytesRecv += packetSizeBytes;
	}

	virtual void StoreSentPacket(const genericCommand& sentPacket)
	{
		sentPacketsThisFrame.push_back(sentPacket);
	}

	virtual void StoreRecvdPacket(const genericCommand& recvdPacket)
	{
		recvdPacketsThisFrame.push_back(recvdPacket);
	}

	virtual bool EndpointSupportsMemReadback() const
	{
		return false;
	}

protected:
	static void SetGlobalDeviceComms(IBaseDeviceComms* const newGlobalDeviceComms)
	{
		globalDeviceComms = newGlobalDeviceComms;
	}

	PacketStats packetStatsTotal;
	PacketStats packetStatsCurrentFrame;
	std::vector<genericCommand> sentPacketsThisFrame;
	std::vector<genericCommand> recvdPacketsThisFrame;

#ifdef _DEBUG
	std::vector<genericCommand> sentPacketsEver;
	std::vector<genericCommand> recvdPacketsEver;
#endif

private:
	static IBaseDeviceComms* globalDeviceComms;
};
