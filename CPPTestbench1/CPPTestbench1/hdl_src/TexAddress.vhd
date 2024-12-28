-- This TexAddress unit calculates the texture addresses, block ID's, bank rotations, and precomputed cache set hashes for use by the texture cache/load unit.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity TexAddress is
	Port ( clk : in STD_LOGIC;

	-- ROP FIFO interface begin
		ROP_AlmostFull : in STD_LOGIC;
	-- ROP FIFO interface end

	-- Attribute interpolator output FIFO interface begin
		TEX_Ready : in STD_LOGIC;
		TEX_TexID : in STD_LOGIC_VECTOR(5 downto 0);
		TEX_MipLevel : in STD_LOGIC_VECTOR(3 downto 0);
		TEX_TX : in STD_LOGIC_VECTOR(15 downto 0); -- 8.8 fixed-point texcoord in the [0.0f, 1.0f] range. TODO: Increase this precision up to 16.8 in the future.
		TEX_TY : in STD_LOGIC_VECTOR(15 downto 0); -- 8.8 fixed-point texcoord in the [0.0f, 1.0f] range. TODO: Increase this precision up to 16.8 in the future.
		TEX_IsBilinearFetch : in STD_LOGIC; -- '1' if this is a bilinear texture request, or '0' if it's just a point-sampled request
	-- Attribute interpolator output FIFO interface end

	-- Texture cache interface begin
		TEXCACHE_TexID : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		TEXCACHE_MipLevel : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		TEXCACHE_TexFormat : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		TEXCACHE_QueriesValid : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		TEXCACHE_BlockBankRotation : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		TEXCACHE_BlockID_TL : out STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
		TEXCACHE_BlockID_TR : out STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
		TEXCACHE_BlockID_BL : out STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
		TEXCACHE_BlockID_BR : out STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
		TEXCACHE_BlockPixelIndex_TL : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		TEXCACHE_BlockPixelIndex_TR : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		TEXCACHE_BlockPixelIndex_BL : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		TEXCACHE_BlockPixelIndex_BR : out STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
		TEXCACHE_CacheSet_TL : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		TEXCACHE_CacheSet_TR : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		TEXCACHE_CacheSet_BL : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		TEXCACHE_CacheSet_BR : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		TEXCACHE_IsRequestReady : out STD_LOGIC := '0';
	-- Texture cache interface end

	-- Texture filtering unit interface begin
		-- This can go into the texture filter FIFO, since the data won't be used until after the variable-latency texture cache is done reading our texels (possibly from main VRAM many cycles from now)
		TEXFILTER_InterpFracValid : out STD_LOGIC := '0';
		TEXFILTER_InterpFracX : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		TEXFILTER_InterpFracY : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	-- Texture filtering unit interface end

	-- Command processor (CMD) interface begin
		CMD_UpdateTexDescriptor : in STD_LOGIC;
		CMD_UpdateTexID : in STD_LOGIC_VECTOR(5 downto 0);
		CMD_UpdateTexWidthLog2 : in STD_LOGIC_VECTOR(2 downto 0);
		CMD_UpdateTexHeightLog2 : in STD_LOGIC_VECTOR(2 downto 0);
		CMD_UpdateTexFormat : in STD_LOGIC_VECTOR(3 downto 0);
		CMD_UpdateClampSamplerU : in STD_LOGIC; -- '1' means that on the U-axis we are clamping, '0' means that on the U-axis we are wrapping instead
		CMD_UpdateClampSamplerV : in STD_LOGIC -- '1' means that on the V-axis we are clamping, '0' means that on the V-axis we are wrapping instead
	-- Command processor (CMD) interface end
		);
end TexAddress;

architecture Behavioral of TexAddress is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333000000";

type TexDescriptor is record
	WidthLog2 : unsigned(2 downto 0); -- Log2 of the texture width in 3 bits can represent a texture from 1x1 all the way up to 128x128 using power-of-2 dimensions
	HeightLog2 : unsigned(2 downto 0);
	TexFormat : unsigned(3 downto 0);
	ClampSamplerU : std_logic; -- '1' means that on the U-axis we are clamping, '0' means that on the U-axis we are wrapping instead
	ClampSamplerV : std_logic; -- '1' means that on the V-axis we are clamping, '0' means that on the V-axis we are wrapping instead
