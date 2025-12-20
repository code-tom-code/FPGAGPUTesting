-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 18:20:22 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ClearBlock_0_0/MainDesign_ClearBlock_0_0_stub.vhdl
-- Design      : MainDesign_ClearBlock_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_ClearBlock_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    CMD_ClearBlockIsIdle : out STD_LOGIC;
    CMD_ClearBlockBeginSignal : in STD_LOGIC;
    CMD_BaseRenderTargetAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_ClearColorRGBA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CMD_ClearDRAMLineCount : in STD_LOGIC_VECTOR ( 15 downto 0 );
    MEM_ClearBlockWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 293 downto 0 );
    MEM_ClearBlockWriteRequestsFIFO_full : in STD_LOGIC;
    MEM_ClearBlockWriteRequestsFIFO_almost_full : in STD_LOGIC;
    MEM_ClearBlockWriteRequestsFIFO_wr_en : out STD_LOGIC;
    DBG_ClearBlock_State : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_LastWrittenClearData : out STD_LOGIC_VECTOR ( 293 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_ClearBlock_0_0 : entity is "MainDesign_ClearBlock_0_0,ClearBlock,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_ClearBlock_0_0 : entity is "MainDesign_ClearBlock_0_0,ClearBlock,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ClearBlock,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_ClearBlock_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_ClearBlock_0_0 : entity is "module_ref";
end MainDesign_ClearBlock_0_0;

architecture stub of MainDesign_ClearBlock_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,CMD_ClearBlockIsIdle,CMD_ClearBlockBeginSignal,CMD_BaseRenderTargetAddr[29:0],CMD_ClearColorRGBA[31:0],CMD_ClearDRAMLineCount[15:0],MEM_ClearBlockWriteRequestsFIFO_wr_data[293:0],MEM_ClearBlockWriteRequestsFIFO_full,MEM_ClearBlockWriteRequestsFIFO_almost_full,MEM_ClearBlockWriteRequestsFIFO_wr_en,DBG_ClearBlock_State[3:0],DBG_LastWrittenClearData[293:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF ClearBlockWriteRequestsFIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of MEM_ClearBlockWriteRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA";
  attribute x_interface_mode of MEM_ClearBlockWriteRequestsFIFO_wr_data : signal is "master ClearBlockWriteRequestsFIFO";
  attribute x_interface_info of MEM_ClearBlockWriteRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO FULL";
  attribute x_interface_info of MEM_ClearBlockWriteRequestsFIFO_almost_full : signal is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO ALMOST_FULL";
  attribute x_interface_info of MEM_ClearBlockWriteRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "ClearBlock,Vivado 2025.2";
begin
end;
