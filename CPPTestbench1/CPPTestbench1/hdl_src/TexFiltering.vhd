-- This TexFiltering unit computes the bilinear blend between TL, TR, BL, and BR colors returned from the texture cache, and it also combines that with the diffuse vertex color before passing that combined color to the ROP unit's FIFO.

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

entity TexFiltering is
	Port ( clk : in STD_LOGIC;

	-- ROP FIFO interface begin
		ROP_OutFIFO_wr_data : out STD_LOGIC_VECTOR(63 downto 0) := (others => '0'); -- 8 bytes per pixel of output data to the ROP unit
        ROP_OutFIFO_full : in STD_LOGIC;
        ROP_OutFIFO_wr_en : out STD_LOGIC := '0';
	-- ROP FIFO interface end

	-- Attribute interpolator output FIFO interface begin
		TEX_PixelCoordX : in STD_LOGIC_VECTOR(15 downto 0);
		TEX_PixelCoordY : in STD_LOGIC_VECTOR(15 downto 0);
		TEX_DiffuseColorRGBA : in STD_LOGIC_VECTOR(31 downto 0);
	-- Attribute interpolator output FIFO interface end

	-- Texture cache interface begin
		TEXCACHE_TL_RGBA : in STD_LOGIC_VECTOR(31 downto 0);
		TEXCACHE_TR_RGBA : in STD_LOGIC_VECTOR(31 downto 0);
		TEXCACHE_BL_RGBA : in STD_LOGIC_VECTOR(31 downto 0);
		TEXCACHE_BR_RGBA : in STD_LOGIC_VECTOR(31 downto 0);
		TEXCACHE_Ready : in STD_LOGIC;
	-- Texture cache interface end

		TEXADDR_InterpFracX : in STD_LOGIC_VECTOR(7 downto 0);
		TEXADDR_InterpFracY : in STD_LOGIC_VECTOR(7 downto 0)
		);
end TexFiltering;

architecture Behavioral of TexFiltering is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333000000";

ATTRIBUTE X_INTERFACE_INFO of ROP_OutFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of ROP_OutFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of ROP_OutFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO FULL";

constant PIPELINE_CYCLES : natural := 11;

COMPONENT RGBA_Interpolator
	Port (clk : in STD_LOGIC;

		IN_RGBA_Color0 : in STD_LOGIC_VECTOR(31 downto 0);
		IN_RGBA_Color1 : in STD_LOGIC_VECTOR(31 downto 0);
		IN_InterpFrac : in STD_LOGIC_VECTOR(7 downto 0);

		-- This RGBA INTERP pipe operates in 4 clock cycles.
		OINTERP : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
		);
end component;

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

pure function PackOutputData(pixelX : unsigned(15 downto 0); pixelY : unsigned(15 downto 0); pixelR : unsigned(7 downto 0); pixelG : unsigned(7 downto 0); pixelB : unsigned(7 downto 0); pixelA : unsigned(7 downto 0) ) return unsigned is
begin
	return pixelA & pixelB & pixelG & pixelR & pixelY & pixelX;
end function;

signal LerpedT_RGBA : STD_LOGIC_VECTOR(31 downto 0);
signal LerpedB_RGBA : STD_LOGIC_VECTOR(31 downto 0);
signal LerpedY_RGBA : STD_LOGIC_VECTOR(31 downto 0);
signal SwizzledColor_R : unsigned(7 downto 0);
signal SwizzledColor_G : unsigned(7 downto 0);
signal SwizzledColor_B : unsigned(7 downto 0);
signal SwizzledColor_A : unsigned(7 downto 0);
signal TextureColor_R : unsigned(7 downto 0);
signal TextureColor_G : unsigned(7 downto 0);
signal TextureColor_B : unsigned(7 downto 0);
signal TextureColor_A : unsigned(7 downto 0);
signal VertexColor_R : unsigned(7 downto 0);
signal VertexColor_G : unsigned(7 downto 0);
signal VertexColor_B : unsigned(7 downto 0);
signal VertexColor_A : unsigned(7 downto 0);
signal ModulatedVertexTextureColor_R : unsigned(15 downto 0);
signal ModulatedVertexTextureColor_G : unsigned(15 downto 0);
signal ModulatedVertexTextureColor_B : unsigned(15 downto 0);
signal ModulatedVertexTextureColor_A : unsigned(15 downto 0);

