
#include "LiveObjectCounter.h"
#include <vector>

static CRITICAL_SECTION lockCS = {0};
static bool hasInit = false;

static volatile long LiveObjectCounts[LOT_COUNT] = {0};

struct LiveObject
{
	const void* objectPtr;
	const void* parentPtr;
};

// These vectors are protected by the lockCS above
static std::vector<LiveObject> LiveObjectLists[LOT_COUNT];

void InitLiveObjectCounters()
{
#ifdef _DEBUG
	if (hasInit)
	{
		__debugbreak(); // Error - only call this function once on startup!
	}
#endif
	InitializeCriticalSection(&lockCS);
	hasInit = true;
}

void RegisterNewLiveObject(const LiveObjectType type, const void* const ptr, const void* const parentPtr)
{
#ifdef _DEBUG
	if (type >= LOT_COUNT)
	{
		__debugbreak(); // Type is out of range!
	}
	if (!hasInit)
	{
		__debugbreak(); // You must initialize the system before calling this function!
	}
#endif
	InterlockedIncrement(&LiveObjectCounts[type]);

	LiveObject newObj;
	newObj.objectPtr = ptr;
	newObj.parentPtr = parentPtr;

	EnterCriticalSection(&lockCS);
	std::vector<LiveObject>& thisList = LiveObjectLists[type];
#ifdef _DEBUG
	const unsigned numObjects = thisList.size();
	for (unsigned x = 0; x < numObjects; ++x)
	{
		if (thisList[x].objectPtr == ptr)
		{
			__debugbreak(); // Error: Duplicate object registration detected!
		}
	}
#endif
	thisList.push_back(newObj);
	LeaveCriticalSection(&lockCS);
}

void UnregisterLiveObject(const LiveObjectType type, const void* const ptr, const void* const parentPtr)
{
#ifdef _DEBUG
	if (type >= LOT_COUNT)
	{
		__debugbreak(); // Type is out of range!
	}
	if (!hasInit)
	{
		__debugbreak(); // You must initialize the system before calling this function!
	}
#endif
	InterlockedDecrement(&LiveObjectCounts[type]);

#ifdef _DEBUG
	bool foundObject = false;
#endif
	EnterCriticalSection(&lockCS);
	std::vector<LiveObject>& thisList = LiveObjectLists[type];
	const unsigned numElements = thisList.size();
	for (unsigned x = 0; x < numElements; ++x)
	{
		if (thisList[x].objectPtr == ptr)
		{
#ifdef _DEBUG
			if (thisList[x].parentPtr != parentPtr)
			{
				__debugbreak(); // Error: Parent pointers do not match! Possibly different object or duplicate registration?
			}
#endif
			thisList.erase(thisList.begin() + x);
#ifdef _DEBUG
			foundObject = true;
#endif
			break;
		}
	}
	LeaveCriticalSection(&lockCS);
#ifdef _DEBUG
	if (foundObject == false)
	{
		__debugbreak(); // Error: Live object was not found in the list!
	}
#endif
}

const unsigned GetLiveObjectsCount(const LiveObjectType type)
{
#ifdef _DEBUG
	if (type >= LOT_COUNT)
	{
		__debugbreak(); // Type is out of range!
	}
	if (!hasInit)
	{
		__debugbreak(); // You must initialize the system before calling this function!
	}
#endif
	return LiveObjectCounts[type];
}

void ShutdownLiveObjectCounters()
{
#ifdef _DEBUG
	if (hasInit == false)
	{
		__debugbreak(); // Error - only call this function once on shutdown!
	}
#endif

	EnterCriticalSection(&lockCS);
	for (unsigned char x = 0; x < LOT_COUNT; ++x)
	{
		LiveObjectLists[x].clear();
		LiveObjectCounts[x] = 0;
	}
	LeaveCriticalSection(&lockCS);

	DeleteCriticalSection(&lockCS);
	memset(&lockCS, 0, sizeof(lockCS) );

	hasInit = false;
}
