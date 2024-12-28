
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.PacketType.all;
use work.FloatALU_Types.all;

package DepthInterpolatorState is

	type sDepthInterpolatorState is record -- Currently 40 bits in total
		DepthTestEnable : std_logic; -- 0 : 0
		DepthWriteEnable : std_logic; -- 1 : 1
		DepthCompareFunction : eCmpFunc; -- 4 : 2
		DepthBias : f32; -- 36 : 5
		ColorWritesEnabled : std_logic; -- 37 : 37
		DepthFormat : eDepthFormat; -- 39 : 38
	end record sDepthInterpolatorState;

	constant DEPTH_INTERPOLATOR_STATE_SIZE_BITS : positive := 40;

	constant DEFAULT_DEPTH_INTERPOLATOR_STATE : sDepthInterpolatorState := (DepthTestEnable => '1', -- D3DRS_ZENABLE defaults to D3DZB_TRUE
		DepthWriteEnable => '1', -- D3DRS_ZWRITEENABLE defaults to TRUE
		DepthCompareFunction => cmp_lessequal, -- D3DRS_ZFUNC defaults to D3DCMP_LESSEQUAL
		DepthBias => X"00000000", -- Default depth bias is 0.0f
		ColorWritesEnabled => '1', -- By default we write both color and depth
		DepthFormat => eDepthFmtD24); -- Default depth buffer format is D24S8

	pure function SerializeStructToBits(stateStruct : sDepthInterpolatorState) return std_logic_vector;
	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(DEPTH_INTERPOLATOR_STATE_SIZE_BITS-1 downto 0) ) return sDepthInterpolatorState;
	pure function MakeStructFromMembers(argDepthTestEnable : std_logic; argDepthWriteEnable : std_logic; argDepthCompareFunction : eCmpFunc; argDepthBias : f32; 
		argColorWritesEnabled : std_logic; argDepthFormat : eDepthFormat) return sDepthInterpolatorState;
	
end package DepthInterpolatorState;

package body DepthInterpolatorState is

	pure function SerializeStructToBits(stateStruct : sDepthInterpolatorState) return std_logic_vector is
	begin
		return std_logic_vector(to_unsigned(eDepthFormat'pos(stateStruct.DepthFormat), 2) )
			& stateStruct.ColorWritesEnabled
			& std_logic_vector(stateStruct.DepthBias) 
			& std_logic_vector(to_unsigned(eCmpFunc'pos(stateStruct.DepthCompareFunction), 3) )
			& stateStruct.DepthWriteEnable
			& stateStruct.DepthTestEnable;
	end function;

	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(DEPTH_INTERPOLATOR_STATE_SIZE_BITS-1 downto 0) ) return sDepthInterpolatorState is
		variable retStruct : sDepthInterpolatorState;
	begin
		retStruct.DepthTestEnable := stateStructBits(0);
		retStruct.DepthWriteEnable := stateStructBits(1);
		retStruct.DepthCompareFunction := eCmpFunc'val(to_integer(unsigned(stateStructBits(4 downto 2) ) ) );
		retStruct.DepthBias := f32(stateStructBits(36 downto 5) );
		retStruct.ColorWritesEnabled := stateStructBits(37);
		retStruct.DepthFormat := eDepthFormat'val(to_integer(unsigned(stateStructBits(39 downto 38) ) ) );

		return retStruct;
	end function;

	pure function MakeStructFromMembers(argDepthTestEnable : std_logic; argDepthWriteEnable : std_logic; argDepthCompareFunction : eCmpFunc; argDepthBias : f32; 
		argColorWritesEnabled : std_logic; argDepthFormat : eDepthFormat) return sDepthInterpolatorState is
		variable retStruct : sDepthInterpolatorState;
	begin
		retStruct.DepthTestEnable := argDepthTestEnable;
		retStruct.DepthWriteEnable := argDepthWriteEnable;
		retStruct.DepthCompareFunction := argDepthCompareFunction;
		retStruct.DepthBias := argDepthBias;
		retStruct.ColorWritesEnabled := argColorWritesEnabled;
		retStruct.DepthFormat := argDepthFormat;

		return retStruct;
	end function;

end package body DepthInterpolatorState;
