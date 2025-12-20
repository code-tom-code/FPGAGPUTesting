// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Tue Dec 16 23:51:16 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_DbgPixelMessages_0_1/MainDesign_DbgPixelMessages_0_1_sim_netlist.v
// Design      : MainDesign_DbgPixelMessages_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_DbgPixelMessages_0_1,DbgPixelMessages,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "DbgPixelMessages,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_DbgPixelMessages_0_1
   (clk,
    CMD_EndFrameReset,
    DBG_BeginDump,
    STAGE_Message,
    STAGE_MessageData,
    STAGE_NewMessage,
    DBG_IsDumping,
    DBG_MessageIndex,
    DBG_Message,
    DBG_MessageData);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  input CMD_EndFrameReset;
  input DBG_BeginDump;
  input [15:0]STAGE_Message;
  input [15:0]STAGE_MessageData;
  input STAGE_NewMessage;
  output DBG_IsDumping;
  output [7:0]DBG_MessageIndex;
  output [15:0]DBG_Message;
  output [15:0]DBG_MessageData;

  wire \<const0> ;
  wire CMD_EndFrameReset;
  wire DBG_BeginDump;
  wire [15:0]DBG_Message;
  wire [15:0]DBG_MessageData;
  wire [7:0]DBG_MessageIndex;
  wire [15:0]STAGE_Message;
  wire [15:0]STAGE_MessageData;
  wire STAGE_NewMessage;
  wire clk;

  assign DBG_IsDumping = \<const0> ;
  GND GND
       (.G(\<const0> ));
  MainDesign_DbgPixelMessages_0_1_DbgPixelMessages U0
       (.CMD_EndFrameReset(CMD_EndFrameReset),
        .DBG_BeginDump(DBG_BeginDump),
        .DBG_Message(DBG_Message),
        .DBG_MessageData(DBG_MessageData),
        .DBG_MessageIndex(DBG_MessageIndex[7:6]),
        .STAGE_Message(STAGE_Message),
        .STAGE_MessageData(STAGE_MessageData),
        .STAGE_NewMessage(STAGE_NewMessage),
        .clk(clk),
        .\currentReadElementIndex_reg[0]_0 (DBG_MessageIndex[0]),
        .\currentReadElementIndex_reg[1]_0 (DBG_MessageIndex[1]),
        .\currentReadElementIndex_reg[2]_0 (DBG_MessageIndex[2]),
        .\currentReadElementIndex_reg[3]_0 (DBG_MessageIndex[3]),
        .\currentReadElementIndex_reg[4]_0 (DBG_MessageIndex[4]),
        .\currentReadElementIndex_reg[5]_0 (DBG_MessageIndex[5]));
endmodule

