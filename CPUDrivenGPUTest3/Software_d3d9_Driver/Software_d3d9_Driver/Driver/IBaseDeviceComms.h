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

	// Sets device memory from deviceDestAddr to deviceDestAddr + dwByteLength with the DWORD value specified in dwSetVal.
	__declspec(nothrow) HRESULT __stdcall DeviceMemSet(gpuvoid* const deviceDestAddr, const DWORD dwSetVal, const DWORD dwByteLength);

	// Copies a block of memory from host memory to device memory.
	__declspec(nothrow) HRESULT __stdcall DeviceMemCopy(gpuvoid* const deviceDestAddr, const void* const sourceCPUAddr, const DWORD dwByteLength);

	// Copies a block of memory from device memory to host memory.
	__declspec(nothrow) HRESULT __stdcall ReadFromDevice(const gpuvoid* const deviceSrcAddr, void* const destCPUAddr, const DWORD dwByteLength);

	// Validates that the block of memory on the device matches the data in the block of memory on the CPU.
	// Returns S_OK if the memory is equal between the CPU and the GPU pointers or E_FAIL otherwise. It is the caller's responsibility to ensure that the GPU is not writing to this region
	// as we are reading from it.
	__declspec(nothrow) HRESULT __stdcall DeviceValidateMemory(const gpuvoid* const deviceSrcAddr, const void* const compareCPUAddr, const DWORD dwByteLength);

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
			sentPacketsEver.insert(sentPacketsEver.end(), sentPacketsThisFrame.begin(), sentPacketsThisFrame.end() );
		if (!recvdPacketsThisFrame.empty() )
			recvdPacketsEver.insert(recvdPacketsEver.end(), recvdPacketsThisFrame.begin(), recvdPacketsThisFrame.end() );
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
