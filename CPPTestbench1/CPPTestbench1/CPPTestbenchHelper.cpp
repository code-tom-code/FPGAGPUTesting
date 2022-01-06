#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "CPPTestbench.h"

/*static*/ std::vector<port*> port::registeredPorts;

/*static*/ void port::RegisterNewPort(port* const newPort)
{
	const unsigned numRegisteredPorts = (const unsigned)registeredPorts.size();
	for (unsigned registeredID = 0; registeredID < numRegisteredPorts; ++registeredID)
	{
		const port* const checkPort = registeredPorts[registeredID];
		if (checkPort == newPort)
		{
#ifdef _DEBUG
			__debugbreak(); // Error: Duplicate port pointer found!
#endif
			return;
		}

#pragma warning(push)
#pragma warning(disable:4996)
		if (stricmp(checkPort->portname, newPort->portname) == 0)
#pragma warning(pop)
		{
#ifdef _DEBUG
			__debugbreak(); // Error! Duplicate port name detected!
#endif
			return;
		}
	}

	registeredPorts.push_back(newPort);
}

/*static*/ void port::UpdateAllInputPortData()
{
	const unsigned numRegisteredPorts = (const unsigned)registeredPorts.size();
	for (unsigned registeredID = 0; registeredID < numRegisteredPorts; ++registeredID)
	{
		port* const checkPort = registeredPorts[registeredID];

		// Update the data from VHDL to our CPU-side copy
		if (checkPort->portDir & PD_OUT)
		{
			checkPort->UpdateReadPortData();
		}
	}
}
