
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;

entity FloatALU is
    Port (clk : in STD_LOGIC;

		-- Common ports shared across multiple stages:
		IN_A : in STD_LOGIC_VECTOR(31 downto 0);
		IN_B : in STD_LOGIC_VECTOR(31 downto 0);
		IN_MODE : in STD_LOGIC_VECTOR(2 downto 0); -- Generic "mode" that can be interpreted by different stages differently
		OUT_RESULT : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		-- SHFT pipe operates in 1 clock cycle. IN_MODE corresponds to the eShftMode type.
		ISHFT_GO : in STD_LOGIC;

		-- MUL pipe operates in 5 clock cycles
		IMUL_GO : in STD_LOGIC;

		-- ADD pipe operates in 4 clock cycles
		IADD_GO : in STD_LOGIC;

		-- CMP pipe operates in 1 clock cycle. IN_MODE corresponds to the eCmpType type.
		ICMP_GO : in STD_LOGIC;

		-- CNV pipe operates in 3 clock cycles. IN_MODE corresponds to the eConvertMode type.
		ICNV_GO : in STD_LOGIC;

		-- SPEC pipe operates in 14 clock cycles for RCP.
		ISPEC_GO : in STD_LOGIC;

		-- BIT pipe operates in 1 clock cycle. IN_MODE corresponds to the eBitType type.
		IBIT_GO : in STD_LOGIC
		);
end FloatALU;

architecture Behavioral of FloatALU is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

-- Globally useful float constants:
constant zeroF : unsigned(31 downto 0) := X"00000000"; -- Constant for 0.0f
constant oneF : unsigned(31 downto 0) := X"3F800000"; -- Constant for 1.0f
constant halfF : unsigned(31 downto 0) := X"3F000000"; -- Constant for 0.5f
constant negOneF : unsigned(31 downto 0) := X"BF800000"; -- Constant for -1.0f

constant maxRepresentableHalfF : unsigned(31 downto 0) := X"477FE000"; -- Constant for 65504.0f which is the largest float that can be represented as a half
constant minReprensetableHalfF : unsigned(31 downto 0) := X"33800000"; -- Constant for 5.9604644775390625e-8f which is the smallest float that can be represented as a half (besides zero)

-- VHDL doesn't support the MAXIMUM() or MINIMUM() functions as built-ins until VHDL2008, so we have to
-- define our own, sadly.
pure function maxVal(a : integer; b : integer) return integer is
begin
	if (a > b) then
		return a;
	else
		return b;
	end if;
end function;

-- Maximum number of cycles that a single operation can take
constant maxCycleCount : integer := maxVal(BIT_CYCLES, maxVal(SHFT_CYCLES, maxVal(MUL_CYCLES, maxVal(ADD_CYCLES, maxVal(CMP_CYCLES, maxVal(CNV_CYCLES, SPEC_CYCLES) ) ) ) ) );
constant numMUXSources : integer := 7; -- Number of different pipes that our MUX can source from

-- attribute KEEP : string;

type RcpLookupArrayType is array(0 to 15) of unsigned(15 downto 0);

constant RcpLookupTable_Offsets : RcpLookupArrayType := 
(
	X"FFC4", X"F0BE", X"E363", X"D76F", X"CCAD", X"C2F0", X"BA16", X"B201", X"AA97", X"A3C6", X"9D7A", X"97A6", X"923C", X"8D32", X"887E", X"8417"
);

constant RcpLookupTable_Slopes : RcpLookupArrayType := 
(
	X"F0F1", X"D62C", X"BFA1", X"AC77", X"9C0A", X"8DDB", X"8185", X"76BA", X"6D3B", X"64D4", X"5D5C", X"56B1", X"50B6", X"4B55", X"4679", X"4211"
);

type MUXArrayType is array(0 to maxCycleCount) of unsigned(numMUXSources-1 downto 0);

type eCnvEarlyOutType is
(
	CnvNoEarlyOut, -- 0
	CnvNaNEarlyOut, -- 1
	CnvBelowMinEarlyOut, -- 2
	CnvAboveMaxEarlyOut -- 3
);

type rcpPipelineStage is record
	pipeStageIsValid : std_logic;
	useEarlyOutBypass : std_logic;
	rcpSign : std_logic;
	rcpExponent : unsigned(7 downto 0);
	calculatedMantissa : unsigned(22 downto 0);
end record rcpPipelineStage;

type rcpPipelineArray is array(SPEC_CYCLES-1 downto 0) of rcpPipelineStage;

-- Assumes value is nonzero
pure function bitScan(value : signed(25 downto 0) ) return natural is
begin
	assert value > 0;
	-- Not sure why, but manually unrolling this loop seems to improve resource usage (by half)
--	for bitIndex in 0 to 23 loop
--		if (value(23 - bitIndex) = '1') then
--			return 23 - bitIndex;
--		end if;
--	end loop;
--	return 0;

	-- Manually unrolled version:
	if (value(23) = '1') then
		return 0;
	elsif (value(22) = '1') then
		return 1;
	elsif (value(21) = '1') then
		return 2;
	elsif (value(20) = '1') then
		return 3;
	elsif (value(19) = '1') then
		return 4;
	elsif (value(18) = '1') then
		return 5;
	elsif (value(17) = '1') then
		return 6;
	elsif (value(16) = '1') then
		return 7;
	elsif (value(15) = '1') then
		return 8;
	elsif (value(14) = '1') then
		return 9;
	elsif (value(13) = '1') then
		return 10;
	elsif (value(12) = '1') then
		return 11;
	elsif (value(11) = '1') then
		return 12;
	elsif (value(10) = '1') then
		return 13;
	elsif (value(9) = '1') then
		return 14;
	elsif (value(8) = '1') then
		return 15;
	elsif (value(7) = '1') then
		return 16;
	elsif (value(6) = '1') then
		return 17;
	elsif (value(5) = '1') then
		return 18;
	elsif (value(4) = '1') then
		return 19;
	elsif (value(3) = '1') then
		return 20;
	elsif (value(2) = '1') then
		return 21;
	elsif (value(1) = '1') then
		return 22;
	else
		return 23;
	end if;
end function;

-- Returns '1' if the value is negative, or '0' if the value is positive.
pure function GetFloatIsNegative(value : unsigned(31 downto 0) ) return std_logic is
begin
	return value(31);
end function;

-- Returns the raw 8-bit exponent of the float (without accounting for the -127 bias).
pure function GetRawExponent(value : unsigned(31 downto 0) ) return unsigned is
begin
	return value(30 downto 23);
end function;

-- Returns the signed 8-bit exponent [-127 to +127] after the bias is applied.
pure function GetSignedExponent(value : unsigned(31 downto 0) ) return signed is
begin
	return signed(value(30 downto 23) ) - to_signed(127, 8);
end function;

-- Returns the biased exponent bits from a signed exponent value
pure function MakeExponentFromSigned(signedExp : signed(7 downto 0) ) return std_logic_vector is
	variable temp : signed(7 downto 0);
begin
	temp := signedExp + to_signed(127, 8); -- Convert from [-127, 127] to [0, 254]
	return std_logic_vector(temp(7 downto 0) );
end function;

-- Returns '1' if the value is a real number, or '0' if the value is INF or NAN. For the purposes of this function, denormal values are considered real values.
pure function GetFloatIsReal(value : unsigned(31 downto 0) ) return std_logic is
begin
	if (GetRawExponent(value) = X"FF") then
		return '0';
	else
		return '1';
	end if;
end function;

-- Returns the 23-bit mantissa value for the float.
pure function GetMantissa(value : unsigned(31 downto 0) ) return unsigned is
begin
	return value(22 downto 0);
end function;

-- Returns '1' if the float is +INF or -INF, or returns '0' otherwise.
pure function GetFloatIsINF(value : unsigned(31 downto 0) ) return std_logic is
begin
	if (GetRawExponent(value) = X"FF" and GetMantissa(value) = "00000000000000000000000") then
		return '1';
	else
		return '0';
	end if;
end function;

-- Returns '1' if the float is a NaN value, or returns '0' otherwise.
pure function GetFloatIsNAN(value : unsigned(31 downto 0) ) return std_logic is
begin
	if (GetRawExponent(value) = X"FF" and GetMantissa(value) /= "00000000000000000000000") then
		return '1';
	else
		return '0';
	end if;
end function;

-- Returns either the original float value, or the flushed-to-zero value if the original was a denormal number.
pure function FlushDenormsToZero(value : unsigned(31 downto 0) ) return unsigned is
begin
	if (GetRawExponent(value) = X"00") then
		return value(31) & "0000000000000000000000000000000"; -- D3D spec says that denorms get flushed to sign-preserved zero, so here we are preserving the sign bit
	else
		return value;
	end if;
end function;

-- Function implements min(float a, float b) to the HLSL/D3D11 spec:
pure function CmpMinFunc(a : unsigned(31 downto 0); b : unsigned(31 downto 0); aIsNan : std_logic; bIsNan : std_logic; aIsNegative : std_logic; bIsNegative : std_logic; aLessThanB : std_logic) return unsigned is
begin
	-- If either argument is NaN, then return the other (non-NaN) argument
	if (aIsNaN = '1' and bIsNaN = '0') then
		return b;
	elsif (aIsNaN = '0' and bIsNaN = '1') then
		return a;
	elsif (aIsNaN = '1' and bIsNaN = '1') then
		return a; -- When both are NaN, we don't try to perform a comparison, we just return any NaN value
	end if;

	if (aIsNegative = '1' and bIsNegative = '0') then
		return a;
	elsif (aIsNegative = '0' and bIsNegative = '1') then
		return b;
	else -- Same sign comparison
		if (aIsNegative = '0') then -- min(positive, positive)
			if (aLessThanB = '1') then
				return a;
			else
				return b;
			end if;
		else -- min(negative, negative)
			if (aLessThanB = '1') then
				return b;
			else
				return a;
			end if;
		end if;
	end if;
end function;