-- Pipelined signals:
type PixelCoordPipeline_t is array(PIPELINE_CYCLES-1 downto 0) of signed(15 downto 0);
type DiffuseColorPipeline_t is array(PIPELINE_CYCLES-1 downto 0) of unsigned(31 downto 0);
signal ReadySignals : std_logic_vector(PIPELINE_CYCLES-1 downto 0) := (others => '0');
signal InterpFracY0 : unsigned(7 downto 0) := (others => '0');
signal InterpFracY1 : unsigned(7 downto 0) := (others => '0');
signal InterpFracY2 : unsigned(7 downto 0) := (others => '0');
signal InterpFracY3 : unsigned(7 downto 0) := (others => '0');
signal PixelCoordXPipeline : PixelCoordPipeline_t;
signal PixelCoordYPipeline : PixelCoordPipeline_t;
signal DiffuseColorPipeline : DiffuseColorPipeline_t;

-- Current texture unit state:
signal outputMUXR : texChannelMUX := TCM_B;
signal outputMUXG : texChannelMUX := TCM_G;
signal outputMUXB : texChannelMUX := TCM_R;
signal outputMUXA : texChannelMUX := TCM_A;
signal colorCombinerMode : eCombinerMode := cbm_textureModulateVertexColor;
signal alphaCombinerMode : eCombinerMode := cbm_textureModulateVertexColor;

begin

