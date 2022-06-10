#pragma once

#include "ShaderAnalysis.h"
#include <intrin.h> // for popcnt()

static inline void dprintf(ShaderInfo& shaderInfo, const char* const formatString, ...)
{
	char buffer[1024] = {0};

	va_list args;
	va_start(args, formatString);
#pragma warning(push)
#pragma warning(disable:4996)
	const int len = vsprintf(buffer, formatString, args);
#pragma warning(pop)
	va_end(args);

	if (len > 0)
	{
		shaderInfo.shaderDisasmText.insert(shaderInfo.shaderDisasmText.end(), buffer, buffer + len);
	}
}

void ShaderInfo::PrintShaderStatsToString(char (&outBuffer)[1024]) const
{
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(outBuffer, "Shader Version: %cs_%u_%u\n"
		"Shader Length (tokens): %u\n"
		"Instructions (ALU/TEX): %u/%u\n"
		"Temp registers used (r registers): %u/%u\n"
		"Input registers used (v registers): %u/%u\n"
		"Float constant registers used (c registers): %u\n"
		"Integer constant registers used (i registers): %u/%u\n"
		"Bool constant registers used (b registers): %u/%u\n"
		"Uses dynamic branching: %s\n"
		"Uses function calls: %s\n"
		"Uses int to float conversions: %s\n"
		"Uses TEXKILL instructions: %s\n"
		"Uses gradient instructions: %s\n"
		"Uses instruction predication: %s\n"
		"Uses scalar instruction co-issuing: %s\n"
		"Uses custom depth output: %s\n"
		"Uses vertex texture fetch (VTF): %s\n"
		"Uses multiple render targets (MRT): %s\n"
		"Has dependent texture fetches: %s\n",
		isPixelShader ? 'p' : 'v', shaderMajorVersion, shaderMinorVersion,
		shaderLengthDWORDs,
		numArithInstructions, numTexInstructions,
		numUniqueTempRegistersUsed, MAX_NUM_TEMP_REGISTERS,
		numUniqueInputRegistersUsed, isPixelShader ? ( (shaderMajorVersion < 2) ? 8 : 10) : 16,
		usedConstantsF.size(),
		usedConstantsI.size(), MAX_NUM_CONST_INT_REGISTERS,
		usedConstantsB.size(), MAX_NUM_CONST_BOOL_REGISTERS,
		usesDynamicBranching ? "TRUE" : "FALSE",
		usesFunctionCalls ? "TRUE" : "FALSE",
		usesIntToFloatConversions ? "TRUE" : "FALSE",
		usesTexkill ? "TRUE" : "FALSE",
		usesGradientInstructions ? "TRUE" : "FALSE",
		usesInstructionPredication ? "TRUE" : "FALSE",
		usesInstructionCoIssue ? "TRUE" : "FALSE",
		psWritesDepth ? "TRUE" : "FALSE",
		usesVertTextureFetch ? "TRUE" : "FALSE",
		usesMRT ? "TRUE" : "FALSE",
		hasDependentTextureFetches ? "TRUE" : "FALSE");
#pragma warning(pop)
}

