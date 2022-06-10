#pragma once

#include "IBaseDeviceComms.h"

__declspec(align(16) ) struct IVirtualDeviceComms : public IBaseDeviceComms
{
	IVirtualDeviceComms(IBaseDeviceComms* const optionalProxyComms = NULL);

	virtual ~IVirtualDeviceComms()
	{
		IBaseDeviceComms::~IBaseDeviceComms();
	}

	virtual __declspec(nothrow) HRESULT __stdcall SendLoop(const BYTE* const sendBuffer, const unsigned len) override;
	virtual __declspec(nothrow) HRESULT __stdcall RecvLoop(BYTE* const recvBuffer, const unsigned len) override;

private:
	__declspec(nothrow) HRESULT __stdcall InternalInitComms();

	IBaseDeviceComms* const optionalProxyComms = NULL;
};
