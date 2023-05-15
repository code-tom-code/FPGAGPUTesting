#pragma once

#include "IDirect3DQuery9Hook.h"

// Frequency is in units of ticks per second:
static const unsigned __int64 DEVICE_GPU_FREQUENCY = 333250000ull; // Our GPU runs at 333.250MHz

static const char* const QueryTypeToString[] =
{
	"UNKNOWN0",
	"UNKNOWN1",
	"UNKNOWN2",
	"UNKNOWN3",
	"VCACHE",
	"RESOURCEMANAGER",
	"VERTEXSTATS",
	"UNKNOWN7",
	"EVENT",
	"OCCLUSION",
	"TIMESTAMP",
	"TIMESTAMPDISJOINT",
	"TIMESTAMPFREQ",
	"PIPELINETIMINGS",
	"INTERFACETIMINGS",
	"VERTEXTIMINGS",
	"PIXELTIMINGS",
	"BANDWIDTHTIMINGS",
	"CACHEUTILIZATION",
	"MEMORYPRESSURE"
};
static_assert(ARRAYSIZE(QueryTypeToString) == D3DQUERYTYPE_MEMORYPRESSURE + 1, "Error: Mismatched enum and string table!");

/*** IUnknown methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DQuery9Hook::QueryInterface(THIS_ REFIID riid, void** ppvObj)
{
	HRESULT ret = realObject->QueryInterface(riid, ppvObj);
	if (ret == NOERROR)
	{
		*ppvObj = this;
		AddRef();
	}
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DQuery9Hook::AddRef(THIS)
{
	ULONG ret = realObject->AddRef();
	++refCount;
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3DQuery9Hook::Release(THIS)
{
	ULONG ret = realObject->Release();
	if (--refCount == 0)
	{
#ifdef DEBUGPRINT_D3DHOOKOBJECT_FULLRELEASES
		char printBuffer[128] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(printBuffer, "Fully releasing hooked Query %p\n", this);
#pragma warning(pop)
		OutputDebugStringA(printBuffer);
#endif

		GPUFree(deviceQueryAlloc);
		deviceQueryAlloc = NULL;

		delete this;
	}
	return ret;
}

/*** IDirect3DQuery9 methods ***/
COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DQuery9Hook::GetDevice(THIS_ IDirect3DDevice9** ppDevice)
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

COM_DECLSPEC_NOTHROW D3DQUERYTYPE STDMETHODCALLTYPE IDirect3DQuery9Hook::GetType(THIS)
{
#ifdef _DEBUG
	if (realObject->GetType() != queryType)
	{
		DbgBreakPrint("Error: Unsynchronized query types");
	}
#endif
	return queryType;
}

