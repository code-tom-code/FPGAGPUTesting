// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:57:31 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ClearBlock_0_0/MainDesign_ClearBlock_0_0_stub.v
// Design      : MainDesign_ClearBlock_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_ClearBlock_0_0,ClearBlock,{}" *) (* core_generation_info = "MainDesign_ClearBlock_0_0,ClearBlock,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ClearBlock,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "ClearBlock,Vivado 2025.2" *) 
module MainDesign_ClearBlock_0_0(clk, CMD_ClearBlockIsIdle, 
  CMD_ClearBlockBeginSignal, CMD_BaseRenderTargetAddr, CMD_ClearColorRGBA, 
  CMD_ClearDRAMLineCount, MEM_ClearBlockWriteRequestsFIFO_wr_data, 
  MEM_ClearBlockWriteRequestsFIFO_full, MEM_ClearBlockWriteRequestsFIFO_almost_full, 
  MEM_ClearBlockWriteRequestsFIFO_wr_en, DBG_ClearBlock_State, 
  DBG_LastWrittenClearData)
/* synthesis syn_black_box black_box_pad_pin="CMD_ClearBlockIsIdle,CMD_ClearBlockBeginSignal,CMD_BaseRenderTargetAddr[29:0],CMD_ClearColorRGBA[31:0],CMD_ClearDRAMLineCount[15:0],MEM_ClearBlockWriteRequestsFIFO_wr_data[293:0],MEM_ClearBlockWriteRequestsFIFO_full,MEM_ClearBlockWriteRequestsFIFO_almost_full,MEM_ClearBlockWriteRequestsFIFO_wr_en,DBG_ClearBlock_State[3:0],DBG_LastWrittenClearData[293:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF ClearBlockWriteRequestsFIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  output CMD_ClearBlockIsIdle;
  input CMD_ClearBlockBeginSignal;
  input [29:0]CMD_BaseRenderTargetAddr;
  input [31:0]CMD_ClearColorRGBA;
  input [15:0]CMD_ClearDRAMLineCount;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_DATA" *) (* x_interface_mode = "master ClearBlockWriteRequestsFIFO" *) output [293:0]MEM_ClearBlockWriteRequestsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO FULL" *) input MEM_ClearBlockWriteRequestsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO ALMOST_FULL" *) input MEM_ClearBlockWriteRequestsFIFO_almost_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ClearBlockWriteRequestsFIFO WR_EN" *) output MEM_ClearBlockWriteRequestsFIFO_wr_en;
  output [3:0]DBG_ClearBlock_State;
  output [293:0]DBG_LastWrittenClearData;
endmodule