-- Function implements max(float a, float b) to the HLSL/D3D11 spec:
pure function CmpMaxFunc(a : unsigned(31 downto 0); b : unsigned(31 downto 0); aIsNaN : std_logic; bIsNaN : std_logic; aIsNegative : std_logic; bIsNegative : std_logic; aLessThanB : std_logic) return unsigned is
begin
	-- If either argument is NaN, then return the other (non-NaN) argument
	if (aIsNaN = '1' and bIsNaN = '0') then
		return b;
	elsif (aIsNaN = '0' and bIsNaN = '1') then
		return a;
	elsif (aIsNaN = '1' and bIsNaN = '1') then
		return a; -- When both are NaN, we don't try to perform a comparison, we just return any NaN value
	end if;

	if (aIsNegative = '1' and bIsNegative = '0') then
		return b;
	elsif (aIsNegative = '0' and bIsNegative = '1') then
		return a;
	else -- Same sign comparison
		if (aIsNegative = '0') then -- max(positive, positive)
			if (aLessThanB = '0') then
				return a;
			else
				return b;
			end if;
		else -- max(negative, negative)
			if (aLessThanB = '0') then
				return b;
			else
				return a;
			end if;
		end if;

	end if;
end function;

-- This core function is shared by the implementations for both SGE(a, b) and SLT(a, b). It returns (a < b) ? 1 : 0.
pure function CoreSLTNonNAN(aEqualsB : std_logic; aLessThanB : std_logic; aIsNegative : std_logic; bIsNegative : std_logic; aIsDenorm : std_logic; bIsDenorm : std_logic) return std_logic is
begin
	if ( (aIsDenorm = '1') and (bIsDenorm = '1') ) then -- Special case handling of +/- 0.0f compared to +/- 0.0f
		return '0';
	end if;

	-- Early out and see if we can just compare the sign bits without having to look at the rest of the float:
	if (aIsNegative = '1' and bIsNegative = '0') then
		return '1';
	elsif (aIsNegative = '0' and bIsNegative = '1') then
		return '0';
	else -- Same sign comparison
		if (aEqualsB = '1') then -- Special case handling of A == B (since this is a less-than test and not a less-equals test, we always return false in this case)
			return '0';
		end if;

		if (aIsNegative = '0') then -- min(positive, positive)
			if (aLessThanB = '1') then
				return '1';
			else
				return '0';
			end if;
		else -- min(negative, negative)
			if (aLessThanB = '0') then
				return '1';
			else
				return '0';
			end if;
		end if;
	end if;
end function;

-- Returns the function Slt(a, b) is (a < b) ? 1.0f : 0.0f
pure function CmpSltFunc(aEqualsB : std_logic; aLessThanB : std_logic; aIsNaN : std_logic; bIsNaN : std_logic; aDenormFlushed : unsigned(31 downto 0); bDenormFlushed : unsigned(31 downto 0); aIsNegative : std_logic; bIsNegative : std_logic; aIsDenorm : std_logic; bIsDenorm : std_logic) return unsigned is
begin
	if (aIsNaN = '1' or bIsNaN = '1') then
		return zeroF; -- The comparisons EQ, GT, GE, LT, and LE, when either or both operands is NaN returns FALSE.
	end if;

	if (CoreSLTNonNAN(aEqualsB, aLessThanB, aIsNegative, bIsNegative, aIsDenorm, bIsDenorm) = '0') then
		return zeroF;
	else
		return oneF;
	end if;
end function;

-- Returns the function Sge(a, b) is (a >= b) ? 1.0f : 0.0f
pure function CmpSgeFunc(aEqualsB : std_logic; aLessThanB : std_logic; aIsNaN : std_logic; bIsNaN : std_logic; aDenormFlushed : unsigned(31 downto 0); bDenormFlushed : unsigned(31 downto 0); aIsNegative : std_logic; bIsNegative : std_logic; aIsDenorm : std_logic; bIsDenorm : std_logic) return unsigned is
begin
	if (aIsNaN = '1' or bIsNaN = '1') then
		return zeroF; -- The comparisons EQ, GT, GE, LT, and LE, when either or both operands is NaN returns FALSE.
	end if;

	if (CoreSLTNonNAN(aEqualsB, aLessThanB, aIsNegative, bIsNegative, aIsDenorm, bIsDenorm) = '0') then -- This function just returns the opposite of SLT(a, b)
		return oneF;
	else
		return zeroF;
	end if;
end function;

-- Returns the function Sgn(x) is (x < 0.0f) ? -1.0f : ( (x == 0.0f) ? 0.0f : 1.0f)
pure function CmpSgnFunc(value : unsigned(31 downto 0); valIsNaN : std_logic; valIsDenorm : std_logic; valIsNeg : std_logic) return unsigned is
begin
	if (valIsNaN = '1') then
		return oneF; -- The comparisons EQ, GT, GE, LT, and LE, when either or both operands is NaN returns FALSE.
	end if;

	if (valIsDenorm = '1') then
		return zeroF;
	else
		if (valIsNeg = '0') then
			return oneF;
		else
			return negOneF;
		end if;
	end if;
end function;

-- Returns the function Cmp(a, b, c) is (a >= 0.0f) ? b : c
pure function CmpCmpFunc(a : unsigned(31 downto 0); b : unsigned(31 downto 0); c : unsigned(31 downto 0) ) return unsigned is
	variable aIsNaN : std_logic;
	variable denormFlushedA : unsigned(31 downto 0);
begin
	aIsNaN := GetFloatIsNAN(a);
	if (aIsNaN = '1') then
		return c; -- The comparisons EQ, GT, GE, LT, and LE, when either or both operands is NaN returns FALSE.
	end if;

	denormFlushedA := FlushDenormsToZero(a);
	if (GetRawExponent(denormFlushedA) = X"00") then
		return b;
	end if;

	if (GetFloatIsNegative(a) = '0') then
		return b;
	else
		return c;
	end if;
end function;

-- Returns the function Cnd(a, b, c) is (a > 0.5f) ? b : c
pure function CmpCndFunc(a : unsigned(31 downto 0); b : unsigned(31 downto 0); c : unsigned(31 downto 0) ) return unsigned is
	variable aIsNaN : std_logic;
	variable denormFlushedA : unsigned(31 downto 0);
begin
	aIsNaN := GetFloatIsNAN(a);
	if (aIsNaN = '1') then
		return c; -- The comparisons EQ, GT, GE, LT, and LE, when either or both operands is NaN returns FALSE.
	end if;

	if (GetFloatIsNegative(a) = '1') then
		return c;
	end if;

	denormFlushedA := FlushDenormsToZero(a);
	if (denormFlushedA > halfF) then
		return b;
	else
		return c;
	end if;
end function;

-- Converts a float32 input to signed int24 using truncation (round towards zero) mode
pure function CnvFloatToInt24_Trunc_GetEarlyOutType(a : unsigned(31 downto 0); aIsNaN : std_logic; aIsNegative : std_logic) return eCnvEarlyOutType is
	constant minNegativeVal : unsigned(30 downto 0) := "1001011100000000000000000000000"; -- This is -16777216.0f
	constant maxPositiveVal : unsigned(30 downto 0) := "1001011011111111111111111111111"; -- This is 16777215.0f
begin
	if (aIsNaN = '1') then
		return CnvNaNEarlyOut;
	elsif (aIsNegative = '1' and a(30 downto 0) >= minNegativeVal) then
		return CnvBelowMinEarlyOut; -- This is -16777216
	elsif (a(30 downto 0) >= maxPositiveVal) then
		return CnvAboveMaxEarlyOut; -- This is 16777215
	else
		return CnvNoEarlyOut;
	end if;
end function;

-- Converts a float32 input to signed int24 using truncation (round towards zero) mode
pure function CnvFloatToInt24_Trunc_Cycle0(aSignedExp : signed(7 downto 0) ) return signed is
begin
	return 23 - aSignedExp;
end function;

-- Converts a float32 input to signed int24 using truncation (round towards zero) mode
pure function CnvFloatToInt24_Trunc_Cycle2(tempBuffer : signed(31 downto 0); isNegative : std_logic) return unsigned is
begin
	if (isNegative = '1') then
		return unsigned(-tempBuffer); -- Two's compliment the buffer bits if float is negative
	else
		return unsigned(tempBuffer);
	end if;
end function;

-- Converts a float32 input to signed int23 using round to nearest even mode
pure function CnvFloatToInt23_RoundNE_GetEarlyOutType(a : unsigned(31 downto 0); aIsNaN : std_logic; aIsNegative : std_logic) return eCnvEarlyOutType is
	constant minNegativeVal : unsigned(30 downto 0) := "1001011000000000000000000000000"; -- This is -8388608.0f
	constant maxPositiveVal : unsigned(30 downto 0) := "1001010111111111111111111111110"; -- This is 8388607.0f
begin
	if (aIsNaN = '1') then
		return CnvNaNEarlyOut;
	elsif (aIsNegative = '1' and a(30 downto 0) >= minNegativeVal) then
		return CnvBelowMinEarlyOut; -- This is -8388608
	elsif (a(30 downto 0) >= maxPositiveVal) then
		return CnvAboveMaxEarlyOut; -- This is 8388607
	else
		return CnvNoEarlyOut;
	end if;
end function;

-- Converts a float32 input to signed int23 using round to nearest even mode
pure function CnvFloatToInt23_RoundNE_Cycle0(aSignedExp : signed(7 downto 0) ) return signed is
begin
	return 22 - aSignedExp;
end function;

-- Converts a float32 input to signed int23 using round to nearest even mode
pure function CnvFloatToInt23_RoundNE_Cycle2(tempBuffer : signed(31 downto 0); isNegative : std_logic) return unsigned is
	variable newTempBuffer : signed(31 downto 0);
begin
	newTempBuffer := tempBuffer + 1;
	newTempBuffer := newTempBuffer srl 1;
	if (isNegative = '1') then
		newTempBuffer := -newTempBuffer; -- Two's compliment the buffer bits if float is negative
	end if;
	return unsigned(newTempBuffer);
end function;

-- Converts a float32 input to signed int16 using round to nearest even mode
pure function CnvFloatToInt16_RoundNE_GetEarlyOutType(a : unsigned(31 downto 0); aIsNaN : std_logic; aIsNegative : std_logic ) return eCnvEarlyOutType is
	constant minNegativeVal : unsigned(30 downto 0) := "1000111000000000000000000000000"; -- This is -32768.0f
	constant maxPositiveVal : unsigned(30 downto 0) := "1000110111111111111111000000000"; -- This is 32767.0f
