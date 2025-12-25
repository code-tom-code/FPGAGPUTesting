// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:03:23 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_TriWorkCache2_0_0/MainDesign_TriWorkCache2_0_0_stub.v
// Design      : MainDesign_TriWorkCache2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_TriWorkCache2_0_0,TriWorkCache2,{}" *) (* core_generation_info = "MainDesign_TriWorkCache2_0_0,TriWorkCache2,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=TriWorkCache2,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "TriWorkCache2,Vivado 2025.2" *) 
module MainDesign_TriWorkCache2_0_0(clk, DINTERP_outBarycentricInverse, 
  DINTERP_outZ0, DINTERP_outZ10, DINTERP_outZ20, DINTERP_outInvW0, DINTERP_outInvW10, 
  DINTERP_outInvW20, DINTERP_PopTriangleSlot, INTERP_outT0X, INTERP_outT0Y, INTERP_outT10X, 
  INTERP_outT10Y, INTERP_outT20X, INTERP_outT20Y, INTERP_outColorRGBA0, 
  INTERP_outColorRGBA10, INTERP_outColorRGBA20, INTERP_PopTriangleSlot, 
  RAST_inBarycentricInverse, RAST_inZ0, RAST_inZ10, RAST_inZ20, RAST_inInvW0, RAST_inInvW10, 
  RAST_inInvW20, RAST_inT0X, RAST_inT0Y, RAST_inT10X, RAST_inT10Y, RAST_inT20X, RAST_inT20Y, 
  RAST_inColorRGBA0, RAST_inColorRGBA10, RAST_inColorRGBA20, RAST_PushNewTriData, 
  RAST_IsFull, DINTERP_TRIDATA_FIFO_empty, DINTERP_TRIDATA_FIFO_almost_empty, 
  DINTERP_TRIDATA_FIFO_rd_data, DINTERP_TRIDATA_FIFO_rd_en, DINTERP_TRIDATA_FIFO_full, 
  DINTERP_TRIDATA_FIFO_wr_data, DINTERP_TRIDATA_FIFO_wr_en, INTERP_TRIDATA_FIFO_empty, 
  INTERP_TRIDATA_FIFO_almost_empty, INTERP_TRIDATA_FIFO_rd_data, 
  INTERP_TRIDATA_FIFO_rd_en, INTERP_TRIDATA_FIFO_full, INTERP_TRIDATA_FIFO_wr_data, 
  INTERP_TRIDATA_FIFO_wr_en)
/* synthesis syn_black_box black_box_pad_pin="clk,DINTERP_outBarycentricInverse[31:0],DINTERP_outZ0[31:0],DINTERP_outZ10[31:0],DINTERP_outZ20[31:0],DINTERP_outInvW0[31:0],DINTERP_outInvW10[31:0],DINTERP_outInvW20[31:0],DINTERP_PopTriangleSlot,INTERP_outT0X[31:0],INTERP_outT0Y[31:0],INTERP_outT10X[31:0],INTERP_outT10Y[31:0],INTERP_outT20X[31:0],INTERP_outT20Y[31:0],INTERP_outColorRGBA0[127:0],INTERP_outColorRGBA10[127:0],INTERP_outColorRGBA20[127:0],INTERP_PopTriangleSlot,RAST_inBarycentricInverse[31:0],RAST_inZ0[31:0],RAST_inZ10[31:0],RAST_inZ20[31:0],RAST_inInvW0[31:0],RAST_inInvW10[31:0],RAST_inInvW20[31:0],RAST_inT0X[31:0],RAST_inT0Y[31:0],RAST_inT10X[31:0],RAST_inT10Y[31:0],RAST_inT20X[31:0],RAST_inT20Y[31:0],RAST_inColorRGBA0[127:0],RAST_inColorRGBA10[127:0],RAST_inColorRGBA20[127:0],RAST_PushNewTriData,RAST_IsFull,DINTERP_TRIDATA_FIFO_empty,DINTERP_TRIDATA_FIFO_almost_empty,DINTERP_TRIDATA_FIFO_rd_data[223:0],DINTERP_TRIDATA_FIFO_rd_en,DINTERP_TRIDATA_FIFO_full,DINTERP_TRIDATA_FIFO_wr_data[223:0],DINTERP_TRIDATA_FIFO_wr_en,INTERP_TRIDATA_FIFO_empty,INTERP_TRIDATA_FIFO_almost_empty,INTERP_TRIDATA_FIFO_rd_data[575:0],INTERP_TRIDATA_FIFO_rd_en,INTERP_TRIDATA_FIFO_full,INTERP_TRIDATA_FIFO_wr_data[575:0],INTERP_TRIDATA_FIFO_wr_en" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF DINTERP_TRIDATA_RD:DINTERP_TRIDATA_WR:INTERP_TRIDATA_RD:INTERP_TRIDATA_WR, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
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
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD EMPTY" *) (* x_interface_mode = "master DINTERP_TRIDATA_RD" *) input DINTERP_TRIDATA_FIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD ALMOST_EMPTY" *) input DINTERP_TRIDATA_FIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_DATA" *) input [223:0]DINTERP_TRIDATA_FIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 DINTERP_TRIDATA_RD RD_EN" *) output DINTERP_TRIDATA_FIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR FULL" *) (* x_interface_mode = "master DINTERP_TRIDATA_WR" *) input DINTERP_TRIDATA_FIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_DATA" *) output [223:0]DINTERP_TRIDATA_FIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 DINTERP_TRIDATA_WR WR_EN" *) output DINTERP_TRIDATA_FIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD EMPTY" *) (* x_interface_mode = "master INTERP_TRIDATA_RD" *) input INTERP_TRIDATA_FIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD ALMOST_EMPTY" *) input INTERP_TRIDATA_FIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_DATA" *) input [575:0]INTERP_TRIDATA_FIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INTERP_TRIDATA_RD RD_EN" *) output INTERP_TRIDATA_FIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR FULL" *) (* x_interface_mode = "master INTERP_TRIDATA_WR" *) input INTERP_TRIDATA_FIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_DATA" *) output [575:0]INTERP_TRIDATA_FIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 INTERP_TRIDATA_WR WR_EN" *) output INTERP_TRIDATA_FIFO_wr_en;
endmodule
