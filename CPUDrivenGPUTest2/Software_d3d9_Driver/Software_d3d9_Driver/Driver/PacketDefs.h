#pragma once

#include "PacketTypes.h"

// Note that all changes made to this file must be mirrored into PacketType.vhd as well!
static const char PACKET_MAGIC_VALUE = 'C';

#pragma pack(push) // Start pragma pack 1 region
#pragma pack(1)

struct command
{
	// If altering this enum, be sure to also update the HDL side of things so that they match!
	enum ePacketType : unsigned char
	{
		PT_DONOTHING = 0, // This is meant to be a no-op packet that does nothing
		PT_WRITEMEM = 1,
		PT_READMEM = 2,
		PT_READMEMRESPONSE = 3,
		PT_CLEARMEM = 4,
		PT_CLEARBACKBUFFER = 5,
		PT_CLEARZSTENCILBUFFER = 6,
		PT_REMOVED7 = 7,//PT_LOADVERTSTREAMDATA = 7, This packet has been removed, feel free to reuse it!
		PT_LOADTEXCACHEDATA = 8,
		PT_SETBLENDSTATE = 9,
		PT_SETTEXTURESTATE = 10,
		PT_WAITFORDEVICEIDLE = 11,
		PT_WAITRESPONSE = 12,
		PT_DRAWINDEXED = 13,
		PT_SETSCANOUTPOINTER = 14,
		PT_SETIASTATE = 15,
		PT_FLUSHROPCACHE = 16,
		PT_ENDFRAMESTATS = 17,
		PT_ENDFRAME = 18,
		PT_RUNCOMMANDLIST = 19,

		// To hook up in the driver:
		PT_LOADSHADERINSTRUCTIONS = 20,
		PT_SETSHADERCONSTANT = 21,
		PT_SETVERTEXSTREAMDATA = 22,
		PT_SETINDEXBUFFER = 23,
		PT_SETSHADERCONSTANTSPECIAL = 24,

		PT_MAX_PACKET_TYPES // This must always be last
	};

	command()
	{
	}

	command(const ePacketType thisPacketType) : type(thisPacketType)
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
#ifdef _DEBUG
		if (packet == NULL)
		{
			__debugbreak();
		}
		if (packetSize < sizeof(command) )
		{
			__debugbreak();
		}
#endif

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
#ifdef _DEBUG
		if (packet == NULL)
		{
			__debugbreak();
		}
		if (packetSize < sizeof(command) )
		{
			__debugbreak();
		}
#endif

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
	ePacketType type = PT_DONOTHING; // Packets may be freely discarded if the packet type is unrecognized or out of range.
};

// This packet is used for being reinterpret-cast into all the other packet types
struct genericCommand : command
{
	genericCommand() : command(PT_DONOTHING)
	{
	}

	// Payload 0:
	DWORD payload0 = 1; // 31 downto 0

	// Payload 1:
	DWORD payload1 = 2; // 31 downto 0
};

// The doNothing command is meant to be a no-op packet that does nothing
struct doNothingCommand : command
{
	doNothingCommand() : command(PT_DONOTHING)
	{
	}

	// Payload 0:
	DWORD padding0 = 1; // Not used // 31 downto 0

	// Payload 1:
	DWORD padding1 = 2; // Not used // 31 downto 0
};

struct writeMemCommand : command
{
	writeMemCommand() : command(PT_WRITEMEM)
	{
	}

	// Payload 0:
	DWORD writeDWORDAddr = 0x00000000; // The write address, in BYTE's from the start of the RAM (must be DRAM_LINE aligned!)

	// Payload 1:
	DWORD writeVal = 0; // The value to write into the DWORD
};

struct readMemCommand : command
{
	readMemCommand() : command(PT_READMEM), dwordSelect(0), paddingBits(0)
	{
	}

	// Payload 0:
	DWORD readDWORDAddr = 0x00000000; // The read address, in BYTE's from the start of the RAM (must be DRAM_LINE aligned!)

