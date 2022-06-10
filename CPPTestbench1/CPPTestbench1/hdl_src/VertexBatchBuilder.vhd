
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet types library so we have access to the command processor enum from there
library work;
use work.PacketType.all;

entity VertexBatchBuilder is
    Port (clk : in STD_LOGIC;	

		-- Commands from command processor to VertexBatchBuilder are:
		-- - SetIndexBuffer(uint32 addr, uint2 format) (format can either be: INDEX8, INDEX16, or INDEX32)
		-- - DrawPrimitive(uint32 startingVertex, uint32 numPrimsToRender, uint3 primType)
		-- - DrawIndexedPrimitive(uint32 startingVertex, uint32 indexOffset, uint32 numPrimsToRender, uint3 primType)

	-- Command processor interfaces begin
		CMD_SendCommand : in STD_LOGIC_VECTOR(1 downto 0);
		CMD_CommandArg0 : in STD_LOGIC_VECTOR(31 downto 0);
		CMD_CommandArg1 : in STD_LOGIC_VECTOR(31 downto 0);
		CMD_CommandArgType : in STD_LOGIC_VECTOR(2 downto 0);
		CMD_ReadyState : out STD_LOGIC := '0';
	-- Command processor interfaces end

	-- Index Buffer Cache interfaces begin
		IBC_ReadEnable : out STD_LOGIC := '0';
		IBC_ReadAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		IBC_ReadData : in STD_LOGIC_VECTOR(31 downto 0);
		IBC_ReadReady : in STD_LOGIC;
	-- Index Buffer Cache interfaces end

	-- Shader Core interface begin
		SHADER_Done : out STD_LOGIC := '0'; -- Set to '1' when we're done with our draw call and there are no more batches left
	-- Shader Core interface end

	-- Vertex Batch FIFO interface begin
		VERTBATCH_FIFO_full : in STD_LOGIC;
		VERTBATCH_FIFO_wr_data : out STD_LOGIC_VECTOR(18*16 - 1 downto 0) := (others => '0');
		VERTBATCH_FIFO_wr_en : out STD_LOGIC := '0';
	-- Vertex Batch FIFO interface end

	-- Debug interfaces begin
		DBG_CurrentState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_CurrentBatchLength : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_CurrentBatchRemainingPrims : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_CurrentIndexID : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_CurrentIndexIDPlus1 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_CurrentIndexIDPlus2 : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0')
	-- Debug interfaces end
		);
end VertexBatchBuilder;

architecture Behavioral of VertexBatchBuilder is

ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO FULL";

type eVertexBatchBuilderState is
(
	initState, -- 0

	readyState, -- 1

	drawLoopNonindexed_triList, -- 2
	drawLoopNonindexed_triStrip, -- 3
	drawLoopNonindexed_triFan, -- 4

	drawLoopIndexed_triList, -- 5
	drawLoopIndexed_triStrip, -- 6
	drawLoopIndexed_triFan, -- 7

	drawLoopIndexed_waitForIndex, -- 8

	finishAndSubmitBatch, -- 9
	submitBatch -- 10
);

type eIndexFormat is
(
	index16, -- 0
	index32, -- 1
	index8 -- 2
);

type ePrimTopology is
(
	pointList, -- 0

	lineList, -- 1
	lineStrip, -- 2

	triList, -- 3
	triStrip, -- 4
	triFan, -- 5

	quadList -- 6
);

type vertexBatch is array (15 downto 0) of unsigned(15 downto 0);

pure function SerializeBatch(batch : vertexBatch; batchStartingIndex : unsigned(31 downto 0); batchEndingIndex : unsigned(31 downto 0) ) return unsigned is
begin
	return batchEndingIndex(15 downto 0) & batchStartingIndex(15 downto 0) & 
		batch(15) & batch(14) & batch(13) & batch(12) & batch(11) & batch(10) & batch(9) & batch(8) & 
		batch(7) & batch(6) & batch(5) & batch(4) & batch(3) & batch(2) & batch(1) & batch(0);
end function;

pure function IsValueInCurrentBatch(batch : vertexBatch; batchLength : unsigned(4 downto 0); testValue : unsigned(15 downto 0) ) return std_logic is
begin
	for x in 0 to 15 loop
		if (batchLength > x) then
			if (batch(x) = testValue) then
				return '1';
			end if;
		end if;
	end loop;
	return '0';
