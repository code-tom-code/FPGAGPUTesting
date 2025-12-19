
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;

package FloatALU_Types is

	-- Define our float types. Note that we can't use either "float" or "float32" because they are already types with other definitions in a VHDL2008 library:

	-- Full 32-bit float type:
	subtype f32 is unsigned(31 downto 0);

	-- 16-bit half type:
	subtype f16 is unsigned(15 downto 0);

	-- These constants determine the number of cycles that each of the various pipes runs for:
	constant SHFT_CYCLES : natural := 1;
	constant MUL_CYCLES : natural := 5;
	constant ADD_CYCLES : natural := 4;
	constant CMP_CYCLES : natural := 1;
	constant CNV_CYCLES : natural := 3;
	constant SPEC_CYCLES : natural := 14;
	constant BIT_CYCLES : natural := 1;

	-- VHDL doesn't support the MAXIMUM() or MINIMUM() functions as built-ins until VHDL2008, so we have to define our own, sadly.
	pure function maxVal(a : integer; b : integer) return integer;

	-- Maximum number of cycles that a single operation can take
	constant maxCycleCount : integer := maxVal(BIT_CYCLES, maxVal(SHFT_CYCLES, maxVal(MUL_CYCLES, maxVal(ADD_CYCLES, maxVal(CMP_CYCLES, maxVal(CNV_CYCLES, SPEC_CYCLES) ) ) ) ) );
	constant numMUXSources : integer := 7; -- Number of different pipes that our MUX can source from

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

	type eSpecMode is
	(
		RcpMode, -- 0
		RsqMode, -- 1
		UnimplementedMode2, -- 2
		UnimplementedMode3, -- 3
		UnimplementedMode4, -- 4
		UnimplementedMode5, -- 5
		UnimplementedMode6, -- 6
		UnimplementedMode7 -- 7
	);

	type eConvertMode is
	(
		F_Frc, -- 0
		F_to_U24_RoundNearestEven, -- 1
		F_to_I16_RoundNearestEven, -- 2
		F_to_UNORM16, -- 3
		F_to_UNORM8, -- 4
		F_to_Half, -- 5
		Half_to_F, -- 6
		U32_to_F -- 7
	);
	
end package FloatALU_Types;

package body FloatALU_Types is

	-- VHDL doesn't support the MAXIMUM() or MINIMUM() functions as built-ins until VHDL2008, so we have to define our own, sadly.
	pure function maxVal(a : integer; b : integer) return integer is
	begin
		if (a > b) then
			return a;
		else
			return b;
		end if;
	end function;

end package body FloatALU_Types;
