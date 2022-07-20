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

__declspec(nothrow) /*virtual*/ void IVirtualDeviceComms::EndFrame() /*override*/
{
	if (optionalProxyComms)
		optionalProxyComms->EndFrame();
}

/*virtual*/ void IVirtualDeviceComms::IncrementSentPacket(const unsigned packetSizeBytes) /*override*/
{
	if (optionalProxyComms)
		optionalProxyComms->IncrementSentPacket(packetSizeBytes);
}

/*virtual*/ void IVirtualDeviceComms::IncrementRecvPacket(const unsigned packetSizeBytes) /*override*/
{
	if (optionalProxyComms)
		optionalProxyComms->IncrementRecvPacket(packetSizeBytes);
}

/*virtual*/ void IVirtualDeviceComms::StoreSentPacket(const genericCommand& sentPacket) /*override*/
{
	if (optionalProxyComms)
		optionalProxyComms->StoreSentPacket(sentPacket);
}

/*virtual*/ void IVirtualDeviceComms::StoreRecvdPacket(const genericCommand& recvdPacket) /*override*/
{
	if (optionalProxyComms)
		optionalProxyComms->StoreRecvdPacket(recvdPacket);
}
