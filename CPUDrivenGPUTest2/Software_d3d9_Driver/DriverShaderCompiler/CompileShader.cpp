#include <stdio.h>
#include "DriverShaderCompiler.h"
#include "..\Software_d3d9_Driver\ShaderAnalysis.h"
#include "..\Software_d3d9_Driver\Driver\GPUDeviceLimits.h"
#include <vector>

#define SHADER_OUTPUT_DIRECTORY "DriverCompileOutput"

static void EnsureOutputDirectoryExists()
{
	CreateDirectoryA(SHADER_OUTPUT_DIRECTORY "\\", NULL);
}

const ShaderCompileResultCode ParseInstructions(const ShaderInfo& inDXShaderInfo, std::vector<const instructionToken*>& outVectorInstructions)
{
	ShaderCompileResultCode result = ShaderCompile_OK;
	bool bDone = false;
	const instructionToken* currentInstruction = (const instructionToken* const)inDXShaderInfo.firstInstructionToken;
	while (!bDone)
	{
		outVectorInstructions.push_back(currentInstruction);

		if (currentInstruction->opcode == _D3DSIO_END)
		{
			bDone = true;
		}

		const srcParameterToken* sourceTokens[3] = {0};
		const dstParameterToken* destToken = NULL;

		opcodeDisplayType currentOpcodeType = GetOpcodeDisplayType( (const D3DSHADER_INSTRUCTION_OPCODE_TYPE)currentInstruction->opcode);
		switch (currentInstruction->opcode)
		{
		case _D3DSIO_LABEL:
			currentOpcodeType = srcOnly;
			break;
		case _D3DSIO_DCL:
			currentOpcodeType = dstOnly;
			break;
		case _D3DSIO_SINCOS:
			if (inDXShaderInfo.shaderMajorVersion < 3)
				currentOpcodeType = srcSrcSrcDst;
			else
				currentOpcodeType = srcDst;
			break;
		case _D3DSIO_DEFB:
			currentOpcodeType = dstOnly;
			break;
		case _D3DSIO_DEFI:
			currentOpcodeType = srcSrcSrcDst;
			break;
		case _D3DSIO_DEF:
			currentOpcodeType = srcSrcSrcDst;
			break;
		case _D3DSIO_TEX:
			if (inDXShaderInfo.shaderMajorVersion < 2)
			{
				if (inDXShaderInfo.shaderMinorVersion < 4)
				{
					currentOpcodeType = dstOnly; // ps1.1, ps1.2, ps1.3
				}
				else
				{
					currentOpcodeType = srcDst; // ps1.4
				}
			}
			else
			{
				// SM2.0+:
				currentOpcodeType = srcSrcDst;
			}
			break;
		}

		unsigned relativeTokens = 0;
		switch (currentOpcodeType)
		{
		case justOpcode:
			break;
		case srcOnly:
			sourceTokens[0] = (const srcParameterToken* const)(currentInstruction + 1);
			break;
		case srcSrcOnly:
			sourceTokens[0] = (const srcParameterToken* const)(currentInstruction + 1);
			if (sourceTokens[0]->GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
				++relativeTokens;
			sourceTokens[1] = (const srcParameterToken* const)(currentInstruction + 2 + relativeTokens);
			break;
		case dstOnly:
			destToken = (const dstParameterToken* const)(currentInstruction + 1);
			break;
		case srcDst:
			destToken = (const dstParameterToken* const)(currentInstruction + 1);
			if (destToken->GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
				++relativeTokens;
			sourceTokens[0] = (const srcParameterToken* const)(currentInstruction + 2 + relativeTokens);
			break;
		case srcSrcDst:
			destToken = (const dstParameterToken* const)(currentInstruction + 1);
			if (destToken->GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
				++relativeTokens;
			sourceTokens[0] = (const srcParameterToken* const)(currentInstruction + 2 + relativeTokens);
			if (sourceTokens[0]->GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
				++relativeTokens;
			sourceTokens[1] = (const srcParameterToken* const)(currentInstruction + 3 + relativeTokens);
			break;
		case srcSrcSrcDst:
			destToken = (const dstParameterToken* const)(currentInstruction + 1);
			if (destToken->GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
				++relativeTokens;
			sourceTokens[0] = (const srcParameterToken* const)(currentInstruction + 2 + relativeTokens);
			if (sourceTokens[0]->GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
				++relativeTokens;
			sourceTokens[1] = (const srcParameterToken* const)(currentInstruction + 3 + relativeTokens);
			if (sourceTokens[1]->GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
				++relativeTokens;
			sourceTokens[2] = (const srcParameterToken* const)(currentInstruction + 4 + relativeTokens);
			break;
		case srcSrcSrcSrcDst: // Only ever used with D3DSIO_TEXLDD
			destToken = (const dstParameterToken* const)(currentInstruction + 1);
			if (destToken->GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
				++relativeTokens;
			sourceTokens[0] = (const srcParameterToken* const)(currentInstruction + 2 + relativeTokens);
			if (sourceTokens[0]->GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
				++relativeTokens;
			sourceTokens[1] = (const srcParameterToken* const)(currentInstruction + 3 + relativeTokens);
			if (sourceTokens[1]->GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
				++relativeTokens;
			sourceTokens[2] = (const srcParameterToken* const)(currentInstruction + 4 + relativeTokens);
			if (sourceTokens[2]->GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
				++relativeTokens;
			sourceTokens[3] = (const srcParameterToken* const)(currentInstruction + 5 + relativeTokens);
			break;
		case customOpcode:
			break;
		}

		switch (currentOpcodeType)
		{
		case justOpcode:
			currentInstruction += 1; // Opcode
			break;
		case srcOnly:
			currentInstruction += 2 + relativeTokens;
			break;
		case srcSrcOnly:
			currentInstruction += 3 + relativeTokens;
			break;
		case dstOnly:
			currentInstruction += 2 + relativeTokens;
			break;
		case srcDst:
			currentInstruction += 3 + relativeTokens;
			break;
		case srcSrcDst:
			currentInstruction += 4 + relativeTokens;
			break;
		case srcSrcSrcDst:
			currentInstruction += 5 + relativeTokens;
			break;
		case srcSrcSrcSrcDst: // Only ever used with D3DSIO_TEXLDD
			currentInstruction += 6 + relativeTokens;
			break;
		case customOpcode:
			break;
		}
	}

	return result;
}

/* Converts vector instruction to scalar instructions. For example, the vector instruction 
"mul r0.xyz, r1.xyxy, c8.zzzz"
would get converted into three scalar instructions:
"mul r0.x, r1.x, c8.z",
"mul r0.y, r1.y, c8.z",
"mul r0.z, r1.x, c8.z" */
const ShaderCompileResultCode ScalarizeVectorShader(const ShaderInfo& inDXShaderInfo, const std::vector<const instructionToken*>& inVectorInstructions, const ShaderCompileOptions inCompileOptions, std::vector<anyToken>& outScalarizedInstructions, std::vector<const instructionToken*>& outScalarizedInstructionStartPtrs, const char* const inOptShaderBaseFilename)
{
	// Start by copying the whole shader before the first instruction (includes version token, comment tokens, etc.)
	const unsigned numInitialTokens = inDXShaderInfo.firstInstructionToken - inDXShaderInfo.initialBytecodeToken;
	outScalarizedInstructions.resize(numInitialTokens);
	if (numInitialTokens < 1)
	{
		// Should always have at least a VERSION token
		__debugbreak();
		return ShaderCompile_ERR;
	}
	memcpy(&outScalarizedInstructions.front(), inDXShaderInfo.firstInstructionToken, sizeof(DWORD) * numInitialTokens);

	const unsigned numVectorInstructions = inVectorInstructions.size();
	for (unsigned vectorInstructionIndex = 0; vectorInstructionIndex < numVectorInstructions; ++vectorInstructionIndex)
	{
		const instructionToken* const currentVectorInstruction = inVectorInstructions[vectorInstructionIndex];
	}

	return ShaderCompile_OK;
}

/* Splits apart "combo" instructions (like DP3/DP4, M4x3, NRM, MAD, DST, LIT, BEM, etc.) into their component pieces that can be executed by the hardware. Some examples of this are:
MAD = MUL + ADD
NRM = DP3 + RSQ + MUL
DP3 = MUL + MUL + MUL + ADD + ADD */
const ShaderCompileResultCode DecomposeShaderInstructions(const ShaderInfo& inDXShaderInfo, const std::vector<const instructionToken*>& inScalarizedInstructionStartPtrs, const ShaderCompileOptions inCompileOptions, std::vector<anyToken>& outDecomposedInstructionStream, std::vector<const instructionToken*>& outDecomposedInstructionStartPtrs, const char* const inOptShaderBaseFilename)
{
	return ShaderCompile_OK;
}

/* Translates from Direct3D9 shader bytecode into the device-specific bytecode that our hardware shader core understands and can execute. */
const ShaderCompileResultCode TranslateToDeviceBytecode(const ShaderInfo& inDXShaderInfo, const std::vector<const instructionToken*>& inDecomposedInstructionStartPtrs, const ShaderCompileOptions inCompileOptions, std::vector<instructionSlot>& outDeviceInstructionStream, const char* const inOptShaderBaseFilename)
{
	return ShaderCompile_OK;
}

void AppendVSDivideByW(const unsigned oRegIndex, std::vector<instructionSlot>& inOutDeviceInstructionStream)
{
	const instructionSlot rcpW = { {Op_RCP, DRMod_None, DRTyp_X, 1 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // rcp x1.w, oN.w, 0.x
	inOutDeviceInstructionStream.push_back(rcpW);

	const instructionSlot mulX_rcpW = { {Op_MUL, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_X, 1 /*src1RegIndex*/, Chan_W} }; // mul oN.x, oN.x, x1.w
	const instructionSlot mulY_rcpW = { {Op_MUL, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 1 /*src1RegIndex*/, Chan_W} }; // mul oN.y, oN.y, x1.w
	const instructionSlot mulZ_rcpW = { {Op_MUL, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 1 /*src1RegIndex*/, Chan_W} }; // mul oN.z, oN.z, x1.w
	inOutDeviceInstructionStream.push_back(mulX_rcpW);
	inOutDeviceInstructionStream.push_back(mulY_rcpW);
	inOutDeviceInstructionStream.push_back(mulZ_rcpW);
}

const signed short FindUnusedConstantRegisterIndex(const ShaderInfo& inDXShaderInfo)
{
	unsigned usedConstantsBitmap[GPU_SHADER_MAX_NUM_CONSTANT_FLOAT_REG / 32] = {0};
	const unsigned numUsedConstants = inDXShaderInfo.usedConstantsF.size();
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
	for (unsigned x = GPU_SHADER_MAX_NUM_CONSTANT_FLOAT_REG - 1; x > 1; --x)
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
	const instructionSlot mulX = { {Op_MUL, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, cRegIndex /*src1RegIndex*/, Chan_X} }; // mul oN.x, oN.x, cM.x
	const instructionSlot mulNegY = { {Op_MUL, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Y, SRMod_Neg, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, cRegIndex /*src1RegIndex*/, Chan_Y} }; // mul oN.y, -oN.y, cM.y
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
	if (inDXShaderInfo.isPixelShader == false && (inCompileOptions & SCOption_VS_AppendDivideByW) )
	{
		const unsigned oPosRegIndex = 0;
		AppendVSDivideByW(oPosRegIndex, inOutDeviceInstructionStream);
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
			return ShaderCompile_ERR;
		}

		const unsigned oPosRegIndex = 0;
		AppendVSViewportTransform( (const unsigned)outViewportConstRegIndex, oPosRegIndex, inOutDeviceInstructionStream);
	}
	return ShaderCompile_OK;
}

void AppendVSTexcoordCompression(const unsigned oRegIndex, std::vector<instructionSlot>& inOutDeviceInstructionStream, const unsigned texcoordDimension = 2)
{
#ifdef _DEBUG
	if (oRegIndex >= GPU_SHADER_MAX_NUM_OUTPUT_REG)
	{
		__debugbreak();
	}
	if (texcoordDimension < 1)
	{
		__debugbreak();
	}
	if (texcoordDimension > 4)
	{
		__debugbreak();
	}
#endif
	const instructionSlot compressTX = { {Op_CNV_UNORM16, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // cnv_unorm16 oN.x, oN.x, 0.x
	const instructionSlot compressTY = { {Op_CNV_UNORM16, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // cnv_unorm16 oN.y, oN.y, 0.x
	const instructionSlot compressTZ = { {Op_CNV_UNORM16, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // cnv_unorm16 oN.z, oN.z, 0.x
	const instructionSlot compressTW = { {Op_CNV_UNORM16, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // cnv_unorm16 oN.z, oN.z, 0.x

	if (texcoordDimension >= 1)
		inOutDeviceInstructionStream.push_back(compressTX);
	if (texcoordDimension >= 2)
		inOutDeviceInstructionStream.push_back(compressTY);
	if (texcoordDimension >= 3)
		inOutDeviceInstructionStream.push_back(compressTZ);
	if (texcoordDimension >= 4)
		inOutDeviceInstructionStream.push_back(compressTW);
}

void AppendVSColorCompression(const unsigned oRegIndex, std::vector<instructionSlot>& inOutDeviceInstructionStream, const unsigned colorDimension = 4)
{
#ifdef _DEBUG
	if (oRegIndex >= GPU_SHADER_MAX_NUM_OUTPUT_REG)
	{
		__debugbreak();
	}
	if (colorDimension < 1)
	{
		__debugbreak();
	}
	if (colorDimension > 4)
	{
		__debugbreak();
	}
#endif

	const instructionSlot compressDR = { {Op_CNV_UNORM8, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // cnv_unorm8 oN.x, oN.x, 0.x
	const instructionSlot compressDG = { {Op_CNV_UNORM8, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // cnv_unorm8 oN.y, oN.y, 0.x
	const instructionSlot compressDB = { {Op_CNV_UNORM8, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // cnv_unorm8 oN.z, oN.z, 0.x
	const instructionSlot compressDA = { {Op_CNV_UNORM8, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // cnv_unorm8 oN.w, oN.w, 0.x

	if (colorDimension >= 1)
		inOutDeviceInstructionStream.push_back(compressDR);
	if (colorDimension >= 2)
		inOutDeviceInstructionStream.push_back(compressDG);
	if (colorDimension >= 3)
		inOutDeviceInstructionStream.push_back(compressDB);
	if (colorDimension >= 4)
		inOutDeviceInstructionStream.push_back(compressDA);
}

void AppendVSPositionCompression(const unsigned oRegIndex, std::vector<instructionSlot>& inOutDeviceInstructionStream)
{
#ifdef _DEBUG
	if (oRegIndex >= GPU_SHADER_MAX_NUM_OUTPUT_REG)
	{
		__debugbreak();
	}
#endif

	const instructionSlot compressPosX = { {Op_RND_SINT16NE, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // rnd_sint16ne oN.x, oN.x, 0.x
	const instructionSlot compressPosY = { {Op_RND_SINT16NE, DRMod_None, DRTyp_O, oRegIndex /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_O, oRegIndex /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src1RegIndex*/, Chan_X} }; // rnd_sint16ne oN.y, oN.y, 0.x

	inOutDeviceInstructionStream.push_back(compressPosX);
	inOutDeviceInstructionStream.push_back(compressPosY);
}

// Optionally applies vertex shader output compression (ie. compress oPos.xy to SHORT, compress oDn.rgba to D3DCOLOR, and compress oTn.xy to USHORT)
const ShaderCompileResultCode AppendVSOutputCompression(const ShaderInfo& inDXShaderInfo, const ShaderCompileOptions inCompileOptions, std::vector<instructionSlot>& inOutDeviceInstructionStream)
{
	if (inDXShaderInfo.isPixelShader == false && (inCompileOptions & SCOption_VS_OutputCompressionEnable) )
	{
		const unsigned texcoordORegIndex = 0;
		const unsigned texcoordDimension = 2;
		AppendVSTexcoordCompression(texcoordORegIndex, inOutDeviceInstructionStream, texcoordDimension);

		const unsigned colorORegIndex = 1;
		const unsigned colorDimension = 4;
		AppendVSColorCompression(colorORegIndex, inOutDeviceInstructionStream, colorDimension);

		const unsigned positionORegIndex = 0;
		AppendVSPositionCompression(positionORegIndex, inOutDeviceInstructionStream);
	}
	return ShaderCompile_OK;
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

void MakeSimplePassthroughShader(const ShaderInfo& inDXShaderInfo, std::vector<instructionSlot>& outDeviceInstructionStream)
{
	const unsigned baseConstRegisterWVP = 3; // c3, c4, c5, c6 = WVP matrix

	const unsigned inputPositionReg = 0; // v0 = POSITION0
	const unsigned inputTexcoordReg = 1; // v1 = TEXCOORD0
	const unsigned inputDiffuseReg = 2; // v2 = COLOR0

	const unsigned outputPositionReg = 0; // o0 = oPos = OPOSITION0
	const unsigned outputDiffuseReg = 1; // o1 = oD0 = OCOLOR0
	const unsigned outputTexcoordReg = 2; // o2 = oT0 = OTEXCOORD0

	// Simply do:
	// o0 = oPos = mul(float4(v0.xyz, 1.0f), c3); // c3, c4, c5, c6 is our combined WVP matrix in row-major form
	// o1 = oD0 = v2.xyzw (passthrough vertex color)
	// o2 = oT0 = v1.xy (passthrough texcoord0)

	// mul r0, v0.y, c1:
	const instructionSlot mulV0Y_C1_X = { {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, baseConstRegisterWVP + 1 /*src1RegIndex*/, Chan_X} }; // mul r0.x, v0.y, c1.x
	const instructionSlot mulV0Y_C1_Y = { {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, baseConstRegisterWVP + 1 /*src1RegIndex*/, Chan_Y} }; // mul r0.y, v0.y, c1.y
	const instructionSlot mulV0Y_C1_Z = { {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, baseConstRegisterWVP + 1 /*src1RegIndex*/, Chan_Z} }; // mul r0.z, v0.y, c1.z
	const instructionSlot mulV0Y_C1_W = { {Op_MUL, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, baseConstRegisterWVP + 1 /*src1RegIndex*/, Chan_W} }; // mul r0.w, v0.y, c1.w
	outDeviceInstructionStream.push_back(mulV0Y_C1_X);
	outDeviceInstructionStream.push_back(mulV0Y_C1_Y);
	outDeviceInstructionStream.push_back(mulV0Y_C1_Z);
	outDeviceInstructionStream.push_back(mulV0Y_C1_W);

	// mad r0, v0.x, c0, r0:
	const instructionSlot mulV0X_C0_X = { {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, baseConstRegisterWVP + 0 /*src1RegIndex*/, Chan_X} }; // mul x0.x, v0.x, c0.x
	const instructionSlot mulV0X_C0_Y = { {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, baseConstRegisterWVP + 0 /*src1RegIndex*/, Chan_Y} }; // mul x0.y, v0.x, c0.y
	const instructionSlot mulV0X_C0_Z = { {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, baseConstRegisterWVP + 0 /*src1RegIndex*/, Chan_Z} }; // mul x0.z, v0.x, c0.z
	const instructionSlot mulV0X_C0_W = { {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, baseConstRegisterWVP + 0 /*src1RegIndex*/, Chan_W} }; // mul x0.w, v0.x, c0.w
	const instructionSlot addX0_R0_X1 = { {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_X} }; // add r0.x, x0.x, r0.x
	const instructionSlot addX0_R0_Y1 = { {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Y} }; // add r0.y, x0.y, r0.y
	const instructionSlot addX0_R0_Z1 = { {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Z} }; // add r0.z, x0.z, r0.z
	const instructionSlot addX0_R0_W1 = { {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_W} }; // add r0.w, x0.w, r0.w
	outDeviceInstructionStream.push_back(mulV0X_C0_X);
	outDeviceInstructionStream.push_back(mulV0X_C0_Y);
	outDeviceInstructionStream.push_back(mulV0X_C0_Z);
	outDeviceInstructionStream.push_back(mulV0X_C0_W);
	outDeviceInstructionStream.push_back(addX0_R0_X1);
	outDeviceInstructionStream.push_back(addX0_R0_Y1);
	outDeviceInstructionStream.push_back(addX0_R0_Z1);
	outDeviceInstructionStream.push_back(addX0_R0_W1);

	// mad r0, v0.z, c2, r0:
	const instructionSlot mulV0Z_C2_X = { {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, baseConstRegisterWVP + 2 /*src1RegIndex*/, Chan_X} }; // mul x0.x, v0.z, c2.x 
	const instructionSlot mulV0Z_C2_Y = { {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, baseConstRegisterWVP + 2 /*src1RegIndex*/, Chan_Y} }; // mul x0.y, v0.z, c2.y
	const instructionSlot mulV0Z_C2_Z = { {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, baseConstRegisterWVP + 2 /*src1RegIndex*/, Chan_Z} }; // mul x0.z, v0.z, c2.z
	const instructionSlot mulV0Z_C2_W = { {Op_MUL, DRMod_None, DRTyp_X, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_V, inputPositionReg /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, baseConstRegisterWVP + 2 /*src1RegIndex*/, Chan_W} }; // mul x0.w, v0.z, c2.w
	const instructionSlot addX0_R0_X2 = { {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_X} }; // add r0.x, x0.x, r0.x
	const instructionSlot addX0_R0_Y2 = { {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Y} }; // add r0.y, x0.y, r0.y
	const instructionSlot addX0_R0_Z2 = { {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_Z} }; // add r0.z, x0.z, r0.z
	const instructionSlot addX0_R0_W2 = { {Op_ADD, DRMod_None, DRTyp_R, 0 /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_X, 0 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_R, 0 /*src1RegIndex*/, Chan_W} }; // add r0.w, x0.w, r0.w
	outDeviceInstructionStream.push_back(mulV0Z_C2_X);
	outDeviceInstructionStream.push_back(mulV0Z_C2_Y);
	outDeviceInstructionStream.push_back(mulV0Z_C2_Z);
	outDeviceInstructionStream.push_back(mulV0Z_C2_W);
	outDeviceInstructionStream.push_back(addX0_R0_X2);
	outDeviceInstructionStream.push_back(addX0_R0_Y2);
	outDeviceInstructionStream.push_back(addX0_R0_Z2);
	outDeviceInstructionStream.push_back(addX0_R0_W2);

	// add oPos, r0, c3:
	const instructionSlot addX0_C3_X = { {Op_ADD, DRMod_None, DRTyp_O, outputPositionReg /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_C, baseConstRegisterWVP + 3 /*src1RegIndex*/, Chan_X} }; // add o0.x, r0.x, c3.x
	const instructionSlot addX0_C3_Y = { {Op_ADD, DRMod_None, DRTyp_O, outputPositionReg /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_C, baseConstRegisterWVP + 3 /*src1RegIndex*/, Chan_Y} }; // add o0.y, r0.y, c3.y
	const instructionSlot addX0_C3_Z = { {Op_ADD, DRMod_None, DRTyp_O, outputPositionReg /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_C, baseConstRegisterWVP + 3 /*src1RegIndex*/, Chan_Z} }; // add o0.z, r0.z, c3.z
	const instructionSlot addX0_C3_W = { {Op_ADD, DRMod_None, DRTyp_O, outputPositionReg /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_R, 0 /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_C, baseConstRegisterWVP + 3 /*src1RegIndex*/, Chan_W} }; // add o0.w, r0.w, c3.w
	outDeviceInstructionStream.push_back(addX0_C3_X);
	outDeviceInstructionStream.push_back(addX0_C3_Y);
	outDeviceInstructionStream.push_back(addX0_C3_Z);
	outDeviceInstructionStream.push_back(addX0_C3_W);

	// mov oD0, v2:
	const instructionSlot movD0R = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, inputDiffuseReg /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.x, v2.x, 0.x
	const instructionSlot movD0G = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, inputDiffuseReg /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.y, v2.y, 0.x
	const instructionSlot movD0B = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_Z, SRMod_None, SRTyp_V, inputDiffuseReg /*src0RegIndex*/, Chan_Z, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.x, v2.z, 0.x
	const instructionSlot movD0A = { {Op_MOV, DRMod_None, DRTyp_O, outputDiffuseReg /*destRegIndex*/, Chan_W, SRMod_None, SRTyp_V, inputDiffuseReg /*src0RegIndex*/, Chan_W, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o1.y, v2.w, 0.x
	outDeviceInstructionStream.push_back(movD0R);
	outDeviceInstructionStream.push_back(movD0G);
	outDeviceInstructionStream.push_back(movD0B);
	outDeviceInstructionStream.push_back(movD0A);

	// mov oT0.xy, v1.xy:
	const instructionSlot movT0X = { {Op_MOV, DRMod_None, DRTyp_O, outputTexcoordReg /*destRegIndex*/, Chan_X, SRMod_None, SRTyp_V, inputTexcoordReg /*src0RegIndex*/, Chan_X, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o2.x, v1.x, 0.x
	const instructionSlot movT0Y = { {Op_MOV, DRMod_None, DRTyp_O, outputTexcoordReg /*destRegIndex*/, Chan_Y, SRMod_None, SRTyp_V, inputTexcoordReg /*src0RegIndex*/, Chan_Y, SRMod_None, SRTyp_0, 0 /*src0RegIndex*/, Chan_X} }; // mov o2.y, v1.y, 0.x
	outDeviceInstructionStream.push_back(movT0X);
	outDeviceInstructionStream.push_back(movT0Y);
}

void HandleFinalOutputs(const DeviceBytecode* const inCompiledFinalDeviceBytecode, const ShaderCompileOptions inCompileOptions, const char* const inOptShaderBaseFilename)
{
	if (!inCompiledFinalDeviceBytecode)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}

	if (inCompileOptions & SCOption_OutputFinalBytecode)
	{
		EnsureOutputDirectoryExists();

		char finalBytecodeFilename[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(finalBytecodeFilename, SHADER_OUTPUT_DIRECTORY "\\" "%s_FinalBytecode.bin", inOptShaderBaseFilename);
		FILE* const dumpFinalBytecodeFile = fopen(finalBytecodeFilename, "wb");
#pragma warning(pop)
		if (dumpFinalBytecodeFile)
		{
			fwrite(&(inCompiledFinalDeviceBytecode->deviceInstructions), sizeof(instructionSlot), inCompiledFinalDeviceBytecode->numDeviceTokens, dumpFinalBytecodeFile);
			fclose(dumpFinalBytecodeFile);
		}
	}

	if (inCompileOptions & SCOption_OutputFinalDisasm)
	{
		EnsureOutputDirectoryExists();

		char finalDisasmFilename[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(finalDisasmFilename, SHADER_OUTPUT_DIRECTORY "\\" "%s_FinalDisasm.txt", inOptShaderBaseFilename);
		FILE* const dumpFinalDisasmFile = fopen(finalDisasmFilename, "wb");
#pragma warning(pop)
		if (dumpFinalDisasmFile)
		{
			DisasmDeviceBytecodeToFile(inCompiledFinalDeviceBytecode, dumpFinalDisasmFile);
			fclose(dumpFinalDisasmFile);
		}
	}
}

const ShaderCompileResultCode CompileShaderInternal(const ShaderInfo& inDXShaderInfo, const ShaderCompileOptions inCompileOptions, DeviceBytecode*& outCompiledDeviceBytecode, const char* const inOptShaderBaseFilename)
{
	ShaderCompileResultCode result = ShaderCompile_OK;
	signed short viewportConstRegIndex = -1;

	std::vector<const instructionToken*> instructionStartPtrs;
	result = ParseInstructions(inDXShaderInfo, instructionStartPtrs);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	std::vector<anyToken> scalarizedInstructionStream;
	std::vector<const instructionToken*> scalarizedInstructionStartPtrs;
	result = ScalarizeVectorShader(inDXShaderInfo, instructionStartPtrs, inCompileOptions, scalarizedInstructionStream, scalarizedInstructionStartPtrs, inOptShaderBaseFilename);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	std::vector<anyToken> decomposedInstructionStream;
	std::vector<const instructionToken*> decomposedInstructionStartPtrs;
	result = DecomposeShaderInstructions(inDXShaderInfo, scalarizedInstructionStartPtrs, inCompileOptions, decomposedInstructionStream, decomposedInstructionStartPtrs, inOptShaderBaseFilename);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	std::vector<instructionSlot> deviceInstructionStream;
	result = TranslateToDeviceBytecode(inDXShaderInfo, decomposedInstructionStartPtrs, inCompileOptions, deviceInstructionStream, inOptShaderBaseFilename);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	MakeSimplePassthroughShader(inDXShaderInfo, deviceInstructionStream);

	result = AppendVSSuffix(inDXShaderInfo, deviceInstructionStream, inCompileOptions, viewportConstRegIndex);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	result = AppendVSOutputCompression(inDXShaderInfo, inCompileOptions, deviceInstructionStream);
	if (result != ShaderCompile_OK && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
		return result;

	AppendVSEndInstruction(deviceInstructionStream);

	if (deviceInstructionStream.size() >= GPU_SHADER_MAX_NUM_INSTRUCTIONS && !(inCompileOptions & SCOption_IgnoreShaderCompileErrors) )
	{
#ifdef _DEBUG
		__debugbreak(); // Output device shader is too big to be loaded in!
#endif
		return ShaderCompile_ERR;
	}

	const unsigned deviceBytecodeAllocSize = deviceInstructionStream.size() * sizeof(instructionSlot) + sizeof(unsigned short) + sizeof(signed short);
	DeviceBytecode* const allocatedCompiledDeviceBytecode = (DeviceBytecode* const)malloc(deviceBytecodeAllocSize);
	if (!allocatedCompiledDeviceBytecode)
	{
#ifdef _DEBUG
		__debugbreak(); // Out of memory, or alloc too large?
#endif
		return ShaderCompile_ERR;
	}
	allocatedCompiledDeviceBytecode->numDeviceTokens = (const unsigned short)deviceInstructionStream.size();
	allocatedCompiledDeviceBytecode->vsViewportTransformConstRegisterF = viewportConstRegIndex;
	memcpy(&allocatedCompiledDeviceBytecode->deviceInstructions, &(deviceInstructionStream.front() ), deviceInstructionStream.size() * sizeof(instructionSlot) );
	outCompiledDeviceBytecode = allocatedCompiledDeviceBytecode;

	HandleFinalOutputs(allocatedCompiledDeviceBytecode, inCompileOptions, inOptShaderBaseFilename);

	return result;
}

// This is our main function that takes compiled D3D9 bytecode (shader model 1, 2, or 3) and converts it into device-specific bytecode
const ShaderCompileResultCode __stdcall CompileShaderToDeviceBytecode(const ShaderInfo* const inDXShaderInfo, const ShaderCompileOptions inCompileOptions, DeviceBytecode** outCompiledDeviceBytecode, const char* const inOptShaderBaseFilename)
{
	if (!outCompiledDeviceBytecode)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR;
	}

	*outCompiledDeviceBytecode = NULL;

	if (!inDXShaderInfo)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR;
	}

	if (inCompileOptions >= SCOPtion_LAST_VALID_OPTION)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR;
	}

	if ( (inCompileOptions & SCOption_OutputEverything) != 0)
	{
		if (!inOptShaderBaseFilename)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return ShaderCompile_ERR;
		}
	}

	// The driver shader compiler does not yet support pixel shaders. Vertex shaders only for right now!
	if (inDXShaderInfo->isPixelShader)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return ShaderCompile_ERR;
	}

	return CompileShaderInternal(*inDXShaderInfo, inCompileOptions, *outCompiledDeviceBytecode, inOptShaderBaseFilename);
}
