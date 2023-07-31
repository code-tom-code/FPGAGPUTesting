#pragma once

#include "IDirect3DVertexShader9Hook.h"
#include "ShaderBase.h"
#include "ShaderJIT.h"
#include "..\DriverShaderCompiler\DriverShaderCompiler.h"
#include "Driver/IBaseDeviceComms.h"

static std::vector<IDirect3DVertexShader9Hook*> aliveVertShaders;

#ifdef _DEBUG
void PrintDebugVertexShaderName(char* const outString, const char* const inName)
{
#pragma warning(push)
#pragma warning(disable:4996)
	strcpy(outString, inName);
#pragma warning(pop)
}
#endif // #ifdef _DEBUG

void IDirect3DVertexShader9Hook::CreateVertexShader(const DWORD* const pFunction)
{
	isPretransformPassthroughVS = false;

	if (!pFunction)
		return;

	ShaderInfo tempVertexShaderInfo;
	AnalyzeShader(pFunction, tempVertexShaderInfo
#ifdef _DEBUG
		,"NoneVS"
#endif
		);

	if (tempVertexShaderInfo.isPixelShader)
	{
		// This is not a vertex shader!
		__debugbreak();
	}

	switch (tempVertexShaderInfo.shaderMajorVersion)
	{
	case 1:
	case 2:
	case 3:
		// We're good!
		break;
	default:
		// This is not a valid D3D9 shader!
		{
			__debugbreak();
		}
		break;
	}

	shaderBytecode.resize(tempVertexShaderInfo.shaderLengthDWORDs);
	memcpy(&shaderBytecode.front(), pFunction, tempVertexShaderInfo.shaderLengthDWORDs * sizeof(DWORD) );

	// Bad hack to rebase all of the pointer offsets, fix plz!
	AnalyzeShader(&shaderBytecode.front(), vertexShaderInfo
#ifdef _DEBUG
		,"NoneVS"
#endif
		);

	if (tempVertexShaderInfo.shaderMajorVersion == 3)
	{
		const std::vector<DeclaredRegister>& declaredRegs = tempVertexShaderInfo.declaredRegisters;
		const unsigned numDeclaredRegs = declaredRegs.size();
#ifdef _DEBUG
		outPositionRegisterIndex = 0xFFFFFFFF;
#endif
		outTexcoord0RegisterIndex = 0;
		outColor0RegisterIndex = 0;
		static const unsigned NUM_PRE_OT_REGISTERS = 3u; // This is the dedicated oPos, oFog, and oPts registers used by pre-vs_3_0 shader models
		for (unsigned x = 0; x < numDeclaredRegs; ++x)
		{
			const DeclaredRegister& thisReg = declaredRegs[x];
			if (!thisReg.isOutputRegister)
				continue;
			if (thisReg.usageType == D3DDECLUSAGE_POSITION || thisReg.usageType == D3DDECLUSAGE_POSITIONT)
			{
				outPositionRegisterIndex = NUM_PRE_OT_REGISTERS + thisReg.registerIndex;
				break;
			}
		}
		for (unsigned x = 0; x < numDeclaredRegs; ++x)
		{
			const DeclaredRegister& thisReg = declaredRegs[x];
			if (!thisReg.isOutputRegister)
				continue;
			if (thisReg.usageType == D3DDECLUSAGE_TEXCOORD && thisReg.usageIndex == 0)
			{
				outTexcoord0RegisterIndex = NUM_PRE_OT_REGISTERS + thisReg.registerIndex;
				break;
			}
		}
		for (unsigned x = 0; x < numDeclaredRegs; ++x)
		{
			const DeclaredRegister& thisReg = declaredRegs[x];
			if (!thisReg.isOutputRegister)
				continue;
			if (thisReg.usageType == D3DDECLUSAGE_COLOR && thisReg.usageIndex == 0)
			{
				outColor0RegisterIndex = NUM_PRE_OT_REGISTERS + thisReg.registerIndex;
				break;
			}
		}
#ifdef _DEBUG
		if (outPositionRegisterIndex == 0xFFFFFFFF)
		{
			__debugbreak(); // Output Position register not found!
		}
#endif
	}
	else
	{
		// For vertex shaders before version vs_3_0, this should always be the dedicated oPos output register
		outPositionRegisterIndex = 0;
		outColor0RegisterIndex = 3; // This is oD0
		outTexcoord0RegisterIndex = 5; // This is oT0
	}

	parentDevice->LockDeviceCS();
	aliveVertShaders.push_back(this);
	parentDevice->UnlockDeviceCS();

#ifdef _DEBUG
	const char* const jitName = ConstructShaderJITName(tempVertexShaderInfo);
	PrintDebugVertexShaderName(debugObjectName, jitName);
#endif

	//JitLoadShader();
}

