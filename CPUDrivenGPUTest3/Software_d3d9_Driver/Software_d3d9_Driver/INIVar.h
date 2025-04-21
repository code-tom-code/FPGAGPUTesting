#pragma once

struct INIVar;

namespace INIRegistry
{
	void RegisterVar(INIVar& newVar);
	void InitLoadAllINIData();
};

struct INIVar
{
	INIVar(const char* const sectionName, const char* const varName, const unsigned uDefaultVal) : SectionName(sectionName), VarName(varName), DataType(dt_unsigned)
	{
		Data.uData = uDefaultVal;

		INIRegistry::RegisterVar(*this);
	}

	INIVar(const char* const sectionName, const char* const varName, const int iDefaultVal) : SectionName(sectionName), VarName(varName), DataType(dt_integer)
	{
		Data.iData = iDefaultVal;

		INIRegistry::RegisterVar(*this);
	}

	INIVar(const char* const sectionName, const char* const varName, const float fDefaultVal) : SectionName(sectionName), VarName(varName), DataType(dt_float)
	{
		Data.fData = fDefaultVal;

		INIRegistry::RegisterVar(*this);
	}

	INIVar(const char* const sectionName, const char* const varName, const char* const sDefaultVal) : SectionName(sectionName), VarName(varName), DataType(dt_string)
	{
		Data.sData = sDefaultVal;

		INIRegistry::RegisterVar(*this);
	}

	INIVar(const char* const sectionName, const char* const varName, const bool bDefaultVal) : SectionName(sectionName), VarName(varName), DataType(dt_bool)
	{
		Data.bData = bDefaultVal;

		INIRegistry::RegisterVar(*this);
	}

	~INIVar();

	INIVar() = delete;
	INIVar (const INIVar&) = delete;
	INIVar& operator=(const INIVar&) = delete;

	const unsigned GenerateSectionKeyHash() const;

	const unsigned Unsigned() const
	{
#ifdef _DEBUG
		if (DataType != dt_unsigned)
		{
			__debugbreak(); // Wrong type!
		}
#endif
		return Data.uData;
	}

	const int Integer() const
	{
#ifdef _DEBUG
		if (DataType != dt_integer)
		{
			__debugbreak(); // Wrong type!
		}
#endif
		return Data.iData;
	}

	const float Float() const
	{
#ifdef _DEBUG
		if (DataType != dt_float)
		{
			__debugbreak(); // Wrong type!
		}
#endif
		return Data.fData;
	}

	const char* const String() const
	{
#ifdef _DEBUG
		if (DataType != dt_string)
		{
			__debugbreak(); // Wrong type!
		}
#endif
		return Data.sData;
	}

	const bool Bool() const
	{
#ifdef _DEBUG
		if (DataType != dt_bool)
		{
			__debugbreak(); // Wrong type!
		}
#endif
		return Data.bData;
	}

	union
	{
		unsigned uData;
		int iData;
		float fData;
		const char* sData;
		bool bData;
	} Data = {0};

	const enum _dataType : unsigned char
	{
		dt_unsigned,
		dt_integer,
		dt_float,
		dt_string,
		dt_bool
	} DataType;

	bool heapAllocString = false;

	const char* const SectionName;
	const char* const VarName;
};
