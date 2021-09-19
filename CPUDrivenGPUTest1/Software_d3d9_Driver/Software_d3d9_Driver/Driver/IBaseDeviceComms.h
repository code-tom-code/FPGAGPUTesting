#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h> // for HRESULT and BYTE
#include "GPUAllocator.h"

#ifdef _DEBUG
	#define PRINT_COMMS 1
#endif

__declspec(align(16) ) struct __declspec(novtable) IBaseDeviceComms
{
	IBaseDeviceComms() // Do not call this directly!
	{
	}

	virtual ~IBaseDeviceComms()
	{
	}

	virtual __declspec(nothrow) HRESULT __stdcall SendLoop(const BYTE* const sendBuffer, const unsigned len) = 0;
	virtual __declspec(nothrow) HRESULT __stdcall RecvLoop(BYTE* const recvBuffer, const unsigned len) = 0;

	// Sets device memory from deviceDestAddr to deviceDestAddr + dwByteLength with the DWORD value specified in dwSetVal.
	__declspec(nothrow) HRESULT __stdcall DeviceMemSet(gpuvoid* const deviceDestAddr, const DWORD dwSetVal, const DWORD dwByteLength);

	// Copies a block of memory from host memory to device memory.
	__declspec(nothrow) HRESULT __stdcall DeviceMemCopy(gpuvoid* const deviceDestAddr, const void* const sourceCPUAddr, const DWORD dwByteLength);

	// Copies a block of memory from device memory to host memory.
	__declspec(nothrow) HRESULT __stdcall ReadFromDevice(const gpuvoid* const deviceSrcAddr, void* const destCPUAddr, const DWORD dwByteLength);

	// Validates that the block of memory on the device matches the data in the block of memory on the CPU.
	// Returns S_OK if the memory is equal between the CPU and the GPU pointers or E_FAIL otherwise. It is the caller's responsibility to ensure that the GPU is not writing to this region
	// as we are reading from it.
	__declspec(nothrow) HRESULT __stdcall DeviceValidateMemory(const gpuvoid* const deviceSrcAddr, const void* const compareCPUAddr, const DWORD dwByteLength);

	static IBaseDeviceComms* const GetGlobalDeviceComms()
	{
		return globalDeviceComms;
	}

protected:
	static void SetGlobalDeviceComms(IBaseDeviceComms* const newGlobalDeviceComms)
	{
		globalDeviceComms = newGlobalDeviceComms;
	}

private:
	static IBaseDeviceComms* globalDeviceComms;
};
