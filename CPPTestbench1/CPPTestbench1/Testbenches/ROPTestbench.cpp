#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"
#include "../D3DTriRasterizeTestData.h"
#include "ShaderCoreALUCommon.h"
#include "PixelPipelineShared.h"
#include <vector>

static unsigned currentTriCacheIndex = 0;

#define D3DCOLOR_ABGR(a,r,g,b) \
    ((D3DCOLOR)((((a)&0xff)<<24)|(((b)&0xff)<<16)|(((g)&0xff)<<8)|((r)&0xff)))

enum ROPStateType : unsigned char
{
	init, // 0
	waitingForPixelData, // 1

	doAlphaTest, // 2
	calcPixelAddress, // 3
	checkCache, // 4
	autoFlushSingleCacheLine, // 5
	requestReadPixel, // 6
	waitForReadPixel, // 7
	blendPixel0, // 8
	blendPixel1, // 9
	writePixel, // 10

	setNewBlendState, // 11
	setNewClear, // 12
	manualFlushFullCache, // 13
	manualFlushFullCacheFinish // 14
};

struct memResponse
{
	BYTE data[32];
	uint32_t requestAddr;
};
static_assert(sizeof(memResponse) == 32 + 4, "Error: Unexpected struct size!");

static const float frand()
{
	return rand() / (const float)RAND_MAX;
}

#pragma pack(push)
#pragma pack(1)
struct memWriteRequestStruct
{
	unsigned char DWORDWriteEnableMask; // 8 bits
	unsigned writeData[8]; // 8 * 32 bits
	unsigned writeAddr; // 30 bits
};
#pragma pack(pop)

enum eBlendMode : unsigned char
{
	noBlending, // 0
	additiveColorBlend, // 1
	alphaBlend // 2
};

// Returns true if the pixel passed the alpha test (ie. we should draw this pixel), or false if the pixel failed the alpha test (ie. we should discard this pixel)
const bool AlphaTest(const unsigned char testPixelAlpha, const unsigned char alphaReferenceVal, const D3DCMPFUNC cmpFunc)
{
	switch (cmpFunc)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Should never be here!
#endif
	case D3DCMP_NEVER:
		return false;
	case D3DCMP_LESS:
		return testPixelAlpha < alphaReferenceVal;
	case D3DCMP_EQUAL:
		return testPixelAlpha == alphaReferenceVal;
	case D3DCMP_LESSEQUAL:
		return testPixelAlpha <= alphaReferenceVal;
	case D3DCMP_GREATER:
		return testPixelAlpha > alphaReferenceVal;
	case D3DCMP_NOTEQUAL:
		return testPixelAlpha != alphaReferenceVal;
	case D3DCMP_GREATEREQUAL:
		return testPixelAlpha >= alphaReferenceVal;
	case D3DCMP_ALWAYS:
		return true;
	}
}

union COLOR_UBYTE4_ARGB
{
	struct _bgra
	{
		unsigned char r;
		unsigned char g;
		unsigned char b;
		unsigned char a;
	} bgra;

	D3DCOLOR dwordColor;
};
static_assert(sizeof(COLOR_UBYTE4_ARGB) == sizeof(D3DCOLOR), "Error: Unexpected union packing!");

const D3DCOLOR PerformBlending(const D3DCOLOR incomingNewPixelColor, const D3DCOLOR existingFramebufferColor, const eBlendMode blendMode)
{
	COLOR_UBYTE4_ARGB newPixelCol, framebufferCol;
	newPixelCol.dwordColor = incomingNewPixelColor;
	framebufferCol.dwordColor = existingFramebufferColor;
	switch (blendMode)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Should never be here!
#endif
	case noBlending:
		return incomingNewPixelColor;
	case additiveColorBlend:
	{
		unsigned blendedR = ( (const unsigned)newPixelCol.bgra.r) + ( (const unsigned)framebufferCol.bgra.r);
		unsigned blendedG = ( (const unsigned)newPixelCol.bgra.g) + ( (const unsigned)framebufferCol.bgra.g);
		unsigned blendedB = ( (const unsigned)newPixelCol.bgra.b) + ( (const unsigned)framebufferCol.bgra.b);
		unsigned blendedA = ( (const unsigned)newPixelCol.bgra.a) + ( (const unsigned)framebufferCol.bgra.a);
		if (blendedR > 0xFF) blendedR = 0xFF; // Saturate our additions
		if (blendedG > 0xFF) blendedG = 0xFF;
		if (blendedB > 0xFF) blendedB = 0xFF;
		if (blendedA > 0xFF) blendedA = 0xFF;
		return D3DCOLOR_ABGR(blendedA, blendedR, blendedG, blendedB);
	}
	case alphaBlend:
	{
		const unsigned srcAlphaVal = newPixelCol.bgra.a;
		const unsigned invSrcAlphaVal = 255 - srcAlphaVal;
		const unsigned blendedR = (newPixelCol.bgra.r * srcAlphaVal + framebufferCol.bgra.r * invSrcAlphaVal) >> 8;
		const unsigned blendedG = (newPixelCol.bgra.g * srcAlphaVal + framebufferCol.bgra.g * invSrcAlphaVal) >> 8;
		const unsigned blendedB = (newPixelCol.bgra.b * srcAlphaVal + framebufferCol.bgra.b * invSrcAlphaVal) >> 8;
		const unsigned blendedA = (newPixelCol.bgra.a * srcAlphaVal + framebufferCol.bgra.a * invSrcAlphaVal) >> 8;
		return D3DCOLOR_ABGR( (const unsigned)blendedA, (const unsigned)blendedR, (const unsigned)blendedG, (const unsigned)blendedB);
	}
	}
}

