library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity TexDecompress2 is
	Port ( clk : in STD_LOGIC;

	-- Texture Sampler interface begin
		TEXSAMP_NewBlockIsValid : in STD_LOGIC;
		TEXSAMP_CompressionResultsValid : out STD_LOGIC := '0';

		TEXSAMP_IsCompressed : in STD_LOGIC;
		TEXSAMP_CompressionType : in STD_LOGIC_VECTOR(2 downto 0);

		TEXSAMP_UncompressedOpaqueAlpha : in STD_LOGIC;
		TEXSAMP_UncompressedFormat : in STD_LOGIC_VECTOR(4 downto 0);

		TEXSAMP_InCompressedPixelBits : in STD_LOGIC_VECTOR(16*32-1 downto 0);
		TEXSAMP_OutDecompressedPixels4x4 : out STD_LOGIC_VECTOR(16*32-1 downto 0);
	-- Texture Sampler interface end

	-- Debug signals
		DBG_InU : in STD_LOGIC_VECTOR(7 downto 0);
		DBG_OutU : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_ColorTable0 : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		DBG_ColorTable1 : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		DBG_ColorTable2 : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		DBG_ColorTable3 : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		DBG_Color0 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_Color1 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_Alpha0 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_Alpha1 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_AlphaTable0 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_AlphaTable1 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_AlphaTable2 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_AlphaTable3 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_AlphaTable4 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_AlphaTable5 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_AlphaTable6 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		DBG_AlphaTable7 : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0')
		);
end TexDecompress2;

architecture Behavioral of TexDecompress2 is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333000000";

subtype CompressedBlock is unsigned(16*8-1 downto 0);
subtype UncompressedBlock is unsigned(16*32-1 downto 0);
subtype CompressedColorBlock is unsigned(8*8-1 downto 0);
subtype ColorR8G8B8 is unsigned(23 downto 0);
subtype ColorR5G6B5 is unsigned(15 downto 0);

type DXTColorSlotsType is array(3 downto 0) of ColorR8G8B8;
type DXTAlphaSlotsType is array(7 downto 0) of unsigned(7 downto 0);

signal DXTColorSlots : DXTColorSlotsType;
signal DXTAlphaSlots : DXTAlphaSlotsType;
signal compressionResultsValid : std_logic := '0';
signal isDXT1 : std_logic := '0';
signal isDXT3 : std_logic := '0';
signal isDXT3_1 : std_logic := '0';
signal isLargeColorTable : std_logic := '0';
signal isLargeAlphaTable : std_logic := '0';
signal enable0 : std_logic := '0';
signal enable1 : std_logic := '0';
signal isCompressed0 : std_logic := '0';
signal isCompressed1 : std_logic := '0';
signal uncompressedOpaqueAlpha0 : std_logic := '0';
signal uncompressedOpaqueAlpha1 : std_logic := '0';
signal uncompressedFormat0 : unsigned(4 downto 0) := (others => '0');
signal uncompressedFormat1 : unsigned(4 downto 0) := (others => '0');

signal localBlock : UncompressedBlock;
signal localBlock_1 : UncompressedBlock;

pure function GetRawColor0(DXTColorBlock : CompressedColorBlock) return ColorR5G6B5 is
begin
	return ColorR5G6B5(DXTColorBlock(15 downto 0) );
end function;

pure function GetRawColor1(DXTColorBlock : CompressedColorBlock) return ColorR5G6B5 is
begin
	return ColorR5G6B5(DXTColorBlock(31 downto 16) );
end function;

pure function ColorBits1To8(inColorChannel1 : std_logic) return unsigned is
begin
	case inColorChannel1 is
		when '0' => return X"00";
		when '1' => return X"FF";
	end case;
end function;

pure function ColorBits3To8(inColorChannel3 : unsigned(2 downto 0) ) return unsigned is
begin
	return inColorChannel3 & inColorChannel3 & inColorChannel3(2 downto 1);
end function;

pure function ColorBits4To8(inColorChannel4 : unsigned(3 downto 0) ) return unsigned is
begin
	return inColorChannel4 & inColorChannel4;
end function;

pure function ColorBits5To8(inColorChannel5 : unsigned(4 downto 0) ) return unsigned is
begin
	return inColorChannel5 & inColorChannel5(4 downto 2);
end function;

pure function ColorBits6To8(inColorChannel6 : unsigned(5 downto 0) ) return unsigned is
begin
	return inColorChannel6 & inColorChannel6(5 downto 4);
end function;

