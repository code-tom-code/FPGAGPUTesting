library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
library IEEE;
use IEEE.NUMERIC_STD.ALL;

-- Include our packet definition file so that we can use the loadVertexStreamType enum type defined in there
library work;
use work.PacketType.all;

entity InputAssembler2 is
	Port (clk : in STD_LOGIC;

	-- Triangle Setup interfaces begin
		TRISETUP_v0PosX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_v0PosY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_v0PosInvZ : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		TRISETUP_v1PosX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_v1PosY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_v1PosInvZ : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		TRISETUP_v2PosX : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_v2PosY : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_v2PosInvZ : out STD_LOGIC_VECTOR(23 downto 0) := (others => '0');
		TRISETUP_tex0_X : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_tex0_Y : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_tex1_X : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_tex1_Y : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_tex2_X : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_tex2_Y : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		TRISETUP_vertColor0_RGBA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_vertColor1_RGBA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_vertColor2_RGBA : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		TRISETUP_readyForNewTri : in STD_LOGIC;
		TRISETUP_newTriBegin : out STD_LOGIC := '0';
	-- Triangle Setup interfaces end

	-- Index Buffer Cache interfaces begin
		IBC_ReadEnable : out STD_LOGIC := '0';
		IBC_ReadAddr : out STD_LOGIC_VECTOR(29 downto 0) := (others => '0');
		IBC_ReadData : in STD_LOGIC_VECTOR(31 downto 0);
		IBC_ReadReady : in STD_LOGIC;
	-- Index Buffer Cache interfaces end

	-- Vertex Batch Output (VBO) interfaces begin
		VBO_Pushed : in STD_LOGIC; -- Set to 1 when we've completed pushing our next fully shaded batch of output verts
		VBO_BatchStartingIndex : in STD_LOGIC_VECTOR(15 downto 0); -- Both the starting and ending indices are set to the same value in the case of a non-indexed draw call
		VBO_BatchEndingIndex : in STD_LOGIC_VECTOR(15 downto 0);
		VBO_Ready : out STD_LOGIC := '0'; -- Set to 1 when we're ready for more vertices
		VERTOUT_FIFO_empty : in STD_LOGIC;
		VERTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR(127 downto 0);
		VERTOUT_FIFO_rd_en : out STD_LOGIC := '0';
	-- Vertex Batch Output (VBO) interfaces end

	-- Command processor interfaces begin
		CMD_DrawReady : out STD_LOGIC := '0';

		CMD_SetStateReady : out STD_LOGIC := '0';
		CMD_SetStateEnable : in STD_LOGIC;
		CMD_IndexBufferBaseAddr : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_StateCullMode : in STD_LOGIC_VECTOR(1 downto 0);
		CMD_StatePrimTopology : in STD_LOGIC_VECTOR(2 downto 0);
		CMD_StateStripCutType : in STD_LOGIC_VECTOR(1 downto 0);
		CMD_StateIndexFormat : in STD_LOGIC_VECTOR(1 downto 0);

		CMD_IA_Idle : out STD_LOGIC := '0'; -- Signal to let the command processor know that we are idle (have no work to do)
	-- Command processor interfaces end

	-- Stats interface begin
		STAT_CyclesIdle : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesLoadingDataToCache : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	-- Stats interface end

	-- Debug signals
		DBG_IA_State : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0')
		);
end InputAssembler2;

architecture Behavioral of InputAssembler2 is

ATTRIBUTE X_INTERFACE_INFO : STRING;
ATTRIBUTE X_INTERFACE_PARAMETER : STRING;

ATTRIBUTE X_INTERFACE_INFO of clk: SIGNAL is "xilinx.com:signal:clock:1.0 clk CLK";
ATTRIBUTE X_INTERFACE_PARAMETER of clk: SIGNAL is "FREQ_HZ 333250000";

ATTRIBUTE X_INTERFACE_INFO of VERTOUT_FIFO_rd_data : SIGNAL is "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of VERTOUT_FIFO_rd_en : SIGNAL is "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of VERTOUT_FIFO_empty : SIGNAL is "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO EMPTY";

signal currentIndexA : unsigned(15 downto 0) := x"0000";
signal currentIndexB : unsigned(15 downto 0) := x"0001";
signal currentIndexC : unsigned(15 downto 0) := x"0002";