end record TexDescriptor;

type texDescriptors_t is array(63 downto 0) of TexDescriptor;

pure function GetTexDimensionShift(texSize : unsigned(2 downto 0) ) return integer is
begin
	case texSize is
		when "000" => return 8; -- 1x1 texture: shift down by 8 (divide by 256)
		when "001" => return 7; -- 2x2 texture: shift down by 7 (divide by 128)
		when "010" => return 6; -- 4x4 texture: shift down by 6 (divide by 64)
		when "011" => return 5; -- 8x8 texture: shift down by 5 (divide by 32)
		when "100" => return 4; -- 16x16 texture: shift down by 4 (divide by 16)
		when "101" => return 3; -- 32x32 texture: shift down by 3 (divide by 8)
		when "110" => return 2; -- 64x64 texture: shift down by 2 (divide by 4)
		when others => return 1; --when "111" -- 128x128 texture: shift down by 1 (divide by 2)
	end case;
end function;

pure function GetTexDimensionMultiplier(texSize : unsigned(2 downto 0) ) return integer is
begin
	case texSize is
		when "111" => return 7; -- 128x128 texture: multiply by 128 (shift left by 7)
		when "110" => return 6; -- 64x64 texture: multiply by 64 (shift left by 6)
		when "101" => return 5; -- 32x32 texture: multiply by 32 (shift left by 5)
		when "100" => return 4; -- 16x16 texture: multiply by 16 (shift left by 4)
		when "011" => return 3; -- 8x8 texture: multiply by 8 (shift left by 3)
		when "010" => return 2; -- 4x4 texture: multiply by 4 (shift left by 2)
		when "001" => return 1; -- 2x2 texture: multiply by 2 (shift left by 1)
		when others => return 0; --when "000" -- 1x1 texture: multiply by 1 (shift left by 0)
	end case;
end function;

pure function TexelNeedsWrapClampBorder(texelInput : unsigned(7 downto 0); texSizeLog2 : unsigned(2 downto 0) ) return std_logic is
begin
	case texSizeLog2 is
		when "111" => return texelInput(7); -- 128x128 texture
		when "110" => return texelInput(6); -- 64x64 texture
		when "101" => return texelInput(5); -- 32x32 texture
		when "100" => return texelInput(4); -- 16x16 texture
		when "011" => return texelInput(3); -- 8x8 texture
		when "010" => return texelInput(2); -- 4x4 texture
		when "001" => return texelInput(1); -- 2x2 texture
		when others => return texelInput(0); --when "000" -- 1x1 texture
	end case;
end function;

pure function WrapTexelToTextureDimension(texelInput : unsigned(7 downto 0); texSizeLog2 : unsigned(2 downto 0) ) return unsigned is
begin
	case texSizeLog2 is
		when "111" => return "0" & texelInput(6 downto 0); -- 128x128 texture: & 0x7F
		when "110" => return "00" & texelInput(5 downto 0); -- 64x64 texture: & 0x3F
		when "101" => return "000" & texelInput(4 downto 0); -- 32x32 texture: & 0x1F
		when "100" => return "0000" & texelInput(3 downto 0); -- 16x16 texture: & 0x0F
		when "011" => return "00000" & texelInput(2 downto 0); -- 8x8 texture: & 0x07
		when "010" => return "000000" & texelInput(1 downto 0); -- 4x4 texture: & 0x03
		when "001" => return "0000000" & texelInput(0 downto 0); -- 2x2 texture: & 0x01
		when others => return "00000000"; --when "000" -- 1x1 texture: Always 0
	end case;
end function;

pure function GetLogNumBlocksPerRow(texWidthLog2 : unsigned(2 downto 0) ) return unsigned is
begin
	case texWidthLog2 is
		when "111" => to_unsigned(5, 3); -- 128x128 texture: 32 (1 << 5) blocks per row
		when "110" => to_unsigned(4, 3); -- 64x64 texture: 16 (1 << 4) blocks per row
		when "101" => to_unsigned(3, 3); -- 32x32 texture: 8 (1 << 3) blocks per row
		when "100" => to_unsigned(2, 3); -- 16x16 texture: 4 (1 << 2) blocks per row
		when "011" => to_unsigned(1, 3); -- 8x8 texture: 2 (1 << 1) blocks per row
		when others => return to_unsigned(0, 3); -- 1x1, 2x2, and 4x4 texture: Always 1 (1 << 0) block
	end case;
