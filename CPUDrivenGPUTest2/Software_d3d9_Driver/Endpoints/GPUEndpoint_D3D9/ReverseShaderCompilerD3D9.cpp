#include "d3d9include.h"
#include "ReverseShaderCompilerD3D9.h"
#include "..\\..\\DriverShaderCompiler\\DeviceShaderBytecode.h"
#include "..\\..\\Software_d3d9_Driver\\Driver\\GPUTypes.h"
#include <vector>
#include <string>

// Converts between an array of string pointers to just a flat char vector:
void ConvertStringLinesToCharBuffer(const std::vector<std::string*>& codeLines, std::vector<char>& outBuffer)
{
	const unsigned numLines = (const unsigned)(codeLines.size() );
	unsigned numCharsTotal = 0;
	for (unsigned x = 0; x < numLines; ++x)
	{
		numCharsTotal += (const unsigned)(codeLines[x]->length() );
	}
	++numCharsTotal; // Increment one for the trailing null terminator character
	outBuffer.resize(numCharsTotal);
	char* writePtr = &outBuffer.front();
	for (unsigned x = 0; x < numLines; ++x)
	{
		memcpy(writePtr, &codeLines[x]->front(), codeLines[x]->size() );
		writePtr += codeLines[x]->size();
	}
}

void PrintNewLine(std::vector<std::string*>& outVector, const char* newString)
{
	outVector.push_back(new std::string(newString) );
}

void AddConstantRegIfNotFound(const unsigned char constRegIndex, std::vector<unsigned char>& constantBufferRegistersAccessed)
{
	const unsigned numExistingConstRegisters = (const unsigned)(constantBufferRegistersAccessed.size() );
	for (unsigned x = 0; x < numExistingConstRegisters; ++x)
	{
		if (constantBufferRegistersAccessed[x] == constRegIndex)
			return;
	}

	constantBufferRegistersAccessed.push_back(constRegIndex);
}

static const char* const InstructionSrcRegModToDecompileString(const InstructionSrcRegModifier srcMod)
{
	switch (srcMod)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Should never be here!
#endif
	case SRMod_None:
		return " ";
	case SRMod_Neg:
		return "-";
	case SRMod_Abs:
		return "abs";
	case SRMod_AbsNeg:
		return "-abs";
	}
}

const char* const inputMemberNamesPosition[4] =
{
	"position",
	"position",
	"position",
	"position"
};

const char* const inputMemberNamesTexcoord[4] =
{
	"texCoord0",
	"texCoord1",
	"texCoord2",
	"texCoord3"
};

const char* const inputMemberNamesColor[4] =
{
	"color0",
	"color1",
	"color2",
	"color3"
};

