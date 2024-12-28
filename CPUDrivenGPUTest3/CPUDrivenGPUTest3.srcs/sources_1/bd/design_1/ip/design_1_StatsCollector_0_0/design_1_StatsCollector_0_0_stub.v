// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:28:54 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_StatsCollector_0_0/design_1_StatsCollector_0_0_stub.v
// Design      : design_1_StatsCollector_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "StatsCollector,Vivado 2018.1_AR73068" *)
module design_1_StatsCollector_0_0(clk, CMD_PresentSignal, 
  CMD_SetNewStatsConfig, CMD_WriteFrameStatsAddress, CMD_EnableEventTimestamps, 
  CMD_WriteEventTimestampsAddress, CMD_WriteEventTimestampOrders, 
  CMD_CountTimestampsMemoryWrites, CMD_CountTimestampsOrdersMemoryWrites, 
  CMD_StatsSaveComplete, MEM_StatsWriteRequestsFIFO_wr_data, 
  MEM_StatsWriteRequestsFIFO_full, MEM_StatsWriteRequestsFIFO_wr_en, 
  STAT_WriteOrderNibblesFIFO_wr_data, STAT_WriteOrderNibblesFIFO_full, 
  STAT_WriteOrderNibblesFIFO_wr_en, STAT_WriteOrderNibblesFIFO_rd_data, 
  STAT_WriteOrderNibblesFIFO_empty, STAT_WriteOrderNibblesFIFO_rd_en, 
  STAT_ResetWriteOrderNibblesFIFO, VBB_CyclesIdle, VBB_CyclesSpentWorking, 
  VBB_CyclesWaitingForOutput, VBB_CurrentDrawEventID, VSHADER_CyclesIdle, 
  VSHADER_CyclesSpentWorking, VSHADER_CyclesExecShaderCode, 
  VSHADER_CyclesWaitingForOutput, VSHADER_CurrentDrawEventID, IA_CyclesIdle, 
  IA_CyclesSpentWorking, IA_CyclesLoadingDataToCache, IA_CyclesWaitingForOutput, 
  IA_CurrentDrawEventID, CLIP_CyclesIdle, CLIP_CyclesSpentWorking, 
  CLIP_CyclesWaitingForOutput, CLIP_CurrentDrawEventID, TRISETUP_CyclesIdle, 
  TRISETUP_CyclesSpentWorking, TRISETUP_CyclesWaitingForOutput, 
  TRISETUP_CurrentDrawEventID, RAST_CyclesIdle, RAST_CyclesSpentWorking, 
  RAST_CyclesWaitingForOutput, RAST_CyclesWaitingForTriWorkCache, 
  RAST_CurrentDrawEventID, DINTERP_CyclesIdle, DINTERP_CyclesSpentWorking, 
  DINTERP_CyclesWaitingForOutput, DINTERP_CurrentDrawEventID, INTERP_CyclesIdle, 
  INTERP_CyclesSpentWorking, INTERP_CyclesWaitingForOutput, INTERP_CurrentDrawEventID, 
  TEXSAMP_CyclesIdle, TEXSAMP_CyclesSpentWorking, TEXSAMP_CyclesWaitingForOutput, 
  TEXSAMP_CyclesWaitingCacheLoad, TEXSAMP_CurrentDrawEventID, ROP_CyclesIdle, 
  ROP_CyclesSpentWorking, ROP_CyclesWaitingForOutput, ROP_CyclesWaitingForMemoryRead, 
  ROP_CountCacheHits, ROP_CountCacheMisses, ROP_CurrentDrawEventID, CMD_CyclesIdle, 
  CMD_CyclesSpentWorking, MEM_ReadCyclesIdle, MEM_ReadCyclesSpentWorking, 
  MEM_WriteCyclesIdle, MEM_WriteCyclesSpentWorking, MEM_MemReadCountBytesTransferred, 
  MEM_MemReadCountTransactions, MEM_MemReadCountNonScanoutBytesTransferred, 
  MEM_MemReadCountNonScanoutTransactions, MEM_MemWriteCountBytesTransferred, 
  MEM_MemWriteCountTransactions, DBG_CurrentState, DBG_EventsWriteIsReady, 
  DBG_EventsWriteIsReadyAck, DBG_CurrentWriteOrderNibbles, DBG_CurrentWriteData, 
  DBG_CurrentWriteEn)
