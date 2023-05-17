#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "ShaderCoreALUCommon.h"
#include <intrin.h>

static const constexpr unsigned INTERP_CYCLES = MUL_CYCLES + ADD_CYCLES + ADD_CYCLES;
static const float negInf = -(INFINITY);
static const float posInf = (INFINITY);

// Uncomment this to enable debug signals:
// #define HAS_DEBUG_SIGNALS 1

static const float EmulateInterpFunc(const float b, const float c, const float attr0, const float attr10, const float attr20)
{
	const float product0 = b * attr10;
	const float product1 = c * attr20;
	const float sum0 = product0 + product1;
	const float sum1 = sum0 + attr0;
	return sum1;
}

struct pipelinedTest
{
	float b;
	float c;
	float attr0;
	float attr10;
	float attr20;

	bool bPipeEnabled = true;
};

static const pipelinedTest testResults[] =
{
	//  b,    c,attr0,attr10,attr20, enable
	{0.5f, 0.5f, 1.0f, 2.0f, 3.0f, false},
	{0.0f, 0.0f, 16777218.0f, 999999.0f, 999999.0f, true},
	{0.0f, 1.0f, 0.0f, 12583937.0f, 12345.0f, true},
	{1.0f, 0.0f, 0.0f, 12345.0f, 12583937.0f, true},
	{1.0f, 1.0f, -1.0f, -2.0f, -3.0f, true},
	{0.25f, 0.75f, 1.0f, 2.0f, 3.0f, true},
	{0.35f, 0.65f, 0.0f, -19.0f, 20.0f, true},
	{0.5f, 0.5f, 0.0f, -100.0f, 100.0f, true},
	{0.5f, 0.5f, 1.0f, 2.0f, 3.0f, false},
	{0.95f, 0.99f, 1.0f, 2.0f, 3.0f, true},
	{0.5f, 0.5f, posInf, 2.0f, 3.0f, true},
	{0.5f, 0.5f, 1.0f, posInf, 3.0f, true},
	{0.5f, 0.5f, 1.0f, 2.0f, posInf, true},
	{0.5f, posInf, 1.0f, 2.0f, 3.0f, true},
	{posInf, 0.5f, 1.0f, 2.0f, 3.0f, true},
	{0.0f, 0.5f, 1.0f, 2.0f, 3.0f, true},
	{0.5f, 0.0f, 1.0f, 2.0f, 3.0f, true},
	{0.5f, 0.5f, 0.0f, 2.0f, 3.0f, true},
	{0.5f, 0.5f, 1.0f, 0.0f, 3.0f, true},
	{0.5f, 0.5f, 1.0f, 2.0f, 0.0f, true},
	{0.0f, 0.0f, 0.0f, 0.0f, 0.0f, true},
	{0.5f, 0.5f, 1.0f, 4.0f, -6.0f, true},
	{0.5f, 0.5f, NAN, 2.0f, 3.0f, true},
	{0.5f, 0.5f, 1.0f, NAN, 3.0f, true},
	{0.5f, NAN, 1.0f, 2.0f, 3.0f, true},
	{0.1f, 0.9f, 5.0f, 7.0f, 113.0f, true},
	{0.13f, 0.77f, 0.0001f, -0.25f, -0.5f, true},
	{0.5f, 0.5f, 1.0f, 2.0f, -3.0f, true},
	{0.5f, 0.5f, 2.0f, -5.0f, 5.0f, true},
	{0.5f, 0.5f, 3.0f, -3.0f, 1.0f, true},
	{0.5f, 0.5f, 4.0f, 4.0f, 6.0f, true},
	{0.5f, 0.5f, 5.0f, 1.0f, 0.0f, true}
};

void PrintBinary(const unsigned val)
{
	for (int x = 16; x >= 0; --x)
	{
		if (val & (1 << x) )
			printf("1");
		else
			printf("0");
	}
}

static inline const float frand()
{
	return rand() / (const float)RAND_MAX;
}

