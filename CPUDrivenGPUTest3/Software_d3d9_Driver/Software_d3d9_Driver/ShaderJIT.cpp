#pragma once

#include "ShaderJIT.h"
#include "IDirect3DDevice9Hook.h"
#include "resource.h"
#include "INIVar.h"

INIVar InvokeVSDevPrompt("Software_JITShader", 
#ifdef _M_X64
	"VSCommandPromptPathX64"
#else
	"VSCommandPromptPathX86"
#endif
	,
#ifdef _M_X64
	"C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\Build\\vcvars64.bat"
#else
	"C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\Common7\\Tools\\VsDevCmd.bat"
#endif
);

INIVar DXSDKIncludeDir("Software_JITShader", "DXSDKIncludeDir", "C:\\Program Files (x86)\\Microsoft DirectX SDK (June 2010)\\Include");
#ifdef _M_X64
	INIVar DXSDKLibDirX64("Software_JITShader", "DXSDKLibDirX64", "C:\\Program Files (x86)\\Microsoft DirectX SDK (June 2010)\\Lib\\x64");
#else
	INIVar DXSDKLibDirX86("Software_JITShader", "DXSDKLibDirX86", "C:\\Program Files (x86)\\Microsoft DirectX SDK (June 2010)\\Lib\\x86");
#endif

extern INIVar DriverBaseDir;

extern HINSTANCE hLThisDLL;

#pragma warning(push)
#pragma warning(disable:4996)

void LoadPrefixFileInternal(std::vector<char>& cppfile)
{
#pragma warning(push)
#pragma warning(disable:4302) // warning C4302: 'type cast': truncation from 'LPSTR' to 'WORD'
	HRSRC cppResource = FindResourceA(hLThisDLL, MAKEINTRESOURCEA(IDR_CPP1), "CPP");
#pragma warning(pop)
	if (cppResource)
	{
		HGLOBAL loadedResource = LoadResource(hLThisDLL, cppResource);
		if (loadedResource)
		{
			const unsigned resourceSize = SizeofResource(hLThisDLL, cppResource);
			if (resourceSize > 0)
			{
				const void* const resourceBytes = LockResource(loadedResource);
				if (resourceBytes)
				{
					cppfile.resize(resourceSize);
					memcpy(&cppfile.front(), resourceBytes, resourceSize);
					return;
				}
			}
		}
	}

	__debugbreak(); // Should never be here!
}

