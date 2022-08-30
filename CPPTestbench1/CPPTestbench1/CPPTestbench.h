#pragma once

#undef UNICODE
#undef _UNICODE
#define WIN32_LEAN_AND_MEAN

#pragma warning(push)
#pragma warning(disable:4267) // xsi_loader.h(54): warning C4267: 'return': conversion from 'size_t' to 'int', possible loss of data
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include "xsi_loader.h"
#pragma warning(pop)

#ifdef _DEBUG
	// #define FORCE_READBACK_VALUES_EVERY_CLOCK_TICK 1
#endif

enum std_logic : signed char
{
	logic_U = 0, // 'U'
	logic_X = 1, // 'X'
	logic_0 = 2, // '0'
	logic_1 = 3, // '1'
	logic_Z = 4, // 'Z'
	logic_W = 5, // 'W'
	logic_L = 6, // 'L'
	logic_H = 7, // 'H'
	logic_DC = 8 // '-'
};

enum portDirection : unsigned char
{
	PD_IN = 1, // VHDL reads from this variable. CPU can only write to it.
	PD_OUT = 2, // VHDL writes to this variable. CPU can only read from it.
	PD_INOUT = PD_IN | PD_OUT // VHDL and CPU can both read/write to this variable
};

static const std_logic BoolToStdLogic(const bool bVal)
{
	return bVal ? logic_1 : logic_0;
}

static const bool StdLogicToBool(const std_logic logicVal)
{
	switch (logicVal)
	{
	default:
#ifdef _DEBUG
		__debugbreak(); // Unknown std_logic value!
#endif
	case logic_U:
	case logic_X:
	case logic_0:
	case logic_L:
	case logic_Z:
	case logic_W:
	case logic_DC:
		return false;
	case logic_H:
	case logic_1:
		return true;
	}
}

template <unsigned numBits>
void ReverseArrayInPlace(std_logic (&logicVec)[numBits])
{
	for (unsigned swapIndex = 0; swapIndex < numBits / 2; ++swapIndex)
	{
		const std_logic swapTemp = logicVec[swapIndex];
		const unsigned swapTargetIndex = numBits - (swapIndex + 1);
		logicVec[swapIndex] = logicVec[swapTargetIndex];
		logicVec[swapTargetIndex] = swapTemp;
	}
}

template <unsigned numBytes>
void ConvertLogicArrayToBytes(const std_logic (&logicVec)[numBytes * 8], void* const outputData)
{
	unsigned char* const outputBytes = static_cast<unsigned char* const>(outputData);
	for (unsigned byteIndex = 0; byteIndex < numBytes; ++byteIndex)
	{
		unsigned char thisOutputByte = 0;
		for (unsigned bitIndex = 0; bitIndex < 8; ++bitIndex)
		{
			if (StdLogicToBool(logicVec[byteIndex * 8 + bitIndex]) == true)
				thisOutputByte |= (1 << bitIndex);
		}
		outputBytes[byteIndex] = thisOutputByte;
	}
}

template <unsigned numBytes>
void FillLogicArrayWithBits(std_logic (&outVec)[numBytes * 8], const void* const inputData)
{
	const unsigned char* const inputBytes = static_cast<const unsigned char* const>(inputData);
	for (unsigned byteIndex = 0; byteIndex < numBytes; ++byteIndex)
	{
		const unsigned char thisInputByte = inputBytes[byteIndex];
		for (unsigned bitIndex = 0; bitIndex < 8; ++bitIndex)
		{
			if (thisInputByte & (1 << bitIndex) )
				outVec[byteIndex * 8 + bitIndex] = logic_1;
			else
				outVec[byteIndex * 8 + bitIndex] = logic_0;
		}
	}
}

template <unsigned numBits>
void FillLogicArrayWithBits(std_logic* const outVec, const uint64_t uVal)
{
	for (unsigned bitCount = 0; bitCount < numBits; ++bitCount)
	{
		if (uVal & (1ull << bitCount) )
			outVec[bitCount] = logic_1;
		else
			outVec[bitCount] = logic_0;
	}
}

template <unsigned numBits>
void FillLogicArrayWithMemoryBits(std_logic* const outVec, const void* const pMemory)
{
#ifdef _DEBUG
	if (!pMemory)
	{
		__debugbreak(); // Cannot pass null to this function!
	}
#endif
	const char* const pBytes = (const char* const)pMemory;
	for (unsigned bitCount = 0; bitCount < numBits; ++bitCount)
	{
		const unsigned byteIndex = bitCount / 8;
		if (pBytes[byteIndex] & (1 << (bitCount % 8) ) )
			outVec[bitCount] = logic_1;
		else
			outVec[bitCount] = logic_0;
	}
}

