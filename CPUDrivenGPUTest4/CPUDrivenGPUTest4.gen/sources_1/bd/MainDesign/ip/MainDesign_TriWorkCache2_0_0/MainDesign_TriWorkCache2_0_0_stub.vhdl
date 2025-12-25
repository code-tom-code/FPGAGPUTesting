-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:03:23 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_TriWorkCache2_0_0/MainDesign_TriWorkCache2_0_0_stub.vhdl
-- Design      : MainDesign_TriWorkCache2_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MainDesign_TriWorkCache2_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    DINTERP_outBarycentricInverse : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outZ0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outZ10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outZ20 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outInvW0 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outInvW10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_outInvW20 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    DINTERP_PopTriangleSlot : in STD_LOGIC;
    INTERP_outT0X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outT0Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outT10X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outT10Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outT20X : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outT20Y : out STD_LOGIC_VECTOR ( 31 downto 0 );
    INTERP_outColorRGBA0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    INTERP_outColorRGBA10 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    INTERP_outColorRGBA20 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    INTERP_PopTriangleSlot : in STD_LOGIC;
    RAST_inBarycentricInverse : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inZ0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inZ10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inZ20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inInvW0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inInvW10 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inInvW20 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT0X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT0Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT10X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT10Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT20X : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inT20Y : in STD_LOGIC_VECTOR ( 31 downto 0 );
    RAST_inColorRGBA0 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_inColorRGBA10 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_inColorRGBA20 : in STD_LOGIC_VECTOR ( 127 downto 0 );
    RAST_PushNewTriData : in STD_LOGIC;
    RAST_IsFull : out STD_LOGIC;
    DINTERP_TRIDATA_FIFO_empty : in STD_LOGIC;
    DINTERP_TRIDATA_FIFO_almost_empty : in STD_LOGIC;
    DINTERP_TRIDATA_FIFO_rd_data : in STD_LOGIC_VECTOR ( 223 downto 0 );
    DINTERP_TRIDATA_FIFO_rd_en : out STD_LOGIC;
    DINTERP_TRIDATA_FIFO_full : in STD_LOGIC;
    DINTERP_TRIDATA_FIFO_wr_data : out STD_LOGIC_VECTOR ( 223 downto 0 );
    DINTERP_TRIDATA_FIFO_wr_en : out STD_LOGIC;
    INTERP_TRIDATA_FIFO_empty : in STD_LOGIC;
    INTERP_TRIDATA_FIFO_almost_empty : in STD_LOGIC;
    INTERP_TRIDATA_FIFO_rd_data : in STD_LOGIC_VECTOR ( 575 downto 0 );
    INTERP_TRIDATA_FIFO_rd_en : out STD_LOGIC;
    INTERP_TRIDATA_FIFO_full : in STD_LOGIC;
    INTERP_TRIDATA_FIFO_wr_data : out STD_LOGIC_VECTOR ( 575 downto 0 );
    INTERP_TRIDATA_FIFO_wr_en : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_TriWorkCache2_0_0 : entity is "MainDesign_TriWorkCache2_0_0,TriWorkCache2,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of MainDesign_TriWorkCache2_0_0 : entity is "MainDesign_TriWorkCache2_0_0,TriWorkCache2,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=TriWorkCache2,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_TriWorkCache2_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_TriWorkCache2_0_0 : entity is "module_ref";
end MainDesign_TriWorkCache2_0_0;

architecture stub of MainDesign_TriWorkCache2_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,DINTERP_outBarycentricInverse[31:0],DINTERP_outZ0[31:0],DINTERP_outZ10[31:0],DINTERP_outZ20[31:0],DINTERP_outInvW0[31:0],DINTERP_outInvW10[31:0],DINTERP_outInvW20[31:0],DINTERP_PopTriangleSlot,INTERP_outT0X[31:0],INTERP_outT0Y[31:0],INTERP_outT10X[31:0],INTERP_outT10Y[31:0],INTERP_outT20X[31:0],INTERP_outT20Y[31:0],INTERP_outColorRGBA0[127:0],INTERP_outColorRGBA10[127:0],INTERP_outColorRGBA20[127:0],INTERP_PopTriangleSlot,RAST_inBarycentricInverse[31:0],RAST_inZ0[31:0],RAST_inZ10[31:0],RAST_inZ20[31:0],RAST_inInvW0[31:0],RAST_inInvW10[31:0],RAST_inInvW20[31:0],RAST_inT0X[31:0],RAST_inT0Y[31:0],RAST_inT10X[31:0],RAST_inT10Y[31:0],RAST_inT20X[31:0],RAST_inT20Y[31:0],RAST_inColorRGBA0[127:0],RAST_inColorRGBA10[127:0],RAST_inColorRGBA20[127:0],RAST_PushNewTriData,RAST_IsFull,DINTERP_TRIDATA_FIFO_empty,DINTERP_TRIDATA_FIFO_almost_empty,DINTERP_TRIDATA_FIFO_rd_data[223:0],DINTERP_TRIDATA_FIFO_rd_en,DINTERP_TRIDATA_FIFO_full,DINTERP_TRIDATA_FIFO_wr_data[223:0],DINTERP_TRIDATA_FIFO_wr_en,INTERP_TRIDATA_FIFO_empty,INTERP_TRIDATA_FIFO_almost_empty,INTERP_TRIDATA_FIFO_rd_data[575:0],INTERP_TRIDATA_FIFO_rd_en,INTERP_TRIDATA_FIFO_full,INTERP_TRIDATA_FIFO_wr_data[575:0],INTERP_TRIDATA_FIFO_wr_en";
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF DINTERP_TRIDATA_RD:DINTERP_TRIDATA_WR:INTERP_TRIDATA_RD:INTERP_TRIDATA_WR, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD EMPTY";
  attribute x_interface_mode of DINTERP_TRIDATA_FIFO_empty : signal is "master DINTERP_TRIDATA_RD";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD ALMOST_EMPTY";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_DATA";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_EN";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR FULL";
  attribute x_interface_mode of DINTERP_TRIDATA_FIFO_full : signal is "master DINTERP_TRIDATA_WR";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_DATA";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_EN";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD EMPTY";
  attribute x_interface_mode of INTERP_TRIDATA_FIFO_empty : signal is "master INTERP_TRIDATA_RD";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD ALMOST_EMPTY";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_DATA";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_EN";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR FULL";
  attribute x_interface_mode of INTERP_TRIDATA_FIFO_full : signal is "master INTERP_TRIDATA_WR";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_DATA";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_EN";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "TriWorkCache2,Vivado 2025.2";
begin
end;
