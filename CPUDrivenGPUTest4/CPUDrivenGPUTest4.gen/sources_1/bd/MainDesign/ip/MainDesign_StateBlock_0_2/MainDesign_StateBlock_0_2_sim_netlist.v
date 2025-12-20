// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:50:22 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StateBlock_0_2/MainDesign_StateBlock_0_2_sim_netlist.v
// Design      : MainDesign_StateBlock_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_StateBlock_0_2,StateBlock,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "StateBlock,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_StateBlock_0_2
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
  input [10:0]CMD_NewStateBits;
  input [15:0]CMD_NewStateDrawEventID;
  output [10:0]STAGE_StateBitsAtDrawID;
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
  wire [10:0]CMD_NewStateBits;
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
  wire [10:0]STAGE_StateBitsAtDrawID;
  wire STAGE_StateIsValid;
  wire clk;

  MainDesign_StateBlock_0_2_StateBlock U0
       (.CMD_EndFrameReset(CMD_EndFrameReset),
        .CMD_NewStateBits(CMD_NewStateBits),
        .CMD_NewStateDrawEventID(CMD_NewStateDrawEventID),
        .CMD_NumFreeSlots(CMD_NumFreeSlots),
        .CMD_SetNewState(CMD_SetNewState),
        .DBG_Slot0(DBG_Slot0),
        .DBG_Slot1(DBG_Slot1),
        .DBG_Slot2(DBG_Slot2),
        .DBG_Slot3(DBG_Slot3),
        .Q(DBG_CurrentReadSlotIndex),
        .STAGE_ConsumeStateSlot(STAGE_ConsumeStateSlot),
        .STAGE_NextDrawID(STAGE_NextDrawID),
        .STAGE_StateBitsAtDrawID(STAGE_StateBitsAtDrawID),
        .STAGE_StateIsValid(STAGE_StateIsValid),
        .clk(clk),
        .\currentWriteSlot_reg[1]_0 (DBG_CurrentWriteSlotIndex),
        .\slotsData_reg[0][SlotIsValid]_0 (DBG_SlotsValid[0]),
        .\slotsData_reg[1][SlotIsValid]_0 (DBG_SlotsValid[1]),
        .\slotsData_reg[2][SlotIsValid]_0 (DBG_SlotsValid[2]),
        .\slotsData_reg[3][SlotIsValid]_0 (DBG_SlotsValid[3]));
endmodule

