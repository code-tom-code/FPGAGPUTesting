// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:20:29 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ScanOut_0_0/MainDesign_ScanOut_0_0_stub.v
// Design      : MainDesign_ScanOut_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_ScanOut_0_0,ScanOut,{}" *) (* core_generation_info = "MainDesign_ScanOut_0_0,ScanOut,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ScanOut,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,Use_HDMI=true}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "ScanOut,Vivado 2025.2" *) 
module MainDesign_ScanOut_0_0(clk_x10, pixelClk, CMD_BaseRenderTargetAddr, 
  CMD_ScanoutEnable, CMD_InvertOutputColor, CMD_OutputColorChannels, outXCoord, outYCoord, 
  MEM_ScanoutReadRequestsFIFO_wr_data, MEM_ScanoutReadRequestsFIFO_full, 
  MEM_ScanoutReadRequestsFIFO_wr_en, MEM_ScanoutReadResponsesFIFO_rd_data, 
  MEM_ScanoutReadResponsesFIFO_empty, MEM_ScanoutReadResponsesFIFO_almost_empty, 
  MEM_ScanoutReadResponsesFIFO_rd_en, VSyncActivePolarity, HSyncActivePolarity, 
  out_scanout_enable, vsync, hsync, blank, outR, outG, outB, guardBandEnable, guardBandType, 
  controlChannel0Blue, controlChannel1Green, controlChannel2Red, isTERC4Region, 
  TERC4Character0, TERC4Character1, TERC4Character2, DBG_ScanoutLoadProcess_State, 
  DBG_InternalScanX, DBG_InternalScanY)
/* synthesis syn_black_box black_box_pad_pin="pixelClk,CMD_BaseRenderTargetAddr[29:0],CMD_ScanoutEnable,CMD_InvertOutputColor,CMD_OutputColorChannels[8:0],outXCoord[9:0],outYCoord[9:0],MEM_ScanoutReadRequestsFIFO_wr_data[29:0],MEM_ScanoutReadRequestsFIFO_full,MEM_ScanoutReadRequestsFIFO_wr_en,MEM_ScanoutReadResponsesFIFO_rd_data[255:0],MEM_ScanoutReadResponsesFIFO_empty,MEM_ScanoutReadResponsesFIFO_almost_empty,MEM_ScanoutReadResponsesFIFO_rd_en,VSyncActivePolarity,HSyncActivePolarity,out_scanout_enable,vsync,hsync,blank,outR[7:0],outG[7:0],outB[7:0],guardBandEnable,guardBandType,controlChannel0Blue[1:0],controlChannel1Green[1:0],controlChannel2Red[1:0],isTERC4Region,TERC4Character0[3:0],TERC4Character1[3:0],TERC4Character2[3:0],DBG_ScanoutLoadProcess_State[3:0],DBG_InternalScanX[9:0],DBG_InternalScanY[9:0]" */
/* synthesis syn_force_seq_prim="clk_x10" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_x10 CLK" *) (* x_interface_mode = "slave clk_x10" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_x10, FREQ_HZ 251750000, ASSOCIATED_BUSIF ScanoutReadRequestsFIFO:ScanoutReadResponses, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_0_clk_x10, INSERT_VIP 0" *) input clk_x10 /* synthesis syn_isclock = 1 */;
  output pixelClk;
  input [29:0]CMD_BaseRenderTargetAddr;
  input CMD_ScanoutEnable;
  input CMD_InvertOutputColor;
  input [8:0]CMD_OutputColorChannels;
  output [9:0]outXCoord;
  output [9:0]outYCoord;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO WR_DATA" *) (* x_interface_mode = "master ScanoutReadRequestsFIFO" *) output [29:0]MEM_ScanoutReadRequestsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO FULL" *) input MEM_ScanoutReadRequestsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ScanoutReadRequestsFIFO WR_EN" *) output MEM_ScanoutReadRequestsFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses RD_DATA" *) (* x_interface_mode = "master ScanoutReadResponses" *) input [255:0]MEM_ScanoutReadResponsesFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses EMPTY" *) input MEM_ScanoutReadResponsesFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses ALMOST_EMPTY" *) input MEM_ScanoutReadResponsesFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ScanoutReadResponses RD_EN" *) output MEM_ScanoutReadResponsesFIFO_rd_en;
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
