
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;
use work.FloatCommon.all;

entity StandaloneFloatALU_SPEC is
    Port (clk : in STD_LOGIC;

		-- Common ports shared across multiple stages:
		IN_A : in STD_LOGIC_VECTOR(31 downto 0);
		OSPEC : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		-- SPEC pipe operates in 14 clock cycles for RCP.
		ISPEC_GO : in STD_LOGIC
		);
end StandaloneFloatALU_SPEC;

architecture Behavioral of StandaloneFloatALU_SPEC is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

-- attribute KEEP : string;

type RcpLookupArrayType is array(0 to 15) of unsigned(15 downto 0);

constant RcpLookupTable_Offsets : RcpLookupArrayType := 
(
	X"FFC4", X"F0BE", X"E363", X"D76F", X"CCAD", X"C2F0", X"BA16", X"B201", X"AA97", X"A3C6", X"9D7A", X"97A6", X"923C", X"8D32", X"887E", X"8417"
);

constant RcpLookupTable_Slopes : RcpLookupArrayType := 
(
	X"F0F1", X"D62C", X"BFA1", X"AC77", X"9C0A", X"8DDB", X"8185", X"76BA", X"6D3B", X"64D4", X"5D5C", X"56B1", X"50B6", X"4B55", X"4679", X"4211"
);

type rcpPipelineStage is record
	pipeStageIsValid : std_logic;
	useEarlyOutBypass : std_logic;
	rcpSign : std_logic;
	rcpExponent : unsigned(7 downto 0);
	calculatedMantissa : unsigned(22 downto 0);
end record rcpPipelineStage;

type rcpPipelineArray is array(SPEC_CYCLES-1 downto 0) of rcpPipelineStage;

-- Signals common to all pipes:
signal comAIsINF : std_logic := '0';
signal comAIsNaN : std_logic := '0';
signal comAIsDenormal : std_logic := '0';
signal comRawExponentA : unsigned(7 downto 0) := (others => '0');
signal comASign : std_logic := '0';
signal comRawMantissaA : unsigned(22 downto 0) := (others => '0');

-- Reciprocal (RCP) pipe signals:
signal rcpPipeline : rcpPipelineArray;
signal rcpLookupSlope : unsigned(15 downto 0) := (others => '0');
signal rcpLookupOffset0 : unsigned(15 downto 0) := (others => '0');
signal rcpLookupOffset1 : unsigned(15 downto 0) := (others => '0');
signal slopeMultiply : unsigned(31 downto 0) := (others => '0');
signal rInitialGuess0 : unsigned(15 downto 0) := (others => '0');
signal rInitialGuess1 : unsigned(15 downto 0) := (others => '0');
signal rInitialGuess2 : unsigned(15 downto 0) := (others => '0');
signal rInitialGuess3 : unsigned(15 downto 0) := (others => '0');
signal sigma0TempProduct : unsigned(47 downto 0) := (others => '0');
signal rcpSigma0 : unsigned(31 downto 0) := (others => '0');
signal rcpSigma1 : unsigned(31 downto 0) := (others => '0');
signal rcpSigma2 : unsigned(31 downto 0) := (others => '0');
signal rcpSigma3 : unsigned(31 downto 0) := (others => '0');
signal rProduct : unsigned(47 downto 0) := (others => '0');
signal rRefined0 : unsigned(31 downto 0) := (others => '0');
signal rRefined1 : unsigned(31 downto 0) := (others => '0');
signal rRefined2 : unsigned(31 downto 0) := (others => '0');
signal rRefined3 : unsigned(31 downto 0) := (others => '0');
signal rcpSqrSigma0Product : unsigned(63 downto 0) := (others => '0');
signal rcpSqrSigma0 : unsigned(31 downto 0) := (others => '0');
signal rAccumProduct : unsigned(63 downto 0) := (others => '0');
signal rAccum : unsigned(31 downto 0) := (others => '0');
signal resultMantissa : unsigned(22 downto 0) := (others => '0');

begin

comAIsINF <= GetFloatIsINF(f32(IN_A) );
comAIsNaN <= GetFloatIsNAN(f32(IN_A) );
comAIsDenormal <= '1' when (GetRawExponent(f32(IN_A) ) = X"00") else '0';
comRawExponentA <= GetRawExponent(f32(IN_A) );
comASign <= GetFloatIsNegative(f32(IN_A) );
comRawMantissaA <= GetMantissa(f32(IN_A) );

