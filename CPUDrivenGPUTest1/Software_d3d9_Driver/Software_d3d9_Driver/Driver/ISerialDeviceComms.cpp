#include "ISerialDeviceComms.h"
#include "PacketDefs.h"
#include <stdio.h>

ISerialDeviceComms::ISerialDeviceComms(const char* const localCOMPortName /*= "COM3"*/, const unsigned baudRate /*= 921600*/, const BYTE parityType /*= ODDPARITY*/) : IBaseDeviceComms()
{
	connectedCOMPort = localCOMPortName;
	connectedBaudRate = baudRate;
	connectedParity = parityType;

	if (FAILED(InternalInitComms() ) )
	{
		// Failed to connect to comms!
		__debugbreak();
	}

	if (GetGlobalDeviceComms() != NULL)
	{
		// Error: Can only have one device active at a time!
		__debugbreak();
	}
	SetGlobalDeviceComms(this);
}

__declspec(nothrow) HRESULT __stdcall ISerialDeviceComms::InternalInitComms()
{
	char comPortFilenameBuffer[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(comPortFilenameBuffer, "\\\\.\\%s", connectedCOMPort);
#pragma warning(pop)
	HANDLE hComm = CreateFileA(comPortFilenameBuffer, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
	if (hComm == INVALID_HANDLE_VALUE)
	{
		printf("Cannot open file: \"%s\". GLE: %u\n", comPortFilenameBuffer, GetLastError() );
		return E_FAIL;
	}

	DCB dcb = {0};
	dcb.DCBlength = sizeof(dcb);

	if (!GetCommState(hComm, &dcb) )
	{
		printf("Error in GetCommState()! GLE: %u\n", GetLastError() );
		return E_FAIL;
	}

	dcb.BaudRate = connectedBaudRate;
	dcb.XonLim = 32768;
	dcb.XoffLim = 8192;
	dcb.ByteSize = 8; // We only support 8-byte characters!
	if (connectedParity != NOPARITY)
	{
		dcb.Parity = connectedParity;
		dcb.fParity = TRUE;
	}
	else
	{
		dcb.Parity = NOPARITY;
		dcb.fParity = FALSE;
	}
	dcb.StopBits = ONESTOPBIT;
	dcb.XonChar = 17;
	dcb.XoffChar = 19;
	dcb.ErrorChar = 0;
	dcb.EofChar = 0;
	dcb.EvtChar = 0;
	dcb.fBinary = TRUE;

	if (!SetCommState(hComm, &dcb) )
	{
		printf("Error in SetCommState()! GLE: %u\n", GetLastError() );
		return E_FAIL;
	}

	COMMTIMEOUTS ctos = {0};
	ctos.ReadIntervalTimeout = MAXDWORD;
	ctos.ReadTotalTimeoutMultiplier = MAXDWORD;
	ctos.ReadTotalTimeoutConstant = 1;
	if (!SetCommTimeouts(hComm, &ctos) )
	{
		printf("Error in SetCommTimeouts()! GLE: %u\n", GetLastError() );
		return E_FAIL;
	}

	// Save our now fully set up handle
	hSerialComm = hComm;

	// Give the device a little time to recognize that it is now connected
	Sleep(64);

	return S_OK;
}

/*virtual*/ __declspec(nothrow) HRESULT __stdcall ISerialDeviceComms::SendLoop(const BYTE* const sendBuffer, const unsigned len) /*override*/
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

	const BYTE* buffer = (const BYTE* const)sendBuffer;
	unsigned remainingSize = len;
	while (remainingSize > 0)
	{
		DWORD numBytesWritten = 0;
		if (!WriteFile(hSerialComm, buffer, 1, &numBytesWritten, NULL) )
		{
			printf("Error in WriteFile. numBytesWritten: %u GLE: %u\n", numBytesWritten, GetLastError() );
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_FAIL;
		}
		remainingSize -= numBytesWritten;
		buffer += numBytesWritten;
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

/*virtual*/ __declspec(nothrow) HRESULT __stdcall ISerialDeviceComms::RecvLoop(BYTE* const recvBuffer, const unsigned len) /*override*/
{
	BYTE* buffer = (BYTE* const)recvBuffer;
	unsigned remainingSize = len;
	while (remainingSize > 0)
	{
		DWORD numBytesRead = 0;
		if (!ReadFile(hSerialComm, buffer, 1, &numBytesRead, NULL) )
		{
			printf("Error reading from COM port! GLE: %u\n", GetLastError() );
#ifdef _DEBUG
			__debugbreak();
#endif
			return E_FAIL;
		}
		remainingSize -= numBytesRead;
		buffer += numBytesRead;
	}

	return S_OK;
}