// Note that ResolveDstParameter<print> also increments the bytecode stream pointer given to it
template <const bool print, const bool modifyRegister>
static inline void ResolveDstParameter(const DWORD*& bytecode, ShaderInfo& shaderInfo, unsigned long& uniqueTempRegistersUsed, outputRegisterWriteTracker& outRegisterwriteTracker)
{
	const dstParameterToken& dstParameter = *(const dstParameterToken* const)bytecode;
	const D3DSHADER_PARAM_REGISTER_TYPE registerType = dstParameter.GetRegisterType();
	unsigned index = dstParameter.GetRegisterIndex();

	const bool usesRelativeAddressing = dstParameter.GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE;

	const unsigned registerWriteMask = dstParameter.GetWriteMask();

	switch (registerType)
	{
	case D3DSPR_TEMP       :
		if (print) dprintf(shaderInfo, "r");
		uniqueTempRegistersUsed |= (1 << index);
		break;
	case D3DSPR_INPUT      :
		if (print) dprintf(shaderInfo, "v");
		break;
	case D3DSPR_CONST      :
	case D3DSPR_CONST2     :
	case D3DSPR_CONST3     :
	case D3DSPR_CONST4     :
		if (print) dprintf(shaderInfo, "c");
		break;
	case D3DSPR_ADDR       : // Also known as D3DSPR_TEXTURE (PS)
		if (print)
		{
			shaderInfo.isPixelShader ? dprintf(shaderInfo, "t") : dprintf(shaderInfo, "a");
		}
		break;
	case D3DSPR_RASTOUT    :
		if (modifyRegister)
			outRegisterwriteTracker.SetAddOrSkip(registerType, index, (const BYTE)registerWriteMask, dstParameter, (const instructionToken* const)(bytecode - 1), usesRelativeAddressing ? (const dstParameterToken* const)(bytecode + 1) : NULL);

		if (shaderInfo.isPixelShader)
		{
			if (print) dprintf(shaderInfo, "RASTOUT");
		}
		else
		{
			switch (index)
			{
			case D3DSRO_POSITION:
				if (print) dprintf(shaderInfo, "oPos");
				break;
			case D3DSRO_FOG:
				if (print) dprintf(shaderInfo, "oFog");
				break;
			case D3DSRO_POINT_SIZE:
				if (print) dprintf(shaderInfo, "oPSize");
				break;
			default:
				if (print) dprintf(shaderInfo, "Unknown RASTOUT index specified (%u)", index);
				break;
			}
		}
		break;
	case D3DSPR_ATTROUT    :
		if (modifyRegister)
			outRegisterwriteTracker.SetAddOrSkip(registerType, index, (const BYTE)registerWriteMask, dstParameter, (const instructionToken* const)(bytecode - 1), usesRelativeAddressing ? (const dstParameterToken* const)(bytecode + 1) : NULL);

		if (print) dprintf(shaderInfo, "ATTROUT");
		break;
	case D3DSPR_OUTPUT  : // Also known as D3DSPR_TEXCRDOUT
		if (modifyRegister)
			outRegisterwriteTracker.SetAddOrSkip(registerType, index, (const BYTE)registerWriteMask, dstParameter, (const instructionToken* const)(bytecode - 1), usesRelativeAddressing ? (const dstParameterToken* const)(bytecode + 1) : NULL);

		if (print) dprintf(shaderInfo, "o");
		break;
	case D3DSPR_CONSTINT   :
		if (print) dprintf(shaderInfo, "i");
		break;
	case D3DSPR_COLOROUT   :
		if (modifyRegister)
			outRegisterwriteTracker.SetAddOrSkip(registerType, index, (const BYTE)registerWriteMask, dstParameter, (const instructionToken* const)(bytecode - 1), usesRelativeAddressing ? (const dstParameterToken* const)(bytecode + 1) : NULL);

		if (print) dprintf(shaderInfo, "oC");
		if (shaderInfo.isPixelShader)
		{
			shaderInfo.usedMRTMask |= (1 << index);
		}
		else
		{
			// Only pixel shaders can write to the oC# registers
			shaderInfo.parsingErrorDetected = true;
		}
		break;
	case D3DSPR_DEPTHOUT   :
		if (modifyRegister)
			outRegisterwriteTracker.SetAddOrSkip(registerType, index, (const BYTE)registerWriteMask, dstParameter, (const instructionToken* const)(bytecode - 1), usesRelativeAddressing ? (const dstParameterToken* const)(bytecode + 1) : NULL);

		if (print) dprintf(shaderInfo, "oDepth");
		if (shaderInfo.isPixelShader)
			shaderInfo.psWritesDepth = true;
		break;
	case D3DSPR_SAMPLER    :
		if (print) dprintf(shaderInfo, "s");
		break;
	case D3DSPR_CONSTBOOL  :
		if (print) dprintf(shaderInfo, "b");
		break;
	case D3DSPR_LOOP       :
		if (print) dprintf(shaderInfo, "aL");
		break;
	case D3DSPR_TEMPFLOAT16:
		if (print) dprintf(shaderInfo, "r");
		break;
	case D3DSPR_MISCTYPE   :
		if (print) dprintf(shaderInfo, "MISC");
		break;
	case D3DSPR_LABEL      :
		if (print) dprintf(shaderInfo, "LABEL");
		break;
	case D3DSPR_PREDICATE  :
		if (print) dprintf(shaderInfo, "p");
		break;
	default:
#ifdef _DEBUG
		{
			DbgBreakPrint("Error: Unknown shader register");
		}
#endif
		break;
	}

	// Print register index:
	switch (registerType)
	{
	case D3DSPR_CONST	   :
		break;
	case D3DSPR_CONST2     :
		index += 2048;
		break;
	case D3DSPR_CONST3     :
		index += 4096;
		break;
	case D3DSPR_CONST4     :
		index += 6144;
		break;
	default:
		break;
	}
	if (print) dprintf(shaderInfo, "%u", index);

	const unsigned resultModifier = dstParameter.GetResultModifierUnshifted();
	if (resultModifier & D3DSPDM_SATURATE)
		if (print) dprintf(shaderInfo, "_sat");
	if (resultModifier & D3DSPDM_PARTIALPRECISION)
		if (print) dprintf(shaderInfo, "_pp");
	if (resultModifier & D3DSPDM_MSAMPCENTROID)
		if (print) dprintf(shaderInfo, "_centroid");

	if (usesRelativeAddressing)
	{
		const dstParameterToken& relativeDstParameter = *(const dstParameterToken* const)(bytecode + 1);
		if (print) dprintf(shaderInfo, "[");
		switch (relativeDstParameter.GetRegisterType() )
		{
		case D3DSPR_ADDR:
			if (print) dprintf(shaderInfo, "a");
			break;
		case D3DSPR_LOOP:
			if (print) dprintf(shaderInfo, "aL");
			break;
		default:
#ifdef _DEBUG
			__debugbreak();
#endif
			if (print) dprintf(shaderInfo, "Error: Invalid relative offset register type specified (%u)!", relativeDstParameter.GetRegisterType() );
			break;
		}
		if (print) dprintf(shaderInfo, "%u", relativeDstParameter.GetRegisterIndex() );

		const unsigned relativeRegisterWriteMask = relativeDstParameter.GetWriteMask();
		if (relativeRegisterWriteMask != 0xF) // Omit displaying ".xyzw" after every register because it gets annoying!
		{
			bool writeMaskDotApplied = false;
			if (relativeRegisterWriteMask & 0x1) // x
			{
				if (print) dprintf(shaderInfo, ".x");
				writeMaskDotApplied = true;
			}
			if (relativeRegisterWriteMask & 0x2) // y
			{
				if (!writeMaskDotApplied)
				{
					if (print) dprintf(shaderInfo, ".y");
				}
				else
				{
					if (print) dprintf(shaderInfo, "y");
				}
				writeMaskDotApplied = true;
			}
			if (relativeRegisterWriteMask & 0x4) // z
			{
				if (!writeMaskDotApplied)
				{
					if (print) dprintf(shaderInfo, ".z");
				}
				else
				{
					if (print) dprintf(shaderInfo, "z");
				}
				writeMaskDotApplied = true;
			}
			if (relativeRegisterWriteMask & 0x8) // w
			{
				if (!writeMaskDotApplied)
				{
					if (print) dprintf(shaderInfo, ".w");
				}
				else
				{
					if (print) dprintf(shaderInfo, "w");
				}
			}
		}

		if (print) dprintf(shaderInfo, "]");

		// Super important to do this or else the byte-stream gets broken after the relative addressing token!
		++bytecode;
	}

	// Handle write masks:
	if (registerWriteMask != 0xF) // Omit displaying ".xyzw" after every register because it gets annoying!
	{
		bool writeMaskDotApplied = false;
		if (registerWriteMask & 0x1) // x
		{
			if (print) dprintf(shaderInfo, ".x");
			writeMaskDotApplied = true;
		}
		if (registerWriteMask & 0x2) // y
		{
			if (!writeMaskDotApplied)
			{
				if (print) dprintf(shaderInfo, ".y");
			}
			else
			{
				if (print) dprintf(shaderInfo, "y");
			}
			writeMaskDotApplied = true;
		}
		if (registerWriteMask & 0x4) // z
		{
			if (!writeMaskDotApplied)
			{
				if (print) dprintf(shaderInfo, ".z");
			}
			else
			{
				if (print) dprintf(shaderInfo, "z");
			}
			writeMaskDotApplied = true;
		}
		if (registerWriteMask & 0x8) // w
		{
			if (!writeMaskDotApplied)
			{
				if (print) dprintf(shaderInfo, ".w");
			}
			else
			{
				if (print) dprintf(shaderInfo, "w");
			}
		}
	}

	const unsigned shiftScale = dstParameter.GetResultShiftScale();
	if (shiftScale != 0)
	{
		if (shiftScale > 0x7)
		{
			// Multiply
			if (print) dprintf(shaderInfo, "_x%u", shiftScale & 0x7);
		}
		else
		{
			// Divide
			if (print) dprintf(shaderInfo, "_d%u", shiftScale & 0x7);
		}
	}

	// Super important to do this!
	++bytecode;
}

