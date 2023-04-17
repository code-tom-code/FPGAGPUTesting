
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use work.FloatALU_Types.all;
use work.FloatCommon.all;
use work.FloatALU_CNV.all;

entity StandaloneFloatALU_CNV is
    Port (clk : in STD_LOGIC;

		-- Common ports shared across multiple stages:
		IN_A : in STD_LOGIC_VECTOR(31 downto 0);
		IN_MODE : in STD_LOGIC_VECTOR(2 downto 0); -- Generic "mode" that can be interpreted by different stages differently
		OCNV : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

		-- CNV pipe operates in 3 clock cycles. IN_MODE corresponds to the eConvertMode type.
		ICNV_GO : in STD_LOGIC
		);
end StandaloneFloatALU_CNV;

architecture Behavioral of StandaloneFloatALU_CNV is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

-- attribute KEEP : string;

-- Signals common to all pipes:
signal comAIsNeg : std_logic := '0';
signal comAIsNaN : std_logic := '0';
signal comSignedExponentA : signed(7 downto 0) := (others => '0');

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

begin

comAIsNeg <= IN_A(31);
comAIsNaN <= GetFloatIsNAN(f32(IN_A) );
comSignedExponentA <= GetSignedExponent(f32(IN_A) );

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
