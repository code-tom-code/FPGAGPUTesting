#include "PacketDisassembler.h"
#include "GPUAllocator.h"
#include "GPUCommandList.h"
#include "..\..\DriverShaderCompiler\DeviceShaderBytecode.h"

ResolveCommandListPacketCallback commandListResolveCallback = NULL;

static const char* const clearValueStringTable[] =
{
	"EC_TRANSPARENTBLACK", // Transparent Black: float4(0.0f, 0.0f, 0.0f, 0.0f)
	"EC_OPAQUEWHITE", // Opaque White: float4(1.0f, 1.0f, 1.0f, 1.0f)
	"EC_OPAQUEBLACK", // Opaque Black: float4(0.0f, 0.0f, 0.0f, 1.0f)
	"EC_TRANSPARENTWHITE" // Transparent White: float4(1.0f, 1.0f, 1.0f, 0.0f)
};
static const char* const ClearValueToString(const clearMemCommand::eClearValue clearVal)
{
	if (clearVal > clearMemCommand::clearMemCommand::EC_TRANSPARENTWHITE)
	{
#ifdef _DEBUG
		__debugbreak(); // Out of range clear mem enum!
#endif
		return "EC_UNKNOWN";
	}
	return clearValueStringTable[clearVal];
}

static const char* const ClearZStencilFlagsToString(const clearZStencilCommand::eZSType clearZStencilFlags)
{
	switch (clearZStencilFlags)
	{
	case 0:
		return "EZS_None";
	case clearZStencilCommand::eZSType::EZS_ZClear:
		return "EZS_ZClear";
	case clearZStencilCommand::eZSType::EZS_StencilClear:
		return "EZS_StencilClear";
	case clearZStencilCommand::eZSType::EZS_Both:
		return "EZS_ZClear | EZS_StencilClear";
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Out of range flag value!
	}
#endif
		return "EZS_Unknown";
	}
}

static const char* const TexFormatToString(const eTexFormat fmt)
{
	switch (fmt)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Should never be here!
	}
#endif
		return "UNKNOWN";
	case eTexFmtA8R8G8B8:
		return "A8R8G8B8";
	case eTexFmtX8R8G8B8:
		return "X8R8G8B8";
	case eTexFmtA4R4G4B4:
		return "A4R4G4B4";
	case eTexFmtR5G6B5:
		return "R5G6B5";
	case eTexFmtA1R5G5B5:
		return "A1R5G5B5";
	case eTexFmtX1R5G5B5:
		return "X1R5G5B5";
	case eTexFmtX4R4G4B4:
		return "X4R4G4B4";
	case eTexFmtA8:
		return "A8";
	case eTexFmtL8:
		return "L8";
	case eTexFmtDXT1:
		return "DXT1";
	case eTexFmtDXT3:
		return "DXT3";
	case eTexFmtDXT5:
		return "DXT5";
	}
}

static const unsigned BitsPerTexel(const eTexFormat fmt)
{
	switch (fmt)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Should never be here!
	}
#endif
		return 0;
	case eTexFmtA8R8G8B8:
	case eTexFmtX8R8G8B8:
		return sizeof(D3DCOLOR) * 8;
	case eTexFmtA4R4G4B4:
	case eTexFmtR5G6B5:
	case eTexFmtA1R5G5B5:
	case eTexFmtX1R5G5B5:
	case eTexFmtX4R4G4B4:
		return sizeof(USHORT) * 8;
	case eTexFmtA8:
	case eTexFmtL8:
		return sizeof(BYTE) * 8;
	case eTexFmtDXT1:
		return 4;
	case eTexFmtDXT3:
	case eTexFmtDXT5:
		return 8;
	}
}

static const std::string BlendMaskToString(const eBlendMask blendMask)
{
	if (blendMask == wm_writeNone)
	{
		return "wm_None";
	}
	std::string ret;
	if (blendMask & wm_writeR)
	{
		ret = "wm_R";
	}
	if (blendMask & wm_writeG)
	{
		if (!ret.empty() )
			ret += " | ";
		ret += "wm_G";
	}
	if (blendMask & wm_writeB)
	{
		if (!ret.empty() )
			ret += " | ";
		ret += "wm_B";
	}
	if (blendMask & wm_writeA)
	{
		if (!ret.empty() )
			ret += " | ";
		ret += "wm_A";
	}
	return ret;
}

static const char* const CmpFuncStrings[] =
{
	"cmp_never",
	"cmp_less",
	"cmp_equal",
	"cmp_lessequal",
	"cmp_greater",
	"cmp_notequal",
	"cmp_greaterequal",
	"cmp_always"
};
static const char* const CompareFuncToString(const eCmpFunc cmpFunc)
{
	if (cmpFunc > eCmpFunc::cmp_always)
	{
#ifdef _DEBUG
		__debugbreak(); // Out of bounds comparison func value
#endif
		return "cmp_unknown";
	}
	return CmpFuncStrings[cmpFunc];
}

static const char* const TexFilterStrings[] =
{
	"TF_pointFilter",
	"TF_bilinearFilter",
	"TF_trilinearFilter", // Not yet implemented!
	"TF_anisotropicFilter", // Not yet implemented!
};
static const char* const TexFilterToString(const eTexFilterMode texFilter)
{
	if (texFilter > TF_anisotropicFilter)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Texture Filter is out of range!
#endif
		return "TF_Unknown";
	}
	return TexFilterStrings[texFilter];
}

static const char* const TexAddressModeStrings[] =
{
	"ta_wrap",
	"ta_clamp",
	"ta_mirror", // Not yet implemented!
	"ta_mirrorOnce", // Not yet implemented!
	"ta_border" // Not yet implemented!
};
static const char* const TexAddressToString(const setTextureStateCommand::texAddressMode texAddress)
{
	if (texAddress > setTextureStateCommand::texAddressMode::ta_border)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Texture address mode out of range
#endif
		return "ta_unknown";
	}
	return TexAddressModeStrings[texAddress];
}

static const char TexChannelMUXStrings[] =
{
	'R',
	'G',
	'B',
	'A',
	'0',
	'1'
};
static const char ChannelMUXToChar(const eTexChannelMUX channelMUX)
{
	if (channelMUX >= eTexChannelMUX::tcm_MAX)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Out of range MUX value
#endif
		return 'U';
	}
	return TexChannelMUXStrings[channelMUX];
}

static const char* const CombinerModeStrings[] =
{
	"cbm_allBlack",
	"cbm_allWhite",
	"cbm_textureOnly",
	"cbm_vertexColorOnly",
	"cbm_debugTexcoords",
	"cbm_debugBilinearInterpolants",
	"cbm_textureModulateVertexColor",
	"cbm_debugDepth",
	"cbm_debugStencil"
};
static const char* const CombinerModeToString(const combinerMode combMode)
{
	if (combMode > cbm_debugStencil)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Out of range combiner mode
#endif
		return "cbm_unknown";
	}
	return CombinerModeStrings[combMode];
}

