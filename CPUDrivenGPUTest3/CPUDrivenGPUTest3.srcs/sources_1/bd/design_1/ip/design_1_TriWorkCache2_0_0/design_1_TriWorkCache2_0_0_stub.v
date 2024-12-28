// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 01:02:55 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_TriWorkCache2_0_0/design_1_TriWorkCache2_0_0_stub.v
// Design      : design_1_TriWorkCache2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "TriWorkCache2,Vivado 2018.1_AR73068" *)
module design_1_TriWorkCache2_0_0(clk, DINTERP_outBarycentricInverse, 
  DINTERP_outZ0, DINTERP_outZ10, DINTERP_outZ20, DINTERP_outInvW0, DINTERP_outInvW10, 
  DINTERP_outInvW20, DINTERP_PopTriangleSlot, INTERP_outT0X, INTERP_outT0Y, INTERP_outT10X, 
  INTERP_outT10Y, INTERP_outT20X, INTERP_outT20Y, INTERP_outColorRGBA0, 
  INTERP_outColorRGBA10, INTERP_outColorRGBA20, INTERP_PopTriangleSlot, 
  RAST_inBarycentricInverse, RAST_inZ0, RAST_inZ10, RAST_inZ20, RAST_inInvW0, RAST_inInvW10, 
  RAST_inInvW20, RAST_inT0X, RAST_inT0Y, RAST_inT10X, RAST_inT10Y, RAST_inT20X, RAST_inT20Y, 
  RAST_inColorRGBA0, RAST_inColorRGBA10, RAST_inColorRGBA20, RAST_PushNewTriData, 
  RAST_IsFull, DINTERP_TRIDATA_FIFO_empty, DINTERP_TRIDATA_FIFO_rd_data, 
  DINTERP_TRIDATA_FIFO_rd_en, DINTERP_TRIDATA_FIFO_full, DINTERP_TRIDATA_FIFO_wr_data, 
  DINTERP_TRIDATA_FIFO_wr_en, INTERP_TRIDATA_FIFO_empty, INTERP_TRIDATA_FIFO_rd_data, 
  INTERP_TRIDATA_FIFO_rd_en, INTERP_TRIDATA_FIFO_full, INTERP_TRIDATA_FIFO_wr_data, 
  INTERP_TRIDATA_FIFO_wr_en)
/* synthesis syn_black_box black_box_pad_pin="clk,DINTERP_outBarycentricInverse[31:0],DINTERP_outZ0[31:0],DINTERP_outZ10[31:0],DINTERP_outZ20[31:0],DINTERP_outInvW0[31:0],DINTERP_outInvW10[31:0],DINTERP_outInvW20[31:0],DINTERP_PopTriangleSlot,INTERP_outT0X[31:0],INTERP_outT0Y[31:0],INTERP_outT10X[31:0],INTERP_outT10Y[31:0],INTERP_outT20X[31:0],INTERP_outT20Y[31:0],INTERP_outColorRGBA0[127:0],INTERP_outColorRGBA10[127:0],INTERP_outColorRGBA20[127:0],INTERP_PopTriangleSlot,RAST_inBarycentricInverse[31:0],RAST_inZ0[31:0],RAST_inZ10[31:0],RAST_inZ20[31:0],RAST_inInvW0[31:0],RAST_inInvW10[31:0],RAST_inInvW20[31:0],RAST_inT0X[31:0],RAST_inT0Y[31:0],RAST_inT10X[31:0],RAST_inT10Y[31:0],RAST_inT20X[31:0],RAST_inT20Y[31:0],RAST_inColorRGBA0[127:0],RAST_inColorRGBA10[127:0],RAST_inColorRGBA20[127:0],RAST_PushNewTriData,RAST_IsFull,DINTERP_TRIDATA_FIFO_empty,DINTERP_TRIDATA_FIFO_rd_data[223:0],DINTERP_TRIDATA_FIFO_rd_en,DINTERP_TRIDATA_FIFO_full,DINTERP_TRIDATA_FIFO_wr_data[223:0],DINTERP_TRIDATA_FIFO_wr_en,INTERP_TRIDATA_FIFO_empty,INTERP_TRIDATA_FIFO_rd_data[575:0],INTERP_TRIDATA_FIFO_rd_en,INTERP_TRIDATA_FIFO_full,INTERP_TRIDATA_FIFO_wr_data[575:0],INTERP_TRIDATA_FIFO_wr_en" */;
  input clk;
  output [31:0]DINTERP_outBarycentricInverse;
  output [31:0]DINTERP_outZ0;
  output [31:0]DINTERP_outZ10;
  output [31:0]DINTERP_outZ20;
  output [31:0]DINTERP_outInvW0;
  output [31:0]DINTERP_outInvW10;
  output [31:0]DINTERP_outInvW20;
  input DINTERP_PopTriangleSlot;
  output [31:0]INTERP_outT0X;
  output [31:0]INTERP_outT0Y;
  output [31:0]INTERP_outT10X;
  output [31:0]INTERP_outT10Y;
  output [31:0]INTERP_outT20X;
  output [31:0]INTERP_outT20Y;
  output [127:0]INTERP_outColorRGBA0;
  output [127:0]INTERP_outColorRGBA10;
  output [127:0]INTERP_outColorRGBA20;
  input INTERP_PopTriangleSlot;
  input [31:0]RAST_inBarycentricInverse;
  input [31:0]RAST_inZ0;
  input [31:0]RAST_inZ10;
  input [31:0]RAST_inZ20;
  input [31:0]RAST_inInvW0;
  input [31:0]RAST_inInvW10;
  input [31:0]RAST_inInvW20;
  input [31:0]RAST_inT0X;
  input [31:0]RAST_inT0Y;
  input [31:0]RAST_inT10X;
  input [31:0]RAST_inT10Y;
  input [31:0]RAST_inT20X;
  input [31:0]RAST_inT20Y;
  input [127:0]RAST_inColorRGBA0;
  input [127:0]RAST_inColorRGBA10;
  input [127:0]RAST_inColorRGBA20;
  input RAST_PushNewTriData;
  output RAST_IsFull;
  input DINTERP_TRIDATA_FIFO_empty;
  input [223:0]DINTERP_TRIDATA_FIFO_rd_data;
  output DINTERP_TRIDATA_FIFO_rd_en;
  input DINTERP_TRIDATA_FIFO_full;
  output [223:0]DINTERP_TRIDATA_FIFO_wr_data;
  output DINTERP_TRIDATA_FIFO_wr_en;
  input INTERP_TRIDATA_FIFO_empty;
  input [575:0]INTERP_TRIDATA_FIFO_rd_data;
  output INTERP_TRIDATA_FIFO_rd_en;
  input INTERP_TRIDATA_FIFO_full;
  output [575:0]INTERP_TRIDATA_FIFO_wr_data;
  output INTERP_TRIDATA_FIFO_wr_en;
endmodule
