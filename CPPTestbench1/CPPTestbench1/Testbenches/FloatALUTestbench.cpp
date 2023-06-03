#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "ShaderCoreALUCommon.h"
#include <intrin.h>

static const float negInf = -(INFINITY);
static const float posInf = -(INFINITY);
static const uint32_t denormalFloatBits = 0x003FFFFF;
static const float denormalFloat = *(reinterpret_cast<const float* const>(&denormalFloatBits) ); // Has a value of 5.87747035281e-39

float flushdenormstozero(const float a32)
{
	const unsigned ua = *(const unsigned* const)&a32;
	const unsigned rawexpa = (ua >> 23) & 0xFF;
	if (rawexpa == 0)
	{
		// HLSL rules require preserving the sign-bit when flushing denorms to zero! "Denorms are flushed to sign-preserved zero on input and output of any floating-point mathematical operation."
		const unsigned ures = 0x00000000 | (ua & 0x80000000);
		return *(const float* const)&ures;
	}
	else
		return a32;
}

// Note that this half to float conversion does not comply to the IEEE spec for Half's in that it doesn't properly handle denormal halfs.
// But that's okay, we don't really care too much about that, we just want to use a very Half-like format as smaller storage for our float data.
// It does properly handle NaN and INF cases though.
unsigned short SoftFloatToHalf(const float a)
{
	const unsigned uFa = *(const unsigned* const)&a;
	const unsigned short signBit = (const unsigned short)( (uFa >> 31) << 15);
	unsigned short exponent = 0x0000;
	unsigned short mantissa = 0x0000;
	if (isnan(a) )
	{
		exponent = 0x7C00;
		mantissa = 0x0001;
	}
	else if (isinf(a) )
	{
		exponent = 0x7C00;
		mantissa = 0x0000;
	}
	else if (a == 0.0f)
	{
		exponent = 0x0000;
		mantissa = 0x0000;
	}
	else
	{
		const unsigned floatMantissa = uFa & 0x7FFFFF;
		const unsigned biasedExponent = (uFa >> 23) & 0xFF;
		const int signedExponent = ( (const int)biasedExponent) - 127;
		if (fabs(a) > 65504.0f) // Saturate to infinity
		{
			exponent = 0x7C00;
			mantissa = 0x0000;
		}
		else if (fabs(a) < 5.9604644775390625e-8f) // Saturate to 0
		{
			exponent = 0x0000;
			mantissa = 0x0000;
		}
		else if (fabs(a) < 0.00006103515625f) // Handle denormals case
		{
			// TODO: Do we need to handle denormals as a special case here?
			exponent = 0x0000;
			mantissa = (const unsigned short)(floatMantissa >> 13); // Just treat it as a normal for now
		}
		else // Handle the normal case
		{
			const unsigned short biasedHalfExponent = signedExponent + 15;
			exponent = biasedHalfExponent << 10;

			mantissa = (const unsigned short)(floatMantissa >> 13);
		}
	}

	return signBit | exponent | mantissa;
}

// Note that this half to float conversion does not comply to the IEEE spec for Half's in that it doesn't properly handle denormal halfs.
// But that's okay, we don't really care too much about that, we just want to use a very Half-like format as smaller storage for our float data.
// It does properly handle NaN and INF cases though.
float SoftHalfToFloat(const unsigned short a)
{
	const unsigned short mantissa = a & 0x3FF;
	const unsigned short biasedExponent = (a >> 10) & 0x1F;
	const signed short signedExponent = ( (const signed short)biasedExponent) - 15;
	const unsigned signBit = ( (const unsigned)(a >> 15) ) << 31;

	unsigned retMantissa = 0x00000000;
	unsigned retExponent = 0x00000000;

	if (biasedExponent == 31)
	{
		if (mantissa != 0)
		{
			if (signBit)
				return -NAN;
			else
				return NAN;
		}
		else
		{
			if (signBit)
				return -INFINITY;
			else
				return INFINITY;
		}
	}
	else if (biasedExponent == 0)
	{
		if (mantissa == 0)
		{
			retMantissa = 0x0000;
			retExponent = 0x0000;
		}
		else // TODO: Handle special case of denormal numbers
		{
			// For now, just use the non-denormal code
			retMantissa = mantissa << 13;
			retExponent = (signedExponent + 127) << 23;
		}
	}
	else // Handle the normal case
	{
		retMantissa = mantissa << 13;
		retExponent = (signedExponent + 127) << 23;
	}

	const unsigned tempRet = signBit | retExponent | retMantissa;
	return *(const float* const)&tempRet;
}

// Checks for exact bitwise equality between two floats (will treat -0.0f and 0.0f differently, or different NaN representations differently).
// Returns true if the floats are exactly equal, or false otherwise.
static const bool CompareFloatBitwise(const float a, const float b)
{
	return *reinterpret_cast<const uint32_t* const>(&a) == *reinterpret_cast<const uint32_t* const>(&b);
}

