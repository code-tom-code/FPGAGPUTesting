#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include <WinSock2.h>
#include <vector>

#pragma comment(lib, "ws2_32.lib")

// Not sure if these should be 0x55/0xD5 or if they should be 0xAA/0xAB. Wikipedia seems to think that they should be 0x55/0xD5, but I'm not sure.
static const unsigned char PREAMBLE_BYTE = 0x55;
static const unsigned char SFD_BYTE = 0xD5;
static const unsigned char PADDING_BYTE = 0x00;

enum EthMDIOStateType : unsigned char
{
	initState = 0, // 0
	waitForNewRequestState, // 1
	sendPreambleState, // 2
	sendStartFieldState, // 3
	sendOpcodeState, // 4
	sendPHYAddrState, // 5
	sendRegAddrState, // 6
	sendTurnAroundState, // 7
	sendDataState, // 8
	recvDataState, // 9
	finishPacketState // 10
};

#pragma pack(push)
#pragma pack(1)
enum EtherType : unsigned short
{
	ET_IPv4 = 0x0800,
	ET_ARP = 0x0806,
	ET_WakeOnLAN = 0x0842,
	ET_VLANTagged = 0x8100,
	ET_IPv6 = 0x86DD
};

struct MACAddress
{
	unsigned char macBytes[6];
};
static_assert(sizeof(MACAddress) == 6, "Error: Unexpected struct padding!");

struct EthernetHeader
{
	MACAddress destinationMACAddr;
	MACAddress sourceMACAddr;
	EtherType etherType; // Remember to swap the endianness on this (htons or ntohs)
	unsigned char packetData[1];

	void ConvertEndiannessFromNet()
	{
		etherType = (const EtherType)ntohs(etherType);
	}

	// This is the CRC32 algorithm used for computing the FCS value that lies after the packetData
	unsigned long crc32iso_hdlc(unsigned long crc, const unsigned char* const mem, size_t len)
	{
		if (mem == NULL)
			return 0;
		const unsigned char* data = mem;
		crc = ~crc;
		while (len--)
		{
			crc ^= *data++;
			for (unsigned char k = 0; k < 8; ++k)
			{
				crc = (crc & 1) ? ( (crc >> 1) ^ 0xedb88320) : (crc >> 1);
			}
		}
		return ~crc;
	}

	const bool ValidateEtherType() const
	{
		return etherType == ET_IPv4;
	}

	const bool ValidateDestAddr() const
	{
		return destinationMACAddr.macBytes[0] == 0x44 &&
			destinationMACAddr.macBytes[1] == 0xA8 &&
			destinationMACAddr.macBytes[2] == 0x42 &&
			destinationMACAddr.macBytes[3] == 0xFC &&
			destinationMACAddr.macBytes[4] == 0x3C &&
			destinationMACAddr.macBytes[5] == 0x93;
	}

	const bool ValidateSrcAddr() const
	{
		return sourceMACAddr.macBytes[0] == 0x00 &&
			sourceMACAddr.macBytes[1] == 0x0A &&
			sourceMACAddr.macBytes[2] == 0x35 &&
			sourceMACAddr.macBytes[3] == 0x03 &&
			sourceMACAddr.macBytes[4] == 0x78 &&
			sourceMACAddr.macBytes[5] == 0xF1;
	}

	const bool ValidateEthernetHeader() const
	{
		return ValidateEtherType() && ValidateDestAddr() && ValidateSrcAddr();
	}
};
static_assert(sizeof(EthernetHeader) - 1 == 14, "Error: Unexpected struct packing!");

struct EthernetFrame
{
	unsigned char preambleBytes[7];
	unsigned char SFDByte;
	EthernetHeader ethHeader;

	const bool ValidatePreamble() const
	{
		for (unsigned x = 0; x < ARRAYSIZE(preambleBytes); ++x)
		{
			if (preambleBytes[x] != PREAMBLE_BYTE)
				return false;
		}
		return true;
	}

	const bool ValidateSFDByte() const
	{
		return SFDByte == SFD_BYTE;
	}

	const bool ValidateEthernetStartFrame() const
	{
		return ValidatePreamble() && ValidateSFDByte();
	}
};

