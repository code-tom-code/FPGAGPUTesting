-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:04:24 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_VertexStreamCache_0_0/MainDesign_VertexStreamCache_0_0_stub.vhdl
-- Design      : MainDesign_VertexStreamCache_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_VertexStreamCache_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    VSC_ReadEnable : in STD_LOGIC;
    VSC_ReadStreamIndex : in STD_LOGIC_VECTOR ( 2 downto 0 );
    VSC_ReadDWORDAddr : in STD_LOGIC_VECTOR ( 21 downto 0 );
    VSC_ReadData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VSC_ReadReady : out STD_LOGIC;
    VSC_SetStreamVBAddress : in STD_LOGIC;
    VSC_StreamIndex : in STD_LOGIC_VECTOR ( 2 downto 0 );
    VSC_StreamVBAddress : in STD_LOGIC_VECTOR ( 29 downto 0 );
    VSC_InvalidateCache : in STD_LOGIC;
    VertexCache_clk : out STD_LOGIC;
    VertexCache_addra : out STD_LOGIC_VECTOR ( 9 downto 0 );
    VertexCache_dina : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VertexCache_douta : in STD_LOGIC_VECTOR ( 31 downto 0 );
    VertexCache_ena : out STD_LOGIC;
    VertexCache_wea : out STD_LOGIC_VECTOR ( 0 to 0 );
    VSCReadRequestsFIFO_full : in STD_LOGIC;
    VSCReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    VSCReadRequestsFIFO_wr_en : out STD_LOGIC;
    VSCReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    VSCReadResponsesFIFO_empty : in STD_LOGIC;
    VSCReadResponsesFIFO_almost_empty : in STD_LOGIC;
    VSCReadResponsesFIFO_rd_en : out STD_LOGIC;
    DBG_State : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_CacheSetIndex : out STD_LOGIC_VECTOR ( 4 downto 0 );
    DBG_CacheElementIndex : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_VertexStreamCache_0_0 : entity is "MainDesign_VertexStreamCache_0_0,VertexStreamCache,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_VertexStreamCache_0_0 : entity is "MainDesign_VertexStreamCache_0_0,VertexStreamCache,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=VertexStreamCache,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_VertexStreamCache_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_VertexStreamCache_0_0 : entity is "module_ref";
end MainDesign_VertexStreamCache_0_0;

architecture stub of MainDesign_VertexStreamCache_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,VSC_ReadEnable,VSC_ReadStreamIndex[2:0],VSC_ReadDWORDAddr[21:0],VSC_ReadData[31:0],VSC_ReadReady,VSC_SetStreamVBAddress,VSC_StreamIndex[2:0],VSC_StreamVBAddress[29:0],VSC_InvalidateCache,VertexCache_clk,VertexCache_addra[9:0],VertexCache_dina[31:0],VertexCache_douta[31:0],VertexCache_ena,VertexCache_wea[0:0],VSCReadRequestsFIFO_full,VSCReadRequestsFIFO_wr_data[29:0],VSCReadRequestsFIFO_wr_en,VSCReadResponsesFIFO_rd_data[255:0],VSCReadResponsesFIFO_empty,VSCReadResponsesFIFO_almost_empty,VSCReadResponsesFIFO_rd_en,DBG_State[3:0],DBG_CacheSetIndex[4:0],DBG_CacheElementIndex[1:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF VBCache:VBCacheReadRequests:VBCacheReadResponses, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of VertexCache_clk : signal is "xilinx.com:interface:bram:1.0 VBCache CLK";
  attribute x_interface_mode of VertexCache_clk : signal is "master VBCache";
  attribute x_interface_parameter of VertexCache_clk : signal is "XIL_INTERFACENAME VBCache, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1";
  attribute x_interface_info of VertexCache_addra : signal is "xilinx.com:interface:bram:1.0 VBCache ADDR";
  attribute x_interface_info of VertexCache_dina : signal is "xilinx.com:interface:bram:1.0 VBCache DIN";
  attribute x_interface_info of VertexCache_douta : signal is "xilinx.com:interface:bram:1.0 VBCache DOUT";
  attribute x_interface_info of VertexCache_ena : signal is "xilinx.com:interface:bram:1.0 VBCache EN";
  attribute x_interface_info of VertexCache_wea : signal is "xilinx.com:interface:bram:1.0 VBCache WE";
  attribute x_interface_info of VSCReadRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests FULL";
  attribute x_interface_mode of VSCReadRequestsFIFO_full : signal is "master VBCacheReadRequests";
  attribute x_interface_info of VSCReadRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests WR_DATA";
  attribute x_interface_info of VSCReadRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 VBCacheReadRequests WR_EN";
  attribute x_interface_info of VSCReadResponsesFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses RD_DATA";
  attribute x_interface_mode of VSCReadResponsesFIFO_rd_data : signal is "master VBCacheReadResponses";
  attribute x_interface_info of VSCReadResponsesFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses EMPTY";
  attribute x_interface_info of VSCReadResponsesFIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses ALMOST_EMPTY";
  attribute x_interface_info of VSCReadResponsesFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 VBCacheReadResponses RD_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "VertexStreamCache,Vivado 2025.2";
begin
end;
