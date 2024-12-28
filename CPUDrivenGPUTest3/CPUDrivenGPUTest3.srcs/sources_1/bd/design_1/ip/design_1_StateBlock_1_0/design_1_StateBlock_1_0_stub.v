// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:56:15 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_StateBlock_1_0/design_1_StateBlock_1_0_stub.v
// Design      : design_1_StateBlock_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "StateBlock,Vivado 2018.1_AR73068" *)
module design_1_StateBlock_1_0(clk, CMD_SetNewState, CMD_EndFrameReset, 
  CMD_NumFreeSlots, CMD_NewStateBits, CMD_NewStateDrawEventID, STAGE_StateBitsAtDrawID, 
  STAGE_NextDrawID, STAGE_StateIsValid, STAGE_ConsumeStateSlot, DBG_SlotsValid, 
  DBG_CurrentReadSlotIndex, DBG_CurrentWriteSlotIndex, DBG_Slot0, DBG_Slot1, DBG_Slot2, 
  DBG_Slot3)
/* synthesis syn_black_box black_box_pad_pin="clk,CMD_SetNewState,CMD_EndFrameReset,CMD_NumFreeSlots[2:0],CMD_NewStateBits[6:0],CMD_NewStateDrawEventID[15:0],STAGE_StateBitsAtDrawID[6:0],STAGE_NextDrawID[15:0],STAGE_StateIsValid,STAGE_ConsumeStateSlot,DBG_SlotsValid[3:0],DBG_CurrentReadSlotIndex[1:0],DBG_CurrentWriteSlotIndex[1:0],DBG_Slot0[15:0],DBG_Slot1[15:0],DBG_Slot2[15:0],DBG_Slot3[15:0]" */;
  input clk;
  input CMD_SetNewState;
  input CMD_EndFrameReset;
  output [2:0]CMD_NumFreeSlots;
  input [6:0]CMD_NewStateBits;
  input [15:0]CMD_NewStateDrawEventID;
  output [6:0]STAGE_StateBitsAtDrawID;
  output [15:0]STAGE_NextDrawID;
  output STAGE_StateIsValid;
  input STAGE_ConsumeStateSlot;
  output [3:0]DBG_SlotsValid;
  output [1:0]DBG_CurrentReadSlotIndex;
  output [1:0]DBG_CurrentWriteSlotIndex;
  output [15:0]DBG_Slot0;
  output [15:0]DBG_Slot1;
  output [15:0]DBG_Slot2;
  output [15:0]DBG_Slot3;
endmodule
