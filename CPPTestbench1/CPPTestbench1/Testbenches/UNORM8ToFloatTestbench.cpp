#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "../CPPTestbench.h"
#include "../RenderWindow.h"

static const unsigned FloatToUnorm8(float f)
{
	if (isnan(f) )
		return 0;

	if (f > 1.0f)
		f = 1.0f;
	else if (f < 0.0f)
		f = 0.0f;

	f *= 255.0f;
	f += 0.5f;
	return (const unsigned)f;
}

static const float Unorm8ToFloat(const unsigned u)
{
	const float fVal = (const float)u;
	return fVal / 255.0f;
}

const int RunTestsUNORM8ToFloat(Xsi::Loader& loader)
{
	// Start everything off at the beginning:
	loader.restart();

	std_logic_port clk(PD_IN, loader, "clk");

	std_logic_port Enable(PD_IN, loader, "Enable");
	std_logic_vector_port<32> D3DColorIn(PD_IN, loader, "D3DColorIn");
	std_logic_vector_port<32> FloatXOut(PD_OUT, loader, "FloatXOut");
	std_logic_vector_port<32> FloatYOut(PD_OUT, loader, "FloatYOut");
	std_logic_vector_port<32> FloatZOut(PD_OUT, loader, "FloatZOut");
	std_logic_vector_port<32> FloatWOut(PD_OUT, loader, "FloatWOut");

	// Start up idling with default values for a hundred cycles:
	for (unsigned startupCycle = 0; startupCycle < 100; ++startupCycle)
	{
		scoped_timestep time(loader, clk, 100);

		Enable = false;
		D3DColorIn = 0x00000000;
	}

	const auto convertTest = [&](const D3DCOLOR color) -> D3DXVECTOR4
	{
		Enable = true;
		D3DColorIn = (const uint32_t)color;
		{
			scoped_timestep time(loader, clk, 100);
		}
		D3DXVECTOR4 ret;
		ret.x = FloatXOut.GetFloat32Val();
		ret.y = FloatYOut.GetFloat32Val();
		ret.z = FloatZOut.GetFloat32Val();
		ret.w = FloatWOut.GetFloat32Val();
		return ret;
	};

	const D3DXVECTOR4 oneTest = convertTest(D3DCOLOR_ARGB(255, 255, 255, 255) );
	if (oneTest != D3DXVECTOR4(1.0f, 1.0f, 1.0f, 1.0f) )
	{
		return 1;
	}

	const D3DXVECTOR4 zeroTest = convertTest(D3DCOLOR_ARGB(0, 0, 0, 0) );
	if (zeroTest != D3DXVECTOR4(0.0f, 0.0f, 0.0f, 0.0f) )
	{
		return 1;
	}

	static float deltaVals[256] = {0};
	static int deltaInts[256] = {0};

	for (unsigned testUNORM = 0; testUNORM <= 0xFF; ++testUNORM)
	{
		const D3DCOLOR testColor = D3DCOLOR_ARGB(testUNORM, testUNORM, testUNORM, testUNORM);
		const D3DXVECTOR4 incrementalTest = convertTest(testColor);
		if (incrementalTest.x != incrementalTest.y)
		{
			return 1;
		}
		if (incrementalTest.x != incrementalTest.z)
		{
			return 1;
		}
		if (incrementalTest.x != incrementalTest.w)
		{
			return 1;
		}

		// Throw an error if our converted floats can't roundtrip from float <--> UNORM and back again to the same values
		const unsigned roundTrippedUNORM = FloatToUnorm8(incrementalTest.x);
		const D3DCOLOR compareRoundTrippedColor = D3DCOLOR_ARGB(roundTrippedUNORM, roundTrippedUNORM, roundTrippedUNORM, roundTrippedUNORM);
		if (compareRoundTrippedColor != testColor)
		{
			__debugbreak();
		}

		const float exactFloatConversion = Unorm8ToFloat(testUNORM);
		deltaVals[testUNORM] = abs(exactFloatConversion - incrementalTest.x);
		deltaInts[testUNORM] = *reinterpret_cast<const int* const>(&exactFloatConversion) - *reinterpret_cast<const int* const>(&(incrementalTest.x) );
	}

	const D3DXVECTOR4 middleTest = convertTest(D3DCOLOR_XRGB(121, 193, 67) );

	return S_OK;
}