struct IPv4Header
{
	unsigned char version : 4; // This should always contain the value "4" for IPv4
	unsigned char IHL : 4; // Determines the number of 32-bit DWORD's in the IPv4 header (default and minimum is "5" = 5 DWORDs = 20 bytes)
	unsigned char DSCP : 6;
	unsigned char ECN : 2;
	unsigned short totalLength; // The total packet length including the IPv4 header and its contained data, in bytes. The minimum size is 20 bytes for the smallest allowed IPv4 header size
	unsigned short packetID; // Used for fragmentation and packet deduplication purposes. Starts at 0 and counts monotonically upwards from there.
	unsigned short ipFlag_reserved0 : 1; // Reserved, must always be set to 0!
	unsigned short ipFlag_dontFragment : 1;
	unsigned short ipFlag_moreFragments : 1;
	unsigned short fragmentOffset : 13; // For packets that don't support fragmentation, this can always be set to 0. This is counted in QWORD's (number of 8-byte offset blocks).
	signed char TTL; // Time to live counts down with each router hop and when it reaches 0, the packet may be discarded. It's used for preventing infinite packet loops.
	unsigned char protocolID; // Which IP protocol this is. Commonly used entries include IPPROTO_TCP and IPPROTO_UDP.
	mutable unsigned short headerChecksum; // A checksum over the IPv4 header.
	unsigned sourceIPv4Addr;
	unsigned destIPv4Addr;
	unsigned char packetData[1];

	void ConvertEndiannessFromNet()
	{
		totalLength = ntohs(totalLength);
		packetID = ntohs(packetID);
		headerChecksum = ntohs(headerChecksum);
		sourceIPv4Addr = ntohl(sourceIPv4Addr);
		destIPv4Addr = ntohl(destIPv4Addr);
	}

	const unsigned short CalculateTotalLength(const unsigned short packetPayloadDataLen) const
	{
		return (sizeof(IPv4Header) - 1) + packetPayloadDataLen;
	}

	// This function assumes that totalLength has already been calculated
	const unsigned short CalculateChecksum() const
	{
		const unsigned short saveOldChecksum = headerChecksum;
		headerChecksum = 0x0000; // We need this to be zeroed for performing our checksum calculation

		unsigned sum = 0;
		unsigned len = totalLength;
		const unsigned short* dataPtr = (const unsigned short* const)this;

		while (len > 1)
		{
			sum += *dataPtr;
			++dataPtr;
			len -= sizeof(unsigned short);
		}

		// Handle the case of odd-length packets:
		if (len != 0)
		{
			sum += *(const unsigned char* const)dataPtr;
		}

		while ( (sum >> 16) > 0)
		{
			sum = (sum & 0xFFFF) + (sum >> 16);
		}

		// Restore our original checksum when we're done
		headerChecksum = saveOldChecksum;

		return (const unsigned short)(~sum); // Finally, apply one's compliment to the result
	};
};
static_assert(sizeof(IPv4Header) - 1 == 20, "Error: Unexpected struct packing!");

struct UDPHeader
{
	unsigned short sourcePort;
	unsigned short destPort;
	unsigned short totalLength; // The total packet length including the UDP header and its contained data, in bytes. The minimum size is 8 bytes for a packet with just a header and no data.
	unsigned short UDPChecksum; // The TCP and UDP checksums are the exact same algorithm as the IPv4 checksum algorithm, except they also include an IPv4 pseudoheader in their checksum calculation.
	unsigned char packetData[1];

	void ConvertEndiannessFromNet()
	{
		sourcePort = ntohs(sourcePort);
		destPort = ntohs(destPort);
		totalLength = ntohs(totalLength);
		UDPChecksum = ntohs(UDPChecksum);
	}
};
static_assert(sizeof(UDPHeader) - 1 == 8, "Error: Unexpected struct packing!");

union SMI_Packet_U
{
	unsigned u32;

	enum SMI_START_TYPE : unsigned
	{
		SMI_START_CLAUSE_45 = 0x0, // '00' selects a Clause 45 (new-style) packet
		SMI_START_CLAUSE_22 = 0x1, // '01' selects a Clause 22 (old-style) packet
		SMI_START_INVALID2 = 0x2, // '10' is an invalid start op
		SMI_START_INVALID3 = 0x3 // '11' is an invalid start op
	};

	enum SMI_OP_TYPE : unsigned
	{
		SMI_OP_CLAUSE_45_OP_SETREG = 0x0, // '00' means to set the register address in the payload
		SMI_OP_CLAUSE_45_OP_WRITEREG = 0x1, // '01' means to write using the register previously set with the '00' SETREG op
		SMI_OP_CLAUSE_45_OP_READANDINCREMENTREG = 0x2, // '10' means to read-and-increment
		SMI_OP_CLAUSE_45_OP_READREG = 0x3, // '11' means to read using the register previously set with the '00' SETREG op

