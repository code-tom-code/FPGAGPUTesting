#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "GPUAllocator.h"
#include <Windows.h>
#include <d3d9.h>
#include <map>
#include <unordered_set>
#include <intrin.h>

static bool GPUAllocInitialized = false;
static CRITICAL_SECTION GPUAllocCS = {0};
#ifdef _DEBUG
static const char* GPUAllocCS_OwnerString = NULL;
static const char* GPUAllocCS_DebugAllocationString = NULL;
#endif
const constexpr unsigned GPU_PAGES_MEMORY_MASK = (GPU_DRAM_TOTAL_CAPACITY_BYTES - 1) ^ (GPU_PAGE_SIZE_BYTES - 1);

struct GlobalAllocatorStats
{
	GlobalAllocatorStats()
	{
	}

	unsigned freeBytesTotal = GPU_DRAM_TOTAL_CAPACITY_BYTES;
	unsigned usableFreeBytesTotal = GPU_DRAM_TOTAL_CAPACITY_BYTES; // Counts how many usable free bytes are available (not counting bytes unavailable due to alignment)
	unsigned numLiveAllocations = 0;
	unsigned currentGeneration = 1; // This is incremented once for each alloc/free to indicate to the driver UI that it needs to refresh its stats page

	// These per-frame metrics get reset at the end of each frame (during the Present() )
	unsigned numAllocationsThisFrame = 0;
	unsigned bytesAllocatedThisFrame = 0;
	unsigned numFreesThisFrame = 0;
	unsigned bytesFreedThisFrame = 0;

	unsigned rollingNumPlacementTests[64] = {0};
	unsigned char rollingPlacementID = 0;
	float allocatorFreePercent = 100.0f;
} globalStats; // Only modify this if you currently hold the allocator critical section!

// A false value means that a whole column is *free*, a true value means that a whole column is *occupied*!
static bool occupiedColumnsMap[GPU_DRAM_TOTAL_CAPACITY_BYTES / GPU_COL_SIZE_BYTES] = { false };

// A zero bit means that a page is *free*, a 1 bit means that a page is *occupied*!
static uint32_t occupiedPagesBitmap[GPU_DRAM_TOTAL_CAPACITY_BYTES / GPU_PAGE_SIZE_BYTES / (sizeof(uint32_t) * 8)] = { 0 };

// Only access this if you currently hold the allocator critical section!
static std::map<gpuvoid*, liveAllocation> liveAllocationsMap;

struct _FreeTree
{
	struct FreeList
	{
		const unsigned regionSize_bytes;
		std::unordered_set<gpuvoid*> freeRegions; // List of free regions in blocks of size regionSize
	};

	FreeList lists[20] =
	{
		{1 * 1024 * 1024 * 1024}, // 1GB (all of VRAM)
		{512 * 1024 * 1024}, // 512MB
		{256 * 1024 * 1024}, // 256MB
		{128 * 1024 * 1024}, // 128MB
		{64 * 1024 * 1024}, // 64MB
		{32 * 1024 * 1024}, // 32MB
		{16 * 1024 * 1024}, // 16MB
		{8 * 1024 * 1024}, // 8MB
		{4 * 1024 * 1024}, // 4MB
		{2 * 1024 * 1024}, // 2MB
		{1 * 1024 * 1024}, // 1MB (one memory column)
		{512 * 1024}, // 512KB
		{256 * 1024}, // 256KB
		{128 * 1024}, // 128KB
		{64 * 1024}, // 64KB
		{32 * 1024}, // 32KB (one memory row)
		{16 * 1024}, // 16KB
		{8 * 1024}, // 8KB
		{4 * 1024}, // 4KB
		{2 * 1024} // 2KB (one memory page)
	};

	_FreeTree()
	{
		// Initialize our tree with one single block that is 1GB in size to represent all of VRAM:
		FreeBlock( (gpuvoid* const)0x00000000, GPU_DRAM_TOTAL_CAPACITY_BYTES);
	}

	static const unsigned RoundUpToPowerOf2(const unsigned xVal)
	{
		if (xVal == 1)
			return 1;
		else
			return 1 << (32 - __lzcnt(xVal - 1) );
	}

	// Returns the smallest block size that fits the given allocSize and alignment
	static const unsigned GetFittingBlockSize(const unsigned allocSize, const unsigned alignSize = GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		if (__popcnt(alignSize) != 1)
		{
			__debugbreak(); // alignSize must be a power of 2!
		}
#endif
		if (alignSize >= allocSize)
			return alignSize;
		else
			return RoundUpToPowerOf2(allocSize);
	}

	// Takes one larger block and splits it until it has generated a new block of the smaller size block
	void SplitBlocksDownToX(const unsigned splitBlockListIndex, const unsigned splitDowntoListIndex)
	{
#ifdef _DEBUG
		if (splitDowntoListIndex <= splitBlockListIndex)
		{
			__debugbreak();
		}
		if (splitBlockListIndex >= ARRAYSIZE(lists) )
		{
			__debugbreak();
		}
		if (splitDowntoListIndex >= ARRAYSIZE(lists) )
		{
			__debugbreak();
		}
		if (lists[splitBlockListIndex].freeRegions.empty() )
		{
			__debugbreak();
		}
#endif
		for (unsigned currentListIndex = splitBlockListIndex; currentListIndex < splitDowntoListIndex; ++currentListIndex)
		{
			FreeList& largerBlocksList = lists[currentListIndex];
			const unsigned largerBlocksSize = largerBlocksList.regionSize_bytes;
			const std::unordered_set<gpuvoid*>::iterator splitIter = largerBlocksList.freeRegions.begin();
			gpuvoid* const splitLargeBase = *splitIter;
			largerBlocksList.freeRegions.erase(splitIter);
			gpuvoid* const splitLeft = splitLargeBase;
			gpuvoid* const splitRight = (gpuvoid* const)( (char* const)splitLargeBase + (largerBlocksSize >> 1) );

			FreeList& smallerBlocksList = lists[currentListIndex + 1];
			smallerBlocksList.freeRegions.insert(splitLeft);
			smallerBlocksList.freeRegions.insert(splitRight);
		}
	}

	// May return false if there are no regions currently available in the given searchList that contain the provided address
	static bool FindRegionContainingAddress(const FreeList& searchList, gpuvoid* const searchAddr, gpuvoid*& outFoundRegionBaseAddr)
	{
		for (std::unordered_set<gpuvoid*>::iterator searchIt = searchList.freeRegions.begin(); searchIt != searchList.freeRegions.end(); ++searchIt)
		{
			gpuvoid* const regionBeginAddr = *searchIt;
			if (regionBeginAddr <= searchAddr &&
				reinterpret_cast<gpuvoid* const>( (char* const)regionBeginAddr + searchList.regionSize_bytes) > searchAddr)
			{
				outFoundRegionBaseAddr = regionBeginAddr;
				return true;
			}
		}
		return false;
	}

	// Takes one larger block and splits it until it has generated a new block of the smaller size block
	void SplitBlocksDownToXWithAddress(const unsigned splitBlockListIndex, const unsigned splitDowntoListIndex, gpuvoid* const splitAddr)
	{
#ifdef _DEBUG
		if (splitDowntoListIndex <= splitBlockListIndex)
		{
			__debugbreak();
		}
		if (splitBlockListIndex >= ARRAYSIZE(lists) )
		{
			__debugbreak();
		}
		if (splitDowntoListIndex >= ARRAYSIZE(lists) )
		{
			__debugbreak();
		}
		if (lists[splitBlockListIndex].freeRegions.empty() )
		{
			__debugbreak();
		}
#endif
		for (unsigned currentListIndex = splitBlockListIndex; currentListIndex < splitDowntoListIndex; ++currentListIndex)
		{
			FreeList& largerBlocksList = lists[currentListIndex];
			const unsigned largerBlocksSize = largerBlocksList.regionSize_bytes;
			gpuvoid* containingRegionAddr = NULL;
			const bool foundRegionContainingAddr = FindRegionContainingAddress(largerBlocksList, splitAddr, containingRegionAddr);
#ifdef _DEBUG
			if (!foundRegionContainingAddr)
			{
				__debugbreak(); // Error: No splits found containing the provided address
			}
#endif
			const std::unordered_set<gpuvoid*>::iterator splitIter = largerBlocksList.freeRegions.find(containingRegionAddr);
			gpuvoid* const splitLargeBase = *splitIter;
			largerBlocksList.freeRegions.erase(splitIter);
			gpuvoid* const splitLeft = splitLargeBase;
			gpuvoid* const splitRight = (gpuvoid* const)( (char* const)splitLargeBase + (largerBlocksSize >> 1) );

			FreeList& smallerBlocksList = lists[currentListIndex + 1];
			smallerBlocksList.freeRegions.insert(splitLeft);
			smallerBlocksList.freeRegions.insert(splitRight);
		}
	}