begin
	if (aIsNaN = '1') then
		return CnvNaNEarlyOut;
	elsif (aIsNegative = '1' and a(30 downto 0) >= minNegativeVal) then
		return CnvBelowMinEarlyOut; -- This is -32768
	elsif (a(30 downto 0) >= maxPositiveVal) then
		return CnvAboveMaxEarlyOut; -- This is 32767
	else
		return CnvNoEarlyOut;
	end if;
end function;

-- Converts a float32 input to signed int16 using round to nearest even mode
pure function CnvFloatToInt16_RoundNE_Cycle0(aSignedExp : signed(7 downto 0) ) return signed is
begin
	return 22 - aSignedExp;
end function;

-- Converts a float32 input to signed int16 using round to nearest even mode
pure function CnvFloatToInt16_RoundNE_Cycle2(tempBuffer : signed(31 downto 0); isNegative : std_logic) return unsigned is
	variable newTempBuffer : signed(31 downto 0);
begin
	newTempBuffer := tempBuffer + 1;
	newTempBuffer := newTempBuffer srl 1;
	if (isNegative = '1') then
		newTempBuffer := -newTempBuffer; -- Two's compliment the buffer bits if float is negative
	end if;
	return unsigned(newTempBuffer(15 downto 0) );
end function;

-- Converts a float32 input to UNORM16
pure function CnvFloatToUNORM16_GetEarlyOutType(a : unsigned(31 downto 0); aIsNaN : std_logic; aIsNegative : std_logic ) return eCnvEarlyOutType is
begin
	if (aIsNaN = '1') then
		return CnvNaNEarlyOut;
	elsif (aIsNegative = '1') then
		return CnvBelowMinEarlyOut;
	elsif (a(30 downto 0) >= oneF(30 downto 0) ) then
		return CnvAboveMaxEarlyOut;
	else
		return CnvNoEarlyOut;
	end if;
end function;

-- Converts a float32 input to UNORM16 (first cycle)
pure function CnvFloatToUNORM16_Cycle0(aSignedExp : signed(7 downto 0) ) return signed is
begin
	return 7 - aSignedExp;
end function;

-- Converts a float32 input to UNORM16 (second cycle)
pure function CnvFloatToUNORM16_Cycle2(tempBuffer : unsigned(31 downto 0) ) return unsigned is
begin
	return tempBuffer(15 downto 0);
end function;

-- Converts a float32 input to UNORM8
pure function CnvFloatToUNORM8_GetEarlyOutType(a : unsigned(31 downto 0); aIsNaN : std_logic; aIsNegative : std_logic ) return eCnvEarlyOutType is
begin
	if (aIsNaN = '1') then
		return CnvNaNEarlyOut;
	elsif (aIsNegative = '1') then
		return CnvBelowMinEarlyOut;
	elsif (a(30 downto 0) >= oneF(30 downto 0) ) then
		return CnvAboveMaxEarlyOut;
	else
		return CnvNoEarlyOut;
	end if;
end function;

-- Converts a float32 input to UNORM8
pure function CnvFloatToUNORM8_Cycle0(aSignedExp : signed(7 downto 0) ) return signed is
begin
	return 15 - aSignedExp;
end function;

-- Converts a float32 input to UNORM8
pure function CnvFloatToUNORM8_Cycle2(tempBuffer : unsigned(31 downto 0) ) return unsigned is
begin
	return tempBuffer(7 downto 0);
end function;

pure function CnvFloatToHalf_GetEarlyOutType(a : unsigned(31 downto 0); aIsNan : std_logic) return eCnvEarlyOutType is
begin
	if (aIsNan = '1') then
		return CnvNaNEarlyOut;
	elsif (a(30 downto 0) > maxRepresentableHalfF(30 downto 0) ) then
		return CnvAboveMaxEarlyOut;
	elsif (a(30 downto 0) < minReprensetableHalfF(30 downto 0) ) then
		return CnvBelowMinEarlyOut;
	else
		return CnvNoEarlyOut;
	end if;
end function;

-- Converts a float32 input to a half (float16) output
pure function CnvFloatToHalf_Cycle2(inputNormalFloat : unsigned(31 downto 0) ) return unsigned is
	variable tempExponent : signed(7 downto 0);
begin
	-- TODO: Proper handling of denorm half values
	tempExponent := GetSignedExponent(inputNormalFloat) + to_signed(15, 8);
	return unsigned(tempExponent(4 downto 0) ) & inputNormalFloat(22 downto 13);
end function;

pure function CnvHalfToFloat_GetEarlyOutType(a : unsigned(14 downto 0) ) return eCnvEarlyOutType is
begin
	if (a(14 downto 10) = "11111" and a(9 downto 0) /= "0000000000") then
		return CnvNaNEarlyOut;
	elsif (a(14 downto 0) >= "111110000000000") then
		return CnvAboveMaxEarlyOut;
	elsif (a(14 downto 0) = "000000000000000") then
		return CnvBelowMinEarlyOut;
	else
		return CnvNoEarlyOut;
	end if;
end function;

-- Converts a half (float16) input to a float32 output
pure function CnvHalfToFloat_Cycle2(a : unsigned(14 downto 0) ) return unsigned is
	variable tempExponent : signed(7 downto 0);
begin
	-- TODO: Proper handling of denorm half values
	tempExponent := signed("000" & std_logic_vector(a(14 downto 10) ) ) - to_signed(15, 8);
	tempExponent := tempExponent + to_signed(127, 8);
	return unsigned(tempExponent) & a(9 downto 0) & "0000000000000";
end function;

-- Finds the first set bit (starting at the MSB) of the uint32
pure function CnvU32ToFloat_GetFirstHighBitSet(a : unsigned(31 downto 0) ) return unsigned is
begin
	for i in 31 downto 1 loop
		if (a(i) = '1') then
			return to_unsigned(i, 5);
		end if;
	end loop;
	return to_unsigned(0, 5);
end function;

pure function CnvU32ToFloat_GetEarlyOutType(a : unsigned(31 downto 0) ) return eCnvEarlyOutType is
begin
	if (a = X"00000000") then
		return CnvBelowMinEarlyOut;
	else
		return CnvNoEarlyOut;
	end if;
end function;

pure function CnvU32ToFloat_Cycle2(exponent : unsigned(4 downto 0); shiftedMantissa : unsigned(31 downto 0) ) return unsigned is
begin
	return (to_unsigned(127, 8) + exponent) & shiftedMantissa(22 downto 0);
end function;

pure function IsShiftUp(shftMode : eShftMode) return std_logic is
begin
	case shftMode is
		when ShftX2 | ShftX4 | ShftX8 | ShftX16 =>
			return '1';
		when others =>
			return '0';
	end case;
end function;

pure function GetShiftAmount(shftMode : eShftMode) return unsigned is
begin
	case shftMode is
		when ShftX2 | ShftD2 =>
			return to_unsigned(1, 8);
		when ShftX4 | ShftD4 =>
			return to_unsigned(2, 8);
		when ShftX8 | ShftD8 =>
			return to_unsigned(3, 8);
		when ShftX16 | ShftD16 =>
			return to_unsigned(4, 8);
		when others =>
			return to_unsigned(0, 8);
	end case;
end function;

pure function CastShiftModeBitsToEnum(shftMode : unsigned(2 downto 0) ) return eShftMode is
begin
	return eShftMode'val(to_integer(shftMode) );
end function;

pure function DoesShiftToINFOrDEN(a : unsigned(31 downto 0); shftMode : eShftMode) return std_logic is
begin
	case shftMode is
		when ShftX2 =>
			if (GetRawExponent(a) > 253) then
				return '1';
			else
				return '0';
			end if;
		when ShftX4 =>
			if (GetRawExponent(a) > 252) then
				return '1';
			else
				return '0';
			end if;
		when ShftX8 =>
			if (GetRawExponent(a) > 251) then
				return '1';
			else
				return '0';
			end if;
		when ShftX16 =>
			if (GetRawExponent(a) > 250) then
				return '1';
			else
				return '0';
			end if;
		when ShftD2 =>
			if (GetRawExponent(a) < 2) then
				return '1';
			else
				return '0';
			end if;
		when ShftD4 =>
			if (GetRawExponent(a) < 3) then
				return '1';
			else
				return '0';
			end if;
		when ShftD8 =>
			if (GetRawExponent(a) < 4) then
				return '1';
			else
				return '0';
			end if;
		when ShftD16 =>
			if (GetRawExponent(a) < 5) then
				return '1';
			else
				return '0';
			end if;
		when others =>
			return '0';
	end case;
end function;

pure function PerformCoreShift(value : unsigned(31 downto 0); shiftMode : unsigned(2 downto 0) ) return unsigned is
begin
	if (IsShiftUp(CastShiftModeBitsToEnum(shiftMode) ) = '1') then
		return value(31) & (GetRawExponent(value) + GetShiftAmount(CastShiftModeBitsToEnum(shiftMode) ) ) & GetMantissa(value);
	else
		return value(31) & (GetRawExponent(value) - GetShiftAmount(CastShiftModeBitsToEnum(shiftMode) ) ) & GetMantissa(value);
	end if;
end function;

-- Signals common to all pipes:
signal comAIsNeg : std_logic := '0';
signal comBIsNeg : std_logic := '0';
signal comAIsINF : std_logic := '0';
signal comBIsINF : std_logic := '0';
signal comAIsNaN : std_logic := '0';
signal comBIsNaN : std_logic := '0';
signal comAIsReal : std_logic := '0';
signal comBIsReal : std_logic := '0';
signal comAIsDenormal : std_logic := '0';
signal comBIsDenormal : std_logic := '0';
signal comDenormalFlushedA : unsigned(31 downto 0) := (others => '0');
signal comDenormalFlushedB : unsigned(31 downto 0) := (others => '0');
signal comRawExponentA : unsigned(7 downto 0) := (others => '0');
signal comRawExponentB : unsigned(7 downto 0) := (others => '0');
signal comASign : std_logic := '0';
signal comBSign : std_logic := '0';
signal comSignedExponentA : signed(7 downto 0) := (others => '0');
signal comSignedExponentB : signed(7 downto 0) := (others => '0');
signal comRawMantissaA : unsigned(22 downto 0) := (others => '0');
signal comRawMantissaB : unsigned(22 downto 0) := (others => '0');
signal comALessThanB : std_logic := '0';
signal comAEqualsB : std_logic := '0';

