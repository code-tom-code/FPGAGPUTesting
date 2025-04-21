#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "INIVar.h"
#include <unordered_map>
#include <Windows.h>

static const char* const GlobalSettingsFilename = "C:\\Program Files (x86)\\DragonGPU\\GlobalDriverSettingsDefaults.ini"; // TODO: Don't hardcode this

namespace INIRegistry
{
	std::unordered_map<unsigned, INIVar*>& GetVarRegistrySingleton()
	{
		static std::unordered_map<unsigned, INIVar*> RegisteredVars;
		return RegisteredVars;
	}

	void RegisterVar(INIVar& newVar)
	{
		const unsigned newHash = newVar.GenerateSectionKeyHash();
		std::unordered_map<unsigned, INIVar*>& RegisteredVars = GetVarRegistrySingleton();
#ifdef _DEBUG
		const std::unordered_map<unsigned, INIVar*>& CRegisteredVars = RegisteredVars;
		const std::unordered_map<unsigned, INIVar*>::const_iterator findIt = CRegisteredVars.find(newHash);
		if (findIt != CRegisteredVars.cend() )
		{
			const INIVar* const existingVar = findIt->second;
#pragma warning(push)
#pragma warning(disable:4474)
			printf("", existingVar, &newVar);
#pragma warning(pop)
			__debugbreak(); // Error: Section+Key hash collision!
		}
#endif
		RegisteredVars.insert(std::make_pair(newHash, &newVar) );
	}

	void ParseINIData(INIVar& loadVar, const char* const INIBuffer)
	{
		switch (loadVar.DataType)
		{
		default:
		{
#ifdef _DEBUG
			__debugbreak(); // Should never be here! Invalid data type!
#endif
			return;
		}
		case INIVar::dt_unsigned:
			loadVar.Data.uData = strtoul(INIBuffer, NULL, 10);
			break;
		case INIVar::dt_integer:
			loadVar.Data.iData = atoi(INIBuffer);
			break;
		case INIVar::dt_float:
			loadVar.Data.fData = (const float)atof(INIBuffer);
			break;
		case INIVar::dt_string:
		{
			if (loadVar.heapAllocString)
			{
				free(const_cast<char* const>(loadVar.Data.sData) );
				loadVar.Data.sData = NULL;
			}
			const unsigned newLen = strlen(INIBuffer);
			char* const newBuffer = (char* const)malloc(newLen + 1);
#pragma warning(push)
#pragma warning(disable:4996)
			strcpy(newBuffer, INIBuffer);
#pragma warning(pop)
			loadVar.Data.sData = newBuffer;
		}
		break;
		case INIVar::dt_bool:
			loadVar.Data.bData = false;
			if (INIBuffer[0] == 'T' || INIBuffer[0] == 't' || INIBuffer[0] == 'Y' || INIBuffer[0] == 'y' || (INIBuffer[0] > '0' && INIBuffer[0] <= '9') )
				loadVar.Data.bData = true;
			break;
		}
	}

	void LoadINIData(INIVar& loadVar, const char* const localSettingsFilename)
	{
		char stringBuffer[MAX_PATH] = {0};
		if (GetPrivateProfileStringA(loadVar.SectionName, loadVar.VarName, NULL, stringBuffer, sizeof(stringBuffer) - 1, GlobalSettingsFilename) > 0 && stringBuffer[0] != '\0')
		{
			ParseINIData(loadVar, stringBuffer);
		}
		if (GetPrivateProfileStringA(loadVar.SectionName, loadVar.VarName, NULL, stringBuffer, sizeof(stringBuffer) - 1, localSettingsFilename) > 0 && stringBuffer[0] != '\0')
		{
			ParseINIData(loadVar, stringBuffer);
		}
	}

	void InitLoadAllINIData()
	{
		char modulePath[MAX_PATH] = {0};
		if (!GetModuleFileNameA(NULL, modulePath, sizeof(modulePath) - 1) )
		{
#ifdef _DEBUG
			__debugbreak(); // Should never fail!
#endif
		}
		char moduleName[MAX_PATH] = {0};
		char moduleDir[MAX_PATH] = {0};
		char moduleDrive[4] = {0};
#pragma warning(push)
#pragma warning(disable:4996)
		_splitpath(modulePath, moduleDrive, moduleDir, moduleName, NULL);
#pragma warning(pop)
		char localSettingsFilepath[MAX_PATH] = {0};
		sprintf_s(localSettingsFilepath, "%s%s%sLocalSettings.ini", moduleDrive, moduleDir, moduleName);
		const std::unordered_map<unsigned, INIVar*>& CRegisteredVars = GetVarRegistrySingleton();
		for (std::unordered_map<unsigned, INIVar*>::const_iterator it = CRegisteredVars.cbegin(); it != CRegisteredVars.cend(); ++it)
		{
			INIVar* const thisVar = it->second;
			LoadINIData(*thisVar, localSettingsFilepath);
		}
	}
}

INIVar::~INIVar()
{
	if (heapAllocString && DataType == dt_string)
	{
		free(const_cast<char* const>(Data.sData) );
		Data.sData = NULL;
		heapAllocString = false;
	}
}

const unsigned INIVar::GenerateSectionKeyHash() const
{
	const unsigned sectionLen = strlen(SectionName);
	const unsigned keyLen = strlen(VarName);

	unsigned hash = 0;
	for (unsigned x = 0; x < sectionLen; ++x)
	{
		hash ^= SectionName[x];
		hash = _rotl(hash, 27);
	}
	for (unsigned x = 0; x < keyLen; ++x)
	{
		hash ^= VarName[x];
		hash = _rotl(hash, 29);
	}
	return hash;
}
