library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity TestCompare is
	Port ( clk : in STD_LOGIC;

		CMP_Result : out STD_LOGIC := '0';
		CMP_CmpFunc : in STD_LOGIC_VECTOR(2 downto 0);
		CMP_A : in STD_LOGIC_VECTOR(7 downto 0);
		CMP_B : in STD_LOGIC_VECTOR(7 downto 0);
		CMP_LT : in STD_LOGIC;
		CMP_GT : in STD_LOGIC;
		CMP_EQ : in STD_LOGIC
		);
end TestCompare;

architecture Behavioral of TestCompare is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333000000";

type eCmpFunc is
(
	cmp_never, -- 0
	cmp_less, -- 1
	cmp_equal, -- 2
	cmp_lessequal, -- 3
	cmp_greater, -- 4
	cmp_notequal, -- 5
	cmp_greaterequal, -- 6
	cmp_always -- 7
);

-- 14 CLB LUT's, 1 CLB Register, 2 CARRY8, 3 CLB blocks, 14 LUT as Logic, 1 LUT Flip Flop Pairs
pure function AlphaTest(fragmentAlpha : unsigned(7 downto 0); alphaTestRefVal : unsigned(7 downto 0); alphaTestFunc : eCmpFunc) return std_logic is
begin
	case alphaTestFunc is
		when cmp_never =>
			return '0';

		when cmp_less =>
			if (fragmentAlpha < alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_equal =>
			if (fragmentAlpha = alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_lessequal =>
			if (fragmentAlpha <= alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_greater =>
			if (fragmentAlpha > alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_notequal =>
			if (fragmentAlpha /= alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_greaterequal =>
			if (fragmentAlpha >= alphaTestRefVal) then
				return '1';
			else
				return '0';
			end if;

		when cmp_always =>
			return '1';

	end case;
end function;

-- 14 CLB LUT's, 1 CLB Register, 2 CARRY8, 3 CLB blocks, 14 LUT as Logic, 1 LUT Flip Flop Pairs
pure function DepthTest(depthFunc : eCmpFunc; testPixelValue : unsigned(7 downto 0); depthBufferCurrentValue : unsigned(7 downto 0) ) return boolean is
begin
	case depthFunc is
		when cmp_less =>
			return testPixelValue < depthBufferCurrentValue;
		when cmp_equal =>
			return testPixelValue = depthBufferCurrentValue;
		when cmp_lessequal =>
			return testPixelValue <= depthBufferCurrentValue;
		when cmp_greater =>
			return testPixelValue > depthBufferCurrentValue;
		when cmp_notequal =>
			return testPixelValue /= depthBufferCurrentValue;
		when cmp_greaterequal =>
			return testPixelValue >= depthBufferCurrentValue;
		when cmp_always =>
			return true;
		when others => -- when cmp_never =>
			return false;
	end case;
end function;

-- 8 CLB LUT's, 1 CLB Register, 1 CARRY8, 2 CLB blocks, 8 LUT as Logic, 1 LUT Flip Flop Pairs
pure function CondensedTest(depthFunc : eCmpFunc; testPixelValue : unsigned(7 downto 0); depthBufferCurrentValue : unsigned(7 downto 0) ) return boolean is
	variable lessTest : boolean;
	variable equalTest : boolean;
begin
	lessTest := testPixelValue < depthBufferCurrentValue;
	equalTest := testPixelValue = depthBufferCurrentValue;

	case depthFunc is
		when cmp_less =>
			return lessTest;
		when cmp_equal =>
			return equalTest;
		when cmp_lessequal =>
			return lessTest or equalTest;
		when cmp_greater =>
			return not (lessTest or equalTest);
		when cmp_notequal =>
			return not equalTest;
		when cmp_greaterequal =>
			return not lessTest;
		when cmp_always =>
			return true;
		when others => -- when cmp_never =>
			return false;
	end case;
end function;

pure function PosiTest(depthFunc : eCmpFunc; testPixelValue : unsigned(7 downto 0); depthBufferCurrentValue : unsigned(7 downto 0) ) return boolean is
	variable posiCmp : boolean;
begin
	case depthFunc is
		when cmp_less | cmp_greaterequal =>
			posiCmp := testPixelValue < depthBufferCurrentValue;
		when cmp_equal | cmp_notequal =>
			posiCmp := testPixelValue = depthBufferCurrentValue;
		when cmp_always | cmp_never =>
			posiCmp := true;
		when others => --cmp_greater | cmp_lessequal =>
			posiCmp := testPixelValue > depthBufferCurrentValue;			
	end case;

	case depthFunc is
		when cmp_greaterequal | cmp_notequal | cmp_never | cmp_lessequal =>
			return not posiCmp;
		when others => -- when cmp_less | cmp_equal | cmp_always | cmp_greater =>
			return posiCmp;
	end case;
end function;

-- 8 CLB LUT's, 1 CLB register, 1 CARRY8, 2 CLB's, 8 LUT as Logic, 1 LUT Flip Flop Pair
pure function VoodoooTest(depthFunc : eCmpFunc; testPixelValue : unsigned(7 downto 0); depthBufferCurrentValue : unsigned(7 downto 0); func_lt : boolean; func_gt : boolean; func_eq : boolean) return boolean is
	variable lessTest : boolean;
	variable equalTest : boolean;
begin
	--func_lt := (depthFunc = cmp_less) or (depthFunc = cmp_lessequal);
	--func_gt := (depthFunc = cmp_greater) or (depthFunc = cmp_greaterequal);
	--func_eq := (depthFunc = cmp_equal) or (depthFunc = cmp_lessequal) or (depthFunc = cmp_greaterequal);
	lessTest := testPixelValue < depthBufferCurrentValue;
	equalTest := testPixelValue = depthBufferCurrentValue;

	return (func_lt and lessTest) or (func_eq and equalTest) or ( (lessTest xor equalTest) and func_gt);
end function;

begin

	process(clk)
	begin
		if (rising_edge(clk) ) then
			--CMP_Result <= AlphaTest(unsigned(CMP_A), unsigned(CMP_B), eCmpFunc'val(to_integer(unsigned(CMP_CmpFunc) ) ) );
			if (VoodoooTest(eCmpFunc'val(to_integer(unsigned(CMP_CmpFunc) ) ), unsigned(CMP_A), unsigned(CMP_B), CMP_LT = '1', CMP_GT = '1', CMP_EQ = '1') ) then
				CMP_Result <= '1';
			else
				CMP_Result <= '0';
			end if;
		end if;
	end process;

end Behavioral;
