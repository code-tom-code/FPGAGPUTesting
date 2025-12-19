#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
static const DWORD MS_VC_EXCEPTION = 0x406D1388;

// This struct definition and following code comes from MSDN: https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2015/debugger/how-to-set-a-thread-name-in-native-code
#pragma pack(push)
#pragma pack(8)
struct THREADNAME_INFO
{
	DWORD dwType = 0x1000; // Must be 0x1000.
	LPCSTR szName; // Pointer to name (in user addr space).
	DWORD dwThreadID; // Thread ID (-1=caller thread).
	DWORD dwFlags = {0}; // Reserved for future use, must be zero.
};
#pragma pack(pop)

void UtilSetThreadName(const char* const threadName)
{
	THREADNAME_INFO info;
	info.szName = threadName;
	info.dwThreadID = GetCurrentThreadId();

	__try
	{
		RaiseException(MS_VC_EXCEPTION, 0, sizeof(info) / sizeof(ULONG_PTR), (const ULONG_PTR* const)&info);
	}
	__except(EXCEPTION_EXECUTE_HANDLER)
	{
	}

	{
		WCHAR unicodeConversionBuffer[MAX_PATH] = {0};
		const size_t threadNameLen = strlen(threadName);
		if (threadNameLen >= ARRAYSIZE(unicodeConversionBuffer) - 1)
		{
#ifdef _DEBUG
			__debugbreak();
#endif
			return; // Can't name this thread without crashing due to stack corruption!
		}
		MultiByteToWideChar(CP_ACP, 0, threadName, -1, unicodeConversionBuffer, (const int)threadNameLen);
	
		SetThreadDescription(GetCurrentThread(), unicodeConversionBuffer);
	}
}