		SMI_OP_CLAUSE_22_OP_INVALID0 = 0x0, // '00' is an invalid op for Clause 22
		SMI_OP_CLAUSE_22_OP_WRITEREG = 0x1, // Write is '01' for Clause 22
		SMI_OP_CLAUSE_22_OP_READREG = 0x2, // Read is '10' for Clause 22
		SMI_OP_CLAUSE_22_OP_INVALID3 = 0x3 // '11' is an invalid op for Clause 22
	};

	enum SMI_CLAUSE_45_DEVICETYPE : unsigned
	{
		SMI_CLAUSE_45_DEVTYPE_RESERVED = 0x0, // Reserved
		SMI_CLAUSE_45_DEVTYPE_PMD_PMA = 0x1, // PMD/PMA
		SMI_CLAUSE_45_DEVTYPE_WIS = 0x2, // WIS
		SMI_CLAUSE_45_DEVTYPE_PCS = 0x3, // PCS
		SMI_CLAUSE_45_DEVTYPE_PHY_XS = 0x4, // PHY XS
		SMI_CLAUSE_45_DEVTYPE_DTE_XS = 0x5 // DTE XS
	};

	struct _SMI_Packet
	{
		unsigned data : 16;
		unsigned turnAround : 2; // Two bits of timing for the line to turn around
		SMI_CLAUSE_45_DEVICETYPE deviceAddress : 5; // For Clause 22 packets, this selects one of the first 32 registers. For Clause 45 packets, this selects which type of device to talk to.
		unsigned phyAddress : 5; // This selects which PHY module to talk to
		SMI_OP_TYPE operation : 2;
		SMI_START_TYPE startBits : 2; // The ST bits should always be "01" for Clause 22-format packets, and should always be "00" for Clause 45-format packets
	} SMI_Packet;
};
static_assert(sizeof(SMI_Packet_U) == sizeof(unsigned), "Error: Unexpected struct packing!");

#pragma pack(pop)

class SMI
{
public:
	unsigned preambleBits = 0;
	unsigned preambleClearedClocks = 0;
	unsigned fillBit = 31;
	SMI_Packet_U SMIPacket = {0};
	unsigned short clause45addr = 0x0000;

	unsigned short registerSpace[65536] = {0x0000};

	bool externalOwnsTheBus = false;

	void ProcessCompletedPacket()
	{
		externalOwnsTheBus = false;
		switch (SMIPacket.SMI_Packet.startBits)
		{
		case SMI_Packet_U::SMI_START_CLAUSE_22:
			switch (SMIPacket.SMI_Packet.operation)
			{
			case SMI_Packet_U::SMI_OP_CLAUSE_22_OP_WRITEREG:
				registerSpace[SMIPacket.SMI_Packet.deviceAddress] = SMIPacket.SMI_Packet.data;
				break;
			case SMI_Packet_U::SMI_OP_CLAUSE_22_OP_READREG:
				__debugbreak(); // Shouldn't be here
				break;
			default:
				__debugbreak(); // Should never be here
				break;
			}
			break;
		case SMI_Packet_U::SMI_START_CLAUSE_45:
			if (SMIPacket.SMI_Packet.deviceAddress > SMI_Packet_U::SMI_CLAUSE_45_DEVTYPE_DTE_XS)
			{
				__debugbreak(); // Unknown device type!
			}

			switch (SMIPacket.SMI_Packet.operation)
			{
			case SMI_Packet_U::SMI_OP_CLAUSE_45_OP_SETREG:
				clause45addr = SMIPacket.SMI_Packet.data;
				break;
			case SMI_Packet_U::SMI_OP_CLAUSE_45_OP_WRITEREG:
				registerSpace[clause45addr] = SMIPacket.SMI_Packet.data;
				break;
			case SMI_Packet_U::SMI_OP_CLAUSE_45_OP_READANDINCREMENTREG:
				break;
			case SMI_Packet_U::SMI_OP_CLAUSE_45_OP_READREG:
				break;
			default:
				__debugbreak(); // Should never be here
				break;
			}
			break;
		default:
			__debugbreak(); // Should never be here
			break;
		}

		SMIPacket.u32 = 0x0000; // Clear our packet out when we're done processing it
	}

