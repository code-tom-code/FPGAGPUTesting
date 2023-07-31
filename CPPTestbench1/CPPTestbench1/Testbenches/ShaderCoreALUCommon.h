// Shared header file for common definitions between the Floating-point ALU (FPU) and the Shader Core

#pragma once

extern bool enableDebugOutput;

// Forward-declare some common functions:
unsigned short SoftFloatToHalf(const float a);
float SoftHalfToFloat(const unsigned short a);

static constexpr const unsigned GetMax(const unsigned a, const unsigned b)
{
	if (a > b)
		return a;
	else
		return b;
}

static const constexpr unsigned SPEC_CYCLES = 14u; // SPEC pipe takes 14 cycles to run
static const constexpr unsigned MUL_CYCLES = 5u; // MUL pipe takes 5 cycles to run
static const constexpr unsigned ADD_CYCLES = 4u; // ADD pipe takes 4 cycles to run
static const constexpr unsigned CNV_CYCLES = 3u; // CNV pipe takes 3 cycles to run
static const constexpr unsigned CMP_CYCLES = 1u; // CMP pipe takes 1 cycles to run
static const constexpr unsigned SHFT_CYCLES = 1u; // SHFT pipe takes 1 cycles to run
static const constexpr unsigned BIT_CYCLES = 1u; // BIT pipe takes 1 cycles to run
static const constexpr unsigned MAX_PIPE_CYCLES = GetMax(GetMax(GetMax(GetMax(GetMax(GetMax(SPEC_CYCLES, MUL_CYCLES), ADD_CYCLES), CNV_CYCLES), CMP_CYCLES), SHFT_CYCLES), BIT_CYCLES);

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

enum eSpecMode : uint8_t
{
	RcpMode, // 0
	RsqMode, // 1
	UnimplementedMode2, // 2 // exp?
	UnimplementedMode3, // 3 // log?
	UnimplementedMode4, // 4 // sin?
	UnimplementedMode5, // 5 // cos?
	UnimplementedMode6, // 6
	UnimplementedMode7 // 7
};

enum eConvertMode : uint8_t
{
	F_Frc, // 0
	F_to_U24_RoundNearestEven, // 1
	F_to_I16_RoundNearestEven, // 2
	F_to_UNORM16, // 3
	F_to_UNORM8, // 4
	F_to_Half, // 5
	Half_to_F, // 6
	U32_to_F // 7
};

class FPU
{
public:
	FPU(const unsigned _fpuIndex) : fpuIndex(_fpuIndex)
	{
	}

	static const float ComputeShift(const float a, const eShftMode mode)
	{
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
		case ShftX2: // 0
			return a * 2.0f;
		case ShftX4: // 1
			return a * 4.0f;
		case ShftX8: // 2
			return a * 8.0f;
		case ShftX16: // 3
			return a * 16.0f;
		case ShftD2: // 4
			return a * 0.5f;
		case ShftD4: // 5
			return a * 0.25f;
		case ShftD8: // 6
			return a * 0.125f;
		case ShftD16: // 7
			return a * 0.0625f;
		}
	}

	static const unsigned ComputeBitwise(const float a, const float b, const eBitMode mode)
	{
		const unsigned uintA = *(const unsigned* const)&a;
		const unsigned uintB = *(const unsigned* const)&b;
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
		case BShftL8: // 0
			return uintA << 8;
		case BShftL16: // 1
			return uintA << 16;
		case BShftL24: // 2
			return uintA << 24;
		case BShftR8: // 4
			return uintA >> 8;
		case BShftR16: // 5
			return uintA >> 16;
		case BShftR24: // 6
			return uintA >> 24;
		case BOr: // 3
			return uintA | uintB;
		case BAnd: // 7
			return uintA & uintB;
		}
	}

	static const float ComputeCompare(const float a, const float b, const eCmpType mode)
	{
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here!
		case CmpMin: // min
			return a < b ? a : b;
		case CmpMax: // max
			return a > b ? a : b;
		case CmpSlt: // SLT
			return a < b ? 1.0f : 0.0f;
		case CmpSge: // SGE
			return a < b ? 0.0f : 1.0f;
		case CmpSgn: // Sign
			if (a == 0.0f)
				return 0.0f;
			else if (a < 0.0f)
				return -1.0f;
			else
				return 1.0f;
		case CmpMov:
			return a;
		}
	}

	static const int ComputeConvert(const float a, const eConvertMode mode)
	{
		float saturatedA = a;
		if (saturatedA < 0.0f)
			saturatedA = 0.0f;
		else if (saturatedA > 1.0f)
			saturatedA = 1.0f;

		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
		case F_Frc: // 0
		{
			const float fResult = a - (const float)( (const int)floorf(a) );
			return *reinterpret_cast<const int* const>(&fResult);
		}
		case F_to_U24_RoundNearestEven: // 1
			if (a >= 0x00FFFFFF) // Use greater-equals here because in this case if we add 0.5f to 0xFFFFFF then we'll actually overflow into 0x1000000 on accident
				return 0x00FFFFFF;
			else if (a <= 0.0f)
				return 0;
			else
			{
				if (a >= 0.0f)
					return (const int)(a + 0.5f);
				else
					return (const int)(a - 0.5f);
			}
		case F_to_I16_RoundNearestEven: // 2
			if (a > 32767)
				return 32767;
			else if (a < -32768)
				return -32768;
			else
			{
				if (a >= 0.0f)
					return (const int)(a + 0.5f);
				else
					return (const int)(a - 0.5f);
			}
		case F_to_UNORM16: // 3
			return (const int)(saturatedA * 65535.0f);
		case F_to_UNORM8: // 4
			return (const int)(saturatedA * 255.0f);
		case F_to_Half: // 5
			return SoftFloatToHalf(a);
		case Half_to_F: // 6
		{
			const float convertedFloat = SoftHalfToFloat(*reinterpret_cast<const unsigned short* const>(&a) );
			return *reinterpret_cast<const int* const>(&convertedFloat);
		}
		case U32_to_F: // 7
		{
			const float convertedFloat = (const float)(*reinterpret_cast<const unsigned* const>(&a) );
			return *reinterpret_cast<const int* const>(&convertedFloat);
		}
		}
	}

