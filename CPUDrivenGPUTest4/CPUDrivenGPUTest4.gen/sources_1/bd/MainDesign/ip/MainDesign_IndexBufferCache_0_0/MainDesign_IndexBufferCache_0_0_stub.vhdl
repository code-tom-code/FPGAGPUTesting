-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Mon Dec  8 18:20:25 2025
-- Host        : Dragon3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_IndexBufferCache_0_0/MainDesign_IndexBufferCache_0_0_stub.vhdl
-- Design      : MainDesign_IndexBufferCache_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_IndexBufferCache_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    VBB_ReadEnable : in STD_LOGIC;
    VBB_ReadAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    VBB_ReadData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VBB_ReadReady : out STD_LOGIC;
    VBB_InvalidateIndexCache : in STD_LOGIC;
    IBCReadRequestsFIFO_full : in STD_LOGIC;
    IBCReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    IBCReadRequestsFIFO_wr_en : out STD_LOGIC;
    IBCReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    IBCReadResponsesFIFO_empty : in STD_LOGIC;
    IBCReadResponsesFIFO_almost_empty : in STD_LOGIC;
    IBCReadResponsesFIFO_rd_en : out STD_LOGIC;
    DBG_State : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_IBCReadRequestsFIFO_full : out STD_LOGIC;
    DBG_IBCReadResponsesFIFO_empty : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_IndexBufferCache_0_0 : entity is "MainDesign_IndexBufferCache_0_0,IndexBufferCache,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_IndexBufferCache_0_0 : entity is "MainDesign_IndexBufferCache_0_0,IndexBufferCache,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=IndexBufferCache,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_IndexBufferCache_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_IndexBufferCache_0_0 : entity is "module_ref";
end MainDesign_IndexBufferCache_0_0;

architecture stub of MainDesign_IndexBufferCache_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,VBB_ReadEnable,VBB_ReadAddr[29:0],VBB_ReadData[31:0],VBB_ReadReady,VBB_InvalidateIndexCache,IBCReadRequestsFIFO_full,IBCReadRequestsFIFO_wr_data[29:0],IBCReadRequestsFIFO_wr_en,IBCReadResponsesFIFO_rd_data[255:0],IBCReadResponsesFIFO_empty,IBCReadResponsesFIFO_almost_empty,IBCReadResponsesFIFO_rd_en,DBG_State[1:0],DBG_IBCReadRequestsFIFO_full,DBG_IBCReadResponsesFIFO_empty";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF IBCacheReadRequests:IBCacheReadResponses, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of IBCReadRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests FULL";
  attribute x_interface_mode of IBCReadRequestsFIFO_full : signal is "master IBCacheReadRequests";
  attribute x_interface_info of IBCReadRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of IBCReadRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_EN";
  attribute x_interface_info of IBCReadResponsesFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses RD_DATA";
  attribute x_interface_mode of IBCReadResponsesFIFO_rd_data : signal is "master IBCacheReadResponses";
  attribute x_interface_info of IBCReadResponsesFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses EMPTY";
  attribute x_interface_info of IBCReadResponsesFIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses ALMOST_EMPTY";
  attribute x_interface_info of IBCReadResponsesFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses RD_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "IndexBufferCache,Vivado 2025.2";
begin
end;
