// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:45:23 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_obuf_outputs_0_0/design_1_obuf_outputs_0_0_stub.v
// Design      : design_1_obuf_outputs_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "obuf_outputs,Vivado 2018.1_AR73068" *)
module design_1_obuf_outputs_0_0(red_s, green_s, blue_s, cl_s, out_red_p, out_red_n, 
  out_green_p, out_green_n, out_blue_p, out_blue_n, out_cl_p, out_cl_n)
/* synthesis syn_black_box black_box_pad_pin="red_s,green_s,blue_s,cl_s,out_red_p,out_red_n,out_green_p,out_green_n,out_blue_p,out_blue_n,out_cl_p,out_cl_n" */;
  input red_s;
  input green_s;
  input blue_s;
  input cl_s;
  output out_red_p;
  output out_red_n;
  output out_green_p;
  output out_green_n;
  output out_blue_p;
  output out_blue_n;
  output out_cl_p;
  output out_cl_n;
endmodule