-- Set up our bilinear texture interpolators (Top row horizontal, Bottom row horizontal, and then the final vertical combine runs after those):
InterpolatorT : RGBA_Interpolator port map(clk => clk, IN_RGBA_Color0 => TEXCACHE_TL_RGBA, IN_RGBA_Color1 => TEXCACHE_TR_RGBA, IN_InterpFrac => TEXADDR_InterpFracX, OINTERP => LerpedT_RGBA);
InterpolatorB : RGBA_Interpolator port map(clk => clk, IN_RGBA_Color0 => TEXCACHE_BL_RGBA, IN_RGBA_Color1 => TEXCACHE_BR_RGBA, IN_InterpFrac => TEXADDR_InterpFracX, OINTERP => LerpedB_RGBA);
InterpolatorY : RGBA_Interpolator port map(clk => clk, IN_RGBA_Color0 => LerpedT_RGBA, IN_RGBA_Color1 => LerpedB_RGBA, IN_InterpFrac => std_logic_vector(InterpFracY3), OINTERP => LerpedY_RGBA);

	readySignalsPipelineProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			ReadySignals <= ReadySignals(ReadySignals'high-1 downto 0) & TEXCACHE_Ready;
		end if;
	end process readySignalsPipelineProc;

	interpFracsPipelineProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			InterpFracY3 <= InterpFracY2;
			InterpFracY2 <= InterpFracY1;
			InterpFracY1 <= InterpFracY0;
			InterpFracY0 <= unsigned(TEXADDR_InterpFracY);
		end if;
	end process interpFracsPipelineProc;

	-- TOOD: It would be better to not pull these out of the FIFO until we need 'em!
	parametersPipelineProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			for i in 1 to PIPELINE_CYCLES loop
				PixelCoordXPipeline(i) <= PixelCoordXPipeline(i - 1);
				PixelCoordYPipeline(i) <= PixelCoordYPipeline(i - 1);
				DiffuseColorPipeline(i) <= DiffuseColorPipeline(i - 1);
			end loop;
			PixelCoordXPipeline(0) <= signed(TEX_PixelCoordX);
			PixelCoordYPipeline(0) <= signed(TEX_PixelCoordY);
			DiffuseColorPipeline(0) <= unsigned(TEX_DiffuseColorRGBA);
		end if;
	end process parametersPipelineProc;

	swizzleTexChannelsProc : process(clk)
	begin
		if (rising_edge(clk) ) then
			SwizzledColor_R <= unsigned(GetSwizzledOutput(outputMUXR, LerpedY_RGBA(7 downto 0), LerpedY_RGBA(15 downto 8), LerpedY_RGBA(23 downto 16), LerpedY_RGBA(31 downto 24) ) );
			SwizzledColor_G <= unsigned(GetSwizzledOutput(outputMUXG, LerpedY_RGBA(7 downto 0), LerpedY_RGBA(15 downto 8), LerpedY_RGBA(23 downto 16), LerpedY_RGBA(31 downto 24) ) );
			SwizzledColor_B <= unsigned(GetSwizzledOutput(outputMUXB, LerpedY_RGBA(7 downto 0), LerpedY_RGBA(15 downto 8), LerpedY_RGBA(23 downto 16), LerpedY_RGBA(31 downto 24) ) );
			SwizzledColor_A <= unsigned(GetSwizzledOutput(outputMUXA, LerpedY_RGBA(7 downto 0), LerpedY_RGBA(15 downto 8), LerpedY_RGBA(23 downto 16), LerpedY_RGBA(31 downto 24) ) );
		end if;
	end process swizzleTexChannelsProc;

	multiplyProc : process(clk)
		variable LocalDiffuseColor : unsigned(31 downto 0);
	begin
		if (rising_edge(clk) ) then
			TextureColor_R <= SwizzledColor_R;
			TextureColor_G <= SwizzledColor_G;
			TextureColor_B <= SwizzledColor_B;
			TextureColor_A <= SwizzledColor_A;
			LocalDiffuseColor := DiffuseColorPipeline(PIPELINE_CYCLES - 2);
			VertexColor_R <= LocalDiffuseColor(7 downto 0);
			VertexColor_G <= LocalDiffuseColor(15 downto 8);
			VertexColor_B <= LocalDiffuseColor(23 downto 16);
			VertexColor_A <= LocalDiffuseColor(31 downto 24);
			ModulatedVertexTextureColor_R <= SwizzledColor_R * LocalDiffuseColor(7 downto 0);
			ModulatedVertexTextureColor_G <= SwizzledColor_G * LocalDiffuseColor(15 downto 8);
			ModulatedVertexTextureColor_B <= SwizzledColor_B * LocalDiffuseColor(23 downto 16);
			ModulatedVertexTextureColor_A <= SwizzledColor_A * LocalDiffuseColor(31 downto 24);
		end if;
	end process multiplyProc;

	MUXOutputProc : process(clk)
		variable ROP_outR : STD_LOGIC_VECTOR(7 downto 0);
		variable ROP_outG : STD_LOGIC_VECTOR(7 downto 0);
		variable ROP_outB : STD_LOGIC_VECTOR(7 downto 0);
		variable ROP_outA : STD_LOGIC_VECTOR(7 downto 0);
	begin
		if (rising_edge(clk) ) then
			-- Color output:
			case colorCombinerMode is
				when cbm_allBlack => -- All black
					ROP_outR := (others => '0');
					ROP_outG := (others => '0');
					ROP_outB := (others => '0');
				when cbm_allWhite => -- All white
					ROP_outR := (others => '1');
					ROP_outG := (others => '1');
					ROP_outB := (others => '1');
				when cbm_textureOnly => -- Texture only (no vert color)
					ROP_outR := std_logic_vector(TextureColor_R);
					ROP_outG := std_logic_vector(TextureColor_G);
					ROP_outB := std_logic_vector(TextureColor_B);
				when cbm_vertexColorOnly => -- Vert color only (no texture)
					ROP_outR := std_logic_vector(VertexColor_R);
					ROP_outG := std_logic_vector(VertexColor_G);
					ROP_outB := std_logic_vector(VertexColor_B);
				--when cbm_debugTexcoords => -- Texcoord output (debugging):
					--ROP_outR := std_logic_vector(texX sll 1);
					--ROP_outG := std_logic_vector(texY sll 1);
					--ROP_outB := "00000000";
				when cbm_debugBilinearInterpolants => -- Bilinear interpolants output (debugging):
					ROP_outR := TEXADDR_InterpFracX;
					ROP_outG := TEXADDR_InterpFracY;
					ROP_outB := "00000000";
				when others => -- Standard rendering (vertex color modulated with texture color)
					ROP_outR := std_logic_vector(ModulatedVertexTextureColor_R(15 downto 8) );
					ROP_outG := std_logic_vector(ModulatedVertexTextureColor_G(15 downto 8) );
					ROP_outB := std_logic_vector(ModulatedVertexTextureColor_B(15 downto 8) );
			end case;

			case alphaCombinerMode is
				when cbm_allBlack => -- All black
					ROP_outA := (others => '0');
				when cbm_allWhite => -- All white
					ROP_outA := (others => '1');
				when cbm_textureOnly => -- Texture only (no vert color)
					ROP_outA := std_logic_vector(TextureColor_A);
				when cbm_vertexColorOnly => -- Vert color only (no texture)
					ROP_outA := std_logic_vector(VertexColor_A);
				when cbm_debugTexcoords => -- Texcoord output (debugging):
					ROP_outA := (others => '1');
				when cbm_debugBilinearInterpolants => -- Bilinear interpolants output (debugging):
					ROP_outA := (others => '1');
				when others => -- Standard rendering (vertex color modulated with texture color)
					ROP_outA := std_logic_vector(ModulatedVertexTextureColor_A(15 downto 8) );
			end case;

			ROP_OutFIFO_wr_data <= std_logic_vector(PackOutputData(unsigned(PixelCoordXPipeline(PIPELINE_CYCLES-1) ), unsigned(PixelCoordYPipeline(PIPELINE_CYCLES-1) ),
				unsigned(ROP_outR), unsigned(ROP_outG), unsigned(ROP_outB), unsigned(ROP_outA) ) );
			ROP_OutFIFO_wr_en <= ReadySignals(ReadySignals'high);
		end if;
	end process MUXOutputProc;

end Behavioral;
