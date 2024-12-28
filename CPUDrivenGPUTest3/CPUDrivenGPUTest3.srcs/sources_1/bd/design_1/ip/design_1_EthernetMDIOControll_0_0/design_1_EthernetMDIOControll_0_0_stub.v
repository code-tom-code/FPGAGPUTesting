// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Sun Oct 13 16:49:12 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_EthernetMDIOControll_0_0/design_1_EthernetMDIOControll_0_0_stub.v
// Design      : design_1_EthernetMDIOControll_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "EthernetMDIOController,Vivado 2018.1_AR73068" *)
module design_1_EthernetMDIOControll_0_0(clkin25, mdio_clk, mdio_i, mdio_o, mdio_t, 
  mdio_t_ctrl, registerReadData, registerReadReady, registerWriteComplete, 
  newRequestPHYAddress, newRequestDevTypeRegister, newRequestRegister, newRequestData, 
  newRequestIsWrite, newRequestStart, DBG_BitsRemaining, DBG_InProgressRead, 
  DBG_EthMDIO_State)
/* synthesis syn_black_box black_box_pad_pin="clkin25,mdio_clk,mdio_i,mdio_o,mdio_t,mdio_t_ctrl,registerReadData[15:0],registerReadReady,registerWriteComplete,newRequestPHYAddress[4:0],newRequestDevTypeRegister[4:0],newRequestRegister[15:0],newRequestData[15:0],newRequestIsWrite,newRequestStart,DBG_BitsRemaining[5:0],DBG_InProgressRead[15:0],DBG_EthMDIO_State[4:0]" */;
  input clkin25;
  output mdio_clk;
  output mdio_i;
  input mdio_o;
  input mdio_t;
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
endmodule
