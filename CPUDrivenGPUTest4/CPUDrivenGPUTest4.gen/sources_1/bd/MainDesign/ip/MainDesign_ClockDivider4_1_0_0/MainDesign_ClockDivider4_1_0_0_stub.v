// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:51:11 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ClockDivider4_1_0_0/MainDesign_ClockDivider4_1_0_0_stub.v
// Design      : MainDesign_ClockDivider4_1_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_ClockDivider4_1_0_0,ClockDivider4_1,{}" *) (* core_generation_info = "MainDesign_ClockDivider4_1_0_0,ClockDivider4_1,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ClockDivider4_1,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "ClockDivider4_1,Vivado 2025.2" *) 
module MainDesign_ClockDivider4_1_0_0(clkin100, clkout25)
/* synthesis syn_black_box black_box_pad_pin="clkout25" */
/* synthesis syn_force_seq_prim="clkin100" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clkin100 CLK" *) (* x_interface_mode = "slave clkin100" *) (* x_interface_parameter = "XIL_INTERFACENAME clkin100, FREQ_HZ 10000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_1_clk_out10_0, INSERT_VIP 0" *) input clkin100 /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clkout25 CLK" *) (* x_interface_mode = "master clkout25" *) (* x_interface_parameter = "XIL_INTERFACENAME clkout25, FREQ_HZ 2500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0" *) output clkout25;
endmodule
