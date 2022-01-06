#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include <stdio.h>
#include <string>
#include "CPPTestbench.h"
#include "RenderWindow.h"

static const WCHAR* const simengine_libpath = L"D:\\Xilinx\\Vivado\\2018.1\\lib\\win64.o";
static const WCHAR* const simengine_imageformats_libpath = L"D:\\Xilinx\\Vivado\\2018.1\\lib\\win64.o\\imageformats";
static const char* const simengine_libname = "librdi_simulator_kernel.dll";
static const char* const design_name = "FloatALU";
static char wdbName[] = "xsim.wdb";
static D3DCOLOR colorsArray[640 * 480] = {0};
static RenderWindow* renderWindow = NULL;

static const float negInf = -(INFINITY);
static const float posInf = -(INFINITY);
static const uint32_t denormalFloatBits = 0x003FFFFF;
static const float denormalFloat = *(reinterpret_cast<const float* const>(&denormalFloatBits) ); // Has a value of 5.87747035281e-39

static std::string getcurrentdir()
{
	char buf[MAX_PATH] = {0};
	GetCurrentDirectoryA(sizeof(buf), buf);
	buf[sizeof(buf) - 1] = 0;
	return buf;
}

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

	// CMP(a, b, c) computes component-wise (a >= 0 ? b : c). CND(a, b, c) computes component-wise (a > 0.5 ? b : c).
	CmpCmp, // 5
	CmpCnd // 6
};

// Checks for exact bitwise equality between two floats (will treat -0.0f and 0.0f differently, or different NaN representations differently).
// Returns true if the floats are exactly equal, or false otherwise.
static const bool CompareFloatBitwise(const float a, const float b)
{
	return *reinterpret_cast<const uint32_t* const>(&a) == *reinterpret_cast<const uint32_t* const>(&b);
}

