-- This Texture Cache block manages requests to the texture cache, and also handles the texture cache load process (which also involves texel format decompression) in the case of a cache miss.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include the PacketType library so that we can use the eTexFormat type
library work;
use work.PacketType.all;

entity TestTexCache is
	Port ( clk : in STD_LOGIC;

		TEX_TexID : in STD_LOGIC_VECTOR(5 downto 0);
		TEX_MipLevel : in STD_LOGIC_VECTOR(3 downto 0);
		TEX_TexFormat : in STD_LOGIC_VECTOR(3 downto 0);
		TEX_QueriesValid : in STD_LOGIC_VECTOR(3 downto 0);
		TEX_BlockID_TL : in STD_LOGIC_VECTOR(16 downto 0);
		TEX_BlockID_TR : in STD_LOGIC_VECTOR(16 downto 0);
		TEX_BlockID_BL : in STD_LOGIC_VECTOR(16 downto 0);
		TEX_BlockID_BR : in STD_LOGIC_VECTOR(16 downto 0);
		TEX_BlockPixelIndex_TL : in STD_LOGIC_VECTOR(1 downto 0);
		TEX_BlockPixelIndex_TR : in STD_LOGIC_VECTOR(1 downto 0);
		TEX_BlockPixelIndex_BL : in STD_LOGIC_VECTOR(1 downto 0);
		TEX_BlockPixelIndex_BR : in STD_LOGIC_VECTOR(1 downto 0);
		TEX_CacheSet_TL : in STD_LOGIC_VECTOR(5 downto 0);
		TEX_CacheSet_TR : in STD_LOGIC_VECTOR(5 downto 0);
		TEX_CacheSet_BL : in STD_LOGIC_VECTOR(5 downto 0);
		TEX_CacheSet_BR : in STD_LOGIC_VECTOR(5 downto 0);
		TEX_IsRequestReady : in STD_LOGIC;

		TEX_OutColorReady : out STD_LOGIC := '0';
		TEX_OutColorTL : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TEX_OutColorTR : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TEX_OutColorBL : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TEX_OutColorBR : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

	-- Memory controller interfaces begin
		TEXReadRequestsFIFO_full : in STD_LOGIC;
		TEXReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(30-1 downto 0) := (others => '0');
		TEXReadRequestsFIFO_wr_en : out STD_LOGIC := '0';

		TEXReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR(256-1 downto 0);
        TEXReadResponsesFIFO_empty : in STD_LOGIC;
        TEXReadResponsesFIFO_rd_en : out STD_LOGIC := '0';
	-- Memory controller interfaces end

	-- Texture Descriptors BRAM interface begin
		TEXDESCBRAM_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		TEXDESCBRAM_clka : out STD_LOGIC := '0';
		TEXDESCBRAM_dina : out STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
		TEXDESCBRAM_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
		TEXDESCBRAM_addrb : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		TEXDESCBRAM_clkb : out STD_LOGIC := '0';
		TEXDESCBRAM_doutb : in STD_LOGIC_VECTOR(17 downto 0);
	-- Texture Descriptors BRAM interface end

	-- Interface for writing descriptor data begin
		TEX_WriteDescriptorTexID : in STD_LOGIC_VECTOR(5 downto 0);
		TEX_WriteDescriptorBaseAddrEn : in STD_LOGIC;
		TEX_WriteDescriptorBaseAddr : in STD_LOGIC_VECTOR(14 downto 0);
		TEX_WriteDescriptorMipOffsetEn : in STD_LOGIC;
		TEX_WriteDescriptorMipOffset : in STD_LOGIC_VECTOR(17 downto 0);
		TEX_WriteDescriptorMipLevel : in STD_LOGIC_VECTOR(3 downto 0);
	-- Interface for writing descriptor data end

	-- Texels cache (x4) BRAM interfaces begin
		BRAM0_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		BRAM0_clka : out STD_LOGIC := '0';
		BRAM0_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		BRAM0_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
		BRAM0_addrb : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		BRAM0_clkb : out STD_LOGIC := '0';
		BRAM0_doutb : in STD_LOGIC_VECTOR(31 downto 0);

		BRAM1_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		BRAM1_clka : out STD_LOGIC := '0';
		BRAM1_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		BRAM1_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
		BRAM1_addrb : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		BRAM1_clkb : out STD_LOGIC := '0';
		BRAM1_doutb : in STD_LOGIC_VECTOR(31 downto 0);

		BRAM2_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		BRAM2_clka : out STD_LOGIC := '0';
		BRAM2_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		BRAM2_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
		BRAM2_addrb : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		BRAM2_clkb : out STD_LOGIC := '0';
		BRAM2_doutb : in STD_LOGIC_VECTOR(31 downto 0);

		BRAM3_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		BRAM3_clka : out STD_LOGIC := '0';
		BRAM3_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		BRAM3_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
		BRAM3_addrb : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		BRAM3_clkb : out STD_LOGIC := '0';
		BRAM3_doutb : in STD_LOGIC_VECTOR(31 downto 0);
	-- Texels cache (x4) BRAM interfaces end

	-- Texture Decompression Block interface begin
		DECOMP_ReadyForNewBlock : in STD_LOGIC;
		DECOMP_NewBlockIsValid : out STD_LOGIC := '0';

		DECOMP_CompressionResultsReady : out STD_LOGIC := '0';
		DECOMP_CompressionResultsValid : in STD_LOGIC;

		DECOMP_IsCompressed : out STD_LOGIC := '0';
		DECOMP_CompressionType : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

		DECOMP_UncompressedOpaqueAlpha : out STD_LOGIC := '0';
		DECOMP_UncompressedFormat : out STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

		DECOMP_InCompressedPixelBits : out STD_LOGIC_VECTOR(16*32-1 downto 0) := (others => '0');
		DECOMP_OutDecompressedPixels4x4 : in STD_LOGIC_VECTOR(16*32-1 downto 0);
	-- Texture Decompression Block interface end

		Decomp_FIFO_rd_data : in STD_LOGIC_VECTOR(16*32-1 downto 0);
        Decomp_FIFO_empty : in STD_LOGIC;
        Decomp_FIFO_rd_en : out STD_LOGIC := '0';

		FILT_VertColorRGBA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FILT_TexelFetchTL : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FILT_TexelFetchTR : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FILT_TexelFetchBL : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FILT_TexelFetchBR : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		FILT_BilinearX : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		FILT_BilinearY : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		FILT_PixelCoordX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		FILT_PixelCoordY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		FILT_PixelIsValid : out std_logic := '0';

		LOAD_Coord_CacheSet : in STD_LOGIC_VECTOR(5 downto 0);
		LOAD_Coord_CacheIndex : in STD_LOGIC_VECTOR(1 downto 0);
		LOAD_Coord_QuadID : in STD_LOGIC_VECTOR(1 downto 0);
		LOAD_Coord_TexID : in STD_LOGIC_VECTOR(5 downto 0); -- For debugging only
		LOAD_Coord_MipLevel : in STD_LOGIC_VECTOR(3 downto 0); -- For debugging only
		LOAD_Coord_BlockID : in STD_LOGIC_VECTOR(16 downto 0); -- For debugging only
		LOAD_TexData : in STD_LOGIC_VECTOR(4*32-1 downto 0); -- Uncompressed (A8R8G8B8) texel data for a single 2x2 quad of the 4x4 block
		LOAD_IsReady : in STD_LOGIC
		);