COM_DECLSPEC_NOTHROW DWORD STDMETHODCALLTYPE IDirect3DQuery9Hook::GetDataSize(THIS)
{
	DWORD ret = 0;
	switch (queryType)
	{
	case D3DQUERYTYPE_EVENT:
		ret = sizeof(BOOL);
		break;
	case D3DQUERYTYPE_OCCLUSION:
		ret = sizeof(DWORD);
		break;
	default:
#ifdef _DEBUG
		DbgBreakPrint("Error: Invalid query type specified");
#endif
	case D3DQUERYTYPE_VCACHE:
		ret = sizeof(D3DDEVINFO_VCACHE);
		break;
	case D3DQUERYTYPE_RESOURCEMANAGER:
		ret = sizeof(D3DDEVINFO_RESOURCEMANAGER);
		break;
	case D3DQUERYTYPE_VERTEXSTATS:
		ret = sizeof(D3DDEVINFO_D3DVERTEXSTATS);
		break;
	case D3DQUERYTYPE_TIMESTAMP:
		ret = sizeof(UINT64);
		break;
	case D3DQUERYTYPE_TIMESTAMPDISJOINT:
		ret = sizeof(BOOL);
		break;
	case D3DQUERYTYPE_TIMESTAMPFREQ:
		ret = sizeof(UINT64);
		break;
	case D3DQUERYTYPE_PIPELINETIMINGS:
		ret = sizeof(D3DDEVINFO_D3D9PIPELINETIMINGS);
		break;
	case D3DQUERYTYPE_INTERFACETIMINGS:
		ret = sizeof(D3DDEVINFO_D3D9INTERFACETIMINGS);
		break;
	case D3DQUERYTYPE_VERTEXTIMINGS:
		ret = sizeof(D3DDEVINFO_D3D9STAGETIMINGS);
		break;
	case D3DQUERYTYPE_PIXELTIMINGS: // Uhhhhhhhhhh, I guess this does the same thing as VERTEXTIMINGS?
		ret = sizeof(D3DDEVINFO_D3D9STAGETIMINGS);
		break;
	case D3DQUERYTYPE_BANDWIDTHTIMINGS:
		ret = sizeof(D3DDEVINFO_D3D9BANDWIDTHTIMINGS);
		break;
	case D3DQUERYTYPE_CACHEUTILIZATION:
		ret = sizeof(D3DDEVINFO_D3D9CACHEUTILIZATION);
		break;
	case D3DQUERYTYPE_MEMORYPRESSURE:
		ret = sizeof(D3DMEMORYPRESSURE);
		break;
	}

#ifdef _DEBUG
	if (ret != realObject->GetDataSize() )
	{
		DbgBreakPrint("Error: Mismatched query sizes");
	}
#endif
	return ret;
}

static inline const bool QueryTypeSupportsIssueBegin(const D3DQUERYTYPE TestType)
{
	switch (TestType)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Should never be here!
	}
#endif
	case D3DQUERYTYPE_EVENT:
	case D3DQUERYTYPE_RESOURCEMANAGER:
	case D3DQUERYTYPE_TIMESTAMP:
	case D3DQUERYTYPE_TIMESTAMPFREQ:
	case D3DQUERYTYPE_VCACHE:
	case D3DQUERYTYPE_VERTEXSTATS:
		return false;
	case D3DQUERYTYPE_OCCLUSION:
	case D3DQUERYTYPE_TIMESTAMPDISJOINT:
	case D3DQUERYTYPE_PIPELINETIMINGS:
	case D3DQUERYTYPE_INTERFACETIMINGS:
	case D3DQUERYTYPE_VERTEXTIMINGS:
	case D3DQUERYTYPE_PIXELTIMINGS:
	case D3DQUERYTYPE_BANDWIDTHTIMINGS:
	case D3DQUERYTYPE_CACHEUTILIZATION:
	case D3DQUERYTYPE_MEMORYPRESSURE:
		return true;
	}
}

static inline const bool QueryTypeHandledByHardware(const D3DQUERYTYPE type)
{
	switch (type)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Should never be here!
	}
#endif
	case D3DQUERYTYPE_RESOURCEMANAGER:
	case D3DQUERYTYPE_TIMESTAMPFREQ:
	case D3DQUERYTYPE_VCACHE:
	case D3DQUERYTYPE_TIMESTAMPDISJOINT:
	case D3DQUERYTYPE_PIPELINETIMINGS:
	case D3DQUERYTYPE_INTERFACETIMINGS:
	case D3DQUERYTYPE_VERTEXTIMINGS:
	case D3DQUERYTYPE_PIXELTIMINGS:
	case D3DQUERYTYPE_BANDWIDTHTIMINGS:
	case D3DQUERYTYPE_CACHEUTILIZATION:
	case D3DQUERYTYPE_MEMORYPRESSURE:
	case D3DQUERYTYPE_VERTEXSTATS:
		return false;
	case D3DQUERYTYPE_OCCLUSION:
	case D3DQUERYTYPE_EVENT:
	case D3DQUERYTYPE_TIMESTAMP:
		return true;
	}
}