	// Payload 1:
	DWORD dwordSelect : 3; // Selects which of the 8 DWORD's in this DRAM_LINE to read back from (3 bits) // 2 downto 0
	DWORD paddingBits : 29;
};

struct readMemResponse : command
{
	readMemResponse() : command(PT_READMEMRESPONSE)
	{
	}

	// Payload 0:
	DWORD readDWORDAddr = 0x00000000; // The read address, in byte's from the start of the RAM (must be DRAM_LINE aligned!)

	// Payload 1:
	DWORD value = 0; // The value that was read
};

struct clearMemCommand : command
{
	clearMemCommand() : command(PT_CLEARMEM)
	{
	}

	enum eClearValue : unsigned char
	{
		EC_TRANSPARENTBLACK = 0, // Transparent Black: float4(0.0f, 0.0f, 0.0f, 0.0f)
		EC_OPAQUEWHITE = 1, // Opaque White: float4(1.0f, 1.0f, 1.0f, 1.0f)
		EC_OPAQUEBLACK = 2, // Opaque Black: float4(0.0f, 0.0f, 0.0f, 1.0f)
		EC_TRANSPARENTWHITE = 3 // Transparent White: float4(1.0f, 1.0f, 1.0f, 0.0f)
	};

	// Payload 0:
	DWORD writeDWORDAddr = 0x00000000; // The address of the DRAM_LINE to clear (must be DRAM_LINE aligned!)

	// Payload 1:
	USHORT clearNumDRAMLines = 1; // The number of DRAM lines (32 byte blocks) to set to the clear color. Zero does nothing! // 15 downto 0
	eClearValue clearValue = EC_TRANSPARENTBLACK; // Which clear color to use for this clear operation. // 23 downto 16
	BYTE paddingByte = 0; // Just for padding // 31 downto 24
};

struct clearBackbufferCommand : command
{
	clearBackbufferCommand() : command(PT_CLEARBACKBUFFER)
	{
	}

	// Payload 0:
	DWORD writeColorRGBA = 0xFFFFFFFF;

	// Payload 1:
	DWORD renderTargetAddress = 0x00000000;
};

struct clearZStencilCommand : command
{
	clearZStencilCommand() : command(PT_CLEARZSTENCILBUFFER)
	{
	}

	enum eZSType : unsigned char
	{
		EZS_ZClear = 0x1,
		EZS_StencilClear = 0x2,
		EZS_Both = EZS_ZClear | EZS_StencilClear
	};

	// Payload 0:
	DWORD writeZValue = 0xFFFFFFFF;

	// Payload 1:
	eZSType clearType = EZS_Both; // 7 downto 0
	BYTE writeStencilValue = 0x00; // 15 downto 8
	USHORT padding = 0; // 31 downto 16
};

struct loadTexCacheDataCommand : command
{
	loadTexCacheDataCommand() : command(PT_LOADTEXCACHEDATA)
	{
	}

	// Payload 0:
	DWORD sourceRAMAddr = 0x00000000; // Source address in device RAM

	// Payload 1:
	eTexFormat loadSourceFormat = eTexFmtA8R8G8B8; // 7 downto 0
	USHORT loadTexelCount = 1; // Texel count (width * height) to be loaded from sourceRAMAddr into the texture cache (at texcache addr 0x00)
	BYTE unused = 0; // 31 downto 24
};

struct setBlendStateCommand : command
{
	setBlendStateCommand() : command(PT_SETBLENDSTATE), newBlendType(noBlending), zWriteEnabled(false), zTestEnabled(false), alphaTestEnabled(false), unusedBits(0)
	{
	}

	// Payload 0:
	DWORD renderTargetBaseAddress : 30; // 29 downto 0
	eBlendMode newBlendType : 2; // 31 downto 30

	// Payload 1:
	eBlendMask writeMask = wm_writeAll; // 7 downto 0
	BYTE zWriteEnabled : 1; // Not yet implemented // 8
	BYTE zTestEnabled : 1; // Not yet implemented // 9
	BYTE alphaTestEnabled : 1; // 10
	BYTE unusedBits : 5; // 11, 12, 13, 14, 15
	BYTE alphaTestRefValue = 0xFF; // 23 downto 16
	eCmpFunc alphaTestFunc = cmp_greaterequal; // 31 downto 24
};