end TestTexCache;

architecture Behavioral of TestTexCache is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333000000";

ATTRIBUTE X_INTERFACE_INFO of TEXDESCBRAM_clka: SIGNAL is "xilinx.com:interface:bram:1.0 TEXDESCBRAM CLK";
ATTRIBUTE X_INTERFACE_INFO of TEXDESCBRAM_clkb: SIGNAL is "xilinx.com:interface:bram:1.0 TEXDESCBRAM CLK";
ATTRIBUTE X_INTERFACE_INFO of TEXDESCBRAM_doutb: SIGNAL is "xilinx.com:interface:bram:1.0 TEXDESCBRAM DOUT";
ATTRIBUTE X_INTERFACE_INFO of TEXDESCBRAM_dina: SIGNAL is "xilinx.com:interface:bram:1.0 TEXDESCBRAM DIN";
ATTRIBUTE X_INTERFACE_INFO of TEXDESCBRAM_wea: SIGNAL is "xilinx.com:interface:bram:1.0 TEXDESCBRAM WE";
ATTRIBUTE X_INTERFACE_INFO of TEXDESCBRAM_addra: SIGNAL is "xilinx.com:interface:bram:1.0 TEXDESCBRAM ADDR";
ATTRIBUTE X_INTERFACE_INFO of TEXDESCBRAM_addrb: SIGNAL is "xilinx.com:interface:bram:1.0 TEXDESCBRAM ADDR";

ATTRIBUTE X_INTERFACE_INFO of BRAM0_clka: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0 CLK";
ATTRIBUTE X_INTERFACE_INFO of BRAM0_clkb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0 CLK";
ATTRIBUTE X_INTERFACE_INFO of BRAM0_doutb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0 DOUT";
ATTRIBUTE X_INTERFACE_INFO of BRAM0_dina: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0 DIN";
ATTRIBUTE X_INTERFACE_INFO of BRAM0_wea: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0 WE";
ATTRIBUTE X_INTERFACE_INFO of BRAM0_addra: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0 ADDR";
ATTRIBUTE X_INTERFACE_INFO of BRAM0_addrb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM0 ADDR";