static const int RunTestsFloatCMP(Xsi::Loader& loader, std_logic_port& clk, std_logic_vector_port<32>& ICMP_A, std_logic_vector_port<32>& ICMP_B, std_logic_vector_port<32>& ICMP_C,
	std_logic_vector_port<3>& ICMP_MODE, std_logic_port& ICMP_GO, std_logic_vector_port<32>& OCMP)
{
	const auto minTestFunc = [&](const float a, const float b) -> float
	{
		ICMP_A = a;
		ICMP_B = b;
		ICMP_MODE = CmpMin;
		ICMP_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OCMP.GetFloat32Val();

		// Now reverse a and b and make sure that we get the same result!
		ICMP_A = b;
		ICMP_B = a;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ba = OCMP.GetFloat32Val();

		if (CompareFloatBitwise(ab, ba) == false)
		{
			__debugbreak();
		}

		return ab;
	};

	const auto maxTestFunc = [&](const float a, const float b) -> float
	{
		ICMP_A = a;
		ICMP_B = b;
		ICMP_MODE = CmpMax;
		ICMP_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OCMP.GetFloat32Val();

		// Now reverse a and b and make sure that we get the same result!
		ICMP_A = b;
		ICMP_B = a;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ba = OCMP.GetFloat32Val();

		if (CompareFloatBitwise(ab, ba) == false)
		{
			__debugbreak();
		}

		return ab;
	};

	const auto sltTestFunc = [&](const float a, const float b) -> float
	{
		ICMP_A = a;
		ICMP_B = b;
		ICMP_MODE = CmpSlt;
		ICMP_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		return OCMP.GetFloat32Val();
	};

	const auto sgeTestFunc = [&](const float a, const float b) -> float
	{
		ICMP_A = a;
		ICMP_B = b;
		ICMP_MODE = CmpSge;
		ICMP_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		return OCMP.GetFloat32Val();
	};

	const auto sgnTestFunc = [&](const float a) -> float
	{
		ICMP_A = a;
		ICMP_MODE = CmpSgn;
		ICMP_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		return OCMP.GetFloat32Val();
	};

	const auto cmpTestFunc = [&](const float a, const float b, const float c) -> float
	{
		ICMP_A = a;
		ICMP_B = b;
		ICMP_C = c;
		ICMP_MODE = CmpCmp;
		ICMP_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		return OCMP.GetFloat32Val();
	};

	const auto cndTestFunc = [&](const float a, const float b, const float c) -> float
	{
		ICMP_A = a;
		ICMP_B = b;
		ICMP_C = c;
		ICMP_MODE = CmpCnd;
		ICMP_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		return OCMP.GetFloat32Val();
	};

	bool allTestsSuccessful = true;

	// Min tests:
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(12.34f, 56.78f), 12.34f); // Simple A < B case with two positive normal values
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(-12.34f, 56.78f), -12.34f); // Case with one negative and one positive
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(12.34f, -56.78f), -56.78f); // Case with one negative and one positive
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(-12.34f, -56.78f), -56.78f); // Case with two negative values
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(0.0f, 56.78f), 0.0f); // Case with one zero and a positive number
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(0.0f, -56.78f), -56.78f); // Case with one zero and a negative number
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(-0.0f, -56.78f), -56.78f); // Case with one negative zero and a negative number
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(0.0f, 0.0f), 0.0f); // Case with two zeros
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(-0.0f, -0.0f), -0.0f); // Case with two negative zeross
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(0.0f, -0.0f), -0.0f); // min(0.0f, -0.0f) = 0.0f
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(0.0f, denormalFloat), 0.0f); // min(0.0f, denormal) = 0.0f
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(0.0f, -denormalFloat), -denormalFloat); // min(0.0f, -denormal) = -denormal
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(-INFINITY, -INFINITY), -INFINITY); // min(-INF, -INF) = -INF
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(1.0f, -INFINITY), -INFINITY); // min(F, -INF) = -INF
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(INFINITY, denormalFloat), denormalFloat); // min(INF, denormal) = denormal
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(INFINITY, -denormalFloat), -denormalFloat); // min(INF, -denormal) = -denormal
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(-INFINITY, denormalFloat), -INFINITY); // min(-INF, denormal) = -INF
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(-INFINITY, -denormalFloat), -INFINITY); // min(-INF, -denormal) = -INF
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(INFINITY, -INFINITY), -INFINITY); // min(INF, -INF) = -INF
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(NAN, -INFINITY), -INFINITY); // min(NaN, -INF) = -INF
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(INFINITY, 1.0f), 1.0f); // min(INF, F) = F
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(1.0f, NAN), 1.0f); // min(F, NAN) = F
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(INFINITY, INFINITY), INFINITY); // min(INF, INF) = INF
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(NAN, INFINITY), INFINITY); // min(NaN, INF) = INF
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(NAN, denormalFloat), denormalFloat); // min(NaN, denormal) = denormal
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(NAN, -denormalFloat), -denormalFloat); // min(NaN, -denormal) = -denormal
	allTestsSuccessful &= CompareFloatBitwise(minTestFunc(NAN, NAN), NAN); // min(NaN, NaN) = NaN

	// Max tests:
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(12.34f, 56.78f), 56.78f); // Simple A > B case with two positive normal values
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(-12.34f, 56.78f), 56.78f); // Case with one negative and one positive
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(12.34f, -56.78f), 12.34f); // Case with one negative and one positive
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(-12.34f, -56.78f), -12.34f); // Case with two negative values
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(0.0f, 56.78f), 56.78f); // Case with one zero and a positive number
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(0.0f, -56.78f), 0.0f); // Case with one zero and a negative number
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(-0.0f, -56.78f), -0.0f); // Case with one negative zero and a negative number
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(0.0f, 0.0f), 0.0f); // Case with two zeros
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(-0.0f, -0.0f), -0.0f); // Case with two negative zeross
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(0.0f, -0.0f), 0.0f); // max(0.0f, -0.0f) = 0.0f
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(0.0f, denormalFloat), denormalFloat); // max(0.0f, denormal) = denormal
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(0.0f, -denormalFloat), 0.0f); // max(0.0f, -denormal) = 0.0f
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(-INFINITY, -INFINITY), -INFINITY); // max(-INF, -INF) = -INF
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(1.0f, -INFINITY), 1.0f); // max(F, -INF) = -INF
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(INFINITY, denormalFloat), INFINITY); // max(INF, denormal) = INF
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(INFINITY, -denormalFloat), INFINITY); // max(INF, -denormal) = INF
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(-INFINITY, denormalFloat), denormalFloat); // max(-INF, denormal) = denormal
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(-INFINITY, -denormalFloat), -denormalFloat); // max(-INF, -denormal) = -denormal
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(INFINITY, -INFINITY), INFINITY); // max(INF, -INF) = -INF
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(NAN, -INFINITY), -INFINITY); // max(NaN, -INF) = -INF
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(INFINITY, 1.0f), INFINITY); // max(INF, F) = F
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(1.0f, NAN), 1.0f); // max(F, NAN) = F
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(INFINITY, INFINITY), INFINITY); // max(INF, INF) = INF
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(NAN, INFINITY), INFINITY); // max(NaN, INF) = INF
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(NAN, denormalFloat), denormalFloat); // max(NaN, denormal) = denormal
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(NAN, -denormalFloat), -denormalFloat); // max(NaN, -denormal) = -denormal
	allTestsSuccessful &= CompareFloatBitwise(maxTestFunc(NAN, NAN), NAN); // max(NaN, NaN) = NaN

	// SLT tests:
	allTestsSuccessful &= (sltTestFunc(12.34f, 56.78f) == 1.0f); // Simple positive-positive test
	allTestsSuccessful &= (sltTestFunc(56.78f, 12.34f) == 0.0f); // Reversing the order of the arguments is supposed to flip the result for this function
	allTestsSuccessful &= (sltTestFunc(34.56f, 34.56f) == 0.0f); // Sameness test (should evaluate false since this is a LT and not a LE test)
	allTestsSuccessful &= (sltTestFunc(-56.78f, 12.34f) == 1.0f); // Negative/positive test
	allTestsSuccessful &= (sltTestFunc(56.78f, -12.34f) == 0.0f); // Positive/negative test
	allTestsSuccessful &= (sltTestFunc(-56.78f, -12.34f) == 1.0f); // Negative/negative test
	allTestsSuccessful &= (sltTestFunc(56.78f, 0.0f) == 0.0f); // Positive/zero test
	allTestsSuccessful &= (sltTestFunc(-56.78f, 0.0f) == 1.0f); // Negative/zero test
	allTestsSuccessful &= (sltTestFunc(56.78f, -0.0f) == 0.0f); // Positive/zero test
	allTestsSuccessful &= (sltTestFunc(-56.78f, -0.0f) == 1.0f); // Negative/zero test
	allTestsSuccessful &= (sltTestFunc(56.78f, denormalFloat) == 0.0f); // Positive/denormal test
	allTestsSuccessful &= (sltTestFunc(-56.78f, denormalFloat) == 1.0f); // Negative/denormal test
	allTestsSuccessful &= (sltTestFunc(56.78f, -denormalFloat) == 0.0f); // Positive/negative denormal test
	allTestsSuccessful &= (sltTestFunc(-56.78f, -denormalFloat) == 1.0f); // Negative/negative denormal test
	allTestsSuccessful &= (sltTestFunc(0.0f, denormalFloat) == 0.0f); // Zero/denormal test
	allTestsSuccessful &= (sltTestFunc(-0.0f, denormalFloat) == 0.0f); // Negative zero/denormal test
	allTestsSuccessful &= (sltTestFunc(0.0f, -denormalFloat) == 0.0f); // Zero/negative denormal test
	allTestsSuccessful &= (sltTestFunc(-0.0f, -denormalFloat) == 0.0f); // Negative zero/negative denormal test
	allTestsSuccessful &= (sltTestFunc(denormalFloat, denormalFloat) == 0.0f); // Zero/denormal test
	allTestsSuccessful &= (sltTestFunc(denormalFloat, -denormalFloat) == 0.0f); // Zero/denormal test
	allTestsSuccessful &= (sltTestFunc(-denormalFloat, denormalFloat) == 0.0f); // Zero/denormal test
	allTestsSuccessful &= (sltTestFunc(-denormalFloat, -denormalFloat) == 0.0f); // Zero/denormal test
	allTestsSuccessful &= (sltTestFunc(0.0f, -0.0f) == 0.0f); // Zero/negative zero test (zero should equal negative zero here)
	allTestsSuccessful &= (sltTestFunc(-0.0f, 0.0f) == 0.0f); // Negative zero/zero test (zero should equal negative zero here)
	allTestsSuccessful &= (sltTestFunc(-0.0f, -0.0f) == 0.0f); // Negative zero/negative zero test (zero should equal negative zero here)
	allTestsSuccessful &= (sltTestFunc(0.0f, 0.0f) == 0.0f); // Zero/zero test (zero should equal negative zero here)
	allTestsSuccessful &= (sltTestFunc(12.34f, INFINITY) == 1.0f); // Positive/infinity test
	allTestsSuccessful &= (sltTestFunc(-12.34f, INFINITY) == 1.0f); // Negative/infinity test
	allTestsSuccessful &= (sltTestFunc(0.0f, INFINITY) == 1.0f); // Zero/infinity test
	allTestsSuccessful &= (sltTestFunc(-0.0f, INFINITY) == 1.0f); // Zero/infinity test
	allTestsSuccessful &= (sltTestFunc(denormalFloat, INFINITY) == 1.0f); // Denormal/infinity test
	allTestsSuccessful &= (sltTestFunc(-denormalFloat, INFINITY) == 1.0f); // Negative denormal/infinity test
	allTestsSuccessful &= (sltTestFunc(INFINITY, 12.34f) == 0.0f); // Infinity/positive test
	allTestsSuccessful &= (sltTestFunc(INFINITY, -12.34f) == 0.0f); // Infinity/negative test
	allTestsSuccessful &= (sltTestFunc(INFINITY, 0.0f) == 0.0f); // Infinity/zero test
	allTestsSuccessful &= (sltTestFunc(INFINITY, -0.0f) == 0.0f); // Infinity/zero test
	allTestsSuccessful &= (sltTestFunc(12.34f, -INFINITY) == 0.0f); // Positive/negative infinity test
	allTestsSuccessful &= (sltTestFunc(-12.34f, -INFINITY) == 0.0f); // Negative/negative infinity test
	allTestsSuccessful &= (sltTestFunc(0.0f, -INFINITY) == 0.0f); // Zero/negative infinity test
	allTestsSuccessful &= (sltTestFunc(-0.0f, -INFINITY) == 0.0f); // Zero/negative infinity test
	allTestsSuccessful &= (sltTestFunc(denormalFloat, -INFINITY) == 0.0f); // Denormal/negative infinity test
	allTestsSuccessful &= (sltTestFunc(-denormalFloat, -INFINITY) == 0.0f); // Negative denormal/negative infinity test
	allTestsSuccessful &= (sltTestFunc(-INFINITY, 12.34f) == 1.0f); // Negative infinity/positive test
	allTestsSuccessful &= (sltTestFunc(-INFINITY, -12.34f) == 1.0f); // Negative infinity/negative test
	allTestsSuccessful &= (sltTestFunc(-INFINITY, 0.0f) == 1.0f); // Negative infinity/zero test
	allTestsSuccessful &= (sltTestFunc(-INFINITY, -0.0f) == 1.0f); // Negative infinity/zero test
	allTestsSuccessful &= (sltTestFunc(-INFINITY, INFINITY) == 1.0f); // Negative infinity/infinity test
	allTestsSuccessful &= (sltTestFunc(INFINITY, -INFINITY) == 0.0f); // Infinity/negative infinity test
	allTestsSuccessful &= (sltTestFunc(-INFINITY, -INFINITY) == 0.0f); // Negative infinity/negative infinity test
	allTestsSuccessful &= (sltTestFunc(INFINITY, INFINITY) == 0.0f); // Infinity/infinity test
	allTestsSuccessful &= (sltTestFunc(12.34f, NAN) == 0.0f); // Positive/NaN test
	allTestsSuccessful &= (sltTestFunc(NAN, 12.34f) == 0.0f); // NaN/positive test
	allTestsSuccessful &= (sltTestFunc(-12.34f, NAN) == 0.0f); // Negative/NaN test
	allTestsSuccessful &= (sltTestFunc(NAN, -12.34f) == 0.0f); // NaN/negative test
	allTestsSuccessful &= (sltTestFunc(0.0f, NAN) == 0.0f); // Zero/NaN test
	allTestsSuccessful &= (sltTestFunc(NAN, 0.0f) == 0.0f); // NaN/zero test
	allTestsSuccessful &= (sltTestFunc(-0.0f, NAN) == 0.0f); // Zero/NaN test
	allTestsSuccessful &= (sltTestFunc(NAN, -0.0f) == 0.0f); // NaN/zero test
	allTestsSuccessful &= (sltTestFunc(denormalFloat, NAN) == 0.0f); // Denormal/NaN test
	allTestsSuccessful &= (sltTestFunc(NAN, denormalFloat) == 0.0f); // NaN/denormal test
	allTestsSuccessful &= (sltTestFunc(-denormalFloat, NAN) == 0.0f); // Negative denormal/NaN test
	allTestsSuccessful &= (sltTestFunc(NAN, -denormalFloat) == 0.0f); // NaN/negative denormal test
	allTestsSuccessful &= (sltTestFunc(INFINITY, NAN) == 0.0f); // Infinity/NaN test
	allTestsSuccessful &= (sltTestFunc(NAN, INFINITY) == 0.0f); // NaN/infinity test
	allTestsSuccessful &= (sltTestFunc(-INFINITY, NAN) == 0.0f); // Negative infinity/NaN test
	allTestsSuccessful &= (sltTestFunc(NAN, -INFINITY) == 0.0f); // NaN/negative infinity test
	allTestsSuccessful &= (sltTestFunc(NAN, NAN) == 0.0f); // NaN/NaN test

	// SGE tests:
	allTestsSuccessful &= (sgeTestFunc(12.34f, 56.78f) == 0.0f); // Simple positive-positive test
	allTestsSuccessful &= (sgeTestFunc(56.78f, 12.34f) == 1.0f); // Reversing the order of the arguments is supposed to flip the result for this function
	allTestsSuccessful &= (sgeTestFunc(34.56f, 34.56f) == 1.0f); // Sameness test (should evaluate true since this is a GE and not a GT test)
	allTestsSuccessful &= (sgeTestFunc(-56.78f, 12.34f) == 0.0f); // Negative/positive test
	allTestsSuccessful &= (sgeTestFunc(56.78f, -12.34f) == 1.0f); // Positive/negative test
	allTestsSuccessful &= (sgeTestFunc(-56.78f, -12.34f) == 0.0f); // Negative/negative test
	allTestsSuccessful &= (sgeTestFunc(56.78f, 0.0f) == 1.0f); // Positive/zero test
	allTestsSuccessful &= (sgeTestFunc(-56.78f, 0.0f) == 0.0f); // Negative/zero test
	allTestsSuccessful &= (sgeTestFunc(56.78f, -0.0f) == 1.0f); // Positive/zero test
	allTestsSuccessful &= (sgeTestFunc(-56.78f, -0.0f) == 0.0f); // Negative/zero test
	allTestsSuccessful &= (sgeTestFunc(56.78f, denormalFloat) == 1.0f); // Positive/denormal test
	allTestsSuccessful &= (sgeTestFunc(-56.78f, denormalFloat) == 0.0f); // Negative/denormal test
	allTestsSuccessful &= (sgeTestFunc(56.78f, -denormalFloat) == 1.0f); // Positive/negative denormal test
	allTestsSuccessful &= (sgeTestFunc(-56.78f, -denormalFloat) == 0.0f); // Negative/negative denormal test
	allTestsSuccessful &= (sgeTestFunc(0.0f, denormalFloat) == 1.0f); // Zero/denormal test
	allTestsSuccessful &= (sgeTestFunc(-0.0f, denormalFloat) == 1.0f); // Negative zero/denormal test
	allTestsSuccessful &= (sgeTestFunc(0.0f, -denormalFloat) == 1.0f); // Zero/negative denormal test
	allTestsSuccessful &= (sgeTestFunc(-0.0f, -denormalFloat) == 1.0f); // Negative zero/negative denormal test
	allTestsSuccessful &= (sgeTestFunc(denormalFloat, denormalFloat) == 1.0f); // Zero/denormal test
	allTestsSuccessful &= (sgeTestFunc(denormalFloat, -denormalFloat) == 1.0f); // Zero/denormal test
	allTestsSuccessful &= (sgeTestFunc(-denormalFloat, denormalFloat) == 1.0f); // Zero/denormal test
	allTestsSuccessful &= (sgeTestFunc(-denormalFloat, -denormalFloat) == 1.0f); // Zero/denormal test
	allTestsSuccessful &= (sgeTestFunc(0.0f, -0.0f) == 1.0f); // Zero/negative zero test (zero should equal negative zero here)
	allTestsSuccessful &= (sgeTestFunc(-0.0f, 0.0f) == 1.0f); // Negative zero/zero test (zero should equal negative zero here)
	allTestsSuccessful &= (sgeTestFunc(-0.0f, -0.0f) == 1.0f); // Negative zero/negative zero test (zero should equal negative zero here)
	allTestsSuccessful &= (sgeTestFunc(0.0f, 0.0f) == 1.0f); // Zero/zero test (zero should equal negative zero here)
	allTestsSuccessful &= (sgeTestFunc(12.34f, INFINITY) == 0.0f); // Positive/infinity test
	allTestsSuccessful &= (sgeTestFunc(-12.34f, INFINITY) == 0.0f); // Negative/infinity test
	allTestsSuccessful &= (sgeTestFunc(0.0f, INFINITY) == 0.0f); // Zero/infinity test
	allTestsSuccessful &= (sgeTestFunc(-0.0f, INFINITY) == 0.0f); // Zero/infinity test
	allTestsSuccessful &= (sgeTestFunc(denormalFloat, INFINITY) == 0.0f); // Denormal/infinity test
	allTestsSuccessful &= (sgeTestFunc(-denormalFloat, INFINITY) == 0.0f); // Negative denormal/infinity test
	allTestsSuccessful &= (sgeTestFunc(INFINITY, 12.34f) == 1.0f); // Infinity/positive test
	allTestsSuccessful &= (sgeTestFunc(INFINITY, -12.34f) == 1.0f); // Infinity/negative test
	allTestsSuccessful &= (sgeTestFunc(INFINITY, 0.0f) == 1.0f); // Infinity/zero test
	allTestsSuccessful &= (sgeTestFunc(INFINITY, -0.0f) == 1.0f); // Infinity/zero test
	allTestsSuccessful &= (sgeTestFunc(12.34f, -INFINITY) == 1.0f); // Positive/negative infinity test
	allTestsSuccessful &= (sgeTestFunc(-12.34f, -INFINITY) == 1.0f); // Negative/negative infinity test
	allTestsSuccessful &= (sgeTestFunc(0.0f, -INFINITY) == 1.0f); // Zero/negative infinity test
	allTestsSuccessful &= (sgeTestFunc(-0.0f, -INFINITY) == 1.0f); // Zero/negative infinity test
	allTestsSuccessful &= (sgeTestFunc(denormalFloat, -INFINITY) == 1.0f); // Denormal/negative infinity test
	allTestsSuccessful &= (sgeTestFunc(-denormalFloat, -INFINITY) == 1.0f); // Negative denormal/negative infinity test
	allTestsSuccessful &= (sgeTestFunc(-INFINITY, 12.34f) == 0.0f); // Negative infinity/positive test
	allTestsSuccessful &= (sgeTestFunc(-INFINITY, -12.34f) == 0.0f); // Negative infinity/negative test
	allTestsSuccessful &= (sgeTestFunc(-INFINITY, 0.0f) == 0.0f); // Negative infinity/zero test
	allTestsSuccessful &= (sgeTestFunc(-INFINITY, -0.0f) == 0.0f); // Negative infinity/zero test
	allTestsSuccessful &= (sgeTestFunc(-INFINITY, INFINITY) == 0.0f); // Negative infinity/infinity test
	allTestsSuccessful &= (sgeTestFunc(INFINITY, -INFINITY) == 1.0f); // Infinity/negative infinity test
	allTestsSuccessful &= (sgeTestFunc(-INFINITY, -INFINITY) == 1.0f); // Negative infinity/negative infinity test
	allTestsSuccessful &= (sgeTestFunc(INFINITY, INFINITY) == 1.0f); // Infinity/infinity test
	allTestsSuccessful &= (sgeTestFunc(12.34f, NAN) == 0.0f); // Positive/NaN test
	allTestsSuccessful &= (sgeTestFunc(NAN, 12.34f) == 0.0f); // NaN/positive test
	allTestsSuccessful &= (sgeTestFunc(-12.34f, NAN) == 0.0f); // Negative/NaN test
	allTestsSuccessful &= (sgeTestFunc(NAN, -12.34f) == 0.0f); // NaN/negative test
	allTestsSuccessful &= (sgeTestFunc(0.0f, NAN) == 0.0f); // Zero/NaN test
	allTestsSuccessful &= (sgeTestFunc(NAN, 0.0f) == 0.0f); // NaN/zero test
	allTestsSuccessful &= (sgeTestFunc(-0.0f, NAN) == 0.0f); // Zero/NaN test
	allTestsSuccessful &= (sgeTestFunc(NAN, -0.0f) == 0.0f); // NaN/zero test
	allTestsSuccessful &= (sgeTestFunc(denormalFloat, NAN) == 0.0f); // Denormal/NaN test
	allTestsSuccessful &= (sgeTestFunc(NAN, denormalFloat) == 0.0f); // NaN/denormal test
	allTestsSuccessful &= (sgeTestFunc(-denormalFloat, NAN) == 0.0f); // Negative denormal/NaN test
	allTestsSuccessful &= (sgeTestFunc(NAN, -denormalFloat) == 0.0f); // NaN/negative denormal test
	allTestsSuccessful &= (sgeTestFunc(INFINITY, NAN) == 0.0f); // Infinity/NaN test
	allTestsSuccessful &= (sgeTestFunc(NAN, INFINITY) == 0.0f); // NaN/infinity test
	allTestsSuccessful &= (sgeTestFunc(-INFINITY, NAN) == 0.0f); // Negative infinity/NaN test
	allTestsSuccessful &= (sgeTestFunc(NAN, -INFINITY) == 0.0f); // NaN/negative infinity test
	allTestsSuccessful &= (sgeTestFunc(NAN, NAN) == 0.0f); // NaN/NaN test

	// SGN tests:
	allTestsSuccessful &= (sgnTestFunc(12.34f) == 1.0f); // Positive test
	allTestsSuccessful &= (sgnTestFunc(-56.78f) == -1.0f); // Negative test
	allTestsSuccessful &= (sgnTestFunc(0.0f) == 0.0f); // Zero test
	allTestsSuccessful &= (sgnTestFunc(-0.0f) == 0.0f); // Negative zero test (should evaluate as if positive zero)
	allTestsSuccessful &= (sgnTestFunc(denormalFloat) == 0.0f); // Denormal test
	allTestsSuccessful &= (sgnTestFunc(-denormalFloat) == 0.0f); // Negative denormal test (should evaluate as if zero)
	allTestsSuccessful &= (sgnTestFunc(INFINITY) == 1.0f); // Infinity test
	allTestsSuccessful &= (sgnTestFunc(-INFINITY) == -1.0f); // Infinity test
	allTestsSuccessful &= (sgnTestFunc(NAN) == 1.0f); // NaN test
	allTestsSuccessful &= (sgnTestFunc(-NAN) == 1.0f); // Negative NaN test

	// CMP tests:
	allTestsSuccessful &= (cmpTestFunc(-0.6f, 0.0f, 1.0f) == 1.0f); // Start with the four test cases from the MSDN page
	allTestsSuccessful &= (cmpTestFunc(0.6f, 0.0f, 1.0f) == 0.0f);
	allTestsSuccessful &= (cmpTestFunc(0.0f, 0.0f, 1.0f) == 0.0f);
	allTestsSuccessful &= (cmpTestFunc(0.6f, 1.0f, 0.0f) == 1.0f);
	allTestsSuccessful &= (cmpTestFunc(-0.0f, 1.0f, 0.0f) == 1.0f); // -0.0f counts as 0.0f for this comparison
	allTestsSuccessful &= (cmpTestFunc(denormalFloat, 1.0f, 0.0f) == 1.0f); // denormal counts as 0.0f for this comparison
	allTestsSuccessful &= (cmpTestFunc(-denormalFloat, 1.0f, 0.0f) == 1.0f); // -denormal counts as -0.0f (which counts as 0.0f) for this comparison
	allTestsSuccessful &= (cmpTestFunc(INFINITY, 0.0f, 1.0f) == 0.0f);
	allTestsSuccessful &= (cmpTestFunc(-INFINITY, 0.0f, 1.0f) == 1.0f);
	allTestsSuccessful &= (cmpTestFunc(NAN, 0.0f, 1.0f) == 1.0f);
	allTestsSuccessful &= (cmpTestFunc(-NAN, 0.0f, 1.0f) == 1.0f);
	allTestsSuccessful &= (cmpTestFunc(NAN, 1.0f, 0.0f) == 0.0f);
	allTestsSuccessful &= (cmpTestFunc(-NAN, 1.0f, 0.0f) == 0.0f);

	// CND tests:
	allTestsSuccessful &= (cndTestFunc(-0.5f, 0.0f, 1.0f) == 1.0f); // Start with the four test cases from the MSDN page
	allTestsSuccessful &= (cndTestFunc(0.5f, 0.0f, 1.0f) == 1.0f);
	allTestsSuccessful &= (cndTestFunc(0.0f, 0.0f, 1.0f) == 1.0f);
	allTestsSuccessful &= (cndTestFunc(0.6f, 1.0f, 0.0f) == 1.0f);
	allTestsSuccessful &= (cndTestFunc(-0.6f, 1.0f, 0.0f) == 0.0f);
	allTestsSuccessful &= (cndTestFunc(-0.0f, 1.0f, 0.0f) == 0.0f); // -0.0f counts as 0.0f for this comparison
	allTestsSuccessful &= (cndTestFunc(denormalFloat, 1.0f, 0.0f) == 0.0f); // denormal counts as 0.0f for this comparison
	allTestsSuccessful &= (cndTestFunc(-denormalFloat, 1.0f, 0.0f) == 0.0f); // -denormal counts as -0.0f (which counts as 0.0f) for this comparison
	allTestsSuccessful &= (cndTestFunc(INFINITY, 0.0f, 1.0f) == 0.0f);
	allTestsSuccessful &= (cndTestFunc(-INFINITY, 0.0f, 1.0f) == 1.0f);
	allTestsSuccessful &= (cndTestFunc(NAN, 0.0f, 1.0f) == 1.0f);
	allTestsSuccessful &= (cndTestFunc(-NAN, 0.0f, 1.0f) == 1.0f);
	allTestsSuccessful &= (cndTestFunc(NAN, 1.0f, 0.0f) == 0.0f);
	allTestsSuccessful &= (cndTestFunc(-NAN, 1.0f, 0.0f) == 0.0f);

	return allTestsSuccessful ? S_OK : 1;
}

