-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 17:59:08 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_InputAssembler2_0_0/MainDesign_InputAssembler2_0_0_stub.vhdl
-- Design      : MainDesign_InputAssembler2_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_InputAssembler2_0_0 is
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
    VERTOUT_FIFO_almost_empty : in STD_LOGIC;
    VERTOUT_FIFO_rd_data : in STD_LOGIC_VECTOR ( 319 downto 0 );
    VERTOUT_FIFO_rd_en : out STD_LOGIC;
    INDEXOUT_FIFO_empty : in STD_LOGIC;
    INDEXOUT_FIFO_almost_empty : in STD_LOGIC;
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

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_InputAssembler2_0_0 : entity is "MainDesign_InputAssembler2_0_0,InputAssembler2,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_InputAssembler2_0_0 : entity is "MainDesign_InputAssembler2_0_0,InputAssembler2,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=InputAssembler2,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_InputAssembler2_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_InputAssembler2_0_0 : entity is "module_ref";
end MainDesign_InputAssembler2_0_0;

architecture stub of MainDesign_InputAssembler2_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,CLIP_v0PosX[31:0],CLIP_v0PosY[31:0],CLIP_v0PosZ[31:0],CLIP_v0PosW[31:0],CLIP_v1PosX[31:0],CLIP_v1PosY[31:0],CLIP_v1PosZ[31:0],CLIP_v1PosW[31:0],CLIP_v2PosX[31:0],CLIP_v2PosY[31:0],CLIP_v2PosZ[31:0],CLIP_v2PosW[31:0],CLIP_tex0_X[31:0],CLIP_tex0_Y[31:0],CLIP_tex1_X[31:0],CLIP_tex1_Y[31:0],CLIP_tex2_X[31:0],CLIP_tex2_Y[31:0],CLIP_vertColor0_RGBA[127:0],CLIP_vertColor1_RGBA[127:0],CLIP_vertColor2_RGBA[127:0],CLIP_v0ClipCodes[10:0],CLIP_v1ClipCodes[10:0],CLIP_v2ClipCodes[10:0],CLIP_CurrentDrawEventID[15:0],CLIP_AABBTriOverlapsViewport,CLIP_readyForNewTri,CLIP_newTriBegin,VBO_Pushed,VBO_NumVertices[4:0],VBO_NumIndices[6:0],VBO_IsIndexedDrawCall,VBO_Ready,VERTOUT_FIFO_empty,VERTOUT_FIFO_almost_empty,VERTOUT_FIFO_rd_data[319:0],VERTOUT_FIFO_rd_en,INDEXOUT_FIFO_empty,INDEXOUT_FIFO_almost_empty,INDEXOUT_FIFO_rd_data[271:0],INDEXOUT_FIFO_rd_en,STATE_StateBitsAtDrawID[4:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,CMD_IA_Idle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesLoadingDataToCache[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_IA_State[5:0],DBG_IA_VertexIDPerBatch[3:0],DBG_IA_CurrentTriIndices[11:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF VERTOUT_FIFO:INDEXOUT_FIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of VERTOUT_FIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO EMPTY";
  attribute x_interface_mode of VERTOUT_FIFO_empty : signal is "master VERTOUT_FIFO";
  attribute x_interface_info of VERTOUT_FIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO ALMOST_EMPTY";
  attribute x_interface_info of VERTOUT_FIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO RD_DATA";
  attribute x_interface_mode of VERTOUT_FIFO_rd_data : signal is "master";
  attribute x_interface_info of VERTOUT_FIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO RD_EN";
  attribute x_interface_info of INDEXOUT_FIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO EMPTY";
  attribute x_interface_mode of INDEXOUT_FIFO_empty : signal is "master INDEXOUT_FIFO";
  attribute x_interface_info of INDEXOUT_FIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO ALMOST_EMPTY";
  attribute x_interface_info of INDEXOUT_FIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO RD_DATA";
  attribute x_interface_mode of INDEXOUT_FIFO_rd_data : signal is "master";
  attribute x_interface_info of INDEXOUT_FIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO RD_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "InputAssembler2,Vivado 2025.2";
begin
end;