-- Addition (ADD) pipe signals:
signal addPipelineValidStage0 : std_logic := '0';
signal addPipelineValidStage1 : std_logic := '0';
signal addPipelineValidStage2 : std_logic := '0';

signal addEarlyOutBypassEnable0 : std_logic := '0';
signal addEarlyOutBypassEnable1 : std_logic := '0';
signal addEarlyOutBypassEnable2 : std_logic := '0';

signal addEarlyOutBypass0 : unsigned(31 downto 0) := (others => '0');
signal addEarlyOutBypass1 : unsigned(31 downto 0) := (others => '0');

signal addDenormFlushedValA : unsigned(31 downto 0) := (others => '0');
signal addDenormFlushedValB : unsigned(31 downto 0) := (others => '0');
signal addALessThanB : std_logic := '0';
signal addExponentDeltaAMinusB : signed(7 downto 0) := (others => '0');
signal addExponentDeltaBMinusA : signed(7 downto 0) := (others => '0');
signal addExponentDeltaAMinusBShiftTooFar : std_logic := '0';
signal addExponentDeltaBMinusAShiftTooFar : std_logic := '0';
signal addSameNumberDifferentSigns0 : std_logic := '0';
signal addSameNumberDifferentSigns1 : std_logic := '0';
signal addRenormalizeShiftAmount : natural range 0 to 23 := 0;
signal addFinalExp : signed(7 downto 0) := (others => '0');
signal addPostAddMantissa : signed(25 downto 0) := (others => '0');
signal addFinalSignIsNeg : std_logic := '0';


-- "min" and "max" here indicate magnitude away from zero, not signedness. "min" is closer to zero, and "max" is further away from zero.
signal addMaxVal1 : unsigned(31 downto 0) := (others => '0');
signal addPostAddMantissa1 : signed(25 downto 0) := (others => '0');

signal OADD_Temp : std_logic_vector(31 downto 0) := (others => '0');

-- Multiplication (MUL) pipe signals:
signal mulPipelineValidStage0 : std_logic := '0';
signal mulPipelineValidStage1 : std_logic := '0';
signal mulPipelineValidStage2 : std_logic := '0';
signal mulPipelineValidStage3 : std_logic := '0';

signal mulEarlyOutBypassEnable0 : std_logic := '0';
signal mulEarlyOutBypassEnable1 : std_logic := '0';
signal mulEarlyOutBypassEnable2 : std_logic := '0';
signal mulEarlyOutBypassEnable3 : std_logic := '0';

signal mulAssembledMantissaA : unsigned(23 downto 0) := (others => '0');
signal mulAssembledMantissaB : unsigned(23 downto 0) := (others => '0');

signal mulEarlyOutBypass0 : unsigned(31 downto 0) := (others => '0');
signal mulEarlyOutBypass1 : unsigned(31 downto 0) := (others => '0');
signal mulEarlyOutBypass2 : unsigned(31 downto 0) := (others => '0');
signal mulEarlyOutBypass3 : unsigned(31 downto 0) := (others => '0');

signal mulResultMantissa1 : unsigned(47 downto 0) := (others => '0');
signal mulResultMantissa2 : unsigned(47 downto 0) := (others => '0');
signal mulResultMantissa3 : unsigned(47 downto 0) := (others => '0');

signal mulResultExp0 : signed(8 downto 0) := (others => '0');
signal mulResultExp1 : signed(8 downto 0) := (others => '0');
signal mulResultExp2 : signed(8 downto 0) := (others => '0');
signal mulResultExp3 : signed(8 downto 0) := (others => '0');

signal mulResultSign0 : std_logic := '0';
signal mulResultSign1 : std_logic := '0';
signal mulResultSign2 : std_logic := '0';
signal mulResultSign3 : std_logic := '0';

-- Reciprocal (RCP) pipe signals:
signal rcpPipeline : rcpPipelineArray;
signal rcpLookupSlope : unsigned(15 downto 0) := (others => '0');
signal rcpLookupOffset0 : unsigned(15 downto 0) := (others => '0');
signal rcpLookupOffset1 : unsigned(15 downto 0) := (others => '0');
signal slopeMultiply : unsigned(31 downto 0) := (others => '0');
signal rInitialGuess0 : unsigned(15 downto 0) := (others => '0');
signal rInitialGuess1 : unsigned(15 downto 0) := (others => '0');
signal rInitialGuess2 : unsigned(15 downto 0) := (others => '0');
signal rInitialGuess3 : unsigned(15 downto 0) := (others => '0');
signal sigma0TempProduct : unsigned(47 downto 0) := (others => '0');
signal rcpSigma0 : unsigned(31 downto 0) := (others => '0');
signal rcpSigma1 : unsigned(31 downto 0) := (others => '0');
signal rcpSigma2 : unsigned(31 downto 0) := (others => '0');
signal rcpSigma3 : unsigned(31 downto 0) := (others => '0');
signal rProduct : unsigned(47 downto 0) := (others => '0');
signal rRefined0 : unsigned(31 downto 0) := (others => '0');
signal rRefined1 : unsigned(31 downto 0) := (others => '0');
signal rRefined2 : unsigned(31 downto 0) := (others => '0');
signal rRefined3 : unsigned(31 downto 0) := (others => '0');
signal rcpSqrSigma0Product : unsigned(63 downto 0) := (others => '0');
signal rcpSqrSigma0 : unsigned(31 downto 0) := (others => '0');
signal rAccumProduct : unsigned(63 downto 0) := (others => '0');
signal rAccum : unsigned(31 downto 0) := (others => '0');
signal resultMantissa : unsigned(22 downto 0) := (others => '0');


-- Conversion (CNV) pipe signals:
signal cnvEarlyOutType0 : eCnvEarlyOutType := CnvNoEarlyOut;
signal cnvEarlyOutType1 : eCnvEarlyOutType := CnvNoEarlyOut;
signal cnvShiftAmount : signed(7 downto 0) := (others => '0');
signal cnvIsNegative0 : std_logic := '0';
signal cnvIsNegative1 : std_logic := '0';
signal cnvU32ShiftAmount0 : unsigned(4 downto 0) := (others => '0');
signal cnvU32ShiftAmount1 : unsigned(4 downto 0) := (others => '0');
signal cnvU32ShiftRight : std_logic := '0';
signal cnvInput : unsigned(31 downto 0) := (others => '0');
signal cnvInput1 : unsigned(31 downto 0) := (others => '0');
signal cnvShiftedTemporary : unsigned(31 downto 0) := (others => '0');
signal cnvIsValid : std_logic := '0';
signal cnvIsValid1 : std_logic := '0';
signal cnvMode0 : eConvertMode := F_to_UNORM16;
signal cnvMode1 : eConvertMode := F_to_UNORM16;

-- Output signals:
signal OSHFT : std_logic_vector(31 downto 0) := (others => '0');
signal OADD : std_logic_vector(31 downto 0) := (others => '0');
signal OMUL : std_logic_vector(31 downto 0) := (others => '0');
signal OCMP : std_logic_vector(31 downto 0) := (others => '0');
signal ORCP : std_logic_vector(31 downto 0) := (others => '0');
signal OCNV : std_logic_vector(31 downto 0) := (others => '0');
signal OBIT : std_logic_vector(31 downto 0) := (others => '0');
signal OMUX : MUXArrayType := (others => (others => '0') );

begin

comAIsNeg <= IN_A(31);
comBIsNeg <= IN_B(31);
comAIsINF <= GetFloatIsINF(unsigned(IN_A) );
comBIsINF <= GetFloatIsINF(unsigned(IN_B) );
comAIsNaN <= GetFloatIsNAN(unsigned(IN_A) );
comBIsNaN <= GetFloatIsNAN(unsigned(IN_B) );
comAIsReal <= GetFloatIsReal(unsigned(IN_A) );
comBIsReal <= GetFloatIsReal(unsigned(IN_B) );
comAIsDenormal <= '1' when (GetRawExponent(unsigned(IN_A) ) = X"00") else '0';
comBIsDenormal <= '1' when (GetRawExponent(unsigned(IN_B) ) = X"00") else '0';
comDenormalFlushedA <= FlushDenormsToZero(unsigned(IN_A) );
comDenormalFlushedB <= FlushDenormsToZero(unsigned(IN_B) );
comRawExponentA <= GetRawExponent(unsigned(IN_A) );
comRawExponentB <= GetRawExponent(unsigned(IN_B) );
comASign <= GetFloatIsNegative(unsigned(IN_A) );
comBSign <= GetFloatIsNegative(unsigned(IN_B) );
comSignedExponentA <= GetSignedExponent(unsigned(IN_A) );
comSignedExponentB <= GetSignedExponent(unsigned(IN_B) );
comRawMantissaA <= GetMantissa(unsigned(IN_A) );
comRawMantissaB <= GetMantissa(unsigned(IN_B) );
comALessThanB <= '1' when (unsigned(IN_A(30 downto 0) ) < unsigned(IN_B(30 downto 0) ) ) else '0';
comAEqualsB <= '1' when (unsigned(IN_A(30 downto 0) ) = unsigned(IN_B(30 downto 0) ) ) else '0';

-- Output MUX handling:
with OMUX(0) select
	OUT_RESULT <= OCMP when "0000001",
					OADD when "0000010",
					OMUL when "0000100",
					OSHFT when "0001000",
					ORCP when "0010000",
					OCNV when "0100000",
					OBIT when "1000000",
					(others => '0') when others;

-- Output MUX process:
OMUXProcess : process(clk)
begin
	if (rising_edge(clk) ) then
		OMUX(maxCycleCount - 1) <= (others => '0'); -- Push back a new empty entry
		for i in OMUX'length-2 downto 0 loop
			OMUX(i) <= OMUX(i + 1); -- Shift the whole vector down by one entry per clock cycle (shifting in zeroed bits at the top each time)
		end loop;
		if (ICMP_GO = '1') then
			OMUX(CMP_CYCLES - 1) <= "0000001";
		elsif (IADD_GO = '1') then
			OMUX(ADD_CYCLES - 1) <= "0000010";
		elsif (IMUL_GO = '1') then
			OMUX(MUL_CYCLES - 1) <= "0000100";
		elsif (ISHFT_GO = '1') then
			OMUX(SHFT_CYCLES - 1) <= "0001000";
		elsif (ISPEC_GO = '1') then
			OMUX(SPEC_CYCLES - 1) <= "0010000";
		elsif (ICNV_GO = '1') then
			OMUX(CNV_CYCLES - 1) <= "0100000";
		elsif (IBIT_GO = '1') then
			OMUX(BIT_CYCLES - 1) <= "1000000";
		end if;
	end if;