struct setTextureStateCommand : command
{
	setTextureStateCommand() : command(PT_SETTEXTURESTATE),
		channel0(tcm_r), 
		channel1(tcm_g), 
		channel2(tcm_b), 
		channel3(tcm_a)
	{
		addressU = ta_wrap;
		addressV = ta_wrap;
	}

	enum texAddressMode : unsigned char
	{
		ta_wrap = 0, // Not yet implemented!
		ta_clamp = 1, // Not yet implemented!
		ta_mirror = 2, // Not yet implemented!
		ta_mirrorOnce = 3, // Not yet implemented!
		ta_border = 4 // Not yet implemented!
	};

	// Payload 0:
	BYTE texWidth = 1; // Texture width, in texels (must be power of 2, does not need to match height) // 7 downto 0
	BYTE texHeight = 1; // Texture height, in texels (must be power of 2, does not need to match width) // 15 downto 8
	eTexFilterMode filterMode = TF_pointFilter; // 23 downto 16
	texAddressMode addressU : 4; // 27 downto 24
	texAddressMode addressV : 4; // 31 downto 28

	// Payload 1:
	eTexChannelMUX channel0 : 4; // = R // 3 downto 0
	eTexChannelMUX channel1 : 4; // = G // 7 downto 4
	eTexChannelMUX channel2 : 4; // = B // 11 downto 8
	eTexChannelMUX channel3 : 4; // = A // 15 downto 12
	combinerMode cbModeAlpha = cbm_textureModulateVertexColor; // 23 downto 16
	combinerMode cbModeColor = cbm_textureModulateVertexColor; // 31 downto 24
};

struct waitForDeviceIdleCommand : command
{
	waitForDeviceIdleCommand() : command(PT_WAITFORDEVICEIDLE)
	{
	}

	enum waitForDeviceSubsystem : unsigned char
	{
		// Immediately returns without waiting (and optionally sends the return value back to the CPU)
		waitForNothing = 0x0,

		// Waits for the input assembler to have no work remaining
		waitForIAIdle = 0x1, // bit 0

		// Waits for the triangle rasterizer to have no work remaining
		waitForRasterizerIdle = 0x2, // bit 1

		// Waits for the scanout module to reach VSync
		waitForVSync = 0x4, // bit 2

		// Waits for the texture samplers to have no work remaining
		waitForTexSamplerIdle = 0x8, // bit 3

		// Waits for the clear block to finish clearing a rendertarget
		waitForClearBlockIdle = 0x10, // bit 4

		// Waits for the ROP's to have no work remaining
		waitForROPIdle = 0x20, // bit 5

		// Waits for all DRAM reads/writes to have flushed
		waitForMemControllerIdle = 0x40, // bit 6

		waitForUnused = 0x80, // bit 7 (currently unused)

		// Waits for the whole GPU to be idle and drained of any work (waits for everything except VSync)
		waitForFullPipelineFlush = waitForIAIdle | waitForRasterizerIdle | waitForTexSamplerIdle | waitForClearBlockIdle | waitForROPIdle | waitForMemControllerIdle,

		// Waits for everything
		waitForFullPipelineFlushAndVSync = waitForFullPipelineFlush | waitForVSync
	};

	// Payload 0:
	waitForDeviceSubsystem waitBitmask = waitForFullPipelineFlush; // You can wait for multiple systems at once if you bit-OR their flags together // 7 downto 0
	bool returnCPUValue = true; // If set to true, then right after the wait completes the GPU will send the given DWORD value back to the CPU via a PT_WAITRESPONSE packet // 15 downto 8
	USHORT unused = 0; // 31 downto 16

	// Payload 1:
	DWORD returnValueToCPU = 0x00000000; // 31 downto 0
};

struct waitResponse : command
{
	waitResponse() : command(PT_WAITRESPONSE)
	{
	}