	void SplitReclaimRemainingAllocSpace(gpuvoid* const address, const unsigned allocSize, const FreeList& baseList)
	{
		gpuvoid* const postAllocAddr = (char* const)address + allocSize;
		unsigned splitRemainingAllocs = baseList.regionSize_bytes - allocSize;
		gpuvoid* rightSidePtr = (char* const)address + baseList.regionSize_bytes;
		while (splitRemainingAllocs != 0)
		{
			const unsigned numLeadingZeroesRemaining = __lzcnt(splitRemainingAllocs);
			const unsigned freeListIndexRemaining = numLeadingZeroesRemaining - 1;
			const FreeList& splitRemainingFreeList = lists[freeListIndexRemaining];
			rightSidePtr = (char* const)rightSidePtr - splitRemainingFreeList.regionSize_bytes;
			FreeBlock(rightSidePtr, splitRemainingFreeList.regionSize_bytes);
			splitRemainingAllocs = splitRemainingAllocs & (~splitRemainingFreeList.regionSize_bytes);
		}
	}

	gpuvoid* AllocAtAddress(gpuvoid* const address, const unsigned allocSize)
	{
#ifdef _DEBUG
		if (allocSize & GPU_PAGE_SIZE_BYTES)
		{
			__debugbreak(); // allocSize must already be rounded up to the next largest page-size multiple
		}
#endif
		const unsigned blockSize = GetFittingBlockSize(allocSize);
		const unsigned numLeadingZeroes = __lzcnt(blockSize);
		const unsigned freeListIndex = numLeadingZeroes - 1;
		FreeList& thisList = lists[freeListIndex];

		std::unordered_set<gpuvoid*>::iterator findIt = thisList.freeRegions.find(address);
		if (findIt == thisList.freeRegions.end() )
		{
			// We need to try to split this region out of larger blocks if it isn't already immediately available
			bool foundRegion = false;
			gpuvoid* foundRegionAddress = NULL;
			unsigned searchListIndex = freeListIndex - 1;
			while (searchListIndex != 0xFFFFFFFF)
			{
				const FreeList& searchList = lists[searchListIndex];
				const bool foundRegionContainingAddress = FindRegionContainingAddress(searchList, address, foundRegionAddress);
				if (foundRegionContainingAddress)
				{
					foundRegion = true;
					break;
				}

				--searchListIndex;
			}

			if (foundRegion)
			{
				SplitBlocksDownToXWithAddress(searchListIndex, freeListIndex, address);
			}

			findIt = thisList.freeRegions.find(address);
		}

		// We couldn't find a suitable splitting region from a larger block, we can't fit this allocation at the requested address! Bail out!
		if (findIt == thisList.freeRegions.end() )
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return NULL;
		}

		thisList.freeRegions.erase(findIt);

		// Split the empty space after this allocation before the end of the blockSize into smaller blocks so as to not waste the space
		if (allocSize != thisList.regionSize_bytes)
		{
			SplitReclaimRemainingAllocSpace(address, allocSize, thisList);
		}

		return address;
	}

	gpuvoid* Alloc(const unsigned allocSize, const unsigned alignSize = GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		if (allocSize & (GPU_PAGE_SIZE_BYTES - 1) )
		{
			__debugbreak(); // allocSize must already be rounded up to the next largest page-size multiple
		}
#endif
		const unsigned blockSize = GetFittingBlockSize(allocSize, alignSize);
		const unsigned numLeadingZeroes = __lzcnt(blockSize);
		const unsigned freeListIndex = numLeadingZeroes - 1;
		FreeList& thisList = lists[freeListIndex];

		if (thisList.freeRegions.empty() )
		{
			unsigned splitFreeListIndex = freeListIndex - 1;
#ifdef _DEBUG
			bool foundSuitableSplit = false;
#endif
			while (splitFreeListIndex != 0xFFFFFFFF)
			{
				const FreeList& splitList = lists[splitFreeListIndex];
				if (!splitList.freeRegions.empty() )
				{
					SplitBlocksDownToX(splitFreeListIndex, freeListIndex);
#ifdef _DEBUG
					foundSuitableSplit = true;
#endif
					break;
				}
				else
				{
					--splitFreeListIndex;
				}
			}
#ifdef _DEBUG
			if (!foundSuitableSplit)
			{
				__debugbreak(); // Error: Couldn't find any suitable blocks larger than the current one to split off of to generate more blocks from! We're out of memory!
			}
#endif
		}

		if (!thisList.freeRegions.empty() )
		{
			const std::unordered_set<gpuvoid*>::iterator allocIter = thisList.freeRegions.begin();
			gpuvoid* const thisAddr = *allocIter;
			thisList.freeRegions.erase(allocIter);

			// Split the empty space after this allocation before the end of the blockSize into smaller blocks so as to not waste the space
			if (allocSize != thisList.regionSize_bytes)
			{
				SplitReclaimRemainingAllocSpace(thisAddr, allocSize, thisList);
			}

			return thisAddr;
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // Error! Failed allocation due to no found free memory regions!
#endif
			return NULL;
		}
	}

	// Computes the address of the buddy-block for the given address and blockSize
	static gpuvoid* const GetBuddyBlock(gpuvoid* const blockStartAddr, const unsigned blockSize)
	{
#ifdef _DEBUG
		if (__popcnt(blockSize) != 1)
		{
			__debugbreak(); // blockSize must be a power of 2!
		}
#endif

		gpuvoid* const buddyBlockPtr = reinterpret_cast<gpuvoid* const>(reinterpret_cast<unsigned long>(blockStartAddr) ^ blockSize);
		return buddyBlockPtr;
	}

	void FreeBlock(gpuvoid* const blockStartAddr, const unsigned blockSize)
	{
#ifdef _DEBUG
		if (__popcnt(blockSize) != 1)
		{
			__debugbreak(); // blockSize must be a power of 2!
		}
		if (reinterpret_cast<unsigned long>(blockStartAddr) & (blockSize - 1) )
		{
			__debugbreak(); // The address we were given to free is not aligned to the blockSize provided
		}
#endif

		const unsigned numLeadingZeroes = __lzcnt(blockSize);
		const unsigned freeListIndex = numLeadingZeroes - 1;

#ifdef _DEBUG
		if (freeListIndex >= ARRAYSIZE(lists) )
		{
			__debugbreak();
		}
#endif

		FreeList& returnList = lists[freeListIndex];
#ifdef _DEBUG
		if (returnList.regionSize_bytes != blockSize)
		{
			__debugbreak();
		}
#endif

		gpuvoid* const buddyBlock = GetBuddyBlock(blockStartAddr, blockSize);
		const std::unordered_set<gpuvoid*>::iterator buddyIt = returnList.freeRegions.find(buddyBlock);
		if (buddyIt != returnList.freeRegions.end() )
		{
			// Coalesce our two smaller memory blocks together into a larger one!
			returnList.freeRegions.erase(buddyIt);
			gpuvoid* const coalescedBlockAddr = blockStartAddr < buddyBlock ? blockStartAddr : buddyBlock;
			FreeBlock(coalescedBlockAddr, blockSize << 1);
		}
		else
		{
			returnList.freeRegions.insert(blockStartAddr);
		}
	}

	void FreeAlloc(gpuvoid* allocAddr, unsigned allocSize)
	{
		while (allocSize != 0)
		{
			const unsigned numLeadingZeroes = __lzcnt(allocSize);
			const unsigned freeListIndex = numLeadingZeroes - 1;
			const unsigned freeListBlockSize = 1 << (32 - numLeadingZeroes - 1);

#ifdef _DEBUG
			if (freeListIndex >= ARRAYSIZE(lists) )
			{
				__debugbreak();
			}
			if (freeListBlockSize != lists[freeListIndex].regionSize_bytes)
			{
				__debugbreak();
			}
#endif

			FreeBlock(allocAddr, freeListBlockSize);

#ifdef _DEBUG
			if (freeListBlockSize > allocSize)
			{
				__debugbreak();
			}
#endif

			allocAddr = (gpuvoid*)( ( (char* const)allocAddr) + freeListBlockSize);

#ifdef _DEBUG
			if (allocAddr > (gpuvoid* const)0x40000000)
			{
				__debugbreak();
			}
#endif

			allocSize -= freeListBlockSize;
		}
	}
} FreeTree;

// Returns true if the given 1MB column index is currently occupied (allocated), or false if it is free
static inline const bool IsGPUColumnOccupied(const unsigned gpuColumnIndex)
{
#ifdef _DEBUG
	if (gpuColumnIndex >= std::size(occupiedColumnsMap) )
	{
		__debugbreak(); // Out of bounds!
	}
#endif
	return occupiedColumnsMap[gpuColumnIndex];
}

