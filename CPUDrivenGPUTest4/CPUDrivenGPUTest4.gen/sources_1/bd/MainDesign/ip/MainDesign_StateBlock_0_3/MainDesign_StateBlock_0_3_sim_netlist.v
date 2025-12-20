// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:49:41 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StateBlock_0_3/MainDesign_StateBlock_0_3_sim_netlist.v
// Design      : MainDesign_StateBlock_0_3
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_StateBlock_0_3,StateBlock,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "StateBlock,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_StateBlock_0_3
   (clk,
    CMD_SetNewState,
    CMD_EndFrameReset,
    CMD_NumFreeSlots,
    CMD_NewStateBits,
    CMD_NewStateDrawEventID,
    STAGE_StateBitsAtDrawID,
    STAGE_NextDrawID,
    STAGE_StateIsValid,
    STAGE_ConsumeStateSlot,
    DBG_SlotsValid,
    DBG_CurrentReadSlotIndex,
    DBG_CurrentWriteSlotIndex,
    DBG_Slot0,
    DBG_Slot1,
    DBG_Slot2,
    DBG_Slot3);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  input CMD_SetNewState;
  input CMD_EndFrameReset;
  output [2:0]CMD_NumFreeSlots;
  input [191:0]CMD_NewStateBits;
  input [15:0]CMD_NewStateDrawEventID;
  output [191:0]STAGE_StateBitsAtDrawID;
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

  wire CMD_EndFrameReset;
  wire [191:0]CMD_NewStateBits;
  wire [15:0]CMD_NewStateDrawEventID;
  wire [2:0]CMD_NumFreeSlots;
  wire CMD_SetNewState;
  wire [1:0]DBG_CurrentReadSlotIndex;
  wire [1:0]DBG_CurrentWriteSlotIndex;
  wire [15:0]DBG_Slot0;
  wire [15:0]DBG_Slot1;
  wire [15:0]DBG_Slot2;
  wire [15:0]DBG_Slot3;
  wire [3:0]DBG_SlotsValid;
  wire STAGE_ConsumeStateSlot;
  wire [15:0]STAGE_NextDrawID;
  wire [191:0]STAGE_StateBitsAtDrawID;
  wire STAGE_StateIsValid;
  wire clk;

  MainDesign_StateBlock_0_3_StateBlock U0
       (.CMD_EndFrameReset(CMD_EndFrameReset),
        .CMD_NewStateBits(CMD_NewStateBits),
        .CMD_NewStateDrawEventID(CMD_NewStateDrawEventID),
        .CMD_NumFreeSlots(CMD_NumFreeSlots),
        .CMD_SetNewState(CMD_SetNewState),
        .DBG_CurrentReadSlotIndex(DBG_CurrentReadSlotIndex[0]),
        .DBG_Slot0(DBG_Slot0),
        .DBG_Slot1(DBG_Slot1),
        .DBG_Slot2(DBG_Slot2),
        .DBG_Slot3(DBG_Slot3),
        .Q(DBG_CurrentWriteSlotIndex),
        .STAGE_ConsumeStateSlot(STAGE_ConsumeStateSlot),
        .STAGE_NextDrawID(STAGE_NextDrawID),
        .STAGE_StateBitsAtDrawID(STAGE_StateBitsAtDrawID),
        .STAGE_StateIsValid(STAGE_StateIsValid),
        .clk(clk),
        .\currentReadSlot_reg[1]_0 (DBG_CurrentReadSlotIndex[1]),
        .\slotsData_reg[0][SlotIsValid]_0 (DBG_SlotsValid[0]),
        .\slotsData_reg[1][SlotIsValid]_0 (DBG_SlotsValid[1]),
        .\slotsData_reg[2][SlotIsValid]_0 (DBG_SlotsValid[2]),
        .\slotsData_reg[3][SlotIsValid]_0 (DBG_SlotsValid[3]));
endmodule