static const char* const WaitFlagStrings[] =
{
	"waitForVSIdle", // Waits for the vertex shader to have no work remaining
	"waitForIAIdle", // Waits for the input assembler to have no work remaining
	"waitForClipIdle", // Waits for the clipper unit to have no work remaining
	"waitForTriSetupIdle", // Waits for the TriSetup block to have no work remaining
	"waitForRasterizerIdle", // Waits for the triangle rasterizer to have no work remaining
	"waitForDepthInterpolatorIdle", // Waits for the depth interpolator to have no more pixels in flight
	"waitForDepthBuffer", // Waits for the depth buffer clear to have completed and for the depth buffer to have no in-flight pixels remaining
	"waitForAttrInterpolatorIdle", // Waits for the attribute interpolator to have no more pixels in flight
	"waitForTexSamplerIdle", // Waits for the texture samplers to have no work remaining
	"waitForROPIdle", // Waits for the ROP's to have no work remaining
	"waitForClearBlockIdle", // Waits for the clear block to finish clearing a rendertarget
	"waitForMemControllerIdle", // Waits for all DRAM reads/writes to have flushed
	"waitForVSync" // Waits for the scanout module to reach VSync
};
static const std::string WaitFlagsToString(const waitForDeviceIdleCommand::waitForDeviceSubsystem waitFlags)
{
	if (waitFlags > waitForDeviceIdleCommand::waitForDeviceSubsystem::waitForFullPipelineFlushAndVSync)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Out of range wait flags
#endif
		return "waitUnknown";
	}
	else if (waitFlags == 0)
		return "waitForNothing";
	else if (waitFlags == waitForDeviceIdleCommand::waitForDeviceSubsystem::waitForFullPipelineFlush)
		return "waitForFullPipelineFlush";
	else if (waitFlags == waitForDeviceIdleCommand::waitForDeviceSubsystem::waitForFullPipelineFlushAndVSync)
		return "waitForFullPipelineFlushAndVSync";
	std::string ret;
	for (unsigned x = 0; x < ARRAYSIZE(WaitFlagStrings); ++x)
	{
		if (waitFlags & (1 << x) )
		{
			if (!ret.empty() )
				ret += " | ";
			ret += WaitFlagStrings[x];
		}
	}
	return ret;
}

static const char* const PrimTopologyStrings[] =
{
	"PointList", // Not yet implemented
	"LineList", // Not yet implemented
	"LineStrip", // Not yet implemented
	"TriangleList",
	"TriangleStrip",
	"TriangleFan",
	"ScreenAlignedQuad" // Not yet implemented
};
static const char* const PrimTopologyToString(const ePrimTopology primTopology)
{
	if (primTopology >= primTop_NUM_PRIM_TOPOLOGIES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Primitive topology is out of range!
#endif
		return "Unknown";
	}
	return PrimTopologyStrings[primTopology];
}

static const char* const ScanoutColorChannelStrings[] =
{
	"Red",
	"Green",
	"Blue",
	"Alpha",
	"Black",
	"White"
};
static const char* const ScanoutColorChannelToString(const setScanoutPointerCommand::eDisplayChannelSwizzle channelSwizzle)
{
	if (channelSwizzle >= setScanoutPointerCommand::eDisplayChannelSwizzle::dcs_MAX_ITEMS)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Out of range channel swizzle
#endif
		return "Unknown";
	}
	return ScanoutColorChannelStrings[channelSwizzle];
}

static const char* const DisplayModeStrings[] =
{
	"640x480 @ 60Hz",
	"800x600 @ 60Hz",
	"1024x768 @ 60Hz",
	"1280x1024 @ 60Hz",
	"1600x1200 @ 60Hz"
};
static const char* const DisplayModeToString(const setScanoutPointerCommand::eDisplayMode displayMode)
{
	if (displayMode >= setScanoutPointerCommand::eDisplayMode::DISPLAYMODE_MAX_COUNT)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Display mode out of range!
#endif
		return "Unknown";
	}
	return DisplayModeStrings[displayMode];
}

static const char* const CullModeStrings[] =
{
	"cullCCW",
	"cullCW",
	"cullNone",
	"cullBoth"
};
static const char* const CullModeToString(const eCullMode cullMode)
{
	if (cullMode >= eCullMode_NUM_CULL_MODES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Cull mode out of range!
#endif
		return "cullUnknown";
	}
	return CullModeStrings[cullMode];
}

static const char* const StripCutStrings[] =
{
	"sct_CutDisabled",
	"sct_Cut0xFFFF",
	"sct_Cut0xFFFFFFFF"
};
static const char* const StripCutToString(const eStripCutType stripCutMode)
{
	if (stripCutMode >= sct_NUM_STRIP_CUT_TYPES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Strip cut mode out of range!
#endif
		return "sct_Unknown";
	}
	return StripCutStrings[stripCutMode];
}

static const char* const IndexFormatStrings[] =
{
	"noIndices",
	"index8", // Not yet implemented
	"index16",
	"index32"
};
static const char* const IndexFormatToString(const eIndexFormat indexFmt)
{
	if (indexFmt >= ibfmt_NUM_INDEX_FORMATS)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Index format out of range!
#endif
		return "unknown";
	}
	return IndexFormatStrings[indexFmt];
}

static const char* const UsageStrings[] =
{
	"POSITION",
	"TEXCOORD",
	"COLOR",
	"NORMAL",
	"BLENDWEIGHT",
	"BLENDINDICES",
	"PSIZE",
	"FOG"
};
static const char* const UsageTypeToString(const eInputUsageType usageType)
{
	if (usageType > UT_Fog)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Usage type is out of range!
#endif
		return "UNKNOWN";
	}
	return UsageStrings[usageType];
}

static const char* const DepthFormatStrings[] =
{
	"D24",
	"D16",
	"D15"
};
static const char* const DepthFormatToString(const eDepthFormat depthFormat)
{
	if (depthFormat > eDepthFmtD15)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Depth format is out of range!
#endif
		return "DUnknown";
	}
	return DepthFormatStrings[depthFormat];
}

// Swizzles from RGBA -> BGRA keeping everything as a DWORD (not converting to float and then converting back)
static inline const D3DCOLOR D3DColorToRGBAColor(const DWORD inColorBGRA)
{
	const unsigned char r = (const unsigned char)(inColorBGRA & 0xFF);
	const unsigned char g = (const unsigned char)( (inColorBGRA >> 8) & 0xFF);
	const unsigned char b = (const unsigned char)( (inColorBGRA >> 16) & 0xFF);
	const unsigned char a = (const unsigned char)( (inColorBGRA >> 24) & 0xFF);

	return D3DCOLOR_ARGB(a, r, g, b);
}

static const float ShaderConstantSpecialsTable[] =
{
	0.0f, // zero
	3.1415926535897932384626433832795f, // pi
	2.7182818284590452353602874713527f, // e
	6.283185307179586476925286766559f, // 2 * pi
	255.0f, // 0xFF
	1.0f / 255.0f // 1.0 / 0xFF
};
static const float DecodeShaderConstantSpecial(const bool isNegative, const bool isPowerOf2, const bool isSpecial, const unsigned specIndex)
{
	float ret;
	if (isPowerOf2 == isSpecial)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Exactly one of "isPowerOf2" or "isSpecial" needs to be set!
#endif
		return 0.0f;
	}
	if (isPowerOf2)
	{
		if (specIndex >= 8)
			ret = (const float)(1 << (specIndex - 8) );
		else
			ret = (const float)(1.0f / (8 - specIndex) );
	}
	else
	{
		if (specIndex > 5)
		{
#ifdef _DEBUG
			__debugbreak(); // Error: Special index is out of range!
#endif
			ret = 0.0f;
		}
		ret = ShaderConstantSpecialsTable[specIndex];
	}
	if (isNegative)
		ret *= -1.0f;
	return ret;
}

struct blendStateBitsStruct
{
	blendModeSourcesRGB blendModeSrcRGB : 3;
	unsigned blendModeSrcRGBInvert : 1;
	blendModeSourcesRGB blendModeDestRGB : 3;
	unsigned blendModeDestRGBInvert : 1;
	blendOp blendOpRGB : 3;

	blendModeSourcesA blendModeSrcA : 2;
	unsigned blendModeSrcAInvert : 1;
	blendModeSourcesA blendModeDestA : 2;
	unsigned blendModeDestAInvert : 1;
	blendOp blendOpA : 3;