pure function ExpandR5G6B5ToR8G8B8(inColor : ColorR5G6B5) return ColorR8G8B8 is
begin
	return
	ColorBits5To8(inColor(15 downto 11) ) & -- R
	ColorBits6To8(inColor(10 downto 5) ) & -- G
	ColorBits5To8(inColor(4 downto 0) ); -- B
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
	result(23 downto 16) := sum(8 downto 1);

	g0 := ColorBits6To8(color0(10 downto 5) );
	g1 := ColorBits6To8(color1(10 downto 5) );
	sum := ('0' & g0) + ('0' & g1);
	result(15 downto 8) := sum(8 downto 1);

	b0 := ColorBits5To8(color0(4 downto 0) );
	b1 := ColorBits5To8(color1(4 downto 0) );
	sum := ('0' & b0) + ('0' & b1);
	result(7 downto 0) := sum(8 downto 1);

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
	result(23 downto 16) := sum;

	g0 := ColorBits6To8(color0(10 downto 5) ) & '0'; -- * 2
	g0 := g0 / 3; -- / 3
	g1 := ColorBits6To8(color1(10 downto 5) ) / 3; -- / 3
	sum := g0(7 downto 0) + g1;
	result(15 downto 8) := sum;

	b0 := ColorBits5To8(color0(4 downto 0) ) & '0'; -- * 2
	b0 := b0 / 3; -- / 3
	b1 := ColorBits5To8(color1(4 downto 0) ) / 3; -- / 3
	sum := b0(7 downto 0) + b1;
	result(7 downto 0) := sum;

	return result;
end function;

pure function GetFifthsBlendedAlpha14(alpha1 : unsigned(7 downto 0); alpha4 : unsigned(7 downto 0) ) return unsigned is
	variable a0 : unsigned(7 downto 0);
	variable a1 : unsigned(9 downto 0);
	variable shrunka1 : unsigned(7 downto 0);
begin
	a0 := alpha1;
	a0 := a0 / 5;

	a1 := alpha4 & "00"; -- Multiply by 4
	a1 := a1 / 5;
	shrunka1 := a1(7 downto 0);

	return a0 + shrunka1;
end function;

pure function GetFifthsBlendedAlpha23(alpha2 : unsigned(7 downto 0); alpha3 : unsigned(7 downto 0) ) return unsigned is
	variable a0 : unsigned(8 downto 0);
	variable shrunka0 : unsigned(7 downto 0);
	variable a1 : unsigned(9 downto 0);
	variable shrunka1 : unsigned(7 downto 0);
begin
	a0 := alpha2 & '0'; -- Multiply by 2
	a0 := a0 / 5;
	shrunka0 := a0(7 downto 0);

	a1 := '0' & alpha3 & '0'; -- Multiply by 2
	a1 := a1 + alpha3; -- Add the original value to multiply by 3
	a1 := a1 / 5;
	shrunka1 := a1(7 downto 0);

	return shrunka0 + shrunka1;
end function;

pure function GetSeventhsBlendedAlpha16(alpha1 : unsigned(7 downto 0); alpha6 : unsigned(7 downto 0) ) return unsigned is
	variable a0 : unsigned(7 downto 0);
	variable a1 : unsigned(10 downto 0);
	variable a1x2 : unsigned(8 downto 0);
	variable shrunka1 : unsigned(7 downto 0);
begin
	a0 := alpha1;
	a0 := a0 / 7;

	a1 := '0' & alpha6 & "00"; -- Multiply by 4
	a1x2 := alpha6 & '0'; -- Multiply by 2
	a1 := a1 + a1x2; -- Add together to get a multiply by 6
	a1 := a1 / 7;
	shrunka1 := a1(7 downto 0);

	return a0 + shrunka1;
end function;

pure function GetSeventhsBlendedAlpha25(alpha2 : unsigned(7 downto 0); alpha5 : unsigned(7 downto 0) ) return unsigned is
	variable a0 : unsigned(8 downto 0);
	variable shrunka0 : unsigned(7 downto 0);
	variable a1 : unsigned(10 downto 0);
	variable shrunka1 : unsigned(7 downto 0);
begin
	a0 := alpha2 & '0'; -- Multiply by 2
	a0 := a0 / 7;
	shrunka0 := a0(7 downto 0);

	a1 := '0' & alpha5 & "00"; -- Multiply by 4
	a1 := a1 + alpha5; -- Add together to get a multiply by 5
	a1 := a1 / 7;
	shrunka1 := a1(7 downto 0);

	return shrunka0 + shrunka1;
end function;

pure function GetSeventhsBlendedAlpha34(alpha3 : unsigned(7 downto 0); alpha4 : unsigned(7 downto 0) ) return unsigned is
	variable a0 : unsigned(9 downto 0);
	variable shrunka0 : unsigned(7 downto 0);
	variable a1 : unsigned(9 downto 0);
	variable shrunka1 : unsigned(7 downto 0);
begin
	a0 := '0' & alpha3 & '0'; -- Multiply by 2
	a0 := a0 + alpha3; -- Add together to get a multiply by 3
	a0 := a0 / 7;
	shrunka0 := a0(7 downto 0);

	a1 := alpha4 & "00"; -- Multiply by 4
	a1 := a1 / 7;
	shrunka1 := a1(7 downto 0);

	return shrunka0 + shrunka1;
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

