
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Include our packet types library so we have access to the command processor enums from there
library work;
use work.PacketType.all;
use work.VertexBatchBuilderState.all;

entity VertexBatchBuilder is
    Port (clk : in STD_LOGIC;

		-- Commands from command processor to VertexBatchBuilder are:
		-- - SetNewDrawID(uint16 newDrawID)
		-- - DrawPrimitive(uint32 numPrimsToRender, uint16 startingVertex)
		-- - DrawIndexedPrimitive(uint32 numPrimsToRender, uint20 startingVertex, int16 BaseVertexIndex)

	-- Command processor interfaces begin
		CMD_SendCommand : in STD_LOGIC_VECTOR(1 downto 0);
		CMD_CommandArg0 : in STD_LOGIC_VECTOR(23 downto 0); -- Used for our primitive count (DrawPrimitive/DrawIndexedPrimitive)
		CMD_CommandArg1 : in STD_LOGIC_VECTOR(19 downto 0); -- Used for our uint StartIndex
		CMD_CommandArg2 : in STD_LOGIC_VECTOR(15 downto 0); -- Used for our signed short BaseVertexIndex (DrawIndexedPrimitive only)
		CMD_NewDrawEventID : in STD_LOGIC_VECTOR(15 downto 0); -- Used for keeping track of draw calls and draw states
		CMD_ReadyState : out STD_LOGIC := '0';
	-- Command processor interfaces end

	-- Index Buffer Cache interfaces begin
		IBC_ReadEnable : out STD_LOGIC := '0';
		IBC_ReadAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		IBC_ReadData : in STD_LOGIC_VECTOR(31 downto 0);
		IBC_ReadReady : in STD_LOGIC;
		IBC_InvalidateIndexCache : out STD_LOGIC := '0';
	-- Index Buffer Cache interfaces end

	-- Shader Core interface begin
		SHADER_Done : out STD_LOGIC := '0'; -- Set to '1' when we're done with our draw call and there are no more batches left
	-- Shader Core interface end

	-- Vertex Batch Builder State Block interface begin
		STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR(VERTEX_BATCH_BUILDER_STATE_SIZE_BITS-1 downto 0);
		STATE_NextDrawID : in STD_LOGIC_VECTOR(15 downto 0);
		STATE_StateIsValid : in STD_LOGIC;
		STATE_ConsumeStateSlot : out STD_LOGIC := '0';
	-- Vertex Batch Builder State Block interface end

	-- Vertex Batch FIFO interface begin
		VERTBATCH_FIFO_full : in STD_LOGIC;
		VERTBATCH_FIFO_wr_data : out STD_LOGIC_VECTOR(544 - 1 downto 0) := (others => '0');
		VERTBATCH_FIFO_wr_en : out STD_LOGIC := '0';
	-- Vertex Batch FIFO interface end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug interfaces begin
		DBG_UseConstantOutput : in STD_LOGIC;
		DBG_CurrentState : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_CurrentBatchLength : out STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
		DBG_CurrentIndexBatchLength : out STD_LOGIC_VECTOR(6 downto 0) := (others => '0');
		DBG_CurrentBatchRemainingPrims : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		DBG_QueueIsFull : out STD_LOGIC := '0';
		DBG_QueueIsEmpty : out STD_LOGIC := '1';
		DBG_DoneGeneratingIndices : out STD_LOGIC := '0';
		DBG_IndexGeneratorRemainingPrims : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		DBG_LastPolygonIndices : out STD_LOGIC_VECTOR(47 downto 0) := (others => '1')
	-- Debug interfaces end
		);
end VertexBatchBuilder;

architecture Behavioral of VertexBatchBuilder is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO WR_EN";
ATTRIBUTE X_INTERFACE_INFO of VERTBATCH_FIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO FULL";

type eVertexBatchBuilderState is
(
	readyState, -- 0
	fillBatch, -- 1
	startupState0, -- 2
	startupState1, -- 3
	comparitorState, -- 4
	comparitorState2, -- 5
	batchInsertState, -- 6
	finishAndSubmitBatch, -- 7
	finishAndSubmitBatch2, -- 8
	submitBatch, -- 9
	finishCooldown, -- 10
	fillBatch_constantOut -- 11
);

type VertexBatchType is array (15 downto 0) of unsigned(15 downto 0);
type IndexBatchType is array(63 downto 0) of unsigned(3 downto 0);

type PrimitiveIndices is record
	indexA : unsigned(15 downto 0);
	indexB : unsigned(15 downto 0);
	indexC : unsigned(15 downto 0);
end record PrimitiveIndices;

type PrimitiveIndicesArrayType is array(15 downto 0) of PrimitiveIndices;

type PrimitiveIndicesQueueStruct is record
	PrimitivesArray : PrimitiveIndicesArrayType;
	WritePointer : unsigned(3 downto 0);
end record PrimitiveIndicesQueueStruct;

type DrawCallParams is record
	remainingPrimCount : unsigned(23 downto 0);
	primTopology : ePrimTopology;
	isIndexedDraw : std_logic;
	indexBufferPtr : unsigned(29 downto 0);
	BaseVertexIndex : signed(15 downto 0);
	startIndex : unsigned(19 downto 0);
	primIsEven : std_logic;
	isFirstPolygon : std_logic;
	indexFormat : eIndexFormat;
end record DrawCallParams;

constant DefaultDrawCallParams : DrawCallParams := (remainingPrimCount => (others => '0'), primTopology => PRIMTOP_TriangleList, isIndexedDraw => '0', indexBufferPtr => (others => '0'), BaseVertexIndex => (others => '0'), startIndex => (others => '0'), primIsEven => '1', isFirstPolygon => '1', indexFormat => IBFMT_Index16);

pure function TrimIndexValueToIndexFormat(indexData : unsigned(31 downto 0); indexFormat : eIndexFormat) return unsigned is
begin
	if (indexFormat = IBFMT_Index8) then
		return "00000000" & indexData(7 downto 0);
	else -- For now just treat all other index formats as being index16 because all of our subsequent systems that we pass the vertex batches to expect 16 bit indices
		return indexData(15 downto 0);
	end if;