static const unsigned GetVertexElementsHash(const DebuggableD3DVERTEXELEMENT9* const pElements, const unsigned numElements)
{
	unsigned hashResult = 0;
	const unsigned bytesSize = sizeof(DebuggableD3DVERTEXELEMENT9) * numElements;
	const BYTE* const bytesData = (const BYTE* const)pElements;
	for (unsigned x = 0; x < bytesSize; ++x)
	{
		hashResult ^= bytesData[x];
		hashResult = RotateLeft32(hashResult, 7);
	}
	return hashResult;
}

void IDirect3DVertexShader9Hook::CreatePretransformPassthroughVertexShader(const DebuggableD3DVERTEXELEMENT9* const pElements, const unsigned numElements)
{
	isPretransformPassthroughVS = true;

	outPositionRegisterIndex = 0;
	outColor0RegisterIndex = 1; // This is oD0
	outTexcoord0RegisterIndex = 2; // This is oT0

	parentDevice->LockDeviceCS();
	aliveVertShaders.push_back(this);
	parentDevice->UnlockDeviceCS();

	DebuggableD3DVERTEXELEMENT9* const passthroughElementsCopy = (DebuggableD3DVERTEXELEMENT9* const)malloc(sizeof(DebuggableD3DVERTEXELEMENT9) * numElements);
	memcpy(passthroughElementsCopy, pElements, sizeof(DebuggableD3DVERTEXELEMENT9) * numElements);
	passthroughVSElements = passthroughElementsCopy;
	passthroughVSElementsCount = numElements;

	// Our pretransformed vertex shader is hardcoded to use the c0 and c1 constant registers:
	vertexShaderInfo.usedConstantsF.push_back(0);
	vertexShaderInfo.usedConstantsF.push_back(1);

#ifdef _DEBUG
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(debugObjectName, "PretransformedPassthroughVS_0x%08X", GetVertexElementsHash(pElements, numElements) );
#pragma warning(pop)
#endif
}

/*virtual*/ IDirect3DVertexShader9Hook::~IDirect3DVertexShader9Hook()
{
	parentDevice->LockDeviceCS();
	const unsigned numAliveShaders = aliveVertShaders.size();
	bool foundAndErased = false;
	for (unsigned x = 0; x < numAliveShaders; ++x)
	{
		if (aliveVertShaders[x] == this)
		{
			aliveVertShaders.erase(aliveVertShaders.begin() + x);
			foundAndErased = true;
			break;
		}
	}
#ifdef _DEBUG
	if (!foundAndErased)
	{
		__debugbreak(); // Should never be here!
	}
#endif
	parentDevice->UnlockDeviceCS();

	free( (void* const)deviceCompiledVertexShaderBytecode);
	deviceCompiledVertexShaderBytecode = NULL;

	free( (void* const)passthroughVSElements);
	passthroughVSElements = NULL;
	passthroughVSElementsCount = 0;

	if (deviceCompiledVertexShaderBytes != NULL)
	{
		GPUFree( (gpuvoid* const)deviceCompiledVertexShaderBytes);
	}

	shaderBytecode.clear();
#ifdef WIPE_ON_DESTRUCT_D3DHOOKOBJECT
	memset(this, 0x00000000, sizeof(*this) - (sizeof(shaderBytecode) + sizeof(vertexShaderInfo) ) );
#endif
}

