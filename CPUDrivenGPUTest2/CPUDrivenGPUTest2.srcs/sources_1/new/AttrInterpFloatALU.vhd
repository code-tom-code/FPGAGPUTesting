
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;
use work.FloatCommon.all;
use work.FloatALU_CNV.all;

entity AttrInterpFloatALU is
    Port (clk : in STD_LOGIC;

		-- Common ports shared across multiple stages:
		IN_A : in STD_LOGIC_VECTOR(31 downto 0);
		IN_B : in STD_LOGIC_VECTOR(31 downto 0);
		IN_MODE : in STD_LOGIC_VECTOR(2 downto 0); -- Generic "mode" that can be interpreted by different stages differently
		OUT_RESULT : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		-- MUL pipe operates in 5 clock cycles
		IMUL_GO : in STD_LOGIC;

		-- ADD pipe operates in 4 clock cycles
		IADD_GO : in STD_LOGIC;

		-- CNV pipe operates in 3 clock cycles. IN_MODE corresponds to the eConvertMode type.
		ICNV_GO : in STD_LOGIC
		);
end AttrInterpFloatALU;

architecture Behavioral of AttrInterpFloatALU is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

-- attribute KEEP : string;

type MUXArrayType is array(0 to maxCycleCount) of unsigned(numMUXSources-1 downto 0);

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
signal comRawExponentA : unsigned(7 downto 0) := (others => '0');
signal comRawExponentB : unsigned(7 downto 0) := (others => '0');
signal comASign : std_logic := '0';
signal comBSign : std_logic := '0';
signal comSignedExponentA : signed(7 downto 0) := (others => '0');
signal comSignedExponentB : signed(7 downto 0) := (others => '0');
signal comRawMantissaA : unsigned(22 downto 0) := (others => '0');
signal comRawMantissaB : unsigned(22 downto 0) := (others => '0');
signal comALessThanB : std_logic := '0';
signal comAEqualsB : std_logic := '0';

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


-- "min" and "max" here indicate magnitude away from zero, not signedness. "min" is closer to zero, and "max" is further away from zero.
signal addMaxVal1 : f32 := (others => '0');
signal addPostAddMantissa1 : signed(25 downto 0) := (others => '0');

signal OADD_Temp : std_logic_vector(31 downto 0) := (others => '0');

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

signal mulEarlyOutBypass0 : f32 := (others => '0');
signal mulEarlyOutBypass1 : f32 := (others => '0');
signal mulEarlyOutBypass2 : f32 := (others => '0');
signal mulEarlyOutBypass3 : f32 := (others => '0');

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

-- Conversion (CNV) pipe signals:
signal cnvEarlyOutType0 : eCnvEarlyOutType := CnvNoEarlyOut;
signal cnvEarlyOutType1 : eCnvEarlyOutType := CnvNoEarlyOut;
signal cnvShiftAmount : signed(7 downto 0) := (others => '0');
signal cnvIsNegative0 : std_logic := '0';
signal cnvIsNegative1 : std_logic := '0';
signal cnvU32ShiftAmount0 : unsigned(4 downto 0) := (others => '0');
signal cnvU32ShiftAmount1 : unsigned(4 downto 0) := (others => '0');
signal cnvU32ShiftRight : std_logic := '0';
signal frcNormalizedMantissa0 : unsigned(22 downto 0) := (others => '0');
signal frcNormalizedMantissa1 : unsigned(22 downto 0) := (others => '0');
signal cnvInput : f32 := (others => '0');
signal cnvInput1 : f32 := (others => '0');
signal cnvShiftedTemporary : unsigned(31 downto 0) := (others => '0');
signal cnvIsValid : std_logic := '0';
signal cnvIsValid1 : std_logic := '0';
signal cnvMode0 : eConvertMode := F_to_UNORM16;
signal cnvMode1 : eConvertMode := F_to_UNORM16;