pure function UnpackR5G6B5Block(pixelBytes : UncompressedBlock) return UncompressedBlock is
begin
	return
	X"FF" & ColorBits5To8(pixelBytes(16*15+15 downto 16*15+11) ) & ColorBits6To8(pixelBytes(16*15+10 downto 16*15+5) ) & ColorBits5To8(pixelBytes(16*15+4 downto 16*15+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*14+15 downto 16*14+11) ) & ColorBits6To8(pixelBytes(16*14+10 downto 16*14+5) ) & ColorBits5To8(pixelBytes(16*14+4 downto 16*14+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*13+15 downto 16*13+11) ) & ColorBits6To8(pixelBytes(16*13+10 downto 16*13+5) ) & ColorBits5To8(pixelBytes(16*13+4 downto 16*13+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*12+15 downto 16*12+11) ) & ColorBits6To8(pixelBytes(16*12+10 downto 16*12+5) ) & ColorBits5To8(pixelBytes(16*12+4 downto 16*12+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*11+15 downto 16*11+11) ) & ColorBits6To8(pixelBytes(16*11+10 downto 16*11+5) ) & ColorBits5To8(pixelBytes(16*11+4 downto 16*11+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*10+15 downto 16*10+11) ) & ColorBits6To8(pixelBytes(16*10+10 downto 16*10+5) ) & ColorBits5To8(pixelBytes(16*10+4 downto 16*10+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*9+15 downto 16*9+11) ) & ColorBits6To8(pixelBytes(16*9+10 downto 16*9+5) ) & ColorBits5To8(pixelBytes(16*9+4 downto 16*9+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*8+15 downto 16*8+11) ) & ColorBits6To8(pixelBytes(16*8+10 downto 16*8+5) ) & ColorBits5To8(pixelBytes(16*8+4 downto 16*8+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*7+15 downto 16*7+11) ) & ColorBits6To8(pixelBytes(16*7+10 downto 16*7+5) ) & ColorBits5To8(pixelBytes(16*7+4 downto 16*7+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*6+15 downto 16*6+11) ) & ColorBits6To8(pixelBytes(16*6+10 downto 16*6+5) ) & ColorBits5To8(pixelBytes(16*6+4 downto 16*6+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*5+15 downto 16*5+11) ) & ColorBits6To8(pixelBytes(16*5+10 downto 16*5+5) ) & ColorBits5To8(pixelBytes(16*5+4 downto 16*5+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*4+15 downto 16*4+11) ) & ColorBits6To8(pixelBytes(16*4+10 downto 16*4+5) ) & ColorBits5To8(pixelBytes(16*4+4 downto 16*4+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*3+15 downto 16*3+11) ) & ColorBits6To8(pixelBytes(16*3+10 downto 16*3+5) ) & ColorBits5To8(pixelBytes(16*3+4 downto 16*3+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*2+15 downto 16*2+11) ) & ColorBits6To8(pixelBytes(16*2+10 downto 16*2+5) ) & ColorBits5To8(pixelBytes(16*2+4 downto 16*2+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*1+15 downto 16*1+11) ) & ColorBits6To8(pixelBytes(16*1+10 downto 16*1+5) ) & ColorBits5To8(pixelBytes(16*1+4 downto 16*1+0) ) &
	X"FF" & ColorBits5To8(pixelBytes(16*0+15 downto 16*0+11) ) & ColorBits6To8(pixelBytes(16*0+10 downto 16*0+5) ) & ColorBits5To8(pixelBytes(16*0+4 downto 16*0+0) );
end function;

