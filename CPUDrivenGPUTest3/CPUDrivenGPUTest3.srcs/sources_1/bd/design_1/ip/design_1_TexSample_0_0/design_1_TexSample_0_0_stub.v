// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Apr 26 19:20:50 2025
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_TexSample_0_0/design_1_TexSample_0_0_stub.v
// Design      : design_1_TexSample_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "TexSample,Vivado 2018.1_AR73068" *)
module design_1_TexSample_0_0(clk, INTERP_InFIFO_rd_data, 
  INTERP_InFIFO_empty, INTERP_InFIFO_rd_en, MEM_TexSampReadRequestsFIFO_wr_data, 
  MEM_TexSampReadRequestsFIFO_full, MEM_TexSampReadRequestsFIFO_wr_en, 
  MEM_TexSampReadResponsesFIFO_rd_data, MEM_TexSampReadResponsesFIFO_empty, 
  MEM_TexSampReadResponsesFIFO_rd_en, STATE_StateBitsAtDrawID, STATE_NextDrawID, 
  STATE_StateIsValid, STATE_ConsumeStateSlot, TexCache_addra, TexCache_dina, 
  TexCache_douta, TexCache_ena, TexCache_wea, CMD_TexSampleIsIdle, ROP_OutFIFO_wr_data, 
  ROP_OutFIFO_full, ROP_OutFIFO_wr_en, STAT_CyclesIdle, STAT_CyclesSpentWorking, 
  STAT_CyclesWaitingForOutput, STAT_CyclesWaitingCacheLoad, STAT_CurrentDrawEventID, 
  DBG_TexSample_State, DBG_TexCache_douta, DBG_TexCache_dina, DBG_TexCache_addra, 
  DBG_texCacheReadTexelsCount)
/* synthesis syn_black_box black_box_pad_pin="clk,INTERP_InFIFO_rd_data[95:0],INTERP_InFIFO_empty,INTERP_InFIFO_rd_en,MEM_TexSampReadRequestsFIFO_wr_data[29:0],MEM_TexSampReadRequestsFIFO_full,MEM_TexSampReadRequestsFIFO_wr_en,MEM_TexSampReadResponsesFIFO_rd_data[255:0],MEM_TexSampReadResponsesFIFO_empty,MEM_TexSampReadResponsesFIFO_rd_en,STATE_StateBitsAtDrawID[73:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,TexCache_addra[13:0],TexCache_dina[31:0],TexCache_douta[31:0],TexCache_ena,TexCache_wea[0:0],CMD_TexSampleIsIdle,ROP_OutFIFO_wr_data[63:0],ROP_OutFIFO_full,ROP_OutFIFO_wr_en,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CyclesWaitingCacheLoad[31:0],STAT_CurrentDrawEventID[15:0],DBG_TexSample_State[5:0],DBG_TexCache_douta[31:0],DBG_TexCache_dina[31:0],DBG_TexCache_addra[13:0],DBG_texCacheReadTexelsCount[15:0]" */;
  input clk;
  input [95:0]INTERP_InFIFO_rd_data;
  input INTERP_InFIFO_empty;
  output INTERP_InFIFO_rd_en;
  output [29:0]MEM_TexSampReadRequestsFIFO_wr_data;
  input MEM_TexSampReadRequestsFIFO_full;
  output MEM_TexSampReadRequestsFIFO_wr_en;
  input [255:0]MEM_TexSampReadResponsesFIFO_rd_data;
  input MEM_TexSampReadResponsesFIFO_empty;
  output MEM_TexSampReadResponsesFIFO_rd_en;
  input [73:0]STATE_StateBitsAtDrawID;
  input [15:0]STATE_NextDrawID;
  input STATE_StateIsValid;
  output STATE_ConsumeStateSlot;
  output [13:0]TexCache_addra;
  output [31:0]TexCache_dina;
  input [31:0]TexCache_douta;
  output TexCache_ena;
  output [0:0]TexCache_wea;
  output CMD_TexSampleIsIdle;
  output [63:0]ROP_OutFIFO_wr_data;
  input ROP_OutFIFO_full;
  output ROP_OutFIFO_wr_en;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [31:0]STAT_CyclesWaitingCacheLoad;
  output [15:0]STAT_CurrentDrawEventID;
  output [5:0]DBG_TexSample_State;
  output [31:0]DBG_TexCache_douta;
  output [31:0]DBG_TexCache_dina;
  output [13:0]DBG_TexCache_addra;
  output [15:0]DBG_texCacheReadTexelsCount;
endmodule
