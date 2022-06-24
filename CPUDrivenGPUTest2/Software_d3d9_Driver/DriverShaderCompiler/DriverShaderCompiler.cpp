#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <stdio.h>
#include <string>
#include "..\Software_d3d9_Driver\ShaderAnalysis.h"

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

	for (unsigned instructionIndex = 0; instructionIndex < inCompiledDeviceBytecode->deviceShaderInfo.deviceInstructionTokenCount; ++instructionIndex)
	{
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

