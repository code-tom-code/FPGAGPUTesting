#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <WinSock2.h>
#include <stdio.h>

#pragma comment(lib, "ws2_32.lib")

static const char* const deviceName = "\\\\.\\COM3";

static const char PACKET_MAGIC_VALUE = 'C';

#pragma pack(push) // Start pragma pack 1 region
#pragma pack(1)

struct DRAM_ROW
{
	union
	{
		BYTE bytes[32];
		USHORT shorts[16];
		DWORD dwords[8];
		float floats[8];
		unsigned __int64 qwords[4];
		double doubles[4];
	};
};
static_assert(sizeof(DRAM_ROW) * 8 == 256, "Error: Unexpected struct size!");

struct command
{
	enum packetType : unsigned char
	{
		PT_DONOTHING = 0,
		PT_WRITEMEM = 1,
		PT_READMEM = 2,
		PT_READMEMRESPONSE = 3,

		PT_MAX_PACKET_TYPES // This must always be last
	};

	command()
	{
	}

	command(const packetType thisPacketType) : type(thisPacketType)
	{
	}

	static const bool IsValidPacket(const command* const packet, const unsigned packetSize)
	{
		if (!packet)
			return false;

		if (packetSize < sizeof(command) )
			return false;

		if (packet->magicProtoHeader != PACKET_MAGIC_VALUE)
			return false;

		if (packet->checksum != ComputeChecksum(packet, packetSize) )
			return false;

		if (packet->type >= PT_MAX_PACKET_TYPES)
			return false;

		return true;
	}

	static const unsigned char ComputeChecksum(const command* const packet, const unsigned packetSize)
	{
		unsigned char localChecksum = 0;
		const BYTE* const packetBytes = (const BYTE* const)packet;
		for (unsigned x = 0; x < packetSize; ++x)
		{
			if ( (packetBytes + x) != &(packet->checksum) ) // Skip the checksum byte, as it's supposed to be set to zero
				localChecksum += packetBytes[x];
		}
		return localChecksum;
	}

	void SetComputeChecksum(command* const packet, const unsigned packetSize)
	{
		packet->checksum = 0; // The checksum is computed as the sum of all bytes of the packet as if the checksum byte is set to zero, which it actually is here
		packet->checksum = ComputeChecksum(packet, packetSize);
	}

	template <typename T>
	void SetComputeChecksum(T* const packet)
	{
		SetComputeChecksum(packet, sizeof(T) );
	}

	unsigned char magicProtoHeader = PACKET_MAGIC_VALUE; // Packets may be freely discarded if the magic header does not match!
	unsigned char checksum = 0; // To be computed at send-time. Packets may be freely discarded if checksumming is enabled and the checksum does not match!
	packetType type = PT_DONOTHING; // Packets may be freely discarded if the packet type is unrecognized or out of range.
};

struct doNothingCommand : command
{
	doNothingCommand() : command(PT_DONOTHING)
	{
	}

	DWORD padding0 = 1; // Not used
	DWORD padding1 = 2; // Not used
};

struct writeMemCommand : command
{
	writeMemCommand() : command(PT_WRITEMEM)
	{
	}

	DWORD writeDWORDAddr = 0x00000000; // The write address, in DWORD's from the start of the BRAM
	DWORD writeVal = 0; // The value to write into the DWORD
};

struct readMemCommand : command
{
	readMemCommand() : command(PT_READMEM)
	{
	}

	DWORD readDWORDAddr = 0x00000000; // The read address, in DWORD's from the start of the BRAM
	DWORD byteSelect = 0; // Unused
};

struct readMemResponse : command
{
	readMemResponse() : command(PT_READMEMRESPONSE)
	{
	}

	DWORD readDWORDAddr = 0x00000000; // The read address, in DWORD's from the start of the BRAM
	DWORD value = 0; // The value that was read
};

static_assert(sizeof(doNothingCommand) == sizeof(writeMemCommand) && 
	sizeof(doNothingCommand) == sizeof(readMemCommand) &&
	sizeof(doNothingCommand) == sizeof(readMemResponse) &&
	sizeof(doNothingCommand) == 11, "Error: Unexpected struct size!");

#pragma pack(pop) // End pragma pack 1 region

void SendLoop(HANDLE hComm, const void* const sendBuffer, unsigned size)
{
	const BYTE* buffer = (const BYTE* const)sendBuffer;
	const unsigned startingSize = size;
	while (size > 0)
	{
		DWORD numBytesWritten = 0;
		if (!WriteFile(hComm, buffer, 1, &numBytesWritten, NULL) )
		{
			printf("Error in WriteFile. numBytesWritten: %u GLE: %u\n", numBytesWritten, GetLastError() );
		}
		size -= numBytesWritten;
		buffer += numBytesWritten;
	}

	printf("Send %u bytes: [", startingSize);
	for (unsigned x = 0; x < startingSize; ++x)
	{
		const unsigned char byteVal = ( (const BYTE* const)sendBuffer)[x];
		printf("%02X", byteVal);
	}
	printf("]\n");
}

