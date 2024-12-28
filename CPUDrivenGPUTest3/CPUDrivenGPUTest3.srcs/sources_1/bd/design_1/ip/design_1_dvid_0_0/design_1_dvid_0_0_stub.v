// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:44:04 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_dvid_0_0/design_1_dvid_0_0_stub.v
// Design      : design_1_dvid_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dvid,Vivado 2018.1_AR73068" *)
module design_1_dvid_0_0(clk_x10, clk_x10n, clk_pixel_x1, scanout_en, 
  red_p, green_p, blue_p, blank, hsync, vsync, controlChannel0Blue, controlChannel1Green, 
  controlChannel2Red, guardBandEnable, guardBandType, isTERC4Region, TERC4Character0, 
  TERC4Character1, TERC4Character2, red_s, green_s, blue_s, cl_s, EncodedB, EncodedG, EncodedR)
/* synthesis syn_black_box black_box_pad_pin="clk_x10,clk_x10n,clk_pixel_x1,scanout_en,red_p[7:0],green_p[7:0],blue_p[7:0],blank,hsync,vsync,controlChannel0Blue[1:0],controlChannel1Green[1:0],controlChannel2Red[1:0],guardBandEnable,guardBandType,isTERC4Region,TERC4Character0[3:0],TERC4Character1[3:0],TERC4Character2[3:0],red_s,green_s,blue_s,cl_s,EncodedB[9:0],EncodedG[9:0],EncodedR[9:0]" */;
  input clk_x10;
  input clk_x10n;
  input clk_pixel_x1;
  input scanout_en;
  input [7:0]red_p;
  input [7:0]green_p;
  input [7:0]blue_p;
  input blank;
  input hsync;
  input vsync;
  input [1:0]controlChannel0Blue;
  input [1:0]controlChannel1Green;
  input [1:0]controlChannel2Red;
  input guardBandEnable;
  input guardBandType;
  input isTERC4Region;
  input [3:0]TERC4Character0;
  input [3:0]TERC4Character1;
  input [3:0]TERC4Character2;
  output red_s;
  output green_s;
  output blue_s;
  output cl_s;
  output [9:0]EncodedB;
  output [9:0]EncodedG;
  output [9:0]EncodedR;
endmodule
