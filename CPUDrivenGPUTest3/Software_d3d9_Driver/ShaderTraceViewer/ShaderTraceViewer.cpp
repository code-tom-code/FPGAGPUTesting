#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "ShaderTrace.h"
#include "..\DriverShaderCompiler\DriverShaderCompiler.h"

#include <stdio.h>
#include <vector>
#include <Windows.h>

// TODO: Source these from command line args instead:
static const char* const shaderTracePath = "C:\\Users\\Tom\\Documents\\Visual Studio 2017\\Projects\\D3D9TestCubeRender\\D3D9TestCubeRender\\ShaderTrace";
static const char* const compiledDeviceShaderBinaryPath = "C:\\Users\\Tom\\Documents\\Visual Studio 2017\\Projects\\D3D9TestCubeRender\\D3D9TestCubeRender\\DriverCompileOutput\\vs_3_0_len216_hash0x987C3EB3d_7_DeviceFinalBytecode.bin";

struct DeviceBytecodeMaxSize
{
	DeviceShaderInfo deviceShaderInfo;

	instructionSlot deviceInstructions[GPU_SHADER_MAX_NUM_INSTRUCTIONS];
};

struct RegStateDiffs
{
	bool hasDiffs;
	bool hasMultipleDiffs; // This should not be possible!
	unsigned char deltaRegisterIndex;
	unsigned char deltaRegisterType;
	unsigned char deltaRegisterChannel;
};

static const char channelLetters[4] = 
{
	'x',
	'y',
	'z',
	'w'
};

static const char regFileTypes[4] = 
{
	'v',
	'o',
	'r',
	'x'
};

static const char destRegFileTypes[4] =
{
	'r',
	'x',
	'o',
	'0'
};

static const unsigned regFileTypeIndices[4] = 
{
	2,
	1,
	3,
	0
};

const RegStateDiffs ComputeStateDiffs(const DeviceRegisterFile& beforeState, const DeviceRegisterFile& afterState)
{
	RegStateDiffs ret;
	ret.hasDiffs = false;
	ret.hasMultipleDiffs = false;
	for (unsigned laneID = 0; laneID < /*GPU_SHADER_NUM_LANES*/1; ++laneID)
	{
		for (unsigned regTypeIndex = 0; regTypeIndex < GPU_SHADER_NUM_REGFILE_TYPES; ++regTypeIndex)
		{
			// We want to iterate through the register file types in a specific order that doesn't match the order that they are laid out in memory.
			// In memory they are naturally ordered "v, o, r, x" but we want to check through them in "r, o, x, v" priority order instead.
			const unsigned regType = regFileTypeIndices[regTypeIndex];
			for (unsigned regIndex = 0; regIndex < GPU_SHADER_MAX_NUM_GPR_REG; ++regIndex)
			{
				for (unsigned regChannel = 0; regChannel < 4; ++regChannel)
				{
					switch (regChannel)
					{
					case 0:
						if (afterState.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regType].regIndices[regIndex].x.u != beforeState.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regType].regIndices[regIndex].x.u)
						{
							if (ret.hasDiffs) { ret.hasMultipleDiffs = true; continue; }
							ret.hasDiffs = true;
							ret.deltaRegisterType = regType;
							ret.deltaRegisterIndex = regIndex;
							ret.deltaRegisterChannel = regChannel;
						}
						break;
					case 1:
						if (afterState.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regType].regIndices[regIndex].y.u != beforeState.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regType].regIndices[regIndex].y.u)
						{
							if (ret.hasDiffs) { ret.hasMultipleDiffs = true; continue; }
							ret.hasDiffs = true;
							ret.deltaRegisterType = regType;
							ret.deltaRegisterIndex = regIndex;
							ret.deltaRegisterChannel = regChannel;
						}
						break;
					case 2:
						if (afterState.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regType].regIndices[regIndex].z.u != beforeState.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regType].regIndices[regIndex].z.u)
						{
							if (ret.hasDiffs) { ret.hasMultipleDiffs = true; continue; }
							ret.hasDiffs = true;
							ret.deltaRegisterType = regType;
							ret.deltaRegisterIndex = regIndex;
							ret.deltaRegisterChannel = regChannel;
						}
						break;
					case 3:
						if (afterState.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regType].regIndices[regIndex].w.u != beforeState.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regType].regIndices[regIndex].w.u)
						{
							if (ret.hasDiffs) { ret.hasMultipleDiffs = true; continue; }
							ret.hasDiffs = true;
							ret.deltaRegisterType = regType;
							ret.deltaRegisterIndex = regIndex;
							ret.deltaRegisterChannel = regChannel;
						}
						break;
					}
				}
			}
		}
	}
	return ret;
}