(* ORIG_REF_NAME = "StateBlock" *) 
module MainDesign_StateBlock_0_3_StateBlock
   (Q,
    \currentReadSlot_reg[1]_0 ,
    DBG_CurrentReadSlotIndex,
    \slotsData_reg[0][SlotIsValid]_0 ,
    \slotsData_reg[1][SlotIsValid]_0 ,
    \slotsData_reg[2][SlotIsValid]_0 ,
    \slotsData_reg[3][SlotIsValid]_0 ,
    DBG_Slot3,
    DBG_Slot2,
    DBG_Slot1,
    DBG_Slot0,
    CMD_NumFreeSlots,
    STAGE_StateBitsAtDrawID,
    STAGE_NextDrawID,
    STAGE_StateIsValid,
    CMD_EndFrameReset,
    CMD_SetNewState,
    clk,
    STAGE_ConsumeStateSlot,
    CMD_NewStateBits,
    CMD_NewStateDrawEventID);
  output [1:0]Q;
  output [0:0]\currentReadSlot_reg[1]_0 ;
  output [0:0]DBG_CurrentReadSlotIndex;
  output \slotsData_reg[0][SlotIsValid]_0 ;
  output \slotsData_reg[1][SlotIsValid]_0 ;
  output \slotsData_reg[2][SlotIsValid]_0 ;
  output \slotsData_reg[3][SlotIsValid]_0 ;
  output [15:0]DBG_Slot3;
  output [15:0]DBG_Slot2;
  output [15:0]DBG_Slot1;
  output [15:0]DBG_Slot0;
  output [2:0]CMD_NumFreeSlots;
  output [191:0]STAGE_StateBitsAtDrawID;
  output [15:0]STAGE_NextDrawID;
  output STAGE_StateIsValid;
  input CMD_EndFrameReset;
  input CMD_SetNewState;
  input clk;
  input STAGE_ConsumeStateSlot;
  input [191:0]CMD_NewStateBits;
  input [15:0]CMD_NewStateDrawEventID;

  wire CMD_EndFrameReset;
  wire [191:0]CMD_NewStateBits;
  wire [15:0]CMD_NewStateDrawEventID;
  wire [2:0]CMD_NumFreeSlots;
  wire CMD_SetNewState;
  wire [0:0]DBG_CurrentReadSlotIndex;
  wire [15:0]DBG_Slot0;
  wire [15:0]DBG_Slot1;
  wire [15:0]DBG_Slot2;
  wire [15:0]DBG_Slot3;
  wire [1:0]Q;
  wire STAGE_ConsumeStateSlot;
  wire [15:0]STAGE_NextDrawID;
  wire [191:0]STAGE_StateBitsAtDrawID;
  wire STAGE_StateIsValid;
  wire clk;
  wire \currentReadSlot[0]_i_1_n_0 ;
  wire \currentReadSlot[0]_rep_i_1_n_0 ;
  wire \currentReadSlot[1]_i_1_n_0 ;
  wire \currentReadSlot[1]_rep_i_1_n_0 ;
  wire [0:0]\currentReadSlot_reg[1]_0 ;
  wire \currentReadSlot_reg[1]_rep_n_0 ;
  wire \currentReadSlot_reg_n_0_[0] ;
  wire [1:0]plusOp;
  wire \slotsData[0][SlotDrawEventID][0]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][10]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][11]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][12]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][13]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][14]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][15]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][15]_i_2_n_0 ;
  wire \slotsData[0][SlotDrawEventID][1]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][2]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][3]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][4]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][5]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][6]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][7]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][8]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][9]_i_1_n_0 ;
  wire \slotsData[0][SlotIsValid]1_out ;
  wire \slotsData[0][SlotIsValid]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][0]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][10]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][11]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][12]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][13]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][14]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][15]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][15]_i_2_n_0 ;
  wire \slotsData[1][SlotDrawEventID][1]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][2]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][3]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][4]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][5]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][6]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][7]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][8]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][9]_i_1_n_0 ;
  wire \slotsData[1][SlotIsValid]3_out ;
  wire \slotsData[1][SlotIsValid]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][0]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][10]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][11]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][12]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][13]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][14]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][15]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][15]_i_2_n_0 ;
  wire \slotsData[2][SlotDrawEventID][1]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][2]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][3]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][4]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][5]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][6]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][7]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][8]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][9]_i_1_n_0 ;
  wire \slotsData[2][SlotIsValid]5_out ;
  wire \slotsData[2][SlotIsValid]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][0]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][10]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][11]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][12]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][13]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][14]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][15]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][15]_i_2_n_0 ;
  wire \slotsData[3][SlotDrawEventID][1]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][2]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][3]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][4]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][5]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][6]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][7]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][8]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][9]_i_1_n_0 ;
  wire \slotsData[3][SlotIsValid]7_out ;
  wire \slotsData[3][SlotIsValid]_i_1_n_0 ;
  wire [191:0]\slotsData_reg[0][SlotData] ;
  wire \slotsData_reg[0][SlotIsValid]_0 ;
  wire [191:0]\slotsData_reg[1][SlotData] ;
  wire \slotsData_reg[1][SlotIsValid]_0 ;
  wire [191:0]\slotsData_reg[2][SlotData] ;
  wire \slotsData_reg[2][SlotIsValid]_0 ;
  wire [191:0]\slotsData_reg[3][SlotData] ;
  wire \slotsData_reg[3][SlotIsValid]_0 ;

  LUT4 #(
    .INIT(16'h6996)) 
    \CMD_NumFreeSlots[0]_INST_0 
       (.I0(\slotsData_reg[0][SlotIsValid]_0 ),
        .I1(\slotsData_reg[3][SlotIsValid]_0 ),
        .I2(\slotsData_reg[2][SlotIsValid]_0 ),
        .I3(\slotsData_reg[1][SlotIsValid]_0 ),
        .O(CMD_NumFreeSlots[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h177E)) 
    \CMD_NumFreeSlots[1]_INST_0 
       (.I0(\slotsData_reg[0][SlotIsValid]_0 ),
        .I1(\slotsData_reg[3][SlotIsValid]_0 ),
        .I2(\slotsData_reg[2][SlotIsValid]_0 ),
        .I3(\slotsData_reg[1][SlotIsValid]_0 ),
        .O(CMD_NumFreeSlots[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \CMD_NumFreeSlots[2]_INST_0 
       (.I0(\slotsData_reg[3][SlotIsValid]_0 ),
        .I1(\slotsData_reg[1][SlotIsValid]_0 ),
        .I2(\slotsData_reg[2][SlotIsValid]_0 ),
        .I3(\slotsData_reg[0][SlotIsValid]_0 ),
        .O(CMD_NumFreeSlots[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[0]_INST_0 
       (.I0(DBG_Slot3[0]),
        .I1(DBG_Slot2[0]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[0]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[0]),
        .O(STAGE_NextDrawID[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[10]_INST_0 
       (.I0(DBG_Slot3[10]),
        .I1(DBG_Slot2[10]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[10]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[10]),
        .O(STAGE_NextDrawID[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[11]_INST_0 
       (.I0(DBG_Slot3[11]),
        .I1(DBG_Slot2[11]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[11]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[11]),
        .O(STAGE_NextDrawID[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[12]_INST_0 
       (.I0(DBG_Slot3[12]),
        .I1(DBG_Slot2[12]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[12]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[12]),
        .O(STAGE_NextDrawID[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[13]_INST_0 
       (.I0(DBG_Slot3[13]),
        .I1(DBG_Slot2[13]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[13]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[13]),
        .O(STAGE_NextDrawID[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[14]_INST_0 
       (.I0(DBG_Slot3[14]),
        .I1(DBG_Slot2[14]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[14]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[14]),
        .O(STAGE_NextDrawID[14]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[15]_INST_0 
       (.I0(DBG_Slot3[15]),
        .I1(DBG_Slot2[15]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[15]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[15]),
        .O(STAGE_NextDrawID[15]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[1]_INST_0 
       (.I0(DBG_Slot3[1]),
        .I1(DBG_Slot2[1]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[1]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[1]),
        .O(STAGE_NextDrawID[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[2]_INST_0 
       (.I0(DBG_Slot3[2]),
        .I1(DBG_Slot2[2]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[2]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[2]),
        .O(STAGE_NextDrawID[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[3]_INST_0 
       (.I0(DBG_Slot3[3]),
        .I1(DBG_Slot2[3]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[3]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[3]),
        .O(STAGE_NextDrawID[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[4]_INST_0 
       (.I0(DBG_Slot3[4]),
        .I1(DBG_Slot2[4]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[4]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[4]),
        .O(STAGE_NextDrawID[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[5]_INST_0 
       (.I0(DBG_Slot3[5]),
        .I1(DBG_Slot2[5]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[5]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[5]),
        .O(STAGE_NextDrawID[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[6]_INST_0 
       (.I0(DBG_Slot3[6]),
        .I1(DBG_Slot2[6]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[6]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[6]),
        .O(STAGE_NextDrawID[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[7]_INST_0 
       (.I0(DBG_Slot3[7]),
        .I1(DBG_Slot2[7]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[7]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[7]),
        .O(STAGE_NextDrawID[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[8]_INST_0 
       (.I0(DBG_Slot3[8]),
        .I1(DBG_Slot2[8]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[8]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[8]),
        .O(STAGE_NextDrawID[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_NextDrawID[9]_INST_0 
       (.I0(DBG_Slot3[9]),
        .I1(DBG_Slot2[9]),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(DBG_Slot1[9]),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(DBG_Slot0[9]),
        .O(STAGE_NextDrawID[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[0]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [0]),
        .I1(\slotsData_reg[2][SlotData] [0]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [0]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [0]),
        .O(STAGE_StateBitsAtDrawID[0]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[100]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [100]),
        .I1(\slotsData_reg[2][SlotData] [100]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [100]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [100]),
        .O(STAGE_StateBitsAtDrawID[100]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[101]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [101]),
        .I1(\slotsData_reg[2][SlotData] [101]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [101]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [101]),
        .O(STAGE_StateBitsAtDrawID[101]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[102]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [102]),
        .I1(\slotsData_reg[2][SlotData] [102]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [102]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [102]),
        .O(STAGE_StateBitsAtDrawID[102]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[103]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [103]),
        .I1(\slotsData_reg[2][SlotData] [103]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [103]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [103]),
        .O(STAGE_StateBitsAtDrawID[103]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[104]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [104]),
        .I1(\slotsData_reg[2][SlotData] [104]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [104]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [104]),
        .O(STAGE_StateBitsAtDrawID[104]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[105]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [105]),
        .I1(\slotsData_reg[2][SlotData] [105]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [105]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [105]),
        .O(STAGE_StateBitsAtDrawID[105]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[106]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [106]),
        .I1(\slotsData_reg[2][SlotData] [106]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [106]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [106]),
        .O(STAGE_StateBitsAtDrawID[106]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[107]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [107]),
        .I1(\slotsData_reg[2][SlotData] [107]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [107]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [107]),
        .O(STAGE_StateBitsAtDrawID[107]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[108]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [108]),
        .I1(\slotsData_reg[2][SlotData] [108]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [108]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [108]),
        .O(STAGE_StateBitsAtDrawID[108]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[109]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [109]),
        .I1(\slotsData_reg[2][SlotData] [109]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [109]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [109]),
        .O(STAGE_StateBitsAtDrawID[109]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[10]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [10]),
        .I1(\slotsData_reg[2][SlotData] [10]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [10]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [10]),
        .O(STAGE_StateBitsAtDrawID[10]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[110]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [110]),
        .I1(\slotsData_reg[2][SlotData] [110]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [110]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [110]),
        .O(STAGE_StateBitsAtDrawID[110]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[111]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [111]),
        .I1(\slotsData_reg[2][SlotData] [111]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [111]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [111]),
        .O(STAGE_StateBitsAtDrawID[111]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[112]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [112]),
        .I1(\slotsData_reg[2][SlotData] [112]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [112]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [112]),
        .O(STAGE_StateBitsAtDrawID[112]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[113]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [113]),
        .I1(\slotsData_reg[2][SlotData] [113]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [113]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [113]),
        .O(STAGE_StateBitsAtDrawID[113]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[114]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [114]),
        .I1(\slotsData_reg[2][SlotData] [114]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [114]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [114]),
        .O(STAGE_StateBitsAtDrawID[114]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[115]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [115]),
        .I1(\slotsData_reg[2][SlotData] [115]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [115]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [115]),
        .O(STAGE_StateBitsAtDrawID[115]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[116]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [116]),
        .I1(\slotsData_reg[2][SlotData] [116]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [116]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [116]),
        .O(STAGE_StateBitsAtDrawID[116]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[117]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [117]),
        .I1(\slotsData_reg[2][SlotData] [117]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [117]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [117]),
        .O(STAGE_StateBitsAtDrawID[117]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[118]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [118]),
        .I1(\slotsData_reg[2][SlotData] [118]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [118]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [118]),
        .O(STAGE_StateBitsAtDrawID[118]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[119]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [119]),
        .I1(\slotsData_reg[2][SlotData] [119]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [119]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [119]),
        .O(STAGE_StateBitsAtDrawID[119]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[11]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [11]),
        .I1(\slotsData_reg[2][SlotData] [11]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [11]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [11]),
        .O(STAGE_StateBitsAtDrawID[11]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[120]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [120]),
        .I1(\slotsData_reg[2][SlotData] [120]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [120]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [120]),
        .O(STAGE_StateBitsAtDrawID[120]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[121]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [121]),
        .I1(\slotsData_reg[2][SlotData] [121]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [121]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [121]),
        .O(STAGE_StateBitsAtDrawID[121]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[122]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [122]),
        .I1(\slotsData_reg[2][SlotData] [122]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [122]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [122]),
        .O(STAGE_StateBitsAtDrawID[122]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[123]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [123]),
        .I1(\slotsData_reg[2][SlotData] [123]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [123]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [123]),
        .O(STAGE_StateBitsAtDrawID[123]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[124]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [124]),
        .I1(\slotsData_reg[2][SlotData] [124]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [124]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [124]),
        .O(STAGE_StateBitsAtDrawID[124]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[125]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [125]),
        .I1(\slotsData_reg[2][SlotData] [125]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [125]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [125]),
        .O(STAGE_StateBitsAtDrawID[125]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[126]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [126]),
        .I1(\slotsData_reg[2][SlotData] [126]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [126]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [126]),
        .O(STAGE_StateBitsAtDrawID[126]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[127]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [127]),
        .I1(\slotsData_reg[2][SlotData] [127]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [127]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [127]),
        .O(STAGE_StateBitsAtDrawID[127]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[128]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [128]),
        .I1(\slotsData_reg[2][SlotData] [128]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [128]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [128]),
        .O(STAGE_StateBitsAtDrawID[128]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[129]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [129]),
        .I1(\slotsData_reg[2][SlotData] [129]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [129]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [129]),
        .O(STAGE_StateBitsAtDrawID[129]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[12]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [12]),
        .I1(\slotsData_reg[2][SlotData] [12]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [12]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [12]),
        .O(STAGE_StateBitsAtDrawID[12]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[130]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [130]),
        .I1(\slotsData_reg[2][SlotData] [130]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [130]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [130]),
        .O(STAGE_StateBitsAtDrawID[130]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[131]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [131]),
        .I1(\slotsData_reg[2][SlotData] [131]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [131]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [131]),
        .O(STAGE_StateBitsAtDrawID[131]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[132]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [132]),
        .I1(\slotsData_reg[2][SlotData] [132]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [132]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [132]),
        .O(STAGE_StateBitsAtDrawID[132]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[133]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [133]),
        .I1(\slotsData_reg[2][SlotData] [133]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [133]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [133]),
        .O(STAGE_StateBitsAtDrawID[133]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[134]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [134]),
        .I1(\slotsData_reg[2][SlotData] [134]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [134]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [134]),
        .O(STAGE_StateBitsAtDrawID[134]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[135]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [135]),
        .I1(\slotsData_reg[2][SlotData] [135]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [135]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [135]),
        .O(STAGE_StateBitsAtDrawID[135]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[136]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [136]),
        .I1(\slotsData_reg[2][SlotData] [136]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [136]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [136]),
        .O(STAGE_StateBitsAtDrawID[136]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[137]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [137]),
        .I1(\slotsData_reg[2][SlotData] [137]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [137]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [137]),
        .O(STAGE_StateBitsAtDrawID[137]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[138]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [138]),
        .I1(\slotsData_reg[2][SlotData] [138]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [138]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [138]),
        .O(STAGE_StateBitsAtDrawID[138]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[139]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [139]),
        .I1(\slotsData_reg[2][SlotData] [139]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [139]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [139]),
        .O(STAGE_StateBitsAtDrawID[139]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[13]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [13]),
        .I1(\slotsData_reg[2][SlotData] [13]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [13]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [13]),
        .O(STAGE_StateBitsAtDrawID[13]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[140]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [140]),
        .I1(\slotsData_reg[2][SlotData] [140]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [140]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [140]),
        .O(STAGE_StateBitsAtDrawID[140]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[141]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [141]),
        .I1(\slotsData_reg[2][SlotData] [141]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [141]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [141]),
        .O(STAGE_StateBitsAtDrawID[141]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[142]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [142]),
        .I1(\slotsData_reg[2][SlotData] [142]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [142]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [142]),
        .O(STAGE_StateBitsAtDrawID[142]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[143]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [143]),
        .I1(\slotsData_reg[2][SlotData] [143]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [143]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [143]),
        .O(STAGE_StateBitsAtDrawID[143]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[144]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [144]),
        .I1(\slotsData_reg[2][SlotData] [144]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [144]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [144]),
        .O(STAGE_StateBitsAtDrawID[144]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[145]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [145]),
        .I1(\slotsData_reg[2][SlotData] [145]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [145]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [145]),
        .O(STAGE_StateBitsAtDrawID[145]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[146]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [146]),
        .I1(\slotsData_reg[2][SlotData] [146]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [146]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [146]),
        .O(STAGE_StateBitsAtDrawID[146]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[147]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [147]),
        .I1(\slotsData_reg[2][SlotData] [147]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [147]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [147]),
        .O(STAGE_StateBitsAtDrawID[147]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[148]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [148]),
        .I1(\slotsData_reg[2][SlotData] [148]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [148]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [148]),
        .O(STAGE_StateBitsAtDrawID[148]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[149]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [149]),
        .I1(\slotsData_reg[2][SlotData] [149]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [149]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [149]),
        .O(STAGE_StateBitsAtDrawID[149]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[14]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [14]),
        .I1(\slotsData_reg[2][SlotData] [14]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [14]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [14]),
        .O(STAGE_StateBitsAtDrawID[14]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[150]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [150]),
        .I1(\slotsData_reg[2][SlotData] [150]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [150]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [150]),
        .O(STAGE_StateBitsAtDrawID[150]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[151]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [151]),
        .I1(\slotsData_reg[2][SlotData] [151]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [151]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [151]),
        .O(STAGE_StateBitsAtDrawID[151]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[152]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [152]),
        .I1(\slotsData_reg[2][SlotData] [152]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [152]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [152]),
        .O(STAGE_StateBitsAtDrawID[152]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[153]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [153]),
        .I1(\slotsData_reg[2][SlotData] [153]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [153]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [153]),
        .O(STAGE_StateBitsAtDrawID[153]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[154]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [154]),
        .I1(\slotsData_reg[2][SlotData] [154]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [154]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [154]),
        .O(STAGE_StateBitsAtDrawID[154]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[155]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [155]),
        .I1(\slotsData_reg[2][SlotData] [155]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [155]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [155]),
        .O(STAGE_StateBitsAtDrawID[155]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[156]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [156]),
        .I1(\slotsData_reg[2][SlotData] [156]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [156]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [156]),
        .O(STAGE_StateBitsAtDrawID[156]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[157]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [157]),
        .I1(\slotsData_reg[2][SlotData] [157]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [157]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [157]),
        .O(STAGE_StateBitsAtDrawID[157]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[158]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [158]),
        .I1(\slotsData_reg[2][SlotData] [158]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [158]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [158]),
        .O(STAGE_StateBitsAtDrawID[158]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[159]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [159]),
        .I1(\slotsData_reg[2][SlotData] [159]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [159]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [159]),
        .O(STAGE_StateBitsAtDrawID[159]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[15]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [15]),
        .I1(\slotsData_reg[2][SlotData] [15]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [15]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [15]),
        .O(STAGE_StateBitsAtDrawID[15]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[160]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [160]),
        .I1(\slotsData_reg[2][SlotData] [160]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [160]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [160]),
        .O(STAGE_StateBitsAtDrawID[160]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[161]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [161]),
        .I1(\slotsData_reg[2][SlotData] [161]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [161]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [161]),
        .O(STAGE_StateBitsAtDrawID[161]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[162]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [162]),
        .I1(\slotsData_reg[2][SlotData] [162]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [162]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [162]),
        .O(STAGE_StateBitsAtDrawID[162]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[163]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [163]),
        .I1(\slotsData_reg[2][SlotData] [163]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [163]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [163]),
        .O(STAGE_StateBitsAtDrawID[163]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[164]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [164]),
        .I1(\slotsData_reg[2][SlotData] [164]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [164]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [164]),
        .O(STAGE_StateBitsAtDrawID[164]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[165]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [165]),
        .I1(\slotsData_reg[2][SlotData] [165]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [165]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [165]),
        .O(STAGE_StateBitsAtDrawID[165]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[166]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [166]),
        .I1(\slotsData_reg[2][SlotData] [166]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [166]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [166]),
        .O(STAGE_StateBitsAtDrawID[166]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[167]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [167]),
        .I1(\slotsData_reg[2][SlotData] [167]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [167]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [167]),
        .O(STAGE_StateBitsAtDrawID[167]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[168]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [168]),
        .I1(\slotsData_reg[2][SlotData] [168]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [168]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [168]),
        .O(STAGE_StateBitsAtDrawID[168]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[169]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [169]),
        .I1(\slotsData_reg[2][SlotData] [169]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [169]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [169]),
        .O(STAGE_StateBitsAtDrawID[169]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[16]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [16]),
        .I1(\slotsData_reg[2][SlotData] [16]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [16]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [16]),
        .O(STAGE_StateBitsAtDrawID[16]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[170]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [170]),
        .I1(\slotsData_reg[2][SlotData] [170]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [170]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [170]),
        .O(STAGE_StateBitsAtDrawID[170]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[171]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [171]),
        .I1(\slotsData_reg[2][SlotData] [171]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [171]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [171]),
        .O(STAGE_StateBitsAtDrawID[171]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[172]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [172]),
        .I1(\slotsData_reg[2][SlotData] [172]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [172]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [172]),
        .O(STAGE_StateBitsAtDrawID[172]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[173]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [173]),
        .I1(\slotsData_reg[2][SlotData] [173]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [173]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [173]),
        .O(STAGE_StateBitsAtDrawID[173]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[174]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [174]),
        .I1(\slotsData_reg[2][SlotData] [174]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [174]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [174]),
        .O(STAGE_StateBitsAtDrawID[174]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[175]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [175]),
        .I1(\slotsData_reg[2][SlotData] [175]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [175]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [175]),
        .O(STAGE_StateBitsAtDrawID[175]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[176]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [176]),
        .I1(\slotsData_reg[2][SlotData] [176]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [176]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [176]),
        .O(STAGE_StateBitsAtDrawID[176]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[177]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [177]),
        .I1(\slotsData_reg[2][SlotData] [177]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [177]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [177]),
        .O(STAGE_StateBitsAtDrawID[177]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[178]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [178]),
        .I1(\slotsData_reg[2][SlotData] [178]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [178]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [178]),
        .O(STAGE_StateBitsAtDrawID[178]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[179]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [179]),
        .I1(\slotsData_reg[2][SlotData] [179]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [179]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [179]),
        .O(STAGE_StateBitsAtDrawID[179]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[17]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [17]),
        .I1(\slotsData_reg[2][SlotData] [17]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [17]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [17]),
        .O(STAGE_StateBitsAtDrawID[17]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[180]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [180]),
        .I1(\slotsData_reg[2][SlotData] [180]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [180]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [180]),
        .O(STAGE_StateBitsAtDrawID[180]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[181]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [181]),
        .I1(\slotsData_reg[2][SlotData] [181]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [181]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [181]),
        .O(STAGE_StateBitsAtDrawID[181]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[182]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [182]),
        .I1(\slotsData_reg[2][SlotData] [182]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [182]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [182]),
        .O(STAGE_StateBitsAtDrawID[182]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[183]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [183]),
        .I1(\slotsData_reg[2][SlotData] [183]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [183]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [183]),
        .O(STAGE_StateBitsAtDrawID[183]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[184]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [184]),
        .I1(\slotsData_reg[2][SlotData] [184]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [184]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [184]),
        .O(STAGE_StateBitsAtDrawID[184]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[185]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [185]),
        .I1(\slotsData_reg[2][SlotData] [185]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [185]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [185]),
        .O(STAGE_StateBitsAtDrawID[185]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[186]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [186]),
        .I1(\slotsData_reg[2][SlotData] [186]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [186]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [186]),
        .O(STAGE_StateBitsAtDrawID[186]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[187]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [187]),
        .I1(\slotsData_reg[2][SlotData] [187]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [187]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [187]),
        .O(STAGE_StateBitsAtDrawID[187]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[188]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [188]),
        .I1(\slotsData_reg[2][SlotData] [188]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [188]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [188]),
        .O(STAGE_StateBitsAtDrawID[188]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[189]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [189]),
        .I1(\slotsData_reg[2][SlotData] [189]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [189]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [189]),
        .O(STAGE_StateBitsAtDrawID[189]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[18]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [18]),
        .I1(\slotsData_reg[2][SlotData] [18]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [18]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [18]),
        .O(STAGE_StateBitsAtDrawID[18]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[190]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [190]),
        .I1(\slotsData_reg[2][SlotData] [190]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [190]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [190]),
        .O(STAGE_StateBitsAtDrawID[190]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[191]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [191]),
        .I1(\slotsData_reg[2][SlotData] [191]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [191]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [191]),
        .O(STAGE_StateBitsAtDrawID[191]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[19]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [19]),
        .I1(\slotsData_reg[2][SlotData] [19]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [19]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [19]),
        .O(STAGE_StateBitsAtDrawID[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[1]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [1]),
        .I1(\slotsData_reg[2][SlotData] [1]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [1]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [1]),
        .O(STAGE_StateBitsAtDrawID[1]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[20]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [20]),
        .I1(\slotsData_reg[2][SlotData] [20]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [20]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [20]),
        .O(STAGE_StateBitsAtDrawID[20]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[21]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [21]),
        .I1(\slotsData_reg[2][SlotData] [21]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [21]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [21]),
        .O(STAGE_StateBitsAtDrawID[21]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[22]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [22]),
        .I1(\slotsData_reg[2][SlotData] [22]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [22]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [22]),
        .O(STAGE_StateBitsAtDrawID[22]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[23]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [23]),
        .I1(\slotsData_reg[2][SlotData] [23]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [23]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [23]),
        .O(STAGE_StateBitsAtDrawID[23]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[24]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [24]),
        .I1(\slotsData_reg[2][SlotData] [24]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [24]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [24]),
        .O(STAGE_StateBitsAtDrawID[24]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[25]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [25]),
        .I1(\slotsData_reg[2][SlotData] [25]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [25]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [25]),
        .O(STAGE_StateBitsAtDrawID[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[26]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [26]),
        .I1(\slotsData_reg[2][SlotData] [26]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [26]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [26]),
        .O(STAGE_StateBitsAtDrawID[26]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[27]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [27]),
        .I1(\slotsData_reg[2][SlotData] [27]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [27]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [27]),
        .O(STAGE_StateBitsAtDrawID[27]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[28]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [28]),
        .I1(\slotsData_reg[2][SlotData] [28]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [28]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [28]),
        .O(STAGE_StateBitsAtDrawID[28]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[29]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [29]),
        .I1(\slotsData_reg[2][SlotData] [29]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [29]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [29]),
        .O(STAGE_StateBitsAtDrawID[29]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[2]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [2]),
        .I1(\slotsData_reg[2][SlotData] [2]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [2]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [2]),
        .O(STAGE_StateBitsAtDrawID[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[30]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [30]),
        .I1(\slotsData_reg[2][SlotData] [30]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [30]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [30]),
        .O(STAGE_StateBitsAtDrawID[30]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[31]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [31]),
        .I1(\slotsData_reg[2][SlotData] [31]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [31]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [31]),
        .O(STAGE_StateBitsAtDrawID[31]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[32]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [32]),
        .I1(\slotsData_reg[2][SlotData] [32]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [32]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [32]),
        .O(STAGE_StateBitsAtDrawID[32]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[33]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [33]),
        .I1(\slotsData_reg[2][SlotData] [33]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [33]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [33]),
        .O(STAGE_StateBitsAtDrawID[33]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[34]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [34]),
        .I1(\slotsData_reg[2][SlotData] [34]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [34]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [34]),
        .O(STAGE_StateBitsAtDrawID[34]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[35]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [35]),
        .I1(\slotsData_reg[2][SlotData] [35]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [35]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [35]),
        .O(STAGE_StateBitsAtDrawID[35]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[36]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [36]),
        .I1(\slotsData_reg[2][SlotData] [36]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [36]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [36]),
        .O(STAGE_StateBitsAtDrawID[36]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[37]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [37]),
        .I1(\slotsData_reg[2][SlotData] [37]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [37]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [37]),
        .O(STAGE_StateBitsAtDrawID[37]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[38]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [38]),
        .I1(\slotsData_reg[2][SlotData] [38]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [38]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [38]),
        .O(STAGE_StateBitsAtDrawID[38]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[39]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [39]),
        .I1(\slotsData_reg[2][SlotData] [39]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [39]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [39]),
        .O(STAGE_StateBitsAtDrawID[39]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[3]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [3]),
        .I1(\slotsData_reg[2][SlotData] [3]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [3]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [3]),
        .O(STAGE_StateBitsAtDrawID[3]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[40]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [40]),
        .I1(\slotsData_reg[2][SlotData] [40]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [40]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [40]),
        .O(STAGE_StateBitsAtDrawID[40]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[41]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [41]),
        .I1(\slotsData_reg[2][SlotData] [41]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [41]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [41]),
        .O(STAGE_StateBitsAtDrawID[41]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[42]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [42]),
        .I1(\slotsData_reg[2][SlotData] [42]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [42]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [42]),
        .O(STAGE_StateBitsAtDrawID[42]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[43]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [43]),
        .I1(\slotsData_reg[2][SlotData] [43]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [43]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [43]),
        .O(STAGE_StateBitsAtDrawID[43]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[44]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [44]),
        .I1(\slotsData_reg[2][SlotData] [44]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [44]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [44]),
        .O(STAGE_StateBitsAtDrawID[44]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[45]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [45]),
        .I1(\slotsData_reg[2][SlotData] [45]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [45]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [45]),
        .O(STAGE_StateBitsAtDrawID[45]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[46]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [46]),
        .I1(\slotsData_reg[2][SlotData] [46]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [46]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [46]),
        .O(STAGE_StateBitsAtDrawID[46]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[47]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [47]),
        .I1(\slotsData_reg[2][SlotData] [47]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [47]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [47]),
        .O(STAGE_StateBitsAtDrawID[47]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[48]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [48]),
        .I1(\slotsData_reg[2][SlotData] [48]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [48]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [48]),
        .O(STAGE_StateBitsAtDrawID[48]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[49]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [49]),
        .I1(\slotsData_reg[2][SlotData] [49]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [49]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [49]),
        .O(STAGE_StateBitsAtDrawID[49]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[4]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [4]),
        .I1(\slotsData_reg[2][SlotData] [4]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [4]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [4]),
        .O(STAGE_StateBitsAtDrawID[4]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[50]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [50]),
        .I1(\slotsData_reg[2][SlotData] [50]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [50]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [50]),
        .O(STAGE_StateBitsAtDrawID[50]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[51]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [51]),
        .I1(\slotsData_reg[2][SlotData] [51]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [51]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [51]),
        .O(STAGE_StateBitsAtDrawID[51]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[52]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [52]),
        .I1(\slotsData_reg[2][SlotData] [52]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [52]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [52]),
        .O(STAGE_StateBitsAtDrawID[52]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[53]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [53]),
        .I1(\slotsData_reg[2][SlotData] [53]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [53]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [53]),
        .O(STAGE_StateBitsAtDrawID[53]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[54]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [54]),
        .I1(\slotsData_reg[2][SlotData] [54]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [54]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [54]),
        .O(STAGE_StateBitsAtDrawID[54]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[55]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [55]),
        .I1(\slotsData_reg[2][SlotData] [55]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [55]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [55]),
        .O(STAGE_StateBitsAtDrawID[55]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[56]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [56]),
        .I1(\slotsData_reg[2][SlotData] [56]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [56]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [56]),
        .O(STAGE_StateBitsAtDrawID[56]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[57]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [57]),
        .I1(\slotsData_reg[2][SlotData] [57]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [57]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [57]),
        .O(STAGE_StateBitsAtDrawID[57]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[58]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [58]),
        .I1(\slotsData_reg[2][SlotData] [58]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [58]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [58]),
        .O(STAGE_StateBitsAtDrawID[58]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[59]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [59]),
        .I1(\slotsData_reg[2][SlotData] [59]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [59]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [59]),
        .O(STAGE_StateBitsAtDrawID[59]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[5]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [5]),
        .I1(\slotsData_reg[2][SlotData] [5]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [5]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [5]),
        .O(STAGE_StateBitsAtDrawID[5]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[60]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [60]),
        .I1(\slotsData_reg[2][SlotData] [60]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [60]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [60]),
        .O(STAGE_StateBitsAtDrawID[60]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[61]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [61]),
        .I1(\slotsData_reg[2][SlotData] [61]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [61]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [61]),
        .O(STAGE_StateBitsAtDrawID[61]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[62]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [62]),
        .I1(\slotsData_reg[2][SlotData] [62]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [62]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [62]),
        .O(STAGE_StateBitsAtDrawID[62]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[63]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [63]),
        .I1(\slotsData_reg[2][SlotData] [63]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [63]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [63]),
        .O(STAGE_StateBitsAtDrawID[63]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[64]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [64]),
        .I1(\slotsData_reg[2][SlotData] [64]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [64]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [64]),
        .O(STAGE_StateBitsAtDrawID[64]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[65]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [65]),
        .I1(\slotsData_reg[2][SlotData] [65]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [65]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [65]),
        .O(STAGE_StateBitsAtDrawID[65]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[66]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [66]),
        .I1(\slotsData_reg[2][SlotData] [66]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [66]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [66]),
        .O(STAGE_StateBitsAtDrawID[66]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[67]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [67]),
        .I1(\slotsData_reg[2][SlotData] [67]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [67]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [67]),
        .O(STAGE_StateBitsAtDrawID[67]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[68]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [68]),
        .I1(\slotsData_reg[2][SlotData] [68]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [68]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [68]),
        .O(STAGE_StateBitsAtDrawID[68]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[69]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [69]),
        .I1(\slotsData_reg[2][SlotData] [69]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [69]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [69]),
        .O(STAGE_StateBitsAtDrawID[69]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[6]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [6]),
        .I1(\slotsData_reg[2][SlotData] [6]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [6]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [6]),
        .O(STAGE_StateBitsAtDrawID[6]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[70]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [70]),
        .I1(\slotsData_reg[2][SlotData] [70]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [70]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [70]),
        .O(STAGE_StateBitsAtDrawID[70]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[71]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [71]),
        .I1(\slotsData_reg[2][SlotData] [71]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [71]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [71]),
        .O(STAGE_StateBitsAtDrawID[71]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[72]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [72]),
        .I1(\slotsData_reg[2][SlotData] [72]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [72]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [72]),
        .O(STAGE_StateBitsAtDrawID[72]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[73]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [73]),
        .I1(\slotsData_reg[2][SlotData] [73]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [73]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [73]),
        .O(STAGE_StateBitsAtDrawID[73]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[74]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [74]),
        .I1(\slotsData_reg[2][SlotData] [74]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [74]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [74]),
        .O(STAGE_StateBitsAtDrawID[74]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[75]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [75]),
        .I1(\slotsData_reg[2][SlotData] [75]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [75]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [75]),
        .O(STAGE_StateBitsAtDrawID[75]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[76]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [76]),
        .I1(\slotsData_reg[2][SlotData] [76]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [76]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [76]),
        .O(STAGE_StateBitsAtDrawID[76]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[77]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [77]),
        .I1(\slotsData_reg[2][SlotData] [77]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [77]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [77]),
        .O(STAGE_StateBitsAtDrawID[77]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[78]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [78]),
        .I1(\slotsData_reg[2][SlotData] [78]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [78]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [78]),
        .O(STAGE_StateBitsAtDrawID[78]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[79]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [79]),
        .I1(\slotsData_reg[2][SlotData] [79]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [79]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [79]),
        .O(STAGE_StateBitsAtDrawID[79]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[7]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [7]),
        .I1(\slotsData_reg[2][SlotData] [7]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [7]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [7]),
        .O(STAGE_StateBitsAtDrawID[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[80]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [80]),
        .I1(\slotsData_reg[2][SlotData] [80]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [80]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [80]),
        .O(STAGE_StateBitsAtDrawID[80]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[81]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [81]),
        .I1(\slotsData_reg[2][SlotData] [81]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [81]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [81]),
        .O(STAGE_StateBitsAtDrawID[81]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[82]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [82]),
        .I1(\slotsData_reg[2][SlotData] [82]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [82]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [82]),
        .O(STAGE_StateBitsAtDrawID[82]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[83]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [83]),
        .I1(\slotsData_reg[2][SlotData] [83]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [83]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [83]),
        .O(STAGE_StateBitsAtDrawID[83]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[84]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [84]),
        .I1(\slotsData_reg[2][SlotData] [84]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [84]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [84]),
        .O(STAGE_StateBitsAtDrawID[84]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[85]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [85]),
        .I1(\slotsData_reg[2][SlotData] [85]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [85]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [85]),
        .O(STAGE_StateBitsAtDrawID[85]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[86]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [86]),
        .I1(\slotsData_reg[2][SlotData] [86]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [86]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [86]),
        .O(STAGE_StateBitsAtDrawID[86]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[87]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [87]),
        .I1(\slotsData_reg[2][SlotData] [87]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [87]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [87]),
        .O(STAGE_StateBitsAtDrawID[87]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[88]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [88]),
        .I1(\slotsData_reg[2][SlotData] [88]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [88]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [88]),
        .O(STAGE_StateBitsAtDrawID[88]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[89]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [89]),
        .I1(\slotsData_reg[2][SlotData] [89]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [89]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [89]),
        .O(STAGE_StateBitsAtDrawID[89]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[8]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [8]),
        .I1(\slotsData_reg[2][SlotData] [8]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [8]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [8]),
        .O(STAGE_StateBitsAtDrawID[8]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[90]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [90]),
        .I1(\slotsData_reg[2][SlotData] [90]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [90]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [90]),
        .O(STAGE_StateBitsAtDrawID[90]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[91]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [91]),
        .I1(\slotsData_reg[2][SlotData] [91]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [91]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [91]),
        .O(STAGE_StateBitsAtDrawID[91]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[92]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [92]),
        .I1(\slotsData_reg[2][SlotData] [92]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [92]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [92]),
        .O(STAGE_StateBitsAtDrawID[92]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[93]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [93]),
        .I1(\slotsData_reg[2][SlotData] [93]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [93]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [93]),
        .O(STAGE_StateBitsAtDrawID[93]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[94]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [94]),
        .I1(\slotsData_reg[2][SlotData] [94]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [94]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [94]),
        .O(STAGE_StateBitsAtDrawID[94]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[95]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [95]),
        .I1(\slotsData_reg[2][SlotData] [95]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [95]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [95]),
        .O(STAGE_StateBitsAtDrawID[95]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[96]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [96]),
        .I1(\slotsData_reg[2][SlotData] [96]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [96]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [96]),
        .O(STAGE_StateBitsAtDrawID[96]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[97]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [97]),
        .I1(\slotsData_reg[2][SlotData] [97]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [97]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [97]),
        .O(STAGE_StateBitsAtDrawID[97]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[98]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [98]),
        .I1(\slotsData_reg[2][SlotData] [98]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [98]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [98]),
        .O(STAGE_StateBitsAtDrawID[98]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[99]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [99]),
        .I1(\slotsData_reg[2][SlotData] [99]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [99]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [99]),
        .O(STAGE_StateBitsAtDrawID[99]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \STAGE_StateBitsAtDrawID[9]_INST_0 
       (.I0(\slotsData_reg[3][SlotData] [9]),
        .I1(\slotsData_reg[2][SlotData] [9]),
        .I2(\currentReadSlot_reg[1]_0 ),
        .I3(\slotsData_reg[1][SlotData] [9]),
        .I4(DBG_CurrentReadSlotIndex),
        .I5(\slotsData_reg[0][SlotData] [9]),
        .O(STAGE_StateBitsAtDrawID[9]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    STAGE_StateIsValid_INST_0
       (.I0(\slotsData_reg[3][SlotIsValid]_0 ),
        .I1(\slotsData_reg[2][SlotIsValid]_0 ),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(\slotsData_reg[1][SlotIsValid]_0 ),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(\slotsData_reg[0][SlotIsValid]_0 ),
        .O(STAGE_StateIsValid));
  LUT1 #(
    .INIT(2'h1)) 
    \currentReadSlot[0]_i_1 
       (.I0(\currentReadSlot_reg_n_0_[0] ),
        .O(\currentReadSlot[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \currentReadSlot[0]_rep_i_1 
       (.I0(\currentReadSlot_reg_n_0_[0] ),
        .O(\currentReadSlot[0]_rep_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \currentReadSlot[1]_i_1 
       (.I0(\currentReadSlot_reg[1]_0 ),
        .I1(DBG_CurrentReadSlotIndex),
        .O(\currentReadSlot[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \currentReadSlot[1]_rep_i_1 
       (.I0(\currentReadSlot_reg[1]_0 ),
        .I1(\currentReadSlot_reg_n_0_[0] ),
        .O(\currentReadSlot[1]_rep_i_1_n_0 ));
  (* ORIG_CELL_NAME = "currentReadSlot_reg[0]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentReadSlot_reg[0] 
       (.C(clk),
        .CE(STAGE_ConsumeStateSlot),
        .D(\currentReadSlot[0]_i_1_n_0 ),
        .Q(\currentReadSlot_reg_n_0_[0] ),
        .R(CMD_EndFrameReset));
  (* ORIG_CELL_NAME = "currentReadSlot_reg[0]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentReadSlot_reg[0]_rep 
       (.C(clk),
        .CE(STAGE_ConsumeStateSlot),
        .D(\currentReadSlot[0]_rep_i_1_n_0 ),
        .Q(DBG_CurrentReadSlotIndex),
        .R(CMD_EndFrameReset));
  (* ORIG_CELL_NAME = "currentReadSlot_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentReadSlot_reg[1] 
       (.C(clk),
        .CE(STAGE_ConsumeStateSlot),
        .D(\currentReadSlot[1]_i_1_n_0 ),
        .Q(\currentReadSlot_reg[1]_0 ),
        .R(CMD_EndFrameReset));
  (* ORIG_CELL_NAME = "currentReadSlot_reg[1]" *) 
  FDRE #(
    .INIT(1'b0)) 
    \currentReadSlot_reg[1]_rep 
       (.C(clk),
        .CE(STAGE_ConsumeStateSlot),
        .D(\currentReadSlot[1]_rep_i_1_n_0 ),
        .Q(\currentReadSlot_reg[1]_rep_n_0 ),
        .R(CMD_EndFrameReset));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \currentWriteSlot[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \currentWriteSlot[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(plusOp[1]));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteSlot_reg[0] 
       (.C(clk),
        .CE(CMD_SetNewState),
        .D(plusOp[0]),
        .Q(Q[0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteSlot_reg[1] 
       (.C(clk),
        .CE(CMD_SetNewState),
        .D(plusOp[1]),
        .Q(Q[1]),
        .R(CMD_EndFrameReset));
  LUT3 #(
    .INIT(8'h10)) 
    \slotsData[0][SlotData][191]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(CMD_SetNewState),
        .O(\slotsData[0][SlotIsValid]1_out ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][0]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[0]),
        .O(\slotsData[0][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][10]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[10]),
        .O(\slotsData[0][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][11]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[11]),
        .O(\slotsData[0][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][12]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[12]),
        .O(\slotsData[0][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][13]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[13]),
        .O(\slotsData[0][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][14]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[14]),
        .O(\slotsData[0][SlotDrawEventID][14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h101010FF10101010)) 
    \slotsData[0][SlotDrawEventID][15]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(CMD_SetNewState),
        .I3(\currentReadSlot_reg[1]_rep_n_0 ),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(STAGE_ConsumeStateSlot),
        .O(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][15]_i_2 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[15]),
        .O(\slotsData[0][SlotDrawEventID][15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][1]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[1]),
        .O(\slotsData[0][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][2]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[2]),
        .O(\slotsData[0][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][3]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[3]),
        .O(\slotsData[0][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][4]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[4]),
        .O(\slotsData[0][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][5]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[5]),
        .O(\slotsData[0][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][6]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[6]),
        .O(\slotsData[0][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][7]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[7]),
        .O(\slotsData[0][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][8]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[8]),
        .O(\slotsData[0][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[0][SlotDrawEventID][9]_i_1 
       (.I0(\slotsData[0][SlotIsValid]1_out ),
        .I1(CMD_NewStateDrawEventID[9]),
        .O(\slotsData[0][SlotDrawEventID][9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFDFF00)) 
    \slotsData[0][SlotIsValid]_i_1 
       (.I0(STAGE_ConsumeStateSlot),
        .I1(\currentReadSlot_reg_n_0_[0] ),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(\slotsData[0][SlotIsValid]1_out ),
        .I4(\slotsData_reg[0][SlotIsValid]_0 ),
        .O(\slotsData[0][SlotIsValid]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \slotsData[1][SlotData][191]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(CMD_SetNewState),
        .O(\slotsData[1][SlotIsValid]3_out ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][0]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[0]),
        .O(\slotsData[1][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][10]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[10]),
        .O(\slotsData[1][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][11]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[11]),
        .O(\slotsData[1][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][12]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[12]),
        .O(\slotsData[1][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][13]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[13]),
        .O(\slotsData[1][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][14]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[14]),
        .O(\slotsData[1][SlotDrawEventID][14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h40FF404040404040)) 
    \slotsData[1][SlotDrawEventID][15]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(CMD_SetNewState),
        .I3(\currentReadSlot_reg[1]_rep_n_0 ),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(STAGE_ConsumeStateSlot),
        .O(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][15]_i_2 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[15]),
        .O(\slotsData[1][SlotDrawEventID][15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][1]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[1]),
        .O(\slotsData[1][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][2]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[2]),
        .O(\slotsData[1][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][3]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[3]),
        .O(\slotsData[1][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][4]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[4]),
        .O(\slotsData[1][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][5]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[5]),
        .O(\slotsData[1][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][6]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[6]),
        .O(\slotsData[1][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][7]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[7]),
        .O(\slotsData[1][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][8]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[8]),
        .O(\slotsData[1][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[1][SlotDrawEventID][9]_i_1 
       (.I0(\slotsData[1][SlotIsValid]3_out ),
        .I1(CMD_NewStateDrawEventID[9]),
        .O(\slotsData[1][SlotDrawEventID][9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFF7FF00)) 
    \slotsData[1][SlotIsValid]_i_1 
       (.I0(STAGE_ConsumeStateSlot),
        .I1(\currentReadSlot_reg_n_0_[0] ),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(\slotsData[1][SlotIsValid]3_out ),
        .I4(\slotsData_reg[1][SlotIsValid]_0 ),
        .O(\slotsData[1][SlotIsValid]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h40)) 
    \slotsData[2][SlotData][191]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(CMD_SetNewState),
        .O(\slotsData[2][SlotIsValid]5_out ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][0]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[0]),
        .O(\slotsData[2][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][10]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[10]),
        .O(\slotsData[2][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][11]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[11]),
        .O(\slotsData[2][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][12]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[12]),
        .O(\slotsData[2][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][13]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[13]),
        .O(\slotsData[2][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][14]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[14]),
        .O(\slotsData[2][SlotDrawEventID][14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h40FF404040404040)) 
    \slotsData[2][SlotDrawEventID][15]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(CMD_SetNewState),
        .I3(\currentReadSlot_reg_n_0_[0] ),
        .I4(\currentReadSlot_reg[1]_rep_n_0 ),
        .I5(STAGE_ConsumeStateSlot),
        .O(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][15]_i_2 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[15]),
        .O(\slotsData[2][SlotDrawEventID][15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][1]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[1]),
        .O(\slotsData[2][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][2]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[2]),
        .O(\slotsData[2][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][3]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[3]),
        .O(\slotsData[2][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][4]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[4]),
        .O(\slotsData[2][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][5]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[5]),
        .O(\slotsData[2][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][6]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[6]),
        .O(\slotsData[2][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][7]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[7]),
        .O(\slotsData[2][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][8]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[8]),
        .O(\slotsData[2][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[2][SlotDrawEventID][9]_i_1 
       (.I0(\slotsData[2][SlotIsValid]5_out ),
        .I1(CMD_NewStateDrawEventID[9]),
        .O(\slotsData[2][SlotDrawEventID][9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFF7FF00)) 
    \slotsData[2][SlotIsValid]_i_1 
       (.I0(STAGE_ConsumeStateSlot),
        .I1(\currentReadSlot_reg[1]_rep_n_0 ),
        .I2(\currentReadSlot_reg_n_0_[0] ),
        .I3(\slotsData[2][SlotIsValid]5_out ),
        .I4(\slotsData_reg[2][SlotIsValid]_0 ),
        .O(\slotsData[2][SlotIsValid]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \slotsData[3][SlotData][191]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(CMD_SetNewState),
        .O(\slotsData[3][SlotIsValid]7_out ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][0]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[0]),
        .O(\slotsData[3][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][10]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[10]),
        .O(\slotsData[3][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][11]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[11]),
        .O(\slotsData[3][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][12]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[12]),
        .O(\slotsData[3][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][13]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[13]),
        .O(\slotsData[3][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][14]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[14]),
        .O(\slotsData[3][SlotDrawEventID][14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF80808080808080)) 
    \slotsData[3][SlotDrawEventID][15]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(CMD_SetNewState),
        .I3(\currentReadSlot_reg[1]_rep_n_0 ),
        .I4(\currentReadSlot_reg_n_0_[0] ),
        .I5(STAGE_ConsumeStateSlot),
        .O(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][15]_i_2 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[15]),
        .O(\slotsData[3][SlotDrawEventID][15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][1]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[1]),
        .O(\slotsData[3][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][2]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[2]),
        .O(\slotsData[3][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][3]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[3]),
        .O(\slotsData[3][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][4]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[4]),
        .O(\slotsData[3][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][5]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[5]),
        .O(\slotsData[3][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][6]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[6]),
        .O(\slotsData[3][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][7]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[7]),
        .O(\slotsData[3][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][8]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[8]),
        .O(\slotsData[3][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotDrawEventID][9]_i_1 
       (.I0(\slotsData[3][SlotIsValid]7_out ),
        .I1(CMD_NewStateDrawEventID[9]),
        .O(\slotsData[3][SlotDrawEventID][9]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF7FFF00)) 
    \slotsData[3][SlotIsValid]_i_1 
       (.I0(STAGE_ConsumeStateSlot),
        .I1(\currentReadSlot_reg_n_0_[0] ),
        .I2(\currentReadSlot_reg[1]_rep_n_0 ),
        .I3(\slotsData[3][SlotIsValid]7_out ),
        .I4(\slotsData_reg[3][SlotIsValid]_0 ),
        .O(\slotsData[3][SlotIsValid]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][0] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[0]),
        .Q(\slotsData_reg[0][SlotData] [0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][100] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[100]),
        .Q(\slotsData_reg[0][SlotData] [100]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][101] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[101]),
        .Q(\slotsData_reg[0][SlotData] [101]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][102] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[102]),
        .Q(\slotsData_reg[0][SlotData] [102]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][103] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[103]),
        .Q(\slotsData_reg[0][SlotData] [103]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][104] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[104]),
        .Q(\slotsData_reg[0][SlotData] [104]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][105] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[105]),
        .Q(\slotsData_reg[0][SlotData] [105]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][106] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[106]),
        .Q(\slotsData_reg[0][SlotData] [106]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][107] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[107]),
        .Q(\slotsData_reg[0][SlotData] [107]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][108] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[108]),
        .Q(\slotsData_reg[0][SlotData] [108]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][109] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[109]),
        .Q(\slotsData_reg[0][SlotData] [109]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][10] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[10]),
        .Q(\slotsData_reg[0][SlotData] [10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][110] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[110]),
        .Q(\slotsData_reg[0][SlotData] [110]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][111] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[111]),
        .Q(\slotsData_reg[0][SlotData] [111]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][112] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[112]),
        .Q(\slotsData_reg[0][SlotData] [112]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][113] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[113]),
        .Q(\slotsData_reg[0][SlotData] [113]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][114] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[114]),
        .Q(\slotsData_reg[0][SlotData] [114]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][115] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[115]),
        .Q(\slotsData_reg[0][SlotData] [115]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][116] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[116]),
        .Q(\slotsData_reg[0][SlotData] [116]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][117] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[117]),
        .Q(\slotsData_reg[0][SlotData] [117]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][118] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[118]),
        .Q(\slotsData_reg[0][SlotData] [118]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][119] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[119]),
        .Q(\slotsData_reg[0][SlotData] [119]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][11] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[11]),
        .Q(\slotsData_reg[0][SlotData] [11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][120] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[120]),
        .Q(\slotsData_reg[0][SlotData] [120]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][121] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[121]),
        .Q(\slotsData_reg[0][SlotData] [121]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][122] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[122]),
        .Q(\slotsData_reg[0][SlotData] [122]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][123] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[123]),
        .Q(\slotsData_reg[0][SlotData] [123]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][124] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[124]),
        .Q(\slotsData_reg[0][SlotData] [124]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][125] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[125]),
        .Q(\slotsData_reg[0][SlotData] [125]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][126] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[126]),
        .Q(\slotsData_reg[0][SlotData] [126]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][127] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[127]),
        .Q(\slotsData_reg[0][SlotData] [127]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][128] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[128]),
        .Q(\slotsData_reg[0][SlotData] [128]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][129] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[129]),
        .Q(\slotsData_reg[0][SlotData] [129]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][12] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[12]),
        .Q(\slotsData_reg[0][SlotData] [12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][130] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[130]),
        .Q(\slotsData_reg[0][SlotData] [130]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][131] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[131]),
        .Q(\slotsData_reg[0][SlotData] [131]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][132] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[132]),
        .Q(\slotsData_reg[0][SlotData] [132]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][133] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[133]),
        .Q(\slotsData_reg[0][SlotData] [133]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][134] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[134]),
        .Q(\slotsData_reg[0][SlotData] [134]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][135] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[135]),
        .Q(\slotsData_reg[0][SlotData] [135]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][136] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[136]),
        .Q(\slotsData_reg[0][SlotData] [136]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][137] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[137]),
        .Q(\slotsData_reg[0][SlotData] [137]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][138] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[138]),
        .Q(\slotsData_reg[0][SlotData] [138]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][139] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[139]),
        .Q(\slotsData_reg[0][SlotData] [139]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][13] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[13]),
        .Q(\slotsData_reg[0][SlotData] [13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][140] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[140]),
        .Q(\slotsData_reg[0][SlotData] [140]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][141] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[141]),
        .Q(\slotsData_reg[0][SlotData] [141]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][142] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[142]),
        .Q(\slotsData_reg[0][SlotData] [142]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][143] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[143]),
        .Q(\slotsData_reg[0][SlotData] [143]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][144] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[144]),
        .Q(\slotsData_reg[0][SlotData] [144]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][145] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[145]),
        .Q(\slotsData_reg[0][SlotData] [145]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][146] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[146]),
        .Q(\slotsData_reg[0][SlotData] [146]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][147] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[147]),
        .Q(\slotsData_reg[0][SlotData] [147]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][148] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[148]),
        .Q(\slotsData_reg[0][SlotData] [148]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][149] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[149]),
        .Q(\slotsData_reg[0][SlotData] [149]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][14] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[14]),
        .Q(\slotsData_reg[0][SlotData] [14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][150] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[150]),
        .Q(\slotsData_reg[0][SlotData] [150]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][151] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[151]),
        .Q(\slotsData_reg[0][SlotData] [151]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][152] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[152]),
        .Q(\slotsData_reg[0][SlotData] [152]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][153] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[153]),
        .Q(\slotsData_reg[0][SlotData] [153]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][154] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[154]),
        .Q(\slotsData_reg[0][SlotData] [154]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][155] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[155]),
        .Q(\slotsData_reg[0][SlotData] [155]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][156] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[156]),
        .Q(\slotsData_reg[0][SlotData] [156]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][157] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[157]),
        .Q(\slotsData_reg[0][SlotData] [157]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][158] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[158]),
        .Q(\slotsData_reg[0][SlotData] [158]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][159] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[159]),
        .Q(\slotsData_reg[0][SlotData] [159]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][15] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[15]),
        .Q(\slotsData_reg[0][SlotData] [15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][160] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[160]),
        .Q(\slotsData_reg[0][SlotData] [160]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][161] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[161]),
        .Q(\slotsData_reg[0][SlotData] [161]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][162] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[162]),
        .Q(\slotsData_reg[0][SlotData] [162]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][163] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[163]),
        .Q(\slotsData_reg[0][SlotData] [163]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][164] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[164]),
        .Q(\slotsData_reg[0][SlotData] [164]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][165] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[165]),
        .Q(\slotsData_reg[0][SlotData] [165]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][166] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[166]),
        .Q(\slotsData_reg[0][SlotData] [166]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][167] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[167]),
        .Q(\slotsData_reg[0][SlotData] [167]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][168] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[168]),
        .Q(\slotsData_reg[0][SlotData] [168]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][169] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[169]),
        .Q(\slotsData_reg[0][SlotData] [169]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][16] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[16]),
        .Q(\slotsData_reg[0][SlotData] [16]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][170] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[170]),
        .Q(\slotsData_reg[0][SlotData] [170]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][171] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[171]),
        .Q(\slotsData_reg[0][SlotData] [171]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][172] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[172]),
        .Q(\slotsData_reg[0][SlotData] [172]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][173] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[173]),
        .Q(\slotsData_reg[0][SlotData] [173]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][174] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[174]),
        .Q(\slotsData_reg[0][SlotData] [174]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][175] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[175]),
        .Q(\slotsData_reg[0][SlotData] [175]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][176] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[176]),
        .Q(\slotsData_reg[0][SlotData] [176]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][177] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[177]),
        .Q(\slotsData_reg[0][SlotData] [177]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][178] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[178]),
        .Q(\slotsData_reg[0][SlotData] [178]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][179] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[179]),
        .Q(\slotsData_reg[0][SlotData] [179]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][17] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[17]),
        .Q(\slotsData_reg[0][SlotData] [17]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][180] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[180]),
        .Q(\slotsData_reg[0][SlotData] [180]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][181] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[181]),
        .Q(\slotsData_reg[0][SlotData] [181]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][182] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[182]),
        .Q(\slotsData_reg[0][SlotData] [182]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][183] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[183]),
        .Q(\slotsData_reg[0][SlotData] [183]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][184] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[184]),
        .Q(\slotsData_reg[0][SlotData] [184]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][185] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[185]),
        .Q(\slotsData_reg[0][SlotData] [185]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][186] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[186]),
        .Q(\slotsData_reg[0][SlotData] [186]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][187] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[187]),
        .Q(\slotsData_reg[0][SlotData] [187]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][188] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[188]),
        .Q(\slotsData_reg[0][SlotData] [188]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][189] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[189]),
        .Q(\slotsData_reg[0][SlotData] [189]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][18] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[18]),
        .Q(\slotsData_reg[0][SlotData] [18]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][190] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[190]),
        .Q(\slotsData_reg[0][SlotData] [190]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][191] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[191]),
        .Q(\slotsData_reg[0][SlotData] [191]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][19] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[19]),
        .Q(\slotsData_reg[0][SlotData] [19]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][1] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[1]),
        .Q(\slotsData_reg[0][SlotData] [1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][20] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[20]),
        .Q(\slotsData_reg[0][SlotData] [20]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][21] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[21]),
        .Q(\slotsData_reg[0][SlotData] [21]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][22] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[22]),
        .Q(\slotsData_reg[0][SlotData] [22]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][23] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[23]),
        .Q(\slotsData_reg[0][SlotData] [23]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][24] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[24]),
        .Q(\slotsData_reg[0][SlotData] [24]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][25] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[25]),
        .Q(\slotsData_reg[0][SlotData] [25]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][26] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[26]),
        .Q(\slotsData_reg[0][SlotData] [26]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][27] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[27]),
        .Q(\slotsData_reg[0][SlotData] [27]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][28] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[28]),
        .Q(\slotsData_reg[0][SlotData] [28]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][29] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[29]),
        .Q(\slotsData_reg[0][SlotData] [29]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][2] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[2]),
        .Q(\slotsData_reg[0][SlotData] [2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][30] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[30]),
        .Q(\slotsData_reg[0][SlotData] [30]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][31] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[31]),
        .Q(\slotsData_reg[0][SlotData] [31]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][32] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[32]),
        .Q(\slotsData_reg[0][SlotData] [32]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][33] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[33]),
        .Q(\slotsData_reg[0][SlotData] [33]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][34] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[34]),
        .Q(\slotsData_reg[0][SlotData] [34]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][35] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[35]),
        .Q(\slotsData_reg[0][SlotData] [35]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][36] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[36]),
        .Q(\slotsData_reg[0][SlotData] [36]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][37] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[37]),
        .Q(\slotsData_reg[0][SlotData] [37]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][38] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[38]),
        .Q(\slotsData_reg[0][SlotData] [38]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][39] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[39]),
        .Q(\slotsData_reg[0][SlotData] [39]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][3] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[3]),
        .Q(\slotsData_reg[0][SlotData] [3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][40] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[40]),
        .Q(\slotsData_reg[0][SlotData] [40]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][41] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[41]),
        .Q(\slotsData_reg[0][SlotData] [41]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][42] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[42]),
        .Q(\slotsData_reg[0][SlotData] [42]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][43] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[43]),
        .Q(\slotsData_reg[0][SlotData] [43]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][44] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[44]),
        .Q(\slotsData_reg[0][SlotData] [44]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][45] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[45]),
        .Q(\slotsData_reg[0][SlotData] [45]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][46] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[46]),
        .Q(\slotsData_reg[0][SlotData] [46]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][47] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[47]),
        .Q(\slotsData_reg[0][SlotData] [47]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][48] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[48]),
        .Q(\slotsData_reg[0][SlotData] [48]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][49] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[49]),
        .Q(\slotsData_reg[0][SlotData] [49]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][4] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[4]),
        .Q(\slotsData_reg[0][SlotData] [4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][50] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[50]),
        .Q(\slotsData_reg[0][SlotData] [50]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][51] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[51]),
        .Q(\slotsData_reg[0][SlotData] [51]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][52] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[52]),
        .Q(\slotsData_reg[0][SlotData] [52]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][53] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[53]),
        .Q(\slotsData_reg[0][SlotData] [53]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][54] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[54]),
        .Q(\slotsData_reg[0][SlotData] [54]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][55] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[55]),
        .Q(\slotsData_reg[0][SlotData] [55]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][56] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[56]),
        .Q(\slotsData_reg[0][SlotData] [56]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][57] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[57]),
        .Q(\slotsData_reg[0][SlotData] [57]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][58] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[58]),
        .Q(\slotsData_reg[0][SlotData] [58]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][59] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[59]),
        .Q(\slotsData_reg[0][SlotData] [59]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][5] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[5]),
        .Q(\slotsData_reg[0][SlotData] [5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][60] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[60]),
        .Q(\slotsData_reg[0][SlotData] [60]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][61] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[61]),
        .Q(\slotsData_reg[0][SlotData] [61]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][62] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[62]),
        .Q(\slotsData_reg[0][SlotData] [62]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][63] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[63]),
        .Q(\slotsData_reg[0][SlotData] [63]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][64] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[64]),
        .Q(\slotsData_reg[0][SlotData] [64]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][65] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[65]),
        .Q(\slotsData_reg[0][SlotData] [65]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][66] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[66]),
        .Q(\slotsData_reg[0][SlotData] [66]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][67] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[67]),
        .Q(\slotsData_reg[0][SlotData] [67]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][68] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[68]),
        .Q(\slotsData_reg[0][SlotData] [68]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][69] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[69]),
        .Q(\slotsData_reg[0][SlotData] [69]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][6] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[6]),
        .Q(\slotsData_reg[0][SlotData] [6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][70] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[70]),
        .Q(\slotsData_reg[0][SlotData] [70]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][71] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[71]),
        .Q(\slotsData_reg[0][SlotData] [71]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][72] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[72]),
        .Q(\slotsData_reg[0][SlotData] [72]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][73] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[73]),
        .Q(\slotsData_reg[0][SlotData] [73]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][74] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[74]),
        .Q(\slotsData_reg[0][SlotData] [74]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][75] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[75]),
        .Q(\slotsData_reg[0][SlotData] [75]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][76] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[76]),
        .Q(\slotsData_reg[0][SlotData] [76]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][77] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[77]),
        .Q(\slotsData_reg[0][SlotData] [77]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][78] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[78]),
        .Q(\slotsData_reg[0][SlotData] [78]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][79] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[79]),
        .Q(\slotsData_reg[0][SlotData] [79]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][7] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[7]),
        .Q(\slotsData_reg[0][SlotData] [7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][80] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[80]),
        .Q(\slotsData_reg[0][SlotData] [80]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][81] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[81]),
        .Q(\slotsData_reg[0][SlotData] [81]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][82] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[82]),
        .Q(\slotsData_reg[0][SlotData] [82]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][83] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[83]),
        .Q(\slotsData_reg[0][SlotData] [83]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][84] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[84]),
        .Q(\slotsData_reg[0][SlotData] [84]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][85] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[85]),
        .Q(\slotsData_reg[0][SlotData] [85]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][86] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[86]),
        .Q(\slotsData_reg[0][SlotData] [86]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][87] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[87]),
        .Q(\slotsData_reg[0][SlotData] [87]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][88] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[88]),
        .Q(\slotsData_reg[0][SlotData] [88]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][89] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[89]),
        .Q(\slotsData_reg[0][SlotData] [89]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][8] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[8]),
        .Q(\slotsData_reg[0][SlotData] [8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][90] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[90]),
        .Q(\slotsData_reg[0][SlotData] [90]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][91] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[91]),
        .Q(\slotsData_reg[0][SlotData] [91]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][92] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[92]),
        .Q(\slotsData_reg[0][SlotData] [92]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][93] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[93]),
        .Q(\slotsData_reg[0][SlotData] [93]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][94] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[94]),
        .Q(\slotsData_reg[0][SlotData] [94]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][95] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[95]),
        .Q(\slotsData_reg[0][SlotData] [95]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][96] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[96]),
        .Q(\slotsData_reg[0][SlotData] [96]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][97] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[97]),
        .Q(\slotsData_reg[0][SlotData] [97]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][98] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[98]),
        .Q(\slotsData_reg[0][SlotData] [98]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][99] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[99]),
        .Q(\slotsData_reg[0][SlotData] [99]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotData][9] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[9]),
        .Q(\slotsData_reg[0][SlotData] [9]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][0] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][0]_i_1_n_0 ),
        .Q(DBG_Slot0[0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][10] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][10]_i_1_n_0 ),
        .Q(DBG_Slot0[10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][11] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][11]_i_1_n_0 ),
        .Q(DBG_Slot0[11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][12] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][12]_i_1_n_0 ),
        .Q(DBG_Slot0[12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][13] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][13]_i_1_n_0 ),
        .Q(DBG_Slot0[13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][14] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][14]_i_1_n_0 ),
        .Q(DBG_Slot0[14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][15] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][15]_i_2_n_0 ),
        .Q(DBG_Slot0[15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][1] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][1]_i_1_n_0 ),
        .Q(DBG_Slot0[1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][2] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][2]_i_1_n_0 ),
        .Q(DBG_Slot0[2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][3] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][3]_i_1_n_0 ),
        .Q(DBG_Slot0[3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][4] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][4]_i_1_n_0 ),
        .Q(DBG_Slot0[4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][5] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][5]_i_1_n_0 ),
        .Q(DBG_Slot0[5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][6] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][6]_i_1_n_0 ),
        .Q(DBG_Slot0[6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][7] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][7]_i_1_n_0 ),
        .Q(DBG_Slot0[7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][8] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][8]_i_1_n_0 ),
        .Q(DBG_Slot0[8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][9] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[0][SlotDrawEventID][9]_i_1_n_0 ),
        .Q(DBG_Slot0[9]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\slotsData[0][SlotIsValid]_i_1_n_0 ),
        .Q(\slotsData_reg[0][SlotIsValid]_0 ),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][0] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[0]),
        .Q(\slotsData_reg[1][SlotData] [0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][100] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[100]),
        .Q(\slotsData_reg[1][SlotData] [100]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][101] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[101]),
        .Q(\slotsData_reg[1][SlotData] [101]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][102] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[102]),
        .Q(\slotsData_reg[1][SlotData] [102]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][103] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[103]),
        .Q(\slotsData_reg[1][SlotData] [103]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][104] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[104]),
        .Q(\slotsData_reg[1][SlotData] [104]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][105] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[105]),
        .Q(\slotsData_reg[1][SlotData] [105]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][106] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[106]),
        .Q(\slotsData_reg[1][SlotData] [106]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][107] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[107]),
        .Q(\slotsData_reg[1][SlotData] [107]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][108] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[108]),
        .Q(\slotsData_reg[1][SlotData] [108]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][109] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[109]),
        .Q(\slotsData_reg[1][SlotData] [109]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][10] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[10]),
        .Q(\slotsData_reg[1][SlotData] [10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][110] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[110]),
        .Q(\slotsData_reg[1][SlotData] [110]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][111] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[111]),
        .Q(\slotsData_reg[1][SlotData] [111]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][112] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[112]),
        .Q(\slotsData_reg[1][SlotData] [112]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][113] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[113]),
        .Q(\slotsData_reg[1][SlotData] [113]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][114] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[114]),
        .Q(\slotsData_reg[1][SlotData] [114]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][115] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[115]),
        .Q(\slotsData_reg[1][SlotData] [115]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][116] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[116]),
        .Q(\slotsData_reg[1][SlotData] [116]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][117] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[117]),
        .Q(\slotsData_reg[1][SlotData] [117]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][118] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[118]),
        .Q(\slotsData_reg[1][SlotData] [118]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][119] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[119]),
        .Q(\slotsData_reg[1][SlotData] [119]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][11] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[11]),
        .Q(\slotsData_reg[1][SlotData] [11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][120] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[120]),
        .Q(\slotsData_reg[1][SlotData] [120]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][121] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[121]),
        .Q(\slotsData_reg[1][SlotData] [121]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][122] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[122]),
        .Q(\slotsData_reg[1][SlotData] [122]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][123] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[123]),
        .Q(\slotsData_reg[1][SlotData] [123]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][124] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[124]),
        .Q(\slotsData_reg[1][SlotData] [124]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][125] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[125]),
        .Q(\slotsData_reg[1][SlotData] [125]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][126] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[126]),
        .Q(\slotsData_reg[1][SlotData] [126]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][127] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[127]),
        .Q(\slotsData_reg[1][SlotData] [127]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][128] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[128]),
        .Q(\slotsData_reg[1][SlotData] [128]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][129] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[129]),
        .Q(\slotsData_reg[1][SlotData] [129]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][12] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[12]),
        .Q(\slotsData_reg[1][SlotData] [12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][130] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[130]),
        .Q(\slotsData_reg[1][SlotData] [130]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][131] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[131]),
        .Q(\slotsData_reg[1][SlotData] [131]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][132] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[132]),
        .Q(\slotsData_reg[1][SlotData] [132]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][133] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[133]),
        .Q(\slotsData_reg[1][SlotData] [133]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][134] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[134]),
        .Q(\slotsData_reg[1][SlotData] [134]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][135] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[135]),
        .Q(\slotsData_reg[1][SlotData] [135]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][136] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[136]),
        .Q(\slotsData_reg[1][SlotData] [136]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][137] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[137]),
        .Q(\slotsData_reg[1][SlotData] [137]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][138] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[138]),
        .Q(\slotsData_reg[1][SlotData] [138]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][139] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[139]),
        .Q(\slotsData_reg[1][SlotData] [139]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][13] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[13]),
        .Q(\slotsData_reg[1][SlotData] [13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][140] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[140]),
        .Q(\slotsData_reg[1][SlotData] [140]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][141] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[141]),
        .Q(\slotsData_reg[1][SlotData] [141]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][142] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[142]),
        .Q(\slotsData_reg[1][SlotData] [142]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][143] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[143]),
        .Q(\slotsData_reg[1][SlotData] [143]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][144] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[144]),
        .Q(\slotsData_reg[1][SlotData] [144]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][145] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[145]),
        .Q(\slotsData_reg[1][SlotData] [145]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][146] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[146]),
        .Q(\slotsData_reg[1][SlotData] [146]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][147] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[147]),
        .Q(\slotsData_reg[1][SlotData] [147]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][148] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[148]),
        .Q(\slotsData_reg[1][SlotData] [148]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][149] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[149]),
        .Q(\slotsData_reg[1][SlotData] [149]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][14] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[14]),
        .Q(\slotsData_reg[1][SlotData] [14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][150] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[150]),
        .Q(\slotsData_reg[1][SlotData] [150]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][151] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[151]),
        .Q(\slotsData_reg[1][SlotData] [151]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][152] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[152]),
        .Q(\slotsData_reg[1][SlotData] [152]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][153] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[153]),
        .Q(\slotsData_reg[1][SlotData] [153]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][154] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[154]),
        .Q(\slotsData_reg[1][SlotData] [154]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][155] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[155]),
        .Q(\slotsData_reg[1][SlotData] [155]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][156] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[156]),
        .Q(\slotsData_reg[1][SlotData] [156]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][157] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[157]),
        .Q(\slotsData_reg[1][SlotData] [157]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][158] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[158]),
        .Q(\slotsData_reg[1][SlotData] [158]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][159] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[159]),
        .Q(\slotsData_reg[1][SlotData] [159]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][15] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[15]),
        .Q(\slotsData_reg[1][SlotData] [15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][160] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[160]),
        .Q(\slotsData_reg[1][SlotData] [160]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][161] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[161]),
        .Q(\slotsData_reg[1][SlotData] [161]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][162] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[162]),
        .Q(\slotsData_reg[1][SlotData] [162]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][163] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[163]),
        .Q(\slotsData_reg[1][SlotData] [163]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][164] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[164]),
        .Q(\slotsData_reg[1][SlotData] [164]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][165] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[165]),
        .Q(\slotsData_reg[1][SlotData] [165]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][166] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[166]),
        .Q(\slotsData_reg[1][SlotData] [166]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][167] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[167]),
        .Q(\slotsData_reg[1][SlotData] [167]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][168] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[168]),
        .Q(\slotsData_reg[1][SlotData] [168]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][169] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[169]),
        .Q(\slotsData_reg[1][SlotData] [169]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][16] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[16]),
        .Q(\slotsData_reg[1][SlotData] [16]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][170] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[170]),
        .Q(\slotsData_reg[1][SlotData] [170]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][171] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[171]),
        .Q(\slotsData_reg[1][SlotData] [171]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][172] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[172]),
        .Q(\slotsData_reg[1][SlotData] [172]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][173] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[173]),
        .Q(\slotsData_reg[1][SlotData] [173]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][174] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[174]),
        .Q(\slotsData_reg[1][SlotData] [174]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][175] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[175]),
        .Q(\slotsData_reg[1][SlotData] [175]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][176] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[176]),
        .Q(\slotsData_reg[1][SlotData] [176]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][177] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[177]),
        .Q(\slotsData_reg[1][SlotData] [177]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][178] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[178]),
        .Q(\slotsData_reg[1][SlotData] [178]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][179] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[179]),
        .Q(\slotsData_reg[1][SlotData] [179]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][17] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[17]),
        .Q(\slotsData_reg[1][SlotData] [17]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][180] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[180]),
        .Q(\slotsData_reg[1][SlotData] [180]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][181] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[181]),
        .Q(\slotsData_reg[1][SlotData] [181]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][182] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[182]),
        .Q(\slotsData_reg[1][SlotData] [182]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][183] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[183]),
        .Q(\slotsData_reg[1][SlotData] [183]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][184] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[184]),
        .Q(\slotsData_reg[1][SlotData] [184]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][185] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[185]),
        .Q(\slotsData_reg[1][SlotData] [185]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][186] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[186]),
        .Q(\slotsData_reg[1][SlotData] [186]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][187] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[187]),
        .Q(\slotsData_reg[1][SlotData] [187]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][188] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[188]),
        .Q(\slotsData_reg[1][SlotData] [188]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][189] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[189]),
        .Q(\slotsData_reg[1][SlotData] [189]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][18] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[18]),
        .Q(\slotsData_reg[1][SlotData] [18]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][190] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[190]),
        .Q(\slotsData_reg[1][SlotData] [190]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][191] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[191]),
        .Q(\slotsData_reg[1][SlotData] [191]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][19] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[19]),
        .Q(\slotsData_reg[1][SlotData] [19]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][1] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[1]),
        .Q(\slotsData_reg[1][SlotData] [1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][20] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[20]),
        .Q(\slotsData_reg[1][SlotData] [20]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][21] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[21]),
        .Q(\slotsData_reg[1][SlotData] [21]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][22] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[22]),
        .Q(\slotsData_reg[1][SlotData] [22]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][23] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[23]),
        .Q(\slotsData_reg[1][SlotData] [23]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][24] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[24]),
        .Q(\slotsData_reg[1][SlotData] [24]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][25] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[25]),
        .Q(\slotsData_reg[1][SlotData] [25]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][26] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[26]),
        .Q(\slotsData_reg[1][SlotData] [26]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][27] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[27]),
        .Q(\slotsData_reg[1][SlotData] [27]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][28] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[28]),
        .Q(\slotsData_reg[1][SlotData] [28]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][29] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[29]),
        .Q(\slotsData_reg[1][SlotData] [29]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][2] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[2]),
        .Q(\slotsData_reg[1][SlotData] [2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][30] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[30]),
        .Q(\slotsData_reg[1][SlotData] [30]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][31] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[31]),
        .Q(\slotsData_reg[1][SlotData] [31]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][32] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[32]),
        .Q(\slotsData_reg[1][SlotData] [32]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][33] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[33]),
        .Q(\slotsData_reg[1][SlotData] [33]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][34] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[34]),
        .Q(\slotsData_reg[1][SlotData] [34]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][35] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[35]),
        .Q(\slotsData_reg[1][SlotData] [35]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][36] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[36]),
        .Q(\slotsData_reg[1][SlotData] [36]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][37] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[37]),
        .Q(\slotsData_reg[1][SlotData] [37]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][38] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[38]),
        .Q(\slotsData_reg[1][SlotData] [38]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][39] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[39]),
        .Q(\slotsData_reg[1][SlotData] [39]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][3] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[3]),
        .Q(\slotsData_reg[1][SlotData] [3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][40] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[40]),
        .Q(\slotsData_reg[1][SlotData] [40]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][41] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[41]),
        .Q(\slotsData_reg[1][SlotData] [41]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][42] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[42]),
        .Q(\slotsData_reg[1][SlotData] [42]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][43] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[43]),
        .Q(\slotsData_reg[1][SlotData] [43]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][44] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[44]),
        .Q(\slotsData_reg[1][SlotData] [44]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][45] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[45]),
        .Q(\slotsData_reg[1][SlotData] [45]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][46] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[46]),
        .Q(\slotsData_reg[1][SlotData] [46]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][47] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[47]),
        .Q(\slotsData_reg[1][SlotData] [47]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][48] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[48]),
        .Q(\slotsData_reg[1][SlotData] [48]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][49] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[49]),
        .Q(\slotsData_reg[1][SlotData] [49]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][4] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[4]),
        .Q(\slotsData_reg[1][SlotData] [4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][50] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[50]),
        .Q(\slotsData_reg[1][SlotData] [50]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][51] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[51]),
        .Q(\slotsData_reg[1][SlotData] [51]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][52] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[52]),
        .Q(\slotsData_reg[1][SlotData] [52]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][53] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[53]),
        .Q(\slotsData_reg[1][SlotData] [53]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][54] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[54]),
        .Q(\slotsData_reg[1][SlotData] [54]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][55] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[55]),
        .Q(\slotsData_reg[1][SlotData] [55]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][56] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[56]),
        .Q(\slotsData_reg[1][SlotData] [56]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][57] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[57]),
        .Q(\slotsData_reg[1][SlotData] [57]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][58] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[58]),
        .Q(\slotsData_reg[1][SlotData] [58]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][59] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[59]),
        .Q(\slotsData_reg[1][SlotData] [59]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][5] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[5]),
        .Q(\slotsData_reg[1][SlotData] [5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][60] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[60]),
        .Q(\slotsData_reg[1][SlotData] [60]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][61] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[61]),
        .Q(\slotsData_reg[1][SlotData] [61]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][62] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[62]),
        .Q(\slotsData_reg[1][SlotData] [62]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][63] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[63]),
        .Q(\slotsData_reg[1][SlotData] [63]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][64] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[64]),
        .Q(\slotsData_reg[1][SlotData] [64]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][65] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[65]),
        .Q(\slotsData_reg[1][SlotData] [65]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][66] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[66]),
        .Q(\slotsData_reg[1][SlotData] [66]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][67] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[67]),
        .Q(\slotsData_reg[1][SlotData] [67]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][68] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[68]),
        .Q(\slotsData_reg[1][SlotData] [68]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][69] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[69]),
        .Q(\slotsData_reg[1][SlotData] [69]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][6] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[6]),
        .Q(\slotsData_reg[1][SlotData] [6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][70] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[70]),
        .Q(\slotsData_reg[1][SlotData] [70]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][71] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[71]),
        .Q(\slotsData_reg[1][SlotData] [71]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][72] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[72]),
        .Q(\slotsData_reg[1][SlotData] [72]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][73] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[73]),
        .Q(\slotsData_reg[1][SlotData] [73]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][74] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[74]),
        .Q(\slotsData_reg[1][SlotData] [74]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][75] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[75]),
        .Q(\slotsData_reg[1][SlotData] [75]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][76] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[76]),
        .Q(\slotsData_reg[1][SlotData] [76]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][77] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[77]),
        .Q(\slotsData_reg[1][SlotData] [77]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][78] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[78]),
        .Q(\slotsData_reg[1][SlotData] [78]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][79] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[79]),
        .Q(\slotsData_reg[1][SlotData] [79]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][7] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[7]),
        .Q(\slotsData_reg[1][SlotData] [7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][80] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[80]),
        .Q(\slotsData_reg[1][SlotData] [80]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][81] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[81]),
        .Q(\slotsData_reg[1][SlotData] [81]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][82] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[82]),
        .Q(\slotsData_reg[1][SlotData] [82]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][83] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[83]),
        .Q(\slotsData_reg[1][SlotData] [83]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][84] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[84]),
        .Q(\slotsData_reg[1][SlotData] [84]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][85] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[85]),
        .Q(\slotsData_reg[1][SlotData] [85]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][86] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[86]),
        .Q(\slotsData_reg[1][SlotData] [86]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][87] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[87]),
        .Q(\slotsData_reg[1][SlotData] [87]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][88] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[88]),
        .Q(\slotsData_reg[1][SlotData] [88]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][89] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[89]),
        .Q(\slotsData_reg[1][SlotData] [89]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][8] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[8]),
        .Q(\slotsData_reg[1][SlotData] [8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][90] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[90]),
        .Q(\slotsData_reg[1][SlotData] [90]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][91] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[91]),
        .Q(\slotsData_reg[1][SlotData] [91]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][92] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[92]),
        .Q(\slotsData_reg[1][SlotData] [92]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][93] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[93]),
        .Q(\slotsData_reg[1][SlotData] [93]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][94] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[94]),
        .Q(\slotsData_reg[1][SlotData] [94]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][95] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[95]),
        .Q(\slotsData_reg[1][SlotData] [95]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][96] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[96]),
        .Q(\slotsData_reg[1][SlotData] [96]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][97] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[97]),
        .Q(\slotsData_reg[1][SlotData] [97]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][98] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[98]),
        .Q(\slotsData_reg[1][SlotData] [98]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][99] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[99]),
        .Q(\slotsData_reg[1][SlotData] [99]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotData][9] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[9]),
        .Q(\slotsData_reg[1][SlotData] [9]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][0] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][0]_i_1_n_0 ),
        .Q(DBG_Slot1[0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][10] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][10]_i_1_n_0 ),
        .Q(DBG_Slot1[10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][11] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][11]_i_1_n_0 ),
        .Q(DBG_Slot1[11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][12] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][12]_i_1_n_0 ),
        .Q(DBG_Slot1[12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][13] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][13]_i_1_n_0 ),
        .Q(DBG_Slot1[13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][14] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][14]_i_1_n_0 ),
        .Q(DBG_Slot1[14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][15] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][15]_i_2_n_0 ),
        .Q(DBG_Slot1[15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][1] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][1]_i_1_n_0 ),
        .Q(DBG_Slot1[1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][2] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][2]_i_1_n_0 ),
        .Q(DBG_Slot1[2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][3] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][3]_i_1_n_0 ),
        .Q(DBG_Slot1[3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][4] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][4]_i_1_n_0 ),
        .Q(DBG_Slot1[4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][5] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][5]_i_1_n_0 ),
        .Q(DBG_Slot1[5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][6] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][6]_i_1_n_0 ),
        .Q(DBG_Slot1[6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][7] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][7]_i_1_n_0 ),
        .Q(DBG_Slot1[7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][8] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][8]_i_1_n_0 ),
        .Q(DBG_Slot1[8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][9] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[1][SlotDrawEventID][9]_i_1_n_0 ),
        .Q(DBG_Slot1[9]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\slotsData[1][SlotIsValid]_i_1_n_0 ),
        .Q(\slotsData_reg[1][SlotIsValid]_0 ),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][0] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[0]),
        .Q(\slotsData_reg[2][SlotData] [0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][100] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[100]),
        .Q(\slotsData_reg[2][SlotData] [100]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][101] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[101]),
        .Q(\slotsData_reg[2][SlotData] [101]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][102] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[102]),
        .Q(\slotsData_reg[2][SlotData] [102]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][103] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[103]),
        .Q(\slotsData_reg[2][SlotData] [103]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][104] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[104]),
        .Q(\slotsData_reg[2][SlotData] [104]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][105] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[105]),
        .Q(\slotsData_reg[2][SlotData] [105]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][106] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[106]),
        .Q(\slotsData_reg[2][SlotData] [106]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][107] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[107]),
        .Q(\slotsData_reg[2][SlotData] [107]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][108] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[108]),
        .Q(\slotsData_reg[2][SlotData] [108]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][109] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[109]),
        .Q(\slotsData_reg[2][SlotData] [109]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][10] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[10]),
        .Q(\slotsData_reg[2][SlotData] [10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][110] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[110]),
        .Q(\slotsData_reg[2][SlotData] [110]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][111] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[111]),
        .Q(\slotsData_reg[2][SlotData] [111]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][112] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[112]),
        .Q(\slotsData_reg[2][SlotData] [112]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][113] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[113]),
        .Q(\slotsData_reg[2][SlotData] [113]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][114] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[114]),
        .Q(\slotsData_reg[2][SlotData] [114]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][115] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[115]),
        .Q(\slotsData_reg[2][SlotData] [115]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][116] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[116]),
        .Q(\slotsData_reg[2][SlotData] [116]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][117] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[117]),
        .Q(\slotsData_reg[2][SlotData] [117]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][118] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[118]),
        .Q(\slotsData_reg[2][SlotData] [118]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][119] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[119]),
        .Q(\slotsData_reg[2][SlotData] [119]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][11] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[11]),
        .Q(\slotsData_reg[2][SlotData] [11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][120] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[120]),
        .Q(\slotsData_reg[2][SlotData] [120]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][121] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[121]),
        .Q(\slotsData_reg[2][SlotData] [121]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][122] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[122]),
        .Q(\slotsData_reg[2][SlotData] [122]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][123] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[123]),
        .Q(\slotsData_reg[2][SlotData] [123]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][124] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[124]),
        .Q(\slotsData_reg[2][SlotData] [124]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][125] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[125]),
        .Q(\slotsData_reg[2][SlotData] [125]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][126] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[126]),
        .Q(\slotsData_reg[2][SlotData] [126]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][127] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[127]),
        .Q(\slotsData_reg[2][SlotData] [127]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][128] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[128]),
        .Q(\slotsData_reg[2][SlotData] [128]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][129] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[129]),
        .Q(\slotsData_reg[2][SlotData] [129]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][12] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[12]),
        .Q(\slotsData_reg[2][SlotData] [12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][130] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[130]),
        .Q(\slotsData_reg[2][SlotData] [130]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][131] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[131]),
        .Q(\slotsData_reg[2][SlotData] [131]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][132] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[132]),
        .Q(\slotsData_reg[2][SlotData] [132]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][133] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[133]),
        .Q(\slotsData_reg[2][SlotData] [133]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][134] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[134]),
        .Q(\slotsData_reg[2][SlotData] [134]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][135] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[135]),
        .Q(\slotsData_reg[2][SlotData] [135]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][136] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[136]),
        .Q(\slotsData_reg[2][SlotData] [136]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][137] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[137]),
        .Q(\slotsData_reg[2][SlotData] [137]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][138] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[138]),
        .Q(\slotsData_reg[2][SlotData] [138]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][139] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[139]),
        .Q(\slotsData_reg[2][SlotData] [139]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][13] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[13]),
        .Q(\slotsData_reg[2][SlotData] [13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][140] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[140]),
        .Q(\slotsData_reg[2][SlotData] [140]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][141] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[141]),
        .Q(\slotsData_reg[2][SlotData] [141]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][142] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[142]),
        .Q(\slotsData_reg[2][SlotData] [142]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][143] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[143]),
        .Q(\slotsData_reg[2][SlotData] [143]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][144] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[144]),
        .Q(\slotsData_reg[2][SlotData] [144]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][145] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[145]),
        .Q(\slotsData_reg[2][SlotData] [145]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][146] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[146]),
        .Q(\slotsData_reg[2][SlotData] [146]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][147] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[147]),
        .Q(\slotsData_reg[2][SlotData] [147]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][148] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[148]),
        .Q(\slotsData_reg[2][SlotData] [148]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][149] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[149]),
        .Q(\slotsData_reg[2][SlotData] [149]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][14] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[14]),
        .Q(\slotsData_reg[2][SlotData] [14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][150] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[150]),
        .Q(\slotsData_reg[2][SlotData] [150]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][151] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[151]),
        .Q(\slotsData_reg[2][SlotData] [151]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][152] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[152]),
        .Q(\slotsData_reg[2][SlotData] [152]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][153] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[153]),
        .Q(\slotsData_reg[2][SlotData] [153]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][154] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[154]),
        .Q(\slotsData_reg[2][SlotData] [154]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][155] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[155]),
        .Q(\slotsData_reg[2][SlotData] [155]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][156] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[156]),
        .Q(\slotsData_reg[2][SlotData] [156]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][157] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[157]),
        .Q(\slotsData_reg[2][SlotData] [157]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][158] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[158]),
        .Q(\slotsData_reg[2][SlotData] [158]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][159] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[159]),
        .Q(\slotsData_reg[2][SlotData] [159]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][15] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[15]),
        .Q(\slotsData_reg[2][SlotData] [15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][160] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[160]),
        .Q(\slotsData_reg[2][SlotData] [160]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][161] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[161]),
        .Q(\slotsData_reg[2][SlotData] [161]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][162] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[162]),
        .Q(\slotsData_reg[2][SlotData] [162]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][163] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[163]),
        .Q(\slotsData_reg[2][SlotData] [163]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][164] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[164]),
        .Q(\slotsData_reg[2][SlotData] [164]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][165] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[165]),
        .Q(\slotsData_reg[2][SlotData] [165]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][166] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[166]),
        .Q(\slotsData_reg[2][SlotData] [166]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][167] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[167]),
        .Q(\slotsData_reg[2][SlotData] [167]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][168] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[168]),
        .Q(\slotsData_reg[2][SlotData] [168]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][169] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[169]),
        .Q(\slotsData_reg[2][SlotData] [169]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][16] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[16]),
        .Q(\slotsData_reg[2][SlotData] [16]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][170] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[170]),
        .Q(\slotsData_reg[2][SlotData] [170]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][171] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[171]),
        .Q(\slotsData_reg[2][SlotData] [171]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][172] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[172]),
        .Q(\slotsData_reg[2][SlotData] [172]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][173] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[173]),
        .Q(\slotsData_reg[2][SlotData] [173]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][174] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[174]),
        .Q(\slotsData_reg[2][SlotData] [174]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][175] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[175]),
        .Q(\slotsData_reg[2][SlotData] [175]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][176] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[176]),
        .Q(\slotsData_reg[2][SlotData] [176]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][177] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[177]),
        .Q(\slotsData_reg[2][SlotData] [177]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][178] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[178]),
        .Q(\slotsData_reg[2][SlotData] [178]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][179] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[179]),
        .Q(\slotsData_reg[2][SlotData] [179]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][17] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[17]),
        .Q(\slotsData_reg[2][SlotData] [17]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][180] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[180]),
        .Q(\slotsData_reg[2][SlotData] [180]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][181] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[181]),
        .Q(\slotsData_reg[2][SlotData] [181]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][182] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[182]),
        .Q(\slotsData_reg[2][SlotData] [182]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][183] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[183]),
        .Q(\slotsData_reg[2][SlotData] [183]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][184] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[184]),
        .Q(\slotsData_reg[2][SlotData] [184]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][185] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[185]),
        .Q(\slotsData_reg[2][SlotData] [185]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][186] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[186]),
        .Q(\slotsData_reg[2][SlotData] [186]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][187] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[187]),
        .Q(\slotsData_reg[2][SlotData] [187]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][188] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[188]),
        .Q(\slotsData_reg[2][SlotData] [188]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][189] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[189]),
        .Q(\slotsData_reg[2][SlotData] [189]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][18] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[18]),
        .Q(\slotsData_reg[2][SlotData] [18]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][190] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[190]),
        .Q(\slotsData_reg[2][SlotData] [190]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][191] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[191]),
        .Q(\slotsData_reg[2][SlotData] [191]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][19] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[19]),
        .Q(\slotsData_reg[2][SlotData] [19]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][1] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[1]),
        .Q(\slotsData_reg[2][SlotData] [1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][20] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[20]),
        .Q(\slotsData_reg[2][SlotData] [20]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][21] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[21]),
        .Q(\slotsData_reg[2][SlotData] [21]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][22] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[22]),
        .Q(\slotsData_reg[2][SlotData] [22]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][23] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[23]),
        .Q(\slotsData_reg[2][SlotData] [23]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][24] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[24]),
        .Q(\slotsData_reg[2][SlotData] [24]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][25] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[25]),
        .Q(\slotsData_reg[2][SlotData] [25]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][26] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[26]),
        .Q(\slotsData_reg[2][SlotData] [26]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][27] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[27]),
        .Q(\slotsData_reg[2][SlotData] [27]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][28] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[28]),
        .Q(\slotsData_reg[2][SlotData] [28]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][29] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[29]),
        .Q(\slotsData_reg[2][SlotData] [29]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][2] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[2]),
        .Q(\slotsData_reg[2][SlotData] [2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][30] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[30]),
        .Q(\slotsData_reg[2][SlotData] [30]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][31] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[31]),
        .Q(\slotsData_reg[2][SlotData] [31]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][32] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[32]),
        .Q(\slotsData_reg[2][SlotData] [32]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][33] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[33]),
        .Q(\slotsData_reg[2][SlotData] [33]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][34] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[34]),
        .Q(\slotsData_reg[2][SlotData] [34]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][35] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[35]),
        .Q(\slotsData_reg[2][SlotData] [35]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][36] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[36]),
        .Q(\slotsData_reg[2][SlotData] [36]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][37] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[37]),
        .Q(\slotsData_reg[2][SlotData] [37]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][38] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[38]),
        .Q(\slotsData_reg[2][SlotData] [38]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][39] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[39]),
        .Q(\slotsData_reg[2][SlotData] [39]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][3] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[3]),
        .Q(\slotsData_reg[2][SlotData] [3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][40] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[40]),
        .Q(\slotsData_reg[2][SlotData] [40]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][41] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[41]),
        .Q(\slotsData_reg[2][SlotData] [41]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][42] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[42]),
        .Q(\slotsData_reg[2][SlotData] [42]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][43] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[43]),
        .Q(\slotsData_reg[2][SlotData] [43]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][44] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[44]),
        .Q(\slotsData_reg[2][SlotData] [44]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][45] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[45]),
        .Q(\slotsData_reg[2][SlotData] [45]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][46] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[46]),
        .Q(\slotsData_reg[2][SlotData] [46]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][47] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[47]),
        .Q(\slotsData_reg[2][SlotData] [47]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][48] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[48]),
        .Q(\slotsData_reg[2][SlotData] [48]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][49] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[49]),
        .Q(\slotsData_reg[2][SlotData] [49]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][4] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[4]),
        .Q(\slotsData_reg[2][SlotData] [4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][50] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[50]),
        .Q(\slotsData_reg[2][SlotData] [50]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][51] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[51]),
        .Q(\slotsData_reg[2][SlotData] [51]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][52] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[52]),
        .Q(\slotsData_reg[2][SlotData] [52]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][53] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[53]),
        .Q(\slotsData_reg[2][SlotData] [53]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][54] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[54]),
        .Q(\slotsData_reg[2][SlotData] [54]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][55] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[55]),
        .Q(\slotsData_reg[2][SlotData] [55]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][56] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[56]),
        .Q(\slotsData_reg[2][SlotData] [56]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][57] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[57]),
        .Q(\slotsData_reg[2][SlotData] [57]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][58] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[58]),
        .Q(\slotsData_reg[2][SlotData] [58]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][59] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[59]),
        .Q(\slotsData_reg[2][SlotData] [59]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][5] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[5]),
        .Q(\slotsData_reg[2][SlotData] [5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][60] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[60]),
        .Q(\slotsData_reg[2][SlotData] [60]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][61] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[61]),
        .Q(\slotsData_reg[2][SlotData] [61]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][62] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[62]),
        .Q(\slotsData_reg[2][SlotData] [62]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][63] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[63]),
        .Q(\slotsData_reg[2][SlotData] [63]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][64] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[64]),
        .Q(\slotsData_reg[2][SlotData] [64]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][65] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[65]),
        .Q(\slotsData_reg[2][SlotData] [65]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][66] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[66]),
        .Q(\slotsData_reg[2][SlotData] [66]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][67] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[67]),
        .Q(\slotsData_reg[2][SlotData] [67]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][68] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[68]),
        .Q(\slotsData_reg[2][SlotData] [68]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][69] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[69]),
        .Q(\slotsData_reg[2][SlotData] [69]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][6] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[6]),
        .Q(\slotsData_reg[2][SlotData] [6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][70] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[70]),
        .Q(\slotsData_reg[2][SlotData] [70]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][71] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[71]),
        .Q(\slotsData_reg[2][SlotData] [71]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][72] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[72]),
        .Q(\slotsData_reg[2][SlotData] [72]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][73] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[73]),
        .Q(\slotsData_reg[2][SlotData] [73]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][74] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[74]),
        .Q(\slotsData_reg[2][SlotData] [74]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][75] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[75]),
        .Q(\slotsData_reg[2][SlotData] [75]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][76] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[76]),
        .Q(\slotsData_reg[2][SlotData] [76]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][77] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[77]),
        .Q(\slotsData_reg[2][SlotData] [77]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][78] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[78]),
        .Q(\slotsData_reg[2][SlotData] [78]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][79] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[79]),
        .Q(\slotsData_reg[2][SlotData] [79]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][7] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[7]),
        .Q(\slotsData_reg[2][SlotData] [7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][80] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[80]),
        .Q(\slotsData_reg[2][SlotData] [80]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][81] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[81]),
        .Q(\slotsData_reg[2][SlotData] [81]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][82] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[82]),
        .Q(\slotsData_reg[2][SlotData] [82]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][83] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[83]),
        .Q(\slotsData_reg[2][SlotData] [83]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][84] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[84]),
        .Q(\slotsData_reg[2][SlotData] [84]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][85] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[85]),
        .Q(\slotsData_reg[2][SlotData] [85]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][86] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[86]),
        .Q(\slotsData_reg[2][SlotData] [86]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][87] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[87]),
        .Q(\slotsData_reg[2][SlotData] [87]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][88] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[88]),
        .Q(\slotsData_reg[2][SlotData] [88]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][89] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[89]),
        .Q(\slotsData_reg[2][SlotData] [89]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][8] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[8]),
        .Q(\slotsData_reg[2][SlotData] [8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][90] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[90]),
        .Q(\slotsData_reg[2][SlotData] [90]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][91] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[91]),
        .Q(\slotsData_reg[2][SlotData] [91]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][92] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[92]),
        .Q(\slotsData_reg[2][SlotData] [92]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][93] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[93]),
        .Q(\slotsData_reg[2][SlotData] [93]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][94] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[94]),
        .Q(\slotsData_reg[2][SlotData] [94]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][95] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[95]),
        .Q(\slotsData_reg[2][SlotData] [95]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][96] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[96]),
        .Q(\slotsData_reg[2][SlotData] [96]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][97] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[97]),
        .Q(\slotsData_reg[2][SlotData] [97]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][98] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[98]),
        .Q(\slotsData_reg[2][SlotData] [98]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][99] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[99]),
        .Q(\slotsData_reg[2][SlotData] [99]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotData][9] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[9]),
        .Q(\slotsData_reg[2][SlotData] [9]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][0] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][0]_i_1_n_0 ),
        .Q(DBG_Slot2[0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][10] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][10]_i_1_n_0 ),
        .Q(DBG_Slot2[10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][11] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][11]_i_1_n_0 ),
        .Q(DBG_Slot2[11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][12] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][12]_i_1_n_0 ),
        .Q(DBG_Slot2[12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][13] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][13]_i_1_n_0 ),
        .Q(DBG_Slot2[13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][14] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][14]_i_1_n_0 ),
        .Q(DBG_Slot2[14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][15] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][15]_i_2_n_0 ),
        .Q(DBG_Slot2[15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][1] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][1]_i_1_n_0 ),
        .Q(DBG_Slot2[1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][2] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][2]_i_1_n_0 ),
        .Q(DBG_Slot2[2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][3] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][3]_i_1_n_0 ),
        .Q(DBG_Slot2[3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][4] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][4]_i_1_n_0 ),
        .Q(DBG_Slot2[4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][5] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][5]_i_1_n_0 ),
        .Q(DBG_Slot2[5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][6] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][6]_i_1_n_0 ),
        .Q(DBG_Slot2[6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][7] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][7]_i_1_n_0 ),
        .Q(DBG_Slot2[7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][8] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][8]_i_1_n_0 ),
        .Q(DBG_Slot2[8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][9] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[2][SlotDrawEventID][9]_i_1_n_0 ),
        .Q(DBG_Slot2[9]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\slotsData[2][SlotIsValid]_i_1_n_0 ),
        .Q(\slotsData_reg[2][SlotIsValid]_0 ),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][0] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[0]),
        .Q(\slotsData_reg[3][SlotData] [0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][100] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[100]),
        .Q(\slotsData_reg[3][SlotData] [100]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][101] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[101]),
        .Q(\slotsData_reg[3][SlotData] [101]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][102] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[102]),
        .Q(\slotsData_reg[3][SlotData] [102]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][103] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[103]),
        .Q(\slotsData_reg[3][SlotData] [103]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][104] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[104]),
        .Q(\slotsData_reg[3][SlotData] [104]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][105] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[105]),
        .Q(\slotsData_reg[3][SlotData] [105]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][106] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[106]),
        .Q(\slotsData_reg[3][SlotData] [106]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][107] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[107]),
        .Q(\slotsData_reg[3][SlotData] [107]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][108] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[108]),
        .Q(\slotsData_reg[3][SlotData] [108]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][109] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[109]),
        .Q(\slotsData_reg[3][SlotData] [109]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][10] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[10]),
        .Q(\slotsData_reg[3][SlotData] [10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][110] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[110]),
        .Q(\slotsData_reg[3][SlotData] [110]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][111] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[111]),
        .Q(\slotsData_reg[3][SlotData] [111]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][112] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[112]),
        .Q(\slotsData_reg[3][SlotData] [112]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][113] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[113]),
        .Q(\slotsData_reg[3][SlotData] [113]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][114] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[114]),
        .Q(\slotsData_reg[3][SlotData] [114]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][115] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[115]),
        .Q(\slotsData_reg[3][SlotData] [115]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][116] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[116]),
        .Q(\slotsData_reg[3][SlotData] [116]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][117] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[117]),
        .Q(\slotsData_reg[3][SlotData] [117]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][118] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[118]),
        .Q(\slotsData_reg[3][SlotData] [118]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][119] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[119]),
        .Q(\slotsData_reg[3][SlotData] [119]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][11] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[11]),
        .Q(\slotsData_reg[3][SlotData] [11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][120] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[120]),
        .Q(\slotsData_reg[3][SlotData] [120]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][121] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[121]),
        .Q(\slotsData_reg[3][SlotData] [121]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][122] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[122]),
        .Q(\slotsData_reg[3][SlotData] [122]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][123] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[123]),
        .Q(\slotsData_reg[3][SlotData] [123]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][124] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[124]),
        .Q(\slotsData_reg[3][SlotData] [124]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][125] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[125]),
        .Q(\slotsData_reg[3][SlotData] [125]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][126] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[126]),
        .Q(\slotsData_reg[3][SlotData] [126]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][127] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[127]),
        .Q(\slotsData_reg[3][SlotData] [127]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][128] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[128]),
        .Q(\slotsData_reg[3][SlotData] [128]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][129] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[129]),
        .Q(\slotsData_reg[3][SlotData] [129]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][12] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[12]),
        .Q(\slotsData_reg[3][SlotData] [12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][130] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[130]),
        .Q(\slotsData_reg[3][SlotData] [130]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][131] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[131]),
        .Q(\slotsData_reg[3][SlotData] [131]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][132] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[132]),
        .Q(\slotsData_reg[3][SlotData] [132]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][133] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[133]),
        .Q(\slotsData_reg[3][SlotData] [133]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][134] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[134]),
        .Q(\slotsData_reg[3][SlotData] [134]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][135] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[135]),
        .Q(\slotsData_reg[3][SlotData] [135]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][136] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[136]),
        .Q(\slotsData_reg[3][SlotData] [136]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][137] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[137]),
        .Q(\slotsData_reg[3][SlotData] [137]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][138] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[138]),
        .Q(\slotsData_reg[3][SlotData] [138]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][139] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[139]),
        .Q(\slotsData_reg[3][SlotData] [139]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][13] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[13]),
        .Q(\slotsData_reg[3][SlotData] [13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][140] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[140]),
        .Q(\slotsData_reg[3][SlotData] [140]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][141] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[141]),
        .Q(\slotsData_reg[3][SlotData] [141]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][142] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[142]),
        .Q(\slotsData_reg[3][SlotData] [142]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][143] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[143]),
        .Q(\slotsData_reg[3][SlotData] [143]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][144] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[144]),
        .Q(\slotsData_reg[3][SlotData] [144]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][145] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[145]),
        .Q(\slotsData_reg[3][SlotData] [145]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][146] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[146]),
        .Q(\slotsData_reg[3][SlotData] [146]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][147] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[147]),
        .Q(\slotsData_reg[3][SlotData] [147]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][148] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[148]),
        .Q(\slotsData_reg[3][SlotData] [148]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][149] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[149]),
        .Q(\slotsData_reg[3][SlotData] [149]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][14] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[14]),
        .Q(\slotsData_reg[3][SlotData] [14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][150] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[150]),
        .Q(\slotsData_reg[3][SlotData] [150]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][151] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[151]),
        .Q(\slotsData_reg[3][SlotData] [151]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][152] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[152]),
        .Q(\slotsData_reg[3][SlotData] [152]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][153] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[153]),
        .Q(\slotsData_reg[3][SlotData] [153]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][154] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[154]),
        .Q(\slotsData_reg[3][SlotData] [154]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][155] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[155]),
        .Q(\slotsData_reg[3][SlotData] [155]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][156] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[156]),
        .Q(\slotsData_reg[3][SlotData] [156]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][157] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[157]),
        .Q(\slotsData_reg[3][SlotData] [157]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][158] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[158]),
        .Q(\slotsData_reg[3][SlotData] [158]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][159] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[159]),
        .Q(\slotsData_reg[3][SlotData] [159]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][15] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[15]),
        .Q(\slotsData_reg[3][SlotData] [15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][160] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[160]),
        .Q(\slotsData_reg[3][SlotData] [160]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][161] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[161]),
        .Q(\slotsData_reg[3][SlotData] [161]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][162] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[162]),
        .Q(\slotsData_reg[3][SlotData] [162]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][163] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[163]),
        .Q(\slotsData_reg[3][SlotData] [163]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][164] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[164]),
        .Q(\slotsData_reg[3][SlotData] [164]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][165] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[165]),
        .Q(\slotsData_reg[3][SlotData] [165]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][166] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[166]),
        .Q(\slotsData_reg[3][SlotData] [166]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][167] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[167]),
        .Q(\slotsData_reg[3][SlotData] [167]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][168] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[168]),
        .Q(\slotsData_reg[3][SlotData] [168]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][169] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[169]),
        .Q(\slotsData_reg[3][SlotData] [169]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][16] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[16]),
        .Q(\slotsData_reg[3][SlotData] [16]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][170] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[170]),
        .Q(\slotsData_reg[3][SlotData] [170]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][171] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[171]),
        .Q(\slotsData_reg[3][SlotData] [171]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][172] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[172]),
        .Q(\slotsData_reg[3][SlotData] [172]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][173] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[173]),
        .Q(\slotsData_reg[3][SlotData] [173]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][174] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[174]),
        .Q(\slotsData_reg[3][SlotData] [174]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][175] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[175]),
        .Q(\slotsData_reg[3][SlotData] [175]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][176] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[176]),
        .Q(\slotsData_reg[3][SlotData] [176]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][177] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[177]),
        .Q(\slotsData_reg[3][SlotData] [177]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][178] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[178]),
        .Q(\slotsData_reg[3][SlotData] [178]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][179] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[179]),
        .Q(\slotsData_reg[3][SlotData] [179]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][17] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[17]),
        .Q(\slotsData_reg[3][SlotData] [17]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][180] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[180]),
        .Q(\slotsData_reg[3][SlotData] [180]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][181] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[181]),
        .Q(\slotsData_reg[3][SlotData] [181]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][182] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[182]),
        .Q(\slotsData_reg[3][SlotData] [182]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][183] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[183]),
        .Q(\slotsData_reg[3][SlotData] [183]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][184] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[184]),
        .Q(\slotsData_reg[3][SlotData] [184]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][185] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[185]),
        .Q(\slotsData_reg[3][SlotData] [185]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][186] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[186]),
        .Q(\slotsData_reg[3][SlotData] [186]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][187] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[187]),
        .Q(\slotsData_reg[3][SlotData] [187]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][188] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[188]),
        .Q(\slotsData_reg[3][SlotData] [188]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][189] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[189]),
        .Q(\slotsData_reg[3][SlotData] [189]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][18] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[18]),
        .Q(\slotsData_reg[3][SlotData] [18]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][190] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[190]),
        .Q(\slotsData_reg[3][SlotData] [190]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][191] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[191]),
        .Q(\slotsData_reg[3][SlotData] [191]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][19] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[19]),
        .Q(\slotsData_reg[3][SlotData] [19]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][1] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[1]),
        .Q(\slotsData_reg[3][SlotData] [1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][20] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[20]),
        .Q(\slotsData_reg[3][SlotData] [20]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][21] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[21]),
        .Q(\slotsData_reg[3][SlotData] [21]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][22] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[22]),
        .Q(\slotsData_reg[3][SlotData] [22]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][23] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[23]),
        .Q(\slotsData_reg[3][SlotData] [23]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][24] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[24]),
        .Q(\slotsData_reg[3][SlotData] [24]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][25] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[25]),
        .Q(\slotsData_reg[3][SlotData] [25]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][26] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[26]),
        .Q(\slotsData_reg[3][SlotData] [26]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][27] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[27]),
        .Q(\slotsData_reg[3][SlotData] [27]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][28] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[28]),
        .Q(\slotsData_reg[3][SlotData] [28]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][29] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[29]),
        .Q(\slotsData_reg[3][SlotData] [29]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][2] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[2]),
        .Q(\slotsData_reg[3][SlotData] [2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][30] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[30]),
        .Q(\slotsData_reg[3][SlotData] [30]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][31] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[31]),
        .Q(\slotsData_reg[3][SlotData] [31]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][32] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[32]),
        .Q(\slotsData_reg[3][SlotData] [32]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][33] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[33]),
        .Q(\slotsData_reg[3][SlotData] [33]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][34] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[34]),
        .Q(\slotsData_reg[3][SlotData] [34]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][35] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[35]),
        .Q(\slotsData_reg[3][SlotData] [35]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][36] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[36]),
        .Q(\slotsData_reg[3][SlotData] [36]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][37] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[37]),
        .Q(\slotsData_reg[3][SlotData] [37]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][38] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[38]),
        .Q(\slotsData_reg[3][SlotData] [38]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][39] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[39]),
        .Q(\slotsData_reg[3][SlotData] [39]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][3] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[3]),
        .Q(\slotsData_reg[3][SlotData] [3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][40] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[40]),
        .Q(\slotsData_reg[3][SlotData] [40]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][41] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[41]),
        .Q(\slotsData_reg[3][SlotData] [41]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][42] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[42]),
        .Q(\slotsData_reg[3][SlotData] [42]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][43] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[43]),
        .Q(\slotsData_reg[3][SlotData] [43]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][44] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[44]),
        .Q(\slotsData_reg[3][SlotData] [44]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][45] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[45]),
        .Q(\slotsData_reg[3][SlotData] [45]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][46] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[46]),
        .Q(\slotsData_reg[3][SlotData] [46]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][47] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[47]),
        .Q(\slotsData_reg[3][SlotData] [47]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][48] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[48]),
        .Q(\slotsData_reg[3][SlotData] [48]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][49] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[49]),
        .Q(\slotsData_reg[3][SlotData] [49]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][4] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[4]),
        .Q(\slotsData_reg[3][SlotData] [4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][50] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[50]),
        .Q(\slotsData_reg[3][SlotData] [50]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][51] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[51]),
        .Q(\slotsData_reg[3][SlotData] [51]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][52] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[52]),
        .Q(\slotsData_reg[3][SlotData] [52]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][53] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[53]),
        .Q(\slotsData_reg[3][SlotData] [53]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][54] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[54]),
        .Q(\slotsData_reg[3][SlotData] [54]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][55] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[55]),
        .Q(\slotsData_reg[3][SlotData] [55]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][56] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[56]),
        .Q(\slotsData_reg[3][SlotData] [56]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][57] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[57]),
        .Q(\slotsData_reg[3][SlotData] [57]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][58] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[58]),
        .Q(\slotsData_reg[3][SlotData] [58]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][59] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[59]),
        .Q(\slotsData_reg[3][SlotData] [59]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][5] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[5]),
        .Q(\slotsData_reg[3][SlotData] [5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][60] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[60]),
        .Q(\slotsData_reg[3][SlotData] [60]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][61] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[61]),
        .Q(\slotsData_reg[3][SlotData] [61]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][62] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[62]),
        .Q(\slotsData_reg[3][SlotData] [62]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][63] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[63]),
        .Q(\slotsData_reg[3][SlotData] [63]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][64] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[64]),
        .Q(\slotsData_reg[3][SlotData] [64]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][65] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[65]),
        .Q(\slotsData_reg[3][SlotData] [65]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][66] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[66]),
        .Q(\slotsData_reg[3][SlotData] [66]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][67] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[67]),
        .Q(\slotsData_reg[3][SlotData] [67]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][68] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[68]),
        .Q(\slotsData_reg[3][SlotData] [68]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][69] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[69]),
        .Q(\slotsData_reg[3][SlotData] [69]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][6] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[6]),
        .Q(\slotsData_reg[3][SlotData] [6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][70] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[70]),
        .Q(\slotsData_reg[3][SlotData] [70]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][71] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[71]),
        .Q(\slotsData_reg[3][SlotData] [71]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][72] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[72]),
        .Q(\slotsData_reg[3][SlotData] [72]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][73] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[73]),
        .Q(\slotsData_reg[3][SlotData] [73]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][74] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[74]),
        .Q(\slotsData_reg[3][SlotData] [74]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][75] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[75]),
        .Q(\slotsData_reg[3][SlotData] [75]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][76] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[76]),
        .Q(\slotsData_reg[3][SlotData] [76]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][77] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[77]),
        .Q(\slotsData_reg[3][SlotData] [77]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][78] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[78]),
        .Q(\slotsData_reg[3][SlotData] [78]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][79] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[79]),
        .Q(\slotsData_reg[3][SlotData] [79]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][7] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[7]),
        .Q(\slotsData_reg[3][SlotData] [7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][80] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[80]),
        .Q(\slotsData_reg[3][SlotData] [80]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][81] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[81]),
        .Q(\slotsData_reg[3][SlotData] [81]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][82] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[82]),
        .Q(\slotsData_reg[3][SlotData] [82]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][83] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[83]),
        .Q(\slotsData_reg[3][SlotData] [83]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][84] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[84]),
        .Q(\slotsData_reg[3][SlotData] [84]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][85] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[85]),
        .Q(\slotsData_reg[3][SlotData] [85]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][86] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[86]),
        .Q(\slotsData_reg[3][SlotData] [86]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][87] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[87]),
        .Q(\slotsData_reg[3][SlotData] [87]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][88] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[88]),
        .Q(\slotsData_reg[3][SlotData] [88]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][89] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[89]),
        .Q(\slotsData_reg[3][SlotData] [89]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][8] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[8]),
        .Q(\slotsData_reg[3][SlotData] [8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][90] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[90]),
        .Q(\slotsData_reg[3][SlotData] [90]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][91] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[91]),
        .Q(\slotsData_reg[3][SlotData] [91]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][92] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[92]),
        .Q(\slotsData_reg[3][SlotData] [92]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][93] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[93]),
        .Q(\slotsData_reg[3][SlotData] [93]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][94] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[94]),
        .Q(\slotsData_reg[3][SlotData] [94]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][95] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[95]),
        .Q(\slotsData_reg[3][SlotData] [95]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][96] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[96]),
        .Q(\slotsData_reg[3][SlotData] [96]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][97] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[97]),
        .Q(\slotsData_reg[3][SlotData] [97]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][98] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[98]),
        .Q(\slotsData_reg[3][SlotData] [98]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][99] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[99]),
        .Q(\slotsData_reg[3][SlotData] [99]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotData][9] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[9]),
        .Q(\slotsData_reg[3][SlotData] [9]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][0] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][0]_i_1_n_0 ),
        .Q(DBG_Slot3[0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][10] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][10]_i_1_n_0 ),
        .Q(DBG_Slot3[10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][11] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][11]_i_1_n_0 ),
        .Q(DBG_Slot3[11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][12] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][12]_i_1_n_0 ),
        .Q(DBG_Slot3[12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][13] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][13]_i_1_n_0 ),
        .Q(DBG_Slot3[13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][14] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][14]_i_1_n_0 ),
        .Q(DBG_Slot3[14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][15] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][15]_i_2_n_0 ),
        .Q(DBG_Slot3[15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][1] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][1]_i_1_n_0 ),
        .Q(DBG_Slot3[1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][2] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][2]_i_1_n_0 ),
        .Q(DBG_Slot3[2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][3] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][3]_i_1_n_0 ),
        .Q(DBG_Slot3[3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][4] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][4]_i_1_n_0 ),
        .Q(DBG_Slot3[4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][5] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][5]_i_1_n_0 ),
        .Q(DBG_Slot3[5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][6] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][6]_i_1_n_0 ),
        .Q(DBG_Slot3[6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][7] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][7]_i_1_n_0 ),
        .Q(DBG_Slot3[7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][8] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][8]_i_1_n_0 ),
        .Q(DBG_Slot3[8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][9] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .D(\slotsData[3][SlotDrawEventID][9]_i_1_n_0 ),
        .Q(DBG_Slot3[9]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\slotsData[3][SlotIsValid]_i_1_n_0 ),
        .Q(\slotsData_reg[3][SlotIsValid]_0 ),
        .R(CMD_EndFrameReset));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
