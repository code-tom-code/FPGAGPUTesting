library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet definition file so that we can use the texChannelMUX and eTexFormat enums type defined in there
library work;
use work.PacketType.all;

entity TexSample is
	Port ( clk : in STD_LOGIC;

	-- Attribute Interpolator interface begin
		INTERP_writeStrobe : in STD_LOGIC; -- Strobed high for one cycle, then back to low after that
		INTERP_readyForNewWrite : out STD_LOGIC := '0';

		INTERP_pixelX : in STD_LOGIC_VECTOR(15 downto 0);
		INTERP_pixelY : in STD_LOGIC_VECTOR(15 downto 0);
		INTERP_inInterpolatedTexcoordX : in STD_LOGIC_VECTOR(15 downto 0);
		INTERP_inInterpolatedTexcoordY : in STD_LOGIC_VECTOR(15 downto 0);
		INTERP_inInterpolatedVertColorRGBA : in STD_LOGIC_VECTOR(31 downto 0);
	-- Attribute Interpolator interface end

	-- Memory Controller FIFO interface begin
		-- DRAM read requests FIFO:
		MEM_TexSampReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
        MEM_TexSampReadRequestsFIFO_full : in STD_LOGIC;
        MEM_TexSampReadRequestsFIFO_wr_en : out STD_LOGIC := '0';

		-- DRAM read responses FIFO:
		MEM_TexSampReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR(256+30-1 downto 0);
        MEM_TexSampReadResponsesFIFO_empty : in STD_LOGIC;
        MEM_TexSampReadResponsesFIFO_rd_en : out STD_LOGIC := '0';
	-- Memory Controller FIFO interface end

	-- Texture cache BRAM interfaces begin
		TexCache_addra : out STD_LOGIC_VECTOR(13 downto 0) := (others => '0');
		TexCache_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TexCache_douta : in STD_LOGIC_VECTOR(31 downto 0);
		TexCache_ena : out STD_LOGIC := '0';
		TexCache_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	-- Texture cache BRAM interfaces end

	-- Command Processor block interface begin
		CMD_TexSampleIsIdle : out STD_LOGIC := '0';

		CMD_LoadTexCacheBeginSignal : in STD_LOGIC;
		CMD_LoadTexCacheAckSignal : out STD_LOGIC := '0';
		CMD_LoadTexCacheAddr : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_LoadTexCacheFormat : in STD_LOGIC_VECTOR(2 downto 0);
		CMD_LoadTexCacheTexelCount : in STD_LOGIC_VECTOR(15 downto 0);
		CMD_LoadTexCacheTexelWidth : in STD_LOGIC_VECTOR(2 downto 0); -- Since these are all known to be powers of 2, we can simply use log2(x) here instead of the actual resolution to save bits
		CMD_LoadTexCacheTexelHeight : in STD_LOGIC_VECTOR(2 downto 0); -- Value of 0=1x1, 1=2x2, 2=4x4, 3=8x8, 4=16x16, 5=32x32, 6=64x64, 7=128x128

		CMD_SetTextureStateBeginSignal : in STD_LOGIC;
		CMD_SetTextureStateAckSignal : out STD_LOGIC := '0';
		CMD_SetTextureStateUseBilinear : in STD_LOGIC;
		CMD_SetTextureStateCombinerModeColor : in STD_LOGIC_VECTOR(2 downto 0);
		CMD_SetTextureStateCombinerModeAlpha : in STD_LOGIC_VECTOR(2 downto 0);
	-- Command Processor block interface end

	-- ROP interface begin
		ROP_outPixelX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		ROP_outPixelY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		ROP_outR : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		ROP_outG : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		ROP_outB : out STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
		ROP_outA : out STD_LOGIC_VECTOR(7 downto 0) := (others => '1');

		ROP_writeIsValid : out STD_LOGIC := '0';
		ROP_writeAck : in STD_LOGIC;
	-- ROP interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingCacheLoad : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_TexSample_State : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		DBG_TexCache_douta : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_TexCache_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_TexCache_addra : out STD_LOGIC_VECTOR(13 downto 0) := (others => '0')
		);
end TexSample;

architecture Behavioral of TexSample is

ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO FULL";

ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadResponsesFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadResponsesFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses RD_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadResponsesFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses EMPTY";

-- Texture cache is ideally 64x128 R8G8B8A8 texel pairs (two 32-bit texels in a single transaction because URAM reads/writes 64 bits at a time)
ATTRIBUTE X_INTERFACE_INFO of TexCache_ena: SIGNAL is "xilinx.com:interface:bram:1.0 TexCache EN";
ATTRIBUTE X_INTERFACE_INFO of TexCache_douta: SIGNAL is "xilinx.com:interface:bram:1.0 TexCache DOUT";
ATTRIBUTE X_INTERFACE_INFO of TexCache_dina: SIGNAL is "xilinx.com:interface:bram:1.0 TexCache DIN";
ATTRIBUTE X_INTERFACE_INFO of TexCache_wea: SIGNAL is "xilinx.com:interface:bram:1.0 TexCache WE";
ATTRIBUTE X_INTERFACE_INFO of TexCache_addra: SIGNAL is "xilinx.com:interface:bram:1.0 TexCache ADDR";

