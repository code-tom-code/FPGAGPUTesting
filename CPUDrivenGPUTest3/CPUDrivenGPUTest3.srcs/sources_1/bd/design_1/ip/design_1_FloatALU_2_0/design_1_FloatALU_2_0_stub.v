// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:32:00 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_FloatALU_2_0/design_1_FloatALU_2_0_stub.v
// Design      : design_1_FloatALU_2_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "FloatALU,Vivado 2018.1_AR73068" *)
module design_1_FloatALU_2_0(clk, IN_A, IN_B, IN_MODE, OUT_RESULT, ISHFT_GO, 
  IMUL_GO, IADD_GO, ICMP_GO, ICNV_GO, ISPEC_GO, IBIT_GO)
/* synthesis syn_black_box black_box_pad_pin="clk,IN_A[31:0],IN_B[31:0],IN_MODE[2:0],OUT_RESULT[31:0],ISHFT_GO,IMUL_GO,IADD_GO,ICMP_GO,ICNV_GO,ISPEC_GO,IBIT_GO" */;
  input clk;
  input [31:0]IN_A;
  input [31:0]IN_B;
  input [2:0]IN_MODE;
  output [31:0]OUT_RESULT;
  input ISHFT_GO;
  input IMUL_GO;
  input IADD_GO;
  input ICMP_GO;
  input ICNV_GO;
  input ISPEC_GO;
  input IBIT_GO;
endmodule
