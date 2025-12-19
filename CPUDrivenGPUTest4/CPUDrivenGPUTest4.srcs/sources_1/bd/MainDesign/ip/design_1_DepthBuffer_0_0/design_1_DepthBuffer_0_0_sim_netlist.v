// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Fri Apr 25 20:02:54 2025
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_DepthBuffer_0_0/design_1_DepthBuffer_0_0_sim_netlist.v
// Design      : design_1_DepthBuffer_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_DepthBuffer_0_0,DepthBuffer,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "DepthBuffer,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_DepthBuffer_0_0
   (clk,
    RAST_PixelReady,
    RAST_PosX,
    RAST_PosY,
    RAST_InPixelDepth,
    RAST_SetDepthParams,
    RAST_DepthWriteEnable,
    RAST_DepthFunction,
    RAST_DepthIsIdle,
    RAST_StencilWriteEnable,
    RAST_StencilRefVal,
    RAST_StencilReadMask,
    RAST_StencilWriteMask,
    RAST_StencilCmpFunc,
    RAST_StencilFailOp,
    RAST_StencilZFailOp,
    RAST_StencilPassOp,
    RAST_PixelPassedDepthStencilTest,
    RAST_PixelFailedDepthTest,
    RAST_PixelFailedStencilTest,
    URAM_addra,
    URAM_clka,
    URAM_dina,
    URAM_ena,
    URAM_wea,
    URAM_addrb,
    URAM_clkb,
    URAM_doutb,
    URAM_enb,
    CMD_ClearDepthBuffer,
    CMD_ClearStencilBuffer,
    CMD_ClearDepthValue,
    CMD_ClearStencilValue,
    CMD_DepthIsIdle,
    STAT_PixelsPassedDepthStencilTest,
    STAT_PixelsFailedDepthTest,
    STAT_PixelsFailedStencilTest);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk" *) input clk;
  input RAST_PixelReady;
  input [9:0]RAST_PosX;
  input [9:0]RAST_PosY;
  input [23:0]RAST_InPixelDepth;
  input RAST_SetDepthParams;
  input RAST_DepthWriteEnable;
  input [2:0]RAST_DepthFunction;
  output RAST_DepthIsIdle;
  input RAST_StencilWriteEnable;
  input [7:0]RAST_StencilRefVal;
  input [7:0]RAST_StencilReadMask;
  input [7:0]RAST_StencilWriteMask;
  input [2:0]RAST_StencilCmpFunc;
  input [2:0]RAST_StencilFailOp;
  input [2:0]RAST_StencilZFailOp;
  input [2:0]RAST_StencilPassOp;
  output RAST_PixelPassedDepthStencilTest;
  output RAST_PixelFailedDepthTest;
  output RAST_PixelFailedStencilTest;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME DBufferRAMW, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output [17:0]URAM_addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW CLK" *) output URAM_clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) output [63:0]URAM_dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW EN" *) output URAM_ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW WE" *) output [7:0]URAM_wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) (* x_interface_parameter = "XIL_INTERFACENAME DBufferRAMR, FREQ_HZ 333250000, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER" *) output [17:0]URAM_addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR CLK" *) output URAM_clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR DOUT" *) input [63:0]URAM_doutb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR EN" *) output URAM_enb;
  input CMD_ClearDepthBuffer;
  input CMD_ClearStencilBuffer;
  input [23:0]CMD_ClearDepthValue;
  input [7:0]CMD_ClearStencilValue;
  output CMD_DepthIsIdle;
  output [31:0]STAT_PixelsPassedDepthStencilTest;
  output [31:0]STAT_PixelsFailedDepthTest;
  output [31:0]STAT_PixelsFailedStencilTest;

  wire \<const1> ;
  wire CMD_ClearDepthBuffer;
  wire [23:0]CMD_ClearDepthValue;
  wire CMD_ClearStencilBuffer;
  wire [7:0]CMD_ClearStencilValue;
  wire CMD_DepthIsIdle;
  wire [2:0]RAST_DepthFunction;
  wire RAST_DepthWriteEnable;
  wire [23:0]RAST_InPixelDepth;
  wire RAST_PixelFailedDepthTest;
  wire RAST_PixelFailedStencilTest;
  wire RAST_PixelPassedDepthStencilTest;
  wire RAST_PixelReady;
  wire [9:0]RAST_PosX;
  wire [9:0]RAST_PosY;
  wire RAST_SetDepthParams;
  wire [2:0]RAST_StencilCmpFunc;
  wire [2:0]RAST_StencilFailOp;
  wire [2:0]RAST_StencilPassOp;
  wire [7:0]RAST_StencilReadMask;
  wire [7:0]RAST_StencilRefVal;
  wire RAST_StencilWriteEnable;
  wire [7:0]RAST_StencilWriteMask;
  wire [2:0]RAST_StencilZFailOp;
  wire [31:0]STAT_PixelsFailedDepthTest;
  wire [31:0]STAT_PixelsFailedStencilTest;
  wire [31:0]STAT_PixelsPassedDepthStencilTest;
  wire [17:0]URAM_addra;
  wire [17:0]URAM_addrb;
  wire [31:0]\^URAM_dina ;
  wire [63:0]URAM_doutb;
  wire [7:1]\^URAM_wea ;
  wire clk;

  assign RAST_DepthIsIdle = CMD_DepthIsIdle;
  assign URAM_clka = clk;
  assign URAM_clkb = clk;
  assign URAM_dina[63:32] = \^URAM_dina [31:0];
  assign URAM_dina[31:0] = \^URAM_dina [31:0];
  assign URAM_ena = \<const1> ;
  assign URAM_enb = \<const1> ;
  assign URAM_wea[7] = \^URAM_wea [7];
  assign URAM_wea[6] = \^URAM_wea [5];
  assign URAM_wea[5] = \^URAM_wea [5];
  assign URAM_wea[4] = \^URAM_wea [5];
  assign URAM_wea[3] = \^URAM_wea [3];
  assign URAM_wea[2] = \^URAM_wea [1];
  assign URAM_wea[1] = \^URAM_wea [1];
  assign URAM_wea[0] = \^URAM_wea [1];
  design_1_DepthBuffer_0_0_DepthBuffer U0
       (.CMD_ClearDepthBuffer(CMD_ClearDepthBuffer),
        .CMD_ClearDepthValue(CMD_ClearDepthValue),
        .CMD_ClearStencilBuffer(CMD_ClearStencilBuffer),
        .CMD_ClearStencilValue(CMD_ClearStencilValue),
        .CMD_DepthIsIdle(CMD_DepthIsIdle),
        .RAST_DepthFunction(RAST_DepthFunction),
        .RAST_DepthWriteEnable(RAST_DepthWriteEnable),
        .RAST_InPixelDepth(RAST_InPixelDepth),
        .RAST_PixelFailedDepthTest(RAST_PixelFailedDepthTest),
        .RAST_PixelFailedStencilTest(RAST_PixelFailedStencilTest),
        .RAST_PixelPassedDepthStencilTest(RAST_PixelPassedDepthStencilTest),
        .RAST_PixelReady(RAST_PixelReady),
        .RAST_PosX(RAST_PosX),
        .RAST_PosY(RAST_PosY),
        .RAST_SetDepthParams(RAST_SetDepthParams),
        .RAST_StencilCmpFunc(RAST_StencilCmpFunc),
        .RAST_StencilFailOp(RAST_StencilFailOp),
        .RAST_StencilPassOp(RAST_StencilPassOp),
        .RAST_StencilReadMask(RAST_StencilReadMask),
        .RAST_StencilRefVal(RAST_StencilRefVal),
        .RAST_StencilWriteEnable(RAST_StencilWriteEnable),
        .RAST_StencilWriteMask(RAST_StencilWriteMask),
        .RAST_StencilZFailOp(RAST_StencilZFailOp),
        .STAT_PixelsFailedDepthTest(STAT_PixelsFailedDepthTest),
        .STAT_PixelsFailedStencilTest(STAT_PixelsFailedStencilTest),
        .STAT_PixelsPassedDepthStencilTest(STAT_PixelsPassedDepthStencilTest),
        .URAM_addra(URAM_addra),
        .URAM_addrb(URAM_addrb),
        .URAM_dina(\^URAM_dina ),
        .URAM_doutb(URAM_doutb),
        .URAM_wea({\^URAM_wea [7],\^URAM_wea [5],\^URAM_wea [3],\^URAM_wea [1]}),
        .clk(clk));
  VCC VCC
       (.P(\<const1> ));
endmodule