int main()
{
	HANDLE hComm = CreateFileA(deviceName, GENERIC_READ | GENERIC_WRITE, 0, NULL, OPEN_EXISTING, 0, NULL);
	if (hComm == INVALID_HANDLE_VALUE)
	{
		printf("Cannot open file: \"%s\"\n", deviceName);
		return 1;
	}

	DCB dcb = {0};
	dcb.DCBlength = sizeof(dcb);

	if (!GetCommState(hComm, &dcb) )
	{
		printf("Error in GetCommState()! GLE: %u\n", GetLastError() );
		return 1;
	}

	dcb.BaudRate = 921600;
	dcb.XonLim = 32768;
	dcb.XoffLim = 8192;
	dcb.ByteSize = 8;
	dcb.Parity = ODDPARITY;
	dcb.StopBits = ONESTOPBIT;
	dcb.XonChar = 17;
	dcb.XoffChar = 19;
	dcb.ErrorChar = 0;
	dcb.EofChar = 0;
	dcb.EvtChar = 0;
	dcb.fBinary = TRUE;
	dcb.fParity = TRUE;

	if (!SetCommState(hComm, &dcb) )
	{
		printf("Error in SetCommState()! GLE: %u\n", GetLastError() );
		return 1;
	}

	COMMTIMEOUTS ctos = {0};
	ctos.ReadIntervalTimeout = MAXDWORD;
	ctos.ReadTotalTimeoutMultiplier = MAXDWORD;
	ctos.ReadTotalTimeoutConstant = 1;
	if (!SetCommTimeouts(hComm, &ctos) )
	{
		printf("Error in SetCommTimeouts()! GLE: %u\n", GetLastError() );
		return 1;
	}

	printf("Comm port opening + config success! Starting transmission...\n");

	Sleep(64);

	const char* writeString = "The quick brown fox\tjumped\\over the lazy dog.\0\0";
	unsigned numBytesRecvd = 0;
	char partialPacketBuffer[256] = {0};
	unsigned partialPacketBufferSize = 0;

	for (unsigned x = 0; x < 256; ++x)
	{
		writeMemCommand newWriteMemPacket;
		newWriteMemPacket.writeDWORDAddr = x * sizeof(DRAM_ROW) + 0x20000000;
		//const unsigned char byteVal = 0xFF - x;
		newWriteMemPacket.writeVal = newWriteMemPacket.writeDWORDAddr;//(byteVal << 24) | (byteVal << 16) | (byteVal << 8) | byteVal;
		newWriteMemPacket.SetComputeChecksum(&newWriteMemPacket);
		SendLoop(hComm, &newWriteMemPacket, sizeof(newWriteMemPacket) );
	}

	unsigned testAddress = 0x00000000;
	while (1)
	{
		char inBuf[64] = {0};
		DWORD numBytesRead = 0;
		if (!ReadFile(hComm, inBuf, sizeof(inBuf) - 1, &numBytesRead, NULL) )
		{
			printf("Error in ReadFile. numBytesRead: %u GLE: %u\n", numBytesRead, GetLastError() );
		}
		numBytesRecvd += numBytesRead;
		memcpy(partialPacketBuffer + partialPacketBufferSize, inBuf, numBytesRead);
		partialPacketBufferSize += numBytesRead;
		printf("Recv %u bytes: [", numBytesRead);
		for (unsigned x = 0; x < numBytesRead; ++x)
		{
			const unsigned char uChar = (const unsigned char)(inBuf[x]);
			printf("%02X", uChar);
		}
		printf("]\n");

		for (unsigned x = 0; x < partialPacketBufferSize;)
		{
			const command* const thisPotentialPacket = (const command* const)(partialPacketBuffer + x);
			if (partialPacketBufferSize >= sizeof(doNothingCommand) && command::IsValidPacket(thisPotentialPacket, sizeof(doNothingCommand) ) )
			{
				printf("Valid packet received! Type: %u", thisPotentialPacket->type);
				switch (thisPotentialPacket->type)
				{
				default:
					printf(" Unknown packet handler!\n");
					break;
				case command::PT_READMEMRESPONSE:
				{
					const readMemResponse* const memResponsePacket = (const readMemResponse* const)thisPotentialPacket;
					printf(" Mem response. Value at 0x%08X is 0x%08X\n", memResponsePacket->readDWORDAddr, memResponsePacket->value);
					testAddress += sizeof(DRAM_ROW);
					break;
				}
				}
				memmove(partialPacketBuffer, partialPacketBuffer + sizeof(doNothingCommand), partialPacketBufferSize - x);
				partialPacketBufferSize -= sizeof(doNothingCommand);
				x += sizeof(doNothingCommand);
			}
			else
				++x;
		}

		while (partialPacketBufferSize > 127)
		{
			// Super inefficient, but this is just for testing anyway

			// Slide down the whole buffer by one byte:
			memmove(partialPacketBuffer, partialPacketBuffer + 1, partialPacketBufferSize);
			--partialPacketBufferSize;
		}

		//Sleep(64);
		DWORD numBytesWritten = 0;

		/*writeMemCommand newWriteMemPacket;
		newWriteMemPacket.writeDWORDAddr = 0x00;
		newWriteMemPacket.writeVal = 7;
		newWriteMemPacket.SetComputeChecksum(&newWriteMemPacket);
		SendLoop(hComm, &newWriteMemPacket, sizeof(newWriteMemPacket) );*/

		readMemCommand newReadMemPacket;
		newReadMemPacket.readDWORDAddr = testAddress + 0x20000000;
		newReadMemPacket.byteSelect = 0x00000000;
		newReadMemPacket.SetComputeChecksum(&newReadMemPacket);
		//doNothingCommand newDoNothingPacket;
		SendLoop(hComm, &newReadMemPacket, sizeof(newReadMemPacket) );

		if (numBytesRecvd > 969)
			break;
	}

	CloseHandle(hComm);

	printf("Program done!\n");
	return 0;
}
