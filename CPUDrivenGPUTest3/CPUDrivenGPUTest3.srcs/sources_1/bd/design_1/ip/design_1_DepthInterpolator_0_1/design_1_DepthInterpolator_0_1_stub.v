// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat May  3 22:46:55 2025
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_DepthInterpolator_0_1/design_1_DepthInterpolator_0_1_stub.v
// Design      : design_1_DepthInterpolator_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "DepthInterpolator,Vivado 2018.1_AR73068" *)
module design_1_DepthInterpolator_0_1(clk, TRICACHE_inBarycentricInverse, 
  TRICACHE_inZ0, TRICACHE_inZ10, TRICACHE_inZ20, TRICACHE_inInvW0, TRICACHE_inInvW10, 
  TRICACHE_inInvW20, TRICACHE_PopTriangleSlot, RASTOUT_FIFO_rd_data, RASTOUT_FIFO_empty, 
  RASTOUT_FIFO_rd_en, STATE_StateBitsAtDrawID, STATE_NextDrawID, STATE_StateIsValid, 
  STATE_ConsumeStateSlot, FPU_MUL_A, FPU_MUL_B, FPU_MUL_OUT, FPU_MUL_GO, FPU_CNV0_A, 
  FPU_CNV0_Mode, FPU_CNV0_OUT, FPU_CNV0_GO, FPU_CNV1_A, FPU_CNV1_Mode, FPU_CNV1_OUT, 
  FPU_CNV1_GO, FPU_SPEC_A, FPU_SPEC_OUT, FPU_SPEC_GO, DEPTH_PixelReady, DEPTH_PosX, DEPTH_PosY, 
  DEPTH_OutPixelDepth, DEPTH_PixelPassedDepthStencilTest, DEPTH_PixelFailedDepthTest, 
  DEPTH_PixelFailedStencilTest, DEPTH_SetDepthParams, DEPTH_DepthWriteEnable, 
  DEPTH_DepthFunction, DEPTH_StencilWriteEnable, DEPTH_StencilRefVal, 
  DEPTH_StencilReadMask, DEPTH_StencilWriteMask, DEPTH_StencilCmpFunc, 
  DEPTH_StencilFailOp, DEPTH_StencilZFailOp, DEPTH_StencilPassOp, DEPTH_DepthIsIdle, 
  ATTR_FIFO_wr_data, ATTR_FIFO_wr_en, ATTR_FIFO_full, ATTR_FIFO_almost_full, CMD_IsIdle, 
  STAT_CyclesIdle, STAT_CyclesSpentWorking, STAT_CyclesWaitingForOutput, 
  STAT_CurrentDrawEventID, STAT_DepthOnlyPixelsPassed, DBG_DepthInterpolator_State, 
  DBG_BarycentricConvertState, DBG_BarycentricNormalizeState, 
  DBG_InterpolatorDriverState, DBG_ShiftConvertZState, DBG_DepthTestDriverZState, 
  DBG_RastBarycentricB, DBG_RastBarycentricC, DBG_InterpolatedDepthU24, DBG_IdleVector, 
  DBG_BarycentricBCFIFO, DBG_CurrentDepthStencilState)
