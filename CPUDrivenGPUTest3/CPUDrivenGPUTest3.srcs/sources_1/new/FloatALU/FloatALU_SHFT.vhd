
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;

use work.FloatALU_Types.all;
use work.FloatCommon.all;

package FloatALU_SHFT is

	-- Returns '1' if this is a left-shift (multiply shift), or '0' if this is a right-shift (divide shift).
	pure function IsShiftUp(shftMode : eShftMode) return std_logic;

	-- Returns the distance (number of bits) of the shift, from 1 to 4 as an 8-bit unsigned.
	pure function GetShiftAmount(shftMode : eShftMode) return unsigned;

	-- Converts from a 3-bit unsigned to the shift mode enum.
	pure function CastShiftModeBitsToEnum(shftMode : unsigned(2 downto 0) ) return eShftMode;

	-- Returns '1' if this shift would shift the float value into +/- infinity or a denormal, or returns '0' if the result of the shift is still a regular float.
	pure function DoesShiftToINFOrDEN(a : f32; shftMode : eShftMode) return std_logic;

	-- Performs the core shift function for a float based on the input shift mode.
	pure function PerformCoreShift(value : f32; shiftMode : unsigned(2 downto 0) ) return f32;
	
end package FloatALU_SHFT;

package body FloatALU_SHFT is

	-- Returns '1' if this is a left-shift (multiply shift), or '0' if this is a right-shift (divide shift).
	pure function IsShiftUp(shftMode : eShftMode) return std_logic is
	begin
		case shftMode is
			when ShftX2 | ShftX4 | ShftX8 | ShftX16 =>
				return '1';
			when others =>
				return '0';
		end case;
	end function;

	-- Returns the distance (number of bits) of the shift, from 1 to 4 as an 8-bit unsigned.
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

	-- Converts from a 3-bit unsigned to the shift mode enum.
	pure function CastShiftModeBitsToEnum(shftMode : unsigned(2 downto 0) ) return eShftMode is
	begin
		return eShftMode'val(to_integer(shftMode) );
	end function;

	-- Returns '1' if this shift would shift the float value into +/- infinity or a denormal, or returns '0' if the result of the shift is still a regular float.
	pure function DoesShiftToINFOrDEN(a : f32; shftMode : eShftMode) return std_logic is
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

	-- Performs the core shift function for a float based on the input shift mode.
	pure function PerformCoreShift(value : f32; shiftMode : unsigned(2 downto 0) ) return f32 is
	begin
		if (IsShiftUp(CastShiftModeBitsToEnum(shiftMode) ) = '1') then
			return value(31) & (GetRawExponent(value) + GetShiftAmount(CastShiftModeBitsToEnum(shiftMode) ) ) & GetMantissa(value);
		else
			return value(31) & (GetRawExponent(value) - GetShiftAmount(CastShiftModeBitsToEnum(shiftMode) ) ) & GetMantissa(value);
		end if;
	end function;

end package body FloatALU_SHFT;
