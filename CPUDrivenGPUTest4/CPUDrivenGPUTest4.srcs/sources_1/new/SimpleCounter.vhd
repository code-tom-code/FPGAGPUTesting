library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity SimpleCounter is
	Port (
		clkin25 : in STD_LOGIC;

		ready : in STD_LOGIC;

		regId : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		portId : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0')
		);
end SimpleCounter;

architecture Behavioral of SimpleCounter is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clkin25: SIGNAL is "xilinx.com:signal:clock:1.0 clkin25 CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clkin25: SIGNAL is "FREQ_HZ 2500000";

signal counter : unsigned(9 downto 0) := (others => '0');

begin

regId <= std_logic_vector(counter(4 downto 0) );
portId <= std_logic_vector(counter(9 downto 5) );

	process(clkin25)
	begin
		if (rising_edge(clkin25) ) then
			if (ready = '1') then
				counter <= counter + 1;
			end if;
		end if;
	end process;

end Behavioral;
