#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

// Needed for DisableThreadLibraryCalls()
#pragma comment(lib, "Kernel32.lib")

// The EXTERNAL_BASE_PATH define gets set programatically from the calling process
#define STRINGIFY_MACRO(x) STR(x)
#define STR(x) #x
#define EXPAND(x) x
#define CONCAT(a, b) STRINGIFY_MACRO(EXPAND(a)EXPAND(b))
#include CONCAT(EXTERNAL_BASE_PATH,\Software_d3d9_Driver\VShaderEngine.h) // #include "VShaderEngine.h"
#include CONCAT(EXTERNAL_BASE_PATH,\Software_d3d9_Driver\PShaderEngine.h) // #include "PShaderEngine.h"
#include CONCAT(EXTERNAL_BASE_PATH,\Software_d3d9_Driver\ShaderAnalysis.h) // #include "ShaderAnalysis.h"
#include CONCAT(EXTERNAL_BASE_PATH,\Software_d3d9_Driver\IDirect3DDevice9Hook.h) // #include "IDirect3DDevice9Hook.h"
#include CONCAT(EXTERNAL_BASE_PATH,\Software_d3d9_Driver\IDirect3DPixelShader9Hook.h) // #include "IDirect3DPixelShader9Hook.h"
#include CONCAT(EXTERNAL_BASE_PATH,\Software_d3d9_Driver\IDirect3DVertexShader9Hook.h) // #include "IDirect3DVertexShader9Hook.h"
#include CONCAT(EXTERNAL_BASE_PATH,\Software_d3d9_Driver\IDirect3DTexture9Hook.h) // #include "IDirect3DTexture9Hook.h"

#pragma pack(1)

extern "C" {

// This dummy symbol is needed if we're not linking against the CRT
int _fltused = 0;

BOOL WINAPI DllMain(HINSTANCE hInst, DWORD reason, LPVOID)
{
	switch (reason)
	{
	case DLL_PROCESS_ATTACH:
		DisableThreadLibraryCalls(hInst);
		break;
	case DLL_PROCESS_DETACH:
		break;
	}
	return TRUE;
}

// ShaderMain goes here