static inline void AddIfNotPresent(std::vector<unsigned>& vals, const unsigned val)
{
	const unsigned numVals = vals.size();
	for (unsigned x = 0; x < numVals; ++x)
	{
		if (vals[x] == val)
			return;
	}

	vals.push_back(val);
}

// Note that ResolveSrcParameter<print> also increments the bytecode stream pointer given to it
template <const bool print>
static inline void ResolveSrcParameter(ShaderInfo& shaderInfo, const DWORD*& bytecode, const bool isPixelShader, unsigned long& uniqueTempRegistersUsed, unsigned short& uniqueInputRegistersUsed)
{
	const srcParameterToken& srcParameter = *(const srcParameterToken* const)bytecode;

	const D3DSHADER_PARAM_SRCMOD_TYPE sourceMod = srcParameter.GetSourceModifiersUnshifted();
	switch (sourceMod)
	{
	case D3DSPSM_NONE   :
	case D3DSPSM_BIAS   :
	case D3DSPSM_SIGN   :
	case D3DSPSM_COMP   :
	case D3DSPSM_X2     :
	case D3DSPSM_DW     :
	case D3DSPSM_DZ     :
		break;
	case D3DSPSM_NEG    :
	case D3DSPSM_BIASNEG:
	case D3DSPSM_SIGNNEG:
	case D3DSPSM_X2NEG  :
		if (print) dprintf(shaderInfo, "-");
		break;
	case D3DSPSM_ABS    :
		if (print) dprintf(shaderInfo, "abs(");
		break;
	case D3DSPSM_ABSNEG :
		if (print) dprintf(shaderInfo, "-abs(");
		break;
	case D3DSPSM_NOT    :
		if (print) dprintf(shaderInfo, "!");
		break;
	default:
		if (print) dprintf(shaderInfo, " Error: Unknown source modifier (%u) ", sourceMod >> D3DSP_SRCMOD_SHIFT);
		break;
	}

	unsigned index = srcParameter.GetRegisterIndex();

	const D3DSHADER_PARAM_REGISTER_TYPE registerType = srcParameter.GetRegisterType();
	switch (registerType)
	{
	case D3DSPR_TEMP       :
		if (print) dprintf(shaderInfo, "r");
		uniqueTempRegistersUsed |= (1 << index);
		break;
	case D3DSPR_INPUT      :
		if (print) dprintf(shaderInfo, "v");
		uniqueInputRegistersUsed |= (1 << index);
		break;
	case D3DSPR_CONST      :
	case D3DSPR_CONST2     :
	case D3DSPR_CONST3     :
	case D3DSPR_CONST4     :
		if (print) dprintf(shaderInfo, "c");
		break;
	case D3DSPR_ADDR       : // Also known as D3DSPR_TEXTURE (PS)
		if (print)
		{
			isPixelShader ? dprintf(shaderInfo, "t") : dprintf(shaderInfo, "a");
		}
		if (shaderInfo.isPixelShader)
		{
			if (shaderInfo.shaderMajorVersion < 3)
				uniqueInputRegistersUsed |= (1 << (index + D3DMCS_COLOR2) ); // +2 for the Diffuse and Specular color registers
			else
				uniqueInputRegistersUsed |= (1 << index);
		}
		break;
	case D3DSPR_RASTOUT    :
		if (print) dprintf(shaderInfo, "RASTOUT");
		break;
	case D3DSPR_ATTROUT    :
		if (print) dprintf(shaderInfo, "ATTROUT");
		break;
	case D3DSPR_TEXCRDOUT  : // Also known as D3DSPR_OUTPUT
		if (print) dprintf(shaderInfo, "oT");
		break;
	case D3DSPR_CONSTINT   :
		if (print) dprintf(shaderInfo, "i");
		break;
	case D3DSPR_COLOROUT   :
		if (print) dprintf(shaderInfo, "oC");
		break;
	case D3DSPR_DEPTHOUT   :
		if (print) dprintf(shaderInfo, "oDepth");
		break;
	case D3DSPR_SAMPLER    :
		if (print) dprintf(shaderInfo, "s");
		break;
	case D3DSPR_CONSTBOOL  :
		if (print) dprintf(shaderInfo, "b");
		break;
	case D3DSPR_LOOP       :
		if (print) dprintf(shaderInfo, "aL");
		break;
	case D3DSPR_TEMPFLOAT16:
		if (print) dprintf(shaderInfo, "r");
		break;
	case D3DSPR_MISCTYPE   :
		if (print) dprintf(shaderInfo, "MISC");
		break;
	case D3DSPR_LABEL      :
		if (print) dprintf(shaderInfo, "LABEL");
		break;
	case D3DSPR_PREDICATE  :
		if (print) dprintf(shaderInfo, "p");
		break;
	default:
#ifdef _DEBUG
		{
			DbgBreakPrint("Error: Unknown shader register");
		}
#endif
		break;
	}

	// Print register index:
	switch (registerType)
	{
	case D3DSPR_CONST:
		break;
	case D3DSPR_CONST2     :
		index += 2048;
		break;
	case D3DSPR_CONST3     :
		index += 4096;
		break;
	case D3DSPR_CONST4     :
		index += 6144;
		break;
	default:
		break;
	}
	if (print) dprintf(shaderInfo, "%u", index);

	// Populate the "used constants" shader info:
	switch (registerType)
	{
	case D3DSPR_CONST:
	case D3DSPR_CONST2:
	case D3DSPR_CONST3:
	case D3DSPR_CONST4:
		// TODO: Account for the fact that the mAxB (ie. m2x2, m4x3, etc.) series of instructions only reference the first constF register in a consecutive range of constF registers (2, 3, or 4 constF registers)
		AddIfNotPresent(shaderInfo.usedConstantsF, index);
		break;
	case D3DSPR_CONSTINT:
		AddIfNotPresent(shaderInfo.usedConstantsI, index);
		break;
	case D3DSPR_CONSTBOOL:
		AddIfNotPresent(shaderInfo.usedConstantsB, index);
		break;
	default:
		break;
	}

	switch (sourceMod)
	{
	default:
	case D3DSPSM_NONE   :
	case D3DSPSM_NOT    :
	case D3DSPSM_NEG    :
		break;
	case D3DSPSM_BIAS   :
	case D3DSPSM_BIASNEG:
		if (print) dprintf(shaderInfo, "_bias");
		break;
	case D3DSPSM_SIGN   :
	case D3DSPSM_SIGNNEG:
		if (print) dprintf(shaderInfo, "_bx2");
		break;
	case D3DSPSM_COMP   :
		if (print) dprintf(shaderInfo, "_complement");
		break;
	case D3DSPSM_X2     :
	case D3DSPSM_X2NEG  :
		if (print) dprintf(shaderInfo, "_x2");
		break;
	case D3DSPSM_DZ     :
		if (print) dprintf(shaderInfo, "_dz");
		break;
	case D3DSPSM_DW     :
		if (print) dprintf(shaderInfo, "_dw");
		break;
	case D3DSPSM_ABS    :
	case D3DSPSM_ABSNEG :
		if (print) dprintf(shaderInfo, ")");
		break;
	}

	if (srcParameter.GetRelativeAddressingType() == D3DSHADER_ADDRMODE_RELATIVE)
	{
		// Hack: If we're doing vs_1_* then the only register and only mask that can be used for relative addressing is the a0.x
		if (shaderInfo.shaderMajorVersion == 1)
		{
			if (print) dprintf(shaderInfo, "[a0.x]");

			// Do *not* advance the tokenstream in this special case!
		}
		else
		{
			const srcParameterToken& relativeSrcParameter = *(const srcParameterToken* const)(bytecode + 1);
			if (print) dprintf(shaderInfo, "[");
			const D3DSHADER_PARAM_REGISTER_TYPE relativeRegisterType = relativeSrcParameter.GetRegisterType();
			switch (relativeRegisterType)
			{
			case D3DSPR_ADDR:
				if (print) dprintf(shaderInfo, "a");
				break;
			case D3DSPR_LOOP:
				if (print) dprintf(shaderInfo, "aL");
				break;
			default:
#ifdef _DEBUG
				__debugbreak();
#endif
				if (print) dprintf(shaderInfo, "Error: Invalid relative offset register type specified (%u)!", relativeRegisterType);
				break;
			}
			if (print) dprintf(shaderInfo, "%u", relativeSrcParameter.GetRegisterIndex() );

			const unsigned channelSwizzle = relativeSrcParameter.GetChannelSwizzleXYZW();
			switch (channelSwizzle)
			{
			case D3DVS_NOSWIZZLE >> D3DVS_SWIZZLE_SHIFT: // .xyzw
				break; // Don't print .xyzw all the time
			case D3DSP_REPLICATERED >> D3DVS_SWIZZLE_SHIFT: // .x
				if (print) dprintf(shaderInfo, ".x");
				break;
			case D3DSP_REPLICATEGREEN >> D3DVS_SWIZZLE_SHIFT: // .y
				if (print) dprintf(shaderInfo, ".y");
				break;
			case D3DSP_REPLICATEBLUE >> D3DVS_SWIZZLE_SHIFT: // .z
				if (print) dprintf(shaderInfo, ".z");
				break;
			case D3DSP_REPLICATEALPHA >> D3DVS_SWIZZLE_SHIFT: // .w
				if (print) dprintf(shaderInfo, ".w");
				break;
			default:
			{
				if (print)
				{
					static const char* const channelName[4] =
					{
						"x",
						"y",
						"z",
						"w"
					};

					dprintf(shaderInfo, ".%s", channelName[channelSwizzle & 0x3]);
					dprintf(shaderInfo, "%s", channelName[(channelSwizzle >> 2) & 0x3]);
					dprintf(shaderInfo, "%s", channelName[(channelSwizzle >> 4) & 0x3]);
					dprintf(shaderInfo, "%s", channelName[(channelSwizzle >> 6) & 0x3]);
				}
			}
				break;
			}

			if (print) dprintf(shaderInfo, "]");

			// Super important to do this, otherwise the bytecode stream gets broken after the relative addressing token!
			++bytecode;
		}
	}

	const unsigned channelSwizzle = srcParameter.GetChannelSwizzleXYZW();
	switch (channelSwizzle)
	{
	case D3DVS_NOSWIZZLE >> D3DVS_SWIZZLE_SHIFT: // .xyzw
		break; // Don't print .xyzw all the time
	case D3DSP_REPLICATERED >> D3DVS_SWIZZLE_SHIFT: // .x
		if (print) dprintf(shaderInfo, ".x");
		break;
	case D3DSP_REPLICATEGREEN >> D3DVS_SWIZZLE_SHIFT: // .y
		if (print) dprintf(shaderInfo, ".y");
		break;
	case D3DSP_REPLICATEBLUE >> D3DVS_SWIZZLE_SHIFT: // .z
		if (print) dprintf(shaderInfo, ".z");
		break;
	case D3DSP_REPLICATEALPHA >> D3DVS_SWIZZLE_SHIFT: // .w
		if (print) dprintf(shaderInfo, ".w");
		break;
	default:
	{
		if (print)
		{
			static const char* const channelName[4] =
			{
				"x",
				"y",
				"z",
				"w"
			};

			dprintf(shaderInfo, ".%s", channelName[channelSwizzle & 0x3]);
			dprintf(shaderInfo, "%s", channelName[(channelSwizzle >> 2) & 0x3]);
			dprintf(shaderInfo, "%s", channelName[(channelSwizzle >> 4) & 0x3]);
			dprintf(shaderInfo, "%s", channelName[(channelSwizzle >> 6) & 0x3]);
		}
	}
		break;
	}

	// Super important to advance the bytecode stream
	++bytecode;
}

