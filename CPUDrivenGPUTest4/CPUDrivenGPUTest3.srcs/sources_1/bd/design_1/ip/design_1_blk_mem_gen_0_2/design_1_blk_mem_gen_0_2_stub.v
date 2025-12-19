// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:48:57 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_blk_mem_gen_0_2/design_1_blk_mem_gen_0_2_stub.v
// Design      : design_1_blk_mem_gen_0_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1_AR73068" *)
module design_1_blk_mem_gen_0_2(clka, ena, wea, addra, dina, clkb, enb, regceb, addrb, 
  doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[7:0],addra[17:0],dina[63:0],clkb,enb,regceb,addrb[17:0],doutb[63:0]" */;
  input clka;
  input ena;
  input [7:0]wea;
  input [17:0]addra;
  input [63:0]dina;
  input clkb;
  input enb;
  input regceb;
  input [17:0]addrb;
  output [63:0]doutb;
endmodule
