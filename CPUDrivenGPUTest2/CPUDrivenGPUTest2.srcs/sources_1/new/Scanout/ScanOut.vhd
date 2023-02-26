library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity ScanOut is
	Generic (
		-- Determines whether or not HDMI support is included.
		-- If this is "false", then we'll fall back to using DVI-D instead.
		-- Note that the use of HDMI here is for educational purposes only and you *may not* use this
		-- IP in any device or product with HDMI enabled unless you possess a valid license to do so!
		Use_HDMI : boolean := false
	);
	Port (clk_x10 : in STD_LOGIC;
		pixelClk : out STD_LOGIC := '0';

	-- Command Processor interfaces begin
		CMD_BaseRenderTargetAddr : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_ScanoutEnable : in STD_LOGIC;
		CMD_InvertOutputColor : in STD_LOGIC;
		CMD_OutputColorChannels : in STD_LOGIC_VECTOR(8 downto 0);
	-- Command Processor interfaces end

	-- Misc interface begin
		outXCoord : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0'); -- 0 to 639
		outYCoord : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0'); -- 0 to 479
	-- Misc interface end

	-- Memory Controller FIFO interface begin
		-- DRAM read requests FIFO:
		MEM_ScanoutReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
        MEM_ScanoutReadRequestsFIFO_full : in STD_LOGIC;
        MEM_ScanoutReadRequestsFIFO_wr_en : out STD_LOGIC := '0';

		-- DRAM read responses FIFO:
		MEM_ScanoutReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR(256-1 downto 0);
        MEM_ScanoutReadResponsesFIFO_empty : in STD_LOGIC;
        MEM_ScanoutReadResponsesFIFO_rd_en : out STD_LOGIC := '0';
	-- Memory Controller FIFO interface end

	-- VGA interface begin
		VSyncActivePolarity : in STD_LOGIC;
		HSyncActivePolarity : in STD_LOGIC;
		out_scanout_enable : out STD_LOGIC := '0';
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
		DBG_ScanoutLoadProcess_State : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_InternalScanX : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		DBG_InternalScanY : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0')
		);
end ScanOut;

architecture Behavioral of ScanOut is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk_x10: SIGNAL is "xilinx.com:signal:clock:1.0 clk_x10 CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk_x10: SIGNAL is "FREQ_HZ 251750000";

ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO FULL";

ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadResponsesFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadResponsesFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses RD_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_ScanoutReadResponsesFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses EMPTY";

type loadProcessState is
(
	loadProcessInit, -- 0
	waitForEmptyCacheLine, -- 1
	readSendSecondAddr, -- 2
	waitForMemRead, -- 3
	waitForMemRead2, -- 4
	waitForMemRead3, -- 5
	waitForCacheLineFill -- 6
);

constant NullPacketHeader : unsigned(31 downto 0) := X"00000000"; -- Format is CCLLVVTT (where "T" is PacketType, "V" is version, "L" is Length, and "C" is the header checksum)
constant NullSubpacket0 : unsigned(63 downto 0) := X"0000000000000000"; -- Format is CCXXXXXXXXXXXXXX (where "C" is the subpacket data checksum and "X" is the subpacket data bytes)
constant NullSubpacket1 : unsigned(63 downto 0) := X"0000000000000000";
constant NullSubpacket2 : unsigned(63 downto 0) := X"0000000000000000";
constant NullSubpacket3 : unsigned(63 downto 0) := X"0000000000000000";

constant AVIInfoHeader : unsigned(31 downto 0) := X"E40D0282"; -- Format is CCLLVVTT (where "T" is PacketType, "V" is version, "L" is Length, and "C" is the header checksum)
constant AVIInfoSubpacket0 : unsigned(63 downto 0) := X"E7000001881810BE"; -- Format is CCXXXXXXXXXXXXXX (where "C" is the subpacket data checksum and "X" is the subpacket data bytes)
constant AVIInfoSubpacket1 : unsigned(63 downto 0) := X"0000000000000000";
constant AVIInfoSubpacket2 : unsigned(63 downto 0) := X"0000000000000000";
constant AVIInfoSubpacket3 : unsigned(63 downto 0) := X"0000000000000000";