template <unsigned numBits> void FillLogicArrayWithBits(std_logic* const outVec, const int64_t iVal) { return FillLogicArrayWithBits<numBits>(outVec, static_cast<const uint64_t>(iVal) ); }
template <unsigned numBits> void FillLogicArrayWithBits(std_logic* const outVec, const int32_t iVal) { return FillLogicArrayWithBits<numBits>(outVec, static_cast<const uint64_t>(iVal) ); }
template <unsigned numBits> void FillLogicArrayWithBits(std_logic* const outVec, const uint32_t iVal) { return FillLogicArrayWithBits<numBits>(outVec, static_cast<const uint64_t>(iVal) ); }
template <unsigned numBits> void FillLogicArrayWithBits(std_logic* const outVec, const int16_t iVal) { return FillLogicArrayWithBits<numBits>(outVec, static_cast<const uint64_t>(iVal) ); }
template <unsigned numBits> void FillLogicArrayWithBits(std_logic* const outVec, const uint16_t iVal) { return FillLogicArrayWithBits<numBits>(outVec, static_cast<const uint64_t>(iVal) ); }
template <unsigned numBits> void FillLogicArrayWithBits(std_logic* const outVec, const int8_t iVal) { return FillLogicArrayWithBits<numBits>(outVec, static_cast<const uint64_t>(iVal) ); }
template <unsigned numBits> void FillLogicArrayWithBits(std_logic* const outVec, const uint8_t iVal) { return FillLogicArrayWithBits<numBits>(outVec, static_cast<const uint64_t>(iVal) ); }
template <unsigned numBits> void FillLogicArrayWithBits(std_logic* const outVec, const float fVal) { return FillLogicArrayWithBits<numBits>(outVec, static_cast<const uint64_t>(*reinterpret_cast<const unsigned* const>(&fVal) ) ); }

class port
{
public:
	static void UpdateAllInputPortData();

protected:
	port(const portDirection _portDir, Xsi::Loader& _loader, const char* const _portname) : portname(_portname), loader(_loader), portNumber(_loader.get_port_number(_portname) ), portDir(_portDir)
	{
		if (portNumber < 0)
		{
			printf("Error: Port named \"%s\" was not found!\n", _portname);
#ifdef _DEBUG
			__debugbreak(); // Error: Port not found with this name!
#endif
		}

		RegisterNewPort(this);
	}

	virtual void UpdateReadPortData() = 0;

	~port()
	{
	}

	const char* const portname = NULL;
	Xsi::Loader& loader;
	const int portNumber = -1;
	const portDirection portDir;

private:
	static void RegisterNewPort(port* const newPort);
	static std::vector<port*> registeredPorts;
};

class std_logic_port : public port
{
public:
	std_logic_port(const portDirection _portDir, Xsi::Loader& _loader, const char* const _portname) : port(_portDir, _loader, _portname)
	{
	}

	std_logic_port& operator=(const std_logic logicVal)
	{
		if (portDir & PD_IN)
		{
			loader.put_value(portNumber, &logicVal);
			currentValue = logicVal;
			currentValue_bool = StdLogicToBool(logicVal);
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // You cannot write to a read-only port!
#endif
		}
		return *this;
	}

	std_logic_port& operator=(const bool bitVal)
	{
		const std_logic logicVal = BoolToStdLogic(bitVal);
		return *this = logicVal;
	}

	const std_logic GetLogicVal() const
	{
		if (portDir & PD_OUT)
		{
			std_logic ret = logic_U;
			const int status = loader.get_value(portNumber, &ret);
			if (status != xsiNormal)
			{
#ifdef _DEBUG
				printf("Error: Cannot retrieve value of \"%s\" (%i) as the design is in an error state!\n", portname, portNumber);
#endif
				return logic_U;
			}
			currentValue = ret;
			currentValue_bool = StdLogicToBool(ret);
			return ret;
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // Trying to read from an IN port on the CPU side is illegal!
#endif
			return logic_U;
		}
	}

