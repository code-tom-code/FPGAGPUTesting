-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:23:03 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ClearBlock_0_0/design_1_ClearBlock_0_0_stub.vhdl
-- Design      : design_1_ClearBlock_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_ClearBlock_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    CMD_ClearBlockIsIdle : out STD_LOGIC;
    CMD_ClearBlockBeginSignal : in STD_LOGIC;
    CMD_BaseRenderTargetAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_ClearColorRGBA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    CMD_ClearDRAMLineCount : in STD_LOGIC_VECTOR ( 15 downto 0 );
    MEM_ClearBlockWriteRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 293 downto 0 );
    MEM_ClearBlockWriteRequestsFIFO_full : in STD_LOGIC;
    MEM_ClearBlockWriteRequestsFIFO_wr_en : out STD_LOGIC;
    DBG_ClearBlock_State : out STD_LOGIC_VECTOR ( 3 downto 0 );
    DBG_LastWrittenClearData : out STD_LOGIC_VECTOR ( 293 downto 0 )
  );

end design_1_ClearBlock_0_0;

architecture stub of design_1_ClearBlock_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,CMD_ClearBlockIsIdle,CMD_ClearBlockBeginSignal,CMD_BaseRenderTargetAddr[29:0],CMD_ClearColorRGBA[31:0],CMD_ClearDRAMLineCount[15:0],MEM_ClearBlockWriteRequestsFIFO_wr_data[293:0],MEM_ClearBlockWriteRequestsFIFO_full,MEM_ClearBlockWriteRequestsFIFO_wr_en,DBG_ClearBlock_State[3:0],DBG_LastWrittenClearData[293:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ClearBlock,Vivado 2018.1_AR73068";
begin
end;
