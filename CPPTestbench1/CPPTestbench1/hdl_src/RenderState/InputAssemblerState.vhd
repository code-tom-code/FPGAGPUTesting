
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.PacketType.all;

package InputAssemblerState is

	type sInputAssemblerState is record -- Currently 5 bits in total
		CullMode : eCullMode; -- 1 : 0
		PrimTopology : ePrimTopology; -- 4 : 2
	end record sInputAssemblerState;

	constant INPUT_ASSEMBLER_STATE_SIZE_BITS : positive := 5;

	constant DEFAULT_INPUT_ASSEMBLER_STATE : sInputAssemblerState := (CullMode => CM_CullCCW, -- Default to CCW culling
		PrimTopology => PRIMTOP_TriangleList); -- Default to triangle lists

	pure function SerializeStructToBits(stateStruct : sInputAssemblerState) return std_logic_vector;
	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(INPUT_ASSEMBLER_STATE_SIZE_BITS-1 downto 0) ) return sInputAssemblerState;
	pure function MakeStructFromMembers(argCullMode : eCullMode; argPrimTopology : ePrimTopology) return sInputAssemblerState;
	
end package InputAssemblerState;

package body InputAssemblerState is

	pure function SerializeStructToBits(stateStruct : sInputAssemblerState) return std_logic_vector is
	begin
		return std_logic_vector(to_unsigned(ePrimTopology'pos(stateStruct.PrimTopology), 3) )
			& std_logic_vector(to_unsigned(eCullMode'pos(stateStruct.CullMode), 2) );
	end function;

	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(INPUT_ASSEMBLER_STATE_SIZE_BITS-1 downto 0) ) return sInputAssemblerState is
		variable retStruct : sInputAssemblerState;
	begin
		retStruct.CullMode := eCullMode'val(to_integer(unsigned(stateStructBits(1 downto 0) ) ) );
		retStruct.PrimTopology := ePrimTopology'val(to_integer(unsigned(stateStructBits(4 downto 2) ) ) );

		return retStruct;
	end function;

	pure function MakeStructFromMembers(argCullMode : eCullMode; argPrimTopology : ePrimTopology) return sInputAssemblerState is
		variable retStruct : sInputAssemblerState;
	begin
		retStruct.CullMode := argCullMode;
		retStruct.PrimTopology := argPrimTopology;

		return retStruct;
	end function;

end package body InputAssemblerState;