	void ProcessInFlightPacket()
	{
		externalOwnsTheBus = false;
		switch (SMIPacket.SMI_Packet.startBits)
		{
		case SMI_Packet_U::SMI_START_CLAUSE_22:
			switch (SMIPacket.SMI_Packet.operation)
			{
			case SMI_Packet_U::SMI_OP_CLAUSE_22_OP_WRITEREG:
				// Do nothing, we'll write once we're done receiving the full packet
				break;
			case SMI_Packet_U::SMI_OP_CLAUSE_22_OP_READREG:
				SMIPacket.SMI_Packet.data = registerSpace[SMIPacket.SMI_Packet.deviceAddress];
				if ( (SMIPacket.SMI_Packet.turnAround & 0x2) == 0)
					externalOwnsTheBus = true;
				break;
			default:
				__debugbreak(); // Should never be here
				break;
			}
			break;
		case SMI_Packet_U::SMI_START_CLAUSE_45:
			if (SMIPacket.SMI_Packet.deviceAddress > SMI_Packet_U::SMI_CLAUSE_45_DEVTYPE_DTE_XS)
			{
				__debugbreak(); // Unknown device type!
			}

			switch (SMIPacket.SMI_Packet.operation)
			{
			case SMI_Packet_U::SMI_OP_CLAUSE_45_OP_SETREG:
				// Do nothing, we'll update our address once we're done receiving the full packet
				break;
			case SMI_Packet_U::SMI_OP_CLAUSE_45_OP_WRITEREG:
				// Do nothing, we'll update our address once we're done receiving the full packet
				break;
			case SMI_Packet_U::SMI_OP_CLAUSE_45_OP_READANDINCREMENTREG:
				SMIPacket.SMI_Packet.data = registerSpace[clause45addr++];
				if ( (SMIPacket.SMI_Packet.turnAround & 0x2) == 0)
					externalOwnsTheBus = true;
				break;
			case SMI_Packet_U::SMI_OP_CLAUSE_45_OP_READREG:
				SMIPacket.SMI_Packet.data = registerSpace[clause45addr];
				if ( (SMIPacket.SMI_Packet.turnAround & 0x2) == 0)
					externalOwnsTheBus = true;
				break;
			default:
				__debugbreak(); // Should never be here
				break;
			}
			break;
		default:
			__debugbreak(); // Should never be here
			break;
		}
	}

	void Update(std_logic_port& mdio_i, std_logic_port& mdio_o, std_logic_port& mdio_t, std_logic_port& mdio_t_in)
	{
		mdio_t = mdio_t_in.GetBoolVal();
		preambleBits = preambleBits << 1;

		//printf("mdio_i: 0x%u\n", mdio_i.GetBoolVal() ? 1 : 0);

		if (mdio_t_in.GetBoolVal() == true)
		{
			mdio_o = false;

			preambleBits |= 0x0;
		}
		else
		{
			preambleBits |= ( (mdio_i.GetBoolVal() ) & 0x1);
		}

		if (preambleClearedClocks > 0)
		{
			if (externalOwnsTheBus) // The PHY owns the bus and will write the register read value into the Data field of the packet
			{
				mdio_o = (SMIPacket.u32 & (1 << fillBit) ) ? true : false;
			}
			else // Write from the MDIO controller to the PHY
			{
				mdio_o = false;
				SMIPacket.u32 &= ~(1 << fillBit); // Clear the bit first
				SMIPacket.u32 |= ( ( (mdio_i.GetBoolVal() ) & 0x1) << fillBit); // Then set the bit
			}
			--fillBit;
			--preambleClearedClocks;
		}
		else if (preambleBits == 0xFFFFFFFF)
		{
			mdio_o = false;
			preambleClearedClocks = 32;
			fillBit = 31;
		}

		if (fillBit == 16) // Bit 17 is the first (high) bit of the TurnAround (TA) field
		{
			ProcessInFlightPacket();
		}
		if (preambleClearedClocks == 0 && fillBit != 31)
		{
			ProcessCompletedPacket();
			fillBit = 31; // Reset fillBit again
		}
	}
};