end process OMUXProcess;

-- Shift (SHFT) pipe process:
SHFTStage0 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (ISHFT_GO = '1') then
			if (comAIsReal = '0') then
				OSHFT <= IN_A;
			else
				if (DoesShiftToINFOrDEN(unsigned(IN_A), CastShiftModeBitsToEnum(unsigned(IN_MODE) ) ) = '1') then
					if (IsShiftUp(CastShiftModeBitsToEnum(unsigned(IN_MODE) ) ) = '1') then
						OSHFT <= IN_A(31) & X"FF" & "00000000000000000000000";
					else
						OSHFT <= IN_A(31) & X"00" & "00000000000000000000000";
					end if;
				else
					if (comAIsDenormal = '1') then -- Make sure that zero stays zero. Don't let the shifts turn our zeroes into nonzero values.
						OSHFT <= std_logic_vector(comDenormalFlushedA);
					else
						OSHFT <= std_logic_vector(PerformCoreShift(unsigned(IN_A), unsigned(IN_MODE) ) );
					end if;
				end if;
			end if;
		else
			OSHFT <= (others => '0');
		end if;
	end if;
end process SHFTStage0;

-- Compare (CMP) pipe process:
CMPStage0 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (ICMP_GO = '1') then
			case eCmpType'val(to_integer(unsigned(IN_MODE) ) ) is
				when CmpMin =>
					OCMP <= std_logic_vector(CmpMinFunc(unsigned(IN_A), unsigned(IN_B), comAIsNaN, comBIsNaN, comAIsNeg, comBIsNeg, comALessThanB) );

				when CmpMax =>
					OCMP <= std_logic_vector(CmpMaxFunc(unsigned(IN_A), unsigned(IN_B), comAIsNaN, comBIsNaN, comAIsNeg, comBIsNeg, comALessThanB) );

				when CmpSlt =>
					OCMP <= std_logic_vector(CmpSltFunc(comAEqualsB, comALessThanB, comAIsNaN, comBIsNaN, comDenormalFlushedA, comDenormalFlushedB, comAIsNeg, comBIsNeg, comAIsDenormal, comBIsDenormal) );

				when CmpSge =>
					OCMP <= std_logic_vector(CmpSgeFunc(comAEqualsB, comALessThanB, comAIsNaN, comBIsNaN, comDenormalFlushedA, comDenormalFlushedB, comAIsNeg, comBIsNeg, comAIsDenormal, comBIsDenormal) );

				when CmpSgn =>
					OCMP <= std_logic_vector(CmpSgnFunc(unsigned(IN_A), comAIsNaN, comAIsDenormal, comAIsNeg) );
				
				when others =>
					OCMP <= IN_A;

				--when CmpCmp =>
					--OCMP <= std_logic_vector(CmpCmpFunc(unsigned(IN_A), unsigned(IN_B), unsigned(ICMP_C) ) );

				--when CmpCnd =>
					--OCMP <= std_logic_vector(CmpCndFunc(unsigned(IN_A), unsigned(IN_B), unsigned(ICMP_C) ) );
			end case;
		else
			OCMP <= (others => '0');
		end if;
	end if;
end process CMPStage0;

-- Bitwise (BIT) pipe process:
BITStage0 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (IBIT_GO = '1') then
			case eBitMode'val(to_integer(unsigned(IN_MODE) ) ) is
				when BShftL8 =>
					OBIT <= IN_A(23 downto 0) & X"00";

				when BShftL16 =>
					OBIT <= IN_A(15 downto 0) & X"0000";

				when BShftL24 =>
					OBIT <= IN_A(7 downto 0) & X"000000";

				when BShftR8 =>
					OBIT <= X"00" & IN_A(31 downto 8);

				when BShftR16 =>
					OBIT <= X"0000" & IN_A(31 downto 16);

				when BShftR24 =>
					OBIT <= X"000000" & IN_A(31 downto 24);
				
				when BOr =>
					OBIT <= IN_A or IN_B;

				when others => -- when BAnd =>
					OBIT <= IN_A and IN_B;
			end case;
		else
			OBIT <= (others => '0');
		end if;
	end if;
end process BITStage0;

-- Reciprocal (RCP) pipe process (cycle 1 of 14):
RCPStage0 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (ISPEC_GO = '1') then

			rcpPipeline(0).pipeStageIsValid <= '1';
			rcpPipeline(0).rcpSign <= comASign;

			if (oneF(30 downto 0) = unsigned(IN_A(30 downto 0) ) ) then -- Early out for rcp(1.0f) or rcp(-1.0f) = 1.0f
				rcpPipeline(0).useEarlyOutBypass <= '1';
				rcpPipeline(0).rcpExponent <= GetRawExponent(oneF);
				rcpPipeline(0).calculatedMantissa <= GetMantissa(oneF);
			elsif (comAIsDenormal = '1') then -- Early out for rcp(denormal) or rcp(0.0f) or rcp(-0.0f) = +/-INF
				rcpPipeline(0).useEarlyOutBypass <= '1';
				rcpPipeline(0).rcpExponent <= X"FF";
				rcpPipeline(0).calculatedMantissa <= (others => '0');
			elsif (comAIsNaN = '1') then -- Early out for rcp(NaN) = NaN
				rcpPipeline(0).useEarlyOutBypass <= '1';
				rcpPipeline(0).rcpExponent <= X"FF";
				rcpPipeline(0).calculatedMantissa <= (others => '1');
			elsif (comAIsINF = '1') then -- Early out for rcp(INF) or rcp(-INF) = +/- 0
				rcpPipeline(0).useEarlyOutBypass <= '1';
				rcpPipeline(0).rcpExponent <= (others => '0');
				rcpPipeline(0).calculatedMantissa <= (others => '0');
			elsif (comRawMantissaA = to_unsigned(0, 23) ) then -- Early out for powers of 2
				rcpPipeline(0).useEarlyOutBypass <= '1';
				rcpPipeline(0).rcpExponent <= to_unsigned(254, 8) - comRawExponentA; -- Note that the power of 2 case subtracts (254-x), whereas the non-power-of-2 case is (253-x)
				rcpPipeline(0).calculatedMantissa <= (others => '0');
			else -- Typical reciprocal case!
				rcpPipeline(0).useEarlyOutBypass <= '0';
				rcpPipeline(0).rcpExponent <= to_unsigned(253, 8) - comRawExponentA;
				rcpPipeline(0).calculatedMantissa <= comRawMantissaA;
			end if;
		else
			rcpPipeline(0).pipeStageIsValid <= '0';
		end if;

		-- Advance all pipeline stages for the RCP pipe
		for i in 1 to SPEC_CYCLES-1 loop
			rcpPipeline(i) <= rcpPipeline(i - 1);
		end loop;
	end if;
end process RCPStage0;

RCPStage1 : process(clk)
	variable LUTIndex : natural range 0 to 15;
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(0).pipeStageIsValid = '1' and rcpPipeline(0).useEarlyOutBypass = '0') then
			-- const uint16_t rInitialGuess = softfloat_approxRecip_1k0s[index] - ( (softfloat_approxRecip_1k1s[index] * (uint_fast32_t) eps) >> 20); // 16x32 multiply, 16-16 subtraction
			LUTIndex := to_integer(rcpPipeline(0).calculatedMantissa(22 downto 19) ); -- Take the 4 MSB from the mantissa and use that for our LUT index
			rcpLookupSlope <= RcpLookupTable_Slopes(LUTIndex);
			rcpLookupOffset0 <= RcpLookupTable_Offsets(LUTIndex);
		end if;
	end if;
end process RCPStage1;

RCPStage2 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(1).pipeStageIsValid = '1' and rcpPipeline(1).useEarlyOutBypass = '0') then
			-- const uint16_t rInitialGuess = softfloat_approxRecip_1k0s[index] - ( (softfloat_approxRecip_1k1s[index] * (uint_fast32_t) eps) >> 20); // 16x32 multiply, 16-16 subtraction
			slopeMultiply <= rcpLookupSlope * rcpPipeline(1).calculatedMantissa(18 downto 3);
			rcpLookupOffset1 <= rcpLookupOffset0;
		end if;
	end if;
end process RCPStage2;

RCPStage3 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(2).pipeStageIsValid = '1' and rcpPipeline(2).useEarlyOutBypass = '0') then
			-- const uint16_t rInitialGuess = softfloat_approxRecip_1k0s[index] - ( (softfloat_approxRecip_1k1s[index] * (uint_fast32_t) eps) >> 20); // 16x32 multiply, 16-16 subtraction
			rInitialGuess0 <= rcpLookupOffset1 - (slopeMultiply(31 downto 20) );
		end if;
	end if;
end process RCPStage3;

RCPStage4 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(3).pipeStageIsValid = '1' and rcpPipeline(3).useEarlyOutBypass = '0') then
			-- const uint32_t rcpSigma0 = ~(const uint_fast32_t) ( (rInitialGuess * (const uint_fast64_t) fixed_1_31) >> 7); // 16x32 multiply
			sigma0TempProduct <= (rInitialGuess0 * ('1' & rcpPipeline(3).calculatedMantissa & "00000000") ); -- Construct our 1.31 fixed point value by adding the hidden 1-bit and shifting left by 8
			rInitialGuess1 <= rInitialGuess0;
		end if;
	end if;
end process RCPStage4;

RCPStage5 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(4).pipeStageIsValid = '1' and rcpPipeline(4).useEarlyOutBypass = '0') then
			-- const uint32_t rcpSigma0 = ~(const uint_fast32_t) ( (rInitialGuess * (const uint_fast64_t) fixed_1_31) >> 7); // 16x32 multiply
			rcpSigma0 <= not sigma0TempProduct(38 downto 7); -- Shift right by 7 and truncate to 32 bits
			rInitialGuess2 <= rInitialGuess1;
		end if;
	end if;
end process RCPStage5;