// Returns true if the a and b floats are close enough to one another
static const bool CompareFloatsCloseEnough(const float a, const float b)
{
	const int32_t ua = *reinterpret_cast<const int32_t* const>(&a);
	const int32_t ub = *reinterpret_cast<const int32_t* const>(&b);
	return abs(ua - ub) < 3;
}

static const int RunTestsFloatADD(Xsi::Loader& loader, std_logic_port& clk, std_logic_vector_port<32>& IADD_A, std_logic_vector_port<32>& IADD_B,
	std_logic_port& IADD_GO, std_logic_vector_port<32>& OADD)
{
	const auto addTestFunc = [&](const float a, const float b) -> float
	{
		IADD_A = a;
		IADD_B = b;
		IADD_GO = true;
		for (unsigned steps = 0; steps < 3; ++steps) // Add takes 3 cycles to run
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OADD.GetFloat32Val();

		IADD_A = b;
		IADD_B = a;
		IADD_GO = true;
		for (unsigned steps = 0; steps < 3; ++steps) // Add takes 3 cycles to run
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ba = OADD.GetFloat32Val();

		if (memcmp(&ab, &ba, sizeof(float) ) != 0) // If A+B != B+A then that's a problem!
		{
			__debugbreak();
		}
		return ab;
	};

	const auto subTestFunc = [&](const float a, const float b) -> float
	{
		return addTestFunc(a, -b);
	};

	const auto pipelinedAddTest = [&](const float a, const float b, const float c, const float d, const float e, const float f, const float g, const float h) -> bool
	{
		IADD_A = 0.0f;
		IADD_B = 0.0f;
		IADD_GO = false;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IADD_A = a;
		IADD_B = b;
		IADD_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IADD_A = a;
		IADD_B = c;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IADD_A = a;
		IADD_B = d;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OADD.GetFloat32Val();
		IADD_A = a;
		IADD_B = e;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ac = OADD.GetFloat32Val();
		IADD_A = a;
		IADD_B = f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ad = OADD.GetFloat32Val();
		IADD_A = a;
		IADD_B = g;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ae = OADD.GetFloat32Val();
		IADD_A = a;
		IADD_B = h;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float af = OADD.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ag = OADD.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ah = OADD.GetFloat32Val();

		const bool abCorrect = CompareFloatsCloseEnough(ab, a + b);
		const bool acCorrect = CompareFloatsCloseEnough(ac, a + c);
		const bool adCorrect = CompareFloatsCloseEnough(ad, a + d);
		const bool aeCorrect = CompareFloatsCloseEnough(ae, a + e);
		const bool afCorrect = CompareFloatsCloseEnough(af, a + f);
		const bool agCorrect = CompareFloatsCloseEnough(ag, a + g);
		const bool ahCorrect = CompareFloatsCloseEnough(ah, a + h);
		return abCorrect && acCorrect && adCorrect && aeCorrect && afCorrect && agCorrect && ahCorrect;
	};

	bool allTestsSuccessful = true;

	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(1.0f, 1.0f), 2.0f); // 1 + 1 = 2
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(1.0f, 2.0f), 3.0f); // 1 + 2 = 3

	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(123.456f, 0.0f), 123.456f); // Additive identity test
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(123.456f, -0.0f), 123.456f); // Additive identity test
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(-123.456f, 0.0f), -123.456f); // Additive identity test
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(-123.456f, -0.0f), -123.456f); // Additive identity test

	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(123.456f, 0.0f), 123.456f); // Subtractive identity test
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(123.456f, -0.0f), 123.456f); // Subtractive identity test
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(-123.456f, 0.0f), -123.456f); // Subtractive identity test
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(-123.456f, -0.0f), -123.456f); // Subtractive identity test

	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(2.0f, 4.0f), 6.0f); // Integer addition test
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(123.0f, 234.0f), 357.0f); // Integer addition test
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(1.5, 1.5), 3.0f); // Fractionals -> integers addition test
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(123.45, 567.89f), 691.34f); // Fractional -> Fractional
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(18446742974197923840.0f, 0.00000222385720949347387432f), 18446742974197923840.0f); // Large exponent + tiny (non-denormal) exponent = no change to large exponent value

	// Addition with negatives
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(-1.0f, 1.0f), 0.0f);
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(1.0f, -1.0f), 0.0f);
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(-1.0f, -1.0f), -2.0f);
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(-123.0f, 234.0f), 111.0f);
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(123.0f, -234.0f), -111.0f);
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(123.45f, -567.89f), -444.44f);
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(-123.45f, 567.89f), 444.44f);
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(-123.45f, -567.89f), -691.34f);
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(691.34f, -567.89f), 123.4500123f);
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(567.89f, -691.34f), -123.4500123f);

	// Basic subtraction tests:
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(1.0f, 1.0f), 0.0f); // Integer
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(6.0f, 4.0f), 2.0f); // Integer power of 2
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(123.456f, 123.456f), 0.0f);
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(691.34f, 567.89f), 123.4500123f);
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(567.89f, 691.34f), -123.4500123f);
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(-567.89f, 691.34f), -1259.2300415f);
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(-567.89f, -691.34f), 123.4500123f);
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(-123.45f, -567.89f), 444.44f);
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(18446742974197923840.0f, 0.00000222385720949347387432f), 18446742974197923840.0f);
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc(0.00000222385720949347387432f, 18446742974197923840.0f), -18446742974197923840.0f);

	// Weird addition/subtraction tests:
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(1.99999988079071044922f, 0.00000011920928955078f), 2.0f);
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(8388607.0f, 8388609.0f), 16777216.0f); // The largest exactly representable integer as a float
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(3.40282346638528859812e38f, 3.40282346638528859812e38f), INFINITY); // Non-infinite overflow into infinite
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc( ( (float)INFINITY), 3.40282346638528859812e38f), INFINITY); // INF - X = INF
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc( (-(float)INFINITY), 3.40282346638528859812e38f), -INFINITY); // -INF + X = -INF
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc( ( (float)INFINITY), ( (float)INFINITY) ), INFINITY); // INF + INF = INF
	allTestsSuccessful &= CompareFloatsCloseEnough(subTestFunc( (-(float)INFINITY), ( (float)INFINITY) ), -INFINITY); // -INF - INF = -INF
	allTestsSuccessful &= isnan(addTestFunc( (-(float)INFINITY), ( (float)INFINITY) ) ); // -INF + INF = NaN
	allTestsSuccessful &= isnan(subTestFunc( ( (float)INFINITY), ( (float)INFINITY) ) ); // INF - INF = NaN
	allTestsSuccessful &= isnan(addTestFunc(1.0f, NAN) ); // X + NaN = NaN
	allTestsSuccessful &= isnan(addTestFunc(NAN, 1.0f) ); // NaN + X = NaN
	allTestsSuccessful &= isnan(subTestFunc(1.0f, NAN) ); // X - NaN = NaN
	allTestsSuccessful &= isnan(subTestFunc(NAN, 1.0f) ); // NaN - X = NaN

	// Pipelining test:
	allTestsSuccessful &= pipelinedAddTest(1.0f, 1.0f, 0.0f, 2.0f, -1.75f, INFINITY, 2.75f, NAN);

	return allTestsSuccessful ? S_OK : 1;
}

