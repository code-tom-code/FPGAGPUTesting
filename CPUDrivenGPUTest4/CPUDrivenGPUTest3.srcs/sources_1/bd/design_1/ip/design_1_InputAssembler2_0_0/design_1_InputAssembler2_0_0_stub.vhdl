-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sat Apr 26 19:25:04 2025
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_InputAssembler2_0_0/design_1_InputAssembler2_0_0_stub.vhdl
-- Design      : design_1_InputAssembler2_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_InputAssembler2_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    CLIP_v0PosX : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0PosY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0PosZ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v0PosW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1PosX : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1PosY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1PosZ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v1PosW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2PosX : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2PosY : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2PosZ : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_v2PosW : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex0_X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex0_Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex1_X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex1_Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex2_X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_tex2_Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    CLIP_vertColor0_RGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_vertColor1_RGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_vertColor2_RGBA : out STD_LOGIC_VECTOR ( 127 downto 0 );
    CLIP_v0ClipCodes : out STD_LOGIC_VECTOR ( 10 downto 0 );
    CLIP_v1ClipCodes : out STD_LOGIC_VECTOR ( 10 downto 0 );
    CLIP_v2ClipCodes : out STD_LOGIC_VECTOR ( 10 downto 0 );
    CLIP_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    CLIP_AABBTriOverlapsViewport : out STD_LOGIC;
    CLIP_readyForNewTri : in STD_LOGIC;
    CLIP_newTriBegin : out STD_LOGIC;
    VBO_Pushed : in STD_LOGIC;
    VBO_NumVertices : in STD_LOGIC_VECTOR ( 4 downto 0 );
    VBO_NumIndices : in STD_LOGIC_VECTOR ( 6 downto 0 );
    VBO_IsIndexedDrawCall : in STD_LOGIC;
    VBO_Ready : out STD_LOGIC;
    VERTOUT_FIFO_empty : in STD_LOGIC;
    VERTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR ( 319 downto 0 );
    VERTOUT_FIFO_rd_en : out STD_LOGIC;
    INDEXOUT_FIFO_empty : in STD_LOGIC;
    INDEXOUT_FIFO_rd_data : in STD_LOGIC_VECTOR ( 271 downto 0 );
    INDEXOUT_FIFO_rd_en : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 4 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    CMD_IA_Idle : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesLoadingDataToCache : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_IA_State : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_IA_VertexIDPerBatch : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_IA_CurrentTriIndices : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );

end design_1_InputAssembler2_0_0;

architecture stub of design_1_InputAssembler2_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,CLIP_v0PosX[31:0],CLIP_v0PosY[31:0],CLIP_v0PosZ[31:0],CLIP_v0PosW[31:0],CLIP_v1PosX[31:0],CLIP_v1PosY[31:0],CLIP_v1PosZ[31:0],CLIP_v1PosW[31:0],CLIP_v2PosX[31:0],CLIP_v2PosY[31:0],CLIP_v2PosZ[31:0],CLIP_v2PosW[31:0],CLIP_tex0_X[31:0],CLIP_tex0_Y[31:0],CLIP_tex1_X[31:0],CLIP_tex1_Y[31:0],CLIP_tex2_X[31:0],CLIP_tex2_Y[31:0],CLIP_vertColor0_RGBA[127:0],CLIP_vertColor1_RGBA[127:0],CLIP_vertColor2_RGBA[127:0],CLIP_v0ClipCodes[10:0],CLIP_v1ClipCodes[10:0],CLIP_v2ClipCodes[10:0],CLIP_CurrentDrawEventID[15:0],CLIP_AABBTriOverlapsViewport,CLIP_readyForNewTri,CLIP_newTriBegin,VBO_Pushed,VBO_NumVertices[4:0],VBO_NumIndices[6:0],VBO_IsIndexedDrawCall,VBO_Ready,VERTOUT_FIFO_empty,VERTOUT_FIFO_rd_data[319:0],VERTOUT_FIFO_rd_en,INDEXOUT_FIFO_empty,INDEXOUT_FIFO_rd_data[271:0],INDEXOUT_FIFO_rd_en,STATE_StateBitsAtDrawID[4:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,CMD_IA_Idle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesLoadingDataToCache[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_IA_State[5:0],DBG_IA_VertexIDPerBatch[3:0],DBG_IA_CurrentTriIndices[11:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "InputAssembler2,Vivado 2018.1_AR73068";
begin
end;
