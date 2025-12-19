// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:16:43 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_Rasterizer_0_0/design_1_Rasterizer_0_0_stub.v
// Design      : design_1_Rasterizer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "Rasterizer,Vivado 2018.1_AR73068" *)
module design_1_Rasterizer_0_0(clk, TRISETUP_newTriBegin, 
  TRISETUP_readyForNewTri, TRISETUP_CurrentDrawEventID, TRISETUP_inMinX, TRISETUP_inMaxX, 
  TRISETUP_inMinY, TRISETUP_inMaxY, TRISETUP_inInitialBarycentricRowResetA, 
  TRISETUP_inInitialBarycentricRowResetB, TRISETUP_inInitialBarycentricRowResetC, 
  TRISETUP_inIsTopLeftEdgeA, TRISETUP_inIsTopLeftEdgeB, TRISETUP_inIsTopLeftEdgeC, 
  TRISETUP_inBarycentricXDeltaA, TRISETUP_inBarycentricXDeltaB, 
  TRISETUP_inBarycentricXDeltaC, TRISETUP_inBarycentricYDeltaA, 
  TRISETUP_inBarycentricYDeltaB, TRISETUP_inBarycentricYDeltaC, 
  TRISETUP_inBarycentricInverse, TRISETUP_inZ0, TRISETUP_inZ10, TRISETUP_inZ20, 
  TRISETUP_inInvW0, TRISETUP_inInvW10, TRISETUP_inInvW20, TRISETUP_inTX0, TRISETUP_inTY0, 
  TRISETUP_inTX10, TRISETUP_inTY10, TRISETUP_inTX20, TRISETUP_inTY20, 
  TRISETUP_inVertColor0, TRISETUP_inVertColor10, TRISETUP_inVertColor20, 
  RASTOUT_FIFO_full, RASTOUT_FIFO_almost_full, RASTOUT_FIFO_wr_data, RASTOUT_FIFO_wr_en, 
  TRICACHE_BarycentricInverse, TRICACHE_Z0, TRICACHE_Z10, TRICACHE_Z20, TRICACHE_InvW0, 
  TRICACHE_InvW10, TRICACHE_InvW20, TRICACHE_TX0, TRICACHE_TX10, TRICACHE_TX20, TRICACHE_TY0, 
  TRICACHE_TY10, TRICACHE_TY20, TRICACHE_VertColor0, TRICACHE_VertColor10, 
  TRICACHE_VertColor20, TRICACHE_PushNewTriData, TRICACHE_IsFull, CMD_Rasterizer_Idle, 
  STAT_CyclesIdle, STAT_CyclesSpentWorking, STAT_CyclesWaitingForOutput, 
  STAT_CyclesWaitingForTriWorkCache, STAT_CurrentDrawEventID, DBG_Rasterizer_State, 
  DBG_PixelXPos, DBG_PixelYPos, DBG_BarycentricA, DBG_BarycentricB, DBG_BarycentricC, 
  DBG_MinX, DBG_MaxX, DBG_MinY, DBG_MaxY)
