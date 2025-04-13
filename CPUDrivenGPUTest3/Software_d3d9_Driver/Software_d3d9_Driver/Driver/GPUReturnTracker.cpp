#include "GPUReturnTracker.h"

// Registers an expected read for a new idle-return
void GPUReturnTracker::RegisterNewWaitForIdleReturn(const waitForDeviceIdleCommand* const newWaitPacket)
{
	if (newWaitPacket->returnCPUValue)
	{
		RegisteredReturnPacket newExpectedWaitReturn;
		newExpectedWaitReturn.packetType = RPT_WaitForIdleReturn;
		newExpectedWaitReturn.ReturnIdentifierData.waitIdentifier = newWaitPacket->returnValueToCPU;
		registeredReturns.push_back(newExpectedWaitReturn);

#ifdef _DEBUG
		const unsigned numWaitReturns = waitReturns.size();
		for (unsigned x = 0; x < numWaitReturns; ++x)
		{
			const DWORD thisWaitReturn = waitReturns[x];
			if (thisWaitReturn == newWaitPacket->returnValueToCPU)
			{
				__debugbreak(); // Error: Must read previous completed wait first before issuing a new one with the same return identifier!
			}
		}
#endif
	}
}

// Registers an expected read for a new readmem-return
void GPUReturnTracker::RegisterNewReadReturn(const readMemCommand* const newReadPacket)
{
	RegisteredReturnPacket newExpectedReadReturn;
	newExpectedReadReturn.packetType = RPT_ReadMemReturn;
	const DWORD readDwordAddress = newReadPacket->readDWORDAddr + newReadPacket->dwordSelect * sizeof(DWORD);
	newExpectedReadReturn.ReturnIdentifierData.readAddress = (const gpuvoid* const)(readDwordAddress);
	registeredReturns.push_back(newExpectedReadReturn);

#ifdef _DEBUG
	const unsigned numReadReturns = readReturns.size();
	for (unsigned x = 0; x < numReadReturns; ++x)
	{
		const ReadReturn& thisReadReturn = readReturns[x];
		if (thisReadReturn.readAddress == (const gpuvoid* const)(readDwordAddress) )
		{
			__debugbreak(); // Error: Must read previous completed read first before issuing a new one with the same return identifier!
		}
	}
#endif
}

// Returns true if the passed-in new return-packet is a wait-return or a read-return that ends up being queued, or false if it's any other packet
bool GPUReturnTracker::HandleIncomingReturnPacket(const genericCommand* const newRetPacket)
{
	switch (newRetPacket->type)
	{
	default:
		// Do nothing if we receive another packet-type
		return false;
	case command::PT_WAITRESPONSE: // Intentional fall-through
	case command::PT_READMEMRESPONSE:
#ifdef _DEBUG
		if (registeredReturns.empty() )
		{
			__debugbreak(); // Error: Forgot to register for this return before it arrived, or perhaps the command processor is erroneously producing duplicate return packets!
			return false;
		}

		const RegisteredReturnPacket& frontExpectedReturn = registeredReturns.front();

		// Check for mismatched register types versus packet types:
		if (frontExpectedReturn.packetType == RPT_WaitForIdleReturn && newRetPacket->type != command::PT_WAITRESPONSE)
		{
			__debugbreak();
		}
		if (frontExpectedReturn.packetType == RPT_ReadMemReturn && newRetPacket->type != command::PT_READMEMRESPONSE)
		{
			__debugbreak();
		}
#endif
		break;
	}

	const RegisteredReturnPacket& frontExpectedReturn = registeredReturns.front();

	switch (newRetPacket->type)
	{
	case command::PT_WAITRESPONSE:
	{
		const waitResponse* const waitRetPacket = reinterpret_cast<const waitResponse* const>(newRetPacket);
#ifdef _DEBUG
		if (waitRetPacket->value != frontExpectedReturn.ReturnIdentifierData.waitIdentifier)
		{
			__debugbreak(); // Error: Identifier mismatch!
		}
#endif
		registeredReturns.erase(registeredReturns.begin() );
		waitReturns.push_back(waitRetPacket->value);
	}
		break;
	case command::PT_READMEMRESPONSE:
	{
		const readMemResponse* const readRetPacket = reinterpret_cast<const readMemResponse* const>(newRetPacket);
#ifdef _DEBUG
		if ( (const gpuvoid* const)(readRetPacket->readDWORDAddr) != frontExpectedReturn.ReturnIdentifierData.readAddress)
		{
			__debugbreak(); // Error: Identifier mismatch!
		}
#endif
		registeredReturns.erase(registeredReturns.begin() );
		ReadReturn newReadRet;
		newReadRet.readAddress = (const gpuvoid* const)(readRetPacket->readDWORDAddr);
		newReadRet.returnData = readRetPacket->value;
		readReturns.push_back(newReadRet);
	}
		break;
	default:
#ifdef _DEBUG
		__debugbreak(); // Should never be here!
		return false;
#else
		__assume(0);
#endif
	}

	return true;
}

