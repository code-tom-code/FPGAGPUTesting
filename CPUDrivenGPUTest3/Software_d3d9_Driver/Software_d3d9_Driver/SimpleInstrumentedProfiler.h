#pragma once

#define ENABLE_SIMPLE_PROFILER 0

#if defined(_M_X64) && !defined(_DEBUG) // The new PIX profiler only works for x64 targets
	#define ENABLE_PIX_PROFILER 1
#endif

#if ENABLE_SIMPLE_PROFILER
	// TODO: Don't hardcode this path
	#include "C:\\Users\\Tom\\Documents\\Visual Studio 2017\\Projects\\SimpleHFileProfiler\\SimpleHFileProfiler\\SimpleProfiler.h"
#elif ENABLE_PIX_PROFILER
	#define USE_PIX 1
	#include "WinPixEventRuntime\\pix3.h"
	#pragma comment(lib, "C:\\Users\\Tom\\Documents\\Visual Studio 2017\\Projects\\Software_d3d9_Driver\\Software_d3d9_Driver\\WinPixEventRuntime\\WinPixEventRuntime.lib") // TODO: Don't hardcode this path in the future

	#define SIMPLE_DYNAMIC_STRING_SCOPE(dynamicStringScopeName) PIXScopedEvent(PIX_COLOR_DEFAULT, dynamicStringScopeName)
	#define SIMPLE_NAME_SCOPE(scopeName) PIXScopedEvent(PIX_COLOR_DEFAULT, scopeName)
	#define SIMPLE_FUNC_SCOPE() PIXScopedEvent(PIX_COLOR_DEFAULT, __FUNCTION__)
	#define SIMPLE_FRAME_END_MARKER() PIXSetMarker(PIX_COLOR_DEFAULT, "END FRAME MARKER")
	struct PIX_CONDITIONAL_SCOPE_WRAPPER
	{
		PIX_CONDITIONAL_SCOPE_WRAPPER(const char* const scopeName, const bool _conditional) : conditional(_conditional)
		{ 
			if (conditional == true) 
			{
				PIXBeginEvent(PIX_COLOR_DEFAULT, scopeName);
			}
		}
		~PIX_CONDITIONAL_SCOPE_WRAPPER()
		{
			if (conditional == true)
			{
				PIXEndEvent();
			}
		}
	private:
		const bool conditional;
	};
	#define SIMPLE_DYNAMIC_STRING_SCOPE_CONDITIONAL(dynamicStringScopeName, conditional) PIX_CONDITIONAL_SCOPE_WRAPPER _conditionalAutoNameDynamicNameScope(dynamicStringScopeName, (conditional) )
	#define SIMPLE_NAME_SCOPE_CONDITIONAL(scopeName, conditional) PIX_CONDITIONAL_SCOPE_WRAPPER _conditionalAutoNameDynamicNameScope(scopeName, (conditional) )
	#define SIMPLE_FUNC_SCOPE_CONDITIONAL(conditional) PIX_CONDITIONAL_SCOPE_WRAPPER _conditionalAutoNameDynamicNameScope(__FUNCTION__, (conditional) )
#else
	#define SIMPLE_DYNAMIC_STRING_SCOPE(dynamicStringScopeName) dynamicStringScopeName
	#define SIMPLE_DYNAMIC_STRING_SCOPE_CONDITIONAL(dynamicStringScopeName, conditional) dynamicStringScopeName; (conditional)
	#define SIMPLE_NAME_SCOPE(scopeName) scopeName
	#define SIMPLE_NAME_SCOPE_CONDITIONAL(scopeName, conditional) scopeName; (conditional)
	#define SIMPLE_FUNC_SCOPE()
	#define SIMPLE_FUNC_SCOPE_CONDITIONAL(conditional) (conditional)
	#define SIMPLE_FRAME_END_MARKER()
#endif
