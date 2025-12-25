-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 17:59:48 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_TexSample_0_1/MainDesign_TexSample_0_1_stub.vhdl
-- Design      : MainDesign_TexSample_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_TexSample_0_1 is
  Port ( 
    clk : in STD_LOGIC;
    INTERP_InFIFO_rd_data : in STD_LOGIC_VECTOR ( 95 downto 0 );
    INTERP_InFIFO_empty : in STD_LOGIC;
    INTERP_InFIFO_almost_empty : in STD_LOGIC;
    INTERP_InFIFO_rd_en : out STD_LOGIC;
    MEM_TexSampReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    MEM_TexSampReadRequestsFIFO_full : in STD_LOGIC;
    MEM_TexSampReadRequestsFIFO_wr_en : out STD_LOGIC;
    MEM_TexSampReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    MEM_TexSampReadResponsesFIFO_empty : in STD_LOGIC;
    MEM_TexSampReadResponsesFIFO_almost_empty : in STD_LOGIC;
    MEM_TexSampReadResponsesFIFO_rd_en : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 73 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    TexCache_addra : out STD_LOGIC_VECTOR ( 13 downto 0 );
    TexCache_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    TexCache_douta : in STD_LOGIC_VECTOR ( 31 downto 0 );
    TexCache_ena : out STD_LOGIC;
    TexCache_clk : out STD_LOGIC;
    TexCache_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    CMD_TexSampleIsIdle : out STD_LOGIC;
    ROP_OutFIFO_wr_data : out STD_LOGIC_VECTOR ( 63 downto 0 );
    ROP_OutFIFO_full : in STD_LOGIC;
    ROP_OutFIFO_wr_en : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingCacheLoad : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_TexSample_State : out STD_LOGIC_VECTOR ( 5 downto 0 );
    DBG_TexCache_douta : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_TexCache_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_TexCache_addra : out STD_LOGIC_VECTOR ( 13 downto 0 );
    DBG_texCacheReadTexelsCount : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_Message : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_MessageData : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_NewMessage : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_TexSample_0_1 : entity is "MainDesign_TexSample_0_1,TexSample,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_TexSample_0_1 : entity is "MainDesign_TexSample_0_1,TexSample,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=TexSample,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_TexSample_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_TexSample_0_1 : entity is "module_ref";
end MainDesign_TexSample_0_1;

architecture stub of MainDesign_TexSample_0_1 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,INTERP_InFIFO_rd_data[95:0],INTERP_InFIFO_empty,INTERP_InFIFO_almost_empty,INTERP_InFIFO_rd_en,MEM_TexSampReadRequestsFIFO_wr_data[29:0],MEM_TexSampReadRequestsFIFO_full,MEM_TexSampReadRequestsFIFO_wr_en,MEM_TexSampReadResponsesFIFO_rd_data[255:0],MEM_TexSampReadResponsesFIFO_empty,MEM_TexSampReadResponsesFIFO_almost_empty,MEM_TexSampReadResponsesFIFO_rd_en,STATE_StateBitsAtDrawID[73:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,TexCache_addra[13:0],TexCache_dina[31:0],TexCache_douta[31:0],TexCache_ena,TexCache_clk,TexCache_wea[0:0],CMD_TexSampleIsIdle,ROP_OutFIFO_wr_data[63:0],ROP_OutFIFO_full,ROP_OutFIFO_wr_en,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CyclesWaitingCacheLoad[31:0],STAT_CurrentDrawEventID[15:0],DBG_TexSample_State[5:0],DBG_TexCache_douta[31:0],DBG_TexCache_dina[31:0],DBG_TexCache_addra[13:0],DBG_texCacheReadTexelsCount[15:0],DBG_Message[15:0],DBG_MessageData[15:0],DBG_NewMessage";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF TexSampReadRequestsFIFO:TexSampReadResponses:INTERP_IN_FIFO:ROP_OUT_FIFO:TexCache, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of INTERP_InFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO RD_DATA";
  attribute x_interface_mode of INTERP_InFIFO_rd_data : signal is "master INTERP_IN_FIFO";
  attribute x_interface_info of INTERP_InFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO EMPTY";
  attribute x_interface_info of INTERP_InFIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO ALMOST_EMPTY";
  attribute x_interface_info of INTERP_InFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO RD_EN";
  attribute x_interface_info of MEM_TexSampReadRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO WR_DATA";
  attribute x_interface_mode of MEM_TexSampReadRequestsFIFO_wr_data : signal is "master TexSampReadRequestsFIFO";
  attribute x_interface_info of MEM_TexSampReadRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO FULL";
  attribute x_interface_info of MEM_TexSampReadRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO WR_EN";
  attribute x_interface_info of MEM_TexSampReadResponsesFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses RD_DATA";
  attribute x_interface_mode of MEM_TexSampReadResponsesFIFO_rd_data : signal is "master TexSampReadResponses";
  attribute x_interface_info of MEM_TexSampReadResponsesFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses EMPTY";
  attribute x_interface_info of MEM_TexSampReadResponsesFIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses ALMOST_EMPTY";
  attribute x_interface_info of MEM_TexSampReadResponsesFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses RD_EN";
  attribute x_interface_info of TexCache_addra : signal is "xilinx.com:interface:bram:1.0 TexCache ADDR";
  attribute x_interface_mode of TexCache_addra : signal is "master TexCache";
  attribute x_interface_parameter of TexCache_addra : signal is "XIL_INTERFACENAME TexCache, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of TexCache_dina : signal is "xilinx.com:interface:bram:1.0 TexCache DIN";
  attribute x_interface_info of TexCache_douta : signal is "xilinx.com:interface:bram:1.0 TexCache DOUT";
  attribute x_interface_mode of TexCache_douta : signal is "master";
  attribute x_interface_info of TexCache_ena : signal is "xilinx.com:interface:bram:1.0 TexCache EN";
  attribute x_interface_info of TexCache_clk : signal is "xilinx.com:interface:bram:1.0 TexCache CLK";
  attribute x_interface_info of TexCache_wea : signal is "xilinx.com:interface:bram:1.0 TexCache WE";
  attribute x_interface_info of ROP_OutFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO WR_DATA";
  attribute x_interface_mode of ROP_OutFIFO_wr_data : signal is "master ROP_OUT_FIFO";
  attribute x_interface_info of ROP_OutFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO FULL";
  attribute x_interface_info of ROP_OutFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO WR_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "TexSample,Vivado 2025.2";
begin
end;
