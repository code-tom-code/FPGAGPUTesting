
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;

use work.FloatALU_Types.all;
use work.FloatCommon.all;

package FloatALU_CNV is

	type eCnvEarlyOutType is
	(
		CnvNoEarlyOut, -- 0
		CnvNaNEarlyOut, -- 1
		CnvBelowMinEarlyOut, -- 2
		CnvAboveMaxEarlyOut -- 3
	);

	-- Converts a float32 input to unsigned uint24 using round to nearest even mode
	pure function CnvFloatToUInt24_RoundNE_GetEarlyOutType(a : f32; aIsNaN : std_logic; aIsNegative : std_logic) return eCnvEarlyOutType;

	-- Converts a float32 input to unsigned uint24 using round to nearest even mode
	pure function CnvFloatToUInt24_RoundNE_Cycle0(aSignedExp : signed(7 downto 0) ) return signed;

	-- Converts a float32 input to unsigned uint24 using round to nearest even mode
	pure function CnvFloatToUInt24_RoundNE_Cycle2(tempBuffer : signed(31 downto 0) ) return unsigned;

	-- Converts a float32 input to signed int16 using round to nearest even mode
	pure function CnvFloatToInt16_RoundNE_GetEarlyOutType(a : f32; aIsNaN : std_logic; aIsNegative : std_logic ) return eCnvEarlyOutType;

	-- Converts a float32 input to signed int16 using round to nearest even mode
	pure function CnvFloatToInt16_RoundNE_Cycle0(aSignedExp : signed(7 downto 0) ) return signed;

	-- Converts a float32 input to signed int16 using round to nearest even mode
	pure function CnvFloatToInt16_RoundNE_Cycle2(tempBuffer : signed(31 downto 0); isNegative : std_logic) return unsigned;

	pure function CnvFrc_GetEarlyOutType(a : f32) return eCnvEarlyOutType;

	pure function CnvFrc_Cycle0(a : f32) return unsigned;

	pure function CnvFrc_Cycle1(normalizedMantissa : unsigned(22 downto 0) ) return unsigned;

	pure function CnvFrc_Cycle2(cnvU32ShiftAmount1 : unsigned(4 downto 0); normalizedMantissa : unsigned(22 downto 0) ) return unsigned;

	-- Converts a float32 input to UNORM16
	pure function CnvFloatToUNORM16_GetEarlyOutType(a : f32; aIsNaN : std_logic; aIsNegative : std_logic ) return eCnvEarlyOutType;

	-- Converts a float32 input to UNORM16 (first cycle)
	pure function CnvFloatToUNORM16_Cycle0(aSignedExp : signed(7 downto 0) ) return signed;

	-- Converts a float32 input to UNORM16 (second cycle)
	pure function CnvFloatToUNORM16_Cycle2(tempBuffer : unsigned(31 downto 0) ) return unsigned;

	-- Converts a float32 input to UNORM8
	pure function CnvFloatToUNORM8_GetEarlyOutType(a : f32; aIsNaN : std_logic; aIsNegative : std_logic ) return eCnvEarlyOutType;

	-- Converts a float32 input to UNORM8
	pure function CnvFloatToUNORM8_Cycle0(aSignedExp : signed(7 downto 0) ) return signed;

	-- Converts a float32 input to UNORM8
	pure function CnvFloatToUNORM8_Cycle2(tempBuffer : unsigned(31 downto 0) ) return unsigned;

	pure function CnvFloatToHalf_GetEarlyOutType(a : f32; aIsNan : std_logic) return eCnvEarlyOutType;

	-- Converts a float32 input to a half (float16) output
	pure function CnvFloatToHalf_Cycle2(inputNormalFloat : f32) return unsigned;

	pure function CnvHalfToFloat_GetEarlyOutType(a : unsigned(14 downto 0) ) return eCnvEarlyOutType;

	-- Converts a half (float16) input to a float32 output
	pure function CnvHalfToFloat_Cycle2(a : unsigned(14 downto 0) ) return unsigned;

	-- Finds the first set bit (starting at the MSB) of the uint32 (or returns 0 if no bits are set).
	pure function CnvU32ToFloat_GetFirstHighBitSet(a : f32) return unsigned;

	pure function CnvU32ToFloat_GetEarlyOutType(a : f32) return eCnvEarlyOutType;

	pure function CnvU32ToFloat_Cycle2(exponent : unsigned(4 downto 0); shiftedMantissa : unsigned(31 downto 0) ) return unsigned;
	