static inline void SetGPUColumnOccupied(const unsigned gpuColumnIndex, const bool isOccupied)
{
#ifdef _DEBUG
	if (gpuColumnIndex >= std::size(occupiedColumnsMap) )
	{
		__debugbreak(); // Out of bounds!
	}
#endif
	occupiedColumnsMap[gpuColumnIndex] = isOccupied;
}

// Returns true if the given 2KB page index is currently occupied (allocated), or false if it is free
static inline const bool IsGPUPageOccupied(const unsigned gpuPageIndex)
{
	const unsigned bitmapIndex = gpuPageIndex / (sizeof(uint32_t) * 8);
#ifdef _DEBUG
	if (bitmapIndex >= std::size(occupiedPagesBitmap) )
	{
		__debugbreak(); // Out of bounds!
	}
#endif
	const uint32_t gpuPageBitmap = occupiedPagesBitmap[bitmapIndex];
	const uint32_t bitMask = 1 << (gpuPageIndex % (sizeof(uint32_t) * 8) );
	return (gpuPageBitmap & bitMask) != 0;
}

static inline void SetGPUPageOccupied(const unsigned gpuPageIndex, const bool isOccupied)
{
	const unsigned bitmapIndex = gpuPageIndex / (sizeof(uint32_t) * 8);
#ifdef _DEBUG
	if (bitmapIndex >= std::size(occupiedPagesBitmap) )
	{
		__debugbreak(); // Out of bounds!
	}
#endif
	uint32_t& gpuPageBitmap = occupiedPagesBitmap[bitmapIndex];
	const uint32_t bitMask = 1 << (gpuPageIndex % (sizeof(uint32_t) * 8) );
	if (isOccupied)
		gpuPageBitmap |= bitMask;
	else
		gpuPageBitmap &= (~bitMask);
}

// Returns true if all consecutive pages queried are free, or false otherwise. Runs more efficiently than calling IsGPUPageOccupied() in a loop by performing batch page testing
static const bool AreAllGPUPagesFree(const unsigned gpuStartingPageIndex, unsigned numPages)
{
#ifdef _DEBUG
	if (numPages == 0)
	{
		__debugbreak(); // Not a valid page count!
	}
#endif
	if (numPages == 1)
	{
		return IsGPUPageOccupied(gpuStartingPageIndex) == false;
	}

	unsigned bitmapIndex = gpuStartingPageIndex / (sizeof(uint32_t) * 8);
	const unsigned endingBitmapIndex = (gpuStartingPageIndex + numPages - 1) / (sizeof(uint32_t) * 8);
#ifdef _DEBUG
	if (bitmapIndex >= std::size(occupiedPagesBitmap) )
	{
		__debugbreak(); // Out of bounds!
	}
	if (endingBitmapIndex >= std::size(occupiedPagesBitmap) )
	{
		__debugbreak(); // Out of bounds!
	}
#endif

	unsigned pageOffset = gpuStartingPageIndex % (sizeof(uint32_t) * 8);
	while (numPages > 0)
	{
		unsigned numPagesThisSet;
		if (numPages + pageOffset > 32)
			numPagesThisSet = 32 - pageOffset;
		else
			numPagesThisSet = numPages;

		const unsigned checkShift = (const unsigned)(1llu << numPagesThisSet); // If we don't do this, then trying to shift a 32-bit value by 32 bits will bug out on x86 as the shift amount gets masked away
		const unsigned checkMask = (checkShift - 1u) << pageOffset;
		if (checkMask & occupiedPagesBitmap[bitmapIndex])
		{
			return false;
		}

		numPages -= numPagesThisSet;
		pageOffset = 0;
		++bitmapIndex;
	}

	return true;
}

// Returns true if all consecutive pages queried are occupied, or false otherwise. Runs more efficiently than calling IsGPUPageOccupied() in a loop by performing batch page testing
static const bool AreAllGPUPagesOccupied(const unsigned gpuStartingPageIndex, unsigned numPages)
{
#ifdef _DEBUG
	if (numPages == 0)
	{
		__debugbreak(); // Not a valid page count!
	}
#endif
	if (numPages == 1)
	{
		return IsGPUPageOccupied(gpuStartingPageIndex) == true;
	}

	unsigned bitmapIndex = gpuStartingPageIndex / (sizeof(uint32_t) * 8);
	const unsigned endingBitmapIndex = (gpuStartingPageIndex + numPages - 1) / (sizeof(uint32_t) * 8);
#ifdef _DEBUG
	if (bitmapIndex >= std::size(occupiedPagesBitmap) )
	{
		__debugbreak(); // Out of bounds!
	}
	if (endingBitmapIndex >= std::size(occupiedPagesBitmap) )
	{
		__debugbreak(); // Out of bounds!
	}
#endif

	unsigned pageOffset = gpuStartingPageIndex % (sizeof(uint32_t) * 8);
	while (numPages > 0)
	{
		unsigned numPagesThisSet;
		if (numPages + pageOffset > 32)
			numPagesThisSet = 32 - pageOffset;
		else
			numPagesThisSet = numPages;

		const unsigned checkShift = (const unsigned)(1llu << numPagesThisSet); // If we don't do this, then trying to shift a 32-bit value by 32 bits will bug out on x86 as the shift amount gets masked away
		const unsigned checkMask = (checkShift - 1u) << pageOffset;
		if ( (checkMask & occupiedPagesBitmap[bitmapIndex]) != checkMask)
		{
			return false;
		}

		numPages -= numPagesThisSet;
		pageOffset = 0;
		++bitmapIndex;
	}

	return true;
}

// This is more efficient than calling SetGPUPageOccupied(true) in a loop.
static void BulkSetGPUPagesOccupied(const unsigned gpuStartingPageIndex, unsigned numPages)
{
#ifdef _DEBUG
	if (numPages == 0)
	{
		__debugbreak(); // Not a valid page count!
	}
#endif
	if (numPages == 1)
	{
		SetGPUPageOccupied(gpuStartingPageIndex, true);
		return;
	}

	unsigned bitmapIndex = gpuStartingPageIndex / (sizeof(uint32_t) * 8);
	const unsigned endingBitmapIndex = (gpuStartingPageIndex + numPages - 1) / (sizeof(uint32_t) * 8);
#ifdef _DEBUG
	if (bitmapIndex >= std::size(occupiedPagesBitmap) )
	{
		__debugbreak(); // Out of bounds!
	}
	if (endingBitmapIndex >= std::size(occupiedPagesBitmap) )
	{
		__debugbreak(); // Out of bounds!
	}
#endif

	unsigned pageOffset = gpuStartingPageIndex % (sizeof(uint32_t) * 8);
	while (numPages > 0)
	{
		unsigned numPagesThisSet;
		if (numPages + pageOffset > 32)
			numPagesThisSet = 32 - pageOffset;
		else
			numPagesThisSet = numPages;

		const unsigned setShift = (const unsigned)(1llu << numPagesThisSet); // If we don't do this, then trying to shift a 32-bit value by 32 bits will bug out on x86 as the shift amount gets masked away
		const unsigned setMask = (setShift - 1u) << pageOffset;
		occupiedPagesBitmap[bitmapIndex] |= setMask;

		numPages -= numPagesThisSet;
		pageOffset = 0;
		++bitmapIndex;
	}
}

// This is more efficient than calling SetGPUPageOccupied(false) in a loop.
static void BulkSetGPUPagesUnoccupied(const unsigned gpuStartingPageIndex, unsigned numPages)
{
#ifdef _DEBUG
	if (numPages == 0)
	{
		__debugbreak(); // Not a valid page count!
	}
#endif
	if (numPages == 1)
	{
		SetGPUPageOccupied(gpuStartingPageIndex, false);
		return;
	}

	unsigned bitmapIndex = gpuStartingPageIndex / (sizeof(uint32_t) * 8);
	const unsigned endingBitmapIndex = (gpuStartingPageIndex + numPages - 1) / (sizeof(uint32_t) * 8);
#ifdef _DEBUG
	if (bitmapIndex >= std::size(occupiedPagesBitmap) )
	{
		__debugbreak(); // Out of bounds!
	}
	if (endingBitmapIndex >= std::size(occupiedPagesBitmap) )
	{
		__debugbreak(); // Out of bounds!
	}
#endif

	unsigned pageOffset = gpuStartingPageIndex % (sizeof(uint32_t) * 8);
	while (numPages > 0)
	{
		unsigned numPagesThisSet;
		if (numPages + pageOffset > 32)
			numPagesThisSet = 32 - pageOffset;
		else
			numPagesThisSet = numPages;

		const unsigned clearShift = (const unsigned)(1llu << numPagesThisSet); // If we don't do this, then trying to shift a 32-bit value by 32 bits will bug out on x86 as the shift amount gets masked away
		const unsigned clearMask = ~( (clearShift - 1u) << pageOffset);
		occupiedPagesBitmap[bitmapIndex] &= clearMask;

		numPages -= numPagesThisSet;
		pageOffset = 0;
		++bitmapIndex;
	}
}

