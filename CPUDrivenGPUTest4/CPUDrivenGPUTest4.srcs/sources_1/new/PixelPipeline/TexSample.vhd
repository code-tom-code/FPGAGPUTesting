library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet definition file so that we can use the texChannelMUX and eTexFormat enums type defined in there
library work;
use work.PacketType.all;
use work.PixelPipeline_Types.all;
use work.TexSampleState.all;

entity TexSample is
	Port ( clk : in STD_LOGIC;

	-- Attribute Interpolator FIFO interface begin
		INTERP_InFIFO_rd_data : in STD_LOGIC_VECTOR(95 downto 0); -- 12 bytes per pixel of input data to the texture sampler
        INTERP_InFIFO_empty : in STD_LOGIC;
		INTERP_InFIFO_almost_empty : in STD_LOGIC;
        INTERP_InFIFO_rd_en : out STD_LOGIC := '0';
	-- Attribute Interpolator FIFO interface end

	-- Memory Controller FIFO interface begin
		-- DRAM read requests FIFO:
		MEM_TexSampReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
        MEM_TexSampReadRequestsFIFO_full : in STD_LOGIC;
        MEM_TexSampReadRequestsFIFO_wr_en : out STD_LOGIC := '0';

		-- DRAM read responses FIFO:
		MEM_TexSampReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR(256-1 downto 0);
        MEM_TexSampReadResponsesFIFO_empty : in STD_LOGIC;
		MEM_TexSampReadResponsesFIFO_almost_empty : in STD_LOGIC;
        MEM_TexSampReadResponsesFIFO_rd_en : out STD_LOGIC := '0';
	-- Memory Controller FIFO interface end

	-- Texture Sampler State Block interface begin
		STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR(TEX_SAMPLER_STATE_SIZE_BITS-1 downto 0);
		STATE_NextDrawID : in STD_LOGIC_VECTOR(15 downto 0);
		STATE_StateIsValid : in STD_LOGIC;
		STATE_ConsumeStateSlot : out STD_LOGIC := '0';
	-- Texture Sampler State Block interface end

	-- Texture cache BRAM interfaces begin
		TexCache_addra : out STD_LOGIC_VECTOR(13 downto 0) := (others => '0');
		TexCache_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TexCache_douta : in STD_LOGIC_VECTOR(31 downto 0);
		TexCache_ena : out STD_LOGIC := '0';
		TexCache_clk : out STD_LOGIC := '0';
		TexCache_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	-- Texture cache BRAM interfaces end

	-- Command Processor block interface begin
		CMD_TexSampleIsIdle : out STD_LOGIC := '0';
	-- Command Processor block interface end

	-- ROP FIFO begin
		ROP_OutFIFO_wr_data : out STD_LOGIC_VECTOR(63 downto 0) := (others => '0'); -- 8 bytes per pixel of output data to the ROP unit
        ROP_OutFIFO_full : in STD_LOGIC;
        ROP_OutFIFO_wr_en : out STD_LOGIC := '0';
	-- ROP FIFO end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingCacheLoad : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_TexSample_State : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		DBG_TexCache_douta : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_TexCache_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_TexCache_addra : out STD_LOGIC_VECTOR(13 downto 0) := (others => '0');
		DBG_texCacheReadTexelsCount : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		
		DBG_Message : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_MessageData : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_NewMessage : out STD_LOGIC := '0'
		);
end TexSample;

architecture Behavioral of TexSample is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
ATTRIBUTE X_INTERFACE_MODE : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";

