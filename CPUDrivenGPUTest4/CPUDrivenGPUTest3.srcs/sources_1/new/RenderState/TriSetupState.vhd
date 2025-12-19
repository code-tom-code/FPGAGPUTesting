
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.FloatALU_Types.all;

package TriSetupState is

	type sTriSetupState is record -- Currently 192 bits in total
		ViewportHalfWidth : f32; -- 31 : 0
		ViewportHalfHeight : f32; -- 63 : 32
		ViewportZScale : f32; -- 95 : 64
		ViewportZOffset : f32; -- 127 : 96
		ScissorLeft : unsigned(15 downto 0); -- 143 : 128
		ScissorRight : unsigned(15 downto 0); -- 159 downto 144
		ScissorTop : unsigned(15 downto 0); -- 175 downto 160
		ScissorBottom : unsigned(15 downto 0); -- 191 downto 176
	end record sTriSetupState;

	constant TRI_SETUP_STATE_SIZE_BITS : positive := 192;

	constant DEFAULT_TRI_SETUP_STATE : sTriSetupState := (ViewportHalfWidth => X"43A00000", -- 320.0f
		ViewportHalfHeight => X"43700000", -- 240.0f
		ViewportZScale => X"3F800000", -- 1.0f
		ViewportZOffset => (others => '0'), -- 0.0f
		ScissorLeft => (others => '0'), -- 0
		ScissorRight => to_unsigned(640, 16), -- 640
		ScissorTop => (others => '0'), -- 0
		ScissorBottom => to_unsigned(480, 16) ); -- 480

	pure function SerializeStructToBits(stateStruct : sTriSetupState) return std_logic_vector;
	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(TRI_SETUP_STATE_SIZE_BITS-1 downto 0) ) return sTriSetupState;
	
end package TriSetupState;

package body TriSetupState is

	pure function SerializeStructToBits(stateStruct : sTriSetupState) return std_logic_vector is
	begin
		return std_logic_vector(stateStruct.ScissorBottom)
			& std_logic_vector(stateStruct.ScissorTop)
			& std_logic_vector(stateStruct.ScissorRight)
			& std_logic_vector(stateStruct.ScissorLeft)
			& std_logic_vector(stateStruct.ViewportZOffset)
			& std_logic_vector(stateStruct.ViewportZScale)
			& std_logic_vector(stateStruct.ViewportHalfHeight)
			& std_logic_vector(stateStruct.ViewportHalfWidth);
	end function;

	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(TRI_SETUP_STATE_SIZE_BITS-1 downto 0) ) return sTriSetupState is
		variable retStruct : sTriSetupState;
	begin
		retStruct.ViewportHalfWidth := f32(stateStructBits(31 downto 0) );
		retStruct.ViewportHalfHeight := f32(stateStructBits(63 downto 32) );
		retStruct.ViewportZScale := f32(stateStructBits(95 downto 64) );
		retStruct.ViewportZOffset := f32(stateStructBits(127 downto 96) );
		retStruct.ScissorLeft := unsigned(stateStructBits(143 downto 128) );
		retStruct.ScissorRight := unsigned(stateStructBits(159 downto 144) );
		retStruct.ScissorTop := unsigned(stateStructBits(175 downto 160) );
		retStruct.ScissorBottom := unsigned(stateStructBits(191 downto 176) );

		return retStruct;
	end function;

end package body TriSetupState;
