library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
library IEEE;
use IEEE.NUMERIC_STD.ALL;

-- Include our packet definition file so that we can use the loadVertexStreamType enum type defined in there
library work;
use work.PacketType.all;

entity InputAssembler is
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

	-- Memory controller interfaces begin
		IAReadRequestsFIFO_full : in STD_LOGIC;
		IAReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR(30-1 downto 0) := (others => '0');
		IAReadRequestsFIFO_wr_en : out STD_LOGIC := '0';

		IAReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR(30+256-1 downto 0);
        IAReadResponsesFIFO_empty : in STD_LOGIC;
        IAReadResponsesFIFO_rd_en : out STD_LOGIC := '0';
	-- Memory controller interfaces end

	-- Vertex buffer XPos cache BRAM interfaces begin
		VBXPosCache_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		VBXPosCache_dina : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		VBXPosCache_douta : in STD_LOGIC_VECTOR(15 downto 0);
		VBXPosCache_ena : out STD_LOGIC := '0';
		VBXPosCache_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	-- Vertex buffer XPos cache BRAM interfaces end

	-- Vertex buffer YPos cache BRAM interfaces begin
		VBYPosCache_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		VBYPosCache_dina : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		VBYPosCache_douta : in STD_LOGIC_VECTOR(15 downto 0);
		VBYPosCache_ena : out STD_LOGIC := '0';
		VBYPosCache_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	-- Vertex buffer YPos cache BRAM interfaces end

	-- Vertex buffer InvZPos cache BRAM interfaces begin
		VBInvZPosCache_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		VBInvZPosCache_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		VBInvZPosCache_douta : in STD_LOGIC_VECTOR(31 downto 0);
		VBInvZPosCache_ena : out STD_LOGIC := '0';
		VBInvZPosCache_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	-- Vertex buffer InvZPos cache BRAM interfaces end

	-- Vertex buffer texXPos cache BRAM interfaces begin
		VBTexXCache_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		VBTexXCache_dina : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		VBTexXCache_douta : in STD_LOGIC_VECTOR(15 downto 0);
		VBTexXCache_ena : out STD_LOGIC := '0';
		VBTexXCache_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	-- Vertex buffer texXPos cache BRAM interfaces end

	-- Vertex buffer texYPos cache BRAM interfaces begin
		VBTexYCache_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		VBTexYCache_dina : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		VBTexYCache_douta : in STD_LOGIC_VECTOR(15 downto 0);
		VBTexYCache_ena : out STD_LOGIC := '0';
		VBTexYCache_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	-- Vertex buffer texYPos cache BRAM interfaces end

	-- Vertex buffer vert color cache BRAM interfaces begin
		VBColorCache_addra : out STD_LOGIC_VECTOR(9 downto 0) := (others => '0');
		VBColorCache_dina : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		VBColorCache_douta : in STD_LOGIC_VECTOR(31 downto 0);
		VBColorCache_ena : out STD_LOGIC := '0';
		VBColorCache_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	-- Vertex buffer vert color cache BRAM interfaces end

	-- Index buffer cache BRAM interfaces begin
		IBCache_addra : out STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
		IBCache_dina : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		IBCache_douta : in STD_LOGIC_VECTOR(15 downto 0);
		IBCache_ena : out STD_LOGIC := '0';
		IBCache_wea : out STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
	-- Index buffer cache BRAM interfaces end

	-- Command processor interfaces begin
		CMD_DrawReady : out STD_LOGIC := '0';
		CMD_LaunchDrawSignal : in STD_LOGIC;
		CMD_DrawIsIndexed : in STD_LOGIC; -- If 1 then this is an indexed draw call (ie. DrawIndexedPrimitive), if 0 then this is a non-indexed draw call (ie. DrawPrimitive)
		CMD_DrawIndexCount : in STD_LOGIC_VECTOR(15 downto 0);

		CMD_LoadBufferReady : out STD_LOGIC := '0';
		CMD_LoadBufferEnable : in STD_LOGIC;
		CMD_LoadBufferAddress : in STD_LOGIC_VECTOR(29 downto 0);
		CMD_LoadBufferType : in STD_LOGIC_VECTOR(2 downto 0);
		CMD_LoadBufferElementCount : in STD_LOGIC_VECTOR(15 downto 0);
		CMD_LoadAllElementsIdentical : in STD_LOGIC;

		CMD_SetStateReady : out STD_LOGIC := '0';
		CMD_SetStateEnable : in STD_LOGIC;
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
		DBG_IA_State : out STD_LOGIC_VECTOR(5 downto 0) := (others => '0');
		DBG_VertexIndex0 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_VertexIndex1 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_VertexIndex2 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_VertexIndexVal0 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_VertexIndexVal1 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_VertexIndexVal2 : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_LastWrittenVertexXPos : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		DBG_LastReadVertexXPos : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
		DBG_LastReadVertexXPosCacheIndex : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0')
		);
end InputAssembler;

architecture Behavioral of InputAssembler is

attribute RAM_STYLE : string;
ATTRIBUTE X_INTERFACE_INFO : STRING;

