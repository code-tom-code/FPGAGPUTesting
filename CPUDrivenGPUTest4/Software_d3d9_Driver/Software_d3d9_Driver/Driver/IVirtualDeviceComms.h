#pragma once

#include "IBaseDeviceComms.h"

__declspec(align(16) ) struct IVirtualDeviceComms : public IBaseDeviceComms
{
	IVirtualDeviceComms(IBaseDeviceComms* const optionalProxyComms = NULL);

	virtual ~IVirtualDeviceComms()
	{
		IBaseDeviceComms::~IBaseDeviceComms();
	}

	__declspec(nothrow) virtual void EndFrame() override;

	virtual __declspec(nothrow) HRESULT __stdcall SendLoop(const BYTE* const sendBuffer, const unsigned len) override;
	virtual __declspec(nothrow) HRESULT __stdcall RecvLoop(BYTE* const recvBuffer, const unsigned len) override;
	virtual void IncrementSentPacket(const unsigned packetSizeBytes) override;
	virtual void IncrementRecvPacket(const unsigned packetSizeBytes) override;
	virtual void StoreSentPacket(const genericCommand& sentPacket) override;
	virtual void StoreRecvdPacket(const genericCommand& recvdPacket) override;

private:
	IBaseDeviceComms* const optionalProxyComms = NULL;
};