signal loadState : loadProcessState := loadProcessInit;
signal loadCacheLineNum : unsigned(2 downto 0) := (others => '0');

signal lineNumberY : unsigned(9 downto 0) := (others => '0'); -- stores values from 0 to 1024, but we only need from 0 to 525
signal pixelNumberX : unsigned(9 downto 0) := (others => '0'); -- stores values from 0 to 1024, but we only need from 0 to 800
signal frameNumber : unsigned(9 downto 0) := (others => '0');
signal clockDividerCounter10 : unsigned(3 downto 0) := (others => '0');

-- Cached command signals:
signal scanoutEnable_lastCycle : std_logic := '0';
signal scanoutEnable : std_logic := '0';
signal BaseRenderTargetAddr_lastCycle : STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
signal BaseRenderTargetAddr : STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
signal invertOutputColor : std_logic := '0';
signal outputColorChannels : unsigned(8 downto 0) := "010001000";

-- Let's cache a few DRAM lines ahead:
-- 0 lines ahead:
signal currentCachedLine : unsigned(511 downto 0) := (others => '0');
signal currentCachedLineAddr : unsigned(29 downto 0) := (others => '0');

-- 1 lines ahead:
signal nextCachedLine : unsigned(511 downto 0) := (others => '0');
signal nextCachedLineAddr : unsigned(29 downto 0) := (others => '0');

-- 2 lines ahead:
signal loadingCachedLine : unsigned(511 downto 0) := (others => '0');
signal loadingCachedLineOffset : unsigned(29 downto 0) := (others => '0');
signal loadingLineLoaded : std_logic := '0';
signal loadingLineReady : std_logic := '0';

-- Converts from scan-coordinates [0, 800] to framebuffer coordinates [0, 640]
pure function GetXCoord(pixelNumberX : unsigned(9 downto 0) ) return unsigned is
begin
	return pixelNumberX - 48;
end function;

-- Converts from scan-coordinates [0, 525] to framebuffer coordinates [0, 480]
pure function GetYCoord(lineNumberY : unsigned(9 downto 0) ) return unsigned is
begin
	return lineNumberY - 33;
end function;

pure function IsCurrentPixelBlanked(pixelNumberX : unsigned(9 downto 0); lineNumberY : unsigned(9 downto 0) ) return boolean is
begin
	if (lineNumberY >= 35 and lineNumberY < 515 and pixelNumberX >= 48 and pixelNumberX < 688) then
		return false;
	else
		return true;
	end if;
end function;

pure function GetPixelColor(RGBA : unsigned(31 downto 0); colorSwizzle : unsigned(2 downto 0); invertColor : std_logic) return unsigned is
	variable tempColor : unsigned(7 downto 0);
begin
	case colorSwizzle is
		when "000" =>
			tempColor := RGBA(7 downto 0);
		when "001" =>
			tempColor := RGBA(15 downto 8);
		when "010" =>
			tempColor := RGBA(23 downto 16);
		when "011" =>
			tempColor := RGBA(31 downto 24);
		when "100" =>
			tempColor := "00000000";
		when others =>
			tempColor := "11111111";
	end case;

	if (invertColor = '0') then
		return tempColor;
	else
		return 255 - tempColor;
	end if;
end function;

-- Note that the HDMI spec considers the guard bands to be a part of the video data period, but we do not consider guard bands or preambles to be a part of the period.
pure function IsVideoDataRegion(pixelNumberX : unsigned(9 downto 0); lineNumberY : unsigned(9 downto 0) ) return boolean is
begin
	return not IsCurrentPixelBlanked(pixelNumberX, lineNumberY);
end function;

pure function IsVideoLeadingGuardBand(pixelNumberX : unsigned(9 downto 0); lineNumberY : unsigned(9 downto 0) ) return boolean is
begin
	if (Use_HDMI) then
		return IsVideoDataRegion(pixelNumberX + 2, lineNumberY);
	else
		return false; -- In DVI-D there are no guard band characters in the control period.
	end if;
end function;

pure function IsVideoLeadingPreamble(pixelNumberX : unsigned(9 downto 0); lineNumberY : unsigned(9 downto 0) ) return boolean is
begin
	if (Use_HDMI) then
		return IsVideoDataRegion(pixelNumberX + 10, lineNumberY);
	else
		return false; -- DVI-D has no preamble characters in its control region.
	end if;