end package FloatALU_CNV;

package body FloatALU_CNV is

	-- Converts a float32 input to unsigned uint24 using round to nearest even mode
	pure function CnvFloatToUInt24_RoundNE_GetEarlyOutType(a : f32; aIsNaN : std_logic; aIsNegative : std_logic) return eCnvEarlyOutType is
		constant maxPositiveVal : unsigned(30 downto 0) := "1001011011111111111111111111111"; -- This is 16777215.0f
	begin
		if (aIsNaN = '1') then
			return CnvNaNEarlyOut;
		elsif (aIsNegative = '1' or GetFloatIsDenorm(a) = '1') then
			return CnvBelowMinEarlyOut; -- This is 0.0f
		elsif (a(30 downto 0) >= maxPositiveVal) then
			return CnvAboveMaxEarlyOut; -- This is 16777215
		else
			return CnvNoEarlyOut;
		end if;
	end function;

	-- Converts a float32 input to unsigned uint24 using round to nearest even mode
	pure function CnvFloatToUInt24_RoundNE_Cycle0(aSignedExp : signed(7 downto 0) ) return signed is
	begin
		return 22 - aSignedExp;
	end function;

	-- Converts a float32 input to unsigned uint24 using round to nearest even mode
	pure function CnvFloatToUInt24_RoundNE_Cycle2(tempBuffer : signed(31 downto 0) ) return unsigned is
		variable newTempBuffer : signed(31 downto 0);
	begin
		newTempBuffer := tempBuffer + 1;
		newTempBuffer := newTempBuffer srl 1;
		return unsigned(newTempBuffer);
	end function;

	-- Converts a float32 input to signed int16 using round to nearest even mode
	pure function CnvFloatToInt16_RoundNE_GetEarlyOutType(a : f32; aIsNaN : std_logic; aIsNegative : std_logic ) return eCnvEarlyOutType is
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

	pure function CnvFrc_GetEarlyOutType(a : f32) return eCnvEarlyOutType is
	begin
		if (GetRawExponent(a) = X"FF") then -- +INF, -INF, +NAN, and -NAN all get treated the same for the frc() instruction
			return CnvNaNEarlyOut;
		else
			return CnvNoEarlyOut;
		end if;
	end function;

	pure function CnvFrc_Cycle0(a : f32) return unsigned is
		variable tempMantissa : unsigned(23 downto 0);
	begin
		if (GetRawExponent(a) >= 127) then -- Positive exponent, shift to the left
			tempMantissa(23) := '0'; -- We don't care about the implicit one bit in the case of a left-shift since we're overwriting it
			tempMantissa(22 downto 0) := GetMantissa(a) sll to_integer(GetRawExponent(a) - 127);
		else -- Negative exponent, shift to the right
			tempMantissa(23) := '1'; -- We don't care about the implicit one bit in the case of a left-shift since we're overwriting it
			tempMantissa(22 downto 0) := GetMantissa(a);
			tempMantissa := tempMantissa srl to_integer(127 - GetRawExponent(a) );
		end if;
		return tempMantissa(22 downto 0);
	end function;

	pure function CnvFrc_Cycle1(normalizedMantissa : unsigned(22 downto 0) ) return unsigned is
	begin
		return BitScan23(normalizedMantissa);
	end function;

	pure function CnvFrc_Cycle2(cnvU32ShiftAmount1 : unsigned(4 downto 0); normalizedMantissa : unsigned(22 downto 0) ) return unsigned is
	begin
		return
		(to_unsigned(127, 8) - cnvU32ShiftAmount1) & -- Exponent with bias
		(normalizedMantissa sll to_integer(cnvU32ShiftAmount1) ); -- Mantissa
	end function;

	-- Converts a float32 input to UNORM16
	pure function CnvFloatToUNORM16_GetEarlyOutType(a : f32; aIsNaN : std_logic; aIsNegative : std_logic ) return eCnvEarlyOutType is
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
	pure function CnvFloatToUNORM8_GetEarlyOutType(a : f32; aIsNaN : std_logic; aIsNegative : std_logic ) return eCnvEarlyOutType is
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

	pure function CnvFloatToHalf_GetEarlyOutType(a : f32; aIsNan : std_logic) return eCnvEarlyOutType is
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
	pure function CnvFloatToHalf_Cycle2(inputNormalFloat : f32) return unsigned is
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

	-- Finds the first set bit (starting at the MSB) of the uint32 (or returns 0 if no bits are set).
	pure function CnvU32ToFloat_GetFirstHighBitSet(a : f32) return unsigned is
	begin
		if (a(31) = '1') then
			return to_unsigned(31, 5);
		elsif (a(30) = '1') then
			return to_unsigned(30, 5);
		elsif (a(29) = '1') then
			return to_unsigned(29, 5);
		elsif (a(28) = '1') then
			return to_unsigned(28, 5);
		elsif (a(27) = '1') then
			return to_unsigned(27, 5);
		elsif (a(26) = '1') then
			return to_unsigned(26, 5);
		elsif (a(25) = '1') then
			return to_unsigned(25, 5);
		elsif (a(24) = '1') then
			return to_unsigned(24, 5);
		elsif (a(23) = '1') then
			return to_unsigned(23, 5);
		elsif (a(22) = '1') then
			return to_unsigned(22, 5);
		elsif (a(21) = '1') then
			return to_unsigned(21, 5);
		elsif (a(20) = '1') then
			return to_unsigned(20, 5);
		elsif (a(19) = '1') then
			return to_unsigned(19, 5);
		elsif (a(18) = '1') then
			return to_unsigned(18, 5);
		elsif (a(17) = '1') then
			return to_unsigned(17, 5);
		elsif (a(16) = '1') then
			return to_unsigned(16, 5);
		elsif (a(15) = '1') then
			return to_unsigned(15, 5);
		elsif (a(14) = '1') then
			return to_unsigned(14, 5);
		elsif (a(13) = '1') then
			return to_unsigned(13, 5);
		elsif (a(12) = '1') then
			return to_unsigned(12, 5);
		elsif (a(11) = '1') then
			return to_unsigned(11, 5);
		elsif (a(10) = '1') then
			return to_unsigned(10, 5);
		elsif (a(9) = '1') then
			return to_unsigned(9, 5);
		elsif (a(8) = '1') then
			return to_unsigned(8, 5);
		elsif (a(7) = '1') then
			return to_unsigned(7, 5);
		elsif (a(6) = '1') then
			return to_unsigned(6, 5);
		elsif (a(5) = '1') then
			return to_unsigned(5, 5);
		elsif (a(4) = '1') then
			return to_unsigned(4, 5);
		elsif (a(3) = '1') then
			return to_unsigned(3, 5);
		elsif (a(2) = '1') then
			return to_unsigned(2, 5);
		elsif (a(1) = '1') then
			return to_unsigned(1, 5);
		else
			return to_unsigned(0, 5);
		end if;
	end function;

	pure function CnvU32ToFloat_GetEarlyOutType(a : f32) return eCnvEarlyOutType is
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

end package body FloatALU_CNV;