RCPStage6 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(5).pipeStageIsValid = '1' and rcpPipeline(5).useEarlyOutBypass = '0') then
			-- uint_fast32_t rRefined = ( (uint_fast32_t) rInitialGuess << 16) + ( (rInitialGuess * (uint_fast64_t) rcpSigma0) >> 24); // 16x32 multiply, 32+24 addition
			rProduct <= rInitialGuess2 * rcpSigma0;
			rInitialGuess3 <= rInitialGuess2;
		end if;
	end if;
end process RCPStage6;

RCPStage7 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(6).pipeStageIsValid = '1' and rcpPipeline(6).useEarlyOutBypass = '0') then
			-- uint_fast32_t rRefined = ( (uint_fast32_t) rInitialGuess << 16) + ( (rInitialGuess * (uint_fast64_t) rcpSigma0) >> 24); // 16x32 multiply, 32+24 addition
			rRefined0 <= (rInitialGuess3 & X"0000") + (X"00" & rProduct(47 downto 24) );
		end if;
	end if;
end process RCPStage7;

RCPStage8 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(7).pipeStageIsValid = '1' and rcpPipeline(7).useEarlyOutBypass = '0') then
			-- const uint32_t rcpSqrSigma0 = ((uint_fast64_t) rcpSigma1 * rcpSigma1) >> 32; // 32x32 multiply
			rcpSqrSigma0Product <= (rcpSigma0 * rcpSigma0);
			rRefined1 <= rRefined0;
		end if;
	end if;
end process RCPStage8;

RCPStage9 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(8).pipeStageIsValid = '1' and rcpPipeline(8).useEarlyOutBypass = '0') then
			-- const uint32_t rcpSqrSigma0 = ((uint_fast64_t) rcpSigma1 * rcpSigma1) >> 32; // 32x32 multiply
			rcpSqrSigma0 <= rcpSqrSigma0Product(63 downto 32);
			rRefined2 <= rRefined1;
		end if;
	end if;
end process RCPStage9;

RCPStage10 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(9).pipeStageIsValid = '1' and rcpPipeline(9).useEarlyOutBypass = '0') then
			-- rAccum = rRefined + ( (uint32_t) rRefined * (uint_fast64_t) rcpSqrSigma0) >> 48; // 32x32 multiply, 32+16 add
			rAccumProduct <= rRefined2 * rcpSqrSigma0;
			rRefined3 <= rRefined2;
		end if;
	end if;
end process RCPStage10;

RCPStage11 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(10).pipeStageIsValid = '1' and rcpPipeline(10).useEarlyOutBypass = '0') then
			-- rAccum = rRefined + ( (uint32_t) rRefined * (uint_fast64_t) rcpSqrSigma0) >> 48; // 32x32 multiply, 32+16 add
			rAccum <= rRefined3 + (X"0000" & rAccumProduct(63 downto 48) );
		end if;
	end if;
end process RCPStage11;

RCPStage12 : process(clk)
	variable rLocal : unsigned(29 downto 0);
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(11).pipeStageIsValid = '1' and rcpPipeline(11).useEarlyOutBypass = '0') then
			rLocal := rAccum(30 downto 1) + 64; -- rAccum = (rAccum >> 1) + (1 << 6)
			resultMantissa <= rLocal(29 downto 7); -- resultMantissa = rAccum >> 7
		end if;
	end if;
end process RCPStage12;

-- Reciprocal (RCP) pipe process (cycle 14 of 14):
RCPStage13 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(12).pipeStageIsValid = '1') then
			if (rcpPipeline(12).useEarlyOutBypass = '0') then
				ORCP <= rcpPipeline(12).rcpSign & std_logic_vector(rcpPipeline(12).rcpExponent) & std_logic_vector(resultMantissa);
			else
				ORCP <= rcpPipeline(12).rcpSign & std_logic_vector(rcpPipeline(12).rcpExponent) & std_logic_vector(rcpPipeline(12).calculatedMantissa);
			end if;
		end if;
	end if;
end process RCPStage13;

-- Addition (ADD) pipe process (cycle 1 of 4):
ADDStage0 : process(clk)
	variable aIsNaN : std_logic;
	variable bIsNaN : std_logic;
	variable aIsInf : std_logic;
	variable bIsInf : std_logic;
	variable aIsReal : std_logic;
	variable bIsReal : std_logic;
begin
	if (rising_edge(clk) ) then
		addPipelineValidStage0 <= IADD_GO;
		if (IADD_GO = '1') then
			addDenormFlushedValA <= comDenormalFlushedA;
			addDenormFlushedValB <= comDenormalFlushedB;
			addALessThanB <= comALessThanB;
			addExponentDeltaAMinusB <= GetSignedExponent(unsigned(IN_A) ) - GetSignedExponent(unsigned(IN_B) );
			addExponentDeltaBMinusA <= GetSignedExponent(unsigned(IN_B) ) - GetSignedExponent(unsigned(IN_A) );
			if (unsigned(GetSignedExponent(unsigned(IN_A) ) - GetSignedExponent(unsigned(IN_B) ) ) > 24) then
				addExponentDeltaAMinusBShiftTooFar <= '1';
			else
				addExponentDeltaAMinusBShiftTooFar <= '0';
			end if;
			if (unsigned(GetSignedExponent(unsigned(IN_B) ) - GetSignedExponent(unsigned(IN_A) ) ) > 24) then
				addExponentDeltaBMinusAShiftTooFar <= '1';
			else
				addExponentDeltaBMinusAShiftTooFar <= '0';
			end if;
			if (comDenormalFlushedA(30 downto 0) = comDenormalFlushedB(30 downto 0) ) then
				addSameNumberDifferentSigns0 <= '1';
			else
				addSameNumberDifferentSigns0 <= '0';
			end if;
			if (comAIsReal = '1') then
				aIsReal := '1';
				aIsNaN := '0';
				aIsInf := '0';
			else
				aIsReal := '0';
				if (comAIsNaN = '1') then
					aIsNaN := '1';
				else
					aIsNaN := '0';
				end if;
				if (comAIsINF = '1') then
					aIsInf := '1';
				else
					aIsInf := '0';
				end if;
			end if;

			if (comBIsReal = '1') then
				bIsReal := '1';
				bIsNaN := '0';
				bIsInf := '0';
			else
				bIsReal := '0';
				if (comBIsNaN = '1') then
					bIsNaN := '1';
				else
					bIsNaN := '0';
				end if;
				if (comBIsINF = '1') then
					bIsInf := '1';
				else
					bIsInf := '0';
				end if;
			end if;

			-- Handle INF and NAN special cases:
			if ( (aIsReal = '1' and bIsInf = '1') or (aIsInf = '1' and bIsReal = '1') ) then -- Normal + INF or INF + Normal case (or subtraction, or negative INF or negative normal)
				addEarlyOutBypassEnable0 <= '1';
				if (aIsReal = '1') then
					addEarlyOutBypass0 <= unsigned(IN_B);
				else
					addEarlyOutBypass0 <= unsigned(IN_A);
				end if;
			elsif ( (aIsReal = '1' and bIsNaN = '1') or (aIsNaN = '1' and bIsReal = '1') ) then -- Normal + NaN or NaN + Normal case (or subtraction, or negative NaN or negative normal)
				addEarlyOutBypassEnable0 <= '1';
				if (aIsReal = '1') then
					addEarlyOutBypass0 <= unsigned(IN_B);
				else
					addEarlyOutBypass0 <= unsigned(IN_A);
				end if;
			elsif (aIsNaN = '1' and bIsNaN = '1') then -- NaN + NaN
				addEarlyOutBypassEnable0 <= '1';
				addEarlyOutBypass0 <= unsigned(IN_A);
			elsif (aIsInf = '1' and bIsInf = '1') then -- INF + INF
				addEarlyOutBypassEnable0 <= '1';
				if (comAIsNeg = comBIsNeg) then
					addEarlyOutBypass0 <= unsigned(IN_A); -- INF + INF or -INF - INF doesn't change
				else
					addEarlyOutBypass0 <= '0' & X"FF" & "11111111111111111111111"; -- INF - INF = NaN
				end if;
			else
				-- Special case of X - X = 0 (or X + -X = 0 or -X + X = 0)
				-- Note that D3D specs that: -0 + +0 = +0 or +0 - +0 = +0 (this rule takes precedence over the X + 0 = X rule)
				if ( (comAIsNeg /= comBIsNeg) and (comDenormalFlushedA(30 downto 0) = comDenormalFlushedB(30 downto 0) ) ) then
					addEarlyOutBypassEnable0 <= '1';
					addEarlyOutBypass0 <= '0' & X"00" & "00000000000000000000000";
				else -- Typical addition case here:
					if (comALessThanB = '1') then -- Skip the addition and just return the non-zero number if one of the two operands is 0.0f or -0.0f.
						if (comAIsDenormal = '1') then
							addEarlyOutBypassEnable0 <= '1';
							addEarlyOutBypass0 <= comDenormalFlushedB;
						else
							addEarlyOutBypassEnable0 <= '0';
						end if;
					else
						if (comBIsDenormal = '1') then
							addEarlyOutBypassEnable0 <= '1';
							addEarlyOutBypass0 <= comDenormalFlushedA;
						else
							addEarlyOutBypassEnable0 <= '0';
						end if;
					end if;
				end if;
			end if;
		end if;
	end if;
end process ADDStage0;

-- Addition (ADD) pipe process (cycle 2 of 4):
ADDStage1 : process(clk)
	variable addMinVal0 : unsigned(31 downto 0);
	variable addMaxVal0 : unsigned(31 downto 0);
	variable shiftAmount : unsigned(7 downto 0);
	variable shiftTooFar : std_logic;
	variable mantissaMax : signed(25 downto 0);
	variable mantissaMin : signed(25 downto 0);