pure function UnpackA1R5G5B5Block(pixelBytes : UncompressedBlock) return UncompressedBlock is
begin
	return
	ColorBits1To8(pixelBytes(16*15+15) ) & ColorBits5To8(pixelBytes(16*15+14 downto 16*15+10) ) & ColorBits5To8(pixelBytes(16*15+9 downto 16*15+5) ) & ColorBits5To8(pixelBytes(16*15+4 downto 16*15+0) ) &
	ColorBits1To8(pixelBytes(16*14+15) ) & ColorBits5To8(pixelBytes(16*14+14 downto 16*14+10) ) & ColorBits5To8(pixelBytes(16*14+9 downto 16*14+5) ) & ColorBits5To8(pixelBytes(16*14+4 downto 16*14+0) ) &
	ColorBits1To8(pixelBytes(16*13+15) ) & ColorBits5To8(pixelBytes(16*13+14 downto 16*13+10) ) & ColorBits5To8(pixelBytes(16*13+9 downto 16*13+5) ) & ColorBits5To8(pixelBytes(16*13+4 downto 16*13+0) ) &
	ColorBits1To8(pixelBytes(16*12+15) ) & ColorBits5To8(pixelBytes(16*12+14 downto 16*12+10) ) & ColorBits5To8(pixelBytes(16*12+9 downto 16*12+5) ) & ColorBits5To8(pixelBytes(16*12+4 downto 16*12+0) ) &
	ColorBits1To8(pixelBytes(16*11+15) ) & ColorBits5To8(pixelBytes(16*11+14 downto 16*11+10) ) & ColorBits5To8(pixelBytes(16*11+9 downto 16*11+5) ) & ColorBits5To8(pixelBytes(16*11+4 downto 16*11+0) ) &
	ColorBits1To8(pixelBytes(16*10+15) ) & ColorBits5To8(pixelBytes(16*10+14 downto 16*10+10) ) & ColorBits5To8(pixelBytes(16*10+9 downto 16*10+5) ) & ColorBits5To8(pixelBytes(16*10+4 downto 16*10+0) ) &
	ColorBits1To8(pixelBytes(16*9+15) ) & ColorBits5To8(pixelBytes(16*9+14 downto 16*9+10) ) & ColorBits5To8(pixelBytes(16*9+9 downto 16*9+5) ) & ColorBits5To8(pixelBytes(16*9+4 downto 16*9+0) ) &
	ColorBits1To8(pixelBytes(16*8+15) ) & ColorBits5To8(pixelBytes(16*8+14 downto 16*8+10) ) & ColorBits5To8(pixelBytes(16*8+9 downto 16*8+5) ) & ColorBits5To8(pixelBytes(16*8+4 downto 16*8+0) ) &
	ColorBits1To8(pixelBytes(16*7+15) ) & ColorBits5To8(pixelBytes(16*7+14 downto 16*7+10) ) & ColorBits5To8(pixelBytes(16*7+9 downto 16*7+5) ) & ColorBits5To8(pixelBytes(16*7+4 downto 16*7+0) ) &
	ColorBits1To8(pixelBytes(16*6+15) ) & ColorBits5To8(pixelBytes(16*6+14 downto 16*6+10) ) & ColorBits5To8(pixelBytes(16*6+9 downto 16*6+5) ) & ColorBits5To8(pixelBytes(16*6+4 downto 16*6+0) ) &
	ColorBits1To8(pixelBytes(16*5+15) ) & ColorBits5To8(pixelBytes(16*5+14 downto 16*5+10) ) & ColorBits5To8(pixelBytes(16*5+9 downto 16*5+5) ) & ColorBits5To8(pixelBytes(16*5+4 downto 16*5+0) ) &
	ColorBits1To8(pixelBytes(16*4+15) ) & ColorBits5To8(pixelBytes(16*4+14 downto 16*4+10) ) & ColorBits5To8(pixelBytes(16*4+9 downto 16*4+5) ) & ColorBits5To8(pixelBytes(16*4+4 downto 16*4+0) ) &
	ColorBits1To8(pixelBytes(16*3+15) ) & ColorBits5To8(pixelBytes(16*3+14 downto 16*3+10) ) & ColorBits5To8(pixelBytes(16*3+9 downto 16*3+5) ) & ColorBits5To8(pixelBytes(16*3+4 downto 16*3+0) ) &
	ColorBits1To8(pixelBytes(16*2+15) ) & ColorBits5To8(pixelBytes(16*2+14 downto 16*2+10) ) & ColorBits5To8(pixelBytes(16*2+9 downto 16*2+5) ) & ColorBits5To8(pixelBytes(16*2+4 downto 16*2+0) ) &
	ColorBits1To8(pixelBytes(16*1+15) ) & ColorBits5To8(pixelBytes(16*1+14 downto 16*1+10) ) & ColorBits5To8(pixelBytes(16*1+9 downto 16*1+5) ) & ColorBits5To8(pixelBytes(16*1+4 downto 16*1+0) ) &
	ColorBits1To8(pixelBytes(16*0+15) ) & ColorBits5To8(pixelBytes(16*0+14 downto 16*0+10) ) & ColorBits5To8(pixelBytes(16*0+9 downto 16*0+5) ) & ColorBits5To8(pixelBytes(16*0+4 downto 16*0+0) );
end function;