-- Output signals:
signal OADD : std_logic_vector(31 downto 0) := (others => '0');
signal OMUL : std_logic_vector(31 downto 0) := (others => '0');
signal OCNV : std_logic_vector(31 downto 0) := (others => '0');
signal OMUX : MUXArrayType := (others => (others => '0') );

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
comRawExponentA <= GetRawExponent(f32(IN_A) );
comRawExponentB <= GetRawExponent(f32(IN_B) );
comASign <= GetFloatIsNegative(f32(IN_A) );
comBSign <= GetFloatIsNegative(f32(IN_B) );
comSignedExponentA <= GetSignedExponent(f32(IN_A) );
comSignedExponentB <= GetSignedExponent(f32(IN_B) );
comRawMantissaA <= GetMantissa(f32(IN_A) );
comRawMantissaB <= GetMantissa(f32(IN_B) );
comALessThanB <= '1' when (unsigned(IN_A(30 downto 0) ) < unsigned(IN_B(30 downto 0) ) ) else '0';
comAEqualsB <= '1' when (unsigned(IN_A(30 downto 0) ) = unsigned(IN_B(30 downto 0) ) ) else '0';

-- Output MUX handling:
with OMUX(0) select
	OUT_RESULT <= 	OADD when "0000010",
					OMUL when "0000100",
					OCNV when "0100000",
					(others => '0') when others;

-- Output MUX process:
OMUXProcess : process(clk)
begin
	if (rising_edge(clk) ) then
		OMUX(maxCycleCount - 1) <= (others => '0'); -- Push back a new empty entry
		for i in OMUX'length-2 downto 0 loop
			OMUX(i) <= OMUX(i + 1); -- Shift the whole vector down by one entry per clock cycle (shifting in zeroed bits at the top each time)
		end loop;
		if (IADD_GO = '1') then
			OMUX(ADD_CYCLES - 1) <= "0000010";
		elsif (IMUL_GO = '1') then
			OMUX(MUL_CYCLES - 1) <= "0000100";
		elsif (ICNV_GO = '1') then
			OMUX(CNV_CYCLES - 1) <= "0100000";
		end if;
	end if;
end process OMUXProcess;

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
				OADD <= OADD_Temp;
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

-- Multiplication (MUL) pipe process (cycle 1 of 5):
MULStage0 : process(clk)
	variable resultSign : std_logic;
begin
	if (rising_edge(clk) ) then
		mulPipelineValidStage0 <= IMUL_GO;
		if (IMUL_GO = '1') then
			-- Calculate the result sign:
			resultSign := comASign xor comBSign;
			mulResultSign0 <= resultSign;

			if (comAIsReal = '0') then -- Handle INF and NaN inputs as special-case early outs:
				mulEarlyOutBypassEnable0 <= '1';

				if (comRawMantissaA = "00000000000000000000000") then -- INF * b
					if (comBIsDenormal = '1') then -- INF * 0 = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					elsif (comBIsNaN = '1') then -- INF * NaN = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					else -- INF * b = INF
						mulEarlyOutBypass0 <= resultSign & X"FF" & "00000000000000000000000";
					end if;
				else -- NaN * b = NaN
					mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
				end if;
			elsif (comBIsReal = '0') then
				mulEarlyOutBypassEnable0 <= '1';

				if (comRawMantissaB = "00000000000000000000000") then -- a * INF
					if (comAIsDenormal = '1') then -- 0 * INF = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					elsif (comAIsNaN = '1') then -- NaN * INF = NaN
						mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
					else -- a * INF = INF
						mulEarlyOutBypass0 <= resultSign & X"FF" & "00000000000000000000000";
					end if;
				else -- a * NaN = NaN
					mulEarlyOutBypass0 <= resultSign & X"FF" & "11111111111111111111111";
				end if;
			elsif ( (comAIsDenormal = '1') or (comBIsDenormal = '1') ) then -- Handle multiplication by zero (or denormals, which get flushed to zero) as a special-case early out:
				mulEarlyOutBypassEnable0 <= '1';
				mulEarlyOutBypass0 <= resultSign & X"00" & "00000000000000000000000";
			else -- Primary multiplication case:
				mulEarlyOutBypassEnable0 <= '0';
				mulResultExp0 <= resize(comSignedExponentA, 9) + resize(comSignedExponentB, 9);
				mulAssembledMantissaA <= '1' & comRawMantissaA;
				mulAssembledMantissaB <= '1' & comRawMantissaB;
			end if;
		end if;
	end if;
