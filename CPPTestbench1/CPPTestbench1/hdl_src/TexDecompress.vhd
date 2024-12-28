library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity TexDecompress is
	Port ( clk : in STD_LOGIC;

	-- Texture Sampler interface begin
		TEXSAMP_ReadyForNewBlock : out STD_LOGIC := '0';
		TEXSAMP_NewBlockIsValid : in STD_LOGIC;

		TEXSAMP_CompressionResultsReady : in STD_LOGIC;
		TEXSAMP_CompressionResultsValid : out STD_LOGIC := '0';

		TEXSAMP_CompressionType : in STD_LOGIC_VECTOR(2 downto 0);

		TEXSAMP_InCompressedPixelBits : in STD_LOGIC_VECTOR(16*8-1 downto 0);
		TEXSAMP_OutDecompressedPixels4x4 : out STD_LOGIC_VECTOR(16*32-1 downto 0);
	-- Texture Sampler interface end

	-- Debug signals
		DBG_TexDecompress_State : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0')
		);
end TexDecompress;

architecture Behavioral of TexDecompress is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333000000";

subtype CompressedBlock is unsigned(16*8-1 downto 0);
subtype UncompressedBlock is unsigned(16*32-1 downto 0);
subtype CompressedColorBlock is unsigned(8*8-1 downto 0);
subtype ColorR8G8B8 is unsigned(23 downto 0);
subtype ColorR5G6B5 is unsigned(15 downto 0);

type DXTColorSlotsType is array(0 to 3) of ColorR8G8B8;
type DXTAlphaSlotsType is array(0 to 7) of unsigned(7 downto 0);

type texDecompressStateType is
(
	waitingForInput, -- 0

	populatePalettes,
	returnOutput
);

signal currentState : texDecompressStateType := waitingForInput;
signal DXTColorSlots : DXTColorSlotsType;
signal DXTAlphaSlots : DXTAlphaSlotsType;
signal readyForNewBlock : std_logic := '0';
signal compressionResultsValid : std_logic := '0';
signal isDXT1 : std_logic := '0';
signal isDXT3 : std_logic := '0';
signal isDXT3_1 : std_logic := '0';
signal isLargeColorTable : std_logic := '0';
signal enable0 : std_logic := '0';
signal enable1 : std_logic := '0';

signal localBlock : CompressedBlock;
signal localBlock_1 : CompressedBlock;

pure function GetRawColor0(DXTColorBlock : CompressedColorBlock) return ColorR5G6B5 is
begin
	return ColorR5G6B5(DXTColorBlock(15 downto 0) );
end function;

pure function GetRawColor1(DXTColorBlock : CompressedColorBlock) return ColorR5G6B5 is
begin
	return ColorR5G6B5(DXTColorBlock(31 downto 16) );
end function;

pure function ColorBits3To8(inColorChannel3 : unsigned(2 downto 0) ) return unsigned is
begin
	case inColorChannel3 is
		when "000" => return X"00";
		when "001" => return X"24";
		when "010" => return X"48";
		when "011" => return X"6D";
		when "100" => return X"91";
		when "101" => return X"B6";
		when "110" => return X"DA";
		when "111" => return X"FF";
	end case;
end function;

pure function ColorBits4To8(inColorChannel4 : unsigned(3 downto 0) ) return unsigned is
begin
	case inColorChannel4 is
		when "0000" => return X"00";
		when "0001" => return X"11";
		when "0010" => return X"22";
		when "0011" => return X"33";
		when "0100" => return X"44";
		when "0101" => return X"55";
		when "0110" => return X"66";
		when "0111" => return X"77";
		when "1000" => return X"88";
		when "1001" => return X"99";
		when "1010" => return X"AA";
		when "1011" => return X"BB";
		when "1100" => return X"CC";
		when "1101" => return X"DD";
		when "1110" => return X"EE";
		when "1111" => return X"FF";
	end case;
end function;

pure function ColorBits5To8(inColorChannel5 : unsigned(4 downto 0) ) return unsigned is
begin
	case inColorChannel5 is
		when "00000" => return X"00";
		when "00001" => return X"08";
		when "00010" => return X"10";
		when "00011" => return X"18";
		when "00100" => return X"20";
		when "00101" => return X"29";
		when "00110" => return X"31";
		when "00111" => return X"39";
		when "01000" => return X"41";
		when "01001" => return X"4A";
		when "01010" => return X"52";
		when "01011" => return X"5A";
		when "01100" => return X"62";
		when "01101" => return X"6A";
		when "01110" => return X"73";
		when "01111" => return X"7B";
		when "10000" => return X"83";
		when "10001" => return X"8B";
		when "10010" => return X"94";
		when "10011" => return X"9C";
		when "10100" => return X"A4";
		when "10101" => return X"AC";
		when "10110" => return X"B4";
		when "10111" => return X"BD";
		when "11000" => return X"C5";
		when "11001" => return X"CD";
		when "11010" => return X"D5";
		when "11011" => return X"DE";
		when "11100" => return X"E6";
		when "11101" => return X"EE";
		when "11110" => return X"F6";
		when "11111" => return X"FF";
	end case;
