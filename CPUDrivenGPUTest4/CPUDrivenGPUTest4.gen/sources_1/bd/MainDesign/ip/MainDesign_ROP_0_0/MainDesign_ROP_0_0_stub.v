// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:03:43 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ROP_0_0/MainDesign_ROP_0_0_stub.v
// Design      : MainDesign_ROP_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_ROP_0_0,ROP,{}" *) (* core_generation_info = "MainDesign_ROP_0_0,ROP,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ROP,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "ROP,Vivado 2025.2" *) 
module MainDesign_ROP_0_0(clk, MEM_ROPReadRequestsFIFO_wr_data, 
  MEM_ROPReadRequestsFIFO_full, MEM_ROPReadRequestsFIFO_wr_en, 
  MEM_ROPReadResponsesFIFO_rd_data, MEM_ROPReadResponsesFIFO_empty, 
  MEM_ROPReadResponsesFIFO_almost_empty, MEM_ROPReadResponsesFIFO_rd_en, 
  MEM_ROPWriteRequestsFIFO_wr_data, MEM_ROPWriteRequestsFIFO_full, 
  MEM_ROPWriteRequestsFIFO_wr_en, CMD_SetClearColor, CMD_ClearSignal, CMD_ClearSignalAck, 
  CMD_FlushCacheSignal, CMD_FlushCacheAck, CMD_ROPIsIdle, STATE_StateBitsAtDrawID, 
  STATE_NextDrawID, STATE_StateIsValid, STATE_ConsumeStateSlot, TEXSAMP_InFIFO_rd_data, 
  TEXSAMP_InFIFO_empty, TEXSAMP_InFIFO_almost_empty, TEXSAMP_InFIFO_rd_en, 
  STAT_CyclesIdle, STAT_CyclesSpentWorking, STAT_CyclesWaitingForOutput, 
  STAT_CyclesWaitingForMemoryRead, STAT_CountCacheHits, STAT_CountCacheMisses, 
  STAT_CurrentDrawEventID, STAT_CountPixelsPassed, DBG_ROP_State, DBG_CurrentPixelAddr, 
  DBG_CurrentBlendedColor, DBG_PreviousFramebufferColor, 
  DBG_CurrentCacheLineDirtyFlags, DBG_TempSelectedOutputRGB, DBG_TempSelectedOutputA, 
  DBG_TempBlendedOutputRGB, DBG_TempBlendedOutputA, DBG_ReadRequestFIFOFull)
/* synthesis syn_black_box black_box_pad_pin="MEM_ROPReadRequestsFIFO_wr_data[29:0],MEM_ROPReadRequestsFIFO_full,MEM_ROPReadRequestsFIFO_wr_en,MEM_ROPReadResponsesFIFO_rd_data[255:0],MEM_ROPReadResponsesFIFO_empty,MEM_ROPReadResponsesFIFO_almost_empty,MEM_ROPReadResponsesFIFO_rd_en,MEM_ROPWriteRequestsFIFO_wr_data[293:0],MEM_ROPWriteRequestsFIFO_full,MEM_ROPWriteRequestsFIFO_wr_en,CMD_SetClearColor[31:0],CMD_ClearSignal,CMD_ClearSignalAck,CMD_FlushCacheSignal,CMD_FlushCacheAck,CMD_ROPIsIdle,STATE_StateBitsAtDrawID[100:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,TEXSAMP_InFIFO_rd_data[63:0],TEXSAMP_InFIFO_empty,TEXSAMP_InFIFO_almost_empty,TEXSAMP_InFIFO_rd_en,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CyclesWaitingForMemoryRead[31:0],STAT_CountCacheHits[31:0],STAT_CountCacheMisses[31:0],STAT_CurrentDrawEventID[15:0],STAT_CountPixelsPassed[31:0],DBG_ROP_State[4:0],DBG_CurrentPixelAddr[29:0],DBG_CurrentBlendedColor[31:0],DBG_PreviousFramebufferColor[31:0],DBG_CurrentCacheLineDirtyFlags[7:0],DBG_TempSelectedOutputRGB[47:0],DBG_TempSelectedOutputA[15:0],DBG_TempBlendedOutputRGB[95:0],DBG_TempBlendedOutputA[31:0],DBG_ReadRequestFIFOFull" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF ROPReadRequestsFIFO:ROPReadResponses:ROPWriteRequestsFIFO:TEXSAMP_IN_FIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO WR_DATA" *) (* x_interface_mode = "master ROPReadRequestsFIFO" *) output [29:0]MEM_ROPReadRequestsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO FULL" *) input MEM_ROPReadRequestsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROPReadRequestsFIFO WR_EN" *) output MEM_ROPReadRequestsFIFO_wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPReadResponses RD_DATA" *) (* x_interface_mode = "master ROPReadResponses" *) input [255:0]MEM_ROPReadResponsesFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPReadResponses EMPTY" *) input MEM_ROPReadResponsesFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPReadResponses ALMOST_EMPTY" *) input MEM_ROPReadResponsesFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 ROPReadResponses RD_EN" *) output MEM_ROPReadResponsesFIFO_rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO WR_DATA" *) (* x_interface_mode = "master ROPWriteRequestsFIFO" *) output [293:0]MEM_ROPWriteRequestsFIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO FULL" *) input MEM_ROPWriteRequestsFIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 ROPWriteRequestsFIFO WR_EN" *) output MEM_ROPWriteRequestsFIFO_wr_en;
  input [31:0]CMD_SetClearColor;
  input CMD_ClearSignal;
  output CMD_ClearSignalAck;
  input CMD_FlushCacheSignal;
  output CMD_FlushCacheAck;
  output CMD_ROPIsIdle;
  input [100:0]STATE_StateBitsAtDrawID;
  input [15:0]STATE_NextDrawID;
  input STATE_StateIsValid;
  output STATE_ConsumeStateSlot;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO RD_DATA" *) (* x_interface_mode = "master TEXSAMP_IN_FIFO" *) input [63:0]TEXSAMP_InFIFO_rd_data;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO EMPTY" *) input TEXSAMP_InFIFO_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO ALMOST_EMPTY" *) input TEXSAMP_InFIFO_almost_empty;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 TEXSAMP_IN_FIFO RD_EN" *) output TEXSAMP_InFIFO_rd_en;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [31:0]STAT_CyclesWaitingForMemoryRead;
  output [31:0]STAT_CountCacheHits;
  output [31:0]STAT_CountCacheMisses;
  output [15:0]STAT_CurrentDrawEventID;
  output [31:0]STAT_CountPixelsPassed;
  output [4:0]DBG_ROP_State;
  output [29:0]DBG_CurrentPixelAddr;
  output [31:0]DBG_CurrentBlendedColor;
  output [31:0]DBG_PreviousFramebufferColor;
  output [7:0]DBG_CurrentCacheLineDirtyFlags;
  output [47:0]DBG_TempSelectedOutputRGB;
  output [15:0]DBG_TempSelectedOutputA;
  output [95:0]DBG_TempBlendedOutputRGB;
  output [31:0]DBG_TempBlendedOutputA;
  output DBG_ReadRequestFIFOFull;
endmodule
