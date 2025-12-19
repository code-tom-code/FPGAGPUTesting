
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.PacketType.all;
use work.FloatALU_Types.all;

package DepthInterpolatorState is

	type sDepthInterpolatorState is record -- Currently 77 bits in total
		DepthTestEnable : std_logic; -- 0 : 0
		DepthWriteEnable : std_logic; -- 1 : 1
		DepthCompareFunction : eCmpFunc; -- 4 : 2
		DepthBias : f32; -- 36 : 5
		ColorWritesEnabled : std_logic; -- 37 : 37
		DepthFormat : eDepthFormat; -- 39 : 38
		StencilWriteEnable : std_logic; -- 40 : 40
		StencilRefVal : unsigned(7 downto 0); -- 48 : 41
		StencilReadMask : unsigned(7 downto 0); -- 56 : 49
		StencilWriteMask : unsigned(7 downto 0); -- 64 : 57
		StencilCmpFunc : eCmpFunc; -- 67 : 65
		StencilFailOp : eStencilOp; -- 70 : 68
		StencilZFailOp : eStencilOp; -- 73 : 71
		StencilPassOp : eStencilOp; -- 76 : 74
	end record sDepthInterpolatorState;

	constant DEPTH_INTERPOLATOR_STATE_SIZE_BITS : positive := 77;

	constant DEFAULT_DEPTH_INTERPOLATOR_STATE : sDepthInterpolatorState := (DepthTestEnable => '1', -- D3DRS_ZENABLE defaults to D3DZB_TRUE
		DepthWriteEnable => '1', -- D3DRS_ZWRITEENABLE defaults to TRUE
		DepthCompareFunction => cmp_lessequal, -- D3DRS_ZFUNC defaults to D3DCMP_LESSEQUAL
		DepthBias => X"00000000", -- Default depth bias is 0.0f
		ColorWritesEnabled => '1', -- By default we write both color and depth
		DepthFormat => eDepthFmtD24, -- Default depth buffer format is D24S8
		StencilWriteEnable => '0', -- D3DRS_STENCILENABLE defaults to FALSE
		StencilRefVal => X"00", -- D3DRS_STENCILREF defaults to 0x00
		StencilReadMask => X"FF", -- D3DRS_STENCILMASK defaults to 0xFF
		StencilWriteMask => X"FF", -- D3DRS_STENCILWRITEMASK defaults to 0xFF
		StencilCmpFunc => cmp_always, -- D3DRS_STENCILFUNC defaults to D3DCMP_ALWAYS
		StencilFailOp => sop_keep, -- D3DRS_STENCILFAIL defaults to D3DSTENCILOP_KEEP
		StencilZFailOp => sop_keep, -- D3DRS_STENCILZFAIL defaults to D3DSTENCILOP_KEEP
		StencilPassOp => sop_keep);  -- D3DRS_STENCILPASS defaults to D3DSTENCILOP_KEEP

	pure function SerializeStructToBits(stateStruct : sDepthInterpolatorState) return std_logic_vector;
	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(DEPTH_INTERPOLATOR_STATE_SIZE_BITS-1 downto 0) ) return sDepthInterpolatorState;
	pure function MakeStructFromMembers(argDepthTestEnable : std_logic; argDepthWriteEnable : std_logic; argDepthCompareFunction : eCmpFunc; argDepthBias : f32; 
		argColorWritesEnabled : std_logic; argDepthFormat : eDepthFormat;
		argStencilWriteEnable : std_logic; argStencilRefVal : unsigned(7 downto 0); argStencilReadMask : unsigned(7 downto 0); argStencilWriteMask : unsigned(7 downto 0);
		argStencilCmpFunc : eCmpFunc; argStencilFailOp : eStencilOp; argStencilZFailOp : eStencilOp; argStencilPassOp : eStencilOp) return sDepthInterpolatorState;
	
end package DepthInterpolatorState;

package body DepthInterpolatorState is

	pure function SerializeStructToBits(stateStruct : sDepthInterpolatorState) return std_logic_vector is
	begin
		return 
			std_logic_vector(to_unsigned(eStencilOp'pos(stateStruct.StencilPassOp), 3) )
			& std_logic_vector(to_unsigned(eStencilOp'pos(stateStruct.StencilZFailOp), 3) )
			& std_logic_vector(to_unsigned(eStencilOp'pos(stateStruct.StencilFailOp), 3) )
			& std_logic_vector(to_unsigned(eCmpFunc'pos(stateStruct.StencilCmpFunc), 3) )
			& std_logic_vector(stateStruct.StencilWriteMask)
			& std_logic_vector(stateStruct.StencilReadMask)
			& std_logic_vector(stateStruct.StencilRefVal)
			& stateStruct.StencilWriteEnable
			& std_logic_vector(to_unsigned(eDepthFormat'pos(stateStruct.DepthFormat), 2) )
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
		retStruct.StencilWriteEnable := stateStructBits(40);
		retStruct.StencilRefVal := unsigned(stateStructBits(48 downto 41) );
		retStruct.StencilReadMask := unsigned(stateStructBits(56 downto 49) );
		retStruct.StencilWriteMask := unsigned(stateStructBits(64 downto 57) );
		retStruct.StencilCmpFunc := eCmpFunc'val(to_integer(unsigned(stateStructBits(67 downto 65) ) ) );
		retStruct.StencilFailOp := eStencilOp'val(to_integer(unsigned(stateStructBits(70 downto 68) ) ) );
		retStruct.StencilZFailOp := eStencilOp'val(to_integer(unsigned(stateStructBits(73 downto 71) ) ) );
		retStruct.StencilPassOp := eStencilOp'val(to_integer(unsigned(stateStructBits(76 downto 74) ) ) );

		return retStruct;
	end function;

	pure function MakeStructFromMembers(argDepthTestEnable : std_logic; argDepthWriteEnable : std_logic; argDepthCompareFunction : eCmpFunc; argDepthBias : f32; 
		argColorWritesEnabled : std_logic; argDepthFormat : eDepthFormat;
		argStencilWriteEnable : std_logic; argStencilRefVal : unsigned(7 downto 0); argStencilReadMask : unsigned(7 downto 0); argStencilWriteMask : unsigned(7 downto 0);
		argStencilCmpFunc : eCmpFunc; argStencilFailOp : eStencilOp; argStencilZFailOp : eStencilOp; argStencilPassOp : eStencilOp) return sDepthInterpolatorState is
		variable retStruct : sDepthInterpolatorState;
	begin
		retStruct.DepthTestEnable := argDepthTestEnable;
		retStruct.DepthWriteEnable := argDepthWriteEnable;
		retStruct.DepthCompareFunction := argDepthCompareFunction;
		retStruct.DepthBias := argDepthBias;
		retStruct.ColorWritesEnabled := argColorWritesEnabled;
		retStruct.DepthFormat := argDepthFormat;
		retStruct.StencilWriteEnable := argStencilWriteEnable;
		retStruct.StencilRefVal := argStencilRefVal;
		retStruct.StencilReadMask := argStencilReadMask;
		retStruct.StencilWriteMask := argStencilWriteMask;
		retStruct.StencilCmpFunc := argStencilCmpFunc;
		retStruct.StencilFailOp := argStencilFailOp;
		retStruct.StencilZFailOp := argStencilZFailOp;
		retStruct.StencilPassOp := argStencilPassOp;

		return retStruct;
	end function;

end package body DepthInterpolatorState;
