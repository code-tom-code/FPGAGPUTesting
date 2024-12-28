#include "IBroadcastVirtualDeviceComms.h"

IBroadcastVirtualDeviceComms::IBroadcastVirtualDeviceComms(IBaseDeviceComms* const pInitialPrimaryComms) : IBaseDeviceComms(), primaryComms(pInitialPrimaryComms)
{
	SetGlobalDeviceComms(this);
}

void IBroadcastVirtualDeviceComms::AddNewSecondaryBroadcastTarget(IBaseDeviceComms* const newBroadcastTarget)
{
	const unsigned existingBroadcastTargetCount = (const unsigned)broadcastTargets.size();
	for (unsigned targetID = 0; targetID < existingBroadcastTargetCount; ++targetID)
	{
		if (broadcastTargets[targetID] == newBroadcastTarget)
		{
#ifdef _DEBUG
			__debugbreak(); // No adding duplicate targets to our list!
#endif
			return;
		}
	}

	broadcastTargets.push_back(newBroadcastTarget);
}

/*virtual */__declspec(nothrow) HRESULT __stdcall IBroadcastVirtualDeviceComms::SendLoop(const BYTE* const sendBuffer, const unsigned len) /*override*/
{
	const unsigned numBroadcastTargets = (const unsigned)broadcastTargets.size();
	for (unsigned targetID = 0; targetID < numBroadcastTargets; ++targetID)
	{
		broadcastTargets[targetID]->SendLoop(sendBuffer, len);
	}
	return primaryComms->SendLoop(sendBuffer, len);
}

/*virtual*/ __declspec(nothrow) HRESULT __stdcall IBroadcastVirtualDeviceComms::RecvLoop(BYTE* const recvBuffer, const unsigned len) /*override*/
{
	const unsigned numBroadcastTargets = (const unsigned)broadcastTargets.size();
	for (unsigned targetID = 0; targetID < numBroadcastTargets; ++targetID)
	{
		broadcastTargets[targetID]->RecvLoop(recvBuffer, len);
	}
	return primaryComms->RecvLoop(recvBuffer, len);
}

__declspec(nothrow) /*virtual*/ void IBroadcastVirtualDeviceComms::EndFrame() /*override*/
{
	const unsigned numBroadcastTargets = (const unsigned)broadcastTargets.size();
	for (unsigned targetID = 0; targetID < numBroadcastTargets; ++targetID)
	{
		broadcastTargets[targetID]->EndFrame();
	}
	primaryComms->EndFrame();
}

/*virtual*/ void IBroadcastVirtualDeviceComms::IncrementSentPacket(const unsigned packetSizeBytes) /*override*/
{
	const unsigned numBroadcastTargets = (const unsigned)broadcastTargets.size();
	for (unsigned targetID = 0; targetID < numBroadcastTargets; ++targetID)
	{
		broadcastTargets[targetID]->IncrementSentPacket(packetSizeBytes);
	}
	primaryComms->IncrementSentPacket(packetSizeBytes);
}

/*virtual*/ void IBroadcastVirtualDeviceComms::IncrementRecvPacket(const unsigned packetSizeBytes) /*override*/
{
	const unsigned numBroadcastTargets = (const unsigned)broadcastTargets.size();
	for (unsigned targetID = 0; targetID < numBroadcastTargets; ++targetID)
	{
		broadcastTargets[targetID]->IncrementRecvPacket(packetSizeBytes);
	}
	primaryComms->IncrementRecvPacket(packetSizeBytes);
}

/*virtual*/ void IBroadcastVirtualDeviceComms::StoreSentPacket(const genericCommand& sentPacket) /*override*/
{
	const unsigned numBroadcastTargets = (const unsigned)broadcastTargets.size();
	for (unsigned targetID = 0; targetID < numBroadcastTargets; ++targetID)
	{
		broadcastTargets[targetID]->StoreSentPacket(sentPacket);
	}
	primaryComms->StoreSentPacket(sentPacket);
}

/*virtual*/ void IBroadcastVirtualDeviceComms::StoreRecvdPacket(const genericCommand& recvdPacket) /*override*/
{
	const unsigned numBroadcastTargets = (const unsigned)broadcastTargets.size();
	for (unsigned targetID = 0; targetID < numBroadcastTargets; ++targetID)
	{
		broadcastTargets[targetID]->StoreRecvdPacket(recvdPacket);
	}
	primaryComms->StoreRecvdPacket(recvdPacket);
}

/*virtual*/ bool IBroadcastVirtualDeviceComms::EndpointSupportsMemReadback() const /*override*/
{
	return primaryComms->EndpointSupportsMemReadback();
}