signal currentIndexValA : unsigned(15 downto 0) := (others => '0');
signal currentIndexValB : unsigned(15 downto 0) := (others => '0');
signal currentIndexValC : unsigned(15 downto 0) := (others => '0');

signal IBAddrBase : unsigned(29 downto 0) := (others => '0');

type IA_state_t is (
	IAstate_readyIdleState, -- 0

	IAstate_sendTriData, -- 1
	IAstate_sendTriDataNoCulling, -- 2

	IAState_readVertexData, -- 3

	IAstate_advanceIndices, -- 4
	IAstate_readIndicesA, -- 5
	IAstate_readIndicesACooldown, -- 6
	IAstate_readIndicesB, -- 7
	IAstate_readIndicesBCooldown, -- 8
	IAstate_readIndicesC, -- 9
	IAstate_readIndicesCCooldown, -- 10
	IAstate_indexedAssemble -- 11
);
    
type vertexPos is record
	vx : signed(15 downto 0);
	vy : signed(15 downto 0);
	vInvZ : unsigned(31 downto 0); -- Unsigned normalized (0.0f to 1.0f) value packed into 24 bits
end record vertexPos;

type vertexTexcoord is record
	tx : unsigned(15 downto 0);
	ty : unsigned(15 downto 0);
end record vertexTexcoord;

type vertexColor is record
	r : unsigned(7 downto 0);
	g : unsigned(7 downto 0);
	b : unsigned(7 downto 0);
	a : unsigned(7 downto 0);
end record vertexColor;
    
type vertexData is record
	pos : vertexPos;
	texcoord : vertexTexcoord;
	color : vertexColor;
end record vertexData;

type triangleData is record
	v0 : vertexData;
	v1 : vertexData;
	v2 : vertexData;
end record triangleData;

type vertexDataBatch is array(15 downto 0) of vertexData;

type indexTranslationArray is array(15 downto 0) of unsigned(31 downto 0);

procedure IncrementIndicesByPrimitiveTopology(signal indexA : inout unsigned(15 downto 0); 
	signal indexB : inout unsigned(15 downto 0); 
	signal indexC : inout unsigned(15 downto 0); 
	signal primTopology : in ePrimTopology;
	variable isEvenTriangle : in std_logic) is
begin
	case primTopology is
		when PRIMTOP_TriangleStrip =>
			if (isEvenTriangle = '1') then -- Triangle strips alternate their winding with every other triangle
				indexA <= indexC;
				indexB <= indexB;
			else
				indexA <= indexB;
				indexB <= indexC;
			end if;
			indexC <= indexC + 1;

		when PRIMTOP_TriangleFan =>
			indexA <= to_unsigned(0, 16); -- indexA never changes for triangle fans
			indexB <= indexC;
			indexC <= indexC + 1;

		when others => --when PRIMTOP_TriangleList =>
			indexA <= indexA + 3;
			indexB <= indexB + 3;
			indexC <= indexC + 3;
	end case;
end procedure;

procedure AssembleTrianglesFromVertices(signal indexA : in unsigned(15 downto 0); signal indexB : in unsigned(15 downto 0); signal indexC : in unsigned(15 downto 0); signal vertexData : in vertexDataBatch; signal fillTriangle : out triangleData) is
begin
	fillTriangle.v0 <= vertexData(to_integer(indexA(3 downto 0) ) );
	fillTriangle.v1 <= vertexData(to_integer(indexB(3 downto 0) ) );
	fillTriangle.v2 <= vertexData(to_integer(indexC(3 downto 0) ) );
end procedure;

pure function UnpackVertexDataFromBuffer(vertDataBits : unsigned(127 downto 0) ) return vertexData is
	variable ret : vertexData;
begin
	ret.pos.vx := signed(vertDataBits(15 downto 0) );
	ret.pos.vy := signed(vertDataBits(31 downto 16) );
	ret.pos.vInvZ := "00000000" & vertDataBits(54 downto 32) & '0'; -- Extract the 24-bit Z value from the float32 mantissa
	ret.texcoord.tx := vertDataBits(79 downto 64);
	ret.texcoord.ty := vertDataBits(95 downto 80);
	ret.color.r := vertDataBits(103 downto 96);
	ret.color.g := vertDataBits(111 downto 104);
	ret.color.b := vertDataBits(119 downto 112);
	ret.color.a := vertDataBits(127 downto 120);
	return ret;
