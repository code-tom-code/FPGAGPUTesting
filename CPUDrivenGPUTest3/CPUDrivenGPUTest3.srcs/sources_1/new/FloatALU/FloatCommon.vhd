
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;

use work.FloatALU_Types.all;

package FloatCommon is

	-- Globally useful float constants:
	constant zeroF : f32 := X"00000000"; -- Constant for 0.0f
	constant oneF : f32 := X"3F800000"; -- Constant for 1.0f
	constant halfF : f32 := X"3F000000"; -- Constant for 0.5f
	constant negOneF : f32 := X"BF800000"; -- Constant for -1.0f

	constant maxRepresentableHalfF : f32 := X"477FE000"; -- Constant for 65504.0f which is the largest float that can be represented as a half
	constant minReprensetableHalfF : f32 := X"33800000"; -- Constant for 5.9604644775390625e-8f which is the smallest float that can be represented as a half (besides zero)

	-- Common helper functions follow:

	-- Assumes value is nonzero. Returns the MSB index of the first 1-bit found in the given mantissa, or returns "23" if no 1-bits are found.
	pure function bitScan(value : signed(25 downto 0) ) return natural;

	-- Returns '1' if the value is negative, or '0' if the value is positive.
	pure function GetFloatIsNegative(value : f32) return std_logic;

	-- Returns the raw 8-bit exponent of the float (without accounting for the -127 bias).
	pure function GetRawExponent(value : f32) return unsigned;

	-- Returns the signed 8-bit exponent [-127 to +127] after the bias is applied.
	pure function GetSignedExponent(value : f32) return signed;

	-- Returns the biased exponent bits from a signed exponent value
	pure function MakeExponentFromSigned(signedExp : signed(7 downto 0) ) return std_logic_vector;

	-- Returns '1' if the value is a real number, or '0' if the value is INF or NAN. For the purposes of this function, denormal values are considered real values.
	pure function GetFloatIsReal(value : f32) return std_logic;

	-- Returns the 23-bit mantissa value for the float.
	pure function GetMantissa(value : f32) return unsigned;

	-- Returns '1' if the float is +INF or -INF, or returns '0' otherwise.
	pure function GetFloatIsINF(value : f32) return std_logic;

	-- Returns '1' if the float is a NaN value, or returns '0' otherwise.
	pure function GetFloatIsNAN(value : f32) return std_logic;

	-- Returns '1' if the float is a denormal value (including +/- 0.0f), or returns '0' for a non-denormal float.
	pure function GetFloatIsDenorm(value : f32) return std_logic;

	-- Returns either the original float value, or the flushed-to-zero value if the original was a denormal number.
	pure function FlushDenormsToZero(value : f32) return f32;

	-- Returns 23 minus the index of the highest bit set. Assumes that the input value is non-zero (at least one bit is set to locate).
	pure function BitScan23(mantissa : unsigned(22 downto 0) ) return unsigned;
	
end package FloatCommon;

package body FloatCommon is

	-- Assumes value is nonzero. Returns the MSB index of the first 1-bit found in the given mantissa, or returns "23" if no 1-bits are found.
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
	pure function GetFloatIsNegative(value : f32) return std_logic is
	begin
		return value(31);
	end function;

	-- Returns the raw 8-bit exponent of the float (without accounting for the -127 bias).
	pure function GetRawExponent(value : f32) return unsigned is
	begin
		return value(30 downto 23);
	end function;

	-- Returns the signed 8-bit exponent [-127 to +127] after the bias is applied.
	pure function GetSignedExponent(value : f32) return signed is
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
	pure function GetFloatIsReal(value : f32) return std_logic is
	begin
		if (GetRawExponent(value) = X"FF") then
			return '0';
		else
			return '1';
		end if;
	end function;

	-- Returns the 23-bit mantissa value for the float.
	pure function GetMantissa(value : f32) return unsigned is
	begin
		return value(22 downto 0);
	end function;

	-- Returns '1' if the float is +INF or -INF, or returns '0' otherwise.
	pure function GetFloatIsINF(value : f32) return std_logic is
	begin
		if (GetRawExponent(value) = X"FF" and GetMantissa(value) = "00000000000000000000000") then
			return '1';
		else
			return '0';
		end if;
	end function;

	-- Returns '1' if the float is a NaN value, or returns '0' otherwise.
	pure function GetFloatIsNAN(value : f32) return std_logic is
	begin
		if (GetRawExponent(value) = X"FF" and GetMantissa(value) /= "00000000000000000000000") then
			return '1';
		else
			return '0';
		end if;
	end function;

	-- Returns '1' if the float is a denormal value (including +/- 0.0f), or returns '0' for a non-denormal float.
	pure function GetFloatIsDenorm(value : f32) return std_logic is
	begin
		if (GetRawExponent(value) = X"00") then
			return '1';
		else
			return '0';
		end if;
	end function;

	-- Returns either the original float value, or the flushed-to-zero value if the original was a denormal number.
	pure function FlushDenormsToZero(value : f32) return f32 is
	begin
		if (GetFloatIsDenorm(value) = '1') then
			return value(31) & "0000000000000000000000000000000"; -- D3D spec says that denorms get flushed to sign-preserved zero, so here we are preserving the sign bit
		else
			return value;
		end if;
	end function;

	-- Returns 23 minus the index of the highest bit set. Assumes that the input value is non-zero (at least one bit is set to locate).
	pure function BitScan23(mantissa : unsigned(22 downto 0) ) return unsigned is
	begin
		assert mantissa > 0; -- This function assumes that at least one bit is set. An input of zero would return the incorrect value 1!

		if (mantissa(22) = '1') then
			return to_unsigned(1, 5);
		elsif (mantissa(21) = '1') then
			return to_unsigned(2, 5);
		elsif (mantissa(20) = '1') then
			return to_unsigned(3, 5);
		elsif (mantissa(19) = '1') then
			return to_unsigned(4, 5);
		elsif (mantissa(18) = '1') then
			return to_unsigned(5, 5);
		elsif (mantissa(17) = '1') then
			return to_unsigned(6, 5);
		elsif (mantissa(16) = '1') then
			return to_unsigned(7, 5);
		elsif (mantissa(15) = '1') then
			return to_unsigned(8, 5);
		elsif (mantissa(14) = '1') then
			return to_unsigned(9, 5);
		elsif (mantissa(13) = '1') then
			return to_unsigned(10, 5);
		elsif (mantissa(12) = '1') then
			return to_unsigned(11, 5);
		elsif (mantissa(11) = '1') then
			return to_unsigned(12, 5);
		elsif (mantissa(10) = '1') then
			return to_unsigned(13, 5);
		elsif (mantissa(9) = '1') then
			return to_unsigned(14, 5);
		elsif (mantissa(8) = '1') then
			return to_unsigned(15, 5);
		elsif (mantissa(7) = '1') then
			return to_unsigned(16, 5);
		elsif (mantissa(6) = '1') then
			return to_unsigned(17, 5);
		elsif (mantissa(5) = '1') then
			return to_unsigned(18, 5);
		elsif (mantissa(4) = '1') then
			return to_unsigned(19, 5);
		elsif (mantissa(3) = '1') then
			return to_unsigned(20, 5);
		elsif (mantissa(2) = '1') then
			return to_unsigned(21, 5);
		elsif (mantissa(1) = '1') then
			return to_unsigned(22, 5);
		else -- if (mantissa(0) = '1') then
			return to_unsigned(23, 5);
		end if;
	end function;

end package body FloatCommon;
