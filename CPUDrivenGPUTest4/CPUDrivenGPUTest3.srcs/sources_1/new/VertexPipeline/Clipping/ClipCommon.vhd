
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;

use work.FloatALU_Types.all;
use work.FloatCommon.all;
use work.ClipTypes.all;

package ClipCommon is

	pure function FloatLessThanFloat(a : f32; b : f32) return boolean;
	pure function FloatGreaterThanFloat(a : f32; b : f32) return boolean;
	pure function FloatNegate(a : f32) return f32;
	pure function FloatShiftX16(a : f32) return f32;
	pure function FloatShiftX32(a : f32) return f32;
	pure function ComputeClipOutCodes(vx : f32; vy : f32; vz : f32; vw : f32) return VertexAllClipCodes;

	constant W_CLIP_EPSILON : f32 := X"34000000"; -- This is equal to 1.0f / (8192 * 1024)
	
end package ClipCommon;

package body ClipCommon is

	pure function PositiveFloatLessEqualsPositiveFloat(a : f32; b : f32) return boolean is
	begin
		return a(30 downto 0) <= b(30 downto 0);
	end function;

	pure function CategorizeAxis(signBits : unsigned(1 downto 0); axis : f32; w : f32) return ClipAxisCategoryEnum is
		variable comparitor : boolean;
	begin
		comparitor := PositiveFloatLessEqualsPositiveFloat('0' & axis(30 downto 0), '0' & w(30 downto 0) );
		case signBits is
			when "00" => -- Positive/Positive case
				-- if abs(x) <= abs(w) return inside else return outsidegreater;
				if (comparitor) then
					return ClipAxisInside;
				else
					return ClipAxisOutsideGreater;
				end if;
			when "01" => -- Negative axis/Positive W case
				-- if abs(x) <= abs(w) return inside else return outsideless;
				if (comparitor) then
					return ClipAxisInside;
				else
					return ClipAxisOutsideLess;
				end if;
			when "10" => -- Positive axis/Negative W case
				-- if abs(x) <= abs(w) return outsideless else return outsidegreater;
				if (comparitor) then
					return ClipAxisOutsideLess;
				else
					return ClipAxisOutsideGreater;
				end if;
			when others => -- when "11" => -- Negative axis/Negative W case
				return ClipAxisOutsideLess;
		end case;
	end function;

	pure function CategorizeZAxis(signBits : unsigned(1 downto 0); axisZ : f32; w : f32) return ClipAxisCategoryEnum is
	begin
		case signBits is
			when "00" => -- Positive/Positive case
				-- if abs(x) <= abs(w) return inside else return outsidegreater;
				if (PositiveFloatLessEqualsPositiveFloat('0' & axisZ(30 downto 0), '0' & w(30 downto 0) ) ) then
					return ClipAxisInside;
				else
					return ClipAxisOutsideGreater;
				end if;
			when "10" => -- Positive axisZ/Negative W case
				return ClipAxisOutsideGreater;
			when others => --when "01" | "11" => -- Negative axisZ case
				return ClipAxisOutsideLess;
		end case;
	end function;

	-- Returns floating-point a < b (ignores NaN tests - assumes that NaN's are tested for separately!)
	pure function FloatLessThanFloat(a : f32; b : f32) return boolean is
		variable signBits : std_logic_vector(1 downto 0);
	begin
		if (GetFloatIsDenorm(a) = '1' and GetFloatIsDenorm(b) = '1') then -- +/-0.0f < +/-0.0f is always false
			return false;
		end if;

		signBits := GetFloatIsNegative(a) & GetFloatIsNegative(b);
		case signBits is
			when "10" =>
				return true;
			when "01" =>
				return false;
			when "00" => -- positive < positive case
				return a(30 downto 0) < b(30 downto 0);
			when others => --when "11" => -- negative < negative case
				return a(30 downto 0) > b(30 downto 0);
		end case;
	end function;

	-- Returns floating-point a > b (ignores NaN tests - assumes that NaN's are tested for separately!)
	pure function FloatGreaterThanFloat(a : f32; b : f32) return boolean is
		variable signBits : std_logic_vector(1 downto 0);
	begin
		if (GetFloatIsDenorm(a) = '1' and GetFloatIsDenorm(b) = '1') then -- +/-0.0f > +/-0.0f is always false
			return false;
		end if;

		signBits := GetFloatIsNegative(a) & GetFloatIsNegative(b);
		case signBits is
			when "10" =>
				return false;
			when "01" =>
				return true;
			when "00" => -- positive > positive case
				return a(30 downto 0) > b(30 downto 0);
			when others => --when "11" => -- negative > negative case
				return a(30 downto 0) < b(30 downto 0);
		end case;
	end function;

	-- Given "a", this function will return "-a".
	pure function FloatNegate(a : f32) return f32 is
	begin
		return (a(31) xor '1') & a(30 downto 0);
	end function;

	pure function FloatShiftX16(a : f32) return f32 is
		variable ret : f32;
	begin
		ret(31) := a(31);
		case GetRawExponent(a) is
			when X"FB" | X"FC" | X"FD" | X"FE" | X"FF" =>
				ret(30 downto 23) := "11111111"; -- Return +/- INF
				ret(22 downto 0) := "00000000000000000000000";
			when X"00" =>
				ret(30 downto 23) := "00000000"; -- Return +/- 0.0f
				ret(22 downto 0) := "00000000000000000000000";
			when others =>
				ret(30 downto 23) := (GetRawExponent(a) + 4);
				ret(22 downto 0) := GetMantissa(a);
		end case;
		return ret;
	end function;

	pure function FloatShiftX32(a : f32) return f32 is
		variable ret : f32;
	begin
		ret(31) := a(31);
		case GetRawExponent(a) is
			when X"FA" | X"FB" | X"FC" | X"FD" | X"FE" | X"FF" =>
				ret(30 downto 23) := "11111111"; -- Return +/- INF
				ret(22 downto 0) := "00000000000000000000000";
			when X"00" =>
				ret(30 downto 23) := "00000000"; -- Return +/- 0.0f
				ret(22 downto 0) := "00000000000000000000000";
			when others =>
				ret(30 downto 23) := (GetRawExponent(a) + 5);
				ret(22 downto 0) := GetMantissa(a);
		end case;
		return ret;
	end function;

	pure function ComputeClipOutCodes(vx : f32; vy : f32; vz : f32; vw : f32) return VertexAllClipCodes is
		variable ret : VertexAllClipCodes;
	begin
		ret := (others => '0');

		-- Viewport clip planes:
		case CategorizeAxis(vw(31) & vx(31), vx, vw) is
			when ClipAxisOutsideLess => -- if (vx < -vw)
				ret(ClipPlaneEnum'pos(ClipPlaneLeft) ) := '1';
			when ClipAxisOutsideGreater => -- if (vx > vw)
				ret(ClipPlaneEnum'pos(ClipPlaneRight) ) := '1';
			when ClipAxisInside =>
				-- Do nothing
		end case;

		case CategorizeAxis(vw(31) & vy(31), vy, vw) is
			when ClipAxisOutsideLess => -- if (vy < -vw)
				ret(ClipPlaneEnum'pos(ClipPlaneBottom) ) := '1';
			when ClipAxisOutsideGreater => -- if (vy > vw)
				ret(ClipPlaneEnum'pos(ClipPlaneTop) ) := '1';
			when ClipAxisInside =>
				-- Do nothing
		end case;

		-- ZNear/ZFar clip planes:
		case CategorizeZAxis(vw(31) & vz(31), vz, vw) is
			when ClipAxisOutsideLess => -- if (vy < -vw)
				ret(ClipPlaneEnum'pos(ClipPlaneZNear) ) := '1';
			when ClipAxisOutsideGreater => -- if (vy > vw)
				ret(ClipPlaneEnum'pos(ClipPlaneZFar) ) := '1';
			when ClipAxisInside =>
				-- Do nothing
		end case;

		-- W<0 clip plane:
		if (vw(31) = '1' or GetRawExponent(vw) < GetRawExponent(W_CLIP_EPSILON) ) then -- if (vw < W_CLIP_EPSILON)
			ret(ClipPlaneEnum'pos(ClipPlaneW0) ) := '1';
		end if;

		-- Guard band planes:
		case CategorizeAxis(vw(31) & vx(31), vx, FloatShiftX16(vw) ) is
			when ClipAxisOutsideLess => -- if (vx < -vw * 16)
				ret(ClipPlaneEnum'pos(ClipPlaneLeftGB) ) := '1';
			when ClipAxisOutsideGreater => -- if (vx > vw * 16)
				ret(ClipPlaneEnum'pos(ClipPlaneRightGB) ) := '1';
			when ClipAxisInside =>
				-- Do nothing
		end case;

		case CategorizeAxis(vw(31) & vy(31), vy, FloatShiftX32(vw) ) is
			when ClipAxisOutsideLess => -- if (vy < -vw * 32)
				ret(ClipPlaneEnum'pos(ClipPlaneBottomGB) ) := '1';
			when ClipAxisOutsideGreater => -- if (vy > vw * 32)
				ret(ClipPlaneEnum'pos(ClipPlaneTopGB) ) := '1';
			when ClipAxisInside =>
				-- Do nothing
		end case;

		return ret;
	end function;

end package body ClipCommon;
