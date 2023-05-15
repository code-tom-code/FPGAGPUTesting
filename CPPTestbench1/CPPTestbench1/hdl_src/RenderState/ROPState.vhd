
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.PacketType.all;

package ROPState is

	type sAlphaBlendConfigBlock is record
		blendModeSrcRGB : blendModeRGB; -- 2 : 0
		blendModeSrcRGBInvert : std_logic; -- 3
		blendModeDestRGB : blendModeRGB; -- 6 : 4
		blendModeDestRGBInvert : std_logic; -- 7
		blendOpRGB : blendOp; -- 10 : 8
		blendModeSrcA : blendModeA; -- 12 : 11
		blendModeSrcAInvert : std_logic; -- 13
		blendModeDestA : blendModeA; -- 15 : 14
		blendModeDestAInvert : std_logic; -- 16
		blendOpA : blendOp; -- 19 : 17
		needsLoadSrcColor : std_logic; -- 20
		needsLoadDestColor : std_logic; -- 21
	end record sAlphaBlendConfigBlock;

	type sROPState is record -- Currently 101 bits in total
		RenderTargetBaseAddress : unsigned(29 downto 0); -- 29 : 0
		ColorWriteMask : unsigned(3 downto 0); -- 33 : 30
		AlphaTestEnabled : std_logic; -- 34
		AlphaTestRefValue : unsigned(7 downto 0); -- 42 : 35;
		AlphaTestCompareFunc : eCmpFunc; -- 45 : 43
		AlphaBlendEnable : std_logic; -- 46
		BlendFactorRGBA : unsigned(31 downto 0); -- 78 : 47
		AlphaBlendConfigBlock : sAlphaBlendConfigBlock; -- 100 : 79
	end record sROPState;

	constant ALPHA_BLEND_CONFIG_SIZE_BITS : positive := 22;
	constant ROP_STATE_SIZE_BITS : positive := 101;

	constant DEFAULT_ALPHA_BLEND_CONFIG_BLOCK : sAlphaBlendConfigBlock := (blendModeSrcRGB => blendRGB_0, -- D3DRS_SRCBLEND defaults to D3DBLEND_ONE
		blendModeSrcRGBInvert => '1',
		blendModeDestRGB => blendRGB_0, -- D3DRS_DESTBLEND defaults to D3DBLEND_ZERO
		blendModeDestRGBInvert => '0',
		blendOpRGB => bop_add, -- D3DRS_BLENDOP defaults to D3DBLENDOP_ADD
		blendModeSrcA => blendA_0, -- D3DRS_SRCBLENDALPHA defaults to D3DBLEND_ONE
		blendModeSrcAInvert => '1',
		blendModeDestA => blendA_0, -- D3DRS_DESTBLENDALPHA defaults to D3DBLEND_ZERO
		blendModeDestAInvert => '0',
		blendOpA => bop_add, -- D3DRS_BLENDOPALPHA defaults to D3DBLENDOP_ADD
		needsLoadSrcColor => '1',
		needsLoadDestColor => '0');

	constant DEFAULT_ROP_STATE : sROPState := (RenderTargetBaseAddress => (others => '0'),
		ColorWriteMask => (others => '1'),
		AlphaTestEnabled => '0',
		AlphaTestRefValue => (others => '0'),
		AlphaTestCompareFunc => cmp_always,
		AlphaBlendEnable => '0', -- D3DRS_ALPHABLENDENABLE defaults to FALSE
		BlendFactorRGBA => (others => '1'),
		AlphaBlendConfigBlock => DEFAULT_ALPHA_BLEND_CONFIG_BLOCK);


	pure function SerializeStructToBits(alphaBlendConfig : sAlphaBlendConfigBlock) return std_logic_vector;
	pure function SerializeStructToBits(stateStruct : sROPState) return std_logic_vector;
	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(ALPHA_BLEND_CONFIG_SIZE_BITS-1 downto 0) ) return sAlphaBlendConfigBlock;
	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(ROP_STATE_SIZE_BITS-1 downto 0) ) return sROPState;
	
end package ROPState;