pure function UnpackA4R4G4B4Block(pixelBytes : UncompressedBlock) return UncompressedBlock is
begin
	return
	ColorBits4To8(pixelBytes(16*15+15 downto 16*15+12) ) & ColorBits4To8(pixelBytes(16*15+11 downto 16*15+8) ) & ColorBits4To8(pixelBytes(16*15+7 downto 16*15+4) ) & ColorBits4To8(pixelBytes(16*15+3 downto 16*15+0) ) &
	ColorBits4To8(pixelBytes(16*14+15 downto 16*14+12) ) & ColorBits4To8(pixelBytes(16*14+11 downto 16*14+8) ) & ColorBits4To8(pixelBytes(16*14+7 downto 16*14+4) ) & ColorBits4To8(pixelBytes(16*14+3 downto 16*14+0) ) &
	ColorBits4To8(pixelBytes(16*13+15 downto 16*13+12) ) & ColorBits4To8(pixelBytes(16*13+11 downto 16*13+8) ) & ColorBits4To8(pixelBytes(16*13+7 downto 16*13+4) ) & ColorBits4To8(pixelBytes(16*13+3 downto 16*13+0) ) &
	ColorBits4To8(pixelBytes(16*12+15 downto 16*12+12) ) & ColorBits4To8(pixelBytes(16*12+11 downto 16*12+8) ) & ColorBits4To8(pixelBytes(16*12+7 downto 16*12+4) ) & ColorBits4To8(pixelBytes(16*12+3 downto 16*12+0) ) &
	ColorBits4To8(pixelBytes(16*11+15 downto 16*11+12) ) & ColorBits4To8(pixelBytes(16*11+11 downto 16*11+8) ) & ColorBits4To8(pixelBytes(16*11+7 downto 16*11+4) ) & ColorBits4To8(pixelBytes(16*11+3 downto 16*11+0) ) &
	ColorBits4To8(pixelBytes(16*10+15 downto 16*10+12) ) & ColorBits4To8(pixelBytes(16*10+11 downto 16*10+8) ) & ColorBits4To8(pixelBytes(16*10+7 downto 16*10+4) ) & ColorBits4To8(pixelBytes(16*10+3 downto 16*10+0) ) &
	ColorBits4To8(pixelBytes(16*9+15 downto 16*9+12) ) & ColorBits4To8(pixelBytes(16*9+11 downto 16*9+8) ) & ColorBits4To8(pixelBytes(16*9+7 downto 16*9+4) ) & ColorBits4To8(pixelBytes(16*9+3 downto 16*9+0) ) &
	ColorBits4To8(pixelBytes(16*8+15 downto 16*8+12) ) & ColorBits4To8(pixelBytes(16*8+11 downto 16*8+8) ) & ColorBits4To8(pixelBytes(16*8+7 downto 16*8+4) ) & ColorBits4To8(pixelBytes(16*8+3 downto 16*8+0) ) &
	ColorBits4To8(pixelBytes(16*7+15 downto 16*7+12) ) & ColorBits4To8(pixelBytes(16*7+11 downto 16*7+8) ) & ColorBits4To8(pixelBytes(16*7+7 downto 16*7+4) ) & ColorBits4To8(pixelBytes(16*7+3 downto 16*7+0) ) &
	ColorBits4To8(pixelBytes(16*6+15 downto 16*6+12) ) & ColorBits4To8(pixelBytes(16*6+11 downto 16*6+8) ) & ColorBits4To8(pixelBytes(16*6+7 downto 16*6+4) ) & ColorBits4To8(pixelBytes(16*6+3 downto 16*6+0) ) &
	ColorBits4To8(pixelBytes(16*5+15 downto 16*5+12) ) & ColorBits4To8(pixelBytes(16*5+11 downto 16*5+8) ) & ColorBits4To8(pixelBytes(16*5+7 downto 16*5+4) ) & ColorBits4To8(pixelBytes(16*5+3 downto 16*5+0) ) &
	ColorBits4To8(pixelBytes(16*4+15 downto 16*4+12) ) & ColorBits4To8(pixelBytes(16*4+11 downto 16*4+8) ) & ColorBits4To8(pixelBytes(16*4+7 downto 16*4+4) ) & ColorBits4To8(pixelBytes(16*4+3 downto 16*4+0) ) &
	ColorBits4To8(pixelBytes(16*3+15 downto 16*3+12) ) & ColorBits4To8(pixelBytes(16*3+11 downto 16*3+8) ) & ColorBits4To8(pixelBytes(16*3+7 downto 16*3+4) ) & ColorBits4To8(pixelBytes(16*3+3 downto 16*3+0) ) &
	ColorBits4To8(pixelBytes(16*2+15 downto 16*2+12) ) & ColorBits4To8(pixelBytes(16*2+11 downto 16*2+8) ) & ColorBits4To8(pixelBytes(16*2+7 downto 16*2+4) ) & ColorBits4To8(pixelBytes(16*2+3 downto 16*2+0) ) &
	ColorBits4To8(pixelBytes(16*1+15 downto 16*1+12) ) & ColorBits4To8(pixelBytes(16*1+11 downto 16*1+8) ) & ColorBits4To8(pixelBytes(16*1+7 downto 16*1+4) ) & ColorBits4To8(pixelBytes(16*1+3 downto 16*1+0) ) &
	ColorBits4To8(pixelBytes(16*0+15 downto 16*0+12) ) & ColorBits4To8(pixelBytes(16*0+11 downto 16*0+8) ) & ColorBits4To8(pixelBytes(16*0+7 downto 16*0+4) ) & ColorBits4To8(pixelBytes(16*0+3 downto 16*0+0) );
end function;