/*** IUnknown methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DVertexShader9Hook::QueryInterface(THIS_ REFIID riid, void** ppvObj)
{
	HRESULT ret = realObject->QueryInterface(riid, ppvObj);
	if (ret == NOERROR)
	{
		*ppvObj = this;
		AddRef();
	}
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DVertexShader9Hook::AddRef(THIS)
{
	ULONG ret = realObject->AddRef();
	++refCount;
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DVertexShader9Hook::Release(THIS)
{
	ULONG ret = realObject->Release();
	if (--refCount == 0)
	{
#ifdef DEBUGPRINT_D3DHOOKOBJECT_FULLRELEASES
		char printBuffer[128] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(printBuffer, "Fully releasing hooked Vertex Shader %p\n", this);
#pragma warning(pop)
		OutputDebugStringA(printBuffer);
#endif
		delete this;
	}
	return ret;
}

/*** IDirect3DVertexShader9 methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DVertexShader9Hook::GetDevice(THIS_ IDirect3DDevice9** ppDevice)
{
	LPDIRECT3DDEVICE9 realD3D9dev = NULL;
	HRESULT ret = realObject->GetDevice(&realD3D9dev);
	if (FAILED(ret) )
	{
		*ppDevice = NULL;
		return ret;
	}

	// Check that the parentHook's underlying IDirect3DDevice9* matches the realD3D9dev pointer
	if (parentDevice->GetUnderlyingDevice() != realD3D9dev)
	{
		DbgBreakPrint("Error: Unknown d3d9 device hook detected!");
	}
	parentDevice->AddRef(); // Super important to increment the ref-count here, otherwise our parent object will get destroyed when Release() is called on it!

	*ppDevice = parentDevice;
	return ret;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DVertexShader9Hook::GetFunction(THIS_ void* pData,UINT* pSizeOfData)
{
	HRESULT ret = realObject->GetFunction(pData, pSizeOfData);
	return ret;
}

void IDirect3DVertexShader9Hook::UploadShaderBytecodeToDevice(gpuvoid* const gpuUploadShaderAddress)
{
	if (!gpuUploadShaderAddress)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}

	if (!deviceCompiledVertexShaderBytecode)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return;
	}

	IBaseDeviceComms* const deviceComms = IBaseDeviceComms::GetGlobalDeviceComms();
	deviceComms->DeviceMemCopy(gpuUploadShaderAddress, &(deviceCompiledVertexShaderBytecode->shaderHeader), deviceCompiledVertexShaderBytecode->deviceShaderInfo.deviceInstructionTokenCount * sizeof(instructionSlot) + sizeof(DeviceShaderHeader) );
}

void IDirect3DVertexShader9Hook::JitLoadShader(const DWORD FVF /*= 0x00000000*/)
{
	DeviceBytecode* compiledVertexShaderBytecode = NULL;

	if (isPretransformPassthroughVS == false)
	{
		const char* const jitName = ConstructShaderJITName(vertexShaderInfo);

		triedJit = true;

#ifndef FORCE_INTERPRETED_VERTEX_SHADER
		char jitFilenameBuffer[MAX_PATH] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(jitFilenameBuffer, "%s\\%s.dll", shaderJITTempDirectory, jitName);
#pragma warning(pop)
		HMODULE hm = LoadLibraryA(jitFilenameBuffer);

		static const char* const shaderMainExportName = "@VertexShaderMain@4";
		static const char* const shaderMainExportName4 = "@VertexShaderMain4@4";

		if (hm)
		{
			jitShaderMain = (VSEntry)GetProcAddress(hm, shaderMainExportName);
			jitShaderMain4 = (VSEntry)GetProcAddress(hm, shaderMainExportName4);
			if (!jitShaderMain)
			{
				DbgBreakPrint("Error: Cannot find VertexShaderMain in existing JIT DLL");
			} 
			else if (!jitShaderMain4)
			{
				DbgPrint("Warning: Cannot find VertexShaderMain4 in existing JIT DLL");
			}
		}
		else
		{
			if (!JITNewShader(vertexShaderInfo, jitName) )
			{
				DbgBreakPrint("Error: Failed to JIT Vertex Shader");
			}
			else
			{
				HMODULE hm2 = LoadLibraryA(jitFilenameBuffer);
				if (!hm2)
				{
					DbgBreakPrint("Error: Failed to load recently JIT'd Vertex Shader");
				}
				else
				{
					jitShaderMain = (VSEntry)GetProcAddress(hm2, shaderMainExportName);
					jitShaderMain4 = (VSEntry)GetProcAddress(hm2, shaderMainExportName4);
					if (!jitShaderMain)
					{
						DbgBreakPrint("Error: Cannot find VertexShaderMain in newly created JIT DLL");
					} 
					else if (!jitShaderMain4)
					{
						DbgPrint("Warning: Cannot find VertexShaderMain4 in newly created JIT DLL");
					}
				}
			}
		}
#endif // #ifndef FORCE_INTERPRETED_VERTEX_SHADER

		ShaderCompileOptions compileFlags = (ShaderCompileOptions)(SCOption_VS_AppendViewportTransform | SCOption_VS_AppendDivideByW | SCOption_VS_OutputCompressionEnable);
#ifdef _DEBUG
		compileFlags = (ShaderCompileOptions)(compileFlags | SCOption_OutputEverything);
#else
		compileFlags = (ShaderCompileOptions)(compileFlags | SCOption_Optimize_D3DOptimizations | SCOption_Optimize_DeviceOptimizations | SCOption_OutputEverything);
#endif

		if (CompileShaderInfoToDeviceBytecode(&GetShaderInfo(), compileFlags, &compiledVertexShaderBytecode, jitName) != ShaderCompile_OK)
		{
#ifdef _DEBUG
			__debugbreak(); // Shader compilation to device bytecode failed!
#endif
			return;
		}
	}
	else
	{
		ShaderCompileOptions compileFlags = (ShaderCompileOptions)(SCOption_VS_GeneratePassthroughShader);
#ifdef _DEBUG
		compileFlags = (ShaderCompileOptions)(compileFlags | SCOption_OutputEverything);
#else
		compileFlags = (ShaderCompileOptions)(compileFlags | SCOption_Optimize_D3DOptimizations | SCOption_Optimize_DeviceOptimizations | SCOption_OutputEverything);
#endif
		char shaderNameBuffer[64] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(shaderNameBuffer, "PretransformedPassthroughVS_0x%08X", GetVertexElementsHash(passthroughVSElements, passthroughVSElementsCount) );
#pragma warning(pop)

		if (GenerateShaderForPretransformedVertices(reinterpret_cast<const D3DVERTEXELEMENT9* const>(passthroughVSElements), passthroughVSElementsCount - 1, compileFlags, &compiledVertexShaderBytecode, shaderNameBuffer) != ShaderCompile_OK)
		{
#ifdef _DEBUG
			__debugbreak(); // Shader generation failed!
#endif
			return;
		}
	}

	deviceCompiledVertexShaderBytecode = compiledVertexShaderBytecode;

	gpuvoid* allocVertexShaderBytes = GPUAlloc(deviceCompiledVertexShaderBytecode->deviceShaderInfo.deviceInstructionTokenCount * sizeof(instructionSlot) + sizeof(DeviceShaderHeader), 
		deviceCompiledVertexShaderBytecode->deviceShaderInfo.deviceInstructionTokenCount, 0, 0, 0, GPUVAT_ShaderInstructionsMemory, GPUFMT_VertexShaderInstructions
#ifdef _DEBUG
		, debugObjectName
#endif
	);

	if (!allocVertexShaderBytes)
	{
#ifdef _DEBUG
		__debugbreak(); // Uh oh, we failed our GPU allocation!
#endif
		return;
	}

	// Copy our newly compiled device-specific shader instruction bytecode over to the GPU for later loading and execution:
	UploadShaderBytecodeToDevice(allocVertexShaderBytes);

	deviceCompiledVertexShaderBytes = allocVertexShaderBytes;
}
