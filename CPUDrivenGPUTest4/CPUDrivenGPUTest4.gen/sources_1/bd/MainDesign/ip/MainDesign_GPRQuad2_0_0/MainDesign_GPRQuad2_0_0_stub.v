// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Mon Dec  8 18:20:22 2025
// Host        : Dragon3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_GPRQuad2_0_0/MainDesign_GPRQuad2_0_0_stub.v
// Design      : MainDesign_GPRQuad2_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "MainDesign_GPRQuad2_0_0,GPRQuad2,{}" *) (* core_generation_info = "MainDesign_GPRQuad2_0_0,GPRQuad2,{x_ipProduct=Vivado 2025.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=GPRQuad2,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VHDL,x_ipSimLanguage=VHDL}" *) (* downgradeipidentifiedwarnings = "yes" *) 
(* ip_definition_source = "module_ref" *) (* x_core_info = "GPRQuad2,Vivado 2025.2" *) 
module MainDesign_GPRQuad2_0_0(clk, readQuadIndex, writeQuadIndex, portA_en, 
  portA_regType, portA_regIdx, portA_regChan, portA_readOutData, portB_en, portB_regType, 
  portB_regIdx, portB_regChan, portB_readOutData, portW_en, portW_regType, portW_regIdx, 
  portW_regChan, portW_writeInData, clka_bram0, addra_bram0, dina_bram0, ena_bram0, wea_bram0, 
  clkb_bram0, addrb_bram0, enb_bram0, doutb_bram0, clka_bram1, addra_bram1, dina_bram1, 
  ena_bram1, wea_bram1, clkb_bram1, addrb_bram1, enb_bram1, doutb_bram1, clka_bram2, addra_bram2, 
  dina_bram2, ena_bram2, wea_bram2, clkb_bram2, addrb_bram2, enb_bram2, doutb_bram2, clka_bram3, 
  addra_bram3, dina_bram3, ena_bram3, wea_bram3, clkb_bram3, addrb_bram3, enb_bram3, doutb_bram3, 
  clka_bram4, addra_bram4, dina_bram4, ena_bram4, wea_bram4, clkb_bram4, addrb_bram4, enb_bram4, 
  doutb_bram4, clka_bram5, addra_bram5, dina_bram5, ena_bram5, wea_bram5, clkb_bram5, 
  addrb_bram5, enb_bram5, doutb_bram5, clka_bram6, addra_bram6, dina_bram6, ena_bram6, wea_bram6, 
  clkb_bram6, addrb_bram6, enb_bram6, doutb_bram6, clka_bram7, addra_bram7, dina_bram7, 
  ena_bram7, wea_bram7, clkb_bram7, addrb_bram7, enb_bram7, doutb_bram7)
