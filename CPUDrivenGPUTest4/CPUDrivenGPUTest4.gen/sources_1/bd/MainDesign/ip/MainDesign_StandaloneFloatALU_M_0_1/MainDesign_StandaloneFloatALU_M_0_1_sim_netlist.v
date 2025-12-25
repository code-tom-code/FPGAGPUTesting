// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:01:13 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StandaloneFloatALU_M_0_1/MainDesign_StandaloneFloatALU_M_0_1_sim_netlist.v
// Design      : MainDesign_StandaloneFloatALU_M_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_StandaloneFloatALU_M_0_1,StandaloneFloatALU_MUL,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "StandaloneFloatALU_MUL,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_StandaloneFloatALU_M_0_1
   (clk,
    IN_A,
    IN_B,
    OMUL,
    IMUL_GO);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  input [31:0]IN_A;
  input [31:0]IN_B;
  output [31:0]OMUL;
  input IMUL_GO;

  wire IMUL_GO;
  wire [31:0]IN_A;
  wire [31:0]IN_B;
  wire [31:0]OMUL;
  wire clk;

  MainDesign_StandaloneFloatALU_M_0_1_StandaloneFloatALU_MUL U0
       (.IMUL_GO(IMUL_GO),
        .IN_A(IN_A),
        .IN_B(IN_B),
        .OMUL(OMUL),
        .clk(clk));
endmodule