void ReverseCompileShaderToD3D9ShaderText(const DeviceShaderHeader* const shaderHeader, const instructionSlot* const shaderTokensStart, const unsigned shaderTokensLength, std::vector<char>& outBuffer)
{
	std::vector<std::string*> codeLines;

	std::vector<unsigned char> constantBufferRegistersAccessed;

	for (unsigned shaderTokenIndex = 0; shaderTokenIndex < shaderTokensLength; ++shaderTokenIndex)
	{
		const instructionSlot& thisInstruction = shaderTokensStart[shaderTokenIndex];

		if (thisInstruction.instructionStruct.srcRegA_regType == SRTyp_C)
		{
			AddConstantRegIfNotFound( (const unsigned char)(thisInstruction.instructionStruct.srcRegA_regIndex), constantBufferRegistersAccessed);
		}
		if (thisInstruction.instructionStruct.srcRegB_regType == SRTyp_C)
		{
			AddConstantRegIfNotFound( (const unsigned char)(thisInstruction.instructionStruct.srcRegB_regIndex), constantBufferRegistersAccessed);
		}
	}

	// Add constant buffer data here:
	const unsigned numConstantRegsAccessed = (const unsigned)(constantBufferRegistersAccessed.size() );
	for (unsigned x = 0; x < numConstantRegsAccessed; ++x)
	{
		char tempLine[64] = {0};
		const unsigned char thisConstRegIndex = constantBufferRegistersAccessed[x];
#pragma warning(push)
#pragma warning(disable:4996) // C4996: 'sprintf': This function or variable may be unsafe. Consider using sprintf_s instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.
		sprintf(tempLine, "const float4 c%u : register(c%u);\n", thisConstRegIndex, thisConstRegIndex);
#pragma warning(pop)
		PrintNewLine(codeLines, tempLine);
	}

	PrintNewLine(codeLines, "\n");
	PrintNewLine(codeLines, "struct inVert\n");
	PrintNewLine(codeLines, "{\n");
	PrintNewLine(codeLines, "\tfloat4 position0 : POSITION0;\n");
	PrintNewLine(codeLines, "\tfloat4 position1 : POSITION0;\n");
	PrintNewLine(codeLines, "\tfloat4 position2 : POSITION0;\n");
	PrintNewLine(codeLines, "\tfloat4 position3 : POSITION0;\n");
	PrintNewLine(codeLines, "\tfloat4 texCoord0 : TEXCOORD0;\n");
	PrintNewLine(codeLines, "\tfloat4 texCoord1 : TEXCOORD1;\n");
	PrintNewLine(codeLines, "\tfloat4 texCoord2 : TEXCOORD2;\n");
	PrintNewLine(codeLines, "\tfloat4 texCoord3 : TEXCOORD3;\n");
	PrintNewLine(codeLines, "\tfloat4 color0 : COLOR0;\n");
	PrintNewLine(codeLines, "\tfloat4 color1 : COLOR1;\n");
	PrintNewLine(codeLines, "\tfloat4 color2 : COLOR2;\n");
	PrintNewLine(codeLines, "\tfloat4 color3 : COLOR3;\n");
	PrintNewLine(codeLines, "\tfloat4 normal0 : NORMAL0;\n");
	PrintNewLine(codeLines, "\tfloat4 normal1 : NORMAL1;\n");
	PrintNewLine(codeLines, "\tfloat4 normal2 : NORMAL2;\n");
	PrintNewLine(codeLines, "\tfloat4 normal3 : NORMAL3;\n");
	PrintNewLine(codeLines, "\tfloat4 blendWeight0 : BLENDWEIGHT0;\n");
	PrintNewLine(codeLines, "\tfloat4 blendWeight1 : BLENDWEIGHT1;\n");
	PrintNewLine(codeLines, "\tfloat4 blendWeight2 : BLENDWEIGHT2;\n");
	PrintNewLine(codeLines, "\tfloat4 blendWeight3 : BLENDWEIGHT3;\n");
	PrintNewLine(codeLines, "\tfloat4 blendIndices0 : BLENDINDICES0;\n");
	PrintNewLine(codeLines, "\tfloat4 blendIndices1 : BLENDINDICES1;\n");
	PrintNewLine(codeLines, "\tfloat4 blendIndices2 : BLENDINDICES2;\n");
	PrintNewLine(codeLines, "\tfloat4 blendIndices3 : BLENDINDICES3;\n");
	PrintNewLine(codeLines, "\tfloat4 PSize0 : PSIZE0;\n");
	PrintNewLine(codeLines, "\tfloat4 PSize1 : PSIZE1;\n");
	PrintNewLine(codeLines, "\tfloat4 PSize2 : PSIZE2;\n");
	PrintNewLine(codeLines, "\tfloat4 PSize3 : PSIZE3;\n");
	PrintNewLine(codeLines, "\tfloat4 fog0 : FOG0;\n");
	PrintNewLine(codeLines, "\tfloat4 fog1 : FOG1;\n");
	PrintNewLine(codeLines, "\tfloat4 fog2 : FOG2;\n");
	PrintNewLine(codeLines, "\tfloat4 fog3 : FOG3;\n");
	PrintNewLine(codeLines, "};\n");
	PrintNewLine(codeLines, "\n");
	PrintNewLine(codeLines, "struct outVert\n");
	PrintNewLine(codeLines, "{\n");
	PrintNewLine(codeLines, "\tfloat4 outPos : POSITION;\n");
	PrintNewLine(codeLines, "\tfloat2 texCoord : TEXCOORD0;\n");
	PrintNewLine(codeLines, "\tfloat4 color : COLOR0;\n");
	PrintNewLine(codeLines, "};\n");
	PrintNewLine(codeLines, "\n");
	PrintNewLine(codeLines, "static const float literal0 = 0.0f;\n");
	PrintNewLine(codeLines, "static const float literal1 = 1.0f;\n");
	PrintNewLine(codeLines, "static const float literalNeg1 = -1.0f;\n");
	PrintNewLine(codeLines, "\n");
	PrintNewLine(codeLines, "outVert main(in const inVert input)\n");
	PrintNewLine(codeLines, "{\n");
	PrintNewLine(codeLines, "\toutVert ret;\n");
	PrintNewLine(codeLines, "\tret = (outVert)0;\n"); // Just zero everything out just in case the shader doesn't set something...
	PrintNewLine(codeLines, "\t\n");
	for (unsigned inputRegIndex = 0; inputRegIndex < 8; ++inputRegIndex)
	{
		char tempLine[64] = {0};
		const char* inputStructMemberName = "texCoord";
		switch (shaderHeader->inputRegsData[inputRegIndex].usageType)
		{
		default:
#ifdef _DEBUG
			__debugbreak(); // Error: Unknown/undefined usage type!
#endif
		case UT_Texcoord:
			inputStructMemberName = "texCoord";
			break;
		case UT_Position:
			inputStructMemberName = "position";
			break;
		case UT_Color:
			inputStructMemberName = "color";
			break;
		case UT_Normal:
			inputStructMemberName = "normal";
			break;
		case UT_BlendWeight:
			inputStructMemberName = "blendWeight";
			break;
		case UT_BlendIndices:
			inputStructMemberName = "blendIndices";
			break;
		case UT_PSize:
			inputStructMemberName = "PSize";
			break;
		case UT_Fog:
			inputStructMemberName = "fog";
			break;
		}
#pragma warning(push)
#pragma warning(disable:4996) // C4996: 'sprintf': This function or variable may be unsafe. Consider using sprintf_s instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.
		sprintf(tempLine, "\tconst float4 v%u = input.%s%u;\n", inputRegIndex, inputStructMemberName, shaderHeader->inputRegsData[inputRegIndex].usageIndex);
#pragma warning(pop)
		PrintNewLine(codeLines, tempLine);
	}
	for (unsigned tempRegIndex = 0; tempRegIndex < 8; ++tempRegIndex)
	{
		char tempLine[64] = {0};
#pragma warning(push)
#pragma warning(disable:4996) // C4996: 'sprintf': This function or variable may be unsafe. Consider using sprintf_s instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.
		sprintf(tempLine, "\tfloat4 r%u = float4(0.0f, 0.0f, 0.0f, 0.0f);\n", tempRegIndex);
#pragma warning(pop)
		PrintNewLine(codeLines, tempLine);
	}
	for (unsigned specRegIndex = 0; specRegIndex < 8; ++specRegIndex)
	{
		char tempLine[64] = {0};
#pragma warning(push)
#pragma warning(disable:4996) // C4996: 'sprintf': This function or variable may be unsafe. Consider using sprintf_s instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.
		sprintf(tempLine, "\tfloat4 x%u = float4(0.0f, 0.0f, 0.0f, 0.0f);\n", specRegIndex);
#pragma warning(pop)
		PrintNewLine(codeLines, tempLine);
	}
	for (unsigned outRegIndex = 0; outRegIndex < 8; ++outRegIndex)
	{
		char tempLine[64] = {0};
#pragma warning(push)
#pragma warning(disable:4996) // C4996: 'sprintf': This function or variable may be unsafe. Consider using sprintf_s instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.
		sprintf(tempLine, "\tfloat4 o%u = float4(0.0f, 0.0f, 0.0f, 0.0f);\n", outRegIndex);
#pragma warning(pop)
		PrintNewLine(codeLines, tempLine);
	}

	// Decompile shader here
	PrintNewLine(codeLines, "\n");
	for (unsigned shaderTokenIndex = 0; shaderTokenIndex < shaderTokensLength; ++shaderTokenIndex)
	{
		const instructionSlot& thisInstruction = shaderTokensStart[shaderTokenIndex];

		char disasmBuffer[64+32] = {0};
#pragma warning(push)
#pragma warning(disable:4996) // C4996: 'sprintf': This function or variable may be unsafe. Consider using sprintf_s instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.
		sprintf(disasmBuffer, "\t// %u: %s%s %s%llu.%c %s%llu%s.%c %s%llu%s.%c // 0x%016I64X\n", 
			shaderTokenIndex,
			InstructionOpToString(thisInstruction.instructionStruct.operation), InstructionDestRegModToString(thisInstruction.instructionStruct.destReg_destModifier), // op_destmod
			InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
			InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, InstructionSrcRegModToString(thisInstruction.instructionStruct.srcRegA_srcModifier), GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component), // srcRegType%u_srcMod.channel
			InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegB_regType), thisInstruction.instructionStruct.srcRegB_regIndex, InstructionSrcRegModToString(thisInstruction.instructionStruct.srcRegB_srcModifier), GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegB_component), // srcRegType%u_srcMod.channel
			thisInstruction.rawQWORD);