	const bool GetBoolVal() const
	{
		return StdLogicToBool(GetLogicVal() );
	}

protected:
	virtual void UpdateReadPortData() override
	{
		if (portDir & PD_OUT)
		{
			GetLogicVal();
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // Should never be here! Only call this function for OUT or INOUT ports!
#endif
		}
	}

private:
	mutable std_logic currentValue = logic_U;
	mutable bool currentValue_bool = false;
};

template <unsigned bitLength>
class std_logic_vector_port : public port
{
public:
	std_logic_vector_port(const portDirection _portDir, Xsi::Loader& _loader, const char* const _portname) : port(_portDir, _loader, _portname)
	{
		memset(&vectorUnion, 0, sizeof(vectorUnion) );

		const int32_t portWidthBits = _loader.get_int_property_port(portNumber, xsiHDLValueSize);
		if (portWidthBits != bitLength)
		{
#ifdef _DEBUG
			__debugbreak(); // Error! Length mismatch!
#endif
		}

		const int32_t portDirection = _loader.get_int_property_port(portNumber, xsiDirectionTopPort);
		switch (portDirection)
		{
		default:
#ifdef _DEBUG
			__debugbreak(); // Should never be here! Invalid port directionr received!
#endif
		case xsiInputPort:
			if (_portDir != PD_IN)
			{
#ifdef _DEBUG
				__debugbreak(); // Error! Port direction mismatch!
#endif
			}
			break;
		case xsiOutputPort:
			if (_portDir != PD_OUT)
			{
#ifdef _DEBUG
				__debugbreak(); // Error! Port direction mismatch!
#endif
			}
			break;
		case xsiInoutPort:
			if (_portDir != PD_INOUT)
			{
#ifdef _DEBUG
				__debugbreak(); // Error! Port direction mismatch!
#endif
			}
			break;
		}
	}

	template <typename structType>
	void SetStructVal(const structType& structVal)
	{
		static_assert(bitLength == (sizeof(structType) * 8), "Error: Can only use SetStructVal() with structs that match the std_logic_vector bit-length exactly");
		if (portDir & PD_IN)
		{
			std_logic convertedLogicBits[bitLength] = { logic_U };

			FillLogicArrayWithBits<sizeof(structType)>(convertedLogicBits, &structVal);

			ReverseArrayInPlace<bitLength>(convertedLogicBits);

			loader.put_value(portNumber, &convertedLogicBits);
			memcpy(&currentData, &convertedLogicBits, sizeof(std_logic) * bitLength);

			if (sizeof(structType) >= sizeof(vectorUnion.u64) )
			{
				memcpy(&vectorUnion.u64, &structVal, sizeof(vectorUnion.u64) );
			}
			else
			{
				vectorUnion.u64 = 0;
				memcpy(&vectorUnion.u64, &structVal, sizeof(structVal) );
			}
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // You cannot write to a read-only port!
#endif
		}
	}

	void SetToByteMemory(const void* const memory)
	{
		if (portDir & PD_IN)
		{
			std_logic convertedLogicBits[bitLength] = { logic_U };

			FillLogicArrayWithMemoryBits<bitLength>(convertedLogicBits, memory);

			ReverseArrayInPlace<bitLength>(convertedLogicBits);

			loader.put_value(portNumber, &convertedLogicBits);
			memcpy(&currentData, &convertedLogicBits, sizeof(std_logic) * bitLength);

			if (bitLength > sizeof(vectorUnion.u64) * 8)
			{
				memcpy(&vectorUnion.u64, memory, sizeof(vectorUnion.u64) );
			}
			else
			{
				vectorUnion.u64 = 0;
				memcpy(&vectorUnion.u64, memory, (bitLength + 7) / 8);
			}
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // You cannot write to a read-only port!
#endif
		}
	}

	void SetToZero()
	{
		if (portDir & PD_IN)
		{
			std_logic zeroLogicBits[bitLength] = { logic_0 };
			for (unsigned x = 0; x < bitLength; ++x)
			{
				zeroLogicBits[x] = logic_0;
			}

			loader.put_value(portNumber, &zeroLogicBits);
			memcpy(&currentData, &zeroLogicBits, sizeof(std_logic) * bitLength);

			vectorUnion.u64 = 0;
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // You cannot write to a read-only port!
#endif
		}
	}

