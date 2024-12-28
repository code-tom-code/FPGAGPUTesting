#pragma once

#include "IBaseDeviceComms.h"
#include "NetSession/NetSession.h"

__declspec(align(16) ) struct INetSocketDeviceComms : public IBaseDeviceComms
{
	INetSocketDeviceComms();

	virtual ~INetSocketDeviceComms();

	virtual __declspec(nothrow) HRESULT __stdcall SendLoop(const BYTE* const sendBuffer, const unsigned len) override;
	virtual __declspec(nothrow) HRESULT __stdcall RecvLoop(BYTE* const recvBuffer, const unsigned len) override;
	virtual bool EndpointSupportsMemReadback() const override;

private:

	__declspec(nothrow) HRESULT __stdcall InternalInitComms();

	std::vector<Subpacket> convertedSubpackets;
	std::vector<Subpacket> incomingReadSubPackets;

	NetSession* session = NULL;
};