	unsigned doLoadSrcColor : 1; // Should the ROP unit load the incoming pixel (src) data?
	unsigned doLoadDestColor : 1; // Should the ROP unit load the existing framebuffer pixel (dest) data? (This one is a big bandwidth savings if it's computed as 0)

	unsigned unusedPadding : 10; // Paddded to be DWORD-aligned
};

static const char* const BlendSourceRGBToString(const blendModeSourcesRGB blendSource, const bool isInverted)
{
	switch (blendSource)
	{
	default:
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Blend source out of range!
#endif
		return "Unknown";
	}
	case blendRGB_0: // 0
		return isInverted ? "One" : "Zero";
	case blendRGB_srcColor: // 1
		return isInverted ? "OneMinusSrcColor" : "SrcColor";
	case blendRGB_srcAlpha: // 2
		return isInverted ? "OneMinusSrcAlpha" : "SrcAlpha";
	case blendRGB_destAlpha: // 3
		return isInverted ? "OneMinusDestAlpha" : "DestAlpha";
	case blendRGB_destColor: // 4
		return isInverted ? "OneMinusDestColor" : "DestColor";
	case blendRGB_srcAlphaSat: // 5
		return isInverted ? "OneMinusSrcAlphaSat" : "SrcAlphaSat";
	case blendRGB_blendFactor: // 6
		return isInverted ? "OneMinusBlendFactor" : "BlendFactor";
	}
}

static const char* const BlendSourceAlphaToString(const blendModeSourcesA blendSource, const bool isInverted)
{
	switch (blendSource)
	{
	default:
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Blend source out of range!
#endif
		return "Unknown";
	}
	case blendA_0: // 0
		return isInverted ? "One" : "Zero";
	case blendA_srcAlpha: // 1
		return isInverted ? "OneMinusSrcAlpha" : "SrcAlpha";
	case blendA_destAlpha: // 2
		return isInverted ? "OneMinusDestAlpha" : "DestAlpha";
	case blendA_blendFactor: // 3
		return isInverted ? "OneMinusBlendFactor" : "BlendFactor";
	}
}

static const char* const BlendOpStrings[] = 
{
	"Add",
	"Subtract",
	"ReverseSubtract",
	"Min",
	"Max"
};
static const char* const BlendOpToString(const blendOp blendOperation)
{
	if (blendOperation > bop_max)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return "Unknown";
	}
	return BlendOpStrings[blendOperation];
}

static const char* const QueryTypeStrings[] =
{
	"Event",
	"Occlusion",
	"Binary Occlusion",
	"Timestamp"
};
static const char* const QueryTypeToString(const eQueryType queryType)
{
	if (queryType > eQTTimestamp)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Query type is out of range!
#endif
		return "Unknown";
	}
	return QueryTypeStrings[queryType];
}

static const char* const TexAddressingModeStrings[] =
{
	"Wrap",
	"Clamp",
	"Mirror",
	"BorderColor",
	"MirrorOnce"
};
static const char* const TexAddressingModeToString(const eTexcoordAddressingMode texAddrMode)
{
	if (texAddrMode >= eTexcoordAddressingMode_NUM_ADDR_MODES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Tex addressing mode is out of range!
#endif
		return "Unknown";
	}
	return TexAddressingModeStrings[texAddrMode];
}

static const char* const StatsSystemStrings[] =
{
	"Null",
	"IA",
	"TriSetup",
	"Rasterizer",
	"AttributeInterpolator",
	"TextureSampler",
	"ROP",
	"CommandProcessor",
	"MemorySystemRead",
	"MemorySystemWrite",
	"ScanOut"
};
static const char* const StatsSystemToString(const endFrameStatsResponse::eSystemType statsSystem)
{
	if (statsSystem >= endFrameStatsResponse::eSystemType::ST_MAX_NUM_SYSTEM_TYPES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: System type is out of range!
#endif
		return "Unknown";
	}
	return StatsSystemStrings[statsSystem];
}

static const char* const StatsMetricSpaceStrings[] =
{
	"UnknownMetrics",
	"TimeMetrics",
	"CounterStatMetrics"
};
static const char* const StatsMetricSpaceToString(const endFrameStatsResponse::eMetricSpace metricSpace)
{
	if (metricSpace >= endFrameStatsResponse::eMetricSpace::MS_MAX_NUM_METRIC_SPACES)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Metric space is out of range!
#endif
		return "Unknown";
	}
	return StatsMetricSpaceStrings[metricSpace];
}

static void PrintCommandListLine(std::string& outAppendString, const unsigned char indent, _In_z_ _Printf_format_string_ const char* const formatString, ...)
{
	char tempBuffer[256];
	for (unsigned char x = 0; x < indent; ++x)
		tempBuffer[x] = '\t';
	va_list varArgs = {0};
	va_start(varArgs, formatString);
	vsprintf_s(tempBuffer + indent, sizeof(tempBuffer) - indent, formatString, varArgs);
	va_end(varArgs);
	outAppendString += tempBuffer;
}

