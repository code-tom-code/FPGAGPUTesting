
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;

use work.FloatALU_Types.all;
use work.FloatCommon.all;

package FloatALU_RSQ is

	type eRsqEarlyOutType is
	(
		RsqNoEarlyOut, -- 0
		RsqNaNEarlyOut, -- 1
		RsqZeroEarlyOut, -- 2
		RsqINFEarlyOut -- 3
	);

	-- This function calculates the result exponent for the rsq() operation:
	pure function RsqCalcNewExp(aInputExp : signed(7 downto 0); aIsExactPowerOf2 : std_logic) return signed;

	type RsqSlopesArrayType is array(0 to 31) of unsigned(19 downto 0);
	type RsqOffsetsArrayType is array(0 to 31) of unsigned(23 downto 0);

	constant RsqSlopesLUT : RsqSlopesArrayType := 
	(
		X"3d25d",
		X"37fa8",
		X"337fc",
		X"2f961",
		X"2c254",
		X"2919a",
		X"2663d",
		X"23f6f",
		X"21c8e",
		X"1fd10",
		X"1e083",
		X"1c689",
		X"1aed2",
		X"19917",
		X"18522",
		X"172c0",

		X"2b3ce",
		X"27953",
		X"246a5",
		X"21a60",
		X"1f373",
		X"1d100",
		X"1b255",
		X"196e5",
		X"17e3b",
		X"167f6",
		X"153c6",
		X"14168",
		X"130a2",
		X"12145",
		X"11329",
		X"10628"
	);

	constant RsqOffsetsLUT : RsqOffsetsArrayType := 
	(
		X"7ffffe",
		X"785b43",
		X"715bf0",
		X"6aebf5",
		X"64f92e",
		X"5f7482",
		X"5a514a",
		X"5584cd",
		X"5105eb",
		X"4ccccd",
		X"48d2ab",
		X"4511a3",
		X"418490",
		X"3e26eb",
		X"3af4ba",
		X"37ea74",

		X"3504f3",
		X"2f9d54",
		X"2aaaab",
		X"261d5f",
		X"21e89b",
		X"1e01b3",
		X"1a5fb2",
		X"16fb06",
		X"13cd3a",
		X"10d0c3",
		X"0e00d5",
		X"0b5948",
		X"08d677",
		X"067531",
		X"0432a5",
		X"020c52"
	);
	
end package FloatALU_RSQ;

package body FloatALU_RSQ is

	-- An internal helper function for calculating the rsq() exponent:
	pure function RsqCalcExpInternal(aInputExp : signed(7 downto 0) ) return signed is
	begin
		if (aInputExp >= 0) then
			return ( (-aInputExp) / 2) - 1;
		else
			if (aInputExp(0) = '0') then
				return ( (-aInputExp) / 2) - 1;
			else
				return (-aInputExp) / 2;
			end if;
		end if;
	end function;

	-- This function calculates the result exponent for the rsq() operation:
	pure function RsqCalcNewExp(aInputExp : signed(7 downto 0); aIsExactPowerOf2 : std_logic) return signed is
	begin
		if (aIsExactPowerOf2 = '0') then
			return RsqCalcExpInternal(aInputExp);
		else
			return RsqCalcExpInternal(aInputExp - 1);
		end if;
	end function;

end package body FloatALU_RSQ;
