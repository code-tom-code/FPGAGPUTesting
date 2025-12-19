// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Fri Apr 25 20:02:13 2025
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_StateBlock_0_3/design_1_StateBlock_0_3_sim_netlist.v
// Design      : design_1_StateBlock_0_3
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_StateBlock_0_3,StateBlock,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "StateBlock,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_StateBlock_0_3
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
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk" *) input clk;
  input CMD_SetNewState;
  input CMD_EndFrameReset;
  output [2:0]CMD_NumFreeSlots;
  input [76:0]CMD_NewStateBits;
  input [15:0]CMD_NewStateDrawEventID;
  output [76:0]STAGE_StateBitsAtDrawID;
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
  wire [76:0]CMD_NewStateBits;
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
  wire [76:0]STAGE_StateBitsAtDrawID;
  wire STAGE_StateIsValid;
  wire clk;

  design_1_StateBlock_0_3_StateBlock U0
       (.CMD_EndFrameReset(CMD_EndFrameReset),
        .CMD_NewStateBits(CMD_NewStateBits),
        .CMD_NewStateDrawEventID(CMD_NewStateDrawEventID),
        .CMD_NumFreeSlots(CMD_NumFreeSlots),
        .CMD_SetNewState(CMD_SetNewState),
        .\DBG_CurrentWriteSlotIndex[1] (DBG_CurrentWriteSlotIndex),
        .DBG_Slot0(DBG_Slot0),
        .DBG_Slot1(DBG_Slot1),
        .DBG_Slot2(DBG_Slot2),
        .DBG_Slot3(DBG_Slot3),
        .\DBG_SlotsValid[0] (DBG_SlotsValid[0]),
        .\DBG_SlotsValid[1] (DBG_SlotsValid[1]),
        .\DBG_SlotsValid[2] (DBG_SlotsValid[2]),
        .\DBG_SlotsValid[3] (DBG_SlotsValid[3]),
        .Q(DBG_CurrentReadSlotIndex),
        .STAGE_ConsumeStateSlot(STAGE_ConsumeStateSlot),
        .STAGE_NextDrawID(STAGE_NextDrawID),
        .STAGE_StateBitsAtDrawID(STAGE_StateBitsAtDrawID),
        .STAGE_StateIsValid(STAGE_StateIsValid),
        .clk(clk));
endmodule

