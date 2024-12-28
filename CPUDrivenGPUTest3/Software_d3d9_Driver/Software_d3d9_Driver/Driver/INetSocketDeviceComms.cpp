#include "INetSocketDeviceComms.h"
#include "PacketDefs.h"
#include <stdio.h>

#pragma comment(lib, "ws2_32.lib")

INetSocketDeviceComms::INetSocketDeviceComms()
{
	__debugbreak(); // Net socket device comms is not yet implemented!

	if (GetGlobalDeviceComms() != NULL)
	{
		// Error: Can only have one device active at a time!
		__debugbreak();
	}
	SetGlobalDeviceComms(this);
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

	IncrementSentPacket(len);

	if (len >= sizeof(genericCommand) )
	{
		const genericCommand* const genericPacket = (const genericCommand* const)sendBuffer;
		sentPacketsThisFrame.push_back(*genericPacket);
	}

	const BYTE* buffer = (const BYTE* const)sendBuffer;
	unsigned remainingSize = len;
	while (remainingSize > 0)
	{
		DWORD numBytesWritten = 0;
		const int sendRet = sendto(connectedSocket, (const char* const)buffer, remainingSize, 0, (const sockaddr* const)&deviceAddr, sizeof(deviceAddr) );
		if (sendRet >= 0)
		{
			numBytesWritten = sendRet;
			remainingSize -= numBytesWritten;
			buffer += numBytesWritten;
		}
		else
		{
			printf("Error in sendto(). GLE: %i\n", WSAGetLastError() );
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_FAIL;
		}
	}

#ifdef PRINT_PACKET_CONTENTS
	printf("Send %u bytes: [", startingSize);
	for (unsigned x = 0; x < startingSize; ++x)
	{
		const unsigned char byteVal = ( (const BYTE* const)sendBuffer)[x];
		printf("%02X", byteVal);
	}
	printf("]\n");
#endif // #ifdef PRINT_PACKET_CONTENTS
	return S_OK;
}

/*virtual*/ __declspec(nothrow) HRESULT __stdcall INetSocketDeviceComms::RecvLoop(BYTE* const recvBuffer, const unsigned len) /*override*/
{
	IncrementRecvPacket(len);

	BYTE* buffer = (BYTE* const)recvBuffer;
	unsigned remainingSize = len;
	while (remainingSize > 0)
	{
		SOCKADDR_IN fromAddr = {0};
		int fromLen = sizeof(fromAddr);
		const int recvRet = recvfrom(connectedSocket, (char* const)buffer, remainingSize, 0, (sockaddr* const)&fromAddr, &fromLen);
		if (recvRet > 0)
		{
			remainingSize -= recvRet;
			buffer += recvRet;
		}
		else if (recvRet == 0)
		{
			printf("Error: Socket has been closed from the other side!\n");
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_FAIL;
		}
		else
		{
			printf("Socket error in recvfrom(). GLE: %i\n", WSAGetLastError() );
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_FAIL;
		}
	}

	if (len >= sizeof(genericCommand) )
	{
		const genericCommand* const genericPacket = (const genericCommand* const)recvBuffer;
		recvdPacketsThisFrame.push_back(*genericPacket);
	}

	return S_OK;
}