(* ORIG_REF_NAME = "StateBlock" *) 
module MainDesign_StateBlock_0_2_StateBlock
   (CMD_NumFreeSlots,
    \slotsData_reg[2][SlotIsValid]_0 ,
    \slotsData_reg[1][SlotIsValid]_0 ,
    \slotsData_reg[3][SlotIsValid]_0 ,
    \slotsData_reg[0][SlotIsValid]_0 ,
    Q,
    \currentWriteSlot_reg[1]_0 ,
    DBG_Slot3,
    DBG_Slot2,
    DBG_Slot1,
    DBG_Slot0,
    STAGE_StateBitsAtDrawID,
    STAGE_NextDrawID,
    STAGE_StateIsValid,
    CMD_EndFrameReset,
    CMD_SetNewState,
    clk,
    STAGE_ConsumeStateSlot,
    CMD_NewStateBits,
    CMD_NewStateDrawEventID);
  output [2:0]CMD_NumFreeSlots;
  output \slotsData_reg[2][SlotIsValid]_0 ;
  output \slotsData_reg[1][SlotIsValid]_0 ;
  output \slotsData_reg[3][SlotIsValid]_0 ;
  output \slotsData_reg[0][SlotIsValid]_0 ;
  output [1:0]Q;
  output [1:0]\currentWriteSlot_reg[1]_0 ;
  output [15:0]DBG_Slot3;
  output [15:0]DBG_Slot2;
  output [15:0]DBG_Slot1;
  output [15:0]DBG_Slot0;
  output [10:0]STAGE_StateBitsAtDrawID;
  output [15:0]STAGE_NextDrawID;
  output STAGE_StateIsValid;
  input CMD_EndFrameReset;
  input CMD_SetNewState;
  input clk;
  input STAGE_ConsumeStateSlot;
  input [10:0]CMD_NewStateBits;
  input [15:0]CMD_NewStateDrawEventID;

  wire CMD_EndFrameReset;
  wire [10:0]CMD_NewStateBits;
  wire [15:0]CMD_NewStateDrawEventID;
  wire [2:0]CMD_NumFreeSlots;
  wire CMD_SetNewState;
  wire [15:0]DBG_Slot0;
  wire [15:0]DBG_Slot1;
  wire [15:0]DBG_Slot2;
  wire [15:0]DBG_Slot3;
  wire [1:0]Q;
  wire STAGE_ConsumeStateSlot;
  wire [15:0]STAGE_NextDrawID;
  wire [10:0]STAGE_StateBitsAtDrawID;
  wire STAGE_StateIsValid;
  wire clk;
  wire \currentReadSlot[0]_i_1_n_0 ;
  wire \currentReadSlot[1]_i_1_n_0 ;
  wire [1:0]\currentWriteSlot_reg[1]_0 ;
  wire [1:0]plusOp;
  wire \slotsData[0][SlotDrawEventID][0]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][10]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][11]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][12]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][13]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][14]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][15]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][1]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][2]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][3]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][4]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][5]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][6]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][7]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][8]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID][9]_i_1_n_0 ;
  wire \slotsData[0][SlotDrawEventID_n_0_] ;
  wire \slotsData[0][SlotIsValid]1_out ;
  wire \slotsData[0][SlotIsValid]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][0]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][10]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][11]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][12]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][13]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][14]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][15]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][1]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][2]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][3]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][4]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][5]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][6]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][7]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][8]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID][9]_i_1_n_0 ;
  wire \slotsData[1][SlotDrawEventID_n_0_] ;
  wire \slotsData[1][SlotIsValid]3_out ;
  wire \slotsData[1][SlotIsValid]_i_1_n_0 ;
  wire \slotsData[1][SlotIsValid]_i_2_n_0 ;
  wire \slotsData[2][SlotDrawEventID][0]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][10]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][11]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][12]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][13]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][14]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][15]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][1]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][2]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][3]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][4]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][5]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][6]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][7]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][8]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID][9]_i_1_n_0 ;
  wire \slotsData[2][SlotDrawEventID_n_0_] ;
  wire \slotsData[2][SlotIsValid]5_out ;
  wire \slotsData[2][SlotIsValid]_i_1_n_0 ;
  wire \slotsData[2][SlotIsValid]_i_2_n_0 ;
  wire \slotsData[3][SlotDrawEventID][0]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][10]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][11]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][12]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][13]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][14]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][15]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][1]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][2]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][3]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][4]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][5]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][6]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][7]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][8]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID][9]_i_1_n_0 ;
  wire \slotsData[3][SlotDrawEventID_n_0_] ;
  wire \slotsData[3][SlotIsValid]7_out ;
  wire \slotsData[3][SlotIsValid]_i_1_n_0 ;
  wire \slotsData[3][SlotIsValid]_i_2_n_0 ;
  wire [10:0]\slotsData_reg[0][SlotData] ;
  wire \slotsData_reg[0][SlotIsValid]0_in ;
  wire \slotsData_reg[0][SlotIsValid]_0 ;
  wire [10:0]\slotsData_reg[1][SlotData] ;
  wire \slotsData_reg[1][SlotIsValid]_0 ;
  wire [10:0]\slotsData_reg[2][SlotData] ;
  wire \slotsData_reg[2][SlotIsValid]_0 ;
  wire [10:0]\slotsData_reg[3][SlotData] ;
  wire \slotsData_reg[3][SlotIsValid]_0 ;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \CMD_NumFreeSlots[0]_INST_0 
       (.I0(\slotsData_reg[2][SlotIsValid]_0 ),
        .I1(\slotsData_reg[1][SlotIsValid]_0 ),
        .I2(\slotsData_reg[3][SlotIsValid]_0 ),
        .I3(\slotsData_reg[0][SlotIsValid]_0 ),
        .O(CMD_NumFreeSlots[0]));
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
       (.I0(\slotsData_reg[0][SlotIsValid]_0 ),
        .I1(\slotsData_reg[3][SlotIsValid]_0 ),
        .I2(\slotsData_reg[1][SlotIsValid]_0 ),
        .I3(\slotsData_reg[2][SlotIsValid]_0 ),
        .O(CMD_NumFreeSlots[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[0]_INST_0 
       (.I0(DBG_Slot1[0]),
        .I1(DBG_Slot0[0]),
        .I2(DBG_Slot3[0]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[0]),
        .O(STAGE_NextDrawID[0]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[10]_INST_0 
       (.I0(DBG_Slot1[10]),
        .I1(DBG_Slot0[10]),
        .I2(DBG_Slot3[10]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[10]),
        .O(STAGE_NextDrawID[10]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[11]_INST_0 
       (.I0(DBG_Slot1[11]),
        .I1(DBG_Slot0[11]),
        .I2(DBG_Slot3[11]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[11]),
        .O(STAGE_NextDrawID[11]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[12]_INST_0 
       (.I0(DBG_Slot1[12]),
        .I1(DBG_Slot0[12]),
        .I2(DBG_Slot3[12]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[12]),
        .O(STAGE_NextDrawID[12]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[13]_INST_0 
       (.I0(DBG_Slot1[13]),
        .I1(DBG_Slot0[13]),
        .I2(DBG_Slot3[13]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[13]),
        .O(STAGE_NextDrawID[13]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[14]_INST_0 
       (.I0(DBG_Slot1[14]),
        .I1(DBG_Slot0[14]),
        .I2(DBG_Slot3[14]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[14]),
        .O(STAGE_NextDrawID[14]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[15]_INST_0 
       (.I0(DBG_Slot1[15]),
        .I1(DBG_Slot0[15]),
        .I2(DBG_Slot3[15]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[15]),
        .O(STAGE_NextDrawID[15]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[1]_INST_0 
       (.I0(DBG_Slot1[1]),
        .I1(DBG_Slot0[1]),
        .I2(DBG_Slot3[1]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[1]),
        .O(STAGE_NextDrawID[1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[2]_INST_0 
       (.I0(DBG_Slot1[2]),
        .I1(DBG_Slot0[2]),
        .I2(DBG_Slot3[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[2]),
        .O(STAGE_NextDrawID[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[3]_INST_0 
       (.I0(DBG_Slot1[3]),
        .I1(DBG_Slot0[3]),
        .I2(DBG_Slot3[3]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[3]),
        .O(STAGE_NextDrawID[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[4]_INST_0 
       (.I0(DBG_Slot1[4]),
        .I1(DBG_Slot0[4]),
        .I2(DBG_Slot3[4]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[4]),
        .O(STAGE_NextDrawID[4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[5]_INST_0 
       (.I0(DBG_Slot1[5]),
        .I1(DBG_Slot0[5]),
        .I2(DBG_Slot3[5]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[5]),
        .O(STAGE_NextDrawID[5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[6]_INST_0 
       (.I0(DBG_Slot1[6]),
        .I1(DBG_Slot0[6]),
        .I2(DBG_Slot3[6]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[6]),
        .O(STAGE_NextDrawID[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[7]_INST_0 
       (.I0(DBG_Slot1[7]),
        .I1(DBG_Slot0[7]),
        .I2(DBG_Slot3[7]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[7]),
        .O(STAGE_NextDrawID[7]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[8]_INST_0 
       (.I0(DBG_Slot1[8]),
        .I1(DBG_Slot0[8]),
        .I2(DBG_Slot3[8]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[8]),
        .O(STAGE_NextDrawID[8]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_NextDrawID[9]_INST_0 
       (.I0(DBG_Slot1[9]),
        .I1(DBG_Slot0[9]),
        .I2(DBG_Slot3[9]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(DBG_Slot2[9]),
        .O(STAGE_NextDrawID[9]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[0]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [0]),
        .I1(\slotsData_reg[0][SlotData] [0]),
        .I2(\slotsData_reg[3][SlotData] [0]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [0]),
        .O(STAGE_StateBitsAtDrawID[0]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[10]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [10]),
        .I1(\slotsData_reg[0][SlotData] [10]),
        .I2(\slotsData_reg[3][SlotData] [10]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [10]),
        .O(STAGE_StateBitsAtDrawID[10]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[1]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [1]),
        .I1(\slotsData_reg[0][SlotData] [1]),
        .I2(\slotsData_reg[3][SlotData] [1]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [1]),
        .O(STAGE_StateBitsAtDrawID[1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[2]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [2]),
        .I1(\slotsData_reg[0][SlotData] [2]),
        .I2(\slotsData_reg[3][SlotData] [2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [2]),
        .O(STAGE_StateBitsAtDrawID[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[3]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [3]),
        .I1(\slotsData_reg[0][SlotData] [3]),
        .I2(\slotsData_reg[3][SlotData] [3]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [3]),
        .O(STAGE_StateBitsAtDrawID[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[4]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [4]),
        .I1(\slotsData_reg[0][SlotData] [4]),
        .I2(\slotsData_reg[3][SlotData] [4]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [4]),
        .O(STAGE_StateBitsAtDrawID[4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[5]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [5]),
        .I1(\slotsData_reg[0][SlotData] [5]),
        .I2(\slotsData_reg[3][SlotData] [5]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [5]),
        .O(STAGE_StateBitsAtDrawID[5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[6]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [6]),
        .I1(\slotsData_reg[0][SlotData] [6]),
        .I2(\slotsData_reg[3][SlotData] [6]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [6]),
        .O(STAGE_StateBitsAtDrawID[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[7]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [7]),
        .I1(\slotsData_reg[0][SlotData] [7]),
        .I2(\slotsData_reg[3][SlotData] [7]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [7]),
        .O(STAGE_StateBitsAtDrawID[7]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[8]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [8]),
        .I1(\slotsData_reg[0][SlotData] [8]),
        .I2(\slotsData_reg[3][SlotData] [8]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [8]),
        .O(STAGE_StateBitsAtDrawID[8]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[9]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [9]),
        .I1(\slotsData_reg[0][SlotData] [9]),
        .I2(\slotsData_reg[3][SlotData] [9]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [9]),
        .O(STAGE_StateBitsAtDrawID[9]));
  LUT1 #(
    .INIT(2'h1)) 
    \currentReadSlot[0]_i_1 
       (.I0(Q[0]),
        .O(\currentReadSlot[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \currentReadSlot[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\currentReadSlot[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadSlot_reg[0] 
       (.C(clk),
        .CE(STAGE_ConsumeStateSlot),
        .D(\currentReadSlot[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadSlot_reg[1] 
       (.C(clk),
        .CE(STAGE_ConsumeStateSlot),
        .D(\currentReadSlot[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(CMD_EndFrameReset));
  LUT1 #(
    .INIT(2'h1)) 
    \currentWriteSlot[0]_i_1 
       (.I0(\currentWriteSlot_reg[1]_0 [0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \currentWriteSlot[1]_i_1 
       (.I0(\currentWriteSlot_reg[1]_0 [0]),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .O(plusOp[1]));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteSlot_reg[0] 
       (.C(clk),
        .CE(CMD_SetNewState),
        .D(plusOp[0]),
        .Q(\currentWriteSlot_reg[1]_0 [0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteSlot_reg[1] 
       (.C(clk),
        .CE(CMD_SetNewState),
        .D(plusOp[1]),
        .Q(\currentWriteSlot_reg[1]_0 [1]),
        .R(CMD_EndFrameReset));
  LUT3 #(
    .INIT(8'h02)) 
    \slotsData[0][SlotData][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [0]),
        .I2(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[0][SlotIsValid]1_out ));
  LUT6 #(
    .INIT(64'h101010101010FF10)) 
    \slotsData[0][SlotDrawEventID] 
       (.I0(\currentWriteSlot_reg[1]_0 [1]),
        .I1(\currentWriteSlot_reg[1]_0 [0]),
        .I2(CMD_SetNewState),
        .I3(STAGE_ConsumeStateSlot),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\slotsData[0][SlotDrawEventID_n_0_] ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][0]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[0]),
        .O(\slotsData[0][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[10]),
        .O(\slotsData[0][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][11]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[11]),
        .O(\slotsData[0][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][12]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[12]),
        .O(\slotsData[0][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][13]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[13]),
        .O(\slotsData[0][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][14]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[14]),
        .O(\slotsData[0][SlotDrawEventID][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][15]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[15]),
        .O(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][1]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[1]),
        .O(\slotsData[0][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][2]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[2]),
        .O(\slotsData[0][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][3]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[3]),
        .O(\slotsData[0][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][4]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[4]),
        .O(\slotsData[0][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][5]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[5]),
        .O(\slotsData[0][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][6]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[6]),
        .O(\slotsData[0][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][7]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[7]),
        .O(\slotsData[0][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][8]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[8]),
        .O(\slotsData[0][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][9]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(CMD_NewStateDrawEventID[9]),
        .O(\slotsData[0][SlotDrawEventID][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \slotsData[0][SlotIsValid] 
       (.I0(\slotsData_reg[1][SlotIsValid]_0 ),
        .I1(\slotsData_reg[0][SlotIsValid]_0 ),
        .I2(\slotsData_reg[3][SlotIsValid]_0 ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotIsValid]_0 ),
        .O(STAGE_StateIsValid));
  LUT6 #(
    .INIT(64'hFFEFEFEFFF000000)) 
    \slotsData[0][SlotIsValid]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(STAGE_ConsumeStateSlot),
        .I3(\slotsData_reg[0][SlotIsValid]0_in ),
        .I4(CMD_SetNewState),
        .I5(\slotsData_reg[0][SlotIsValid]_0 ),
        .O(\slotsData[0][SlotIsValid]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \slotsData[0][SlotIsValid]_i_2 
       (.I0(\currentWriteSlot_reg[1]_0 [1]),
        .I1(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData_reg[0][SlotIsValid]0_in ));
  LUT3 #(
    .INIT(8'h20)) 
    \slotsData[1][SlotData][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotIsValid]3_out ));
  LUT6 #(
    .INIT(64'h4040FF4040404040)) 
    \slotsData[1][SlotDrawEventID] 
       (.I0(\currentWriteSlot_reg[1]_0 [1]),
        .I1(\currentWriteSlot_reg[1]_0 [0]),
        .I2(CMD_SetNewState),
        .I3(STAGE_ConsumeStateSlot),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\slotsData[1][SlotDrawEventID_n_0_] ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][0]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[0]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[10]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][11]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[11]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][12]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[12]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][13]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[13]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][14]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[14]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][15]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[15]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][1]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[1]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][2]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[2]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][3]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[3]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][4]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[4]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][5]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[5]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][6]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[6]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][7]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[7]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][8]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[8]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][9]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[9]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[1][SlotDrawEventID][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h77F7777700F00000)) 
    \slotsData[1][SlotIsValid]_i_1 
       (.I0(\slotsData[1][SlotIsValid]_i_2_n_0 ),
        .I1(STAGE_ConsumeStateSlot),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .I4(CMD_SetNewState),
        .I5(\slotsData_reg[1][SlotIsValid]_0 ),
        .O(\slotsData[1][SlotIsValid]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \slotsData[1][SlotIsValid]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\slotsData[1][SlotIsValid]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \slotsData[2][SlotData][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [0]),
        .I2(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[2][SlotIsValid]5_out ));
  LUT6 #(
    .INIT(64'h4040FF4040404040)) 
    \slotsData[2][SlotDrawEventID] 
       (.I0(\currentWriteSlot_reg[1]_0 [0]),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_SetNewState),
        .I3(STAGE_ConsumeStateSlot),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\slotsData[2][SlotDrawEventID_n_0_] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][0]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[0]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[10]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][11]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[11]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][12]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[12]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][13]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[13]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][14]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[14]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][15]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[15]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][1]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[1]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][2]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[2]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][3]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[3]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][4]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[4]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][5]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[5]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][6]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[6]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][7]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[7]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][8]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[8]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][9]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(CMD_NewStateDrawEventID[9]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[2][SlotDrawEventID][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h77F7777700F00000)) 
    \slotsData[2][SlotIsValid]_i_1 
       (.I0(\slotsData[2][SlotIsValid]_i_2_n_0 ),
        .I1(STAGE_ConsumeStateSlot),
        .I2(\currentWriteSlot_reg[1]_0 [1]),
        .I3(\currentWriteSlot_reg[1]_0 [0]),
        .I4(CMD_SetNewState),
        .I5(\slotsData_reg[2][SlotIsValid]_0 ),
        .O(\slotsData[2][SlotIsValid]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \slotsData[2][SlotIsValid]_i_2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\slotsData[2][SlotIsValid]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \slotsData[3][SlotData][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\currentWriteSlot_reg[1]_0 [1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .O(\slotsData[3][SlotIsValid]7_out ));
  LUT6 #(
    .INIT(64'hFF80808080808080)) 
    \slotsData[3][SlotDrawEventID] 
       (.I0(\currentWriteSlot_reg[1]_0 [1]),
        .I1(\currentWriteSlot_reg[1]_0 [0]),
        .I2(CMD_SetNewState),
        .I3(STAGE_ConsumeStateSlot),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\slotsData[3][SlotDrawEventID_n_0_] ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][0]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[0]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[10]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][11]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[11]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][12]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[12]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][13]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[13]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][14]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[14]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][15]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[15]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][1]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[1]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][2]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[2]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][3]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[3]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][4]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[4]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][5]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[5]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][6]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[6]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][7]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[7]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][8]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[8]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][9]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[9]),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .O(\slotsData[3][SlotDrawEventID][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7777777F0000000)) 
    \slotsData[3][SlotIsValid]_i_1 
       (.I0(\slotsData[3][SlotIsValid]_i_2_n_0 ),
        .I1(STAGE_ConsumeStateSlot),
        .I2(\currentWriteSlot_reg[1]_0 [0]),
        .I3(\currentWriteSlot_reg[1]_0 [1]),
        .I4(CMD_SetNewState),
        .I5(\slotsData_reg[3][SlotIsValid]_0 ),
        .O(\slotsData[3][SlotIsValid]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \slotsData[3][SlotIsValid]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\slotsData[3][SlotIsValid]_i_2_n_0 ));
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
    \slotsData_reg[0][SlotData][10] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[10]),
        .Q(\slotsData_reg[0][SlotData] [10]),
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
    \slotsData_reg[0][SlotData][2] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[2]),
        .Q(\slotsData_reg[0][SlotData] [2]),
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
    \slotsData_reg[0][SlotData][4] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[4]),
        .Q(\slotsData_reg[0][SlotData] [4]),
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
    \slotsData_reg[0][SlotData][6] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[6]),
        .Q(\slotsData_reg[0][SlotData] [6]),
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
    \slotsData_reg[0][SlotData][8] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[8]),
        .Q(\slotsData_reg[0][SlotData] [8]),
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
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][0]_i_1_n_0 ),
        .Q(DBG_Slot0[0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][10] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][10]_i_1_n_0 ),
        .Q(DBG_Slot0[10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][11] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][11]_i_1_n_0 ),
        .Q(DBG_Slot0[11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][12] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][12]_i_1_n_0 ),
        .Q(DBG_Slot0[12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][13] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][13]_i_1_n_0 ),
        .Q(DBG_Slot0[13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][14] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][14]_i_1_n_0 ),
        .Q(DBG_Slot0[14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][15] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ),
        .Q(DBG_Slot0[15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][1] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][1]_i_1_n_0 ),
        .Q(DBG_Slot0[1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][2] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][2]_i_1_n_0 ),
        .Q(DBG_Slot0[2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][3] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][3]_i_1_n_0 ),
        .Q(DBG_Slot0[3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][4] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][4]_i_1_n_0 ),
        .Q(DBG_Slot0[4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][5] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][5]_i_1_n_0 ),
        .Q(DBG_Slot0[5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][6] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][6]_i_1_n_0 ),
        .Q(DBG_Slot0[6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][7] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][7]_i_1_n_0 ),
        .Q(DBG_Slot0[7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][8] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
        .D(\slotsData[0][SlotDrawEventID][8]_i_1_n_0 ),
        .Q(DBG_Slot0[8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[0][SlotDrawEventID][9] 
       (.C(clk),
        .CE(\slotsData[0][SlotDrawEventID_n_0_] ),
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
    \slotsData_reg[1][SlotData][10] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[10]),
        .Q(\slotsData_reg[1][SlotData] [10]),
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
    \slotsData_reg[1][SlotData][2] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[2]),
        .Q(\slotsData_reg[1][SlotData] [2]),
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
    \slotsData_reg[1][SlotData][4] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[4]),
        .Q(\slotsData_reg[1][SlotData] [4]),
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
    \slotsData_reg[1][SlotData][6] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[6]),
        .Q(\slotsData_reg[1][SlotData] [6]),
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
    \slotsData_reg[1][SlotData][8] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[8]),
        .Q(\slotsData_reg[1][SlotData] [8]),
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
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][0]_i_1_n_0 ),
        .Q(DBG_Slot1[0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][10] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][10]_i_1_n_0 ),
        .Q(DBG_Slot1[10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][11] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][11]_i_1_n_0 ),
        .Q(DBG_Slot1[11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][12] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][12]_i_1_n_0 ),
        .Q(DBG_Slot1[12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][13] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][13]_i_1_n_0 ),
        .Q(DBG_Slot1[13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][14] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][14]_i_1_n_0 ),
        .Q(DBG_Slot1[14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][15] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ),
        .Q(DBG_Slot1[15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][1] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][1]_i_1_n_0 ),
        .Q(DBG_Slot1[1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][2] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][2]_i_1_n_0 ),
        .Q(DBG_Slot1[2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][3] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][3]_i_1_n_0 ),
        .Q(DBG_Slot1[3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][4] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][4]_i_1_n_0 ),
        .Q(DBG_Slot1[4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][5] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][5]_i_1_n_0 ),
        .Q(DBG_Slot1[5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][6] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][6]_i_1_n_0 ),
        .Q(DBG_Slot1[6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][7] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][7]_i_1_n_0 ),
        .Q(DBG_Slot1[7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][8] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
        .D(\slotsData[1][SlotDrawEventID][8]_i_1_n_0 ),
        .Q(DBG_Slot1[8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[1][SlotDrawEventID][9] 
       (.C(clk),
        .CE(\slotsData[1][SlotDrawEventID_n_0_] ),
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
    \slotsData_reg[2][SlotData][10] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[10]),
        .Q(\slotsData_reg[2][SlotData] [10]),
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
    \slotsData_reg[2][SlotData][2] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[2]),
        .Q(\slotsData_reg[2][SlotData] [2]),
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
    \slotsData_reg[2][SlotData][4] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[4]),
        .Q(\slotsData_reg[2][SlotData] [4]),
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
    \slotsData_reg[2][SlotData][6] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[6]),
        .Q(\slotsData_reg[2][SlotData] [6]),
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
    \slotsData_reg[2][SlotData][8] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[8]),
        .Q(\slotsData_reg[2][SlotData] [8]),
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
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][0]_i_1_n_0 ),
        .Q(DBG_Slot2[0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][10] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][10]_i_1_n_0 ),
        .Q(DBG_Slot2[10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][11] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][11]_i_1_n_0 ),
        .Q(DBG_Slot2[11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][12] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][12]_i_1_n_0 ),
        .Q(DBG_Slot2[12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][13] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][13]_i_1_n_0 ),
        .Q(DBG_Slot2[13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][14] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][14]_i_1_n_0 ),
        .Q(DBG_Slot2[14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][15] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ),
        .Q(DBG_Slot2[15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][1] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][1]_i_1_n_0 ),
        .Q(DBG_Slot2[1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][2] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][2]_i_1_n_0 ),
        .Q(DBG_Slot2[2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][3] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][3]_i_1_n_0 ),
        .Q(DBG_Slot2[3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][4] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][4]_i_1_n_0 ),
        .Q(DBG_Slot2[4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][5] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][5]_i_1_n_0 ),
        .Q(DBG_Slot2[5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][6] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][6]_i_1_n_0 ),
        .Q(DBG_Slot2[6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][7] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][7]_i_1_n_0 ),
        .Q(DBG_Slot2[7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][8] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
        .D(\slotsData[2][SlotDrawEventID][8]_i_1_n_0 ),
        .Q(DBG_Slot2[8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[2][SlotDrawEventID][9] 
       (.C(clk),
        .CE(\slotsData[2][SlotDrawEventID_n_0_] ),
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
    \slotsData_reg[3][SlotData][10] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[10]),
        .Q(\slotsData_reg[3][SlotData] [10]),
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
    \slotsData_reg[3][SlotData][2] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[2]),
        .Q(\slotsData_reg[3][SlotData] [2]),
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
    \slotsData_reg[3][SlotData][4] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[4]),
        .Q(\slotsData_reg[3][SlotData] [4]),
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
    \slotsData_reg[3][SlotData][6] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[6]),
        .Q(\slotsData_reg[3][SlotData] [6]),
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
    \slotsData_reg[3][SlotData][8] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[8]),
        .Q(\slotsData_reg[3][SlotData] [8]),
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
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][0]_i_1_n_0 ),
        .Q(DBG_Slot3[0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][10] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][10]_i_1_n_0 ),
        .Q(DBG_Slot3[10]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][11] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][11]_i_1_n_0 ),
        .Q(DBG_Slot3[11]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][12] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][12]_i_1_n_0 ),
        .Q(DBG_Slot3[12]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][13] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][13]_i_1_n_0 ),
        .Q(DBG_Slot3[13]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][14] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][14]_i_1_n_0 ),
        .Q(DBG_Slot3[14]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][15] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ),
        .Q(DBG_Slot3[15]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][1] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][1]_i_1_n_0 ),
        .Q(DBG_Slot3[1]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][2] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][2]_i_1_n_0 ),
        .Q(DBG_Slot3[2]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][3] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][3]_i_1_n_0 ),
        .Q(DBG_Slot3[3]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][4] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][4]_i_1_n_0 ),
        .Q(DBG_Slot3[4]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][5] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][5]_i_1_n_0 ),
        .Q(DBG_Slot3[5]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][6] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][6]_i_1_n_0 ),
        .Q(DBG_Slot3[6]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][7] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][7]_i_1_n_0 ),
        .Q(DBG_Slot3[7]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][8] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
        .D(\slotsData[3][SlotDrawEventID][8]_i_1_n_0 ),
        .Q(DBG_Slot3[8]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \slotsData_reg[3][SlotDrawEventID][9] 
       (.C(clk),
        .CE(\slotsData[3][SlotDrawEventID_n_0_] ),
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
