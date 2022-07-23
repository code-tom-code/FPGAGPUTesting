/*
This file contains conversion functions from D3D9 enums and structs to our device-specific enums and structs.
*/

#include "DeviceConversions.h"
#include "..\Software_d3d9_Driver\Driver\GPUDeviceLimits.h"

// Starts with Nop=0, ends with End=(~0) (all bits set)
const InstructionOperation GetInstructionOperation(const instructionToken& d3dInstruction)
{
	switch (d3dInstruction.opcode)
	{
	case _D3DSIO_LABEL:
	case _D3DSIO_DCL:
	case _D3DSIO_DEFB:
	case _D3DSIO_DEFI:
	case _D3DSIO_DEF:
	case _D3DSIO_PHASE:
	case _D3DSIO_COMMENT:
	case _D3DSIO_END:
		// Ignore this instruction
		return Op_NOP;
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
		return Op_NOP;
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
		__debugbreak(); // Oh no, this instruction should have been decomposed in the last pass!
#endif
		return Op_NOP;
	default:
#ifdef _DEBUG
		__debugbreak(); // Unknown/unexpected opcode encountered!
#endif
		// Do nothing!
		return Op_NOP;
	case _D3DSIO_NOP:
		return Op_NOP;
	case _D3DSIO_MOV:
		return Op_MOV;
	case _D3DSIO_ADD:
		return Op_ADD;
	case _D3DSIO_MUL:
		return Op_MUL;
	case _D3DSIO_RCP:
		return Op_RCP;
	case _D3DSIO_RSQ:
		return Op_RSQ;
	case _D3DSIO_MIN:
		return Op_MIN;
	case _D3DSIO_MAX:
		return Op_MAX;
	case _D3DSIO_SLT:
		return Op_SLT;
	case _D3DSIO_SGE:
		return Op_SGE;
	case _D3DSIO_EXP:
		return Op_EXPP;
	case _D3DSIO_EXPP:
		return Op_EXPP;
	case _D3DSIO_LOG:
		return Op_LOGP;
	case _D3DSIO_LOGP:
		return Op_LOGP;
	case _D3DSIO_FRC:
		return Op_FRC;
	case _D3DSIO_SGN:
		return Op_SGN;
	case _D3DSIO_ABS: // ABS dst, src gets converted to MOV dst, abs(src)
		return Op_MOV;
	case _D3DSIO_MOVA:
		return Op_RND_SINT23NE; // MOVA is spec'd to round to nearest even, so use SINT23NE for that
	}
}

// Dest reg type is one of: r#/x#/o#/nulloutput
const InstructionDestRegType GetDestRegType(const dstParameterToken& d3dDestReg)
{
	const D3DSHADER_PARAM_REGISTER_TYPE d3dRegType = d3dDestReg.GetRegisterType();
	switch (d3dRegType)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Unknown D3D register type!
#endif
		return DRTyp_NULL;
	case D3DSPR_INPUT: // v# cannot be written to
	case D3DSPR_CONST: // c# cannot be written to
	case D3DSPR_CONST2: // c# cannot be written to
	case D3DSPR_CONST3: // c# cannot be written to
	case D3DSPR_CONST4: // c# cannot be written to
	case D3DSPR_CONSTINT: // i# cannot be written to
	case D3DSPR_CONSTBOOL: // b# cannot be written to
	case D3DSPR_SAMPLER: // s# cannot be written to
	case D3DSPR_DEPTHOUT: // This is only for pixel shaders
	case D3DSPR_LABEL: // Labels cannot be written to
#ifdef _DEBUG
		__debugbreak(); // Should never encounter these in real shaders
#endif
		return DRTyp_NULL;
	case D3DSPR_TEMP: // r# -> r#
		return DRTyp_R; // return r#
	case D3DSPR_ADDR: // a0 -> x#
	case D3DSPR_LOOP: // aLoop -> x#
	case D3DSPR_TEMPFLOAT16: // special -> x#
	case D3DSPR_MISCTYPE: // misc -> x#
	case D3DSPR_PREDICATE: // p# -> x#
		return DRTyp_X; // return x#
	case D3DSPR_COLOROUT: // oD# -> o#
	case D3DSPR_RASTOUT: // oPos# -> o#
	case D3DSPR_ATTROUT: // oFog# -> o#
	case D3DSPR_TEXCRDOUT: // oT# -> o#
		return DRTyp_O; // return o#
	}
}

