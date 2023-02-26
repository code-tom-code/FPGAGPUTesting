library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- For signed/unsigned

Library UNISIM;
use UNISIM.vcomponents.all;

entity HDMIScanout is
	Port (	clk       : in  STD_LOGIC;
			clk_n     : in  STD_LOGIC;

			red_s     : out STD_LOGIC;
			green_s   : out STD_LOGIC;
			blue_s    : out STD_LOGIC;
			cl_s   : out STD_LOGIC;
			DBG_PixelR : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
			DBG_PixelG : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
			DBG_PixelB : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
			EncodedB : out std_logic_vector(9 downto 0) := (others => '0');
			EncodedG : out std_logic_vector(9 downto 0) := (others => '0');
			EncodedR : out std_logic_vector(9 downto 0) := (others => '0');
			DBG_ScanX : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
			DBG_ScanY : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0')
			);
end HDMIScanout;

architecture Behavioral of HDMIScanout is
	COMPONENT ScanOut
	Generic (
		-- Determines whether or not HDMI support is included.
		-- If this is "false", then we'll fall back to using DVI-D instead.
		-- Note that the use of HDMI here is for educational purposes only and you *may not* use this
		-- IP in any device or product with HDMI enabled unless you possess a valid license to do so!
		Use_HDMI : boolean := false
	);
	PORT(
		clk : in STD_LOGIC;
		pixelClk : out STD_LOGIC := '0';

	-- Misc interface begin
		outXCoord : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0'); -- 0 to 639
		outYCoord : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0'); -- 0 to 479
	-- Misc interface end

	-- VGA interface begin
		VSyncActivePolarity : in STD_LOGIC;
		HSyncActivePolarity : in STD_LOGIC;
		vsync : out STD_LOGIC := '0';
		hsync : out STD_LOGIC := '0';
		blank : out STD_LOGIC := '0';
		outR : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		outG : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		outB : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	-- VGA interface end

	-- HDMI signals begin
		guardBandEnable : out STD_LOGIC := '0';
		guardBandType : out STD_LOGIC := '0'; -- 0: Video guard band. 1: Data island guard band.

		-- Preambles table:
		-- No preamble (control period): "00", "00"
		-- Video data period preamble: "01", "00"
		-- Data island period preamble: "01", "01"
		controlChannel0Blue : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		controlChannel1Green : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		controlChannel2Red : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

		isTERC4Region : out STD_LOGIC := '0'; -- 0: Normal control/video region. 1: TERC4 encoded data island region.
		TERC4Character0 : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		TERC4Character1 : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		TERC4Character2 : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
	-- HDMI signals end

	-- Debug signals
		DBG_InternalScanX : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		DBG_InternalScanY : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0')
		);
	END COMPONENT;

	COMPONENT dvid
	PORT(
		clk       : in  STD_LOGIC;
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
		EncodedR : out std_logic_vector(9 downto 0) := (others => '0')
		);
	END COMPONENT;

	-- VGA interface begin
		signal Cvsync : STD_LOGIC := '0';
		signal Chsync : STD_LOGIC := '0';
		signal Cblank : STD_LOGIC := '0';
		signal CoutR : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		signal CoutG : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		signal CoutB : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	-- VGA interface end

	-- HDMI signals begin
		signal CguardBandEnable : STD_LOGIC := '0';
		signal CguardBandType : STD_LOGIC := '0'; -- 0: Video guard band. 1: Data island guard band.
		signal CisTERC4Region : STD_LOGIC := '0'; -- 0: Normal control/video region. 1: TERC4 encoded data island region.
		signal CTERC4Character0 : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		signal CTERC4Character1 : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		signal CTERC4Character2 : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		signal CcontrolChannel0Blue : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		signal CcontrolChannel1Green : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		signal CcontrolChannel2Red : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		signal CpixelClk : STD_LOGIC := '0';
	-- HDMI signals end

begin

	ScanOutInst : ScanOut	generic map(Use_HDMI => true)
							port map(clk => clk, pixelClk => CpixelClk, VSyncActivePolarity => '0', HSyncActivePolarity => '0',
								vsync => Cvsync, hsync => Chsync, blank => Cblank,
								outR => CoutR, outG => CoutG, outB => CoutB,
								guardBandEnable => CguardBandEnable, guardBandType => CguardBandType,
								controlChannel0Blue => CcontrolChannel0Blue, controlChannel1Green => CcontrolChannel1Green, controlChannel2Red => CcontrolChannel2Red, 
								isTERC4Region => CisTERC4Region, 
								TERC4Character0 => CTERC4Character0, TERC4Character1 => CTERC4Character1, TERC4Character2 => CTERC4Character2,
								DBG_InternalScanX => DBG_ScanX, DBG_InternalScanY => DBG_ScanY);

	dvidInst : dvid port map(clk => clk, clk_n => clk_n, clk_pixel => CpixelClk, 
							red_s => red_s, green_s => green_s, blue_s => blue_s, cl_s => cl_s, 
							EncodedB => EncodedB, EncodedG => EncodedG, EncodedR => EncodedR,
							controlChannel0Blue => CcontrolChannel0Blue, controlChannel1Green => CcontrolChannel1Green, controlChannel2Red => CcontrolChannel2Red, 
							red_p => CoutR, green_p => CoutG, blue_p => CoutB,
							vsync => Cvsync, hsync => Chsync, blank => Cblank,
							guardBandEnable => CguardBandEnable, guardBandType => CguardBandType,
							isTERC4Region => CisTERC4Region, 
							TERC4Character0 => CTERC4Character0, TERC4Character1 => CTERC4Character1, TERC4Character2 => CTERC4Character2);

	process(CpixelClk)
	begin
		if rising_edge(CpixelClk) then 
			DBG_PixelR <= CoutR;
			DBG_PixelG <= CoutG;
			DBG_PixelB <= CoutB;
		end if;
	end process;
   
end Behavioral; 