// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:47:11 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_CDC_Command_Scanout_0_0/design_1_CDC_Command_Scanout_0_0_stub.v
// Design      : design_1_CDC_Command_Scanout_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "CDC_Command_Scanout,Vivado 2018.1_AR73068" *)
module design_1_CDC_Command_Scanout_0_0(cmd_clk, CMD_VSync, CMD_RenderTargetBaseAddr, 
  CMD_ScanEnable, CMD_InvertOutputColor, CMD_OutputColorChannels, scanout_clk, 
  SCANOUT_VSync, SCANOUT_RenderTargetBaseAddr, SCANOUT_ScanEnable, 
  SCANOUT_InvertOutputColor, SCANOUT_OutputColorChannels)
/* synthesis syn_black_box black_box_pad_pin="cmd_clk,CMD_VSync,CMD_RenderTargetBaseAddr[29:0],CMD_ScanEnable,CMD_InvertOutputColor,CMD_OutputColorChannels[8:0],scanout_clk,SCANOUT_VSync,SCANOUT_RenderTargetBaseAddr[29:0],SCANOUT_ScanEnable,SCANOUT_InvertOutputColor,SCANOUT_OutputColorChannels[8:0]" */;
  input cmd_clk;
  output CMD_VSync;
  input [29:0]CMD_RenderTargetBaseAddr;
  input CMD_ScanEnable;
  input CMD_InvertOutputColor;
  input [8:0]CMD_OutputColorChannels;
  input scanout_clk;
  input SCANOUT_VSync;
  output [29:0]SCANOUT_RenderTargetBaseAddr;
  output SCANOUT_ScanEnable;
  output SCANOUT_InvertOutputColor;
  output [8:0]SCANOUT_OutputColorChannels;
endmodule