// Dest reg index is only 3 bits, so can only be between 0 to 7
const unsigned char GetDestRegIndex(const dstParameterToken& d3dDestReg)
{
	const unsigned d3dRegIndex = d3dDestReg.GetRegisterIndex();
	if (d3dRegIndex >= GPU_SHADER_MAX_NUM_GPR_REG)
	{
#ifdef _DEBUG
		__debugbreak(); // Register index out of range!
#endif
		return 0;
	}
	return (const unsigned char)d3dRegIndex;
}

// Dest reg modifier is either None or Saturate
const InstructionDestRegModifier GetDestRegModifier(const dstParameterToken& d3dDestReg)
{
	const unsigned d3dUnshiftedDstMod = d3dDestReg.GetResultModifierUnshifted();

#ifdef _DEBUG
	if (d3dUnshiftedDstMod & D3DSPDM_MSAMPCENTROID)
	{
		__debugbreak(); // The "_centroid" dest modifier is not (yet?) supported!
	}
#endif

	if (d3dUnshiftedDstMod & D3DSPDM_SATURATE)
		return DRMod_Sat;
	else
		return DRMod_None;
}

// Dest reg component is X/Y/Z/W
const InstructionRegComponent GetDestRegComponent(const dstParameterToken& d3dDestReg)
{
	const unsigned d3dDestWriteMask = d3dDestReg.GetWriteMask();
	switch (d3dDestReg.GetWriteMask() )
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Unexpected out of range write mask data. Maybe corrupted shader bytecode?
#endif
		return Chan_X;

	case 0:
#ifdef _DEBUG
		__debugbreak(); // Should never be here! It shouldn't be possible to have a null dest write mask!
#endif
		return Chan_X;

	case 3:
	case 5:
	case 6:
	case 7:
	case 9:
	case 10:
	case 11:
	case 12:
	case 13:
	case 14:
	case 15:
#ifdef _DEBUG
		__debugbreak(); // Should never be here! We should have already scalarized our instructions by this point.
#endif
		if (d3dDestWriteMask & 0x1)
			return Chan_X;
		else if (d3dDestWriteMask & 0x2)
			return Chan_Y;
		else if (d3dDestWriteMask & 0x4)
			return Chan_Z;
		else
			return Chan_W;
		break;

	case 1:
		return Chan_X;
	case 2:
		return Chan_Y;
	case 4:
		return Chan_Z;
	case 8:
		return Chan_W;
	}
}

// Source reg type is one of: r#/v#/c#/x#/o#/0.0f/1.0f/-1.0f
const InstructionSrcRegType GetSrcRegType(const srcParameterToken& d3dSrcReg)
{
	const D3DSHADER_PARAM_REGISTER_TYPE d3dRegType = d3dSrcReg.GetRegisterType();
	switch (d3dRegType)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Unknown D3D register type!
#endif
		return SRTyp_0;
	case D3DSPR_INPUT: // v#
		return SRTyp_V;
	case D3DSPR_CONST: // c#
	case D3DSPR_CONST2: // c#
	case D3DSPR_CONST3: // c#
	case D3DSPR_CONST4: // c#
	case D3DSPR_CONSTINT: // i#
	case D3DSPR_CONSTBOOL: // b#
	case D3DSPR_SAMPLER: // s#
		return SRTyp_C;
	case D3DSPR_LABEL: // Labels cannot be accessed from shadercode
		return SRTyp_0;
	case D3DSPR_TEMP: // r# -> r#
		return SRTyp_R; // return r#
	case D3DSPR_ADDR: // a0 -> x#
	case D3DSPR_LOOP: // aLoop -> x#
	case D3DSPR_TEMPFLOAT16: // special -> x#
	case D3DSPR_MISCTYPE: // misc -> x#
	case D3DSPR_PREDICATE: // p# -> x#
		return SRTyp_X; // return x#
	case D3DSPR_COLOROUT: // oD# -> o#
	case D3DSPR_RASTOUT: // oPos# -> o#
	case D3DSPR_ATTROUT: // oFog# -> o#
	case D3DSPR_TEXCRDOUT: // oT# -> o#
	case D3DSPR_DEPTHOUT: // oDepth
		return SRTyp_O; // return o#
	}
}

