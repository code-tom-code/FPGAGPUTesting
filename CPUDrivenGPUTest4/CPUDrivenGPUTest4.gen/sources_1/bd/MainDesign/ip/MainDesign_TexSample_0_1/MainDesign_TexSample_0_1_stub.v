// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:59:48 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_TexSample_0_1/MainDesign_TexSample_0_1_stub.v
// Design      : MainDesign_TexSample_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_TexSample_0_1,TexSample,{}" *) (* core_generation_info = "MainDesign_TexSample_0_1,TexSample,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=TexSample,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "TexSample,Vivado 2025.2" *) 
module MainDesign_TexSample_0_1(clk, INTERP_InFIFO_rd_data, 
  INTERP_InFIFO_empty, INTERP_InFIFO_almost_empty, INTERP_InFIFO_rd_en, 
  MEM_TexSampReadRequestsFIFO_wr_data, MEM_TexSampReadRequestsFIFO_full, 
  MEM_TexSampReadRequestsFIFO_wr_en, MEM_TexSampReadResponsesFIFO_rd_data, 
  MEM_TexSampReadResponsesFIFO_empty, MEM_TexSampReadResponsesFIFO_almost_empty, 
  MEM_TexSampReadResponsesFIFO_rd_en, STATE_StateBitsAtDrawID, STATE_NextDrawID, 
  STATE_StateIsValid, STATE_ConsumeStateSlot, TexCache_addra, TexCache_dina, 
  TexCache_douta, TexCache_ena, TexCache_clk, TexCache_wea, CMD_TexSampleIsIdle, 
  ROP_OutFIFO_wr_data, ROP_OutFIFO_full, ROP_OutFIFO_wr_en, STAT_CyclesIdle, 
  STAT_CyclesSpentWorking, STAT_CyclesWaitingForOutput, STAT_CyclesWaitingCacheLoad, 
  STAT_CurrentDrawEventID, DBG_TexSample_State, DBG_TexCache_douta, DBG_TexCache_dina, 
  DBG_TexCache_addra, DBG_texCacheReadTexelsCount, DBG_Message, DBG_MessageData, 
  DBG_NewMessage)
/* synthesis syn_black_box black_box_pad_pin="INTERP_InFIFO_rd_data[95:0],INTERP_InFIFO_empty,INTERP_InFIFO_almost_empty,INTERP_InFIFO_rd_en,MEM_TexSampReadRequestsFIFO_wr_data[29:0],MEM_TexSampReadRequestsFIFO_full,MEM_TexSampReadRequestsFIFO_wr_en,MEM_TexSampReadResponsesFIFO_rd_data[255:0],MEM_TexSampReadResponsesFIFO_empty,MEM_TexSampReadResponsesFIFO_almost_empty,MEM_TexSampReadResponsesFIFO_rd_en,STATE_StateBitsAtDrawID[73:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,TexCache_addra[13:0],TexCache_dina[31:0],TexCache_douta[31:0],TexCache_ena,TexCache_wea[0:0],CMD_TexSampleIsIdle,ROP_OutFIFO_wr_data[63:0],ROP_OutFIFO_full,ROP_OutFIFO_wr_en,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CyclesWaitingCacheLoad[31:0],STAT_CurrentDrawEventID[15:0],DBG_TexSample_State[5:0],DBG_TexCache_douta[31:0],DBG_TexCache_dina[31:0],DBG_TexCache_addra[13:0],DBG_texCacheReadTexelsCount[15:0],DBG_Message[15:0],DBG_MessageData[15:0],DBG_NewMessage" */
/* synthesis syn_force_seq_prim="clk" */
/* synthesis syn_force_seq_prim="TexCache_clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF TexSampReadRequestsFIFO:TexSampReadResponses:INTERP_IN_FIFO:ROP_OUT_FIFO:TexCache, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO RD_DATA" *) (* x_interface_mode = "master INTERP_IN_FIFO" *) input [95:0]INTERP_InFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO EMPTY" *) input INTERP_InFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO ALMOST_EMPTY" *) input INTERP_InFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 INTERP_IN_FIFO RD_EN" *) output INTERP_InFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO WR_DATA" *) (* x_interface_mode = "master TexSampReadRequestsFIFO" *) output [29:0]MEM_TexSampReadRequestsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO FULL" *) input MEM_TexSampReadRequestsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 TexSampReadRequestsFIFO WR_EN" *) output MEM_TexSampReadRequestsFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses RD_DATA" *) (* x_interface_mode = "master TexSampReadResponses" *) input [255:0]MEM_TexSampReadResponsesFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses EMPTY" *) input MEM_TexSampReadResponsesFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses ALMOST_EMPTY" *) input MEM_TexSampReadResponsesFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TexSampReadResponses RD_EN" *) output MEM_TexSampReadResponsesFIFO_rd_en;
  input [73:0]STATE_StateBitsAtDrawID;
  input [15:0]STATE_NextDrawID;
  input STATE_StateIsValid;
  output STATE_ConsumeStateSlot;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 TexCache ADDR" *) (* x_interface_mode = "master TexCache" *) (* x_interface_parameter = "XIL_INTERFACENAME TexCache, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output [13:0]TexCache_addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 TexCache DIN" *) output [31:0]TexCache_dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 TexCache DOUT" *) (* x_interface_mode = "master" *) input [31:0]TexCache_douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 TexCache EN" *) output TexCache_ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 TexCache CLK" *) output TexCache_clk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 TexCache WE" *) output [0:0]TexCache_wea;
  output CMD_TexSampleIsIdle;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO WR_DATA" *) (* x_interface_mode = "master ROP_OUT_FIFO" *) output [63:0]ROP_OutFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO FULL" *) input ROP_OutFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROP_OUT_FIFO WR_EN" *) output ROP_OutFIFO_wr_en;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [31:0]STAT_CyclesWaitingCacheLoad;
  output [15:0]STAT_CurrentDrawEventID;
  output [5:0]DBG_TexSample_State;
  output [31:0]DBG_TexCache_douta;
  output [31:0]DBG_TexCache_dina;
  output [13:0]DBG_TexCache_addra;
  output [15:0]DBG_texCacheReadTexelsCount;
  output [15:0]DBG_Message;
  output [15:0]DBG_MessageData;
  output DBG_NewMessage;
endmodule
