// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec 22 00:18:47 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_obuf_outputs_0_0/MainDesign_obuf_outputs_0_0_stub.v
// Design      : MainDesign_obuf_outputs_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_obuf_outputs_0_0,obuf_outputs,{}" *) (* core_generation_info = "MainDesign_obuf_outputs_0_0,obuf_outputs,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=obuf_outputs,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "obuf_outputs,Vivado 2025.2" *) 
module MainDesign_obuf_outputs_0_0(clk, red_s, green_s, blue_s, cl_s, out_red_p, 
  out_red_n, out_green_p, out_green_n, out_blue_p, out_blue_n, out_cl_p, out_cl_n)
/* synthesis syn_black_box black_box_pad_pin="red_s,green_s,blue_s,cl_s,out_red_p,out_red_n,out_green_p,out_green_n,out_blue_p,out_blue_n,out_cl_p,out_cl_n" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk333_250 CLK" *) (* x_interface_mode = "slave clk333_250" *) (* x_interface_parameter = "XIL_INTERFACENAME clk333_250, FREQ_HZ 251750000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_0_clk_x10, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
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
