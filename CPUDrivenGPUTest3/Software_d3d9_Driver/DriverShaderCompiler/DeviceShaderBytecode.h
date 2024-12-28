#pragma once

typedef unsigned char BYTE;

enum InstructionOperation : unsigned __int64
{
	Op_NOP = 0,
	Op_MOV = 1,
	Op_ADD = 2,
	Op_MUL = 3,
	Op_MIN = 4,
	Op_MAX = 5,
	Op_RCP = 6,
	Op_FRC = 7,
	Op_EXPP = 8,
	Op_LOGP = 9,
	Op_RSQ = 10,
	Op_SLT = 11,
	Op_SGE = 12,
	Op_SGN = 13,
	Op_Unused14 = 14,
	Op_RND_UINT24NE = 15,
	Op_RND_SINT16NE = 16,
	Op_CNV_UNORM16 = 17,
	Op_CNV_UNORM8 = 18,
	Op_SHFT = 19,
	Op_BSHFTL8 = 20,
	Op_BSHFTL16 = 21,
	Op_BSHFTL24 = 22,
	Op_BSHFTR8 = 23,
	Op_BSHFTR16 = 24,
	Op_BSHFTR24 = 25,
	Op_OR = 26,
	Op_AND = 27,
	Op_CNV_F_TO_HALF = 28,
	Op_CNV_HALF_TO_F = 29,
	Op_CNV_U32_TO_F = 30,

	Op_END = 31
};

enum InstructionDestRegModifier : unsigned __int64
{
	DRMod_None = 0,
	DRMod_Sat = 1
};

enum InstructionDestRegType : unsigned __int64
{
	DRTyp_R = 0,
	DRTyp_X = 1,
	DRTyp_O = 2,
	DRTyp_NULL = 3
};

enum RegisterFileRegType : unsigned
{
	RFType_VInput = 0, // 0 = v#
	RFType_OOutput, // 1 = o#
	RFType_RGPR, // 2 = r#
	RFType_XSpecial // 3 = x#
};

enum InstructionRegComponent : unsigned __int64
{
	Chan_X = 0,
	Chan_Y = 1,
	Chan_Z = 2,
	Chan_W = 3
};

enum InstructionSrcRegModifier : unsigned __int64
{
	SRMod_None = 0,
	SRMod_Neg = 1,
	SRMod_Abs = 2,
	SRMod_AbsNeg = 3
};

enum InstructionSrcRegType : unsigned __int64
{
	SRTyp_R = 0,
	SRTyp_V = 1,
	SRTyp_C = 2,
	SRTyp_X = 3,
	SRTyp_O = 4,
	SRTyp_0 = 5,
	SRTyp_1 = 6,
	SRTyp_N1 = 7
};

enum MUXSource : unsigned char
{
	MUXSrc_RegFile = 0,
	MUXSrc_ConstBuffer, // 1
	MUXSrc_ZeroReg, // 2
	MUXSrc_OneReg, // 3
	MUXSrc_NegOneReg, // 4
};

enum MUXDest : unsigned char
{
	MUXDest_ZeroReg = 0,
	MUXDest_ALUResult, // 1
	MUXDest_Special // 2
};

enum eCmpType : unsigned char
{
	// Min and Max are typical float min(a, b) and float max(a, b) functions
	CmpMin, // 0
	CmpMax, // 1

	// SLT(a, b) computes a < b; SGE(a, b) computes a >= b (the exact opposite of SLT)
	CmpSlt, // 2
	CmpSge, // 3

	// SGN(a) computes component-wise the sign of a (-1 for negative, 0 for zero, or 1 for positive)
	CmpSgn, // 4

	// MOV simply returns "a" (bitwise)
	CmpMov // 5

	// 3-input compares are disabled
	// CMP(a, b, c) computes component-wise (a >= 0 ? b : c). CND(a, b, c) computes component-wise (a > 0.5 ? b : c).
	//CmpCmp, // 6
	//CmpCnd // 7
};

