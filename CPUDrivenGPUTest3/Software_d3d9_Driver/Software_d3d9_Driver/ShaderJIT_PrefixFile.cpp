#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

// Needed for DisableThreadLibraryCalls()
#pragma comment(lib, "Kernel32.lib")

// TODO: Don't hardcode these paths, it won't work on other people's computers as-is
#include "C:\\Users\\Tom\\Documents\\Visual Studio 2022\\Projects\\Software_d3d9_Driver\\Software_d3d9_Driver\\VShaderEngine.h"
#include "C:\\Users\\Tom\\Documents\\Visual Studio 2022\\Projects\\Software_d3d9_Driver\\Software_d3d9_Driver\\PShaderEngine.h"
#include "C:\\Users\\Tom\\Documents\\Visual Studio 2022\\Projects\\Software_d3d9_Driver\\Software_d3d9_Driver\\ShaderAnalysis.h"
#include "C:\\Users\\Tom\\Documents\\Visual Studio 2022\\Projects\\Software_d3d9_Driver\\Software_d3d9_Driver\\IDirect3DDevice9Hook.h"
#include "C:\\Users\\Tom\\Documents\\Visual Studio 2022\\Projects\\Software_d3d9_Driver\\Software_d3d9_Driver\\IDirect3DPixelShader9Hook.h"
#include "C:\\Users\\Tom\\Documents\\Visual Studio 2022\\Projects\\Software_d3d9_Driver\\Software_d3d9_Driver\\IDirect3DVertexShader9Hook.h"
#include "C:\\Users\\Tom\\Documents\\Visual Studio 2022\\Projects\\Software_d3d9_Driver\\Software_d3d9_Driver\\IDirect3DTexture9Hook.h"

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
