
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity Reciprocal is
	generic(Num_Newton_Raphson_Iterations : integer range 2 to 7 := 7
	);
    Port (clk : in STD_LOGIC;
		inU24 : in STD_LOGIC_VECTOR(23 downto 0);
		inNewValueIsValid : in STD_LOGIC;
		outReadyForNewValue : out STD_LOGIC := '0';

		outInv24 : out STD_LOGIC_VECTOR(23 downto 0);
		inReadyForOutValue : in STD_LOGIC;
		outNewOutValueIsValid : out STD_LOGIC := '0');
end Reciprocal;

architecture Behavioral of Reciprocal is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

type reciprocalUnitState is
(
	recipInitState,

	recipWaitForNewInputState,

	-- Loop setup states:
	recipFindFixedNormalizeFactor,
	recipNormalizeFixed,
	recipX0Product,
	recipX0ProductShift,
	recipX0Difference,

	-- Inner loop states:
	recipNewtonIter0_x1innerProduct,
	recipNewtonIter0_x1innerProductShift,
	recipNewtonIter0_x1difference,
	recipNewtonIter0_x1product,
	recipNewtonIter0_x1productShift,

	-- Post-loop state:
	recipFindRenormalizedInverse,

	recipWriteOutputState
);

-- Assumes value is nonzero
pure function bitScan(value : unsigned(23 downto 0) ) return integer is
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
		return 23;
	elsif (value(22) = '1') then
		return 22;
	elsif (value(21) = '1') then
		return 21;
	elsif (value(20) = '1') then
		return 20;
	elsif (value(19) = '1') then
		return 19;
	elsif (value(18) = '1') then
		return 18;
	elsif (value(17) = '1') then
		return 17;
	elsif (value(16) = '1') then
		return 16;
	elsif (value(15) = '1') then
		return 15;
	elsif (value(14) = '1') then
		return 14;
	elsif (value(13) = '1') then
		return 13;
	elsif (value(12) = '1') then
		return 12;
	elsif (value(11) = '1') then
		return 11;
	elsif (value(10) = '1') then
		return 10;
	elsif (value(9) = '1') then
		return 9;
	elsif (value(8) = '1') then
		return 8;
	elsif (value(7) = '1') then
		return 7;
	elsif (value(6) = '1') then
		return 6;
	elsif (value(5) = '1') then
		return 5;
	elsif (value(4) = '1') then
		return 4;
	elsif (value(3) = '1') then
		return 3;
	elsif (value(2) = '1') then
		return 2;
	elsif (value(1) = '1') then
		return 1;
	else
		return 0;
	end if;
end function;