static const int RunTestsFloatMUL(Xsi::Loader& loader, std_logic_port& clk, std_logic_vector_port<32>& IMUL_A, std_logic_vector_port<32>& IMUL_B,
	std_logic_port& IMUL_GO, std_logic_vector_port<32>& OMUL)
{
	const auto mulTestFunc = [&](const float a, const float b) -> float
	{
		IMUL_A = a;
		IMUL_B = b;
		IMUL_GO = true;
		for (unsigned steps = 0; steps < 5; ++steps) // Mul takes 5 cycles to run
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OMUL.GetFloat32Val();

		IMUL_A = b;
		IMUL_B = a;
		IMUL_GO = true;
		for (unsigned steps = 0; steps < 5; ++steps) // Mul takes 5 cycles to run
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ba = OMUL.GetFloat32Val();

		if (memcmp(&ab, &ba, sizeof(float) ) != 0) // If A*B != B*A then that's a problem!
		{
			__debugbreak();
		}
		return ab;
	};

	const auto pipelinedMulTest = [&](const float a, const float b, const float c, const float d, const float e, const float f, const float g, const float h) -> bool
	{
		IMUL_A = 0.0f;
		IMUL_B = 0.0f;
		IMUL_GO = false;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IMUL_A = a;
		IMUL_B = b;
		IMUL_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IMUL_A = a;
		IMUL_B = c;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IMUL_A = a;
		IMUL_B = d;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IMUL_A = a;
		IMUL_B = e;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IMUL_A = a;
		IMUL_B = f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OMUL.GetFloat32Val();
		IMUL_A = a;
		IMUL_B = g;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ac = OMUL.GetFloat32Val();
		IMUL_A = a;
		IMUL_B = h;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ad = OMUL.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ae = OMUL.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float af = OMUL.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ag = OMUL.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ah = OMUL.GetFloat32Val();

		const bool abCorrect = CompareFloatsCloseEnough(ab, a * b);
		const bool acCorrect = CompareFloatsCloseEnough(ac, a * c);
		const bool adCorrect = CompareFloatsCloseEnough(ad, a * d);
		const bool aeCorrect = CompareFloatsCloseEnough(ae, a * e);
		const bool afCorrect = CompareFloatsCloseEnough(af, a * f);
		const bool agCorrect = CompareFloatsCloseEnough(ag, a * g);
		const bool ahCorrect = CompareFloatsCloseEnough(ah, a * h);
		return abCorrect && acCorrect && adCorrect && aeCorrect && afCorrect && agCorrect && ahCorrect;
	};

	bool allTestsSuccessful = true;

	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(12.34f, 1.0f), 12.34f); // N * 1 = N
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(-12.34f, 1.0f), -12.34f); // -N * 1 = -N
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(12.34f, 0.0f), 0.0f); // N * 0 = 0
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(-12.34f, 0.0f), -0.0f); // -N * 0 = -0
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(1.0f, 1.0f), 1.0f); // Integer
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(2.0f, 2.0f), 4.0f); // Integer power of 2
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(2.0f, 4.0f), 8.0f); // Integer power of 2
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(3.0f, 7.0f), 21.0f); // Integer
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(4.0f, 0.25f), 1.0f); // Fractional, power of 2
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(0.5f, 0.125f), 0.0625f); // Fractional, power of 2
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(0.123f, 0.456f), 0.056088f); // Fractional
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(2.0000002384185791015625f, 2.0000002384185791015625f), 4.0000009536743732496688608080149f); // Fractional with no exponent overflow renormalization
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(3.9999997615814208984375f, 3.9999997615814208984375f), 15.999998092651424030918860808015f); // Fractional with maximum exponent overflow renormalization
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(1.4142135623730950488016887242097f, 1.4142135623730950488016887242097f), 2.0f); // Large fractional that results in an exact power of 2 after multiplication
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(123.456f, 234.567f), 28958.703552f); // Fractional
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(123.456f, -234.567f), -28958.703552f); // Fractional
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(-123.456f, 234.567f), -28958.703552f); // Fractional
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(-123.456f, -234.567f), 28958.703552f); // Fractional
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(1.70141183460469231732e38f, 4.0f), INFINITY); // Non-infinite overflow into infinite
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(-1.70141183460469231732e38f, 4.0f), -INFINITY); // Non-infinite overflow into infinite
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc(1.17549435082e-38f, 0.25f), 0.0f); // Normal underflow into denormals (should get flushed to zero)
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc( ( (float)INFINITY), 1.70141183460469231732e-38f), INFINITY); // INF * N = INF
	allTestsSuccessful &= isnan(mulTestFunc( ( (float)INFINITY), 0.0f) ); // INF * 0 = NaN
	allTestsSuccessful &= isnan(mulTestFunc( ( (float)INFINITY), NAN) ); // INF * NaN = NaN
	allTestsSuccessful &= CompareFloatsCloseEnough(mulTestFunc( ( (float)INFINITY), ( (float)INFINITY) ), ( (float)INFINITY) ); // INF * INF = INF
	allTestsSuccessful &= pipelinedMulTest(3.0f, 1.0f, 2.0f, 3.0f, 4.0f, 5.0f, 6.0f, 7.0f);

	return allTestsSuccessful ? S_OK : 1;
}

