#pragma once

#include "IDirect3D9Hook.h"
#include "Driver/DriverOptions.h"
#include "INIVar.h"

static INIVar MessageboxOnCreateDevice("Options", "MessageboxOnCreateDevice", true);
extern INIVar OverrideDriverName; // If not empty, overrides the driver's queried name with the given string.
extern INIVar OverrideDeviceName; // If not empty, overrides the device's queried name with the given string.
extern INIVar OverrideDeviceID; // If not empty, overrides the device's queried ID with the given string.
extern INIVar OverrideDeviceCapsSet; // If not empty, overrides the device's caps bits with those from the given caps set.

// This is our "current" and default display mode:
static const D3DDISPLAYMODE CurrentDisplayMode = {640u, 480u, 60u, D3DFMT_X8R8G8B8};

static const D3DDISPLAYMODE AvailableDisplayModes888[] =
{
	{640u, 480u, 60u, D3DFMT_X8R8G8B8}
	// When we support multiple resolutions, expose them here!
};

static const D3DDISPLAYMODE AvailableDisplayModes565[] =
{
	{640u, 480u, 60u, D3DFMT_R5G6B5}
	// When we support multiple resolutions, expose them here!
};

static const D3DDISPLAYMODE AvailableDisplayModes555[] =
{
	{640u, 480u, 60u, D3DFMT_X1R5G5B5}
	// When we support multiple resolutions, expose them here!
};

/*
ATI/AMD Laptop:
Driver: aticfx64.dll
Description: AMD Radeon(TM) 610M
GDI Device Name: \\.\DISPLAY1
Driver Version: 0x1F000036D61F42 (8725725198032706)
	Product Version: 0x001F (31)
	Driver Version: 0x0000 (0)
	Driver SubVersion: 0x36D6 (14038)
	Driver Build: 0x1F42 (8002)
VendorID: 0x00001002 (4098)
DeviceId: 0x0000164E (5710)
SubSysId: 0x32E81043 (854069315)
Revision: 0x000000DC (220)
WHQL Level: 0x00000000 (0)
Device GUID: {D7B71EE2-550E-11CF-B16C-3E2473C2D235}
*/

/*
NVidia Laptop:
Driver: nvldumdx.dll
Description: NVIDIA GeForce RTX 4090 Laptop GPU
GDI Device Name: \\.\DISPLAY1
Driver Version: 0x200000000F19EC (9007199255730668)
	Product Version: 0x0020 (32)
	Driver Version: 0x0000 (0)
	Driver SubVersion: 0x000F (15)
	Driver Build: 0x19EC (6636)
VendorID: 0x000010DE (4318)
DeviceId: 0x00002757 (10071)
SubSysId: 0x32E81043 (854069315)
Revision: 0x000000A1 (161)
WHQL Level: 0x00000000 (0)
Device GUID: {D7B71E3E-6417-11CF-1F6A-E7120EC2ED35}
*/

/*
NVidia Desktop:
Driver: nvldumd.dll
Description: NVIDIA GeForce RTX 5080
GDI Device Name: \\.\DISPLAY1
Driver Version: 0x200000000F1E08 (9007199255731720)
	Product Version: 0x0020 (32)
	Driver Version: 0x0000 (0)
	Driver SubVersion: 0x000F (15)
	Driver Build: 0x1E08 (7688)
VendorID: 0x000010DE (4318)
DeviceId: 0x00002C02 (11266)
SubSysId: 0x53101462 (1393562722)
Revision: 0x000000A1 (161)
WHQL Level: 0x00000000 (0)
Device GUID: {D7B71E3E-6F42-11CF-DA69-1F730EC2ED35}
*/
static const D3DADAPTER_IDENTIFIER9 AdapterIdentifier =
{
	"d3d9.dll",
	"DragonGPU 1",
	"\\\\.\\DISPLAY1",
	{0x000110D0, 0x001F0000}, // DriverVersion
	0x000010D2, // VendorID
	0x000010D0, // DeviceID
	0x32E81043, // SubSysID
	0x00000064, // Revision
	{ 0xD7B71E01, 0x4001, 0x11CF, { 'D', 'G', 'P', 'U', '1', 0xC2, 0xCD, 0x35 } }, // Device GUID
	0x00000000 // WHQL Level (0 means that this particular device + driver pair has not been WHQL certified)
};

static const bool CheckFormatSupport_IndexBuffer(const D3DFORMAT fmt)
{
	switch (fmt)
	{
	case D3DFMT_INDEX16: // These are the index buffer formats that we support
	case D3DFMT_INDEX32:
	case D3DFMT_L8: // Technically this isn't allowed in D3D9, but we support 8-bit unsigned indices anyway!
		return true;
	default:
		return false;
	}
}

static const bool CheckFormatSupport_DepthStencil(const D3DFORMAT fmt)
{
	switch (fmt)
	{
	case D3DFMT_D24S8: // These are the depth-stencil formats that we support:
	case D3DFMT_D24X8:
	case D3DFMT_D24X4S4:
	case D3DFMT_D24FS8:
	case D3DFMT_D16:
	case D3DFMT_D16_LOCKABLE:
	case D3DFMT_D15S1:
		return true;
	case D3DFMT_S8_LOCKABLE: // Unsupported D3D9 depth/stencil formats:
	case D3DFMT_D32:
	case D3DFMT_D32F_LOCKABLE:
	case D3DFMT_D32_LOCKABLE:
		return false;
	default: // Unknown depth/stencil format
		return false;
	}
}

