#include <stdio.h>
#include "DriverShaderCompiler.h"
#include "..\Software_d3d9_Driver\ShaderAnalysis.h"
#include "..\Software_d3d9_Driver\Driver\GPUDeviceLimits.h"
#include "..\Software_d3d9_Driver\Driver\GPUTypes.h"
#include "AssembleDXToken.h"
#include "AssembleDXHelpers.h"
#include "DeviceConversions.h"
#include <vector>

#define SHADER_OUTPUT_DIRECTORY "DriverCompileOutput"

// These specify the various outputs that we emit to files. They should be defined in the same order
// that we process these stages in:
enum ShaderOutputType : unsigned char
{
	// These first ones are the DirectX shader bytecode versions:
	DXInput = 0,
	DXDecomposed,
	DXScalarized,
	DXPostOptimized,

	// These last ones are our device-domain bytecode versions:
	DeviceTranslated,
	DeviceSuffixApplied,
	DeviceOptimized,
	DeviceFinal,

	ShaderOutputType_NUM // This must always be last
};

static const char* const ShaderOutputTypeFilenames[] =
{
	"DXInput", // DXInput
	"DXDecomposed", // DXDecomposed
	"DXScalarized", // DXScalarized
	"DXPostOptimized", // DXPostOptimized

	"DeviceTranslated", // DeviceTranslated
	"DeviceSuffixApplied", // DeviceSuffixApplied
	"DeviceOptimized", // DeviceOptimized
	"DeviceFinal" // DeviceFinal
};
static_assert(ARRAYSIZE(ShaderOutputTypeFilenames) == ShaderOutputType_NUM, "Error: Missing enum string!");

struct constantBufferRegisterSpace
{
	unsigned char regStartIndex; // The starting index of this register range in c# space
	unsigned char numRegisters; // How many c# registers are in this space from regStartIndex to regStartIndex + numRegisters (or 0 if the register-space is empty).
};
static_assert(sizeof(constantBufferRegisterSpace) == sizeof(unsigned short), "Error: Unexpected struct packing!");

static void EnsureOutputDirectoryExists()
{
	CreateDirectoryA(SHADER_OUTPUT_DIRECTORY "\\", NULL);
}

static const ShaderCompileResultCode ParseInstructions(const ShaderInfo& inDXShaderInfo, std::vector<const instructionToken*>& outVectorInstructions, versionToken& outVersionToken)
{
	ShaderCompileResultCode result = ShaderCompile_OK;
	bool bDone = false;
	const versionToken* const version = (const versionToken* const)inDXShaderInfo.initialBytecodeToken;
	const instructionToken* currentInstruction = (const instructionToken* const)(version + 1);
	while (!bDone)
	{
		outVectorInstructions.push_back(currentInstruction);

		const unsigned instructionDWORDCount = GetInstructionDWORDCount(currentInstruction, inDXShaderInfo);

		if (currentInstruction->reservedZero != 0)
		{
#ifdef _DEBUG
			__debugbreak(); // Error: Mal-formed instruction token detected!
#endif
			result = ShaderCompile_ERR_ShaderParseError;
		}
		else if (currentInstruction->instructionOrParameterMarkerBit != instructionTokenMarker)
		{
#ifdef _DEBUG
			__debugbreak(); // Error: This is not an instruction token, but it is a parameter token!
#endif
			result = ShaderCompile_ERR_ShaderParseError;
		}
		else if (currentInstruction->instructionLengthDWORDs > 10)
		{
#ifdef _DEBUG
			__debugbreak(); // Error: Invalid instruction length detected!
#endif
			result = ShaderCompile_ERR_ShaderParseError;
		}

		if (currentInstruction->opcode == _D3DSIO_END)
		{
			bDone = true;
		}

		currentInstruction += instructionDWORDCount;
	}

	outVersionToken = *version;

	return result;
}

static void ValidateAllInstructionStartPtrs(const std::vector<anyToken>& inTokens, const std::vector<const instructionToken*>& inInstructionStartPtrs)
{
#ifdef _DEBUG
	if (inTokens.empty() || inInstructionStartPtrs.empty() )
		return;

	const instructionToken* const startToken = (const instructionToken* const)&inTokens.front();
	const instructionToken* const endToken = (const instructionToken* const)&inTokens.back();

	const instructionToken* lastInstructionStart = NULL;

	const unsigned numInstructionStarts = inInstructionStartPtrs.size();
	for (unsigned x = 0; x < numInstructionStarts; ++x)
	{
		const instructionToken* const thisStartPtr = inInstructionStartPtrs[x];

		if (thisStartPtr <= lastInstructionStart)
		{
			__debugbreak(); // Error: Pointers must always be increasing, cannot go backwards!
		}
		lastInstructionStart = thisStartPtr;

		if ( (const unsigned)thisStartPtr < 0x1000)
		{
			__debugbreak(); // Error: Cannot have any pointers into the NULL page. If we have any of these, then they're likely due to us forgetting to rebase the pointers before returning!
			continue;
		}

		if (thisStartPtr > startToken && thisStartPtr <= endToken)
		{
			if (thisStartPtr->reservedZero != 0)
			{
				__debugbreak(); // Error: Mal-formed instruction token detected!
			}
			else if (thisStartPtr->instructionOrParameterMarkerBit != instructionTokenMarker)
			{
				__debugbreak(); // Error: This is not an instruction token, but it is a parameter token!
			}
			else if (thisStartPtr->instructionLengthDWORDs > 10)
			{
				__debugbreak(); // Error: Invalid instruction length detected!
			}
		}
		else
		{
			__debugbreak(); // Error: This pointer is either unbased or otherwise points outside of the tokens array!
			continue;
		}
	}
#endif
}

static const bool ValidateTempGPRIndex(const int inTempGPRIndex, ShaderCompileResultCode& outResult)
{
	if (inTempGPRIndex < 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: No temp GPR index found!
#endif
		outResult = ShaderCompile_ERR_NeededTempGPRNotFound;
		return false;
	}
	else if (inTempGPRIndex >= GPU_SHADER_MAX_NUM_GPR_REG)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: This shader uses too many GPR's, we don't have enough in hardware!
#endif
		outResult = ShaderCompile_ERR_TempGPRCountExceedsHardware;
		return false;
	}
	return true;
}

static const bool OpcodeIsCompositeOp(const DEBUGGABLE_D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode)
{
	switch (opcode)
	{
	case _D3DSIO_SUB:
	case _D3DSIO_MAD:
	case _D3DSIO_DP3:
	case _D3DSIO_DP4:
	case _D3DSIO_LIT:
	case _D3DSIO_DST:
	case _D3DSIO_LRP:
	case _D3DSIO_M4x4:
	case _D3DSIO_M4x3:
	case _D3DSIO_M3x4:
	case _D3DSIO_M3x3:
	case _D3DSIO_M3x2:
	case _D3DSIO_POW:
	case _D3DSIO_CRS:
	case _D3DSIO_NRM:
	case _D3DSIO_DP2ADD:
	case _D3DSIO_SINCOS:
		return true;
	default:
		return false;
	}
}

static const bool OpcodeIsScalarizableOp(const DEBUGGABLE_D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode)
{
	switch (opcode)
	{
	case _D3DSIO_ADD:
	case _D3DSIO_MUL:
	case _D3DSIO_MIN:
	case _D3DSIO_MAX:
	case _D3DSIO_SLT:
	case _D3DSIO_SGE:
	case _D3DSIO_MOV:
	case _D3DSIO_MOVA:
	case _D3DSIO_SGN:
	case _D3DSIO_ABS:
	case _D3DSIO_FRC:
	case _D3DSIO_EXP:
	case _D3DSIO_EXPP:
	case _D3DSIO_LOG:
	case _D3DSIO_LOGP:
	case _D3DSIO_RCP:
	case _D3DSIO_RSQ:
		return true;
	default:
		return false;
	}
}

/* Converts vector instruction to scalar instructions. For example, the vector instruction 
"mul r0.xyz, r1.xyxy, c8.zzzz"
would get converted into three scalar instructions:
"mul r0.x, r1.x, c8.z",
"mul r0.y, r1.y, c8.z",
"mul r0.z, r1.x, c8.z" */
const ShaderCompileResultCode ScalarizeVectorShader(const ShaderInfo& inDXShaderInfo, const std::vector<const instructionToken*>& inVectorInstructions, const ShaderCompileOptions inCompileOptions, const int freeGPRRegIndex, std::vector<anyToken>& outScalarizedInstructions, std::vector<const instructionToken*>& outScalarizedInstructionStartPtrs)
{
	// Start by copying the whole shader before the first instruction (includes version token, comment tokens, etc.)
	/*const unsigned numInitialTokens = inDXShaderInfo.firstInstructionToken - inDXShaderInfo.initialBytecodeToken;
	outScalarizedInstructions.resize(numInitialTokens);
	if (numInitialTokens < 1)
	{
		// Should always have at least a VERSION token
		__debugbreak();
		return ShaderCompile_ERR_ShaderMissingVERSIONToken;
	}
	memcpy(&outScalarizedInstructions.front(), inDXShaderInfo.firstInstructionToken, sizeof(DWORD) * numInitialTokens);*/

	ShaderCompileResultCode result = ShaderCompile_OK;

	const unsigned numVectorInstructions = (const unsigned)inVectorInstructions.size();
	for (unsigned vectorInstructionIndex = 0; vectorInstructionIndex < numVectorInstructions; ++vectorInstructionIndex)
	{
		const instructionToken* const currentVectorInstruction = inVectorInstructions[vectorInstructionIndex];
		const aliasedInstructionTokens* const aliasedInstruction = (const aliasedInstructionTokens* const)currentVectorInstruction;

		if (OpcodeIsCompositeOp(aliasedInstruction->justOpcode.instruction.opcode) )
		{
#ifdef _DEBUG
			__debugbreak(); // Error: These combo instructions should have been decomposed by a previous pass! The scalarization pass can only handle simple (non-combo) instructions!
#endif
			CopyInstructionToNewInstructionStream(outScalarizedInstructions, outScalarizedInstructionStartPtrs, currentVectorInstruction, inDXShaderInfo);
			continue;
		}

		// For all other non-scalarizable instructions, just straight-copy them across to the new instruction stream
		if (!OpcodeIsScalarizableOp(aliasedInstruction->justOpcode.instruction.opcode) )
		{
			CopyInstructionToNewInstructionStream(outScalarizedInstructions, outScalarizedInstructionStartPtrs, currentVectorInstruction, inDXShaderInfo);
			continue;
		}

		const unsigned char numOutputs = (const unsigned char)__popcnt16(aliasedInstruction->dstOnly.dst.GetWriteMask() );
#ifdef _DEBUG
		if (numOutputs > 4)
		{
			__debugbreak(); // Should never be here! Corrupt bytecode?
		}
#endif
		const unsigned char firstWriteMaskChannelIndex = GetFirstWriteChannelIndex(aliasedInstruction->dstOnly.dst);

		switch (aliasedInstruction->justOpcode.instruction.opcode)
		{
		default:
		{
#ifdef _DEBUG
			__debugbreak(); // Unexpected instruction!
#endif
		}
			break;
			// These are our dst, src0, src1 instructions here:
		case _D3DSIO_ADD:
		case _D3DSIO_MUL:
		case _D3DSIO_MIN:
		case _D3DSIO_MAX:
		case _D3DSIO_SLT:
		case _D3DSIO_SGE:
			if (RegistersAreSame(aliasedInstruction->srcSrcDst.dst, aliasedInstruction->srcSrcDst.src0) || RegistersAreSame(aliasedInstruction->srcSrcDst.dst, aliasedInstruction->srcSrcDst.src1) )
			{
				// Uh oh, we may have a scalarization hazard!
				// If we do, then we need to copy the dst register's data to the temp register and use that as the new src0 or src1 (or both) register.
				// TODO: We might be able to elide the copy entirely if we can detect that we don't have a hazard order swizzle between the source swizzle and the dest write mask, or
				// if we can figure out a different order than the usual XYZW order to compute the result in that would dodge the hazard. Either case is somewhat complex, so let's leave that for a later optimization.
				if (ValidateTempGPRIndex(freeGPRRegIndex, result) == false)
				{
					if (!(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
					{
						return result;
					}
				}

				// MOV temp.xyzw, dst.xyzw
				for (unsigned char writeChannel = 0; writeChannel < 4; ++writeChannel)
				{
					// TODO: We could optimize this by not copying channels that we aren't going to read from
					const writeMaskType dstWriteMask = (const writeMaskType)(1 << writeChannel);
					const debuggableSwizzleChannel srcSwizzle = (const debuggableSwizzleChannel)writeChannel;
					AppendNewInstructionStartToTokenStartPtrs(outScalarizedInstructionStartPtrs, outScalarizedInstructions);
					AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MOV) ); // MOV
					AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, freeGPRRegIndex, dstWriteMask) ); // temp
					AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), srcSwizzle) ); // dst
				}

				// Perform the actual instruction here using temp in place of the duplicated source
				for (unsigned char writeChannel = 0; writeChannel < 4; ++writeChannel)
				{
					const writeMaskType dstWriteMask = (const writeMaskType)(1 << writeChannel);
					if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & (1 << writeChannel) )
					{
						const debuggableSwizzleChannel src0Swizzle = GetSourceSwizzleChannelHelper( (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src0.GetChannelSwizzleXYZW(), writeChannel);
						const debuggableSwizzleChannel src1Swizzle = GetSourceSwizzleChannelHelper( (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), writeChannel);
						AppendNewInstructionStartToTokenStartPtrs(outScalarizedInstructionStartPtrs, outScalarizedInstructions);
						AppendNewTokenToTokenStream(outScalarizedInstructions, CopyExistingInstructionToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.instruction) ); // OP
						AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), dstWriteMask, 
							(const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale(), aliasedInstruction->srcSrcDst.dst.GetRelativeAddressingType() ? true : false) ); // dst
						if (RegistersAreSame(aliasedInstruction->srcSrcDst.dst, aliasedInstruction->srcSrcDst.src0) )
						{
							AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, freeGPRRegIndex, src0Swizzle, 
								(const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src0.GetSourceModifiers(), aliasedInstruction->srcSrcDst.src0.GetRelativeAddressingType() ? true : false) ); // src0 (as temp copy)
						}
						else
						{
							AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0.GetRegisterType(), aliasedInstruction->srcSrcDst.src0.GetRegisterIndex(),
								src0Swizzle, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src0.GetSourceModifiers(), aliasedInstruction->srcSrcDst.src0.GetRelativeAddressingType() ? true : false) ); // src0
						}
						if (RegistersAreSame(aliasedInstruction->srcSrcDst.dst, aliasedInstruction->srcSrcDst.src1) )
						{
							AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, freeGPRRegIndex, src1Swizzle, 
								(const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers(), aliasedInstruction->srcSrcDst.src1.GetRelativeAddressingType() ? true : false) ); // src1 (as temp copy)
						}
						else
						{
							AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex(),
								src1Swizzle, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers(), aliasedInstruction->srcSrcDst.src1.GetRelativeAddressingType() ? true : false) ); // src1
						}
					}
				}
			}
			else
			{
				// Simple case, don't have to worry about any hazards. Just emit the proper instruction for each of the writemask channels and we're done!
				for (unsigned char writeChannel = 0; writeChannel < 4; ++writeChannel)
				{
					const writeMaskType writeChannelMask = (const writeMaskType)(1 << writeChannel);
					if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & writeChannelMask)
					{
						const debuggableSwizzleChannel src0Swizzle = GetSourceSwizzleChannelHelper( (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src0.GetChannelSwizzleXYZW(), writeChannel);
						const debuggableSwizzleChannel src1Swizzle = GetSourceSwizzleChannelHelper( (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), writeChannel);
						AppendNewInstructionStartToTokenStartPtrs(outScalarizedInstructionStartPtrs, outScalarizedInstructions);
						AppendNewTokenToTokenStream(outScalarizedInstructions, CopyExistingInstructionToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.instruction) ); // OP
						AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), writeChannelMask, 
							(const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale(), aliasedInstruction->srcSrcDst.dst.GetRelativeAddressingType() ? true : false) ); // dst
						AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0.GetRegisterType(), aliasedInstruction->srcSrcDst.src0.GetRegisterIndex(),
							src0Swizzle, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src0.GetSourceModifiers(), aliasedInstruction->srcSrcDst.src0.GetRelativeAddressingType() ? true : false) ); // src0
						AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex(),
							src1Swizzle, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers(), aliasedInstruction->srcSrcDst.src1.GetRelativeAddressingType() ? true : false) ); // src1
					}
				}
			}
			break;
			// These are our dst, src0 instructions without replicate swizzles here:
		case _D3DSIO_MOV:
		case _D3DSIO_MOVA:
		case _D3DSIO_SGN: // Technically SGN is a dst, src0, src1, src2 instruction, but the src1 and src2 temp. registers are unused and can be ignored
		case _D3DSIO_ABS:
		case _D3DSIO_FRC:
			if (RegistersAreSame(aliasedInstruction->srcDst.dst, aliasedInstruction->srcDst.src0) )
			{
				// Uh oh, we may have a scalarization hazard!
				// If we do, then we need to copy the dst register's data to the temp register and use that as the new src0 register.
				// TODO: We might be able to elide the copy entirely if we can detect that we don't have a hazard order swizzle between the source swizzle and the dest write mask, or
				// if we can figure out a different order than the usual XYZW order to compute the result in that would dodge the hazard. Either case is somewhat complex, so let's leave that for a later optimization.
				if (ValidateTempGPRIndex(freeGPRRegIndex, result) == false)
				{
					if (!(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
					{
						return result;
					}
				}

				// MOV temp.xyzw, dst.xyzw
				for (unsigned char writeChannel = 0; writeChannel < 4; ++writeChannel)
				{
					// TODO: We could optimize this by not copying channels that we aren't going to read from
					const writeMaskType dstWriteMask = (const writeMaskType)(1 << writeChannel);
					const debuggableSwizzleChannel srcSwizzle = (const debuggableSwizzleChannel)writeChannel;
					AppendNewInstructionStartToTokenStartPtrs(outScalarizedInstructionStartPtrs, outScalarizedInstructions);
					AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MOV) ); // MOV
					AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, freeGPRRegIndex, dstWriteMask) ); // temp
					AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcDst.dst.GetRegisterType(), aliasedInstruction->srcDst.dst.GetRegisterIndex(), srcSwizzle) ); // dst
				}

				// Perform the actual instruction here using temp in place of src0
				for (unsigned char writeChannel = 0; writeChannel < 4; ++writeChannel)
				{
					const writeMaskType dstWriteMask = (const writeMaskType)(1 << writeChannel);
					if (aliasedInstruction->srcDst.dst.GetWriteMask() & (1 << writeChannel) )
					{
						const debuggableSwizzleChannel src0Swizzle = GetSourceSwizzleChannelHelper( (const debuggableFullSwizzle)aliasedInstruction->srcDst.src0.GetChannelSwizzleXYZW(), writeChannel);
						AppendNewInstructionStartToTokenStartPtrs(outScalarizedInstructionStartPtrs, outScalarizedInstructions);
						AppendNewTokenToTokenStream(outScalarizedInstructions, CopyExistingInstructionToken(inDXShaderInfo, aliasedInstruction->srcDst.instruction) ); // OP
						AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcDst.dst.GetRegisterType(), aliasedInstruction->srcDst.dst.GetRegisterIndex(), dstWriteMask, 
							(const resultModifierType)aliasedInstruction->srcDst.dst.GetResultModifier(), aliasedInstruction->srcDst.dst.GetResultShiftScale(), aliasedInstruction->srcDst.dst.GetRelativeAddressingType() ? true : false) ); // dst
						AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, freeGPRRegIndex, src0Swizzle, 
							(const debuggableSourceModifierType)aliasedInstruction->srcDst.src0.GetSourceModifiers(), aliasedInstruction->srcDst.src0.GetRelativeAddressingType() ? true : false) ); // src0
					}
				}
			}
			else
			{
				// Simple case, don't have to worry about any hazards. Just emit the proper instruction for each of the writemask channels and we're done!
				for (unsigned char writeChannel = 0; writeChannel < 4; ++writeChannel)
				{
					const writeMaskType writeChannelMask = (const writeMaskType)(1 << writeChannel);
					if (aliasedInstruction->srcDst.dst.GetWriteMask() & writeChannelMask)
					{
						const debuggableSwizzleChannel src0Swizzle = GetSourceSwizzleChannelHelper( (const debuggableFullSwizzle)aliasedInstruction->srcDst.src0.GetChannelSwizzleXYZW(), writeChannel);
						AppendNewInstructionStartToTokenStartPtrs(outScalarizedInstructionStartPtrs, outScalarizedInstructions);
						AppendNewTokenToTokenStream(outScalarizedInstructions, CopyExistingInstructionToken(inDXShaderInfo, aliasedInstruction->srcDst.instruction) ); // OP
						AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcDst.dst.GetRegisterType(), aliasedInstruction->srcDst.dst.GetRegisterIndex(), writeChannelMask, 
							(const resultModifierType)aliasedInstruction->srcDst.dst.GetResultModifier(), aliasedInstruction->srcDst.dst.GetResultShiftScale(), aliasedInstruction->srcDst.dst.GetRelativeAddressingType() ? true : false) ); // dst
						AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcDst.src0.GetRegisterType(), aliasedInstruction->srcDst.src0.GetRegisterIndex(),
							src0Swizzle, (const debuggableSourceModifierType)aliasedInstruction->srcDst.src0.GetSourceModifiers(), aliasedInstruction->srcDst.src0.GetRelativeAddressingType() ? true : false) ); // src0
					}
				}
			}
			break;
			// These are our dst, src0 instructions that require the use of a replicate swizzle:
		case _D3DSIO_EXP:
		case _D3DSIO_EXPP:
		case _D3DSIO_LOG:
		case _D3DSIO_LOGP:
		case _D3DSIO_RCP:
		case _D3DSIO_RSQ:
			if (numOutputs == 1)
			{
				// Simple case, don't have to worry about any hazards or instruction scalarizing. Just copy everything over and we're done!
				AppendNewInstructionStartToTokenStartPtrs(outScalarizedInstructionStartPtrs, outScalarizedInstructions);
				AppendNewTokenToTokenStream(outScalarizedInstructions, CopyExistingInstructionToken(inDXShaderInfo, aliasedInstruction->srcDst.instruction) ); // OP
				AppendNewTokenToTokenStream(outScalarizedInstructions, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcDst.dst) ); // dst
				AppendNewTokenToTokenStream(outScalarizedInstructions, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcDst.src0) ); // src0
			}
			else
			{
				// Run the instruction into the first set write mask, then MOV to copy the result into the remaining write mask channels.
				// This is done because MOV is often much cheaper than re-running the transcendental instruction multiple times!

				// Here build out the initial instruction that performs the transcendental work:
				const writeMaskType scalarWriteMask = (const writeMaskType)(1 << firstWriteMaskChannelIndex);
				AppendNewInstructionStartToTokenStartPtrs(outScalarizedInstructionStartPtrs, outScalarizedInstructions);
				AppendNewTokenToTokenStream(outScalarizedInstructions, CopyExistingInstructionToken(inDXShaderInfo, aliasedInstruction->srcDst.instruction) ); // OP
				AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcDst.dst.GetRegisterType(), aliasedInstruction->srcDst.dst.GetRegisterIndex(), scalarWriteMask, 
					(const resultModifierType)aliasedInstruction->srcDst.dst.GetResultModifier(), aliasedInstruction->srcDst.dst.GetResultShiftScale(), aliasedInstruction->srcDst.dst.GetRelativeAddressingType() ? true : false) ); // dst
				AppendNewTokenToTokenStream(outScalarizedInstructions, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcDst.src0) ); // src0

				// Here's our loop to generate MOV instructions to copy the transcendental result into the remaining write mask channels:
				for (unsigned char copyChannel = firstWriteMaskChannelIndex + 1; copyChannel < 4; ++copyChannel)
				{
					const writeMaskType copyChannelMask = (const writeMaskType)(1 << copyChannel);
					if (aliasedInstruction->srcDst.dst.GetWriteMask() & copyChannelMask)
					{
						AppendNewInstructionStartToTokenStartPtrs(outScalarizedInstructionStartPtrs, outScalarizedInstructions);
						AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MOV) ); // MOV
						AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcDst.dst.GetRegisterType(), aliasedInstruction->srcDst.dst.GetRegisterIndex(), copyChannelMask, 
							(const resultModifierType)aliasedInstruction->srcDst.dst.GetResultModifier(), aliasedInstruction->srcDst.dst.GetResultShiftScale(), aliasedInstruction->srcDst.dst.GetRelativeAddressingType() ? true : false) ); // dst
						AppendNewTokenToTokenStream(outScalarizedInstructions, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcDst.dst.GetRegisterType(), aliasedInstruction->srcDst.dst.GetRegisterIndex(),
							(const debuggableSwizzleChannel)firstWriteMaskChannelIndex, (const debuggableSourceModifierType)aliasedInstruction->srcDst.src0.GetSourceModifiers(), aliasedInstruction->srcDst.src0.GetRelativeAddressingType() ? true : false) ); // src0
					}
				}
			}
			break;
		}
	}

	RebaseInstructionStartPointers(outScalarizedInstructionStartPtrs, &outScalarizedInstructions.front() );

	ValidateAllInstructionStartPtrs(outScalarizedInstructions, outScalarizedInstructionStartPtrs);

	return result;
}

