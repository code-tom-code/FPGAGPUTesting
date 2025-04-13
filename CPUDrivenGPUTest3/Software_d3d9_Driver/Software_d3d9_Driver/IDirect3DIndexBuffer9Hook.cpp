#pragma once

#include "IDirect3DIndexBuffer9Hook.h"
#include "GlobalToggles.h"
#include "Driver/IBaseDeviceComms.h"

unsigned IDirect3DIndexBuffer9Hook::IndexBuffersCreatedCounter = 0;

#ifdef _DEBUG
void PrintDebugIndexBufferName(char* const outString, UINT _Length, D3DFORMAT _Format, const unsigned IndexBufferCounter)
{
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(outString, "IndexBuffer%u (I%u, %u indices, %u bytes)", IndexBufferCounter, _Format == D3DFMT_INDEX16 ? 16 : 32, _Length / (_Format == D3DFMT_INDEX16 ? sizeof(uint16_t) : sizeof(uint32_t) ), _Length);
#pragma warning(pop)
}
#endif

void IDirect3DIndexBuffer9Hook::CreateIndexBuffer(UINT _Length, const DebuggableUsage _Usage, D3DFORMAT _Format, D3DPOOL _Pool)
{
	InternalLength = _Length;
	InternalUsage = _Usage;
	InternalFormat = _Format;
	InternalPool = _Pool;

	const unsigned magicDWORDBytes =
#ifdef INDEX_BUFFER_MAGIC_COOKIE
		sizeof(DWORD);
#else
		0;
#endif

#ifdef INDEX_BUFFER_ALLOC_PAGE_NOACCESS
	rawBytes.voidBytes = PageAllocWithNoAccessPage(InternalLength + magicDWORDBytes);
#else
	rawBytes.voidBytes = malloc(InternalLength + magicDWORDBytes);
#endif

#ifdef _DEBUG
	PrintDebugIndexBufferName(debugObjectName, _Length, _Format, IndexBuffersCreatedCounter);
#endif

	GPUBytes = GPUAlloc(InternalLength % sizeof(DWORD) != 0 ? InternalLength + sizeof(unsigned short) : InternalLength, 
		InternalLength, 1, 1, 1, GPUVAT_IndexData, ConvertD3DFormatToDeviceFormat(InternalFormat)
#ifdef _DEBUG
		, debugObjectName
#endif
	);

#ifdef INDEX_BUFFER_MAGIC_COOKIE
	*(DWORD* const)&rawBytes.u8Bytes[InternalLength] = 'INDX';
#endif

	++IndexBuffersCreatedCounter;
}