static const int RunTestsFloatSHFT(Xsi::Loader& loader, std_logic_port& clk, std_logic_vector_port<32>& IN_A, 
	std_logic_port& ISHFT_GO, std_logic_vector_port<3>& IN_MODE, std_logic_vector_port<32>& OUT_RESULT)
{
	bool allTestsSuccessful = true;

	const auto shiftTestFunc = [&](const float a, const int shft) -> float
	{
		IN_A = a;
		switch (shft)
		{
		case 1:
			IN_MODE = ShftX2;
			break;
		case 2:
			IN_MODE = ShftX4;
			break;
		case 3:
			IN_MODE = ShftX8;
			break;
		case 4:
			IN_MODE = ShftX16;
			break;
		case -1:
			IN_MODE = ShftD2;
			break;
		case -2:
			IN_MODE = ShftD4;
			break;
		case -3:
			IN_MODE = ShftD8;
			break;
		case -4:
			IN_MODE = ShftD16;
			break;
		default:
			__debugbreak();
		}
		ISHFT_GO = true;
		{
			for (unsigned steps = 0; steps < SHFT_CYCLES; ++steps)
			{
				scoped_timestep time(loader, clk, 100);
			}
		}
		const float ret = OUT_RESULT.GetFloat32Val();
		return ret;
	};

	const float multipliers[] =
	{
		2.0f, 4.0f, 8.0f, 16.0f, 
		1.0f / 2.0f, 1.0f / 4.0f, 1.0f / 8.0f, 1.0f / 16.0f
	};

	const int shiftInts[] =
	{
		1, 2, 3, 4, 
		-1, -2, -3, -4
	};

	for (unsigned iter = 0; iter < ARRAYSIZE(multipliers); ++iter)
	{
		const float thisMultiplier = multipliers[iter];
		const int thisShiftInt = shiftInts[iter];

		// Standard tests:
		allTestsSuccessful &= (shiftTestFunc(1.0f, thisShiftInt) == (1.0f * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(2.0f, thisShiftInt) == (2.0f * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(3.0f, thisShiftInt) == (3.0f * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(4.0f / 3.0f, thisShiftInt) == ( (4.0f / 3.0f) * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(0.123456789f, thisShiftInt) == (0.123456789f * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(1000.0f, thisShiftInt) == (1000.0f * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(16777216.0f, thisShiftInt) == (16777216.0f * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(33554432.0f, thisShiftInt) == (33554432.0f * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(123.456f, thisShiftInt) == (123.456f * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(-123.456f, thisShiftInt) == (-123.456f * thisMultiplier) );

		// Zero tests:
		allTestsSuccessful &= (shiftTestFunc(0.0f, thisShiftInt) == (0.0f * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(-0.0f, thisShiftInt) == (-0.0f * thisMultiplier) );

		// Denormal tests:
		allTestsSuccessful &= (shiftTestFunc(7.86723990333560424043e-39f, thisShiftInt) == (flushdenormstozero(7.86723990333560424043e-39f) * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(-7.86723990333560424043e-39f, thisShiftInt) == (flushdenormstozero(-7.86723990333560424043e-39f) * thisMultiplier) );

		// INF and NaN tests:
		allTestsSuccessful &= (shiftTestFunc(INFINITY, thisShiftInt) == (INFINITY * thisMultiplier) );
		allTestsSuccessful &= (shiftTestFunc(-INFINITY, thisShiftInt) == (-INFINITY * thisMultiplier) );
		allTestsSuccessful &= (isnan(shiftTestFunc(NAN, thisShiftInt) ) == isnan(NAN * thisMultiplier) );
		allTestsSuccessful &= (isnan(shiftTestFunc(-NAN, thisShiftInt) ) == isnan(-NAN * thisMultiplier) );

		// Overflow into +/- INF tests:
		allTestsSuccessful &= (shiftTestFunc(3.40199290171201906221e+38f, thisShiftInt) == (3.40199290171201906221e+38f * thisMultiplier) ); // Should overflow into INF for x2 and higher
		allTestsSuccessful &= (shiftTestFunc(-3.40199290171201906221e+38f, thisShiftInt) == (-3.40199290171201906221e+38f * thisMultiplier) ); // Should overflow into -INF for x2 and higher
		allTestsSuccessful &= (shiftTestFunc(1.70099645085600953111e+38f, thisShiftInt) == (1.70099645085600953111e+38f * thisMultiplier) ); // Should overflow into INF for x4 and higher
		allTestsSuccessful &= (shiftTestFunc(-1.70099645085600953111e+38f, thisShiftInt) == (-1.70099645085600953111e+38f * thisMultiplier) ); // Should overflow into -INF for x4 and higher
		allTestsSuccessful &= (shiftTestFunc(8.50498225428004765553e+37f, thisShiftInt) == (8.50498225428004765553e+37f * thisMultiplier) ); // Should overflow into INF for x8 and higher
		allTestsSuccessful &= (shiftTestFunc(-8.50498225428004765553e+37f, thisShiftInt) == (-8.50498225428004765553e+37f * thisMultiplier) ); // Should overflow into -INF for x8 and higher
		allTestsSuccessful &= (shiftTestFunc(4.25249112714002382777e+37f, thisShiftInt) == (4.25249112714002382777e+37f * thisMultiplier) ); // Should overflow into INF for x16 and higher
		allTestsSuccessful &= (shiftTestFunc(-4.25249112714002382777e+37f, thisShiftInt) == (-4.25249112714002382777e+37f * thisMultiplier) ); // Should overflow into -INF for x16 and higher

		// Underflow into Denormal/Zero tests:
		allTestsSuccessful &= (shiftTestFunc(1.96221834115584793201e-38f, thisShiftInt) == flushdenormstozero(1.96221834115584793201e-38f * thisMultiplier) ); // Should underflow into 0 for d2 and higher
		allTestsSuccessful &= (shiftTestFunc(-1.96221834115584793201e-38f, thisShiftInt) == flushdenormstozero(-1.96221834115584793201e-38f * thisMultiplier) ); // Should underflow into -0 for d2 and higher
		allTestsSuccessful &= (shiftTestFunc(3.92443668231169586402e-38f, thisShiftInt) == flushdenormstozero(3.92443668231169586402e-38f * thisMultiplier) ); // Should underflow into 0 for d4 and higher
		allTestsSuccessful &= (shiftTestFunc(-3.92443668231169586402e-38f, thisShiftInt) == flushdenormstozero(-3.92443668231169586402e-38f * thisMultiplier) ); // Should underflow into -0 for d4 and higher
		allTestsSuccessful &= (shiftTestFunc(7.84887336462339172805e-38f, thisShiftInt) == flushdenormstozero(7.84887336462339172805e-38f * thisMultiplier) ); // Should underflow into 0 for d8 and higher
		allTestsSuccessful &= (shiftTestFunc(-7.84887336462339172805e-38f, thisShiftInt) == flushdenormstozero(-7.84887336462339172805e-38f * thisMultiplier) ); // Should underflow into -0 for d8 and higher
		allTestsSuccessful &= (shiftTestFunc(1.56977467292467834561e-37f, thisShiftInt) == flushdenormstozero(1.56977467292467834561e-37f * thisMultiplier) ); // Should underflow into 0 for d16 and higher
		allTestsSuccessful &= (shiftTestFunc(-1.56977467292467834561e-37f, thisShiftInt) == flushdenormstozero(-1.56977467292467834561e-37f * thisMultiplier) ); // Should underflow into -0 for d16 and higher
	}

	// Turn off the SHFT pipe when we're done using it
	ISHFT_GO = false;

	return allTestsSuccessful ? S_OK : 1;
}

static const int RunTestsFloatBIT(Xsi::Loader& loader, std_logic_port& clk, std_logic_vector_port<32>& IN_A, std_logic_vector_port<32>& IN_B, 
	std_logic_port& IBIT_GO, std_logic_vector_port<3>& IN_MODE, std_logic_vector_port<32>& OUT_RESULT)
{
	bool allTestsSuccessful = true;

	const auto bitShiftTestFunc = [&](const unsigned a, const int shft) -> unsigned
	{
		IN_A = a;
		switch (shft)
		{
		case 8:
			IN_MODE = BShftL8;
			break;
		case 16:
			IN_MODE = BShftL16;
			break;
		case 24:
			IN_MODE = BShftL24;
			break;
		case -8:
			IN_MODE = BShftR8;
			break;
		case -16:
			IN_MODE = BShftR16;
			break;
		case -24:
			IN_MODE = BShftR24;
			break;
		default:
			__debugbreak(); // Invalid/unknown shift amount!
		}
		IBIT_GO = true;
		{
			for (unsigned steps = 0; steps < BIT_CYCLES; ++steps)
			{
				scoped_timestep time(loader, clk, 100);
			}
		}
		const unsigned ret = OUT_RESULT.GetUint32Val();
		return ret;
	};

	const auto bitOrTestFunc = [&](const unsigned a, const unsigned b) -> unsigned
	{
		IN_A = a;
		IN_B = b;
		IN_MODE = BOr;
		IBIT_GO = true;
		{
			for (unsigned steps = 0; steps < BIT_CYCLES; ++steps)
			{
				scoped_timestep time(loader, clk, 100);
			}
		}
		const unsigned ret = OUT_RESULT.GetUint32Val();
		return ret;
	};

	const auto bitAndTestFunc = [&](const unsigned a, const unsigned b) -> unsigned
	{
		IN_A = a;
		IN_B = b;
		IN_MODE = BAnd;
		IBIT_GO = true;
		{
			for (unsigned steps = 0; steps < BIT_CYCLES; ++steps)
			{
				scoped_timestep time(loader, clk, 100);
			}
		}
		const unsigned ret = OUT_RESULT.GetUint32Val();
		return ret;
	};

	const int multipliers[] =
	{
		8, 16, 24,
		-8, -16, -24
	};

	const unsigned testShiftValues[] =
	{
		0x00000000,
		0x00000001,
		0x00000080,
		0x000000FF,
		0x00000100,
		0x00008000,
		0x0000FF00,
		0x00010000,
		0x00800000,
		0x00FF0000,
		0x01000000,
		0x80000000,
		0xFF000000,
		0x55555555,
		0x99999999,
		0x95959595,
		0xFFFFFFFE,
		0xFFFFFFFF,
	};

	// Bit-shifts test:
	for (unsigned iter = 0; iter < ARRAYSIZE(multipliers); ++iter)
	{
		const int thisMultiplier = multipliers[iter];

		for (unsigned iterTest = 0; iterTest < ARRAYSIZE(testShiftValues); ++iterTest)
		{
			const unsigned thisTestValue = testShiftValues[iterTest];
			if (thisMultiplier < 0)
			{
				const unsigned expectedCorrectResult = thisTestValue >> abs(thisMultiplier);
				const unsigned simTestResult = bitShiftTestFunc(thisTestValue, thisMultiplier);
				allTestsSuccessful &= (simTestResult == expectedCorrectResult);
			}
			else
			{
				const unsigned expectedCorrectResult = thisTestValue << thisMultiplier;
				const unsigned simTestResult = bitShiftTestFunc(thisTestValue, thisMultiplier);
				allTestsSuccessful &= (simTestResult == expectedCorrectResult);
			}
		}
	}

	// Bitwise or/and tests:
	for (unsigned iterA = 0; iterA < ARRAYSIZE(testShiftValues); ++iterA)
	{
		const unsigned thisTestValueA = testShiftValues[iterA];
		for (unsigned iterB = 0; iterB < ARRAYSIZE(testShiftValues); ++iterB)
		{
			const unsigned thisTestValueB = testShiftValues[iterB];

			const unsigned expectedCorrectResultOr = thisTestValueA | thisTestValueB;
			const unsigned simTestResultOr = bitOrTestFunc(thisTestValueA, thisTestValueB);
			allTestsSuccessful &= (simTestResultOr == expectedCorrectResultOr);

			const unsigned expectedCorrectResultAnd = thisTestValueA & thisTestValueB;
			const unsigned simTestResultAnd = bitAndTestFunc(thisTestValueA, thisTestValueB);
			allTestsSuccessful &= (simTestResultAnd == expectedCorrectResultAnd);
		}
	}

	// Turn off the BIT pipe when we're done using it
	IBIT_GO = false;

	return allTestsSuccessful ? S_OK : 1;
}

static const int RunTestsFloatRCP(Xsi::Loader& loader, std_logic_port& clk, std_logic_vector_port<32>& IN_A, 
	std_logic_port& ISPEC_GO, std_logic_vector_port<3>& IN_MODE, std_logic_vector_port<32>& OUT_RESULT)
{
	bool allTestsSuccessful = true;

	const auto rcpTestFunc = [&](const float a) -> float
	{
		IN_A = a;
		ISPEC_GO = true;
		for (unsigned steps = 0; steps < RCP_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float res = OUT_RESULT.GetFloat32Val();
		return res;
	};

	const auto rcpCloseEnoughTest = [](const float simulationResult, const float trueResult, const float epsilon) -> bool
	{
		return fabs(simulationResult - trueResult) < epsilon;
	};

	const auto pipelinedRcpTest = [&]() -> bool
	{
		static_assert(RCP_CYCLES == 14u, "Need to rewrite this function if the instruction latency of the RCP pipe changes!");
		IN_A = 0.0f;
		ISPEC_GO = false;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 0.0f;
		ISPEC_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 1.0f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 0.5f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 2.0f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 1.0f / 3.0f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 3.0f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 1.0f / 4.0f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 4.0f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 1.0f / 5.0f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 5.0f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 0.0f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = NAN;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = -1.0f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 3.1415926f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		ISPEC_GO = false;
		const float aResult = OUT_RESULT.GetFloat32Val();
		const bool aValid = CompareFloatBitwise(aResult, INFINITY); // rcp(0.0f) = INF
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float bResult = OUT_RESULT.GetFloat32Val();
		const bool bValid = CompareFloatBitwise(bResult, 1.0f); // rcp(1.0f) = 1.0f
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float cResult = OUT_RESULT.GetFloat32Val();
		const bool cValid = CompareFloatBitwise(cResult, 2.0f); // rcp(0.5f) = 2.0f
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float dResult = OUT_RESULT.GetFloat32Val();
		const bool dValid = CompareFloatBitwise(dResult, 0.5f); // rcp(2.0f) = 0.5f
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float eResult = OUT_RESULT.GetFloat32Val();
		const bool eValid = rcpCloseEnoughTest(eResult, 3.0f, 0.000001f); // rcp(1.0f / 3.0f) = 3.0f
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float fResult = OUT_RESULT.GetFloat32Val();
		const bool fValid = rcpCloseEnoughTest(fResult, 1.0f / 3.0f, 0.0000001f); // rcp(3.0f) = 1.0f / 3.0f
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float gResult = OUT_RESULT.GetFloat32Val();
		const bool gValid = CompareFloatBitwise(gResult, 4.0f); // rcp(0.25f) = 4.0f
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float hResult = OUT_RESULT.GetFloat32Val();
		const bool hValid = CompareFloatBitwise(hResult, 0.25f); // rcp(4.0f) = 0.25f
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float iResult = OUT_RESULT.GetFloat32Val();
		const bool iValid = rcpCloseEnoughTest(iResult, 5.0f, 0.00001f); // rcp(1.0f / 5.0f) = 5.0f
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float jResult = OUT_RESULT.GetFloat32Val();
		const bool jValid = rcpCloseEnoughTest(jResult, 1.0f / 5.0f, 0.0000001f); // rcp(5.0f) = 1.0f / 5.0f
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float kResult = OUT_RESULT.GetFloat32Val();
		const bool kValid = CompareFloatBitwise(kResult, INFINITY); // rcp(0.0f) = INFINITY
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float lResult = OUT_RESULT.GetFloat32Val();
		const bool lValid = isnan(lResult); // rcp(NAN) = NAN
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float mResult = OUT_RESULT.GetFloat32Val();
		const bool mValid = CompareFloatBitwise(mResult, -1.0f); // rcp(-1.0f) = -1.0f
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float nResult = OUT_RESULT.GetFloat32Val();
		const bool nValid = rcpCloseEnoughTest(nResult, 1.0f / 3.1415926f, 0.0000001f); // rcp(3.1415926f) = 1.0f / 3.1415926f
		{
			scoped_timestep time(loader, clk, 100);
		}

		return aValid && bValid && cValid && dValid && eValid && fValid && gValid && hValid && iValid && jValid && kValid && lValid && mValid && nValid;
	};

	for (unsigned x = 1; x <= 1024; ++x)
	{
		const float inputf = (const float)x;
		const float realRcp = 1.0f / inputf;
		const float simulatedRcp = rcpTestFunc(inputf);
		const bool isCloseEnough = rcpCloseEnoughTest(simulatedRcp, realRcp, 0.0000001f); // For positive integers our results should be very, very close to perfect!
		if (!isCloseEnough)
		{
			__debugbreak();
		}
		allTestsSuccessful &= isCloseEnough;
	}

	for (unsigned x = 1; x <= 1024; ++x)
	{
		const float inputf = 1.0f / (const float)x;
		const float realRcp = 1.0f / inputf;
		const float simulatedRcp = rcpTestFunc(inputf);
		const bool isCloseEnough = rcpCloseEnoughTest(simulatedRcp, realRcp, 0.01f); // For inverted values close to zero our results may diverge a bit
		if (!isCloseEnough)
		{
			__debugbreak();
		}
		allTestsSuccessful &= isCloseEnough;
	}

	allTestsSuccessful &= CompareFloatBitwise(rcpTestFunc(1.0f), 1.0f); // rcp(1.0f) = 1.0f
	allTestsSuccessful &= CompareFloatBitwise(rcpTestFunc(-1.0f), -1.0f); // rcp(-1.0f) = -1.0f
	allTestsSuccessful &= CompareFloatBitwise(rcpTestFunc(0.0f), INFINITY); // rcp(0.0f) = INF
	allTestsSuccessful &= CompareFloatBitwise(rcpTestFunc(-0.0f), -INFINITY); // rcp(-0.0f) = -INF
	allTestsSuccessful &= CompareFloatBitwise(rcpTestFunc(INFINITY), 0.0f); // rcp(INF) = 0.0f
	allTestsSuccessful &= CompareFloatBitwise(rcpTestFunc(-INFINITY), -0.0f); // rcp(-INF) = -0.0f
	allTestsSuccessful &= isnan(rcpTestFunc(NAN) ); // rcp(NAN) = NAN
	allTestsSuccessful &= isnan(rcpTestFunc(-NAN) ); // rcp(-NAN) = -NAN

	allTestsSuccessful &= pipelinedRcpTest();

	// Turn off the SPEC pipe when we're done using it
	ISPEC_GO = false;

	return allTestsSuccessful ? S_OK : 1;
}

static const int RunTestsFloatCMP(Xsi::Loader& loader, std_logic_port& clk, std_logic_vector_port<32>& IN_A, std_logic_vector_port<32>& IN_B,
	std_logic_vector_port<3>& IN_MODE, std_logic_port& ICMP_GO, std_logic_vector_port<32>& OUT_RESULT)
{
	const auto minTestFunc = [&](const float a, const float b) -> float
	{
		IN_A = a;
		IN_B = b;
		IN_MODE = CmpMin;
		ICMP_GO = true;
		for (unsigned steps = 0; steps < CMP_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OUT_RESULT.GetFloat32Val();

		// Now reverse a and b and make sure that we get the same result!
		IN_A = b;
		IN_B = a;
		for (unsigned steps = 0; steps < CMP_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ba = OUT_RESULT.GetFloat32Val();

		if (CompareFloatBitwise(ab, ba) == false)
		{
			__debugbreak();
		}

		return ab;
	};

	const auto maxTestFunc = [&](const float a, const float b) -> float
	{
		IN_A = a;
		IN_B = b;
		IN_MODE = CmpMax;
		ICMP_GO = true;
		for (unsigned steps = 0; steps < CMP_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OUT_RESULT.GetFloat32Val();

		// Now reverse a and b and make sure that we get the same result!
		IN_A = b;
		IN_B = a;
		for (unsigned steps = 0; steps < CMP_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ba = OUT_RESULT.GetFloat32Val();

		if (CompareFloatBitwise(ab, ba) == false)
		{
			__debugbreak();
		}

		return ab;
	};

	const auto sltTestFunc = [&](const float a, const float b) -> float
	{
		IN_A = a;
		IN_B = b;
		IN_MODE = CmpSlt;
		ICMP_GO = true;
		for (unsigned steps = 0; steps < CMP_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		return OUT_RESULT.GetFloat32Val();
	};

	const auto sgeTestFunc = [&](const float a, const float b) -> float
	{
		IN_A = a;
		IN_B = b;
		IN_MODE = CmpSge;
		ICMP_GO = true;
		for (unsigned steps = 0; steps < CMP_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		return OUT_RESULT.GetFloat32Val();
	};

	const auto sgnTestFunc = [&](const float a) -> float
	{
		IN_A = a;
		IN_MODE = CmpSgn;
		ICMP_GO = true;
		for (unsigned steps = 0; steps < CMP_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		return OUT_RESULT.GetFloat32Val();
	};

	const auto movTestFunc = [&](const float a) -> float
	{
		IN_A = a;
		IN_MODE = CmpMov;
		ICMP_GO = true;
		for (unsigned steps = 0; steps < CMP_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		return OUT_RESULT.GetFloat32Val();
	};

	/*const auto cmpTestFunc = [&](const float a, const float b, const float c) -> float
	{
		IN_A = a;
		IN_B = b;
		IN_C = c;
		IN_MODE = CmpCmp;
		ICMP_GO = true;
		for (unsigned steps = 0; steps < CMP_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		return OUT_RESULT.GetFloat32Val();
	};

	const auto cndTestFunc = [&](const float a, const float b, const float c) -> float
	{
		IN_A = a;
		IN_B = b;
		IN_C = c;
		IN_MODE = CmpCnd;
		ICMP_GO = true;
		for (unsigned steps = 0; steps < CMP_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		return OUT_RESULT.GetFloat32Val();
	};*/

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
	allTestsSuccessful &= (sltTestFunc(-12.34f, -56.78f) == 0.0f); // Negative/negative test (reversed order)
	allTestsSuccessful &= (sltTestFunc(-34.56f, -34.56f) == 0.0f); // Negative sameness test (should evaluate false since this is a LT and not a LE test)
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
	allTestsSuccessful &= (sltTestFunc(INFINITY, INFINITY) == 0.0f); // Infinity/infinity test	allTestsSuccessful &= (sltTestFunc(12.34f, NAN) == 0.0f); // Positive/NaN test
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
	allTestsSuccessful &= (sgeTestFunc(-12.34f, -56.78f) == 1.0f); // Negative/negative test (reversed order)
	allTestsSuccessful &= (sgeTestFunc(-34.56f, -34.56f) == 1.0f); // Negative sameness test (should evaluate true since this is a GE and not a GT test)
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

	// MOV tests:
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(12.34f), 12.34f);
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(-1.0f), -1.0f);
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(4.0f), 4.0f);
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(-3.0f), -3.0f);
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(0.0f), 0.0f);
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(-0.0f), -0.0f);
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(denormalFloat), denormalFloat);
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(-denormalFloat), -denormalFloat);
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(NAN), NAN);
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(-NAN), -NAN);
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(INFINITY), INFINITY);
	allTestsSuccessful &= CompareFloatBitwise(movTestFunc(-INFINITY), -INFINITY);

	// CMP tests:
	/*allTestsSuccessful &= (cmpTestFunc(-0.6f, 0.0f, 1.0f) == 1.0f); // Start with the four test cases from the MSDN page
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
	allTestsSuccessful &= (cndTestFunc(-NAN, 1.0f, 0.0f) == 0.0f);*/

	// Turn off the CMP pipe when we're done using it
	ICMP_GO = false;

	return allTestsSuccessful ? S_OK : 1;
}

// Returns true if the a and b floats are close enough to one another
static const bool CompareFloatsCloseEnough(const float a, const float b)
{
	const int32_t ua = *reinterpret_cast<const int32_t* const>(&a);
	const int32_t ub = *reinterpret_cast<const int32_t* const>(&b);
	return abs(ua - ub) < 3;
}

static const int RunTestsFloatADD(Xsi::Loader& loader, std_logic_port& clk, std_logic_vector_port<32>& IN_A, std_logic_vector_port<32>& IN_B,
	std_logic_port& IADD_GO, std_logic_vector_port<32>& OUT_RESULT)
{
	const auto addTestFunc = [&](const float a, const float b) -> float
	{
		IN_A = a;
		IN_B = b;
		IADD_GO = true;
		for (unsigned steps = 0; steps < ADD_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OUT_RESULT.GetFloat32Val();

		IN_A = b;
		IN_B = a;
		IADD_GO = true;
		for (unsigned steps = 0; steps < ADD_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ba = OUT_RESULT.GetFloat32Val();

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
		static_assert(ADD_CYCLES == 4u, "Need to rewrite this function if the instruction latency of the ADD pipe changes!");
		IN_A = 0.0f;
		IN_B = 0.0f;
		IADD_GO = false;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = a;
		IN_B = b;
		IADD_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = a;
		IN_B = c;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = a;
		IN_B = d;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = a;
		IN_B = e;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OUT_RESULT.GetFloat32Val();
		IN_A = a;
		IN_B = f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ac = OUT_RESULT.GetFloat32Val();
		IN_A = a;
		IN_B = g;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ad = OUT_RESULT.GetFloat32Val();
		IN_A = a;
		IN_B = h;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IADD_GO = false;
		const float ae = OUT_RESULT.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float af = OUT_RESULT.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ag = OUT_RESULT.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ah = OUT_RESULT.GetFloat32Val();

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
	allTestsSuccessful &= CompareFloatsCloseEnough(addTestFunc(123.45f, 567.89f), 691.34f); // Fractional -> Fractional
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

	// Turn off the ADD pipe when we're done using it
	IADD_GO = false;

	return allTestsSuccessful ? S_OK : 1;
}

static const int RunTestsFloatMUL(Xsi::Loader& loader, std_logic_port& clk, std_logic_vector_port<32>& IN_A, std_logic_vector_port<32>& IN_B,
	std_logic_port& IMUL_GO, std_logic_vector_port<32>& OUT_RESULT)
{
	const auto mulTestFunc = [&](const float a, const float b) -> float
	{
		IN_A = a;
		IN_B = b;
		IMUL_GO = true;
		for (unsigned steps = 0; steps < MUL_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OUT_RESULT.GetFloat32Val();

		IN_A = b;
		IN_B = a;
		IMUL_GO = true;
		for (unsigned steps = 0; steps < MUL_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ba = OUT_RESULT.GetFloat32Val();

		if (memcmp(&ab, &ba, sizeof(float) ) != 0) // If A*B != B*A then that's a problem!
		{
			__debugbreak();
		}
		return ab;
	};

	const auto pipelinedMulTest = [&](const float a, const float b, const float c, const float d, const float e, const float f, const float g, const float h) -> bool
	{
		static_assert(MUL_CYCLES == 5u, "Need to rewrite this function if the instruction latency of the MUL pipe changes!");
		IN_A = 0.0f;
		IN_B = 0.0f;
		IMUL_GO = false;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = a;
		IN_B = b;
		IMUL_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = a;
		IN_B = c;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = a;
		IN_B = d;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = a;
		IN_B = e;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = a;
		IN_B = f;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ab = OUT_RESULT.GetFloat32Val();
		IN_A = a;
		IN_B = g;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ac = OUT_RESULT.GetFloat32Val();
		IN_A = a;
		IN_B = h;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IMUL_GO = false;
		const float ad = OUT_RESULT.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ae = OUT_RESULT.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float af = OUT_RESULT.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ag = OUT_RESULT.GetFloat32Val();
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float ah = OUT_RESULT.GetFloat32Val();

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

	// Turn off the MUL pipe when we're done using it
	IMUL_GO = false;

	return allTestsSuccessful ? S_OK : 1;
}

static const float ReferenceFrac(const float f)
{
	return f - floor(f);
}

// These are only necessary on x86/x64 CPU's that only look at the bottom 6 bits of the shift amount
const unsigned SaturateShiftLeftX86(const unsigned value, const unsigned shiftLeftAmount)
{
	if (shiftLeftAmount < 32)
		return value << shiftLeftAmount;
	else
		return 0;
}

// These are only necessary on x86/x64 CPU's that only look at the bottom 6 bits of the shift amount
const unsigned SaturateShiftRightX86(const unsigned value, const unsigned shiftRightAmount)
{
	if (shiftRightAmount < 32)
		return value >> shiftRightAmount;
	else
		return 0;
}

static const float SoftFrac(float f)
{
	if (isnan(f) ) // NaN results in NaN
		return f;

	if (isinf(f) ) // +/- INF results in NaN
		return NAN;

	const bool isNegative = ( (*(const unsigned* const)&f) >> 31) != 0;
	f = fabs(f); // Strip off the sign bit for now

	// Optional early-out:
	//if (!isNegative && f < 1.0f)
		//return f;

	unsigned biasedExponent = ( (*(const unsigned* const)&f) & 0x7f800000) >> 23;
	int exponent = (const int)biasedExponent - (const int)127;

	unsigned mantissa = (*(const unsigned* const)&f) & 0x007fffff;

	// Optional early-out:
	//if (exponent >= 23)
		//return 0.0f;

	// After this, the mantissa is now a fixed-point 0.23 value:
	if (exponent >= 0)
	{
		// Don't worry about our implicit one bit, we're overwriting it with our mantissa bits
		mantissa = SaturateShiftLeftX86(mantissa, exponent) & 0x007fffff;
	}
	else
	{
		mantissa |= (1 << 23); // Add in our implicit one bit since we're shifting to the right so it'll show up
		mantissa = SaturateShiftRightX86(mantissa, -exponent) & 0x007fffff;
	}

	// This early-out is non-optional. We'll get the wrong answer if we try to
	// compute the rest of this algorithm using a zero mantissa.
	if (mantissa == 0x00000000)
		return 0.0f;

	// Invert our mantissa if negative
	if (isNegative)
		mantissa = 0x00800000 - mantissa;

	DWORD foundHighBitIndex = 0;

	// Find the highest set bit in the mantissa. We're going to shift that into our implicit 1 bit.
	// Since we know that our mantissa is non-zero, we know that there must always be at least one set bit to find.
	_BitScanReverse(&foundHighBitIndex, mantissa);
	mantissa = (mantissa << (23 - foundHighBitIndex) ) & 0x007fffff; // Make sure to clear the implicit one bit after shifting to it. It should be implicit and not actually present, after all.
	biasedExponent = foundHighBitIndex + (127 - 23); // This is the same as: (foundHighBitIndex - 23) + 127

	const unsigned retVal = (biasedExponent << 23) | mantissa;
	return *(const float* const)&retVal;
}

static void ValidateSoftFracFunc()
{
	for (float x = -1025.0f; x <= 1025.0f; x += 0.001f)
	{
		const float sfa = SoftFrac(x);
		const float rfa = ReferenceFrac(x);
		const int sfi = *(const int* const)&sfa;
		const int rfi = *(const int* const)&rfa;
		if (fabs(sfa - rfa) > 0.00005f)
		{
			__debugbreak();
		}
	}

	for (int x = -1025; x <= 1025; ++x)
	{
		const float sfa = SoftFrac( (const float)x);
		const float rfa = ReferenceFrac( (const float)x);
		const int sfi = *(const int* const)&sfa;
		const int rfi = *(const int* const)&rfa;
		if (sfi != rfi)
		{
			__debugbreak();
		}
	}
}

static const bool IsNanBitPattern(const unsigned floatBits)
{
	return ( (floatBits & 0x7F800000) == 0x7F800000) && // Exponent part for NaN
		( (floatBits & 0x007FFFFF) != 0); // Mantissa part for NaN must be nonzero (if it's zero, then that's INF instead of NaN)
}

static const int RunTestsFloatCNV(Xsi::Loader& loader, std_logic_port& clk, std_logic_vector_port<32>& IN_A, std_logic_vector_port<3>& IN_MODE, std_logic_port& ICNV_GO, std_logic_vector_port<32>& OUT_RESULT)
{
	// Make sure that our soft frac() algorithm works correctly since we'll be basing the hardware implementation on that!
	ValidateSoftFracFunc();

	const auto cnvTestFunc = [&](const float a, const eConvertMode mode) -> int
	{
		IN_A = a;
		IN_MODE = mode;
		ICNV_GO = true;
		for (unsigned steps = 0; steps < CNV_CYCLES; ++steps)
		{
			scoped_timestep time(loader, clk, 100);
		}
		const int res = OUT_RESULT.GetUint32Val();
		return res;
	};

	const auto softRoundToNE = [](const float a) -> int
	{
		if (a >= 0.0f)
			return (const int)(a + 0.5f);
		else
			return (const int)(a - 0.5f);
	};

	const auto softFloatToUNorm8 = [](float a) -> unsigned char
	{
		if (a <= 0.0f)
			return 0;
		else if (a >= 1.0f)
			return 255;
		else
			return (const unsigned char)(a * 255.0f);
	};

	const auto softFloatToUNorm16 = [](float a) -> unsigned short
	{
		if (a <= 0.0f)
			return 0x0000;
		else if (a >= 1.0f)
			return 0xFFFF;
		else
			return (const unsigned short)(a * 65535.0f);
	};

	// Note that this uint32 to float conversion may be off from the correct value by +/- 1 because we don't
	// perform any rounding for simplicity's sake.
	const auto softUInt32ToFloat = [](unsigned a) -> float
	{
		if (a == 0)
			return 0.0f;

		unsigned bitIndex = 31;
		for (; bitIndex >= 0; --bitIndex)
		{
			if ( (1 << bitIndex) & a)
			{
				if (bitIndex >= 23)
				{
					a >>= (bitIndex - 23);
				}
				else
				{
					a <<= (23 - bitIndex);
				}
				break;
			}
		}

		unsigned char biasedExp = 127 + bitIndex;

		// Clear the implicit 1 bit:
		a &= (~(1 << 23) );

		const unsigned uResult = (biasedExp << 23) | a;
		return *(const float* const)&uResult;
	};

	// Verify that our soft conversion routine is accurate:
	for (unsigned __int64 x = 0; x < 
#ifdef _DEBUG
		(1ull << 25ull);
#else
		(1ull << 32ull);
#endif
		++x)
	{
		const float fx = softUInt32ToFloat( (const unsigned)x);
		const float referenceFloat = (const float)(const unsigned)x;
		if (fx != referenceFloat)
		{
			const int diffBits = *(const int* const)&fx - *(const int* const)&referenceFloat;
			if (abs(diffBits) > 1) // We don't do any rounding, so it's okay for us to be off by +/- 1 in either direction
			{
				__debugbreak();
			}
		}
	}

	unsigned mismatchCount = 0;
	for (unsigned x = 0; x < 65536; ++x)
	{
		const unsigned short inputHalf = (const unsigned short)x;
		const float fVal = SoftHalfToFloat(inputHalf);
		const unsigned short roundTrippedHalf = SoftFloatToHalf(fVal);
		if (inputHalf != roundTrippedHalf && !isnan(fVal) )
		{
			++mismatchCount;
		}
	}
	printf("%u mismatches\n", mismatchCount);

	const auto pipelinedCnvTestFunc = [&]() -> bool
	{
		static_assert(CNV_CYCLES == 3u, "Need to rewrite this function if the instruction latency of the CNV pipe changes!");
		IN_A = -9.123f;
		IN_MODE = F_Frc;
		ICNV_GO = false;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 101.5f;
		IN_MODE = F_to_I16_RoundNearestEven;
		ICNV_GO = true;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = 101.5f;
		IN_MODE = F_to_U24_RoundNearestEven;
		{
			scoped_timestep time(loader, clk, 100);
		}
		IN_A = -NAN;
		IN_MODE = F_to_UNORM16;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const signed short a = OUT_RESULT.GetInt16Val();
		const bool aValid = (a == 102);
		IN_A = 0.354248046875f;
		IN_MODE = F_to_Half;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const int b = OUT_RESULT.GetInt32Val();
		const bool bValid = (b == 102);
		IN_A = INFINITY;
		IN_MODE = F_to_UNORM8;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const signed short c = OUT_RESULT.GetInt16Val();
		const bool cValid = (c == 0);
		IN_A = 0x35AB;
		IN_MODE = Half_to_F;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const unsigned short d = OUT_RESULT.GetUint16Val();
		const bool dValid = (d == 0x35AB);
		IN_A = 0.0f;
		IN_MODE = F_to_U24_RoundNearestEven;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const unsigned char e = OUT_RESULT.GetUint8Val();
		const bool eValid = (e == 0xFF);
		ICNV_GO = false;
		{
			scoped_timestep time(loader, clk, 100);
		}
		const float f = OUT_RESULT.GetFloat32Val();
		const bool fValid = CompareFloatBitwise(f, 0.354248046875f);
		{
			scoped_timestep time(loader, clk, 100);
		}
		const int g = OUT_RESULT.GetInt32Val();
		const bool gValid = (g == 0);

		return aValid && bValid && cValid && dValid && eValid && fValid && gValid;
	};

	bool allTestsSuccessful = true;

	// Test frc/frac operation on a wide range of values:
	for (float x = -1025.0f; x <= 1025.0f; x += 0.007f)
	{
		const float sfa = SoftFrac(x);
		const int simResultInt = cnvTestFunc(x, F_Frc);
		const float simResultFloat = *(const float* const)&simResultInt;
		const int sfi = *(const int* const)&sfa;
		if (fabs(sfa - simResultFloat) > 0.00005f)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			allTestsSuccessful = false;
		}
	}

	// Test that frc works correctly for all integers between -129 and +129 inclusive:
	for (int x = -129; x <= 129; ++x)
	{
		const float sfa = SoftFrac( (const float)x);
		const int simResultInt = cnvTestFunc( (const float)x, F_Frc);
		const float simResultFloat = *(const float* const)&simResultInt;
		const int sfi = *(const int* const)&sfa;
		if (sfi != simResultInt)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			allTestsSuccessful = false;
		}
	}

	// Test a bunch of edge cases for frc:
	allTestsSuccessful &= (cnvTestFunc(0.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(-0.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(1.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(-1.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(2.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(-2.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(3.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(-3.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(8388607.5f, F_Frc) == 0x3F000000); // 8388607.5f is the largest float value that can still represent values smaller than 1.0f. 0x3F000000 is +0.5f.
	allTestsSuccessful &= (cnvTestFunc(-8388607.5f, F_Frc) == 0x3F000000);
	allTestsSuccessful &= (cnvTestFunc(8388607.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(-8388607.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(8388608.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(-8388608.0f, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(denormalFloat, F_Frc) == 0x00000000);
	allTestsSuccessful &= (cnvTestFunc(-denormalFloat, F_Frc) == 0x00000000);
	allTestsSuccessful &= IsNanBitPattern(cnvTestFunc(INFINITY, F_Frc) );
	allTestsSuccessful &= IsNanBitPattern(cnvTestFunc(-INFINITY, F_Frc) );
	allTestsSuccessful &= IsNanBitPattern(cnvTestFunc(NAN, F_Frc) );
	allTestsSuccessful &= IsNanBitPattern(cnvTestFunc(-NAN, F_Frc) );

	// Convert float to unsigned 23-bit integer with round to nearest even mode:
	for (int x = 0; x <= 1024; ++x)
	{
		const float fx = (const float)x;
		allTestsSuccessful &= (cnvTestFunc(fx, F_to_U24_RoundNearestEven) == softRoundToNE(fx) );
	}

	// Convert float to unsigned 24-bit integer with round to nearest even mode:
	for (float fx = 0.0f; fx <= 32.0f; fx += 0.1f)
	{
		allTestsSuccessful &= (cnvTestFunc(fx, F_to_U24_RoundNearestEven) == softRoundToNE(fx) );
	}

#ifdef _DEBUG
	for (unsigned x = 0; x < 16777216; x += 11)
#else
	for (unsigned x = 0; x < 16777216; ++x)
#endif
	{
		const float fx = (const float)x;
		if (cnvTestFunc(fx, F_to_U24_RoundNearestEven) != x)
		{
			__debugbreak();
		}
	}

	// Test a bunch of edge cases:
	allTestsSuccessful &= (cnvTestFunc(0.0f, F_to_U24_RoundNearestEven) == 0);
	allTestsSuccessful &= (cnvTestFunc(-0.0f, F_to_U24_RoundNearestEven) == 0);
	allTestsSuccessful &= (cnvTestFunc(4194304.0f, F_to_U24_RoundNearestEven) == 4194304);
	allTestsSuccessful &= (cnvTestFunc(-4194304.0f, F_to_U24_RoundNearestEven) == 0);
	allTestsSuccessful &= (cnvTestFunc(4194303.0f, F_to_U24_RoundNearestEven) == 4194303);
	allTestsSuccessful &= (cnvTestFunc(-4194303.0f, F_to_U24_RoundNearestEven) == 0);
	allTestsSuccessful &= (cnvTestFunc(8388607.0f, F_to_U24_RoundNearestEven) == 8388607);
	allTestsSuccessful &= (cnvTestFunc(-8388608.0f, F_to_U24_RoundNearestEven) == 0);
	allTestsSuccessful &= (cnvTestFunc(16777215.0f, F_to_U24_RoundNearestEven) == 16777215);
	allTestsSuccessful &= (cnvTestFunc(16777214.0f, F_to_U24_RoundNearestEven) == 16777214);
	allTestsSuccessful &= (cnvTestFunc(16777216.0f, F_to_U24_RoundNearestEven) == 16777215);
	allTestsSuccessful &= (cnvTestFunc(-16777215.0f, F_to_U24_RoundNearestEven) == 0);
	allTestsSuccessful &= (cnvTestFunc(16777215.0f * 2.0f, F_to_U24_RoundNearestEven) == 16777215);
	allTestsSuccessful &= (cnvTestFunc(-16777215.0f * 2.0f, F_to_U24_RoundNearestEven) == 0);
	allTestsSuccessful &= (cnvTestFunc(denormalFloat, F_to_U24_RoundNearestEven) == 0);
	allTestsSuccessful &= (cnvTestFunc(-denormalFloat, F_to_U24_RoundNearestEven) == 0);
	allTestsSuccessful &= (cnvTestFunc(INFINITY, F_to_U24_RoundNearestEven) == 16777215);
	allTestsSuccessful &= (cnvTestFunc(-INFINITY, F_to_U24_RoundNearestEven) == 0);
	allTestsSuccessful &= (cnvTestFunc(NAN, F_to_U24_RoundNearestEven) == 0);
	allTestsSuccessful &= (cnvTestFunc(-NAN, F_to_U24_RoundNearestEven) == 0);

	// Convert float to signed 16-bit integer with round to nearest even mode:
	for (int x = -1024; x <= 1024; ++x)
	{
		const float fx = (const float)x;
		const int cnvResult = (const short)cnvTestFunc(fx, F_to_I16_RoundNearestEven);
		const int softResult = (const short)softRoundToNE(fx);
		allTestsSuccessful &= (cnvResult == softResult);
	}

	// Convert float to signed 16-bit integer with round to nearest even mode:
	for (float fx = -16.0f; fx <= 16.0f; fx += 0.1f)
	{
		allTestsSuccessful &= ( (const short)cnvTestFunc(fx, F_to_I16_RoundNearestEven) == (const short)softRoundToNE(fx) );
	}

	// Test a bunch of edge cases:
	allTestsSuccessful &= ( (const short)cnvTestFunc(0.0f, F_to_I16_RoundNearestEven) == 0);
	allTestsSuccessful &= ( (const short)cnvTestFunc(-0.0f, F_to_I16_RoundNearestEven) == 0);
	allTestsSuccessful &= ( (const short)cnvTestFunc(32767.0f, F_to_I16_RoundNearestEven) == 32767);
	allTestsSuccessful &= ( (const short)cnvTestFunc(-32768.0f, F_to_I16_RoundNearestEven) == -32768);
	allTestsSuccessful &= ( (const short)cnvTestFunc(32767.0f * 2.0f, F_to_I16_RoundNearestEven) == 32767);
	allTestsSuccessful &= ( (const short)cnvTestFunc(-32768.0f * 2.0f, F_to_I16_RoundNearestEven) == -32768);
	allTestsSuccessful &= ( (const short)cnvTestFunc(denormalFloat, F_to_I16_RoundNearestEven) == 0);
	allTestsSuccessful &= ( (const short)cnvTestFunc(-denormalFloat, F_to_I16_RoundNearestEven) == 0);
	allTestsSuccessful &= ( (const short)cnvTestFunc(INFINITY, F_to_I16_RoundNearestEven) == 32767);
	allTestsSuccessful &= ( (const short)cnvTestFunc(-INFINITY, F_to_I16_RoundNearestEven) == -32768);
	allTestsSuccessful &= ( (const short)cnvTestFunc(NAN, F_to_I16_RoundNearestEven) == 0);
	allTestsSuccessful &= ( (const short)cnvTestFunc(-NAN, F_to_I16_RoundNearestEven) == 0);

	// Convert float to UNORM16:
	for (float fx = 0.0f; fx <= 1.0f; fx += 1.0f / 257.0f)
	{
		allTestsSuccessful &= (cnvTestFunc(fx, F_to_UNORM16) == softFloatToUNorm16(fx) );
	}

	// Test a bunch of edge cases:
	allTestsSuccessful &= (cnvTestFunc(0.0f, F_to_UNORM16) == 0);
	allTestsSuccessful &= (cnvTestFunc(-0.0f, F_to_UNORM16) == 0);
	allTestsSuccessful &= (cnvTestFunc(1.0f, F_to_UNORM16) == 0xFFFF);
	allTestsSuccessful &= (cnvTestFunc(-1.0f, F_to_UNORM16) == 0);
	allTestsSuccessful &= (cnvTestFunc(1.0f * 2.0f, F_to_UNORM16) == 0xFFFF);
	allTestsSuccessful &= (cnvTestFunc(-1.0f * 2.0f, F_to_UNORM16) == 0);
	allTestsSuccessful &= (cnvTestFunc(denormalFloat, F_to_UNORM16) == 0);
	allTestsSuccessful &= (cnvTestFunc(-denormalFloat, F_to_UNORM16) == 0);
	allTestsSuccessful &= (cnvTestFunc(INFINITY, F_to_UNORM16) == 0xFFFF);
	allTestsSuccessful &= (cnvTestFunc(-INFINITY, F_to_UNORM16) == 0);
	allTestsSuccessful &= (cnvTestFunc(NAN, F_to_UNORM16) == 0);
	allTestsSuccessful &= (cnvTestFunc(-NAN, F_to_UNORM16) == 0);

	// Convert float to UNORM8:
	for (float fx = 0.0f; fx <= 1.0f; fx += 1.0f / 257.0f)
	{
		const int cnvResult = cnvTestFunc(fx, F_to_UNORM8);
		const int softResult = softFloatToUNorm8(fx);
		const bool result = (abs(cnvResult - softResult) < 2);
		allTestsSuccessful &= result;
	}

	// Test a bunch of edge cases:
	allTestsSuccessful &= (cnvTestFunc(0.0f, F_to_UNORM8) == 0);
	allTestsSuccessful &= (cnvTestFunc(-0.0f, F_to_UNORM8) == 0);
	allTestsSuccessful &= (cnvTestFunc(1.0f, F_to_UNORM8) == 0xFF);
	allTestsSuccessful &= (cnvTestFunc(-1.0f, F_to_UNORM8) == 0);
	allTestsSuccessful &= (cnvTestFunc(1.0f * 2.0f, F_to_UNORM8) == 0xFF);
	allTestsSuccessful &= (cnvTestFunc(-1.0f * 2.0f, F_to_UNORM8) == 0);
	allTestsSuccessful &= (cnvTestFunc(denormalFloat, F_to_UNORM8) == 0);
	allTestsSuccessful &= (cnvTestFunc(-denormalFloat, F_to_UNORM8) == 0);
	allTestsSuccessful &= (cnvTestFunc(INFINITY, F_to_UNORM8) == 0xFF);
	allTestsSuccessful &= (cnvTestFunc(-INFINITY, F_to_UNORM8) == 0);
	allTestsSuccessful &= (cnvTestFunc(NAN, F_to_UNORM8) == 0);
	allTestsSuccessful &= (cnvTestFunc(-NAN, F_to_UNORM8) == 0);

	// Convert float to half:
	for (float fx = -16.0f; fx <= 16.0f; fx += 0.07f)
	{
		const unsigned short cnvResult = (const unsigned short)cnvTestFunc(fx, F_to_Half);
		const unsigned short softResult = SoftFloatToHalf(fx);
		const bool result = (cnvResult == softResult);
		allTestsSuccessful &= result;
	}

	// Test a bunch of edge cases:
	allTestsSuccessful &= (cnvTestFunc(0.0f, F_to_Half) == 0x0000);
	allTestsSuccessful &= (cnvTestFunc(-0.0f, F_to_Half) == 0x8000);
	allTestsSuccessful &= (cnvTestFunc(1.0f, F_to_Half) == 0x3C00);
	allTestsSuccessful &= (cnvTestFunc(-1.0f, F_to_Half) == 0xBC00);
	allTestsSuccessful &= (cnvTestFunc(65505.0f, F_to_Half) == 0x7C00);
	allTestsSuccessful &= (cnvTestFunc(-65505.0f, F_to_Half) == 0xFC00);
	allTestsSuccessful &= (cnvTestFunc(denormalFloat, F_to_Half) == 0x0000);
	allTestsSuccessful &= (cnvTestFunc(-denormalFloat, F_to_Half) == 0x8000);
	allTestsSuccessful &= (cnvTestFunc(INFINITY, F_to_Half) == 0x7C00);
	allTestsSuccessful &= (cnvTestFunc(-INFINITY, F_to_Half) == 0xFC00);
	allTestsSuccessful &= ( (cnvTestFunc(NAN, F_to_Half) & 0x7FFF) == 0x7FFF);
	allTestsSuccessful &= ( (cnvTestFunc(-NAN, F_to_Half) & 0x7FFF) == 0x7FFF);

	// Convert half to float:
	for (float fx = -32.0f; fx <= 32.0f; fx += 0.07f)
	{
		const unsigned halfInput = SoftFloatToHalf(fx);
		const int cnvIntResult = cnvTestFunc(*(const float* const)&halfInput, Half_to_F);
		const float cnvResult = *(const float* const)&cnvIntResult;
		const float softResult = SoftHalfToFloat(halfInput);
		const bool result = (cnvResult == softResult);
		allTestsSuccessful &= result;
	}

	// Make sure that half -> float -> half will round-trip to exactly the same number!
	for (unsigned short fx = 0x0400; fx <= 0x7BFF; ++fx) // Test values in the range between 0.00006103515625f (minimum non-denormal half) and 65504.0f (maximum non-infinite half)
	{
		const unsigned halfValExtended = fx;
		const int cnvIntResult = cnvTestFunc(*(const float* const)&halfValExtended, Half_to_F);
		const float floatResult = *(const float* const)&cnvIntResult;
		const unsigned short cnvHalf = (const unsigned short)cnvTestFunc(floatResult, F_to_Half);
		const bool result = (cnvHalf == fx);
		allTestsSuccessful &= result;
	}

	// Make sure that float -> half -> float will round-trip to nearly the same number (with rounding error)!
	for (float fx = -32.0f; fx <= 32.0f; fx += 0.07f)
	{
		const int inputIntVal = *(const int* const)&fx;
		const unsigned cnvHalf = (const unsigned short)cnvTestFunc(fx, F_to_Half);
		const int cnvIntResult = cnvTestFunc(*(const float* const)&cnvHalf, Half_to_F);
		const float cnvResult = *(const float* const)&cnvIntResult;
		const int delta = cnvIntResult - inputIntVal;
		const bool result = (abs(delta) < (1 << 13) ); // Compare using an epsilon of 2^13 which is 1<<13 because float32 has a 23 bit mantissa and float16 only has a 10 bit mantissa (13 bit difference)
		allTestsSuccessful &= result;
	}

	// Test a bunch of edge cases:
	{ const unsigned halfTestVal = 0x0000; const int cnvIntResult = cnvTestFunc(*(const float* const)&halfTestVal, Half_to_F); allTestsSuccessful &= CompareFloatBitwise(*(const float* const)&cnvIntResult, 0.0f); }
	{ const unsigned halfTestVal = 0x8000; const int cnvIntResult = cnvTestFunc(*(const float* const)&halfTestVal, Half_to_F); allTestsSuccessful &= CompareFloatBitwise(*(const float* const)&cnvIntResult, -0.0f); }
	{ const unsigned halfTestVal = 0x3C00; const int cnvIntResult = cnvTestFunc(*(const float* const)&halfTestVal, Half_to_F); allTestsSuccessful &= CompareFloatBitwise(*(const float* const)&cnvIntResult, 1.0f); }
	{ const unsigned halfTestVal = 0xBC00; const int cnvIntResult = cnvTestFunc(*(const float* const)&halfTestVal, Half_to_F); allTestsSuccessful &= CompareFloatBitwise(*(const float* const)&cnvIntResult, -1.0f); }
	{ const unsigned halfTestVal = 0x7BFF; const int cnvIntResult = cnvTestFunc(*(const float* const)&halfTestVal, Half_to_F); allTestsSuccessful &= CompareFloatBitwise(*(const float* const)&cnvIntResult, 65504.0f); }
	{ const unsigned halfTestVal = 0xFBFF; const int cnvIntResult = cnvTestFunc(*(const float* const)&halfTestVal, Half_to_F); allTestsSuccessful &= CompareFloatBitwise(*(const float* const)&cnvIntResult, -65504.0f); }
	{ const unsigned halfTestVal = 0x7C00; const int cnvIntResult = cnvTestFunc(*(const float* const)&halfTestVal, Half_to_F); allTestsSuccessful &= CompareFloatBitwise(*(const float* const)&cnvIntResult, INFINITY); }
	{ const unsigned halfTestVal = 0xFC00; const int cnvIntResult = cnvTestFunc(*(const float* const)&halfTestVal, Half_to_F); allTestsSuccessful &= CompareFloatBitwise(*(const float* const)&cnvIntResult, -INFINITY); }
	{ const unsigned halfTestVal = 0x7FFF; const int cnvIntResult = cnvTestFunc(*(const float* const)&halfTestVal, Half_to_F); allTestsSuccessful &= isnan(*(const float* const)&cnvIntResult); }
	{ const unsigned halfTestVal = 0xFFFF; const int cnvIntResult = cnvTestFunc(*(const float* const)&halfTestVal, Half_to_F); allTestsSuccessful &= isnan(*(const float* const)&cnvIntResult); }

	for (unsigned x = 0; x < 1026; ++x)
	{
		const int iCnvResult = cnvTestFunc(*(const float* const)&x, U32_to_F);
		const float fResult = *(const float* const)&iCnvResult;
		const float fSoftResult = softUInt32ToFloat(x);
		allTestsSuccessful &= CompareFloatBitwise(fSoftResult, fResult);
	}

	for (unsigned x = 0; x < 31; ++x)
	{
		const unsigned baseNum = 1 << x;
		for (int y = -1; y <= 1; ++y)
		{
			const unsigned modifiedNum = (const unsigned)(baseNum + y);
			const int iCnvResult = cnvTestFunc(*(const float* const)&modifiedNum, U32_to_F);
			const float fResult = *(const float* const)&iCnvResult;
			const float fSoftResult = softUInt32ToFloat(modifiedNum);
			allTestsSuccessful &= CompareFloatBitwise(fSoftResult, fResult);
		}
	}

	// Run the pipelining test:
	allTestsSuccessful &= pipelinedCnvTestFunc();

	// Turn off the CNV pipe when we're done using it
	ICNV_GO = false;

	return allTestsSuccessful ? S_OK : 1;
}

const int RunTestsFloatALU(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

	std_logic_vector_port<32> IN_A(PD_IN, loader, "IN_A");
	std_logic_vector_port<32> IN_B(PD_IN, loader, "IN_B");
	std_logic_vector_port<3> IN_MODE(PD_IN, loader, "IN_MODE");
	std_logic_vector_port<32> OUT_RESULT(PD_OUT, loader, "OUT_RESULT");

	std_logic_port ISHFT_GO(PD_IN, loader, "ISHFT_GO");
	std_logic_port IADD_GO(PD_IN, loader, "IADD_GO");
	std_logic_port IMUL_GO(PD_IN, loader, "IMUL_GO");
	std_logic_port ICMP_GO(PD_IN, loader, "ICMP_GO");
	std_logic_port ISPEC_GO(PD_IN, loader, "ISPEC_GO");
	std_logic_port ICNV_GO(PD_IN, loader, "ICNV_GO");
	std_logic_port IBIT_GO(PD_IN, loader, "IBIT_GO");

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		IN_A = 0.0f;
		IN_B = 0.0f;
		IN_MODE = 0;
	}

	const bool cmpTestsSuccessful = RunTestsFloatCMP(loader, clk, IN_A, IN_B, IN_MODE, ICMP_GO, OUT_RESULT) == S_OK;
	const bool addTestsSuccessful = RunTestsFloatADD(loader, clk, IN_A, IN_B, IADD_GO, OUT_RESULT) == S_OK;
	const bool mulTestsSuccessful = RunTestsFloatMUL(loader, clk, IN_A, IN_B, IMUL_GO, OUT_RESULT) == S_OK;
	const bool shftTestsSuccessful = RunTestsFloatSHFT(loader, clk, IN_A, ISHFT_GO, IN_MODE, OUT_RESULT) == S_OK;
	const bool cnvTestsSuccessful = RunTestsFloatCNV(loader, clk, IN_A, IN_MODE, ICNV_GO, OUT_RESULT) == S_OK;
	const bool rcpTestsSuccessful = RunTestsFloatRCP(loader, clk, IN_A, ISPEC_GO, IN_MODE, OUT_RESULT) == S_OK;
	const bool bitTestsSuccessful = RunTestsFloatBIT(loader, clk, IN_A, IN_B, IBIT_GO, IN_MODE, OUT_RESULT) == S_OK;

	if (cmpTestsSuccessful && addTestsSuccessful && mulTestsSuccessful && shftTestsSuccessful && rcpTestsSuccessful && cnvTestsSuccessful && bitTestsSuccessful)
	{
		return S_OK;
	}
	else
	{
		return 1;
	}
}
