-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:03:23 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_TriWorkCache2_0_0/MainDesign_TriWorkCache2_0_0_sim_netlist.vhdl
-- Design      : MainDesign_TriWorkCache2_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_TriWorkCache2_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_TriWorkCache2_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_TriWorkCache2_0_0 : entity is "MainDesign_TriWorkCache2_0_0,TriWorkCache2,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_TriWorkCache2_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_TriWorkCache2_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_TriWorkCache2_0_0 : entity is "TriWorkCache2,Vivado 2025.2";
end MainDesign_TriWorkCache2_0_0;

architecture STRUCTURE of MainDesign_TriWorkCache2_0_0 is
  signal \^dinterp_poptriangleslot\ : STD_LOGIC;
  signal \^dinterp_tridata_fifo_rd_data\ : STD_LOGIC_VECTOR ( 223 downto 0 );
  signal \^interp_poptriangleslot\ : STD_LOGIC;
  signal \^interp_tridata_fifo_rd_data\ : STD_LOGIC_VECTOR ( 575 downto 0 );
  signal \^rast_pushnewtridata\ : STD_LOGIC;
  signal \^rast_inbarycentricinverse\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_incolorrgba0\ : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal \^rast_incolorrgba10\ : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal \^rast_incolorrgba20\ : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal \^rast_ininvw0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_ininvw10\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_ininvw20\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_int0x\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_int0y\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_int10x\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_int10y\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_int20x\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_int20y\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_inz0\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_inz10\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \^rast_inz20\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD ALMOST_EMPTY";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD EMPTY";
  attribute x_interface_mode : string;
  attribute x_interface_mode of DINTERP_TRIDATA_FIFO_empty : signal is "master DINTERP_TRIDATA_RD";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR FULL";
  attribute x_interface_mode of DINTERP_TRIDATA_FIFO_full : signal is "master DINTERP_TRIDATA_WR";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_EN";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_EN";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_almost_empty : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD ALMOST_EMPTY";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD EMPTY";
  attribute x_interface_mode of INTERP_TRIDATA_FIFO_empty : signal is "master INTERP_TRIDATA_RD";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR FULL";
  attribute x_interface_mode of INTERP_TRIDATA_FIFO_full : signal is "master INTERP_TRIDATA_WR";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_EN";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_EN";
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF DINTERP_TRIDATA_RD:DINTERP_TRIDATA_WR:INTERP_TRIDATA_RD:INTERP_TRIDATA_WR, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_DATA";
  attribute x_interface_info of DINTERP_TRIDATA_FIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_DATA";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_DATA";
  attribute x_interface_info of INTERP_TRIDATA_FIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_DATA";