enum eShftMode : unsigned char
{
	ShftX2, // 0
	ShftX4, // 1
	ShftX8, // 2
	ShftX16, // 3
	ShftD2, // 4
	ShftD4, // 5
	ShftD8, // 6
	ShftD16 // 7
};

enum eBitMode : unsigned char
{
	BShftL8, // 0
	BShftL16, // 1
	BShftL24, // 2
	BOr, // 3
	BShftR8, // 4
	BShftR16, // 5
	BShftR24, // 6
	BAnd // 7
};

enum eConvertMode : unsigned char
{
	F_to_I24_Trunc, // 0
	F_to_I23_RoundNearestEven, // 1
	F_to_I16_RoundNearestEven, // 2
	F_to_UNORM16, // 3
	F_to_UNORM8, // 4
	F_to_Half, // 5
	Half_to_F, // 6
	U32_to_F // 7
};

struct DeviceShaderHeader
{
	struct inputRegBindingData
	{
		BYTE usageType : 3; // Position/color/texcoord/normal/blendweights/blendindices/etc. (uses the eInputUsageType enum)
		BYTE usageIndex : 2;
		BYTE unusedBits0 : 3;
	};

	struct outputRegBindingData
	{
		BYTE usageType : 3; // Position/color/texcoord/psize/fog (uses the eInputUsageType enum)
		BYTE usageIndex : 2;
		BYTE unusedBits0 : 3;
	};

	static const unsigned short SHADER_HEADER_MAGIC_BYTES = 'SV'; // This is "VS" reversed

	unsigned short shaderMagicBytes = SHADER_HEADER_MAGIC_BYTES; 
	unsigned short shaderLength_instructionSlots = 0;
	unsigned long shaderHash = 0x00000000;
	inputRegBindingData inputRegsData[8] = {0}; // These are for input registers v# (ie. v0, v1, v2, etc.)
	outputRegBindingData outputRegsData[8] = {0}; // These are for output registers o# (ie. o0, o1, o2, etc.)
	unsigned char unusedHeaderPadding[8] = {0};
};
static_assert(sizeof(DeviceShaderHeader) == 32, "Error: Unexpected struct padding!");

union instructionSlot
{
	struct _instructionStruct
	{
		// Operation is 5 bits:
		/*[0, 1, 2, 3, 4]*/ InstructionOperation operation : 5; // Starts with Nop=0, ends with End=(~0) (all bits set)

		// DestReg is 8 bits:
		/*[5]*/ InstructionDestRegModifier destReg_destModifier : 1; // None=0, Saturate=1
		/*[6, 7]*/ InstructionDestRegType destReg_regType : 2; // r#/x#/o#/nulloutput
		/*[8, 9, 10]*/ unsigned __int64 destReg_regIndex : 3; // 0-7
		/*[11, 12]*/ InstructionRegComponent destReg_component : 2; // X/Y/Z/W

		// SrcReg is 15 bits:
		/*[13, 14]*/ InstructionSrcRegModifier srcRegA_srcModifier : 2; // None/Neg/Abs/AbsNeg
		/*[15, 16, 17]*/ InstructionSrcRegType srcRegA_regType : 3; // r#/v#/c#/x#/o#/0.0f/1.0f/-1.0f
		/*[18, 19, 20, 21, 22, 23, 24, 25]*/ unsigned __int64 srcRegA_regIndex : 8; // 0-255
		/*[26, 27]*/ InstructionRegComponent srcRegA_component : 2; // X/Y/Z/W

		// SrcReg is 15 bits:
		/*[28, 29]*/ InstructionSrcRegModifier srcRegB_srcModifier : 2; // None/Neg/Abs/AbsNeg
		/*[30, 31, 32]*/ InstructionSrcRegType srcRegB_regType : 3; // r#/v#/c#/x#/o#/0.0f/1.0f/-1.0f
		/*[33, 34, 35, 36, 37, 38, 39, 40]*/ unsigned __int64 srcRegB_regIndex : 8; // 0-255
		/*[41, 42]*/ InstructionRegComponent srcRegB_component : 2; // X/Y/Z/W
	} instructionStruct;

