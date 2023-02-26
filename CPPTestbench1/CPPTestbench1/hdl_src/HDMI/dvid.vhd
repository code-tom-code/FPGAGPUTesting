--------------------------------------------------------------------------------
-- Engineer:      Mike Field <hamster@snap.net.nz>
-- Description:   Converts VGA signals into DVID bitstreams.
--
--                'clk' and 'clk_n' should be 10x clk_pixel.
--
--                'blank' should be asserted during the non-display 
--                portions of the frame
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- For signed/unsigned

Library UNISIM;
use UNISIM.vcomponents.all;

entity dvid is
	Port (	clk       : in  STD_LOGIC;
			clk_n     : in  STD_LOGIC;
			clk_pixel : in  STD_LOGIC;
			red_p     : in  STD_LOGIC_VECTOR (7 downto 0);
			green_p   : in  STD_LOGIC_VECTOR (7 downto 0);
			blue_p    : in  STD_LOGIC_VECTOR (7 downto 0);
			blank     : in  STD_LOGIC; -- If blank is '0' then this is a video data period, otherwise it's a control/data period
			hsync     : in  STD_LOGIC; -- HSync is the CTL0 signal for the TMDS0 (blue) channel
			vsync     : in  STD_LOGIC; -- VSync is the CTL1 signal for the TMDS0 (blue) channel
			controlChannel0Blue : in STD_LOGIC_VECTOR(1 downto 0);
			controlChannel1Green : in STD_LOGIC_VECTOR(1 downto 0);
			controlChannel2Red : in STD_LOGIC_VECTOR(1 downto 0);
			guardBandEnable : in STD_LOGIC;
			guardBandType : in STD_LOGIC; -- 0: Video guard band. 1: Data island guard band.
			isTERC4Region : in STD_LOGIC; -- 0: Normal control/video region. 1: TERC4 encoded data island region.
			TERC4Character0 : in STD_LOGIC_VECTOR(3 downto 0);
			TERC4Character1 : in STD_LOGIC_VECTOR(3 downto 0);
			TERC4Character2 : in STD_LOGIC_VECTOR(3 downto 0);
			red_s     : out STD_LOGIC;
			green_s   : out STD_LOGIC;
			blue_s    : out STD_LOGIC;
			cl_s   : out STD_LOGIC;
			EncodedB : out std_logic_vector(9 downto 0) := (others => '0');
			EncodedG : out std_logic_vector(9 downto 0) := (others => '0');
			EncodedR : out std_logic_vector(9 downto 0) := (others => '0') );
end dvid;

architecture Behavioral of dvid is
	COMPONENT TDMS_encoder
	GENERIC(
		isGreenLane : boolean := false;
		isChannel0 : boolean := false
	);
	PORT(
		clk     : IN  std_logic;
		data    : IN  std_logic_vector(7 downto 0);
		c       : IN  std_logic_vector(1 downto 0);
		blank   : IN  std_logic;          
		guardBandEnable : IN std_logic;
		guardBandType : IN std_logic; -- 0: Video guard band. 1: Data island guard band.
		isTERC4Region : IN std_logic; -- 0: Normal control/video region. 1: TERC4 encoded data island region.
		TERC4Character : IN std_logic_vector(3 downto 0);
		encoded : OUT std_logic_vector(9 downto 0)
		);
	END COMPONENT;

	signal encoded_red, encoded_green, encoded_blue : std_logic_vector(9 downto 0);
	signal latched_red, latched_green, latched_blue : std_logic_vector(9 downto 0) := (others => '0');
	signal shift_red,   shift_green,   shift_blue   : std_logic_vector(9 downto 0) := (others => '0');
   
	signal shift_clock	: std_logic_vector(9 downto 0) := "0000011111";

begin
	EncodedB <= encoded_blue;
	EncodedG <= encoded_green;
	EncodedR <= encoded_red;
   
	TDMS_encoder_red:   TDMS_encoder GENERIC MAP (isGreenLane => false, isChannel0 => false) PORT MAP(clk => clk_pixel, data => red_p,  c => controlChannel2Red,   blank => blank, encoded => encoded_red, guardBandEnable => guardBandEnable, guardBandType => guardBandType, isTERC4Region => isTERC4Region, TERC4Character => TERC4Character2);
	TDMS_encoder_green: TDMS_encoder GENERIC MAP (isGreenLane => true, isChannel0 => false) PORT MAP(clk => clk_pixel, data => green_p, c => controlChannel1Green, blank => blank, encoded => encoded_green, guardBandEnable => guardBandEnable, guardBandType => guardBandType, isTERC4Region => isTERC4Region, TERC4Character => TERC4Character1);
	TDMS_encoder_blue:  TDMS_encoder GENERIC MAP (isGreenLane => false, isChannel0 => true) PORT MAP(clk => clk_pixel, data => blue_p,  c => controlChannel0Blue,  blank => blank, encoded => encoded_blue, guardBandEnable => guardBandEnable, guardBandType => guardBandType, isTERC4Region => isTERC4Region, TERC4Character => TERC4Character0);

	process(clk_pixel)
	begin
		if rising_edge(clk_pixel) then 
			latched_red   <= encoded_red;
			latched_green <= encoded_green;
			latched_blue  <= encoded_blue;
		end if;
	end process;

	process(clk)
	begin
		if rising_edge(clk) then 
			red_s <= shift_red(0);
			green_s <= shift_green(0);
			blue_s <= shift_blue(0);
			cl_s <= shift_clock(0);

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