(* ORIG_REF_NAME = "StateBlock" *) 
module design_1_StateBlock_0_3_StateBlock
   (CMD_NumFreeSlots,
    \DBG_SlotsValid[2] ,
    \DBG_SlotsValid[1] ,
    \DBG_SlotsValid[3] ,
    \DBG_SlotsValid[0] ,
    Q,
    \DBG_CurrentWriteSlotIndex[1] ,
    DBG_Slot3,
    DBG_Slot2,
    DBG_Slot1,
    DBG_Slot0,
    STAGE_StateIsValid,
    STAGE_StateBitsAtDrawID,
    STAGE_NextDrawID,
    CMD_EndFrameReset,
    CMD_SetNewState,
    clk,
    STAGE_ConsumeStateSlot,
    CMD_NewStateBits,
    CMD_NewStateDrawEventID);
  output [2:0]CMD_NumFreeSlots;
  output \DBG_SlotsValid[2] ;
  output \DBG_SlotsValid[1] ;
  output \DBG_SlotsValid[3] ;
  output \DBG_SlotsValid[0] ;
  output [1:0]Q;
  output [1:0]\DBG_CurrentWriteSlotIndex[1] ;
  output [15:0]DBG_Slot3;
  output [15:0]DBG_Slot2;
  output [15:0]DBG_Slot1;
  output [15:0]DBG_Slot0;
  output STAGE_StateIsValid;
  output [76:0]STAGE_StateBitsAtDrawID;
  output [15:0]STAGE_NextDrawID;
  input CMD_EndFrameReset;
  input CMD_SetNewState;
  input clk;
  input STAGE_ConsumeStateSlot;
  input [76:0]CMD_NewStateBits;
  input [15:0]CMD_NewStateDrawEventID;

  wire CMD_EndFrameReset;
  wire [76:0]CMD_NewStateBits;
  wire [15:0]CMD_NewStateDrawEventID;
  wire [2:0]CMD_NumFreeSlots;
  wire CMD_SetNewState;
  wire [1:0]\DBG_CurrentWriteSlotIndex[1] ;
  wire [15:0]DBG_Slot0;
  wire [15:0]DBG_Slot1;
  wire [15:0]DBG_Slot2;
  wire [15:0]DBG_Slot3;
  wire \DBG_SlotsValid[0] ;
  wire \DBG_SlotsValid[1] ;
  wire \DBG_SlotsValid[2] ;
  wire \DBG_SlotsValid[3] ;
  wire [1:0]Q;
  wire STAGE_ConsumeStateSlot;
  wire [15:0]STAGE_NextDrawID;
  wire [76:0]STAGE_StateBitsAtDrawID;
  wire STAGE_StateIsValid;
  wire clk;
  wire \currentReadSlot[0]_i_1_n_0 ;
  wire \currentReadSlot[1]_i_1_n_0 ;
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
  wire \slotsData[0][SlotIsValid]_i_2_n_0 ;
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
  wire [76:0]\slotsData_reg[0][SlotData] ;
  wire [76:0]\slotsData_reg[1][SlotData] ;
  wire [76:0]\slotsData_reg[2][SlotData] ;
  wire [76:0]\slotsData_reg[3][SlotData] ;

  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    \CMD_NumFreeSlots[0]_INST_0 
       (.I0(\DBG_SlotsValid[2] ),
        .I1(\DBG_SlotsValid[1] ),
        .I2(\DBG_SlotsValid[3] ),
        .I3(\DBG_SlotsValid[0] ),
        .O(CMD_NumFreeSlots[0]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'h177E)) 
    \CMD_NumFreeSlots[1]_INST_0 
       (.I0(\DBG_SlotsValid[0] ),
        .I1(\DBG_SlotsValid[3] ),
        .I2(\DBG_SlotsValid[2] ),
        .I3(\DBG_SlotsValid[1] ),
        .O(CMD_NumFreeSlots[1]));
  LUT4 #(
    .INIT(16'h0001)) 
    \CMD_NumFreeSlots[2]_INST_0 
       (.I0(\DBG_SlotsValid[0] ),
        .I1(\DBG_SlotsValid[3] ),
        .I2(\DBG_SlotsValid[1] ),
        .I3(\DBG_SlotsValid[2] ),
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
    \STAGE_StateBitsAtDrawID[11]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [11]),
        .I1(\slotsData_reg[0][SlotData] [11]),
        .I2(\slotsData_reg[3][SlotData] [11]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [11]),
        .O(STAGE_StateBitsAtDrawID[11]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[12]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [12]),
        .I1(\slotsData_reg[0][SlotData] [12]),
        .I2(\slotsData_reg[3][SlotData] [12]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [12]),
        .O(STAGE_StateBitsAtDrawID[12]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[13]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [13]),
        .I1(\slotsData_reg[0][SlotData] [13]),
        .I2(\slotsData_reg[3][SlotData] [13]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [13]),
        .O(STAGE_StateBitsAtDrawID[13]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[14]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [14]),
        .I1(\slotsData_reg[0][SlotData] [14]),
        .I2(\slotsData_reg[3][SlotData] [14]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [14]),
        .O(STAGE_StateBitsAtDrawID[14]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[15]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [15]),
        .I1(\slotsData_reg[0][SlotData] [15]),
        .I2(\slotsData_reg[3][SlotData] [15]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [15]),
        .O(STAGE_StateBitsAtDrawID[15]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[16]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [16]),
        .I1(\slotsData_reg[0][SlotData] [16]),
        .I2(\slotsData_reg[3][SlotData] [16]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [16]),
        .O(STAGE_StateBitsAtDrawID[16]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[17]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [17]),
        .I1(\slotsData_reg[0][SlotData] [17]),
        .I2(\slotsData_reg[3][SlotData] [17]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [17]),
        .O(STAGE_StateBitsAtDrawID[17]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[18]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [18]),
        .I1(\slotsData_reg[0][SlotData] [18]),
        .I2(\slotsData_reg[3][SlotData] [18]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [18]),
        .O(STAGE_StateBitsAtDrawID[18]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[19]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [19]),
        .I1(\slotsData_reg[0][SlotData] [19]),
        .I2(\slotsData_reg[3][SlotData] [19]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [19]),
        .O(STAGE_StateBitsAtDrawID[19]));
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
    \STAGE_StateBitsAtDrawID[20]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [20]),
        .I1(\slotsData_reg[0][SlotData] [20]),
        .I2(\slotsData_reg[3][SlotData] [20]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [20]),
        .O(STAGE_StateBitsAtDrawID[20]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[21]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [21]),
        .I1(\slotsData_reg[0][SlotData] [21]),
        .I2(\slotsData_reg[3][SlotData] [21]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [21]),
        .O(STAGE_StateBitsAtDrawID[21]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[22]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [22]),
        .I1(\slotsData_reg[0][SlotData] [22]),
        .I2(\slotsData_reg[3][SlotData] [22]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [22]),
        .O(STAGE_StateBitsAtDrawID[22]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[23]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [23]),
        .I1(\slotsData_reg[0][SlotData] [23]),
        .I2(\slotsData_reg[3][SlotData] [23]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [23]),
        .O(STAGE_StateBitsAtDrawID[23]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[24]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [24]),
        .I1(\slotsData_reg[0][SlotData] [24]),
        .I2(\slotsData_reg[3][SlotData] [24]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [24]),
        .O(STAGE_StateBitsAtDrawID[24]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[25]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [25]),
        .I1(\slotsData_reg[0][SlotData] [25]),
        .I2(\slotsData_reg[3][SlotData] [25]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [25]),
        .O(STAGE_StateBitsAtDrawID[25]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[26]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [26]),
        .I1(\slotsData_reg[0][SlotData] [26]),
        .I2(\slotsData_reg[3][SlotData] [26]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [26]),
        .O(STAGE_StateBitsAtDrawID[26]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[27]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [27]),
        .I1(\slotsData_reg[0][SlotData] [27]),
        .I2(\slotsData_reg[3][SlotData] [27]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [27]),
        .O(STAGE_StateBitsAtDrawID[27]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[28]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [28]),
        .I1(\slotsData_reg[0][SlotData] [28]),
        .I2(\slotsData_reg[3][SlotData] [28]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [28]),
        .O(STAGE_StateBitsAtDrawID[28]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[29]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [29]),
        .I1(\slotsData_reg[0][SlotData] [29]),
        .I2(\slotsData_reg[3][SlotData] [29]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [29]),
        .O(STAGE_StateBitsAtDrawID[29]));
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
    \STAGE_StateBitsAtDrawID[30]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [30]),
        .I1(\slotsData_reg[0][SlotData] [30]),
        .I2(\slotsData_reg[3][SlotData] [30]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [30]),
        .O(STAGE_StateBitsAtDrawID[30]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[31]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [31]),
        .I1(\slotsData_reg[0][SlotData] [31]),
        .I2(\slotsData_reg[3][SlotData] [31]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [31]),
        .O(STAGE_StateBitsAtDrawID[31]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[32]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [32]),
        .I1(\slotsData_reg[0][SlotData] [32]),
        .I2(\slotsData_reg[3][SlotData] [32]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [32]),
        .O(STAGE_StateBitsAtDrawID[32]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[33]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [33]),
        .I1(\slotsData_reg[0][SlotData] [33]),
        .I2(\slotsData_reg[3][SlotData] [33]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [33]),
        .O(STAGE_StateBitsAtDrawID[33]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[34]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [34]),
        .I1(\slotsData_reg[0][SlotData] [34]),
        .I2(\slotsData_reg[3][SlotData] [34]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [34]),
        .O(STAGE_StateBitsAtDrawID[34]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[35]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [35]),
        .I1(\slotsData_reg[0][SlotData] [35]),
        .I2(\slotsData_reg[3][SlotData] [35]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [35]),
        .O(STAGE_StateBitsAtDrawID[35]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[36]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [36]),
        .I1(\slotsData_reg[0][SlotData] [36]),
        .I2(\slotsData_reg[3][SlotData] [36]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [36]),
        .O(STAGE_StateBitsAtDrawID[36]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[37]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [37]),
        .I1(\slotsData_reg[0][SlotData] [37]),
        .I2(\slotsData_reg[3][SlotData] [37]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [37]),
        .O(STAGE_StateBitsAtDrawID[37]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[38]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [38]),
        .I1(\slotsData_reg[0][SlotData] [38]),
        .I2(\slotsData_reg[3][SlotData] [38]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [38]),
        .O(STAGE_StateBitsAtDrawID[38]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[39]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [39]),
        .I1(\slotsData_reg[0][SlotData] [39]),
        .I2(\slotsData_reg[3][SlotData] [39]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [39]),
        .O(STAGE_StateBitsAtDrawID[39]));
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
    \STAGE_StateBitsAtDrawID[40]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [40]),
        .I1(\slotsData_reg[0][SlotData] [40]),
        .I2(\slotsData_reg[3][SlotData] [40]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [40]),
        .O(STAGE_StateBitsAtDrawID[40]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[41]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [41]),
        .I1(\slotsData_reg[0][SlotData] [41]),
        .I2(\slotsData_reg[3][SlotData] [41]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [41]),
        .O(STAGE_StateBitsAtDrawID[41]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[42]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [42]),
        .I1(\slotsData_reg[0][SlotData] [42]),
        .I2(\slotsData_reg[3][SlotData] [42]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [42]),
        .O(STAGE_StateBitsAtDrawID[42]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[43]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [43]),
        .I1(\slotsData_reg[0][SlotData] [43]),
        .I2(\slotsData_reg[3][SlotData] [43]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [43]),
        .O(STAGE_StateBitsAtDrawID[43]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[44]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [44]),
        .I1(\slotsData_reg[0][SlotData] [44]),
        .I2(\slotsData_reg[3][SlotData] [44]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [44]),
        .O(STAGE_StateBitsAtDrawID[44]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[45]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [45]),
        .I1(\slotsData_reg[0][SlotData] [45]),
        .I2(\slotsData_reg[3][SlotData] [45]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [45]),
        .O(STAGE_StateBitsAtDrawID[45]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[46]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [46]),
        .I1(\slotsData_reg[0][SlotData] [46]),
        .I2(\slotsData_reg[3][SlotData] [46]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [46]),
        .O(STAGE_StateBitsAtDrawID[46]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[47]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [47]),
        .I1(\slotsData_reg[0][SlotData] [47]),
        .I2(\slotsData_reg[3][SlotData] [47]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [47]),
        .O(STAGE_StateBitsAtDrawID[47]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[48]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [48]),
        .I1(\slotsData_reg[0][SlotData] [48]),
        .I2(\slotsData_reg[3][SlotData] [48]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [48]),
        .O(STAGE_StateBitsAtDrawID[48]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[49]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [49]),
        .I1(\slotsData_reg[0][SlotData] [49]),
        .I2(\slotsData_reg[3][SlotData] [49]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [49]),
        .O(STAGE_StateBitsAtDrawID[49]));
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
    \STAGE_StateBitsAtDrawID[50]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [50]),
        .I1(\slotsData_reg[0][SlotData] [50]),
        .I2(\slotsData_reg[3][SlotData] [50]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [50]),
        .O(STAGE_StateBitsAtDrawID[50]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[51]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [51]),
        .I1(\slotsData_reg[0][SlotData] [51]),
        .I2(\slotsData_reg[3][SlotData] [51]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [51]),
        .O(STAGE_StateBitsAtDrawID[51]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[52]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [52]),
        .I1(\slotsData_reg[0][SlotData] [52]),
        .I2(\slotsData_reg[3][SlotData] [52]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [52]),
        .O(STAGE_StateBitsAtDrawID[52]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[53]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [53]),
        .I1(\slotsData_reg[0][SlotData] [53]),
        .I2(\slotsData_reg[3][SlotData] [53]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [53]),
        .O(STAGE_StateBitsAtDrawID[53]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[54]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [54]),
        .I1(\slotsData_reg[0][SlotData] [54]),
        .I2(\slotsData_reg[3][SlotData] [54]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [54]),
        .O(STAGE_StateBitsAtDrawID[54]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[55]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [55]),
        .I1(\slotsData_reg[0][SlotData] [55]),
        .I2(\slotsData_reg[3][SlotData] [55]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [55]),
        .O(STAGE_StateBitsAtDrawID[55]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[56]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [56]),
        .I1(\slotsData_reg[0][SlotData] [56]),
        .I2(\slotsData_reg[3][SlotData] [56]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [56]),
        .O(STAGE_StateBitsAtDrawID[56]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[57]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [57]),
        .I1(\slotsData_reg[0][SlotData] [57]),
        .I2(\slotsData_reg[3][SlotData] [57]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [57]),
        .O(STAGE_StateBitsAtDrawID[57]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[58]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [58]),
        .I1(\slotsData_reg[0][SlotData] [58]),
        .I2(\slotsData_reg[3][SlotData] [58]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [58]),
        .O(STAGE_StateBitsAtDrawID[58]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[59]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [59]),
        .I1(\slotsData_reg[0][SlotData] [59]),
        .I2(\slotsData_reg[3][SlotData] [59]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [59]),
        .O(STAGE_StateBitsAtDrawID[59]));
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
    \STAGE_StateBitsAtDrawID[60]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [60]),
        .I1(\slotsData_reg[0][SlotData] [60]),
        .I2(\slotsData_reg[3][SlotData] [60]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [60]),
        .O(STAGE_StateBitsAtDrawID[60]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[61]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [61]),
        .I1(\slotsData_reg[0][SlotData] [61]),
        .I2(\slotsData_reg[3][SlotData] [61]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [61]),
        .O(STAGE_StateBitsAtDrawID[61]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[62]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [62]),
        .I1(\slotsData_reg[0][SlotData] [62]),
        .I2(\slotsData_reg[3][SlotData] [62]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [62]),
        .O(STAGE_StateBitsAtDrawID[62]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[63]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [63]),
        .I1(\slotsData_reg[0][SlotData] [63]),
        .I2(\slotsData_reg[3][SlotData] [63]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [63]),
        .O(STAGE_StateBitsAtDrawID[63]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[64]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [64]),
        .I1(\slotsData_reg[0][SlotData] [64]),
        .I2(\slotsData_reg[3][SlotData] [64]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [64]),
        .O(STAGE_StateBitsAtDrawID[64]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[65]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [65]),
        .I1(\slotsData_reg[0][SlotData] [65]),
        .I2(\slotsData_reg[3][SlotData] [65]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [65]),
        .O(STAGE_StateBitsAtDrawID[65]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[66]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [66]),
        .I1(\slotsData_reg[0][SlotData] [66]),
        .I2(\slotsData_reg[3][SlotData] [66]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [66]),
        .O(STAGE_StateBitsAtDrawID[66]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[67]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [67]),
        .I1(\slotsData_reg[0][SlotData] [67]),
        .I2(\slotsData_reg[3][SlotData] [67]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [67]),
        .O(STAGE_StateBitsAtDrawID[67]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[68]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [68]),
        .I1(\slotsData_reg[0][SlotData] [68]),
        .I2(\slotsData_reg[3][SlotData] [68]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [68]),
        .O(STAGE_StateBitsAtDrawID[68]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[69]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [69]),
        .I1(\slotsData_reg[0][SlotData] [69]),
        .I2(\slotsData_reg[3][SlotData] [69]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [69]),
        .O(STAGE_StateBitsAtDrawID[69]));
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
    \STAGE_StateBitsAtDrawID[70]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [70]),
        .I1(\slotsData_reg[0][SlotData] [70]),
        .I2(\slotsData_reg[3][SlotData] [70]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [70]),
        .O(STAGE_StateBitsAtDrawID[70]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[71]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [71]),
        .I1(\slotsData_reg[0][SlotData] [71]),
        .I2(\slotsData_reg[3][SlotData] [71]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [71]),
        .O(STAGE_StateBitsAtDrawID[71]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[72]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [72]),
        .I1(\slotsData_reg[0][SlotData] [72]),
        .I2(\slotsData_reg[3][SlotData] [72]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [72]),
        .O(STAGE_StateBitsAtDrawID[72]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[73]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [73]),
        .I1(\slotsData_reg[0][SlotData] [73]),
        .I2(\slotsData_reg[3][SlotData] [73]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [73]),
        .O(STAGE_StateBitsAtDrawID[73]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[74]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [74]),
        .I1(\slotsData_reg[0][SlotData] [74]),
        .I2(\slotsData_reg[3][SlotData] [74]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [74]),
        .O(STAGE_StateBitsAtDrawID[74]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[75]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [75]),
        .I1(\slotsData_reg[0][SlotData] [75]),
        .I2(\slotsData_reg[3][SlotData] [75]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [75]),
        .O(STAGE_StateBitsAtDrawID[75]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \STAGE_StateBitsAtDrawID[76]_INST_0 
       (.I0(\slotsData_reg[1][SlotData] [76]),
        .I1(\slotsData_reg[0][SlotData] [76]),
        .I2(\slotsData_reg[3][SlotData] [76]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\slotsData_reg[2][SlotData] [76]),
        .O(STAGE_StateBitsAtDrawID[76]));
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
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \currentReadSlot[0]_i_1 
       (.I0(Q[0]),
        .O(\currentReadSlot[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \currentWriteSlot[0]_i_1 
       (.I0(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \currentWriteSlot[1]_i_1 
       (.I0(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(plusOp[1]));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteSlot_reg[0] 
       (.C(clk),
        .CE(CMD_SetNewState),
        .D(plusOp[0]),
        .Q(\DBG_CurrentWriteSlotIndex[1] [0]),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteSlot_reg[1] 
       (.C(clk),
        .CE(CMD_SetNewState),
        .D(plusOp[1]),
        .Q(\DBG_CurrentWriteSlotIndex[1] [1]),
        .R(CMD_EndFrameReset));
  LUT3 #(
    .INIT(8'h02)) 
    \slotsData[0][SlotData][76]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[0][SlotIsValid]1_out ));
  LUT6 #(
    .INIT(64'h101010101010FF10)) 
    \slotsData[0][SlotDrawEventID] 
       (.I0(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I1(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I2(CMD_SetNewState),
        .I3(STAGE_ConsumeStateSlot),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\slotsData[0][SlotDrawEventID_n_0_] ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][0]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[0]),
        .O(\slotsData[0][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[10]),
        .O(\slotsData[0][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][11]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[11]),
        .O(\slotsData[0][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][12]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[12]),
        .O(\slotsData[0][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][13]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[13]),
        .O(\slotsData[0][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][14]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[14]),
        .O(\slotsData[0][SlotDrawEventID][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][15]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[15]),
        .O(\slotsData[0][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][1]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[1]),
        .O(\slotsData[0][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][2]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[2]),
        .O(\slotsData[0][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][3]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[3]),
        .O(\slotsData[0][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][4]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[4]),
        .O(\slotsData[0][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][5]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[5]),
        .O(\slotsData[0][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][6]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[6]),
        .O(\slotsData[0][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][7]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[7]),
        .O(\slotsData[0][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][8]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[8]),
        .O(\slotsData[0][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h0200)) 
    \slotsData[0][SlotDrawEventID][9]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(CMD_NewStateDrawEventID[9]),
        .O(\slotsData[0][SlotDrawEventID][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \slotsData[0][SlotIsValid] 
       (.I0(\DBG_SlotsValid[1] ),
        .I1(\DBG_SlotsValid[0] ),
        .I2(\DBG_SlotsValid[3] ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\DBG_SlotsValid[2] ),
        .O(STAGE_StateIsValid));
  LUT6 #(
    .INIT(64'h777F7777000F0000)) 
    \slotsData[0][SlotIsValid]_i_1 
       (.I0(\slotsData[0][SlotIsValid]_i_2_n_0 ),
        .I1(STAGE_ConsumeStateSlot),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I4(CMD_SetNewState),
        .I5(\DBG_SlotsValid[0] ),
        .O(\slotsData[0][SlotIsValid]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \slotsData[0][SlotIsValid]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\slotsData[0][SlotIsValid]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \slotsData[1][SlotData][76]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotIsValid]3_out ));
  LUT6 #(
    .INIT(64'h4040FF4040404040)) 
    \slotsData[1][SlotDrawEventID] 
       (.I0(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I1(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I2(CMD_SetNewState),
        .I3(STAGE_ConsumeStateSlot),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\slotsData[1][SlotDrawEventID_n_0_] ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][0]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[10]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][11]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[11]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][12]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[12]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][13]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[13]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][14]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[14]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][15]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[15]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][1]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[1]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][2]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[2]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][3]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[3]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][4]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[4]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][5]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[5]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][6]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[6]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][7]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[7]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][8]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[8]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h2000)) 
    \slotsData[1][SlotDrawEventID][9]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[9]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[1][SlotDrawEventID][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h77F7777700F00000)) 
    \slotsData[1][SlotIsValid]_i_1 
       (.I0(\slotsData[1][SlotIsValid]_i_2_n_0 ),
        .I1(STAGE_ConsumeStateSlot),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I4(CMD_SetNewState),
        .I5(\DBG_SlotsValid[1] ),
        .O(\slotsData[1][SlotIsValid]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \slotsData[1][SlotIsValid]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\slotsData[1][SlotIsValid]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \slotsData[2][SlotData][76]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[2][SlotIsValid]5_out ));
  LUT6 #(
    .INIT(64'h4040FF4040404040)) 
    \slotsData[2][SlotDrawEventID] 
       (.I0(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_SetNewState),
        .I3(STAGE_ConsumeStateSlot),
        .I4(Q[0]),
        .I5(Q[1]),
        .O(\slotsData[2][SlotDrawEventID_n_0_] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][0]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[10]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][11]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[11]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][12]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[12]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][13]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[13]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][14]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[14]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][15]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[15]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][1]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[1]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][2]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[2]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][3]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[3]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][4]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[4]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][5]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[5]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][6]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[6]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][7]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[7]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][8]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[8]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \slotsData[2][SlotDrawEventID][9]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(CMD_NewStateDrawEventID[9]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[2][SlotDrawEventID][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h77F7777700F00000)) 
    \slotsData[2][SlotIsValid]_i_1 
       (.I0(\slotsData[2][SlotIsValid]_i_2_n_0 ),
        .I1(STAGE_ConsumeStateSlot),
        .I2(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I4(CMD_SetNewState),
        .I5(\DBG_SlotsValid[2] ),
        .O(\slotsData[2][SlotIsValid]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \slotsData[2][SlotIsValid]_i_2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(\slotsData[2][SlotIsValid]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \slotsData[3][SlotData][76]_i_1 
       (.I0(CMD_SetNewState),
        .I1(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .O(\slotsData[3][SlotIsValid]7_out ));
  LUT6 #(
    .INIT(64'hFF80808080808080)) 
    \slotsData[3][SlotDrawEventID] 
       (.I0(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I1(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I2(CMD_SetNewState),
        .I3(STAGE_ConsumeStateSlot),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(\slotsData[3][SlotDrawEventID_n_0_] ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][0]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[0]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][10]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[10]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][11]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[11]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][12]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[12]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][13]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[13]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][14]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[14]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][15]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[15]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][1]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[1]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][2]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[2]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][3]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[3]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][4]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[4]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][5]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[5]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][6]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[6]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][7]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[7]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][8]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[8]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slotsData[3][SlotDrawEventID][9]_i_1 
       (.I0(CMD_SetNewState),
        .I1(CMD_NewStateDrawEventID[9]),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .O(\slotsData[3][SlotDrawEventID][9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7777777F0000000)) 
    \slotsData[3][SlotIsValid]_i_1 
       (.I0(\slotsData[3][SlotIsValid]_i_2_n_0 ),
        .I1(STAGE_ConsumeStateSlot),
        .I2(\DBG_CurrentWriteSlotIndex[1] [0]),
        .I3(\DBG_CurrentWriteSlotIndex[1] [1]),
        .I4(CMD_SetNewState),
        .I5(\DBG_SlotsValid[3] ),
        .O(\slotsData[3][SlotIsValid]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
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
    \slotsData_reg[0][SlotData][11] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[11]),
        .Q(\slotsData_reg[0][SlotData] [11]),
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
    \slotsData_reg[0][SlotData][13] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[13]),
        .Q(\slotsData_reg[0][SlotData] [13]),
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
    \slotsData_reg[0][SlotData][15] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[15]),
        .Q(\slotsData_reg[0][SlotData] [15]),
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
    \slotsData_reg[0][SlotData][17] 
       (.C(clk),
        .CE(\slotsData[0][SlotIsValid]1_out ),
        .D(CMD_NewStateBits[17]),
        .Q(\slotsData_reg[0][SlotData] [17]),
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
        .Q(\DBG_SlotsValid[0] ),
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
    \slotsData_reg[1][SlotData][11] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[11]),
        .Q(\slotsData_reg[1][SlotData] [11]),
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
    \slotsData_reg[1][SlotData][13] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[13]),
        .Q(\slotsData_reg[1][SlotData] [13]),
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
    \slotsData_reg[1][SlotData][15] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[15]),
        .Q(\slotsData_reg[1][SlotData] [15]),
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
    \slotsData_reg[1][SlotData][17] 
       (.C(clk),
        .CE(\slotsData[1][SlotIsValid]3_out ),
        .D(CMD_NewStateBits[17]),
        .Q(\slotsData_reg[1][SlotData] [17]),
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
        .Q(\DBG_SlotsValid[1] ),
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
    \slotsData_reg[2][SlotData][11] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[11]),
        .Q(\slotsData_reg[2][SlotData] [11]),
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
    \slotsData_reg[2][SlotData][13] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[13]),
        .Q(\slotsData_reg[2][SlotData] [13]),
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
    \slotsData_reg[2][SlotData][15] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[15]),
        .Q(\slotsData_reg[2][SlotData] [15]),
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
    \slotsData_reg[2][SlotData][17] 
       (.C(clk),
        .CE(\slotsData[2][SlotIsValid]5_out ),
        .D(CMD_NewStateBits[17]),
        .Q(\slotsData_reg[2][SlotData] [17]),
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
        .Q(\DBG_SlotsValid[2] ),
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
    \slotsData_reg[3][SlotData][11] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[11]),
        .Q(\slotsData_reg[3][SlotData] [11]),
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
    \slotsData_reg[3][SlotData][13] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[13]),
        .Q(\slotsData_reg[3][SlotData] [13]),
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
    \slotsData_reg[3][SlotData][15] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[15]),
        .Q(\slotsData_reg[3][SlotData] [15]),
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
    \slotsData_reg[3][SlotData][17] 
       (.C(clk),
        .CE(\slotsData[3][SlotIsValid]7_out ),
        .D(CMD_NewStateBits[17]),
        .Q(\slotsData_reg[3][SlotData] [17]),
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
        .Q(\DBG_SlotsValid[3] ),
        .R(CMD_EndFrameReset));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
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

endmodule
`endif
