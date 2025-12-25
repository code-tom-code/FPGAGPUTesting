// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:04:04 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_EthernetMDIOControll_0_0/MainDesign_EthernetMDIOControll_0_0_sim_netlist.v
// Design      : MainDesign_EthernetMDIOControll_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_EthernetMDIOControll_0_0,EthernetMDIOController,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "EthernetMDIOController,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_EthernetMDIOControll_0_0
   (clkin25,
    mdio_clk,
    mdio_i,
    mdio_o,
    mdio_t,
    mdio_t_ctrl,
    registerReadData,
    registerReadReady,
    registerWriteComplete,
    newRequestPHYAddress,
    newRequestDevTypeRegister,
    newRequestRegister,
    newRequestData,
    newRequestIsWrite,
    newRequestStart,
    DBG_BitsRemaining,
    DBG_InProgressRead,
    DBG_EthMDIO_State);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clkin25 CLK" *) (* x_interface_mode = "slave clkin25" *) (* x_interface_parameter = "XIL_INTERFACENAME clkin25, FREQ_HZ 2500000, ASSOCIATED_BUSIF MDIO, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0" *) input clkin25;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 MDIO MDC" *) (* x_interface_mode = "master MDIO" *) (* x_interface_parameter = "XIL_INTERFACENAME MDIO, FREQ_HZ 2500000, CAN_DEBUG false" *) output mdio_clk;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 MDIO MDIO_I" *) output mdio_i;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 MDIO MDIO_O" *) input mdio_o;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 MDIO MDIO_T" *) input mdio_t;
  output mdio_t_ctrl;
  output [15:0]registerReadData;
  output registerReadReady;
  output registerWriteComplete;
  input [4:0]newRequestPHYAddress;
  input [4:0]newRequestDevTypeRegister;
  input [15:0]newRequestRegister;
  input [15:0]newRequestData;
  input newRequestIsWrite;
  input newRequestStart;
  output [5:0]DBG_BitsRemaining;
  output [15:0]DBG_InProgressRead;
  output [4:0]DBG_EthMDIO_State;

  wire \<const0> ;
  wire [4:0]\^DBG_BitsRemaining ;
  wire [3:0]\^DBG_EthMDIO_State ;
  wire [15:0]DBG_InProgressRead;
  wire clkin25;
  wire mdio_i;
  wire mdio_o;
  wire mdio_t_ctrl;
  wire [15:0]newRequestData;
  wire [4:0]newRequestDevTypeRegister;
  wire newRequestIsWrite;
  wire [4:0]newRequestPHYAddress;
  wire newRequestStart;
  wire [15:0]registerReadData;
  wire registerReadReady;
  wire registerWriteComplete;

  assign DBG_BitsRemaining[5] = \<const0> ;
  assign DBG_BitsRemaining[4:0] = \^DBG_BitsRemaining [4:0];
  assign DBG_EthMDIO_State[4] = \<const0> ;
  assign DBG_EthMDIO_State[3:0] = \^DBG_EthMDIO_State [3:0];
  assign mdio_clk = clkin25;
  GND GND
       (.G(\<const0> ));
  MainDesign_EthernetMDIOControll_0_0_EthernetMDIOController U0
       (.DBG_InProgressRead(DBG_InProgressRead),
        .Q(\^DBG_BitsRemaining ),
        .clkin25(clkin25),
        .\currentState_reg[3]_0 (\^DBG_EthMDIO_State ),
        .mdio_i(mdio_i),
        .mdio_o(mdio_o),
        .mdio_t_ctrl(mdio_t_ctrl),
        .newRequestData(newRequestData),
        .newRequestDevTypeRegister(newRequestDevTypeRegister),
        .newRequestIsWrite(newRequestIsWrite),
        .newRequestPHYAddress(newRequestPHYAddress),
        .newRequestStart(newRequestStart),
        .registerReadData(registerReadData),
        .registerReadReady(registerReadReady),
        .registerWriteComplete(registerWriteComplete));
endmodule