ATTRIBUTE X_INTERFACE_INFO of BRAM1_clka: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1 CLK";
ATTRIBUTE X_INTERFACE_INFO of BRAM1_clkb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1 CLK";
ATTRIBUTE X_INTERFACE_INFO of BRAM1_doutb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1 DOUT";
ATTRIBUTE X_INTERFACE_INFO of BRAM1_dina: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1 DIN";
ATTRIBUTE X_INTERFACE_INFO of BRAM1_wea: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1 WE";
ATTRIBUTE X_INTERFACE_INFO of BRAM1_addra: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1 ADDR";
ATTRIBUTE X_INTERFACE_INFO of BRAM1_addrb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM1 ADDR";

ATTRIBUTE X_INTERFACE_INFO of BRAM2_clka: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2 CLK";
ATTRIBUTE X_INTERFACE_INFO of BRAM2_clkb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2 CLK";
ATTRIBUTE X_INTERFACE_INFO of BRAM2_doutb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2 DOUT";
ATTRIBUTE X_INTERFACE_INFO of BRAM2_dina: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2 DIN";
ATTRIBUTE X_INTERFACE_INFO of BRAM2_wea: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2 WE";
ATTRIBUTE X_INTERFACE_INFO of BRAM2_addra: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2 ADDR";
ATTRIBUTE X_INTERFACE_INFO of BRAM2_addrb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM2 ADDR";

ATTRIBUTE X_INTERFACE_INFO of BRAM3_clka: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3 CLK";
ATTRIBUTE X_INTERFACE_INFO of BRAM3_clkb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3 CLK";
ATTRIBUTE X_INTERFACE_INFO of BRAM3_doutb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3 DOUT";
ATTRIBUTE X_INTERFACE_INFO of BRAM3_dina: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3 DIN";
ATTRIBUTE X_INTERFACE_INFO of BRAM3_wea: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3 WE";
ATTRIBUTE X_INTERFACE_INFO of BRAM3_addra: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3 ADDR";
ATTRIBUTE X_INTERFACE_INFO of BRAM3_addrb: SIGNAL is "xilinx.com:interface:bram:1.0 BRAM3 ADDR";

type MemLoadStateType is 
(
	waitingForMemReturn, -- 0
	deasserting0, -- 1
	deassertingHighHalf, -- 2
	deassertingHalfQuad, -- 3
	deassertingDXT1, -- 4
);

type CacheStateType is
(
	cacheGoodState, -- 0
	cacheMissState -- 1
);

type structCacheEntry is record
	textureID : unsigned(5 downto 0);
	mipLevel : unsigned(3 downto 0);
	blockID : unsigned(16 downto 0);
end record structCacheEntry;

type structCacheSet is record -- This is a 4-way set associative cache, so each cache set has 4 entries:
	entry0 : structCacheEntry;
	entry1 : structCacheEntry;
	entry2 : structCacheEntry;
	entry3 : structCacheEntry;
end record structCacheSet;

type structCacheSetAge is record
	entry0age : unsigned(1 downto 0);
	entry1age : unsigned(1 downto 0);
	entry2age : unsigned(1 downto 0);
	entry3age : unsigned(1 downto 0);
end record structCacheSetAge;

type cacheLines_t is array(63 downto 0) of structCacheSet;
type cacheLineAges_t is array(63 downto 0) of structCacheSetAge;

type texBaseOffset_t is unsigned(14 downto 0);
type texBaseOffsetsArr_t is array(63 downto 0) of texBaseOffset_t;

signal cacheLines : cacheLines_t := (others => (others => (others => '0') ) );
signal cacheLinesAges : cacheLines_t := (others => (others => (others => '0') ) );
signal baseTexOffsets : texBaseOffsetsArr_t := (others => (others => '0') );

pure function CheckCacheHit(cacheSet : structCacheSet; textureID : unsigned(5 downto 0); mipLevel : unsigned(3 downto 0); blockID : unsigned(16 downto 0) ) return boolean is
begin
	return ( (cacheSet.entry0.textureID = textureID and cacheSet.entry0.mipLevel = mipLevel and cacheSet.entry0.blockID = blockID) or
			(cacheSet.entry1.textureID = textureID and cacheSet.entry1.mipLevel = mipLevel and cacheSet.entry1.blockID = blockID) or
			(cacheSet.entry2.textureID = textureID and cacheSet.entry2.mipLevel = mipLevel and cacheSet.entry2.blockID = blockID) or
			(cacheSet.entry3.textureID = textureID and cacheSet.entry3.mipLevel = mipLevel and cacheSet.entry3.blockID = blockID) );
end function;