end process MULStage0;

-- Multiplication (MUL) pipe process (cycle 2 of 5):
MULStage1 : process(clk)
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
end process MULStage1;

-- Multiplication (MUL) pipe process (cycle 3 of 5):
MULStage2 : process(clk)
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
end process MULStage2;

-- Multiplication (MUL) pipe process (cycle 4 of 5):
MULStage3 : process(clk)
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
end process MULStage3;

-- Multiplication (MUL) pipe process (cycle 5 of 5):
-- TODO: Handle proper rounding. About half of all of the output values aren't rounded as they should be!
MULStage4 : process(clk)
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
							OMUL <= mulResultSign3 & MakeExponentFromSigned(mulResultExp3(7 downto 0) + to_signed(1, 8) ) & std_logic_vector(finalMantissa(22 downto 0) );
						end if;
					else -- No mantissa overflow case
						OMUL <= mulResultSign3 & MakeExponentFromSigned(mulResultExp3(7 downto 0) ) & std_logic_vector(finalMantissa(22 downto 0) );
					end if;
				end if;
			end if;
		end if;
	end if;
end process MULStage4;

-- Conversion (CNV) pipe process:
CNVStage0 : process(clk)
	variable earlyOutType : eCnvEarlyOutType;
	variable shiftU32HighBitIndex : unsigned(4 downto 0);
begin
	if (rising_edge(clk) ) then
		if (ICNV_GO = '1') then
			cnvIsValid <= '1';
			cnvMode0 <= eConvertMode'val(to_integer(unsigned(IN_MODE) ) );
			cnvInput <= f32(IN_A);
			cnvIsNegative0 <= comAIsNeg;
			case eConvertMode'val(to_integer(unsigned(IN_MODE) ) ) is
				when F_Frc =>
					earlyOutType := CnvFrc_GetEarlyOutType(f32(IN_A) );
					cnvEarlyOutType0 <= earlyOutType;
					frcNormalizedMantissa0 <= CnvFrc_Cycle0(f32(IN_A) );
				when F_to_U24_RoundNearestEven =>
					earlyOutType := CnvFloatToUInt24_RoundNE_GetEarlyOutType(f32(IN_A), comAIsNaN, comAIsNeg );
					cnvEarlyOutType0 <= earlyOutType;
					if (earlyOutType = CnvNoEarlyOut) then
						cnvShiftAmount <= CnvFloatToUInt24_RoundNE_Cycle0(comSignedExponentA);
					end if;
				when F_to_I16_RoundNearestEven =>
					earlyOutType := CnvFloatToInt16_RoundNE_GetEarlyOutType(f32(IN_A), comAIsNaN, comAIsNeg );
					cnvEarlyOutType0 <= earlyOutType;
					if (earlyOutType = CnvNoEarlyOut) then
						cnvShiftAmount <= CnvFloatToInt16_RoundNE_Cycle0(comSignedExponentA);
					end if;
				when F_to_UNORM16 =>
					earlyOutType := CnvFloatToUNORM16_GetEarlyOutType(f32(IN_A), comAIsNaN, comAIsNeg );
					cnvEarlyOutType0 <= earlyOutType;
					if (earlyOutType = CnvNoEarlyOut) then
						cnvShiftAmount <= CnvFloatToUNORM16_Cycle0(comSignedExponentA);						
					end if;
				when F_to_UNORM8 =>
					earlyOutType := CnvFloatToUNORM8_GetEarlyOutType(f32(IN_A), comAIsNaN, comAIsNeg );
					cnvEarlyOutType0 <= earlyOutType;
					if (earlyOutType = CnvNoEarlyOut) then
						cnvShiftAmount <= CnvFloatToUNORM8_Cycle0(comSignedExponentA);
					end if;
				when F_to_Half =>
					earlyOutType := CnvFloatToHalf_GetEarlyOutType(f32(IN_A), comAIsNaN);
					cnvEarlyOutType0 <= earlyOutType;
					cnvShiftAmount <= (others => '0');
				when Half_to_F =>
					earlyOutType := CnvHalfToFloat_GetEarlyOutType(unsigned(IN_A(14 downto 0) ) );
					cnvEarlyOutType0 <= earlyOutType;
					cnvShiftAmount <= (others => '0');
				when U32_to_F =>
					earlyOutType := CnvU32ToFloat_GetEarlyOutType(unsigned(IN_A) );
					cnvEarlyOutType0 <= earlyOutType;
					shiftU32HighBitIndex := CnvU32ToFloat_GetFirstHighBitSet(unsigned(IN_A) );
					cnvU32ShiftAmount0 <= shiftU32HighBitIndex;
					if (shiftU32HighBitIndex >= 23) then
						cnvU32ShiftRight <= '1';
					else
						cnvU32ShiftRight <= '0';
					end if;
					cnvShiftAmount <= (others => '0');
				when others =>
					cnvEarlyOutType0 <= CnvNoEarlyOut;
					cnvShiftAmount <= (others => '0');
			end case;
		else
			cnvIsValid <= '0';
		end if;
	end if;
