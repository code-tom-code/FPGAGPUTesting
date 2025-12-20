// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:20:57 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_VertexBatchBuilder_0_0/MainDesign_VertexBatchBuilder_0_0_stub.v
// Design      : MainDesign_VertexBatchBuilder_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_VertexBatchBuilder_0_0,VertexBatchBuilder,{}" *) (* core_generation_info = "MainDesign_VertexBatchBuilder_0_0,VertexBatchBuilder,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=VertexBatchBuilder,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "VertexBatchBuilder,Vivado 2025.2" *) 
module MainDesign_VertexBatchBuilder_0_0(clk, CMD_SendCommand, CMD_CommandArg0, 
  CMD_CommandArg1, CMD_CommandArg2, CMD_NewDrawEventID, CMD_ReadyState, IBC_ReadEnable, 
  IBC_ReadAddr, IBC_ReadData, IBC_ReadReady, IBC_InvalidateIndexCache, SHADER_Done, 
  STATE_StateBitsAtDrawID, STATE_NextDrawID, STATE_StateIsValid, STATE_ConsumeStateSlot, 
  VERTBATCH_FIFO_full, VERTBATCH_FIFO_wr_data, VERTBATCH_FIFO_wr_en, STAT_CyclesIdle, 
  STAT_CyclesSpentWorking, STAT_CyclesWaitingForOutput, STAT_CurrentDrawEventID, 
  DBG_UseConstantOutput, DBG_CurrentState, DBG_CurrentBatchLength, 
  DBG_CurrentIndexBatchLength, DBG_CurrentBatchRemainingPrims, DBG_QueueIsFull, 
  DBG_QueueIsEmpty, DBG_DoneGeneratingIndices, DBG_IndexGeneratorRemainingPrims, 
  DBG_LastPolygonIndices)
/* synthesis syn_black_box black_box_pad_pin="CMD_SendCommand[1:0],CMD_CommandArg0[23:0],CMD_CommandArg1[19:0],CMD_CommandArg2[15:0],CMD_NewDrawEventID[15:0],CMD_ReadyState,IBC_ReadEnable,IBC_ReadAddr[29:0],IBC_ReadData[31:0],IBC_ReadReady,IBC_InvalidateIndexCache,SHADER_Done,STATE_StateBitsAtDrawID[34:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,VERTBATCH_FIFO_full,VERTBATCH_FIFO_wr_data[543:0],VERTBATCH_FIFO_wr_en,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_UseConstantOutput,DBG_CurrentState[3:0],DBG_CurrentBatchLength[4:0],DBG_CurrentIndexBatchLength[6:0],DBG_CurrentBatchRemainingPrims[23:0],DBG_QueueIsFull,DBG_QueueIsEmpty,DBG_DoneGeneratingIndices,DBG_IndexGeneratorRemainingPrims[23:0],DBG_LastPolygonIndices[47:0]" */
/* synthesis syn_force_seq_prim="clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF VertexBatchFIFO, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk /* synthesis syn_isclock = 1 */;
  input [1:0]CMD_SendCommand;
  input [23:0]CMD_CommandArg0;
  input [19:0]CMD_CommandArg1;
  input [15:0]CMD_CommandArg2;
  input [15:0]CMD_NewDrawEventID;
  output CMD_ReadyState;
  output IBC_ReadEnable;
  output [29:0]IBC_ReadAddr;
  input [31:0]IBC_ReadData;
  input IBC_ReadReady;
  output IBC_InvalidateIndexCache;
  output SHADER_Done;
  input [34:0]STATE_StateBitsAtDrawID;
  input [15:0]STATE_NextDrawID;
  input STATE_StateIsValid;
  output STATE_ConsumeStateSlot;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO FULL" *) (* x_interface_mode = "master VertexBatchFIFO" *) input VERTBATCH_FIFO_full;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO WR_DATA" *) output [543:0]VERTBATCH_FIFO_wr_data;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 VertexBatchFIFO WR_EN" *) output VERTBATCH_FIFO_wr_en;
  output [31:0]STAT_CyclesIdle;
  output [31:0]STAT_CyclesSpentWorking;
  output [31:0]STAT_CyclesWaitingForOutput;
  output [15:0]STAT_CurrentDrawEventID;
  input DBG_UseConstantOutput;
  output [3:0]DBG_CurrentState;
  output [4:0]DBG_CurrentBatchLength;
  output [6:0]DBG_CurrentIndexBatchLength;
  output [23:0]DBG_CurrentBatchRemainingPrims;
  output DBG_QueueIsFull;
  output DBG_QueueIsEmpty;
  output DBG_DoneGeneratingIndices;
  output [23:0]DBG_IndexGeneratorRemainingPrims;
  output [47:0]DBG_LastPolygonIndices;
endmodule