void PrintFullRegState(const DeviceRegisterFile& regState)
{
	for (unsigned laneID = 0; laneID < 16; ++laneID)
	{
		printf("Lane %u:\n", laneID);
		for (unsigned regType = 0; regType < 4; ++regType)
		{
			for (unsigned regIndex = 0; regIndex < 8; ++regIndex)
			{
				printf("%c%u = ", regFileTypes[regType], regIndex);
				const auto& regValues = regState.regFileUnion.LogicalOrder.lanes[laneID].regTypes[regType].regIndices[regIndex];
				printf("{ %f[0x%08X], %f[0x%08X], %f[0x%08X], %f[0x%08X] }\n", regValues.x.f, regValues.x.u, regValues.y.f, regValues.y.u, regValues.z.f, regValues.z.u, regValues.w.f, regValues.w.u);
			}
		}
	}
}

int main(const unsigned argc, const char* const argv[])
{
#pragma warning(push)
#pragma warning(disable:4996) // warning C4996: 'fopen': This function or variable may be unsafe. Consider using fopen_s instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.
	FILE* const compiledDeviceShaderBinaryFile = fopen(compiledDeviceShaderBinaryPath, "rb");
#pragma warning(pop)
	if (!compiledDeviceShaderBinaryFile)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return 1;
	}

	DeviceBytecodeMaxSize deviceShaderBinaryData;
	memset(&deviceShaderBinaryData, 0, sizeof(deviceShaderBinaryData) );
	fread(&deviceShaderBinaryData.deviceShaderInfo, sizeof(deviceShaderBinaryData.deviceShaderInfo), 1, compiledDeviceShaderBinaryFile);

	if (deviceShaderBinaryData.deviceShaderInfo.deviceInstructionTokenCount < 1 || deviceShaderBinaryData.deviceShaderInfo.deviceInstructionTokenCount >= GPU_SHADER_MAX_NUM_INSTRUCTIONS)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Corrupt or empty device shader binary!
