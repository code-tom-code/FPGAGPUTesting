#pragma once

#include "IBaseDeviceComms.h"

struct IPC_ConnectionManager;

__declspec(align(16) ) struct IRemoteProcessIPCComms : public IBaseDeviceComms
{
	IRemoteProcessIPCComms();

	virtual ~IRemoteProcessIPCComms()
	{
		IBaseDeviceComms::~IBaseDeviceComms();
	}

	const bool LaunchNewRemoteIPCProcess(const char* const endpointDLLFilepath);

	virtual __declspec(nothrow) HRESULT __stdcall SendLoop(const BYTE* const sendBuffer, const unsigned len) override;
	virtual __declspec(nothrow) HRESULT __stdcall RecvLoop(BYTE* const recvBuffer, const unsigned len) override;

private:

	IPC_ConnectionManager* const remoteConnectionsManager;
};