const int RunTestsEthernetMDIO(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clkin25(PD_IN, loader, "clkin25"); // 2.5MHz clock

// MDIO PHY Interface
	std_logic_port mdio_i(PD_OUT, loader, "mdio_i");
	std_logic_port mdio_o(PD_IN, loader, "mdio_o");
	std_logic_port mdio_t(PD_IN, loader, "mdio_t");
	std_logic_port mdio_t_ctrl(PD_OUT, loader, "mdio_t_ctrl"); // '0' means to drive the tri-state line using mdio_o and '1' means to read the line into 'mdio_i'
// End MDIO PHY Interface

// Packet interface
	std_logic_vector_port<16> registerReadData(PD_OUT, loader, "registerReadData");
	std_logic_port registerReadReady(PD_OUT, loader, "registerReadReady");

	std_logic_vector_port<5> newRequestPHYAddress(PD_IN, loader, "newRequestPHYAddress");
	std_logic_vector_port<5> newRequestDevTypeRegister(PD_IN, loader, "newRequestDevTypeRegister");
	std_logic_vector_port<16> newRequestRegister(PD_IN, loader, "newRequestRegister");
	std_logic_vector_port<16> newRequestData(PD_IN, loader, "newRequestData");
	std_logic_port newRequestIsWrite(PD_IN, loader, "newRequestIsWrite");
	std_logic_port newRequestStart(PD_IN, loader, "newRequestStart");
// End packet interface

// Debug signals
	std_logic_vector_port<5> DBG_EthMDIO_State(PD_OUT, loader, "DBG_EthMDIO_State");
// End Debug signals

	bool successResult = true;

	unsigned short registerIndex = 0;

	SMI smi;
	while (registerIndex < 0xFFFF)
	{
		scoped_timestep time(loader, clkin25, 100);

		const EthMDIOStateType dbgState = (const EthMDIOStateType)(DBG_EthMDIO_State.GetUint8Val() );

		smi.Update(mdio_i, mdio_o, mdio_t, mdio_t_ctrl);

		if (dbgState == waitForNewRequestState)
		{
			newRequestPHYAddress = 0x0;
			newRequestDevTypeRegister = SMI_Packet_U::SMI_CLAUSE_45_DEVTYPE_PMD_PMA;
			newRequestRegister = registerIndex;
			newRequestData = 0xFFFF - registerIndex;
			newRequestIsWrite = true;
			newRequestStart = true;

			++registerIndex;
		}
		else
		{
			newRequestStart = false;
		}
	}
	registerIndex = 0;

	for (unsigned x = 0; x < 65535-1; ++x)
	{
		if (smi.registerSpace[x] != 0xFFFF - x)
		{
			__debugbreak();
		}
	}

	while (true)
	{
		scoped_timestep time(loader, clkin25, 100);
		const EthMDIOStateType dbgState = (const EthMDIOStateType)(DBG_EthMDIO_State.GetUint8Val() );
		newRequestStart = false;
		if (dbgState == waitForNewRequestState)
		{
			break;
		}
	}

	/*while (registerIndex < 0xFFFF)
	{
		scoped_timestep time(loader, clkin25, 100);

		const EthMDIOStateType dbgState = (const EthMDIOStateType)(DBG_EthMDIO_State.GetUint8Val() );

		smi.Update(mdio_i, mdio_o, mdio_t, mdio_t_ctrl);

		if (dbgState == waitForNewRequestState)
		{
			newRequestPHYAddress = 0x0;
			newRequestDevTypeRegister = SMI_Packet_U::SMI_CLAUSE_45_DEVTYPE_PMD_PMA;
			newRequestRegister = registerIndex;
			newRequestData = 0xFFFF - registerIndex;
			newRequestIsWrite = false;
			newRequestStart = true;
		}
		else
		{
			newRequestStart = false;
		}

		if (registerReadReady.GetBoolVal() )
		{
			const unsigned short readVal = registerReadData.GetUint16Val();
			if (smi.registerSpace[registerIndex] != readVal)
			{
				__debugbreak();
			}
			++registerIndex;
		}
	}*/

	return successResult ? S_OK : E_FAIL;
}

// This is a very simple CRC32 algorithm. It's not super optimized, but that's okay. We're only using it for verification and validation of
// the HDL, not for packet checksumming itself.
const uint32_t crc32_formula_reflect(unsigned len, const unsigned char* buffer, const uint32_t POLY)
{
    uint32_t crc = 0xFFFFFFFF; // Initialize our CRC value to all 1 bits

    while(len--)
    {
        crc = crc ^ *buffer++;
        for(unsigned char bit = 0; bit < 8; ++bit)
        {
            if(crc & 1)
				crc = (crc >> 1) ^ POLY;
            else
				crc = (crc >> 1);
        }
    }
    return ~crc; // Don't forget to invert the result back again when we're done!
}

