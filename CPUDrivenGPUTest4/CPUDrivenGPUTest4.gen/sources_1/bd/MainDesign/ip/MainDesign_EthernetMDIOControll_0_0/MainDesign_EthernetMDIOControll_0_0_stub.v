// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:21:01 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_EthernetMDIOControll_0_0/MainDesign_EthernetMDIOControll_0_0_stub.v
// Design      : MainDesign_EthernetMDIOControll_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_EthernetMDIOControll_0_0,EthernetMDIOController,{}" *) (* core_generation_info = "MainDesign_EthernetMDIOControll_0_0,EthernetMDIOController,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=EthernetMDIOController,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL,USE_CLAUSE_45_PACKETS=false}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "EthernetMDIOController,Vivado 2025.2" *) 
module MainDesign_EthernetMDIOControll_0_0(clkin25, mdio_clk, mdio_i, mdio_o, mdio_t, 
  mdio_t_ctrl, registerReadData, registerReadReady, registerWriteComplete, 
  newRequestPHYAddress, newRequestDevTypeRegister, newRequestRegister, newRequestData, 
  newRequestIsWrite, newRequestStart, DBG_BitsRemaining, DBG_InProgressRead, 
  DBG_EthMDIO_State)
/* synthesis syn_black_box black_box_pad_pin="mdio_i,mdio_o,mdio_t,mdio_t_ctrl,registerReadData[15:0],registerReadReady,registerWriteComplete,newRequestPHYAddress[4:0],newRequestDevTypeRegister[4:0],newRequestRegister[15:0],newRequestData[15:0],newRequestIsWrite,newRequestStart,DBG_BitsRemaining[5:0],DBG_InProgressRead[15:0],DBG_EthMDIO_State[4:0]" */
/* synthesis syn_force_seq_prim="clkin25" */
/* synthesis syn_force_seq_prim="mdio_clk" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clkin25 CLK" *) (* x_interface_mode = "slave clkin25" *) (* x_interface_parameter = "XIL_INTERFACENAME clkin25, FREQ_HZ 2500000, ASSOCIATED_BUSIF MDIO, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN MainDesign_ClockDivider4_1_0_0_clkout25, INSERT_VIP 0" *) input clkin25 /* synthesis syn_isclock = 1 */;
  (* x_interface_info = "xilinx.com:interface:mdio:1.0 MDIO MDC" *) (* x_interface_mode = "master MDIO" *) (* x_interface_parameter = "XIL_INTERFACENAME MDIO, FREQ_HZ 2500000, CAN_DEBUG false" *) output mdio_clk /* synthesis syn_isclock = 1 */;
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
endmodule