ATTRIBUTE X_INTERFACE_INFO of IAReadRequestsFIFO_wr_data: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IAReadRequests WR_DATA";
ATTRIBUTE X_INTERFACE_INFO of IAReadRequestsFIFO_wr_en: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IAReadRequests WR_EN";
ATTRIBUTE X_INTERFACE_INFO of IAReadRequestsFIFO_full: SIGNAL is "xilinx.com:interface:fifo_write:1.0 IAReadRequests FULL";

ATTRIBUTE X_INTERFACE_INFO of IAReadResponsesFIFO_rd_data: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IAReadResponses RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of IAReadResponsesFIFO_rd_en: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IAReadResponses RD_EN";
ATTRIBUTE X_INTERFACE_INFO of IAReadResponsesFIFO_empty: SIGNAL is "xilinx.com:interface:fifo_read:1.0 IAReadResponses EMPTY";

ATTRIBUTE X_INTERFACE_INFO of VBXPosCache_ena: SIGNAL is "xilinx.com:interface:bram:1.0 VBXPosCache EN";
ATTRIBUTE X_INTERFACE_INFO of VBXPosCache_douta: SIGNAL is "xilinx.com:interface:bram:1.0 VBXPosCache DOUT";
ATTRIBUTE X_INTERFACE_INFO of VBXPosCache_dina: SIGNAL is "xilinx.com:interface:bram:1.0 VBXPosCache DIN";
ATTRIBUTE X_INTERFACE_INFO of VBXPosCache_wea: SIGNAL is "xilinx.com:interface:bram:1.0 VBXPosCache WE";
ATTRIBUTE X_INTERFACE_INFO of VBXPosCache_addra: SIGNAL is "xilinx.com:interface:bram:1.0 VBXPosCache ADDR";

ATTRIBUTE X_INTERFACE_INFO of VBYPosCache_ena: SIGNAL is "xilinx.com:interface:bram:1.0 VBYPosCache EN";
ATTRIBUTE X_INTERFACE_INFO of VBYPosCache_douta: SIGNAL is "xilinx.com:interface:bram:1.0 VBYPosCache DOUT";
ATTRIBUTE X_INTERFACE_INFO of VBYPosCache_dina: SIGNAL is "xilinx.com:interface:bram:1.0 VBYPosCache DIN";
ATTRIBUTE X_INTERFACE_INFO of VBYPosCache_wea: SIGNAL is "xilinx.com:interface:bram:1.0 VBYPosCache WE";
ATTRIBUTE X_INTERFACE_INFO of VBYPosCache_addra: SIGNAL is "xilinx.com:interface:bram:1.0 VBYPosCache ADDR";

ATTRIBUTE X_INTERFACE_INFO of VBInvZPosCache_ena: SIGNAL is "xilinx.com:interface:bram:1.0 VBInvZPosCache EN";
ATTRIBUTE X_INTERFACE_INFO of VBInvZPosCache_douta: SIGNAL is "xilinx.com:interface:bram:1.0 VBInvZPosCache DOUT";
ATTRIBUTE X_INTERFACE_INFO of VBInvZPosCache_dina: SIGNAL is "xilinx.com:interface:bram:1.0 VBInvZPosCache DIN";
ATTRIBUTE X_INTERFACE_INFO of VBInvZPosCache_wea: SIGNAL is "xilinx.com:interface:bram:1.0 VBInvZPosCache WE";
ATTRIBUTE X_INTERFACE_INFO of VBInvZPosCache_addra: SIGNAL is "xilinx.com:interface:bram:1.0 VBInvZPosCache ADDR";

ATTRIBUTE X_INTERFACE_INFO of VBTexXCache_ena: SIGNAL is "xilinx.com:interface:bram:1.0 VBTexXCache EN";
ATTRIBUTE X_INTERFACE_INFO of VBTexXCache_douta: SIGNAL is "xilinx.com:interface:bram:1.0 VBTexXCache DOUT";
ATTRIBUTE X_INTERFACE_INFO of VBTexXCache_dina: SIGNAL is "xilinx.com:interface:bram:1.0 VBTexXCache DIN";
ATTRIBUTE X_INTERFACE_INFO of VBTexXCache_wea: SIGNAL is "xilinx.com:interface:bram:1.0 VBTexXCache WE";
ATTRIBUTE X_INTERFACE_INFO of VBTexXCache_addra: SIGNAL is "xilinx.com:interface:bram:1.0 VBTexXCache ADDR";

ATTRIBUTE X_INTERFACE_INFO of VBTexYCache_ena: SIGNAL is "xilinx.com:interface:bram:1.0 VBTexYCache EN";
ATTRIBUTE X_INTERFACE_INFO of VBTexYCache_douta: SIGNAL is "xilinx.com:interface:bram:1.0 VBTexYCache DOUT";
ATTRIBUTE X_INTERFACE_INFO of VBTexYCache_dina: SIGNAL is "xilinx.com:interface:bram:1.0 VBTexYCache DIN";
ATTRIBUTE X_INTERFACE_INFO of VBTexYCache_wea: SIGNAL is "xilinx.com:interface:bram:1.0 VBTexYCache WE";
ATTRIBUTE X_INTERFACE_INFO of VBTexYCache_addra: SIGNAL is "xilinx.com:interface:bram:1.0 VBTexYCache ADDR";

