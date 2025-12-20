// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:21:08 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ResetN_UntilClockLoc_0_1/MainDesign_ResetN_UntilClockLoc_0_1_stub.v
// Design      : MainDesign_ResetN_UntilClockLoc_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_ResetN_UntilClockLoc_0_1,ResetN_UntilClockLocked,{}" *) (* core_generation_info = "MainDesign_ResetN_UntilClockLoc_0_1,ResetN_UntilClockLocked,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ResetN_UntilClockLocked,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "ResetN_UntilClockLocked,Vivado 2025.2" *) 
module MainDesign_ResetN_UntilClockLoc_0_1(inResetp, locked, outResetn)
/* synthesis syn_black_box black_box_pad_pin="inResetp,locked,outResetn" */;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 inResetp RST" *) (* x_interface_mode = "slave inResetp" *) (* x_interface_parameter = "XIL_INTERFACENAME inResetp, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input inResetp;
  input locked;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 outResetn RST" *) (* x_interface_mode = "master outResetn" *) (* x_interface_parameter = "XIL_INTERFACENAME outResetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) output outResetn;
endmodule