static inline const eQueryType ConvertToDeviceType(const D3DQUERYTYPE type)
{
	switch (type)
	{
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Should never be here!
	}
#endif
	case D3DQUERYTYPE_EVENT:
		return eQTEvent;
	case D3DQUERYTYPE_OCCLUSION:
		return eQTOcclusion;
	case D3DQUERYTYPE_TIMESTAMP:
		return eQTTimestamp;
	}
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DQuery9Hook::Issue(THIS_ DWORD dwIssueFlags)
{
	if (dwIssueFlags > D3DISSUE_BEGIN)
	{
#ifdef _DEBUG
		DbgBreakPrint("Error: Invalid argument to IDirect3DQuery9::Issue()!");
#endif
		return D3DERR_INVALIDCALL;
	}

	if (dwIssueFlags & D3DISSUE_BEGIN)
	{
		if (!QueryTypeSupportsIssueBegin(queryType) )
		{
#ifdef _DEBUG
			DbgBreakPrint("Error: Can't call Issue(D3DISSUE_BEGIN) on this query type!");
#endif
			return D3DERR_INVALIDCALL;
		}

		// Update to our new query state:
		queryState = issueBegin;
	}
	else // D3DISSUE_END
	{
		if (QueryTypeSupportsIssueBegin(queryType) && queryState != issueBegin)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return D3DERR_INVALIDCALL; // For this query type, you *must* call Issue(D3DISSUE_BEGIN) before you call Issue(D3DISSUE_END)!
		}

		// Update to our new query state:
		queryState = issueEnd;
	}

#ifdef _DEBUG
	if (FAILED(realObject->Issue(dwIssueFlags) ) )
	{
		DbgBreakPrint("Error: Mismatched issue error code");
	}
#endif

	if (QueryTypeHandledByHardware(queryType) )
	{
		const HRESULT ret = parentDevice->GetBaseDevice()->DeviceIssueQuery(deviceQueryAlloc, (dwIssueFlags & D3DISSUE_BEGIN) == 0, ConvertToDeviceType(queryType) );
		switch (queryType)
		{
			case D3DQUERYTYPE_EVENT:
			{
				parentDevice->GetDeviceComms()->ReadFromDevice(deviceQueryAlloc, &queryData.eventQueryData, sizeof(queryData.eventQueryData) );
				break;
			}
			case D3DQUERYTYPE_OCCLUSION:
			{
				LARGE_INTEGER localDownloadBuffer = {0};
				parentDevice->GetDeviceComms()->ReadFromDevice(deviceQueryAlloc, &localDownloadBuffer, sizeof(localDownloadBuffer) );
				const DWORD occlusionQueryStart = localDownloadBuffer.LowPart;
				const DWORD occlusionQueryEnd = localDownloadBuffer.HighPart;
				const DWORD occlusionDelta = occlusionQueryEnd - occlusionQueryStart;
				queryData.occlusionQueryData = occlusionDelta;
				break;
			}
			case D3DQUERYTYPE_TIMESTAMP:
			{
				parentDevice->GetDeviceComms()->ReadFromDevice(deviceQueryAlloc, &queryData.timestampQueryData, sizeof(queryData.timestampQueryData) );
				break;
			}
			default:
#ifdef _DEBUG
				__debugbreak(); // Should never be here!
#endif
				break;
		}
		return ret;
	}
	else
	{
		switch (queryType)
		{
		default:
#ifdef _DEBUG
			__debugbreak(); // Unknown/illegal query type!
#endif
		case D3DQUERYTYPE_VCACHE:
		case D3DQUERYTYPE_RESOURCEMANAGER:
		case D3DQUERYTYPE_VERTEXSTATS:
		case D3DQUERYTYPE_PIPELINETIMINGS:
		case D3DQUERYTYPE_INTERFACETIMINGS:
		case D3DQUERYTYPE_VERTEXTIMINGS:
		case D3DQUERYTYPE_PIXELTIMINGS:
		case D3DQUERYTYPE_BANDWIDTHTIMINGS:
		case D3DQUERYTYPE_CACHEUTILIZATION:
		case D3DQUERYTYPE_MEMORYPRESSURE:
			break; // Not yet handled, do nothing
		case D3DQUERYTYPE_TIMESTAMPFREQ:
			queryData.timestampFreqQueryData = DEVICE_GPU_FREQUENCY;
			break;
		case D3DQUERYTYPE_TIMESTAMPDISJOINT:
			queryData.timestampDisjointQueryData = FALSE; // Timestamp data is never disjoint because we never throttle the GPU frequency up or down. It's always constant.
			break;
		}
		return S_OK;
	}
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3DQuery9Hook::GetData(THIS_ void* pData, DWORD dwSize, DWORD dwGetDataFlags)
{
	// If you set dwSize to zero, you can use this method to poll the resource for the query status. pData may be NULL only if dwSize is 0.
	// The method returns S_OK if the query data is available and S_FALSE if it is not. These are considered successful return values.
	if (!pData && dwSize == 0)
	{
		return S_OK;
	}

	if (!pData)
	{
		return D3DERR_INVALIDCALL;
	}

	const DWORD requiredMinimumDataSize = GetDataSize();
	if (dwSize < requiredMinimumDataSize)
	{
		return D3DERR_INVALIDCALL;
	}

	if (dwGetDataFlags > D3DGETDATA_FLUSH)
	{
		return D3DERR_INVALIDCALL;
	}

	// You must first call Issue(D3DISSUE_END) on your query before you can retrieve valid data from the query!
	if (queryState != issueEnd)
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		// D3D9 actually allows this case to succeed, but it returns garbage data
	}