static inline const debuggableSourceModifierType ApplyNegateToSourceMod(const debuggableSourceModifierType inSourceMod)
{
	switch (inSourceMod)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Unknown input source mod!
#endif
	case SM_None:
		return SM_Negate;
	case SM_Negate:
	case SM_Not:
	case SM_Complement:
		return SM_None;
	case SM_Bias:
		return SM_BiasNegate;
	case SM_BiasNegate:
		return SM_Bias;
	case SM_Sign:
		return SM_SignNegate;
	case SM_SignNegate:
		return SM_Sign;
	case SM_x2:
		return SM_x2Negate;
	case SM_x2Negate:
		return SM_x2;
	case SM_DivZ:
		return SM_DivZ; // Has no effect on DivZ or DivW
	case SM_DivW:
		return SM_DivW; // Has no effect on DivZ or DivW
	case SM_Abs:
		return SM_AbsNegate;
	case SM_AbsNegate:
		return SM_Abs;
	}
}

// Returns the r# index of the found available temp GPR register, or -1 if there are no available registers to use!
const int FindAvailableTempGPR(const unsigned tempGPRUseBitmask)
{
	int foundGPRReg = -1;
	for (int regNum = 0; regNum < 32; ++regNum)
	{
		const unsigned regMask = 1 << regNum;
		if ( (tempGPRUseBitmask & regMask) != regMask)
		{
			foundGPRReg = regNum;
			break;
		}
	}
	return foundGPRReg;
}

// Returns the r# index of the found available temp GPR register, or -1 if there are no available registers to use!
const int FindAvailableTempGPR(const ShaderInfo& inDXShaderInfo)
{
	return FindAvailableTempGPR(inDXShaderInfo.tempRegistersUsedBitmask);
}

// Finds the largest available unused constant buffer register-space.
// Note that at the time of this writing, the ShaderAnalysis library doesn't take into account that matrix multiply instructions (ie. m3x4, m4x4, m3x2, etc.) implicitly reference multiple sequential registers and thus
// it may possibly look like certain constant buffer registers are unused when in fact they are used by those matrix multiply instructions. If that ends up being a problem then we could fix ShaderAnalysis to be able to detect those.
const constantBufferRegisterSpace FindLargestUnusedConstBufferRegisterSpace(const ShaderInfo& inDXShaderInfo)
{
	// Set up our bitmap:
	unsigned usedConstantSpace[256 / 32] = {0};
	const unsigned numUsedConstants = (const unsigned)inDXShaderInfo.usedConstantsF.size();
	for (unsigned x = 0; x < inDXShaderInfo.usedConstantsF.size(); ++x)
	{
		const unsigned short thisRegisterIndex = inDXShaderInfo.usedConstantsF[x];
		usedConstantSpace[thisRegisterIndex / 32] |= (1 << (thisRegisterIndex % 32) );
	}

	unsigned foundBestUnusedRegionSize = 0;
	unsigned foundBestUnusedRegionStart = 0;

	bool currentlyInUnusedRegion = false;
	unsigned currentUnusedRegionStart = 0;
	unsigned currentUnusedRegionSize = 0;
	for (unsigned x = 0; x < 256; ++x)
	{
		const bool currentRegIsUsed = (usedConstantSpace[x / 32] & (1 << (x % 32) ) ) ? true : false;
		if (currentRegIsUsed == false)
		{
			if (currentlyInUnusedRegion == false) // Not currently in an unused region, so start a new one:
			{
				currentUnusedRegionStart = x;
				currentUnusedRegionSize = 1;
				currentlyInUnusedRegion = true;
			}
			else // Continue our existing unused region
			{
				++currentUnusedRegionSize;
			}
		}
		else
		{
			if (currentlyInUnusedRegion == true)
			{
				currentlyInUnusedRegion = false;
				if (currentUnusedRegionSize > foundBestUnusedRegionSize)
				{
					foundBestUnusedRegionSize = currentUnusedRegionSize;
					foundBestUnusedRegionStart = currentUnusedRegionStart;
				}
				currentUnusedRegionSize = 0;
				currentUnusedRegionStart = 0;
			}
		}
	}
	if (currentUnusedRegionSize > foundBestUnusedRegionSize)
	{
		foundBestUnusedRegionSize = currentUnusedRegionSize;
		foundBestUnusedRegionStart = currentUnusedRegionStart;
	}

#ifdef _DEBUG
	if (foundBestUnusedRegionStart > 255)
	{
		__debugbreak(); // Should never be here!
	}
	if (foundBestUnusedRegionSize > 255)
	{
		__debugbreak(); // Should never be here!
	}
#endif

	constantBufferRegisterSpace retSpace;

	if (foundBestUnusedRegionSize > 0)
	{
		retSpace.regStartIndex = (const unsigned char)foundBestUnusedRegionStart;
		retSpace.numRegisters = (const unsigned char)foundBestUnusedRegionSize;
	}
	else
	{
#ifdef _DEBUG
		__debugbreak(); // Error: No available constant buffer registerspace for this shader!
#endif
		retSpace.regStartIndex = 0;
		retSpace.numRegisters = 0;
	}

	return retSpace;
}

static const bool DoesInstructionDecompositionRequireTemporaryRegister(const DEBUGGABLE_D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode)
{
	switch (opcode)
	{
	default: // Non-combo instructions don't need temporary registers
		return false;

		// These combo instructions don't require the use of temporary registers:
	case _D3DSIO_SUB:
	case _D3DSIO_DST:
		return false;

		// MAD and LRP are 3-source instructions (dst,src0,src1,src2). 3-source instructions may require a temporary GPR in case src2 aliases with dst (or if dst is not a GPR), so we'll
		// list them here just to be safe!
	case _D3DSIO_MAD:
	case _D3DSIO_LRP:
		// POW can require a temporary GPR in case dst is not a GPR:
	case _D3DSIO_POW:
		// These combo instructions require one extra temporary GPR to use (usually as an accumulator for dot-products):
	case _D3DSIO_DP3:
	case _D3DSIO_DP4:
	case _D3DSIO_LIT:
	case _D3DSIO_NRM:
	case _D3DSIO_CRS:
	case _D3DSIO_M4x4:
	case _D3DSIO_M4x3:
	case _D3DSIO_M3x4:
	case _D3DSIO_M3x3:
	case _D3DSIO_M3x2:
	case _D3DSIO_DP2ADD:
	case _D3DSIO_SINCOS:
			return true;
	}
}

static const unsigned char InstructionDecompositionNewConstantRegistersRequired(const ShaderInfo& inDXShaderInfo, const DEBUGGABLE_D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode)
{
	switch (opcode)
	{
	default: // Non-combo instructions don't need new constant registers
		return 0;

		// These combo instructions don't require the use of new constant registers:
	case _D3DSIO_SUB:
	case _D3DSIO_MAD:
	case _D3DSIO_LRP:
	case _D3DSIO_POW:
	case _D3DSIO_NRM:
	case _D3DSIO_CRS:
	case _D3DSIO_DP2ADD:
	case _D3DSIO_DP3:
	case _D3DSIO_DP4:
	case _D3DSIO_M4x4:
	case _D3DSIO_M4x3:
	case _D3DSIO_M3x4:
	case _D3DSIO_M3x3:
	case _D3DSIO_M3x2:
		return false;

	case _D3DSIO_SINCOS:
		// Prior to shader model 3, the sincos() instruction already had all the constant registers it needed pre-allocated by the FXC compiler:
		if (inDXShaderInfo.shaderMajorVersion < 3)
			return 0;
		else
			return 2;

		// The LIT and DST instructions both require the use of a single "1.0f" constant. We'll check and see if one is already defined for us:
	case _D3DSIO_LIT:
	case _D3DSIO_DST:
	{
		const unsigned numPredefinedConstants = (const unsigned)inDXShaderInfo.initialConstantValues.size();
		for (unsigned x = 0; x < numPredefinedConstants; ++x)
		{
			const InitialConstantValue& thisConst = inDXShaderInfo.initialConstantValues[x];
			if (fabs(thisConst.initialValue.x) == 1.0f)
				return 0;
			if (fabs(thisConst.initialValue.y) == 1.0f)
				return 0;
			if (fabs(thisConst.initialValue.z) == 1.0f)
				return 0;
			if (fabs(thisConst.initialValue.w) == 1.0f)
				return 0;
		}
		return 1;
	}
	}
}

