#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include <vector>

enum EncodedValues : unsigned short
{
	// Control codes used during the control period:
	C_00 = 0x354,
	C_01 = 0x0AB,
	C_02 = 0x154,
	C_03 = 0x2AB,

	// TERC4 encoded signals used during the data island period:
	T_0 = 0x29C,
	T_1 = 0x263,
	T_2 = 0x2E4,
	T_3 = 0x2E2,
	T_4 = 0x171,
	T_5 = 0x11E,
	T_6 = 0x18E,
	T_7 = 0x13C,
	T_8 = 0x2CC,
	T_9 = 0x139,
	T_A = 0x19C,
	T_B = 0x2C6,
	T_C = 0x28E,
	T_D = 0x271,
	T_E = 0x163,
	T_F = 0x2C3,

	// Video guard band encoded signals:
	GB_V_RB = 0x2CC, // Red/Blue channels
	GB_V_G = 0x133, // Green channel

	// Data island guard band encoded signals:
	GB_D_RG = 0x133 // Red/Green channels (note that Blue continues to transmit 1+1+vsync+hsync during this period)
};

static const unsigned char DecodeTERC4Value(const EncodedValues encodedTERC4)
{
	switch (encodedTERC4)
	{
	case T_0:
		return 0x0;
	case T_1:
		return 0x1;
	case T_2:
		return 0x2;
	case T_3:
		return 0x3;
	case T_4:
		return 0x4;
	case T_5:
		return 0x5;
	case T_6:
		return 0x6;
	case T_7:
		return 0x7;
	case T_8:
		return 0x8;
	case T_9:
		return 0x9;
	case T_A:
		return 0xA;
	case T_B:
		return 0xB;
	case T_C:
		return 0xC;
	case T_D:
		return 0xD;
	case T_E:
		return 0xE;
	case T_F:
		return 0xF;

	case C_00:
	case C_01:
	case C_02:
	case C_03:
#ifdef _DEBUG
		__debugbreak(); // Error: Control Period characters are not valid TERC4 characters
#endif
		break;

	case GB_V_G:
#ifdef _DEBUG
		__debugbreak(); // Error: Guard Band characters are not valid TERC4 characters!
#endif
		break;

	default:
#ifdef _DEBUG
		__debugbreak(); // The current character is not a valid known HDMI character!
#endif
		break;
	}
	return 0x0;
}

enum RegionPeriod : unsigned char
{
	VideoPeriod = 0,
	VideoPeriod_LeadingGuardBand,

	ControlPeriod,
	ControlPeriod_VideoPreamble,
	ControlPeriod_DataIslandPreamble,

	DataIslandPeriod,
	DataIslandPeriod_LeadingGuardBand,
	DataIslandPeriod_TrailingGuardBand,
};

static const unsigned char ComputeHDMI_BCH(const unsigned char* dataBytes, const unsigned dataLen)
{
#ifdef _DEBUG
	if (dataBytes == NULL)
	{
		__debugbreak();
	}

	if (dataLen < 1)
	{
		__debugbreak();
	}

	// While technically okay, we should probably error out if we're not using this on HDMI packet frame lengths:
	if (dataLen != 3 && dataLen != 7)
	{
		__debugbreak();
	}
#endif
	unsigned char result = 0x00;
	for (unsigned byteIndex = 0; byteIndex < dataLen; ++byteIndex)
	{
		unsigned char byteVal = dataBytes[byteIndex];
		for (unsigned bitIndex = 0; bitIndex < 8; ++bitIndex)
		{
			const unsigned char currentTestBit = ( (byteVal >> bitIndex) & 0x1);
			const bool xorResult = (currentTestBit ^ (result & 0x1) ) ? true : false;
			result >>= 1;
			if (xorResult)
			{
				result ^= 0x83;
			}
		}
	}
	return result;
}

#pragma pack(push)
#pragma pack(1)
struct StreamSymbol
{
	unsigned short dbgScanX;
	unsigned short dbgScanY;

	unsigned char r;
	unsigned char g;
	unsigned char b;

	bool hsync : 1;
	bool vsync : 1;

	RegionPeriod periodBeforeSymbol : 3;

	EncodedValues channel0 : 10; // This is the Blue channel, it also contains HSYNC and VSYNC and TERC4 packet header data
	EncodedValues channel1 : 10; // This is the Green channel
	EncodedValues channel2 : 10; // This is the Red channel
};

struct HDMIPacket
{
	unsigned packetHeader;