static const unsigned char testUDPPacketData[] =
{
// Ethernet II Frame begin
	0x44, // Destination MAC address is the PC's MAC ID: 44:A8:42:FC:3C:93
	0xA8,
	0x42,
	0xFC,
	0x3C,
	0x93,

	0x00, // Source MAC address is the FPGA's MAC ID: 00:0A:35:03:78:F1
	0x0A,
	0x35,
	0x03,
	0x78,
	0xF1,

	0x08, // EtherType 0x0800 indicates IPv4
	0x00,
// Ethernet II Frame end

// IPv4 Header begin:
	0x45, // IP version 4, IPv4 header length = 5 DWORD's (20 bytes). This must be set to exactly 0x45 or else we won't get TCP/UDP checksum offloading!
	0x00, // DSCN is 6 bits, all zeroes for "Standard" mode, and ECN is 2 bits, also all zeroes for a standard packet.
	0x00, // IPv4 Packet length, high 8 bits
	0x26, // IPv4 Packet length, low 8 bits (includes header size, minimum of 20 bytes for an empty packet with minimal header)
	0x00, // Packet ID, high 8 bits
	0x00, // Packet ID, low 8 bits. The packet ID needs to be unique for each packet, so use an incrementing counter to fill this 16-bit value.
	0x40, // Flags (top bit is reserved and must be zero, next bit is the "Don't Fragment" bit, which is set to 1, and below that is the "More Fragments" bit, which is set to 0). The remaining 5 bits are the high bits of the Fragment Offset.
	0x00, // Fragment Offset lower 8 bits. All are set to zero because we don't want to deal with packet fragmentation.
	0x80, // TTL is set to 128 by default
	0x11, // IPv4 Protocol number is set to 0x11 (this is decimal 17) to select UDP.
	0x76, // IPv4 Checksum high 8 bits
	0x2E, // IPv4 Checksum low 8 bits. The checksum field is the 16 bit one's complement of the one's complement sum of all 16 bit words in the header. For purposes of computing the checksum, the value of the checksum field is zero.
	0xC0, // Source IPv4 Address (first byte)
	0xA8, // Source IPv4 Address (second byte)
	0x01, // Source IPv4 Address (third byte)
	0xAA, // Source IPv4 Address (fourth byte). Our source IP for the FPGA should always be 192.168.1.170 .
	0xC0, // Destination IPv4 Address (first byte)
	0xA8, // Destination IPv4 Address (second byte)
	0x01, // Destination IPv4 Address (third byte)
	0x9E, // Destination IPv4 Address (fourth byte). Our destination IP should always be the PC's IP address at 192.168.1.158 .
// IPv4 Header end

// UDP Header begin:
	0x0C, // UDP Source Port (high 8 bits)
	0x38, // UDP Source Port (low 8 bits). Let's use port 3128 as our source port.
	0x0C, // UDP Destination Port (high 8 bits)
	0x38, // UDP Destination Port (low 8 bits). Let's use port 3128 as our destination port.
	0x00, // UDP Packet Length (high 8 bits)
	0x12, // UDP Packet Length (low 8 bits). The packet length includes the 8-byte UDP header so it is always at least 8.
	0x00, // UDP Packet Checksum (high 8 bits)
	0x00, // UDP Packet Checksum (low 8 bits). Leave this as zero to enable UDP checksum offloading to fill in the correct value.
// UDP Header end

// UDP Data Payload begin:
	0x0A,
	0x0B,
	0x0C,
	0x0D,
	0x0E,
	0x0F,
	0x00,
	0x11,
	0x22,
	0x33
// UDP Data Payload end
};