begin
	if (rising_edge(clk) ) then
		addPipelineValidStage1 <= addPipelineValidStage0;
		addEarlyOutBypassEnable1 <= addEarlyOutBypassEnable0;
		addEarlyOutBypass1 <= addEarlyOutBypass0;
		if (addPipelineValidStage0 = '1') then
			if (addEarlyOutBypassEnable0 = '0') then
				-- Special case of X - X = 0 (or X + -X = 0 or -X + X = 0)
				-- Note that D3D specs that: -0 + +0 = +0 or +0 - +0 = +0 (this rule takes precedence over the X + 0 = X rule)
				if ( (addDenormFlushedValA(31) /= addDenormFlushedValB(31) ) and (addSameNumberDifferentSigns0 = '1') ) then
					addSameNumberDifferentSigns1 <= '1';
				else
					addSameNumberDifferentSigns1 <= '0';
					if (addALessThanB = '1') then
						addMinVal0 := addDenormFlushedValA;
						addMaxVal0 := addDenormFlushedValB;
						shiftAmount := unsigned(addExponentDeltaBMinusA); -- We know that expmax must be >= expmin, so this can never be negative
						shiftTooFar := addExponentDeltaBMinusAShiftTooFar;
					else
						addMinVal0 := addDenormFlushedValB;
						addMaxVal0 := addDenormFlushedValA;
						shiftAmount := unsigned(addExponentDeltaAMinusB); -- We know that expmax must be >= expmin, so this can never be negative
						shiftTooFar := addExponentDeltaAMinusBShiftTooFar;
					end if;
					addMaxVal1 <= addMaxVal0;
					if (shiftTooFar = '1') then
						addEarlyOutBypassEnable1 <= '1';
						addEarlyOutBypass1 <= addMaxVal0;
					else
						mantissaMax := signed("001" & std_logic_vector(GetMantissa(addMaxVal0) ) );
						if (GetFloatIsNegative(addMaxVal0) = '1') then
							mantissaMax := -mantissaMax;
						end if;

						mantissaMin := signed("001" & std_logic_vector(GetMantissa(addMinVal0) ) );
						if (GetFloatIsNegative(addMinVal0) = '1') then
							mantissaMin := -mantissaMin;
						end if;

						mantissaMin := shift_right(mantissaMin, to_integer(shiftAmount) );
						addPostAddMantissa1 <= mantissaMax + mantissaMin;
					end if;
				end if;
			end if;
		end if;
	end if;
end process ADDStage1;

-- Addition (ADD) pipe process (cycle 3 of 4):
ADDStage2 : process (clk)
	variable finalSignIsNeg : std_logic;
	variable postAddMantissa : signed(25 downto 0);
	variable finalExp : signed(7 downto 0);
	variable renormalizeShiftAmount : natural range 0 to 23;
begin
	if (rising_edge(clk) ) then
		addPipelineValidStage2 <= addPipelineValidStage1;
		if (addPipelineValidStage1 = '1') then
			addEarlyOutBypassEnable2 <= addEarlyOutBypassEnable1;
			if (addEarlyOutBypassEnable1 = '1') then
				OADD_Temp <= std_logic_vector(addEarlyOutBypass1);
			else
				if (addSameNumberDifferentSigns1 = '1') then
					addEarlyOutBypassEnable2 <= '1';
					OADD_Temp <= '0' & X"00" & "00000000000000000000000";
				else
					finalSignIsNeg := addPostAddMantissa1(25);
					addFinalSignIsNeg <= finalSignIsNeg;
					if (finalSignIsNeg = '1') then
						postAddMantissa := -addPostAddMantissa1;
					else
						postAddMantissa := addPostAddMantissa1;
					end if;

					finalExp := GetSignedExponent(addMaxVal1);

					if ( (postAddMantissa(24) = '1') and (GetSignedExponent(addMaxVal1) > 126) ) then
						if (finalSignIsNeg = '1') then -- Handle saturation case of exponent overflowing into +/-INF here
							addEarlyOutBypassEnable2 <= '1';
							OADD_Temp <= "1" & X"FF" & "00000000000000000000000"; -- return -INF
						else
							addEarlyOutBypassEnable2 <= '1';
							OADD_Temp <= "0" & X"FF" & "00000000000000000000000"; -- return +INF
						end if;
					else
						if (postAddMantissa(24) = '1') then -- Check to see if our mantissa is overflowing into our exponent field (if so, shift that bit out and increment the exponent by 1)
							postAddMantissa := postAddMantissa srl 1;
							finalExp := finalExp + 1;
						end if;
						addPostAddMantissa <= postAddMantissa;

						addFinalExp <= finalExp;
						addRenormalizeShiftAmount <= bitScan(postAddMantissa);
					end if;
				end if;
			end if;
		end if;
	end if;
end process ADDStage2;

-- Addition (ADD) pipe process (cycle 4 of 4):
ADDStage3 : process(clk)
	variable newFinalExp : signed(7 downto 0);
	variable postAddMantissa : signed(25 downto 0);
begin
	if (rising_edge(clk) ) then
		if (addPipelineValidStage2 = '1') then
			if (addEarlyOutBypassEnable2 = '1') then
				OADD <= OADD_Temp;
			else
				postAddMantissa := addPostAddMantissa sll addRenormalizeShiftAmount;
				newFinalExp := addFinalExp - addRenormalizeShiftAmount;
				if (newFinalExp < -126) then -- Saturate to 0 if we end up underflowing into 0 or denormals
					OADD <= '0' & X"00" & "00000000000000000000000";
				else
					OADD <= addFinalSignIsNeg & MakeExponentFromSigned(newFinalExp) & std_logic_vector(postAddMantissa(22 downto 0) );
				end if;
			end if;
		end if;
	end if;
end process ADDStage3;

-- Multiplication (MUL) pipe process (cycle 1 of 5):
MULStage0 : process(clk)
	variable resultSign : std_logic;
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage0 <= IMUL_GO;
		if (IMUL_GO = '1') then
			-- Calculate the result sign:
			resultSign := comASign xor comBSign;
			mulResultSign0 <= resultSign;

			if (comAIsReal = '0') then -- Handle INF and NaN inputs as special-case early outs:
				mulEarlyOutBypassEnable0 <= '1';

				if (comRawMantissaA = "00000000000000000000000") then -- INF * b
					if (comBIsDenormal = '1') then -- INF * 0 = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					elsif (comBIsNaN = '1') then -- INF * NaN = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					else -- INF * b = INF
						mulEarlyOutBypass0 <= resultSign & X"FF" & "00000000000000000000000";
					end if;
				else -- NaN * b = NaN
					mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
				end if;
			elsif (comBIsReal = '0') then
				mulEarlyOutBypassEnable0 <= '1';

				if (comRawMantissaB = "00000000000000000000000") then -- a * INF
					if (comAIsDenormal = '1') then -- 0 * INF = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					elsif (comAIsNaN = '1') then -- NaN * INF = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					else -- a * INF = INF
						mulEarlyOutBypass0 <= resultSign & X"FF" & "00000000000000000000000";
					end if;
				else -- a * NaN = NaN
					mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
				end if;
			elsif ( (comAIsDenormal = '1') or (comBIsDenormal = '1') ) then -- Handle multiplication by zero (or denormals, which get flushed to zero) as a special-case early out:
				mulEarlyOutBypassEnable0 <= '1';
				mulEarlyOutBypass0 <= resultSign & X"00" & "00000000000000000000000";
			else -- Primary multiplication case:
				mulEarlyOutBypassEnable0 <= '0';
				mulResultExp0 <= resize(comSignedExponentA, 9) + resize(comSignedExponentB, 9);
				mulAssembledMantissaA <= '1' & comRawMantissaA;
				mulAssembledMantissaB <= '1' & comRawMantissaB;
			end if;
		end if;
	end if;
end process MULStage0;

-- Multiplication (MUL) pipe process (cycle 2 of 5):
MULStage1 : process(clk)
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage1 <= mulPipelineValidStage0;
		if (mulPipelineValidStage0 = '1') then
			mulEarlyOutBypassEnable1 <= mulEarlyOutBypassEnable0;
			mulEarlyOutBypass1 <= mulEarlyOutBypass0;
			mulResultExp1 <= mulResultExp0;
			mulResultSign1 <= mulResultSign0;
			if (mulEarlyOutBypassEnable0 = '0') then
				-- TODO: See if this can be broken up into just one DSP usage with an 18x17 multiply and then some smaller 6x18 multiplies added together rather than the current two DSP multiplies
				mulResultMantissa1 <= mulAssembledMantissaA * mulAssembledMantissaB;
			end if;
		end if;
	end if;
end process MULStage1;

-- Multiplication (MUL) pipe process (cycle 3 of 5):
MULStage2 : process(clk)
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage2 <= mulPipelineValidStage1;
		if (mulPipelineValidStage1 = '1') then
			mulEarlyOutBypassEnable2 <= mulEarlyOutBypassEnable1;
			mulEarlyOutBypass2 <= mulEarlyOutBypass1;
			mulResultExp2 <= mulResultExp1;
			mulResultMantissa2 <= mulResultMantissa1;
			mulResultSign2 <= mulResultSign1;
		end if;
	end if;
end process MULStage2;

-- Multiplication (MUL) pipe process (cycle 4 of 5):
MULStage3 : process(clk)
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage3 <= mulPipelineValidStage2;
		if (mulPipelineValidStage2 = '1') then
			mulEarlyOutBypassEnable3 <= mulEarlyOutBypassEnable2;
			mulEarlyOutBypass3 <= mulEarlyOutBypass2;
			mulResultExp3 <= mulResultExp2;
			mulResultMantissa3 <= mulResultMantissa2;
			mulResultSign3 <= mulResultSign2;
		end if;
	end if;
end process MULStage3;

-- Multiplication (MUL) pipe process (cycle 5 of 5):
-- TODO: Handle proper rounding. About half of all of the output values aren't rounded as they should be!
MULStage4 : process(clk)
	variable finalMantissa : unsigned(47 downto 0);
