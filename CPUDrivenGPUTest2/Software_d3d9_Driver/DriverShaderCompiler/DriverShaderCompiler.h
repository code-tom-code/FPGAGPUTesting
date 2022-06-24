#pragma once

#include "DeviceShaderBytecode.h"

extern "C"
{

// This is a forward-declare typedef from stdio.h:
#ifndef _FILE_DEFINED
struct _iobuf;
typedef _iobuf FILE;
#endif // #ifndef _FILE_DEFINED

// You can check this for "success" as (ShaderCompileResultCode == 0) and for "failure" as (ShaderCompile_OK > 0)
enum ShaderCompileResultCode : unsigned
{
	// No problems!
	ShaderCompile_OK = 0,

	// Error codes:
	ShaderCompile_ERR_InvalidArg, // An invalid argument was passed to one of the functions. Rerun in a DEBUG build to get more precise errors.
	ShaderCompile_ERR_ShaderParseError, // ShaderAnalysis must have completed successfully, otherwise we won't have accurate ShaderInfo!
	ShaderCompile_ERR_InvalidShaderType, // Currently only Vertex Shaders are supported in hardware. Pixel Shaders is not yet supported. Do not pass Pixel Shaders to these functions!
	ShaderCompile_ERR_ShaderMissingVERSIONToken, // A VS or PS shader VERSION token was not found in the Direct3D shader instruction token stream. This is likely a corrupted or malformed shader.
	ShaderCompile_ERR_UnsupportedFlowControlInstruction, // An unsupported flow control instruction was found
	ShaderCompile_ERR_UnsupportedPredication, // The hardware doesn't yet support predication, so if the shader uses predication, then it won't work on the hardware.
	ShaderCompile_ERR_UnknownInstructionOpcode, // An unknown or unexpected shader opcode was encountered. This is likely a corrupted or malformed shader.
	ShaderCompile_ERR_NeededTempGPRNotFound, // A free temp r# GPR was needed for combo instruction decomposition and no free temp GPR's were found for use in the shader
	ShaderCompile_ERR_NeededConstRegNotFound, // A free const buffer c# register was needed and no free const buffer registers were found for use in the shader
	ShaderCompile_ERR_TempGPRCountExceedsHardware, // This shader uses too many temp. GPR's to fit on the hardware!
	ShaderCompile_ERR_ShaderInstructionCountExceedsHardware, // This shader uses too many instructions to fit on the hardware!
	ShaderCompile_ERR_MallocFail, // Malloc failed internally. We must be out of CPU memory.

	ShaderCompile_NUM_RESULTS // This must always be last
};

enum ShaderCompileOptions : unsigned
{
	SCOption_None = 0,

	SCOption_OutputScalarizedDisasm = 1 << 0,
	SCOption_OutputDecomposedDisasm = 1 << 1,
	SCOption_OutputD3DPostOptimizationDisasm = 1 << 2,
	SCOption_OutputDevicePostOptimizationDisasm = 1 << 3,
	SCOption_OutputFinalBytecode = 1 << 4,
	SCOption_OutputFinalDisasm = 1 << 5,
	SCOption_OutputInputDisasm = 1 << 6,
	SCOption_OutputIncludesComments = 1 << 7,
	SCOption_OutputEverything = (SCOption_OutputScalarizedDisasm | SCOption_OutputDecomposedDisasm | SCOption_OutputD3DPostOptimizationDisasm | SCOption_OutputDevicePostOptimizationDisasm | SCOption_OutputFinalBytecode | SCOption_OutputFinalDisasm | SCOption_OutputInputDisasm | SCOption_OutputIncludesComments),

	// Causes the driver shader compiler to produce an output shader even if there are errors along the way
	SCOption_IgnoreShaderCompileErrors = 1 << 8,

	SCOption_VS_AppendDivideByW = 1 << 9,
	SCOption_VS_AppendViewportTransform = 1 << 10, // TODO: Make a new option to skip Z scale/offset if we're using the identity viewport transform for Z
	SCOption_VS_OutputCompressionEnable = 1 << 11,

	SCOption_VS_GeneratePassthroughShader = 1 << 12, // Just generates a passthrough vertex shader (for use with D3DFVF_XYZRHW or POSITIONT vertex decl's) without looking at the shader source bytecode

	SCOption_Optimize_D3DOptimizations = 1 << 13, // Runs D3D bytecode-level optimizations (such as dead code elimiation and code deduplication)
	SCOption_Optimize_DeviceOptimizations = 1 << 14, // Runs device bytecode-level optimizations (such as instruction reordering to reduce wait cycles and strength reductions from MUL by constant power of 2 to SHFT)

	// This should always be the second-to-last enum entry
	SCOption_All_Options_Enabled = (SCOption_OutputEverything | SCOption_IgnoreShaderCompileErrors | SCOption_VS_AppendDivideByW | SCOption_VS_AppendViewportTransform | SCOption_VS_OutputCompressionEnable | SCOption_VS_GeneratePassthroughShader | SCOption_Optimize_D3DOptimizations | SCOption_Optimize_DeviceOptimizations),

	// This must always be last
	SCOPtion_LAST_VALID_OPTION
};

#pragma pack(push)
#pragma pack(1)
struct DeviceInputRegisters
{
	DeviceInputRegisters() : pos0(-1), color0(-1), color1(-1), normal0(-1), tangent0(-1), binormal0(-1), blendweight0(-1), blendindices0(-1)
	{
		for (unsigned x = 0; x < 8; ++x)
			texcoord[x] = -1;
	}

	signed char pos0; // Index of v# for the POSITION0 register
	signed char color0; // Index of v# for the COLOR0 register
	signed char color1; // Index of v# for the COLOR1 register
	signed char normal0; // Index of v# for the NORMAL0 register
	signed char tangent0; // Index of v# for the TANGENT0 register
	signed char binormal0; // Index of v# for the BINORMAL0 register
	signed char blendweight0; // Index of v# for the BLENDWEIGHT0 register
	signed char blendindices0; // Index of v# for the BLENDINDICES0 register
	signed char texcoord[8]; // Index of v# for the TEXCOORDn registers
};

struct DeviceOutputRegisters
{
	DeviceOutputRegisters() : oPosRegIndex(0), oDiffuseRegIndex(-1), oSpecularRegIndex(-1), oFog(-1), oPts(-1)
	{
		for (unsigned x = 0; x < 8; ++x)
			oTexRegIndex[x] = -1;
	}

	unsigned char oPosRegIndex; // Index of o# for the oPos register
	signed char oDiffuseRegIndex; // Index of o# for the oD0 register
	signed char oSpecularRegIndex; // Index of o# for the oD1 register
	signed char oTexRegIndex[8]; // Index of o# for the oTn register
	signed char oFog; // Index of o# for the oFog register
	signed char oPts; // Index of o# for the oPts register
};

struct DeviceShaderInfo
{
	// Used register counts:
	unsigned short constRegisterCount;
	unsigned short inputRegisterCount;
	unsigned short tempRegisterCount;
	unsigned short specialRegisterCount;
	unsigned short outputRegisterCount;

	// How many compiled device-specific shader tokens are in the array.
	// The size of the shadercode in bytes is (deviceInstructionTokenCount * sizeof(instructionSlot) ).
	unsigned short deviceInstructionTokenCount;

	// How many device cycles it takes to execute this shader.
	unsigned short deviceExecutionCycleCount;

	// How many cycles are wasted waiting for waits to finish.
	unsigned short deviceCyclesWastedToWaits;

	// If the "SCOption_VS_AppendViewportTransform" compile flag is specified, this contains on output the index of the viewport transform
	// constant buffer (float) register index. Otherwise this is just set to -1 to indicate not to use it as a register index!
	// The format of this register is currently expected to be:
	// X: Half Viewport Width (example: 320.0f for a viewport width of 640.0f)
	// Y: Half Viewport Height (example: 240.0f for a viewport height of 480.0f)
	// Z: Viewport Z scale (example: 1.0f, not halved!)
	// W: Viewport Z offset (example: 0.0f, not halved!)
	signed short vsViewportTransformConstRegisterF;

	// Input register mapping:
	DeviceInputRegisters inputRegisters;

	// Output register mapping:
	DeviceOutputRegisters outputRegisters;
};

struct DeviceBytecode
{
	DeviceShaderInfo deviceShaderInfo;

	// The actual compiled device-specific shader instructions begin here:
	instructionSlot deviceInstructions[1];
};
static_assert(sizeof(DeviceBytecode) == sizeof(DeviceShaderInfo) + sizeof(instructionSlot), "Error: Unexpected struct alignment!");
#pragma pack(pop)

// This is our main function that takes compiled D3D9 bytecode (shader model 1, 2, or 3) and converts it into device-specific bytecode.
// If this function succeeds, then the caller now owns the device bytecode buffer (free it using free(outCompiledDeviceBytecode) after you're done with it).
const ShaderCompileResultCode __stdcall CompileShaderToDeviceBytecode(const struct ShaderInfo* const inDXShaderInfo, const ShaderCompileOptions inCompileOptions, DeviceBytecode** outCompiledDeviceBytecode, const char* const inOptShaderBaseFilename);

// After this function returns, the caller owns the outString. Be sure to call free() on the outString when you are done with it to avoid leaking memory!
const ShaderCompileResultCode __stdcall DisasmDeviceBytecodeToString(const DeviceBytecode* const inCompiledDeviceBytecode, const char** outString);

const ShaderCompileResultCode __stdcall DisasmDeviceBytecodeToFile(const DeviceBytecode* const inCompiledDeviceBytecode, FILE* const outFile);

void __stdcall DisasmSingleInstructionToFile(const instructionSlot* const inInstruction, FILE* const outFile);

} // end extern "C"
