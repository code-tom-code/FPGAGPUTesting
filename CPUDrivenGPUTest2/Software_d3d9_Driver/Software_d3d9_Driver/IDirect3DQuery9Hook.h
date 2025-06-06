#pragma once

#include "IDirect3DDevice9Hook.h"

class IDirect3DQuery9Hook : public IDirect3DQuery9
{
public:
	IDirect3DQuery9Hook(LPDIRECT3DQUERY9 _realObject, IDirect3DDevice9Hook* _parentDevice) : realObject(_realObject), parentDevice(_parentDevice), refCount(1), deviceQueryAlloc(NULL), queryType( (const D3DQUERYTYPE)0), queryState(nonIssued)
	{
		memset(&queryData, 0, sizeof(queryData) );
	}

	inline LPDIRECT3DQUERY9 GetUnderlyingQuery(void) const
	{
		return realObject;
	}

	virtual ~IDirect3DQuery9Hook()
	{
#ifdef WIPE_ON_DESTRUCT_D3DHOOKOBJECT
		memset(this, 0x00000000, sizeof(*this) );
#endif
	}

	/*** IUnknown methods ***/
    virtual COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE QueryInterface(THIS_ REFIID riid, void** ppvObj) override;
    virtual COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE AddRef(THIS) override;
    virtual COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE Release(THIS) override;

    /*** IDirect3DQuery9 methods ***/
    virtual COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE GetDevice(THIS_ IDirect3DDevice9** ppDevice) override;
    virtual COM_DECLSPEC_NOTHROW D3DQUERYTYPE STDMETHODCALLTYPE GetType(THIS) override;
    virtual COM_DECLSPEC_NOTHROW DWORD STDMETHODCALLTYPE GetDataSize(THIS) override;
    virtual COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE Issue(THIS_ DWORD dwIssueFlags) override;
    virtual COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE GetData(THIS_ void* pData, DWORD dwSize, DWORD dwGetDataFlags) override;

	void CreateQuery(const D3DQUERYTYPE _queryType);

protected:
	LPDIRECT3DQUERY9 realObject;
	IDirect3DDevice9Hook* parentDevice;
	unsigned __int64 refCount;

	gpuvoid* deviceQueryAlloc;

	enum queryStateType
	{
		nonIssued = 0,
		issueBegin,
		issueEnd,
	} queryState;

	D3DQUERYTYPE queryType;

	union QueryUnionType
	{
		BOOL eventQueryData;
		DWORD occlusionQueryData;
		D3DDEVINFO_VCACHE vcacheQueryData;
		D3DDEVINFO_RESOURCEMANAGER resourceManagerQueryData;
		D3DDEVINFO_D3DVERTEXSTATS vertexStatsQueryData;
		UINT64 timestampQueryData;
		BOOL timestampDisjointQueryData;
		UINT64 timestampFreqQueryData;
		D3DDEVINFO_D3D9PIPELINETIMINGS pipelineTimingsQueryData;
		D3DDEVINFO_D3D9INTERFACETIMINGS interfaceTimingsQueryData;
		D3DDEVINFO_D3D9STAGETIMINGS vertexTimingsQueryData;
		D3DDEVINFO_D3D9STAGETIMINGS pixelTimingsQueryData;
		D3DDEVINFO_D3D9BANDWIDTHTIMINGS bandwidthTimingsQueryData;
		D3DDEVINFO_D3D9CACHEUTILIZATION cacheUtilizationQueryData;
		D3DMEMORYPRESSURE memoryPressureQueryData;
	} queryData;

#ifdef _DEBUG
	char debugObjectName[64] = {0};
#endif
};
