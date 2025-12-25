// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:00:09 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_dvid_0_0/MainDesign_dvid_0_0_stub.v
// Design      : MainDesign_dvid_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_dvid_0_0,dvid,{}" *) (* core_generation_info = "MainDesign_dvid_0_0,dvid,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=dvid,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "dvid,Vivado 2025.2" *) 
module MainDesign_dvid_0_0(clk_x10, clk_x10n, clk_pixel_x1, scanout_en, 
  red_p, green_p, blue_p, blank, hsync, vsync, controlChannel0Blue, controlChannel1Green, 
  controlChannel2Red, guardBandEnable, guardBandType, isTERC4Region, TERC4Character0, 
  TERC4Character1, TERC4Character2, red_s, green_s, blue_s, cl_s, EncodedB, EncodedG, EncodedR)
/* synthesis syn_black_box black_box_pad_pin="clk_x10n,scanout_en,red_p[7:0],green_p[7:0],blue_p[7:0],blank,hsync,vsync,controlChannel0Blue[1:0],controlChannel1Green[1:0],controlChannel2Red[1:0],guardBandEnable,guardBandType,isTERC4Region,TERC4Character0[3:0],TERC4Character1[3:0],TERC4Character2[3:0],red_s,green_s,blue_s,cl_s,EncodedB[9:0],EncodedG[9:0],EncodedR[9:0]" */
/* synthesis syn_force_seq_prim="clk_x10" */
/* synthesis syn_force_seq_prim="clk_pixel_x1" */;
  input clk_x10 /* synthesis syn_isclock = 1 */;
  input clk_x10n;
  input clk_pixel_x1 /* synthesis syn_isclock = 1 */;
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
