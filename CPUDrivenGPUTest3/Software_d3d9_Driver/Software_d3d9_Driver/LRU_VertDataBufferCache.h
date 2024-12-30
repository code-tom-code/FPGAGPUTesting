#pragma once

#include "Driver/DeviceAllocatedBuffer.h"
#include <unordered_map>
#include <list>

// An LRU cache type where lookup, removal of LRU, and insertion to MRU are all performed as constant-time operations (no linear walks or logarithmic tree-searches)
class LRU_VertDataBufferCache
{
public:
	const bool FindExistingItem(const unsigned __int64 searchCacheHash, DeviceAllocatedBuffer& outExistingItem)
	{
		const std::unordered_map<unsigned __int64, std::list<DeviceAllocatedBuffer>::iterator>::iterator findIt = DataHashTable.find(searchCacheHash);
		if (findIt == DataHashTable.end() )
		{
			return false;
		}

		// Move our cache hit to the front of the list since it is now the most recently accessed item:
		const DeviceAllocatedBuffer hitData = *(findIt->second);
		LRU_List.erase(findIt->second);
		LRU_List.push_back(hitData);

		// Be sure to update the hash table's list iterator to the new one:
		std::list<DeviceAllocatedBuffer>::iterator newListIter = LRU_List.end();
		--newListIter;
		findIt->second = newListIter;

		outExistingItem = hitData;
		return true;
	}

	const DeviceAllocatedBuffer PurgeLRUItem()
	{
		if (LRU_List.empty() )
			return DeviceAllocatedBuffer();

		std::list<DeviceAllocatedBuffer>::iterator LRU_Iter = LRU_List.begin();
		const DeviceAllocatedBuffer purgeData = *LRU_Iter;
		LRU_List.erase(LRU_Iter);

		const std::unordered_map<unsigned __int64, std::list<DeviceAllocatedBuffer>::iterator>::iterator hashFindIt = DataHashTable.find(purgeData.GetCacheHash() );
#ifdef _DEBUG
		if (hashFindIt == DataHashTable.end() )
		{
			__debugbreak();
		}
#endif
		DataHashTable.erase(hashFindIt);

		return purgeData;
	}

	void InsertNewItem(const DeviceAllocatedBuffer newData)
	{
		LRU_List.push_back(newData);
		std::list<DeviceAllocatedBuffer>::iterator listIter = LRU_List.end();
		--listIter;
		DataHashTable.insert(std::make_pair(newData.GetCacheHash(), listIter) );
	}

	const unsigned GetSize() const
	{
		return (const unsigned)LRU_List.size();
	}

private:
	std::unordered_map<unsigned __int64, std::list<DeviceAllocatedBuffer>::iterator> DataHashTable;
	std::list<DeviceAllocatedBuffer> LRU_List;
};
