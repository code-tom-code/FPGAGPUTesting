#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "ShaderCoreTestbench.h"
#include "ShaderCoreALUCommon.h"

static bool enableDebugOutput = false;

enum eShaderCMDPacket : unsigned char
{
	DoNothingCommand, // 0 : Do nothing
	LoadProgramCommand, // 1 : LoadProgram (uint32 prog addr, uint16 prog len)
	SetShaderConstantFCommand, // 2 : SetShaderConstantF (uint8 constant register index c#, float4 value)
	IASetVertexStreamCommand, // 3 : IASetVertexStream(uint3 streamID, uint32 streamBaseAddress, uint2 dwordCount, bool isD3DCOLOR, uint3 shaderRegIndex, uint6 dwordStride, uint6 dwordOffset)
	StartShadingWorkCommand // 4 : StartShadingWork(uint9 setShaderStartAddress)
};

enum eShaderCoreState
{
	initState, // 0

	readyState, // 1

	loadProgramState, // 2
	loadProgramStateLoopLow, // 3
	loadProgramStateLoopLowWaitForData, // 4
	loadProgramStateLoopHigh, // 5
	loadProgramStateLoopHighWaitForData, // 6
	loadProgramStateCleanup, // 7

	setShaderConstantY, // 8
	setShaderConstantZ, // 9
	setShaderConstantW, // 10
	setShaderConstantCooldown0, // 11
	setShaderConstantCooldown1, // 12

	getVertexBatch, // 13

	fetchVertexStreamData0, // 14
	fetchVertexStreamData1, // 15
	fetchVertexStreamDataWaitForData, // 16
	writeVertexDataToGPR, // 17

	unpackColorData_Lane0, // 18
	unpackColorData_Lane1, // 19
	unpackColorData_Lane2, // 20
	unpackColorData_Lane3, // 21
	unpackColorData_WriteWait, // 22
	unpackColorData_WriteX, // 23
	unpackColorData_WriteY, // 24
	unpackColorData_WriteZ, // 25
	unpackColorData_WriteW, // 26

	setupRunShader, // 27
	setupRunShader2, // 28
	setupRunShader3, // 29
	setupRunShader4, // 30
	runShader, // 31
	waitForWritesToComplete, // 32

	dbgOutputRegisterData, // 33
	dbgOutputRegisterDataRFWait0, // 34
	dbgOutputRegisterDataRFWait1, // 35
	dbgOutputRegisterDataRFWait2, // 36
	dbgOutputRegisterDataOutput, // 37

	collectShaderResults, // 38
	submitShaderResults // 39
};

struct float4
{
	const bool operator==(const float4& rhs) const
	{
		return x == rhs.x && y == rhs.y && z == rhs.z && w == rhs.w;
	}
	float x, y, z, w;
};
static_assert(sizeof(float4) == sizeof(float) * 4, "Error: Unexpected struct padding!");

struct float3
{
	float x, y, z;
};
static_assert(sizeof(float3) == sizeof(float) * 3, "Error: Unexpected struct padding!");

struct float2
{
	const bool operator==(const float2& rhs) const
	{
		return x == rhs.x && y == rhs.y;
	}

	float x, y;
};
static_assert(sizeof(float2) == sizeof(float) * 2, "Error: Unexpected struct padding!");

struct testVert3D
{
	float3 xyz;
	float2 texcoord;
	float3 normal;
	DWORD color;
};
static_assert(sizeof(testVert3D) == 36, "Error: Unexpected struct size!");
static_assert(sizeof(testVert3D) % sizeof(DWORD) == 0, "Error: Struct size must be a multiple of DWORD size!");

struct testVertOutputRHW
{
	float4 xyzw; // o0
	float4 diffuse; // o1
	float2 texcoord; // o2
};

class VBB_FIFO
{
public:
	struct VBBEntry
	{
		unsigned short indices[16] = {0};
		unsigned short vertexBatchStartingIndex; // If vertexBatchStartingIndex == vertexBatchEndingIndex, then this is a non-indexed draw call!
		unsigned short vertexBatchEndingIndex;
	};
	static_assert(sizeof(VBBEntry) == sizeof(unsigned short) * 18, "Error: Unexpected struct padding!");
private:
	std::vector<VBBEntry> FIFO;
public:

	// Called by testbench code
	void PushDataToFIFO(const VBBEntry& fifoEntry)
	{
		FIFO.push_back(fifoEntry);
	}

	void Update(const std_logic_port& VERTBATCH_FIFO_rd_en, std_logic_port& VERTBATCH_FIFO_empty, std_logic_vector_port<288>& VERTBATCH_FIFO_rd_data)
	{
		VBBEntry vbb = {0};
		if (!FIFO.empty() )
		{
			vbb = FIFO.front();
		}
		if (VERTBATCH_FIFO_rd_en.GetBoolVal() )
		{
			if (FIFO.empty() )
			{
				__debugbreak(); // Should never be here!
			}
			else
			{
				FIFO.erase(FIFO.begin() );
			}
		}

		VERTBATCH_FIFO_rd_data.SetStructVal(vbb);

		VERTBATCH_FIFO_empty = FIFO.empty();
	}
};

class VBO_FIFO
{
public:
	union registerUnion
	{
		DWORD intReg;
		float floatReg;
		struct
		{
			unsigned short texX;
			unsigned short texY;
		} packedTexcoordReg;
		struct
		{
			signed short posX;
			signed short posY;
		} packedPosReg;
		struct
		{
			unsigned char r;
			unsigned char g;
			unsigned char b;
			unsigned char a;
		} packedColorsReg;
	};
	static_assert(sizeof(registerUnion) == sizeof(DWORD), "Error: Unexpected union size!");

	struct VBOEntry
	{
		registerUnion registers[4];
	};
	static_assert(sizeof(VBOEntry) == sizeof(DWORD) * 4, "Error: Unexpected struct padding!");
private:
	std::vector<VBOEntry> FIFO;
public:

	// Called by testbench code
	VBOEntry ReadDataFromFIFO()
	{
		VBOEntry result = FIFO.front();
		FIFO.erase(FIFO.begin() );
		return result;
	}

	void Update(const std_logic_port& VERTOUT_FIFO_wr_en, std_logic_port& VERTOUT_FIFO_full, std_logic_vector_port<128>& VERTOUT_FIFO_wr_data)
	{
		VERTOUT_FIFO_full = false; // For testing purposes, don't ever let the output FIFO fill up

		if (VERTOUT_FIFO_wr_en.GetBoolVal() )
		{
			VBOEntry newVBO;
			VERTOUT_FIFO_wr_data.GetStructVal(newVBO);
			FIFO.push_back(newVBO);
		}
	}
};

static const char GetRegChannelLetterFromChannelIndex(const unsigned channelIndex)
{
	switch (channelIndex)
	{
	default:
		__debugbreak(); // Should never be here
	case 0:
		return 'x';
	case 1:
		return 'y';
	case 2:
		return 'z';
	case 3:
		return 'w';
	}
}

class GPRQuad
{
private:
	float bram0Data[512] = {0}; // BRAM0 services lane 0 port 0
	float bram1Data[512] = {0}; // BRAM1 services lane 0 port 1
	float bram2Data[512] = {0}; // BRAM2 services lane 1 port 0
	float bram3Data[512] = {0}; // BRAM3 services lane 1 port 1
	float bram4Data[512] = {0}; // BRAM4 services lane 2 port 0
	float bram5Data[512] = {0}; // BRAM5 services lane 2 port 1
	float bram6Data[512] = {0}; // BRAM6 services lane 3 port 0
	float bram7Data[512] = {0}; // BRAM7 services lane 3 port 1


	static const unsigned CalcAddressFromRegisters(const unsigned waveQuad, const unsigned regType, const unsigned regIndex, const unsigned regChannel)
	{
		// This matches our address calculation in VHDL: addrb_bram <= "00" & portA_regType & portA_regIdx & portA_regChan;
		return (waveQuad << 7) | (regType << 5)| (regIndex << 2) | regChannel;
	}
	
	static const char GetRegLetterFromRegType(const RegisterFileRegType regType)
	{
		switch (regType)
		{
		case RFType_VInput:
			return 'v';
		case RFType_OOutput:
			return 'o';
		case RFType_RGPR:
			return 'r';
		default:
			__debugbreak(); // Should never be here
		case RFType_XSpecial:
			return 'x';
		}
	}

	struct readRequest
	{
		unsigned char readQuadIndex;
		unsigned char regType;
		unsigned char regIndex;
		unsigned char regChannel;
	};

	struct writeRequest
	{
		unsigned char writeQuadIndex;
		unsigned char regType;
		unsigned char regIndex;
		unsigned char regChannel;
		float4 portWWriteData;
	};

	struct readWriteRequest
	{
		readRequest portA;
		readRequest portB;
		writeRequest portW;
	};

	readWriteRequest pipelineData[GPR_QUAD_LATENCY_CYCLES + 1] = {0};

public:
	void Update(const std_logic_vector_port<2>& GPR0_ReadQuadIndex, const std_logic_vector_port<2>& GPR0_WriteQuadIndex, const std_logic_port& GPR0_PortA_en, const std_logic_vector_port<2>& GPR0_PortA_regType, const std_logic_vector_port<3>& GPR0_PortA_regIdx, const std_logic_vector_port<2>& GPR0_PortA_regChan, std_logic_vector_port<128>& GPR0_PortA_readOutData,
		const std_logic_port& GPR0_PortB_en, const std_logic_vector_port<2>& GPR0_PortB_regType, const std_logic_vector_port<3>& GPR0_PortB_regIdx, const std_logic_vector_port<2>& GPR0_PortB_regChan, std_logic_vector_port<128>& GPR0_PortB_readOutData,
		const std_logic_port& GPR0_PortW_en, const std_logic_vector_port<2>& GPR0_PortW_regType, const std_logic_vector_port<3>& GPR0_PortW_regIdx, const std_logic_vector_port<2>& GPR0_PortW_regChan, std_logic_vector_port<128>& GPR0_PortW_writeInData)
	{
		readWriteRequest newRequest;
		newRequest.portA.readQuadIndex = newRequest.portB.readQuadIndex = GPR0_ReadQuadIndex.GetUint8Val();
		newRequest.portW.writeQuadIndex = GPR0_WriteQuadIndex.GetUint8Val();
		newRequest.portA.regType = GPR0_PortA_regType.GetUint8Val();
		newRequest.portA.regIndex = GPR0_PortA_regIdx.GetUint8Val();
		newRequest.portA.regChannel = GPR0_PortA_regChan.GetUint8Val();
		newRequest.portB.regType = GPR0_PortB_regType.GetUint8Val();
		newRequest.portB.regIndex = GPR0_PortB_regIdx.GetUint8Val();
		newRequest.portB.regChannel = GPR0_PortB_regChan.GetUint8Val();
		newRequest.portW.regType = GPR0_PortW_regType.GetUint8Val();
		newRequest.portW.regIndex = GPR0_PortW_regIdx.GetUint8Val();
		newRequest.portW.regChannel = GPR0_PortW_regChan.GetUint8Val();
		GPR0_PortW_writeInData.GetStructVal(newRequest.portW.portWWriteData);
		pipelineData[GPR_QUAD_LATENCY_CYCLES] = newRequest;

		const bool portA_enable = GPR0_PortA_en.GetBoolVal();
		const bool portB_enable = GPR0_PortB_en.GetBoolVal();
		const bool portW_enable = GPR0_PortW_en.GetBoolVal();

		if (enableDebugOutput)
		{
			if (portA_enable)
				if (!( (const RegisterFileRegType)newRequest.portA.regType == RFType_XSpecial && newRequest.portA.regIndex == 0x7) )
					printf("GPRQuad is queuing a read on Port A for Quad[%u] and register %c%u.%c\n", newRequest.portA.readQuadIndex , GetRegLetterFromRegType( (const RegisterFileRegType)newRequest.portA.regType), newRequest.portA.regIndex, GetRegChannelLetterFromChannelIndex(newRequest.portA.regChannel) );

			if (portB_enable)
				if (!( (const RegisterFileRegType)newRequest.portB.regType == RFType_XSpecial && newRequest.portB.regIndex == 0x7) )
					printf("GPRQuad is queuing a read on Port B for Quad[%u] and register %c%u.%c\n", newRequest.portB.readQuadIndex , GetRegLetterFromRegType( (const RegisterFileRegType)newRequest.portB.regType), newRequest.portB.regIndex, GetRegChannelLetterFromChannelIndex(newRequest.portB.regChannel) );

			if (portW_enable)
				if (!( (const RegisterFileRegType)newRequest.portW.regType == RFType_XSpecial && newRequest.portW.regIndex == 0x7) )
					printf("GPRQuad is queuing a write on Port W for Quad[%u] and register %c%u.%c\n", newRequest.portW.writeQuadIndex , GetRegLetterFromRegType( (const RegisterFileRegType)newRequest.portW.regType), newRequest.portW.regIndex, GetRegChannelLetterFromChannelIndex(newRequest.portW.regChannel) );
		}

		const unsigned readQuadIndexA = pipelineData[0].portA.readQuadIndex;
		const unsigned readQuadIndexB = pipelineData[0].portB.readQuadIndex;
		const unsigned writeQuadIndex = pipelineData[0].portW.writeQuadIndex;
		const RegisterFileRegType regTypeA = (const RegisterFileRegType)(pipelineData[0].portA.regType);
		const RegisterFileRegType regTypeB = (const RegisterFileRegType)(pipelineData[0].portB.regType);
		const RegisterFileRegType regTypeW = (const RegisterFileRegType)(pipelineData[0].portW.regType);
		const unsigned regIndexA = pipelineData[0].portA.regIndex;
		const unsigned regIndexB = pipelineData[0].portB.regIndex;
		const unsigned regIndexW = pipelineData[0].portW.regIndex;
		const unsigned regChanA = pipelineData[0].portA.regChannel;
		const unsigned regChanB = pipelineData[0].portB.regChannel;
		const unsigned regChanW = pipelineData[0].portW.regChannel;
		const unsigned portA_readAddress = CalcAddressFromRegisters(readQuadIndexA, regTypeA, regIndexA, regChanA);
		const unsigned portB_readAddress = CalcAddressFromRegisters(readQuadIndexB, regTypeB, regIndexB, regChanB);
		const unsigned portW_writeAddress = CalcAddressFromRegisters(writeQuadIndex, regTypeW, regIndexW, regChanW);

		if (portA_enable)
		{
			float4 readARetVal = {0};
			readARetVal.x = bram0Data[portA_readAddress];
			readARetVal.y = bram2Data[portA_readAddress];
			readARetVal.z = bram4Data[portA_readAddress];
			readARetVal.w = bram6Data[portA_readAddress];
			GPR0_PortA_readOutData.SetStructVal(readARetVal);
			if (enableDebugOutput)
				if (!(regTypeA == RFType_XSpecial && regIndexA == 0x7) )
					printf("GPRQuad is completing a read on Port A from Quad[%u] and register %c%u.%c = { %f (0x%08X), %f (0x%08X), %f (0x%08X), %f (0x%08X) }\n", readQuadIndexA, GetRegLetterFromRegType(regTypeA), regIndexA, GetRegChannelLetterFromChannelIndex(regChanA), readARetVal.x, *reinterpret_cast<const unsigned*>(&readARetVal.x), readARetVal.y, *reinterpret_cast<const unsigned*>(&readARetVal.y), readARetVal.z, *reinterpret_cast<const unsigned*>(&readARetVal.z), readARetVal.w, *reinterpret_cast<const unsigned*>(&readARetVal.w) );
		}

		if (portB_enable)
		{
			float4 readBRetVal = {0};
			readBRetVal.x = bram0Data[portB_readAddress];
			readBRetVal.y = bram2Data[portB_readAddress];
			readBRetVal.z = bram4Data[portB_readAddress];
			readBRetVal.w = bram6Data[portB_readAddress];
			GPR0_PortB_readOutData.SetStructVal(readBRetVal);
			if (enableDebugOutput)
				if (!(regTypeB == RFType_XSpecial && regIndexB == 0x7) )
					printf("GPRQuad is completing a read on Port B from Quad[%u] and register %c%u.%c = { %f (0x%08X), %f (0x%08X), %f (0x%08X), %f (0x%08X) }\n", readQuadIndexB, GetRegLetterFromRegType(regTypeB), regIndexB, GetRegChannelLetterFromChannelIndex(regChanB), readBRetVal.x, *reinterpret_cast<const unsigned*>(&readBRetVal.x), readBRetVal.y, *reinterpret_cast<const unsigned*>(&readBRetVal.y), readBRetVal.z, *reinterpret_cast<const unsigned*>(&readBRetVal.z), readBRetVal.w, *reinterpret_cast<const unsigned*>(&readBRetVal.w) );
		}

		if (portW_enable)
		{
			if (portA_enable && portA_readAddress == portW_writeAddress)
			{
				// Error! Address collision between SDP readers and writer!
				__debugbreak();
			}
			else if (portB_enable && portB_readAddress == portW_writeAddress)
			{
				// Error! Address collision between SDP readers and writer!
				__debugbreak();
			}

			const float4& writeWData = pipelineData[0].portW.portWWriteData;

			bram0Data[portW_writeAddress] = writeWData.x;
			bram1Data[portW_writeAddress] = writeWData.x;
			bram2Data[portW_writeAddress] = writeWData.y;
			bram3Data[portW_writeAddress] = writeWData.y;
			bram4Data[portW_writeAddress] = writeWData.z;
			bram5Data[portW_writeAddress] = writeWData.z;
			bram6Data[portW_writeAddress] = writeWData.w;
			bram7Data[portW_writeAddress] = writeWData.w;
			if (enableDebugOutput)
				if (!(regTypeW == RFType_XSpecial && regIndexW == 0x7) )
					printf("GPRQuad is completing a write on Port W to Quad[%u] and register %c%u.%c = { %f (0x%08X), %f (0x%08X), %f (0x%08X), %f (0x%08X) }\n", writeQuadIndex, GetRegLetterFromRegType(regTypeW), regIndexW, GetRegChannelLetterFromChannelIndex(regChanW), writeWData.x, *reinterpret_cast<const unsigned*>(&writeWData.x), writeWData.y, *reinterpret_cast<const unsigned*>(&writeWData.y), writeWData.z, *reinterpret_cast<const unsigned*>(&writeWData.z), writeWData.w, *reinterpret_cast<const unsigned*>(&writeWData.w) );
		}

		for (unsigned x = 0; x < GPR_QUAD_LATENCY_CYCLES; ++x)
		{
			if (portA_enable)
				pipelineData[x].portA = pipelineData[x + 1].portA;
			if (portB_enable)
				pipelineData[x].portB = pipelineData[x + 1].portB;
			if (portW_enable)
				pipelineData[x].portW = pipelineData[x + 1].portW;
		}
	}

