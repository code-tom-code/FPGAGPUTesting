#pragma once

#include "IBaseDeviceComms.h"
#include "..\..\Endpoints\Common\EndpointDLLInterface.h"
#include <vector>

__declspec(align(16) ) struct ILocalEndpointDLLComms : public IBaseDeviceComms
{
	ILocalEndpointDLLComms(const char* const endpointDLL);

	virtual ~ILocalEndpointDLLComms()
	{
		IBaseDeviceComms::~IBaseDeviceComms();
	}

	virtual __declspec(nothrow) HRESULT __stdcall SendLoop(const BYTE* const sendBuffer, const unsigned len) override;
	virtual __declspec(nothrow) HRESULT __stdcall RecvLoop(BYTE* const recvBuffer, const unsigned len) override;

	static void __stdcall ReturnMessageHandlerFunc(const genericCommand* const D2HReplyPacket);

private:
	HMODULE endpointLoadedDLL = NULL;
	HWND endpointWindow = NULL;
	DLLInfo endpointInfo;
	std::vector<genericCommand> localResponsePackets;
};