end function;

pure function ColorBits6To8(inColorChannel6 : unsigned(5 downto 0) ) return unsigned is
begin
	case inColorChannel6 is
		when "000000" => return X"00";
		when "000001" => return X"04";
		when "000010" => return X"08";
		when "000011" => return X"0C";
		when "000100" => return X"10";
		when "000101" => return X"14";
		when "000110" => return X"18";
		when "000111" => return X"1C";
		when "001000" => return X"20";
		when "001001" => return X"24";
		when "001010" => return X"28";
		when "001011" => return X"2C";
		when "001100" => return X"30";
		when "001101" => return X"34";
		when "001110" => return X"38";
		when "001111" => return X"3C";
		when "010000" => return X"40";
		when "010001" => return X"44";
		when "010010" => return X"48";
		when "010011" => return X"4C";
		when "010100" => return X"50";
		when "010101" => return X"55";
		when "010110" => return X"59";
		when "010111" => return X"5D";
		when "011000" => return X"61";
		when "011001" => return X"65";
		when "011010" => return X"69";
		when "011011" => return X"6D";
		when "011100" => return X"71";
		when "011101" => return X"75";
		when "011110" => return X"79";
		when "011111" => return X"7D";
		when "100000" => return X"81";
		when "100001" => return X"85";
		when "100010" => return X"89";
		when "100011" => return X"8D";
		when "100100" => return X"91";
		when "100101" => return X"95";
		when "100110" => return X"99";
		when "100111" => return X"9D";
		when "101000" => return X"A1";
		when "101001" => return X"A5";
		when "101010" => return X"AA";
		when "101011" => return X"AE";
		when "101100" => return X"B2";
		when "101101" => return X"B6";
		when "101110" => return X"BA";
		when "101111" => return X"BE";
		when "110000" => return X"C2";
		when "110001" => return X"C6";
		when "110010" => return X"CA";
		when "110011" => return X"CE";
		when "110100" => return X"D2";
		when "110101" => return X"D6";
		when "110110" => return X"DA";
		when "110111" => return X"DE";
		when "111000" => return X"E2";
		when "111001" => return X"E6";
		when "111010" => return X"EA";
		when "111011" => return X"EE";
		when "111100" => return X"F2";
		when "111101" => return X"F6";
		when "111110" => return X"FA";
		when "111111" => return X"FF";
	end case;
end function;

pure function ExpandR5G6B5ToR8G8B8(inColor : ColorR5G6B5) return ColorR8G8B8 is
begin
	return
	ColorBits5To8(inColor(4 downto 0) ) & -- B
	ColorBits6To8(inColor(10 downto 5) ) & -- G
	ColorBits5To8(inColor(15 downto 11) ); -- R
end function;

pure function GetColorBlockFromDXT35(DXT35FullBlock : CompressedBlock) return CompressedColorBlock is
begin
	return CompressedColorBlock(DXT35FullBlock(16*8-1 downto 8*8) );
end function;

pure function GetAverageColor(color0 : ColorR5G6B5; color1 : ColorR5G6B5) return ColorR8G8B8 is
	variable r0 : unsigned(7 downto 0);
	variable g0 : unsigned(7 downto 0);
	variable b0 : unsigned(7 downto 0);
	variable r1 : unsigned(7 downto 0);
	variable g1 : unsigned(7 downto 0);
	variable b1 : unsigned(7 downto 0);
	variable sum : unsigned(8 downto 0);
	variable result : ColorR8G8B8;
begin
	r0 := ColorBits5To8(color0(15 downto 11) );
	r1 := ColorBits5To8(color1(15 downto 11) );
	sum := ('0' & r0) + ('0' & r1);
	result(7 downto 0) := sum(8 downto 1);

	g0 := ColorBits6To8(color0(10 downto 5) );
	g1 := ColorBits6To8(color1(10 downto 5) );
	sum := ('0' & g0) + ('0' & g1);
	result(15 downto 8) := sum(8 downto 1);

	b0 := ColorBits5To8(color0(4 downto 0) );
	b1 := ColorBits5To8(color1(4 downto 0) );
	sum := ('0' & b0) + ('0' & b1);
	result(23 downto 16) := sum(8 downto 1);

	return result;
end function;

