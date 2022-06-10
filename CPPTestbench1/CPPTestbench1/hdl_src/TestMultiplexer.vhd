
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity TestMultiplexer is
    Port (clk : in STD_LOGIC;

		data_in : in STD_LOGIC_VECTOR(127 downto 0);
		selector : in STD_LOGIC_VECTOR(6 downto 0);
		data_out : out STD_LOGIC := '0'
		);
end TestMultiplexer;

architecture Behavioral of TestMultiplexer is

begin

process(clk)
begin
	if (rising_edge(clk) ) then
		data_out <= data_in(to_integer(unsigned(selector) ) );
	end if;
end process;

end Behavioral;