/*** IUnknown methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::QueryInterface(THIS_ REFIID riid, void** ppvObj)
{
	if (realObject)
	{
		const HRESULT ret = realObject->QueryInterface(riid, ppvObj);
		if (ret == NOERROR)
		{
			*ppvObj = this;
			AddRef();
		}
		return ret;
	}
	// TODO: Implement this properly
	return S_OK;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::AddRef(THIS)
{
	const ULONG ret = realObject ? realObject->AddRef() : (const ULONG)(refCount + 1);
	++refCount;
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::Release(THIS)
{
	const ULONG ret = realObject ? realObject->Release() : (const ULONG)(refCount - 1);
	if (--refCount == 0)
	{
#ifdef DEBUGPRINT_D3DHOOKOBJECT_FULLRELEASES
		char printBuffer[128] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(printBuffer, "Fully releasing hooked Index Buffer %p\n", this);
#pragma warning(pop)
		OutputDebugStringA(printBuffer);
#endif
		GPUFree(GPUBytes);
		delete this;
	}
	return ret;
}

/*** IDirect3DResource9 methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::GetDevice(THIS_ IDirect3DDevice9** ppDevice)
{
	if (!ppDevice)
		return D3DERR_INVALIDCALL;

	if (realObject)
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
	else
	{
		*ppDevice = parentDevice;
		return S_OK;
	}
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::SetPrivateData(THIS_ REFGUID refguid,CONST void* pData,DWORD SizeOfData,DWORD Flags)
{
	if (realObject)
	{
		const HRESULT ret = realObject->SetPrivateData(refguid, pData, SizeOfData, Flags);
		return ret;
	}
	return S_OK;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::GetPrivateData(THIS_ REFGUID refguid,void* pData,DWORD* pSizeOfData)
{
	if (realObject)
	{
		const HRESULT ret = realObject->GetPrivateData(refguid, pData, pSizeOfData);
		return ret;
	}
	return S_OK;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::FreePrivateData(THIS_ REFGUID refguid)
{
	if (realObject)
	{
		const HRESULT ret = realObject->FreePrivateData(refguid);
		return ret;
	}
	return S_OK;
}

COM_DECLSPEC_NOTHROW DWORD STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::SetPriority(THIS_ DWORD PriorityNew)
{
	if (realObject)
	{
		const DWORD ret = realObject->SetPriority(PriorityNew);
		return ret;
	}
	return S_OK;
}

COM_DECLSPEC_NOTHROW DWORD STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::GetPriority(THIS)
{
	if (realObject)
	{
		const DWORD ret = realObject->GetPriority();
		return ret;
	}
	return 0;
}

COM_DECLSPEC_NOTHROW void STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::PreLoad(THIS)
{
	if (realObject)
		realObject->PreLoad();
}

COM_DECLSPEC_NOTHROW D3DRESOURCETYPE STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::GetType(THIS)
{
	if (realObject)
	{
		const D3DRESOURCETYPE ret = realObject->GetType();
#ifdef _DEBUG
		if (ret != D3DRTYPE_INDEXBUFFER)
		{
			__debugbreak(); // Uhhhhh, what's going on?
		}
#endif
		return ret;
	}
	return D3DRTYPE_INDEXBUFFER;
}

#ifdef INDEX_BUFFER_MAGIC_COOKIE
static inline void ValidateMagicCookie(const std::vector<unsigned short>& shorts, const std::vector<unsigned long>& longs, const unsigned length, const D3DFORMAT InternalFormat)
{
	switch (InternalFormat)
	{
	case D3DFMT_INDEX16:
		if (*(const DWORD* const)&shorts[length / sizeof(unsigned short)] != 'INDX')
		{
			__debugbreak();
		}
		break;
	default:
#ifdef _DEBUG
		__debugbreak();
#else
		__assume(0);
#endif
	case D3DFMT_INDEX32:
		if (longs[length / sizeof(unsigned long)] != 'INDX')
		{
			__debugbreak();
		}
		break;
	}
}
#endif // INDEX_BUFFER_MAGIC_COOKIE

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::Lock(THIS_ UINT OffsetToLock,UINT SizeToLock,void** ppbData,DWORD Flags)
{
	if (!ppbData)
		return D3DERR_INVALIDCALL;

	const DWORD validLockFlags = D3DLOCK_DISCARD | D3DLOCK_NO_DIRTY_UPDATE | D3DLOCK_NOSYSLOCK | D3DLOCK_READONLY | D3DLOCK_NOOVERWRITE; 
	if (Flags & (~validLockFlags) )
		return D3DERR_INVALIDCALL; // These are the only D3DLOCK flags valid for this function call

	if (SizeToLock == 0 && OffsetToLock > 0)
		return D3DERR_INVALIDCALL;

	if (OffsetToLock + SizeToLock > InternalLength)
		return D3DERR_INVALIDCALL;

	if (Flags & (D3DLOCK_DISCARD | D3DLOCK_NOOVERWRITE) )
	{
		// D3D9 in Release mode ignores this error without returning a failure code
		if (!(InternalUsage & D3DUSAGE_DYNAMIC) )
			return D3DERR_INVALIDCALL;
	}

#ifdef INDEX_BUFFER_MAGIC_COOKIE
	ValidateMagicCookie(shortBytes, longBytes, InternalLength, InternalFormat);
#endif

#ifdef _DEBUG
	if (realObject)
	{
		void* tempLockPtr = NULL;
		HRESULT ret = realObject->Lock(OffsetToLock, SizeToLock, &tempLockPtr, Flags);
		if (FAILED(ret) )
		{
			__debugbreak(); // There was an error that we should have caught
			return ret;
		}
	}
#endif

#ifdef INDEX_BUFFER_ENFORCE_READONLY_WHILE_UNLOCKED
	if (IsUnlocked() )
	{
		BYTE* const pageStartAddr = (BYTE* const)(rawBytes.pointerNumber - (rawBytes.pointerNumber % 4096) );
		VirtualAlloc(pageStartAddr, InternalLength, MEM_COMMIT, PAGE_READWRITE);
	}
#endif

#ifdef INDEX_BUFFER_ENFORCE_DISCARD_ON_LOCK
	if ( (InternalUsage & D3DUSAGE_DYNAMIC) && (Flags & D3DLOCK_DISCARD) )
	{
		memset(rawBytes.u8Bytes, 0, InternalLength);
	}
#endif

	if (ppbData)
	{
		*ppbData = rawBytes.u8Bytes + OffsetToLock;
	}

	if (IsUnlocked() )
	{
		lockFlags = Flags;
	}

	++lockCount;

	return S_OK;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::Unlock(THIS)
{
#ifdef _DEBUG
	if (realObject)
	{
		HRESULT ret = realObject->Unlock();
		if (FAILED(ret) )
		{
			__debugbreak(); // There was an error and we should've caught it
			return ret;
		}
	}
#endif

#ifdef INDEX_BUFFER_MAGIC_COOKIE
	ValidateMagicCookie(shortBytes, longBytes, InternalLength, InternalFormat);
#endif

	--lockCount;

#ifdef INDEX_BUFFER_ENFORCE_READONLY_WHILE_UNLOCKED
	if (IsUnlocked() )
	{
		BYTE* const pageStartAddr = (BYTE* const)(rawBytes.pointerNumber - (rawBytes.pointerNumber % 4096) );
		VirtualAlloc(pageStartAddr, InternalLength, MEM_COMMIT, PAGE_READONLY);
	}
#endif

	if (IsUnlocked() )
	{
		if ( (lockFlags & (D3DLOCK_READONLY | D3DLOCK_NO_DIRTY_UPDATE) ) == 0)
		{
			GPUBytesDirty = true;
		}

#ifdef _DEBUG
		lockFlags = 0x00000000;
#endif
	}

	return S_OK;
}

void IDirect3DIndexBuffer9Hook::SoftUPReallocIfNecessary(const UINT newBufferLengthBytes, const UINT numIndices, const D3DFORMAT newFormat)
{
	const unsigned allocLengthBytes = newBufferLengthBytes % sizeof(DWORD) != 0 ? newBufferLengthBytes + sizeof(unsigned short) : newBufferLengthBytes;
	if (allocLengthBytes > InternalLength)
	{
		GPUFree(GPUBytes);
		GPUBytes = GPUAlloc(allocLengthBytes, numIndices, 1, 1, 1, GPUVAT_IndexData, ConvertD3DFormatToDeviceFormat(newFormat)
#ifdef _DEBUG
		, debugObjectName
#endif
		);
		InternalLength = newBufferLengthBytes;
	}
}

void IDirect3DIndexBuffer9Hook::UpdateDataToGPU()
{
	// TODO: Save upload bandwidth by tracking dirty regions and only reuploading the dirty regions of our buffers
	if (GPUBytesDirty)
	{
		// Copy our newly locked data off from the CPU to the GPU:
		parentDevice->GetBaseDevice()->DeviceMemCopy(GetGPUBytes(), rawBytes.shortBytes, 
			InternalLength % sizeof(DWORD) != 0 ? InternalLength + sizeof(unsigned short) : InternalLength); // We might need to pad the copy size out to an even multiple of sizeof(DWORD). This is fine.
		GPUBytesDirty = false;
	}
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DIndexBuffer9Hook::GetDesc(THIS_ D3DINDEXBUFFER_DESC *pDesc)
{
	if (!pDesc)
		return D3DERR_INVALIDCALL;

#ifdef _DEBUG
	if (realObject)
	{
		HRESULT ret = realObject->GetDesc(pDesc);
		if (FAILED(ret) )
		{
			__debugbreak(); // There was an error that we should have caught
			return ret;
		}

		if (pDesc->Size != InternalLength)
		{
			__debugbreak();
		}
		if (pDesc->Usage != InternalUsage)
		{
			__debugbreak();
		}
		if (pDesc->Format != InternalFormat)
		{
			__debugbreak();
		}
		if (pDesc->Pool != InternalPool)
		{
			__debugbreak();
		}
		if (pDesc->Type != D3DRTYPE_INDEXBUFFER)
		{
			__debugbreak();
		}
	}
#endif

	pDesc->Size = InternalLength;
	pDesc->Usage = InternalUsage;
	pDesc->Format = InternalFormat;
	pDesc->Pool = InternalPool;
	pDesc->Type = D3DRTYPE_INDEXBUFFER;

	return S_OK;
}
