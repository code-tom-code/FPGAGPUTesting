-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:47:11 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_CDC_Command_Scanout_0_0/design_1_CDC_Command_Scanout_0_0_stub.vhdl
-- Design      : design_1_CDC_Command_Scanout_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_CDC_Command_Scanout_0_0 is
  Port ( 
    cmd_clk : in STD_LOGIC;
    CMD_VSync : out STD_LOGIC;
    CMD_RenderTargetBaseAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    CMD_ScanEnable : in STD_LOGIC;
    CMD_InvertOutputColor : in STD_LOGIC;
    CMD_OutputColorChannels : in STD_LOGIC_VECTOR ( 8 downto 0 );
    scanout_clk : in STD_LOGIC;
    SCANOUT_VSync : in STD_LOGIC;
    SCANOUT_RenderTargetBaseAddr : out STD_LOGIC_VECTOR ( 29 downto 0 );
    SCANOUT_ScanEnable : out STD_LOGIC;
    SCANOUT_InvertOutputColor : out STD_LOGIC;
    SCANOUT_OutputColorChannels : out STD_LOGIC_VECTOR ( 8 downto 0 )
  );

end design_1_CDC_Command_Scanout_0_0;

architecture stub of design_1_CDC_Command_Scanout_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "cmd_clk,CMD_VSync,CMD_RenderTargetBaseAddr[29:0],CMD_ScanEnable,CMD_InvertOutputColor,CMD_OutputColorChannels[8:0],scanout_clk,SCANOUT_VSync,SCANOUT_RenderTargetBaseAddr[29:0],SCANOUT_ScanEnable,SCANOUT_InvertOutputColor,SCANOUT_OutputColorChannels[8:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "CDC_Command_Scanout,Vivado 2018.1_AR73068";
begin
end;