	// Payload 0:
	DWORD value = 0x00000000; // The value that was meant to be returned to the CPU from the GPU // 31 downto 0

	// Payload 1:
	DWORD unused = 0; // 31 downto 0
};

struct drawIndexedCommand : command
{
	drawIndexedCommand() : command(PT_DRAWINDEXED),
		numPrimitivesToDraw(0), isIndexedDrawCall(false), unused0(0),
		startIndex(0), primTopology(0), unused1(0)
	{
	}

	// Payload 0:
	DWORD numPrimitivesToDraw : 24; // 23 downto 0
	DWORD isIndexedDrawCall : 1; // 24
	DWORD unused0 : 7; // 31 downto 25

	// Payload 1:
	DWORD startIndex : 24; // (corresponds to the startIndex param passed into DrawIndexedPrimitive() ) // 23 downto 0
	DWORD primTopology : 3; // 26 downto 24
	DWORD unused1 : 5; // 31 downto 27
};

struct setScanoutPointerCommand : command
{
	setScanoutPointerCommand() : command(PT_SETSCANOUTPOINTER)
	{
	}

	// Payload 0:
	DWORD bufferAddress = 0x00000000; // 31 downto 0

	enum eDisplayMode : unsigned char
	{
		dm_640x480_60Hz = 0,
		dm_default = dm_640x480_60Hz,
		dm_800x600_60Hz,
		dm_1024x768_60Hz,
		dm_1280x1024_60Hz,
		dm_1600x1200_60Hz,

		DISPLAYMODE_MAX_COUNT // This must always be last
	};

	// Payload 1:
	BYTE scanoutEnable = 0xFF; // Toggles scanout on/off (effectively "plugs in" or "unplugs" the monitor from the GPU) // 7 downto 0
	BYTE unused0 = 0; // 15 downto 8
	BYTE unused1 = 0; // 23 downto 16
	eDisplayMode displayMode = dm_default; // 31 downto 24
};

// This configures the IA and the posttransform index cache in the Input Assembler
struct setIAStateCommand : command
{
	setIAStateCommand() : command(PT_SETIASTATE),
		IBBaseAddr(0x00000000), unused2(0)
	{
	}

	// Payload 0:
	eCullMode cull = cullCCW; // 7 downto 0
	ePrimTopology topology = primTop_TriangleList; // 15 downto 8
	eStripCutType stripCut = sct_CutDisabled; // 23 downto 16
	eIndexFormat indexFmt = ibfmt_index16; // 31 downto 24

	// Payload 1:
	DWORD IBBaseAddr : 30; // Index buffer base address (must be 32-byte aligned!) // 29 downto 0
	DWORD unused2 : 2; // Unused // 31 downto 30
};

struct flushROPCacheCommand : command
{
	flushROPCacheCommand() : command(PT_FLUSHROPCACHE)
	{
	}

	// Payload 0:
	DWORD unused0 = 0; // 31 downto 0

	// Payload 1:
	DWORD unused1 = 0; // 31 downto 0
};

struct endFrameStatsResponse : command
{
	endFrameStatsResponse() : command(PT_ENDFRAMESTATS)
	{
		system = ST_Null;
		systemMetricID = 0;
	}

	enum eSystemType : unsigned char
	{
		ST_Null = 0,
		ST_IA = 1,
		ST_TriSetup = 2,
		ST_Rasterizer = 3,
		ST_AttributeInterpolator = 4,
		ST_TextureSampler = 5,
		ST_ROP = 6,
		ST_CommandProcessor = 7,
		ST_MemorySystemRead = 8,
		ST_MemorySystemWrite = 9,
		ST_ScanOut = 10,

		ST_MAX_NUM_SYSTEM_TYPES // This must always be last!
	};

	enum eMetricSpace : unsigned char
	{
		MS_UnknownMetrics = 0,
		MS_TimeMetrics = 1,
		MS_CounterStatMetrics = 2,

		MS_MAX_NUM_METRIC_SPACES // This must always be last!
	};