	union
	{
		unsigned __int64 packetBodyU64[4];
		unsigned char packetBodyBytes[8*4];
	} packetBodyData;
};
static_assert(sizeof(HDMIPacket) == 36, "Error! Unexpected struct packing!");
static_assert(sizeof(HDMIPacket::packetBodyData) == 32, "Error! Unexpected union packing!");
#pragma pack(pop)

struct SymbolsLine
{
	std::vector<StreamSymbol> symbols;
};

struct SymbolsFrame
{
	std::vector<SymbolsLine> lines;
	unsigned symbolsThisFrame;
};

static std::vector<SymbolsFrame> frames;
static RegionPeriod currentPeriod = ControlPeriod;
static unsigned consecutivePreambleCycles = 0;
static unsigned consecutiveGuardBandCycles = 0;
static unsigned consecutiveDataIslandCycles = 0;
static HDMIPacket currentPacket = {0};

enum HDMIPacketType : unsigned char
{
	NullPacketType = 0x00,
	AudioClockRegenerationType = 0x01,
	AudioSampleType = 0x02,
	GeneralControlType = 0x03,
	ACPPacketType = 0x04,
	ISRC1PacketType = 0x05,
	ISRC2PacketType = 0x06,
	OneBitAudioSampleType = 0x07,
	DSTAudioPacketType = 0x08,
	HBRAudioStreamPacketType = 0x09,
	GamutMetadataPacket = 0x0A,

	VendorSpecificInfoFrameType = 0x81,
	AVIInfoFrameType = 0x82,
	SourceProductDescriptorInfoFrame = 0x83,
	AudioInfoFrame = 0x84,
	MPEGSourceInfoFrame = 0x85
};

static const HDMIPacket HDMINullPacket = {0};
static const HDMIPacket AVIInfoFramePacket = 
{
	0xE40D0282,
	{
		0xE7000001881810BE,
		0x0000000000000000,
		0x0000000000000000,
		0x0000000000000000
	}
};

void ValidateHDMIPacket(const HDMIPacket& packet)
{
	switch (packet.packetHeader & 0xFF)
	{
	case NullPacketType:
		if (memcmp(&HDMINullPacket, &packet, sizeof(HDMINullPacket) ) != 0)
		{
			__debugbreak(); // Error: NULL packet must be filled with all 0 bytes!
		}
		break;

	case AVIInfoFrameType:
		// TODO: AVI InfoFrame packet parsing
		if (memcmp(&AVIInfoFramePacket, &packet, sizeof(HDMINullPacket) ) != 0)
		{
			__debugbreak(); // Error: AVI InfoFrame packet doesn't match intended data!
		}
		break;

	case AudioClockRegenerationType:
	case AudioSampleType:
	case GeneralControlType:
	case ACPPacketType:
	case ISRC1PacketType:
	case ISRC2PacketType:
	case OneBitAudioSampleType:
	case DSTAudioPacketType:
	case HBRAudioStreamPacketType:
	case GamutMetadataPacket:
	case VendorSpecificInfoFrameType:
	case SourceProductDescriptorInfoFrame:
	case AudioInfoFrame:
	case MPEGSourceInfoFrame:
	{
		__debugbreak(); // Not implemented packet types!
	}
		break;

	default:
	{
		__debugbreak(); // Unknown packet type!
	}
		break;
	}
}

void ValidateIsTERC4Character(const EncodedValues encoded10bit)
{
	switch (encoded10bit)
	{
	case T_0:
	case T_1:
	case T_2:
	case T_3:
	case T_4:
	case T_5:
	case T_6:
	case T_7:
	case T_8:
	case T_9:
	case T_A:
	case T_B:
	case T_C:
	case T_D:
	case T_E:
	case T_F:
		break;

	case C_00:
	case C_01:
	case C_02:
	case C_03:
#ifdef _DEBUG
		__debugbreak(); // Error: Control Period characters are not valid TERC4 characters
#endif
		break;

	case GB_V_G:
#ifdef _DEBUG
		__debugbreak(); // Error: Guard Band characters are not valid TERC4 characters!
#endif
		break;

	default:
#ifdef _DEBUG
		__debugbreak(); // The current character is not a valid known HDMI character!
#endif
		break;
	}
}

__forceinline void BreakIfRealSymbol(const unsigned symbolCount)
{
	if (symbolCount > 1)
	{
		__debugbreak();
	}
}

