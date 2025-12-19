
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.PacketType.all;

package TexSampleState is

	type sTexSamplerState is record -- Currently 74 bits in total
		TextureBaseAddr : unsigned(29 downto 0); -- 29 : 0 -- This could probably be a lot smaller due to minimum texture alignment but whatever
		TextureFormat : eTexFormat; -- 32 : 30
		TextureWidthLog2 : unsigned(2 downto 0); -- 35 : 33
		TextureHeightLog2 : unsigned(2 downto 0); -- 38 : 36
		TotalTexelCount : unsigned(15 downto 0); -- 54 : 39
		UseBilinearFiltering : std_logic; -- 55
		ColorCombinerMode : eCombinerMode; -- 58 : 56
		AlphaCombinerMode : eCombinerMode; -- 61 : 59
		ChannelSwizzleR : texChannelMUX; -- 64 : 62
		ChannelSwizzleG : texChannelMUX; -- 67 : 65
		ChannelSwizzleB : texChannelMUX; -- 70 : 68
		ChannelSwizzleA : texChannelMUX; -- 73 : 71
	end record sTexSamplerState;

	constant TEX_SAMPLER_STATE_SIZE_BITS : positive := 74;

	constant DEFAULT_TEX_SAMPLER_STATE : sTexSamplerState := (TextureBaseAddr => (others => '0'), 
		TextureFormat => eTexFmtA8R8G8B8,
		TextureWidthLog2 => "110", -- 64x64
		TextureHeightLog2 => "110", -- 64x64
		TotalTexelCount => (others => '0'),
		UseBilinearFiltering => '1',
		ColorCombinerMode => cbm_textureModulateVertexColor,
		AlphaCombinerMode => cbm_textureModulateVertexColor,
		ChannelSwizzleR => TCM_B, -- Swizzle BGRA to RGBA
		ChannelSwizzleG => TCM_G,
		ChannelSwizzleB => TCM_R,
		ChannelSwizzleA => TCM_A);

	pure function SerializeStructToBits(stateStruct : sTexSamplerState) return std_logic_vector;
	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(TEX_SAMPLER_STATE_SIZE_BITS-1 downto 0) ) return sTexSamplerState;
	
end package TexSampleState;

package body TexSampleState is

	pure function SerializeStructToBits(stateStruct : sTexSamplerState) return std_logic_vector is
	begin
		return std_logic_vector(to_unsigned(texChannelMUX'pos(stateStruct.ChannelSwizzleA), 3) )
			& std_logic_vector(to_unsigned(texChannelMUX'pos(stateStruct.ChannelSwizzleB), 3) )
			& std_logic_vector(to_unsigned(texChannelMUX'pos(stateStruct.ChannelSwizzleG), 3) )
			& std_logic_vector(to_unsigned(texChannelMUX'pos(stateStruct.ChannelSwizzleR), 3) )
			& std_logic_vector(to_unsigned(eCombinerMode'pos(stateStruct.AlphaCombinerMode), 3) )
			& std_logic_vector(to_unsigned(eCombinerMode'pos(stateStruct.ColorCombinerMode), 3) )
			& stateStruct.UseBilinearFiltering
			& std_logic_vector(stateStruct.TotalTexelCount)
			& std_logic_vector(stateStruct.TextureHeightLog2)
			& std_logic_vector(stateStruct.TextureWidthLog2)
			& std_logic_vector(to_unsigned(eTexFormat'pos(stateStruct.TextureFormat), 3) )
			& std_logic_vector(stateStruct.TextureBaseAddr);
	end function;

	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(TEX_SAMPLER_STATE_SIZE_BITS-1 downto 0) ) return sTexSamplerState is
		variable retStruct : sTexSamplerState;
	begin
		retStruct.TextureBaseAddr := unsigned(stateStructBits(29 downto 0) );
		retStruct.TextureFormat := eTexFormat'val(to_integer(unsigned(stateStructBits(32 downto 30) ) ) );
		retStruct.TextureWidthLog2 := unsigned(stateStructBits(35 downto 33) );
		retStruct.TextureHeightLog2 := unsigned(stateStructBits(38 downto 36) );
		retStruct.TotalTexelCount := unsigned(stateStructBits(54 downto 39) );
		retStruct.UseBilinearFiltering := stateStructBits(55);
		retStruct.ColorCombinerMode := eCombinerMode'val(to_integer(unsigned(stateStructBits(58 downto 56) ) ) );
		retStruct.AlphaCombinerMode := eCombinerMode'val(to_integer(unsigned(stateStructBits(61 downto 59) ) ) );
		retStruct.ChannelSwizzleR := texChannelMUX'val(to_integer(unsigned(stateStructBits(64 downto 62) ) ) );
		retStruct.ChannelSwizzleG := texChannelMUX'val(to_integer(unsigned(stateStructBits(67 downto 65) ) ) );
		retStruct.ChannelSwizzleB := texChannelMUX'val(to_integer(unsigned(stateStructBits(70 downto 68) ) ) );
		retStruct.ChannelSwizzleA := texChannelMUX'val(to_integer(unsigned(stateStructBits(73 downto 71) ) ) );

		return retStruct;
	end function;

end package body TexSampleState;