(* ORIG_REF_NAME = "DbgPixelMessages" *) 
module MainDesign_DbgPixelMessages_0_1_DbgPixelMessages
   (DBG_Message,
    \currentReadElementIndex_reg[5]_0 ,
    \currentReadElementIndex_reg[4]_0 ,
    \currentReadElementIndex_reg[3]_0 ,
    \currentReadElementIndex_reg[2]_0 ,
    \currentReadElementIndex_reg[1]_0 ,
    \currentReadElementIndex_reg[0]_0 ,
    DBG_MessageData,
    DBG_MessageIndex,
    clk,
    STAGE_Message,
    STAGE_MessageData,
    CMD_EndFrameReset,
    DBG_BeginDump,
    STAGE_NewMessage);
  output [15:0]DBG_Message;
  output \currentReadElementIndex_reg[5]_0 ;
  output \currentReadElementIndex_reg[4]_0 ;
  output \currentReadElementIndex_reg[3]_0 ;
  output \currentReadElementIndex_reg[2]_0 ;
  output \currentReadElementIndex_reg[1]_0 ;
  output \currentReadElementIndex_reg[0]_0 ;
  output [15:0]DBG_MessageData;
  output [1:0]DBG_MessageIndex;
  input clk;
  input [15:0]STAGE_Message;
  input [15:0]STAGE_MessageData;
  input CMD_EndFrameReset;
  input DBG_BeginDump;
  input STAGE_NewMessage;

  wire CMD_EndFrameReset;
  wire DBG_BeginDump;
  wire [15:0]DBG_Message;
  wire [15:0]DBG_MessageData;
  wire [1:0]DBG_MessageIndex;
  wire [15:0]STAGE_Message;
  wire [15:0]STAGE_MessageData;
  wire STAGE_NewMessage;
  wire clk;
  wire currentIsDumping;
  wire currentIsDumping_i_1_n_0;
  wire currentIsDumping_i_2_n_0;
  wire currentIsDumping_i_3_n_0;
  wire currentIsDumping_i_4_n_0;
  wire \currentReadElementIndex[7]_i_1_n_0 ;
  wire \currentReadElementIndex[7]_i_3_n_0 ;
  wire \currentReadElementIndex_reg[0]_0 ;
  wire \currentReadElementIndex_reg[1]_0 ;
  wire \currentReadElementIndex_reg[2]_0 ;
  wire \currentReadElementIndex_reg[3]_0 ;
  wire \currentReadElementIndex_reg[4]_0 ;
  wire \currentReadElementIndex_reg[5]_0 ;
  wire \currentWriteElementIndex[7]_i_2_n_0 ;
  wire \currentWriteElementIndex_reg_n_0_[0] ;
  wire \currentWriteElementIndex_reg_n_0_[1] ;
  wire \currentWriteElementIndex_reg_n_0_[2] ;
  wire \currentWriteElementIndex_reg_n_0_[3] ;
  wire \currentWriteElementIndex_reg_n_0_[4] ;
  wire \currentWriteElementIndex_reg_n_0_[5] ;
  wire \currentWriteElementIndex_reg_n_0_[6] ;
  wire \currentWriteElementIndex_reg_n_0_[7] ;
  wire endDumpingDebounce;
  wire endDumpingDebounce_i_1_n_0;
  wire p_0_in10_out;
  wire [7:0]plusOp;
  wire [5:0]plusOp_0;
  wire [7:6]plusOp__0;
  wire NLW_elementsData_reg_0_63_0_6_DOH_UNCONNECTED;
  wire NLW_elementsData_reg_0_63_7_13_DOH_UNCONNECTED;
  wire NLW_elements_reg_0_63_0_6_DOH_UNCONNECTED;
  wire NLW_elements_reg_0_63_14_15_DOE_UNCONNECTED;
  wire NLW_elements_reg_0_63_14_15_DOF_UNCONNECTED;
  wire NLW_elements_reg_0_63_14_15_DOG_UNCONNECTED;
  wire NLW_elements_reg_0_63_14_15_DOH_UNCONNECTED;
  wire NLW_elements_reg_0_63_7_13_DOH_UNCONNECTED;

  LUT6 #(
    .INIT(64'hF700F7FFF700F700)) 
    currentIsDumping_i_1
       (.I0(currentIsDumping_i_2_n_0),
        .I1(currentIsDumping_i_3_n_0),
        .I2(currentIsDumping_i_4_n_0),
        .I3(currentIsDumping),
        .I4(endDumpingDebounce),
        .I5(DBG_BeginDump),
        .O(currentIsDumping_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    currentIsDumping_i_2
       (.I0(\currentReadElementIndex_reg[0]_0 ),
        .I1(\currentWriteElementIndex_reg_n_0_[0] ),
        .I2(\currentWriteElementIndex_reg_n_0_[2] ),
        .I3(\currentReadElementIndex_reg[2]_0 ),
        .I4(\currentWriteElementIndex_reg_n_0_[1] ),
        .I5(\currentReadElementIndex_reg[1]_0 ),
        .O(currentIsDumping_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    currentIsDumping_i_3
       (.I0(\currentReadElementIndex_reg[3]_0 ),
        .I1(\currentWriteElementIndex_reg_n_0_[3] ),
        .I2(\currentWriteElementIndex_reg_n_0_[5] ),
        .I3(\currentReadElementIndex_reg[5]_0 ),
        .I4(\currentWriteElementIndex_reg_n_0_[4] ),
        .I5(\currentReadElementIndex_reg[4]_0 ),
        .O(currentIsDumping_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    currentIsDumping_i_4
       (.I0(DBG_MessageIndex[0]),
        .I1(\currentWriteElementIndex_reg_n_0_[6] ),
        .I2(DBG_MessageIndex[1]),
        .I3(\currentWriteElementIndex_reg_n_0_[7] ),
        .O(currentIsDumping_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    currentIsDumping_reg
       (.C(clk),
        .CE(1'b1),
        .D(currentIsDumping_i_1_n_0),
        .Q(currentIsDumping),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \currentReadElementIndex[0]_i_1 
       (.I0(\currentReadElementIndex_reg[0]_0 ),
        .O(plusOp_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \currentReadElementIndex[1]_i_1 
       (.I0(\currentReadElementIndex_reg[0]_0 ),
        .I1(\currentReadElementIndex_reg[1]_0 ),
        .O(plusOp_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \currentReadElementIndex[2]_i_1 
       (.I0(\currentReadElementIndex_reg[0]_0 ),
        .I1(\currentReadElementIndex_reg[1]_0 ),
        .I2(\currentReadElementIndex_reg[2]_0 ),
        .O(plusOp_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \currentReadElementIndex[3]_i_1 
       (.I0(\currentReadElementIndex_reg[1]_0 ),
        .I1(\currentReadElementIndex_reg[0]_0 ),
        .I2(\currentReadElementIndex_reg[2]_0 ),
        .I3(\currentReadElementIndex_reg[3]_0 ),
        .O(plusOp_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \currentReadElementIndex[4]_i_1 
       (.I0(\currentReadElementIndex_reg[2]_0 ),
        .I1(\currentReadElementIndex_reg[0]_0 ),
        .I2(\currentReadElementIndex_reg[1]_0 ),
        .I3(\currentReadElementIndex_reg[3]_0 ),
        .I4(\currentReadElementIndex_reg[4]_0 ),
        .O(plusOp_0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \currentReadElementIndex[5]_i_1 
       (.I0(\currentReadElementIndex_reg[3]_0 ),
        .I1(\currentReadElementIndex_reg[1]_0 ),
        .I2(\currentReadElementIndex_reg[0]_0 ),
        .I3(\currentReadElementIndex_reg[2]_0 ),
        .I4(\currentReadElementIndex_reg[4]_0 ),
        .I5(\currentReadElementIndex_reg[5]_0 ),
        .O(plusOp_0[5]));
  LUT2 #(
    .INIT(4'h6)) 
    \currentReadElementIndex[6]_i_1 
       (.I0(\currentReadElementIndex[7]_i_3_n_0 ),
        .I1(DBG_MessageIndex[0]),
        .O(plusOp__0[6]));
  LUT1 #(
    .INIT(2'h1)) 
    \currentReadElementIndex[7]_i_1 
       (.I0(currentIsDumping),
        .O(\currentReadElementIndex[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \currentReadElementIndex[7]_i_2 
       (.I0(\currentReadElementIndex[7]_i_3_n_0 ),
        .I1(DBG_MessageIndex[0]),
        .I2(DBG_MessageIndex[1]),
        .O(plusOp__0[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \currentReadElementIndex[7]_i_3 
       (.I0(\currentReadElementIndex_reg[5]_0 ),
        .I1(\currentReadElementIndex_reg[3]_0 ),
        .I2(\currentReadElementIndex_reg[1]_0 ),
        .I3(\currentReadElementIndex_reg[0]_0 ),
        .I4(\currentReadElementIndex_reg[2]_0 ),
        .I5(\currentReadElementIndex_reg[4]_0 ),
        .O(\currentReadElementIndex[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadElementIndex_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp_0[0]),
        .Q(\currentReadElementIndex_reg[0]_0 ),
        .R(\currentReadElementIndex[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadElementIndex_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp_0[1]),
        .Q(\currentReadElementIndex_reg[1]_0 ),
        .R(\currentReadElementIndex[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadElementIndex_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp_0[2]),
        .Q(\currentReadElementIndex_reg[2]_0 ),
        .R(\currentReadElementIndex[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadElementIndex_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp_0[3]),
        .Q(\currentReadElementIndex_reg[3]_0 ),
        .R(\currentReadElementIndex[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadElementIndex_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp_0[4]),
        .Q(\currentReadElementIndex_reg[4]_0 ),
        .R(\currentReadElementIndex[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadElementIndex_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp_0[5]),
        .Q(\currentReadElementIndex_reg[5]_0 ),
        .R(\currentReadElementIndex[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadElementIndex_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0[6]),
        .Q(DBG_MessageIndex[0]),
        .R(\currentReadElementIndex[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadElementIndex_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(plusOp__0[7]),
        .Q(DBG_MessageIndex[1]),
        .R(\currentReadElementIndex[7]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \currentWriteElementIndex[0]_i_1 
       (.I0(\currentWriteElementIndex_reg_n_0_[0] ),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \currentWriteElementIndex[1]_i_1 
       (.I0(\currentWriteElementIndex_reg_n_0_[0] ),
        .I1(\currentWriteElementIndex_reg_n_0_[1] ),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \currentWriteElementIndex[2]_i_1 
       (.I0(\currentWriteElementIndex_reg_n_0_[0] ),
        .I1(\currentWriteElementIndex_reg_n_0_[1] ),
        .I2(\currentWriteElementIndex_reg_n_0_[2] ),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \currentWriteElementIndex[3]_i_1 
       (.I0(\currentWriteElementIndex_reg_n_0_[1] ),
        .I1(\currentWriteElementIndex_reg_n_0_[0] ),
        .I2(\currentWriteElementIndex_reg_n_0_[2] ),
        .I3(\currentWriteElementIndex_reg_n_0_[3] ),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \currentWriteElementIndex[4]_i_1 
       (.I0(\currentWriteElementIndex_reg_n_0_[2] ),
        .I1(\currentWriteElementIndex_reg_n_0_[0] ),
        .I2(\currentWriteElementIndex_reg_n_0_[1] ),
        .I3(\currentWriteElementIndex_reg_n_0_[3] ),
        .I4(\currentWriteElementIndex_reg_n_0_[4] ),
        .O(plusOp[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \currentWriteElementIndex[5]_i_1 
       (.I0(\currentWriteElementIndex_reg_n_0_[3] ),
        .I1(\currentWriteElementIndex_reg_n_0_[1] ),
        .I2(\currentWriteElementIndex_reg_n_0_[0] ),
        .I3(\currentWriteElementIndex_reg_n_0_[2] ),
        .I4(\currentWriteElementIndex_reg_n_0_[4] ),
        .I5(\currentWriteElementIndex_reg_n_0_[5] ),
        .O(plusOp[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \currentWriteElementIndex[6]_i_1 
       (.I0(\currentWriteElementIndex[7]_i_2_n_0 ),
        .I1(\currentWriteElementIndex_reg_n_0_[6] ),
        .O(plusOp[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \currentWriteElementIndex[7]_i_1 
       (.I0(\currentWriteElementIndex[7]_i_2_n_0 ),
        .I1(\currentWriteElementIndex_reg_n_0_[6] ),
        .I2(\currentWriteElementIndex_reg_n_0_[7] ),
        .O(plusOp[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \currentWriteElementIndex[7]_i_2 
       (.I0(\currentWriteElementIndex_reg_n_0_[5] ),
        .I1(\currentWriteElementIndex_reg_n_0_[3] ),
        .I2(\currentWriteElementIndex_reg_n_0_[1] ),
        .I3(\currentWriteElementIndex_reg_n_0_[0] ),
        .I4(\currentWriteElementIndex_reg_n_0_[2] ),
        .I5(\currentWriteElementIndex_reg_n_0_[4] ),
        .O(\currentWriteElementIndex[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteElementIndex_reg[0] 
       (.C(clk),
        .CE(p_0_in10_out),
        .D(plusOp[0]),
        .Q(\currentWriteElementIndex_reg_n_0_[0] ),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteElementIndex_reg[1] 
       (.C(clk),
        .CE(p_0_in10_out),
        .D(plusOp[1]),
        .Q(\currentWriteElementIndex_reg_n_0_[1] ),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteElementIndex_reg[2] 
       (.C(clk),
        .CE(p_0_in10_out),
        .D(plusOp[2]),
        .Q(\currentWriteElementIndex_reg_n_0_[2] ),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteElementIndex_reg[3] 
       (.C(clk),
        .CE(p_0_in10_out),
        .D(plusOp[3]),
        .Q(\currentWriteElementIndex_reg_n_0_[3] ),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteElementIndex_reg[4] 
       (.C(clk),
        .CE(p_0_in10_out),
        .D(plusOp[4]),
        .Q(\currentWriteElementIndex_reg_n_0_[4] ),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteElementIndex_reg[5] 
       (.C(clk),
        .CE(p_0_in10_out),
        .D(plusOp[5]),
        .Q(\currentWriteElementIndex_reg_n_0_[5] ),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteElementIndex_reg[6] 
       (.C(clk),
        .CE(p_0_in10_out),
        .D(plusOp[6]),
        .Q(\currentWriteElementIndex_reg_n_0_[6] ),
        .R(CMD_EndFrameReset));
  FDRE #(
    .INIT(1'b0)) 
    \currentWriteElementIndex_reg[7] 
       (.C(clk),
        .CE(p_0_in10_out),
        .D(plusOp[7]),
        .Q(\currentWriteElementIndex_reg_n_0_[7] ),
        .R(CMD_EndFrameReset));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "MainDesign_DbgPixelMessages_0_1/U0/elementsData_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "6" *) 
  RAM64M8 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    elementsData_reg_0_63_0_6
       (.ADDRA({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRB({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRC({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRD({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRE({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRF({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRG({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRH({\currentWriteElementIndex_reg_n_0_[5] ,\currentWriteElementIndex_reg_n_0_[4] ,\currentWriteElementIndex_reg_n_0_[3] ,\currentWriteElementIndex_reg_n_0_[2] ,\currentWriteElementIndex_reg_n_0_[1] ,\currentWriteElementIndex_reg_n_0_[0] }),
        .DIA(STAGE_MessageData[0]),
        .DIB(STAGE_MessageData[1]),
        .DIC(STAGE_MessageData[2]),
        .DID(STAGE_MessageData[3]),
        .DIE(STAGE_MessageData[4]),
        .DIF(STAGE_MessageData[5]),
        .DIG(STAGE_MessageData[6]),
        .DIH(1'b0),
        .DOA(DBG_MessageData[0]),
        .DOB(DBG_MessageData[1]),
        .DOC(DBG_MessageData[2]),
        .DOD(DBG_MessageData[3]),
        .DOE(DBG_MessageData[4]),
        .DOF(DBG_MessageData[5]),
        .DOG(DBG_MessageData[6]),
        .DOH(NLW_elementsData_reg_0_63_0_6_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(p_0_in10_out));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "MainDesign_DbgPixelMessages_0_1/U0/elementsData_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "13" *) 
  RAM64M8 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    elementsData_reg_0_63_7_13
       (.ADDRA({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRB({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRC({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRD({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRE({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRF({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRG({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRH({\currentWriteElementIndex_reg_n_0_[5] ,\currentWriteElementIndex_reg_n_0_[4] ,\currentWriteElementIndex_reg_n_0_[3] ,\currentWriteElementIndex_reg_n_0_[2] ,\currentWriteElementIndex_reg_n_0_[1] ,\currentWriteElementIndex_reg_n_0_[0] }),
        .DIA(STAGE_MessageData[7]),
        .DIB(STAGE_MessageData[8]),
        .DIC(STAGE_MessageData[9]),
        .DID(STAGE_MessageData[10]),
        .DIE(STAGE_MessageData[11]),
        .DIF(STAGE_MessageData[12]),
        .DIG(STAGE_MessageData[13]),
        .DIH(1'b0),
        .DOA(DBG_MessageData[7]),
        .DOB(DBG_MessageData[8]),
        .DOC(DBG_MessageData[9]),
        .DOD(DBG_MessageData[10]),
        .DOE(DBG_MessageData[11]),
        .DOF(DBG_MessageData[12]),
        .DOG(DBG_MessageData[13]),
        .DOH(NLW_elementsData_reg_0_63_7_13_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(p_0_in10_out));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "MainDesign_DbgPixelMessages_0_1/U0/elements_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "6" *) 
  RAM64M8 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    elements_reg_0_63_0_6
       (.ADDRA({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRB({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRC({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRD({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRE({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRF({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRG({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRH({\currentWriteElementIndex_reg_n_0_[5] ,\currentWriteElementIndex_reg_n_0_[4] ,\currentWriteElementIndex_reg_n_0_[3] ,\currentWriteElementIndex_reg_n_0_[2] ,\currentWriteElementIndex_reg_n_0_[1] ,\currentWriteElementIndex_reg_n_0_[0] }),
        .DIA(STAGE_Message[0]),
        .DIB(STAGE_Message[1]),
        .DIC(STAGE_Message[2]),
        .DID(STAGE_Message[3]),
        .DIE(STAGE_Message[4]),
        .DIF(STAGE_Message[5]),
        .DIG(STAGE_Message[6]),
        .DIH(1'b0),
        .DOA(DBG_Message[0]),
        .DOB(DBG_Message[1]),
        .DOC(DBG_Message[2]),
        .DOD(DBG_Message[3]),
        .DOE(DBG_Message[4]),
        .DOF(DBG_Message[5]),
        .DOG(DBG_Message[6]),
        .DOH(NLW_elements_reg_0_63_0_6_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(p_0_in10_out));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "MainDesign_DbgPixelMessages_0_1/U0/elements_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "14" *) 
  (* ram_slice_end = "15" *) 
  RAM64M8 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    elements_reg_0_63_14_15
       (.ADDRA({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRB({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRC({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRD({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRE({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRF({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRG({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRH({\currentWriteElementIndex_reg_n_0_[5] ,\currentWriteElementIndex_reg_n_0_[4] ,\currentWriteElementIndex_reg_n_0_[3] ,\currentWriteElementIndex_reg_n_0_[2] ,\currentWriteElementIndex_reg_n_0_[1] ,\currentWriteElementIndex_reg_n_0_[0] }),
        .DIA(STAGE_Message[14]),
        .DIB(STAGE_Message[15]),
        .DIC(STAGE_MessageData[14]),
        .DID(STAGE_MessageData[15]),
        .DIE(1'b0),
        .DIF(1'b0),
        .DIG(1'b0),
        .DIH(1'b0),
        .DOA(DBG_Message[14]),
        .DOB(DBG_Message[15]),
        .DOC(DBG_MessageData[14]),
        .DOD(DBG_MessageData[15]),
        .DOE(NLW_elements_reg_0_63_14_15_DOE_UNCONNECTED),
        .DOF(NLW_elements_reg_0_63_14_15_DOF_UNCONNECTED),
        .DOG(NLW_elements_reg_0_63_14_15_DOG_UNCONNECTED),
        .DOH(NLW_elements_reg_0_63_14_15_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(p_0_in10_out));
  LUT2 #(
    .INIT(4'h8)) 
    elements_reg_0_63_14_15_i_1
       (.I0(STAGE_NewMessage),
        .I1(STAGE_Message[15]),
        .O(p_0_in10_out));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "MainDesign_DbgPixelMessages_0_1/U0/elements_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "13" *) 
  RAM64M8 #(
    .INIT_A(64'h0000000000000000),
    .INIT_B(64'h0000000000000000),
    .INIT_C(64'h0000000000000000),
    .INIT_D(64'h0000000000000000),
    .INIT_E(64'h0000000000000000),
    .INIT_F(64'h0000000000000000),
    .INIT_G(64'h0000000000000000),
    .INIT_H(64'h0000000000000000)) 
    elements_reg_0_63_7_13
       (.ADDRA({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRB({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRC({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRD({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRE({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRF({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRG({\currentReadElementIndex_reg[5]_0 ,\currentReadElementIndex_reg[4]_0 ,\currentReadElementIndex_reg[3]_0 ,\currentReadElementIndex_reg[2]_0 ,\currentReadElementIndex_reg[1]_0 ,\currentReadElementIndex_reg[0]_0 }),
        .ADDRH({\currentWriteElementIndex_reg_n_0_[5] ,\currentWriteElementIndex_reg_n_0_[4] ,\currentWriteElementIndex_reg_n_0_[3] ,\currentWriteElementIndex_reg_n_0_[2] ,\currentWriteElementIndex_reg_n_0_[1] ,\currentWriteElementIndex_reg_n_0_[0] }),
        .DIA(STAGE_Message[7]),
        .DIB(STAGE_Message[8]),
        .DIC(STAGE_Message[9]),
        .DID(STAGE_Message[10]),
        .DIE(STAGE_Message[11]),
        .DIF(STAGE_Message[12]),
        .DIG(STAGE_Message[13]),
        .DIH(1'b0),
        .DOA(DBG_Message[7]),
        .DOB(DBG_Message[8]),
        .DOC(DBG_Message[9]),
        .DOD(DBG_Message[10]),
        .DOE(DBG_Message[11]),
        .DOF(DBG_Message[12]),
        .DOG(DBG_Message[13]),
        .DOH(NLW_elements_reg_0_63_7_13_DOH_UNCONNECTED),
        .WCLK(clk),
        .WE(p_0_in10_out));
  LUT6 #(
    .INIT(64'hC8F8C8C8C8C8C8C8)) 
    endDumpingDebounce_i_1
       (.I0(DBG_BeginDump),
        .I1(endDumpingDebounce),
        .I2(currentIsDumping),
        .I3(currentIsDumping_i_4_n_0),
        .I4(currentIsDumping_i_3_n_0),
        .I5(currentIsDumping_i_2_n_0),
        .O(endDumpingDebounce_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    endDumpingDebounce_reg
       (.C(clk),
        .CE(1'b1),
        .D(endDumpingDebounce_i_1_n_0),
        .Q(endDumpingDebounce),
        .R(1'b0));
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
