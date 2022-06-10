#pragma once

#include "DeviceShaderBytecode.h"

extern "C"
{

// This is a forward-declare typedef from stdio.h:
struct _iobuf;
typedef FILE _iobuf;

enum ShaderCompileResultCode : unsigned
{
	ShaderCompile_OK = 0,
	ShaderCompile_ERR = 1
};

enum ShaderCompileOptions : unsigned
{
	SCOption_None = 0,

	SCOption_OutputScalarizedDisasm = 1 << 0,
	SCOption_OutputDecomposedDisasm = 1 << 1,
	SCOption_OutputFinalBytecode = 1 << 2,
	SCOption_OutputFinalDisasm = 1 << 3,
	SCOption_OutputIncludesComments = 1 << 4,
	SCOption_OutputEverything = (SCOption_OutputScalarizedDisasm | SCOption_OutputDecomposedDisasm | SCOption_OutputFinalBytecode | SCOption_OutputFinalDisasm | SCOption_OutputIncludesComments),

	// Causes the driver shader compiler to produce an output shader even if there are errors along the way
	SCOption_IgnoreShaderCompileErrors = 1 << 5,

	SCOption_VS_AppendDivideByW = 1 << 6,
	SCOption_VS_AppendViewportTransform = 1 << 7, // TODO: Make a new option to skip Z scale/offset if we're using the identity viewport transform for Z
	SCOption_VS_OutputCompressionEnable = 1 << 8,

	SCOption_Optimize_InstructionReordering = 1 << 9,
	SCOption_Optimize_RegisterSplitting = 1 << 10,

	// This must always be last
	SCOPtion_LAST_VALID_OPTION
};

#pragma pack(push)
#pragma pack(1)
struct DeviceBytecode
{
	// How many compiled device-specific shader tokens are in the array.
	// The size of the shadercode in bytes is (numDeviceTokens * sizeof(instructionSlot) ).
	unsigned short numDeviceTokens;

	// If the "SCOption_VS_AppendViewportTransform" compile flag is specified, this contains on output the index of the viewport transform
	// constant buffer (float) register index. Otherwise this is just set to -1 to indicate not to use it as a register index!
	// The format of this register is currently expected to be:
	// X: Half Viewport Width (example: 320.0f for a viewport width of 640.0f)
	// Y: Half Viewport Height (example: 240.0f for a viewport height of 480.0f)
	// Z: Viewport Z scale (example: 1.0f, not halved!)
	// W: Viewport Z offset (example: 0.0f, not halved!)
	signed short vsViewportTransformConstRegisterF;

	// The actual compiled device-specific shader instructions begin here:
	instructionSlot deviceInstructions[1];
};
static_assert(sizeof(DeviceBytecode) == sizeof(unsigned short) + sizeof(signed short) + sizeof(instructionSlot), "Error: Unexpected struct alignment!");
#pragma pack(pop)

// This is our main function that takes compiled D3D9 bytecode (shader model 1, 2, or 3) and converts it into device-specific bytecode.
// If this function succeeds, then the caller now owns the device bytecode buffer (free it using free(outCompiledDeviceBytecode) after you're done with it).
const ShaderCompileResultCode __stdcall CompileShaderToDeviceBytecode(const struct ShaderInfo* const inDXShaderInfo, const ShaderCompileOptions inCompileOptions, DeviceBytecode** outCompiledDeviceBytecode, const char* const inOptShaderBaseFilename);

// After this function returns, the caller owns the outString. Be sure to call free() on the outString when you are done with it to avoid leaking memory!
const ShaderCompileResultCode __stdcall DisasmDeviceBytecodeToString(const DeviceBytecode* const inCompiledDeviceBytecode, const char** outString);

const ShaderCompileResultCode __stdcall DisasmDeviceBytecodeToFile(const DeviceBytecode* const inCompiledDeviceBytecode, FILE* const outFile);

void __stdcall DisasmSingleInstructionToFile(const instructionSlot* const inInstruction, FILE* const outFile);

} // end extern "C"