type texSampleStateType is 
(
	init, -- 0
	waitingForRead, -- 1
    
	-- Tex sample entry points (one for point-sampling and the other for bilinear)
	texSample_point_address, -- 2
	texSample_point_read, -- 3
	texSample_point_read2, -- 4
	texSample_bilinear, -- 5
	texSample_bilinear_readTL, -- 6
	texSample_bilinear_readTL2, -- 7
	texSample_bilinear_readTR, -- 8
	texSample_bilinear_readTR2, -- 9
	texSample_bilinear_readBL, -- 10
	texSample_bilinear_readBL2, -- 11
	texSample_bilinear_readBR, -- 12
	texSample_bilinear_readBR2, -- 13

	-- These stages are used for bilinear interpolation only
	bilinear_xMinMax, -- 14
	bilinear_xDelta, -- 15
	bilinear_xMultiply, -- 16
	bilinear_xCombine, -- 17
	bilinear_yMinMax, -- 18
	bilinear_yDelta, -- 19
	bilinear_yMultiply, -- 20
	bilinear_yCombine, -- 21

	-- These latter stages are once again shared by both point and bilinear sampling:
	swizzleTexColors, -- 22
	modulateTexWithVertexColor, -- 23
	setupOutput, -- 24
	waitingForWrite, -- 25

	setTextureState, -- 26
	loadTextureState, -- 27
	loadTextureState_memRequest, -- 28
	loadTextureState_memResponse, -- 29
	loadTextureState_cacheLine -- 30
);

signal currentState : texSampleStateType := init;

signal texX : unsigned(7 downto 0) := (others => '0');
signal texY : unsigned(7 downto 0) := (others => '0');
signal texWidth : unsigned(2 downto 0) := (others => '0');
signal texHeight : unsigned(2 downto 0) := (others => '0');
signal texFormat : unsigned(2 downto 0) := (others => '0');
signal texCacheAddress : STD_LOGIC_VECTOR(13 downto 0) := (others => '0');
signal texCacheEnable : STD_LOGIC := '0';
signal texCacheWriteData : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal texCacheWriteEnable : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
signal texCacheReadTexelsCount : unsigned(15 downto 0) := (others => '0');

signal bilinearModeEnabled : STD_LOGIC := '0';
signal loadTexCacheReadAddr : unsigned(29 downto 0) := (others => '0');
signal loadTexCacheLine : STD_LOGIC_VECTOR(255 downto 0) := (others => '0');
signal cacheLineReadIters : unsigned(4 downto 0) := (others => '0');

signal outputMUXR : unsigned(2 downto 0) := (others => '0');
signal outputMUXG : unsigned(2 downto 0) := (others => '0');
signal outputMUXB : unsigned(2 downto 0) := (others => '0');
signal outputMUXA : unsigned(2 downto 0) := (others => '0');

signal colorCombinerMode : unsigned(2 downto 0) := (others => '0');
signal alphaCombinerMode : unsigned(2 downto 0) := (others => '0');

signal interpBitsX : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal interpBitsY : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal storedPixelX : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal storedPixelY : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal storedVertColorRGBA : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal outColorRegR : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); -- Default the color to (0, 0, 0, 1) (opaque black)
signal outColorRegG : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal outColorRegB : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal outColorRegA : STD_LOGIC_VECTOR(7 downto 0) := (others => '1');

signal modulatedTexVertexColorProductR : unsigned(15 downto 0) := (others => '0');
signal modulatedTexVertexColorProductG : unsigned(15 downto 0) := (others => '0');
signal modulatedTexVertexColorProductB : unsigned(15 downto 0) := (others => '0');
signal modulatedTexVertexColorProductA : unsigned(15 downto 0) := (others => '0');

type RGBVec4 is record
	R : unsigned(7 downto 0);
	G : unsigned(7 downto 0);
	B : unsigned(7 downto 0);
	A : unsigned(7 downto 0);
end record RGBVec4;

type interpVec4 is record
	X : unsigned(7 downto 0);
	Y : unsigned(7 downto 0);
	Z : unsigned(7 downto 0);
	W : unsigned(7 downto 0);
end record interpVec4;

type mulTemporary4 is record
	X : unsigned(15 downto 0);
	Y : unsigned(15 downto 0);
	Z : unsigned(15 downto 0);
	W : unsigned(15 downto 0);
end record mulTemporary4;

signal TL : RGBVec4;
signal TR : RGBVec4;
signal BL : RGBVec4;
signal BR : RGBVec4;