package body ROPState is

	pure function SerializeStructToBits(alphaBlendConfig : sAlphaBlendConfigBlock) return std_logic_vector is
	begin
		return alphaBlendConfig.needsLoadDestColor
			& alphaBlendConfig.needsLoadSrcColor
			& std_logic_vector(to_unsigned(blendOp'pos(alphaBlendConfig.blendOpA), 3) )
			& alphaBlendConfig.blendModeDestAInvert
			& std_logic_vector(to_unsigned(blendModeA'pos(alphaBlendConfig.blendModeDestA), 2) )
			& alphaBlendConfig.blendModeSrcAInvert
			& std_logic_vector(to_unsigned(blendModeA'pos(alphaBlendConfig.blendModeSrcA), 2) )
			& std_logic_vector(to_unsigned(blendOp'pos(alphaBlendConfig.blendOpRGB), 3) )
			& alphaBlendConfig.blendModeDestRGBInvert
			& std_logic_vector(to_unsigned(blendModeRGB'pos(alphaBlendConfig.blendModeDestRGB), 3) )
			& alphaBlendConfig.blendModeSrcRGBInvert
			& std_logic_vector(to_unsigned(blendModeRGB'pos(alphaBlendConfig.blendModeSrcRGB), 3) );
	end function;

	pure function SerializeStructToBits(stateStruct : sROPState) return std_logic_vector is
	begin
		return SerializeStructToBits(stateStruct.AlphaBlendConfigBlock)
			& std_logic_vector(stateStruct.BlendFactorRGBA)
			& stateStruct.AlphaBlendEnable
			& std_logic_vector(to_unsigned(eCmpFunc'pos(stateStruct.AlphaTestCompareFunc), 3) )
			& std_logic_vector(stateStruct.AlphaTestRefValue)
			& stateStruct.AlphaTestEnabled
			& std_logic_vector(stateStruct.ColorWriteMask)
			& std_logic_vector(stateStruct.RenderTargetBaseAddress);
	end function;

	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(ALPHA_BLEND_CONFIG_SIZE_BITS-1 downto 0) ) return sAlphaBlendConfigBlock is
		variable retStruct : sAlphaBlendConfigBlock;
	begin
		retStruct.blendModeSrcRGB := blendModeRGB'val(to_integer(unsigned(stateStructBits(2 downto 0) ) ) );
		retStruct.blendModeSrcRGBInvert := stateStructBits(3);
		retStruct.blendModeDestRGB := blendModeRGB'val(to_integer(unsigned(stateStructBits(6 downto 4) ) ) );
		retStruct.blendModeDestRGBInvert := stateStructBits(7);
		retStruct.blendOpRGB := blendOp'val(to_integer(unsigned(stateStructBits(10 downto 8) ) ) );
		retStruct.blendModeSrcA := blendModeA'val(to_integer(unsigned(stateStructBits(12 downto 11) ) ) );
		retStruct.blendModeSrcAInvert := stateStructBits(13);
		retStruct.blendModeDestA := blendModeA'val(to_integer(unsigned(stateStructBits(15 downto 14) ) ) );
		retStruct.blendModeDestAInvert := stateStructBits(16);
		retStruct.blendOpA := blendOp'val(to_integer(unsigned(stateStructBits(19 downto 17) ) ) );
		retStruct.needsLoadSrcColor := stateStructBits(20);
		retStruct.needsLoadDestColor := stateStructBits(21);
		
		return retStruct;
	end function;

	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(ROP_STATE_SIZE_BITS-1 downto 0) ) return sROPState is
		variable retStruct : sROPState;
	begin
		retStruct.RenderTargetBaseAddress := unsigned(stateStructBits(29 downto 0) );
		retStruct.ColorWriteMask := unsigned(stateStructBits(33 downto 30) );
		retStruct.AlphaTestEnabled := stateStructBits(34);
		retStruct.AlphaTestRefValue := unsigned(stateStructBits(42 downto 35) );
		retStruct.AlphaTestCompareFunc := eCmpFunc'val(to_integer(unsigned(stateStructBits(45 downto 43) ) ) );
		retStruct.AlphaBlendEnable := stateStructBits(46);
		retStruct.BlendFactorRGBA := unsigned(stateStructBits(78 downto 47) );
		retStruct.AlphaBlendConfigBlock := DeserializeBitsToStruct(stateStructBits(100 downto 79) );

		return retStruct;
	end function;

end package body ROPState;