pure function GetThirdsBlendedColor(color0 : ColorR5G6B5; color1 : ColorR5G6B5) return ColorR8G8B8 is
	variable r0 : unsigned(8 downto 0);
	variable g0 : unsigned(8 downto 0);
	variable b0 : unsigned(8 downto 0);
	variable r1 : unsigned(7 downto 0);
	variable g1 : unsigned(7 downto 0);
	variable b1 : unsigned(7 downto 0);
	variable sum : unsigned(7 downto 0);
	variable result : ColorR8G8B8;
begin
	r0 := ColorBits5To8(color0(15 downto 11) ) & '0'; -- * 2
	r0 := r0 / 3; -- / 3
	r1 := ColorBits5To8(color1(15 downto 11) ) / 3; -- / 3
	sum := r0(7 downto 0) + r1;
	result(7 downto 0) := sum;

	g0 := ColorBits6To8(color0(10 downto 5) ) & '0'; -- * 2
	g0 := g0 / 3; -- / 3
	g1 := ColorBits6To8(color1(10 downto 5) ) / 3; -- / 3
	sum := g0(7 downto 0) + g1;
	result(15 downto 8) := sum;

	b0 := ColorBits5To8(color0(4 downto 0) ) & '0'; -- * 2
	b0 := b0 / 3; -- / 3
	b1 := ColorBits5To8(color1(4 downto 0) ) / 3; -- / 3
	sum := b0(7 downto 0) + b1;
	result(23 downto 16) := sum;

	return result;
end function;

pure function GetColorPaletteIndexForTexelIndex(texelIndex : natural; colorBlock : CompressedColorBlock) return unsigned is
begin
	return colorBlock(32 + (texelIndex + 1) * 2 - 1 downto texelIndex * 2 + 32);
end function;

pure function GetTexelAlphaForIndex(texelIndex : natural; DXTBlock : CompressedBlock; blockIsDXT3 : std_logic; alphaPalette : DXTAlphaSlotsType) return unsigned is
begin
	if (blockIsDXT3 = '1') then
		return ColorBits4To8(DXTBlock( (texelIndex + 1) * 4 - 1 downto texelIndex * 4) );
	else
		return alphaPalette(to_integer(DXTBlock( (texelIndex + 1) * 3 - 1 + 16 downto texelIndex * 3 + 16) ) );
	end if;
end function;