static const bool CheckFormatSupport_Display(const D3DFORMAT fmt)
{
	switch (fmt)
	{
	case D3DFMT_X8R8G8B8: // These are the display formats that we support:
	case D3DFMT_R5G6B5:
	case D3DFMT_X1R5G5B5:
		return true;
	case D3DFMT_A8R8G8B8: // These can be backbuffer formats, but they cannot be display formats because we can't display an alpha channel:
	case D3DFMT_A1R5G5B5:
		return false;
	default: // Unknown format (not a display format?)
		return false;
	}
}

static const bool CheckFormatSupport_Backbuffer(const D3DFORMAT fmt)
{
	switch (fmt)
	{
	case D3DFMT_A8R8G8B8: // These are the backbuffer formats that we support:
	case D3DFMT_X8R8G8B8:
	case D3DFMT_R5G6B5:
	case D3DFMT_A1R5G5B5:
	case D3DFMT_X1R5G5B5:
		return true;
	default: // Unknown format (not a backbuffer format?)
		return false;
	}
}

static const bool CheckFormatSupport_RenderTarget(const D3DFORMAT fmt)
{
	switch (fmt)
	{
	case D3DFMT_A8R8G8B8: // These are the render target formats that we support:
	case D3DFMT_X8R8G8B8:
	case D3DFMT_R5G6B5:
	case D3DFMT_A1R5G5B5:
	case D3DFMT_X1R5G5B5:
	case D3DFMT_A4R4G4B4:
	case D3DFMT_X4R4G4B4:
		return true;
	case D3DFMT_A2R10G10B10: // These are unsupported D3D9 render target formats:
	case D3DFMT_A2B10G10R10:
	case D3DFMT_G16R16:
	case D3DFMT_G16R16F:
	case D3DFMT_A16B16G16R16:
	case D3DFMT_A16B16G16R16F:
	case D3DFMT_R16F:
	case D3DFMT_R32F:
	case D3DFMT_G32R32F:
	case D3DFMT_A32B32G32R32F:
		return false;
	default: // Unknown format (not a render target format?)
		return false;
	}
}

