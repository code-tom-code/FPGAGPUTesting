
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity FloatALU is
    Port (clk : in STD_LOGIC;

		-- MUL pipe operates in 5 clock cycles
		IMUL_GO : in STD_LOGIC;
		IMUL_A : in STD_LOGIC_VECTOR(31 downto 0);
		IMUL_B : in STD_LOGIC_VECTOR(31 downto 0);
		OMUL : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		-- ADD pipe operates in 3 clock cycles
		IADD_GO : in STD_LOGIC;
		IADD_A : in STD_LOGIC_VECTOR(31 downto 0);
		IADD_B : in STD_LOGIC_VECTOR(31 downto 0);
		OADD : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		-- CMP pipe operates in 1 clock cycle
		ICMP_GO : in STD_LOGIC;
		ICMP_MODE : in STD_LOGIC_VECTOR(2 downto 0); -- Corresponds to the eCmpType enum
		ICMP_A : in STD_LOGIC_VECTOR(31 downto 0);
		ICMP_B : in STD_LOGIC_VECTOR(31 downto 0);
		ICMP_C : in STD_LOGIC_VECTOR(31 downto 0); -- The C input is not always used (only used in CMP and CND at present)
		OCMP : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
		);
end FloatALU;

architecture Behavioral of FloatALU is

-- Globally useful float constants:
constant zeroF : unsigned(31 downto 0) := X"00000000"; -- Constant for 0.0f
constant oneF : unsigned(31 downto 0) := X"3F800000"; -- Constant for 1.0f
constant halfF : unsigned(31 downto 0) := X"3F000000"; -- Constant for 0.5f
constant negOneF : unsigned(31 downto 0) := X"BF800000"; -- Constant for -1.0f

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

	-- CMP(a, b, c) computes component-wise (a >= 0 ? b : c). CND(a, b, c) computes component-wise (a > 0.5 ? b : c).
	CmpCmp, -- 5
	CmpCnd -- 6
);

-- Assumes value is nonzero
pure function bitScan(value : signed(25 downto 0) ) return integer is
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
pure function GetFloatIsNegative(value : unsigned(31 downto 0) ) return std_logic is
begin
	return value(31);
end function;

-- Returns the raw 8-bit exponent of the float (without accounting for the -127 bias).
pure function GetRawExponent(value : unsigned(31 downto 0) ) return unsigned is
begin
	return value(30 downto 23);
end function;

-- Returns the signed 8-bit exponent [-127 to +127] after the bias is applied.
pure function GetSignedExponent(value : unsigned(31 downto 0) ) return signed is
	variable temp : signed(8 downto 0);
begin
	temp := signed('0' & value(30 downto 23) );
	temp := temp - to_signed(127, 9);
	return temp;
end function;

-- Returns the biased exponent bits from a signed exponent value
pure function MakeExponentFromSigned(signedExp : signed(8 downto 0) ) return std_logic_vector is
	variable temp : signed(8 downto 0);
begin
	temp := signedExp + to_signed(127, 9); -- Convert from [-127, 127] to [0, 254]
	return std_logic_vector(temp(7 downto 0) );
end function;

-- Returns '1' if the value is a real number, or '0' if the value is INF or NAN. For the purposes of this function, denormal values are considered real values.
pure function GetFloatIsReal(value : unsigned(31 downto 0) ) return std_logic is
begin
	if (GetRawExponent(value) = X"FF") then
		return '0';
	else
		return '1';
	end if;
end function;

-- Returns the 23-bit mantissa value for the float.
pure function GetMantissa(value : unsigned(31 downto 0) ) return unsigned is
begin
	return value(22 downto 0);
end function;

-- Returns '1' if the float is +INF or -INF, or returns '0' otherwise.
pure function GetFloatIsINF(value : unsigned(31 downto 0) ) return std_logic is
begin
	if (GetRawExponent(value) = X"FF" and GetMantissa(value) = "00000000000000000000000") then
		return '1';
	else
		return '0';
	end if;
end function;