pure function GatherUncompressedPixels4x4(colorsPalette : DXTColorSlotsType; alphaPalette : DXTAlphaSlotsType; DXTBlock : CompressedBlock; blockIsDXT3 : std_logic) return UncompressedBlock is
begin
	return 
	(GetTexelAlphaForIndex(15, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(15, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(14, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(14, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(13, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(13, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(12, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(12, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(11, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(11, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(10, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(10, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(9, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(9, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(8, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(8, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(7, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(7, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(6, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(6, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(5, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(5, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(4, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(4, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(3, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(3, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(2, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(2, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(1, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(1, GetColorBlockFromDXT35(DXTBlock) ) ) ) ) &
	(GetTexelAlphaForIndex(0, DXTBlock, blockIsDXT3, alphaPalette) & colorsPalette(to_integer(GetColorPaletteIndexForTexelIndex(0, GetColorBlockFromDXT35(DXTBlock) ) ) ) );
end function;

begin

DBG_TexDecompress_State <= std_logic_vector(to_unsigned(texDecompressStateType'pos(currentState), 6) );
TEXSAMP_ReadyForNewBlock <= readyForNewBlock;
TEXSAMP_CompressionResultsValid <= compressionResultsValid;
isDXT3_1 <= isDXT3;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			enable0 <= TEXSAMP_NewBlockIsValid;
			if (TEXSAMP_NewBlockIsValid = '1') then
				if (TEXSAMP_CompressionType = "011") then -- DXT3
					isDXT3 <= '1';
				else
					isDXT3 <= '0';
				end if;

				if (TEXSAMP_CompressionType = "010") then -- DXT1
					isDXT1 <= '1';
					localBlock(8*8-1 downto 0) <= (others => '1');
					localBlock(16*8-1 downto 8*8) <= CompressedColorBlock(TEXSAMP_InCompressedPixelBits(8*8-1 downto 0) );
				else -- Other
					isDXT1 <= '0';
					localBlock <= CompressedBlock(TEXSAMP_InCompressedPixelBits);
				end if;

				if (TEXSAMP_CompressionType = "010" -- DXT1
					and GetRawColor0(CompressedColorBlock(TEXSAMP_InCompressedPixelBits) ) > GetRawColor1(CompressedColorBlock(TEXSAMP_InCompressedPixelBits) ) ) then
					isLargeColorTable <= '1';
				elsif (TEXSAMP_CompressionType /= "010" -- DXT3/5
					and GetRawColor0(GetColorBlockFromDXT35(CompressedBlock(TEXSAMP_InCompressedPixelBits) ) ) < GetRawColor1(GetColorBlockFromDXT35(CompressedBlock(TEXSAMP_InCompressedPixelBits) ) ) ) then
					isLargeColorTable <= '1';
				else
					isLargeColorTable <= '0';
				end if;
			end if;
		end if;
	end process;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			enable1 <= enable0;
			if (enable0 = '1') then
				localBlock_1 <= localBlock;

				DXTColorSlots(0) <= ExpandR5G6B5ToR8G8B8(GetRawColor0(GetColorBlockFromDXT35(localBlock) ) );
				DXTColorSlots(1) <= ExpandR5G6B5ToR8G8B8(GetRawColor1(GetColorBlockFromDXT35(localBlock) ) );
				if (isLargeColorTable = '1') then
					DXTColorSlots(2) <= GetThirdsBlendedColor(GetRawColor0(GetColorBlockFromDXT35(localBlock) ), GetRawColor1(GetColorBlockFromDXT35(localBlock) ) );
					DXTColorSlots(3) <= GetThirdsBlendedColor(GetRawColor1(GetColorBlockFromDXT35(localBlock) ), GetRawColor0(GetColorBlockFromDXT35(localBlock) ) );
				else
					DXTColorSlots(2) <= GetAverageColor(GetRawColor0(GetColorBlockFromDXT35(localBlock) ), GetRawColor1(GetColorBlockFromDXT35(localBlock) ) );
					DXTColorSlots(3) <= (others => '0');
				end if;

				if (isDXT1 = '1') then
					if (isLargeColorTable = '1') then
						DXTAlphaSlots(7) <= X"FF";
					else
						-- Set alpha palette slot 6 to black (0x00) and set alpha palette slot 7 to white (0xFF)
						DXTAlphaSlots(6) <= X"00";
						DXTAlphaSlots(7) <= X"FF";

						-- Modify the alpha block for this DXT block so that each of the alpha indices point to either slot 0 or slot 1
						for texelIndex in 0 to 15 loop
							if (GetColorPaletteIndexForTexelIndex(texelIndex, GetColorBlockFromDXT35(localBlock) ) = "11") then -- color 3 is alpha'd out
								localBlock_1( (texelIndex + 1) * 3 + 16 - 1 downto texelIndex * 3 + 16) <= "110";
							else
								localBlock_1( (texelIndex + 1) * 3 + 16 - 1 downto texelIndex * 3 + 16) <= "111";
							end if;
						end loop;
					end if;
				else
					DXTAlphaSlots(0) <= localBlock(7 downto 0);
					DXTAlphaSlots(1) <= localBlock(15 downto 8);

					-- TODO: Validate that these calculations are correct in the case of overflow:
					if (localBlock(7 downto 0) > localBlock(15 downto 8) ) then
						DXTAlphaSlots(2) <= 6 * (localBlock(7 downto 0) / 7) + localBlock(15 downto 8) / 7;
						DXTAlphaSlots(3) <= 5 * (localBlock(7 downto 0) / 7) + 2 * (localBlock(15 downto 8) / 7);
						DXTAlphaSlots(4) <= 4 * (localBlock(7 downto 0) / 7) + 3 * (localBlock(15 downto 8) / 7);
						DXTAlphaSlots(5) <= 3 * (localBlock(7 downto 0) / 7) + 4 * (localBlock(15 downto 8) / 7);
						DXTAlphaSlots(6) <= 2 * (localBlock(7 downto 0) / 7) + 5 * (localBlock(15 downto 8) / 7);
						DXTAlphaSlots(7) <= localBlock(7 downto 0) / 7 + 6 * (localBlock(15 downto 8) / 7);
					else
						DXTAlphaSlots(2) <= 4 * (localBlock(7 downto 0) / 5) + localBlock(15 downto 8) / 5;
						DXTAlphaSlots(3) <= 3 * (localBlock(7 downto 0) / 5) + 2 * (localBlock(15 downto 8) / 5);
						DXTAlphaSlots(4) <= 2 * (localBlock(7 downto 0) / 5) + 3 * (localBlock(15 downto 8) / 5);
						DXTAlphaSlots(5) <= localBlock(7 downto 0) / 5 + 4 * (localBlock(15 downto 8) / 5);
						DXTAlphaSlots(6) <= X"00";
						DXTAlphaSlots(7) <= X"FF";
					end if;
				end if;
			end if;
		end if;
	end process;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			if (enable1 = '1') then
				TEXSAMP_OutDecompressedPixels4x4 <= std_logic_vector(GatherUncompressedPixels4x4(DXTColorSlots, DXTAlphaSlots, localBlock_1, isDXT3_1) );
			end if;
		end if;
	end process;

end Behavioral;
