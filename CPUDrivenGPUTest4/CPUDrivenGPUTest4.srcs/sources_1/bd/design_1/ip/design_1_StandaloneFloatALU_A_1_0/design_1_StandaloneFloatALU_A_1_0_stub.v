// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:53:55 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_StandaloneFloatALU_A_1_0/design_1_StandaloneFloatALU_A_1_0_stub.v
// Design      : design_1_StandaloneFloatALU_A_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "StandaloneFloatALU_ADD,Vivado 2018.1_AR73068" *)
module design_1_StandaloneFloatALU_A_1_0(clk, IN_A, IN_B, OADD, IADD_GO)
/* synthesis syn_black_box black_box_pad_pin="clk,IN_A[31:0],IN_B[31:0],OADD[31:0],IADD_GO" */;
  input clk;
  input [31:0]IN_A;
  input [31:0]IN_B;
  output [31:0]OADD;
  input IADD_GO;
endmodule
