#pragma once

#include "IBaseDeviceComms.h"
#include "..\..\Endpoints\Common\EndpointDLLInterface.h"
#include <vector>

__declspec(align(16) ) struct INullDeviceComms : public IBaseDeviceComms
{
	INullDeviceComms();

	virtual ~INullDeviceComms()
	{
		IBaseDeviceComms::~IBaseDeviceComms();
	}

	virtual __declspec(nothrow) HRESULT __stdcall SendLoop(const BYTE* const sendBuffer, const unsigned len) override;
	virtual __declspec(nothrow) HRESULT __stdcall RecvLoop(BYTE* const recvBuffer, const unsigned len) override;
	virtual bool EndpointSupportsMemReadback() const override;
	void HandlePacket(const genericCommand* const packet);

private:
	std::vector<genericCommand> localResponsePackets;
};