end function;

pure function GetNumIndicesPerLine(idxFmt : eIndexFormat) return integer is
begin
	case idxFmt is
		when index16 =>
			return 16;
		when index32 =>
			return 8;
		when index8 =>
			return 32;
		when others =>
			return 0;
	end case;
end function;

pure function GetIndexValueMasked(rawIndexDWORD : unsigned(31 downto 0); idxFmt : eIndexFormat) return unsigned is
begin
	case idxFmt is
		when index16 =>
			return rawIndexDWORD(15 downto 0);
		when index32 =>
			return rawIndexDWORD(15 downto 0);
		when index8 =>
			return X"00" & rawIndexDWORD(7 downto 0);
		when others =>
			return X"0000";
	end case;
end function;

pure function GetPrimitiveToplogyFromUnsigned(value : unsigned(2 downto 0) ) return ePrimTopology is
begin
	return ePrimTopology'val(to_integer(value) );
end function;

pure function IndexIDToIndexAddress(indexID : unsigned(31 downto 0); IBBaseAddr : unsigned(29 downto 0); IBFormat : eIndexFormat ) return unsigned is
begin
	case IBFormat is
		when index16 =>
			return IBBaseAddr + (indexID sll 1); -- Multiply by 2
		when index32 =>
			return IBBaseAddr + (indexID sll 2); -- Multiply by 4
		when index8 =>
			return IBBaseAddr + indexID; -- Multiply by 1
		when others =>
			return "00" & IBBaseAddr;
	end case;
end function;

pure function GetCMDReadyFlag(state : eVertexBatchBuilderState) return std_logic is
begin
	if (state = readyState) then
		return '1';
	else
		return '0';
	end if;
end function;

signal currentBatch : vertexBatch;
signal currentBatchLength : unsigned(4 downto 0) := to_unsigned(0, 5);
signal currentPrimLength : unsigned(1 downto 0) := (others => '0');

-- The current state of the vertex batch builder
signal currentState : eVertexBatchBuilderState := initState;
signal currentIndexBufferAddr : unsigned(29 downto 0) := (others => '0');
signal currentIndexBufferFmt : eIndexFormat := index16;
signal currentBatchRemainingPrims : unsigned(31 downto 0) := (others => '0');
signal currentBatchStartingIndex : unsigned(31 downto 0) := (others => '0');
signal currentIndexID : unsigned(31 downto 0) := (others => '0');
signal currentIndexIDPlus1 : unsigned(31 downto 0) := (others => '0');
signal currentIndexIDPlus2 : unsigned(31 downto 0) := (others => '0');
signal currentPrimToplogy : ePrimTopology := triList;
signal currentlyDoingIndexedDrawing : std_logic := '0';

begin

