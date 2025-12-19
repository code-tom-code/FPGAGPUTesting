#pragma once

#include "..\\Common\\EndpointDLLInterface.h"

const bool InitRecording();
void RecordNewIncomingPacket(const genericCommand* H2DCommandPacket);
void ShutdownRecording();

// This callback function pointer gets populated when our DLL is initialized.
extern ReturnMessageSignature E2HReturnMessageCallback;
