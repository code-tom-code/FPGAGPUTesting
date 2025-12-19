// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sat Apr 26 19:24:52 2025
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_VertexBatchBuilder_0_0/design_1_VertexBatchBuilder_0_0_stub.v
// Design      : design_1_VertexBatchBuilder_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "VertexBatchBuilder,Vivado 2018.1_AR73068" *)
module design_1_VertexBatchBuilder_0_0(clk, CMD_SendCommand, CMD_CommandArg0, 
  CMD_CommandArg1, CMD_CommandArg2, CMD_NewDrawEventID, CMD_ReadyState, IBC_ReadEnable, 
  IBC_ReadAddr, IBC_ReadData, IBC_ReadReady, IBC_InvalidateIndexCache, SHADER_Done, 
  STATE_StateBitsAtDrawID, STATE_NextDrawID, STATE_StateIsValid, STATE_ConsumeStateSlot, 
  VERTBATCH_FIFO_full, VERTBATCH_FIFO_wr_data, VERTBATCH_FIFO_wr_en, STAT_CyclesIdle, 
  STAT_CyclesSpentWorking, STAT_CyclesWaitingForOutput, STAT_CurrentDrawEventID, 
  DBG_UseConstantOutput, DBG_CurrentState, DBG_CurrentBatchLength, 
  DBG_CurrentIndexBatchLength, DBG_CurrentBatchRemainingPrims, DBG_QueueIsFull, 
  DBG_QueueIsEmpty, DBG_DoneGeneratingIndices, DBG_IndexGeneratorRemainingPrims, 
  DBG_LastPolygonIndices)
/* synthesis syn_black_box black_box_pad_pin="clk,CMD_SendCommand[1:0],CMD_CommandArg0[23:0],CMD_CommandArg1[19:0],CMD_CommandArg2[15:0],CMD_NewDrawEventID[15:0],CMD_ReadyState,IBC_ReadEnable,IBC_ReadAddr[29:0],IBC_ReadData[31:0],IBC_ReadReady,IBC_InvalidateIndexCache,SHADER_Done,STATE_StateBitsAtDrawID[34:0],STATE_NextDrawID[15:0],STATE_StateIsValid,STATE_ConsumeStateSlot,VERTBATCH_FIFO_full,VERTBATCH_FIFO_wr_data[543:0],VERTBATCH_FIFO_wr_en,STAT_CyclesIdle[31:0],STAT_CyclesSpentWorking[31:0],STAT_CyclesWaitingForOutput[31:0],STAT_CurrentDrawEventID[15:0],DBG_UseConstantOutput,DBG_CurrentState[3:0],DBG_CurrentBatchLength[4:0],DBG_CurrentIndexBatchLength[6:0],DBG_CurrentBatchRemainingPrims[23:0],DBG_QueueIsFull,DBG_QueueIsEmpty,DBG_DoneGeneratingIndices,DBG_IndexGeneratorRemainingPrims[23:0],DBG_LastPolygonIndices[47:0]" */;
  input clk;
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
  input VERTBATCH_FIFO_full;
  output [543:0]VERTBATCH_FIFO_wr_data;
  output VERTBATCH_FIFO_wr_en;
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