-- We're using the ASSOCIATED_BUSIF parameter here to associate these other interfaces' clocks with the main clock (which is this module's primary driving clock for everything).
-- Doing this fixes the following IPI import warning: WARNING: [IP_Flow 19-11886] Bus Interface 'clk' is not associated with any clock interface
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000, ASSOCIATED_BUSIF TexSampReadRequestsFIFO:TexSampReadResponses:INTERP_IN_FIFO:ROP_OUT_FIFO:TexCache";

-- We're using the X_INTERFACE_MODE attribute here to set the interface mode to "master" mode. Options include "master", "slave", and "monitor" (used for monitoring an interface that is driven by another master/slave).
-- Doing this fixes the following IPI import warnings:
-- WARNING: [IP_Flow 19-5462] Defaulting to slave bus interface due to conflicts in bus interface inference.
-- WARNING: [IP_Flow 19-3480] Bus Interface 'TexSampReadResponses': Portmap direction mismatched between component port 'MEM_TexSampReadResponsesFIFO_rd_data' and definition port 'RD_DATA'.
ATTRIBUTE X_INTERFACE_MODE of MEM_TexSampReadRequestsFIFO_wr_data: SIGNAL is "master";
ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO FULL";

ATTRIBUTE X_INTERFACE_MODE of MEM_TexSampReadResponsesFIFO_rd_data: SIGNAL is "master";
ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadResponsesFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadResponsesFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses RD_EN";
ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadResponsesFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses EMPTY";
ATTRIBUTE X_INTERFACE_INFO of MEM_TexSampReadResponsesFIFO_almost_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses ALMOST_EMPTY";

ATTRIBUTE X_INTERFACE_MODE of INTERP_InFIFO_rd_data: SIGNAL is "master";
ATTRIBUTE X_INTERFACE_INFO of INTERP_InFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of INTERP_InFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of INTERP_InFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO EMPTY";
ATTRIBUTE X_INTERFACE_INFO of INTERP_InFIFO_almost_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO ALMOST_EMPTY";

ATTRIBUTE X_INTERFACE_MODE of ROP_OutFIFO_wr_data: SIGNAL is "master";
ATTRIBUTE X_INTERFACE_INFO of ROP_OutFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of ROP_OutFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of ROP_OutFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO FULL";

-- Texture cache is ideally 64x128 R8G8B8A8 texel pairs (two 32-bit texels in a single transaction because URAM reads/writes 64 bits at a time)
ATTRIBUTE X_INTERFACE_MODE of TexCache_douta: SIGNAL is "master";
ATTRIBUTE X_INTERFACE_INFO of TexCache_clk: SIGNAL is "xilinx.com:interface:bram:1.0 TexCache CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of TexCache_clk: SIGNAL is "FREQ_HZ 333250000";
ATTRIBUTE X_INTERFACE_INFO of TexCache_ena: SIGNAL is "xilinx.com:interface:bram:1.0 TexCache EN";
ATTRIBUTE X_INTERFACE_INFO of TexCache_douta: SIGNAL is "xilinx.com:interface:bram:1.0 TexCache DOUT";
ATTRIBUTE X_INTERFACE_INFO of TexCache_dina: SIGNAL is "xilinx.com:interface:bram:1.0 TexCache DIN";
ATTRIBUTE X_INTERFACE_INFO of TexCache_wea: SIGNAL is "xilinx.com:interface:bram:1.0 TexCache WE";
ATTRIBUTE X_INTERFACE_INFO of TexCache_addra: SIGNAL is "xilinx.com:interface:bram:1.0 TexCache ADDR";

type texSampleStateType is 
(
	waitingForRead, -- 0
    
	-- Tex sample entry points (one for point-sampling and the other for bilinear)
	texSample_point_address, -- 1
	texSample_point_read, -- 2
	texSample_point_read2, -- 3
	texSample_point_read3, -- 4
	texSample_bilinear_readTL, -- 5
	texSample_bilinear_readTR, -- 6
	texSample_bilinear_readBL, -- 7
	texSample_bilinear_readBR, -- 8
	texSample_bilinear_waitReadsComplete1, -- 9
	texSample_bilinear_waitReadsComplete2, -- 10
	texSample_bilinear_waitReadsComplete3, -- 11

	-- These stages are used for bilinear interpolation only
	bilinear_xMinMax, -- 12
	bilinear_xDelta, -- 13
	bilinear_xMultiply, -- 14
	bilinear_xCombine, -- 15
	bilinear_yMinMax, -- 16
	bilinear_yDelta, -- 17
	bilinear_yMultiply, -- 18
	bilinear_yCombine, -- 19

	-- These latter stages are once again shared by both point and bilinear sampling:
	swizzleTexColors, -- 20
	modulateTexWithVertexColor, -- 21
	setupOutput, -- 22
	waitingForWrite, -- 23

	loadTextureState_memRequest, -- 24
	loadTextureState_memResponse, -- 25
	loadTextureState_cacheLine, -- 26
	loadNullTextureState -- 27
);

signal currentState : texSampleStateType := waitingForRead;

signal texX : unsigned(7 downto 0) := (others => '0');
signal texY : unsigned(7 downto 0) := (others => '0');
signal texWidth : unsigned(2 downto 0) := (others => '0'); -- Since these are all known to be powers of 2, we can simply use log2(x) here instead of the actual resolution to save bits
signal texHeight : unsigned(2 downto 0) := (others => '0'); -- Value of 0=1x1, 1=2x2, 2=4x4, 3=8x8, 4=16x16, 5=32x32, 6=64x64, 7=128x128
signal texFormat : eTexFormat := eTexFmtA8R8G8B8;
signal texCacheAddress : STD_LOGIC_VECTOR(13 downto 0) := (others => '0');
signal texCacheEnable : STD_LOGIC := '0';
signal texCacheWriteData : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal texCacheWriteEnable : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
signal texCacheReadTexelsCount : unsigned(15 downto 0) := (others => '0');

signal bilinearModeEnabled : STD_LOGIC := '0';
signal loadTexCacheReadAddr : unsigned(29 downto 0) := (others => '0');
signal loadTexCacheLine : STD_LOGIC_VECTOR(255 downto 0) := (others => '0');
signal cacheLineReadIters : unsigned(4 downto 0) := (others => '0');

signal outputMUXR : texChannelMUX := TCM_B;
signal outputMUXG : texChannelMUX := TCM_G;
signal outputMUXB : texChannelMUX := TCM_R;
signal outputMUXA : texChannelMUX := TCM_A;

signal colorCombinerMode : eCombinerMode := cbm_textureModulateVertexColor;
signal alphaCombinerMode : eCombinerMode := cbm_textureModulateVertexColor;

signal interpBitsX : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal interpBitsY : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal storedPixelX : unsigned(15 downto 0) := (others => '0');
signal storedPixelY : unsigned(15 downto 0) := (others => '0');
signal currentDrawEventID : unsigned(15 downto 0) := (others => '0');
signal storedVertColorRGBA : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal outColorRegR : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); -- Default the color to (0, 0, 0, 1) (opaque black)
signal outColorRegG : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal outColorRegB : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal outColorRegA : STD_LOGIC_VECTOR(7 downto 0) := (others => '1');