#pragma warning(pop)
		PrintNewLine(codeLines, disasmBuffer);

#pragma warning(push)
#pragma warning(disable:4996) // C4996: 'sprintf': This function or variable may be unsafe. Consider using sprintf_s instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. See online help for details.
		switch (thisInstruction.instructionStruct.operation)
		{
		default:
		case Op_Unused14:
#ifdef _DEBUG
			__debugbreak(); // Should never be here!
#endif
		case Op_NOP: // Do nothing!
			disasmBuffer[0] = '\n';
			disasmBuffer[1] = '\0';
			break;
		case Op_END: // We're finished with this shader!
			disasmBuffer[0] = '\n';
			disasmBuffer[1] = '\0';
			break;
		case Op_MOV:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(%s(%s%llu.%c) );\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component) ); // srcRegType%u.channel
			break;
		case Op_ADD:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(%s(%s%llu.%c) + %s(%s%llu.%c) );\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component), // srcRegType%u.channel
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegB_srcModifier), // Possible src b modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegB_regType), thisInstruction.instructionStruct.srcRegB_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegB_component) ); // srcRegType%u.channel
			break;
		case Op_MUL:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(%s(%s%llu.%c) * %s(%s%llu.%c) );\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component), // srcRegType%u.channel
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegB_srcModifier), // Possible src b modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegB_regType), thisInstruction.instructionStruct.srcRegB_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegB_component) ); // srcRegType%u.channel
			break;
		case Op_MIN:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(min(%s(%s%llu.%c), %s(%s%llu.%c) ) );\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component), // srcRegType%u.channel
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegB_srcModifier), // Possible src b modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegB_regType), thisInstruction.instructionStruct.srcRegB_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegB_component) ); // srcRegType%u.channel
			break;
		case Op_MAX:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(max(%s(%s%llu.%c), %s(%s%llu.%c) ) );\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component), // srcRegType%u.channel
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegB_srcModifier), // Possible src b modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegB_regType), thisInstruction.instructionStruct.srcRegB_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegB_component) ); // srcRegType%u.channel
			break;
		case Op_RCP:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(1.0f / (%s(%s%llu.%c) ) );\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component) ); // srcRegType%u.channel
			break;
		case Op_FRC:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(frc(%s(%s%llu.%c) ) );\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component) ); // srcRegType%u.channel
			break;
		case Op_EXPP:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(exp2(%s(%s%llu.%c) ) );\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component) ); // srcRegType%u.channel
			break;
		case Op_LOGP:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(log2(%s(%s%llu.%c) ) );\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component) ); // srcRegType%u.channel
			break;
		case Op_RSQ:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(1.0f / sqrt(%s(%s%llu.%c) ) );\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component) ); // srcRegType%u.channel
			break;
		case Op_SLT:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(%s(%s%llu.%c) < %s(%s%llu.%c) ? 1.0f : 0.0f);\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component), // srcRegType%u.channel
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegB_srcModifier), // Possible src b modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegB_regType), thisInstruction.instructionStruct.srcRegB_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegB_component) ); // srcRegType%u.channel
			break;
		case Op_SGE:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(%s(%s%llu.%c) >= %s(%s%llu.%c) ? 1.0f : 0.0f);\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component), // srcRegType%u.channel
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegB_srcModifier), // Possible src b modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegB_regType), thisInstruction.instructionStruct.srcRegB_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegB_component) ); // srcRegType%u.channel
			break;
		case Op_SGN:
			sprintf(disasmBuffer, "\t%s%llu.%c = %s(sign(%s(%s%llu.%c) ) );\n",
				InstructionDestRegToString(thisInstruction.instructionStruct.destReg_regType), thisInstruction.instructionStruct.destReg_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.destReg_component), // destRegType%u.channel
				thisInstruction.instructionStruct.destReg_destModifier == DRMod_Sat ? "saturate" : "", // Possible saturate dest modifier
				InstructionSrcRegModToDecompileString(thisInstruction.instructionStruct.srcRegA_srcModifier), // Possible src a modifier
				InstructionSrcRegToString(thisInstruction.instructionStruct.srcRegA_regType), thisInstruction.instructionStruct.srcRegA_regIndex, GetRegChannelLetterFromChannelIndex(thisInstruction.instructionStruct.srcRegA_component) ); // srcRegType%u.channel
			break;
		}
