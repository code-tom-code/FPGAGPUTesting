#pragma once

namespace Xsi
{
	class Loader;
}

const int RunTestsShaderCore(Xsi::Loader& loader);

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
	Op_RND_SINT24Z = 14,
	Op_RND_SINT23NE = 15,
	Op_RND_SINT16NE = 16,
	Op_CNV_UNORM16 = 17,
	Op_CNV_UNORM8 = 18,
	Op_SHFT = 19,

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