void Update(StreamSymbol& outReadSymbol, RegionPeriod& inoutCurrentPeriod, bool& outCurrentVSyncState, bool& outCurrentHSyncState, 
	std_logic_vector_port<10>& EncodedB, std_logic_vector_port<10>& EncodedG, std_logic_vector_port<10>& EncodedR,
	std_logic_vector_port<8>& DBG_PixelR, std_logic_vector_port<8>& DBG_PixelG, std_logic_vector_port<8>& DBG_PixelB,
	std_logic_vector_port<10>& DBG_ScanX, std_logic_vector_port<10>& DBG_ScanY,
	bool& outIsNewLine, bool& outIsNewFrame, const unsigned symbolCount)
{
	StreamSymbol localNewSymbol;
	localNewSymbol.dbgScanX = DBG_ScanX.GetUint16Val();
	localNewSymbol.dbgScanY = DBG_ScanY.GetUint16Val();
	localNewSymbol.channel0 = (const EncodedValues)(EncodedB.GetUint16Val() );
	localNewSymbol.channel1 = (const EncodedValues)(EncodedG.GetUint16Val() );
	localNewSymbol.channel2 = (const EncodedValues)(EncodedR.GetUint16Val() );
	localNewSymbol.r = DBG_PixelR.GetUint8Val();
	localNewSymbol.g = DBG_PixelG.GetUint8Val();
	localNewSymbol.b = DBG_PixelB.GetUint8Val();
	localNewSymbol.periodBeforeSymbol = inoutCurrentPeriod;
	localNewSymbol.hsync = outCurrentHSyncState;
	localNewSymbol.vsync = outCurrentVSyncState;

	switch (inoutCurrentPeriod)
	{
	case VideoPeriod:
		if (localNewSymbol.channel1 == C_00 && localNewSymbol.channel2 == C_00)
		{
			inoutCurrentPeriod = ControlPeriod;
		}
		break;
	case VideoPeriod_LeadingGuardBand:
		if (localNewSymbol.channel0 == GB_V_RB && localNewSymbol.channel1 == GB_V_G && localNewSymbol.channel2 == GB_V_RB)
		{
			++consecutiveGuardBandCycles;

			if (consecutiveGuardBandCycles == 2)
			{
				consecutiveGuardBandCycles = 0;
				inoutCurrentPeriod = VideoPeriod;
			}
		}
		else
		{
#ifdef _DEBUG
			BreakIfRealSymbol(symbolCount); // Illegal characters!
#endif
		}
		break;
	case ControlPeriod:
		switch (localNewSymbol.channel0)
		{
		case C_00:
			localNewSymbol.hsync = false;
			localNewSymbol.vsync = false;
			break;
		case C_01:
			localNewSymbol.hsync = true;
			localNewSymbol.vsync = false;
			break;
		case C_02:
			localNewSymbol.hsync = false;
			localNewSymbol.vsync = true;
			break;
		case C_03:
			localNewSymbol.hsync = true;
			localNewSymbol.vsync = true;
			break;
		default:
#ifdef _DEBUG
			BreakIfRealSymbol(symbolCount); // Illegal character during the Control Period!
#endif
			break;
		}

		if (localNewSymbol.hsync != outCurrentHSyncState)
		{
			if (outCurrentHSyncState == false && localNewSymbol.hsync == true)
			{
				outIsNewLine = true;
			}
			outCurrentHSyncState = localNewSymbol.hsync;
		}

		if (localNewSymbol.vsync != outCurrentVSyncState)
		{
			if (outCurrentVSyncState == false && localNewSymbol.vsync == true)
			{
				outIsNewFrame = true;
			}
			outCurrentVSyncState = localNewSymbol.vsync;
		}

		switch (localNewSymbol.channel1)
		{
		case C_00:
		case C_01:
			break;
		case C_02:
		case C_03:
#ifdef _DEBUG
			BreakIfRealSymbol(symbolCount); // Illegal character for channel 1 during the Control Period!
#endif
			break;
		default:
#ifdef _DEBUG
			BreakIfRealSymbol(symbolCount); // Illegal character during the Control Period!
#endif
			break;
		}

		switch (localNewSymbol.channel2)
		{
		case C_00:
		case C_01:
			break;
		case C_02:
		case C_03:
#ifdef _DEBUG
			BreakIfRealSymbol(symbolCount); // Illegal character for channel 2 during the Control Period!
#endif
			break;
		default:
#ifdef _DEBUG
			BreakIfRealSymbol(symbolCount); // Illegal character during the Control Period!
#endif
			break;
		}

		if (localNewSymbol.channel1 == C_01)
		{
			if (localNewSymbol.channel2 == C_00) // The Video Data Preamble is "0001" or "0x1"
			{
				consecutivePreambleCycles = 1;
				inoutCurrentPeriod = ControlPeriod_VideoPreamble;
			}
			else if (localNewSymbol.channel2 == C_01) // The Data Island Preamble is "0101" or "0x5"
			{
				consecutivePreambleCycles = 1;
				inoutCurrentPeriod = ControlPeriod_DataIslandPreamble;
			}
			else
			{
#ifdef _DEBUG
				BreakIfRealSymbol(symbolCount); // Illegal preamble type!
#endif
			}
		}
		else if (localNewSymbol.channel1 == C_00)
		{
			if (localNewSymbol.channel2 == C_00)
			{
				// This is the normal "do nothing" state. Remain in the Control Period.
			}
			else
			{
#ifdef _DEBUG
				BreakIfRealSymbol(symbolCount); // Illegal character combination "0100"
#endif
			}
		}
		else
		{
#ifdef _DEBUG
			BreakIfRealSymbol(symbolCount); // Illegal channel symbol!
#endif
		}
		break;
	case ControlPeriod_VideoPreamble:
		if (localNewSymbol.channel1 == C_01 && localNewSymbol.channel2 == C_00)
		{
			++consecutivePreambleCycles;
		}
		else if (localNewSymbol.channel0 == GB_V_RB && localNewSymbol.channel1 == GB_V_G && localNewSymbol.channel2 == GB_V_RB && consecutivePreambleCycles == 8)
		{
			consecutivePreambleCycles = 0;
			consecutiveGuardBandCycles = 1;
			inoutCurrentPeriod = VideoPeriod_LeadingGuardBand;
		}
		else
		{
#ifdef _DEBUG
			BreakIfRealSymbol(symbolCount); // Illegal combination!
#endif
		}
		break;
	case ControlPeriod_DataIslandPreamble:
		if (localNewSymbol.channel1 == C_01 && localNewSymbol.channel2 == C_01)
		{
			++consecutivePreambleCycles;
		}
		else if ( (localNewSymbol.channel0 == T_C || localNewSymbol.channel0 == T_D || localNewSymbol.channel0 == T_E || localNewSymbol.channel0 == T_F) &&
			localNewSymbol.channel1 == GB_D_RG && localNewSymbol.channel2 == GB_D_RG && consecutivePreambleCycles == 8)
		{
			consecutivePreambleCycles = 0;
			consecutiveGuardBandCycles = 1;
			inoutCurrentPeriod = DataIslandPeriod_LeadingGuardBand;
		}
		else
		{
#ifdef _DEBUG
			BreakIfRealSymbol(symbolCount); // Illegal combination!
#endif
		}
		break;
	case DataIslandPeriod:
		ValidateIsTERC4Character(localNewSymbol.channel0);
		if ( (localNewSymbol.channel0 == T_C || localNewSymbol.channel0 == T_D || localNewSymbol.channel0 == T_E || localNewSymbol.channel0 == T_F) &&
			localNewSymbol.channel1 == GB_D_RG && localNewSymbol.channel2 == GB_D_RG)
		{
			if (consecutiveDataIslandCycles % 32 != 0)
			{
				__debugbreak(); // Error: Non-integer number of packets sent!
			}

			ValidateHDMIPacket(currentPacket);

			consecutiveGuardBandCycles = 1;
			consecutiveDataIslandCycles = 0;
			inoutCurrentPeriod = DataIslandPeriod_TrailingGuardBand;
		}
		else
		{
			const unsigned char channel0nibble = DecodeTERC4Value(localNewSymbol.channel0);
			const unsigned char channel1nibble = DecodeTERC4Value(localNewSymbol.channel1);
			const unsigned char channel2nibble = DecodeTERC4Value(localNewSymbol.channel2);

			const unsigned char dataIslandGoBit = channel0nibble >> 3;
			if (consecutiveDataIslandCycles == 0)
			{
				if (dataIslandGoBit != 0) // The "go bit" must be set to '0' on the first cycle of the Data Island to indicate the start of packet data
				{
					__debugbreak();
				}
			}
			else
			{
				if (dataIslandGoBit != 1)
				{
					__debugbreak();
				}
			}

			const unsigned char packetHeaderBit = (channel0nibble >> 2) & 0x1;
			currentPacket.packetHeader |= (packetHeaderBit << (consecutiveDataIslandCycles & 31) );

			// TODO: TERC4 Packet construction and parsing here
			const unsigned char subpacket0even = channel1nibble & 0x1;
			const unsigned char subpacket0odd = channel2nibble & 0x1;
			const unsigned char subpacket1even = (channel1nibble >> 1) & 0x1;
			const unsigned char subpacket1odd = (channel2nibble >> 1) & 0x1;
			const unsigned char subpacket2even = (channel1nibble >> 2) & 0x1;
			const unsigned char subpacket2odd = (channel2nibble >> 2) & 0x1;
			const unsigned char subpacket3even = (channel1nibble >> 3);
			const unsigned char subpacket3odd = (channel2nibble >> 3);

			const unsigned char shiftAmount = (2 * (consecutiveDataIslandCycles & 31) );
			const unsigned char subpacket0halfNibble = ( (subpacket0odd << 1) | subpacket0even);
			const unsigned char subpacket1halfNibble = ( (subpacket1odd << 1) | subpacket1even);
			const unsigned char subpacket2halfNibble = ( (subpacket2odd << 1) | subpacket2even);
			const unsigned char subpacket3halfNibble = ( (subpacket3odd << 1) | subpacket3even);

			currentPacket.packetBodyData.packetBodyU64[0] |= ( (const unsigned __int64)subpacket0halfNibble) << shiftAmount;
			currentPacket.packetBodyData.packetBodyU64[1] |= ( (const unsigned __int64)subpacket1halfNibble) << shiftAmount;
			currentPacket.packetBodyData.packetBodyU64[2] |= ( (const unsigned __int64)subpacket2halfNibble) << shiftAmount;
			currentPacket.packetBodyData.packetBodyU64[3] |= ( (const unsigned __int64)subpacket3halfNibble) << shiftAmount;

			++consecutiveDataIslandCycles;
		}
		break;
	case DataIslandPeriod_LeadingGuardBand:
		if ( (localNewSymbol.channel0 == T_C || localNewSymbol.channel0 == T_D || localNewSymbol.channel0 == T_E || localNewSymbol.channel0 == T_F) &&
			localNewSymbol.channel1 == GB_D_RG && localNewSymbol.channel2 == GB_D_RG)
		{
			++consecutiveGuardBandCycles;

			if (consecutiveGuardBandCycles == 2)
			{
				consecutiveGuardBandCycles = 0;
				inoutCurrentPeriod = DataIslandPeriod;
			}
		}
		else
		{
#ifdef _DEBUG
			BreakIfRealSymbol(symbolCount); // Illegal characters!
#endif
		}
		break;
	case DataIslandPeriod_TrailingGuardBand:
		if ( (localNewSymbol.channel0 == T_C || localNewSymbol.channel0 == T_D || localNewSymbol.channel0 == T_E || localNewSymbol.channel0 == T_F) &&
			localNewSymbol.channel1 == GB_D_RG && localNewSymbol.channel2 == GB_D_RG)
		{
			++consecutiveGuardBandCycles;

			if (consecutiveGuardBandCycles == 2)
			{
				consecutiveGuardBandCycles = 0;
				inoutCurrentPeriod = ControlPeriod;
			}
		}
		else
		{
#ifdef _DEBUG
			BreakIfRealSymbol(symbolCount); // Illegal characters!
#endif
		}
		break;
	default:
#ifdef _DEBUG
		BreakIfRealSymbol(symbolCount); // Should never be here!
#endif
		break;
	}

	outReadSymbol = localNewSymbol;
}