static const bool CheckFormatSupport_Texture(const D3DFORMAT fmt)
{
	switch (fmt)
	{
	case D3DFMT_A8R8G8B8: // These are the texture formats that we support:
	case D3DFMT_X8R8G8B8:
	case D3DFMT_R5G6B5:
	case D3DFMT_A1R5G5B5:
	case D3DFMT_X1R5G5B5:
	case D3DFMT_A4R4G4B4:
	case D3DFMT_X4R4G4B4:
	case D3DFMT_A8:
	case D3DFMT_L8:
	case D3DFMT_DXT1:
	case D3DFMT_DXT2:
	case D3DFMT_DXT3:
	case D3DFMT_DXT4:
	case D3DFMT_DXT5:
		return true;
	case D3DFMT_A2R10G10B10: // These are unsupported D3D9 texture formats:
	case D3DFMT_A2B10G10R10:
	case D3DFMT_G16R16:
	case D3DFMT_G16R16F:
	case D3DFMT_A16B16G16R16:
	case D3DFMT_A16B16G16R16F:
	case D3DFMT_R16F:
	case D3DFMT_R32F:
	case D3DFMT_G32R32F:
	case D3DFMT_A32B32G32R32F:
		return false;
	default: // Unknown format (not a texture format?)
		return false;
	}
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::QueryInterface(THIS_ REFIID riid, void** ppvObj) 
{
	const HRESULT ret = d3d9->QueryInterface(riid, ppvObj);
	if (ret == NOERROR)
	{
		*ppvObj = this;
		AddRef();
	}
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3D9Hook::AddRef(THIS) 
{
	const ULONG ret = d3d9->AddRef();
	++refCount;
	return ret;
}

COM_DECLSPEC_NOTHROW ULONG STDMETHODCALLTYPE IDirect3D9Hook::Release(THIS) 
{
	const ULONG ret = d3d9->Release();
	if (--refCount == 0)
	{
#ifdef DEBUGPRINT_D3DHOOKOBJECT_FULLRELEASES
		char printBuffer[128] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
		sprintf(printBuffer, "Fully releasing hooked D3D9 %p\n", this);
#pragma warning(pop)
		OutputDebugStringA(printBuffer);
#endif
		delete this;
	}
	return ret;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::RegisterSoftwareDevice(THIS_ void* pInitializeFunction)
{
	const HRESULT ret = d3d9->RegisterSoftwareDevice(pInitializeFunction);
#ifdef _DEBUG
	__debugbreak(); // This function isn't supported by the driver
	return D3DERR_INVALIDCALL;
#endif
	return ret;
}

COM_DECLSPEC_NOTHROW UINT STDMETHODCALLTYPE IDirect3D9Hook::GetAdapterCount(THIS)
{
	const UINT ret = d3d9->GetAdapterCount();

	// Always expose one adapter
	return 1;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::GetAdapterIdentifier(THIS_ UINT Adapter, DWORD Flags, D3DADAPTER_IDENTIFIER9* pIdentifier) 
{
	const HRESULT ret = d3d9->GetAdapterIdentifier(Adapter, Flags, pIdentifier);
	if (pIdentifier == NULL)
	{
		return D3DERR_INVALIDCALL;
	}
	if (Adapter > 0)
	{
		// "If Adapter is greater than or equal to the number of adapters in the system, this structure will be zeroed."
		memset(pIdentifier, 0, sizeof(D3DADAPTER_IDENTIFIER9) );
		return D3DERR_INVALIDCALL;
	}
	if (Flags == 0 || Flags == D3DENUM_WHQL_LEVEL)
	{
		// Flags are ok
	}
	else
	{
		return D3DERR_INVALIDCALL; // Error: Unrecognized flags!
	}
	*pIdentifier = AdapterIdentifier;

	const char* const overrideDriverNameString = OverrideDriverName.String();
	if (overrideDriverNameString != NULL && overrideDriverNameString[0] != '\0')
	{
		strcpy_s(pIdentifier->Driver, overrideDriverNameString);
	}

	const char* const overrideDeviceNameString = OverrideDeviceName.String();
	if (overrideDeviceNameString != NULL && overrideDeviceNameString[0] != '\0')
	{
		strcpy_s(pIdentifier->Description, overrideDeviceNameString);
	}

	const char* const overrideDeviceIDString = OverrideDeviceID.String();
	if (overrideDeviceIDString != NULL && overrideDeviceIDString[0] != '\0')
	{
		// TODO: Handle OverrideDeviceID here as well. Requires string-parsing GUID's.
	}

	// Ensure that our strings are always fully null-terminated:
	pIdentifier->Driver[ARRAYSIZE(pIdentifier->Driver) - 1] = '\0';
	pIdentifier->Description[ARRAYSIZE(pIdentifier->Description) - 1] = '\0';
	pIdentifier->DeviceName[ARRAYSIZE(pIdentifier->DeviceName) - 1] = '\0';

	return ret;
}

COM_DECLSPEC_NOTHROW UINT STDMETHODCALLTYPE IDirect3D9Hook::GetAdapterModeCount(THIS_ UINT Adapter, D3DFORMAT Format)
{
	const UINT ret = d3d9->GetAdapterModeCount(Adapter, Format);
	if (Adapter > 0)
	{
		return D3DERR_INVALIDCALL;
	}
	switch (Format)
	{
	case D3DFMT_A8R8G8B8:
	case D3DFMT_X8R8G8B8:
		return ARRAYSIZE(AvailableDisplayModes888);
	case D3DFMT_R5G6B5:
		return ARRAYSIZE(AvailableDisplayModes565);
	case D3DFMT_A1R5G5B5:
	case D3DFMT_X1R5G5B5:
		return ARRAYSIZE(AvailableDisplayModes555);
	default:
		return 0;
	}
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::EnumAdapterModes(THIS_ UINT Adapter, D3DFORMAT Format, UINT Mode, D3DDISPLAYMODE* pMode)
{
	const HRESULT ret = d3d9->EnumAdapterModes(Adapter, Format, Mode, pMode);
	if (Adapter > 0)
	{
		return D3DERR_INVALIDCALL;
	}
	if (pMode == NULL)
	{
		return D3DERR_INVALIDCALL;
	}
	switch (Format)
	{
	case D3DFMT_A8R8G8B8:
	case D3DFMT_X8R8G8B8:
		if (Mode > ARRAYSIZE(AvailableDisplayModes888) )
		{
			return D3DERR_NOTAVAILABLE;
		}
		*pMode = AvailableDisplayModes888[Mode];
		break;
	case D3DFMT_R5G6B5:
		if (Mode > ARRAYSIZE(AvailableDisplayModes565) )
		{
			return D3DERR_NOTAVAILABLE;
		}
		*pMode = AvailableDisplayModes565[Mode];
		break;
	case D3DFMT_A1R5G5B5:
	case D3DFMT_X1R5G5B5:
		if (Mode > ARRAYSIZE(AvailableDisplayModes555) )
		{
			return D3DERR_NOTAVAILABLE;
		}
		*pMode = AvailableDisplayModes555[Mode];
		break;
	default:
		return D3DERR_NOTAVAILABLE;
	}
	return D3D_OK;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::GetAdapterDisplayMode(THIS_ UINT Adapter, D3DDISPLAYMODE* pMode)
{
	const HRESULT ret = d3d9->GetAdapterDisplayMode(Adapter, pMode);
	if (Adapter > 0)
	{
		return D3DERR_INVALIDCALL;
	}
	if (pMode == NULL)
	{
		return D3DERR_INVALIDCALL;
	}
	*pMode = CurrentDisplayMode;
	return ret;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::CheckDeviceType(THIS_ UINT Adapter, D3DDEVTYPE DevType, D3DFORMAT DisplayFormat, D3DFORMAT BackBufferFormat, BOOL bWindowed)
{
	const HRESULT ret = d3d9->CheckDeviceType(Adapter, DevType, DisplayFormat, BackBufferFormat, bWindowed);
	if (Adapter > 0)
	{
		return D3DERR_INVALIDCALL;
	}
	if (DevType == 0 || DevType > D3DDEVTYPE_HAL)
	{
		// We only support HAL devices at this time
		return D3DERR_INVALIDCALL;
	}
	if (CheckFormatSupport_Display(DisplayFormat) == false)
	{
		return D3DERR_NOTAVAILABLE;
	}
	return CheckFormatSupport_Backbuffer(BackBufferFormat) ? D3D_OK : D3DERR_NOTAVAILABLE;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::CheckDeviceFormat(THIS_ UINT Adapter, D3DDEVTYPE DeviceType, D3DFORMAT AdapterFormat, DWORD Usage, D3DRESOURCETYPE RType, D3DFORMAT CheckFormat)
{
	const HRESULT ret = d3d9->CheckDeviceFormat(Adapter, DeviceType, AdapterFormat, Usage, RType, CheckFormat);
	if (Adapter > 0)
	{
		return D3DERR_INVALIDCALL;
	}
	if (DeviceType != D3DDEVTYPE_HAL)
	{
		return D3DERR_INVALIDCALL;
	}
	if (CheckFormatSupport_Display(AdapterFormat) == false)
	{
		return D3DERR_NOTAVAILABLE;
	}
	if (Usage == D3DUSAGE_DEPTHSTENCIL)
	{
		// For depth-stencil buffers, we only support them as surfaces, not textures or cubemaps (yet)
		if (RType == D3DRTYPE_SURFACE)
		{
			return CheckFormatSupport_DepthStencil(CheckFormat) ? D3D_OK : D3DERR_NOTAVAILABLE;
		}
		else
		{
			return D3DERR_NOTAVAILABLE;
		}
	}
	else if (Usage == D3DUSAGE_RENDERTARGET)
	{
		if (RType == D3DRTYPE_SURFACE || RType == D3DRTYPE_TEXTURE || RType == D3DRTYPE_CUBETEXTURE || RType == D3DRTYPE_VOLUMETEXTURE)
		{
			return CheckFormatSupport_RenderTarget(CheckFormat) ? D3D_OK : D3DERR_NOTAVAILABLE;
		}
		else
		{
			return D3DERR_NOTAVAILABLE;
		}
	}
	else if (Usage == D3DUSAGE_SOFTWAREPROCESSING) // "D3DUSAGE_SOFTWAREPROCESSING is used with CheckDeviceFormat to find out if a particular texture format can be used as a vertex texture during software vertex processing. If it can, the texture must be created in D3DPOOL_SCRATCH."
	{
		return D3DERR_NOTAVAILABLE; // We don't support texturing with SWVP at all
	}
	else if (Usage == D3DUSAGE_AUTOGENMIPMAP)
	{
		return D3DOK_NOAUTOGEN; // We do not currently support automatic generation of mips
	}
	else if (Usage == D3DUSAGE_QUERY_VERTEXTEXTURE) // Query the resource to verify support for vertex shader texture sampling.
	{
		return D3DERR_NOTAVAILABLE; // We do not currently support vertex textures
	}
	else if (Usage == D3DUSAGE_DMAP)
	{
		return D3DERR_NOTAVAILABLE; // We do not currently support displacement maps
	}
	else if (Usage == D3DUSAGE_DYNAMIC)
	{
		if (CheckFormatSupport_DepthStencil(CheckFormat) )
		{
			return D3DERR_NOTAVAILABLE;
		}
		else
		{
			return D3D_OK; // We should support dynamic locking for all formats except for depth/stencil buffers
		}
	}
	else if (Usage == D3DUSAGE_NONSECURE)
	{
		return D3DERR_NOTAVAILABLE; // We don't support sharing resources between processes
	}
	else if (Usage == D3DUSAGE_QUERY_SRGBREAD)
	{
		return D3DERR_NOTAVAILABLE; // We do not currently support sRGB textures
	}
	else if (Usage == D3DUSAGE_QUERY_SRGBWRITE)
	{
		return D3DERR_NOTAVAILABLE; // We do not currently support sRGB render targets
	}
	else if (Usage == D3DUSAGE_QUERY_LEGACYBUMPMAP)
	{
		return D3DERR_NOTAVAILABLE; // We do not currently support bump mapping
	}
	else if (Usage == D3DUSAGE_QUERY_WRAPANDMIP || // Query the resource to verify support for texture wrapping and mip-mapping.
		Usage == D3DUSAGE_QUERY_FILTER || // Query the resource format to see if it supports texture filter types other than D3DTEXF_POINT (which is always supported). 
		Usage == D3DUSAGE_QUERY_POSTPIXELSHADER_BLENDING) // Checks for if we can perform alpha-blending using this render target format
	{
		if (CheckFormatSupport_DepthStencil(CheckFormat) )
		{
			return D3DERR_NOTAVAILABLE;
		}
		else
		{
			return D3D_OK; // We should support wrapping and mip-maps for all texture formats and blending for all render target formats
		}
	}
	else if (Usage == 0) // This means a plain resource
	{
		switch (RType)
		{
		case D3DRTYPE_VOLUME:
		case D3DRTYPE_VOLUMETEXTURE:
			return D3DERR_NOTAVAILABLE; // This device does not support volume-texturing (yet)
		case D3DRTYPE_CUBETEXTURE:
			return D3DERR_NOTAVAILABLE; // This device does not support cubemaps (yet)
		case D3DRTYPE_SURFACE:
		case D3DRTYPE_TEXTURE:
			return CheckFormatSupport_Texture(CheckFormat) ? D3D_OK : D3DERR_NOTAVAILABLE;
		case D3DRTYPE_VERTEXBUFFER:
			return (CheckFormat == D3DFMT_VERTEXDATA) ? D3D_OK : D3DERR_NOTAVAILABLE;
		case D3DRTYPE_INDEXBUFFER:
			return CheckFormatSupport_IndexBuffer(CheckFormat) ? D3D_OK : D3DERR_NOTAVAILABLE;
		default:
			return D3DERR_INVALIDCALL; // Unknown (probably bad) resource type
		}
	}
	else
	{
		return D3DERR_NOTAVAILABLE; // Default to returning "not available" for any other queries
	}
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::CheckDeviceMultiSampleType(THIS_ UINT Adapter, D3DDEVTYPE DeviceType, D3DFORMAT SurfaceFormat, BOOL Windowed, D3DMULTISAMPLE_TYPE MultiSampleType, DWORD* pQualityLevels)
{
	const HRESULT ret = d3d9->CheckDeviceMultiSampleType(Adapter, DeviceType, SurfaceFormat, Windowed, MultiSampleType, pQualityLevels);
	if (Adapter > 0)
	{
		return D3DERR_INVALIDCALL;
	}
	if (DeviceType != D3DDEVTYPE_HAL)
	{
		// This driver only supports HAL devices
		return D3DERR_INVALIDCALL;
	}
	if (MultiSampleType > D3DMULTISAMPLE_16_SAMPLES || MultiSampleType < 0)
	{
		return D3DERR_INVALIDCALL;
	}
	if (CheckFormatSupport_Backbuffer(SurfaceFormat) )
	{
		// The only multisampling type that this driver supports is "no multisampling".
		if (MultiSampleType == D3DMULTISAMPLE_NONE)
		{
			return D3D_OK;
		}
		else
		{
			return D3DERR_NOTAVAILABLE;
		}
	}
	else
	{
		// We don't support this backbuffer format to begin with!
		return D3DERR_NOTAVAILABLE;
	}
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::CheckDepthStencilMatch(THIS_ UINT Adapter, D3DDEVTYPE DeviceType, D3DFORMAT AdapterFormat, D3DFORMAT RenderTargetFormat, D3DFORMAT DepthStencilFormat)
{
	const HRESULT ret = d3d9->CheckDepthStencilMatch(Adapter, DeviceType, AdapterFormat, RenderTargetFormat, DepthStencilFormat);
	if (Adapter > 0)
	{
		return D3DERR_INVALIDCALL;
	}
	if (DeviceType != D3DDEVTYPE_HAL)
	{
		// This driver only supports HAL devices
		return D3DERR_INVALIDCALL;
	}
	if (CheckFormatSupport_Display(AdapterFormat) == false)
	{
		return D3DERR_NOTAVAILABLE;
	}
	if (CheckFormatSupport_RenderTarget(RenderTargetFormat) == false)
	{
		return D3DERR_NOTAVAILABLE;
	}
	return CheckFormatSupport_DepthStencil(DepthStencilFormat) ? D3D_OK : D3DERR_NOTAVAILABLE;
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::CheckDeviceFormatConversion(THIS_ UINT Adapter, D3DDEVTYPE DeviceType, D3DFORMAT SourceFormat, D3DFORMAT TargetFormat)
{
	const HRESULT ret = d3d9->CheckDeviceFormatConversion(Adapter, DeviceType, SourceFormat, TargetFormat);
	if (Adapter > 0)
	{
		return D3DERR_INVALIDCALL;
	}
	if (DeviceType == 0 || DeviceType > D3DDEVTYPE_HAL)
	{
		// This driver only supports HAL devices
		return D3DERR_INVALIDCALL;
	}
	switch (TargetFormat)
	{
	case D3DFMT_A8R8G8B8:
	case D3DFMT_X8R8G8B8:
		if (SourceFormat == D3DFMT_A8R8G8B8 || SourceFormat == D3DFMT_X8R8G8B8)
		{
			// We can convert between ARGB/XRGB 888 formats by simply ignoring the alpha channel
			return D3D_OK;
		}
		else
		{
			return D3DERR_NOTAVAILABLE;
		}
	case D3DFMT_A1R5G5B5:
	case D3DFMT_X1R5G5B5:
		if (SourceFormat == D3DFMT_A1R5G5B5 || SourceFormat == D3DFMT_X1R5G5B5)
		{
			// We can convert between ARGB/XRGB 555 formats by simply ignoring the alpha channel
			return D3D_OK;
		}
		else
		{
			return D3DERR_NOTAVAILABLE;
		}
	case D3DFMT_R5G6B5:
		if (SourceFormat == D3DFMT_R5G6B5)
		{
			return D3D_OK;
		}
		else
		{
			return D3DERR_NOTAVAILABLE;
		}
	case D3DFMT_R8G8B8:
	case D3DFMT_A2R10G10B10:
	case D3DFMT_A2B10G10R10:
	case D3DFMT_A8B8G8R8:
	case D3DFMT_X8B8G8R8:
	case D3DFMT_A16B16G16R16:
	case D3DFMT_A16B16G16R16F:
	case D3DFMT_A32B32G32R32F:
		return D3DERR_NOTAVAILABLE;
	default: // This isn't a valid target format for converting to
		return D3DERR_INVALIDCALL;
	}
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::GetDeviceCaps(THIS_ UINT Adapter, D3DDEVTYPE DeviceType, D3DCAPS9* pCaps)
{
	const HRESULT ret = d3d9->GetDeviceCaps(Adapter, DeviceType, pCaps);

	if (Adapter > 0)
	{
		return D3DERR_INVALIDCALL;
	}

	if (DeviceType != D3DDEVTYPE_HAL)
	{
		return D3DERR_INVALIDCALL;
	}

	if (pCaps == NULL)
	{
		return D3DERR_INVALIDCALL;
	}

	if (FAILED(ret) )
		return ret;

	IDirect3DDevice9Hook::ModifyDeviceCaps(*pCaps);

	return ret;
}

COM_DECLSPEC_NOTHROW HMONITOR STDMETHODCALLTYPE IDirect3D9Hook::GetAdapterMonitor(THIS_ UINT Adapter)
{
	const HMONITOR ret = d3d9->GetAdapterMonitor(Adapter);
	return ret;
}

static inline const char* const GetBackbufferFormatString(const D3DFORMAT fmt)
{
	// These are the valid backbuffer surface formats for D3D9
	switch (fmt)
	{
	case D3DFMT_A2R10G10B10:
		return "D3DFMT_A2R10G10B10";
	case D3DFMT_A8R8G8B8:
		return "D3DFMT_A8R8G8B8";
	case D3DFMT_X8R8G8B8:
		return "D3DFMT_X8R8G8B8";
	case D3DFMT_A1R5G5B5:
		return "D3DFMT_A1R5G5B5";
	case D3DFMT_X1R5G5B5:
		return "D3DFMT_X1R5G5B5";
	case D3DFMT_R5G6B5:
		return "D3DFMT_R5G6B5";
	default:
		return "Unknown";
	}
}

static inline const char* const GetDepthbufferFormatString(const D3DFORMAT fmt)
{
	switch (fmt)
	{
	case D3DFMT_D16_LOCKABLE:
		return "D3DFMT_D16_LOCKABLE";
	case D3DFMT_D32:
		return "D3DFMT_D32";
	case D3DFMT_D15S1:
		return "D3DFMT_D15S1";
	case D3DFMT_D24S8:
		return "D3DFMT_D24S8";
	case D3DFMT_D24X8:
		return "D3DFMT_D24X8";
	case D3DFMT_D24X4S4:
		return "D3DFMT_D24X4S4";
	case D3DFMT_D32F_LOCKABLE:
		return "D3DFMT_D32F_LOCKABLE";
	case D3DFMT_D24FS8:
		return "D3DFMT_D24FS8";
	case D3DFMT_D32_LOCKABLE:
		return "D3DFMT_D32_LOCKABLE";
	case D3DFMT_S8_LOCKABLE:
		return "D3DFMT_S8_LOCKABLE";
	case D3DFMT_D16:
		return "D3DFMT_D16";
	default:
		return "Unknown";
	}
}

static inline const char* const GetDeviceTypeString(const D3DDEVTYPE DeviceType)
{
	switch (DeviceType)
	{
	case D3DDEVTYPE_HAL:
		return "D3DDEVTYPE_HAL";
	case D3DDEVTYPE_REF:
		return "D3DDEVTYPE_REF";
	case D3DDEVTYPE_SW:
		return "D3DDEVTYPE_SW";
	case D3DDEVTYPE_NULLREF:
		return "D3DDEVTYPE_NULLREF";
	default:
		return "Unknown";
	}
}

static const DWORD BehaviorCreateFlags[] =
{
	D3DCREATE_ADAPTERGROUP_DEVICE,
	D3DCREATE_DISABLE_DRIVER_MANAGEMENT,
	D3DCREATE_DISABLE_DRIVER_MANAGEMENT_EX,
	D3DCREATE_DISABLE_PRINTSCREEN,
	D3DCREATE_DISABLE_PSGP_THREADING,
	D3DCREATE_ENABLE_PRESENTSTATS,
	D3DCREATE_FPU_PRESERVE,
	D3DCREATE_HARDWARE_VERTEXPROCESSING,
	D3DCREATE_MIXED_VERTEXPROCESSING,
	D3DCREATE_SOFTWARE_VERTEXPROCESSING,
	D3DCREATE_MULTITHREADED,
	D3DCREATE_NOWINDOWCHANGES,
	D3DCREATE_PUREDEVICE,
	D3DCREATE_SCREENSAVER
};

static const char* const BehaviorCreateFlagStrings[] =
{
	"D3DCREATE_ADAPTERGROUP_DEVICE",
	"D3DCREATE_DISABLE_DRIVER_MANAGEMENT",
	"D3DCREATE_DISABLE_DRIVER_MANAGEMENT_EX",
	"D3DCREATE_DISABLE_PRINTSCREEN",
	"D3DCREATE_DISABLE_PSGP_THREADING",
	"D3DCREATE_ENABLE_PRESENTSTATS",
	"D3DCREATE_FPU_PRESERVE",
	"D3DCREATE_HARDWARE_VERTEXPROCESSING",
	"D3DCREATE_MIXED_VERTEXPROCESSING",
	"D3DCREATE_SOFTWARE_VERTEXPROCESSING",
	"D3DCREATE_MULTITHREADED",
	"D3DCREATE_NOWINDOWCHANGES",
	"D3DCREATE_PUREDEVICE",
	"D3DCREATE_SCREENSAVER"
};

static inline const char* const StaticGetDeviceBehaviorFlagsString(const DWORD BehaviorFlags)
{
	static char staticBuffer[512] = {0};
	bool hasBehaviorFlags = false;
	for (unsigned x = 0; x < ARRAYSIZE(BehaviorCreateFlags); ++x)
	{
		if (BehaviorFlags & BehaviorCreateFlags[x])
		{
#pragma warning(push)
#pragma warning(disable:4996)
			if (hasBehaviorFlags)
				strcat(staticBuffer, " | ");
			strcat(staticBuffer, BehaviorCreateFlagStrings[x]);
#pragma warning(pop)
			hasBehaviorFlags = true;
		}
	}
	return staticBuffer;
}

static inline const char* const SwapEffectToString(const D3DSWAPEFFECT SwapEffect)
{
	switch (SwapEffect)
	{
	case D3DSWAPEFFECT_DISCARD:
		return "D3DSWAPEFFECT_DISCARD";
	case D3DSWAPEFFECT_FLIP:
		return "D3DSWAPEFFECT_FLIP";
	case D3DSWAPEFFECT_COPY:
		return "D3DSWAPEFFECT_COPY";
	case D3DSWAPEFFECT_OVERLAY:
		return "D3DSWAPEFFECT_OVERLAY";
	case D3DSWAPEFFECT_FLIPEX:
		return "D3DSWAPEFFECT_FLIPEX";
	default:
		return "Unknown";
	}
}

static const DWORD PresentFlags[] =
{
	D3DPRESENTFLAG_LOCKABLE_BACKBUFFER,
	D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL,
	D3DPRESENTFLAG_DEVICECLIP,
	D3DPRESENTFLAG_VIDEO,
	D3DPRESENTFLAG_NOAUTOROTATE,
	D3DPRESENTFLAG_UNPRUNEDMODE,
	D3DPRESENTFLAG_OVERLAY_LIMITEDRGB,
	D3DPRESENTFLAG_OVERLAY_YCbCr_BT709,
	D3DPRESENTFLAG_OVERLAY_YCbCr_xvYCC,
	D3DPRESENTFLAG_RESTRICTED_CONTENT,
	D3DPRESENTFLAG_RESTRICT_SHARED_RESOURCE_DRIVER
};

static const char* const PresentFlagStrings[] =
{
	"D3DPRESENTFLAG_LOCKABLE_BACKBUFFER",
	"D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL",
	"D3DPRESENTFLAG_DEVICECLIP",
	"D3DPRESENTFLAG_VIDEO",
	"D3DPRESENTFLAG_NOAUTOROTATE",
	"D3DPRESENTFLAG_UNPRUNEDMODE",
	"D3DPRESENTFLAG_OVERLAY_LIMITEDRGB",
	"D3DPRESENTFLAG_OVERLAY_YCbCr_BT709",
	"D3DPRESENTFLAG_OVERLAY_YCbCr_xvYCC",
	"D3DPRESENTFLAG_RESTRICTED_CONTENT",
	"D3DPRESENTFLAG_RESTRICT_SHARED_RESOURCE_DRIVER"
};

static inline const char* const StaticGetPresentFlagsString(const DWORD Flagss)
{
	static char staticBuffer[512] = {0};
	bool hasPresentFlags = false;
	for (unsigned x = 0; x < ARRAYSIZE(PresentFlags); ++x)
	{
		if (Flagss & PresentFlags[x])
		{
#pragma warning(push)
#pragma warning(disable:4996)
			if (hasPresentFlags)
				strcat(staticBuffer, " | ");
			strcat(staticBuffer, PresentFlagStrings[x]);
#pragma warning(pop)
			hasPresentFlags = true;
		}
	}
	return staticBuffer;
}

static inline const char* const GetPresentationIntervalString(const UINT PresentInterval)
{
	switch (PresentInterval)
	{
	case D3DPRESENT_INTERVAL_DEFAULT:
		return "D3DPRESENT_INTERVAL_DEFAULT";
	case D3DPRESENT_INTERVAL_ONE:
		return "D3DPRESENT_INTERVAL_ONE";
	case D3DPRESENT_INTERVAL_TWO:
		return "D3DPRESENT_INTERVAL_TWO";
	case D3DPRESENT_INTERVAL_THREE:
		return "D3DPRESENT_INTERVAL_THREE";
	case D3DPRESENT_INTERVAL_FOUR:
		return "D3DPRESENT_INTERVAL_FOUR";
	case D3DPRESENT_INTERVAL_IMMEDIATE:
		return "D3DPRESENT_INTERVAL_IMMEDIATE";
	default:
		return "Unknown";
	}
}

COM_DECLSPEC_NOTHROW HRESULT STDMETHODCALLTYPE IDirect3D9Hook::CreateDevice(THIS_ UINT Adapter, D3DDEVTYPE DeviceType, HWND hFocusWindow, 
		DWORD BehaviorFlags, D3DPRESENT_PARAMETERS* pPresentationParameters, IDirect3DDevice9** ppReturnedDeviceInterface)
{
	D3DPRESENT_PARAMETERS modifiedParams = *pPresentationParameters;
	IDirect3DDevice9Hook::ModifyPresentParameters(modifiedParams);

#ifdef _DEBUG
	if (!(BehaviorFlags & (D3DCREATE_HARDWARE_VERTEXPROCESSING | D3DCREATE_SOFTWARE_VERTEXPROCESSING | D3DCREATE_MIXED_VERTEXPROCESSING) ) )
	{
		// At least one of Hardware, Software, or Mixed must be specified on device-creation!
		DbgBreakPrint("Error: At least one of Hardware, Software, or Mixed must be specified at device-creation time!");
	}
	if (__popcnt(BehaviorFlags & (D3DCREATE_HARDWARE_VERTEXPROCESSING | D3DCREATE_SOFTWARE_VERTEXPROCESSING | D3DCREATE_MIXED_VERTEXPROCESSING) ) > 1)
	{
		// Only one of Hardware, Software, or Mixed is allowed to be specified
		DbgBreakPrint("Error: Only one of Hardware, Software, or Mixed must be specified at device-creation time!");
	}
#endif

	if (ForceMultithreaded.Unsigned() == DFO_ForceEnable)
		BehaviorFlags |= D3DCREATE_MULTITHREADED;
	else if (ForceMultithreaded.Unsigned() == DFO_ForceDisable)
		BehaviorFlags &= (~D3DCREATE_MULTITHREADED);

	LPDIRECT3DDEVICE9 realDevice = NULL;
	const HRESULT ret = d3d9->CreateDevice(Adapter, DeviceType, hFocusWindow, BehaviorFlags, &modifiedParams, &realDevice);
	if (FAILED(ret) || !realDevice)
	{
		*ppReturnedDeviceInterface = NULL;
		MessageBoxA(NULL, "Failed createdevice", NULL, MB_OK);
		return ret;
	}

	if (MessageboxOnCreateDevice.Bool() )
	{
#pragma warning(push)
#pragma warning(disable:4996)
		char adapterString[32] = {0};
		if (Adapter == D3DADAPTER_DEFAULT)
			strcpy(adapterString, "D3DADAPTER_DEFAULT (0)");
		else
			sprintf(adapterString, "%u", Adapter);
		char createDeviceSettings[4096] = {0};
		sprintf(createDeviceSettings, "CreateDevice params:\n\tAdapter = %s\n\tDeviceType = %s\n\tBehaviorFlags = 0x%08X (%s)\n\tppBackBufferWidth = %u\n\tppBackBufferHeight = %u\n\tppBackBufferFormat = %s(%i)\n\tppBackBufferCount = %u\n\tppMultiSampleType = %i\n\tppMultiSampleQuality = %u\n\tppSwapEffect = %s\n\tppWindowed = %s\n\tppEnableAutoDepthStencil = %s\n\tppAutoDepthStencilFormat = %s (%i)\n\tppFlags = 0x%08X (%s)\n\tppFullScreen_RefreshRateInHz = %u\n\tppPresentationInterval = %s (%u)\n\n",
			adapterString, GetDeviceTypeString(DeviceType), BehaviorFlags, StaticGetDeviceBehaviorFlagsString(BehaviorFlags), modifiedParams.BackBufferWidth, modifiedParams.BackBufferHeight, GetBackbufferFormatString(modifiedParams.BackBufferFormat), modifiedParams.BackBufferFormat, modifiedParams.BackBufferCount, modifiedParams.MultiSampleType, modifiedParams.MultiSampleQuality, SwapEffectToString(modifiedParams.SwapEffect), modifiedParams.Windowed ? "TRUE" : "FALSE", modifiedParams.EnableAutoDepthStencil ? "TRUE" : "FALSE", GetDepthbufferFormatString(modifiedParams.AutoDepthStencilFormat), modifiedParams.AutoDepthStencilFormat, modifiedParams.Flags, StaticGetPresentFlagsString(modifiedParams.Flags), modifiedParams.FullScreen_RefreshRateInHz, GetPresentationIntervalString(modifiedParams.PresentationInterval), modifiedParams.PresentationInterval);
#pragma warning(pop)
		OutputDebugStringA(createDeviceSettings);
		printf("Driver init\n%s\n", createDeviceSettings);
		MessageBoxA(NULL, createDeviceSettings, "CreateDevice success.", NULL);
	}

	if (GetKeyState(VK_SCROLL) & 0x0001)
	{
		MessageBoxA(NULL, "Warning: Scroll Lock is toggled on. The driver is configured to make this STEP-FRAME mode. Please disable Scroll Lock to advance frames normally!", "Warning!", MB_OK);
	}

	void* const alignedAlloc = _aligned_malloc(sizeof(IDirect3DDevice9Hook), 16);
	IDirect3DDevice9Hook* const newHookDevice = new (alignedAlloc) IDirect3DDevice9Hook(realDevice, this);
	*ppReturnedDeviceInterface = newHookDevice;
	newHookDevice->InitializeState(modifiedParams, DeviceType, BehaviorFlags, hFocusWindow);

	return ret;
}