#ifdef _DEBUG
	if (FAILED(realObject->GetData(pData, dwSize, dwGetDataFlags) ) )
	{
		DbgBreakPrint("Error: Mismatched GetData error code");
	}
#endif

	switch (queryType)
	{
	case D3DQUERYTYPE_EVENT:
	{
		BOOL* const bData = (BOOL* const)pData;
		*bData = queryData.eventQueryData;
		break;
	}
	case D3DQUERYTYPE_OCCLUSION:
	{
		DWORD* const dwData = (DWORD* const)pData;
		*dwData = queryData.occlusionQueryData;
		break;
	}
	case D3DQUERYTYPE_TIMESTAMP:
	{
		LARGE_INTEGER* const timestampData = (LARGE_INTEGER* const)pData;
		timestampData->QuadPart = queryData.timestampQueryData;
		break;
	}
	case D3DQUERYTYPE_TIMESTAMPDISJOINT:
	{
		BOOL* const timestampDisjointData = (BOOL* const)pData;
		*timestampDisjointData = queryData.timestampDisjointQueryData;
		break;
	}
	case D3DQUERYTYPE_TIMESTAMPFREQ:
	{
		LARGE_INTEGER* const timestampFreq = (LARGE_INTEGER* const)pData;
		timestampFreq->QuadPart = queryData.timestampFreqQueryData;
		break;
	}
	case D3DQUERYTYPE_VCACHE:
	{
		D3DDEVINFO_VCACHE* const vcacheData = (D3DDEVINFO_VCACHE* const)pData;
		*vcacheData = queryData.vcacheQueryData;
		break;
	}
	case D3DQUERYTYPE_RESOURCEMANAGER:
	{
		D3DDEVINFO_RESOURCEMANAGER* const resourceManagerData = (D3DDEVINFO_RESOURCEMANAGER* const)pData;
		*resourceManagerData = queryData.resourceManagerQueryData;
		break;
	}
	case D3DQUERYTYPE_VERTEXSTATS:
	{
		D3DDEVINFO_D3DVERTEXSTATS* const vertexStatsData = (D3DDEVINFO_D3DVERTEXSTATS* const)pData;
		*vertexStatsData = queryData.vertexStatsQueryData;
		break;
	}
	case D3DQUERYTYPE_PIPELINETIMINGS:
	{
		D3DDEVINFO_D3D9PIPELINETIMINGS* const pipelineTimingsData = (D3DDEVINFO_D3D9PIPELINETIMINGS* const)pData;
		*pipelineTimingsData = queryData.pipelineTimingsQueryData;
		break;
	}
	case D3DQUERYTYPE_INTERFACETIMINGS:
	{
		D3DDEVINFO_D3D9INTERFACETIMINGS* const interfaceTimingsData = (D3DDEVINFO_D3D9INTERFACETIMINGS* const)pData;
		*interfaceTimingsData = queryData.interfaceTimingsQueryData;
		break;
	}
	case D3DQUERYTYPE_VERTEXTIMINGS:
	{
		D3DDEVINFO_D3D9STAGETIMINGS* const vertexTimingsData = (D3DDEVINFO_D3D9STAGETIMINGS* const)pData;
		*vertexTimingsData = queryData.vertexTimingsQueryData;
		break;
	}
	case D3DQUERYTYPE_PIXELTIMINGS:
	{
		D3DDEVINFO_D3D9STAGETIMINGS* const pixelTimingsData = (D3DDEVINFO_D3D9STAGETIMINGS* const)pData;
		*pixelTimingsData = queryData.pixelTimingsQueryData;
		break;
	}
	case D3DQUERYTYPE_BANDWIDTHTIMINGS:
	{
		D3DDEVINFO_D3D9BANDWIDTHTIMINGS* const bandwidthTimingsData = (D3DDEVINFO_D3D9BANDWIDTHTIMINGS* const)pData;
		*bandwidthTimingsData = queryData.bandwidthTimingsQueryData;
		break;
	}
	case D3DQUERYTYPE_CACHEUTILIZATION:
	{
		D3DDEVINFO_D3D9CACHEUTILIZATION* const cacheUtilizationData = (D3DDEVINFO_D3D9CACHEUTILIZATION* const)pData;
		*cacheUtilizationData = queryData.cacheUtilizationQueryData;
		break;
	}
	case D3DQUERYTYPE_MEMORYPRESSURE:
	{
		D3DMEMORYPRESSURE* const memoryPressureData = (D3DMEMORYPRESSURE* const)pData;
		*memoryPressureData = queryData.memoryPressureQueryData;
		break;
	}
	default:
#ifdef _DEBUG
	{
		__debugbreak(); // Should never be here
	}
#else
		__assume(0);
#endif
	}

	// Reset our query state when we're finished:
	queryState = nonIssued;

	return S_OK;
}

