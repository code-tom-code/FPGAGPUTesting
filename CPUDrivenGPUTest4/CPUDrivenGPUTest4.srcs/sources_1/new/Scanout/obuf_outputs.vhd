library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity obuf_outputs is
	Port (clk : in STD_LOGIC;
		red_s : in STD_LOGIC;
		green_s : in STD_LOGIC;
		blue_s : in STD_LOGIC;
		cl_s : in STD_LOGIC;

		out_red_p : out STD_LOGIC;
		out_red_n : out STD_LOGIC;

		out_green_p : out STD_LOGIC;
		out_green_n : out STD_LOGIC;

		out_blue_p : out STD_LOGIC;
		out_blue_n : out STD_LOGIC;

		out_cl_p : out STD_LOGIC;
		out_cl_n : out STD_LOGIC
		);
end obuf_outputs;

architecture Behavioral of obuf_outputs is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
ATTRIBUTE X_INTERFACE_MODE : STRING;
ATTRIBUTE FSM_ENCODING : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk333_250 CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 251750000";

-- Adding one clock cycle of buffering to help meet timing more easily:
signal red_buffer : STD_LOGIC := '0';
signal green_buffer : STD_LOGIC := '0';
signal blue_buffer : STD_LOGIC := '0';
signal cl_buffer : STD_LOGIC := '0';

begin

	-- Differential output buffers
	OBUFDS_red : OBUFDS port map ( O => out_red_p, OB => out_red_n, I => red_buffer );
	OBUFDS_green : OBUFDS port map ( O => out_green_p, OB => out_green_n, I => green_buffer );
	OBUFDS_blue : OBUFDS port map ( O => out_blue_p, OB => out_blue_n, I => blue_buffer );
	OBUFDS_cl : OBUFDS port map ( O => out_cl_p, OB => out_cl_n, I => cl_buffer );

	mainBuffer: process(clk)
	begin
		if (rising_edge(clk) ) then
			red_buffer <= red_s;
			green_buffer <= green_s;
			blue_buffer <= blue_s;
			cl_buffer <= cl_s;
		end if;
	end process mainBuffer;

end Behavioral;
