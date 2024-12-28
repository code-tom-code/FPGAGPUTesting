// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:26:27 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_ila_0_3/design_1_ila_0_3_stub.v
// Design      : design_1_ila_0_3
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "ila,Vivado 2018.1_AR73068" *)
module design_1_ila_0_3(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10, probe11, probe12, probe13, probe14, probe15)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[95:0],probe1[23:0],probe2[2:0],probe3[31:0],probe4[31:0],probe5[31:0],probe6[31:0],probe7[63:0],probe8[63:0],probe9[7:0],probe10[17:0],probe11[17:0],probe12[6:0],probe13[0:0],probe14[0:0],probe15[15:0]" */;
  input clk;
  input [95:0]probe0;
  input [23:0]probe1;
  input [2:0]probe2;
  input [31:0]probe3;
  input [31:0]probe4;
  input [31:0]probe5;
  input [31:0]probe6;
  input [63:0]probe7;
  input [63:0]probe8;
  input [7:0]probe9;
  input [17:0]probe10;
  input [17:0]probe11;
  input [6:0]probe12;
  input [0:0]probe13;
  input [0:0]probe14;
  input [15:0]probe15;
endmodule