signal modulatedTexVertexColorProductR : unsigned(15 downto 0) := (others => '0');
signal modulatedTexVertexColorProductG : unsigned(15 downto 0) := (others => '0');
signal modulatedTexVertexColorProductB : unsigned(15 downto 0) := (others => '0');
signal modulatedTexVertexColorProductA : unsigned(15 downto 0) := (others => '0');

signal ROP_outR : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal ROP_outG : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal ROP_outB : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal ROP_outA : STD_LOGIC_VECTOR(7 downto 0) := (others => '1');

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

signal cmdTexSampleIsIdle : std_logic := '0';

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

	pure function WrapTexelToTextureDimension(texelInput : unsigned(7 downto 0); texSize : unsigned(2 downto 0) ) return unsigned is
	begin
		case texSize is
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
	
	pure function GetSwizzledOutput(channelMUX : texChannelMUX; channelR : std_logic_vector(7 downto 0);
		channelG : std_logic_vector(7 downto 0); channelB : std_logic_vector(7 downto 0); channelA : std_logic_vector(7 downto 0) ) return std_logic_vector is
	begin
		case channelMUX is
			when TCM_R =>
				return channelR;
			when TCM_G =>
				return channelG;
			when TCM_B =>
				return channelB;
			when TCM_A =>
				return channelA;
			when TCM_0 =>
				return x"00";
			when others => --when TCM_1 =>
				return x"FF";
		end case;
	end function;

	-- Returns the logical shift bit count for this format
	pure function GetFormatTexelSizeBits(texFormat : eTexFormat) return integer is
	begin
		case texFormat is
			when eTexFmtA8R8G8B8 =>
				return 32;
			when eTexFmtX8R8G8B8 =>
				return 32;
			when eTexFmtR5G6B5 =>
				return 16;
			when eTexFmtA1R5G5B5 =>
				return 16;
			when eTexFmtX1R5G5B5 =>
				return 16;
			when others => --when eTexFmtA4R4G4B4 =>
				return 16;
		end case;
	end function;

	-- Returns how many texels of the given format will fit into a single 32-byte DRAM line
	pure function GetFormatTexelsPerDRAMLine(texFormat : eTexFormat) return unsigned is
	begin
		case texFormat is
			when eTexFmtX8R8G8B8 =>
				return to_unsigned(8, 5);
			when eTexFmtA4R4G4B4 =>
				return to_unsigned(16, 5);
			when eTexFmtR5G6B5 =>
				return to_unsigned(16, 5);
			when eTexFmtA1R5G5B5 =>
				return to_unsigned(16, 5);
			when eTexFmtX1R5G5B5 =>
				return to_unsigned(16, 5);
			when others => --when eTexFmtA8R8G8B8 =>
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
	pure function UnpackCacheBytesForFormat(texFormat : eTexFormat; cacheBits : unsigned(31 downto 0) ) return unsigned is
	begin
		case texFormat is
			when eTexFmtX8R8G8B8 =>
				return cacheBits or x"FF000000";
			when eTexFmtA4R4G4B4 =>
				return cacheBits(15 downto 12) & cacheBits(15 downto 12) & cacheBits(11 downto 8) & cacheBits(11 downto 8)
				& cacheBits(7 downto 4) & cacheBits(7 downto 4) & cacheBits(3 downto 0) & cacheBits(3 downto 0);
			when eTexFmtR5G6B5 =>
				return x"FF" & Unpack5To8Bits(cacheBits(15 downto 11) ) & Unpack6To8Bits(cacheBits(10 downto 5) ) & Unpack5To8Bits(cacheBits(4 downto 0) );
			when eTexFmtA1R5G5B5 =>
				if (cacheBits(15) = '1') then
					return x"FF" & Unpack5To8Bits(cacheBits(14 downto 10) ) & Unpack5To8Bits(cacheBits(9 downto 5) ) & Unpack5To8Bits(cacheBits(4 downto 0) );
				else
					return x"00" & Unpack5To8Bits(cacheBits(14 downto 10) ) & Unpack5To8Bits(cacheBits(9 downto 5) ) & Unpack5To8Bits(cacheBits(4 downto 0) );
				end if;
			when eTexFmtX1R5G5B5 =>
					return x"FF" & Unpack5To8Bits(cacheBits(14 downto 10) ) & Unpack5To8Bits(cacheBits(9 downto 5) ) & Unpack5To8Bits(cacheBits(4 downto 0) );
			when others => --when eTexFmtA8R8G8B8 =>
				return cacheBits;
		end case;
	end function;

	pure function PackOutputData(pixelX : unsigned(15 downto 0); pixelY : unsigned(15 downto 0); pixelR : unsigned(7 downto 0); pixelG : unsigned(7 downto 0); pixelB : unsigned(7 downto 0); pixelA : unsigned(7 downto 0) ) return unsigned is
	begin
		return pixelA & pixelB & pixelG & pixelR & pixelY & pixelX;
	end function;

