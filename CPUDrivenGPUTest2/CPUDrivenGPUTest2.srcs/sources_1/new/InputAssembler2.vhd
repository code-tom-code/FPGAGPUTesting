library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
library IEEE;
use IEEE.NUMERIC_STD.ALL;

-- Include our packet definition file so that we can use the loadVertexStreamType enum type defined in there
library work;
use work.PacketType.all;

use work.FloatALU_Types.all;
use work.FloatCommon.all;
use work.ClipTypes.all;
use work.ClipCommon.all;

entity InputAssembler2 is
	Port (clk : in STD_LOGIC;

	-- Clip unit interfaces begin
		CLIP_v0PosX : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_v0PosY : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_v0PosZ : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_v0PosW : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_v1PosX : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_v1PosY : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_v1PosZ : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_v1PosW : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_v2PosX : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_v2PosY : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_v2PosZ : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_v2PosW : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_tex0_X : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_tex0_Y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_tex1_X : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_tex1_Y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_tex2_X : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_tex2_Y : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
		CLIP_vertColor0_RGBA : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		CLIP_vertColor1_RGBA : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		CLIP_vertColor2_RGBA : out STD_LOGIC_VECTOR(127 downto 0) := (others => '0');
		CLIP_v0ClipCodes : out STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
		CLIP_v1ClipCodes : out STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
		CLIP_v2ClipCodes : out STD_LOGIC_VECTOR(10 downto 0) := (others => '0');
		CLIP_AABBTriOverlapsViewport : out STD_LOGIC := '0';
		CLIP_readyForNewTri : in STD_LOGIC;
		CLIP_newTriBegin : out STD_LOGIC := '0';
	-- Clip unit interfaces end

	-- Vertex Batch Output (VBO) interfaces begin
		VBO_Pushed : in STD_LOGIC; -- Set to 1 when we've completed pushing our next fully shaded batch of output verts
		VBO_NumVertices : in STD_LOGIC_VECTOR(4 downto 0);
		VBO_NumIndices : in STD_LOGIC_VECTOR(6 downto 0);
		VBO_IsIndexedDrawCall : in STD_LOGIC;
		VBO_Ready : out STD_LOGIC := '0'; -- Set to 1 when we're ready for more vertices
		VERTOUT_FIFO_empty : in STD_LOGIC;
		VERTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR(319 downto 0);
		VERTOUT_FIFO_rd_en : out STD_LOGIC := '0';
		INDEXOUT_FIFO_empty : in STD_LOGIC;
		INDEXOUT_FIFO_rd_data : in STD_LOGIC_VECTOR(255 downto 0);
		INDEXOUT_FIFO_rd_en : out STD_LOGIC := '0';
	-- Vertex Batch Output (VBO) interfaces end

	-- Command processor interfaces begin
		CMD_DrawReady : out STD_LOGIC := '0';

		CMD_SetStateReady : out STD_LOGIC := '0';
		CMD_SetStateEnable : in STD_LOGIC;
		CMD_StateCullMode : in STD_LOGIC_VECTOR(1 downto 0);
		CMD_StatePrimTopology : in STD_LOGIC_VECTOR(2 downto 0);

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
		DBG_IA_VertexIDPerBatch : out STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
		DBG_IA_CurrentTriIndices : out STD_LOGIC_VECTOR(11 downto 0) := (others => '0')
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

ATTRIBUTE X_INTERFACE_INFO of INDEXOUT_FIFO_rd_data : SIGNAL is "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO RD_DATA";
ATTRIBUTE X_INTERFACE_INFO of INDEXOUT_FIFO_rd_en : SIGNAL is "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO RD_EN";
ATTRIBUTE X_INTERFACE_INFO of INDEXOUT_FIFO_empty : SIGNAL is "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO EMPTY";

component AABB2DOverlapViewport
	port(
-- Triangle data in
	inv0x : in STD_LOGIC_VECTOR(31 downto 0);
	inv0y : in STD_LOGIC_VECTOR(31 downto 0);

	inv1x : in STD_LOGIC_VECTOR(31 downto 0);
	inv1y : in STD_LOGIC_VECTOR(31 downto 0);

	inv2x : in STD_LOGIC_VECTOR(31 downto 0);
	inv2y : in STD_LOGIC_VECTOR(31 downto 0);
-- End Triangle data in

-- Intersection test signal out
	outWholeTriangleAABBIntersectsViewport : out STD_LOGIC := '0'
-- End intersection test signal out
	);
end component;

type IA_state_t is (
	IAstate_readyIdleState, -- 0

	IAstate_sendTriData, -- 1
	IAstate_sendTriDataNoCulling, -- 2

	IAState_readIndexData, -- 3
	IAState_readVertexData, -- 4
	IAState_readVertexDataCooldown, -- 5

	IAstate_advanceIndices -- 6
);
    
type vertexPosClipSpace is record
	vx : unsigned(31 downto 0); -- float32 position X value
	vy : unsigned(31 downto 0); -- float32 position Y value
	vz : unsigned(31 downto 0); -- float32 position Z value
	vw : unsigned(31 downto 0); -- float32 position W value
end record vertexPosClipSpace;

type vertexTexcoord is record
	tx : unsigned(31 downto 0); -- float32 texcoord TX (U) value
	ty : unsigned(31 downto 0); -- float32 texcoord TY (V) value
end record vertexTexcoord;

type vertexColor is record
	r : unsigned(31 downto 0);
	g : unsigned(31 downto 0);
	b : unsigned(31 downto 0);
	a : unsigned(31 downto 0);
end record vertexColor;
    
type vertexData is record
	pos : vertexPosClipSpace;
	texcoord : vertexTexcoord;
	color : vertexColor;
	clipCodes : std_logic_vector(10 downto 0);
end record vertexData;

type triangleData is record
	v0 : vertexData;
	v1 : vertexData;
	v2 : vertexData;
end record triangleData;

type indexTriplet is record
	i0 : unsigned(15 downto 0);
	i1 : unsigned(15 downto 0);
	i2 : unsigned(15 downto 0);
end record indexTriplet;

type vertexDataBatch is array(15 downto 0) of vertexData;

type indexBatchArray is array(63 downto 0) of unsigned(3 downto 0);

type constantIndexArray is array(11 downto 0) of indexTriplet;

procedure AssembleTrianglesFromVertices(signal indexBase : in unsigned(6 downto 0); signal indexData : in indexBatchArray; signal vertexData : in vertexDataBatch; signal fillTriangle : out triangleData) is
begin
	fillTriangle.v0 <= vertexData(to_integer(indexData(to_integer(indexBase * 3) ) ) );
	fillTriangle.v1 <= vertexData(to_integer(indexData(to_integer(indexBase * 3 + 1) ) ) );
	fillTriangle.v2 <= vertexData(to_integer(indexData(to_integer(indexBase * 3 + 2) ) ) );
end procedure;

pure function UnpackVertexDataFromBuffer(vertDataBits : unsigned(319 downto 0) ) return vertexData is
	variable ret : vertexData;
begin
	ret.pos.vx := vertDataBits(32*1-1 downto 32*0);
	ret.pos.vy := vertDataBits(32*2-1 downto 32*1);
	ret.pos.vz := vertDataBits(32*3-1 downto 32*2);
	ret.pos.vw := vertDataBits(32*4-1 downto 32*3);
	ret.texcoord.tx := vertDataBits(32*5-1 downto 32*4);
	ret.texcoord.ty := vertDataBits(32*6-1 downto 32*5);
	ret.color.r := vertDataBits(32*7-1 downto 32*6);
	ret.color.g := vertDataBits(32*8-1 downto 32*7);
	ret.color.b := vertDataBits(32*9-1 downto 32*8);
	ret.color.a := vertDataBits(32*10-1 downto 32*9);
	ret.clipCodes := ComputeClipOutCodes(vertDataBits(32*1-1 downto 32*0), vertDataBits(32*2-1 downto 32*1), vertDataBits(32*3-1 downto 32*2), vertDataBits(32*4-1 downto 32*3) );
	return ret;
end function;
    
signal currentState : IA_state_t := IAstate_readyIdleState;

signal currentTri : triangleData;
signal currentVertexData : vertexDataBatch;
signal currentIndexData : indexBatchArray := (others => (others => '0') );

signal cullState : eCullMode := CM_CullCCW;
signal primTopologyState : ePrimTopology := PRIMTOP_TriangleList;

-- Primitive number that resets to 0 at the start of each new vertex batch
signal SV_PrimitiveID : unsigned(6 downto 0) := (others => '0');
signal LastPrimitiveIDIsOdd : std_logic := '0';

signal currentDrawIsIndexed : std_logic := '1'; -- If 1 then this is an indexed draw call (ie. DrawIndexedPrimitive), if 0 then this is a non-indexed draw call (ie. DrawPrimitive)

signal verticesUsedPerBatch : unsigned(4 downto 0) := (others => '0');
signal indicesUsedPerBatch : unsigned(6 downto 0) := (others => '0');

signal vertexIDPerBatch : unsigned(4 downto 0) := (others => '0');

-- These signals are tied directly to output ports:
signal drawReady : std_logic := '0';
signal setStateReady : std_logic := '0';
signal IAIsIdle : std_logic := '0';
signal newTriBegin : std_logic := '0';
signal wholeTriangleAABBIntersectsViewport : std_logic := '0';

signal statCyclesIdle : unsigned(31 downto 0) := (others => '0');
signal statCyclesWorking : unsigned(31 downto 0) := (others => '0');
signal statCyclesLoadingDataToCache : unsigned(31 downto 0) := (others => '0');
signal statCyclesWaitingForOutput : unsigned(31 downto 0) := (others => '0');

begin

instIA2_AABB2DOverlapViewport : AABB2DOverlapViewport port map (inv0x => std_logic_vector(currentTri.v0.pos.vx), inv0y => std_logic_vector(currentTri.v0.pos.vy),
	inv1x => std_logic_vector(currentTri.v1.pos.vx), inv1y => std_logic_vector(currentTri.v1.pos.vy),
	inv2x => std_logic_vector(currentTri.v2.pos.vx), inv2y => std_logic_vector(currentTri.v2.pos.vy),
	outWholeTriangleAABBIntersectsViewport => wholeTriangleAABBIntersectsViewport);

CMD_DrawReady <= drawReady;
CMD_SetStateReady <= setStateReady;
CMD_IA_Idle <= IAIsIdle;
CLIP_newTriBegin <= newTriBegin;
CLIP_AABBTriOverlapsViewport <= wholeTriangleAABBIntersectsViewport;

STAT_CyclesIdle <= std_logic_vector(statCyclesIdle);
STAT_CyclesSpentWorking <= std_logic_vector(statCyclesWorking);
STAT_CyclesWaitingForOutput <= std_logic_vector(statCyclesWaitingForOutput);
STAT_CyclesLoadingDataToCache <= std_logic_vector(statCyclesLoadingDataToCache);

DBG_IA_State <= std_logic_vector(to_unsigned(IA_state_t'pos(currentState), 6) );
DBG_IA_VertexIDPerBatch <= std_logic_vector(vertexIDPerBatch(3 downto 0) );

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when IAstate_readyIdleState =>
					statCyclesIdle <= statCyclesIdle + 1;

				when IAstate_sendTriData | IAstate_sendTriDataNoCulling =>
					statCyclesWaitingForOutput <= statCyclesWaitingForOutput + 1;

				when IAState_readVertexData | IAState_readVertexDataCooldown | IAState_readIndexData =>
					statCyclesLoadingDataToCache <= statCyclesLoadingDataToCache + 1;

				when others =>
					statCyclesWorking <= statCyclesWorking + 1;
			end case;
		end if;
	end process;

	process(clk)
	begin
		if (rising_edge(clk) ) then
			case currentState is
				when IAstate_readyIdleState =>
					newTriBegin <= '0';
					IAIsIdle <= '0';

					SV_PrimitiveID <= (others => '0'); -- Reset the primitive ID as we are done with our previous draw call

					if (setStateReady = '1' and CMD_SetStateEnable = '0' and drawReady = '1' and VBO_Pushed = '0') then
						IAIsIdle <= '1';
					end if;

					-- Wait for the load or draw signals:
					if (CMD_SetStateEnable = '1' and setStateReady = '1') then
						setStateReady <= '0';
						VBO_Ready <= '0';
						cullState <= eCullMode'val(to_integer(unsigned(CMD_StateCullMode) ) );
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
						setStateReady <= '0';
						drawReady <= '0';
						VBO_Ready <= '0';
						vertexIDPerBatch <= (others => '0');
						verticesUsedPerBatch <= unsigned(VBO_NumVertices);
						indicesUsedPerBatch <= unsigned(VBO_NumIndices);
						currentDrawIsIndexed <= VBO_IsIndexedDrawCall;
						if (cullState = CM_CullBoth) then
							-- Do nothing! Skip the whole draw call because we're culling everything today!
						else
							currentState <= IAState_readIndexData;
						end if;
					else
						-- Set our "ready" and "idle" signals (this *is* called the ready-idle state, after all...):
						VBO_Ready <= '1';
						drawReady <= '1';
						setStateReady <= '1';
						currentState <= IAstate_readyIdleState;
					end if;

				when IAState_readIndexData =>
					for i in 0 to 63 loop
						currentIndexData(i) <= unsigned(INDEXOUT_FIFO_rd_data( (i + 1) * 4 - 1 downto i * 4) );
					end loop;
					INDEXOUT_FIFO_rd_en <= '1';
					currentState <= IAState_readVertexData;

				when IAState_readVertexData =>
					INDEXOUT_FIFO_rd_en <= '0'; -- Deassert after one clock cycle

					currentVertexData(to_integer(vertexIDPerBatch) ) <= UnpackVertexDataFromBuffer(unsigned(VERTOUT_FIFO_rd_data) );

					if (vertexIDPerBatch(3 downto 0) = "1111" or VERTOUT_FIFO_empty = '1') then
						vertexIDPerBatch <= (others => '0');
						VERTOUT_FIFO_rd_en <= '1';
						currentState <= IAstate_advanceIndices;
					else
						VERTOUT_FIFO_rd_en <= '1';
						vertexIDPerBatch <= vertexIDPerBatch + 1;
						currentState <= IAState_readVertexDataCooldown;
					end if;

				when IAState_readVertexDataCooldown =>
					VERTOUT_FIFO_rd_en <= '0'; -- Deassert after one clock cycle
					currentState <= IAState_readVertexData;
					
				when IAstate_sendTriData =>
					CLIP_v0PosX <= std_logic_vector(currentTri.v0.pos.vx);
					CLIP_v0PosY <= std_logic_vector(currentTri.v0.pos.vy);
					CLIP_v0PosZ <= std_logic_vector(currentTri.v0.pos.vz);
					CLIP_v0PosW <= std_logic_vector(currentTri.v0.pos.vw);

					CLIP_tex0_X <= std_logic_vector(currentTri.v0.texcoord.tx);
					CLIP_tex0_Y <= std_logic_vector(currentTri.v0.texcoord.ty);

					CLIP_vertColor0_RGBA <= std_logic_vector(currentTri.v0.color.a) & std_logic_vector(currentTri.v0.color.b) & std_logic_vector(currentTri.v0.color.g) & std_logic_vector(currentTri.v0.color.r);

					CLIP_v0ClipCodes <= currentTri.v0.clipCodes;

					-- Swizzle our output triangles from (0, 1, 2) to (0, 2, 1) if we're doing CW culling instead of CCW culling:
					if (cullState = CM_CullCW) then
						CLIP_v1PosX <= std_logic_vector(currentTri.v2.pos.vx);
						CLIP_v1PosY <= std_logic_vector(currentTri.v2.pos.vy);
						CLIP_v1PosZ <= std_logic_vector(currentTri.v2.pos.vz);
						CLIP_v1PosW <= std_logic_vector(currentTri.v2.pos.vw);
						CLIP_v2PosX <= std_logic_vector(currentTri.v1.pos.vx);
						CLIP_v2PosY <= std_logic_vector(currentTri.v1.pos.vy);
						CLIP_v2PosZ <= std_logic_vector(currentTri.v1.pos.vz);
						CLIP_v2PosW <= std_logic_vector(currentTri.v1.pos.vw);

						CLIP_tex1_X <= std_logic_vector(currentTri.v2.texcoord.tx);
						CLIP_tex1_Y <= std_logic_vector(currentTri.v2.texcoord.ty);
						CLIP_tex2_X <= std_logic_vector(currentTri.v1.texcoord.tx);
						CLIP_tex2_Y <= std_logic_vector(currentTri.v1.texcoord.ty);

						CLIP_vertColor1_RGBA <= std_logic_vector(currentTri.v2.color.a) & std_logic_vector(currentTri.v2.color.b) & std_logic_vector(currentTri.v2.color.g) & std_logic_vector(currentTri.v2.color.r);
						CLIP_vertColor2_RGBA <= std_logic_vector(currentTri.v1.color.a) & std_logic_vector(currentTri.v1.color.b) & std_logic_vector(currentTri.v1.color.g) & std_logic_vector(currentTri.v1.color.r);

						CLIP_v1ClipCodes <= currentTri.v2.clipCodes;
						CLIP_v2ClipCodes <= currentTri.v1.clipCodes;
					else
						CLIP_v1PosX <= std_logic_vector(currentTri.v1.pos.vx);
						CLIP_v1PosY <= std_logic_vector(currentTri.v1.pos.vy);
						CLIP_v1PosZ <= std_logic_vector(currentTri.v1.pos.vz);
						CLIP_v1PosW <= std_logic_vector(currentTri.v1.pos.vw);
						CLIP_v2PosX <= std_logic_vector(currentTri.v2.pos.vx);
						CLIP_v2PosY <= std_logic_vector(currentTri.v2.pos.vy);
						CLIP_v2PosZ <= std_logic_vector(currentTri.v2.pos.vz);
						CLIP_v2PosW <= std_logic_vector(currentTri.v2.pos.vw);

						CLIP_tex1_X <= std_logic_vector(currentTri.v1.texcoord.tx);
						CLIP_tex1_Y <= std_logic_vector(currentTri.v1.texcoord.ty);
						CLIP_tex2_X <= std_logic_vector(currentTri.v2.texcoord.tx);
						CLIP_tex2_Y <= std_logic_vector(currentTri.v2.texcoord.ty);

						CLIP_vertColor1_RGBA <= std_logic_vector(currentTri.v1.color.a) & std_logic_vector(currentTri.v1.color.b) & std_logic_vector(currentTri.v1.color.g) & std_logic_vector(currentTri.v1.color.r);
						CLIP_vertColor2_RGBA <= std_logic_vector(currentTri.v2.color.a) & std_logic_vector(currentTri.v2.color.b) & std_logic_vector(currentTri.v2.color.g) & std_logic_vector(currentTri.v2.color.r);

						CLIP_v1ClipCodes <= currentTri.v1.clipCodes;
						CLIP_v2ClipCodes <= currentTri.v2.clipCodes;
					end if;

					if (newTriBegin = '1' and CLIP_readyForNewTri = '1') then
						newTriBegin <= '0';
						if (cullState = CM_CullNone) then
							currentState <= IAstate_sendTriDataNoCulling;
						else
							if (SV_PrimitiveID * 3 > indicesUsedPerBatch) then
								currentState <= IAstate_readyIdleState;
							else
								currentState <= IAstate_advanceIndices;
							end if;
						end if;
					else
						newTriBegin <= '1';
					end if;

				when IAstate_sendTriDataNoCulling =>
					-- Send the same triangle with a reversed vertex ordering in order to draw the back side of it:
					CLIP_v0PosX <= std_logic_vector(currentTri.v0.pos.vx);
					CLIP_v0PosY <= std_logic_vector(currentTri.v0.pos.vy);
					CLIP_v0PosZ <= std_logic_vector(currentTri.v0.pos.vz);
					CLIP_v0PosW <= std_logic_vector(currentTri.v0.pos.vw);

					CLIP_tex0_X <= std_logic_vector(currentTri.v0.texcoord.tx);
					CLIP_tex0_Y <= std_logic_vector(currentTri.v0.texcoord.ty);

					CLIP_vertColor0_RGBA <= std_logic_vector(currentTri.v0.color.a) & std_logic_vector(currentTri.v0.color.b) & std_logic_vector(currentTri.v0.color.g) & std_logic_vector(currentTri.v0.color.r);

					CLIP_v0ClipCodes <= currentTri.v0.clipCodes;

					CLIP_v1PosX <= std_logic_vector(currentTri.v2.pos.vx);
					CLIP_v1PosY <= std_logic_vector(currentTri.v2.pos.vy);
					CLIP_v1PosZ <= std_logic_vector(currentTri.v2.pos.vz);
					CLIP_v1PosW <= std_logic_vector(currentTri.v2.pos.vw);
					CLIP_v2PosX <= std_logic_vector(currentTri.v1.pos.vx);
					CLIP_v2PosY <= std_logic_vector(currentTri.v1.pos.vy);
					CLIP_v2PosZ <= std_logic_vector(currentTri.v1.pos.vz);
					CLIP_v2PosW <= std_logic_vector(currentTri.v1.pos.vw);

					CLIP_tex1_X <= std_logic_vector(currentTri.v2.texcoord.tx);
					CLIP_tex1_Y <= std_logic_vector(currentTri.v2.texcoord.ty);
					CLIP_tex2_X <= std_logic_vector(currentTri.v1.texcoord.tx);
					CLIP_tex2_Y <= std_logic_vector(currentTri.v1.texcoord.ty);

					CLIP_vertColor1_RGBA <= std_logic_vector(currentTri.v2.color.a) & std_logic_vector(currentTri.v2.color.b) & std_logic_vector(currentTri.v2.color.g) & std_logic_vector(currentTri.v2.color.r);
					CLIP_vertColor2_RGBA <= std_logic_vector(currentTri.v1.color.a) & std_logic_vector(currentTri.v1.color.b) & std_logic_vector(currentTri.v1.color.g) & std_logic_vector(currentTri.v1.color.r);
					CLIP_v1ClipCodes <= currentTri.v2.clipCodes;
					CLIP_v2ClipCodes <= currentTri.v1.clipCodes;

					if (newTriBegin = '1' and CLIP_readyForNewTri = '1') then
						newTriBegin <= '0';
						if (SV_PrimitiveID * 3 > indicesUsedPerBatch) then
							currentState <= IAstate_readyIdleState;
						else
							currentState <= IAstate_advanceIndices;
						end if;
					else
						newTriBegin <= '1';
					end if;

				when IAstate_advanceIndices =>
					VERTOUT_FIFO_rd_en <= '0';

					DBG_IA_CurrentTriIndices(3 downto 0) <= std_logic_vector(currentIndexData(to_integer(SV_PrimitiveID * 3) ) );
					DBG_IA_CurrentTriIndices(7 downto 4) <= std_logic_vector(currentIndexData(to_integer(SV_PrimitiveID * 3 + 1) ) );
					DBG_IA_CurrentTriIndices(11 downto 8) <= std_logic_vector(currentIndexData(to_integer(SV_PrimitiveID * 3 + 2) ) );

					AssembleTrianglesFromVertices(SV_PrimitiveID,
						currentIndexData,
						currentVertexData,
						currentTri);

					SV_PrimitiveID <= SV_PrimitiveID + 1;
                    
					currentState <= IAstate_sendTriData;

			end case;
		end if;
	end process;

end Behavioral;
