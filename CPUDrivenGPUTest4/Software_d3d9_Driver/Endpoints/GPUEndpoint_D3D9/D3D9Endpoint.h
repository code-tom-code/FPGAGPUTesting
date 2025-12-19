#pragma once

#include "..\\Common\\EndpointDLLInterface.h"

// Creates a new D3D9 device:
const bool D3D9CreateDevice(HWND renderWindow, const unsigned windowWidth, const unsigned windowHeight);

// Shuts down and destroys the existing D3D9 device:
void D3D9ShutdownDevice();

// This is our main packet-handling function
void D3D9HandleIncomingPacket(const genericCommand* const newGenericPacket);

const int PumpWindowsMessageLoop(HWND wnd);

// This callback function pointer gets populated when our DLL is initialized.
extern ReturnMessageSignature E2HReturnMessageCallback;
