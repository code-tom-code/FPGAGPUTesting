
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;

package FloatALU_Types is

	-- These constants determine the number of cycles that each of the various pipes runs for:
	constant SHFT_CYCLES : natural := 1;
	constant MUL_CYCLES : natural := 5;
	constant ADD_CYCLES : natural := 4;
	constant CMP_CYCLES : natural := 1;
	constant CNV_CYCLES : natural := 3;
	constant SPEC_CYCLES : natural := 14;
	constant BIT_CYCLES : natural := 1;

	type eCmpType is
	(
		-- Min and Max are typical float min(a, b) and float max(a, b) functions
		CmpMin, -- 0
		CmpMax, -- 1

		-- SLT(a, b) computes a < b; SGE(a, b) computes a >= b (the exact opposite of SLT)
		CmpSlt, -- 2
		CmpSge, -- 3

		-- SGN(a) computes component-wise the sign of a (-1 for negative, 0 for zero, or 1 for positive)
		CmpSgn, -- 4

		-- MOV bitwise moves A to OUT (no conversions)
		CmpMov -- 5

		-- Removed 3-component input compares
		-- CMP(a, b, c) computes component-wise (a >= 0 ? b : c). CND(a, b, c) computes component-wise (a > 0.5 ? b : c).
		--CmpCmp, -- 6
		--CmpCnd -- 7
	);

	type eShftMode is
	(
		ShftX2, -- 0
		ShftX4, -- 1
		ShftX8, -- 2
		ShftX16, -- 3
		ShftD2, -- 4
		ShftD4, -- 5
		ShftD8, -- 6
		ShftD16 -- 7
	);

	type eBitMode is
	(
		BShftL8, -- 0
		BShftL16, -- 1
		BShftL24, -- 2
		BOr, -- 3
		BShftR8, -- 4
		BShftR16, -- 5
		BShftR24, -- 6
		BAnd -- 7
	);

	type eConvertMode is
	(
		F_Frc, -- 0
		F_to_I23_RoundNearestEven, -- 1
		F_to_I16_RoundNearestEven, -- 2
		F_to_UNORM16, -- 3
		F_to_UNORM8, -- 4
		F_to_Half, -- 5
		Half_to_F, -- 6
		U32_to_F -- 7
	);
	
end package FloatALU_Types;