begin
  DINTERP_TRIDATA_FIFO_rd_en <= \^dinterp_poptriangleslot\;
  DINTERP_TRIDATA_FIFO_wr_data(223 downto 192) <= \^rast_ininvw20\(31 downto 0);
  DINTERP_TRIDATA_FIFO_wr_data(191 downto 160) <= \^rast_ininvw10\(31 downto 0);
  DINTERP_TRIDATA_FIFO_wr_data(159 downto 128) <= \^rast_ininvw0\(31 downto 0);
  DINTERP_TRIDATA_FIFO_wr_data(127 downto 96) <= \^rast_inz20\(31 downto 0);
  DINTERP_TRIDATA_FIFO_wr_data(95 downto 64) <= \^rast_inz10\(31 downto 0);
  DINTERP_TRIDATA_FIFO_wr_data(63 downto 32) <= \^rast_inz0\(31 downto 0);
  DINTERP_TRIDATA_FIFO_wr_data(31 downto 0) <= \^rast_inbarycentricinverse\(31 downto 0);
  DINTERP_TRIDATA_FIFO_wr_en <= \^rast_pushnewtridata\;
  DINTERP_outBarycentricInverse(31 downto 0) <= \^dinterp_tridata_fifo_rd_data\(31 downto 0);
  DINTERP_outInvW0(31 downto 0) <= \^dinterp_tridata_fifo_rd_data\(159 downto 128);
  DINTERP_outInvW10(31 downto 0) <= \^dinterp_tridata_fifo_rd_data\(191 downto 160);
  DINTERP_outInvW20(31 downto 0) <= \^dinterp_tridata_fifo_rd_data\(223 downto 192);
  DINTERP_outZ0(31 downto 0) <= \^dinterp_tridata_fifo_rd_data\(63 downto 32);
  DINTERP_outZ10(31 downto 0) <= \^dinterp_tridata_fifo_rd_data\(95 downto 64);
  DINTERP_outZ20(31 downto 0) <= \^dinterp_tridata_fifo_rd_data\(127 downto 96);
  INTERP_TRIDATA_FIFO_rd_en <= \^interp_poptriangleslot\;
  INTERP_TRIDATA_FIFO_wr_data(575 downto 448) <= \^rast_incolorrgba20\(127 downto 0);
  INTERP_TRIDATA_FIFO_wr_data(447 downto 320) <= \^rast_incolorrgba10\(127 downto 0);
  INTERP_TRIDATA_FIFO_wr_data(319 downto 192) <= \^rast_incolorrgba0\(127 downto 0);
  INTERP_TRIDATA_FIFO_wr_data(191 downto 160) <= \^rast_int20y\(31 downto 0);
  INTERP_TRIDATA_FIFO_wr_data(159 downto 128) <= \^rast_int10y\(31 downto 0);
  INTERP_TRIDATA_FIFO_wr_data(127 downto 96) <= \^rast_int0y\(31 downto 0);
  INTERP_TRIDATA_FIFO_wr_data(95 downto 64) <= \^rast_int20x\(31 downto 0);
  INTERP_TRIDATA_FIFO_wr_data(63 downto 32) <= \^rast_int10x\(31 downto 0);
  INTERP_TRIDATA_FIFO_wr_data(31 downto 0) <= \^rast_int0x\(31 downto 0);
  INTERP_TRIDATA_FIFO_wr_en <= \^rast_pushnewtridata\;
  INTERP_outColorRGBA0(127 downto 0) <= \^interp_tridata_fifo_rd_data\(319 downto 192);
  INTERP_outColorRGBA10(127 downto 0) <= \^interp_tridata_fifo_rd_data\(447 downto 320);
  INTERP_outColorRGBA20(127 downto 0) <= \^interp_tridata_fifo_rd_data\(575 downto 448);
  INTERP_outT0X(31 downto 0) <= \^interp_tridata_fifo_rd_data\(31 downto 0);
  INTERP_outT0Y(31 downto 0) <= \^interp_tridata_fifo_rd_data\(127 downto 96);
  INTERP_outT10X(31 downto 0) <= \^interp_tridata_fifo_rd_data\(63 downto 32);
  INTERP_outT10Y(31 downto 0) <= \^interp_tridata_fifo_rd_data\(159 downto 128);
  INTERP_outT20X(31 downto 0) <= \^interp_tridata_fifo_rd_data\(95 downto 64);
  INTERP_outT20Y(31 downto 0) <= \^interp_tridata_fifo_rd_data\(191 downto 160);
  \^dinterp_poptriangleslot\ <= DINTERP_PopTriangleSlot;
  \^dinterp_tridata_fifo_rd_data\(223 downto 0) <= DINTERP_TRIDATA_FIFO_rd_data(223 downto 0);
  \^interp_poptriangleslot\ <= INTERP_PopTriangleSlot;
  \^interp_tridata_fifo_rd_data\(575 downto 0) <= INTERP_TRIDATA_FIFO_rd_data(575 downto 0);
  \^rast_inbarycentricinverse\(31 downto 0) <= RAST_inBarycentricInverse(31 downto 0);
  \^rast_incolorrgba0\(127 downto 0) <= RAST_inColorRGBA0(127 downto 0);
  \^rast_incolorrgba10\(127 downto 0) <= RAST_inColorRGBA10(127 downto 0);
  \^rast_incolorrgba20\(127 downto 0) <= RAST_inColorRGBA20(127 downto 0);
  \^rast_ininvw0\(31 downto 0) <= RAST_inInvW0(31 downto 0);
  \^rast_ininvw10\(31 downto 0) <= RAST_inInvW10(31 downto 0);
  \^rast_ininvw20\(31 downto 0) <= RAST_inInvW20(31 downto 0);
  \^rast_int0x\(31 downto 0) <= RAST_inT0X(31 downto 0);
  \^rast_int0y\(31 downto 0) <= RAST_inT0Y(31 downto 0);
  \^rast_int10x\(31 downto 0) <= RAST_inT10X(31 downto 0);
  \^rast_int10y\(31 downto 0) <= RAST_inT10Y(31 downto 0);
  \^rast_int20x\(31 downto 0) <= RAST_inT20X(31 downto 0);
  \^rast_int20y\(31 downto 0) <= RAST_inT20Y(31 downto 0);
  \^rast_inz0\(31 downto 0) <= RAST_inZ0(31 downto 0);
  \^rast_inz10\(31 downto 0) <= RAST_inZ10(31 downto 0);
  \^rast_inz20\(31 downto 0) <= RAST_inZ20(31 downto 0);
  \^rast_pushnewtridata\ <= RAST_PushNewTriData;
RAST_IsFull_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => DINTERP_TRIDATA_FIFO_full,
      I1 => INTERP_TRIDATA_FIFO_full,
      O => RAST_IsFull
    );
end STRUCTURE;
