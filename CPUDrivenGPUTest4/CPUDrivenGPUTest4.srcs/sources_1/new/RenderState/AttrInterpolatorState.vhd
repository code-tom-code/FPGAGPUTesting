
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.PacketType.all;

package AttrInterpolatorState is

	type sAttrInterpolatorState is record -- Currently 7 bits in total
		UseFlatShadingColors : std_logic; -- 0 : 0
		Texcoord0AddressingModeU : eTexcoordAddressingMode; -- 3 : 1
		Texcoord0AddressingModeV : eTexcoordAddressingMode; -- 6 : 4
	end record sAttrInterpolatorState;

	constant ATTR_INTERPOLATOR_STATE_SIZE_BITS : positive := 7;

	constant DEFAULT_ATTR_INTERPOLATOR_STATE : sAttrInterpolatorState := (UseFlatShadingColors => '0', -- Default to Gouraud shading (not flat shading) for Color0 interpolation
		Texcoord0AddressingModeU => TAM_Wrap, -- Default to wrap mode.
		Texcoord0AddressingModeV => TAM_Wrap); -- Default to wrap mode.

	pure function SerializeStructToBits(stateStruct : sAttrInterpolatorState) return std_logic_vector;
	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(ATTR_INTERPOLATOR_STATE_SIZE_BITS-1 downto 0) ) return sAttrInterpolatorState;
	pure function MakeStructFromMembers(argUseFlatShadingColors : std_logic; argTex0AddressingU : eTexcoordAddressingMode; argTex0AddressingV : eTexcoordAddressingMode) return sAttrInterpolatorState;
	
end package AttrInterpolatorState;

package body AttrInterpolatorState is

	pure function SerializeStructToBits(stateStruct : sAttrInterpolatorState) return std_logic_vector is
	begin
		return std_logic_vector(to_unsigned(eTexcoordAddressingMode'pos(stateStruct.Texcoord0AddressingModeV), 3) )
			& std_logic_vector(to_unsigned(eTexcoordAddressingMode'pos(stateStruct.Texcoord0AddressingModeU), 3) )
			& stateStruct.UseFlatShadingColors;
	end function;

	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(ATTR_INTERPOLATOR_STATE_SIZE_BITS-1 downto 0) ) return sAttrInterpolatorState is
		variable retStruct : sAttrInterpolatorState;
	begin
		retStruct.UseFlatShadingColors := stateStructBits(0);
		retStruct.Texcoord0AddressingModeU := eTexcoordAddressingMode'val(to_integer(unsigned(stateStructBits(3 downto 1) ) ) );
		retStruct.Texcoord0AddressingModeV := eTexcoordAddressingMode'val(to_integer(unsigned(stateStructBits(6 downto 4) ) ) );

		return retStruct;
	end function;

	pure function MakeStructFromMembers(argUseFlatShadingColors : std_logic; argTex0AddressingU : eTexcoordAddressingMode; argTex0AddressingV : eTexcoordAddressingMode) return sAttrInterpolatorState is
		variable retStruct : sAttrInterpolatorState;
	begin
		retStruct.UseFlatShadingColors := argUseFlatShadingColors;
		retStruct.Texcoord0AddressingModeU := argTex0AddressingU;
		retStruct.Texcoord0AddressingModeV := argTex0AddressingV;

		return retStruct;
	end function;

end package body AttrInterpolatorState;