-- Returns the index of the cache hit (0, 1, 2, or 3) as a 2-bit unsigned (assumes that a cache hit occurred):
pure function GetCacheHitEntryID(cacheSet : structCacheSet; textureID : unsigned(5 downto 0); mipLevel : unsigned(3 downto 0); blockID : unsigned(16 downto 0) ) return unsigned is
begin
	if (cacheSet.entry1.textureID = textureID and cacheSet.entry1.mipLevel = mipLevel and cacheSet.entry1.blockID = blockID) then
		return to_unsigned(1, 2);
	end if;
	if (cacheSet.entry2.textureID = textureID and cacheSet.entry2.mipLevel = mipLevel and cacheSet.entry2.blockID = blockID) then
		return to_unsigned(2, 2);
	end if;
	if (cacheSet.entry3.textureID = textureID and cacheSet.entry3.mipLevel = mipLevel and cacheSet.entry3.blockID = blockID) then
		return to_unsigned(3, 2);
	end if;
	return to_unsigned(0, 2);
end function;

-- This function computes the address in the TexDescriptors BRAM where we'll be able to look up the VRAM address of the texture block that begins this mip-level
pure function ComputeDescriptorPtrAddr(textureID : unsigned(5 downto 0); mipLevel : unsigned(3 downto 0) ) return unsigned is
begin
	return (textureID sll 4) + mipLevel;
end function;

-- Gets the log2 size of a 4x4 block of texels of a given texture format:
pure function GetBlockSizeLog2(format : unsigned(3 downto 0) ) return unsigned is
begin
	case eTexFormat'val(to_integer(format) ) is
		-- DXTn compressed formats:
		when eTexFmtDXT1 =>
			return to_unsigned(3, 3);
		when eTexFmtDXT3 | eTexFmtDXT5 =>
			return to_unsigned(4, 3);
		-- 1bpp uncompressed formats:
		when eTexFmtA8 | eTexFmtL8 =>
			return to_unsigned(4, 3);
		-- 2bpp uncompressed formats:
		when eTexFmtA4R4G4B4 | eTexFmtX4R4G4B4 | eTexFmtR5G6B5 | eTexFmtA1R5G5B5 | eTexFmtX1R5G5B5 =>
			return to_unsigned(5, 3);
		-- 4bpp uncompressed formats:
		when others => -- eTexFmtA8R8G8B8 | eTexFmtX8R8G8B8
			return to_unsigned(6, 3);
	end case;
end function;

-- Gets the number of DRAM requests that we send in order to load 4 blocks for a given texture format
pure function GetDRAMRequests4BlocksCount(format : unsigned(3 downto 0) ) return unsigned is
begin
	case eTexFormat'val(to_integer(format) ) is
		-- DXTn compressed formats:
		when eTexFmtDXT1 =>
			return to_unsigned(1, 4);
		when eTexFmtDXT3 | eTexFmtDXT5 =>
			return to_unsigned(2, 4);
		-- 1bpp uncompressed formats:
		when eTexFmtA8 | eTexFmtL8 =>
			return to_unsigned(2, 4);
		-- 2bpp uncompressed formats:
		when eTexFmtA4R4G4B4 | eTexFmtX4R4G4B4 | eTexFmtR5G6B5 | eTexFmtA1R5G5B5 | eTexFmtX1R5G5B5 =>
			return to_unsigned(4, 4);
		-- 4bpp uncompressed formats:
		when others => -- eTexFmtA8R8G8B8 | eTexFmtX8R8G8B8
			return to_unsigned(8, 4);
	end case;
end function;

-- Computes the address of the given texel block, in bytes
pure function ComputeBlockAddr(format : unsigned(3 downto 0); baseTexAlignedRow : unsigned(14 downto 0); mipOffset : unsigned(17 downto 0); blockID : unsigned(16 downto 0); isUpperHalf32Block : std_logic) return unsigned is
begin
	if (isUpperHalf32Block = '0') then
		return (baseTexAlignedRow & "000000000000000") + (mipOffset & "00000") + (blockID sll to_integer(GetBlockSizeLog2(format) ) );
	else
		return (baseTexAlignedRow & "000000000000000") + (mipOffset & "00000") + (blockID sll to_integer(GetBlockSizeLog2(format) ) ) + 32;
	end if;
end function;

pure function GetBlockPixelIndex(pixelX : natural; pixelY : natural) return natural is
begin
	return pixelY * 4 + pixelX;
end function;

pure function GetBlockPixelData(uncompressedPixels : unsigned(16*32-1 downto 0); pixelX : natural; pixelY : natural) return unsigned is
begin
	return uncompressedPixels( (GetBlockPixelIndex(pixelX, pixelY) + 1) * 32 - 1 downto GetBlockPixelIndex(pixelX, pixelY) * 32);
end function;

