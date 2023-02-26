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
	Port (clk : in STD_LOGIC;
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
end ScanOut;

architecture Behavioral of ScanOut is

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

signal lineNumberY : unsigned(9 downto 0) := (others => '0'); -- stores values from 0 to 1024, but we only need from 0 to 525
signal pixelNumberX : unsigned(9 downto 0) := (others => '0'); -- stores values from 0 to 1024, but we only need from 0 to 800
signal frameNumber : unsigned(9 downto 0) := (others => '0');
signal clockDividerCounter10 : unsigned(3 downto 0) := (others => '0');

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

	process(clk)
	begin
		if (rising_edge(clk) ) then
			pixelClk <= '0';
			if (clockDividerCounter10 = 9) then
				clockDividerCounter10 <= (others => '0');
				pixelClk <= '1';

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
					outXCoord <= std_logic_vector(GetXCoord(pixelNumberX) );
					outYCoord <= std_logic_vector(GetYCoord(lineNumberY) );
					outR <= std_logic_vector(pixelNumberX(7 downto 0) + frameNumber(7 downto 0) );
					outG <= std_logic_vector(lineNumberY(7 downto 0) + frameNumber(7 downto 5) );
					outB <= std_logic_vector(pixelNumberX(7 downto 0) + frameNumber(7 downto 0) );
					blank <= '0';
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
				clockDividerCounter10 <= clockDividerCounter10 + 1;
			end if;
		end if;
	end process;

end Behavioral;