end function;

pure function IsIndexAlreadyInBatch(knownIndices : indexTranslationArray; newIndex : unsigned(31 downto 0) ) return std_logic is
begin
	for i in 0 to 15 loop
		if (knownIndices(i) = newIndex) then
			return '1';
		end if;
	end loop;
	return '0';
end function;

-- Do not call this function unless you have previously called IsIndexAlreadyInBatch() and it returned true
pure function GetIndexAlreadyInBatch(knownIndices : indexTranslationArray; lookupIndex : unsigned(31 downto 0) ) return unsigned is
begin
	for i in 0 to 15 loop
		if (knownIndices(i) = lookupIndex) then
			return to_unsigned(i, 4);
		end if;
	end loop;
	return to_unsigned(0, 4);
end function;

pure function IndexIDToIndexAddress(indexID : unsigned(17 downto 0); IBBaseAddr : unsigned(29 downto 0); IBFormat : eIndexFormat ) return unsigned is
begin
	case IBFormat is
		when IBFMT_Index16 =>
			return IBBaseAddr + (indexID sll 1); -- Multiply by 2
		when IBFMT_Index32 =>
			return IBBaseAddr + (indexID sll 2); -- Multiply by 4
		when IBFMT_Index8 =>
			return IBBaseAddr + indexID; -- Multiply by 1
		when others =>
			return IBBaseAddr;
	end case;
end function;
    
signal currentState : IA_state_t := IAstate_readyIdleState;

signal currentTri : triangleData;
signal currentVertexData : vertexDataBatch;

signal cullState : eCullMode := CM_CullCCW;
signal primTopologyState : ePrimTopology := PRIMTOP_TriangleList;
signal stripCutState : eStripCutType := SCT_CutDisabled;
signal indexFormatState : eIndexFormat := IBFMT_NoIndices;

-- Primitive number that resets to 0 at the start of each Draw() call
signal SV_PrimitiveID : unsigned(31 downto 0) := (others => '0');
signal LastPrimitiveIDIsOdd : std_logic := '0';

signal batchStartingIndex : unsigned(15 downto 0) := (others => '0');
signal batchEndingIndex : unsigned(15 downto 0) := (others => '0');
signal batchUsedIndices : unsigned(3 downto 0) := (others => '0');
signal currentDrawIsIndexed : std_logic := '1'; -- If 1 then this is an indexed draw call (ie. DrawIndexedPrimitive), if 0 then this is a non-indexed draw call (ie. DrawPrimitive)

signal indexTranslation : indexTranslationArray := (others => (others => '1') );
signal indicesUsedPerBatch : unsigned(3 downto 0) := (others => '0');

signal vertexIDPerBatch : unsigned(3 downto 0) := (others => '0');

-- These signals are tied directly to output ports:
signal drawReady : std_logic := '0';
signal setStateReady : std_logic := '0';
signal IAIsIdle : std_logic := '0';
signal newTriBegin : std_logic := '0';

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesLoadingDataToCache : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

begin

CMD_DrawReady <= drawReady;
CMD_SetStateReady <= setStateReady;
CMD_IA_Idle <= IAIsIdle;
TRISETUP_newTriBegin <= newTriBegin;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);
STAT_CyclesLoadingDataToCache <= std_logic_vector(statCyclesLoadingDataToCache);

