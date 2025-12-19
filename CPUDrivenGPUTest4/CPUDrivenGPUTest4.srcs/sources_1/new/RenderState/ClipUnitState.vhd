
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;

package ClipUnitState is

	type sClipUnitState is record -- Currently 10 bits in total
		DepthClipEnable : std_logic; -- 0 : 0
		UseOpenGLZNearClip : std_logic; -- 1 : 1
		GuardBandXScale : unsigned(3 downto 0); -- 5 : 2
		GuardBandYScale : unsigned(3 downto 0); -- 9 : 6
		ClippingEnable : std_logic; -- 10
	end record sClipUnitState;

	constant CLIP_UNIT_STATE_SIZE_BITS : positive := 11;

	constant DEFAULT_CLIP_UNIT_STATE : sClipUnitState := (DepthClipEnable => '1', -- Default to Depth Clip on (don't skip Z-clips)
		UseOpenGLZNearClip => '0', -- Default to D3D mode (half CVV cube) near-clipping mode
		GuardBandXScale => to_unsigned(4, 4), -- Default to 2^4=16x on the guard band X scale for 640x480
		GuardBandYScale => to_unsigned(5, 4), -- Default to 2^5=32x on the guard band Y scale for 640x480
		ClippingEnable => '1'); -- Default to clipping enabled

	pure function SerializeStructToBits(stateStruct : sClipUnitState) return std_logic_vector;
	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(CLIP_UNIT_STATE_SIZE_BITS-1 downto 0) ) return sClipUnitState;
	pure function MakeStructFromMembers(argDepthClipEnable : std_logic; argUseOpenGLZNearClip : std_logic; 
		argGuardBandXScale : unsigned(3 downto 0); argGuardBandYScale : unsigned(3 downto 0); argClippingEnable : std_logic) return sClipUnitState;
	
end package ClipUnitState;

package body ClipUnitState is

	pure function SerializeStructToBits(stateStruct : sClipUnitState) return std_logic_vector is
	begin
		return stateStruct.ClippingEnable
			& std_logic_vector(stateStruct.GuardBandYScale)
			& std_logic_vector(stateStruct.GuardBandXScale)
			& stateStruct.UseOpenGLZNearClip
			& stateStruct.DepthClipEnable;
	end function;

	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(CLIP_UNIT_STATE_SIZE_BITS-1 downto 0) ) return sClipUnitState is
		variable retStruct : sClipUnitState;
	begin
		retStruct.DepthClipEnable := stateStructBits(0);
		retStruct.UseOpenGLZNearClip := stateStructBits(1);
		retStruct.GuardBandXScale := unsigned(stateStructBits(5 downto 2) );
		retStruct.GuardBandYScale := unsigned(stateStructBits(9 downto 6) );
		retStruct.ClippingEnable := stateStructBits(10);

		return retStruct;
	end function;

	pure function MakeStructFromMembers(argDepthClipEnable : std_logic; argUseOpenGLZNearClip : std_logic; 
		argGuardBandXScale : unsigned(3 downto 0); argGuardBandYScale : unsigned(3 downto 0); argClippingEnable : std_logic) return sClipUnitState is
		variable retStruct : sClipUnitState;
	begin
		retStruct.DepthClipEnable := argDepthClipEnable;
		retStruct.UseOpenGLZNearClip := argUseOpenGLZNearClip;
		retStruct.GuardBandXScale := argGuardBandXScale;
		retStruct.GuardBandYScale := argGuardBandYScale;
		retStruct.ClippingEnable := argClippingEnable;

		return retStruct;
	end function;

end package body ClipUnitState;
