// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:27:25 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ila_0_4/design_1_ila_0_4_stub.v
// Design      : design_1_ila_0_4
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2018.1_AR73068" *)
module design_1_ila_0_4(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15, probe16, probe17, 
  probe18, probe19, probe20, probe21, probe22)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[5:0],probe1[63:0],probe2[31:0],probe3[13:0],probe4[15:0],probe5[15:0],probe6[0:0],probe7[1:0],probe8[1:0],probe9[3:0],probe10[15:0],probe11[15:0],probe12[15:0],probe13[15:0],probe14[15:0],probe15[15:0],probe16[15:0],probe17[15:0],probe18[15:0],probe19[15:0],probe20[15:0],probe21[15:0],probe22[15:0]" */;
  input clk;
  input [5:0]probe0;
  input [63:0]probe1;
  input [31:0]probe2;
  input [13:0]probe3;
  input [15:0]probe4;
  input [15:0]probe5;
  input [0:0]probe6;
  input [1:0]probe7;
  input [1:0]probe8;
  input [3:0]probe9;
  input [15:0]probe10;
  input [15:0]probe11;
  input [15:0]probe12;
  input [15:0]probe13;
  input [15:0]probe14;
  input [15:0]probe15;
  input [15:0]probe16;
  input [15:0]probe17;
  input [15:0]probe18;
  input [15:0]probe19;
  input [15:0]probe20;
  input [15:0]probe21;
  input [15:0]probe22;
endmodule
