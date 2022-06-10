#pragma once

#include "IBaseDeviceComms.h"

__declspec(align(16) ) struct ISerialDeviceComms : public IBaseDeviceComms
{
	ISerialDeviceComms(const char* const localCOMPortName = "COM3", const unsigned baudRate = 921600, const BYTE parityType = ODDPARITY);

	virtual ~ISerialDeviceComms()
	{
		IBaseDeviceComms::~IBaseDeviceComms();
	}

	virtual __declspec(nothrow) HRESULT __stdcall SendLoop(const BYTE* const sendBuffer, const unsigned len) override;
	virtual __declspec(nothrow) HRESULT __stdcall RecvLoop(BYTE* const recvBuffer, const unsigned len) override;

private:
	__declspec(nothrow) HRESULT __stdcall InternalInitComms();

	HANDLE hSerialComm = INVALID_HANDLE_VALUE;
	const char* connectedCOMPort = NULL;
	unsigned connectedBaudRate = 0;
	BYTE connectedParity = NOPARITY;
};