struct ShaderComment_DBUG
{
	DWORD magic; // Should always be 'DBUG'
	DWORD size; // Should always be 0x28
	DWORD unknown0; // Seems to be 0x0290 (656 in dec)
	DWORD zero0;
	DWORD one0;
	DWORD unknown1; // Seems to be 0xA4 (164 in dec)
	DWORD unknown2; // Seems to be 0x19 (25 in dec)
	DWORD unknown3; // Seems to be 0xA8 (168 in dec)
	DWORD unknown4; // Seems to be 0x04
	DWORD unknown5; // Seems to be 0x0240 (576 in dec)
	DWORD unknown6; // Seems to be 0x0170 (368 in dec)
	char filename[1];
};

struct ShaderComment_CTAB
{
	DWORD magic; // Should always be 'CTAB'
	DWORD size; // Should always be 0x1C
	DWORD unknown0; // Seems to be 0x97 (151 dec)
	signed short unknown1; // Seems to be 0xFFFE (-2 in signed int)
	unsigned short unknown2; // Seems to be 0x200 (512 in dec)
	DWORD unknown3; // Seems to be 0x3 (the number of named global constants?)
	DWORD unknown4; // Seems to be 0x1C again
	DWORD unknown5; // Seems to be 0x105 (261 dec)
	DWORD unknown6; // Seems to be 0x90 (144 dec)
	DWORD unknown7; // Seems to be 0x58 (88 dec)
	unsigned short unknown8; // Seems to be 0x2
	unsigned short unknown9; // Seems to be 0x8
	unsigned short unknown10; // Seems to be 0x100 (256 dec)
	unsigned short unknown11; // Seems to be 0x2200 (8704 dec)
	unsigned short unknown12; // Seems to be 0x6400 (25600 dec)
	unsigned short zero0;
};

