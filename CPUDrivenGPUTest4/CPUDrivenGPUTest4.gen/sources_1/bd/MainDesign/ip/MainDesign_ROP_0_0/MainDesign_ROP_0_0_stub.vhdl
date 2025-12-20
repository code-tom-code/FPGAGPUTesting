-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sat Dec 13 03:03:43 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ROP_0_0/MainDesign_ROP_0_0_stub.vhdl
-- Design      : MainDesign_ROP_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_ROP_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    MEM_ROPReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    MEM_ROPReadRequestsFIFO_full : in STD_LOGIC;
    MEM_ROPReadRequestsFIFO_wr_en : out STD_LOGIC;
    MEM_ROPReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    MEM_ROPReadResponsesFIFO_empty : in STD_LOGIC;
    MEM_ROPReadResponsesFIFO_almost_empty : in STD_LOGIC;
    MEM_ROPReadResponsesFIFO_rd_en : out STD_LOGIC;
    MEM_ROPWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 293 downto 0 );
    MEM_ROPWriteRequestsFIFO_full : in STD_LOGIC;
    MEM_ROPWriteRequestsFIFO_wr_en : out STD_LOGIC;
    CMD_SetClearColor : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CMD_ClearSignal : in STD_LOGIC;
    CMD_ClearSignalAck : out STD_LOGIC;
    CMD_FlushCacheSignal : in STD_LOGIC;
    CMD_FlushCacheAck : out STD_LOGIC;
    CMD_ROPIsIdle : out STD_LOGIC;
    STATE_StateBitsAtDrawID : in STD_LOGIC_VECTOR ( 100 downto 0 );
    STATE_NextDrawID : in STD_LOGIC_VECTOR ( 15 downto 0 );
    STATE_StateIsValid : in STD_LOGIC;
    STATE_ConsumeStateSlot : out STD_LOGIC;
    TEXSAMP_InFIFO_rd_data : in STD_LOGIC_VECTOR ( 63 downto 0 );
    TEXSAMP_InFIFO_empty : in STD_LOGIC;
    TEXSAMP_InFIFO_almost_empty : in STD_LOGIC;
    TEXSAMP_InFIFO_rd_en : out STD_LOGIC;
    STAT_CyclesIdle : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesSpentWorking : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForOutput : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CyclesWaitingForMemoryRead : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountCacheHits : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CountCacheMisses : out STD_LOGIC_VECTOR ( 31 downto 0 );
    STAT_CurrentDrawEventID : out STD_LOGIC_VECTOR ( 15 downto 0 );
    STAT_CountPixelsPassed : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_ROP_State : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_CurrentPixelAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    DBG_CurrentBlendedColor : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_PreviousFramebufferColor : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_CurrentCacheLineDirtyFlags : out STD_LOGIC_VECTOR ( 7 downto 0 );
    DBG_TempSelectedOutputRGB : out STD_LOGIC_VECTOR ( 47 downto 0 );
    DBG_TempSelectedOutputA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    DBG_TempBlendedOutputRGB : out STD_LOGIC_VECTOR ( 95 downto 0 );
    DBG_TempBlendedOutputA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DBG_ReadRequestFIFOFull : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_ROP_0_0 : entity is "MainDesign_ROP_0_0,ROP,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_ROP_0_0 : entity is "MainDesign_ROP_0_0,ROP,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ROP,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_ROP_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_ROP_0_0 : entity is "module_ref";
end MainDesign_ROP_0_0;

architecture stub of MainDesign_ROP_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,MEM_ROPReadRequestsFIFO_wr_data[29:0],MEM_ROPReadRequestsFIFO_full,MEM_ROPReadRequestsFIFO_wr_en,MEM_ROPReadResponsesFIFO_rd_data[255:0],MEM_ROPReadResponsesFIFO_empty,MEM_ROPReadResponsesFIFO_almost_empty,MEM_ROPReadResponsesFIFO_rd_en,MEM_ROPWriteRequestsFIFO_wr_data[293:0],MEM_ROPWriteRequestsFIFO_full,MEM_ROPWriteRequestsFIFO_wr_en,CMD_SetClearColor[31:0],CMD_ClearSignal,CMD_ClearSignalAck,CMD_FlushCacheSignal,CMD_FlushCacheAck,CMD_ROPIsIdle,STATE_StateBitsAtDrawID[100:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,TEXSAMP_InFIFO_rd_data[63:0],TEXSAMP_InFIFO_empty,TEXSAMP_InFIFO_almost_empty,TEXSAMP_InFIFO_rd_en,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CyclesWaitingForMemoryRead[31:0],STAT_CountCacheHits[31:0],STAT_CountCacheMisses[31:0],STAT_CurrentDrawEventID[15:0],STAT_CountPixelsPassed[31:0],DBG_ROP_State[4:0],DBG_CurrentPixelAddr[29:0],DBG_CurrentBlendedColor[31:0],DBG_PreviousFramebufferColor[31:0],DBG_CurrentCacheLineDirtyFlags[7:0],DBG_TempSelectedOutputRGB[47:0],DBG_TempSelectedOutputA[15:0],DBG_TempBlendedOutputRGB[95:0],DBG_TempBlendedOutputA[31:0],DBG_ReadRequestFIFOFull";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF ROPReadRequestsFIFO:ROPReadResponses:ROPWriteRequestsFIFO:TEXSAMP_IN_FIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of MEM_ROPReadRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO WR_DATA";
  attribute x_interface_mode of MEM_ROPReadRequestsFIFO_wr_data : signal is "master ROPReadRequestsFIFO";
  attribute x_interface_info of MEM_ROPReadRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO FULL";
  attribute x_interface_info of MEM_ROPReadRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO WR_EN";
  attribute x_interface_info of MEM_ROPReadResponsesFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 ROPReadResponses RD_DATA";
  attribute x_interface_mode of MEM_ROPReadResponsesFIFO_rd_data : signal is "master ROPReadResponses";
  attribute x_interface_info of MEM_ROPReadResponsesFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 ROPReadResponses EMPTY";
  attribute x_interface_info of MEM_ROPReadResponsesFIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 ROPReadResponses ALMOST_EMPTY";
  attribute x_interface_info of MEM_ROPReadResponsesFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 ROPReadResponses RD_EN";
  attribute x_interface_info of MEM_ROPWriteRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO WR_DATA";
  attribute x_interface_mode of MEM_ROPWriteRequestsFIFO_wr_data : signal is "master ROPWriteRequestsFIFO";
  attribute x_interface_info of MEM_ROPWriteRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO FULL";
  attribute x_interface_info of MEM_ROPWriteRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO WR_EN";
  attribute x_interface_info of TEXSAMP_InFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO RD_DATA";
  attribute x_interface_mode of TEXSAMP_InFIFO_rd_data : signal is "master TEXSAMP_IN_FIFO";
  attribute x_interface_info of TEXSAMP_InFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO EMPTY";
  attribute x_interface_info of TEXSAMP_InFIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO ALMOST_EMPTY";
  attribute x_interface_info of TEXSAMP_InFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO RD_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "ROP,Vivado 2025.2";
begin
end;
