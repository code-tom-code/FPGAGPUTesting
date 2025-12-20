// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 16:50:40 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_SGMII_PHY_Bringup_MD_0_0/MainDesign_SGMII_PHY_Bringup_MD_0_0_stub.v
// Design      : MainDesign_SGMII_PHY_Bringup_MD_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_SGMII_PHY_Bringup_MD_0_0,SGMII_PHY_Bringup_MDIO,{}" *) (* core_generation_info = "MainDesign_SGMII_PHY_Bringup_MD_0_0,SGMII_PHY_Bringup_MDIO,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=SGMII_PHY_Bringup_MDIO,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,PHY_Address=3,PCS_Address=1}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "SGMII_PHY_Bringup_MDIO,Vivado 2025.2" *) 
module MainDesign_SGMII_PHY_Bringup_MD_0_0(clkin25, dbgRst, registerReadData, 
  registerReadReady, registerWriteComplete, newRequestPHYAddress, 
  newRequestDevTypeRegister, newRequestRegister, newRequestData, newRequestIsWrite, 
  newRequestStart, phyBringupComplete, DBG_RegReadIndex, DBG_RegReadData, 
  DBG_RegPCSPMAReadIndex, DBG_RegPCSPMAReadData, DBG_Bringup_State)
/* synthesis syn_black_box black_box_pad_pin="dbgRst,registerReadData[15:0],registerReadReady,registerWriteComplete,newRequestPHYAddress[4:0],newRequestDevTypeRegister[4:0],newRequestRegister[15:0],newRequestData[15:0],newRequestIsWrite,newRequestStart,phyBringupComplete,DBG_RegReadIndex[4:0],DBG_RegReadData[15:0],DBG_RegPCSPMAReadIndex[4:0],DBG_RegPCSPMAReadData[15:0],DBG_Bringup_State[4:0]" */
/* synthesis syn_force_seq_prim="clkin25" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clkin25 CLK" *) (* x_interface_mode = "slave clkin25" *) (* x_interface_parameter = "XIL_INTERFACENAME clkin25, FREQ_HZ 2500000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0" *) input clkin25 /* synthesis syn_isclock = 1 */;
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