pure function ExpandByteToL8Color(L8Byte : unsigned(7 downto 0) ) return unsigned is
begin
	return L8Byte & L8Byte & L8Byte & L8Byte;
end function;

pure function UnpackL8Block(L8Bytes : UncompressedBlock; IsL8Block : std_logic) return UncompressedBlock is
	variable ret : UncompressedBlock;
begin
	if (IsL8Block = '1') then
		ret := 
		  ExpandByteToL8Color(L8Bytes(16*8-1 downto 15*8) )
		& ExpandByteToL8Color(L8Bytes(15*8-1 downto 14*8) )
		& ExpandByteToL8Color(L8Bytes(14*8-1 downto 13*8) )
		& ExpandByteToL8Color(L8Bytes(13*8-1 downto 12*8) )
		& ExpandByteToL8Color(L8Bytes(12*8-1 downto 11*8) )
		& ExpandByteToL8Color(L8Bytes(11*8-1 downto 10*8) )
		& ExpandByteToL8Color(L8Bytes(10*8-1 downto 9*8) )
		& ExpandByteToL8Color(L8Bytes(9*8-1 downto 8*8) )
		& ExpandByteToL8Color(L8Bytes(8*8-1 downto 7*8) )
		& ExpandByteToL8Color(L8Bytes(7*8-1 downto 6*8) )
		& ExpandByteToL8Color(L8Bytes(6*8-1 downto 5*8) )
		& ExpandByteToL8Color(L8Bytes(5*8-1 downto 4*8) )
		& ExpandByteToL8Color(L8Bytes(4*8-1 downto 3*8) )
		& ExpandByteToL8Color(L8Bytes(3*8-1 downto 2*8) )
		& ExpandByteToL8Color(L8Bytes(2*8-1 downto 1*8) )
		& ExpandByteToL8Color(L8Bytes(1*8-1 downto 0*8) );
	else
		ret := L8Bytes(16*8-1 downto 15*8) & X"000000" & 
			L8Bytes(15*8-1 downto 14*8) & X"000000" &
			L8Bytes(14*8-1 downto 13*8) & X"000000" &
			L8Bytes(13*8-1 downto 12*8) & X"000000" &
			L8Bytes(12*8-1 downto 11*8) & X"000000" &
			L8Bytes(11*8-1 downto 10*8) & X"000000" &
			L8Bytes(10*8-1 downto 9*8) & X"000000" &
			L8Bytes(9*8-1 downto 8*8) & X"000000" &
			L8Bytes(8*8-1 downto 7*8) & X"000000" &
			L8Bytes(7*8-1 downto 6*8) & X"000000" &
			L8Bytes(6*8-1 downto 5*8) & X"000000" &
			L8Bytes(5*8-1 downto 4*8) & X"000000" &
			L8Bytes(4*8-1 downto 3*8) & X"000000" &
			L8Bytes(3*8-1 downto 2*8) & X"000000" &
			L8Bytes(2*8-1 downto 1*8) & X"000000" &
			L8Bytes(1*8-1 downto 0*8) & X"000000";
	end if;
	return ret;
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