#pragma warning(pop)
		PrintNewLine(codeLines, disasmBuffer);
	}

	PrintNewLine(codeLines, "\t\n");
	PrintNewLine(codeLines, "\tret.outPos = o0;\n");
	PrintNewLine(codeLines, "\tret.color = o1;\n");
	PrintNewLine(codeLines, "\tret.texCoord = o2.xy;\n");
	// TODO: If we add new vertex exports in the future (pointsize, fog, etc.) then we'll need to add more lines here!

	PrintNewLine(codeLines, "\treturn ret;\n");

	PrintNewLine(codeLines, "}\n");

	ConvertStringLinesToCharBuffer(codeLines, outBuffer);
}

// TODO: Put a hash&cache in front of this so that we don't pay the cost of recompiling a vertex shader every time we load another one if it's the same one every frame.
LPD3DXBUFFER ReverseCompileShaderToD3D9Bytecode(const void* const shaderHeader, const void* const shaderTokensStart, const unsigned shaderTokensLength)
{
	std::vector<D3DXMACRO> defines;

	const DeviceShaderHeader* const typedShaderHeader = static_cast<const DeviceShaderHeader* const>(shaderHeader);

	LPD3DXBUFFER outBytecode = NULL;
	LPD3DXBUFFER errorMessages = NULL;
	DWORD flags = D3DXSHADER_AVOID_FLOW_CONTROL | D3DXSHADER_PARTIALPRECISION; // Branching isn't currently well-supported in the software shader system
#ifdef _DEBUG
	flags |= D3DXSHADER_DEBUG;
#else
	flags |= D3DXSHADER_OPTIMIZATION_LEVEL3;
#endif

	std::vector<char> decompiledShaderText;
	ReverseCompileShaderToD3D9ShaderText(typedShaderHeader, static_cast<const instructionSlot* const>(shaderTokensStart), shaderTokensLength, decompiledShaderText);
	HRESULT hr = E_FAIL;
	hr = D3DXCompileShader(&decompiledShaderText.front(), (const UINT)decompiledShaderText.size(), defines.empty() ? NULL : &defines.front(), NULL, 
		"main", "vs_3_0", flags, &outBytecode, &errorMessages, NULL);
	if (FAILED(hr) || !outBytecode)
	{
		const char* const errorMessage = errorMessages ? ( (const char* const)errorMessages->GetBufferPointer() ) : NULL;

		printf("%s", errorMessage); // Don't optimize this away

#ifdef _DEBUG
		__debugbreak();
#endif
		return NULL;
	}

#ifdef _DEBUG
	const char* const debugErrorMessage = errorMessages ? ( (const char* const)errorMessages->GetBufferPointer() ) : NULL;
	UNREFERENCED_PARAMETER(debugErrorMessage);
#endif

	if (errorMessages)
	{
		errorMessages->Release();
		errorMessages = NULL;
	}

	return outBytecode;
}