static const unsigned char testBroadcastUDPPacketData[] =
{
// Ethernet frame begin:
	0xFF, // Destination MAC address (FF:FF:FF:FF:FF:FF in this case is the broadcast address)
	0xFF,
	0xFF,
	0xFF,
	0xFF,
	0xFF,

	0x44, // Source MAC address (44:A8:42:FC:3C:93 is the PC's mac address)
	0xA8,
	0x42,
	0xFC,
	0x3C,
	0x93,

	0x08, // 0x0800 means that the EtherType is IPv4
	0x00,

// IPv4 Header begin:
	0x45,
	0x00,

	0x00, // Total packet length is 0x0030 bytes (48 bytes) including the 20-byte IPv4 header itself
	0x30,

	0xA9, // Packet ID is 0xA956
	0x56,
	0x00,
	0x00,

	0x80, // TTL is 128
	0x11, // Protocol is UDP

	0xCF, // IPv4 header checksum is 0xCF20
	0x20,

	0xC0, // Source IP Address is 192.168.1.158
	0xA8,
	0x01,
	0x9E,

	0xFF, // Destination IP Address is 255.255.255.255 which is the IPv4 broadcast address
	0xFF,
	0xFF,
	0xFF,

// UDP Header begin:
	0x0C, // UDP Source port is 0x0C38 (port 3128)
	0x38,

	0x0C, // UDP Destination port is 0x0C38 (port 3128)
	0x38,

	0x00, // UDP packet length is 0x001C (28 bytes) including the size of the 8-byte UDP header
	0x1C,

	0xCA, // UDP checksum is 0xCA9B
	0x9B,

// UDP Data payload begin:
	0x00,
	0x01,
	0x02,
	0x03,
	0x04,
	0x05,
	0x06,
	0x07,
	0x08,
	0x09,
	0x0A,
	0x0B,
	0x0C,
	0x0D,
	0x0E,
	0x0F,
	0x10,
	0x11,
	0x12,
	0x13,

// FCS Begin:
	0xF3,
	0x4F,
	0x14,
	0x90
};

static const char* const standardCRC32TestVector = "123456789";
static const char* const quickBrownFoxCRC32TestVector = "The quick brown fox jumps over the lazy dog";
static const char* const variousInputDataCRC32String ="various CRC algorithms input data";
static const char* const febootiComCRC32TestVector = "Test vector from febooti.com";
static const bool ValidateSoftCRC32Correctness()
{
	static const uint32_t crc32_802_3_polynomial = 0xEDB88320;
	const uint32_t crc0 = crc32_formula_reflect(0, NULL, crc32_802_3_polynomial);
	if (crc0 != 0x00000000)
	{
		return false;
	}

	const uint32_t crc1 = crc32_formula_reflect(1, (const unsigned char* const)"1", crc32_802_3_polynomial);
	if (crc1 != 0x83DCEFB7)
	{
		return false;
	}

	const uint32_t crcStandardCheck = crc32_formula_reflect( (const unsigned)strlen(standardCRC32TestVector), (const unsigned char* const)standardCRC32TestVector, crc32_802_3_polynomial);
	if (crcStandardCheck != 0xCBF43926)
	{
		return false;
	}

	const uint32_t crcQuickBrownFox = crc32_formula_reflect( (const unsigned)strlen(quickBrownFoxCRC32TestVector), (const unsigned char* const)quickBrownFoxCRC32TestVector, crc32_802_3_polynomial);
	if (crcQuickBrownFox != 0x414FA339)
	{
		return false;
	}

	const uint32_t crcVariousInputData = crc32_formula_reflect( (const unsigned)strlen(variousInputDataCRC32String), (const unsigned char* const)variousInputDataCRC32String, crc32_802_3_polynomial);
	if (crcVariousInputData != 0x9BD366AE)
	{
		return false;
	}

	const uint32_t crcFebootiCom = crc32_formula_reflect( (const unsigned)strlen(febootiComCRC32TestVector), (const unsigned char* const)febootiComCRC32TestVector, crc32_802_3_polynomial);
	if (crcFebootiCom != 0x0C877F61)
	{
		return false;
	}

	const uint32_t testPacketCRC = crc32_formula_reflect(sizeof(testUDPPacketData), testUDPPacketData, crc32_802_3_polynomial);
	if (testPacketCRC != 0xF19DB46A)
	{
		return false;
	}

	const uint32_t broadcastPacketCRC = crc32_formula_reflect(sizeof(testBroadcastUDPPacketData) - 4, testBroadcastUDPPacketData, crc32_802_3_polynomial);

	return true;
}

static const unsigned char ReverseBitsInByte(unsigned char b)
{
   b = (b & 0xF0) >> 4 | (b & 0x0F) << 4;
   b = (b & 0xCC) >> 2 | (b & 0x33) << 2;
   b = (b & 0xAA) >> 1 | (b & 0x55) << 1;
   return b;
}

static const uint32_t ReverseBitsInUint32(const uint32_t val)
{
	unsigned reversedResult = 0;
	for (unsigned x = 0; x < 32; ++x)
	{
		if (val & (1 << x) )
		{
			reversedResult |= (1 << (32 - x) );
		}
	}
	return reversedResult;
}

