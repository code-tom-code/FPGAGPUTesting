// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:33:51 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_GPRQuad2_0_0/design_1_GPRQuad2_0_0_sim_netlist.v
// Design      : design_1_GPRQuad2_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_GPRQuad2_0_0,GPRQuad2,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "GPRQuad2,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_GPRQuad2_0_0
   (clk,
    readQuadIndex,
    writeQuadIndex,
    portA_en,
    portA_regType,
    portA_regIdx,
    portA_regChan,
    portA_readOutData,
    portB_en,
    portB_regType,
    portB_regIdx,
    portB_regChan,
    portB_readOutData,
    portW_en,
    portW_regType,
    portW_regIdx,
    portW_regChan,
    portW_writeInData,
    clka_bram0,
    addra_bram0,
    dina_bram0,
    ena_bram0,
    wea_bram0,
    clkb_bram0,
    addrb_bram0,
    enb_bram0,
    doutb_bram0,
    clka_bram1,
    addra_bram1,
    dina_bram1,
    ena_bram1,
    wea_bram1,
    clkb_bram1,
    addrb_bram1,
    enb_bram1,
    doutb_bram1,
    clka_bram2,
    addra_bram2,
    dina_bram2,
    ena_bram2,
    wea_bram2,
    clkb_bram2,
    addrb_bram2,
    enb_bram2,
    doutb_bram2,
    clka_bram3,
    addra_bram3,
    dina_bram3,
    ena_bram3,
    wea_bram3,
    clkb_bram3,
    addrb_bram3,
    enb_bram3,
    doutb_bram3,
    clka_bram4,
    addra_bram4,
    dina_bram4,
    ena_bram4,
    wea_bram4,
    clkb_bram4,
    addrb_bram4,
    enb_bram4,
    doutb_bram4,
    clka_bram5,
    addra_bram5,
    dina_bram5,
    ena_bram5,
    wea_bram5,
    clkb_bram5,
    addrb_bram5,
    enb_bram5,
    doutb_bram5,
    clka_bram6,
    addra_bram6,
    dina_bram6,
    ena_bram6,
    wea_bram6,
    clkb_bram6,
    addrb_bram6,
    enb_bram6,
    doutb_bram6,
    clka_bram7,
    addra_bram7,
    dina_bram7,
    ena_bram7,
    wea_bram7,
    clkb_bram7,
    addrb_bram7,
    enb_bram7,
    doutb_bram7);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk" *) input clk;
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0W CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM0W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clka_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0W ADDR" *) output [8:0]addra_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0W DIN" *) output [31:0]dina_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0W EN" *) output ena_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0W WE" *) output [0:0]wea_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0R CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM0R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clkb_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0R ADDR" *) output [8:0]addrb_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0R EN" *) output enb_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM0R DOUT" *) input [31:0]doutb_bram0;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1W CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM1W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clka_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1W ADDR" *) output [8:0]addra_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1W DIN" *) output [31:0]dina_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1W EN" *) output ena_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1W WE" *) output [0:0]wea_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1R CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM1R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clkb_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1R ADDR" *) output [8:0]addrb_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1R EN" *) output enb_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM1R DOUT" *) input [31:0]doutb_bram1;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2W CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM2W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clka_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2W ADDR" *) output [8:0]addra_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2W DIN" *) output [31:0]dina_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2W EN" *) output ena_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2W WE" *) output [0:0]wea_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2R CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM2R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clkb_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2R ADDR" *) output [8:0]addrb_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2R EN" *) output enb_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM2R DOUT" *) input [31:0]doutb_bram2;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3W CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM3W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clka_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3W ADDR" *) output [8:0]addra_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3W DIN" *) output [31:0]dina_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3W EN" *) output ena_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3W WE" *) output [0:0]wea_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3R CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM3R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clkb_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3R ADDR" *) output [8:0]addrb_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3R EN" *) output enb_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM3R DOUT" *) input [31:0]doutb_bram3;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4W CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM4W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clka_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4W ADDR" *) output [8:0]addra_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4W DIN" *) output [31:0]dina_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4W EN" *) output ena_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4W WE" *) output [0:0]wea_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4R CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM4R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clkb_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4R ADDR" *) output [8:0]addrb_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4R EN" *) output enb_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM4R DOUT" *) input [31:0]doutb_bram4;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5W CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM5W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clka_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5W ADDR" *) output [8:0]addra_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5W DIN" *) output [31:0]dina_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5W EN" *) output ena_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5W WE" *) output [0:0]wea_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5R CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM5R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clkb_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5R ADDR" *) output [8:0]addrb_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5R EN" *) output enb_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM5R DOUT" *) input [31:0]doutb_bram5;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6W CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM6W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clka_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6W ADDR" *) output [8:0]addra_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6W DIN" *) output [31:0]dina_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6W EN" *) output ena_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6W WE" *) output [0:0]wea_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6R CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM6R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clkb_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6R ADDR" *) output [8:0]addrb_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6R EN" *) output enb_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM6R DOUT" *) input [31:0]doutb_bram6;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7W CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM7W, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clka_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7W ADDR" *) output [8:0]addra_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7W DIN" *) output [31:0]dina_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7W EN" *) output ena_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7W WE" *) output [0:0]wea_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7R CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM7R, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output clkb_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7R ADDR" *) output [8:0]addrb_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7R EN" *) output enb_bram7;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM7R DOUT" *) input [31:0]doutb_bram7;

  wire \<const1> ;
  wire clk;
  wire [31:0]doutb_bram0;
  wire [31:0]doutb_bram1;
  wire [31:0]doutb_bram2;
  wire [31:0]doutb_bram3;
  wire [31:0]doutb_bram4;
  wire [31:0]doutb_bram5;
  wire [31:0]doutb_bram6;
  wire [31:0]doutb_bram7;
  wire portA_en;
  wire [1:0]portA_regChan;
  wire [2:0]portA_regIdx;
  wire [1:0]portA_regType;
  wire portB_en;
  wire [1:0]portB_regChan;
  wire [2:0]portB_regIdx;
  wire [1:0]portB_regType;
  wire portW_en;
  wire [1:0]portW_regChan;
  wire [2:0]portW_regIdx;
  wire [1:0]portW_regType;
  wire [127:0]portW_writeInData;
  wire [1:0]readQuadIndex;
  wire [1:0]writeQuadIndex;

  assign addra_bram0[8:7] = writeQuadIndex;
  assign addra_bram0[6:5] = portW_regType;
  assign addra_bram0[4:2] = portW_regIdx;
  assign addra_bram0[1:0] = portW_regChan;
  assign addra_bram1[8:7] = writeQuadIndex;
  assign addra_bram1[6:5] = portW_regType;
  assign addra_bram1[4:2] = portW_regIdx;
  assign addra_bram1[1:0] = portW_regChan;
  assign addra_bram2[8:7] = writeQuadIndex;
  assign addra_bram2[6:5] = portW_regType;
  assign addra_bram2[4:2] = portW_regIdx;
  assign addra_bram2[1:0] = portW_regChan;
  assign addra_bram3[8:7] = writeQuadIndex;
  assign addra_bram3[6:5] = portW_regType;
  assign addra_bram3[4:2] = portW_regIdx;
  assign addra_bram3[1:0] = portW_regChan;
  assign addra_bram4[8:7] = writeQuadIndex;
  assign addra_bram4[6:5] = portW_regType;
  assign addra_bram4[4:2] = portW_regIdx;
  assign addra_bram4[1:0] = portW_regChan;
  assign addra_bram5[8:7] = writeQuadIndex;
  assign addra_bram5[6:5] = portW_regType;
  assign addra_bram5[4:2] = portW_regIdx;
  assign addra_bram5[1:0] = portW_regChan;
  assign addra_bram6[8:7] = writeQuadIndex;
  assign addra_bram6[6:5] = portW_regType;
  assign addra_bram6[4:2] = portW_regIdx;
  assign addra_bram6[1:0] = portW_regChan;
  assign addra_bram7[8:7] = writeQuadIndex;
  assign addra_bram7[6:5] = portW_regType;
  assign addra_bram7[4:2] = portW_regIdx;
  assign addra_bram7[1:0] = portW_regChan;
  assign addrb_bram0[8:7] = readQuadIndex;
  assign addrb_bram0[6:5] = portA_regType;
  assign addrb_bram0[4:2] = portA_regIdx;
  assign addrb_bram0[1:0] = portA_regChan;
  assign addrb_bram1[8:7] = readQuadIndex;
  assign addrb_bram1[6:5] = portB_regType;
  assign addrb_bram1[4:2] = portB_regIdx;
  assign addrb_bram1[1:0] = portB_regChan;
  assign addrb_bram2[8:7] = readQuadIndex;
  assign addrb_bram2[6:5] = portA_regType;
  assign addrb_bram2[4:2] = portA_regIdx;
  assign addrb_bram2[1:0] = portA_regChan;
  assign addrb_bram3[8:7] = readQuadIndex;
  assign addrb_bram3[6:5] = portB_regType;
  assign addrb_bram3[4:2] = portB_regIdx;
  assign addrb_bram3[1:0] = portB_regChan;
  assign addrb_bram4[8:7] = readQuadIndex;
  assign addrb_bram4[6:5] = portA_regType;
  assign addrb_bram4[4:2] = portA_regIdx;
  assign addrb_bram4[1:0] = portA_regChan;
  assign addrb_bram5[8:7] = readQuadIndex;
  assign addrb_bram5[6:5] = portB_regType;
  assign addrb_bram5[4:2] = portB_regIdx;
  assign addrb_bram5[1:0] = portB_regChan;
  assign addrb_bram6[8:7] = readQuadIndex;
  assign addrb_bram6[6:5] = portA_regType;
  assign addrb_bram6[4:2] = portA_regIdx;
  assign addrb_bram6[1:0] = portA_regChan;
  assign addrb_bram7[8:7] = readQuadIndex;
  assign addrb_bram7[6:5] = portB_regType;
  assign addrb_bram7[4:2] = portB_regIdx;
  assign addrb_bram7[1:0] = portB_regChan;
  assign clka_bram0 = clk;
  assign clka_bram1 = clk;
  assign clka_bram2 = clk;
  assign clka_bram3 = clk;
  assign clka_bram4 = clk;
  assign clka_bram5 = clk;
  assign clka_bram6 = clk;
  assign clka_bram7 = clk;
  assign clkb_bram0 = clk;
  assign clkb_bram1 = clk;
  assign clkb_bram2 = clk;
  assign clkb_bram3 = clk;
  assign clkb_bram4 = clk;
  assign clkb_bram5 = clk;
  assign clkb_bram6 = clk;
  assign clkb_bram7 = clk;
  assign dina_bram0[31:0] = portW_writeInData[31:0];
  assign dina_bram1[31:0] = portW_writeInData[31:0];
  assign dina_bram2[31:0] = portW_writeInData[63:32];
  assign dina_bram3[31:0] = portW_writeInData[63:32];
  assign dina_bram4[31:0] = portW_writeInData[95:64];
  assign dina_bram5[31:0] = portW_writeInData[95:64];
  assign dina_bram6[31:0] = portW_writeInData[127:96];
  assign dina_bram7[31:0] = portW_writeInData[127:96];
  assign ena_bram0 = portW_en;
  assign ena_bram1 = portW_en;
  assign ena_bram2 = portW_en;
  assign ena_bram3 = portW_en;
  assign ena_bram4 = portW_en;
  assign ena_bram5 = portW_en;
  assign ena_bram6 = portW_en;
  assign ena_bram7 = portW_en;
  assign enb_bram0 = portA_en;
  assign enb_bram1 = portB_en;
  assign enb_bram2 = portA_en;
  assign enb_bram3 = portB_en;
  assign enb_bram4 = portA_en;
  assign enb_bram5 = portB_en;
  assign enb_bram6 = portA_en;
  assign enb_bram7 = portB_en;
  assign portA_readOutData[127:96] = doutb_bram6;
  assign portA_readOutData[95:64] = doutb_bram4;
  assign portA_readOutData[63:32] = doutb_bram2;
  assign portA_readOutData[31:0] = doutb_bram0;
  assign portB_readOutData[127:96] = doutb_bram7;
  assign portB_readOutData[95:64] = doutb_bram5;
  assign portB_readOutData[63:32] = doutb_bram3;
  assign portB_readOutData[31:0] = doutb_bram1;
  assign wea_bram0[0] = \<const1> ;
  assign wea_bram1[0] = \<const1> ;
  assign wea_bram2[0] = \<const1> ;
  assign wea_bram3[0] = \<const1> ;
  assign wea_bram4[0] = \<const1> ;
  assign wea_bram5[0] = \<const1> ;
  assign wea_bram6[0] = \<const1> ;
  assign wea_bram7[0] = \<const1> ;
  VCC VCC
       (.P(\<const1> ));
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