-- Reciprocal (RCP) pipe process (cycle 1 of 14):
RCPStage0 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (ISPEC_GO = '1') then

			rcpPipeline(0).pipeStageIsValid <= '1';
			rcpPipeline(0).rcpSign <= comASign;

			if (oneF(30 downto 0) = unsigned(IN_A(30 downto 0) ) ) then -- Early out for rcp(1.0f) or rcp(-1.0f) = 1.0f
				rcpPipeline(0).useEarlyOutBypass <= '1';
				rcpPipeline(0).rcpExponent <= GetRawExponent(oneF);
				rcpPipeline(0).calculatedMantissa <= GetMantissa(oneF);
			elsif (comAIsDenormal = '1') then -- Early out for rcp(denormal) or rcp(0.0f) or rcp(-0.0f) = +/-INF
				rcpPipeline(0).useEarlyOutBypass <= '1';
				rcpPipeline(0).rcpExponent <= X"FF";
				rcpPipeline(0).calculatedMantissa <= (others => '0');
			elsif (comAIsNaN = '1') then -- Early out for rcp(NaN) = NaN
				rcpPipeline(0).useEarlyOutBypass <= '1';
				rcpPipeline(0).rcpExponent <= X"FF";
				rcpPipeline(0).calculatedMantissa <= (others => '1');
			elsif (comAIsINF = '1') then -- Early out for rcp(INF) or rcp(-INF) = +/- 0
				rcpPipeline(0).useEarlyOutBypass <= '1';
				rcpPipeline(0).rcpExponent <= (others => '0');
				rcpPipeline(0).calculatedMantissa <= (others => '0');
			elsif (comRawMantissaA = to_unsigned(0, 23) ) then -- Early out for powers of 2
				rcpPipeline(0).useEarlyOutBypass <= '1';
				rcpPipeline(0).rcpExponent <= to_unsigned(254, 8) - comRawExponentA; -- Note that the power of 2 case subtracts (254-x), whereas the non-power-of-2 case is (253-x)
				rcpPipeline(0).calculatedMantissa <= (others => '0');
			else -- Typical reciprocal case!
				rcpPipeline(0).useEarlyOutBypass <= '0';
				rcpPipeline(0).rcpExponent <= to_unsigned(253, 8) - comRawExponentA;
				rcpPipeline(0).calculatedMantissa <= comRawMantissaA;
			end if;
		else
			rcpPipeline(0).pipeStageIsValid <= '0';
		end if;

		-- Advance all pipeline stages for the RCP pipe
		for i in 1 to SPEC_CYCLES-1 loop
			rcpPipeline(i) <= rcpPipeline(i - 1);
		end loop;
	end if;
end process RCPStage0;

RCPStage1 : process(clk)
	variable LUTIndex : natural range 0 to 15;
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(0).pipeStageIsValid = '1' and rcpPipeline(0).useEarlyOutBypass = '0') then
			-- const uint16_t rInitialGuess = softfloat_approxRecip_1k0s[index] - ( (softfloat_approxRecip_1k1s[index] * (uint_fast32_t) eps) >> 20); // 16x32 multiply, 16-16 subtraction
			LUTIndex := to_integer(rcpPipeline(0).calculatedMantissa(22 downto 19) ); -- Take the 4 MSB from the mantissa and use that for our LUT index
			rcpLookupSlope <= RcpLookupTable_Slopes(LUTIndex);
			rcpLookupOffset0 <= RcpLookupTable_Offsets(LUTIndex);
		end if;
	end if;
end process RCPStage1;

RCPStage2 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(1).pipeStageIsValid = '1' and rcpPipeline(1).useEarlyOutBypass = '0') then
			-- const uint16_t rInitialGuess = softfloat_approxRecip_1k0s[index] - ( (softfloat_approxRecip_1k1s[index] * (uint_fast32_t) eps) >> 20); // 16x32 multiply, 16-16 subtraction
			slopeMultiply <= rcpLookupSlope * rcpPipeline(1).calculatedMantissa(18 downto 3);
			rcpLookupOffset1 <= rcpLookupOffset0;
		end if;
	end if;
end process RCPStage2;

RCPStage3 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(2).pipeStageIsValid = '1' and rcpPipeline(2).useEarlyOutBypass = '0') then
			-- const uint16_t rInitialGuess = softfloat_approxRecip_1k0s[index] - ( (softfloat_approxRecip_1k1s[index] * (uint_fast32_t) eps) >> 20); // 16x32 multiply, 16-16 subtraction
			rInitialGuess0 <= rcpLookupOffset1 - (slopeMultiply(31 downto 20) );
		end if;
	end if;
end process RCPStage3;

RCPStage4 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(3).pipeStageIsValid = '1' and rcpPipeline(3).useEarlyOutBypass = '0') then
			-- const uint32_t rcpSigma0 = ~(const uint_fast32_t) ( (rInitialGuess * (const uint_fast64_t) fixed_1_31) >> 7); // 16x32 multiply
			sigma0TempProduct <= (rInitialGuess0 * ('1' & rcpPipeline(3).calculatedMantissa & "00000000") ); -- Construct our 1.31 fixed point value by adding the hidden 1-bit and shifting left by 8
			rInitialGuess1 <= rInitialGuess0;
		end if;
	end if;
