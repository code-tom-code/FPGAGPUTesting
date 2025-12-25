// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:01:09 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_TriSetup_0_0/MainDesign_TriSetup_0_0_stub.v
// Design      : MainDesign_TriSetup_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_TriSetup_0_0,TriSetup,{}" *) (* core_generation_info = "MainDesign_TriSetup_0_0,TriSetup,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=TriSetup,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "TriSetup,Vivado 2025.2" *) 
module MainDesign_TriSetup_0_0(clk, CLIP_v0_in_x, CLIP_v0_in_y, CLIP_v0_in_z, 
  CLIP_v0_in_w, CLIP_v1_in_x, CLIP_v1_in_y, CLIP_v1_in_z, CLIP_v1_in_w, CLIP_v2_in_x, 
  CLIP_v2_in_y, CLIP_v2_in_z, CLIP_v2_in_w, CLIP_t0_in_x, CLIP_t0_in_y, CLIP_t1_in_x, 
  CLIP_t1_in_y, CLIP_t2_in_x, CLIP_t2_in_y, CLIP_v0_in_RGBA, CLIP_v1_in_RGBA, 
  CLIP_v2_in_RGBA, CLIP_CurrentDrawEventID, CLIP_newTriBegin, CLIP_readyForNewTri, 
  TEXCFG_nointerpolation, RAST_outBarycentricInverse, RAST_v0_out_Z, RAST_v10_out_Z, 
  RAST_v20_out_Z, RAST_v0_out_invW, RAST_v10_out_invW, RAST_v20_out_invW, RAST_t0_out_x, 
  RAST_t0_out_y, RAST_t10_out_x, RAST_t10_out_y, RAST_t20_out_x, RAST_t20_out_y, 
  RAST_v0_out_colorRGBA, RAST_v10_out_colorRGBA, RAST_v20_out_colorRGBA, RAST_outMinX, 
  RAST_outMaxX, RAST_outMinY, RAST_outMaxY, RAST_outInitialBarycentricRowResetA, 
  RAST_outInitialBarycentricRowResetB, RAST_outInitialBarycentricRowResetC, 
  RAST_outIsTopLeftEdgeA, RAST_outIsTopLeftEdgeB, RAST_outIsTopLeftEdgeC, 
  RAST_outBarycentricXDeltaA, RAST_outBarycentricXDeltaB, RAST_outBarycentricXDeltaC, 
  RAST_outBarycentricYDeltaA, RAST_outBarycentricYDeltaB, RAST_outBarycentricYDeltaC, 
  RAST_CurrentDrawEventID, RAST_readyForTriSetupData, RAST_triSetupDataIsValid, 
  FPU_ADD_A, FPU_ADD_B, FPU_ADD_OUT, FPU_ADD_GO, FPU_MUL_A, FPU_MUL_B, FPU_MUL_OUT, FPU_MUL_GO, 
  FPU_CNV_A, FPU_CNV_Mode, FPU_CNV_OUT, FPU_CNV_GO, FPU_SPEC_A, FPU_SPEC_OUT, FPU_SPEC_GO, 
  STATE_StateBitsAtDrawID, STATE_NextDrawID, STATE_StateIsValid, STATE_ConsumeStateSlot, 
  CMD_TriSetupIsIdle, STAT_CyclesIdle, STAT_CyclesSpentWorking, 
  STAT_CyclesWaitingForOutput, STAT_CurrentDrawEventID, DBG_TriSetup_State, DBG_MinX, 
  DBG_MaxX, DBG_MinY, DBG_MaxY, DBG_XProdSub0, DBG_XProdSub1, DBG_XProdSub2, DBG_XProdSub3, 
  DBG_XProdProd0, DBG_XProdProd1, DBG_LeftProd0, DBG_LeftProd1, DBG_LeftProd2, 
  DBG_RightProd0, DBG_RightProd1, DBG_RightProd2, DBG_TwiceTriArea)