-- Returns '1' if the float is a NaN value, or returns '0' otherwise.
pure function GetFloatIsNAN(value : unsigned(31 downto 0) ) return std_logic is
begin
	if (GetRawExponent(value) = X"FF" and GetMantissa(value) /= "00000000000000000000000") then
		return '1';
	else
		return '0';
	end if;
end function;

-- Returns either the original float value, or the flushed-to-zero value if the original was a denormal number.
pure function FlushDenormsToZero(value : unsigned(31 downto 0) ) return unsigned is
begin
	if (GetRawExponent(value) = X"00") then
		return value(31) & "0000000000000000000000000000000"; -- D3D spec says that denorms get flushed to sign-preserved zero, so here we are preserving the sign bit
	else
		return value;
	end if;
end function;

-- Function implements min(float a, float b) to the HLSL/D3D11 spec:
pure function CmpMinFunc(a : unsigned(31 downto 0); b : unsigned(31 downto 0) ) return unsigned is
	variable aIsNaN : std_logic;
	variable bIsNaN : std_logic;
	variable aIsNegative : std_logic;
	variable bIsNegative : std_logic;
begin
	aIsNaN := GetFloatIsNAN(a);
	bIsNaN := GetFloatIsNAN(b);

	-- If either argument is NaN, then return the other (non-NaN) argument
	if (aIsNaN = '1' and bIsNaN = '0') then
		return b;
	elsif (aIsNaN = '0' and bIsNaN = '1') then
		return a;
	elsif (aIsNaN = '1' and bIsNaN = '1') then
		return a; -- When both are NaN, we don't try to perform a comparison, we just return any NaN value
	end if;

	aIsNegative := GetFloatIsNegative(a);
	bIsNegative := GetFloatIsNegative(b);
	if (aIsNegative = '1' and bIsNegative = '0') then
		return a;
	elsif (aIsNegative = '0' and bIsNegative = '1') then
		return b;
	else -- Same sign comparison
		if (aIsNegative = '0') then -- min(positive, positive)
			if (a(30 downto 0) < b(30 downto 0) ) then
				return a;
			else
				return b;
			end if;
		else -- min(negative, negative)
			if (a(30 downto 0) < b(30 downto 0) ) then
				return b;
			else
				return a;
			end if;
		end if;
	end if;
end function;

-- Function implements max(float a, float b) to the HLSL/D3D11 spec:
pure function CmpMaxFunc(a : unsigned(31 downto 0); b : unsigned(31 downto 0) ) return unsigned is
	variable aIsNaN : std_logic;
	variable bIsNaN : std_logic;
	variable aIsNegative : std_logic;
	variable bIsNegative : std_logic;
begin
	aIsNaN := GetFloatIsNAN(a);
	bIsNaN := GetFloatIsNAN(b);

	-- If either argument is NaN, then return the other (non-NaN) argument
	if (aIsNaN = '1' and bIsNaN = '0') then
		return b;
	elsif (aIsNaN = '0' and bIsNaN = '1') then
		return a;
	elsif (aIsNaN = '1' and bIsNaN = '1') then
		return a; -- When both are NaN, we don't try to perform a comparison, we just return any NaN value
	end if;

	aIsNegative := GetFloatIsNegative(a);
	bIsNegative := GetFloatIsNegative(b);
	if (aIsNegative = '1' and bIsNegative = '0') then
		return b;
	elsif (aIsNegative = '0' and bIsNegative = '1') then
		return a;
	else -- Same sign comparison
		if (aIsNegative = '0') then -- max(positive, positive)
			if (a(30 downto 0) > b(30 downto 0) ) then
				return a;
			else
				return b;
			end if;
		else -- max(negative, negative)
			if (a(30 downto 0) > b(30 downto 0) ) then
				return b;
			else
				return a;
			end if;
		end if;

	end if;
end function;

-- This core function is shared by the implementations for both SGE(a, b) and SLT(a, b). It returns (a < b) ? 1 : 0.
pure function CoreSLTNonNAN(a : unsigned(31 downto 0); b : unsigned(31 downto 0) ) return std_logic is
	variable aIsNegative : std_logic;
	variable bIsNegative : std_logic;
	variable aDenormFlushed : unsigned(31 downto 0);
	variable bDenormFlushed : unsigned(31 downto 0);
