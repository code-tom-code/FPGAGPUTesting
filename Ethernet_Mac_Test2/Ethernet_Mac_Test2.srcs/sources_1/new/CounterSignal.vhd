library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity CounterSignal is
	Port (
		clkin : in STD_LOGIC;

		readySignal : out STD_LOGIC := '0'
		);
end CounterSignal;

architecture Behavioral of CounterSignal is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clkin: SIGNAL is "xilinx.com:signal:clock:1.0 clkin CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clkin: SIGNAL is "FREQ_HZ 125000000";

signal ready : STD_LOGIC := '0';
signal counter : unsigned(3 downto 0) := (others => '0');

begin

	process(clkin)
	begin
		if (rising_edge(clkin) ) then
			if (ready = '1') then
				readySignal <= '1';
			else
				counter <= counter + 1;
				if (counter > 14) then
					ready <= '1';
				end if;
			end if;
		end if;
	end process;

end Behavioral;