/* synthesis syn_black_box black_box_pad_pin="CLIP_v0_in_x[31:0],CLIP_v0_in_y[31:0],CLIP_v0_in_z[31:0],CLIP_v0_in_w[31:0],CLIP_v1_in_x[31:0],CLIP_v1_in_y[31:0],CLIP_v1_in_z[31:0],CLIP_v1_in_w[31:0],CLIP_v2_in_x[31:0],CLIP_v2_in_y[31:0],CLIP_v2_in_z[31:0],CLIP_v2_in_w[31:0],CLIP_t0_in_x[31:0],CLIP_t0_in_y[31:0],CLIP_t1_in_x[31:0],CLIP_t1_in_y[31:0],CLIP_t2_in_x[31:0],CLIP_t2_in_y[31:0],CLIP_v0_in_RGBA[127:0],CLIP_v1_in_RGBA[127:0],CLIP_v2_in_RGBA[127:0],CLIP_CurrentDrawEventID[15:0],CLIP_newTriBegin,CLIP_readyForNewTri,TEXCFG_nointerpolation,RAST_outBarycentricInverse[31:0],RAST_v0_out_Z[31:0],RAST_v10_out_Z[31:0],RAST_v20_out_Z[31:0],RAST_v0_out_invW[31:0],RAST_v10_out_invW[31:0],RAST_v20_out_invW[31:0],RAST_t0_out_x[31:0],RAST_t0_out_y[31:0],RAST_t10_out_x[31:0],RAST_t10_out_y[31:0],RAST_t20_out_x[31:0],RAST_t20_out_y[31:0],RAST_v0_out_colorRGBA[127:0],RAST_v10_out_colorRGBA[127:0],RAST_v20_out_colorRGBA[127:0],RAST_outMinX[15:0],RAST_outMaxX[15:0],RAST_outMinY[15:0],RAST_outMaxY[15:0],RAST_outInitialBarycentricRowResetA[31:0],RAST_outInitialBarycentricRowResetB[31:0],RAST_outInitialBarycentricRowResetC[31:0],RAST_outIsTopLeftEdgeA,RAST_outIsTopLeftEdgeB,RAST_outIsTopLeftEdgeC,RAST_outBarycentricXDeltaA[15:0],RAST_outBarycentricXDeltaB[15:0],RAST_outBarycentricXDeltaC[15:0],RAST_outBarycentricYDeltaA[15:0],RAST_outBarycentricYDeltaB[15:0],RAST_outBarycentricYDeltaC[15:0],RAST_CurrentDrawEventID[15:0],RAST_readyForTriSetupData,RAST_triSetupDataIsValid,FPU_ADD_A[31:0],FPU_ADD_B[31:0],FPU_ADD_OUT[31:0],FPU_ADD_GO,FPU_MUL_A[31:0],FPU_MUL_B[31:0],FPU_MUL_OUT[31:0],FPU_MUL_GO,FPU_CNV_A[31:0],FPU_CNV_Mode[2:0],FPU_CNV_OUT[31:0],FPU_CNV_GO,FPU_SPEC_A[31:0],FPU_SPEC_OUT[31:0],FPU_SPEC_GO,STATE_StateBitsAtDrawID[191:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,CMD_TriSetupIsIdle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_TriSetup_State[7:0],DBG_MinX[15:0],DBG_MaxX[15:0],DBG_MinY[15:0],DBG_MaxY[15:0],DBG_XProdSub0[31:0],DBG_XProdSub1[31:0],DBG_XProdSub2[31:0],DBG_XProdSub3[31:0],DBG_XProdProd0[31:0],DBG_XProdProd1[31:0],DBG_LeftProd0[31:0],DBG_LeftProd1[31:0],DBG_LeftProd2[31:0],DBG_RightProd0[31:0],DBG_RightProd1[31:0],DBG_RightProd2[31:0],DBG_TwiceTriArea[31:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  input [31:0]CLIP_v0_in_x;
  input [31:0]CLIP_v0_in_y;
  input [31:0]CLIP_v0_in_z;
  input [31:0]CLIP_v0_in_w;
  input [31:0]CLIP_v1_in_x;
  input [31:0]CLIP_v1_in_y;
  input [31:0]CLIP_v1_in_z;
  input [31:0]CLIP_v1_in_w;
  input [31:0]CLIP_v2_in_x;
  input [31:0]CLIP_v2_in_y;
  input [31:0]CLIP_v2_in_z;
  input [31:0]CLIP_v2_in_w;
  input [31:0]CLIP_t0_in_x;
  input [31:0]CLIP_t0_in_y;
  input [31:0]CLIP_t1_in_x;
  input [31:0]CLIP_t1_in_y;
  input [31:0]CLIP_t2_in_x;
  input [31:0]CLIP_t2_in_y;
  input [127:0]CLIP_v0_in_RGBA;
  input [127:0]CLIP_v1_in_RGBA;
  input [127:0]CLIP_v2_in_RGBA;
  input [15:0]CLIP_CurrentDrawEventID;
  input CLIP_newTriBegin;
  output CLIP_readyForNewTri;
  input TEXCFG_nointerpolation;
  output [31:0]RAST_outBarycentricInverse;
  output [31:0]RAST_v0_out_Z;
  output [31:0]RAST_v10_out_Z;
  output [31:0]RAST_v20_out_Z;
  output [31:0]RAST_v0_out_invW;
  output [31:0]RAST_v10_out_invW;
  output [31:0]RAST_v20_out_invW;
  output [31:0]RAST_t0_out_x;
  output [31:0]RAST_t0_out_y;
  output [31:0]RAST_t10_out_x;
  output [31:0]RAST_t10_out_y;
  output [31:0]RAST_t20_out_x;
  output [31:0]RAST_t20_out_y;
  output [127:0]RAST_v0_out_colorRGBA;
  output [127:0]RAST_v10_out_colorRGBA;
  output [127:0]RAST_v20_out_colorRGBA;
  output [15:0]RAST_outMinX;
  output [15:0]RAST_outMaxX;
  output [15:0]RAST_outMinY;
  output [15:0]RAST_outMaxY;
  output [31:0]RAST_outInitialBarycentricRowResetA;
  output [31:0]RAST_outInitialBarycentricRowResetB;
  output [31:0]RAST_outInitialBarycentricRowResetC;
  output RAST_outIsTopLeftEdgeA;
  output RAST_outIsTopLeftEdgeB;
  output RAST_outIsTopLeftEdgeC;
  output [15:0]RAST_outBarycentricXDeltaA;
  output [15:0]RAST_outBarycentricXDeltaB;
  output [15:0]RAST_outBarycentricXDeltaC;
  output [15:0]RAST_outBarycentricYDeltaA;
  output [15:0]RAST_outBarycentricYDeltaB;
  output [15:0]RAST_outBarycentricYDeltaC;
  output [15:0]RAST_CurrentDrawEventID;
  input RAST_readyForTriSetupData;
  output RAST_triSetupDataIsValid;
  output [31:0]FPU_ADD_A;
  output [31:0]FPU_ADD_B;
  input [31:0]FPU_ADD_OUT;
  output FPU_ADD_GO;
  output [31:0]FPU_MUL_A;
  output [31:0]FPU_MUL_B;
  input [31:0]FPU_MUL_OUT;
  output FPU_MUL_GO;
  output [31:0]FPU_CNV_A;
  output [2:0]FPU_CNV_Mode;
  input [31:0]FPU_CNV_OUT;
  output FPU_CNV_GO;
  output [31:0]FPU_SPEC_A;
  input [31:0]FPU_SPEC_OUT;
  output FPU_SPEC_GO;
  input [191:0]STATE_StateBitsAtDrawID;
  input [15:0]STATE_NextDrawID;
  input STATE_StateIsValid;
  output STATE_ConsumeStateSlot;
  output CMD_TriSetupIsIdle;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [15:0]STAT_CurrentDrawEventID;
  output [7:0]DBG_TriSetup_State;
  output [15:0]DBG_MinX;
  output [15:0]DBG_MaxX;
  output [15:0]DBG_MinY;
  output [15:0]DBG_MaxY;
  output [31:0]DBG_XProdSub0;
  output [31:0]DBG_XProdSub1;
  output [31:0]DBG_XProdSub2;
  output [31:0]DBG_XProdSub3;
  output [31:0]DBG_XProdProd0;
  output [31:0]DBG_XProdProd1;
  output [31:0]DBG_LeftProd0;
  output [31:0]DBG_LeftProd1;
  output [31:0]DBG_LeftProd2;
  output [31:0]DBG_RightProd0;
  output [31:0]DBG_RightProd1;
  output [31:0]DBG_RightProd2;
  output [31:0]DBG_TwiceTriArea;
endmodule