end function;

-- Block Coord is simply Texel Coord / 4 because our block size is always 4x4 texels:
pure function GetBlockCoordFromTexelCoord(TexCoord : unsigned(7 downto 0) ) return unsigned is
begin
	return TexCoord(7 downto 2);
end function;

-- Shifts the log2 texture dimension down by the mip-level (making sure to clamp at 1x1 pixels)
pure function MipSubtract(TexSizeLog2 : unsigned(2 downto 0); MipLevel : unsigned(3 downto 0) ) return unsigned is
begin
	if (MipLevel(2 downto 0) > TexSizeLog2) then -- TODO: Remove this slice after texture width log2's are made much larger
		return to_unsigned(0, 3);
	else
		return TexSizeLog2 - MipLevel(2 downto 0); -- TODO: Remove this slice after texture width log2's are made much larger
	end if;
end function;

pure function CalculateBlockID(TX : unsigned(7 downto 0); TY : unsigned(7 downto 0); texWidthLog2 : unsigned(2 downto 0) ) return unsigned is
	variable RowBlockCoord : unsigned(11 downto 0);
	variable BlockCoord : unsigned(11 downto 0);
begin
	RowBlockCoord := resize(GetBlockCoordFromTexelCoord(TY), 12) sll GetLogNumBlocksPerRow(texWidthLog2);
	BlockCoord := RowBlockCoord + resize(GetBlockCoordFromTexelCoord(TX), 12;
	return resize(BlockCoord, 17);
end function;

pure function CalculateBlockCacheSet(blockID : unsigned(16 downto 0) ) return unsigned is
begin
	return blockID(5 downto 0); -- TODO: In the future we should use a more complicated cache set calculation so that vertically adjacent blocks don't collide in the same cache set
end function;

signal TexDescriptors : texDescriptors_t := (others => (others => (others => '0') ) );
signal TX : unsigned(15 downto 0) := (others => '0');
signal TY : unsigned(15 downto 0) := (others => '0');
signal CurrentTexID : unsigned(5 downto 0) := (others => '0');
signal CurrentTexID2 : unsigned(5 downto 0) := (others => '0');
signal CurrentTexID3 : unsigned(5 downto 0) := (others => '0');
signal CurrentFetchIsBilinear : std_logic := '0';
signal CurrentFetchIsBilinear2 : std_logic := '0';
signal CurrentFetchIsBilinear3 : std_logic := '0';
signal CurrentTexDescriptor : TexDescriptor := (others => (others => '0') );
signal CurrentTexDescriptor2 : TexDescriptor := (others => (others => '0') );
signal CurrentTexDescriptor3 : TexDescriptor := (others => (others => '0') );
signal CurrentMipLevel : unsigned(3 downto 0) := (others => '0');
signal CurrentMipLevel2 : unsigned(3 downto 0) := (others => '0');
signal CurrentMipLevel3 : unsigned(3 downto 0) := (others => '0');
signal TexelX : unsigned(7 downto 0) := (others => '0');
signal TexelY : unsigned(7 downto 0) := (others => '0');
signal TexelX2 : unsigned(7 downto 0) := (others => '0');
signal TexelY2 : unsigned(7 downto 0) := (others => '0');
signal MipWidthLog2 : unsigned(2 downto 0) := (others => '0');
signal MipWidthLog2_1 : unsigned(2 downto 0) := (others => '0');
signal MipHeightLog2 : unsigned(2 downto 0) := (others => '0');
signal InterpFractionX : unsigned(7 downto 0) := (others => '0');
signal InterpFractionY : unsigned(7 downto 0) := (others => '0');
signal TR_X : unsigned(7 downto 0) := (others => '0');
signal BL_Y : unsigned(7 downto 0) := (others => '0');
signal TR_WrapClampBorder : std_logic := '0';
signal BL_WrapClampBorder : std_logic := '0';
signal ReadySignal : std_logic := '0';
signal ReadySignal2 : std_logic := '0';
signal ReadySignal3 : std_logic := '0';

begin

	TexDescriptorReadProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			ReadySignal <= TEX_Ready and not ROP_AlmostFull;
			CurrentTexDescriptor <= TexDescriptors(to_integer(unsigned(TEX_TexID) ) );
			CurrentTexID <= unsigned(TEX_TexID);
			CurrentMipLevel < = unsigned(TEX_MipLevel);
			CurrentFetchIsBilinear <= TEX_IsBilinearFetch;
			TX <= unsigned(TEX_TX); -- TODO: It would be better to pull these off of their FIFO later rather than to pipeline them as seen here
			TY <= unsigned(TEX_TY);
		end if;
	end process TexDescriptorReadProc;

	PixelSpaceCalculate : process(clk)
		variable TempShiftTexcoordX : unsigned(15 downto 0) := (others => '0');
		variable TempShiftTexcoordY : unsigned(15 downto 0) := (others => '0');
		variable TempMipWidthLog2 : unsigned(2 downto 0) := (others => '0');
		variable TempMipHeightLog2 : unsigned(2 downto 0) := (others => '0');
	begin
		if (rising_edge(clk) ) then
			TempMipWidthLog2 := MipSubtract(CurrentTexDescriptor.WidthLog2, CurrentMipLevel);
			TempMipHeightLog2 := MipSubtract(CurrentTexDescriptor.HeightLog2, CurrentMipLevel);
			TempShiftTexcoordX := TX srl GetTexDimensionShift(TempMipWidthLog2);
			TempShiftTexcoordY := TY srl GetTexDimensionShift(TempMipHeightLog2);
			TexelX <= TempShiftTexcoordX(15 downto 8);
			TexelY <= TempShiftTexcoordY(15 downto 8);
			if (CurrentFetchIsBilinear = '1') then
				InterpFractionX <= TempShiftTexcoordX(7 downto 0);
				InterpFractionY <= TempShiftTexcoordY(7 downto 0);
			else
				InterpFractionX <= (others => '0'); -- A point-sample (non-bilinear texture fetch) is treated as a texture fetch with (0.0f, 0.0f) interp fractions
				InterpFractionY <= (others => '0');
			end if;
			ReadySignal2 <= ReadySignal;
			CurrentTexID2 <= CurrentTexID;
			CurrentMipLevel2 <= CurrentMipLevel;
			MipWidthLog2 <= TempMipWidthLog2;
			MipHeightLog2 <= TempMipHeightLog2;
			if (TempShiftTexcoordX(7 downto 0) = "00000000" and TempShiftTexcoordY(7 downto 0) = "00000000") then
				CurrentFetchIsBilinear2 <= '0'; -- Demote from bilinear to point-sampling if our fractional bits are all 0's anyway (this may save real texture block fetch bandwidth in the texture cache at the cost of two 8-bit compares)
			else
				CurrentFetchIsBilinear2 <= CurrentFetchIsBilinear;
			end if;
			CurrentTexDescriptor2 <= CurrentTexDescriptor;
		end if;
	end process PixelSpaceCalculate;

	BilinearCalculate : process(clk)
		variable X1 : unsigned(7 downto 0);
		variable Y1 : unsigned(7 downto 0);
	begin
		if (rising_edge(clk) ) then
			TEXFILTER_InterpFracX <= std_logic_vector(InterpFractionX);
			TEXFILTER_InterpFracY <= std_logic_vector(InterpFractionY);
			TEXFILTER_InterpFracValid := ReadySignal2;

			X1 := TexelX + 1;
			Y1 := TexelY + 1;
			TR_X <= WrapTexelToTextureDimension(X1, MipWidthLog2);
			BL_Y <= WrapTexelToTextureDimension(Y1, MipHeightLog2);
			TR_WrapClampBorder <= TexelNeedsWrapClampBorder(X1);
			BL_WrapClampBorder <= TexelNeedsWrapClampBorder(Y1);
			TexelX2 <= TexelX;
			TexelY2 <= TexelY;
			ReadySignal3 <= ReadySignal2;
			CurrentTexID3 <= CurrentTexID2;
			CurrentMipLevel3 <= CurrentMipLevel2;
			MipWidthLog2_1 <= MipWidthLog2;
			CurrentTexDescriptor3 <= CurrentTexDescriptor2;
			CurrentFetchIsBilinear3 <= CurrentFetchIsBilinear2;
		end if;
	end process BilinearCalculate;

	BlockCalculate : process(clk)
		variable TL_BlockID : unsigned(16 downto 0);
		variable TR_BlockID : unsigned(16 downto 0);
		variable BL_BlockID : unsigned(16 downto 0);
		variable BR_BlockID : unsigned(16 downto 0);
		variable TR_Clamped : std_logic;
		variable BL_Clamped : std_logic;
		variable BR_Clamped : std_logic;
	begin
		if (rising_edge(clk) ) then
			TL_BlockID := CalculateBlockID(TexelX2, TexelY2, MipWidthLog2_1);
			TR_BlockID := CalculateBlockID(TR_X, TexelY2, MipWidthLog2_1);
			BL_BlockID := CalculateBlockID(TexelX2, BL_Y, MipWidthLog2_1);
			BR_BlockID := CalculateBlockID(TR_X, BL_Y, MipWidthLog2_1);
			TEXCACHE_TexID <= std_logic_vector(CurrentTexID3);
			TEXCACHE_MipLevel <= std_logic_vector(CurrentMipLevel3);
			TEXCACHE_TexFormat <= std_logic_vector(CurrentTexDescriptor3.TexFormat);
			TEXCACHE_BlockID_TL <= std_logic_vector(TL_BlockID);
			TEXCACHE_BlockID_TR <= std_logic_vector(TR_BlockID);
			TEXCACHE_BlockID_BL <= std_logic_vector(BL_BlockID);
			TEXCACHE_BlockID_BR <= std_logic_vector(BR_BlockID);
			TEXCACHE_CacheSet_TL <= std_logic_vector(CalculateBlockCacheSet(TL_BlockID) );
			TEXCACHE_CacheSet_TR <= std_logic_vector(CalculateBlockCacheSet(TR_BlockID) );
			TEXCACHE_CacheSet_BL <= std_logic_vector(CalculateBlockCacheSet(BL_BlockID) );
			TEXCACHE_CacheSet_BR <= std_logic_vector(CalculateBlockCacheSet(BR_BlockID) );
			TEXCACHE_BlockPixelIndex_TL <= std_logic_vector(TexelY2(1) & TexelX2(1) );
			TEXCACHE_BlockPixelIndex_TR <= std_logic_vector(TexelY2(1) & TR_X(1) );
			TEXCACHE_BlockPixelIndex_BL <= std_logic_vector(BL_Y(1) & TexelX2(1) );
			TEXCACHE_BlockPixelIndex_BR <= std_logic_vector(BL_Y(1) & TR_X(1) );
			TEXCACHE_BlockBankRotation <= std_logic_vector(TexelY2(0) & TexelX2(0) );
			if (CurrentFetchIsBilinear3 = '1') then
				TR_Clamped := TR_WrapClampBorder and CurrentTexDescriptor3.ClampSamplerU;
				BL_Clamped := BL_WrapClampBorder and CurrentTexDescriptor3.ClampSamplerV;
				BR_Clamped := TR_Clamped or BL_Clamped;
				TEXCACHE_QueriesValid <= not BR_Clamped & not BL_Clamped & not TR_Clamped & '1';
			else
				TEXCACHE_QueriesValid <= "0001";
			end if;
			TEXCACHE_IsRequestReady <= ReadySignal3;
		end if;
	end process BlockCalculate;

	TexDescriptorsUpdateProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			if (CMD_UpdateTexDescriptor = '1') then
				TexDescriptors(to_integer(unsigned(CMD_UpdateTexID) ) ).WidthLog2 <= unsigned(CMD_UpdateTexWidthLog2);
				TexDescriptors(to_integer(unsigned(CMD_UpdateTexID) ) ).HeightLog2 <= unsigned(CMD_UpdateTexHeightLog2);
				TexDescriptors(to_integer(unsigned(CMD_UpdateTexID) ) ).TexFormat <= unsigned(CMD_UpdateTexFormat);
				TexDescriptors(to_integer(unsigned(CMD_UpdateTexID) ) ).ClampSamplerU <= CMD_UpdateClampSamplerU;
				TexDescriptors(to_integer(unsigned(CMD_UpdateTexID) ) ).ClampSamplerV <= CMD_UpdateClampSamplerV;
			end if;
		end if;
	end process TexDescriptorsUpdateProc;

end Behavioral;