	enum eIATimerStats : unsigned char
	{
		IACyclesWaitingForDrawCommand = 0,
		IACyclesSpentWorking = 1,
		IACyclesLoadingDataToCache = 2,
		IACyclesWaitingForTriSetup = 3,

		MAX_IA_TIMER_STATS, // This must always be last

		IAIdleCycles = IACyclesWaitingForDrawCommand,
		IAWaitForInputCycles = IACyclesWaitingForDrawCommand,
		IAWaitForOutputCycles = IACyclesWaitingForTriSetup
	};

	enum eTriSetupTimerStats : unsigned char
	{
		TriSetupCyclesWaitingForIA = 0,
		TriSetupCyclesSpentWorking = 1,
		TriSetupCyclesWaitingForRasterizer = 2,

		MAX_TRISETUP_TIMER_STATS, // This must always be last

		TriSetupIdleCycles = TriSetupCyclesWaitingForIA,
		TriSetupWaitForInputCycles = TriSetupCyclesWaitingForIA,
		TriSetupWaitForOutputCycles = TriSetupCyclesWaitingForRasterizer
	};

	enum eRasterizerTimerStats : unsigned char
	{
		RasterizerCyclesWaitingForTriSetup = 0,
		RasterizerCyclesSpentWorking = 1,
		RasterizerCyclesWaitingForTriWorkCache = 2,
		RasterizerCyclesWaitingForRastOutputFIFO = 3,

		MAX_RASTERIZER_TIMER_STATS, // This must always be last

		RasterizerIdleCycles = RasterizerCyclesWaitingForTriSetup,
		RasterizerWaitForInputCycles = RasterizerCyclesWaitingForTriSetup,
		RasterizerWaitForOutputCycles = RasterizerCyclesWaitingForRastOutputFIFO
	};

	enum eAttrInterpolatorTimerStats : unsigned char
	{
		AttrInterpCyclesWaitingForRasterizer = 0,
		AttrInterpCyclesSpentWorking = 1,
		AttrInterpCyclesWaitingForTexSampler = 2,

		MAX_ATTRINTERP_TIMER_STATS, // This must always be last

		AttrInterpIdleCycles = AttrInterpCyclesWaitingForRasterizer,
		AttrInterpWaitForInputCycles = AttrInterpCyclesWaitingForRasterizer,
		AttrInterpWaitForOutputCycles = AttrInterpCyclesWaitingForTexSampler
	};

	enum eTexSamplerTimerStats : unsigned char
	{
		TexSamplerCyclesWaitingForAttrInterpolator = 0,
		TexSamplerCyclesSpentWorking = 1,
		TexSamplerCyclesWaitingForROP = 2,
		TexSamplerCyclesSpentLoadingCache = 3,

		MAX_TEXSAMPLER_TIMER_STATS, // This must always be last

		TexSamplerIdleCycles = TexSamplerCyclesWaitingForAttrInterpolator,
		TexSamplerWaitForInputCycles = TexSamplerCyclesWaitingForAttrInterpolator,
		TexSamplerWaitForOutputCycles = TexSamplerCyclesWaitingForROP
	};

	enum eROPTimerStats : unsigned char
	{
		ROPCyclesWaitingForTexSampler = 0,
		ROPCyclesSpentWorking = 1,
		ROPCyclesWaitingForMemoryRead = 2,
		ROPCyclesWaitingForMemoryWrite = 3,

		MAX_ROP_TIMER_STATS, // This must always be last

		ROPIdleCycles = ROPCyclesWaitingForTexSampler,
		ROPWaitForInputCycles = ROPCyclesWaitingForTexSampler,
		ROPWaitForOutputCycles = ROPCyclesWaitingForMemoryWrite
	};

	enum eCommandProcessorTimerStats : unsigned char
	{
		CommandProcCyclesWaitingForNewPacket = 0,
		CommandProcCyclesSpentWorking = 1,

		MAX_COMMANDPROC_TIMER_STATS, // This must always be last