static const int RunTestsFloatALU(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

	std_logic_vector_port<32> IADD_A(PD_IN, loader, "IADD_A");
	std_logic_vector_port<32> IADD_B(PD_IN, loader, "IADD_B");
	std_logic_port IADD_GO(PD_IN, loader, "IADD_GO");
	std_logic_vector_port<32> OADD(PD_OUT, loader, "OADD");

	std_logic_vector_port<32> IMUL_A(PD_IN, loader, "IMUL_A");
	std_logic_vector_port<32> IMUL_B(PD_IN, loader, "IMUL_B");
	std_logic_port IMUL_GO(PD_IN, loader, "IMUL_GO");
	std_logic_vector_port<32> OMUL(PD_OUT, loader, "OMUL");

	std_logic_vector_port<32> ICMP_A(PD_IN, loader, "ICMP_A");
	std_logic_vector_port<32> ICMP_B(PD_IN, loader, "ICMP_B");
	std_logic_vector_port<32> ICMP_C(PD_IN, loader, "ICMP_C");
	std_logic_vector_port<3> ICMP_MODE(PD_IN, loader, "ICMP_MODE");
	std_logic_port ICMP_GO(PD_IN, loader, "ICMP_GO");
	std_logic_vector_port<32> OCMP(PD_OUT, loader, "OCMP");

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		IADD_A = 0.0f;
		IADD_B = 0.0f;
		IADD_GO = false;

		IMUL_A = 0.0f;
		IMUL_B = 0.0f;
		IMUL_GO = false;

		ICMP_A = 0.0f;
		ICMP_B = 0.0f;
		ICMP_C = 0.0f;
		ICMP_MODE = CmpMin;
		ICMP_GO = false;
	}

	const bool cmpTestsSuccessful = RunTestsFloatCMP(loader, clk, ICMP_A, ICMP_B, ICMP_C, ICMP_MODE, ICMP_GO, OCMP) == S_OK;
	const bool addTestsSuccessful = RunTestsFloatADD(loader, clk, IADD_A, IADD_B, IADD_GO, OADD) == S_OK;
	const bool mulTestsSuccessful = RunTestsFloatMUL(loader, clk, IMUL_A, IMUL_B, IMUL_GO, OMUL) == S_OK;

	if (cmpTestsSuccessful && addTestsSuccessful && mulTestsSuccessful)
		return S_OK;
	else
		return 1;
}