TEXSAMP_CompressionResultsValid <= compressionResultsValid;
DBG_OutU(0) <= TEXSAMP_IsCompressed;
DBG_OutU(1) <= isCompressed0;
DBG_OutU(2) <= isCompressed1;
DBG_OutU(3) <= '0';
DBG_OutU(4) <= '0';
DBG_OutU(5) <= '0';
DBG_OutU(6) <= '0';
DBG_OutU(7) <= isLargeColorTable;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			enable0 <= TEXSAMP_NewBlockIsValid;
			isCompressed0 <= TEXSAMP_IsCompressed;
			uncompressedOpaqueAlpha0 <= TEXSAMP_UncompressedOpaqueAlpha;
			uncompressedFormat0 <= unsigned(TEXSAMP_UncompressedFormat);
			isLargeColorTable <= '-';
			isLargeAlphaTable <= '-';
			isDXT1 <= TEXSAMP_CompressionType(0); -- DXT1 bit
			isDXT3 <= TEXSAMP_CompressionType(1); -- DXT3 bit
			if (TEXSAMP_IsCompressed = '1') then
				if (TEXSAMP_CompressionType(0) = '1') then -- DXT1
					localBlock(8*8-1 downto 0) <= (others => '1');
					localBlock(16*8-1 downto 8*8) <= CompressedColorBlock(TEXSAMP_InCompressedPixelBits(8*8-1 downto 0) );

					DBG_Color0 <= std_logic_vector(GetRawColor0(CompressedColorBlock(TEXSAMP_InCompressedPixelBits(8*8-1 downto 0) ) ) );
					DBG_Color1 <= std_logic_vector(GetRawColor1(CompressedColorBlock(TEXSAMP_InCompressedPixelBits(8*8-1 downto 0) ) ) );
			
					if (GetRawColor0(CompressedColorBlock(TEXSAMP_InCompressedPixelBits(8*8-1 downto 0) ) ) > GetRawColor1(CompressedColorBlock(TEXSAMP_InCompressedPixelBits(8*8-1 downto 0) ) ) ) then
						isLargeColorTable <= '1';
					else
						isLargeColorTable <= '0';
					end if;
				else -- DXT3/5
					localBlock(16*8-1 downto 0) <= CompressedBlock(TEXSAMP_InCompressedPixelBits(16*8-1 downto 0) );
			
					if (GetRawColor0(GetColorBlockFromDXT35(CompressedBlock(TEXSAMP_InCompressedPixelBits(16*8-1 downto 0) ) ) ) > GetRawColor1(GetColorBlockFromDXT35(CompressedBlock(TEXSAMP_InCompressedPixelBits(16*8-1 downto 0) ) ) ) ) then
						isLargeColorTable <= '1';
					else
						isLargeColorTable <= '0';
					end if;

					if (unsigned(TEXSAMP_InCompressedPixelBits(7 downto 0) ) > unsigned(TEXSAMP_InCompressedPixelBits(15 downto 8) ) ) then
						isLargeAlphaTable <= '1';
					else
						isLargeAlphaTable <= '0';
					end if;
				end if;
			else
				localBlock <= unsigned(TEXSAMP_InCompressedPixelBits);
			end if;
		end if;
	end process;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			enable1 <= enable0;
			localBlock_1 <= localBlock;
			isCompressed1 <= isCompressed0;
			uncompressedOpaqueAlpha1 <= uncompressedOpaqueAlpha0;
			uncompressedFormat1 <= uncompressedFormat0;
			isDXT3_1 <= isDXT3;

			DXTColorSlots(0) <= ExpandR5G6B5ToR8G8B8(GetRawColor0(GetColorBlockFromDXT35(localBlock(16*8-1 downto 0) ) ) );
			DXTColorSlots(1) <= ExpandR5G6B5ToR8G8B8(GetRawColor1(GetColorBlockFromDXT35(localBlock(16*8-1 downto 0) ) ) );
			if (isLargeColorTable = '1') then
				DXTColorSlots(2) <= GetThirdsBlendedColor(GetRawColor0(GetColorBlockFromDXT35(localBlock(16*8-1 downto 0) ) ), GetRawColor1(GetColorBlockFromDXT35(localBlock(16*8-1 downto 0) ) ) );
				DXTColorSlots(3) <= GetThirdsBlendedColor(GetRawColor1(GetColorBlockFromDXT35(localBlock(16*8-1 downto 0) ) ), GetRawColor0(GetColorBlockFromDXT35(localBlock(16*8-1 downto 0) ) ) );
			else
				DXTColorSlots(2) <= GetAverageColor(GetRawColor0(GetColorBlockFromDXT35(localBlock(16*8-1 downto 0) ) ), GetRawColor1(GetColorBlockFromDXT35(localBlock(16*8-1 downto 0) ) ) );
				DXTColorSlots(3) <= (others => '0');
			end if;
			
			DXTAlphaSlots(0) <= localBlock(7 downto 0);
			DXTAlphaSlots(1) <= localBlock(15 downto 8);
			
			if (isDXT1 = '1') then
				DXTAlphaSlots(0) <= "--------";
				DXTAlphaSlots(1) <= "--------";
				DXTAlphaSlots(2) <= "--------";
				DXTAlphaSlots(3) <= "--------";
				DXTAlphaSlots(4) <= "--------";
				DXTAlphaSlots(5) <= "--------";
				if (isLargeColorTable = '1') then
					DXTAlphaSlots(6) <= "--------";
					DXTAlphaSlots(7) <= X"FF";
				else
					-- Set alpha palette slot 6 to black (0x00) and set alpha palette slot 7 to white (0xFF)
					DXTAlphaSlots(6) <= X"00";
					DXTAlphaSlots(7) <= X"FF";
				
					-- Modify the alpha block for this DXT block so that each of the alpha indices point to either slot 0 or slot 1
					for texelIndex in 0 to 15 loop
						if (GetColorPaletteIndexForTexelIndex(texelIndex, GetColorBlockFromDXT35(localBlock(16*8-1 downto 0) ) ) = "11") then -- color 3 is alpha'd out
							localBlock_1( (texelIndex + 1) * 3 + 16 - 1 downto texelIndex * 3 + 16) <= "110";
						else
							localBlock_1( (texelIndex + 1) * 3 + 16 - 1 downto texelIndex * 3 + 16) <= "111";
						end if;
					end loop;
				end if;
			else -- DXT3/5
				-- TODO: Validate that these calculations are correct in the case of overflow:
				if (isLargeAlphaTable = '1') then
					DXTAlphaSlots(2) <= GetSeventhsBlendedAlpha16(localBlock(15 downto 8), localBlock(7 downto 0) );
					DXTAlphaSlots(3) <= GetSeventhsBlendedAlpha25(localBlock(15 downto 8), localBlock(7 downto 0) );
					DXTAlphaSlots(4) <= GetSeventhsBlendedAlpha34(localBlock(15 downto 8), localBlock(7 downto 0) );
					DXTAlphaSlots(5) <= GetSeventhsBlendedAlpha34(localBlock(7 downto 0), localBlock(15 downto 8) );
					DXTAlphaSlots(6) <= GetSeventhsBlendedAlpha25(localBlock(7 downto 0), localBlock(15 downto 8) );
					DXTAlphaSlots(7) <= GetSeventhsBlendedAlpha16(localBlock(7 downto 0), localBlock(15 downto 8) );
				else
					DXTAlphaSlots(2) <= GetFifthsBlendedAlpha14(localBlock(15 downto 8), localBlock(7 downto 0) );
					DXTAlphaSlots(3) <= GetFifthsBlendedAlpha23(localBlock(15 downto 8), localBlock(7 downto 0) );
					DXTAlphaSlots(4) <= GetFifthsBlendedAlpha23(localBlock(7 downto 0), localBlock(15 downto 8) );
					DXTAlphaSlots(5) <= GetFifthsBlendedAlpha14(localBlock(7 downto 0), localBlock(15 downto 8) );
					DXTAlphaSlots(6) <= X"00";
					DXTAlphaSlots(7) <= X"FF";
				end if;
			end if;
		end if;
	end process;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			compressionResultsValid <= enable1;
			DBG_ColorTable0 <= std_logic_vector(DXTColorSlots(0) );
			DBG_ColorTable1 <= std_logic_vector(DXTColorSlots(1) );
			DBG_ColorTable2 <= std_logic_vector(DXTColorSlots(2) );
			DBG_ColorTable3 <= std_logic_vector(DXTColorSlots(3) );
			DBG_Alpha0 <= std_logic_vector(DXTAlphaSlots(0) );
			DBG_Alpha1 <= std_logic_vector(DXTAlphaSlots(1) );
			DBG_AlphaTable0 <= std_logic_vector(DXTAlphaSlots(0) );
			DBG_AlphaTable1 <= std_logic_vector(DXTAlphaSlots(1) );
			DBG_AlphaTable2 <= std_logic_vector(DXTAlphaSlots(2) );
			DBG_AlphaTable3 <= std_logic_vector(DXTAlphaSlots(3) );
			DBG_AlphaTable4 <= std_logic_vector(DXTAlphaSlots(4) );
			DBG_AlphaTable5 <= std_logic_vector(DXTAlphaSlots(5) );
			DBG_AlphaTable6 <= std_logic_vector(DXTAlphaSlots(6) );
			DBG_AlphaTable7 <= std_logic_vector(DXTAlphaSlots(7) );
			if (isCompressed1 = '1') then
				TEXSAMP_OutDecompressedPixels4x4 <= std_logic_vector(GatherUncompressedPixels4x4(DXTColorSlots, DXTAlphaSlots, localBlock_1(16*8-1 downto 0), isDXT3_1) );
			else
				TEXSAMP_OutDecompressedPixels4x4 <= (others => '-');
			
				if (uncompressedFormat1(0) = '1') then -- R5G6B5
					TEXSAMP_OutDecompressedPixels4x4 <= std_logic_vector(UnpackR5G6B5Block(localBlock_1) );
				end if;
				if (uncompressedFormat1(1) = '1') then -- A1R5G5B5/X1R5G5B5
					TEXSAMP_OutDecompressedPixels4x4 <= std_logic_vector(UnpackA1R5G5B5Block(localBlock_1) );
				end if;
				if (uncompressedFormat1(2) = '1') then -- A4R4G4B4/X4R4G4B4
					TEXSAMP_OutDecompressedPixels4x4 <= std_logic_vector(UnpackA4R4G4B4Block(localBlock_1) );
				end if;
				if (uncompressedFormat1(3) = '1') then -- A8/L8
					TEXSAMP_OutDecompressedPixels4x4 <= std_logic_vector(UnpackL8Block(localBlock_1, uncompressedOpaqueAlpha1) );
				end if;
				if (uncompressedFormat1(4) = '1') then -- A8R8G8B8/X8R8G8B8
					TEXSAMP_OutDecompressedPixels4x4 <= std_logic_vector(localBlock_1);
				end if;
			end if;
			
			-- Force the "A" component of our RGBA values to all 0xFF for the X8R8G8B8, R5G6B5, X1R5G5B5, X4R4G4B4, and L8 formats:
			if (uncompressedOpaqueAlpha1 = '1') then
				for pixelIndex in 0 to 15 loop
					TEXSAMP_OutDecompressedPixels4x4( (pixelIndex + 1) * 32 - 1 downto pixelIndex * 32 + 24) <= X"FF";
				end loop;
			end if;
		end if;
	end process;

end Behavioral;
