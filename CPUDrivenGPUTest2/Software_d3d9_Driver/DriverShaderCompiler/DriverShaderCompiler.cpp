#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <stdio.h>
#include <string>
#include "..\Software_d3d9_Driver\ShaderAnalysis.h"
#include "..\Software_d3d9_Driver\Driver\GPUDeviceLimits.h"

#include "DriverShaderCompiler.h"

// Forwards-declare:
const ShaderCompileResultCode CompileShaderInternal(const ShaderInfo& inDXShaderInfo, const ShaderCompileOptions inCompileOptions, DeviceBytecode*& outCompiledDeviceBytecode, const char* const inOptShaderBaseFilename);

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
                     )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}

void __stdcall DisasmSingleInstructionToMemory(const instructionSlot* const inInstruction, char* const outMemory)
{
	if (!inInstruction)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}

	if (!outMemory)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}

#pragma warning(push)
#pragma warning(disable:4996) // C4996: 'sprintf': This function or variable may be unsafe. Consider using sprintf_s instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.
	sprintf(outMemory, "%s%s %s%llu.%c %s%llu%s.%c %s%llu%s.%c\n", 
			InstructionOpToString(inInstruction->instructionStruct.operation), InstructionDestRegModToString(inInstruction->instructionStruct.destReg_destModifier), // op_destmod
			InstructionDestRegToString(inInstruction->instructionStruct.destReg_regType), inInstruction->instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(inInstruction->instructionStruct.destReg_component), // destRegType%u.channel
			InstructionSrcRegToString(inInstruction->instructionStruct.srcRegA_regType), inInstruction->instructionStruct.srcRegA_regIndex, InstructionSrcRegModToString(inInstruction->instructionStruct.srcRegA_srcModifier), GetRegChannelLetterFromChannelIndex(inInstruction->instructionStruct.srcRegA_component), // srcRegType%u_srcMod.channel
			InstructionSrcRegToString(inInstruction->instructionStruct.srcRegB_regType), inInstruction->instructionStruct.srcRegB_regIndex, InstructionSrcRegModToString(inInstruction->instructionStruct.srcRegB_srcModifier), GetRegChannelLetterFromChannelIndex(inInstruction->instructionStruct.srcRegB_component) ); // srcRegType%u_srcMod.channel
#pragma warning(pop)
}

void __stdcall DisasmSingleInstructionToFile(const instructionSlot* const inInstruction, FILE* const outFile)
{
	if (!inInstruction)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}

	if (!outFile)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}

	fprintf(outFile, "%s%s %s%llu.%c %s%llu%s.%c %s%llu%s.%c\n", 
			InstructionOpToString(inInstruction->instructionStruct.operation), InstructionDestRegModToString(inInstruction->instructionStruct.destReg_destModifier), // op_destmod
			InstructionDestRegToString(inInstruction->instructionStruct.destReg_regType), inInstruction->instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(inInstruction->instructionStruct.destReg_component), // destRegType%u.channel
			InstructionSrcRegToString(inInstruction->instructionStruct.srcRegA_regType), inInstruction->instructionStruct.srcRegA_regIndex, InstructionSrcRegModToString(inInstruction->instructionStruct.srcRegA_srcModifier), GetRegChannelLetterFromChannelIndex(inInstruction->instructionStruct.srcRegA_component), // srcRegType%u_srcMod.channel
			InstructionSrcRegToString(inInstruction->instructionStruct.srcRegB_regType), inInstruction->instructionStruct.srcRegB_regIndex, InstructionSrcRegModToString(inInstruction->instructionStruct.srcRegB_srcModifier), GetRegChannelLetterFromChannelIndex(inInstruction->instructionStruct.srcRegB_component) ); // srcRegType%u_srcMod.channel
}