ATTRIBUTE X_INTERFACE_INFO of VBColorCache_ena: SIGNAL is "xilinx.com:interface:bram:1.0 VBColorCache EN";
ATTRIBUTE X_INTERFACE_INFO of VBColorCache_douta: SIGNAL is "xilinx.com:interface:bram:1.0 VBColorCache DOUT";
ATTRIBUTE X_INTERFACE_INFO of VBColorCache_dina: SIGNAL is "xilinx.com:interface:bram:1.0 VBColorCache DIN";
ATTRIBUTE X_INTERFACE_INFO of VBColorCache_wea: SIGNAL is "xilinx.com:interface:bram:1.0 VBColorCache WE";
ATTRIBUTE X_INTERFACE_INFO of VBColorCache_addra: SIGNAL is "xilinx.com:interface:bram:1.0 VBColorCache ADDR";

ATTRIBUTE X_INTERFACE_INFO of IBCache_ena: SIGNAL is "xilinx.com:interface:bram:1.0 IBCache EN";
ATTRIBUTE X_INTERFACE_INFO of IBCache_douta: SIGNAL is "xilinx.com:interface:bram:1.0 IBCache DOUT";
ATTRIBUTE X_INTERFACE_INFO of IBCache_dina: SIGNAL is "xilinx.com:interface:bram:1.0 IBCache DIN";
ATTRIBUTE X_INTERFACE_INFO of IBCache_wea: SIGNAL is "xilinx.com:interface:bram:1.0 IBCache WE";
ATTRIBUTE X_INTERFACE_INFO of IBCache_addra: SIGNAL is "xilinx.com:interface:bram:1.0 IBCache ADDR";

signal currentIndexA : unsigned(15 downto 0) := x"0000";
signal currentIndexB : unsigned(15 downto 0) := x"0001";
signal currentIndexC : unsigned(15 downto 0) := x"0002";

signal currentIndexValA : unsigned(15 downto 0) := (others => '0');
signal currentIndexValB : unsigned(15 downto 0) := (others => '0');
signal currentIndexValC : unsigned(15 downto 0) := (others => '0');

signal currentVertColor : unsigned(31 downto 0) := (others => '0');

signal IBAddr : STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
signal IBDin : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal IBEn : STD_LOGIC := '0';
signal IBWe : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');

