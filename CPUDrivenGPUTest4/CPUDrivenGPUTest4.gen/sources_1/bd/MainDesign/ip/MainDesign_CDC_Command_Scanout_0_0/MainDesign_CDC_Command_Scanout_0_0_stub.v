// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:58:44 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_CDC_Command_Scanout_0_0/MainDesign_CDC_Command_Scanout_0_0_stub.v
// Design      : MainDesign_CDC_Command_Scanout_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_CDC_Command_Scanout_0_0,CDC_Command_Scanout,{}" *) (* core_generation_info = "MainDesign_CDC_Command_Scanout_0_0,CDC_Command_Scanout,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=CDC_Command_Scanout,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "CDC_Command_Scanout,Vivado 2025.2" *) 
module MainDesign_CDC_Command_Scanout_0_0(cmd_clk, CMD_VSync, CMD_RenderTargetBaseAddr, 
  CMD_ScanEnable, CMD_InvertOutputColor, CMD_OutputColorChannels, scanout_clk, 
  SCANOUT_VSync, SCANOUT_RenderTargetBaseAddr, SCANOUT_ScanEnable, 
  SCANOUT_InvertOutputColor, SCANOUT_OutputColorChannels)
/* synthesis syn_black_box black_box_pad_pin="CMD_VSync,CMD_RenderTargetBaseAddr[29:0],CMD_ScanEnable,CMD_InvertOutputColor,CMD_OutputColorChannels[8:0],SCANOUT_VSync,SCANOUT_RenderTargetBaseAddr[29:0],SCANOUT_ScanEnable,SCANOUT_InvertOutputColor,SCANOUT_OutputColorChannels[8:0]" */
/* synthesis syn_force_seq_prim="cmd_clk" */
/* synthesis syn_force_seq_prim="scanout_clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 cmd_clk CLK" *) (* x_interface_mode = "slave cmd_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME cmd_clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input cmd_clk /* synthesis syn_isclock = 1 */;
  output CMD_VSync;
  input [29:0]CMD_RenderTargetBaseAddr;
  input CMD_ScanEnable;
  input CMD_InvertOutputColor;
  input [8:0]CMD_OutputColorChannels;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 scanout_clk CLK" *) (* x_interface_mode = "slave scanout_clk" *) (* x_interface_parameter = "XIL_INTERFACENAME scanout_clk, FREQ_HZ 251750000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_clk_wiz_0_0_clk_x10, INSERT_VIP 0" *) input scanout_clk /* synthesis syn_isclock = 1 */;
  input SCANOUT_VSync;
  output [29:0]SCANOUT_RenderTargetBaseAddr;
  output SCANOUT_ScanEnable;
  output SCANOUT_InvertOutputColor;
  output [8:0]SCANOUT_OutputColorChannels;
endmodule