class ScopeLockCS
{
public:
	ScopeLockCS(CRITICAL_SECTION* const lockCSptr
#ifdef _DEBUG
		, const char*& ownerStringRef
		, const char* const ownerName
		, const char*& debugAllocStringRef
		, const char* const debugAllocString
#endif
	) : lockPtr(lockCSptr)
#ifdef _DEBUG
		, ownerStringPtr(&ownerStringRef)
		, debugAllocStringPtr(&debugAllocStringRef)
#endif
	{
#ifdef _DEBUG
		if (GPUAllocInitialized != true)
		{
			__debugbreak(); // Error: Cannot use this scope lock until the allocator has been initialized!
		}
		if (ownerName == NULL)
		{
			__debugbreak(); // Must specify an owner name!
		}
		if (debugAllocString == NULL)
		{
			__debugbreak(); // Must specify a debug alloc string!
		}
		if (lockCSptr == NULL)
		{
			__debugbreak(); // Passing in an invalid critical section!
		}
		if (ownerStringPtr == NULL)
		{
			__debugbreak(); // Passing in an invalid owner string pointer!
		}
		if (debugAllocStringPtr == NULL)
		{
			__debugbreak(); // Passing in an invalid debug alloc string pointer!
		}
#endif
		EnterCriticalSection(lockPtr);
#ifdef _DEBUG
		if (ownerStringRef != NULL)
		{
			__debugbreak(); // Error: Previous party did not properly release owner string!
		}
		ownerStringRef = ownerName;
		if (debugAllocStringRef != NULL)
		{
			__debugbreak(); // Error: Previous party did not properly release debug alloc string!
		}
		debugAllocStringRef = debugAllocString;
#endif
	}

	~ScopeLockCS()
	{
#ifdef _DEBUG
		if (!lockPtr)
		{
			__debugbreak(); // Somehow our lock pointer got corrupted!
		}
		if (!ownerStringPtr)
		{
			__debugbreak(); // Somehow our owner string pointer got corrupted!
		}
		if (!debugAllocStringPtr)
		{
			__debugbreak(); // Somehow our debug alloc string pointer got corrupted!
		}

		*ownerStringPtr = NULL;
		*debugAllocStringPtr = NULL;
#endif
		LeaveCriticalSection(lockPtr);
	}

private:
	CRITICAL_SECTION* const lockPtr;
#ifdef _DEBUG
	const char** const ownerStringPtr;
	const char** const debugAllocStringPtr;
#endif
};

// Returns the current generation index of the allocator (used mainly for the driver's stats page to know when to redraw when the generation changes)
const unsigned GPUGetAllocatorGeneration()
{
	const ScopeLockCS lockAllocScope(&GPUAllocCS
#ifdef _DEBUG
		, GPUAllocCS_OwnerString, __FUNCTION__
		, GPUAllocCS_DebugAllocationString, __FUNCTION__
#endif
	);

	return globalStats.currentGeneration;
}

// Ends the current frame and resets the per-frame counters:
__declspec(noinline) void GPUAlloc_EndFrame(unsigned& outNumAllocsThisFrame, unsigned& outBytesAllocThisFrame, unsigned& outNumFreesThisFrame, unsigned& outBytesFreedThisFrame, unsigned& outRollingNumPlacementsAvg)
{
	const ScopeLockCS lockAllocScope(&GPUAllocCS
#ifdef _DEBUG
		, GPUAllocCS_OwnerString, __FUNCTION__
		, GPUAllocCS_DebugAllocationString, __FUNCTION__
#endif
	);

	outNumAllocsThisFrame = globalStats.numAllocationsThisFrame;
	outBytesAllocThisFrame = globalStats.bytesAllocatedThisFrame;
	outNumFreesThisFrame = globalStats.numFreesThisFrame;
	outBytesFreedThisFrame = globalStats.bytesFreedThisFrame;

	unsigned sumTotalRollingAllocsCount = 0;
	for (unsigned x = 0; x < ARRAYSIZE(globalStats.rollingNumPlacementTests); ++x)
	{
		sumTotalRollingAllocsCount += globalStats.rollingNumPlacementTests[x];
	}
	outRollingNumPlacementsAvg = sumTotalRollingAllocsCount / ARRAYSIZE(globalStats.rollingNumPlacementTests);

	// Reset out per-frame stats:
	globalStats.numAllocationsThisFrame = 0;
	globalStats.bytesAllocatedThisFrame = 0;
	globalStats.numFreesThisFrame = 0;
	globalStats.bytesFreedThisFrame = 0;
}

// Returns how much usable free memory is available, in bytes
const unsigned GPUGetUsableFreeMemory()
{
	const ScopeLockCS lockAllocScope(&GPUAllocCS
#ifdef _DEBUG
		, GPUAllocCS_OwnerString, __FUNCTION__
		, GPUAllocCS_DebugAllocationString, __FUNCTION__
#endif
	);

	return globalStats.usableFreeBytesTotal;
}

// Returns a gpuFormat from a D3D format
const gpuFormat ConvertD3DFormatToDeviceFormat(const D3DFORMAT fmt)
{
	switch (fmt)
	{
	default:
	case D3DFMT_UNKNOWN:
		return GPUFMT_Unknown;
	case D3DFMT_INDEX16:
		return GPUFMT_Index_UINT16;
	case D3DFMT_INDEX32:
		return GPUFMT_Index_UINT32;
	case D3DFMT_A8R8G8B8:
		return GPUFMT_TexR8G8B8A8;
	case D3DFMT_X8R8G8B8:
		return GPUFMT_TexR8G8B8X8;
	case D3DFMT_A4R4G4B4:
		return GPUFMT_TexR4G4B4A4;
	case D3DFMT_R5G6B5:
		return GPUFMT_TexR5G6B5;
	case D3DFMT_R3G3B2:
		return GPUFMT_TexR3G3B2;
	case D3DFMT_DXT1:
		return GPUFMT_TexDXT1;
	case D3DFMT_DXT2:
	case D3DFMT_DXT3:
		return GPUFMT_TexDXT3;
	case D3DFMT_DXT4:
	case D3DFMT_DXT5:
		return GPUFMT_TexDXT5;
	case D3DFMT_D16:
		return GPUFMT_TexD16;
	case D3DFMT_D24X8:
		return GPUFMT_TexD24;
	case D3DFMT_D24S8:
		return GPUFMT_TexD24S8;
	}
}

// Allocates one page at the start of the address space (at NULL) so that nobody else can allocate from there
static inline void InitializeAllocNullPage_Internal()
{
	SetGPUColumnOccupied(0, true);
	SetGPUPageOccupied(0, true);

	globalStats.freeBytesTotal -= GPU_PAGE_SIZE_BYTES;
	globalStats.usableFreeBytesTotal -= GPU_PAGE_SIZE_BYTES;
	globalStats.allocatorFreePercent = globalStats.usableFreeBytesTotal / (const float)GPU_DRAM_TOTAL_CAPACITY_BYTES * 100.0f;

	liveAllocation nullAllocation;
	nullAllocation.APIObject.RawVoidObject = NULL;
	nullAllocation.allocAddress = NULL;
	nullAllocation.allocSize = GPU_PAGE_SIZE_BYTES;
	nullAllocation.requestedSize = GPU_PAGE_SIZE_BYTES;
	nullAllocation.width = 0;
	nullAllocation.height = 0;
	nullAllocation.depth = 0;
	nullAllocation.numMipLevels = 0;
	nullAllocation.format = GPUFMT_Unknown;
	nullAllocation.usage = GPUVAT_Unknown;
#ifdef _DEBUG
	nullAllocation.debugAllocationName = "(Special) NULL page";
#endif

	liveAllocationsMap.insert(std::make_pair( (gpuvoid* const)NULL, nullAllocation) );
}

void GPUInitializeAllocator()
{
	if (GPUAllocInitialized != false)
	{
		__debugbreak(); // Only call this function once per process run on startup!
	}

	InitializeCriticalSection(&GPUAllocCS);

	EnterCriticalSection(&GPUAllocCS);
	if (GPUAllocInitialized != false)
	{
		__debugbreak(); // Only call this function once from a single thread!
	}

	// Clear the allocator's core tracking memory to reset all allocations:
	memset(occupiedColumnsMap, 0, sizeof(occupiedColumnsMap) );
	memset(occupiedPagesBitmap, 0, sizeof(occupiedPagesBitmap) );
	liveAllocationsMap.clear();
	globalStats = GlobalAllocatorStats();

	GPUAllocInitialized = true;

	// Alloc our NULL page so that nobody else can alloc it later:
	InitializeAllocNullPage_Internal();

	LeaveCriticalSection(&GPUAllocCS);
}

