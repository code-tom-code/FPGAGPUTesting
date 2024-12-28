// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:37:59 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_IndexBufferCache_0_0/design_1_IndexBufferCache_0_0_stub.v
// Design      : design_1_IndexBufferCache_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "IndexBufferCache,Vivado 2018.1_AR73068" *)
module design_1_IndexBufferCache_0_0(clk, VBB_ReadEnable, VBB_ReadAddr, 
  VBB_ReadData, VBB_ReadReady, VBB_InvalidateIndexCache, IBCReadRequestsFIFO_full, 
  IBCReadRequestsFIFO_wr_data, IBCReadRequestsFIFO_wr_en, IBCReadResponsesFIFO_rd_data, 
  IBCReadResponsesFIFO_empty, IBCReadResponsesFIFO_rd_en, DBG_State, 
  DBG_IBCReadRequestsFIFO_full, DBG_IBCReadResponsesFIFO_empty)
/* synthesis syn_black_box black_box_pad_pin="clk,VBB_ReadEnable,VBB_ReadAddr[29:0],VBB_ReadData[31:0],VBB_ReadReady,VBB_InvalidateIndexCache,IBCReadRequestsFIFO_full,IBCReadRequestsFIFO_wr_data[29:0],IBCReadRequestsFIFO_wr_en,IBCReadResponsesFIFO_rd_data[255:0],IBCReadResponsesFIFO_empty,IBCReadResponsesFIFO_rd_en,DBG_State[1:0],DBG_IBCReadRequestsFIFO_full,DBG_IBCReadResponsesFIFO_empty" */;
  input clk;
  input VBB_ReadEnable;
  input [29:0]VBB_ReadAddr;
  output [31:0]VBB_ReadData;
  output VBB_ReadReady;
  input VBB_InvalidateIndexCache;
  input IBCReadRequestsFIFO_full;
  output [29:0]IBCReadRequestsFIFO_wr_data;
  output IBCReadRequestsFIFO_wr_en;
  input [255:0]IBCReadResponsesFIFO_rd_data;
  input IBCReadResponsesFIFO_empty;
  output IBCReadResponsesFIFO_rd_en;
  output [1:0]DBG_State;
  output DBG_IBCReadRequestsFIFO_full;
  output DBG_IBCReadResponsesFIFO_empty;
endmodule
