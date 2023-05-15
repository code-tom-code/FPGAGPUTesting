
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity GPRQuad is
    Port (clk : in STD_LOGIC;

		-- Port A is our first read port:
		portA_en : in STD_LOGIC;
		portA_regType : in STD_LOGIC_VECTOR(1 downto 0); -- Register type: v# = 0 (input reg), o# = 1 (output reg), r# = 2 (GPR), x# = 3 (special temporary reg)
		portA_regIdx : in STD_LOGIC_VECTOR(2 downto 0); -- Register index (unsigned int from 0 to 7)
		portA_regChan : in STD_LOGIC_VECTOR(1 downto 0); -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel
		portA_readOutData : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');

		-- Port B is our second read port:
		portB_en : in STD_LOGIC;
		portB_regType : in STD_LOGIC_VECTOR(1 downto 0); -- Register type: v# = 0 (input reg), o# = 1 (output reg), r# = 2 (GPR), x# = 3 (special temporary reg)
		portB_regIdx : in STD_LOGIC_VECTOR(2 downto 0); -- Register index (unsigned int from 0 to 7)
		portB_regChan : in STD_LOGIC_VECTOR(1 downto 0); -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel
		portB_readOutData : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');

		-- Port W is our write port:
		portW_en : in STD_LOGIC;
		portW_regType : in STD_LOGIC_VECTOR(1 downto 0); -- Register type: v# = 0 (input reg), o# = 1 (output reg), r# = 2 (GPR), x# = 3 (special temporary reg)
		portW_regIdx : in STD_LOGIC_VECTOR(2 downto 0); -- Register index (unsigned int from 0 to 7)
		portW_regChan : in STD_LOGIC_VECTOR(1 downto 0); -- 2 bit uint to select X (0), Y (1), Z (2), or W (3) channel
		portW_writeInData : in STD_LOGIC_VECTOR(127 downto 0)
		);
end GPRQuad;

architecture Behavioral of GPRQuad is

signal reg_v0 : unsigned(511 downto 0);
signal reg_v1 : unsigned(511 downto 0);
signal reg_v2 : unsigned(511 downto 0);
signal reg_v3 : unsigned(511 downto 0);

signal reg_oPos : unsigned(511 downto 0);
signal reg_oD0 : unsigned(511 downto 0);
signal reg_oD1 : unsigned(511 downto 0);
signal reg_oT0 : unsigned(511 downto 0);

signal reg_r0 : unsigned(511 downto 0);
signal reg_r1 : unsigned(511 downto 0);
signal reg_r2 : unsigned(511 downto 0);
signal reg_r3 : unsigned(511 downto 0);
signal reg_r4 : unsigned(511 downto 0);
signal reg_r5 : unsigned(511 downto 0);
signal reg_r6 : unsigned(511 downto 0);
signal reg_r7 : unsigned(511 downto 0);

signal reg_x0 : unsigned(511 downto 0);

impure function ReadRegister(regType : unsigned(1 downto 0);
	regIdx : unsigned(2 downto 0) ) return unsigned is
begin
	case regType is
		when "00" =>
			case regIdx(1 downto 0) is
				when "01" =>
					return reg_v1;
				when "10" =>
					return reg_v2;
				when "11" =>
					return reg_v3;
				when others =>
					return reg_v0;
			end case;
		when "01" =>
			case regIdx(1 downto 0) is
				when "00" =>
					return reg_oPos;
				when "01" =>
					return reg_oD0;
				when "10" =>
					return reg_oD1;
				when others =>
					return reg_oT0;
			end case;
		when "10" =>
			case regIdx is
				when "001" =>
					return reg_r1;
				when "010" =>
					return reg_r2;
				when "011" =>
					return reg_r3;
				when "100" =>
					return reg_r4;
				when "101" =>
					return reg_r5;
				when "110" =>
					return reg_r6;
				when "111" =>
					return reg_r7;
				when others =>
					return reg_r0;
			end case;
		when others =>
			return reg_x0;
	end case;
end function;