// Not multithread-safe!
const char* const ConstructShaderJITName(const ShaderInfo& shaderInfo)
{
	static char buffer[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	// Looks like: "ps_3_0_len114_hash0xD9FF5963d"
	sprintf(buffer, "%cs_%u_%u_len%u_hash0x%08X%c", shaderInfo.isPixelShader ? 'p' : 'v', shaderInfo.shaderMajorVersion, shaderInfo.shaderMinorVersion, shaderInfo.shaderLengthDWORDs, shaderInfo.shaderBytecodeHash, 
#ifdef _DEBUG
		'd'
#else
		'r'
#endif
		);
#pragma warning(pop)
	return buffer;
}

static inline const bool JITBATFile(const ShaderInfo& shaderInfo, const char* const shaderFilename)
{
	char batfilename[MAX_PATH] = {0};
	// Looks like: "shaderjit\ps_3_0_len114_hash0xD9FF5963d.bat"
	sprintf(batfilename, "%s\\%s.bat", shaderJITTempDirectory, shaderFilename);
	HANDLE hBatFile = CreateFileA(batfilename, GENERIC_WRITE, 0, NULL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
	if (hBatFile == INVALID_HANDLE_VALUE)
	{
		DbgBreakPrint("Error in CreateFile");
		return false;
	}

	static std::vector<char> batfile;

	batfile.clear();

#ifdef _DEBUG
	static const char* const compileDefines = "/D \"WIN32\""
	" /D \"_DEBUG\""
	" /D \"_WINDOWS\""
	" /D \"_USRDLL\""
	" /D \"_WINDLL\"";
#else // Release
	static const char* const compileDefines = "/D \"WIN32\""
	" /D \"NDEBUG\""
	" /D \"_WINDOWS\""
	" /D \"_USRDLL\""
	" /D \"_WINDLL\"";
#endif // #ifdef _DEBUG

#ifdef _DEBUG // Debug
	static const char* const compileFlags = "/FAcs /Fa /analyze- /W3 /Zc:wchar_t /ZI /Od /fp:precise /WX- /Zc:forScope /RTC1 /Gd /Oy- /MDd /EHsc /nologo /GS";
#else // Release
	static const char* const compileFlags = "/FAcs /Fa /analyze- /W3 /Zc:wchar_t /Zi /GS- /GL /Gy /Gm- /O2 /Ob2 /fp:fast /GF /WX- /Zc:forScope /arch:AVX2 /Gd /Oy- /Oi /MT /Ot";
#endif // #ifdef _DEBUG

#ifdef _M_X64
	#define MACHINE_PLATFORM "/MACHINE:X64"
	#define SAFESEH_FLAG "" // SafeSEH is not supported on x64
#else
	#define MACHINE_PLATFORM "/MACHINE:X86"
	#define SAFESEH_FLAG "/SAFESEH"
#endif

#ifdef _DEBUG
	static const char* const linkFlags = "/DEBUG /DLL " MACHINE_PLATFORM " /SUBSYSTEM:WINDOWS /NOLOGO /NXCOMPAT";
#else // Release
	static const char* const linkFlags = "/DEBUG /DLL " MACHINE_PLATFORM " /SUBSYSTEM:WINDOWS /NODEFAULTLIB /ENTRY:DllMain /NOLOGO /NXCOMPAT /LTCG /DLL /DYNAMICBASE \"Kernel32.lib\" \"libucrt.lib\" /OPT:REF " SAFESEH_FLAG " /INCREMENTAL:NO /OPT:ICF";
#endif // #ifdef _DEBUG

	// Set up VS command prompt
	{
		// Construct our call string that runs the VS command prompt for our platform. The string looks something like this:
		// "call \"C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\Common7\\Tools\\VsDevCmd.bat\"\r\n"
		AppendString(batfile, "call \"");
		AppendString(batfile, InvokeVSDevPrompt.String() );
		AppendString(batfile, "\"\r\n");
	}

	// Compile
	{
		char batBuffer[1024] = {0};
		sprintf(batBuffer, "cl.exe /c /I \"%s\" %s %s /D \"EXTERNAL_BASE_PATH=%s\" %s.cpp\r\n", DXSDKIncludeDir.String(), compileFlags, compileDefines, DriverBaseDir.String(), shaderFilename);
		AppendString(batfile, batBuffer);
	}

	// Link
	{
		char batBuffer[1024] = {0};
		sprintf(batBuffer, "link.exe /LIBPATH:\"%s\" %s %s.obj\r\n", 
#ifdef _M_X64
			DXSDKLibDirX64.String()
#else
			DXSDKLibDirX86.String()
#endif
			, linkFlags, shaderFilename);
		AppendString(batfile, batBuffer);
	}

	DWORD numBytesWritten = 0;
	if (!WriteFile(hBatFile, &(batfile.front() ), (const DWORD)batfile.size(), &numBytesWritten, NULL) )
	{
		DbgBreakPrint("Error in WriteFile");
		return false;
	}

	if (batfile.size() != numBytesWritten)
	{
		DbgBreakPrint("Error: Num bytes written doesn't match for bat file");
		return false;
	}

	if (!CloseHandle(hBatFile) )
	{
		DbgBreakPrint("Error in CloseHandle");
		return false;
	}

	return true;
}

static inline const bool CompileLinkDLL(const ShaderInfo& shaderInfo, const char* const shaderFilename)
{
	char batfilename[MAX_PATH] = {0};
	// Looks like: "ps_3_0_len114_hash0xD9FF5963d.bat"
	sprintf(batfilename, "%s.bat", shaderFilename);

	char commandLine[MAX_PATH] = {0};
	sprintf(commandLine, "cmd.exe /C \"%s\"", batfilename);

	STARTUPINFOA si = {0};
	si.cb = sizeof(STARTUPINFOA);
	PROCESS_INFORMATION pi = {0};

	char currentDirectory[MAX_PATH] = {0};
	sprintf(currentDirectory, ".\\%s\\", shaderJITTempDirectory);

	// Either show the shadercompile window (default), or hide it
	const DWORD createProcessFlags = 
#ifdef DEBUG_SHOW_SHADERCOMPILE_WINDOW
		0x00000000
#else
		CREATE_NO_WINDOW
#endif
		;

	if (!CreateProcessA(NULL, commandLine, NULL, NULL, FALSE, createProcessFlags, NULL, currentDirectory, &si, &pi) )
	{
		DbgBreakPrint("Error in CreateProcess");
		return false;
	}

	WaitForSingleObject(pi.hProcess, INFINITE);
	DWORD processExitCode = STILL_ACTIVE;
	if (!GetExitCodeProcess(pi.hProcess, &processExitCode) )
	{
		DbgBreakPrint("Error in GetExitCodeProcess");
		return false;
	}

	if (processExitCode == STILL_ACTIVE)
	{
		DbgBreakPrint("Error: Process did not terminate yet");
		return false;
	}

	if (processExitCode == S_OK)
	{
		CloseHandle(pi.hProcess);
		CloseHandle(pi.hThread);
		return true;
	}

	CloseHandle(pi.hProcess);
	CloseHandle(pi.hThread);

	DbgBreakPrint("Error: There was an error while compiling or linking the shader JIT DLL");
	OutputDebugStringA("Failure in shader JIT for shader: ");
	OutputDebugStringA(shaderFilename);
	OutputDebugStringA("\n");

	return false;
}

const bool JITNewShader(const ShaderInfo& shaderInfo, const char* const shaderFilename)
{
	if (!CreateDirectoryA(shaderJITTempDirectory, NULL) )
	{
		switch (GetLastError() )
		{
		case ERROR_ALREADY_EXISTS:
			// This is fine
			break;
		default:
		case ERROR_PATH_NOT_FOUND:
			// This is not fine!
			DbgBreakPrint("Error in CreateDirectory");
			return false;
		}
	}

	if (!JITCPPFileInternal(shaderInfo, shaderFilename) )
	{
		return false;
	}

	if (!JITBATFile(shaderInfo, shaderFilename) )
	{
		return false;
	}

	if (!CompileLinkDLL(shaderInfo, shaderFilename) )
	{
		return false;
	}

	return true;
}

#pragma warning(pop)
