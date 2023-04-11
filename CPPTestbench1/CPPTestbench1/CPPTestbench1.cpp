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
#include "Testbenches/ROPTestbench.h"
#include "Testbenches/EthernetTestbench.h"
#include "Testbenches/HDMIScanoutTestbench.h"
#include "Testbenches/ClipUnitTestbench.h"

static const WCHAR* const simengine_libpath = L"D:\\Xilinx\\Vivado\\2018.1\\lib\\win64.o";
static const WCHAR* const simengine_imageformats_libpath = L"D:\\Xilinx\\Vivado\\2018.1\\lib\\win64.o\\imageformats";
static const char* const simengine_libname = "librdi_simulator_kernel.dll";
static const char* const design_name = "ClipUnit";
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

		//status = RunTestsShaderCore(loader);
		//status = RunTestsFloatALU(loader);
		//status = RunTestsUNORM8ToFloat(loader);
		//status = RunTestsIndexBufferCache(loader);
		//status = RunTestsInputAssembler(loader);
		//status = RunTestsVertexBatchBuilder(loader);
		//status = RunTestsVertexStreamCache(loader);
		//status = RunTestsTriSetup(loader);
		//status = RunTestsRasterizer(loader);
		//status = RunTestsDepthInterp(loader);
		//status = RunTestsAttributeInterp(loader);
		//status = RunTestsTexSampler(loader, renderWindow);
		//status = RunTestsROP(loader, renderWindow);
		//status = RunTestsEthernet(loader);
		//status = RunTestsHDMIScanout(loader, renderWindow);
		status = RunTestsClipUnit(loader, renderWindow);
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