(* ORIG_REF_NAME = "EthernetMDIOController" *) 
module MainDesign_EthernetMDIOControll_0_0_EthernetMDIOController
   (Q,
    mdio_i,
    DBG_InProgressRead,
    registerReadData,
    \currentState_reg[3]_0 ,
    mdio_t_ctrl,
    registerReadReady,
    registerWriteComplete,
    newRequestIsWrite,
    newRequestDevTypeRegister,
    clkin25,
    mdio_o,
    newRequestStart,
    newRequestPHYAddress,
    newRequestData);
  output [4:0]Q;
  output mdio_i;
  output [15:0]DBG_InProgressRead;
  output [15:0]registerReadData;
  output [3:0]\currentState_reg[3]_0 ;
  output mdio_t_ctrl;
  output registerReadReady;
  output registerWriteComplete;
  input newRequestIsWrite;
  input [4:0]newRequestDevTypeRegister;
  input clkin25;
  input mdio_o;
  input newRequestStart;
  input [4:0]newRequestPHYAddress;
  input [15:0]newRequestData;

  wire [15:0]DBG_InProgressRead;
  wire \FSM_sequential_currentState_reg_n_0_[3] ;
  wire [4:0]Q;
  wire [0:0]bitsRemaining;
  wire \bitsRemaining[0]_i_1_n_0 ;
  wire \bitsRemaining[0]_i_2_n_0 ;
  wire \bitsRemaining[0]_i_3_n_0 ;
  wire \bitsRemaining[1]_i_1_n_0 ;
  wire \bitsRemaining[2]_i_1_n_0 ;
  wire \bitsRemaining[2]_i_2_n_0 ;
  wire \bitsRemaining[2]_i_3_n_0 ;
  wire \bitsRemaining[3]_i_1_n_0 ;
  wire \bitsRemaining[3]_i_2_n_0 ;
  wire \bitsRemaining[3]_i_3_n_0 ;
  wire \bitsRemaining[4]_i_2_n_0 ;
  wire \bitsRemaining[4]_i_3_n_0 ;
  wire clkin25;
  wire [0:0]currentState;
  wire \currentState[0]_i_1_n_0 ;
  wire \currentState[1]_i_1_n_0 ;
  wire \currentState[2]_i_1_n_0 ;
  wire \currentState[3]_i_2_n_0 ;
  wire [2:0]currentState__0;
  wire [3:0]currentState__1;
  wire [3:0]\currentState_reg[3]_0 ;
  wire mdio_i;
  wire mdio_i_i_10_n_0;
  wire mdio_i_i_11_n_0;
  wire mdio_i_i_12_n_0;
  wire mdio_i_i_13_n_0;
  wire mdio_i_i_14_n_0;
  wire mdio_i_i_15_n_0;
  wire mdio_i_i_16_n_0;
  wire mdio_i_i_17_n_0;
  wire mdio_i_i_1_n_0;
  wire mdio_i_i_2_n_0;
  wire mdio_i_i_4_n_0;
  wire mdio_i_i_5_n_0;
  wire mdio_i_i_6_n_0;
  wire mdio_i_i_9_n_0;
  wire mdio_i_reg_i_3_n_0;
  wire mdio_i_reg_i_7_n_0;
  wire mdio_i_reg_i_8_n_0;
  wire mdio_o;
  wire mdio_t_ctrl;
  wire mdio_t_ctrl_i_1_n_0;
  wire [15:0]newRequestData;
  wire [4:0]newRequestDevTypeRegister;
  wire newRequestIsWrite;
  wire [4:0]newRequestPHYAddress;
  wire newRequestStart;
  wire [0:0]opcodeValue;
  wire \opcodeValue[0]_i_1_n_0 ;
  wire \opcodeValue[1]_i_2_n_0 ;
  wire \opcodeValue_reg_n_0_[0] ;
  wire \opcodeValue_reg_n_0_[1] ;
  wire [15:15]readInData0_in;
  wire \readInData[0]_i_1_n_0 ;
  wire \readInData[10]_i_1_n_0 ;
  wire \readInData[10]_i_2_n_0 ;
  wire \readInData[11]_i_1_n_0 ;
  wire \readInData[11]_i_2_n_0 ;
  wire \readInData[12]_i_1_n_0 ;
  wire \readInData[12]_i_3_n_0 ;
  wire \readInData[13]_i_1_n_0 ;
  wire \readInData[13]_i_2_n_0 ;
  wire \readInData[14]_i_1_n_0 ;
  wire \readInData[14]_i_2_n_0 ;
  wire \readInData[15]_i_1_n_0 ;
  wire \readInData[15]_i_2_n_0 ;
  wire \readInData[15]_i_3_n_0 ;
  wire \readInData[15]_i_4_n_0 ;
  wire \readInData[1]_i_1_n_0 ;
  wire \readInData[2]_i_1_n_0 ;
  wire \readInData[3]_i_1_n_0 ;
  wire \readInData[4]_i_1_n_0 ;
  wire \readInData[4]_i_2_n_0 ;
  wire \readInData[5]_i_1_n_0 ;
  wire \readInData[6]_i_1_n_0 ;
  wire \readInData[7]_i_1_n_0 ;
  wire \readInData[7]_i_2_n_0 ;
  wire \readInData[7]_i_3_n_0 ;
  wire \readInData[8]_i_1_n_0 ;
  wire \readInData[8]_i_2_n_0 ;
  wire \readInData[9]_i_1_n_0 ;
  wire \readInData[9]_i_2_n_0 ;
  wire [15:0]registerReadData;
  wire \registerReadData[15]_i_1_n_0 ;
  wire registerReadReady;
  wire registerReadReady_i_1_n_0;
  wire registerWriteComplete;
  wire registerWriteComplete_i_1_n_0;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hD1D1F1D1)) 
    \FSM_sequential_currentState[0]_i_1 
       (.I0(currentState__0[0]),
        .I1(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I2(currentState__0[1]),
        .I3(currentState__0[2]),
        .I4(newRequestIsWrite),
        .O(currentState__1[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h1E)) 
    \FSM_sequential_currentState[1]_i_1 
       (.I0(currentState__0[0]),
        .I1(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I2(currentState__0[1]),
        .O(currentState__1[1]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h1230)) 
    \FSM_sequential_currentState[2]_i_1 
       (.I0(currentState__0[0]),
        .I1(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I2(currentState__0[2]),
        .I3(currentState__0[1]),
        .O(currentState__1[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h20CC)) 
    \FSM_sequential_currentState[3]_i_1 
       (.I0(currentState__0[0]),
        .I1(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I2(currentState__0[2]),
        .I3(currentState__0[1]),
        .O(currentState__1[3]));
  (* FSM_ENCODED_STATES = "sendstartfieldstate:0011,sendopcodestate:0100,sendpreamblestate:0010,finishpacketstate:1010,waitfornewrequeststate:0001,initstate:0000,sendturnaroundstate:0111,recvdatastate:1001,sendregaddrstate:0110,senddatastate:1000,sendphyaddrstate:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_currentState_reg[0] 
       (.C(clkin25),
        .CE(currentState),
        .D(currentState__1[0]),
        .Q(currentState__0[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "sendstartfieldstate:0011,sendopcodestate:0100,sendpreamblestate:0010,finishpacketstate:1010,waitfornewrequeststate:0001,initstate:0000,sendturnaroundstate:0111,recvdatastate:1001,sendregaddrstate:0110,senddatastate:1000,sendphyaddrstate:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_currentState_reg[1] 
       (.C(clkin25),
        .CE(currentState),
        .D(currentState__1[1]),
        .Q(currentState__0[1]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "sendstartfieldstate:0011,sendopcodestate:0100,sendpreamblestate:0010,finishpacketstate:1010,waitfornewrequeststate:0001,initstate:0000,sendturnaroundstate:0111,recvdatastate:1001,sendregaddrstate:0110,senddatastate:1000,sendphyaddrstate:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_currentState_reg[2] 
       (.C(clkin25),
        .CE(currentState),
        .D(currentState__1[2]),
        .Q(currentState__0[2]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "sendstartfieldstate:0011,sendopcodestate:0100,sendpreamblestate:0010,finishpacketstate:1010,waitfornewrequeststate:0001,initstate:0000,sendturnaroundstate:0111,recvdatastate:1001,sendregaddrstate:0110,senddatastate:1000,sendphyaddrstate:0101" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_currentState_reg[3] 
       (.C(clkin25),
        .CE(currentState),
        .D(currentState__1[3]),
        .Q(\FSM_sequential_currentState_reg_n_0_[3] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFF070505FF070F07)) 
    \bitsRemaining[0]_i_1 
       (.I0(\bitsRemaining[2]_i_2_n_0 ),
        .I1(currentState__0[0]),
        .I2(Q[0]),
        .I3(\bitsRemaining[0]_i_2_n_0 ),
        .I4(\bitsRemaining[0]_i_3_n_0 ),
        .I5(currentState__0[2]),
        .O(\bitsRemaining[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80FFFFFF)) 
    \bitsRemaining[0]_i_2 
       (.I0(newRequestIsWrite),
        .I1(currentState__0[0]),
        .I2(\bitsRemaining[2]_i_2_n_0 ),
        .I3(currentState__0[1]),
        .I4(currentState__0[2]),
        .O(\bitsRemaining[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hC1)) 
    \bitsRemaining[0]_i_3 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(currentState__0[1]),
        .I2(currentState__0[2]),
        .O(\bitsRemaining[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h82AA)) 
    \bitsRemaining[1]_i_1 
       (.I0(\bitsRemaining[3]_i_2_n_0 ),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(\bitsRemaining[3]_i_3_n_0 ),
        .O(\bitsRemaining[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080FFFFFF)) 
    \bitsRemaining[2]_i_1 
       (.I0(currentState__0[2]),
        .I1(currentState__0[0]),
        .I2(newRequestIsWrite),
        .I3(currentState__0[1]),
        .I4(\bitsRemaining[2]_i_2_n_0 ),
        .I5(\bitsRemaining[2]_i_3_n_0 ),
        .O(\bitsRemaining[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    \bitsRemaining[2]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[4]),
        .I4(Q[3]),
        .O(\bitsRemaining[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h1E1E1E1E1E1E1E00)) 
    \bitsRemaining[2]_i_3 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I4(currentState__0[1]),
        .I5(currentState__0[2]),
        .O(\bitsRemaining[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hA2A2A2A2A2A2A22A)) 
    \bitsRemaining[3]_i_1 
       (.I0(\bitsRemaining[3]_i_2_n_0 ),
        .I1(\bitsRemaining[3]_i_3_n_0 ),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\bitsRemaining[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h80FF0FFF)) 
    \bitsRemaining[3]_i_2 
       (.I0(newRequestIsWrite),
        .I1(currentState__0[0]),
        .I2(currentState__0[1]),
        .I3(\bitsRemaining[2]_i_2_n_0 ),
        .I4(currentState__0[2]),
        .O(\bitsRemaining[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h3EFEFEFEFEFEFEFE)) 
    \bitsRemaining[3]_i_3 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(currentState__0[2]),
        .I2(currentState__0[1]),
        .I3(\bitsRemaining[2]_i_2_n_0 ),
        .I4(currentState__0[0]),
        .I5(newRequestIsWrite),
        .O(\bitsRemaining[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF8FF8)) 
    \bitsRemaining[4]_i_1 
       (.I0(newRequestStart),
        .I1(currentState__0[0]),
        .I2(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I3(currentState__0[1]),
        .I4(currentState__0[2]),
        .O(bitsRemaining));
  LUT6 #(
    .INIT(64'hFFFFFFFFAAAAAAA8)) 
    \bitsRemaining[4]_i_2 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(\bitsRemaining[4]_i_3_n_0 ),
        .O(\bitsRemaining[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h08000000080000FF)) 
    \bitsRemaining[4]_i_3 
       (.I0(\bitsRemaining[2]_i_2_n_0 ),
        .I1(currentState__0[0]),
        .I2(newRequestIsWrite),
        .I3(currentState__0[2]),
        .I4(currentState__0[1]),
        .I5(\FSM_sequential_currentState_reg_n_0_[3] ),
        .O(\bitsRemaining[4]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bitsRemaining_reg[0] 
       (.C(clkin25),
        .CE(bitsRemaining),
        .D(\bitsRemaining[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bitsRemaining_reg[1] 
       (.C(clkin25),
        .CE(bitsRemaining),
        .D(\bitsRemaining[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bitsRemaining_reg[2] 
       (.C(clkin25),
        .CE(bitsRemaining),
        .D(\bitsRemaining[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bitsRemaining_reg[3] 
       (.C(clkin25),
        .CE(bitsRemaining),
        .D(\bitsRemaining[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bitsRemaining_reg[4] 
       (.C(clkin25),
        .CE(bitsRemaining),
        .D(\bitsRemaining[4]_i_2_n_0 ),
        .Q(Q[4]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h75007555)) 
    \currentState[0]_i_1 
       (.I0(\currentState_reg[3]_0 [0]),
        .I1(newRequestIsWrite),
        .I2(\currentState_reg[3]_0 [2]),
        .I3(\currentState_reg[3]_0 [1]),
        .I4(\currentState_reg[3]_0 [3]),
        .O(\currentState[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h36)) 
    \currentState[1]_i_1 
       (.I0(\currentState_reg[3]_0 [0]),
        .I1(\currentState_reg[3]_0 [1]),
        .I2(\currentState_reg[3]_0 [3]),
        .O(\currentState[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \currentState[2]_i_1 
       (.I0(\currentState_reg[3]_0 [2]),
        .I1(\currentState_reg[3]_0 [0]),
        .I2(\currentState_reg[3]_0 [1]),
        .O(\currentState[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAFAACAAAAFAAF)) 
    \currentState[3]_i_1 
       (.I0(\bitsRemaining[2]_i_2_n_0 ),
        .I1(newRequestStart),
        .I2(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I3(currentState__0[1]),
        .I4(currentState__0[2]),
        .I5(currentState__0[0]),
        .O(currentState));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \currentState[3]_i_2 
       (.I0(\currentState_reg[3]_0 [0]),
        .I1(\currentState_reg[3]_0 [2]),
        .I2(\currentState_reg[3]_0 [1]),
        .I3(\currentState_reg[3]_0 [3]),
        .O(\currentState[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[0] 
       (.C(clkin25),
        .CE(currentState),
        .D(\currentState[0]_i_1_n_0 ),
        .Q(\currentState_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[1] 
       (.C(clkin25),
        .CE(currentState),
        .D(\currentState[1]_i_1_n_0 ),
        .Q(\currentState_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[2] 
       (.C(clkin25),
        .CE(currentState),
        .D(\currentState[2]_i_1_n_0 ),
        .Q(\currentState_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[3] 
       (.C(clkin25),
        .CE(currentState),
        .D(\currentState[3]_i_2_n_0 ),
        .Q(\currentState_reg[3]_0 [3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFD500)) 
    mdio_i_i_1
       (.I0(mdio_i_i_2_n_0),
        .I1(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I2(mdio_i_reg_i_3_n_0),
        .I3(mdio_i_i_4_n_0),
        .I4(mdio_i_i_5_n_0),
        .I5(mdio_i_i_6_n_0),
        .O(mdio_i_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    mdio_i_i_10
       (.I0(currentState__0[1]),
        .I1(\FSM_sequential_currentState_reg_n_0_[3] ),
        .O(mdio_i_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hAD0D0505)) 
    mdio_i_i_11
       (.I0(currentState__0[2]),
        .I1(\opcodeValue_reg_n_0_[0] ),
        .I2(Q[0]),
        .I3(\opcodeValue_reg_n_0_[1] ),
        .I4(currentState__0[0]),
        .O(mdio_i_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h8F)) 
    mdio_i_i_12
       (.I0(newRequestDevTypeRegister[4]),
        .I1(Q[2]),
        .I2(currentState__0[2]),
        .O(mdio_i_i_12_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mdio_i_i_13
       (.I0(newRequestDevTypeRegister[3]),
        .I1(newRequestDevTypeRegister[2]),
        .I2(Q[1]),
        .I3(newRequestDevTypeRegister[1]),
        .I4(Q[0]),
        .I5(newRequestDevTypeRegister[0]),
        .O(mdio_i_i_13_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mdio_i_i_14
       (.I0(newRequestData[3]),
        .I1(newRequestData[2]),
        .I2(Q[1]),
        .I3(newRequestData[1]),
        .I4(Q[0]),
        .I5(newRequestData[0]),
        .O(mdio_i_i_14_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mdio_i_i_15
       (.I0(newRequestData[7]),
        .I1(newRequestData[6]),
        .I2(Q[1]),
        .I3(newRequestData[5]),
        .I4(Q[0]),
        .I5(newRequestData[4]),
        .O(mdio_i_i_15_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mdio_i_i_16
       (.I0(newRequestData[11]),
        .I1(newRequestData[10]),
        .I2(Q[1]),
        .I3(newRequestData[9]),
        .I4(Q[0]),
        .I5(newRequestData[8]),
        .O(mdio_i_i_16_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mdio_i_i_17
       (.I0(newRequestData[15]),
        .I1(newRequestData[14]),
        .I2(Q[1]),
        .I3(newRequestData[13]),
        .I4(Q[0]),
        .I5(newRequestData[12]),
        .O(mdio_i_i_17_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h57F7)) 
    mdio_i_i_2
       (.I0(currentState__0[2]),
        .I1(\opcodeValue_reg_n_0_[0] ),
        .I2(Q[0]),
        .I3(\opcodeValue_reg_n_0_[1] ),
        .O(mdio_i_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h1)) 
    mdio_i_i_4
       (.I0(currentState__0[0]),
        .I1(currentState__0[1]),
        .O(mdio_i_i_4_n_0));
  LUT6 #(
    .INIT(64'h0000CA0000000000)) 
    mdio_i_i_5
       (.I0(mdio_i_i_9_n_0),
        .I1(newRequestPHYAddress[4]),
        .I2(Q[2]),
        .I3(currentState__0[2]),
        .I4(currentState__0[1]),
        .I5(currentState__0[0]),
        .O(mdio_i_i_5_n_0));
  LUT6 #(
    .INIT(64'h8A888A8A8A888A88)) 
    mdio_i_i_6
       (.I0(mdio_i_i_10_n_0),
        .I1(mdio_i_i_11_n_0),
        .I2(currentState__0[0]),
        .I3(mdio_i_i_12_n_0),
        .I4(Q[2]),
        .I5(mdio_i_i_13_n_0),
        .O(mdio_i_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    mdio_i_i_9
       (.I0(newRequestPHYAddress[3]),
        .I1(newRequestPHYAddress[2]),
        .I2(Q[1]),
        .I3(newRequestPHYAddress[1]),
        .I4(Q[0]),
        .I5(newRequestPHYAddress[0]),
        .O(mdio_i_i_9_n_0));
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 MDIO MDIO_I" *) 
  FDRE #(
    .INIT(1'b0)) 
    mdio_i_reg
       (.C(clkin25),
        .CE(1'b1),
        .D(mdio_i_i_1_n_0),
        .Q(mdio_i),
        .R(1'b0));
  MUXF8 mdio_i_reg_i_3
       (.I0(mdio_i_reg_i_7_n_0),
        .I1(mdio_i_reg_i_8_n_0),
        .O(mdio_i_reg_i_3_n_0),
        .S(Q[3]));
  MUXF7 mdio_i_reg_i_7
       (.I0(mdio_i_i_14_n_0),
        .I1(mdio_i_i_15_n_0),
        .O(mdio_i_reg_i_7_n_0),
        .S(Q[2]));
  MUXF7 mdio_i_reg_i_8
       (.I0(mdio_i_i_16_n_0),
        .I1(mdio_i_i_17_n_0),
        .O(mdio_i_reg_i_8_n_0),
        .S(Q[2]));
  LUT6 #(
    .INIT(64'hF7FFFFF004000000)) 
    mdio_t_ctrl_i_1
       (.I0(newRequestIsWrite),
        .I1(currentState__0[0]),
        .I2(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I3(currentState__0[2]),
        .I4(currentState__0[1]),
        .I5(mdio_t_ctrl),
        .O(mdio_t_ctrl_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    mdio_t_ctrl_reg
       (.C(clkin25),
        .CE(1'b1),
        .D(mdio_t_ctrl_i_1_n_0),
        .Q(mdio_t_ctrl),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \opcodeValue[0]_i_1 
       (.I0(newRequestIsWrite),
        .I1(currentState__0[2]),
        .O(\opcodeValue[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0F00004000000040)) 
    \opcodeValue[1]_i_1 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(newRequestStart),
        .I2(currentState__0[0]),
        .I3(currentState__0[1]),
        .I4(currentState__0[2]),
        .I5(\bitsRemaining[2]_i_2_n_0 ),
        .O(opcodeValue));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \opcodeValue[1]_i_2 
       (.I0(newRequestIsWrite),
        .I1(currentState__0[0]),
        .O(\opcodeValue[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \opcodeValue_reg[0] 
       (.C(clkin25),
        .CE(opcodeValue),
        .D(\opcodeValue[0]_i_1_n_0 ),
        .Q(\opcodeValue_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \opcodeValue_reg[1] 
       (.C(clkin25),
        .CE(opcodeValue),
        .D(\opcodeValue[1]_i_2_n_0 ),
        .Q(\opcodeValue_reg_n_0_[1] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h888F8F8F88808080)) 
    \readInData[0]_i_1 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(mdio_o),
        .I2(\readInData[15]_i_2_n_0 ),
        .I3(\readInData[7]_i_2_n_0 ),
        .I4(\bitsRemaining[2]_i_2_n_0 ),
        .I5(DBG_InProgressRead[0]),
        .O(\readInData[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8F888F8F80888080)) 
    \readInData[10]_i_1 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(mdio_o),
        .I2(\readInData[15]_i_2_n_0 ),
        .I3(\readInData[10]_i_2_n_0 ),
        .I4(\readInData[15]_i_3_n_0 ),
        .I5(DBG_InProgressRead[10]),
        .O(\readInData[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \readInData[10]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\readInData[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F888F8F80888080)) 
    \readInData[11]_i_1 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(mdio_o),
        .I2(\readInData[15]_i_2_n_0 ),
        .I3(\readInData[11]_i_2_n_0 ),
        .I4(\readInData[15]_i_3_n_0 ),
        .I5(DBG_InProgressRead[11]),
        .O(\readInData[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \readInData[11]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\readInData[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBABBB8888A888)) 
    \readInData[12]_i_1 
       (.I0(readInData0_in),
        .I1(\readInData[15]_i_2_n_0 ),
        .I2(\readInData[15]_i_3_n_0 ),
        .I3(Q[2]),
        .I4(\readInData[12]_i_3_n_0 ),
        .I5(DBG_InProgressRead[12]),
        .O(\readInData[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \readInData[12]_i_2 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(mdio_o),
        .O(readInData0_in));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \readInData[12]_i_3 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(\readInData[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8F888F8F80888080)) 
    \readInData[13]_i_1 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(mdio_o),
        .I2(\readInData[15]_i_2_n_0 ),
        .I3(\readInData[13]_i_2_n_0 ),
        .I4(\readInData[15]_i_3_n_0 ),
        .I5(DBG_InProgressRead[13]),
        .O(\readInData[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \readInData[13]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(\readInData[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F888F8F80888080)) 
    \readInData[14]_i_1 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(mdio_o),
        .I2(\readInData[15]_i_2_n_0 ),
        .I3(\readInData[14]_i_2_n_0 ),
        .I4(\readInData[15]_i_3_n_0 ),
        .I5(DBG_InProgressRead[14]),
        .O(\readInData[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \readInData[14]_i_2 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .O(\readInData[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h888F8F8F88808080)) 
    \readInData[15]_i_1 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(mdio_o),
        .I2(\readInData[15]_i_2_n_0 ),
        .I3(\readInData[15]_i_3_n_0 ),
        .I4(\readInData[15]_i_4_n_0 ),
        .I5(DBG_InProgressRead[15]),
        .O(\readInData[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0100)) 
    \readInData[15]_i_2 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(currentState__0[1]),
        .I2(currentState__0[2]),
        .I3(currentState__0[0]),
        .O(\readInData[15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00000400)) 
    \readInData[15]_i_3 
       (.I0(currentState__0[1]),
        .I1(currentState__0[0]),
        .I2(currentState__0[2]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(\readInData[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \readInData[15]_i_4 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\readInData[15]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBABB88888A88)) 
    \readInData[1]_i_1 
       (.I0(readInData0_in),
        .I1(\readInData[15]_i_2_n_0 ),
        .I2(\readInData[9]_i_2_n_0 ),
        .I3(\readInData[7]_i_2_n_0 ),
        .I4(\readInData[7]_i_3_n_0 ),
        .I5(DBG_InProgressRead[1]),
        .O(\readInData[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBABB88888A88)) 
    \readInData[2]_i_1 
       (.I0(readInData0_in),
        .I1(\readInData[15]_i_2_n_0 ),
        .I2(\readInData[10]_i_2_n_0 ),
        .I3(\readInData[7]_i_2_n_0 ),
        .I4(\readInData[7]_i_3_n_0 ),
        .I5(DBG_InProgressRead[2]),
        .O(\readInData[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBABB88888A88)) 
    \readInData[3]_i_1 
       (.I0(readInData0_in),
        .I1(\readInData[15]_i_2_n_0 ),
        .I2(\readInData[11]_i_2_n_0 ),
        .I3(\readInData[7]_i_2_n_0 ),
        .I4(\readInData[7]_i_3_n_0 ),
        .I5(DBG_InProgressRead[3]),
        .O(\readInData[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBABBB8888A888)) 
    \readInData[4]_i_1 
       (.I0(readInData0_in),
        .I1(\readInData[15]_i_2_n_0 ),
        .I2(\readInData[4]_i_2_n_0 ),
        .I3(\readInData[7]_i_2_n_0 ),
        .I4(\readInData[7]_i_3_n_0 ),
        .I5(DBG_InProgressRead[4]),
        .O(\readInData[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \readInData[4]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\readInData[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBABB88888A88)) 
    \readInData[5]_i_1 
       (.I0(readInData0_in),
        .I1(\readInData[15]_i_2_n_0 ),
        .I2(\readInData[13]_i_2_n_0 ),
        .I3(\readInData[7]_i_2_n_0 ),
        .I4(\readInData[7]_i_3_n_0 ),
        .I5(DBG_InProgressRead[5]),
        .O(\readInData[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBBABB88888A88)) 
    \readInData[6]_i_1 
       (.I0(readInData0_in),
        .I1(\readInData[15]_i_2_n_0 ),
        .I2(\readInData[14]_i_2_n_0 ),
        .I3(\readInData[7]_i_2_n_0 ),
        .I4(\readInData[7]_i_3_n_0 ),
        .I5(DBG_InProgressRead[6]),
        .O(\readInData[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBBBBABBB8888A888)) 
    \readInData[7]_i_1 
       (.I0(readInData0_in),
        .I1(\readInData[15]_i_2_n_0 ),
        .I2(\readInData[15]_i_4_n_0 ),
        .I3(\readInData[7]_i_2_n_0 ),
        .I4(\readInData[7]_i_3_n_0 ),
        .I5(DBG_InProgressRead[7]),
        .O(\readInData[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \readInData[7]_i_2 
       (.I0(currentState__0[2]),
        .I1(currentState__0[0]),
        .I2(currentState__0[1]),
        .O(\readInData[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \readInData[7]_i_3 
       (.I0(Q[3]),
        .I1(Q[4]),
        .O(\readInData[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h888F8F8F88808080)) 
    \readInData[8]_i_1 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(mdio_o),
        .I2(\readInData[15]_i_2_n_0 ),
        .I3(\readInData[15]_i_3_n_0 ),
        .I4(\readInData[8]_i_2_n_0 ),
        .I5(DBG_InProgressRead[8]),
        .O(\readInData[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \readInData[8]_i_2 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(\readInData[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8F888F8F80888080)) 
    \readInData[9]_i_1 
       (.I0(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I1(mdio_o),
        .I2(\readInData[15]_i_2_n_0 ),
        .I3(\readInData[9]_i_2_n_0 ),
        .I4(\readInData[15]_i_3_n_0 ),
        .I5(DBG_InProgressRead[9]),
        .O(\readInData[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \readInData[9]_i_2 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(\readInData[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[0] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[0]_i_1_n_0 ),
        .Q(DBG_InProgressRead[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[10] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[10]_i_1_n_0 ),
        .Q(DBG_InProgressRead[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[11] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[11]_i_1_n_0 ),
        .Q(DBG_InProgressRead[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[12] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[12]_i_1_n_0 ),
        .Q(DBG_InProgressRead[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[13] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[13]_i_1_n_0 ),
        .Q(DBG_InProgressRead[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[14] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[14]_i_1_n_0 ),
        .Q(DBG_InProgressRead[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[15] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[15]_i_1_n_0 ),
        .Q(DBG_InProgressRead[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[1] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[1]_i_1_n_0 ),
        .Q(DBG_InProgressRead[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[2] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[2]_i_1_n_0 ),
        .Q(DBG_InProgressRead[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[3] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[3]_i_1_n_0 ),
        .Q(DBG_InProgressRead[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[4] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[4]_i_1_n_0 ),
        .Q(DBG_InProgressRead[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[5] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[5]_i_1_n_0 ),
        .Q(DBG_InProgressRead[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[6] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[6]_i_1_n_0 ),
        .Q(DBG_InProgressRead[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[7] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[7]_i_1_n_0 ),
        .Q(DBG_InProgressRead[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[8] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[8]_i_1_n_0 ),
        .Q(DBG_InProgressRead[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \readInData_reg[9] 
       (.C(clkin25),
        .CE(1'b1),
        .D(\readInData[9]_i_1_n_0 ),
        .Q(DBG_InProgressRead[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h40)) 
    \registerReadData[15]_i_1 
       (.I0(newRequestIsWrite),
        .I1(currentState__0[1]),
        .I2(\FSM_sequential_currentState_reg_n_0_[3] ),
        .O(\registerReadData[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[0] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[0]),
        .Q(registerReadData[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[10] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[10]),
        .Q(registerReadData[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[11] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[11]),
        .Q(registerReadData[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[12] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[12]),
        .Q(registerReadData[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[13] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[13]),
        .Q(registerReadData[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[14] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[14]),
        .Q(registerReadData[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[15] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[15]),
        .Q(registerReadData[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[1] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[1]),
        .Q(registerReadData[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[2] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[2]),
        .Q(registerReadData[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[3] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[3]),
        .Q(registerReadData[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[4] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[4]),
        .Q(registerReadData[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[5] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[5]),
        .Q(registerReadData[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[6] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[6]),
        .Q(registerReadData[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[7] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[7]),
        .Q(registerReadData[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[8] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[8]),
        .Q(registerReadData[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \registerReadData_reg[9] 
       (.C(clkin25),
        .CE(\registerReadData[15]_i_1_n_0 ),
        .D(DBG_InProgressRead[9]),
        .Q(registerReadData[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFDD03000000)) 
    registerReadReady_i_1
       (.I0(currentState__0[0]),
        .I1(currentState__0[2]),
        .I2(newRequestIsWrite),
        .I3(currentState__0[1]),
        .I4(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I5(registerReadReady),
        .O(registerReadReady_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    registerReadReady_reg
       (.C(clkin25),
        .CE(1'b1),
        .D(registerReadReady_i_1_n_0),
        .Q(registerReadReady),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hFFFD3000)) 
    registerWriteComplete_i_1
       (.I0(currentState__0[0]),
        .I1(currentState__0[2]),
        .I2(currentState__0[1]),
        .I3(\FSM_sequential_currentState_reg_n_0_[3] ),
        .I4(registerWriteComplete),
        .O(registerWriteComplete_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    registerWriteComplete_reg
       (.C(clkin25),
        .CE(1'b1),
        .D(registerWriteComplete_i_1_n_0),
        .Q(registerWriteComplete),
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
