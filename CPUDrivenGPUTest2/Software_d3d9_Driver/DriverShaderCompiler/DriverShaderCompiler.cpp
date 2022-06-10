#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <stdio.h>
#include <string>

#include "DriverShaderCompiler.h"

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
		return ShaderCompile_ERR;
	}

	if (!outFile)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR;
	}

	for (unsigned instructionIndex = 0; instructionIndex < inCompiledDeviceBytecode->numDeviceTokens; ++instructionIndex)
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
		return ShaderCompile_ERR;
	}

	if (!outString)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR;
	}

	std::string buildString;

	for (unsigned instructionIndex = 0; instructionIndex < inCompiledDeviceBytecode->numDeviceTokens; ++instructionIndex)
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