// Make sure that our HDMI BCH algorithm works correctly and matches our test data!
static void ValidateHDMI_BCH()
{
	const unsigned char nullHeaderData[] = { 0x00, 0x00, 0x00 }; // This is the header bytes for a NULL header packet
	const unsigned char aviHeaderData[] = { 0x82, 0x02, 0x0D }; // This is test header data for a real AVI InfoFrame
	const unsigned char testNULLPacketBody[] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
	const unsigned char testAVIInfoFrame[] = { 0xBE, 0x10, 0x18, 0x88, 0x01, 0x00, 0x00 };
	const unsigned char nullBCH = ComputeHDMI_BCH(nullHeaderData, ARRAYSIZE(nullHeaderData) );
	if (nullBCH != 0x00)
	{
		__debugbreak(); // Uh oh, our BCH algorithm is broken!
	}

	const unsigned char nullBodyBCH = ComputeHDMI_BCH(testNULLPacketBody, ARRAYSIZE(testNULLPacketBody) );
	if (nullBodyBCH != 0x00)
	{
		__debugbreak(); // Uh oh, our BCH algorithm is broken!
	}

	const unsigned char aviHeaderBCH = ComputeHDMI_BCH(aviHeaderData, ARRAYSIZE(aviHeaderData) );
	if (aviHeaderBCH != 0xE4)
	{
		__debugbreak(); // Uh oh, our BCH algorithm is broken!
	}

	const unsigned char aviBodyBCH = ComputeHDMI_BCH(testAVIInfoFrame, ARRAYSIZE(testAVIInfoFrame) );
	if (aviBodyBCH != 0xE7)
	{
		__debugbreak(); // Uh oh, our BCH algorithm is broken!
	}
}

