// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:20:53 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ClipUnit_0_0/design_1_ClipUnit_0_0_stub.v
// Design      : design_1_ClipUnit_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ClipUnit,Vivado 2018.1_AR73068" *)
module design_1_ClipUnit_0_0(clk, IA_inPreviousStageIsValid, 
  IA_outPreviousStageIsReady, TRISETUP_outNextStageIsValid, 
  TRISETUP_inNextStageisReady, IA_inv0x, IA_inv0y, IA_inv0z, IA_inv0w, IA_inv0rgba, IA_inv0tx, 
  IA_inv0ty, IA_inv0ClipOutcodes, IA_inv1x, IA_inv1y, IA_inv1z, IA_inv1w, IA_inv1rgba, IA_inv1tx, 
  IA_inv1ty, IA_inv1ClipOutcodes, IA_inv2x, IA_inv2y, IA_inv2z, IA_inv2w, IA_inv2rgba, IA_inv2tx, 
  IA_inv2ty, IA_inv2ClipOutcodes, IA_CurrentDrawEventID, 
  IA_inWholeTriangleAABBIntersectsViewport, TRISETUP_outv0x, TRISETUP_outv0y, 
  TRISETUP_outv0z, TRISETUP_outv0w, TRISETUP_outv0rgba, TRISETUP_outv0tx, TRISETUP_outv0ty, 
  TRISETUP_outv1x, TRISETUP_outv1y, TRISETUP_outv1z, TRISETUP_outv1w, TRISETUP_outv1rgba, 
  TRISETUP_outv1tx, TRISETUP_outv1ty, TRISETUP_outv2x, TRISETUP_outv2y, TRISETUP_outv2z, 
  TRISETUP_outv2w, TRISETUP_outv2rgba, TRISETUP_outv2tx, TRISETUP_outv2ty, 
  TRISETUP_CurrentDrawEventID, FPU_Add0_A, FPU_Add0_B, FPU_Add0_IADD_GO, FPU_Add0_OUT, 
  FPU_Add1_A, FPU_Add1_B, FPU_Add1_IADD_GO, FPU_Add1_OUT, FPU_Mul0_A, FPU_Mul0_B, 
  FPU_Mul0_IMUL_GO, FPU_Mul0_OUT, FPU_Mul1_A, FPU_Mul1_B, FPU_Mul1_IMUL_GO, FPU_Mul1_OUT, 
  FPU_Rcp0_A, FPU_Rcp0_ISPEC_GO, FPU_Rcp0_OUT, STATE_StateBitsAtDrawID, STATE_NextDrawID, 
  STATE_StateIsValid, STATE_ConsumeStateSlot, CMD_IsIdle, STAT_CyclesIdle, 
  STAT_CyclesSpentWorking, STAT_CyclesWaitingForOutput, STAT_CurrentDrawEventID, 
  DBG_CurrentState, DBG_CurrentClipPlane, DBG_CurrentClipBitmask, DBG_ChildTriStackSize, 
  DBG_ClipDistance0, DBG_ClipDistance1, DBG_TriangleIntersectsViewport, DBG_V0PosX, 
  DBG_V0PosY, DBG_V0PosZ, DBG_V0PosW, DBG_V1PosX, DBG_V1PosY, DBG_V1PosZ, DBG_V1PosW, DBG_V2PosX, 
  DBG_V2PosY, DBG_V2PosZ, DBG_V2PosW, DBG_ClipOutcodes0, DBG_ClipOutcodes1, 
  DBG_ClipOutcodes2, DBG_AlreadyClippedPlanes)