end function;

pure function IsPrimitiveIndicesQueueFull(queue : PrimitiveIndicesQueueStruct; ReadPointer : unsigned(3 downto 0) ) return boolean is
begin
	return ( (queue.WritePointer + 1) = ReadPointer);
end function;

pure function IsPrimitiveIndicesQueueEmpty(queue : PrimitiveIndicesQueueStruct; ReadPointer : unsigned(3 downto 0) ) return boolean is
begin
	return (queue.WritePointer = ReadPointer);
end function;

procedure QueuePushNewWriteEntry(signal queue : inout PrimitiveIndicesQueueStruct;
	variable newPrimitiveEntry : in PrimitiveIndices) is
begin
	queue.PrimitivesArray(to_integer(queue.WritePointer) ) <= newPrimitiveEntry;
	queue.WritePointer <= queue.WritePointer + 1;
end procedure;

procedure QueuePopNewReadEntry(signal queue : in PrimitiveIndicesQueueStruct; signal ReadPointer : inout unsigned(3 downto 0);
	signal newPrimitiveEntry : out PrimitiveIndices) is
begin
	newPrimitiveEntry <= queue.PrimitivesArray(to_integer(ReadPointer) );
	ReadPointer <= ReadPointer + 1;
end procedure;

procedure IncrementIndexBufferPointerByIndexFormat(signal indexBufferPointer : inout unsigned(29 downto 0);
	signal indexBufferFormat : in eIndexFormat) is
begin
	case indexBufferFormat is
		when IBFMT_Index8 =>
			indexBufferPointer <= indexBufferPointer + 1;
		when IBFMT_Index16 =>
			indexBufferPointer <= indexBufferPointer + 2;
		when others => --when IBFMT_Index32 =>
			indexBufferPointer <= indexBufferPointer + 4;
	end case;
end procedure;

procedure IncrementIndexBufferPointerByIndexFormatOffset(signal newIndexBufferPointer : out unsigned(29 downto 0);
	signal existingIndexBufferPointer : in unsigned(29 downto 0);
	signal startIndex : in unsigned(19 downto 0);
	signal indexBufferFormat : in eIndexFormat) is
begin
	case indexBufferFormat is
		when IBFMT_Index8 =>
			newIndexBufferPointer <= existingIndexBufferPointer + startIndex;
		when IBFMT_Index16 =>
			newIndexBufferPointer <= existingIndexBufferPointer + (startIndex & "0");
		when others => --when IBFMT_Index32 =>
			newIndexBufferPointer <= existingIndexBufferPointer + (startIndex & "00");
	end case;
end procedure;

pure function SerializeBatch(batch : VertexBatchType; vertexBatchLength : unsigned(4 downto 0) ) return unsigned is
begin
	return "000" & vertexBatchLength & 
		batch(15) & batch(14) & batch(13) & batch(12) & batch(11) & batch(10) & batch(9) & batch(8) & 
		batch(7) & batch(6) & batch(5) & batch(4) & batch(3) & batch(2) & batch(1) & batch(0);
end function;

pure function SerializeIndexBatch(indexBatch : IndexBatchType; indexBatchLength : unsigned(6 downto 0); isIndexedDraw : std_logic) return unsigned is
	variable tempBatchData : unsigned(255+8 downto 0) := (others => '0');
begin
	for x in 0 to 63 loop
		tempBatchData( (x+1)*4-1 downto x*4) := indexBatch(x);
	end loop;
	tempBatchData(256+8-1 downto 256) := isIndexedDraw & indexBatchLength;
	return tempBatchData;
end function;

pure function IsValueInCurrentBatch(batch : VertexBatchType; batchLength : unsigned(4 downto 0); testValue : unsigned(15 downto 0) ) return std_logic is
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

-- Only call this function if a previous call to IsValueInCurrentBatch() has succeeded or else you will get a non-sensical result!
pure function GetCurrentBatchIndexFromVertexIndex(batch : VertexBatchType; newIndex : unsigned(15 downto 0) ) return unsigned is
begin
	for x in 0 to 15 loop
		if (batch(x) = newIndex) then
			return to_unsigned(x, 4);
		end if;
	end loop;
	return to_unsigned(15, 4);
end function;

pure function GetNumIndicesPerLine(idxFmt : eIndexFormat) return integer is
begin
	case idxFmt is
		when IBFMT_Index16 =>
			return 16;
		when IBFMT_Index32 =>
			return 8;
		when IBFMT_Index8 =>
			return 32;
		when others => -- when IBFMT_NoIndices =>
			return 0;
	end case;
end function;

pure function GetIndexValueMasked(rawIndexDWORD : unsigned(31 downto 0); idxFmt : eIndexFormat) return unsigned is
begin
	case idxFmt is
		when IBFMT_Index16 =>
			return rawIndexDWORD(15 downto 0);
		when IBFMT_Index32 =>
			return rawIndexDWORD(15 downto 0);
		when IBFMT_Index8 =>
			return X"00" & rawIndexDWORD(7 downto 0);
		when others => -- when IBFMT_NoIndices =>
			return X"0000";
	end case;
end function;

pure function IndexIDToIndexAddress(indexID : unsigned(31 downto 0); IBBaseAddr : unsigned(29 downto 0); IBFormat : eIndexFormat ) return unsigned is
begin
	case IBFormat is
		when IBFMT_Index16 =>
			return IBBaseAddr + (indexID sll 1); -- Multiply by 2
		when IBFMT_Index32 =>
			return IBBaseAddr + (indexID sll 2); -- Multiply by 4
		when IBFMT_Index8 =>
			return IBBaseAddr + indexID; -- Multiply by 1
		when others => -- when IBFMT_NoIndices =>
			return "00" & IBBaseAddr;
	end case;
end function;

