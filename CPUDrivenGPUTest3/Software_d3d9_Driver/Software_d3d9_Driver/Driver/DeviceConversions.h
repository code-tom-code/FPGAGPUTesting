#pragma once

// This header is for helpful conversion functions between D3D types and Device types

#include "..\d3d9include.h"
#include "PacketDefs.h"

const eCmpFunc ConvertToDeviceCmpFunc(const D3DCMPFUNC cmpFunc);
const eDepthFormat ConvertToDeviceDepthFormat(const D3DFORMAT zFormat);
const eCullMode ConvertToDeviceCullMode(const D3DCULL cullMode);
const ePrimTopology ConvertToDevicePrimTopology(const D3DPRIMITIVETYPE primType);
const eIndexFormat ConvertToDeviceIndexFormat(const class IDirect3DIndexBuffer9Hook* const indexBuffer, const D3DFORMAT indexBufferFormat);
const eBlendMask ConvertToDeviceBlendMask(const DWORD colorWriteEnable);
const eTexFormat ConvertToDeviceTextureFormat(const D3DFORMAT texFormat);
const eTexcoordAddressingMode ConvertToDeviceTexAddressMode(const D3DTEXTUREADDRESS texAddressMode);
void ComputeTextureChannelMUX(const D3DFORMAT d3dTextureFormat, eTexChannelMUX& rChannel, eTexChannelMUX& gChannel, eTexChannelMUX& bChannel, eTexChannelMUX& aChannel);

