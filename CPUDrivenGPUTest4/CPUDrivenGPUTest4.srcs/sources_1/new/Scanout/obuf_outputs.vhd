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
	Port (red_s : in STD_LOGIC;
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

begin
	-- Differential output buffers
	OBUFDS_red : OBUFDS port map ( O => out_red_p, OB => out_red_n, I => red_s );
	OBUFDS_green : OBUFDS port map ( O => out_green_p, OB => out_green_n, I => green_s );
	OBUFDS_blue : OBUFDS port map ( O => out_blue_p, OB => out_blue_n, I => blue_s );
	OBUFDS_cl : OBUFDS port map ( O => out_cl_p, OB => out_cl_n, I => cl_s );

end Behavioral;