// Returns true if the specified usage is valid, or false if it is invalid
static const bool ValidateUsage(const allocationUsage usage)
{
	if (usage >= GPUVAT_MAX_NUM_ALLOCATION_USAGES)
		return false;

	if (usage == GPUVAT_Unknown)
		return false;

	return true;
}

// Returns true if the specified format is valid, or false if it is invalid
static const bool ValidateFormat(const gpuFormat format)
{
	if (format >= GPUFMT_MAX_NUM_FORMATS)
		return false;

	if (format == GPUFMT_Unknown)
		return false;

	return true;
}

// Returns true if the specified format is compatible with the specified usage, or false otherwise
static const bool ValidateFormatForUsage(const gpuFormat format, const allocationUsage usage)
{
	switch (usage)
	{
	default:
	case GPUVAT_Unknown:
	case GPUVAT_MAX_NUM_ALLOCATION_USAGES:
#ifdef _DEBUG
		__debugbreak(); // Should never be here
#endif
		return false;

	case GPUVAT_CommandBuffer:
		return format >= GPUFMT_StartValidCommandBufferFormats && format <= GPUFMT_EndValidCommandBufferFormats;

	case GPUVAT_VertexStreamData:
		return format >= GPUFMT_StartValidVertexFormats && format <= GPUFMT_EndValidVertexFormats;

	case GPUVAT_IndexData:
		return format >= GPUFMT_StartValidIndexFormats && format <= GPUFMT_EndValidIndexFormats;

	case GPUVAT_Texture:
		return (format >= GPUFMT_StartValidUncompressedTexFormats && format <= GPUFMT_EndValidUncompressedTexFormats) ||
			(format >= GPUFMT_StartValidCompressedTexFormats && format <= GPUFMT_EndValidCompressedTexFormats);

	case GPUVAT_RenderTarget:
		return format >= GPUFMT_StartValidUncompressedTexFormats && format <= GPUFMT_EndValidUncompressedTexFormats;

	case GPUVAT_DepthStencil:
		return format >= GPUFMT_StartValidDepthStencilFormats && format <= GPUFMT_EndValidDepthStencilFormats;

	case GPUVAT_QueryMemory:
		return format >= GPUFMT_StartValidQueryFormats && format <= GPUFMT_EndValidQueryFormats;

	case GPUVAT_ConstantBufferData:
		return format >= GPUFMT_StartValidConstBufferFormats && format <= GPUFMT_EndValidConstBufferFormats;

	case GPUVAT_ShaderInstructionsMemory:
		return format >= GPUFMT_StartValidShaderInstructionsFormats && format <= GPUFMT_EndValidShaderInstructionsFormats;

	case GPUVAT_StatsMemory:
		return format >= GPUFMT_StartValidStatsFormats && format <= GPUFMT_EndValidStatsFormats;

	case GPUVAT_RegisterFileDumpMemory:
		return format >= GPUFMT_StartValidRegFileDumpFormats && format <= GPUFMT_EndValidRegFileDumpFormats;
	}
}

// Returns the alignment size, in bytes, for a given allocation usage type
static const unsigned GetAlignmentSizeForUsage(const allocationUsage usage)
{
	switch (usage)
	{
	default:
	case GPUVAT_Unknown:
	case GPUVAT_MAX_NUM_ALLOCATION_USAGES:
#ifdef _DEBUG
		__debugbreak(); // Should never be here
#endif
		return 1;

	case GPUVAT_CommandBuffer:
	case GPUVAT_VertexStreamData:
	case GPUVAT_IndexData:
	case GPUVAT_QueryMemory:
	case GPUVAT_ConstantBufferData:
	case GPUVAT_StatsMemory:
	case GPUVAT_ShaderInstructionsMemory:
	case GPUVAT_RegisterFileDumpMemory:
		return GPU_PAGE_SIZE_BYTES; // One DRAM page is 2KBytes

	case GPUVAT_Texture:
		return GPU_ROW_SIZE_BYTES; // One DRAM row is 32KBytes

	case GPUVAT_RenderTarget:
	case GPUVAT_DepthStencil:
		return GPU_COL_SIZE_BYTES; // One DRAM column is 1MBytes
	}
}

// Returns true if the given address is aligned properly for the specified usage, or false otherwise
static const bool ValidateAddressForUsageAlignment(const gpuvoid* const gpuAddr, const allocationUsage usage)
{
	const unsigned alignmentBytes = GetAlignmentSizeForUsage(usage);
	const size_t alignmentOffset = (const size_t)gpuAddr % alignmentBytes;
	return alignmentOffset == 0;
}

static inline const unsigned RoundUpSizeToNextPage(const unsigned allocationSize)
{
	return (allocationSize + GPU_PAGE_SIZE_BYTES-1) & (~(GPU_PAGE_SIZE_BYTES-1) );
}

static inline const unsigned RoundUpSizeToNextColumn(const unsigned allocationSize)
{
	return (allocationSize + GPU_COL_SIZE_BYTES-1) & (~(GPU_COL_SIZE_BYTES-1) );
}

// Returns true if the proposed allocation fits at the given address and size, or false if it does not fit
static const bool ValidateAllocationFits(gpuvoid* const gpuAddr, const unsigned allocationSize, const ScopeLockCS& lockedScope)
{
	const std::map<gpuvoid*, liveAllocation>::const_iterator foundExistingIt = liveAllocationsMap.find(gpuAddr);
	if (foundExistingIt != liveAllocationsMap.end() )
	{
		// Cannot allocate over an existing allocation at the same address!
		return false;
	}

	const unsigned gpuStartingPageIndex = (const unsigned)gpuAddr / GPU_PAGE_SIZE_BYTES;
	const unsigned allocationSizeRoundedUpToNextPageSize = RoundUpSizeToNextPage(allocationSize);
	const unsigned numPagesUsed = allocationSizeRoundedUpToNextPageSize / GPU_PAGE_SIZE_BYTES;
	return AreAllGPUPagesFree(gpuStartingPageIndex, numPagesUsed);
}

// Actually places the allocation at the specified address. Cannot fail, since we have already locked the critical section and verified that there are enough free pages at this address
// to support this allocation being placed.
static void GPUPlaceAllocation_Internal(gpuvoid* const placementAddress, const unsigned allocationSizeBytes, 
	const unsigned width, const unsigned short height, const unsigned short depth, const unsigned char numMipLevels, const allocationUsage usage, const gpuFormat format, const void* const apiObjectPtr
#ifdef _DEBUG
	, const char* const debugAllocationString
#endif
	, const unsigned numPlacementTestsBeforeSuccess, const ScopeLockCS& lockedScope)
{
	const unsigned startingColumnIndex = (const unsigned)placementAddress / GPU_COL_SIZE_BYTES;
	const unsigned endingColumnIndex = ( (const unsigned)placementAddress + (allocationSizeBytes-1) ) / GPU_COL_SIZE_BYTES;
	const unsigned startingPageIndex = (const unsigned)placementAddress / GPU_PAGE_SIZE_BYTES;
	const unsigned endingPageIndex = ( (const unsigned)placementAddress + (allocationSizeBytes-1) ) / GPU_PAGE_SIZE_BYTES;

#ifdef _DEBUG
	if ( (size_t)placementAddress >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Final sanity checks for out of bounds allocations
	}
	if ( (size_t)placementAddress + allocationSizeBytes > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Final sanity checks for out of bounds allocations
	}
#endif

	liveAllocation newAlloc;
	newAlloc.APIObject.RawVoidObject = apiObjectPtr;
	newAlloc.allocAddress = placementAddress;
	newAlloc.requestedSize = allocationSizeBytes;
	newAlloc.allocSize = RoundUpSizeToNextPage(allocationSizeBytes);
	newAlloc.width = width;
	newAlloc.height = height;
	newAlloc.depth = depth;
	newAlloc.numMipLevels = numMipLevels;
	newAlloc.usage = usage;
	newAlloc.format = format;
#ifdef _DEBUG
	newAlloc.debugAllocationName = debugAllocationString;
#endif

#ifdef _DEBUG
	if (liveAllocationsMap.find(placementAddress) != liveAllocationsMap.end() )
	{
		__debugbreak(); // Should never be here! We should have already verified that there are no overlapping allocations at this address!
	}
#endif

	liveAllocationsMap.insert(std::make_pair(placementAddress, newAlloc) );

	for (unsigned columnIndex = startingColumnIndex; columnIndex <= endingColumnIndex; ++columnIndex)
	{
		// It's okay if the column was already occupied, this will happen often that we are allocating onto a page that already has another allocation on it
		SetGPUColumnOccupied(columnIndex, true);
	}

#ifdef _DEBUG
	if (AreAllGPUPagesFree(startingPageIndex, endingPageIndex - startingPageIndex + 1) == false)
	{
		__debugbreak(); // We should never be here 'cuz we should have already checked for this prior to calling this function!
	}
#endif
	BulkSetGPUPagesOccupied(startingPageIndex, endingPageIndex - startingPageIndex + 1);

#ifdef _DEBUG
	if (globalStats.numLiveAllocations >= GPU_DRAM_TOTAL_CAPACITY_BYTES / GPU_PAGE_SIZE_BYTES)
	{
		__debugbreak(); // It shouldn't be possible to have this many live allocations at once. We probably have a leak in the allocator somewhere...
	}
	if (globalStats.freeBytesTotal <= allocationSizeBytes)
	{
		__debugbreak(); // It shouldn't be possible to make this allocation if we don't have enough free total bytes
	}
	if (globalStats.usableFreeBytesTotal <= newAlloc.allocSize)
	{
		__debugbreak(); // It shouldn't be possible to make this allocation if we don't have enough free usable bytes
	}
#endif

	globalStats.rollingNumPlacementTests[globalStats.rollingPlacementID] = numPlacementTestsBeforeSuccess;
	globalStats.rollingPlacementID = (globalStats.rollingPlacementID + 1) % ARRAYSIZE(globalStats.rollingNumPlacementTests);

	++globalStats.currentGeneration;
	++globalStats.numLiveAllocations;
	++globalStats.numAllocationsThisFrame;
	globalStats.bytesAllocatedThisFrame += allocationSizeBytes;
	globalStats.freeBytesTotal -= allocationSizeBytes;
	globalStats.usableFreeBytesTotal -= newAlloc.allocSize;
	globalStats.allocatorFreePercent = globalStats.usableFreeBytesTotal / (const float)GPU_DRAM_TOTAL_CAPACITY_BYTES * 100.0f;
}