const D3DCOLOR ApplyWriteMask(const unsigned outputWriteMask, const D3DCOLOR blendedColor, const D3DCOLOR framebufferPixel)
{
	COLOR_UBYTE4_ARGB newPixelCol, framebufferCol, maskCombinedColor;
	newPixelCol.dwordColor = blendedColor;
	framebufferCol.dwordColor = framebufferPixel;

	maskCombinedColor.dwordColor = 0x00000000;
	if (outputWriteMask & D3DCOLORWRITEENABLE_RED)
		maskCombinedColor.bgra.r = newPixelCol.bgra.r;
	else
		maskCombinedColor.bgra.r = framebufferCol.bgra.r;
	if (outputWriteMask & D3DCOLORWRITEENABLE_GREEN)
		maskCombinedColor.bgra.g = newPixelCol.bgra.g;
	else
		maskCombinedColor.bgra.g = framebufferCol.bgra.g;
	if (outputWriteMask & D3DCOLORWRITEENABLE_BLUE)
		maskCombinedColor.bgra.b = newPixelCol.bgra.b;
	else
		maskCombinedColor.bgra.b = framebufferCol.bgra.b;
	if (outputWriteMask & D3DCOLORWRITEENABLE_ALPHA)
		maskCombinedColor.bgra.a = newPixelCol.bgra.a;
	else
		maskCombinedColor.bgra.a = framebufferCol.bgra.a;
	return maskCombinedColor.dwordColor;
}

void EmulateROPCPU(const std::vector<texSampOutput>& inputPixelColorData, std::vector<D3DCOLOR>& outFramebuffer, const unsigned outputWriteMask, const eBlendMode blendMode, const bool alphaTestEnabled, const unsigned char alphaTestRefVal, const D3DCMPFUNC alphaTestFunc)
{
	const unsigned numPixels = (const unsigned)(inputPixelColorData.size() );
	for (unsigned x = 0; x < numPixels; ++x)
	{
		const texSampOutput& thisPixelInput = inputPixelColorData[x];
		const D3DCOLOR inputColor = D3DCOLOR_ABGR(thisPixelInput.colorA, thisPixelInput.colorR, thisPixelInput.colorG, thisPixelInput.colorB);

		if (alphaTestEnabled)
		{
			const bool alphaTestPassed = AlphaTest(inputColor >> 24, alphaTestRefVal, alphaTestFunc);
			if (!alphaTestPassed)
			{
				// Discard this pixel because it failed the alpha test
				continue;
			}
		}

		const D3DCOLOR framebufferPixel = outFramebuffer[thisPixelInput.pixelY * 640 + thisPixelInput.pixelX];

		// I'm pretty sure that blending happens *after* the alpha test, not before it. But if that's not actually true, then it's really easy to just swap the order of is and the AlphaTest function.
		const D3DCOLOR blendedColor = PerformBlending(inputColor, framebufferPixel, blendMode);

		const D3DCOLOR writeMaskedColor = ApplyWriteMask(outputWriteMask, blendedColor, framebufferPixel);

		if (writeMaskedColor != framebufferPixel)
		{
			outFramebuffer[thisPixelInput.pixelY * 640 + thisPixelInput.pixelX] = writeMaskedColor;
		}
	}
}

const int RunTestsROP(Xsi::Loader& loader, RenderWindow* renderWindow)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