/* synthesis syn_black_box black_box_pad_pin="clk,TRISETUP_newTriBegin,TRISETUP_readyForNewTri,TRISETUP_CurrentDrawEventID[15:0],TRISETUP_inMinX[15:0],TRISETUP_inMaxX[15:0],TRISETUP_inMinY[15:0],TRISETUP_inMaxY[15:0],TRISETUP_inInitialBarycentricRowResetA[31:0],TRISETUP_inInitialBarycentricRowResetB[31:0],TRISETUP_inInitialBarycentricRowResetC[31:0],TRISETUP_inIsTopLeftEdgeA,TRISETUP_inIsTopLeftEdgeB,TRISETUP_inIsTopLeftEdgeC,TRISETUP_inBarycentricXDeltaA[15:0],TRISETUP_inBarycentricXDeltaB[15:0],TRISETUP_inBarycentricXDeltaC[15:0],TRISETUP_inBarycentricYDeltaA[15:0],TRISETUP_inBarycentricYDeltaB[15:0],TRISETUP_inBarycentricYDeltaC[15:0],TRISETUP_inBarycentricInverse[31:0],TRISETUP_inZ0[31:0],TRISETUP_inZ10[31:0],TRISETUP_inZ20[31:0],TRISETUP_inInvW0[31:0],TRISETUP_inInvW10[31:0],TRISETUP_inInvW20[31:0],TRISETUP_inTX0[31:0],TRISETUP_inTY0[31:0],TRISETUP_inTX10[31:0],TRISETUP_inTY10[31:0],TRISETUP_inTX20[31:0],TRISETUP_inTY20[31:0],TRISETUP_inVertColor0[127:0],TRISETUP_inVertColor10[127:0],TRISETUP_inVertColor20[127:0],RASTOUT_FIFO_full,RASTOUT_FIFO_almost_full,RASTOUT_FIFO_wr_data[95:0],RASTOUT_FIFO_wr_en,TRICACHE_BarycentricInverse[31:0],TRICACHE_Z0[31:0],TRICACHE_Z10[31:0],TRICACHE_Z20[31:0],TRICACHE_InvW0[31:0],TRICACHE_InvW10[31:0],TRICACHE_InvW20[31:0],TRICACHE_TX0[31:0],TRICACHE_TX10[31:0],TRICACHE_TX20[31:0],TRICACHE_TY0[31:0],TRICACHE_TY10[31:0],TRICACHE_TY20[31:0],TRICACHE_VertColor0[127:0],TRICACHE_VertColor10[127:0],TRICACHE_VertColor20[127:0],TRICACHE_PushNewTriData,TRICACHE_IsFull,CMD_Rasterizer_Idle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CyclesWaitingForTriWorkCache[31:0],STAT_CurrentDrawEventID[15:0],DBG_Rasterizer_State[3:0],DBG_PixelXPos[15:0],DBG_PixelYPos[15:0],DBG_BarycentricA[31:0],DBG_BarycentricB[31:0],DBG_BarycentricC[31:0],DBG_MinX[15:0],DBG_MaxX[15:0],DBG_MinY[15:0],DBG_MaxY[15:0]" */;
  input clk;
  input TRISETUP_newTriBegin;
  output TRISETUP_readyForNewTri;
  input [15:0]TRISETUP_CurrentDrawEventID;
  input [15:0]TRISETUP_inMinX;
  input [15:0]TRISETUP_inMaxX;
  input [15:0]TRISETUP_inMinY;
  input [15:0]TRISETUP_inMaxY;
  input [31:0]TRISETUP_inInitialBarycentricRowResetA;
  input [31:0]TRISETUP_inInitialBarycentricRowResetB;
  input [31:0]TRISETUP_inInitialBarycentricRowResetC;
  input TRISETUP_inIsTopLeftEdgeA;
  input TRISETUP_inIsTopLeftEdgeB;
  input TRISETUP_inIsTopLeftEdgeC;
  input [15:0]TRISETUP_inBarycentricXDeltaA;
  input [15:0]TRISETUP_inBarycentricXDeltaB;
  input [15:0]TRISETUP_inBarycentricXDeltaC;
  input [15:0]TRISETUP_inBarycentricYDeltaA;
  input [15:0]TRISETUP_inBarycentricYDeltaB;
  input [15:0]TRISETUP_inBarycentricYDeltaC;
  input [31:0]TRISETUP_inBarycentricInverse;
  input [31:0]TRISETUP_inZ0;
  input [31:0]TRISETUP_inZ10;
  input [31:0]TRISETUP_inZ20;
  input [31:0]TRISETUP_inInvW0;
  input [31:0]TRISETUP_inInvW10;
  input [31:0]TRISETUP_inInvW20;
  input [31:0]TRISETUP_inTX0;
  input [31:0]TRISETUP_inTY0;
  input [31:0]TRISETUP_inTX10;
  input [31:0]TRISETUP_inTY10;
  input [31:0]TRISETUP_inTX20;
  input [31:0]TRISETUP_inTY20;
  input [127:0]TRISETUP_inVertColor0;
  input [127:0]TRISETUP_inVertColor10;
  input [127:0]TRISETUP_inVertColor20;
  input RASTOUT_FIFO_full;
  input RASTOUT_FIFO_almost_full;
  output [95:0]RASTOUT_FIFO_wr_data;
  output RASTOUT_FIFO_wr_en;
  output [31:0]TRICACHE_BarycentricInverse;
  output [31:0]TRICACHE_Z0;
  output [31:0]TRICACHE_Z10;
  output [31:0]TRICACHE_Z20;
  output [31:0]TRICACHE_InvW0;
  output [31:0]TRICACHE_InvW10;
  output [31:0]TRICACHE_InvW20;
  output [31:0]TRICACHE_TX0;
  output [31:0]TRICACHE_TX10;
  output [31:0]TRICACHE_TX20;
  output [31:0]TRICACHE_TY0;
  output [31:0]TRICACHE_TY10;
  output [31:0]TRICACHE_TY20;
  output [127:0]TRICACHE_VertColor0;
  output [127:0]TRICACHE_VertColor10;
  output [127:0]TRICACHE_VertColor20;
  output TRICACHE_PushNewTriData;
  input TRICACHE_IsFull;
  output CMD_Rasterizer_Idle;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [31:0]STAT_CyclesWaitingForTriWorkCache;
  output [15:0]STAT_CurrentDrawEventID;
  output [3:0]DBG_Rasterizer_State;
  output [15:0]DBG_PixelXPos;
  output [15:0]DBG_PixelYPos;
  output [31:0]DBG_BarycentricA;
  output [31:0]DBG_BarycentricB;
  output [31:0]DBG_BarycentricC;
  output [15:0]DBG_MinX;
  output [15:0]DBG_MaxX;
  output [15:0]DBG_MinY;
  output [15:0]DBG_MaxY;
endmodule
