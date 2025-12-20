// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:21:31 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StatsCollector_0_0/MainDesign_StatsCollector_0_0_stub.v
// Design      : MainDesign_StatsCollector_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_StatsCollector_0_0,StatsCollector,{}" *) (* core_generation_info = "MainDesign_StatsCollector_0_0,StatsCollector,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=StatsCollector,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "StatsCollector,Vivado 2025.2" *) 
module MainDesign_StatsCollector_0_0(clk, CMD_PresentSignal, 
  CMD_SetNewStatsConfig, CMD_WriteFrameStatsAddress, CMD_EnableEventTimestamps, 
  CMD_WriteEventTimestampsAddress, CMD_WriteEventTimestampOrders, 
  CMD_CountTimestampsMemoryWrites, CMD_CountTimestampsOrdersMemoryWrites, 
  CMD_StatsSaveComplete, MEM_StatsWriteRequestsFIFO_wr_data, 
  MEM_StatsWriteRequestsFIFO_full, MEM_StatsWriteRequestsFIFO_wr_en, 
  STAT_WriteOrderNibblesFIFO_wr_data, STAT_WriteOrderNibblesFIFO_full, 
  STAT_WriteOrderNibblesFIFO_wr_en, STAT_WriteOrderNibblesFIFO_rd_data, 
  STAT_WriteOrderNibblesFIFO_empty, STAT_WriteOrderNibblesFIFO_almost_empty, 
  STAT_WriteOrderNibblesFIFO_rd_en, STAT_ResetWriteOrderNibblesFIFO, 
  SAMP_SamplingIntervalCycles, SAMP_CurrentWriteIndex, SAMP_Reset, SAMP_cache_addrb, 
  SAMP_cache_doutb, SAMP_cache_enb, SAMP_cache_clk, VBB_CyclesIdle, VBB_CyclesSpentWorking, 
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
/* synthesis syn_black_box black_box_pad_pin="CMD_PresentSignal,CMD_SetNewStatsConfig,CMD_WriteFrameStatsAddress[29:0],CMD_EnableEventTimestamps,CMD_WriteEventTimestampsAddress[29:0],CMD_WriteEventTimestampOrders[29:0],CMD_CountTimestampsMemoryWrites[15:0],CMD_CountTimestampsOrdersMemoryWrites[15:0],CMD_StatsSaveComplete,MEM_StatsWriteRequestsFIFO_wr_data[293:0],MEM_StatsWriteRequestsFIFO_full,MEM_StatsWriteRequestsFIFO_wr_en,STAT_WriteOrderNibblesFIFO_wr_data[15:0],STAT_WriteOrderNibblesFIFO_full,STAT_WriteOrderNibblesFIFO_wr_en,STAT_WriteOrderNibblesFIFO_rd_data[15:0],STAT_WriteOrderNibblesFIFO_empty,STAT_WriteOrderNibblesFIFO_almost_empty,STAT_WriteOrderNibblesFIFO_rd_en,STAT_ResetWriteOrderNibblesFIFO,SAMP_SamplingIntervalCycles[31:0],SAMP_CurrentWriteIndex[9:0],SAMP_Reset,SAMP_cache_addrb[9:0],SAMP_cache_doutb[31:0],SAMP_cache_enb,VBB_CyclesIdle[31:0],VBB_CyclesSpentWorking[31:0],VBB_CyclesWaitingForOutput[31:0],VBB_CurrentDrawEventID[15:0],VSHADER_CyclesIdle[31:0],VSHADER_CyclesSpentWorking[31:0],VSHADER_CyclesExecShaderCode[31:0],VSHADER_CyclesWaitingForOutput[31:0],VSHADER_CurrentDrawEventID[15:0],IA_CyclesIdle[31:0],IA_CyclesSpentWorking[31:0],IA_CyclesLoadingDataToCache[31:0],IA_CyclesWaitingForOutput[31:0],IA_CurrentDrawEventID[15:0],CLIP_CyclesIdle[31:0],CLIP_CyclesSpentWorking[31:0],CLIP_CyclesWaitingForOutput[31:0],CLIP_CurrentDrawEventID[15:0],TRISETUP_CyclesIdle[31:0],TRISETUP_CyclesSpentWorking[31:0],TRISETUP_CyclesWaitingForOutput[31:0],TRISETUP_CurrentDrawEventID[15:0],RAST_CyclesIdle[31:0],RAST_CyclesSpentWorking[31:0],RAST_CyclesWaitingForOutput[31:0],RAST_CyclesWaitingForTriWorkCache[31:0],RAST_CurrentDrawEventID[15:0],DINTERP_CyclesIdle[31:0],DINTERP_CyclesSpentWorking[31:0],DINTERP_CyclesWaitingForOutput[31:0],DINTERP_CurrentDrawEventID[15:0],INTERP_CyclesIdle[31:0],INTERP_CyclesSpentWorking[31:0],INTERP_CyclesWaitingForOutput[31:0],INTERP_CurrentDrawEventID[15:0],TEXSAMP_CyclesIdle[31:0],TEXSAMP_CyclesSpentWorking[31:0],TEXSAMP_CyclesWaitingForOutput[31:0],TEXSAMP_CyclesWaitingCacheLoad[31:0],TEXSAMP_CurrentDrawEventID[15:0],ROP_CyclesIdle[31:0],ROP_CyclesSpentWorking[31:0],ROP_CyclesWaitingForOutput[31:0],ROP_CyclesWaitingForMemoryRead[31:0],ROP_CountCacheHits[31:0],ROP_CountCacheMisses[31:0],ROP_CurrentDrawEventID[15:0],CMD_CyclesIdle[31:0],CMD_CyclesSpentWorking[31:0],MEM_ReadCyclesIdle[31:0],MEM_ReadCyclesSpentWorking[31:0],MEM_WriteCyclesIdle[31:0],MEM_WriteCyclesSpentWorking[31:0],MEM_MemReadCountBytesTransferred[31:0],MEM_MemReadCountTransactions[31:0],MEM_MemReadCountNonScanoutBytesTransferred[31:0],MEM_MemReadCountNonScanoutTransactions[31:0],MEM_MemWriteCountBytesTransferred[31:0],MEM_MemWriteCountTransactions[31:0],DBG_CurrentState[4:0],DBG_EventsWriteIsReady[9:0],DBG_EventsWriteIsReadyAck[9:0],DBG_CurrentWriteOrderNibbles[15:0],DBG_CurrentWriteData[293:0],DBG_CurrentWriteEn" */
/* synthesis syn_force_seq_prim="clk" */
/* synthesis syn_force_seq_prim="SAMP_cache_clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF StatsWriteRequestsFIFO:StatsWriteOrderNibblesFIFO_WR:StatsWriteOrderNibblesFIFO_RD:SamplerCache, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  input CMD_PresentSignal;
  input CMD_SetNewStatsConfig;
  input [29:0]CMD_WriteFrameStatsAddress;
  input CMD_EnableEventTimestamps;
  input [29:0]CMD_WriteEventTimestampsAddress;
  input [29:0]CMD_WriteEventTimestampOrders;
  output [15:0]CMD_CountTimestampsMemoryWrites;
  output [15:0]CMD_CountTimestampsOrdersMemoryWrites;
  output CMD_StatsSaveComplete;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO WR_DATA" *) (* x_interface_mode = "master StatsWriteRequestsFIFO" *) output [293:0]MEM_StatsWriteRequestsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO FULL" *) input MEM_StatsWriteRequestsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 StatsWriteRequestsFIFO WR_EN" *) output MEM_StatsWriteRequestsFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR WR_DATA" *) (* x_interface_mode = "master StatsWriteOrderNibblesFIFO_WR" *) output [15:0]STAT_WriteOrderNibblesFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR FULL" *) input STAT_WriteOrderNibblesFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 StatsWriteOrderNibblesFIFO_WR WR_EN" *) output STAT_WriteOrderNibblesFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD RD_DATA" *) (* x_interface_mode = "master StatsWriteOrderNibblesFIFO_RD" *) input [15:0]STAT_WriteOrderNibblesFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD EMPTY" *) input STAT_WriteOrderNibblesFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD ALMOST_EMPTY" *) input STAT_WriteOrderNibblesFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 StatsWriteOrderNibblesFIFO_RD RD_EN" *) output STAT_WriteOrderNibblesFIFO_rd_en;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 STAT_ResetWriteOrderNibblesFIFO RST" *) (* x_interface_mode = "master STAT_ResetWriteOrderNibblesFIFO" *) (* x_interface_parameter = "XIL_INTERFACENAME STAT_ResetWriteOrderNibblesFIFO, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) output STAT_ResetWriteOrderNibblesFIFO;
  output [31:0]SAMP_SamplingIntervalCycles;
  input [9:0]SAMP_CurrentWriteIndex;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 SAMP_Reset RST" *) (* x_interface_mode = "master SAMP_Reset" *) (* x_interface_parameter = "XIL_INTERFACENAME SAMP_Reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) output SAMP_Reset;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplerCache ADDR" *) (* x_interface_mode = "master SamplerCache" *) (* x_interface_parameter = "XIL_INTERFACENAME SamplerCache, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output [9:0]SAMP_cache_addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplerCache DOUT" *) input [31:0]SAMP_cache_doutb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplerCache EN" *) output SAMP_cache_enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 SamplerCache CLK" *) output SAMP_cache_clk /* synthesis syn_isclock = 1 */;
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
