
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux16 is
	Generic ( BIT_WIDTH : positive := 32
	);
    Port (
		IN_0 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_1 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_2 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_3 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_4 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_5 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_6 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_7 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_8 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_9 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_10 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_11 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_12 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_13 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_14 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_15 : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
		IN_SELECT : in STD_LOGIC_VECTOR(3 downto 0);

		OUT_MUX : out STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0) := (others => '0')
	);
end Mux16;

architecture Behavioral of Mux16 is

begin

MuxProcess : process(IN_SELECT, IN_0, IN_1, IN_2, IN_3, IN_4, IN_5, IN_6, IN_7, IN_8, IN_9, IN_10, IN_11, IN_12, IN_13, IN_14, IN_15)
begin
	case IN_SELECT is
		when "0000" => OUT_MUX <= IN_0;
		when "0001" => OUT_MUX <= IN_1;
		when "0010" => OUT_MUX <= IN_2;
		when "0011" => OUT_MUX <= IN_3;
		when "0100" => OUT_MUX <= IN_4;
		when "0101" => OUT_MUX <= IN_5;
		when "0110" => OUT_MUX <= IN_6;
		when "0111" => OUT_MUX <= IN_7;
		when "1000" => OUT_MUX <= IN_8;
		when "1001" => OUT_MUX <= IN_9;
		when "1010" => OUT_MUX <= IN_10;
		when "1011" => OUT_MUX <= IN_11;
		when "1100" => OUT_MUX <= IN_12;
		when "1101" => OUT_MUX <= IN_13;
		when "1110" => OUT_MUX <= IN_14;
		when others => OUT_MUX <= IN_15;
	end case;
end process MuxProcess;

end Behavioral;