		CommandProcIdleCycles = CommandProcCyclesWaitingForNewPacket,
		CommandProcWaitForInputCycles = CommandProcCyclesWaitingForNewPacket
	};

	enum eMemControllerReadTimerStats : unsigned char
	{
		MemControllerReadCyclesWaitingForRequest = 0,
		MemControllerReadCyclesSpentWorking = 1,

		MAX_MEMCONTROLLER_READ_TIMER_STATS, // This must always be last

		MemControllerReadIdleCycles = MemControllerReadCyclesWaitingForRequest,
		MemControllerReadWaitForInputCycles = MemControllerReadCyclesWaitingForRequest
	};

	enum eMemControllerWriteTimerStats : unsigned char
	{
		MemControllerWriteCyclesWaitingForRequest = 0,
		MemControllerWriteCyclesSpentWorking = 1,

		MAX_MEMCONTROLLER_WRITE_TIMER_STATS, // This must always be last

		MemControllerWriteIdleCycles = MemControllerWriteCyclesWaitingForRequest,
		MemControllerWriteWaitForInputCycles = MemControllerWriteCyclesWaitingForRequest
	};

	enum eROPCounterStats : unsigned char
	{
		ROPCounterCacheHits = 0,
		ROPCounterCacheMisses = 1,

		MAX_ROP_COUNTER_STATS // This must always be last
	};

	enum eMemReadCounterStats : unsigned char
	{
		MemReadCounterBytesTransferred = 0,
		MemReadCounterNumTransactions = 1,

		MemReadCounterNonScanoutBytesTransferred = 2,
		MemReadCounterNonScanoutNumTransactions = 3,

		MAX_MEMREAD_COUNTER_STATS // This must always be last
	};

	enum eMemWriteCounterStats : unsigned char
	{
		MemWriteCounterBytesTransferred = 0,
		MemWriteCounterNumTransactions = 1,

		MAX_MEMWRITE_COUNTER_STATS // This must always be last
	};
	
	enum eTotalCounterStats : unsigned char
	{
		TotalTimerStatsCount = MAX_IA_TIMER_STATS + MAX_TRISETUP_TIMER_STATS + MAX_RASTERIZER_TIMER_STATS + MAX_ATTRINTERP_TIMER_STATS + MAX_TEXSAMPLER_TIMER_STATS + MAX_ROP_TIMER_STATS + 
			MAX_COMMANDPROC_TIMER_STATS + MAX_MEMCONTROLLER_READ_TIMER_STATS + MAX_MEMCONTROLLER_WRITE_TIMER_STATS,

		TotalCounterStatsCount = MAX_ROP_COUNTER_STATS + MAX_MEMREAD_COUNTER_STATS + MAX_MEMWRITE_COUNTER_STATS,

		// TotalAllStatsCount is the size (in DWORD's) of the DWORD array that backs our stats memory
		TotalAllStatsCount = TotalTimerStatsCount + TotalCounterStatsCount
	};
	static_assert(eTotalCounterStats::TotalAllStatsCount == 36u, "Error: Need to update stats header files to match HDL PER_FRAME_STATS_COUNT value!");

	// Payload 0:
	eSystemType system : 4; // 3 downto 0
	unsigned char systemMetricID : 4; // 7 downto 4
	eMetricSpace metricsType = MS_UnknownMetrics; // 15 downto 8
	USHORT frameID; // 31 downto 16

	// Payload 1:
	DWORD value = 0; // The value for this stat // 31 downto 0
};

struct endFrameCommand : command
{
	endFrameCommand() : command(PT_ENDFRAME)
	{
	}

	// Payload 0:
	DWORD statsMemoryAddress = 0x00000000; // 31 downto 0

	// Payload 1:
	DWORD unused1 = 0; // 31 downto 0
};

struct runCommandListCommand : command
{
	runCommandListCommand() : command(PT_RUNCOMMANDLIST)
	{
	}

	// Payload 0:
	DWORD commandListStartAddress = 0x00000000; // Must be DRAM-line-aligned (evenly divisible by 32) // 31 downto 0

