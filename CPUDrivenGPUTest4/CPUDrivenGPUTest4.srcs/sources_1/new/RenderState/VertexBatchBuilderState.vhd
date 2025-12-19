
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

library work;
use work.PacketType.all;

package VertexBatchBuilderState is

	type sVertexBatchBuilderState is record -- Currently 35 bits in total
		IndexBufferBaseAddr : unsigned(29 downto 0); -- 29 : 0
		IndexFormat : eIndexFormat; -- 31 : 30
		PrimitiveTopology : ePrimTopology; -- 34 : 32
	end record sVertexBatchBuilderState;

	constant VERTEX_BATCH_BUILDER_STATE_SIZE_BITS : positive := 35;

	constant DEFAULT_VERTEX_BATCH_BUILDER_STATE : sVertexBatchBuilderState := (IndexBufferBaseAddr => (others => '0'), -- Default to address 0x00000000
		IndexFormat => IBFMT_Index16, -- Default to 16-bit indices
		PrimitiveTopology => PRIMTOP_TriangleList); -- Default to triangle list

	pure function SerializeStructToBits(stateStruct : sVertexBatchBuilderState) return std_logic_vector;
	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(VERTEX_BATCH_BUILDER_STATE_SIZE_BITS-1 downto 0) ) return sVertexBatchBuilderState;
	pure function MakeStructFromMembers(argIndexBufferBaseAddr : unsigned(29 downto 0); argIndexFormat : eIndexFormat; argPrimitiveTopology : ePrimTopology) return sVertexBatchBuilderState;
	
end package VertexBatchBuilderState;

package body VertexBatchBuilderState is

	pure function SerializeStructToBits(stateStruct : sVertexBatchBuilderState) return std_logic_vector is
	begin
		return std_logic_vector(to_unsigned(ePrimTopology'pos(stateStruct.PrimitiveTopology), 3) )
			& std_logic_vector(to_unsigned(eIndexFormat'pos(stateStruct.IndexFormat), 2) )
			& std_logic_vector(stateStruct.IndexBufferBaseAddr);
	end function;

	pure function DeserializeBitsToStruct(stateStructBits : std_logic_vector(VERTEX_BATCH_BUILDER_STATE_SIZE_BITS-1 downto 0) ) return sVertexBatchBuilderState is
		variable retStruct : sVertexBatchBuilderState;
	begin
		retStruct.IndexBufferBaseAddr := unsigned(stateStructBits(29 downto 0) );
		retStruct.IndexFormat := eIndexFormat'val(to_integer(unsigned(stateStructBits(31 downto 30) ) ) );
		retStruct.PrimitiveTopology := ePrimTopology'val(to_integer(unsigned(stateStructBits(34 downto 32) ) ) );

		return retStruct;
	end function;

	pure function MakeStructFromMembers(argIndexBufferBaseAddr : unsigned(29 downto 0); argIndexFormat : eIndexFormat; argPrimitiveTopology : ePrimTopology) return sVertexBatchBuilderState is
	variable retStruct : sVertexBatchBuilderState;
	begin
		retStruct.IndexBufferBaseAddr := argIndexBufferBaseAddr;
		retStruct.IndexFormat := argIndexFormat;
		retStruct.PrimitiveTopology := argPrimitiveTopology;

		return retStruct;
	end function;

end package body VertexBatchBuilderState;
