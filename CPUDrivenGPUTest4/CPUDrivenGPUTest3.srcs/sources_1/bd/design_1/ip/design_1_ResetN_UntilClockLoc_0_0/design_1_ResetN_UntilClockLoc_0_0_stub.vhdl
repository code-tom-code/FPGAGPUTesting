-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:02:13 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ResetN_UntilClockLoc_0_0/design_1_ResetN_UntilClockLoc_0_0_stub.vhdl
-- Design      : design_1_ResetN_UntilClockLoc_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_ResetN_UntilClockLoc_0_0 is
  Port ( 
    reset : in STD_LOGIC;
    locked : in STD_LOGIC;
    resetn : out STD_LOGIC
  );

end design_1_ResetN_UntilClockLoc_0_0;

architecture stub of design_1_ResetN_UntilClockLoc_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "reset,locked,resetn";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ResetN_UntilClockLocked,Vivado 2018.1_AR73068";
begin
end;