signal deltaT : RGBVec4;
signal deltaB : RGBVec4;
signal deltaY : RGBVec4;
signal lerpedT : RGBVec4;
signal lerpedB : RGBVec4;
signal interpXT : interpVec4;
signal interpXB : interpVec4;
signal interpY : interpVec4;
signal lerpDirectionT : STD_LOGIC_VECTOR(3 downto 0); -- Bool-vector of a.RGBA < b.RGBA
signal lerpDirectionB : STD_LOGIC_VECTOR(3 downto 0); -- Bool-vector of a.RGBA < b.RGBA
signal lerpDirectionY : STD_LOGIC_VECTOR(3 downto 0); -- Bool-vector of a.RGBA < b.RGBA
signal mulTemporaryT : mulTemporary4;
signal mulTemporaryB : mulTemporary4;
signal mulTemporaryY : mulTemporary4;

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForCacheLoad : unsigned(31 downto 0) := (others => '0');

	pure function minBits(aVec : RGBVec4;
						bVec : RGBVec4 ) return std_logic_vector is
		variable ret : std_logic_vector(3 downto 0);
	begin
		if (aVec.R < bVec.R) then
			ret(0) := '1';
		else
			ret(0) := '0';
		end if;
		if (aVec.G < bVec.G) then
			ret(1) := '1';
		else
			ret(1) := '0';
		end if;
		if (aVec.B < bVec.B) then
			ret(2) := '1';
		else
			ret(2) := '0';
		end if;
		if (aVec.A < bVec.A) then
			ret(3) := '1';
		else
			ret(3) := '0';
		end if;
		return ret;
	end function;

	pure function assembleMin(aVec : RGBVec4;
							bVec : RGBVec4;
							minBits : STD_LOGIC_VECTOR(3 downto 0) ) return RGBVec4 is
		variable ret : RGBVec4;
	begin
		if (minBits(0) = '1') then
			ret.R := aVec.R;
		else
			ret.R := bVec.R;
		end if;
		if (minBits(1) = '1') then
			ret.G := aVec.G;
		else
			ret.G := bVec.G;
		end if;
		if (minBits(2) = '1') then
			ret.B := aVec.B;
		else
			ret.B := bVec.B;
		end if;
		if (minBits(3) = '1') then
			ret.A := aVec.A;
		else
			ret.A := bVec.A;
		end if;
		return ret;
	end function;

	pure function assembleMax(aVec : RGBVec4;
							bVec : RGBVec4;
							minBits : STD_LOGIC_VECTOR(3 downto 0) ) return RGBVec4 is
		variable ret : RGBVec4;
	begin
		if (minBits(0) = '1') then
			ret.R := bVec.R;
		else
			ret.R := aVec.R;
		end if;
		if (minBits(1) = '1') then
			ret.G := bVec.G;
		else
			ret.G := aVec.G;
		end if;
		if (minBits(2) = '1') then
			ret.B := bVec.B;
		else
			ret.B := aVec.B;
		end if;
		if (minBits(3) = '1') then
			ret.A := bVec.A;
		else
			ret.A := aVec.A;
		end if;
		return ret;
	end function;

	pure function assembleInterpVec(interpBits : unsigned(7 downto 0);
									directionBits : STD_LOGIC_VECTOR(3 downto 0) ) return interpVec4 is
		variable ret : interpVec4;
		variable oneMinusInterpBits : unsigned(7 downto 0);
	begin
		oneMinusInterpBits := to_unsigned(255, 8) - interpBits;
		if (directionBits(0) = '1') then
			ret.X := interpBits;
		else
			ret.X := oneMinusInterpBits;
		end if;
		if (directionBits(1) = '1') then
			ret.Y := interpBits;
		else
			ret.Y := oneMinusInterpBits;
		end if;
		if (directionBits(2) = '1') then
			ret.Z := interpBits;
		else
			ret.Z := oneMinusInterpBits;
		end if;
		if (directionBits(3) = '1') then
			ret.W := interpBits;
		else
			ret.W := oneMinusInterpBits;
		end if;
		return ret;
	end function;

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
	
	pure function GetSwizzledOutput(channelMUX : unsigned(2 downto 0); channelR : std_logic_vector(7 downto 0);
		channelG : std_logic_vector(7 downto 0); channelB : std_logic_vector(7 downto 0); channelA : std_logic_vector(7 downto 0) ) return std_logic_vector is
	begin
		case channelMUX is
			when to_unsigned(texChannelMUX'pos(TCM_R), 3) =>
				return channelR;
			when to_unsigned(texChannelMUX'pos(TCM_G), 3) =>
				return channelG;
			when to_unsigned(texChannelMUX'pos(TCM_B), 3) =>
				return channelB;
			when to_unsigned(texChannelMUX'pos(TCM_A), 3) =>
				return channelA;
			when to_unsigned(texChannelMUX'pos(TCM_0), 3) =>
				return x"00";
			when others => --when to_unsigned(texChannelMUX'pos(TCM_1), 3) =>
				return x"FF";
		end case;
	end function;

	-- Returns the logical shift bit count for this format
	pure function GetFormatTexelSizeBits(texFormat : unsigned(2 downto 0) ) return integer is
	begin
		case texFormat is
			when to_unsigned(eTexFormat'pos(eTexFmtA8R8G8B8), 3) =>
				return 32;
			when to_unsigned(eTexFormat'pos(eTexFmtX8R8G8B8), 3) =>
				return 32;
			when to_unsigned(eTexFormat'pos(eTexFmtR5G6B5), 3) =>
				return 16;
			when to_unsigned(eTexFormat'pos(eTexFmtA1R5G5B5), 3) =>
				return 16;
			when to_unsigned(eTexFormat'pos(eTexFmtX1R5G5B5), 3) =>
				return 16;
			when others => --when to_unsigned(eTexFormat'pos(eTexFmtA4R4G4B4), 3) =>
				return 16;
		end case;
	end function;

	-- Returns how many texels of the given format will fit into a single 32-byte DRAM line
	pure function GetFormatTexelsPerDRAMLine(texFormat : unsigned(2 downto 0) ) return unsigned is
	begin
		case texFormat is
			when to_unsigned(eTexFormat'pos(eTexFmtX8R8G8B8), 3) =>
				return to_unsigned(8, 5);
			when to_unsigned(eTexFormat'pos(eTexFmtA4R4G4B4), 3) =>
				return to_unsigned(16, 5);
			when to_unsigned(eTexFormat'pos(eTexFmtR5G6B5), 3) =>
				return to_unsigned(16, 5);
			when to_unsigned(eTexFormat'pos(eTexFmtA1R5G5B5), 3) =>
				return to_unsigned(16, 5);
			when to_unsigned(eTexFormat'pos(eTexFmtX1R5G5B5), 3) =>
				return to_unsigned(16, 5);
			when others => --when to_unsigned(eTexFormat'pos(eTexFmtA8R8G8B8), 3) =>
				return to_unsigned(8, 5);
		end case;
	end function;

	pure function Unpack5To8Bits(cacheBits5 : unsigned(4 downto 0) ) return unsigned is
	begin
		return (resize(cacheBits5, 8) sll 3) or (resize(cacheBits5, 8) srl 2);
	end function;

	pure function Unpack6To8Bits(cacheBits6 : unsigned(5 downto 0) ) return unsigned is
	begin
		return (resize(cacheBits6, 8) sll 2) or (resize(cacheBits6, 8) srl 4);
	end function;

	-- Unpacks the bottom-most 4 bytes into R8G8B8A8 format for this cache line
	pure function UnpackCacheBytesForFormat(texFormat : unsigned(2 downto 0); cacheBits : unsigned(31 downto 0) ) return unsigned is
	begin
		case texFormat is
			when to_unsigned(eTexFormat'pos(eTexFmtX8R8G8B8), 3) =>
				return cacheBits or x"FF000000";
			when to_unsigned(eTexFormat'pos(eTexFmtA4R4G4B4), 3) =>
				return cacheBits(15 downto 12) & cacheBits(15 downto 12) & cacheBits(11 downto 8) & cacheBits(11 downto 8)
				& cacheBits(7 downto 4) & cacheBits(7 downto 4) & cacheBits(3 downto 0) & cacheBits(3 downto 0);
			when to_unsigned(eTexFormat'pos(eTexFmtR5G6B5), 3) =>
				return x"FF" & Unpack5To8Bits(cacheBits(15 downto 11) ) & Unpack6To8Bits(cacheBits(10 downto 5) ) & Unpack5To8Bits(cacheBits(4 downto 0) );
			when to_unsigned(eTexFormat'pos(eTexFmtA1R5G5B5), 3) =>
				if (cacheBits(15) = '1') then
					return x"FF" & Unpack5To8Bits(cacheBits(14 downto 10) ) & Unpack5To8Bits(cacheBits(9 downto 5) ) & Unpack5To8Bits(cacheBits(4 downto 0) );
				else
					return x"00" & Unpack5To8Bits(cacheBits(14 downto 10) ) & Unpack5To8Bits(cacheBits(9 downto 5) ) & Unpack5To8Bits(cacheBits(4 downto 0) );
				end if;
			when to_unsigned(eTexFormat'pos(eTexFmtX1R5G5B5), 3) =>
					return x"FF" & Unpack5To8Bits(cacheBits(14 downto 10) ) & Unpack5To8Bits(cacheBits(9 downto 5) ) & Unpack5To8Bits(cacheBits(4 downto 0) );
			when others => --when to_unsigned(eTexFormat'pos(eTexFmtA8R8G8B8), 3) =>
				return cacheBits;
		end case;
	end function;

begin

TexCache_addra <= texCacheAddress;
TexCache_ena <= texCacheEnable;
TexCache_wea <= texCacheWriteEnable;
TexCache_dina <= texCacheWriteData;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);
STAT_CyclesWaitingCacheLoad <= std_logic_vector(statCyclesWaitingForCacheLoad);

DBG_TexSample_State <= std_logic_vector(to_unsigned(texSampleStateType'pos(currentState), 6) );
DBG_TexCache_douta <= TexCache_douta;
DBG_TexCache_dina <= texCacheWriteData;
DBG_TexCache_addra <= texCacheAddress;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when waitingForRead =>
					statCyclesIdle <= statCyclesIdle + 1;

				when waitingForWrite =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when loadTextureState | loadTextureState_memRequest | loadTextureState_memResponse | loadTextureState_cacheLine =>
					statCyclesWaitingForCacheLoad <= statCyclesWaitingForCacheLoad + 1;

				when others =>
					statCyclesWorking <= statCyclesWorking + 1;
			end case;
		end if;
	end process;

	process(clk)
		variable tempShiftTexcoord : unsigned(15 downto 0) := (others => '0');
		variable minT : RGBVec4;
		variable minB : RGBVec4;
		variable minY : RGBVec4;
		variable minVertical : RGBVec4;
		variable maxT : RGBVec4;
		variable maxB : RGBVec4;
		variable maxY : RGBVec4;
		variable maxVertical : RGBVec4;
		variable tempCombine : unsigned(15 downto 0) := (others => '0');
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when init =>
					ROP_writeIsValid <= '0';
					ROP_outPixelX <= (others => '0');
					ROP_outPixelY <= (others => '0');
					ROP_outR <= (others => '0');
					ROP_outG <= (others => '0');
					ROP_outB <= (others => '0');
					ROP_outA <= (others => '1');
					CMD_SetTextureStateAckSignal <= '0';
					CMD_LoadTexCacheAckSignal <= '0';
					texCacheEnable <= '0';
					texCacheWriteEnable <= (others => '0');
					texCacheAddress <= (others => '0');
					bilinearModeEnabled <= '0';
					INTERP_readyForNewWrite <= '1';
					currentState <= waitingForRead;

				when waitingForRead =>
					if (CMD_SetTextureStateBeginSignal = '1') then
						CMD_TexSampleIsIdle <= '0';
						CMD_SetTextureStateAckSignal <= '1';
						currentState <= setTextureState;
					elsif (CMD_LoadTexCacheBeginSignal = '1') then
						CMD_TexSampleIsIdle <= '0';
						CMD_LoadTexCacheAckSignal <= '1';
						currentState <= loadTextureState;
					elsif (INTERP_writeStrobe = '1') then
						CMD_TexSampleIsIdle <= '0';
						INTERP_readyForNewWrite <= '0';

						storedVertColorRGBA <= INTERP_inInterpolatedVertColorRGBA;
						tempShiftTexcoord := resize(unsigned(INTERP_inInterpolatedTexcoordX), tempShiftTexcoord'length) srl GetTexDimensionShift(texWidth);
						texX <= tempShiftTexcoord(15 downto 8);
						interpBitsX <= std_logic_vector(tempShiftTexcoord(7 downto 0) );
						tempShiftTexcoord := resize(unsigned(INTERP_inInterpolatedTexcoordY), tempShiftTexcoord'length) srl GetTexDimensionShift(texHeight);
						texY <= tempShiftTexcoord(15 downto 8);
						interpBitsY <= std_logic_vector(tempShiftTexcoord(7 downto 0) );
						storedPixelX <= INTERP_pixelX;
						storedPixelY <= INTERP_pixelY;

						if (bilinearModeEnabled = '0') then
							currentState <= texSample_point_address;
						else
							currentState <= texSample_bilinear;
						end if;
					else
						CMD_TexSampleIsIdle <= '1';
						currentState <= waitingForRead;
					end if;

				when texSample_point_address =>
					texCacheEnable <= '1';
					texCacheWriteEnable <= (others => '0');
					texCacheAddress <= STD_LOGIC_VECTOR( (resize(texY, texCacheAddress'length) sll GetTexDimensionMultiplier(texWidth) ) + texX);

					currentState <= texSample_point_read;

				when texSample_point_read =>
					currentState <= texSample_point_read2;

				when texSample_point_read2 =>
					texCacheEnable <= '0'; -- Deassert after one clock cycle
					outColorRegR <= TexCache_douta(7 downto 0);--x"00";-- --
					outColorRegG <= TexCache_douta(15 downto 8);--INTERP_inInterpolatedTexcoordY(15 downto 8);----
					outColorRegB <= TexCache_douta(23 downto 16);--INTERP_inInterpolatedTexcoordX(15 downto 8);-- -- 
					outColorRegA <= TexCache_douta(31 downto 24);--x"FF";----
					currentState <= swizzleTexColors;

				when texSample_bilinear =>
					-- Bilinear interpolation needs to do more samples...
					texCacheAddress <= STD_LOGIC_VECTOR( (resize(texY, texCacheAddress'length) sll GetTexDimensionMultiplier(texWidth) ) + texX);
					texCacheEnable <= '1';
					texCacheWriteEnable <= (others => '0');

					currentState <= texSample_bilinear_readTL;

				when texSample_bilinear_readTL =>
					currentState <= texSample_bilinear_readTL2;

				when texSample_bilinear_readTL2 =>
					TL.R <= unsigned(TexCache_douta(7 downto 0) );
					TL.G <= unsigned(TexCache_douta(15 downto 8) );
					TL.B <= unsigned(TexCache_douta(23 downto 16) );
					TL.A <= unsigned(TexCache_douta(31 downto 24) );
					texCacheAddress <= std_logic_vector(unsigned(texCacheAddress) + 1);
					texCacheEnable <= '1';
					texCacheWriteEnable <= (others => '0');

					currentState <= texSample_bilinear_readTR;

				when texSample_bilinear_readTR =>
					currentState <= texSample_bilinear_readTR2;

				when texSample_bilinear_readTR2 =>
					TR.R <= unsigned(TexCache_douta(7 downto 0) );
					TR.G <= unsigned(TexCache_douta(15 downto 8) );
					TR.B <= unsigned(TexCache_douta(23 downto 16) );
					TR.A <= unsigned(TexCache_douta(31 downto 24) );
					texCacheAddress <= STD_LOGIC_VECTOR( ( (resize(texY, texCacheAddress'length) + 1) sll GetTexDimensionMultiplier(texWidth) ) + texX);
					texCacheEnable <= '1';
					texCacheWriteEnable <= (others => '0');

					currentState <= texSample_bilinear_readBL;

				when texSample_bilinear_readBL =>
					currentState <= texSample_bilinear_readBL2;

				when texSample_bilinear_readBL2 =>
					BL.R <= unsigned(TexCache_douta(7 downto 0) );
					BL.G <= unsigned(TexCache_douta(15 downto 8) );
					BL.B <= unsigned(TexCache_douta(23 downto 16) );
					BL.A <= unsigned(TexCache_douta(31 downto 24) );
					texCacheAddress <= std_logic_vector(unsigned(texCacheAddress) + 1);
					texCacheEnable <= '1';
					texCacheWriteEnable <= (others => '0');

					currentState <= texSample_bilinear_readBR;

				when texSample_bilinear_readBR =>
					currentState <= texSample_bilinear_readBR2;

				when texSample_bilinear_readBR2 =>
					BR.R <= unsigned(TexCache_douta(7 downto 0) );
					BR.G <= unsigned(TexCache_douta(15 downto 8) );
					BR.B <= unsigned(TexCache_douta(23 downto 16) );
					BR.A <= unsigned(TexCache_douta(31 downto 24) );
					texCacheEnable <= '0';
					texCacheWriteEnable <= (others => '0');

					currentState <= bilinear_xMinMax;

				when bilinear_xMinMax =>
					lerpDirectionT <= minBits(TL, TR);
					lerpDirectionB <= minBits(BL, BR);
					currentState <= bilinear_xDelta;

				when bilinear_xDelta =>
					minT := assembleMin(TL, TR, lerpDirectionT);
					minB := assembleMin(BL, BR, lerpDirectionB);
					maxT := assembleMax(TL, TR, lerpDirectionT);
					maxB := assembleMax(BL, BR, lerpDirectionB);
					interpXT <= assembleInterpVec(unsigned(interpBitsX), lerpDirectionT);
					interpXB <= assembleInterpVec(unsigned(interpBitsX), lerpDirectionB);
					deltaT.R <= maxT.R - minT.R;
					deltaT.G <= maxT.G - minT.G;
					deltaT.B <= maxT.B - minT.B;
					deltaT.A <= maxT.A - minT.A;

					deltaB.R <= maxB.R - minB.R;
					deltaB.G <= maxB.G - minB.G;
					deltaB.B <= maxB.B - minB.B;
					deltaB.A <= maxB.A - minB.A;
					currentState <= bilinear_xMultiply;

				when bilinear_xMultiply =>
					mulTemporaryT.X <= deltaT.R * interpXT.X;
					mulTemporaryT.Y <= deltaT.G * interpXT.Y;
					mulTemporaryT.Z <= deltaT.B * interpXT.Z;
					mulTemporaryT.W <= deltaT.A * interpXT.W;

					mulTemporaryB.X <= deltaB.R * interpXB.X;
					mulTemporaryB.Y <= deltaB.G * interpXB.Y;
					mulTemporaryB.Z <= deltaB.B * interpXB.Z;
					mulTemporaryB.W <= deltaB.A * interpXB.W;
					currentState <= bilinear_xCombine;

				when bilinear_xCombine =>
					tempCombine := minT.R + (mulTemporaryT.X srl 8);
					lerpedT.R <= tempCombine(7 downto 0);
					tempCombine := minT.G + (mulTemporaryT.Y srl 8);
					lerpedT.G <= tempCombine(7 downto 0);
					tempCombine := minT.B + (mulTemporaryT.Z srl 8);
					lerpedT.B <= tempCombine(7 downto 0);
					tempCombine := minT.A + (mulTemporaryT.W srl 8);
					lerpedT.A <= tempCombine(7 downto 0);

					tempCombine := minB.R + (mulTemporaryB.X srl 8);
					lerpedB.R <= tempCombine(7 downto 0);
					tempCombine := minB.G + (mulTemporaryB.Y srl 8);
					lerpedB.G <= tempCombine(7 downto 0);
					tempCombine := minB.B + (mulTemporaryB.Z srl 8);
					lerpedB.B <= tempCombine(7 downto 0);
					tempCombine := minB.A + (mulTemporaryB.W srl 8);
					lerpedB.A <= tempCombine(7 downto 0);
					currentState <= bilinear_yMinMax;

				when bilinear_yMinMax =>
					lerpDirectionY <= minBits(lerpedT, lerpedB);
					currentState <= bilinear_yDelta;

				when bilinear_yDelta =>
					minY := assembleMin(lerpedT, lerpedB, lerpDirectionY);
					maxY := assembleMax(lerpedT, lerpedB, lerpDirectionY);
					interpY <= assembleInterpVec(unsigned(interpBitsY), lerpDirectionY);
					deltaY.R <= maxY.R - minY.R;
					deltaY.G <= maxY.G - minY.G;
					deltaY.B <= maxY.B - minY.B;
					deltaY.A <= maxY.A - minY.A;
					currentState <= bilinear_yMultiply;

				when bilinear_yMultiply =>
					mulTemporaryY.X <= deltaY.R * interpY.X;
					mulTemporaryY.Y <= deltaY.G * interpY.Y;
					mulTemporaryY.Z <= deltaY.B * interpY.Z;
					mulTemporaryY.W <= deltaY.A * interpY.W;
					currentState <= bilinear_yCombine;

				when bilinear_yCombine =>
					tempCombine := minY.R + (mulTemporaryY.X srl 8);
					outColorRegR <= std_logic_vector(tempCombine(7 downto 0) ); 

					tempCombine := minY.G + (mulTemporaryY.Y srl 8);
					outColorRegG <= std_logic_vector(tempCombine(7 downto 0) );

					tempCombine := minY.B + (mulTemporaryY.Z srl 8);
					outColorRegB <= std_logic_vector(tempCombine(7 downto 0) );

					tempCombine := minY.A + (mulTemporaryY.W srl 8);
					outColorRegA <= std_logic_vector(tempCombine(7 downto 0) );

					currentState <= swizzleTexColors;

				when swizzleTexColors =>
					outColorRegR <= GetSwizzledOutput(outputMUXR, outColorRegR, outColorRegG, outColorRegB, outColorRegA);
					outColorRegG <= GetSwizzledOutput(outputMUXG, outColorRegR, outColorRegG, outColorRegB, outColorRegA);
					outColorRegB <= GetSwizzledOutput(outputMUXB, outColorRegR, outColorRegG, outColorRegB, outColorRegA);
					outColorRegA <= GetSwizzledOutput(outputMUXA, outColorRegR, outColorRegG, outColorRegB, outColorRegA);

					currentState <= modulateTexWithVertexColor;

				when modulateTexWithVertexColor =>
					modulatedTexVertexColorProductR <= unsigned(outColorRegR) * unsigned(storedVertColorRGBA(7 downto 0) );
					modulatedTexVertexColorProductG <= unsigned(outColorRegG) * unsigned(storedVertColorRGBA(15 downto 8) );
					modulatedTexVertexColorProductB <= unsigned(outColorRegB) * unsigned(storedVertColorRGBA(23 downto 16) );
					modulatedTexVertexColorProductA <= unsigned(outColorRegA) * unsigned(storedVertColorRGBA(31 downto 24) );
					currentState <= setupOutput;

				-- These latter stages are once again shared by both point and bilinear sampling:
				when setupOutput =>
					ROP_outPixelX <= storedPixelX;
					ROP_outPixelY <= storedPixelY;

					-- Color output:
					case (colorCombinerMode) is
						when to_unsigned(0, 3) => -- All black
							ROP_outR <= (others => '0');
							ROP_outG <= (others => '0');
							ROP_outB <= (others => '0');
						when to_unsigned(1, 3) => -- All white
							ROP_outR <= (others => '1');
							ROP_outG <= (others => '1');
							ROP_outB <= (others => '1');
						when to_unsigned(2, 3) => -- Texture only (no vert color)
							ROP_outR <= outColorRegR;
							ROP_outG <= outColorRegG;
							ROP_outB <= outColorRegB;
						when to_unsigned(3, 3) => -- Vert color only (no texture)
							ROP_outR <= storedVertColorRGBA(7 downto 0);
							ROP_outG <= storedVertColorRGBA(15 downto 8);
							ROP_outB <= storedVertColorRGBA(23 downto 16);
						when to_unsigned(4, 3) => -- Texcoord output (debugging):
							ROP_outR <= std_logic_vector(texX sll 1); -- Multiply by 2 by shifting left by 1 to convert from 0...128 coords to 0...256 colors
							ROP_outG <= std_logic_vector(texY sll 1);
							ROP_outB <= "00000000";
						when to_unsigned(5, 3) => -- Bilinear interpolants output (debugging):
							ROP_outR <= interpBitsX;
							ROP_outG <= interpBitsY;
							ROP_outB <= "00000000";
						when others => -- Standard rendering (vertex color modulated with texture color)
							ROP_outR <= std_logic_vector(modulatedTexVertexColorProductR(15 downto 8) );
							ROP_outG <= std_logic_vector(modulatedTexVertexColorProductG(15 downto 8) );
							ROP_outB <= std_logic_vector(modulatedTexVertexColorProductB(15 downto 8) );
					end case;

					case (alphaCombinerMode) is
						when to_unsigned(0, 3) => -- All black
							ROP_outA <= (others => '0');
						when to_unsigned(1, 3) => -- All white
							ROP_outA <= (others => '1');
						when to_unsigned(2, 3) => -- Texture only (no vert color)
							ROP_outA <= outColorRegA;
						when to_unsigned(3, 3) => -- Vert color only (no texture)
							ROP_outA <= storedVertColorRGBA(31 downto 24);
						when to_unsigned(4, 3) => -- Texcoord output (debugging):
							ROP_outA <= (others => '1');
						when to_unsigned(5, 3) => -- Bilinear interpolants output (debugging):
							ROP_outA <= (others => '1');
						when others => -- Standard rendering (vertex color modulated with texture color)
							ROP_outA <= std_logic_vector(modulatedTexVertexColorProductA(15 downto 8) );
					end case;

					ROP_writeIsValid <= '1'; -- Signal the write request
					currentState <= waitingForWrite;

				when waitingForWrite =>
					if (ROP_writeAck = '1') then
						ROP_writeIsValid <= '0';
						INTERP_readyForNewWrite <= '1';
						currentState <= waitingForRead;
					end if;

				when setTextureState =>
					CMD_SetTextureStateAckSignal <= '0'; -- Deassert after one clock cycle
					bilinearModeEnabled <= CMD_SetTextureStateUseBilinear;
					outputMUXR <= unsigned(CMD_LoadTexCacheAddr(2 downto 0) );
					outputMUXG <= unsigned(CMD_LoadTexCacheAddr(6 downto 4) );
					outputMUXB <= unsigned(CMD_LoadTexCacheAddr(10 downto 8) );
					outputMUXA <= unsigned(CMD_LoadTexCacheAddr(14 downto 12) );
					texWidth <= unsigned(CMD_LoadTexCacheTexelWidth);
					texHeight <= unsigned(CMD_LoadTexCacheTexelHeight);
					colorCombinerMode <= unsigned(CMD_SetTextureStateCombinerModeColor);
					alphaCombinerMode <= unsigned(CMD_SetTextureStateCombinerModeAlpha);
					currentState <= waitingForRead;

				when loadTextureState =>
					CMD_LoadTexCacheAckSignal <= '0'; -- Deassert after one clock cycle
					loadTexCacheReadAddr <= unsigned(CMD_LoadTexCacheAddr);
					texCacheReadTexelsCount <= unsigned(CMD_LoadTexCacheTexelCount);
					texFormat <= unsigned(CMD_LoadTexCacheFormat);
					texCacheAddress <= (others => '0');
					currentState <= loadTextureState_memRequest;

				when loadTextureState_memRequest =>
					if (MEM_TexSampReadRequestsFIFO_full = '0') then
						MEM_TexSampReadRequestsFIFO_wr_en <= '1';
						MEM_TexSampReadRequestsFIFO_wr_data <= std_logic_vector(loadTexCacheReadAddr);
						loadTexCacheReadAddr <= loadTexCacheReadAddr + 32;
						currentState <= loadTextureState_memResponse;
					else
						MEM_TexSampReadRequestsFIFO_wr_en <= '0'; -- Do not write if our FIFO is full!
					end if;

				when loadTextureState_memResponse =>
					MEM_TexSampReadRequestsFIFO_wr_en <= '0'; -- Deassert after one clock cycle
					if (MEM_TexSampReadResponsesFIFO_empty = '0') then
						MEM_TexSampReadResponsesFIFO_rd_en <= '1';
						loadTexCacheLine <= std_logic_vector(unsigned(MEM_TexSampReadResponsesFIFO_rd_data(255 downto 0) ) srl GetFormatTexelSizeBits(TexFormat) );

						texCacheWriteEnable <= (others => '1');
						texCacheEnable <= '1';
						texCacheAddress <= STD_LOGIC_VECTOR(unsigned(texCacheAddress) + 1);
						texCacheWriteData <= std_logic_vector(UnpackCacheBytesForFormat(TexFormat, unsigned(MEM_TexSampReadResponsesFIFO_rd_data(31 downto 0) ) ) );
						cacheLineReadIters <= GetFormatTexelsPerDRAMLine(TexFormat) - 1;
						texCacheReadTexelsCount <= texCacheReadTexelsCount - 1;

						currentState <= loadTextureState_cacheLine;
					else
						MEM_TexSampReadResponsesFIFO_rd_en <= '0'; -- Do not advance our FIFO read pointer unless there's some data in it first!
					end if;

				when loadTextureState_cacheLine =>
					MEM_TexSampReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
					texCacheAddress <= STD_LOGIC_VECTOR(unsigned(texCacheAddress) + 1);
					texCacheWriteEnable <= (others => '1');
					texCacheEnable <= '1';
					cacheLineReadIters <= cacheLineReadIters - 1;
					texCacheReadTexelsCount <= texCacheReadTexelsCount - 1;
					texCacheWriteData <= std_logic_vector(UnpackCacheBytesForFormat(TexFormat, unsigned(loadTexCacheLine(31 downto 0) ) ) );
					loadTexCacheLine <= std_logic_vector(unsigned(loadTexCacheLine) srl GetFormatTexelSizeBits(TexFormat) );
					if (texCacheReadTexelsCount = to_unsigned(1, 16) ) then
						texCacheEnable <= '0';
						texCacheWriteEnable <= (others => '0');
						currentState <= waitingForRead; -- All done!
					elsif (cacheLineReadIters = to_unsigned(1, 5) ) then
						currentState <= loadTextureState_memRequest;
					end if;
			end case;
		end if;
	end process;

end Behavioral;
