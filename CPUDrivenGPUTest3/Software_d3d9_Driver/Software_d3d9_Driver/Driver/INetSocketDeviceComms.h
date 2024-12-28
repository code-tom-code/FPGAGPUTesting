#pragma once

#include "IBaseDeviceComms.h"
#include <WinSock2.h>

__declspec(align(16) ) struct INetSocketDeviceComms : public IBaseDeviceComms
{
	INetSocketDeviceComms();

	virtual ~INetSocketDeviceComms()
	{
		IBaseDeviceComms::~IBaseDeviceComms();
	}

	virtual __declspec(nothrow) HRESULT __stdcall SendLoop(const BYTE* const sendBuffer, const unsigned len) override;
	virtual __declspec(nothrow) HRESULT __stdcall RecvLoop(BYTE* const recvBuffer, const unsigned len) override;

private:
	SOCKET connectedSocket = INVALID_SOCKET;
	SOCKADDR_IN deviceAddr = {0};
};
