// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:21:41 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ScanOut_0_0/design_1_ScanOut_0_0_stub.v
// Design      : design_1_ScanOut_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ScanOut,Vivado 2018.1_AR73068" *)
module design_1_ScanOut_0_0(clk_x10, pixelClk, CMD_BaseRenderTargetAddr, 
  CMD_ScanoutEnable, CMD_InvertOutputColor, CMD_OutputColorChannels, outXCoord, outYCoord, 
  MEM_ScanoutReadRequestsFIFO_wr_data, MEM_ScanoutReadRequestsFIFO_full, 
  MEM_ScanoutReadRequestsFIFO_wr_en, MEM_ScanoutReadResponsesFIFO_rd_data, 
  MEM_ScanoutReadResponsesFIFO_empty, MEM_ScanoutReadResponsesFIFO_rd_en, 
  VSyncActivePolarity, HSyncActivePolarity, out_scanout_enable, vsync, hsync, blank, outR, outG, 
  outB, guardBandEnable, guardBandType, controlChannel0Blue, controlChannel1Green, 
  controlChannel2Red, isTERC4Region, TERC4Character0, TERC4Character1, TERC4Character2, 
  DBG_ScanoutLoadProcess_State, DBG_InternalScanX, DBG_InternalScanY)
/* synthesis syn_black_box black_box_pad_pin="clk_x10,pixelClk,CMD_BaseRenderTargetAddr[29:0],CMD_ScanoutEnable,CMD_InvertOutputColor,CMD_OutputColorChannels[8:0],outXCoord[9:0],outYCoord[9:0],MEM_ScanoutReadRequestsFIFO_wr_data[29:0],MEM_ScanoutReadRequestsFIFO_full,MEM_ScanoutReadRequestsFIFO_wr_en,MEM_ScanoutReadResponsesFIFO_rd_data[255:0],MEM_ScanoutReadResponsesFIFO_empty,MEM_ScanoutReadResponsesFIFO_rd_en,VSyncActivePolarity,HSyncActivePolarity,out_scanout_enable,vsync,hsync,blank,outR[7:0],outG[7:0],outB[7:0],guardBandEnable,guardBandType,controlChannel0Blue[1:0],controlChannel1Green[1:0],controlChannel2Red[1:0],isTERC4Region,TERC4Character0[3:0],TERC4Character1[3:0],TERC4Character2[3:0],DBG_ScanoutLoadProcess_State[3:0],DBG_InternalScanX[9:0],DBG_InternalScanY[9:0]" */;
  input clk_x10;
  output pixelClk;
  input [29:0]CMD_BaseRenderTargetAddr;
  input CMD_ScanoutEnable;
  input CMD_InvertOutputColor;
  input [8:0]CMD_OutputColorChannels;
  output [9:0]outXCoord;
  output [9:0]outYCoord;
  output [29:0]MEM_ScanoutReadRequestsFIFO_wr_data;
  input MEM_ScanoutReadRequestsFIFO_full;
  output MEM_ScanoutReadRequestsFIFO_wr_en;
  input [255:0]MEM_ScanoutReadResponsesFIFO_rd_data;
  input MEM_ScanoutReadResponsesFIFO_empty;
  output MEM_ScanoutReadResponsesFIFO_rd_en;
  input VSyncActivePolarity;
  input HSyncActivePolarity;
  output out_scanout_enable;
  output vsync;
  output hsync;
  output blank;
  output [7:0]outR;
  output [7:0]outG;
  output [7:0]outB;
  output guardBandEnable;
  output guardBandType;
  output [1:0]controlChannel0Blue;
  output [1:0]controlChannel1Green;
  output [1:0]controlChannel2Red;
  output isTERC4Region;
  output [3:0]TERC4Character0;
  output [3:0]TERC4Character1;
  output [3:0]TERC4Character2;
  output [3:0]DBG_ScanoutLoadProcess_State;
  output [9:0]DBG_InternalScanX;
  output [9:0]DBG_InternalScanY;
endmodule