static gpuvoid* GPUAlloc_Internal(const unsigned allocationSizeBytes,
	const unsigned width, const unsigned short height, const unsigned short depth, const unsigned char numMipLevels, const allocationUsage usage, const gpuFormat format, const void* const apiObjectPtr
#ifdef _DEBUG
	, const char* const debugAllocationString
#endif
)
{
	const unsigned roundedUpAllocSize = RoundUpSizeToNextPage(allocationSizeBytes);
	const unsigned requiredAlignmentBytes = GetAlignmentSizeForUsage(usage);
#ifdef _DEBUG
	if (requiredAlignmentBytes % GPU_PAGE_SIZE_BYTES != 0)
	{
		__debugbreak(); // We assume that the alignment requirement will always be an even multiple of the GPU page size!
	}
#endif
	const unsigned allocPageCount = roundedUpAllocSize / GPU_PAGE_SIZE_BYTES;
	const unsigned allocColumnCount = RoundUpSizeToNextColumn(allocationSizeBytes) / GPU_COL_SIZE_BYTES;

	const ScopeLockCS lockAllocScope(&GPUAllocCS
#ifdef _DEBUG
		, GPUAllocCS_OwnerString, __FUNCTION__
		, GPUAllocCS_DebugAllocationString, debugAllocationString
#endif
	);

	/*unsigned numPlacementTests = 0;

	if (requiredAlignmentBytes == GPU_COL_SIZE_BYTES) // We are forced by our alignment restrictions to use the large page allocation scheme
	{
		// First try looking for a totally free range of columns that matches our size:
		for (unsigned columnIndex = 0; columnIndex < std::size(occupiedColumnsMap); ++columnIndex)
		{
			if (IsGPUColumnOccupied(columnIndex) == false)
			{
				bool isColumnRangeFree = true;
				for (unsigned columnIndexOffset = 1; columnIndexOffset < allocColumnCount; ++columnIndexOffset)
				{
					++numPlacementTests;

					if (IsGPUColumnOccupied(columnIndex + columnIndexOffset) )
					{
						isColumnRangeFree = false;
						break;
					}
				}

				if (isColumnRangeFree)
				{
					gpuvoid* const placementAddress = (gpuvoid* const)(columnIndex * GPU_COL_SIZE_BYTES);
					GPUPlaceAllocation_Internal(placementAddress, allocationSizeBytes, width, height, depth, numMipLevels, usage, format
#ifdef _DEBUG
						, debugAllocationString
#endif
						, numPlacementTests, lockAllocScope);
					return placementAddress;
				}
			}
		}

		// Next, attempt to allocate using our alignment requirements by doing a full page-scan, looking for the first available spot with the given alignment:
		for (unsigned alignedTestAddress = requiredAlignmentBytes; alignedTestAddress < GPU_DRAM_TOTAL_CAPACITY_BYTES; alignedTestAddress += requiredAlignmentBytes)
		{
			const unsigned startingPageIndex = alignedTestAddress / GPU_PAGE_SIZE_BYTES;
			const unsigned endingPageIndex = (alignedTestAddress + roundedUpAllocSize) / GPU_PAGE_SIZE_BYTES;

			++numPlacementTests;

			const bool allPagesFree = AreAllGPUPagesFree(startingPageIndex, allocPageCount);

			if (allPagesFree)
			{
				gpuvoid* const placementAddress = (gpuvoid* const)alignedTestAddress;
				GPUPlaceAllocation_Internal(placementAddress, allocationSizeBytes, width, height, depth, numMipLevels, usage, format
#ifdef _DEBUG
					, debugAllocationString
#endif
					, numPlacementTests, lockAllocScope);
				return placementAddress;
			}
		}

		// Oh no, we couldn't find a place for this new resource with its alignment requirements. Bail out!
#ifdef _DEBUG
		__debugbreak(); // Error: Was not able to allocate (either out of memory, or memory is too fragmented for this allocation to fit with its required alignment)
#endif
		return NULL;
	}

	// First try looking for an allocation spot that matches our alignment requirements but is in an existing occupied column. This should help reduce fragmentation and
	// prevents small allocations from blocking ones that require larger alignments (such as render targets and depth buffers).
	for (unsigned columnIndex = 0; columnIndex < std::size(occupiedColumnsMap); ++columnIndex)
	{
		if (IsGPUColumnOccupied(columnIndex) == true)
		{
			const gpuvoid* const columnStartAddress = (const gpuvoid* const)(columnIndex * GPU_COL_SIZE_BYTES);
			const gpuvoid* const columnEndAddress = (const gpuvoid* const)( ( (columnIndex + 1) * GPU_COL_SIZE_BYTES) - requiredAlignmentBytes);
			for (unsigned testAddress = (const unsigned)columnStartAddress; testAddress < (const unsigned)columnEndAddress; testAddress += requiredAlignmentBytes)
			{
				const unsigned startingPage = testAddress / GPU_PAGE_SIZE_BYTES;
				const unsigned endingPage = startingPage + allocPageCount;

				++numPlacementTests;

				const bool allPagesFree = AreAllGPUPagesFree(startingPage, allocPageCount);
				if (allPagesFree)
				{
					gpuvoid* const placementAddress = (gpuvoid* const)testAddress;
					GPUPlaceAllocation_Internal(placementAddress, allocationSizeBytes, width, height, depth, numMipLevels, usage, format
#ifdef _DEBUG
						, debugAllocationString
#endif
						, numPlacementTests, lockAllocScope);
					return placementAddress;
				}
			}
		}
	}

	// If that doesn't work, then we have to walk the whole page-space looking for enough contiguous free pages to satisfy our request:
	for (unsigned alignedTestAddress = requiredAlignmentBytes; alignedTestAddress < GPU_DRAM_TOTAL_CAPACITY_BYTES; alignedTestAddress += requiredAlignmentBytes)
	{
		const unsigned startingPageIndex = alignedTestAddress / GPU_PAGE_SIZE_BYTES;
		const unsigned endingPageIndex = (alignedTestAddress + roundedUpAllocSize) / GPU_PAGE_SIZE_BYTES;

		++numPlacementTests;

		const bool allPagesFree = AreAllGPUPagesFree(startingPageIndex, allocPageCount);
		if (allPagesFree)
		{
			gpuvoid* const placementAddress = (gpuvoid* const)alignedTestAddress;
			GPUPlaceAllocation_Internal(placementAddress, allocationSizeBytes, width, height, depth, numMipLevels, usage, format
#ifdef _DEBUG
				, debugAllocationString
#endif
				, numPlacementTests, lockAllocScope);
			return placementAddress;
		}
	}

#ifdef _DEBUG
	__debugbreak(); // Uh oh, we couldn't find a spot where this allocation fits!
#endif
	// Oh no, we couldn't find an allocation!
	return NULL;*/

	gpuvoid* const placementAddress = FreeTree.Alloc(roundedUpAllocSize, requiredAlignmentBytes);
	GPUPlaceAllocation_Internal(placementAddress, allocationSizeBytes, width, height, depth, numMipLevels, usage, format, apiObjectPtr
#ifdef _DEBUG
		, debugAllocationString
#endif
		, 1, lockAllocScope);
	return placementAddress;
}