	unsigned __int64 rawQWORD;
};
static_assert(sizeof(instructionSlot) == sizeof(unsigned __int64), "Error: Unexpected union size!");

static const char* const InstructionOpToString(const InstructionOperation op)
{
	static_assert(Op_END == 31, "Need to update this string table to match the new enum!");
	switch (op)
	{
	default:
		__debugbreak(); // Should never be here
		return "unknown";
	case Op_NOP:
		return "nop";
	case Op_MOV:
		return "mov";
	case Op_ADD:
		return "add";
	case Op_MUL:
		return "mul";
	case Op_MIN:
		return "min";
	case Op_MAX:
		return "max";
	case Op_RCP:
		return "rcp";
	case Op_FRC:
		return "frc";
	case Op_EXPP:
		return "expp";
	case Op_RSQ:
		return "rsq";
	case Op_SLT:
		return "slt";
	case Op_SGE:
		return "sge";
	case Op_SGN:
		return "sgn";
	case Op_Unused14:
		return "unused14";
	case Op_RND_UINT24NE:
		return "rnd_uint24ne";
	case Op_RND_SINT16NE:
		return "rnd_sint16ne";
	case Op_CNV_UNORM16:
		return "cvt_unorm16";
	case Op_CNV_UNORM8:
		return "cvt_unorm8";
	case Op_SHFT:
		return "shft";
	case Op_BSHFTL8:
		return "bshft_l8";
	case Op_BSHFTL16:
		return "bshft_l16";
	case Op_BSHFTL24:
		return "bshft_l24";
	case Op_BSHFTR8:
		return "bshft_r8";
	case Op_BSHFTR16:
		return "bshft_r16";
	case Op_BSHFTR24:
		return "bshft_r24";
	case Op_OR:
		return "or";
	case Op_AND:
		return "and";
	case Op_CNV_F_TO_HALF:
		return "cvt_f_to_half";
	case Op_CNV_HALF_TO_F:
		return "cvt_half_to_f";
	case Op_CNV_U32_TO_F:
		return "cvt_u32_to_f";
	case Op_END:
		return "end";
	}
}
	
static const char* const InstructionDestRegToString(const InstructionDestRegType destReg)
{
	switch (destReg)
	{
	case DRTyp_R:
		return "r";
	default:
		__debugbreak(); // Should never be here
	case DRTyp_X:
		return "x";
	case DRTyp_O:
		return "o";
	case DRTyp_NULL:
		return "null";
	}
}

static const char* const InstructionSrcRegToString(const InstructionSrcRegType srcReg)
{
	switch (srcReg)
	{
	default:
		__debugbreak(); // Should never be here
	case SRTyp_R:
		return "r";
	case SRTyp_V:
		return "v";
	case SRTyp_C:
		return "c";
	case SRTyp_X:
		return "x";
	case SRTyp_O:
		return "o";
	case SRTyp_0:
		return "0";
	case SRTyp_1:
		return "1";
	case SRTyp_N1:
		return "-1";
	}
}

static const char* const InstructionDestRegModToString(const InstructionDestRegModifier destMod)
{
	switch (destMod)
	{
	default:
		__debugbreak(); // Should never be here
	case DRMod_None:
		return "";
	case DRMod_Sat:
		return "_saturate";
	}
}

static const char* const InstructionSrcRegModToString(const InstructionSrcRegModifier srcMod)
{
	switch (srcMod)
	{
	default:
		__debugbreak(); // Should never be here
	case SRMod_None:
		return "";
	case SRMod_Neg:
		return "_neg";
	case SRMod_Abs:
		return "_abs";
	case SRMod_AbsNeg:
		return "_absneg";
	}
}

static const char GetRegChannelLetterFromChannelIndex(const unsigned channelIndex)
{
	switch (channelIndex)
	{
	default:
		__debugbreak(); // Should never be here
	case 0:
		return 'x';
	case 1:
		return 'y';
	case 2:
		return 'z';
	case 3:
		return 'w';
	}
}