private:
	const unsigned fpuIndex;
	float pipeStages[MAX_PIPE_CYCLES + 2] = {0};
	bool pipeStagesValid[MAX_PIPE_CYCLES + 2] = {false};

	static const char* const GetCompareModeString(const eCmpType mode)
	{
		switch (mode)
		{
		default:
			return "Unknown";
		case CmpMin: // min
			return "min";
		case CmpMax: // max
			return "max";
		case CmpSlt: // SLT
			return "slt";
		case CmpSge: // SGE
			return "sge";
		case CmpSgn: // Sign
			return "sign";
		case CmpMov: // Move
			return "mov";
		}
	}

	static const char* const GetSpecModeString(const eSpecMode mode)
	{
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
			return "Unknown";
		case RcpMode: // 0
			return "rcp";
		case RsqMode: // 1
			return "rsq";
		}
	}

	static const char* const GetShiftModeString(const eShftMode mode)
	{
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
			return "Unknown";
		case ShftX2: // 0
			return "x2";
		case ShftX4: // 1
			return "x4";
		case ShftX8: // 2
			return "x8";
		case ShftX16: // 3
			return "x16";
		case ShftD2: // 4
			return "d2";
		case ShftD4: // 5
			return "d4";
		case ShftD8: // 6
			return "d8";
		case ShftD16: // 7
			return "d16";
		}
	}

	static const char* const GetBitwiseModeString(const eBitMode mode)
	{
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
			return "Unknown";
		case BShftL8: // 0
			return "BShftL8";
		case BShftL16: // 1
			return "BShftL16";
		case BShftL24: // 2
			return "BShftL24";
		case BOr: // 3
			return "OR";
		case BShftR8: // 4
			return "BShftR8";
		case BShftR16: // 5
			return "BShftR16";
		case BShftR24: // 6
			return "BShftR24";
		case BAnd: // 7
			return "AND";
		}
	}

	static const char* const GetConvertModeString(const eConvertMode mode)
	{
		switch (mode)
		{
		default:
			__debugbreak(); // Should never be here
			return "Unknown";
		case F_Frc:
			return "F_Frc";
		case F_to_U24_RoundNearestEven:
			return "F_to_U24_RoundNearestEven";
		case F_to_I16_RoundNearestEven:
			return "F_to_I16_RoundNearestEven";
		case F_to_UNORM16:
			return "F_to_UNORM16";
		case F_to_UNORM8:
			return "F_to_UNORM8";
		case F_to_Half:
			return "F_to_Half";
		case Half_to_F:
			return "Half_to_F";
		case U32_to_F:
			return "U32_to_F";
		}
	}

