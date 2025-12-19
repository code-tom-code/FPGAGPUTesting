
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;

use work.FloatALU_Types.all;
use work.FloatCommon.all;

package FloatALU_CMP is

	-- Function implements min(float a, float b) to the HLSL/D3D11 spec:
	pure function CmpMinFunc(a : f32; b : f32; aIsNan : std_logic; bIsNan : std_logic; aIsNegative : std_logic; bIsNegative : std_logic; aLessThanB : std_logic) return f32;

	-- Function implements max(float a, float b) to the HLSL/D3D11 spec:
	pure function CmpMaxFunc(a : f32; b : f32; aIsNaN : std_logic; bIsNaN : std_logic; aIsNegative : std_logic; bIsNegative : std_logic; aLessThanB : std_logic) return f32;

	-- This core function is shared by the implementations for both SGE(a, b) and SLT(a, b). It returns (a < b) ? 1 : 0.
	pure function CoreSLTNonNAN(aEqualsB : std_logic; aLessThanB : std_logic; aIsNegative : std_logic; bIsNegative : std_logic; aIsDenorm : std_logic; bIsDenorm : std_logic) return std_logic;

	-- Returns the function Slt(a, b) is (a < b) ? 1.0f : 0.0f
	pure function CmpSltFunc(aEqualsB : std_logic; aLessThanB : std_logic; aIsNaN : std_logic; bIsNaN : std_logic; aDenormFlushed : f32; bDenormFlushed : f32; aIsNegative : std_logic; bIsNegative : std_logic; aIsDenorm : std_logic; bIsDenorm : std_logic) return f32;

	-- Returns the function Sge(a, b) is (a >= b) ? 1.0f : 0.0f
	pure function CmpSgeFunc(aEqualsB : std_logic; aLessThanB : std_logic; aIsNaN : std_logic; bIsNaN : std_logic; aDenormFlushed : f32; bDenormFlushed : f32; aIsNegative : std_logic; bIsNegative : std_logic; aIsDenorm : std_logic; bIsDenorm : std_logic) return f32;

	-- Returns the function Sgn(x) is (x < 0.0f) ? -1.0f : ( (x == 0.0f) ? 0.0f : 1.0f)
	pure function CmpSgnFunc(value : f32; valIsNaN : std_logic; valIsDenorm : std_logic; valIsNeg : std_logic) return f32;

	-- Returns the function Cmp(a, b, c) is (a >= 0.0f) ? b : c
	pure function CmpCmpFunc(a : f32; b : f32; c : f32) return f32;

	-- Returns the function Cnd(a, b, c) is (a > 0.5f) ? b : c
	pure function CmpCndFunc(a : f32; b : f32; c : f32) return f32;
	
end package FloatALU_CMP;

package body FloatALU_CMP is

	-- Function implements min(float a, float b) to the HLSL/D3D11 spec:
	pure function CmpMinFunc(a : f32; b : f32; aIsNan : std_logic; bIsNan : std_logic; aIsNegative : std_logic; bIsNegative : std_logic; aLessThanB : std_logic) return f32 is
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
	pure function CmpMaxFunc(a : f32; b : f32; aIsNaN : std_logic; bIsNaN : std_logic; aIsNegative : std_logic; bIsNegative : std_logic; aLessThanB : std_logic) return f32 is
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
	pure function CmpSltFunc(aEqualsB : std_logic; aLessThanB : std_logic; aIsNaN : std_logic; bIsNaN : std_logic; aDenormFlushed : f32; bDenormFlushed : f32; aIsNegative : std_logic; bIsNegative : std_logic; aIsDenorm : std_logic; bIsDenorm : std_logic) return f32 is
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
	pure function CmpSgeFunc(aEqualsB : std_logic; aLessThanB : std_logic; aIsNaN : std_logic; bIsNaN : std_logic; aDenormFlushed : f32; bDenormFlushed : f32; aIsNegative : std_logic; bIsNegative : std_logic; aIsDenorm : std_logic; bIsDenorm : std_logic) return f32 is
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
	pure function CmpSgnFunc(value : f32; valIsNaN : std_logic; valIsDenorm : std_logic; valIsNeg : std_logic) return f32 is
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
	pure function CmpCmpFunc(a : f32; b : f32; c : f32) return f32 is
		variable aIsNaN : std_logic;
		variable denormFlushedA : f32;
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
	pure function CmpCndFunc(a : f32; b : f32; c : f32) return f32 is
		variable aIsNaN : std_logic;
		variable denormFlushedA : f32;
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

end package body FloatALU_CMP;
