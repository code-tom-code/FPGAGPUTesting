// This is the DLL Endpoint interface header.
// It should be shared between all of the various DLL endpoints.
#pragma once

#include "..\\..\\Software_d3d9_Driver\\Driver\\PacketDefs.h"

typedef void (__stdcall *ReturnMessageSignature)(const genericCommand* const D2HReplyPacket);

enum DLLEndpointMajorVersions : unsigned short
{
	InitialVersion = 1,
};

// These options must always be a power of 2 so that they can be bitwise-OR'd together:
enum EndpointOptionsFlags : unsigned
{
	NoWindow = 1, // This endpoint does not spawn a window. Do not call the SpawnWindow() function for it
};

static const unsigned DLLINFO_MAGIC = 'EDLL';

// It is the responsibility of the Caller/Host to ensure that this struct contains correct values. The Callee/Endpoint only
// checks the MAGIC field and the major version number to check for compatibility, and nothing else!
struct DLLInfo
{
	// This is always the same magic fourcc. Check this for validity first!
	// This field *must* be filled in by the host/caller prior to the call to GetDLLInfo(), as it is checked by the callee/endpoint.
	const unsigned MAGIC = DLLINFO_MAGIC;

	// Major versions are only compatible with other matching major versions.
	// This field *must* be filled in by the host/caller prior to the call to GetDLLInfo(), as it is checked by the callee/endpoint.
	unsigned short versionMajor = InitialVersion;
	unsigned short versionMinor = 0; // Minor versions are not allowed to break compatability with their major version number

	char endpointName[64] = {0}; // This must end in a null terminator!

	// All function pointers in this function table *must* be filled-in by the loaded endpoint DLL (except SpawnWindow() is not required if this is a windowless endpoint as specified in the endpoint options flags):
	struct _functionTable
	{
		bool (__stdcall *InitEndpoint)(const ReturnMessageSignature D2HReplyCallback); // Call this function first from the host! Returns true on success, or false on failure.
		bool (__stdcall *SpawnWindow)(void* hwndPtrOut); // Host calls this to create a window for this DLL. Returns true on success, or false on failure. Do not call this function if this is a windowless endpoint!
		void (__stdcall *ProcessNewMessage)(const genericCommand* H2DCommandPacket); // Host calls this function every time a new message needs to be processed
		void (__stdcall *ShutdownEndpoint)(); // Call this before calling FreeLibrary() to unload this DLL
	} H2DFunctions = {0};

	EndpointOptionsFlags endpointOptions = (const EndpointOptionsFlags)0;
};

// Typedef'd version for people who are calling GetProcAddress:
typedef bool (__stdcall* GetDLLInfoFuncType)(DLLInfo* const outDLLInfo);

// Forwards-declare our interface function:
// It is legal for the host process to call GetDLLInfo() as many times as they would like. It should not allocate anything or change any state!
// Function returns true on success, or false on failure.
extern "C" bool __stdcall GetDLLInfo(DLLInfo* const outDLLInfo);