signal TLCacheSet : structCacheSet;
signal TRCacheSet : structCacheSet;
signal BLCacheSet : structCacheSet;
signal BRCacheSet : structCacheSet;
signal TLCompareBlockID : unsigned(16 downto 0);
signal TRCompareBlockID : unsigned(16 downto 0);
signal BLCompareBlockID : unsigned(16 downto 0);
signal BRCompareBlockID : unsigned(16 downto 0);
signal CacheState : CacheStateType := cacheGoodState;
signal CompareTexID : unsigned(5 downto 0);
signal CompareMipLevel : unsigned(3 downto 0);
signal MemLoadCompressedData : unsigned(16*32-1 downto 0) := (others => '0');
signal MemLoadHighHalf : std_logic := '0';
signal MemLoadDXT1Counter : unsigned(1 downto 0) := (others => '0');
signal MemLoadState : MemLoadStateType := waitingForMemReturn;
signal MemLoadFormat : eTexFormat := eTexFmtA8R8G8B8;
signal MemLoadSubChunk : unsigned(1 downto 0) := (others => '0');
signal CacheLoadQuadStage : unsigned(1 downto 0) := (others => '0');
signal CacheLoadCacheSetID : unsigned(5 downto 0) := (others => '0');
signal CacheLoadCacheSetIndex : unsigned(1 downto 0) := (others => '0');
signal CacheHits : unsigned(3 downto 0) := (others => '0');
signal CacheHits_1 : unsigned(3 downto 0) := (others => '0');
signal CacheHits_2 : unsigned(3 downto 0) := (others => '0');
signal CacheMisses : unsigned(3 downto 0) := (others => '0');
signal TLCacheHitIndex : unsigned(1 downto 0) := (others => '0');
signal TRCacheHitIndex : unsigned(1 downto 0) := (others => '0');
signal BLCacheHitIndex : unsigned(1 downto 0) := (others => '0');
signal BRCacheHitIndex : unsigned(1 downto 0) := (others => '0');
signal RetPixelTL : unsigned(32-1 downto 0) := (others => '0');
signal RetPixelTR : unsigned(32-1 downto 0) := (others => '0');
signal RetPixelBL : unsigned(32-1 downto 0) := (others => '0');
signal RetPixelBR : unsigned(32-1 downto 0) := (others => '0');
signal RetPixelValid : unsigned(3 downto 0) := (others => '0');