	template <typename structType>
	void GetStructVal(structType& outStructVal)
	{
		static_assert(bitLength == (sizeof(structType) * 8), "Error: Can only use GetStructVal() with structs that match the std_logic_vector bit-length exactly");

		if (portDir & PD_OUT)
		{
			std_logic logicBits[bitLength] = { logic_U };

			const int status = loader.get_value(portNumber, &logicBits);
			if (status != xsiNormal)
			{
#ifdef _DEBUG
				printf("Error: Cannot retrieve value of \"%s\" (%i) as the design is in an error state!\n", portname, portNumber);
#endif
				memset(&outStructVal, 0, sizeof(outStructVal) );
				return;
			}

			ReverseArrayInPlace<bitLength>(logicBits);

			ConvertLogicArrayToBytes<sizeof(structType)>(logicBits, &outStructVal);
			if (bitLength <= 64)
			{
				vectorUnion.u64 = 0;
				memcpy(&vectorUnion.u64, &outStructVal, sizeof(outStructVal) );
			}
			else
			{
				// We can only cache the first 64 bits of the structure. Sorry if this is inconvenient!
				memcpy(&vectorUnion.u64, &outStructVal, sizeof(vectorUnion.u64) );
			}
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // You cannot read from a write-only port!
#endif
		}
	}

	std_logic_vector_port& operator=(const std_logic (&logicVals)[bitLength])
	{
		if (portDir & PD_IN)
		{
			memcpy(&currentData, &logicVals, sizeof(std_logic) * bitLength);
			ReverseArrayInPlace<bitLength>(currentData);
			loader.put_value(portNumber, &currentData);
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // You cannot write to a read-only port!
#endif
		}
		return *this;
	}

	std_logic_vector_port& operator=(const uint64_t uintVal)
	{
		std_logic logicVals[bitLength] = { logic_U };
		FillLogicArrayWithBits<bitLength>(logicVals, uintVal);
		vectorUnion.u64 = uintVal;
		return *this = logicVals;
	}

	std_logic_vector_port& operator=(const int64_t intVal)
	{
		std_logic logicVals[bitLength] = { logic_U };
		FillLogicArrayWithBits<bitLength>(logicVals, intVal);
		vectorUnion.i64 = intVal;
		return *this = logicVals;
	}

	std_logic_vector_port& operator=(const float floatVal)
	{
		std_logic logicVals[bitLength] = { logic_U };
		FillLogicArrayWithBits<bitLength>(logicVals, floatVal);
		vectorUnion.f32 = floatVal;
		return *this = logicVals;
	}

	std_logic_vector_port& operator=(const uint32_t uintVal)
	{
		std_logic logicVals[bitLength] = { logic_U };
		FillLogicArrayWithBits<bitLength>(logicVals, uintVal);
		vectorUnion.u32 = uintVal;
		return *this = logicVals;
	}

	std_logic_vector_port& operator=(const int32_t intVal)
	{
		std_logic logicVals[bitLength] = { logic_U };
		FillLogicArrayWithBits<bitLength>(logicVals, intVal);
		vectorUnion.i32 = intVal;
		return *this = logicVals;
	}

	std_logic_vector_port& operator=(const uint16_t uintVal)
	{
		std_logic logicVals[bitLength] = { logic_U };
		FillLogicArrayWithBits<bitLength>(logicVals, uintVal);
		vectorUnion.u16 = uintVal;
		return *this = logicVals;
	}

	std_logic_vector_port& operator=(const int16_t intVal)
	{
		std_logic logicVals[bitLength] = { logic_U };
		FillLogicArrayWithBits<bitLength>(logicVals, intVal);
		vectorUnion.i16 = intVal;
		return *this = logicVals;
	}

	std_logic_vector_port& operator=(const uint8_t uintVal)
	{
		std_logic logicVals[bitLength] = { logic_U };
		FillLogicArrayWithBits<bitLength>(logicVals, uintVal);
		vectorUnion.u8 = uintVal;
		return *this = logicVals;
	}

	std_logic_vector_port& operator=(const int8_t intVal)
	{
		std_logic logicVals[bitLength] = { logic_U };
		FillLogicArrayWithBits<bitLength>(logicVals, intVal);
		vectorUnion.i8 = intVal;
		return *this = logicVals;
	}

