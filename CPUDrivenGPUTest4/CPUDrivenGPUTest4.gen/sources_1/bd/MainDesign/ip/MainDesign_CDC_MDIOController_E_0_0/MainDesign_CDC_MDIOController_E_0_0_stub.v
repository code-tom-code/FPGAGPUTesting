// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Tue Dec 23 19:02:17 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_CDC_MDIOController_E_0_0/MainDesign_CDC_MDIOController_E_0_0_stub.v
// Design      : MainDesign_CDC_MDIOController_E_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_CDC_MDIOController_E_0_0,CDC_MDIOController_EthernetController,{}" *) (* core_generation_info = "MainDesign_CDC_MDIOController_E_0_0,CDC_MDIOController_EthernetController,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=CDC_MDIOController_EthernetController,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "CDC_MDIOController_EthernetController,Vivado 2025.2" *) 
module MainDesign_CDC_MDIOController_E_0_0(Out_clk125, Out_Signal, In_clk2_5, In_Signal)
/* synthesis syn_black_box black_box_pad_pin="Out_Signal,In_Signal" */
/* synthesis syn_force_seq_prim="Out_clk125" */
/* synthesis syn_force_seq_prim="In_clk2_5" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 Out_clk125 CLK" *) (* x_interface_mode = "slave Out_clk125" *) (* x_interface_parameter = "XIL_INTERFACENAME Out_clk125, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN MainDesign_gig_ethernet_pcs_pma_0_0_clk125_out, INSERT_VIP 0" *) input Out_clk125 /* synthesis syn_isclock = 1 */;
  output Out_Signal;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 In_clk2_5 CLK" *) (* x_interface_mode = "slave In_clk2_5" *) (* x_interface_parameter = "XIL_INTERFACENAME In_clk2_5, FREQ_HZ 2500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0" *) input In_clk2_5 /* synthesis syn_isclock = 1 */;
  input In_Signal;
endmodule
