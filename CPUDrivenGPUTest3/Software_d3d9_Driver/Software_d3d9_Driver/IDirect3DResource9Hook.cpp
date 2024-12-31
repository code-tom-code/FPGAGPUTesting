#pragma once

#include "IDirect3DResource9Hook.h"

/*** IUnknown methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DResourceHook9::QueryInterface(THIS_ REFIID riid, void** ppvObj)
{
	const HRESULT ret = realObject->QueryInterface(riid, ppvObj);
	if (ret == NOERROR)
	{
		*ppvObj = this;
		AddRef();
	}
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DResourceHook9::AddRef(THIS)
{
	const ULONG ret = realObject->AddRef();
	++refCount;
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DResourceHook9::Release(THIS)
{
	const ULONG ret = realObject->Release();
	if (--refCount == 0)
	{
#ifdef DEBUGPRINT_D3DHOOKOBJECT_FULLRELEASES
		char printBuffer[128] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(printBuffer, "Fully releasing hooked Base Resource %p\n", this);
#pragma warning(pop)
		OutputDebugStringA(printBuffer);
#endif
		delete this;
	}
	return ret;
}

/*** IDirect3DResource9 methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DResourceHook9::GetDevice(THIS_ IDirect3DDevice9** ppDevice)
{
	LPDIRECT3DDEVICE9 realD3D9dev = NULL;
	const HRESULT ret = realObject->GetDevice(&realD3D9dev);
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

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DResourceHook9::SetPrivateData(THIS_ REFGUID refguid,CONST void* pData,DWORD SizeOfData,DWORD Flags)
{
	const HRESULT ret = realObject->SetPrivateData(refguid, pData, SizeOfData, Flags);
	return ret;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DResourceHook9::GetPrivateData(THIS_ REFGUID refguid,void* pData,DWORD* pSizeOfData)
{
	const HRESULT ret = realObject->GetPrivateData(refguid, pData, pSizeOfData);
	return ret;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DResourceHook9::FreePrivateData(THIS_ REFGUID refguid)
{
	const HRESULT ret = realObject->FreePrivateData(refguid);
	return ret;
}

COM_DECLSPEC_NOTHROW DWORD STDMETHODCALLTYPE IDirect3DResourceHook9::SetPriority(THIS_ DWORD PriorityNew)
{
	const DWORD ret = realObject->SetPriority(PriorityNew);
	return ret;
}

COM_DECLSPEC_NOTHROW DWORD STDMETHODCALLTYPE IDirect3DResourceHook9::GetPriority(THIS)
{
	const DWORD ret = realObject->GetPriority();
	return ret;
}

COM_DECLSPEC_NOTHROW void STDMETHODCALLTYPE IDirect3DResourceHook9::PreLoad(THIS)
{
	realObject->PreLoad();
}

COM_DECLSPEC_NOTHROW D3DRESOURCETYPE STDMETHODCALLTYPE IDirect3DResourceHook9::GetType(THIS)
{
	const D3DRESOURCETYPE ret = realObject->GetType();
	return ret;
}

BYTE* const PageAllocWithNoAccessPage(const unsigned lenBytes)
{
	BYTE* voidBytes = NULL;
	BYTE* const pageAddress = (BYTE* const)VirtualAlloc(NULL, lenBytes + 4096, MEM_RESERVE, PAGE_NOACCESS);
	if (pageAddress)
	{
		if (!VirtualAlloc(pageAddress, lenBytes, MEM_COMMIT, PAGE_READWRITE) )
		{
			__debugbreak(); // Can't alloc our new surface
			VirtualFree(pageAddress, 0, MEM_RELEASE);
		}

		if (lenBytes % 4096 == 0)
			voidBytes = pageAddress;
		else
			voidBytes = pageAddress + (4096 - (lenBytes % 4096) );

		return voidBytes;
	}
	if (!voidBytes)
	{
		__debugbreak(); // Can't alloc our new surface!
	}

	return NULL;
}
