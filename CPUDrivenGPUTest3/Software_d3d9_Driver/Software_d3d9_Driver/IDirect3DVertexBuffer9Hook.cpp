#pragma once

#include "IDirect3DVertexBuffer9Hook.h"
#include "IDirect3DResource9Hook.h"
#include "GlobalToggles.h"
#include "Driver/IBaseDeviceComms.h"
#include "Driver/DriverOptions.h"
#include "IDirect3DVertexDeclaration9Hook.h"

unsigned IDirect3DVertexBuffer9Hook::VertexBuffersCreatedCounter = 0;

#ifdef _DEBUG
void PrintDebugVertexBufferName(char* const outString, UINT _Length, const DebuggableUsage _Usage, DWORD _FVF, D3DPOOL _Pool, const unsigned VertexBufferCount)
{
#pragma warning(push)
#pragma warning(disable:4996)
	sprintf(outString, "VertexBuffer%u (Len: %u, Usg:%u, FVF:0x%08X, Pool:%u)", VertexBufferCount, _Length, _Usage, _FVF, _Pool);
#pragma warning(pop)
}
#endif // #ifdef _DEBUG

static const unsigned GetDirtyDWORDsCountFromBufferLength(const unsigned bufferLengthBytes)
{
	static const unsigned bitsPerDWORD = sizeof(DWORD) * 8;
	const unsigned dirtyBitsCount = (bufferLengthBytes + (GPU_DRAM_TRANSACTION_SIZE_BYTES - 1) ) / GPU_DRAM_TRANSACTION_SIZE_BYTES;
	const unsigned dirtyDWORDsCount = (dirtyBitsCount + (bitsPerDWORD - 1) ) / bitsPerDWORD;
	return dirtyDWORDsCount;
}

void IDirect3DVertexBuffer9Hook::CreateVertexBuffer(UINT _Length, const DebuggableUsage _Usage, const debuggableFVF _FVF, D3DPOOL _Pool)
{
	InternalLength = _Length;
	InternalUsage = _Usage;
	InternalFVF = _FVF;
	InternalPool = _Pool;

#ifdef _DEBUG
	if (_Length % sizeof(DWORD) != 0)
	{
		__debugbreak();
	}
#endif

	const unsigned magicDWORDLen =
#ifdef VERTEX_BUFFER_MAGIC_COOKIE
		sizeof(DWORD);
#else
		0;
#endif

#ifdef VERTEX_BUFFER_ALLOC_PAGE_NOACCESS
	data = PageAllocWithNoAccessPage(InternalLength + magicDWORDLen);
#else
	data = (BYTE* const)malloc(InternalLength + magicDWORDLen);
#endif
	if (!data)
	{
		__debugbreak(); // Can't alloc our vertex buffer!
	}

	const unsigned dirtyDWORDsCount = GetDirtyDWORDsCountFromBufferLength(InternalLength);
	GPUBytesDirtyBits = (unsigned* const)calloc(dirtyDWORDsCount, sizeof(unsigned) );

#ifdef VERTEX_BUFFER_MAGIC_COOKIE
	*(DWORD* const)&data[InternalLength] = 'VRTX';
#endif

#ifdef _DEBUG
	PrintDebugVertexBufferName(debugObjectName, _Length, _Usage, _FVF, _Pool, VertexBuffersCreatedCounter);
#endif

	GPUBytes = GPUAlloc(_Length, InternalLength, 1, 1, 1, GPUVAT_VertexStreamData, GPUFMT_VertexGeneral, this
#ifdef _DEBUG
		, debugObjectName
#endif
	);

	++VertexBuffersCreatedCounter;
}

#ifdef VERTEX_BUFFER_MAGIC_COOKIE
static inline void ValidateMagicCookie(const std::vector<unsigned char>& bytes, const unsigned length)
{
	if (*(const DWORD* const)&bytes[length] != 'VRTX')
	{
		__debugbreak();
	}
}
#endif // VERTEX_BUFFER_MAGIC_COOKIE