public:
	void UpdateAddOnly(const std_logic_port& FPU_IADD_GO, 
		const std_logic_vector_port<32>& FPU_IN_A, const std_logic_vector_port<32>& FPU_IN_B,
		std_logic_vector_port<32>& FPU_OUT_RESULT)
	{
		const float aVal = FPU_IN_A.GetFloat32Val();
		const float bVal = FPU_IN_B.GetFloat32Val();

		for (unsigned x = 0; x < ARRAYSIZE(pipeStages) - 1; ++x)
		{
			pipeStages[x] = pipeStages[x + 1];
			pipeStagesValid[x] = pipeStagesValid[x + 1];
		}
		pipeStages[ARRAYSIZE(pipeStages) - 1] = 0.0f;
		pipeStagesValid[ARRAYSIZE(pipeStages) - 1] = false;

		FPU_OUT_RESULT = pipeStages[0];

		if (FPU_IADD_GO.GetBoolVal() )
		{
			// Add pipe runs in 4 cycles:
			const float addResult = aVal + bVal;
			pipeStages[ADD_CYCLES] = addResult;
			if (pipeStagesValid[ADD_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[ADD_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: %f + %f = %f\n", fpuIndex, aVal, bVal, addResult);
		}
	}

	void UpdateMulOnly(const std_logic_port& FPU_IMUL_GO, 
		const std_logic_vector_port<32>& FPU_IN_A, const std_logic_vector_port<32>& FPU_IN_B,
		std_logic_vector_port<32>& FPU_OUT_RESULT)
	{
		const float aVal = FPU_IN_A.GetFloat32Val();
		const float bVal = FPU_IN_B.GetFloat32Val();

		for (unsigned x = 0; x < ARRAYSIZE(pipeStages) - 1; ++x)
		{
			pipeStages[x] = pipeStages[x + 1];
			pipeStagesValid[x] = pipeStagesValid[x + 1];
		}
		pipeStages[ARRAYSIZE(pipeStages) - 1] = 0.0f;
		pipeStagesValid[ARRAYSIZE(pipeStages) - 1] = false;

		FPU_OUT_RESULT = pipeStages[0];

		if (FPU_IMUL_GO.GetBoolVal() )
		{
			// Multiply pipe runs in 5 cycles:
			const float multResult = aVal * bVal;
			pipeStages[MUL_CYCLES] = multResult;
			if (pipeStagesValid[MUL_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[MUL_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: %f * %f = %f\n", fpuIndex, aVal, bVal, multResult);
		}
	}

	void UpdateRcpOnly(const std_logic_port& FPU_ISPEC_GO, 
		const std_logic_vector_port<32>& FPU_IN_A,
		std_logic_vector_port<32>& FPU_OUT_RESULT)
	{
		const float aVal = FPU_IN_A.GetFloat32Val();

		for (unsigned x = 0; x < ARRAYSIZE(pipeStages) - 1; ++x)
		{
			pipeStages[x] = pipeStages[x + 1];
			pipeStagesValid[x] = pipeStagesValid[x + 1];
		}
		pipeStages[ARRAYSIZE(pipeStages) - 1] = 0.0f;
		pipeStagesValid[ARRAYSIZE(pipeStages) - 1] = false;

		FPU_OUT_RESULT = pipeStages[0];

		if (FPU_ISPEC_GO.GetBoolVal() )
		{
			// Special pipe runs in 14 cycles:
			const float rcpResult = 1.0f / aVal;
			pipeStages[SPEC_CYCLES] = rcpResult;
			if (pipeStagesValid[SPEC_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[SPEC_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: rcp(%f) = %f\n", fpuIndex, aVal, rcpResult);
		}
	}

	void UpdateCnvOnly(const std_logic_port& FPU_ICNV_GO, 
		const std_logic_vector_port<3>& FPU_IN_MODE,
		const std_logic_vector_port<32>& FPU_IN_A,
		std_logic_vector_port<32>& FPU_OUT_RESULT)
	{
		const float aVal = FPU_IN_A.GetFloat32Val();
		const unsigned char inMode = FPU_IN_MODE.GetUint8Val();

		for (unsigned x = 0; x < ARRAYSIZE(pipeStages) - 1; ++x)
		{
			pipeStages[x] = pipeStages[x + 1];
			pipeStagesValid[x] = pipeStagesValid[x + 1];
		}
		pipeStages[ARRAYSIZE(pipeStages) - 1] = 0.0f;
		pipeStagesValid[ARRAYSIZE(pipeStages) - 1] = false;

		FPU_OUT_RESULT = pipeStages[0];

		if (FPU_ICNV_GO.GetBoolVal() )
		{
			// Convert pipe runs in 2 cycles:
			const eConvertMode cnvMode = (const eConvertMode)inMode;
			const int convertResult = ComputeConvert(aVal, cnvMode);
			pipeStages[CNV_CYCLES] = *reinterpret_cast<const float* const>(&convertResult);
			if (pipeStagesValid[CNV_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[CNV_CYCLES] = true;
			if (enableDebugOutput)
			{
				switch (cnvMode)
				{
				default:
					__debugbreak(); // Should never be here!
				case F_Frc:
					printf("FPU%u: %s(%u)(%f) = %f\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, aVal, *(const float* const)&convertResult);
					break;
				case F_to_U24_RoundNearestEven:
				case F_to_UNORM16:
				case F_to_UNORM8:
					printf("FPU%u: %s(%u)(%f) = %i\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, aVal, convertResult);
					break;
				case F_to_I16_RoundNearestEven:
					printf("FPU%u: %s(%u)(%f) = %hi\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, aVal, (const short)convertResult);
					break;
				case F_to_Half:
					printf("FPU%u: %s(%u)(%f) = 0x%04X(%f)\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, aVal, (const unsigned short)convertResult, SoftHalfToFloat( (const unsigned short)convertResult) );
					break;
				case Half_to_F:
					printf("FPU%u: %s(%u)(0x%04X) = %f\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, *(const unsigned short* const)&aVal, *(const float* const)&convertResult);
					break;
				case U32_to_F:
					printf("FPU%u: %s(%u)(%u) = %f\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, *(const unsigned* const)&aVal, *(const float* const)&convertResult);
					break;
				}
			}
		}
	}

	void Update(const std_logic_port& FPU_ISHFT_GO, const std_logic_port& FPU_IMUL_GO, const std_logic_port& FPU_IADD_GO, const std_logic_port& FPU_ICMP_GO, const std_logic_port& FPU_ISPEC_GO, const std_logic_port& FPU_ICNV_GO, const std_logic_port& FPU_IBIT_GO,
		const std_logic_vector_port<32>& FPU_IN_A, const std_logic_vector_port<32>& FPU_IN_B, const std_logic_vector_port<3>& FPU_IN_MODE,
		std_logic_vector_port<32>& FPU_OUT_RESULT)
	{
		const float aVal = FPU_IN_A.GetFloat32Val();
		const float bVal = FPU_IN_B.GetFloat32Val();
		const unsigned char inMode = FPU_IN_MODE.GetUint8Val();

		if (FPU_ICMP_GO.GetBoolVal() + FPU_IADD_GO.GetBoolVal() + FPU_IMUL_GO.GetBoolVal() + FPU_ISHFT_GO.GetBoolVal() + FPU_ISPEC_GO.GetBoolVal() + FPU_ICNV_GO.GetBoolVal() + FPU_IBIT_GO.GetBoolVal() > 1)
		{
			// Error: Multi-state FPU operations not supported!
			__debugbreak();
		}

		for (unsigned x = 0; x < ARRAYSIZE(pipeStages) - 1; ++x)
		{
			pipeStages[x] = pipeStages[x + 1];
			pipeStagesValid[x] = pipeStagesValid[x + 1];
		}
		pipeStages[ARRAYSIZE(pipeStages) - 1] = 0.0f;
		pipeStagesValid[ARRAYSIZE(pipeStages) - 1] = false;

		FPU_OUT_RESULT = pipeStages[0];

		if (FPU_ICMP_GO.GetBoolVal() )
		{
			// Compare pipe runs in 1 cycle:
			const eCmpType cmpMode = (const eCmpType)inMode;
			const float compareResult = ComputeCompare(aVal, bVal, cmpMode);
			pipeStages[CMP_CYCLES] = compareResult;
			if (pipeStagesValid[CMP_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[CMP_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: %s(%u)(%f, %f) = %f\n", fpuIndex, GetCompareModeString(cmpMode), cmpMode, aVal, bVal, compareResult);
		}
		else if (FPU_IADD_GO.GetBoolVal() )
		{
			// Add pipe runs in 4 cycles:
			const float addResult = aVal + bVal;
			pipeStages[ADD_CYCLES] = addResult;
			if (pipeStagesValid[ADD_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[ADD_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: %f + %f = %f\n", fpuIndex, aVal, bVal, addResult);
		}
		else if (FPU_IMUL_GO.GetBoolVal() )
		{
			// Multiply pipe runs in 5 cycles:
			const float multResult = aVal * bVal;
			pipeStages[MUL_CYCLES] = multResult;
			if (pipeStagesValid[MUL_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[MUL_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: %f * %f = %f\n", fpuIndex, aVal, bVal, multResult);
		}
		else if (FPU_ISPEC_GO.GetBoolVal() )
		{
			// Special pipe runs in 14 cycles:
			const eSpecMode specMode = (const eSpecMode)inMode;
			float specResult = 0.0f;
			switch (specMode)
			{
			default:
#ifdef _DEBUG
				__debugbreak(); // Should never be here! Invalid mode set on SPEC pipe!
#endif
			case RcpMode:
				specResult = 1.0f / aVal;
				break;
			case RsqMode:
				specResult = 1.0f / sqrtf(fabs(aVal) );
				break;
			}
			pipeStages[SPEC_CYCLES] = specResult;
			if (pipeStagesValid[SPEC_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[SPEC_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: %s(%f) = %f\n", fpuIndex, GetSpecModeString(specMode), aVal, specResult);
		}
		else if (FPU_ISHFT_GO.GetBoolVal() )
		{
			// Shift pipe runs in 1 cycle:
			const eShftMode shftMode = (const eShftMode)inMode;
			const float shiftResult = ComputeShift(aVal, shftMode);
			pipeStages[SHFT_CYCLES] = shiftResult;
			if (pipeStagesValid[SHFT_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[SHFT_CYCLES] = true;
			if (enableDebugOutput)
				printf("FPU%u: %s(%u)(%f) = %f\n", fpuIndex, GetShiftModeString(shftMode), shftMode, aVal, shiftResult);
		}
		else if (FPU_ICNV_GO.GetBoolVal() )
		{
			// Convert pipe runs in 2 cycles:
			const eConvertMode cnvMode = (const eConvertMode)inMode;
			const int convertResult = ComputeConvert(aVal, cnvMode);
			pipeStages[CNV_CYCLES] = *reinterpret_cast<const float* const>(&convertResult);
			if (pipeStagesValid[CNV_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[CNV_CYCLES] = true;
			if (enableDebugOutput)
			{
				switch (cnvMode)
				{
				default:
					__debugbreak(); // Should never be here!
				case F_Frc:
					printf("FPU%u: %s(%u)(%f) = %f\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, aVal, *(const float* const)&convertResult);
					break;
				case F_to_U24_RoundNearestEven:
				case F_to_UNORM16:
				case F_to_UNORM8:
					printf("FPU%u: %s(%u)(%f) = %i\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, aVal, convertResult);
					break;
				case F_to_I16_RoundNearestEven:
					printf("FPU%u: %s(%u)(%f) = %hi\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, aVal, (const short)convertResult);
					break;
				case F_to_Half:
					printf("FPU%u: %s(%u)(%f) = 0x%04X(%f)\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, aVal, (const unsigned short)convertResult, SoftHalfToFloat( (const unsigned short)convertResult) );
					break;
				case Half_to_F:
					printf("FPU%u: %s(%u)(0x%04X) = %f\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, *(const unsigned short* const)&aVal, *(const float* const)&convertResult);
					break;
				case U32_to_F:
					printf("FPU%u: %s(%u)(%u) = %f\n", fpuIndex, GetConvertModeString(cnvMode), cnvMode, *(const unsigned* const)&aVal, *(const float* const)&convertResult);
					break;
				}
			}
		}
		else if (FPU_IBIT_GO.GetBoolVal() )
		{
			// Bit-ops pipe runs in 1 cycle:
			const eBitMode bitMode = (const eBitMode)inMode;
			const unsigned bitResult = ComputeBitwise(aVal, bVal, bitMode);
			pipeStages[BIT_CYCLES] = *(const float* const)&bitResult;
			if (pipeStagesValid[BIT_CYCLES] == true)
			{
				__debugbreak(); // Error: Overwriting existing FPU pipe stage!
			}
			pipeStagesValid[BIT_CYCLES] = true;
			if (enableDebugOutput)
			{
				switch (bitMode)
				{
				default:
					__debugbreak(); // Should never be here!
				case BShftL8: // 0
				case BShftL16: // 1
				case BShftL24: // 2
				case BShftR8: // 4
				case BShftR16: // 5
				case BShftR24: // 6
					printf("FPU%u: %s(%u)(0x%08X) = 0x%08X\n", fpuIndex, GetBitwiseModeString(bitMode), bitMode, *(const unsigned* const)&aVal, bitResult);
					break;
				case BOr: // 3
				case BAnd: // 7
					printf("FPU%u: %s(%u)(0x%08X, 0x%08X) = 0x%08X\n", fpuIndex, GetBitwiseModeString(bitMode), bitMode, *(const unsigned* const)&aVal, *(const unsigned* const)&bVal, bitResult);
					break;
				}
			}
		}
	}
};
