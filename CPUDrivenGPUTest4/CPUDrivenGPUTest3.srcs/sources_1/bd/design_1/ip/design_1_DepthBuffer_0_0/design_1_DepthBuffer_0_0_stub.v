// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Fri Apr 25 20:02:54 2025
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_DepthBuffer_0_0/design_1_DepthBuffer_0_0_stub.v
// Design      : design_1_DepthBuffer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "DepthBuffer,Vivado 2018.1_AR73068" *)
module design_1_DepthBuffer_0_0(clk, RAST_PixelReady, RAST_PosX, RAST_PosY, 
  RAST_InPixelDepth, RAST_SetDepthParams, RAST_DepthWriteEnable, RAST_DepthFunction, 
  RAST_DepthIsIdle, RAST_StencilWriteEnable, RAST_StencilRefVal, RAST_StencilReadMask, 
  RAST_StencilWriteMask, RAST_StencilCmpFunc, RAST_StencilFailOp, RAST_StencilZFailOp, 
  RAST_StencilPassOp, RAST_PixelPassedDepthStencilTest, RAST_PixelFailedDepthTest, 
  RAST_PixelFailedStencilTest, URAM_addra, URAM_clka, URAM_dina, URAM_ena, URAM_wea, 
  URAM_addrb, URAM_clkb, URAM_doutb, URAM_enb, CMD_ClearDepthBuffer, CMD_ClearStencilBuffer, 
  CMD_ClearDepthValue, CMD_ClearStencilValue, CMD_DepthIsIdle, 
  STAT_PixelsPassedDepthStencilTest, STAT_PixelsFailedDepthTest, 
  STAT_PixelsFailedStencilTest)
/* synthesis syn_black_box black_box_pad_pin="clk,RAST_PixelReady,RAST_PosX[9:0],RAST_PosY[9:0],RAST_InPixelDepth[23:0],RAST_SetDepthParams,RAST_DepthWriteEnable,RAST_DepthFunction[2:0],RAST_DepthIsIdle,RAST_StencilWriteEnable,RAST_StencilRefVal[7:0],RAST_StencilReadMask[7:0],RAST_StencilWriteMask[7:0],RAST_StencilCmpFunc[2:0],RAST_StencilFailOp[2:0],RAST_StencilZFailOp[2:0],RAST_StencilPassOp[2:0],RAST_PixelPassedDepthStencilTest,RAST_PixelFailedDepthTest,RAST_PixelFailedStencilTest,URAM_addra[17:0],URAM_clka,URAM_dina[63:0],URAM_ena,URAM_wea[7:0],URAM_addrb[17:0],URAM_clkb,URAM_doutb[63:0],URAM_enb,CMD_ClearDepthBuffer,CMD_ClearStencilBuffer,CMD_ClearDepthValue[23:0],CMD_ClearStencilValue[7:0],CMD_DepthIsIdle,STAT_PixelsPassedDepthStencilTest[31:0],STAT_PixelsFailedDepthTest[31:0],STAT_PixelsFailedStencilTest[31:0]" */;
  input clk;
  input RAST_PixelReady;
  input [9:0]RAST_PosX;
  input [9:0]RAST_PosY;
  input [23:0]RAST_InPixelDepth;
  input RAST_SetDepthParams;
  input RAST_DepthWriteEnable;
  input [2:0]RAST_DepthFunction;
  output RAST_DepthIsIdle;
  input RAST_StencilWriteEnable;
  input [7:0]RAST_StencilRefVal;
  input [7:0]RAST_StencilReadMask;
  input [7:0]RAST_StencilWriteMask;
  input [2:0]RAST_StencilCmpFunc;
  input [2:0]RAST_StencilFailOp;
  input [2:0]RAST_StencilZFailOp;
  input [2:0]RAST_StencilPassOp;
  output RAST_PixelPassedDepthStencilTest;
  output RAST_PixelFailedDepthTest;
  output RAST_PixelFailedStencilTest;
  output [17:0]URAM_addra;
  output URAM_clka;
  output [63:0]URAM_dina;
  output URAM_ena;
  output [7:0]URAM_wea;
  output [17:0]URAM_addrb;
  output URAM_clkb;
  input [63:0]URAM_doutb;
  output URAM_enb;
  input CMD_ClearDepthBuffer;
  input CMD_ClearStencilBuffer;
  input [23:0]CMD_ClearDepthValue;
  input [7:0]CMD_ClearStencilValue;
  output CMD_DepthIsIdle;
  output [31:0]STAT_PixelsPassedDepthStencilTest;
  output [31:0]STAT_PixelsFailedDepthTest;
  output [31:0]STAT_PixelsFailedStencilTest;
endmodule
