// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:59:08 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_InputAssembler2_0_0/MainDesign_InputAssembler2_0_0_stub.v
// Design      : MainDesign_InputAssembler2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_InputAssembler2_0_0,InputAssembler2,{}" *) (* core_generation_info = "MainDesign_InputAssembler2_0_0,InputAssembler2,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=InputAssembler2,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "InputAssembler2,Vivado 2025.2" *) 
module MainDesign_InputAssembler2_0_0(clk, CLIP_v0PosX, CLIP_v0PosY, CLIP_v0PosZ, 
  CLIP_v0PosW, CLIP_v1PosX, CLIP_v1PosY, CLIP_v1PosZ, CLIP_v1PosW, CLIP_v2PosX, CLIP_v2PosY, 
  CLIP_v2PosZ, CLIP_v2PosW, CLIP_tex0_X, CLIP_tex0_Y, CLIP_tex1_X, CLIP_tex1_Y, CLIP_tex2_X, 
  CLIP_tex2_Y, CLIP_vertColor0_RGBA, CLIP_vertColor1_RGBA, CLIP_vertColor2_RGBA, 
  CLIP_v0ClipCodes, CLIP_v1ClipCodes, CLIP_v2ClipCodes, CLIP_CurrentDrawEventID, 
  CLIP_AABBTriOverlapsViewport, CLIP_readyForNewTri, CLIP_newTriBegin, VBO_Pushed, 
  VBO_NumVertices, VBO_NumIndices, VBO_IsIndexedDrawCall, VBO_Ready, VERTOUT_FIFO_empty, 
  VERTOUT_FIFO_almost_empty, VERTOUT_FIFO_rd_data, VERTOUT_FIFO_rd_en, 
  INDEXOUT_FIFO_empty, INDEXOUT_FIFO_almost_empty, INDEXOUT_FIFO_rd_data, 
  INDEXOUT_FIFO_rd_en, STATE_StateBitsAtDrawID, STATE_NextDrawID, STATE_StateIsValid, 
  STATE_ConsumeStateSlot, CMD_IA_Idle, STAT_CyclesIdle, STAT_CyclesSpentWorking, 
  STAT_CyclesLoadingDataToCache, STAT_CyclesWaitingForOutput, STAT_CurrentDrawEventID, 
  DBG_IA_State, DBG_IA_VertexIDPerBatch, DBG_IA_CurrentTriIndices)
/* synthesis syn_black_box black_box_pad_pin="CLIP_v0PosX[31:0],CLIP_v0PosY[31:0],CLIP_v0PosZ[31:0],CLIP_v0PosW[31:0],CLIP_v1PosX[31:0],CLIP_v1PosY[31:0],CLIP_v1PosZ[31:0],CLIP_v1PosW[31:0],CLIP_v2PosX[31:0],CLIP_v2PosY[31:0],CLIP_v2PosZ[31:0],CLIP_v2PosW[31:0],CLIP_tex0_X[31:0],CLIP_tex0_Y[31:0],CLIP_tex1_X[31:0],CLIP_tex1_Y[31:0],CLIP_tex2_X[31:0],CLIP_tex2_Y[31:0],CLIP_vertColor0_RGBA[127:0],CLIP_vertColor1_RGBA[127:0],CLIP_vertColor2_RGBA[127:0],CLIP_v0ClipCodes[10:0],CLIP_v1ClipCodes[10:0],CLIP_v2ClipCodes[10:0],CLIP_CurrentDrawEventID[15:0],CLIP_AABBTriOverlapsViewport,CLIP_readyForNewTri,CLIP_newTriBegin,VBO_Pushed,VBO_NumVertices[4:0],VBO_NumIndices[6:0],VBO_IsIndexedDrawCall,VBO_Ready,VERTOUT_FIFO_empty,VERTOUT_FIFO_almost_empty,VERTOUT_FIFO_rd_data[319:0],VERTOUT_FIFO_rd_en,INDEXOUT_FIFO_empty,INDEXOUT_FIFO_almost_empty,INDEXOUT_FIFO_rd_data[271:0],INDEXOUT_FIFO_rd_en,STATE_StateBitsAtDrawID[4:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,CMD_IA_Idle,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesLoadingDataToCache[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_IA_State[5:0],DBG_IA_VertexIDPerBatch[3:0],DBG_IA_CurrentTriIndices[11:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF VERTOUT_FIFO:INDEXOUT_FIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  output [31:0]CLIP_v0PosX;
  output [31:0]CLIP_v0PosY;
  output [31:0]CLIP_v0PosZ;
  output [31:0]CLIP_v0PosW;
  output [31:0]CLIP_v1PosX;
  output [31:0]CLIP_v1PosY;
  output [31:0]CLIP_v1PosZ;
  output [31:0]CLIP_v1PosW;
  output [31:0]CLIP_v2PosX;
  output [31:0]CLIP_v2PosY;
  output [31:0]CLIP_v2PosZ;
  output [31:0]CLIP_v2PosW;
  output [31:0]CLIP_tex0_X;
  output [31:0]CLIP_tex0_Y;
  output [31:0]CLIP_tex1_X;
  output [31:0]CLIP_tex1_Y;
  output [31:0]CLIP_tex2_X;
  output [31:0]CLIP_tex2_Y;
  output [127:0]CLIP_vertColor0_RGBA;
  output [127:0]CLIP_vertColor1_RGBA;
  output [127:0]CLIP_vertColor2_RGBA;
  output [10:0]CLIP_v0ClipCodes;
  output [10:0]CLIP_v1ClipCodes;
  output [10:0]CLIP_v2ClipCodes;
  output [15:0]CLIP_CurrentDrawEventID;
  output CLIP_AABBTriOverlapsViewport;
  input CLIP_readyForNewTri;
  output CLIP_newTriBegin;
  input VBO_Pushed;
  input [4:0]VBO_NumVertices;
  input [6:0]VBO_NumIndices;
  input VBO_IsIndexedDrawCall;
  output VBO_Ready;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO EMPTY" *) (* x_interface_mode = "master VERTOUT_FIFO" *) input VERTOUT_FIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO ALMOST_EMPTY" *) input VERTOUT_FIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO RD_DATA" *) (* x_interface_mode = "master" *) input [319:0]VERTOUT_FIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 VERTOUT_FIFO RD_EN" *) output VERTOUT_FIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO EMPTY" *) (* x_interface_mode = "master INDEXOUT_FIFO" *) input INDEXOUT_FIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO ALMOST_EMPTY" *) input INDEXOUT_FIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO RD_DATA" *) (* x_interface_mode = "master" *) input [271:0]INDEXOUT_FIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INDEXOUT_FIFO RD_EN" *) output INDEXOUT_FIFO_rd_en;
  input [4:0]STATE_StateBitsAtDrawID;
  input [15:0]STATE_NextDrawID;
  input STATE_StateIsValid;
  output STATE_ConsumeStateSlot;
  output CMD_IA_Idle;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesLoadingDataToCache;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [15:0]STAT_CurrentDrawEventID;
  output [5:0]DBG_IA_State;
  output [3:0]DBG_IA_VertexIDPerBatch;
  output [11:0]DBG_IA_CurrentTriIndices;
endmodule