begin
	aIsNegative := GetFloatIsNegative(a);
	bIsNegative := GetFloatIsNegative(b);
	aDenormFlushed := FlushDenormsToZero(a);
	bDenormFlushed := FlushDenormsToZero(b);
	if ( (GetRawExponent(aDenormFlushed) = X"00") and (GetRawExponent(bDenormFlushed) = X"00") ) then -- Special case handling of +/- 0.0f compared to +/- 0.0f
		return '0';
	end if;

	-- Early out and see if we can just compare the sign bits without having to look at the rest of the float:
	if (aIsNegative = '1' and bIsNegative = '0') then
		return '1';
	elsif (aIsNegative = '0' and bIsNegative = '1') then
		return '0';
	else -- Same sign comparison
		if (aIsNegative = '0') then -- min(positive, positive)
			if (aDenormFlushed(30 downto 0) < bDenormFlushed(30 downto 0) ) then
				return '1';
			else
				return '0';
			end if;
		else -- min(negative, negative)
			if (bDenormFlushed(30 downto 0) < aDenormFlushed(30 downto 0) ) then
				return '1';
			else
				return '0';
			end if;
		end if;
	end if;
end function;

-- Returns the function Slt(a, b) is (a < b) ? 1.0f : 0.0f
pure function CmpSltFunc(a : unsigned(31 downto 0); b : unsigned(31 downto 0) ) return unsigned is
	variable aIsNaN : std_logic;
	variable bIsNaN : std_logic;
begin
	aIsNaN := GetFloatIsNAN(a);
	bIsNaN := GetFloatIsNAN(b);
	if (aIsNaN = '1' or bIsNaN = '1') then
		return zeroF; -- The comparisons EQ, GT, GE, LT, and LE, when either or both operands is NaN returns FALSE.
	end if;

	if (CoreSLTNonNAN(a, b) = '0') then
		return zeroF;
	else
		return oneF;
	end if;
end function;

-- Returns the function Sge(a, b) is (a >= b) ? 1.0f : 0.0f
pure function CmpSgeFunc(a : unsigned(31 downto 0); b : unsigned(31 downto 0) ) return unsigned is
	variable aIsNaN : std_logic;
	variable bIsNaN : std_logic;
begin
	aIsNaN := GetFloatIsNAN(a);
	bIsNaN := GetFloatIsNAN(b);
	if (aIsNaN = '1' or bIsNaN = '1') then
		return zeroF; -- The comparisons EQ, GT, GE, LT, and LE, when either or both operands is NaN returns FALSE.
	end if;

	if (CoreSLTNonNAN(a, b) = '0') then -- This function just returns the opposite of SLT(a, b)
		return oneF;
	else
		return zeroF;
	end if;
end function;

-- Returns the function Sgn(x) is (x < 0.0f) ? -1.0f : ( (x == 0.0f) ? 0.0f : 1.0f)
pure function CmpSgnFunc(value : unsigned(31 downto 0) ) return unsigned is
	variable valIsNaN : std_logic;
	variable denormFlushedVal : unsigned(31 downto 0);
begin
	valIsNaN := GetFloatIsNAN(value);
	if (valIsNaN = '1') then
		return oneF; -- The comparisons EQ, GT, GE, LT, and LE, when either or both operands is NaN returns FALSE.
	end if;

	denormFlushedVal := FlushDenormsToZero(value);
	if (GetRawExponent(denormFlushedVal) = X"00") then
		return zeroF;
	else
		if (GetFloatIsNegative(value) = '0') then
			return oneF;
		else
			return negOneF;
		end if;
	end if;
end function;

-- Returns the function Cmp(a, b, c) is (a >= 0.0f) ? b : c
pure function CmpCmpFunc(a : unsigned(31 downto 0); b : unsigned(31 downto 0); c : unsigned(31 downto 0) ) return unsigned is
	variable aIsNaN : std_logic;
	variable denormFlushedA : unsigned(31 downto 0);
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
pure function CmpCndFunc(a : unsigned(31 downto 0); b : unsigned(31 downto 0); c : unsigned(31 downto 0) ) return unsigned is
	variable aIsNaN : std_logic;
	variable denormFlushedA : unsigned(31 downto 0);
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