const int RunTestsCRC32(Xsi::Loader& loader)
{
	if (!ValidateSoftCRC32Correctness() )
	{
		return 1;
	}

	// Start everything off at the beginning:
	loader.restart();

	// The clock is just used for simulation and isn't actually used by the HDL
	std_logic_port clk(PD_IN, loader, "clk");

	std_logic_vector_port<32> crcIn(PD_IN, loader, "crcIn");
	std_logic_vector_port<8> data(PD_IN, loader, "data");
	std_logic_vector_port<32> crcOut(PD_OUT, loader, "crcOut");

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		crcIn = 0x00000000;
		data = 0x00;
	}

	auto simulateCRC32 = [&](const char* const testString, const unsigned dataLen) -> uint32_t
	{
		uint32_t inProgressCRC32 = 0xFFFFFFFF; // Initialize our CRC to all 1 bits
		crcIn = inProgressCRC32;

		for (unsigned x = 0; x < dataLen; ++x)
		{
			{
				scoped_timestep time(loader, clk, 100);
				crcIn = inProgressCRC32;
				const uint8_t nextByte = (const uint8_t)testString[x];
				data = nextByte;
			}
			inProgressCRC32 = crcOut.GetUint32Val();
		}

		return ~inProgressCRC32;
	};

	const uint32_t standardCRC32 = simulateCRC32(standardCRC32TestVector, (const unsigned)strlen(standardCRC32TestVector) );
	const uint32_t zeroCRC32 = simulateCRC32(NULL, 0);
	const uint32_t quickBrownFoxCRC32 = simulateCRC32(quickBrownFoxCRC32TestVector, (const unsigned)strlen(quickBrownFoxCRC32TestVector) );
	const uint32_t variousInputDataCRC32 = simulateCRC32(variousInputDataCRC32String, (const unsigned)strlen(variousInputDataCRC32String) );
	const uint32_t febootiComCRC32 = simulateCRC32(febootiComCRC32TestVector, (const unsigned)strlen(febootiComCRC32TestVector) );
	const uint32_t oneCRC32 = simulateCRC32("1", 1);
	const uint32_t testPacketCRC32 = simulateCRC32( (const char* const)testUDPPacketData, sizeof(testUDPPacketData) );

	if (oneCRC32 != 0x83DCEFB7)
	{
		__debugbreak();
	}

	if (zeroCRC32 != 0x00000000)
	{
		__debugbreak();
	}
	if (standardCRC32 != 0xCBF43926)
	{
		__debugbreak();
	}
	if (quickBrownFoxCRC32 != 0x414FA339)
	{
		__debugbreak();
	}
	if (variousInputDataCRC32 != 0x9BD366AE)
	{
		__debugbreak();
	}
	if (febootiComCRC32 != 0x0C877F61)
	{
		__debugbreak();
	}
	if (testPacketCRC32 != 0xF19DB46A)
	{
		__debugbreak();
	}

	return 0;
}

const int RunTestsEthernet(Xsi::Loader& loader)
{
	return RunTestsCRC32(loader);
	//return RunTestsEthernetMDIO(loader);

	// Start everything off at the beginning:
	/*loader.restart();

	bool successResult = true;

	bool bFirstPacketDone = false;
	bool bFirstPacketStarted = false;
	std::vector<unsigned char> sentBytesVec;
	while (!bFirstPacketDone)
	{
		scoped_timestep time(loader, clk125, 100);

		if (tx_en.GetBoolVal() )
		{
			bFirstPacketStarted = true;

			sentBytesVec.push_back(tx_data.GetUint8Val() );
		}
		else
		{
			if (bFirstPacketStarted)
				bFirstPacketDone = true;
		}
	}

	EthernetFrame* const ethFrameStart = reinterpret_cast<EthernetFrame* const>(&sentBytesVec.front() );
	ethFrameStart->ethHeader.ConvertEndiannessFromNet();
	IPv4Header* const ipv4Header = (IPv4Header* const)ethFrameStart->ethHeader.packetData;
	ipv4Header->ConvertEndiannessFromNet();
	UDPHeader* const udpHeader = (UDPHeader* const)ipv4Header->packetData;
	udpHeader->ConvertEndiannessFromNet();
	const unsigned* const FCSPtr = (const unsigned* const)(udpHeader->packetData + udpHeader->totalLength - (sizeof(UDPHeader) - 1) );

	return successResult ? S_OK : E_FAIL;*/
}
