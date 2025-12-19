#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#include "INIVar.h"
#include <unordered_map>
#include <Windows.h>
#include <Shlobj.h> // for SHGetFolderPathA()

#pragma comment(lib, "Shell32.lib") // for SHGetFolderPathA()

static const char* const ProductName = "DragonGPU";
static const char* const GlobalSettingsFilename = "GlobalDriverSettingsDefaults.ini";
static const char* const LocalSettingsFilenameSuffix = "LocalSettings.ini";

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

	void GetGlobalSettingsFilePath(char (&outGlobalSettingsPath)[MAX_PATH])
	{
		char programFilesPath[MAX_PATH] = {0};
		if (FAILED(SHGetFolderPathA(NULL, CSIDL_PROGRAM_FILES, NULL, SHGFP_TYPE_CURRENT, programFilesPath) ) )
		{
#ifdef _DEBUG
			__debugbreak(); // Should never be here!
#endif
		}
		sprintf_s(outGlobalSettingsPath, "%s\\%s\\%s", programFilesPath, ProductName, GlobalSettingsFilename);
	}

	void GetLocalSettingsFilePath(char (&outLocalSettingsPath)[MAX_PATH])
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
		sprintf_s(outLocalSettingsPath, "%s%s%s%s", moduleDrive, moduleDir, moduleName, LocalSettingsFilenameSuffix);
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

	void LoadINIData(INIVar& loadVar, const char* const globalSettingsFilepath, const char* const localSettingsFilepath)
	{
		char stringBuffer[MAX_PATH] = {0};
		if (GetPrivateProfileStringA(loadVar.SectionName, loadVar.VarName, NULL, stringBuffer, sizeof(stringBuffer) - 1, globalSettingsFilepath) > 0 && stringBuffer[0] != '\0')
		{
			ParseINIData(loadVar, stringBuffer);
		}
		if (GetPrivateProfileStringA(loadVar.SectionName, loadVar.VarName, NULL, stringBuffer, sizeof(stringBuffer) - 1, localSettingsFilepath) > 0 && stringBuffer[0] != '\0')
		{
			ParseINIData(loadVar, stringBuffer);
		}
	}

	const bool FileExists(const char* const filepath)
	{
		const DWORD ret = GetFileAttributesA(filepath);
		if (ret == INVALID_FILE_ATTRIBUTES)
			return false; // File doesn't exist!
		if (ret & FILE_ATTRIBUTE_DIRECTORY)
			return false; // This is a directory, not a file!
		return true;
	}

	void LoadINIStringRaw(char (&outStringBuffer)[MAX_PATH], const char* const sectionName, const char* const varName)
	{
		char globalSettingsFilepath[MAX_PATH] = {0};
		GetGlobalSettingsFilePath(globalSettingsFilepath);
		const bool globalFileExists = FileExists(globalSettingsFilepath);
		char localSettingsFilepath[MAX_PATH] = {0};
		GetLocalSettingsFilePath(localSettingsFilepath);
		const bool localFileExists = FileExists(localSettingsFilepath);
		outStringBuffer[0] = '\0';
		if (globalFileExists && GetPrivateProfileStringA(sectionName, varName, NULL, globalSettingsFilepath, sizeof(outStringBuffer) - 1, globalSettingsFilepath) > 0 && globalSettingsFilepath[0] != '\0')
		{
			strcpy_s(outStringBuffer, globalSettingsFilepath);
		}
		if (localFileExists && GetPrivateProfileStringA(sectionName, varName, NULL, localSettingsFilepath, sizeof(outStringBuffer) - 1, localSettingsFilepath) > 0 && localSettingsFilepath[0] != '\0')
		{
			strcpy_s(outStringBuffer, localSettingsFilepath);
		}
	}

	void InitLoadAllINIData()
	{
		char globalSettingsFilepath[MAX_PATH] = {0};
		GetGlobalSettingsFilePath(globalSettingsFilepath);
		char localSettingsFilepath[MAX_PATH] = {0};
		GetLocalSettingsFilePath(localSettingsFilepath);
		const std::unordered_map<unsigned, INIVar*>& CRegisteredVars = GetVarRegistrySingleton();
		for (std::unordered_map<unsigned, INIVar*>::const_iterator it = CRegisteredVars.cbegin(); it != CRegisteredVars.cend(); ++it)
		{
			INIVar* const thisVar = it->second;
			LoadINIData(*thisVar, globalSettingsFilepath, localSettingsFilepath);
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
