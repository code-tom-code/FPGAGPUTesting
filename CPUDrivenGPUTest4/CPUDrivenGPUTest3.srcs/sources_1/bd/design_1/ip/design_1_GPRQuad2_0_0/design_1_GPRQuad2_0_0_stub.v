// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:33:51 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_GPRQuad2_0_0/design_1_GPRQuad2_0_0_stub.v
// Design      : design_1_GPRQuad2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "GPRQuad2,Vivado 2018.1_AR73068" *)
module design_1_GPRQuad2_0_0(clk, readQuadIndex, writeQuadIndex, portA_en, 
  portA_regType, portA_regIdx, portA_regChan, portA_readOutData, portB_en, portB_regType, 
  portB_regIdx, portB_regChan, portB_readOutData, portW_en, portW_regType, portW_regIdx, 
  portW_regChan, portW_writeInData, clka_bram0, addra_bram0, dina_bram0, ena_bram0, wea_bram0, 
  clkb_bram0, addrb_bram0, enb_bram0, doutb_bram0, clka_bram1, addra_bram1, dina_bram1, 
  ena_bram1, wea_bram1, clkb_bram1, addrb_bram1, enb_bram1, doutb_bram1, clka_bram2, addra_bram2, 
  dina_bram2, ena_bram2, wea_bram2, clkb_bram2, addrb_bram2, enb_bram2, doutb_bram2, clka_bram3, 
  addra_bram3, dina_bram3, ena_bram3, wea_bram3, clkb_bram3, addrb_bram3, enb_bram3, doutb_bram3, 
  clka_bram4, addra_bram4, dina_bram4, ena_bram4, wea_bram4, clkb_bram4, addrb_bram4, enb_bram4, 
  doutb_bram4, clka_bram5, addra_bram5, dina_bram5, ena_bram5, wea_bram5, clkb_bram5, 
  addrb_bram5, enb_bram5, doutb_bram5, clka_bram6, addra_bram6, dina_bram6, ena_bram6, wea_bram6, 
  clkb_bram6, addrb_bram6, enb_bram6, doutb_bram6, clka_bram7, addra_bram7, dina_bram7, 
  ena_bram7, wea_bram7, clkb_bram7, addrb_bram7, enb_bram7, doutb_bram7)
/* synthesis syn_black_box black_box_pad_pin="clk,readQuadIndex[1:0],writeQuadIndex[1:0],portA_en,portA_regType[1:0],portA_regIdx[2:0],portA_regChan[1:0],portA_readOutData[127:0],portB_en,portB_regType[1:0],portB_regIdx[2:0],portB_regChan[1:0],portB_readOutData[127:0],portW_en,portW_regType[1:0],portW_regIdx[2:0],portW_regChan[1:0],portW_writeInData[127:0],clka_bram0,addra_bram0[8:0],dina_bram0[31:0],ena_bram0,wea_bram0[0:0],clkb_bram0,addrb_bram0[8:0],enb_bram0,doutb_bram0[31:0],clka_bram1,addra_bram1[8:0],dina_bram1[31:0],ena_bram1,wea_bram1[0:0],clkb_bram1,addrb_bram1[8:0],enb_bram1,doutb_bram1[31:0],clka_bram2,addra_bram2[8:0],dina_bram2[31:0],ena_bram2,wea_bram2[0:0],clkb_bram2,addrb_bram2[8:0],enb_bram2,doutb_bram2[31:0],clka_bram3,addra_bram3[8:0],dina_bram3[31:0],ena_bram3,wea_bram3[0:0],clkb_bram3,addrb_bram3[8:0],enb_bram3,doutb_bram3[31:0],clka_bram4,addra_bram4[8:0],dina_bram4[31:0],ena_bram4,wea_bram4[0:0],clkb_bram4,addrb_bram4[8:0],enb_bram4,doutb_bram4[31:0],clka_bram5,addra_bram5[8:0],dina_bram5[31:0],ena_bram5,wea_bram5[0:0],clkb_bram5,addrb_bram5[8:0],enb_bram5,doutb_bram5[31:0],clka_bram6,addra_bram6[8:0],dina_bram6[31:0],ena_bram6,wea_bram6[0:0],clkb_bram6,addrb_bram6[8:0],enb_bram6,doutb_bram6[31:0],clka_bram7,addra_bram7[8:0],dina_bram7[31:0],ena_bram7,wea_bram7[0:0],clkb_bram7,addrb_bram7[8:0],enb_bram7,doutb_bram7[31:0]" */;
  input clk;
  input [1:0]readQuadIndex;
  input [1:0]writeQuadIndex;
  input portA_en;
  input [1:0]portA_regType;
  input [2:0]portA_regIdx;
  input [1:0]portA_regChan;
  output [127:0]portA_readOutData;
  input portB_en;
  input [1:0]portB_regType;
  input [2:0]portB_regIdx;
  input [1:0]portB_regChan;
  output [127:0]portB_readOutData;
  input portW_en;
  input [1:0]portW_regType;
  input [2:0]portW_regIdx;
  input [1:0]portW_regChan;
  input [127:0]portW_writeInData;
  output clka_bram0;
  output [8:0]addra_bram0;
  output [31:0]dina_bram0;
  output ena_bram0;
  output [0:0]wea_bram0;
  output clkb_bram0;
  output [8:0]addrb_bram0;
  output enb_bram0;
  input [31:0]doutb_bram0;
  output clka_bram1;
  output [8:0]addra_bram1;
  output [31:0]dina_bram1;
  output ena_bram1;
  output [0:0]wea_bram1;
  output clkb_bram1;
  output [8:0]addrb_bram1;
  output enb_bram1;
  input [31:0]doutb_bram1;
  output clka_bram2;
  output [8:0]addra_bram2;
  output [31:0]dina_bram2;
  output ena_bram2;
  output [0:0]wea_bram2;
  output clkb_bram2;
  output [8:0]addrb_bram2;
  output enb_bram2;
  input [31:0]doutb_bram2;
  output clka_bram3;
  output [8:0]addra_bram3;
  output [31:0]dina_bram3;
  output ena_bram3;
  output [0:0]wea_bram3;
  output clkb_bram3;
  output [8:0]addrb_bram3;
  output enb_bram3;
  input [31:0]doutb_bram3;
  output clka_bram4;
  output [8:0]addra_bram4;
  output [31:0]dina_bram4;
  output ena_bram4;
  output [0:0]wea_bram4;
  output clkb_bram4;
  output [8:0]addrb_bram4;
  output enb_bram4;
  input [31:0]doutb_bram4;
  output clka_bram5;
  output [8:0]addra_bram5;
  output [31:0]dina_bram5;
  output ena_bram5;
  output [0:0]wea_bram5;
  output clkb_bram5;
  output [8:0]addrb_bram5;
  output enb_bram5;
  input [31:0]doutb_bram5;
  output clka_bram6;
  output [8:0]addra_bram6;
  output [31:0]dina_bram6;
  output ena_bram6;
  output [0:0]wea_bram6;
  output clkb_bram6;
  output [8:0]addrb_bram6;
  output enb_bram6;
  input [31:0]doutb_bram6;
  output clka_bram7;
  output [8:0]addra_bram7;
  output [31:0]dina_bram7;
  output ena_bram7;
  output [0:0]wea_bram7;
  output clkb_bram7;
  output [8:0]addrb_bram7;
  output enb_bram7;
  input [31:0]doutb_bram7;
endmodule
