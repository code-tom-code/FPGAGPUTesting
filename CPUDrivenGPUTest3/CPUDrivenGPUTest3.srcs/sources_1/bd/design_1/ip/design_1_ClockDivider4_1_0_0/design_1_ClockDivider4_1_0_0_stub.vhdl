-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Sun Oct 13 16:54:14 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ClockDivider4_1_0_0/design_1_ClockDivider4_1_0_0_stub.vhdl
-- Design      : design_1_ClockDivider4_1_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_ClockDivider4_1_0_0 is
  Port ( 
    clkin100 : in STD_LOGIC;
    clkout25 : out STD_LOGIC
  );

end design_1_ClockDivider4_1_0_0;

architecture stub of design_1_ClockDivider4_1_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clkin100,clkout25";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ClockDivider4_1,Vivado 2018.1_AR73068";
begin
end;