(* ORIG_REF_NAME = "StandaloneFloatALU_MUL" *) 
module MainDesign_StandaloneFloatALU_M_0_1_StandaloneFloatALU_MUL
   (OMUL,
    IN_A,
    IN_B,
    IMUL_GO,
    clk);
  output [31:0]OMUL;
  input [31:0]IN_A;
  input [31:0]IN_B;
  input IMUL_GO;
  input clk;

  wire IMUL_GO;
  wire [31:0]IN_A;
  wire [31:0]IN_B;
  wire [31:0]OMUL;
  wire [30:22]OMUL0_in;
  wire [24:0]OMUL1;
  wire \OMUL[0]_i_1_n_0 ;
  wire \OMUL[10]_i_1_n_0 ;
  wire \OMUL[11]_i_1_n_0 ;
  wire \OMUL[12]_i_1_n_0 ;
  wire \OMUL[13]_i_1_n_0 ;
  wire \OMUL[14]_i_1_n_0 ;
  wire \OMUL[15]_i_1_n_0 ;
  wire \OMUL[16]_i_1_n_0 ;
  wire \OMUL[17]_i_1_n_0 ;
  wire \OMUL[18]_i_1_n_0 ;
  wire \OMUL[19]_i_1_n_0 ;
  wire \OMUL[1]_i_1_n_0 ;
  wire \OMUL[20]_i_1_n_0 ;
  wire \OMUL[21]_i_1_n_0 ;
  wire \OMUL[22]_i_2_n_0 ;
  wire \OMUL[22]_i_3_n_0 ;
  wire \OMUL[22]_i_4_n_0 ;
  wire \OMUL[22]_i_5_n_0 ;
  wire \OMUL[23]_i_1_n_0 ;
  wire \OMUL[24]_i_1_n_0 ;
  wire \OMUL[25]_i_1_n_0 ;
  wire \OMUL[26]_i_1_n_0 ;
  wire \OMUL[26]_i_2_n_0 ;
  wire \OMUL[27]_i_1_n_0 ;
  wire \OMUL[27]_i_2_n_0 ;
  wire \OMUL[28]_i_1_n_0 ;
  wire \OMUL[28]_i_2_n_0 ;
  wire \OMUL[28]_i_3_n_0 ;
  wire \OMUL[29]_i_1_n_0 ;
  wire \OMUL[29]_i_2_n_0 ;
  wire \OMUL[2]_i_1_n_0 ;
  wire \OMUL[30]_i_2_n_0 ;
  wire \OMUL[30]_i_3_n_0 ;
  wire \OMUL[30]_i_4_n_0 ;
  wire \OMUL[30]_i_5_n_0 ;
  wire \OMUL[30]_i_6_n_0 ;
  wire \OMUL[30]_i_7_n_0 ;
  wire \OMUL[31]_i_1_n_0 ;
  wire \OMUL[3]_i_1_n_0 ;
  wire \OMUL[4]_i_1_n_0 ;
  wire \OMUL[5]_i_1_n_0 ;
  wire \OMUL[6]_i_1_n_0 ;
  wire \OMUL[7]_i_1_n_0 ;
  wire \OMUL[8]_i_1_n_0 ;
  wire \OMUL[9]_i_1_n_0 ;
  wire [6:0]RESIZE0_in;
  wire clk;
  wire \mulEarlyOutBypass0[22]_i_10_n_0 ;
  wire \mulEarlyOutBypass0[22]_i_11_n_0 ;
  wire \mulEarlyOutBypass0[22]_i_1_n_0 ;
  wire \mulEarlyOutBypass0[22]_i_2_n_0 ;
  wire \mulEarlyOutBypass0[22]_i_3_n_0 ;
  wire \mulEarlyOutBypass0[22]_i_4_n_0 ;
  wire \mulEarlyOutBypass0[22]_i_6_n_0 ;
  wire \mulEarlyOutBypass0[22]_i_7_n_0 ;
  wire \mulEarlyOutBypass0[22]_i_8_n_0 ;
  wire \mulEarlyOutBypass0[22]_i_9_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_10_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_11_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_12_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_13_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_14_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_15_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_16_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_17_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_18_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_19_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_1_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_2_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_3_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_4_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_6_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_7_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_8_n_0 ;
  wire \mulEarlyOutBypass0[30]_i_9_n_0 ;
  wire \mulEarlyOutBypass0[31]_i_1_n_0 ;
  wire \mulEarlyOutBypass0[31]_i_2_n_0 ;
  wire \mulEarlyOutBypass0_reg_n_0_[22] ;
  wire \mulEarlyOutBypass0_reg_n_0_[30] ;
  wire \mulEarlyOutBypass0_reg_n_0_[31] ;
  wire [31:22]mulEarlyOutBypass1;
  wire [31:22]mulEarlyOutBypass2;
  wire [31:22]mulEarlyOutBypass3;
  wire mulEarlyOutBypassEnable0_i_1_n_0;
  wire mulEarlyOutBypassEnable0_i_2_n_0;
  wire mulEarlyOutBypassEnable0_i_3_n_0;
  wire mulEarlyOutBypassEnable0_i_4_n_0;
  wire mulEarlyOutBypassEnable0_i_5_n_0;
  wire mulEarlyOutBypassEnable0_reg_n_0;
  wire mulEarlyOutBypassEnable1;
  wire mulEarlyOutBypassEnable2;
  wire mulEarlyOutBypassEnable3;
  wire mulPipelineValidStage0;
  wire mulPipelineValidStage1;
  wire mulPipelineValidStage2;
  wire mulPipelineValidStage3;
  wire [0:0]mulResultExp0;
  wire mulResultExp00_carry__0_n_15;
  wire mulResultExp00_carry_i_10_n_0;
  wire mulResultExp00_carry_i_11_n_0;
  wire mulResultExp00_carry_i_12_n_0;
  wire mulResultExp00_carry_i_13_n_0;
  wire mulResultExp00_carry_i_14_n_0;
  wire mulResultExp00_carry_i_15_n_0;
  wire mulResultExp00_carry_i_16_n_0;
  wire mulResultExp00_carry_i_17_n_0;
  wire mulResultExp00_carry_i_18_n_0;
  wire mulResultExp00_carry_i_19_n_0;
  wire mulResultExp00_carry_i_1_n_0;
  wire mulResultExp00_carry_i_20_n_0;
  wire mulResultExp00_carry_i_9_n_0;
  wire mulResultExp00_carry_n_0;
  wire mulResultExp00_carry_n_1;
  wire mulResultExp00_carry_n_10;
  wire mulResultExp00_carry_n_11;
  wire mulResultExp00_carry_n_12;
  wire mulResultExp00_carry_n_13;
  wire mulResultExp00_carry_n_14;
  wire mulResultExp00_carry_n_15;
  wire mulResultExp00_carry_n_2;
  wire mulResultExp00_carry_n_3;
  wire mulResultExp00_carry_n_4;
  wire mulResultExp00_carry_n_5;
  wire mulResultExp00_carry_n_6;
  wire mulResultExp00_carry_n_7;
  wire mulResultExp00_carry_n_8;
  wire mulResultExp00_carry_n_9;
  wire \mulResultExp0[8]_i_2_n_0 ;
  wire \mulResultExp0[8]_i_3_n_0 ;
  wire \mulResultExp0[8]_i_4_n_0 ;
  wire \mulResultExp0[8]_i_5_n_0 ;
  wire \mulResultExp0[8]_i_6_n_0 ;
  wire \mulResultExp0_reg_n_0_[0] ;
  wire \mulResultExp0_reg_n_0_[1] ;
  wire \mulResultExp0_reg_n_0_[2] ;
  wire \mulResultExp0_reg_n_0_[3] ;
  wire \mulResultExp0_reg_n_0_[4] ;
  wire \mulResultExp0_reg_n_0_[5] ;
  wire \mulResultExp0_reg_n_0_[6] ;
  wire \mulResultExp0_reg_n_0_[7] ;
  wire \mulResultExp0_reg_n_0_[8] ;
  wire [8:0]mulResultExp1;
  wire [8:0]mulResultExp2;
  wire \mulResultExp3_reg_n_0_[0] ;
  wire \mulResultExp3_reg_n_0_[1] ;
  wire \mulResultExp3_reg_n_0_[2] ;
  wire \mulResultExp3_reg_n_0_[3] ;
  wire \mulResultExp3_reg_n_0_[4] ;
  wire \mulResultExp3_reg_n_0_[5] ;
  wire \mulResultExp3_reg_n_0_[6] ;
  wire \mulResultExp3_reg_n_0_[7] ;
  wire \mulResultExp3_reg_n_0_[8] ;
  wire [0:0]mulResultMantissa1;
  wire mulResultMantissa10_n_100;
  wire mulResultMantissa10_n_101;
  wire mulResultMantissa10_n_102;
  wire mulResultMantissa10_n_103;
  wire mulResultMantissa10_n_104;
  wire mulResultMantissa10_n_105;
  wire mulResultMantissa10_n_106;
  wire mulResultMantissa10_n_107;
  wire mulResultMantissa10_n_108;
  wire mulResultMantissa10_n_109;
  wire mulResultMantissa10_n_110;
  wire mulResultMantissa10_n_111;
  wire mulResultMantissa10_n_112;
  wire mulResultMantissa10_n_113;
  wire mulResultMantissa10_n_114;
  wire mulResultMantissa10_n_115;
  wire mulResultMantissa10_n_116;
  wire mulResultMantissa10_n_117;
  wire mulResultMantissa10_n_118;
  wire mulResultMantissa10_n_119;
  wire mulResultMantissa10_n_120;
  wire mulResultMantissa10_n_121;
  wire mulResultMantissa10_n_122;
  wire mulResultMantissa10_n_123;
  wire mulResultMantissa10_n_124;
  wire mulResultMantissa10_n_125;
  wire mulResultMantissa10_n_126;
  wire mulResultMantissa10_n_127;
  wire mulResultMantissa10_n_128;
  wire mulResultMantissa10_n_129;
  wire mulResultMantissa10_n_130;
  wire mulResultMantissa10_n_131;
  wire mulResultMantissa10_n_132;
  wire mulResultMantissa10_n_133;
  wire mulResultMantissa10_n_134;
  wire mulResultMantissa10_n_135;
  wire mulResultMantissa10_n_136;
  wire mulResultMantissa10_n_137;
  wire mulResultMantissa10_n_138;
  wire mulResultMantissa10_n_139;
  wire mulResultMantissa10_n_140;
  wire mulResultMantissa10_n_141;
  wire mulResultMantissa10_n_142;
  wire mulResultMantissa10_n_143;
  wire mulResultMantissa10_n_144;
  wire mulResultMantissa10_n_145;
  wire mulResultMantissa10_n_146;
  wire mulResultMantissa10_n_147;
  wire mulResultMantissa10_n_148;
  wire mulResultMantissa10_n_149;
  wire mulResultMantissa10_n_150;
  wire mulResultMantissa10_n_151;
  wire mulResultMantissa10_n_152;
  wire mulResultMantissa10_n_153;
  wire mulResultMantissa10_n_58;
  wire mulResultMantissa10_n_59;
  wire mulResultMantissa10_n_60;
  wire mulResultMantissa10_n_61;
  wire mulResultMantissa10_n_62;
  wire mulResultMantissa10_n_63;
  wire mulResultMantissa10_n_64;
  wire mulResultMantissa10_n_65;
  wire mulResultMantissa10_n_66;
  wire mulResultMantissa10_n_67;
  wire mulResultMantissa10_n_68;
  wire mulResultMantissa10_n_69;
  wire mulResultMantissa10_n_70;
  wire mulResultMantissa10_n_71;
  wire mulResultMantissa10_n_72;
  wire mulResultMantissa10_n_73;
  wire mulResultMantissa10_n_74;
  wire mulResultMantissa10_n_75;
  wire mulResultMantissa10_n_76;
  wire mulResultMantissa10_n_77;
  wire mulResultMantissa10_n_78;
  wire mulResultMantissa10_n_79;
  wire mulResultMantissa10_n_80;
  wire mulResultMantissa10_n_81;
  wire mulResultMantissa10_n_82;
  wire mulResultMantissa10_n_83;
  wire mulResultMantissa10_n_84;
  wire mulResultMantissa10_n_85;
  wire mulResultMantissa10_n_86;
  wire mulResultMantissa10_n_87;
  wire mulResultMantissa10_n_88;
  wire mulResultMantissa10_n_89;
  wire mulResultMantissa10_n_90;
  wire mulResultMantissa10_n_91;
  wire mulResultMantissa10_n_92;
  wire mulResultMantissa10_n_93;
  wire mulResultMantissa10_n_94;
  wire mulResultMantissa10_n_95;
  wire mulResultMantissa10_n_96;
  wire mulResultMantissa10_n_97;
  wire mulResultMantissa10_n_98;
  wire mulResultMantissa10_n_99;
  wire [47:23]mulResultMantissa1_reg__0;
  wire mulResultMantissa1_reg_n_100;
  wire mulResultMantissa1_reg_n_101;
  wire mulResultMantissa1_reg_n_102;
  wire mulResultMantissa1_reg_n_103;
  wire mulResultMantissa1_reg_n_104;
  wire mulResultMantissa1_reg_n_105;
  wire [47:23]mulResultMantissa2;
  wire mulResultSign0;
  wire mulResultSign0_i_1_n_0;
  wire mulResultSign1;
  wire mulResultSign2;
  wire mulResultSign3;
  wire [30:22]p_2_in;
  wire [7:0]NLW_mulResultExp00_carry__0_CO_UNCONNECTED;
  wire [7:1]NLW_mulResultExp00_carry__0_O_UNCONNECTED;
  wire NLW_mulResultMantissa10_CARRYCASCOUT_UNCONNECTED;
  wire NLW_mulResultMantissa10_MULTSIGNOUT_UNCONNECTED;
  wire NLW_mulResultMantissa10_OVERFLOW_UNCONNECTED;
  wire NLW_mulResultMantissa10_PATTERNBDETECT_UNCONNECTED;
  wire NLW_mulResultMantissa10_PATTERNDETECT_UNCONNECTED;
  wire NLW_mulResultMantissa10_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_mulResultMantissa10_ACOUT_UNCONNECTED;
  wire [17:0]NLW_mulResultMantissa10_BCOUT_UNCONNECTED;
  wire [3:0]NLW_mulResultMantissa10_CARRYOUT_UNCONNECTED;
  wire [7:0]NLW_mulResultMantissa10_XOROUT_UNCONNECTED;
  wire NLW_mulResultMantissa1_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_mulResultMantissa1_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_mulResultMantissa1_reg_OVERFLOW_UNCONNECTED;
  wire NLW_mulResultMantissa1_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_mulResultMantissa1_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_mulResultMantissa1_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_mulResultMantissa1_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_mulResultMantissa1_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_mulResultMantissa1_reg_CARRYOUT_UNCONNECTED;
  wire [47:31]NLW_mulResultMantissa1_reg_P_UNCONNECTED;
  wire [47:0]NLW_mulResultMantissa1_reg_PCOUT_UNCONNECTED;
  wire [7:0]NLW_mulResultMantissa1_reg_XOROUT_UNCONNECTED;

  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[0]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[0]),
        .I2(OMUL1[1]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[10]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[10]),
        .I2(OMUL1[11]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[11]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[11]),
        .I2(OMUL1[12]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[12]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[12]),
        .I2(OMUL1[13]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[13]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[13]),
        .I2(OMUL1[14]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[13]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[14]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[14]),
        .I2(OMUL1[15]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[15]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[15]),
        .I2(OMUL1[16]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[16]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[16]),
        .I2(OMUL1[17]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[17]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[17]),
        .I2(OMUL1[18]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[17]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[18]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[18]),
        .I2(OMUL1[19]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[18]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[19]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[19]),
        .I2(OMUL1[20]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[1]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[1]),
        .I2(OMUL1[2]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[20]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[20]),
        .I2(OMUL1[21]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[21]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[21]),
        .I2(OMUL1[22]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAEAA)) 
    \OMUL[22]_i_1 
       (.I0(\OMUL[30]_i_4_n_0 ),
        .I1(\mulResultExp3_reg_n_0_[7] ),
        .I2(\mulResultExp3_reg_n_0_[8] ),
        .I3(mulPipelineValidStage3),
        .I4(mulEarlyOutBypassEnable3),
        .O(OMUL0_in[22]));
  LUT6 #(
    .INIT(64'hFFFFFFFFC0AA0000)) 
    \OMUL[22]_i_2 
       (.I0(OMUL1[22]),
        .I1(\OMUL[22]_i_3_n_0 ),
        .I2(OMUL1[23]),
        .I3(OMUL1[24]),
        .I4(\OMUL[30]_i_5_n_0 ),
        .I5(\OMUL[22]_i_4_n_0 ),
        .O(\OMUL[22]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    \OMUL[22]_i_3 
       (.I0(\mulResultExp3_reg_n_0_[1] ),
        .I1(\mulResultExp3_reg_n_0_[8] ),
        .I2(\mulResultExp3_reg_n_0_[0] ),
        .I3(\OMUL[22]_i_5_n_0 ),
        .O(\OMUL[22]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \OMUL[22]_i_4 
       (.I0(mulEarlyOutBypassEnable3),
        .I1(mulEarlyOutBypass3[22]),
        .O(\OMUL[22]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hF7FFFFFFFFFFFFFF)) 
    \OMUL[22]_i_5 
       (.I0(\mulResultExp3_reg_n_0_[6] ),
        .I1(\mulResultExp3_reg_n_0_[5] ),
        .I2(\mulResultExp3_reg_n_0_[7] ),
        .I3(\mulResultExp3_reg_n_0_[2] ),
        .I4(\mulResultExp3_reg_n_0_[3] ),
        .I5(\mulResultExp3_reg_n_0_[4] ),
        .O(\OMUL[22]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF828282)) 
    \OMUL[23]_i_1 
       (.I0(\OMUL[30]_i_5_n_0 ),
        .I1(OMUL1[24]),
        .I2(\mulResultExp3_reg_n_0_[0] ),
        .I3(mulEarlyOutBypassEnable3),
        .I4(mulEarlyOutBypass3[30]),
        .I5(\OMUL[30]_i_4_n_0 ),
        .O(\OMUL[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFA802)) 
    \OMUL[24]_i_1 
       (.I0(\OMUL[30]_i_5_n_0 ),
        .I1(\mulResultExp3_reg_n_0_[0] ),
        .I2(OMUL1[24]),
        .I3(\mulResultExp3_reg_n_0_[1] ),
        .I4(\OMUL[28]_i_3_n_0 ),
        .I5(\OMUL[30]_i_4_n_0 ),
        .O(\OMUL[24]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF282828)) 
    \OMUL[25]_i_1 
       (.I0(\OMUL[30]_i_5_n_0 ),
        .I1(\OMUL[26]_i_2_n_0 ),
        .I2(\mulResultExp3_reg_n_0_[2] ),
        .I3(mulEarlyOutBypassEnable3),
        .I4(mulEarlyOutBypass3[30]),
        .I5(\OMUL[30]_i_4_n_0 ),
        .O(\OMUL[25]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFA208)) 
    \OMUL[26]_i_1 
       (.I0(\OMUL[30]_i_5_n_0 ),
        .I1(\OMUL[26]_i_2_n_0 ),
        .I2(\mulResultExp3_reg_n_0_[2] ),
        .I3(\mulResultExp3_reg_n_0_[3] ),
        .I4(\OMUL[28]_i_3_n_0 ),
        .I5(\OMUL[30]_i_4_n_0 ),
        .O(\OMUL[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \OMUL[26]_i_2 
       (.I0(OMUL1[24]),
        .I1(\mulResultExp3_reg_n_0_[0] ),
        .I2(\mulResultExp3_reg_n_0_[1] ),
        .O(\OMUL[26]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFA082)) 
    \OMUL[27]_i_1 
       (.I0(\OMUL[30]_i_5_n_0 ),
        .I1(\OMUL[27]_i_2_n_0 ),
        .I2(\mulResultExp3_reg_n_0_[4] ),
        .I3(OMUL1[24]),
        .I4(\OMUL[28]_i_3_n_0 ),
        .I5(\OMUL[30]_i_4_n_0 ),
        .O(\OMUL[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \OMUL[27]_i_2 
       (.I0(\mulResultExp3_reg_n_0_[3] ),
        .I1(\mulResultExp3_reg_n_0_[2] ),
        .I2(\mulResultExp3_reg_n_0_[0] ),
        .I3(\mulResultExp3_reg_n_0_[1] ),
        .O(\OMUL[27]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFA802)) 
    \OMUL[28]_i_1 
       (.I0(\OMUL[30]_i_5_n_0 ),
        .I1(OMUL1[24]),
        .I2(\OMUL[28]_i_2_n_0 ),
        .I3(\mulResultExp3_reg_n_0_[5] ),
        .I4(\OMUL[28]_i_3_n_0 ),
        .I5(\OMUL[30]_i_4_n_0 ),
        .O(\OMUL[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \OMUL[28]_i_2 
       (.I0(\mulResultExp3_reg_n_0_[4] ),
        .I1(\mulResultExp3_reg_n_0_[1] ),
        .I2(\mulResultExp3_reg_n_0_[0] ),
        .I3(\mulResultExp3_reg_n_0_[2] ),
        .I4(\mulResultExp3_reg_n_0_[3] ),
        .O(\OMUL[28]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \OMUL[28]_i_3 
       (.I0(mulEarlyOutBypassEnable3),
        .I1(mulEarlyOutBypass3[30]),
        .O(\OMUL[28]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0000F222)) 
    \OMUL[29]_i_1 
       (.I0(\OMUL[30]_i_5_n_0 ),
        .I1(\OMUL[29]_i_2_n_0 ),
        .I2(mulEarlyOutBypassEnable3),
        .I3(mulEarlyOutBypass3[30]),
        .I4(\OMUL[30]_i_4_n_0 ),
        .O(\OMUL[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h5556)) 
    \OMUL[29]_i_2 
       (.I0(\mulResultExp3_reg_n_0_[6] ),
        .I1(OMUL1[24]),
        .I2(\mulResultExp3_reg_n_0_[5] ),
        .I3(\OMUL[28]_i_2_n_0 ),
        .O(\OMUL[29]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[2]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[2]),
        .I2(OMUL1[3]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0400)) 
    \OMUL[30]_i_1 
       (.I0(mulEarlyOutBypassEnable3),
        .I1(mulPipelineValidStage3),
        .I2(\mulResultExp3_reg_n_0_[8] ),
        .I3(\mulResultExp3_reg_n_0_[7] ),
        .O(OMUL0_in[30]));
  LUT2 #(
    .INIT(4'hE)) 
    \OMUL[30]_i_2 
       (.I0(mulPipelineValidStage3),
        .I1(\OMUL[30]_i_4_n_0 ),
        .O(\OMUL[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF828282)) 
    \OMUL[30]_i_3 
       (.I0(\OMUL[30]_i_5_n_0 ),
        .I1(\OMUL[30]_i_6_n_0 ),
        .I2(\mulResultExp3_reg_n_0_[7] ),
        .I3(mulEarlyOutBypassEnable3),
        .I4(mulEarlyOutBypass3[30]),
        .I5(\OMUL[30]_i_4_n_0 ),
        .O(\OMUL[30]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h40400040)) 
    \OMUL[30]_i_4 
       (.I0(mulEarlyOutBypassEnable3),
        .I1(mulPipelineValidStage3),
        .I2(\mulResultExp3_reg_n_0_[8] ),
        .I3(\mulResultExp3_reg_n_0_[7] ),
        .I4(\OMUL[30]_i_7_n_0 ),
        .O(\OMUL[30]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0043)) 
    \OMUL[30]_i_5 
       (.I0(\OMUL[30]_i_7_n_0 ),
        .I1(\mulResultExp3_reg_n_0_[7] ),
        .I2(\mulResultExp3_reg_n_0_[8] ),
        .I3(mulEarlyOutBypassEnable3),
        .O(\OMUL[30]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \OMUL[30]_i_6 
       (.I0(\mulResultExp3_reg_n_0_[5] ),
        .I1(\mulResultExp3_reg_n_0_[6] ),
        .I2(OMUL1[24]),
        .I3(\OMUL[28]_i_2_n_0 ),
        .O(\OMUL[30]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \OMUL[30]_i_7 
       (.I0(\mulResultExp3_reg_n_0_[5] ),
        .I1(\mulResultExp3_reg_n_0_[6] ),
        .I2(\mulResultExp3_reg_n_0_[1] ),
        .I3(\mulResultExp3_reg_n_0_[4] ),
        .I4(\mulResultExp3_reg_n_0_[3] ),
        .I5(\mulResultExp3_reg_n_0_[2] ),
        .O(\OMUL[30]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \OMUL[31]_i_1 
       (.I0(mulEarlyOutBypass3[31]),
        .I1(mulEarlyOutBypassEnable3),
        .I2(mulResultSign3),
        .I3(mulPipelineValidStage3),
        .I4(OMUL[31]),
        .O(\OMUL[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[3]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[3]),
        .I2(OMUL1[4]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[4]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[4]),
        .I2(OMUL1[5]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[5]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[5]),
        .I2(OMUL1[6]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[6]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[6]),
        .I2(OMUL1[7]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[7]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[7]),
        .I2(OMUL1[8]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[8]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[8]),
        .I2(OMUL1[9]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFAEEAAEEAAAAAAAA)) 
    \OMUL[9]_i_1 
       (.I0(\OMUL[22]_i_4_n_0 ),
        .I1(OMUL1[9]),
        .I2(OMUL1[10]),
        .I3(OMUL1[24]),
        .I4(\OMUL[22]_i_3_n_0 ),
        .I5(\OMUL[30]_i_5_n_0 ),
        .O(\OMUL[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[0] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[0]_i_1_n_0 ),
        .Q(OMUL[0]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[10] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[10]_i_1_n_0 ),
        .Q(OMUL[10]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[11] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[11]_i_1_n_0 ),
        .Q(OMUL[11]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[12] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[12]_i_1_n_0 ),
        .Q(OMUL[12]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[13] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[13]_i_1_n_0 ),
        .Q(OMUL[13]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[14] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[14]_i_1_n_0 ),
        .Q(OMUL[14]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[15] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[15]_i_1_n_0 ),
        .Q(OMUL[15]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[16] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[16]_i_1_n_0 ),
        .Q(OMUL[16]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[17] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[17]_i_1_n_0 ),
        .Q(OMUL[17]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[18] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[18]_i_1_n_0 ),
        .Q(OMUL[18]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[19] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[19]_i_1_n_0 ),
        .Q(OMUL[19]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[1] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[1]_i_1_n_0 ),
        .Q(OMUL[1]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[20] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[20]_i_1_n_0 ),
        .Q(OMUL[20]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[21] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[21]_i_1_n_0 ),
        .Q(OMUL[21]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[22] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[22]_i_2_n_0 ),
        .Q(OMUL[22]),
        .R(OMUL0_in[22]));
  FDSE #(
    .INIT(1'b0)) 
    \OMUL_reg[23] 
       (.C(clk),
        .CE(\OMUL[30]_i_2_n_0 ),
        .D(\OMUL[23]_i_1_n_0 ),
        .Q(OMUL[23]),
        .S(OMUL0_in[30]));
  FDSE #(
    .INIT(1'b0)) 
    \OMUL_reg[24] 
       (.C(clk),
        .CE(\OMUL[30]_i_2_n_0 ),
        .D(\OMUL[24]_i_1_n_0 ),
        .Q(OMUL[24]),
        .S(OMUL0_in[30]));
  FDSE #(
    .INIT(1'b0)) 
    \OMUL_reg[25] 
       (.C(clk),
        .CE(\OMUL[30]_i_2_n_0 ),
        .D(\OMUL[25]_i_1_n_0 ),
        .Q(OMUL[25]),
        .S(OMUL0_in[30]));
  FDSE #(
    .INIT(1'b0)) 
    \OMUL_reg[26] 
       (.C(clk),
        .CE(\OMUL[30]_i_2_n_0 ),
        .D(\OMUL[26]_i_1_n_0 ),
        .Q(OMUL[26]),
        .S(OMUL0_in[30]));
  FDSE #(
    .INIT(1'b0)) 
    \OMUL_reg[27] 
       (.C(clk),
        .CE(\OMUL[30]_i_2_n_0 ),
        .D(\OMUL[27]_i_1_n_0 ),
        .Q(OMUL[27]),
        .S(OMUL0_in[30]));
  FDSE #(
    .INIT(1'b0)) 
    \OMUL_reg[28] 
       (.C(clk),
        .CE(\OMUL[30]_i_2_n_0 ),
        .D(\OMUL[28]_i_1_n_0 ),
        .Q(OMUL[28]),
        .S(OMUL0_in[30]));
  FDSE #(
    .INIT(1'b0)) 
    \OMUL_reg[29] 
       (.C(clk),
        .CE(\OMUL[30]_i_2_n_0 ),
        .D(\OMUL[29]_i_1_n_0 ),
        .Q(OMUL[29]),
        .S(OMUL0_in[30]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[2] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[2]_i_1_n_0 ),
        .Q(OMUL[2]),
        .R(OMUL0_in[22]));
  FDSE #(
    .INIT(1'b0)) 
    \OMUL_reg[30] 
       (.C(clk),
        .CE(\OMUL[30]_i_2_n_0 ),
        .D(\OMUL[30]_i_3_n_0 ),
        .Q(OMUL[30]),
        .S(OMUL0_in[30]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\OMUL[31]_i_1_n_0 ),
        .Q(OMUL[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[3] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[3]_i_1_n_0 ),
        .Q(OMUL[3]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[4] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[4]_i_1_n_0 ),
        .Q(OMUL[4]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[5] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[5]_i_1_n_0 ),
        .Q(OMUL[5]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[6] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[6]_i_1_n_0 ),
        .Q(OMUL[6]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[7] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[7]_i_1_n_0 ),
        .Q(OMUL[7]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[8] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[8]_i_1_n_0 ),
        .Q(OMUL[8]),
        .R(OMUL0_in[22]));
  FDRE #(
    .INIT(1'b0)) 
    \OMUL_reg[9] 
       (.C(clk),
        .CE(mulPipelineValidStage3),
        .D(\OMUL[9]_i_1_n_0 ),
        .Q(OMUL[9]),
        .R(OMUL0_in[22]));
  LUT6 #(
    .INIT(64'hAAAFAAAEAAAAAAAE)) 
    \mulEarlyOutBypass0[22]_i_1 
       (.I0(\mulEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\mulEarlyOutBypass0_reg_n_0_[22] ),
        .I2(\mulEarlyOutBypass0[22]_i_3_n_0 ),
        .I3(\mulEarlyOutBypass0[22]_i_4_n_0 ),
        .I4(\mulEarlyOutBypass0[31]_i_2_n_0 ),
        .I5(p_2_in[22]),
        .O(\mulEarlyOutBypass0[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \mulEarlyOutBypass0[22]_i_10 
       (.I0(IN_A[30]),
        .I1(IN_A[29]),
        .I2(IN_A[24]),
        .O(\mulEarlyOutBypass0[22]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \mulEarlyOutBypass0[22]_i_11 
       (.I0(IMUL_GO),
        .I1(IN_A[23]),
        .O(\mulEarlyOutBypass0[22]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \mulEarlyOutBypass0[22]_i_2 
       (.I0(\mulEarlyOutBypass0[30]_i_7_n_0 ),
        .I1(IMUL_GO),
        .I2(mulEarlyOutBypassEnable0_i_5_n_0),
        .I3(mulEarlyOutBypassEnable0_i_3_n_0),
        .O(\mulEarlyOutBypass0[22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEFEEEEEEEEEE)) 
    \mulEarlyOutBypass0[22]_i_3 
       (.I0(\mulEarlyOutBypass0[22]_i_6_n_0 ),
        .I1(\mulEarlyOutBypass0[22]_i_7_n_0 ),
        .I2(\mulEarlyOutBypass0[30]_i_6_n_0 ),
        .I3(IN_B[24]),
        .I4(\mulEarlyOutBypass0[30]_i_7_n_0 ),
        .I5(\mulEarlyOutBypass0[22]_i_8_n_0 ),
        .O(\mulEarlyOutBypass0[22]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0400)) 
    \mulEarlyOutBypass0[22]_i_4 
       (.I0(\mulEarlyOutBypass0[30]_i_7_n_0 ),
        .I1(IMUL_GO),
        .I2(mulEarlyOutBypassEnable0_i_5_n_0),
        .I3(\mulResultExp0[8]_i_3_n_0 ),
        .O(\mulEarlyOutBypass0[22]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0F010F01FFFF0F01)) 
    \mulEarlyOutBypass0[22]_i_5 
       (.I0(\mulResultExp0[8]_i_2_n_0 ),
        .I1(IN_A[23]),
        .I2(mulEarlyOutBypassEnable0_i_4_n_0),
        .I3(\mulEarlyOutBypass0[30]_i_6_n_0 ),
        .I4(\mulEarlyOutBypass0[30]_i_7_n_0 ),
        .I5(mulEarlyOutBypassEnable0_i_5_n_0),
        .O(p_2_in[22]));
  LUT6 #(
    .INIT(64'h0808000808080808)) 
    \mulEarlyOutBypass0[22]_i_6 
       (.I0(IMUL_GO),
        .I1(\mulEarlyOutBypass0[22]_i_9_n_0 ),
        .I2(\mulResultExp0[8]_i_6_n_0 ),
        .I3(IN_A[23]),
        .I4(\mulResultExp0[8]_i_4_n_0 ),
        .I5(IN_A[30]),
        .O(\mulEarlyOutBypass0[22]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h1010001010101010)) 
    \mulEarlyOutBypass0[22]_i_7 
       (.I0(\mulResultExp0[8]_i_5_n_0 ),
        .I1(\mulEarlyOutBypass0[22]_i_10_n_0 ),
        .I2(\mulEarlyOutBypass0[22]_i_11_n_0 ),
        .I3(IN_B[24]),
        .I4(mulResultExp00_carry_i_18_n_0),
        .I5(IN_B[30]),
        .O(\mulEarlyOutBypass0[22]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    \mulEarlyOutBypass0[22]_i_8 
       (.I0(IMUL_GO),
        .I1(IN_A[23]),
        .I2(\mulResultExp0[8]_i_4_n_0 ),
        .I3(IN_A[30]),
        .O(\mulEarlyOutBypass0[22]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \mulEarlyOutBypass0[22]_i_9 
       (.I0(IN_B[24]),
        .I1(IN_B[30]),
        .O(\mulEarlyOutBypass0[22]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h88FF88F8888888F8)) 
    \mulEarlyOutBypass0[30]_i_1 
       (.I0(\mulEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\mulEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(\mulEarlyOutBypass0_reg_n_0_[30] ),
        .I3(\mulEarlyOutBypass0[30]_i_4_n_0 ),
        .I4(\mulEarlyOutBypass0[31]_i_2_n_0 ),
        .I5(p_2_in[30]),
        .O(\mulEarlyOutBypass0[30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulEarlyOutBypass0[30]_i_10 
       (.I0(IN_B[10]),
        .I1(IN_B[9]),
        .I2(IN_B[12]),
        .I3(IN_B[11]),
        .O(\mulEarlyOutBypass0[30]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulEarlyOutBypass0[30]_i_11 
       (.I0(IN_B[14]),
        .I1(IN_B[13]),
        .I2(IN_B[16]),
        .I3(IN_B[15]),
        .O(\mulEarlyOutBypass0[30]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulEarlyOutBypass0[30]_i_12 
       (.I0(IN_B[6]),
        .I1(IN_B[5]),
        .I2(IN_B[8]),
        .I3(IN_B[7]),
        .O(\mulEarlyOutBypass0[30]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulEarlyOutBypass0[30]_i_13 
       (.I0(IN_B[2]),
        .I1(IN_B[1]),
        .I2(IN_B[4]),
        .I3(IN_B[3]),
        .O(\mulEarlyOutBypass0[30]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulEarlyOutBypass0[30]_i_14 
       (.I0(IN_A[18]),
        .I1(IN_A[17]),
        .I2(IN_A[20]),
        .I3(IN_A[19]),
        .O(\mulEarlyOutBypass0[30]_i_14_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \mulEarlyOutBypass0[30]_i_15 
       (.I0(IN_A[22]),
        .I1(IN_A[21]),
        .I2(IN_A[0]),
        .O(\mulEarlyOutBypass0[30]_i_15_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulEarlyOutBypass0[30]_i_16 
       (.I0(IN_A[10]),
        .I1(IN_A[9]),
        .I2(IN_A[12]),
        .I3(IN_A[11]),
        .O(\mulEarlyOutBypass0[30]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulEarlyOutBypass0[30]_i_17 
       (.I0(IN_A[14]),
        .I1(IN_A[13]),
        .I2(IN_A[16]),
        .I3(IN_A[15]),
        .O(\mulEarlyOutBypass0[30]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulEarlyOutBypass0[30]_i_18 
       (.I0(IN_A[6]),
        .I1(IN_A[5]),
        .I2(IN_A[8]),
        .I3(IN_A[7]),
        .O(\mulEarlyOutBypass0[30]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulEarlyOutBypass0[30]_i_19 
       (.I0(IN_A[2]),
        .I1(IN_A[1]),
        .I2(IN_A[4]),
        .I3(IN_A[3]),
        .O(\mulEarlyOutBypass0[30]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \mulEarlyOutBypass0[30]_i_2 
       (.I0(mulEarlyOutBypassEnable0_i_4_n_0),
        .I1(\mulEarlyOutBypass0[30]_i_6_n_0 ),
        .O(\mulEarlyOutBypass0[30]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \mulEarlyOutBypass0[30]_i_3 
       (.I0(mulEarlyOutBypassEnable0_i_5_n_0),
        .I1(IMUL_GO),
        .I2(\mulEarlyOutBypass0[30]_i_7_n_0 ),
        .O(\mulEarlyOutBypass0[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8888000088F80000)) 
    \mulEarlyOutBypass0[30]_i_4 
       (.I0(mulEarlyOutBypassEnable0_i_5_n_0),
        .I1(mulEarlyOutBypassEnable0_i_3_n_0),
        .I2(mulEarlyOutBypassEnable0_i_4_n_0),
        .I3(IN_A[23]),
        .I4(IMUL_GO),
        .I5(\mulResultExp0[8]_i_2_n_0 ),
        .O(\mulEarlyOutBypass0[30]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h55F4)) 
    \mulEarlyOutBypass0[30]_i_5 
       (.I0(mulEarlyOutBypassEnable0_i_4_n_0),
        .I1(\mulEarlyOutBypass0[30]_i_6_n_0 ),
        .I2(\mulEarlyOutBypass0[30]_i_7_n_0 ),
        .I3(mulEarlyOutBypassEnable0_i_5_n_0),
        .O(p_2_in[30]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \mulEarlyOutBypass0[30]_i_6 
       (.I0(\mulEarlyOutBypass0[30]_i_8_n_0 ),
        .I1(\mulEarlyOutBypass0[30]_i_9_n_0 ),
        .I2(\mulEarlyOutBypass0[30]_i_10_n_0 ),
        .I3(\mulEarlyOutBypass0[30]_i_11_n_0 ),
        .I4(\mulEarlyOutBypass0[30]_i_12_n_0 ),
        .I5(\mulEarlyOutBypass0[30]_i_13_n_0 ),
        .O(\mulEarlyOutBypass0[30]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \mulEarlyOutBypass0[30]_i_7 
       (.I0(\mulEarlyOutBypass0[30]_i_14_n_0 ),
        .I1(\mulEarlyOutBypass0[30]_i_15_n_0 ),
        .I2(\mulEarlyOutBypass0[30]_i_16_n_0 ),
        .I3(\mulEarlyOutBypass0[30]_i_17_n_0 ),
        .I4(\mulEarlyOutBypass0[30]_i_18_n_0 ),
        .I5(\mulEarlyOutBypass0[30]_i_19_n_0 ),
        .O(\mulEarlyOutBypass0[30]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulEarlyOutBypass0[30]_i_8 
       (.I0(IN_B[18]),
        .I1(IN_B[17]),
        .I2(IN_B[20]),
        .I3(IN_B[19]),
        .O(\mulEarlyOutBypass0[30]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \mulEarlyOutBypass0[30]_i_9 
       (.I0(IN_B[22]),
        .I1(IN_B[21]),
        .I2(IN_B[0]),
        .O(\mulEarlyOutBypass0[30]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'h6F60)) 
    \mulEarlyOutBypass0[31]_i_1 
       (.I0(IN_B[31]),
        .I1(IN_A[31]),
        .I2(\mulEarlyOutBypass0[31]_i_2_n_0 ),
        .I3(\mulEarlyOutBypass0_reg_n_0_[31] ),
        .O(\mulEarlyOutBypass0[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF0000777F0000)) 
    \mulEarlyOutBypass0[31]_i_2 
       (.I0(mulEarlyOutBypassEnable0_i_4_n_0),
        .I1(mulEarlyOutBypassEnable0_i_5_n_0),
        .I2(IN_A[23]),
        .I3(\mulResultExp0[8]_i_2_n_0 ),
        .I4(IMUL_GO),
        .I5(mulEarlyOutBypassEnable0_i_3_n_0),
        .O(\mulEarlyOutBypass0[31]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass0_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\mulEarlyOutBypass0[22]_i_1_n_0 ),
        .Q(\mulEarlyOutBypass0_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass0_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\mulEarlyOutBypass0[30]_i_1_n_0 ),
        .Q(\mulEarlyOutBypass0_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass0_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\mulEarlyOutBypass0[31]_i_1_n_0 ),
        .Q(\mulEarlyOutBypass0_reg_n_0_[31] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass1_reg[22] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulEarlyOutBypass0_reg_n_0_[22] ),
        .Q(mulEarlyOutBypass1[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass1_reg[30] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulEarlyOutBypass0_reg_n_0_[30] ),
        .Q(mulEarlyOutBypass1[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass1_reg[31] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulEarlyOutBypass0_reg_n_0_[31] ),
        .Q(mulEarlyOutBypass1[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass2_reg[22] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulEarlyOutBypass1[22]),
        .Q(mulEarlyOutBypass2[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass2_reg[30] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulEarlyOutBypass1[30]),
        .Q(mulEarlyOutBypass2[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass2_reg[31] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulEarlyOutBypass1[31]),
        .Q(mulEarlyOutBypass2[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass3_reg[22] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulEarlyOutBypass2[22]),
        .Q(mulEarlyOutBypass3[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass3_reg[30] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulEarlyOutBypass2[30]),
        .Q(mulEarlyOutBypass3[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulEarlyOutBypass3_reg[31] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulEarlyOutBypass2[31]),
        .Q(mulEarlyOutBypass3[31]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFEAEFEAEFEAEFEFE)) 
    mulEarlyOutBypassEnable0_i_1
       (.I0(mulEarlyOutBypassEnable0_i_2_n_0),
        .I1(mulEarlyOutBypassEnable0_reg_n_0),
        .I2(IMUL_GO),
        .I3(mulEarlyOutBypassEnable0_i_3_n_0),
        .I4(\mulResultExp0[8]_i_2_n_0 ),
        .I5(IN_A[23]),
        .O(mulEarlyOutBypassEnable0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h70)) 
    mulEarlyOutBypassEnable0_i_2
       (.I0(mulEarlyOutBypassEnable0_i_4_n_0),
        .I1(mulEarlyOutBypassEnable0_i_5_n_0),
        .I2(IMUL_GO),
        .O(mulEarlyOutBypassEnable0_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h01)) 
    mulEarlyOutBypassEnable0_i_3
       (.I0(IN_B[30]),
        .I1(IN_B[24]),
        .I2(\mulResultExp0[8]_i_6_n_0 ),
        .O(mulEarlyOutBypassEnable0_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    mulEarlyOutBypassEnable0_i_4
       (.I0(IN_B[30]),
        .I1(mulResultExp00_carry_i_18_n_0),
        .I2(IN_B[24]),
        .O(mulEarlyOutBypassEnable0_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    mulEarlyOutBypassEnable0_i_5
       (.I0(IN_A[30]),
        .I1(\mulResultExp0[8]_i_4_n_0 ),
        .I2(IN_A[23]),
        .O(mulEarlyOutBypassEnable0_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    mulEarlyOutBypassEnable0_reg
       (.C(clk),
        .CE(1'b1),
        .D(mulEarlyOutBypassEnable0_i_1_n_0),
        .Q(mulEarlyOutBypassEnable0_reg_n_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mulEarlyOutBypassEnable1_reg
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(mulEarlyOutBypassEnable0_reg_n_0),
        .Q(mulEarlyOutBypassEnable1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mulEarlyOutBypassEnable2_reg
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulEarlyOutBypassEnable1),
        .Q(mulEarlyOutBypassEnable2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mulEarlyOutBypassEnable3_reg
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulEarlyOutBypassEnable2),
        .Q(mulEarlyOutBypassEnable3),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mulPipelineValidStage0_reg
       (.C(clk),
        .CE(1'b1),
        .D(IMUL_GO),
        .Q(mulPipelineValidStage0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mulPipelineValidStage1_reg
       (.C(clk),
        .CE(1'b1),
        .D(mulPipelineValidStage0),
        .Q(mulPipelineValidStage1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mulPipelineValidStage2_reg
       (.C(clk),
        .CE(1'b1),
        .D(mulPipelineValidStage1),
        .Q(mulPipelineValidStage2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mulPipelineValidStage3_reg
       (.C(clk),
        .CE(1'b1),
        .D(mulPipelineValidStage2),
        .Q(mulPipelineValidStage3),
        .R(1'b0));
  CARRY8 mulResultExp00_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({mulResultExp00_carry_n_0,mulResultExp00_carry_n_1,mulResultExp00_carry_n_2,mulResultExp00_carry_n_3,mulResultExp00_carry_n_4,mulResultExp00_carry_n_5,mulResultExp00_carry_n_6,mulResultExp00_carry_n_7}),
        .DI({mulResultExp00_carry_i_1_n_0,RESIZE0_in}),
        .O({mulResultExp00_carry_n_8,mulResultExp00_carry_n_9,mulResultExp00_carry_n_10,mulResultExp00_carry_n_11,mulResultExp00_carry_n_12,mulResultExp00_carry_n_13,mulResultExp00_carry_n_14,mulResultExp00_carry_n_15}),
        .S({mulResultExp00_carry_i_9_n_0,mulResultExp00_carry_i_10_n_0,mulResultExp00_carry_i_11_n_0,mulResultExp00_carry_i_12_n_0,mulResultExp00_carry_i_13_n_0,mulResultExp00_carry_i_14_n_0,mulResultExp00_carry_i_15_n_0,mulResultExp00_carry_i_16_n_0}));
  CARRY8 mulResultExp00_carry__0
       (.CI(mulResultExp00_carry_n_0),
        .CI_TOP(1'b0),
        .CO(NLW_mulResultExp00_carry__0_CO_UNCONNECTED[7:0]),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_mulResultExp00_carry__0_O_UNCONNECTED[7:1],mulResultExp00_carry__0_n_15}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1}));
  LUT3 #(
    .INIT(8'hB4)) 
    mulResultExp00_carry_i_1
       (.I0(\mulResultExp0[8]_i_4_n_0 ),
        .I1(IN_A[23]),
        .I2(IN_A[30]),
        .O(mulResultExp00_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h59A6A65959A659A6)) 
    mulResultExp00_carry_i_10
       (.I0(IN_A[29]),
        .I1(IN_A[23]),
        .I2(mulResultExp00_carry_i_17_n_0),
        .I3(IN_B[29]),
        .I4(mulResultExp00_carry_i_19_n_0),
        .I5(IN_B[24]),
        .O(mulResultExp00_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h6966)) 
    mulResultExp00_carry_i_11
       (.I0(RESIZE0_in[5]),
        .I1(IN_B[28]),
        .I2(mulResultExp00_carry_i_20_n_0),
        .I3(IN_B[24]),
        .O(mulResultExp00_carry_i_11_n_0));
  LUT6 #(
    .INIT(64'h9666666666666666)) 
    mulResultExp00_carry_i_12
       (.I0(RESIZE0_in[4]),
        .I1(IN_B[27]),
        .I2(IN_B[26]),
        .I3(IN_B[23]),
        .I4(IN_B[25]),
        .I5(IN_B[24]),
        .O(mulResultExp00_carry_i_12_n_0));
  LUT5 #(
    .INIT(32'h96666666)) 
    mulResultExp00_carry_i_13
       (.I0(RESIZE0_in[3]),
        .I1(IN_B[26]),
        .I2(IN_B[25]),
        .I3(IN_B[23]),
        .I4(IN_B[24]),
        .O(mulResultExp00_carry_i_13_n_0));
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    mulResultExp00_carry_i_14
       (.I0(IN_A[25]),
        .I1(IN_A[23]),
        .I2(IN_A[24]),
        .I3(IN_B[25]),
        .I4(IN_B[23]),
        .I5(IN_B[24]),
        .O(mulResultExp00_carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    mulResultExp00_carry_i_15
       (.I0(IN_A[24]),
        .I1(IN_A[23]),
        .I2(IN_B[24]),
        .I3(IN_B[23]),
        .O(mulResultExp00_carry_i_15_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    mulResultExp00_carry_i_16
       (.I0(IN_A[23]),
        .I1(IN_B[23]),
        .O(mulResultExp00_carry_i_16_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    mulResultExp00_carry_i_17
       (.I0(IN_A[27]),
        .I1(IN_A[25]),
        .I2(IN_A[24]),
        .I3(IN_A[26]),
        .I4(IN_A[28]),
        .O(mulResultExp00_carry_i_17_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    mulResultExp00_carry_i_18
       (.I0(IN_B[28]),
        .I1(IN_B[26]),
        .I2(IN_B[23]),
        .I3(IN_B[25]),
        .I4(IN_B[27]),
        .I5(IN_B[29]),
        .O(mulResultExp00_carry_i_18_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    mulResultExp00_carry_i_19
       (.I0(IN_B[27]),
        .I1(IN_B[25]),
        .I2(IN_B[23]),
        .I3(IN_B[26]),
        .I4(IN_B[28]),
        .O(mulResultExp00_carry_i_19_n_0));
  LUT3 #(
    .INIT(8'hB4)) 
    mulResultExp00_carry_i_2
       (.I0(mulResultExp00_carry_i_17_n_0),
        .I1(IN_A[23]),
        .I2(IN_A[29]),
        .O(RESIZE0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    mulResultExp00_carry_i_20
       (.I0(IN_B[26]),
        .I1(IN_B[23]),
        .I2(IN_B[25]),
        .I3(IN_B[27]),
        .O(mulResultExp00_carry_i_20_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    mulResultExp00_carry_i_3
       (.I0(IN_A[26]),
        .I1(IN_A[24]),
        .I2(IN_A[25]),
        .I3(IN_A[27]),
        .I4(IN_A[23]),
        .I5(IN_A[28]),
        .O(RESIZE0_in[5]));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    mulResultExp00_carry_i_4
       (.I0(IN_A[25]),
        .I1(IN_A[24]),
        .I2(IN_A[26]),
        .I3(IN_A[23]),
        .I4(IN_A[27]),
        .O(RESIZE0_in[4]));
  LUT4 #(
    .INIT(16'h7F80)) 
    mulResultExp00_carry_i_5
       (.I0(IN_A[24]),
        .I1(IN_A[25]),
        .I2(IN_A[23]),
        .I3(IN_A[26]),
        .O(RESIZE0_in[3]));
  LUT3 #(
    .INIT(8'h78)) 
    mulResultExp00_carry_i_6
       (.I0(IN_A[24]),
        .I1(IN_A[23]),
        .I2(IN_A[25]),
        .O(RESIZE0_in[2]));
  LUT2 #(
    .INIT(4'h6)) 
    mulResultExp00_carry_i_7
       (.I0(IN_A[23]),
        .I1(IN_A[24]),
        .O(RESIZE0_in[1]));
  LUT1 #(
    .INIT(2'h1)) 
    mulResultExp00_carry_i_8
       (.I0(IN_A[23]),
        .O(RESIZE0_in[0]));
  LUT6 #(
    .INIT(64'h59A6A65959A659A6)) 
    mulResultExp00_carry_i_9
       (.I0(IN_A[30]),
        .I1(IN_A[23]),
        .I2(\mulResultExp0[8]_i_4_n_0 ),
        .I3(IN_B[30]),
        .I4(mulResultExp00_carry_i_18_n_0),
        .I5(IN_B[24]),
        .O(mulResultExp00_carry_i_9_n_0));
  LUT6 #(
    .INIT(64'hC080C0800080C080)) 
    \mulResultExp0[8]_i_1 
       (.I0(\mulResultExp0[8]_i_2_n_0 ),
        .I1(\mulResultExp0[8]_i_3_n_0 ),
        .I2(IMUL_GO),
        .I3(IN_A[23]),
        .I4(IN_A[30]),
        .I5(\mulResultExp0[8]_i_4_n_0 ),
        .O(mulResultExp0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulResultExp0[8]_i_2 
       (.I0(\mulResultExp0[8]_i_5_n_0 ),
        .I1(IN_A[24]),
        .I2(IN_A[29]),
        .I3(IN_A[30]),
        .O(\mulResultExp0[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hFE3E)) 
    \mulResultExp0[8]_i_3 
       (.I0(\mulResultExp0[8]_i_6_n_0 ),
        .I1(IN_B[30]),
        .I2(IN_B[24]),
        .I3(mulResultExp00_carry_i_18_n_0),
        .O(\mulResultExp0[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \mulResultExp0[8]_i_4 
       (.I0(IN_A[28]),
        .I1(IN_A[26]),
        .I2(IN_A[24]),
        .I3(IN_A[25]),
        .I4(IN_A[27]),
        .I5(IN_A[29]),
        .O(\mulResultExp0[8]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \mulResultExp0[8]_i_5 
       (.I0(IN_A[26]),
        .I1(IN_A[25]),
        .I2(IN_A[28]),
        .I3(IN_A[27]),
        .O(\mulResultExp0[8]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \mulResultExp0[8]_i_6 
       (.I0(IN_B[28]),
        .I1(IN_B[29]),
        .I2(IN_B[26]),
        .I3(IN_B[27]),
        .I4(IN_B[25]),
        .I5(IN_B[23]),
        .O(\mulResultExp0[8]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp0_reg[0] 
       (.C(clk),
        .CE(mulResultExp0),
        .D(mulResultExp00_carry_n_15),
        .Q(\mulResultExp0_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp0_reg[1] 
       (.C(clk),
        .CE(mulResultExp0),
        .D(mulResultExp00_carry_n_14),
        .Q(\mulResultExp0_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp0_reg[2] 
       (.C(clk),
        .CE(mulResultExp0),
        .D(mulResultExp00_carry_n_13),
        .Q(\mulResultExp0_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp0_reg[3] 
       (.C(clk),
        .CE(mulResultExp0),
        .D(mulResultExp00_carry_n_12),
        .Q(\mulResultExp0_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp0_reg[4] 
       (.C(clk),
        .CE(mulResultExp0),
        .D(mulResultExp00_carry_n_11),
        .Q(\mulResultExp0_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp0_reg[5] 
       (.C(clk),
        .CE(mulResultExp0),
        .D(mulResultExp00_carry_n_10),
        .Q(\mulResultExp0_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp0_reg[6] 
       (.C(clk),
        .CE(mulResultExp0),
        .D(mulResultExp00_carry_n_9),
        .Q(\mulResultExp0_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp0_reg[7] 
       (.C(clk),
        .CE(mulResultExp0),
        .D(mulResultExp00_carry_n_8),
        .Q(\mulResultExp0_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp0_reg[8] 
       (.C(clk),
        .CE(mulResultExp0),
        .D(mulResultExp00_carry__0_n_15),
        .Q(\mulResultExp0_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp1_reg[0] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulResultExp0_reg_n_0_[0] ),
        .Q(mulResultExp1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp1_reg[1] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulResultExp0_reg_n_0_[1] ),
        .Q(mulResultExp1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp1_reg[2] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulResultExp0_reg_n_0_[2] ),
        .Q(mulResultExp1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp1_reg[3] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulResultExp0_reg_n_0_[3] ),
        .Q(mulResultExp1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp1_reg[4] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulResultExp0_reg_n_0_[4] ),
        .Q(mulResultExp1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp1_reg[5] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulResultExp0_reg_n_0_[5] ),
        .Q(mulResultExp1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp1_reg[6] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulResultExp0_reg_n_0_[6] ),
        .Q(mulResultExp1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp1_reg[7] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulResultExp0_reg_n_0_[7] ),
        .Q(mulResultExp1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp1_reg[8] 
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(\mulResultExp0_reg_n_0_[8] ),
        .Q(mulResultExp1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp2_reg[0] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultExp1[0]),
        .Q(mulResultExp2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp2_reg[1] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultExp1[1]),
        .Q(mulResultExp2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp2_reg[2] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultExp1[2]),
        .Q(mulResultExp2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp2_reg[3] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultExp1[3]),
        .Q(mulResultExp2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp2_reg[4] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultExp1[4]),
        .Q(mulResultExp2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp2_reg[5] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultExp1[5]),
        .Q(mulResultExp2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp2_reg[6] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultExp1[6]),
        .Q(mulResultExp2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp2_reg[7] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultExp1[7]),
        .Q(mulResultExp2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp2_reg[8] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultExp1[8]),
        .Q(mulResultExp2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp3_reg[0] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultExp2[0]),
        .Q(\mulResultExp3_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp3_reg[1] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultExp2[1]),
        .Q(\mulResultExp3_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp3_reg[2] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultExp2[2]),
        .Q(\mulResultExp3_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp3_reg[3] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultExp2[3]),
        .Q(\mulResultExp3_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp3_reg[4] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultExp2[4]),
        .Q(\mulResultExp3_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp3_reg[5] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultExp2[5]),
        .Q(\mulResultExp3_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp3_reg[6] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultExp2[6]),
        .Q(\mulResultExp3_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp3_reg[7] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultExp2[7]),
        .Q(\mulResultExp3_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultExp3_reg[8] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultExp2[8]),
        .Q(\mulResultExp3_reg_n_0_[8] ),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-11 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(0),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    mulResultMantissa10
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,IN_B[22:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_mulResultMantissa10_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,IN_A[16:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_mulResultMantissa10_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_mulResultMantissa10_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_mulResultMantissa10_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(mulResultExp0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(mulResultExp0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_mulResultMantissa10_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_mulResultMantissa10_OVERFLOW_UNCONNECTED),
        .P({mulResultMantissa10_n_58,mulResultMantissa10_n_59,mulResultMantissa10_n_60,mulResultMantissa10_n_61,mulResultMantissa10_n_62,mulResultMantissa10_n_63,mulResultMantissa10_n_64,mulResultMantissa10_n_65,mulResultMantissa10_n_66,mulResultMantissa10_n_67,mulResultMantissa10_n_68,mulResultMantissa10_n_69,mulResultMantissa10_n_70,mulResultMantissa10_n_71,mulResultMantissa10_n_72,mulResultMantissa10_n_73,mulResultMantissa10_n_74,mulResultMantissa10_n_75,mulResultMantissa10_n_76,mulResultMantissa10_n_77,mulResultMantissa10_n_78,mulResultMantissa10_n_79,mulResultMantissa10_n_80,mulResultMantissa10_n_81,mulResultMantissa10_n_82,mulResultMantissa10_n_83,mulResultMantissa10_n_84,mulResultMantissa10_n_85,mulResultMantissa10_n_86,mulResultMantissa10_n_87,mulResultMantissa10_n_88,mulResultMantissa10_n_89,mulResultMantissa10_n_90,mulResultMantissa10_n_91,mulResultMantissa10_n_92,mulResultMantissa10_n_93,mulResultMantissa10_n_94,mulResultMantissa10_n_95,mulResultMantissa10_n_96,mulResultMantissa10_n_97,mulResultMantissa10_n_98,mulResultMantissa10_n_99,mulResultMantissa10_n_100,mulResultMantissa10_n_101,mulResultMantissa10_n_102,mulResultMantissa10_n_103,mulResultMantissa10_n_104,mulResultMantissa10_n_105}),
        .PATTERNBDETECT(NLW_mulResultMantissa10_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_mulResultMantissa10_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({mulResultMantissa10_n_106,mulResultMantissa10_n_107,mulResultMantissa10_n_108,mulResultMantissa10_n_109,mulResultMantissa10_n_110,mulResultMantissa10_n_111,mulResultMantissa10_n_112,mulResultMantissa10_n_113,mulResultMantissa10_n_114,mulResultMantissa10_n_115,mulResultMantissa10_n_116,mulResultMantissa10_n_117,mulResultMantissa10_n_118,mulResultMantissa10_n_119,mulResultMantissa10_n_120,mulResultMantissa10_n_121,mulResultMantissa10_n_122,mulResultMantissa10_n_123,mulResultMantissa10_n_124,mulResultMantissa10_n_125,mulResultMantissa10_n_126,mulResultMantissa10_n_127,mulResultMantissa10_n_128,mulResultMantissa10_n_129,mulResultMantissa10_n_130,mulResultMantissa10_n_131,mulResultMantissa10_n_132,mulResultMantissa10_n_133,mulResultMantissa10_n_134,mulResultMantissa10_n_135,mulResultMantissa10_n_136,mulResultMantissa10_n_137,mulResultMantissa10_n_138,mulResultMantissa10_n_139,mulResultMantissa10_n_140,mulResultMantissa10_n_141,mulResultMantissa10_n_142,mulResultMantissa10_n_143,mulResultMantissa10_n_144,mulResultMantissa10_n_145,mulResultMantissa10_n_146,mulResultMantissa10_n_147,mulResultMantissa10_n_148,mulResultMantissa10_n_149,mulResultMantissa10_n_150,mulResultMantissa10_n_151,mulResultMantissa10_n_152,mulResultMantissa10_n_153}),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_mulResultMantissa10_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_mulResultMantissa10_XOROUT_UNCONNECTED[7:0]));
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BMULTSEL("B"),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREADDINSEL("A"),
    .PREG(1),
    .RND(48'h000000000000),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48"),
    .USE_WIDEXOR("FALSE"),
    .XORSIMD("XOR24_48_96")) 
    mulResultMantissa1_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,IN_B[22:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_mulResultMantissa1_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,IN_A[22:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_mulResultMantissa1_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_mulResultMantissa1_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_mulResultMantissa1_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(mulResultExp0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(mulResultExp0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(mulResultMantissa1),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_mulResultMantissa1_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_mulResultMantissa1_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_mulResultMantissa1_reg_P_UNCONNECTED[47:31],mulResultMantissa1_reg__0,mulResultMantissa1_reg_n_100,mulResultMantissa1_reg_n_101,mulResultMantissa1_reg_n_102,mulResultMantissa1_reg_n_103,mulResultMantissa1_reg_n_104,mulResultMantissa1_reg_n_105}),
        .PATTERNBDETECT(NLW_mulResultMantissa1_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_mulResultMantissa1_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({mulResultMantissa10_n_106,mulResultMantissa10_n_107,mulResultMantissa10_n_108,mulResultMantissa10_n_109,mulResultMantissa10_n_110,mulResultMantissa10_n_111,mulResultMantissa10_n_112,mulResultMantissa10_n_113,mulResultMantissa10_n_114,mulResultMantissa10_n_115,mulResultMantissa10_n_116,mulResultMantissa10_n_117,mulResultMantissa10_n_118,mulResultMantissa10_n_119,mulResultMantissa10_n_120,mulResultMantissa10_n_121,mulResultMantissa10_n_122,mulResultMantissa10_n_123,mulResultMantissa10_n_124,mulResultMantissa10_n_125,mulResultMantissa10_n_126,mulResultMantissa10_n_127,mulResultMantissa10_n_128,mulResultMantissa10_n_129,mulResultMantissa10_n_130,mulResultMantissa10_n_131,mulResultMantissa10_n_132,mulResultMantissa10_n_133,mulResultMantissa10_n_134,mulResultMantissa10_n_135,mulResultMantissa10_n_136,mulResultMantissa10_n_137,mulResultMantissa10_n_138,mulResultMantissa10_n_139,mulResultMantissa10_n_140,mulResultMantissa10_n_141,mulResultMantissa10_n_142,mulResultMantissa10_n_143,mulResultMantissa10_n_144,mulResultMantissa10_n_145,mulResultMantissa10_n_146,mulResultMantissa10_n_147,mulResultMantissa10_n_148,mulResultMantissa10_n_149,mulResultMantissa10_n_150,mulResultMantissa10_n_151,mulResultMantissa10_n_152,mulResultMantissa10_n_153}),
        .PCOUT(NLW_mulResultMantissa1_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(1'b0),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(1'b0),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_mulResultMantissa1_reg_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_mulResultMantissa1_reg_XOROUT_UNCONNECTED[7:0]));
  LUT2 #(
    .INIT(4'h2)) 
    mulResultMantissa1_reg_i_1
       (.I0(mulPipelineValidStage0),
        .I1(mulEarlyOutBypassEnable0_reg_n_0),
        .O(mulResultMantissa1));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[23] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[23]),
        .Q(mulResultMantissa2[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[24] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[24]),
        .Q(mulResultMantissa2[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[25] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[25]),
        .Q(mulResultMantissa2[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[26] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[26]),
        .Q(mulResultMantissa2[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[27] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[27]),
        .Q(mulResultMantissa2[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[28] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[28]),
        .Q(mulResultMantissa2[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[29] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[29]),
        .Q(mulResultMantissa2[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[30] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[30]),
        .Q(mulResultMantissa2[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[31] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[31]),
        .Q(mulResultMantissa2[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[32] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[32]),
        .Q(mulResultMantissa2[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[33] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[33]),
        .Q(mulResultMantissa2[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[34] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[34]),
        .Q(mulResultMantissa2[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[35] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[35]),
        .Q(mulResultMantissa2[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[36] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[36]),
        .Q(mulResultMantissa2[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[37] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[37]),
        .Q(mulResultMantissa2[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[38] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[38]),
        .Q(mulResultMantissa2[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[39] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[39]),
        .Q(mulResultMantissa2[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[40] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[40]),
        .Q(mulResultMantissa2[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[41] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[41]),
        .Q(mulResultMantissa2[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[42] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[42]),
        .Q(mulResultMantissa2[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[43] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[43]),
        .Q(mulResultMantissa2[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[44] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[44]),
        .Q(mulResultMantissa2[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[45] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[45]),
        .Q(mulResultMantissa2[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[46] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[46]),
        .Q(mulResultMantissa2[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa2_reg[47] 
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultMantissa1_reg__0[47]),
        .Q(mulResultMantissa2[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[23] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[23]),
        .Q(OMUL1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[24] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[24]),
        .Q(OMUL1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[25] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[25]),
        .Q(OMUL1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[26] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[26]),
        .Q(OMUL1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[27] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[27]),
        .Q(OMUL1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[28] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[28]),
        .Q(OMUL1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[29] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[29]),
        .Q(OMUL1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[30] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[30]),
        .Q(OMUL1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[31] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[31]),
        .Q(OMUL1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[32] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[32]),
        .Q(OMUL1[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[33] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[33]),
        .Q(OMUL1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[34] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[34]),
        .Q(OMUL1[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[35] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[35]),
        .Q(OMUL1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[36] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[36]),
        .Q(OMUL1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[37] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[37]),
        .Q(OMUL1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[38] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[38]),
        .Q(OMUL1[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[39] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[39]),
        .Q(OMUL1[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[40] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[40]),
        .Q(OMUL1[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[41] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[41]),
        .Q(OMUL1[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[42] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[42]),
        .Q(OMUL1[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[43] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[43]),
        .Q(OMUL1[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[44] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[44]),
        .Q(OMUL1[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[45] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[45]),
        .Q(OMUL1[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[46] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[46]),
        .Q(OMUL1[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \mulResultMantissa3_reg[47] 
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultMantissa2[47]),
        .Q(OMUL1[24]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h6F60)) 
    mulResultSign0_i_1
       (.I0(IN_B[31]),
        .I1(IN_A[31]),
        .I2(IMUL_GO),
        .I3(mulResultSign0),
        .O(mulResultSign0_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    mulResultSign0_reg
       (.C(clk),
        .CE(1'b1),
        .D(mulResultSign0_i_1_n_0),
        .Q(mulResultSign0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mulResultSign1_reg
       (.C(clk),
        .CE(mulPipelineValidStage0),
        .D(mulResultSign0),
        .Q(mulResultSign1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mulResultSign2_reg
       (.C(clk),
        .CE(mulPipelineValidStage1),
        .D(mulResultSign1),
        .Q(mulResultSign2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    mulResultSign3_reg
       (.C(clk),
        .CE(mulPipelineValidStage2),
        .D(mulResultSign2),
        .Q(mulResultSign3),
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
