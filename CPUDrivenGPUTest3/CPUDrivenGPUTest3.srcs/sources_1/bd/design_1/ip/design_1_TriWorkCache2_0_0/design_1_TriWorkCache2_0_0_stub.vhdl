-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 01:02:55 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_TriWorkCache2_0_0/design_1_TriWorkCache2_0_0_stub.vhdl
-- Design      : design_1_TriWorkCache2_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_TriWorkCache2_0_0 is
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
    DINTERP_TRIDATA_FIFO_rd_data : in STD_LOGIC_VECTOR ( 223 downto 0 );
    DINTERP_TRIDATA_FIFO_rd_en : out STD_LOGIC;
    DINTERP_TRIDATA_FIFO_full : in STD_LOGIC;
    DINTERP_TRIDATA_FIFO_wr_data : out STD_LOGIC_VECTOR ( 223 downto 0 );
    DINTERP_TRIDATA_FIFO_wr_en : out STD_LOGIC;
    INTERP_TRIDATA_FIFO_empty : in STD_LOGIC;
    INTERP_TRIDATA_FIFO_rd_data : in STD_LOGIC_VECTOR ( 575 downto 0 );
    INTERP_TRIDATA_FIFO_rd_en : out STD_LOGIC;
    INTERP_TRIDATA_FIFO_full : in STD_LOGIC;
    INTERP_TRIDATA_FIFO_wr_data : out STD_LOGIC_VECTOR ( 575 downto 0 );
    INTERP_TRIDATA_FIFO_wr_en : out STD_LOGIC
  );

end design_1_TriWorkCache2_0_0;

architecture stub of design_1_TriWorkCache2_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,DINTERP_outBarycentricInverse[31:0],DINTERP_outZ0[31:0],DINTERP_outZ10[31:0],DINTERP_outZ20[31:0],DINTERP_outInvW0[31:0],DINTERP_outInvW10[31:0],DINTERP_outInvW20[31:0],DINTERP_PopTriangleSlot,INTERP_outT0X[31:0],INTERP_outT0Y[31:0],INTERP_outT10X[31:0],INTERP_outT10Y[31:0],INTERP_outT20X[31:0],INTERP_outT20Y[31:0],INTERP_outColorRGBA0[127:0],INTERP_outColorRGBA10[127:0],INTERP_outColorRGBA20[127:0],INTERP_PopTriangleSlot,RAST_inBarycentricInverse[31:0],RAST_inZ0[31:0],RAST_inZ10[31:0],RAST_inZ20[31:0],RAST_inInvW0[31:0],RAST_inInvW10[31:0],RAST_inInvW20[31:0],RAST_inT0X[31:0],RAST_inT0Y[31:0],RAST_inT10X[31:0],RAST_inT10Y[31:0],RAST_inT20X[31:0],RAST_inT20Y[31:0],RAST_inColorRGBA0[127:0],RAST_inColorRGBA10[127:0],RAST_inColorRGBA20[127:0],RAST_PushNewTriData,RAST_IsFull,DINTERP_TRIDATA_FIFO_empty,DINTERP_TRIDATA_FIFO_rd_data[223:0],DINTERP_TRIDATA_FIFO_rd_en,DINTERP_TRIDATA_FIFO_full,DINTERP_TRIDATA_FIFO_wr_data[223:0],DINTERP_TRIDATA_FIFO_wr_en,INTERP_TRIDATA_FIFO_empty,INTERP_TRIDATA_FIFO_rd_data[575:0],INTERP_TRIDATA_FIFO_rd_en,INTERP_TRIDATA_FIFO_full,INTERP_TRIDATA_FIFO_wr_data[575:0],INTERP_TRIDATA_FIFO_wr_en";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "TriWorkCache2,Vivado 2018.1_AR73068";
begin
end;