/* synthesis syn_black_box black_box_pad_pin="clk,IA_inPreviousStageIsValid,IA_outPreviousStageIsReady,TRISETUP_outNextStageIsValid,TRISETUP_inNextStageisReady,IA_inv0x[31:0],IA_inv0y[31:0],IA_inv0z[31:0],IA_inv0w[31:0],IA_inv0rgba[127:0],IA_inv0tx[31:0],IA_inv0ty[31:0],IA_inv0ClipOutcodes[10:0],IA_inv1x[31:0],IA_inv1y[31:0],IA_inv1z[31:0],IA_inv1w[31:0],IA_inv1rgba[127:0],IA_inv1tx[31:0],IA_inv1ty[31:0],IA_inv1ClipOutcodes[10:0],IA_inv2x[31:0],IA_inv2y[31:0],IA_inv2z[31:0],IA_inv2w[31:0],IA_inv2rgba[127:0],IA_inv2tx[31:0],IA_inv2ty[31:0],IA_inv2ClipOutcodes[10:0],IA_CurrentDrawEventID[15:0],IA_inWholeTriangleAABBIntersectsViewport,TRISETUP_outv0x[31:0],TRISETUP_outv0y[31:0],TRISETUP_outv0z[31:0],TRISETUP_outv0w[31:0],TRISETUP_outv0rgba[127:0],TRISETUP_outv0tx[31:0],TRISETUP_outv0ty[31:0],TRISETUP_outv1x[31:0],TRISETUP_outv1y[31:0],TRISETUP_outv1z[31:0],TRISETUP_outv1w[31:0],TRISETUP_outv1rgba[127:0],TRISETUP_outv1tx[31:0],TRISETUP_outv1ty[31:0],TRISETUP_outv2x[31:0],TRISETUP_outv2y[31:0],TRISETUP_outv2z[31:0],TRISETUP_outv2w[31:0],TRISETUP_outv2rgba[127:0],TRISETUP_outv2tx[31:0],TRISETUP_outv2ty[31:0],TRISETUP_CurrentDrawEventID[15:0],FPU_Add0_A[31:0],FPU_Add0_B[31:0],FPU_Add0_IADD_GO,FPU_Add0_OUT[31:0],FPU_Add1_A[31:0],FPU_Add1_B[31:0],FPU_Add1_IADD_GO,FPU_Add1_OUT[31:0],FPU_Mul0_A[31:0],FPU_Mul0_B[31:0],FPU_Mul0_IMUL_GO,FPU_Mul0_OUT[31:0],FPU_Mul1_A[31:0],FPU_Mul1_B[31:0],FPU_Mul1_IMUL_GO,FPU_Mul1_OUT[31:0],FPU_Rcp0_A[31:0],FPU_Rcp0_ISPEC_GO,FPU_Rcp0_OUT[31:0],STATE_StateBitsAtDrawID[10:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,CMD_IsIdle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_CurrentState[7:0],DBG_CurrentClipPlane[3:0],DBG_CurrentClipBitmask[2:0],DBG_ChildTriStackSize[2:0],DBG_ClipDistance0[31:0],DBG_ClipDistance1[31:0],DBG_TriangleIntersectsViewport,DBG_V0PosX[31:0],DBG_V0PosY[31:0],DBG_V0PosZ[31:0],DBG_V0PosW[31:0],DBG_V1PosX[31:0],DBG_V1PosY[31:0],DBG_V1PosZ[31:0],DBG_V1PosW[31:0],DBG_V2PosX[31:0],DBG_V2PosY[31:0],DBG_V2PosZ[31:0],DBG_V2PosW[31:0],DBG_ClipOutcodes0[10:0],DBG_ClipOutcodes1[10:0],DBG_ClipOutcodes2[10:0],DBG_AlreadyClippedPlanes[10:0]" */;
  input clk;
  input IA_inPreviousStageIsValid;
  output IA_outPreviousStageIsReady;
  output TRISETUP_outNextStageIsValid;
  input TRISETUP_inNextStageisReady;
  input [31:0]IA_inv0x;
  input [31:0]IA_inv0y;
  input [31:0]IA_inv0z;
  input [31:0]IA_inv0w;
  input [127:0]IA_inv0rgba;
  input [31:0]IA_inv0tx;
  input [31:0]IA_inv0ty;
  input [10:0]IA_inv0ClipOutcodes;
  input [31:0]IA_inv1x;
  input [31:0]IA_inv1y;
  input [31:0]IA_inv1z;
  input [31:0]IA_inv1w;
  input [127:0]IA_inv1rgba;
  input [31:0]IA_inv1tx;
  input [31:0]IA_inv1ty;
  input [10:0]IA_inv1ClipOutcodes;
  input [31:0]IA_inv2x;
  input [31:0]IA_inv2y;
  input [31:0]IA_inv2z;
  input [31:0]IA_inv2w;
  input [127:0]IA_inv2rgba;
  input [31:0]IA_inv2tx;
  input [31:0]IA_inv2ty;
  input [10:0]IA_inv2ClipOutcodes;
  input [15:0]IA_CurrentDrawEventID;
  input IA_inWholeTriangleAABBIntersectsViewport;
  output [31:0]TRISETUP_outv0x;
  output [31:0]TRISETUP_outv0y;
  output [31:0]TRISETUP_outv0z;
  output [31:0]TRISETUP_outv0w;
  output [127:0]TRISETUP_outv0rgba;
  output [31:0]TRISETUP_outv0tx;
  output [31:0]TRISETUP_outv0ty;
  output [31:0]TRISETUP_outv1x;
  output [31:0]TRISETUP_outv1y;
  output [31:0]TRISETUP_outv1z;
  output [31:0]TRISETUP_outv1w;
  output [127:0]TRISETUP_outv1rgba;
  output [31:0]TRISETUP_outv1tx;
  output [31:0]TRISETUP_outv1ty;
  output [31:0]TRISETUP_outv2x;
  output [31:0]TRISETUP_outv2y;
  output [31:0]TRISETUP_outv2z;
  output [31:0]TRISETUP_outv2w;
  output [127:0]TRISETUP_outv2rgba;
  output [31:0]TRISETUP_outv2tx;
  output [31:0]TRISETUP_outv2ty;
  output [15:0]TRISETUP_CurrentDrawEventID;
  output [31:0]FPU_Add0_A;
  output [31:0]FPU_Add0_B;
  output FPU_Add0_IADD_GO;
  input [31:0]FPU_Add0_OUT;
  output [31:0]FPU_Add1_A;
  output [31:0]FPU_Add1_B;
  output FPU_Add1_IADD_GO;
  input [31:0]FPU_Add1_OUT;
  output [31:0]FPU_Mul0_A;
  output [31:0]FPU_Mul0_B;
  output FPU_Mul0_IMUL_GO;
  input [31:0]FPU_Mul0_OUT;
  output [31:0]FPU_Mul1_A;
  output [31:0]FPU_Mul1_B;
  output FPU_Mul1_IMUL_GO;
  input [31:0]FPU_Mul1_OUT;
  output [31:0]FPU_Rcp0_A;
  output FPU_Rcp0_ISPEC_GO;
  input [31:0]FPU_Rcp0_OUT;
  input [10:0]STATE_StateBitsAtDrawID;
  input [15:0]STATE_NextDrawID;
  input STATE_StateIsValid;
  output STATE_ConsumeStateSlot;
  output CMD_IsIdle;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [15:0]STAT_CurrentDrawEventID;
  output [7:0]DBG_CurrentState;
  output [3:0]DBG_CurrentClipPlane;
  output [2:0]DBG_CurrentClipBitmask;
  output [2:0]DBG_ChildTriStackSize;
  output [31:0]DBG_ClipDistance0;
  output [31:0]DBG_ClipDistance1;
  output DBG_TriangleIntersectsViewport;
  output [31:0]DBG_V0PosX;
  output [31:0]DBG_V0PosY;
  output [31:0]DBG_V0PosZ;
  output [31:0]DBG_V0PosW;
  output [31:0]DBG_V1PosX;
  output [31:0]DBG_V1PosY;
  output [31:0]DBG_V1PosZ;
  output [31:0]DBG_V1PosW;
  output [31:0]DBG_V2PosX;
  output [31:0]DBG_V2PosY;
  output [31:0]DBG_V2PosZ;
  output [31:0]DBG_V2PosW;
  output [10:0]DBG_ClipOutcodes0;
  output [10:0]DBG_ClipOutcodes1;
  output [10:0]DBG_ClipOutcodes2;
  output [10:0]DBG_AlreadyClippedPlanes;
endmodule