end function;

-- Note that the HDMI spec considers the guard bands to be a part of the data island period, but we do not consider guard bands or preambles to be a part of the period.
-- 705, 706, 707, 708, 709, 710 // Rest period
-- 711, 712, 713, 714, 715, 716, 717, 718 // Preamble
-- 719, 720 // Leading guard band
-- 721, "Go bit" and byte 0
-- 721, 722, 723, 724, 725, 726, 727, 728, // First 8 data bytes
-- 729, 730, 731, 732, 733, 734, 735, 736, // Second 8 data bytes
-- 737, 738, 739, 740, 741, 742, 743, 744, // Third 8 data bytes
-- 745, 746, 747, 748, 749, 750, 751, 752, // Last 8 data bytes
-- 753, 754 // Trailing guard band
pure function IsDataIslandRegion(pixelNumberX : unsigned(9 downto 0); lineNumberY : unsigned(9 downto 0) ) return boolean is
begin
	if (Use_HDMI) then
		if (lineNumberY = 1 and pixelNumberX >= 721 and pixelNumberX < 753) then
			return true;
		else
			return false;
		end if;
	else
		return false; -- DVI-D has no support for data islands in the control region.
	end if;
end function;

-- It's only safe to call this function if IsDataIslandRegion() has already returned true!
pure function GetDataIslandRegionByteIndex(pixelNumberX : unsigned(9 downto 0) ) return unsigned is
begin
	return pixelNumberX - 721;
end function;

pure function IsDataIslandRegionFirstCharacter(pixelNumberX : unsigned(9 downto 0); lineNumberY : unsigned(9 downto 0) ) return std_logic is
begin
	if (lineNumberY = 1 and pixelNumberX = 721) then
		return '1';
	else
		return '0';
	end if;
end function;

pure function IsDataIslandGuardBand(pixelNumberX : unsigned(9 downto 0); lineNumberY : unsigned(9 downto 0) ) return boolean is
begin
	if (Use_HDMI) then
		if (lineNumberY = 1) then
			if (pixelNumberX = 719 or pixelNumberX = 720 or -- Leading guard band
				pixelNumberX = 753 or pixelNumberX = 754) then -- Trailing guard band
				return true;
			end if;
		end if;
	end if;

	return false;
end function;

pure function IsDataIslandLeadingPreamble(pixelNumberX : unsigned(9 downto 0); lineNumberY : unsigned(9 downto 0) ) return boolean is
begin
	return IsDataIslandRegion(pixelNumberX + 10, lineNumberY);
end function;

pure function IsVSyncRegion(lineNumberY : unsigned(9 downto 0) ) return std_logic is
begin
	if (lineNumberY < 2) then
		return '1';
	else
		return '0';
	end if;
end function;

pure function IsHSyncRegion(pixelNumberX : unsigned(9 downto 0) ) return std_logic is
begin
	if (pixelNumberX >= 704) then
		return '1';
	else
		return '0';
	end if;
end function;

pure function GetTERC4CharacterChannel0(hsync : std_Logic; vsync : std_logic; isTERC4Region : std_logic; packetHeaderBits : std_logic; goSignal : std_logic) return std_logic_vector is
begin
	if (isTERC4Region = '1') then
		return goSignal & packetHeaderBits & vsync & hsync;
	else
		return '1' & '1' & vsync & hsync;
	end if;
end function;

pure function GetTERC4CharacterChannel1(subpacket0even : std_logic; subpacket1even : std_logic; subpacket2even : std_logic; subpacket3even : std_logic) return std_logic_vector is
begin
	return subpacket3even & subpacket2even & subpacket1even & subpacket0even;
end function;

pure function GetTERC4CharacterChannel2(subpacket0odd : std_logic; subpacket1odd : std_logic; subpacket2odd : std_logic; subpacket3odd : std_logic) return std_logic_vector is
begin
	return subpacket3odd & subpacket2odd & subpacket1odd & subpacket0odd;
end function;

begin

