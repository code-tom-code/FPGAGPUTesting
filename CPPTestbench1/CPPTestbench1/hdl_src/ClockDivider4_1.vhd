library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClockDivider4_1 is
	Port (
		clkin100 : in STD_LOGIC;
		clkout25 : out STD_LOGIC := '0'
		);
end ClockDivider4_1;

architecture Behavioral of ClockDivider4_1 is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clkin100: SIGNAL is "xilinx.com:signal:clock:1.0 clkin100 CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clkin100: SIGNAL is "FREQ_HZ 10000000";

ATTRIBUTE X_INTERFACE_INFO of clkout25: SIGNAL is "xilinx.com:signal:clock:1.0 clkout25 CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clkout25: SIGNAL is "FREQ_HZ 2500000";

-- Master clock divider signal
signal currentClk : std_logic_vector(3 downto 0) := "0011";

begin

clkout25 <= currentClk(0);

	process(clkin100)
	begin
		if (rising_edge(clkin100) ) then
			currentClk <= currentClk(2 downto 0) & currentClk(3);
		end if;
	end process;

end Behavioral;