/* Splits apart "combo" instructions (like DP3/DP4, M4x3, NRM, MAD, DST, LIT, BEM, etc.) into their component pieces that can be executed by the hardware. Some examples of this are:
MAD = MUL + ADD
NRM = DP3 + RSQ + MUL
DST = SUB + DP3 + RSQ + RCP
DP3 = MUL + MUL + MUL + ADD + ADD */
const ShaderCompileResultCode DecomposeShaderInstructions(const ShaderInfo& inDXShaderInfo, const std::vector<const instructionToken*>& inInstructionStartPtrs, const ShaderCompileOptions inCompileOptions, const int inTempGPRIndex, constantBufferRegisterSpace& inOutUnusedConstBufferSpace, std::vector<anyToken>& outDecomposedInstructionStream, std::vector<const instructionToken*>& outDecomposedInstructionStartPtrs)
{
	ShaderCompileResultCode result = ShaderCompile_OK;

	const unsigned numInstructions = (const unsigned)inInstructionStartPtrs.size();
	for (unsigned instructionIndex = 0; instructionIndex < numInstructions; ++instructionIndex)
	{
		const instructionToken* const thisInstruction = inInstructionStartPtrs[instructionIndex];
		const aliasedInstructionTokens* const aliasedInstruction = (const aliasedInstructionTokens* const)thisInstruction;

		if (DoesInstructionDecompositionRequireTemporaryRegister(aliasedInstruction->justOpcode.instruction.opcode) )
		{
			if (ValidateTempGPRIndex(inTempGPRIndex, result) == false)
			{
				if (!(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
				{
					return result;
				}
			}
		}

		const unsigned char numNewConstantRegisterAllocationsRequired = InstructionDecompositionNewConstantRegistersRequired(inDXShaderInfo, aliasedInstruction->justOpcode.instruction.opcode);
		if (inOutUnusedConstBufferSpace.numRegisters < numNewConstantRegisterAllocationsRequired)
		{
#ifdef _DEBUG
			__debugbreak(); // Error: Not enough free constant buffer registers available to decompose this instruction!
#endif
			result = ShaderCompile_ERR_NeededConstRegNotFound;
			if (!(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
			{
				return result;
			}
		}

		switch (aliasedInstruction->justOpcode.instruction.opcode)
		{
		default:
			// Already decomposed into a basic instruction (or a non-decomposable one), just copy over our existing instruction tokens
			CopyInstructionToNewInstructionStream(outDecomposedInstructionStream, outDecomposedInstructionStartPtrs, thisInstruction, inDXShaderInfo);
			break;

		case _D3DSIO_SUB:
			// SUB dst, src0, src1 ->
			// ADD dst, src0, -src1

			// ADD dst, src0, -src1
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst) ); // dst
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex(), (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetSwizzle(), ApplyNegateToSourceMod(aliasedInstruction->srcSrcDst.src1.srcParameter.sourceModifier) ) ); // -src1
			break;
		case _D3DSIO_MAD:
		{
			// MAD dst, src0, src1, src2 ->
			// If no aliasing and dst is a read/write register:
			// MUL dst, src0, src1
			// ADD dst, dst, src2
			// If aliasing and dst is a read/write register:
			// MOV tmp, src2
			// MUL dst, src0, src1
			// ADD dst, dst, tmp
			// If dst is not a read/write register:
			// MUL tmp, src0, src1
			// ADD dst, tmp, src2

			const D3DSHADER_PARAM_REGISTER_TYPE dstRegType = aliasedInstruction->srcSrcSrcDst.dst.GetRegisterType();
			const bool dstAliasesSrc2 = (aliasedInstruction->srcSrcSrcDst.dst.GetRegisterIndex() == aliasedInstruction->srcSrcSrcDst.src2.GetRegisterIndex() ) &&
				(dstRegType == aliasedInstruction->srcSrcSrcDst.src2.GetRegisterType() );
			registerPermissions dstRegPermissions = NotAvailable;
			unsigned short dstRegTypeMaxCount = 0;
			GetRegisterPermissionsAndCount(inDXShaderInfo, dstRegType, dstRegPermissions, dstRegTypeMaxCount);
			const bool dstIsReadWrite = (dstRegPermissions == ReadWrite);

			if (dstIsReadWrite) // RW Dest register case:
			{
				if (dstAliasesSrc2)
				{
					// MOV tmp, src2
					AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MOV) ); // MOV
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZW) ); // temp.xyzw
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src2.GetRegisterType(), aliasedInstruction->srcSrcSrcDst.src2.GetRegisterIndex(), _NoSwizzleRGBA) ); // src2 (as src0 for the MOV)
				}

				// MUL dst, src0, src1
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.dst) ); // dst
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src1) ); // src1

				// ADD dst, dst, tmp/src2
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.dst) ); // dst
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcSrcDst.dst.GetRegisterIndex(), _NoSwizzleXYZW) ); // dest (as src0 for the ADD)
				if (dstAliasesSrc2)
				{
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, (const debuggableFullSwizzle)aliasedInstruction->srcSrcSrcDst.src2.GetSwizzle(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcSrcDst.src2.GetSourceModifiers() ) ); // temp (as src1 for the ADD)
				}
				else
				{
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src2) ); // src2 (as src1 for the ADD)
				}
			}
			else // Non-read/writeable dst register case:
			{
				if (dstAliasesSrc2)
				{
#ifdef _DEBUG
					__debugbreak(); // Error: Should never be in a place where src2 and dst are both non-readable registers!
#endif
					result = ShaderCompile_ERR_IllegalInstruction;
					if (!(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
					{
						return result;
					}
				}

				// MUL tmp, src0, src1
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, (const writeMaskType)aliasedInstruction->srcSrcSrcDst.dst.GetWriteMask() ) ); // temp
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src1) ); // src1

				// ADD dst, tmp, src2
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.dst) ); // dst
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, _NoSwizzleXYZW) ); // temp (as src0 for the ADD)
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src2) ); // src2 (as src1 for the ADD)
			}
			break;
		}
		case _D3DSIO_DP3:
			// DP3 dst, src0, src1 ->
			// MUL temp.xyz, src0.xyz, src1.xyz
			// ADD temp.x, temp.x, temp.y
			// ADD dst.xyzw, temp.xxxx, temp.zzzz

			// MUL temp.xyz, src0.xyz, src1.xyz
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1) ); // src1

			// ADD temp.x, temp.x, temp.y
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

			// ADD dst.xyzw, temp.xxxx, temp.zzzz
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst) ); // dst.xyzw
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.xxxx
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.zzzz
			break;
		case _D3DSIO_DP4:
			// DP4 dst, src0, src1 ->
			// MUL temp.xyzw, src0.xyzw, src1.xyzw
			// ADD temp.xz, temp.xz, temp.yw
			// ADD dst.xyzw, temp.xxxx, temp.zzzz

			// MUL temp.xyzw, src0.xyzw, src1.xyzw
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZW) ); // temp.xyzw
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1) ); // src1

			// ADD temp.xz, temp.xz, temp.yw
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XZ) ); // temp.xz
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, _xzxz) ); // temp.xz
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, _ywyw) ); // temp.yw

			// ADD dst.xyzw, temp.xxxx, temp.zzzz
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst) ); // dst.xyzw
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.xxxx
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.zzzz
			break;
		case _D3DSIO_LIT:
			// LIT dst, src0 ->
		    // DEF c4, 1, 0, 0, 0
			// SLT temp.xy, -src0, src0
			// MUL dst.y, temp.x, src0.x
			// MUL temp.x, temp.y, temp.x
			// // POW temp.y, src0.y, src0.w // POW is a compound instruction itself and can be decomposed into exp(src1 * log(abs(src0) ) )
			// LOG temp.z src0_abs.y // POW step 1
			// MUL temp.z, temp.z, src0.w // POW step 2
			// EXP temp.y, temp.z // POW step 3
			// MUL dst.z, temp.y, temp.x
			// MOV dst.xw, c4.x
#ifdef _DEBUG
			__debugbreak(); // Not yet implemented!