// Memory Controller FIFO interface begin
	// DRAM read requests FIFO:
	std_logic_vector_port<30> MEM_ROPReadRequestsFIFO_wr_data(PD_OUT, loader, "MEM_ROPReadRequestsFIFO_wr_data");
	std_logic_port MEM_ROPReadRequestsFIFO_full(PD_IN, loader, "MEM_ROPReadRequestsFIFO_full");
	std_logic_port MEM_ROPReadRequestsFIFO_wr_en(PD_OUT, loader, "MEM_ROPReadRequestsFIFO_wr_en");

	// DRAM read responses FIFO:
	std_logic_vector_port<256+30> MEM_ROPReadResponsesFIFO_rd_data(PD_IN, loader, "MEM_ROPReadResponsesFIFO_rd_data");
	std_logic_port MEM_ROPReadResponsesFIFO_empty(PD_IN, loader, "MEM_ROPReadResponsesFIFO_empty");
	std_logic_port MEM_ROPReadResponsesFIFO_rd_en(PD_OUT, loader, "MEM_ROPReadResponsesFIFO_rd_en");

	// DRAM write requests FIFO:
	std_logic_vector_port<30+256+256/32> MEM_ROPWriteRequestsFIFO_wr_data(PD_OUT, loader, "MEM_ROPWriteRequestsFIFO_wr_data");
	std_logic_port MEM_ROPWriteRequestsFIFO_full(PD_IN, loader, "MEM_ROPWriteRequestsFIFO_full");
	std_logic_port MEM_ROPWriteRequestsFIFO_wr_en(PD_OUT, loader, "MEM_ROPWriteRequestsFIFO_wr_en");
// Memory Controller FIFO interface end

// Command Processor block interface begin
	std_logic_port CMD_SetBlendStateSignal(PD_IN, loader, "CMD_SetBlendStateSignal");
	std_logic_port CMD_SetBlendStateSigAck(PD_OUT, loader, "CMD_SetBlendStateSigAck");

	std_logic_vector_port<32> CMD_SetClearColor(PD_IN, loader, "CMD_SetClearColor");
	std_logic_port CMD_ClearSignal(PD_IN, loader, "CMD_ClearSignal");
	std_logic_port CMD_ClearSignalAck(PD_OUT, loader, "CMD_ClearSignalAck");

	std_logic_port CMD_FlushCacheSignal(PD_IN, loader, "CMD_FlushCacheSignal");
	std_logic_port CMD_FlushCacheAck(PD_OUT, loader, "CMD_FlushCacheAck");

	std_logic_port CMD_ROPIsIdle(PD_OUT, loader, "CMD_ROPIsIdle");
	std_logic_vector_port<30> CMD_SetRenderTargetBaseAddr(PD_IN, loader, "CMD_SetRenderTargetBaseAddr");
	std_logic_vector_port<4> CMD_SetBlendMask(PD_IN, loader, "CMD_SetBlendMask");
	std_logic_vector_port<2> CMD_SetBlendMode(PD_IN, loader, "CMD_SetBlendMode");
	std_logic_port CMD_SetAlphaTestEnabled(PD_IN, loader, "CMD_SetAlphaTestEnabled");
	std_logic_vector_port<8> CMD_SetAlphaTestRefVal(PD_IN, loader, "CMD_SetAlphaTestRefVal");
	std_logic_vector_port<3> CMD_SetAlphaTestFunc(PD_IN, loader, "CMD_SetAlphaTestFunc");
// Command Processor block interface end

// Texture Sampler interface begin
	std_logic_vector_port<16> TEXSAMP_outPixelX(PD_IN, loader, "TEXSAMP_outPixelX");
	std_logic_vector_port<16> TEXSAMP_outPixelY(PD_IN, loader, "TEXSAMP_outPixelY");
	std_logic_vector_port<8> TEXSAMP_outR(PD_IN, loader, "TEXSAMP_outR");
	std_logic_vector_port<8> TEXSAMP_outG(PD_IN, loader, "TEXSAMP_outG");
	std_logic_vector_port<8> TEXSAMP_outB(PD_IN, loader, "TEXSAMP_outB");
	std_logic_vector_port<8> TEXSAMP_outA(PD_IN, loader, "TEXSAMP_outA");

	std_logic_port TEXSAMP_writeIsValid(PD_IN, loader, "TEXSAMP_writeIsValid");
	std_logic_port TEXSAMP_writeAck(PD_OUT, loader, "TEXSAMP_writeAck");
// Texture Sampler interface end