/* synthesis syn_black_box black_box_pad_pin="clk,TRICACHE_inBarycentricInverse[31:0],TRICACHE_inZ0[31:0],TRICACHE_inZ10[31:0],TRICACHE_inZ20[31:0],TRICACHE_inInvW0[31:0],TRICACHE_inInvW10[31:0],TRICACHE_inInvW20[31:0],TRICACHE_PopTriangleSlot,RASTOUT_FIFO_rd_data[95:0],RASTOUT_FIFO_empty,RASTOUT_FIFO_rd_en,STATE_StateBitsAtDrawID[76:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,FPU_MUL_A[31:0],FPU_MUL_B[31:0],FPU_MUL_OUT[31:0],FPU_MUL_GO,FPU_CNV0_A[31:0],FPU_CNV0_Mode[2:0],FPU_CNV0_OUT[31:0],FPU_CNV0_GO,FPU_CNV1_A[31:0],FPU_CNV1_Mode[2:0],FPU_CNV1_OUT[31:0],FPU_CNV1_GO,FPU_SPEC_A[31:0],FPU_SPEC_OUT[31:0],FPU_SPEC_GO,DEPTH_PixelReady,DEPTH_PosX[9:0],DEPTH_PosY[9:0],DEPTH_OutPixelDepth[23:0],DEPTH_PixelPassedDepthStencilTest,DEPTH_PixelFailedDepthTest,DEPTH_PixelFailedStencilTest,DEPTH_SetDepthParams,DEPTH_DepthWriteEnable,DEPTH_DepthFunction[2:0],DEPTH_StencilWriteEnable,DEPTH_StencilRefVal[7:0],DEPTH_StencilReadMask[7:0],DEPTH_StencilWriteMask[7:0],DEPTH_StencilCmpFunc[2:0],DEPTH_StencilFailOp[2:0],DEPTH_StencilZFailOp[2:0],DEPTH_StencilPassOp[2:0],DEPTH_DepthIsIdle,ATTR_FIFO_wr_data[127:0],ATTR_FIFO_wr_en,ATTR_FIFO_full,ATTR_FIFO_almost_full,CMD_IsIdle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],STAT_DepthOnlyPixelsPassed[31:0],DBG_DepthInterpolator_State[6:0],DBG_BarycentricConvertState[3:0],DBG_BarycentricNormalizeState[3:0],DBG_InterpolatorDriverState[3:0],DBG_ShiftConvertZState[3:0],DBG_DepthTestDriverZState[3:0],DBG_RastBarycentricB[31:0],DBG_RastBarycentricC[31:0],DBG_InterpolatedDepthU24[23:0],DBG_IdleVector[9:0],DBG_BarycentricBCFIFO[63:0],DBG_CurrentDepthStencilState[76:0]" */;
  input clk;
  input [31:0]TRICACHE_inBarycentricInverse;
  input [31:0]TRICACHE_inZ0;
  input [31:0]TRICACHE_inZ10;
  input [31:0]TRICACHE_inZ20;
  input [31:0]TRICACHE_inInvW0;
  input [31:0]TRICACHE_inInvW10;
  input [31:0]TRICACHE_inInvW20;
  output TRICACHE_PopTriangleSlot;
  input [95:0]RASTOUT_FIFO_rd_data;
  input RASTOUT_FIFO_empty;
  output RASTOUT_FIFO_rd_en;
  input [76:0]STATE_StateBitsAtDrawID;
  input [15:0]STATE_NextDrawID;
  input STATE_StateIsValid;
  output STATE_ConsumeStateSlot;
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
  output [31:0]FPU_SPEC_A;
  input [31:0]FPU_SPEC_OUT;
  output FPU_SPEC_GO;
  output DEPTH_PixelReady;
  output [9:0]DEPTH_PosX;
  output [9:0]DEPTH_PosY;
  output [23:0]DEPTH_OutPixelDepth;
  input DEPTH_PixelPassedDepthStencilTest;
  input DEPTH_PixelFailedDepthTest;
  input DEPTH_PixelFailedStencilTest;
  output DEPTH_SetDepthParams;
  output DEPTH_DepthWriteEnable;
  output [2:0]DEPTH_DepthFunction;
  output DEPTH_StencilWriteEnable;
  output [7:0]DEPTH_StencilRefVal;
  output [7:0]DEPTH_StencilReadMask;
  output [7:0]DEPTH_StencilWriteMask;
  output [2:0]DEPTH_StencilCmpFunc;
  output [2:0]DEPTH_StencilFailOp;
  output [2:0]DEPTH_StencilZFailOp;
  output [2:0]DEPTH_StencilPassOp;
  input DEPTH_DepthIsIdle;
  output [127:0]ATTR_FIFO_wr_data;
  output ATTR_FIFO_wr_en;
  input ATTR_FIFO_full;
  input ATTR_FIFO_almost_full;
  output CMD_IsIdle;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [15:0]STAT_CurrentDrawEventID;
  output [31:0]STAT_DepthOnlyPixelsPassed;
  output [6:0]DBG_DepthInterpolator_State;
  output [3:0]DBG_BarycentricConvertState;
  output [3:0]DBG_BarycentricNormalizeState;
  output [3:0]DBG_InterpolatorDriverState;
  output [3:0]DBG_ShiftConvertZState;
  output [3:0]DBG_DepthTestDriverZState;
  output [31:0]DBG_RastBarycentricB;
  output [31:0]DBG_RastBarycentricC;
  output [23:0]DBG_InterpolatedDepthU24;
  output [9:0]DBG_IdleVector;
  output [63:0]DBG_BarycentricBCFIFO;
  output [76:0]DBG_CurrentDepthStencilState;
endmodule