#endif
			break;
		case _D3DSIO_DST:
			// DST dst, src0, src1 ->
			// DEF c0, 1, 0, 0, 0
			// MOV dst.x, c0.x // If write mask .x
			// MUL dst.y, src0.y, src1.y // If write mask .y
			// MOV dst.z, src0.z // If write mask .z
			// MOV dst.w, src1.w // If write mask .w

			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_X)
			{
				// MOV dst.x, c0.x
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MOV) ); // MOV
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_X, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_CONST, inOutUnusedConstBufferSpace.regStartIndex, sourceX) ); // src0
			}
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Y)
			{
				// MUL dst.y, src0.y, src1.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Y, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.y
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0.GetRegisterType(), aliasedInstruction->srcSrcDst.src0.GetRegisterIndex(), sourceY, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src0.GetSourceModifiers() ) ); // src0.y
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex(), sourceY, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1.y
			}
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Z)
			{
				// MOV dst.z, src0.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MOV) ); // MOV
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Z, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.z
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0.GetRegisterType(), aliasedInstruction->srcSrcDst.src0.GetRegisterIndex(), sourceZ, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src0.GetSourceModifiers() ) ); // src0.z
			}
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_W)
			{
				// MOV dst.w, src1.w
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MOV) ); // MOV
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_W, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex(), sourceW, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1.w
			}
			break;
		case _D3DSIO_LRP:
		{
			// LRP dst, src0, src1, src2 ->
			// If no aliasing and dst is a read/write register:
			// ADD dst, src1, -src2
			// MUL dst, dst, src0
			// ADD dst, dst, src2
			// If aliasing and dst is a read/write register::
			// MOV tmp, dst
			// ADD dst, src1, -src2
			// MUL dst, dst, tmp/src0
			// ADD dst, dst, tmp/src2
			// If dst is not a readable register:
			// ADD tmp, src1, -src2
			// MUL tmp, tmp, src0
			// ADD dst, tmp, src2

			const D3DSHADER_PARAM_REGISTER_TYPE dstRegType = aliasedInstruction->srcSrcSrcDst.dst.GetRegisterType();
			registerPermissions dstRegPermissions = NotAvailable;
			unsigned short dstRegTypeMaxCount = 0;
			GetRegisterPermissionsAndCount(inDXShaderInfo, dstRegType, dstRegPermissions, dstRegTypeMaxCount);
			const bool dstIsReadWrite = (dstRegPermissions == ReadWrite);
			const bool dstAliasesSrc0 = (aliasedInstruction->srcSrcSrcDst.dst.GetRegisterIndex() == aliasedInstruction->srcSrcSrcDst.src0.GetRegisterIndex() ) &&
				(aliasedInstruction->srcSrcSrcDst.dst.GetRegisterType() == aliasedInstruction->srcSrcSrcDst.src0.GetRegisterType() );
			const bool dstAliasesSrc2 = (aliasedInstruction->srcSrcSrcDst.dst.GetRegisterIndex() == aliasedInstruction->srcSrcSrcDst.src2.GetRegisterIndex() ) &&
				(aliasedInstruction->srcSrcSrcDst.dst.GetRegisterType() == aliasedInstruction->srcSrcSrcDst.src2.GetRegisterType() );

			if (dstIsReadWrite) // RW dst case:
			{
				if (dstAliasesSrc0 || dstAliasesSrc2)
				{
					// MOV tmp, src0/src2
					AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MOV) ); // MOV
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZW) ); // temp.xyzw
					if (dstAliasesSrc0)
					{
						AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src0.GetRegisterType(), aliasedInstruction->srcSrcSrcDst.src0.GetRegisterIndex(), _NoSwizzleRGBA) ); // src0 (as src0 for the MOV)
					}
					else
					{
						AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src2.GetRegisterType(), aliasedInstruction->srcSrcSrcDst.src2.GetRegisterIndex(), _NoSwizzleRGBA) ); // src2 (as src0 for the MOV)
					}
				}

				// ADD dst, src1, -src2
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.dst) ); // dst
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src1) ); // src1
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src2.GetRegisterType(), aliasedInstruction->srcSrcSrcDst.src2.GetRegisterIndex(), (const debuggableFullSwizzle)aliasedInstruction->srcSrcSrcDst.src2.GetSwizzle(), ApplyNegateToSourceMod(aliasedInstruction->srcSrcSrcDst.src2.srcParameter.sourceModifier) ) ); // -src2

				// MUL dst, dst, src0
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.dst) ); // dst
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenNoSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcSrcDst.dst.GetRegisterIndex() ) ); // dst
				if (dstAliasesSrc0)
				{
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, (const debuggableFullSwizzle)aliasedInstruction->srcSrcSrcDst.src0.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcSrcDst.src0.GetSourceModifiers() ) ); // tmp (as src1)
				}
				else
				{
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src0) ); // src0
				}

				// ADD dst, dst, src2
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.dst) ); // dst
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenNoSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcSrcDst.dst.GetRegisterIndex() ) ); // dst
				if (dstAliasesSrc2)
				{
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, (const debuggableFullSwizzle)aliasedInstruction->srcSrcSrcDst.src2.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcSrcDst.src2.GetSourceModifiers() ) ); // tmp (as src2)
				}
				else
				{
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src2) ); // src2
				}
			}
			else // Non-read/writeable dst register case:
			{
				if (dstAliasesSrc0 || dstAliasesSrc2)
				{
#ifdef _DEBUG
					__debugbreak(); // Error: Should never be in a place where (src0 or src2) and dst are both non-readable registers!
#endif
					result = ShaderCompile_ERR_IllegalInstruction;
					if (!(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
					{
						return result;
					}
				}

				// ADD tmp, src1, -src2
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, (const writeMaskType)aliasedInstruction->srcSrcSrcDst.dst.GetWriteMask() ) ); // temp
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src1) ); // src1
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src2.GetRegisterType(), aliasedInstruction->srcSrcSrcDst.src2.GetRegisterIndex(), (const debuggableFullSwizzle)aliasedInstruction->srcSrcSrcDst.src2.GetSwizzle(), ApplyNegateToSourceMod(aliasedInstruction->srcSrcSrcDst.src2.srcParameter.sourceModifier) ) ); // -src2

				// MUL tmp, tmp, src0
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, (const writeMaskType)aliasedInstruction->srcSrcSrcDst.dst.GetWriteMask() ) ); // temp
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, _NoSwizzleXYZW) ); // temp
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src0) ); // src0

				// ADD dst, tmp, src2
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.dst) ); // dst
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, _NoSwizzleXYZW) ); // temp
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src2) ); // src2
			}
			break;
		}
		case _D3DSIO_M4x4:
			// M4x4 dst, src0, src1 ->
			// MUL temp.xyzw, src0.xyzw, src1.xyzw // If write mask .x
			// ADD temp.x, temp.x, temp.y
			// ADD temp.x, temp.x, temp.z
			// ADD dst.x, temp.x, temp.w
			// MUL temp.xyzw, src0.xyzw, src1+1.xyzw // If write mask .y
			// ADD temp.x, temp.x, temp.y
			// ADD temp.x, temp.x, temp.z
			// ADD dst.y, temp.x, temp.w
			// MUL temp.xyzw, src0.xyzw, src1+2.xyzw // If write mask .z
			// ADD temp.x, temp.x, temp.y
			// ADD temp.x, temp.x, temp.z
			// ADD dst.z, temp.x, temp.w
			// MUL temp.xyzw, src0.xyzw, src1+3.xyzw // If write mask .w
			// ADD temp.x, temp.x, temp.y
			// ADD temp.x, temp.x, temp.z
			// ADD dst.w, temp.x, temp.w

			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_X) // If write mask .x
			{
				// MUL temp.xyzw, src0.xyzw, src1.xyzw
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZW) ); // temp.xyzw
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1) ); // src1

				// ADD temp.x, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD temp.x, temp.x, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z

				// ADD dst.x, temp.x, temp.w
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_X, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
			}

			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Y) // If write mask .y
			{
				// MUL temp.xyzw, src0.xyzw, src1+1.xyzw
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZW) ); // temp.xyzw
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex() + 1, (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1+1.xyzw

				// ADD temp.x, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD temp.x, temp.x, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z

				// ADD dst.y, temp.x, temp.w
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Y, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.y
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
			}

			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Z) // If write mask .z
			{
				// MUL temp.xyzw, src0.xyzw, src1+2.xyzw
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZW) ); // temp.xyzw
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex() + 2, (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1+2.xyzw

				// ADD temp.x, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD temp.x, temp.x, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z

				// ADD dst.z, temp.x, temp.w
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Z, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.z
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
			}

			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_W) // If write mask .w
			{
				// MUL temp.xyzw, src0.xyzw, src1+3.xyzw
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZW) ); // temp.xyzw
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex() + 3, (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1+3.xyzw

				// ADD temp.x, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD temp.x, temp.x, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z

				// ADD dst.w, temp.x, temp.w
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_W, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
			}
			break;
		case _D3DSIO_M4x3:
			// M4x3 dst, src0, src1 ->
			// MUL temp.xyzw, src0.xyzw, src1.xyzw // If write mask .x
			// ADD temp.x, temp.x, temp.y
			// ADD temp.x, temp.x, temp.z
			// ADD dst.x, temp.x, temp.w
			// MUL temp.xyzw, src0.xyzw, src1+1.xyzw // If write mask .y
			// ADD temp.x, temp.x, temp.y
			// ADD temp.x, temp.x, temp.z
			// ADD dst.y, temp.x, temp.w
			// MUL temp.xyzw, src0.xyzw, src1+2.xyzw // If write mask .z
			// ADD temp.x, temp.x, temp.y
			// ADD temp.x, temp.x, temp.z
			// ADD dst.z, temp.x, temp.w

			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_X) // If write mask .x
			{
				// MUL temp.xyzw, src0.xyzw, src1.xyzw
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZW) ); // temp.xyzw
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1) ); // src1

				// ADD temp.x, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD temp.x, temp.x, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z

				// ADD dst.x, temp.x, temp.w
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_X, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
			}

			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Y) // If write mask .y
			{
				// MUL temp.xyzw, src0.xyzw, src1+1.xyzw
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZW) ); // temp.xyzw
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex() + 1, (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1+1.xyzw

				// ADD temp.x, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD temp.x, temp.x, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z

				// ADD dst.y, temp.x, temp.w
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Y, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.y
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
			}

			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Z) // If write mask .z
			{
				// MUL temp.xyzw, src0.xyzw, src1+2.xyzw
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZW) ); // temp.xyzw
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex() + 2, (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1+2.xyzw

				// ADD temp.x, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD temp.x, temp.x, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z

				// ADD dst.z, temp.x, temp.w
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Z, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.z
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
			}

			break;
		case _D3DSIO_M3x4:
			// M3x4 dst, src0, src1 ->
			// MUL temp.xyz, src0.xyz, src1.xyz // If write mask .x
			// ADD temp.w, temp.x, temp.y
			// ADD dst.x, temp.w, temp.z
			// MUL temp.xyz, src0.xyz, src1+1.xyz // If write mask .y
			// ADD temp.w, temp.x, temp.y
			// ADD dst.y, temp.w, temp.z
			// MUL temp.xyz, src0.xyz, src1+2.xyz // If write mask .z
			// ADD temp.w, temp.x, temp.y
			// ADD dst.z, temp.w, temp.z
			// MUL temp.xyz, src0.xyz, src1+3.xyz // If write mask .w
			// ADD temp.w, temp.x, temp.y
			// ADD dst.w, temp.w, temp.z

			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_X) // If write mask .x
			{
				// MUL temp.xyz, src0.xyz, src1.xyz
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1) ); // src1

				// ADD temp.w, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD dst.x, temp.w, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_X, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z
			}
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Y) // If write mask .y
			{
				// MUL temp.xyz, src0.xyz, src1+1.xyz
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex() + 1, (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1+1.xyz

				// ADD temp.w, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD dst.y, temp.w, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Y, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.y
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z
			}
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Z) // If write mask .z
			{
				// MUL temp.xyz, src0.xyz, src1+2.xyz
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex() + 2, (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1+2.xyz

				// ADD temp.w, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD dst.z, temp.w, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Z, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.z
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z
			}
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_W) // If write mask .w
			{
				// MUL temp.xyz, src0.xyz, src1+3.xyz
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex() + 3, (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1+3.xyz

				// ADD temp.w, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD dst.w, temp.w, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_W, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z
			}
			break;
		case _D3DSIO_M3x3:
			// M3x3 dst, src0, src1 ->
			// MUL temp.xyz, src0.xyz, src1.xyz // If write mask .x
			// ADD temp.w, temp.x, temp.y
			// ADD dst.x, temp.w, temp.z
			// MUL temp.xyz, src0.xyz, src1+1.xyz // If write mask .y
			// ADD temp.w, temp.x, temp.y
			// ADD dst.y, temp.w, temp.z
			// MUL temp.xyz, src0.xyz, src1+2.xyz // If write mask .z
			// ADD temp.w, temp.x, temp.y
			// ADD dst.z, temp.w, temp.z
			
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_X) // If write mask .x
			{
				// MUL temp.xyz, src0.xyz, src1.xyz
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1) ); // src1

				// ADD temp.w, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD dst.x, temp.w, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_X, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z
			}
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Y) // If write mask .y
			{
				// MUL temp.xyz, src0.xyz, src1+1.xyz
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex() + 1, (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1+1.xyz

				// ADD temp.w, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD dst.y, temp.w, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Y, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.y
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z
			}
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Z) // If write mask .z
			{
				// MUL temp.xyz, src0.xyz, src1+2.xyz
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex() + 2, (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1+2.xyz

				// ADD temp.w, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD dst.z, temp.w, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Z, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.z
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z
			}
			break;
		case _D3DSIO_M3x2:
			// M3x2 dst, src0, src1 ->
			// MUL temp.xyz, src0.xyz, src1.xyz // If write mask .x
			// ADD temp.w, temp.x, temp.y
			// ADD dst.x, temp.w, temp.z
			// MUL temp.xyz, src0.xyz, src1+1.xyz // If write mask .y
			// ADD temp.w, temp.x, temp.y
			// ADD dst.y, temp.w, temp.z

			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_X) // If write mask .x
			{
				// MUL temp.xyz, src0.xyz, src1.xyz
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1) ); // src1

				// ADD temp.w, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD dst.x, temp.w, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_X, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z
			}
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Y) // If write mask .y
			{
				// MUL temp.xyz, src0.xyz, src1+1.xyz
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0) ); // src0
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex() + 1, (const debuggableFullSwizzle)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzleXYZW(), (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1+1.xyz

				// ADD temp.w, temp.x, temp.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

				// ADD dst.y, temp.w, temp.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Y, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.y
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z
			}
			break;
		case _D3DSIO_POW:
		{
			// POW dst, src0, src1 ->
			// If dst is a read/write register:
			// LOG dst.x, src0_abs.replicateswizzle
			// MUL dst.x, dst.x, src1.replicateswizzle
			// EXP dst.x, dst.x
			// MOV dst.yzw, dst.xxx
			// If dst is not a read/write register:
			// LOG tmp.x, src0_abs.replicateswizzle
			// MUL tmp.x, tmp.x, src1.replicateswizzle
			// EXP tmp.x, tmp.x
			// MOV dst.xyzw, tmp.xxxx

			const D3DSHADER_PARAM_REGISTER_TYPE dstRegType = aliasedInstruction->srcSrcSrcDst.dst.GetRegisterType();
			registerPermissions dstRegPermissions = NotAvailable;
			unsigned short dstRegTypeMaxCount = 0;
			GetRegisterPermissionsAndCount(inDXShaderInfo, dstRegType, dstRegPermissions, dstRegTypeMaxCount);
			const bool dstIsReadWrite = (dstRegPermissions == ReadWrite);

			const debuggableSwizzleChannel dstReplicateSwizzle = (const debuggableSwizzleChannel)GetFirstWriteChannelIndex(aliasedInstruction->srcSrcDst.dst);
			const writeMaskType firstWriteMaskChannelIndex = (const writeMaskType)(1 << dstReplicateSwizzle);
			const debuggableSwizzleChannel src0replicateSwizzle = (const debuggableSwizzleChannel)aliasedInstruction->srcSrcDst.src0.GetChannelSwizzle();
			const debuggableSwizzleChannel src1replicateSwizzle = (const debuggableSwizzleChannel)aliasedInstruction->srcSrcDst.src1.GetChannelSwizzle();
			const dstParameterToken dstFirstReg = AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), firstWriteMaskChannelIndex); // dst.first
			const srcParameterToken dstFirstSrcReg = AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), dstReplicateSwizzle); // dst.first (as a source parameter)
			const writeMaskType finalMovWriteMask = (const writeMaskType)(aliasedInstruction->srcSrcDst.dst.GetWriteMask() & (~firstWriteMaskChannelIndex) );
			
			if (dstIsReadWrite) // Dst is read/write register case:
			{
				// LOG dst.x, src0_abs.replicateswizzle
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_LOG) ); // LOG
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, dstFirstReg); // dst.first
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0.GetRegisterType(), aliasedInstruction->srcSrcDst.src0.GetRegisterIndex(), src0replicateSwizzle, SM_Abs) ); // src0_abs.replicateswizzle

				// MUL dst.x, dst.x, src1.replicateswizzle
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, dstFirstReg); // dst.first
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, dstFirstSrcReg); // dst.first (as a source parameter)
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1) ); // src1.replicateswizzle

				// EXP dst.x, dst.x
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_EXP) ); // EXP
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, dstFirstReg); // dst.first
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, dstFirstSrcReg); // dst.first (as a source parameter)

				if (finalMovWriteMask > WM_None)
				{
					// MOV dst.yzw, dst.xxx
					AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MOV) ); // MOV
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), finalMovWriteMask) ); // dst.writemask
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, dstFirstSrcReg); // dst.first (as a source parameter)
				}
			}
			else
			{
				// LOG tmp.x, src0_abs.replicateswizzle
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_LOG) ); // LOG
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0.GetRegisterType(), aliasedInstruction->srcSrcDst.src0.GetRegisterIndex(), src0replicateSwizzle, SM_Abs) ); // src0_abs.replicateswizzle

				// MUL tmp.x, tmp.x, src1.replicateswizzle
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x (as a source parameter)
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1) ); // src1.replicateswizzle

				if (finalMovWriteMask > WM_None)
				{
					// EXP tmp.x, tmp.x
					AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_EXP) ); // EXP
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x (as a source parameter)

					// MOV dst.xyzw, tmp.xxxx
					AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MOV) ); // MOV
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), finalMovWriteMask) ); // dst.writemask
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x (as a source parameter)
				}
				else
				{
					// EXP dst.x, tmp.x
					AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_EXP) ); // EXP
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, dstFirstReg); // dst.first
					AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x (as a source parameter)
				}
			}
			break;
		}
		case _D3DSIO_CRS:
		{
			// CRS dst, src0, src1 ->
			// MUL temp.xyz, src0.yzx, src1.zxy
			// MUL temp.w, src0.z, src1.y
			// ADD dst.x, temp.x, -temp.w
			// MUL temp.w, src0.x, src1.z
			// ADD dst.y, temp.y, -temp.w
			// MUL temp.w, src0.y, src1.x
			// ADD dst.z, temp.z, -temp.w

			// MUL temp.xyz, src0.yzx, src1.zxy
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0.GetRegisterType(), aliasedInstruction->srcSrcDst.src0.GetRegisterIndex(), _yzxx, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src0.GetSourceModifiers() ) ); // src0.yzx
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex(), _zxyy, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1.zxy

			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_X)
			{
				// MUL temp.w, src0.z, src1.y
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0.GetRegisterType(), aliasedInstruction->srcSrcDst.src0.GetRegisterIndex(), sourceZ, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src0.GetSourceModifiers() ) ); // src0.z
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex(), sourceY, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1.y

				// ADD dst.x, temp.x, -temp.w
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_X, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW, SM_Negate) ); // -temp.w
			}
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Y)
			{
				// MUL temp.w, src0.x, src1.z
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0.GetRegisterType(), aliasedInstruction->srcSrcDst.src0.GetRegisterIndex(), sourceX, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src0.GetSourceModifiers() ) ); // src0.x
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex(), sourceZ, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1.z

				// ADD dst.y, temp.y, -temp.w
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Y, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.y
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW, SM_Negate) ); // -temp.w
			}
			if (aliasedInstruction->srcSrcDst.dst.GetWriteMask() & WM_Z)
			{
				// MUL temp.w, src0.y, src1.x
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W) ); // temp.w
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src0.GetRegisterType(), aliasedInstruction->srcSrcDst.src0.GetRegisterIndex(), sourceY, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src0.GetSourceModifiers() ) ); // src0.y
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, aliasedInstruction->srcSrcDst.src1.GetRegisterType(), aliasedInstruction->srcSrcDst.src1.GetRegisterIndex(), sourceX, (const debuggableSourceModifierType)aliasedInstruction->srcSrcDst.src1.GetSourceModifiers() ) ); // src1.x

				// ADD dst.z, temp.z, -temp.w
				AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcDst.dst.GetRegisterType(), aliasedInstruction->srcSrcDst.dst.GetRegisterIndex(), WM_Z, (const resultModifierType)aliasedInstruction->srcSrcDst.dst.GetResultModifier(), aliasedInstruction->srcSrcDst.dst.GetResultShiftScale() ) ); // dst.z
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z
				AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW, SM_Negate) ); // -temp.w
			}
		}
			break;
		case _D3DSIO_NRM:
		{
			// NRM dst, src0 ->
			// MUL temp.xyz, src0.xyz, src0.xyz
			// ADD temp.w, temp.x, temp.y
			// ADD temp.w, temp.w, temp.z
			// RSQ temp.w, temp.w
			// MUL temp.w, temp.w, temp.w
			// MUL dst.xyzw, temp.wwww, src0.xyzw

			const debuggableSwizzleChannel dstReplicateSwizzle = (const debuggableSwizzleChannel)GetFirstWriteChannelIndex(aliasedInstruction->srcDst.dst);
			const writeMaskType firstWriteMaskChannelIndex = (const writeMaskType)(1 << dstReplicateSwizzle);
			const dstParameterToken tempReg = AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_W); // temp.w
			const srcParameterToken tempSrcReg = AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceW); // temp.w (as a source parameter)

			// MUL temp.xyz, src0.xyz, src0.xyz
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XYZ) ); // temp.xyz
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcDst.src0) ); // src0.xyz
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcDst.src0) ); // src0.xyz

			// ADD temp.w, temp.x, temp.y
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, tempReg); // temp.w
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

			// ADD temp.w, temp.w, temp.z
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, tempReg); // temp.w
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, tempSrcReg); // temp.w (as a source parameter)
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceZ) ); // temp.z

			// RSQ temp.w, temp.w
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_RSQ) ); // RSQ
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, tempReg); // temp.w
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, tempSrcReg); // temp.w (as a source parameter)

			// MUL temp.w, temp.w, temp.w
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, tempReg); // temp.w
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, tempSrcReg); // temp.w (as a source parameter)
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, tempSrcReg); // temp.w (as a source parameter)

			// MUL dst.xyzw, temp.wwww, src0.xyzw
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcDst.dst) ); // dst.xyzw
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, tempSrcReg); // temp.wwww (as a source parameter)
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcDst.src0) ); // src0.xyzw
		}
			break;
		case _D3DSIO_DP2ADD:
			// DP2ADD dst, src0, src1, src2 ->
			// MUL temp.xy, src0.xy, src1.xy
			// ADD temp.x, temp.x, temp.y
			// ADD dst.writemask, temp.x, src2.replicateswizzle

			// MUL temp.xy, src0.xy, src1.xy
			AppendNewInstructionStartToTokenStartPtrs(outDecomposedInstructionStartPtrs, outDecomposedInstructionStream);
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_MUL) ); // MUL
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_XY) ); // temp.xy
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src0) ); // src0
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src1) ); // src1

			// ADD temp.x, temp.x, temp.y
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleDestParameterToken(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, WM_X) ); // temp.x
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.x
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceY) ); // temp.y

			// ADD dst.writemask, temp.x, src2.replicateswizzle
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleInstructionToken(inDXShaderInfo, _D3DSIO_ADD) ); // ADD
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingDestParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.dst) ); // dst.writemask
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, AssembleSourceParameterTokenReplicateSwizzle(inDXShaderInfo, D3DSPR_TEMP, inTempGPRIndex, sourceX) ); // temp.xxxx
			AppendNewTokenToTokenStream(outDecomposedInstructionStream, CopyExistingSourceParameterToken(inDXShaderInfo, aliasedInstruction->srcSrcSrcDst.src2) ); // src2.replicateswizzle
			break;
		case _D3DSIO_SINCOS:
			// The implementation is different between Shader Model 2 (dst, src0, src1, src2) and Shader Model 3 (dst, src0).
			if (aliasedInstruction->srcDst.dst.GetWriteMask() & WM_X)
			{
				// COS is implemented as the power series expansion: sqrt((1+cos(x))/2) = 1 - x^2/8 + x^4/384 - x^6/46080
				// Then to get back from sqrt((1+cos(x))/2) to cos(x) you square the series result, multiply by 2, and finally subtract 1.0f.
				// COS dst, src0, src1, src2 ->
				// temp.x will contain our accumulator
				// temp.y will contain our x^n power
				// temp.z will contain a temporary product
				// temp.w will contain x^2
				// MUL temp.w, src0.replicateswizzle, src0.replicateswizzle // x^2
				// MUL temp.x, temp.w, D3DSINCOSCONST2.y // x^2 * -1/8
				// MUL temp.y, temp.w, temp.w // x^4
				// MUL temp.z, temp.y, D3DSINCOSCONST1.z // x^4 * 1/384
				// ADD temp.x, temp.x, temp.z
				// MUL temp.y, temp.y, temp.w // x^6
				// MUL temp.z, temp.y, D3DSINCOSCONST1.y // x^6 * -1/46080
				// ADD temp.x, temp.x, temp.z
				// ADD temp.x, temp.x, D3DSINCOSCONST2.z // + 1.0f
				// MUL temp.x, temp.x, temp.x // Square the whole result
				// ADD temp.x, temp.x, temp.x // Multiply the result by 2.0f
				// ADD dst.x, temp.x, -D3DSINCOSCONST2.z // Subtract 1.0f from the final result to get cos(x)
			}
			
			if (aliasedInstruction->srcDst.dst.GetWriteMask() & WM_Y)
			{
				// SIN is implemented as the power series expansion: sqrt(1+sin(x)) = 1 + x/2 - x^2/8 - x^3/48 + x^4/384 + x^5/3840 - x^6/46080 - x^7/645120 + ...
				// Then to get back from sqrt(1+sin(x)) to sin(x) you square the series result and finally subtract 1.0f.
				// SIN dst, src0, src1, src2 ->
				// temp.x will contain our accumulator
				// temp.y will contain our x^n power
				// temp.z will contain a temporary product
				// MUL temp.x, src0.replicateswizzle, D3DSINCOSCONST2.w // x * 1/2
				// MUL temp.y, src0.replicateswizzle, src0.replicateswizzle // x^2
				// MUL temp.z, temp.y, D3DSINCOSCONST2.y // x^2 * -1/8
				// ADD temp.x, temp.x, temp.z
				// MUL temp.y, temp.y, src0.replicateswizzle // x^3
				// MUL temp.z, temp.y, D3DSINCOSCONST2.x // x^3 * -1/48
				// ADD temp.x, temp.x, temp.z
				// MUL temp.y, temp.y, src0.replicateswizzle // x^4
				// MUL temp.z, temp.y, D3DSINCOSCONST1.z // x^4 * 1/384
				// ADD temp.x, temp.x, temp.z
				// MUL temp.y, temp.y, src0.replicateswizzle // x^5
				// MUL temp.z, temp.y, D3DSINCOSCONST1.w // x^5 * 1/3840
				// ADD temp.x, temp.x, temp.z
				// MUL temp.y, temp.y, src0.replicateswizzle // x^6
				// MUL temp.z, temp.y, D3DSINCOSCONST1.y // x^6 * -1/46080
				// ADD temp.x, temp.x, temp.z
				// MUL temp.y, temp.y, src0.replicateswizzle // x^7
				// MUL temp.z, temp.y, D3DSINCOSCONST1.x // x^7 * -1/645120
				// ADD temp.x, temp.x, temp.z
				// ADD temp.x, temp.x, D3DSINCOSCONST2.z // + 1.0f
				// MUL temp.x, temp.x, temp.x // Square the whole result
				// ADD dst.y, temp.x, -D3DSINCOSCONST2.z // Subtract 1.0f from the final result to get sin(x)
			}
#ifdef _DEBUG
			__debugbreak(); // Not yet implemented!
#endif
			break;
		}

		if (inOutUnusedConstBufferSpace.numRegisters >= numNewConstantRegisterAllocationsRequired)
		{
			inOutUnusedConstBufferSpace.numRegisters -= numNewConstantRegisterAllocationsRequired;
			inOutUnusedConstBufferSpace.regStartIndex += numNewConstantRegisterAllocationsRequired;

#ifdef _DEBUG
			if (inOutUnusedConstBufferSpace.numRegisters > 255)
			{
				__debugbreak(); // Error: Too many constant registers!
			}
			if (inOutUnusedConstBufferSpace.regStartIndex > 255)
			{
				__debugbreak(); // Error: Constant register start index out of range!
			}
#endif
		}
	}

	RebaseInstructionStartPointers(outDecomposedInstructionStartPtrs, &outDecomposedInstructionStream.front() );

	ValidateAllInstructionStartPtrs(outDecomposedInstructionStream, outDecomposedInstructionStartPtrs);

	return result;
}