const int RunTestsFloatALU_Interpolator(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	srand(1);

	std_logic_port clk(PD_IN, loader, "clk");

	std_logic_vector_port<32> IN_B(PD_IN, loader, "IN_B");
	std_logic_vector_port<32> IN_C(PD_IN, loader, "IN_C");
	std_logic_vector_port<32> IN_Attr0(PD_IN, loader, "IN_Attr0");
	std_logic_vector_port<32> IN_Attr10(PD_IN, loader, "IN_Attr10");
	std_logic_vector_port<32> IN_Attr20(PD_IN, loader, "IN_Attr20");
	std_logic_vector_port<32> OINTERP(PD_OUT, loader, "OINTERP");

#ifdef HAS_DEBUG_SIGNALS
	std_logic_vector_port<32> DBG_Prod0(PD_OUT, loader, "DBG_Prod0");
	std_logic_vector_port<32> DBG_Prod1(PD_OUT, loader, "DBG_Prod1");
	std_logic_vector_port<32> DBG_Add0(PD_OUT, loader, "DBG_Add0");
	std_logic_vector_port<32> DBG_Add1Input(PD_OUT, loader, "DBG_Add1Input");
	std_logic_vector_port<9> DBG_PipelinedGoSig(PD_OUT, loader, "DBG_PipelinedGoSig");
#endif

	std_logic_port IINTERP_GO(PD_IN, loader, "IINTERP_GO");

	const auto setInterpParamsFunc = [&](const float b, const float c, const float attr0, const float attr10, const float attr20)
	{
		IN_B = b;
		IN_C = c;
		IN_Attr0 = attr0;
		IN_Attr10 = attr10;
		IN_Attr20 = attr20;
	};

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		setInterpParamsFunc(0.0f, 0.0f, 0.0f, 0.0f, 0.0f);
		IINTERP_GO = false;
	}

	const auto interpTestFunc = [&](const float b, const float c, const float attr0, const float attr10, const float attr20) -> float
	{
		setInterpParamsFunc(b, c, attr0, attr10, attr20);
		IINTERP_GO = true;

#ifdef HAS_DEBUG_SIGNALS
		float dbg_prod0 = DBG_Prod0.GetFloat32Val();
		float dbg_prod1 = DBG_Prod1.GetFloat32Val();
		float dbg_add0 = DBG_Add0.GetFloat32Val();
		float dbg_add1input = DBG_Add1Input.GetFloat32Val();
		unsigned dbgGoSig = DBG_PipelinedGoSig.GetUint32Val();
#endif

		for (unsigned steps = 0; steps < INTERP_CYCLES; ++steps)
		{
			if (steps > 0)
			{
				setInterpParamsFunc(0.0f, 0.0f, 0.0f, 0.0f, 0.0f);
			}
#ifdef HAS_DEBUG_SIGNALS
			dbg_prod0 = DBG_Prod0.GetFloat32Val();
			dbg_prod1 = DBG_Prod1.GetFloat32Val();
			dbg_add0 = DBG_Add0.GetFloat32Val();
			dbg_add1input = DBG_Add1Input.GetFloat32Val();
			dbgGoSig = DBG_PipelinedGoSig.GetUint32Val();
#endif
			scoped_timestep time(loader, clk, 100);
#ifdef HAS_DEBUG_SIGNALS
			dbg_prod0 = DBG_Prod0.GetFloat32Val();
			dbg_prod1 = DBG_Prod1.GetFloat32Val();
			dbg_add0 = DBG_Add0.GetFloat32Val();
			dbg_add1input = DBG_Add1Input.GetFloat32Val();
			dbgGoSig = DBG_PipelinedGoSig.GetUint32Val();
			printf("End of cycle %02u: prod0: %f; prod1: %f; add0: %f; add1input: %f; goSigVec: ", steps, dbg_prod0, dbg_prod1, dbg_add0, dbg_add1input);
			PrintBinary(dbgGoSig);
			printf("; Out: %f\n", OINTERP.GetFloat32Val() );
#endif
		}
#ifdef HAS_DEBUG_SIGNALS
		dbg_prod0 = DBG_Prod0.GetFloat32Val();
		dbg_prod1 = DBG_Prod1.GetFloat32Val();
		dbg_add0 = DBG_Add0.GetFloat32Val();
		dbg_add1input = DBG_Add1Input.GetFloat32Val();
		dbgGoSig = DBG_PipelinedGoSig.GetUint32Val();
#endif
		IINTERP_GO = false;
		const float res = OINTERP.GetFloat32Val();
		return res;
	};

	const auto resultsMatch = [](const float emulatedResult, const float simulatedResult) -> bool
	{
		if (simulatedResult != emulatedResult)
		{
			const int iSimulatedResult = *(const int* const)&simulatedResult;
			const int iEmulatedResult = *(const int* const)&emulatedResult;
			if (abs(iSimulatedResult - iEmulatedResult) > 16)
			{
				if (!isnan(simulatedResult) && !isnan(emulatedResult) )
				{
					return false;
				}
			}
		}
		return true;
	};

	bool oneShotSuccess = true;
	for (unsigned testID = 0; testID < ARRAYSIZE(testResults); ++testID)
	{
		setInterpParamsFunc(0.0f, 0.0f, 0.0f, 0.0f, 0.0f);
		IINTERP_GO = false;
		for (unsigned clearNumCycles = 0; clearNumCycles < INTERP_CYCLES + 5; ++clearNumCycles)
		{
			scoped_timestep time(loader, clk, 100);
		}
		const pipelinedTest& thisTest = testResults[testID];
		const float simulatedResult = interpTestFunc(thisTest.b, thisTest.c, thisTest.attr0, thisTest.attr10, thisTest.attr20);
		const float emulatedResult = EmulateInterpFunc(thisTest.b, thisTest.c, thisTest.attr0, thisTest.attr10, thisTest.attr20);
		const bool resultGood = resultsMatch(emulatedResult, simulatedResult);
		printf("Test #%u. Sim result: %f. Emulated result: %f\n", testID, simulatedResult, emulatedResult);
		if (!resultGood)
		{
			oneShotSuccess = false;
#ifdef _DEBUG
			__debugbreak();
#endif
		}
	}

	const auto pipelinedInterpTestFunc = [&]() -> bool
	{
		static_assert(INTERP_CYCLES == 13u, "Need to rewrite this function if the instruction latency of the INTERP pipe changes!");

		bool resultsValid[ARRAYSIZE(testResults)] = {false};
		for (unsigned cycle = 0; cycle < ARRAYSIZE(testResults) + INTERP_CYCLES + 1; ++cycle)
		{
			if (cycle < ARRAYSIZE(testResults) )
			{
				const pipelinedTest& thisCycleData = testResults[cycle];
				printf("Pushing new data for cycle %u: [%s] %f, %f, %f, %f, %f . Expecting result: %f\n", cycle, thisCycleData.bPipeEnabled ? "enabled" : "disabled", thisCycleData.b, thisCycleData.c, thisCycleData.attr0, thisCycleData.attr10, thisCycleData.attr20, EmulateInterpFunc(thisCycleData.b, thisCycleData.c, thisCycleData.attr0, thisCycleData.attr10, thisCycleData.attr20) );
				setInterpParamsFunc(thisCycleData.b, thisCycleData.c, thisCycleData.attr0, thisCycleData.attr10, thisCycleData.attr20);
				IINTERP_GO = thisCycleData.bPipeEnabled;
			}
			else
			{
				IINTERP_GO = false;
			}

			{
				scoped_timestep time(loader, clk, 100); // Pulse our clock
			}
			const float fSimResult = OINTERP.GetFloat32Val();
			printf("Sim result for cycle %u: %f\n", cycle, fSimResult);

			if (cycle >= INTERP_CYCLES - 1 && cycle < ARRAYSIZE(testResults) + INTERP_CYCLES - 1)
			{
				const pipelinedTest& previousCycleData = testResults[cycle - INTERP_CYCLES + 1];
				const float emulatedResult = EmulateInterpFunc(previousCycleData.b, previousCycleData.c, previousCycleData.attr0, previousCycleData.attr10, previousCycleData.attr20);
				const bool resultMatches = !previousCycleData.bPipeEnabled || resultsMatch(emulatedResult, fSimResult);
				resultsValid[cycle - INTERP_CYCLES + 1] = resultMatches;
			}
		}

		bool allValid = true;
		for (unsigned x = 0; x < ARRAYSIZE(testResults); ++x)
		{
			allValid = allValid && resultsValid[x];
		}

		return allValid;
	};

	const bool pipelineSuccess = pipelinedInterpTestFunc();

	const auto randomPipelinedInterpTestFunc = [&]() -> bool
	{
		static_assert(INTERP_CYCLES == 13u, "Need to rewrite this function if the instruction latency of the INTERP pipe changes!");

		static pipelinedTest randTestResults[512] = {0};
		for (unsigned x = 0; x < ARRAYSIZE(randTestResults); ++x)
		{
			randTestResults[x].bPipeEnabled = rand() % 10 >= 8;
			randTestResults[x].b = frand();
			randTestResults[x].c = frand();
			randTestResults[x].attr0 = frand() * 256.0f - 128.0f;
			randTestResults[x].attr10 = frand() * 256.0f - 128.0f;
			randTestResults[x].attr20 = frand() * 256.0f - 128.0f;
		}

		static bool randResultsValid[ARRAYSIZE(randTestResults)] = {false};
		for (unsigned cycle = 0; cycle < ARRAYSIZE(randTestResults) + INTERP_CYCLES + 1; ++cycle)
		{
			if (cycle < ARRAYSIZE(randTestResults) )
			{
				const pipelinedTest& thisCycleData = randTestResults[cycle];
				printf("Pushing new data for cycle %u: [%s] %f, %f, %f, %f, %f . Expecting result: %f\n", cycle, thisCycleData.bPipeEnabled ? "enabled" : "disabled", thisCycleData.b, thisCycleData.c, thisCycleData.attr0, thisCycleData.attr10, thisCycleData.attr20, EmulateInterpFunc(thisCycleData.b, thisCycleData.c, thisCycleData.attr0, thisCycleData.attr10, thisCycleData.attr20) );
				setInterpParamsFunc(thisCycleData.b, thisCycleData.c, thisCycleData.attr0, thisCycleData.attr10, thisCycleData.attr20);
				IINTERP_GO = thisCycleData.bPipeEnabled;
			}
			else
			{
				IINTERP_GO = false;
			}

			{
				scoped_timestep time(loader, clk, 100); // Pulse our clock
			}
			const float fSimResult = OINTERP.GetFloat32Val();
			printf("Sim result for cycle %u: %f\n", cycle, fSimResult);

			if (cycle >= INTERP_CYCLES - 1 && cycle < ARRAYSIZE(randTestResults) + INTERP_CYCLES - 1)
			{
				const pipelinedTest& previousCycleData = randTestResults[cycle - INTERP_CYCLES + 1];
				const float emulatedResult = EmulateInterpFunc(previousCycleData.b, previousCycleData.c, previousCycleData.attr0, previousCycleData.attr10, previousCycleData.attr20);
				const bool resultMatches = !previousCycleData.bPipeEnabled || resultsMatch(emulatedResult, fSimResult);
				randResultsValid[cycle - INTERP_CYCLES + 1] = resultMatches;
#ifdef _DEBUG
				if (!resultMatches)
				{
					__debugbreak();
				}
#endif
			}
		}

		bool allValid = true;
		for (unsigned x = 0; x < ARRAYSIZE(randTestResults); ++x)
		{
			allValid = allValid && randResultsValid[x];
		}

		return allValid;
	};

	const bool randomPipelineSuccess = randomPipelinedInterpTestFunc();

	return (pipelineSuccess && oneShotSuccess && randomPipelineSuccess) ? S_OK : E_FAIL;
}