DBG_IA_State <= std_logic_vector(to_unsigned(IA_state_t'pos(currentState), 6) );

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when IAstate_readyIdleState =>
					statCyclesIdle <= statCyclesIdle + 1;

				when IAstate_sendTriData | IAstate_sendTriDataNoCulling =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when IAstate_readIndicesA | IAstate_readIndicesB | IAstate_readIndicesC =>
					statCyclesLoadingDataToCache <= statCyclesLoadingDataToCache + 1;

				when others =>
					statCyclesWorking <= statCyclesWorking + 1;
			end case;
		end if;
	end process;

	process(clk)   
		variable vertColorDWORD : unsigned(31 downto 0) := (others => '0');
		variable isCurrentTriangleStripTriEven : std_logic := '0';
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when IAstate_readyIdleState =>
					newTriBegin <= '0';

					SV_PrimitiveID <= x"00000000"; -- Reset the primitive ID as we are done with our previous draw call
					currentIndexA <= x"0000"; -- Reset the index buffer back to 0, 1, 2
					currentIndexB <= x"0001";
					currentIndexC <= x"0002";
					currentIndexValA <= x"0000";
					currentIndexValB <= x"0001";
					currentIndexValC <= x"0002";

					-- Wait for the load or draw signals:
					if (CMD_SetStateEnable = '1' and setStateReady = '1') then
						IAIsIdle <= '0';
						setStateReady <= '0';
						VBO_Ready <= '0';
						cullState <= eCullMode'val(to_integer(unsigned(CMD_StateCullMode) ) );
						indexFormatState <= eIndexFormat'val(to_integer(unsigned(CMD_StateIndexFormat) ) );
						IBAddrBase <= unsigned(CMD_IndexBufferBaseAddr);
						case (eStripCutType'val(to_integer(unsigned(CMD_StateStripCutType) ) ) ) is
							when SCT_Cut0xFFFF =>
								stripCutState <= SCT_Cut0xFFFF;
							when SCT_Cut0xFFFFFFFF =>
								stripCutState <= SCT_Cut0xFFFFFFFF;
							when others => --when SCT_CutDisabled =>
								stripCutState <= SCT_CutDisabled;
						end case;
						case (ePrimTopology'val(to_integer(unsigned(CMD_StatePrimTopology) ) ) ) is
							when PRIMTOP_PointList =>
								primTopologyState <= PRIMTOP_PointList;
							when PRIMTOP_LineList =>
								primTopologyState <= PRIMTOP_LineList;
							when PRIMTOP_LineStrip =>
								primTopologyState <= PRIMTOP_LineStrip;
							when PRIMTOP_TriangleStrip =>
								primTopologyState <= PRIMTOP_TriangleStrip;
							when PRIMTOP_TriangleFan =>
								primTopologyState <= PRIMTOP_TriangleFan;
							when PRIMTOP_ScreenAlignedQuad =>
								primTopologyState <= PRIMTOP_ScreenAlignedQuad;
							when others => --when PRIMTOP_TriangleList =>
								primTopologyState <= PRIMTOP_TriangleList;
						end case;
						currentState <= IAstate_readyIdleState;
					elsif (VBO_Pushed = '1' and drawReady = '1') then
						IAIsIdle <= '0';
						setStateReady <= '0';
						drawReady <= '0';
						VBO_Ready <= '0';
						batchStartingIndex <= unsigned(VBO_BatchStartingIndex);
						batchEndingIndex <= unsigned(VBO_BatchEndingIndex);
						vertexIDPerBatch <= (others => '0');
						indicesUsedPerBatch <= (others => '0');
						if (unsigned(VBO_BatchStartingIndex) = unsigned(VBO_BatchEndingIndex) ) then
							currentDrawIsIndexed <= '0';
						else
							currentDrawIsIndexed <= '1';
						end if;
						if (cullState = CM_CullBoth) then
							-- Do nothing! Skip the whole draw call because we're culling everything today!
						else
							currentState <= IAState_readVertexData;
						end if;
					else
						-- Set our "ready" and "idle" signals (this *is* called the ready-idle state, after all...):
						IAIsIdle <= '1';
						VBO_Ready <= '1';
						drawReady <= '1';
						setStateReady <= '1';
						currentState <= IAstate_readyIdleState;
					end if;

				when IAState_readVertexData =>
					currentVertexData(to_integer(vertexIDPerBatch) ) <= UnpackVertexDataFromBuffer(unsigned(VERTOUT_FIFO_rd_data) );

					if (vertexIDPerBatch = "1111" or VERTOUT_FIFO_empty = '1') then
						vertexIDPerBatch <= (others => '0');
						VERTOUT_FIFO_rd_en <= '0';
						currentState <= IAstate_advanceIndices;
					else
						VERTOUT_FIFO_rd_en <= '1';
						vertexIDPerBatch <= vertexIDPerBatch + 1;
					end if;
					
				when IAstate_sendTriData =>
					TRISETUP_v0PosX <= std_logic_vector(currentTri.v0.pos.vx);
					TRISETUP_v0PosY <= std_logic_vector(currentTri.v0.pos.vy);
					TRISETUP_v0PosInvZ <= std_logic_vector(currentTri.v0.pos.vInvZ(23 downto 0) );

					TRISETUP_tex0_X <= std_logic_vector(currentTri.v0.texcoord.tx);
					TRISETUP_tex0_Y <= std_logic_vector(currentTri.v0.texcoord.ty);

					TRISETUP_vertColor0_RGBA <= std_logic_vector(currentTri.v0.color.a) & std_logic_vector(currentTri.v0.color.b) & std_logic_vector(currentTri.v0.color.g) & std_logic_vector(currentTri.v0.color.r);

					-- Swizzle our output triangles from (0, 1, 2) to (0, 2, 1) if we're doing CW culling instead of CCW culling:
					if (cullState = CM_CullCW) then
						TRISETUP_v1PosX <= std_logic_vector(currentTri.v2.pos.vx);
						TRISETUP_v1PosY <= std_logic_vector(currentTri.v2.pos.vy);
						TRISETUP_v1PosInvZ <= std_logic_vector(currentTri.v2.pos.vInvZ(23 downto 0) );
						TRISETUP_v2PosX <= std_logic_vector(currentTri.v1.pos.vx);
						TRISETUP_v2PosY <= std_logic_vector(currentTri.v1.pos.vy);
						TRISETUP_v2PosInvZ <= std_logic_vector(currentTri.v1.pos.vInvZ(23 downto 0) );

						TRISETUP_tex1_X <= std_logic_vector(currentTri.v2.texcoord.tx);
						TRISETUP_tex1_Y <= std_logic_vector(currentTri.v2.texcoord.ty);
						TRISETUP_tex2_X <= std_logic_vector(currentTri.v1.texcoord.tx);
						TRISETUP_tex2_Y <= std_logic_vector(currentTri.v1.texcoord.ty);

						TRISETUP_vertColor1_RGBA <= std_logic_vector(currentTri.v2.color.a) & std_logic_vector(currentTri.v2.color.b) & std_logic_vector(currentTri.v2.color.g) & std_logic_vector(currentTri.v2.color.r);
						TRISETUP_vertColor2_RGBA <= std_logic_vector(currentTri.v1.color.a) & std_logic_vector(currentTri.v1.color.b) & std_logic_vector(currentTri.v1.color.g) & std_logic_vector(currentTri.v1.color.r);
					else
						TRISETUP_v1PosX <= std_logic_vector(currentTri.v1.pos.vx);
						TRISETUP_v1PosY <= std_logic_vector(currentTri.v1.pos.vy);
						TRISETUP_v1PosInvZ <= std_logic_vector(currentTri.v1.pos.vInvZ(23 downto 0) );
						TRISETUP_v2PosX <= std_logic_vector(currentTri.v2.pos.vx);
						TRISETUP_v2PosY <= std_logic_vector(currentTri.v2.pos.vy);
						TRISETUP_v2PosInvZ <= std_logic_vector(currentTri.v2.pos.vInvZ(23 downto 0) );

						TRISETUP_tex1_X <= std_logic_vector(currentTri.v1.texcoord.tx);
						TRISETUP_tex1_Y <= std_logic_vector(currentTri.v1.texcoord.ty);
						TRISETUP_tex2_X <= std_logic_vector(currentTri.v2.texcoord.tx);
						TRISETUP_tex2_Y <= std_logic_vector(currentTri.v2.texcoord.ty);

						TRISETUP_vertColor1_RGBA <= std_logic_vector(currentTri.v1.color.a) & std_logic_vector(currentTri.v1.color.b) & std_logic_vector(currentTri.v1.color.g) & std_logic_vector(currentTri.v1.color.r);
						TRISETUP_vertColor2_RGBA <= std_logic_vector(currentTri.v2.color.a) & std_logic_vector(currentTri.v2.color.b) & std_logic_vector(currentTri.v2.color.g) & std_logic_vector(currentTri.v2.color.r);
					end if;

					if (newTriBegin = '1' and TRISETUP_readyForNewTri = '1') then
						newTriBegin <= '0';
						if (cullState = CM_CullNone) then
							currentState <= IAstate_sendTriDataNoCulling;
						else
							currentState <= IAstate_advanceIndices;
						end if;
					else
						newTriBegin <= '1';
					end if;

				when IAstate_sendTriDataNoCulling =>
					-- Send the same triangle with a reversed vertex ordering in order to draw the back side of it:
					TRISETUP_v0PosX <= std_logic_vector(currentTri.v0.pos.vx);
					TRISETUP_v0PosY <= std_logic_vector(currentTri.v0.pos.vy);
					TRISETUP_v0PosInvZ <= std_logic_vector(currentTri.v0.pos.vInvZ(23 downto 0) );

					TRISETUP_tex0_X <= std_logic_vector(currentTri.v0.texcoord.tx);
					TRISETUP_tex0_Y <= std_logic_vector(currentTri.v0.texcoord.ty);

					TRISETUP_vertColor0_RGBA <= std_logic_vector(currentTri.v0.color.a) & std_logic_vector(currentTri.v0.color.b) & std_logic_vector(currentTri.v0.color.g) & std_logic_vector(currentTri.v0.color.r);

					TRISETUP_v1PosX <= std_logic_vector(currentTri.v2.pos.vx);
					TRISETUP_v1PosY <= std_logic_vector(currentTri.v2.pos.vy);
					TRISETUP_v1PosInvZ <= std_logic_vector(currentTri.v2.pos.vInvZ(23 downto 0) );
					TRISETUP_v2PosX <= std_logic_vector(currentTri.v1.pos.vx);
					TRISETUP_v2PosY <= std_logic_vector(currentTri.v1.pos.vy);
					TRISETUP_v2PosInvZ <= std_logic_vector(currentTri.v1.pos.vInvZ(23 downto 0) );

					TRISETUP_tex1_X <= std_logic_vector(currentTri.v2.texcoord.tx);
					TRISETUP_tex1_Y <= std_logic_vector(currentTri.v2.texcoord.ty);
					TRISETUP_tex2_X <= std_logic_vector(currentTri.v1.texcoord.tx);
					TRISETUP_tex2_Y <= std_logic_vector(currentTri.v1.texcoord.ty);

					TRISETUP_vertColor1_RGBA <= std_logic_vector(currentTri.v2.color.a) & std_logic_vector(currentTri.v2.color.b) & std_logic_vector(currentTri.v2.color.g) & std_logic_vector(currentTri.v2.color.r);
					TRISETUP_vertColor2_RGBA <= std_logic_vector(currentTri.v1.color.a) & std_logic_vector(currentTri.v1.color.b) & std_logic_vector(currentTri.v1.color.g) & std_logic_vector(currentTri.v1.color.r);

					if (newTriBegin = '1' and TRISETUP_readyForNewTri = '1') then
						newTriBegin <= '0';
						currentState <= IAstate_advanceIndices;
					else
						newTriBegin <= '1';
					end if;

				when IAstate_advanceIndices =>
					SV_PrimitiveID <= SV_PrimitiveID + 1;
                    
					if (currentIndexC < batchEndingIndex) then
						if (currentDrawIsIndexed = '1') then
							IBC_ReadEnable <= '1';
							IBC_ReadAddr <= std_logic_vector(IndexIDToIndexAddress("00" & currentIndexA, IBAddrBase, indexFormatState) );
							currentState <= IAstate_readIndicesA;
						else
							AssembleTrianglesFromVertices(currentIndexA, currentIndexB, currentIndexC, currentVertexData, currentTri);
							isCurrentTriangleStripTriEven := not SV_PrimitiveID(0);
							IncrementIndicesByPrimitiveTopology(currentIndexA, currentIndexB, currentIndexC, primTopologyState, isCurrentTriangleStripTriEven);

							-- For non-indexed draw calls, the vertex index values are just the counting indices
							currentIndexValA <= currentIndexA;
							currentIndexValB <= currentIndexB;
							currentIndexValC <= currentIndexC;
							currentState <= IAstate_sendTriData;
						end if;
					else
						currentState <= IAstate_readyIdleState;
					end if;

				when IAstate_readIndicesA =>
					if (IBC_ReadReady = '1') then
						--currentIndexValA <= unsigned(IBC_ReadData(15 downto 0) );
						IBC_ReadEnable <= '0';
						if (IsIndexAlreadyInBatch(indexTranslation, X"0000" & unsigned(IBC_ReadData(15 downto 0) ) ) = '0') then
							indexTranslation(to_integer(indicesUsedPerBatch) ) <= X"0000" & unsigned(IBC_ReadData(15 downto 0) );
							currentIndexValA <= "000000000000" & indicesUsedPerBatch;
							indicesUsedPerBatch <= indicesUsedPerBatch + 1;
						else
							currentIndexValA <= "000000000000" & GetIndexAlreadyInBatch(indexTranslation, X"0000" & unsigned(IBC_ReadData(15 downto 0) ) );
						end if;
						currentState <= IAstate_readIndicesACooldown;
					else
						IBC_ReadEnable <= '1'; -- IBC_ReadEnable must be held high until IBC_ReadReady is '1'
					end if;

					-- Not sure exactly why yet, but these cooldown states are necessary to prevent the IndexBufferCache from getting stuck in a state where
					-- it never properly empties the incoming memory responses queue (this freezes the memory controller, and the whole GPU with it).
				when IAstate_readIndicesACooldown =>
					if (IBC_ReadReady = '0') then
						IBC_ReadEnable <= '1';
						IBC_ReadAddr <= std_logic_vector(IndexIDToIndexAddress("00" & currentIndexB, IBAddrBase, indexFormatState) );
						currentState <= IAstate_readIndicesB;
					end if;

				when IAstate_readIndicesB =>
					if (IBC_ReadReady = '1') then
						--currentIndexValB <= unsigned(IBC_ReadData(15 downto 0) );
						IBC_ReadEnable <= '0';
						if (IsIndexAlreadyInBatch(indexTranslation, X"0000" & unsigned(IBC_ReadData(15 downto 0) ) ) = '0') then
							indexTranslation(to_integer(indicesUsedPerBatch) ) <= X"0000" & unsigned(IBC_ReadData(15 downto 0) );
							currentIndexValB <= "000000000000" & indicesUsedPerBatch;
							indicesUsedPerBatch <= indicesUsedPerBatch + 1;
						else
							currentIndexValB <= "000000000000" & GetIndexAlreadyInBatch(indexTranslation, X"0000" & unsigned(IBC_ReadData(15 downto 0) ) );
						end if;
						currentState <= IAstate_readIndicesBCooldown;
					else
						IBC_ReadEnable <= '1'; -- IBC_ReadEnable must be held high until IBC_ReadReady is '1'
					end if;

				when IAstate_readIndicesBCooldown =>
					if (IBC_ReadReady = '0') then
						IBC_ReadEnable <= '1';
						IBC_ReadAddr <= std_logic_vector(IndexIDToIndexAddress("00" & currentIndexC, IBAddrBase, indexFormatState) );
						currentState <= IAstate_readIndicesC;
					end if;

				when IAstate_readIndicesC =>
					if (IBC_ReadReady = '1') then
						IBC_ReadEnable <= '0';
						--currentIndexValC <= unsigned(IBC_ReadData(15 downto 0) );
						if (IsIndexAlreadyInBatch(indexTranslation, X"0000" & unsigned(IBC_ReadData(15 downto 0) ) ) = '0') then
							indexTranslation(to_integer(indicesUsedPerBatch) ) <= X"0000" & unsigned(IBC_ReadData(15 downto 0) );
							currentIndexValC <= "000000000000" & indicesUsedPerBatch;
							indicesUsedPerBatch <= indicesUsedPerBatch + 1;
						else
							currentIndexValC <= "000000000000" & GetIndexAlreadyInBatch(indexTranslation, X"0000" & unsigned(IBC_ReadData(15 downto 0) ) );
						end if;
						currentState <= IAstate_readIndicesCCooldown;
					else
						IBC_ReadEnable <= '1'; -- IBC_ReadEnable must be held high until IBC_ReadReady is '1'
					end if;

				when IAstate_readIndicesCCooldown =>
					IBC_ReadEnable <= '0';
					if (IBC_ReadReady = '0') then
						currentState <= IAstate_indexedAssemble;
					end if;

				when IAstate_indexedAssemble =>
					AssembleTrianglesFromVertices(currentIndexValA, currentIndexValB, currentIndexValC, currentVertexData, currentTri);
					isCurrentTriangleStripTriEven := not SV_PrimitiveID(0);
					IncrementIndicesByPrimitiveTopology(currentIndexA, currentIndexB, currentIndexC, primTopologyState, isCurrentTriangleStripTriEven);
					currentState <= IAstate_sendTriData;

			end case;
		end if;
	end process;

end Behavioral;