/* synthesis syn_black_box black_box_pad_pin="clk,CMD_PresentSignal,CMD_SetNewStatsConfig,CMD_WriteFrameStatsAddress[29:0],CMD_EnableEventTimestamps,CMD_WriteEventTimestampsAddress[29:0],CMD_WriteEventTimestampOrders[29:0],CMD_CountTimestampsMemoryWrites[15:0],CMD_CountTimestampsOrdersMemoryWrites[15:0],CMD_StatsSaveComplete,MEM_StatsWriteRequestsFIFO_wr_data[293:0],MEM_StatsWriteRequestsFIFO_full,MEM_StatsWriteRequestsFIFO_wr_en,STAT_WriteOrderNibblesFIFO_wr_data[15:0],STAT_WriteOrderNibblesFIFO_full,STAT_WriteOrderNibblesFIFO_wr_en,STAT_WriteOrderNibblesFIFO_rd_data[15:0],STAT_WriteOrderNibblesFIFO_empty,STAT_WriteOrderNibblesFIFO_rd_en,STAT_ResetWriteOrderNibblesFIFO,VBB_CyclesIdle[31:0],VBB_CyclesSpentWorking[31:0],VBB_CyclesWaitingForOutput[31:0],VBB_CurrentDrawEventID[15:0],VSHADER_CyclesIdle[31:0],VSHADER_CyclesSpentWorking[31:0],VSHADER_CyclesExecShaderCode[31:0],VSHADER_CyclesWaitingForOutput[31:0],VSHADER_CurrentDrawEventID[15:0],IA_CyclesIdle[31:0],IA_CyclesSpentWorking[31:0],IA_CyclesLoadingDataToCache[31:0],IA_CyclesWaitingForOutput[31:0],IA_CurrentDrawEventID[15:0],CLIP_CyclesIdle[31:0],CLIP_CyclesSpentWorking[31:0],CLIP_CyclesWaitingForOutput[31:0],CLIP_CurrentDrawEventID[15:0],TRISETUP_CyclesIdle[31:0],TRISETUP_CyclesSpentWorking[31:0],TRISETUP_CyclesWaitingForOutput[31:0],TRISETUP_CurrentDrawEventID[15:0],RAST_CyclesIdle[31:0],RAST_CyclesSpentWorking[31:0],RAST_CyclesWaitingForOutput[31:0],RAST_CyclesWaitingForTriWorkCache[31:0],RAST_CurrentDrawEventID[15:0],DINTERP_CyclesIdle[31:0],DINTERP_CyclesSpentWorking[31:0],DINTERP_CyclesWaitingForOutput[31:0],DINTERP_CurrentDrawEventID[15:0],INTERP_CyclesIdle[31:0],INTERP_CyclesSpentWorking[31:0],INTERP_CyclesWaitingForOutput[31:0],INTERP_CurrentDrawEventID[15:0],TEXSAMP_CyclesIdle[31:0],TEXSAMP_CyclesSpentWorking[31:0],TEXSAMP_CyclesWaitingForOutput[31:0],TEXSAMP_CyclesWaitingCacheLoad[31:0],TEXSAMP_CurrentDrawEventID[15:0],ROP_CyclesIdle[31:0],ROP_CyclesSpentWorking[31:0],ROP_CyclesWaitingForOutput[31:0],ROP_CyclesWaitingForMemoryRead[31:0],ROP_CountCacheHits[31:0],ROP_CountCacheMisses[31:0],ROP_CurrentDrawEventID[15:0],CMD_CyclesIdle[31:0],CMD_CyclesSpentWorking[31:0],MEM_ReadCyclesIdle[31:0],MEM_ReadCyclesSpentWorking[31:0],MEM_WriteCyclesIdle[31:0],MEM_WriteCyclesSpentWorking[31:0],MEM_MemReadCountBytesTransferred[31:0],MEM_MemReadCountTransactions[31:0],MEM_MemReadCountNonScanoutBytesTransferred[31:0],MEM_MemReadCountNonScanoutTransactions[31:0],MEM_MemWriteCountBytesTransferred[31:0],MEM_MemWriteCountTransactions[31:0],DBG_CurrentState[4:0],DBG_EventsWriteIsReady[9:0],DBG_EventsWriteIsReadyAck[9:0],DBG_CurrentWriteOrderNibbles[15:0],DBG_CurrentWriteData[293:0],DBG_CurrentWriteEn" */;
  input clk;
  input CMD_PresentSignal;
  input CMD_SetNewStatsConfig;
  input [29:0]CMD_WriteFrameStatsAddress;
  input CMD_EnableEventTimestamps;
  input [29:0]CMD_WriteEventTimestampsAddress;
  input [29:0]CMD_WriteEventTimestampOrders;
  output [15:0]CMD_CountTimestampsMemoryWrites;
  output [15:0]CMD_CountTimestampsOrdersMemoryWrites;
  output CMD_StatsSaveComplete;
  output [293:0]MEM_StatsWriteRequestsFIFO_wr_data;
  input MEM_StatsWriteRequestsFIFO_full;
  output MEM_StatsWriteRequestsFIFO_wr_en;
  output [15:0]STAT_WriteOrderNibblesFIFO_wr_data;
  input STAT_WriteOrderNibblesFIFO_full;
  output STAT_WriteOrderNibblesFIFO_wr_en;
  input [15:0]STAT_WriteOrderNibblesFIFO_rd_data;
  input STAT_WriteOrderNibblesFIFO_empty;
  output STAT_WriteOrderNibblesFIFO_rd_en;
  output STAT_ResetWriteOrderNibblesFIFO;
  input [31:0]VBB_CyclesIdle;
  input [31:0]VBB_CyclesSpentWorking;
  input [31:0]VBB_CyclesWaitingForOutput;
  input [15:0]VBB_CurrentDrawEventID;
  input [31:0]VSHADER_CyclesIdle;
  input [31:0]VSHADER_CyclesSpentWorking;
  input [31:0]VSHADER_CyclesExecShaderCode;
  input [31:0]VSHADER_CyclesWaitingForOutput;
  input [15:0]VSHADER_CurrentDrawEventID;
  input [31:0]IA_CyclesIdle;
  input [31:0]IA_CyclesSpentWorking;
  input [31:0]IA_CyclesLoadingDataToCache;
  input [31:0]IA_CyclesWaitingForOutput;
  input [15:0]IA_CurrentDrawEventID;
  input [31:0]CLIP_CyclesIdle;
  input [31:0]CLIP_CyclesSpentWorking;
  input [31:0]CLIP_CyclesWaitingForOutput;
  input [15:0]CLIP_CurrentDrawEventID;
  input [31:0]TRISETUP_CyclesIdle;
  input [31:0]TRISETUP_CyclesSpentWorking;
  input [31:0]TRISETUP_CyclesWaitingForOutput;
  input [15:0]TRISETUP_CurrentDrawEventID;
  input [31:0]RAST_CyclesIdle;
  input [31:0]RAST_CyclesSpentWorking;
  input [31:0]RAST_CyclesWaitingForOutput;
  input [31:0]RAST_CyclesWaitingForTriWorkCache;
  input [15:0]RAST_CurrentDrawEventID;
  input [31:0]DINTERP_CyclesIdle;
  input [31:0]DINTERP_CyclesSpentWorking;
  input [31:0]DINTERP_CyclesWaitingForOutput;
  input [15:0]DINTERP_CurrentDrawEventID;
  input [31:0]INTERP_CyclesIdle;
  input [31:0]INTERP_CyclesSpentWorking;
  input [31:0]INTERP_CyclesWaitingForOutput;
  input [15:0]INTERP_CurrentDrawEventID;
  input [31:0]TEXSAMP_CyclesIdle;
  input [31:0]TEXSAMP_CyclesSpentWorking;
  input [31:0]TEXSAMP_CyclesWaitingForOutput;
  input [31:0]TEXSAMP_CyclesWaitingCacheLoad;
  input [15:0]TEXSAMP_CurrentDrawEventID;
  input [31:0]ROP_CyclesIdle;
  input [31:0]ROP_CyclesSpentWorking;
  input [31:0]ROP_CyclesWaitingForOutput;
  input [31:0]ROP_CyclesWaitingForMemoryRead;
  input [31:0]ROP_CountCacheHits;
  input [31:0]ROP_CountCacheMisses;
  input [15:0]ROP_CurrentDrawEventID;
  input [31:0]CMD_CyclesIdle;
  input [31:0]CMD_CyclesSpentWorking;
  input [31:0]MEM_ReadCyclesIdle;
  input [31:0]MEM_ReadCyclesSpentWorking;
  input [31:0]MEM_WriteCyclesIdle;
  input [31:0]MEM_WriteCyclesSpentWorking;
  input [31:0]MEM_MemReadCountBytesTransferred;
  input [31:0]MEM_MemReadCountTransactions;
  input [31:0]MEM_MemReadCountNonScanoutBytesTransferred;
  input [31:0]MEM_MemReadCountNonScanoutTransactions;
  input [31:0]MEM_MemWriteCountBytesTransferred;
  input [31:0]MEM_MemWriteCountTransactions;
  output [4:0]DBG_CurrentState;
  output [9:0]DBG_EventsWriteIsReady;
  output [9:0]DBG_EventsWriteIsReadyAck;
  output [15:0]DBG_CurrentWriteOrderNibbles;
  output [293:0]DBG_CurrentWriteData;
  output DBG_CurrentWriteEn;
endmodule