void WriteDeviceShaderInfoDataToFile(const DeviceShaderInfo& inDeviceShaderInfo, FILE* const outFile)
{
	if (!outFile)
	{
#ifdef _DEBUG
		__debugbreak(); // Don't pass null pointers to this function!
#endif
		return;
	}

	fprintf(outFile, "// Register Type: Registers Used / Total Registers Available:\n");
	fprintf(outFile, "// r#: \t%u\t/ \t%u\n", inDeviceShaderInfo.tempRegisterCount, GPU_SHADER_MAX_NUM_GPR_REG);
	fprintf(outFile, "// v#: \t%u\t/ \t%u\n", inDeviceShaderInfo.inputRegisterCount, GPU_SHADER_MAX_NUM_INPUT_REG);
	fprintf(outFile, "// o#: \t%u\t/ \t%u\n", inDeviceShaderInfo.outputRegisterCount, GPU_SHADER_MAX_NUM_OUTPUT_REG);
	fprintf(outFile, "// c#: \t%u\t/ \t%u\n", inDeviceShaderInfo.constRegisterCount, GPU_SHADER_MAX_NUM_CONSTANT_FLOAT_REG);
	fprintf(outFile, "// x#: \t%u\t/ \t%u\n", inDeviceShaderInfo.specialRegisterCount, GPU_SHADER_MAX_NUM_SPECIAL_REG);
	fprintf(outFile, "// \n");

	const DeviceInputRegisters& inputRegisters = inDeviceShaderInfo.inputRegisters;
	fprintf(outFile, "// Input Mapping:\n");
	if (inputRegisters.pos0 >= 0)
		fprintf(outFile, "// \tIN POSITION0: v%u\n", inputRegisters.pos0);
	if (inputRegisters.color0 >= 0)
		fprintf(outFile, "// \tIN COLOR0: v%u\n", inputRegisters.color0);
	if (inputRegisters.color1 >= 0)
		fprintf(outFile, "// \tIN COLOR1: v%u\n", inputRegisters.color1);
	if (inputRegisters.normal0 >= 0)
		fprintf(outFile, "// \tIN NORMAL0: v%u\n", inputRegisters.normal0);
	if (inputRegisters.tangent0 >= 0)
		fprintf(outFile, "// \tIN TANGENT0: v%u\n", inputRegisters.tangent0);
	if (inputRegisters.binormal0 >= 0)
		fprintf(outFile, "// \tIN BINORMAL0: v%u\n", inputRegisters.binormal0);
	if (inputRegisters.blendweight0 >= 0)
		fprintf(outFile, "// \tIN BLENDWEIGHT0: v%u\n", inputRegisters.blendweight0);
	if (inputRegisters.blendindices0 >= 0)
		fprintf(outFile, "// \tIN BLENDINDICES0: v%u\n", inputRegisters.blendindices0);
	for (unsigned x = 0; x < 8; ++x)
	{
		if (inputRegisters.texcoord[x] >= 0)
			fprintf(outFile, "// \tIN TEXCOORD%u: v%u\n", x, inputRegisters.texcoord[x]);
	}
	fprintf(outFile, "// \n");

	const DeviceOutputRegisters& outputRegisters = inDeviceShaderInfo.outputRegisters;
	fprintf(outFile, "// Output Mapping:\n");
	fprintf(outFile, "// \tOUT POSITION0: o%u\n", outputRegisters.oPosRegIndex);
	if (outputRegisters.oDiffuseRegIndex >= 0)
		fprintf(outFile, "// \tOUT COLOR0: o%u\n", outputRegisters.oDiffuseRegIndex);
	if (outputRegisters.oSpecularRegIndex >= 0)
		fprintf(outFile, "// \tOUT COLOR1: o%u\n", outputRegisters.oSpecularRegIndex);
	if (outputRegisters.oFog >= 0)
		fprintf(outFile, "// \tOUT FOG0: o%u\n", outputRegisters.oFog);
	if (outputRegisters.oPts >= 0)
		fprintf(outFile, "// \tOUT PSIZE0: o%u\n", outputRegisters.oPts);
	for (unsigned x = 0; x < 8; ++x)
	{
		if (outputRegisters.oTexRegIndex[x] >= 0)
			fprintf(outFile, "// \tOUT TEXCOORD%u: o%u\n", x, outputRegisters.oTexRegIndex[x]);
	}
	fprintf(outFile, "//\n");

	fprintf(outFile, "// Execution cycles: %u\n", inDeviceShaderInfo.deviceExecutionCycleCount);
	fprintf(outFile, "// Cycles wasted to waits: %u\n", inDeviceShaderInfo.deviceCyclesWastedToWaits);
	fprintf(outFile, "// %u/%u device instruction slots used (%u/%u bytes):\n", 
		inDeviceShaderInfo.deviceInstructionTokenCount, 
		GPU_SHADER_MAX_NUM_INSTRUCTIONS, 
		inDeviceShaderInfo.deviceInstructionTokenCount * sizeof(instructionSlot),
		GPU_SHADER_MAX_NUM_INSTRUCTIONS * sizeof(instructionSlot) );
}