type IA_state_t is (
	IAstate_readyIdleState, -- 0

	IAstate_sendTriData, -- 1
	IAstate_sendTriDataNoCulling, -- 2

	IAstate_advanceIndices, -- 3
	IAstate_readIndicesA, -- 4
	IAstate_readIndicesA2, -- 5
	IAstate_readIndicesB, -- 6
	IAstate_readIndicesB2, -- 7
	IAstate_readIndicesC, -- 8
	IAstate_readIndicesC2, -- 9
	IAstate_degenerateTriangleSkipCheck, -- 10
	IAstate_readVertsInit, -- 11
	IAstate_readVertsA, -- 12
	IAstate_readVertsA2, -- 13
	IAstate_readVertsB, -- 14
	IAstate_readVertsB2, -- 15
	IAstate_readVertsC, -- 16
	IAstate_readVertsC2, -- 17

	IAstate_loadCacheLoop, -- 18
	IAstate_loadCacheLoop_readMemLine, -- 19
	IAstate_loadCacheLoop_extractFromLine, -- 20
	IAstate_fillCacheLoop -- 21
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

type loadRequestData is record
	BufferAddress : unsigned(31 downto 0);
	BufferElementCount : unsigned(15 downto 0);
	CurrentElementIndex : unsigned(15 downto 0);
	ElementsRemainingThisLine : unsigned(5 downto 0);
	BufferType : unsigned(2 downto 0);
	AllElementsIdentical : std_logic;
end record loadRequestData;

pure function GetElementSizeBits(vertexStreamType : unsigned(2 downto 0) ) return integer is
begin
	case vertexStreamType is
		when to_unsigned(loadVertexStreamType'pos(VST_xPos), 3) =>
			return 16;
		when to_unsigned(loadVertexStreamType'pos(VST_yPos), 3) =>
			return 16;
		when to_unsigned(loadVertexStreamType'pos(VST_invZPos), 3) =>
			return 32;
		when to_unsigned(loadVertexStreamType'pos(VST_tx), 3) =>
			return 16;
		when to_unsigned(loadVertexStreamType'pos(VST_ty), 3) =>
			return 16;
		when to_unsigned(loadVertexStreamType'pos(VST_vertColor), 3) =>
			return 32;
		when to_unsigned(loadVertexStreamType'pos(VST_index), 3) =>
			return 16;
		when others =>
			return 8;
	end case;
end function;

-- DRAM lines are 32 bytes (256 bits) long
pure function GetElementCountPerDRAMLine(vertexStreamType : unsigned(2 downto 0) ) return unsigned is
begin
	case vertexStreamType is
		when to_unsigned(loadVertexStreamType'pos(VST_xPos), 3) =>
			return to_unsigned(16, 6);
		when to_unsigned(loadVertexStreamType'pos(VST_yPos), 3) =>
			return to_unsigned(16, 6);
		when to_unsigned(loadVertexStreamType'pos(VST_invZPos), 3) =>
			return to_unsigned(8, 6);
		when to_unsigned(loadVertexStreamType'pos(VST_tx), 3) =>
			return to_unsigned(16, 6);
		when to_unsigned(loadVertexStreamType'pos(VST_ty), 3) =>
			return to_unsigned(16, 6);
		when to_unsigned(loadVertexStreamType'pos(VST_vertColor), 3) =>
			return to_unsigned(8, 6);
		when to_unsigned(loadVertexStreamType'pos(VST_index), 3) =>
			return to_unsigned(16, 6);
		when others =>
			return to_unsigned(32, 6);
	end case;
end function;

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
    
signal currentState : IA_state_t := IAstate_readyIdleState;

signal currentTri : triangleData;

signal currentLoadRequest : loadRequestData;

signal lastWrittenVertexXPos : unsigned(31 downto 0) := (others => '0');
signal lastReadVertexXPos : signed(15 downto 0) := (others => '0');

signal incomingDRAMLine : unsigned(255 downto 0) := (others => '0');

signal cullState : eCullMode := CM_CullCCW;
signal primTopologyState : ePrimTopology := PRIMTOP_TriangleList;
signal stripCutState : eStripCutType := SCT_CutDisabled;
signal indexFormatState : eIndexFormat := IBFMT_NoIndices;

signal stats_totalTrianglesDegenerateIndexCulled : unsigned(11 downto 0) := (others => '0');
signal stats_totalTrianglesPassed : unsigned(11 downto 0) := (others => '0');

-- Primitive number that resets to 0 at the start of each Draw() call
signal SV_PrimitiveID : unsigned(31 downto 0) := (others => '0');
signal LastPrimitiveIDIsOdd : std_logic := '0';

signal currentDrawIndexCount : unsigned(15 downto 0) := (others => '0');
signal currentDrawIsIndexed : std_logic := '1'; -- If 1 then this is an indexed draw call (ie. DrawIndexedPrimitive), if 0 then this is a non-indexed draw call (ie. DrawPrimitive)

signal drawReady : std_logic := '0';
signal loadBufferReady : std_logic := '0';
signal setStateReady : std_logic := '0';
signal IAIsIdle : std_logic := '0';
signal newTriBegin : std_logic := '0';

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesLoadingDataToCache : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

begin

CMD_DrawReady <= drawReady;
CMD_LoadBufferReady <= loadBufferReady;
CMD_SetStateReady <= setStateReady;
CMD_IA_Idle <= IAIsIdle;
TRISETUP_newTriBegin <= newTriBegin;

IBCache_addra <= IBAddr;
IBCache_dina <= IBDin;
IBCache_ena <= IBEn;
IBCache_wea <= IBWe;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);
STAT_CyclesLoadingDataToCache <= std_logic_vector(statCyclesLoadingDataToCache);

DBG_IA_State <= std_logic_vector(to_unsigned(IA_state_t'pos(currentState), 6) );
DBG_VertexIndex0 <= std_logic_vector(currentIndexA);
DBG_VertexIndex1 <= std_logic_vector(currentIndexB);
DBG_VertexIndex2 <= std_logic_vector(currentIndexC);
DBG_VertexIndexVal0 <= std_logic_vector(currentIndexValA);
DBG_VertexIndexVal1 <= std_logic_vector(currentIndexValB);
DBG_VertexIndexVal2 <= std_logic_vector(currentIndexValC);
DBG_LastWrittenVertexXPos <= std_logic_vector(lastWrittenVertexXPos);
DBG_LastReadVertexXPos <= std_logic_vector(lastReadVertexXPos);

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when IAstate_readyIdleState =>
					statCyclesIdle <= statCyclesIdle + 1;

				when IAstate_sendTriData | IAstate_sendTriDataNoCulling =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when IAstate_loadCacheLoop | IAstate_loadCacheLoop_readMemLine | IAstate_loadCacheLoop_extractFromLine =>
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
					IAReadRequestsFIFO_wr_en <= '0';
					IAReadResponsesFIFO_rd_en <= '0';
					newTriBegin <= '0';

					IBWe <= (others => '0'); -- Deassert the IB cache enables/writeenables in case they were activated from the inner loop
					IBEn <= '0';

					VBXPosCache_ena <= '0';
					VBYPosCache_ena <= '0';
					VBInvZPosCache_ena <= '0';
					VBTexXCache_ena <= '0';
					VBTexYCache_ena <= '0';
					VBColorCache_ena <= '0';

					VBXPosCache_wea <= (others => '0');
					VBYPosCache_wea <= (others => '0');
					VBInvZPosCache_wea <= (others => '0');
					VBTexXCache_wea <= (others => '0');
					VBTexYCache_wea <= (others => '0');
					VBColorCache_wea <= (others => '0');

					SV_PrimitiveID <= x"00000000"; -- Reset the primitive ID as we are done with our previous draw call
					currentIndexA <= x"0000"; -- Reset the index buffer back to 0, 1, 2
					currentIndexB <= x"0001";
					currentIndexC <= x"0002";
					currentIndexValA <= x"0000";
					currentIndexValB <= x"0001";
					currentIndexValC <= x"0002";

					-- Wait for the load or draw signals:
					if (CMD_LoadBufferEnable = '1' and loadBufferReady = '1') then
						currentLoadRequest.BufferAddress <= "00" & unsigned(CMD_LoadBufferAddress);
						currentLoadRequest.BufferElementCount <= unsigned(CMD_LoadBufferElementCount);
						currentLoadRequest.BufferType <= unsigned(CMD_LoadBufferType);
						currentLoadRequest.ElementsRemainingThisLine <= (others => '0');
						currentLoadRequest.CurrentElementIndex <= x"0000";
						currentLoadRequest.AllElementsIdentical <= CMD_LoadAllElementsIdentical;
						IAIsIdle <= '0';
						loadBufferReady <= '0';
						drawReady <= '0';
						setStateReady <= '0';
						currentState <= IAstate_loadCacheLoop;
					elsif (CMD_SetStateEnable = '1' and setStateReady = '1') then
						IAIsIdle <= '0';
						setStateReady <= '0';
						loadBufferReady <= '0';
						cullState <= eCullMode'val(to_integer(unsigned(CMD_StateCullMode) ) );
						indexFormatState <= eIndexFormat'val(to_integer(unsigned(CMD_StateIndexFormat) ) );
						case (unsigned(CMD_StateStripCutType) ) is
							when to_unsigned(eStripCutType'pos(SCT_Cut0xFFFF), 2) =>
								stripCutState <= SCT_Cut0xFFFF;
							when to_unsigned(eStripCutType'pos(SCT_Cut0xFFFFFFFF), 2) =>
								stripCutState <= SCT_Cut0xFFFFFFFF;
							when others => --when to_unsigned(eStripCutType'pos(SCT_CutDisabled), 2) =>
								stripCutState <= SCT_CutDisabled;
						end case;
						case (unsigned(CMD_StatePrimTopology) ) is
							when to_unsigned(ePrimTopology'pos(PRIMTOP_PointList), 3) =>
								primTopologyState <= PRIMTOP_PointList;
							when to_unsigned(ePrimTopology'pos(PRIMTOP_LineList), 3) =>
								primTopologyState <= PRIMTOP_LineList;
							when to_unsigned(ePrimTopology'pos(PRIMTOP_LineStrip), 3) =>
								primTopologyState <= PRIMTOP_LineStrip;
							when to_unsigned(ePrimTopology'pos(PRIMTOP_TriangleStrip), 3) =>
								primTopologyState <= PRIMTOP_TriangleStrip;
							when to_unsigned(ePrimTopology'pos(PRIMTOP_TriangleFan), 3) =>
								primTopologyState <= PRIMTOP_TriangleFan;
							when to_unsigned(ePrimTopology'pos(PRIMTOP_ScreenAlignedQuad), 3) =>
								primTopologyState <= PRIMTOP_ScreenAlignedQuad;
							when others => --when to_unsigned(ePrimTopology'pos(PRIMTOP_TriangleList), 3) =>
								primTopologyState <= PRIMTOP_TriangleList;
						end case;
						currentState <= IAstate_readyIdleState;
					elsif (CMD_LaunchDrawSignal = '1' and drawReady = '1') then
						IAIsIdle <= '0';
						setStateReady <= '0';
						loadBufferReady <= '0';
						drawReady <= '0';
						if (cullState = CM_CullBoth) then
							-- Do nothing! Skip the whole draw call because we're culling everything today!
						else
							currentDrawIndexCount <= unsigned(CMD_DrawIndexCount);
							currentDrawIsIndexed <= CMD_DrawIsIndexed;
							IBAddr <= (others => '0');
							IBWe <= (others => '0');
							currentState <= IAstate_advanceIndices;
						end if;
					else
						-- Set our "ready" and "idle" signals (this *is* called the ready-idle state, after all...):
						IAIsIdle <= '1';
						loadBufferReady <= '1';
						drawReady <= '1';
						setStateReady <= '1';
						currentState <= IAstate_readyIdleState;
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
                    
					stats_totalTrianglesPassed <= stats_totalTrianglesPassed + 1;

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
                    
					if (currentIndexC < currentDrawIndexCount) then
						if (currentDrawIsIndexed = '1') then
							IBAddr <= std_logic_vector(currentIndexA(10 downto 0) );
							IBEn <= '1';
							IBWe <= (others => '0');
							currentState <= IAstate_readIndicesA;
						else
							isCurrentTriangleStripTriEven := not SV_PrimitiveID(0);
							IncrementIndicesByPrimitiveTopology(currentIndexA, currentIndexB, currentIndexC, primTopologyState, isCurrentTriangleStripTriEven);

							-- For non-indexed draw calls, the vertex index values are just the counting indices
							currentIndexValA <= currentIndexA;
							currentIndexValB <= currentIndexB;
							currentIndexValC <= currentIndexC;
							currentState <= IAstate_readVertsInit; -- We can save a few cycles and skip reading from the index buffer in this case
						end if;
					else
						currentState <= IAstate_readyIdleState;
					end if;

				when IAstate_readIndicesA =>
					currentState <= IAstate_readIndicesA2;

				when IAstate_readIndicesA2 =>
					currentIndexValA <= unsigned(IBCache_douta);
					IBAddr <= std_logic_vector(currentIndexB(10 downto 0) );
					IBEn <= '1';
					IBWe <= (others => '0');
					currentState <= IAstate_readIndicesB;

				when IAstate_readIndicesB =>
					currentState <= IAstate_readIndicesB2;

				when IAstate_readIndicesB2 =>
					currentIndexValB <= unsigned(IBCache_douta);
					IBAddr <= std_logic_vector(currentIndexC(10 downto 0) );
					IBEn <= '1';
					IBWe <= (others => '0');
					currentState <= IAstate_readIndicesC;

				when IAstate_readIndicesC =>
					currentState <= IAstate_readIndicesC2;

				when IAstate_readIndicesC2 =>
					currentIndexValC <= unsigned(IBCache_douta);

					isCurrentTriangleStripTriEven := SV_PrimitiveID(0);
					IncrementIndicesByPrimitiveTopology(currentIndexA, currentIndexB, currentIndexC, primTopologyState, isCurrentTriangleStripTriEven);

					IBEn <= '0';
					IBWe <= (others => '0');
					currentState <= IAstate_degenerateTriangleSkipCheck;

				when IAstate_degenerateTriangleSkipCheck =>
					if ( (currentIndexValA = currentIndexValB) or
						(currentIndexValA = currentIndexValC) or
						(currentIndexValB = currentIndexValC) ) then
						stats_totalTrianglesDegenerateIndexCulled <= stats_totalTrianglesDegenerateIndexCulled + 1;
						currentState <= IAstate_advanceIndices; -- Skip reading the vertex buffer if this triangle's indices are the same
					else
						currentState <= IAstate_readVertsInit;
					end if;

				when IAstate_readVertsInit =>
					VBXPosCache_addra <= std_logic_vector(currentIndexValA(9 downto 0) );
					VBYPosCache_addra <= std_logic_vector(currentIndexValA(9 downto 0) );
					VBInvZPosCache_addra <= std_logic_vector(currentIndexValA(9 downto 0) );
					VBTexXCache_addra <= std_logic_vector(currentIndexValA(9 downto 0) );
					VBTexYCache_addra <= std_logic_vector(currentIndexValA(9 downto 0) );
					VBColorCache_addra <= std_logic_vector(currentIndexValA(9 downto 0) );

					VBXPosCache_ena <= '1';
					VBYPosCache_ena <= '1';
					VBInvZPosCache_ena <= '1';
					VBTexXCache_ena <= '1';
					VBTexYCache_ena <= '1';
					VBColorCache_ena <= '1';

					currentState <= IAstate_readVertsA;

				when IAstate_readVertsA =>
					currentState <= IAstate_readVertsA2;

				when IAstate_readVertsA2 =>
					currentTri.v0.pos.vx <= signed(VBXPosCache_douta);
					lastReadVertexXPos <= signed(VBXPosCache_douta);
					DBG_LastReadVertexXPosCacheIndex <= std_logic_vector(currentIndexValA);
					currentTri.v0.pos.vy <= signed(VBYPosCache_douta);
					currentTri.v0.pos.vInvZ <= unsigned(VBInvZPosCache_douta);
					currentTri.v0.texcoord.tx <= unsigned(VBTexXCache_douta);
					currentTri.v0.texcoord.ty <= unsigned(VBTexYCache_douta);
					vertColorDWORD := unsigned(VBColorCache_douta);
					currentTri.v0.color.r <= vertColorDWORD(8-1 downto 0);
					currentTri.v0.color.g <= vertColorDWORD(16-1 downto 8);
					currentTri.v0.color.b <= vertColorDWORD(24-1 downto 16);
					currentTri.v0.color.a <= vertColorDWORD(32-1 downto 24);

					VBXPosCache_addra <= std_logic_vector(currentIndexValB(9 downto 0) );
					VBYPosCache_addra <= std_logic_vector(currentIndexValB(9 downto 0) );
					VBInvZPosCache_addra <= std_logic_vector(currentIndexValB(9 downto 0) );
					VBTexXCache_addra <= std_logic_vector(currentIndexValB(9 downto 0) );
					VBTexYCache_addra <= std_logic_vector(currentIndexValB(9 downto 0) );
					VBColorCache_addra <= std_logic_vector(currentIndexValB(9 downto 0) );

					currentState <= IAstate_readVertsB;

				when IAstate_readVertsB =>
					currentState <= IAstate_readVertsB2;

				when IAstate_readVertsB2 =>
					currentTri.v1.pos.vx <= signed(VBXPosCache_douta);
					currentTri.v1.pos.vy <= signed(VBYPosCache_douta);
					currentTri.v1.pos.vInvZ <= unsigned(VBInvZPosCache_douta);
					currentTri.v1.texcoord.tx <= unsigned(VBTexXCache_douta);
					currentTri.v1.texcoord.ty <= unsigned(VBTexYCache_douta);
					vertColorDWORD := unsigned(VBColorCache_douta);
					currentTri.v1.color.r <= vertColorDWORD(8-1 downto 0);
					currentTri.v1.color.g <= vertColorDWORD(16-1 downto 8);
					currentTri.v1.color.b <= vertColorDWORD(24-1 downto 16);
					currentTri.v1.color.a <= vertColorDWORD(32-1 downto 24);

					VBXPosCache_addra <= std_logic_vector(currentIndexValC(9 downto 0) );
					VBYPosCache_addra <= std_logic_vector(currentIndexValC(9 downto 0) );
					VBInvZPosCache_addra <= std_logic_vector(currentIndexValC(9 downto 0) );
					VBTexXCache_addra <= std_logic_vector(currentIndexValC(9 downto 0) );
					VBTexYCache_addra <= std_logic_vector(currentIndexValC(9 downto 0) );
					VBColorCache_addra <= std_logic_vector(currentIndexValC(9 downto 0) );

					currentState <= IAstate_readVertsC;

				when IAstate_readVertsC =>

					currentState <= IAstate_readVertsC2;

				when IAstate_readVertsC2 =>
					currentTri.v2.pos.vx <= signed(VBXPosCache_douta);
					currentTri.v2.pos.vy <= signed(VBYPosCache_douta);
					currentTri.v2.pos.vInvZ <= unsigned(VBInvZPosCache_douta);
					currentTri.v2.texcoord.tx <= unsigned(VBTexXCache_douta);
					currentTri.v2.texcoord.ty <= unsigned(VBTexYCache_douta);
					vertColorDWORD := unsigned(VBColorCache_douta);
					currentTri.v2.color.r <= vertColorDWORD(8-1 downto 0);
					currentTri.v2.color.g <= vertColorDWORD(16-1 downto 8);
					currentTri.v2.color.b <= vertColorDWORD(24-1 downto 16);
					currentTri.v2.color.a <= vertColorDWORD(32-1 downto 24);

					VBXPosCache_ena <= '0';
					VBYPosCache_ena <= '0';
					VBInvZPosCache_ena <= '0';
					VBTexXCache_ena <= '0';
					VBTexYCache_ena <= '0';
					VBColorCache_ena <= '0';

					currentState <= IAstate_sendTriData;

				when IAstate_loadCacheLoop =>
					IBWe <= (others => '0'); -- Deassert the IB cache enables/writeenables in case they were activated from the inner loop
					IBEn <= '0';

					VBXPosCache_ena <= '0';
					VBYPosCache_ena <= '0';
					VBInvZPosCache_ena <= '0';
					VBTexXCache_ena <= '0';
					VBTexYCache_ena <= '0';
					VBColorCache_ena <= '0';

					VBXPosCache_wea <= (others => '0');
					VBYPosCache_wea <= (others => '0');
					VBInvZPosCache_wea <= (others => '0');
					VBTexXCache_wea <= (others => '0');
					VBTexYCache_wea <= (others => '0');
					VBColorCache_wea <= (others => '0');

					if (currentLoadRequest.AllElementsIdentical = '1') then
						currentState <= IAstate_fillCacheLoop;
					else
						if (IAReadRequestsFIFO_full = '0') then
							IAReadRequestsFIFO_wr_en <= '1';
							IAReadRequestsFIFO_wr_data <= std_logic_vector(currentLoadRequest.BufferAddress(29 downto 0) );
							currentLoadRequest.BufferAddress <= currentLoadRequest.BufferAddress + 32; -- Increment the read pointer by one DRAM line
							currentState <= IAstate_loadCacheLoop_readMemLine;
						else
							IAReadRequestsFIFO_wr_en <= '0';
						end if;
					end if;

				when IAstate_loadCacheLoop_readMemLine =>
					IAReadRequestsFIFO_wr_en <= '0'; -- Deassert after one clock cycle
					if (IAReadResponsesFIFO_empty = '0') then
						incomingDRAMLine <= unsigned(IAReadResponsesFIFO_rd_data(256-1 downto 0) );
						currentLoadRequest.ElementsRemainingThisLine <= GetElementCountPerDRAMLine(currentLoadRequest.BufferType);
						IAReadResponsesFIFO_rd_en <= '1';

						currentState <= IAstate_loadCacheLoop_extractFromLine;
					else
						IAReadResponsesFIFO_rd_en <= '0';
					end if;

				when IAstate_loadCacheLoop_extractFromLine =>
					IAReadResponsesFIFO_rd_en <= '0'; -- Deassert after one clock cycle
					case (loadVertexStreamType'val(to_integer(currentLoadRequest.BufferType) ) ) is
						when VST_xPos =>
							VBXPosCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBXPosCache_dina <= std_logic_vector(incomingDRAMLine(15 downto 0) );
							VBXPosCache_ena <= '1';
							VBXPosCache_wea <= (others => '1');
							lastWrittenVertexXPos <= incomingDRAMLine(31 downto 0);
						when VST_yPos =>
							VBYPosCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBYPosCache_dina <= std_logic_vector(incomingDRAMLine(15 downto 0) );
							VBYPosCache_ena <= '1';
							VBYPosCache_wea <= (others => '1');
						when VST_invZPos =>
							VBInvZPosCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBInvZPosCache_dina <= std_logic_vector(incomingDRAMLine(31 downto 0) );
							VBInvZPosCache_ena <= '1';
							VBInvZPosCache_wea <= (others => '1');
						when VST_tx =>
							VBTexXCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBTexXCache_dina <= std_logic_vector(incomingDRAMLine(15 downto 0) );
							VBTexXCache_ena <= '1';
							VBTexXCache_wea <= (others => '1');
						when VST_ty =>
							VBTexYCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBTexYCache_dina <= std_logic_vector(incomingDRAMLine(15 downto 0) );
							VBTexYCache_ena <= '1';
							VBTexYCache_wea <= (others => '1');
						when VST_vertColor =>
							VBColorCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBColorCache_dina <= std_logic_vector(incomingDRAMLine(31 downto 0) );
							VBColorCache_ena <= '1';
							VBColorCache_wea <= (others => '1');
						when VST_index =>
							IBAddr <= std_logic_vector(currentLoadRequest.CurrentElementIndex(10 downto 0) );
							IBDin <= std_logic_vector(incomingDRAMLine(15 downto 0) );
							IBEn <= '1';
							IBWe <= (others => '1');
						when others =>
							-- Do nothing
					end case;

					currentLoadRequest.CurrentElementIndex <= currentLoadRequest.CurrentElementIndex + 1;
					currentLoadRequest.ElementsRemainingThisLine <= currentLoadRequest.ElementsRemainingThisLine - 1;
					currentLoadRequest.BufferElementCount <= currentLoadRequest.BufferElementCount - 1;

					-- Shift the DRAM row down to the next element
					incomingDRAMLine <= incomingDRAMLine srl GetElementSizeBits(currentLoadRequest.BufferType);

					if (currentLoadRequest.BufferElementCount <= 1) then
						currentState <= IAstate_readyIdleState; -- Load to cache is fully completed!
					elsif (currentLoadRequest.ElementsRemainingThisLine <= 1) then
						currentState <= IAstate_loadCacheLoop; -- Head back up the loop to request more data from DRAM
					else
						currentState <= IAstate_loadCacheLoop_extractFromLine; -- Do another DRAM line loop iteration
					end if;

				when IAstate_fillCacheLoop =>
					case (loadVertexStreamType'val(to_integer(currentLoadRequest.BufferType) ) ) is
						when VST_xPos =>
							VBXPosCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBXPosCache_dina <= std_logic_vector(currentLoadRequest.BufferAddress(15 downto 0) );
							VBXPosCache_ena <= '1';
							VBXPosCache_wea <= (others => '1');
							lastWrittenVertexXPos <= currentLoadRequest.BufferAddress(31 downto 0);
						when VST_yPos =>
							VBYPosCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBYPosCache_dina <= std_logic_vector(currentLoadRequest.BufferAddress(15 downto 0) );
							VBYPosCache_ena <= '1';
							VBYPosCache_wea <= (others => '1');
						when VST_invZPos =>
							VBInvZPosCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBInvZPosCache_dina <= std_logic_vector(currentLoadRequest.BufferAddress(31 downto 0) );
							VBInvZPosCache_ena <= '1';
							VBInvZPosCache_wea <= (others => '1');
						when VST_tx =>
							VBTexXCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBTexXCache_dina <= std_logic_vector(currentLoadRequest.BufferAddress(15 downto 0) );
							VBTexXCache_ena <= '1';
							VBTexXCache_wea <= (others => '1');
						when VST_ty =>
							VBTexYCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBTexYCache_dina <= std_logic_vector(currentLoadRequest.BufferAddress(15 downto 0) );
							VBTexYCache_ena <= '1';
							VBTexYCache_wea <= (others => '1');
						when VST_vertColor =>
							VBColorCache_addra <= std_logic_vector(currentLoadRequest.CurrentElementIndex(9 downto 0) );
							VBColorCache_dina <= std_logic_vector(currentLoadRequest.BufferAddress(31 downto 0) );
							VBColorCache_ena <= '1';
							VBColorCache_wea <= (others => '1');
						when VST_index =>
							IBAddr <= std_logic_vector(currentLoadRequest.CurrentElementIndex(10 downto 0) );
							IBDin <= std_logic_vector(currentLoadRequest.BufferAddress(15 downto 0) );
							IBEn <= '1';
							IBWe <= (others => '1');
						when others =>
							-- Do nothing
					end case;
					currentLoadRequest.CurrentElementIndex <= currentLoadRequest.CurrentElementIndex + 1;

					if (currentLoadRequest.CurrentElementIndex < currentLoadRequest.BufferElementCount) then
						currentState <= IAstate_fillCacheLoop;
					else
						currentState <= IAstate_readyIdleState;
					end if;

			end case;
		end if;
	end process;

end Behavioral;