/*** IUnknown methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::QueryInterface(THIS_ REFIID riid, void** ppvObj)
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
	// TODO: Fix this
	return S_OK;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::AddRef(THIS)
{
	const ULONG ret = realObject ? realObject->AddRef() : (const ULONG)(refCount + 1);
	++refCount;
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::Release(THIS)
{
	const ULONG ret = realObject ? realObject->Release() : (const ULONG)(refCount - 1);
	if (--refCount == 0)
	{
#ifdef DEBUGPRINT_D3DHOOKOBJECT_FULLRELEASES
		char printBuffer[128] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(printBuffer, "Fully releasing hooked Vertex Buffer %p\n", this);
#pragma warning(pop)
		OutputDebugStringA(printBuffer);
#endif
		GPUFree(GPUBytes);
		GPUBytes = NULL;
		delete this;
	}
	return ret;
}

/*** IDirect3DResource9 methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::GetDevice(THIS_ IDirect3DDevice9** ppDevice)
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

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::SetPrivateData(THIS_ REFGUID refguid,CONST void* pData,DWORD SizeOfData,DWORD Flags)
{
	if (realObject)
	{
		const HRESULT ret = realObject->SetPrivateData(refguid, pData, SizeOfData, Flags);
		return ret;
	}
	return S_OK;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::GetPrivateData(THIS_ REFGUID refguid,void* pData,DWORD* pSizeOfData)
{
	if (realObject)
	{
		const HRESULT ret = realObject->GetPrivateData(refguid, pData, pSizeOfData);
		return ret;
	}
	return S_OK;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::FreePrivateData(THIS_ REFGUID refguid)
{
	if (realObject)
	{
		const HRESULT ret = realObject->FreePrivateData(refguid);
		return ret;
	}
	return S_OK;
}

COM_DECLSPEC_NOTHROW DWORD STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::SetPriority(THIS_ DWORD PriorityNew)
{
	if (realObject)
	{
		const DWORD ret = realObject->SetPriority(PriorityNew);
		return ret;
	}
	return 0;
}

COM_DECLSPEC_NOTHROW DWORD STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::GetPriority(THIS)
{
	if (realObject)
	{
		const DWORD ret = realObject->GetPriority();
		return ret;
	}
	return S_OK;
}

COM_DECLSPEC_NOTHROW void STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::PreLoad(THIS)
{
	if (realObject)
		realObject->PreLoad();
}

COM_DECLSPEC_NOTHROW D3DRESOURCETYPE STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::GetType(THIS)
{
	if (realObject)
	{
		const D3DRESOURCETYPE ret = realObject->GetType();
		if (ret != D3DRTYPE_VERTEXBUFFER)
		{
			__debugbreak(); // Huh?
		}
		return ret;
	}
	return D3DRTYPE_VERTEXBUFFER;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::Lock(THIS_ UINT OffsetToLock,UINT SizeToLock,void** ppbData,DWORD Flags)
{
	if (!IgnoreLockFunctionValidation.Bool() )
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

#ifdef VERTEX_BUFFER_MAGIC_COOKIE
		ValidateMagicCookie(data, InternalLength);
#endif
	}

#ifdef VERTEX_BUFFER_ENFORCE_READONLY_WHILE_UNLOCKED
	if (IsUnlocked() )
	{
		BYTE* const pageStartAddr = (BYTE* const)( ( (SIZE_T)data) - ( (SIZE_T)data % 4096) );
		VirtualAlloc(pageStartAddr, InternalLength, MEM_COMMIT, PAGE_READWRITE);
	}
#endif

	if (EnforceDiscardClearsVertexBuffers.Bool() )
	{
		if ( (InternalUsage & D3DUSAGE_DYNAMIC) && (Flags & D3DLOCK_DISCARD) )
		{
			memset(data, 0, InternalLength);
		}
	}

	if (OffsetToLock == 0 && SizeToLock == 0)
		*ppbData = data;
	else
		*ppbData = data + OffsetToLock;

#ifdef _DEBUG
	if (realObject)
	{
		void* tempLockPtr = NULL;
		HRESULT ret = realObject->Lock(OffsetToLock, SizeToLock, &tempLockPtr, Flags);
		if (FAILED(ret) )
		{
			// There was an error that we should've caught but didn't
			__debugbreak();
			return ret;
		}
	}
#endif

	if (IsUnlocked() )
	{
		lockFlags = Flags;
		lockOffset = OffsetToLock;
		lockSize = SizeToLock;
	}

	++lockCount;

	return S_OK;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::Unlock(THIS)
{
#ifdef _DEBUG
	if (realObject)
	{
		HRESULT ret = realObject->Unlock();
		if (FAILED(ret) )
		{
			__debugbreak(); // There was an error somewhere that we should've caught
			return ret;
		}
	}
#endif

#ifdef VERTEX_BUFFER_MAGIC_COOKIE
	ValidateMagicCookie(data, InternalLength);
#endif

	--lockCount;

#ifdef VERTEX_BUFFER_ENFORCE_READONLY_WHILE_UNLOCKED
	if (IsUnlocked() )
	{
		BYTE* const pageStartAddr = (BYTE* const)( ( (SIZE_T)data) - ( (SIZE_T)data % 4096) );
		VirtualAlloc(pageStartAddr, InternalLength, MEM_COMMIT, PAGE_READONLY);
	}
#endif

	if (IsUnlocked() )
	{
		if ( (lockFlags & (D3DLOCK_READONLY | D3DLOCK_NO_DIRTY_UPDATE) ) == 0)
		{
			if (lockSize == 0)
			{
				MarkDirtyRegion(0, InternalLength);
			}
			else
			{
				MarkDirtyRegion(lockOffset, lockSize);
			}
			GPUBytesAnyDirty = true;
		}

#ifdef _DEBUG
		lockFlags = 0x00000000;
#endif

		RecomputeBufferUniformity();
	}

	return S_OK;
}

void IDirect3DVertexBuffer9Hook::RecomputeBufferUniformity()
{
	// We can only calculate this for FVF vertex buffers, since we don't know what vertex declaration is going to be applied to this buffer otherwise
	if (InternalFVF.rawFVF_DWORD == 0)
		return;

	FVFDataUniformity = 0x0000;

	IDirect3DVertexDeclaration9Hook* const fvfVertexDecl = parentDevice->CreateVertexDeclFromFVFCode(InternalFVF);
	if (!fvfVertexDecl)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: Failed to create vertex declaration!
#endif
		return;
	}

	// Position -> D3DDECLUSAGE_POSITION -> Degenerate triangles
	// Diffuse -> D3DDECLUSAGE_COLOR -> Uniform color, can be replaced with D3DRS_DIFFUSEMATERIALSOURCE = D3DMCS_MATERIAL
	// Specular -> D3DDECLUSAGE_COLOR + 1 -> Uniform color, can be replaced with D3DRS_SPECULARMATERIALSOURCE = D3DMCS_MATERIAL
	// Normal -> D3DDECLUSAGE_NORMAL -> Uniform normal, can likely skip D3DRS_NORMALIZENORMALS
	// PSize -> D3DDECLUSAGE_PSIZE -> Can be replaced with D3DRS_POINTSIZE
	FVFDataUniformity = (1 << D3DDECLUSAGE_POSITION) | (1 << D3DDECLUSAGE_COLOR) | (1 << (D3DDECLUSAGE_COLOR + 1) ) | (1 << D3DDECLUSAGE_NORMAL) | (1 << D3DDECLUSAGE_PSIZE);

	const unsigned vertexSize = fvfVertexDecl->GetVertexSize();
	const unsigned numVertices = InternalLength / vertexSize;
	const BYTE* vertexBufferEndPtr = data + numVertices * vertexSize;

	const DebuggableD3DVERTEXELEMENT9* position0element = fvfVertexDecl->GetVertexElement(D3DDECLUSAGE_POSITION, 0);
	if (!position0element)
		position0element = fvfVertexDecl->GetVertexElement(D3DDECLUSAGE_POSITIONT, 0);
	const DebuggableD3DVERTEXELEMENT9* normalElement = fvfVertexDecl->GetVertexElement(D3DDECLUSAGE_NORMAL, 0);
	const DebuggableD3DVERTEXELEMENT9* psizeElement = fvfVertexDecl->GetVertexElement(D3DDECLUSAGE_PSIZE, 0);
	const DebuggableD3DVERTEXELEMENT9* diffuseElement = fvfVertexDecl->GetVertexElement(D3DDECLUSAGE_COLOR, 0);
	const DebuggableD3DVERTEXELEMENT9* specularElement = fvfVertexDecl->GetVertexElement(D3DDECLUSAGE_COLOR, 1);
	D3DXVECTOR4 position0(0.0f, 0.0f, 0.0f, 1.0f);
	if (position0element)
	{
		if (position0element->Type == D3DDECLTYPE_FLOAT3)
		{
			const D3DXVECTOR3* const position0xyz = (const D3DXVECTOR3* const)(data + position0element->Offset);
			position0.x = position0xyz->x;
			position0.y = position0xyz->y;
			position0.z = position0xyz->z;
		}
		else if (position0element->Type == D3DDECLTYPE_FLOAT4)
		{
			position0 = *(const D3DXVECTOR4* const)(data + position0element->Offset);
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // Should never be here!
#endif
		}
	}
	const D3DXVECTOR3* normal0 = NULL;
	if (normalElement)
		normal0 = (const D3DXVECTOR3* const)(data + normalElement->Offset);
	const float* psize0 = NULL;
	if (psizeElement)
		psize0 = (const float* const)(data + psizeElement->Offset);
	const D3DCOLOR* diffuse0 = NULL;
	if (diffuseElement)
		diffuse0 = (const D3DCOLOR* const)(data + diffuseElement->Offset);
	const D3DCOLOR* specular0 = NULL;
	if (specularElement)
		specular0 = (const D3DCOLOR* const)(data + specularElement->Offset);

	for (const BYTE* currentVertexPtr = data + vertexSize; currentVertexPtr < vertexBufferEndPtr; currentVertexPtr += vertexSize)
	{
		if (position0element && (FVFDataUniformity & (1 << D3DDECLUSAGE_POSITION) ) )
		{
			D3DXVECTOR4 currentPos(0.0f, 0.0f, 0.0f, 1.0f);
			if (position0element->Type == D3DDECLTYPE_FLOAT3)
			{
				const D3DXVECTOR3* const currentPosxyz = (const D3DXVECTOR3* const)(currentVertexPtr + position0element->Offset);
				currentPos.x = currentPosxyz->x;
				currentPos.y = currentPosxyz->y;
				currentPos.z = currentPosxyz->z;
			}
			else if (position0element->Type == D3DDECLTYPE_FLOAT4)
			{
				currentPos = *(const D3DXVECTOR4* const)(currentVertexPtr + position0element->Offset);
			}
			else
			{
	#ifdef _DEBUG
				__debugbreak(); // Should never be here!
	#endif
			}
			if (currentPos != position0)
				FVFDataUniformity &= ~(1 << D3DDECLUSAGE_POSITION);
		}
		if (normal0 && (FVFDataUniformity & (1 << D3DDECLUSAGE_NORMAL) ) )
		{
			const D3DXVECTOR3* const currentNormal = (const D3DXVECTOR3* const)(currentVertexPtr + normalElement->Offset);
			if (*currentNormal != *normal0)
				FVFDataUniformity &= ~(1 << D3DDECLUSAGE_NORMAL);
		}
		if (psize0 && (FVFDataUniformity & (1 << D3DDECLUSAGE_PSIZE) ) )
		{
			const float* const currentPSize = (const float* const)(currentVertexPtr + psizeElement->Offset);
			if (*currentPSize != *psize0)
				FVFDataUniformity &= ~(1 << D3DDECLUSAGE_PSIZE);
		}
		if (diffuse0 && (FVFDataUniformity & (1 << D3DDECLUSAGE_COLOR) ) )
		{
			const D3DCOLOR* const currentDiffuse = (const D3DCOLOR* const)(currentVertexPtr + diffuseElement->Offset);
			if (*currentDiffuse != *diffuse0)
				FVFDataUniformity &= ~(1 << D3DDECLUSAGE_COLOR);
		}
		if (specular0 && (FVFDataUniformity & (1 << (D3DDECLUSAGE_COLOR + 1) ) ) )
		{
			const D3DCOLOR* const currentSpecular = (const D3DCOLOR* const)(currentVertexPtr + specularElement->Offset);
			if (*currentSpecular != *specular0)
				FVFDataUniformity &= ~(1 << (D3DDECLUSAGE_COLOR + 1) );
		}
	}

	if (FVFDataUniformity & (1 << D3DDECLUSAGE_COLOR) )
	{
		if (diffuse0)
			UniformDiffuseColor = *diffuse0;
		else
			UniformDiffuseColor = 0xFFFFFFFF;
	}
	if (FVFDataUniformity & (1 << (D3DDECLUSAGE_COLOR + 1) ) )
	{
		if (specular0)
			UniformSpecularColor = *specular0;
		else
			UniformSpecularColor = 0xFFFFFFFF;
	}
}

void IDirect3DVertexBuffer9Hook::SoftUPReallocIfNecessary(const UINT newBufferLengthBytes, const UINT numVertices)
{
	const unsigned oldDirtyDWORDsCount = GetDirtyDWORDsCountFromBufferLength(InternalLength);
	const unsigned newDirtyDWORDsCount = GetDirtyDWORDsCountFromBufferLength(newBufferLengthBytes);
	if (newBufferLengthBytes > InternalLength)
	{
		GPUFree(GPUBytes);
		GPUBytes = NULL;
		GPUBytes = GPUAlloc(newBufferLengthBytes, numVertices, 1, 1, 1, GPUVAT_VertexStreamData, GPUFMT_VertexGeneral, this
#ifdef _DEBUG
		, debugObjectName
#endif
		);
		InternalLength = newBufferLengthBytes;
	}
	if (newDirtyDWORDsCount > oldDirtyDWORDsCount)
	{
		free(GPUBytesDirtyBits);
		const unsigned dirtyDWORDsCount = GetDirtyDWORDsCountFromBufferLength(InternalLength);
		GPUBytesDirtyBits = (unsigned* const)calloc(dirtyDWORDsCount, sizeof(unsigned) );
	}
}

void IDirect3DVertexBuffer9Hook::UpdateDataToGPU()
{
	// TODO: Save upload bandwidth by tracking dirty regions and only reuploading the dirty regions of our buffers
	if (GPUBytesAnyDirty)
	{
		// Copy our newly locked data off from the CPU to the GPU:
		parentDevice->GetBaseDevice()->DeviceMemCopy(GetGPUBytes(), data, InternalLength);
		lastFrameIDUploaded = parentDevice->GetCurrentFrameIndex();

		ClearDirtyRegion();
	}
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DVertexBuffer9Hook::GetDesc(THIS_ D3DVERTEXBUFFER_DESC *pDesc)
{
	if (!pDesc)
		return D3DERR_INVALIDCALL;

#ifdef _DEBUG
	if (realObject)
	{
		HRESULT ret = realObject->GetDesc(pDesc);
		if (FAILED(ret) )
		{
			__debugbreak(); // Should've been an error but we didn't find one
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
		if (pDesc->FVF != InternalFVF)
		{
			__debugbreak();
		}
		if (pDesc->Pool != InternalPool)
		{
			__debugbreak();
		}
		if (pDesc->Format != D3DFMT_VERTEXDATA)
		{
			__debugbreak();
		}
		if (pDesc->Type != D3DRTYPE_VERTEXBUFFER)
		{
			__debugbreak();
		}
	}
#endif

	pDesc->Size = InternalLength;
	pDesc->Usage = InternalUsage;
	pDesc->FVF = InternalFVF.rawFVF_DWORD;
	pDesc->Pool = InternalPool;
	pDesc->Format = D3DFMT_VERTEXDATA;
	pDesc->Type = D3DRTYPE_VERTEXBUFFER;

	return S_OK;
}

void IDirect3DVertexBuffer9Hook::MarkDirtyRegion(const unsigned regionByteOffset, const unsigned regionByteLength)
{
	if (regionByteLength == 0)
		return;

	GPUBytesAnyDirty = true;

	const unsigned expandedByteOffset = regionByteOffset & ~(GPU_DRAM_TRANSACTION_SIZE_BYTES - 1); // Round down to the nearest DRAM transaction boundary
	const unsigned expandedByteLength = (regionByteLength + (GPU_DRAM_TRANSACTION_SIZE_BYTES - 1) ) & ~(GPU_DRAM_TRANSACTION_SIZE_BYTES - 1); // Round up to the next DRAM transaction boundary

	const unsigned offsetStartBits = expandedByteOffset / GPU_DRAM_TRANSACTION_SIZE_BYTES;
	const unsigned lengthNumBits = expandedByteLength / GPU_DRAM_TRANSACTION_SIZE_BYTES;
	const unsigned endBits = offsetStartBits + lengthNumBits;
	for (unsigned bitIndex = offsetStartBits; bitIndex < endBits; ++bitIndex)
	{
		const unsigned DWORDIndex = bitIndex / (sizeof(DWORD) * 8);
		const unsigned DWORDBitOffset = bitIndex % (sizeof(DWORD) * 8);
		GPUBytesDirtyBits[DWORDIndex] |= (1 << DWORDBitOffset);
	}

	lastFrameIDDirtied = parentDevice->GetCurrentFrameIndex();
}

void IDirect3DVertexBuffer9Hook::ClearDirtyRegion()
{
	if (GPUBytesAnyDirty)
	{
		const unsigned numDirtyDWORDs = GetDirtyDWORDsCountFromBufferLength(InternalLength);
		for (unsigned x = 0; x < numDirtyDWORDs; ++x)
		{
			GPUBytesDirtyBits[x] = 0x00000000;
		}

		GPUBytesAnyDirty = false;
	}
}
