#include "INullDeviceComms.h"
#include <stdio.h>

thread_local INullDeviceComms* currentLocalEndpointContext = NULL;

INullDeviceComms::INullDeviceComms() : IBaseDeviceComms()
{
	SetGlobalDeviceComms(this);
}

void INullDeviceComms::HandlePacket(const genericCommand* const packet)
{
#ifdef _DEBUG
	if (packet == NULL)
	{
		__debugbreak(); // Error: Don't ever pass a null packet pointer to this function!
	}
#endif
	switch (packet->type)
	{
	case command::PT_READMEM:
	{
		const readMemCommand* const readPacket = reinterpret_cast<const readMemCommand* const>(packet);
		readMemResponse response;
		response.readDWORDAddr = readPacket->readDWORDAddr;
		response.value = 0x00000000; // This is the Null device. We can't really read any memory, so just always return 0x00000000!
		localResponsePackets.push_back(*reinterpret_cast<const genericCommand* const>(&response) );
	}
		break;
	case command::PT_WAITFORDEVICEIDLE:
	{
		const waitForDeviceIdleCommand* const waitPacket = reinterpret_cast<const waitForDeviceIdleCommand* const>(packet);
		if (waitPacket->returnCPUValue)
		{
			waitResponse response;
			response.value = waitPacket->returnValueToCPU;
			localResponsePackets.push_back(*reinterpret_cast<const genericCommand* const>(&response) );
		}
	}
		break;
	default:
		// Do nothing
		break;
	}
}

/*virtual */__declspec(nothrow) HRESULT __stdcall INullDeviceComms::SendLoop(const BYTE* const sendBuffer, const unsigned len) /*override*/
{
#ifdef _DEBUG
	if (len == 0)
	{
		__debugbreak(); // Don't call this with a length of 0!
	}
	if (len % sizeof(genericCommand) != 0)
	{
		__debugbreak(); // Error: Expected only packet data to be sent on this channel!
	}
#endif

	unsigned remainingLen = len;
	const genericCommand* currentPacketPtr = reinterpret_cast<const genericCommand* const>(sendBuffer);
	while (remainingLen >= sizeof(genericCommand) )
	{
		HandlePacket(currentPacketPtr);
		remainingLen -= sizeof(genericCommand);
		++currentPacketPtr;
	}

	return S_OK;
}

/*virtual*/ __declspec(nothrow) HRESULT __stdcall INullDeviceComms::RecvLoop(BYTE* const recvBuffer, const unsigned len) /*override*/
{
#ifdef _DEBUG
	if (len == 0)
	{
		__debugbreak(); // Don't call this with a length of 0!
	}
	if (len % sizeof(genericCommand) != 0)
	{
		__debugbreak(); // Error: Expected only packet data to be sent on this channel!
	}
	if (len > localResponsePackets.size() * sizeof(genericCommand) )
	{
		__debugbreak(); // Error: Read data mismatch!
	}
#endif
	if (len <= localResponsePackets.size() * sizeof(genericCommand) )
	{
		memcpy(recvBuffer, &localResponsePackets.front(), len);

		if (localResponsePackets.size() * sizeof(genericCommand) == len)
		{
			localResponsePackets.clear();
		}
		else
		{
			const unsigned numElementsToRemove = len / sizeof(genericCommand);
			localResponsePackets.erase(localResponsePackets.begin(), localResponsePackets.begin() + numElementsToRemove);
		}
	}
	return S_OK;
}

/*virtual*/ bool INullDeviceComms::EndpointSupportsMemReadback() const /*override*/
{
	return false;
}