begin
	if (rising_edge(clk) ) then
		if (mulPipelineValidStage3 = '1') then
			if (mulEarlyOutBypassEnable3 = '1') then -- Mul bypass case
				OMUL <= std_logic_vector(mulEarlyOutBypass3);
			else -- Non-bypass standard case
				if (mulResultExp3 > to_signed(127, 9) ) then -- Saturate to INF if we end up overflowing to +/- INF
					OMUL <= mulResultSign3 & X"FF" & "00000000000000000000000";
				elsif (mulResultExp3 < to_signed(-126, 9) ) then -- Saturate to 0 if we end up underflowing into 0 or denormals
					OMUL <= mulResultSign3 & X"00" & "00000000000000000000000";
				else -- Standard case
					finalMantissa := mulResultMantissa3 srl 23;
					if (finalMantissa(24) = '1') then -- If the mantissa overflows into the exponent, we need to renormalize
						if (mulResultExp3 = to_signed(127, 9) ) then -- Our overflow could cause us to overflow into INF
							OMUL <= mulResultSign3 & X"FF" & "00000000000000000000000";
						else
							finalMantissa := finalMantissa srl 1; -- Handle renormalize by adding 1 to the exponent and shifting the mantissa to the right by 1
							OMUL <= mulResultSign3 & MakeExponentFromSigned(mulResultExp3(7 downto 0) + to_signed(1, 8) ) & std_logic_vector(finalMantissa(22 downto 0) );
						end if;
					else -- No mantissa overflow case
						OMUL <= mulResultSign3 & MakeExponentFromSigned(mulResultExp3(7 downto 0) ) & std_logic_vector(finalMantissa(22 downto 0) );
					end if;
				end if;
			end if;
		end if;
	end if;
end process MULStage4;

-- Conversion (CNV) pipe process:
CNVStage0 : process(clk)
	variable earlyOutType : eCnvEarlyOutType;
	variable shiftU32HighBitIndex : unsigned(4 downto 0);
begin
	if (rising_edge(clk) ) then
		if (ICNV_GO = '1') then
			cnvIsValid <= '1';
			cnvMode0 <= eConvertMode'val(to_integer(unsigned(IN_MODE) ) );
			cnvInput <= unsigned(IN_A);
			cnvIsNegative0 <= comAIsNeg;
			case eConvertMode'val(to_integer(unsigned(IN_MODE) ) ) is
				when F_to_I24_Trunc =>
					earlyOutType := CnvFloatToInt24_Trunc_GetEarlyOutType(unsigned(IN_A), comAIsNaN, comAIsNeg);
					cnvEarlyOutType0 <= earlyOutType;
					if (earlyOutType = CnvNoEarlyOut) then
						cnvShiftAmount <= CnvFloatToInt24_Trunc_Cycle0(comSignedExponentA);
					end if;
				when F_to_I23_RoundNearestEven =>
					earlyOutType := CnvFloatToInt23_RoundNE_GetEarlyOutType(unsigned(IN_A), comAIsNaN, comAIsNeg );
					cnvEarlyOutType0 <= earlyOutType;
					if (earlyOutType = CnvNoEarlyOut) then
						cnvShiftAmount <= CnvFloatToInt23_RoundNE_Cycle0(comSignedExponentA);
					end if;
				when F_to_I16_RoundNearestEven =>
					earlyOutType := CnvFloatToInt16_RoundNE_GetEarlyOutType(unsigned(IN_A), comAIsNaN, comAIsNeg );
					cnvEarlyOutType0 <= earlyOutType;
					if (earlyOutType = CnvNoEarlyOut) then
						cnvShiftAmount <= CnvFloatToInt16_RoundNE_Cycle0(comSignedExponentA);
					end if;
				when F_to_UNORM16 =>
					earlyOutType := CnvFloatToUNORM16_GetEarlyOutType(unsigned(IN_A), comAIsNaN, comAIsNeg );
					cnvEarlyOutType0 <= earlyOutType;
					if (earlyOutType = CnvNoEarlyOut) then
						cnvShiftAmount <= CnvFloatToUNORM16_Cycle0(comSignedExponentA);						
					end if;
				when F_to_UNORM8 =>
					earlyOutType := CnvFloatToUNORM8_GetEarlyOutType(unsigned(IN_A), comAIsNaN, comAIsNeg );
					cnvEarlyOutType0 <= earlyOutType;
					if (earlyOutType = CnvNoEarlyOut) then
						cnvShiftAmount <= CnvFloatToUNORM8_Cycle0(comSignedExponentA);
					end if;
				when F_to_Half =>
					earlyOutType := CnvFloatToHalf_GetEarlyOutType(unsigned(IN_A), comAIsNaN);
					cnvEarlyOutType0 <= earlyOutType;
					cnvShiftAmount <= (others => '0');
				when Half_to_F =>
					earlyOutType := CnvHalfToFloat_GetEarlyOutType(unsigned(IN_A(14 downto 0) ) );
					cnvEarlyOutType0 <= earlyOutType;
					cnvShiftAmount <= (others => '0');
				when U32_to_F =>
					earlyOutType := CnvU32ToFloat_GetEarlyOutType(unsigned(IN_A) );
					cnvEarlyOutType0 <= earlyOutType;
					shiftU32HighBitIndex := CnvU32ToFloat_GetFirstHighBitSet(unsigned(IN_A) );
					cnvU32ShiftAmount0 <= shiftU32HighBitIndex;
					if (shiftU32HighBitIndex >= 23) then
						cnvU32ShiftRight <= '1';
					else
						cnvU32ShiftRight <= '0';
					end if;
					cnvShiftAmount <= (others => '0');
				when others =>
					cnvEarlyOutType0 <= CnvNoEarlyOut;
					cnvShiftAmount <= (others => '0');
			end case;
		else
			cnvIsValid <= '0';
		end if;
	end if;
end process CNVStage0;

CNVStage1 : process(clk)
	variable tempBuffer : signed(31 downto 0);
begin
	if (rising_edge(clk) ) then
		cnvIsValid1 <= cnvIsValid;
		cnvMode1 <= cnvMode0;
		cnvIsNegative1 <= cnvIsNegative0;
		cnvEarlyOutType1 <= cnvEarlyOutType0;
		cnvU32ShiftAmount1 <= cnvU32ShiftAmount0;

		if (cnvMode0 = U32_to_F) then
			if (cnvU32ShiftRight = '1') then
				cnvShiftedTemporary <= cnvInput srl to_integer(cnvU32ShiftAmount0 - 23);
			else
				cnvShiftedTemporary <= cnvInput sll to_integer(23 - cnvU32ShiftAmount0);
			end if;
		else
			tempBuffer := "000000001" & signed(GetMantissa(cnvInput) );
			cnvShiftedTemporary <= unsigned(tempBuffer srl to_integer(cnvShiftAmount) );
		end if;
		cnvInput1 <= cnvInput;
	end if;
end process CNVStage1;

-- Conversion (CNV) pipe process:
CNVStage2 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (cnvIsValid1 = '1') then
			case cnvMode1 is
				when F_to_I24_Trunc =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= std_logic_vector(CnvFloatToInt24_Trunc_Cycle2(signed(cnvShiftedTemporary), cnvIsNegative1) );
						when CnvNaNEarlyOut =>
							OCNV <= X"00000000";
						when CnvBelowMinEarlyOut =>
							OCNV <= X"FF000000"; -- This is -16777216
						when CnvAboveMaxEarlyOut =>
							OCNV <= X"00FFFFFF"; -- This is 16777215
					end case;
				when F_to_I23_RoundNearestEven =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= std_logic_vector(CnvFloatToInt23_RoundNE_Cycle2(signed(cnvShiftedTemporary), cnvIsNegative1) );
						when CnvNaNEarlyOut =>
							OCNV <= X"00000000";
						when CnvBelowMinEarlyOut =>
							OCNV <= X"FF800000"; -- This is -8388608
						when CnvAboveMaxEarlyOut =>
							OCNV <= X"007FFFFF"; -- This is 8388607
					end case;
				when F_to_I16_RoundNearestEven =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= X"0000" & std_logic_vector(CnvFloatToInt16_RoundNE_Cycle2(signed(cnvShiftedTemporary), cnvIsNegative1) );
						when CnvNaNEarlyOut =>
							OCNV <= X"00000000";
						when CnvBelowMinEarlyOut =>
							OCNV <= X"00008000"; -- This is -32768
						when CnvAboveMaxEarlyOut =>
							OCNV <= X"00007FFF"; -- This is 32767
					end case;
				when F_to_UNORM16 =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= X"0000" & std_logic_vector(CnvFloatToUNORM16_Cycle2(cnvShiftedTemporary) );
						when CnvNaNEarlyOut =>
							OCNV <= X"00000000";
						when CnvBelowMinEarlyOut =>
							OCNV <= X"00000000"; -- This is 0
						when CnvAboveMaxEarlyOut =>
							OCNV <= X"0000FFFF"; -- This is 65535
					end case;
				when F_to_UNORM8 =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= X"000000" & std_logic_vector(CnvFloatToUNORM8_Cycle2(cnvShiftedTemporary) );
						when CnvNaNEarlyOut =>
							OCNV <= X"00000000";
						when CnvBelowMinEarlyOut =>
							OCNV <= X"00000000"; -- This is 0
						when CnvAboveMaxEarlyOut =>
							OCNV <= X"000000FF"; -- This is 255
					end case;
				when F_to_Half =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= X"0000" & cnvIsNegative1 & std_logic_vector(CnvFloatToHalf_Cycle2(cnvInput1) );
						when CnvNaNEarlyOut =>
							OCNV <= X"0000" & cnvIsNegative1 & "11111" & "1111111111"; -- +/- NaN
						when CnvBelowMinEarlyOut =>
							OCNV <= X"0000" & cnvIsNegative1 & "00000" & "0000000000"; -- Saturate to +/- 0.0f
						when CnvAboveMaxEarlyOut =>
							OCNV <= X"0000" & cnvIsNegative1 & "11111" & "0000000000"; -- Saturate to +/- INF
					end case;
				when Half_to_F =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= cnvInput1(15) & std_logic_vector(CnvHalfToFloat_Cycle2(cnvInput1(14 downto 0) ) );
						when CnvNaNEarlyOut =>
							OCNV <= cnvInput1(15) & "11111111" & "11111111111111111111111"; -- +/- NaN
						when CnvBelowMinEarlyOut =>
							OCNV <= cnvInput1(15) & "00000000" & "00000000000000000000000"; -- +/- 0.0f
						when CnvAboveMaxEarlyOut =>
							OCNV <= cnvInput1(15) & "11111111" & "00000000000000000000000"; -- Saturate to +/- INF
					end case;
				when U32_to_F =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= '0' & std_logic_vector(CnvU32ToFloat_Cycle2(cnvU32ShiftAmount1, cnvShiftedTemporary) );
						when others => -- 0x00000000 = 0.0f
							OCNV <= (others => '0');
					end case;
				when others =>
					OCNV <= (others => '0');
			end case;
		end if;
	end if;
end process CNVStage2;

end Behavioral;