	// Debugging function to grab a raw register with 0 latency
	const float4 DebugReadGPR(const unsigned ReadGPRQuad, const RegisterFileRegType regType, const unsigned regIndex, const unsigned regComponent) const
	{
		const unsigned readAddress = CalcAddressFromRegisters(ReadGPRQuad, regType, regIndex, regComponent);
		float4 readVal = {0};
		readVal.x = bram0Data[readAddress];
		readVal.y = bram2Data[readAddress];
		readVal.z = bram4Data[readAddress];
		readVal.w = bram6Data[readAddress];
		return readVal;
	}
};

class FPU
{
public:
	FPU(const unsigned _fpuIndex) : fpuIndex(_fpuIndex)
	{
	}

	static const float ComputeShift(const float a, const eShftMode mode)
	{
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
		case ShftX2: // 0
			return a * 2.0f;
		case ShftX4: // 1
			return a * 4.0f;
		case ShftX8: // 2
			return a * 8.0f;
		case ShftX16: // 3
			return a * 16.0f;
		case ShftD2: // 4
			return a * 0.5f;
		case ShftD4: // 5
			return a * 0.25f;
		case ShftD8: // 6
			return a * 0.125f;
		case ShftD16: // 7
			return a * 0.0625f;
		}
	}

	static const unsigned ComputeBitwise(const float a, const float b, const eBitMode mode)
	{
		const unsigned uintA = *(const unsigned* const)&a;
		const unsigned uintB = *(const unsigned* const)&b;
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
		case BShftL8: // 0
			return uintA << 8;
		case BShftL16: // 1
			return uintA << 16;
		case BShftL24: // 2
			return uintA << 24;
		case BShftR8: // 4
			return uintA >> 8;
		case BShftR16: // 5
			return uintA >> 16;
		case BShftR24: // 6
			return uintA >> 24;
		case BOr: // 3
			return uintA | uintB;
		case BAnd: // 7
			return uintA & uintB;
		}
	}

	static const float ComputeCompare(const float a, const float b, const eCmpType mode)
	{
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here!
		case CmpMin: // min
			return a < b ? a : b;
		case CmpMax: // max
			return a > b ? a : b;
		case CmpSlt: // SLT
			return a < b ? 1.0f : 0.0f;
		case CmpSge: // SGE
			return a < b ? 0.0f : 1.0f;
		case CmpSgn: // Sign
			if (a == 0.0f)
				return 0.0f;
			else if (a < 0.0f)
				return -1.0f;
			else
				return 1.0f;
		case CmpMov:
			return a;
		}
	}

	static const int ComputeConvert(const float a, const eConvertMode mode)
	{
		float saturatedA = a;
		if (saturatedA < 0.0f)
			saturatedA = 0.0f;
		else if (saturatedA > 1.0f)
			saturatedA = 1.0f;

		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
		case F_to_I24_Trunc: // 0
			if (a > 16777215)
				return 16777215;
			else if (a < -16777216)
				return -16777216;
			else
				return (const int)a;
		case F_to_I23_RoundNearestEven: // 1
			if (a > 8388607)
				return 8388607;
			else if (a < -8388608)
				return -8388608;
			else
			{
				if (a >= 0.0f)
					return (const int)(a + 0.5f);
				else
					return (const int)(a - 0.5f);
			}
		case F_to_I16_RoundNearestEven: // 2
			if (a > 32767)
				return 32767;
			else if (a < -32768)
				return -32768;
			else
			{
				if (a >= 0.0f)
					return (const int)(a + 0.5f);
				else
					return (const int)(a - 0.5f);
			}
		case F_to_UNORM16: // 3
			return (const int)(saturatedA * 65535.0f);
		case F_to_UNORM8: // 4
			return (const int)(saturatedA * 255.0f);
		}
	}

private:
	const unsigned fpuIndex;
	float pipeStages[MAX_PIPE_CYCLES + 2] = {0};
	bool pipeStagesValid[MAX_PIPE_CYCLES + 2] = {false};

	static const char* const GetCompareModeString(const eCmpType mode)
	{
		switch (mode)
		{
		default:
			return "Unknown";
		case CmpMin: // min
			return "min";
		case CmpMax: // max
			return "max";
		case CmpSlt: // SLT
			return "slt";
		case CmpSge: // SGE
			return "sge";
		case CmpSgn: // Sign
			return "sign";
		case CmpMov: // Move
			return "mov";
		}
	}

	static const char* const GetShiftModeString(const eShftMode mode)
	{
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
			return "Unknown";
		case ShftX2: // 0
			return "x2";
		case ShftX4: // 1
			return "x4";
		case ShftX8: // 2
			return "x8";
		case ShftX16: // 3
			return "x16";
		case ShftD2: // 4
			return "d2";
		case ShftD4: // 5
			return "d4";
		case ShftD8: // 6
			return "d8";
		case ShftD16: // 7
			return "d16";
		}
	}

	static const char* const GetBitwiseModeString(const eBitMode mode)
	{
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
			return "Unknown";
		case BShftL8: // 0
			return "BShftL8";
		case BShftL16: // 1
			return "BShftL16";
		case BShftL24: // 2
			return "BShftL24";
		case BOr: // 3
			return "OR";
		case BShftR8: // 4
			return "BShftR8";
		case BShftR16: // 5
			return "BShftR16";
		case BShftR24: // 6
			return "BShftR24";
		case BAnd: // 7
			return "AND";
		}
	}

	static const char* const GetConvertModeString(const eConvertMode mode)
	{
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
			return "Unknown";
		case F_to_I24_Trunc:
			return "F_to_I24_Trunc";
		case F_to_I23_RoundNearestEven:
			return "F_to_I23_RoundNearestEven";
		case F_to_I16_RoundNearestEven:
			return "F_to_I16_RoundNearestEven";
		case F_to_UNORM16:
			return "F_to_UNORM16";
		case F_to_UNORM8:
			return "F_to_UNORM8";
		}
	}