pure function TestLineIsDegenerate(testPrim : PrimitiveIndices) return boolean is
begin
	return (testPrim.indexA = testPrim.indexB);
end function;

pure function TestTriangleIsDegenerate(testPrim : PrimitiveIndices) return boolean is
begin
	return ( (testPrim.indexA = testPrim.indexB) or (testPrim.indexA = testPrim.indexC) );
end function;

pure function GetCMDReadyFlag(state : eVertexBatchBuilderState) return boolean is
begin
	return (state = readyState);
end function;

pure function NewPrimFitsIntoVertexBatch(currentVertBatchLength : unsigned(4 downto 0); vertsMatchInBatch : STD_LOGIC_VECTOR(2 downto 0); currentPrimTopology : ePrimTopology) return boolean is
begin
	case currentPrimTopology is
		when PRIMTOP_PointList =>
			if (vertsMatchInBatch(0) = '0') then
				return (currentVertBatchLength <= 15);
			else
				return true;
			end if;

		when PRIMTOP_LineList | PRIMTOP_LineStrip =>
			case vertsMatchInBatch(1 downto 0) is
				when "00" =>
					return (currentVertBatchLength <= 14);
				when "01" | "10" =>
					return (currentVertBatchLength <= 15);
				when others => --when "11" =>
					return true;
			end case;

		when others => -- PRIMTOP_TriangleList | PRIMTOP_TriangleStrip | PRIMTOP_TriangleFan =>
			case vertsMatchInBatch is
				when "000" =>
					return (currentVertBatchLength <= 13);
				when "001" | "010" | "100" =>
					return (currentVertBatchLength <= 14);
				when "011" | "101" | "110" =>
					return (currentVertBatchLength <= 15);
				when others => --when "111" =>
					return true;
			end case;
	end case;
end function;

pure function NewPrimFitsIntoIndexBatch(currentIndexBatchLength : unsigned (6 downto 0); currentPrimTopology : ePrimTopology) return boolean is
begin
	case currentPrimTopology is
		when PRIMTOP_PointList =>
			return (currentIndexBatchLength <= 63);

		when PRIMTOP_LineList | PRIMTOP_LineStrip =>
			return (currentIndexBatchLength <= 62);

		when others => -- PRIMTOP_TriangleList | PRIMTOP_TriangleStrip | PRIMTOP_TriangleFan =>
			return (currentIndexBatchLength <= 61);
	end case;
end function;

pure function NewPrimFitsIntoBatch(currentVertBatchLength : unsigned(4 downto 0); currentIndexBatchLength : unsigned (6 downto 0); vertsMatchInBatch : STD_LOGIC_VECTOR(2 downto 0); currentPrimTopology : ePrimTopology) return boolean is
begin
	return (NewPrimFitsIntoIndexBatch(currentIndexBatchLength, currentPrimTopology) and NewPrimFitsIntoVertexBatch(currentVertBatchLength, vertsMatchInBatch, currentPrimTopology) );
end function;

-- State shared between the various processes
signal PrimitiveIndicesQueue : PrimitiveIndicesQueueStruct := (WritePointer => (others => '0'), PrimitivesArray => (others => (others => (others => '0') ) ) );
signal PrimitiveIndicesQueue_ReadPointer : unsigned(3 downto 0) := (others => '0');
signal newDrawCallSignal : std_logic := '0';
signal newDrawCallParams : DrawCallParams := DefaultDrawCallParams;
signal currentDrawState : sVertexBatchBuilderState := DEFAULT_VERTEX_BATCH_BUILDER_STATE;

-- Input state for the comparitor process
signal currentPoppedPrim : PrimitiveIndices := (others => (others => '1') ); -- Read by the comparitor processor, written to by the main VBB process

-- Output state from the comparitor process
signal vertsExistInBatch : STD_LOGIC_VECTOR(2 downto 0) := (others => '0'); -- Bit-map of which vertices exist in the vertex batch already
signal vertsExistInBatch_cycle2 : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
signal existingVertMatchIndexA : unsigned(3 downto 0) := (others => '1'); -- Index of the vertex in the vertex batch that matches our new indexA
signal existingVertMatchIndexB : unsigned(3 downto 0) := (others => '1'); -- Index of the vertex in the vertex batch that matches our new indexB
signal existingVertMatchIndexC : unsigned(3 downto 0) := (others => '1'); -- Index of the vertex in the vertex batch that matches our new indexC
signal existingVertMatchIndexA_cycle2 : unsigned(3 downto 0) := (others => '1');
signal existingVertMatchIndexB_cycle2 : unsigned(3 downto 0) := (others => '1');
signal existingVertMatchIndexC_cycle2 : unsigned(3 downto 0) := (others => '1');
signal batchVertsAreUsed : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal batchIndicesAreUsed : STD_LOGIC_VECTOR(63 downto 0) := (others => '0');

-- The current state of the VBB main process
signal currentState : eVertexBatchBuilderState := readyState;
signal currentDrawEventID : unsigned(15 downto 0) := (others => '0');
signal currentBatch : VertexBatchType := (others => (others => '1') );
signal currentIndexBatch : IndexBatchType := (others => (others => '1') );
signal currentBatchLength : unsigned(4 downto 0) := to_unsigned(0, 5); -- How many vertices do we currently have in our vertex batch?
signal currentIndexBatchLength : unsigned(6 downto 0) := to_unsigned(0, 7); -- How many indices do we currently have in our index batch?
signal leftoverPrimitiveNextBatch : std_logic := '0'; -- Do we have an extra primitive left over to be the start of next batch?

-- The current state for the Index Generator Process
signal currentPrimVertex : unsigned(2 downto 0) := (others => '0'); -- The current primitive index (0, 1 or 2) using one-hot format ("001", "010", and "100")
signal currentIndexBufferAddr : unsigned(29 downto 0) := (others => '0');
signal currentDrawCallParams : DrawCallParams := DefaultDrawCallParams;
signal doneGeneratingIndices : std_logic := '1'; -- Signal from the Index Generator Process to the main VBB Process to tell it that we're done with this draw call
signal cooldownState : std_logic := '0';

