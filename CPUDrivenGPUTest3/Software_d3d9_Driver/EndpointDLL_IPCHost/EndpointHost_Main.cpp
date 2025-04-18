#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <commdlg.h>
#include <stdio.h>
#include "..\Software_d3d9_Driver\SharedMemIPC\SharedMemIPC.h"
#include "..\Endpoints\Common\EndpointDLLInterface.h"

static const DLLEndpointMajorVersions hostMajorVersion = InitialVersion;
static const unsigned hostMinorVersion = 0u;
static HWND endpointWindow = NULL;
static bool bDone = false;
IPC_ConnectionManager gIPCConnManager(IPCM_Client);

extern "C" void __stdcall ReturnMessageImpl(const genericCommand* const D2HReplyPacket)
{
	if (!D2HReplyPacket)
	{
#ifdef _DEBUG
		__debugbreak(); // Error: May never call this function with a null pointer!
#endif
		return;
	}

	if (gIPCConnManager.ActiveConnections[0].RingBufferMappedMemory)
	{
		gIPCConnManager.ActiveConnections[0].RingBufferMappedMemory->C2SRing.WriteData(D2HReplyPacket, sizeof(*D2HReplyPacket) );
	}
#ifdef _DEBUG
	else
	{
		__debugbreak(); // Error: Returning message without an active IPC connection
	}
#endif

	if (D2HReplyPacket->type == command::PT_DISCONNECT)
	{
		bDone = true;
	}
}

