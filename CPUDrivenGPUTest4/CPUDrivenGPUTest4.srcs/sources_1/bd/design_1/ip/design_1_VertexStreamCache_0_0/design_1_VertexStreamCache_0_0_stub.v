// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:35:20 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_VertexStreamCache_0_0/design_1_VertexStreamCache_0_0_stub.v
// Design      : design_1_VertexStreamCache_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "VertexStreamCache,Vivado 2018.1_AR73068" *)
module design_1_VertexStreamCache_0_0(clk, VSC_ReadEnable, VSC_ReadStreamIndex, 
  VSC_ReadDWORDAddr, VSC_ReadData, VSC_ReadReady, VSC_SetStreamVBAddress, VSC_StreamIndex, 
  VSC_StreamVBAddress, VSC_InvalidateCache, VertexCache_clk, VertexCache_addra, 
  VertexCache_dina, VertexCache_douta, VertexCache_ena, VertexCache_wea, 
  VSCReadRequestsFIFO_full, VSCReadRequestsFIFO_wr_data, VSCReadRequestsFIFO_wr_en, 
  VSCReadResponsesFIFO_rd_data, VSCReadResponsesFIFO_empty, VSCReadResponsesFIFO_rd_en, 
  DBG_State, DBG_CacheSetIndex, DBG_CacheElementIndex)
/* synthesis syn_black_box black_box_pad_pin="clk,VSC_ReadEnable,VSC_ReadStreamIndex[2:0],VSC_ReadDWORDAddr[21:0],VSC_ReadData[31:0],VSC_ReadReady,VSC_SetStreamVBAddress,VSC_StreamIndex[2:0],VSC_StreamVBAddress[29:0],VSC_InvalidateCache,VertexCache_clk,VertexCache_addra[9:0],VertexCache_dina[31:0],VertexCache_douta[31:0],VertexCache_ena,VertexCache_wea[0:0],VSCReadRequestsFIFO_full,VSCReadRequestsFIFO_wr_data[29:0],VSCReadRequestsFIFO_wr_en,VSCReadResponsesFIFO_rd_data[255:0],VSCReadResponsesFIFO_empty,VSCReadResponsesFIFO_rd_en,DBG_State[3:0],DBG_CacheSetIndex[4:0],DBG_CacheElementIndex[1:0]" */;
  input clk;
  input VSC_ReadEnable;
  input [2:0]VSC_ReadStreamIndex;
  input [21:0]VSC_ReadDWORDAddr;
  output [31:0]VSC_ReadData;
  output VSC_ReadReady;
  input VSC_SetStreamVBAddress;
  input [2:0]VSC_StreamIndex;
  input [29:0]VSC_StreamVBAddress;
  input VSC_InvalidateCache;
  output VertexCache_clk;
  output [9:0]VertexCache_addra;
  output [31:0]VertexCache_dina;
  input [31:0]VertexCache_douta;
  output VertexCache_ena;
  output [0:0]VertexCache_wea;
  input VSCReadRequestsFIFO_full;
  output [29:0]VSCReadRequestsFIFO_wr_data;
  output VSCReadRequestsFIFO_wr_en;
  input [255:0]VSCReadResponsesFIFO_rd_data;
  input VSCReadResponsesFIFO_empty;
  output VSCReadResponsesFIFO_rd_en;
  output [3:0]DBG_State;
  output [4:0]DBG_CacheSetIndex;
  output [1:0]DBG_CacheElementIndex;
endmodule
