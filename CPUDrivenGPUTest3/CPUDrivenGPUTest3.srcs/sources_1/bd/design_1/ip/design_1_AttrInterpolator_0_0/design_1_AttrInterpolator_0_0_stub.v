// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sun Oct 20 15:46:43 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_AttrInterpolator_0_0/design_1_AttrInterpolator_0_0_stub.v
// Design      : design_1_AttrInterpolator_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "AttrInterpolator,Vivado 2018.1_AR73068" *)
module design_1_AttrInterpolator_0_0(clk, DINTERP_FIFO_rd_data, 
  DINTERP_FIFO_empty, DINTERP_FIFO_rd_en, TRICACHE_inT0X, TRICACHE_inT0Y, TRICACHE_inT10X, 
  TRICACHE_inT10Y, TRICACHE_inT20X, TRICACHE_inT20Y, TRICACHE_inColorRGBA0, 
  TRICACHE_inColorRGBA10, TRICACHE_inColorRGBA20, TRICACHE_PopTriangleSlot, FPU_MUL_A, 
  FPU_MUL_B, FPU_MUL_OUT, FPU_MUL_GO, FPU_CNV0_A, FPU_CNV0_Mode, FPU_CNV0_OUT, FPU_CNV0_GO, 
  FPU_CNV1_A, FPU_CNV1_Mode, FPU_CNV1_OUT, FPU_CNV1_GO, TEXSAMP_OutFIFO_wr_data, 
  TEXSAMP_OutFIFO_full, TEXSAMP_OutFIFO_wr_en, TEXSAMP_OutFIFO_almost_full, 
  STATE_StateBitsAtDrawID, STATE_NextDrawID, STATE_StateIsValid, STATE_ConsumeStateSlot, 
  CMD_IsIdle, STAT_CyclesIdle, STAT_CyclesSpentWorking, STAT_CyclesWaitingForOutput, 
  STAT_CurrentDrawEventID, DBG_AttrInterpolator_State, DBG_InterpolatorDriver_State, 
  DBG_MultiplierDriver_State, DBG_ConverterDriver_State, DBG_OutputDriver_State, 
  DBG_PixelWFIFO, DBG_RastBarycentricB, DBG_RastBarycentricC, DBG_CurrentDrawEvent)
/* synthesis syn_black_box black_box_pad_pin="clk,DINTERP_FIFO_rd_data[127:0],DINTERP_FIFO_empty,DINTERP_FIFO_rd_en,TRICACHE_inT0X[31:0],TRICACHE_inT0Y[31:0],TRICACHE_inT10X[31:0],TRICACHE_inT10Y[31:0],TRICACHE_inT20X[31:0],TRICACHE_inT20Y[31:0],TRICACHE_inColorRGBA0[127:0],TRICACHE_inColorRGBA10[127:0],TRICACHE_inColorRGBA20[127:0],TRICACHE_PopTriangleSlot,FPU_MUL_A[31:0],FPU_MUL_B[31:0],FPU_MUL_OUT[31:0],FPU_MUL_GO,FPU_CNV0_A[31:0],FPU_CNV0_Mode[2:0],FPU_CNV0_OUT[31:0],FPU_CNV0_GO,FPU_CNV1_A[31:0],FPU_CNV1_Mode[2:0],FPU_CNV1_OUT[31:0],FPU_CNV1_GO,TEXSAMP_OutFIFO_wr_data[95:0],TEXSAMP_OutFIFO_full,TEXSAMP_OutFIFO_wr_en,TEXSAMP_OutFIFO_almost_full,STATE_StateBitsAtDrawID[6:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,CMD_IsIdle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_AttrInterpolator_State[2:0],DBG_InterpolatorDriver_State[2:0],DBG_MultiplierDriver_State[2:0],DBG_ConverterDriver_State[2:0],DBG_OutputDriver_State[2:0],DBG_PixelWFIFO[31:0],DBG_RastBarycentricB[31:0],DBG_RastBarycentricC[31:0],DBG_CurrentDrawEvent[15:0]" */;
  input clk;
  input [127:0]DINTERP_FIFO_rd_data;
  input DINTERP_FIFO_empty;
  output DINTERP_FIFO_rd_en;
  input [31:0]TRICACHE_inT0X;
  input [31:0]TRICACHE_inT0Y;
  input [31:0]TRICACHE_inT10X;
  input [31:0]TRICACHE_inT10Y;
  input [31:0]TRICACHE_inT20X;
  input [31:0]TRICACHE_inT20Y;
  input [127:0]TRICACHE_inColorRGBA0;
  input [127:0]TRICACHE_inColorRGBA10;
  input [127:0]TRICACHE_inColorRGBA20;
  output TRICACHE_PopTriangleSlot;
  output [31:0]FPU_MUL_A;
  output [31:0]FPU_MUL_B;
  input [31:0]FPU_MUL_OUT;
  output FPU_MUL_GO;
  output [31:0]FPU_CNV0_A;
  output [2:0]FPU_CNV0_Mode;
  input [31:0]FPU_CNV0_OUT;
  output FPU_CNV0_GO;
  output [31:0]FPU_CNV1_A;
  output [2:0]FPU_CNV1_Mode;
  input [31:0]FPU_CNV1_OUT;
  output FPU_CNV1_GO;
  output [95:0]TEXSAMP_OutFIFO_wr_data;
  input TEXSAMP_OutFIFO_full;
  output TEXSAMP_OutFIFO_wr_en;
  input TEXSAMP_OutFIFO_almost_full;
  input [6:0]STATE_StateBitsAtDrawID;
  input [15:0]STATE_NextDrawID;
  input STATE_StateIsValid;
  output STATE_ConsumeStateSlot;
  output CMD_IsIdle;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [15:0]STAT_CurrentDrawEventID;
  output [2:0]DBG_AttrInterpolator_State;
  output [2:0]DBG_InterpolatorDriver_State;
  output [2:0]DBG_MultiplierDriver_State;
  output [2:0]DBG_ConverterDriver_State;
  output [2:0]DBG_OutputDriver_State;
  output [31:0]DBG_PixelWFIFO;
  output [31:0]DBG_RastBarycentricB;
  output [31:0]DBG_RastBarycentricC;
  output [15:0]DBG_CurrentDrawEvent;
endmodule
