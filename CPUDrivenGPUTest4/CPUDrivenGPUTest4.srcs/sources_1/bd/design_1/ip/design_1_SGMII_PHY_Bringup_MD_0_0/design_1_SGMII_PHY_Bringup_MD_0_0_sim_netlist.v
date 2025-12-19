// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sun Oct 13 16:49:24 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_SGMII_PHY_Bringup_MD_0_0/design_1_SGMII_PHY_Bringup_MD_0_0_sim_netlist.v
// Design      : design_1_SGMII_PHY_Bringup_MD_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_SGMII_PHY_Bringup_MD_0_0,SGMII_PHY_Bringup_MDIO,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "SGMII_PHY_Bringup_MDIO,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_SGMII_PHY_Bringup_MD_0_0
   (clkin25,
    dbgRst,
    registerReadData,
    registerReadReady,
    registerWriteComplete,
    newRequestPHYAddress,
    newRequestDevTypeRegister,
    newRequestRegister,
    newRequestData,
    newRequestIsWrite,
    newRequestStart,
    phyBringupComplete,
    DBG_RegReadIndex,
    DBG_RegReadData,
    DBG_RegPCSPMAReadIndex,
    DBG_RegPCSPMAReadData,
    DBG_Bringup_State);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clkin25 CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clkin25, FREQ_HZ 2500000, PHASE 0.000, CLK_DOMAIN design_1_ClockDivider4_1_0_0_clkout25" *) input clkin25;
  input dbgRst;
  input [15:0]registerReadData;
  input registerReadReady;
  input registerWriteComplete;
  output [4:0]newRequestPHYAddress;
  output [4:0]newRequestDevTypeRegister;
  output [15:0]newRequestRegister;
  output [15:0]newRequestData;
  output newRequestIsWrite;
  output newRequestStart;
  output phyBringupComplete;
  output [4:0]DBG_RegReadIndex;
  output [15:0]DBG_RegReadData;
  output [4:0]DBG_RegPCSPMAReadIndex;
  output [15:0]DBG_RegPCSPMAReadData;
  output [4:0]DBG_Bringup_State;

  wire \<const0> ;
  wire [3:0]\^DBG_Bringup_State ;
  wire [4:0]DBG_RegPCSPMAReadIndex;
  wire [15:0]DBG_RegReadData;
  wire clkin25;
  wire dbgRst;
  wire [14:0]\^newRequestData ;
  wire [4:0]newRequestDevTypeRegister;
  wire newRequestIsWrite;
  wire [1:0]\^newRequestPHYAddress ;
  wire newRequestStart;
  wire phyBringupComplete;
  wire [15:0]registerReadData;
  wire registerReadReady;
  wire registerWriteComplete;

  assign DBG_Bringup_State[4] = \<const0> ;
  assign DBG_Bringup_State[3:0] = \^DBG_Bringup_State [3:0];
  assign DBG_RegPCSPMAReadData[15:0] = DBG_RegReadData;
  assign DBG_RegReadIndex[4:0] = DBG_RegPCSPMAReadIndex;
  assign newRequestData[15] = \<const0> ;
  assign newRequestData[14:11] = \^newRequestData [14:11];
  assign newRequestData[10] = \<const0> ;
  assign newRequestData[9:0] = \^newRequestData [9:0];
  assign newRequestPHYAddress[4] = \<const0> ;
  assign newRequestPHYAddress[3] = \<const0> ;
  assign newRequestPHYAddress[2] = \<const0> ;
  assign newRequestPHYAddress[1:0] = \^newRequestPHYAddress [1:0];
  assign newRequestRegister[15] = \<const0> ;
  assign newRequestRegister[14] = \<const0> ;
  assign newRequestRegister[13] = \<const0> ;
  assign newRequestRegister[12] = \<const0> ;
  assign newRequestRegister[11] = \<const0> ;
  assign newRequestRegister[10] = \<const0> ;
  assign newRequestRegister[9] = \<const0> ;
  assign newRequestRegister[8] = \<const0> ;
  assign newRequestRegister[7] = \<const0> ;
  assign newRequestRegister[6] = \<const0> ;
  assign newRequestRegister[5] = \<const0> ;
  assign newRequestRegister[4] = \<const0> ;
  assign newRequestRegister[3] = \<const0> ;
  assign newRequestRegister[2] = \<const0> ;
  assign newRequestRegister[1] = \<const0> ;
  assign newRequestRegister[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  design_1_SGMII_PHY_Bringup_MD_0_0_SGMII_PHY_Bringup_MDIO U0
       (.DBG_RegReadData(DBG_RegReadData),
        .DBG_RegReadIndex(DBG_RegPCSPMAReadIndex),
        .Q(\^DBG_Bringup_State ),
        .clkin25(clkin25),
        .dbgRst(dbgRst),
        .newRequestData({\^newRequestData [14:11],\^newRequestData [9:0]}),
        .newRequestDevTypeRegister(newRequestDevTypeRegister),
        .newRequestIsWrite(newRequestIsWrite),
        .newRequestPHYAddress(\^newRequestPHYAddress ),
        .newRequestStart(newRequestStart),
        .phyBringupComplete(phyBringupComplete),
        .registerReadData(registerReadData),
        .registerReadReady(registerReadReady),
        .registerWriteComplete(registerWriteComplete));
endmodule

(* ORIG_REF_NAME = "SGMII_PHY_Bringup_MDIO" *) 
module design_1_SGMII_PHY_Bringup_MD_0_0_SGMII_PHY_Bringup_MDIO
   (Q,
    newRequestPHYAddress,
    newRequestDevTypeRegister,
    newRequestData,
    DBG_RegReadIndex,
    DBG_RegReadData,
    newRequestIsWrite,
    newRequestStart,
    phyBringupComplete,
    dbgRst,
    registerReadReady,
    registerReadData,
    clkin25,
    registerWriteComplete);
  output [3:0]Q;
  output [1:0]newRequestPHYAddress;
  output [4:0]newRequestDevTypeRegister;
  output [13:0]newRequestData;
  output [4:0]DBG_RegReadIndex;
  output [15:0]DBG_RegReadData;
  output newRequestIsWrite;
  output newRequestStart;
  output phyBringupComplete;
  input dbgRst;
  input registerReadReady;
  input [15:0]registerReadData;
  input clkin25;
  input registerWriteComplete;

  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[0]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[10]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[11]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[12]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[13]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[14]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[15]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[1]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[2]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[3]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[4]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[5]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[6]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[7]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[8]_INST_0_i_9_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_10_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_11_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_12_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_1_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_2_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_3_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_4_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_5_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_6_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_7_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_8_n_0 ;
  wire \DBG_RegPCSPMAReadData[9]_INST_0_i_9_n_0 ;
  wire [15:0]DBG_RegReadData;
  wire [4:0]DBG_RegReadIndex;
  wire [3:0]Q;
  wire clkin25;
  wire [4:0]currentReadRegister;
  wire [4:0]currentReadRegister_reg__0;
  wire \currentState[0]_i_1_n_0 ;
  wire \currentState[1]_i_1_n_0 ;
  wire \currentState[2]_i_1_n_0 ;
  wire \currentState[3]_i_1_n_0 ;
  wire \currentState[3]_i_2_n_0 ;
  wire \currentState[3]_i_3_n_0 ;
  wire \currentState[3]_i_4_n_0 ;
  wire dbgRst;
  wire \debugReadRegister[4]_i_1_n_0 ;
  wire [13:0]newRequestData;
  wire \newRequestData[13]_i_1_n_0 ;
  wire \newRequestData[14]_i_1_n_0 ;
  wire \newRequestData[6]_i_1_n_0 ;
  wire [14:0]newRequestData_0;
  wire [4:0]newRequestDevTypeRegister;
  wire \newRequestDevTypeRegister[0]_i_1_n_0 ;
  wire \newRequestDevTypeRegister[1]_i_1_n_0 ;
  wire \newRequestDevTypeRegister[2]_i_1_n_0 ;
  wire \newRequestDevTypeRegister[2]_i_2_n_0 ;
  wire \newRequestDevTypeRegister[3]_i_1_n_0 ;
  wire \newRequestDevTypeRegister[3]_i_2_n_0 ;
  wire \newRequestDevTypeRegister[4]_i_1_n_0 ;
  wire \newRequestDevTypeRegister[4]_i_2_n_0 ;
  wire \newRequestDevTypeRegister[4]_i_4_n_0 ;
  wire newRequestIsWrite;
  wire newRequestIsWrite_i_1_n_0;
  wire [1:0]newRequestPHYAddress;
  wire \newRequestPHYAddress[1]_i_1_n_0 ;
  wire \newRequestPHYAddress[1]_i_2_n_0 ;
  wire newRequestStart;
  wire newRequestStart_i_1_n_0;
  wire p_0_in4_in;
  wire phyBringupComplete;
  wire phyBringupComplete_i_1_n_0;
  wire [4:0]plusOp;
  wire [4:1]plusOp__7;
  wire [15:0]registerReadData;
  wire registerReadReady;
  wire registerWriteComplete;
  wire \specRegisters[0][15]_i_1_n_0 ;
  wire \specRegisters[0][15]_i_2_n_0 ;
  wire \specRegisters[10][15]_i_1_n_0 ;
  wire \specRegisters[10][15]_i_2_n_0 ;
  wire \specRegisters[11][15]_i_1_n_0 ;
  wire \specRegisters[11][15]_i_2_n_0 ;
  wire \specRegisters[12][15]_i_1_n_0 ;
  wire \specRegisters[12][15]_i_2_n_0 ;
  wire \specRegisters[13][15]_i_1_n_0 ;
  wire \specRegisters[13][15]_i_2_n_0 ;
  wire \specRegisters[14][15]_i_1_n_0 ;
  wire \specRegisters[14][15]_i_2_n_0 ;
  wire \specRegisters[15][15]_i_1_n_0 ;
  wire \specRegisters[15][15]_i_2_n_0 ;
  wire \specRegisters[16][15]_i_1_n_0 ;
  wire \specRegisters[16][15]_i_2_n_0 ;
  wire \specRegisters[17][15]_i_1_n_0 ;
  wire \specRegisters[17][15]_i_2_n_0 ;
  wire \specRegisters[18][15]_i_1_n_0 ;
  wire \specRegisters[18][15]_i_2_n_0 ;
  wire \specRegisters[19][15]_i_1_n_0 ;
  wire \specRegisters[19][15]_i_2_n_0 ;
  wire \specRegisters[1][15]_i_1_n_0 ;
  wire \specRegisters[1][15]_i_2_n_0 ;
  wire \specRegisters[20][15]_i_1_n_0 ;
  wire \specRegisters[20][15]_i_2_n_0 ;
  wire \specRegisters[21][15]_i_1_n_0 ;
  wire \specRegisters[21][15]_i_2_n_0 ;
  wire \specRegisters[22][15]_i_1_n_0 ;
  wire \specRegisters[22][15]_i_2_n_0 ;
  wire \specRegisters[23][15]_i_1_n_0 ;
  wire \specRegisters[23][15]_i_2_n_0 ;
  wire \specRegisters[23][15]_i_3_n_0 ;
  wire \specRegisters[24][15]_i_1_n_0 ;
  wire \specRegisters[24][15]_i_2_n_0 ;
  wire \specRegisters[25][15]_i_1_n_0 ;
  wire \specRegisters[25][15]_i_2_n_0 ;
  wire \specRegisters[26][15]_i_1_n_0 ;
  wire \specRegisters[26][15]_i_2_n_0 ;
  wire \specRegisters[27][15]_i_1_n_0 ;
  wire \specRegisters[27][15]_i_2_n_0 ;
  wire \specRegisters[28][15]_i_1_n_0 ;
  wire \specRegisters[28][15]_i_2_n_0 ;
  wire \specRegisters[29][15]_i_1_n_0 ;
  wire \specRegisters[29][15]_i_2_n_0 ;
  wire \specRegisters[2][15]_i_1_n_0 ;
  wire \specRegisters[2][15]_i_2_n_0 ;
  wire \specRegisters[30][15]_i_1_n_0 ;
  wire \specRegisters[30][15]_i_2_n_0 ;
  wire \specRegisters[31][15]_i_1_n_0 ;
  wire \specRegisters[31][15]_i_2_n_0 ;
  wire \specRegisters[3][15]_i_1_n_0 ;
  wire \specRegisters[3][15]_i_2_n_0 ;
  wire \specRegisters[4][15]_i_1_n_0 ;
  wire \specRegisters[4][15]_i_2_n_0 ;
  wire \specRegisters[5][15]_i_1_n_0 ;
  wire \specRegisters[5][15]_i_2_n_0 ;
  wire \specRegisters[6][15]_i_1_n_0 ;
  wire \specRegisters[6][15]_i_2_n_0 ;
  wire \specRegisters[7][15]_i_1_n_0 ;
  wire \specRegisters[7][15]_i_2_n_0 ;
  wire \specRegisters[8][15]_i_1_n_0 ;
  wire \specRegisters[8][15]_i_2_n_0 ;
  wire \specRegisters[9][15]_i_1_n_0 ;
  wire \specRegisters[9][15]_i_2_n_0 ;
  wire [15:0]\specRegisters_reg[0] ;
  wire [15:0]\specRegisters_reg[10] ;
  wire [15:0]\specRegisters_reg[11] ;
  wire [15:0]\specRegisters_reg[12] ;
  wire [15:0]\specRegisters_reg[13] ;
  wire [15:0]\specRegisters_reg[14] ;
  wire [15:0]\specRegisters_reg[15] ;
  wire [15:0]\specRegisters_reg[16] ;
  wire [15:0]\specRegisters_reg[17] ;
  wire [15:0]\specRegisters_reg[18] ;
  wire [15:0]\specRegisters_reg[19] ;
  wire [15:0]\specRegisters_reg[1] ;
  wire [15:0]\specRegisters_reg[20] ;
  wire [15:0]\specRegisters_reg[21] ;
  wire [15:0]\specRegisters_reg[22] ;
  wire [15:0]\specRegisters_reg[23] ;
  wire [15:0]\specRegisters_reg[24] ;
  wire [15:0]\specRegisters_reg[25] ;
  wire [15:0]\specRegisters_reg[26] ;
  wire [15:0]\specRegisters_reg[27] ;
  wire [15:0]\specRegisters_reg[28] ;
  wire [15:0]\specRegisters_reg[29] ;
  wire [15:0]\specRegisters_reg[2] ;
  wire [15:0]\specRegisters_reg[30] ;
  wire [15:0]\specRegisters_reg[31] ;
  wire [15:0]\specRegisters_reg[3] ;
  wire [15:0]\specRegisters_reg[4] ;
  wire [15:0]\specRegisters_reg[6] ;
  wire [15:0]\specRegisters_reg[7] ;
  wire [15:0]\specRegisters_reg[8] ;
  wire [15:0]\specRegisters_reg[9] ;
  wire \specRegisters_reg_n_0_[5][0] ;
  wire \specRegisters_reg_n_0_[5][10] ;
  wire \specRegisters_reg_n_0_[5][11] ;
  wire \specRegisters_reg_n_0_[5][12] ;
  wire \specRegisters_reg_n_0_[5][13] ;
  wire \specRegisters_reg_n_0_[5][15] ;
  wire \specRegisters_reg_n_0_[5][1] ;
  wire \specRegisters_reg_n_0_[5][2] ;
  wire \specRegisters_reg_n_0_[5][3] ;
  wire \specRegisters_reg_n_0_[5][4] ;
  wire \specRegisters_reg_n_0_[5][5] ;
  wire \specRegisters_reg_n_0_[5][6] ;
  wire \specRegisters_reg_n_0_[5][7] ;
  wire \specRegisters_reg_n_0_[5][8] ;
  wire \specRegisters_reg_n_0_[5][9] ;
  wire [3:0]waitFinishNextState;
  wire \waitFinishNextState[1]_i_1_n_0 ;
  wire \waitFinishNextState[3]_i_1_n_0 ;
  wire \waitFinishNextState_reg_n_0_[0] ;
  wire \waitFinishNextState_reg_n_0_[1] ;
  wire \waitFinishNextState_reg_n_0_[2] ;
  wire \waitFinishNextState_reg_n_0_[3] ;
  wire [0:0]writeExtendedRegisterAddr;
  wire \writeExtendedRegisterAddr[1]_i_1_n_0 ;
  wire \writeExtendedRegisterAddr[4]_i_1_n_0 ;
  wire \writeExtendedRegisterAddr_reg_n_0_[0] ;
  wire \writeExtendedRegisterAddr_reg_n_0_[1] ;
  wire \writeExtendedRegisterAddr_reg_n_0_[4] ;
  wire [14:6]writeExtendedRegisterData;
  wire \writeExtendedRegisterData[14]_i_1_n_0 ;

  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[0]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[0]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[0]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[0]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[0]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[0]));
  MUXF7 \DBG_RegPCSPMAReadData[0]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[0]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[0]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[0]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [0]),
        .I1(\specRegisters_reg[14] [0]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [0]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [0]),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[0]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [0]),
        .I1(\specRegisters_reg[2] [0]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [0]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [0]),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[0]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [0]),
        .I1(\specRegisters_reg[6] [0]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][0] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [0]),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[0]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[0]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[0]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[0]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[0]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[0]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[0]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[0]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[0]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[0]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [0]),
        .I1(\specRegisters_reg[26] [0]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [0]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [0]),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[0]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [0]),
        .I1(\specRegisters_reg[30] [0]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [0]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [0]),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[0]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [0]),
        .I1(\specRegisters_reg[18] [0]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [0]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [0]),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[0]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [0]),
        .I1(\specRegisters_reg[22] [0]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [0]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [0]),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[0]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [0]),
        .I1(\specRegisters_reg[10] [0]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [0]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [0]),
        .O(\DBG_RegPCSPMAReadData[0]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[10]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[10]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[10]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[10]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[10]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[10]));
  MUXF7 \DBG_RegPCSPMAReadData[10]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[10]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[10]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[10]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [10]),
        .I1(\specRegisters_reg[14] [10]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [10]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [10]),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[10]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [10]),
        .I1(\specRegisters_reg[2] [10]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [10]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [10]),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[10]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [10]),
        .I1(\specRegisters_reg[6] [10]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][10] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [10]),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[10]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[10]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[10]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[10]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[10]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[10]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[10]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[10]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[10]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[10]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [10]),
        .I1(\specRegisters_reg[26] [10]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [10]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [10]),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[10]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [10]),
        .I1(\specRegisters_reg[30] [10]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [10]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [10]),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[10]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [10]),
        .I1(\specRegisters_reg[18] [10]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [10]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [10]),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[10]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [10]),
        .I1(\specRegisters_reg[22] [10]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [10]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [10]),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[10]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [10]),
        .I1(\specRegisters_reg[10] [10]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [10]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [10]),
        .O(\DBG_RegPCSPMAReadData[10]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[11]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[11]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[11]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[11]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[11]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[11]));
  MUXF7 \DBG_RegPCSPMAReadData[11]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[11]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[11]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[11]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [11]),
        .I1(\specRegisters_reg[14] [11]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [11]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [11]),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[11]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [11]),
        .I1(\specRegisters_reg[2] [11]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [11]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [11]),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[11]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [11]),
        .I1(\specRegisters_reg[6] [11]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][11] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [11]),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[11]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[11]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[11]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[11]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[11]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[11]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[11]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[11]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[11]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[11]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [11]),
        .I1(\specRegisters_reg[26] [11]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [11]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [11]),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[11]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [11]),
        .I1(\specRegisters_reg[30] [11]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [11]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [11]),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[11]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [11]),
        .I1(\specRegisters_reg[18] [11]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [11]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [11]),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[11]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [11]),
        .I1(\specRegisters_reg[22] [11]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [11]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [11]),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[11]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [11]),
        .I1(\specRegisters_reg[10] [11]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [11]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [11]),
        .O(\DBG_RegPCSPMAReadData[11]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[12]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[12]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[12]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[12]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[12]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[12]));
  MUXF7 \DBG_RegPCSPMAReadData[12]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[12]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[12]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[12]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [12]),
        .I1(\specRegisters_reg[14] [12]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [12]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [12]),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[12]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [12]),
        .I1(\specRegisters_reg[2] [12]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [12]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [12]),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[12]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [12]),
        .I1(\specRegisters_reg[6] [12]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][12] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [12]),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[12]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[12]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[12]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[12]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[12]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[12]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[12]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[12]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[12]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[12]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [12]),
        .I1(\specRegisters_reg[26] [12]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [12]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [12]),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[12]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [12]),
        .I1(\specRegisters_reg[30] [12]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [12]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [12]),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[12]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [12]),
        .I1(\specRegisters_reg[18] [12]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [12]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [12]),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[12]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [12]),
        .I1(\specRegisters_reg[22] [12]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [12]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [12]),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[12]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [12]),
        .I1(\specRegisters_reg[10] [12]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [12]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [12]),
        .O(\DBG_RegPCSPMAReadData[12]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[13]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[13]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[13]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[13]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[13]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[13]));
  MUXF7 \DBG_RegPCSPMAReadData[13]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[13]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[13]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[13]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [13]),
        .I1(\specRegisters_reg[14] [13]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [13]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [13]),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[13]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [13]),
        .I1(\specRegisters_reg[2] [13]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [13]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [13]),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[13]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [13]),
        .I1(\specRegisters_reg[6] [13]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][13] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [13]),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[13]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[13]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[13]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[13]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[13]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[13]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[13]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[13]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[13]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[13]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [13]),
        .I1(\specRegisters_reg[26] [13]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [13]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [13]),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[13]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [13]),
        .I1(\specRegisters_reg[30] [13]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [13]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [13]),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[13]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [13]),
        .I1(\specRegisters_reg[18] [13]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [13]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [13]),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[13]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [13]),
        .I1(\specRegisters_reg[22] [13]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [13]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [13]),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[13]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [13]),
        .I1(\specRegisters_reg[10] [13]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [13]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [13]),
        .O(\DBG_RegPCSPMAReadData[13]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[14]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[14]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[14]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[14]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[14]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[14]));
  MUXF7 \DBG_RegPCSPMAReadData[14]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[14]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[14]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[14]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [14]),
        .I1(\specRegisters_reg[14] [14]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [14]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [14]),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[14]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [14]),
        .I1(\specRegisters_reg[2] [14]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [14]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [14]),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[14]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [14]),
        .I1(\specRegisters_reg[6] [14]),
        .I2(DBG_RegReadIndex[1]),
        .I3(p_0_in4_in),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [14]),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[14]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[14]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[14]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[14]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[14]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[14]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[14]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[14]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[14]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[14]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [14]),
        .I1(\specRegisters_reg[26] [14]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [14]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [14]),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[14]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [14]),
        .I1(\specRegisters_reg[30] [14]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [14]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [14]),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[14]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [14]),
        .I1(\specRegisters_reg[18] [14]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [14]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [14]),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[14]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [14]),
        .I1(\specRegisters_reg[22] [14]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [14]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [14]),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[14]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [14]),
        .I1(\specRegisters_reg[10] [14]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [14]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [14]),
        .O(\DBG_RegPCSPMAReadData[14]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[15]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[15]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[15]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[15]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[15]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[15]));
  MUXF7 \DBG_RegPCSPMAReadData[15]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[15]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[15]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[15]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [15]),
        .I1(\specRegisters_reg[14] [15]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [15]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [15]),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[15]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [15]),
        .I1(\specRegisters_reg[2] [15]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [15]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [15]),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[15]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [15]),
        .I1(\specRegisters_reg[6] [15]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][15] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [15]),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[15]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[15]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[15]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[15]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[15]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[15]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[15]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[15]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[15]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[15]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [15]),
        .I1(\specRegisters_reg[26] [15]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [15]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [15]),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[15]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [15]),
        .I1(\specRegisters_reg[30] [15]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [15]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [15]),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[15]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [15]),
        .I1(\specRegisters_reg[18] [15]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [15]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [15]),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[15]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [15]),
        .I1(\specRegisters_reg[22] [15]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [15]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [15]),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[15]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [15]),
        .I1(\specRegisters_reg[10] [15]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [15]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [15]),
        .O(\DBG_RegPCSPMAReadData[15]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[1]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[1]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[1]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[1]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[1]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[1]));
  MUXF7 \DBG_RegPCSPMAReadData[1]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[1]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[1]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[1]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [1]),
        .I1(\specRegisters_reg[14] [1]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [1]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [1]),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[1]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [1]),
        .I1(\specRegisters_reg[2] [1]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [1]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [1]),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[1]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [1]),
        .I1(\specRegisters_reg[6] [1]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][1] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [1]),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[1]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[1]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[1]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[1]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[1]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[1]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[1]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[1]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[1]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[1]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [1]),
        .I1(\specRegisters_reg[26] [1]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [1]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [1]),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[1]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [1]),
        .I1(\specRegisters_reg[30] [1]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [1]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [1]),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[1]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [1]),
        .I1(\specRegisters_reg[18] [1]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [1]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [1]),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[1]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [1]),
        .I1(\specRegisters_reg[22] [1]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [1]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [1]),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[1]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [1]),
        .I1(\specRegisters_reg[10] [1]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [1]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [1]),
        .O(\DBG_RegPCSPMAReadData[1]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[2]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[2]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[2]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[2]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[2]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[2]));
  MUXF7 \DBG_RegPCSPMAReadData[2]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[2]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[2]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[2]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [2]),
        .I1(\specRegisters_reg[14] [2]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [2]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [2]),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[2]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [2]),
        .I1(\specRegisters_reg[2] [2]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [2]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [2]),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[2]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [2]),
        .I1(\specRegisters_reg[6] [2]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][2] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [2]),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[2]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[2]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[2]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[2]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[2]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[2]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[2]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[2]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[2]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[2]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [2]),
        .I1(\specRegisters_reg[26] [2]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [2]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [2]),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[2]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [2]),
        .I1(\specRegisters_reg[30] [2]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [2]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [2]),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[2]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [2]),
        .I1(\specRegisters_reg[18] [2]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [2]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [2]),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[2]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [2]),
        .I1(\specRegisters_reg[22] [2]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [2]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [2]),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[2]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [2]),
        .I1(\specRegisters_reg[10] [2]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [2]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [2]),
        .O(\DBG_RegPCSPMAReadData[2]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[3]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[3]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[3]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[3]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[3]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[3]));
  MUXF7 \DBG_RegPCSPMAReadData[3]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[3]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[3]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[3]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [3]),
        .I1(\specRegisters_reg[14] [3]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [3]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [3]),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[3]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [3]),
        .I1(\specRegisters_reg[2] [3]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [3]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [3]),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[3]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [3]),
        .I1(\specRegisters_reg[6] [3]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][3] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [3]),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[3]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[3]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[3]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[3]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[3]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[3]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[3]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[3]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[3]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[3]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [3]),
        .I1(\specRegisters_reg[26] [3]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [3]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [3]),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[3]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [3]),
        .I1(\specRegisters_reg[30] [3]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [3]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [3]),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[3]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [3]),
        .I1(\specRegisters_reg[18] [3]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [3]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [3]),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[3]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [3]),
        .I1(\specRegisters_reg[22] [3]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [3]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [3]),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[3]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [3]),
        .I1(\specRegisters_reg[10] [3]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [3]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [3]),
        .O(\DBG_RegPCSPMAReadData[3]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[4]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[4]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[4]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[4]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[4]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[4]));
  MUXF7 \DBG_RegPCSPMAReadData[4]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[4]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[4]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[4]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [4]),
        .I1(\specRegisters_reg[14] [4]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [4]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [4]),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[4]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [4]),
        .I1(\specRegisters_reg[2] [4]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [4]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [4]),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[4]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [4]),
        .I1(\specRegisters_reg[6] [4]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][4] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [4]),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[4]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[4]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[4]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[4]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[4]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[4]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[4]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[4]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[4]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[4]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [4]),
        .I1(\specRegisters_reg[26] [4]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [4]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [4]),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[4]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [4]),
        .I1(\specRegisters_reg[30] [4]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [4]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [4]),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[4]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [4]),
        .I1(\specRegisters_reg[18] [4]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [4]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [4]),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[4]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [4]),
        .I1(\specRegisters_reg[22] [4]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [4]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [4]),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[4]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [4]),
        .I1(\specRegisters_reg[10] [4]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [4]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [4]),
        .O(\DBG_RegPCSPMAReadData[4]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[5]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[5]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[5]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[5]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[5]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[5]));
  MUXF7 \DBG_RegPCSPMAReadData[5]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[5]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[5]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[5]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [5]),
        .I1(\specRegisters_reg[14] [5]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [5]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [5]),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[5]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [5]),
        .I1(\specRegisters_reg[2] [5]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [5]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [5]),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[5]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [5]),
        .I1(\specRegisters_reg[6] [5]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][5] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [5]),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[5]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[5]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[5]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[5]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[5]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[5]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[5]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[5]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[5]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[5]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [5]),
        .I1(\specRegisters_reg[26] [5]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [5]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [5]),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[5]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [5]),
        .I1(\specRegisters_reg[30] [5]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [5]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [5]),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[5]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [5]),
        .I1(\specRegisters_reg[18] [5]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [5]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [5]),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[5]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [5]),
        .I1(\specRegisters_reg[22] [5]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [5]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [5]),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[5]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [5]),
        .I1(\specRegisters_reg[10] [5]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [5]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [5]),
        .O(\DBG_RegPCSPMAReadData[5]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[6]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[6]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[6]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[6]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[6]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[6]));
  MUXF7 \DBG_RegPCSPMAReadData[6]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[6]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[6]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[6]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [6]),
        .I1(\specRegisters_reg[14] [6]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [6]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [6]),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[6]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [6]),
        .I1(\specRegisters_reg[2] [6]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [6]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [6]),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[6]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [6]),
        .I1(\specRegisters_reg[6] [6]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][6] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [6]),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[6]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[6]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[6]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[6]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[6]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[6]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[6]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[6]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[6]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[6]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [6]),
        .I1(\specRegisters_reg[26] [6]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [6]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [6]),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[6]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [6]),
        .I1(\specRegisters_reg[30] [6]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [6]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [6]),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[6]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [6]),
        .I1(\specRegisters_reg[18] [6]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [6]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [6]),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[6]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [6]),
        .I1(\specRegisters_reg[22] [6]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [6]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [6]),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[6]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [6]),
        .I1(\specRegisters_reg[10] [6]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [6]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [6]),
        .O(\DBG_RegPCSPMAReadData[6]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[7]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[7]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[7]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[7]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[7]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[7]));
  MUXF7 \DBG_RegPCSPMAReadData[7]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[7]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[7]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[7]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [7]),
        .I1(\specRegisters_reg[14] [7]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [7]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [7]),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[7]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [7]),
        .I1(\specRegisters_reg[2] [7]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [7]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [7]),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[7]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [7]),
        .I1(\specRegisters_reg[6] [7]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][7] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [7]),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[7]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[7]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[7]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[7]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[7]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[7]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[7]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[7]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[7]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[7]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [7]),
        .I1(\specRegisters_reg[26] [7]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [7]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [7]),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[7]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [7]),
        .I1(\specRegisters_reg[30] [7]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [7]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [7]),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[7]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [7]),
        .I1(\specRegisters_reg[18] [7]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [7]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [7]),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[7]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [7]),
        .I1(\specRegisters_reg[22] [7]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [7]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [7]),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[7]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [7]),
        .I1(\specRegisters_reg[10] [7]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [7]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [7]),
        .O(\DBG_RegPCSPMAReadData[7]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[8]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[8]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[8]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[8]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[8]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[8]));
  MUXF7 \DBG_RegPCSPMAReadData[8]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[8]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[8]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[8]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [8]),
        .I1(\specRegisters_reg[14] [8]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [8]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [8]),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[8]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [8]),
        .I1(\specRegisters_reg[2] [8]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [8]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [8]),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[8]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [8]),
        .I1(\specRegisters_reg[6] [8]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][8] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [8]),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[8]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[8]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[8]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[8]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[8]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[8]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[8]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[8]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[8]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[8]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [8]),
        .I1(\specRegisters_reg[26] [8]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [8]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [8]),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[8]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [8]),
        .I1(\specRegisters_reg[30] [8]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [8]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [8]),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[8]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [8]),
        .I1(\specRegisters_reg[18] [8]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [8]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [8]),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[8]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [8]),
        .I1(\specRegisters_reg[22] [8]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [8]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [8]),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[8]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [8]),
        .I1(\specRegisters_reg[10] [8]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [8]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [8]),
        .O(\DBG_RegPCSPMAReadData[8]_INST_0_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[9]_INST_0 
       (.I0(\DBG_RegPCSPMAReadData[9]_INST_0_i_1_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[9]_INST_0_i_2_n_0 ),
        .I2(DBG_RegReadIndex[4]),
        .I3(\DBG_RegPCSPMAReadData[9]_INST_0_i_3_n_0 ),
        .I4(DBG_RegReadIndex[3]),
        .I5(\DBG_RegPCSPMAReadData[9]_INST_0_i_4_n_0 ),
        .O(DBG_RegReadData[9]));
  MUXF7 \DBG_RegPCSPMAReadData[9]_INST_0_i_1 
       (.I0(\DBG_RegPCSPMAReadData[9]_INST_0_i_5_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[9]_INST_0_i_6_n_0 ),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_1_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[9]_INST_0_i_10 
       (.I0(\specRegisters_reg[15] [9]),
        .I1(\specRegisters_reg[14] [9]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[13] [9]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[12] [9]),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[9]_INST_0_i_11 
       (.I0(\specRegisters_reg[3] [9]),
        .I1(\specRegisters_reg[2] [9]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[1] [9]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[0] [9]),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[9]_INST_0_i_12 
       (.I0(\specRegisters_reg[7] [9]),
        .I1(\specRegisters_reg[6] [9]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg_n_0_[5][9] ),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[4] [9]),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_12_n_0 ));
  MUXF7 \DBG_RegPCSPMAReadData[9]_INST_0_i_2 
       (.I0(\DBG_RegPCSPMAReadData[9]_INST_0_i_7_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[9]_INST_0_i_8_n_0 ),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_2_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[9]_INST_0_i_3 
       (.I0(\DBG_RegPCSPMAReadData[9]_INST_0_i_9_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[9]_INST_0_i_10_n_0 ),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_3_n_0 ),
        .S(DBG_RegReadIndex[2]));
  MUXF7 \DBG_RegPCSPMAReadData[9]_INST_0_i_4 
       (.I0(\DBG_RegPCSPMAReadData[9]_INST_0_i_11_n_0 ),
        .I1(\DBG_RegPCSPMAReadData[9]_INST_0_i_12_n_0 ),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_4_n_0 ),
        .S(DBG_RegReadIndex[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[9]_INST_0_i_5 
       (.I0(\specRegisters_reg[27] [9]),
        .I1(\specRegisters_reg[26] [9]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[25] [9]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[24] [9]),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[9]_INST_0_i_6 
       (.I0(\specRegisters_reg[31] [9]),
        .I1(\specRegisters_reg[30] [9]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[29] [9]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[28] [9]),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[9]_INST_0_i_7 
       (.I0(\specRegisters_reg[19] [9]),
        .I1(\specRegisters_reg[18] [9]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[17] [9]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[16] [9]),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[9]_INST_0_i_8 
       (.I0(\specRegisters_reg[23] [9]),
        .I1(\specRegisters_reg[22] [9]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[21] [9]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[20] [9]),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \DBG_RegPCSPMAReadData[9]_INST_0_i_9 
       (.I0(\specRegisters_reg[11] [9]),
        .I1(\specRegisters_reg[10] [9]),
        .I2(DBG_RegReadIndex[1]),
        .I3(\specRegisters_reg[9] [9]),
        .I4(DBG_RegReadIndex[0]),
        .I5(\specRegisters_reg[8] [9]),
        .O(\DBG_RegPCSPMAReadData[9]_INST_0_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \currentReadRegister[0]_i_1 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[0]),
        .O(currentReadRegister[0]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \currentReadRegister[1]_i_1 
       (.I0(currentReadRegister_reg__0[0]),
        .I1(registerReadReady),
        .I2(currentReadRegister_reg__0[1]),
        .O(currentReadRegister[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \currentReadRegister[2]_i_1 
       (.I0(currentReadRegister_reg__0[0]),
        .I1(currentReadRegister_reg__0[1]),
        .I2(registerReadReady),
        .I3(currentReadRegister_reg__0[2]),
        .O(currentReadRegister[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \currentReadRegister[3]_i_1 
       (.I0(currentReadRegister_reg__0[1]),
        .I1(currentReadRegister_reg__0[0]),
        .I2(currentReadRegister_reg__0[2]),
        .I3(registerReadReady),
        .I4(currentReadRegister_reg__0[3]),
        .O(currentReadRegister[3]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \currentReadRegister[4]_i_1 
       (.I0(currentReadRegister_reg__0[2]),
        .I1(currentReadRegister_reg__0[0]),
        .I2(currentReadRegister_reg__0[1]),
        .I3(currentReadRegister_reg__0[3]),
        .I4(registerReadReady),
        .I5(currentReadRegister_reg__0[4]),
        .O(currentReadRegister[4]));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadRegister_reg[0] 
       (.C(clkin25),
        .CE(\debugReadRegister[4]_i_1_n_0 ),
        .D(currentReadRegister[0]),
        .Q(currentReadRegister_reg__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadRegister_reg[1] 
       (.C(clkin25),
        .CE(\debugReadRegister[4]_i_1_n_0 ),
        .D(currentReadRegister[1]),
        .Q(currentReadRegister_reg__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadRegister_reg[2] 
       (.C(clkin25),
        .CE(\debugReadRegister[4]_i_1_n_0 ),
        .D(currentReadRegister[2]),
        .Q(currentReadRegister_reg__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadRegister_reg[3] 
       (.C(clkin25),
        .CE(\debugReadRegister[4]_i_1_n_0 ),
        .D(currentReadRegister[3]),
        .Q(currentReadRegister_reg__0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \currentReadRegister_reg[4] 
       (.C(clkin25),
        .CE(\debugReadRegister[4]_i_1_n_0 ),
        .D(currentReadRegister[4]),
        .Q(currentReadRegister_reg__0[4]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h50410041)) 
    \currentState[0]_i_1 
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(\waitFinishNextState_reg_n_0_[0] ),
        .O(\currentState[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hCEFFCFFC)) 
    \currentState[1]_i_1 
       (.I0(\waitFinishNextState_reg_n_0_[1] ),
        .I1(Q[0]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(Q[1]),
        .O(\currentState[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hF0FC0FBC)) 
    \currentState[2]_i_1 
       (.I0(\waitFinishNextState_reg_n_0_[2] ),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[0]),
        .O(\currentState[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h555555D5FFFF55D5)) 
    \currentState[3]_i_1 
       (.I0(\currentState[3]_i_3_n_0 ),
        .I1(registerReadReady),
        .I2(\currentState[3]_i_4_n_0 ),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(Q[3]),
        .O(\currentState[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h54440000)) 
    \currentState[3]_i_2 
       (.I0(Q[0]),
        .I1(Q[3]),
        .I2(\waitFinishNextState_reg_n_0_[3] ),
        .I3(Q[1]),
        .I4(Q[2]),
        .O(\currentState[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hA0A8)) 
    \currentState[3]_i_3 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(registerWriteComplete),
        .O(\currentState[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \currentState[3]_i_4 
       (.I0(currentReadRegister_reg__0[2]),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[0]),
        .I3(currentReadRegister_reg__0[1]),
        .I4(currentReadRegister_reg__0[3]),
        .I5(p_0_in4_in),
        .O(\currentState[3]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[0] 
       (.C(clkin25),
        .CE(\currentState[3]_i_1_n_0 ),
        .D(\currentState[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(dbgRst));
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[1] 
       (.C(clkin25),
        .CE(\currentState[3]_i_1_n_0 ),
        .D(\currentState[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(dbgRst));
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[2] 
       (.C(clkin25),
        .CE(\currentState[3]_i_1_n_0 ),
        .D(\currentState[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(dbgRst));
  FDRE #(
    .INIT(1'b0)) 
    \currentState_reg[3] 
       (.C(clkin25),
        .CE(\currentState[3]_i_1_n_0 ),
        .D(\currentState[3]_i_2_n_0 ),
        .Q(Q[3]),
        .R(dbgRst));
  LUT1 #(
    .INIT(2'h1)) 
    \debugReadRegister[0]_i_1 
       (.I0(DBG_RegReadIndex[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \debugReadRegister[1]_i_1 
       (.I0(DBG_RegReadIndex[0]),
        .I1(DBG_RegReadIndex[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \debugReadRegister[2]_i_1 
       (.I0(DBG_RegReadIndex[0]),
        .I1(DBG_RegReadIndex[1]),
        .I2(DBG_RegReadIndex[2]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \debugReadRegister[3]_i_1 
       (.I0(DBG_RegReadIndex[1]),
        .I1(DBG_RegReadIndex[0]),
        .I2(DBG_RegReadIndex[2]),
        .I3(DBG_RegReadIndex[3]),
        .O(plusOp[3]));
  LUT3 #(
    .INIT(8'h40)) 
    \debugReadRegister[4]_i_1 
       (.I0(dbgRst),
        .I1(Q[3]),
        .I2(Q[2]),
        .O(\debugReadRegister[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \debugReadRegister[4]_i_2 
       (.I0(DBG_RegReadIndex[2]),
        .I1(DBG_RegReadIndex[0]),
        .I2(DBG_RegReadIndex[1]),
        .I3(DBG_RegReadIndex[3]),
        .I4(DBG_RegReadIndex[4]),
        .O(plusOp[4]));
  FDRE #(
    .INIT(1'b0)) 
    \debugReadRegister_reg[0] 
       (.C(clkin25),
        .CE(\debugReadRegister[4]_i_1_n_0 ),
        .D(plusOp[0]),
        .Q(DBG_RegReadIndex[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \debugReadRegister_reg[1] 
       (.C(clkin25),
        .CE(\debugReadRegister[4]_i_1_n_0 ),
        .D(plusOp[1]),
        .Q(DBG_RegReadIndex[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \debugReadRegister_reg[2] 
       (.C(clkin25),
        .CE(\debugReadRegister[4]_i_1_n_0 ),
        .D(plusOp[2]),
        .Q(DBG_RegReadIndex[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \debugReadRegister_reg[3] 
       (.C(clkin25),
        .CE(\debugReadRegister[4]_i_1_n_0 ),
        .D(plusOp[3]),
        .Q(DBG_RegReadIndex[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \debugReadRegister_reg[4] 
       (.C(clkin25),
        .CE(\debugReadRegister[4]_i_1_n_0 ),
        .D(plusOp[4]),
        .Q(DBG_RegReadIndex[4]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h000B0F30)) 
    \newRequestData[0]_i_1 
       (.I0(\writeExtendedRegisterAddr_reg_n_0_[0] ),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(newRequestData_0[0]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \newRequestData[11]_i_1 
       (.I0(Q[3]),
        .I1(Q[2]),
        .O(newRequestData_0[11]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \newRequestData[12]_i_1 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[1]),
        .O(newRequestData_0[12]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \newRequestData[13]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[3]),
        .O(\newRequestData[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000F41F)) 
    \newRequestData[14]_i_1 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(dbgRst),
        .O(\newRequestData[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h0F0000D0)) 
    \newRequestData[14]_i_2 
       (.I0(Q[0]),
        .I1(writeExtendedRegisterData[14]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(newRequestData_0[14]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h000B0F30)) 
    \newRequestData[1]_i_1 
       (.I0(\writeExtendedRegisterAddr_reg_n_0_[1] ),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(newRequestData_0[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0134)) 
    \newRequestData[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[1]),
        .O(newRequestData_0[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h3104)) 
    \newRequestData[3]_i_1 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[1]),
        .O(newRequestData_0[3]));
  LUT6 #(
    .INIT(64'h00000000383C083C)) 
    \newRequestData[4]_i_1 
       (.I0(writeExtendedRegisterData[6]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\writeExtendedRegisterAddr_reg_n_0_[4] ),
        .I5(Q[3]),
        .O(newRequestData_0[4]));
  LUT6 #(
    .INIT(64'h0000000038080000)) 
    \newRequestData[5]_i_1 
       (.I0(writeExtendedRegisterData[8]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(writeExtendedRegisterData[6]),
        .I4(Q[0]),
        .I5(Q[3]),
        .O(newRequestData_0[5]));
  LUT6 #(
    .INIT(64'h0000EECCFFFFC000)) 
    \newRequestData[6]_i_1 
       (.I0(writeExtendedRegisterData[6]),
        .I1(Q[1]),
        .I2(writeExtendedRegisterData[14]),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(Q[2]),
        .O(\newRequestData[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h00080F00)) 
    \newRequestData[7]_i_1 
       (.I0(writeExtendedRegisterData[14]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(newRequestData_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h00F00F80)) 
    \newRequestData[8]_i_1 
       (.I0(writeExtendedRegisterData[8]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .I4(Q[1]),
        .O(newRequestData_0[8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h24)) 
    \newRequestData[9]_i_1 
       (.I0(Q[2]),
        .I1(Q[3]),
        .I2(Q[1]),
        .O(newRequestData_0[9]));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[0] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[0]),
        .Q(newRequestData[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[11] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[11]),
        .Q(newRequestData[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[12] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[12]),
        .Q(newRequestData[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[13] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(\newRequestData[13]_i_1_n_0 ),
        .Q(newRequestData[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[14] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[14]),
        .Q(newRequestData[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[1] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[1]),
        .Q(newRequestData[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[2] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[2]),
        .Q(newRequestData[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[3] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[3]),
        .Q(newRequestData[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[4] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[4]),
        .Q(newRequestData[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[5] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[5]),
        .Q(newRequestData[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[6] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(\newRequestData[6]_i_1_n_0 ),
        .Q(newRequestData[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[7] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[7]),
        .Q(newRequestData[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[8] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[8]),
        .Q(newRequestData[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestData_reg[9] 
       (.C(clkin25),
        .CE(\newRequestData[14]_i_1_n_0 ),
        .D(newRequestData_0[9]),
        .Q(newRequestData[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00545454DC548854)) 
    \newRequestDevTypeRegister[0]_i_1 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(registerReadReady),
        .I5(currentReadRegister_reg__0[0]),
        .O(\newRequestDevTypeRegister[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F3020F0203020F0)) 
    \newRequestDevTypeRegister[1]_i_1 
       (.I0(plusOp__7[1]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(Q[2]),
        .I5(currentReadRegister[1]),
        .O(\newRequestDevTypeRegister[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \newRequestDevTypeRegister[1]_i_2 
       (.I0(currentReadRegister_reg__0[0]),
        .I1(currentReadRegister_reg__0[1]),
        .O(plusOp__7[1]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h3606)) 
    \newRequestDevTypeRegister[2]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\newRequestDevTypeRegister[2]_i_2_n_0 ),
        .O(\newRequestDevTypeRegister[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h5AAA6AAAFFFFFFFF)) 
    \newRequestDevTypeRegister[2]_i_2 
       (.I0(currentReadRegister_reg__0[2]),
        .I1(registerReadReady),
        .I2(currentReadRegister_reg__0[1]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(Q[0]),
        .I5(Q[3]),
        .O(\newRequestDevTypeRegister[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h4066)) 
    \newRequestDevTypeRegister[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[2]),
        .I2(\newRequestDevTypeRegister[3]_i_2_n_0 ),
        .I3(Q[3]),
        .O(\newRequestDevTypeRegister[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3FFF7FFFC0008000)) 
    \newRequestDevTypeRegister[3]_i_2 
       (.I0(Q[0]),
        .I1(currentReadRegister_reg__0[1]),
        .I2(currentReadRegister_reg__0[0]),
        .I3(currentReadRegister_reg__0[2]),
        .I4(registerReadReady),
        .I5(currentReadRegister_reg__0[3]),
        .O(\newRequestDevTypeRegister[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000F8FC0F3F)) 
    \newRequestDevTypeRegister[4]_i_1 
       (.I0(registerReadReady),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[0]),
        .I5(dbgRst),
        .O(\newRequestDevTypeRegister[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAA0A2A080)) 
    \newRequestDevTypeRegister[4]_i_2 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(plusOp__7[4]),
        .I3(registerReadReady),
        .I4(currentReadRegister_reg__0[4]),
        .I5(\newRequestDevTypeRegister[4]_i_4_n_0 ),
        .O(\newRequestDevTypeRegister[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \newRequestDevTypeRegister[4]_i_3 
       (.I0(currentReadRegister_reg__0[2]),
        .I1(currentReadRegister_reg__0[0]),
        .I2(currentReadRegister_reg__0[1]),
        .I3(currentReadRegister_reg__0[3]),
        .I4(currentReadRegister_reg__0[4]),
        .O(plusOp__7[4]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \newRequestDevTypeRegister[4]_i_4 
       (.I0(Q[1]),
        .I1(Q[2]),
        .O(\newRequestDevTypeRegister[4]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestDevTypeRegister_reg[0] 
       (.C(clkin25),
        .CE(\newRequestDevTypeRegister[4]_i_1_n_0 ),
        .D(\newRequestDevTypeRegister[0]_i_1_n_0 ),
        .Q(newRequestDevTypeRegister[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestDevTypeRegister_reg[1] 
       (.C(clkin25),
        .CE(\newRequestDevTypeRegister[4]_i_1_n_0 ),
        .D(\newRequestDevTypeRegister[1]_i_1_n_0 ),
        .Q(newRequestDevTypeRegister[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestDevTypeRegister_reg[2] 
       (.C(clkin25),
        .CE(\newRequestDevTypeRegister[4]_i_1_n_0 ),
        .D(\newRequestDevTypeRegister[2]_i_1_n_0 ),
        .Q(newRequestDevTypeRegister[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestDevTypeRegister_reg[3] 
       (.C(clkin25),
        .CE(\newRequestDevTypeRegister[4]_i_1_n_0 ),
        .D(\newRequestDevTypeRegister[3]_i_1_n_0 ),
        .Q(newRequestDevTypeRegister[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestDevTypeRegister_reg[4] 
       (.C(clkin25),
        .CE(\newRequestDevTypeRegister[4]_i_1_n_0 ),
        .D(\newRequestDevTypeRegister[4]_i_2_n_0 ),
        .Q(newRequestDevTypeRegister[4]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFCFFE00008B9C)) 
    newRequestIsWrite_i_1
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(dbgRst),
        .I5(newRequestIsWrite),
        .O(newRequestIsWrite_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    newRequestIsWrite_reg
       (.C(clkin25),
        .CE(1'b1),
        .D(newRequestIsWrite_i_1_n_0),
        .Q(newRequestIsWrite),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000081)) 
    \newRequestPHYAddress[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(dbgRst),
        .O(\newRequestPHYAddress[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \newRequestPHYAddress[1]_i_2 
       (.I0(Q[3]),
        .O(\newRequestPHYAddress[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestPHYAddress_reg[0] 
       (.C(clkin25),
        .CE(\newRequestPHYAddress[1]_i_1_n_0 ),
        .D(1'b1),
        .Q(newRequestPHYAddress[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \newRequestPHYAddress_reg[1] 
       (.C(clkin25),
        .CE(\newRequestPHYAddress[1]_i_1_n_0 ),
        .D(\newRequestPHYAddress[1]_i_2_n_0 ),
        .Q(newRequestPHYAddress[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFD3FE0000D3C6)) 
    newRequestStart_i_1
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(dbgRst),
        .I5(newRequestStart),
        .O(newRequestStart_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    newRequestStart_reg
       (.C(clkin25),
        .CE(1'b1),
        .D(newRequestStart_i_1_n_0),
        .Q(newRequestStart),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFE00000080)) 
    phyBringupComplete_i_1
       (.I0(Q[0]),
        .I1(Q[2]),
        .I2(Q[3]),
        .I3(Q[1]),
        .I4(dbgRst),
        .I5(phyBringupComplete),
        .O(phyBringupComplete_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    phyBringupComplete_reg
       (.C(clkin25),
        .CE(1'b1),
        .D(phyBringupComplete_i_1_n_0),
        .Q(phyBringupComplete),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[0][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[0][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[0][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \specRegisters[0][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[2]),
        .I2(currentReadRegister_reg__0[4]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(currentReadRegister_reg__0[1]),
        .I5(currentReadRegister_reg__0[3]),
        .O(\specRegisters[0][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[10][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[10][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[10][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \specRegisters[10][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[0]),
        .I3(currentReadRegister_reg__0[3]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[1]),
        .O(\specRegisters[10][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[11][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[11][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[11][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \specRegisters[11][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[3]),
        .I2(currentReadRegister_reg__0[4]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(currentReadRegister_reg__0[1]),
        .I5(currentReadRegister_reg__0[2]),
        .O(\specRegisters[11][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[12][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[12][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[12][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \specRegisters[12][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[1]),
        .I3(currentReadRegister_reg__0[3]),
        .I4(currentReadRegister_reg__0[0]),
        .I5(currentReadRegister_reg__0[2]),
        .O(\specRegisters[12][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[13][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[13][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[13][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \specRegisters[13][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[3]),
        .I2(currentReadRegister_reg__0[4]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[1]),
        .O(\specRegisters[13][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[14][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[14][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[14][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \specRegisters[14][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[3]),
        .I2(currentReadRegister_reg__0[4]),
        .I3(currentReadRegister_reg__0[2]),
        .I4(currentReadRegister_reg__0[1]),
        .I5(currentReadRegister_reg__0[0]),
        .O(\specRegisters[14][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[15][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[15][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[15][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \specRegisters[15][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[2]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(currentReadRegister_reg__0[1]),
        .I5(currentReadRegister_reg__0[4]),
        .O(\specRegisters[15][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[16][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[16][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[16][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \specRegisters[16][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[0]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[1]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[4]),
        .O(\specRegisters[16][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[17][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[17][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[17][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \specRegisters[17][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[1]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[4]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[0]),
        .O(\specRegisters[17][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[18][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[18][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[18][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \specRegisters[18][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[0]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[4]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[1]),
        .O(\specRegisters[18][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[19][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[19][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[19][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \specRegisters[19][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[2]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(currentReadRegister_reg__0[1]),
        .I5(currentReadRegister_reg__0[3]),
        .O(\specRegisters[19][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[1][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[1][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[1][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \specRegisters[1][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[1]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[0]),
        .O(\specRegisters[1][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[20][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[20][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[20][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \specRegisters[20][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[1]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[4]),
        .I4(currentReadRegister_reg__0[0]),
        .I5(currentReadRegister_reg__0[2]),
        .O(\specRegisters[20][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[21][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[21][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[21][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \specRegisters[21][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[1]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[3]),
        .O(\specRegisters[21][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[22][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[22][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[22][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \specRegisters[22][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[0]),
        .I3(currentReadRegister_reg__0[2]),
        .I4(currentReadRegister_reg__0[1]),
        .I5(currentReadRegister_reg__0[3]),
        .O(\specRegisters[22][15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000200)) 
    \specRegisters[23][15]_i_1 
       (.I0(Q[2]),
        .I1(currentReadRegister_reg__0[3]),
        .I2(\specRegisters[23][15]_i_2_n_0 ),
        .I3(registerReadReady),
        .I4(\specRegisters[23][15]_i_3_n_0 ),
        .I5(dbgRst),
        .O(\specRegisters[23][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \specRegisters[23][15]_i_2 
       (.I0(currentReadRegister_reg__0[2]),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[0]),
        .I3(currentReadRegister_reg__0[1]),
        .O(\specRegisters[23][15]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \specRegisters[23][15]_i_3 
       (.I0(Q[0]),
        .I1(Q[3]),
        .O(\specRegisters[23][15]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[24][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[24][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[24][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \specRegisters[24][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[0]),
        .I2(currentReadRegister_reg__0[1]),
        .I3(currentReadRegister_reg__0[3]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[4]),
        .O(\specRegisters[24][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[25][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[25][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[25][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \specRegisters[25][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[3]),
        .I2(currentReadRegister_reg__0[1]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(currentReadRegister_reg__0[4]),
        .I5(currentReadRegister_reg__0[2]),
        .O(\specRegisters[25][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[26][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[26][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[26][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \specRegisters[26][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[3]),
        .I2(currentReadRegister_reg__0[0]),
        .I3(currentReadRegister_reg__0[4]),
        .I4(currentReadRegister_reg__0[1]),
        .I5(currentReadRegister_reg__0[2]),
        .O(\specRegisters[26][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[27][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[27][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[27][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \specRegisters[27][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(currentReadRegister_reg__0[1]),
        .I5(currentReadRegister_reg__0[2]),
        .O(\specRegisters[27][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[28][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[28][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[28][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \specRegisters[28][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[3]),
        .I2(currentReadRegister_reg__0[0]),
        .I3(currentReadRegister_reg__0[4]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[1]),
        .O(\specRegisters[28][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[29][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[29][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[29][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \specRegisters[29][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[2]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(currentReadRegister_reg__0[4]),
        .I5(currentReadRegister_reg__0[1]),
        .O(\specRegisters[29][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[2][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[2][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[2][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \specRegisters[2][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[1]),
        .O(\specRegisters[2][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[30][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[30][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[30][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \specRegisters[30][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[2]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[4]),
        .I4(currentReadRegister_reg__0[1]),
        .I5(currentReadRegister_reg__0[0]),
        .O(\specRegisters[30][15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000800000)) 
    \specRegisters[31][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[31][15]_i_2_n_0 ),
        .I2(registerReadReady),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(dbgRst),
        .O(\specRegisters[31][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    \specRegisters[31][15]_i_2 
       (.I0(currentReadRegister_reg__0[3]),
        .I1(currentReadRegister_reg__0[1]),
        .I2(currentReadRegister_reg__0[0]),
        .I3(currentReadRegister_reg__0[4]),
        .I4(currentReadRegister_reg__0[2]),
        .O(\specRegisters[31][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[3][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[3][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[3][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \specRegisters[3][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[1]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[0]),
        .O(\specRegisters[3][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[4][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[4][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[4][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \specRegisters[4][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[1]),
        .I4(currentReadRegister_reg__0[0]),
        .I5(currentReadRegister_reg__0[2]),
        .O(\specRegisters[4][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[5][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[5][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[5][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \specRegisters[5][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[2]),
        .I4(currentReadRegister_reg__0[1]),
        .I5(currentReadRegister_reg__0[0]),
        .O(\specRegisters[5][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[6][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[6][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[6][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \specRegisters[6][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[3]),
        .I3(currentReadRegister_reg__0[2]),
        .I4(currentReadRegister_reg__0[0]),
        .I5(currentReadRegister_reg__0[1]),
        .O(\specRegisters[6][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[7][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[7][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[7][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000008000000)) 
    \specRegisters[7][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[2]),
        .I2(currentReadRegister_reg__0[4]),
        .I3(currentReadRegister_reg__0[0]),
        .I4(currentReadRegister_reg__0[1]),
        .I5(currentReadRegister_reg__0[3]),
        .O(\specRegisters[7][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[8][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[8][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[8][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    \specRegisters[8][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[0]),
        .I3(currentReadRegister_reg__0[1]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[3]),
        .O(\specRegisters[8][15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000800)) 
    \specRegisters[9][15]_i_1 
       (.I0(Q[2]),
        .I1(\specRegisters[9][15]_i_2_n_0 ),
        .I2(Q[0]),
        .I3(Q[3]),
        .I4(dbgRst),
        .O(\specRegisters[9][15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020000000000)) 
    \specRegisters[9][15]_i_2 
       (.I0(registerReadReady),
        .I1(currentReadRegister_reg__0[4]),
        .I2(currentReadRegister_reg__0[1]),
        .I3(currentReadRegister_reg__0[3]),
        .I4(currentReadRegister_reg__0[2]),
        .I5(currentReadRegister_reg__0[0]),
        .O(\specRegisters[9][15]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][0] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[0] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][10] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[0] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][11] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[0] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][12] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[0] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][13] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[0] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][14] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[0] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][15] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[0] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][1] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[0] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][2] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[0] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][3] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[0] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][4] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[0] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][5] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[0] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][6] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[0] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][7] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[0] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][8] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[0] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[0][9] 
       (.C(clkin25),
        .CE(\specRegisters[0][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[0] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][0] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[10] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][10] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[10] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][11] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[10] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][12] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[10] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][13] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[10] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][14] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[10] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][15] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[10] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][1] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[10] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][2] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[10] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][3] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[10] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][4] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[10] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][5] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[10] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][6] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[10] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][7] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[10] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][8] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[10] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[10][9] 
       (.C(clkin25),
        .CE(\specRegisters[10][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[10] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][0] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[11] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][10] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[11] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][11] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[11] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][12] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[11] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][13] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[11] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][14] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[11] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][15] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[11] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][1] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[11] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][2] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[11] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][3] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[11] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][4] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[11] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][5] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[11] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][6] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[11] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][7] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[11] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][8] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[11] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[11][9] 
       (.C(clkin25),
        .CE(\specRegisters[11][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[11] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][0] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[12] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][10] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[12] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][11] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[12] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][12] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[12] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][13] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[12] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][14] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[12] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][15] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[12] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][1] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[12] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][2] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[12] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][3] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[12] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][4] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[12] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][5] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[12] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][6] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[12] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][7] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[12] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][8] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[12] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[12][9] 
       (.C(clkin25),
        .CE(\specRegisters[12][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[12] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][0] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[13] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][10] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[13] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][11] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[13] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][12] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[13] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][13] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[13] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][14] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[13] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][15] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[13] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][1] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[13] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][2] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[13] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][3] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[13] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][4] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[13] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][5] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[13] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][6] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[13] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][7] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[13] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][8] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[13] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[13][9] 
       (.C(clkin25),
        .CE(\specRegisters[13][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[13] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][0] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[14] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][10] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[14] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][11] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[14] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][12] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[14] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][13] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[14] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][14] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[14] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][15] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[14] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][1] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[14] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][2] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[14] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][3] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[14] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][4] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[14] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][5] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[14] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][6] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[14] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][7] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[14] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][8] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[14] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[14][9] 
       (.C(clkin25),
        .CE(\specRegisters[14][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[14] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][0] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[15] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][10] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[15] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][11] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[15] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][12] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[15] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][13] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[15] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][14] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[15] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][15] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[15] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][1] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[15] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][2] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[15] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][3] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[15] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][4] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[15] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][5] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[15] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][6] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[15] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][7] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[15] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][8] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[15] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[15][9] 
       (.C(clkin25),
        .CE(\specRegisters[15][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[15] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][0] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[16] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][10] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[16] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][11] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[16] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][12] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[16] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][13] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[16] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][14] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[16] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][15] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[16] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][1] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[16] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][2] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[16] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][3] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[16] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][4] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[16] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][5] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[16] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][6] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[16] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][7] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[16] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][8] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[16] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[16][9] 
       (.C(clkin25),
        .CE(\specRegisters[16][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[16] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][0] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[17] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][10] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[17] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][11] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[17] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][12] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[17] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][13] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[17] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][14] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[17] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][15] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[17] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][1] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[17] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][2] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[17] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][3] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[17] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][4] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[17] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][5] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[17] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][6] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[17] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][7] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[17] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][8] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[17] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[17][9] 
       (.C(clkin25),
        .CE(\specRegisters[17][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[17] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][0] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[18] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][10] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[18] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][11] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[18] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][12] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[18] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][13] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[18] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][14] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[18] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][15] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[18] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][1] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[18] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][2] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[18] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][3] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[18] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][4] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[18] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][5] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[18] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][6] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[18] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][7] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[18] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][8] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[18] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[18][9] 
       (.C(clkin25),
        .CE(\specRegisters[18][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[18] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][0] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[19] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][10] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[19] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][11] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[19] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][12] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[19] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][13] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[19] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][14] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[19] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][15] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[19] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][1] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[19] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][2] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[19] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][3] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[19] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][4] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[19] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][5] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[19] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][6] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[19] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][7] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[19] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][8] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[19] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[19][9] 
       (.C(clkin25),
        .CE(\specRegisters[19][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[19] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][0] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[1] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][10] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[1] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][11] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[1] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][12] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[1] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][13] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[1] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][14] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[1] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][15] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[1] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][1] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[1] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][2] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[1] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][3] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[1] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][4] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[1] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][5] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[1] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][6] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[1] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][7] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[1] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][8] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[1] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[1][9] 
       (.C(clkin25),
        .CE(\specRegisters[1][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[1] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][0] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[20] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][10] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[20] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][11] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[20] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][12] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[20] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][13] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[20] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][14] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[20] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][15] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[20] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][1] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[20] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][2] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[20] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][3] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[20] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][4] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[20] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][5] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[20] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][6] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[20] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][7] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[20] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][8] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[20] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[20][9] 
       (.C(clkin25),
        .CE(\specRegisters[20][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[20] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][0] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[21] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][10] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[21] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][11] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[21] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][12] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[21] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][13] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[21] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][14] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[21] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][15] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[21] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][1] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[21] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][2] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[21] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][3] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[21] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][4] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[21] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][5] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[21] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][6] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[21] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][7] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[21] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][8] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[21] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[21][9] 
       (.C(clkin25),
        .CE(\specRegisters[21][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[21] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][0] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[22] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][10] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[22] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][11] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[22] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][12] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[22] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][13] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[22] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][14] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[22] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][15] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[22] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][1] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[22] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][2] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[22] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][3] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[22] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][4] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[22] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][5] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[22] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][6] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[22] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][7] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[22] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][8] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[22] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[22][9] 
       (.C(clkin25),
        .CE(\specRegisters[22][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[22] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][0] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[23] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][10] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[23] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][11] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[23] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][12] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[23] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][13] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[23] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][14] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[23] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][15] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[23] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][1] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[23] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][2] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[23] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][3] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[23] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][4] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[23] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][5] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[23] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][6] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[23] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][7] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[23] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][8] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[23] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[23][9] 
       (.C(clkin25),
        .CE(\specRegisters[23][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[23] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][0] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[24] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][10] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[24] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][11] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[24] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][12] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[24] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][13] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[24] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][14] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[24] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][15] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[24] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][1] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[24] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][2] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[24] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][3] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[24] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][4] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[24] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][5] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[24] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][6] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[24] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][7] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[24] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][8] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[24] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[24][9] 
       (.C(clkin25),
        .CE(\specRegisters[24][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[24] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][0] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[25] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][10] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[25] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][11] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[25] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][12] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[25] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][13] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[25] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][14] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[25] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][15] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[25] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][1] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[25] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][2] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[25] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][3] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[25] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][4] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[25] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][5] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[25] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][6] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[25] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][7] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[25] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][8] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[25] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[25][9] 
       (.C(clkin25),
        .CE(\specRegisters[25][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[25] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][0] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[26] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][10] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[26] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][11] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[26] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][12] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[26] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][13] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[26] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][14] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[26] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][15] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[26] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][1] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[26] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][2] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[26] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][3] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[26] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][4] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[26] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][5] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[26] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][6] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[26] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][7] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[26] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][8] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[26] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[26][9] 
       (.C(clkin25),
        .CE(\specRegisters[26][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[26] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][0] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[27] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][10] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[27] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][11] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[27] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][12] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[27] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][13] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[27] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][14] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[27] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][15] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[27] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][1] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[27] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][2] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[27] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][3] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[27] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][4] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[27] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][5] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[27] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][6] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[27] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][7] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[27] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][8] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[27] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[27][9] 
       (.C(clkin25),
        .CE(\specRegisters[27][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[27] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][0] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[28] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][10] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[28] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][11] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[28] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][12] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[28] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][13] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[28] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][14] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[28] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][15] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[28] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][1] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[28] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][2] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[28] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][3] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[28] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][4] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[28] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][5] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[28] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][6] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[28] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][7] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[28] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][8] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[28] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[28][9] 
       (.C(clkin25),
        .CE(\specRegisters[28][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[28] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][0] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[29] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][10] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[29] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][11] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[29] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][12] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[29] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][13] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[29] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][14] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[29] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][15] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[29] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][1] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[29] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][2] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[29] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][3] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[29] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][4] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[29] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][5] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[29] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][6] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[29] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][7] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[29] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][8] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[29] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[29][9] 
       (.C(clkin25),
        .CE(\specRegisters[29][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[29] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][0] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[2] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][10] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[2] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][11] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[2] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][12] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[2] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][13] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[2] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][14] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[2] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][15] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[2] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][1] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[2] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][2] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[2] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][3] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[2] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][4] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[2] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][5] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[2] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][6] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[2] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][7] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[2] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][8] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[2] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[2][9] 
       (.C(clkin25),
        .CE(\specRegisters[2][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[2] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][0] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[30] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][10] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[30] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][11] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[30] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][12] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[30] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][13] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[30] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][14] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[30] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][15] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[30] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][1] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[30] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][2] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[30] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][3] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[30] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][4] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[30] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][5] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[30] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][6] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[30] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][7] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[30] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][8] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[30] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[30][9] 
       (.C(clkin25),
        .CE(\specRegisters[30][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[30] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][0] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[31] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][10] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[31] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][11] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[31] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][12] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[31] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][13] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[31] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][14] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[31] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][15] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[31] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][1] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[31] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][2] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[31] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][3] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[31] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][4] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[31] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][5] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[31] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][6] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[31] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][7] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[31] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][8] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[31] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[31][9] 
       (.C(clkin25),
        .CE(\specRegisters[31][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[31] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][0] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[3] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][10] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[3] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][11] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[3] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][12] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[3] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][13] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[3] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][14] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[3] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][15] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[3] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][1] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[3] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][2] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[3] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][3] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[3] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][4] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[3] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][5] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[3] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][6] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[3] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][7] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[3] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][8] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[3] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[3][9] 
       (.C(clkin25),
        .CE(\specRegisters[3][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[3] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][0] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[4] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][10] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[4] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][11] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[4] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][12] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[4] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][13] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[4] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][14] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[4] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][15] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[4] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][1] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[4] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][2] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[4] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][3] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[4] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][4] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[4] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][5] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[4] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][6] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[4] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][7] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[4] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][8] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[4] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[4][9] 
       (.C(clkin25),
        .CE(\specRegisters[4][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[4] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][0] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg_n_0_[5][0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][10] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg_n_0_[5][10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][11] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg_n_0_[5][11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][12] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg_n_0_[5][12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][13] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg_n_0_[5][13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][14] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(p_0_in4_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][15] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg_n_0_[5][15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][1] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg_n_0_[5][1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][2] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg_n_0_[5][2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][3] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg_n_0_[5][3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][4] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg_n_0_[5][4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][5] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg_n_0_[5][5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][6] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg_n_0_[5][6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][7] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg_n_0_[5][7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][8] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg_n_0_[5][8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[5][9] 
       (.C(clkin25),
        .CE(\specRegisters[5][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg_n_0_[5][9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][0] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[6] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][10] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[6] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][11] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[6] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][12] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[6] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][13] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[6] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][14] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[6] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][15] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[6] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][1] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[6] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][2] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[6] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][3] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[6] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][4] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[6] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][5] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[6] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][6] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[6] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][7] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[6] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][8] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[6] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[6][9] 
       (.C(clkin25),
        .CE(\specRegisters[6][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[6] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][0] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[7] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][10] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[7] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][11] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[7] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][12] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[7] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][13] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[7] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][14] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[7] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][15] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[7] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][1] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[7] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][2] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[7] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][3] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[7] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][4] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[7] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][5] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[7] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][6] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[7] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][7] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[7] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][8] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[7] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[7][9] 
       (.C(clkin25),
        .CE(\specRegisters[7][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[7] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][0] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[8] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][10] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[8] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][11] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[8] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][12] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[8] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][13] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[8] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][14] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[8] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][15] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[8] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][1] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[8] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][2] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[8] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][3] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[8] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][4] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[8] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][5] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[8] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][6] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[8] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][7] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[8] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][8] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[8] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[8][9] 
       (.C(clkin25),
        .CE(\specRegisters[8][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[8] [9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][0] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[0]),
        .Q(\specRegisters_reg[9] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][10] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[10]),
        .Q(\specRegisters_reg[9] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][11] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[11]),
        .Q(\specRegisters_reg[9] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][12] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[12]),
        .Q(\specRegisters_reg[9] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][13] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[13]),
        .Q(\specRegisters_reg[9] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][14] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[14]),
        .Q(\specRegisters_reg[9] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][15] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[15]),
        .Q(\specRegisters_reg[9] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][1] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[1]),
        .Q(\specRegisters_reg[9] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][2] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[2]),
        .Q(\specRegisters_reg[9] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][3] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[3]),
        .Q(\specRegisters_reg[9] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][4] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[4]),
        .Q(\specRegisters_reg[9] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][5] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[5]),
        .Q(\specRegisters_reg[9] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][6] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[6]),
        .Q(\specRegisters_reg[9] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][7] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[7]),
        .Q(\specRegisters_reg[9] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][8] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[8]),
        .Q(\specRegisters_reg[9] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \specRegisters_reg[9][9] 
       (.C(clkin25),
        .CE(\specRegisters[9][15]_i_1_n_0 ),
        .D(registerReadData[9]),
        .Q(\specRegisters_reg[9] [9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h00EA05FA)) 
    \waitFinishNextState[0]_i_1 
       (.I0(Q[3]),
        .I1(\writeExtendedRegisterAddr_reg_n_0_[0] ),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(waitFinishNextState[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00002404)) 
    \waitFinishNextState[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(\writeExtendedRegisterAddr_reg_n_0_[4] ),
        .I4(Q[3]),
        .O(\waitFinishNextState[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hAF40AA50)) 
    \waitFinishNextState[2]_i_1 
       (.I0(Q[3]),
        .I1(writeExtendedRegisterData[14]),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .O(waitFinishNextState[2]));
  LUT5 #(
    .INIT(32'h0000F417)) 
    \waitFinishNextState[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(dbgRst),
        .O(\waitFinishNextState[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFEEEAAAA)) 
    \waitFinishNextState[3]_i_2 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(writeExtendedRegisterData[6]),
        .I3(Q[0]),
        .I4(Q[2]),
        .O(waitFinishNextState[3]));
  FDRE #(
    .INIT(1'b0)) 
    \waitFinishNextState_reg[0] 
       (.C(clkin25),
        .CE(\waitFinishNextState[3]_i_1_n_0 ),
        .D(waitFinishNextState[0]),
        .Q(\waitFinishNextState_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \waitFinishNextState_reg[1] 
       (.C(clkin25),
        .CE(\waitFinishNextState[3]_i_1_n_0 ),
        .D(\waitFinishNextState[1]_i_1_n_0 ),
        .Q(\waitFinishNextState_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \waitFinishNextState_reg[2] 
       (.C(clkin25),
        .CE(\waitFinishNextState[3]_i_1_n_0 ),
        .D(waitFinishNextState[2]),
        .Q(\waitFinishNextState_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \waitFinishNextState_reg[3] 
       (.C(clkin25),
        .CE(\waitFinishNextState[3]_i_1_n_0 ),
        .D(waitFinishNextState[3]),
        .Q(\waitFinishNextState_reg_n_0_[3] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \writeExtendedRegisterAddr[0]_i_1 
       (.I0(Q[0]),
        .I1(Q[3]),
        .O(writeExtendedRegisterAddr));
  LUT5 #(
    .INIT(32'h00000063)) 
    \writeExtendedRegisterAddr[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[3]),
        .I3(Q[2]),
        .I4(dbgRst),
        .O(\writeExtendedRegisterAddr[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0100)) 
    \writeExtendedRegisterAddr[4]_i_1 
       (.I0(dbgRst),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .O(\writeExtendedRegisterAddr[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \writeExtendedRegisterAddr_reg[0] 
       (.C(clkin25),
        .CE(\writeExtendedRegisterAddr[1]_i_1_n_0 ),
        .D(writeExtendedRegisterAddr),
        .Q(\writeExtendedRegisterAddr_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeExtendedRegisterAddr_reg[1] 
       (.C(clkin25),
        .CE(\writeExtendedRegisterAddr[1]_i_1_n_0 ),
        .D(Q[0]),
        .Q(\writeExtendedRegisterAddr_reg_n_0_[1] ),
        .R(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \writeExtendedRegisterAddr_reg[4] 
       (.C(clkin25),
        .CE(\writeExtendedRegisterAddr[1]_i_1_n_0 ),
        .D(Q[3]),
        .Q(\writeExtendedRegisterAddr_reg_n_0_[4] ),
        .S(\writeExtendedRegisterAddr[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \writeExtendedRegisterData[14]_i_1 
       (.I0(Q[0]),
        .I1(Q[3]),
        .O(\writeExtendedRegisterData[14]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \writeExtendedRegisterData_reg[14] 
       (.C(clkin25),
        .CE(\writeExtendedRegisterAddr[1]_i_1_n_0 ),
        .D(\writeExtendedRegisterData[14]_i_1_n_0 ),
        .Q(writeExtendedRegisterData[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeExtendedRegisterData_reg[6] 
       (.C(clkin25),
        .CE(\writeExtendedRegisterAddr[1]_i_1_n_0 ),
        .D(Q[3]),
        .Q(writeExtendedRegisterData[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \writeExtendedRegisterData_reg[8] 
       (.C(clkin25),
        .CE(\writeExtendedRegisterAddr[1]_i_1_n_0 ),
        .D(Q[1]),
        .Q(writeExtendedRegisterData[8]),
        .R(1'b0));
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
