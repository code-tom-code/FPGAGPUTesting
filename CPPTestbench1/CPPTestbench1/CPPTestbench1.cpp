#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include <stdio.h>
#include <string>
#include "CPPTestbench.h"
#include "RenderWindow.h"

#include <intrin.h>

// Testbench includes:
#include "Testbenches/ShaderCoreTestbench.h"
#include "Testbenches/FloatALUTestbench.h"
#include "Testbenches/FloatALU_InterpolatorTestbench.h"
#include "Testbenches/UNORM8ToFloatTestbench.h"
#include "Testbenches/IndexBufferCacheTestbench.h"
#include "Testbenches/InputAssemblerTestbench.h"
#include "Testbenches/VertexBatchBuilderTestbench.h"
#include "Testbenches/VertexStreamCacheTestbench.h"
#include "Testbenches/TriSetupTestbench.h"
#include "Testbenches/RasterizerTestbench.h"
#include "Testbenches/DepthInterpTestbench.h"
#include "Testbenches/AttributeInterpTestbench.h"
#include "Testbenches/TexSamplerTestbench.h"
#include "Testbenches/TexDecompressTestbench.h"
#include "Testbenches/ROPTestbench.h"
#include "Testbenches/EthernetTestbench.h"
#include "Testbenches/HDMIScanoutTestbench.h"
#include "Testbenches/ClipUnitTestbench.h"
#include "Testbenches/StateBlockTestbench.h"
#include "Testbenches/TexAddressTestbench.h"

static const WCHAR* const simengine_libpath = L"C:\\Xilinx\\Vivado\\2024.2\\lib\\win64.o";
static const WCHAR* const simengine_imageformats_libpath = L"C:\\Xilinx\\Vivado\\2024.2\\lib\\win64.o\\imageformats";
// After Vivado 2024.2, the simengine libname has been changed to "xv_simulator_kernel". Before then, it is known as "librdi_simulator_kernel" instead:
static const char* const simengine_libname = "xv_simulator_kernel.dll";//"librdi_simulator_kernel.dll";

static const char* const design_name = "TexAddress";
static char wdbName[] = "xsim.wdb";
static D3DCOLOR colorsArray[640 * 480] = {0};
static RenderWindow* renderWindow = NULL;

static std::string getcurrentdir()
{
	char buf[MAX_PATH] = {0};
	GetCurrentDirectoryA(sizeof(buf), buf);
	buf[sizeof(buf) - 1] = 0;
	return buf;
}

// Quick test to find out if this is feasible:
/*unsigned D3DSpecConvertFtoUNORM24(float f)
{
	if (f <= 0.0f)
		return 0;
	else if (f >= 1.0f)
		return 0xFFFFFF;
	float scaledF = f * 16777215.0f;
	//scaledF = scaledF + 0.5f; // Round to nearest even
	return (const unsigned)scaledF;
}

unsigned short D3DSpecConvertFtoUNORM16(float f)
{
	if (f <= 0.0f)
		return 0;
	else if (f >= 1.0f)
		return 0xFFFF;
	float scaledF = f * 65535.0f;
	//scaledF = scaledF + 0.5f; // Round to nearest even
	return (const unsigned short)scaledF;
}

unsigned char D3DSpecConvertFtoUNORM8(float f)
{
	if (f <= 0.0f)
		return 0;
	else if (f >= 1.0f)
		return 0xFF;
	float scaledF = f * 255.0f;
	//scaledF = scaledF + 0.5f; // Round to nearest even
	return (const unsigned char)scaledF;
}

unsigned short TruncateConvertUNORM16(float f)
{
	return (D3DSpecConvertFtoUNORM24(f) - 128) >> 8;
}

unsigned char TruncateConvertUNORM8(float f)
{
	return (D3DSpecConvertFtoUNORM24(f) - 32768) >> 16;
}*/

int main(const int argc, const char* const argv[])
{
	const std::string design_libname = getcurrentdir() + "\\xsim.dir\\" + design_name + "\\xsimk.dll";

	/*for (float f = 0.0f; f <= 1.0f; f += (1.0f / 1024.0f) )
	{
		const unsigned char standardConvert = D3DSpecConvertFtoUNORM8(f);
		const unsigned char truncateConvert = TruncateConvertUNORM8(f);
		if (standardConvert != truncateConvert)
		{
			printf("Discrepancy detected for x = %f; Spec converted to: 0x%02X; Truncate converted to: 0x%02X; Over/Under: %c\n", f, standardConvert, truncateConvert, standardConvert < truncateConvert ? '>' : '<');
		}
	}*/

	/*for (unsigned x = 0; x < 64; ++x)
	{
		//const float fVal = x / 63.0f;
		//printf("0x%02X,\n", (const unsigned)(fVal * 255.0f + 0.5f) );
		printf("0x%02X,\n", (x << 2) | (x >> 4) );
	}*/

	printf("Design DLL: %s\n", design_libname.c_str() );
	printf("Sim Engine DLL: %s\n", simengine_libname);

	// Make sure that the design DLL that we built with our batch script can find the Vivado DLL's (they're not in the default PATH environment variable for some reason)
	//AddDllDirectory(simengine_imageformats_libpath);
	AddDllDirectory(simengine_libpath);
	SetDefaultDllDirectories(LOAD_LIBRARY_SEARCH_APPLICATION_DIR | LOAD_LIBRARY_SEARCH_DEFAULT_DIRS | LOAD_LIBRARY_SEARCH_SYSTEM32 | LOAD_LIBRARY_SEARCH_USER_DIRS);
	InitClipPlanes();
	
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

		// Test shared components:
		//status = RunTestsFloatALU(loader);
		//status = RunTestsFloatALU_Interpolator(loader);
		//status = RunTestsUNORM8ToFloat(loader);

		// Test individual pipeline cores one at a time in the order that they flow through the graphics pipeline:
		//status = RunTestsIndexBufferCache(loader);
		//status = RunTestsVertexBatchBuilder(loader);
		//status = RunTestsVertexStreamCache(loader);
		//status = RunTestsShaderCore(loader);
		//status = RunTestsInputAssembler(loader);
		//status = RunTestsClipUnit(loader, renderWindow);
		//status = RunTestsTriSetup(loader);
		//status = RunTestsRasterizer(loader, renderWindow);
		//status = RunTestsDepthInterp(loader);
		//status = RunTestsAttributeInterp(loader);
		//status = RunTestsTexSampler(loader, renderWindow);
		//status = RunTestsROP(loader, renderWindow);
		//status = RunTestsHDMIScanout(loader, renderWindow);
		//status = RunTestsStateBlock(loader);
		//status = RunTestsTexDecompress(loader, renderWindow);
		status = RunTestsTexAddress(loader);

		// Test ethernet/comms core:
		//status = RunTestsEthernet(loader);
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
