--------------------------------------------------------------------------------
-- Engineer:		Mike Field <hamster@snap.net.nz>
-- Description:		Converts VGA signals into DVID bitstreams.
--
--					'clk_x10' should be 10x clk_pixel.
--
--					'blank' should be asserted during the non-display
--					portions of the frame
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

entity dvid is
	Port ( clk_x10	: in STD_LOGIC;
		clk_pixel	: in STD_LOGIC;
		scanout_en	: in STD_LOGIC;
		red_p		: in STD_LOGIC_VECTOR(7 downto 0);
		green_p		: in STD_LOGIC_VECTOR(7 downto 0);
		blue_p		: in STD_LOGIC_VECTOR(7 downto 0);
		blank		: in STD_LOGIC;
		hsync		: in STD_LOGIC;
		vsync		: in STD_LOGIC;
		red_s		: out STD_LOGIC;
		green_s		: out STD_LOGIC;
		blue_s		: out STD_LOGIC;
		cl_s		: out STD_LOGIC);
end dvid;

architecture Behavioral of dvid is
	COMPONENT TDMS_encoder
	PORT(
		clk		: IN std_logic;
		data	: IN std_logic_vector(7 downto 0);
		c		: IN std_logic_vector(1 downto 0);
		blank	: IN std_logic;          
		encoded	: OUT std_logic_vector(9 downto 0)
	);
	END COMPONENT;

	ATTRIBUTE X_INTERFACE_INFO : STRING;
	ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

	ATTRIBUTE X_INTERFACE_INFO of clk_x10: SIGNAL is "xilinx.com:signal:clock:1.0 clk_x10 CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_x10: SIGNAL is "FREQ_HZ 251750000";

	ATTRIBUTE X_INTERFACE_INFO of clk_pixel: SIGNAL is "xilinx.com:signal:clock:1.0 clk_pixel CLK";
	ATTRIBUTE X_INTERFACE_PARAMETER of clk_pixel: SIGNAL is "FREQ_HZ 25175000";

	signal encoded_red, encoded_green, encoded_blue : std_logic_vector(9 downto 0);
	signal latched_red, latched_green, latched_blue : std_logic_vector(9 downto 0) := (others => '0');
	signal shift_red, shift_green, shift_blue : std_logic_vector(9 downto 0) := (others => '0');

	signal shift_clock : std_logic_vector(9 downto 0) := "0000011111";


	constant c_red		: std_logic_vector(1 downto 0) := (others => '0');
	constant c_green	: std_logic_vector(1 downto 0) := (others => '0');
	signal c_blue		: std_logic_vector(1 downto 0);

begin
	c_blue <= vsync & hsync;

	TDMS_encoder_red:	TDMS_encoder PORT MAP(clk => clk_pixel, data => red_p,   c => c_red,   blank => blank, encoded => encoded_red);
	TDMS_encoder_green:	TDMS_encoder PORT MAP(clk => clk_pixel, data => green_p, c => c_green, blank => blank, encoded => encoded_green);
	TDMS_encoder_blue:	TDMS_encoder PORT MAP(clk => clk_pixel, data => blue_p,  c => c_blue,  blank => blank, encoded => encoded_blue);

	process(clk_pixel)
	begin
		if rising_edge(clk_pixel) then 
			latched_red		<= encoded_red;
			latched_green	<= encoded_green;
			latched_blue	<= encoded_blue;
		end if;
	end process;

	process(clk_x10)
	begin
		if rising_edge(clk_x10) then
			if (scanout_en = '1') then
				red_s <= shift_red(0);
				green_s <= shift_green(0);
				blue_s <= shift_blue(0);
				cl_s <= shift_clock(0);
			else
				red_s <= '0';
				green_s <= '0';
				blue_s <= '0';
				cl_s <= '0';
			end if;

			if shift_clock = "0000011111" then
				shift_red   <= latched_red;
				shift_green <= latched_green;
				shift_blue  <= latched_blue;
			else
				shift_red   <= "0" & shift_red  (9 downto 1);
				shift_green <= "0" & shift_green(9 downto 1);
				shift_blue  <= "0" & shift_blue (9 downto 1);
			end if;

			shift_clock <= shift_clock(0) & shift_clock(9 downto 1);
		end if;
	end process;

end Behavioral;