// Returns true if a wait-return with the given identifier is found to have already been returned, or false if we haven't yet received a wait-return for this identifier.
bool GPUReturnTracker::AsyncTryGetWaitReturn(const DWORD waitIdentifier, const bool peekNoRemove /*= false*/)
{
	const unsigned numWaitReturned = waitReturns.size();
	for (unsigned x = 0; x < numWaitReturned; ++x)
	{
		const DWORD thisWaitReturn = waitReturns[x];
		if (thisWaitReturn == waitIdentifier)
		{
			if (!peekNoRemove)
			{
				waitReturns.erase(waitReturns.begin() + x);
			}
			return true;
		}
	}
	return false;
}
	
// Forces a synchronous wait until the specified wait-return identifier is received. This function does not return until we have received the specified return packet.
void GPUReturnTracker::SyncGetWaitReturn(const DWORD waitIdentifier, IBaseDeviceComms* const readComms)
{
	// Spin on the read until we receive our expected wait-response:
	while (true)
	{
		genericCommand recvPacket;
		recvPacket.type = command::PT_DONOTHING;
		if (FAILED(readComms->RecvLoop( (BYTE* const)&recvPacket, sizeof(recvPacket) ) ) )
		{
#ifdef _DEBUG
			__debugbreak(); // Should never fail!
#endif
		}
		if (HandleIncomingReturnPacket(&recvPacket) )
		{
			if (AsyncTryGetWaitReturn(waitIdentifier) )
			{
				return;
			}
		}
	}
}

// Returns true if a readmem-return with the given read address is found to have already been returned, or false if we haven't yet received a readmem-return for this identifier.
bool GPUReturnTracker::AsyncTryGetReadReturn(const gpuvoid* const readAddress, DWORD* const readReturnData, const bool peekNoRemove /*= false*/)
{
	const unsigned numReadReturned = readReturns.size();
	for (unsigned x = 0; x < numReadReturned; ++x)
	{
		const ReadReturn& thisReadReturn = readReturns[x];
		if (thisReadReturn.readAddress == readAddress)
		{
			if (readReturnData)
			{
				*readReturnData = thisReadReturn.returnData;
			}
			if (!peekNoRemove)
			{
				readReturns.erase(readReturns.begin() + x);
			}
			return true;
		}
	}
	return false;
}

// Forces a synchronous wait until the readmem-return completes. This function does not return until we have received the read memory back.
void GPUReturnTracker::SyncGetReadReturn(const gpuvoid* const readAddress, DWORD* const readReturnData, IBaseDeviceComms* const readComms)
{
	// Spin on the read until we receive our expected read-response:
	while (true)
	{
		genericCommand recvPacket;
		recvPacket.type = command::PT_DONOTHING;
		if (FAILED(readComms->RecvLoop( (BYTE* const)&recvPacket, sizeof(recvPacket) ) ) )
		{
#ifdef _DEBUG
			__debugbreak(); // Should never fail!
#endif
		}
		if (HandleIncomingReturnPacket(&recvPacket) )
		{
			if (AsyncTryGetReadReturn(readAddress, readReturnData) )
			{
				return;
			}
		}
	}
}

static GPUReturnTracker gReturnTracker;
GPUReturnTracker& GetReturnTrackerSingleton()
{
	return gReturnTracker;
}
