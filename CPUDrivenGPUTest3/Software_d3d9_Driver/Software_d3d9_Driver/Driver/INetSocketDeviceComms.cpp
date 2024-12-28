#include "INetSocketDeviceComms.h"
#include "PacketDefs.h"
#include "GPUCommandList.h"

INetSocketDeviceComms::INetSocketDeviceComms()
{
	if (FAILED(InternalInitComms() ) )
	{
		__debugbreak(); // Error out if we failed to initialize!
	}

	if (GetGlobalDeviceComms() != NULL)
	{
		// Error: Can only have one device active at a time!
		__debugbreak();
	}
	SetGlobalDeviceComms(this);
}

/*virtual*/ INetSocketDeviceComms::~INetSocketDeviceComms()
{
	if (session)
	{
		session->~NetSession(); // Using placement new means we need to invoke manual destructor

		VirtualFree(session, 0, MEM_RELEASE | MEM_DECOMMIT);
	}

	IBaseDeviceComms::~IBaseDeviceComms();
}

__declspec(nothrow) HRESULT __stdcall INetSocketDeviceComms::InternalInitComms()
{
	if (session != NULL)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot double-init the session!
#endif
		return E_FAIL;
	}

	// Aligned alloc + placement new:
	session = new (VirtualAlloc(NULL, sizeof(NetSession), MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE) ) NetSession();

	return S_OK;
}

/*virtual*/ __declspec(nothrow) HRESULT __stdcall INetSocketDeviceComms::SendLoop(const BYTE* const sendBuffer, const unsigned len) /*override*/
{
	if (!sendBuffer)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Cannot send from an invalid packet pointer!
#endif
		return E_INVALIDARG;
	}

	if (sendBuffer[0] != PACKET_MAGIC_VALUE)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Packet is missing its magic header value! Pointer is not pointing to valid packet data!
#endif
		return E_INVALIDARG;
	}

#ifdef _DEBUG
	if (!session)
	{
		__debugbreak(); // Illegal to call this function if we have not initialized the session first!
	}
#endif

	while (!session->IsSessionConnected() )
	{
		// Wait for a connection to be established before we try to send any packets
		Sleep(1);
	}

	IncrementSentPacket(len);

	const unsigned numSubpackets = len / sizeof(genericCommand);
	if (numSubpackets)
	{
		const genericCommand* const genericPacket = (const genericCommand* const)sendBuffer;
		sentPacketsThisFrame.push_back(*genericPacket);

		if (convertedSubpackets.capacity() < numSubpackets)
		{
			convertedSubpackets.resize(numSubpackets);
		}
		Subpacket* const subpacketBuffer = reinterpret_cast<Subpacket* const>(&convertedSubpackets.front() );
		for (unsigned x = 0; x < numSubpackets; ++x)
		{
			GPUCommandList::ConvertCommandPacketToSimplifiedCommandPacket(genericPacket + x, reinterpret_cast<SimplifiedCommandPacket* const>(subpacketBuffer + x) );
		}
		session->SendBatchSubpackets(numSubpackets, subpacketBuffer);
		convertedSubpackets.clear();
	}

	return S_OK;
}

/*virtual*/ __declspec(nothrow) HRESULT __stdcall INetSocketDeviceComms::RecvLoop(BYTE* const recvBuffer, const unsigned len) /*override*/
{
#ifdef _DEBUG
	if (!session)
	{
		__debugbreak(); // Illegal to call this function if we have not initialized the session first!
	}
#endif

	if (len < sizeof(genericCommand) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return E_INVALIDARG;
	}
	genericCommand* const writeCommand = reinterpret_cast<genericCommand* const>(recvBuffer);

	while (!session->IsSessionConnected() )
	{
		// Wait for a connection to be established before we try to receive any packets
		Sleep(1);
	}

	IncrementRecvPacket(len);

	if (incomingReadSubPackets.empty() )
	{
		while (session->GetReadPacketsD2H(incomingReadSubPackets) == 0)
		{
			session->WaitForReadPacketsAvailable();
		}
	}
	GPUCommandList::ConvertSimplifiedCommandPacketToCommandPacket(reinterpret_cast<const SimplifiedCommandPacket* const>(&incomingReadSubPackets.front() ), writeCommand);
	incomingReadSubPackets.erase(incomingReadSubPackets.begin() );

	recvdPacketsThisFrame.push_back(*writeCommand);

	return S_OK;
}

/*virtual*/ bool INetSocketDeviceComms::EndpointSupportsMemReadback() const /*override*/
{
	return true;
}
