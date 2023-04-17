
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;
use work.FloatCommon.all;

entity StandaloneFloatALU_ADD is
    Port (clk : in STD_LOGIC;

		-- Common ports shared across multiple stages:
		IN_A : in STD_LOGIC_VECTOR(31 downto 0);
		IN_B : in STD_LOGIC_VECTOR(31 downto 0);
		OADD : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		-- ADD pipe operates in 4 clock cycles
		IADD_GO : in STD_LOGIC
		);
end StandaloneFloatALU_ADD;

architecture Behavioral of StandaloneFloatALU_ADD is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

-- attribute KEEP : string;

-- Signals common to all pipes:
signal comAIsNeg : std_logic := '0';
signal comBIsNeg : std_logic := '0';
signal comAIsINF : std_logic := '0';
signal comBIsINF : std_logic := '0';
signal comAIsNaN : std_logic := '0';
signal comBIsNaN : std_logic := '0';
signal comAIsReal : std_logic := '0';
signal comBIsReal : std_logic := '0';
signal comAIsDenormal : std_logic := '0';
signal comBIsDenormal : std_logic := '0';
signal comDenormalFlushedA : f32 := (others => '0');
signal comDenormalFlushedB : f32 := (others => '0');
signal comALessThanB : std_logic := '0';

-- Addition (ADD) pipe signals:
signal addPipelineValidStage0 : std_logic := '0';
signal addPipelineValidStage1 : std_logic := '0';
signal addPipelineValidStage2 : std_logic := '0';

signal addEarlyOutBypassEnable0 : std_logic := '0';
signal addEarlyOutBypassEnable1 : std_logic := '0';
signal addEarlyOutBypassEnable2 : std_logic := '0';

signal addEarlyOutBypass0 : f32 := (others => '0');
signal addEarlyOutBypass1 : f32 := (others => '0');

signal addDenormFlushedValA : f32 := (others => '0');
signal addDenormFlushedValB : f32 := (others => '0');
signal addALessThanB : std_logic := '0';
signal addExponentDeltaAMinusB : signed(7 downto 0) := (others => '0');
signal addExponentDeltaBMinusA : signed(7 downto 0) := (others => '0');
signal addExponentDeltaAMinusBShiftTooFar : std_logic := '0';
signal addExponentDeltaBMinusAShiftTooFar : std_logic := '0';
signal addSameNumberDifferentSigns0 : std_logic := '0';
signal addSameNumberDifferentSigns1 : std_logic := '0';
signal addRenormalizeShiftAmount : natural range 0 to 23 := 0;
signal addFinalExp : signed(7 downto 0) := (others => '0');
signal addPostAddMantissa : signed(25 downto 0) := (others => '0');
signal addFinalSignIsNeg : std_logic := '0';
signal OADD_Temp : std_logic_vector(31 downto 0) := (others => '0');

-- "min" and "max" here indicate magnitude away from zero, not signedness. "min" is closer to zero, and "max" is further away from zero.
signal addMaxVal1 : f32 := (others => '0');
signal addPostAddMantissa1 : signed(25 downto 0) := (others => '0');

begin

comAIsNeg <= IN_A(31);
comBIsNeg <= IN_B(31);
comAIsINF <= GetFloatIsINF(f32(IN_A) );
comBIsINF <= GetFloatIsINF(f32(IN_B) );
comAIsNaN <= GetFloatIsNAN(f32(IN_A) );
comBIsNaN <= GetFloatIsNAN(f32(IN_B) );
comAIsReal <= GetFloatIsReal(f32(IN_A) );
comBIsReal <= GetFloatIsReal(f32(IN_B) );
comAIsDenormal <= '1' when (GetRawExponent(f32(IN_A) ) = X"00") else '0';
comBIsDenormal <= '1' when (GetRawExponent(f32(IN_B) ) = X"00") else '0';
comDenormalFlushedA <= FlushDenormsToZero(f32(IN_A) );
comDenormalFlushedB <= FlushDenormsToZero(f32(IN_B) );
comALessThanB <= '1' when (unsigned(IN_A(30 downto 0) ) < unsigned(IN_B(30 downto 0) ) ) else '0';