constant initialGuessScale : unsigned(24+1-1 downto 0) := to_unsigned(16#1E1E1E1#, 24+1); -- +1.8823529411764705882352941176471dec = +1.e1e1e1hex = 31,580,641dec
constant initialGuessBias : unsigned(24+2-1 downto 0) := to_unsigned(16#2D2D2D2#, 24+2); -- +2.8235294117647058823529411764706dec = +2.d2d2d2hex = 47,370,962dec
constant iterationSubtractTwo : unsigned(24+2-1 downto 0) := to_unsigned(16#2000000#, 24+2); -- +2.0 = +2.000000 hex = 33,554,432dec

signal currentState : reciprocalUnitState := recipInitState;
signal newtonIterCount : unsigned(2 downto 0) := (others => '0');
signal readyForNewValue : STD_LOGIC := '0';
signal newOutValueIsValid : STD_LOGIC := '0';
signal latchedInputVal : unsigned(23 downto 0) := (others => '0');
signal inverseNormalizeFactor : integer range 0 to 31 := 0;
signal unshifted_x0product : unsigned(24+24 downto 0) := (others => '0');
signal x0product : unsigned(24 downto 0) := (others => '0'); -- Q1.24, value between (16/17, 32/17) or (0.941176, 1.882353)
signal x0result : unsigned(25 downto 0) := (others => '0'); -- Q2.24
signal unshifted_x1innerProduct : unsigned(24+25 downto 0) := (others => '0');
signal x1innerProduct : unsigned(25 downto 0) := (others => '0'); -- Q1.24
signal x1difference : unsigned(25 downto 0) := (others => '0'); -- Q1.24
signal unshifted_x1 : unsigned(25+25+1 downto 0) := (others => '0');
signal x1 : unsigned(25 downto 0) := (others => '0'); -- Q2.24
signal finalReciprocal : unsigned(23 downto 0) := (others => '0'); -- This is in Q0.24 format

-- This is technically a value in Q24.24 fixed-point format, but because we know that latchedInputVal is an unsigned int between 1 and 2^23-1, we know that
-- the normalized inverse will always be between (0.5, 1.0) and so we can just ignore all of the integer part of the fixed-point value since it'll always be 0.
signal inverse_normalizedInputVal : unsigned(23 downto 0) := (others => '0');

begin

outReadyForNewValue <= readyForNewValue;
outNewOutValueIsValid <= newOutValueIsValid;

process(clk)
	variable bitshiftTemporary : unsigned(24+24-1 downto 0) := (others => '0');
	variable productShiftTemporary : unsigned(24+24 downto 0) := (others => '0');
	variable productShiftTemporaryLoop : unsigned(24+25 downto 0) := (others => '0');
	variable subtractTemporary : unsigned(24+1 downto 0) := (others => '0');
	variable bigProductTemporary : unsigned(25+25+1 downto 0) := (others => '0');
	variable bitshift2Temporary : unsigned(25 downto 0) := (others => '0');
begin
	if (rising_edge(clk) ) then
		case currentState is
			when recipInitState =>
				readyForNewValue <= '0';
				newOutValueIsValid <= '0';
				currentState <= recipWaitForNewInputState;

			when recipWaitForNewInputState =>
				if (readyForNewValue = '1' and inNewValueIsValid = '1') then
					readyForNewValue <= '0';
					latchedInputVal <= unsigned(inU24);

					if (unsigned(inU24) <= 1) then -- Special case early out for 0 or 1
						finalReciprocal <= (others => '1'); -- Output is all 0xFF's
						currentState <= recipWriteOutputState;
					else
						currentState <= recipFindFixedNormalizeFactor;
					end if;
				else
					readyForNewValue <= '1';
				end if;

			-- These are the pre-loop states:
			when recipFindFixedNormalizeFactor =>
				inverseNormalizeFactor <= bitScan(latchedInputVal) + 1;
				currentState <= recipNormalizeFixed;

			when recipNormalizeFixed =>
				bitshiftTemporary := (latchedInputVal & x"000000") srl inverseNormalizeFactor; -- Shift the input down based on its topmost bit to get to a value between 0.5 and 1.0
				inverse_normalizedInputVal <= bitshiftTemporary(23 downto 0);
				currentState <= recipX0Product;

			when recipX0Product =>
				unshifted_x0product <= inverse_normalizedInputVal * initialGuessScale;
				currentState <= recipX0ProductShift;

			when recipX0ProductShift =>
				productShiftTemporary := unshifted_x0product srl 24;
				x0product <= productShiftTemporary(24 downto 0);
				currentState <= recipX0Difference;

			when recipX0Difference =>
				subtractTemporary := initialGuessBias - x0product;
				x0result <= subtractTemporary(25 downto 0);
				newtonIterCount <= (others => '0');
				currentState <= recipNewtonIter0_x1innerProduct;

			-- These are the inner loop states:
			when recipNewtonIter0_x1innerProduct =>
				unshifted_x1innerProduct <= inverse_normalizedInputVal * x0result;
				currentState <= recipNewtonIter0_x1innerProductShift;

			when recipNewtonIter0_x1innerProductShift =>
				productShiftTemporaryLoop := unshifted_x1innerProduct srl 24;
				x1innerProduct <= productShiftTemporaryLoop(25 downto 0);
				currentState <= recipNewtonIter0_x1difference;

			when recipNewtonIter0_x1difference =>
				subtractTemporary := iterationSubtractTwo - x1innerProduct;
				x1difference <= subtractTemporary(25 downto 0);
				currentState <= recipNewtonIter0_x1product;

			when recipNewtonIter0_x1product =>
				unshifted_x1 <= x0result * x1difference;
				currentState <= recipNewtonIter0_x1productShift;

			when recipNewtonIter0_x1productShift =>
				bigProductTemporary := unshifted_x1 srl 24;
				x1 <= bigProductTemporary(25 downto 0);
				if ( (newtonIterCount < (Num_Newton_Raphson_Iterations - 1) ) and -- Exit if we run out of iterations
					bigProductTemporary(25 downto 0) /= x0result) then -- Early out if our iterations converge early
					newtonIterCount <= newtonIterCount + 1;
					x0result <= bigProductTemporary(25 downto 0);
					currentState <= recipNewtonIter0_x1innerProduct;
				else
					currentState <= recipFindRenormalizedInverse; -- Break out of the loop, we're done!
				end if;

			-- This is the post-loop state:
			when recipFindRenormalizedInverse =>
				bitshift2Temporary := x1 srl inverseNormalizeFactor;
				finalReciprocal <= bitshift2Temporary(24-1 downto 0);
				currentState <= recipWriteOutputState;

			when recipWriteOutputState =>
				if (inReadyForOutValue = '1' and newOutValueIsValid = '1') then
					newOutValueIsValid <= '0';
					currentState <= recipWaitForNewInputState;
				else
					newOutValueIsValid <= '1';
					outInv24 <= std_logic_vector(finalReciprocal);
				end if;
		end case;
	end if;
end process;

end Behavioral;
