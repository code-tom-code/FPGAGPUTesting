// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 01:01:07 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_fifo_generator_0_23/design_1_fifo_generator_0_23_stub.v
// Design      : design_1_fifo_generator_0_23
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_2,Vivado 2018.1_AR73068" *)
module design_1_fifo_generator_0_23(clk, srst, din, wr_en, rd_en, dout, full, empty, 
  prog_full, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[127:0],wr_en,rd_en,dout[127:0],full,empty,prog_full,wr_rst_busy,rd_rst_busy" */;
  input clk;
  input srst;
  input [127:0]din;
  input wr_en;
  input rd_en;
  output [127:0]dout;
  output full;
  output empty;
  output prog_full;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