-- Addition (ADD) pipe process (cycle 1 of 4):
ADDStage0 : process(clk)
	variable aIsNaN : std_logic;
	variable bIsNaN : std_logic;
	variable aIsInf : std_logic;
	variable bIsInf : std_logic;
	variable aIsReal : std_logic;
	variable bIsReal : std_logic;
begin
	if (rising_edge(clk) ) then
		addPipelineValidStage0 <= IADD_GO;
		if (IADD_GO = '1') then
			addDenormFlushedValA <= comDenormalFlushedA;
			addDenormFlushedValB <= comDenormalFlushedB;
			addALessThanB <= comALessThanB;
			addExponentDeltaAMinusB <= GetSignedExponent(f32(IN_A) ) - GetSignedExponent(f32(IN_B) );
			addExponentDeltaBMinusA <= GetSignedExponent(f32(IN_B) ) - GetSignedExponent(f32(IN_A) );
			if (unsigned(GetSignedExponent(f32(IN_A) ) - GetSignedExponent(f32(IN_B) ) ) > 24) then
				addExponentDeltaAMinusBShiftTooFar <= '1';
			else
				addExponentDeltaAMinusBShiftTooFar <= '0';
			end if;
			if (unsigned(GetSignedExponent(f32(IN_B) ) - GetSignedExponent(f32(IN_A) ) ) > 24) then
				addExponentDeltaBMinusAShiftTooFar <= '1';
			else
				addExponentDeltaBMinusAShiftTooFar <= '0';
			end if;
			if (comDenormalFlushedA(30 downto 0) = comDenormalFlushedB(30 downto 0) ) then
				addSameNumberDifferentSigns0 <= '1';
			else
				addSameNumberDifferentSigns0 <= '0';
			end if;
			if (comAIsReal = '1') then
				aIsReal := '1';
				aIsNaN := '0';
				aIsInf := '0';
			else
				aIsReal := '0';
				if (comAIsNaN = '1') then
					aIsNaN := '1';
				else
					aIsNaN := '0';
				end if;
				if (comAIsINF = '1') then
					aIsInf := '1';
				else
					aIsInf := '0';
				end if;
			end if;

			if (comBIsReal = '1') then
				bIsReal := '1';
				bIsNaN := '0';
				bIsInf := '0';
			else
				bIsReal := '0';
				if (comBIsNaN = '1') then
					bIsNaN := '1';
				else
					bIsNaN := '0';
				end if;
				if (comBIsINF = '1') then
					bIsInf := '1';
				else
					bIsInf := '0';
				end if;
			end if;

			-- Handle INF and NAN special cases:
			if ( (aIsReal = '1' and bIsInf = '1') or (aIsInf = '1' and bIsReal = '1') ) then -- Normal + INF or INF + Normal case (or subtraction, or negative INF or negative normal)
				addEarlyOutBypassEnable0 <= '1';
				if (aIsReal = '1') then
					addEarlyOutBypass0 <= f32(IN_B);
				else
					addEarlyOutBypass0 <= f32(IN_A);
				end if;
			elsif ( (aIsReal = '1' and bIsNaN = '1') or (aIsNaN = '1' and bIsReal = '1') ) then -- Normal + NaN or NaN + Normal case (or subtraction, or negative NaN or negative normal)
				addEarlyOutBypassEnable0 <= '1';
				if (aIsReal = '1') then
					addEarlyOutBypass0 <= f32(IN_B);
				else
					addEarlyOutBypass0 <= f32(IN_A);
				end if;
			elsif (aIsNaN = '1' and bIsNaN = '1') then -- NaN + NaN
				addEarlyOutBypassEnable0 <= '1';
				addEarlyOutBypass0 <= f32(IN_A);
			elsif (aIsInf = '1' and bIsInf = '1') then -- INF + INF
				addEarlyOutBypassEnable0 <= '1';
				if (comAIsNeg = comBIsNeg) then
					addEarlyOutBypass0 <= f32(IN_A); -- INF + INF or -INF - INF doesn't change
				else
					addEarlyOutBypass0 <= '0' & X"FF" & "11111111111111111111111"; -- INF - INF = NaN
				end if;
			else
				-- Special case of X - X = 0 (or X + -X = 0 or -X + X = 0)
				-- Note that D3D specs that: -0 + +0 = +0 or +0 - +0 = +0 (this rule takes precedence over the X + 0 = X rule)
				if ( (comAIsNeg /= comBIsNeg) and (comDenormalFlushedA(30 downto 0) = comDenormalFlushedB(30 downto 0) ) ) then
					addEarlyOutBypassEnable0 <= '1';
					addEarlyOutBypass0 <= '0' & X"00" & "00000000000000000000000";
				else -- Typical addition case here:
					if (comALessThanB = '1') then -- Skip the addition and just return the non-zero number if one of the two operands is 0.0f or -0.0f.
						if (comAIsDenormal = '1') then
							addEarlyOutBypassEnable0 <= '1';
							addEarlyOutBypass0 <= comDenormalFlushedB;
						else
							addEarlyOutBypassEnable0 <= '0';
						end if;
					else
						if (comBIsDenormal = '1') then
							addEarlyOutBypassEnable0 <= '1';
							addEarlyOutBypass0 <= comDenormalFlushedA;
						else
							addEarlyOutBypassEnable0 <= '0';
						end if;
					end if;
				end if;
			end if;
		end if;
	end if;