/* synthesis syn_black_box black_box_pad_pin="clk,readQuadIndex[1:0],writeQuadIndex[1:0],portA_en,portA_regType[1:0],portA_regIdx[2:0],portA_regChan[1:0],portA_readOutData[127:0],portB_en,portB_regType[1:0],portB_regIdx[2:0],portB_regChan[1:0],portB_readOutData[127:0],portW_en,portW_regType[1:0],portW_regIdx[2:0],portW_regChan[1:0],portW_writeInData[127:0],clka_bram0,addra_bram0[8:0],dina_bram0[31:0],ena_bram0,wea_bram0[0:0],clkb_bram0,addrb_bram0[8:0],enb_bram0,doutb_bram0[31:0],clka_bram1,addra_bram1[8:0],dina_bram1[31:0],ena_bram1,wea_bram1[0:0],clkb_bram1,addrb_bram1[8:0],enb_bram1,doutb_bram1[31:0],clka_bram2,addra_bram2[8:0],dina_bram2[31:0],ena_bram2,wea_bram2[0:0],clkb_bram2,addrb_bram2[8:0],enb_bram2,doutb_bram2[31:0],clka_bram3,addra_bram3[8:0],dina_bram3[31:0],ena_bram3,wea_bram3[0:0],clkb_bram3,addrb_bram3[8:0],enb_bram3,doutb_bram3[31:0],clka_bram4,addra_bram4[8:0],dina_bram4[31:0],ena_bram4,wea_bram4[0:0],clkb_bram4,addrb_bram4[8:0],enb_bram4,doutb_bram4[31:0],clka_bram5,addra_bram5[8:0],dina_bram5[31:0],ena_bram5,wea_bram5[0:0],clkb_bram5,addrb_bram5[8:0],enb_bram5,doutb_bram5[31:0],clka_bram6,addra_bram6[8:0],dina_bram6[31:0],ena_bram6,wea_bram6[0:0],clkb_bram6,addrb_bram6[8:0],enb_bram6,doutb_bram6[31:0],clka_bram7,addra_bram7[8:0],dina_bram7[31:0],ena_bram7,wea_bram7[0:0],clkb_bram7,addrb_bram7[8:0],enb_bram7,doutb_bram7[31:0]" */;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, ASSOCIATED_BUSIF BRAM0W:BRAM0R:BRAM1W:BRAM1R:BRAM2W:BRAM2R:BRAM3W:BRAM3R:BRAM4W:BRAM4R:BRAM5W:BRAM5R:BRAM6W:BRAM6R:BRAM7W:BRAM7R, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  input [1:0]readQuadIndex;
  input [1:0]writeQuadIndex;
  input portA_en;
  input [1:0]portA_regType;
  input [2:0]portA_regIdx;
  input [1:0]portA_regChan;
  output [127:0]portA_readOutData;
  input portB_en;
  input [1:0]portB_regType;
  input [2:0]portB_regIdx;
  input [1:0]portB_regChan;
  output [127:0]portB_readOutData;
  input portW_en;
  input [1:0]portW_regType;
  input [2:0]portW_regIdx;
  input [1:0]portW_regChan;
  input [127:0]portW_writeInData;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0W CLK" *) (* x_interface_mode = "master BRAM0W" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM0W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clka_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0W ADDR" *) output [8:0]addra_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0W DIN" *) output [31:0]dina_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0W EN" *) output ena_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0W WE" *) output [0:0]wea_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0R CLK" *) (* x_interface_mode = "master BRAM0R" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM0R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clkb_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0R ADDR" *) output [8:0]addrb_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0R EN" *) output enb_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0R DOUT" *) input [31:0]doutb_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1W CLK" *) (* x_interface_mode = "master BRAM1W" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM1W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clka_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1W ADDR" *) output [8:0]addra_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1W DIN" *) output [31:0]dina_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1W EN" *) output ena_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1W WE" *) output [0:0]wea_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1R CLK" *) (* x_interface_mode = "master BRAM1R" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM1R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clkb_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1R ADDR" *) output [8:0]addrb_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1R EN" *) output enb_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1R DOUT" *) input [31:0]doutb_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2W CLK" *) (* x_interface_mode = "master BRAM2W" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM2W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clka_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2W ADDR" *) output [8:0]addra_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2W DIN" *) output [31:0]dina_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2W EN" *) output ena_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2W WE" *) output [0:0]wea_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2R CLK" *) (* x_interface_mode = "master BRAM2R" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM2R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clkb_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2R ADDR" *) output [8:0]addrb_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2R EN" *) output enb_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2R DOUT" *) input [31:0]doutb_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3W CLK" *) (* x_interface_mode = "master BRAM3W" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM3W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clka_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3W ADDR" *) output [8:0]addra_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3W DIN" *) output [31:0]dina_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3W EN" *) output ena_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3W WE" *) output [0:0]wea_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3R CLK" *) (* x_interface_mode = "master BRAM3R" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM3R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clkb_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3R ADDR" *) output [8:0]addrb_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3R EN" *) output enb_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3R DOUT" *) input [31:0]doutb_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4W CLK" *) (* x_interface_mode = "master BRAM4W" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM4W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clka_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4W ADDR" *) output [8:0]addra_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4W DIN" *) output [31:0]dina_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4W EN" *) output ena_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4W WE" *) output [0:0]wea_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4R CLK" *) (* x_interface_mode = "master BRAM4R" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM4R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clkb_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4R ADDR" *) output [8:0]addrb_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4R EN" *) output enb_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4R DOUT" *) input [31:0]doutb_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5W CLK" *) (* x_interface_mode = "master BRAM5W" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM5W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clka_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5W ADDR" *) output [8:0]addra_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5W DIN" *) output [31:0]dina_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5W EN" *) output ena_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5W WE" *) output [0:0]wea_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5R CLK" *) (* x_interface_mode = "master BRAM5R" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM5R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clkb_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5R ADDR" *) output [8:0]addrb_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5R EN" *) output enb_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5R DOUT" *) input [31:0]doutb_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6W CLK" *) (* x_interface_mode = "master BRAM6W" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM6W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clka_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6W ADDR" *) output [8:0]addra_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6W DIN" *) output [31:0]dina_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6W EN" *) output ena_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6W WE" *) output [0:0]wea_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6R CLK" *) (* x_interface_mode = "master BRAM6R" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM6R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clkb_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6R ADDR" *) output [8:0]addrb_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6R EN" *) output enb_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6R DOUT" *) input [31:0]doutb_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7W CLK" *) (* x_interface_mode = "master BRAM7W" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM7W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clka_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7W ADDR" *) output [8:0]addra_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7W DIN" *) output [31:0]dina_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7W EN" *) output ena_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7W WE" *) output [0:0]wea_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7R CLK" *) (* x_interface_mode = "master BRAM7R" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM7R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) output clkb_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7R ADDR" *) output [8:0]addrb_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7R EN" *) output enb_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7R DOUT" *) input [31:0]doutb_bram7;
endmodule
