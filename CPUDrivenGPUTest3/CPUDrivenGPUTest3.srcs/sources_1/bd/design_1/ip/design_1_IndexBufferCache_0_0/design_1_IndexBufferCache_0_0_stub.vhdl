-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:37:59 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_IndexBufferCache_0_0/design_1_IndexBufferCache_0_0_stub.vhdl
-- Design      : design_1_IndexBufferCache_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_IndexBufferCache_0_0 is
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
    IBCReadResponsesFIFO_rd_en : out STD_LOGIC;
    DBG_State : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_IBCReadRequestsFIFO_full : out STD_LOGIC;
    DBG_IBCReadResponsesFIFO_empty : out STD_LOGIC
  );

end design_1_IndexBufferCache_0_0;

architecture stub of design_1_IndexBufferCache_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,VBB_ReadEnable,VBB_ReadAddr[29:0],VBB_ReadData[31:0],VBB_ReadReady,VBB_InvalidateIndexCache,IBCReadRequestsFIFO_full,IBCReadRequestsFIFO_wr_data[29:0],IBCReadRequestsFIFO_wr_en,IBCReadResponsesFIFO_rd_data[255:0],IBCReadResponsesFIFO_empty,IBCReadResponsesFIFO_rd_en,DBG_State[1:0],DBG_IBCReadRequestsFIFO_full,DBG_IBCReadResponsesFIFO_empty";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "IndexBufferCache,Vivado 2018.1_AR73068";
begin
end;