end process CNVStage0;

CNVStage1 : process(clk)
	variable tempBuffer : signed(31 downto 0);
	variable tempMantissa : unsigned(23 downto 0);
begin
	if (rising_edge(clk) ) then
		cnvIsValid1 <= cnvIsValid;
		cnvMode1 <= cnvMode0;
		cnvIsNegative1 <= cnvIsNegative0;
		cnvEarlyOutType1 <= cnvEarlyOutType0;
		cnvU32ShiftAmount1 <= cnvU32ShiftAmount0;
		cnvInput1 <= cnvInput;
		frcNormalizedMantissa1 <= frcNormalizedMantissa0;

		case cnvMode0 is
			when U32_to_F =>
				if (cnvU32ShiftRight = '1') then
					cnvShiftedTemporary <= cnvInput srl to_integer(cnvU32ShiftAmount0 - 23);
				else
					cnvShiftedTemporary <= cnvInput sll to_integer(23 - cnvU32ShiftAmount0);
				end if;
			when F_Frc =>
				if (frcNormalizedMantissa0 = "00000000000000000000000") then
					if (cnvEarlyOutType0 = CnvNoEarlyOut) then
						cnvEarlyOutType1 <= CnvBelowMinEarlyOut;
					end if;
				end if;

				if (cnvIsNegative0 = '1') then
					tempMantissa := to_unsigned(16#00800000#, 24) - frcNormalizedMantissa0; -- Oneminus our mantissa bits from the implicit one value to invert them if this is a negative float
					cnvU32ShiftAmount1 <= CnvFrc_Cycle1(tempMantissa(22 downto 0) );
					frcNormalizedMantissa1 <= tempMantissa(22 downto 0);
				else
					cnvU32ShiftAmount1 <= CnvFrc_Cycle1(frcNormalizedMantissa0);
				end if;
			when others =>
				tempBuffer := "000000001" & signed(GetMantissa(cnvInput) );
				cnvShiftedTemporary <= unsigned(tempBuffer srl to_integer(cnvShiftAmount) );
		end case;
	end if;
end process CNVStage1;

-- Conversion (CNV) pipe process:
CNVStage2 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (cnvIsValid1 = '1') then
			case cnvMode1 is
				when F_Frc =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= '0' & -- The result of frc() is always positive, so hardcode the zero sign bit here
								std_logic_vector(CnvFrc_Cycle2(cnvU32ShiftAmount1, frcNormalizedMantissa1) ); -- This calculuates the float exponent and mantissa bits (30 downto 0)
						when CnvNaNEarlyOut =>
							OCNV <= X"7FFFFFFF"; -- This is +NAN, which is the correct result for an input of any of: +INF, -INF, +NAN, -NAN
						when others => --when CnvBelowMinEarlyOut =>
							OCNV <= X"00000000"; -- This is 0.0f
					end case;
				when F_to_U24_RoundNearestEven =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= std_logic_vector(CnvFloatToUInt24_RoundNE_Cycle2(signed(cnvShiftedTemporary) ) );
						when CnvNaNEarlyOut =>
							OCNV <= X"00000000";
						when CnvBelowMinEarlyOut =>
							OCNV <= X"00000000"; -- This is 0
						when CnvAboveMaxEarlyOut =>
							OCNV <= X"00FFFFFF"; -- This is 16777215
					end case;
				when F_to_I16_RoundNearestEven =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= X"0000" & std_logic_vector(CnvFloatToInt16_RoundNE_Cycle2(signed(cnvShiftedTemporary), cnvIsNegative1) );
						when CnvNaNEarlyOut =>
							OCNV <= X"00000000";
						when CnvBelowMinEarlyOut =>
							OCNV <= X"00008000"; -- This is -32768
						when CnvAboveMaxEarlyOut =>
							OCNV <= X"00007FFF"; -- This is 32767
					end case;
				when F_to_UNORM16 =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= X"0000" & std_logic_vector(CnvFloatToUNORM16_Cycle2(cnvShiftedTemporary) );
						when CnvNaNEarlyOut =>
							OCNV <= X"00000000";
						when CnvBelowMinEarlyOut =>
							OCNV <= X"00000000"; -- This is 0
						when CnvAboveMaxEarlyOut =>
							OCNV <= X"0000FFFF"; -- This is 65535
					end case;
				when F_to_UNORM8 =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= X"000000" & std_logic_vector(CnvFloatToUNORM8_Cycle2(cnvShiftedTemporary) );
						when CnvNaNEarlyOut =>
							OCNV <= X"00000000";
						when CnvBelowMinEarlyOut =>
							OCNV <= X"00000000"; -- This is 0
						when CnvAboveMaxEarlyOut =>
							OCNV <= X"000000FF"; -- This is 255
					end case;
				when F_to_Half =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= X"0000" & cnvIsNegative1 & std_logic_vector(CnvFloatToHalf_Cycle2(cnvInput1) );
						when CnvNaNEarlyOut =>
							OCNV <= X"0000" & cnvIsNegative1 & "11111" & "1111111111"; -- +/- NaN
						when CnvBelowMinEarlyOut =>
							OCNV <= X"0000" & cnvIsNegative1 & "00000" & "0000000000"; -- Saturate to +/- 0.0f
						when CnvAboveMaxEarlyOut =>
							OCNV <= X"0000" & cnvIsNegative1 & "11111" & "0000000000"; -- Saturate to +/- INF
					end case;
				when Half_to_F =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= cnvInput1(15) & std_logic_vector(CnvHalfToFloat_Cycle2(cnvInput1(14 downto 0) ) );
						when CnvNaNEarlyOut =>
							OCNV <= cnvInput1(15) & "11111111" & "11111111111111111111111"; -- +/- NaN
						when CnvBelowMinEarlyOut =>
							OCNV <= cnvInput1(15) & "00000000" & "00000000000000000000000"; -- +/- 0.0f
						when CnvAboveMaxEarlyOut =>
							OCNV <= cnvInput1(15) & "11111111" & "00000000000000000000000"; -- Saturate to +/- INF
					end case;
				when U32_to_F =>
					case cnvEarlyOutType1 is
						when CnvNoEarlyOut =>
							OCNV <= '0' & std_logic_vector(CnvU32ToFloat_Cycle2(cnvU32ShiftAmount1, cnvShiftedTemporary) );
						when others => -- 0x00000000 = 0.0f
							OCNV <= (others => '0');
					end case;
				when others =>
					OCNV <= (others => '0');
			end case;
		end if;
	end if;
end process CNVStage2;

end Behavioral;
