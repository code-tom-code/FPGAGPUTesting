#pragma once

#include "PacketTypes.h"
#include "PacketDefs.h"
#include "GPUAllocator.h"
#include "IBaseDeviceComms.h"
#include <vector>
#include <deque>

enum ReturnPacketType : unsigned char
{
	RPT_WaitForIdleReturn = 0,
	RPT_ReadMemReturn
};

struct ReadReturn
{
	const gpuvoid* readAddress;
	DWORD returnData;
};

struct RegisteredReturnPacket
{
	ReturnPacketType packetType;
	union
	{
		DWORD waitIdentifier;
		const gpuvoid* readAddress;
	} ReturnIdentifierData;
};

// This class is not protected by a critical section. You may *not* call its functions from multiple different threads simultaneously or else its internal state will become corrupted!
struct GPUReturnTracker
{
	// Registers an expected read for a new idle-return
	void RegisterNewWaitForIdleReturn(const waitForDeviceIdleCommand* const newWaitPacket);

	// Registers an expected read for a new readmem-return
	void RegisterNewReadReturn(const readMemCommand* const newReadPacket);

	// Returns true if the passed-in new return-packet is a wait-return or a read-return that ends up being queued, or false if it's any other packet
	bool HandleIncomingReturnPacket(const genericCommand* const newRetPacket);

	// Returns true if a wait-return with the given identifier is found to have already been returned, or false if we haven't yet received a wait-return for this identifier.
	bool AsyncTryGetWaitReturn(const DWORD waitIdentifier, const bool peekNoRemove = false);
	
	// Forces a synchronous wait until the specified wait-return identifier is received. This function does not return until we have received the specified return packet.
	void SyncGetWaitReturn(const DWORD waitIdentifier, IBaseDeviceComms* const readComms);

	// Returns true if a readmem-return with the given read address is found to have already been returned, or false if we haven't yet received a readmem-return for this identifier.
	bool AsyncTryGetReadReturn(const gpuvoid* const readAddress, DWORD* const readReturnData, const bool peekNoRemove = false);

	// Forces a synchronous wait until the readmem-return completes. This function does not return until we have received the read memory back.
	void SyncGetReadReturn(const gpuvoid* const readAddress, DWORD* const readReturnData, IBaseDeviceComms* const readComms);

private:
	// The earliest in time return is at the beginning of the dequeue, the most recent in time return is at the end of the dequeue
	std::deque<RegisteredReturnPacket> registeredReturns;

	// Completed wait-returns and read-returns live in these two queues here:
	std::vector<DWORD> waitReturns;
	std::vector<ReadReturn> readReturns;
};

GPUReturnTracker& GetReturnTrackerSingleton();