-- Addition (ADD) pipe signals:
signal addPipelineValidStage0 : std_logic := '0';
signal addPipelineValidStage1 : std_logic := '0';

signal addEarlyOutBypassEnable0 : std_logic := '0';
signal addEarlyOutBypassEnable1 : std_logic := '0';

signal addEarlyOutBypass0 : unsigned(31 downto 0) := (others => '0');
signal addEarlyOutBypass1 : unsigned(31 downto 0) := (others => '0');

-- "min" and "max" here indicate magnitude away from zero, not signedness. "min" is closer to zero, and "max" is further away from zero.
signal addMinVal0 : unsigned(31 downto 0) := (others => '0');
signal addMaxVal0 : unsigned(31 downto 0) := (others => '0');
signal addMaxVal1 : unsigned(31 downto 0) := (others => '0');
signal addPostAddMantissa1 : signed(25 downto 0) := (others => '0');

-- Multiplication (MUL) pipe signals:
signal mulPipelineValidStage0 : std_logic := '0';
signal mulPipelineValidStage1 : std_logic := '0';
signal mulPipelineValidStage2 : std_logic := '0';
signal mulPipelineValidStage3 : std_logic := '0';

signal mulEarlyOutBypassEnable0 : std_logic := '0';
signal mulEarlyOutBypassEnable1 : std_logic := '0';
signal mulEarlyOutBypassEnable2 : std_logic := '0';
signal mulEarlyOutBypassEnable3 : std_logic := '0';

signal mulAssembledMantissaA : unsigned(23 downto 0) := (others => '0');
signal mulAssembledMantissaB : unsigned(23 downto 0) := (others => '0');

signal mulEarlyOutBypass0 : unsigned(31 downto 0) := (others => '0');
signal mulEarlyOutBypass1 : unsigned(31 downto 0) := (others => '0');
signal mulEarlyOutBypass2 : unsigned(31 downto 0) := (others => '0');
signal mulEarlyOutBypass3 : unsigned(31 downto 0) := (others => '0');

signal mulResultMantissa1 : unsigned(47 downto 0) := (others => '0');
signal mulResultMantissa2 : unsigned(47 downto 0) := (others => '0');
signal mulResultMantissa3 : unsigned(47 downto 0) := (others => '0');

signal mulResultExp0 : signed(8 downto 0) := (others => '0');
signal mulResultExp1 : signed(8 downto 0) := (others => '0');
signal mulResultExp2 : signed(8 downto 0) := (others => '0');
signal mulResultExp3 : signed(8 downto 0) := (others => '0');

signal mulResultSign0 : std_logic := '0';
signal mulResultSign1 : std_logic := '0';
signal mulResultSign2 : std_logic := '0';
signal mulResultSign3 : std_logic := '0';

begin