// Returns the base address of the allocation the range is contained in, or NULL otherwise. The range may not straddle multiple adjacent allocations.
const gpuvoid* const ValidateMemoryRangeExistsInsideAllocation(const gpuvoid* const rangeBegin, const unsigned rangeLengthBytes)
{
	if (GPUAllocInitialized == false)
	{
#ifdef _DEBUG
		__debugbreak(); // Do not call this function without having first initialized the allocator!
#endif
		return NULL;
	}

	if (rangeLengthBytes < 1)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot validate 0-sized ranges!
#endif
		return NULL;
	}

	if (rangeLengthBytes >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot have ranges as large or larger than the entire GPU RAM!
#endif
		return NULL;
	}

	if ( (size_t)rangeBegin < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate within the NULL page!
#endif
		return NULL;
	}

	if ( (size_t)(rangeBegin) >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot start an allocation out of the range of the GPU RAM!
#endif
		return NULL;
	}

	if ( (size_t)rangeBegin + (size_t)rangeLengthBytes > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot end an allocation out of the range of the GPU RAM!
#endif
		return NULL;
	}

	// Early out for now for optimization testing:
	return (const gpuvoid* const)1;

	const unsigned startingColumnIndex = (const unsigned)rangeBegin / GPU_COL_SIZE_BYTES;
	const unsigned endingColumnIndex = ( (const unsigned)rangeBegin + (rangeLengthBytes-1) ) / GPU_COL_SIZE_BYTES;
	const unsigned startingPageIndex = (const unsigned)rangeBegin / GPU_PAGE_SIZE_BYTES;
	const unsigned endingPageIndex = ( (const unsigned)rangeBegin + (rangeLengthBytes-1) ) / GPU_PAGE_SIZE_BYTES;

	const ScopeLockCS lockAllocScope(&GPUAllocCS
#ifdef _DEBUG
		, GPUAllocCS_OwnerString, __FUNCTION__
		, GPUAllocCS_DebugAllocationString, __FUNCTION__
#endif
	);

	for (unsigned columnID = startingColumnIndex; columnID <= endingColumnIndex; ++columnID)
	{
		if (!IsGPUColumnOccupied(columnID) )
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return NULL;
		}
	}

	if (!AreAllGPUPagesOccupied(startingPageIndex, endingPageIndex - startingPageIndex + 1) )
	{
#ifdef _DEBUG
		__debugbreak();
#endif
		return NULL;
	}

	// First check for the simple, common case of the range coinciding with the allocation beginning
	const std::map<gpuvoid*, liveAllocation>::const_iterator foundBaseIt = liveAllocationsMap.find( (gpuvoid* const)rangeBegin);
	if (foundBaseIt != liveAllocationsMap.end() )
	{
		const liveAllocation& startingAllocation = foundBaseIt->second;
		const bool rangeIsInsideStart = (rangeBegin >= startingAllocation.allocAddress);
		const size_t rangeEnd = (const size_t)rangeBegin + rangeLengthBytes;
		const bool rangeIsInsideEnd = rangeEnd <= ( (const size_t)startingAllocation.allocAddress + startingAllocation.requestedSize);
		if (!rangeIsInsideStart || !rangeIsInsideEnd)
		{
#ifdef _DEBUG
			__debugbreak(); // Error! Range straddles this allocation!
#endif
			return NULL;
		}
		return startingAllocation.allocAddress;
	}

	// Fall back to the more complicated algorithm for finding the allocation that contains this range
	for (std::map<gpuvoid*, liveAllocation>::const_iterator iter = liveAllocationsMap.begin(); iter != liveAllocationsMap.end(); ++iter)
	{
		const liveAllocation& thisAllocation = iter->second;
		const bool rangeIsInsideStart = (rangeBegin >= thisAllocation.allocAddress);
		const size_t rangeEnd = (const size_t)rangeBegin + rangeLengthBytes;
		const bool rangeIsInsideEnd = rangeEnd <= ( (const size_t)thisAllocation.allocAddress + thisAllocation.requestedSize);

		if (rangeIsInsideStart && rangeIsInsideEnd)
			return thisAllocation.allocAddress;
	}

#ifdef _DEBUG
	__debugbreak(); // Oh no! We didn't find any allocations that our range belongs to!
#endif
	return NULL;
}

// Returns NULL if allocation fails (due to out of GPU memory, out of GPU address space, etc.)
gpuvoid* GPUAlloc(const unsigned allocationSizeBytes,
	const unsigned width, const unsigned short height, const unsigned short depth, const unsigned char numMipLevels, const allocationUsage usage, const gpuFormat format, const void* const apiObjectPtr
#ifdef _DEBUG
	, const char* const debugAllocationString
#endif
)
{
	if (GPUAllocInitialized == false)
	{
#ifdef _DEBUG
		__debugbreak(); // Do not call this function without having first initialized the allocator!
#endif
		return NULL;
	}

#ifdef _DEBUG
	if (debugAllocationString == NULL)
	{
		__debugbreak(); // In Debug builds, you must specify a debug allocation string when calling this function!
	}
#endif

	if (allocationSizeBytes < 1)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot make 0-sized allocations!
#endif
		return NULL;
	}

	if (allocationSizeBytes >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot make allocations as large or larger than the entire GPU RAM!
#endif
		return NULL;
	}

	if (!ValidateUsage(usage) )
	{
#ifdef _DEBUG
		__debugbreak(); // Invalid usage specified!
#endif
		return NULL;
	}

	if (!ValidateFormat(format) )
	{
#ifdef _DEBUG
		__debugbreak(); // Invalid format specified!
#endif
		return NULL;
	}

	if (!ValidateFormatForUsage(format, usage) )
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate as the format-usage pair is invalid
#endif
		return NULL;
	}

	gpuvoid* const retAlloc = GPUAlloc_Internal(allocationSizeBytes, width, height, depth, numMipLevels, usage, format, apiObjectPtr
#ifdef _DEBUG
		, debugAllocationString
#endif
	);

	return retAlloc;
}

static inline void CheckSetColumnEmpty(const unsigned gpuColumnIndex, const ScopeLockCS& lockedScope)
{
	const gpuvoid* const startingColumnAddress = (const gpuvoid* const)(gpuColumnIndex * GPU_COL_SIZE_BYTES);
	const unsigned startingPageIndex = (const unsigned)startingColumnAddress / GPU_PAGE_SIZE_BYTES;
	const unsigned startingBitmapIndex = startingPageIndex / (sizeof(uint32_t) * 8);
	const unsigned numBitmapsPerColumn = GPU_NUM_PAGES_PER_COLUMN / (sizeof(uint32_t) * 8);
	for (unsigned bitmapIndexOffset = 0; bitmapIndexOffset < numBitmapsPerColumn; ++bitmapIndexOffset)
	{
		const unsigned bitmapIndex = startingBitmapIndex + bitmapIndexOffset;
		if (occupiedPagesBitmap[bitmapIndex] != 0x0000)
		{
			return;
		}
	}

	// If we've made it this far, then we know that all of the pages for this column are freed and so we can mark the whole column as freed too
	SetGPUColumnOccupied(gpuColumnIndex, true);
}