begin

TexCache_clk <= clk;
TexCache_addra <= texCacheAddress;
TexCache_ena <= texCacheEnable;
TexCache_wea <= texCacheWriteEnable;
TexCache_dina <= texCacheWriteData;

CMD_TexSampleIsIdle <= '1' when (cmdTexSampleIsIdle = '1' and INTERP_InFIFO_empty = '1') else '0';

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);
STAT_CyclesWaitingCacheLoad <= std_logic_vector(statCyclesWaitingForCacheLoad);

DBG_TexSample_State <= std_logic_vector(to_unsigned(texSampleStateType'pos(currentState), 6) );
DBG_TexCache_douta <= TexCache_douta;
DBG_TexCache_dina <= texCacheWriteData;
DBG_TexCache_addra <= texCacheAddress;
DBG_texCacheReadTexelsCount <= std_logic_vector(texCacheReadTexelsCount);

	process(clk)
	begin
		if (rising_edge(clk) ) then
			STAT_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);
			case currentState is
				when waitingForRead =>
					statCyclesIdle <= statCyclesIdle + 1;

				when waitingForWrite =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when loadTextureState_memRequest | loadTextureState_memResponse | loadTextureState_cacheLine =>
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
			cmdTexSampleIsIdle <= '0';
			INTERP_InFIFO_rd_en <= '0';
			STATE_ConsumeStateSlot <= '0';

			case currentState is
				when waitingForRead =>
					ROP_OutFIFO_wr_en <= '0'; -- Deassert after one cycle
					DBG_NewMessage <= '0';

					storedVertColorRGBA <= INTERP_InFIFO_rd_data(95 downto 64);
					tempShiftTexcoord := resize(unsigned(INTERP_InFIFO_rd_data(47 downto 32) ), tempShiftTexcoord'length) srl GetTexDimensionShift(texWidth);
					texX <= tempShiftTexcoord(15 downto 8);
					interpBitsX <= std_logic_vector(tempShiftTexcoord(7 downto 0) );
					tempShiftTexcoord := resize(unsigned(INTERP_InFIFO_rd_data(63 downto 48) ), tempShiftTexcoord'length) srl GetTexDimensionShift(texHeight);
					texY <= tempShiftTexcoord(15 downto 8);
					interpBitsY <= std_logic_vector(tempShiftTexcoord(7 downto 0) );
					storedPixelX <= unsigned(INTERP_InFIFO_rd_data(15 downto 0) );
					storedPixelY <= unsigned(INTERP_InFIFO_rd_data(31 downto 16) );

					if (STATE_StateIsValid = '1' and currentDrawEventID = unsigned(STATE_NextDrawID) ) then
						STATE_ConsumeStateSlot <= '1';

						bilinearModeEnabled <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).UseBilinearFiltering;
						outputMUXR <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).ChannelSwizzleR;
						outputMUXG <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).ChannelSwizzleG;
						outputMUXB <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).ChannelSwizzleB;
						outputMUXA <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).ChannelSwizzleA;
						texWidth <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).TextureWidthLog2;
						texHeight <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).TextureHeightLog2;
						colorCombinerMode <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).ColorCombinerMode;
						alphaCombinerMode <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).AlphaCombinerMode;
						loadTexCacheReadAddr <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).TextureBaseAddr;
						texCacheReadTexelsCount <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).TotalTexelCount;
						texFormat <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID).TextureFormat;
						texCacheAddress <= (others => '0');
						if (DeserializeBitsToStruct(STATE_StateBitsAtDrawID).TotalTexelCount = 0) then
							currentState <= loadNullTextureState;
						else
							currentState <= loadTextureState_memRequest;
						end if;
					elsif (INTERP_InFIFO_empty = '0') then
						INTERP_InFIFO_rd_en <= '1';

						if (IsSpecialPixelMessage(unsigned(INTERP_InFIFO_rd_data(15 downto 0) ) ) ) then
							if (INTERP_InFIFO_rd_data(eSpecialPixelCodeBits'pos(SetNewDrawEventID) ) = '1') then
								currentDrawEventID <= unsigned(INTERP_InFIFO_rd_data(31 downto 16) );
								currentState <= waitingForWrite;
							end if;
							if (INTERP_InFIFO_rd_data(eSpecialPixelCodeBits'pos(TerminateCurrentDrawEventID) ) = '1') then
								currentState <= waitingForWrite;
							end if;
						else
							if (bilinearModeEnabled = '0') then
								currentState <= texSample_point_address;
							else
								currentState <= texSample_bilinear_readTL;
							end if;
						end if;
					else
						cmdTexSampleIsIdle <= '1';
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
					currentState <= texSample_point_read3;

				when texSample_point_read3 =>
					outColorRegR <= TexCache_douta(7 downto 0);--x"00";-- --
					outColorRegG <= TexCache_douta(15 downto 8);--INTERP_inInterpolatedTexcoordY(15 downto 8);----
					outColorRegB <= TexCache_douta(23 downto 16);--INTERP_inInterpolatedTexcoordX(15 downto 8);-- -- 
					outColorRegA <= TexCache_douta(31 downto 24);--x"FF";----
					texCacheEnable <= '0'; -- Deassert after we're done reading
					currentState <= swizzleTexColors;

					-- TOMTODO: We don't need to spend 12 cycles doing bilinear taps from the texture cache, we can
					-- use pipelining to do the same sampling with 6 or 7 cycles instead!
				when texSample_bilinear_readTL =>
					-- Bilinear interpolation needs to do more than just one sample
					texCacheAddress <= STD_LOGIC_VECTOR( (resize(texY, texCacheAddress'length) sll GetTexDimensionMultiplier(texWidth) ) + texX);
					texCacheEnable <= '1';
					texCacheWriteEnable <= (others => '0');

					currentState <= texSample_bilinear_readTR;

				when texSample_bilinear_readTR =>
					texCacheAddress <= STD_LOGIC_VECTOR( (resize(texY, texCacheAddress'length) sll GetTexDimensionMultiplier(texWidth) ) + WrapTexelToTextureDimension(texX + 1, texWidth) );
					currentState <= texSample_bilinear_readBL;

				when texSample_bilinear_readBL =>
					texCacheAddress <= STD_LOGIC_VECTOR( ( (resize(WrapTexelToTextureDimension(texY + 1, texHeight), texCacheAddress'length) ) sll GetTexDimensionMultiplier(texWidth) ) + texX);
					currentState <= texSample_bilinear_readBR;

				when texSample_bilinear_readBR =>
					TL.R <= unsigned(TexCache_douta(7 downto 0) );
					TL.G <= unsigned(TexCache_douta(15 downto 8) );
					TL.B <= unsigned(TexCache_douta(23 downto 16) );
					TL.A <= unsigned(TexCache_douta(31 downto 24) );

					texCacheAddress <= STD_LOGIC_VECTOR( ( (resize(WrapTexelToTextureDimension(texY + 1, texHeight), texCacheAddress'length) ) sll GetTexDimensionMultiplier(texWidth) ) + WrapTexelToTextureDimension(texX + 1, texWidth) );
					currentState <= texSample_bilinear_waitReadsComplete1;

				when texSample_bilinear_waitReadsComplete1 =>
					TR.R <= unsigned(TexCache_douta(7 downto 0) );
					TR.G <= unsigned(TexCache_douta(15 downto 8) );
					TR.B <= unsigned(TexCache_douta(23 downto 16) );
					TR.A <= unsigned(TexCache_douta(31 downto 24) );
					currentState <= texSample_bilinear_waitReadsComplete2;

				when texSample_bilinear_waitReadsComplete2 =>
					BL.R <= unsigned(TexCache_douta(7 downto 0) );
					BL.G <= unsigned(TexCache_douta(15 downto 8) );
					BL.B <= unsigned(TexCache_douta(23 downto 16) );
					BL.A <= unsigned(TexCache_douta(31 downto 24) );
					currentState <= texSample_bilinear_waitReadsComplete3;

				when texSample_bilinear_waitReadsComplete3 =>
					BR.R <= unsigned(TexCache_douta(7 downto 0) );
					BR.G <= unsigned(TexCache_douta(15 downto 8) );
					BR.B <= unsigned(TexCache_douta(23 downto 16) );
					BR.A <= unsigned(TexCache_douta(31 downto 24) );

					texCacheEnable <= '0'; -- Deassert after we're done reading
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
					-- Color output:
					case colorCombinerMode is
						when cbm_allBlack => -- All black
							ROP_outR <= (others => '0');
							ROP_outG <= (others => '0');
							ROP_outB <= (others => '0');
						when cbm_allWhite => -- All white
							ROP_outR <= (others => '1');
							ROP_outG <= (others => '1');
							ROP_outB <= (others => '1');
						when cbm_textureOnly => -- Texture only (no vert color)
							ROP_outR <= outColorRegR;
							ROP_outG <= outColorRegG;
							ROP_outB <= outColorRegB;
						when cbm_vertexColorOnly => -- Vert color only (no texture)
							ROP_outR <= storedVertColorRGBA(7 downto 0);
							ROP_outG <= storedVertColorRGBA(15 downto 8);
							ROP_outB <= storedVertColorRGBA(23 downto 16);
						when cbm_debugTexcoords => -- Texcoord output (debugging):
							ROP_outR <= std_logic_vector(texX sll 1); -- Multiply by 2 by shifting left by 1 to convert from 0...128 coords to 0...256 colors
							ROP_outG <= std_logic_vector(texY sll 1);
							ROP_outB <= "00000000";
						when cbm_debugBilinearInterpolants => -- Bilinear interpolants output (debugging):
							ROP_outR <= interpBitsX;
							ROP_outG <= interpBitsY;
							ROP_outB <= "00000000";
						when others => -- Standard rendering (vertex color modulated with texture color)
							ROP_outR <= std_logic_vector(modulatedTexVertexColorProductR(15 downto 8) );
							ROP_outG <= std_logic_vector(modulatedTexVertexColorProductG(15 downto 8) );
							ROP_outB <= std_logic_vector(modulatedTexVertexColorProductB(15 downto 8) );
					end case;

					case alphaCombinerMode is
						when cbm_allBlack => -- All black
							ROP_outA <= (others => '0');
						when cbm_allWhite => -- All white
							ROP_outA <= (others => '1');
						when cbm_textureOnly => -- Texture only (no vert color)
							ROP_outA <= outColorRegA;
						when cbm_vertexColorOnly => -- Vert color only (no texture)
							ROP_outA <= storedVertColorRGBA(31 downto 24);
						when cbm_debugTexcoords => -- Texcoord output (debugging):
							ROP_outA <= (others => '1');
						when cbm_debugBilinearInterpolants => -- Bilinear interpolants output (debugging):
							ROP_outA <= (others => '1');
						when others => -- Standard rendering (vertex color modulated with texture color)
							ROP_outA <= std_logic_vector(modulatedTexVertexColorProductA(15 downto 8) );
					end case;

					--ROP_writeIsValid <= '1'; -- Signal the write request
					currentState <= waitingForWrite;

				when waitingForWrite =>
					if (ROP_OutFIFO_full = '0') then
						ROP_OutFIFO_wr_en <= '1';
						DBG_NewMessage <= '1';
						ROP_OutFIFO_wr_data <= std_logic_vector(PackOutputData(storedPixelX, storedPixelY, unsigned(ROP_outR), unsigned(ROP_outG), unsigned(ROP_outB), unsigned(ROP_outA) ) );
						DBG_Message <= std_logic_vector(storedPixelX);
						DBG_MessageData <= std_logic_vector(storedPixelY);
						currentState <= waitingForRead;
					else
						ROP_OutFIFO_wr_en <= '0';
						DBG_NewMessage <= '0';
					end if;

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
						loadTexCacheLine <= std_logic_vector(unsigned(MEM_TexSampReadResponsesFIFO_rd_data) srl GetFormatTexelSizeBits(TexFormat) );

						texCacheWriteEnable <= (others => '1');
						texCacheEnable <= '1';
						texCacheAddress <= STD_LOGIC_VECTOR(unsigned(texCacheAddress) );
						texCacheWriteData <= std_logic_vector(UnpackCacheBytesForFormat(TexFormat, unsigned(MEM_TexSampReadResponsesFIFO_rd_data(31 downto 0) ) ) );
						cacheLineReadIters <= GetFormatTexelsPerDRAMLine(TexFormat);

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

				when loadNullTextureState =>
					currentState <= waitingForRead; -- Just go back to the waiting for read state
			end case;
		end if;
	end process;

end Behavioral;
