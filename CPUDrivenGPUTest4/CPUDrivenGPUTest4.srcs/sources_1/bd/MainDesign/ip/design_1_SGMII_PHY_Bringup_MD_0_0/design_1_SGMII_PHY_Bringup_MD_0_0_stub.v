// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sun Oct 13 16:49:24 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_SGMII_PHY_Bringup_MD_0_0/design_1_SGMII_PHY_Bringup_MD_0_0_stub.v
// Design      : design_1_SGMII_PHY_Bringup_MD_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "SGMII_PHY_Bringup_MDIO,Vivado 2018.1_AR73068" *)
module design_1_SGMII_PHY_Bringup_MD_0_0(clkin25, dbgRst, registerReadData, 
  registerReadReady, registerWriteComplete, newRequestPHYAddress, 
  newRequestDevTypeRegister, newRequestRegister, newRequestData, newRequestIsWrite, 
  newRequestStart, phyBringupComplete, DBG_RegReadIndex, DBG_RegReadData, 
  DBG_RegPCSPMAReadIndex, DBG_RegPCSPMAReadData, DBG_Bringup_State)
/* synthesis syn_black_box black_box_pad_pin="clkin25,dbgRst,registerReadData[15:0],registerReadReady,registerWriteComplete,newRequestPHYAddress[4:0],newRequestDevTypeRegister[4:0],newRequestRegister[15:0],newRequestData[15:0],newRequestIsWrite,newRequestStart,phyBringupComplete,DBG_RegReadIndex[4:0],DBG_RegReadData[15:0],DBG_RegPCSPMAReadIndex[4:0],DBG_RegPCSPMAReadData[15:0],DBG_Bringup_State[4:0]" */;
  input clkin25;
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
endmodule
