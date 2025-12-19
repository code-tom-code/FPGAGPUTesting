// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:36:02 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ConstantBuffer_0_0/design_1_ConstantBuffer_0_0_stub.v
// Design      : design_1_ConstantBuffer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ConstantBuffer,Vivado 2018.1_AR73068" *)
module design_1_ConstantBuffer_0_0(clk, enable, writeMode, regIndex, regComponent, 
  readOutData, writeInData, ConstBufferBRAM_addra, ConstBufferBRAM_clka, 
  ConstBufferBRAM_dina, ConstBufferBRAM_douta, ConstBufferBRAM_ena, ConstBufferBRAM_wea)
/* synthesis syn_black_box black_box_pad_pin="clk,enable,writeMode,regIndex[7:0],regComponent[1:0],readOutData[31:0],writeInData[31:0],ConstBufferBRAM_addra[9:0],ConstBufferBRAM_clka,ConstBufferBRAM_dina[31:0],ConstBufferBRAM_douta[31:0],ConstBufferBRAM_ena,ConstBufferBRAM_wea[0:0]" */;
  input clk;
  input enable;
  input writeMode;
  input [7:0]regIndex;
  input [1:0]regComponent;
  output [31:0]readOutData;
  input [31:0]writeInData;
  output [9:0]ConstBufferBRAM_addra;
  output ConstBufferBRAM_clka;
  output [31:0]ConstBufferBRAM_dina;
  input [31:0]ConstBufferBRAM_douta;
  output ConstBufferBRAM_ena;
  output [0:0]ConstBufferBRAM_wea;
endmodule