begin

	BRAM0_clka <= clk;
	BRAM0_clkb <= clk;
	BRAM1_clka <= clk;
	BRAM1_clkb <= clk;
	BRAM2_clka <= clk;
	BRAM2_clkb <= clk;
	BRAM3_clka <= clk;
	BRAM3_clkb <= clk;
	TEXDESCBRAM_clka <= clk;
	TEXDESCBRAM_clkb <= clk;
	DECOMP_InCompressedPixelBits <= std_logic_vector(MemLoadCompressedData);

	ReadInputsProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			if (CacheState = cacheGoodState and TEX_IsRequestReady = '1') then
				TLCacheSet <= cacheLines(to_integer(unsigned(TEX_CacheSet_TL) ) );
				TRCacheSet <= cacheLines(to_integer(unsigned(TEX_CacheSet_TR) ) );
				BLCacheSet <= cacheLines(to_integer(unsigned(TEX_CacheSet_BL) ) );
				BRCacheSet <= cacheLines(to_integer(unsigned(TEX_CacheSet_BR) ) );
				TLCompareBlockID <= unsigned(TEX_BlockID_TL);
				TRCompareBlockID <= unsigned(TEX_BlockID_TR);
				BLCompareBlockID <= unsigned(TEX_BlockID_BL);
				BRCompareBlockID <= unsigned(TEX_BlockID_BR);
				TEXDESCBRAM_addrb <= TEX_TexID & TEX_MipLevel;
			end if;
		end if;
	end process ReadInputsProc;

	CacheLookupProc : process(clk)
		variable varCacheHits : std_logic_vector(3 downto 0);
		variable varCacheMisses : std_logic_vector(3 downto 0);
		variable anyCacheHits : std_logic;
	begin
		if (rising_edge(clk) ) then
			varCacheHits(0) := '1' when CheckCacheHit(TLCacheSet, CompareTexID, CompareMipLevel, TLCompareBlockID) else '0';
			varCacheHits(1) := '1' when CheckCacheHit(TRCacheSet, CompareTexID, CompareMipLevel, TRCompareBlockID) else '0';
			varCacheHits(2) := '1' when CheckCacheHit(BLCacheSet, CompareTexID, CompareMipLevel, BLCompareBlockID) else '0';
			varCacheHits(3) := '1' when CheckCacheHit(BRCacheSet, CompareTexID, CompareMipLevel, BRCompareBlockID) else '0';
			anyCacheHits := varCacheHits(0) or varCacheHits(1) or varCacheHits(2) or varCacheHits(3);
			varCacheMisses := (not varCacheHits) or (not TEX_QueriesValid);
			CacheHits <= unsigned(varCacheHits);
			CacheMisses <= unsigned(varCacheMisses);
			TLCacheHitIndex <= GetCacheHitEntryID(TLCacheSet, CompareTexID, CompareMipLevel, TLCompareBlockID);
			TRCacheHitIndex <= GetCacheHitEntryID(TRCacheSet, CompareTexID, CompareMipLevel, TRCompareBlockID);
			BLCacheHitIndex <= GetCacheHitEntryID(BLCacheSet, CompareTexID, CompareMipLevel, BLCompareBlockID);
			BRCacheHitIndex <= GetCacheHitEntryID(BRCacheSet, CompareTexID, CompareMipLevel, BRCompareBlockID);
			if (varCacheMisses /= "0000") then
				CacheState <= cacheMissState;
			end if;

			-- TODO: Finish cache hit logic (rotate caches on hits)
		end if;
	end process CacheLookupProc;

	CacheReadBRAMProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			CacheHits_1 <= CacheHits;
			BRAM0_addrb <= std_logic_vector(TEX_CacheSet_TL & TLCacheHitIndex & TEX_BlockPixelIndex_TL);
			BRAM1_addrb <= std_logic_vector(TEX_CacheSet_TR & TRCacheHitIndex & TEX_BlockPixelIndex_TR);
			BRAM2_addrb <= std_logic_vector(TEX_CacheSet_BL & BLCacheHitIndex & TEX_BlockPixelIndex_BL);
			BRAM3_addrb <= std_logic_vector(TEX_CacheSet_BR & BRCacheHitIndex & TEX_BlockPixelIndex_BR);
		end if;
	end process CacheReadBRAMProc;

	BRAMReadWaitProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			CacheHits_2 <= CacheHits_1;
		end if;
	end process BRAMReadWaitProc;

	BRAMReadDataProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			if (CacheHits_2(0) = '1') then
				RetPixelTL <= BRAM0_doutb;
			end if;
			if (CacheHits_2(1) = '1') then
				RetPixelTL <= BRAM1_doutb;
			end if;
			if (CacheHits_2(2) = '1') then
				RetPixelTL <= BRAM2_doutb;
			end if;
			if (CacheHits_2(3) = '1') then
				RetPixelTL <= BRAM3_doutb;
			end if;

			if (RetPixelValid = "1111") then
				RetPixelValid <= CacheHits_2;
			else
				RetPixelValid <= RetPixelValid or CacheHits_2;
			end if;
		end if;
	end process BRAMReadDataProc;

	RetPixelExportProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			TEX_OutColorTL <= std_logic_vector(RetPixelTL);
			TEX_OutColorTR <= std_logic_vector(RetPixelTR);
			TEX_OutColorBL <= std_logic_vector(RetPixelBL);
			TEX_OutColorBR <= std_logic_vector(RetPixelBR);

			if (RetPixelValid = "1111") then
				TEX_OutColorReady <= '1';
			else
				TEX_OutColorReady <= '0';
			end if;
		end if;
	end process RetPixelExportProc;

	QueueCacheMissReads : process(clk)
		variable mipOffsetBlocks : unsigned(17 downto 0);
		variable textureBaseMemRow : unsigned(14 downto 0);
	begin
		if (rising_edge(clk) ) then
			TEXReadRequestsFIFO_wr_en <= '0';

			mipOffsetBlocks := unsigned(TEXDESCBRAM_doutb);
			textureBaseMemRow := baseTexOffsets(to_integer(CompareTexID) );

			if (CacheMisses(3) = '1') then
				TEXReadRequestsFIFO_wr_data <= std_logic_vector(ComputeBlockAddr(unsigned(TEX_TexFormat), textureBaseMemRow, mipOffsetBlocks, BRCompareBlockID, upperHalf32Block) );
				TEXReadRequestsFIFO_wr_en <= '1';

				case eTexFormat'val(to_integer(unsigned(TEX_TexFormat) ) ) is
					when eTexFmtA8R8G8B8 | eTexFmtX8R8G8B8 =>
						if (upperHalf32Block = '1') then
							CacheMisses(3) <= '0';
						end if;
					when others =>
						CacheMisses(3) <= '0';
				end case;
			elsif (CacheMisses(2) = '1') then
				TEXReadRequestsFIFO_wr_data <= std_logic_vector(ComputeBlockAddr(unsigned(TEX_TexFormat), textureBaseMemRow, mipOffsetBlocks, BLCompareBlockID, upperHalf32Block) );
				TEXReadRequestsFIFO_wr_en <= '1';

				case eTexFormat'val(to_integer(unsigned(TEX_TexFormat) ) ) is
					when eTexFmtA8R8G8B8 | eTexFmtX8R8G8B8 =>
						if (upperHalf32Block = '1') then
							CacheMisses(2) <= '0';
						end if;
					when others =>
						CacheMisses(2) <= '0';
				end case;
			elsif (CacheMisses(1) = '1') then
				TEXReadRequestsFIFO_wr_data <= std_logic_vector(ComputeBlockAddr(unsigned(TEX_TexFormat), textureBaseMemRow, mipOffsetBlocks, TRCompareBlockID, upperHalf32Block) );
				TEXReadRequestsFIFO_wr_en <= '1';

				case eTexFormat'val(to_integer(unsigned(TEX_TexFormat) ) ) is
					when eTexFmtA8R8G8B8 | eTexFmtX8R8G8B8 =>
						if (upperHalf32Block = '1') then
							CacheMisses(1) <= '0';
						end if;
					when others =>
						CacheMisses(1) <= '0';
				end case;
			elsif (CacheMisses(0) = '1') then
				TEXReadRequestsFIFO_wr_data <= std_logic_vector(ComputeBlockAddr(unsigned(TEX_TexFormat), textureBaseMemRow, mipOffsetBlocks, TLCompareBlockID, upperHalf32Block) );
				TEXReadRequestsFIFO_wr_en <= '1';

				case eTexFormat'val(to_integer(unsigned(TEX_TexFormat) ) ) is
					when eTexFmtA8R8G8B8 | eTexFmtX8R8G8B8 =>
						if (upperHalf32Block = '1') then
							CacheMisses(0) <= '0';
						end if;
					when others =>
						CacheMisses(0) <= '0';
				end case;
			end if;

			case eTexFormat'val(to_integer(unsigned(TEX_TexFormat) ) ) is
				when eTexFmtA8R8G8B8 | eTexFmtX8R8G8B8 =>
					upperHalf32Block <= not upperHalf32Block;
				when others =>
					upperHalf32Block <= '0';
			end case;

		end if;
	end process QueueCacheMissReads;

	WriteDescriptorBaseAddrProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			if (TEX_WriteDescriptorBaseAddrEn) then
				baseTexOffsets(to_integer(unsigned(TEX_WriteDescriptorTexID) ) ) <= unsigned(TEX_WriteDescriptorBaseAddr);
			end if;
		end if;
	end process WriteDescriptorBaseAddrProc;

	WriteDescriptorMipOffsetProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			TEXDESCBRAM_wea <= "1" when TEX_WriteDescriptorMipOffsetEn = '1' else "0";
			TEXDESCBRAM_dina <= TEX_WriteDescriptorMipOffset;
			TEXDESCBRAM_addra <= TEX_WriteDescriptorTexID & TEX_WriteDescriptorMipLevel;
		end if;
	end process WriteDescriptorMipOffsetProc;

	-- TODO: Handle cache misses generating a new memory request

	HandleMemReadResponse : process(clk)
	begin
		if (rising_edge(clk) ) then
			TEXReadResponsesFIFO_rd_en <= '0';
			DECOMP_NewBlockIsValid <= '0';

			case MemLoadFormat is
				when eTexFmtDXT1 | eTexFmtDXT3 | eTexFmtDXT5 =>
					DECOMP_IsCompressed <= '1';
				when others =>
					DECOMP_IsCompressed <= '0;
			end case;

			case MemLoadFormat is
				when eTexFmtDXT1 =>
					DECOMP_CompressionType <= "010";
				when eTexFmtDXT3 =>
					DECOMP_CompressionType <= "011";
				when eTexFmtDXT5 =>
					DECOMP_CompressionType <= "111";
				when others =>
					DECOMP_CompressionType <= (others => '0');
			end case;

			case MemLoadFormat is
				when eTexFmtX8R8G8B8 | eTexFmtR5G6B5 | eTexFmtX1R5G5B5 | eTexFmtX4R4G4B4 | eTexFmtL8 =>
					DECOMP_UncompressedOpaqueAlpha <= '1';
				when others =>
					DECOMP_UncompressedOpaqueAlpha <= '0;
			end case;

			case MemLoadFormat is
				when eTexFmtA8R8G8B8 | eTexFmtX8R8G8B8 =>
					DECOMP_UncompressedFormat <= "100";
				when eTexFmtA1R5G5B5 | eTexFmtX1R5G5B5 =>
					DECOMP_UncompressedFormat <= "001";
				when eTexFmtA4R4G4B4 | eTexFmtX4R4G4B4 =>
					DECOMP_UncompressedFormat <= "010";
				when eTexFmtA8 | eTexFmtL8 =>
					DECOMP_UncompressedFormat <= "011";
				when eTexFmtR5G6B5 =>
					DECOMP_UncompressedFormat <= "000";
				when others =>
					DECOMP_UncompressedFormat <= (others => '0');
			end case;

			case MemLoadState is
				when waitingForMemReturn =>
					if (TEXReadResponsesFIFO_empty = '0') then
						TEXReadResponsesFIFO_rd_en <= '1';

						if (MemLoadHighHalf = '0') then
							MemLoadCompressedData(8*32-1 downto 0) <= unsigned(TEXReadResponsesFIFO_rd_data);
						else
							MemLoadCompressedData(16*32-1 downto 8*32) <= unsigned(TEXReadResponsesFIFO_rd_data);
						end if;

						if (MemLoadHighHalf = '0' and (MemLoadFormat = eTexFmtA8R8G8B8 or MemLoadFormat = eTexFmtX8R8G8B8) ) then
							MemLoadState <= deassertingHighHalf;
						else
							MemLoadState <= deasserting0;
						end if;
					end if;
				when deasserting0 =>
					DECOMP_NewBlockIsValid <= '1';
					case MemLoadFormat is
						when eTexFmtA8 | eTexFmtL8 | eTexFmtDXT3 | eTexFmtDXT5 =>
							MemLoadState <= deassertingHalfQuad;
						when eTexFmtDXT1 =>
							MemLoadDXT1Counter <= "10";
							MemLoadState <= deassertingDXT1;
						when others =>
							MemLoadState <= waitingForMemReturn;
					end case;

				when deassertingHalfQuad => -- Half-quad types just get a single shift-down because they represent a quad of pixels in 0.5 DRAM reads
					DECOMP_NewBlockIsValid <= '1';
					MemLoadCompressedData(8*32-1 downto 0) <= MemLoadCompressedData(16*32-1 downto 8*32);
					MemLoadState <= waitingForMemReturn;

				when deassertingDXT1 =>
					DECOMP_NewBlockIsValid <= '1';
					MemLoadCompressedData(4*32-1 downto 0) <= MemLoadCompressedData(8*32-1 downto 4*32);
					MemLoadCompressedData(8*32-1 downto 4*32) <= MemLoadCompressedData(12*32-1 downto 8*32);
					MemLoadCompressedData(12*32-1 downto 8*32) <= MemLoadCompressedData(16*32-1 downto 12*32);
					if (MemLoadDXT1Counter = 0) then
						MemLoadState <= waitingForMemReturn;
					end if;
					MemLoadDXT1Counter <= MemLoadDXT1Counter - 1;

				when deassertingHighHalf =>
					MemLoadHighHalf <= '1';
					MemLoadState <= waitingForMemReturn;
					
			end case;
		end if;
	end process HandleMemReadResponse;

	HandleCacheLoadResponse : process(clk)
	begin
		if (rising_edge(clk) ) then
			BRAM0_wea <= '0';
			BRAM1_wea <= '0';
			BRAM2_wea <= '0';
			BRAM3_wea <= '0';
			Decomp_FIFO_rd_en <= '0';

			BRAM0_addra <= std_logic_vector(CacheLoadCacheSetID & CacheLoadCacheSetIndex & CacheLoadQuadStage);
			BRAM1_addra <= std_logic_vector(CacheLoadCacheSetID & CacheLoadCacheSetIndex & CacheLoadQuadStage);
			BRAM2_addra <= std_logic_vector(CacheLoadCacheSetID & CacheLoadCacheSetIndex & CacheLoadQuadStage);
			BRAM3_addra <= std_logic_vector(CacheLoadCacheSetID & CacheLoadCacheSetIndex & CacheLoadQuadStage);

			case CacheLoadQuadStage is
				when 0 =>
					BRAM0_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 0, 0) );
					BRAM1_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 1, 0) );
					BRAM2_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 0, 1) );
					BRAM3_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 1, 1) );
				when 1 =>
					BRAM0_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 2, 0) );
					BRAM1_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 3, 0) );
					BRAM2_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 2, 1) );
					BRAM3_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 3, 1) );
				when 2 =>
					BRAM0_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 0, 2) );
					BRAM1_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 1, 2) );
					BRAM2_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 0, 3) );
					BRAM3_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 1, 3) );
				when 3 =>
					BRAM0_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 2, 2) );
					BRAM1_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 3, 2) );
					BRAM2_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 2, 3) );
					BRAM3_dina <= std_logic_vector(GetBlockPixelData(Decomp_FIFO_rd_data, 3, 3) );
			end case;

			if (Decomp_FIFO_empty = '0') then
				BRAM0_wea <= '1';
				BRAM1_wea <= '1';
				BRAM2_wea <= '1';
				BRAM3_wea <= '1';

				if (CacheLoadQuadStage = 1) then
					Decomp_FIFO_rd_en <= '1';
				end if;
				CacheLoadQuadStage <= CacheLoadQuadStage + 1;
			end if;
		end if;
	end process HandleCacheLoadResponse;

end Behavioral;
