#include "IVirtualDeviceComms.h"
#include <stdio.h>

IVirtualDeviceComms::IVirtualDeviceComms(IBaseDeviceComms* const _optionalProxyComms/* = NULL*/) : IBaseDeviceComms(), optionalProxyComms(_optionalProxyComms)
{
	SetGlobalDeviceComms(this);
}

/*virtual */__declspec(nothrow) HRESULT __stdcall IVirtualDeviceComms::SendLoop(const BYTE* const sendBuffer, const unsigned len) /*override*/
{
	if (optionalProxyComms)
		return optionalProxyComms->SendLoop(sendBuffer, len);
	else
		return S_OK;
}

/*virtual*/ __declspec(nothrow) HRESULT __stdcall IVirtualDeviceComms::RecvLoop(BYTE* const recvBuffer, const unsigned len) /*override*/
{
	if (optionalProxyComms)
		return optionalProxyComms->RecvLoop(recvBuffer, len);
	else
		return S_OK;
}