/* Translates from Direct3D9 shader bytecode into the device-specific bytecode that our hardware shader core understands and can execute. */
const ShaderCompileResultCode TranslateToDeviceBytecode(const ShaderInfo& inDXShaderInfo, const std::vector<const instructionToken*>& inDXStartPtrs, const ShaderCompileOptions inCompileOptions, std::vector<instructionSlot>& outDeviceInstructionStream)
{
	ShaderCompileResultCode result = ShaderCompile_OK;
	const unsigned numDecomposedInstructions = (const unsigned)inDXStartPtrs.size();
	for (unsigned instructionIndex = 0; instructionIndex < numDecomposedInstructions; ++instructionIndex)
	{
		// Big note for now - the aliasedInstructionTokens union *does not* take into account relative addressing tokens!
		// Currently, relative addressing isn't supported by the hardware, so that's somewhat okay to not handle that.
		// But in the future we'll want something even more flexible to handle relative addressing.
		const aliasedInstructionTokens* const aliasedInstruction = (const aliasedInstructionTokens* const)inDXStartPtrs[instructionIndex];
		switch (aliasedInstruction->justOpcode.instruction.opcode)
		{
		case _D3DSIO_LABEL:
		case _D3DSIO_DCL:
		case _D3DSIO_DEFB:
		case _D3DSIO_DEFI:
		case _D3DSIO_DEF:
		case _D3DSIO_PHASE:
		case _D3DSIO_COMMENT:
		case _D3DSIO_END:
			// Ignore this instruction when converting from DX bytecode into device bytecode
			break;
		case _D3DSIO_CALL:
		case _D3DSIO_CALLNZ:
		case _D3DSIO_LOOP:
		case _D3DSIO_RET:
		case _D3DSIO_ENDLOOP:
		case _D3DSIO_REP:
		case _D3DSIO_ENDREP:
		case _D3DSIO_IF:
		case _D3DSIO_IFC:
		case _D3DSIO_ELSE:
		case _D3DSIO_ENDIF:
		case _D3DSIO_BREAK:
		case _D3DSIO_BREAKC:
#ifdef _DEBUG
			__debugbreak(); // Unsupported flow control instruction
#endif
			result = ShaderCompile_ERR_UnsupportedFlowControlInstruction;
			break;
		case _D3DSIO_MAD:
		case _D3DSIO_SUB:
		case _D3DSIO_DP3:
		case _D3DSIO_DP4:
		case _D3DSIO_LIT:
		case _D3DSIO_DST:
		case _D3DSIO_LRP:
		case _D3DSIO_M4x4:
		case _D3DSIO_M4x3:
		case _D3DSIO_M3x4:
		case _D3DSIO_M3x3:
		case _D3DSIO_M3x2:
		case _D3DSIO_POW:
		case _D3DSIO_CRS:
		case _D3DSIO_NRM:
		case _D3DSIO_SINCOS:
		case _D3DSIO_DP2ADD:
#ifdef _DEBUG
			__debugbreak(); // Oh no, this instruction should have been decomposed in a previous pass!
#endif
		default:
#ifdef _DEBUG
			__debugbreak(); // Unknown/unexpected opcode encountered!
#endif
			result = ShaderCompile_ERR_UnknownInstructionOpcode;
			// Do nothing!
			break;
		case _D3DSIO_NOP:
			// nop NULL.x, 0.x, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->justOpcode.instruction), 
				DRMod_None, DRTyp_NULL, 0 /*destRegIndex*/, Chan_X, 
				SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X, 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		case _D3DSIO_MOV:
			// mov dst, src0, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcDst.dst), GetDestRegType(aliasedInstruction->srcDst.dst), GetDestRegIndex(aliasedInstruction->srcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcDst.src0), GetSrcRegType(aliasedInstruction->srcDst.src0), GetSrcRegIndex(aliasedInstruction->srcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcDst.src0), 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		case _D3DSIO_ADD:
			// add dst, src0, src1
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcSrcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcSrcDst.dst), GetDestRegType(aliasedInstruction->srcSrcDst.dst), GetDestRegIndex(aliasedInstruction->srcSrcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcSrcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src0), GetSrcRegType(aliasedInstruction->srcSrcDst.src0), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src0), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src1), GetSrcRegType(aliasedInstruction->srcSrcDst.src1), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src1) /*src1RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src1) } });
			break;
		case _D3DSIO_MUL:
			// mul dst, src0, src1
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcSrcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcSrcDst.dst), GetDestRegType(aliasedInstruction->srcSrcDst.dst), GetDestRegIndex(aliasedInstruction->srcSrcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcSrcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src0), GetSrcRegType(aliasedInstruction->srcSrcDst.src0), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src0), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src1), GetSrcRegType(aliasedInstruction->srcSrcDst.src1), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src1) /*src1RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src1) } });
			break;
		case _D3DSIO_RCP:
			// rcp dst, src0, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcDst.dst), GetDestRegType(aliasedInstruction->srcDst.dst), GetDestRegIndex(aliasedInstruction->srcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcDst.src0), GetSrcRegType(aliasedInstruction->srcDst.src0), GetSrcRegIndex(aliasedInstruction->srcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcDst.src0), 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		case _D3DSIO_RSQ:
			// rsq dst, src0, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcDst.dst), GetDestRegType(aliasedInstruction->srcDst.dst), GetDestRegIndex(aliasedInstruction->srcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcDst.src0), GetSrcRegType(aliasedInstruction->srcDst.src0), GetSrcRegIndex(aliasedInstruction->srcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcDst.src0), 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		case _D3DSIO_MIN:
			// min dst, src0, src1
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcSrcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcSrcDst.dst), GetDestRegType(aliasedInstruction->srcSrcDst.dst), GetDestRegIndex(aliasedInstruction->srcSrcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcSrcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src0), GetSrcRegType(aliasedInstruction->srcSrcDst.src0), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src0), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src1), GetSrcRegType(aliasedInstruction->srcSrcDst.src1), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src1) /*src1RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src1) } });
			break;
		case _D3DSIO_MAX:
			// max dst, src0, src1
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcSrcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcSrcDst.dst), GetDestRegType(aliasedInstruction->srcSrcDst.dst), GetDestRegIndex(aliasedInstruction->srcSrcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcSrcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src0), GetSrcRegType(aliasedInstruction->srcSrcDst.src0), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src0), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src1), GetSrcRegType(aliasedInstruction->srcSrcDst.src1), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src1) /*src1RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src1) } });
			break;
		case _D3DSIO_SLT:
			// slt dst, src0, src1
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcSrcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcSrcDst.dst), GetDestRegType(aliasedInstruction->srcSrcDst.dst), GetDestRegIndex(aliasedInstruction->srcSrcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcSrcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src0), GetSrcRegType(aliasedInstruction->srcSrcDst.src0), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src0), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src1), GetSrcRegType(aliasedInstruction->srcSrcDst.src1), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src1) /*src1RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src1) } });
			break;
		case _D3DSIO_SGE:
			// sge dst, src0, src1
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcSrcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcSrcDst.dst), GetDestRegType(aliasedInstruction->srcSrcDst.dst), GetDestRegIndex(aliasedInstruction->srcSrcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcSrcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src0), GetSrcRegType(aliasedInstruction->srcSrcDst.src0), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src0), 
				GetSrcRegModifier(aliasedInstruction->srcSrcDst.src1), GetSrcRegType(aliasedInstruction->srcSrcDst.src1), GetSrcRegIndex(aliasedInstruction->srcSrcDst.src1) /*src1RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcSrcDst.src1) } });
			break;
		case _D3DSIO_EXP:
			// exp dst, src0, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcDst.dst), GetDestRegType(aliasedInstruction->srcDst.dst), GetDestRegIndex(aliasedInstruction->srcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcDst.src0), GetSrcRegType(aliasedInstruction->srcDst.src0), GetSrcRegIndex(aliasedInstruction->srcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcDst.src0), 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		case _D3DSIO_EXPP:
			// expp dst, src0, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcDst.dst), GetDestRegType(aliasedInstruction->srcDst.dst), GetDestRegIndex(aliasedInstruction->srcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcDst.src0), GetSrcRegType(aliasedInstruction->srcDst.src0), GetSrcRegIndex(aliasedInstruction->srcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcDst.src0), 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		case _D3DSIO_LOG:
			// log dst, src0, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcDst.dst), GetDestRegType(aliasedInstruction->srcDst.dst), GetDestRegIndex(aliasedInstruction->srcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcDst.src0), GetSrcRegType(aliasedInstruction->srcDst.src0), GetSrcRegIndex(aliasedInstruction->srcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcDst.src0), 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		case _D3DSIO_LOGP:
			// logp dst, src0, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcDst.dst), GetDestRegType(aliasedInstruction->srcDst.dst), GetDestRegIndex(aliasedInstruction->srcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcDst.src0), GetSrcRegType(aliasedInstruction->srcDst.src0), GetSrcRegIndex(aliasedInstruction->srcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcDst.src0), 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		case _D3DSIO_FRC:
			// frc dst, src0, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcDst.dst), GetDestRegType(aliasedInstruction->srcDst.dst), GetDestRegIndex(aliasedInstruction->srcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcDst.src0), GetSrcRegType(aliasedInstruction->srcDst.src0), GetSrcRegIndex(aliasedInstruction->srcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcDst.src0), 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		case _D3DSIO_SGN:
			// sgn dst, src0, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcDst.dst), GetDestRegType(aliasedInstruction->srcDst.dst), GetDestRegIndex(aliasedInstruction->srcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcDst.src0), GetSrcRegType(aliasedInstruction->srcDst.src0), GetSrcRegIndex(aliasedInstruction->srcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcDst.src0), 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		case _D3DSIO_ABS:
			// mov dst, abs_src0, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcDst.dst), GetDestRegType(aliasedInstruction->srcDst.dst), GetDestRegIndex(aliasedInstruction->srcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcDst.dst), 
				SRMod_Abs, GetSrcRegType(aliasedInstruction->srcDst.src0), GetSrcRegIndex(aliasedInstruction->srcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcDst.src0), 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		case _D3DSIO_MOVA:
			// mova dst, src0, 0.x
			outDeviceInstructionStream.push_back(instructionSlot { {GetInstructionOperation(aliasedInstruction->srcDst.instruction), 
				GetDestRegModifier(aliasedInstruction->srcDst.dst), GetDestRegType(aliasedInstruction->srcDst.dst), GetDestRegIndex(aliasedInstruction->srcDst.dst) /*destRegIndex*/, GetDestRegComponent(aliasedInstruction->srcDst.dst), 
				GetSrcRegModifier(aliasedInstruction->srcDst.src0), GetSrcRegType(aliasedInstruction->srcDst.src0), GetSrcRegIndex(aliasedInstruction->srcDst.src0) /*src0RegIndex*/, GetSrcRegComponent(aliasedInstruction->srcDst.src0), 
				SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} });
			break;
		}
	}
	return result;
}