int main(const int argc, const char* const argv[])
{
	const char* hostedDLL = NULL;
	char hostedDLLPath[MAX_PATH] = {0};
	if (argc > 1)
	{
		hostedDLL = argv[1];
	}
	else
	{
		OPENFILENAMEA openFilenameStruct = {0};
		openFilenameStruct.lStructSize = sizeof(openFilenameStruct);
		openFilenameStruct.lpstrFilter = "Endpoint DLL (*.dll)\0*.DLL";
		openFilenameStruct.lpstrFile = hostedDLLPath;
		openFilenameStruct.nMaxFile = ARRAYSIZE(hostedDLLPath);
		openFilenameStruct.lpstrTitle = "Load an Endpoint DLL to host";
		openFilenameStruct.Flags = OFN_ENABLESIZING | OFN_FILEMUSTEXIST | OFN_NOCHANGEDIR | OFN_PATHMUSTEXIST;
		openFilenameStruct.lpstrDefExt = "DLL";
		if (GetOpenFileNameA(&openFilenameStruct) )
		{
			hostedDLL = openFilenameStruct.lpstrFile;
		}
	}

	if (!hostedDLL || !*hostedDLL)
	{
		printf("Error: No Endpoint DLL selected! You must specify an Endpoint DLL to load.\n");
		return 1;
	}

	HMODULE loadedDLL = LoadLibraryA(hostedDLL);
	if (!loadedDLL)
	{
		printf("Error in LoadLibraryA(\"%s\"). GLE: %u\n", hostedDLL, GetLastError() );
		return 1;
	}

	const GetDLLInfoFuncType getDllInfoPtr = reinterpret_cast<const GetDLLInfoFuncType>(GetProcAddress(loadedDLL, "GetDLLInfo") );
	if (!getDllInfoPtr)
	{
		printf("Error in GetProcAddress(\"GetDLLInfo\"). GLE: %u\n", GetLastError() );
		FreeLibrary(loadedDLL);
		return 1;
	}

	DLLInfo dllInfo;
	dllInfo.versionMajor = hostMajorVersion;
	dllInfo.versionMinor = hostMinorVersion;
	if (!(*getDllInfoPtr)(&dllInfo) )
	{
		// Version mismatches are the most common source of failure here:
		if (dllInfo.MAGIC == DLLINFO_MAGIC && dllInfo.versionMajor != hostMajorVersion)
			printf("Error in GetDLLInfo(): Incompatible host/endpoint versions. Host version: %u.%u, Endpoint version: %u.%u\n", hostMajorVersion, hostMinorVersion, dllInfo.versionMajor, dllInfo.versionMinor);
		else
			printf("Unknown error in GetDLLInfo().\n");
		FreeLibrary(loadedDLL);
		return 1;
	}

	if (dllInfo.MAGIC != DLLINFO_MAGIC)
	{
		printf("Error: MAGIC field check failed. Found 0x%08X, expected 0x%08X\n", dllInfo.MAGIC, DLLINFO_MAGIC);
		FreeLibrary(loadedDLL);
		return 1;
	}

	if (dllInfo.versionMajor != hostMajorVersion)
	{
		printf("Error: Major version incompatability detected. Host version: %u.%u, Endpoint version: %u.%u\n", hostMajorVersion, hostMinorVersion, dllInfo.versionMajor, dllInfo.versionMinor);
		FreeLibrary(loadedDLL);
		return 1;
	}

	if (!dllInfo.H2DFunctions.InitEndpoint || 
		!dllInfo.H2DFunctions.ProcessNewMessage || 
		!dllInfo.H2DFunctions.ShutdownEndpoint || 
		!dllInfo.H2DFunctions.EndFrame || 
		(!(dllInfo.endpointOptions & NoWindow) && (!dllInfo.H2DFunctions.SpawnWindow) ) )
	{
		printf("Error: Endpoint DLL does not implement all required functions in DLL interface!\n");
		FreeLibrary(loadedDLL);
		return 1;
	}

	printf("Loaded Endpoint into host process: \"%s\"\n", dllInfo.endpointName);

	if (!(*dllInfo.H2DFunctions.InitEndpoint)(&ReturnMessageImpl) )
	{
		printf("Error in InitEndpoint(). Endpoint failed to init!\n");
		FreeLibrary(loadedDLL);
		return 1;
	}

	if (!(dllInfo.endpointOptions & NoWindow) )
	{
		if (!(*dllInfo.H2DFunctions.SpawnWindow)(&endpointWindow) )
		{
			printf("Error in SpawnWindow(). Endpoint window failed to spawn!\n");
			(*dllInfo.H2DFunctions.ShutdownEndpoint)();
			FreeLibrary(loadedDLL);
			return 1;
		}
	}

	printf("Endpoint is running!\n");

	// IPC connect
	printf("Connecting endpoint host process to IPC server...\n");
	gIPCConnManager.ClientRegisterWithServerDirectory();

	// Wait for host connection to complete
	while (gIPCConnManager.GetCurrentActiveConnectionCount() < 1)
	{
		Sleep(16);
	}

	printf("Endpoint host is connected to IPC server!\n");

	// Process IPC packets:
	genericCommand readCommandPackets[16];
	while (!bDone)
	{
		if (gIPCConnManager.ActiveConnections[0].RingBufferMappedMemory)
		{
			unsigned newReadSize = gIPCConnManager.ActiveConnections[0].RingBufferMappedMemory->S2CRing.GetCurrentSize();
			if (newReadSize > 0)
			{
				if (newReadSize % sizeof(genericCommand) != 0)
				{
					printf("Warning: Reading non-aligned packet size: %u bytes\n", newReadSize);
				}
				newReadSize = min(sizeof(readCommandPackets), newReadSize); // Don't read more packets than we can fit into our read buffer!
				const unsigned preReadSize = gIPCConnManager.ActiveConnections[0].RingBufferMappedMemory->S2CRing.readPtr;
				gIPCConnManager.ActiveConnections[0].RingBufferMappedMemory->S2CRing.ReadData(readCommandPackets, newReadSize);
				const unsigned postReadSize = gIPCConnManager.ActiveConnections[0].RingBufferMappedMemory->S2CRing.readPtr;
				const unsigned numReadPackets = newReadSize / sizeof(genericCommand);
				for (unsigned readPacketIndex = 0; readPacketIndex < numReadPackets; ++readPacketIndex)
				{
					const genericCommand& thisReadPacket = readCommandPackets[readPacketIndex];
					if (thisReadPacket.magicProtoHeader != PACKET_MAGIC_VALUE)
					{
						printf("Error: Incorrect packet magic byte %c, %u, %u\n", thisReadPacket.magicProtoHeader, preReadSize, postReadSize);
					}
					(*dllInfo.H2DFunctions.ProcessNewMessage)(&thisReadPacket);
				}
			}
			else
			{
				static DWORD lastIdleUpdateTimestamp = 0;
				const DWORD currentTimestamp = GetTickCount();
				if (currentTimestamp > lastIdleUpdateTimestamp)
				{
					lastIdleUpdateTimestamp = currentTimestamp;

					if (dllInfo.H2DFunctions.ProcessIdle)
					{
						(*dllInfo.H2DFunctions.ProcessIdle)();
					}
				}
			}
		}
	}

	printf("Done signal received. Shutting down endpoint host process...\n");

	(*dllInfo.H2DFunctions.ShutdownEndpoint)();

	FreeLibrary(loadedDLL);
	loadedDLL = NULL;
	return 0;
}