// Source reg index is 8 bits, so can be from 0 to 255 (for constant registers) or between 0 to 7 (for GPR's)
const unsigned char GetSrcRegIndex(const srcParameterToken& d3dSrcReg)
{
	const unsigned d3dRegIndex = d3dSrcReg.GetRegisterIndex();
	const InstructionSrcRegType regType = GetSrcRegType(d3dSrcReg);
	switch (regType)
	{
	case SRTyp_R:
		if (d3dRegIndex >= GPU_SHADER_MAX_NUM_GPR_REG)
		{
#ifdef _DEBUG
			__debugbreak(); // Register index out of range!
#endif
			return 0;
		}
		break;
	case SRTyp_V:
		if (d3dRegIndex >= GPU_SHADER_MAX_NUM_INPUT_REG)
		{
#ifdef _DEBUG
			__debugbreak(); // Register index out of range!
#endif
			return 0;
		}
		break;
	case SRTyp_C:
		if (d3dRegIndex >= GPU_SHADER_MAX_NUM_CONSTANT_FLOAT_REG)
		{
#ifdef _DEBUG
			__debugbreak(); // Register index out of range!
#endif
			return 0;
		}
		break;
	case SRTyp_X:
		if (d3dRegIndex >= GPU_SHADER_MAX_NUM_SPECIAL_REG)
		{
#ifdef _DEBUG
			__debugbreak(); // Register index out of range!
#endif
			return 0;
		}
		break;
	case SRTyp_O:
		if (d3dRegIndex >= GPU_SHADER_MAX_NUM_OUTPUT_REG)
		{
#ifdef _DEBUG
			__debugbreak(); // Register index out of range!
#endif
			return 0;
		}
		break;
	case SRTyp_0:
		if (d3dRegIndex >= 1)
		{
#ifdef _DEBUG
			__debugbreak(); // Register index out of range!
#endif
			return 0;
		}
		break;
	case SRTyp_1:
		if (d3dRegIndex >= 1)
		{
#ifdef _DEBUG
			__debugbreak(); // Register index out of range!
#endif
			return 0;
		}
		break;
	case SRTyp_N1:
		if (d3dRegIndex >= 1)
		{
#ifdef _DEBUG
			__debugbreak(); // Register index out of range!
#endif
			return 0;
		}
		break;
	}
	return (const unsigned char)d3dRegIndex;
}

// Source reg modifier is one of: None/Neg/Abs/AbsNeg
const InstructionSrcRegModifier GetSrcRegModifier(const srcParameterToken& d3dSrcReg)
{
	const D3DSHADER_PARAM_SRCMOD_TYPE d3dSrcMod = d3dSrcReg.GetSourceModifiersUnshifted();
	switch (d3dSrcMod)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Unknown src mod! Maybe corrupted shader bytecode?
#endif
	case D3DSPSM_BIAS: // bias
	case D3DSPSM_SIGN: // sign
	case D3DSPSM_X2: // multiply by 2
	case D3DSPSM_DZ: // divide through by z component
	case D3DSPSM_DW: // divide through by w component
		// Unsupported, just do nothing
	case D3DSPSM_NONE: // nop
		return SRMod_None;
	case D3DSPSM_BIASNEG: // bias and negate
	case D3DSPSM_NEG: // negate
	case D3DSPSM_SIGNNEG: // sign and negate
	case D3DSPSM_COMP: // complement
	case D3DSPSM_X2NEG: // multiply by 2 and negate
	case D3DSPSM_NOT: // for predicate register: "!p0"
		return SRMod_Neg;
	case D3DSPSM_ABS: // abs()
		return SRMod_Abs;
	case D3DSPSM_ABSNEG: // -abs()
		return SRMod_AbsNeg;
	}
}

// Source reg component is X/Y/Z/W
const InstructionRegComponent GetSrcRegComponent(const srcParameterToken& d3dSrcReg)
{
	const unsigned char d3dSwizzle = d3dSrcReg.GetChannelSwizzle();
	const InstructionRegComponent deviceSwizzle = (const InstructionRegComponent)d3dSwizzle;
#ifdef _DEBUG
	const unsigned char xSwizzle = d3dSrcReg.GetChannelSwizzleXYZW() & 0x3;
	const unsigned char ySwizzle = (d3dSrcReg.GetChannelSwizzleXYZW() >> 2) & 0x3;
	const unsigned char zSwizzle = (d3dSrcReg.GetChannelSwizzleXYZW() >> 4) & 0x3;
	const unsigned char wSwizzle = (d3dSrcReg.GetChannelSwizzleXYZW() >> 6) & 0x3;
	if (xSwizzle != ySwizzle || xSwizzle != zSwizzle || xSwizzle != wSwizzle)
	{
		__debugbreak(); // Error: Non-scalar instruction! We should've gotten rid of all of these earlier during the scalarization pass!
	}
#endif
	return deviceSwizzle;
}
