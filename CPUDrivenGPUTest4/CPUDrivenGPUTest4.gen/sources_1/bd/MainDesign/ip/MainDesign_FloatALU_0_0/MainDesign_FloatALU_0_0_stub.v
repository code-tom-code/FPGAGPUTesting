// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:00:35 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_FloatALU_0_0/MainDesign_FloatALU_0_0_stub.v
// Design      : MainDesign_FloatALU_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_FloatALU_0_0,FloatALU,{}" *) (* core_generation_info = "MainDesign_FloatALU_0_0,FloatALU,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=FloatALU,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "FloatALU,Vivado 2025.2" *) 
module MainDesign_FloatALU_0_0(clk, IN_A, IN_B, IN_MODE, OUT_RESULT, ISHFT_GO, 
  IMUL_GO, IADD_GO, ICMP_GO, ICNV_GO, ISPEC_GO, IBIT_GO)
/* synthesis syn_black_box black_box_pad_pin="IN_A[31:0],IN_B[31:0],IN_MODE[2:0],OUT_RESULT[31:0],ISHFT_GO,IMUL_GO,IADD_GO,ICMP_GO,ICNV_GO,ISPEC_GO,IBIT_GO" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
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