begin

-- Read port A:
process(clk)
begin
	if (rising_edge(clk) ) then
		if (portA_en = '1') then
			case portA_regChan is
				when "00" =>
					portA_readOutData <= std_logic_vector(ReadRegister(unsigned(portA_regType), unsigned(portA_regIdx) )(127 downto 0) );
				when "01" =>
					portA_readOutData <= std_logic_vector(ReadRegister(unsigned(portA_regType), unsigned(portA_regIdx) )(255 downto 128) );
				when "10" =>
					portA_readOutData <= std_logic_vector(ReadRegister(unsigned(portA_regType), unsigned(portA_regIdx) )(383 downto 256) );
				when "11" =>
					portA_readOutData <= std_logic_vector(ReadRegister(unsigned(portA_regType), unsigned(portA_regIdx) )(511 downto 384) );
				when others =>
			end case;
		end if;
	end if;
end process;

-- Read port B:
process(clk)
begin
	if (rising_edge(clk) ) then
		if (portB_en = '1') then
			case portB_regChan is
				when "00" =>
					portB_readOutData <= std_logic_vector(ReadRegister(unsigned(portB_regType), unsigned(portB_regIdx) )(127 downto 0) );
				when "01" =>
					portB_readOutData <= std_logic_vector(ReadRegister(unsigned(portB_regType), unsigned(portB_regIdx) )(255 downto 128) );
				when "10" =>
					portB_readOutData <= std_logic_vector(ReadRegister(unsigned(portB_regType), unsigned(portB_regIdx) )(383 downto 256) );
				when "11" =>
					portB_readOutData <= std_logic_vector(ReadRegister(unsigned(portB_regType), unsigned(portB_regIdx) )(511 downto 384) );
				when others =>
			end case;
		end if;
	end if;
end process;

-- Write port W:
process(clk)
	procedure WriteRegister(signal regType : in std_logic_vector(1 downto 0);
		signal regIdx : in std_logic_vector(2 downto 0);
		signal newRegWriteData : in std_logic_vector(127 downto 0);
		constant upperRange : in integer;
		constant lowerRange : in integer) is
	begin
		case regType is
			when "00" =>
				case regIdx(1 downto 0) is
					when "01" =>
						reg_v1(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when "10" =>
						reg_v2(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when "11" =>
						reg_v3(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when others =>
						reg_v0(upperRange downto lowerRange) <= unsigned(newRegWriteData);
				end case;
			when "01" =>
				case regIdx(1 downto 0) is
					when "00" =>
						reg_oPos(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when "01" =>
						reg_oD0(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when "10" =>
						reg_oD1(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when others =>
						reg_oT0(upperRange downto lowerRange) <= unsigned(newRegWriteData);
				end case;
			when "10" =>
				case regIdx is
					when "001" =>
						reg_r1(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when "010" =>
						reg_r2(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when "011" =>
						reg_r3(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when "100" =>
						reg_r4(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when "101" =>
						reg_r5(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when "110" =>
						reg_r6(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when "111" =>
						reg_r7(upperRange downto lowerRange) <= unsigned(newRegWriteData);
					when others =>
						reg_r0(upperRange downto lowerRange) <= unsigned(newRegWriteData);
				end case;
			when others =>
				reg_x0(upperRange downto lowerRange) <= unsigned(newRegWriteData);
		end case;
	end WriteRegister;
begin
	if (rising_edge(clk) ) then
		if (portW_en = '1') then
			case portW_regChan is
				when "00" =>
					WriteRegister(portW_regType, portW_regIdx, portW_writeInData, 127, 0);
				when "01" =>
					WriteRegister(portW_regType, portW_regIdx, portW_writeInData, 255, 128);
				when "10" =>
					WriteRegister(portW_regType, portW_regIdx, portW_writeInData, 383, 256);
				when "11" =>
					WriteRegister(portW_regType, portW_regIdx, portW_writeInData, 511, 384);
				when others =>
			end case;
		end if;
	end if;
end process;

end Behavioral;