	// Payload 1:
	USHORT numCommands = 0; // 15 downto 0
	USHORT unused1 = 0; // 31 downto 16
};

struct loadShaderInstructionsCommand : command
{
	loadShaderInstructionsCommand() : command(PT_LOADSHADERINSTRUCTIONS)
	{
	}

	// Payload 0:
	DWORD shaderStartAddress = 0x00000000; // Must be DRAM-line-aligned (evenly divisible by 32) // 29 downto 0

	// Payload 1:
	USHORT shaderLengthTokens = 0; // 15 downto 0 // Number of shader instruction tokens in this shader
	USHORT shaderLoadTargetOffset = 0; // 31 downto 16 // Address (in shader instruction tokens) into the loaded shader instruction cache defining where to put the loaded shader instructions (defaults to 0). Values above 0 are not yet supported as we don't have a way to launch a shader from a nonzero address!
};

struct setShaderConstantCommand : command
{
	setShaderConstantCommand() : command(PT_SETSHADERCONSTANT)
	{
	}

	// Payload 0:
	DWORD constantDataPointer = 0x00000000; // Must be DRAM-line-aligned (evenly divisible by 32) // 29 downto 0

	// Payload 1:
	BYTE constantBaseRegisterIndex = 0; // Base index of the c# that starts this SetShaderConstant() // 7 downto 0
	BYTE numFloat4Registers = 0; // Number of registers to load sequentially from DRAM, starting with the base register index // 15 downto 8
	USHORT unused0 = 0; // 31 downto 16
};

struct setShaderConstantSpecialCommand : command
{
	setShaderConstantSpecialCommand() : command(PT_SETSHADERCONSTANTSPECIAL),
		shaderRegIndex(0), unused0(0), unused1(0),
		isXNegative(false), isXPow2(false), isXSpec(false), XIndex(0),
		isYNegative(false), isYPow2(false), isYSpec(false), YIndex(0),
		isZNegative(false), isZPow2(false), isZSpec(false), ZIndex(0),
		isWNegative(false), isWPow2(false), isWSpec(false), WIndex(0)
	{
	}

	// Payload 0:
	DWORD shaderRegIndex : 8; // 7 downto 0

	// This whole component is 14 downto 8
	DWORD isXNegative : 1; // 8
	DWORD isXPow2 : 1; // 9
	DWORD isXSpec : 1; // 10 // This is currently assumed to be set if isPow2 is false
	DWORD XIndex : 4; // 14 downto 11

	DWORD unused0 : 10; // 24 downto 15

	// This whole component is 31 downto 25
	DWORD isYNegative : 1; // 25
	DWORD isYPow2 : 1; // 26
	DWORD isYSpec : 1; // 27 // This is currently assumed to be set if isPow2 is false
	DWORD YIndex : 4; // 31 downto 28

	// Payload 1:

	// This whole component is 6 downto 0
	DWORD isZNegative : 1; // 0
	DWORD isZPow2 : 1; // 1
	DWORD isZSpec : 1; // 2 // This is currently assumed to be set if isPow2 is false
	DWORD ZIndex : 4; // 6 downto 3

	DWORD unused1 : 18; // 24 downto 7

	// This whole component is 31 downto 25
	DWORD isWNegative : 1; // 25
	DWORD isWPow2 : 1; // 26
	DWORD isWSpec : 1; // 27 // This is currently assumed to be set if isPow2 is false
	DWORD WIndex : 4; // 31 downto 28
};

struct setVertexStreamDataCommand : command
{
	setVertexStreamDataCommand() : command(PT_SETVERTEXSTREAMDATA),
		streamBaseAddress(0x00000000), dwordCount(1),
		streamID(0), isD3DCOLOR(false), shaderRegIndex(0),
		dwordStride(1), dwordOffset(0), unused0(0)
	{
	}

