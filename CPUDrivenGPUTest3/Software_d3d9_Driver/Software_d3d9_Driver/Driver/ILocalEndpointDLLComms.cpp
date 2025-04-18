#include "ILocalEndpointDLLComms.h"
#include <stdio.h>

static const DLLEndpointMajorVersions hostMajorVersion = InitialVersion;
static const unsigned short hostMinorVersion = 0;

thread_local ILocalEndpointDLLComms* currentLocalEndpointContext = NULL;

/*static*/ void __stdcall ILocalEndpointDLLComms::ReturnMessageHandlerFunc(const genericCommand* const D2HReplyPacket)
{
#ifdef _DEBUG
	if (currentLocalEndpointContext == NULL)
	{
		__debugbreak(); // Error: This function should not be called outside of the context of a ProcessNewMessage()!
	}
	if (D2HReplyPacket == NULL)
	{
		__debugbreak(); // Error: Don't ever pass a null packet pointer to this function!
	}
#endif

	currentLocalEndpointContext->localResponsePackets.push_back(*D2HReplyPacket);
}

ILocalEndpointDLLComms::ILocalEndpointDLLComms(const char* const endpointDLL) : IBaseDeviceComms()
{
	SetGlobalDeviceComms(this);

#ifdef _DEBUG
	if (!endpointDLL || !*endpointDLL)
	{
		__debugbreak(); // Don't call this function with a null or empty path!
	}
#endif

	endpointLoadedDLL = LoadLibraryA(endpointDLL);
	if (!endpointLoadedDLL)
	{
		const unsigned lastErr = GetLastError();
#ifdef _DEBUG
		__debugbreak();
#endif
		printf("Error: Failed to LoadLibraryA(\"%s\"). GLE: %u\n", endpointDLL, lastErr);
		return;
	}

	const GetDLLInfoFuncType getDllInfoPtr = reinterpret_cast<const GetDLLInfoFuncType>(GetProcAddress(endpointLoadedDLL, "GetDLLInfo") );
	if (!getDllInfoPtr)
	{
		printf("Error in GetProcAddress(\"GetDLLInfo\"). GLE: %u\n", GetLastError() );
		FreeLibrary(endpointLoadedDLL);
		return;
	}

	endpointInfo.versionMajor = hostMajorVersion;
	endpointInfo.versionMinor = hostMinorVersion;
	if (!(*getDllInfoPtr)(&endpointInfo) )
	{
		// Version mismatches are the most common source of failure here:
		if (endpointInfo.MAGIC == DLLINFO_MAGIC && endpointInfo.versionMajor != hostMajorVersion)
			printf("Error in GetDLLInfo(): Incompatible host/endpoint versions. Host version: %u.%u, Endpoint version: %u.%u\n", hostMajorVersion, hostMinorVersion, endpointInfo.versionMajor, endpointInfo.versionMinor);
		else
			printf("Unknown error in GetDLLInfo().\n");
		FreeLibrary(endpointLoadedDLL);
		return;
	}

	if (endpointInfo.MAGIC != DLLINFO_MAGIC)
	{
		printf("Error: MAGIC field check failed. Found 0x%08X, expected 0x%08X\n", endpointInfo.MAGIC, DLLINFO_MAGIC);
		FreeLibrary(endpointLoadedDLL);
		return;
	}

	if (endpointInfo.versionMajor != hostMajorVersion)
	{
		printf("Error: Major version incompatability detected. Host version: %u.%u, Endpoint version: %u.%u\n", hostMajorVersion, hostMinorVersion, endpointInfo.versionMajor, endpointInfo.versionMinor);
		FreeLibrary(endpointLoadedDLL);
		return;
	}

	if (!endpointInfo.H2DFunctions.InitEndpoint || 
		!endpointInfo.H2DFunctions.ProcessNewMessage || 
		!endpointInfo.H2DFunctions.ShutdownEndpoint || 
		!endpointInfo.H2DFunctions.EndFrame || 
		(!(endpointInfo.endpointOptions & NoWindow) && (!endpointInfo.H2DFunctions.SpawnWindow) ) )
	{
		printf("Error: Endpoint DLL does not implement all required functions in DLL interface!\n");
		FreeLibrary(endpointLoadedDLL);
		return;
	}

	printf("Loaded Endpoint DLL into host process: \"%s\"\n", endpointInfo.endpointName);

	if (!(*endpointInfo.H2DFunctions.InitEndpoint)(&ReturnMessageHandlerFunc) )
	{
		printf("Error in InitEndpoint(). Endpoint \"%s\" failed to init!\n", endpointInfo.endpointName);
#ifdef _DEBUG
		__debugbreak();
#endif
		FreeLibrary(endpointLoadedDLL);
		return;
	}

	if (!(endpointInfo.endpointOptions & NoWindow) )
	{
		if (!(*endpointInfo.H2DFunctions.SpawnWindow)(&endpointWindow) )
		{
			printf("Error in SpawnWindow(). Endpoint window failed to spawn!\n");
			(*endpointInfo.H2DFunctions.ShutdownEndpoint)();
			FreeLibrary(endpointLoadedDLL);
			return;
		}
	}

	printf("Endpoint is running!\n");
}

/*virtual */__declspec(nothrow) HRESULT __stdcall ILocalEndpointDLLComms::SendLoop(const BYTE* const sendBuffer, const unsigned len) /*override*/
{
#ifdef _DEBUG
	if (len == 0)
	{
		__debugbreak(); // Don't call this with a length of 0!
	}
	if (len % sizeof(genericCommand) != 0)
	{
		__debugbreak(); // Error: Expected only packet data to be sent on this channel!
	}
#endif

	currentLocalEndpointContext = this;

	unsigned remainingLen = len;
	const genericCommand* currentPacketPtr = reinterpret_cast<const genericCommand* const>(sendBuffer);
	while (remainingLen >= sizeof(genericCommand) )
	{
		(*endpointInfo.H2DFunctions.ProcessNewMessage)(currentPacketPtr);
		remainingLen -= sizeof(genericCommand);
		++currentPacketPtr;
	}

	currentLocalEndpointContext = NULL;

	return S_OK;
}

/*virtual*/ __declspec(nothrow) HRESULT __stdcall ILocalEndpointDLLComms::RecvLoop(BYTE* const recvBuffer, const unsigned len) /*override*/
{
#ifdef _DEBUG
	if (len == 0)
	{
		__debugbreak(); // Don't call this with a length of 0!
	}
	if (len % sizeof(genericCommand) != 0)
	{
		__debugbreak(); // Error: Expected only packet data to be sent on this channel!
	}
	if (len > localResponsePackets.size() * sizeof(genericCommand) )
	{
		__debugbreak(); // Error: Read data mismatch!
	}
#endif
	memcpy(recvBuffer, &localResponsePackets.front(), len);
	if (localResponsePackets.size() * sizeof(genericCommand) == len)
	{
		localResponsePackets.clear();
	}
	else
	{
		const unsigned numElementsToRemove = len / sizeof(genericCommand);
		localResponsePackets.erase(localResponsePackets.begin(), localResponsePackets.begin() + numElementsToRemove);
	}
	return S_OK;
}

/*virtual*/ bool ILocalEndpointDLLComms::EndpointSupportsMemReadback() const /*override*/
{
	return (endpointInfo.endpointOptions & EndpointOptionsFlags::NoMemReadSupport) ? false : true;
}