#endif
		return 1;
	}

	fread(deviceShaderBinaryData.deviceInstructions, sizeof(instructionSlot), deviceShaderBinaryData.deviceShaderInfo.deviceInstructionTokenCount, compiledDeviceShaderBinaryFile);
	fclose(compiledDeviceShaderBinaryFile);

	std::vector<DeviceRegisterFile> shaderTraceRFStates;
	std::vector<RegStateDiffs> shaderTraceRFDiffs;
	shaderTraceRFStates.resize(deviceShaderBinaryData.deviceShaderInfo.deviceInstructionTokenCount);
	memset(&shaderTraceRFStates.front(), 0, sizeof(RegStateDiffs) * deviceShaderBinaryData.deviceShaderInfo.deviceInstructionTokenCount);
	shaderTraceRFDiffs.resize(deviceShaderBinaryData.deviceShaderInfo.deviceInstructionTokenCount - 1);
	for (unsigned x = 0; x < deviceShaderBinaryData.deviceShaderInfo.deviceInstructionTokenCount; ++x)
	{
		char filenameBuffer[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996) // warning C4996: 'fopen': This function or variable may be unsafe. Consider using fopen_s instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.
		sprintf(filenameBuffer, "%s\\DumpShaderRegStateInst%u.dat", shaderTracePath, x);
		FILE* const thisStateFile = fopen(filenameBuffer, "rb");
#pragma warning(pop)
		if (!thisStateFile)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			printf("Error opening reg state dumpfile \"%s\" for reading\n", filenameBuffer);
			continue;
		}
		fread(&shaderTraceRFStates[x], sizeof(DeviceRegisterFile), 1, thisStateFile);
		fclose(thisStateFile);

		if (x > 0)
		{
			shaderTraceRFDiffs[x - 1] = ComputeStateDiffs(shaderTraceRFStates[x - 1], shaderTraceRFStates[x]);
		}
	}

	printf("Registers full initial state:\n");
	PrintFullRegState(shaderTraceRFStates.front() );
	printf("\n");

	for (int x = 0; x < deviceShaderBinaryData.deviceShaderInfo.deviceInstructionTokenCount; ++x)
	{
		printf("IP %u: ", x);
		char disasmInstructionBuffer[256] = {0};
		DisasmSingleInstructionToMemory(&(deviceShaderBinaryData.deviceInstructions[x]), disasmInstructionBuffer);
		printf("%s", disasmInstructionBuffer);

		if (x < (const int)shaderTraceRFDiffs.size() )
		{
			const RegStateDiffs& thisDiffState = shaderTraceRFDiffs[x];
			if (thisDiffState.hasDiffs)
			{
				const float* beforeValue = NULL;
				const float* afterValue = NULL;
				switch (thisDiffState.deltaRegisterChannel)
				{
				case 0:
					beforeValue = &(shaderTraceRFStates[x].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDiffState.deltaRegisterType].regIndices[thisDiffState.deltaRegisterIndex].x.f);
					afterValue = &(shaderTraceRFStates[x + 1].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDiffState.deltaRegisterType].regIndices[thisDiffState.deltaRegisterIndex].x.f);
					break;
				case 1:
					beforeValue = &(shaderTraceRFStates[x].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDiffState.deltaRegisterType].regIndices[thisDiffState.deltaRegisterIndex].y.f);
					afterValue = &(shaderTraceRFStates[x + 1].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDiffState.deltaRegisterType].regIndices[thisDiffState.deltaRegisterIndex].y.f);
					break;
				case 2:
					beforeValue = &(shaderTraceRFStates[x].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDiffState.deltaRegisterType].regIndices[thisDiffState.deltaRegisterIndex].z.f);
					afterValue = &(shaderTraceRFStates[x + 1].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDiffState.deltaRegisterType].regIndices[thisDiffState.deltaRegisterIndex].z.f);
					break;
				case 3:
					beforeValue = &(shaderTraceRFStates[x].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDiffState.deltaRegisterType].regIndices[thisDiffState.deltaRegisterIndex].w.f);
					afterValue = &(shaderTraceRFStates[x + 1].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDiffState.deltaRegisterType].regIndices[thisDiffState.deltaRegisterIndex].w.f);
					break;
				}

				if (thisDiffState.hasMultipleDiffs)
					printf("\tWarning: Multiple changes detected!\n");

				printf("\tChange detected in register %c%u.%c: %f[0x%08X] -> %f[0x%08X]\n", 
					regFileTypes[thisDiffState.deltaRegisterType], 
					thisDiffState.deltaRegisterIndex, 
					channelLetters[thisDiffState.deltaRegisterChannel],
					*beforeValue, *(const DWORD* const)beforeValue,
					*afterValue, *(const DWORD* const)afterValue);
			}
			else
			{
				printf("\tNo changes detected!");
				const InstructionDestRegType thisDestRegType = deviceShaderBinaryData.deviceInstructions[x].instructionStruct.destReg_regType;
				const InstructionRegComponent thisDestRegChannel = deviceShaderBinaryData.deviceInstructions[x].instructionStruct.destReg_component;
				const unsigned thisDestRegIndex = deviceShaderBinaryData.deviceInstructions[x].instructionStruct.destReg_regIndex;
				if (thisDestRegType != DRTyp_NULL)
				{
					const float* currentValue = NULL;
					switch (thisDestRegChannel)
					{
					case 0:
						currentValue = &(shaderTraceRFStates[x].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDestRegType].regIndices[thisDestRegIndex].x.f);
						break;
					case 1:
						currentValue = &(shaderTraceRFStates[x].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDestRegType].regIndices[thisDestRegIndex].y.f);
						break;
					case 2:
						currentValue = &(shaderTraceRFStates[x].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDestRegType].regIndices[thisDestRegIndex].z.f);
						break;
					case 3:
						currentValue = &(shaderTraceRFStates[x].regFileUnion.LogicalOrder.lanes[0].regTypes[thisDestRegType].regIndices[thisDestRegIndex].w.f);
						break;
					}

					printf(" %c%u.%c: %f[0x%08X]", 
						destRegFileTypes[thisDestRegType],
						thisDestRegIndex,
						channelLetters[thisDestRegChannel],
						*currentValue, *(const DWORD* const)currentValue);
				}
				printf("\n");
			}
		}
		printf("\n");
	}

	printf("Registers full final state:\n");
	PrintFullRegState(shaderTraceRFStates.back() );
	printf("\n");

	return 0;
}