end process RCPStage4;

RCPStage5 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(4).pipeStageIsValid = '1' and rcpPipeline(4).useEarlyOutBypass = '0') then
			-- const uint32_t rcpSigma0 = ~(const uint_fast32_t) ( (rInitialGuess * (const uint_fast64_t) fixed_1_31) >> 7); // 16x32 multiply
			rcpSigma0 <= not sigma0TempProduct(38 downto 7); -- Shift right by 7 and truncate to 32 bits
			rInitialGuess2 <= rInitialGuess1;
		end if;
	end if;
end process RCPStage5;

RCPStage6 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(5).pipeStageIsValid = '1' and rcpPipeline(5).useEarlyOutBypass = '0') then
			-- uint_fast32_t rRefined = ( (uint_fast32_t) rInitialGuess << 16) + ( (rInitialGuess * (uint_fast64_t) rcpSigma0) >> 24); // 16x32 multiply, 32+24 addition
			rProduct <= rInitialGuess2 * rcpSigma0;
			rInitialGuess3 <= rInitialGuess2;
		end if;
	end if;
end process RCPStage6;

RCPStage7 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(6).pipeStageIsValid = '1' and rcpPipeline(6).useEarlyOutBypass = '0') then
			-- uint_fast32_t rRefined = ( (uint_fast32_t) rInitialGuess << 16) + ( (rInitialGuess * (uint_fast64_t) rcpSigma0) >> 24); // 16x32 multiply, 32+24 addition
			rRefined0 <= (rInitialGuess3 & X"0000") + (X"00" & rProduct(47 downto 24) );
		end if;
	end if;
end process RCPStage7;

RCPStage8 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(7).pipeStageIsValid = '1' and rcpPipeline(7).useEarlyOutBypass = '0') then
			-- const uint32_t rcpSqrSigma0 = ((uint_fast64_t) rcpSigma1 * rcpSigma1) >> 32; // 32x32 multiply
			rcpSqrSigma0Product <= (rcpSigma0 * rcpSigma0);
			rRefined1 <= rRefined0;
		end if;
	end if;
end process RCPStage8;

RCPStage9 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(8).pipeStageIsValid = '1' and rcpPipeline(8).useEarlyOutBypass = '0') then
			-- const uint32_t rcpSqrSigma0 = ((uint_fast64_t) rcpSigma1 * rcpSigma1) >> 32; // 32x32 multiply
			rcpSqrSigma0 <= rcpSqrSigma0Product(63 downto 32);
			rRefined2 <= rRefined1;
		end if;
	end if;
end process RCPStage9;

RCPStage10 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(9).pipeStageIsValid = '1' and rcpPipeline(9).useEarlyOutBypass = '0') then
			-- rAccum = rRefined + ( (uint32_t) rRefined * (uint_fast64_t) rcpSqrSigma0) >> 48; // 32x32 multiply, 32+16 add
			rAccumProduct <= rRefined2 * rcpSqrSigma0;
			rRefined3 <= rRefined2;
		end if;
	end if;
end process RCPStage10;

RCPStage11 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(10).pipeStageIsValid = '1' and rcpPipeline(10).useEarlyOutBypass = '0') then
			-- rAccum = rRefined + ( (uint32_t) rRefined * (uint_fast64_t) rcpSqrSigma0) >> 48; // 32x32 multiply, 32+16 add
			rAccum <= rRefined3 + (X"0000" & rAccumProduct(63 downto 48) );
		end if;
	end if;
end process RCPStage11;

RCPStage12 : process(clk)
	variable rLocal : unsigned(29 downto 0);
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(11).pipeStageIsValid = '1' and rcpPipeline(11).useEarlyOutBypass = '0') then
			rLocal := rAccum(30 downto 1) + 64; -- rAccum = (rAccum >> 1) + (1 << 6)
			resultMantissa <= rLocal(29 downto 7); -- resultMantissa = rAccum >> 7
		end if;
	end if;
end process RCPStage12;

-- Reciprocal (RCP) pipe process (cycle 14 of 14):
RCPStage13 : process(clk)
begin
	if (rising_edge(clk) ) then
		if (rcpPipeline(12).pipeStageIsValid = '1') then
			if (rcpPipeline(12).useEarlyOutBypass = '0') then
				OSPEC <= rcpPipeline(12).rcpSign & std_logic_vector(rcpPipeline(12).rcpExponent) & std_logic_vector(resultMantissa);
			else
				OSPEC <= rcpPipeline(12).rcpSign & std_logic_vector(rcpPipeline(12).rcpExponent) & std_logic_vector(rcpPipeline(12).calculatedMantissa);
			end if;
		end if;
	end if;
end process RCPStage13;

end Behavioral;