static void GPUFree_Internal(gpuvoid* gpuAlloc)
{
#ifdef _DEBUG
	if ( (const unsigned)gpuAlloc < GPU_PAGE_SIZE_BYTES)
	{
		__debugbreak(); // Should never be here! Invalid allocation pointer. Do not free the special NULL page!
	}
#endif

	const unsigned allocStartingPageIndex = (const unsigned)gpuAlloc / GPU_PAGE_SIZE_BYTES;
	const unsigned allocStartingColumnIndex = (const unsigned)gpuAlloc / GPU_COL_SIZE_BYTES;

	const ScopeLockCS lockAllocScope(&GPUAllocCS
#ifdef _DEBUG
		, GPUAllocCS_OwnerString, __FUNCTION__
		, GPUAllocCS_DebugAllocationString, "Free"
#endif
	);

#ifdef _DEBUG
	if (globalStats.numLiveAllocations == 0)
	{
		__debugbreak(); // Error, invalid allocations count!
	}
#endif

	const std::map<gpuvoid*, liveAllocation>::iterator existingAllocIt = liveAllocationsMap.find(gpuAlloc);
	if (existingAllocIt == liveAllocationsMap.end() )
	{
#ifdef _DEBUG
		__debugbreak(); // Error! Double-free or cannot locate existing allocation!
#endif
		return;
	}

	const liveAllocation& foundExistingAllocation = existingAllocIt->second;
#ifdef _DEBUG
	if (foundExistingAllocation.allocAddress != gpuAlloc)
	{
		__debugbreak(); // This should never happen - somehow the allocation at our address doesn't match our address!
	}
#endif
	const unsigned allocPageCount = foundExistingAllocation.allocSize / GPU_PAGE_SIZE_BYTES;
#ifdef _DEBUG
	if (!AreAllGPUPagesOccupied(allocStartingPageIndex, allocPageCount) )
	{
		__debugbreak(); // Error: The original allocation was not fully allocated!
	}
#endif
	BulkSetGPUPagesUnoccupied(allocStartingPageIndex, allocPageCount);

	// Check to see if the entire column is now freed, and mark it as such if that's the case:
	const unsigned allocColumnCount = RoundUpSizeToNextColumn(foundExistingAllocation.allocSize) / GPU_COL_SIZE_BYTES;
	for (unsigned columnIndexOffset = 0; columnIndexOffset < allocColumnCount; ++columnIndexOffset)
	{
		const unsigned columnIndex = allocStartingColumnIndex + columnIndexOffset;
		CheckSetColumnEmpty(columnIndex, lockAllocScope);
	}

	// Add the freed memory pages back into our free lists:
	FreeTree.FreeAlloc(gpuAlloc, foundExistingAllocation.allocSize);

	// Update our global stats:
#ifdef _DEBUG
	if (globalStats.numLiveAllocations == 0)
	{
		__debugbreak(); // Should never be here!
	}
#endif
	++globalStats.currentGeneration;
	--globalStats.numLiveAllocations;
	++globalStats.numFreesThisFrame;
	globalStats.bytesFreedThisFrame += foundExistingAllocation.allocSize;
	globalStats.freeBytesTotal += foundExistingAllocation.requestedSize;
	globalStats.usableFreeBytesTotal += foundExistingAllocation.allocSize;
	globalStats.allocatorFreePercent = globalStats.usableFreeBytesTotal / (const float)GPU_DRAM_TOTAL_CAPACITY_BYTES * 100.0f;
#ifdef _DEBUG
	if (globalStats.freeBytesTotal > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Can never have more bytes free than we have in total capacity
	}
	if (globalStats.usableFreeBytesTotal > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
		__debugbreak(); // Can never have more bytes free than we have in usable capacity
	}
#endif

	liveAllocationsMap.erase(existingAllocIt);
}

// Frees an existing allocation
void GPUFree(gpuvoid* gpuAlloc)
{
	if (GPUAllocInitialized == false)
	{
#ifdef _DEBUG
		__debugbreak(); // Do not call this function without having first initialized the allocator!
#endif
		return;
	}

	if ( (size_t)(gpuAlloc) >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot free an allocation out of the range of the GPU RAM!
#endif
		return;
	}

	// Let's try to preserve C-style semantics as much as possible and let the first page be inaccessible as "the NULL page"
	if (gpuAlloc == NULL)
	{
		// Return here so that we don't free our special NULL page!
		return;
	}

	GPUFree_Internal(gpuAlloc);
}

// Returns the placementAddress if allocation at this address was successful, or returns NULL if the allocation failed for some reason
static gpuvoid* GPUAllocAtAddress_Internal(gpuvoid* const placementAddress, const unsigned allocationSizeBytes,
	const unsigned width, const unsigned short height, const unsigned short depth, const unsigned char numMipLevels, const allocationUsage usage, const gpuFormat format, const void* const apiObjectPtr
#ifdef _DEBUG
	, const char* const debugAllocationString
#endif
)
{
	const unsigned startingColumnIndex = (const unsigned)placementAddress / GPU_COL_SIZE_BYTES;
	const unsigned endingColumnIndex = ( (const unsigned)placementAddress + (allocationSizeBytes-1) ) / GPU_COL_SIZE_BYTES;
	const unsigned startingPageIndex = (const unsigned)placementAddress / GPU_PAGE_SIZE_BYTES;
	const unsigned endingPageIndex = ( (const unsigned)placementAddress + (allocationSizeBytes-1) ) / GPU_PAGE_SIZE_BYTES;

	const ScopeLockCS lockAllocScope(&GPUAllocCS
#ifdef _DEBUG
		, GPUAllocCS_OwnerString, __FUNCTION__
		, GPUAllocCS_DebugAllocationString, debugAllocationString
#endif
	);

	const std::map<gpuvoid*, liveAllocation>::const_iterator existingAllocationIt = liveAllocationsMap.find(placementAddress);
	if (existingAllocationIt != liveAllocationsMap.end() )
	{
		return NULL; // There's already an existing allocation at this address, cannot allocate here!
	}

	// Remove our allocation region from the FreeTree:
	if (!FreeTree.AllocAtAddress(placementAddress, allocationSizeBytes) )
	{
		return NULL; // Our requested address is not available in the FreeTree
	}

	// First perform the trivial allocation check of all of the columns being empty for this allocation:
	bool allColumnsFree = true;
	for (unsigned gpuColumnIndex = startingColumnIndex; gpuColumnIndex <= endingColumnIndex; ++gpuColumnIndex)
	{
		if (IsGPUColumnOccupied(gpuColumnIndex) )
		{
			allColumnsFree = false;
			break;
		}
	}

	// If the trivial check succeeds, then great! We can allocate the easy way:
	if (allColumnsFree)
	{
		GPUPlaceAllocation_Internal(placementAddress, allocationSizeBytes, width, height, depth, numMipLevels, usage, format, apiObjectPtr
#ifdef _DEBUG
			, debugAllocationString
#endif
			, 1, lockAllocScope);
		return placementAddress;
	}

	// We have to perform the more complicated per-page scan at this point:
	if (!AreAllGPUPagesFree(startingPageIndex, allocationSizeBytes / GPU_PAGE_SIZE_BYTES) )
	{
		return NULL;
	}

	// Looks like our page scan succeeded, we can allocate here!
	GPUPlaceAllocation_Internal(placementAddress, allocationSizeBytes, width, height, depth, numMipLevels, usage, format, apiObjectPtr
#ifdef _DEBUG
		, debugAllocationString
#endif
		, 1, lockAllocScope);
	return placementAddress;
}

// Returns NULL if allocation fails (due to out of GPU memory, cannot fit allocation at the requested address, out of GPU address space, etc.)
gpuvoid* GPUAllocAtAddress(gpuvoid* const placementAddress, const unsigned allocationSizeBytes,
	const unsigned width, const unsigned short height, const unsigned short depth, const unsigned char numMipLevels, const allocationUsage usage, const gpuFormat format, const void* const apiObjectPtr
#ifdef _DEBUG
	, const char* const debugAllocationString
#endif
)
{
	if (GPUAllocInitialized == false)
	{
#ifdef _DEBUG
		__debugbreak(); // Do not call this function without having first initialized the allocator!
#endif
		return NULL;
	}

#ifdef _DEBUG
	if (debugAllocationString == NULL)
	{
		__debugbreak(); // In Debug builds, you must specify a debug allocation string when calling this function!
	}
#endif

	if (allocationSizeBytes < 1)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot make 0-sized allocations!
#endif
		return NULL;
	}

	if (allocationSizeBytes >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot make allocations as large or larger than the entire GPU RAM!
#endif
		return NULL;
	}

	if ( (size_t)placementAddress < GPU_PAGE_SIZE_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate within the NULL page!
#endif
		return NULL;
	}

	if ( (size_t)(placementAddress) >= GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot start an allocation out of the range of the GPU RAM!
#endif
		return NULL;
	}

	if ( (size_t)placementAddress + (size_t)allocationSizeBytes > GPU_DRAM_TOTAL_CAPACITY_BYTES)
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot end an allocation out of the range of the GPU RAM!
#endif
		return NULL;
	}

	if (!ValidateUsage(usage) )
	{
#ifdef _DEBUG
		__debugbreak(); // Invalid usage specified!
#endif
		return NULL;
	}

	if (!ValidateFormat(format) )
	{
#ifdef _DEBUG
		__debugbreak(); // Invalid format specified!
#endif
		return NULL;
	}

	if (!ValidateFormatForUsage(format, usage) )
	{
#ifdef _DEBUG
		__debugbreak(); // Cannot allocate as the format-usage pair is invalid
#endif
		return NULL;
	}

	if (!ValidateAddressForUsageAlignment(placementAddress, usage) )
	{
#ifdef _DEBUG
		__debugbreak(); // Misaligned allocation address for this usage type!
#endif
		return NULL;
	}

	return GPUAllocAtAddress_Internal(placementAddress, allocationSizeBytes, width, height, depth, numMipLevels, usage, format, apiObjectPtr
#ifdef _DEBUG
		, debugAllocationString
#endif
	);
}

void IterateAllLiveAllocs(const std::function<void (const liveAllocation& thisAlloc)> callbackFunction)
{
	const ScopeLockCS lockAllocScope(&GPUAllocCS
#ifdef _DEBUG
		, GPUAllocCS_OwnerString, __FUNCTION__
		, GPUAllocCS_DebugAllocationString, __FUNCTION__
#endif
	);

	for (std::map<gpuvoid*, liveAllocation>::const_iterator iter = liveAllocationsMap.cbegin(); iter != liveAllocationsMap.cend(); ++iter)
	{
		(callbackFunction)(iter->second);
	}
}
