// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:23:03 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ClearBlock_0_0/design_1_ClearBlock_0_0_stub.v
// Design      : design_1_ClearBlock_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ClearBlock,Vivado 2018.1_AR73068" *)
module design_1_ClearBlock_0_0(clk, CMD_ClearBlockIsIdle, 
  CMD_ClearBlockBeginSignal, CMD_BaseRenderTargetAddr, CMD_ClearColorRGBA, 
  CMD_ClearDRAMLineCount, MEM_ClearBlockWriteRequestsFIFO_wr_data, 
  MEM_ClearBlockWriteRequestsFIFO_full, MEM_ClearBlockWriteRequestsFIFO_wr_en, 
  DBG_ClearBlock_State, DBG_LastWrittenClearData)
/* synthesis syn_black_box black_box_pad_pin="clk,CMD_ClearBlockIsIdle,CMD_ClearBlockBeginSignal,CMD_BaseRenderTargetAddr[29:0],CMD_ClearColorRGBA[31:0],CMD_ClearDRAMLineCount[15:0],MEM_ClearBlockWriteRequestsFIFO_wr_data[293:0],MEM_ClearBlockWriteRequestsFIFO_full,MEM_ClearBlockWriteRequestsFIFO_wr_en,DBG_ClearBlock_State[3:0],DBG_LastWrittenClearData[293:0]" */;
  input clk;
  output CMD_ClearBlockIsIdle;
  input CMD_ClearBlockBeginSignal;
  input [29:0]CMD_BaseRenderTargetAddr;
  input [31:0]CMD_ClearColorRGBA;
  input [15:0]CMD_ClearDRAMLineCount;
  output [293:0]MEM_ClearBlockWriteRequestsFIFO_wr_data;
  input MEM_ClearBlockWriteRequestsFIFO_full;
  output MEM_ClearBlockWriteRequestsFIFO_wr_en;
  output [3:0]DBG_ClearBlock_State;
  output [293:0]DBG_LastWrittenClearData;
endmodule
