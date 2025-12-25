// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:04:05 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_ConstantBuffer_0_0/MainDesign_ConstantBuffer_0_0_stub.v
// Design      : MainDesign_ConstantBuffer_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_ConstantBuffer_0_0,ConstantBuffer,{}" *) (* core_generation_info = "MainDesign_ConstantBuffer_0_0,ConstantBuffer,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=ConstantBuffer,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "ConstantBuffer,Vivado 2025.2" *) 
module MainDesign_ConstantBuffer_0_0(clk, enable, writeMode, regIndex, regComponent, 
  readOutData, writeInData, ConstBufferBRAM_addra, ConstBufferBRAM_clka, 
  ConstBufferBRAM_dina, ConstBufferBRAM_douta, ConstBufferBRAM_ena, ConstBufferBRAM_wea)
/* synthesis syn_black_box black_box_pad_pin="clk,enable,writeMode,regIndex[7:0],regComponent[1:0],readOutData[31:0],writeInData[31:0],ConstBufferBRAM_addra[9:0],ConstBufferBRAM_clka,ConstBufferBRAM_dina[31:0],ConstBufferBRAM_douta[31:0],ConstBufferBRAM_ena,ConstBufferBRAM_wea[0:0]" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF ConstBufferBRAM, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  input enable;
  input writeMode;
  input [7:0]regIndex;
  input [1:0]regComponent;
  output [31:0]readOutData;
  input [31:0]writeInData;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM ADDR" *) (* x_interface_mode = "master ConstBufferBRAM" *) (* x_interface_parameter = "XIL_INTERFACENAME ConstBufferBRAM, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output [9:0]ConstBufferBRAM_addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM CLK" *) output ConstBufferBRAM_clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM DIN" *) output [31:0]ConstBufferBRAM_dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM DOUT" *) input [31:0]ConstBufferBRAM_douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM EN" *) output ConstBufferBRAM_ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 ConstBufferBRAM WE" *) output [0:0]ConstBufferBRAM_wea;
endmodule