int main(const unsigned argc, const char* const argv[])
{
	const std::string design_libname = getcurrentdir() + "\\xsim.dir\\" + design_name + "\\xsimk.dll";

	printf("Design DLL: %s\n", design_libname.c_str() );
	printf("Sim Engine DLL: %s\n", simengine_libname);

	// Make sure that the design DLL that we built with our batch script can find the Vivado DLL's (they're not in the default PATH environment variable for some reason)
	AddDllDirectory(simengine_imageformats_libpath);
	AddDllDirectory(simengine_libpath);
	SetDefaultDllDirectories(LOAD_LIBRARY_SEARCH_APPLICATION_DIR | LOAD_LIBRARY_SEARCH_DEFAULT_DIRS | LOAD_LIBRARY_SEARCH_SYSTEM32 | LOAD_LIBRARY_SEARCH_USER_DIRS);

	int status = S_OK;

	renderWindow = new RenderWindow();

	try
	{
		Xsi::Loader loader(design_libname, std::string(simengine_libname) );
		s_xsi_setup_info info = {0};
		memset(&info, 0, sizeof(info) );
		info.logFileName = NULL;
		info.wdbFileName = NULL;
		loader.open(&info);

		status = RunTestsFloatALU(loader);
	}
	catch (std::exception& except)
	{
		printf("ERROR: A std::exception occurred: %s\n", except.what() );
		status = 2;
	}
	catch (...)
	{
		printf("ERROR: An unknown exception occurred\n");
		status = 3;
	}

	if (status == S_OK)
	{
		printf("PASSED test\n");
	}
	else
	{
		printf("FAILED test\n");
	}

	return status;
}
