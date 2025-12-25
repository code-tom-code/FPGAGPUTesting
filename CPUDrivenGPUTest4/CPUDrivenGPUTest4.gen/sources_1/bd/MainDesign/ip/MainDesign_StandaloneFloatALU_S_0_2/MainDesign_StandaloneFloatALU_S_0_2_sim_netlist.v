// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 17:56:35 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StandaloneFloatALU_S_0_2/MainDesign_StandaloneFloatALU_S_0_2_sim_netlist.v
// Design      : MainDesign_StandaloneFloatALU_S_0_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_StandaloneFloatALU_S_0_2,StandaloneFloatALU_SPEC,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "StandaloneFloatALU_SPEC,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_StandaloneFloatALU_S_0_2
   (clk,
    IN_A,
    OSPEC,
    ISPEC_GO);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  input [31:0]IN_A;
  output [31:0]OSPEC;
  input ISPEC_GO;

  wire [31:0]IN_A;
  wire ISPEC_GO;
  wire [31:0]OSPEC;
  wire clk;

  MainDesign_StandaloneFloatALU_S_0_2_StandaloneFloatALU_SPEC U0
       (.IN_A(IN_A),
        .ISPEC_GO(ISPEC_GO),
        .OSPEC(OSPEC),
        .clk(clk));
endmodule