DBG_ScanoutLoadProcess_State <= std_logic_vector(to_unsigned(loadProcessState'pos(loadState), 4) );
invertOutputColor <= CMD_InvertOutputColor;
outputColorChannels <= unsigned(CMD_OutputColorChannels);

out_scanout_enable <= scanoutEnable;

	inputBufferingProcess : process(clk_x10)
	begin
		if (rising_edge(clk_x10) ) then
			scanoutEnable_lastCycle <= CMD_ScanoutEnable;
			scanoutEnable <= scanoutEnable_lastCycle and CMD_ScanoutEnable;

			BaseRenderTargetAddr_lastCycle <= CMD_BaseRenderTargetAddr;
			BaseRenderTargetAddr <= BaseRenderTargetAddr_lastCycle and CMD_BaseRenderTargetAddr;
		end if;
	end process inputBufferingProcess;

	pixelClkProcess : process(clk_x10)
	begin
		if (rising_edge(clk_x10) ) then
			pixelClk <= '0';
			if (clockDividerCounter10 = 9) then
				pixelClk <= '1';
			end if;
		end if;
	end process pixelClkProcess;

	mainScanOutProcess : process(clk_x10)
		variable tempXCoord : unsigned(9 downto 0) := (others => '0');
	begin
		if (rising_edge(clk_x10) ) then
			if (clockDividerCounter10 = 9) then
				clockDividerCounter10 <= (others => '0');

				-- Do stuff here on every 10th tick:
				if (lineNumberY > 513) then
					-- Spend some VSync lines pre-warming our cache for the top of the next frame
					if (pixelNumberX = 0) then
						if (lineNumberY = 517) then
							-- Reset the loading cache line addr to the base specified by the Command Processor when we reach the bottom of the scan region
							loadingCachedLineOffset <= (others => '0');
							loadingLineLoaded <= '0';
						elsif (lineNumberY = 519) then
							currentCachedLine <= loadingCachedLine; -- Offset +00
							currentCachedLineAddr <= loadingCachedLineOffset;

							loadingCachedLineOffset <= to_unsigned(64, 30); -- Increment the read address by 512 bits forwards (64 bytes)
							loadingLineLoaded <= '0'; -- Mark the loaded cache line as unloaded and needing to be loaded
						elsif (lineNumberY = 521) then
							nextCachedLine <= loadingCachedLine; -- Offset +64
							nextCachedLineAddr <= loadingCachedLineOffset;

							loadingCachedLineOffset <= to_unsigned(128, 30); -- Increment the read address by 512 bits forwards (64 bytes)
							loadingLineLoaded <= '0'; -- Mark the loaded cache line as unloaded and needing to be loaded
						end if;
					end if;
				end if;

				vsync <= not VSyncActivePolarity;
				hsync <= not HSyncActivePolarity;
				controlChannel0Blue <= (others => '0');
				controlChannel1Green <= (others => '0');
				controlChannel2Red <= (others => '0');
				guardBandEnable <= '0';
				guardBandType <= '0';
				isTERC4Region <= '0';
				TERC4Character0 <= (others => '0');
				TERC4Character1 <= (others => '0');
				TERC4Character2 <= (others => '0');
				DBG_InternalScanX <= std_logic_vector(pixelNumberX);
				DBG_InternalScanY <= std_logic_vector(lineNumberY);

				if (IsCurrentPixelBlanked(pixelNumberX, lineNumberY) = false) then -- Video data goes here:
					tempXCoord := GetXCoord(pixelNumberX);
					outXCoord <= std_logic_vector(tempXCoord);
					outYCoord <= std_logic_vector(GetYCoord(lineNumberY) );
					outR <= std_logic_vector(GetPixelColor(currentCachedLine(31 downto 0), outputColorChannels(2 downto 0), invertOutputColor) );
					outG <= std_logic_vector(GetPixelColor(currentCachedLine(31 downto 0), outputColorChannels(5 downto 3), invertOutputColor) );
					outB <= std_logic_vector(GetPixelColor(currentCachedLine(31 downto 0), outputColorChannels(8 downto 6), invertOutputColor) );
					blank <= '0';

					if (tempXCoord(3 downto 0) = 15) then
						currentCachedLine <= nextCachedLine;
						currentCachedLineAddr <= nextCachedLineAddr;

						nextCachedLine <= loadingCachedLine;
						nextCachedLineAddr <= loadingCachedLineOffset;

						loadingCachedLineOffset <= loadingCachedLineOffset + 64; -- Increment the read address by 512 bits forwards (64 bytes)
						loadingLineLoaded <= '0'; -- Mark the loaded cache line as unloaded and needing to be loaded
					else
						currentCachedLine <= currentCachedLine srl 32; -- Shift the current cache line down one R8G8B8A8 pixel (shift 32 bits to the right)
					end if;
				else -- Blanking region and HDMI data island stuff here:
					if (IsVSyncRegion(lineNumberY) = '1') then
						vsync <= VSyncActivePolarity; -- For 640x480@60Hz mode, vsync signal is active-high
					end if;
					if (IsHSyncRegion(pixelNumberX) = '1') then
						hsync <= HSyncActivePolarity; -- For 640x480@60Hz mode, hsync signal is active-low
					end if;

					controlChannel0Blue <= IsVSyncRegion(lineNumberY) & IsHSyncRegion(pixelNumberX);

					if (IsVideoLeadingGuardBand(pixelNumberX, lineNumberY) ) then
						guardBandEnable <= '1';
						guardBandType <= '0';
					else
						guardBandEnable <= '0';
						guardBandType <= '0';

						if (IsVideoLeadingPreamble(pixelNumberX, lineNumberY) ) then
							controlChannel1Green <= "01";
							controlChannel2Red <= "00";
						end if;
					end if;

					if (IsDataIslandRegion(pixelNumberX, lineNumberY) ) then
						isTERC4Region <= '1';
						TERC4Character0 <= GetTERC4CharacterChannel0(IsHSyncRegion(pixelNumberX), 
							IsVSyncRegion(lineNumberY), 
							'1', 
							AVIInfoHeader(to_integer(GetDataIslandRegionByteIndex(pixelNumberX) ) ), 
							not IsDataIslandRegionFirstCharacter(pixelNumberX, lineNumberY) );
						TERC4Character1 <= GetTERC4CharacterChannel1(
							AVIInfoSubpacket0(to_integer(GetDataIslandRegionByteIndex(pixelNumberX) ) * 2),
							AVIInfoSubpacket1(to_integer(GetDataIslandRegionByteIndex(pixelNumberX) ) * 2),
							AVIInfoSubpacket2(to_integer(GetDataIslandRegionByteIndex(pixelNumberX) ) * 2),
							AVIInfoSubpacket3(to_integer(GetDataIslandRegionByteIndex(pixelNumberX) ) * 2) );
						TERC4Character2 <= GetTERC4CharacterChannel2(
							AVIInfoSubpacket0(to_integer(GetDataIslandRegionByteIndex(pixelNumberX) ) * 2 + 1),
							AVIInfoSubpacket1(to_integer(GetDataIslandRegionByteIndex(pixelNumberX) ) * 2 + 1),
							AVIInfoSubpacket2(to_integer(GetDataIslandRegionByteIndex(pixelNumberX) ) * 2 + 1),
							AVIInfoSubpacket3(to_integer(GetDataIslandRegionByteIndex(pixelNumberX) ) * 2 + 1) );
					else
						if (IsDataIslandGuardBand(pixelNumberX, lineNumberY) ) then
							guardBandEnable <= '1';
							guardBandType <= '1';
						else
							if (IsDataIslandLeadingPreamble(pixelNumberX, lineNumberY) ) then
								controlChannel1Green <= "01";
								controlChannel2Red <= "01";
							end if;
						end if;
					end if;

					outXCoord <= (others => '0');
					outYCoord <= (others => '0');
					outR <= (others => '0'); -- Very important that R, G, B must all be set to (0, 0, 0) during blanking periods!
					outG <= (others => '0');
					outB <= (others => '0');
					blank <= '1';
				end if;

				if (pixelNumberX = 799) then -- 799 = 0x31F
					if (lineNumberY = 524) then
						pixelNumberX <= (others => '0');
						lineNumberY <= (others => '0');
						frameNumber <= frameNumber + 1;
					else
						pixelNumberX <= (others => '0');
						lineNumberY <= lineNumberY + 1;
					end if;
				else
					pixelNumberX <= pixelNumberX + 1;
					lineNumberY <= lineNumberY;
				end if;

			else
				if (scanoutEnable = '1') then
					clockDividerCounter10 <= clockDividerCounter10 + 1; -- Only advance our clock counter if scanout is enabled
				end if;
				if (loadingLineReady = '1') then
					loadingLineLoaded <= '1'; -- Ack our new cache line being loaded
				end if;
			end if;
		end if;
	end process mainScanOutProcess;

	-- Data loading process
	dataLoadProcess : process(clk_x10)
	begin
		if (rising_edge(clk_x10) ) then
			case loadState is
				when loadProcessInit =>
					MEM_ScanoutReadResponsesFIFO_rd_en <= '0';
					MEM_ScanoutReadRequestsFIFO_wr_en <= '0';
					loadingLineReady <= '0';
					loadingCachedLine <= loadingCachedLine + 1;
					if (loadingCachedLine > 1023) then -- Give this unit 1000 cycles to warm up
						loadState <= waitForEmptyCacheLine;
					end if;

				when waitForEmptyCacheLine =>
					loadCacheLineNum <= (others => '0'); -- Reset our cache line count
					MEM_ScanoutReadResponsesFIFO_rd_en <= '0';
					if (loadingLineLoaded = '0' and MEM_ScanoutReadRequestsFIFO_full = '0') then
						MEM_ScanoutReadRequestsFIFO_wr_data <= std_logic_vector(loadingCachedLineOffset + unsigned(BaseRenderTargetAddr) );
						MEM_ScanoutReadRequestsFIFO_wr_en <= '1';

						-- Init the line to magenta so we can easily visually tell when we underflow the buffer
						loadingCachedLine <= x"FFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CCFFCC00CC";

						loadState <= readSendSecondAddr;
					else
						MEM_ScanoutReadRequestsFIFO_wr_en <= '0';
					end if;

				when readSendSecondAddr =>
					if (loadCacheLineNum = 0) then
						MEM_ScanoutReadRequestsFIFO_wr_en <= '0';
						loadCacheLineNum <= to_unsigned(1, 3);
					elsif (loadCacheLineNum = 1) then
						if (MEM_ScanoutReadRequestsFIFO_full = '0') then
							MEM_ScanoutReadRequestsFIFO_wr_data <= std_logic_vector(loadingCachedLineOffset + unsigned(BaseRenderTargetAddr) + to_unsigned(32, 30) );
							MEM_ScanoutReadRequestsFIFO_wr_en <= '1';
							loadCacheLineNum <= (others => '0');
							loadState <= waitForMemRead;
						end if;
					end if;

				when waitForMemRead =>
					MEM_ScanoutReadRequestsFIFO_wr_en <= '0'; -- Deassert after one clock cycle
					if (MEM_ScanoutReadResponsesFIFO_empty = '0') then
						loadingCachedLine(255 downto 0) <= unsigned(MEM_ScanoutReadResponsesFIFO_rd_data);
						MEM_ScanoutReadResponsesFIFO_rd_en <= '1';
						loadState <= waitForMemRead2;
					else
						MEM_ScanoutReadResponsesFIFO_rd_en <= '0';
					end if;

				when waitForMemRead2 =>
					MEM_ScanoutReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
					loadState <= waitForMemRead3;

				when waitForMemRead3 =>
					if (MEM_ScanoutReadResponsesFIFO_empty = '0') then
						MEM_ScanoutReadResponsesFIFO_rd_en <= '1';
						loadingCachedLine(511 downto 256) <= unsigned(MEM_ScanoutReadResponsesFIFO_rd_data);
						loadState <= waitForCacheLineFill;
					else
						MEM_ScanoutReadResponsesFIFO_rd_en <= '0';
					end if;

				when waitForCacheLineFill =>
					MEM_ScanoutReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
					if (loadingLineLoaded = '1') then
						loadingLineReady <= '0';
						loadState <= waitForEmptyCacheLine;
					else
						loadingLineReady <= '1';
					end if;
			end case;
		end if;
	end process dataLoadProcess;

end Behavioral;
