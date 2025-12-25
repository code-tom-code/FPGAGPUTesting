// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:04:27 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_DbgPixelMessages_0_3/MainDesign_DbgPixelMessages_0_3_stub.v
// Design      : MainDesign_DbgPixelMessages_0_3
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_DbgPixelMessages_0_3,DbgPixelMessages,{}" *) (* core_generation_info = "MainDesign_DbgPixelMessages_0_3,DbgPixelMessages,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=DbgPixelMessages,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,C_MAX_NUM_MESSAGES=64}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "DbgPixelMessages,Vivado 2025.2" *) 
module MainDesign_DbgPixelMessages_0_3(clk, CMD_EndFrameReset, DBG_BeginDump, 
  STAGE_Message, STAGE_MessageData, STAGE_NewMessage, DBG_IsDumping, DBG_MessageIndex, 
  DBG_Message, DBG_MessageData)
/* synthesis syn_black_box black_box_pad_pin="CMD_EndFrameReset,DBG_BeginDump,STAGE_Message[15:0],STAGE_MessageData[15:0],STAGE_NewMessage,DBG_IsDumping,DBG_MessageIndex[7:0],DBG_Message[15:0],DBG_MessageData[15:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  input CMD_EndFrameReset;
  input DBG_BeginDump;
  input [15:0]STAGE_Message;
  input [15:0]STAGE_MessageData;
  input STAGE_NewMessage;
  output DBG_IsDumping;
  output [7:0]DBG_MessageIndex;
  output [15:0]DBG_Message;
  output [15:0]DBG_MessageData;
endmodule