end process ADDStage0;

-- Addition (ADD) pipe process (cycle 2 of 4):
ADDStage1 : process(clk)
	variable addMinVal0 : f32;
	variable addMaxVal0 : f32;
	variable shiftAmount : unsigned(7 downto 0);
	variable shiftTooFar : std_logic;
	variable mantissaMax : signed(25 downto 0);
	variable mantissaMin : signed(25 downto 0);
begin
	if (rising_edge(clk) ) then
		addPipelineValidStage1 <= addPipelineValidStage0;
		addEarlyOutBypassEnable1 <= addEarlyOutBypassEnable0;
		addEarlyOutBypass1 <= addEarlyOutBypass0;
		if (addPipelineValidStage0 = '1') then
			if (addEarlyOutBypassEnable0 = '0') then
				-- Special case of X - X = 0 (or X + -X = 0 or -X + X = 0)
				-- Note that D3D specs that: -0 + +0 = +0 or +0 - +0 = +0 (this rule takes precedence over the X + 0 = X rule)
				if ( (addDenormFlushedValA(31) /= addDenormFlushedValB(31) ) and (addSameNumberDifferentSigns0 = '1') ) then
					addSameNumberDifferentSigns1 <= '1';
				else
					addSameNumberDifferentSigns1 <= '0';
					if (addALessThanB = '1') then
						addMinVal0 := addDenormFlushedValA;
						addMaxVal0 := addDenormFlushedValB;
						shiftAmount := unsigned(addExponentDeltaBMinusA); -- We know that expmax must be >= expmin, so this can never be negative
						shiftTooFar := addExponentDeltaBMinusAShiftTooFar;
					else
						addMinVal0 := addDenormFlushedValB;
						addMaxVal0 := addDenormFlushedValA;
						shiftAmount := unsigned(addExponentDeltaAMinusB); -- We know that expmax must be >= expmin, so this can never be negative
						shiftTooFar := addExponentDeltaAMinusBShiftTooFar;
					end if;
					addMaxVal1 <= addMaxVal0;
					if (shiftTooFar = '1') then
						addEarlyOutBypassEnable1 <= '1';
						addEarlyOutBypass1 <= addMaxVal0;
					else
						mantissaMax := signed("001" & std_logic_vector(GetMantissa(addMaxVal0) ) );
						if (GetFloatIsNegative(addMaxVal0) = '1') then
							mantissaMax := -mantissaMax;
						end if;

						mantissaMin := signed("001" & std_logic_vector(GetMantissa(addMinVal0) ) );
						if (GetFloatIsNegative(addMinVal0) = '1') then
							mantissaMin := -mantissaMin;
						end if;

						mantissaMin := shift_right(mantissaMin, to_integer(shiftAmount) );
						addPostAddMantissa1 <= mantissaMax + mantissaMin;
					end if;
				end if;
			end if;
		end if;
	end if;
