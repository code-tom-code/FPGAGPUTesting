// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Apr 26 19:22:59 2025
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ROP_0_0/design_1_ROP_0_0_stub.v
// Design      : design_1_ROP_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ROP,Vivado 2018.1_AR73068" *)
module design_1_ROP_0_0(clk, MEM_ROPReadRequestsFIFO_wr_data, 
  MEM_ROPReadRequestsFIFO_full, MEM_ROPReadRequestsFIFO_wr_en, 
  MEM_ROPReadResponsesFIFO_rd_data, MEM_ROPReadResponsesFIFO_empty, 
  MEM_ROPReadResponsesFIFO_rd_en, MEM_ROPWriteRequestsFIFO_wr_data, 
  MEM_ROPWriteRequestsFIFO_full, MEM_ROPWriteRequestsFIFO_wr_en, CMD_SetClearColor, 
  CMD_ClearSignal, CMD_ClearSignalAck, CMD_FlushCacheSignal, CMD_FlushCacheAck, 
  CMD_ROPIsIdle, STATE_StateBitsAtDrawID, STATE_NextDrawID, STATE_StateIsValid, 
  STATE_ConsumeStateSlot, TEXSAMP_InFIFO_rd_data, TEXSAMP_InFIFO_empty, 
  TEXSAMP_InFIFO_rd_en, STAT_CyclesIdle, STAT_CyclesSpentWorking, 
  STAT_CyclesWaitingForOutput, STAT_CyclesWaitingForMemoryRead, STAT_CountCacheHits, 
  STAT_CountCacheMisses, STAT_CurrentDrawEventID, STAT_CountPixelsPassed, DBG_ROP_State, 
  DBG_CurrentPixelAddr, DBG_CurrentBlendedColor, DBG_PreviousFramebufferColor, 
  DBG_CurrentCacheLineDirtyFlags, DBG_TempSelectedOutputRGB, DBG_TempSelectedOutputA, 
  DBG_TempBlendedOutputRGB, DBG_TempBlendedOutputA, DBG_ReadRequestFIFOFull)
/* synthesis syn_black_box black_box_pad_pin="clk,MEM_ROPReadRequestsFIFO_wr_data[29:0],MEM_ROPReadRequestsFIFO_full,MEM_ROPReadRequestsFIFO_wr_en,MEM_ROPReadResponsesFIFO_rd_data[255:0],MEM_ROPReadResponsesFIFO_empty,MEM_ROPReadResponsesFIFO_rd_en,MEM_ROPWriteRequestsFIFO_wr_data[293:0],MEM_ROPWriteRequestsFIFO_full,MEM_ROPWriteRequestsFIFO_wr_en,CMD_SetClearColor[31:0],CMD_ClearSignal,CMD_ClearSignalAck,CMD_FlushCacheSignal,CMD_FlushCacheAck,CMD_ROPIsIdle,STATE_StateBitsAtDrawID[100:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,TEXSAMP_InFIFO_rd_data[63:0],TEXSAMP_InFIFO_empty,TEXSAMP_InFIFO_rd_en,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CyclesWaitingForMemoryRead[31:0],STAT_CountCacheHits[31:0],STAT_CountCacheMisses[31:0],STAT_CurrentDrawEventID[15:0],STAT_CountPixelsPassed[31:0],DBG_ROP_State[4:0],DBG_CurrentPixelAddr[29:0],DBG_CurrentBlendedColor[31:0],DBG_PreviousFramebufferColor[31:0],DBG_CurrentCacheLineDirtyFlags[7:0],DBG_TempSelectedOutputRGB[47:0],DBG_TempSelectedOutputA[15:0],DBG_TempBlendedOutputRGB[95:0],DBG_TempBlendedOutputA[31:0],DBG_ReadRequestFIFOFull" */;
  input clk;
  output [29:0]MEM_ROPReadRequestsFIFO_wr_data;
  input MEM_ROPReadRequestsFIFO_full;
  output MEM_ROPReadRequestsFIFO_wr_en;
  input [255:0]MEM_ROPReadResponsesFIFO_rd_data;
  input MEM_ROPReadResponsesFIFO_empty;
  output MEM_ROPReadResponsesFIFO_rd_en;
  output [293:0]MEM_ROPWriteRequestsFIFO_wr_data;
  input MEM_ROPWriteRequestsFIFO_full;
  output MEM_ROPWriteRequestsFIFO_wr_en;
  input [31:0]CMD_SetClearColor;
  input CMD_ClearSignal;
  output CMD_ClearSignalAck;
  input CMD_FlushCacheSignal;
  output CMD_FlushCacheAck;
  output CMD_ROPIsIdle;
  input [100:0]STATE_StateBitsAtDrawID;
  input [15:0]STATE_NextDrawID;
  input STATE_StateIsValid;
  output STATE_ConsumeStateSlot;
  input [63:0]TEXSAMP_InFIFO_rd_data;
  input TEXSAMP_InFIFO_empty;
  output TEXSAMP_InFIFO_rd_en;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [31:0]STAT_CyclesWaitingForMemoryRead;
  output [31:0]STAT_CountCacheHits;
  output [31:0]STAT_CountCacheMisses;
  output [15:0]STAT_CurrentDrawEventID;
  output [31:0]STAT_CountPixelsPassed;
  output [4:0]DBG_ROP_State;
  output [29:0]DBG_CurrentPixelAddr;
  output [31:0]DBG_CurrentBlendedColor;
  output [31:0]DBG_PreviousFramebufferColor;
  output [7:0]DBG_CurrentCacheLineDirtyFlags;
  output [47:0]DBG_TempSelectedOutputRGB;
  output [15:0]DBG_TempSelectedOutputA;
  output [95:0]DBG_TempBlendedOutputRGB;
  output [31:0]DBG_TempBlendedOutputA;
  output DBG_ReadRequestFIFOFull;
endmodule
