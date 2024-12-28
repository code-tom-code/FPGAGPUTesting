#include "IRemoteProcessIPCComms.h"
#include "..\SharedMemIPC\SharedMemIPC.h"
#include <stdio.h>

// TODO: Don't hardcode this path:
static const char* const IPCEndpointHostProcessPath = 
#ifdef _DEBUG
"C:\\Users\\Tom\\Documents\\Visual Studio 2017\\Projects\\Software_d3d9_Driver\\Debug\\Endpoints\\EndpointDLL_IPCHost.exe";
#else
"C:\\Users\\Tom\\Documents\\Visual Studio 2017\\Projects\\Software_d3d9_Driver\\Release\\Endpoints\\EndpointDLL_IPCHost.exe";
#endif

IRemoteProcessIPCComms::IRemoteProcessIPCComms() : IBaseDeviceComms(), remoteConnectionsManager(new IPC_ConnectionManager(IPCM_Server) )
{
	SetGlobalDeviceComms(this);

	remoteConnectionsManager->ServerInitDirectory();
}

const bool IRemoteProcessIPCComms::LaunchNewRemoteIPCProcess(const char* const endpointDLLFilepath)
{
	STARTUPINFOA processStartInfo = {0};
	processStartInfo.cb = sizeof(processStartInfo);
	processStartInfo.wShowWindow = SW_SHOWNOACTIVATE;
	processStartInfo.dwFlags = STARTF_USESHOWWINDOW;
	PROCESS_INFORMATION newProcessInfo = {0};

	const unsigned previousClientsCount = remoteConnectionsManager->GetCurrentActiveConnectionCount();

	DWORD processCreationFlags = NORMAL_PRIORITY_CLASS | CREATE_NEW_CONSOLE | CREATE_NEW_PROCESS_GROUP;
#ifdef _DEBUG
	processCreationFlags |= CREATE_SUSPENDED;
#endif

#ifdef _DEBUG
	if (!IPCEndpointHostProcessPath || GetFileAttributesA(IPCEndpointHostProcessPath) == INVALID_FILE_ATTRIBUTES)
	{
		__debugbreak(); // Error: Invalid loader-EXE path, or file not found! You may need to recompile the loader EXE!
	}
	if (!endpointDLLFilepath || GetFileAttributesA(endpointDLLFilepath) == INVALID_FILE_ATTRIBUTES)
	{
		__debugbreak(); // Error: Invalid load-DLL path, or file not found!
	}
#endif

	// Make sure to enclose our DLL path in quotes or else any spaces in the path will cause the arguments parser to assume that they are separate arguments:
	std::string endpointDLLFullPathBuilder(IPCEndpointHostProcessPath);
	endpointDLLFullPathBuilder.insert(endpointDLLFullPathBuilder.begin(), '"');
	endpointDLLFullPathBuilder.insert(endpointDLLFullPathBuilder.end(), '"');
	endpointDLLFullPathBuilder.insert(endpointDLLFullPathBuilder.end(), ' ');
	endpointDLLFullPathBuilder.insert(endpointDLLFullPathBuilder.end(), '"');
	endpointDLLFullPathBuilder.append(endpointDLLFilepath);
	endpointDLLFullPathBuilder.insert(endpointDLLFullPathBuilder.end(), '"');

	if (!CreateProcessA(NULL, const_cast<char* const>(endpointDLLFullPathBuilder.c_str() ), NULL, NULL, FALSE, processCreationFlags, NULL, NULL, &processStartInfo, &newProcessInfo) )
	{
		const DWORD lastErr = GetLastError();
#ifdef _DEBUG
		printf("Error: Failure in CreateProcessA() with process \"%s\" and command line \"%s\". GLE: %u\n", IPCEndpointHostProcessPath, endpointDLLFilepath, lastErr);
#endif
		return false;
	}

#ifdef _DEBUG
	// If you have a breakpoint here, this is where you would attach the debugger to the child process!
	ResumeThread(newProcessInfo.hThread);
#endif

	// Close our newly-created process handles so that we aren't leaking any handles!
	CloseHandle(newProcessInfo.hProcess);
	CloseHandle(newProcessInfo.hThread);

	// Technically this could potentially deadlock in case one of the existing clients disconnects while we're waiting for the new client (whose process we just launched) is connecting
	while (remoteConnectionsManager->GetCurrentActiveConnectionCount() < previousClientsCount + 1)
	{
		Sleep(1);
		remoteConnectionsManager->ServerUpdateDirectoryAndAcceptNewClients();
	}

	return true;
}

/*virtual */__declspec(nothrow) HRESULT __stdcall IRemoteProcessIPCComms::SendLoop(const BYTE* const sendBuffer, const unsigned len) /*override*/
{
	remoteConnectionsManager->ServerUpdateDirectoryAndAcceptNewClients();
	remoteConnectionsManager->ServerBroadcastDataToAllClients(sendBuffer, len);
	return S_OK;
}

/*virtual*/ __declspec(nothrow) HRESULT __stdcall IRemoteProcessIPCComms::RecvLoop(BYTE* const recvBuffer, const unsigned len) /*override*/
{
	remoteConnectionsManager->ServerUpdateDirectoryAndAcceptNewClients();
	for (unsigned x = 0; x < ARRAYSIZE(remoteConnectionsManager->ActiveConnections); ++x)
	{
		if (remoteConnectionsManager->ActiveConnections[x].RingBufferMappedMemory)
		{
			remoteConnectionsManager->ActiveConnections[x].RingBufferMappedMemory->C2SRing.ReadData(recvBuffer, len);
		}
	}
	return S_OK;
}