-- Stats signals:
signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');

begin

CMD_ReadyState <= '1' when GetCMDReadyFlag(currentState) else '0';
STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
DBG_CurrentState <= std_logic_vector(to_unsigned(eVertexBatchBuilderState'pos(currentState), 4) );
DBG_CurrentBatchLength <= std_logic_vector(currentBatchLength);
DBG_CurrentIndexBatchLength <= std_logic_vector(currentIndexBatchLength);
DBG_CurrentBatchRemainingPrims <= std_logic_vector(newDrawCallParams.remainingPrimCount);
DBG_QueueIsFull <= '1' when IsPrimitiveIndicesQueueFull(PrimitiveIndicesQueue, PrimitiveIndicesQueue_ReadPointer) else '0';
DBG_QueueIsEmpty <= '1' when IsPrimitiveIndicesQueueEmpty(PrimitiveIndicesQueue, PrimitiveIndicesQueue_ReadPointer) else '0';
DBG_DoneGeneratingIndices <= doneGeneratingIndices;
DBG_IndexGeneratorRemainingPrims <= std_logic_vector(currentDrawCallParams.remainingPrimCount);
DBG_LastPolygonIndices <= std_logic_vector(currentPoppedPrim.indexC) & std_logic_vector(currentPoppedPrim.indexB) & std_logic_vector(currentPoppedPrim.indexA);
IBC_ReadAddr <= std_logic_vector(currentIndexBufferAddr);

StatsProcess : process(clk)
begin
	if (rising_edge(clk) ) then
		STAT_CurrentDrawEventID <= std_logic_vector(currentDrawEventID);
		case currentState is
			when readyState =>
				statCyclesIdle <= statCyclesIdle + 1;

			when submitBatch =>
				statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

			when others =>
				statCyclesWorking <= statCyclesWorking + 1;
		end case;
	end if;
end process StatsProcess;

BatchComparitorProcess : process(clk)
begin
	if (rising_edge(clk) ) then
	
		-- Propogate our pipeline registers:
		vertsExistInBatch_cycle2 <= vertsExistInBatch;
		existingVertMatchIndexA_cycle2 <= existingVertMatchIndexA;
		existingVertMatchIndexB_cycle2 <= existingVertMatchIndexB;
		existingVertMatchIndexC_cycle2 <= existingVertMatchIndexC;

		-- Compute whether our three new polygon vertices exist in the current batch or not:
		vertsExistInBatch(0) <= IsValueInCurrentBatch(currentBatch, currentBatchLength, currentPoppedPrim.indexA);
		if (ePrimTopology'pos(newDrawCallParams.primTopology) >= ePrimTopology'pos(PRIMTOP_LineList) ) then
			vertsExistInBatch(1) <= IsValueInCurrentBatch(currentBatch, currentBatchLength, currentPoppedPrim.indexB);
		else
			vertsExistInBatch(1) <= '1';
		end if;
		if (ePrimTopology'pos(newDrawCallParams.primTopology) >= ePrimTopology'pos(PRIMTOP_TriangleList) ) then
			vertsExistInBatch(2) <= IsValueInCurrentBatch(currentBatch, currentBatchLength, currentPoppedPrim.indexC);
		else
			vertsExistInBatch(2) <= '1';
		end if;

		-- This GetCurrentBatchIndexFromVertexIndex() is the really expensive part of this process. Let's pipeline it out to another cycle.
		existingVertMatchIndexA <= GetCurrentBatchIndexFromVertexIndex(currentBatch, currentPoppedPrim.indexA);
		existingVertMatchIndexB <= GetCurrentBatchIndexFromVertexIndex(currentBatch, currentPoppedPrim.indexB);
		existingVertMatchIndexC <= GetCurrentBatchIndexFromVertexIndex(currentBatch, currentPoppedPrim.indexC);

		for x in 0 to 15 loop
			if (currentBatchLength < (x + 1) ) then
				batchVertsAreUsed(x) <= '0';
			else
				batchVertsAreUsed(x) <= '1';
			end if;
		end loop;
		for y in 0 to 63 loop
			if (currentIndexBatchLength < (y + 1) ) then
				batchIndicesAreUsed(y) <= '0';
			else
				batchIndicesAreUsed(y) <= '1';
			end if;
		end loop;
	end if;
end process BatchComparitorProcess;

IndexGeneratorProcess : process(clk)
	variable workPrim : PrimitiveIndices;
	variable workTempIndex : unsigned(15 downto 0);
begin
	if (rising_edge(clk) ) then
		if (currentDrawCallParams.remainingPrimCount = 0) then
			doneGeneratingIndices <= '1';
			IBC_ReadEnable <= '0';
		else
			doneGeneratingIndices <= '0';
			if (cooldownState = '1') then
				IBC_ReadEnable <= '0';
				if (IBC_ReadReady = '0') then
					cooldownState <= '0';
				end if;
			else
				IBC_ReadEnable <= currentDrawCallParams.isIndexedDraw;
			end if;
		end if;

		if (cooldownState = '0' and IsPrimitiveIndicesQueueFull(PrimitiveIndicesQueue, PrimitiveIndicesQueue_ReadPointer) = false and currentDrawCallParams.remainingPrimCount > 0) then -- Stall this process if our output queue is full or we run out of prims
			if (currentDrawCallParams.isIndexedDraw = '1') then -- Indexed draw call case:
				if (IBC_ReadReady = '1') then
					cooldownState <= '1';
					case currentDrawCallParams.primTopology is
						when PRIMTOP_PointList =>
							workPrim.indexA := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
							workPrim.indexA := unsigned(signed(workPrim.indexA) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
							IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
							currentDrawCallParams.remainingPrimCount <= currentDrawCallParams.remainingPrimCount - 1;
							-- Point Lists have no index-based degeneracy case, so there's nothing to test here
							QueuePushNewWriteEntry(PrimitiveIndicesQueue, workPrim);

						when PRIMTOP_LineList =>
							case currentPrimVertex is
								when "001" =>
									workPrim.indexA := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexA := unsigned(signed(workPrim.indexA) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "010";
								when others => -- when "010" =>
									workPrim.indexB := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexB := unsigned(signed(workPrim.indexB) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "001";
									currentDrawCallParams.remainingPrimCount <= currentDrawCallParams.remainingPrimCount - 1;
									if (TestLineIsDegenerate(workPrim) = false) then
										QueuePushNewWriteEntry(PrimitiveIndicesQueue, workPrim);
									end if;
							end case;

						when PRIMTOP_LineStrip =>
							case currentPrimVertex is
								when "001" =>
									workPrim.indexA := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexA := unsigned(signed(workPrim.indexA) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "010";
								when others => -- when "010" =>
									workPrim.indexB := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexB := unsigned(signed(workPrim.indexB) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "010";
									currentDrawCallParams.remainingPrimCount <= currentDrawCallParams.remainingPrimCount - 1;
									if (TestLineIsDegenerate(workPrim) = false) then
										QueuePushNewWriteEntry(PrimitiveIndicesQueue, workPrim);
									end if;
									workPrim.indexA := workPrim.indexB;
							end case;

						when PRIMTOP_TriangleList =>
							case currentPrimVertex is
								when "001" =>
									workPrim.indexA := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexA := unsigned(signed(workPrim.indexA) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "010";
								when "010" =>
									workPrim.indexB := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexB := unsigned(signed(workPrim.indexB) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "100";
								when others => -- when "100" =>
									workPrim.indexC := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexC := unsigned(signed(workPrim.indexC) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "001";
									currentDrawCallParams.remainingPrimCount <= currentDrawCallParams.remainingPrimCount - 1;
									if (TestTriangleIsDegenerate(workPrim) = false) then
										QueuePushNewWriteEntry(PrimitiveIndicesQueue, workPrim);
									end if;
							end case;

						when PRIMTOP_TriangleStrip =>
							case currentPrimVertex is
								when "001" =>
									workPrim.indexA := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexA := unsigned(signed(workPrim.indexA) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "010";
								when "010" =>
									workPrim.indexB := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexB := unsigned(signed(workPrim.indexB) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "100";
								when others => -- when "100" =>
									workTempIndex := workPrim.indexC;
									workPrim.indexC := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexC := unsigned(signed(workPrim.indexC) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "100";
									currentDrawCallParams.remainingPrimCount <= currentDrawCallParams.remainingPrimCount - 1;
									if (TestTriangleIsDegenerate(workPrim) = false) then
										QueuePushNewWriteEntry(PrimitiveIndicesQueue, workPrim);
									end if;

									if (currentDrawCallParams.primIsEven = '1') then
										workPrim.indexA := workTempIndex;
										currentDrawCallParams.primIsEven <= '0';
									else
										workPrim.indexB := workTempIndex;
										currentDrawCallParams.primIsEven <= '1';
									end if;
							end case;

						when PRIMTOP_TriangleFan =>
							case currentPrimVertex is
								when "001" =>
									workPrim.indexA := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexA := unsigned(signed(workPrim.indexA) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "010";
								when "010" =>
									workPrim.indexB := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexB := unsigned(signed(workPrim.indexB) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "100";
								when others => -- when "100" =>
									if (currentDrawCallParams.isFirstPolygon = '0') then
										workPrim.indexB := workPrim.indexC;
									end if;
									workPrim.indexC := TrimIndexValueToIndexFormat(unsigned(IBC_ReadData), currentDrawCallParams.indexFormat);
									workPrim.indexC := unsigned(signed(workPrim.indexC) + currentDrawCallParams.BaseVertexIndex); -- Apply our BaseVertexIndex
									IncrementIndexBufferPointerByIndexFormat(currentIndexBufferAddr, currentDrawCallParams.indexFormat);
									currentPrimVertex <= "100";
									currentDrawCallParams.remainingPrimCount <= currentDrawCallParams.remainingPrimCount - 1;
									if (TestTriangleIsDegenerate(workPrim) = false) then
										QueuePushNewWriteEntry(PrimitiveIndicesQueue, workPrim);
									end if;
									currentDrawCallParams.isFirstPolygon <= '0';
							end case;

						when others => -- when quadList =>
					end case;
				end if;
			else -- Non-indexed draw call case:

				QueuePushNewWriteEntry(PrimitiveIndicesQueue, workPrim);

				case currentDrawCallParams.primTopology is
					when PRIMTOP_PointList =>
						workPrim.indexA := workPrim.indexA + 1;

					when PRIMTOP_LineList =>
						workPrim.indexA := workPrim.indexB + 1;
						workPrim.indexB := workPrim.indexB + 2;

					when PRIMTOP_LineStrip =>
						workPrim.indexA := workPrim.indexB;
						workPrim.indexB := workPrim.indexB + 1;

					when PRIMTOP_TriangleList =>
						workPrim.indexA := workPrim.indexC + 1;
						workPrim.indexB := workPrim.indexC + 2;
						workPrim.indexC := workPrim.indexC + 3;

					when PRIMTOP_TriangleStrip =>
						if (currentDrawCallParams.primIsEven = '1') then
							workPrim.indexA := workPrim.indexC;
							currentDrawCallParams.primIsEven <= '0';
						else
							workPrim.indexB := workPrim.indexC;
							currentDrawCallParams.primIsEven <= '1';
						end if;
						workPrim.indexC := workPrim.indexC + 1;

					when PRIMTOP_TriangleFan =>
						workPrim.indexA := workPrim.indexA;
						workPrim.indexB := workPrim.indexC;
						workPrim.indexC := workPrim.indexC + 1;

					when others => -- when quadList =>
				end case;
				
				currentDrawCallParams.remainingPrimCount <= currentDrawCallParams.remainingPrimCount - 1;
			end if;
		elsif (newDrawCallSignal = '1') then
			currentDrawCallParams <= newDrawCallParams;
			IncrementIndexBufferPointerByIndexFormatOffset(currentIndexBufferAddr, newDrawCallParams.indexBufferPtr, newDrawCallParams.startIndex, newDrawCallParams.indexFormat);
			if (newDrawCallParams.isIndexedDraw = '1') then
				IBC_ReadEnable <= '1'; -- Begin reading from our first index address right away to save one cycle
				cooldownState <= '1';
			else
				IBC_ReadEnable <= '0';
			end if;
			if (newDrawCallParams.remainingPrimCount = 0) then
				doneGeneratingIndices <= '1';
			else
				doneGeneratingIndices <= '0';
			end if;
			currentPrimVertex <= "001";
			workPrim.indexA := newDrawCallParams.startIndex(15 downto 0);
			workPrim.indexB := newDrawCallParams.startIndex(15 downto 0) + 1;
			workPrim.indexC := newDrawCallParams.startIndex(15 downto 0) + 2;
		end if;
	end if;
end process IndexGeneratorProcess;

MainVertexBatchBuilderProcess : process(clk)
begin
	if (rising_edge(clk) ) then
		STATE_ConsumeStateSlot <= '0';
		case currentState is
			when readyState =>
				VERTBATCH_FIFO_wr_en <= '0';
				SHADER_Done <= '1';
				newDrawCallSignal <= '0';
				IBC_InvalidateIndexCache <= '0';
				case (eVBB_CMDPacket'val(to_integer(unsigned(CMD_SendCommand) ) ) ) is
					when DrawPrimitive | DrawIndexedPrimitive =>
						currentDrawEventID <= unsigned(CMD_NewDrawEventID);
						if (STATE_NextDrawID = CMD_NewDrawEventID and STATE_StateIsValid = '1') then
							currentDrawState <= DeserializeBitsToStruct(STATE_StateBitsAtDrawID);
							STATE_ConsumeStateSlot <= '1';
						end if;

						SHADER_Done <= '0';
						currentState <= startupState0;
					when others =>
						-- Do nothing
				end case;

			when startupState0 =>
				case (eVBB_CMDPacket'val(to_integer(unsigned(CMD_SendCommand) ) ) ) is
					when DrawPrimitive =>
						newDrawCallParams.remainingPrimCount <= unsigned(CMD_CommandArg0(23 downto 0) );
						newDrawCallParams.primTopology <= currentDrawState.PrimitiveTopology;
						newDrawCallParams.isIndexedDraw <= '0';
						newDrawCallParams.indexBufferPtr <= (others => '0');
						newDrawCallParams.BaseVertexIndex <= (others => '0'); -- DrawPrimitive() doesn't use the BaseVertexIndex param
						newDrawCallParams.startIndex <= unsigned(CMD_CommandArg1);
						newDrawCallParams.primIsEven <= '1';
						newDrawCallParams.isFirstPolygon <= '1';
						newDrawCallParams.indexFormat <= IBFMT_Index16;
						currentBatchLength <= (others => '0');
						currentIndexBatchLength <= (others => '0');
						newDrawCallSignal <= '1'; -- Signal the IndexGeneratorProcess to start generating indices for us!
					when others => --when DrawIndexedPrimitive =>
						newDrawCallParams.remainingPrimCount <= unsigned(CMD_CommandArg0(23 downto 0) );
						newDrawCallParams.primTopology <= currentDrawState.PrimitiveTopology;
						newDrawCallParams.isIndexedDraw <= '1';
						newDrawCallParams.indexBufferPtr <= currentDrawState.IndexBufferBaseAddr;
						newDrawCallParams.BaseVertexIndex <= signed(CMD_CommandArg2);
						newDrawCallParams.startIndex <= unsigned(CMD_CommandArg1);
						newDrawCallParams.primIsEven <= '1';
						newDrawCallParams.isFirstPolygon <= '1';
						newDrawCallParams.indexFormat <= currentDrawState.IndexFormat;
						currentBatchLength <= (others => '0');
						currentIndexBatchLength <= (others => '0');
						newDrawCallSignal <= '1'; -- Signal the IndexGeneratorProcess to start generating indices for us!
						IBC_InvalidateIndexCache <= '1'; -- Signal the IndexBufferCache to invalidate its cache for this new draw call
				end case;
				currentState <= startupState1;

			when startupState1 =>
				IBC_InvalidateIndexCache <= '0';
				if (DBG_UseConstantOutput = '1' and newDrawCallParams.isIndexedDraw = '1') then
					currentState <= fillBatch_constantOut;
				else
					currentState <= fillBatch;
				end if;

			when fillBatch =>
				VERTBATCH_FIFO_wr_en <= '0';
				newDrawCallSignal <= '0';
				if (IsPrimitiveIndicesQueueEmpty(PrimitiveIndicesQueue, PrimitiveIndicesQueue_ReadPointer) = false) then
					QueuePopNewReadEntry(PrimitiveIndicesQueue, PrimitiveIndicesQueue_ReadPointer, currentPoppedPrim);
					currentState <= comparitorState;

				elsif (doneGeneratingIndices = '1') then
					-- If our current batch isn't empty, then finish off our current batch by filling the remaining elements with 0xFFFF's
					leftoverPrimitiveNextBatch <= '0';
					currentState <= finishAndSubmitBatch;
				end if;

			when fillBatch_constantOut =>
				newDrawCallSignal <= '0';
				if (IsPrimitiveIndicesQueueEmpty(PrimitiveIndicesQueue, PrimitiveIndicesQueue_ReadPointer) = false) then
					QueuePopNewReadEntry(PrimitiveIndicesQueue, PrimitiveIndicesQueue_ReadPointer, currentPoppedPrim);
				elsif (doneGeneratingIndices = '1') then
					currentBatch(0) <= X"0000";
					currentBatch(1) <= X"0001";
					currentBatch(2) <= X"0002";
					currentBatch(3) <= X"0003";
					currentBatch(4) <= X"0004";
					currentBatch(5) <= X"0006";
					currentBatch(6) <= X"0007";
					currentBatch(7) <= X"0005";
					currentBatchLength <= to_unsigned(8, 5);

					currentIndexBatch( 0) <= to_unsigned(0, 4); currentIndexBatch( 1) <= to_unsigned(1, 4); currentIndexBatch( 2) <= to_unsigned(2, 4);
					currentIndexBatch( 3) <= to_unsigned(2, 4); currentIndexBatch( 4) <= to_unsigned(1, 4); currentIndexBatch( 5) <= to_unsigned(3, 4);
					currentIndexBatch( 6) <= to_unsigned(4, 4); currentIndexBatch( 7) <= to_unsigned(0, 4); currentIndexBatch( 8) <= to_unsigned(5, 4);
					currentIndexBatch( 9) <= to_unsigned(5, 4); currentIndexBatch(10) <= to_unsigned(0, 4); currentIndexBatch(11) <= to_unsigned(2, 4);
					currentIndexBatch(12) <= to_unsigned(6, 4); currentIndexBatch(13) <= to_unsigned(7, 4); currentIndexBatch(14) <= to_unsigned(5, 4);
					currentIndexBatch(15) <= to_unsigned(5, 4); currentIndexBatch(16) <= to_unsigned(7, 4); currentIndexBatch(17) <= to_unsigned(4, 4);
					currentIndexBatch(18) <= to_unsigned(3, 4); currentIndexBatch(19) <= to_unsigned(1, 4); currentIndexBatch(20) <= to_unsigned(6, 4);
					currentIndexBatch(21) <= to_unsigned(6, 4); currentIndexBatch(22) <= to_unsigned(1, 4); currentIndexBatch(23) <= to_unsigned(7, 4);
					currentIndexBatch(24) <= to_unsigned(4, 4); currentIndexBatch(25) <= to_unsigned(7, 4); currentIndexBatch(26) <= to_unsigned(0, 4);
					currentIndexBatch(27) <= to_unsigned(2, 4); currentIndexBatch(28) <= to_unsigned(6, 4); currentIndexBatch(29) <= to_unsigned(5, 4);
					currentIndexBatch(30) <= to_unsigned(3, 4); currentIndexBatch(31) <= to_unsigned(6, 4); currentIndexBatch(32) <= to_unsigned(2, 4);
					currentIndexBatch(33) <= to_unsigned(0, 4); currentIndexBatch(34) <= to_unsigned(7, 4); currentIndexBatch(35) <= to_unsigned(1, 4);
					currentIndexBatchLength <= to_unsigned(36, 7);

					leftoverPrimitiveNextBatch <= '0';
					currentState <= finishAndSubmitBatch;
				end if;

			when comparitorState =>
				-- The comparisons are happening in parallel in its own process. This takes two cycles now in order to meet timing.
				currentState <= comparitorState2;

			when comparitorState2 =>
				currentState <= batchInsertState;

			when batchInsertState =>
				if (NewPrimFitsIntoBatch(currentBatchLength, currentIndexBatchLength, vertsExistInBatch_cycle2, newDrawCallParams.primTopology) ) then
					case vertsExistInBatch_cycle2 is
						when "000" =>
							currentIndexBatch(to_integer(currentIndexBatchLength) ) <= currentBatchLength(3 downto 0);
							currentIndexBatch(to_integer(currentIndexBatchLength + 1) ) <= currentBatchLength(3 downto 0) + 1;
							currentIndexBatch(to_integer(currentIndexBatchLength + 2) ) <= currentBatchLength(3 downto 0) + 2;
						when "001" =>
							currentIndexBatch(to_integer(currentIndexBatchLength) ) <= existingVertMatchIndexA_cycle2;
							currentIndexBatch(to_integer(currentIndexBatchLength + 1) ) <= currentBatchLength(3 downto 0);
							currentIndexBatch(to_integer(currentIndexBatchLength + 2) ) <= currentBatchLength(3 downto 0) + 1;
						when "010" =>
							currentIndexBatch(to_integer(currentIndexBatchLength) ) <= currentBatchLength(3 downto 0);
							currentIndexBatch(to_integer(currentIndexBatchLength + 1) ) <= existingVertMatchIndexB_cycle2;
							currentIndexBatch(to_integer(currentIndexBatchLength + 2) ) <= currentBatchLength(3 downto 0) + 1;
						when "011" =>
							currentIndexBatch(to_integer(currentIndexBatchLength) ) <= existingVertMatchIndexA_cycle2;
							currentIndexBatch(to_integer(currentIndexBatchLength + 1) ) <= existingVertMatchIndexB_cycle2;
							currentIndexBatch(to_integer(currentIndexBatchLength + 2) ) <= currentBatchLength(3 downto 0);
						when "100" =>
							currentIndexBatch(to_integer(currentIndexBatchLength) ) <= currentBatchLength(3 downto 0);
							currentIndexBatch(to_integer(currentIndexBatchLength + 1) ) <= currentBatchLength(3 downto 0) + 1;
							currentIndexBatch(to_integer(currentIndexBatchLength + 2) ) <= existingVertMatchIndexC_cycle2;
						when "101" =>
							currentIndexBatch(to_integer(currentIndexBatchLength) ) <= existingVertMatchIndexA_cycle2;
							currentIndexBatch(to_integer(currentIndexBatchLength + 1) ) <= currentBatchLength(3 downto 0);
							currentIndexBatch(to_integer(currentIndexBatchLength + 2) ) <= existingVertMatchIndexC_cycle2;
						when "110" =>
							currentIndexBatch(to_integer(currentIndexBatchLength) ) <= currentBatchLength(3 downto 0);
							currentIndexBatch(to_integer(currentIndexBatchLength + 1) ) <= existingVertMatchIndexB_cycle2;
							currentIndexBatch(to_integer(currentIndexBatchLength + 2) ) <= existingVertMatchIndexC_cycle2;
						when others => -- when "111" =>
							currentIndexBatch(to_integer(currentIndexBatchLength) ) <= existingVertMatchIndexA_cycle2;
							currentIndexBatch(to_integer(currentIndexBatchLength + 1) ) <= existingVertMatchIndexB_cycle2;
							currentIndexBatch(to_integer(currentIndexBatchLength + 2) ) <= existingVertMatchIndexC_cycle2;
					end case;

					case newDrawCallParams.primTopology is
						when PRIMTOP_PointList =>
							currentIndexBatchLength <= currentIndexBatchLength + 1;
						when PRIMTOP_LineList | PRIMTOP_LineStrip =>
							currentIndexBatchLength <= currentIndexBatchLength + 2;
						when others => -- when PRIMTOP_TriangleList | PRIMTOP_TriangleStrip | PRIMTOP_TriangleFan =>
							currentIndexBatchLength <= currentIndexBatchLength + 3;
					end case;

					case vertsExistInBatch_cycle2 is
						when "000" =>
							currentBatch(to_integer(currentBatchLength) ) <= currentPoppedPrim.indexA;
							currentBatch(to_integer(currentBatchLength + 1) ) <= currentPoppedPrim.indexB;
							currentBatch(to_integer(currentBatchLength + 2) ) <= currentPoppedPrim.indexC;
							currentBatchLength <= currentBatchLength + 3;
						when "001" =>
							currentBatch(to_integer(currentBatchLength) ) <= currentPoppedPrim.indexB;
							currentBatch(to_integer(currentBatchLength + 1) ) <= currentPoppedPrim.indexC;
							currentBatchLength <= currentBatchLength + 2;
						when "010" =>
							currentBatch(to_integer(currentBatchLength) ) <= currentPoppedPrim.indexA;
							currentBatch(to_integer(currentBatchLength + 1) ) <= currentPoppedPrim.indexC;
							currentBatchLength <= currentBatchLength + 2;
						when "011" =>
							currentBatch(to_integer(currentBatchLength) ) <= currentPoppedPrim.indexC;
							currentBatchLength <= currentBatchLength + 1;
						when "100" =>
							currentBatch(to_integer(currentBatchLength) ) <= currentPoppedPrim.indexA;
							currentBatch(to_integer(currentBatchLength + 1) ) <= currentPoppedPrim.indexB;
							currentBatchLength <= currentBatchLength + 2;
						when "101" =>
							currentBatch(to_integer(currentBatchLength) ) <= currentPoppedPrim.indexB;
							currentBatchLength <= currentBatchLength + 1;
						when "110" =>
							currentBatch(to_integer(currentBatchLength) ) <= currentPoppedPrim.indexA;
							currentBatchLength <= currentBatchLength + 1;
						when others => -- when "111" =>
							-- Do nothing, all our verts are already inserted into the vertex batch
					end case;

					leftoverPrimitiveNextBatch <= '0';
					currentState <= fillBatch;
				else
					-- Finish off our current batch by filling the remaining elements with 0xFFFF's
					leftoverPrimitiveNextBatch <= '1';
					currentState <= finishAndSubmitBatch;
				end if;

			when finishAndSubmitBatch =>
				currentState <= finishAndSubmitBatch2;				

			when finishAndSubmitBatch2 =>
				for x in 0 to 15 loop
					if (batchVertsAreUsed(x) = '0') then
						currentBatch(x) <= X"FFFF";
					end if;
				end loop;
				for y in 0 to 63 loop
					if (batchIndicesAreUsed(y) = '0') then
						currentIndexBatch(y) <= X"F";
					end if;
				end loop;
				currentState <= submitBatch;

			when submitBatch =>
				if (VERTBATCH_FIFO_full = '0') then -- FIFO is ready
					VERTBATCH_FIFO_wr_en <= '1';
					VERTBATCH_FIFO_wr_data <= std_logic_vector(currentDrawEventID) & std_logic_vector(SerializeIndexBatch(currentIndexBatch, currentIndexBatchLength, newDrawCallParams.isIndexedDraw) ) & std_logic_vector(SerializeBatch(currentBatch, currentBatchLength) );
					if (leftoverPrimitiveNextBatch = '0' and doneGeneratingIndices = '1') then
						currentState <= finishCooldown;
					else
						leftoverPrimitiveNextBatch <= '0'; -- Clear our leftover flag
						case newDrawCallParams.primTopology is
							when PRIMTOP_PointList =>
								currentBatch(0) <= currentPoppedPrim.indexA;
								currentBatchLength <= to_unsigned(1, 5);
								currentIndexBatchLength <= to_unsigned(1, 7);
							when PRIMTOP_LineList | PRIMTOP_LineStrip =>
								currentBatch(0) <= currentPoppedPrim.indexA;
								currentBatch(1) <= currentPoppedPrim.indexB;
								currentBatchLength <= to_unsigned(2, 5);
								currentIndexBatchLength <= to_unsigned(2, 7);
							when others => -- when PRIMTOP_TriangleList | PRIMTOP_TriangleStrip | PRIMTOP_TriangleFan =>
								currentBatch(0) <= currentPoppedPrim.indexA;
								currentBatch(1) <= currentPoppedPrim.indexB;
								currentBatch(2) <= currentPoppedPrim.indexC;
								currentBatchLength <= to_unsigned(3, 5);
								currentIndexBatchLength <= to_unsigned(3, 7);
						end case;
						currentState <= fillBatch;
					end if;
				else -- FIFO is not ready yet
					VERTBATCH_FIFO_wr_en <= '0';
				end if;

			when finishCooldown =>
				VERTBATCH_FIFO_wr_en <= '0';
				currentState <= readyState;
		end case;
	end if;
end process MainVertexBatchBuilderProcess;

end Behavioral;