// Debug signals
	std_logic_vector_port<4> DBG_ROP_State(PD_OUT, loader, "DBG_ROP_State");
	std_logic_vector_port<30> DBG_CurrentPixelAddr(PD_OUT, loader, "DBG_CurrentPixelAddr");
	std_logic_vector_port<32> DBG_CurrentBlendedColor(PD_OUT, loader, "DBG_CurrentBlendedColor");
	std_logic_vector_port<32> DBG_PreviousFramebufferColor(PD_OUT, loader, "DBG_PreviousFramebufferColor");
	std_logic_vector_port<8> DBG_CurrentCacheLineDirtyFlags(PD_OUT, loader, "DBG_CurrentCacheLineDirtyFlags");
	std_logic_port DBG_ReadRequestFIFOFull(PD_OUT, loader, "DBG_ReadRequestFIFOFull");

	bool successResult = true;

	LPDIRECT3DTEXTURE9 gridTexture128x128 = NULL;
	if (FAILED(D3DXCreateTextureFromFileExA(renderWindow->GetD3D9Dev(), /*"TestGrid.png"*/"RedGreenGradient128x128.png", D3DX_DEFAULT, D3DX_DEFAULT, D3DX_DEFAULT, 0, D3DFMT_X8R8G8B8, D3DPOOL_MANAGED, D3DX_DEFAULT, D3DX_DEFAULT, 0, NULL, NULL, &gridTexture128x128) ) || !gridTexture128x128)
	{
		__debugbreak();
		return E_FAIL;
	}

	srand(3); // Pick a stable seed so we get consistent random results

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);
		MEM_ROPReadRequestsFIFO_full = false;
		MEM_ROPReadResponsesFIFO_empty = false;
		MEM_ROPReadResponsesFIFO_rd_data;
		MEM_ROPWriteRequestsFIFO_full = false;
		CMD_SetBlendStateSignal = false;
		CMD_SetClearColor = (const uint32_t)D3DCOLOR_ARGB(255, 0, 0, 0);
		CMD_ClearSignal = false;
		CMD_FlushCacheSignal = false;
		CMD_SetRenderTargetBaseAddr = 0x00000000;
		CMD_SetBlendMask = 0x0;
		CMD_SetBlendMode = 0x0;
		CMD_SetAlphaTestEnabled = false;
		CMD_SetAlphaTestRefVal = 0x00;
		CMD_SetAlphaTestFunc = (D3DCMP_ALWAYS - 1);
		TEXSAMP_outPixelX = 0x0000;
		TEXSAMP_outPixelY = 0x0000;
		TEXSAMP_outR = 0x00;
		TEXSAMP_outG = 0x00;
		TEXSAMP_outB = 0x00;
		TEXSAMP_outA = 0xFF;
		TEXSAMP_writeIsValid = false;
	}

	const char* framebufferMemoryUpperBits = NULL;

	std::vector<memResponse> memResponses;
	std::vector<D3DCOLOR> framebufferRTL;
	framebufferRTL.resize(640 * 480, D3DCOLOR_ARGB(255, 0, 0, 0) );

	std::vector<D3DCOLOR> emulatedCPUFramebuffer;
	emulatedCPUFramebuffer.resize(640 * 480, D3DCOLOR_ARGB(255, 0, 0, 0) );

	framebufferMemoryUpperBits = reinterpret_cast<char*>(&framebufferRTL.front() );

	auto updateMemoryController = [&]()
	{
		// Handle read requests:
		MEM_ROPReadRequestsFIFO_full = false;
		if (MEM_ROPReadRequestsFIFO_wr_en.GetBoolVal() )
		{
			const uint32_t readBaseAddress = MEM_ROPReadRequestsFIFO_wr_data.GetUint32Val();

			const char* const readStartAddress = (const char* const)( (reinterpret_cast<const unsigned __int64>(framebufferMemoryUpperBits) & (~0x3FFFFFFFull) ) | readBaseAddress);

			memResponse newMemRead;
			memcpy(newMemRead.data, readStartAddress, 32);
			newMemRead.requestAddr = readBaseAddress;
			memResponses.push_back(newMemRead);
		}

		// Handle read responses:
		MEM_ROPReadResponsesFIFO_empty = memResponses.empty();
		if (!memResponses.empty() )
		{
			MEM_ROPReadResponsesFIFO_rd_data.SetToByteMemory(&memResponses.front() );
		}
		if (MEM_ROPReadResponsesFIFO_rd_en.GetBoolVal() )
		{
			memResponses.erase(memResponses.begin() );
			MEM_ROPReadResponsesFIFO_empty = memResponses.empty();
			if (!memResponses.empty() )
			{
				MEM_ROPReadResponsesFIFO_rd_data.SetToByteMemory(&memResponses.front() );
			}
		}

		// Handle memory writes:
		MEM_ROPWriteRequestsFIFO_full = false;
		if (MEM_ROPWriteRequestsFIFO_wr_en.GetBoolVal() )
		{
			memWriteRequestStruct memWriteRequest = {0};
			MEM_ROPWriteRequestsFIFO_wr_data.GetStructValPartialFit(memWriteRequest);

			// Should never submit a write request that has nothing to write!
			if (memWriteRequest.DWORDWriteEnableMask == 0x00)
			{
				__debugbreak();
			}

			const unsigned writeBaseAddress = memWriteRequest.writeAddr;
			unsigned* const writeStartAddress = (unsigned* const)( (reinterpret_cast<const unsigned __int64>(framebufferMemoryUpperBits) & (~0x3FFFFFFFull) ) | writeBaseAddress);
			for (unsigned x = 0; x < 8; ++x)
			{
				if (memWriteRequest.DWORDWriteEnableMask & (1 << x) )
				{
					writeStartAddress[x] = memWriteRequest.writeData[x];
				}
			}
		}
	};

	auto SimulateFlushROPCache = [&]()
	{
		// Wait for idle before doing anything else:
		while (CMD_ROPIsIdle.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
		}

		// Just pulse the "flush cache" signal for one cycle:
		{
			scoped_timestep time(loader, clk, 100);
			CMD_FlushCacheSignal = true;
			updateMemoryController();
		}
		{
			scoped_timestep time(loader, clk, 100);
			CMD_FlushCacheSignal = false;
			updateMemoryController();
		}

		// Wait for the ack that indicates flushing the cache is complete:
		while (CMD_FlushCacheAck.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
		}

		// Wait for idle before doing anything else:
		while (CMD_ROPIsIdle.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
		}
	};

	auto SimulateROPRTL = [&](const std::vector<texSampOutput>& inputPixelColorData, std::vector<D3DCOLOR>& outFramebuffer, const unsigned outputWriteMask, const eBlendMode blendMode, const bool alphaTestEnabled, const unsigned char alphaTestRefVal, const D3DCMPFUNC alphaTestFunc)
	{
		// Wait for idle first:
		while (CMD_ROPIsIdle.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
		}

		// Configure state using the CMD signals:
		CMD_SetBlendStateSignal = true;
		unsigned char* const renderTargetAddr = (unsigned char* const)&outFramebuffer.front();
		CMD_SetRenderTargetBaseAddr = reinterpret_cast<uint32_t>(renderTargetAddr);
		CMD_SetBlendMask = (const unsigned char)outputWriteMask;
		CMD_SetBlendMode = blendMode;
		CMD_SetAlphaTestEnabled = alphaTestEnabled;
		CMD_SetAlphaTestRefVal = alphaTestRefVal;
		CMD_SetAlphaTestFunc = (const unsigned char)(alphaTestFunc - 1);
		while (CMD_SetBlendStateSigAck.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
		}

		CMD_SetBlendStateSignal = false;

		// Flush the ROP cache so that we start our ROP blending with an empty cache:
		SimulateFlushROPCache();

		// Wait for idle before doing anything else:
		while (CMD_ROPIsIdle.GetBoolVal() == false)
		{
			scoped_timestep time(loader, clk, 100);
			updateMemoryController();
		}

		const unsigned numPixels = (const unsigned)inputPixelColorData.size();
		for (unsigned x = 0; x < numPixels; ++x)
		{
			const texSampOutput& incomingPixel = inputPixelColorData[x];

			ROPStateType currentState = init;
			currentState = (const ROPStateType)DBG_ROP_State.GetUint8Val();
			D3DCOLOR currentBlendResult = DBG_CurrentBlendedColor.GetUint32Val();
			D3DCOLOR previousFramebufferColor = DBG_PreviousFramebufferColor.GetUint32Val();
			unsigned char currentCacheLineDirtyFlags = DBG_CurrentCacheLineDirtyFlags.GetUint8Val();

			// Wait for idle before sending the next pixel:
			while (CMD_ROPIsIdle.GetBoolVal() == false)
			{
				scoped_timestep time(loader, clk, 100);
				currentState = (const ROPStateType)DBG_ROP_State.GetUint8Val();
				updateMemoryController();
			}
			currentState = (const ROPStateType)DBG_ROP_State.GetUint8Val();

			// Set up our new pixel data:
			TEXSAMP_outPixelX = incomingPixel.pixelX;
			TEXSAMP_outPixelY = incomingPixel.pixelY;
			TEXSAMP_outR = incomingPixel.colorR;
			TEXSAMP_outG = incomingPixel.colorG;
			TEXSAMP_outB = incomingPixel.colorB;
			TEXSAMP_outA = incomingPixel.colorA;

			// Wait for the ack signal:
			while (TEXSAMP_writeAck.GetBoolVal() == false)
			{
				scoped_timestep time(loader, clk, 100);
				TEXSAMP_writeIsValid = true;
				updateMemoryController();
				currentState = (const ROPStateType)DBG_ROP_State.GetUint8Val();
				currentBlendResult = DBG_CurrentBlendedColor.GetUint32Val();
				previousFramebufferColor = DBG_PreviousFramebufferColor.GetUint32Val();
				currentCacheLineDirtyFlags = DBG_CurrentCacheLineDirtyFlags.GetUint8Val();
			}
			currentState = (const ROPStateType)DBG_ROP_State.GetUint8Val();

			{
				scoped_timestep time(loader, clk, 100);
				TEXSAMP_writeIsValid = false;
				updateMemoryController();
				currentState = (const ROPStateType)DBG_ROP_State.GetUint8Val();
				currentBlendResult = DBG_CurrentBlendedColor.GetUint32Val();
				previousFramebufferColor = DBG_PreviousFramebufferColor.GetUint32Val();
				currentCacheLineDirtyFlags = DBG_CurrentCacheLineDirtyFlags.GetUint8Val();
			}
			while (CMD_ROPIsIdle.GetBoolVal() == false)
			{
				scoped_timestep time(loader, clk, 100);
				updateMemoryController();
				currentState = (const ROPStateType)DBG_ROP_State.GetUint8Val();
				currentBlendResult = DBG_CurrentBlendedColor.GetUint32Val();
				previousFramebufferColor = DBG_PreviousFramebufferColor.GetUint32Val();
				currentCacheLineDirtyFlags = DBG_CurrentCacheLineDirtyFlags.GetUint8Val();
			}
		}

		// We need to flush the ROP cache when we're done writing all of our pixel data in order to force our writes to complete
		SimulateFlushROPCache();
	};

	auto runROPTest = [&](const std::vector<texSampOutput>& inputPixelColorData, const unsigned outputWriteMask, const eBlendMode blendMode, const bool alphaTestEnabled, const unsigned char alphaTestRefVal, const D3DCMPFUNC alphaTestFunc) -> bool
	{
		EmulateROPCPU(inputPixelColorData, emulatedCPUFramebuffer, outputWriteMask, blendMode, alphaTestEnabled, alphaTestRefVal, alphaTestFunc);

		SimulateROPRTL(inputPixelColorData, framebufferRTL, outputWriteMask, blendMode, alphaTestEnabled, alphaTestRefVal, alphaTestFunc);

		if (emulatedCPUFramebuffer.size() != framebufferRTL.size() )
		{
			__debugbreak();
		}

		const unsigned numInputPixels = (const unsigned)inputPixelColorData.size();
		for (unsigned y = 0; y < numInputPixels; ++y)
		{
			const texSampOutput& currentInputPixel = inputPixelColorData[y];

			/*const unsigned numPixels = (const unsigned)emulatedCPUFramebuffer.size();
			for (unsigned x = 0; x < numPixels; ++x)
			{*/
				const D3DCOLOR emulatedCPUPixel = emulatedCPUFramebuffer[currentInputPixel.pixelY * 640 + currentInputPixel.pixelX];
				const D3DCOLOR simulatedRTLPixel = framebufferRTL[currentInputPixel.pixelY * 640 + currentInputPixel.pixelX];

				if (emulatedCPUPixel != simulatedRTLPixel)
				{
					__debugbreak();
					return false;
				}
			//}
		}

		return true;
	};

	// Indices are expected to arrive in CCW order:
	auto testSimpleDrawCall = [&](const testVert* const vertices, const unsigned short* const indicesCCW, const unsigned numPrims, const bool useBilinearInterp, LPDIRECT3DTEXTURE9 setTexture, 
		unsigned outputWriteMask, eBlendMode blendMode, bool alphaTestEnabled, unsigned char alphaTestRefVal, D3DCMPFUNC alphaTestFunc,
		const bool randomAttributes = false)
	{
		D3DSURFACE_DESC texDesc = {};
		setTexture->GetLevelDesc(0, &texDesc);
		D3DLOCKED_RECT d3dlr = {0};
		setTexture->LockRect(0, &d3dlr, NULL, D3DLOCK_READONLY);

		if (randomAttributes)
		{
			outputWriteMask = rand() & 0xF;
			blendMode = (const eBlendMode)(rand() % 3);
			alphaTestEnabled = (rand() & 0x1) ? true : false;
			alphaTestRefVal = (rand() & 0xFF);
			alphaTestFunc = (const D3DCMPFUNC)( (rand() & 0x7) + 1);
		}

		for (unsigned x = 0; x < numPrims; ++x)
		{
			triSetupInput primTriData; 
			
			// Draw vertices in "0, 2, 1" order to swizzle CCW to CW ordering for our triangle setup to not consider them backfacing:
			primTriData.v0.xPos = vertices[indicesCCW[x * 3] ].posX;
			primTriData.v0.yPos = vertices[indicesCCW[x * 3] ].posY;
			primTriData.v0.invZ = 2.0f;
			primTriData.v0.invW = 1.0f;
			primTriData.v0.xTex = 0.0f;
			primTriData.v0.yTex = 1.0f;
			primTriData.v0.rgba = { 1.0f, 0.0f, 0.0f, 1.0f };
			primTriData.v1.xPos = vertices[indicesCCW[x * 3 + 2] ].posX;
			primTriData.v1.yPos = vertices[indicesCCW[x * 3 + 2] ].posY;
			primTriData.v1.invZ = 2.0f;
			primTriData.v1.invW = 1.0f;
			primTriData.v1.xTex = 1.0f;
			primTriData.v1.yTex = 0.0f;
			primTriData.v1.rgba = { 0.0f, 1.0f, 0.0f, 1.0f };
			primTriData.v2.xPos = vertices[indicesCCW[x * 3 + 1] ].posX;
			primTriData.v2.yPos = vertices[indicesCCW[x * 3 + 1] ].posY;
			primTriData.v2.invZ = 2.0f;
			primTriData.v2.invW = 1.0f;
			primTriData.v2.xTex = 0.0f;
			primTriData.v2.yTex = 0.0f;
			primTriData.v2.rgba = { 0.0f, 0.0f, 1.0f, 1.0f };
			if (randomAttributes)
			{
				const float randomZ0 = frand() * 0.5f + 0.5f; // We currently only support depth values between 0.5f and 1.0f
				const float randomZ1 = frand() * 0.5f + 0.5f;
				const float randomZ2 = frand() * 0.5f + 0.5f;
				primTriData.v0.invZ = 1.0f / randomZ0;
				primTriData.v1.invZ = 1.0f / randomZ1;
				primTriData.v2.invZ = 1.0f / randomZ2;

				const float randomW0 = frand() * 0.5f + 0.5f; // We currently only support W values between 0.5f and 1.0f
				const float randomW1 = frand() * 0.5f + 0.5f;
				const float randomW2 = frand() * 0.5f + 0.5f;
				primTriData.v0.invW = 1.0f / randomW0;
				primTriData.v1.invW = 1.0f / randomW1;
				primTriData.v2.invW = 1.0f / randomW2;

				primTriData.v0.rgba = { frand(), frand(), frand(), frand() };
				primTriData.v1.rgba = { frand(), frand(), frand(), frand() };
				primTriData.v2.rgba = { frand(), frand(), frand(), frand() };

				primTriData.v0.xTex = frand() * 32.0f - 16.0f;
				primTriData.v0.yTex = frand() * 32.0f - 16.0f;
				primTriData.v1.xTex = frand() * 32.0f - 16.0f;
				primTriData.v1.yTex = frand() * 32.0f - 16.0f;
				primTriData.v2.xTex = frand() * 32.0f - 16.0f;
				primTriData.v2.yTex = frand() * 32.0f - 16.0f;
			}

			// Emulate the vertex shader by pre-dividing the perspective-interpolated attributes by W:
			primTriData.v0.xTex *= primTriData.v0.invW;
			primTriData.v0.yTex *= primTriData.v0.invW;
			primTriData.v0.rgba.r *= primTriData.v0.invW;
			primTriData.v0.rgba.g *= primTriData.v0.invW;
			primTriData.v0.rgba.b *= primTriData.v0.invW;
			primTriData.v0.rgba.a *= primTriData.v0.invW;
			primTriData.v1.xTex *= primTriData.v1.invW;
			primTriData.v1.yTex *= primTriData.v1.invW;
			primTriData.v1.rgba.r *= primTriData.v1.invW;
			primTriData.v1.rgba.g *= primTriData.v1.invW;
			primTriData.v1.rgba.b *= primTriData.v1.invW;
			primTriData.v1.rgba.a *= primTriData.v1.invW;
			primTriData.v2.xTex *= primTriData.v2.invW;
			primTriData.v2.yTex *= primTriData.v2.invW;
			primTriData.v2.rgba.r *= primTriData.v2.invW;
			primTriData.v2.rgba.g *= primTriData.v2.invW;
			primTriData.v2.rgba.b *= primTriData.v2.invW;
			primTriData.v2.rgba.a *= primTriData.v2.invW;

			triSetupOutput triSetupData;
			if (EmulateCPUTriSetup(primTriData, triSetupData) != triSetup_OK) // If this fails, then it's because our triangle got culled or clipped or backface-killed or something
			{
				// __debugbreak();
				continue;
			}
			std::vector<rasterizedPixelData> rasterizedPixels;

			rasterizedPixelData startNewTriMessage = {0};
			startNewTriMessage.pixelX = startNewTriangleSlotCommand;
			startNewTriMessage.pixelY = (currentTriCacheIndex) % 8;
			rasterizedPixels.push_back(startNewTriMessage);

			EmulateCPURasterizer(triSetupData, rasterizedPixels);

			rasterizedPixelData endTriMessage = {0};
			endTriMessage.pixelX = finishCurrentTriangleCommand;
			endTriMessage.pixelY = (currentTriCacheIndex++) % 8;
			rasterizedPixels.push_back(endTriMessage);

			std::vector<depthInterpOutputData> emulatedCPUDepthInterpData;
			EmulateDepthInterpCPU(triSetupData, rasterizedPixels, emulatedCPUDepthInterpData);

			std::vector<attributeInterpOutputData> emulatedCPUAttributeInterpData;
			EmulateAttributeInterpCPU(triSetupData, emulatedCPUDepthInterpData, emulatedCPUAttributeInterpData);

			std::vector<texSampOutput> emulatedCPUTexSampleData;
			EmulateTexSamplerCPU(emulatedCPUAttributeInterpData, emulatedCPUTexSampleData, useBilinearInterp, texDesc, d3dlr);

			successResult &= runROPTest(emulatedCPUTexSampleData, outputWriteMask, blendMode, alphaTestEnabled, alphaTestRefVal, alphaTestFunc);
		}
		setTexture->UnlockRect(0);
	};

	// Do a simple point-sampled triangle first:
	{
		const unsigned short fullTriangle0IB[] = { 0, 1, 2 };
		const bool useBilinearInterp = false;
		const bool useRandomAttributes = false;
		testSimpleDrawCall(fullTriangle0, fullTriangle0IB, ARRAYSIZE(fullTriangle0IB) / 3, useBilinearInterp, gridTexture128x128,
			D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_ALPHA, noBlending, false, 0x00, D3DCMP_ALWAYS, useRandomAttributes);
	}

	// Test case with three triangles that share a single vertex:
	{
		static const unsigned short sharedVertex3TrianglesIndices[] =
		{
			0, 1, 2,
			0, 2, 3,
			0, 3, 4
		};
		const bool useBilinearInterp = true;
		const bool useRandomAttributes = false;
		testSimpleDrawCall(threeTrisSharedVertex, sharedVertex3TrianglesIndices, ARRAYSIZE(sharedVertex3TrianglesIndices) / 3, useBilinearInterp, gridTexture128x128,
			D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_ALPHA, noBlending, false, 0x00, D3DCMP_ALWAYS, useRandomAttributes);
	}

	// Let's try doing 1024 random small triangles (about half will get backface culled, and some others may get degenerate triangle culled or clipped off the screen):
	{
		srand(3); // Set a deterministic seed so we get the same results every time
		const unsigned short fullTriangleIB[] = { 0, 1, 2 };
		for (unsigned x = 0; x < 1024; ++x)
		{
			testVert verts[3];
			verts[0].posX = ( (rand() % 800) - 80) + 0.5f; // Random xPos between -80 and +720
			verts[0].posY = ( (rand() % 600) - 60) + 0.5f; // Random yPos between -60 and +540

			verts[1].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
			verts[1].posY = verts[0].posY + ( (rand() % 100) - 50); // Random xOffset between -50 and +50

			verts[2].posX = verts[0].posX + ( (rand() % 100) - 50); // Random xOffset between -50 and +50
			verts[2].posY = verts[0].posY + ( (rand() % 100) - 50); // Random xOffset between -50 and +50

			const bool useBilinearInterp = true;
			const bool useRandomAttributes = true;
			testSimpleDrawCall(verts, fullTriangleIB, ARRAYSIZE(fullTriangleIB) / 3, useBilinearInterp, gridTexture128x128, 
				D3DCOLORWRITEENABLE_RED | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_ALPHA, noBlending, false, 0x00, D3DCMP_ALWAYS, useRandomAttributes);
		}
	}
	return successResult ? S_OK : E_FAIL;
}