end process ADDStage1;

-- Addition (ADD) pipe process (cycle 3 of 4):
ADDStage2 : process (clk)
	variable finalSignIsNeg : std_logic;
	variable postAddMantissa : signed(25 downto 0);
	variable finalExp : signed(7 downto 0);
	variable renormalizeShiftAmount : natural range 0 to 23;
begin
	if (rising_edge(clk) ) then
		addPipelineValidStage2 <= addPipelineValidStage1;
		if (addPipelineValidStage1 = '1') then
			addEarlyOutBypassEnable2 <= addEarlyOutBypassEnable1;
			if (addEarlyOutBypassEnable1 = '1') then
				OADD_Temp <= std_logic_vector(addEarlyOutBypass1);
			else
				if (addSameNumberDifferentSigns1 = '1') then
					addEarlyOutBypassEnable2 <= '1';
					OADD_Temp <= '0' & X"00" & "00000000000000000000000";
				else
					finalSignIsNeg := addPostAddMantissa1(25);
					addFinalSignIsNeg <= finalSignIsNeg;
					if (finalSignIsNeg = '1') then
						postAddMantissa := -addPostAddMantissa1;
					else
						postAddMantissa := addPostAddMantissa1;
					end if;

					finalExp := GetSignedExponent(addMaxVal1);

					if ( (postAddMantissa(24) = '1') and (GetSignedExponent(addMaxVal1) > 126) ) then
						if (finalSignIsNeg = '1') then -- Handle saturation case of exponent overflowing into +/-INF here
							addEarlyOutBypassEnable2 <= '1';
							OADD_Temp <= "1" & X"FF" & "00000000000000000000000"; -- return -INF
						else
							addEarlyOutBypassEnable2 <= '1';
							OADD_Temp <= "0" & X"FF" & "00000000000000000000000"; -- return +INF
						end if;
					else
						if (postAddMantissa(24) = '1') then -- Check to see if our mantissa is overflowing into our exponent field (if so, shift that bit out and increment the exponent by 1)
							postAddMantissa := postAddMantissa srl 1;
							finalExp := finalExp + 1;
						end if;
						addPostAddMantissa <= postAddMantissa;

						addFinalExp <= finalExp;
						addRenormalizeShiftAmount <= bitScan(postAddMantissa);
					end if;
				end if;
			end if;
		end if;
	end if;
end process ADDStage2;

-- Addition (ADD) pipe process (cycle 4 of 4):
ADDStage3 : process(clk)
	variable newFinalExp : signed(7 downto 0);
	variable postAddMantissa : signed(25 downto 0);
begin
	if (rising_edge(clk) ) then
		if (addPipelineValidStage2 = '1') then
			if (addEarlyOutBypassEnable2 = '1') then
				OADD <= std_logic_vector(OADD_Temp);
			else
				postAddMantissa := addPostAddMantissa sll addRenormalizeShiftAmount;
				newFinalExp := addFinalExp - addRenormalizeShiftAmount;
				if (newFinalExp < -126) then -- Saturate to 0 if we end up underflowing into 0 or denormals
					OADD <= '0' & X"00" & "00000000000000000000000";
				else
					OADD <= addFinalSignIsNeg & MakeExponentFromSigned(newFinalExp) & std_logic_vector(postAddMantissa(22 downto 0) );
				end if;
			end if;
		end if;
	end if;
end process ADDStage3;

end Behavioral;