void AppendVSDivideByW(const unsigned oRegIndex, std::vector<instructionSlot>& inOutDeviceInstructionStream)
{
	// Now the Triangle Setup unit is doing the division by W for us, so we don't need to do this in the vertex shader anymore!
	return;

	const instructionSlot rcpW = { {Op_RCP, DRMod_None, DRTyp_X, 1 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // rcp x1.w, oN.w, 0.x
	inOutDeviceInstructionStream.push_back(rcpW);

	const instructionSlot mulX_rcpW = { {Op_MUL, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_X, 1 /*src1RegIndex*/, Chan_W} }; // mul oN.x, oN.x, x1.w
	const instructionSlot mulY_rcpW = { {Op_MUL, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 1 /*src1RegIndex*/, Chan_W} }; // mul oN.y, oN.y, x1.w
	const instructionSlot mulZ_rcpW = { {Op_MUL, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 1 /*src1RegIndex*/, Chan_W} }; // mul oN.z, oN.z, x1.w
	const instructionSlot movW_rcpW = { {Op_MOV, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_X, 1 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // mov oN.w, x1.w, 0.x
	inOutDeviceInstructionStream.push_back(mulX_rcpW);
	inOutDeviceInstructionStream.push_back(mulY_rcpW);
	inOutDeviceInstructionStream.push_back(mulZ_rcpW);
	inOutDeviceInstructionStream.push_back(movW_rcpW);
}

void AppendVSInterpolantDivideByW(const unsigned oAttributeRegIndex, const unsigned char oAttributeRegDimension, const unsigned char oPosRegIndex, std::vector<instructionSlot>& inOutDeviceInstructionStream)
{
#ifdef _DEBUG
	if (oAttributeRegDimension < 1 || oAttributeRegDimension > 4)
	{
		__debugbreak();
	}
#endif
	// Now the Triangle Setup unit is performing the attribute division by W for us, so we don't need to spend time doing this in the vertex shader!
	return;
	const instructionSlot mulX_rcpW = { {Op_MUL, DRMod_None, DRTyp_O, oAttributeRegIndex /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, oAttributeRegIndex /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_O, oPosRegIndex /*src1RegIndex*/, Chan_W} }; // mul oN.x, oN.x, oPos.w
	const instructionSlot mulY_rcpW = { {Op_MUL, DRMod_None, DRTyp_O, oAttributeRegIndex /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, oAttributeRegIndex /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_O, oPosRegIndex /*src1RegIndex*/, Chan_W} }; // mul oN.y, oN.y, oPos.w
	const instructionSlot mulZ_rcpW = { {Op_MUL, DRMod_None, DRTyp_O, oAttributeRegIndex /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, oAttributeRegIndex /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_O, oPosRegIndex /*src1RegIndex*/, Chan_W} }; // mul oN.z, oN.z, oPos.w
	const instructionSlot mulW_rcpW = { {Op_MUL, DRMod_None, DRTyp_O, oAttributeRegIndex /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_O, oAttributeRegIndex /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_O, oPosRegIndex /*src1RegIndex*/, Chan_W} }; // mul oN.w, oN.w, oPos.w
	if (oAttributeRegDimension >= 1)
		inOutDeviceInstructionStream.push_back(mulX_rcpW);
	if (oAttributeRegDimension >= 2)
		inOutDeviceInstructionStream.push_back(mulY_rcpW);
	if (oAttributeRegDimension >= 3)
		inOutDeviceInstructionStream.push_back(mulZ_rcpW);
	if (oAttributeRegDimension == 4)
		inOutDeviceInstructionStream.push_back(mulW_rcpW);
}

// TODO: Replace this with the existing constantBufferRegisterSpace code
const signed short FindUnusedConstantRegisterIndex(const ShaderInfo& inDXShaderInfo)
{
	unsigned usedConstantsBitmap[GPU_SHADER_MAX_NUM_CONSTANT_FLOAT_REG / 32] = {0};
	const unsigned numUsedConstants = (const unsigned)inDXShaderInfo.usedConstantsF.size();
	for (unsigned x = 0; x < numUsedConstants; ++x)
	{
		const unsigned usedConstRegIndexF = inDXShaderInfo.usedConstantsF[x];
		usedConstantsBitmap[usedConstRegIndexF / 32] |= (1 << (usedConstRegIndexF % 32) );
	}

	// First pass, try to do hole-filling to improve our vertex shader constant register range colalescing:
	for (unsigned x = 1; x < GPU_SHADER_MAX_NUM_CONSTANT_FLOAT_REG - 1; ++x)
	{
		if (!(usedConstantsBitmap[x / 32] & (1 << (x % 32) ) ) )
		{
			if (usedConstantsBitmap[(x - 1) / 32] & (1 << ( (x - 1) % 32) ) )
			{
				if (usedConstantsBitmap[(x + 1) / 32] & (1 << ( (x + 1) % 32) ) )
				{
					return (const signed short)x;
				}
			}
		}
	}

	// Second pass, just try to place it after the last register range:
	for (unsigned x = GPU_SHADER_MAX_NUM_CONSTANT_FLOAT_REG - 1; x > 0; --x)
	{
		if (!(usedConstantsBitmap[x / 32] & (1 << (x % 32) ) ) )
		{
			if ( (usedConstantsBitmap[(x - 1) / 32] & (1 << ( (x - 1) % 32) ) ) )
			{
				return (const signed short)x;
			}
		}
	}

	// Oh no! We can't find any unused constant regs! Bail out and return -1 to indicate failure.
	return -1;
}

void AppendVSViewportTransform(const unsigned cRegIndex, const unsigned oRegIndex, std::vector<instructionSlot>& inOutDeviceInstructionStream, const bool applyZTransform = true)
{
	// Now that the Triangle Setup block is handling viewport transforms for us, we don't need to do this at the end of the vertex shader anymore!
	return;

	const instructionSlot mulX = { {Op_MUL, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, cRegIndex /*src1RegIndex*/, Chan_X} }; // mul oN.x, oN.x, cM.x
	const instructionSlot mulNegY = { {Op_MUL, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Y, SRMod_Neg, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, cRegIndex /*src1RegIndex*/, Chan_Y} }; // mul oN.y, -oN.y, cM.y // Note: This is negative to flip the Y-axis upside-down to the correct screen orientation
	const instructionSlot mulZ = { {Op_MUL, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, cRegIndex /*src1RegIndex*/, Chan_Z} }; // mul oN.z, oN.z, cM.z // Note: This Z scale and offset is optional if the viewport Z scale is 1.0f and the Z offset is 0.0f
	const instructionSlot addX = { {Op_ADD, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, cRegIndex /*src1RegIndex*/, Chan_X} }; // add oN.x, oN.x, cM.x
	const instructionSlot addY = { {Op_ADD, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, cRegIndex /*src1RegIndex*/, Chan_Y} }; // add oN.y, oN.y, cM.y
	const instructionSlot addZ = { {Op_ADD, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, cRegIndex /*src1RegIndex*/, Chan_W} }; // add oN.z, oN.z, cM.w

	inOutDeviceInstructionStream.push_back(mulX);
	inOutDeviceInstructionStream.push_back(mulNegY);

	if (applyZTransform)
		inOutDeviceInstructionStream.push_back(mulZ);

	inOutDeviceInstructionStream.push_back(addX);
	inOutDeviceInstructionStream.push_back(addY);

	if (applyZTransform)
		inOutDeviceInstructionStream.push_back(addZ);
}

// Appends the vertex shader suffixes (if the compile options are specified) for appending division by W and applying the viewport transform to our output vertices
const ShaderCompileResultCode AppendVSSuffix(const ShaderInfo& inDXShaderInfo, std::vector<instructionSlot>& inOutDeviceInstructionStream, const ShaderCompileOptions inCompileOptions, signed short& outViewportConstRegIndex)
{
	const signed short oPosRegIndex = HelperGetOutputRegister(inDXShaderInfo, D3DDECLUSAGE_POSITION, 0);
	if (oPosRegIndex < 0)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR_MissingOutputPos;
	}

	if (inDXShaderInfo.isPixelShader == false && (inCompileOptions & SCOption_VS_AppendDivideByW) )
	{
		//AppendVSDivideByW( (const unsigned)oPosRegIndex, inOutDeviceInstructionStream);

		const signed short oTex0RegIndex = HelperGetOutputRegister(inDXShaderInfo, D3DDECLUSAGE_TEXCOORD, 0);
		if (oTex0RegIndex >= 0)
		{
			const unsigned oTex0RegDimension = 2; // TODO: Don't hardcode this in the future
			//AppendVSInterpolantDivideByW( (const unsigned)oTex0RegIndex, oTex0RegDimension, (const unsigned)oPosRegIndex, inOutDeviceInstructionStream);
		}

		const signed short oD0RegIndex = HelperGetOutputRegister(inDXShaderInfo, D3DDECLUSAGE_COLOR, 0);
		if (oD0RegIndex >= 0)
		{
			const unsigned oD0RegDimension = 4; // TODO: Don't hardcode this in the future
			//AppendVSInterpolantDivideByW(oD0RegIndex, oD0RegDimension, (const unsigned)oPosRegIndex, inOutDeviceInstructionStream);
		}
	}

	if (inDXShaderInfo.isPixelShader == false && (inCompileOptions & SCOption_VS_AppendViewportTransform) )
	{
		// Find an unused constant register index and use that one!
		outViewportConstRegIndex = FindUnusedConstantRegisterIndex(inDXShaderInfo);
		if (outViewportConstRegIndex < 0)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return ShaderCompile_ERR_NeededConstRegNotFound;
		}

		//AppendVSViewportTransform( (const unsigned)outViewportConstRegIndex, (const unsigned)oPosRegIndex, inOutDeviceInstructionStream);
	}
	return ShaderCompile_OK;
}

void AppendVSPositionInvZ(const unsigned oRegIndex, std::vector<instructionSlot>& inOutDeviceInstructionStream)
{
#ifdef _DEBUG
	if (oRegIndex >= GPU_SHADER_MAX_NUM_OUTPUT_REG)
	{
		__debugbreak();
	}
#endif
	// Now the Triangle Setup unit is performing reciprocal-Z for us so we don't need to do it here in the vertex shader
	return;

	const instructionSlot invZ = { {Op_RCP, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // rcp oPos.z, oPos.z, 0.x
	inOutDeviceInstructionStream.push_back(invZ);
}

void AppendVSEndInstruction(std::vector<instructionSlot>& inOutDeviceInstructionStream)
{
	const instructionSlot endingNop = { {Op_NOP, DRMod_None, DRTyp_NULL, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // nop 0.x, 0.x, 0.x
	const instructionSlot endingENDToken = { {Op_END, DRMod_None, DRTyp_NULL, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // end

	// nops before the end to ensure we're done writing all regs by the time the shader finishes
	inOutDeviceInstructionStream.push_back(endingNop);
	inOutDeviceInstructionStream.push_back(endingNop);

	// This must always be the last token in the shader's instruction stream. It tells the vertex shader to stop running and to transition the shader core to exporting
	// vertex data to the output data FIFO's to be sent out for primitive assembly and rasterization.
	inOutDeviceInstructionStream.push_back(endingENDToken);
}

ShaderCompileResultCode GenerateConstBufferWriteAllRegFileShader(const ShaderInfo& inDXShaderInfo, std::vector<instructionSlot>& outDeviceInstructionStream, DeviceShaderInfo& outDeviceShaderInfo)
{
	for (unsigned x = 0; x < 8; ++x)
	{
		const instructionSlot o0x = { {Op_MOV, DRMod_None, DRTyp_O, x /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_C, 3 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o0.x, c3.x, 0.x
		const instructionSlot o0y = { {Op_MOV, DRMod_None, DRTyp_O, x /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 3 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o0.y, c3.y, 0.x
		const instructionSlot o0z = { {Op_MOV, DRMod_None, DRTyp_O, x /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 3 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o0.z, c3.z, 0.x
		const instructionSlot o0w = { {Op_MOV, DRMod_None, DRTyp_O, x /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_C, 3 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o0.w, c3.w, 0.x
		outDeviceInstructionStream.push_back(o0x);
		outDeviceInstructionStream.push_back(o0y);
		outDeviceInstructionStream.push_back(o0z);
		outDeviceInstructionStream.push_back(o0w);
	}
	for (unsigned x = 0; x < 8; ++x)
	{
		const instructionSlot r0x = { {Op_MOV, DRMod_None, DRTyp_R, x /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_C, 4 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov r0.x, c4.x, 0.x
		const instructionSlot r0y = { {Op_MOV, DRMod_None, DRTyp_R, x /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 4 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov r0.y, c4.y, 0.x
		const instructionSlot r0z = { {Op_MOV, DRMod_None, DRTyp_R, x /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 4 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov r0.z, c4.z, 0.x
		const instructionSlot r0w = { {Op_MOV, DRMod_None, DRTyp_R, x /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_C, 4 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov r0.w, c4.w, 0.x
		outDeviceInstructionStream.push_back(r0x);
		outDeviceInstructionStream.push_back(r0y);
		outDeviceInstructionStream.push_back(r0z);
		outDeviceInstructionStream.push_back(r0w);
	}
	for (unsigned x = 0; x < 8; ++x)
	{
		const instructionSlot x0x = { {Op_MOV, DRMod_None, DRTyp_X, x /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_C, 5 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov x0.x, c5.x, 0.x
		const instructionSlot x0y = { {Op_MOV, DRMod_None, DRTyp_X, x /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 5 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov x0.y, c5.y, 0.x
		const instructionSlot x0z = { {Op_MOV, DRMod_None, DRTyp_X, x /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 5 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov x0.z, c5.z, 0.x
		const instructionSlot x0w = { {Op_MOV, DRMod_None, DRTyp_X, x /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_C, 5 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov x0.w, c5.w, 0.x
		outDeviceInstructionStream.push_back(x0x);
		outDeviceInstructionStream.push_back(x0y);
		outDeviceInstructionStream.push_back(x0z);
		outDeviceInstructionStream.push_back(x0w);
	}

	return ShaderCompile_OK;
}

ShaderCompileResultCode GenerateTestWritebackShader(const ShaderInfo& inDXShaderInfo, std::vector<instructionSlot>& outDeviceInstructionStream, DeviceShaderInfo& outDeviceShaderInfo)
{
	const instructionSlot r1z = { {Op_MOV, DRMod_None, DRTyp_R, 1 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 3 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov r1.z, c3.x, 0.x
	const instructionSlot o1x = { {Op_MOV, DRMod_None, DRTyp_O, 1 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_R, 1 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.x, r1.z, 0.x
	const instructionSlot r1z2 = { {Op_MOV, DRMod_None, DRTyp_R, 1 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 3 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov r1.z, c3.y, 0.x
	const instructionSlot r1z3 = { {Op_MOV, DRMod_None, DRTyp_R, 1 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 3 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov r1.z, c3.z, 0.x

	outDeviceInstructionStream.push_back(r1z);
	outDeviceInstructionStream.push_back(o1x);
	outDeviceInstructionStream.push_back(r1z2);
	outDeviceInstructionStream.push_back(r1z3);
	return ShaderCompile_OK;
}

ShaderCompileResultCode GenerateSpecialShader(const ShaderInfo& inDXShaderInfo, std::vector<instructionSlot>& outDeviceInstructionStream, DeviceShaderInfo& outDeviceShaderInfo)
{
	return GenerateConstBufferWriteAllRegFileShader(inDXShaderInfo, outDeviceInstructionStream, outDeviceShaderInfo);
}

// Used for D3DFVF_XYZRHW FVF's or POSITIONT vertex decl's. Untransforms the pretransformed vertex position back into clip-space and copies the interpolants over to their output registers.
// This generated shader assumes that:
// c0.xy = Negation of viewport X,Y offsets
// c0.z = Negation of viewport Z offset
// c1.xy = Reciprocal of viewport X,Y scales
// c1.z = Reciprocal of viewport Z scale
ShaderCompileResultCode MakePretransformedPassthroughShader(std::vector<instructionSlot>& outDeviceInstructionStream, DeviceShaderInfo& outDeviceShaderInfo, const bool vertexColorPresent = true, const bool texcoord0Present = true)
{
	// This generated shader looks like this:
	// x0.xyz = add v0.xyz, c0.xyz // Subtract the viewport X offset, Y offset, and Z offset ({0.5f - viewPortWidth/2.0f + viewport.left, 0.5f - viewportHeight/2.0f + viewport.top, -viewport.minZ})
	// x1.xyz = mul x0.xyz, c1.xyz // Divide out the viewport X scale, Y scale, and Z scale (constant buffer already contains reciprocals of the scales) ({2.0f/viewportWidth, -2.0f/viewportHeight, 1.0f/viewport.zScale})
	// x0.w = rcp v0.w // Convert from reciprocal of W back to regular pixel W
	// o0.xyz = mul x1.xyz, x0.w // Undo the division-by-W step to unproject our vertices back into clip-space
	// o0.w = mov x0.w // Copy over the pixel W component (this is needed for the later TriangleSetup stage to redo our division-by-W again after clipping is done)
	// o1 = oD0 = mov oD0, v1.rgba
	// o2 = oT0 = mov oT0, v2.xy00

	// For now, these input and output registers are always hardcoded:
	const unsigned inputPositionReg = 0; // v0 = POSITION0
	const unsigned inputDiffuseReg = 1; // v1 = COLOR0
	const unsigned inputTexcoordReg = 2; // v2 = TEXCOORD0

	const unsigned outputPositionReg = 0; // o0 = oPos = OPOSITION0
	const unsigned outputDiffuseReg = 1; // o1 = oD0 = OCOLOR0
	const unsigned outputTexcoordReg = 2; // o2 = oT0 = OTEXCOORD0

	if (inputPositionReg >= GPU_SHADER_MAX_NUM_INPUT_REG)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR_MissingInputPos;
	}

	if (outputPositionReg >= GPU_SHADER_MAX_NUM_OUTPUT_REG)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR_MissingOutputPos;
	}

	const bool hasVertexColor = vertexColorPresent && outputDiffuseReg < GPU_SHADER_MAX_NUM_OUTPUT_REG && inputDiffuseReg < GPU_SHADER_MAX_NUM_INPUT_REG;
	const bool hasTexcoord = texcoord0Present && outputTexcoordReg < GPU_SHADER_MAX_NUM_OUTPUT_REG && inputTexcoordReg < GPU_SHADER_MAX_NUM_INPUT_REG;

	outDeviceShaderInfo.inputRegisters.pos0 = inputPositionReg;
	outDeviceShaderInfo.inputRegisters.color0 = inputDiffuseReg;
	outDeviceShaderInfo.inputRegisters.texcoord[0] = inputTexcoordReg;
	outDeviceShaderInfo.outputRegisters.oPosRegIndex = outputPositionReg;
	outDeviceShaderInfo.outputRegisters.oDiffuseRegIndex = outputDiffuseReg;
	outDeviceShaderInfo.outputRegisters.oTexRegIndex[0] = outputTexcoordReg;

	if (outputPositionReg != 0)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: oPos is currently needed to always be o0 because the post export shadercode depends on it!
#endif
		return ShaderCompile_ERR_InvalidArg;
	}
	if (outputDiffuseReg != 1)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: oD is currently needed to always be o1 because the post export shadercode depends on it!
#endif
		return ShaderCompile_ERR_InvalidArg;
	}
	if (outputTexcoordReg != 2)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: oT0 is currently needed to always be o2 because the post export shadercode depends on it!
#endif
		return ShaderCompile_ERR_InvalidArg;
	}

	// x0.xyz = add v0.xyz, c0.xyz // Subtract the viewport X offset, Y offset, and Z offset
	const instructionSlot addx0X = { {Op_ADD, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 0 /*src0RegIndex*/, Chan_X} }; // add x0.x, v0.x, c0.x
	const instructionSlot addx0Y = { {Op_ADD, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 0 /*src0RegIndex*/, Chan_Y} }; // add x0.y, v0.y, c0.y
	const instructionSlot addx0Z = { {Op_ADD, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 0 /*src0RegIndex*/, Chan_Z} }; // add x0.z, v0.z, c0.z
	outDeviceInstructionStream.push_back(addx0X);
	outDeviceInstructionStream.push_back(addx0Y);
	outDeviceInstructionStream.push_back(addx0Z);

	// x1.xyz = mul x0.xyz, c1.xyz // Divide out the viewport X scale, Y scale, and Z scale (constant buffer already contains reciprocals of the scales)
	const instructionSlot mulx1X = { {Op_MUL, DRMod_None, DRTyp_X, 1 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, 1 /*src0RegIndex*/, Chan_X} }; // mul x1.x, x0.x, c1.x
	const instructionSlot mulx1Y = { {Op_MUL, DRMod_None, DRTyp_X, 1 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, 1 /*src0RegIndex*/, Chan_Y} }; // mul x1.y, x0.y, c1.y
	const instructionSlot mulx1Z = { {Op_MUL, DRMod_None, DRTyp_X, 1 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, 1 /*src0RegIndex*/, Chan_Z} }; // mul x1.z, x0.z, c1.z
	outDeviceInstructionStream.push_back(mulx1X);
	outDeviceInstructionStream.push_back(mulx1Y);
	outDeviceInstructionStream.push_back(mulx1Z);

	// x0.w = rcp v0.w // Convert from reciprocal of W back to regular pixel W
	const instructionSlot rcpx0W = { {Op_RCP, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_V, 0 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // rcp x0.w, v0.w, 00.x
	outDeviceInstructionStream.push_back(rcpx0W);

	// o0.xyz = mul x1.xyz, x0.w // Undo the division-by-W step to unproject our vertices back into clip-space
	const instructionSlot mulo0X = { {Op_MUL, DRMod_None, DRTyp_O, outputPositionReg /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_X, 1 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_W} }; // mul o0.x, x1.x, x0.w
	const instructionSlot mulo0Y = { {Op_MUL, DRMod_None, DRTyp_O, outputPositionReg /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 1 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_W} }; // mul o0.y, x1.y, x0.w
	const instructionSlot mulo0Z = { {Op_MUL, DRMod_None, DRTyp_O, outputPositionReg /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 1 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_W} }; // mul o0.z, x1.z, x0.w
	outDeviceInstructionStream.push_back(mulo0X);
	outDeviceInstructionStream.push_back(mulo0Y);
	outDeviceInstructionStream.push_back(mulo0Z);

	// o0.w = mov x0.w // Copy over the pixel W component (this is needed for the later TriangleSetup stage to redo our division-by-W again after clipping is done)
	const instructionSlot movo0W = { {Op_MOV, DRMod_None, DRTyp_O, outputPositionReg /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o0.w, x0.w, 00.x
	outDeviceInstructionStream.push_back(movo0W);

	if (hasVertexColor)
	{
		// mov oD0, v1:
		const instructionSlot movD0R = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, inputDiffuseReg /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.x, v1.x, 0.x
		const instructionSlot movD0G = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, inputDiffuseReg /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.y, v1.y, 0.x
		const instructionSlot movD0B = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, inputDiffuseReg /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.z, v1.z, 0.x
		const instructionSlot movD0A = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_V, inputDiffuseReg /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.w, v1.w, 0.x
		outDeviceInstructionStream.push_back(movD0R);
		outDeviceInstructionStream.push_back(movD0G);
		outDeviceInstructionStream.push_back(movD0B);
		outDeviceInstructionStream.push_back(movD0A);
	}
	else
	{
		// mov oD0, 1.xxxx:
		const instructionSlot movD0R = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_1, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.x, 1.x, 0.x
		const instructionSlot movD0G = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_1, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.y, 1.x, 0.x
		const instructionSlot movD0B = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_1, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.z, 1.x, 0.x
		const instructionSlot movD0A = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_1, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.w, 1.x, 0.x
		outDeviceInstructionStream.push_back(movD0R);
		outDeviceInstructionStream.push_back(movD0G);
		outDeviceInstructionStream.push_back(movD0B);
		outDeviceInstructionStream.push_back(movD0A);
	}

	if (hasTexcoord)
	{
		// mov oT0.xy, v2.xy:
		const instructionSlot movT0X = { {Op_MOV, DRMod_None, DRTyp_O, outputTexcoordReg /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, inputTexcoordReg /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o2.x, v2.x, 0.x
		const instructionSlot movT0Y = { {Op_MOV, DRMod_None, DRTyp_O, outputTexcoordReg /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, inputTexcoordReg /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o2.y, v2.y, 0.x
		outDeviceInstructionStream.push_back(movT0X);
		outDeviceInstructionStream.push_back(movT0Y);
	}
	else	
	{
		// mov oT0.xy, 0.xxxx:
		const instructionSlot movT0X = { {Op_MOV, DRMod_None, DRTyp_O, outputTexcoordReg /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o2.x, 0.x, 0.x
		const instructionSlot movT0Y = { {Op_MOV, DRMod_None, DRTyp_O, outputTexcoordReg /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o2.y, 0.x, 0.x
		outDeviceInstructionStream.push_back(movT0X);
		outDeviceInstructionStream.push_back(movT0Y);
	}

	return ShaderCompile_OK;
}

void DumpDeviceBytecodeToFile(const DeviceBytecode& inDeviceBytecode, const char* const inBaseFilename, const ShaderOutputType inDumpType)
{
	if (inDumpType >= ShaderOutputType_NUM)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}

	EnsureOutputDirectoryExists();

	char deviceBytecodeFilename[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(deviceBytecodeFilename, SHADER_OUTPUT_DIRECTORY "\\" "%s_%u_%sBytecode.bin", inBaseFilename, inDumpType, ShaderOutputTypeFilenames[inDumpType]);
	FILE* const dumpDeviceBytecodeFile = fopen(deviceBytecodeFilename, "wb");
#pragma warning(pop)
	if (dumpDeviceBytecodeFile)
	{
		fwrite(&(inDeviceBytecode), sizeof(inDeviceBytecode), 1, dumpDeviceBytecodeFile);
		if (inDeviceBytecode.deviceShaderInfo.deviceInstructionTokenCount > 1)
		{
			fwrite(&(inDeviceBytecode.deviceInstructions) + 1, sizeof(instructionSlot), inDeviceBytecode.deviceShaderInfo.deviceInstructionTokenCount - 1, dumpDeviceBytecodeFile);
		}
		fclose(dumpDeviceBytecodeFile);
	}
	else
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot open file for writing!
#endif
	}

	char deviceDisasmFilename[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(deviceDisasmFilename, SHADER_OUTPUT_DIRECTORY "\\" "%s_%u_%sDisasm.asm", inBaseFilename, inDumpType, ShaderOutputTypeFilenames[inDumpType]);
	FILE* const dumpDeviceDisasmFile = fopen(deviceDisasmFilename, "wb");
#pragma warning(pop)
	if (dumpDeviceDisasmFile)
	{
		DisasmDeviceBytecodeToFile(&inDeviceBytecode, dumpDeviceDisasmFile);
		fclose(dumpDeviceDisasmFile);
	}
	else
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot open file for writing!
#endif
	}
}

void DumpDeviceBytecodeToFile(const DeviceShaderInfo& inProgressShaderInfo, const instructionSlot* const inProgressInstructionStream, const unsigned numInstructionTokens, const char* const inBaseFilename, const ShaderOutputType inDumpType)
{
	if (!inProgressInstructionStream)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}
	if (numInstructionTokens < 1)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}
	if (inDumpType >= ShaderOutputType_NUM)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}

	DeviceBytecode* const tempAlloc = (DeviceBytecode* const)calloc(sizeof(DeviceBytecode) + sizeof(instructionSlot) * numInstructionTokens, 1);
#ifdef _DEBUG
	if (!tempAlloc)
	{
		__debugbreak(); // Out of memory!
	}
#endif
	memcpy(&tempAlloc->deviceShaderInfo, &inProgressShaderInfo, sizeof(DeviceShaderInfo) );
	tempAlloc->deviceShaderInfo.deviceInstructionTokenCount = numInstructionTokens;
	memcpy(&tempAlloc->deviceInstructions, inProgressInstructionStream, numInstructionTokens * sizeof(instructionSlot) );
	DumpDeviceBytecodeToFile(*tempAlloc, inBaseFilename, inDumpType);
	free(tempAlloc);
}

void OutputDXShaderDisasm(const DWORD* const inDXBytecodeDWORDs, const unsigned inDWORDCount, const char* const inOptShaderBaseFilename, const ShaderOutputType inShaderOutType)
{
	if (inShaderOutType >= ShaderOutputType_NUM)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}

	EnsureOutputDirectoryExists();

	char decomposedBytecodeFilename[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(decomposedBytecodeFilename, SHADER_OUTPUT_DIRECTORY "\\" "%s_%u_%sBytecode.cso", inOptShaderBaseFilename, inShaderOutType, ShaderOutputTypeFilenames[inShaderOutType]);
	FILE* const dumpDecomposedBytecodeFile = fopen(decomposedBytecodeFilename, "wb");
#pragma warning(pop)
	if (dumpDecomposedBytecodeFile)
	{
		fwrite(inDXBytecodeDWORDs, inDWORDCount, sizeof(DWORD), dumpDecomposedBytecodeFile);
		fclose(dumpDecomposedBytecodeFile);
	}
	else
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot open file for writing!
#endif
	}

	char decomposedDisasmFilename[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(decomposedDisasmFilename, SHADER_OUTPUT_DIRECTORY "\\" "%s_%u_%sDisasm.asm", inOptShaderBaseFilename, inShaderOutType, ShaderOutputTypeFilenames[inShaderOutType]);
	FILE* const dumpDecomposedDisasmFile = fopen(decomposedDisasmFilename, "wb");
#pragma warning(pop)
	if (dumpDecomposedDisasmFile)
	{
		ID3DXBuffer* disasmBuffer = NULL;
		const BOOL enableColorCodes = FALSE;
		const HRESULT hrDisasm = D3DXDisassembleShader(inDXBytecodeDWORDs, enableColorCodes, NULL, &disasmBuffer);
		if (FAILED(hrDisasm) || !disasmBuffer || disasmBuffer->GetBufferSize() == 0 || disasmBuffer->GetBufferPointer() == NULL)
		{
#ifdef _DEBUG
			__debugbreak(); // Error disassembling shader!
#endif
		}
		else
		{
			fwrite(disasmBuffer->GetBufferPointer(), disasmBuffer->GetBufferSize(), sizeof(char), dumpDecomposedDisasmFile);
		}
		fclose(dumpDecomposedDisasmFile);

		if (disasmBuffer != NULL)
		{
			disasmBuffer->Release();
			disasmBuffer = NULL;
		}
	}
	else
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot open file for writing!
#endif
	}
}

void OutputDXShaderDisasm(const std::vector<anyToken>& inDXDecomposedInstructionStream, const char* const inOptShaderBaseFilename, const ShaderOutputType inShaderOutType)
{
	if (inDXDecomposedInstructionStream.empty() )
	{
#ifdef _DEBUG
		__debugbreak(); // Empty instruction streams cannot be output to a file!
#endif
	}
	else
	{
		return OutputDXShaderDisasm( (const DWORD* const)&inDXDecomposedInstructionStream.front(), (const unsigned)inDXDecomposedInstructionStream.size(), inOptShaderBaseFilename, inShaderOutType);
	}
}

// TODO: Perform D3D bytecode-level optimizations here
const ShaderCompileResultCode PerformD3DOptimizations(const ShaderInfo& inDXShaderInfo, std::vector<const instructionToken*>& inOutInstructionStartPtrs, std::vector<anyToken> inOutInstructionStream)
{
	// Useful D3D-level bytecode optimizations might include:
	// Sequence deduplication (don't repeat the same computation)
	// Dependency tracking and dead code elimination
	// Etc.

	return ShaderCompile_OK;
}

// TODO: Perform device-specific optimizations here
const ShaderCompileResultCode PerformDeviceOptimizations(std::vector<instructionSlot>& inOutDeviceInstructionStream)
{
	// Useful hardware bytecode-level optimizations might include:
	// Strength reduction from MUL constant power of 2 to SHFT
	// Constant buffer replacement with literals 0.0f/1.0f
	// Instruction reordering to reduce wait cycles
	// Etc.

	return ShaderCompile_OK;
}

static void CountUsedDestRegs(const InstructionDestRegType regType, const unsigned char regIndex, unsigned& rRegBitmask, unsigned& xRegBitmask, unsigned& oRegBitmask)
{
#ifdef _DEBUG
	if (regIndex > 31)
	{
		__debugbreak(); // Error: Out of bounds register index!
	}
#endif
	switch (regType)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Error: Unknown register type!
#endif
	case DRTyp_NULL:
		break;
	case DRTyp_R:
		rRegBitmask |= (1 << regIndex);
		break;
	case DRTyp_X:
		xRegBitmask |= (1 << regIndex);
		break;
	case DRTyp_O:
		oRegBitmask |= (1 << regIndex);
		break;
	}
}

static void CountUsedSourceRegs(const InstructionSrcRegType regType, const unsigned char regIndex, unsigned (&cRegBitmask)[256/32], unsigned& vRegBitmask, unsigned& rRegBitmask, unsigned& xRegBitmask, unsigned& oRegBitmask)
{
#ifdef _DEBUG
	if (regType == SRTyp_C)
	{
	}
	else
	{
		if (regIndex > 31)
		{
			__debugbreak(); // Error: Out of bounds register index!
		}
	}
#endif
	switch (regType)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Error: Unknown register type!
#endif
	case SRTyp_0:
	case SRTyp_1:
	case SRTyp_N1:
		break;
	
	case SRTyp_R:
		rRegBitmask |= (1 << regIndex);
		break;
	case SRTyp_V:
		vRegBitmask |= (1 << regIndex);
		break;
	case SRTyp_C:
		cRegBitmask[regIndex/32] |= (1 << (regIndex % 32) );
		break;
	case SRTyp_X:
		xRegBitmask |= (1 << regIndex);
		break;
	case SRTyp_O:
		oRegBitmask |= (1 << regIndex);
		break;
	}
}

// TODO: Calculate device-specific shader stats here
void CalculateDeviceShaderStats(const std::vector<instructionSlot>& inFinalDeviceInstructionStream, DeviceShaderInfo& outDeviceShaderInfo, const signed short vsViewportTransformConstRegisterF)
{
	// Useful device-specific shader stats might include:
	// Number/percent of total of each type of register used (c#, v#, r#, x#, o#)
	// Total instruction count / percent of maximum instruction cache size
	// Total number of cycles to execute the whole shader
	// Number of cycles wasted due to waits/stalls
	// Etc.

	unsigned cRegBitmask[256/32] = {0};
	unsigned vRegBitmask = 0;
	unsigned rRegBitmask = 0;
	unsigned xRegBitmask = 0;
	unsigned oRegBitmask = 0;

	outDeviceShaderInfo.deviceInstructionTokenCount = (const unsigned short)inFinalDeviceInstructionStream.size();
	for (unsigned x = 0; x < inFinalDeviceInstructionStream.size(); ++x)
	{
		const instructionSlot& thisInstruction = inFinalDeviceInstructionStream[x];
		CountUsedDestRegs(thisInstruction.instructionStruct.destReg_regType, thisInstruction.instructionStruct.destReg_regIndex, rRegBitmask, xRegBitmask, oRegBitmask);
		CountUsedSourceRegs(thisInstruction.instructionStruct.srcRegA_regType, thisInstruction.instructionStruct.srcRegA_regIndex, cRegBitmask, vRegBitmask, rRegBitmask, xRegBitmask, oRegBitmask);
		CountUsedSourceRegs(thisInstruction.instructionStruct.srcRegB_regType, thisInstruction.instructionStruct.srcRegB_regIndex, cRegBitmask, vRegBitmask, rRegBitmask, xRegBitmask, oRegBitmask);
	}

	outDeviceShaderInfo.inputRegisterCount = __popcnt16(vRegBitmask);
	outDeviceShaderInfo.tempRegisterCount = __popcnt16(rRegBitmask);
	outDeviceShaderInfo.specialRegisterCount = __popcnt16(xRegBitmask);
	outDeviceShaderInfo.outputRegisterCount = __popcnt16(oRegBitmask);
	outDeviceShaderInfo.constRegisterCount = 0;
	for (unsigned x = 0; x < 256 / 32; ++x)
	{
		outDeviceShaderInfo.constRegisterCount += __popcnt16(cRegBitmask[x]);
	}

	outDeviceShaderInfo.deviceExecutionCycleCount = 0;
	outDeviceShaderInfo.deviceCyclesWastedToWaits = 0;
	outDeviceShaderInfo.vsViewportTransformConstRegisterF = vsViewportTransformConstRegisterF;
}

void PopulateRegisterMapping(const ShaderInfo& inDXShaderInfo, DeviceShaderInfo& outDeviceShaderInfo, DeviceShaderHeader& outDeviceShaderHeader)
{
	for (unsigned x = 0; x < inDXShaderInfo.declaredRegisters.size(); ++x)
	{
		const DeclaredRegister& thisDeclaredReg = inDXShaderInfo.declaredRegisters[x];
#ifdef _DEBUG
		if (thisDeclaredReg.registerIndex > 32)
		{ 
			__debugbreak(); // Error: Decl register index is out of range!
		}
#endif

		if (thisDeclaredReg.isOutputRegister == false)
		{
			if (thisDeclaredReg.registerIndex < ARRAYSIZE(outDeviceShaderHeader.inputRegsData) )
			{
				outDeviceShaderHeader.inputRegsData[thisDeclaredReg.registerIndex].usageType = ConvertToDeviceDeclUsage(thisDeclaredReg.usageType);
				outDeviceShaderHeader.inputRegsData[thisDeclaredReg.registerIndex].usageIndex = thisDeclaredReg.usageIndex;
			}
			switch (thisDeclaredReg.usageType)
			{
			case D3DDECLUSAGE_POSITION:
				outDeviceShaderInfo.inputRegisters.pos0 = thisDeclaredReg.registerIndex;
				break;
			case D3DDECLUSAGE_BLENDWEIGHT:
				outDeviceShaderInfo.inputRegisters.blendweight0 = thisDeclaredReg.registerIndex;
				break;
			case D3DDECLUSAGE_BLENDINDICES:
				outDeviceShaderInfo.inputRegisters.blendindices0 = thisDeclaredReg.registerIndex;
				break;
			case D3DDECLUSAGE_NORMAL:
				outDeviceShaderInfo.inputRegisters.normal0 = thisDeclaredReg.registerIndex;
				break;
			case D3DDECLUSAGE_TEXCOORD:
#ifdef _DEBUG
				if (thisDeclaredReg.usageIndex >= 8)
				{
					__debugbreak(); // Usage index out of range!
				}
#endif
				outDeviceShaderInfo.inputRegisters.texcoord[thisDeclaredReg.usageIndex] = thisDeclaredReg.registerIndex;
				break;
			case D3DDECLUSAGE_TANGENT:
				outDeviceShaderInfo.inputRegisters.tangent0 = thisDeclaredReg.registerIndex;
				break;
			case D3DDECLUSAGE_BINORMAL:
				outDeviceShaderInfo.inputRegisters.binormal0 = thisDeclaredReg.registerIndex;
				break;
			case D3DDECLUSAGE_COLOR:
				if (thisDeclaredReg.usageIndex > 0)
					outDeviceShaderInfo.inputRegisters.color1 = thisDeclaredReg.registerIndex;
				else
					outDeviceShaderInfo.inputRegisters.color0 = thisDeclaredReg.registerIndex;
				break;
			}
		}
		else
		{
			outDeviceShaderHeader.outputRegsData[thisDeclaredReg.registerIndex].usageType = ConvertToDeviceDeclUsage(thisDeclaredReg.usageType);
			outDeviceShaderHeader.outputRegsData[thisDeclaredReg.registerIndex].usageIndex = thisDeclaredReg.usageIndex;
		}
	}

	const signed short oPosRegIndex = HelperGetOutputRegister(inDXShaderInfo, D3DDECLUSAGE_POSITION, 0);
	if (oPosRegIndex < 0)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
	}
	outDeviceShaderInfo.outputRegisters.oPosRegIndex = (const unsigned char)oPosRegIndex;
	outDeviceShaderInfo.outputRegisters.oDiffuseRegIndex = (const signed char)HelperGetOutputRegister(inDXShaderInfo, D3DDECLUSAGE_COLOR, 0);
	outDeviceShaderInfo.outputRegisters.oSpecularRegIndex = (const signed char)HelperGetOutputRegister(inDXShaderInfo, D3DDECLUSAGE_COLOR, 1);
	for (unsigned texCoordIndex = 0; texCoordIndex < 8; ++texCoordIndex)
	{
		outDeviceShaderInfo.outputRegisters.oTexRegIndex[texCoordIndex] = (const signed char)HelperGetOutputRegister(inDXShaderInfo, D3DDECLUSAGE_TEXCOORD, texCoordIndex);
	}
}

const int GetFreeBackupIndexSlot(const char (&backedUpOutputRegIndices)[GPU_SHADER_MAX_NUM_SPECIAL_REG])
{
	for (int x = 0; x < GPU_SHADER_MAX_NUM_SPECIAL_REG; ++x)
	{
		if (backedUpOutputRegIndices[x] < 0)
			return x;
	}
#ifdef _DEBUG
	__debugbreak(); // This is bad, we can't find a slot to back up our register data into!
#endif
	return -1;
}

const int GetAlreadyMovedBackupIndexSlot(const char (&backedUpOutputRegIndices)[GPU_SHADER_MAX_NUM_SPECIAL_REG], const unsigned char searchSlot)
{
	for (int x = 0; x < GPU_SHADER_MAX_NUM_SPECIAL_REG; ++x)
	{
		if (backedUpOutputRegIndices[x] == searchSlot)
			return x;
	}
	return -1;
}

struct MandatoryRegisterOutput
{
	D3DDECLUSAGE usageType;
	unsigned char usageIndex;
	unsigned char mandatoryOutputRegisterIndex;
	unsigned char registerDimension;
};
static const MandatoryRegisterOutput mandatoryRegisterOutputs[] =
{
	{ D3DDECLUSAGE_POSITION, 0, 0, 4 }, // oPos must be in o0
	{ D3DDECLUSAGE_COLOR, 0, 1, 4 }, // oD0 must be in o1
	{ D3DDECLUSAGE_TEXCOORD, 0, 2, 2 } // oT0 must be in o2
};

// Shuffle VS output registers so that they match the expected output registers (o0 = oPos, o1 = oD0, o2 = oT0):
// TODO: Replace this with some sort of output mapping that is visible to the shader core so that it can handle this shuffling for us
void ShuffleVSOutputRegisters(const ShaderInfo& inDXShaderInfo, std::vector<instructionSlot>& inOutDeviceInstructionStream)
{
	char backedUpOutputRegIndices[GPU_SHADER_MAX_NUM_SPECIAL_REG] = { -1, -1, -1, -1, -1, -1, -1, -1 };
	for (unsigned x = 0; x < ARRAYSIZE(mandatoryRegisterOutputs); ++x)
	{
		const MandatoryRegisterOutput& thisMandatoryOutput = mandatoryRegisterOutputs[x];
		const signed short currentRegisterIndex = HelperGetOutputRegister(inDXShaderInfo, thisMandatoryOutput.usageType, thisMandatoryOutput.usageIndex);
		if (currentRegisterIndex < 0) // Skip output registers that we can't locate, it's fine if they're not present since their results presumably won't get used by the pixel shader
			continue;

		if (currentRegisterIndex == thisMandatoryOutput.mandatoryOutputRegisterIndex) // This register is already using the correct output register index, we don't have to do anything in this case
			continue;

		int moveSourceSlot = GetAlreadyMovedBackupIndexSlot(backedUpOutputRegIndices, (const unsigned char)currentRegisterIndex);
		InstructionSrcRegType moveSourceRegType = SRTyp_X;
		if (moveSourceSlot < 0)
		{
			const int backupSlot = GetFreeBackupIndexSlot(backedUpOutputRegIndices);
			backedUpOutputRegIndices[backupSlot] = thisMandatoryOutput.mandatoryOutputRegisterIndex;
			moveSourceSlot = currentRegisterIndex;
			moveSourceRegType = SRTyp_O;

			// Perform our backup of this slot from oN to xN:
			const instructionSlot mov_onx_to_xn_x = { {Op_MOV, DRMod_None, DRTyp_X, (const unsigned)backupSlot /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, thisMandatoryOutput.mandatoryOutputRegisterIndex /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // mov xn.x, on.x, 0.x
			const instructionSlot mov_onx_to_xn_y = { {Op_MOV, DRMod_None, DRTyp_X, (const unsigned)backupSlot /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, thisMandatoryOutput.mandatoryOutputRegisterIndex /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // mov xn.y, on.y, 0.x
			const instructionSlot mov_onx_to_xn_z = { {Op_MOV, DRMod_None, DRTyp_X, (const unsigned)backupSlot /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, thisMandatoryOutput.mandatoryOutputRegisterIndex /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // mov xn.z, on.z, 0.x
			const instructionSlot mov_onx_to_xn_w = { {Op_MOV, DRMod_None, DRTyp_X, (const unsigned)backupSlot /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_O, thisMandatoryOutput.mandatoryOutputRegisterIndex /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // mov xn.w, on.w, 0.x
			inOutDeviceInstructionStream.push_back(mov_onx_to_xn_x);
			inOutDeviceInstructionStream.push_back(mov_onx_to_xn_y);
			inOutDeviceInstructionStream.push_back(mov_onx_to_xn_z);
			inOutDeviceInstructionStream.push_back(mov_onx_to_xn_w);
		}

		// Move from our backed-up temporary register into our correct output register:
		const instructionSlot mov_xn_to_onx_x = { {Op_MOV, DRMod_None, DRTyp_O, thisMandatoryOutput.mandatoryOutputRegisterIndex /*destRegIndex*/, Chan_X, SRMod_None, moveSourceRegType, (const unsigned)moveSourceSlot /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // mov on.x, xn.x, 0.x
		const instructionSlot mov_xn_to_onx_y = { {Op_MOV, DRMod_None, DRTyp_O, thisMandatoryOutput.mandatoryOutputRegisterIndex /*destRegIndex*/, Chan_Y, SRMod_None, moveSourceRegType, (const unsigned)moveSourceSlot /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // mov on.y, xn.y, 0.x
		const instructionSlot mov_xn_to_onx_z = { {Op_MOV, DRMod_None, DRTyp_O, thisMandatoryOutput.mandatoryOutputRegisterIndex /*destRegIndex*/, Chan_Z, SRMod_None, moveSourceRegType, (const unsigned)moveSourceSlot /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // mov on.z, xn.z, 0.x
		const instructionSlot mov_xn_to_onx_w = { {Op_MOV, DRMod_None, DRTyp_O, thisMandatoryOutput.mandatoryOutputRegisterIndex /*destRegIndex*/, Chan_W, SRMod_None, moveSourceRegType, (const unsigned)moveSourceSlot /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // mov on.w, xn.w, 0.x
		if (thisMandatoryOutput.registerDimension > 0)
			inOutDeviceInstructionStream.push_back(mov_xn_to_onx_x);
		if (thisMandatoryOutput.registerDimension > 1)
			inOutDeviceInstructionStream.push_back(mov_xn_to_onx_y);
		if (thisMandatoryOutput.registerDimension > 2)
			inOutDeviceInstructionStream.push_back(mov_xn_to_onx_z);
		if (thisMandatoryOutput.registerDimension > 3)
			inOutDeviceInstructionStream.push_back(mov_xn_to_onx_w);
	}
}

const ShaderCompileResultCode CompileShaderInternal(const ShaderInfo& inDXShaderInfo, const ShaderCompileOptions inCompileOptions, DeviceBytecode*& outCompiledDeviceBytecode, const char* const inOptShaderBaseFilename)
{
	ShaderCompileResultCode result = ShaderCompile_OK;
	DeviceShaderInfo devShaderInfo;
	DeviceShaderHeader devShaderHeader;
	PopulateRegisterMapping(inDXShaderInfo, devShaderInfo, devShaderHeader);

	if (inCompileOptions & SCOption_OutputInputDisasm)
	{
		OutputDXShaderDisasm(inDXShaderInfo.initialBytecodeToken, inDXShaderInfo.shaderLengthDWORDs, inOptShaderBaseFilename, DXInput);
	}

	std::vector<instructionSlot> deviceInstructionStream;
	signed short viewportConstRegIndex = -1;

	if (inDXShaderInfo.tempRegistersUsedBitmask >= (1 << GPU_SHADER_MAX_NUM_GPR_REG) )
	{
#ifdef _DEBUG
		__debugbreak(); // Error: This shader uses too many GPR's, we don't have enough in hardware!
#endif
		if (!(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
			return ShaderCompile_ERR_TempGPRCountExceedsHardware;
	}

	const int freeDecomposeTempGPRIndex = FindAvailableTempGPR(inDXShaderInfo);
	const int freeScalarizeTempGPRIndex = (freeDecomposeTempGPRIndex >= 0) ? FindAvailableTempGPR(inDXShaderInfo.tempRegistersUsedBitmask | (1 << freeDecomposeTempGPRIndex) ) : -1;
	constantBufferRegisterSpace unusedConstRegSpace = FindLargestUnusedConstBufferRegisterSpace(inDXShaderInfo);

	// First walk the D3D9 shader bytecode and find our instruction start pointers:
	std::vector<const instructionToken*> instructionStartPtrs;
	versionToken shaderVersionToken;
	result = ParseInstructions(inDXShaderInfo, instructionStartPtrs, shaderVersionToken);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	// Next, decompose "combo" instructions (DP3, MAD, NRM, DST, LIT, etc.) into smaller pieces that the device could execute:
	std::vector<anyToken> decomposedInstructionStream;
	decomposedInstructionStream.push_back(*(reinterpret_cast<const anyToken* const>(&shaderVersionToken) ) );
	std::vector<const instructionToken*> decomposedInstructionStartPtrs;
	result = DecomposeShaderInstructions(inDXShaderInfo, instructionStartPtrs, inCompileOptions, freeDecomposeTempGPRIndex, unusedConstRegSpace, decomposedInstructionStream, decomposedInstructionStartPtrs);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	if (inCompileOptions & SCOption_OutputDecomposedDisasm)
		OutputDXShaderDisasm(decomposedInstructionStream, inOptShaderBaseFilename, DXDecomposed);

	// Next, we scalarize our vector instruction stream:
	std::vector<anyToken> scalarizedInstructionStream;
	scalarizedInstructionStream.push_back(*(reinterpret_cast<const anyToken* const>(&shaderVersionToken) ) );
	std::vector<const instructionToken*> scalarizedInstructionStartPtrs;
	result = ScalarizeVectorShader(inDXShaderInfo, decomposedInstructionStartPtrs, inCompileOptions, freeScalarizeTempGPRIndex, scalarizedInstructionStream, scalarizedInstructionStartPtrs);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	if (inCompileOptions & SCOption_OutputScalarizedDisasm)
		OutputDXShaderDisasm(scalarizedInstructionStream, inOptShaderBaseFilename, DXScalarized);

	// (Optional) Apply D3D-level bytecode optimizations at this time (sequence deduplication, dependency tracking and dead code elimination, etc.)
	if (inCompileOptions & SCOption_Optimize_D3DOptimizations)
	{
		result = PerformD3DOptimizations(inDXShaderInfo, scalarizedInstructionStartPtrs, scalarizedInstructionStream);
		if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
			return result;

		if (inCompileOptions & SCOption_OutputD3DPostOptimizationDisasm)				 
			OutputDXShaderDisasm(scalarizedInstructionStream, inOptShaderBaseFilename, DXPostOptimized);
	}

	// Then we translate from D3D9 bytecode to our custom device format instructions bytecode:
	result = TranslateToDeviceBytecode(inDXShaderInfo, scalarizedInstructionStartPtrs, inCompileOptions, deviceInstructionStream);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	if (inCompileOptions & SCOption_OutputTranslatedDeviceBytecode)
	{
		DumpDeviceBytecodeToFile(devShaderInfo, &deviceInstructionStream.front(), (const unsigned)deviceInstructionStream.size(), inOptShaderBaseFilename, DeviceTranslated);
	}

	// For now, simply build a "passthrough" simple VS and use that:
	//MakeSimplePassthroughShader(inDXShaderInfo, deviceInstructionStream);

	// (Optional) Finally, append VS suffix instructions (such as the viewport transform or the division-by-W projection):
	result = AppendVSSuffix(inDXShaderInfo, deviceInstructionStream, inCompileOptions, viewportConstRegIndex);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	if (inCompileOptions & SCOption_OutputTranslatedDeviceBytecode)
	{
		if (inCompileOptions & (SCOption_VS_AppendDivideByW | SCOption_VS_AppendViewportTransform) )
		{
			DumpDeviceBytecodeToFile(devShaderInfo, &deviceInstructionStream.front(), (const unsigned)deviceInstructionStream.size(), inOptShaderBaseFilename, DeviceSuffixApplied);
		}
	}

	// (Optional) Apply hardware bytecode-level optimizations at this point (strength reduction from MUL x2 to SHFT, constant buffer replacement with literals 0.0f/1.0f, instruction reordering to reduce waits, etc.)
	if (inCompileOptions & SCOption_Optimize_DeviceOptimizations)
	{
		result = PerformDeviceOptimizations(deviceInstructionStream);
		if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
			return result;

		if (inCompileOptions & SCOption_OutputDevicePostOptimizationDisasm)
		{
			if (!deviceInstructionStream.empty() )
			{
				DumpDeviceBytecodeToFile(devShaderInfo, &deviceInstructionStream.front(), (const unsigned)deviceInstructionStream.size(), inOptShaderBaseFilename, DeviceOptimized);
			}
			else
			{
#ifdef _DEBUG
				__debugbreak(); // We shouldn't have an empty instruction stream at this point
#endif
			}
		}
	}

	// Calculate (1.0f / oPos.z) inside the shader so that later stages (like depth interpolation and attribute interpolation) can use the shaded Z value without having to repeatedly take its reciprocal themselves per-pixel:
	{
		const signed short positionORegIndex = HelperGetOutputRegister(inDXShaderInfo, D3DDECLUSAGE_POSITION, 0);
		if (positionORegIndex < 0)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return ShaderCompile_ERR_MissingOutputPos;
		}

		//AppendVSPositionInvZ( (const unsigned)positionORegIndex, deviceInstructionStream);
	}

	// Shuffle VS output registers so that they match the expected output registers (o0 = oPos, o1 = oD0, o2 = oT0):
	// TODO: Replace this with some sort of output mapping that is visible to the shader core so that it can handle this shuffling for us
	ShuffleVSOutputRegisters(inDXShaderInfo, deviceInstructionStream);

	// And last but not least, append our "END" instruction to the stream as the last instruction that terminates the shader:
	AppendVSEndInstruction(deviceInstructionStream);

	// Calculate stats for the final shader (number of hardware registers used, number of cycles total, cycles spent waiting, etc.)
	CalculateDeviceShaderStats(deviceInstructionStream, devShaderInfo, viewportConstRegIndex);

	if (deviceInstructionStream.size() >= GPU_SHADER_MAX_NUM_INSTRUCTIONS && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
	{
#ifdef _DEBUG
		__debugbreak(); // Output device shader is too big to be loaded in!
#endif
		return ShaderCompile_ERR_ShaderInstructionCountExceedsHardware;
	}

	const unsigned deviceBytecodeAllocSize = (const unsigned)deviceInstructionStream.size() * sizeof(instructionSlot) + sizeof(DeviceShaderInfo) + sizeof(DeviceShaderHeader);
	DeviceBytecode* const allocatedCompiledDeviceBytecode = (DeviceBytecode* const)malloc(deviceBytecodeAllocSize);
	if (!allocatedCompiledDeviceBytecode)
	{
#ifdef _DEBUG
		__debugbreak(); // Out of memory, or alloc too large?
#endif
		return ShaderCompile_ERR_MallocFail;
	}
	allocatedCompiledDeviceBytecode->deviceShaderInfo = devShaderInfo;

	// Fill out our shader header now:
	allocatedCompiledDeviceBytecode->shaderHeader = devShaderHeader;
	allocatedCompiledDeviceBytecode->shaderHeader.shaderLength_instructionSlots = (const unsigned short)deviceInstructionStream.size();
	allocatedCompiledDeviceBytecode->shaderHeader.shaderHash = inDXShaderInfo.shaderBytecodeHash;

	memcpy(&allocatedCompiledDeviceBytecode->deviceInstructions, &(deviceInstructionStream.front() ), deviceInstructionStream.size() * sizeof(instructionSlot) );
	outCompiledDeviceBytecode = allocatedCompiledDeviceBytecode;


	if (inCompileOptions & ShaderCompileOptions::SCOption_OutputFinalBytecode)
	{
		DumpDeviceBytecodeToFile(*allocatedCompiledDeviceBytecode, inOptShaderBaseFilename, DeviceFinal);
	}

	return result;
}

const ShaderCompileResultCode CompilePretransformedShaderInternal(const ShaderCompileOptions inCompileOptions, DeviceBytecode*& outCompiledDeviceBytecode, const char* const inOptShaderBaseFilename)
{
	ShaderCompileResultCode result = ShaderCompile_OK;

	DeviceShaderInfo devShaderInfo;
	std::vector<instructionSlot> deviceInstructionStream;

	result = MakePretransformedPassthroughShader(deviceInstructionStream, devShaderInfo);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	// And last but not least, append our "END" instruction to the stream as the last instruction that terminates the shader:
	AppendVSEndInstruction(deviceInstructionStream);

	// Calculate stats for the final shader (number of hardware registers used, number of cycles total, cycles spent waiting, etc.)
	CalculateDeviceShaderStats(deviceInstructionStream, devShaderInfo, -1);

	const unsigned deviceBytecodeAllocSize = (const unsigned)deviceInstructionStream.size() * sizeof(instructionSlot) + sizeof(DeviceShaderInfo) + sizeof(DeviceShaderHeader);
	DeviceBytecode* const allocatedCompiledDeviceBytecode = (DeviceBytecode* const)malloc(deviceBytecodeAllocSize);
	if (!allocatedCompiledDeviceBytecode)
	{
#ifdef _DEBUG
		__debugbreak(); // Out of memory, or alloc too large?
#endif
		return ShaderCompile_ERR_MallocFail;
	}
	allocatedCompiledDeviceBytecode->deviceShaderInfo = devShaderInfo;

	// Fill out our shader header using constant data now:
	// For now, these input and output registers are always hardcoded like this:
	/*
	const unsigned inputPositionReg = 0; // v0 = POSITION0
	const unsigned inputDiffuseReg = 1; // v1 = COLOR0
	const unsigned inputTexcoordReg = 2; // v2 = TEXCOORD0

	const unsigned outputPositionReg = 0; // o0 = oPos = OPOSITION0
	const unsigned outputDiffuseReg = 1; // o1 = oD0 = OCOLOR0
	const unsigned outputTexcoordReg = 2; // o2 = oT0 = OTEXCOORD0
	*/
	DeviceShaderHeader devShaderHeader;
	devShaderHeader.inputRegsData[0].usageType = UT_Position; // v0 : POSITION0
	devShaderHeader.inputRegsData[0].usageIndex = 0;
	devShaderHeader.inputRegsData[1].usageType = UT_Color; // v1 : COLOR0
	devShaderHeader.inputRegsData[1].usageIndex = 0;
	devShaderHeader.inputRegsData[2].usageType = UT_Texcoord; // v2 : TEXCOORD0
	devShaderHeader.inputRegsData[3].usageIndex = 0;
	devShaderHeader.outputRegsData[0].usageType = UT_Position; // o0 : OPOSITION0
	devShaderHeader.outputRegsData[0].usageIndex = 0;
	devShaderHeader.outputRegsData[1].usageType = UT_Color; // o1 : OCOLOR0
	devShaderHeader.outputRegsData[1].usageIndex = 0;
	devShaderHeader.outputRegsData[2].usageType = UT_Texcoord; // o2 : OTEXCOORD0
	devShaderHeader.outputRegsData[2].usageIndex = 0;
	allocatedCompiledDeviceBytecode->shaderHeader = devShaderHeader;
	allocatedCompiledDeviceBytecode->shaderHeader.shaderLength_instructionSlots = (const unsigned short)deviceInstructionStream.size();
	allocatedCompiledDeviceBytecode->shaderHeader.shaderHash = 0xFFFFFFFF; // Pretransformed Passthrough shaders don't have a ShaderInfo, so we don't have a real shader hash either

	memcpy(&allocatedCompiledDeviceBytecode->deviceInstructions, &(deviceInstructionStream.front() ), deviceInstructionStream.size() * sizeof(instructionSlot) );
	outCompiledDeviceBytecode = allocatedCompiledDeviceBytecode;

	if (inCompileOptions & ShaderCompileOptions::SCOption_OutputFinalBytecode)
	{
		DumpDeviceBytecodeToFile(*allocatedCompiledDeviceBytecode, inOptShaderBaseFilename, DeviceFinal);
	}

	return result;
}
