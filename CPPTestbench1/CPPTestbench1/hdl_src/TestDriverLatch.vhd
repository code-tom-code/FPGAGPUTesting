library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity TestDriverLatch is
    Port (clk : in STD_LOGIC;

		-- External signals so that our IP doesn't get all optimized away:
		EXT_Cmd : in STD_LOGIC_VECTOR(7 downto 0);
		EXT_Cmd_Out : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

		Cmd_Data : in STD_LOGIC_VECTOR(1 downto 0)
		);
end TestDriverLatch;

architecture Behavioral of TestDriverLatch is

signal bufferedOutput : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

begin

-- Main state machine process:
process(clk)
begin
	if (rising_edge(clk) ) then
		if (EXT_Cmd(7) = '1') then
			bufferedOutput <= Cmd_Data;
		elsif (EXT_Cmd(6) = '1') then
			EXT_Cmd_Out <= bufferedOutput;
		end if;
	end if;
end process;

end Behavioral;
