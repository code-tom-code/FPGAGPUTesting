#pragma once

#include "IBaseDeviceComms.h"
#include <vector>

__declspec(align(16) ) struct IBroadcastVirtualDeviceComms : public IBaseDeviceComms
{
	IBroadcastVirtualDeviceComms(IBaseDeviceComms* const pInitialPrimaryComms);

	virtual ~IBroadcastVirtualDeviceComms()
	{
		IBaseDeviceComms::~IBaseDeviceComms();
	}

	__declspec(nothrow) virtual void EndFrame() override;

	void AddNewSecondaryBroadcastTarget(IBaseDeviceComms* const newBroadcastTarget);

	virtual __declspec(nothrow) HRESULT __stdcall SendLoop(const BYTE* const sendBuffer, const unsigned len) override;
	virtual __declspec(nothrow) HRESULT __stdcall RecvLoop(BYTE* const recvBuffer, const unsigned len) override;
	virtual void IncrementSentPacket(const unsigned packetSizeBytes) override;
	virtual void IncrementRecvPacket(const unsigned packetSizeBytes) override;
	virtual void StoreSentPacket(const genericCommand& sentPacket) override;
	virtual void StoreRecvdPacket(const genericCommand& recvdPacket) override;

private:
	std::vector<IBaseDeviceComms*> broadcastTargets;

	// The primary comms is the one whose return data is given back to the driver. All of the other broadcast targets' return data is read and then discarded.
	IBaseDeviceComms* const primaryComms;
};
