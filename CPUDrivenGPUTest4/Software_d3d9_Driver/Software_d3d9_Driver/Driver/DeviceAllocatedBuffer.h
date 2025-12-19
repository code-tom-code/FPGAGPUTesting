#pragma once

#include "GPUDeviceLimits.h"
#include "GPUAllocator.h"

// DeviceAllocatedBuffer stores a hash and size alongside the pointer to the GPU-side buffer data
struct DeviceAllocatedBuffer
{
	unsigned __int64 bufferHash = 0;
	gpuvoid* deviceMemory = nullptr;
	unsigned short deviceSizeBytes = 0;
	gpuFormat format = GPUFMT_Unknown;

	static const unsigned __int64 ComputeHash(const void* const bufferMemory, const unsigned short sizeBytes)
	{
		unsigned __int64 ret = 0;

		const unsigned numDWORDs = sizeBytes / sizeof(DWORD);
		const DWORD* const dwordMemory = (const DWORD* const)bufferMemory;
		for (unsigned x = 0; x < numDWORDs; ++x)
		{
			ret ^= dwordMemory[x];
			ret = _rotl64(ret, 32 - 3);
		}

		if (sizeBytes % sizeof(DWORD) != 0)
		{
			const unsigned numUSHORTs = sizeBytes / sizeof(unsigned short);
			const unsigned short* const ushortMemory = (const unsigned short* const)bufferMemory;
			ret ^= ushortMemory[numUSHORTs - 1];
			ret = _rotl64(ret, 16 - 3);
		}

		return ret;
	}

	inline const unsigned __int64 GetCacheHash() const
	{
		return bufferHash ^ deviceSizeBytes ^ (static_cast<unsigned>(format) << 24u);
	}

	// Note that this does *not* check the address for equality!
	inline const bool operator==(const DeviceAllocatedBuffer& rhs) const
	{
		return (format == rhs.format && deviceSizeBytes == rhs.deviceSizeBytes && bufferHash == rhs.bufferHash);
	}

	inline const bool operator<(const DeviceAllocatedBuffer& rhs) const
	{
		if (format != rhs.format)
			return format < rhs.format;

		if (deviceSizeBytes != rhs.deviceSizeBytes)
			return deviceSizeBytes < rhs.deviceSizeBytes;

		if (bufferHash != rhs.bufferHash)
			return bufferHash < rhs.bufferHash;

		if (deviceMemory != rhs.deviceMemory)
			return deviceMemory < rhs.deviceMemory;

		return false;
	}
};