	// Payload 0:
	DWORD streamBaseAddress : 30; // Must be DRAM-line-aligned (evenly divisible by 32) // 29 downto 0
	DWORD dwordCount : 2; // Is this a 1-, 2-, 3-, or 4-DWORD stream element? (D3DCOLOR/float1 = 1, float2 = 2, float3 = 3, float4 = 4). DWORD count is implicitly +1 since a zero DWORD element is not allowed. // 31 downto 30

	// Payload 1:
	DWORD streamID : 3; // The stream index of this data (matches stream number in CreateVertexDeclaration() ) // 2 downto 0
	DWORD isD3DCOLOR : 1; // Is this a D3DCOLOR element (1) that needs to do UINT8->UNORM8 conversion and ARGB->RGBA swizzling, or a FLOAT element (0)? // 3
	DWORD shaderRegIndex : 3; // Which v# register does this vertex data get loaded into? // 6 downto 4
	DWORD dwordStride : 6; // What is the stride (in DWORD's) between elements in this stream? May be 0 to indicate that this data is the same for all elements. // 12 downto 7
	DWORD dwordOffset : 6; // What is the offset (in DWORD's) from the start of the stream? // 18 downto 13
	DWORD numVertexStreamsTotal : 3; // How many vertex streams does this shader use in total? // 21 downto 19
	DWORD unused0 : 10; // 31 downto 22
};

// This configures the index buffer address and type for the pretransformed index cache in the Vertex Batch Builder.
// This packet might be safe to elide in case we're issuing a non-indexed draw call.
struct setIndexBufferCommand : command
{
	setIndexBufferCommand() : command(PT_SETINDEXBUFFER),
		indexBufferAddress(0x00000000), indexType(0)
	{
	}

	// Payload 0:
	DWORD indexBufferAddress : 30; // Must be DRAM-line-aligned (evenly divisible by 32) // 29 downto 0
	DWORD indexType : 2; // INDEX16 = 0, INDEX32 = 1, INDEX8 = 2, UNUSED = 3 // 31 downto 30

	// Payload 1:
	DWORD unused2 = 0x00000000;
};

// TODO: One day implement variable-sized packets and then this can go away
static_assert(sizeof(genericCommand) == sizeof(doNothingCommand) &&
	sizeof(genericCommand) == sizeof(writeMemCommand) &&
	sizeof(genericCommand) == sizeof(readMemCommand) &&
	sizeof(genericCommand) == sizeof(readMemResponse) &&
	sizeof(genericCommand) == sizeof(clearMemCommand) &&
	sizeof(genericCommand) == sizeof(clearBackbufferCommand) &&
	sizeof(genericCommand) == sizeof(clearZStencilCommand) &&
	sizeof(genericCommand) == sizeof(loadTexCacheDataCommand) &&
	sizeof(genericCommand) == sizeof(setBlendStateCommand) &&
	sizeof(genericCommand) == sizeof(setTextureStateCommand) &&
	sizeof(genericCommand) == sizeof(waitForDeviceIdleCommand) &&
	sizeof(genericCommand) == sizeof(waitResponse) &&
	sizeof(genericCommand) == sizeof(drawIndexedCommand) &&
	sizeof(genericCommand) == sizeof(setScanoutPointerCommand) &&
	sizeof(genericCommand) == sizeof(setIAStateCommand) &&
	sizeof(genericCommand) == sizeof(flushROPCacheCommand) &&
	sizeof(genericCommand) == sizeof(endFrameStatsResponse) &&
	sizeof(genericCommand) == sizeof(endFrameCommand) &&
	sizeof(genericCommand) == sizeof(runCommandListCommand) &&
	sizeof(genericCommand) == sizeof(loadShaderInstructionsCommand) && 
	sizeof(genericCommand) == sizeof(setShaderConstantCommand) && 
	sizeof(genericCommand) == sizeof(setVertexStreamDataCommand) && 
	sizeof(genericCommand) == sizeof(setIndexBufferCommand) && 
	sizeof(genericCommand) == sizeof(setShaderConstantSpecialCommand) &&
	sizeof(genericCommand) == 11, "Error: Unexpected struct size!");

#pragma pack(pop) // End pragma pack 1 region