static void DisassemblePacket(std::vector<const std::string*>& outDisassembledPackets, const genericCommand* const packetPtr, const bool disassembleReferencedCommandLists, const unsigned char baseIndentation = 0, const bool extraDetails = false)
{
	if (packetPtr->type >= command::PT_MAX_PACKET_TYPES)
	{
		printf("Error disassembling packet - packet type %u is unknown/out of bounds\n", packetPtr->type);
#ifdef _DEBUG
		__debugbreak(); // Error: Out of bounds packet type. This indicates either a corrupt command buffer, or a new packet type wasn't added to this switch-case!
#endif
		return;
	}

#ifdef _DEBUG
	if (baseIndentation > 7)
	{
		__debugbreak(); // Error: Should never be hitting indentation scopes this deep! Possible recursion bug!
	}
#endif

	const char* const packetTypeString = packetTypeStrings[packetPtr->type];
	std::string* ret;
	{
		char tempBuffer[128];
		for (unsigned char x = 0; x < baseIndentation; ++x)
			tempBuffer[x] = '\t';
		sprintf_s(tempBuffer + baseIndentation, sizeof(tempBuffer) - baseIndentation, "[%s]\n", packetTypeString);
		ret = new std::string(tempBuffer);
	}

	outDisassembledPackets.push_back(ret);

	const unsigned char packetMemberIndentation = baseIndentation + 1;

	switch (packetPtr->type)
	{
	default:
		printf("Warning: Packet type %s does not have disassembly for it!\n", packetTypeString);
		break;
	case command::PT_DONOTHING:
	{
		if (extraDetails)
		{
			const doNothingCommand* const typedPacket = (const doNothingCommand* const)packetPtr;
			PrintCommandListLine(*ret, packetMemberIndentation, "Padding0: 0x%08X\n", typedPacket->padding0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Padding1: 0x%08X\n", typedPacket->padding1);
		}
	}
		break;
	case command::PT_WRITEMEM:
	{
		const writeMemCommand* const typedPacket = (const writeMemCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Write Address (VRAM): 0x%08X\n", typedPacket->writeDWORDAddr);
		PrintCommandListLine(*ret, packetMemberIndentation, "Write Value: 0x%08X (%f)\n", typedPacket->writeVal, *(const float* const)&(typedPacket->writeVal) );
	}
		break;
	case command::PT_READMEM:
	{
		const readMemCommand* const typedPacket = (const readMemCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Read Address Base (VRAM): 0x%08X\n", typedPacket->readDWORDAddr);
		PrintCommandListLine(*ret, packetMemberIndentation, "DWORD Select: %u\n", typedPacket->dwordSelect);
		PrintCommandListLine(*ret, packetMemberIndentation, "Final Read Address: 0x%08X\n", typedPacket->readDWORDAddr + typedPacket->dwordSelect * sizeof(DWORD) );
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Padding Bits: 0x%08X\n", typedPacket->paddingBits);
		}
	}
		break;
	case command::PT_READMEMRESPONSE:
	{
		const readMemResponse* const typedPacket = (const readMemResponse* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Read Address (VRAM): 0x%08X\n", typedPacket->readDWORDAddr);
		PrintCommandListLine(*ret, packetMemberIndentation, "Read Value: 0x%08X (%f)\n", typedPacket->value, *(const float* const)&(typedPacket->value) );
	}
		break;
	case command::PT_CLEARMEM:
	{
		const clearMemCommand* const typedPacket = (const clearMemCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Base Clear Begin Address (VRAM): 0x%08X\n", typedPacket->writeDWORDAddr);
		PrintCommandListLine(*ret, packetMemberIndentation, "Clear Bytes: %u (%u lines x %u bytes per DRAM line)\n", typedPacket->clearNumDRAMLines * GPU_DRAM_TRANSACTION_SIZE_BYTES, typedPacket->clearNumDRAMLines, GPU_DRAM_TRANSACTION_SIZE_BYTES);
		PrintCommandListLine(*ret, packetMemberIndentation, "Clear Value: %s (%u)\n", ClearValueToString(typedPacket->clearValue), typedPacket->clearValue);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Padding Byte: 0x%02X\n", typedPacket->paddingByte);
		}
	}
		break;
	case command::PT_CLEARBACKBUFFER:
	{
		const clearBackbufferCommand* const typedPacket = (const clearBackbufferCommand* const)packetPtr;
		const D3DCOLOR clearColor = D3DColorToRGBAColor(typedPacket->writeColorRGBA);
		PrintCommandListLine(*ret, packetMemberIndentation, "Backbuffer Address (VRAM): 0x%08X\n", typedPacket->renderTargetAddress);
		PrintCommandListLine(*ret, packetMemberIndentation, "Clear Color: 0x%08X (R:%u, G:%u, B:%u, A:%u)\n", typedPacket->writeColorRGBA, (clearColor >> 16) & 0xFF, (clearColor >> 8) & 0xFF, clearColor & 0xFF, (clearColor >> 24) & 0xFF);
	}
		break;
	case command::PT_CLEARZSTENCILBUFFER:
	{
		const clearZStencilCommand* const typedPacket = (const clearZStencilCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "ZStencil Clear Flags: %s (%u)\n", ClearZStencilFlagsToString(typedPacket->clearType), typedPacket->clearType);
		if ( (typedPacket->clearType & clearZStencilCommand::eZSType::EZS_ZClear) || extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Z Clear Value: %f (0x%08X)\n", *(const float* const)&(typedPacket->writeZValue), typedPacket->writeZValue);
		}
		if ( (typedPacket->clearType & clearZStencilCommand::eZSType::EZS_StencilClear) || extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Stencil Clear Value: 0x%02X\n", typedPacket->writeStencilValue);
		}
	}
		break;
	case command::PT_SETVIEWPORTPARAMSXY:
	{
		const setViewportStateXYCommand* const typedPacket = (const setViewportStateXYCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Viewport X Offset: %f (0x%08X)\n", typedPacket->viewportXOffset, *(const DWORD* const)&(typedPacket->viewportXOffset) );
		PrintCommandListLine(*ret, packetMemberIndentation, "Viewport Y Offset: %f (0x%08X)\n", typedPacket->viewportYOffset, *(const DWORD* const)&(typedPacket->viewportYOffset) );
	}
		break;
	case command::PT_LOADTEXCACHEDATA:
	{
		const loadTexCacheDataCommand* const typedPacket = (const loadTexCacheDataCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Load Source Address: 0x%08X\n", typedPacket->sourceRAMAddr);
		PrintCommandListLine(*ret, packetMemberIndentation, "Texture Format: %s (%u) (%ubpp)\n", TexFormatToString(typedPacket->loadSourceFormat), typedPacket->loadSourceFormat, BitsPerTexel(typedPacket->loadSourceFormat) );
		PrintCommandListLine(*ret, packetMemberIndentation, "Texel Count: %u (%u bytes)\n", typedPacket->loadTexelCount, (BitsPerTexel(typedPacket->loadSourceFormat) * typedPacket->loadTexelCount) / 8);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Padding: 0x%02X\n", typedPacket->unused);
		}
	}
		break;
	case command::PT_SETALPHATESTANDRTADDRESSSTATE:
	{
		const setAlphaTestAndRTAddressStateCommand* const typedPacket = (const setAlphaTestAndRTAddressStateCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Render Target Address (0x%08X)\n", typedPacket->renderTargetBaseAddress);
		const std::string writeMaskString = BlendMaskToString(typedPacket->writeMask);
		PrintCommandListLine(*ret, packetMemberIndentation, "Write Mask: %s (%u)\n", writeMaskString.c_str(), typedPacket->writeMask);
		PrintCommandListLine(*ret, packetMemberIndentation, "Alpha Test: %s (%u)\n", typedPacket->alphaTestEnabled ? "Enabled" : "Disabled", typedPacket->alphaTestEnabled);
		if (typedPacket->alphaTestEnabled || extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Alpha Test Ref Val: 0x%02X\n", typedPacket->alphaTestRefValue);
			PrintCommandListLine(*ret, packetMemberIndentation, "Alpha Test Compare Func: %s (%u)\n", CompareFuncToString(typedPacket->alphaTestFunc), typedPacket->alphaTestFunc);
		}
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: %u\n", typedPacket->unused0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: %s (%u)\n", typedPacket->unused1 ? "true" : "false", typedPacket->unused1);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused2: %s (%u)\n", typedPacket->unused2 ? "true" : "false", typedPacket->unused2);
			PrintCommandListLine(*ret, packetMemberIndentation, "UnusedBits: 0x%02X\n", typedPacket->unusedBits);
		}
	}
		break;
	case command::PT_SETTEXTURESTATE:
	{
		const setTextureStateCommand* const typedPacket = (const setTextureStateCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Tex Width: %u (Log2: %u)\n", 1 << typedPacket->texWidthLog2, typedPacket->texWidthLog2);
		PrintCommandListLine(*ret, packetMemberIndentation, "Tex Height: %u (Log2: %u)\n", 1 << typedPacket->texHeightLog2, typedPacket->texHeightLog2);
		PrintCommandListLine(*ret, packetMemberIndentation, "Tex Filter: %s (%u)\n", TexFilterToString(typedPacket->filterMode), typedPacket->filterMode);
		PrintCommandListLine(*ret, packetMemberIndentation, "Address Mode U: %s (%u)\n", TexAddressToString(typedPacket->addressU), typedPacket->addressU);
		PrintCommandListLine(*ret, packetMemberIndentation, "Address Mode V: %s (%u)\n", TexAddressToString(typedPacket->addressV), typedPacket->addressV);
		PrintCommandListLine(*ret, packetMemberIndentation, "Channels Swizzle: { %c, %c, %c, %c } (%u, %u, %u, %u)\n", ChannelMUXToChar(typedPacket->channel0), 
			ChannelMUXToChar(typedPacket->channel1), 
			ChannelMUXToChar(typedPacket->channel2), 
			ChannelMUXToChar(typedPacket->channel3), 
			typedPacket->channel0,
			typedPacket->channel1,
			typedPacket->channel2,
			typedPacket->channel3);
		PrintCommandListLine(*ret, packetMemberIndentation, "RGB Combiner Mode: %s (%u)\n", CombinerModeToString(typedPacket->cbModeColor), typedPacket->cbModeColor);
		PrintCommandListLine(*ret, packetMemberIndentation, "Alpha Combiner Mode: %s (%u)\n", CombinerModeToString(typedPacket->cbModeAlpha), typedPacket->cbModeAlpha);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x%02X\n", typedPacket->unused0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: 0x%02X\n", typedPacket->unused1);
		}
	}
		break;
	case command::PT_WAITFORDEVICEIDLE:
	{
		const waitForDeviceIdleCommand* const typedPacket = (const waitForDeviceIdleCommand* const)packetPtr;
		const std::string waitFlagsString = WaitFlagsToString(typedPacket->waitBitmask);
		PrintCommandListLine(*ret, packetMemberIndentation, "Wait Flags: %s (0x%04X)\n", waitFlagsString.c_str(), typedPacket->waitBitmask);
		PrintCommandListLine(*ret, packetMemberIndentation, "Notify CPU When Complete: %s (%u)\n", typedPacket->returnCPUValue ? "yes" : "no", typedPacket->returnCPUValue);
		if (typedPacket->returnCPUValue || extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "CPU Return Value: 0x%08X\n", typedPacket->returnValueToCPU);
		}
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x%08X\n", typedPacket->unused0);
		}
	}
		break;
	case command::PT_WAITRESPONSE:
	{
		const waitResponse* const typedPacket = (const waitResponse* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Wait Return Value: 0x%08X\n", typedPacket->value);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x%08X\n", typedPacket->unused);
		}
	}
		break;
	case command::PT_DRAWINDEXED:
	{
		const drawIndexedCommand* const typedPacket = (const drawIndexedCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Draw Type: %s (%u)\n", typedPacket->isIndexedDrawCall ? "Indexed" : "Non-Indexed", typedPacket->isIndexedDrawCall);
		PrintCommandListLine(*ret, packetMemberIndentation, "Primitive Count: %u\n", typedPacket->numPrimitivesToDraw);
		PrintCommandListLine(*ret, packetMemberIndentation, "Primitive Topology: %s (%u)\n", PrimTopologyToString( (const ePrimTopology)(typedPacket->primTopology) ), typedPacket->primTopology);
		PrintCommandListLine(*ret, packetMemberIndentation, typedPacket->isIndexedDrawCall ? "Starting Index: %u\n" : "\tStarting Vertex: %u\n", typedPacket->ExtractStartIndex() );
		if (typedPacket->isIndexedDrawCall || extraDetails)
		{	
			PrintCommandListLine(*ret, packetMemberIndentation, "Base Vertex Index: %i\n", typedPacket->ExtractBaseVertexIndex() );
		}
	}
		break;
	case command::PT_SETSCANOUTPOINTER:
	{
		const setScanoutPointerCommand* const typedPacket = (const setScanoutPointerCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Scanout Enable: %s (%u)\n", typedPacket->scanoutEnable ? "Enabled" : "Disabled", typedPacket->scanoutEnable);
		PrintCommandListLine(*ret, packetMemberIndentation, "Color Inversion: %s (%u)\n", typedPacket->invertColor ? "Inverted" : "Standard", typedPacket->invertColor);
		PrintCommandListLine(*ret, packetMemberIndentation, "Channel Swizzle: (%s, %s, %s) (%u, %u, %u)\n", 
			ScanoutColorChannelToString( (const setScanoutPointerCommand::eDisplayChannelSwizzle)typedPacket->channelSwizzleR), 
			ScanoutColorChannelToString( (const setScanoutPointerCommand::eDisplayChannelSwizzle)typedPacket->channelSwizzleG), 
			ScanoutColorChannelToString( (const setScanoutPointerCommand::eDisplayChannelSwizzle)typedPacket->channelSwizzleB),
			typedPacket->channelSwizzleR,
			typedPacket->channelSwizzleG,
			typedPacket->channelSwizzleB);
		PrintCommandListLine(*ret, packetMemberIndentation, "Display Mode: %s (%u)\n", DisplayModeToString(typedPacket->displayMode), typedPacket->displayMode);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: %u\n", typedPacket->unused0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: %u\n", typedPacket->unused1);
		}
	}
		break;
	case command::PT_SETIASTATE:
	{
		const setIAStateCommand* const typedPacket = (const setIAStateCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Primitive Topology: %s (%u)\n", PrimTopologyToString(typedPacket->topology), typedPacket->topology);
		PrintCommandListLine(*ret, packetMemberIndentation, "Cull Mode: %s (%u)\n", CullModeToString(typedPacket->cull), typedPacket->cull);
		PrintCommandListLine(*ret, packetMemberIndentation, "Triangle Strip Cut: %s (%u)\n", StripCutToString(typedPacket->stripCut), typedPacket->stripCut);
		PrintCommandListLine(*ret, packetMemberIndentation, "Index Format: %s (%u)\n", IndexFormatToString(typedPacket->indexFmt), typedPacket->indexFmt);
		if (typedPacket->indexFmt > ibfmt_noIndices || extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Index Buffer Base Address: 0x%08X\n", typedPacket->IBBaseAddr);
		}
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused2: %u\n", typedPacket->unused2);
		}
	}
		break;
	case command::PT_FLUSHROPCACHE:
	{
		const flushROPCacheCommand* const typedPacket = (const flushROPCacheCommand* const)packetPtr;
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x%08X\n", typedPacket->unused0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: 0x%08X\n", typedPacket->unused1);
		}
	}
		break;
	case command::PT_ENDFRAMESTATS:
	{
		const endFrameStatsResponse* const typedPacket = (const endFrameStatsResponse* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Stats System: %s (%u)\n", StatsSystemToString(typedPacket->system), typedPacket->system);
		PrintCommandListLine(*ret, packetMemberIndentation, "Stats System Metric ID: %u\n", typedPacket->systemMetricID);
		PrintCommandListLine(*ret, packetMemberIndentation, "Stats Metric Space: %s (%u)\n", StatsMetricSpaceToString(typedPacket->metricsType), typedPacket->metricsType);
		PrintCommandListLine(*ret, packetMemberIndentation, "Frame ID: %u\n", typedPacket->frameID);
		PrintCommandListLine(*ret, packetMemberIndentation, "Stat Value: 0x%08X (%u)\n", typedPacket->value, typedPacket->value);
	}
		break;
	case command::PT_ENDFRAME:
	{
		const endFrameCommand* const typedPacket = (const endFrameCommand* const)packetPtr;
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x%08X\n", typedPacket->unused0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1bool: 0x%02X\n", typedPacket->unused1bool);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: 0x%02X%02X%02X\n", typedPacket->unused1[2], typedPacket->unused1[1], typedPacket->unused1[0]);
		}
	}
		break;
	case command::PT_RUNCOMMANDLIST:
	{
		const runCommandListCommand* const typedPacket = (const runCommandListCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Command List Start Address: 0x%08X\n", typedPacket->commandListStartAddress);
		const unsigned commandListSizeBytes = (typedPacket->numCommands + (numSimplifiedPacketsPerDRAMLine - 1) ) / numSimplifiedPacketsPerDRAMLine * sizeof(dramLinePackedPacket);
		PrintCommandListLine(*ret, packetMemberIndentation, "Command Count: %u (%u bytes)\n", typedPacket->numCommands, commandListSizeBytes);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: 0x%04X\n", typedPacket->unused1);
		}

		PrintCommandListLine(*ret, packetMemberIndentation, "[Inner Command List]\n");
		if (disassembleReferencedCommandLists)
		{
			for (unsigned innerCommandID = 0; innerCommandID < typedPacket->numCommands; ++innerCommandID)
			{
				genericCommand innerCommandListPacket;
				if (commandListResolveCallback( (const gpuvoid* const)(typedPacket->commandListStartAddress), innerCommandID, innerCommandListPacket) )
				{
					// Because of our command list recording rules that disallow recording a PT_RUNCOMMANDLIST packet inside of another command list, we should never run into a case of runaway recursion
					DisassemblePacket(outDisassembledPackets, &innerCommandListPacket, false, packetMemberIndentation, extraDetails);
				}
				else
				{
					printf("Error: Failed to locate inner command packetID %u for inner command list GPUAddress 0x%08X\n", innerCommandID, typedPacket->commandListStartAddress);
#ifdef _DEBUG
					__debugbreak(); // Bad! This should never happen!
#endif
				}
			}
		}
	}
		break;
	case command::PT_LOADSHADERINSTRUCTIONS:
	{
		const loadShaderInstructionsCommand* const typedPacket = (const loadShaderInstructionsCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Shader Start Address: 0x%08X\n", typedPacket->shaderStartAddress);
		PrintCommandListLine(*ret, packetMemberIndentation, "Shader Length: %u tokens (%u bytes)\n", typedPacket->shaderLengthTokens, typedPacket->shaderLengthTokens * sizeof(instructionSlot) );
		PrintCommandListLine(*ret, packetMemberIndentation, "Shader Cache Load Offset: 0x%04X tokens/slots\n", typedPacket->shaderLoadTargetOffset);
	}
		break;
	case command::PT_SETSHADERCONSTANT:
	{
		const setShaderConstantCommand* const typedPacket = (const setShaderConstantCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Constant Data Load Address: 0x%08X\n", typedPacket->constantDataPointer);
		PrintCommandListLine(*ret, packetMemberIndentation, "Base Register Index: c%u\n", typedPacket->constantBaseRegisterIndex);
		PrintCommandListLine(*ret, packetMemberIndentation, "Float4 Register Load Count: %u (%u bytes)\n", typedPacket->numFloat4Registers, typedPacket->numFloat4Registers * sizeof(float) * 4);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x%04X\n", typedPacket->unused0);
		}
	}
		break;
	case command::PT_SETVERTEXSTREAMDATA:
	{
		const setVertexStreamDataCommand* const typedPacket = (const setVertexStreamDataCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Vertex Stream ID: %u\n", typedPacket->streamID);
		PrintCommandListLine(*ret, packetMemberIndentation, "Vertex Stream Base Address: 0x%08X\n", typedPacket->streamBaseAddress);
		PrintCommandListLine(*ret, packetMemberIndentation, "Stream Stride: %u bytes\n", typedPacket->dwordStride * sizeof(DWORD) );
		PrintCommandListLine(*ret, packetMemberIndentation, "Stream Offset: %u bytes\n", typedPacket->dwordOffset * sizeof(DWORD) );
		PrintCommandListLine(*ret, packetMemberIndentation, "Num Vertex Streams: %u\n", typedPacket->numVertexStreamsTotal);
		PrintCommandListLine(*ret, packetMemberIndentation, "Element DWORD Count: %u (%u bytes per element)\n", typedPacket->dwordCount + 1, sizeof(DWORD) * (typedPacket->dwordCount + 1) );
		PrintCommandListLine(*ret, packetMemberIndentation, "Element Type: %s (%u)\n", typedPacket->isD3DCOLOR ? "D3DCOLOR" : "FLOAT");
		PrintCommandListLine(*ret, packetMemberIndentation, "Input Register Index: v%u\n", typedPacket->shaderInputRegIndex);
		PrintCommandListLine(*ret, packetMemberIndentation, "Element Usage: %s%u\n", UsageTypeToString(typedPacket->inputUsage), typedPacket->inputUsageIndex);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x%02X\n", typedPacket->unused0);
		}
	}
		break;
	case command::PT_SETSTATSEVENTCONFIG:
	{
		const setStatsEventConfigCommand* const typedPacket = (const setStatsEventConfigCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Config Type: %s (%u)\n", typedPacket->enableEventRecording ? "EVENTS" : "STATS", typedPacket->enableEventRecording);
		PrintCommandListLine(*ret, packetMemberIndentation, "%s Buffer Write Address: 0x%08X\n", typedPacket->enableEventRecording ? "Events" : "Stats", typedPacket->eventsOrStatsAddress);
		if (typedPacket->enableEventRecording || extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Events Ordering Buffer Write Address: 0x%08X\n", typedPacket->eventOrdersAddress);
		}
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: %u\n", typedPacket->unused0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: %u\n", typedPacket->unused1);
		}
	}
		break;
	case command::PT_SETSHADERCONSTANTSPECIAL:
	{
		const setShaderConstantSpecialCommand* const typedPacket = (const setShaderConstantSpecialCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Const Register Index: c%u\n", typedPacket->shaderRegIndex);
		PrintCommandListLine(*ret, packetMemberIndentation, "Register Value: {%f, %f, %f, %f}\n", 
			DecodeShaderConstantSpecial(typedPacket->isXNegative, typedPacket->isXPow2, typedPacket->isXSpec, typedPacket->XIndex),
			DecodeShaderConstantSpecial(typedPacket->isYNegative, typedPacket->isYPow2, typedPacket->isYSpec, typedPacket->YIndex),
			DecodeShaderConstantSpecial(typedPacket->isZNegative, typedPacket->isZPow2, typedPacket->isZSpec, typedPacket->ZIndex),
			DecodeShaderConstantSpecial(typedPacket->isWNegative, typedPacket->isWPow2, typedPacket->isWSpec, typedPacket->WIndex) );
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "X Sign: %s (%u)\n", typedPacket->isXNegative ? "Negative" : "Positive", typedPacket->isXNegative);
			PrintCommandListLine(*ret, packetMemberIndentation, "X Special Type: %s\n", typedPacket->isXPow2 ? "Pow2" : typedPacket->isXSpec ? "Special" : "Unknown");
			PrintCommandListLine(*ret, packetMemberIndentation, "X Special Index: %u\n", typedPacket->XIndex);
			PrintCommandListLine(*ret, packetMemberIndentation, "Y Sign: %s (%u)\n", typedPacket->isYNegative ? "Negative" : "Positive", typedPacket->isYNegative);
			PrintCommandListLine(*ret, packetMemberIndentation, "Y Special Type: %s\n", typedPacket->isYPow2 ? "Pow2" : typedPacket->isYSpec ? "Special" : "Unknown");
			PrintCommandListLine(*ret, packetMemberIndentation, "Y Special Index: %u\n", typedPacket->YIndex);
			PrintCommandListLine(*ret, packetMemberIndentation, "Z Sign: %s (%u)\n", typedPacket->isZNegative ? "Negative" : "Positive", typedPacket->isZNegative);
			PrintCommandListLine(*ret, packetMemberIndentation, "Z Special Type: %s\n", typedPacket->isZPow2 ? "Pow2" : typedPacket->isZSpec ? "Special" : "Unknown");
			PrintCommandListLine(*ret, packetMemberIndentation, "Z Special Index: %u\n", typedPacket->ZIndex);
			PrintCommandListLine(*ret, packetMemberIndentation, "W Sign: %s (%u)\n", typedPacket->isWNegative ? "Negative" : "Positive", typedPacket->isWNegative);
			PrintCommandListLine(*ret, packetMemberIndentation, "W Special Type: %s\n", typedPacket->isWPow2 ? "Pow2" : typedPacket->isWSpec ? "Special" : "Unknown");
			PrintCommandListLine(*ret, packetMemberIndentation, "W Special Index: %u\n", typedPacket->WIndex);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x04X\n", typedPacket->unused0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: 0x06X\n", typedPacket->unused1);
		}
	}
		break;
	case command::PT_SETSHADERSTARTADDRESS:
	{
		const setShaderStartAddressCommand* const typedPacket = (const setShaderStartAddressCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Shader Start Address: 0x%04X\n", typedPacket->shaderStartAddress);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x%06X\n", typedPacket->unused0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: 0x%08X\n", typedPacket->unused1);
		}
	}
		break;
	case command::PT_DEBUGSHADERNEXTDRAWCALL:
	{
		const debugShaderNextDrawCallCommand* const typedPacket = (const debugShaderNextDrawCallCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Dump Registers Address: 0x%04X\n", typedPacket->dumpRegistersAddress);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: %u\n", typedPacket->unused0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: 0x%08X\n", typedPacket->unused1);
		}
	}
		break;
	case command::PT_SETDEPTHSTATE:
	{
		const setDepthStateCommand* const typedPacket = (const setDepthStateCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Depth Test Enable: %s (%u)\n", typedPacket->DepthTestEnable ? "Enabled" : "Disabled", typedPacket->DepthTestEnable);
		if (typedPacket->DepthTestEnable || extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Depth Write Enable: %s (%u)\n", typedPacket->DepthWriteEnable ? "Enabled" : "Disabled", typedPacket->DepthWriteEnable);
			PrintCommandListLine(*ret, packetMemberIndentation, "Depth Test Function: %s (%u)\n", CompareFuncToString( (const eCmpFunc)(typedPacket->zFunc) ), typedPacket->zFunc);
			const DWORD dwDepthBias = (typedPacket->DepthBiasHighBits << 27) | typedPacket->DepthBiasLowBits;
			PrintCommandListLine(*ret, packetMemberIndentation, "Depth Bias: %f (0x%08X)\n", *(const float* const)&dwDepthBias, dwDepthBias);
			PrintCommandListLine(*ret, packetMemberIndentation, "Depth Format: %s (%u)\n", DepthFormatToString( (const eDepthFormat)(typedPacket->DepthFormat) ), typedPacket->DepthFormat);
		}
		PrintCommandListLine(*ret, packetMemberIndentation, "Color Writes Enabled: %s (%u)\n", typedPacket->ColorWritesEnabled ? "Enabled" : "Disabled", typedPacket->ColorWritesEnabled);
	}
		break;
	case command::PT_SETBLENDSTATE:
	{
		const setBlendStateCommand* const typedPacket = (const setBlendStateCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Alpha Blending Enable: %s (%u)\n", typedPacket->alphaBlendingEnabled ? "Enabled" : "Disabled", typedPacket->alphaBlendingEnabled);

		const DWORD blendStateBlockCopy = typedPacket->blendStateBlock; // We need to copy here because we cannot take the address of a bitfield member
		const blendStateBitsStruct& blendStateBits = *(const blendStateBitsStruct* const)&blendStateBlockCopy;

		if (typedPacket->alphaBlendingEnabled || extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Blend Source Color: %s (%u)\n", BlendSourceRGBToString(blendStateBits.blendModeSrcRGB, blendStateBits.blendModeSrcRGBInvert), blendStateBits.blendModeSrcRGB);
			if (extraDetails)
			{
				PrintCommandListLine(*ret, packetMemberIndentation, "Blend Source Color Invert: %s (%u)\n", blendStateBits.blendModeSrcRGBInvert ? "Invert" : "No Invert", blendStateBits.blendModeSrcRGBInvert);
			}
			PrintCommandListLine(*ret, packetMemberIndentation, "Blend Dest Color: %s (%u)\n", BlendSourceRGBToString(blendStateBits.blendModeDestRGB, blendStateBits.blendModeDestRGBInvert), blendStateBits.blendModeDestRGB);
			if (extraDetails)
			{
				PrintCommandListLine(*ret, packetMemberIndentation, "Blend Dest Color Invert: %s (%u)\n", blendStateBits.blendModeDestRGBInvert ? "Invert" : "No Invert", blendStateBits.blendModeDestRGBInvert);
			}
			PrintCommandListLine(*ret, packetMemberIndentation, "Blend Color Op: %s (%u)\n", BlendOpToString(blendStateBits.blendOpRGB), blendStateBits.blendOpRGB);

			PrintCommandListLine(*ret, packetMemberIndentation, "Blend Source Alpha: %s (%u)\n", BlendSourceAlphaToString(blendStateBits.blendModeSrcA, blendStateBits.blendModeSrcAInvert), blendStateBits.blendModeSrcA);
			if (extraDetails)
			{
				PrintCommandListLine(*ret, packetMemberIndentation, "Blend Source Alpha Invert: %s (%u)\n", blendStateBits.blendModeSrcAInvert ? "Invert" : "No Invert", blendStateBits.blendModeSrcAInvert);
			}
			PrintCommandListLine(*ret, packetMemberIndentation, "Blend Dest Alpha: %s (%u)\n", BlendSourceAlphaToString(blendStateBits.blendModeDestA, blendStateBits.blendModeDestAInvert), blendStateBits.blendModeDestA);
			if (extraDetails)
			{
				PrintCommandListLine(*ret, packetMemberIndentation, "Blend Dest Alpha Invert: %s (%u)\n", blendStateBits.blendModeDestAInvert ? "Invert" : "No Invert", blendStateBits.blendModeDestAInvert);
			}
			PrintCommandListLine(*ret, packetMemberIndentation, "Blend Alpha Op: %s (%u)\n", BlendOpToString(blendStateBits.blendOpA), blendStateBits.blendOpA);

			PrintCommandListLine(*ret, packetMemberIndentation, "Load Source Color: %s (%u)\n", blendStateBits.doLoadSrcColor ? "Load" : "Don't Load", blendStateBits.doLoadSrcColor);
			PrintCommandListLine(*ret, packetMemberIndentation, "Load Dest Color: %s (%u)\n", blendStateBits.doLoadDestColor ? "Load" : "Don't Load", blendStateBits.doLoadDestColor);

			PrintCommandListLine(*ret, packetMemberIndentation, "Blend Factor Color: 0x%08X (R:%u, G:%u, B:%u, A:%u)\n", typedPacket->blendFactorABGR, 
				(typedPacket->blendFactorABGR >> 16) & 0xFF, (typedPacket->blendFactorABGR >> 8) & 0xFF, typedPacket->blendFactorABGR & 0xFF, (typedPacket->blendFactorABGR >> 24) & 0xFF);
		}

		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Padding: 0x%04X\n", blendStateBits.unusedPadding);
		}
	}
		break;
	case command::PT_CONNBROADCAST:
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		PrintCommandListLine(*ret, packetMemberIndentation, "Used by the network system. Should not appear inside a command buffer!\n");
	}
		break;
	case command::PT_CONNREQUEST:
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		PrintCommandListLine(*ret, packetMemberIndentation, "Used by the network system. Should not appear inside a command buffer!\n");
	}
		break;
	case command::PT_CONNRESPONSE:
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		PrintCommandListLine(*ret, packetMemberIndentation, "Used by the network system. Should not appear inside a command buffer!\n");
	}
		break;
	case command::PT_SESSIONCOMBOPACKET:
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		PrintCommandListLine(*ret, packetMemberIndentation, "Used by the network system. Should not appear inside a command buffer!\n");
	}
		break;
	case command::PT_DISCONNECT:
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		PrintCommandListLine(*ret, packetMemberIndentation, "Used by the network system. Should not appear inside a command buffer!\n");
	}
		break;
	case command::PT_SETCLIPSTATE:
	{
		const setClipperStateCommand* const typedPacket = (const setClipperStateCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Clipping Enabled: %s (%u)\n", typedPacket->clippingEnabled ? "Enabled" : "Disabled", typedPacket->clippingEnabled);
		if (typedPacket->clippingEnabled || extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Z Clip Enabled: %s (%u)\n", typedPacket->depthClipEnable ? "Enabled" : "Disabled", typedPacket->depthClipEnable);
			PrintCommandListLine(*ret, packetMemberIndentation, "Near Z Clip Type: %s (%u)\n", typedPacket->useOpenGLNearZClip ? "OpenGL" : "Direct3D", typedPacket->useOpenGLNearZClip);
			PrintCommandListLine(*ret, packetMemberIndentation, "Guard Band X Scale: %f (Log2: %u)\n", (const float)(1 << typedPacket->guardBandScaleX), typedPacket->guardBandScaleX);
			PrintCommandListLine(*ret, packetMemberIndentation, "Guard Band Y Scale: %f (Log2: %u)\n", (const float)(1 << typedPacket->guardBandScaleY), typedPacket->guardBandScaleY);
		}
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x%08X\n", typedPacket->unused0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: 0x%08X\n", typedPacket->unused1);
		}
	}
		break;
	case command::PT_ISSUEQUERY:
	{
		const issueQueryCommand* const typedPacket = (const issueQueryCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Query Type: %s (%u)\n", QueryTypeToString( (const eQueryType)(typedPacket->queryType) ), typedPacket->queryType);
		PrintCommandListLine(*ret, packetMemberIndentation, "Query Issue: %s (%u)\n", typedPacket->isEndQuery ? "End Query" : "Begin Query", typedPacket->isEndQuery);
		PrintCommandListLine(*ret, packetMemberIndentation, "Query Address: 0x%08X\n", typedPacket->queryAddress);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x%08X\n", typedPacket->unused0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused1: %u\n", typedPacket->unused1);
		}
	}
		break;
	case command::PT_SETVIEWPORTPARAMS0:
	{
		const setViewportState0Command* const typedPacket = (const setViewportState0Command* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Viewport Half-Width: %f\n", typedPacket->viewportHalfWidth * 2.0f);
		PrintCommandListLine(*ret, packetMemberIndentation, "Viewport Half-Height: %f\n", typedPacket->viewportHalfHeight * 2.0f);
	}
		break;
	case command::PT_SETVIEWPORTPARAMS1:
	{
		const setViewportState1Command* const typedPacket = (const setViewportState1Command* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Viewport Z Scale: %f\n", typedPacket->viewportZScale);
		PrintCommandListLine(*ret, packetMemberIndentation, "Viewport Z Offset: %f\n", typedPacket->viewportZOffset);
	}
		break;
	case command::PT_SETSCISSORRECT:
	{
		const setScissorRectCommand* const typedPacket = (const setScissorRectCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Scissor Left: %u\n", typedPacket->scissorLeft);
		PrintCommandListLine(*ret, packetMemberIndentation, "Scissor Right: %u\n", typedPacket->scissorRight);
		PrintCommandListLine(*ret, packetMemberIndentation, "Scissor Top: %u\n", typedPacket->scissorTop);
		PrintCommandListLine(*ret, packetMemberIndentation, "Scissor Bottom: %u\n", typedPacket->scissorBottom);
	}
		break;
	case command::PT_SETINTERPOLATORSTATE:
	{
		const setAttrInterpolatorStateCommand* const typedPacket = (const setAttrInterpolatorStateCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Addressing U: %s (%u)\n", TexAddressingModeToString(typedPacket->addressingU), typedPacket->addressingU);
		PrintCommandListLine(*ret, packetMemberIndentation, "Addressing V: %s (%u)\n", TexAddressingModeToString(typedPacket->addressingV), typedPacket->addressingV);
		PrintCommandListLine(*ret, packetMemberIndentation, "Shading Mode: %s (%u)\n", typedPacket->useFlatShadingColor ? "Flat" : "Gouraud", typedPacket->useFlatShadingColor);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Padding0: %u\n", typedPacket->padding0);
			PrintCommandListLine(*ret, packetMemberIndentation, "Padding123: 0x%06X\n", typedPacket->padding123[2], typedPacket->padding123[1], typedPacket->padding123[0]);
			PrintCommandListLine(*ret, packetMemberIndentation, "Padding1: 0x%08X\n", typedPacket->padding1);
		}
	}
		break;
	case command::PT_WRITEMEMBATCHCONFIG:
	{
		const writeMemBatchConfigCommand* const typedPacket = (const writeMemBatchConfigCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "Write Begin Address: 0x%08X\n", typedPacket->writeBeginAddr);
		if (extraDetails)
		{
			PrintCommandListLine(*ret, packetMemberIndentation, "Unused0: 0x%08X\n", typedPacket->unused0);
		}
	}
		break;
	case command::PT_WRITEMEMBATCH0:
	{
		const writeMemBatchData0Command* const typedPacket = (const writeMemBatchData0Command* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "DWORD 0 Data: 0x%08X (%f)\n", typedPacket->writeDWORDData0, *(const float* const)&(typedPacket->writeDWORDData0) );
		PrintCommandListLine(*ret, packetMemberIndentation, "DWORD 1 Data: 0x%08X (%f)\n", typedPacket->writeDWORDData1, *(const float* const)&(typedPacket->writeDWORDData1) );
	}
		break;
	case command::PT_WRITEMEMBATCH1:
	{
		const writeMemBatchData1Command* const typedPacket = (const writeMemBatchData1Command* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "DWORD 2 Data: 0x%08X (%f)\n", typedPacket->writeDWORDData2, *(const float* const)&(typedPacket->writeDWORDData2) );
		PrintCommandListLine(*ret, packetMemberIndentation, "DWORD 3 Data: 0x%08X (%f)\n", typedPacket->writeDWORDData3, *(const float* const)&(typedPacket->writeDWORDData3) );
	}
		break;
	case command::PT_WRITEMEMBATCH2:
	{
		const writeMemBatchData2Command* const typedPacket = (const writeMemBatchData2Command* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "DWORD 4 Data: 0x%08X (%f)\n", typedPacket->writeDWORDData4, *(const float* const)&(typedPacket->writeDWORDData4) );
		PrintCommandListLine(*ret, packetMemberIndentation, "DWORD 5 Data: 0x%08X (%f)\n", typedPacket->writeDWORDData5, *(const float* const)&(typedPacket->writeDWORDData5) );
	}
		break;
	case command::PT_WRITEMEMBATCH3WRITE:
	{
		const writeMemBatchData3WriteCommand* const typedPacket = (const writeMemBatchData3WriteCommand* const)packetPtr;
		PrintCommandListLine(*ret, packetMemberIndentation, "DWORD 6 Data: 0x%08X (%f)\n", typedPacket->writeDWORDData6, *(const float* const)&(typedPacket->writeDWORDData6) );
		PrintCommandListLine(*ret, packetMemberIndentation, "DWORD 7 Data: 0x%08X (%f)\n", typedPacket->writeDWORDData7, *(const float* const)&(typedPacket->writeDWORDData7) );
	}
		break;
	}
}

// After calling this function, it is the caller's responsibility to delete all of the std::string's out of the return vector
void DisassemblePacketsStream(std::vector<const std::string*>& outDisassembledPackets, const bool disassembleReferencedCommandLists, const genericCommand* const firstPacketPtr, const unsigned outerPacketCount /*= 1u*/)
{
	if (!commandListResolveCallback)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Must call InitPacketDisassembly() with a valid command list resolution callback first before disassembling any packets!
#endif
		return;
	}

	for (unsigned packetID = 0; packetID < outerPacketCount; ++packetID)
	{
		const genericCommand* const currentPacket = firstPacketPtr + packetID;
		DisassemblePacket(outDisassembledPackets, currentPacket, disassembleReferencedCommandLists);
	}
}

// You must call InitPacketDisassembly() before invoking the big DisassemblePacketsStream() call later
void InitPacketDisassembly(const ResolveCommandListPacketCallback CommandListResolveCallback)
{
#ifdef _DEBUG
	if (CommandListResolveCallback == NULL)
	{
		__debugbreak(); // Error: Can't register a NULL callback for command list resolution!
	}
	if (commandListResolveCallback != NULL)
	{
		__debugbreak(); // Error: Don't double-register the callback!
	}
#endif
	commandListResolveCallback = CommandListResolveCallback;
}