void IDirect3DQuery9Hook::CreateQuery(const D3DQUERYTYPE _queryType)
{
	queryType = _queryType;

	switch (queryType)
	{
	default:
#ifdef _DEBUG
		DbgBreakPrint("Error: Invalid query type specified");
#endif
	case D3DQUERYTYPE_VCACHE:
	case D3DQUERYTYPE_EVENT:
	case D3DQUERYTYPE_OCCLUSION:
	case D3DQUERYTYPE_RESOURCEMANAGER:
	case D3DQUERYTYPE_VERTEXSTATS:
	case D3DQUERYTYPE_TIMESTAMP:
	case D3DQUERYTYPE_TIMESTAMPDISJOINT:
	case D3DQUERYTYPE_TIMESTAMPFREQ:
	case D3DQUERYTYPE_PIPELINETIMINGS:
	case D3DQUERYTYPE_INTERFACETIMINGS:
	case D3DQUERYTYPE_VERTEXTIMINGS:
	case D3DQUERYTYPE_BANDWIDTHTIMINGS:
	case D3DQUERYTYPE_CACHEUTILIZATION:
	case D3DQUERYTYPE_MEMORYPRESSURE:
	case D3DQUERYTYPE_PIXELTIMINGS:
		break;
	}

#ifdef _DEBUG
	#pragma warning(push)
	#pragma warning(disable:4996)
	sprintf(debugObjectName, "Query [%s]", QueryTypeToString[_queryType]);
	#pragma warning(pop)
#endif

	if (QueryTypeHandledByHardware(_queryType) )
	{
		deviceQueryAlloc = GPUAlloc(32, 
				1, 1, 1, 1, GPUVAT_QueryMemory, GPUFMT_QueryData
#ifdef _DEBUG
				, debugObjectName
#endif
			);
	}
}