(* ORIG_REF_NAME = "StandaloneFloatALU_SPEC" *) 
module MainDesign_StandaloneFloatALU_S_0_2_StandaloneFloatALU_SPEC
   (OSPEC,
    clk,
    IN_A,
    ISPEC_GO);
  output [31:0]OSPEC;
  input clk;
  input [31:0]IN_A;
  input ISPEC_GO;

  wire [31:0]IN_A;
  wire ISPEC_GO;
  wire [30:6]L;
  wire [31:0]OSPEC;
  wire [13:0]\RcpLookupTable_Offsets[0]_1 ;
  wire [14:0]\RcpLookupTable_Slopes[0]_0 ;
  wire clk;
  wire i__carry__0_i_1_n_0;
  wire i__carry__0_i_2_n_0;
  wire i__carry__0_i_3_n_0;
  wire i__carry__0_i_4_n_0;
  wire i__carry__0_i_5_n_0;
  wire i__carry__0_i_6_n_0;
  wire i__carry__0_i_7_n_0;
  wire i__carry__0_i_8_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire [31:0]\not ;
  wire [22:0]p_1_in;
  wire [29:7]plusOp;
  wire rAccum0;
  wire rAccumProduct0__0_n_100;
  wire rAccumProduct0__0_n_101;
  wire rAccumProduct0__0_n_102;
  wire rAccumProduct0__0_n_103;
  wire rAccumProduct0__0_n_104;
  wire rAccumProduct0__0_n_105;
  wire rAccumProduct0__0_n_106;
  wire rAccumProduct0__0_n_107;
  wire rAccumProduct0__0_n_108;
  wire rAccumProduct0__0_n_109;
  wire rAccumProduct0__0_n_110;
  wire rAccumProduct0__0_n_111;
  wire rAccumProduct0__0_n_112;
  wire rAccumProduct0__0_n_113;
  wire rAccumProduct0__0_n_114;
  wire rAccumProduct0__0_n_115;
  wire rAccumProduct0__0_n_116;
  wire rAccumProduct0__0_n_117;
  wire rAccumProduct0__0_n_118;
  wire rAccumProduct0__0_n_119;
  wire rAccumProduct0__0_n_120;
  wire rAccumProduct0__0_n_121;
  wire rAccumProduct0__0_n_122;
  wire rAccumProduct0__0_n_123;
  wire rAccumProduct0__0_n_124;
  wire rAccumProduct0__0_n_125;
  wire rAccumProduct0__0_n_126;
  wire rAccumProduct0__0_n_127;
  wire rAccumProduct0__0_n_128;
  wire rAccumProduct0__0_n_129;
  wire rAccumProduct0__0_n_130;
  wire rAccumProduct0__0_n_131;
  wire rAccumProduct0__0_n_132;
  wire rAccumProduct0__0_n_133;
  wire rAccumProduct0__0_n_134;
  wire rAccumProduct0__0_n_135;
  wire rAccumProduct0__0_n_136;
  wire rAccumProduct0__0_n_137;
  wire rAccumProduct0__0_n_138;
  wire rAccumProduct0__0_n_139;
  wire rAccumProduct0__0_n_140;
  wire rAccumProduct0__0_n_141;
  wire rAccumProduct0__0_n_142;
  wire rAccumProduct0__0_n_143;
  wire rAccumProduct0__0_n_144;
  wire rAccumProduct0__0_n_145;
  wire rAccumProduct0__0_n_146;
  wire rAccumProduct0__0_n_147;
  wire rAccumProduct0__0_n_148;
  wire rAccumProduct0__0_n_149;
  wire rAccumProduct0__0_n_150;
  wire rAccumProduct0__0_n_151;
  wire rAccumProduct0__0_n_152;
  wire rAccumProduct0__0_n_153;
  wire rAccumProduct0__0_n_58;
  wire rAccumProduct0__0_n_59;
  wire rAccumProduct0__0_n_60;
  wire rAccumProduct0__0_n_61;
  wire rAccumProduct0__0_n_62;
  wire rAccumProduct0__0_n_63;
  wire rAccumProduct0__0_n_64;
  wire rAccumProduct0__0_n_65;
  wire rAccumProduct0__0_n_66;
  wire rAccumProduct0__0_n_67;
  wire rAccumProduct0__0_n_68;
  wire rAccumProduct0__0_n_69;
  wire rAccumProduct0__0_n_70;
  wire rAccumProduct0__0_n_71;
  wire rAccumProduct0__0_n_72;
  wire rAccumProduct0__0_n_73;
  wire rAccumProduct0__0_n_74;
  wire rAccumProduct0__0_n_75;
  wire rAccumProduct0__0_n_76;
  wire rAccumProduct0__0_n_77;
  wire rAccumProduct0__0_n_78;
  wire rAccumProduct0__0_n_79;
  wire rAccumProduct0__0_n_80;
  wire rAccumProduct0__0_n_81;
  wire rAccumProduct0__0_n_82;
  wire rAccumProduct0__0_n_83;
  wire rAccumProduct0__0_n_84;
  wire rAccumProduct0__0_n_85;
  wire rAccumProduct0__0_n_86;
  wire rAccumProduct0__0_n_87;
  wire rAccumProduct0__0_n_88;
  wire rAccumProduct0__0_n_89;
  wire rAccumProduct0__0_n_90;
  wire rAccumProduct0__0_n_91;
  wire rAccumProduct0__0_n_92;
  wire rAccumProduct0__0_n_93;
  wire rAccumProduct0__0_n_94;
  wire rAccumProduct0__0_n_95;
  wire rAccumProduct0__0_n_96;
  wire rAccumProduct0__0_n_97;
  wire rAccumProduct0__0_n_98;
  wire rAccumProduct0__0_n_99;
  wire rAccumProduct0__1;
  wire rAccumProduct0_i_10_n_0;
  wire rAccumProduct0_i_11_n_0;
  wire rAccumProduct0_i_12_n_0;
  wire rAccumProduct0_i_13_n_0;
  wire rAccumProduct0_i_14_n_0;
  wire rAccumProduct0_i_15_n_0;
  wire rAccumProduct0_i_16_n_0;
  wire rAccumProduct0_i_17_n_0;
  wire rAccumProduct0_i_18_n_0;
  wire rAccumProduct0_i_19_n_0;
  wire rAccumProduct0_i_20_n_0;
  wire rAccumProduct0_i_21_n_0;
  wire rAccumProduct0_i_21_n_1;
  wire rAccumProduct0_i_21_n_2;
  wire rAccumProduct0_i_21_n_3;
  wire rAccumProduct0_i_21_n_4;
  wire rAccumProduct0_i_21_n_5;
  wire rAccumProduct0_i_21_n_6;
  wire rAccumProduct0_i_21_n_7;
  wire rAccumProduct0_i_22_n_0;
  wire rAccumProduct0_i_23_n_0;
  wire rAccumProduct0_i_24_n_0;
  wire rAccumProduct0_i_25_n_0;
  wire rAccumProduct0_i_26_n_0;
  wire rAccumProduct0_i_27_n_0;
  wire rAccumProduct0_i_28_n_0;
  wire rAccumProduct0_i_29_n_0;
  wire rAccumProduct0_i_2_n_0;
  wire rAccumProduct0_i_2_n_1;
  wire rAccumProduct0_i_2_n_2;
  wire rAccumProduct0_i_2_n_3;
  wire rAccumProduct0_i_2_n_4;
  wire rAccumProduct0_i_2_n_5;
  wire rAccumProduct0_i_2_n_6;
  wire rAccumProduct0_i_2_n_7;
  wire rAccumProduct0_i_30_n_0;
  wire rAccumProduct0_i_30_n_1;
  wire rAccumProduct0_i_30_n_2;
  wire rAccumProduct0_i_30_n_3;
  wire rAccumProduct0_i_30_n_4;
  wire rAccumProduct0_i_30_n_5;
  wire rAccumProduct0_i_30_n_6;
  wire rAccumProduct0_i_30_n_7;
  wire rAccumProduct0_i_31_n_0;
  wire rAccumProduct0_i_32_n_0;
  wire rAccumProduct0_i_33_n_0;
  wire rAccumProduct0_i_34_n_0;
  wire rAccumProduct0_i_35_n_0;
  wire rAccumProduct0_i_36_n_0;
  wire rAccumProduct0_i_37_n_0;
  wire rAccumProduct0_i_38_n_0;
  wire rAccumProduct0_i_39_n_0;
  wire rAccumProduct0_i_3_n_0;
  wire rAccumProduct0_i_3_n_1;
  wire rAccumProduct0_i_3_n_2;
  wire rAccumProduct0_i_3_n_3;
  wire rAccumProduct0_i_3_n_4;
  wire rAccumProduct0_i_3_n_5;
  wire rAccumProduct0_i_3_n_6;
  wire rAccumProduct0_i_3_n_7;
  wire rAccumProduct0_i_40_n_0;
  wire rAccumProduct0_i_41_n_0;
  wire rAccumProduct0_i_42_n_0;
  wire rAccumProduct0_i_43_n_0;
  wire rAccumProduct0_i_44_n_0;
  wire rAccumProduct0_i_45_n_0;
  wire rAccumProduct0_i_4_n_0;
  wire rAccumProduct0_i_4_n_1;
  wire rAccumProduct0_i_4_n_2;
  wire rAccumProduct0_i_4_n_3;
  wire rAccumProduct0_i_4_n_4;
  wire rAccumProduct0_i_4_n_5;
  wire rAccumProduct0_i_4_n_6;
  wire rAccumProduct0_i_4_n_7;
  wire rAccumProduct0_i_5_n_0;
  wire rAccumProduct0_i_6_n_0;
  wire rAccumProduct0_i_7_n_0;
  wire rAccumProduct0_i_8_n_0;
  wire rAccumProduct0_i_9_n_0;
  wire rAccumProduct0_n_100;
  wire rAccumProduct0_n_101;
  wire rAccumProduct0_n_102;
  wire rAccumProduct0_n_103;
  wire rAccumProduct0_n_104;
  wire rAccumProduct0_n_105;
  wire rAccumProduct0_n_106;
  wire rAccumProduct0_n_107;
  wire rAccumProduct0_n_108;
  wire rAccumProduct0_n_109;
  wire rAccumProduct0_n_110;
  wire rAccumProduct0_n_111;
  wire rAccumProduct0_n_112;
  wire rAccumProduct0_n_113;
  wire rAccumProduct0_n_114;
  wire rAccumProduct0_n_115;
  wire rAccumProduct0_n_116;
  wire rAccumProduct0_n_117;
  wire rAccumProduct0_n_118;
  wire rAccumProduct0_n_119;
  wire rAccumProduct0_n_120;
  wire rAccumProduct0_n_121;
  wire rAccumProduct0_n_122;
  wire rAccumProduct0_n_123;
  wire rAccumProduct0_n_124;
  wire rAccumProduct0_n_125;
  wire rAccumProduct0_n_126;
  wire rAccumProduct0_n_127;
  wire rAccumProduct0_n_128;
  wire rAccumProduct0_n_129;
  wire rAccumProduct0_n_130;
  wire rAccumProduct0_n_131;
  wire rAccumProduct0_n_132;
  wire rAccumProduct0_n_133;
  wire rAccumProduct0_n_134;
  wire rAccumProduct0_n_135;
  wire rAccumProduct0_n_136;
  wire rAccumProduct0_n_137;
  wire rAccumProduct0_n_138;
  wire rAccumProduct0_n_139;
  wire rAccumProduct0_n_140;
  wire rAccumProduct0_n_141;
  wire rAccumProduct0_n_142;
  wire rAccumProduct0_n_143;
  wire rAccumProduct0_n_144;
  wire rAccumProduct0_n_145;
  wire rAccumProduct0_n_146;
  wire rAccumProduct0_n_147;
  wire rAccumProduct0_n_148;
  wire rAccumProduct0_n_149;
  wire rAccumProduct0_n_150;
  wire rAccumProduct0_n_151;
  wire rAccumProduct0_n_152;
  wire rAccumProduct0_n_153;
  wire rAccumProduct0_n_58;
  wire rAccumProduct0_n_59;
  wire rAccumProduct0_n_60;
  wire rAccumProduct0_n_61;
  wire rAccumProduct0_n_62;
  wire rAccumProduct0_n_63;
  wire rAccumProduct0_n_64;
  wire rAccumProduct0_n_65;
  wire rAccumProduct0_n_66;
  wire rAccumProduct0_n_67;
  wire rAccumProduct0_n_68;
  wire rAccumProduct0_n_69;
  wire rAccumProduct0_n_70;
  wire rAccumProduct0_n_71;
  wire rAccumProduct0_n_72;
  wire rAccumProduct0_n_73;
  wire rAccumProduct0_n_74;
  wire rAccumProduct0_n_75;
  wire rAccumProduct0_n_76;
  wire rAccumProduct0_n_77;
  wire rAccumProduct0_n_78;
  wire rAccumProduct0_n_79;
  wire rAccumProduct0_n_80;
  wire rAccumProduct0_n_81;
  wire rAccumProduct0_n_82;
  wire rAccumProduct0_n_83;
  wire rAccumProduct0_n_84;
  wire rAccumProduct0_n_85;
  wire rAccumProduct0_n_86;
  wire rAccumProduct0_n_87;
  wire rAccumProduct0_n_88;
  wire rAccumProduct0_n_89;
  wire rAccumProduct0_n_90;
  wire rAccumProduct0_n_91;
  wire rAccumProduct0_n_92;
  wire rAccumProduct0_n_93;
  wire rAccumProduct0_n_94;
  wire rAccumProduct0_n_95;
  wire rAccumProduct0_n_96;
  wire rAccumProduct0_n_97;
  wire rAccumProduct0_n_98;
  wire rAccumProduct0_n_99;
  wire \rAccumProduct_reg[16]__0_n_0 ;
  wire rAccumProduct_reg__0_n_100;
  wire rAccumProduct_reg__0_n_101;
  wire rAccumProduct_reg__0_n_102;
  wire rAccumProduct_reg__0_n_103;
  wire rAccumProduct_reg__0_n_104;
  wire rAccumProduct_reg__0_n_105;
  wire rAccumProduct_reg__0_n_58;
  wire rAccumProduct_reg__0_n_59;
  wire rAccumProduct_reg__0_n_60;
  wire rAccumProduct_reg__0_n_61;
  wire rAccumProduct_reg__0_n_62;
  wire rAccumProduct_reg__0_n_63;
  wire rAccumProduct_reg__0_n_64;
  wire rAccumProduct_reg__0_n_65;
  wire rAccumProduct_reg__0_n_66;
  wire rAccumProduct_reg__0_n_67;
  wire rAccumProduct_reg__0_n_68;
  wire rAccumProduct_reg__0_n_69;
  wire rAccumProduct_reg__0_n_70;
  wire rAccumProduct_reg__0_n_71;
  wire rAccumProduct_reg__0_n_72;
  wire rAccumProduct_reg__0_n_73;
  wire rAccumProduct_reg__0_n_74;
  wire rAccumProduct_reg__0_n_75;
  wire rAccumProduct_reg__0_n_76;
  wire rAccumProduct_reg__0_n_77;
  wire rAccumProduct_reg__0_n_78;
  wire rAccumProduct_reg__0_n_79;
  wire rAccumProduct_reg__0_n_80;
  wire rAccumProduct_reg__0_n_81;
  wire rAccumProduct_reg__0_n_82;
  wire rAccumProduct_reg__0_n_83;
  wire rAccumProduct_reg__0_n_84;
  wire rAccumProduct_reg__0_n_85;
  wire rAccumProduct_reg__0_n_86;
  wire rAccumProduct_reg__0_n_87;
  wire rAccumProduct_reg__0_n_88;
  wire rAccumProduct_reg__0_n_89;
  wire rAccumProduct_reg__0_n_90;
  wire rAccumProduct_reg__0_n_91;
  wire rAccumProduct_reg__0_n_92;
  wire rAccumProduct_reg__0_n_93;
  wire rAccumProduct_reg__0_n_94;
  wire rAccumProduct_reg__0_n_95;
  wire rAccumProduct_reg__0_n_96;
  wire rAccumProduct_reg__0_n_97;
  wire rAccumProduct_reg__0_n_98;
  wire rAccumProduct_reg__0_n_99;
  wire [63:48]rAccumProduct_reg__1;
  wire rAccumProduct_reg_i_1_n_1;
  wire rAccumProduct_reg_i_1_n_2;
  wire rAccumProduct_reg_i_1_n_3;
  wire rAccumProduct_reg_i_1_n_4;
  wire rAccumProduct_reg_i_1_n_5;
  wire rAccumProduct_reg_i_1_n_6;
  wire rAccumProduct_reg_i_1_n_7;
  wire rAccumProduct_reg_i_2_n_0;
  wire rAccumProduct_reg_i_3_n_0;
  wire rAccumProduct_reg_i_4_n_0;
  wire rAccumProduct_reg_i_5_n_0;
  wire rAccumProduct_reg_i_6_n_0;
  wire rAccumProduct_reg_i_7_n_0;
  wire rAccumProduct_reg_i_8_n_0;
  wire rAccumProduct_reg_i_9_n_0;
  wire \rAccumProduct_reg_n_0_[0] ;
  wire \rAccumProduct_reg_n_0_[10] ;
  wire \rAccumProduct_reg_n_0_[11] ;
  wire \rAccumProduct_reg_n_0_[12] ;
  wire \rAccumProduct_reg_n_0_[13] ;
  wire \rAccumProduct_reg_n_0_[14] ;
  wire \rAccumProduct_reg_n_0_[15] ;
  wire \rAccumProduct_reg_n_0_[16] ;
  wire \rAccumProduct_reg_n_0_[1] ;
  wire \rAccumProduct_reg_n_0_[2] ;
  wire \rAccumProduct_reg_n_0_[3] ;
  wire \rAccumProduct_reg_n_0_[4] ;
  wire \rAccumProduct_reg_n_0_[5] ;
  wire \rAccumProduct_reg_n_0_[6] ;
  wire \rAccumProduct_reg_n_0_[7] ;
  wire \rAccumProduct_reg_n_0_[8] ;
  wire \rAccumProduct_reg_n_0_[9] ;
  wire rAccumProduct_reg_n_100;
  wire rAccumProduct_reg_n_101;
  wire rAccumProduct_reg_n_102;
  wire rAccumProduct_reg_n_103;
  wire rAccumProduct_reg_n_104;
  wire rAccumProduct_reg_n_105;
  wire rAccumProduct_reg_n_58;
  wire rAccumProduct_reg_n_59;
  wire rAccumProduct_reg_n_60;
  wire rAccumProduct_reg_n_61;
  wire rAccumProduct_reg_n_62;
  wire rAccumProduct_reg_n_63;
  wire rAccumProduct_reg_n_64;
  wire rAccumProduct_reg_n_65;
  wire rAccumProduct_reg_n_66;
  wire rAccumProduct_reg_n_67;
  wire rAccumProduct_reg_n_68;
  wire rAccumProduct_reg_n_69;
  wire rAccumProduct_reg_n_70;
  wire rAccumProduct_reg_n_71;
  wire rAccumProduct_reg_n_72;
  wire rAccumProduct_reg_n_73;
  wire rAccumProduct_reg_n_74;
  wire rAccumProduct_reg_n_75;
  wire rAccumProduct_reg_n_76;
  wire rAccumProduct_reg_n_77;
  wire rAccumProduct_reg_n_78;
  wire rAccumProduct_reg_n_79;
  wire rAccumProduct_reg_n_80;
  wire rAccumProduct_reg_n_81;
  wire rAccumProduct_reg_n_82;
  wire rAccumProduct_reg_n_83;
  wire rAccumProduct_reg_n_84;
  wire rAccumProduct_reg_n_85;
  wire rAccumProduct_reg_n_86;
  wire rAccumProduct_reg_n_87;
  wire rAccumProduct_reg_n_88;
  wire rAccumProduct_reg_n_89;
  wire rAccumProduct_reg_n_90;
  wire rAccumProduct_reg_n_91;
  wire rAccumProduct_reg_n_92;
  wire rAccumProduct_reg_n_93;
  wire rAccumProduct_reg_n_94;
  wire rAccumProduct_reg_n_95;
  wire rAccumProduct_reg_n_96;
  wire rAccumProduct_reg_n_97;
  wire rAccumProduct_reg_n_98;
  wire rAccumProduct_reg_n_99;
  wire \rAccum[15]_i_11_n_0 ;
  wire \rAccum[15]_i_12_n_0 ;
  wire \rAccum[15]_i_13_n_0 ;
  wire \rAccum[15]_i_14_n_0 ;
  wire \rAccum[15]_i_15_n_0 ;
  wire \rAccum[15]_i_16_n_0 ;
  wire \rAccum[15]_i_17_n_0 ;
  wire \rAccum[15]_i_18_n_0 ;
  wire \rAccum[15]_i_2_n_0 ;
  wire \rAccum[15]_i_3_n_0 ;
  wire \rAccum[15]_i_4_n_0 ;
  wire \rAccum[15]_i_5_n_0 ;
  wire \rAccum[15]_i_6_n_0 ;
  wire \rAccum[15]_i_7_n_0 ;
  wire \rAccum[15]_i_8_n_0 ;
  wire \rAccum[15]_i_9_n_0 ;
  wire \rAccum[7]_i_12_n_0 ;
  wire \rAccum[7]_i_13_n_0 ;
  wire \rAccum[7]_i_14_n_0 ;
  wire \rAccum[7]_i_15_n_0 ;
  wire \rAccum[7]_i_16_n_0 ;
  wire \rAccum[7]_i_17_n_0 ;
  wire \rAccum[7]_i_18_n_0 ;
  wire \rAccum[7]_i_19_n_0 ;
  wire \rAccum[7]_i_21_n_0 ;
  wire \rAccum[7]_i_22_n_0 ;
  wire \rAccum[7]_i_23_n_0 ;
  wire \rAccum[7]_i_24_n_0 ;
  wire \rAccum[7]_i_25_n_0 ;
  wire \rAccum[7]_i_26_n_0 ;
  wire \rAccum[7]_i_27_n_0 ;
  wire \rAccum[7]_i_28_n_0 ;
  wire \rAccum[7]_i_2_n_0 ;
  wire \rAccum[7]_i_30_n_0 ;
  wire \rAccum[7]_i_31_n_0 ;
  wire \rAccum[7]_i_32_n_0 ;
  wire \rAccum[7]_i_33_n_0 ;
  wire \rAccum[7]_i_34_n_0 ;
  wire \rAccum[7]_i_35_n_0 ;
  wire \rAccum[7]_i_36_n_0 ;
  wire \rAccum[7]_i_37_n_0 ;
  wire \rAccum[7]_i_39_n_0 ;
  wire \rAccum[7]_i_3_n_0 ;
  wire \rAccum[7]_i_40_n_0 ;
  wire \rAccum[7]_i_41_n_0 ;
  wire \rAccum[7]_i_42_n_0 ;
  wire \rAccum[7]_i_43_n_0 ;
  wire \rAccum[7]_i_44_n_0 ;
  wire \rAccum[7]_i_45_n_0 ;
  wire \rAccum[7]_i_46_n_0 ;
  wire \rAccum[7]_i_47_n_0 ;
  wire \rAccum[7]_i_48_n_0 ;
  wire \rAccum[7]_i_49_n_0 ;
  wire \rAccum[7]_i_4_n_0 ;
  wire \rAccum[7]_i_50_n_0 ;
  wire \rAccum[7]_i_51_n_0 ;
  wire \rAccum[7]_i_52_n_0 ;
  wire \rAccum[7]_i_53_n_0 ;
  wire \rAccum[7]_i_5_n_0 ;
  wire \rAccum[7]_i_6_n_0 ;
  wire \rAccum[7]_i_7_n_0 ;
  wire \rAccum[7]_i_8_n_0 ;
  wire \rAccum[7]_i_9_n_0 ;
  wire \rAccum_reg[15]_i_10_n_1 ;
  wire \rAccum_reg[15]_i_10_n_2 ;
  wire \rAccum_reg[15]_i_10_n_3 ;
  wire \rAccum_reg[15]_i_10_n_4 ;
  wire \rAccum_reg[15]_i_10_n_5 ;
  wire \rAccum_reg[15]_i_10_n_6 ;
  wire \rAccum_reg[15]_i_10_n_7 ;
  wire \rAccum_reg[15]_i_1_n_0 ;
  wire \rAccum_reg[15]_i_1_n_1 ;
  wire \rAccum_reg[15]_i_1_n_10 ;
  wire \rAccum_reg[15]_i_1_n_11 ;
  wire \rAccum_reg[15]_i_1_n_12 ;
  wire \rAccum_reg[15]_i_1_n_13 ;
  wire \rAccum_reg[15]_i_1_n_14 ;
  wire \rAccum_reg[15]_i_1_n_15 ;
  wire \rAccum_reg[15]_i_1_n_2 ;
  wire \rAccum_reg[15]_i_1_n_3 ;
  wire \rAccum_reg[15]_i_1_n_4 ;
  wire \rAccum_reg[15]_i_1_n_5 ;
  wire \rAccum_reg[15]_i_1_n_6 ;
  wire \rAccum_reg[15]_i_1_n_7 ;
  wire \rAccum_reg[15]_i_1_n_8 ;
  wire \rAccum_reg[15]_i_1_n_9 ;
  wire \rAccum_reg[23]_i_1_n_0 ;
  wire \rAccum_reg[23]_i_1_n_1 ;
  wire \rAccum_reg[23]_i_1_n_10 ;
  wire \rAccum_reg[23]_i_1_n_11 ;
  wire \rAccum_reg[23]_i_1_n_12 ;
  wire \rAccum_reg[23]_i_1_n_13 ;
  wire \rAccum_reg[23]_i_1_n_14 ;
  wire \rAccum_reg[23]_i_1_n_15 ;
  wire \rAccum_reg[23]_i_1_n_2 ;
  wire \rAccum_reg[23]_i_1_n_3 ;
  wire \rAccum_reg[23]_i_1_n_4 ;
  wire \rAccum_reg[23]_i_1_n_5 ;
  wire \rAccum_reg[23]_i_1_n_6 ;
  wire \rAccum_reg[23]_i_1_n_7 ;
  wire \rAccum_reg[23]_i_1_n_8 ;
  wire \rAccum_reg[23]_i_1_n_9 ;
  wire \rAccum_reg[30]_i_2_n_10 ;
  wire \rAccum_reg[30]_i_2_n_11 ;
  wire \rAccum_reg[30]_i_2_n_12 ;
  wire \rAccum_reg[30]_i_2_n_13 ;
  wire \rAccum_reg[30]_i_2_n_14 ;
  wire \rAccum_reg[30]_i_2_n_15 ;
  wire \rAccum_reg[30]_i_2_n_2 ;
  wire \rAccum_reg[30]_i_2_n_3 ;
  wire \rAccum_reg[30]_i_2_n_4 ;
  wire \rAccum_reg[30]_i_2_n_5 ;
  wire \rAccum_reg[30]_i_2_n_6 ;
  wire \rAccum_reg[30]_i_2_n_7 ;
  wire \rAccum_reg[30]_i_2_n_9 ;
  wire \rAccum_reg[7]_i_10_n_0 ;
  wire \rAccum_reg[7]_i_10_n_1 ;
  wire \rAccum_reg[7]_i_10_n_2 ;
  wire \rAccum_reg[7]_i_10_n_3 ;
  wire \rAccum_reg[7]_i_10_n_4 ;
  wire \rAccum_reg[7]_i_10_n_5 ;
  wire \rAccum_reg[7]_i_10_n_6 ;
  wire \rAccum_reg[7]_i_10_n_7 ;
  wire \rAccum_reg[7]_i_11_n_0 ;
  wire \rAccum_reg[7]_i_11_n_1 ;
  wire \rAccum_reg[7]_i_11_n_2 ;
  wire \rAccum_reg[7]_i_11_n_3 ;
  wire \rAccum_reg[7]_i_11_n_4 ;
  wire \rAccum_reg[7]_i_11_n_5 ;
  wire \rAccum_reg[7]_i_11_n_6 ;
  wire \rAccum_reg[7]_i_11_n_7 ;
  wire \rAccum_reg[7]_i_1_n_0 ;
  wire \rAccum_reg[7]_i_1_n_1 ;
  wire \rAccum_reg[7]_i_1_n_2 ;
  wire \rAccum_reg[7]_i_1_n_3 ;
  wire \rAccum_reg[7]_i_1_n_4 ;
  wire \rAccum_reg[7]_i_1_n_5 ;
  wire \rAccum_reg[7]_i_1_n_6 ;
  wire \rAccum_reg[7]_i_1_n_7 ;
  wire \rAccum_reg[7]_i_1_n_8 ;
  wire \rAccum_reg[7]_i_1_n_9 ;
  wire \rAccum_reg[7]_i_20_n_0 ;
  wire \rAccum_reg[7]_i_20_n_1 ;
  wire \rAccum_reg[7]_i_20_n_2 ;
  wire \rAccum_reg[7]_i_20_n_3 ;
  wire \rAccum_reg[7]_i_20_n_4 ;
  wire \rAccum_reg[7]_i_20_n_5 ;
  wire \rAccum_reg[7]_i_20_n_6 ;
  wire \rAccum_reg[7]_i_20_n_7 ;
  wire \rAccum_reg[7]_i_29_n_0 ;
  wire \rAccum_reg[7]_i_29_n_1 ;
  wire \rAccum_reg[7]_i_29_n_2 ;
  wire \rAccum_reg[7]_i_29_n_3 ;
  wire \rAccum_reg[7]_i_29_n_4 ;
  wire \rAccum_reg[7]_i_29_n_5 ;
  wire \rAccum_reg[7]_i_29_n_6 ;
  wire \rAccum_reg[7]_i_29_n_7 ;
  wire \rAccum_reg[7]_i_38_n_0 ;
  wire \rAccum_reg[7]_i_38_n_1 ;
  wire \rAccum_reg[7]_i_38_n_2 ;
  wire \rAccum_reg[7]_i_38_n_3 ;
  wire \rAccum_reg[7]_i_38_n_4 ;
  wire \rAccum_reg[7]_i_38_n_5 ;
  wire \rAccum_reg[7]_i_38_n_6 ;
  wire \rAccum_reg[7]_i_38_n_7 ;
  wire [15:0]rInitialGuess0;
  wire rInitialGuess00;
  wire [15:0]rInitialGuess000_in;
  wire \rInitialGuess00_inferred__0/i__carry__0_n_1 ;
  wire \rInitialGuess00_inferred__0/i__carry__0_n_2 ;
  wire \rInitialGuess00_inferred__0/i__carry__0_n_3 ;
  wire \rInitialGuess00_inferred__0/i__carry__0_n_4 ;
  wire \rInitialGuess00_inferred__0/i__carry__0_n_5 ;
  wire \rInitialGuess00_inferred__0/i__carry__0_n_6 ;
  wire \rInitialGuess00_inferred__0/i__carry__0_n_7 ;
  wire \rInitialGuess00_inferred__0/i__carry_n_0 ;
  wire \rInitialGuess00_inferred__0/i__carry_n_1 ;
  wire \rInitialGuess00_inferred__0/i__carry_n_2 ;
  wire \rInitialGuess00_inferred__0/i__carry_n_3 ;
  wire \rInitialGuess00_inferred__0/i__carry_n_4 ;
  wire \rInitialGuess00_inferred__0/i__carry_n_5 ;
  wire \rInitialGuess00_inferred__0/i__carry_n_6 ;
  wire \rInitialGuess00_inferred__0/i__carry_n_7 ;
  wire [15:0]rInitialGuess1;
  wire [15:0]rInitialGuess2;
  wire [15:0]rInitialGuess3;
  wire rProduct0__0;
  wire rProduct0_n_100;
  wire rProduct0_n_101;
  wire rProduct0_n_102;
  wire rProduct0_n_103;
  wire rProduct0_n_104;
  wire rProduct0_n_105;
  wire rProduct0_n_106;
  wire rProduct0_n_107;
  wire rProduct0_n_108;
  wire rProduct0_n_109;
  wire rProduct0_n_110;
  wire rProduct0_n_111;
  wire rProduct0_n_112;
  wire rProduct0_n_113;
  wire rProduct0_n_114;
  wire rProduct0_n_115;
  wire rProduct0_n_116;
  wire rProduct0_n_117;
  wire rProduct0_n_118;
  wire rProduct0_n_119;
  wire rProduct0_n_120;
  wire rProduct0_n_121;
  wire rProduct0_n_122;
  wire rProduct0_n_123;
  wire rProduct0_n_124;
  wire rProduct0_n_125;
  wire rProduct0_n_126;
  wire rProduct0_n_127;
  wire rProduct0_n_128;
  wire rProduct0_n_129;
  wire rProduct0_n_130;
  wire rProduct0_n_131;
  wire rProduct0_n_132;
  wire rProduct0_n_133;
  wire rProduct0_n_134;
  wire rProduct0_n_135;
  wire rProduct0_n_136;
  wire rProduct0_n_137;
  wire rProduct0_n_138;
  wire rProduct0_n_139;
  wire rProduct0_n_140;
  wire rProduct0_n_141;
  wire rProduct0_n_142;
  wire rProduct0_n_143;
  wire rProduct0_n_144;
  wire rProduct0_n_145;
  wire rProduct0_n_146;
  wire rProduct0_n_147;
  wire rProduct0_n_148;
  wire rProduct0_n_149;
  wire rProduct0_n_150;
  wire rProduct0_n_151;
  wire rProduct0_n_152;
  wire rProduct0_n_153;
  wire rProduct0_n_58;
  wire rProduct0_n_59;
  wire rProduct0_n_60;
  wire rProduct0_n_61;
  wire rProduct0_n_62;
  wire rProduct0_n_63;
  wire rProduct0_n_64;
  wire rProduct0_n_65;
  wire rProduct0_n_66;
  wire rProduct0_n_67;
  wire rProduct0_n_68;
  wire rProduct0_n_69;
  wire rProduct0_n_70;
  wire rProduct0_n_71;
  wire rProduct0_n_72;
  wire rProduct0_n_73;
  wire rProduct0_n_74;
  wire rProduct0_n_75;
  wire rProduct0_n_76;
  wire rProduct0_n_77;
  wire rProduct0_n_78;
  wire rProduct0_n_79;
  wire rProduct0_n_80;
  wire rProduct0_n_81;
  wire rProduct0_n_82;
  wire rProduct0_n_83;
  wire rProduct0_n_84;
  wire rProduct0_n_85;
  wire rProduct0_n_86;
  wire rProduct0_n_87;
  wire rProduct0_n_88;
  wire rProduct0_n_89;
  wire rProduct0_n_90;
  wire rProduct0_n_91;
  wire rProduct0_n_92;
  wire rProduct0_n_93;
  wire rProduct0_n_94;
  wire rProduct0_n_95;
  wire rProduct0_n_96;
  wire rProduct0_n_97;
  wire rProduct0_n_98;
  wire rProduct0_n_99;
  wire [47:24]rProduct_reg__0;
  wire rProduct_reg_n_100;
  wire rProduct_reg_n_101;
  wire rProduct_reg_n_102;
  wire rProduct_reg_n_103;
  wire rProduct_reg_n_104;
  wire rProduct_reg_n_105;
  wire rProduct_reg_n_58;
  wire rProduct_reg_n_59;
  wire rProduct_reg_n_60;
  wire rProduct_reg_n_61;
  wire rProduct_reg_n_62;
  wire rProduct_reg_n_63;
  wire rProduct_reg_n_64;
  wire rProduct_reg_n_65;
  wire rProduct_reg_n_66;
  wire rProduct_reg_n_67;
  wire rProduct_reg_n_68;
  wire rProduct_reg_n_69;
  wire rProduct_reg_n_70;
  wire rProduct_reg_n_71;
  wire rProduct_reg_n_72;
  wire rProduct_reg_n_73;
  wire rProduct_reg_n_74;
  wire rProduct_reg_n_99;
  wire [31:0]rRefined0;
  wire rRefined00;
  wire \rRefined0[22]_i_2_n_0 ;
  wire \rRefined0[22]_i_3_n_0 ;
  wire \rRefined0[22]_i_4_n_0 ;
  wire \rRefined0[22]_i_5_n_0 ;
  wire \rRefined0[22]_i_6_n_0 ;
  wire \rRefined0[22]_i_7_n_0 ;
  wire \rRefined0[22]_i_8_n_0 ;
  wire \rRefined0[30]_i_2_n_0 ;
  wire \rRefined0_reg[22]_i_1_n_0 ;
  wire \rRefined0_reg[22]_i_1_n_1 ;
  wire \rRefined0_reg[22]_i_1_n_10 ;
  wire \rRefined0_reg[22]_i_1_n_11 ;
  wire \rRefined0_reg[22]_i_1_n_12 ;
  wire \rRefined0_reg[22]_i_1_n_13 ;
  wire \rRefined0_reg[22]_i_1_n_14 ;
  wire \rRefined0_reg[22]_i_1_n_15 ;
  wire \rRefined0_reg[22]_i_1_n_2 ;
  wire \rRefined0_reg[22]_i_1_n_3 ;
  wire \rRefined0_reg[22]_i_1_n_4 ;
  wire \rRefined0_reg[22]_i_1_n_5 ;
  wire \rRefined0_reg[22]_i_1_n_6 ;
  wire \rRefined0_reg[22]_i_1_n_7 ;
  wire \rRefined0_reg[22]_i_1_n_8 ;
  wire \rRefined0_reg[22]_i_1_n_9 ;
  wire \rRefined0_reg[30]_i_1_n_0 ;
  wire \rRefined0_reg[30]_i_1_n_1 ;
  wire \rRefined0_reg[30]_i_1_n_10 ;
  wire \rRefined0_reg[30]_i_1_n_11 ;
  wire \rRefined0_reg[30]_i_1_n_12 ;
  wire \rRefined0_reg[30]_i_1_n_13 ;
  wire \rRefined0_reg[30]_i_1_n_14 ;
  wire \rRefined0_reg[30]_i_1_n_15 ;
  wire \rRefined0_reg[30]_i_1_n_2 ;
  wire \rRefined0_reg[30]_i_1_n_3 ;
  wire \rRefined0_reg[30]_i_1_n_4 ;
  wire \rRefined0_reg[30]_i_1_n_5 ;
  wire \rRefined0_reg[30]_i_1_n_6 ;
  wire \rRefined0_reg[30]_i_1_n_7 ;
  wire \rRefined0_reg[30]_i_1_n_8 ;
  wire \rRefined0_reg[30]_i_1_n_9 ;
  wire \rRefined0_reg[31]_i_2_n_15 ;
  wire [30:0]rRefined1;
  wire \rRefined2_reg_n_0_[0] ;
  wire \rRefined2_reg_n_0_[10] ;
  wire \rRefined2_reg_n_0_[11] ;
  wire \rRefined2_reg_n_0_[12] ;
  wire \rRefined2_reg_n_0_[13] ;
  wire \rRefined2_reg_n_0_[14] ;
  wire \rRefined2_reg_n_0_[15] ;
  wire \rRefined2_reg_n_0_[16] ;
  wire \rRefined2_reg_n_0_[17] ;
  wire \rRefined2_reg_n_0_[18] ;
  wire \rRefined2_reg_n_0_[19] ;
  wire \rRefined2_reg_n_0_[1] ;
  wire \rRefined2_reg_n_0_[20] ;
  wire \rRefined2_reg_n_0_[21] ;
  wire \rRefined2_reg_n_0_[22] ;
  wire \rRefined2_reg_n_0_[23] ;
  wire \rRefined2_reg_n_0_[24] ;
  wire \rRefined2_reg_n_0_[25] ;
  wire \rRefined2_reg_n_0_[26] ;
  wire \rRefined2_reg_n_0_[27] ;
  wire \rRefined2_reg_n_0_[28] ;
  wire \rRefined2_reg_n_0_[29] ;
  wire \rRefined2_reg_n_0_[2] ;
  wire \rRefined2_reg_n_0_[30] ;
  wire \rRefined2_reg_n_0_[3] ;
  wire \rRefined2_reg_n_0_[4] ;
  wire \rRefined2_reg_n_0_[5] ;
  wire \rRefined2_reg_n_0_[6] ;
  wire \rRefined2_reg_n_0_[7] ;
  wire \rRefined2_reg_n_0_[8] ;
  wire \rRefined2_reg_n_0_[9] ;
  wire [30:0]rRefined3;
  wire [15:0]rcpLookupOffset0;
  wire \rcpLookupOffset0[14]_i_1_n_0 ;
  wire [15:0]rcpLookupOffset1;
  wire rcpLookupSlope0;
  wire \rcpPipeline[0][calculatedMantissa][0]_i_1_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][19]_i_1_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][1]_i_1_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][20]_i_1_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][21]_i_1_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_10_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_11_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_12_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_13_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_1_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_6_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_7_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_8_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][22]_i_9_n_0 ;
  wire \rcpPipeline[0][calculatedMantissa][2]_i_1_n_0 ;
  wire \rcpPipeline[0][rcpExponent][0]_i_1_n_0 ;
  wire \rcpPipeline[0][rcpExponent][0]_i_2_n_0 ;
  wire \rcpPipeline[0][rcpExponent][1]_i_1_n_0 ;
  wire \rcpPipeline[0][rcpExponent][2]_i_1_n_0 ;
  wire \rcpPipeline[0][rcpExponent][3]_i_1_n_0 ;
  wire \rcpPipeline[0][rcpExponent][4]_i_1_n_0 ;
  wire \rcpPipeline[0][rcpExponent][4]_i_2_n_0 ;
  wire \rcpPipeline[0][rcpExponent][5]_i_1_n_0 ;
  wire \rcpPipeline[0][rcpExponent][5]_i_2_n_0 ;
  wire \rcpPipeline[0][rcpExponent][6]_i_1_n_0 ;
  wire \rcpPipeline[0][rcpExponent][7]_i_1_n_0 ;
  wire \rcpPipeline[0][useEarlyOutBypass]_i_1_n_0 ;
  wire [22:0]\rcpPipeline_reg[0][calculatedMantissa] ;
  wire \rcpPipeline_reg[0][pipeStageIsValid]__0 ;
  wire [7:0]\rcpPipeline_reg[0][rcpExponent] ;
  wire \rcpPipeline_reg[0][rcpSign]__0 ;
  wire \rcpPipeline_reg[0][useEarlyOutBypass_n_0_] ;
  wire \rcpPipeline_reg[10][pipeStageIsValid]__0 ;
  wire \rcpPipeline_reg[10][useEarlyOutBypass_n_0_] ;
  wire \rcpPipeline_reg[11][calculatedMantissa][0]_srl10_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][10]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][11]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][12]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][13]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][14]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][15]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][16]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][17]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][18]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][19]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][1]_srl10_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][20]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][21]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][22]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][2]_srl10_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][3]_srl10_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][4]_srl10_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][5]_srl10_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][6]_srl10_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][7]_srl10_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][8]_srl10_n_0 ;
  wire \rcpPipeline_reg[11][calculatedMantissa][9]_srl8_n_0 ;
  wire \rcpPipeline_reg[11][pipeStageIsValid]__0 ;
  wire \rcpPipeline_reg[11][useEarlyOutBypass_n_0_] ;
  wire [22:0]\rcpPipeline_reg[12][calculatedMantissa] ;
  wire \rcpPipeline_reg[12][pipeStageIsValid]__0 ;
  wire [7:0]\rcpPipeline_reg[12][rcpExponent] ;
  wire \rcpPipeline_reg[12][rcpSign] ;
  wire \rcpPipeline_reg[12][useEarlyOutBypass]__0 ;
  wire [8:0]\rcpPipeline_reg[1][calculatedMantissa] ;
  wire \rcpPipeline_reg[1][pipeStageIsValid]__0 ;
  wire \rcpPipeline_reg[1][useEarlyOutBypass_n_0_] ;
  wire \rcpPipeline_reg[2][calculatedMantissa][10]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][11]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][12]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][13]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][14]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][15]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][16]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][17]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][18]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][19]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][20]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][21]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][22]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][calculatedMantissa][9]_srl2_n_0 ;
  wire \rcpPipeline_reg[2][pipeStageIsValid]__0 ;
  wire \rcpPipeline_reg[2][useEarlyOutBypass_n_0_] ;
  wire [22:9]\rcpPipeline_reg[3][calculatedMantissa] ;
  wire \rcpPipeline_reg[3][pipeStageIsValid]__0 ;
  wire \rcpPipeline_reg[3][useEarlyOutBypass_n_0_] ;
  wire \rcpPipeline_reg[4][pipeStageIsValid]__0 ;
  wire \rcpPipeline_reg[4][useEarlyOutBypass_n_0_] ;
  wire \rcpPipeline_reg[5][pipeStageIsValid]__0 ;
  wire \rcpPipeline_reg[5][useEarlyOutBypass_n_0_] ;
  wire \rcpPipeline_reg[6][pipeStageIsValid]__0 ;
  wire \rcpPipeline_reg[6][useEarlyOutBypass_n_0_] ;
  wire \rcpPipeline_reg[7][pipeStageIsValid]__0 ;
  wire \rcpPipeline_reg[7][useEarlyOutBypass_n_0_] ;
  wire \rcpPipeline_reg[8][pipeStageIsValid]__0 ;
  wire \rcpPipeline_reg[8][useEarlyOutBypass_n_0_] ;
  wire \rcpPipeline_reg[9][pipeStageIsValid]__0 ;
  wire \rcpPipeline_reg[9][useEarlyOutBypass_n_0_] ;
  wire rcpSigma00;
  wire rcpSqrSigma00;
  wire rcpSqrSigma0Product0__0_n_100;
  wire rcpSqrSigma0Product0__0_n_101;
  wire rcpSqrSigma0Product0__0_n_102;
  wire rcpSqrSigma0Product0__0_n_103;
  wire rcpSqrSigma0Product0__0_n_104;
  wire rcpSqrSigma0Product0__0_n_105;
  wire rcpSqrSigma0Product0__0_n_106;
  wire rcpSqrSigma0Product0__0_n_107;
  wire rcpSqrSigma0Product0__0_n_108;
  wire rcpSqrSigma0Product0__0_n_109;
  wire rcpSqrSigma0Product0__0_n_110;
  wire rcpSqrSigma0Product0__0_n_111;
  wire rcpSqrSigma0Product0__0_n_112;
  wire rcpSqrSigma0Product0__0_n_113;
  wire rcpSqrSigma0Product0__0_n_114;
  wire rcpSqrSigma0Product0__0_n_115;
  wire rcpSqrSigma0Product0__0_n_116;
  wire rcpSqrSigma0Product0__0_n_117;
  wire rcpSqrSigma0Product0__0_n_118;
  wire rcpSqrSigma0Product0__0_n_119;
  wire rcpSqrSigma0Product0__0_n_120;
  wire rcpSqrSigma0Product0__0_n_121;
  wire rcpSqrSigma0Product0__0_n_122;
  wire rcpSqrSigma0Product0__0_n_123;
  wire rcpSqrSigma0Product0__0_n_124;
  wire rcpSqrSigma0Product0__0_n_125;
  wire rcpSqrSigma0Product0__0_n_126;
  wire rcpSqrSigma0Product0__0_n_127;
  wire rcpSqrSigma0Product0__0_n_128;
  wire rcpSqrSigma0Product0__0_n_129;
  wire rcpSqrSigma0Product0__0_n_130;
  wire rcpSqrSigma0Product0__0_n_131;
  wire rcpSqrSigma0Product0__0_n_132;
  wire rcpSqrSigma0Product0__0_n_133;
  wire rcpSqrSigma0Product0__0_n_134;
  wire rcpSqrSigma0Product0__0_n_135;
  wire rcpSqrSigma0Product0__0_n_136;
  wire rcpSqrSigma0Product0__0_n_137;
  wire rcpSqrSigma0Product0__0_n_138;
  wire rcpSqrSigma0Product0__0_n_139;
  wire rcpSqrSigma0Product0__0_n_140;
  wire rcpSqrSigma0Product0__0_n_141;
  wire rcpSqrSigma0Product0__0_n_142;
  wire rcpSqrSigma0Product0__0_n_143;
  wire rcpSqrSigma0Product0__0_n_144;
  wire rcpSqrSigma0Product0__0_n_145;
  wire rcpSqrSigma0Product0__0_n_146;
  wire rcpSqrSigma0Product0__0_n_147;
  wire rcpSqrSigma0Product0__0_n_148;
  wire rcpSqrSigma0Product0__0_n_149;
  wire rcpSqrSigma0Product0__0_n_150;
  wire rcpSqrSigma0Product0__0_n_151;
  wire rcpSqrSigma0Product0__0_n_152;
  wire rcpSqrSigma0Product0__0_n_153;
  wire rcpSqrSigma0Product0__0_n_58;
  wire rcpSqrSigma0Product0__0_n_59;
  wire rcpSqrSigma0Product0__0_n_60;
  wire rcpSqrSigma0Product0__0_n_61;
  wire rcpSqrSigma0Product0__0_n_62;
  wire rcpSqrSigma0Product0__0_n_63;
  wire rcpSqrSigma0Product0__0_n_64;
  wire rcpSqrSigma0Product0__0_n_65;
  wire rcpSqrSigma0Product0__0_n_66;
  wire rcpSqrSigma0Product0__0_n_67;
  wire rcpSqrSigma0Product0__0_n_68;
  wire rcpSqrSigma0Product0__0_n_69;
  wire rcpSqrSigma0Product0__0_n_70;
  wire rcpSqrSigma0Product0__0_n_71;
  wire rcpSqrSigma0Product0__0_n_72;
  wire rcpSqrSigma0Product0__0_n_73;
  wire rcpSqrSigma0Product0__0_n_74;
  wire rcpSqrSigma0Product0__0_n_75;
  wire rcpSqrSigma0Product0__0_n_76;
  wire rcpSqrSigma0Product0__0_n_77;
  wire rcpSqrSigma0Product0__0_n_78;
  wire rcpSqrSigma0Product0__0_n_79;
  wire rcpSqrSigma0Product0__0_n_80;
  wire rcpSqrSigma0Product0__0_n_81;
  wire rcpSqrSigma0Product0__0_n_82;
  wire rcpSqrSigma0Product0__0_n_83;
  wire rcpSqrSigma0Product0__0_n_84;
  wire rcpSqrSigma0Product0__0_n_85;
  wire rcpSqrSigma0Product0__0_n_86;
  wire rcpSqrSigma0Product0__0_n_87;
  wire rcpSqrSigma0Product0__0_n_88;
  wire rcpSqrSigma0Product0__0_n_89;
  wire rcpSqrSigma0Product0__0_n_90;
  wire rcpSqrSigma0Product0__0_n_91;
  wire rcpSqrSigma0Product0__0_n_92;
  wire rcpSqrSigma0Product0__0_n_93;
  wire rcpSqrSigma0Product0__0_n_94;
  wire rcpSqrSigma0Product0__0_n_95;
  wire rcpSqrSigma0Product0__0_n_96;
  wire rcpSqrSigma0Product0__0_n_97;
  wire rcpSqrSigma0Product0__0_n_98;
  wire rcpSqrSigma0Product0__0_n_99;
  wire rcpSqrSigma0Product0__1;
  wire rcpSqrSigma0Product0_n_100;
  wire rcpSqrSigma0Product0_n_101;
  wire rcpSqrSigma0Product0_n_102;
  wire rcpSqrSigma0Product0_n_103;
  wire rcpSqrSigma0Product0_n_104;
  wire rcpSqrSigma0Product0_n_105;
  wire rcpSqrSigma0Product0_n_106;
  wire rcpSqrSigma0Product0_n_107;
  wire rcpSqrSigma0Product0_n_108;
  wire rcpSqrSigma0Product0_n_109;
  wire rcpSqrSigma0Product0_n_110;
  wire rcpSqrSigma0Product0_n_111;
  wire rcpSqrSigma0Product0_n_112;
  wire rcpSqrSigma0Product0_n_113;
  wire rcpSqrSigma0Product0_n_114;
  wire rcpSqrSigma0Product0_n_115;
  wire rcpSqrSigma0Product0_n_116;
  wire rcpSqrSigma0Product0_n_117;
  wire rcpSqrSigma0Product0_n_118;
  wire rcpSqrSigma0Product0_n_119;
  wire rcpSqrSigma0Product0_n_120;
  wire rcpSqrSigma0Product0_n_121;
  wire rcpSqrSigma0Product0_n_122;
  wire rcpSqrSigma0Product0_n_123;
  wire rcpSqrSigma0Product0_n_124;
  wire rcpSqrSigma0Product0_n_125;
  wire rcpSqrSigma0Product0_n_126;
  wire rcpSqrSigma0Product0_n_127;
  wire rcpSqrSigma0Product0_n_128;
  wire rcpSqrSigma0Product0_n_129;
  wire rcpSqrSigma0Product0_n_130;
  wire rcpSqrSigma0Product0_n_131;
  wire rcpSqrSigma0Product0_n_132;
  wire rcpSqrSigma0Product0_n_133;
  wire rcpSqrSigma0Product0_n_134;
  wire rcpSqrSigma0Product0_n_135;
  wire rcpSqrSigma0Product0_n_136;
  wire rcpSqrSigma0Product0_n_137;
  wire rcpSqrSigma0Product0_n_138;
  wire rcpSqrSigma0Product0_n_139;
  wire rcpSqrSigma0Product0_n_140;
  wire rcpSqrSigma0Product0_n_141;
  wire rcpSqrSigma0Product0_n_142;
  wire rcpSqrSigma0Product0_n_143;
  wire rcpSqrSigma0Product0_n_144;
  wire rcpSqrSigma0Product0_n_145;
  wire rcpSqrSigma0Product0_n_146;
  wire rcpSqrSigma0Product0_n_147;
  wire rcpSqrSigma0Product0_n_148;
  wire rcpSqrSigma0Product0_n_149;
  wire rcpSqrSigma0Product0_n_150;
  wire rcpSqrSigma0Product0_n_151;
  wire rcpSqrSigma0Product0_n_152;
  wire rcpSqrSigma0Product0_n_153;
  wire rcpSqrSigma0Product0_n_58;
  wire rcpSqrSigma0Product0_n_59;
  wire rcpSqrSigma0Product0_n_60;
  wire rcpSqrSigma0Product0_n_61;
  wire rcpSqrSigma0Product0_n_62;
  wire rcpSqrSigma0Product0_n_63;
  wire rcpSqrSigma0Product0_n_64;
  wire rcpSqrSigma0Product0_n_65;
  wire rcpSqrSigma0Product0_n_66;
  wire rcpSqrSigma0Product0_n_67;
  wire rcpSqrSigma0Product0_n_68;
  wire rcpSqrSigma0Product0_n_69;
  wire rcpSqrSigma0Product0_n_70;
  wire rcpSqrSigma0Product0_n_71;
  wire rcpSqrSigma0Product0_n_72;
  wire rcpSqrSigma0Product0_n_73;
  wire rcpSqrSigma0Product0_n_74;
  wire rcpSqrSigma0Product0_n_75;
  wire rcpSqrSigma0Product0_n_76;
  wire rcpSqrSigma0Product0_n_77;
  wire rcpSqrSigma0Product0_n_78;
  wire rcpSqrSigma0Product0_n_79;
  wire rcpSqrSigma0Product0_n_80;
  wire rcpSqrSigma0Product0_n_81;
  wire rcpSqrSigma0Product0_n_82;
  wire rcpSqrSigma0Product0_n_83;
  wire rcpSqrSigma0Product0_n_84;
  wire rcpSqrSigma0Product0_n_85;
  wire rcpSqrSigma0Product0_n_86;
  wire rcpSqrSigma0Product0_n_87;
  wire rcpSqrSigma0Product0_n_88;
  wire rcpSqrSigma0Product0_n_89;
  wire rcpSqrSigma0Product0_n_90;
  wire rcpSqrSigma0Product0_n_91;
  wire rcpSqrSigma0Product0_n_92;
  wire rcpSqrSigma0Product0_n_93;
  wire rcpSqrSigma0Product0_n_94;
  wire rcpSqrSigma0Product0_n_95;
  wire rcpSqrSigma0Product0_n_96;
  wire rcpSqrSigma0Product0_n_97;
  wire rcpSqrSigma0Product0_n_98;
  wire rcpSqrSigma0Product0_n_99;
  wire \rcpSqrSigma0Product_reg[16]__0_n_0 ;
  wire rcpSqrSigma0Product_reg__0_n_100;
  wire rcpSqrSigma0Product_reg__0_n_101;
  wire rcpSqrSigma0Product_reg__0_n_102;
  wire rcpSqrSigma0Product_reg__0_n_103;
  wire rcpSqrSigma0Product_reg__0_n_104;
  wire rcpSqrSigma0Product_reg__0_n_105;
  wire rcpSqrSigma0Product_reg__0_n_58;
  wire rcpSqrSigma0Product_reg__0_n_59;
  wire rcpSqrSigma0Product_reg__0_n_60;
  wire rcpSqrSigma0Product_reg__0_n_61;
  wire rcpSqrSigma0Product_reg__0_n_62;
  wire rcpSqrSigma0Product_reg__0_n_63;
  wire rcpSqrSigma0Product_reg__0_n_64;
  wire rcpSqrSigma0Product_reg__0_n_65;
  wire rcpSqrSigma0Product_reg__0_n_66;
  wire rcpSqrSigma0Product_reg__0_n_67;
  wire rcpSqrSigma0Product_reg__0_n_68;
  wire rcpSqrSigma0Product_reg__0_n_69;
  wire rcpSqrSigma0Product_reg__0_n_70;
  wire rcpSqrSigma0Product_reg__0_n_71;
  wire rcpSqrSigma0Product_reg__0_n_72;
  wire rcpSqrSigma0Product_reg__0_n_73;
  wire rcpSqrSigma0Product_reg__0_n_74;
  wire rcpSqrSigma0Product_reg__0_n_75;
  wire rcpSqrSigma0Product_reg__0_n_76;
  wire rcpSqrSigma0Product_reg__0_n_77;
  wire rcpSqrSigma0Product_reg__0_n_78;
  wire rcpSqrSigma0Product_reg__0_n_79;
  wire rcpSqrSigma0Product_reg__0_n_80;
  wire rcpSqrSigma0Product_reg__0_n_81;
  wire rcpSqrSigma0Product_reg__0_n_82;
  wire rcpSqrSigma0Product_reg__0_n_83;
  wire rcpSqrSigma0Product_reg__0_n_84;
  wire rcpSqrSigma0Product_reg__0_n_85;
  wire rcpSqrSigma0Product_reg__0_n_86;
  wire rcpSqrSigma0Product_reg__0_n_87;
  wire rcpSqrSigma0Product_reg__0_n_88;
  wire rcpSqrSigma0Product_reg__0_n_89;
  wire rcpSqrSigma0Product_reg__0_n_90;
  wire rcpSqrSigma0Product_reg__0_n_91;
  wire rcpSqrSigma0Product_reg__0_n_92;
  wire rcpSqrSigma0Product_reg__0_n_93;
  wire rcpSqrSigma0Product_reg__0_n_94;
  wire rcpSqrSigma0Product_reg__0_n_95;
  wire rcpSqrSigma0Product_reg__0_n_96;
  wire rcpSqrSigma0Product_reg__0_n_97;
  wire rcpSqrSigma0Product_reg__0_n_98;
  wire rcpSqrSigma0Product_reg__0_n_99;
  wire [63:32]rcpSqrSigma0Product_reg__1;
  wire \rcpSqrSigma0Product_reg_n_0_[0] ;
  wire \rcpSqrSigma0Product_reg_n_0_[10] ;
  wire \rcpSqrSigma0Product_reg_n_0_[11] ;
  wire \rcpSqrSigma0Product_reg_n_0_[12] ;
  wire \rcpSqrSigma0Product_reg_n_0_[13] ;
  wire \rcpSqrSigma0Product_reg_n_0_[14] ;
  wire \rcpSqrSigma0Product_reg_n_0_[15] ;
  wire \rcpSqrSigma0Product_reg_n_0_[16] ;
  wire \rcpSqrSigma0Product_reg_n_0_[1] ;
  wire \rcpSqrSigma0Product_reg_n_0_[2] ;
  wire \rcpSqrSigma0Product_reg_n_0_[3] ;
  wire \rcpSqrSigma0Product_reg_n_0_[4] ;
  wire \rcpSqrSigma0Product_reg_n_0_[5] ;
  wire \rcpSqrSigma0Product_reg_n_0_[6] ;
  wire \rcpSqrSigma0Product_reg_n_0_[7] ;
  wire \rcpSqrSigma0Product_reg_n_0_[8] ;
  wire \rcpSqrSigma0Product_reg_n_0_[9] ;
  wire rcpSqrSigma0Product_reg_n_100;
  wire rcpSqrSigma0Product_reg_n_101;
  wire rcpSqrSigma0Product_reg_n_102;
  wire rcpSqrSigma0Product_reg_n_103;
  wire rcpSqrSigma0Product_reg_n_104;
  wire rcpSqrSigma0Product_reg_n_105;
  wire rcpSqrSigma0Product_reg_n_58;
  wire rcpSqrSigma0Product_reg_n_59;
  wire rcpSqrSigma0Product_reg_n_60;
  wire rcpSqrSigma0Product_reg_n_61;
  wire rcpSqrSigma0Product_reg_n_62;
  wire rcpSqrSigma0Product_reg_n_63;
  wire rcpSqrSigma0Product_reg_n_64;
  wire rcpSqrSigma0Product_reg_n_65;
  wire rcpSqrSigma0Product_reg_n_66;
  wire rcpSqrSigma0Product_reg_n_67;
  wire rcpSqrSigma0Product_reg_n_68;
  wire rcpSqrSigma0Product_reg_n_69;
  wire rcpSqrSigma0Product_reg_n_70;
  wire rcpSqrSigma0Product_reg_n_71;
  wire rcpSqrSigma0Product_reg_n_72;
  wire rcpSqrSigma0Product_reg_n_73;
  wire rcpSqrSigma0Product_reg_n_74;
  wire rcpSqrSigma0Product_reg_n_75;
  wire rcpSqrSigma0Product_reg_n_76;
  wire rcpSqrSigma0Product_reg_n_77;
  wire rcpSqrSigma0Product_reg_n_78;
  wire rcpSqrSigma0Product_reg_n_79;
  wire rcpSqrSigma0Product_reg_n_80;
  wire rcpSqrSigma0Product_reg_n_81;
  wire rcpSqrSigma0Product_reg_n_82;
  wire rcpSqrSigma0Product_reg_n_83;
  wire rcpSqrSigma0Product_reg_n_84;
  wire rcpSqrSigma0Product_reg_n_85;
  wire rcpSqrSigma0Product_reg_n_86;
  wire rcpSqrSigma0Product_reg_n_87;
  wire rcpSqrSigma0Product_reg_n_88;
  wire rcpSqrSigma0Product_reg_n_89;
  wire rcpSqrSigma0Product_reg_n_90;
  wire rcpSqrSigma0Product_reg_n_91;
  wire rcpSqrSigma0Product_reg_n_92;
  wire rcpSqrSigma0Product_reg_n_93;
  wire rcpSqrSigma0Product_reg_n_94;
  wire rcpSqrSigma0Product_reg_n_95;
  wire rcpSqrSigma0Product_reg_n_96;
  wire rcpSqrSigma0Product_reg_n_97;
  wire rcpSqrSigma0Product_reg_n_98;
  wire rcpSqrSigma0Product_reg_n_99;
  wire [22:0]resultMantissa;
  wire resultMantissa0;
  wire \resultMantissa[5]_i_2_n_0 ;
  wire \resultMantissa_reg[13]_i_1_n_0 ;
  wire \resultMantissa_reg[13]_i_1_n_1 ;
  wire \resultMantissa_reg[13]_i_1_n_2 ;
  wire \resultMantissa_reg[13]_i_1_n_3 ;
  wire \resultMantissa_reg[13]_i_1_n_4 ;
  wire \resultMantissa_reg[13]_i_1_n_5 ;
  wire \resultMantissa_reg[13]_i_1_n_6 ;
  wire \resultMantissa_reg[13]_i_1_n_7 ;
  wire \resultMantissa_reg[21]_i_1_n_0 ;
  wire \resultMantissa_reg[21]_i_1_n_1 ;
  wire \resultMantissa_reg[21]_i_1_n_2 ;
  wire \resultMantissa_reg[21]_i_1_n_3 ;
  wire \resultMantissa_reg[21]_i_1_n_4 ;
  wire \resultMantissa_reg[21]_i_1_n_5 ;
  wire \resultMantissa_reg[21]_i_1_n_6 ;
  wire \resultMantissa_reg[21]_i_1_n_7 ;
  wire \resultMantissa_reg[5]_i_1_n_0 ;
  wire \resultMantissa_reg[5]_i_1_n_1 ;
  wire \resultMantissa_reg[5]_i_1_n_2 ;
  wire \resultMantissa_reg[5]_i_1_n_3 ;
  wire \resultMantissa_reg[5]_i_1_n_4 ;
  wire \resultMantissa_reg[5]_i_1_n_5 ;
  wire \resultMantissa_reg[5]_i_1_n_6 ;
  wire \resultMantissa_reg[5]_i_1_n_7 ;
  wire sigma0TempProduct0__0;
  wire sigma0TempProduct0_n_100;
  wire sigma0TempProduct0_n_101;
  wire sigma0TempProduct0_n_102;
  wire sigma0TempProduct0_n_103;
  wire sigma0TempProduct0_n_104;
  wire sigma0TempProduct0_n_105;
  wire sigma0TempProduct0_n_106;
  wire sigma0TempProduct0_n_107;
  wire sigma0TempProduct0_n_108;
  wire sigma0TempProduct0_n_109;
  wire sigma0TempProduct0_n_110;
  wire sigma0TempProduct0_n_111;
  wire sigma0TempProduct0_n_112;
  wire sigma0TempProduct0_n_113;
  wire sigma0TempProduct0_n_114;
  wire sigma0TempProduct0_n_115;
  wire sigma0TempProduct0_n_116;
  wire sigma0TempProduct0_n_117;
  wire sigma0TempProduct0_n_118;
  wire sigma0TempProduct0_n_119;
  wire sigma0TempProduct0_n_120;
  wire sigma0TempProduct0_n_121;
  wire sigma0TempProduct0_n_122;
  wire sigma0TempProduct0_n_123;
  wire sigma0TempProduct0_n_124;
  wire sigma0TempProduct0_n_125;
  wire sigma0TempProduct0_n_126;
  wire sigma0TempProduct0_n_127;
  wire sigma0TempProduct0_n_128;
  wire sigma0TempProduct0_n_129;
  wire sigma0TempProduct0_n_130;
  wire sigma0TempProduct0_n_131;
  wire sigma0TempProduct0_n_132;
  wire sigma0TempProduct0_n_133;
  wire sigma0TempProduct0_n_134;
  wire sigma0TempProduct0_n_135;
  wire sigma0TempProduct0_n_136;
  wire sigma0TempProduct0_n_137;
  wire sigma0TempProduct0_n_138;
  wire sigma0TempProduct0_n_139;
  wire sigma0TempProduct0_n_140;
  wire sigma0TempProduct0_n_141;
  wire sigma0TempProduct0_n_142;
  wire sigma0TempProduct0_n_143;
  wire sigma0TempProduct0_n_144;
  wire sigma0TempProduct0_n_145;
  wire sigma0TempProduct0_n_146;
  wire sigma0TempProduct0_n_147;
  wire sigma0TempProduct0_n_148;
  wire sigma0TempProduct0_n_149;
  wire sigma0TempProduct0_n_150;
  wire sigma0TempProduct0_n_151;
  wire sigma0TempProduct0_n_152;
  wire sigma0TempProduct0_n_153;
  wire sigma0TempProduct0_n_58;
  wire sigma0TempProduct0_n_59;
  wire sigma0TempProduct0_n_60;
  wire sigma0TempProduct0_n_61;
  wire sigma0TempProduct0_n_62;
  wire sigma0TempProduct0_n_63;
  wire sigma0TempProduct0_n_64;
  wire sigma0TempProduct0_n_65;
  wire sigma0TempProduct0_n_66;
  wire sigma0TempProduct0_n_67;
  wire sigma0TempProduct0_n_68;
  wire sigma0TempProduct0_n_69;
  wire sigma0TempProduct0_n_70;
  wire sigma0TempProduct0_n_71;
  wire sigma0TempProduct0_n_72;
  wire sigma0TempProduct0_n_73;
  wire sigma0TempProduct0_n_74;
  wire sigma0TempProduct0_n_75;
  wire sigma0TempProduct0_n_76;
  wire sigma0TempProduct0_n_77;
  wire sigma0TempProduct0_n_78;
  wire sigma0TempProduct0_n_79;
  wire sigma0TempProduct0_n_80;
  wire sigma0TempProduct0_n_81;
  wire sigma0TempProduct0_n_82;
  wire sigma0TempProduct0_n_83;
  wire sigma0TempProduct0_n_84;
  wire sigma0TempProduct0_n_85;
  wire sigma0TempProduct0_n_86;
  wire sigma0TempProduct0_n_87;
  wire sigma0TempProduct0_n_88;
  wire sigma0TempProduct0_n_89;
  wire sigma0TempProduct0_n_90;
  wire sigma0TempProduct0_n_91;
  wire sigma0TempProduct0_n_92;
  wire sigma0TempProduct0_n_93;
  wire sigma0TempProduct0_n_94;
  wire sigma0TempProduct0_n_95;
  wire sigma0TempProduct0_n_96;
  wire sigma0TempProduct0_n_97;
  wire sigma0TempProduct0_n_98;
  wire sigma0TempProduct0_n_99;
  wire \sigma0TempProduct_reg_n_0_[10] ;
  wire \sigma0TempProduct_reg_n_0_[11] ;
  wire \sigma0TempProduct_reg_n_0_[12] ;
  wire \sigma0TempProduct_reg_n_0_[13] ;
  wire \sigma0TempProduct_reg_n_0_[14] ;
  wire \sigma0TempProduct_reg_n_0_[15] ;
  wire \sigma0TempProduct_reg_n_0_[16] ;
  wire \sigma0TempProduct_reg_n_0_[7] ;
  wire \sigma0TempProduct_reg_n_0_[8] ;
  wire \sigma0TempProduct_reg_n_0_[9] ;
  wire sigma0TempProduct_reg_n_100;
  wire sigma0TempProduct_reg_n_101;
  wire sigma0TempProduct_reg_n_102;
  wire sigma0TempProduct_reg_n_103;
  wire sigma0TempProduct_reg_n_104;
  wire sigma0TempProduct_reg_n_105;
  wire sigma0TempProduct_reg_n_58;
  wire sigma0TempProduct_reg_n_59;
  wire sigma0TempProduct_reg_n_60;
  wire sigma0TempProduct_reg_n_61;
  wire sigma0TempProduct_reg_n_62;
  wire sigma0TempProduct_reg_n_63;
  wire sigma0TempProduct_reg_n_64;
  wire sigma0TempProduct_reg_n_65;
  wire sigma0TempProduct_reg_n_66;
  wire sigma0TempProduct_reg_n_67;
  wire sigma0TempProduct_reg_n_68;
  wire sigma0TempProduct_reg_n_69;
  wire sigma0TempProduct_reg_n_70;
  wire sigma0TempProduct_reg_n_71;
  wire sigma0TempProduct_reg_n_72;
  wire sigma0TempProduct_reg_n_73;
  wire sigma0TempProduct_reg_n_74;
  wire sigma0TempProduct_reg_n_75;
  wire sigma0TempProduct_reg_n_76;
  wire sigma0TempProduct_reg_n_77;
  wire sigma0TempProduct_reg_n_78;
  wire sigma0TempProduct_reg_n_79;
  wire sigma0TempProduct_reg_n_80;
  wire sigma0TempProduct_reg_n_81;
  wire sigma0TempProduct_reg_n_82;
  wire sigma0TempProduct_reg_n_83;
  wire sigma0TempProduct_reg_n_84;
  wire sigma0TempProduct_reg_n_85;
  wire sigma0TempProduct_reg_n_86;
  wire sigma0TempProduct_reg_n_87;
  wire sigma0TempProduct_reg_n_88;
  wire sigma0TempProduct_reg_n_89;
  wire sigma0TempProduct_reg_n_90;
  wire sigma0TempProduct_reg_n_91;
  wire sigma0TempProduct_reg_n_92;
  wire sigma0TempProduct_reg_n_93;
  wire sigma0TempProduct_reg_n_94;
  wire sigma0TempProduct_reg_n_95;
  wire sigma0TempProduct_reg_n_96;
  wire sigma0TempProduct_reg_n_97;
  wire sigma0TempProduct_reg_n_98;
  wire sigma0TempProduct_reg_n_99;
  wire slopeMultiply0;
  wire [15:0]slopeMultiply_reg__15;
  wire slopeMultiply_reg_i_10_n_0;
  wire slopeMultiply_reg_i_11_n_0;
  wire slopeMultiply_reg_i_12_n_0;
  wire slopeMultiply_reg_i_13_n_0;
  wire slopeMultiply_reg_i_14_n_0;
  wire slopeMultiply_reg_i_15_n_0;
  wire slopeMultiply_reg_i_16_n_0;
  wire slopeMultiply_reg_i_17_n_0;
  wire slopeMultiply_reg_i_18_n_0;
  wire slopeMultiply_reg_i_19_n_0;
  wire slopeMultiply_reg_i_3_n_0;
  wire slopeMultiply_reg_i_4_n_0;
  wire slopeMultiply_reg_i_5_n_0;
  wire slopeMultiply_reg_i_6_n_0;
  wire slopeMultiply_reg_i_7_n_0;
  wire slopeMultiply_reg_i_8_n_0;
  wire slopeMultiply_reg_i_9_n_0;
  wire slopeMultiply_reg_n_100;
  wire slopeMultiply_reg_n_101;
  wire slopeMultiply_reg_n_102;
  wire slopeMultiply_reg_n_103;
  wire slopeMultiply_reg_n_104;
  wire slopeMultiply_reg_n_105;
  wire slopeMultiply_reg_n_74;
  wire slopeMultiply_reg_n_75;
  wire slopeMultiply_reg_n_76;
  wire slopeMultiply_reg_n_77;
  wire slopeMultiply_reg_n_78;
  wire slopeMultiply_reg_n_79;
  wire slopeMultiply_reg_n_80;
  wire slopeMultiply_reg_n_81;
  wire slopeMultiply_reg_n_82;
  wire slopeMultiply_reg_n_83;
  wire slopeMultiply_reg_n_84;
  wire slopeMultiply_reg_n_85;
  wire slopeMultiply_reg_n_86;
  wire slopeMultiply_reg_n_87;
  wire slopeMultiply_reg_n_88;
  wire slopeMultiply_reg_n_89;
  wire slopeMultiply_reg_n_90;
  wire slopeMultiply_reg_n_91;
  wire slopeMultiply_reg_n_92;
  wire slopeMultiply_reg_n_93;
  wire slopeMultiply_reg_n_94;
  wire slopeMultiply_reg_n_95;
  wire slopeMultiply_reg_n_96;
  wire slopeMultiply_reg_n_97;
  wire slopeMultiply_reg_n_98;
  wire slopeMultiply_reg_n_99;
  wire NLW_rAccumProduct0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_rAccumProduct0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_rAccumProduct0_OVERFLOW_UNCONNECTED;
  wire NLW_rAccumProduct0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_rAccumProduct0_PATTERNDETECT_UNCONNECTED;
  wire NLW_rAccumProduct0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_rAccumProduct0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_rAccumProduct0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_rAccumProduct0_CARRYOUT_UNCONNECTED;
  wire [7:0]NLW_rAccumProduct0_XOROUT_UNCONNECTED;
  wire NLW_rAccumProduct0__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_rAccumProduct0__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_rAccumProduct0__0_OVERFLOW_UNCONNECTED;
  wire NLW_rAccumProduct0__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_rAccumProduct0__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_rAccumProduct0__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_rAccumProduct0__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_rAccumProduct0__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_rAccumProduct0__0_CARRYOUT_UNCONNECTED;
  wire [7:0]NLW_rAccumProduct0__0_XOROUT_UNCONNECTED;
  wire [7:0]NLW_rAccumProduct0_i_21_O_UNCONNECTED;
  wire [7:0]NLW_rAccumProduct0_i_30_O_UNCONNECTED;
  wire NLW_rAccumProduct_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_rAccumProduct_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_rAccumProduct_reg_OVERFLOW_UNCONNECTED;
  wire NLW_rAccumProduct_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_rAccumProduct_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_rAccumProduct_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_rAccumProduct_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_rAccumProduct_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_rAccumProduct_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_rAccumProduct_reg_PCOUT_UNCONNECTED;
  wire [7:0]NLW_rAccumProduct_reg_XOROUT_UNCONNECTED;
  wire NLW_rAccumProduct_reg__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_rAccumProduct_reg__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_rAccumProduct_reg__0_OVERFLOW_UNCONNECTED;
  wire NLW_rAccumProduct_reg__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_rAccumProduct_reg__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_rAccumProduct_reg__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_rAccumProduct_reg__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_rAccumProduct_reg__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_rAccumProduct_reg__0_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_rAccumProduct_reg__0_PCOUT_UNCONNECTED;
  wire [7:0]NLW_rAccumProduct_reg__0_XOROUT_UNCONNECTED;
  wire [7:7]NLW_rAccumProduct_reg_i_1_CO_UNCONNECTED;
  wire [7:7]\NLW_rAccum_reg[15]_i_10_CO_UNCONNECTED ;
  wire [7:6]\NLW_rAccum_reg[30]_i_2_CO_UNCONNECTED ;
  wire [7:7]\NLW_rAccum_reg[30]_i_2_O_UNCONNECTED ;
  wire [5:0]\NLW_rAccum_reg[7]_i_1_O_UNCONNECTED ;
  wire [7:0]\NLW_rAccum_reg[7]_i_11_O_UNCONNECTED ;
  wire [7:0]\NLW_rAccum_reg[7]_i_20_O_UNCONNECTED ;
  wire [7:0]\NLW_rAccum_reg[7]_i_29_O_UNCONNECTED ;
  wire [7:0]\NLW_rAccum_reg[7]_i_38_O_UNCONNECTED ;
  wire [7:7]\NLW_rInitialGuess00_inferred__0/i__carry__0_CO_UNCONNECTED ;
  wire NLW_rProduct0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_rProduct0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_rProduct0_OVERFLOW_UNCONNECTED;
  wire NLW_rProduct0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_rProduct0_PATTERNDETECT_UNCONNECTED;
  wire NLW_rProduct0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_rProduct0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_rProduct0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_rProduct0_CARRYOUT_UNCONNECTED;
  wire [7:0]NLW_rProduct0_XOROUT_UNCONNECTED;
  wire NLW_rProduct_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_rProduct_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_rProduct_reg_OVERFLOW_UNCONNECTED;
  wire NLW_rProduct_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_rProduct_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_rProduct_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_rProduct_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_rProduct_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_rProduct_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_rProduct_reg_PCOUT_UNCONNECTED;
  wire [7:0]NLW_rProduct_reg_XOROUT_UNCONNECTED;
  wire [7:0]\NLW_rRefined0_reg[31]_i_2_CO_UNCONNECTED ;
  wire [7:1]\NLW_rRefined0_reg[31]_i_2_O_UNCONNECTED ;
  wire NLW_rcpSqrSigma0Product0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product0_OVERFLOW_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product0_PATTERNDETECT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_rcpSqrSigma0Product0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_rcpSqrSigma0Product0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_rcpSqrSigma0Product0_CARRYOUT_UNCONNECTED;
  wire [7:0]NLW_rcpSqrSigma0Product0_XOROUT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product0__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product0__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product0__0_OVERFLOW_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product0__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product0__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product0__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_rcpSqrSigma0Product0__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_rcpSqrSigma0Product0__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_rcpSqrSigma0Product0__0_CARRYOUT_UNCONNECTED;
  wire [7:0]NLW_rcpSqrSigma0Product0__0_XOROUT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg_OVERFLOW_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_rcpSqrSigma0Product_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_rcpSqrSigma0Product_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_rcpSqrSigma0Product_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_rcpSqrSigma0Product_reg_PCOUT_UNCONNECTED;
  wire [7:0]NLW_rcpSqrSigma0Product_reg_XOROUT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg__0_OVERFLOW_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_rcpSqrSigma0Product_reg__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_rcpSqrSigma0Product_reg__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_rcpSqrSigma0Product_reg__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_rcpSqrSigma0Product_reg__0_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_rcpSqrSigma0Product_reg__0_PCOUT_UNCONNECTED;
  wire [7:0]NLW_rcpSqrSigma0Product_reg__0_XOROUT_UNCONNECTED;
  wire [7:0]\NLW_resultMantissa_reg[22]_i_2_CO_UNCONNECTED ;
  wire [7:1]\NLW_resultMantissa_reg[22]_i_2_O_UNCONNECTED ;
  wire [1:0]\NLW_resultMantissa_reg[5]_i_1_O_UNCONNECTED ;
  wire NLW_sigma0TempProduct0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_sigma0TempProduct0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_sigma0TempProduct0_OVERFLOW_UNCONNECTED;
  wire NLW_sigma0TempProduct0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_sigma0TempProduct0_PATTERNDETECT_UNCONNECTED;
  wire NLW_sigma0TempProduct0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_sigma0TempProduct0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_sigma0TempProduct0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_sigma0TempProduct0_CARRYOUT_UNCONNECTED;
  wire [7:0]NLW_sigma0TempProduct0_XOROUT_UNCONNECTED;
  wire NLW_sigma0TempProduct_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_sigma0TempProduct_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_sigma0TempProduct_reg_OVERFLOW_UNCONNECTED;
  wire NLW_sigma0TempProduct_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_sigma0TempProduct_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_sigma0TempProduct_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_sigma0TempProduct_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_sigma0TempProduct_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_sigma0TempProduct_reg_CARRYOUT_UNCONNECTED;
  wire [47:0]NLW_sigma0TempProduct_reg_PCOUT_UNCONNECTED;
  wire [7:0]NLW_sigma0TempProduct_reg_XOROUT_UNCONNECTED;
  wire NLW_slopeMultiply_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_slopeMultiply_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_slopeMultiply_reg_OVERFLOW_UNCONNECTED;
  wire NLW_slopeMultiply_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_slopeMultiply_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_slopeMultiply_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_slopeMultiply_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_slopeMultiply_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_slopeMultiply_reg_CARRYOUT_UNCONNECTED;
  wire [47:32]NLW_slopeMultiply_reg_P_UNCONNECTED;
  wire [47:0]NLW_slopeMultiply_reg_PCOUT_UNCONNECTED;
  wire [7:0]NLW_slopeMultiply_reg_XOROUT_UNCONNECTED;

  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[0]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [0]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[0]),
        .O(p_1_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[10]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [10]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[10]),
        .O(p_1_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[11]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [11]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[11]),
        .O(p_1_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[12]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [12]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[12]),
        .O(p_1_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[13]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [13]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[13]),
        .O(p_1_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[14]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [14]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[14]),
        .O(p_1_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[15]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [15]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[15]),
        .O(p_1_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[16]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [16]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[16]),
        .O(p_1_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[17]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [17]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[17]),
        .O(p_1_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[18]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [18]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[18]),
        .O(p_1_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[19]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [19]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[19]),
        .O(p_1_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[1]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [1]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[1]),
        .O(p_1_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[20]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [20]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[20]),
        .O(p_1_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[21]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [21]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[21]),
        .O(p_1_in[21]));
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[22]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[22]),
        .O(p_1_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[2]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [2]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[2]),
        .O(p_1_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[3]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [3]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[3]),
        .O(p_1_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[4]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [4]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[4]),
        .O(p_1_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[5]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [5]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[5]),
        .O(p_1_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[6]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [6]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[6]),
        .O(p_1_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[7]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [7]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[7]),
        .O(p_1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[8]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [8]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[8]),
        .O(p_1_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OSPEC[9]_i_1 
       (.I0(\rcpPipeline_reg[12][calculatedMantissa] [9]),
        .I1(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .I2(resultMantissa[9]),
        .O(p_1_in[9]));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[0] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[0]),
        .Q(OSPEC[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[10] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[10]),
        .Q(OSPEC[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[11] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[11]),
        .Q(OSPEC[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[12] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[12]),
        .Q(OSPEC[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[13] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[13]),
        .Q(OSPEC[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[14] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[14]),
        .Q(OSPEC[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[15] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[15]),
        .Q(OSPEC[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[16] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[16]),
        .Q(OSPEC[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[17] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[17]),
        .Q(OSPEC[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[18] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[18]),
        .Q(OSPEC[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[19] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[19]),
        .Q(OSPEC[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[1] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[1]),
        .Q(OSPEC[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[20] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[20]),
        .Q(OSPEC[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[21] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[21]),
        .Q(OSPEC[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[22] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[22]),
        .Q(OSPEC[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[23] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(\rcpPipeline_reg[12][rcpExponent] [0]),
        .Q(OSPEC[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[24] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(\rcpPipeline_reg[12][rcpExponent] [1]),
        .Q(OSPEC[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[25] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(\rcpPipeline_reg[12][rcpExponent] [2]),
        .Q(OSPEC[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[26] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(\rcpPipeline_reg[12][rcpExponent] [3]),
        .Q(OSPEC[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[27] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(\rcpPipeline_reg[12][rcpExponent] [4]),
        .Q(OSPEC[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[28] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(\rcpPipeline_reg[12][rcpExponent] [5]),
        .Q(OSPEC[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[29] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(\rcpPipeline_reg[12][rcpExponent] [6]),
        .Q(OSPEC[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[2] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[2]),
        .Q(OSPEC[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[30] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(\rcpPipeline_reg[12][rcpExponent] [7]),
        .Q(OSPEC[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[31] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(\rcpPipeline_reg[12][rcpSign] ),
        .Q(OSPEC[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[3] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[3]),
        .Q(OSPEC[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[4] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[4]),
        .Q(OSPEC[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[5] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[5]),
        .Q(OSPEC[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[6] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[6]),
        .Q(OSPEC[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[7] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[7]),
        .Q(OSPEC[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[8] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[8]),
        .Q(OSPEC[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OSPEC_reg[9] 
       (.C(clk),
        .CE(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .D(p_1_in[9]),
        .Q(OSPEC[9]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_1
       (.I0(rcpLookupOffset1[15]),
        .O(i__carry__0_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_2
       (.I0(rcpLookupOffset1[14]),
        .O(i__carry__0_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_3
       (.I0(rcpLookupOffset1[13]),
        .O(i__carry__0_i_3_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    i__carry__0_i_4
       (.I0(rcpLookupOffset1[12]),
        .O(i__carry__0_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_5
       (.I0(rcpLookupOffset1[11]),
        .I1(slopeMultiply_reg_n_74),
        .O(i__carry__0_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_6
       (.I0(rcpLookupOffset1[10]),
        .I1(slopeMultiply_reg_n_75),
        .O(i__carry__0_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_7
       (.I0(rcpLookupOffset1[9]),
        .I1(slopeMultiply_reg_n_76),
        .O(i__carry__0_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry__0_i_8
       (.I0(rcpLookupOffset1[8]),
        .I1(slopeMultiply_reg_n_77),
        .O(i__carry__0_i_8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_1
       (.I0(rcpLookupOffset1[7]),
        .I1(slopeMultiply_reg_n_78),
        .O(i__carry_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_2
       (.I0(rcpLookupOffset1[6]),
        .I1(slopeMultiply_reg_n_79),
        .O(i__carry_i_2_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_3
       (.I0(rcpLookupOffset1[5]),
        .I1(slopeMultiply_reg_n_80),
        .O(i__carry_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_4
       (.I0(rcpLookupOffset1[4]),
        .I1(slopeMultiply_reg_n_81),
        .O(i__carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_5
       (.I0(rcpLookupOffset1[3]),
        .I1(slopeMultiply_reg_n_82),
        .O(i__carry_i_5_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_6
       (.I0(rcpLookupOffset1[2]),
        .I1(slopeMultiply_reg_n_83),
        .O(i__carry_i_6_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_7
       (.I0(rcpLookupOffset1[1]),
        .I1(slopeMultiply_reg_n_84),
        .O(i__carry_i_7_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_8
       (.I0(rcpLookupOffset1[0]),
        .I1(slopeMultiply_reg_n_85),
        .O(i__carry_i_8_n_0));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x18 4}}" *) 
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BMULTSEL("B"),
    .BREG(2),
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
    rAccumProduct0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,rcpSqrSigma0Product_reg__1[48:32]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_rAccumProduct0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,rRefined0[31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_rAccumProduct0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_rAccumProduct0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_rAccumProduct0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(rcpSqrSigma00),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(rcpSqrSigma0Product0__1),
        .CEB2(rcpSqrSigma00),
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
        .MULTSIGNOUT(NLW_rAccumProduct0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_rAccumProduct0_OVERFLOW_UNCONNECTED),
        .P({rAccumProduct0_n_58,rAccumProduct0_n_59,rAccumProduct0_n_60,rAccumProduct0_n_61,rAccumProduct0_n_62,rAccumProduct0_n_63,rAccumProduct0_n_64,rAccumProduct0_n_65,rAccumProduct0_n_66,rAccumProduct0_n_67,rAccumProduct0_n_68,rAccumProduct0_n_69,rAccumProduct0_n_70,rAccumProduct0_n_71,rAccumProduct0_n_72,rAccumProduct0_n_73,rAccumProduct0_n_74,rAccumProduct0_n_75,rAccumProduct0_n_76,rAccumProduct0_n_77,rAccumProduct0_n_78,rAccumProduct0_n_79,rAccumProduct0_n_80,rAccumProduct0_n_81,rAccumProduct0_n_82,rAccumProduct0_n_83,rAccumProduct0_n_84,rAccumProduct0_n_85,rAccumProduct0_n_86,rAccumProduct0_n_87,rAccumProduct0_n_88,rAccumProduct0_n_89,rAccumProduct0_n_90,rAccumProduct0_n_91,rAccumProduct0_n_92,rAccumProduct0_n_93,rAccumProduct0_n_94,rAccumProduct0_n_95,rAccumProduct0_n_96,rAccumProduct0_n_97,rAccumProduct0_n_98,rAccumProduct0_n_99,rAccumProduct0_n_100,rAccumProduct0_n_101,rAccumProduct0_n_102,rAccumProduct0_n_103,rAccumProduct0_n_104,rAccumProduct0_n_105}),
        .PATTERNBDETECT(NLW_rAccumProduct0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_rAccumProduct0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({rAccumProduct0_n_106,rAccumProduct0_n_107,rAccumProduct0_n_108,rAccumProduct0_n_109,rAccumProduct0_n_110,rAccumProduct0_n_111,rAccumProduct0_n_112,rAccumProduct0_n_113,rAccumProduct0_n_114,rAccumProduct0_n_115,rAccumProduct0_n_116,rAccumProduct0_n_117,rAccumProduct0_n_118,rAccumProduct0_n_119,rAccumProduct0_n_120,rAccumProduct0_n_121,rAccumProduct0_n_122,rAccumProduct0_n_123,rAccumProduct0_n_124,rAccumProduct0_n_125,rAccumProduct0_n_126,rAccumProduct0_n_127,rAccumProduct0_n_128,rAccumProduct0_n_129,rAccumProduct0_n_130,rAccumProduct0_n_131,rAccumProduct0_n_132,rAccumProduct0_n_133,rAccumProduct0_n_134,rAccumProduct0_n_135,rAccumProduct0_n_136,rAccumProduct0_n_137,rAccumProduct0_n_138,rAccumProduct0_n_139,rAccumProduct0_n_140,rAccumProduct0_n_141,rAccumProduct0_n_142,rAccumProduct0_n_143,rAccumProduct0_n_144,rAccumProduct0_n_145,rAccumProduct0_n_146,rAccumProduct0_n_147,rAccumProduct0_n_148,rAccumProduct0_n_149,rAccumProduct0_n_150,rAccumProduct0_n_151,rAccumProduct0_n_152,rAccumProduct0_n_153}),
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
        .UNDERFLOW(NLW_rAccumProduct0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_rAccumProduct0_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E2 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(2),
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
    rAccumProduct0__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,rRefined0[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_rAccumProduct0__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,rcpSqrSigma0Product_reg__1[48:32]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_rAccumProduct0__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_rAccumProduct0__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_rAccumProduct0__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(rcpSqrSigma0Product0__1),
        .CEA2(rcpSqrSigma00),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(rcpSqrSigma00),
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
        .MULTSIGNOUT(NLW_rAccumProduct0__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_rAccumProduct0__0_OVERFLOW_UNCONNECTED),
        .P({rAccumProduct0__0_n_58,rAccumProduct0__0_n_59,rAccumProduct0__0_n_60,rAccumProduct0__0_n_61,rAccumProduct0__0_n_62,rAccumProduct0__0_n_63,rAccumProduct0__0_n_64,rAccumProduct0__0_n_65,rAccumProduct0__0_n_66,rAccumProduct0__0_n_67,rAccumProduct0__0_n_68,rAccumProduct0__0_n_69,rAccumProduct0__0_n_70,rAccumProduct0__0_n_71,rAccumProduct0__0_n_72,rAccumProduct0__0_n_73,rAccumProduct0__0_n_74,rAccumProduct0__0_n_75,rAccumProduct0__0_n_76,rAccumProduct0__0_n_77,rAccumProduct0__0_n_78,rAccumProduct0__0_n_79,rAccumProduct0__0_n_80,rAccumProduct0__0_n_81,rAccumProduct0__0_n_82,rAccumProduct0__0_n_83,rAccumProduct0__0_n_84,rAccumProduct0__0_n_85,rAccumProduct0__0_n_86,rAccumProduct0__0_n_87,rAccumProduct0__0_n_88,rAccumProduct0__0_n_89,rAccumProduct0__0_n_90,rAccumProduct0__0_n_91,rAccumProduct0__0_n_92,rAccumProduct0__0_n_93,rAccumProduct0__0_n_94,rAccumProduct0__0_n_95,rAccumProduct0__0_n_96,rAccumProduct0__0_n_97,rAccumProduct0__0_n_98,rAccumProduct0__0_n_99,rAccumProduct0__0_n_100,rAccumProduct0__0_n_101,rAccumProduct0__0_n_102,rAccumProduct0__0_n_103,rAccumProduct0__0_n_104,rAccumProduct0__0_n_105}),
        .PATTERNBDETECT(NLW_rAccumProduct0__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_rAccumProduct0__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({rAccumProduct0__0_n_106,rAccumProduct0__0_n_107,rAccumProduct0__0_n_108,rAccumProduct0__0_n_109,rAccumProduct0__0_n_110,rAccumProduct0__0_n_111,rAccumProduct0__0_n_112,rAccumProduct0__0_n_113,rAccumProduct0__0_n_114,rAccumProduct0__0_n_115,rAccumProduct0__0_n_116,rAccumProduct0__0_n_117,rAccumProduct0__0_n_118,rAccumProduct0__0_n_119,rAccumProduct0__0_n_120,rAccumProduct0__0_n_121,rAccumProduct0__0_n_122,rAccumProduct0__0_n_123,rAccumProduct0__0_n_124,rAccumProduct0__0_n_125,rAccumProduct0__0_n_126,rAccumProduct0__0_n_127,rAccumProduct0__0_n_128,rAccumProduct0__0_n_129,rAccumProduct0__0_n_130,rAccumProduct0__0_n_131,rAccumProduct0__0_n_132,rAccumProduct0__0_n_133,rAccumProduct0__0_n_134,rAccumProduct0__0_n_135,rAccumProduct0__0_n_136,rAccumProduct0__0_n_137,rAccumProduct0__0_n_138,rAccumProduct0__0_n_139,rAccumProduct0__0_n_140,rAccumProduct0__0_n_141,rAccumProduct0__0_n_142,rAccumProduct0__0_n_143,rAccumProduct0__0_n_144,rAccumProduct0__0_n_145,rAccumProduct0__0_n_146,rAccumProduct0__0_n_147,rAccumProduct0__0_n_148,rAccumProduct0__0_n_149,rAccumProduct0__0_n_150,rAccumProduct0__0_n_151,rAccumProduct0__0_n_152,rAccumProduct0__0_n_153}),
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
        .UNDERFLOW(NLW_rAccumProduct0__0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_rAccumProduct0__0_XOROUT_UNCONNECTED[7:0]));
  LUT2 #(
    .INIT(4'h2)) 
    rAccumProduct0_i_1
       (.I0(\rcpPipeline_reg[8][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[8][useEarlyOutBypass_n_0_] ),
        .O(rcpSqrSigma00));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_10
       (.I0(rcpSqrSigma0Product_reg__0_n_72),
        .I1(rcpSqrSigma0Product_reg_n_89),
        .O(rAccumProduct0_i_10_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_11
       (.I0(rcpSqrSigma0Product_reg__0_n_73),
        .I1(rcpSqrSigma0Product_reg_n_90),
        .O(rAccumProduct0_i_11_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_12
       (.I0(rcpSqrSigma0Product_reg__0_n_74),
        .I1(rcpSqrSigma0Product_reg_n_91),
        .O(rAccumProduct0_i_12_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_13
       (.I0(rcpSqrSigma0Product_reg__0_n_75),
        .I1(rcpSqrSigma0Product_reg_n_92),
        .O(rAccumProduct0_i_13_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_14
       (.I0(rcpSqrSigma0Product_reg__0_n_76),
        .I1(rcpSqrSigma0Product_reg_n_93),
        .O(rAccumProduct0_i_14_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_15
       (.I0(rcpSqrSigma0Product_reg__0_n_77),
        .I1(rcpSqrSigma0Product_reg_n_94),
        .O(rAccumProduct0_i_15_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_16
       (.I0(rcpSqrSigma0Product_reg__0_n_78),
        .I1(rcpSqrSigma0Product_reg_n_95),
        .O(rAccumProduct0_i_16_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_17
       (.I0(rcpSqrSigma0Product_reg__0_n_79),
        .I1(rcpSqrSigma0Product_reg_n_96),
        .O(rAccumProduct0_i_17_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_18
       (.I0(rcpSqrSigma0Product_reg__0_n_80),
        .I1(rcpSqrSigma0Product_reg_n_97),
        .O(rAccumProduct0_i_18_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_19
       (.I0(rcpSqrSigma0Product_reg__0_n_81),
        .I1(rcpSqrSigma0Product_reg_n_98),
        .O(rAccumProduct0_i_19_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 rAccumProduct0_i_2
       (.CI(rAccumProduct0_i_3_n_0),
        .CI_TOP(1'b0),
        .CO({rAccumProduct0_i_2_n_0,rAccumProduct0_i_2_n_1,rAccumProduct0_i_2_n_2,rAccumProduct0_i_2_n_3,rAccumProduct0_i_2_n_4,rAccumProduct0_i_2_n_5,rAccumProduct0_i_2_n_6,rAccumProduct0_i_2_n_7}),
        .DI({rcpSqrSigma0Product_reg__0_n_67,rcpSqrSigma0Product_reg__0_n_68,rcpSqrSigma0Product_reg__0_n_69,rcpSqrSigma0Product_reg__0_n_70,rcpSqrSigma0Product_reg__0_n_71,rcpSqrSigma0Product_reg__0_n_72,rcpSqrSigma0Product_reg__0_n_73,rcpSqrSigma0Product_reg__0_n_74}),
        .O(rcpSqrSigma0Product_reg__1[55:48]),
        .S({rAccumProduct0_i_5_n_0,rAccumProduct0_i_6_n_0,rAccumProduct0_i_7_n_0,rAccumProduct0_i_8_n_0,rAccumProduct0_i_9_n_0,rAccumProduct0_i_10_n_0,rAccumProduct0_i_11_n_0,rAccumProduct0_i_12_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_20
       (.I0(rcpSqrSigma0Product_reg__0_n_82),
        .I1(rcpSqrSigma0Product_reg_n_99),
        .O(rAccumProduct0_i_20_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 rAccumProduct0_i_21
       (.CI(rAccumProduct0_i_30_n_0),
        .CI_TOP(1'b0),
        .CO({rAccumProduct0_i_21_n_0,rAccumProduct0_i_21_n_1,rAccumProduct0_i_21_n_2,rAccumProduct0_i_21_n_3,rAccumProduct0_i_21_n_4,rAccumProduct0_i_21_n_5,rAccumProduct0_i_21_n_6,rAccumProduct0_i_21_n_7}),
        .DI({rcpSqrSigma0Product_reg__0_n_91,rcpSqrSigma0Product_reg__0_n_92,rcpSqrSigma0Product_reg__0_n_93,rcpSqrSigma0Product_reg__0_n_94,rcpSqrSigma0Product_reg__0_n_95,rcpSqrSigma0Product_reg__0_n_96,rcpSqrSigma0Product_reg__0_n_97,rcpSqrSigma0Product_reg__0_n_98}),
        .O(NLW_rAccumProduct0_i_21_O_UNCONNECTED[7:0]),
        .S({rAccumProduct0_i_31_n_0,rAccumProduct0_i_32_n_0,rAccumProduct0_i_33_n_0,rAccumProduct0_i_34_n_0,rAccumProduct0_i_35_n_0,rAccumProduct0_i_36_n_0,rAccumProduct0_i_37_n_0,rAccumProduct0_i_38_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_22
       (.I0(rcpSqrSigma0Product_reg__0_n_83),
        .I1(rcpSqrSigma0Product_reg_n_100),
        .O(rAccumProduct0_i_22_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_23
       (.I0(rcpSqrSigma0Product_reg__0_n_84),
        .I1(rcpSqrSigma0Product_reg_n_101),
        .O(rAccumProduct0_i_23_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_24
       (.I0(rcpSqrSigma0Product_reg__0_n_85),
        .I1(rcpSqrSigma0Product_reg_n_102),
        .O(rAccumProduct0_i_24_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_25
       (.I0(rcpSqrSigma0Product_reg__0_n_86),
        .I1(rcpSqrSigma0Product_reg_n_103),
        .O(rAccumProduct0_i_25_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_26
       (.I0(rcpSqrSigma0Product_reg__0_n_87),
        .I1(rcpSqrSigma0Product_reg_n_104),
        .O(rAccumProduct0_i_26_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_27
       (.I0(rcpSqrSigma0Product_reg__0_n_88),
        .I1(rcpSqrSigma0Product_reg_n_105),
        .O(rAccumProduct0_i_27_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_28
       (.I0(rcpSqrSigma0Product_reg__0_n_89),
        .I1(\rcpSqrSigma0Product_reg_n_0_[16] ),
        .O(rAccumProduct0_i_28_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_29
       (.I0(rcpSqrSigma0Product_reg__0_n_90),
        .I1(\rcpSqrSigma0Product_reg_n_0_[15] ),
        .O(rAccumProduct0_i_29_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 rAccumProduct0_i_3
       (.CI(rAccumProduct0_i_4_n_0),
        .CI_TOP(1'b0),
        .CO({rAccumProduct0_i_3_n_0,rAccumProduct0_i_3_n_1,rAccumProduct0_i_3_n_2,rAccumProduct0_i_3_n_3,rAccumProduct0_i_3_n_4,rAccumProduct0_i_3_n_5,rAccumProduct0_i_3_n_6,rAccumProduct0_i_3_n_7}),
        .DI({rcpSqrSigma0Product_reg__0_n_75,rcpSqrSigma0Product_reg__0_n_76,rcpSqrSigma0Product_reg__0_n_77,rcpSqrSigma0Product_reg__0_n_78,rcpSqrSigma0Product_reg__0_n_79,rcpSqrSigma0Product_reg__0_n_80,rcpSqrSigma0Product_reg__0_n_81,rcpSqrSigma0Product_reg__0_n_82}),
        .O(rcpSqrSigma0Product_reg__1[47:40]),
        .S({rAccumProduct0_i_13_n_0,rAccumProduct0_i_14_n_0,rAccumProduct0_i_15_n_0,rAccumProduct0_i_16_n_0,rAccumProduct0_i_17_n_0,rAccumProduct0_i_18_n_0,rAccumProduct0_i_19_n_0,rAccumProduct0_i_20_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 rAccumProduct0_i_30
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({rAccumProduct0_i_30_n_0,rAccumProduct0_i_30_n_1,rAccumProduct0_i_30_n_2,rAccumProduct0_i_30_n_3,rAccumProduct0_i_30_n_4,rAccumProduct0_i_30_n_5,rAccumProduct0_i_30_n_6,rAccumProduct0_i_30_n_7}),
        .DI({rcpSqrSigma0Product_reg__0_n_99,rcpSqrSigma0Product_reg__0_n_100,rcpSqrSigma0Product_reg__0_n_101,rcpSqrSigma0Product_reg__0_n_102,rcpSqrSigma0Product_reg__0_n_103,rcpSqrSigma0Product_reg__0_n_104,rcpSqrSigma0Product_reg__0_n_105,1'b0}),
        .O(NLW_rAccumProduct0_i_30_O_UNCONNECTED[7:0]),
        .S({rAccumProduct0_i_39_n_0,rAccumProduct0_i_40_n_0,rAccumProduct0_i_41_n_0,rAccumProduct0_i_42_n_0,rAccumProduct0_i_43_n_0,rAccumProduct0_i_44_n_0,rAccumProduct0_i_45_n_0,\rcpSqrSigma0Product_reg[16]__0_n_0 }));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_31
       (.I0(rcpSqrSigma0Product_reg__0_n_91),
        .I1(\rcpSqrSigma0Product_reg_n_0_[14] ),
        .O(rAccumProduct0_i_31_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_32
       (.I0(rcpSqrSigma0Product_reg__0_n_92),
        .I1(\rcpSqrSigma0Product_reg_n_0_[13] ),
        .O(rAccumProduct0_i_32_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_33
       (.I0(rcpSqrSigma0Product_reg__0_n_93),
        .I1(\rcpSqrSigma0Product_reg_n_0_[12] ),
        .O(rAccumProduct0_i_33_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_34
       (.I0(rcpSqrSigma0Product_reg__0_n_94),
        .I1(\rcpSqrSigma0Product_reg_n_0_[11] ),
        .O(rAccumProduct0_i_34_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_35
       (.I0(rcpSqrSigma0Product_reg__0_n_95),
        .I1(\rcpSqrSigma0Product_reg_n_0_[10] ),
        .O(rAccumProduct0_i_35_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_36
       (.I0(rcpSqrSigma0Product_reg__0_n_96),
        .I1(\rcpSqrSigma0Product_reg_n_0_[9] ),
        .O(rAccumProduct0_i_36_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_37
       (.I0(rcpSqrSigma0Product_reg__0_n_97),
        .I1(\rcpSqrSigma0Product_reg_n_0_[8] ),
        .O(rAccumProduct0_i_37_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_38
       (.I0(rcpSqrSigma0Product_reg__0_n_98),
        .I1(\rcpSqrSigma0Product_reg_n_0_[7] ),
        .O(rAccumProduct0_i_38_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_39
       (.I0(rcpSqrSigma0Product_reg__0_n_99),
        .I1(\rcpSqrSigma0Product_reg_n_0_[6] ),
        .O(rAccumProduct0_i_39_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 rAccumProduct0_i_4
       (.CI(rAccumProduct0_i_21_n_0),
        .CI_TOP(1'b0),
        .CO({rAccumProduct0_i_4_n_0,rAccumProduct0_i_4_n_1,rAccumProduct0_i_4_n_2,rAccumProduct0_i_4_n_3,rAccumProduct0_i_4_n_4,rAccumProduct0_i_4_n_5,rAccumProduct0_i_4_n_6,rAccumProduct0_i_4_n_7}),
        .DI({rcpSqrSigma0Product_reg__0_n_83,rcpSqrSigma0Product_reg__0_n_84,rcpSqrSigma0Product_reg__0_n_85,rcpSqrSigma0Product_reg__0_n_86,rcpSqrSigma0Product_reg__0_n_87,rcpSqrSigma0Product_reg__0_n_88,rcpSqrSigma0Product_reg__0_n_89,rcpSqrSigma0Product_reg__0_n_90}),
        .O(rcpSqrSigma0Product_reg__1[39:32]),
        .S({rAccumProduct0_i_22_n_0,rAccumProduct0_i_23_n_0,rAccumProduct0_i_24_n_0,rAccumProduct0_i_25_n_0,rAccumProduct0_i_26_n_0,rAccumProduct0_i_27_n_0,rAccumProduct0_i_28_n_0,rAccumProduct0_i_29_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_40
       (.I0(rcpSqrSigma0Product_reg__0_n_100),
        .I1(\rcpSqrSigma0Product_reg_n_0_[5] ),
        .O(rAccumProduct0_i_40_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_41
       (.I0(rcpSqrSigma0Product_reg__0_n_101),
        .I1(\rcpSqrSigma0Product_reg_n_0_[4] ),
        .O(rAccumProduct0_i_41_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_42
       (.I0(rcpSqrSigma0Product_reg__0_n_102),
        .I1(\rcpSqrSigma0Product_reg_n_0_[3] ),
        .O(rAccumProduct0_i_42_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_43
       (.I0(rcpSqrSigma0Product_reg__0_n_103),
        .I1(\rcpSqrSigma0Product_reg_n_0_[2] ),
        .O(rAccumProduct0_i_43_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_44
       (.I0(rcpSqrSigma0Product_reg__0_n_104),
        .I1(\rcpSqrSigma0Product_reg_n_0_[1] ),
        .O(rAccumProduct0_i_44_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_45
       (.I0(rcpSqrSigma0Product_reg__0_n_105),
        .I1(\rcpSqrSigma0Product_reg_n_0_[0] ),
        .O(rAccumProduct0_i_45_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_5
       (.I0(rcpSqrSigma0Product_reg__0_n_67),
        .I1(rcpSqrSigma0Product_reg_n_84),
        .O(rAccumProduct0_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_6
       (.I0(rcpSqrSigma0Product_reg__0_n_68),
        .I1(rcpSqrSigma0Product_reg_n_85),
        .O(rAccumProduct0_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_7
       (.I0(rcpSqrSigma0Product_reg__0_n_69),
        .I1(rcpSqrSigma0Product_reg_n_86),
        .O(rAccumProduct0_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_8
       (.I0(rcpSqrSigma0Product_reg__0_n_70),
        .I1(rcpSqrSigma0Product_reg_n_87),
        .O(rAccumProduct0_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct0_i_9
       (.I0(rcpSqrSigma0Product_reg__0_n_71),
        .I1(rcpSqrSigma0Product_reg_n_88),
        .O(rAccumProduct0_i_9_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \rAccumProduct[16]_i_1 
       (.I0(\rcpPipeline_reg[9][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[9][useEarlyOutBypass_n_0_] ),
        .O(rAccumProduct0__1));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x16 4}}" *) 
  DSP48E2 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(2),
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
    rAccumProduct_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,rRefined0[31:17]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_rAccumProduct_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,rcpSqrSigma0Product_reg__1[63:49]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_rAccumProduct_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_rAccumProduct_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_rAccumProduct_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(rcpSqrSigma0Product0__1),
        .CEA2(rcpSqrSigma00),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(rcpSqrSigma00),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(rAccumProduct0__1),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_rAccumProduct_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_rAccumProduct_reg_OVERFLOW_UNCONNECTED),
        .P({rAccumProduct_reg_n_58,rAccumProduct_reg_n_59,rAccumProduct_reg_n_60,rAccumProduct_reg_n_61,rAccumProduct_reg_n_62,rAccumProduct_reg_n_63,rAccumProduct_reg_n_64,rAccumProduct_reg_n_65,rAccumProduct_reg_n_66,rAccumProduct_reg_n_67,rAccumProduct_reg_n_68,rAccumProduct_reg_n_69,rAccumProduct_reg_n_70,rAccumProduct_reg_n_71,rAccumProduct_reg_n_72,rAccumProduct_reg_n_73,rAccumProduct_reg_n_74,rAccumProduct_reg_n_75,rAccumProduct_reg_n_76,rAccumProduct_reg_n_77,rAccumProduct_reg_n_78,rAccumProduct_reg_n_79,rAccumProduct_reg_n_80,rAccumProduct_reg_n_81,rAccumProduct_reg_n_82,rAccumProduct_reg_n_83,rAccumProduct_reg_n_84,rAccumProduct_reg_n_85,rAccumProduct_reg_n_86,rAccumProduct_reg_n_87,rAccumProduct_reg_n_88,rAccumProduct_reg_n_89,rAccumProduct_reg_n_90,rAccumProduct_reg_n_91,rAccumProduct_reg_n_92,rAccumProduct_reg_n_93,rAccumProduct_reg_n_94,rAccumProduct_reg_n_95,rAccumProduct_reg_n_96,rAccumProduct_reg_n_97,rAccumProduct_reg_n_98,rAccumProduct_reg_n_99,rAccumProduct_reg_n_100,rAccumProduct_reg_n_101,rAccumProduct_reg_n_102,rAccumProduct_reg_n_103,rAccumProduct_reg_n_104,rAccumProduct_reg_n_105}),
        .PATTERNBDETECT(NLW_rAccumProduct_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_rAccumProduct_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({rAccumProduct0_n_106,rAccumProduct0_n_107,rAccumProduct0_n_108,rAccumProduct0_n_109,rAccumProduct0_n_110,rAccumProduct0_n_111,rAccumProduct0_n_112,rAccumProduct0_n_113,rAccumProduct0_n_114,rAccumProduct0_n_115,rAccumProduct0_n_116,rAccumProduct0_n_117,rAccumProduct0_n_118,rAccumProduct0_n_119,rAccumProduct0_n_120,rAccumProduct0_n_121,rAccumProduct0_n_122,rAccumProduct0_n_123,rAccumProduct0_n_124,rAccumProduct0_n_125,rAccumProduct0_n_126,rAccumProduct0_n_127,rAccumProduct0_n_128,rAccumProduct0_n_129,rAccumProduct0_n_130,rAccumProduct0_n_131,rAccumProduct0_n_132,rAccumProduct0_n_133,rAccumProduct0_n_134,rAccumProduct0_n_135,rAccumProduct0_n_136,rAccumProduct0_n_137,rAccumProduct0_n_138,rAccumProduct0_n_139,rAccumProduct0_n_140,rAccumProduct0_n_141,rAccumProduct0_n_142,rAccumProduct0_n_143,rAccumProduct0_n_144,rAccumProduct0_n_145,rAccumProduct0_n_146,rAccumProduct0_n_147,rAccumProduct0_n_148,rAccumProduct0_n_149,rAccumProduct0_n_150,rAccumProduct0_n_151,rAccumProduct0_n_152,rAccumProduct0_n_153}),
        .PCOUT(NLW_rAccumProduct_reg_PCOUT_UNCONNECTED[47:0]),
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
        .UNDERFLOW(NLW_rAccumProduct_reg_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_rAccumProduct_reg_XOROUT_UNCONNECTED[7:0]));
  FDRE \rAccumProduct_reg[0] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_105),
        .Q(\rAccumProduct_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[10] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_95),
        .Q(\rAccumProduct_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[11] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_94),
        .Q(\rAccumProduct_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[12] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_93),
        .Q(\rAccumProduct_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[13] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_92),
        .Q(\rAccumProduct_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[14] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_91),
        .Q(\rAccumProduct_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[15] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_90),
        .Q(\rAccumProduct_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[16] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_89),
        .Q(\rAccumProduct_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[16]__0 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0__0_n_89),
        .Q(\rAccumProduct_reg[16]__0_n_0 ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[1] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_104),
        .Q(\rAccumProduct_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[2] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_103),
        .Q(\rAccumProduct_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[3] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_102),
        .Q(\rAccumProduct_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[4] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_101),
        .Q(\rAccumProduct_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[5] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_100),
        .Q(\rAccumProduct_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[6] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_99),
        .Q(\rAccumProduct_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[7] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_98),
        .Q(\rAccumProduct_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[8] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_97),
        .Q(\rAccumProduct_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \rAccumProduct_reg[9] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(rAccumProduct0_n_96),
        .Q(\rAccumProduct_reg_n_0_[9] ),
        .R(1'b0));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x16 4}}" *) 
  DSP48E2 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(2),
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
    rAccumProduct_reg__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,rRefined0[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_rAccumProduct_reg__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,rcpSqrSigma0Product_reg__1[63:49]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_rAccumProduct_reg__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_rAccumProduct_reg__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_rAccumProduct_reg__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(rcpSqrSigma0Product0__1),
        .CEA2(rcpSqrSigma00),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(rcpSqrSigma00),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(rAccumProduct0__1),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_rAccumProduct_reg__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_rAccumProduct_reg__0_OVERFLOW_UNCONNECTED),
        .P({rAccumProduct_reg__0_n_58,rAccumProduct_reg__0_n_59,rAccumProduct_reg__0_n_60,rAccumProduct_reg__0_n_61,rAccumProduct_reg__0_n_62,rAccumProduct_reg__0_n_63,rAccumProduct_reg__0_n_64,rAccumProduct_reg__0_n_65,rAccumProduct_reg__0_n_66,rAccumProduct_reg__0_n_67,rAccumProduct_reg__0_n_68,rAccumProduct_reg__0_n_69,rAccumProduct_reg__0_n_70,rAccumProduct_reg__0_n_71,rAccumProduct_reg__0_n_72,rAccumProduct_reg__0_n_73,rAccumProduct_reg__0_n_74,rAccumProduct_reg__0_n_75,rAccumProduct_reg__0_n_76,rAccumProduct_reg__0_n_77,rAccumProduct_reg__0_n_78,rAccumProduct_reg__0_n_79,rAccumProduct_reg__0_n_80,rAccumProduct_reg__0_n_81,rAccumProduct_reg__0_n_82,rAccumProduct_reg__0_n_83,rAccumProduct_reg__0_n_84,rAccumProduct_reg__0_n_85,rAccumProduct_reg__0_n_86,rAccumProduct_reg__0_n_87,rAccumProduct_reg__0_n_88,rAccumProduct_reg__0_n_89,rAccumProduct_reg__0_n_90,rAccumProduct_reg__0_n_91,rAccumProduct_reg__0_n_92,rAccumProduct_reg__0_n_93,rAccumProduct_reg__0_n_94,rAccumProduct_reg__0_n_95,rAccumProduct_reg__0_n_96,rAccumProduct_reg__0_n_97,rAccumProduct_reg__0_n_98,rAccumProduct_reg__0_n_99,rAccumProduct_reg__0_n_100,rAccumProduct_reg__0_n_101,rAccumProduct_reg__0_n_102,rAccumProduct_reg__0_n_103,rAccumProduct_reg__0_n_104,rAccumProduct_reg__0_n_105}),
        .PATTERNBDETECT(NLW_rAccumProduct_reg__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_rAccumProduct_reg__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({rAccumProduct0__0_n_106,rAccumProduct0__0_n_107,rAccumProduct0__0_n_108,rAccumProduct0__0_n_109,rAccumProduct0__0_n_110,rAccumProduct0__0_n_111,rAccumProduct0__0_n_112,rAccumProduct0__0_n_113,rAccumProduct0__0_n_114,rAccumProduct0__0_n_115,rAccumProduct0__0_n_116,rAccumProduct0__0_n_117,rAccumProduct0__0_n_118,rAccumProduct0__0_n_119,rAccumProduct0__0_n_120,rAccumProduct0__0_n_121,rAccumProduct0__0_n_122,rAccumProduct0__0_n_123,rAccumProduct0__0_n_124,rAccumProduct0__0_n_125,rAccumProduct0__0_n_126,rAccumProduct0__0_n_127,rAccumProduct0__0_n_128,rAccumProduct0__0_n_129,rAccumProduct0__0_n_130,rAccumProduct0__0_n_131,rAccumProduct0__0_n_132,rAccumProduct0__0_n_133,rAccumProduct0__0_n_134,rAccumProduct0__0_n_135,rAccumProduct0__0_n_136,rAccumProduct0__0_n_137,rAccumProduct0__0_n_138,rAccumProduct0__0_n_139,rAccumProduct0__0_n_140,rAccumProduct0__0_n_141,rAccumProduct0__0_n_142,rAccumProduct0__0_n_143,rAccumProduct0__0_n_144,rAccumProduct0__0_n_145,rAccumProduct0__0_n_146,rAccumProduct0__0_n_147,rAccumProduct0__0_n_148,rAccumProduct0__0_n_149,rAccumProduct0__0_n_150,rAccumProduct0__0_n_151,rAccumProduct0__0_n_152,rAccumProduct0__0_n_153}),
        .PCOUT(NLW_rAccumProduct_reg__0_PCOUT_UNCONNECTED[47:0]),
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
        .UNDERFLOW(NLW_rAccumProduct_reg__0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_rAccumProduct_reg__0_XOROUT_UNCONNECTED[7:0]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 rAccumProduct_reg_i_1
       (.CI(rAccumProduct0_i_2_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_rAccumProduct_reg_i_1_CO_UNCONNECTED[7],rAccumProduct_reg_i_1_n_1,rAccumProduct_reg_i_1_n_2,rAccumProduct_reg_i_1_n_3,rAccumProduct_reg_i_1_n_4,rAccumProduct_reg_i_1_n_5,rAccumProduct_reg_i_1_n_6,rAccumProduct_reg_i_1_n_7}),
        .DI({1'b0,rcpSqrSigma0Product_reg__0_n_60,rcpSqrSigma0Product_reg__0_n_61,rcpSqrSigma0Product_reg__0_n_62,rcpSqrSigma0Product_reg__0_n_63,rcpSqrSigma0Product_reg__0_n_64,rcpSqrSigma0Product_reg__0_n_65,rcpSqrSigma0Product_reg__0_n_66}),
        .O(rcpSqrSigma0Product_reg__1[63:56]),
        .S({rAccumProduct_reg_i_2_n_0,rAccumProduct_reg_i_3_n_0,rAccumProduct_reg_i_4_n_0,rAccumProduct_reg_i_5_n_0,rAccumProduct_reg_i_6_n_0,rAccumProduct_reg_i_7_n_0,rAccumProduct_reg_i_8_n_0,rAccumProduct_reg_i_9_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct_reg_i_2
       (.I0(rcpSqrSigma0Product_reg__0_n_59),
        .I1(rcpSqrSigma0Product_reg_n_76),
        .O(rAccumProduct_reg_i_2_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct_reg_i_3
       (.I0(rcpSqrSigma0Product_reg__0_n_60),
        .I1(rcpSqrSigma0Product_reg_n_77),
        .O(rAccumProduct_reg_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct_reg_i_4
       (.I0(rcpSqrSigma0Product_reg__0_n_61),
        .I1(rcpSqrSigma0Product_reg_n_78),
        .O(rAccumProduct_reg_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct_reg_i_5
       (.I0(rcpSqrSigma0Product_reg__0_n_62),
        .I1(rcpSqrSigma0Product_reg_n_79),
        .O(rAccumProduct_reg_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct_reg_i_6
       (.I0(rcpSqrSigma0Product_reg__0_n_63),
        .I1(rcpSqrSigma0Product_reg_n_80),
        .O(rAccumProduct_reg_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct_reg_i_7
       (.I0(rcpSqrSigma0Product_reg__0_n_64),
        .I1(rcpSqrSigma0Product_reg_n_81),
        .O(rAccumProduct_reg_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct_reg_i_8
       (.I0(rcpSqrSigma0Product_reg__0_n_65),
        .I1(rcpSqrSigma0Product_reg_n_82),
        .O(rAccumProduct_reg_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rAccumProduct_reg_i_9
       (.I0(rcpSqrSigma0Product_reg__0_n_66),
        .I1(rcpSqrSigma0Product_reg_n_83),
        .O(rAccumProduct_reg_i_9_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_11 
       (.I0(rAccumProduct_reg__0_n_59),
        .I1(rAccumProduct_reg_n_76),
        .O(\rAccum[15]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_12 
       (.I0(rAccumProduct_reg__0_n_60),
        .I1(rAccumProduct_reg_n_77),
        .O(\rAccum[15]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_13 
       (.I0(rAccumProduct_reg__0_n_61),
        .I1(rAccumProduct_reg_n_78),
        .O(\rAccum[15]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_14 
       (.I0(rAccumProduct_reg__0_n_62),
        .I1(rAccumProduct_reg_n_79),
        .O(\rAccum[15]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_15 
       (.I0(rAccumProduct_reg__0_n_63),
        .I1(rAccumProduct_reg_n_80),
        .O(\rAccum[15]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_16 
       (.I0(rAccumProduct_reg__0_n_64),
        .I1(rAccumProduct_reg_n_81),
        .O(\rAccum[15]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_17 
       (.I0(rAccumProduct_reg__0_n_65),
        .I1(rAccumProduct_reg_n_82),
        .O(\rAccum[15]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_18 
       (.I0(rAccumProduct_reg__0_n_66),
        .I1(rAccumProduct_reg_n_83),
        .O(\rAccum[15]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_2 
       (.I0(rRefined3[15]),
        .I1(rAccumProduct_reg__1[63]),
        .O(\rAccum[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_3 
       (.I0(rRefined3[14]),
        .I1(rAccumProduct_reg__1[62]),
        .O(\rAccum[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_4 
       (.I0(rRefined3[13]),
        .I1(rAccumProduct_reg__1[61]),
        .O(\rAccum[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_5 
       (.I0(rRefined3[12]),
        .I1(rAccumProduct_reg__1[60]),
        .O(\rAccum[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_6 
       (.I0(rRefined3[11]),
        .I1(rAccumProduct_reg__1[59]),
        .O(\rAccum[15]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_7 
       (.I0(rRefined3[10]),
        .I1(rAccumProduct_reg__1[58]),
        .O(\rAccum[15]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_8 
       (.I0(rRefined3[9]),
        .I1(rAccumProduct_reg__1[57]),
        .O(\rAccum[15]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[15]_i_9 
       (.I0(rRefined3[8]),
        .I1(rAccumProduct_reg__1[56]),
        .O(\rAccum[15]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \rAccum[30]_i_1 
       (.I0(\rcpPipeline_reg[10][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[10][useEarlyOutBypass_n_0_] ),
        .O(rAccum0));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_12 
       (.I0(rAccumProduct_reg__0_n_67),
        .I1(rAccumProduct_reg_n_84),
        .O(\rAccum[7]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_13 
       (.I0(rAccumProduct_reg__0_n_68),
        .I1(rAccumProduct_reg_n_85),
        .O(\rAccum[7]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_14 
       (.I0(rAccumProduct_reg__0_n_69),
        .I1(rAccumProduct_reg_n_86),
        .O(\rAccum[7]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_15 
       (.I0(rAccumProduct_reg__0_n_70),
        .I1(rAccumProduct_reg_n_87),
        .O(\rAccum[7]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_16 
       (.I0(rAccumProduct_reg__0_n_71),
        .I1(rAccumProduct_reg_n_88),
        .O(\rAccum[7]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_17 
       (.I0(rAccumProduct_reg__0_n_72),
        .I1(rAccumProduct_reg_n_89),
        .O(\rAccum[7]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_18 
       (.I0(rAccumProduct_reg__0_n_73),
        .I1(rAccumProduct_reg_n_90),
        .O(\rAccum[7]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_19 
       (.I0(rAccumProduct_reg__0_n_74),
        .I1(rAccumProduct_reg_n_91),
        .O(\rAccum[7]_i_19_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_2 
       (.I0(rRefined3[7]),
        .I1(rAccumProduct_reg__1[55]),
        .O(\rAccum[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_21 
       (.I0(rAccumProduct_reg__0_n_75),
        .I1(rAccumProduct_reg_n_92),
        .O(\rAccum[7]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_22 
       (.I0(rAccumProduct_reg__0_n_76),
        .I1(rAccumProduct_reg_n_93),
        .O(\rAccum[7]_i_22_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_23 
       (.I0(rAccumProduct_reg__0_n_77),
        .I1(rAccumProduct_reg_n_94),
        .O(\rAccum[7]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_24 
       (.I0(rAccumProduct_reg__0_n_78),
        .I1(rAccumProduct_reg_n_95),
        .O(\rAccum[7]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_25 
       (.I0(rAccumProduct_reg__0_n_79),
        .I1(rAccumProduct_reg_n_96),
        .O(\rAccum[7]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_26 
       (.I0(rAccumProduct_reg__0_n_80),
        .I1(rAccumProduct_reg_n_97),
        .O(\rAccum[7]_i_26_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_27 
       (.I0(rAccumProduct_reg__0_n_81),
        .I1(rAccumProduct_reg_n_98),
        .O(\rAccum[7]_i_27_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_28 
       (.I0(rAccumProduct_reg__0_n_82),
        .I1(rAccumProduct_reg_n_99),
        .O(\rAccum[7]_i_28_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_3 
       (.I0(rRefined3[6]),
        .I1(rAccumProduct_reg__1[54]),
        .O(\rAccum[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_30 
       (.I0(rAccumProduct_reg__0_n_83),
        .I1(rAccumProduct_reg_n_100),
        .O(\rAccum[7]_i_30_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_31 
       (.I0(rAccumProduct_reg__0_n_84),
        .I1(rAccumProduct_reg_n_101),
        .O(\rAccum[7]_i_31_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_32 
       (.I0(rAccumProduct_reg__0_n_85),
        .I1(rAccumProduct_reg_n_102),
        .O(\rAccum[7]_i_32_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_33 
       (.I0(rAccumProduct_reg__0_n_86),
        .I1(rAccumProduct_reg_n_103),
        .O(\rAccum[7]_i_33_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_34 
       (.I0(rAccumProduct_reg__0_n_87),
        .I1(rAccumProduct_reg_n_104),
        .O(\rAccum[7]_i_34_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_35 
       (.I0(rAccumProduct_reg__0_n_88),
        .I1(rAccumProduct_reg_n_105),
        .O(\rAccum[7]_i_35_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_36 
       (.I0(rAccumProduct_reg__0_n_89),
        .I1(\rAccumProduct_reg_n_0_[16] ),
        .O(\rAccum[7]_i_36_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_37 
       (.I0(rAccumProduct_reg__0_n_90),
        .I1(\rAccumProduct_reg_n_0_[15] ),
        .O(\rAccum[7]_i_37_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_39 
       (.I0(rAccumProduct_reg__0_n_91),
        .I1(\rAccumProduct_reg_n_0_[14] ),
        .O(\rAccum[7]_i_39_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_4 
       (.I0(rRefined3[5]),
        .I1(rAccumProduct_reg__1[53]),
        .O(\rAccum[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_40 
       (.I0(rAccumProduct_reg__0_n_92),
        .I1(\rAccumProduct_reg_n_0_[13] ),
        .O(\rAccum[7]_i_40_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_41 
       (.I0(rAccumProduct_reg__0_n_93),
        .I1(\rAccumProduct_reg_n_0_[12] ),
        .O(\rAccum[7]_i_41_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_42 
       (.I0(rAccumProduct_reg__0_n_94),
        .I1(\rAccumProduct_reg_n_0_[11] ),
        .O(\rAccum[7]_i_42_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_43 
       (.I0(rAccumProduct_reg__0_n_95),
        .I1(\rAccumProduct_reg_n_0_[10] ),
        .O(\rAccum[7]_i_43_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_44 
       (.I0(rAccumProduct_reg__0_n_96),
        .I1(\rAccumProduct_reg_n_0_[9] ),
        .O(\rAccum[7]_i_44_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_45 
       (.I0(rAccumProduct_reg__0_n_97),
        .I1(\rAccumProduct_reg_n_0_[8] ),
        .O(\rAccum[7]_i_45_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_46 
       (.I0(rAccumProduct_reg__0_n_98),
        .I1(\rAccumProduct_reg_n_0_[7] ),
        .O(\rAccum[7]_i_46_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_47 
       (.I0(rAccumProduct_reg__0_n_99),
        .I1(\rAccumProduct_reg_n_0_[6] ),
        .O(\rAccum[7]_i_47_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_48 
       (.I0(rAccumProduct_reg__0_n_100),
        .I1(\rAccumProduct_reg_n_0_[5] ),
        .O(\rAccum[7]_i_48_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_49 
       (.I0(rAccumProduct_reg__0_n_101),
        .I1(\rAccumProduct_reg_n_0_[4] ),
        .O(\rAccum[7]_i_49_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_5 
       (.I0(rRefined3[4]),
        .I1(rAccumProduct_reg__1[52]),
        .O(\rAccum[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_50 
       (.I0(rAccumProduct_reg__0_n_102),
        .I1(\rAccumProduct_reg_n_0_[3] ),
        .O(\rAccum[7]_i_50_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_51 
       (.I0(rAccumProduct_reg__0_n_103),
        .I1(\rAccumProduct_reg_n_0_[2] ),
        .O(\rAccum[7]_i_51_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_52 
       (.I0(rAccumProduct_reg__0_n_104),
        .I1(\rAccumProduct_reg_n_0_[1] ),
        .O(\rAccum[7]_i_52_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_53 
       (.I0(rAccumProduct_reg__0_n_105),
        .I1(\rAccumProduct_reg_n_0_[0] ),
        .O(\rAccum[7]_i_53_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_6 
       (.I0(rRefined3[3]),
        .I1(rAccumProduct_reg__1[51]),
        .O(\rAccum[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_7 
       (.I0(rRefined3[2]),
        .I1(rAccumProduct_reg__1[50]),
        .O(\rAccum[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_8 
       (.I0(rRefined3[1]),
        .I1(rAccumProduct_reg__1[49]),
        .O(\rAccum[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rAccum[7]_i_9 
       (.I0(rRefined3[0]),
        .I1(rAccumProduct_reg__1[48]),
        .O(\rAccum[7]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[10] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[15]_i_1_n_13 ),
        .Q(L[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[11] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[15]_i_1_n_12 ),
        .Q(L[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[12] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[15]_i_1_n_11 ),
        .Q(L[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[13] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[15]_i_1_n_10 ),
        .Q(L[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[14] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[15]_i_1_n_9 ),
        .Q(L[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[15] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[15]_i_1_n_8 ),
        .Q(L[15]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rAccum_reg[15]_i_1 
       (.CI(\rAccum_reg[7]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\rAccum_reg[15]_i_1_n_0 ,\rAccum_reg[15]_i_1_n_1 ,\rAccum_reg[15]_i_1_n_2 ,\rAccum_reg[15]_i_1_n_3 ,\rAccum_reg[15]_i_1_n_4 ,\rAccum_reg[15]_i_1_n_5 ,\rAccum_reg[15]_i_1_n_6 ,\rAccum_reg[15]_i_1_n_7 }),
        .DI(rRefined3[15:8]),
        .O({\rAccum_reg[15]_i_1_n_8 ,\rAccum_reg[15]_i_1_n_9 ,\rAccum_reg[15]_i_1_n_10 ,\rAccum_reg[15]_i_1_n_11 ,\rAccum_reg[15]_i_1_n_12 ,\rAccum_reg[15]_i_1_n_13 ,\rAccum_reg[15]_i_1_n_14 ,\rAccum_reg[15]_i_1_n_15 }),
        .S({\rAccum[15]_i_2_n_0 ,\rAccum[15]_i_3_n_0 ,\rAccum[15]_i_4_n_0 ,\rAccum[15]_i_5_n_0 ,\rAccum[15]_i_6_n_0 ,\rAccum[15]_i_7_n_0 ,\rAccum[15]_i_8_n_0 ,\rAccum[15]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rAccum_reg[15]_i_10 
       (.CI(\rAccum_reg[7]_i_10_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_rAccum_reg[15]_i_10_CO_UNCONNECTED [7],\rAccum_reg[15]_i_10_n_1 ,\rAccum_reg[15]_i_10_n_2 ,\rAccum_reg[15]_i_10_n_3 ,\rAccum_reg[15]_i_10_n_4 ,\rAccum_reg[15]_i_10_n_5 ,\rAccum_reg[15]_i_10_n_6 ,\rAccum_reg[15]_i_10_n_7 }),
        .DI({1'b0,rAccumProduct_reg__0_n_60,rAccumProduct_reg__0_n_61,rAccumProduct_reg__0_n_62,rAccumProduct_reg__0_n_63,rAccumProduct_reg__0_n_64,rAccumProduct_reg__0_n_65,rAccumProduct_reg__0_n_66}),
        .O(rAccumProduct_reg__1[63:56]),
        .S({\rAccum[15]_i_11_n_0 ,\rAccum[15]_i_12_n_0 ,\rAccum[15]_i_13_n_0 ,\rAccum[15]_i_14_n_0 ,\rAccum[15]_i_15_n_0 ,\rAccum[15]_i_16_n_0 ,\rAccum[15]_i_17_n_0 ,\rAccum[15]_i_18_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[16] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[23]_i_1_n_15 ),
        .Q(L[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[17] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[23]_i_1_n_14 ),
        .Q(L[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[18] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[23]_i_1_n_13 ),
        .Q(L[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[19] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[23]_i_1_n_12 ),
        .Q(L[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[20] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[23]_i_1_n_11 ),
        .Q(L[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[21] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[23]_i_1_n_10 ),
        .Q(L[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[22] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[23]_i_1_n_9 ),
        .Q(L[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[23] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[23]_i_1_n_8 ),
        .Q(L[23]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rAccum_reg[23]_i_1 
       (.CI(\rAccum_reg[15]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\rAccum_reg[23]_i_1_n_0 ,\rAccum_reg[23]_i_1_n_1 ,\rAccum_reg[23]_i_1_n_2 ,\rAccum_reg[23]_i_1_n_3 ,\rAccum_reg[23]_i_1_n_4 ,\rAccum_reg[23]_i_1_n_5 ,\rAccum_reg[23]_i_1_n_6 ,\rAccum_reg[23]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\rAccum_reg[23]_i_1_n_8 ,\rAccum_reg[23]_i_1_n_9 ,\rAccum_reg[23]_i_1_n_10 ,\rAccum_reg[23]_i_1_n_11 ,\rAccum_reg[23]_i_1_n_12 ,\rAccum_reg[23]_i_1_n_13 ,\rAccum_reg[23]_i_1_n_14 ,\rAccum_reg[23]_i_1_n_15 }),
        .S(rRefined3[23:16]));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[24] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[30]_i_2_n_15 ),
        .Q(L[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[25] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[30]_i_2_n_14 ),
        .Q(L[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[26] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[30]_i_2_n_13 ),
        .Q(L[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[27] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[30]_i_2_n_12 ),
        .Q(L[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[28] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[30]_i_2_n_11 ),
        .Q(L[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[29] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[30]_i_2_n_10 ),
        .Q(L[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[30] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[30]_i_2_n_9 ),
        .Q(L[30]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rAccum_reg[30]_i_2 
       (.CI(\rAccum_reg[23]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_rAccum_reg[30]_i_2_CO_UNCONNECTED [7:6],\rAccum_reg[30]_i_2_n_2 ,\rAccum_reg[30]_i_2_n_3 ,\rAccum_reg[30]_i_2_n_4 ,\rAccum_reg[30]_i_2_n_5 ,\rAccum_reg[30]_i_2_n_6 ,\rAccum_reg[30]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_rAccum_reg[30]_i_2_O_UNCONNECTED [7],\rAccum_reg[30]_i_2_n_9 ,\rAccum_reg[30]_i_2_n_10 ,\rAccum_reg[30]_i_2_n_11 ,\rAccum_reg[30]_i_2_n_12 ,\rAccum_reg[30]_i_2_n_13 ,\rAccum_reg[30]_i_2_n_14 ,\rAccum_reg[30]_i_2_n_15 }),
        .S({1'b0,rRefined3[30:24]}));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[6] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[7]_i_1_n_9 ),
        .Q(L[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[7] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[7]_i_1_n_8 ),
        .Q(L[7]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rAccum_reg[7]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\rAccum_reg[7]_i_1_n_0 ,\rAccum_reg[7]_i_1_n_1 ,\rAccum_reg[7]_i_1_n_2 ,\rAccum_reg[7]_i_1_n_3 ,\rAccum_reg[7]_i_1_n_4 ,\rAccum_reg[7]_i_1_n_5 ,\rAccum_reg[7]_i_1_n_6 ,\rAccum_reg[7]_i_1_n_7 }),
        .DI(rRefined3[7:0]),
        .O({\rAccum_reg[7]_i_1_n_8 ,\rAccum_reg[7]_i_1_n_9 ,\NLW_rAccum_reg[7]_i_1_O_UNCONNECTED [5:0]}),
        .S({\rAccum[7]_i_2_n_0 ,\rAccum[7]_i_3_n_0 ,\rAccum[7]_i_4_n_0 ,\rAccum[7]_i_5_n_0 ,\rAccum[7]_i_6_n_0 ,\rAccum[7]_i_7_n_0 ,\rAccum[7]_i_8_n_0 ,\rAccum[7]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rAccum_reg[7]_i_10 
       (.CI(\rAccum_reg[7]_i_11_n_0 ),
        .CI_TOP(1'b0),
        .CO({\rAccum_reg[7]_i_10_n_0 ,\rAccum_reg[7]_i_10_n_1 ,\rAccum_reg[7]_i_10_n_2 ,\rAccum_reg[7]_i_10_n_3 ,\rAccum_reg[7]_i_10_n_4 ,\rAccum_reg[7]_i_10_n_5 ,\rAccum_reg[7]_i_10_n_6 ,\rAccum_reg[7]_i_10_n_7 }),
        .DI({rAccumProduct_reg__0_n_67,rAccumProduct_reg__0_n_68,rAccumProduct_reg__0_n_69,rAccumProduct_reg__0_n_70,rAccumProduct_reg__0_n_71,rAccumProduct_reg__0_n_72,rAccumProduct_reg__0_n_73,rAccumProduct_reg__0_n_74}),
        .O(rAccumProduct_reg__1[55:48]),
        .S({\rAccum[7]_i_12_n_0 ,\rAccum[7]_i_13_n_0 ,\rAccum[7]_i_14_n_0 ,\rAccum[7]_i_15_n_0 ,\rAccum[7]_i_16_n_0 ,\rAccum[7]_i_17_n_0 ,\rAccum[7]_i_18_n_0 ,\rAccum[7]_i_19_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rAccum_reg[7]_i_11 
       (.CI(\rAccum_reg[7]_i_20_n_0 ),
        .CI_TOP(1'b0),
        .CO({\rAccum_reg[7]_i_11_n_0 ,\rAccum_reg[7]_i_11_n_1 ,\rAccum_reg[7]_i_11_n_2 ,\rAccum_reg[7]_i_11_n_3 ,\rAccum_reg[7]_i_11_n_4 ,\rAccum_reg[7]_i_11_n_5 ,\rAccum_reg[7]_i_11_n_6 ,\rAccum_reg[7]_i_11_n_7 }),
        .DI({rAccumProduct_reg__0_n_75,rAccumProduct_reg__0_n_76,rAccumProduct_reg__0_n_77,rAccumProduct_reg__0_n_78,rAccumProduct_reg__0_n_79,rAccumProduct_reg__0_n_80,rAccumProduct_reg__0_n_81,rAccumProduct_reg__0_n_82}),
        .O(\NLW_rAccum_reg[7]_i_11_O_UNCONNECTED [7:0]),
        .S({\rAccum[7]_i_21_n_0 ,\rAccum[7]_i_22_n_0 ,\rAccum[7]_i_23_n_0 ,\rAccum[7]_i_24_n_0 ,\rAccum[7]_i_25_n_0 ,\rAccum[7]_i_26_n_0 ,\rAccum[7]_i_27_n_0 ,\rAccum[7]_i_28_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rAccum_reg[7]_i_20 
       (.CI(\rAccum_reg[7]_i_29_n_0 ),
        .CI_TOP(1'b0),
        .CO({\rAccum_reg[7]_i_20_n_0 ,\rAccum_reg[7]_i_20_n_1 ,\rAccum_reg[7]_i_20_n_2 ,\rAccum_reg[7]_i_20_n_3 ,\rAccum_reg[7]_i_20_n_4 ,\rAccum_reg[7]_i_20_n_5 ,\rAccum_reg[7]_i_20_n_6 ,\rAccum_reg[7]_i_20_n_7 }),
        .DI({rAccumProduct_reg__0_n_83,rAccumProduct_reg__0_n_84,rAccumProduct_reg__0_n_85,rAccumProduct_reg__0_n_86,rAccumProduct_reg__0_n_87,rAccumProduct_reg__0_n_88,rAccumProduct_reg__0_n_89,rAccumProduct_reg__0_n_90}),
        .O(\NLW_rAccum_reg[7]_i_20_O_UNCONNECTED [7:0]),
        .S({\rAccum[7]_i_30_n_0 ,\rAccum[7]_i_31_n_0 ,\rAccum[7]_i_32_n_0 ,\rAccum[7]_i_33_n_0 ,\rAccum[7]_i_34_n_0 ,\rAccum[7]_i_35_n_0 ,\rAccum[7]_i_36_n_0 ,\rAccum[7]_i_37_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rAccum_reg[7]_i_29 
       (.CI(\rAccum_reg[7]_i_38_n_0 ),
        .CI_TOP(1'b0),
        .CO({\rAccum_reg[7]_i_29_n_0 ,\rAccum_reg[7]_i_29_n_1 ,\rAccum_reg[7]_i_29_n_2 ,\rAccum_reg[7]_i_29_n_3 ,\rAccum_reg[7]_i_29_n_4 ,\rAccum_reg[7]_i_29_n_5 ,\rAccum_reg[7]_i_29_n_6 ,\rAccum_reg[7]_i_29_n_7 }),
        .DI({rAccumProduct_reg__0_n_91,rAccumProduct_reg__0_n_92,rAccumProduct_reg__0_n_93,rAccumProduct_reg__0_n_94,rAccumProduct_reg__0_n_95,rAccumProduct_reg__0_n_96,rAccumProduct_reg__0_n_97,rAccumProduct_reg__0_n_98}),
        .O(\NLW_rAccum_reg[7]_i_29_O_UNCONNECTED [7:0]),
        .S({\rAccum[7]_i_39_n_0 ,\rAccum[7]_i_40_n_0 ,\rAccum[7]_i_41_n_0 ,\rAccum[7]_i_42_n_0 ,\rAccum[7]_i_43_n_0 ,\rAccum[7]_i_44_n_0 ,\rAccum[7]_i_45_n_0 ,\rAccum[7]_i_46_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rAccum_reg[7]_i_38 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\rAccum_reg[7]_i_38_n_0 ,\rAccum_reg[7]_i_38_n_1 ,\rAccum_reg[7]_i_38_n_2 ,\rAccum_reg[7]_i_38_n_3 ,\rAccum_reg[7]_i_38_n_4 ,\rAccum_reg[7]_i_38_n_5 ,\rAccum_reg[7]_i_38_n_6 ,\rAccum_reg[7]_i_38_n_7 }),
        .DI({rAccumProduct_reg__0_n_99,rAccumProduct_reg__0_n_100,rAccumProduct_reg__0_n_101,rAccumProduct_reg__0_n_102,rAccumProduct_reg__0_n_103,rAccumProduct_reg__0_n_104,rAccumProduct_reg__0_n_105,1'b0}),
        .O(\NLW_rAccum_reg[7]_i_38_O_UNCONNECTED [7:0]),
        .S({\rAccum[7]_i_47_n_0 ,\rAccum[7]_i_48_n_0 ,\rAccum[7]_i_49_n_0 ,\rAccum[7]_i_50_n_0 ,\rAccum[7]_i_51_n_0 ,\rAccum[7]_i_52_n_0 ,\rAccum[7]_i_53_n_0 ,\rAccumProduct_reg[16]__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[8] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[15]_i_1_n_15 ),
        .Q(L[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rAccum_reg[9] 
       (.C(clk),
        .CE(rAccum0),
        .D(\rAccum_reg[15]_i_1_n_14 ),
        .Q(L[9]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rInitialGuess00_inferred__0/i__carry 
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({\rInitialGuess00_inferred__0/i__carry_n_0 ,\rInitialGuess00_inferred__0/i__carry_n_1 ,\rInitialGuess00_inferred__0/i__carry_n_2 ,\rInitialGuess00_inferred__0/i__carry_n_3 ,\rInitialGuess00_inferred__0/i__carry_n_4 ,\rInitialGuess00_inferred__0/i__carry_n_5 ,\rInitialGuess00_inferred__0/i__carry_n_6 ,\rInitialGuess00_inferred__0/i__carry_n_7 }),
        .DI(rcpLookupOffset1[7:0]),
        .O(rInitialGuess000_in[7:0]),
        .S({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0,i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rInitialGuess00_inferred__0/i__carry__0 
       (.CI(\rInitialGuess00_inferred__0/i__carry_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_rInitialGuess00_inferred__0/i__carry__0_CO_UNCONNECTED [7],\rInitialGuess00_inferred__0/i__carry__0_n_1 ,\rInitialGuess00_inferred__0/i__carry__0_n_2 ,\rInitialGuess00_inferred__0/i__carry__0_n_3 ,\rInitialGuess00_inferred__0/i__carry__0_n_4 ,\rInitialGuess00_inferred__0/i__carry__0_n_5 ,\rInitialGuess00_inferred__0/i__carry__0_n_6 ,\rInitialGuess00_inferred__0/i__carry__0_n_7 }),
        .DI({1'b0,rcpLookupOffset1[14:8]}),
        .O(rInitialGuess000_in[15:8]),
        .S({i__carry__0_i_1_n_0,i__carry__0_i_2_n_0,i__carry__0_i_3_n_0,i__carry__0_i_4_n_0,i__carry__0_i_5_n_0,i__carry__0_i_6_n_0,i__carry__0_i_7_n_0,i__carry__0_i_8_n_0}));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[0] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[0]),
        .Q(rInitialGuess0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[10] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[10]),
        .Q(rInitialGuess0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[11] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[11]),
        .Q(rInitialGuess0[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[12] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[12]),
        .Q(rInitialGuess0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[13] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[13]),
        .Q(rInitialGuess0[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[14] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[14]),
        .Q(rInitialGuess0[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[15] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[15]),
        .Q(rInitialGuess0[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[1] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[1]),
        .Q(rInitialGuess0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[2] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[2]),
        .Q(rInitialGuess0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[3] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[3]),
        .Q(rInitialGuess0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[4] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[4]),
        .Q(rInitialGuess0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[5] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[5]),
        .Q(rInitialGuess0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[6] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[6]),
        .Q(rInitialGuess0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[7] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[7]),
        .Q(rInitialGuess0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[8] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[8]),
        .Q(rInitialGuess0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess0_reg[9] 
       (.C(clk),
        .CE(rInitialGuess00),
        .D(rInitialGuess000_in[9]),
        .Q(rInitialGuess0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[0] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[0]),
        .Q(rInitialGuess1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[10] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[10]),
        .Q(rInitialGuess1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[11] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[11]),
        .Q(rInitialGuess1[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[12] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[12]),
        .Q(rInitialGuess1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[13] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[13]),
        .Q(rInitialGuess1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[14] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[14]),
        .Q(rInitialGuess1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[15] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[15]),
        .Q(rInitialGuess1[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[1] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[1]),
        .Q(rInitialGuess1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[2] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[2]),
        .Q(rInitialGuess1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[3] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[3]),
        .Q(rInitialGuess1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[4] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[4]),
        .Q(rInitialGuess1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[5] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[5]),
        .Q(rInitialGuess1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[6] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[6]),
        .Q(rInitialGuess1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[7] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[7]),
        .Q(rInitialGuess1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[8] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[8]),
        .Q(rInitialGuess1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess1_reg[9] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(rInitialGuess0[9]),
        .Q(rInitialGuess1[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[0] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[0]),
        .Q(rInitialGuess2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[10] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[10]),
        .Q(rInitialGuess2[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[11] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[11]),
        .Q(rInitialGuess2[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[12] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[12]),
        .Q(rInitialGuess2[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[13] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[13]),
        .Q(rInitialGuess2[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[14] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[14]),
        .Q(rInitialGuess2[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[15] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[15]),
        .Q(rInitialGuess2[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[1] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[1]),
        .Q(rInitialGuess2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[2] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[2]),
        .Q(rInitialGuess2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[3] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[3]),
        .Q(rInitialGuess2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[4] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[4]),
        .Q(rInitialGuess2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[5] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[5]),
        .Q(rInitialGuess2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[6] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[6]),
        .Q(rInitialGuess2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[7] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[7]),
        .Q(rInitialGuess2[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[8] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[8]),
        .Q(rInitialGuess2[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess2_reg[9] 
       (.C(clk),
        .CE(rcpSigma00),
        .D(rInitialGuess1[9]),
        .Q(rInitialGuess2[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[0] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[0]),
        .Q(rInitialGuess3[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[10] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[10]),
        .Q(rInitialGuess3[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[11] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[11]),
        .Q(rInitialGuess3[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[12] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[12]),
        .Q(rInitialGuess3[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[13] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[13]),
        .Q(rInitialGuess3[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[14] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[14]),
        .Q(rInitialGuess3[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[15] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[15]),
        .Q(rInitialGuess3[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[1] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[1]),
        .Q(rInitialGuess3[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[2] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[2]),
        .Q(rInitialGuess3[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[3] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[3]),
        .Q(rInitialGuess3[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[4] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[4]),
        .Q(rInitialGuess3[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[5] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[5]),
        .Q(rInitialGuess3[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[6] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[6]),
        .Q(rInitialGuess3[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[7] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[7]),
        .Q(rInitialGuess3[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[8] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[8]),
        .Q(rInitialGuess3[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rInitialGuess3_reg[9] 
       (.C(clk),
        .CE(rProduct0__0),
        .D(rInitialGuess2[9]),
        .Q(rInitialGuess3[9]),
        .R(1'b0));
  (* KEEP_HIERARCHY = "YES" *) 
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
    .BCASCREG(2),
    .BMULTSEL("B"),
    .BREG(2),
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
    rProduct0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\not [16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_rProduct0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,rInitialGuess0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_rProduct0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_rProduct0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_rProduct0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(rcpSigma00),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(sigma0TempProduct0__0),
        .CEB2(rcpSigma00),
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
        .MULTSIGNOUT(NLW_rProduct0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_rProduct0_OVERFLOW_UNCONNECTED),
        .P({rProduct0_n_58,rProduct0_n_59,rProduct0_n_60,rProduct0_n_61,rProduct0_n_62,rProduct0_n_63,rProduct0_n_64,rProduct0_n_65,rProduct0_n_66,rProduct0_n_67,rProduct0_n_68,rProduct0_n_69,rProduct0_n_70,rProduct0_n_71,rProduct0_n_72,rProduct0_n_73,rProduct0_n_74,rProduct0_n_75,rProduct0_n_76,rProduct0_n_77,rProduct0_n_78,rProduct0_n_79,rProduct0_n_80,rProduct0_n_81,rProduct0_n_82,rProduct0_n_83,rProduct0_n_84,rProduct0_n_85,rProduct0_n_86,rProduct0_n_87,rProduct0_n_88,rProduct0_n_89,rProduct0_n_90,rProduct0_n_91,rProduct0_n_92,rProduct0_n_93,rProduct0_n_94,rProduct0_n_95,rProduct0_n_96,rProduct0_n_97,rProduct0_n_98,rProduct0_n_99,rProduct0_n_100,rProduct0_n_101,rProduct0_n_102,rProduct0_n_103,rProduct0_n_104,rProduct0_n_105}),
        .PATTERNBDETECT(NLW_rProduct0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_rProduct0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({rProduct0_n_106,rProduct0_n_107,rProduct0_n_108,rProduct0_n_109,rProduct0_n_110,rProduct0_n_111,rProduct0_n_112,rProduct0_n_113,rProduct0_n_114,rProduct0_n_115,rProduct0_n_116,rProduct0_n_117,rProduct0_n_118,rProduct0_n_119,rProduct0_n_120,rProduct0_n_121,rProduct0_n_122,rProduct0_n_123,rProduct0_n_124,rProduct0_n_125,rProduct0_n_126,rProduct0_n_127,rProduct0_n_128,rProduct0_n_129,rProduct0_n_130,rProduct0_n_131,rProduct0_n_132,rProduct0_n_133,rProduct0_n_134,rProduct0_n_135,rProduct0_n_136,rProduct0_n_137,rProduct0_n_138,rProduct0_n_139,rProduct0_n_140,rProduct0_n_141,rProduct0_n_142,rProduct0_n_143,rProduct0_n_144,rProduct0_n_145,rProduct0_n_146,rProduct0_n_147,rProduct0_n_148,rProduct0_n_149,rProduct0_n_150,rProduct0_n_151,rProduct0_n_152,rProduct0_n_153}),
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
        .UNDERFLOW(NLW_rProduct0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_rProduct0_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "YES" *) 
  DSP48E2 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(2),
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
    rProduct_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,rInitialGuess0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_rProduct_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,\not [31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_rProduct_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_rProduct_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_rProduct_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(sigma0TempProduct0__0),
        .CEA2(rcpSigma00),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(rcpSigma00),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(rProduct0__0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_rProduct_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_rProduct_reg_OVERFLOW_UNCONNECTED),
        .P({rProduct_reg_n_58,rProduct_reg_n_59,rProduct_reg_n_60,rProduct_reg_n_61,rProduct_reg_n_62,rProduct_reg_n_63,rProduct_reg_n_64,rProduct_reg_n_65,rProduct_reg_n_66,rProduct_reg_n_67,rProduct_reg_n_68,rProduct_reg_n_69,rProduct_reg_n_70,rProduct_reg_n_71,rProduct_reg_n_72,rProduct_reg_n_73,rProduct_reg_n_74,rProduct_reg__0,rProduct_reg_n_99,rProduct_reg_n_100,rProduct_reg_n_101,rProduct_reg_n_102,rProduct_reg_n_103,rProduct_reg_n_104,rProduct_reg_n_105}),
        .PATTERNBDETECT(NLW_rProduct_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_rProduct_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({rProduct0_n_106,rProduct0_n_107,rProduct0_n_108,rProduct0_n_109,rProduct0_n_110,rProduct0_n_111,rProduct0_n_112,rProduct0_n_113,rProduct0_n_114,rProduct0_n_115,rProduct0_n_116,rProduct0_n_117,rProduct0_n_118,rProduct0_n_119,rProduct0_n_120,rProduct0_n_121,rProduct0_n_122,rProduct0_n_123,rProduct0_n_124,rProduct0_n_125,rProduct0_n_126,rProduct0_n_127,rProduct0_n_128,rProduct0_n_129,rProduct0_n_130,rProduct0_n_131,rProduct0_n_132,rProduct0_n_133,rProduct0_n_134,rProduct0_n_135,rProduct0_n_136,rProduct0_n_137,rProduct0_n_138,rProduct0_n_139,rProduct0_n_140,rProduct0_n_141,rProduct0_n_142,rProduct0_n_143,rProduct0_n_144,rProduct0_n_145,rProduct0_n_146,rProduct0_n_147,rProduct0_n_148,rProduct0_n_149,rProduct0_n_150,rProduct0_n_151,rProduct0_n_152,rProduct0_n_153}),
        .PCOUT(NLW_rProduct_reg_PCOUT_UNCONNECTED[47:0]),
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
        .UNDERFLOW(NLW_rProduct_reg_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_rProduct_reg_XOROUT_UNCONNECTED[7:0]));
  LUT2 #(
    .INIT(4'h2)) 
    rProduct_reg_i_1
       (.I0(\rcpPipeline_reg[5][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[5][useEarlyOutBypass_n_0_] ),
        .O(rProduct0__0));
  LUT2 #(
    .INIT(4'h6)) 
    \rRefined0[22]_i_2 
       (.I0(rInitialGuess3[6]),
        .I1(rProduct_reg__0[46]),
        .O(\rRefined0[22]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rRefined0[22]_i_3 
       (.I0(rInitialGuess3[5]),
        .I1(rProduct_reg__0[45]),
        .O(\rRefined0[22]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rRefined0[22]_i_4 
       (.I0(rInitialGuess3[4]),
        .I1(rProduct_reg__0[44]),
        .O(\rRefined0[22]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rRefined0[22]_i_5 
       (.I0(rInitialGuess3[3]),
        .I1(rProduct_reg__0[43]),
        .O(\rRefined0[22]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rRefined0[22]_i_6 
       (.I0(rInitialGuess3[2]),
        .I1(rProduct_reg__0[42]),
        .O(\rRefined0[22]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rRefined0[22]_i_7 
       (.I0(rInitialGuess3[1]),
        .I1(rProduct_reg__0[41]),
        .O(\rRefined0[22]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rRefined0[22]_i_8 
       (.I0(rInitialGuess3[0]),
        .I1(rProduct_reg__0[40]),
        .O(\rRefined0[22]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rRefined0[30]_i_2 
       (.I0(rInitialGuess3[7]),
        .I1(rProduct_reg__0[47]),
        .O(\rRefined0[30]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \rRefined0[31]_i_1 
       (.I0(\rcpPipeline_reg[6][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[6][useEarlyOutBypass_n_0_] ),
        .O(rRefined00));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[0] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[24]),
        .Q(rRefined0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[10] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[34]),
        .Q(rRefined0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[11] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[35]),
        .Q(rRefined0[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[12] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[36]),
        .Q(rRefined0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[13] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[37]),
        .Q(rRefined0[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[14] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[38]),
        .Q(rRefined0[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[15] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[22]_i_1_n_15 ),
        .Q(rRefined0[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[16] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[22]_i_1_n_14 ),
        .Q(rRefined0[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[17] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[22]_i_1_n_13 ),
        .Q(rRefined0[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[18] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[22]_i_1_n_12 ),
        .Q(rRefined0[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[19] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[22]_i_1_n_11 ),
        .Q(rRefined0[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[1] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[25]),
        .Q(rRefined0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[20] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[22]_i_1_n_10 ),
        .Q(rRefined0[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[21] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[22]_i_1_n_9 ),
        .Q(rRefined0[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[22] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[22]_i_1_n_8 ),
        .Q(rRefined0[22]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rRefined0_reg[22]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\rRefined0_reg[22]_i_1_n_0 ,\rRefined0_reg[22]_i_1_n_1 ,\rRefined0_reg[22]_i_1_n_2 ,\rRefined0_reg[22]_i_1_n_3 ,\rRefined0_reg[22]_i_1_n_4 ,\rRefined0_reg[22]_i_1_n_5 ,\rRefined0_reg[22]_i_1_n_6 ,\rRefined0_reg[22]_i_1_n_7 }),
        .DI({rInitialGuess3[6:0],1'b0}),
        .O({\rRefined0_reg[22]_i_1_n_8 ,\rRefined0_reg[22]_i_1_n_9 ,\rRefined0_reg[22]_i_1_n_10 ,\rRefined0_reg[22]_i_1_n_11 ,\rRefined0_reg[22]_i_1_n_12 ,\rRefined0_reg[22]_i_1_n_13 ,\rRefined0_reg[22]_i_1_n_14 ,\rRefined0_reg[22]_i_1_n_15 }),
        .S({\rRefined0[22]_i_2_n_0 ,\rRefined0[22]_i_3_n_0 ,\rRefined0[22]_i_4_n_0 ,\rRefined0[22]_i_5_n_0 ,\rRefined0[22]_i_6_n_0 ,\rRefined0[22]_i_7_n_0 ,\rRefined0[22]_i_8_n_0 ,rProduct_reg__0[39]}));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[23] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[30]_i_1_n_15 ),
        .Q(rRefined0[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[24] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[30]_i_1_n_14 ),
        .Q(rRefined0[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[25] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[30]_i_1_n_13 ),
        .Q(rRefined0[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[26] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[30]_i_1_n_12 ),
        .Q(rRefined0[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[27] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[30]_i_1_n_11 ),
        .Q(rRefined0[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[28] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[30]_i_1_n_10 ),
        .Q(rRefined0[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[29] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[30]_i_1_n_9 ),
        .Q(rRefined0[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[2] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[26]),
        .Q(rRefined0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[30] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[30]_i_1_n_8 ),
        .Q(rRefined0[30]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rRefined0_reg[30]_i_1 
       (.CI(\rRefined0_reg[22]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\rRefined0_reg[30]_i_1_n_0 ,\rRefined0_reg[30]_i_1_n_1 ,\rRefined0_reg[30]_i_1_n_2 ,\rRefined0_reg[30]_i_1_n_3 ,\rRefined0_reg[30]_i_1_n_4 ,\rRefined0_reg[30]_i_1_n_5 ,\rRefined0_reg[30]_i_1_n_6 ,\rRefined0_reg[30]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,rInitialGuess3[7]}),
        .O({\rRefined0_reg[30]_i_1_n_8 ,\rRefined0_reg[30]_i_1_n_9 ,\rRefined0_reg[30]_i_1_n_10 ,\rRefined0_reg[30]_i_1_n_11 ,\rRefined0_reg[30]_i_1_n_12 ,\rRefined0_reg[30]_i_1_n_13 ,\rRefined0_reg[30]_i_1_n_14 ,\rRefined0_reg[30]_i_1_n_15 }),
        .S({rInitialGuess3[14:8],\rRefined0[30]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[31] 
       (.C(clk),
        .CE(rRefined00),
        .D(\rRefined0_reg[31]_i_2_n_15 ),
        .Q(rRefined0[31]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \rRefined0_reg[31]_i_2 
       (.CI(\rRefined0_reg[30]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO(\NLW_rRefined0_reg[31]_i_2_CO_UNCONNECTED [7:0]),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_rRefined0_reg[31]_i_2_O_UNCONNECTED [7:1],\rRefined0_reg[31]_i_2_n_15 }),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,rInitialGuess3[15]}));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[3] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[27]),
        .Q(rRefined0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[4] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[28]),
        .Q(rRefined0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[5] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[29]),
        .Q(rRefined0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[6] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[30]),
        .Q(rRefined0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[7] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[31]),
        .Q(rRefined0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[8] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[32]),
        .Q(rRefined0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined0_reg[9] 
       (.C(clk),
        .CE(rRefined00),
        .D(rProduct_reg__0[33]),
        .Q(rRefined0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[0] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[0]),
        .Q(rRefined1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[10] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[10]),
        .Q(rRefined1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[11] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[11]),
        .Q(rRefined1[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[12] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[12]),
        .Q(rRefined1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[13] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[13]),
        .Q(rRefined1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[14] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[14]),
        .Q(rRefined1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[15] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[15]),
        .Q(rRefined1[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[16] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[16]),
        .Q(rRefined1[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[17] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[17]),
        .Q(rRefined1[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[18] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[18]),
        .Q(rRefined1[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[19] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[19]),
        .Q(rRefined1[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[1] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[1]),
        .Q(rRefined1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[20] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[20]),
        .Q(rRefined1[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[21] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[21]),
        .Q(rRefined1[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[22] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[22]),
        .Q(rRefined1[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[23] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[23]),
        .Q(rRefined1[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[24] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[24]),
        .Q(rRefined1[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[25] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[25]),
        .Q(rRefined1[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[26] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[26]),
        .Q(rRefined1[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[27] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[27]),
        .Q(rRefined1[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[28] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[28]),
        .Q(rRefined1[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[29] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[29]),
        .Q(rRefined1[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[2] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[2]),
        .Q(rRefined1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[30] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[30]),
        .Q(rRefined1[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[3] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[3]),
        .Q(rRefined1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[4] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[4]),
        .Q(rRefined1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[5] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[5]),
        .Q(rRefined1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[6] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[6]),
        .Q(rRefined1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[7] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[7]),
        .Q(rRefined1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[8] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[8]),
        .Q(rRefined1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined1_reg[9] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rRefined0[9]),
        .Q(rRefined1[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[0] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[0]),
        .Q(\rRefined2_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[10] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[10]),
        .Q(\rRefined2_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[11] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[11]),
        .Q(\rRefined2_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[12] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[12]),
        .Q(\rRefined2_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[13] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[13]),
        .Q(\rRefined2_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[14] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[14]),
        .Q(\rRefined2_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[15] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[15]),
        .Q(\rRefined2_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[16] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[16]),
        .Q(\rRefined2_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[17] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[17]),
        .Q(\rRefined2_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[18] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[18]),
        .Q(\rRefined2_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[19] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[19]),
        .Q(\rRefined2_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[1] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[1]),
        .Q(\rRefined2_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[20] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[20]),
        .Q(\rRefined2_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[21] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[21]),
        .Q(\rRefined2_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[22] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[22]),
        .Q(\rRefined2_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[23] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[23]),
        .Q(\rRefined2_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[24] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[24]),
        .Q(\rRefined2_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[25] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[25]),
        .Q(\rRefined2_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[26] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[26]),
        .Q(\rRefined2_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[27] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[27]),
        .Q(\rRefined2_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[28] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[28]),
        .Q(\rRefined2_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[29] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[29]),
        .Q(\rRefined2_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[2] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[2]),
        .Q(\rRefined2_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[30] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[30]),
        .Q(\rRefined2_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[3] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[3]),
        .Q(\rRefined2_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[4] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[4]),
        .Q(\rRefined2_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[5] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[5]),
        .Q(\rRefined2_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[6] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[6]),
        .Q(\rRefined2_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[7] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[7]),
        .Q(\rRefined2_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[8] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[8]),
        .Q(\rRefined2_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined2_reg[9] 
       (.C(clk),
        .CE(rcpSqrSigma00),
        .D(rRefined1[9]),
        .Q(\rRefined2_reg_n_0_[9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[0] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[0] ),
        .Q(rRefined3[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[10] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[10] ),
        .Q(rRefined3[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[11] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[11] ),
        .Q(rRefined3[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[12] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[12] ),
        .Q(rRefined3[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[13] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[13] ),
        .Q(rRefined3[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[14] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[14] ),
        .Q(rRefined3[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[15] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[15] ),
        .Q(rRefined3[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[16] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[16] ),
        .Q(rRefined3[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[17] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[17] ),
        .Q(rRefined3[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[18] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[18] ),
        .Q(rRefined3[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[19] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[19] ),
        .Q(rRefined3[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[1] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[1] ),
        .Q(rRefined3[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[20] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[20] ),
        .Q(rRefined3[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[21] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[21] ),
        .Q(rRefined3[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[22] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[22] ),
        .Q(rRefined3[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[23] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[23] ),
        .Q(rRefined3[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[24] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[24] ),
        .Q(rRefined3[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[25] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[25] ),
        .Q(rRefined3[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[26] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[26] ),
        .Q(rRefined3[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[27] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[27] ),
        .Q(rRefined3[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[28] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[28] ),
        .Q(rRefined3[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[29] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[29] ),
        .Q(rRefined3[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[2] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[2] ),
        .Q(rRefined3[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[30] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[30] ),
        .Q(rRefined3[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[3] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[3] ),
        .Q(rRefined3[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[4] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[4] ),
        .Q(rRefined3[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[5] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[5] ),
        .Q(rRefined3[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[6] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[6] ),
        .Q(rRefined3[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[7] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[7] ),
        .Q(rRefined3[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[8] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[8] ),
        .Q(rRefined3[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rRefined3_reg[9] 
       (.C(clk),
        .CE(rAccumProduct0__1),
        .D(\rRefined2_reg_n_0_[9] ),
        .Q(rRefined3[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hC512)) 
    \rcpLookupOffset0[0]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Offsets[0]_1 [0]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hB825)) 
    \rcpLookupOffset0[10]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Offsets[0]_1 [10]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h08E7)) 
    \rcpLookupOffset0[11]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Offsets[0]_1 [11]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h7619)) 
    \rcpLookupOffset0[12]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Offsets[0]_1 [12]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h4353)) 
    \rcpLookupOffset0[13]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Offsets[0]_1 [13]));
  LUT3 #(
    .INIT(8'h07)) 
    \rcpLookupOffset0[14]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .O(\rcpLookupOffset0[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'hBFB2)) 
    \rcpLookupOffset0[1]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Offsets[0]_1 [1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'hBC3F)) 
    \rcpLookupOffset0[2]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Offsets[0]_1 [2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h05B8)) 
    \rcpLookupOffset0[3]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Offsets[0]_1 [3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h8EDA)) 
    \rcpLookupOffset0[4]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Offsets[0]_1 [4]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h3BDC)) 
    \rcpLookupOffset0[5]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Offsets[0]_1 [5]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT4 #(
    .INIT(16'h1B61)) 
    \rcpLookupOffset0[6]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Offsets[0]_1 [6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT4 #(
    .INIT(16'h203F)) 
    \rcpLookupOffset0[7]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Offsets[0]_1 [7]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h08F9)) 
    \rcpLookupOffset0[8]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .O(\RcpLookupTable_Offsets[0]_1 [8]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'h765B)) 
    \rcpLookupOffset0[9]_i_1 
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Offsets[0]_1 [9]));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[0] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [0]),
        .Q(rcpLookupOffset0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[10] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [10]),
        .Q(rcpLookupOffset0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[11] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [11]),
        .Q(rcpLookupOffset0[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[12] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [12]),
        .Q(rcpLookupOffset0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[13] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [13]),
        .Q(rcpLookupOffset0[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[14] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\rcpLookupOffset0[14]_i_1_n_0 ),
        .Q(rcpLookupOffset0[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[15] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(1'b1),
        .Q(rcpLookupOffset0[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[1] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [1]),
        .Q(rcpLookupOffset0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[2] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [2]),
        .Q(rcpLookupOffset0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[3] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [3]),
        .Q(rcpLookupOffset0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[4] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [4]),
        .Q(rcpLookupOffset0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[5] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [5]),
        .Q(rcpLookupOffset0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[6] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [6]),
        .Q(rcpLookupOffset0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[7] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [7]),
        .Q(rcpLookupOffset0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[8] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [8]),
        .Q(rcpLookupOffset0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset0_reg[9] 
       (.C(clk),
        .CE(rcpLookupSlope0),
        .D(\RcpLookupTable_Offsets[0]_1 [9]),
        .Q(rcpLookupOffset0[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[0] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[0]),
        .Q(rcpLookupOffset1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[10] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[10]),
        .Q(rcpLookupOffset1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[11] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[11]),
        .Q(rcpLookupOffset1[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[12] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[12]),
        .Q(rcpLookupOffset1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[13] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[13]),
        .Q(rcpLookupOffset1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[14] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[14]),
        .Q(rcpLookupOffset1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[15] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[15]),
        .Q(rcpLookupOffset1[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[1] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[1]),
        .Q(rcpLookupOffset1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[2] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[2]),
        .Q(rcpLookupOffset1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[3] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[3]),
        .Q(rcpLookupOffset1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[4] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[4]),
        .Q(rcpLookupOffset1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[5] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[5]),
        .Q(rcpLookupOffset1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[6] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[6]),
        .Q(rcpLookupOffset1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[7] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[7]),
        .Q(rcpLookupOffset1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[8] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[8]),
        .Q(rcpLookupOffset1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \rcpLookupOffset1_reg[9] 
       (.C(clk),
        .CE(slopeMultiply0),
        .D(rcpLookupOffset0[9]),
        .Q(rcpLookupOffset1[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    \rcpPipeline[0][calculatedMantissa][0]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[0]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(\rcpPipeline[0][calculatedMantissa][0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    \rcpPipeline[0][calculatedMantissa][19]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[19]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(\rcpPipeline[0][calculatedMantissa][19]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    \rcpPipeline[0][calculatedMantissa][1]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[1]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(\rcpPipeline[0][calculatedMantissa][1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    \rcpPipeline[0][calculatedMantissa][20]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[20]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(\rcpPipeline[0][calculatedMantissa][20]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    \rcpPipeline[0][calculatedMantissa][21]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[21]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(\rcpPipeline[0][calculatedMantissa][21]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[22]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_10 
       (.I0(IN_A[16]),
        .I1(IN_A[15]),
        .I2(IN_A[6]),
        .I3(IN_A[17]),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_10_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_11 
       (.I0(IN_A[1]),
        .I1(IN_A[2]),
        .I2(IN_A[0]),
        .I3(IN_A[3]),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_11_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_12 
       (.I0(IN_A[23]),
        .I1(IN_A[25]),
        .I2(IN_A[24]),
        .I3(IN_A[27]),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_13 
       (.I0(IN_A[30]),
        .I1(IN_A[29]),
        .I2(IN_A[28]),
        .I3(IN_A[27]),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_13_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_2 
       (.I0(IN_A[29]),
        .I1(IN_A[23]),
        .I2(\rcpPipeline[0][rcpExponent][0]_i_2_n_0 ),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFEFFFFFFFF)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_3 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_6_n_0 ),
        .I1(\rcpPipeline[0][calculatedMantissa][22]_i_7_n_0 ),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_8_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_9_n_0 ),
        .I4(\rcpPipeline[0][calculatedMantissa][22]_i_10_n_0 ),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_11_n_0 ),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_4 
       (.I0(IN_A[26]),
        .I1(IN_A[28]),
        .I2(IN_A[29]),
        .I3(IN_A[30]),
        .I4(\rcpPipeline[0][calculatedMantissa][22]_i_12_n_0 ),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_5 
       (.I0(IN_A[24]),
        .I1(IN_A[23]),
        .I2(IN_A[26]),
        .I3(IN_A[25]),
        .I4(\rcpPipeline[0][calculatedMantissa][22]_i_13_n_0 ),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_6 
       (.I0(IN_A[20]),
        .I1(IN_A[14]),
        .I2(IN_A[19]),
        .I3(IN_A[13]),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_7 
       (.I0(IN_A[8]),
        .I1(IN_A[7]),
        .I2(IN_A[22]),
        .I3(IN_A[21]),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_8 
       (.I0(IN_A[11]),
        .I1(IN_A[10]),
        .I2(IN_A[4]),
        .I3(IN_A[5]),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \rcpPipeline[0][calculatedMantissa][22]_i_9 
       (.I0(IN_A[18]),
        .I1(IN_A[12]),
        .I2(IN_A[9]),
        .O(\rcpPipeline[0][calculatedMantissa][22]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    \rcpPipeline[0][calculatedMantissa][2]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[2]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(\rcpPipeline[0][calculatedMantissa][2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h08FFF700FFFFFFFF)) 
    \rcpPipeline[0][rcpExponent][0]_i_1 
       (.I0(IN_A[30]),
        .I1(IN_A[29]),
        .I2(\rcpPipeline[0][rcpExponent][0]_i_2_n_0 ),
        .I3(IN_A[23]),
        .I4(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .O(\rcpPipeline[0][rcpExponent][0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \rcpPipeline[0][rcpExponent][0]_i_2 
       (.I0(IN_A[27]),
        .I1(IN_A[24]),
        .I2(IN_A[26]),
        .I3(IN_A[25]),
        .I4(IN_A[28]),
        .O(\rcpPipeline[0][rcpExponent][0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hA988FFFF)) 
    \rcpPipeline[0][rcpExponent][1]_i_1 
       (.I0(IN_A[24]),
        .I1(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I2(IN_A[23]),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .I4(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .O(\rcpPipeline[0][rcpExponent][1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE0C20E0E)) 
    \rcpPipeline[0][rcpExponent][2]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .I1(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I2(IN_A[25]),
        .I3(IN_A[23]),
        .I4(IN_A[24]),
        .O(\rcpPipeline[0][rcpExponent][2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hE0C20E0E0E0E0E0E)) 
    \rcpPipeline[0][rcpExponent][3]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .I1(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I2(IN_A[26]),
        .I3(IN_A[23]),
        .I4(IN_A[25]),
        .I5(IN_A[24]),
        .O(\rcpPipeline[0][rcpExponent][3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \rcpPipeline[0][rcpExponent][4]_i_1 
       (.I0(ISPEC_GO),
        .I1(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .O(\rcpPipeline[0][rcpExponent][4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h9595955555555555)) 
    \rcpPipeline[0][rcpExponent][4]_i_2 
       (.I0(IN_A[27]),
        .I1(IN_A[24]),
        .I2(IN_A[25]),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I4(IN_A[23]),
        .I5(IN_A[26]),
        .O(\rcpPipeline[0][rcpExponent][4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h0E0EE0C2)) 
    \rcpPipeline[0][rcpExponent][5]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .I1(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I2(IN_A[28]),
        .I3(IN_A[23]),
        .I4(\rcpPipeline[0][rcpExponent][5]_i_2_n_0 ),
        .O(\rcpPipeline[0][rcpExponent][5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \rcpPipeline[0][rcpExponent][5]_i_2 
       (.I0(IN_A[25]),
        .I1(IN_A[26]),
        .I2(IN_A[24]),
        .I3(IN_A[27]),
        .O(\rcpPipeline[0][rcpExponent][5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h0E0EE0C2)) 
    \rcpPipeline[0][rcpExponent][6]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .I1(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I2(IN_A[29]),
        .I3(IN_A[23]),
        .I4(\rcpPipeline[0][rcpExponent][0]_i_2_n_0 ),
        .O(\rcpPipeline[0][rcpExponent][6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0EE00EC20E0E0E0E)) 
    \rcpPipeline[0][rcpExponent][7]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .I1(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I2(IN_A[30]),
        .I3(\rcpPipeline[0][rcpExponent][0]_i_2_n_0 ),
        .I4(IN_A[23]),
        .I5(IN_A[29]),
        .O(\rcpPipeline[0][rcpExponent][7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F77FFFF4C44CCCC)) 
    \rcpPipeline[0][useEarlyOutBypass]_i_1 
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I1(ISPEC_GO),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I3(IN_A[30]),
        .I4(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I5(\rcpPipeline_reg[0][useEarlyOutBypass_n_0_] ),
        .O(\rcpPipeline[0][useEarlyOutBypass]_i_1_n_0 ));
  FDRE \rcpPipeline_reg[0][calculatedMantissa][0] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][calculatedMantissa][0]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][calculatedMantissa] [0]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][calculatedMantissa][19] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][calculatedMantissa][19]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][calculatedMantissa][1] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][calculatedMantissa][1]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][calculatedMantissa] [1]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][calculatedMantissa][20] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][calculatedMantissa][20]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][calculatedMantissa][21] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][calculatedMantissa][21]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][calculatedMantissa][22] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][calculatedMantissa][22]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][calculatedMantissa][2] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][calculatedMantissa][2]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][calculatedMantissa] [2]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(ISPEC_GO),
        .Q(\rcpPipeline_reg[0][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][rcpExponent][0] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][rcpExponent][0]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][rcpExponent] [0]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][rcpExponent][1] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][rcpExponent][1]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][rcpExponent] [1]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][rcpExponent][2] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][rcpExponent][2]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][rcpExponent] [2]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][rcpExponent][3] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][rcpExponent][3]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][rcpExponent] [3]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][rcpExponent][4] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][rcpExponent][4]_i_2_n_0 ),
        .Q(\rcpPipeline_reg[0][rcpExponent] [4]),
        .R(\rcpPipeline[0][rcpExponent][4]_i_1_n_0 ));
  FDRE \rcpPipeline_reg[0][rcpExponent][5] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][rcpExponent][5]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][rcpExponent] [5]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][rcpExponent][6] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][rcpExponent][6]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][rcpExponent] [6]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][rcpExponent][7] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(\rcpPipeline[0][rcpExponent][7]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][rcpExponent] [7]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][rcpSign] 
       (.C(clk),
        .CE(ISPEC_GO),
        .D(IN_A[31]),
        .Q(\rcpPipeline_reg[0][rcpSign]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[0][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline[0][useEarlyOutBypass]_i_1_n_0 ),
        .Q(\rcpPipeline_reg[0][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[10][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[9][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[10][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[10][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[9][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[10][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][0]_srl10 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][0]_srl10 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[1][calculatedMantissa] [0]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][0]_srl10_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][10]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][10]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [10]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][10]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][11]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][11]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [11]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][11]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][12]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][12]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [12]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][12]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][13]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][13]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [13]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][13]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][14]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][14]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [14]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][14]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][15]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][15]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [15]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][15]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][16]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][16]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [16]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][16]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][17]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][17]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [17]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][17]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][18]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][18]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [18]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][18]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][19]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][19]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [19]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][19]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][1]_srl10 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][1]_srl10 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[1][calculatedMantissa] [1]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][1]_srl10_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][20]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][20]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [20]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][20]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][21]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][21]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [21]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][21]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][22]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][22]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [22]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][22]_srl8_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][2]_srl10 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][2]_srl10 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[1][calculatedMantissa] [2]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][2]_srl10_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][3]_srl10 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][3]_srl10 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[1][calculatedMantissa] [3]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][3]_srl10_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][4]_srl10 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][4]_srl10 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[1][calculatedMantissa] [4]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][4]_srl10_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][5]_srl10 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][5]_srl10 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[1][calculatedMantissa] [5]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][5]_srl10_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][6]_srl10 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][6]_srl10 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[1][calculatedMantissa] [6]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][6]_srl10_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][7]_srl10 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][7]_srl10 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[1][calculatedMantissa] [7]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][7]_srl10_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][8]_srl10 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][8]_srl10 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[1][calculatedMantissa] [8]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][8]_srl10_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[11][calculatedMantissa][9]_srl8 " *) 
  SRL16E \rcpPipeline_reg[11][calculatedMantissa][9]_srl8 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[3][calculatedMantissa] [9]),
        .Q(\rcpPipeline_reg[11][calculatedMantissa][9]_srl8_n_0 ));
  FDRE \rcpPipeline_reg[11][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[10][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[11][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[11][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[10][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[11][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][0]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][0]_srl10_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [0]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][10]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][10]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [10]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][11]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][11]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [11]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][12]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][12]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [12]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][13]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][13]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [13]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][14]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][14]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [14]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][15]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][15]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [15]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][16]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][16]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [16]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][17]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][17]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [17]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][18]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][18]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [18]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][19]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][19]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [19]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][1]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][1]_srl10_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [1]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][20]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][20]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [20]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][21]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][21]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [21]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][22]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][22]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [22]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][2]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][2]_srl10_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [2]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][3]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][3]_srl10_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [3]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][4]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][4]_srl10_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [4]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][5]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][5]_srl10_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [5]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][6]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][6]_srl10_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [6]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][7]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][7]_srl10_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [7]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][8]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][8]_srl10_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [8]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][calculatedMantissa][9]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][calculatedMantissa][9]_srl8_n_0 ),
        .Q(\rcpPipeline_reg[12][calculatedMantissa] [9]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[12][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[12][pipeStageIsValid]__0 ),
        .R(1'b0));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[12][rcpExponent] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[12][rcpExponent][0]_srl12 " *) 
  SRL16E \rcpPipeline_reg[12][rcpExponent][0]_srl12 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][rcpExponent] [0]),
        .Q(\rcpPipeline_reg[12][rcpExponent] [0]));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[12][rcpExponent] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[12][rcpExponent][1]_srl12 " *) 
  SRL16E \rcpPipeline_reg[12][rcpExponent][1]_srl12 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][rcpExponent] [1]),
        .Q(\rcpPipeline_reg[12][rcpExponent] [1]));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[12][rcpExponent] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[12][rcpExponent][2]_srl12 " *) 
  SRL16E \rcpPipeline_reg[12][rcpExponent][2]_srl12 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][rcpExponent] [2]),
        .Q(\rcpPipeline_reg[12][rcpExponent] [2]));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[12][rcpExponent] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[12][rcpExponent][3]_srl12 " *) 
  SRL16E \rcpPipeline_reg[12][rcpExponent][3]_srl12 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][rcpExponent] [3]),
        .Q(\rcpPipeline_reg[12][rcpExponent] [3]));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[12][rcpExponent] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[12][rcpExponent][4]_srl12 " *) 
  SRL16E \rcpPipeline_reg[12][rcpExponent][4]_srl12 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][rcpExponent] [4]),
        .Q(\rcpPipeline_reg[12][rcpExponent] [4]));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[12][rcpExponent] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[12][rcpExponent][5]_srl12 " *) 
  SRL16E \rcpPipeline_reg[12][rcpExponent][5]_srl12 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][rcpExponent] [5]),
        .Q(\rcpPipeline_reg[12][rcpExponent] [5]));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[12][rcpExponent] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[12][rcpExponent][6]_srl12 " *) 
  SRL16E \rcpPipeline_reg[12][rcpExponent][6]_srl12 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][rcpExponent] [6]),
        .Q(\rcpPipeline_reg[12][rcpExponent] [6]));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[12][rcpExponent] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[12][rcpExponent][7]_srl12 " *) 
  SRL16E \rcpPipeline_reg[12][rcpExponent][7]_srl12 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][rcpExponent] [7]),
        .Q(\rcpPipeline_reg[12][rcpExponent] [7]));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[12] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[12][rcpSign]_srl12 " *) 
  SRL16E \rcpPipeline_reg[12][rcpSign]_srl12 
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b0),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][rcpSign]__0 ),
        .Q(\rcpPipeline_reg[12][rcpSign] ));
  FDRE \rcpPipeline_reg[12][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[11][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[12][useEarlyOutBypass]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[1][calculatedMantissa][0] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[0][calculatedMantissa] [0]),
        .Q(\rcpPipeline_reg[1][calculatedMantissa] [0]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[1][calculatedMantissa][1] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[0][calculatedMantissa] [1]),
        .Q(\rcpPipeline_reg[1][calculatedMantissa] [1]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[1][calculatedMantissa][2] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[0][calculatedMantissa] [2]),
        .Q(\rcpPipeline_reg[1][calculatedMantissa] [2]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[1][calculatedMantissa][3] 
       (.C(clk),
        .CE(1'b1),
        .D(slopeMultiply_reg__15[0]),
        .Q(\rcpPipeline_reg[1][calculatedMantissa] [3]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[1][calculatedMantissa][4] 
       (.C(clk),
        .CE(1'b1),
        .D(slopeMultiply_reg__15[1]),
        .Q(\rcpPipeline_reg[1][calculatedMantissa] [4]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[1][calculatedMantissa][5] 
       (.C(clk),
        .CE(1'b1),
        .D(slopeMultiply_reg__15[2]),
        .Q(\rcpPipeline_reg[1][calculatedMantissa] [5]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[1][calculatedMantissa][6] 
       (.C(clk),
        .CE(1'b1),
        .D(slopeMultiply_reg__15[3]),
        .Q(\rcpPipeline_reg[1][calculatedMantissa] [6]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[1][calculatedMantissa][7] 
       (.C(clk),
        .CE(1'b1),
        .D(slopeMultiply_reg__15[4]),
        .Q(\rcpPipeline_reg[1][calculatedMantissa] [7]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[1][calculatedMantissa][8] 
       (.C(clk),
        .CE(1'b1),
        .D(slopeMultiply_reg__15[5]),
        .Q(\rcpPipeline_reg[1][calculatedMantissa] [8]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[1][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[0][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[1][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[1][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[0][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[1][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][10]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][10]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(slopeMultiply_reg__15[7]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][10]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][11]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][11]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(slopeMultiply_reg__15[8]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][11]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][12]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][12]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(slopeMultiply_reg__15[9]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][12]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][13]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][13]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(slopeMultiply_reg__15[10]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][13]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][14]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][14]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(slopeMultiply_reg__15[11]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][14]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][15]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][15]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(slopeMultiply_reg__15[12]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][15]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][16]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][16]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(slopeMultiply_reg__15[13]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][16]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][17]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][17]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(slopeMultiply_reg__15[14]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][17]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][18]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][18]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(slopeMultiply_reg__15[15]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][18]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][19]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][19]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][19]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][20]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][20]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][20]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][21]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][21]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][21]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][22]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][22]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][22]_srl2_n_0 ));
  (* srl_bus_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa] " *) 
  (* srl_name = "\\U0/rcpPipeline_reg[2][calculatedMantissa][9]_srl2 " *) 
  SRL16E \rcpPipeline_reg[2][calculatedMantissa][9]_srl2 
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk),
        .D(slopeMultiply_reg__15[6]),
        .Q(\rcpPipeline_reg[2][calculatedMantissa][9]_srl2_n_0 ));
  FDRE \rcpPipeline_reg[2][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[1][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[2][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[2][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[1][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[2][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][10]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][10]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [10]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][11]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][11]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [11]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][12]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][12]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [12]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][13]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][13]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [13]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][14]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][14]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [14]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][15]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][15]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [15]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][16]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][16]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [16]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][17]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][17]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [17]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][18]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][18]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [18]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][19]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][19]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [19]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][20]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][20]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [20]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][21]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][21]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [21]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][22]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][22]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [22]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][calculatedMantissa][9]__0 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][calculatedMantissa][9]_srl2_n_0 ),
        .Q(\rcpPipeline_reg[3][calculatedMantissa] [9]),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[3][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[3][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[2][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[3][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[4][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[3][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[4][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[4][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[3][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[4][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[5][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[4][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[5][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[5][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[4][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[5][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[6][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[5][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[6][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[6][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[5][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[6][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[7][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[6][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[7][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[7][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[6][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[7][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[8][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[7][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[8][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[8][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[7][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[8][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[9][pipeStageIsValid] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[8][pipeStageIsValid]__0 ),
        .Q(\rcpPipeline_reg[9][pipeStageIsValid]__0 ),
        .R(1'b0));
  FDRE \rcpPipeline_reg[9][useEarlyOutBypass] 
       (.C(clk),
        .CE(1'b1),
        .D(\rcpPipeline_reg[8][useEarlyOutBypass_n_0_] ),
        .Q(\rcpPipeline_reg[9][useEarlyOutBypass_n_0_] ),
        .R(1'b0));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x18 4}}" *) 
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
    rcpSqrSigma0Product0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\not [16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_rcpSqrSigma0Product0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,\not [31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_rcpSqrSigma0Product0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_rcpSqrSigma0Product0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_rcpSqrSigma0Product0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(rcpSigma00),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(rcpSigma00),
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
        .MULTSIGNOUT(NLW_rcpSqrSigma0Product0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_rcpSqrSigma0Product0_OVERFLOW_UNCONNECTED),
        .P({rcpSqrSigma0Product0_n_58,rcpSqrSigma0Product0_n_59,rcpSqrSigma0Product0_n_60,rcpSqrSigma0Product0_n_61,rcpSqrSigma0Product0_n_62,rcpSqrSigma0Product0_n_63,rcpSqrSigma0Product0_n_64,rcpSqrSigma0Product0_n_65,rcpSqrSigma0Product0_n_66,rcpSqrSigma0Product0_n_67,rcpSqrSigma0Product0_n_68,rcpSqrSigma0Product0_n_69,rcpSqrSigma0Product0_n_70,rcpSqrSigma0Product0_n_71,rcpSqrSigma0Product0_n_72,rcpSqrSigma0Product0_n_73,rcpSqrSigma0Product0_n_74,rcpSqrSigma0Product0_n_75,rcpSqrSigma0Product0_n_76,rcpSqrSigma0Product0_n_77,rcpSqrSigma0Product0_n_78,rcpSqrSigma0Product0_n_79,rcpSqrSigma0Product0_n_80,rcpSqrSigma0Product0_n_81,rcpSqrSigma0Product0_n_82,rcpSqrSigma0Product0_n_83,rcpSqrSigma0Product0_n_84,rcpSqrSigma0Product0_n_85,rcpSqrSigma0Product0_n_86,rcpSqrSigma0Product0_n_87,rcpSqrSigma0Product0_n_88,rcpSqrSigma0Product0_n_89,rcpSqrSigma0Product0_n_90,rcpSqrSigma0Product0_n_91,rcpSqrSigma0Product0_n_92,rcpSqrSigma0Product0_n_93,rcpSqrSigma0Product0_n_94,rcpSqrSigma0Product0_n_95,rcpSqrSigma0Product0_n_96,rcpSqrSigma0Product0_n_97,rcpSqrSigma0Product0_n_98,rcpSqrSigma0Product0_n_99,rcpSqrSigma0Product0_n_100,rcpSqrSigma0Product0_n_101,rcpSqrSigma0Product0_n_102,rcpSqrSigma0Product0_n_103,rcpSqrSigma0Product0_n_104,rcpSqrSigma0Product0_n_105}),
        .PATTERNBDETECT(NLW_rcpSqrSigma0Product0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_rcpSqrSigma0Product0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({rcpSqrSigma0Product0_n_106,rcpSqrSigma0Product0_n_107,rcpSqrSigma0Product0_n_108,rcpSqrSigma0Product0_n_109,rcpSqrSigma0Product0_n_110,rcpSqrSigma0Product0_n_111,rcpSqrSigma0Product0_n_112,rcpSqrSigma0Product0_n_113,rcpSqrSigma0Product0_n_114,rcpSqrSigma0Product0_n_115,rcpSqrSigma0Product0_n_116,rcpSqrSigma0Product0_n_117,rcpSqrSigma0Product0_n_118,rcpSqrSigma0Product0_n_119,rcpSqrSigma0Product0_n_120,rcpSqrSigma0Product0_n_121,rcpSqrSigma0Product0_n_122,rcpSqrSigma0Product0_n_123,rcpSqrSigma0Product0_n_124,rcpSqrSigma0Product0_n_125,rcpSqrSigma0Product0_n_126,rcpSqrSigma0Product0_n_127,rcpSqrSigma0Product0_n_128,rcpSqrSigma0Product0_n_129,rcpSqrSigma0Product0_n_130,rcpSqrSigma0Product0_n_131,rcpSqrSigma0Product0_n_132,rcpSqrSigma0Product0_n_133,rcpSqrSigma0Product0_n_134,rcpSqrSigma0Product0_n_135,rcpSqrSigma0Product0_n_136,rcpSqrSigma0Product0_n_137,rcpSqrSigma0Product0_n_138,rcpSqrSigma0Product0_n_139,rcpSqrSigma0Product0_n_140,rcpSqrSigma0Product0_n_141,rcpSqrSigma0Product0_n_142,rcpSqrSigma0Product0_n_143,rcpSqrSigma0Product0_n_144,rcpSqrSigma0Product0_n_145,rcpSqrSigma0Product0_n_146,rcpSqrSigma0Product0_n_147,rcpSqrSigma0Product0_n_148,rcpSqrSigma0Product0_n_149,rcpSqrSigma0Product0_n_150,rcpSqrSigma0Product0_n_151,rcpSqrSigma0Product0_n_152,rcpSqrSigma0Product0_n_153}),
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
        .UNDERFLOW(NLW_rcpSqrSigma0Product0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_rcpSqrSigma0Product0_XOROUT_UNCONNECTED[7:0]));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
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
    rcpSqrSigma0Product0__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\not [16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_rcpSqrSigma0Product0__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,\not [16:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_rcpSqrSigma0Product0__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_rcpSqrSigma0Product0__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_rcpSqrSigma0Product0__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(rcpSigma00),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(rcpSigma00),
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
        .MULTSIGNOUT(NLW_rcpSqrSigma0Product0__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_rcpSqrSigma0Product0__0_OVERFLOW_UNCONNECTED),
        .P({rcpSqrSigma0Product0__0_n_58,rcpSqrSigma0Product0__0_n_59,rcpSqrSigma0Product0__0_n_60,rcpSqrSigma0Product0__0_n_61,rcpSqrSigma0Product0__0_n_62,rcpSqrSigma0Product0__0_n_63,rcpSqrSigma0Product0__0_n_64,rcpSqrSigma0Product0__0_n_65,rcpSqrSigma0Product0__0_n_66,rcpSqrSigma0Product0__0_n_67,rcpSqrSigma0Product0__0_n_68,rcpSqrSigma0Product0__0_n_69,rcpSqrSigma0Product0__0_n_70,rcpSqrSigma0Product0__0_n_71,rcpSqrSigma0Product0__0_n_72,rcpSqrSigma0Product0__0_n_73,rcpSqrSigma0Product0__0_n_74,rcpSqrSigma0Product0__0_n_75,rcpSqrSigma0Product0__0_n_76,rcpSqrSigma0Product0__0_n_77,rcpSqrSigma0Product0__0_n_78,rcpSqrSigma0Product0__0_n_79,rcpSqrSigma0Product0__0_n_80,rcpSqrSigma0Product0__0_n_81,rcpSqrSigma0Product0__0_n_82,rcpSqrSigma0Product0__0_n_83,rcpSqrSigma0Product0__0_n_84,rcpSqrSigma0Product0__0_n_85,rcpSqrSigma0Product0__0_n_86,rcpSqrSigma0Product0__0_n_87,rcpSqrSigma0Product0__0_n_88,rcpSqrSigma0Product0__0_n_89,rcpSqrSigma0Product0__0_n_90,rcpSqrSigma0Product0__0_n_91,rcpSqrSigma0Product0__0_n_92,rcpSqrSigma0Product0__0_n_93,rcpSqrSigma0Product0__0_n_94,rcpSqrSigma0Product0__0_n_95,rcpSqrSigma0Product0__0_n_96,rcpSqrSigma0Product0__0_n_97,rcpSqrSigma0Product0__0_n_98,rcpSqrSigma0Product0__0_n_99,rcpSqrSigma0Product0__0_n_100,rcpSqrSigma0Product0__0_n_101,rcpSqrSigma0Product0__0_n_102,rcpSqrSigma0Product0__0_n_103,rcpSqrSigma0Product0__0_n_104,rcpSqrSigma0Product0__0_n_105}),
        .PATTERNBDETECT(NLW_rcpSqrSigma0Product0__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_rcpSqrSigma0Product0__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({rcpSqrSigma0Product0__0_n_106,rcpSqrSigma0Product0__0_n_107,rcpSqrSigma0Product0__0_n_108,rcpSqrSigma0Product0__0_n_109,rcpSqrSigma0Product0__0_n_110,rcpSqrSigma0Product0__0_n_111,rcpSqrSigma0Product0__0_n_112,rcpSqrSigma0Product0__0_n_113,rcpSqrSigma0Product0__0_n_114,rcpSqrSigma0Product0__0_n_115,rcpSqrSigma0Product0__0_n_116,rcpSqrSigma0Product0__0_n_117,rcpSqrSigma0Product0__0_n_118,rcpSqrSigma0Product0__0_n_119,rcpSqrSigma0Product0__0_n_120,rcpSqrSigma0Product0__0_n_121,rcpSqrSigma0Product0__0_n_122,rcpSqrSigma0Product0__0_n_123,rcpSqrSigma0Product0__0_n_124,rcpSqrSigma0Product0__0_n_125,rcpSqrSigma0Product0__0_n_126,rcpSqrSigma0Product0__0_n_127,rcpSqrSigma0Product0__0_n_128,rcpSqrSigma0Product0__0_n_129,rcpSqrSigma0Product0__0_n_130,rcpSqrSigma0Product0__0_n_131,rcpSqrSigma0Product0__0_n_132,rcpSqrSigma0Product0__0_n_133,rcpSqrSigma0Product0__0_n_134,rcpSqrSigma0Product0__0_n_135,rcpSqrSigma0Product0__0_n_136,rcpSqrSigma0Product0__0_n_137,rcpSqrSigma0Product0__0_n_138,rcpSqrSigma0Product0__0_n_139,rcpSqrSigma0Product0__0_n_140,rcpSqrSigma0Product0__0_n_141,rcpSqrSigma0Product0__0_n_142,rcpSqrSigma0Product0__0_n_143,rcpSqrSigma0Product0__0_n_144,rcpSqrSigma0Product0__0_n_145,rcpSqrSigma0Product0__0_n_146,rcpSqrSigma0Product0__0_n_147,rcpSqrSigma0Product0__0_n_148,rcpSqrSigma0Product0__0_n_149,rcpSqrSigma0Product0__0_n_150,rcpSqrSigma0Product0__0_n_151,rcpSqrSigma0Product0__0_n_152,rcpSqrSigma0Product0__0_n_153}),
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
        .UNDERFLOW(NLW_rcpSqrSigma0Product0__0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_rcpSqrSigma0Product0__0_XOROUT_UNCONNECTED[7:0]));
  LUT2 #(
    .INIT(4'h2)) 
    rcpSqrSigma0Product0_i_1
       (.I0(\rcpPipeline_reg[4][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[4][useEarlyOutBypass_n_0_] ),
        .O(rcpSigma00));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_10
       (.I0(sigma0TempProduct_reg_n_92),
        .O(\not [23]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_11
       (.I0(sigma0TempProduct_reg_n_93),
        .O(\not [22]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_12
       (.I0(sigma0TempProduct_reg_n_94),
        .O(\not [21]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_13
       (.I0(sigma0TempProduct_reg_n_95),
        .O(\not [20]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_14
       (.I0(sigma0TempProduct_reg_n_96),
        .O(\not [19]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_15
       (.I0(sigma0TempProduct_reg_n_97),
        .O(\not [18]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_16
       (.I0(sigma0TempProduct_reg_n_98),
        .O(\not [17]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_17
       (.I0(sigma0TempProduct_reg_n_99),
        .O(\not [16]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_18
       (.I0(sigma0TempProduct_reg_n_100),
        .O(\not [15]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_19
       (.I0(sigma0TempProduct_reg_n_101),
        .O(\not [14]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_2
       (.I0(sigma0TempProduct_reg_n_84),
        .O(\not [31]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_20
       (.I0(sigma0TempProduct_reg_n_102),
        .O(\not [13]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_21
       (.I0(sigma0TempProduct_reg_n_103),
        .O(\not [12]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_22
       (.I0(sigma0TempProduct_reg_n_104),
        .O(\not [11]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_23
       (.I0(sigma0TempProduct_reg_n_105),
        .O(\not [10]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_24
       (.I0(\sigma0TempProduct_reg_n_0_[16] ),
        .O(\not [9]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_25
       (.I0(\sigma0TempProduct_reg_n_0_[15] ),
        .O(\not [8]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_26
       (.I0(\sigma0TempProduct_reg_n_0_[14] ),
        .O(\not [7]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_27
       (.I0(\sigma0TempProduct_reg_n_0_[13] ),
        .O(\not [6]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_28
       (.I0(\sigma0TempProduct_reg_n_0_[12] ),
        .O(\not [5]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_29
       (.I0(\sigma0TempProduct_reg_n_0_[11] ),
        .O(\not [4]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_3
       (.I0(sigma0TempProduct_reg_n_85),
        .O(\not [30]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_30
       (.I0(\sigma0TempProduct_reg_n_0_[10] ),
        .O(\not [3]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_31
       (.I0(\sigma0TempProduct_reg_n_0_[9] ),
        .O(\not [2]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_32
       (.I0(\sigma0TempProduct_reg_n_0_[8] ),
        .O(\not [1]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_33
       (.I0(\sigma0TempProduct_reg_n_0_[7] ),
        .O(\not [0]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_4
       (.I0(sigma0TempProduct_reg_n_86),
        .O(\not [29]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_5
       (.I0(sigma0TempProduct_reg_n_87),
        .O(\not [28]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_6
       (.I0(sigma0TempProduct_reg_n_88),
        .O(\not [27]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_7
       (.I0(sigma0TempProduct_reg_n_89),
        .O(\not [26]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_8
       (.I0(sigma0TempProduct_reg_n_90),
        .O(\not [25]));
  LUT1 #(
    .INIT(2'h1)) 
    rcpSqrSigma0Product0_i_9
       (.I0(sigma0TempProduct_reg_n_91),
        .O(\not [24]));
  LUT2 #(
    .INIT(4'h2)) 
    \rcpSqrSigma0Product[16]_i_1 
       (.I0(\rcpPipeline_reg[7][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[7][useEarlyOutBypass_n_0_] ),
        .O(rcpSqrSigma0Product0__1));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 16x16 4}}" *) 
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
    rcpSqrSigma0Product_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\not [31:17]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_rcpSqrSigma0Product_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,\not [31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_rcpSqrSigma0Product_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_rcpSqrSigma0Product_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_rcpSqrSigma0Product_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(rcpSigma00),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(rcpSigma00),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(rcpSqrSigma0Product0__1),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_rcpSqrSigma0Product_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_rcpSqrSigma0Product_reg_OVERFLOW_UNCONNECTED),
        .P({rcpSqrSigma0Product_reg_n_58,rcpSqrSigma0Product_reg_n_59,rcpSqrSigma0Product_reg_n_60,rcpSqrSigma0Product_reg_n_61,rcpSqrSigma0Product_reg_n_62,rcpSqrSigma0Product_reg_n_63,rcpSqrSigma0Product_reg_n_64,rcpSqrSigma0Product_reg_n_65,rcpSqrSigma0Product_reg_n_66,rcpSqrSigma0Product_reg_n_67,rcpSqrSigma0Product_reg_n_68,rcpSqrSigma0Product_reg_n_69,rcpSqrSigma0Product_reg_n_70,rcpSqrSigma0Product_reg_n_71,rcpSqrSigma0Product_reg_n_72,rcpSqrSigma0Product_reg_n_73,rcpSqrSigma0Product_reg_n_74,rcpSqrSigma0Product_reg_n_75,rcpSqrSigma0Product_reg_n_76,rcpSqrSigma0Product_reg_n_77,rcpSqrSigma0Product_reg_n_78,rcpSqrSigma0Product_reg_n_79,rcpSqrSigma0Product_reg_n_80,rcpSqrSigma0Product_reg_n_81,rcpSqrSigma0Product_reg_n_82,rcpSqrSigma0Product_reg_n_83,rcpSqrSigma0Product_reg_n_84,rcpSqrSigma0Product_reg_n_85,rcpSqrSigma0Product_reg_n_86,rcpSqrSigma0Product_reg_n_87,rcpSqrSigma0Product_reg_n_88,rcpSqrSigma0Product_reg_n_89,rcpSqrSigma0Product_reg_n_90,rcpSqrSigma0Product_reg_n_91,rcpSqrSigma0Product_reg_n_92,rcpSqrSigma0Product_reg_n_93,rcpSqrSigma0Product_reg_n_94,rcpSqrSigma0Product_reg_n_95,rcpSqrSigma0Product_reg_n_96,rcpSqrSigma0Product_reg_n_97,rcpSqrSigma0Product_reg_n_98,rcpSqrSigma0Product_reg_n_99,rcpSqrSigma0Product_reg_n_100,rcpSqrSigma0Product_reg_n_101,rcpSqrSigma0Product_reg_n_102,rcpSqrSigma0Product_reg_n_103,rcpSqrSigma0Product_reg_n_104,rcpSqrSigma0Product_reg_n_105}),
        .PATTERNBDETECT(NLW_rcpSqrSigma0Product_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_rcpSqrSigma0Product_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({rcpSqrSigma0Product0_n_106,rcpSqrSigma0Product0_n_107,rcpSqrSigma0Product0_n_108,rcpSqrSigma0Product0_n_109,rcpSqrSigma0Product0_n_110,rcpSqrSigma0Product0_n_111,rcpSqrSigma0Product0_n_112,rcpSqrSigma0Product0_n_113,rcpSqrSigma0Product0_n_114,rcpSqrSigma0Product0_n_115,rcpSqrSigma0Product0_n_116,rcpSqrSigma0Product0_n_117,rcpSqrSigma0Product0_n_118,rcpSqrSigma0Product0_n_119,rcpSqrSigma0Product0_n_120,rcpSqrSigma0Product0_n_121,rcpSqrSigma0Product0_n_122,rcpSqrSigma0Product0_n_123,rcpSqrSigma0Product0_n_124,rcpSqrSigma0Product0_n_125,rcpSqrSigma0Product0_n_126,rcpSqrSigma0Product0_n_127,rcpSqrSigma0Product0_n_128,rcpSqrSigma0Product0_n_129,rcpSqrSigma0Product0_n_130,rcpSqrSigma0Product0_n_131,rcpSqrSigma0Product0_n_132,rcpSqrSigma0Product0_n_133,rcpSqrSigma0Product0_n_134,rcpSqrSigma0Product0_n_135,rcpSqrSigma0Product0_n_136,rcpSqrSigma0Product0_n_137,rcpSqrSigma0Product0_n_138,rcpSqrSigma0Product0_n_139,rcpSqrSigma0Product0_n_140,rcpSqrSigma0Product0_n_141,rcpSqrSigma0Product0_n_142,rcpSqrSigma0Product0_n_143,rcpSqrSigma0Product0_n_144,rcpSqrSigma0Product0_n_145,rcpSqrSigma0Product0_n_146,rcpSqrSigma0Product0_n_147,rcpSqrSigma0Product0_n_148,rcpSqrSigma0Product0_n_149,rcpSqrSigma0Product0_n_150,rcpSqrSigma0Product0_n_151,rcpSqrSigma0Product0_n_152,rcpSqrSigma0Product0_n_153}),
        .PCOUT(NLW_rcpSqrSigma0Product_reg_PCOUT_UNCONNECTED[47:0]),
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
        .UNDERFLOW(NLW_rcpSqrSigma0Product_reg_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_rcpSqrSigma0Product_reg_XOROUT_UNCONNECTED[7:0]));
  FDRE \rcpSqrSigma0Product_reg[0] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_105),
        .Q(\rcpSqrSigma0Product_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[10] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_95),
        .Q(\rcpSqrSigma0Product_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[11] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_94),
        .Q(\rcpSqrSigma0Product_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[12] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_93),
        .Q(\rcpSqrSigma0Product_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[13] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_92),
        .Q(\rcpSqrSigma0Product_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[14] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_91),
        .Q(\rcpSqrSigma0Product_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[15] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_90),
        .Q(\rcpSqrSigma0Product_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[16] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_89),
        .Q(\rcpSqrSigma0Product_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[16]__0 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0__0_n_89),
        .Q(\rcpSqrSigma0Product_reg[16]__0_n_0 ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[1] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_104),
        .Q(\rcpSqrSigma0Product_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[2] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_103),
        .Q(\rcpSqrSigma0Product_reg_n_0_[2] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[3] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_102),
        .Q(\rcpSqrSigma0Product_reg_n_0_[3] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[4] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_101),
        .Q(\rcpSqrSigma0Product_reg_n_0_[4] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[5] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_100),
        .Q(\rcpSqrSigma0Product_reg_n_0_[5] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[6] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_99),
        .Q(\rcpSqrSigma0Product_reg_n_0_[6] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[7] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_98),
        .Q(\rcpSqrSigma0Product_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[8] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_97),
        .Q(\rcpSqrSigma0Product_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \rcpSqrSigma0Product_reg[9] 
       (.C(clk),
        .CE(rcpSqrSigma0Product0__1),
        .D(rcpSqrSigma0Product0_n_96),
        .Q(\rcpSqrSigma0Product_reg_n_0_[9] ),
        .R(1'b0));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x16 4}}" *) 
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
    rcpSqrSigma0Product_reg__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\not [16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_rcpSqrSigma0Product_reg__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,\not [31:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_rcpSqrSigma0Product_reg__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_rcpSqrSigma0Product_reg__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_rcpSqrSigma0Product_reg__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(rcpSigma00),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(rcpSigma00),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(rcpSqrSigma0Product0__1),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_rcpSqrSigma0Product_reg__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_rcpSqrSigma0Product_reg__0_OVERFLOW_UNCONNECTED),
        .P({rcpSqrSigma0Product_reg__0_n_58,rcpSqrSigma0Product_reg__0_n_59,rcpSqrSigma0Product_reg__0_n_60,rcpSqrSigma0Product_reg__0_n_61,rcpSqrSigma0Product_reg__0_n_62,rcpSqrSigma0Product_reg__0_n_63,rcpSqrSigma0Product_reg__0_n_64,rcpSqrSigma0Product_reg__0_n_65,rcpSqrSigma0Product_reg__0_n_66,rcpSqrSigma0Product_reg__0_n_67,rcpSqrSigma0Product_reg__0_n_68,rcpSqrSigma0Product_reg__0_n_69,rcpSqrSigma0Product_reg__0_n_70,rcpSqrSigma0Product_reg__0_n_71,rcpSqrSigma0Product_reg__0_n_72,rcpSqrSigma0Product_reg__0_n_73,rcpSqrSigma0Product_reg__0_n_74,rcpSqrSigma0Product_reg__0_n_75,rcpSqrSigma0Product_reg__0_n_76,rcpSqrSigma0Product_reg__0_n_77,rcpSqrSigma0Product_reg__0_n_78,rcpSqrSigma0Product_reg__0_n_79,rcpSqrSigma0Product_reg__0_n_80,rcpSqrSigma0Product_reg__0_n_81,rcpSqrSigma0Product_reg__0_n_82,rcpSqrSigma0Product_reg__0_n_83,rcpSqrSigma0Product_reg__0_n_84,rcpSqrSigma0Product_reg__0_n_85,rcpSqrSigma0Product_reg__0_n_86,rcpSqrSigma0Product_reg__0_n_87,rcpSqrSigma0Product_reg__0_n_88,rcpSqrSigma0Product_reg__0_n_89,rcpSqrSigma0Product_reg__0_n_90,rcpSqrSigma0Product_reg__0_n_91,rcpSqrSigma0Product_reg__0_n_92,rcpSqrSigma0Product_reg__0_n_93,rcpSqrSigma0Product_reg__0_n_94,rcpSqrSigma0Product_reg__0_n_95,rcpSqrSigma0Product_reg__0_n_96,rcpSqrSigma0Product_reg__0_n_97,rcpSqrSigma0Product_reg__0_n_98,rcpSqrSigma0Product_reg__0_n_99,rcpSqrSigma0Product_reg__0_n_100,rcpSqrSigma0Product_reg__0_n_101,rcpSqrSigma0Product_reg__0_n_102,rcpSqrSigma0Product_reg__0_n_103,rcpSqrSigma0Product_reg__0_n_104,rcpSqrSigma0Product_reg__0_n_105}),
        .PATTERNBDETECT(NLW_rcpSqrSigma0Product_reg__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_rcpSqrSigma0Product_reg__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({rcpSqrSigma0Product0__0_n_106,rcpSqrSigma0Product0__0_n_107,rcpSqrSigma0Product0__0_n_108,rcpSqrSigma0Product0__0_n_109,rcpSqrSigma0Product0__0_n_110,rcpSqrSigma0Product0__0_n_111,rcpSqrSigma0Product0__0_n_112,rcpSqrSigma0Product0__0_n_113,rcpSqrSigma0Product0__0_n_114,rcpSqrSigma0Product0__0_n_115,rcpSqrSigma0Product0__0_n_116,rcpSqrSigma0Product0__0_n_117,rcpSqrSigma0Product0__0_n_118,rcpSqrSigma0Product0__0_n_119,rcpSqrSigma0Product0__0_n_120,rcpSqrSigma0Product0__0_n_121,rcpSqrSigma0Product0__0_n_122,rcpSqrSigma0Product0__0_n_123,rcpSqrSigma0Product0__0_n_124,rcpSqrSigma0Product0__0_n_125,rcpSqrSigma0Product0__0_n_126,rcpSqrSigma0Product0__0_n_127,rcpSqrSigma0Product0__0_n_128,rcpSqrSigma0Product0__0_n_129,rcpSqrSigma0Product0__0_n_130,rcpSqrSigma0Product0__0_n_131,rcpSqrSigma0Product0__0_n_132,rcpSqrSigma0Product0__0_n_133,rcpSqrSigma0Product0__0_n_134,rcpSqrSigma0Product0__0_n_135,rcpSqrSigma0Product0__0_n_136,rcpSqrSigma0Product0__0_n_137,rcpSqrSigma0Product0__0_n_138,rcpSqrSigma0Product0__0_n_139,rcpSqrSigma0Product0__0_n_140,rcpSqrSigma0Product0__0_n_141,rcpSqrSigma0Product0__0_n_142,rcpSqrSigma0Product0__0_n_143,rcpSqrSigma0Product0__0_n_144,rcpSqrSigma0Product0__0_n_145,rcpSqrSigma0Product0__0_n_146,rcpSqrSigma0Product0__0_n_147,rcpSqrSigma0Product0__0_n_148,rcpSqrSigma0Product0__0_n_149,rcpSqrSigma0Product0__0_n_150,rcpSqrSigma0Product0__0_n_151,rcpSqrSigma0Product0__0_n_152,rcpSqrSigma0Product0__0_n_153}),
        .PCOUT(NLW_rcpSqrSigma0Product_reg__0_PCOUT_UNCONNECTED[47:0]),
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
        .UNDERFLOW(NLW_rcpSqrSigma0Product_reg__0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_rcpSqrSigma0Product_reg__0_XOROUT_UNCONNECTED[7:0]));
  LUT2 #(
    .INIT(4'h2)) 
    \resultMantissa[22]_i_1 
       (.I0(\rcpPipeline_reg[11][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[11][useEarlyOutBypass_n_0_] ),
        .O(resultMantissa0));
  LUT1 #(
    .INIT(2'h1)) 
    \resultMantissa[5]_i_2 
       (.I0(L[7]),
        .O(\resultMantissa[5]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[0] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[7]),
        .Q(resultMantissa[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[10] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[17]),
        .Q(resultMantissa[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[11] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[18]),
        .Q(resultMantissa[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[12] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[19]),
        .Q(resultMantissa[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[13] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[20]),
        .Q(resultMantissa[13]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \resultMantissa_reg[13]_i_1 
       (.CI(\resultMantissa_reg[5]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\resultMantissa_reg[13]_i_1_n_0 ,\resultMantissa_reg[13]_i_1_n_1 ,\resultMantissa_reg[13]_i_1_n_2 ,\resultMantissa_reg[13]_i_1_n_3 ,\resultMantissa_reg[13]_i_1_n_4 ,\resultMantissa_reg[13]_i_1_n_5 ,\resultMantissa_reg[13]_i_1_n_6 ,\resultMantissa_reg[13]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[20:13]),
        .S(L[21:14]));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[14] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[21]),
        .Q(resultMantissa[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[15] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[22]),
        .Q(resultMantissa[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[16] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[23]),
        .Q(resultMantissa[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[17] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[24]),
        .Q(resultMantissa[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[18] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[25]),
        .Q(resultMantissa[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[19] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[26]),
        .Q(resultMantissa[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[1] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[8]),
        .Q(resultMantissa[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[20] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[27]),
        .Q(resultMantissa[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[21] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[28]),
        .Q(resultMantissa[21]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \resultMantissa_reg[21]_i_1 
       (.CI(\resultMantissa_reg[13]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO({\resultMantissa_reg[21]_i_1_n_0 ,\resultMantissa_reg[21]_i_1_n_1 ,\resultMantissa_reg[21]_i_1_n_2 ,\resultMantissa_reg[21]_i_1_n_3 ,\resultMantissa_reg[21]_i_1_n_4 ,\resultMantissa_reg[21]_i_1_n_5 ,\resultMantissa_reg[21]_i_1_n_6 ,\resultMantissa_reg[21]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(plusOp[28:21]),
        .S(L[29:22]));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[22] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[29]),
        .Q(resultMantissa[22]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \resultMantissa_reg[22]_i_2 
       (.CI(\resultMantissa_reg[21]_i_1_n_0 ),
        .CI_TOP(1'b0),
        .CO(\NLW_resultMantissa_reg[22]_i_2_CO_UNCONNECTED [7:0]),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_resultMantissa_reg[22]_i_2_O_UNCONNECTED [7:1],plusOp[29]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,L[30]}));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[2] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[9]),
        .Q(resultMantissa[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[3] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[10]),
        .Q(resultMantissa[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[4] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[11]),
        .Q(resultMantissa[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[5] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[12]),
        .Q(resultMantissa[5]),
        .R(1'b0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 \resultMantissa_reg[5]_i_1 
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({\resultMantissa_reg[5]_i_1_n_0 ,\resultMantissa_reg[5]_i_1_n_1 ,\resultMantissa_reg[5]_i_1_n_2 ,\resultMantissa_reg[5]_i_1_n_3 ,\resultMantissa_reg[5]_i_1_n_4 ,\resultMantissa_reg[5]_i_1_n_5 ,\resultMantissa_reg[5]_i_1_n_6 ,\resultMantissa_reg[5]_i_1_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,L[7],1'b0}),
        .O({plusOp[12:7],\NLW_resultMantissa_reg[5]_i_1_O_UNCONNECTED [1:0]}),
        .S({L[13:8],\resultMantissa[5]_i_2_n_0 ,L[6]}));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[6] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[13]),
        .Q(resultMantissa[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[7] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[14]),
        .Q(resultMantissa[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[8] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[15]),
        .Q(resultMantissa[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \resultMantissa_reg[9] 
       (.C(clk),
        .CE(resultMantissa0),
        .D(plusOp[16]),
        .Q(resultMantissa[9]),
        .R(1'b0));
  (* KEEP_HIERARCHY = "YES" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-11 {cell *THIS*}}" *) 
  DSP48E2 #(
    .ACASCREG(2),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(2),
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
    sigma0TempProduct0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\rcpPipeline_reg[1][calculatedMantissa] ,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_sigma0TempProduct0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,rInitialGuess000_in}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_sigma0TempProduct0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_sigma0TempProduct0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_sigma0TempProduct0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(rInitialGuess00),
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
        .MULTSIGNOUT(NLW_sigma0TempProduct0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_sigma0TempProduct0_OVERFLOW_UNCONNECTED),
        .P({sigma0TempProduct0_n_58,sigma0TempProduct0_n_59,sigma0TempProduct0_n_60,sigma0TempProduct0_n_61,sigma0TempProduct0_n_62,sigma0TempProduct0_n_63,sigma0TempProduct0_n_64,sigma0TempProduct0_n_65,sigma0TempProduct0_n_66,sigma0TempProduct0_n_67,sigma0TempProduct0_n_68,sigma0TempProduct0_n_69,sigma0TempProduct0_n_70,sigma0TempProduct0_n_71,sigma0TempProduct0_n_72,sigma0TempProduct0_n_73,sigma0TempProduct0_n_74,sigma0TempProduct0_n_75,sigma0TempProduct0_n_76,sigma0TempProduct0_n_77,sigma0TempProduct0_n_78,sigma0TempProduct0_n_79,sigma0TempProduct0_n_80,sigma0TempProduct0_n_81,sigma0TempProduct0_n_82,sigma0TempProduct0_n_83,sigma0TempProduct0_n_84,sigma0TempProduct0_n_85,sigma0TempProduct0_n_86,sigma0TempProduct0_n_87,sigma0TempProduct0_n_88,sigma0TempProduct0_n_89,sigma0TempProduct0_n_90,sigma0TempProduct0_n_91,sigma0TempProduct0_n_92,sigma0TempProduct0_n_93,sigma0TempProduct0_n_94,sigma0TempProduct0_n_95,sigma0TempProduct0_n_96,sigma0TempProduct0_n_97,sigma0TempProduct0_n_98,sigma0TempProduct0_n_99,sigma0TempProduct0_n_100,sigma0TempProduct0_n_101,sigma0TempProduct0_n_102,sigma0TempProduct0_n_103,sigma0TempProduct0_n_104,sigma0TempProduct0_n_105}),
        .PATTERNBDETECT(NLW_sigma0TempProduct0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_sigma0TempProduct0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({sigma0TempProduct0_n_106,sigma0TempProduct0_n_107,sigma0TempProduct0_n_108,sigma0TempProduct0_n_109,sigma0TempProduct0_n_110,sigma0TempProduct0_n_111,sigma0TempProduct0_n_112,sigma0TempProduct0_n_113,sigma0TempProduct0_n_114,sigma0TempProduct0_n_115,sigma0TempProduct0_n_116,sigma0TempProduct0_n_117,sigma0TempProduct0_n_118,sigma0TempProduct0_n_119,sigma0TempProduct0_n_120,sigma0TempProduct0_n_121,sigma0TempProduct0_n_122,sigma0TempProduct0_n_123,sigma0TempProduct0_n_124,sigma0TempProduct0_n_125,sigma0TempProduct0_n_126,sigma0TempProduct0_n_127,sigma0TempProduct0_n_128,sigma0TempProduct0_n_129,sigma0TempProduct0_n_130,sigma0TempProduct0_n_131,sigma0TempProduct0_n_132,sigma0TempProduct0_n_133,sigma0TempProduct0_n_134,sigma0TempProduct0_n_135,sigma0TempProduct0_n_136,sigma0TempProduct0_n_137,sigma0TempProduct0_n_138,sigma0TempProduct0_n_139,sigma0TempProduct0_n_140,sigma0TempProduct0_n_141,sigma0TempProduct0_n_142,sigma0TempProduct0_n_143,sigma0TempProduct0_n_144,sigma0TempProduct0_n_145,sigma0TempProduct0_n_146,sigma0TempProduct0_n_147,sigma0TempProduct0_n_148,sigma0TempProduct0_n_149,sigma0TempProduct0_n_150,sigma0TempProduct0_n_151,sigma0TempProduct0_n_152,sigma0TempProduct0_n_153}),
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
        .UNDERFLOW(NLW_sigma0TempProduct0_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_sigma0TempProduct0_XOROUT_UNCONNECTED[7:0]));
  LUT2 #(
    .INIT(4'h2)) 
    sigma0TempProduct0_i_1
       (.I0(\rcpPipeline_reg[2][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[2][useEarlyOutBypass_n_0_] ),
        .O(rInitialGuess00));
  LUT2 #(
    .INIT(4'h2)) 
    \sigma0TempProduct[16]_i_1 
       (.I0(\rcpPipeline_reg[3][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[3][useEarlyOutBypass_n_0_] ),
        .O(sigma0TempProduct0__0));
  (* KEEP_HIERARCHY = "YES" *) 
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BMULTSEL("B"),
    .BREG(0),
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
    sigma0TempProduct_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,rInitialGuess000_in}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_sigma0TempProduct_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b1,\rcpPipeline_reg[3][calculatedMantissa] }),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_sigma0TempProduct_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_sigma0TempProduct_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_sigma0TempProduct_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(rInitialGuess00),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(sigma0TempProduct0__0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_sigma0TempProduct_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_sigma0TempProduct_reg_OVERFLOW_UNCONNECTED),
        .P({sigma0TempProduct_reg_n_58,sigma0TempProduct_reg_n_59,sigma0TempProduct_reg_n_60,sigma0TempProduct_reg_n_61,sigma0TempProduct_reg_n_62,sigma0TempProduct_reg_n_63,sigma0TempProduct_reg_n_64,sigma0TempProduct_reg_n_65,sigma0TempProduct_reg_n_66,sigma0TempProduct_reg_n_67,sigma0TempProduct_reg_n_68,sigma0TempProduct_reg_n_69,sigma0TempProduct_reg_n_70,sigma0TempProduct_reg_n_71,sigma0TempProduct_reg_n_72,sigma0TempProduct_reg_n_73,sigma0TempProduct_reg_n_74,sigma0TempProduct_reg_n_75,sigma0TempProduct_reg_n_76,sigma0TempProduct_reg_n_77,sigma0TempProduct_reg_n_78,sigma0TempProduct_reg_n_79,sigma0TempProduct_reg_n_80,sigma0TempProduct_reg_n_81,sigma0TempProduct_reg_n_82,sigma0TempProduct_reg_n_83,sigma0TempProduct_reg_n_84,sigma0TempProduct_reg_n_85,sigma0TempProduct_reg_n_86,sigma0TempProduct_reg_n_87,sigma0TempProduct_reg_n_88,sigma0TempProduct_reg_n_89,sigma0TempProduct_reg_n_90,sigma0TempProduct_reg_n_91,sigma0TempProduct_reg_n_92,sigma0TempProduct_reg_n_93,sigma0TempProduct_reg_n_94,sigma0TempProduct_reg_n_95,sigma0TempProduct_reg_n_96,sigma0TempProduct_reg_n_97,sigma0TempProduct_reg_n_98,sigma0TempProduct_reg_n_99,sigma0TempProduct_reg_n_100,sigma0TempProduct_reg_n_101,sigma0TempProduct_reg_n_102,sigma0TempProduct_reg_n_103,sigma0TempProduct_reg_n_104,sigma0TempProduct_reg_n_105}),
        .PATTERNBDETECT(NLW_sigma0TempProduct_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_sigma0TempProduct_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({sigma0TempProduct0_n_106,sigma0TempProduct0_n_107,sigma0TempProduct0_n_108,sigma0TempProduct0_n_109,sigma0TempProduct0_n_110,sigma0TempProduct0_n_111,sigma0TempProduct0_n_112,sigma0TempProduct0_n_113,sigma0TempProduct0_n_114,sigma0TempProduct0_n_115,sigma0TempProduct0_n_116,sigma0TempProduct0_n_117,sigma0TempProduct0_n_118,sigma0TempProduct0_n_119,sigma0TempProduct0_n_120,sigma0TempProduct0_n_121,sigma0TempProduct0_n_122,sigma0TempProduct0_n_123,sigma0TempProduct0_n_124,sigma0TempProduct0_n_125,sigma0TempProduct0_n_126,sigma0TempProduct0_n_127,sigma0TempProduct0_n_128,sigma0TempProduct0_n_129,sigma0TempProduct0_n_130,sigma0TempProduct0_n_131,sigma0TempProduct0_n_132,sigma0TempProduct0_n_133,sigma0TempProduct0_n_134,sigma0TempProduct0_n_135,sigma0TempProduct0_n_136,sigma0TempProduct0_n_137,sigma0TempProduct0_n_138,sigma0TempProduct0_n_139,sigma0TempProduct0_n_140,sigma0TempProduct0_n_141,sigma0TempProduct0_n_142,sigma0TempProduct0_n_143,sigma0TempProduct0_n_144,sigma0TempProduct0_n_145,sigma0TempProduct0_n_146,sigma0TempProduct0_n_147,sigma0TempProduct0_n_148,sigma0TempProduct0_n_149,sigma0TempProduct0_n_150,sigma0TempProduct0_n_151,sigma0TempProduct0_n_152,sigma0TempProduct0_n_153}),
        .PCOUT(NLW_sigma0TempProduct_reg_PCOUT_UNCONNECTED[47:0]),
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
        .UNDERFLOW(NLW_sigma0TempProduct_reg_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_sigma0TempProduct_reg_XOROUT_UNCONNECTED[7:0]));
  FDRE \sigma0TempProduct_reg[10] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(sigma0TempProduct0_n_95),
        .Q(\sigma0TempProduct_reg_n_0_[10] ),
        .R(1'b0));
  FDRE \sigma0TempProduct_reg[11] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(sigma0TempProduct0_n_94),
        .Q(\sigma0TempProduct_reg_n_0_[11] ),
        .R(1'b0));
  FDRE \sigma0TempProduct_reg[12] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(sigma0TempProduct0_n_93),
        .Q(\sigma0TempProduct_reg_n_0_[12] ),
        .R(1'b0));
  FDRE \sigma0TempProduct_reg[13] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(sigma0TempProduct0_n_92),
        .Q(\sigma0TempProduct_reg_n_0_[13] ),
        .R(1'b0));
  FDRE \sigma0TempProduct_reg[14] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(sigma0TempProduct0_n_91),
        .Q(\sigma0TempProduct_reg_n_0_[14] ),
        .R(1'b0));
  FDRE \sigma0TempProduct_reg[15] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(sigma0TempProduct0_n_90),
        .Q(\sigma0TempProduct_reg_n_0_[15] ),
        .R(1'b0));
  FDRE \sigma0TempProduct_reg[16] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(sigma0TempProduct0_n_89),
        .Q(\sigma0TempProduct_reg_n_0_[16] ),
        .R(1'b0));
  FDRE \sigma0TempProduct_reg[7] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(sigma0TempProduct0_n_98),
        .Q(\sigma0TempProduct_reg_n_0_[7] ),
        .R(1'b0));
  FDRE \sigma0TempProduct_reg[8] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(sigma0TempProduct0_n_97),
        .Q(\sigma0TempProduct_reg_n_0_[8] ),
        .R(1'b0));
  FDRE \sigma0TempProduct_reg[9] 
       (.C(clk),
        .CE(sigma0TempProduct0__0),
        .D(sigma0TempProduct0_n_96),
        .Q(\sigma0TempProduct_reg_n_0_[9] ),
        .R(1'b0));
  (* KEEP_HIERARCHY = "YES" *) 
  DSP48E2 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AMULTSEL("A"),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .AUTORESET_PRIORITY("RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(2),
    .BMULTSEL("B"),
    .BREG(2),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(0),
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
    slopeMultiply_reg
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,slopeMultiply_reg_i_19_n_0,\RcpLookupTable_Slopes[0]_0 }),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_slopeMultiply_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,slopeMultiply_reg_i_3_n_0,slopeMultiply_reg_i_4_n_0,slopeMultiply_reg_i_5_n_0,slopeMultiply_reg_i_6_n_0,slopeMultiply_reg_i_7_n_0,slopeMultiply_reg_i_8_n_0,slopeMultiply_reg_i_9_n_0,slopeMultiply_reg_i_10_n_0,slopeMultiply_reg_i_11_n_0,slopeMultiply_reg_i_12_n_0,slopeMultiply_reg_i_13_n_0,slopeMultiply_reg_i_14_n_0,slopeMultiply_reg_i_15_n_0,slopeMultiply_reg_i_16_n_0,slopeMultiply_reg_i_17_n_0,slopeMultiply_reg_i_18_n_0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_slopeMultiply_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_slopeMultiply_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_slopeMultiply_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(rcpLookupSlope0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(ISPEC_GO),
        .CEB2(1'b1),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(slopeMultiply0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_slopeMultiply_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_slopeMultiply_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_slopeMultiply_reg_P_UNCONNECTED[47:32],slopeMultiply_reg_n_74,slopeMultiply_reg_n_75,slopeMultiply_reg_n_76,slopeMultiply_reg_n_77,slopeMultiply_reg_n_78,slopeMultiply_reg_n_79,slopeMultiply_reg_n_80,slopeMultiply_reg_n_81,slopeMultiply_reg_n_82,slopeMultiply_reg_n_83,slopeMultiply_reg_n_84,slopeMultiply_reg_n_85,slopeMultiply_reg_n_86,slopeMultiply_reg_n_87,slopeMultiply_reg_n_88,slopeMultiply_reg_n_89,slopeMultiply_reg_n_90,slopeMultiply_reg_n_91,slopeMultiply_reg_n_92,slopeMultiply_reg_n_93,slopeMultiply_reg_n_94,slopeMultiply_reg_n_95,slopeMultiply_reg_n_96,slopeMultiply_reg_n_97,slopeMultiply_reg_n_98,slopeMultiply_reg_n_99,slopeMultiply_reg_n_100,slopeMultiply_reg_n_101,slopeMultiply_reg_n_102,slopeMultiply_reg_n_103,slopeMultiply_reg_n_104,slopeMultiply_reg_n_105}),
        .PATTERNBDETECT(NLW_slopeMultiply_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_slopeMultiply_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_slopeMultiply_reg_PCOUT_UNCONNECTED[47:0]),
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
        .UNDERFLOW(NLW_slopeMultiply_reg_UNDERFLOW_UNCONNECTED),
        .XOROUT(NLW_slopeMultiply_reg_XOROUT_UNCONNECTED[7:0]));
  FDRE slopeMultiply_reg__0
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_4_n_0),
        .Q(slopeMultiply_reg__15[14]),
        .R(1'b0));
  FDRE slopeMultiply_reg__1
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_5_n_0),
        .Q(slopeMultiply_reg__15[13]),
        .R(1'b0));
  FDRE slopeMultiply_reg__10
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_14_n_0),
        .Q(slopeMultiply_reg__15[4]),
        .R(1'b0));
  FDRE slopeMultiply_reg__11
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_15_n_0),
        .Q(slopeMultiply_reg__15[3]),
        .R(1'b0));
  FDRE slopeMultiply_reg__12
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_16_n_0),
        .Q(slopeMultiply_reg__15[2]),
        .R(1'b0));
  FDRE slopeMultiply_reg__13
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_17_n_0),
        .Q(slopeMultiply_reg__15[1]),
        .R(1'b0));
  FDRE slopeMultiply_reg__14
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_18_n_0),
        .Q(slopeMultiply_reg__15[0]),
        .R(1'b0));
  FDRE slopeMultiply_reg__2
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_6_n_0),
        .Q(slopeMultiply_reg__15[12]),
        .R(1'b0));
  FDRE slopeMultiply_reg__3
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_7_n_0),
        .Q(slopeMultiply_reg__15[11]),
        .R(1'b0));
  FDRE slopeMultiply_reg__4
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_8_n_0),
        .Q(slopeMultiply_reg__15[10]),
        .R(1'b0));
  FDRE slopeMultiply_reg__5
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_9_n_0),
        .Q(slopeMultiply_reg__15[9]),
        .R(1'b0));
  FDRE slopeMultiply_reg__6
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_10_n_0),
        .Q(slopeMultiply_reg__15[8]),
        .R(1'b0));
  FDRE slopeMultiply_reg__7
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_11_n_0),
        .Q(slopeMultiply_reg__15[7]),
        .R(1'b0));
  FDRE slopeMultiply_reg__8
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_12_n_0),
        .Q(slopeMultiply_reg__15[6]),
        .R(1'b0));
  FDRE slopeMultiply_reg__9
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_3_n_0),
        .Q(slopeMultiply_reg__15[15]),
        .R(1'b0));
  FDRE slopeMultiply_reg__9__0
       (.C(clk),
        .CE(ISPEC_GO),
        .D(slopeMultiply_reg_i_13_n_0),
        .Q(slopeMultiply_reg__15[5]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    slopeMultiply_reg_i_1
       (.I0(\rcpPipeline_reg[0][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[0][useEarlyOutBypass_n_0_] ),
        .O(rcpLookupSlope0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_10
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[11]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_10_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_11
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[10]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_11_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_12
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[9]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_12_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_13
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[8]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_13_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_14
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[7]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_14_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_15
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[6]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_15_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_16
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[5]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_16_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_17
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[4]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_17_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_18
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[3]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_18_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h007F)) 
    slopeMultiply_reg_i_19
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .O(slopeMultiply_reg_i_19_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    slopeMultiply_reg_i_2
       (.I0(\rcpPipeline_reg[1][pipeStageIsValid]__0 ),
        .I1(\rcpPipeline_reg[1][useEarlyOutBypass_n_0_] ),
        .O(slopeMultiply0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hEBAB)) 
    slopeMultiply_reg_i_20
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Slopes[0]_0 [14]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h5213)) 
    slopeMultiply_reg_i_21
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Slopes[0]_0 [13]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h613D)) 
    slopeMultiply_reg_i_22
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Slopes[0]_0 [12]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h07B4)) 
    slopeMultiply_reg_i_23
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Slopes[0]_0 [11]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7B76)) 
    slopeMultiply_reg_i_24
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Slopes[0]_0 [10]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hE990)) 
    slopeMultiply_reg_i_25
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Slopes[0]_0 [9]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0C72)) 
    slopeMultiply_reg_i_26
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Slopes[0]_0 [8]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h5A65)) 
    slopeMultiply_reg_i_27
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Slopes[0]_0 [7]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h1EA1)) 
    slopeMultiply_reg_i_28
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Slopes[0]_0 [6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h4AD7)) 
    slopeMultiply_reg_i_29
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .O(\RcpLookupTable_Slopes[0]_0 [5]));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_3
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[18]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hEEEB)) 
    slopeMultiply_reg_i_30
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .O(\RcpLookupTable_Slopes[0]_0 [4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h4A56)) 
    slopeMultiply_reg_i_31
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Slopes[0]_0 [3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h2768)) 
    slopeMultiply_reg_i_32
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Slopes[0]_0 [2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h504E)) 
    slopeMultiply_reg_i_33
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .O(\RcpLookupTable_Slopes[0]_0 [1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hBCD3)) 
    slopeMultiply_reg_i_34
       (.I0(\rcpPipeline_reg[0][calculatedMantissa] [22]),
        .I1(\rcpPipeline_reg[0][calculatedMantissa] [21]),
        .I2(\rcpPipeline_reg[0][calculatedMantissa] [20]),
        .I3(\rcpPipeline_reg[0][calculatedMantissa] [19]),
        .O(\RcpLookupTable_Slopes[0]_0 [0]));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_4
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[17]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_4_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_5
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[16]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_5_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_6
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[15]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_6_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_7
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[14]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_7_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_8
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[13]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_8_n_0));
  LUT6 #(
    .INIT(64'hFE000000FE00F000)) 
    slopeMultiply_reg_i_9
       (.I0(\rcpPipeline[0][calculatedMantissa][22]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(\rcpPipeline[0][calculatedMantissa][22]_i_3_n_0 ),
        .I3(\rcpPipeline[0][calculatedMantissa][22]_i_4_n_0 ),
        .I4(IN_A[12]),
        .I5(\rcpPipeline[0][calculatedMantissa][22]_i_5_n_0 ),
        .O(slopeMultiply_reg_i_9_n_0));
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