static const char* const usageStrings[] =
{
	"_POSITION",
	"_BLENDWEIGHT", 
	"_BLENDINDICES",
	"_NORMAL",      
	"_PSIZE",       
	"_TEXCOORD",    
	"_TANGENT",     
	"_BINORMAL",    
	"_TESSFACTOR",  
	"_POSITIONT",   
	"_COLOR",       
	"_FOG",         
	"_DEPTH",       
	"_SAMPLE"
};

template <const bool print>
static inline const bool ParseCustomOpcode(const D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode, const DWORD*& shaderMemory, ShaderInfo& shaderInfo, unsigned long& uniqueTempRegistersUsed, unsigned short& uniqueInputRegistersUsed, outputRegisterWriteTracker& outRegisterwriteTracker)
{
	if (print) dprintf(shaderInfo, "%s ", GetOpcodeString(opcode) );

	switch (opcode)
	{
	case D3DSIO_LABEL:
	{
		ShaderLabel newLabel;
		const srcParameterToken& srcParameter = *(const srcParameterToken* const)shaderMemory;
		newLabel.labelIndex = srcParameter.GetRegisterIndex();
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed); // Note that ResolveSrcParameter<print> also increments the bytecode stream pointer given to it
		newLabel.firstPostLabelToken = shaderMemory;
		shaderInfo.labels.push_back(newLabel);
	}
		break;
	case D3DSIO_DCL:
	{
		const DWORD dwordToken = *shaderMemory++;
		const dstParameterToken& dstParameter = *(const dstParameterToken* const)shaderMemory++;
		const D3DSHADER_PARAM_REGISTER_TYPE registerType = dstParameter.GetRegisterType();

		const D3DDECLUSAGE usage = (const D3DDECLUSAGE)( (dwordToken & D3DSP_DCL_USAGE_MASK) >> D3DSP_DCL_USAGE_SHIFT);
		const unsigned usageIndex = (dwordToken & D3DSP_DCL_USAGEINDEX_MASK) >> D3DSP_DCL_USAGEINDEX_SHIFT;

		DeclaredRegister newRegisterDcl;
		newRegisterDcl.isOutputRegister = registerType == D3DSPR_OUTPUT;
		newRegisterDcl.registerIndex = dstParameter.GetRegisterIndex();
		newRegisterDcl.registerType = registerType;
		newRegisterDcl.writeMask = dstParameter.GetWriteMask();
		newRegisterDcl.usageType = usage;
		newRegisterDcl.usageIndex = usageIndex;
		newRegisterDcl.miscInfo.uintData = 0;

		// Decode the DWORD token depending on the type of the Dst parameter
		switch (registerType)
		{
		case D3DSPR_SAMPLER:
		{
			const D3DSAMPLER_TEXTURE_TYPE textureType = (const D3DSAMPLER_TEXTURE_TYPE)(dwordToken & D3DSP_TEXTURETYPE_MASK);
			switch (textureType)
			{
			default:
				if (print) dprintf(shaderInfo, "Unknown sampler type (%u)\n", textureType >> D3DSP_TEXTURETYPE_SHIFT);
				break;
			case D3DSTT_UNKNOWN:
				if (print) dprintf(shaderInfo, "Unknown sampler type\n");
				break;
			case D3DSTT_2D     :
				if (print) dprintf(shaderInfo, "_2d");
				break;
			case D3DSTT_CUBE   :
				if (print) dprintf(shaderInfo, "_cube");
				break;
			case D3DSTT_VOLUME :
				if (print) dprintf(shaderInfo, "_volume");
				break;
			}
			newRegisterDcl.miscInfo.textureType = textureType;
			break;
		}
		case D3DSPR_TEXTURE:
		{
			// Nothing special here!
		}
			break;

		case D3DSPR_INPUT:
		{
			if (print) dprintf(shaderInfo, "%s", usageStrings[usage]);
			if (print) dprintf(shaderInfo, "%u ", usageIndex);
		}
			break;
		case D3DSPR_OUTPUT:
		{
			const DWORD* temp = &dstParameter.internalRawToken;
			ResolveDstParameter<print, false>(temp, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		}
			break;
		case D3DSPR_MISCTYPE: // Either VPOS (0) or FACE (1)
		{
			const D3DSHADER_MISCTYPE_OFFSETS miscRegisterType = (const D3DSHADER_MISCTYPE_OFFSETS)dstParameter.GetRegisterIndex();
			switch (miscRegisterType)
			{
			case D3DSMO_POSITION:
				if (print) dprintf(shaderInfo, "_VPOS");
				break;
			case D3DSMO_FACE:
				if (print) dprintf(shaderInfo, "_FACE");
				break;
			default:
				if (print) dprintf(shaderInfo, "Error: Unknown MISC register file index (%u)", miscRegisterType);
				break;
			}

			newRegisterDcl.miscInfo.miscInputType = miscRegisterType;
		}
			break;
		default:
			break;
		}

		shaderInfo.declaredRegisters.push_back(newRegisterDcl);

		if (print) dprintf(shaderInfo, " ");

		// Print the register afterwards:
		{
			const DWORD* temp = &dstParameter.internalRawToken;
			ResolveDstParameter<print, false>(temp, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		}

		// Print the usage for this decl after that (this isn't what D3DXDisasm does, but it really helps with debugging shaders to have it shown somewhere)
		if (print)
		{
			dprintf(shaderInfo, " : %s%u", usageStrings[usage], usageIndex);
		}
	}
		break;
	case D3DSIO_SINCOS:
		ResolveDstParameter<print, true>(shaderMemory, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (shaderInfo.shaderMajorVersion < 3) // Shader model 2 has these extra registers, but all the shader model 3+ don't have them
		{
			if (print) dprintf(shaderInfo, ", ");
			ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
			if (print) dprintf(shaderInfo, ", ");
			ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		}
		break;
	case D3DSIO_DEFB:
	{
		InitialConstantValueB newConstantB;
		const dstParameterToken& dstParameter = *(const dstParameterToken* const)shaderMemory;
		newConstantB.constantRegisterIndex = dstParameter.GetRegisterIndex();
		ResolveDstParameter<print, false>(shaderMemory, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		const DWORD dwordData = *shaderMemory++;
		const BOOL bData = (const BOOL)(dwordData);
		if (bData)
		{
			if (print) dprintf(shaderInfo, ", TRUE");
			newConstantB.initialValue = TRUE;
		}
		else
		{
			if (print) dprintf(shaderInfo, ", FALSE");
			newConstantB.initialValue = FALSE;
		}

		shaderInfo.initialConstantValuesB.push_back(newConstantB);
	}
		break;
	case D3DSIO_DEFI:
	{
		InitialConstantValueI newConstantI;
		const dstParameterToken& dstParameter = *(const dstParameterToken* const)shaderMemory;
		newConstantI.constantRegisterIndex = dstParameter.GetRegisterIndex();
		ResolveDstParameter<print, false>(shaderMemory, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		const DWORD dword0 = *shaderMemory++;
		newConstantI.initialValue.x = *(const int* const)&dword0;
		const DWORD dword1 = *shaderMemory++;
		newConstantI.initialValue.y = *(const int* const)&dword1;
		const DWORD dword2 = *shaderMemory++;
		newConstantI.initialValue.z = *(const int* const)&dword2;
		const DWORD dword3 = *shaderMemory++;
		newConstantI.initialValue.w = *(const int* const)&dword3;

		if (print) dprintf(shaderInfo, ", (%i, %i, %i, %i)", newConstantI.initialValue.x, newConstantI.initialValue.y, newConstantI.initialValue.z, newConstantI.initialValue.w);

		shaderInfo.initialConstantValuesI.push_back(newConstantI);
	}
		break;
	case D3DSIO_DEF:
	{
		InitialConstantValue newConstant;
		const dstParameterToken& dstParameter = *(const dstParameterToken* const)shaderMemory;
		newConstant.constantRegisterIndex = dstParameter.GetRegisterIndex();
		ResolveDstParameter<print, false>(shaderMemory, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		const DWORD dword0 = *shaderMemory++;
		newConstant.initialValue.x = *(const float* const)&dword0;
		const DWORD dword1 = *shaderMemory++;
		newConstant.initialValue.y = *(const float* const)&dword1;
		const DWORD dword2 = *shaderMemory++;
		newConstant.initialValue.z = *(const float* const)&dword2;
		const DWORD dword3 = *shaderMemory++;
		newConstant.initialValue.w = *(const float* const)&dword3;

		if (print) dprintf(shaderInfo, ", (%f, %f, %f, %f)", newConstant.initialValue.x, newConstant.initialValue.y, newConstant.initialValue.z, newConstant.initialValue.w);

		shaderInfo.initialConstantValues.push_back(newConstant);
	}
		break;
	case D3DSIO_TEX: // TEX means a whole lot of things. It can be tex from ps_1_0 thru ps_1_3, it can be texld from ps_1_4, or it can be texld for ps_1_4 and up.
		// Depending on the opcode controls, this can either be "plain texld/tex2D" (no controls), or texldp/tex2Dproj or texldb/tex2Dbias
		// Depending on the sampler source register, this can also be either tex1D, tex2D, tex3D, or texCUBE
	{
		ResolveDstParameter<print, true>(shaderMemory, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		if (shaderInfo.shaderMajorVersion < 2)
		{
			if (shaderInfo.shaderMinorVersion < 4)
			{
				// This is the ps_1_0 thru ps_1_3 case: https://docs.microsoft.com/en-us/windows/desktop/direct3dhlsl/tex---ps
				// Just T dst
			}
			else
			{
				// This is the ps_1_4 case: https://docs.microsoft.com/en-us/windows/desktop/direct3dhlsl/texld---ps-1-4
				// tex R dst, T/R src0
				if (print) dprintf(shaderInfo, ", ");
				ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
			}
		}
		else
		{
			// This is the ps_2_0+ case: https://docs.microsoft.com/en-us/windows/desktop/direct3dhlsl/texld---ps-2-0
			// tex R dst, T/R/V src0, S src1
			if (print) dprintf(shaderInfo, ", ");
			ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);

			if (print) dprintf(shaderInfo, ", ");
			ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		}
	}
		break;
	case D3DSIO_PHASE:
		break;
	case D3DSIO_COMMENT:
	{
		const DWORD commentToken = shaderMemory[-1];
		const unsigned numTokensToSkip = (commentToken & D3DSI_COMMENTSIZE_MASK) >> D3DSI_COMMENTSIZE_SHIFT;

		ShaderComment newComment;
		newComment.commentLengthTokens = numTokensToSkip;
		newComment.commentText = (const char* const)shaderMemory;
		shaderInfo.comments.push_back(newComment);

		switch (*shaderMemory)
		{
		case 'GUBD': // DBUG
		{
			const ShaderComment_DBUG* const dbug = (const ShaderComment_DBUG* const)shaderMemory;
			if (dbug->magic == 'GUBD')
			{
				if (dbug->size == 0x28)
				{
					if (print) dprintf(shaderInfo, "Shader compiled from: \"%s\"\n", dbug->filename);
				}
				else
				{
					if (print) dprintf(shaderInfo, "Error: Unexpected DBUG struct size detected! (Got %u, expected %u)\n", dbug->size, 0x28);
				}
			}
			else
			{
				if (print) dprintf(shaderInfo, "Error: Invalid DBUG struct magic value detected!\n");
			}
		}
			break;
		case 'BATC': // CTAB
		{
			const ShaderComment_CTAB* const ctab = (const ShaderComment_CTAB* const)shaderMemory;
			if (ctab->magic == 'BATC')
			{
				; // 
			}
			else
			{
				if (print) dprintf(shaderInfo, "Error: Invalid CTAB struct magic value detected!\n");
			}
		}
			break;
		}
		
		shaderMemory += numTokensToSkip;
	}
		break;
	case D3DSIO_END:
		if (print) dprintf(shaderInfo, "\n");
		shaderInfo.shaderLengthDWORDs = shaderMemory - shaderInfo.initialBytecodeToken;
		return true;
	default:
#ifdef _DEBUG
		DbgBreakPrint("Error: Unknown shader opcode");
#endif
		if (print) dprintf(shaderInfo, "Unknown opcode encountered (value 0x%08X)\n", opcode);
		break;
	}

	if (print) dprintf(shaderInfo, "\n");

	return false;
}

// Returns true if this opcode is a TEX instruction, or false otherwise
const bool ShaderInfo::IsOpcodeTexInstruction(const D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode)
{
	if (opcode <= D3DSIO_BREAKP)
		return isOpcodeTexInstruction[opcode];
	else
		return false;
}

static inline const bool IsDynamicBranchingInstruction(const D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode)
{
	if (opcode <= D3DSIO_BREAKP)
		return isDynamicBranchingInstruction[opcode];
	else
		return false;
}

static inline const int GetTabIndentModifier(const D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode)
{
	if (opcode <= D3DSIO_BREAKP)
		return instructionTabIndents[opcode];
	else
		return 0;
}

template <const bool print>
static inline const bool ParseOpcode(const DWORD*& shaderMemory, ShaderInfo& shaderInfo, unsigned long& uniqueTempRegistersUsed, unsigned short& uniqueInputRegistersUsed, int& tabIndents, outputRegisterWriteTracker& outRegisterwriteTracker)
{
	const instructionToken rawInstructionToken = *(const instructionToken* const)shaderMemory++;
	const D3DSHADER_INSTRUCTION_OPCODE_TYPE opcode = (const D3DSHADER_INSTRUCTION_OPCODE_TYPE)(rawInstructionToken.opcode);

	const bool opcodeIsTexInstruction = ShaderInfo::IsOpcodeTexInstruction(opcode);
	unsigned* const instructionCount = &(shaderInfo.numArithInstructions);
	++instructionCount[opcodeIsTexInstruction];

	const bool opcodeIsDynamicBranchInstruction = IsDynamicBranchingInstruction(opcode);
	if (opcodeIsDynamicBranchInstruction)
		shaderInfo.usesDynamicBranching = true;

	if (opcode == D3DSIO_TEXKILL)
		shaderInfo.usesTexkill = true;

	if (rawInstructionToken.predicated)
		shaderInfo.usesInstructionPredication = true;

	if (rawInstructionToken.coIssue)
		shaderInfo.usesInstructionCoIssue = true;

	if (opcode == D3DSIO_TEXDEPTH || opcode == D3DSIO_TEXM3x2DEPTH)
		shaderInfo.psWritesDepth = true;

	switch (opcode)
	{
	case D3DSIO_CALL:
	case D3DSIO_CALLNZ:
		shaderInfo.usesFunctionCalls = true;
		break;
	default:
		break;
	}

	if (!shaderInfo.firstInstructionToken)
	{
		switch (opcode)
		{
			// Skippable instructions:
		case D3DSIO_NOP:
		case D3DSIO_DCL:
		case D3DSIO_DEF:
		case D3DSIO_PHASE:
		case D3DSIO_COMMENT:
		case D3DSIO_END:
			break;
			// First non-skippable instruction:
		default:
			shaderInfo.firstInstructionToken = shaderMemory - 1;
			break;
		}
	}

	switch (opcode)
	{
	case D3DSIO_DSX:
	case D3DSIO_DSY:
		if (!shaderInfo.isPixelShader)
			shaderInfo.parsingErrorDetected = true; // ddx and ddy are only available for pixel shaders!
		shaderInfo.usesGradientInstructions = true;
		break;
	default:
		break;
	}

	// Handle tabs:
	if (print)
	{
		for (int x = 0; x < tabIndents; ++x)
			dprintf(shaderInfo, "\t");

		tabIndents += GetTabIndentModifier(opcode);
#ifdef _DEBUG
		if (tabIndents < 0)
		{
			DbgBreakPrint("Error: Tab indents negative");
		}
#endif
	}

	if (opcode == D3DSIO_MOV)
	{
		// Handle int->float conversion checks:
		const srcParameterToken& srcParameter = *(const srcParameterToken* const)(shaderMemory + 1);
		switch (srcParameter.GetRegisterType() )
		{
		case D3DSPR_CONSTINT:
		case D3DSPR_CONSTBOOL:
			shaderInfo.usesIntToFloatConversions = true;
			break;
		default:
			break;
		}

		// Handle MRT detection:
		if (shaderInfo.isPixelShader)
		{
			const dstParameterToken& dstParameter = *(const dstParameterToken* const)shaderMemory;
			if (dstParameter.GetRegisterType() == D3DSPR_COLOROUT)
			{
				const unsigned outputRegisterIndex = dstParameter.GetRegisterIndex();
				shaderInfo.usedMRTMask |= (1 << outputRegisterIndex);
			}
		}
	}

	if (rawInstructionToken.coIssue)
		if (print) dprintf(shaderInfo, "+ CO_");

	switch (GetOpcodeDisplayType(opcode) )
	{
	case customOpcode:
		return ParseCustomOpcode<print>(opcode, shaderMemory, shaderInfo, uniqueTempRegistersUsed, uniqueInputRegistersUsed, outRegisterwriteTracker);
	case justOpcode:
		if (print) dprintf(shaderInfo, "%s\n", GetOpcodeString(opcode) );
		break;
	case srcOnly:
		if (print) dprintf(shaderInfo, "%s ", GetOpcodeString(opcode) );
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, "\n");
		break;
	case srcSrcOnly:
		if (print) dprintf(shaderInfo, "%s ", GetOpcodeString(opcode) );
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, "\n");
		break;
	case dstOnly:
		if (print) dprintf(shaderInfo, "%s ", GetOpcodeString(opcode) );
		ResolveDstParameter<print, true>(shaderMemory, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		if (print) dprintf(shaderInfo, "\n");
		break;
	case srcDst:
		if (print) dprintf(shaderInfo, "%s ", GetOpcodeString(opcode) );
		ResolveDstParameter<print, true>(shaderMemory, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, "\n");
		break;
	case srcSrcDst:
		if (print) dprintf(shaderInfo, "%s ", GetOpcodeString(opcode) );
		ResolveDstParameter<print, true>(shaderMemory, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, "\n");
		break;
	case srcSrcSrcDst:
		if (print) dprintf(shaderInfo, "%s ", GetOpcodeString(opcode) );
		ResolveDstParameter<print, true>(shaderMemory, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, "\n");
		break;
	case srcSrcSrcSrcDst: // Only ever used with D3DSIO_TEXLDD
		if (print) dprintf(shaderInfo, "%s ", GetOpcodeString(opcode) );
		ResolveDstParameter<print, true>(shaderMemory, shaderInfo, uniqueTempRegistersUsed, outRegisterwriteTracker);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, ", ");
		ResolveSrcParameter<print>(shaderInfo, shaderMemory, shaderInfo.isPixelShader, uniqueTempRegistersUsed, uniqueInputRegistersUsed);
		if (print) dprintf(shaderInfo, "\n");
		break;
	default:
		DbgBreakPrint("Error: Unknown shader parameters type");
		break;
	}
	return false;
}

template <const bool print>
static inline void ShaderAnalysisMain(const DWORD* shaderMemory, ShaderInfo& ret
#ifdef _DEBUG
	, const char* const filename
#endif
	)
{
	ret.initialBytecodeToken = shaderMemory;

	if (!shaderMemory)
	{
		ret.parsingErrorDetected = true;
		return;
	}

#ifdef DISASM_SHADER
	D3DXDisassembleShader(shaderMemory, FALSE, NULL, &ret.D3DXDisasm);
	if (ret.D3DXDisasm)
		ret.D3DXDisasmString = (const char* const)ret.D3DXDisasm->GetBufferPointer();
#endif // DISASM_SHADER

	outputRegisterWriteTracker outRegisterwriteTracker;

	const versionToken* const version = (const versionToken* const)shaderMemory;
	switch (version->pixelOrVertexShader)
	{
	case (verToken_vertexShader): // Vertex shader
		ret.isPixelShader = false;
		break;
	case (verToken_PixelShader): // Pixel shader
		ret.isPixelShader = true;
		break;
	default:
#ifdef _DEBUG
		DbgBreakPrint("Error: Shader is neither a vertex shader nor a pixel shader");
#endif
		ret.parsingErrorDetected = true;
		return;
	}

	ret.shaderMajorVersion = version->majorVersion;
	ret.shaderMinorVersion = version->minorVersion;

	if (ret.shaderMajorVersion < 1 || ret.shaderMajorVersion > 3)
	{
		ret.parsingErrorDetected = true;
#ifdef _DEBUG
		DbgBreakPrint("Error: Shader model is out of bounds for D3D9!");
#endif
		return;
	}

	if (ret.shaderMinorVersion > 4)
	{
		ret.parsingErrorDetected = true;
#ifdef _DEBUG
		DbgBreakPrint("Error: Shader model minor version greater than 4");
#endif
		return;
	}

	unsigned long uniqueTempRegistersUsed = 0x00000000;
	unsigned short uniqueInputRegistersUsed = 0x0000;

	// Move forwards one token to the first instruction/definition/declaration:
	++shaderMemory;

	int tabIndents;
	if (print)
		tabIndents = 0;

	bool doneParsing = false;
	while (!doneParsing)
	{
		doneParsing = ParseOpcode<print>(shaderMemory, ret, uniqueTempRegistersUsed, uniqueInputRegistersUsed, tabIndents, outRegisterwriteTracker);
	}

	outRegisterwriteTracker.AddOutputRegisterListingToShaderInfo(ret);

	for (unsigned x = 0; x < ret.shaderLengthDWORDs; ++x)
	{
		ret.shaderBytecodeHash = _rotl(ret.shaderBytecodeHash, 1);
		const DWORD newToken = ret.initialBytecodeToken[x];
		ret.shaderBytecodeHash ^= newToken;
	}

#ifdef DISASM_SHADER
	ret.shaderDisasmText.push_back('\0');
	ret.shaderDisasmBuffer = &ret.shaderDisasmText.front();
#endif

	ret.tempRegistersUsedBitmask = uniqueTempRegistersUsed;
	ret.numUniqueTempRegistersUsed = __popcnt(uniqueTempRegistersUsed);

	ret.inputRegistersUsedBitmask = uniqueInputRegistersUsed;
	ret.numUniqueInputRegistersUsed = (const unsigned short)(__popcnt(uniqueInputRegistersUsed) );

	if (ret.isPixelShader && ret.shaderMajorVersion == 1)
		ret.usedMRTMask |= 0x1; // ps_1_* shaders leave their color output in r0 instead of moving it into one of the oC[N] registers (which don't exist for version 1.x pixel shaders because MRT didn't exist back then)

	if (ret.numTexInstructions > 0 && !ret.isPixelShader)
		ret.usesVertTextureFetch = true;

	// It's an error for pixel shaders to not write out any color-channel data:
	if (ret.isPixelShader && ret.usedMRTMask == 0)
		ret.parsingErrorDetected = true;

	if (ret.usedMRTMask > 1)
		ret.usesMRT = true;

	return;
}

void DisasmAndAnalyzeShader(const DWORD* shaderMemory, ShaderInfo& shaderInfoOut
#ifdef _DEBUG
	, const char* const filename
#endif
	)
{
	ShaderAnalysisMain<true>(shaderMemory, shaderInfoOut
#ifdef _DEBUG
		, filename
#endif
		);

#ifdef DISASM_SHADER
	printf("%s\n", &shaderInfoOut.shaderDisasmText.front() );
#endif
}

void AnalyzeShader(const DWORD* shaderMemory, ShaderInfo& shaderInfoOut
#ifdef _DEBUG
	, const char* const filename
#endif
	)
{
	ShaderAnalysisMain<
#ifdef DISASM_SHADER
		true
#else
		false
#endif
	>(shaderMemory, shaderInfoOut
#ifdef _DEBUG
		, filename
#endif
		);
}

void outputRegisterWriteTracker::SetAddOrSkip(const D3DSHADER_PARAM_REGISTER_TYPE registerType, const unsigned registerIndex, const BYTE writeMask, const dstParameterToken& dstParameter, const instructionToken* const _writeInstruction, const dstParameterToken* const optionalRelativeRegister/* = NULL*/)
{
	outputRegisterWriteState& thisRegWriteState = writtenRegisters[registerType][registerIndex];
	if (thisRegWriteState.writeMaskFinalState == 0x00)
	{
		outputRegisterIdentifier registerIdentifier;
		registerIdentifier.outputRegisterType = (const BYTE)registerType;
		registerIdentifier.outputRegisterNumber = registerIndex;
		registerIdentifiers.push_back(registerIdentifier);
	}

	outputRegisterWriteOperation newWriteOperation;
	newWriteOperation.writeInstruction = _writeInstruction;
	newWriteOperation.registerParameterToken = &dstParameter;
	newWriteOperation.optionalRelativeAddressingDestParameterToken = optionalRelativeRegister;
	newWriteOperation.instructionSourceParameterTokens = (const srcParameterToken* const)(&dstParameter + 1);
	newWriteOperation.operationWriteMask = writeMask;
	thisRegWriteState.writeOperations.push_back(newWriteOperation);

	thisRegWriteState.writeMaskFinalState |= writeMask;
}

void outputRegisterWriteTracker::AddOutputRegisterListingToShaderInfo(ShaderInfo& outShaderInfo)
{
	const unsigned numWrittenOutputRegisters = registerIdentifiers.size();
	for (unsigned x = 0; x < numWrittenOutputRegisters; ++x)
	{
		const outputRegisterIdentifier& registerIdentifier = registerIdentifiers[x];

		outputRegisterWriteState registerWriteState = writtenRegisters[registerIdentifier.outputRegisterType][registerIdentifier.outputRegisterNumber];
		WrittenOutputRegister newRegister;
		newRegister.registerType = (const D3DSHADER_PARAM_REGISTER_TYPE)(registerIdentifier.outputRegisterType);
		newRegister.registerIndex = registerIdentifier.outputRegisterNumber;
		newRegister.componentChannelsWritten = registerWriteState.writeMaskFinalState;
		newRegister.writeOperationsHistory.swap(registerWriteState.writeOperations); // Swap is really fast!
		outShaderInfo.writtenOutputRegisters.push_back(newRegister);
	}
}