(* ORIG_REF_NAME = "DepthBuffer" *) 
module design_1_DepthBuffer_0_0_DepthBuffer
   (URAM_addra,
    URAM_dina,
    URAM_wea,
    URAM_addrb,
    STAT_PixelsPassedDepthStencilTest,
    STAT_PixelsFailedDepthTest,
    STAT_PixelsFailedStencilTest,
    CMD_DepthIsIdle,
    RAST_PixelPassedDepthStencilTest,
    RAST_PixelFailedDepthTest,
    RAST_PixelFailedStencilTest,
    clk,
    URAM_doutb,
    RAST_PixelReady,
    RAST_StencilReadMask,
    RAST_SetDepthParams,
    CMD_ClearDepthBuffer,
    CMD_ClearStencilBuffer,
    CMD_ClearDepthValue,
    RAST_StencilZFailOp,
    RAST_StencilFailOp,
    RAST_PosX,
    RAST_StencilCmpFunc,
    RAST_DepthFunction,
    RAST_StencilWriteMask,
    RAST_PosY,
    RAST_StencilPassOp,
    RAST_StencilWriteEnable,
    RAST_DepthWriteEnable,
    RAST_StencilRefVal,
    CMD_ClearStencilValue,
    RAST_InPixelDepth);
  output [17:0]URAM_addra;
  output [31:0]URAM_dina;
  output [3:0]URAM_wea;
  output [17:0]URAM_addrb;
  output [31:0]STAT_PixelsPassedDepthStencilTest;
  output [31:0]STAT_PixelsFailedDepthTest;
  output [31:0]STAT_PixelsFailedStencilTest;
  output CMD_DepthIsIdle;
  output RAST_PixelPassedDepthStencilTest;
  output RAST_PixelFailedDepthTest;
  output RAST_PixelFailedStencilTest;
  input clk;
  input [63:0]URAM_doutb;
  input RAST_PixelReady;
  input [7:0]RAST_StencilReadMask;
  input RAST_SetDepthParams;
  input CMD_ClearDepthBuffer;
  input CMD_ClearStencilBuffer;
  input [23:0]CMD_ClearDepthValue;
  input [2:0]RAST_StencilZFailOp;
  input [2:0]RAST_StencilFailOp;
  input [9:0]RAST_PosX;
  input [2:0]RAST_StencilCmpFunc;
  input [2:0]RAST_DepthFunction;
  input [7:0]RAST_StencilWriteMask;
  input [9:0]RAST_PosY;
  input [2:0]RAST_StencilPassOp;
  input RAST_StencilWriteEnable;
  input RAST_DepthWriteEnable;
  input [7:0]RAST_StencilRefVal;
  input [7:0]CMD_ClearStencilValue;
  input [23:0]RAST_InPixelDepth;

  wire CMD_ClearDepthBuffer;
  wire [23:0]CMD_ClearDepthValue;
  wire CMD_ClearStencilBuffer;
  wire [7:0]CMD_ClearStencilValue;
  wire CMD_DepthIsIdle;
  wire CMD_DepthIsIdle_i_1_n_0;
  wire CMD_DepthIsIdle_i_2_n_0;
  wire DepthTest0;
  wire DepthTest02_in;
  wire DepthTest0_carry__0_i_10_n_0;
  wire DepthTest0_carry__0_i_11_n_0;
  wire DepthTest0_carry__0_i_12_n_0;
  wire DepthTest0_carry__0_i_13_n_0;
  wire DepthTest0_carry__0_i_14_n_0;
  wire DepthTest0_carry__0_i_15_n_0;
  wire DepthTest0_carry__0_i_16_n_0;
  wire DepthTest0_carry__0_i_1_n_0;
  wire DepthTest0_carry__0_i_2_n_0;
  wire DepthTest0_carry__0_i_3_n_0;
  wire DepthTest0_carry__0_i_4_n_0;
  wire DepthTest0_carry__0_i_5_n_0;
  wire DepthTest0_carry__0_i_6_n_0;
  wire DepthTest0_carry__0_i_7_n_0;
  wire DepthTest0_carry__0_i_8_n_0;
  wire DepthTest0_carry__0_i_9_n_0;
  wire DepthTest0_carry__0_n_5;
  wire DepthTest0_carry__0_n_6;
  wire DepthTest0_carry__0_n_7;
  wire DepthTest0_carry_i_10_n_0;
  wire DepthTest0_carry_i_11_n_0;
  wire DepthTest0_carry_i_12_n_0;
  wire DepthTest0_carry_i_13_n_0;
  wire DepthTest0_carry_i_14_n_0;
  wire DepthTest0_carry_i_15_n_0;
  wire DepthTest0_carry_i_16_n_0;
  wire DepthTest0_carry_i_17_n_0;
  wire DepthTest0_carry_i_18_n_0;
  wire DepthTest0_carry_i_19_n_0;
  wire DepthTest0_carry_i_1_n_0;
  wire DepthTest0_carry_i_20_n_0;
  wire DepthTest0_carry_i_21_n_0;
  wire DepthTest0_carry_i_22_n_0;
  wire DepthTest0_carry_i_23_n_0;
  wire DepthTest0_carry_i_24_n_0;
  wire DepthTest0_carry_i_25_n_0;
  wire DepthTest0_carry_i_26_n_0;
  wire DepthTest0_carry_i_27_n_0;
  wire DepthTest0_carry_i_28_n_0;
  wire DepthTest0_carry_i_29_n_0;
  wire DepthTest0_carry_i_2_n_0;
  wire DepthTest0_carry_i_30_n_0;
  wire DepthTest0_carry_i_31_n_0;
  wire DepthTest0_carry_i_32_n_0;
  wire DepthTest0_carry_i_3_n_0;
  wire DepthTest0_carry_i_4_n_0;
  wire DepthTest0_carry_i_5_n_0;
  wire DepthTest0_carry_i_6_n_0;
  wire DepthTest0_carry_i_7_n_0;
  wire DepthTest0_carry_i_8_n_0;
  wire DepthTest0_carry_i_9_n_0;
  wire DepthTest0_carry_n_0;
  wire DepthTest0_carry_n_1;
  wire DepthTest0_carry_n_2;
  wire DepthTest0_carry_n_3;
  wire DepthTest0_carry_n_5;
  wire DepthTest0_carry_n_6;
  wire DepthTest0_carry_n_7;
  wire \DepthTest0_inferred__0/i__carry_n_1 ;
  wire \DepthTest0_inferred__0/i__carry_n_2 ;
  wire \DepthTest0_inferred__0/i__carry_n_3 ;
  wire \DepthTest0_inferred__0/i__carry_n_5 ;
  wire \DepthTest0_inferred__0/i__carry_n_6 ;
  wire \DepthTest0_inferred__0/i__carry_n_7 ;
  wire [7:0]EvaluateNewStencilValue;
  wire [2:0]RAST_DepthFunction;
  wire RAST_DepthWriteEnable;
  wire [23:0]RAST_InPixelDepth;
  wire RAST_PixelFailedDepthTest;
  wire RAST_PixelFailedDepthTest_i_1_n_0;
  wire RAST_PixelFailedStencilTest;
  wire RAST_PixelFailedStencilTest_i_1_n_0;
  wire RAST_PixelPassedDepthStencilTest;
  wire RAST_PixelPassedDepthStencilTest_i_10_n_0;
  wire RAST_PixelPassedDepthStencilTest_i_11_n_0;
  wire RAST_PixelPassedDepthStencilTest_i_1_n_0;
  wire RAST_PixelPassedDepthStencilTest_i_2_n_0;
  wire RAST_PixelPassedDepthStencilTest_i_3_n_0;
  wire RAST_PixelPassedDepthStencilTest_i_4_n_0;
  wire RAST_PixelPassedDepthStencilTest_i_5_n_0;
  wire RAST_PixelPassedDepthStencilTest_i_6_n_0;
  wire RAST_PixelPassedDepthStencilTest_i_7_n_0;
  wire RAST_PixelPassedDepthStencilTest_i_8_n_0;
  wire RAST_PixelPassedDepthStencilTest_i_9_n_0;
  wire RAST_PixelReady;
  wire [9:0]RAST_PosX;
  wire [9:0]RAST_PosY;
  wire RAST_SetDepthParams;
  wire [2:0]RAST_StencilCmpFunc;
  wire [2:0]RAST_StencilFailOp;
  wire [2:0]RAST_StencilPassOp;
  wire [7:0]RAST_StencilReadMask;
  wire [7:0]RAST_StencilRefVal;
  wire RAST_StencilWriteEnable;
  wire [7:0]RAST_StencilWriteMask;
  wire [2:0]RAST_StencilZFailOp;
  wire [31:0]STAT_PixelsFailedDepthTest;
  wire [31:0]STAT_PixelsFailedStencilTest;
  wire [31:0]STAT_PixelsPassedDepthStencilTest;
  wire StencilTest00_in;
  wire StencilTest0_carry_i_10_n_0;
  wire StencilTest0_carry_i_11_n_0;
  wire StencilTest0_carry_i_1_n_0;
  wire StencilTest0_carry_i_2_n_0;
  wire StencilTest0_carry_i_3_n_0;
  wire StencilTest0_carry_i_4_n_0;
  wire StencilTest0_carry_i_5_n_0;
  wire StencilTest0_carry_i_6_n_0;
  wire StencilTest0_carry_i_7_n_0;
  wire StencilTest0_carry_i_8_n_0;
  wire StencilTest0_carry_i_9_n_0;
  wire StencilTest0_carry_n_5;
  wire StencilTest0_carry_n_6;
  wire StencilTest0_carry_n_7;
  wire [17:0]URAM_addra;
  wire [17:0]URAM_addrb;
  wire [31:0]URAM_dina;
  wire \URAM_dina[56]_i_10_n_0 ;
  wire \URAM_dina[56]_i_11_n_0 ;
  wire \URAM_dina[56]_i_12_n_0 ;
  wire \URAM_dina[56]_i_13_n_0 ;
  wire \URAM_dina[56]_i_2_n_0 ;
  wire \URAM_dina[56]_i_3_n_0 ;
  wire \URAM_dina[56]_i_4_n_0 ;
  wire \URAM_dina[56]_i_5_n_0 ;
  wire \URAM_dina[56]_i_6_n_0 ;
  wire \URAM_dina[56]_i_7_n_0 ;
  wire \URAM_dina[56]_i_8_n_0 ;
  wire \URAM_dina[56]_i_9_n_0 ;
  wire \URAM_dina[57]_i_10_n_0 ;
  wire \URAM_dina[57]_i_11_n_0 ;
  wire \URAM_dina[57]_i_2_n_0 ;
  wire \URAM_dina[57]_i_4_n_0 ;
  wire \URAM_dina[57]_i_5_n_0 ;
  wire \URAM_dina[57]_i_6_n_0 ;
  wire \URAM_dina[57]_i_7_n_0 ;
  wire \URAM_dina[57]_i_8_n_0 ;
  wire \URAM_dina[57]_i_9_n_0 ;
  wire \URAM_dina[58]_i_10_n_0 ;
  wire \URAM_dina[58]_i_11_n_0 ;
  wire \URAM_dina[58]_i_12_n_0 ;
  wire \URAM_dina[58]_i_2_n_0 ;
  wire \URAM_dina[58]_i_4_n_0 ;
  wire \URAM_dina[58]_i_5_n_0 ;
  wire \URAM_dina[58]_i_6_n_0 ;
  wire \URAM_dina[58]_i_7_n_0 ;
  wire \URAM_dina[58]_i_8_n_0 ;
  wire \URAM_dina[58]_i_9_n_0 ;
  wire \URAM_dina[59]_i_10_n_0 ;
  wire \URAM_dina[59]_i_11_n_0 ;
  wire \URAM_dina[59]_i_12_n_0 ;
  wire \URAM_dina[59]_i_13_n_0 ;
  wire \URAM_dina[59]_i_2_n_0 ;
  wire \URAM_dina[59]_i_4_n_0 ;
  wire \URAM_dina[59]_i_5_n_0 ;
  wire \URAM_dina[59]_i_6_n_0 ;
  wire \URAM_dina[59]_i_7_n_0 ;
  wire \URAM_dina[59]_i_8_n_0 ;
  wire \URAM_dina[59]_i_9_n_0 ;
  wire \URAM_dina[60]_i_10_n_0 ;
  wire \URAM_dina[60]_i_11_n_0 ;
  wire \URAM_dina[60]_i_12_n_0 ;
  wire \URAM_dina[60]_i_13_n_0 ;
  wire \URAM_dina[60]_i_2_n_0 ;
  wire \URAM_dina[60]_i_4_n_0 ;
  wire \URAM_dina[60]_i_5_n_0 ;
  wire \URAM_dina[60]_i_6_n_0 ;
  wire \URAM_dina[60]_i_7_n_0 ;
  wire \URAM_dina[60]_i_8_n_0 ;
  wire \URAM_dina[60]_i_9_n_0 ;
  wire \URAM_dina[61]_i_10_n_0 ;
  wire \URAM_dina[61]_i_11_n_0 ;
  wire \URAM_dina[61]_i_12_n_0 ;
  wire \URAM_dina[61]_i_13_n_0 ;
  wire \URAM_dina[61]_i_14_n_0 ;
  wire \URAM_dina[61]_i_15_n_0 ;
  wire \URAM_dina[61]_i_2_n_0 ;
  wire \URAM_dina[61]_i_4_n_0 ;
  wire \URAM_dina[61]_i_5_n_0 ;
  wire \URAM_dina[61]_i_6_n_0 ;
  wire \URAM_dina[61]_i_7_n_0 ;
  wire \URAM_dina[61]_i_8_n_0 ;
  wire \URAM_dina[61]_i_9_n_0 ;
  wire \URAM_dina[62]_i_10_n_0 ;
  wire \URAM_dina[62]_i_11_n_0 ;
  wire \URAM_dina[62]_i_12_n_0 ;
  wire \URAM_dina[62]_i_13_n_0 ;
  wire \URAM_dina[62]_i_14_n_0 ;
  wire \URAM_dina[62]_i_2_n_0 ;
  wire \URAM_dina[62]_i_3_n_0 ;
  wire \URAM_dina[62]_i_7_n_0 ;
  wire \URAM_dina[62]_i_8_n_0 ;
  wire \URAM_dina[62]_i_9_n_0 ;
  wire \URAM_dina[63]_i_10_n_0 ;
  wire \URAM_dina[63]_i_11_n_0 ;
  wire \URAM_dina[63]_i_12_n_0 ;
  wire \URAM_dina[63]_i_13_n_0 ;
  wire \URAM_dina[63]_i_14_n_0 ;
  wire \URAM_dina[63]_i_15_n_0 ;
  wire \URAM_dina[63]_i_16_n_0 ;
  wire \URAM_dina[63]_i_17_n_0 ;
  wire \URAM_dina[63]_i_18_n_0 ;
  wire \URAM_dina[63]_i_2_n_0 ;
  wire \URAM_dina[63]_i_3_n_0 ;
  wire \URAM_dina[63]_i_4_n_0 ;
  wire \URAM_dina[63]_i_5_n_0 ;
  wire \URAM_dina[63]_i_6_n_0 ;
  wire \URAM_dina[63]_i_7_n_0 ;
  wire \URAM_dina[63]_i_8_n_0 ;
  wire \URAM_dina[63]_i_9_n_0 ;
  wire \URAM_dina_reg[57]_i_3_n_0 ;
  wire \URAM_dina_reg[58]_i_3_n_0 ;
  wire \URAM_dina_reg[59]_i_3_n_0 ;
  wire \URAM_dina_reg[60]_i_3_n_0 ;
  wire \URAM_dina_reg[61]_i_3_n_0 ;
  wire \URAM_dina_reg[62]_i_4_n_0 ;
  wire \URAM_dina_reg[62]_i_5_n_0 ;
  wire \URAM_dina_reg[62]_i_6_n_0 ;
  wire [63:0]URAM_doutb;
  wire [3:0]URAM_wea;
  wire [7:3]URAM_wea_0;
  wire [23:0]clearDepthValue;
  wire \clearModeAddress[0]_i_1_n_0 ;
  wire \clearModeAddress[0]_i_3_n_0 ;
  wire \clearModeAddress[0]_i_4_n_0 ;
  wire \clearModeAddress[0]_i_5_n_0 ;
  wire \clearModeAddress[0]_i_6_n_0 ;
  wire \clearModeAddress[0]_i_7_n_0 ;
  wire [17:0]clearModeAddress_reg;
  wire \clearModeAddress_reg[0]_i_2_n_0 ;
  wire \clearModeAddress_reg[0]_i_2_n_1 ;
  wire \clearModeAddress_reg[0]_i_2_n_10 ;
  wire \clearModeAddress_reg[0]_i_2_n_11 ;
  wire \clearModeAddress_reg[0]_i_2_n_12 ;
  wire \clearModeAddress_reg[0]_i_2_n_13 ;
  wire \clearModeAddress_reg[0]_i_2_n_14 ;
  wire \clearModeAddress_reg[0]_i_2_n_15 ;
  wire \clearModeAddress_reg[0]_i_2_n_2 ;
  wire \clearModeAddress_reg[0]_i_2_n_3 ;
  wire \clearModeAddress_reg[0]_i_2_n_5 ;
  wire \clearModeAddress_reg[0]_i_2_n_6 ;
  wire \clearModeAddress_reg[0]_i_2_n_7 ;
  wire \clearModeAddress_reg[0]_i_2_n_8 ;
  wire \clearModeAddress_reg[0]_i_2_n_9 ;
  wire \clearModeAddress_reg[16]_i_1_n_14 ;
  wire \clearModeAddress_reg[16]_i_1_n_15 ;
  wire \clearModeAddress_reg[16]_i_1_n_7 ;
  wire \clearModeAddress_reg[8]_i_1_n_0 ;
  wire \clearModeAddress_reg[8]_i_1_n_1 ;
  wire \clearModeAddress_reg[8]_i_1_n_10 ;
  wire \clearModeAddress_reg[8]_i_1_n_11 ;
  wire \clearModeAddress_reg[8]_i_1_n_12 ;
  wire \clearModeAddress_reg[8]_i_1_n_13 ;
  wire \clearModeAddress_reg[8]_i_1_n_14 ;
  wire \clearModeAddress_reg[8]_i_1_n_15 ;
  wire \clearModeAddress_reg[8]_i_1_n_2 ;
  wire \clearModeAddress_reg[8]_i_1_n_3 ;
  wire \clearModeAddress_reg[8]_i_1_n_5 ;
  wire \clearModeAddress_reg[8]_i_1_n_6 ;
  wire \clearModeAddress_reg[8]_i_1_n_7 ;
  wire \clearModeAddress_reg[8]_i_1_n_8 ;
  wire \clearModeAddress_reg[8]_i_1_n_9 ;
  wire clearModeCompleted;
  wire clearModeCompleted_i_1_n_0;
  wire clearModeEnable_i_1_n_0;
  wire clearModeEnable_reg_n_0;
  wire clearSaveDepthCompareFunc;
  wire \clearSaveDepthCompareFunc_reg_n_0_[0] ;
  wire \clearSaveDepthCompareFunc_reg_n_0_[1] ;
  wire \clearSaveDepthCompareFunc_reg_n_0_[2] ;
  wire clearSaveDepthWriteEnable_reg_n_0;
  wire [2:0]clearSaveStencilCompareFunc;
  wire [2:0]clearSaveStencilPassOp;
  wire [7:0]clearSaveStencilRef;
  wire clearSaveStencilWriteEnable;
  wire [7:0]clearSaveStencilWriteMask;
  wire clk;
  wire \currentDepthCompareFunc[0]_i_1_n_0 ;
  wire \currentDepthCompareFunc[1]_i_1_n_0 ;
  wire \currentDepthCompareFunc[2]_i_1_n_0 ;
  wire \currentDepthCompareFunc_reg_n_0_[0] ;
  wire \currentDepthCompareFunc_reg_n_0_[1] ;
  wire \currentDepthCompareFunc_reg_n_0_[2] ;
  wire \currentStencilCompareFunc[0]_i_1_n_0 ;
  wire \currentStencilCompareFunc[1]_i_1_n_0 ;
  wire \currentStencilCompareFunc[2]_i_1_n_0 ;
  wire \currentStencilCompareFunc[2]_i_2_n_0 ;
  wire \currentStencilCompareFunc_reg_n_0_[0] ;
  wire \currentStencilCompareFunc_reg_n_0_[1] ;
  wire \currentStencilCompareFunc_reg_n_0_[2] ;
  wire \depthPipeline[0][isOddAddress] ;
  wire \depthPipeline[0][pixelAddress] ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_i_2_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_i_3_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_i_4_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_i_5_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_i_6_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_i_7_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_n_11 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_n_12 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_n_13 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_n_14 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_n_15 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_n_5 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_n_6 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry__0_n_7 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_i_10_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_i_11_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_i_2_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_i_3_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_i_4_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_i_5_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_i_6_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_i_7_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_i_8_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_i_9_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_0 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_1 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_10 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_11 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_12 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_13 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_14 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_15 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_2 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_3 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_5 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_6 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_7 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_8 ;
  wire \depthPipeline[0][pixelAddress]0__0_carry_n_9 ;
  wire \depthPipeline[0][pixelAddress][0]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][10]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][11]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][12]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][13]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][14]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][15]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][16]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][17]_i_2_n_0 ;
  wire \depthPipeline[0][pixelAddress][1]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][2]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][3]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][4]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][5]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][6]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][7]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][8]_i_1_n_0 ;
  wire \depthPipeline[0][pixelAddress][9]_i_1_n_0 ;
  wire \depthPipeline_reg[0][isOddAddress]__0 ;
  wire [17:0]\depthPipeline_reg[0][pixelAddress] ;
  wire \depthPipeline_reg[0][pixelEnabled]__0 ;
  wire \depthPipeline_reg[1][pixelEnabled]__0 ;
  wire \depthPipeline_reg[2][pixelEnabled]__0 ;
  wire \depthPipeline_reg[3][isOddAddress]_srl3_n_0 ;
  wire \depthPipeline_reg[3][pixelEnabled]__0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][0]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][0]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][10]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][10]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][11]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][11]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][12]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][12]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][13]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][13]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][14]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][14]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][15]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][15]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][16]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][16]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][17]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][17]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][18]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][18]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][19]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][19]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][1]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][1]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][20]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][20]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][21]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][21]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][22]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][22]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][23]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][23]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][2]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][2]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][3]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][3]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][4]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][4]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][5]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][5]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][6]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][6]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][7]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][7]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][8]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][8]_srl4_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][9]_srl4_i_1_n_0 ;
  wire \depthPipeline_reg[3][pixelTestDepth][9]_srl4_n_0 ;
  wire \depthPipeline_reg[4][isOddAddress_n_0_] ;
  wire \depthPipeline_reg[4][pixelAddress][0]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][10]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][11]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][12]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][13]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][14]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][15]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][16]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][17]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][1]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][2]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][3]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][4]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][5]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][6]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][7]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][8]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelAddress][9]_srl4_n_0 ;
  wire \depthPipeline_reg[4][pixelEnabled]__0 ;
  wire [23:0]\depthPipeline_reg[4][pixelTestDepth] ;
  wire depthWriteEnable;
  wire depthWriteEnable_i_1_n_0;
  wire i__carry_i_10_n_0;
  wire i__carry_i_11_n_0;
  wire i__carry_i_12_n_0;
  wire i__carry_i_13_n_0;
  wire i__carry_i_14_n_0;
  wire i__carry_i_15_n_0;
  wire i__carry_i_16_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire i__carry_i_9_n_0;
  wire [7:2]p_1_in;
  wire \pixelsFailedDepthTest[7]_i_2_n_0 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_0 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_1 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_10 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_11 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_12 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_13 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_14 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_15 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_2 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_3 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_5 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_6 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_7 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_8 ;
  wire \pixelsFailedDepthTest_reg[15]_i_1_n_9 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_0 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_1 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_10 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_11 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_12 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_13 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_14 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_15 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_2 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_3 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_5 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_6 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_7 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_8 ;
  wire \pixelsFailedDepthTest_reg[23]_i_1_n_9 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_1 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_10 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_11 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_12 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_13 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_14 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_15 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_2 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_3 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_5 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_6 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_7 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_8 ;
  wire \pixelsFailedDepthTest_reg[31]_i_1_n_9 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_0 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_1 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_10 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_11 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_12 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_13 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_14 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_15 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_2 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_3 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_5 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_6 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_7 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_8 ;
  wire \pixelsFailedDepthTest_reg[7]_i_1_n_9 ;
  wire \pixelsFailedStencilTest[7]_i_2_n_0 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_0 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_1 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_10 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_11 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_12 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_13 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_14 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_15 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_2 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_3 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_5 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_6 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_7 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_8 ;
  wire \pixelsFailedStencilTest_reg[15]_i_1_n_9 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_0 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_1 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_10 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_11 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_12 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_13 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_14 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_15 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_2 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_3 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_5 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_6 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_7 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_8 ;
  wire \pixelsFailedStencilTest_reg[23]_i_1_n_9 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_1 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_10 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_11 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_12 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_13 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_14 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_15 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_2 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_3 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_5 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_6 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_7 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_8 ;
  wire \pixelsFailedStencilTest_reg[31]_i_1_n_9 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_0 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_1 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_10 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_11 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_12 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_13 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_14 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_15 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_2 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_3 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_5 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_6 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_7 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_8 ;
  wire \pixelsFailedStencilTest_reg[7]_i_1_n_9 ;
  wire pixelsPassedDepthStencilTest;
  wire \pixelsPassedDepthStencilTest[7]_i_2_n_0 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_0 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_1 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_10 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_11 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_12 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_13 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_14 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_15 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_2 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_3 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_5 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_6 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_7 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_8 ;
  wire \pixelsPassedDepthStencilTest_reg[15]_i_1_n_9 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_0 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_1 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_10 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_11 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_12 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_13 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_14 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_15 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_2 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_3 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_5 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_6 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_7 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_8 ;
  wire \pixelsPassedDepthStencilTest_reg[23]_i_1_n_9 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_1 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_10 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_11 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_12 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_13 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_14 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_15 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_2 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_3 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_5 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_6 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_7 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_8 ;
  wire \pixelsPassedDepthStencilTest_reg[31]_i_2_n_9 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_0 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_1 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_10 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_11 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_12 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_13 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_14 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_15 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_2 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_3 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_5 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_6 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_7 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_8 ;
  wire \pixelsPassedDepthStencilTest_reg[7]_i_1_n_9 ;
  wire [2:0]stencilFailOp;
  wire \stencilPassOp[0]_i_1_n_0 ;
  wire \stencilPassOp[1]_i_1_n_0 ;
  wire \stencilPassOp[2]_i_1_n_0 ;
  wire \stencilPassOp_reg_n_0_[0] ;
  wire \stencilPassOp_reg_n_0_[1] ;
  wire \stencilPassOp_reg_n_0_[2] ;
  wire stencilReadMask;
  wire \stencilReadMask_reg_n_0_[0] ;
  wire \stencilReadMask_reg_n_0_[1] ;
  wire \stencilReadMask_reg_n_0_[2] ;
  wire \stencilReadMask_reg_n_0_[3] ;
  wire \stencilReadMask_reg_n_0_[4] ;
  wire \stencilReadMask_reg_n_0_[5] ;
  wire \stencilReadMask_reg_n_0_[6] ;
  wire \stencilReadMask_reg_n_0_[7] ;
  wire [7:0]stencilRef;
  wire \stencilRef[0]_i_1_n_0 ;
  wire \stencilRef[1]_i_1_n_0 ;
  wire \stencilRef[2]_i_1_n_0 ;
  wire \stencilRef[3]_i_1_n_0 ;
  wire \stencilRef[4]_i_1_n_0 ;
  wire \stencilRef[5]_i_1_n_0 ;
  wire \stencilRef[6]_i_1_n_0 ;
  wire \stencilRef[7]_i_2_n_0 ;
  wire stencilWriteEnable_i_1_n_0;
  wire stencilWriteEnable_reg_n_0;
  wire stencilWriteMask;
  wire \stencilWriteMask[0]_i_1_n_0 ;
  wire \stencilWriteMask[1]_i_1_n_0 ;
  wire \stencilWriteMask[2]_i_1_n_0 ;
  wire \stencilWriteMask[3]_i_1_n_0 ;
  wire \stencilWriteMask[4]_i_1_n_0 ;
  wire \stencilWriteMask[5]_i_1_n_0 ;
  wire \stencilWriteMask[6]_i_1_n_0 ;
  wire \stencilWriteMask[7]_i_1_n_0 ;
  wire \stencilWriteMask_reg_n_0_[0] ;
  wire \stencilWriteMask_reg_n_0_[1] ;
  wire \stencilWriteMask_reg_n_0_[2] ;
  wire \stencilWriteMask_reg_n_0_[3] ;
  wire \stencilWriteMask_reg_n_0_[4] ;
  wire \stencilWriteMask_reg_n_0_[5] ;
  wire \stencilWriteMask_reg_n_0_[6] ;
  wire \stencilWriteMask_reg_n_0_[7] ;
  wire [2:0]stencilZFailOp;
  wire [3:3]NLW_DepthTest0_carry_CO_UNCONNECTED;
  wire [7:0]NLW_DepthTest0_carry_O_UNCONNECTED;
  wire [7:4]NLW_DepthTest0_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_DepthTest0_carry__0_O_UNCONNECTED;
  wire [3:3]\NLW_DepthTest0_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [7:0]\NLW_DepthTest0_inferred__0/i__carry_O_UNCONNECTED ;
  wire [7:4]NLW_StencilTest0_carry_CO_UNCONNECTED;
  wire [7:0]NLW_StencilTest0_carry_O_UNCONNECTED;
  wire [3:3]\NLW_clearModeAddress_reg[0]_i_2_CO_UNCONNECTED ;
  wire [7:1]\NLW_clearModeAddress_reg[16]_i_1_CO_UNCONNECTED ;
  wire [7:2]\NLW_clearModeAddress_reg[16]_i_1_O_UNCONNECTED ;
  wire [3:3]\NLW_clearModeAddress_reg[8]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_depthPipeline[0][pixelAddress]0__0_carry_CO_UNCONNECTED ;
  wire [7:3]\NLW_depthPipeline[0][pixelAddress]0__0_carry__0_CO_UNCONNECTED ;
  wire [7:5]\NLW_depthPipeline[0][pixelAddress]0__0_carry__0_O_UNCONNECTED ;
  wire [3:3]\NLW_pixelsFailedDepthTest_reg[15]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_pixelsFailedDepthTest_reg[23]_i_1_CO_UNCONNECTED ;
  wire [7:3]\NLW_pixelsFailedDepthTest_reg[31]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_pixelsFailedDepthTest_reg[7]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_pixelsFailedStencilTest_reg[15]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_pixelsFailedStencilTest_reg[23]_i_1_CO_UNCONNECTED ;
  wire [7:3]\NLW_pixelsFailedStencilTest_reg[31]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_pixelsFailedStencilTest_reg[7]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_pixelsPassedDepthStencilTest_reg[15]_i_1_CO_UNCONNECTED ;
  wire [3:3]\NLW_pixelsPassedDepthStencilTest_reg[23]_i_1_CO_UNCONNECTED ;
  wire [7:3]\NLW_pixelsPassedDepthStencilTest_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_pixelsPassedDepthStencilTest_reg[7]_i_1_CO_UNCONNECTED ;

  LUT5 #(
    .INIT(32'h00000001)) 
    CMD_DepthIsIdle_i_1
       (.I0(\depthPipeline_reg[4][pixelEnabled]__0 ),
        .I1(\depthPipeline_reg[0][pixelEnabled]__0 ),
        .I2(\depthPipeline_reg[1][pixelEnabled]__0 ),
        .I3(\depthPipeline_reg[2][pixelEnabled]__0 ),
        .I4(CMD_DepthIsIdle_i_2_n_0),
        .O(CMD_DepthIsIdle_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    CMD_DepthIsIdle_i_2
       (.I0(RAST_PixelReady),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_SetDepthParams),
        .I3(\depthPipeline_reg[3][pixelEnabled]__0 ),
        .I4(CMD_ClearStencilBuffer),
        .I5(CMD_ClearDepthBuffer),
        .O(CMD_DepthIsIdle_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    CMD_DepthIsIdle_reg
       (.C(clk),
        .CE(1'b1),
        .D(CMD_DepthIsIdle_i_1_n_0),
        .Q(CMD_DepthIsIdle),
        .R(1'b0));
  CARRY8 DepthTest0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({DepthTest0_carry_n_0,DepthTest0_carry_n_1,DepthTest0_carry_n_2,DepthTest0_carry_n_3,NLW_DepthTest0_carry_CO_UNCONNECTED[3],DepthTest0_carry_n_5,DepthTest0_carry_n_6,DepthTest0_carry_n_7}),
        .DI({DepthTest0_carry_i_1_n_0,DepthTest0_carry_i_2_n_0,DepthTest0_carry_i_3_n_0,DepthTest0_carry_i_4_n_0,DepthTest0_carry_i_5_n_0,DepthTest0_carry_i_6_n_0,DepthTest0_carry_i_7_n_0,DepthTest0_carry_i_8_n_0}),
        .O(NLW_DepthTest0_carry_O_UNCONNECTED[7:0]),
        .S({DepthTest0_carry_i_9_n_0,DepthTest0_carry_i_10_n_0,DepthTest0_carry_i_11_n_0,DepthTest0_carry_i_12_n_0,DepthTest0_carry_i_13_n_0,DepthTest0_carry_i_14_n_0,DepthTest0_carry_i_15_n_0,DepthTest0_carry_i_16_n_0}));
  CARRY8 DepthTest0_carry__0
       (.CI(DepthTest0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_DepthTest0_carry__0_CO_UNCONNECTED[7:4],DepthTest02_in,DepthTest0_carry__0_n_5,DepthTest0_carry__0_n_6,DepthTest0_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,DepthTest0_carry__0_i_1_n_0,DepthTest0_carry__0_i_2_n_0,DepthTest0_carry__0_i_3_n_0,DepthTest0_carry__0_i_4_n_0}),
        .O(NLW_DepthTest0_carry__0_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,DepthTest0_carry__0_i_5_n_0,DepthTest0_carry__0_i_6_n_0,DepthTest0_carry__0_i_7_n_0,DepthTest0_carry__0_i_8_n_0}));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry__0_i_1
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [23]),
        .I1(DepthTest0_carry__0_i_9_n_0),
        .I2(URAM_doutb[22]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[54]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [22]),
        .O(DepthTest0_carry__0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry__0_i_10
       (.I0(URAM_doutb[53]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[21]),
        .O(DepthTest0_carry__0_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry__0_i_11
       (.I0(URAM_doutb[51]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[19]),
        .O(DepthTest0_carry__0_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry__0_i_12
       (.I0(URAM_doutb[49]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[17]),
        .O(DepthTest0_carry__0_i_12_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h56A6)) 
    DepthTest0_carry__0_i_13
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [23]),
        .I1(URAM_doutb[23]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[55]),
        .O(DepthTest0_carry__0_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h56A6)) 
    DepthTest0_carry__0_i_14
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [21]),
        .I1(URAM_doutb[21]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[53]),
        .O(DepthTest0_carry__0_i_14_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hA959)) 
    DepthTest0_carry__0_i_15
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [19]),
        .I1(URAM_doutb[19]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[51]),
        .O(DepthTest0_carry__0_i_15_n_0));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h56A6)) 
    DepthTest0_carry__0_i_16
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [17]),
        .I1(URAM_doutb[17]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[49]),
        .O(DepthTest0_carry__0_i_16_n_0));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry__0_i_2
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [21]),
        .I1(DepthTest0_carry__0_i_10_n_0),
        .I2(URAM_doutb[20]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[52]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [20]),
        .O(DepthTest0_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry__0_i_3
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [19]),
        .I1(DepthTest0_carry__0_i_11_n_0),
        .I2(URAM_doutb[18]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[50]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [18]),
        .O(DepthTest0_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry__0_i_4
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [17]),
        .I1(DepthTest0_carry__0_i_12_n_0),
        .I2(URAM_doutb[16]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[48]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [16]),
        .O(DepthTest0_carry__0_i_4_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    DepthTest0_carry__0_i_5
       (.I0(DepthTest0_carry__0_i_13_n_0),
        .I1(URAM_doutb[54]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[22]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [22]),
        .O(DepthTest0_carry__0_i_5_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    DepthTest0_carry__0_i_6
       (.I0(DepthTest0_carry__0_i_14_n_0),
        .I1(URAM_doutb[52]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[20]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [20]),
        .O(DepthTest0_carry__0_i_6_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    DepthTest0_carry__0_i_7
       (.I0(DepthTest0_carry__0_i_15_n_0),
        .I1(URAM_doutb[50]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[18]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [18]),
        .O(DepthTest0_carry__0_i_7_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    DepthTest0_carry__0_i_8
       (.I0(DepthTest0_carry__0_i_16_n_0),
        .I1(URAM_doutb[48]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[16]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [16]),
        .O(DepthTest0_carry__0_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry__0_i_9
       (.I0(URAM_doutb[55]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[23]),
        .O(DepthTest0_carry__0_i_9_n_0));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry_i_1
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [15]),
        .I1(DepthTest0_carry_i_17_n_0),
        .I2(URAM_doutb[14]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[46]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [14]),
        .O(DepthTest0_carry_i_1_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    DepthTest0_carry_i_10
       (.I0(DepthTest0_carry_i_26_n_0),
        .I1(URAM_doutb[44]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[12]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [12]),
        .O(DepthTest0_carry_i_10_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    DepthTest0_carry_i_11
       (.I0(DepthTest0_carry_i_27_n_0),
        .I1(URAM_doutb[42]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[10]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [10]),
        .O(DepthTest0_carry_i_11_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    DepthTest0_carry_i_12
       (.I0(DepthTest0_carry_i_28_n_0),
        .I1(URAM_doutb[40]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[8]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [8]),
        .O(DepthTest0_carry_i_12_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    DepthTest0_carry_i_13
       (.I0(DepthTest0_carry_i_29_n_0),
        .I1(URAM_doutb[38]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[6]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [6]),
        .O(DepthTest0_carry_i_13_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    DepthTest0_carry_i_14
       (.I0(DepthTest0_carry_i_30_n_0),
        .I1(URAM_doutb[36]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[4]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [4]),
        .O(DepthTest0_carry_i_14_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    DepthTest0_carry_i_15
       (.I0(DepthTest0_carry_i_31_n_0),
        .I1(URAM_doutb[34]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[2]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [2]),
        .O(DepthTest0_carry_i_15_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    DepthTest0_carry_i_16
       (.I0(DepthTest0_carry_i_32_n_0),
        .I1(URAM_doutb[32]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[0]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [0]),
        .O(DepthTest0_carry_i_16_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry_i_17
       (.I0(URAM_doutb[47]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[15]),
        .O(DepthTest0_carry_i_17_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry_i_18
       (.I0(URAM_doutb[45]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[13]),
        .O(DepthTest0_carry_i_18_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry_i_19
       (.I0(URAM_doutb[43]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[11]),
        .O(DepthTest0_carry_i_19_n_0));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry_i_2
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [13]),
        .I1(DepthTest0_carry_i_18_n_0),
        .I2(URAM_doutb[12]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[44]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [12]),
        .O(DepthTest0_carry_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry_i_20
       (.I0(URAM_doutb[41]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[9]),
        .O(DepthTest0_carry_i_20_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry_i_21
       (.I0(URAM_doutb[39]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[7]),
        .O(DepthTest0_carry_i_21_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry_i_22
       (.I0(URAM_doutb[37]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[5]),
        .O(DepthTest0_carry_i_22_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry_i_23
       (.I0(URAM_doutb[35]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[3]),
        .O(DepthTest0_carry_i_23_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    DepthTest0_carry_i_24
       (.I0(URAM_doutb[33]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[1]),
        .O(DepthTest0_carry_i_24_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT4 #(
    .INIT(16'h56A6)) 
    DepthTest0_carry_i_25
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [15]),
        .I1(URAM_doutb[15]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[47]),
        .O(DepthTest0_carry_i_25_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hA959)) 
    DepthTest0_carry_i_26
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [13]),
        .I1(URAM_doutb[13]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[45]),
        .O(DepthTest0_carry_i_26_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'h56A6)) 
    DepthTest0_carry_i_27
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [11]),
        .I1(URAM_doutb[11]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[43]),
        .O(DepthTest0_carry_i_27_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'h56A6)) 
    DepthTest0_carry_i_28
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [9]),
        .I1(URAM_doutb[9]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[41]),
        .O(DepthTest0_carry_i_28_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'hA959)) 
    DepthTest0_carry_i_29
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [7]),
        .I1(URAM_doutb[7]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[39]),
        .O(DepthTest0_carry_i_29_n_0));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry_i_3
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [11]),
        .I1(DepthTest0_carry_i_19_n_0),
        .I2(URAM_doutb[10]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[42]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [10]),
        .O(DepthTest0_carry_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h56A6)) 
    DepthTest0_carry_i_30
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [5]),
        .I1(URAM_doutb[5]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[37]),
        .O(DepthTest0_carry_i_30_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h56A6)) 
    DepthTest0_carry_i_31
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [3]),
        .I1(URAM_doutb[3]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[35]),
        .O(DepthTest0_carry_i_31_n_0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'hA959)) 
    DepthTest0_carry_i_32
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [1]),
        .I1(URAM_doutb[1]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[33]),
        .O(DepthTest0_carry_i_32_n_0));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry_i_4
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [9]),
        .I1(DepthTest0_carry_i_20_n_0),
        .I2(URAM_doutb[8]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[40]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [8]),
        .O(DepthTest0_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry_i_5
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [7]),
        .I1(DepthTest0_carry_i_21_n_0),
        .I2(URAM_doutb[6]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[38]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [6]),
        .O(DepthTest0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry_i_6
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [5]),
        .I1(DepthTest0_carry_i_22_n_0),
        .I2(URAM_doutb[4]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[36]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [4]),
        .O(DepthTest0_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry_i_7
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [3]),
        .I1(DepthTest0_carry_i_23_n_0),
        .I2(URAM_doutb[2]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[34]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [2]),
        .O(DepthTest0_carry_i_7_n_0));
  LUT6 #(
    .INIT(64'h44444444DDD444D4)) 
    DepthTest0_carry_i_8
       (.I0(\depthPipeline_reg[4][pixelTestDepth] [1]),
        .I1(DepthTest0_carry_i_24_n_0),
        .I2(URAM_doutb[0]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[32]),
        .I5(\depthPipeline_reg[4][pixelTestDepth] [0]),
        .O(DepthTest0_carry_i_8_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    DepthTest0_carry_i_9
       (.I0(DepthTest0_carry_i_25_n_0),
        .I1(URAM_doutb[46]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[14]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [14]),
        .O(DepthTest0_carry_i_9_n_0));
  CARRY8 \DepthTest0_inferred__0/i__carry 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({DepthTest0,\DepthTest0_inferred__0/i__carry_n_1 ,\DepthTest0_inferred__0/i__carry_n_2 ,\DepthTest0_inferred__0/i__carry_n_3 ,\NLW_DepthTest0_inferred__0/i__carry_CO_UNCONNECTED [3],\DepthTest0_inferred__0/i__carry_n_5 ,\DepthTest0_inferred__0/i__carry_n_6 ,\DepthTest0_inferred__0/i__carry_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_DepthTest0_inferred__0/i__carry_O_UNCONNECTED [7:0]),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0,i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  LUT3 #(
    .INIT(8'h40)) 
    RAST_PixelFailedDepthTest_i_1
       (.I0(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I1(RAST_PixelPassedDepthStencilTest_i_3_n_0),
        .I2(\depthPipeline_reg[4][pixelEnabled]__0 ),
        .O(RAST_PixelFailedDepthTest_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    RAST_PixelFailedDepthTest_reg
       (.C(clk),
        .CE(1'b1),
        .D(RAST_PixelFailedDepthTest_i_1_n_0),
        .Q(RAST_PixelFailedDepthTest),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    RAST_PixelFailedStencilTest_i_1
       (.I0(\depthPipeline_reg[4][pixelEnabled]__0 ),
        .I1(RAST_PixelPassedDepthStencilTest_i_3_n_0),
        .O(RAST_PixelFailedStencilTest_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    RAST_PixelFailedStencilTest_reg
       (.C(clk),
        .CE(1'b1),
        .D(RAST_PixelFailedStencilTest_i_1_n_0),
        .Q(RAST_PixelFailedStencilTest),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h80)) 
    RAST_PixelPassedDepthStencilTest_i_1
       (.I0(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I1(RAST_PixelPassedDepthStencilTest_i_3_n_0),
        .I2(\depthPipeline_reg[4][pixelEnabled]__0 ),
        .O(RAST_PixelPassedDepthStencilTest_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h47B80000)) 
    RAST_PixelPassedDepthStencilTest_i_10
       (.I0(URAM_doutb[62]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[30]),
        .I3(stencilRef[6]),
        .I4(\stencilReadMask_reg_n_0_[6] ),
        .O(RAST_PixelPassedDepthStencilTest_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h656A0000)) 
    RAST_PixelPassedDepthStencilTest_i_11
       (.I0(stencilRef[7]),
        .I1(URAM_doutb[63]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[31]),
        .I4(\stencilReadMask_reg_n_0_[7] ),
        .O(RAST_PixelPassedDepthStencilTest_i_11_n_0));
  LUT5 #(
    .INIT(32'hB0BBF888)) 
    RAST_PixelPassedDepthStencilTest_i_2
       (.I0(\currentDepthCompareFunc_reg_n_0_[0] ),
        .I1(DepthTest02_in),
        .I2(\currentDepthCompareFunc_reg_n_0_[1] ),
        .I3(DepthTest0),
        .I4(\currentDepthCompareFunc_reg_n_0_[2] ),
        .O(RAST_PixelPassedDepthStencilTest_i_2_n_0));
  LUT6 #(
    .INIT(64'hBBBBBBB0888F8888)) 
    RAST_PixelPassedDepthStencilTest_i_3
       (.I0(\currentStencilCompareFunc_reg_n_0_[0] ),
        .I1(StencilTest00_in),
        .I2(RAST_PixelPassedDepthStencilTest_i_4_n_0),
        .I3(RAST_PixelPassedDepthStencilTest_i_5_n_0),
        .I4(\currentStencilCompareFunc_reg_n_0_[1] ),
        .I5(\currentStencilCompareFunc_reg_n_0_[2] ),
        .O(RAST_PixelPassedDepthStencilTest_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF60)) 
    RAST_PixelPassedDepthStencilTest_i_4
       (.I0(StencilTest0_carry_i_11_n_0),
        .I1(stencilRef[0]),
        .I2(\stencilReadMask_reg_n_0_[0] ),
        .I3(RAST_PixelPassedDepthStencilTest_i_6_n_0),
        .I4(RAST_PixelPassedDepthStencilTest_i_7_n_0),
        .I5(RAST_PixelPassedDepthStencilTest_i_8_n_0),
        .O(RAST_PixelPassedDepthStencilTest_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF60)) 
    RAST_PixelPassedDepthStencilTest_i_5
       (.I0(\URAM_dina[60]_i_2_n_0 ),
        .I1(stencilRef[4]),
        .I2(\stencilReadMask_reg_n_0_[4] ),
        .I3(RAST_PixelPassedDepthStencilTest_i_9_n_0),
        .I4(RAST_PixelPassedDepthStencilTest_i_10_n_0),
        .I5(RAST_PixelPassedDepthStencilTest_i_11_n_0),
        .O(RAST_PixelPassedDepthStencilTest_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h656A0000)) 
    RAST_PixelPassedDepthStencilTest_i_6
       (.I0(stencilRef[1]),
        .I1(URAM_doutb[57]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[25]),
        .I4(\stencilReadMask_reg_n_0_[1] ),
        .O(RAST_PixelPassedDepthStencilTest_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h47B80000)) 
    RAST_PixelPassedDepthStencilTest_i_7
       (.I0(URAM_doutb[58]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[26]),
        .I3(stencilRef[2]),
        .I4(\stencilReadMask_reg_n_0_[2] ),
        .O(RAST_PixelPassedDepthStencilTest_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h656A0000)) 
    RAST_PixelPassedDepthStencilTest_i_8
       (.I0(stencilRef[3]),
        .I1(URAM_doutb[59]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[27]),
        .I4(\stencilReadMask_reg_n_0_[3] ),
        .O(RAST_PixelPassedDepthStencilTest_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h656A0000)) 
    RAST_PixelPassedDepthStencilTest_i_9
       (.I0(stencilRef[5]),
        .I1(URAM_doutb[61]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[29]),
        .I4(\stencilReadMask_reg_n_0_[5] ),
        .O(RAST_PixelPassedDepthStencilTest_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    RAST_PixelPassedDepthStencilTest_reg
       (.C(clk),
        .CE(1'b1),
        .D(RAST_PixelPassedDepthStencilTest_i_1_n_0),
        .Q(RAST_PixelPassedDepthStencilTest),
        .R(1'b0));
  CARRY8 StencilTest0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({NLW_StencilTest0_carry_CO_UNCONNECTED[7:4],StencilTest00_in,StencilTest0_carry_n_5,StencilTest0_carry_n_6,StencilTest0_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,StencilTest0_carry_i_1_n_0,StencilTest0_carry_i_2_n_0,StencilTest0_carry_i_3_n_0,StencilTest0_carry_i_4_n_0}),
        .O(NLW_StencilTest0_carry_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,StencilTest0_carry_i_5_n_0,StencilTest0_carry_i_6_n_0,StencilTest0_carry_i_7_n_0,StencilTest0_carry_i_8_n_0}));
  LUT6 #(
    .INIT(64'h20FF002020202020)) 
    StencilTest0_carry_i_1
       (.I0(StencilTest0_carry_i_9_n_0),
        .I1(stencilRef[6]),
        .I2(\stencilReadMask_reg_n_0_[6] ),
        .I3(stencilRef[7]),
        .I4(StencilTest0_carry_i_10_n_0),
        .I5(\stencilReadMask_reg_n_0_[7] ),
        .O(StencilTest0_carry_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    StencilTest0_carry_i_10
       (.I0(URAM_doutb[63]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[31]),
        .O(StencilTest0_carry_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    StencilTest0_carry_i_11
       (.I0(URAM_doutb[56]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[24]),
        .O(StencilTest0_carry_i_11_n_0));
  LUT6 #(
    .INIT(64'h20FF002020202020)) 
    StencilTest0_carry_i_2
       (.I0(\URAM_dina[60]_i_2_n_0 ),
        .I1(stencilRef[4]),
        .I2(\stencilReadMask_reg_n_0_[4] ),
        .I3(stencilRef[5]),
        .I4(\URAM_dina[61]_i_2_n_0 ),
        .I5(\stencilReadMask_reg_n_0_[5] ),
        .O(StencilTest0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h20FF002020202020)) 
    StencilTest0_carry_i_3
       (.I0(\URAM_dina[58]_i_2_n_0 ),
        .I1(stencilRef[2]),
        .I2(\stencilReadMask_reg_n_0_[2] ),
        .I3(stencilRef[3]),
        .I4(\URAM_dina[59]_i_2_n_0 ),
        .I5(\stencilReadMask_reg_n_0_[3] ),
        .O(StencilTest0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h20FF002020202020)) 
    StencilTest0_carry_i_4
       (.I0(StencilTest0_carry_i_11_n_0),
        .I1(stencilRef[0]),
        .I2(\stencilReadMask_reg_n_0_[0] ),
        .I3(stencilRef[1]),
        .I4(\URAM_dina[57]_i_2_n_0 ),
        .I5(\stencilReadMask_reg_n_0_[1] ),
        .O(StencilTest0_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'h9F00009F9F9F9F9F)) 
    StencilTest0_carry_i_5
       (.I0(StencilTest0_carry_i_9_n_0),
        .I1(stencilRef[6]),
        .I2(\stencilReadMask_reg_n_0_[6] ),
        .I3(stencilRef[7]),
        .I4(StencilTest0_carry_i_10_n_0),
        .I5(\stencilReadMask_reg_n_0_[7] ),
        .O(StencilTest0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h9F00009F9F9F9F9F)) 
    StencilTest0_carry_i_6
       (.I0(\URAM_dina[60]_i_2_n_0 ),
        .I1(stencilRef[4]),
        .I2(\stencilReadMask_reg_n_0_[4] ),
        .I3(stencilRef[5]),
        .I4(\URAM_dina[61]_i_2_n_0 ),
        .I5(\stencilReadMask_reg_n_0_[5] ),
        .O(StencilTest0_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h9F00009F9F9F9F9F)) 
    StencilTest0_carry_i_7
       (.I0(\URAM_dina[58]_i_2_n_0 ),
        .I1(stencilRef[2]),
        .I2(\stencilReadMask_reg_n_0_[2] ),
        .I3(stencilRef[3]),
        .I4(\URAM_dina[59]_i_2_n_0 ),
        .I5(\stencilReadMask_reg_n_0_[3] ),
        .O(StencilTest0_carry_i_7_n_0));
  LUT6 #(
    .INIT(64'h9F00009F9F9F9F9F)) 
    StencilTest0_carry_i_8
       (.I0(StencilTest0_carry_i_11_n_0),
        .I1(stencilRef[0]),
        .I2(\stencilReadMask_reg_n_0_[0] ),
        .I3(stencilRef[1]),
        .I4(\URAM_dina[57]_i_2_n_0 ),
        .I5(\stencilReadMask_reg_n_0_[1] ),
        .O(StencilTest0_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    StencilTest0_carry_i_9
       (.I0(URAM_doutb[62]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[30]),
        .O(StencilTest0_carry_i_9_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][0]_srl4_n_0 ),
        .Q(URAM_addra[0]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][10]_srl4_n_0 ),
        .Q(URAM_addra[10]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][11]_srl4_n_0 ),
        .Q(URAM_addra[11]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][12]_srl4_n_0 ),
        .Q(URAM_addra[12]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][13]_srl4_n_0 ),
        .Q(URAM_addra[13]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][14]_srl4_n_0 ),
        .Q(URAM_addra[14]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][15]_srl4_n_0 ),
        .Q(URAM_addra[15]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][16]_srl4_n_0 ),
        .Q(URAM_addra[16]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][17]_srl4_n_0 ),
        .Q(URAM_addra[17]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][1]_srl4_n_0 ),
        .Q(URAM_addra[1]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][2]_srl4_n_0 ),
        .Q(URAM_addra[2]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][3]_srl4_n_0 ),
        .Q(URAM_addra[3]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][4]_srl4_n_0 ),
        .Q(URAM_addra[4]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][5]_srl4_n_0 ),
        .Q(URAM_addra[5]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][6]_srl4_n_0 ),
        .Q(URAM_addra[6]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][7]_srl4_n_0 ),
        .Q(URAM_addra[7]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][8]_srl4_n_0 ),
        .Q(URAM_addra[8]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addra_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelAddress][9]_srl4_n_0 ),
        .Q(URAM_addra[9]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[0] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(RAST_PosX[1]),
        .Q(URAM_addrb[0]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[10] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry_n_10 ),
        .Q(URAM_addrb[10]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[11] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry_n_9 ),
        .Q(URAM_addrb[11]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[12] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry_n_8 ),
        .Q(URAM_addrb[12]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[13] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry__0_n_15 ),
        .Q(URAM_addrb[13]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[14] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry__0_n_14 ),
        .Q(URAM_addrb[14]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[15] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry__0_n_13 ),
        .Q(URAM_addrb[15]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[16] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry__0_n_12 ),
        .Q(URAM_addrb[16]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[17] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry__0_n_11 ),
        .Q(URAM_addrb[17]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[1] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(RAST_PosX[2]),
        .Q(URAM_addrb[1]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[2] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(RAST_PosX[3]),
        .Q(URAM_addrb[2]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[3] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(RAST_PosX[4]),
        .Q(URAM_addrb[3]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[4] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(RAST_PosX[5]),
        .Q(URAM_addrb[4]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[5] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry_n_15 ),
        .Q(URAM_addrb[5]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[6] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry_n_14 ),
        .Q(URAM_addrb[6]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[7] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry_n_13 ),
        .Q(URAM_addrb[7]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[8] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry_n_12 ),
        .Q(URAM_addrb[8]),
        .R(clearModeEnable_reg_n_0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMR ADDR" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_addrb_reg[9] 
       (.C(clk),
        .CE(RAST_PixelReady),
        .D(\depthPipeline[0][pixelAddress]0__0_carry_n_11 ),
        .Q(URAM_addrb[9]),
        .R(clearModeEnable_reg_n_0));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \URAM_dina[56]_i_1 
       (.I0(\URAM_dina[56]_i_2_n_0 ),
        .I1(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I2(\URAM_dina[56]_i_3_n_0 ),
        .I3(RAST_PixelPassedDepthStencilTest_i_3_n_0),
        .I4(\URAM_dina[56]_i_4_n_0 ),
        .O(EvaluateNewStencilValue[0]));
  LUT6 #(
    .INIT(64'h5504500415041004)) 
    \URAM_dina[56]_i_10 
       (.I0(stencilFailOp[2]),
        .I1(StencilTest0_carry_i_11_n_0),
        .I2(stencilFailOp[0]),
        .I3(stencilFailOp[1]),
        .I4(stencilRef[0]),
        .I5(\URAM_dina[61]_i_13_n_0 ),
        .O(\URAM_dina[56]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \URAM_dina[56]_i_11 
       (.I0(stencilFailOp[1]),
        .I1(stencilFailOp[0]),
        .O(\URAM_dina[56]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFACCFA)) 
    \URAM_dina[56]_i_12 
       (.I0(URAM_doutb[25]),
        .I1(URAM_doutb[57]),
        .I2(URAM_doutb[24]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[56]),
        .O(\URAM_dina[56]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h00053305)) 
    \URAM_dina[56]_i_13 
       (.I0(URAM_doutb[27]),
        .I1(URAM_doutb[59]),
        .I2(URAM_doutb[26]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[58]),
        .O(\URAM_dina[56]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0F00FFFFEFE00000)) 
    \URAM_dina[56]_i_2 
       (.I0(\URAM_dina[56]_i_5_n_0 ),
        .I1(\URAM_dina[56]_i_6_n_0 ),
        .I2(\stencilPassOp_reg_n_0_[2] ),
        .I3(\URAM_dina[56]_i_7_n_0 ),
        .I4(\stencilWriteMask_reg_n_0_[0] ),
        .I5(StencilTest0_carry_i_11_n_0),
        .O(\URAM_dina[56]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0F00FFFFDFD00000)) 
    \URAM_dina[56]_i_3 
       (.I0(\URAM_dina[56]_i_8_n_0 ),
        .I1(\URAM_dina[56]_i_6_n_0 ),
        .I2(stencilZFailOp[2]),
        .I3(\URAM_dina[56]_i_9_n_0 ),
        .I4(\stencilWriteMask_reg_n_0_[0] ),
        .I5(StencilTest0_carry_i_11_n_0),
        .O(\URAM_dina[56]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAFFFFEEEA0000)) 
    \URAM_dina[56]_i_4 
       (.I0(\URAM_dina[56]_i_10_n_0 ),
        .I1(stencilFailOp[2]),
        .I2(\URAM_dina[56]_i_6_n_0 ),
        .I3(\URAM_dina[56]_i_11_n_0 ),
        .I4(\stencilWriteMask_reg_n_0_[0] ),
        .I5(StencilTest0_carry_i_11_n_0),
        .O(\URAM_dina[56]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \URAM_dina[56]_i_5 
       (.I0(\stencilPassOp_reg_n_0_[1] ),
        .I1(\stencilPassOp_reg_n_0_[0] ),
        .O(\URAM_dina[56]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \URAM_dina[56]_i_6 
       (.I0(StencilTest0_carry_i_10_n_0),
        .I1(StencilTest0_carry_i_9_n_0),
        .I2(\URAM_dina[61]_i_2_n_0 ),
        .I3(\URAM_dina[60]_i_2_n_0 ),
        .I4(\URAM_dina[56]_i_12_n_0 ),
        .I5(\URAM_dina[56]_i_13_n_0 ),
        .O(\URAM_dina[56]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hA0CFF0C0)) 
    \URAM_dina[56]_i_7 
       (.I0(\URAM_dina[61]_i_13_n_0 ),
        .I1(stencilRef[0]),
        .I2(\stencilPassOp_reg_n_0_[1] ),
        .I3(\stencilPassOp_reg_n_0_[0] ),
        .I4(StencilTest0_carry_i_11_n_0),
        .O(\URAM_dina[56]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \URAM_dina[56]_i_8 
       (.I0(stencilZFailOp[1]),
        .I1(stencilZFailOp[0]),
        .O(\URAM_dina[56]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hA2EEA244)) 
    \URAM_dina[56]_i_9 
       (.I0(stencilZFailOp[1]),
        .I1(StencilTest0_carry_i_11_n_0),
        .I2(\URAM_dina[61]_i_13_n_0 ),
        .I3(stencilZFailOp[0]),
        .I4(stencilRef[0]),
        .O(\URAM_dina[56]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h222E222E222EEE2E)) 
    \URAM_dina[57]_i_1 
       (.I0(\URAM_dina[57]_i_2_n_0 ),
        .I1(\stencilWriteMask_reg_n_0_[1] ),
        .I2(\URAM_dina_reg[57]_i_3_n_0 ),
        .I3(RAST_PixelPassedDepthStencilTest_i_3_n_0),
        .I4(\URAM_dina[57]_i_4_n_0 ),
        .I5(\URAM_dina[57]_i_5_n_0 ),
        .O(EvaluateNewStencilValue[1]));
  LUT6 #(
    .INIT(64'hBEFFBE0000F000F0)) 
    \URAM_dina[57]_i_10 
       (.I0(\URAM_dina[61]_i_13_n_0 ),
        .I1(StencilTest0_carry_i_11_n_0),
        .I2(\URAM_dina[57]_i_2_n_0 ),
        .I3(\stencilPassOp_reg_n_0_[0] ),
        .I4(stencilRef[1]),
        .I5(\stencilPassOp_reg_n_0_[1] ),
        .O(\URAM_dina[57]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h96964B0A)) 
    \URAM_dina[57]_i_11 
       (.I0(\stencilPassOp_reg_n_0_[0] ),
        .I1(StencilTest0_carry_i_11_n_0),
        .I2(\URAM_dina[57]_i_2_n_0 ),
        .I3(\URAM_dina[56]_i_6_n_0 ),
        .I4(\stencilPassOp_reg_n_0_[1] ),
        .O(\URAM_dina[57]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \URAM_dina[57]_i_2 
       (.I0(URAM_doutb[57]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[25]),
        .O(\URAM_dina[57]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00A8)) 
    \URAM_dina[57]_i_4 
       (.I0(\URAM_dina[57]_i_8_n_0 ),
        .I1(stencilZFailOp[2]),
        .I2(\URAM_dina[57]_i_9_n_0 ),
        .I3(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .O(\URAM_dina[57]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \URAM_dina[57]_i_5 
       (.I0(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I1(\URAM_dina[57]_i_10_n_0 ),
        .I2(\stencilPassOp_reg_n_0_[2] ),
        .I3(\URAM_dina[57]_i_11_n_0 ),
        .O(\URAM_dina[57]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h44FF0F0011FF0FFF)) 
    \URAM_dina[57]_i_6 
       (.I0(\URAM_dina[61]_i_13_n_0 ),
        .I1(StencilTest0_carry_i_11_n_0),
        .I2(stencilRef[1]),
        .I3(stencilFailOp[1]),
        .I4(stencilFailOp[0]),
        .I5(\URAM_dina[57]_i_2_n_0 ),
        .O(\URAM_dina[57]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h6D927D93)) 
    \URAM_dina[57]_i_7 
       (.I0(stencilFailOp[1]),
        .I1(stencilFailOp[0]),
        .I2(StencilTest0_carry_i_11_n_0),
        .I3(\URAM_dina[57]_i_2_n_0 ),
        .I4(\URAM_dina[56]_i_6_n_0 ),
        .O(\URAM_dina[57]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h3CC3CC7DFFFFFFFF)) 
    \URAM_dina[57]_i_8 
       (.I0(\URAM_dina[56]_i_6_n_0 ),
        .I1(\URAM_dina[57]_i_2_n_0 ),
        .I2(StencilTest0_carry_i_11_n_0),
        .I3(stencilZFailOp[0]),
        .I4(stencilZFailOp[1]),
        .I5(stencilZFailOp[2]),
        .O(\URAM_dina[57]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h44FF0F0011FF0FFF)) 
    \URAM_dina[57]_i_9 
       (.I0(\URAM_dina[61]_i_13_n_0 ),
        .I1(StencilTest0_carry_i_11_n_0),
        .I2(stencilRef[1]),
        .I3(stencilZFailOp[1]),
        .I4(stencilZFailOp[0]),
        .I5(\URAM_dina[57]_i_2_n_0 ),
        .O(\URAM_dina[57]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h222E222E222EEE2E)) 
    \URAM_dina[58]_i_1 
       (.I0(\URAM_dina[58]_i_2_n_0 ),
        .I1(\stencilWriteMask_reg_n_0_[2] ),
        .I2(\URAM_dina_reg[58]_i_3_n_0 ),
        .I3(RAST_PixelPassedDepthStencilTest_i_3_n_0),
        .I4(\URAM_dina[58]_i_4_n_0 ),
        .I5(\URAM_dina[58]_i_5_n_0 ),
        .O(EvaluateNewStencilValue[2]));
  LUT6 #(
    .INIT(64'h22FF0F0022FF0FFF)) 
    \URAM_dina[58]_i_10 
       (.I0(\URAM_dina[58]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[2]),
        .I3(stencilZFailOp[1]),
        .I4(stencilZFailOp[0]),
        .I5(\URAM_dina[58]_i_2_n_0 ),
        .O(\URAM_dina[58]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h644D9BB2755D9BB3)) 
    \URAM_dina[58]_i_11 
       (.I0(stencilZFailOp[1]),
        .I1(stencilZFailOp[0]),
        .I2(\URAM_dina[57]_i_2_n_0 ),
        .I3(StencilTest0_carry_i_11_n_0),
        .I4(\URAM_dina[58]_i_2_n_0 ),
        .I5(\URAM_dina[56]_i_6_n_0 ),
        .O(\URAM_dina[58]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hC333A5A5C3335555)) 
    \URAM_dina[58]_i_12 
       (.I0(URAM_doutb[26]),
        .I1(URAM_doutb[58]),
        .I2(StencilTest0_carry_i_11_n_0),
        .I3(URAM_doutb[57]),
        .I4(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I5(URAM_doutb[25]),
        .O(\URAM_dina[58]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \URAM_dina[58]_i_2 
       (.I0(URAM_doutb[58]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[26]),
        .O(\URAM_dina[58]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \URAM_dina[58]_i_4 
       (.I0(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I1(\URAM_dina[58]_i_8_n_0 ),
        .I2(\stencilPassOp_reg_n_0_[2] ),
        .I3(\URAM_dina[58]_i_9_n_0 ),
        .O(\URAM_dina[58]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h5044)) 
    \URAM_dina[58]_i_5 
       (.I0(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I1(\URAM_dina[58]_i_10_n_0 ),
        .I2(\URAM_dina[58]_i_11_n_0 ),
        .I3(stencilZFailOp[2]),
        .O(\URAM_dina[58]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h22FF0F0022FF0FFF)) 
    \URAM_dina[58]_i_6 
       (.I0(\URAM_dina[58]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[2]),
        .I3(stencilFailOp[1]),
        .I4(stencilFailOp[0]),
        .I5(\URAM_dina[58]_i_2_n_0 ),
        .O(\URAM_dina[58]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h644D9BB2755D9BB3)) 
    \URAM_dina[58]_i_7 
       (.I0(stencilFailOp[1]),
        .I1(stencilFailOp[0]),
        .I2(\URAM_dina[57]_i_2_n_0 ),
        .I3(StencilTest0_carry_i_11_n_0),
        .I4(\URAM_dina[58]_i_2_n_0 ),
        .I5(\URAM_dina[56]_i_6_n_0 ),
        .O(\URAM_dina[58]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hDD00F0FFDD00F000)) 
    \URAM_dina[58]_i_8 
       (.I0(\URAM_dina[58]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[2]),
        .I3(\stencilPassOp_reg_n_0_[1] ),
        .I4(\stencilPassOp_reg_n_0_[0] ),
        .I5(\URAM_dina[58]_i_2_n_0 ),
        .O(\URAM_dina[58]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hBD42BD4254AB00AA)) 
    \URAM_dina[58]_i_9 
       (.I0(\stencilPassOp_reg_n_0_[0] ),
        .I1(\URAM_dina[57]_i_2_n_0 ),
        .I2(StencilTest0_carry_i_11_n_0),
        .I3(\URAM_dina[58]_i_2_n_0 ),
        .I4(\URAM_dina[56]_i_6_n_0 ),
        .I5(\stencilPassOp_reg_n_0_[1] ),
        .O(\URAM_dina[58]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h222E222E222EEE2E)) 
    \URAM_dina[59]_i_1 
       (.I0(\URAM_dina[59]_i_2_n_0 ),
        .I1(\stencilWriteMask_reg_n_0_[3] ),
        .I2(\URAM_dina_reg[59]_i_3_n_0 ),
        .I3(RAST_PixelPassedDepthStencilTest_i_3_n_0),
        .I4(\URAM_dina[59]_i_4_n_0 ),
        .I5(\URAM_dina[59]_i_5_n_0 ),
        .O(EvaluateNewStencilValue[3]));
  LUT6 #(
    .INIT(64'h22FF0F0022FF0FFF)) 
    \URAM_dina[59]_i_10 
       (.I0(\URAM_dina[59]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[3]),
        .I3(stencilZFailOp[1]),
        .I4(stencilZFailOp[0]),
        .I5(\URAM_dina[59]_i_2_n_0 ),
        .O(\URAM_dina[59]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFCBB3088FCBB30BB)) 
    \URAM_dina[59]_i_11 
       (.I0(\URAM_dina[59]_i_12_n_0 ),
        .I1(stencilZFailOp[1]),
        .I2(\URAM_dina[59]_i_2_n_0 ),
        .I3(stencilZFailOp[0]),
        .I4(\URAM_dina[59]_i_13_n_0 ),
        .I5(\URAM_dina[56]_i_6_n_0 ),
        .O(\URAM_dina[59]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hA959555555555555)) 
    \URAM_dina[59]_i_12 
       (.I0(\URAM_dina[59]_i_2_n_0 ),
        .I1(URAM_doutb[25]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[57]),
        .I4(StencilTest0_carry_i_11_n_0),
        .I5(\URAM_dina[58]_i_2_n_0 ),
        .O(\URAM_dina[59]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h55555555555556A6)) 
    \URAM_dina[59]_i_13 
       (.I0(\URAM_dina[59]_i_2_n_0 ),
        .I1(URAM_doutb[25]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[57]),
        .I4(StencilTest0_carry_i_11_n_0),
        .I5(\URAM_dina[58]_i_2_n_0 ),
        .O(\URAM_dina[59]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \URAM_dina[59]_i_2 
       (.I0(URAM_doutb[59]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[27]),
        .O(\URAM_dina[59]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \URAM_dina[59]_i_4 
       (.I0(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I1(\URAM_dina[59]_i_8_n_0 ),
        .I2(\stencilPassOp_reg_n_0_[2] ),
        .I3(\URAM_dina[59]_i_9_n_0 ),
        .O(\URAM_dina[59]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \URAM_dina[59]_i_5 
       (.I0(\URAM_dina[59]_i_10_n_0 ),
        .I1(stencilZFailOp[2]),
        .I2(\URAM_dina[59]_i_11_n_0 ),
        .I3(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .O(\URAM_dina[59]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h22FF0F0022FF0FFF)) 
    \URAM_dina[59]_i_6 
       (.I0(\URAM_dina[59]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[3]),
        .I3(stencilFailOp[1]),
        .I4(stencilFailOp[0]),
        .I5(\URAM_dina[59]_i_2_n_0 ),
        .O(\URAM_dina[59]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFCBB3088FCBB30BB)) 
    \URAM_dina[59]_i_7 
       (.I0(\URAM_dina[59]_i_12_n_0 ),
        .I1(stencilFailOp[1]),
        .I2(\URAM_dina[59]_i_2_n_0 ),
        .I3(stencilFailOp[0]),
        .I4(\URAM_dina[59]_i_13_n_0 ),
        .I5(\URAM_dina[56]_i_6_n_0 ),
        .O(\URAM_dina[59]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hDD00F0FFDD00F000)) 
    \URAM_dina[59]_i_8 
       (.I0(\URAM_dina[59]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[3]),
        .I3(\stencilPassOp_reg_n_0_[1] ),
        .I4(\stencilPassOp_reg_n_0_[0] ),
        .I5(\URAM_dina[59]_i_2_n_0 ),
        .O(\URAM_dina[59]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0F000FFF550C550C)) 
    \URAM_dina[59]_i_9 
       (.I0(\URAM_dina[59]_i_2_n_0 ),
        .I1(\URAM_dina[56]_i_6_n_0 ),
        .I2(\URAM_dina[59]_i_13_n_0 ),
        .I3(\stencilPassOp_reg_n_0_[0] ),
        .I4(\URAM_dina[59]_i_12_n_0 ),
        .I5(\stencilPassOp_reg_n_0_[1] ),
        .O(\URAM_dina[59]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h222E222E222EEE2E)) 
    \URAM_dina[60]_i_1 
       (.I0(\URAM_dina[60]_i_2_n_0 ),
        .I1(\stencilWriteMask_reg_n_0_[4] ),
        .I2(\URAM_dina_reg[60]_i_3_n_0 ),
        .I3(RAST_PixelPassedDepthStencilTest_i_3_n_0),
        .I4(\URAM_dina[60]_i_4_n_0 ),
        .I5(\URAM_dina[60]_i_5_n_0 ),
        .O(EvaluateNewStencilValue[4]));
  LUT6 #(
    .INIT(64'hDD00F0FFDD00F000)) 
    \URAM_dina[60]_i_10 
       (.I0(\URAM_dina[60]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[4]),
        .I3(\stencilPassOp_reg_n_0_[1] ),
        .I4(\stencilPassOp_reg_n_0_[0] ),
        .I5(\URAM_dina[60]_i_2_n_0 ),
        .O(\URAM_dina[60]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0F000FFF550C550C)) 
    \URAM_dina[60]_i_11 
       (.I0(\URAM_dina[60]_i_2_n_0 ),
        .I1(\URAM_dina[56]_i_6_n_0 ),
        .I2(\URAM_dina[60]_i_13_n_0 ),
        .I3(\stencilPassOp_reg_n_0_[0] ),
        .I4(\URAM_dina[60]_i_12_n_0 ),
        .I5(\stencilPassOp_reg_n_0_[1] ),
        .O(\URAM_dina[60]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h95555555)) 
    \URAM_dina[60]_i_12 
       (.I0(\URAM_dina[60]_i_2_n_0 ),
        .I1(\URAM_dina[59]_i_2_n_0 ),
        .I2(\URAM_dina[58]_i_2_n_0 ),
        .I3(\URAM_dina[57]_i_2_n_0 ),
        .I4(StencilTest0_carry_i_11_n_0),
        .O(\URAM_dina[60]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h55555556)) 
    \URAM_dina[60]_i_13 
       (.I0(\URAM_dina[60]_i_2_n_0 ),
        .I1(\URAM_dina[57]_i_2_n_0 ),
        .I2(StencilTest0_carry_i_11_n_0),
        .I3(\URAM_dina[59]_i_2_n_0 ),
        .I4(\URAM_dina[58]_i_2_n_0 ),
        .O(\URAM_dina[60]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \URAM_dina[60]_i_2 
       (.I0(URAM_doutb[28]),
        .I1(URAM_doutb[60]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .O(\URAM_dina[60]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \URAM_dina[60]_i_4 
       (.I0(\URAM_dina[60]_i_8_n_0 ),
        .I1(stencilZFailOp[2]),
        .I2(\URAM_dina[60]_i_9_n_0 ),
        .I3(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .O(\URAM_dina[60]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \URAM_dina[60]_i_5 
       (.I0(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I1(\URAM_dina[60]_i_10_n_0 ),
        .I2(\stencilPassOp_reg_n_0_[2] ),
        .I3(\URAM_dina[60]_i_11_n_0 ),
        .O(\URAM_dina[60]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h22FF0F0022FF0FFF)) 
    \URAM_dina[60]_i_6 
       (.I0(\URAM_dina[60]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[4]),
        .I3(stencilFailOp[1]),
        .I4(stencilFailOp[0]),
        .I5(\URAM_dina[60]_i_2_n_0 ),
        .O(\URAM_dina[60]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFCBB3088FCBB30BB)) 
    \URAM_dina[60]_i_7 
       (.I0(\URAM_dina[60]_i_12_n_0 ),
        .I1(stencilFailOp[1]),
        .I2(\URAM_dina[60]_i_2_n_0 ),
        .I3(stencilFailOp[0]),
        .I4(\URAM_dina[60]_i_13_n_0 ),
        .I5(\URAM_dina[56]_i_6_n_0 ),
        .O(\URAM_dina[60]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h22FF0F0022FF0FFF)) 
    \URAM_dina[60]_i_8 
       (.I0(\URAM_dina[60]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[4]),
        .I3(stencilZFailOp[1]),
        .I4(stencilZFailOp[0]),
        .I5(\URAM_dina[60]_i_2_n_0 ),
        .O(\URAM_dina[60]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFCBB3088FCBB30BB)) 
    \URAM_dina[60]_i_9 
       (.I0(\URAM_dina[60]_i_12_n_0 ),
        .I1(stencilZFailOp[1]),
        .I2(\URAM_dina[60]_i_2_n_0 ),
        .I3(stencilZFailOp[0]),
        .I4(\URAM_dina[60]_i_13_n_0 ),
        .I5(\URAM_dina[56]_i_6_n_0 ),
        .O(\URAM_dina[60]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h222E222E222EEE2E)) 
    \URAM_dina[61]_i_1 
       (.I0(\URAM_dina[61]_i_2_n_0 ),
        .I1(\stencilWriteMask_reg_n_0_[5] ),
        .I2(\URAM_dina_reg[61]_i_3_n_0 ),
        .I3(RAST_PixelPassedDepthStencilTest_i_3_n_0),
        .I4(\URAM_dina[61]_i_4_n_0 ),
        .I5(\URAM_dina[61]_i_5_n_0 ),
        .O(EvaluateNewStencilValue[5]));
  LUT6 #(
    .INIT(64'hDD00F0FFDD00F000)) 
    \URAM_dina[61]_i_10 
       (.I0(\URAM_dina[61]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[5]),
        .I3(\stencilPassOp_reg_n_0_[1] ),
        .I4(\stencilPassOp_reg_n_0_[0] ),
        .I5(\URAM_dina[61]_i_2_n_0 ),
        .O(\URAM_dina[61]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0F000FFF550C550C)) 
    \URAM_dina[61]_i_11 
       (.I0(\URAM_dina[61]_i_2_n_0 ),
        .I1(\URAM_dina[56]_i_6_n_0 ),
        .I2(\URAM_dina[61]_i_14_n_0 ),
        .I3(\stencilPassOp_reg_n_0_[0] ),
        .I4(\URAM_dina[61]_i_12_n_0 ),
        .I5(\stencilPassOp_reg_n_0_[1] ),
        .O(\URAM_dina[61]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h9555555555555555)) 
    \URAM_dina[61]_i_12 
       (.I0(\URAM_dina[61]_i_2_n_0 ),
        .I1(StencilTest0_carry_i_11_n_0),
        .I2(\URAM_dina[57]_i_2_n_0 ),
        .I3(\URAM_dina[58]_i_2_n_0 ),
        .I4(\URAM_dina[59]_i_2_n_0 ),
        .I5(\URAM_dina[60]_i_2_n_0 ),
        .O(\URAM_dina[61]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h4000000000000000)) 
    \URAM_dina[61]_i_13 
       (.I0(\URAM_dina[61]_i_15_n_0 ),
        .I1(\URAM_dina[63]_i_18_n_0 ),
        .I2(StencilTest0_carry_i_10_n_0),
        .I3(StencilTest0_carry_i_9_n_0),
        .I4(\URAM_dina[61]_i_2_n_0 ),
        .I5(\URAM_dina[60]_i_2_n_0 ),
        .O(\URAM_dina[61]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h5555555555555556)) 
    \URAM_dina[61]_i_14 
       (.I0(\URAM_dina[61]_i_2_n_0 ),
        .I1(\URAM_dina[58]_i_2_n_0 ),
        .I2(\URAM_dina[59]_i_2_n_0 ),
        .I3(StencilTest0_carry_i_11_n_0),
        .I4(\URAM_dina[57]_i_2_n_0 ),
        .I5(\URAM_dina[60]_i_2_n_0 ),
        .O(\URAM_dina[61]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h335FFF5F)) 
    \URAM_dina[61]_i_15 
       (.I0(URAM_doutb[27]),
        .I1(URAM_doutb[59]),
        .I2(URAM_doutb[26]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[58]),
        .O(\URAM_dina[61]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \URAM_dina[61]_i_2 
       (.I0(URAM_doutb[61]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[29]),
        .O(\URAM_dina[61]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \URAM_dina[61]_i_4 
       (.I0(\URAM_dina[61]_i_8_n_0 ),
        .I1(stencilZFailOp[2]),
        .I2(\URAM_dina[61]_i_9_n_0 ),
        .I3(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .O(\URAM_dina[61]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h02A2)) 
    \URAM_dina[61]_i_5 
       (.I0(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I1(\URAM_dina[61]_i_10_n_0 ),
        .I2(\stencilPassOp_reg_n_0_[2] ),
        .I3(\URAM_dina[61]_i_11_n_0 ),
        .O(\URAM_dina[61]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h22FF0F0022FF0FFF)) 
    \URAM_dina[61]_i_6 
       (.I0(\URAM_dina[61]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[5]),
        .I3(stencilFailOp[1]),
        .I4(stencilFailOp[0]),
        .I5(\URAM_dina[61]_i_2_n_0 ),
        .O(\URAM_dina[61]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFCBB3088FCBB30BB)) 
    \URAM_dina[61]_i_7 
       (.I0(\URAM_dina[61]_i_12_n_0 ),
        .I1(stencilFailOp[1]),
        .I2(\URAM_dina[61]_i_2_n_0 ),
        .I3(stencilFailOp[0]),
        .I4(\URAM_dina[61]_i_14_n_0 ),
        .I5(\URAM_dina[56]_i_6_n_0 ),
        .O(\URAM_dina[61]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h22FF0F0022FF0FFF)) 
    \URAM_dina[61]_i_8 
       (.I0(\URAM_dina[61]_i_12_n_0 ),
        .I1(\URAM_dina[61]_i_13_n_0 ),
        .I2(stencilRef[5]),
        .I3(stencilZFailOp[1]),
        .I4(stencilZFailOp[0]),
        .I5(\URAM_dina[61]_i_2_n_0 ),
        .O(\URAM_dina[61]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFCBB3088FCBB30BB)) 
    \URAM_dina[61]_i_9 
       (.I0(\URAM_dina[61]_i_12_n_0 ),
        .I1(stencilZFailOp[1]),
        .I2(\URAM_dina[61]_i_2_n_0 ),
        .I3(stencilZFailOp[0]),
        .I4(\URAM_dina[61]_i_14_n_0 ),
        .I5(\URAM_dina[56]_i_6_n_0 ),
        .O(\URAM_dina[61]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hCFBBCF8803880388)) 
    \URAM_dina[62]_i_10 
       (.I0(\URAM_dina[62]_i_13_n_0 ),
        .I1(\stencilPassOp_reg_n_0_[1] ),
        .I2(StencilTest0_carry_i_9_n_0),
        .I3(\stencilPassOp_reg_n_0_[0] ),
        .I4(\URAM_dina[56]_i_6_n_0 ),
        .I5(\URAM_dina[62]_i_14_n_0 ),
        .O(\URAM_dina[62]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hEE00EE00F0FFF000)) 
    \URAM_dina[62]_i_11 
       (.I0(\URAM_dina[61]_i_13_n_0 ),
        .I1(\URAM_dina[62]_i_13_n_0 ),
        .I2(stencilRef[6]),
        .I3(stencilZFailOp[1]),
        .I4(StencilTest0_carry_i_9_n_0),
        .I5(stencilZFailOp[0]),
        .O(\URAM_dina[62]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hCFBBCF8803880388)) 
    \URAM_dina[62]_i_12 
       (.I0(\URAM_dina[62]_i_13_n_0 ),
        .I1(stencilZFailOp[1]),
        .I2(StencilTest0_carry_i_9_n_0),
        .I3(stencilZFailOp[0]),
        .I4(\URAM_dina[56]_i_6_n_0 ),
        .I5(\URAM_dina[62]_i_14_n_0 ),
        .O(\URAM_dina[62]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \URAM_dina[62]_i_13 
       (.I0(StencilTest0_carry_i_9_n_0),
        .I1(\URAM_dina[60]_i_2_n_0 ),
        .I2(\URAM_dina[59]_i_2_n_0 ),
        .I3(\URAM_dina[58]_i_2_n_0 ),
        .I4(\URAM_dina[63]_i_18_n_0 ),
        .I5(\URAM_dina[61]_i_2_n_0 ),
        .O(\URAM_dina[62]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA9)) 
    \URAM_dina[62]_i_14 
       (.I0(StencilTest0_carry_i_9_n_0),
        .I1(\URAM_dina[60]_i_2_n_0 ),
        .I2(\URAM_dina[56]_i_12_n_0 ),
        .I3(\URAM_dina[59]_i_2_n_0 ),
        .I4(\URAM_dina[58]_i_2_n_0 ),
        .I5(\URAM_dina[61]_i_2_n_0 ),
        .O(\URAM_dina[62]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \URAM_dina[62]_i_2 
       (.I0(\URAM_dina_reg[62]_i_4_n_0 ),
        .I1(\stencilWriteMask_reg_n_0_[6] ),
        .I2(URAM_doutb[62]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[30]),
        .O(\URAM_dina[62]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \URAM_dina[62]_i_3 
       (.I0(\URAM_dina_reg[62]_i_5_n_0 ),
        .I1(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I2(\URAM_dina_reg[62]_i_6_n_0 ),
        .I3(\stencilWriteMask_reg_n_0_[6] ),
        .I4(StencilTest0_carry_i_9_n_0),
        .O(\URAM_dina[62]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hEE00EE00F0FFF000)) 
    \URAM_dina[62]_i_7 
       (.I0(\URAM_dina[61]_i_13_n_0 ),
        .I1(\URAM_dina[62]_i_13_n_0 ),
        .I2(stencilRef[6]),
        .I3(stencilFailOp[1]),
        .I4(StencilTest0_carry_i_9_n_0),
        .I5(stencilFailOp[0]),
        .O(\URAM_dina[62]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hCFBBCF8803880388)) 
    \URAM_dina[62]_i_8 
       (.I0(\URAM_dina[62]_i_13_n_0 ),
        .I1(stencilFailOp[1]),
        .I2(StencilTest0_carry_i_9_n_0),
        .I3(stencilFailOp[0]),
        .I4(\URAM_dina[56]_i_6_n_0 ),
        .I5(\URAM_dina[62]_i_14_n_0 ),
        .O(\URAM_dina[62]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hEE00EE00F0FFF000)) 
    \URAM_dina[62]_i_9 
       (.I0(\URAM_dina[61]_i_13_n_0 ),
        .I1(\URAM_dina[62]_i_13_n_0 ),
        .I2(stencilRef[6]),
        .I3(\stencilPassOp_reg_n_0_[1] ),
        .I4(StencilTest0_carry_i_9_n_0),
        .I5(\stencilPassOp_reg_n_0_[0] ),
        .O(\URAM_dina[62]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF11155515)) 
    \URAM_dina[63]_i_1 
       (.I0(\URAM_dina[63]_i_2_n_0 ),
        .I1(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I2(\URAM_dina[63]_i_3_n_0 ),
        .I3(\stencilPassOp_reg_n_0_[2] ),
        .I4(\URAM_dina[63]_i_4_n_0 ),
        .I5(\URAM_dina[63]_i_5_n_0 ),
        .O(EvaluateNewStencilValue[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFE2FFFF)) 
    \URAM_dina[63]_i_10 
       (.I0(URAM_doutb[30]),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(URAM_doutb[62]),
        .I3(\URAM_dina[60]_i_2_n_0 ),
        .I4(\URAM_dina[63]_i_16_n_0 ),
        .I5(\URAM_dina[61]_i_2_n_0 ),
        .O(\URAM_dina[63]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h38C738C730CFF30F)) 
    \URAM_dina[63]_i_11 
       (.I0(\URAM_dina[63]_i_13_n_0 ),
        .I1(stencilFailOp[1]),
        .I2(stencilFailOp[0]),
        .I3(StencilTest0_carry_i_10_n_0),
        .I4(\URAM_dina[63]_i_14_n_0 ),
        .I5(StencilTest0_carry_i_9_n_0),
        .O(\URAM_dina[63]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h000000000A33FF0F)) 
    \URAM_dina[63]_i_12 
       (.I0(\URAM_dina[63]_i_17_n_0 ),
        .I1(stencilRef[7]),
        .I2(StencilTest0_carry_i_10_n_0),
        .I3(stencilFailOp[0]),
        .I4(stencilFailOp[1]),
        .I5(stencilFailOp[2]),
        .O(\URAM_dina[63]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \URAM_dina[63]_i_13 
       (.I0(\URAM_dina[61]_i_2_n_0 ),
        .I1(StencilTest0_carry_i_11_n_0),
        .I2(\URAM_dina[57]_i_2_n_0 ),
        .I3(\URAM_dina[58]_i_2_n_0 ),
        .I4(\URAM_dina[59]_i_2_n_0 ),
        .I5(\URAM_dina[60]_i_2_n_0 ),
        .O(\URAM_dina[63]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \URAM_dina[63]_i_14 
       (.I0(\URAM_dina[61]_i_2_n_0 ),
        .I1(\URAM_dina[58]_i_2_n_0 ),
        .I2(\URAM_dina[59]_i_2_n_0 ),
        .I3(StencilTest0_carry_i_11_n_0),
        .I4(\URAM_dina[57]_i_2_n_0 ),
        .I5(\URAM_dina[60]_i_2_n_0 ),
        .O(\URAM_dina[63]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h8A80000000000000)) 
    \URAM_dina[63]_i_15 
       (.I0(StencilTest0_carry_i_11_n_0),
        .I1(URAM_doutb[57]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[25]),
        .I4(\URAM_dina[58]_i_2_n_0 ),
        .I5(\URAM_dina[59]_i_2_n_0 ),
        .O(\URAM_dina[63]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000010101)) 
    \URAM_dina[63]_i_16 
       (.I0(\URAM_dina[58]_i_2_n_0 ),
        .I1(\URAM_dina[59]_i_2_n_0 ),
        .I2(StencilTest0_carry_i_11_n_0),
        .I3(URAM_doutb[57]),
        .I4(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I5(URAM_doutb[25]),
        .O(\URAM_dina[63]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \URAM_dina[63]_i_17 
       (.I0(StencilTest0_carry_i_9_n_0),
        .I1(\URAM_dina[60]_i_2_n_0 ),
        .I2(\URAM_dina[59]_i_2_n_0 ),
        .I3(\URAM_dina[58]_i_2_n_0 ),
        .I4(\URAM_dina[63]_i_18_n_0 ),
        .I5(\URAM_dina[61]_i_2_n_0 ),
        .O(\URAM_dina[63]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hCCA000A0)) 
    \URAM_dina[63]_i_18 
       (.I0(URAM_doutb[25]),
        .I1(URAM_doutb[57]),
        .I2(URAM_doutb[24]),
        .I3(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I4(URAM_doutb[56]),
        .O(\URAM_dina[63]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h7F7F7F7777777F77)) 
    \URAM_dina[63]_i_2 
       (.I0(RAST_PixelPassedDepthStencilTest_i_3_n_0),
        .I1(\stencilWriteMask_reg_n_0_[7] ),
        .I2(RAST_PixelPassedDepthStencilTest_i_2_n_0),
        .I3(\URAM_dina[63]_i_6_n_0 ),
        .I4(stencilZFailOp[2]),
        .I5(\URAM_dina[63]_i_7_n_0 ),
        .O(\URAM_dina[63]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAF30AF3F)) 
    \URAM_dina[63]_i_3 
       (.I0(\URAM_dina[63]_i_8_n_0 ),
        .I1(stencilRef[7]),
        .I2(\stencilPassOp_reg_n_0_[1] ),
        .I3(\stencilPassOp_reg_n_0_[0] ),
        .I4(StencilTest0_carry_i_10_n_0),
        .O(\URAM_dina[63]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h38CBFB0B)) 
    \URAM_dina[63]_i_4 
       (.I0(\URAM_dina[63]_i_9_n_0 ),
        .I1(\stencilPassOp_reg_n_0_[1] ),
        .I2(\stencilPassOp_reg_n_0_[0] ),
        .I3(StencilTest0_carry_i_10_n_0),
        .I4(\URAM_dina[63]_i_10_n_0 ),
        .O(\URAM_dina[63]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0007FFFF00070000)) 
    \URAM_dina[63]_i_5 
       (.I0(\URAM_dina[63]_i_11_n_0 ),
        .I1(stencilFailOp[2]),
        .I2(\URAM_dina[63]_i_12_n_0 ),
        .I3(RAST_PixelPassedDepthStencilTest_i_3_n_0),
        .I4(\stencilWriteMask_reg_n_0_[7] ),
        .I5(StencilTest0_carry_i_10_n_0),
        .O(\URAM_dina[63]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00FF0F0077FF0FFF)) 
    \URAM_dina[63]_i_6 
       (.I0(\URAM_dina[63]_i_13_n_0 ),
        .I1(StencilTest0_carry_i_9_n_0),
        .I2(stencilRef[7]),
        .I3(stencilZFailOp[1]),
        .I4(stencilZFailOp[0]),
        .I5(StencilTest0_carry_i_10_n_0),
        .O(\URAM_dina[63]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h38C738C730CFF30F)) 
    \URAM_dina[63]_i_7 
       (.I0(\URAM_dina[63]_i_13_n_0 ),
        .I1(stencilZFailOp[1]),
        .I2(stencilZFailOp[0]),
        .I3(StencilTest0_carry_i_10_n_0),
        .I4(\URAM_dina[63]_i_14_n_0 ),
        .I5(StencilTest0_carry_i_9_n_0),
        .O(\URAM_dina[63]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00007FFF)) 
    \URAM_dina[63]_i_8 
       (.I0(\URAM_dina[61]_i_2_n_0 ),
        .I1(\URAM_dina[63]_i_15_n_0 ),
        .I2(\URAM_dina[60]_i_2_n_0 ),
        .I3(StencilTest0_carry_i_9_n_0),
        .I4(StencilTest0_carry_i_10_n_0),
        .O(\URAM_dina[63]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h95555555)) 
    \URAM_dina[63]_i_9 
       (.I0(StencilTest0_carry_i_10_n_0),
        .I1(\URAM_dina[61]_i_2_n_0 ),
        .I2(\URAM_dina[63]_i_15_n_0 ),
        .I3(\URAM_dina[60]_i_2_n_0 ),
        .I4(StencilTest0_carry_i_9_n_0),
        .O(\URAM_dina[63]_i_9_n_0 ));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[32] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [0]),
        .Q(URAM_dina[0]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[33] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [1]),
        .Q(URAM_dina[1]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[34] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [2]),
        .Q(URAM_dina[2]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[35] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [3]),
        .Q(URAM_dina[3]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[36] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [4]),
        .Q(URAM_dina[4]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[37] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [5]),
        .Q(URAM_dina[5]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[38] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [6]),
        .Q(URAM_dina[6]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[39] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [7]),
        .Q(URAM_dina[7]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[40] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [8]),
        .Q(URAM_dina[8]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[41] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [9]),
        .Q(URAM_dina[9]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[42] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [10]),
        .Q(URAM_dina[10]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[43] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [11]),
        .Q(URAM_dina[11]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[44] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [12]),
        .Q(URAM_dina[12]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[45] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [13]),
        .Q(URAM_dina[13]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[46] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [14]),
        .Q(URAM_dina[14]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[47] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [15]),
        .Q(URAM_dina[15]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[48] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [16]),
        .Q(URAM_dina[16]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[49] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [17]),
        .Q(URAM_dina[17]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[50] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [18]),
        .Q(URAM_dina[18]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[51] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [19]),
        .Q(URAM_dina[19]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[52] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [20]),
        .Q(URAM_dina[20]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[53] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [21]),
        .Q(URAM_dina[21]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[54] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [22]),
        .Q(URAM_dina[22]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[55] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[4][pixelTestDepth] [23]),
        .Q(URAM_dina[23]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[56] 
       (.C(clk),
        .CE(1'b1),
        .D(EvaluateNewStencilValue[0]),
        .Q(URAM_dina[24]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[57] 
       (.C(clk),
        .CE(1'b1),
        .D(EvaluateNewStencilValue[1]),
        .Q(URAM_dina[25]),
        .R(1'b0));
  MUXF7 \URAM_dina_reg[57]_i_3 
       (.I0(\URAM_dina[57]_i_6_n_0 ),
        .I1(\URAM_dina[57]_i_7_n_0 ),
        .O(\URAM_dina_reg[57]_i_3_n_0 ),
        .S(stencilFailOp[2]));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[58] 
       (.C(clk),
        .CE(1'b1),
        .D(EvaluateNewStencilValue[2]),
        .Q(URAM_dina[26]),
        .R(1'b0));
  MUXF7 \URAM_dina_reg[58]_i_3 
       (.I0(\URAM_dina[58]_i_6_n_0 ),
        .I1(\URAM_dina[58]_i_7_n_0 ),
        .O(\URAM_dina_reg[58]_i_3_n_0 ),
        .S(stencilFailOp[2]));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[59] 
       (.C(clk),
        .CE(1'b1),
        .D(EvaluateNewStencilValue[3]),
        .Q(URAM_dina[27]),
        .R(1'b0));
  MUXF7 \URAM_dina_reg[59]_i_3 
       (.I0(\URAM_dina[59]_i_6_n_0 ),
        .I1(\URAM_dina[59]_i_7_n_0 ),
        .O(\URAM_dina_reg[59]_i_3_n_0 ),
        .S(stencilFailOp[2]));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[60] 
       (.C(clk),
        .CE(1'b1),
        .D(EvaluateNewStencilValue[4]),
        .Q(URAM_dina[28]),
        .R(1'b0));
  MUXF7 \URAM_dina_reg[60]_i_3 
       (.I0(\URAM_dina[60]_i_6_n_0 ),
        .I1(\URAM_dina[60]_i_7_n_0 ),
        .O(\URAM_dina_reg[60]_i_3_n_0 ),
        .S(stencilFailOp[2]));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[61] 
       (.C(clk),
        .CE(1'b1),
        .D(EvaluateNewStencilValue[5]),
        .Q(URAM_dina[29]),
        .R(1'b0));
  MUXF7 \URAM_dina_reg[61]_i_3 
       (.I0(\URAM_dina[61]_i_6_n_0 ),
        .I1(\URAM_dina[61]_i_7_n_0 ),
        .O(\URAM_dina_reg[61]_i_3_n_0 ),
        .S(stencilFailOp[2]));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[62] 
       (.C(clk),
        .CE(1'b1),
        .D(EvaluateNewStencilValue[6]),
        .Q(URAM_dina[30]),
        .R(1'b0));
  MUXF7 \URAM_dina_reg[62]_i_1 
       (.I0(\URAM_dina[62]_i_2_n_0 ),
        .I1(\URAM_dina[62]_i_3_n_0 ),
        .O(EvaluateNewStencilValue[6]),
        .S(RAST_PixelPassedDepthStencilTest_i_3_n_0));
  MUXF7 \URAM_dina_reg[62]_i_4 
       (.I0(\URAM_dina[62]_i_7_n_0 ),
        .I1(\URAM_dina[62]_i_8_n_0 ),
        .O(\URAM_dina_reg[62]_i_4_n_0 ),
        .S(stencilFailOp[2]));
  MUXF7 \URAM_dina_reg[62]_i_5 
       (.I0(\URAM_dina[62]_i_9_n_0 ),
        .I1(\URAM_dina[62]_i_10_n_0 ),
        .O(\URAM_dina_reg[62]_i_5_n_0 ),
        .S(\stencilPassOp_reg_n_0_[2] ));
  MUXF7 \URAM_dina_reg[62]_i_6 
       (.I0(\URAM_dina[62]_i_11_n_0 ),
        .I1(\URAM_dina[62]_i_12_n_0 ),
        .O(\URAM_dina_reg[62]_i_6_n_0 ),
        .S(stencilZFailOp[2]));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW DIN" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_dina_reg[63] 
       (.C(clk),
        .CE(1'b1),
        .D(EvaluateNewStencilValue[7]),
        .Q(URAM_dina[31]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \URAM_wea[2]_i_1 
       (.I0(depthWriteEnable),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .O(p_1_in[2]));
  LUT5 #(
    .INIT(32'h5D5D5DFF)) 
    \URAM_wea[3]_i_1 
       (.I0(RAST_PixelPassedDepthStencilTest_i_1_n_0),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(clearModeEnable_reg_n_0),
        .I3(stencilWriteEnable_reg_n_0),
        .I4(depthWriteEnable),
        .O(URAM_wea_0[3]));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'h8A)) 
    \URAM_wea[3]_i_2 
       (.I0(stencilWriteEnable_reg_n_0),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \URAM_wea[6]_i_1 
       (.I0(depthWriteEnable),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(clearModeEnable_reg_n_0),
        .O(p_1_in[6]));
  LUT5 #(
    .INIT(32'h575757FF)) 
    \URAM_wea[7]_i_1 
       (.I0(RAST_PixelPassedDepthStencilTest_i_1_n_0),
        .I1(stencilWriteEnable_reg_n_0),
        .I2(depthWriteEnable),
        .I3(clearModeEnable_reg_n_0),
        .I4(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .O(URAM_wea_0[7]));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT3 #(
    .INIT(8'hA8)) 
    \URAM_wea[7]_i_2 
       (.I0(stencilWriteEnable_reg_n_0),
        .I1(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I2(clearModeEnable_reg_n_0),
        .O(p_1_in[7]));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW WE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_wea_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in[2]),
        .Q(URAM_wea[0]),
        .R(URAM_wea_0[3]));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW WE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_wea_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in[3]),
        .Q(URAM_wea[1]),
        .R(URAM_wea_0[3]));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW WE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_wea_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in[6]),
        .Q(URAM_wea[2]),
        .R(URAM_wea_0[7]));
  (* x_interface_info = "xilinx.com:interface:bram:1.0 DBufferRAMW WE" *) 
  FDRE #(
    .INIT(1'b0)) 
    \URAM_wea_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in[7]),
        .Q(URAM_wea[3]),
        .R(URAM_wea_0[7]));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[0] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[0]),
        .Q(clearDepthValue[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[10] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[10]),
        .Q(clearDepthValue[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[11] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[11]),
        .Q(clearDepthValue[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[12] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[12]),
        .Q(clearDepthValue[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[13] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[13]),
        .Q(clearDepthValue[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[14] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[14]),
        .Q(clearDepthValue[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[15] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[15]),
        .Q(clearDepthValue[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[16] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[16]),
        .Q(clearDepthValue[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[17] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[17]),
        .Q(clearDepthValue[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[18] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[18]),
        .Q(clearDepthValue[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[19] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[19]),
        .Q(clearDepthValue[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[1] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[1]),
        .Q(clearDepthValue[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[20] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[20]),
        .Q(clearDepthValue[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[21] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[21]),
        .Q(clearDepthValue[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[22] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[22]),
        .Q(clearDepthValue[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[23] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[23]),
        .Q(clearDepthValue[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[2] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[2]),
        .Q(clearDepthValue[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[3] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[3]),
        .Q(clearDepthValue[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[4] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[4]),
        .Q(clearDepthValue[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[5] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[5]),
        .Q(clearDepthValue[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[6] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[6]),
        .Q(clearDepthValue[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[7] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[7]),
        .Q(clearDepthValue[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[8] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[8]),
        .Q(clearDepthValue[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearDepthValue_reg[9] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(CMD_ClearDepthValue[9]),
        .Q(clearDepthValue[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \clearModeAddress[0]_i_1 
       (.I0(\clearModeAddress[0]_i_3_n_0 ),
        .I1(clearModeEnable_reg_n_0),
        .O(\clearModeAddress[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAA8AAA8AAA8A8A8)) 
    \clearModeAddress[0]_i_3 
       (.I0(clearModeAddress_reg[17]),
        .I1(clearModeAddress_reg[15]),
        .I2(clearModeAddress_reg[16]),
        .I3(clearModeAddress_reg[14]),
        .I4(\clearModeAddress[0]_i_5_n_0 ),
        .I5(clearModeAddress_reg[13]),
        .O(\clearModeAddress[0]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \clearModeAddress[0]_i_4 
       (.I0(clearModeAddress_reg[0]),
        .O(\clearModeAddress[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h888A888888888888)) 
    \clearModeAddress[0]_i_5 
       (.I0(clearModeAddress_reg[12]),
        .I1(clearModeAddress_reg[11]),
        .I2(\clearModeAddress[0]_i_6_n_0 ),
        .I3(\clearModeAddress[0]_i_7_n_0 ),
        .I4(clearModeAddress_reg[0]),
        .I5(clearModeAddress_reg[5]),
        .O(\clearModeAddress[0]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \clearModeAddress[0]_i_6 
       (.I0(clearModeAddress_reg[2]),
        .I1(clearModeAddress_reg[4]),
        .I2(clearModeAddress_reg[3]),
        .O(\clearModeAddress[0]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \clearModeAddress[0]_i_7 
       (.I0(clearModeAddress_reg[6]),
        .I1(clearModeAddress_reg[10]),
        .I2(clearModeAddress_reg[8]),
        .I3(clearModeAddress_reg[9]),
        .I4(clearModeAddress_reg[1]),
        .I5(clearModeAddress_reg[7]),
        .O(\clearModeAddress[0]_i_7_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[0] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[0]_i_2_n_15 ),
        .Q(clearModeAddress_reg[0]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  CARRY8 \clearModeAddress_reg[0]_i_2 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\clearModeAddress_reg[0]_i_2_n_0 ,\clearModeAddress_reg[0]_i_2_n_1 ,\clearModeAddress_reg[0]_i_2_n_2 ,\clearModeAddress_reg[0]_i_2_n_3 ,\NLW_clearModeAddress_reg[0]_i_2_CO_UNCONNECTED [3],\clearModeAddress_reg[0]_i_2_n_5 ,\clearModeAddress_reg[0]_i_2_n_6 ,\clearModeAddress_reg[0]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\clearModeAddress_reg[0]_i_2_n_8 ,\clearModeAddress_reg[0]_i_2_n_9 ,\clearModeAddress_reg[0]_i_2_n_10 ,\clearModeAddress_reg[0]_i_2_n_11 ,\clearModeAddress_reg[0]_i_2_n_12 ,\clearModeAddress_reg[0]_i_2_n_13 ,\clearModeAddress_reg[0]_i_2_n_14 ,\clearModeAddress_reg[0]_i_2_n_15 }),
        .S({clearModeAddress_reg[7:1],\clearModeAddress[0]_i_4_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[10] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[8]_i_1_n_13 ),
        .Q(clearModeAddress_reg[10]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[11] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[8]_i_1_n_12 ),
        .Q(clearModeAddress_reg[11]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[12] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[8]_i_1_n_11 ),
        .Q(clearModeAddress_reg[12]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[13] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[8]_i_1_n_10 ),
        .Q(clearModeAddress_reg[13]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[14] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[8]_i_1_n_9 ),
        .Q(clearModeAddress_reg[14]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[15] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[8]_i_1_n_8 ),
        .Q(clearModeAddress_reg[15]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[16] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[16]_i_1_n_15 ),
        .Q(clearModeAddress_reg[16]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  CARRY8 \clearModeAddress_reg[16]_i_1 
       (.CI(\clearModeAddress_reg[8]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_clearModeAddress_reg[16]_i_1_CO_UNCONNECTED [7:1],\clearModeAddress_reg[16]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_clearModeAddress_reg[16]_i_1_O_UNCONNECTED [7:2],\clearModeAddress_reg[16]_i_1_n_14 ,\clearModeAddress_reg[16]_i_1_n_15 }),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,clearModeAddress_reg[17:16]}));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[17] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[16]_i_1_n_14 ),
        .Q(clearModeAddress_reg[17]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[1] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[0]_i_2_n_14 ),
        .Q(clearModeAddress_reg[1]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[2] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[0]_i_2_n_13 ),
        .Q(clearModeAddress_reg[2]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[3] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[0]_i_2_n_12 ),
        .Q(clearModeAddress_reg[3]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[4] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[0]_i_2_n_11 ),
        .Q(clearModeAddress_reg[4]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[5] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[0]_i_2_n_10 ),
        .Q(clearModeAddress_reg[5]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[6] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[0]_i_2_n_9 ),
        .Q(clearModeAddress_reg[6]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[7] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[0]_i_2_n_8 ),
        .Q(clearModeAddress_reg[7]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[8] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[8]_i_1_n_15 ),
        .Q(clearModeAddress_reg[8]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  CARRY8 \clearModeAddress_reg[8]_i_1 
       (.CI(\clearModeAddress_reg[0]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\clearModeAddress_reg[8]_i_1_n_0 ,\clearModeAddress_reg[8]_i_1_n_1 ,\clearModeAddress_reg[8]_i_1_n_2 ,\clearModeAddress_reg[8]_i_1_n_3 ,\NLW_clearModeAddress_reg[8]_i_1_CO_UNCONNECTED [3],\clearModeAddress_reg[8]_i_1_n_5 ,\clearModeAddress_reg[8]_i_1_n_6 ,\clearModeAddress_reg[8]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\clearModeAddress_reg[8]_i_1_n_8 ,\clearModeAddress_reg[8]_i_1_n_9 ,\clearModeAddress_reg[8]_i_1_n_10 ,\clearModeAddress_reg[8]_i_1_n_11 ,\clearModeAddress_reg[8]_i_1_n_12 ,\clearModeAddress_reg[8]_i_1_n_13 ,\clearModeAddress_reg[8]_i_1_n_14 ,\clearModeAddress_reg[8]_i_1_n_15 }),
        .S(clearModeAddress_reg[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \clearModeAddress_reg[9] 
       (.C(clk),
        .CE(clearModeEnable_reg_n_0),
        .D(\clearModeAddress_reg[8]_i_1_n_14 ),
        .Q(clearModeAddress_reg[9]),
        .R(\clearModeAddress[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    clearModeCompleted_i_1
       (.I0(\clearModeAddress[0]_i_3_n_0 ),
        .I1(clearModeEnable_reg_n_0),
        .I2(clearModeCompleted),
        .O(clearModeCompleted_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clearModeCompleted_reg
       (.C(clk),
        .CE(1'b1),
        .D(clearModeCompleted_i_1_n_0),
        .Q(clearModeCompleted),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h53535350)) 
    clearModeEnable_i_1
       (.I0(clearModeCompleted),
        .I1(RAST_SetDepthParams),
        .I2(clearModeEnable_reg_n_0),
        .I3(CMD_ClearDepthBuffer),
        .I4(CMD_ClearStencilBuffer),
        .O(clearModeEnable_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    clearModeEnable_reg
       (.C(clk),
        .CE(1'b1),
        .D(clearModeEnable_i_1_n_0),
        .Q(clearModeEnable_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveDepthCompareFunc_reg[0] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\currentDepthCompareFunc_reg_n_0_[0] ),
        .Q(\clearSaveDepthCompareFunc_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveDepthCompareFunc_reg[1] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\currentDepthCompareFunc_reg_n_0_[1] ),
        .Q(\clearSaveDepthCompareFunc_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveDepthCompareFunc_reg[2] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\currentDepthCompareFunc_reg_n_0_[2] ),
        .Q(\clearSaveDepthCompareFunc_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    clearSaveDepthWriteEnable_reg
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(depthWriteEnable),
        .Q(clearSaveDepthWriteEnable_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveStencilCompareFunc_reg[0] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\currentStencilCompareFunc_reg_n_0_[0] ),
        .Q(clearSaveStencilCompareFunc[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveStencilCompareFunc_reg[1] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\currentStencilCompareFunc_reg_n_0_[1] ),
        .Q(clearSaveStencilCompareFunc[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveStencilCompareFunc_reg[2] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\currentStencilCompareFunc_reg_n_0_[2] ),
        .Q(clearSaveStencilCompareFunc[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveStencilPassOp_reg[0] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\stencilPassOp_reg_n_0_[0] ),
        .Q(clearSaveStencilPassOp[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveStencilPassOp_reg[1] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\stencilPassOp_reg_n_0_[1] ),
        .Q(clearSaveStencilPassOp[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveStencilPassOp_reg[2] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\stencilPassOp_reg_n_0_[2] ),
        .Q(clearSaveStencilPassOp[2]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h000E)) 
    \clearSaveStencilRef[7]_i_1 
       (.I0(CMD_ClearStencilBuffer),
        .I1(CMD_ClearDepthBuffer),
        .I2(clearModeEnable_reg_n_0),
        .I3(RAST_SetDepthParams),
        .O(clearSaveDepthCompareFunc));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveStencilRef_reg[0] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(stencilRef[0]),
        .Q(clearSaveStencilRef[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveStencilRef_reg[1] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(stencilRef[1]),
        .Q(clearSaveStencilRef[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveStencilRef_reg[2] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(stencilRef[2]),
        .Q(clearSaveStencilRef[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveStencilRef_reg[3] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(stencilRef[3]),
        .Q(clearSaveStencilRef[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveStencilRef_reg[4] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(stencilRef[4]),
        .Q(clearSaveStencilRef[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveStencilRef_reg[5] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(stencilRef[5]),
        .Q(clearSaveStencilRef[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveStencilRef_reg[6] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(stencilRef[6]),
        .Q(clearSaveStencilRef[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clearSaveStencilRef_reg[7] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(stencilRef[7]),
        .Q(clearSaveStencilRef[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    clearSaveStencilWriteEnable_reg
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(stencilWriteEnable_reg_n_0),
        .Q(clearSaveStencilWriteEnable),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveStencilWriteMask_reg[0] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\stencilWriteMask_reg_n_0_[0] ),
        .Q(clearSaveStencilWriteMask[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveStencilWriteMask_reg[1] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\stencilWriteMask_reg_n_0_[1] ),
        .Q(clearSaveStencilWriteMask[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveStencilWriteMask_reg[2] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\stencilWriteMask_reg_n_0_[2] ),
        .Q(clearSaveStencilWriteMask[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveStencilWriteMask_reg[3] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\stencilWriteMask_reg_n_0_[3] ),
        .Q(clearSaveStencilWriteMask[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveStencilWriteMask_reg[4] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\stencilWriteMask_reg_n_0_[4] ),
        .Q(clearSaveStencilWriteMask[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveStencilWriteMask_reg[5] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\stencilWriteMask_reg_n_0_[5] ),
        .Q(clearSaveStencilWriteMask[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveStencilWriteMask_reg[6] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\stencilWriteMask_reg_n_0_[6] ),
        .Q(clearSaveStencilWriteMask[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \clearSaveStencilWriteMask_reg[7] 
       (.C(clk),
        .CE(clearSaveDepthCompareFunc),
        .D(\stencilWriteMask_reg_n_0_[7] ),
        .Q(clearSaveStencilWriteMask[7]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF088)) 
    \currentDepthCompareFunc[0]_i_1 
       (.I0(RAST_SetDepthParams),
        .I1(RAST_DepthFunction[0]),
        .I2(\clearSaveDepthCompareFunc_reg_n_0_[0] ),
        .I3(clearModeEnable_reg_n_0),
        .O(\currentDepthCompareFunc[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hACA0)) 
    \currentDepthCompareFunc[1]_i_1 
       (.I0(\clearSaveDepthCompareFunc_reg_n_0_[1] ),
        .I1(RAST_SetDepthParams),
        .I2(clearModeEnable_reg_n_0),
        .I3(RAST_DepthFunction[1]),
        .O(\currentDepthCompareFunc[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF088)) 
    \currentDepthCompareFunc[2]_i_1 
       (.I0(RAST_SetDepthParams),
        .I1(RAST_DepthFunction[2]),
        .I2(\clearSaveDepthCompareFunc_reg_n_0_[2] ),
        .I3(clearModeEnable_reg_n_0),
        .O(\currentDepthCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \currentDepthCompareFunc_reg[0] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\currentDepthCompareFunc[0]_i_1_n_0 ),
        .Q(\currentDepthCompareFunc_reg_n_0_[0] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \currentDepthCompareFunc_reg[1] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\currentDepthCompareFunc[1]_i_1_n_0 ),
        .Q(\currentDepthCompareFunc_reg_n_0_[1] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \currentDepthCompareFunc_reg[2] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\currentDepthCompareFunc[2]_i_1_n_0 ),
        .Q(\currentDepthCompareFunc_reg_n_0_[2] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF088)) 
    \currentStencilCompareFunc[0]_i_1 
       (.I0(RAST_SetDepthParams),
        .I1(RAST_StencilCmpFunc[0]),
        .I2(clearSaveStencilCompareFunc[0]),
        .I3(clearModeEnable_reg_n_0),
        .O(\currentStencilCompareFunc[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hACA0)) 
    \currentStencilCompareFunc[1]_i_1 
       (.I0(clearSaveStencilCompareFunc[1]),
        .I1(RAST_SetDepthParams),
        .I2(clearModeEnable_reg_n_0),
        .I3(RAST_StencilCmpFunc[1]),
        .O(\currentStencilCompareFunc[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h1110)) 
    \currentStencilCompareFunc[2]_i_1 
       (.I0(clearModeEnable_reg_n_0),
        .I1(RAST_SetDepthParams),
        .I2(CMD_ClearDepthBuffer),
        .I3(CMD_ClearStencilBuffer),
        .O(\currentStencilCompareFunc[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hACA0)) 
    \currentStencilCompareFunc[2]_i_2 
       (.I0(clearSaveStencilCompareFunc[2]),
        .I1(RAST_SetDepthParams),
        .I2(clearModeEnable_reg_n_0),
        .I3(RAST_StencilCmpFunc[2]),
        .O(\currentStencilCompareFunc[2]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \currentStencilCompareFunc_reg[0] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\currentStencilCompareFunc[0]_i_1_n_0 ),
        .Q(\currentStencilCompareFunc_reg_n_0_[0] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \currentStencilCompareFunc_reg[1] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\currentStencilCompareFunc[1]_i_1_n_0 ),
        .Q(\currentStencilCompareFunc_reg_n_0_[1] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \currentStencilCompareFunc_reg[2] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\currentStencilCompareFunc[2]_i_2_n_0 ),
        .Q(\currentStencilCompareFunc_reg_n_0_[2] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \depthPipeline[0][isOddAddress]_i_1 
       (.I0(RAST_PosX[0]),
        .I1(RAST_PixelReady),
        .O(\depthPipeline[0][isOddAddress] ));
  CARRY8 \depthPipeline[0][pixelAddress]0__0_carry 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\depthPipeline[0][pixelAddress]0__0_carry_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry_n_1 ,\depthPipeline[0][pixelAddress]0__0_carry_n_2 ,\depthPipeline[0][pixelAddress]0__0_carry_n_3 ,\NLW_depthPipeline[0][pixelAddress]0__0_carry_CO_UNCONNECTED [3],\depthPipeline[0][pixelAddress]0__0_carry_n_5 ,\depthPipeline[0][pixelAddress]0__0_carry_n_6 ,\depthPipeline[0][pixelAddress]0__0_carry_n_7 }),
        .DI({\depthPipeline[0][pixelAddress]0__0_carry_i_1_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry_i_2_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry_i_3_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry_i_4_n_0 ,RAST_PosY[2:0],1'b0}),
        .O({\depthPipeline[0][pixelAddress]0__0_carry_n_8 ,\depthPipeline[0][pixelAddress]0__0_carry_n_9 ,\depthPipeline[0][pixelAddress]0__0_carry_n_10 ,\depthPipeline[0][pixelAddress]0__0_carry_n_11 ,\depthPipeline[0][pixelAddress]0__0_carry_n_12 ,\depthPipeline[0][pixelAddress]0__0_carry_n_13 ,\depthPipeline[0][pixelAddress]0__0_carry_n_14 ,\depthPipeline[0][pixelAddress]0__0_carry_n_15 }),
        .S({\depthPipeline[0][pixelAddress]0__0_carry_i_5_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry_i_6_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry_i_7_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry_i_8_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry_i_9_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry_i_10_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry_i_11_n_0 ,RAST_PosX[6]}));
  CARRY8 \depthPipeline[0][pixelAddress]0__0_carry__0 
       (.CI(\depthPipeline[0][pixelAddress]0__0_carry_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_depthPipeline[0][pixelAddress]0__0_carry__0_CO_UNCONNECTED [7:3],\depthPipeline[0][pixelAddress]0__0_carry__0_n_5 ,\depthPipeline[0][pixelAddress]0__0_carry__0_n_6 ,\depthPipeline[0][pixelAddress]0__0_carry__0_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,RAST_PosY[8],\depthPipeline[0][pixelAddress]0__0_carry__0_i_1_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry__0_i_2_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry__0_i_3_n_0 }),
        .O({\NLW_depthPipeline[0][pixelAddress]0__0_carry__0_O_UNCONNECTED [7:5],\depthPipeline[0][pixelAddress]0__0_carry__0_n_11 ,\depthPipeline[0][pixelAddress]0__0_carry__0_n_12 ,\depthPipeline[0][pixelAddress]0__0_carry__0_n_13 ,\depthPipeline[0][pixelAddress]0__0_carry__0_n_14 ,\depthPipeline[0][pixelAddress]0__0_carry__0_n_15 }),
        .S({1'b0,1'b0,1'b0,RAST_PosY[9],\depthPipeline[0][pixelAddress]0__0_carry__0_i_4_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry__0_i_5_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry__0_i_6_n_0 ,\depthPipeline[0][pixelAddress]0__0_carry__0_i_7_n_0 }));
  LUT2 #(
    .INIT(4'h8)) 
    \depthPipeline[0][pixelAddress]0__0_carry__0_i_1 
       (.I0(RAST_PosY[6]),
        .I1(RAST_PosY[8]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry__0_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \depthPipeline[0][pixelAddress]0__0_carry__0_i_2 
       (.I0(RAST_PosY[5]),
        .I1(RAST_PosY[7]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry__0_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \depthPipeline[0][pixelAddress]0__0_carry__0_i_3 
       (.I0(RAST_PosY[4]),
        .I1(RAST_PosY[6]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry__0_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h78)) 
    \depthPipeline[0][pixelAddress]0__0_carry__0_i_4 
       (.I0(RAST_PosY[9]),
        .I1(RAST_PosY[7]),
        .I2(RAST_PosY[8]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry__0_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \depthPipeline[0][pixelAddress]0__0_carry__0_i_5 
       (.I0(RAST_PosY[8]),
        .I1(RAST_PosY[6]),
        .I2(RAST_PosY[9]),
        .I3(RAST_PosY[7]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry__0_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \depthPipeline[0][pixelAddress]0__0_carry__0_i_6 
       (.I0(RAST_PosY[7]),
        .I1(RAST_PosY[5]),
        .I2(RAST_PosY[8]),
        .I3(RAST_PosY[6]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry__0_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \depthPipeline[0][pixelAddress]0__0_carry__0_i_7 
       (.I0(RAST_PosY[6]),
        .I1(RAST_PosY[4]),
        .I2(RAST_PosY[7]),
        .I3(RAST_PosY[5]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry__0_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \depthPipeline[0][pixelAddress]0__0_carry_i_1 
       (.I0(RAST_PosY[3]),
        .I1(RAST_PosY[5]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \depthPipeline[0][pixelAddress]0__0_carry_i_10 
       (.I0(RAST_PosY[1]),
        .I1(RAST_PosX[8]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \depthPipeline[0][pixelAddress]0__0_carry_i_11 
       (.I0(RAST_PosY[0]),
        .I1(RAST_PosX[7]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \depthPipeline[0][pixelAddress]0__0_carry_i_2 
       (.I0(RAST_PosY[2]),
        .I1(RAST_PosY[4]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \depthPipeline[0][pixelAddress]0__0_carry_i_3 
       (.I0(RAST_PosY[1]),
        .I1(RAST_PosY[3]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \depthPipeline[0][pixelAddress]0__0_carry_i_4 
       (.I0(RAST_PosX[9]),
        .I1(RAST_PosY[0]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \depthPipeline[0][pixelAddress]0__0_carry_i_5 
       (.I0(RAST_PosY[5]),
        .I1(RAST_PosY[3]),
        .I2(RAST_PosY[6]),
        .I3(RAST_PosY[4]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry_i_5_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \depthPipeline[0][pixelAddress]0__0_carry_i_6 
       (.I0(RAST_PosY[4]),
        .I1(RAST_PosY[2]),
        .I2(RAST_PosY[5]),
        .I3(RAST_PosY[3]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \depthPipeline[0][pixelAddress]0__0_carry_i_7 
       (.I0(RAST_PosY[3]),
        .I1(RAST_PosY[1]),
        .I2(RAST_PosY[4]),
        .I3(RAST_PosY[2]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \depthPipeline[0][pixelAddress]0__0_carry_i_8 
       (.I0(RAST_PosY[0]),
        .I1(RAST_PosX[9]),
        .I2(RAST_PosY[3]),
        .I3(RAST_PosY[1]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry_i_8_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \depthPipeline[0][pixelAddress]0__0_carry_i_9 
       (.I0(RAST_PosY[0]),
        .I1(RAST_PosX[9]),
        .I2(RAST_PosY[2]),
        .O(\depthPipeline[0][pixelAddress]0__0_carry_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][0]_i_1 
       (.I0(clearModeAddress_reg[0]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PosX[1]),
        .O(\depthPipeline[0][pixelAddress][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][10]_i_1 
       (.I0(clearModeAddress_reg[10]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry_n_10 ),
        .O(\depthPipeline[0][pixelAddress][10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][11]_i_1 
       (.I0(clearModeAddress_reg[11]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry_n_9 ),
        .O(\depthPipeline[0][pixelAddress][11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][12]_i_1 
       (.I0(clearModeAddress_reg[12]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry_n_8 ),
        .O(\depthPipeline[0][pixelAddress][12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][13]_i_1 
       (.I0(clearModeAddress_reg[13]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry__0_n_15 ),
        .O(\depthPipeline[0][pixelAddress][13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][14]_i_1 
       (.I0(clearModeAddress_reg[14]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry__0_n_14 ),
        .O(\depthPipeline[0][pixelAddress][14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][15]_i_1 
       (.I0(clearModeAddress_reg[15]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry__0_n_13 ),
        .O(\depthPipeline[0][pixelAddress][15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][16]_i_1 
       (.I0(clearModeAddress_reg[16]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry__0_n_12 ),
        .O(\depthPipeline[0][pixelAddress][16]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \depthPipeline[0][pixelAddress][17]_i_1 
       (.I0(clearModeEnable_reg_n_0),
        .I1(RAST_PixelReady),
        .O(\depthPipeline[0][pixelAddress] ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][17]_i_2 
       (.I0(clearModeAddress_reg[17]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry__0_n_11 ),
        .O(\depthPipeline[0][pixelAddress][17]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][1]_i_1 
       (.I0(clearModeAddress_reg[1]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PosX[2]),
        .O(\depthPipeline[0][pixelAddress][1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][2]_i_1 
       (.I0(clearModeAddress_reg[2]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PosX[3]),
        .O(\depthPipeline[0][pixelAddress][2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][3]_i_1 
       (.I0(clearModeAddress_reg[3]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PosX[4]),
        .O(\depthPipeline[0][pixelAddress][3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][4]_i_1 
       (.I0(clearModeAddress_reg[4]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PosX[5]),
        .O(\depthPipeline[0][pixelAddress][4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][5]_i_1 
       (.I0(clearModeAddress_reg[5]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry_n_15 ),
        .O(\depthPipeline[0][pixelAddress][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][6]_i_1 
       (.I0(clearModeAddress_reg[6]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry_n_14 ),
        .O(\depthPipeline[0][pixelAddress][6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][7]_i_1 
       (.I0(clearModeAddress_reg[7]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry_n_13 ),
        .O(\depthPipeline[0][pixelAddress][7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][8]_i_1 
       (.I0(clearModeAddress_reg[8]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry_n_12 ),
        .O(\depthPipeline[0][pixelAddress][8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \depthPipeline[0][pixelAddress][9]_i_1 
       (.I0(clearModeAddress_reg[9]),
        .I1(clearModeEnable_reg_n_0),
        .I2(\depthPipeline[0][pixelAddress]0__0_carry_n_11 ),
        .O(\depthPipeline[0][pixelAddress][9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][isOddAddress] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][isOddAddress] ),
        .Q(\depthPipeline_reg[0][isOddAddress]__0 ),
        .R(clearModeEnable_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][0] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][0]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [0]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][10] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][10]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [10]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][11] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][11]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [11]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][12] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][12]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [12]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][13] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][13]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [13]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][14] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][14]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [14]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][15] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][15]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [15]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][16] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][16]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [16]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][17] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][17]_i_2_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [17]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][1] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][1]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [1]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][2] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][2]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [2]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][3] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][3]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [3]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][4] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][4]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [4]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][5] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][5]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [5]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][6] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][6]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [6]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][7] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][7]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [7]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][8] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][8]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [8]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelAddress][9] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline[0][pixelAddress][9]_i_1_n_0 ),
        .Q(\depthPipeline_reg[0][pixelAddress] [9]),
        .R(\depthPipeline[0][pixelAddress] ));
  FDSE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[0][pixelEnabled] 
       (.C(clk),
        .CE(1'b1),
        .D(RAST_PixelReady),
        .Q(\depthPipeline_reg[0][pixelEnabled]__0 ),
        .S(clearModeEnable_reg_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[1][pixelEnabled] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[0][pixelEnabled]__0 ),
        .Q(\depthPipeline_reg[1][pixelEnabled]__0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[2][pixelEnabled] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[1][pixelEnabled]__0 ),
        .Q(\depthPipeline_reg[2][pixelEnabled]__0 ),
        .R(1'b0));
  (* srl_bus_name = "\U0/depthPipeline_reg[3] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][isOddAddress]_srl3 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][isOddAddress]_srl3 
       (.A0(1'b0),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][isOddAddress]__0 ),
        .Q(\depthPipeline_reg[3][isOddAddress]_srl3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[3][pixelEnabled] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[2][pixelEnabled]__0 ),
        .Q(\depthPipeline_reg[3][pixelEnabled]__0 ),
        .R(1'b0));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][0]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][0]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][0]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][0]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][0]_srl4_i_1 
       (.I0(clearDepthValue[0]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[0]),
        .O(\depthPipeline_reg[3][pixelTestDepth][0]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][10]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][10]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][10]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][10]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][10]_srl4_i_1 
       (.I0(clearDepthValue[10]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[10]),
        .O(\depthPipeline_reg[3][pixelTestDepth][10]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][11]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][11]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][11]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][11]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][11]_srl4_i_1 
       (.I0(clearDepthValue[11]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[11]),
        .O(\depthPipeline_reg[3][pixelTestDepth][11]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][12]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][12]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][12]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][12]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][12]_srl4_i_1 
       (.I0(clearDepthValue[12]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[12]),
        .O(\depthPipeline_reg[3][pixelTestDepth][12]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][13]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][13]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][13]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][13]_srl4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][13]_srl4_i_1 
       (.I0(clearDepthValue[13]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[13]),
        .O(\depthPipeline_reg[3][pixelTestDepth][13]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][14]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][14]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][14]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][14]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][14]_srl4_i_1 
       (.I0(clearDepthValue[14]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[14]),
        .O(\depthPipeline_reg[3][pixelTestDepth][14]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][15]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][15]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][15]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][15]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][15]_srl4_i_1 
       (.I0(clearDepthValue[15]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[15]),
        .O(\depthPipeline_reg[3][pixelTestDepth][15]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][16]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][16]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][16]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][16]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][16]_srl4_i_1 
       (.I0(clearDepthValue[16]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[16]),
        .O(\depthPipeline_reg[3][pixelTestDepth][16]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][17]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][17]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][17]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][17]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][17]_srl4_i_1 
       (.I0(clearDepthValue[17]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[17]),
        .O(\depthPipeline_reg[3][pixelTestDepth][17]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][18]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][18]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][18]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][18]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][18]_srl4_i_1 
       (.I0(clearDepthValue[18]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[18]),
        .O(\depthPipeline_reg[3][pixelTestDepth][18]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][19]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][19]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][19]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][19]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][19]_srl4_i_1 
       (.I0(clearDepthValue[19]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[19]),
        .O(\depthPipeline_reg[3][pixelTestDepth][19]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][1]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][1]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][1]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][1]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][1]_srl4_i_1 
       (.I0(clearDepthValue[1]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[1]),
        .O(\depthPipeline_reg[3][pixelTestDepth][1]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][20]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][20]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][20]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][20]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][20]_srl4_i_1 
       (.I0(clearDepthValue[20]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[20]),
        .O(\depthPipeline_reg[3][pixelTestDepth][20]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][21]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][21]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][21]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][21]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][21]_srl4_i_1 
       (.I0(clearDepthValue[21]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[21]),
        .O(\depthPipeline_reg[3][pixelTestDepth][21]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][22]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][22]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][22]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][22]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][22]_srl4_i_1 
       (.I0(clearDepthValue[22]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[22]),
        .O(\depthPipeline_reg[3][pixelTestDepth][22]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][23]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][23]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][23]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][23]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][23]_srl4_i_1 
       (.I0(clearDepthValue[23]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[23]),
        .O(\depthPipeline_reg[3][pixelTestDepth][23]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][2]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][2]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][2]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][2]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][2]_srl4_i_1 
       (.I0(clearDepthValue[2]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[2]),
        .O(\depthPipeline_reg[3][pixelTestDepth][2]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][3]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][3]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][3]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][3]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][3]_srl4_i_1 
       (.I0(clearDepthValue[3]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[3]),
        .O(\depthPipeline_reg[3][pixelTestDepth][3]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][4]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][4]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][4]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][4]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][4]_srl4_i_1 
       (.I0(clearDepthValue[4]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[4]),
        .O(\depthPipeline_reg[3][pixelTestDepth][4]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][5]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][5]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][5]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][5]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][5]_srl4_i_1 
       (.I0(clearDepthValue[5]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[5]),
        .O(\depthPipeline_reg[3][pixelTestDepth][5]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][6]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][6]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][6]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][6]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][6]_srl4_i_1 
       (.I0(clearDepthValue[6]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[6]),
        .O(\depthPipeline_reg[3][pixelTestDepth][6]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][7]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][7]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][7]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][7]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][7]_srl4_i_1 
       (.I0(clearDepthValue[7]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[7]),
        .O(\depthPipeline_reg[3][pixelTestDepth][7]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][8]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][8]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][8]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][8]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][8]_srl4_i_1 
       (.I0(clearDepthValue[8]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[8]),
        .O(\depthPipeline_reg[3][pixelTestDepth][8]_srl4_i_1_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[3][pixelTestDepth] " *) 
  (* srl_name = "\U0/depthPipeline_reg[3][pixelTestDepth][9]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[3][pixelTestDepth][9]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[3][pixelTestDepth][9]_srl4_i_1_n_0 ),
        .Q(\depthPipeline_reg[3][pixelTestDepth][9]_srl4_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \depthPipeline_reg[3][pixelTestDepth][9]_srl4_i_1 
       (.I0(clearDepthValue[9]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_PixelReady),
        .I3(RAST_InPixelDepth[9]),
        .O(\depthPipeline_reg[3][pixelTestDepth][9]_srl4_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][isOddAddress] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][isOddAddress]_srl3_n_0 ),
        .Q(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .R(1'b0));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][0]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][0]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [0]),
        .Q(\depthPipeline_reg[4][pixelAddress][0]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][10]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][10]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [10]),
        .Q(\depthPipeline_reg[4][pixelAddress][10]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][11]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][11]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [11]),
        .Q(\depthPipeline_reg[4][pixelAddress][11]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][12]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][12]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [12]),
        .Q(\depthPipeline_reg[4][pixelAddress][12]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][13]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][13]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [13]),
        .Q(\depthPipeline_reg[4][pixelAddress][13]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][14]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][14]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [14]),
        .Q(\depthPipeline_reg[4][pixelAddress][14]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][15]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][15]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [15]),
        .Q(\depthPipeline_reg[4][pixelAddress][15]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][16]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][16]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [16]),
        .Q(\depthPipeline_reg[4][pixelAddress][16]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][17]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][17]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [17]),
        .Q(\depthPipeline_reg[4][pixelAddress][17]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][1]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][1]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [1]),
        .Q(\depthPipeline_reg[4][pixelAddress][1]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][2]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][2]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [2]),
        .Q(\depthPipeline_reg[4][pixelAddress][2]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][3]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][3]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [3]),
        .Q(\depthPipeline_reg[4][pixelAddress][3]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][4]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][4]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [4]),
        .Q(\depthPipeline_reg[4][pixelAddress][4]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][5]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][5]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [5]),
        .Q(\depthPipeline_reg[4][pixelAddress][5]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][6]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][6]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [6]),
        .Q(\depthPipeline_reg[4][pixelAddress][6]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][7]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][7]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [7]),
        .Q(\depthPipeline_reg[4][pixelAddress][7]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][8]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][8]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [8]),
        .Q(\depthPipeline_reg[4][pixelAddress][8]_srl4_n_0 ));
  (* srl_bus_name = "\U0/depthPipeline_reg[4][pixelAddress] " *) 
  (* srl_name = "\U0/depthPipeline_reg[4][pixelAddress][9]_srl4 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    \depthPipeline_reg[4][pixelAddress][9]_srl4 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\depthPipeline_reg[0][pixelAddress] [9]),
        .Q(\depthPipeline_reg[4][pixelAddress][9]_srl4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelEnabled] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelEnabled]__0 ),
        .Q(\depthPipeline_reg[4][pixelEnabled]__0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][0] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][0]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][10] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][10]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][11] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][11]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][12] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][12]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][13] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][13]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][14] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][14]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][15] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][15]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][16] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][16]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][17] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][17]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][18] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][18]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][19] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][19]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][1] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][1]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][20] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][20]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][21] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][21]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][22] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][22]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][23] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][23]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][2] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][2]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][3] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][3]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][4] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][4]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][5] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][5]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][6] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][6]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][7] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][7]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][8] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][8]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \depthPipeline_reg[4][pixelTestDepth][9] 
       (.C(clk),
        .CE(1'b1),
        .D(\depthPipeline_reg[3][pixelTestDepth][9]_srl4_n_0 ),
        .Q(\depthPipeline_reg[4][pixelTestDepth] [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    depthWriteEnable_i_1
       (.I0(clearSaveDepthWriteEnable_reg_n_0),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_DepthWriteEnable),
        .I3(RAST_SetDepthParams),
        .I4(CMD_ClearDepthBuffer),
        .O(depthWriteEnable_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    depthWriteEnable_reg
       (.C(clk),
        .CE(stencilWriteMask),
        .D(depthWriteEnable_i_1_n_0),
        .Q(depthWriteEnable),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_1
       (.I0(i__carry_i_9_n_0),
        .I1(URAM_doutb[53]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[21]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [21]),
        .O(i__carry_i_1_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_10
       (.I0(DepthTest0_carry__0_i_15_n_0),
        .I1(URAM_doutb[50]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[18]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [18]),
        .O(i__carry_i_10_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    i__carry_i_11
       (.I0(DepthTest0_carry__0_i_16_n_0),
        .I1(URAM_doutb[48]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[16]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [16]),
        .O(i__carry_i_11_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_12
       (.I0(DepthTest0_carry_i_26_n_0),
        .I1(URAM_doutb[44]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[12]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [12]),
        .O(i__carry_i_12_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    i__carry_i_13
       (.I0(DepthTest0_carry_i_27_n_0),
        .I1(URAM_doutb[42]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[10]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [10]),
        .O(i__carry_i_13_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_14
       (.I0(DepthTest0_carry_i_29_n_0),
        .I1(URAM_doutb[38]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[6]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [6]),
        .O(i__carry_i_14_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    i__carry_i_15
       (.I0(DepthTest0_carry_i_30_n_0),
        .I1(URAM_doutb[36]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[4]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [4]),
        .O(i__carry_i_15_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_16
       (.I0(DepthTest0_carry_i_32_n_0),
        .I1(URAM_doutb[32]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[0]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [0]),
        .O(i__carry_i_16_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_2
       (.I0(i__carry_i_10_n_0),
        .I1(URAM_doutb[52]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[20]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [20]),
        .O(i__carry_i_2_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_3
       (.I0(i__carry_i_11_n_0),
        .I1(URAM_doutb[47]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[15]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [15]),
        .O(i__carry_i_3_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_4
       (.I0(i__carry_i_12_n_0),
        .I1(URAM_doutb[46]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[14]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [14]),
        .O(i__carry_i_4_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_5
       (.I0(i__carry_i_13_n_0),
        .I1(URAM_doutb[41]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[9]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [9]),
        .O(i__carry_i_5_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_6
       (.I0(i__carry_i_14_n_0),
        .I1(URAM_doutb[40]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[8]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [8]),
        .O(i__carry_i_6_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_7
       (.I0(i__carry_i_15_n_0),
        .I1(URAM_doutb[35]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[3]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [3]),
        .O(i__carry_i_7_n_0));
  LUT5 #(
    .INIT(32'h8A80202A)) 
    i__carry_i_8
       (.I0(i__carry_i_16_n_0),
        .I1(URAM_doutb[34]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[2]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [2]),
        .O(i__carry_i_8_n_0));
  LUT5 #(
    .INIT(32'h45401015)) 
    i__carry_i_9
       (.I0(DepthTest0_carry__0_i_13_n_0),
        .I1(URAM_doutb[54]),
        .I2(\depthPipeline_reg[4][isOddAddress_n_0_] ),
        .I3(URAM_doutb[22]),
        .I4(\depthPipeline_reg[4][pixelTestDepth] [22]),
        .O(i__carry_i_9_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \pixelsFailedDepthTest[7]_i_2 
       (.I0(STAT_PixelsFailedDepthTest[0]),
        .O(\pixelsFailedDepthTest[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[0] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[7]_i_1_n_15 ),
        .Q(STAT_PixelsFailedDepthTest[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[10] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[15]_i_1_n_13 ),
        .Q(STAT_PixelsFailedDepthTest[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[11] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[15]_i_1_n_12 ),
        .Q(STAT_PixelsFailedDepthTest[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[12] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[15]_i_1_n_11 ),
        .Q(STAT_PixelsFailedDepthTest[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[13] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[15]_i_1_n_10 ),
        .Q(STAT_PixelsFailedDepthTest[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[14] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[15]_i_1_n_9 ),
        .Q(STAT_PixelsFailedDepthTest[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[15] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[15]_i_1_n_8 ),
        .Q(STAT_PixelsFailedDepthTest[15]),
        .R(1'b0));
  CARRY8 \pixelsFailedDepthTest_reg[15]_i_1 
       (.CI(\pixelsFailedDepthTest_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\pixelsFailedDepthTest_reg[15]_i_1_n_0 ,\pixelsFailedDepthTest_reg[15]_i_1_n_1 ,\pixelsFailedDepthTest_reg[15]_i_1_n_2 ,\pixelsFailedDepthTest_reg[15]_i_1_n_3 ,\NLW_pixelsFailedDepthTest_reg[15]_i_1_CO_UNCONNECTED [3],\pixelsFailedDepthTest_reg[15]_i_1_n_5 ,\pixelsFailedDepthTest_reg[15]_i_1_n_6 ,\pixelsFailedDepthTest_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\pixelsFailedDepthTest_reg[15]_i_1_n_8 ,\pixelsFailedDepthTest_reg[15]_i_1_n_9 ,\pixelsFailedDepthTest_reg[15]_i_1_n_10 ,\pixelsFailedDepthTest_reg[15]_i_1_n_11 ,\pixelsFailedDepthTest_reg[15]_i_1_n_12 ,\pixelsFailedDepthTest_reg[15]_i_1_n_13 ,\pixelsFailedDepthTest_reg[15]_i_1_n_14 ,\pixelsFailedDepthTest_reg[15]_i_1_n_15 }),
        .S(STAT_PixelsFailedDepthTest[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[16] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[23]_i_1_n_15 ),
        .Q(STAT_PixelsFailedDepthTest[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[17] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[23]_i_1_n_14 ),
        .Q(STAT_PixelsFailedDepthTest[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[18] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[23]_i_1_n_13 ),
        .Q(STAT_PixelsFailedDepthTest[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[19] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[23]_i_1_n_12 ),
        .Q(STAT_PixelsFailedDepthTest[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[1] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[7]_i_1_n_14 ),
        .Q(STAT_PixelsFailedDepthTest[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[20] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[23]_i_1_n_11 ),
        .Q(STAT_PixelsFailedDepthTest[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[21] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[23]_i_1_n_10 ),
        .Q(STAT_PixelsFailedDepthTest[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[22] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[23]_i_1_n_9 ),
        .Q(STAT_PixelsFailedDepthTest[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[23] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[23]_i_1_n_8 ),
        .Q(STAT_PixelsFailedDepthTest[23]),
        .R(1'b0));
  CARRY8 \pixelsFailedDepthTest_reg[23]_i_1 
       (.CI(\pixelsFailedDepthTest_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\pixelsFailedDepthTest_reg[23]_i_1_n_0 ,\pixelsFailedDepthTest_reg[23]_i_1_n_1 ,\pixelsFailedDepthTest_reg[23]_i_1_n_2 ,\pixelsFailedDepthTest_reg[23]_i_1_n_3 ,\NLW_pixelsFailedDepthTest_reg[23]_i_1_CO_UNCONNECTED [3],\pixelsFailedDepthTest_reg[23]_i_1_n_5 ,\pixelsFailedDepthTest_reg[23]_i_1_n_6 ,\pixelsFailedDepthTest_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\pixelsFailedDepthTest_reg[23]_i_1_n_8 ,\pixelsFailedDepthTest_reg[23]_i_1_n_9 ,\pixelsFailedDepthTest_reg[23]_i_1_n_10 ,\pixelsFailedDepthTest_reg[23]_i_1_n_11 ,\pixelsFailedDepthTest_reg[23]_i_1_n_12 ,\pixelsFailedDepthTest_reg[23]_i_1_n_13 ,\pixelsFailedDepthTest_reg[23]_i_1_n_14 ,\pixelsFailedDepthTest_reg[23]_i_1_n_15 }),
        .S(STAT_PixelsFailedDepthTest[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[24] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[31]_i_1_n_15 ),
        .Q(STAT_PixelsFailedDepthTest[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[25] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[31]_i_1_n_14 ),
        .Q(STAT_PixelsFailedDepthTest[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[26] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[31]_i_1_n_13 ),
        .Q(STAT_PixelsFailedDepthTest[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[27] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[31]_i_1_n_12 ),
        .Q(STAT_PixelsFailedDepthTest[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[28] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[31]_i_1_n_11 ),
        .Q(STAT_PixelsFailedDepthTest[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[29] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[31]_i_1_n_10 ),
        .Q(STAT_PixelsFailedDepthTest[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[2] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[7]_i_1_n_13 ),
        .Q(STAT_PixelsFailedDepthTest[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[30] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[31]_i_1_n_9 ),
        .Q(STAT_PixelsFailedDepthTest[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[31] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[31]_i_1_n_8 ),
        .Q(STAT_PixelsFailedDepthTest[31]),
        .R(1'b0));
  CARRY8 \pixelsFailedDepthTest_reg[31]_i_1 
       (.CI(\pixelsFailedDepthTest_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_pixelsFailedDepthTest_reg[31]_i_1_CO_UNCONNECTED [7],\pixelsFailedDepthTest_reg[31]_i_1_n_1 ,\pixelsFailedDepthTest_reg[31]_i_1_n_2 ,\pixelsFailedDepthTest_reg[31]_i_1_n_3 ,\NLW_pixelsFailedDepthTest_reg[31]_i_1_CO_UNCONNECTED [3],\pixelsFailedDepthTest_reg[31]_i_1_n_5 ,\pixelsFailedDepthTest_reg[31]_i_1_n_6 ,\pixelsFailedDepthTest_reg[31]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\pixelsFailedDepthTest_reg[31]_i_1_n_8 ,\pixelsFailedDepthTest_reg[31]_i_1_n_9 ,\pixelsFailedDepthTest_reg[31]_i_1_n_10 ,\pixelsFailedDepthTest_reg[31]_i_1_n_11 ,\pixelsFailedDepthTest_reg[31]_i_1_n_12 ,\pixelsFailedDepthTest_reg[31]_i_1_n_13 ,\pixelsFailedDepthTest_reg[31]_i_1_n_14 ,\pixelsFailedDepthTest_reg[31]_i_1_n_15 }),
        .S(STAT_PixelsFailedDepthTest[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[3] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[7]_i_1_n_12 ),
        .Q(STAT_PixelsFailedDepthTest[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[4] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[7]_i_1_n_11 ),
        .Q(STAT_PixelsFailedDepthTest[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[5] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[7]_i_1_n_10 ),
        .Q(STAT_PixelsFailedDepthTest[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[6] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[7]_i_1_n_9 ),
        .Q(STAT_PixelsFailedDepthTest[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[7] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[7]_i_1_n_8 ),
        .Q(STAT_PixelsFailedDepthTest[7]),
        .R(1'b0));
  CARRY8 \pixelsFailedDepthTest_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\pixelsFailedDepthTest_reg[7]_i_1_n_0 ,\pixelsFailedDepthTest_reg[7]_i_1_n_1 ,\pixelsFailedDepthTest_reg[7]_i_1_n_2 ,\pixelsFailedDepthTest_reg[7]_i_1_n_3 ,\NLW_pixelsFailedDepthTest_reg[7]_i_1_CO_UNCONNECTED [3],\pixelsFailedDepthTest_reg[7]_i_1_n_5 ,\pixelsFailedDepthTest_reg[7]_i_1_n_6 ,\pixelsFailedDepthTest_reg[7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\pixelsFailedDepthTest_reg[7]_i_1_n_8 ,\pixelsFailedDepthTest_reg[7]_i_1_n_9 ,\pixelsFailedDepthTest_reg[7]_i_1_n_10 ,\pixelsFailedDepthTest_reg[7]_i_1_n_11 ,\pixelsFailedDepthTest_reg[7]_i_1_n_12 ,\pixelsFailedDepthTest_reg[7]_i_1_n_13 ,\pixelsFailedDepthTest_reg[7]_i_1_n_14 ,\pixelsFailedDepthTest_reg[7]_i_1_n_15 }),
        .S({STAT_PixelsFailedDepthTest[7:1],\pixelsFailedDepthTest[7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[8] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[15]_i_1_n_15 ),
        .Q(STAT_PixelsFailedDepthTest[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedDepthTest_reg[9] 
       (.C(clk),
        .CE(RAST_PixelFailedDepthTest_i_1_n_0),
        .D(\pixelsFailedDepthTest_reg[15]_i_1_n_14 ),
        .Q(STAT_PixelsFailedDepthTest[9]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \pixelsFailedStencilTest[7]_i_2 
       (.I0(STAT_PixelsFailedStencilTest[0]),
        .O(\pixelsFailedStencilTest[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[0] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[7]_i_1_n_15 ),
        .Q(STAT_PixelsFailedStencilTest[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[10] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[15]_i_1_n_13 ),
        .Q(STAT_PixelsFailedStencilTest[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[11] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[15]_i_1_n_12 ),
        .Q(STAT_PixelsFailedStencilTest[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[12] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[15]_i_1_n_11 ),
        .Q(STAT_PixelsFailedStencilTest[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[13] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[15]_i_1_n_10 ),
        .Q(STAT_PixelsFailedStencilTest[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[14] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[15]_i_1_n_9 ),
        .Q(STAT_PixelsFailedStencilTest[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[15] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[15]_i_1_n_8 ),
        .Q(STAT_PixelsFailedStencilTest[15]),
        .R(1'b0));
  CARRY8 \pixelsFailedStencilTest_reg[15]_i_1 
       (.CI(\pixelsFailedStencilTest_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\pixelsFailedStencilTest_reg[15]_i_1_n_0 ,\pixelsFailedStencilTest_reg[15]_i_1_n_1 ,\pixelsFailedStencilTest_reg[15]_i_1_n_2 ,\pixelsFailedStencilTest_reg[15]_i_1_n_3 ,\NLW_pixelsFailedStencilTest_reg[15]_i_1_CO_UNCONNECTED [3],\pixelsFailedStencilTest_reg[15]_i_1_n_5 ,\pixelsFailedStencilTest_reg[15]_i_1_n_6 ,\pixelsFailedStencilTest_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\pixelsFailedStencilTest_reg[15]_i_1_n_8 ,\pixelsFailedStencilTest_reg[15]_i_1_n_9 ,\pixelsFailedStencilTest_reg[15]_i_1_n_10 ,\pixelsFailedStencilTest_reg[15]_i_1_n_11 ,\pixelsFailedStencilTest_reg[15]_i_1_n_12 ,\pixelsFailedStencilTest_reg[15]_i_1_n_13 ,\pixelsFailedStencilTest_reg[15]_i_1_n_14 ,\pixelsFailedStencilTest_reg[15]_i_1_n_15 }),
        .S(STAT_PixelsFailedStencilTest[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[16] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[23]_i_1_n_15 ),
        .Q(STAT_PixelsFailedStencilTest[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[17] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[23]_i_1_n_14 ),
        .Q(STAT_PixelsFailedStencilTest[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[18] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[23]_i_1_n_13 ),
        .Q(STAT_PixelsFailedStencilTest[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[19] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[23]_i_1_n_12 ),
        .Q(STAT_PixelsFailedStencilTest[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[1] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[7]_i_1_n_14 ),
        .Q(STAT_PixelsFailedStencilTest[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[20] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[23]_i_1_n_11 ),
        .Q(STAT_PixelsFailedStencilTest[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[21] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[23]_i_1_n_10 ),
        .Q(STAT_PixelsFailedStencilTest[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[22] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[23]_i_1_n_9 ),
        .Q(STAT_PixelsFailedStencilTest[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[23] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[23]_i_1_n_8 ),
        .Q(STAT_PixelsFailedStencilTest[23]),
        .R(1'b0));
  CARRY8 \pixelsFailedStencilTest_reg[23]_i_1 
       (.CI(\pixelsFailedStencilTest_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\pixelsFailedStencilTest_reg[23]_i_1_n_0 ,\pixelsFailedStencilTest_reg[23]_i_1_n_1 ,\pixelsFailedStencilTest_reg[23]_i_1_n_2 ,\pixelsFailedStencilTest_reg[23]_i_1_n_3 ,\NLW_pixelsFailedStencilTest_reg[23]_i_1_CO_UNCONNECTED [3],\pixelsFailedStencilTest_reg[23]_i_1_n_5 ,\pixelsFailedStencilTest_reg[23]_i_1_n_6 ,\pixelsFailedStencilTest_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\pixelsFailedStencilTest_reg[23]_i_1_n_8 ,\pixelsFailedStencilTest_reg[23]_i_1_n_9 ,\pixelsFailedStencilTest_reg[23]_i_1_n_10 ,\pixelsFailedStencilTest_reg[23]_i_1_n_11 ,\pixelsFailedStencilTest_reg[23]_i_1_n_12 ,\pixelsFailedStencilTest_reg[23]_i_1_n_13 ,\pixelsFailedStencilTest_reg[23]_i_1_n_14 ,\pixelsFailedStencilTest_reg[23]_i_1_n_15 }),
        .S(STAT_PixelsFailedStencilTest[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[24] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[31]_i_1_n_15 ),
        .Q(STAT_PixelsFailedStencilTest[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[25] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[31]_i_1_n_14 ),
        .Q(STAT_PixelsFailedStencilTest[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[26] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[31]_i_1_n_13 ),
        .Q(STAT_PixelsFailedStencilTest[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[27] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[31]_i_1_n_12 ),
        .Q(STAT_PixelsFailedStencilTest[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[28] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[31]_i_1_n_11 ),
        .Q(STAT_PixelsFailedStencilTest[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[29] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[31]_i_1_n_10 ),
        .Q(STAT_PixelsFailedStencilTest[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[2] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[7]_i_1_n_13 ),
        .Q(STAT_PixelsFailedStencilTest[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[30] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[31]_i_1_n_9 ),
        .Q(STAT_PixelsFailedStencilTest[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[31] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[31]_i_1_n_8 ),
        .Q(STAT_PixelsFailedStencilTest[31]),
        .R(1'b0));
  CARRY8 \pixelsFailedStencilTest_reg[31]_i_1 
       (.CI(\pixelsFailedStencilTest_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_pixelsFailedStencilTest_reg[31]_i_1_CO_UNCONNECTED [7],\pixelsFailedStencilTest_reg[31]_i_1_n_1 ,\pixelsFailedStencilTest_reg[31]_i_1_n_2 ,\pixelsFailedStencilTest_reg[31]_i_1_n_3 ,\NLW_pixelsFailedStencilTest_reg[31]_i_1_CO_UNCONNECTED [3],\pixelsFailedStencilTest_reg[31]_i_1_n_5 ,\pixelsFailedStencilTest_reg[31]_i_1_n_6 ,\pixelsFailedStencilTest_reg[31]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\pixelsFailedStencilTest_reg[31]_i_1_n_8 ,\pixelsFailedStencilTest_reg[31]_i_1_n_9 ,\pixelsFailedStencilTest_reg[31]_i_1_n_10 ,\pixelsFailedStencilTest_reg[31]_i_1_n_11 ,\pixelsFailedStencilTest_reg[31]_i_1_n_12 ,\pixelsFailedStencilTest_reg[31]_i_1_n_13 ,\pixelsFailedStencilTest_reg[31]_i_1_n_14 ,\pixelsFailedStencilTest_reg[31]_i_1_n_15 }),
        .S(STAT_PixelsFailedStencilTest[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[3] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[7]_i_1_n_12 ),
        .Q(STAT_PixelsFailedStencilTest[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[4] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[7]_i_1_n_11 ),
        .Q(STAT_PixelsFailedStencilTest[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[5] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[7]_i_1_n_10 ),
        .Q(STAT_PixelsFailedStencilTest[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[6] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[7]_i_1_n_9 ),
        .Q(STAT_PixelsFailedStencilTest[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[7] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[7]_i_1_n_8 ),
        .Q(STAT_PixelsFailedStencilTest[7]),
        .R(1'b0));
  CARRY8 \pixelsFailedStencilTest_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\pixelsFailedStencilTest_reg[7]_i_1_n_0 ,\pixelsFailedStencilTest_reg[7]_i_1_n_1 ,\pixelsFailedStencilTest_reg[7]_i_1_n_2 ,\pixelsFailedStencilTest_reg[7]_i_1_n_3 ,\NLW_pixelsFailedStencilTest_reg[7]_i_1_CO_UNCONNECTED [3],\pixelsFailedStencilTest_reg[7]_i_1_n_5 ,\pixelsFailedStencilTest_reg[7]_i_1_n_6 ,\pixelsFailedStencilTest_reg[7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\pixelsFailedStencilTest_reg[7]_i_1_n_8 ,\pixelsFailedStencilTest_reg[7]_i_1_n_9 ,\pixelsFailedStencilTest_reg[7]_i_1_n_10 ,\pixelsFailedStencilTest_reg[7]_i_1_n_11 ,\pixelsFailedStencilTest_reg[7]_i_1_n_12 ,\pixelsFailedStencilTest_reg[7]_i_1_n_13 ,\pixelsFailedStencilTest_reg[7]_i_1_n_14 ,\pixelsFailedStencilTest_reg[7]_i_1_n_15 }),
        .S({STAT_PixelsFailedStencilTest[7:1],\pixelsFailedStencilTest[7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[8] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[15]_i_1_n_15 ),
        .Q(STAT_PixelsFailedStencilTest[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsFailedStencilTest_reg[9] 
       (.C(clk),
        .CE(RAST_PixelFailedStencilTest_i_1_n_0),
        .D(\pixelsFailedStencilTest_reg[15]_i_1_n_14 ),
        .Q(STAT_PixelsFailedStencilTest[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \pixelsPassedDepthStencilTest[31]_i_1 
       (.I0(RAST_PixelPassedDepthStencilTest_i_1_n_0),
        .I1(clearModeEnable_reg_n_0),
        .O(pixelsPassedDepthStencilTest));
  LUT1 #(
    .INIT(2'h1)) 
    \pixelsPassedDepthStencilTest[7]_i_2 
       (.I0(STAT_PixelsPassedDepthStencilTest[0]),
        .O(\pixelsPassedDepthStencilTest[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[0] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[7]_i_1_n_15 ),
        .Q(STAT_PixelsPassedDepthStencilTest[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[10] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[15]_i_1_n_13 ),
        .Q(STAT_PixelsPassedDepthStencilTest[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[11] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[15]_i_1_n_12 ),
        .Q(STAT_PixelsPassedDepthStencilTest[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[12] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[15]_i_1_n_11 ),
        .Q(STAT_PixelsPassedDepthStencilTest[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[13] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[15]_i_1_n_10 ),
        .Q(STAT_PixelsPassedDepthStencilTest[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[14] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[15]_i_1_n_9 ),
        .Q(STAT_PixelsPassedDepthStencilTest[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[15] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[15]_i_1_n_8 ),
        .Q(STAT_PixelsPassedDepthStencilTest[15]),
        .R(1'b0));
  CARRY8 \pixelsPassedDepthStencilTest_reg[15]_i_1 
       (.CI(\pixelsPassedDepthStencilTest_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\pixelsPassedDepthStencilTest_reg[15]_i_1_n_0 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_1 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_2 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_3 ,\NLW_pixelsPassedDepthStencilTest_reg[15]_i_1_CO_UNCONNECTED [3],\pixelsPassedDepthStencilTest_reg[15]_i_1_n_5 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_6 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\pixelsPassedDepthStencilTest_reg[15]_i_1_n_8 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_9 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_10 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_11 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_12 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_13 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_14 ,\pixelsPassedDepthStencilTest_reg[15]_i_1_n_15 }),
        .S(STAT_PixelsPassedDepthStencilTest[15:8]));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[16] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[23]_i_1_n_15 ),
        .Q(STAT_PixelsPassedDepthStencilTest[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[17] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[23]_i_1_n_14 ),
        .Q(STAT_PixelsPassedDepthStencilTest[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[18] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[23]_i_1_n_13 ),
        .Q(STAT_PixelsPassedDepthStencilTest[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[19] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[23]_i_1_n_12 ),
        .Q(STAT_PixelsPassedDepthStencilTest[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[1] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[7]_i_1_n_14 ),
        .Q(STAT_PixelsPassedDepthStencilTest[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[20] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[23]_i_1_n_11 ),
        .Q(STAT_PixelsPassedDepthStencilTest[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[21] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[23]_i_1_n_10 ),
        .Q(STAT_PixelsPassedDepthStencilTest[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[22] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[23]_i_1_n_9 ),
        .Q(STAT_PixelsPassedDepthStencilTest[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[23] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[23]_i_1_n_8 ),
        .Q(STAT_PixelsPassedDepthStencilTest[23]),
        .R(1'b0));
  CARRY8 \pixelsPassedDepthStencilTest_reg[23]_i_1 
       (.CI(\pixelsPassedDepthStencilTest_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\pixelsPassedDepthStencilTest_reg[23]_i_1_n_0 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_1 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_2 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_3 ,\NLW_pixelsPassedDepthStencilTest_reg[23]_i_1_CO_UNCONNECTED [3],\pixelsPassedDepthStencilTest_reg[23]_i_1_n_5 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_6 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\pixelsPassedDepthStencilTest_reg[23]_i_1_n_8 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_9 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_10 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_11 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_12 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_13 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_14 ,\pixelsPassedDepthStencilTest_reg[23]_i_1_n_15 }),
        .S(STAT_PixelsPassedDepthStencilTest[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[24] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[31]_i_2_n_15 ),
        .Q(STAT_PixelsPassedDepthStencilTest[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[25] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[31]_i_2_n_14 ),
        .Q(STAT_PixelsPassedDepthStencilTest[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[26] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[31]_i_2_n_13 ),
        .Q(STAT_PixelsPassedDepthStencilTest[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[27] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[31]_i_2_n_12 ),
        .Q(STAT_PixelsPassedDepthStencilTest[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[28] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[31]_i_2_n_11 ),
        .Q(STAT_PixelsPassedDepthStencilTest[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[29] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[31]_i_2_n_10 ),
        .Q(STAT_PixelsPassedDepthStencilTest[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[2] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[7]_i_1_n_13 ),
        .Q(STAT_PixelsPassedDepthStencilTest[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[30] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[31]_i_2_n_9 ),
        .Q(STAT_PixelsPassedDepthStencilTest[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[31] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[31]_i_2_n_8 ),
        .Q(STAT_PixelsPassedDepthStencilTest[31]),
        .R(1'b0));
  CARRY8 \pixelsPassedDepthStencilTest_reg[31]_i_2 
       (.CI(\pixelsPassedDepthStencilTest_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_pixelsPassedDepthStencilTest_reg[31]_i_2_CO_UNCONNECTED [7],\pixelsPassedDepthStencilTest_reg[31]_i_2_n_1 ,\pixelsPassedDepthStencilTest_reg[31]_i_2_n_2 ,\pixelsPassedDepthStencilTest_reg[31]_i_2_n_3 ,\NLW_pixelsPassedDepthStencilTest_reg[31]_i_2_CO_UNCONNECTED [3],\pixelsPassedDepthStencilTest_reg[31]_i_2_n_5 ,\pixelsPassedDepthStencilTest_reg[31]_i_2_n_6 ,\pixelsPassedDepthStencilTest_reg[31]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\pixelsPassedDepthStencilTest_reg[31]_i_2_n_8 ,\pixelsPassedDepthStencilTest_reg[31]_i_2_n_9 ,\pixelsPassedDepthStencilTest_reg[31]_i_2_n_10 ,\pixelsPassedDepthStencilTest_reg[31]_i_2_n_11 ,\pixelsPassedDepthStencilTest_reg[31]_i_2_n_12 ,\pixelsPassedDepthStencilTest_reg[31]_i_2_n_13 ,\pixelsPassedDepthStencilTest_reg[31]_i_2_n_14 ,\pixelsPassedDepthStencilTest_reg[31]_i_2_n_15 }),
        .S(STAT_PixelsPassedDepthStencilTest[31:24]));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[3] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[7]_i_1_n_12 ),
        .Q(STAT_PixelsPassedDepthStencilTest[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[4] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[7]_i_1_n_11 ),
        .Q(STAT_PixelsPassedDepthStencilTest[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[5] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[7]_i_1_n_10 ),
        .Q(STAT_PixelsPassedDepthStencilTest[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[6] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[7]_i_1_n_9 ),
        .Q(STAT_PixelsPassedDepthStencilTest[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[7] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[7]_i_1_n_8 ),
        .Q(STAT_PixelsPassedDepthStencilTest[7]),
        .R(1'b0));
  CARRY8 \pixelsPassedDepthStencilTest_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\pixelsPassedDepthStencilTest_reg[7]_i_1_n_0 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_1 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_2 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_3 ,\NLW_pixelsPassedDepthStencilTest_reg[7]_i_1_CO_UNCONNECTED [3],\pixelsPassedDepthStencilTest_reg[7]_i_1_n_5 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_6 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}),
        .O({\pixelsPassedDepthStencilTest_reg[7]_i_1_n_8 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_9 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_10 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_11 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_12 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_13 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_14 ,\pixelsPassedDepthStencilTest_reg[7]_i_1_n_15 }),
        .S({STAT_PixelsPassedDepthStencilTest[7:1],\pixelsPassedDepthStencilTest[7]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[8] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[15]_i_1_n_15 ),
        .Q(STAT_PixelsPassedDepthStencilTest[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pixelsPassedDepthStencilTest_reg[9] 
       (.C(clk),
        .CE(pixelsPassedDepthStencilTest),
        .D(\pixelsPassedDepthStencilTest_reg[15]_i_1_n_14 ),
        .Q(STAT_PixelsPassedDepthStencilTest[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilFailOp_reg[0] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilFailOp[0]),
        .Q(stencilFailOp[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilFailOp_reg[1] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilFailOp[1]),
        .Q(stencilFailOp[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilFailOp_reg[2] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilFailOp[2]),
        .Q(stencilFailOp[2]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hB888)) 
    \stencilPassOp[0]_i_1 
       (.I0(clearSaveStencilPassOp[0]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_SetDepthParams),
        .I3(RAST_StencilPassOp[0]),
        .O(\stencilPassOp[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hB8BB)) 
    \stencilPassOp[1]_i_1 
       (.I0(clearSaveStencilPassOp[1]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_StencilPassOp[1]),
        .I3(RAST_SetDepthParams),
        .O(\stencilPassOp[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hB888)) 
    \stencilPassOp[2]_i_1 
       (.I0(clearSaveStencilPassOp[2]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_SetDepthParams),
        .I3(RAST_StencilPassOp[2]),
        .O(\stencilPassOp[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \stencilPassOp_reg[0] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilPassOp[0]_i_1_n_0 ),
        .Q(\stencilPassOp_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilPassOp_reg[1] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilPassOp[1]_i_1_n_0 ),
        .Q(\stencilPassOp_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilPassOp_reg[2] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilPassOp[2]_i_1_n_0 ),
        .Q(\stencilPassOp_reg_n_0_[2] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \stencilReadMask[7]_i_1 
       (.I0(RAST_SetDepthParams),
        .I1(clearModeEnable_reg_n_0),
        .O(stencilReadMask));
  FDRE #(
    .INIT(1'b1)) 
    \stencilReadMask_reg[0] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilReadMask[0]),
        .Q(\stencilReadMask_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \stencilReadMask_reg[1] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilReadMask[1]),
        .Q(\stencilReadMask_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \stencilReadMask_reg[2] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilReadMask[2]),
        .Q(\stencilReadMask_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \stencilReadMask_reg[3] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilReadMask[3]),
        .Q(\stencilReadMask_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \stencilReadMask_reg[4] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilReadMask[4]),
        .Q(\stencilReadMask_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \stencilReadMask_reg[5] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilReadMask[5]),
        .Q(\stencilReadMask_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \stencilReadMask_reg[6] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilReadMask[6]),
        .Q(\stencilReadMask_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \stencilReadMask_reg[7] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilReadMask[7]),
        .Q(\stencilReadMask_reg_n_0_[7] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \stencilRef[0]_i_1 
       (.I0(clearSaveStencilRef[0]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_StencilRefVal[0]),
        .I3(RAST_SetDepthParams),
        .I4(CMD_ClearStencilValue[0]),
        .O(\stencilRef[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \stencilRef[1]_i_1 
       (.I0(clearSaveStencilRef[1]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_StencilRefVal[1]),
        .I3(RAST_SetDepthParams),
        .I4(CMD_ClearStencilValue[1]),
        .O(\stencilRef[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \stencilRef[2]_i_1 
       (.I0(clearSaveStencilRef[2]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_StencilRefVal[2]),
        .I3(RAST_SetDepthParams),
        .I4(CMD_ClearStencilValue[2]),
        .O(\stencilRef[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \stencilRef[3]_i_1 
       (.I0(clearSaveStencilRef[3]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_StencilRefVal[3]),
        .I3(RAST_SetDepthParams),
        .I4(CMD_ClearStencilValue[3]),
        .O(\stencilRef[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \stencilRef[4]_i_1 
       (.I0(clearSaveStencilRef[4]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_StencilRefVal[4]),
        .I3(RAST_SetDepthParams),
        .I4(CMD_ClearStencilValue[4]),
        .O(\stencilRef[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \stencilRef[5]_i_1 
       (.I0(clearSaveStencilRef[5]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_StencilRefVal[5]),
        .I3(RAST_SetDepthParams),
        .I4(CMD_ClearStencilValue[5]),
        .O(\stencilRef[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \stencilRef[6]_i_1 
       (.I0(clearSaveStencilRef[6]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_StencilRefVal[6]),
        .I3(RAST_SetDepthParams),
        .I4(CMD_ClearStencilValue[6]),
        .O(\stencilRef[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE00FE)) 
    \stencilRef[7]_i_1 
       (.I0(CMD_ClearStencilBuffer),
        .I1(CMD_ClearDepthBuffer),
        .I2(RAST_SetDepthParams),
        .I3(clearModeEnable_reg_n_0),
        .I4(clearModeCompleted),
        .O(stencilWriteMask));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \stencilRef[7]_i_2 
       (.I0(clearSaveStencilRef[7]),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_StencilRefVal[7]),
        .I3(RAST_SetDepthParams),
        .I4(CMD_ClearStencilValue[7]),
        .O(\stencilRef[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \stencilRef_reg[0] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilRef[0]_i_1_n_0 ),
        .Q(stencilRef[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilRef_reg[1] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilRef[1]_i_1_n_0 ),
        .Q(stencilRef[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilRef_reg[2] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilRef[2]_i_1_n_0 ),
        .Q(stencilRef[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilRef_reg[3] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilRef[3]_i_1_n_0 ),
        .Q(stencilRef[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilRef_reg[4] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilRef[4]_i_1_n_0 ),
        .Q(stencilRef[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilRef_reg[5] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilRef[5]_i_1_n_0 ),
        .Q(stencilRef[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilRef_reg[6] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilRef[6]_i_1_n_0 ),
        .Q(stencilRef[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilRef_reg[7] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilRef[7]_i_2_n_0 ),
        .Q(stencilRef[7]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    stencilWriteEnable_i_1
       (.I0(clearSaveStencilWriteEnable),
        .I1(clearModeEnable_reg_n_0),
        .I2(RAST_StencilWriteEnable),
        .I3(RAST_SetDepthParams),
        .I4(CMD_ClearStencilBuffer),
        .O(stencilWriteEnable_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    stencilWriteEnable_reg
       (.C(clk),
        .CE(stencilWriteMask),
        .D(stencilWriteEnable_i_1_n_0),
        .Q(stencilWriteEnable_reg_n_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hACA0)) 
    \stencilWriteMask[0]_i_1 
       (.I0(clearSaveStencilWriteMask[0]),
        .I1(RAST_SetDepthParams),
        .I2(clearModeEnable_reg_n_0),
        .I3(RAST_StencilWriteMask[0]),
        .O(\stencilWriteMask[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hACA0)) 
    \stencilWriteMask[1]_i_1 
       (.I0(clearSaveStencilWriteMask[1]),
        .I1(RAST_SetDepthParams),
        .I2(clearModeEnable_reg_n_0),
        .I3(RAST_StencilWriteMask[1]),
        .O(\stencilWriteMask[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF088)) 
    \stencilWriteMask[2]_i_1 
       (.I0(RAST_SetDepthParams),
        .I1(RAST_StencilWriteMask[2]),
        .I2(clearSaveStencilWriteMask[2]),
        .I3(clearModeEnable_reg_n_0),
        .O(\stencilWriteMask[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hACA0)) 
    \stencilWriteMask[3]_i_1 
       (.I0(clearSaveStencilWriteMask[3]),
        .I1(RAST_SetDepthParams),
        .I2(clearModeEnable_reg_n_0),
        .I3(RAST_StencilWriteMask[3]),
        .O(\stencilWriteMask[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF088)) 
    \stencilWriteMask[4]_i_1 
       (.I0(RAST_SetDepthParams),
        .I1(RAST_StencilWriteMask[4]),
        .I2(clearSaveStencilWriteMask[4]),
        .I3(clearModeEnable_reg_n_0),
        .O(\stencilWriteMask[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hACA0)) 
    \stencilWriteMask[5]_i_1 
       (.I0(clearSaveStencilWriteMask[5]),
        .I1(RAST_SetDepthParams),
        .I2(clearModeEnable_reg_n_0),
        .I3(RAST_StencilWriteMask[5]),
        .O(\stencilWriteMask[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hF088)) 
    \stencilWriteMask[6]_i_1 
       (.I0(RAST_SetDepthParams),
        .I1(RAST_StencilWriteMask[6]),
        .I2(clearSaveStencilWriteMask[6]),
        .I3(clearModeEnable_reg_n_0),
        .O(\stencilWriteMask[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hACA0)) 
    \stencilWriteMask[7]_i_1 
       (.I0(clearSaveStencilWriteMask[7]),
        .I1(RAST_SetDepthParams),
        .I2(clearModeEnable_reg_n_0),
        .I3(RAST_StencilWriteMask[7]),
        .O(\stencilWriteMask[7]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \stencilWriteMask_reg[0] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilWriteMask[0]_i_1_n_0 ),
        .Q(\stencilWriteMask_reg_n_0_[0] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \stencilWriteMask_reg[1] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilWriteMask[1]_i_1_n_0 ),
        .Q(\stencilWriteMask_reg_n_0_[1] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \stencilWriteMask_reg[2] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilWriteMask[2]_i_1_n_0 ),
        .Q(\stencilWriteMask_reg_n_0_[2] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \stencilWriteMask_reg[3] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilWriteMask[3]_i_1_n_0 ),
        .Q(\stencilWriteMask_reg_n_0_[3] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \stencilWriteMask_reg[4] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilWriteMask[4]_i_1_n_0 ),
        .Q(\stencilWriteMask_reg_n_0_[4] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \stencilWriteMask_reg[5] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilWriteMask[5]_i_1_n_0 ),
        .Q(\stencilWriteMask_reg_n_0_[5] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \stencilWriteMask_reg[6] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilWriteMask[6]_i_1_n_0 ),
        .Q(\stencilWriteMask_reg_n_0_[6] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \stencilWriteMask_reg[7] 
       (.C(clk),
        .CE(stencilWriteMask),
        .D(\stencilWriteMask[7]_i_1_n_0 ),
        .Q(\stencilWriteMask_reg_n_0_[7] ),
        .S(\currentStencilCompareFunc[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \stencilZFailOp_reg[0] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilZFailOp[0]),
        .Q(stencilZFailOp[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilZFailOp_reg[1] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilZFailOp[1]),
        .Q(stencilZFailOp[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \stencilZFailOp_reg[2] 
       (.C(clk),
        .CE(stencilReadMask),
        .D(RAST_StencilZFailOp[2]),
        .Q(stencilZFailOp[2]),
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