	void GetLogicVectorVal(std_logic (&outLogicVals)[bitLength]) const
	{
		if (portDir & PD_OUT)
		{
			memset(&outLogicVals, logic_U, bitLength * sizeof(std_logic) );
			const int status = loader.get_value(portNumber, &outLogicVals);
			if (status != xsiNormal)
			{
#ifdef _DEBUG
				printf("Error: Cannot retrieve value of \"%s\" (%i) as the design is in an error state!\n", portname, portNumber);
#endif
				memset(&outLogicVals, logic_U, bitLength * sizeof(std_logic) );
				return;
			}
			ReverseArrayInPlace<bitLength>(outLogicVals);
			memcpy(&currentData, &outLogicVals, sizeof(currentData) );

			vectorUnion.u64 = 0;
			for (unsigned bitCount = 0; bitCount < (bitLength <= 64 ? bitLength : 64); ++bitCount)
			{
				if (StdLogicToBool(currentData[bitCount]) == true)
					vectorUnion.u64 |= (1ull << bitCount);
			}
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // Trying to read from an IN port on the CPU side is illegal!
#endif
		}
	}

	const uint64_t GetUint64Val() const
	{
		std_logic logic_vector_val[bitLength] = { logic_U };
		GetLogicVectorVal(logic_vector_val);

		if (bitLength <= 64)
		{
			uint64_t outVal = 0;
			for (uint64_t bitNum = 0; bitNum < bitLength; ++bitNum)
			{
				const bool bVal = StdLogicToBool(logic_vector_val[bitNum]);
				if (bVal)
				{
					outVal |= (1ull << bitNum);
				}
			}
			return outVal;
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // Not implemented converting more than 64 bits of integer output values yet! Use the struct getter function instead!
#endif
			return 0;
		}
	}

	const float GetFloat32Val() const
	{
		const uint64_t u64 = GetUint64Val();
		return *reinterpret_cast<const float* const>(&u64);
	}

	const int64_t GetInt64Val() const
	{
		const uint64_t u64 = GetUint64Val();
		return static_cast<const int64_t>(u64);
	}

	const uint32_t GetUint32Val() const
	{
		const uint64_t u64 = GetUint64Val();
		return static_cast<const uint32_t>(u64);
	}

	const int32_t GetInt32Val() const
	{
		const uint64_t u64 = GetUint64Val();
		return static_cast<const int32_t>(u64);
	}

	const uint16_t GetUint16Val() const
	{
		const uint64_t u64 = GetUint64Val();
		return static_cast<const uint16_t>(u64);
	}

	const int16_t GetInt16Val() const
	{
		const uint64_t u64 = GetUint64Val();
		return static_cast<const int16_t>(u64);
	}

	const uint8_t GetUint8Val() const
	{
		const uint64_t u64 = GetUint64Val();
		return static_cast<const uint8_t>(u64);
	}

	const int8_t GetInt8Val() const
	{
		const uint64_t u64 = GetUint64Val();
		return static_cast<const int8_t>(u64);
	}

protected:
	virtual void UpdateReadPortData() override
	{
		if (portDir & PD_OUT)
		{
			std_logic dummyRead[bitLength] = { logic_U };
			GetLogicVectorVal(dummyRead);
		}
		else
		{
#ifdef _DEBUG
			__debugbreak(); // Should never be here! Only call this function for OUT or INOUT ports!
#endif
		}
	}

private:
	mutable std_logic currentData[bitLength] = { logic_U };
	mutable union _vectorUnion
	{
		uint8_t u8;
		int8_t i8;
		uint16_t u16;
		int16_t i16;
		uint32_t u32;
		int32_t i32;
		uint64_t u64;
		int64_t i64;
		float f32;
	} vectorUnion;
};

class scoped_timestep
{
public:
	scoped_timestep(Xsi::Loader& _loader, std_logic_port& _clockPort, const uint64_t _timestep) : loader(_loader), clockPort(_clockPort), timestep(_timestep)
	{
		_clockPort = false;
		_loader.run(_timestep);

		const int status = _loader.get_status();
		if (status != xsiNormal)
		{
			printf("Error encountered during simulation!\n");
#ifdef _DEBUG
			__debugbreak();
#endif
		}
	}

	~scoped_timestep()
	{
		clockPort = true;
		loader.run(timestep);

		const int status = loader.get_status();
		if (status != xsiNormal)
		{
			printf("Error encountered during simulation!\n");
#ifdef _DEBUG
			__debugbreak();
#endif
		}

#ifdef FORCE_READBACK_VALUES_EVERY_CLOCK_TICK
		port::UpdateAllInputPortData();
#endif
	}

private:
	Xsi::Loader& loader;
	std_logic_port& clockPort;
	const uint64_t timestep;
};

