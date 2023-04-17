
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

	-- Returns floating-point a < b (ignores NaN tests - assumes that NaN's are tested for separately!)
	pure function FloatLessThanFloat(a : f32; b : f32) return boolean is
	begin
		if (GetFloatIsDenorm(a) = '1' and GetFloatIsDenorm(b) = '1') then -- +/-0.0f < +/-0.0f is always false
			return false;
		end if;

		if (GetFloatIsNegative(a) = '1' and GetFloatIsNegative(b) = '0') then
			return true;
		elsif(GetFloatIsNegative(a) = '0' and GetFloatIsNegative(b) = '1') then
			return false;
		else -- Same sign case
			if (GetFloatIsNegative(a) = '0') then -- positive < positive case
				return a(30 downto 0) < b(30 downto 0);
			else -- negative < negative case
				return a(30 downto 0) > b(30 downto 0);
			end if;
		end if;
	end function;

	-- Returns floating-point a > b (ignores NaN tests - assumes that NaN's are tested for separately!)
	pure function FloatGreaterThanFloat(a : f32; b : f32) return boolean is
	begin
		if (GetFloatIsDenorm(a) = '1' and GetFloatIsDenorm(b) = '1') then -- +/-0.0f > +/-0.0f is always false
			return false;
		end if;

		if (GetFloatIsNegative(a) = '1' and GetFloatIsNegative(b) = '0') then
			return false;
		elsif(GetFloatIsNegative(a) = '0' and GetFloatIsNegative(b) = '1') then
			return true;
		else -- Same sign case
			if (GetFloatIsNegative(a) = '0') then -- positive < positive case
				return a(30 downto 0) > b(30 downto 0);
			else -- negative < negative case
				return a(30 downto 0) < b(30 downto 0);
			end if;
		end if;
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
		if (GetRawExponent(a) > 250) then
			ret(30 downto 23) := "11111111"; -- Return +/- INF
			ret(22 downto 0) := "00000000000000000000000";
		elsif (GetRawExponent(a) = 0) then
			ret(30 downto 23) := "00000000"; -- Return +/- 0.0f
			ret(22 downto 0) := "00000000000000000000000";
		else
			ret(30 downto 23) := (GetRawExponent(a) + 4);
			ret(22 downto 0) := GetMantissa(a);
		end if;
		return ret;
	end function;

	pure function FloatShiftX32(a : f32) return f32 is
		variable ret : f32;
	begin
		ret(31) := a(31);
		if (GetRawExponent(a) > 249) then
			ret(30 downto 23) := "11111111"; -- Return +/- INF
			ret(22 downto 0) := "00000000000000000000000";
		elsif (GetRawExponent(a) = 0) then
			ret(30 downto 23) := "00000000"; -- Return +/- 0.0f
			ret(22 downto 0) := "00000000000000000000000";
		else
			ret(30 downto 23) := (GetRawExponent(a) + 5);
			ret(22 downto 0) := GetMantissa(a);
		end if;
		return ret;
	end function;

	pure function ComputeClipOutCodes(vx : f32; vy : f32; vz : f32; vw : f32) return VertexAllClipCodes is
		variable ret : VertexAllClipCodes;
	begin
		ret := (others => '0');

		-- Viewport clip planes:
		if (FloatLessThanFloat(vx, FloatNegate(vw) ) ) then -- if (vx < -vw)
			ret(ClipPlaneEnum'pos(ClipPlaneLeft) ) := '1';
		end if;
		if (FloatGreaterThanFloat(vx, vw) ) then -- if (vx > vw)
			ret(ClipPlaneEnum'pos(ClipPlaneRight) ) := '1';
		end if;

		if (FloatLessThanFloat(vy, FloatNegate(vw) ) ) then -- if (vy < -vw)
			ret(ClipPlaneEnum'pos(ClipPlaneBottom) ) := '1';
		end if;
		if (FloatGreaterThanFloat(vy, vw) ) then -- if (vy > vw)
			ret(ClipPlaneEnum'pos(ClipPlaneTop) ) := '1';
		end if;

		-- ZNear/ZFar clip planes:
		if (FloatLessThanFloat(vz, X"00000000") ) then -- if (vz < 0.0f)
			ret(ClipPlaneEnum'pos(ClipPlaneZNear) ) := '1';
		end if;
		if (FloatGreaterThanFloat(vz, vw) ) then -- if (vz > vw)
			ret(ClipPlaneEnum'pos(ClipPlaneZFar) ) := '1';
		end if;

		-- W<0 clip plane:
		if (FloatLessThanFloat(vw, W_CLIP_EPSILON) ) then -- if (vw < W_CLIP_EPSILON)
			ret(ClipPlaneEnum'pos(ClipPlaneW0) ) := '1';
		end if;

		-- Guard band planes:
		if (FloatLessThanFloat(vx, FloatShiftX16(FloatNegate(vw) ) ) ) then -- if (vx < -vw * 16)
			ret(ClipPlaneEnum'pos(ClipPlaneLeftGB) ) := '1';
		end if;
		if (FloatGreaterThanFloat(vx, FloatShiftX16(vw) ) ) then -- if (vx > vw * 16)
			ret(ClipPlaneEnum'pos(ClipPlaneRightGB) ) := '1';
		end if;

		if (FloatLessThanFloat(vy, FloatShiftX32(FloatNegate(vw) ) ) ) then -- if (vy < -vw * 32)
			ret(ClipPlaneEnum'pos(ClipPlaneBottomGB) ) := '1';
		end if;
		if (FloatGreaterThanFloat(vy, FloatShiftX32(vw) ) ) then -- if (vy > vw * 32)
			ret(ClipPlaneEnum'pos(ClipPlaneTopGB) ) := '1';
		end if;

		return ret;
	end function;

end package body ClipCommon;
