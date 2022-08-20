// Shared header file for common definitions between the Floating-point ALU (FPU) and the Shader Core

#pragma once

static constexpr const unsigned GetMax(const unsigned a, const unsigned b)
{
	if (a > b)
		return a;
	else
		return b;
}

static const constexpr unsigned RCP_CYCLES = 14u; // RCP pipe takes 14 cycles to run
static const constexpr unsigned MUL_CYCLES = 5u; // MUL pipe takes 5 cycles to run
static const constexpr unsigned ADD_CYCLES = 4u; // ADD pipe takes 4 cycles to run
static const constexpr unsigned CNV_CYCLES = 3u; // CNV pipe takes 3 cycles to run
static const constexpr unsigned CMP_CYCLES = 1u; // CMP pipe takes 1 cycles to run
static const constexpr unsigned SHFT_CYCLES = 1u; // SHFT pipe takes 1 cycles to run
static const constexpr unsigned BIT_CYCLES = 1u; // BIT pipe takes 1 cycles to run
static const constexpr unsigned MAX_PIPE_CYCLES = GetMax(GetMax(GetMax(GetMax(GetMax(GetMax(RCP_CYCLES, MUL_CYCLES), ADD_CYCLES), CNV_CYCLES), CMP_CYCLES), SHFT_CYCLES), BIT_CYCLES);

static const constexpr unsigned CBUF_LATENCY_CYCLES = 2u; // Constant Buffer reads/writes now take 3 cycles to take effect
static const constexpr unsigned INST_CACHE_LATENCY_CYCLES = 3u; // Instruction Cache reads/writes now take 3 cycles to take effect
static const constexpr unsigned GPR_QUAD_LATENCY_CYCLES = 2u; // GPR Quad reads/writes now take 3 cycles to take effect

enum eCmpType : uint8_t
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

enum eShftMode : uint8_t
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

enum eBitMode : uint8_t
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

enum eConvertMode : uint8_t
{
	F_Frc, // 0
	F_to_I23_RoundNearestEven, // 1
	F_to_I16_RoundNearestEven, // 2
	F_to_UNORM16, // 3
	F_to_UNORM8, // 4
	F_to_Half, // 5
	Half_to_F, // 6
	U32_to_F // 7
};