const ShaderCompileResultCode __stdcall DisasmDeviceBytecodeToFile(const DeviceBytecode* const inCompiledDeviceBytecode, FILE* const outFile)
{
	if (!inCompiledDeviceBytecode)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR_InvalidArg;
	}

	if (!outFile)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR_InvalidArg;
	}

	WriteDeviceShaderInfoDataToFile(inCompiledDeviceBytecode->deviceShaderInfo, outFile);

	for (unsigned instructionIndex = 0; instructionIndex < inCompiledDeviceBytecode->deviceShaderInfo.deviceInstructionTokenCount; ++instructionIndex)
	{
		fprintf(outFile, "%u: ", instructionIndex);
		DisasmSingleInstructionToFile(&(inCompiledDeviceBytecode->deviceInstructions[instructionIndex]), outFile);
	}

	return ShaderCompile_OK;
}

// After this function returns, the caller owns the outString. Be sure to call free() on the outString when you are done with it to avoid leaking memory!
const ShaderCompileResultCode __stdcall DisasmDeviceBytecodeToString(const DeviceBytecode* const inCompiledDeviceBytecode, const char** outString)
{
	if (!inCompiledDeviceBytecode)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR_InvalidArg;
	}

	if (!outString)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR_InvalidArg;
	}

	std::string buildString;

	for (unsigned instructionIndex = 0; instructionIndex < inCompiledDeviceBytecode->deviceShaderInfo.deviceInstructionTokenCount; ++instructionIndex)
	{
		char tempMemory[256] = {0};
		DisasmSingleInstructionToMemory(&(inCompiledDeviceBytecode->deviceInstructions[instructionIndex]), tempMemory);
		buildString += tempMemory;
	}

	char* const outMemory = (char* const)malloc(buildString.length() + 1);
	memcpy(outMemory, buildString.c_str(), buildString.length() + 1);
	*outString = outMemory;

	return ShaderCompile_OK;
}

// This is our main function that takes compiled D3D9 bytecode (shader model 1, 2, or 3) and converts it into device-specific bytecode
const ShaderCompileResultCode __stdcall CompileShaderToDeviceBytecode(const ShaderInfo* const inDXShaderInfo, const ShaderCompileOptions inCompileOptions, DeviceBytecode** outCompiledDeviceBytecode, const char* const inOptShaderBaseFilename)
{
	if (!outCompiledDeviceBytecode)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Need to specify an output pointer for the compiled device bytecode
#endif
		return ShaderCompile_ERR_InvalidArg;
	}

	*outCompiledDeviceBytecode = NULL;

	if (!inDXShaderInfo)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Must always specify a fully computed ShaderInfo struct from ShaderAnalysis before calling this function!
#endif
		return ShaderCompile_ERR_InvalidArg;
	}

	if (inDXShaderInfo->parsingErrorDetected)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Must always specify a fully computed ShaderInfo struct from ShaderAnalysis before calling this function!
#endif
		return ShaderCompile_ERR_ShaderParseError;
	}

	if (inCompileOptions >= SCOPtion_LAST_VALID_OPTION)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Invalid/Unknown option specified!
#endif
		return ShaderCompile_ERR_InvalidArg;
	}

	if ( (inCompileOptions & SCOption_OutputEverything) != 0)
	{
		if (!inOptShaderBaseFilename)
		{
#ifdef _DEBUG
			__debugbreak(); // Error: Must specify a shaderBaseFilename string when using one of the Output options or else we won't know where to output the files to!
#endif
			return ShaderCompile_ERR_InvalidArg;
		}
	}

	// The driver shader compiler does not yet support pixel shaders. Vertex shaders only for right now!
	if (inDXShaderInfo->isPixelShader)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR_InvalidShaderType;
	}

	// The hardware does not currently support predication, so if the shader uses that, then we can't compile it
	if (inDXShaderInfo->usesInstructionPredication)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: We can't currently compile predication instructions!
#endif
		return ShaderCompile_ERR_UnsupportedPredication;
	}

	return CompileShaderInternal(*inDXShaderInfo, inCompileOptions, *outCompiledDeviceBytecode, inOptShaderBaseFilename);
}

