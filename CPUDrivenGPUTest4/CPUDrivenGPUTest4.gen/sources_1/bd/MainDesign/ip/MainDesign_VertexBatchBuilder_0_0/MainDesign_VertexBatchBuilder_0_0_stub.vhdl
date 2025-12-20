-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 18:20:57 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_VertexBatchBuilder_0_0/MainDesign_VertexBatchBuilder_0_0_stub.vhdl
-- Design      : MainDesign_VertexBatchBuilder_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_VertexBatchBuilder_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    CMD_SendCommand : in STD_LOGIC_VECTOR ( 1 downto 0 );
    CMD_CommandArg0 : in STD_LOGIC_VECTOR ( 23 downto 0 );
    CMD_CommandArg1 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    CMD_CommandArg2 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_NewDrawEventID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    CMD_ReadyState : out STD_LOGIC;
    IBC_ReadEnable : out STD_LOGIC;
    IBC_ReadAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    IBC_ReadData : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IBC_ReadReady : in STD_LOGIC;
    IBC_InvalidateIndexCache : out STD_LOGIC;
    SHADER_Done : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 34 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    VERTBATCH_FIFO_full : in STD_LOGIC;
    VERTBATCH_FIFO_wr_data : out STD_LOGIC_VECTOR ( 543 downto 0 );
    VERTBATCH_FIFO_wr_en : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_UseConstantOutput : in STD_LOGIC;
    DBG_CurrentState : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CurrentBatchLength : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_CurrentIndexBatchLength : out STD_LOGIC_VECTOR ( 6 downto 0 );
    DBG_CurrentBatchRemainingPrims : out STD_LOGIC_VECTOR ( 23 downto 0 );
    DBG_QueueIsFull : out STD_LOGIC;
    DBG_QueueIsEmpty : out STD_LOGIC;
    DBG_DoneGeneratingIndices : out STD_LOGIC;
    DBG_IndexGeneratorRemainingPrims : out STD_LOGIC_VECTOR ( 23 downto 0 );
    DBG_LastPolygonIndices : out STD_LOGIC_VECTOR ( 47 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_VertexBatchBuilder_0_0 : entity is "MainDesign_VertexBatchBuilder_0_0,VertexBatchBuilder,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_VertexBatchBuilder_0_0 : entity is "MainDesign_VertexBatchBuilder_0_0,VertexBatchBuilder,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=VertexBatchBuilder,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_VertexBatchBuilder_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_VertexBatchBuilder_0_0 : entity is "module_ref";
end MainDesign_VertexBatchBuilder_0_0;

architecture stub of MainDesign_VertexBatchBuilder_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,CMD_SendCommand[1:0],CMD_CommandArg0[23:0],CMD_CommandArg1[19:0],CMD_CommandArg2[15:0],CMD_NewDrawEventID[15:0],CMD_ReadyState,IBC_ReadEnable,IBC_ReadAddr[29:0],IBC_ReadData[31:0],IBC_ReadReady,IBC_InvalidateIndexCache,SHADER_Done,STATE_StateBitsAtDrawID[34:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,VERTBATCH_FIFO_full,VERTBATCH_FIFO_wr_data[543:0],VERTBATCH_FIFO_wr_en,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_UseConstantOutput,DBG_CurrentState[3:0],DBG_CurrentBatchLength[4:0],DBG_CurrentIndexBatchLength[6:0],DBG_CurrentBatchRemainingPrims[23:0],DBG_QueueIsFull,DBG_QueueIsEmpty,DBG_DoneGeneratingIndices,DBG_IndexGeneratorRemainingPrims[23:0],DBG_LastPolygonIndices[47:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF VertexBatchFIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of VERTBATCH_FIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO FULL";
  attribute x_interface_mode of VERTBATCH_FIFO_full : signal is "master VertexBatchFIFO";
  attribute x_interface_info of VERTBATCH_FIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO WR_DATA";
  attribute x_interface_info of VERTBATCH_FIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO WR_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "VertexBatchBuilder,Vivado 2025.2";
begin
end;