public:
	void Update(const std_logic_port& FPU_ISHFT_GO, const std_logic_port& FPU_IMUL_GO, const std_logic_port& FPU_IADD_GO, const std_logic_port& FPU_ICMP_GO, const std_logic_port& FPU_ISPEC_GO, const std_logic_port& FPU_ICNV_GO, const std_logic_port& FPU_IBIT_GO,
		const std_logic_vector_port<32>& FPU_IN_A, const std_logic_vector_port<32>& FPU_IN_B, const std_logic_vector_port<3>& FPU_IN_MODE,
		std_logic_vector_port<32>& FPU_OUT_RESULT)
	{
		const float aVal = FPU_IN_A.GetFloat32Val();
		const float bVal = FPU_IN_B.GetFloat32Val();
		const unsigned char inMode = FPU_IN_MODE.GetUint8Val();
		if (FPU_ICMP_GO.GetBoolVal() + FPU_IADD_GO.GetBoolVal() + FPU_IMUL_GO.GetBoolVal() + FPU_ISHFT_GO.GetBoolVal() + FPU_ISPEC_GO.GetBoolVal() + FPU_ICNV_GO.GetBoolVal() + FPU_IBIT_GO.GetBoolVal() > 1)
		{
			// Error: Multi-state FPU operations not supported!
			__debugbreak();
		}

		if (FPU_ICMP_GO.GetBoolVal() )
		{
			// Compare pipe runs in 1 cycle:
			const eCmpType cmpMode = (const eCmpType)inMode;
			const float compareResult = ComputeCompare(aVal, bVal, cmpMode);
			pipeStages[CMP_CYCLES] = compareResult;
			if (pipeStagesValid[CMP_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[CMP_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: %s(%u)(%f, %f) = %f\n", fpuIndex, GetCompareModeString(cmpMode), cmpMode, aVal, bVal, compareResult);
		}
		else if (FPU_IADD_GO.GetBoolVal() )
		{
			// Add pipe runs in 4 cycles:
			const float addResult = aVal + bVal;
			pipeStages[ADD_CYCLES] = addResult;
			if (pipeStagesValid[ADD_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[ADD_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: %f + %f = %f\n", fpuIndex, aVal, bVal, addResult);
		}
		else if (FPU_IMUL_GO.GetBoolVal() )
		{
			// Multiply pipe runs in 5 cycles:
			const float multResult = aVal * bVal;
			pipeStages[MUL_CYCLES] = multResult;
			if (pipeStagesValid[MUL_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[MUL_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: %f * %f = %f\n", fpuIndex, aVal, bVal, multResult);
		}
		else if (FPU_ISPEC_GO.GetBoolVal() )
		{
			// Reciprocal pipe runs in 14 cycles:
			const float rcpResult = 1.0f / aVal;
			pipeStages[RCP_CYCLES] = rcpResult;
			if (pipeStagesValid[RCP_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[RCP_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: rcp(%f) = %f\n", fpuIndex, aVal, rcpResult);
		}
		else if (FPU_ISHFT_GO.GetBoolVal() )
		{
			// Shift pipe runs in 1 cycle:
			const eShftMode shftMode = (const eShftMode)inMode;
			const float shiftResult = ComputeShift(aVal, shftMode);
			pipeStages[SHFT_CYCLES] = shiftResult;
			if (pipeStagesValid[SHFT_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[SHFT_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: %s(%u)(%f) = %f\n", fpuIndex, GetShiftModeString(shftMode), shftMode, aVal, shiftResult);
		}
		else if (FPU_ICNV_GO.GetBoolVal() )
		{
			// Convert pipe runs in 2 cycles:
			const eConvertMode cnvMode = (const eConvertMode)inMode;
			const int convertResult = ComputeConvert(aVal, cnvMode);
			pipeStages[CNV_CYCLES] = *reinterpret_cast<const float* const>(&convertResult);
			if (pipeStagesValid[CNV_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[CNV_CYCLES] = true;
			if (enableDebugOutput)
			{
				switch (cnvMode)
				{
				default:
					__debugbreak(); // Should never be here!
				case F_to_I24_Trunc:
				case F_to_I23_RoundNearestEven:
				case F_to_UNORM16:
				case F_to_UNORM8:
					printf("FPU%u: %s(%u)(%f) = %i\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, aVal, convertResult);
					break;
				case F_to_I16_RoundNearestEven:
					printf("FPU%u: %s(%u)(%f) = %hi\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, aVal, (const short)convertResult);
					break;
				}
			}
		}
		else if (FPU_IBIT_GO.GetBoolVal() )
		{
			// Bit-ops pipe runs in 1 cycle:
			const eBitMode bitMode = (const eBitMode)inMode;
			const unsigned bitResult = ComputeBitwise(aVal, bVal, bitMode);
			pipeStages[BIT_CYCLES] = *(const float* const)&bitResult;
			if (pipeStagesValid[BIT_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[BIT_CYCLES] = true;
			if (enableDebugOutput)
			{
				switch (bitMode)
				{
				default:
					__debugbreak(); // Should never be here!
				case BShftL8: // 0
				case BShftL16: // 1
				case BShftL24: // 2
				case BShftR8: // 4
				case BShftR16: // 5
				case BShftR24: // 6
					printf("FPU%u: %s(%u)(0x%08X) = 0x%08X\n", fpuIndex, GetBitwiseModeString(bitMode), bitMode, *(const unsigned* const)&aVal, bitResult);
					break;
				case BOr: // 3
				case BAnd: // 7
					printf("FPU%u: %s(%u)(0x%08X, 0x%08X) = 0x%08X\n", fpuIndex, GetBitwiseModeString(bitMode), bitMode, *(const unsigned* const)&aVal, *(const unsigned* const)&bVal, bitResult);
					break;
				}
			}
		}

		for (unsigned x = 0; x < ARRAYSIZE(pipeStages) - 1; ++x)
		{
			pipeStages[x] = pipeStages[x + 1];
			pipeStagesValid[x] = pipeStagesValid[x + 1];
		}
		pipeStages[ARRAYSIZE(pipeStages) - 1] = 0.0f;
		pipeStagesValid[ARRAYSIZE(pipeStages) - 1] = false;

		FPU_OUT_RESULT = pipeStages[0];
	}
};

class ConstantBufferBRAM
{
private:
	float4 constantBufferRegisters[256] = {0};

	struct readWriteRequest
	{
		bool isEnabled;
		bool isWrite;
		unsigned char regIndex;
		unsigned char regComponent;
		float writeData;
	};

	readWriteRequest pipelineCycles[CBUF_LATENCY_CYCLES + 1] = {0};

public:
	void Update(const std_logic_port& CB_Enable, const std_logic_port& CB_WriteMode, 
		const std_logic_vector_port<8>& CB_RegIndex, const std_logic_vector_port<2>& CB_RegComponent, 
		std_logic_vector_port<32>& CB_ReadOutData, const std_logic_vector_port<32>& CB_WriteInData)
	{
		readWriteRequest newRequest;
		newRequest.isEnabled = CB_Enable.GetBoolVal();
		newRequest.isWrite = CB_WriteMode.GetBoolVal();
		newRequest.regIndex = CB_RegIndex.GetUint8Val();
		newRequest.regComponent = CB_RegComponent.GetUint8Val();
		newRequest.writeData = CB_WriteInData.GetFloat32Val();
		pipelineCycles[CBUF_LATENCY_CYCLES] = newRequest;
		if (newRequest.isEnabled)
		{
			if (enableDebugOutput)
				printf("Const Buffer read is queued for register c%u.%c\n", newRequest.regIndex, GetRegChannelLetterFromChannelIndex(newRequest.regComponent) );
		}

		if (CB_Enable.GetBoolVal() )
		{
			const unsigned char regIndex = pipelineCycles[0].regIndex;
			const unsigned char regComponent = pipelineCycles[0].regComponent;
			if (pipelineCycles[0].isWrite)
			{
				float4& writeRegister = constantBufferRegisters[regIndex];
				const float writeData = pipelineCycles[0].writeData;
				switch (regComponent)
				{
				default:
					__debugbreak(); // Should never be here!
				case 0:
					writeRegister.x = writeData;
					break;
				case 1:
					writeRegister.y = writeData;
					break;
				case 2:
					writeRegister.z = writeData;
					break;
				case 3:
					writeRegister.w = writeData;
					break;
				}
			}
			else
			{
				const float4& readRegister = constantBufferRegisters[regIndex];
				float readOutData;
				switch (regComponent)
				{
				default:
					__debugbreak(); // Should never be here!
				case 0:
					readOutData = readRegister.x;
					break;
				case 1:
					readOutData = readRegister.y;
					break;
				case 2:
					readOutData = readRegister.z;
					break;
				case 3:
					readOutData = readRegister.w;
					break;
				}

				CB_ReadOutData = readOutData;

				if (enableDebugOutput)
					printf("Const Buffer reading is available from register c%u.%c = %f\n", regIndex, GetRegChannelLetterFromChannelIndex(regComponent), readOutData);
			}

			for (unsigned x = 0; x < CBUF_LATENCY_CYCLES; ++x)
			{
				pipelineCycles[x] = pipelineCycles[x + 1];
			}
		}
	}
};

class InstructionCacheBRAM
{
public:
	union instructionSlot
	{
		struct _instructionStruct
		{
			// Operation is 5 bits:
			/*[0, 1, 2, 3, 4]*/ InstructionOperation operation : 5; // Starts with Nop=0, ends with End=(~0) (all bits set)

			// DestReg is 8 bits:
			/*[5]*/ InstructionDestRegModifier destReg_destModifier : 1; // None=0, Saturate=1
			/*[6, 7]*/ InstructionDestRegType destReg_regType : 2; // r#/x#/o#/nulloutput
			/*[8, 9, 10]*/ unsigned __int64 destReg_regIndex : 3; // 0-7
			/*[11, 12]*/ InstructionRegComponent destReg_component : 2; // X/Y/Z/W

			// SrcReg is 15 bits:
			/*[13, 14]*/ InstructionSrcRegModifier srcRegA_srcModifier : 2; // None/Neg/Abs/AbsNeg
			/*[15, 16, 17]*/ InstructionSrcRegType srcRegA_regType : 3; // r#/v#/c#/x#/o#/0.0f/1.0f/-1.0f
			/*[18, 19, 20, 21, 22, 23, 24, 25]*/ unsigned __int64 srcRegA_regIndex : 8; // 0-255
			/*[26, 27]*/ InstructionRegComponent srcRegA_component : 2; // X/Y/Z/W

			// SrcReg is 15 bits:
			/*[28, 29]*/ InstructionSrcRegModifier srcRegB_srcModifier : 2; // None/Neg/Abs/AbsNeg
			/*[30, 31, 32]*/ InstructionSrcRegType srcRegB_regType : 3; // r#/v#/c#/x#/o#/0.0f/1.0f/-1.0f
			/*[33, 34, 35, 36, 37, 38, 39, 40]*/ unsigned __int64 srcRegB_regIndex : 8; // 0-255
			/*[41, 42]*/ InstructionRegComponent srcRegB_component : 2; // X/Y/Z/W

			/*[43 thru 63]*/unsigned __int64 unused : 21;
		} instructionStruct;

		unsigned __int64 rawQWORD;
	};
	static_assert(sizeof(instructionSlot) == sizeof(unsigned __int64), "Error: Unexpected union size!");

	static const char* const InstructionOpToString(const InstructionOperation op)
	{
		switch (op)
		{
		default:
			__debugbreak(); // Should never be here
			return "unknown";
		case Op_NOP:
			return "nop";
		case Op_MOV:
			return "mov";
		case Op_ADD:
			return "add";
		case Op_MUL:
			return "mul";
		case Op_MIN:
			return "min";
		case Op_MAX:
			return "max";
		case Op_RCP:
			return "rcp";
		case Op_FRC:
			return "frc";
		case Op_EXPP:
			return "expp";
		case Op_RSQ:
			return "rsq";
		case Op_SLT:
			return "slt";
		case Op_SGE:
			return "sge";
		case Op_SGN:
			return "sgn";
		case Op_RND_SINT24Z:
			return "rnd_sint24z";
		case Op_RND_SINT23NE:
			return "rnd_sint23ne";
		case Op_RND_SINT16NE:
			return "rnd_sint16ne";
		case Op_CNV_UNORM16:
			return "cvt_unorm16";
		case Op_CNV_UNORM8:
			return "cvt_unorm8";
		case Op_SHFT:
			return "shft";
		case Op_END:
			return "end";
		}
	}
	
	static const char* const InstructionDestRegToString(const InstructionDestRegType destReg)
	{
		switch (destReg)
		{
		case DRTyp_R:
			return "r";
		default:
			__debugbreak(); // Should never be here
		case DRTyp_X:
			return "x";
		case DRTyp_O:
			return "o";
		case DRTyp_NULL:
			return "null";
		}
	}

	static const char* const InstructionSrcRegToString(const InstructionSrcRegType srcReg)
	{
		switch (srcReg)
		{
		default:
			__debugbreak(); // Should never be here
		case SRTyp_R:
			return "r";
		case SRTyp_V:
			return "v";
		case SRTyp_C:
			return "c";
		case SRTyp_X:
			return "x";
		case SRTyp_O:
			return "o";
		case SRTyp_0:
			return "0";
		case SRTyp_1:
			return "1";
		case SRTyp_N1:
			return "-1";
		}
	}

	static const char* const InstructionDestRegModToString(const InstructionDestRegModifier destMod)
	{
		switch (destMod)
		{
		default:
			__debugbreak(); // Should never be here
		case DRMod_None:
			return "";
		case DRMod_Sat:
			return "_saturate";
		}
	}

	static const char* const InstructionSrcRegModToString(const InstructionSrcRegModifier srcMod)
	{
		switch (srcMod)
		{
		default:
			__debugbreak(); // Should never be here
		case SRMod_None:
			return "";
		case SRMod_Neg:
			return "_neg";
		case SRMod_Abs:
			return "_abs";
		case SRMod_AbsNeg:
			return "_absneg";
		}
	}

	static void PrintDisasmInstruction(const instructionSlot& instruction)
	{
		printf("%s%s %s%llu.%c, %s%llu%s.%c, %s%llu%s.%c", 
			InstructionOpToString(instruction.instructionStruct.operation), InstructionDestRegModToString(instruction.instructionStruct.destReg_destModifier), // op_destmod
			InstructionDestRegToString(instruction.instructionStruct.destReg_regType), instruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(instruction.instructionStruct.destReg_component), // destRegType%u.channel
			InstructionSrcRegToString(instruction.instructionStruct.srcRegA_regType), instruction.instructionStruct.srcRegA_regIndex, InstructionSrcRegModToString(instruction.instructionStruct.srcRegA_srcModifier), GetRegChannelLetterFromChannelIndex(instruction.instructionStruct.srcRegA_component), // srcRegType%u_srcMod.channel
			InstructionSrcRegToString(instruction.instructionStruct.srcRegB_regType), instruction.instructionStruct.srcRegB_regIndex, InstructionSrcRegModToString(instruction.instructionStruct.srcRegB_srcModifier), GetRegChannelLetterFromChannelIndex(instruction.instructionStruct.srcRegB_component) ); // srcRegType%u_srcMod.channel
	}

	// There are 512 instruction slots in our SDP BRAM36k with a 64 bit width
	instructionSlot instructions[512];

	InstructionCacheBRAM()
	{
		memset(this, 0, sizeof(*this) );
	}

	struct readWriteRequest
	{
		bool isEnabled;
		bool isWrite;
		unsigned short address;
		uint64_t writeData;
	};

	readWriteRequest pipelineData[INST_CACHE_LATENCY_CYCLES + 1] = {0};

	void Update(const std_logic_port& ICache_Enable, const std_logic_port& ICache_WriteMode, 
		const std_logic_vector_port<9>& ICache_Address,
		std_logic_vector_port<64>& ICache_ReadData, const std_logic_vector_port<64>& ICache_WriteData)
	{
		readWriteRequest newRequest;
		newRequest.isEnabled = ICache_Enable.GetBoolVal();
		newRequest.isWrite = ICache_WriteMode.GetBoolVal();
		newRequest.address = ICache_Address.GetUint16Val();
		newRequest.writeData = ICache_WriteData.GetUint64Val();
		pipelineData[INST_CACHE_LATENCY_CYCLES] = newRequest;
		if (newRequest.isEnabled)
		{
			if (enableDebugOutput)
				printf("Instruction cache is queuing a %s at address %u\n", newRequest.isWrite ? "write" : "read", newRequest.address);
		}

		if (ICache_Enable.GetBoolVal() )
		{
			const unsigned short address = pipelineData[0].address;
			if (pipelineData[0].isWrite)
			{
				instructionSlot& writeRegister = instructions[address];
				const unsigned __int64 writeData = pipelineData[0].writeData;
				writeRegister.rawQWORD = writeData;
			}
			else
			{
				const instructionSlot& readRegister = instructions[address];
				ICache_ReadData = readRegister.rawQWORD;
				if (enableDebugOutput)
					printf("Instruction cache read completed (address %u, value=0x%016I64X)\n", address, readRegister.rawQWORD);
			}

			for (unsigned x = 0; x < INST_CACHE_LATENCY_CYCLES; ++x)
			{
				pipelineData[x] = pipelineData[x + 1];
			}
		}
	}
};

class VertexStreamCache
{
private:
	// DWORD vertexCache[1024] = {0};

	const DWORD* streamSources[8] = {0};

	DWORD outputPipeline[4] = {0};
	bool outputPipelineReady[4] = {false};

public:
	void Update(const std_logic_port& VSC_ReadEnable, const std_logic_vector_port<3>& VSC_ReadStreamIndex, const std_logic_vector_port<22>& VSC_ReadDWORDAddr, std_logic_vector_port<32>& VSC_ReadData,
		std_logic_port& VSC_ReadReady, const std_logic_port& VSC_SetStreamVBAddress, const std_logic_vector_port<3>& VSC_StreamIndex, const std_logic_vector_port<30>& VSC_StreamVBAddress,
		const std_logic_port& VSC_InvalidateCache)
	{
		// While cache invalidation and random DRAM latency would be nice to test, let's keep things consistent and just return memory accesses after 3 cycles (pretending like it's always a cache hit)
		if (VSC_InvalidateCache.GetBoolVal() )
		{
		}
		else if (VSC_ReadEnable.GetBoolVal() )
		{
			if (VSC_SetStreamVBAddress.GetBoolVal() )
			{
				__debugbreak(); // Error: Can't concurrently read while setting stream VB address, they live in different processes!
			}

			const unsigned char readStreamIndex = VSC_ReadStreamIndex.GetUint8Val();
			const DWORD* const selectedStream = streamSources[readStreamIndex];
			const unsigned streamDWORDAddress = VSC_ReadDWORDAddr.GetUint32Val();
			outputPipeline[3] = selectedStream[streamDWORDAddress];
			outputPipelineReady[3] = true;
		}

		if (VSC_SetStreamVBAddress.GetBoolVal() )
		{
			if (VSC_ReadEnable.GetBoolVal() )
			{
				__debugbreak(); // Error: Can't concurrently read while setting stream VB address, they live in different processes!
			}

			const unsigned char streamIndex = VSC_StreamIndex.GetUint8Val();
			const DWORD streamAddressBase = VSC_StreamVBAddress.GetUint32Val();
#pragma warning(push)
#pragma warning(disable:4312) // warning C4312: 'reinterpret_cast': conversion from 'uint32_t' to 'const DWORD *' of greater size
			streamSources[streamIndex] = reinterpret_cast<const DWORD* const>(streamAddressBase);
#pragma warning(pop)
		}

		outputPipeline[0] = outputPipeline[1];
		outputPipeline[1] = outputPipeline[2];
		outputPipeline[2] = outputPipeline[3];
		outputPipeline[3] = 0;

		outputPipelineReady[0] = outputPipelineReady[1];
		outputPipelineReady[1] = outputPipelineReady[2];
		outputPipelineReady[2] = outputPipelineReady[3];
		outputPipelineReady[3] = false;

		if (outputPipelineReady[0] && VSC_ReadEnable.GetBoolVal() ) // VSC_ReadEnable must be held high until VSC_ReadReady is set!
		{
			VSC_ReadReady = outputPipelineReady[0];
			VSC_ReadData = (const unsigned)outputPipeline[0];

			for (unsigned x = 0; x < ARRAYSIZE(outputPipelineReady); ++x)
			{
				outputPipelineReady[x] = false; // Clear all of our VSC_ReadReady flags once we receive one so that we pulse it for one cycle
			}
		}
		else if (outputPipelineReady[0])
		{
			__debugbreak(); // Error! You must hold VSC_ReadEnable high until VSC_ReadReady is set!
		}
		else
		{
			VSC_ReadReady = false;
		}
	}
};

struct UNORM8ToFloat
{
	static const float ConvertUNORM8ToFloat(const unsigned byteVal)
	{
		return byteVal / 255.0f;
	}

	static const float4 ConvertD3DCOLORToFloat4(const unsigned d3dColor)
	{
		float4 retColor;
		retColor.x = ConvertUNORM8ToFloat( (d3dColor >> 16) & 0xFF);
		retColor.y = ConvertUNORM8ToFloat( (d3dColor >> 8) & 0xFF);
		retColor.z = ConvertUNORM8ToFloat(d3dColor & 0xFF);
		retColor.w = ConvertUNORM8ToFloat(d3dColor >> 24);
		return retColor;
	}

	void Update(const std_logic_port& UNORM8ToFloat_Enable, const std_logic_vector_port<32>& UNORM8ToFloat_ColorIn,
		std_logic_vector_port<32>& UNORM8ToFloat_ConvertedX, std_logic_vector_port<32>& UNORM8ToFloat_ConvertedY, std_logic_vector_port<32>& UNORM8ToFloat_ConvertedZ, std_logic_vector_port<32>& UNORM8ToFloat_ConvertedW)
	{
		if (UNORM8ToFloat_Enable.GetBoolVal() )
		{
			const DWORD d3dColor = UNORM8ToFloat_ColorIn.GetUint32Val();

			const unsigned B = d3dColor & 0xFF;
			const unsigned G = (d3dColor >> 8) & 0xFF;
			const unsigned R = (d3dColor >> 16) & 0xFF;
			const unsigned A = d3dColor >> 24;

			const float X = ConvertUNORM8ToFloat(R);
			const float Y = ConvertUNORM8ToFloat(G);
			const float Z = ConvertUNORM8ToFloat(B);
			const float W = ConvertUNORM8ToFloat(A);

			UNORM8ToFloat_ConvertedX = X;
			UNORM8ToFloat_ConvertedY = Y;
			UNORM8ToFloat_ConvertedZ = Z;
			UNORM8ToFloat_ConvertedW = W;
		}
	}
};

struct ShaderCore
{
	// Emulated modules:
	VertexStreamCache VSC;
	VBB_FIFO VBB;
	VBO_FIFO VBO;
	InstructionCacheBRAM InstructionCache;
	ConstantBufferBRAM ConstBuffer;
	FPU FPU0 = FPU(0);
	FPU FPU1 = FPU(1);
	FPU FPU2 = FPU(2);
	FPU FPU3 = FPU(3);
	GPRQuad RegisterFile;
	UNORM8ToFloat ColorUnpacker;
};

static const testVert3D cubeVertices[] =
{
	// POS(X, Y, Z), TEXCOORD(X, Y), NORMAL(X, Y, Z), COLOR (0xAARRGGBB)
	{ {-1.0f,-1.0f,-1.0f}, {0.0f, 0.0f}, {-1.0f, 0.0f, 0.0f}, 0xFF000000 }, // Vert 0, Triangle 0
	{ {-1.0f,-1.0f, 1.0f}, {0.0f, 0.0f}, {-1.0f, 0.0f, 0.0f}, 0xFF0000FF },
	{ {-1.0f, 1.0f, 1.0f}, {0.0f, 1.0f}, {-1.0f, 0.0f, 0.0f}, 0xFF00FFFF },

	{ { 1.0f, 1.0f,-1.0f}, {1.0f, 1.0f}, {0.0f, 0.0f, -1.0f}, 0xFFFFFF00 }, // Vert 3, Triangle 1
	{ {-1.0f,-1.0f,-1.0f}, {0.0f, 0.0f}, {0.0f, 0.0f, -1.0f}, 0xFF000000 },
	{ {-1.0f, 1.0f,-1.0f}, {0.0f, 1.0f}, {0.0f, 0.0f, -1.0f}, 0xFF00FF00 },

	{ { 1.0f,-1.0f, 1.0f}, {1.0f, 0.0f}, {0.0f, -1.0f, 0.0f}, 0xFFFF00FF }, // Vert 6, Triangle 2
	{ {-1.0f,-1.0f,-1.0f}, {0.0f, 0.0f}, {0.0f, -1.0f, 0.0f}, 0xFF000000 },
	{ { 1.0f,-1.0f,-1.0f}, {1.0f, 0.0f}, {0.0f, -1.0f, 0.0f}, 0xFFFF0000 },

	{ { 1.0f, 1.0f,-1.0f}, {1.0f, 1.0f}, {0.0f, 0.0f, -1.0f}, 0xFFFFFF00 }, // Vert 9, Triangle 3
	{ { 1.0f,-1.0f,-1.0f}, {1.0f, 0.0f}, {0.0f, 0.0f, -1.0f}, 0xFFFF0000 },
	{ {-1.0f,-1.0f,-1.0f}, {0.0f, 0.0f}, {0.0f, 0.0f, -1.0f}, 0xFF000000 },

	{ {-1.0f,-1.0f,-1.0f}, {0.0f, 0.0f}, {-1.0f, 0.0f, 0.0f}, 0xFF000000 }, // Vert 12, Triangle 4
	{ {-1.0f, 1.0f, 1.0f}, {0.0f, 1.0f}, {-1.0f, 0.0f, 0.0f}, 0xFF00FFFF },
	{ {-1.0f, 1.0f,-1.0f}, {0.0f, 1.0f}, {-1.0f, 0.0f, 0.0f}, 0xFF00FF00 },

	{ { 1.0f,-1.0f, 1.0f}, {1.0f, 0.0f}, {0.0f, -1.0f, 0.0f}, 0xFFFF00FF }, // Vert 15, Triangle 5
	{ {-1.0f,-1.0f, 1.0f}, {0.0f, 0.0f}, {0.0f, -1.0f, 0.0f}, 0xFF0000FF },
	{ {-1.0f,-1.0f,-1.0f}, {0.0f, 0.0f}, {0.0f, -1.0f, 0.0f}, 0xFF000000 },

	{ {-1.0f, 1.0f, 1.0f}, {0.0f, 1.0f}, {0.0f, 0.0f, 1.0f}, 0xFF00FFFF }, // Vert 18, Triangle 6
	{ {-1.0f,-1.0f, 1.0f}, {0.0f, 0.0f}, {0.0f, 0.0f, 1.0f}, 0xFF0000FF },
	{ { 1.0f,-1.0f, 1.0f}, {1.0f, 0.0f}, {0.0f, 0.0f, 1.0f}, 0xFFFF00FF },

	{ { 1.0f, 1.0f, 1.0f}, {1.0f, 1.0f}, {1.0f, 0.0f, 0.0f}, 0xFFFFFFFF }, // Vert 21, Triangle 7
	{ { 1.0f,-1.0f,-1.0f}, {1.0f, 0.0f}, {1.0f, 0.0f, 0.0f}, 0xFFFF0000 },
	{ { 1.0f, 1.0f,-1.0f}, {1.0f, 1.0f}, {1.0f, 0.0f, 0.0f}, 0xFFFFFF00 },

	{ { 1.0f,-1.0f,-1.0f}, {1.0f, 0.0f}, {1.0f, 0.0f, 0.0f}, 0xFFFF0000 }, // Vert 24, Triangle 8
	{ { 1.0f, 1.0f, 1.0f}, {1.0f, 1.0f}, {1.0f, 0.0f, 0.0f}, 0xFFFFFFFF },
	{ { 1.0f,-1.0f, 1.0f}, {1.0f, 0.0f}, {1.0f, 0.0f, 0.0f}, 0xFFFF00FF },

	{ { 1.0f, 1.0f, 1.0f}, {1.0f, 1.0f}, {0.0f, 1.0f, 0.0f}, 0xFFFFFFFF }, // Vert 27, Triangle 9
	{ { 1.0f, 1.0f,-1.0f}, {1.0f, 1.0f}, {0.0f, 1.0f, 0.0f}, 0xFFFFFF00 },
	{ {-1.0f, 1.0f,-1.0f}, {0.0f, 1.0f}, {0.0f, 1.0f, 0.0f}, 0xFF00FF00 },

	{ { 1.0f, 1.0f, 1.0f}, {1.0f, 1.0f}, {0.0f, 1.0f, 0.0f}, 0xFFFFFFFF }, // Vert 30, Triangle 10
	{ {-1.0f, 1.0f,-1.0f}, {0.0f, 1.0f}, {0.0f, 1.0f, 0.0f}, 0xFF00FF00 },
	{ {-1.0f, 1.0f, 1.0f}, {0.0f, 1.0f}, {0.0f, 1.0f, 0.0f}, 0xFF00FFFF },

	{ { 1.0f, 1.0f, 1.0f}, {1.0f, 1.0f}, {0.0f, 0.0f, 1.0f}, 0xFFFFFFFF }, // Vert 33, Triangle 11
	{ {-1.0f, 1.0f, 1.0f}, {0.0f, 1.0f}, {0.0f, 0.0f, 1.0f}, 0xFF00FFFF },
	{ { 1.0f,-1.0f, 1.0f}, {1.0f, 0.0f}, {0.0f, 0.0f, 1.0f}, 0xFFFF00FF }
};

static const float wvpMatrix[] =
{
	-0.735491633f,
	0.0992588177f,
	0.168724433f,
	0.168707564f,

	0.00000000f,
	0.861891448f,
	-0.507143259f,
	-0.507092535f,

	0.146805763f,
	0.497283071f,
	0.845303357f,
	0.845218837f,

	0.294174194f,
	-0.729292750f,
	2.60475421f,
	2.70449352f
};

static const float wvInvTransposeMatrix[] =
{
	-0.980655789f,
	7.45058326e-09f,
	0.195741087f,
	0.00000000f,
	0.0992588475f,
	0.861891866f,
	0.497283280f,
	0.00000000f,
	-0.168707579f,
	0.507092595f,
	-0.845218956f,
	0.00000000f,
	0.000764996104f,
	2.00000024f,
	-1.99999988f,
	1.00000012f
};

// Test executing a vs_2_0 shader that computes N dot L lighting for a single directional light and multiplies that with the vertex color
static const InstructionCacheBRAM::instructionSlot testInstructionStream[] =
{
// mul r0, v0.y, c1
{ {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 1 /*src1RegIndex*/, Chan_X} }, // IP[0]: mul r0.x, v0.y, c1.x
{ {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 1 /*src1RegIndex*/, Chan_Y} }, // IP[1]: mul r0.y, v0.y, c1.y
{ {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 1 /*src1RegIndex*/, Chan_Z} }, // IP[2]: mul r0.z, v0.y, c1.z
{ {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 1 /*src1RegIndex*/, Chan_W} }, // IP[3]: mul r0.w, v0.y, c1.w
// mad r0, v0.x, c0, r0
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 0 /*src1RegIndex*/, Chan_X} }, // IP[4]: mul x0.x, v0.x, c0.x
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 0 /*src1RegIndex*/, Chan_Y} }, // IP[5]: mul x0.y, v0.x, c0.y
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 0 /*src1RegIndex*/, Chan_Z} }, // IP[6]: mul x0.z, v0.x, c0.z
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 0 /*src1RegIndex*/, Chan_W} }, // IP[7]: mul x0.w, v0.x, c0.w
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_X} }, // IP[8]: add r0.x, x0.x, r0.x
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Y} }, // IP[9]: add r0.y, x0.y, r0.y
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Z} }, // IP[10]: add r0.z, x0.z, r0.z
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_W} }, // IP[11]: add r0.w, x0.w, r0.w
// mad r0, v0.z, c2, r0
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 2 /*src1RegIndex*/, Chan_X} }, // IP[12]: mul x0.x, v0.z, c2.x 
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 2 /*src1RegIndex*/, Chan_Y} }, // IP[13]: mul x0.y, v0.z, c2.y
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 2 /*src1RegIndex*/, Chan_Z} }, // IP[14]: mul x0.z, v0.z, c2.z
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 2 /*src1RegIndex*/, Chan_W} }, // IP[15]: mul x0.w, v0.z, c2.w
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_X} }, // IP[16]: add r0.x, x0.x, r0.x
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Y} }, // IP[17]: add r0.y, x0.y, r0.y
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Z} }, // IP[18]: add r0.z, x0.z, r0.z
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_W} }, // IP[19]: add r0.w, x0.w, r0.w
// add oPos, r0, c3
{ {Op_ADD, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 3 /*src1RegIndex*/, Chan_X} }, // IP[20]: add o0.x, r0.x, c3.x
{ {Op_ADD, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 3 /*src1RegIndex*/, Chan_Y} }, // IP[21]: add o0.y, r0.y, c3.y
{ {Op_ADD, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 3 /*src1RegIndex*/, Chan_Z} }, // IP[22]: add o0.z, r0.z, c3.z
{ {Op_ADD, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_C, 3 /*src1RegIndex*/, Chan_W} }, // IP[23]: add o0.w, r0.w, c3.w
// mul r0.xyz, v2.y, c5
{ {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, 2 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 5 /*src1RegIndex*/, Chan_X} }, // IP[24]: mul r0.x, v2.y, c5.x
{ {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, 2 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 5 /*src1RegIndex*/, Chan_Y} }, // IP[25]: mul r0.y, v2.y, c5.y
{ {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, 2 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 5 /*src1RegIndex*/, Chan_Z} }, // IP[26]: mul r0.z, v2.y, c5.z
// mad r0.xyz, v2.x, c4, r0
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, 2 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 4 /*src1RegIndex*/, Chan_X} }, // IP[27]: mul x0.x, v2.x, c4.x
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, 2 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 4 /*src1RegIndex*/, Chan_Y} }, // IP[28]: mul x0.y, v2.x, c4.y
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, 2 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 4 /*src1RegIndex*/, Chan_Z} }, // IP[29]: mul x0.z, v2.x, c4.z
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_X} }, // IP[30]: add r0.x, x0.x, r0.x
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Y} }, // IP[31]: add r0.y, x0.y, r0.y
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Z} }, // IP[32]: add r0.z, x0.z, r0.z
// mad r0.xyz, v2.z, c6, r0
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, 2 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 6 /*src1RegIndex*/, Chan_X} }, // IP[33]: mul x0.x, v2.z, c6.x
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, 2 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 6 /*src1RegIndex*/, Chan_Y} }, // IP[34]: mul x0.y, v2.z, c6.y
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, 2 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 6 /*src1RegIndex*/, Chan_Z} }, // IP[35]: mul x0.z, v2.z, c6.z
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_X} }, // IP[36]: add r0.x, x0.x, r0.x
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Y} }, // IP[37]: add r0.y, x0.y, r0.y
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Z} }, // IP[38]: add r0.z, x0.z, r0.z
// dp3 r0.x, r0, -c8
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_X, SRMod_Neg, SRTyp_C, 8 /*src1RegIndex*/, Chan_X} }, // IP[39]: mul x0.x, r0.x, -c8.x
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_Y, SRMod_Neg, SRTyp_C, 8 /*src1RegIndex*/, Chan_Y} }, // IP[40]: mul x0.y, r0.y, -c8.y
{ {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_Z, SRMod_Neg, SRTyp_C, 8 /*src1RegIndex*/, Chan_Z} }, // IP[41]: mul x0.z, r0.z, -c8.z
{ {Op_ADD, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src1RegIndex*/, Chan_Y} }, // IP[42]: add x0.x, x0.x, x0.y
{ {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src1RegIndex*/, Chan_Z} }, // IP[43]: add r0.x, x0.x, x0.z
// max r0.x, r0.x, c7.x
{ {Op_MAX, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 7 /*src1RegIndex*/, Chan_X} }, // IP[44]: max r0.x, r0.x, c7.x
// min r0.x, r0.x, c7.y
{ {Op_MIN, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 7 /*src1RegIndex*/, Chan_Y} }, // IP[45]: min r0.x, r0.x, c7.y
// mov x1.x, r0.x
{ {Op_MOV, DRMod_None, DRTyp_X, 1 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[46]: mov x1.x, r0.x, 0.x
// mul r0, x1.x, v3
{ {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_X, 1 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_V, 3 /*src1RegIndex*/, Chan_X} }, // IP[47]: mul r0.x, x1.x, v3.x
{ {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 1 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_V, 3 /*src1RegIndex*/, Chan_Y} }, // IP[48]: mul r0.y, x1.x, v3.y
{ {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 1 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_V, 3 /*src1RegIndex*/, Chan_Z} }, // IP[49]: mul r0.z, x1.x, v3.z
{ {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_X, 1 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_V, 3 /*src1RegIndex*/, Chan_W} }, // IP[50]: mul r0.w, x1.x, v3.w
// abs r1, c9 = mov r1, c9_abs
{ {Op_MOV, DRMod_None, DRTyp_R, 1 /*destRegIndex*/, Chan_X, SRMod_Abs, SRTyp_C, 9 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[51]: mov r1.x, c9.x_abs, 0.x
{ {Op_MOV, DRMod_None, DRTyp_R, 1 /*destRegIndex*/, Chan_Y, SRMod_Abs, SRTyp_C, 9 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[52]: mov r1.y, c9.y_abs, 0.x
{ {Op_MOV, DRMod_None, DRTyp_R, 1 /*destRegIndex*/, Chan_Z, SRMod_Abs, SRTyp_C, 9 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[53]: mov r1.z, c9.z_abs, 0.x
{ {Op_MOV, DRMod_None, DRTyp_R, 1 /*destRegIndex*/, Chan_W, SRMod_Abs, SRTyp_C, 9 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[54]: mov r1.w, c9.w_abs, 0.x
// mul oD0, r0, r1
{ {Op_MUL, DRMod_None, DRTyp_O, 1 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_R, 1 /*src1RegIndex*/, Chan_X} }, // IP[55]: mul o1.x, r0.x, r1.x
{ {Op_MUL, DRMod_None, DRTyp_O, 1 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_R, 1 /*src1RegIndex*/, Chan_Y} }, // IP[56]: mul o1.y, r0.y, r1.y
{ {Op_MUL, DRMod_None, DRTyp_O, 1 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_R, 1 /*src1RegIndex*/, Chan_Z} }, // IP[57]: mul o1.z, r0.z, r1.z
{ {Op_MUL, DRMod_None, DRTyp_O, 1 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_R, 1 /*src1RegIndex*/, Chan_W} }, // IP[58]: mul o1.w, r0.w, r1.w
// mov oT0.xy, v1
{ {Op_MOV, DRMod_None, DRTyp_O, 2 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, 1 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }, // IP[59]: mov o2.x, v1.x, 0.x
{ {Op_MOV, DRMod_None, DRTyp_O, 2 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, 1 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }, // IP[60]: mov o2.y, v1.y, 0.x
// rcp x1.w, oPos.w
{ {Op_RCP, DRMod_None, DRTyp_X, 1 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_O, 0 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }, // IP[61]: rcp x1.w, o0.w, 0.x
// mul oPos.xz, oPos.xz, x1.w
{ {Op_MUL, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_X, 1 /*src1RegIndex*/, Chan_W} }, // IP[62]: mul o0.x, o0.x, x1.w
{ {Op_MUL, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 1 /*src1RegIndex*/, Chan_W} }, // IP[63]: mul o0.z, o0.z, x1.w
// mul oPos.y, oPos.y, x1.w
{ {Op_MUL, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 1 /*src1RegIndex*/, Chan_W} }, // IP[64]: mul o0.y, o0.y, x1.w
// mul oPos.xyz, oPos.xyz, c10.xyz
{ {Op_MUL, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 10 /*src1RegIndex*/, Chan_X} }, // IP[65]: mul o0.x, o0.x, c10.x
{ {Op_MUL, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_Y, SRMod_Neg, SRTyp_O, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 10 /*src1RegIndex*/, Chan_Y} }, // IP[66]: mul o0.y, -o0.y, c10.y
{ {Op_MUL, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 10 /*src1RegIndex*/, Chan_Z} }, // IP[67]: mul o0.z, o0.z, c10.z // Note: This Z scale and offset is optional if the viewport Z scale is 1.0f and the Z offset is 0.0f
// add oPos.xyz, oPos.xyz, c10.xyw
{ {Op_ADD, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 10 /*src1RegIndex*/, Chan_X} }, // IP[68]: add o0.x, o0.x, c10.x
{ {Op_ADD, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 10 /*src1RegIndex*/, Chan_Y} }, // IP[69]: add o0.y, o0.y, c10.y
{ {Op_ADD, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 10 /*src1RegIndex*/, Chan_W} }, // IP[70]: add o0.z, o0.z, c10.w

{ {Op_CNV_UNORM16, DRMod_None, DRTyp_O, 2 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, 2 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[71]: cnv_unorm16 o2.x, o2.x, 0.x
{ {Op_CNV_UNORM16, DRMod_None, DRTyp_O, 2 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, 2 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[72]: cnv_unorm16 o2.y, o2.y, 0.x

{ {Op_CNV_UNORM8, DRMod_None, DRTyp_O, 1 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, 1 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[73]: cnv_unorm8 o1.x, o1.x, 0.x
{ {Op_CNV_UNORM8, DRMod_None, DRTyp_O, 1 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, 1 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[74]: cnv_unorm8 o1.y, o1.y, 0.x
{ {Op_CNV_UNORM8, DRMod_None, DRTyp_O, 1 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, 1 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[75]: cnv_unorm8 o1.z, o1.z, 0.x
{ {Op_CNV_UNORM8, DRMod_None, DRTyp_O, 1 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_O, 1 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[76]: cnv_unorm8 o1.w, o1.w, 0.x

{ {Op_RND_SINT16NE, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[77]: rnd_sint16ne o0.x, o0.x, 0.x
{ {Op_RND_SINT16NE, DRMod_None, DRTyp_O, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[78]: rnd_sint16ne o0.y, o0.y, 0.x

// nops before the end to ensure we're done writing all regs by the time the shader finishes
{ {Op_NOP, DRMod_None, DRTyp_NULL, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[79]: nop 0.x, 0.x, 0.x
{ {Op_NOP, DRMod_None, DRTyp_NULL, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }, // IP[80]: nop 0.x, 0.x, 0.x
// end
{ {Op_END, DRMod_None, DRTyp_NULL, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} } // IP[81]: end
};
static_assert(ARRAYSIZE(testInstructionStream) < ARRAYSIZE(InstructionCacheBRAM::instructions), "Error: Test shader will not fit into the instruction cache!");

static void VerifyInstructionCacheIntegrity(const InstructionCacheBRAM& instructionCache)
{
	for (unsigned x = 0; x < ARRAYSIZE(testInstructionStream); ++x)
	{
		if (instructionCache.instructions[x].rawQWORD != testInstructionStream[x].rawQWORD)
		{
			__debugbreak();
		}
	}
}

static void VerifyInputRegisterIntegrity(const GPRQuad& registerFile)
{
	// Verify that our first batch of vertices made it all the way from the VSC through the VBB and into the input registers in our register file correctly:
	for (unsigned vertQuadGroups = 0; vertQuadGroups < (15 + 1) / 4; ++vertQuadGroups)
	{
		for (unsigned vertID = 0; vertID < 4; ++vertID)
		{
			const unsigned vertIndex = vertID + vertQuadGroups * 4;
			if (vertIndex < 15)
			{
				const testVert3D& thisVert = cubeVertices[vertIndex];
				const float* floatVec;

				// POSITION0 is v0:
				const float4 position_x = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 0, 0);
				floatVec = &position_x.x;
				if (floatVec[vertID] != thisVert.xyz.x)
				{
					__debugbreak();
				}
				const float4 position_y = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 0, 1);
				floatVec = &position_y.x;
				if (floatVec[vertID] != thisVert.xyz.y)
				{
					__debugbreak();
				}
				const float4 position_z = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 0, 2);
				floatVec = &position_z.x;
				if (floatVec[vertID] != thisVert.xyz.z)
				{
					__debugbreak();
				}

				// TEXCOORD0 is v1:
				const float4 texcoord_x = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 1, 0);
				floatVec = &texcoord_x.x;
				if (floatVec[vertID] != thisVert.texcoord.x)
				{
					__debugbreak();
				}
				const float4 texcoord_y = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 1, 1);
				floatVec = &texcoord_y.x;
				if (floatVec[vertID] != thisVert.texcoord.y)
				{
					__debugbreak();
				}

				// NORMAL0 is v2:
				const float4 normal_x = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 2, 0);
				floatVec = &normal_x.x;
				if (floatVec[vertID] != thisVert.normal.x)
				{
					__debugbreak();
				}
				const float4 normal_y = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 2, 1);
				floatVec = &normal_y.x;
				if (floatVec[vertID] != thisVert.normal.y)
				{
					__debugbreak();
				}
				const float4 normal_z = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 2, 2);
				floatVec = &normal_z.x;
				if (floatVec[vertID] != thisVert.normal.z)
				{
					__debugbreak();
				}


				// COLOR0 is v3:
				const float4 convertedVertexColor = UNORM8ToFloat::ConvertD3DCOLORToFloat4(thisVert.color);
				const float4 color_x = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 3, 0);
				floatVec = &color_x.x;
				if (floatVec[vertID] != convertedVertexColor.x)
				{
					__debugbreak();
				}
				const float4 color_y = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 3, 1);
				floatVec = &color_y.x;
				if (floatVec[vertID] != convertedVertexColor.y)
				{
					__debugbreak();
				}
				const float4 color_z = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 3, 2);
				floatVec = &color_z.x;
				if (floatVec[vertID] != convertedVertexColor.z)
				{
					__debugbreak();
				}
				const float4 color_w = registerFile.DebugReadGPR(vertQuadGroups, RFType_VInput, 3, 3);
				floatVec = &color_w.x;
				if (floatVec[vertID] != convertedVertexColor.w)
				{
					__debugbreak();
				}
			}
		}
	}
}

static void ShaderTransformFloat4Pos(const float3& inPos, float4& outPos)
{
	float4 r0;
	float4 x1;

	// mul r0, v0.y, c1
	r0.x = inPos.y * wvpMatrix[1 * 4 + 0];
	r0.y = inPos.y * wvpMatrix[1 * 4 + 1];
	r0.z = inPos.y * wvpMatrix[1 * 4 + 2];
	r0.w = inPos.y * wvpMatrix[1 * 4 + 3];

	// mad r0, v0.x, c0, r0
	r0.x += inPos.x * wvpMatrix[0 * 4 + 0];
	r0.y += inPos.x * wvpMatrix[0 * 4 + 1];
	r0.z += inPos.x * wvpMatrix[0 * 4 + 2];
	r0.w += inPos.x * wvpMatrix[0 * 4 + 3];

	// mad r0, v0.z, c2, r0
	r0.x += inPos.z * wvpMatrix[2 * 4 + 0];
	r0.y += inPos.z * wvpMatrix[2 * 4 + 1];
	r0.z += inPos.z * wvpMatrix[2 * 4 + 2];
	r0.w += inPos.z * wvpMatrix[2 * 4 + 3];

	// add oPos, r0, c3
	outPos.x = r0.x + wvpMatrix[3 * 4 + 0];
	outPos.y = r0.y + wvpMatrix[3 * 4 + 1];
	outPos.z = r0.z + wvpMatrix[3 * 4 + 2];
	outPos.w = r0.w + wvpMatrix[3 * 4 + 3];

	// rcp x1.w, oPos.w
	x1.w = 1.0f / outPos.w;

	// mul oPos.xz, oPos.xyz, x1.w
	outPos.x *= x1.w;
	outPos.z *= x1.w;

	// mul oPos.y, -oPos.y, x1.w
	outPos.y = -outPos.y * x1.w;

	// Note that the Z component scale and offset is not needed if the scale is 1.0f and the offset is 0.0f
	const float4 constViewportScaleOffset = { 640.0f / 2.0f, 480.0f / 2.0f, 1.0f, 0.0f };

	// mul oPos.xyz, oPos.xyz, c10.xyz
	outPos.x *= constViewportScaleOffset.x;
	outPos.y *= constViewportScaleOffset.y;
	outPos.z *= constViewportScaleOffset.z;

	// add oPos.xyz, oPos.xyz, c10.xyw
	outPos.x += constViewportScaleOffset.x;
	outPos.y += constViewportScaleOffset.y;
	outPos.z += constViewportScaleOffset.w;

	// rnd_sint16ne oPos.xy, oPos.xy
	const int oPos16_x = FPU::ComputeConvert(outPos.x, F_to_I16_RoundNearestEven) & 0xFFFF;
	const int oPos16_y = FPU::ComputeConvert(outPos.y, F_to_I16_RoundNearestEven) & 0xFFFF;
	outPos.x = *reinterpret_cast<const float* const>(&oPos16_x);
	outPos.y = *reinterpret_cast<const float* const>(&oPos16_y);
}

static void ShaderEmulateColoredLighting(const float3& inNormal, const float4& inColor, float4& outColor)
{
	float4 r0, r1;

	// mul r0.xyz, v2.y, c5
	r0.x = inNormal.y * wvInvTransposeMatrix[1 * 4 + 0];
	r0.y = inNormal.y * wvInvTransposeMatrix[1 * 4 + 1];
	r0.z = inNormal.y * wvInvTransposeMatrix[1 * 4 + 2];

    // mad r0.xyz, v2.x, c4, r0
	r0.x += inNormal.x * wvInvTransposeMatrix[0 * 4 + 0];
	r0.y += inNormal.x * wvInvTransposeMatrix[0 * 4 + 1];
	r0.z += inNormal.x * wvInvTransposeMatrix[0 * 4 + 2];

    // mad r0.xyz, v2.z, c6, r0
	r0.x += inNormal.z * wvInvTransposeMatrix[2 * 4 + 0];
	r0.y += inNormal.z * wvInvTransposeMatrix[2 * 4 + 1];
	r0.z += inNormal.z * wvInvTransposeMatrix[2 * 4 + 2];

    // dp3 r0.x, r0, -c8
	const float4 constLightDir = { -0.95f, -0.925f, -0.9f, 0.0f };
	r0.x = (r0.x * -constLightDir.x) + (r0.y * -constLightDir.y) + (r0.z * -constLightDir.z);

    // max r0.x, r0.x, c7.x
    // min r0.x, r0.x, c7.y
	if (r0.x > 1.0f)
		r0.x = 1.0f;
	else if (r0.x < 0.0f)
		r0.x = 0.0f;

    // mul r0, r0.x, v3
	const float tempSave = r0.x;
	r0.x = tempSave * inColor.x;
	r0.y = tempSave * inColor.y;
	r0.z = tempSave * inColor.z;
	r0.w = tempSave * inColor.w;

    // abs r1, c9 = mov(r1, c9_abs)
	const float4 constLightColor = { 0.95f, 0.925f, 0.975f, 1.0f };
	r1.x = fabs(constLightColor.x);
	r1.y = fabs(constLightColor.y);
	r1.z = fabs(constLightColor.z);
	r1.w = fabs(constLightColor.w);

    // mul oD0, r0, r1
	outColor.x = r0.x * r1.x;
	outColor.y = r0.y * r1.y;
	outColor.z = r0.z * r1.z;
	outColor.w = r0.w * r1.w;

	// cvt_unorm8 oD0, oD0
	const int oD8_r = FPU::ComputeConvert(outColor.x, F_to_UNORM8) & 0xFF;
	const int oD8_g = FPU::ComputeConvert(outColor.y, F_to_UNORM8) & 0xFF;
	const int oD8_b = FPU::ComputeConvert(outColor.z, F_to_UNORM8) & 0xFF;
	const int oD8_a = FPU::ComputeConvert(outColor.w, F_to_UNORM8) & 0xFF;
	outColor.x = *reinterpret_cast<const float* const>(&oD8_r);
	outColor.y = *reinterpret_cast<const float* const>(&oD8_g);
	outColor.z = *reinterpret_cast<const float* const>(&oD8_b);
	outColor.w = *reinterpret_cast<const float* const>(&oD8_a);
}

static void VerifyVBOIntegrity(const std::vector<VBO_FIFO::VBOEntry>& outVBO)
{
	/*	0 => ( resultDWORDIdx => to_unsigned(0, 2), destBytes => ODB_Write16B_16A, readRegIdx => to_unsigned(0, 3), regComponent_PortA => Comp_X, regComponent_PortB => Comp_Y ), -- res[0] = (o0.y<<16)|o0.x;
	1 => ( resultDWORDIdx => to_unsigned(1, 2), destBytes => ODB_Write32A, readRegIdx => to_unsigned(0, 3), regComponent_PortA => Comp_Z, regComponent_PortB => Comp_Z ), -- res[1] = o0.z;
	2 => ( resultDWORDIdx => to_unsigned(2, 2), destBytes => ODB_Write16B_16A, readRegIdx => to_unsigned(2, 3), regComponent_PortA => Comp_X, regComponent_PortB => Comp_Y ), -- res[2] = (o2.y<<16)|o2.x;
	3 => ( resultDWORDIdx => to_unsigned(3, 2), destBytes => ODB_Write8B_8A_Low, readRegIdx => to_unsigned(1, 3), regComponent_PortA => Comp_X, regComponent_PortB => Comp_Y ), -- res[3] = (o1.y<<8)|o1.x;
	4 => ( resultDWORDIdx => to_unsigned(3, 2), destBytes => ODB_Write8B_8A_High, readRegIdx => to_unsigned(1, 3), regComponent_PortA => Comp_Z, regComponent_PortB => Comp_W ) -- res[3] = (o1.w<<24)|(o1.z<<16)|res[3];	*/
	if (outVBO.size() < 15)
	{
		__debugbreak();
	}
	for (unsigned vertIndex = 0; vertIndex < 15; ++vertIndex)
	{
		const testVert3D& thisVert = cubeVertices[vertIndex];
		const VBO_FIFO::VBOEntry& thisVBO = outVBO[vertIndex];

		float4 trueOutPos;
		ShaderTransformFloat4Pos(thisVert.xyz, trueOutPos);
		const DWORD reg0 = *reinterpret_cast<const DWORD*>(&trueOutPos.x) | (*reinterpret_cast<const DWORD*>(&trueOutPos.y) << 16);
		if (reg0 != thisVBO.registers[0].intReg)
		{
			__debugbreak();
		}
		const DWORD reg1 = *reinterpret_cast<const DWORD*>(&trueOutPos.z);
		if (reg1 != thisVBO.registers[1].intReg)
		{
			__debugbreak();
		}

		const DWORD oTexcoord0_x = FPU::ComputeConvert(thisVert.texcoord.x, F_to_UNORM16) & 0xFFFF;
		const DWORD oTexcoord0_y = FPU::ComputeConvert(thisVert.texcoord.y, F_to_UNORM16) & 0xFFFF;
		const DWORD reg2 = oTexcoord0_x | (oTexcoord0_y << 16);
		if (reg2 != thisVBO.registers[2].intReg)
		{
			__debugbreak();
		}

		float4 trueOutColor;
		const float4 convertedInputColor = UNORM8ToFloat::ConvertD3DCOLORToFloat4(thisVert.color);
		ShaderEmulateColoredLighting(thisVert.normal, convertedInputColor, trueOutColor);
		const DWORD reg3 = *reinterpret_cast<const DWORD*>(&trueOutColor.x) | (*reinterpret_cast<const DWORD*>(&trueOutColor.y) << 8) | (*reinterpret_cast<const DWORD*>(&trueOutColor.z) << 16) | (*reinterpret_cast<const DWORD*>(&trueOutColor.w) << 24);
		if (reg3 != thisVBO.registers[3].intReg)
		{
			__debugbreak();
		}
	}
}

static void VerifyOutputRegisterIntegrity(const GPRQuad& registerFile)
{
	testVertOutputRHW outputVertices[15];

	for (unsigned vertQuadGroups = 0; vertQuadGroups < (15 + 1) / 4; ++vertQuadGroups)
	{
		for (unsigned vertID = 0; vertID < 4; ++vertID)
		{
			const unsigned vertIndex = vertID + vertQuadGroups * 4;
			if (vertIndex < 15)
			{
				const testVert3D& thisVert = cubeVertices[vertIndex];
				testVertOutputRHW& thisOutputVert = outputVertices[vertIndex];
				const float* floatVec;

				// OPOSITION0 is o0:
				const float4 position_x = registerFile.DebugReadGPR(vertQuadGroups, RFType_OOutput, 0, 0);
				floatVec = &position_x.x;
				thisOutputVert.xyzw.x = floatVec[vertID];

				const float4 position_y = registerFile.DebugReadGPR(vertQuadGroups, RFType_OOutput, 0, 1);
				floatVec = &position_y.x;
				thisOutputVert.xyzw.y = floatVec[vertID];

				const float4 position_z = registerFile.DebugReadGPR(vertQuadGroups, RFType_OOutput, 0, 2);
				floatVec = &position_z.x;
				thisOutputVert.xyzw.z = floatVec[vertID];

				const float4 position_w = registerFile.DebugReadGPR(vertQuadGroups, RFType_OOutput, 0, 3);
				floatVec = &position_w.x;
				thisOutputVert.xyzw.w = floatVec[vertID];

				float4 trueOutPos;
				ShaderTransformFloat4Pos(thisVert.xyz, trueOutPos);
				if (!(trueOutPos == thisOutputVert.xyzw) )
				{
					__debugbreak();
				}

				// OTEXCOORD0 is o2:
				const float4 texcoord_x = registerFile.DebugReadGPR(vertQuadGroups, RFType_OOutput, 2, 0);
				floatVec = &texcoord_x.x;
				thisOutputVert.texcoord.x = floatVec[vertID];

				const float4 texcoord_y = registerFile.DebugReadGPR(vertQuadGroups, RFType_OOutput, 2, 1);
				floatVec = &texcoord_y.x;
				thisOutputVert.texcoord.y = floatVec[vertID];

				// cvt_unorm16 oTexcoord0.xy, oTexcoord0.xy
				float2 trueTexcoord;
				const int oTexcoord0_x = FPU::ComputeConvert(thisVert.texcoord.x, F_to_UNORM16) & 0xFFFF;
				const int oTexcoord0_y = FPU::ComputeConvert(thisVert.texcoord.y, F_to_UNORM16) & 0xFFFF;
				trueTexcoord.x = *reinterpret_cast<const float* const>(&oTexcoord0_x);
				trueTexcoord.y = *reinterpret_cast<const float* const>(&oTexcoord0_y);

				if (!(thisOutputVert.texcoord == trueTexcoord) )
				{
					__debugbreak();
				}

				// OCOLOR0 is o1:
				const float4 diffuse_x = registerFile.DebugReadGPR(vertQuadGroups, RFType_OOutput, 1, 0);
				floatVec = &diffuse_x.x;
				thisOutputVert.diffuse.x = floatVec[vertID];

				const float4 diffuse_y = registerFile.DebugReadGPR(vertQuadGroups, RFType_OOutput, 1, 1);
				floatVec = &diffuse_y.x;
				thisOutputVert.diffuse.y = floatVec[vertID];

				const float4 diffuse_z = registerFile.DebugReadGPR(vertQuadGroups, RFType_OOutput, 1, 2);
				floatVec = &diffuse_z.x;
				thisOutputVert.diffuse.z = floatVec[vertID];

				const float4 diffuse_w = registerFile.DebugReadGPR(vertQuadGroups, RFType_OOutput, 1, 3);
				floatVec = &diffuse_w.x;
				thisOutputVert.diffuse.w = floatVec[vertID];

				float4 trueOutColor;
				const float4 convertedInputColor = UNORM8ToFloat::ConvertD3DCOLORToFloat4(thisVert.color);
				ShaderEmulateColoredLighting(thisVert.normal, convertedInputColor, trueOutColor);
				if (!(trueOutColor == thisOutputVert.diffuse) )
				{
					__debugbreak();
				}
			}
		}
	}

	printf("");
}

const int RunTestsShaderCore(Xsi::Loader& loader)
{
	// Dump our shader instruction bytes to VHDL for use as a constant ROM lookup table in the test driver
	printf("type InstructionDataArrayType is array(0 to %u) of unsigned(255 downto 0);\n", (const unsigned)(ARRAYSIZE(testInstructionStream) * sizeof(testInstructionStream[0]) + 1) / 32);
	printf("constant instructionData : InstructionDataArrayType := (\n");
	const unsigned char* const byteData = (const unsigned char* const)testInstructionStream;
	for (unsigned byteOffset = 0; byteOffset <= ARRAYSIZE(testInstructionStream) * sizeof(testInstructionStream[0]); byteOffset += 32)
	{
		if (byteOffset > 0)
			printf("\",\n");
		printf("X\"");
		for (int byte = 31; byte >= 0; --byte)
		{
			printf("%02X", byteData[byteOffset + byte]);
		}
	}
	printf("\");\n");

	/*printf("type VertexDataArrayType is array(0 to %u) of unsigned(255 downto 0);\n", (const unsigned)( (ARRAYSIZE(cubeVertices) * sizeof(cubeVertices[0]) + 1) / 32) );
	printf("constant vertexStreamData : VertexDataArrayType := (\n");
	const unsigned char* const byteData = (const unsigned char* const)cubeVertices;
	for (unsigned byteOffset = 0; byteOffset <= ARRAYSIZE(cubeVertices) * sizeof(cubeVertices[0]); byteOffset += 32)
	{
		if (byteOffset > 0)
			printf("\",\n");
		printf("X\"");
		for (int byte = 31; byte >= 0; --byte)
		{
			printf("%02X", byteData[byteOffset + byte]);
		}
	}
	printf(");\n");*/

	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");
	
	// Command processor signals:
	std_logic_port CMD_IsReadyForCommand(PD_OUT, loader, "CMD_IsReadyForCommand");
	std_logic_vector_port<3> CMD_InCommand(PD_IN, loader, "CMD_InCommand");
	std_logic_vector_port<30> CMD_LoadProgramAddr(PD_IN, loader, "CMD_LoadProgramAddr");
	std_logic_vector_port<16> CMD_LoadProgramLen(PD_IN, loader, "CMD_LoadProgramLen");
	std_logic_vector_port<8> CMD_SetConstantIndex(PD_IN, loader, "CMD_SetConstantIndex");
	std_logic_vector_port<128> CMD_SetConstantData(PD_IN, loader, "CMD_SetConstantData");
	std_logic_vector_port<3> CMD_SetNumVertexStreams(PD_IN, loader, "CMD_SetNumVertexStreams");
	std_logic_vector_port<3> CMD_SetVertexStreamID(PD_IN, loader, "CMD_SetVertexStreamID");
	std_logic_vector_port<3> CMD_SetVertexStreamDWORDCount(PD_IN, loader, "CMD_SetVertexStreamDWORDCount");
	std_logic_port CMD_SetVertexStreamIsD3DCOLOR(PD_IN, loader, "CMD_SetVertexStreamIsD3DCOLOR");
	std_logic_vector_port<3> CMD_SetVertexStreamShaderRegIndex(PD_IN, loader, "CMD_SetVertexStreamShaderRegIndex");
	std_logic_vector_port<6> CMD_SetVertexStreamDWORDStride(PD_IN, loader, "CMD_SetVertexStreamDWORDStride");
	std_logic_vector_port<6> CMD_SetVertexStreamDWORDOffset(PD_IN, loader, "CMD_SetVertexStreamDWORDOffset");

	// Vertex Batch Builder (VBB) FIFO signals:
	std_logic_port VBB_Done(PD_IN, loader, "VBB_Done");
	std_logic_port VERTBATCH_FIFO_empty(PD_IN, loader, "VERTBATCH_FIFO_empty");
	std_logic_vector_port<288> VERTBATCH_FIFO_rd_data(PD_IN, loader, "VERTBATCH_FIFO_rd_data");
	std_logic_port VERTBATCH_FIFO_rd_en(PD_OUT, loader, "VERTBATCH_FIFO_rd_en");

	// Vertex Batch Output (VBO) FIFO signals:
	std_logic_port VBO_Pushed(PD_OUT, loader, "VBO_Pushed");
	std_logic_port VERTOUT_FIFO_full(PD_IN, loader, "VERTOUT_FIFO_full");
	std_logic_vector_port<128> VERTOUT_FIFO_wr_data(PD_OUT, loader, "VERTOUT_FIFO_wr_data");
	std_logic_port VERTOUT_FIFO_wr_en(PD_OUT, loader, "VERTOUT_FIFO_wr_en");
	std_logic_port VBO_Ready(PD_IN, loader, "VBO_Ready");

	// GPRQuad0 signals:
	std_logic_vector_port<2> GPR0_ReadQuadIndex(PD_OUT, loader, "GPR0_ReadQuadIndex");
	std_logic_vector_port<2> GPR0_WriteQuadIndex(PD_OUT, loader, "GPR0_WriteQuadIndex");
	std_logic_port GPR0_PortA_en(PD_OUT, loader, "GPR0_PortA_en");
	std_logic_vector_port<2> GPR0_PortA_regType(PD_OUT, loader, "GPR0_PortA_regType");
	std_logic_vector_port<3> GPR0_PortA_regIdx(PD_OUT, loader, "GPR0_PortA_regIdx");
	std_logic_vector_port<2> GPR0_PortA_regChan(PD_OUT, loader, "GPR0_PortA_regChan");
	std_logic_vector_port<128> GPR0_PortA_readOutData(PD_IN, loader, "GPR0_PortA_readOutData");
	std_logic_port GPR0_PortB_en(PD_OUT, loader, "GPR0_PortB_en");
	std_logic_vector_port<2> GPR0_PortB_regType(PD_OUT, loader, "GPR0_PortB_regType");
	std_logic_vector_port<3> GPR0_PortB_regIdx(PD_OUT, loader, "GPR0_PortB_regIdx");
	std_logic_vector_port<2> GPR0_PortB_regChan(PD_OUT, loader, "GPR0_PortB_regChan");
	std_logic_vector_port<128> GPR0_PortB_readOutData(PD_IN, loader, "GPR0_PortB_readOutData");
	std_logic_port GPR0_PortW_en(PD_OUT, loader, "GPR0_PortW_en");
	std_logic_vector_port<2> GPR0_PortW_regType(PD_OUT, loader, "GPR0_PortW_regType");
	std_logic_vector_port<3> GPR0_PortW_regIdx(PD_OUT, loader, "GPR0_PortW_regIdx");
	std_logic_vector_port<2> GPR0_PortW_regChan(PD_OUT, loader, "GPR0_PortW_regChan");
	std_logic_vector_port<128> GPR0_PortW_writeInData(PD_OUT, loader, "GPR0_PortW_writeInData");

	// VertexStreamCache (VSC) signals:
	std_logic_port VSC_ReadEnable(PD_OUT, loader, "VSC_ReadEnable");
	std_logic_vector_port<3> VSC_ReadStreamIndex(PD_OUT, loader, "VSC_ReadStreamIndex");
	std_logic_vector_port<22> VSC_ReadDWORDAddr(PD_OUT, loader, "VSC_ReadDWORDAddr");
	std_logic_vector_port<32> VSC_ReadData(PD_IN, loader, "VSC_ReadData");
	std_logic_port VSC_ReadReady(PD_IN, loader, "VSC_ReadReady");
	std_logic_port VSC_SetStreamVBAddress(PD_OUT, loader, "VSC_SetStreamVBAddress");
	std_logic_vector_port<3> VSC_StreamIndex(PD_OUT, loader, "VSC_StreamIndex");
	std_logic_vector_port<30> VSC_StreamVBAddress(PD_OUT, loader, "VSC_StreamVBAddress");
	std_logic_port VSC_InvalidateCache(PD_OUT, loader, "VSC_InvalidateCache");

	// Constant Buffer (CB) signals:
	std_logic_port CB_Enable(PD_OUT, loader, "CB_Enable");
	std_logic_port CB_WriteMode(PD_OUT, loader, "CB_WriteMode");
	std_logic_vector_port<8> CB_RegIndex(PD_OUT, loader, "CB_RegIndex");
	std_logic_vector_port<2> CB_RegComponent(PD_OUT, loader, "CB_RegComponent");
	std_logic_vector_port<32> CB_ReadOutData(PD_IN, loader, "CB_ReadOutData");
	std_logic_vector_port<32> CB_WriteInData(PD_OUT, loader, "CB_WriteInData");

	// Instruction Cache (IC) signals:
	std_logic_port ICache_Enable(PD_OUT, loader, "ICache_Enable");
	std_logic_port ICache_WriteMode(PD_OUT, loader, "ICache_WriteMode");
	std_logic_vector_port<9> ICache_Address(PD_OUT, loader, "ICache_Address");
	std_logic_vector_port<64> ICache_WriteData(PD_OUT, loader, "ICache_WriteData");
	std_logic_vector_port<64> ICache_ReadData(PD_IN, loader, "ICache_ReadData");

	// Shared FPU signals:
	std_logic_vector_port<3> FPUALL_IN_MODE(PD_OUT, loader, "FPUALL_IN_MODE");
	std_logic_port FPUALL_ISHFT_GO(PD_OUT, loader, "FPUALL_ISHFT_GO");
	std_logic_port FPUALL_IMUL_GO(PD_OUT, loader, "FPUALL_IMUL_GO");
	std_logic_port FPUALL_IADD_GO(PD_OUT, loader, "FPUALL_IADD_GO");
	std_logic_port FPUALL_ICMP_GO(PD_OUT, loader, "FPUALL_ICMP_GO");
	std_logic_port FPUALL_ISPEC_GO(PD_OUT, loader, "FPUALL_ISPEC_GO");
	std_logic_port FPUALL_ICNV_GO(PD_OUT, loader, "FPUALL_ICNV_GO");
	std_logic_port FPUALL_IBIT_GO(PD_OUT, loader, "FPUALL_IBIT_GO");

	// FPU0 signals:
	std_logic_vector_port<32> FPU0_IN_A(PD_OUT, loader, "FPU0_IN_A");
	std_logic_vector_port<32> FPU0_IN_B(PD_OUT, loader, "FPU0_IN_B");
	std_logic_vector_port<32> FPU0_OUT_RESULT(PD_IN, loader, "FPU0_OUT_RESULT");

	// FPU1 signals:
	std_logic_vector_port<32> FPU1_IN_A(PD_OUT, loader, "FPU1_IN_A");
	std_logic_vector_port<32> FPU1_IN_B(PD_OUT, loader, "FPU1_IN_B");
	std_logic_vector_port<32> FPU1_OUT_RESULT(PD_IN, loader, "FPU1_OUT_RESULT");

	// FPU2 signals:
	std_logic_vector_port<32> FPU2_IN_A(PD_OUT, loader, "FPU2_IN_A");
	std_logic_vector_port<32> FPU2_IN_B(PD_OUT, loader, "FPU2_IN_B");
	std_logic_vector_port<32> FPU2_OUT_RESULT(PD_IN, loader, "FPU2_OUT_RESULT");

	// FPU3 signals:
	std_logic_vector_port<32> FPU3_IN_A(PD_OUT, loader, "FPU3_IN_A");
	std_logic_vector_port<32> FPU3_IN_B(PD_OUT, loader, "FPU3_IN_B");
	std_logic_vector_port<32> FPU3_OUT_RESULT(PD_IN, loader, "FPU3_OUT_RESULT");

	// UNORM8ToFloat signals:
	std_logic_port UNORM8ToFloat_Enable(PD_OUT, loader, "UNORM8ToFloat_Enable");
	std_logic_vector_port<32> UNORM8ToFloat_ColorIn(PD_OUT, loader, "UNORM8ToFloat_ColorIn");
	std_logic_vector_port<32> UNORM8ToFloat_ConvertedX(PD_IN, loader, "UNORM8ToFloat_ConvertedX");
	std_logic_vector_port<32> UNORM8ToFloat_ConvertedY(PD_IN, loader, "UNORM8ToFloat_ConvertedY");
	std_logic_vector_port<32> UNORM8ToFloat_ConvertedZ(PD_IN, loader, "UNORM8ToFloat_ConvertedZ");
	std_logic_vector_port<32> UNORM8ToFloat_ConvertedW(PD_IN, loader, "UNORM8ToFloat_ConvertedW");

	// Debug signals:
	std_logic_vector_port<6> DBG_CurrentState(PD_OUT, loader, "DBG_CurrentState");
	std_logic_vector_port<4> DBG_CurrentFetchWave(PD_OUT, loader, "DBG_CurrentFetchWave");
	std_logic_vector_port<3> DBG_CurrentDWORD(PD_OUT, loader, "DBG_CurrentDWORD");
	std_logic_vector_port<3> DBG_CurrentStreamID(PD_OUT, loader, "DBG_CurrentStreamID");
	std_logic_vector_port<16> DBG_ActiveLanesBitmask(PD_OUT, loader, "DBG_ActiveLanesBitmask");
	std_logic_vector_port<9> DBG_InstructionPointer(PD_OUT, loader, "DBG_InstructionPointer");
	std_logic_vector_port<64> DBG_CurrentlyExecutingInstruction(PD_OUT, loader, "DBG_CurrentlyExecutingInstruction");
	std_logic_vector_port<5> DBG_CyclesRemainingCurrentInstruction(PD_OUT, loader, "DBG_CyclesRemainingCurrentInstruction");
	//std_logic_vector_port<3> DBG_PortA_MUX(PD_OUT, loader, "DBG_PortA_MUX");
	//std_logic_vector_port<3> DBG_PortB_MUX(PD_OUT, loader, "DBG_PortB_MUX");
	//std_logic_vector_port<2> DBG_PortW_MUX(PD_OUT, loader, "DBG_PortW_MUX");
	std_logic_port DBG_OStall(PD_OUT, loader, "DBG_OStall");
	std_logic_port DBG_IStall(PD_OUT, loader, "DBG_IStall");

	ShaderCore testShaderCore;

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		float4 zeroReg;
		zeroReg.x = zeroReg.y = zeroReg.z = zeroReg.w = 0.0f;

		const VBB_FIFO::VBBEntry emptyEntry = {0};

		CMD_InCommand = DoNothingCommand;
		CMD_LoadProgramAddr = 0x00000000;
		CMD_LoadProgramLen = 0x0000;
		CMD_SetConstantIndex = 0x00;
		CMD_SetConstantData.SetStructVal(zeroReg);
		CMD_SetNumVertexStreams = 0;
		CMD_SetVertexStreamID = 0;
		CMD_SetVertexStreamDWORDCount = 0;
		CMD_SetVertexStreamIsD3DCOLOR = false;
		CMD_SetVertexStreamShaderRegIndex = 0;
		CMD_SetVertexStreamDWORDStride = 0;
		CMD_SetVertexStreamDWORDOffset = 0;

		VBB_Done = false;
		VERTBATCH_FIFO_empty = true;
		VERTBATCH_FIFO_rd_data.SetStructVal(emptyEntry);

		GPR0_PortA_readOutData.SetStructVal(zeroReg);
		GPR0_PortB_readOutData.SetStructVal(zeroReg);

		VSC_ReadData = 0x00000000;
		VSC_ReadReady = false;

		CB_ReadOutData = 0.0f;

		ICache_ReadData = 0x0000000000000000;

		FPU0_OUT_RESULT = 0.0f;
		FPU1_OUT_RESULT = 0.0f;
		FPU2_OUT_RESULT = 0.0f;
		FPU3_OUT_RESULT = 0.0f;
	}

	// Just set this to always be ready
	VBO_Ready = true;

	bool allTestsSuccessful = true;

	const auto tickUpdate = [&](ShaderCore& shaderCore)
	{
		scoped_timestep time(loader, clk, 100);

		shaderCore.VSC.Update(VSC_ReadEnable, VSC_ReadStreamIndex, VSC_ReadDWORDAddr, VSC_ReadData, VSC_ReadReady, VSC_SetStreamVBAddress, VSC_StreamIndex, VSC_StreamVBAddress, VSC_InvalidateCache);
		shaderCore.VBB.Update(VERTBATCH_FIFO_rd_en, VERTBATCH_FIFO_empty, VERTBATCH_FIFO_rd_data);
		shaderCore.VBO.Update(VERTOUT_FIFO_wr_en, VERTOUT_FIFO_full, VERTOUT_FIFO_wr_data);
		shaderCore.InstructionCache.Update(ICache_Enable, ICache_WriteMode, ICache_Address, ICache_ReadData, ICache_WriteData);
		shaderCore.ConstBuffer.Update(CB_Enable, CB_WriteMode, CB_RegIndex, CB_RegComponent, CB_ReadOutData, CB_WriteInData);
		shaderCore.FPU0.Update(FPUALL_ISHFT_GO, FPUALL_IMUL_GO, FPUALL_IADD_GO, FPUALL_ICMP_GO, FPUALL_ISPEC_GO, FPUALL_ICNV_GO, FPUALL_IBIT_GO, FPU0_IN_A, FPU0_IN_B, FPUALL_IN_MODE, FPU0_OUT_RESULT);
		shaderCore.FPU1.Update(FPUALL_ISHFT_GO, FPUALL_IMUL_GO, FPUALL_IADD_GO, FPUALL_ICMP_GO, FPUALL_ISPEC_GO, FPUALL_ICNV_GO, FPUALL_IBIT_GO, FPU1_IN_A, FPU1_IN_B, FPUALL_IN_MODE, FPU1_OUT_RESULT);
		shaderCore.FPU2.Update(FPUALL_ISHFT_GO, FPUALL_IMUL_GO, FPUALL_IADD_GO, FPUALL_ICMP_GO, FPUALL_ISPEC_GO, FPUALL_ICNV_GO, FPUALL_IBIT_GO, FPU2_IN_A, FPU2_IN_B, FPUALL_IN_MODE, FPU2_OUT_RESULT);
		shaderCore.FPU3.Update(FPUALL_ISHFT_GO, FPUALL_IMUL_GO, FPUALL_IADD_GO, FPUALL_ICMP_GO, FPUALL_ISPEC_GO, FPUALL_ICNV_GO, FPUALL_IBIT_GO, FPU3_IN_A, FPU3_IN_B, FPUALL_IN_MODE, FPU3_OUT_RESULT);
		shaderCore.RegisterFile.Update(GPR0_ReadQuadIndex, GPR0_WriteQuadIndex, GPR0_PortA_en, GPR0_PortA_regType, GPR0_PortA_regIdx, GPR0_PortA_regChan, GPR0_PortA_readOutData,
			GPR0_PortB_en, GPR0_PortB_regType, GPR0_PortB_regIdx, GPR0_PortB_regChan, GPR0_PortB_readOutData,
			GPR0_PortW_en, GPR0_PortW_regType, GPR0_PortW_regIdx, GPR0_PortW_regChan, GPR0_PortW_writeInData);
		shaderCore.ColorUnpacker.Update(UNORM8ToFloat_Enable, UNORM8ToFloat_ColorIn, UNORM8ToFloat_ConvertedX, UNORM8ToFloat_ConvertedY, UNORM8ToFloat_ConvertedZ, UNORM8ToFloat_ConvertedW);
	};

	if (DBG_CurrentState.GetUint8Val() != readyState)
	{
		__debugbreak(); // Should be in the Ready state by now
	}

	// Load program test:
	{
		scoped_timestep time(loader, clk, 100);

		CMD_InCommand = LoadProgramCommand;

		if (DBG_CurrentState.GetUint8Val() != readyState)
		{
			__debugbreak(); // We can only load our program if our shader core is in the Ready state beforehand!
		}

#pragma warning(push)
#pragma warning(disable:4311) // warning C4311: 'reinterpret_cast': pointer truncation from 'const InstructionCacheBRAM::instructionSlot (*)[61]' to 'unsigned int'
#pragma warning(disable:4302) // warning C4302: 'reinterpret_cast': truncation from 'const InstructionCacheBRAM::instructionSlot (*)[61]' to 'unsigned int'
		if (reinterpret_cast<const unsigned>(&testInstructionStream) >= 0x40000000)
		{
			__debugbreak(); // Error: Shader needs to live in the bottom 30 bits of address space!
		}

		CMD_LoadProgramAddr = reinterpret_cast<const unsigned>(&testInstructionStream);
#pragma warning(pop)
		CMD_LoadProgramLen = (const unsigned)ARRAYSIZE(testInstructionStream);
	}

	do // Wait for the shader core to return to the Ready state after loading our program
	{
		tickUpdate(testShaderCore);
	} while (DBG_CurrentState.GetUint8Val() != readyState);

	// Set shader constants using CMD_InCommand
	const auto setConstantReg = [&](const float* const constData, const unsigned char startingRegIndex, const unsigned char numRegs)
	{
		if (DBG_CurrentState.GetUint8Val() != readyState)
		{
			__debugbreak(); // We can only set constant reg if our shader core is in the Ready state beforehand!
		}

		const float4* const regData = (const float4* const)constData;
		for (unsigned reg = 0; reg < numRegs; ++reg)
		{
			const unsigned char regIndex = reg + startingRegIndex;

			const float4& thisRegData = regData[reg];

			CMD_InCommand = SetShaderConstantFCommand;
			CMD_SetConstantIndex = regIndex;
			CMD_SetConstantData.SetStructVal(thisRegData);

			do
			{
				tickUpdate(testShaderCore);
				CMD_InCommand = DoNothingCommand;
			} while (DBG_CurrentState.GetUint8Val() != readyState);

			tickUpdate(testShaderCore);
		}
	};

	// c0, c1, c2, c3 are the WVP matrix
	setConstantReg(wvpMatrix, 0, 4);
	// c4, c5, c6 are the wvpInvTranspose matrix
	setConstantReg(wvInvTransposeMatrix, 4, 3);
	// c7 is a constant { 0, 1, 0, 0 }
	const float4 constantC7 = { 0.0f, 1.0f, 0.0f, 0.0f };
	setConstantReg(&constantC7.x, 7, 1);
	// c8 is the lightDir
	const float4 constLightDir = { -0.95f, -0.925f, -0.9f, 0.0f };
	setConstantReg(&constLightDir.x, 8, 1);
	// c9 is the lightColor
	const float4 constLightColor = { 0.95f, 0.925f, 0.975f, 1.0f };
	setConstantReg(&constLightColor.x, 9, 1);
	// c10 is the viewport dimensions (halfwidth, halfheight, Zscale, minZ)
	const float4 constViewportScaleOffset = { 640.0f / 2.0f, 480.0f / 2.0f, 1.0f, 0.0f };
	setConstantReg(&constViewportScaleOffset.x, 10, 1);

	// Set up the vertex streams using CMD_InCommand = 3
	const auto setVertexStreamTest = [&](const unsigned char numVertexStreams, 
		const unsigned char streamID, const unsigned streamVBAddress, const unsigned char streamDWORDCount, const bool streamIsD3DCOLOR, 
		const unsigned char streamShaderRegIndex, const unsigned char streamDWORDStride, const unsigned char streamDWORDOffset)
	{
		if (DBG_CurrentState.GetUint8Val() != readyState)
		{
			__debugbreak(); // We can only set vertex streams if our shader core is in the Ready state beforehand!
		}

		{
			scoped_timestep time(loader, clk, 100);

			CMD_InCommand = IASetVertexStreamCommand;
			CMD_SetVertexStreamID = streamID;
			CMD_LoadProgramAddr = streamVBAddress;
			CMD_SetNumVertexStreams = numVertexStreams;
			CMD_SetVertexStreamDWORDCount = streamDWORDCount;
			CMD_SetVertexStreamIsD3DCOLOR = streamIsD3DCOLOR;
			CMD_SetVertexStreamShaderRegIndex = streamShaderRegIndex;
			CMD_SetVertexStreamDWORDStride = streamDWORDStride;
			CMD_SetVertexStreamDWORDOffset = streamDWORDOffset;
		}

		tickUpdate(testShaderCore);
	};

#pragma warning(push)
#pragma warning(disable:4311) // warning C4311: 'reinterpret_cast': pointer truncation from 'const testVert3D (*)[36]' to 'unsigned int'
#pragma warning(disable:4302) // warning C4302: 'reinterpret_cast': truncation from 'const testVert3D (*)[36]' to 'unsigned int'
	// Set float3 POSITION0 bound to v0
	setVertexStreamTest(4, 0, reinterpret_cast<const unsigned>(&cubeVertices), sizeof(testVert3D::xyz) / sizeof(DWORD), false, 0, 
		sizeof(testVert3D) / sizeof(DWORD), offsetof(testVert3D, xyz) / sizeof(DWORD) );

	// Set float2 TEXCOORD0 bound to v1
	setVertexStreamTest(4, 1, reinterpret_cast<const unsigned>(&cubeVertices), sizeof(testVert3D::texcoord) / sizeof(DWORD), false, 1, 
		sizeof(testVert3D) / sizeof(DWORD), offsetof(testVert3D, texcoord) / sizeof(DWORD) );

	// Set float3 NORMAL0 bound to v2
	setVertexStreamTest(4, 2, reinterpret_cast<const unsigned>(&cubeVertices), sizeof(testVert3D::normal) / sizeof(DWORD), false, 2, 
		sizeof(testVert3D) / sizeof(DWORD), offsetof(testVert3D, normal) / sizeof(DWORD) );

	// Set D3DCOLOR COLOR0 bound to v3
	setVertexStreamTest(4, 3, reinterpret_cast<const unsigned>(&cubeVertices), sizeof(testVert3D::color) / sizeof(DWORD), true, 3, 
		sizeof(testVert3D) / sizeof(DWORD), offsetof(testVert3D, color) / sizeof(DWORD) );
#pragma warning(pop)

	// Submit 3 (15/15/6 vertices or 5/5/2 triangle list prims) vertex batch builder batches for shading
	VBB_FIFO::VBBEntry vbbEntry = {0};
	for (unsigned x = 0; x < 15; ++x)
	{
		vbbEntry.indices[x] = x;
	}
	vbbEntry.indices[15] = 0xFFFF; // Keep the last entry invalid to simulate a nonfull warp of 5 triangle list polygons worth of vertices
	vbbEntry.vertexBatchStartingIndex = vbbEntry.vertexBatchEndingIndex = 0;
	testShaderCore.VBB.PushDataToFIFO(vbbEntry);

	for (unsigned x = 0; x < 15; ++x)
	{
		vbbEntry.indices[x] = x + 15;
	}
	vbbEntry.vertexBatchStartingIndex = vbbEntry.vertexBatchEndingIndex = 15;
	testShaderCore.VBB.PushDataToFIFO(vbbEntry);

	for (unsigned x = 0; x < 6; ++x)
	{
		vbbEntry.indices[x] = x + 30;
	}
	for (unsigned x = 6; x < 15; ++x)
	{
		vbbEntry.indices[x] = 0xFFFF; // Null out the last unused entries in this batch
	}
	vbbEntry.vertexBatchStartingIndex = vbbEntry.vertexBatchEndingIndex = 30;
	testShaderCore.VBB.PushDataToFIFO(vbbEntry);

	// Set our starting shader address to 0:
	CMD_LoadProgramAddr = 0x00000000;
	{
		if (DBG_CurrentState.GetUint8Val() != readyState)
		{
			__debugbreak(); // We can only start shading if our shader core is in the Ready state beforehand!
		}

		scoped_timestep time(loader, clk, 100);
		VBB_Done = true; // Let's pretend like we only have this one set of VBB batches to process in our VBB_FIFO queue
		CMD_InCommand = StartShadingWorkCommand;
	}

	eShaderCoreState currentState = (const eShaderCoreState)DBG_CurrentState.GetUint8Val();
	unsigned cyclesSpentRunning = 0;
	unsigned cyclesSpentOStalled = 0;
	unsigned cyclesSpentIStalled = 0;
	do // Wait for the shader core to enter the "running shader" state
	{
		tickUpdate(testShaderCore);
		currentState = (const eShaderCoreState)DBG_CurrentState.GetUint8Val();

		const unsigned char currentWave = DBG_CurrentFetchWave.GetUint8Val();
		const unsigned char currentDWORD = DBG_CurrentDWORD.GetUint8Val();
		const unsigned char currentStreamID = DBG_CurrentStreamID.GetUint8Val();
		const unsigned short activeLanesBitmask = DBG_ActiveLanesBitmask.GetUint16Val();

		++cyclesSpentRunning;
	} while (currentState != runShader);

	enableDebugOutput = true; // Turn on debug printing for this part

	unsigned char currentWave = DBG_CurrentFetchWave.GetUint8Val();
	unsigned char currentDWORD = DBG_CurrentDWORD.GetUint8Val();
	unsigned char currentStreamID = DBG_CurrentStreamID.GetUint8Val();
	unsigned short activeLanesBitmask = DBG_ActiveLanesBitmask.GetUint16Val();
	unsigned short currentInstructionPointer = DBG_InstructionPointer.GetUint16Val();
	unsigned char cyclesRemainingCurrentInstruction = DBG_CyclesRemainingCurrentInstruction.GetUint8Val();
	//MUXSource portAMUX = (const MUXSource)DBG_PortA_MUX.GetUint8Val();
	//MUXSource portBMUX = (const MUXSource)DBG_PortB_MUX.GetUint8Val();
	//MUXDest portWMUX = (const MUXDest)DBG_PortW_MUX.GetUint8Val();
	InstructionCacheBRAM::instructionSlot currentInstruction;
	currentInstruction.rawQWORD = 0;
	bool currentCycleOStalled = false;
	bool currentCycleIStalled = false;

	InstructionCacheBRAM::instructionSlot previousInstruction;
	previousInstruction.rawQWORD = 0;

	do
	{
		currentState = (const eShaderCoreState)DBG_CurrentState.GetUint8Val();

		currentWave = DBG_CurrentFetchWave.GetUint8Val();
		currentDWORD = DBG_CurrentDWORD.GetUint8Val();
		currentStreamID = DBG_CurrentStreamID.GetUint8Val();
		activeLanesBitmask = DBG_ActiveLanesBitmask.GetUint16Val();
		currentInstructionPointer = DBG_InstructionPointer.GetUint16Val();
		cyclesRemainingCurrentInstruction = DBG_CyclesRemainingCurrentInstruction.GetUint8Val();
		//portAMUX = (const MUXSource)DBG_PortA_MUX.GetUint8Val();
		//portBMUX = (const MUXSource)DBG_PortB_MUX.GetUint8Val();
		//portWMUX = (const MUXDest)DBG_PortW_MUX.GetUint8Val();
		currentCycleOStalled = DBG_OStall.GetBoolVal();
		currentCycleIStalled = DBG_IStall.GetBoolVal();

		currentInstruction.rawQWORD = DBG_CurrentlyExecutingInstruction.GetUint64Val();

		if (currentInstruction.rawQWORD != previousInstruction.rawQWORD)
		{
			if (enableDebugOutput)
			{
				if (currentInstructionPointer < 0 || currentInstructionPointer >= ARRAYSIZE(testInstructionStream) )
				{
					//__debugbreak(); // Out of range IP!
				}
				InstructionCacheBRAM::instructionSlot CPUCurrentInstruction;
				if (currentInstructionPointer > 0 && currentInstructionPointer < ARRAYSIZE(testInstructionStream) )
					CPUCurrentInstruction = testInstructionStream[currentInstructionPointer - 1];
				printf("IP[%i]: ", currentInstructionPointer - 1);
				if (memcmp(&CPUCurrentInstruction, &currentInstruction, sizeof(currentInstruction) ) != 0 && currentInstructionPointer > 0 && currentInstructionPointer < ARRAYSIZE(testInstructionStream) )
				{
					printf("Instruction mismatch! Expected: ");
					InstructionCacheBRAM::PrintDisasmInstruction(CPUCurrentInstruction);
					printf("\n");
				}
				InstructionCacheBRAM::PrintDisasmInstruction(currentInstruction);
				printf("\n");
			}

			previousInstruction = currentInstruction;

			if (currentInstructionPointer == 2) // There's some overlap with the last GPRQuad still being written to when we first start running instructions, so wait a little bit before verifying register integrity
			{
				VerifyInputRegisterIntegrity(testShaderCore.RegisterFile);
				VerifyInstructionCacheIntegrity(testShaderCore.InstructionCache);
			}

			if (currentCycleOStalled)
			{
				printf("OStall waiting for output port to clear!\n");
			}
			if (currentCycleIStalled)
			{
				printf("IStall waiting for input to finish being written to!\n");
			}
		}

		tickUpdate(testShaderCore);

		++cyclesSpentRunning;

		if (enableDebugOutput)
		{
			printf("Cycle %u: (%u remain)\n", cyclesSpentRunning, DBG_CyclesRemainingCurrentInstruction.GetUint8Val() );

			if (currentCycleOStalled)
			{
				++cyclesSpentOStalled;
				printf("STALL (O)! Waiting for previous FPU operations to complete.\n");
			}

			if (currentCycleIStalled)
			{
				++cyclesSpentIStalled;
				printf("STALL (I)! Waiting for registers from previous operations to be written.\n");
			}
		}
	} while (currentState == setupRunShader || currentState == setupRunShader2 || currentState == setupRunShader3 || currentState == setupRunShader4
		|| currentState == runShader || currentState == waitForWritesToComplete);

	VerifyOutputRegisterIntegrity(testShaderCore.RegisterFile);

	enableDebugOutput = false; // Turn off debug printing after the shader finishes execution to avoid log-spam

	do
	{
		currentState = (const eShaderCoreState)DBG_CurrentState.GetUint8Val();

		tickUpdate(testShaderCore);
	} while (currentState == collectShaderResults || currentState == submitShaderResults);

	std::vector<VBO_FIFO::VBOEntry> outputProcessedVertData;
	for (unsigned x = 0; x < 15; ++x)
	{
		VBO_FIFO::VBOEntry newVertData;
		newVertData = testShaderCore.VBO.ReadDataFromFIFO();

		outputProcessedVertData.push_back(newVertData);
	}

	const DWORD* const processedVertDataBuffer = reinterpret_cast<const DWORD* const>(&outputProcessedVertData.front() );
	VerifyVBOIntegrity(outputProcessedVertData);

	if (allTestsSuccessful)
		return S_OK;
	else
		return 1;
}