static const D3DCOLOR EmptyFrame[640*480] = {0};

const int RunTestsHDMIScanout(Xsi::Loader& loader, RenderWindow* renderWindow)
{
	ValidateHDMI_BCH();

	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");
	std_logic_port clk_n(PD_IN, loader, "clk_n");

	std_logic_port red_s(PD_OUT, loader, "red_s");
	std_logic_port green_s(PD_OUT, loader, "green_s");
	std_logic_port blue_s(PD_OUT, loader, "blue_s");
	std_logic_port cl_s(PD_OUT, loader, "cl_s");

	std_logic_vector_port<8> DBG_PixelR(PD_OUT, loader, "DBG_PixelR");
	std_logic_vector_port<8> DBG_PixelG(PD_OUT, loader, "DBG_PixelG");
	std_logic_vector_port<8> DBG_PixelB(PD_OUT, loader, "DBG_PixelB");

	std_logic_vector_port<10> EncodedB(PD_OUT, loader, "EncodedB");
	std_logic_vector_port<10> EncodedG(PD_OUT, loader, "EncodedG");
	std_logic_vector_port<10> EncodedR(PD_OUT, loader, "EncodedR");

	std_logic_vector_port<10> DBG_ScanX(PD_OUT, loader, "DBG_ScanX");
	std_logic_vector_port<10> DBG_ScanY(PD_OUT, loader, "DBG_ScanY");

	std::vector<D3DCOLOR> linePixels;

	const unsigned numTestFrames = 5;
	unsigned symbolCount = 0;
	bool currentFrameHSyncSignal = true;
	bool currentFrameVSyncSignal = false;
	for (unsigned frameID = 0; frameID < numTestFrames; ++frameID)
	{
		SymbolsFrame startFrame;
		startFrame.symbolsThisFrame = 0;
		SymbolsLine startLine;
		startFrame.lines.push_back(startLine);
		frames.push_back(startFrame);
		renderWindow->DisplayTexture(&EmptyFrame);

		SymbolsFrame& currentFrame = frames.back();
		SymbolsLine* currentLine = &currentFrame.lines.back();

		while (true)
		{
			for (unsigned clocks5x = 0; clocks5x < 10; ++clocks5x)
			{
				scoped_timestep time(loader, clk, 100);
				// clk_n is supposed to be inverted compared to clk, but since we don't actually use it and aren't testing ODDR right now, we don't need to worry about it
			}

			StreamSymbol sampleSymbol;
			bool isNewLine = false;
			bool isNewFrame = false;
			Update(sampleSymbol, currentPeriod, currentFrameVSyncSignal, currentFrameHSyncSignal, EncodedB, EncodedG, EncodedR, DBG_PixelR, DBG_PixelG, DBG_PixelB, DBG_ScanX, DBG_ScanY, isNewLine, isNewFrame, symbolCount++);

			currentLine->symbols.push_back(sampleSymbol);
			++currentFrame.symbolsThisFrame;

			const D3DCOLOR currentSymbolPixelColor = D3DCOLOR_ARGB(0xFF, sampleSymbol.r, sampleSymbol.g, sampleSymbol.b);
			linePixels.push_back(currentSymbolPixelColor);
			

			if (!isNewLine && !isNewFrame)
			{
			}
			if (isNewLine)
			{
				SymbolsLine newLine;
				currentFrame.lines.push_back(newLine);
				currentLine = &currentFrame.lines.back();
				if (currentFrame.lines.size() > 35 && currentFrame.lines.size() < 515)
				{
					renderWindow->DisplayLine(&linePixels.front() + 144, (const unsigned)(currentFrame.lines.size() ) - 36);
					renderWindow->RenderLoop();
				}
				linePixels.clear();
			}
			if (isNewFrame)
			{
				break;
			}
		}
	}

	bool successResult = true;

	return successResult ? S_OK : E_FAIL;
}
