#pragma once

#include "Driver/GPUCommandList.h"
#include <unordered_map>
#include <list>

// An LRU cache type where lookup, removal of LRU, and insertion to MRU are all performed as constant-time operations (no linear walks or logarithmic tree-searches)
class LRU_GPUCommandListCache
{
public:
	const bool FindExistingItem(const unsigned __int64 commandListHash, const unsigned commandListSize, GPUCommandList*& outExistingItem)
	{
		const std::unordered_map<unsigned __int64, std::list<GPUCommandList*>::iterator>::iterator findIt = DataHashTable.find(commandListHash ^ commandListSize);
		if (findIt == DataHashTable.end() )
		{
			outExistingItem = NULL;
			return false;
		}

		// Move our cache hit to the front of the list since it is now the most recently accessed item:
		GPUCommandList* const ptrData = *(findIt->second);
		LRU_List.erase(findIt->second);
		LRU_List.push_back(ptrData);

		// Be sure to update the hash table's list iterator to the new one:
		std::list<GPUCommandList*>::iterator newListIter = LRU_List.end();
		--newListIter;
		findIt->second = newListIter;

		outExistingItem = ptrData;
		return true;
	}

	GPUCommandList* const PurgeLRUItem()
	{
		if (LRU_List.empty() )
			return NULL;

		const std::list<GPUCommandList*>::iterator LRU_Iter = LRU_List.begin();
		GPUCommandList* const ptrData = *LRU_Iter;
		LRU_List.erase(LRU_Iter);

		const std::unordered_map<unsigned __int64, std::list<GPUCommandList*>::iterator>::iterator hashFindIt = DataHashTable.find(ptrData->commandsHash ^ ptrData->GetCommandListCommandCount() );
#ifdef _DEBUG
		if (hashFindIt == DataHashTable.end() )
		{
			__debugbreak();
		}
#endif
		DataHashTable.erase(hashFindIt);

		return ptrData;
	}

	void InsertNewItem(GPUCommandList* const newData, const unsigned __int64 newCommandListHash, const unsigned newCommandListSize)
	{
		LRU_List.push_back(newData);
		std::list<GPUCommandList*>::iterator listIter = LRU_List.end();
		--listIter;
		DataHashTable.insert(std::make_pair(newCommandListHash ^ newCommandListSize, listIter) );
	}

	const unsigned GetSize() const
	{
		return (const unsigned)LRU_List.size();
	}

private:
	std::unordered_map<unsigned __int64, std::list<GPUCommandList*>::iterator> DataHashTable;
	std::list<GPUCommandList*> LRU_List;
};