CMD_ReadyState <= GetCMDReadyFlag(currentState);
DBG_CurrentState <= std_logic_vector(to_unsigned(eVertexBatchBuilderState'pos(currentState), 4) );
DBG_CurrentBatchLength <= std_logic_vector(currentBatchLength);
DBG_CurrentBatchRemainingPrims <= std_logic_vector(currentBatchRemainingPrims);
DBG_CurrentIndexID <= std_logic_vector(currentIndexID);
DBG_CurrentIndexIDPlus1 <= std_logic_vector(currentIndexIDPlus1);
DBG_CurrentIndexIDPlus2 <= std_logic_vector(currentIndexIDPlus2);

process(clk)
begin
	if (rising_edge(clk) ) then
		case currentState is
			when initState =>
				currentState <= readyState;

			when readyState =>
				VERTBATCH_FIFO_wr_en <= '0';
				SHADER_Done <= '1';
				case (eVBB_CMDPacket'val(to_integer(unsigned(CMD_SendCommand) ) ) ) is
					when SetIndexBuffer =>
						currentIndexBufferAddr <= unsigned(CMD_CommandArg0(29 downto 0) );
						currentIndexBufferFmt <= eIndexFormat'val(to_integer(unsigned(CMD_CommandArg0(31 downto 30) ) ) );
					when DrawPrimitive =>
						currentBatchRemainingPrims <= unsigned(CMD_CommandArg0);
						currentBatchStartingIndex <= (others => '0'); -- Non-indexed batches have no start/end indices (they are both always 0)
						currentIndexID <= unsigned(CMD_CommandArg1);
						currentIndexIDPlus1 <= unsigned(CMD_CommandArg1) + 1;
						currentIndexIDPlus2 <= unsigned(CMD_CommandArg1) + 2;
						currentPrimToplogy <= GetPrimitiveToplogyFromUnsigned(unsigned(CMD_CommandArgType) );
						currentBatchLength <= (others => '0');
						currentlyDoingIndexedDrawing <= '0';
						SHADER_Done <= '0';
						case GetPrimitiveToplogyFromUnsigned(unsigned(CMD_CommandArgType) ) is
							when triList =>
								currentBatch(15) <= X"FFFF"; -- Always set the last vertID in the vertex batch to FFFF when we're drawing triangle lists (15/16)
								currentState <= drawLoopNonindexed_triList;
							when triStrip =>
								currentState <= drawLoopNonindexed_triStrip;
							when triFan =>
								currentState <= drawLoopNonindexed_triFan;
							when others =>
						end case;
					when DrawIndexedPrimitive =>
						currentBatchRemainingPrims <= unsigned(CMD_CommandArg0);
						currentBatchStartingIndex <= unsigned(CMD_CommandArg1);
						currentIndexID <= unsigned(CMD_CommandArg1);
						currentIndexIDPlus1 <= unsigned(CMD_CommandArg1) + 1;
						currentIndexIDPlus2 <= unsigned(CMD_CommandArg1) + 2;
						currentPrimToplogy <= GetPrimitiveToplogyFromUnsigned(unsigned(CMD_CommandArgType) );
						currentBatchLength <= (others => '0');
						currentlyDoingIndexedDrawing <= '1';
						SHADER_Done <= '0';
						case GetPrimitiveToplogyFromUnsigned(unsigned(CMD_CommandArgType) ) is
							when triList =>
								currentBatch(15) <= X"FFFF"; -- Always set the last vertID in the vertex batch to FFFF when we're drawing triangle lists (15/16)
								currentState <= drawLoopIndexed_triList;
							when triStrip =>
								currentState <= drawLoopIndexed_triStrip;
							when triFan =>
								currentState <= drawLoopIndexed_triFan;
							when others =>
						end case;
					when others =>
				end case;

			when drawLoopNonindexed_triList =>
				VERTBATCH_FIFO_wr_en <= '0';
				currentBatch(to_integer(currentBatchLength) ) <= currentIndexID(15 downto 0);
				currentBatch(to_integer(currentBatchLength + 1) ) <= currentIndexIDPlus1(15 downto 0);
				currentBatch(to_integer(currentBatchLength + 2) ) <= currentIndexIDPlus2(15 downto 0);
				currentIndexID <= currentIndexID + 3;
				currentIndexIDPlus1 <= currentIndexIDPlus1 + 3;
				currentIndexIDPlus2 <= currentIndexIDPlus2 + 3;
				if (currentBatchRemainingPrims = 1) then
					currentState <= finishAndSubmitBatch;
				elsif (currentBatchLength >= 12) then
					currentState <= submitBatch;
				end if;
				currentBatchRemainingPrims <= currentBatchRemainingPrims - 1;
				currentBatchLength <= currentBatchLength + 3;

			when drawLoopNonindexed_triStrip =>
				VERTBATCH_FIFO_wr_en <= '0';
				if (currentBatchLength = 0) then
					currentBatch(0) <= currentIndexID(15 downto 0);
					currentBatch(1) <= currentIndexIDPlus1(15 downto 0);
					currentBatch(2) <= currentIndexIDPlus2(15 downto 0);
					currentBatchLength <= currentBatchLength + 3;
				else
					currentBatch(to_integer(currentBatchLength) ) <= currentIndexID(15 downto 0);
					currentBatchLength <= currentBatchLength + 1;
				end if;
				currentIndexIDPlus2 <= currentIndexIDPlus1;
				currentIndexIDPlus1 <= currentIndexID;
				currentIndexID <= currentIndexID + 1;

				if (currentBatchRemainingPrims = 1) then
					currentState <= finishAndSubmitBatch;
				elsif (currentBatchLength >= 14) then
					currentState <= submitBatch;
				end if;

			when drawLoopNonindexed_triFan =>
				VERTBATCH_FIFO_wr_en <= '0';
				if (currentBatchLength = 0) then
					currentBatch(0) <= currentIndexID(15 downto 0);
					currentBatch(1) <= currentIndexIDPlus1(15 downto 0);
					currentBatch(2) <= currentIndexIDPlus2(15 downto 0);
					currentBatchLength <= currentBatchLength + 3;
				else
					currentBatch(to_integer(currentBatchLength) ) <= currentIndexID(15 downto 0);
					currentBatchLength <= currentBatchLength + 1;
				end if;
				currentIndexIDPlus2 <= currentIndexIDPlus1;
				currentIndexIDPlus1 <= currentIndexID + 1;

				if (currentBatchRemainingPrims = 1) then
					currentState <= finishAndSubmitBatch;
				elsif (currentBatchLength >= 14) then
					currentState <= submitBatch;
				end if;
				
			when finishAndSubmitBatch =>
				for x in 0 to 15 loop
					if (currentBatchLength < (x + 1) ) then
						currentBatch(x) <= X"FFFF";
					end if;
				end loop;
				currentState <= submitBatch;

			when submitBatch =>
				if (VERTBATCH_FIFO_full = '0') then -- FIFO is ready
					VERTBATCH_FIFO_wr_en <= '1';
					VERTBATCH_FIFO_wr_data <= std_logic_vector(SerializeBatch(currentBatch, currentBatchStartingIndex, currentIndexID) );
					currentBatchLength <= (others => '0');
					if (currentBatchRemainingPrims > 0) then -- More polys remaining
						if (currentlyDoingIndexedDrawing = '1') then
							case currentPrimToplogy is
							when triList =>
								currentState <= drawLoopIndexed_triList;
							when triStrip =>
								currentState <= drawLoopIndexed_triStrip;
							when triFan =>
								currentState <= drawLoopIndexed_triFan;
							when others =>
								currentState <= readyState;
							end case;
						else
							case currentPrimToplogy is
							when triList =>
								currentState <= drawLoopNonindexed_triList;
							when triStrip =>
								currentState <= drawLoopNonindexed_triStrip;
							when triFan =>
								currentState <= drawLoopNonindexed_triFan;
							when others =>
								currentState <= readyState;
							end case;
						end if;
					else -- All polys complete
						currentState <= readyState;
					end if;
				else -- FIFO is not ready
					VERTBATCH_FIFO_wr_en <= '0';
				end if;

			when drawLoopIndexed_triList =>
				VERTBATCH_FIFO_wr_en <= '0';
				if (currentBatchRemainingPrims > 0) then
					IBC_ReadAddr <= std_logic_vector(IndexIDToIndexAddress(currentIndexID, currentIndexBufferAddr, currentIndexBufferFmt)(29 downto 0) );
					IBC_ReadEnable <= '1';
					currentState <= drawLoopIndexed_waitForIndex;
				else
					currentState <= finishAndSubmitBatch;
				end if;

			when drawLoopIndexed_waitForIndex =>
				if (IBC_ReadReady = '1') then
					IBC_ReadEnable <= '0';
					currentBatch(to_integer(currentBatchLength) ) <= GetIndexValueMasked(unsigned(IBC_ReadData), currentIndexBufferFmt);
					currentIndexID <= currentIndexID + 1;
					currentBatchLength <= currentBatchLength + 1;
					if (currentPrimLength = 2) then
						currentPrimLength <= (others => '0');
						currentBatchRemainingPrims <= currentBatchRemainingPrims - 1;
					else
						currentPrimLength <= currentPrimLength + 1;
					end if;

					if (currentBatchLength = 14) then
						currentState <= submitBatch;
					else
						currentState <= drawLoopIndexed_triList;
					end if;
				end if;

			when drawLoopIndexed_triStrip =>
				-- TODO: Implement non-TriList indexed drawing
				VERTBATCH_FIFO_wr_en <= '0';
				currentState <= readyState; -- Just go back to the ready state for now

			when drawLoopIndexed_triFan =>
				-- TODO: Implement non-TriList indexed drawing
				VERTBATCH_FIFO_wr_en <= '0';
				currentState <= readyState; -- Just go back to the ready state for now

			when others =>
		end case;
	end if;
end process;

end Behavioral;