-- Compare (CMP) pipe process:
process(clk)
begin
	if (rising_edge(clk) ) then
		if (ICMP_GO = '1') then
			case unsigned(ICMP_MODE) is
				when to_unsigned(eCmpType'pos(CmpMin), 3) =>
					OCMP <= std_logic_vector(CmpMinFunc(unsigned(ICMP_A), unsigned(ICMP_B) ) );

				when to_unsigned(eCmpType'pos(CmpMax), 3) =>
					OCMP <= std_logic_vector(CmpMaxFunc(unsigned(ICMP_A), unsigned(ICMP_B) ) );

				when to_unsigned(eCmpType'pos(CmpSlt), 3) =>
					OCMP <= std_logic_vector(CmpSltFunc(unsigned(ICMP_A), unsigned(ICMP_B) ) );

				when to_unsigned(eCmpType'pos(CmpSge), 3) =>
					OCMP <= std_logic_vector(CmpSgeFunc(unsigned(ICMP_A), unsigned(ICMP_B) ) );

				when to_unsigned(eCmpType'pos(CmpSgn), 3) =>
					OCMP <= std_logic_vector(CmpSgnFunc(unsigned(ICMP_A) ) );

				when to_unsigned(eCmpType'pos(CmpCmp), 3) =>
					OCMP <= std_logic_vector(CmpCmpFunc(unsigned(ICMP_A), unsigned(ICMP_B), unsigned(ICMP_C) ) );

				when to_unsigned(eCmpType'pos(CmpCnd), 3) =>
					OCMP <= std_logic_vector(CmpCndFunc(unsigned(ICMP_A), unsigned(ICMP_B), unsigned(ICMP_C) ) );

				when others =>
			end case;
		end if;
	end if;
end process;

-- Addition (ADD) pipe process (cycle 1 of 3):
process(clk)
	variable aIsNaN : std_logic;
	variable bIsNaN : std_logic;
	variable aIsInf : std_logic;
	variable bIsInf : std_logic;
	variable aIsReal : std_logic;
	variable bIsReal : std_logic;
	variable flushedA : unsigned(31 downto 0);
	variable flushedB : unsigned(31 downto 0);
begin
	if (rising_edge(clk) ) then
		addPipelineValidStage0 <= IADD_GO;
		if (IADD_GO = '1') then
			if (GetFloatIsReal(unsigned(IADD_A) ) = '1') then
				aIsReal := '1';
				aIsNaN := '0';
				aIsInf := '0';
			else
				aIsReal := '0';
				if (GetFloatIsNAN(unsigned(IADD_A) ) = '1') then
					aIsNaN := '1';
				else
					aIsNaN := '0';
				end if;
				if (GetFloatIsINF(unsigned(IADD_A) ) = '1') then
					aIsInf := '1';
				else
					aIsInf := '0';
				end if;
			end if;

			if (GetFloatIsReal(unsigned(IADD_B) ) = '1') then
				bIsReal := '1';
				bIsNaN := '0';
				bIsInf := '0';
			else
				bIsReal := '0';
				if (GetFloatIsNAN(unsigned(IADD_B) ) = '1') then
					bIsNaN := '1';
				else
					bIsNaN := '0';
				end if;
				if (GetFloatIsINF(unsigned(IADD_B) ) = '1') then
					bIsInf := '1';
				else
					bIsInf := '0';
				end if;
			end if;

			-- Handle INF and NAN special cases:
			if ( (aIsReal = '1' and bIsInf = '1') or (aIsInf = '1' and bIsReal = '1') ) then -- Normal + INF or INF + Normal case (or subtraction, or negative INF or negative normal)
				addEarlyOutBypassEnable0 <= '1';
				if (aIsReal = '1') then
					addEarlyOutBypass0 <= unsigned(IADD_B);
				else
					addEarlyOutBypass0 <= unsigned(IADD_A);
				end if;
			elsif ( (aIsReal = '1' and bIsNaN = '1') or (aIsNaN = '1' and bIsReal = '1') ) then -- Normal + NaN or NaN + Normal case (or subtraction, or negative NaN or negative normal)
				addEarlyOutBypassEnable0 <= '1';
				if (aIsReal = '1') then
					addEarlyOutBypass0 <= unsigned(IADD_B);
				else
					addEarlyOutBypass0 <= unsigned(IADD_A);
				end if;
			elsif (aIsNaN = '1' and bIsNaN = '1') then -- NaN + NaN
				addEarlyOutBypassEnable0 <= '1';
				addEarlyOutBypass0 <= unsigned(IADD_A);
			elsif (aIsInf = '1' and bIsInf = '1') then -- INF + INF
				addEarlyOutBypassEnable0 <= '1';
				if (GetFloatIsNegative(unsigned(IADD_A) ) = GetFloatIsNegative(unsigned(IADD_B) ) ) then
					addEarlyOutBypass0 <= unsigned(IADD_A); -- INF + INF or -INF - INF doesn't change
				else
					addEarlyOutBypass0 <= '0' & X"FF" & "11111111111111111111111"; -- INF - INF = NaN
				end if;
			else
				flushedA := FlushDenormsToZero(unsigned(IADD_A) );
				flushedB := FlushDenormsToZero(unsigned(IADD_B) );

				-- Special case of X - X = 0 (or X + -X = 0 or -X + X = 0)
				-- Note that D3D specs that: -0 + +0 = +0 or +0 - +0 = +0 (this rule takes precedence over the X + 0 = X rule)
				if ( (GetFloatIsNegative(unsigned(IADD_A) ) /= GetFloatIsNegative(unsigned(IADD_B) ) ) and (flushedA(30 downto 0) = flushedB(30 downto 0) ) ) then
					addEarlyOutBypassEnable0 <= '1';
					addEarlyOutBypass0 <= '0' & X"00" & "00000000000000000000000";
				else -- Typical addition case here:
					if (flushedA(30 downto 0) < flushedB(30 downto 0) ) then -- Skip the addition and just return the non-zero number if one of the two operands is 0.0f or -0.0f.
						if (GetRawExponent(flushedA) = X"00") then
							addEarlyOutBypassEnable0 <= '1';
							addEarlyOutBypass0 <= flushedB;
						else
							addEarlyOutBypassEnable0 <= '0';
							addMinVal0 <= flushedA;
							addMaxVal0 <= flushedB;
						end if;
					else
						if (GetRawExponent(flushedB) = X"00") then
							addEarlyOutBypassEnable0 <= '1';
							addEarlyOutBypass0 <= flushedA;
						else
							addEarlyOutBypassEnable0 <= '0';
							addMinVal0 <= flushedB;
							addMaxVal0 <= flushedA;
						end if;
					end if;
				end if;
			end if;
		end if;
	end if;
end process;

-- Addition (ADD) pipe process (cycle 2 of 3):
process(clk)
	variable signedExpMax : signed(8 downto 0);
	variable signedExpMin : signed(8 downto 0);
	variable shiftAmount : unsigned(8 downto 0);
	variable mantissaMax : signed(25 downto 0);
	variable mantissaMin : signed(25 downto 0);
begin
	if (rising_edge(clk) ) then
		addPipelineValidStage1 <= addPipelineValidStage0;
		addEarlyOutBypassEnable1 <= addEarlyOutBypassEnable0;
		addEarlyOutBypass1 <= addEarlyOutBypass0;
		addMaxVal1 <= addMaxVal0;
		if (addPipelineValidStage0 = '1') then
			if (addEarlyOutBypassEnable0 = '0') then
				signedExpMax := GetSignedExponent(addMaxVal0);
				signedExpMin := GetSignedExponent(addMinVal0);
				shiftAmount := unsigned(signedExpMax - signedExpMin); -- We know that expmax must be >= expmin, so this can never be negative
				if (shiftAmount > 24) then
					addEarlyOutBypassEnable1 <= '1';
					addEarlyOutBypass1 <= addMaxVal0;
				else
					mantissaMax := signed("001" & GetMantissa(addMaxVal0) );
					if (GetFloatIsNegative(addMaxVal0) = '1') then
						mantissaMax := -mantissaMax;
					end if;

					mantissaMin := signed("001" & GetMantissa(addMinVal0) );
					if (GetFloatIsNegative(addMinVal0) = '1') then
						mantissaMin := -mantissaMin;
					end if;

					mantissaMin := shift_right(mantissaMin, to_integer(shiftAmount) );
					addPostAddMantissa1 <= mantissaMax + mantissaMin;
				end if;
			end if;
		end if;
	end if;
end process;

-- Addition (ADD) pipe process (cycle 3 of 3):
process (clk)
	variable finalSignIsNeg : std_logic;
	variable postAddMantissa : signed(25 downto 0);
	variable finalExp : signed(8 downto 0);
	variable renormalizeShiftAmount : integer;
begin
	if (rising_edge(clk) ) then
		if (addPipelineValidStage1 = '1') then
			if (addEarlyOutBypassEnable1 = '1') then
				OADD <= std_logic_vector(addEarlyOutBypass1);
			else
				finalSignIsNeg := addPostAddMantissa1(25);
				if (finalSignIsNeg = '1') then
					postAddMantissa := -addPostAddMantissa1;
				else
					postAddMantissa := addPostAddMantissa1;
				end if;

				finalExp := GetSignedExponent(addMaxVal1);

				if ( (postAddMantissa(24) = '1') and (GetSignedExponent(addMaxVal1) > 126) ) then
					if (finalSignIsNeg = '1') then -- Handle saturation case of exponent overflowing into +/-INF here
						OADD <= "1" & X"FF" & "00000000000000000000000"; -- return -INF
					else
						OADD <= "0" & X"FF" & "00000000000000000000000"; -- return +INF
					end if;
				else
					if (postAddMantissa(24) = '1') then -- Check to see if our mantissa is overflowing into our exponent field (if so, shift that bit out and increment the exponent by 1)
						postAddMantissa := postAddMantissa srl 1;
						finalExp := finalExp + 1;
					end if;

					renormalizeShiftAmount := bitScan(postAddMantissa);
					postAddMantissa := postAddMantissa sll renormalizeShiftAmount;
					finalExp := finalExp - renormalizeShiftAmount;
					if (finalExp < -126) then -- Saturate to 0 if we end up underflowing into 0 or denormals
						OADD <= '0' & X"00" & "00000000000000000000000";
					else
						OADD <= finalSignIsNeg & MakeExponentFromSigned(finalExp) & std_logic_vector(postAddMantissa(22 downto 0) );
					end if;
				end if;
			end if;
		end if;
	end if;
end process;

-- Multiplication (MUL) pipe process (cycle 1 of 5):
process(clk)
	variable resultSign : std_logic;
	variable rawExpA : unsigned(7 downto 0);
	variable rawExpB : unsigned(7 downto 0);
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage0 <= IMUL_GO;
		if (IMUL_GO = '1') then
			-- Calculate the result sign:
			resultSign := GetFloatIsNegative(unsigned(IMUL_A) ) xor GetFloatIsNegative(unsigned(IMUL_B) );
			mulResultSign0 <= resultSign;

			rawExpA := GetRawExponent(unsigned(IMUL_A) );
			rawExpB := GetRawExponent(unsigned(IMUL_B) );
			if (rawExpA = X"FF") then -- Handle INF and NaN inputs as special-case early outs:
				mulEarlyOutBypassEnable0 <= '1';

				if (GetMantissa(unsigned(IMUL_A) ) = "00000000000000000000000") then -- INF * b
					if (rawExpB = X"00") then -- INF * 0 = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					elsif (GetFloatIsNAN(unsigned(IMUL_B) ) = '1') then -- INF * NaN = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					else -- INF * b = INF
						mulEarlyOutBypass0 <= resultSign & X"FF" & "00000000000000000000000";
					end if;
				else -- NaN * b = NaN
					mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
				end if;
			elsif (rawExpB = X"FF") then
				mulEarlyOutBypassEnable0 <= '1';

				if (GetMantissa(unsigned(IMUL_B) ) = "00000000000000000000000") then -- a * INF
					if (rawExpA = X"00") then -- 0 * INF = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					elsif (GetFloatIsNAN(unsigned(IMUL_A) ) = '1') then -- NaN * INF = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					else -- a * INF = INF
						mulEarlyOutBypass0 <= resultSign & X"FF" & "00000000000000000000000";
					end if;
				else -- a * NaN = NaN
					mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
				end if;
			elsif ( (rawExpA = X"00") or (rawExpB = X"00") ) then -- Handle multiplication by zero (or denormals, which get flushed to zero) as a special-case early out:
				mulEarlyOutBypassEnable0 <= '1';
				mulEarlyOutBypass0 <= resultSign & X"00" & "00000000000000000000000";
			else -- Primary multiplication case:
				mulEarlyOutBypassEnable0 <= '0';
				mulResultExp0 <= GetSignedExponent(unsigned(IMUL_A) ) + GetSignedExponent(unsigned(IMUL_B) );
				mulAssembledMantissaA <= '1' & GetMantissa(unsigned(IMUL_A) );
				mulAssembledMantissaB <= '1' & GetMantissa(unsigned(IMUL_B) );
			end if;
		end if;
	end if;
end process;

-- Multiplication (MUL) pipe process (cycle 2 of 5):
process(clk)
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage1 <= mulPipelineValidStage0;
		if (mulPipelineValidStage0 = '1') then
			mulEarlyOutBypassEnable1 <= mulEarlyOutBypassEnable0;
			mulEarlyOutBypass1 <= mulEarlyOutBypass0;
			mulResultExp1 <= mulResultExp0;
			mulResultSign1 <= mulResultSign0;
			if (mulEarlyOutBypassEnable0 = '0') then
				-- TODO: See if this can be broken up into just one DSP usage with an 18x17 multiply and then some smaller 6x18 multiplies added together rather than the current two DSP multiplies
				mulResultMantissa1 <= mulAssembledMantissaA * mulAssembledMantissaB;
			end if;
		end if;
	end if;
end process;

-- Multiplication (MUL) pipe process (cycle 3 of 5):
process(clk)
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage2 <= mulPipelineValidStage1;
		if (mulPipelineValidStage1 = '1') then
			mulEarlyOutBypassEnable2 <= mulEarlyOutBypassEnable1;
			mulEarlyOutBypass2 <= mulEarlyOutBypass1;
			mulResultExp2 <= mulResultExp1;
			mulResultMantissa2 <= mulResultMantissa1;
			mulResultSign2 <= mulResultSign1;
		end if;
	end if;
end process;

-- Multiplication (MUL) pipe process (cycle 4 of 5):
process(clk)
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage3 <= mulPipelineValidStage2;
		if (mulPipelineValidStage2 = '1') then
			mulEarlyOutBypassEnable3 <= mulEarlyOutBypassEnable2;
			mulEarlyOutBypass3 <= mulEarlyOutBypass2;
			mulResultExp3 <= mulResultExp2;
			mulResultMantissa3 <= mulResultMantissa2;
			mulResultSign3 <= mulResultSign2;
		end if;
	end if;
end process;

-- Multiplication (MUL) pipe process (cycle 5 of 5):
-- TODO: Handle proper rounding. About half of all of the output values aren't rounded as they should be!
process(clk)
	variable finalMantissa : unsigned(47 downto 0);
begin
	if (rising_edge(clk) ) then
		if (mulPipelineValidStage3 = '1') then
			if (mulEarlyOutBypassEnable3 = '1') then -- Mul bypass case
				OMUL <= std_logic_vector(mulEarlyOutBypass3);
			else -- Non-bypass standard case
				if (mulResultExp3 > to_signed(127, 9) ) then -- Saturate to INF if we end up overflowing to +/- INF
					OMUL <= mulResultSign3 & X"FF" & "00000000000000000000000";
				elsif (mulResultExp3 < to_signed(-126, 9) ) then -- Saturate to 0 if we end up underflowing into 0 or denormals
					OMUL <= mulResultSign3 & X"00" & "00000000000000000000000";
				else -- Standard case
					finalMantissa := mulResultMantissa3 srl 23;
					if (finalMantissa(24) = '1') then -- If the mantissa overflows into the exponent, we need to renormalize
						if (mulResultExp3 = to_signed(127, 9) ) then -- Our overflow could cause us to overflow into INF
							OMUL <= mulResultSign3 & X"FF" & "00000000000000000000000";
						else
							finalMantissa := finalMantissa srl 1; -- Handle renormalize by adding 1 to the exponent and shifting the mantissa to the right by 1
							OMUL <= mulResultSign3 & MakeExponentFromSigned(mulResultExp3 + to_signed(1, 9) ) & std_logic_vector(finalMantissa(22 downto 0) );
						end if;
					else -- No mantissa overflow case
						OMUL <= mulResultSign3 & MakeExponentFromSigned(mulResultExp3) & std_logic_vector(finalMantissa(22 downto 0) );
					end if;
				end if;
			end if;
		end if;
	end if;
end process;

end Behavioral;
