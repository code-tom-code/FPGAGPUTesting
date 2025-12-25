// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Sun Dec 21 18:01:13 2025
// Host        : TomTop3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StandaloneFloatALU_A_0_1/MainDesign_StandaloneFloatALU_A_0_1_sim_netlist.v
// Design      : MainDesign_StandaloneFloatALU_A_0_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "MainDesign_StandaloneFloatALU_A_0_1,StandaloneFloatALU_ADD,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "StandaloneFloatALU_ADD,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module MainDesign_StandaloneFloatALU_A_0_1
   (clk,
    IN_A,
    IN_B,
    OADD,
    IADD_GO);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_mode = "slave clk" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input clk;
  input [31:0]IN_A;
  input [31:0]IN_B;
  output [31:0]OADD;
  input IADD_GO;

  wire IADD_GO;
  wire [31:0]IN_A;
  wire [31:0]IN_B;
  wire [31:0]OADD;
  wire clk;

  MainDesign_StandaloneFloatALU_A_0_1_StandaloneFloatALU_ADD U0
       (.IADD_GO(IADD_GO),
        .IN_A(IN_A),
        .IN_B(IN_B),
        .OADD(OADD),
        .clk(clk));
endmodule

(* ORIG_REF_NAME = "StandaloneFloatALU_ADD" *) 
module MainDesign_StandaloneFloatALU_A_0_1_StandaloneFloatALU_ADD
   (OADD,
    IN_B,
    IN_A,
    IADD_GO,
    clk);
  output [31:0]OADD;
  input [31:0]IN_B;
  input [31:0]IN_A;
  input IADD_GO;
  input clk;

  wire [23:1]\ADDStage1.mantissaMin0 ;
  wire [24:1]\ADDStage2.postAddMantissa0 ;
  wire GetFloatIsINF013_in;
  wire GetFloatIsINF015_in;
  wire GetFloatIsReal__5;
  wire IADD_GO;
  wire [31:0]IN_A;
  wire [31:0]IN_B;
  wire [31:0]OADD;
  wire \OADD[0]_i_1_n_0 ;
  wire \OADD[0]_i_2_n_0 ;
  wire \OADD[10]_i_1_n_0 ;
  wire \OADD[10]_i_2_n_0 ;
  wire \OADD[11]_i_1_n_0 ;
  wire \OADD[11]_i_2_n_0 ;
  wire \OADD[11]_i_3_n_0 ;
  wire \OADD[12]_i_1_n_0 ;
  wire \OADD[12]_i_2_n_0 ;
  wire \OADD[12]_i_3_n_0 ;
  wire \OADD[13]_i_1_n_0 ;
  wire \OADD[13]_i_2_n_0 ;
  wire \OADD[13]_i_3_n_0 ;
  wire \OADD[14]_i_1_n_0 ;
  wire \OADD[14]_i_2_n_0 ;
  wire \OADD[14]_i_3_n_0 ;
  wire \OADD[15]_i_1_n_0 ;
  wire \OADD[15]_i_2_n_0 ;
  wire \OADD[15]_i_3_n_0 ;
  wire \OADD[15]_i_4_n_0 ;
  wire \OADD[16]_i_1_n_0 ;
  wire \OADD[16]_i_2_n_0 ;
  wire \OADD[16]_i_3_n_0 ;
  wire \OADD[16]_i_4_n_0 ;
  wire \OADD[17]_i_1_n_0 ;
  wire \OADD[17]_i_2_n_0 ;
  wire \OADD[17]_i_3_n_0 ;
  wire \OADD[17]_i_4_n_0 ;
  wire \OADD[18]_i_1_n_0 ;
  wire \OADD[18]_i_2_n_0 ;
  wire \OADD[18]_i_3_n_0 ;
  wire \OADD[18]_i_4_n_0 ;
  wire \OADD[19]_i_1_n_0 ;
  wire \OADD[19]_i_2_n_0 ;
  wire \OADD[19]_i_3_n_0 ;
  wire \OADD[1]_i_1_n_0 ;
  wire \OADD[1]_i_2_n_0 ;
  wire \OADD[20]_i_1_n_0 ;
  wire \OADD[20]_i_2_n_0 ;
  wire \OADD[20]_i_3_n_0 ;
  wire \OADD[21]_i_1_n_0 ;
  wire \OADD[21]_i_2_n_0 ;
  wire \OADD[21]_i_3_n_0 ;
  wire \OADD[22]_i_10_n_0 ;
  wire \OADD[22]_i_11_n_0 ;
  wire \OADD[22]_i_1_n_0 ;
  wire \OADD[22]_i_2_n_0 ;
  wire \OADD[22]_i_3_n_0 ;
  wire \OADD[22]_i_4_n_0 ;
  wire \OADD[22]_i_5_n_0 ;
  wire \OADD[22]_i_6_n_0 ;
  wire \OADD[22]_i_7_n_0 ;
  wire \OADD[22]_i_8_n_0 ;
  wire \OADD[22]_i_9_n_0 ;
  wire \OADD[23]_i_1_n_0 ;
  wire \OADD[24]_i_1_n_0 ;
  wire \OADD[25]_i_1_n_0 ;
  wire \OADD[25]_i_2_n_0 ;
  wire \OADD[26]_i_1_n_0 ;
  wire \OADD[26]_i_2_n_0 ;
  wire \OADD[27]_i_1_n_0 ;
  wire \OADD[27]_i_2_n_0 ;
  wire \OADD[28]_i_1_n_0 ;
  wire \OADD[28]_i_2_n_0 ;
  wire \OADD[29]_i_1_n_0 ;
  wire \OADD[2]_i_1_n_0 ;
  wire \OADD[2]_i_2_n_0 ;
  wire \OADD[2]_i_3_n_0 ;
  wire \OADD[30]_i_1_n_0 ;
  wire \OADD[30]_i_2_n_0 ;
  wire \OADD[31]_i_1_n_0 ;
  wire \OADD[31]_i_2_n_0 ;
  wire \OADD[31]_i_3_n_0 ;
  wire \OADD[31]_i_4_n_0 ;
  wire \OADD[31]_i_5_n_0 ;
  wire \OADD[31]_i_6_n_0 ;
  wire \OADD[31]_i_7_n_0 ;
  wire \OADD[31]_i_8_n_0 ;
  wire \OADD[31]_i_9_n_0 ;
  wire \OADD[3]_i_1_n_0 ;
  wire \OADD[3]_i_2_n_0 ;
  wire \OADD[4]_i_1_n_0 ;
  wire \OADD[4]_i_2_n_0 ;
  wire \OADD[5]_i_1_n_0 ;
  wire \OADD[5]_i_2_n_0 ;
  wire \OADD[6]_i_1_n_0 ;
  wire \OADD[6]_i_2_n_0 ;
  wire \OADD[7]_i_1_n_0 ;
  wire \OADD[7]_i_2_n_0 ;
  wire \OADD[7]_i_3_n_0 ;
  wire \OADD[8]_i_1_n_0 ;
  wire \OADD[8]_i_2_n_0 ;
  wire \OADD[8]_i_3_n_0 ;
  wire \OADD[9]_i_1_n_0 ;
  wire \OADD[9]_i_2_n_0 ;
  wire [31:0]OADD_Temp;
  wire \OADD_Temp[22]_i_1_n_0 ;
  wire \OADD_Temp[22]_i_2_n_0 ;
  wire \OADD_Temp[23]_i_1_n_0 ;
  wire \OADD_Temp[24]_i_1_n_0 ;
  wire \OADD_Temp[25]_i_1_n_0 ;
  wire \OADD_Temp[26]_i_1_n_0 ;
  wire \OADD_Temp[27]_i_1_n_0 ;
  wire \OADD_Temp[28]_i_1_n_0 ;
  wire \OADD_Temp[29]_i_1_n_0 ;
  wire \OADD_Temp[30]_i_1_n_0 ;
  wire \OADD_Temp[31]_i_1_n_0 ;
  wire [4:0]R;
  wire addALessThanB;
  wire \addDenormFlushedValA[30]_i_1_n_0 ;
  wire \addDenormFlushedValA[30]_i_3_n_0 ;
  wire \addDenormFlushedValA_reg_n_0_[0] ;
  wire \addDenormFlushedValA_reg_n_0_[10] ;
  wire \addDenormFlushedValA_reg_n_0_[11] ;
  wire \addDenormFlushedValA_reg_n_0_[12] ;
  wire \addDenormFlushedValA_reg_n_0_[13] ;
  wire \addDenormFlushedValA_reg_n_0_[14] ;
  wire \addDenormFlushedValA_reg_n_0_[15] ;
  wire \addDenormFlushedValA_reg_n_0_[16] ;
  wire \addDenormFlushedValA_reg_n_0_[17] ;
  wire \addDenormFlushedValA_reg_n_0_[18] ;
  wire \addDenormFlushedValA_reg_n_0_[19] ;
  wire \addDenormFlushedValA_reg_n_0_[1] ;
  wire \addDenormFlushedValA_reg_n_0_[20] ;
  wire \addDenormFlushedValA_reg_n_0_[21] ;
  wire \addDenormFlushedValA_reg_n_0_[22] ;
  wire \addDenormFlushedValA_reg_n_0_[23] ;
  wire \addDenormFlushedValA_reg_n_0_[24] ;
  wire \addDenormFlushedValA_reg_n_0_[25] ;
  wire \addDenormFlushedValA_reg_n_0_[26] ;
  wire \addDenormFlushedValA_reg_n_0_[27] ;
  wire \addDenormFlushedValA_reg_n_0_[28] ;
  wire \addDenormFlushedValA_reg_n_0_[29] ;
  wire \addDenormFlushedValA_reg_n_0_[2] ;
  wire \addDenormFlushedValA_reg_n_0_[30] ;
  wire \addDenormFlushedValA_reg_n_0_[3] ;
  wire \addDenormFlushedValA_reg_n_0_[4] ;
  wire \addDenormFlushedValA_reg_n_0_[5] ;
  wire \addDenormFlushedValA_reg_n_0_[6] ;
  wire \addDenormFlushedValA_reg_n_0_[7] ;
  wire \addDenormFlushedValA_reg_n_0_[8] ;
  wire \addDenormFlushedValA_reg_n_0_[9] ;
  wire \addDenormFlushedValB[30]_i_3_n_0 ;
  wire \addDenormFlushedValB_reg_n_0_[0] ;
  wire \addDenormFlushedValB_reg_n_0_[10] ;
  wire \addDenormFlushedValB_reg_n_0_[11] ;
  wire \addDenormFlushedValB_reg_n_0_[12] ;
  wire \addDenormFlushedValB_reg_n_0_[13] ;
  wire \addDenormFlushedValB_reg_n_0_[14] ;
  wire \addDenormFlushedValB_reg_n_0_[15] ;
  wire \addDenormFlushedValB_reg_n_0_[16] ;
  wire \addDenormFlushedValB_reg_n_0_[17] ;
  wire \addDenormFlushedValB_reg_n_0_[18] ;
  wire \addDenormFlushedValB_reg_n_0_[19] ;
  wire \addDenormFlushedValB_reg_n_0_[1] ;
  wire \addDenormFlushedValB_reg_n_0_[20] ;
  wire \addDenormFlushedValB_reg_n_0_[21] ;
  wire \addDenormFlushedValB_reg_n_0_[22] ;
  wire \addDenormFlushedValB_reg_n_0_[23] ;
  wire \addDenormFlushedValB_reg_n_0_[24] ;
  wire \addDenormFlushedValB_reg_n_0_[25] ;
  wire \addDenormFlushedValB_reg_n_0_[26] ;
  wire \addDenormFlushedValB_reg_n_0_[27] ;
  wire \addDenormFlushedValB_reg_n_0_[28] ;
  wire \addDenormFlushedValB_reg_n_0_[29] ;
  wire \addDenormFlushedValB_reg_n_0_[2] ;
  wire \addDenormFlushedValB_reg_n_0_[30] ;
  wire \addDenormFlushedValB_reg_n_0_[3] ;
  wire \addDenormFlushedValB_reg_n_0_[4] ;
  wire \addDenormFlushedValB_reg_n_0_[5] ;
  wire \addDenormFlushedValB_reg_n_0_[6] ;
  wire \addDenormFlushedValB_reg_n_0_[7] ;
  wire \addDenormFlushedValB_reg_n_0_[8] ;
  wire \addDenormFlushedValB_reg_n_0_[9] ;
  wire [31:0]addEarlyOutBypass0;
  wire \addEarlyOutBypass0[0]_i_1_n_0 ;
  wire \addEarlyOutBypass0[10]_i_1_n_0 ;
  wire \addEarlyOutBypass0[11]_i_1_n_0 ;
  wire \addEarlyOutBypass0[12]_i_1_n_0 ;
  wire \addEarlyOutBypass0[13]_i_1_n_0 ;
  wire \addEarlyOutBypass0[14]_i_1_n_0 ;
  wire \addEarlyOutBypass0[15]_i_1_n_0 ;
  wire \addEarlyOutBypass0[16]_i_1_n_0 ;
  wire \addEarlyOutBypass0[17]_i_1_n_0 ;
  wire \addEarlyOutBypass0[18]_i_1_n_0 ;
  wire \addEarlyOutBypass0[19]_i_1_n_0 ;
  wire \addEarlyOutBypass0[1]_i_1_n_0 ;
  wire \addEarlyOutBypass0[20]_i_1_n_0 ;
  wire \addEarlyOutBypass0[21]_i_1_n_0 ;
  wire \addEarlyOutBypass0[22]_i_1_n_0 ;
  wire \addEarlyOutBypass0[23]_i_1_n_0 ;
  wire \addEarlyOutBypass0[24]_i_1_n_0 ;
  wire \addEarlyOutBypass0[25]_i_1_n_0 ;
  wire \addEarlyOutBypass0[26]_i_1_n_0 ;
  wire \addEarlyOutBypass0[27]_i_1_n_0 ;
  wire \addEarlyOutBypass0[28]_i_1_n_0 ;
  wire \addEarlyOutBypass0[29]_i_1_n_0 ;
  wire \addEarlyOutBypass0[2]_i_1_n_0 ;
  wire \addEarlyOutBypass0[30]_i_1_n_0 ;
  wire \addEarlyOutBypass0[30]_i_2_n_0 ;
  wire \addEarlyOutBypass0[30]_i_3_n_0 ;
  wire \addEarlyOutBypass0[30]_i_4_n_0 ;
  wire \addEarlyOutBypass0[30]_i_5_n_0 ;
  wire \addEarlyOutBypass0[30]_i_6_n_0 ;
  wire \addEarlyOutBypass0[31]_i_12_n_0 ;
  wire \addEarlyOutBypass0[31]_i_14_n_0 ;
  wire \addEarlyOutBypass0[31]_i_15_n_0 ;
  wire \addEarlyOutBypass0[31]_i_18_n_0 ;
  wire \addEarlyOutBypass0[31]_i_19_n_0 ;
  wire \addEarlyOutBypass0[31]_i_1_n_0 ;
  wire \addEarlyOutBypass0[31]_i_20_n_0 ;
  wire \addEarlyOutBypass0[31]_i_21_n_0 ;
  wire \addEarlyOutBypass0[31]_i_22_n_0 ;
  wire \addEarlyOutBypass0[31]_i_23_n_0 ;
  wire \addEarlyOutBypass0[31]_i_24_n_0 ;
  wire \addEarlyOutBypass0[31]_i_25_n_0 ;
  wire \addEarlyOutBypass0[31]_i_26_n_0 ;
  wire \addEarlyOutBypass0[31]_i_27_n_0 ;
  wire \addEarlyOutBypass0[31]_i_2_n_0 ;
  wire \addEarlyOutBypass0[31]_i_3_n_0 ;
  wire \addEarlyOutBypass0[31]_i_5_n_0 ;
  wire \addEarlyOutBypass0[31]_i_7_n_0 ;
  wire \addEarlyOutBypass0[31]_i_8_n_0 ;
  wire \addEarlyOutBypass0[31]_i_9_n_0 ;
  wire \addEarlyOutBypass0[3]_i_1_n_0 ;
  wire \addEarlyOutBypass0[4]_i_1_n_0 ;
  wire \addEarlyOutBypass0[5]_i_1_n_0 ;
  wire \addEarlyOutBypass0[6]_i_1_n_0 ;
  wire \addEarlyOutBypass0[7]_i_1_n_0 ;
  wire \addEarlyOutBypass0[8]_i_1_n_0 ;
  wire \addEarlyOutBypass0[9]_i_1_n_0 ;
  wire [31:0]addEarlyOutBypass1;
  wire \addEarlyOutBypass1[0]_i_1_n_0 ;
  wire \addEarlyOutBypass1[10]_i_1_n_0 ;
  wire \addEarlyOutBypass1[11]_i_1_n_0 ;
  wire \addEarlyOutBypass1[12]_i_1_n_0 ;
  wire \addEarlyOutBypass1[13]_i_1_n_0 ;
  wire \addEarlyOutBypass1[14]_i_1_n_0 ;
  wire \addEarlyOutBypass1[15]_i_1_n_0 ;
  wire \addEarlyOutBypass1[16]_i_1_n_0 ;
  wire \addEarlyOutBypass1[17]_i_1_n_0 ;
  wire \addEarlyOutBypass1[18]_i_1_n_0 ;
  wire \addEarlyOutBypass1[19]_i_1_n_0 ;
  wire \addEarlyOutBypass1[1]_i_1_n_0 ;
  wire \addEarlyOutBypass1[20]_i_1_n_0 ;
  wire \addEarlyOutBypass1[21]_i_1_n_0 ;
  wire \addEarlyOutBypass1[22]_i_1_n_0 ;
  wire \addEarlyOutBypass1[23]_i_1_n_0 ;
  wire \addEarlyOutBypass1[24]_i_1_n_0 ;
  wire \addEarlyOutBypass1[25]_i_1_n_0 ;
  wire \addEarlyOutBypass1[26]_i_1_n_0 ;
  wire \addEarlyOutBypass1[27]_i_1_n_0 ;
  wire \addEarlyOutBypass1[28]_i_1_n_0 ;
  wire \addEarlyOutBypass1[29]_i_1_n_0 ;
  wire \addEarlyOutBypass1[2]_i_1_n_0 ;
  wire \addEarlyOutBypass1[30]_i_1_n_0 ;
  wire \addEarlyOutBypass1[31]_i_1_n_0 ;
  wire \addEarlyOutBypass1[31]_i_2_n_0 ;
  wire \addEarlyOutBypass1[3]_i_1_n_0 ;
  wire \addEarlyOutBypass1[4]_i_1_n_0 ;
  wire \addEarlyOutBypass1[5]_i_1_n_0 ;
  wire \addEarlyOutBypass1[6]_i_1_n_0 ;
  wire \addEarlyOutBypass1[7]_i_1_n_0 ;
  wire \addEarlyOutBypass1[8]_i_1_n_0 ;
  wire \addEarlyOutBypass1[9]_i_1_n_0 ;
  wire addEarlyOutBypassEnable00__0;
  wire addEarlyOutBypassEnable0120_out__0;
  wire addEarlyOutBypassEnable0123_out__0;
  wire addEarlyOutBypassEnable013_out;
  wire addEarlyOutBypassEnable01__2;
  wire addEarlyOutBypassEnable0__0;
  wire addEarlyOutBypassEnable0_i_1_n_0;
  wire addEarlyOutBypassEnable0_i_3_n_0;
  wire addEarlyOutBypassEnable0_i_4_n_0;
  wire addEarlyOutBypassEnable1_i_1_n_0;
  wire addEarlyOutBypassEnable1_reg_n_0;
  wire addEarlyOutBypassEnable2_i_1_n_0;
  wire addEarlyOutBypassEnable2_reg_n_0;
  wire [7:0]addExponentDeltaAMinusB;
  wire [7:0]addExponentDeltaAMinusB0;
  wire addExponentDeltaAMinusBShiftTooFar;
  wire addExponentDeltaAMinusBShiftTooFar_i_1_n_0;
  wire addExponentDeltaAMinusBShiftTooFar_i_2_n_0;
  wire \addExponentDeltaAMinusB[3]_i_2_n_0 ;
  wire \addExponentDeltaAMinusB[3]_i_3_n_0 ;
  wire \addExponentDeltaAMinusB[4]_i_2_n_0 ;
  wire \addExponentDeltaAMinusB[4]_i_3_n_0 ;
  wire \addExponentDeltaAMinusB[5]_i_2_n_0 ;
  wire \addExponentDeltaAMinusB[5]_i_3_n_0 ;
  wire \addExponentDeltaAMinusB[7]_i_2_n_0 ;
  wire \addExponentDeltaAMinusB[7]_i_3_n_0 ;
  wire \addExponentDeltaAMinusB[7]_i_4_n_0 ;
  wire \addExponentDeltaAMinusB[7]_i_5_n_0 ;
  wire [7:1]addExponentDeltaBMinusA;
  wire [7:1]addExponentDeltaBMinusA0;
  wire addExponentDeltaBMinusAShiftTooFar;
  wire addExponentDeltaBMinusAShiftTooFar_i_1_n_0;
  wire addExponentDeltaBMinusAShiftTooFar_i_2_n_0;
  wire \addExponentDeltaBMinusA[3]_i_2_n_0 ;
  wire \addExponentDeltaBMinusA[3]_i_3_n_0 ;
  wire \addExponentDeltaBMinusA[4]_i_2_n_0 ;
  wire \addExponentDeltaBMinusA[4]_i_3_n_0 ;
  wire \addExponentDeltaBMinusA[5]_i_2_n_0 ;
  wire \addExponentDeltaBMinusA[5]_i_3_n_0 ;
  wire \addExponentDeltaBMinusA[7]_i_2_n_0 ;
  wire \addExponentDeltaBMinusA[7]_i_3_n_0 ;
  wire \addExponentDeltaBMinusA[7]_i_4_n_0 ;
  wire \addExponentDeltaBMinusA[7]_i_5_n_0 ;
  wire [7:0]addFinalExp;
  wire \addFinalExp[0]_i_1_n_0 ;
  wire \addFinalExp[1]_i_1_n_0 ;
  wire \addFinalExp[2]_i_1_n_0 ;
  wire \addFinalExp[3]_i_1_n_0 ;
  wire \addFinalExp[4]_i_1_n_0 ;
  wire \addFinalExp[5]_i_1_n_0 ;
  wire \addFinalExp[5]_i_2_n_0 ;
  wire \addFinalExp[6]_i_1_n_0 ;
  wire \addFinalExp[6]_i_2_n_0 ;
  wire \addFinalExp[7]_i_1_n_0 ;
  wire \addFinalExp[7]_i_2_n_0 ;
  wire addFinalSignIsNeg_i_1_n_0;
  wire addFinalSignIsNeg_reg_n_0;
  wire [0:0]addMaxVal1;
  wire \addMaxVal1[23]_i_1_n_0 ;
  wire \addMaxVal1[24]_i_1_n_0 ;
  wire \addMaxVal1[25]_i_1_n_0 ;
  wire \addMaxVal1[26]_i_1_n_0 ;
  wire \addMaxVal1[27]_i_1_n_0 ;
  wire \addMaxVal1[28]_i_1_n_0 ;
  wire \addMaxVal1[29]_i_1_n_0 ;
  wire \addMaxVal1[30]_i_2_n_0 ;
  wire \addMaxVal1_reg_n_0_[23] ;
  wire \addMaxVal1_reg_n_0_[24] ;
  wire \addMaxVal1_reg_n_0_[25] ;
  wire \addMaxVal1_reg_n_0_[26] ;
  wire \addMaxVal1_reg_n_0_[27] ;
  wire \addMaxVal1_reg_n_0_[28] ;
  wire \addMaxVal1_reg_n_0_[29] ;
  wire \addMaxVal1_reg_n_0_[30] ;
  wire addPipelineValidStage0;
  wire addPipelineValidStage1;
  wire addPipelineValidStage2;
  wire [0:0]addPostAddMantissa;
  wire [0:0]addPostAddMantissa1;
  wire addPostAddMantissa10__22_carry__0_n_0;
  wire addPostAddMantissa10__22_carry__0_n_1;
  wire addPostAddMantissa10__22_carry__0_n_10;
  wire addPostAddMantissa10__22_carry__0_n_11;
  wire addPostAddMantissa10__22_carry__0_n_12;
  wire addPostAddMantissa10__22_carry__0_n_13;
  wire addPostAddMantissa10__22_carry__0_n_14;
  wire addPostAddMantissa10__22_carry__0_n_15;
  wire addPostAddMantissa10__22_carry__0_n_2;
  wire addPostAddMantissa10__22_carry__0_n_3;
  wire addPostAddMantissa10__22_carry__0_n_4;
  wire addPostAddMantissa10__22_carry__0_n_5;
  wire addPostAddMantissa10__22_carry__0_n_6;
  wire addPostAddMantissa10__22_carry__0_n_7;
  wire addPostAddMantissa10__22_carry__0_n_8;
  wire addPostAddMantissa10__22_carry__0_n_9;
  wire addPostAddMantissa10__22_carry__1_n_0;
  wire addPostAddMantissa10__22_carry__1_n_1;
  wire addPostAddMantissa10__22_carry__1_n_10;
  wire addPostAddMantissa10__22_carry__1_n_11;
  wire addPostAddMantissa10__22_carry__1_n_12;
  wire addPostAddMantissa10__22_carry__1_n_13;
  wire addPostAddMantissa10__22_carry__1_n_14;
  wire addPostAddMantissa10__22_carry__1_n_15;
  wire addPostAddMantissa10__22_carry__1_n_2;
  wire addPostAddMantissa10__22_carry__1_n_3;
  wire addPostAddMantissa10__22_carry__1_n_4;
  wire addPostAddMantissa10__22_carry__1_n_5;
  wire addPostAddMantissa10__22_carry__1_n_6;
  wire addPostAddMantissa10__22_carry__1_n_7;
  wire addPostAddMantissa10__22_carry__1_n_8;
  wire addPostAddMantissa10__22_carry__1_n_9;
  wire addPostAddMantissa10__22_carry__2_n_14;
  wire addPostAddMantissa10__22_carry__2_n_15;
  wire addPostAddMantissa10__22_carry__2_n_7;
  wire addPostAddMantissa10__22_carry_i_10__0_n_0;
  wire addPostAddMantissa10__22_carry_i_10__1_n_0;
  wire addPostAddMantissa10__22_carry_i_10_n_0;
  wire addPostAddMantissa10__22_carry_i_11__0_n_0;
  wire addPostAddMantissa10__22_carry_i_11__1_n_0;
  wire addPostAddMantissa10__22_carry_i_11_n_0;
  wire addPostAddMantissa10__22_carry_i_12__0_n_0;
  wire addPostAddMantissa10__22_carry_i_12__1_n_0;
  wire addPostAddMantissa10__22_carry_i_12_n_0;
  wire addPostAddMantissa10__22_carry_i_13__0_n_0;
  wire addPostAddMantissa10__22_carry_i_13__1_n_0;
  wire addPostAddMantissa10__22_carry_i_13_n_0;
  wire addPostAddMantissa10__22_carry_i_14__0_n_0;
  wire addPostAddMantissa10__22_carry_i_14__1_n_0;
  wire addPostAddMantissa10__22_carry_i_14_n_0;
  wire addPostAddMantissa10__22_carry_i_15__0_n_0;
  wire addPostAddMantissa10__22_carry_i_15__1_n_0;
  wire addPostAddMantissa10__22_carry_i_15_n_0;
  wire addPostAddMantissa10__22_carry_i_16__0_n_0;
  wire addPostAddMantissa10__22_carry_i_16__1_n_0;
  wire addPostAddMantissa10__22_carry_i_16_n_0;
  wire addPostAddMantissa10__22_carry_i_17__0_n_0;
  wire addPostAddMantissa10__22_carry_i_17__1_n_0;
  wire addPostAddMantissa10__22_carry_i_17_n_0;
  wire addPostAddMantissa10__22_carry_i_18__0_n_0;
  wire addPostAddMantissa10__22_carry_i_18__1_n_0;
  wire addPostAddMantissa10__22_carry_i_18_n_0;
  wire addPostAddMantissa10__22_carry_i_19__0_n_0;
  wire addPostAddMantissa10__22_carry_i_19__1_n_0;
  wire addPostAddMantissa10__22_carry_i_19_n_0;
  wire addPostAddMantissa10__22_carry_i_1__1_n_0;
  wire addPostAddMantissa10__22_carry_i_1__2_n_0;
  wire addPostAddMantissa10__22_carry_i_1_n_0;
  wire addPostAddMantissa10__22_carry_i_20__0_n_0;
  wire addPostAddMantissa10__22_carry_i_20__1_n_0;
  wire addPostAddMantissa10__22_carry_i_20_n_0;
  wire addPostAddMantissa10__22_carry_i_21__0_n_0;
  wire addPostAddMantissa10__22_carry_i_21__1_n_0;
  wire addPostAddMantissa10__22_carry_i_21_n_0;
  wire addPostAddMantissa10__22_carry_i_22__0_n_0;
  wire addPostAddMantissa10__22_carry_i_22__1_n_0;
  wire addPostAddMantissa10__22_carry_i_22_n_0;
  wire addPostAddMantissa10__22_carry_i_23__0_n_0;
  wire addPostAddMantissa10__22_carry_i_23__1_n_0;
  wire addPostAddMantissa10__22_carry_i_23_n_0;
  wire addPostAddMantissa10__22_carry_i_24__0_n_0;
  wire addPostAddMantissa10__22_carry_i_24__1_n_0;
  wire addPostAddMantissa10__22_carry_i_24_n_0;
  wire addPostAddMantissa10__22_carry_i_25__0_n_0;
  wire addPostAddMantissa10__22_carry_i_25__1_n_0;
  wire addPostAddMantissa10__22_carry_i_25_n_0;
  wire addPostAddMantissa10__22_carry_i_26__0_n_0;
  wire addPostAddMantissa10__22_carry_i_26__1_n_3;
  wire addPostAddMantissa10__22_carry_i_26__1_n_4;
  wire addPostAddMantissa10__22_carry_i_26__1_n_5;
  wire addPostAddMantissa10__22_carry_i_26__1_n_6;
  wire addPostAddMantissa10__22_carry_i_26__1_n_7;
  wire addPostAddMantissa10__22_carry_i_26_n_0;
  wire addPostAddMantissa10__22_carry_i_27__0_n_0;
  wire addPostAddMantissa10__22_carry_i_27__1_n_0;
  wire addPostAddMantissa10__22_carry_i_27_n_0;
  wire addPostAddMantissa10__22_carry_i_28__0_n_0;
  wire addPostAddMantissa10__22_carry_i_28__1_n_0;
  wire addPostAddMantissa10__22_carry_i_28_n_0;
  wire addPostAddMantissa10__22_carry_i_29__0_n_0;
  wire addPostAddMantissa10__22_carry_i_29__1_n_0;
  wire addPostAddMantissa10__22_carry_i_29_n_0;
  wire addPostAddMantissa10__22_carry_i_2__0_n_0;
  wire addPostAddMantissa10__22_carry_i_2__1_n_0;
  wire addPostAddMantissa10__22_carry_i_2__2_n_0;
  wire addPostAddMantissa10__22_carry_i_2_n_0;
  wire addPostAddMantissa10__22_carry_i_30__0_n_0;
  wire addPostAddMantissa10__22_carry_i_30__1_n_0;
  wire addPostAddMantissa10__22_carry_i_30_n_0;
  wire addPostAddMantissa10__22_carry_i_31__0_n_0;
  wire addPostAddMantissa10__22_carry_i_31__1_n_0;
  wire addPostAddMantissa10__22_carry_i_31_n_0;
  wire addPostAddMantissa10__22_carry_i_32__0_n_0;
  wire addPostAddMantissa10__22_carry_i_32__1_n_0;
  wire addPostAddMantissa10__22_carry_i_32_n_0;
  wire addPostAddMantissa10__22_carry_i_33__0_n_0;
  wire addPostAddMantissa10__22_carry_i_33__1_n_0;
  wire addPostAddMantissa10__22_carry_i_33__1_n_1;
  wire addPostAddMantissa10__22_carry_i_33__1_n_2;
  wire addPostAddMantissa10__22_carry_i_33__1_n_3;
  wire addPostAddMantissa10__22_carry_i_33__1_n_4;
  wire addPostAddMantissa10__22_carry_i_33__1_n_5;
  wire addPostAddMantissa10__22_carry_i_33__1_n_6;
  wire addPostAddMantissa10__22_carry_i_33__1_n_7;
  wire addPostAddMantissa10__22_carry_i_33_n_0;
  wire addPostAddMantissa10__22_carry_i_34__0_n_0;
  wire addPostAddMantissa10__22_carry_i_34__1_n_0;
  wire addPostAddMantissa10__22_carry_i_34_n_0;
  wire addPostAddMantissa10__22_carry_i_35__0_n_0;
  wire addPostAddMantissa10__22_carry_i_35__1_n_0;
  wire addPostAddMantissa10__22_carry_i_35_n_0;
  wire addPostAddMantissa10__22_carry_i_36__0_n_0;
  wire addPostAddMantissa10__22_carry_i_36__1_n_0;
  wire addPostAddMantissa10__22_carry_i_36_n_0;
  wire addPostAddMantissa10__22_carry_i_37__0_n_0;
  wire addPostAddMantissa10__22_carry_i_37_n_0;
  wire addPostAddMantissa10__22_carry_i_38__0_n_0;
  wire addPostAddMantissa10__22_carry_i_38_n_0;
  wire addPostAddMantissa10__22_carry_i_39__0_n_0;
  wire addPostAddMantissa10__22_carry_i_39_n_0;
  wire addPostAddMantissa10__22_carry_i_3__0_n_0;
  wire addPostAddMantissa10__22_carry_i_3__1_n_0;
  wire addPostAddMantissa10__22_carry_i_3_n_0;
  wire addPostAddMantissa10__22_carry_i_40__0_n_0;
  wire addPostAddMantissa10__22_carry_i_40_n_0;
  wire addPostAddMantissa10__22_carry_i_41__0_n_0;
  wire addPostAddMantissa10__22_carry_i_41_n_0;
  wire addPostAddMantissa10__22_carry_i_42__0_n_0;
  wire addPostAddMantissa10__22_carry_i_42_n_0;
  wire addPostAddMantissa10__22_carry_i_43__0_n_0;
  wire addPostAddMantissa10__22_carry_i_43_n_0;
  wire addPostAddMantissa10__22_carry_i_44__0_n_0;
  wire addPostAddMantissa10__22_carry_i_44_n_0;
  wire addPostAddMantissa10__22_carry_i_45__0_n_0;
  wire addPostAddMantissa10__22_carry_i_45_n_0;
  wire addPostAddMantissa10__22_carry_i_46__0_n_0;
  wire addPostAddMantissa10__22_carry_i_46_n_0;
  wire addPostAddMantissa10__22_carry_i_47__0_n_0;
  wire addPostAddMantissa10__22_carry_i_47_n_0;
  wire addPostAddMantissa10__22_carry_i_48__0_n_0;
  wire addPostAddMantissa10__22_carry_i_48_n_0;
  wire addPostAddMantissa10__22_carry_i_49_n_0;
  wire addPostAddMantissa10__22_carry_i_4__0_n_0;
  wire addPostAddMantissa10__22_carry_i_4__1_n_0;
  wire addPostAddMantissa10__22_carry_i_4_n_0;
  wire addPostAddMantissa10__22_carry_i_50_n_0;
  wire addPostAddMantissa10__22_carry_i_51_n_0;
  wire addPostAddMantissa10__22_carry_i_52_n_0;
  wire addPostAddMantissa10__22_carry_i_53_n_0;
  wire addPostAddMantissa10__22_carry_i_54_n_0;
  wire addPostAddMantissa10__22_carry_i_55_n_0;
  wire addPostAddMantissa10__22_carry_i_56_n_0;
  wire addPostAddMantissa10__22_carry_i_57_n_0;
  wire addPostAddMantissa10__22_carry_i_58_n_0;
  wire addPostAddMantissa10__22_carry_i_59_n_0;
  wire addPostAddMantissa10__22_carry_i_5__0_n_0;
  wire addPostAddMantissa10__22_carry_i_5__1_n_0;
  wire addPostAddMantissa10__22_carry_i_5_n_0;
  wire addPostAddMantissa10__22_carry_i_60_n_0;
  wire addPostAddMantissa10__22_carry_i_61_n_0;
  wire addPostAddMantissa10__22_carry_i_62_n_0;
  wire addPostAddMantissa10__22_carry_i_63_n_0;
  wire addPostAddMantissa10__22_carry_i_64_n_0;
  wire addPostAddMantissa10__22_carry_i_65_n_0;
  wire addPostAddMantissa10__22_carry_i_66_n_0;
  wire addPostAddMantissa10__22_carry_i_67_n_0;
  wire addPostAddMantissa10__22_carry_i_68_n_0;
  wire addPostAddMantissa10__22_carry_i_69_n_0;
  wire addPostAddMantissa10__22_carry_i_6__0_n_0;
  wire addPostAddMantissa10__22_carry_i_6__1_n_0;
  wire addPostAddMantissa10__22_carry_i_6_n_0;
  wire addPostAddMantissa10__22_carry_i_70_n_0;
  wire addPostAddMantissa10__22_carry_i_71_n_0;
  wire addPostAddMantissa10__22_carry_i_72_n_0;
  wire addPostAddMantissa10__22_carry_i_73_n_0;
  wire addPostAddMantissa10__22_carry_i_73_n_1;
  wire addPostAddMantissa10__22_carry_i_73_n_2;
  wire addPostAddMantissa10__22_carry_i_73_n_3;
  wire addPostAddMantissa10__22_carry_i_73_n_4;
  wire addPostAddMantissa10__22_carry_i_73_n_5;
  wire addPostAddMantissa10__22_carry_i_73_n_6;
  wire addPostAddMantissa10__22_carry_i_73_n_7;
  wire addPostAddMantissa10__22_carry_i_74_n_0;
  wire addPostAddMantissa10__22_carry_i_75_n_0;
  wire addPostAddMantissa10__22_carry_i_76_n_0;
  wire addPostAddMantissa10__22_carry_i_77_n_0;
  wire addPostAddMantissa10__22_carry_i_78_n_0;
  wire addPostAddMantissa10__22_carry_i_79_n_0;
  wire addPostAddMantissa10__22_carry_i_7__0_n_0;
  wire addPostAddMantissa10__22_carry_i_7__1_n_0;
  wire addPostAddMantissa10__22_carry_i_7_n_0;
  wire addPostAddMantissa10__22_carry_i_80_n_0;
  wire addPostAddMantissa10__22_carry_i_81_n_0;
  wire addPostAddMantissa10__22_carry_i_82_n_0;
  wire addPostAddMantissa10__22_carry_i_83_n_0;
  wire addPostAddMantissa10__22_carry_i_84_n_0;
  wire addPostAddMantissa10__22_carry_i_85_n_0;
  wire addPostAddMantissa10__22_carry_i_86_n_0;
  wire addPostAddMantissa10__22_carry_i_87_n_0;
  wire addPostAddMantissa10__22_carry_i_88_n_0;
  wire addPostAddMantissa10__22_carry_i_89_n_0;
  wire addPostAddMantissa10__22_carry_i_8__0_n_0;
  wire addPostAddMantissa10__22_carry_i_8__1_n_0;
  wire addPostAddMantissa10__22_carry_i_8_n_0;
  wire addPostAddMantissa10__22_carry_i_90_n_0;
  wire addPostAddMantissa10__22_carry_i_91_n_0;
  wire addPostAddMantissa10__22_carry_i_92_n_0;
  wire addPostAddMantissa10__22_carry_i_93_n_0;
  wire addPostAddMantissa10__22_carry_i_9__0_n_0;
  wire addPostAddMantissa10__22_carry_i_9__1_n_0;
  wire addPostAddMantissa10__22_carry_i_9_n_0;
  wire addPostAddMantissa10__22_carry_n_0;
  wire addPostAddMantissa10__22_carry_n_1;
  wire addPostAddMantissa10__22_carry_n_10;
  wire addPostAddMantissa10__22_carry_n_11;
  wire addPostAddMantissa10__22_carry_n_12;
  wire addPostAddMantissa10__22_carry_n_13;
  wire addPostAddMantissa10__22_carry_n_14;
  wire addPostAddMantissa10__22_carry_n_15;
  wire addPostAddMantissa10__22_carry_n_2;
  wire addPostAddMantissa10__22_carry_n_3;
  wire addPostAddMantissa10__22_carry_n_4;
  wire addPostAddMantissa10__22_carry_n_5;
  wire addPostAddMantissa10__22_carry_n_6;
  wire addPostAddMantissa10__22_carry_n_7;
  wire addPostAddMantissa10__22_carry_n_8;
  wire addPostAddMantissa10__22_carry_n_9;
  wire \addPostAddMantissa1_reg_n_0_[0] ;
  wire \addPostAddMantissa1_reg_n_0_[10] ;
  wire \addPostAddMantissa1_reg_n_0_[11] ;
  wire \addPostAddMantissa1_reg_n_0_[12] ;
  wire \addPostAddMantissa1_reg_n_0_[13] ;
  wire \addPostAddMantissa1_reg_n_0_[14] ;
  wire \addPostAddMantissa1_reg_n_0_[15] ;
  wire \addPostAddMantissa1_reg_n_0_[16] ;
  wire \addPostAddMantissa1_reg_n_0_[17] ;
  wire \addPostAddMantissa1_reg_n_0_[18] ;
  wire \addPostAddMantissa1_reg_n_0_[19] ;
  wire \addPostAddMantissa1_reg_n_0_[1] ;
  wire \addPostAddMantissa1_reg_n_0_[20] ;
  wire \addPostAddMantissa1_reg_n_0_[21] ;
  wire \addPostAddMantissa1_reg_n_0_[22] ;
  wire \addPostAddMantissa1_reg_n_0_[23] ;
  wire \addPostAddMantissa1_reg_n_0_[24] ;
  wire \addPostAddMantissa1_reg_n_0_[25] ;
  wire \addPostAddMantissa1_reg_n_0_[2] ;
  wire \addPostAddMantissa1_reg_n_0_[3] ;
  wire \addPostAddMantissa1_reg_n_0_[4] ;
  wire \addPostAddMantissa1_reg_n_0_[5] ;
  wire \addPostAddMantissa1_reg_n_0_[6] ;
  wire \addPostAddMantissa1_reg_n_0_[7] ;
  wire \addPostAddMantissa1_reg_n_0_[8] ;
  wire \addPostAddMantissa1_reg_n_0_[9] ;
  wire \addPostAddMantissa[0]_i_1_n_0 ;
  wire \addPostAddMantissa[10]_i_1_n_0 ;
  wire \addPostAddMantissa[10]_i_2_n_0 ;
  wire \addPostAddMantissa[11]_i_1_n_0 ;
  wire \addPostAddMantissa[11]_i_2_n_0 ;
  wire \addPostAddMantissa[12]_i_1_n_0 ;
  wire \addPostAddMantissa[12]_i_2_n_0 ;
  wire \addPostAddMantissa[13]_i_1_n_0 ;
  wire \addPostAddMantissa[13]_i_2_n_0 ;
  wire \addPostAddMantissa[14]_i_1_n_0 ;
  wire \addPostAddMantissa[14]_i_2_n_0 ;
  wire \addPostAddMantissa[15]_i_1_n_0 ;
  wire \addPostAddMantissa[15]_i_2_n_0 ;
  wire \addPostAddMantissa[16]_i_10_n_0 ;
  wire \addPostAddMantissa[16]_i_11_n_0 ;
  wire \addPostAddMantissa[16]_i_1_n_0 ;
  wire \addPostAddMantissa[16]_i_3_n_0 ;
  wire \addPostAddMantissa[16]_i_4_n_0 ;
  wire \addPostAddMantissa[16]_i_5_n_0 ;
  wire \addPostAddMantissa[16]_i_6_n_0 ;
  wire \addPostAddMantissa[16]_i_7_n_0 ;
  wire \addPostAddMantissa[16]_i_8_n_0 ;
  wire \addPostAddMantissa[16]_i_9_n_0 ;
  wire \addPostAddMantissa[17]_i_1_n_0 ;
  wire \addPostAddMantissa[17]_i_2_n_0 ;
  wire \addPostAddMantissa[18]_i_1_n_0 ;
  wire \addPostAddMantissa[18]_i_2_n_0 ;
  wire \addPostAddMantissa[19]_i_1_n_0 ;
  wire \addPostAddMantissa[19]_i_2_n_0 ;
  wire \addPostAddMantissa[1]_i_1_n_0 ;
  wire \addPostAddMantissa[1]_i_2_n_0 ;
  wire \addPostAddMantissa[20]_i_1_n_0 ;
  wire \addPostAddMantissa[20]_i_2_n_0 ;
  wire \addPostAddMantissa[21]_i_1_n_0 ;
  wire \addPostAddMantissa[21]_i_2_n_0 ;
  wire \addPostAddMantissa[22]_i_1_n_0 ;
  wire \addPostAddMantissa[22]_i_2_n_0 ;
  wire \addPostAddMantissa[2]_i_1_n_0 ;
  wire \addPostAddMantissa[2]_i_2_n_0 ;
  wire \addPostAddMantissa[3]_i_1_n_0 ;
  wire \addPostAddMantissa[3]_i_2_n_0 ;
  wire \addPostAddMantissa[4]_i_1_n_0 ;
  wire \addPostAddMantissa[4]_i_2_n_0 ;
  wire \addPostAddMantissa[5]_i_1_n_0 ;
  wire \addPostAddMantissa[5]_i_2_n_0 ;
  wire \addPostAddMantissa[6]_i_1_n_0 ;
  wire \addPostAddMantissa[6]_i_2_n_0 ;
  wire \addPostAddMantissa[7]_i_1_n_0 ;
  wire \addPostAddMantissa[7]_i_2_n_0 ;
  wire \addPostAddMantissa[8]_i_10_n_0 ;
  wire \addPostAddMantissa[8]_i_11_n_0 ;
  wire \addPostAddMantissa[8]_i_12_n_0 ;
  wire \addPostAddMantissa[8]_i_1_n_0 ;
  wire \addPostAddMantissa[8]_i_3_n_0 ;
  wire \addPostAddMantissa[8]_i_4_n_0 ;
  wire \addPostAddMantissa[8]_i_5_n_0 ;
  wire \addPostAddMantissa[8]_i_6_n_0 ;
  wire \addPostAddMantissa[8]_i_7_n_0 ;
  wire \addPostAddMantissa[8]_i_8_n_0 ;
  wire \addPostAddMantissa[8]_i_9_n_0 ;
  wire \addPostAddMantissa[9]_i_1_n_0 ;
  wire \addPostAddMantissa[9]_i_2_n_0 ;
  wire \addPostAddMantissa_reg[16]_i_2_n_0 ;
  wire \addPostAddMantissa_reg[16]_i_2_n_1 ;
  wire \addPostAddMantissa_reg[16]_i_2_n_2 ;
  wire \addPostAddMantissa_reg[16]_i_2_n_3 ;
  wire \addPostAddMantissa_reg[16]_i_2_n_4 ;
  wire \addPostAddMantissa_reg[16]_i_2_n_5 ;
  wire \addPostAddMantissa_reg[16]_i_2_n_6 ;
  wire \addPostAddMantissa_reg[16]_i_2_n_7 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_0 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_1 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_2 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_3 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_4 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_5 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_6 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_7 ;
  wire \addPostAddMantissa_reg_n_0_[0] ;
  wire \addPostAddMantissa_reg_n_0_[10] ;
  wire \addPostAddMantissa_reg_n_0_[11] ;
  wire \addPostAddMantissa_reg_n_0_[12] ;
  wire \addPostAddMantissa_reg_n_0_[13] ;
  wire \addPostAddMantissa_reg_n_0_[14] ;
  wire \addPostAddMantissa_reg_n_0_[15] ;
  wire \addPostAddMantissa_reg_n_0_[16] ;
  wire \addPostAddMantissa_reg_n_0_[17] ;
  wire \addPostAddMantissa_reg_n_0_[18] ;
  wire \addPostAddMantissa_reg_n_0_[19] ;
  wire \addPostAddMantissa_reg_n_0_[1] ;
  wire \addPostAddMantissa_reg_n_0_[20] ;
  wire \addPostAddMantissa_reg_n_0_[21] ;
  wire \addPostAddMantissa_reg_n_0_[22] ;
  wire \addPostAddMantissa_reg_n_0_[2] ;
  wire \addPostAddMantissa_reg_n_0_[3] ;
  wire \addPostAddMantissa_reg_n_0_[4] ;
  wire \addPostAddMantissa_reg_n_0_[5] ;
  wire \addPostAddMantissa_reg_n_0_[6] ;
  wire \addPostAddMantissa_reg_n_0_[7] ;
  wire \addPostAddMantissa_reg_n_0_[8] ;
  wire \addPostAddMantissa_reg_n_0_[9] ;
  wire \addRenormalizeShiftAmount[0]_i_10_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_11_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_12_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_13_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_1_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_2_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_3_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_4_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_5_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_6_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_7_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_8_n_0 ;
  wire \addRenormalizeShiftAmount[0]_i_9_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_10_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_11_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_12_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_13_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_14_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_1_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_2_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_3_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_4_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_5_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_6_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_7_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_8_n_0 ;
  wire \addRenormalizeShiftAmount[1]_i_9_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_10_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_11_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_12_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_13_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_14_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_15_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_16_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_17_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_18_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_1_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_2_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_3_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_5_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_6_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_7_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_8_n_0 ;
  wire \addRenormalizeShiftAmount[2]_i_9_n_0 ;
  wire \addRenormalizeShiftAmount[3]_i_1_n_0 ;
  wire \addRenormalizeShiftAmount[4]_i_10_n_0 ;
  wire \addRenormalizeShiftAmount[4]_i_11_n_0 ;
  wire \addRenormalizeShiftAmount[4]_i_2_n_0 ;
  wire \addRenormalizeShiftAmount[4]_i_3_n_0 ;
  wire \addRenormalizeShiftAmount[4]_i_4_n_0 ;
  wire \addRenormalizeShiftAmount[4]_i_5_n_0 ;
  wire \addRenormalizeShiftAmount[4]_i_6_n_0 ;
  wire \addRenormalizeShiftAmount[4]_i_7_n_0 ;
  wire \addRenormalizeShiftAmount[4]_i_8_n_0 ;
  wire \addRenormalizeShiftAmount[4]_i_9_n_0 ;
  wire \addRenormalizeShiftAmount_reg[2]_i_4_n_1 ;
  wire \addRenormalizeShiftAmount_reg[2]_i_4_n_2 ;
  wire \addRenormalizeShiftAmount_reg[2]_i_4_n_3 ;
  wire \addRenormalizeShiftAmount_reg[2]_i_4_n_4 ;
  wire \addRenormalizeShiftAmount_reg[2]_i_4_n_5 ;
  wire \addRenormalizeShiftAmount_reg[2]_i_4_n_6 ;
  wire \addRenormalizeShiftAmount_reg[2]_i_4_n_7 ;
  wire addSameNumberDifferentSigns0;
  wire addSameNumberDifferentSigns00;
  wire addSameNumberDifferentSigns00_carry__0_i_1_n_0;
  wire addSameNumberDifferentSigns00_carry__0_i_2_n_0;
  wire addSameNumberDifferentSigns00_carry__0_i_3_n_0;
  wire addSameNumberDifferentSigns00_carry__0_i_4_n_0;
  wire addSameNumberDifferentSigns00_carry__0_i_5_n_0;
  wire addSameNumberDifferentSigns00_carry__0_n_6;
  wire addSameNumberDifferentSigns00_carry__0_n_7;
  wire addSameNumberDifferentSigns00_carry_i_10_n_0;
  wire addSameNumberDifferentSigns00_carry_i_11_n_0;
  wire addSameNumberDifferentSigns00_carry_i_12_n_0;
  wire addSameNumberDifferentSigns00_carry_i_13_n_0;
  wire addSameNumberDifferentSigns00_carry_i_14_n_0;
  wire addSameNumberDifferentSigns00_carry_i_15_n_0;
  wire addSameNumberDifferentSigns00_carry_i_16_n_0;
  wire addSameNumberDifferentSigns00_carry_i_1_n_0;
  wire addSameNumberDifferentSigns00_carry_i_2_n_0;
  wire addSameNumberDifferentSigns00_carry_i_3_n_0;
  wire addSameNumberDifferentSigns00_carry_i_4_n_0;
  wire addSameNumberDifferentSigns00_carry_i_5_n_0;
  wire addSameNumberDifferentSigns00_carry_i_6_n_0;
  wire addSameNumberDifferentSigns00_carry_i_7_n_0;
  wire addSameNumberDifferentSigns00_carry_i_8_n_0;
  wire addSameNumberDifferentSigns00_carry_i_9_n_0;
  wire addSameNumberDifferentSigns00_carry_n_0;
  wire addSameNumberDifferentSigns00_carry_n_1;
  wire addSameNumberDifferentSigns00_carry_n_2;
  wire addSameNumberDifferentSigns00_carry_n_3;
  wire addSameNumberDifferentSigns00_carry_n_4;
  wire addSameNumberDifferentSigns00_carry_n_5;
  wire addSameNumberDifferentSigns00_carry_n_6;
  wire addSameNumberDifferentSigns00_carry_n_7;
  wire addSameNumberDifferentSigns1_i_1_n_0;
  wire addSameNumberDifferentSigns1_reg_n_0;
  wire clk;
  wire comAIsDenormal__6;
  wire comALessThanB;
  wire comALessThanB0_carry__0_n_1;
  wire comALessThanB0_carry__0_n_2;
  wire comALessThanB0_carry__0_n_3;
  wire comALessThanB0_carry__0_n_4;
  wire comALessThanB0_carry__0_n_5;
  wire comALessThanB0_carry__0_n_6;
  wire comALessThanB0_carry__0_n_7;
  wire comALessThanB0_carry_i_10__0_n_0;
  wire comALessThanB0_carry_i_10_n_0;
  wire comALessThanB0_carry_i_11__0_n_0;
  wire comALessThanB0_carry_i_11_n_0;
  wire comALessThanB0_carry_i_12__0_n_0;
  wire comALessThanB0_carry_i_12_n_0;
  wire comALessThanB0_carry_i_13__0_n_0;
  wire comALessThanB0_carry_i_13_n_0;
  wire comALessThanB0_carry_i_14__0_n_0;
  wire comALessThanB0_carry_i_14_n_0;
  wire comALessThanB0_carry_i_15__0_n_0;
  wire comALessThanB0_carry_i_15_n_0;
  wire comALessThanB0_carry_i_16__0_n_0;
  wire comALessThanB0_carry_i_16_n_0;
  wire comALessThanB0_carry_i_1__0_n_0;
  wire comALessThanB0_carry_i_1_n_0;
  wire comALessThanB0_carry_i_2__0_n_0;
  wire comALessThanB0_carry_i_2_n_0;
  wire comALessThanB0_carry_i_3__0_n_0;
  wire comALessThanB0_carry_i_3_n_0;
  wire comALessThanB0_carry_i_4__0_n_0;
  wire comALessThanB0_carry_i_4_n_0;
  wire comALessThanB0_carry_i_5__0_n_0;
  wire comALessThanB0_carry_i_5_n_0;
  wire comALessThanB0_carry_i_6__0_n_0;
  wire comALessThanB0_carry_i_6_n_0;
  wire comALessThanB0_carry_i_7__0_n_0;
  wire comALessThanB0_carry_i_7_n_0;
  wire comALessThanB0_carry_i_8__0_n_0;
  wire comALessThanB0_carry_i_8_n_0;
  wire comALessThanB0_carry_i_9__0_n_0;
  wire comALessThanB0_carry_i_9_n_0;
  wire comALessThanB0_carry_n_0;
  wire comALessThanB0_carry_n_1;
  wire comALessThanB0_carry_n_2;
  wire comALessThanB0_carry_n_3;
  wire comALessThanB0_carry_n_4;
  wire comALessThanB0_carry_n_5;
  wire comALessThanB0_carry_n_6;
  wire comALessThanB0_carry_n_7;
  wire comBIsDenormal__6;
  wire [30:0]data3;
  wire in;
  wire p_0_in;
  wire p_1_in;
  wire [7:1]NLW_addPostAddMantissa10__22_carry__2_CO_UNCONNECTED;
  wire [7:2]NLW_addPostAddMantissa10__22_carry__2_O_UNCONNECTED;
  wire [7:6]NLW_addPostAddMantissa10__22_carry_i_26__1_CO_UNCONNECTED;
  wire [7:6]NLW_addPostAddMantissa10__22_carry_i_26__1_O_UNCONNECTED;
  wire [7:7]\NLW_addRenormalizeShiftAmount_reg[2]_i_4_CO_UNCONNECTED ;
  wire [7:0]NLW_addSameNumberDifferentSigns00_carry_O_UNCONNECTED;
  wire [7:3]NLW_addSameNumberDifferentSigns00_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_addSameNumberDifferentSigns00_carry__0_O_UNCONNECTED;
  wire [7:0]NLW_comALessThanB0_carry_O_UNCONNECTED;
  wire [7:0]NLW_comALessThanB0_carry__0_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hAAAA0000AAAAC000)) 
    \OADD[0]_i_1 
       (.I0(OADD_Temp[0]),
        .I1(\OADD[2]_i_3_n_0 ),
        .I2(\addPostAddMantissa_reg_n_0_[0] ),
        .I3(\OADD[0]_i_2_n_0 ),
        .I4(addEarlyOutBypassEnable2_reg_n_0),
        .I5(R[0]),
        .O(\OADD[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \OADD[0]_i_2 
       (.I0(R[4]),
        .I1(R[3]),
        .O(\OADD[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[10]_i_1 
       (.I0(R[0]),
        .I1(\OADD[11]_i_2_n_0 ),
        .I2(\OADD[10]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[10]),
        .O(\OADD[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \OADD[10]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[3] ),
        .I1(R[2]),
        .I2(\OADD[0]_i_2_n_0 ),
        .I3(\addPostAddMantissa_reg_n_0_[7] ),
        .I4(R[1]),
        .I5(\OADD[12]_i_3_n_0 ),
        .O(\OADD[10]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[11]_i_1 
       (.I0(R[0]),
        .I1(\OADD[12]_i_2_n_0 ),
        .I2(\OADD[11]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[11]),
        .O(\OADD[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[11]_i_2 
       (.I0(\OADD[11]_i_3_n_0 ),
        .I1(R[1]),
        .I2(\OADD[13]_i_3_n_0 ),
        .O(\OADD[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000030300000BB88)) 
    \OADD[11]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[4] ),
        .I1(R[2]),
        .I2(\addPostAddMantissa_reg_n_0_[0] ),
        .I3(\addPostAddMantissa_reg_n_0_[8] ),
        .I4(R[4]),
        .I5(R[3]),
        .O(\OADD[11]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[12]_i_1 
       (.I0(R[0]),
        .I1(\OADD[13]_i_2_n_0 ),
        .I2(\OADD[12]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[12]),
        .O(\OADD[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[12]_i_2 
       (.I0(\OADD[12]_i_3_n_0 ),
        .I1(R[1]),
        .I2(\OADD[14]_i_3_n_0 ),
        .O(\OADD[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000030300000BB88)) 
    \OADD[12]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[5] ),
        .I1(R[2]),
        .I2(\addPostAddMantissa_reg_n_0_[1] ),
        .I3(\addPostAddMantissa_reg_n_0_[9] ),
        .I4(R[4]),
        .I5(R[3]),
        .O(\OADD[12]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[13]_i_1 
       (.I0(R[0]),
        .I1(\OADD[14]_i_2_n_0 ),
        .I2(\OADD[13]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[13]),
        .O(\OADD[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[13]_i_2 
       (.I0(\OADD[13]_i_3_n_0 ),
        .I1(R[1]),
        .I2(\OADD[15]_i_3_n_0 ),
        .O(\OADD[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000030300000BB88)) 
    \OADD[13]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[6] ),
        .I1(R[2]),
        .I2(\addPostAddMantissa_reg_n_0_[2] ),
        .I3(\addPostAddMantissa_reg_n_0_[10] ),
        .I4(R[4]),
        .I5(R[3]),
        .O(\OADD[13]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[14]_i_1 
       (.I0(R[0]),
        .I1(\OADD[15]_i_2_n_0 ),
        .I2(\OADD[14]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[14]),
        .O(\OADD[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[14]_i_2 
       (.I0(\OADD[14]_i_3_n_0 ),
        .I1(R[1]),
        .I2(\OADD[16]_i_3_n_0 ),
        .O(\OADD[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000030300000BB88)) 
    \OADD[14]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[7] ),
        .I1(R[2]),
        .I2(\addPostAddMantissa_reg_n_0_[3] ),
        .I3(\addPostAddMantissa_reg_n_0_[11] ),
        .I4(R[4]),
        .I5(R[3]),
        .O(\OADD[14]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[15]_i_1 
       (.I0(R[0]),
        .I1(\OADD[16]_i_2_n_0 ),
        .I2(\OADD[15]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[15]),
        .O(\OADD[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[15]_i_2 
       (.I0(\OADD[15]_i_3_n_0 ),
        .I1(R[1]),
        .I2(\OADD[17]_i_3_n_0 ),
        .O(\OADD[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[15]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[0] ),
        .I1(\addPostAddMantissa_reg_n_0_[8] ),
        .I2(R[4]),
        .I3(R[3]),
        .I4(R[2]),
        .I5(\OADD[15]_i_4_n_0 ),
        .O(\OADD[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h0A0C)) 
    \OADD[15]_i_4 
       (.I0(\addPostAddMantissa_reg_n_0_[4] ),
        .I1(\addPostAddMantissa_reg_n_0_[12] ),
        .I2(R[4]),
        .I3(R[3]),
        .O(\OADD[15]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[16]_i_1 
       (.I0(R[0]),
        .I1(\OADD[17]_i_2_n_0 ),
        .I2(\OADD[16]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[16]),
        .O(\OADD[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[16]_i_2 
       (.I0(\OADD[16]_i_3_n_0 ),
        .I1(R[1]),
        .I2(\OADD[18]_i_3_n_0 ),
        .O(\OADD[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[16]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[1] ),
        .I1(\addPostAddMantissa_reg_n_0_[9] ),
        .I2(R[4]),
        .I3(R[3]),
        .I4(R[2]),
        .I5(\OADD[16]_i_4_n_0 ),
        .O(\OADD[16]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h0A0C)) 
    \OADD[16]_i_4 
       (.I0(\addPostAddMantissa_reg_n_0_[5] ),
        .I1(\addPostAddMantissa_reg_n_0_[13] ),
        .I2(R[4]),
        .I3(R[3]),
        .O(\OADD[16]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[17]_i_1 
       (.I0(R[0]),
        .I1(\OADD[18]_i_2_n_0 ),
        .I2(\OADD[17]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[17]),
        .O(\OADD[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[17]_i_2 
       (.I0(\OADD[17]_i_3_n_0 ),
        .I1(R[1]),
        .I2(\OADD[19]_i_3_n_0 ),
        .O(\OADD[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[17]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[2] ),
        .I1(\addPostAddMantissa_reg_n_0_[10] ),
        .I2(R[4]),
        .I3(R[3]),
        .I4(R[2]),
        .I5(\OADD[17]_i_4_n_0 ),
        .O(\OADD[17]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h0A0C)) 
    \OADD[17]_i_4 
       (.I0(\addPostAddMantissa_reg_n_0_[6] ),
        .I1(\addPostAddMantissa_reg_n_0_[14] ),
        .I2(R[4]),
        .I3(R[3]),
        .O(\OADD[17]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[18]_i_1 
       (.I0(R[0]),
        .I1(\OADD[19]_i_2_n_0 ),
        .I2(\OADD[18]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[18]),
        .O(\OADD[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[18]_i_2 
       (.I0(\OADD[18]_i_3_n_0 ),
        .I1(R[1]),
        .I2(\OADD[20]_i_3_n_0 ),
        .O(\OADD[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[18]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[3] ),
        .I1(\addPostAddMantissa_reg_n_0_[11] ),
        .I2(R[4]),
        .I3(R[3]),
        .I4(R[2]),
        .I5(\OADD[18]_i_4_n_0 ),
        .O(\OADD[18]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \OADD[18]_i_4 
       (.I0(\addPostAddMantissa_reg_n_0_[7] ),
        .I1(\addPostAddMantissa_reg_n_0_[15] ),
        .I2(R[4]),
        .I3(R[3]),
        .O(\OADD[18]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[19]_i_1 
       (.I0(R[0]),
        .I1(\OADD[20]_i_2_n_0 ),
        .I2(\OADD[19]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[19]),
        .O(\OADD[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[19]_i_2 
       (.I0(\OADD[19]_i_3_n_0 ),
        .I1(R[1]),
        .I2(\OADD[21]_i_3_n_0 ),
        .O(\OADD[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[19]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[4] ),
        .I1(\addPostAddMantissa_reg_n_0_[12] ),
        .I2(R[4]),
        .I3(R[3]),
        .I4(R[2]),
        .I5(\OADD[22]_i_4_n_0 ),
        .O(\OADD[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFE0400000E040)) 
    \OADD[1]_i_1 
       (.I0(R[0]),
        .I1(\OADD[2]_i_2_n_0 ),
        .I2(\OADD[2]_i_3_n_0 ),
        .I3(\OADD[1]_i_2_n_0 ),
        .I4(addEarlyOutBypassEnable2_reg_n_0),
        .I5(OADD_Temp[1]),
        .O(\OADD[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \OADD[1]_i_2 
       (.I0(R[3]),
        .I1(R[4]),
        .I2(\addPostAddMantissa_reg_n_0_[0] ),
        .O(\OADD[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[20]_i_1 
       (.I0(R[0]),
        .I1(\OADD[21]_i_2_n_0 ),
        .I2(\OADD[20]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[20]),
        .O(\OADD[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[20]_i_2 
       (.I0(\OADD[20]_i_3_n_0 ),
        .I1(R[1]),
        .I2(\OADD[22]_i_10_n_0 ),
        .O(\OADD[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[20]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[5] ),
        .I1(\addPostAddMantissa_reg_n_0_[13] ),
        .I2(R[4]),
        .I3(R[3]),
        .I4(R[2]),
        .I5(\OADD[22]_i_9_n_0 ),
        .O(\OADD[20]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[21]_i_1 
       (.I0(R[0]),
        .I1(\OADD[22]_i_3_n_0 ),
        .I2(\OADD[21]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[21]),
        .O(\OADD[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    \OADD[21]_i_2 
       (.I0(\OADD[22]_i_4_n_0 ),
        .I1(R[2]),
        .I2(\OADD[22]_i_5_n_0 ),
        .I3(\OADD[21]_i_3_n_0 ),
        .I4(R[1]),
        .O(\OADD[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[21]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[6] ),
        .I1(\addPostAddMantissa_reg_n_0_[14] ),
        .I2(R[4]),
        .I3(R[3]),
        .I4(R[2]),
        .I5(\OADD[22]_i_7_n_0 ),
        .O(\OADD[21]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[22]_i_1 
       (.I0(R[0]),
        .I1(\OADD[22]_i_2_n_0 ),
        .I2(\OADD[22]_i_3_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[22]),
        .O(\OADD[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[22]_i_10 
       (.I0(\addPostAddMantissa_reg_n_0_[7] ),
        .I1(\addPostAddMantissa_reg_n_0_[15] ),
        .I2(R[4]),
        .I3(R[3]),
        .I4(R[2]),
        .I5(\OADD[22]_i_11_n_0 ),
        .O(\OADD[22]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_11 
       (.I0(\addPostAddMantissa_reg_n_0_[19] ),
        .I1(\addPostAddMantissa_reg_n_0_[11] ),
        .I2(\addPostAddMantissa_reg_n_0_[3] ),
        .I3(R[4]),
        .I4(R[3]),
        .O(\OADD[22]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8FFCC3300)) 
    \OADD[22]_i_2 
       (.I0(\OADD[22]_i_4_n_0 ),
        .I1(R[2]),
        .I2(\OADD[22]_i_5_n_0 ),
        .I3(\OADD[22]_i_6_n_0 ),
        .I4(\OADD[22]_i_7_n_0 ),
        .I5(R[1]),
        .O(\OADD[22]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[22]_i_3 
       (.I0(R[2]),
        .I1(\OADD[22]_i_8_n_0 ),
        .I2(\OADD[22]_i_9_n_0 ),
        .I3(R[1]),
        .I4(\OADD[22]_i_10_n_0 ),
        .O(\OADD[22]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_4 
       (.I0(\addPostAddMantissa_reg_n_0_[16] ),
        .I1(\addPostAddMantissa_reg_n_0_[8] ),
        .I2(\addPostAddMantissa_reg_n_0_[0] ),
        .I3(R[4]),
        .I4(R[3]),
        .O(\OADD[22]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_5 
       (.I0(\addPostAddMantissa_reg_n_0_[20] ),
        .I1(\addPostAddMantissa_reg_n_0_[12] ),
        .I2(\addPostAddMantissa_reg_n_0_[4] ),
        .I3(R[4]),
        .I4(R[3]),
        .O(\OADD[22]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_6 
       (.I0(\addPostAddMantissa_reg_n_0_[22] ),
        .I1(\addPostAddMantissa_reg_n_0_[14] ),
        .I2(\addPostAddMantissa_reg_n_0_[6] ),
        .I3(R[4]),
        .I4(R[3]),
        .O(\OADD[22]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_7 
       (.I0(\addPostAddMantissa_reg_n_0_[18] ),
        .I1(\addPostAddMantissa_reg_n_0_[10] ),
        .I2(\addPostAddMantissa_reg_n_0_[2] ),
        .I3(R[4]),
        .I4(R[3]),
        .O(\OADD[22]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_8 
       (.I0(\addPostAddMantissa_reg_n_0_[21] ),
        .I1(\addPostAddMantissa_reg_n_0_[13] ),
        .I2(\addPostAddMantissa_reg_n_0_[5] ),
        .I3(R[4]),
        .I4(R[3]),
        .O(\OADD[22]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_9 
       (.I0(\addPostAddMantissa_reg_n_0_[17] ),
        .I1(\addPostAddMantissa_reg_n_0_[9] ),
        .I2(\addPostAddMantissa_reg_n_0_[1] ),
        .I3(R[4]),
        .I4(R[3]),
        .O(\OADD[22]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hF909)) 
    \OADD[23]_i_1 
       (.I0(R[0]),
        .I1(addFinalExp[0]),
        .I2(addEarlyOutBypassEnable2_reg_n_0),
        .I3(OADD_Temp[23]),
        .O(\OADD[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF969900009699)) 
    \OADD[24]_i_1 
       (.I0(addFinalExp[1]),
        .I1(R[1]),
        .I2(R[0]),
        .I3(addFinalExp[0]),
        .I4(addEarlyOutBypassEnable2_reg_n_0),
        .I5(OADD_Temp[24]),
        .O(\OADD[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF690069)) 
    \OADD[25]_i_1 
       (.I0(addFinalExp[2]),
        .I1(R[2]),
        .I2(\OADD[25]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[25]),
        .O(\OADD[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    \OADD[25]_i_2 
       (.I0(addFinalExp[0]),
        .I1(R[0]),
        .I2(R[1]),
        .I3(addFinalExp[1]),
        .O(\OADD[25]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'hFF690069)) 
    \OADD[26]_i_1 
       (.I0(addFinalExp[3]),
        .I1(R[3]),
        .I2(\OADD[26]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[26]),
        .O(\OADD[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02)) 
    \OADD[26]_i_2 
       (.I0(addFinalExp[0]),
        .I1(R[0]),
        .I2(R[1]),
        .I3(addFinalExp[1]),
        .I4(R[2]),
        .I5(addFinalExp[2]),
        .O(\OADD[26]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFF690069)) 
    \OADD[27]_i_1 
       (.I0(addFinalExp[4]),
        .I1(R[4]),
        .I2(\OADD[27]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[27]),
        .O(\OADD[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    \OADD[27]_i_2 
       (.I0(\OADD[26]_i_2_n_0 ),
        .I1(R[3]),
        .I2(addFinalExp[3]),
        .O(\OADD[27]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF909)) 
    \OADD[28]_i_1 
       (.I0(addFinalExp[5]),
        .I1(\OADD[28]_i_2_n_0 ),
        .I2(addEarlyOutBypassEnable2_reg_n_0),
        .I3(OADD_Temp[28]),
        .O(\OADD[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'hB2FF00B2)) 
    \OADD[28]_i_2 
       (.I0(\OADD[26]_i_2_n_0 ),
        .I1(R[3]),
        .I2(addFinalExp[3]),
        .I3(R[4]),
        .I4(addFinalExp[4]),
        .O(\OADD[28]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hF909)) 
    \OADD[29]_i_1 
       (.I0(addFinalExp[6]),
        .I1(\OADD[30]_i_2_n_0 ),
        .I2(addEarlyOutBypassEnable2_reg_n_0),
        .I3(OADD_Temp[29]),
        .O(\OADD[29]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFE4440000E444)) 
    \OADD[2]_i_1 
       (.I0(R[0]),
        .I1(\OADD[3]_i_2_n_0 ),
        .I2(\OADD[2]_i_2_n_0 ),
        .I3(\OADD[2]_i_3_n_0 ),
        .I4(addEarlyOutBypassEnable2_reg_n_0),
        .I5(OADD_Temp[2]),
        .O(\OADD[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \OADD[2]_i_2 
       (.I0(R[3]),
        .I1(R[4]),
        .I2(\addPostAddMantissa_reg_n_0_[1] ),
        .O(\OADD[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \OADD[2]_i_3 
       (.I0(R[2]),
        .I1(R[1]),
        .O(\OADD[2]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFF560056)) 
    \OADD[30]_i_1 
       (.I0(addFinalExp[7]),
        .I1(addFinalExp[6]),
        .I2(\OADD[30]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[30]),
        .O(\OADD[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFB2BB22B2)) 
    \OADD[30]_i_2 
       (.I0(addFinalExp[4]),
        .I1(R[4]),
        .I2(addFinalExp[3]),
        .I3(R[3]),
        .I4(\OADD[26]_i_2_n_0 ),
        .I5(addFinalExp[5]),
        .O(\OADD[30]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0008080000000000)) 
    \OADD[31]_i_1 
       (.I0(addFinalExp[7]),
        .I1(addPipelineValidStage2),
        .I2(addEarlyOutBypassEnable2_reg_n_0),
        .I3(addFinalExp[6]),
        .I4(\OADD[31]_i_3_n_0 ),
        .I5(\OADD[31]_i_4_n_0 ),
        .O(\OADD[31]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[31]_i_2 
       (.I0(OADD_Temp[31]),
        .I1(addEarlyOutBypassEnable2_reg_n_0),
        .I2(addFinalSignIsNeg_reg_n_0),
        .O(\OADD[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFB2BB22B2)) 
    \OADD[31]_i_3 
       (.I0(addFinalExp[4]),
        .I1(R[4]),
        .I2(addFinalExp[3]),
        .I3(R[3]),
        .I4(\OADD[31]_i_5_n_0 ),
        .I5(addFinalExp[5]),
        .O(\OADD[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00208208)) 
    \OADD[31]_i_4 
       (.I0(\OADD[31]_i_6_n_0 ),
        .I1(\OADD[31]_i_7_n_0 ),
        .I2(R[4]),
        .I3(addFinalExp[4]),
        .I4(addFinalExp[5]),
        .O(\OADD[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hBF0BFFFF0000BF0B)) 
    \OADD[31]_i_5 
       (.I0(addFinalExp[0]),
        .I1(R[0]),
        .I2(R[1]),
        .I3(addFinalExp[1]),
        .I4(R[2]),
        .I5(addFinalExp[2]),
        .O(\OADD[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h9204009200000400)) 
    \OADD[31]_i_6 
       (.I0(\OADD[31]_i_8_n_0 ),
        .I1(R[1]),
        .I2(addFinalExp[1]),
        .I3(R[2]),
        .I4(addFinalExp[2]),
        .I5(\OADD[31]_i_9_n_0 ),
        .O(\OADD[31]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB2)) 
    \OADD[31]_i_7 
       (.I0(\OADD[31]_i_5_n_0 ),
        .I1(R[3]),
        .I2(addFinalExp[3]),
        .O(\OADD[31]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \OADD[31]_i_8 
       (.I0(addFinalExp[0]),
        .I1(R[0]),
        .O(\OADD[31]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \OADD[31]_i_9 
       (.I0(addFinalExp[3]),
        .I1(R[3]),
        .O(\OADD[31]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[3]_i_1 
       (.I0(R[0]),
        .I1(\OADD[4]_i_2_n_0 ),
        .I2(\OADD[3]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[3]),
        .O(\OADD[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020200000300)) 
    \OADD[3]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[0] ),
        .I1(R[3]),
        .I2(R[4]),
        .I3(\addPostAddMantissa_reg_n_0_[2] ),
        .I4(R[2]),
        .I5(R[1]),
        .O(\OADD[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[4]_i_1 
       (.I0(R[0]),
        .I1(\OADD[5]_i_2_n_0 ),
        .I2(\OADD[4]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[4]),
        .O(\OADD[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020200000300)) 
    \OADD[4]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[1] ),
        .I1(R[3]),
        .I2(R[4]),
        .I3(\addPostAddMantissa_reg_n_0_[3] ),
        .I4(R[2]),
        .I5(R[1]),
        .O(\OADD[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[5]_i_1 
       (.I0(R[0]),
        .I1(\OADD[6]_i_2_n_0 ),
        .I2(\OADD[5]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[5]),
        .O(\OADD[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h30BB000030880000)) 
    \OADD[5]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[2] ),
        .I1(R[1]),
        .I2(\addPostAddMantissa_reg_n_0_[0] ),
        .I3(R[2]),
        .I4(\OADD[0]_i_2_n_0 ),
        .I5(\addPostAddMantissa_reg_n_0_[4] ),
        .O(\OADD[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCCCCF0AA)) 
    \OADD[6]_i_1 
       (.I0(\OADD[7]_i_2_n_0 ),
        .I1(OADD_Temp[6]),
        .I2(\OADD[6]_i_2_n_0 ),
        .I3(R[0]),
        .I4(addEarlyOutBypassEnable2_reg_n_0),
        .O(\OADD[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h30BB000030880000)) 
    \OADD[6]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[3] ),
        .I1(R[1]),
        .I2(\addPostAddMantissa_reg_n_0_[1] ),
        .I3(R[2]),
        .I4(\OADD[0]_i_2_n_0 ),
        .I5(\addPostAddMantissa_reg_n_0_[5] ),
        .O(\OADD[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[7]_i_1 
       (.I0(R[0]),
        .I1(\OADD[8]_i_2_n_0 ),
        .I2(\OADD[7]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[7]),
        .O(\OADD[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \OADD[7]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[0] ),
        .I1(R[2]),
        .I2(\OADD[0]_i_2_n_0 ),
        .I3(\addPostAddMantissa_reg_n_0_[4] ),
        .I4(R[1]),
        .I5(\OADD[7]_i_3_n_0 ),
        .O(\OADD[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h000B0008)) 
    \OADD[7]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[2] ),
        .I1(R[2]),
        .I2(R[3]),
        .I3(R[4]),
        .I4(\addPostAddMantissa_reg_n_0_[6] ),
        .O(\OADD[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[8]_i_1 
       (.I0(R[0]),
        .I1(\OADD[9]_i_2_n_0 ),
        .I2(\OADD[8]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[8]),
        .O(\OADD[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \OADD[8]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[1] ),
        .I1(R[2]),
        .I2(\OADD[0]_i_2_n_0 ),
        .I3(\addPostAddMantissa_reg_n_0_[5] ),
        .I4(R[1]),
        .I5(\OADD[8]_i_3_n_0 ),
        .O(\OADD[8]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h000B0008)) 
    \OADD[8]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[3] ),
        .I1(R[2]),
        .I2(R[3]),
        .I3(R[4]),
        .I4(\addPostAddMantissa_reg_n_0_[7] ),
        .O(\OADD[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[9]_i_1 
       (.I0(R[0]),
        .I1(\OADD[10]_i_2_n_0 ),
        .I2(\OADD[9]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[9]),
        .O(\OADD[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \OADD[9]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[2] ),
        .I1(R[2]),
        .I2(\OADD[0]_i_2_n_0 ),
        .I3(\addPostAddMantissa_reg_n_0_[6] ),
        .I4(R[1]),
        .I5(\OADD[11]_i_3_n_0 ),
        .O(\OADD[9]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \OADD_Temp[22]_i_1 
       (.I0(\OADD_Temp[22]_i_2_n_0 ),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .O(\OADD_Temp[22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFD00)) 
    \OADD_Temp[22]_i_2 
       (.I0(\addRenormalizeShiftAmount[4]_i_3_n_0 ),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .I2(addSameNumberDifferentSigns1_reg_n_0),
        .I3(addPipelineValidStage1),
        .O(\OADD_Temp[22]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hD1)) 
    \OADD_Temp[23]_i_1 
       (.I0(addSameNumberDifferentSigns1_reg_n_0),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .I2(addEarlyOutBypass1[23]),
        .O(\OADD_Temp[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hD1)) 
    \OADD_Temp[24]_i_1 
       (.I0(addSameNumberDifferentSigns1_reg_n_0),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .I2(addEarlyOutBypass1[24]),
        .O(\OADD_Temp[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hD1)) 
    \OADD_Temp[25]_i_1 
       (.I0(addSameNumberDifferentSigns1_reg_n_0),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .I2(addEarlyOutBypass1[25]),
        .O(\OADD_Temp[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hD1)) 
    \OADD_Temp[26]_i_1 
       (.I0(addSameNumberDifferentSigns1_reg_n_0),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .I2(addEarlyOutBypass1[26]),
        .O(\OADD_Temp[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hD1)) 
    \OADD_Temp[27]_i_1 
       (.I0(addSameNumberDifferentSigns1_reg_n_0),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .I2(addEarlyOutBypass1[27]),
        .O(\OADD_Temp[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hD1)) 
    \OADD_Temp[28]_i_1 
       (.I0(addSameNumberDifferentSigns1_reg_n_0),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .I2(addEarlyOutBypass1[28]),
        .O(\OADD_Temp[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hD1)) 
    \OADD_Temp[29]_i_1 
       (.I0(addSameNumberDifferentSigns1_reg_n_0),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .I2(addEarlyOutBypass1[29]),
        .O(\OADD_Temp[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hD1)) 
    \OADD_Temp[30]_i_1 
       (.I0(addSameNumberDifferentSigns1_reg_n_0),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .I2(addEarlyOutBypass1[30]),
        .O(\OADD_Temp[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8B88FFFF8B880000)) 
    \OADD_Temp[31]_i_1 
       (.I0(addEarlyOutBypass1[31]),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .I2(addSameNumberDifferentSigns1_reg_n_0),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .I4(\OADD_Temp[22]_i_2_n_0 ),
        .I5(OADD_Temp[31]),
        .O(\OADD_Temp[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[0] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[0]),
        .Q(OADD_Temp[0]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[10] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[10]),
        .Q(OADD_Temp[10]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[11] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[11]),
        .Q(OADD_Temp[11]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[12] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[12]),
        .Q(OADD_Temp[12]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[13] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[13]),
        .Q(OADD_Temp[13]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[14] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[14]),
        .Q(OADD_Temp[14]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[15] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[15]),
        .Q(OADD_Temp[15]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[16] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[16]),
        .Q(OADD_Temp[16]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[17] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[17]),
        .Q(OADD_Temp[17]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[18] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[18]),
        .Q(OADD_Temp[18]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[19] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[19]),
        .Q(OADD_Temp[19]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[1] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[1]),
        .Q(OADD_Temp[1]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[20] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[20]),
        .Q(OADD_Temp[20]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[21] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[21]),
        .Q(OADD_Temp[21]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[22] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[22]),
        .Q(OADD_Temp[22]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[23] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[23]_i_1_n_0 ),
        .Q(OADD_Temp[23]),
        .S(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[24] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[24]_i_1_n_0 ),
        .Q(OADD_Temp[24]),
        .S(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[25] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[25]_i_1_n_0 ),
        .Q(OADD_Temp[25]),
        .S(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[26] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[26]_i_1_n_0 ),
        .Q(OADD_Temp[26]),
        .S(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[27] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[27]_i_1_n_0 ),
        .Q(OADD_Temp[27]),
        .S(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[28] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[28]_i_1_n_0 ),
        .Q(OADD_Temp[28]),
        .S(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[29] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[29]_i_1_n_0 ),
        .Q(OADD_Temp[29]),
        .S(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[2] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[2]),
        .Q(OADD_Temp[2]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[30] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[30]_i_1_n_0 ),
        .Q(OADD_Temp[30]),
        .S(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\OADD_Temp[31]_i_1_n_0 ),
        .Q(OADD_Temp[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[3] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[3]),
        .Q(OADD_Temp[3]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[4] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[4]),
        .Q(OADD_Temp[4]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[5] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[5]),
        .Q(OADD_Temp[5]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[6] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[6]),
        .Q(OADD_Temp[6]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[7] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[7]),
        .Q(OADD_Temp[7]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[8] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[8]),
        .Q(OADD_Temp[8]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[9] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(addEarlyOutBypass1[9]),
        .Q(OADD_Temp[9]),
        .R(\OADD_Temp[22]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[0] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[0]_i_1_n_0 ),
        .Q(OADD[0]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[10] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[10]_i_1_n_0 ),
        .Q(OADD[10]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[11] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[11]_i_1_n_0 ),
        .Q(OADD[11]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[12] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[12]_i_1_n_0 ),
        .Q(OADD[12]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[13] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[13]_i_1_n_0 ),
        .Q(OADD[13]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[14] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[14]_i_1_n_0 ),
        .Q(OADD[14]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[15] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[15]_i_1_n_0 ),
        .Q(OADD[15]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[16] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[16]_i_1_n_0 ),
        .Q(OADD[16]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[17] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[17]_i_1_n_0 ),
        .Q(OADD[17]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[18] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[18]_i_1_n_0 ),
        .Q(OADD[18]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[19] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[19]_i_1_n_0 ),
        .Q(OADD[19]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[1] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[1]_i_1_n_0 ),
        .Q(OADD[1]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[20] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[20]_i_1_n_0 ),
        .Q(OADD[20]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[21] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[21]_i_1_n_0 ),
        .Q(OADD[21]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[22] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[22]_i_1_n_0 ),
        .Q(OADD[22]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[23] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[23]_i_1_n_0 ),
        .Q(OADD[23]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[24] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[24]_i_1_n_0 ),
        .Q(OADD[24]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[25] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[25]_i_1_n_0 ),
        .Q(OADD[25]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[26] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[26]_i_1_n_0 ),
        .Q(OADD[26]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[27] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[27]_i_1_n_0 ),
        .Q(OADD[27]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[28] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[28]_i_1_n_0 ),
        .Q(OADD[28]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[29] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[29]_i_1_n_0 ),
        .Q(OADD[29]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[2] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[2]_i_1_n_0 ),
        .Q(OADD[2]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[30] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[30]_i_1_n_0 ),
        .Q(OADD[30]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[31] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[31]_i_2_n_0 ),
        .Q(OADD[31]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[3] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[3]_i_1_n_0 ),
        .Q(OADD[3]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[4] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[4]_i_1_n_0 ),
        .Q(OADD[4]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[5] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[5]_i_1_n_0 ),
        .Q(OADD[5]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[6] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[6]_i_1_n_0 ),
        .Q(OADD[6]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[7] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[7]_i_1_n_0 ),
        .Q(OADD[7]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[8] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[8]_i_1_n_0 ),
        .Q(OADD[8]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \OADD_reg[9] 
       (.C(clk),
        .CE(addPipelineValidStage2),
        .D(\OADD[9]_i_1_n_0 ),
        .Q(OADD[9]),
        .R(\OADD[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    addALessThanB_reg
       (.C(clk),
        .CE(IADD_GO),
        .D(comALessThanB),
        .Q(addALessThanB),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \addDenormFlushedValA[30]_i_1 
       (.I0(comAIsDenormal__6),
        .I1(IADD_GO),
        .O(\addDenormFlushedValA[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \addDenormFlushedValA[30]_i_2 
       (.I0(IN_A[27]),
        .I1(IN_A[30]),
        .I2(IN_A[28]),
        .I3(IN_A[29]),
        .I4(\addDenormFlushedValA[30]_i_3_n_0 ),
        .O(comAIsDenormal__6));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \addDenormFlushedValA[30]_i_3 
       (.I0(IN_A[24]),
        .I1(IN_A[23]),
        .I2(IN_A[26]),
        .I3(IN_A[25]),
        .O(\addDenormFlushedValA[30]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[0] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[0]),
        .Q(\addDenormFlushedValA_reg_n_0_[0] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[10] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[10]),
        .Q(\addDenormFlushedValA_reg_n_0_[10] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[11] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[11]),
        .Q(\addDenormFlushedValA_reg_n_0_[11] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[12] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[12]),
        .Q(\addDenormFlushedValA_reg_n_0_[12] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[13] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[13]),
        .Q(\addDenormFlushedValA_reg_n_0_[13] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[14] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[14]),
        .Q(\addDenormFlushedValA_reg_n_0_[14] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[15] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[15]),
        .Q(\addDenormFlushedValA_reg_n_0_[15] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[16] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[16]),
        .Q(\addDenormFlushedValA_reg_n_0_[16] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[17] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[17]),
        .Q(\addDenormFlushedValA_reg_n_0_[17] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[18] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[18]),
        .Q(\addDenormFlushedValA_reg_n_0_[18] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[19] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[19]),
        .Q(\addDenormFlushedValA_reg_n_0_[19] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[1] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[1]),
        .Q(\addDenormFlushedValA_reg_n_0_[1] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[20] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[20]),
        .Q(\addDenormFlushedValA_reg_n_0_[20] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[21] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[21]),
        .Q(\addDenormFlushedValA_reg_n_0_[21] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[22] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[22]),
        .Q(\addDenormFlushedValA_reg_n_0_[22] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[23] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[23]),
        .Q(\addDenormFlushedValA_reg_n_0_[23] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[24] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[24]),
        .Q(\addDenormFlushedValA_reg_n_0_[24] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[25] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[25]),
        .Q(\addDenormFlushedValA_reg_n_0_[25] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[26] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[26]),
        .Q(\addDenormFlushedValA_reg_n_0_[26] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[27] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[27]),
        .Q(\addDenormFlushedValA_reg_n_0_[27] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[28] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[28]),
        .Q(\addDenormFlushedValA_reg_n_0_[28] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[29] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[29]),
        .Q(\addDenormFlushedValA_reg_n_0_[29] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[2] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[2]),
        .Q(\addDenormFlushedValA_reg_n_0_[2] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[30] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[30]),
        .Q(\addDenormFlushedValA_reg_n_0_[30] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[31] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[31]),
        .Q(p_1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[3] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[3]),
        .Q(\addDenormFlushedValA_reg_n_0_[3] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[4] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[4]),
        .Q(\addDenormFlushedValA_reg_n_0_[4] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[5] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[5]),
        .Q(\addDenormFlushedValA_reg_n_0_[5] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[6] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[6]),
        .Q(\addDenormFlushedValA_reg_n_0_[6] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[7] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[7]),
        .Q(\addDenormFlushedValA_reg_n_0_[7] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[8] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[8]),
        .Q(\addDenormFlushedValA_reg_n_0_[8] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[9] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[9]),
        .Q(\addDenormFlushedValA_reg_n_0_[9] ),
        .R(\addDenormFlushedValA[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[0]_i_1 
       (.I0(IN_B[0]),
        .I1(comBIsDenormal__6),
        .O(data3[0]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[10]_i_1 
       (.I0(IN_B[10]),
        .I1(comBIsDenormal__6),
        .O(data3[10]));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[11]_i_1 
       (.I0(IN_B[11]),
        .I1(comBIsDenormal__6),
        .O(data3[11]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[12]_i_1 
       (.I0(IN_B[12]),
        .I1(comBIsDenormal__6),
        .O(data3[12]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[13]_i_1 
       (.I0(IN_B[13]),
        .I1(comBIsDenormal__6),
        .O(data3[13]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[14]_i_1 
       (.I0(IN_B[14]),
        .I1(comBIsDenormal__6),
        .O(data3[14]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[15]_i_1 
       (.I0(IN_B[15]),
        .I1(comBIsDenormal__6),
        .O(data3[15]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[16]_i_1 
       (.I0(IN_B[16]),
        .I1(comBIsDenormal__6),
        .O(data3[16]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[17]_i_1 
       (.I0(IN_B[17]),
        .I1(comBIsDenormal__6),
        .O(data3[17]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[18]_i_1 
       (.I0(IN_B[18]),
        .I1(comBIsDenormal__6),
        .O(data3[18]));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[19]_i_1 
       (.I0(IN_B[19]),
        .I1(comBIsDenormal__6),
        .O(data3[19]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[1]_i_1 
       (.I0(IN_B[1]),
        .I1(comBIsDenormal__6),
        .O(data3[1]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[20]_i_1 
       (.I0(IN_B[20]),
        .I1(comBIsDenormal__6),
        .O(data3[20]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[21]_i_1 
       (.I0(IN_B[21]),
        .I1(comBIsDenormal__6),
        .O(data3[21]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[22]_i_1 
       (.I0(IN_B[22]),
        .I1(comBIsDenormal__6),
        .O(data3[22]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[23]_i_1 
       (.I0(IN_B[23]),
        .I1(comBIsDenormal__6),
        .O(data3[23]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[24]_i_1 
       (.I0(IN_B[24]),
        .I1(comBIsDenormal__6),
        .O(data3[24]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[25]_i_1 
       (.I0(IN_B[25]),
        .I1(comBIsDenormal__6),
        .O(data3[25]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[26]_i_1 
       (.I0(IN_B[26]),
        .I1(comBIsDenormal__6),
        .O(data3[26]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[27]_i_1 
       (.I0(IN_B[27]),
        .I1(comBIsDenormal__6),
        .O(data3[27]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[28]_i_1 
       (.I0(IN_B[28]),
        .I1(comBIsDenormal__6),
        .O(data3[28]));
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[29]_i_1 
       (.I0(IN_B[29]),
        .I1(comBIsDenormal__6),
        .O(data3[29]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[2]_i_1 
       (.I0(IN_B[2]),
        .I1(comBIsDenormal__6),
        .O(data3[2]));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[30]_i_1 
       (.I0(IN_B[30]),
        .I1(comBIsDenormal__6),
        .O(data3[30]));
  LUT5 #(
    .INIT(32'h00010000)) 
    \addDenormFlushedValB[30]_i_2 
       (.I0(IN_B[27]),
        .I1(IN_B[28]),
        .I2(IN_B[29]),
        .I3(IN_B[30]),
        .I4(\addDenormFlushedValB[30]_i_3_n_0 ),
        .O(comBIsDenormal__6));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \addDenormFlushedValB[30]_i_3 
       (.I0(IN_B[24]),
        .I1(IN_B[23]),
        .I2(IN_B[26]),
        .I3(IN_B[25]),
        .O(\addDenormFlushedValB[30]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[3]_i_1 
       (.I0(IN_B[3]),
        .I1(comBIsDenormal__6),
        .O(data3[3]));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[4]_i_1 
       (.I0(IN_B[4]),
        .I1(comBIsDenormal__6),
        .O(data3[4]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[5]_i_1 
       (.I0(IN_B[5]),
        .I1(comBIsDenormal__6),
        .O(data3[5]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[6]_i_1 
       (.I0(IN_B[6]),
        .I1(comBIsDenormal__6),
        .O(data3[6]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[7]_i_1 
       (.I0(IN_B[7]),
        .I1(comBIsDenormal__6),
        .O(data3[7]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[8]_i_1 
       (.I0(IN_B[8]),
        .I1(comBIsDenormal__6),
        .O(data3[8]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[9]_i_1 
       (.I0(IN_B[9]),
        .I1(comBIsDenormal__6),
        .O(data3[9]));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[0] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[0]),
        .Q(\addDenormFlushedValB_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[10] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[10]),
        .Q(\addDenormFlushedValB_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[11] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[11]),
        .Q(\addDenormFlushedValB_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[12] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[12]),
        .Q(\addDenormFlushedValB_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[13] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[13]),
        .Q(\addDenormFlushedValB_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[14] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[14]),
        .Q(\addDenormFlushedValB_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[15] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[15]),
        .Q(\addDenormFlushedValB_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[16] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[16]),
        .Q(\addDenormFlushedValB_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[17] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[17]),
        .Q(\addDenormFlushedValB_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[18] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[18]),
        .Q(\addDenormFlushedValB_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[19] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[19]),
        .Q(\addDenormFlushedValB_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[1] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[1]),
        .Q(\addDenormFlushedValB_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[20] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[20]),
        .Q(\addDenormFlushedValB_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[21] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[21]),
        .Q(\addDenormFlushedValB_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[22] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[22]),
        .Q(\addDenormFlushedValB_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[23] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[23]),
        .Q(\addDenormFlushedValB_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[24] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[24]),
        .Q(\addDenormFlushedValB_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[25] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[25]),
        .Q(\addDenormFlushedValB_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[26] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[26]),
        .Q(\addDenormFlushedValB_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[27] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[27]),
        .Q(\addDenormFlushedValB_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[28] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[28]),
        .Q(\addDenormFlushedValB_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[29] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[29]),
        .Q(\addDenormFlushedValB_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[2] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[2]),
        .Q(\addDenormFlushedValB_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[30] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[30]),
        .Q(\addDenormFlushedValB_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[31] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_B[31]),
        .Q(p_0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[3] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[3]),
        .Q(\addDenormFlushedValB_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[4] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[4]),
        .Q(\addDenormFlushedValB_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[5] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[5]),
        .Q(\addDenormFlushedValB_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[6] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[6]),
        .Q(\addDenormFlushedValB_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[7] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[7]),
        .Q(\addDenormFlushedValB_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[8] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[8]),
        .Q(\addDenormFlushedValB_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[9] 
       (.C(clk),
        .CE(IADD_GO),
        .D(data3[9]),
        .Q(\addDenormFlushedValB_reg_n_0_[9] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[0]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[0]),
        .I3(IN_A[0]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[10]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[10]),
        .I3(IN_A[10]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[11]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[11]),
        .I3(IN_A[11]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[12]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[12]),
        .I3(IN_A[12]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[13]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[13]),
        .I3(IN_A[13]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[14]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[14]),
        .I3(IN_A[14]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[15]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[15]),
        .I3(IN_A[15]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[16]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[16]),
        .I3(IN_A[16]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[17]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[17]),
        .I3(IN_A[17]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[18]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[18]),
        .I3(IN_A[18]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[19]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[19]),
        .I3(IN_A[19]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[1]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[1]),
        .I3(IN_A[1]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[20]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[20]),
        .I3(IN_A[20]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[21]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[21]),
        .I3(IN_A[21]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[22]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[22]),
        .I3(IN_A[22]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[23]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[23]),
        .I3(IN_A[23]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[24]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[24]),
        .I3(IN_A[24]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[25]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[25]),
        .I3(IN_A[25]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[26]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[26]),
        .I3(IN_A[26]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[27]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[27]),
        .I3(IN_A[27]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[28]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[28]),
        .I3(IN_A[28]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[29]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[29]),
        .I3(IN_A[29]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[2]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[2]),
        .I3(IN_A[2]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[30]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[30]),
        .I3(IN_A[30]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[30]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000060)) 
    \addEarlyOutBypass0[30]_i_2 
       (.I0(IN_B[31]),
        .I1(IN_A[31]),
        .I2(addEarlyOutBypassEnable0120_out__0),
        .I3(addEarlyOutBypassEnable0123_out__0),
        .I4(addEarlyOutBypassEnable013_out),
        .I5(addEarlyOutBypassEnable01__2),
        .O(\addEarlyOutBypass0[30]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFF040404)) 
    \addEarlyOutBypass0[30]_i_3 
       (.I0(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_5_n_0 ),
        .I2(addEarlyOutBypassEnable013_out),
        .I3(GetFloatIsReal__5),
        .I4(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .O(\addEarlyOutBypass0[30]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00003332FFFFFFFE)) 
    \addEarlyOutBypass0[30]_i_4 
       (.I0(\addEarlyOutBypass0[30]_i_6_n_0 ),
        .I1(addEarlyOutBypassEnable013_out),
        .I2(addEarlyOutBypassEnable0120_out__0),
        .I3(addEarlyOutBypassEnable0123_out__0),
        .I4(addEarlyOutBypassEnable01__2),
        .I5(GetFloatIsReal__5),
        .O(\addEarlyOutBypass0[30]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h0000D700)) 
    \addEarlyOutBypass0[30]_i_5 
       (.I0(addSameNumberDifferentSigns00),
        .I1(IN_A[31]),
        .I2(IN_B[31]),
        .I3(comALessThanB),
        .I4(comBIsDenormal__6),
        .O(\addEarlyOutBypass0[30]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h00005115)) 
    \addEarlyOutBypass0[30]_i_6 
       (.I0(comALessThanB),
        .I1(addSameNumberDifferentSigns00),
        .I2(IN_A[31]),
        .I3(IN_B[31]),
        .I4(comAIsDenormal__6),
        .O(\addEarlyOutBypass0[30]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFD0000FAF80000)) 
    \addEarlyOutBypass0[31]_i_1 
       (.I0(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .I1(addEarlyOutBypassEnable0120_out__0),
        .I2(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I3(addEarlyOutBypassEnable0123_out__0),
        .I4(IADD_GO),
        .I5(\addEarlyOutBypass0[31]_i_7_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \addEarlyOutBypass0[31]_i_10 
       (.I0(IN_A[28]),
        .I1(IN_A[29]),
        .I2(IN_A[27]),
        .I3(IN_A[30]),
        .I4(\addExponentDeltaBMinusA[5]_i_2_n_0 ),
        .O(GetFloatIsReal__5));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \addEarlyOutBypass0[31]_i_11 
       (.I0(\addEarlyOutBypass0[31]_i_18_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_19_n_0 ),
        .I2(IN_B[20]),
        .I3(IN_B[22]),
        .I4(IN_B[17]),
        .I5(\addEarlyOutBypass0[31]_i_20_n_0 ),
        .O(GetFloatIsINF013_in));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \addEarlyOutBypass0[31]_i_12 
       (.I0(IN_B[30]),
        .I1(IN_B[27]),
        .I2(IN_B[29]),
        .I3(IN_B[28]),
        .O(\addEarlyOutBypass0[31]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    \addEarlyOutBypass0[31]_i_13 
       (.I0(\addEarlyOutBypass0[31]_i_21_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_22_n_0 ),
        .I2(IN_A[20]),
        .I3(IN_A[22]),
        .I4(IN_A[17]),
        .I5(\addEarlyOutBypass0[31]_i_23_n_0 ),
        .O(GetFloatIsINF015_in));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h40000000)) 
    \addEarlyOutBypass0[31]_i_14 
       (.I0(\addExponentDeltaBMinusA[5]_i_2_n_0 ),
        .I1(IN_A[30]),
        .I2(IN_A[27]),
        .I3(IN_A[29]),
        .I4(IN_A[28]),
        .O(\addEarlyOutBypass0[31]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h0000800000000000)) 
    \addEarlyOutBypass0[31]_i_15 
       (.I0(IN_B[28]),
        .I1(IN_B[29]),
        .I2(IN_B[27]),
        .I3(IN_B[30]),
        .I4(\addExponentDeltaAMinusB[5]_i_2_n_0 ),
        .I5(\addEarlyOutBypass0[31]_i_14_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h888F888088808880)) 
    \addEarlyOutBypass0[31]_i_16 
       (.I0(\addEarlyOutBypass0[31]_i_14_n_0 ),
        .I1(GetFloatIsINF015_in),
        .I2(\addExponentDeltaAMinusB[5]_i_2_n_0 ),
        .I3(\addEarlyOutBypass0[31]_i_12_n_0 ),
        .I4(GetFloatIsINF013_in),
        .I5(GetFloatIsReal__5),
        .O(addEarlyOutBypassEnable013_out));
  LUT6 #(
    .INIT(64'h22202220222F2220)) 
    \addEarlyOutBypass0[31]_i_17 
       (.I0(\addEarlyOutBypass0[31]_i_14_n_0 ),
        .I1(GetFloatIsINF015_in),
        .I2(\addExponentDeltaAMinusB[5]_i_2_n_0 ),
        .I3(\addEarlyOutBypass0[31]_i_12_n_0 ),
        .I4(GetFloatIsReal__5),
        .I5(GetFloatIsINF013_in),
        .O(addEarlyOutBypassEnable01__2));
  LUT5 #(
    .INIT(32'h00010000)) 
    \addEarlyOutBypass0[31]_i_18 
       (.I0(IN_B[12]),
        .I1(IN_B[13]),
        .I2(IN_B[14]),
        .I3(IN_B[15]),
        .I4(\addEarlyOutBypass0[31]_i_24_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_18_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \addEarlyOutBypass0[31]_i_19 
       (.I0(IN_B[2]),
        .I1(IN_B[3]),
        .I2(IN_B[0]),
        .I3(IN_B[1]),
        .I4(\addEarlyOutBypass0[31]_i_25_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_19_n_0 ));
  LUT6 #(
    .INIT(64'hFEFFFEFCFCFCFCFC)) 
    \addEarlyOutBypass0[31]_i_2 
       (.I0(IN_B[31]),
        .I1(\addEarlyOutBypass0[31]_i_8_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_9_n_0 ),
        .I3(GetFloatIsReal__5),
        .I4(IN_A[31]),
        .I5(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addEarlyOutBypass0[31]_i_20 
       (.I0(IN_B[19]),
        .I1(IN_B[16]),
        .I2(IN_B[21]),
        .I3(IN_B[18]),
        .O(\addEarlyOutBypass0[31]_i_20_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \addEarlyOutBypass0[31]_i_21 
       (.I0(IN_A[12]),
        .I1(IN_A[13]),
        .I2(IN_A[14]),
        .I3(IN_A[15]),
        .I4(\addEarlyOutBypass0[31]_i_26_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \addEarlyOutBypass0[31]_i_22 
       (.I0(IN_A[2]),
        .I1(IN_A[3]),
        .I2(IN_A[0]),
        .I3(IN_A[1]),
        .I4(\addEarlyOutBypass0[31]_i_27_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_22_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addEarlyOutBypass0[31]_i_23 
       (.I0(IN_A[19]),
        .I1(IN_A[16]),
        .I2(IN_A[21]),
        .I3(IN_A[18]),
        .O(\addEarlyOutBypass0[31]_i_23_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \addEarlyOutBypass0[31]_i_24 
       (.I0(IN_B[11]),
        .I1(IN_B[10]),
        .I2(IN_B[9]),
        .I3(IN_B[8]),
        .O(\addEarlyOutBypass0[31]_i_24_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \addEarlyOutBypass0[31]_i_25 
       (.I0(IN_B[7]),
        .I1(IN_B[6]),
        .I2(IN_B[5]),
        .I3(IN_B[4]),
        .O(\addEarlyOutBypass0[31]_i_25_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \addEarlyOutBypass0[31]_i_26 
       (.I0(IN_A[11]),
        .I1(IN_A[10]),
        .I2(IN_A[9]),
        .I3(IN_A[8]),
        .O(\addEarlyOutBypass0[31]_i_26_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \addEarlyOutBypass0[31]_i_27 
       (.I0(IN_A[7]),
        .I1(IN_A[6]),
        .I2(IN_A[5]),
        .I3(IN_A[4]),
        .O(\addEarlyOutBypass0[31]_i_27_n_0 ));
  LUT6 #(
    .INIT(64'h000EFFF500040004)) 
    \addEarlyOutBypass0[31]_i_3 
       (.I0(GetFloatIsINF013_in),
        .I1(GetFloatIsReal__5),
        .I2(\addEarlyOutBypass0[31]_i_12_n_0 ),
        .I3(\addExponentDeltaAMinusB[5]_i_2_n_0 ),
        .I4(GetFloatIsINF015_in),
        .I5(\addEarlyOutBypass0[31]_i_14_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \addEarlyOutBypass0[31]_i_4 
       (.I0(\addEarlyOutBypass0[31]_i_15_n_0 ),
        .I1(GetFloatIsINF013_in),
        .I2(GetFloatIsINF015_in),
        .O(addEarlyOutBypassEnable0120_out__0));
  LUT4 #(
    .INIT(16'hFE02)) 
    \addEarlyOutBypass0[31]_i_5 
       (.I0(GetFloatIsReal__5),
        .I1(\addEarlyOutBypass0[31]_i_12_n_0 ),
        .I2(\addExponentDeltaAMinusB[5]_i_2_n_0 ),
        .I3(\addEarlyOutBypass0[31]_i_14_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \addEarlyOutBypass0[31]_i_6 
       (.I0(\addEarlyOutBypass0[31]_i_15_n_0 ),
        .I1(GetFloatIsINF013_in),
        .I2(GetFloatIsINF015_in),
        .O(addEarlyOutBypassEnable0123_out__0));
  LUT6 #(
    .INIT(64'hE2FFFFE2E2E2E2E2)) 
    \addEarlyOutBypass0[31]_i_7 
       (.I0(comBIsDenormal__6),
        .I1(comALessThanB),
        .I2(comAIsDenormal__6),
        .I3(IN_B[31]),
        .I4(IN_A[31]),
        .I5(addSameNumberDifferentSigns00),
        .O(\addEarlyOutBypass0[31]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h0054000000500000)) 
    \addEarlyOutBypass0[31]_i_8 
       (.I0(addEarlyOutBypassEnable013_out),
        .I1(addEarlyOutBypassEnable0120_out__0),
        .I2(addEarlyOutBypassEnable0123_out__0),
        .I3(addEarlyOutBypassEnable01__2),
        .I4(IN_A[31]),
        .I5(IN_B[31]),
        .O(\addEarlyOutBypass0[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0000000050005140)) 
    \addEarlyOutBypass0[31]_i_9 
       (.I0(addEarlyOutBypassEnable013_out),
        .I1(comALessThanB),
        .I2(IN_B[31]),
        .I3(IN_A[31]),
        .I4(addSameNumberDifferentSigns00),
        .I5(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[3]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[3]),
        .I3(IN_A[3]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[4]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[4]),
        .I3(IN_A[4]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[5]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[5]),
        .I3(IN_A[5]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[6]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[6]),
        .I3(IN_A[6]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[7]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[7]),
        .I3(IN_A[7]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[8]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[8]),
        .I3(IN_A[8]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \addEarlyOutBypass0[9]_i_1 
       (.I0(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I2(IN_B[9]),
        .I3(IN_A[9]),
        .I4(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[0] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[0]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[10] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[10]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[11] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[11]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[12] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[12]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[13] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[13]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[14] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[14]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[15] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[15]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[16] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[16]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[17] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[17]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[18] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[18]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[19] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[19]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[1] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[1]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[20] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[20]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[21] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[21]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[22] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[22]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[23] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[23]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[24] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[24]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[25] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[25]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[26] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[26]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[27] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[27]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[28] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[28]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[29] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[29]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[2] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[2]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[30] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[30]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[31] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[31]_i_2_n_0 ),
        .Q(addEarlyOutBypass0[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[3] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[3]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[4] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[4]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[5] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[5]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[6] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[6]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[7] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[7]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[8] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[8]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[9] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[9]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[0]_i_1 
       (.I0(addEarlyOutBypass0[0]),
        .I1(\addDenormFlushedValB_reg_n_0_[0] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[0] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[10]_i_1 
       (.I0(addEarlyOutBypass0[10]),
        .I1(\addDenormFlushedValB_reg_n_0_[10] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[10] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[11]_i_1 
       (.I0(addEarlyOutBypass0[11]),
        .I1(\addDenormFlushedValB_reg_n_0_[11] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[11] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[12]_i_1 
       (.I0(addEarlyOutBypass0[12]),
        .I1(\addDenormFlushedValB_reg_n_0_[12] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[12] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[13]_i_1 
       (.I0(addEarlyOutBypass0[13]),
        .I1(\addDenormFlushedValB_reg_n_0_[13] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[13] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[14]_i_1 
       (.I0(addEarlyOutBypass0[14]),
        .I1(\addDenormFlushedValB_reg_n_0_[14] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[14] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[15]_i_1 
       (.I0(addEarlyOutBypass0[15]),
        .I1(\addDenormFlushedValB_reg_n_0_[15] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[15] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[16]_i_1 
       (.I0(addEarlyOutBypass0[16]),
        .I1(\addDenormFlushedValB_reg_n_0_[16] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[16] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[17]_i_1 
       (.I0(addEarlyOutBypass0[17]),
        .I1(\addDenormFlushedValB_reg_n_0_[17] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[17] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[18]_i_1 
       (.I0(addEarlyOutBypass0[18]),
        .I1(\addDenormFlushedValB_reg_n_0_[18] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[18] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[19]_i_1 
       (.I0(addEarlyOutBypass0[19]),
        .I1(\addDenormFlushedValB_reg_n_0_[19] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[19] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[1]_i_1 
       (.I0(addEarlyOutBypass0[1]),
        .I1(\addDenormFlushedValB_reg_n_0_[1] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[1] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[20]_i_1 
       (.I0(addEarlyOutBypass0[20]),
        .I1(\addDenormFlushedValB_reg_n_0_[20] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[20] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[21]_i_1 
       (.I0(addEarlyOutBypass0[21]),
        .I1(\addDenormFlushedValB_reg_n_0_[21] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[21] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[22]_i_1 
       (.I0(addEarlyOutBypass0[22]),
        .I1(\addDenormFlushedValB_reg_n_0_[22] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[22] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \addEarlyOutBypass1[23]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[23] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[23] ),
        .I3(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .I4(addEarlyOutBypass0[23]),
        .O(\addEarlyOutBypass1[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \addEarlyOutBypass1[24]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[24] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[24] ),
        .I3(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .I4(addEarlyOutBypass0[24]),
        .O(\addEarlyOutBypass1[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \addEarlyOutBypass1[25]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[25] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[25] ),
        .I3(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .I4(addEarlyOutBypass0[25]),
        .O(\addEarlyOutBypass1[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \addEarlyOutBypass1[26]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[26] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[26] ),
        .I3(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .I4(addEarlyOutBypass0[26]),
        .O(\addEarlyOutBypass1[26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \addEarlyOutBypass1[27]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[27] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[27] ),
        .I3(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .I4(addEarlyOutBypass0[27]),
        .O(\addEarlyOutBypass1[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \addEarlyOutBypass1[28]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[28] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[28] ),
        .I3(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .I4(addEarlyOutBypass0[28]),
        .O(\addEarlyOutBypass1[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \addEarlyOutBypass1[29]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[29] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[29] ),
        .I3(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .I4(addEarlyOutBypass0[29]),
        .O(\addEarlyOutBypass1[29]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[2]_i_1 
       (.I0(addEarlyOutBypass0[2]),
        .I1(\addDenormFlushedValB_reg_n_0_[2] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[2] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \addEarlyOutBypass1[30]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[30] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[30] ),
        .I3(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .I4(addEarlyOutBypass0[30]),
        .O(\addEarlyOutBypass1[30]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE2FFE200)) 
    \addEarlyOutBypass1[31]_i_1 
       (.I0(p_1_in),
        .I1(addALessThanB),
        .I2(p_0_in),
        .I3(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .I4(addEarlyOutBypass0[31]),
        .O(\addEarlyOutBypass1[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hE200)) 
    \addEarlyOutBypass1[31]_i_2 
       (.I0(addExponentDeltaAMinusBShiftTooFar),
        .I1(addALessThanB),
        .I2(addExponentDeltaBMinusAShiftTooFar),
        .I3(addMaxVal1),
        .O(\addEarlyOutBypass1[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[3]_i_1 
       (.I0(addEarlyOutBypass0[3]),
        .I1(\addDenormFlushedValB_reg_n_0_[3] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[3] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[4]_i_1 
       (.I0(addEarlyOutBypass0[4]),
        .I1(\addDenormFlushedValB_reg_n_0_[4] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[4] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[5]_i_1 
       (.I0(addEarlyOutBypass0[5]),
        .I1(\addDenormFlushedValB_reg_n_0_[5] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[5] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[6]_i_1 
       (.I0(addEarlyOutBypass0[6]),
        .I1(\addDenormFlushedValB_reg_n_0_[6] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[6] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[7]_i_1 
       (.I0(addEarlyOutBypass0[7]),
        .I1(\addDenormFlushedValB_reg_n_0_[7] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[7] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[8]_i_1 
       (.I0(addEarlyOutBypass0[8]),
        .I1(\addDenormFlushedValB_reg_n_0_[8] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[8] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[9]_i_1 
       (.I0(addEarlyOutBypass0[9]),
        .I1(\addDenormFlushedValB_reg_n_0_[9] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[9] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[0]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[10]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[11]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[12]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[13]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[14]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[15]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[16]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[17]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[18]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[19]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[1]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[20]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[21]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[22]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[23]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[24] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[24]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[25] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[25]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[26] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[26]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[27] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[27]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[28] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[28]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[29] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[29]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[2]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[30] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[30]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[31] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[31]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[3]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[4]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[5]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[6]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[7]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[8]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass1_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\addEarlyOutBypass1[9]_i_1_n_0 ),
        .Q(addEarlyOutBypass1[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFF0F0FFEEF0F0)) 
    addEarlyOutBypassEnable0_i_1
       (.I0(addEarlyOutBypassEnable0120_out__0),
        .I1(addEarlyOutBypassEnable00__0),
        .I2(addEarlyOutBypassEnable0__0),
        .I3(addEarlyOutBypassEnable0_i_3_n_0),
        .I4(IADD_GO),
        .I5(addEarlyOutBypassEnable0_i_4_n_0),
        .O(addEarlyOutBypassEnable0_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h28)) 
    addEarlyOutBypassEnable0_i_2
       (.I0(addSameNumberDifferentSigns00),
        .I1(IN_A[31]),
        .I2(IN_B[31]),
        .O(addEarlyOutBypassEnable00__0));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addEarlyOutBypassEnable0_i_3
       (.I0(comAIsDenormal__6),
        .I1(comALessThanB),
        .I2(comBIsDenormal__6),
        .O(addEarlyOutBypassEnable0_i_3_n_0));
  LUT3 #(
    .INIT(8'hFE)) 
    addEarlyOutBypassEnable0_i_4
       (.I0(addEarlyOutBypassEnable01__2),
        .I1(addEarlyOutBypassEnable013_out),
        .I2(addEarlyOutBypassEnable0123_out__0),
        .O(addEarlyOutBypassEnable0_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    addEarlyOutBypassEnable0_reg
       (.C(clk),
        .CE(1'b1),
        .D(addEarlyOutBypassEnable0_i_1_n_0),
        .Q(addEarlyOutBypassEnable0__0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    addEarlyOutBypassEnable1_i_1
       (.I0(addEarlyOutBypassEnable0__0),
        .I1(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(addEarlyOutBypassEnable1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    addEarlyOutBypassEnable1_reg
       (.C(clk),
        .CE(1'b1),
        .D(addEarlyOutBypassEnable1_i_1_n_0),
        .Q(addEarlyOutBypassEnable1_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFF0BBF0)) 
    addEarlyOutBypassEnable2_i_1
       (.I0(addSameNumberDifferentSigns1_reg_n_0),
        .I1(\addRenormalizeShiftAmount[4]_i_3_n_0 ),
        .I2(addEarlyOutBypassEnable2_reg_n_0),
        .I3(addPipelineValidStage1),
        .I4(addEarlyOutBypassEnable1_reg_n_0),
        .O(addEarlyOutBypassEnable2_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    addEarlyOutBypassEnable2_reg
       (.C(clk),
        .CE(1'b1),
        .D(addEarlyOutBypassEnable2_i_1_n_0),
        .Q(addEarlyOutBypassEnable2_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEAAA)) 
    addExponentDeltaAMinusBShiftTooFar_i_1
       (.I0(addExponentDeltaAMinusB0[7]),
        .I1(addExponentDeltaAMinusB0[3]),
        .I2(addExponentDeltaAMinusBShiftTooFar_i_2_n_0),
        .I3(addExponentDeltaAMinusB0[4]),
        .I4(addExponentDeltaAMinusB0[5]),
        .I5(addExponentDeltaAMinusB0[6]),
        .O(addExponentDeltaAMinusBShiftTooFar_i_1_n_0));
  LUT6 #(
    .INIT(64'h6FFFF6FFFF6FFFF6)) 
    addExponentDeltaAMinusBShiftTooFar_i_2
       (.I0(IN_B[25]),
        .I1(IN_A[25]),
        .I2(IN_B[24]),
        .I3(IN_B[23]),
        .I4(IN_A[24]),
        .I5(IN_A[23]),
        .O(addExponentDeltaAMinusBShiftTooFar_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    addExponentDeltaAMinusBShiftTooFar_reg
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaAMinusBShiftTooFar_i_1_n_0),
        .Q(addExponentDeltaAMinusBShiftTooFar),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \addExponentDeltaAMinusB[0]_i_1 
       (.I0(IN_A[23]),
        .I1(IN_B[23]),
        .O(addExponentDeltaAMinusB0[0]));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h639C)) 
    \addExponentDeltaAMinusB[1]_i_1 
       (.I0(IN_A[23]),
        .I1(IN_A[24]),
        .I2(IN_B[23]),
        .I3(IN_B[24]),
        .O(addExponentDeltaAMinusB0[1]));
  LUT6 #(
    .INIT(64'h6666966696969996)) 
    \addExponentDeltaAMinusB[2]_i_1 
       (.I0(IN_B[25]),
        .I1(IN_A[25]),
        .I2(IN_B[24]),
        .I3(IN_B[23]),
        .I4(IN_A[23]),
        .I5(IN_A[24]),
        .O(addExponentDeltaAMinusB0[2]));
  LUT6 #(
    .INIT(64'h820A7DF57DF5820A)) 
    \addExponentDeltaAMinusB[3]_i_1 
       (.I0(IN_A[25]),
        .I1(IN_B[23]),
        .I2(IN_B[25]),
        .I3(IN_B[24]),
        .I4(\addExponentDeltaAMinusB[3]_i_2_n_0 ),
        .I5(\addExponentDeltaAMinusB[3]_i_3_n_0 ),
        .O(addExponentDeltaAMinusB0[3]));
  LUT6 #(
    .INIT(64'hF999609969996009)) 
    \addExponentDeltaAMinusB[3]_i_2 
       (.I0(IN_A[25]),
        .I1(IN_B[25]),
        .I2(IN_B[23]),
        .I3(IN_B[24]),
        .I4(IN_A[24]),
        .I5(IN_A[23]),
        .O(\addExponentDeltaAMinusB[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h6AAA9555)) 
    \addExponentDeltaAMinusB[3]_i_3 
       (.I0(IN_A[26]),
        .I1(IN_B[23]),
        .I2(IN_B[24]),
        .I3(IN_B[25]),
        .I4(IN_B[26]),
        .O(\addExponentDeltaAMinusB[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h659A59A69A65A659)) 
    \addExponentDeltaAMinusB[4]_i_1 
       (.I0(IN_A[27]),
        .I1(IN_B[26]),
        .I2(\addExponentDeltaAMinusB[4]_i_2_n_0 ),
        .I3(IN_B[27]),
        .I4(IN_A[26]),
        .I5(\addExponentDeltaAMinusB[4]_i_3_n_0 ),
        .O(addExponentDeltaAMinusB0[4]));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \addExponentDeltaAMinusB[4]_i_2 
       (.I0(IN_B[25]),
        .I1(IN_B[24]),
        .I2(IN_B[23]),
        .O(\addExponentDeltaAMinusB[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEBAFAAAA820A0000)) 
    \addExponentDeltaAMinusB[4]_i_3 
       (.I0(\addExponentDeltaAMinusB[3]_i_2_n_0 ),
        .I1(IN_B[24]),
        .I2(IN_B[25]),
        .I3(IN_B[23]),
        .I4(IN_A[25]),
        .I5(\addExponentDeltaAMinusB[3]_i_3_n_0 ),
        .O(\addExponentDeltaAMinusB[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h659A59A69A65A659)) 
    \addExponentDeltaAMinusB[5]_i_1 
       (.I0(IN_A[28]),
        .I1(IN_B[27]),
        .I2(\addExponentDeltaAMinusB[5]_i_2_n_0 ),
        .I3(IN_B[28]),
        .I4(IN_A[27]),
        .I5(\addExponentDeltaAMinusB[5]_i_3_n_0 ),
        .O(addExponentDeltaAMinusB0[5]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \addExponentDeltaAMinusB[5]_i_2 
       (.I0(IN_B[23]),
        .I1(IN_B[24]),
        .I2(IN_B[25]),
        .I3(IN_B[26]),
        .O(\addExponentDeltaAMinusB[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAE8A38203820AE8A)) 
    \addExponentDeltaAMinusB[5]_i_3 
       (.I0(\addExponentDeltaAMinusB[4]_i_3_n_0 ),
        .I1(\addExponentDeltaAMinusB[4]_i_2_n_0 ),
        .I2(IN_B[26]),
        .I3(IN_A[26]),
        .I4(IN_A[27]),
        .I5(IN_B[27]),
        .O(\addExponentDeltaAMinusB[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6966669696999969)) 
    \addExponentDeltaAMinusB[6]_i_1 
       (.I0(IN_A[29]),
        .I1(IN_B[29]),
        .I2(IN_B[28]),
        .I3(\addExponentDeltaAMinusB[7]_i_3_n_0 ),
        .I4(IN_A[28]),
        .I5(\addExponentDeltaAMinusB[7]_i_4_n_0 ),
        .O(addExponentDeltaAMinusB0[6]));
  LUT6 #(
    .INIT(64'h5115F77FAEEA0880)) 
    \addExponentDeltaAMinusB[7]_i_1 
       (.I0(\addExponentDeltaAMinusB[7]_i_2_n_0 ),
        .I1(IN_A[28]),
        .I2(IN_B[28]),
        .I3(\addExponentDeltaAMinusB[7]_i_3_n_0 ),
        .I4(\addExponentDeltaAMinusB[7]_i_4_n_0 ),
        .I5(\addExponentDeltaAMinusB[7]_i_5_n_0 ),
        .O(addExponentDeltaAMinusB0[7]));
  LUT5 #(
    .INIT(32'h99996999)) 
    \addExponentDeltaAMinusB[7]_i_2 
       (.I0(IN_A[29]),
        .I1(IN_B[29]),
        .I2(IN_B[28]),
        .I3(IN_B[27]),
        .I4(\addExponentDeltaAMinusB[5]_i_2_n_0 ),
        .O(\addExponentDeltaAMinusB[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \addExponentDeltaAMinusB[7]_i_3 
       (.I0(IN_B[26]),
        .I1(IN_B[25]),
        .I2(IN_B[24]),
        .I3(IN_B[23]),
        .I4(IN_B[27]),
        .O(\addExponentDeltaAMinusB[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAE8A38203820AE8A)) 
    \addExponentDeltaAMinusB[7]_i_4 
       (.I0(\addExponentDeltaAMinusB[5]_i_3_n_0 ),
        .I1(\addExponentDeltaAMinusB[5]_i_2_n_0 ),
        .I2(IN_B[27]),
        .I3(IN_A[27]),
        .I4(IN_A[28]),
        .I5(IN_B[28]),
        .O(\addExponentDeltaAMinusB[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hC9CC6C6636339399)) 
    \addExponentDeltaAMinusB[7]_i_5 
       (.I0(IN_A[29]),
        .I1(IN_A[30]),
        .I2(\addExponentDeltaAMinusB[7]_i_3_n_0 ),
        .I3(IN_B[28]),
        .I4(IN_B[29]),
        .I5(IN_B[30]),
        .O(\addExponentDeltaAMinusB[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaAMinusB_reg[0] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaAMinusB0[0]),
        .Q(addExponentDeltaAMinusB[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaAMinusB_reg[1] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaAMinusB0[1]),
        .Q(addExponentDeltaAMinusB[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaAMinusB_reg[2] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaAMinusB0[2]),
        .Q(addExponentDeltaAMinusB[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaAMinusB_reg[3] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaAMinusB0[3]),
        .Q(addExponentDeltaAMinusB[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaAMinusB_reg[4] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaAMinusB0[4]),
        .Q(addExponentDeltaAMinusB[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaAMinusB_reg[5] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaAMinusB0[5]),
        .Q(addExponentDeltaAMinusB[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaAMinusB_reg[6] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaAMinusB0[6]),
        .Q(addExponentDeltaAMinusB[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaAMinusB_reg[7] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaAMinusB0[7]),
        .Q(addExponentDeltaAMinusB[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEAAA)) 
    addExponentDeltaBMinusAShiftTooFar_i_1
       (.I0(addExponentDeltaBMinusA0[7]),
        .I1(addExponentDeltaBMinusA0[3]),
        .I2(addExponentDeltaBMinusAShiftTooFar_i_2_n_0),
        .I3(addExponentDeltaBMinusA0[4]),
        .I4(addExponentDeltaBMinusA0[5]),
        .I5(addExponentDeltaBMinusA0[6]),
        .O(addExponentDeltaBMinusAShiftTooFar_i_1_n_0));
  LUT6 #(
    .INIT(64'h6FFFF6FFFF6FFFF6)) 
    addExponentDeltaBMinusAShiftTooFar_i_2
       (.I0(IN_A[25]),
        .I1(IN_B[25]),
        .I2(IN_A[24]),
        .I3(IN_A[23]),
        .I4(IN_B[24]),
        .I5(IN_B[23]),
        .O(addExponentDeltaBMinusAShiftTooFar_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    addExponentDeltaBMinusAShiftTooFar_reg
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaBMinusAShiftTooFar_i_1_n_0),
        .Q(addExponentDeltaBMinusAShiftTooFar),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h639C)) 
    \addExponentDeltaBMinusA[1]_i_1 
       (.I0(IN_B[23]),
        .I1(IN_B[24]),
        .I2(IN_A[23]),
        .I3(IN_A[24]),
        .O(addExponentDeltaBMinusA0[1]));
  LUT6 #(
    .INIT(64'h6696666696999696)) 
    \addExponentDeltaBMinusA[2]_i_1 
       (.I0(IN_A[25]),
        .I1(IN_B[25]),
        .I2(IN_A[24]),
        .I3(IN_B[23]),
        .I4(IN_A[23]),
        .I5(IN_B[24]),
        .O(addExponentDeltaBMinusA0[2]));
  LUT6 #(
    .INIT(64'h82227DDD7DDD8222)) 
    \addExponentDeltaBMinusA[3]_i_1 
       (.I0(IN_B[25]),
        .I1(IN_A[25]),
        .I2(IN_A[24]),
        .I3(IN_A[23]),
        .I4(\addExponentDeltaBMinusA[3]_i_2_n_0 ),
        .I5(\addExponentDeltaBMinusA[3]_i_3_n_0 ),
        .O(addExponentDeltaBMinusA0[3]));
  LUT6 #(
    .INIT(64'hF999609969996009)) 
    \addExponentDeltaBMinusA[3]_i_2 
       (.I0(IN_B[25]),
        .I1(IN_A[25]),
        .I2(IN_A[23]),
        .I3(IN_A[24]),
        .I4(IN_B[24]),
        .I5(IN_B[23]),
        .O(\addExponentDeltaBMinusA[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h6AAA9555)) 
    \addExponentDeltaBMinusA[3]_i_3 
       (.I0(IN_B[26]),
        .I1(IN_A[25]),
        .I2(IN_A[24]),
        .I3(IN_A[23]),
        .I4(IN_A[26]),
        .O(\addExponentDeltaBMinusA[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h659A59A69A65A659)) 
    \addExponentDeltaBMinusA[4]_i_1 
       (.I0(IN_B[27]),
        .I1(IN_A[26]),
        .I2(\addExponentDeltaBMinusA[4]_i_2_n_0 ),
        .I3(IN_A[27]),
        .I4(IN_B[26]),
        .I5(\addExponentDeltaBMinusA[4]_i_3_n_0 ),
        .O(addExponentDeltaBMinusA0[4]));
  LUT3 #(
    .INIT(8'h7F)) 
    \addExponentDeltaBMinusA[4]_i_2 
       (.I0(IN_A[23]),
        .I1(IN_A[24]),
        .I2(IN_A[25]),
        .O(\addExponentDeltaBMinusA[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEABFAAAA802A0000)) 
    \addExponentDeltaBMinusA[4]_i_3 
       (.I0(\addExponentDeltaBMinusA[3]_i_2_n_0 ),
        .I1(IN_A[23]),
        .I2(IN_A[24]),
        .I3(IN_A[25]),
        .I4(IN_B[25]),
        .I5(\addExponentDeltaBMinusA[3]_i_3_n_0 ),
        .O(\addExponentDeltaBMinusA[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6696696699699699)) 
    \addExponentDeltaBMinusA[5]_i_1 
       (.I0(IN_B[28]),
        .I1(IN_A[28]),
        .I2(\addExponentDeltaBMinusA[5]_i_2_n_0 ),
        .I3(IN_A[27]),
        .I4(IN_B[27]),
        .I5(\addExponentDeltaBMinusA[5]_i_3_n_0 ),
        .O(addExponentDeltaBMinusA0[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \addExponentDeltaBMinusA[5]_i_2 
       (.I0(IN_A[25]),
        .I1(IN_A[24]),
        .I2(IN_A[23]),
        .I3(IN_A[26]),
        .O(\addExponentDeltaBMinusA[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAE8A38203820AE8A)) 
    \addExponentDeltaBMinusA[5]_i_3 
       (.I0(\addExponentDeltaBMinusA[4]_i_3_n_0 ),
        .I1(\addExponentDeltaBMinusA[4]_i_2_n_0 ),
        .I2(IN_A[26]),
        .I3(IN_B[26]),
        .I4(IN_B[27]),
        .I5(IN_A[27]),
        .O(\addExponentDeltaBMinusA[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h5A96695AA56996A5)) 
    \addExponentDeltaBMinusA[6]_i_1 
       (.I0(IN_B[29]),
        .I1(\addExponentDeltaBMinusA[7]_i_3_n_0 ),
        .I2(IN_A[29]),
        .I3(IN_A[28]),
        .I4(IN_B[28]),
        .I5(\addExponentDeltaBMinusA[7]_i_4_n_0 ),
        .O(addExponentDeltaBMinusA0[6]));
  LUT6 #(
    .INIT(64'h5115F77FAEEA0880)) 
    \addExponentDeltaBMinusA[7]_i_1 
       (.I0(\addExponentDeltaBMinusA[7]_i_2_n_0 ),
        .I1(IN_B[28]),
        .I2(\addExponentDeltaBMinusA[7]_i_3_n_0 ),
        .I3(IN_A[28]),
        .I4(\addExponentDeltaBMinusA[7]_i_4_n_0 ),
        .I5(\addExponentDeltaBMinusA[7]_i_5_n_0 ),
        .O(addExponentDeltaBMinusA0[7]));
  LUT5 #(
    .INIT(32'hA659AA55)) 
    \addExponentDeltaBMinusA[7]_i_2 
       (.I0(IN_B[29]),
        .I1(IN_A[27]),
        .I2(\addExponentDeltaBMinusA[5]_i_2_n_0 ),
        .I3(IN_A[29]),
        .I4(IN_A[28]),
        .O(\addExponentDeltaBMinusA[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \addExponentDeltaBMinusA[7]_i_3 
       (.I0(IN_A[26]),
        .I1(IN_A[23]),
        .I2(IN_A[24]),
        .I3(IN_A[25]),
        .I4(IN_A[27]),
        .O(\addExponentDeltaBMinusA[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAE8A38203820AE8A)) 
    \addExponentDeltaBMinusA[7]_i_4 
       (.I0(\addExponentDeltaBMinusA[5]_i_3_n_0 ),
        .I1(\addExponentDeltaBMinusA[5]_i_2_n_0 ),
        .I2(IN_A[27]),
        .I3(IN_B[27]),
        .I4(IN_B[28]),
        .I5(IN_A[28]),
        .O(\addExponentDeltaBMinusA[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hC9CC6C6636339399)) 
    \addExponentDeltaBMinusA[7]_i_5 
       (.I0(IN_B[29]),
        .I1(IN_B[30]),
        .I2(\addExponentDeltaBMinusA[7]_i_3_n_0 ),
        .I3(IN_A[28]),
        .I4(IN_A[29]),
        .I5(IN_A[30]),
        .O(\addExponentDeltaBMinusA[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaBMinusA_reg[1] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaBMinusA0[1]),
        .Q(addExponentDeltaBMinusA[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaBMinusA_reg[2] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaBMinusA0[2]),
        .Q(addExponentDeltaBMinusA[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaBMinusA_reg[3] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaBMinusA0[3]),
        .Q(addExponentDeltaBMinusA[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaBMinusA_reg[4] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaBMinusA0[4]),
        .Q(addExponentDeltaBMinusA[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaBMinusA_reg[5] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaBMinusA0[5]),
        .Q(addExponentDeltaBMinusA[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaBMinusA_reg[6] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaBMinusA0[6]),
        .Q(addExponentDeltaBMinusA[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addExponentDeltaBMinusA_reg[7] 
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaBMinusA0[7]),
        .Q(addExponentDeltaBMinusA[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT4 #(
    .INIT(16'h9A95)) 
    \addFinalExp[0]_i_1 
       (.I0(\addMaxVal1_reg_n_0_[23] ),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\addPostAddMantissa1_reg_n_0_[24] ),
        .O(\addFinalExp[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h1015EFEA)) 
    \addFinalExp[1]_i_1 
       (.I0(\addMaxVal1_reg_n_0_[23] ),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\addPostAddMantissa1_reg_n_0_[24] ),
        .I4(\addMaxVal1_reg_n_0_[24] ),
        .O(\addFinalExp[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h555557F7AAAAA808)) 
    \addFinalExp[2]_i_1 
       (.I0(\addMaxVal1_reg_n_0_[24] ),
        .I1(\addPostAddMantissa1_reg_n_0_[24] ),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [24]),
        .I4(\addMaxVal1_reg_n_0_[23] ),
        .I5(\addMaxVal1_reg_n_0_[25] ),
        .O(\addFinalExp[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \addFinalExp[3]_i_1 
       (.I0(\addFinalExp[5]_i_2_n_0 ),
        .I1(\addMaxVal1_reg_n_0_[24] ),
        .I2(\addMaxVal1_reg_n_0_[25] ),
        .I3(\addMaxVal1_reg_n_0_[26] ),
        .O(\addFinalExp[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \addFinalExp[4]_i_1 
       (.I0(\addFinalExp[5]_i_2_n_0 ),
        .I1(\addMaxVal1_reg_n_0_[25] ),
        .I2(\addMaxVal1_reg_n_0_[24] ),
        .I3(\addMaxVal1_reg_n_0_[26] ),
        .I4(\addMaxVal1_reg_n_0_[27] ),
        .O(\addFinalExp[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \addFinalExp[5]_i_1 
       (.I0(\addFinalExp[5]_i_2_n_0 ),
        .I1(\addMaxVal1_reg_n_0_[26] ),
        .I2(\addMaxVal1_reg_n_0_[24] ),
        .I3(\addMaxVal1_reg_n_0_[25] ),
        .I4(\addMaxVal1_reg_n_0_[27] ),
        .I5(\addMaxVal1_reg_n_0_[28] ),
        .O(\addFinalExp[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'hFFE2)) 
    \addFinalExp[5]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[24] ),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .I2(\ADDStage2.postAddMantissa0 [24]),
        .I3(\addMaxVal1_reg_n_0_[23] ),
        .O(\addFinalExp[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF001D0000FFE2)) 
    \addFinalExp[6]_i_1 
       (.I0(\addPostAddMantissa1_reg_n_0_[24] ),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .I2(\ADDStage2.postAddMantissa0 [24]),
        .I3(\addMaxVal1_reg_n_0_[23] ),
        .I4(\addFinalExp[6]_i_2_n_0 ),
        .I5(\addMaxVal1_reg_n_0_[29] ),
        .O(\addFinalExp[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \addFinalExp[6]_i_2 
       (.I0(\addMaxVal1_reg_n_0_[27] ),
        .I1(\addMaxVal1_reg_n_0_[25] ),
        .I2(\addMaxVal1_reg_n_0_[24] ),
        .I3(\addMaxVal1_reg_n_0_[26] ),
        .I4(\addMaxVal1_reg_n_0_[28] ),
        .O(\addFinalExp[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6666666666633363)) 
    \addFinalExp[7]_i_1 
       (.I0(\addFinalExp[7]_i_2_n_0 ),
        .I1(\addMaxVal1_reg_n_0_[30] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .I4(\ADDStage2.postAddMantissa0 [24]),
        .I5(\addMaxVal1_reg_n_0_[23] ),
        .O(\addFinalExp[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \addFinalExp[7]_i_2 
       (.I0(\addMaxVal1_reg_n_0_[28] ),
        .I1(\addMaxVal1_reg_n_0_[26] ),
        .I2(\addMaxVal1_reg_n_0_[24] ),
        .I3(\addMaxVal1_reg_n_0_[25] ),
        .I4(\addMaxVal1_reg_n_0_[27] ),
        .I5(\addMaxVal1_reg_n_0_[29] ),
        .O(\addFinalExp[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addFinalExp_reg[0] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addFinalExp[0]_i_1_n_0 ),
        .Q(addFinalExp[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addFinalExp_reg[1] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addFinalExp[1]_i_1_n_0 ),
        .Q(addFinalExp[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addFinalExp_reg[2] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addFinalExp[2]_i_1_n_0 ),
        .Q(addFinalExp[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addFinalExp_reg[3] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addFinalExp[3]_i_1_n_0 ),
        .Q(addFinalExp[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addFinalExp_reg[4] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addFinalExp[4]_i_1_n_0 ),
        .Q(addFinalExp[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addFinalExp_reg[5] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addFinalExp[5]_i_1_n_0 ),
        .Q(addFinalExp[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addFinalExp_reg[6] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addFinalExp[6]_i_1_n_0 ),
        .Q(addFinalExp[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addFinalExp_reg[7] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addFinalExp[7]_i_1_n_0 ),
        .Q(addFinalExp[7]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFB0008)) 
    addFinalSignIsNeg_i_1
       (.I0(\addPostAddMantissa1_reg_n_0_[25] ),
        .I1(addPipelineValidStage1),
        .I2(addSameNumberDifferentSigns1_reg_n_0),
        .I3(addEarlyOutBypassEnable1_reg_n_0),
        .I4(addFinalSignIsNeg_reg_n_0),
        .O(addFinalSignIsNeg_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    addFinalSignIsNeg_reg
       (.C(clk),
        .CE(1'b1),
        .D(addFinalSignIsNeg_i_1_n_0),
        .Q(addFinalSignIsNeg_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[23]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[23] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[23] ),
        .O(\addMaxVal1[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[24]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[24] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[24] ),
        .O(\addMaxVal1[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[25]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[25] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[25] ),
        .O(\addMaxVal1[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[26]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[26] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[26] ),
        .O(\addMaxVal1[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[27]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[27] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[27] ),
        .O(\addMaxVal1[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[28]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[28] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[28] ),
        .O(\addMaxVal1[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[29]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[29] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[29] ),
        .O(\addMaxVal1[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h40044444)) 
    \addMaxVal1[30]_i_1 
       (.I0(addEarlyOutBypassEnable0__0),
        .I1(addPipelineValidStage0),
        .I2(p_1_in),
        .I3(p_0_in),
        .I4(addSameNumberDifferentSigns0),
        .O(addMaxVal1));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[30]_i_2 
       (.I0(\addDenormFlushedValB_reg_n_0_[30] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[30] ),
        .O(\addMaxVal1[30]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addMaxVal1_reg[23] 
       (.C(clk),
        .CE(addMaxVal1),
        .D(\addMaxVal1[23]_i_1_n_0 ),
        .Q(\addMaxVal1_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addMaxVal1_reg[24] 
       (.C(clk),
        .CE(addMaxVal1),
        .D(\addMaxVal1[24]_i_1_n_0 ),
        .Q(\addMaxVal1_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addMaxVal1_reg[25] 
       (.C(clk),
        .CE(addMaxVal1),
        .D(\addMaxVal1[25]_i_1_n_0 ),
        .Q(\addMaxVal1_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addMaxVal1_reg[26] 
       (.C(clk),
        .CE(addMaxVal1),
        .D(\addMaxVal1[26]_i_1_n_0 ),
        .Q(\addMaxVal1_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addMaxVal1_reg[27] 
       (.C(clk),
        .CE(addMaxVal1),
        .D(\addMaxVal1[27]_i_1_n_0 ),
        .Q(\addMaxVal1_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addMaxVal1_reg[28] 
       (.C(clk),
        .CE(addMaxVal1),
        .D(\addMaxVal1[28]_i_1_n_0 ),
        .Q(\addMaxVal1_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addMaxVal1_reg[29] 
       (.C(clk),
        .CE(addMaxVal1),
        .D(\addMaxVal1[29]_i_1_n_0 ),
        .Q(\addMaxVal1_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addMaxVal1_reg[30] 
       (.C(clk),
        .CE(addMaxVal1),
        .D(\addMaxVal1[30]_i_2_n_0 ),
        .Q(\addMaxVal1_reg_n_0_[30] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    addPipelineValidStage0_reg
       (.C(clk),
        .CE(1'b1),
        .D(IADD_GO),
        .Q(addPipelineValidStage0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    addPipelineValidStage1_reg
       (.C(clk),
        .CE(1'b1),
        .D(addPipelineValidStage0),
        .Q(addPipelineValidStage1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    addPipelineValidStage2_reg
       (.C(clk),
        .CE(1'b1),
        .D(addPipelineValidStage1),
        .Q(addPipelineValidStage2),
        .R(1'b0));
  CARRY8 addPostAddMantissa10__22_carry
       (.CI(addPostAddMantissa10__22_carry_i_1_n_0),
        .CI_TOP(1'b0),
        .CO({addPostAddMantissa10__22_carry_n_0,addPostAddMantissa10__22_carry_n_1,addPostAddMantissa10__22_carry_n_2,addPostAddMantissa10__22_carry_n_3,addPostAddMantissa10__22_carry_n_4,addPostAddMantissa10__22_carry_n_5,addPostAddMantissa10__22_carry_n_6,addPostAddMantissa10__22_carry_n_7}),
        .DI({addPostAddMantissa10__22_carry_i_2__1_n_0,addPostAddMantissa10__22_carry_i_3__1_n_0,addPostAddMantissa10__22_carry_i_4__1_n_0,addPostAddMantissa10__22_carry_i_5__1_n_0,addPostAddMantissa10__22_carry_i_6__1_n_0,addPostAddMantissa10__22_carry_i_7__1_n_0,addPostAddMantissa10__22_carry_i_8__1_n_0,addPostAddMantissa10__22_carry_i_9__0_n_0}),
        .O({addPostAddMantissa10__22_carry_n_8,addPostAddMantissa10__22_carry_n_9,addPostAddMantissa10__22_carry_n_10,addPostAddMantissa10__22_carry_n_11,addPostAddMantissa10__22_carry_n_12,addPostAddMantissa10__22_carry_n_13,addPostAddMantissa10__22_carry_n_14,addPostAddMantissa10__22_carry_n_15}),
        .S({addPostAddMantissa10__22_carry_i_10__1_n_0,addPostAddMantissa10__22_carry_i_11__1_n_0,addPostAddMantissa10__22_carry_i_12__1_n_0,addPostAddMantissa10__22_carry_i_13__1_n_0,addPostAddMantissa10__22_carry_i_14__1_n_0,addPostAddMantissa10__22_carry_i_15__1_n_0,addPostAddMantissa10__22_carry_i_16__1_n_0,addPostAddMantissa10__22_carry_i_17__1_n_0}));
  CARRY8 addPostAddMantissa10__22_carry__0
       (.CI(addPostAddMantissa10__22_carry_n_0),
        .CI_TOP(1'b0),
        .CO({addPostAddMantissa10__22_carry__0_n_0,addPostAddMantissa10__22_carry__0_n_1,addPostAddMantissa10__22_carry__0_n_2,addPostAddMantissa10__22_carry__0_n_3,addPostAddMantissa10__22_carry__0_n_4,addPostAddMantissa10__22_carry__0_n_5,addPostAddMantissa10__22_carry__0_n_6,addPostAddMantissa10__22_carry__0_n_7}),
        .DI({addPostAddMantissa10__22_carry_i_1__2_n_0,addPostAddMantissa10__22_carry_i_2__0_n_0,addPostAddMantissa10__22_carry_i_3__0_n_0,addPostAddMantissa10__22_carry_i_4__0_n_0,addPostAddMantissa10__22_carry_i_5__0_n_0,addPostAddMantissa10__22_carry_i_6__0_n_0,addPostAddMantissa10__22_carry_i_7__0_n_0,addPostAddMantissa10__22_carry_i_8__0_n_0}),
        .O({addPostAddMantissa10__22_carry__0_n_8,addPostAddMantissa10__22_carry__0_n_9,addPostAddMantissa10__22_carry__0_n_10,addPostAddMantissa10__22_carry__0_n_11,addPostAddMantissa10__22_carry__0_n_12,addPostAddMantissa10__22_carry__0_n_13,addPostAddMantissa10__22_carry__0_n_14,addPostAddMantissa10__22_carry__0_n_15}),
        .S({addPostAddMantissa10__22_carry_i_9_n_0,addPostAddMantissa10__22_carry_i_10__0_n_0,addPostAddMantissa10__22_carry_i_11__0_n_0,addPostAddMantissa10__22_carry_i_12__0_n_0,addPostAddMantissa10__22_carry_i_13__0_n_0,addPostAddMantissa10__22_carry_i_14__0_n_0,addPostAddMantissa10__22_carry_i_15__0_n_0,addPostAddMantissa10__22_carry_i_16__0_n_0}));
  CARRY8 addPostAddMantissa10__22_carry__1
       (.CI(addPostAddMantissa10__22_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({addPostAddMantissa10__22_carry__1_n_0,addPostAddMantissa10__22_carry__1_n_1,addPostAddMantissa10__22_carry__1_n_2,addPostAddMantissa10__22_carry__1_n_3,addPostAddMantissa10__22_carry__1_n_4,addPostAddMantissa10__22_carry__1_n_5,addPostAddMantissa10__22_carry__1_n_6,addPostAddMantissa10__22_carry__1_n_7}),
        .DI({in,addPostAddMantissa10__22_carry_i_2_n_0,addPostAddMantissa10__22_carry_i_3_n_0,addPostAddMantissa10__22_carry_i_4_n_0,addPostAddMantissa10__22_carry_i_5_n_0,addPostAddMantissa10__22_carry_i_6_n_0,addPostAddMantissa10__22_carry_i_7_n_0,addPostAddMantissa10__22_carry_i_8_n_0}),
        .O({addPostAddMantissa10__22_carry__1_n_8,addPostAddMantissa10__22_carry__1_n_9,addPostAddMantissa10__22_carry__1_n_10,addPostAddMantissa10__22_carry__1_n_11,addPostAddMantissa10__22_carry__1_n_12,addPostAddMantissa10__22_carry__1_n_13,addPostAddMantissa10__22_carry__1_n_14,addPostAddMantissa10__22_carry__1_n_15}),
        .S({addPostAddMantissa10__22_carry_i_9__1_n_0,addPostAddMantissa10__22_carry_i_10_n_0,addPostAddMantissa10__22_carry_i_11_n_0,addPostAddMantissa10__22_carry_i_12_n_0,addPostAddMantissa10__22_carry_i_13_n_0,addPostAddMantissa10__22_carry_i_14_n_0,addPostAddMantissa10__22_carry_i_15_n_0,addPostAddMantissa10__22_carry_i_16_n_0}));
  CARRY8 addPostAddMantissa10__22_carry__2
       (.CI(addPostAddMantissa10__22_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_addPostAddMantissa10__22_carry__2_CO_UNCONNECTED[7:1],addPostAddMantissa10__22_carry__2_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addPostAddMantissa10__22_carry_i_1__1_n_0}),
        .O({NLW_addPostAddMantissa10__22_carry__2_O_UNCONNECTED[7:2],addPostAddMantissa10__22_carry__2_n_14,addPostAddMantissa10__22_carry__2_n_15}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,addPostAddMantissa10__22_carry_i_2__2_n_0}));
  LUT3 #(
    .INIT(8'hE2)) 
    addPostAddMantissa10__22_carry_i_1
       (.I0(p_1_in),
        .I1(addALessThanB),
        .I2(p_0_in),
        .O(addPostAddMantissa10__22_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_10
       (.I0(addPostAddMantissa10__22_carry_i_2_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_17__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_18__0_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_10_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_10__0
       (.I0(addPostAddMantissa10__22_carry_i_2__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_17_n_0),
        .I4(addPostAddMantissa10__22_carry_i_19_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_10__0_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_10__1
       (.I0(addPostAddMantissa10__22_carry_i_2__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_20_n_0),
        .I4(addPostAddMantissa10__22_carry_i_21_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_10__1_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_11
       (.I0(addPostAddMantissa10__22_carry_i_3_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_19__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_18__0_n_0),
        .I5(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_11_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_11__0
       (.I0(addPostAddMantissa10__22_carry_i_3__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_19_n_0),
        .I4(addPostAddMantissa10__22_carry_i_20__0_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_11__0_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_11__1
       (.I0(addPostAddMantissa10__22_carry_i_3__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_21_n_0),
        .I4(addPostAddMantissa10__22_carry_i_23_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_11__1_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_12
       (.I0(addPostAddMantissa10__22_carry_i_4_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_19__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_20__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_12_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_12__0
       (.I0(addPostAddMantissa10__22_carry_i_4__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_21__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_20__0_n_0),
        .I5(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_12__0_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_12__1
       (.I0(addPostAddMantissa10__22_carry_i_4__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_23_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_12__1_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_13
       (.I0(addPostAddMantissa10__22_carry_i_5_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_21__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_20__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_13_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_13__0
       (.I0(addPostAddMantissa10__22_carry_i_5__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_21__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_22_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_13__0_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_13__1
       (.I0(addPostAddMantissa10__22_carry_i_5__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_25_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24_n_0),
        .I5(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_13__1_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_14
       (.I0(addPostAddMantissa10__22_carry_i_6_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_22__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_21__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_14_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_14__0
       (.I0(addPostAddMantissa10__22_carry_i_6__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_22_n_0),
        .I4(addPostAddMantissa10__22_carry_i_23__0_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_14__0_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_14__1
       (.I0(addPostAddMantissa10__22_carry_i_6__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_25_n_0),
        .I4(addPostAddMantissa10__22_carry_i_26_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_14__1_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_15
       (.I0(addPostAddMantissa10__22_carry_i_7_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_23__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_22__0_n_0),
        .I5(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_15_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_15__0
       (.I0(addPostAddMantissa10__22_carry_i_7__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_24__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_23__0_n_0),
        .I5(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_15__0_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_15__1
       (.I0(addPostAddMantissa10__22_carry_i_7__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_27_n_0),
        .I4(addPostAddMantissa10__22_carry_i_26_n_0),
        .I5(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_15__1_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_16
       (.I0(addPostAddMantissa10__22_carry_i_8_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_18_n_0),
        .I4(addPostAddMantissa10__22_carry_i_23__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_16_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_16__0
       (.I0(addPostAddMantissa10__22_carry_i_8__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_20_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__0_n_0),
        .I5(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_16__0_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_16__1
       (.I0(addPostAddMantissa10__22_carry_i_8__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_27_n_0),
        .I4(addPostAddMantissa10__22_carry_i_28_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_16__1_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_17
       (.I0(addPostAddMantissa10__22_carry_i_25__0_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_26__0_n_0),
        .O(addPostAddMantissa10__22_carry_i_17_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFE00010001)) 
    addPostAddMantissa10__22_carry_i_17__0
       (.I0(addPostAddMantissa10__22_carry_i_40__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I2(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I4(\ADDStage1.mantissaMin0 [23]),
        .I5(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_17__0_n_0));
  LUT5 #(
    .INIT(32'h56565556)) 
    addPostAddMantissa10__22_carry_i_17__1
       (.I0(addPostAddMantissa10__22_carry_i_9__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_29_n_0),
        .I3(addPostAddMantissa10__22_carry_i_28_n_0),
        .I4(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_17__1_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_18
       (.I0(addPostAddMantissa10__22_carry_i_27__0_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_28__0_n_0),
        .O(addPostAddMantissa10__22_carry_i_18_n_0));
  LUT5 #(
    .INIT(32'hF0F1F0E0)) 
    addPostAddMantissa10__22_carry_i_18__0
       (.I0(addPostAddMantissa10__22_carry_i_40__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_28__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_18__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'hA808)) 
    addPostAddMantissa10__22_carry_i_18__1
       (.I0(addPostAddMantissa10__22_carry_i_30__1_n_0),
        .I1(p_0_in),
        .I2(addALessThanB),
        .I3(p_1_in),
        .O(addPostAddMantissa10__22_carry_i_18__1_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_19
       (.I0(addPostAddMantissa10__22_carry_i_28__0_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_29__0_n_0),
        .O(addPostAddMantissa10__22_carry_i_19_n_0));
  LUT6 #(
    .INIT(64'hFF00FB0BFF00F808)) 
    addPostAddMantissa10__22_carry_i_19__0
       (.I0(addPostAddMantissa10__22_carry_i_29__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_40__0_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_30__0_n_0),
        .O(addPostAddMantissa10__22_carry_i_19__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT2 #(
    .INIT(4'hB)) 
    addPostAddMantissa10__22_carry_i_19__1
       (.I0(addPostAddMantissa10__22_carry_i_30__1_n_0),
        .I1(addExponentDeltaAMinusB[0]),
        .O(addPostAddMantissa10__22_carry_i_19__1_n_0));
  LUT3 #(
    .INIT(8'h47)) 
    addPostAddMantissa10__22_carry_i_1__0
       (.I0(p_0_in),
        .I1(addALessThanB),
        .I2(p_1_in),
        .O(in));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_1__1
       (.I0(p_0_in),
        .I1(addALessThanB),
        .I2(p_1_in),
        .O(addPostAddMantissa10__22_carry_i_1__1_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_1__2
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[15] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[15] ),
        .O(addPostAddMantissa10__22_carry_i_1__2_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_2
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[22] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[22] ),
        .O(addPostAddMantissa10__22_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_20
       (.I0(addPostAddMantissa10__22_carry_i_31_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_32_n_0),
        .O(addPostAddMantissa10__22_carry_i_20_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_20__0
       (.I0(addPostAddMantissa10__22_carry_i_26__0_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_30_n_0),
        .O(addPostAddMantissa10__22_carry_i_20__0_n_0));
  LUT6 #(
    .INIT(64'hFF00FB0BFF00F808)) 
    addPostAddMantissa10__22_carry_i_20__1
       (.I0(addPostAddMantissa10__22_carry_i_28__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_40__0_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_31__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_20__1_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_21
       (.I0(addPostAddMantissa10__22_carry_i_33_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_34_n_0),
        .O(addPostAddMantissa10__22_carry_i_21_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_21__0
       (.I0(addPostAddMantissa10__22_carry_i_29__0_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_31__0_n_0),
        .O(addPostAddMantissa10__22_carry_i_21__0_n_0));
  LUT6 #(
    .INIT(64'hCDC8FFFFCDC80000)) 
    addPostAddMantissa10__22_carry_i_21__1
       (.I0(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_30__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_40__0_n_0),
        .I5(addPostAddMantissa10__22_carry_i_32__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_21__1_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_22
       (.I0(addPostAddMantissa10__22_carry_i_30_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_32__0_n_0),
        .O(addPostAddMantissa10__22_carry_i_22_n_0));
  LUT6 #(
    .INIT(64'hCDC8FFFFCDC80000)) 
    addPostAddMantissa10__22_carry_i_22__0
       (.I0(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_31__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_40__0_n_0),
        .I5(addPostAddMantissa10__22_carry_i_27__0_n_0),
        .O(addPostAddMantissa10__22_carry_i_22__0_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    addPostAddMantissa10__22_carry_i_22__1
       (.I0(addExponentDeltaAMinusB[0]),
        .I1(addPostAddMantissa10__22_carry_i_30__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_22__1_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_23
       (.I0(addPostAddMantissa10__22_carry_i_32_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_35_n_0),
        .O(addPostAddMantissa10__22_carry_i_23_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_23__0
       (.I0(addPostAddMantissa10__22_carry_i_31__0_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_31_n_0),
        .O(addPostAddMantissa10__22_carry_i_23__0_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_23__1
       (.I0(addPostAddMantissa10__22_carry_i_32__1_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_25__0_n_0),
        .O(addPostAddMantissa10__22_carry_i_23__1_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_24
       (.I0(addPostAddMantissa10__22_carry_i_34_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_36_n_0),
        .O(addPostAddMantissa10__22_carry_i_24_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_24__0
       (.I0(addPostAddMantissa10__22_carry_i_32__0_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_33_n_0),
        .O(addPostAddMantissa10__22_carry_i_24__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_24__1
       (.I0(addExponentDeltaBMinusA[3]),
        .I1(addALessThanB),
        .I2(addExponentDeltaAMinusB[3]),
        .O(addPostAddMantissa10__22_carry_i_24__1_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_25
       (.I0(addPostAddMantissa10__22_carry_i_35_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_37_n_0),
        .O(addPostAddMantissa10__22_carry_i_25_n_0));
  LUT6 #(
    .INIT(64'hFF00FB0BFF00F808)) 
    addPostAddMantissa10__22_carry_i_25__0
       (.I0(addPostAddMantissa10__22_carry_i_65_n_0),
        .I1(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I2(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_67_n_0),
        .O(addPostAddMantissa10__22_carry_i_25__0_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_25__1
       (.I0(addExponentDeltaBMinusA[4]),
        .I1(addALessThanB),
        .I2(addExponentDeltaAMinusB[4]),
        .O(addPostAddMantissa10__22_carry_i_25__1_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_26
       (.I0(addPostAddMantissa10__22_carry_i_36_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_38_n_0),
        .O(addPostAddMantissa10__22_carry_i_26_n_0));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    addPostAddMantissa10__22_carry_i_26__0
       (.I0(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_56_n_0),
        .I3(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_33__0_n_0),
        .O(addPostAddMantissa10__22_carry_i_26__0_n_0));
  CARRY8 addPostAddMantissa10__22_carry_i_26__1
       (.CI(addPostAddMantissa10__22_carry_i_33__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_addPostAddMantissa10__22_carry_i_26__1_CO_UNCONNECTED[7:6],\ADDStage1.mantissaMin0 [23],addPostAddMantissa10__22_carry_i_26__1_n_3,addPostAddMantissa10__22_carry_i_26__1_n_4,addPostAddMantissa10__22_carry_i_26__1_n_5,addPostAddMantissa10__22_carry_i_26__1_n_6,addPostAddMantissa10__22_carry_i_26__1_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_addPostAddMantissa10__22_carry_i_26__1_O_UNCONNECTED[7:6],\ADDStage1.mantissaMin0 [22:17]}),
        .S({1'b0,1'b0,addPostAddMantissa10__22_carry_i_34__1_n_0,addPostAddMantissa10__22_carry_i_35__1_n_0,addPostAddMantissa10__22_carry_i_36__0_n_0,addPostAddMantissa10__22_carry_i_37__0_n_0,addPostAddMantissa10__22_carry_i_38__0_n_0,addPostAddMantissa10__22_carry_i_39__0_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10__22_carry_i_27
       (.I0(addPostAddMantissa10__22_carry_i_37_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10__22_carry_i_39_n_0),
        .O(addPostAddMantissa10__22_carry_i_27_n_0));
  LUT6 #(
    .INIT(64'hFF00FB0BFF00F808)) 
    addPostAddMantissa10__22_carry_i_27__0
       (.I0(addPostAddMantissa10__22_carry_i_34__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I2(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_35__0_n_0),
        .O(addPostAddMantissa10__22_carry_i_27__0_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_27__1
       (.I0(p_1_in),
        .I1(addALessThanB),
        .I2(p_0_in),
        .O(addPostAddMantissa10__22_carry_i_27__1_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10__22_carry_i_28
       (.I0(addPostAddMantissa10__22_carry_i_38_n_0),
        .I1(addPostAddMantissa10__22_carry_i_40__0_n_0),
        .I2(addPostAddMantissa10__22_carry_i_41_n_0),
        .I3(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_43_n_0),
        .O(addPostAddMantissa10__22_carry_i_28_n_0));
  LUT6 #(
    .INIT(64'hFF00FB0BFF00F808)) 
    addPostAddMantissa10__22_carry_i_28__0
       (.I0(addPostAddMantissa10__22_carry_i_71_n_0),
        .I1(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I2(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_69_n_0),
        .O(addPostAddMantissa10__22_carry_i_28__0_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_28__1
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [22]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[22] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[22] ),
        .O(addPostAddMantissa10__22_carry_i_28__1_n_0));
  LUT6 #(
    .INIT(64'h00000000FFE200E2)) 
    addPostAddMantissa10__22_carry_i_29
       (.I0(addPostAddMantissa10__22_carry_i_44_n_0),
        .I1(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I2(addPostAddMantissa10__22_carry_i_45_n_0),
        .I3(addPostAddMantissa10__22_carry_i_40__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_39_n_0),
        .I5(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_29_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_29__0
       (.I0(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_48_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_28__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_47_n_0),
        .O(addPostAddMantissa10__22_carry_i_29__0_n_0));
  LUT6 #(
    .INIT(64'hFFB8CF8B77744747)) 
    addPostAddMantissa10__22_carry_i_29__1
       (.I0(addExponentDeltaBMinusA[4]),
        .I1(addALessThanB),
        .I2(addExponentDeltaAMinusB[4]),
        .I3(\ADDStage1.mantissaMin0 [23]),
        .I4(p_0_in),
        .I5(p_1_in),
        .O(addPostAddMantissa10__22_carry_i_29__1_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_2__0
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[14] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[14] ),
        .O(addPostAddMantissa10__22_carry_i_2__0_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_2__1
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[7] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[7] ),
        .O(addPostAddMantissa10__22_carry_i_2__1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    addPostAddMantissa10__22_carry_i_2__2
       (.I0(p_1_in),
        .I1(p_0_in),
        .O(addPostAddMantissa10__22_carry_i_2__2_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_3
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[21] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[21] ),
        .O(addPostAddMantissa10__22_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_30
       (.I0(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_54_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_30__0_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_53_n_0),
        .O(addPostAddMantissa10__22_carry_i_30_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_30__0
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [21]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[21] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[21] ),
        .O(addPostAddMantissa10__22_carry_i_30__0_n_0));
  LUT5 #(
    .INIT(32'h0000FFFE)) 
    addPostAddMantissa10__22_carry_i_30__1
       (.I0(addExponentDeltaAMinusB[6]),
        .I1(addExponentDeltaAMinusB[7]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[5]),
        .I4(addPostAddMantissa10__22_carry_i_46__0_n_0),
        .O(addPostAddMantissa10__22_carry_i_30__1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_31
       (.I0(addPostAddMantissa10__22_carry_i_28__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_47_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_48_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_49_n_0),
        .O(addPostAddMantissa10__22_carry_i_31_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_31__0
       (.I0(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_51_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_31__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_50_n_0),
        .O(addPostAddMantissa10__22_carry_i_31__0_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_31__1
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [20]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[20] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[20] ),
        .O(addPostAddMantissa10__22_carry_i_31__1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_32
       (.I0(addPostAddMantissa10__22_carry_i_31__1_n_0),
        .I1(addPostAddMantissa10__22_carry_i_50_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_51_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_52_n_0),
        .O(addPostAddMantissa10__22_carry_i_32_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10__22_carry_i_32__0
       (.I0(addPostAddMantissa10__22_carry_i_33__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I2(addPostAddMantissa10__22_carry_i_56_n_0),
        .I3(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_57_n_0),
        .O(addPostAddMantissa10__22_carry_i_32__0_n_0));
  LUT6 #(
    .INIT(64'hFF00FB0FFF00F80C)) 
    addPostAddMantissa10__22_carry_i_32__1
       (.I0(\ADDStage1.mantissaMin0 [23]),
        .I1(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I2(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_40_n_0),
        .O(addPostAddMantissa10__22_carry_i_32__1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_33
       (.I0(addPostAddMantissa10__22_carry_i_30__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_53_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_54_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_55_n_0),
        .O(addPostAddMantissa10__22_carry_i_33_n_0));
  LUT6 #(
    .INIT(64'hFBF80F0FFBF80C0C)) 
    addPostAddMantissa10__22_carry_i_33__0
       (.I0(\ADDStage1.mantissaMin0 [23]),
        .I1(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I3(\ADDStage1.mantissaMin0 [15]),
        .I4(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_36__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_33__0_n_0));
  CARRY8 addPostAddMantissa10__22_carry_i_33__1
       (.CI(addPostAddMantissa10__22_carry_i_73_n_0),
        .CI_TOP(1'b0),
        .CO({addPostAddMantissa10__22_carry_i_33__1_n_0,addPostAddMantissa10__22_carry_i_33__1_n_1,addPostAddMantissa10__22_carry_i_33__1_n_2,addPostAddMantissa10__22_carry_i_33__1_n_3,addPostAddMantissa10__22_carry_i_33__1_n_4,addPostAddMantissa10__22_carry_i_33__1_n_5,addPostAddMantissa10__22_carry_i_33__1_n_6,addPostAddMantissa10__22_carry_i_33__1_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\ADDStage1.mantissaMin0 [16:9]),
        .S({addPostAddMantissa10__22_carry_i_41__0_n_0,addPostAddMantissa10__22_carry_i_42_n_0,addPostAddMantissa10__22_carry_i_43__0_n_0,addPostAddMantissa10__22_carry_i_44__0_n_0,addPostAddMantissa10__22_carry_i_45__0_n_0,addPostAddMantissa10__22_carry_i_46_n_0,addPostAddMantissa10__22_carry_i_47__0_n_0,addPostAddMantissa10__22_carry_i_48__0_n_0}));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_34
       (.I0(addPostAddMantissa10__22_carry_i_56_n_0),
        .I1(addPostAddMantissa10__22_carry_i_57_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_58_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_59_n_0),
        .O(addPostAddMantissa10__22_carry_i_34_n_0));
  LUT6 #(
    .INIT(64'hBABF8A8FBAB08A80)) 
    addPostAddMantissa10__22_carry_i_34__0
       (.I0(\ADDStage1.mantissaMin0 [22]),
        .I1(p_1_in),
        .I2(addALessThanB),
        .I3(p_0_in),
        .I4(\addDenormFlushedValA_reg_n_0_[22] ),
        .I5(\addDenormFlushedValB_reg_n_0_[22] ),
        .O(addPostAddMantissa10__22_carry_i_34__0_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_34__1
       (.I0(\addDenormFlushedValB_reg_n_0_[22] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[22] ),
        .O(addPostAddMantissa10__22_carry_i_34__1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_35
       (.I0(addPostAddMantissa10__22_carry_i_48_n_0),
        .I1(addPostAddMantissa10__22_carry_i_49_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_47_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_60_n_0),
        .O(addPostAddMantissa10__22_carry_i_35_n_0));
  LUT6 #(
    .INIT(64'hBABF8A8FBAB08A80)) 
    addPostAddMantissa10__22_carry_i_35__0
       (.I0(\ADDStage1.mantissaMin0 [18]),
        .I1(p_1_in),
        .I2(addALessThanB),
        .I3(p_0_in),
        .I4(\addDenormFlushedValA_reg_n_0_[18] ),
        .I5(\addDenormFlushedValB_reg_n_0_[18] ),
        .O(addPostAddMantissa10__22_carry_i_35__0_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_35__1
       (.I0(\addDenormFlushedValB_reg_n_0_[21] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[21] ),
        .O(addPostAddMantissa10__22_carry_i_35__1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_36
       (.I0(addPostAddMantissa10__22_carry_i_54_n_0),
        .I1(addPostAddMantissa10__22_carry_i_55_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_53_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_61_n_0),
        .O(addPostAddMantissa10__22_carry_i_36_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_36__0
       (.I0(\addDenormFlushedValB_reg_n_0_[20] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[20] ),
        .O(addPostAddMantissa10__22_carry_i_36__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_36__1
       (.I0(\addDenormFlushedValA_reg_n_0_[15] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[15] ),
        .O(addPostAddMantissa10__22_carry_i_36__1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_37
       (.I0(addPostAddMantissa10__22_carry_i_51_n_0),
        .I1(addPostAddMantissa10__22_carry_i_52_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_50_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_62_n_0),
        .O(addPostAddMantissa10__22_carry_i_37_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_37__0
       (.I0(\addDenormFlushedValB_reg_n_0_[19] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[19] ),
        .O(addPostAddMantissa10__22_carry_i_37__0_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_38
       (.I0(addPostAddMantissa10__22_carry_i_58_n_0),
        .I1(addPostAddMantissa10__22_carry_i_59_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_57_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_63_n_0),
        .O(addPostAddMantissa10__22_carry_i_38_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_38__0
       (.I0(\addDenormFlushedValB_reg_n_0_[18] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[18] ),
        .O(addPostAddMantissa10__22_carry_i_38__0_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_39
       (.I0(addPostAddMantissa10__22_carry_i_47_n_0),
        .I1(addPostAddMantissa10__22_carry_i_60_n_0),
        .I2(addPostAddMantissa10__22_carry_i_42__0_n_0),
        .I3(addPostAddMantissa10__22_carry_i_49_n_0),
        .I4(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_64_n_0),
        .O(addPostAddMantissa10__22_carry_i_39_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_39__0
       (.I0(\addDenormFlushedValB_reg_n_0_[17] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[17] ),
        .O(addPostAddMantissa10__22_carry_i_39__0_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_3__0
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[13] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[13] ),
        .O(addPostAddMantissa10__22_carry_i_3__0_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_3__1
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[6] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[6] ),
        .O(addPostAddMantissa10__22_carry_i_3__1_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_4
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[20] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[20] ),
        .O(addPostAddMantissa10__22_carry_i_4_n_0));
  LUT6 #(
    .INIT(64'hBABF8A8FBAB08A80)) 
    addPostAddMantissa10__22_carry_i_40
       (.I0(\ADDStage1.mantissaMin0 [19]),
        .I1(p_1_in),
        .I2(addALessThanB),
        .I3(p_0_in),
        .I4(\addDenormFlushedValA_reg_n_0_[19] ),
        .I5(\addDenormFlushedValB_reg_n_0_[19] ),
        .O(addPostAddMantissa10__22_carry_i_40_n_0));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_40__0
       (.I0(addExponentDeltaBMinusA[1]),
        .I1(addALessThanB),
        .I2(addExponentDeltaAMinusB[1]),
        .O(addPostAddMantissa10__22_carry_i_40__0_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10__22_carry_i_41
       (.I0(addPostAddMantissa10__22_carry_i_53_n_0),
        .I1(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_65_n_0),
        .I3(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_66_n_0),
        .O(addPostAddMantissa10__22_carry_i_41_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_41__0
       (.I0(\addDenormFlushedValB_reg_n_0_[16] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[16] ),
        .O(addPostAddMantissa10__22_carry_i_41__0_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_42
       (.I0(\addDenormFlushedValB_reg_n_0_[15] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[15] ),
        .O(addPostAddMantissa10__22_carry_i_42_n_0));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_42__0
       (.I0(addExponentDeltaBMinusA[2]),
        .I1(addALessThanB),
        .I2(addExponentDeltaAMinusB[2]),
        .O(addPostAddMantissa10__22_carry_i_42__0_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10__22_carry_i_43
       (.I0(addPostAddMantissa10__22_carry_i_55_n_0),
        .I1(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_67_n_0),
        .I3(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_68_n_0),
        .O(addPostAddMantissa10__22_carry_i_43_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_43__0
       (.I0(\addDenormFlushedValB_reg_n_0_[14] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[14] ),
        .O(addPostAddMantissa10__22_carry_i_43__0_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10__22_carry_i_44
       (.I0(addPostAddMantissa10__22_carry_i_52_n_0),
        .I1(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_69_n_0),
        .I3(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_70_n_0),
        .O(addPostAddMantissa10__22_carry_i_44_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_44__0
       (.I0(\addDenormFlushedValB_reg_n_0_[13] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[13] ),
        .O(addPostAddMantissa10__22_carry_i_44__0_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10__22_carry_i_45
       (.I0(addPostAddMantissa10__22_carry_i_50_n_0),
        .I1(addPostAddMantissa10__22_carry_i_24__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_71_n_0),
        .I3(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_72_n_0),
        .O(addPostAddMantissa10__22_carry_i_45_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_45__0
       (.I0(\addDenormFlushedValB_reg_n_0_[12] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[12] ),
        .O(addPostAddMantissa10__22_carry_i_45__0_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_46
       (.I0(\addDenormFlushedValB_reg_n_0_[11] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[11] ),
        .O(addPostAddMantissa10__22_carry_i_46_n_0));
  LUT4 #(
    .INIT(16'h0010)) 
    addPostAddMantissa10__22_carry_i_46__0
       (.I0(addExponentDeltaBMinusA[6]),
        .I1(addExponentDeltaBMinusA[5]),
        .I2(addALessThanB),
        .I3(addExponentDeltaBMinusA[7]),
        .O(addPostAddMantissa10__22_carry_i_46__0_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_47
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [14]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[14] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[14] ),
        .O(addPostAddMantissa10__22_carry_i_47_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_47__0
       (.I0(\addDenormFlushedValB_reg_n_0_[10] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[10] ),
        .O(addPostAddMantissa10__22_carry_i_47__0_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_48
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [18]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[18] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[18] ),
        .O(addPostAddMantissa10__22_carry_i_48_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_48__0
       (.I0(\addDenormFlushedValB_reg_n_0_[9] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[9] ),
        .O(addPostAddMantissa10__22_carry_i_48__0_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_49
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [10]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[10] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[10] ),
        .O(addPostAddMantissa10__22_carry_i_49_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_4__0
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[12] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[12] ),
        .O(addPostAddMantissa10__22_carry_i_4__0_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_4__1
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[5] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[5] ),
        .O(addPostAddMantissa10__22_carry_i_4__1_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_5
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[19] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[19] ),
        .O(addPostAddMantissa10__22_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_50
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [12]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[12] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[12] ),
        .O(addPostAddMantissa10__22_carry_i_50_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_51
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [16]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[16] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[16] ),
        .O(addPostAddMantissa10__22_carry_i_51_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_52
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [8]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[8] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[8] ),
        .O(addPostAddMantissa10__22_carry_i_52_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_53
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [13]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[13] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[13] ),
        .O(addPostAddMantissa10__22_carry_i_53_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_54
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [17]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[17] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[17] ),
        .O(addPostAddMantissa10__22_carry_i_54_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_55
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [9]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[9] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[9] ),
        .O(addPostAddMantissa10__22_carry_i_55_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_56
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [19]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[19] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[19] ),
        .O(addPostAddMantissa10__22_carry_i_56_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_57
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [11]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[11] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[11] ),
        .O(addPostAddMantissa10__22_carry_i_57_n_0));
  LUT6 #(
    .INIT(64'hE5E0E5E5E5E0E0E0)) 
    addPostAddMantissa10__22_carry_i_58
       (.I0(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I1(\ADDStage1.mantissaMin0 [15]),
        .I2(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I3(\addDenormFlushedValA_reg_n_0_[15] ),
        .I4(addALessThanB),
        .I5(\addDenormFlushedValB_reg_n_0_[15] ),
        .O(addPostAddMantissa10__22_carry_i_58_n_0));
  LUT5 #(
    .INIT(32'hB8FFB8CC)) 
    addPostAddMantissa10__22_carry_i_59
       (.I0(\ADDStage1.mantissaMin0 [23]),
        .I1(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I2(\ADDStage1.mantissaMin0 [7]),
        .I3(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I4(addPostAddMantissa10__22_carry_i_74_n_0),
        .O(addPostAddMantissa10__22_carry_i_59_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_5__0
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[11] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[11] ),
        .O(addPostAddMantissa10__22_carry_i_5__0_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_5__1
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[4] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[4] ),
        .O(addPostAddMantissa10__22_carry_i_5__1_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_6
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[18] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[18] ),
        .O(addPostAddMantissa10__22_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_60
       (.I0(\ADDStage1.mantissaMin0 [22]),
        .I1(addPostAddMantissa10__22_carry_i_75_n_0),
        .I2(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I3(\ADDStage1.mantissaMin0 [6]),
        .I4(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_76_n_0),
        .O(addPostAddMantissa10__22_carry_i_60_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_61
       (.I0(\ADDStage1.mantissaMin0 [21]),
        .I1(addPostAddMantissa10__22_carry_i_77_n_0),
        .I2(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I3(\ADDStage1.mantissaMin0 [5]),
        .I4(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_78_n_0),
        .O(addPostAddMantissa10__22_carry_i_61_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_62
       (.I0(\ADDStage1.mantissaMin0 [20]),
        .I1(addPostAddMantissa10__22_carry_i_79_n_0),
        .I2(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I3(\ADDStage1.mantissaMin0 [4]),
        .I4(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_80_n_0),
        .O(addPostAddMantissa10__22_carry_i_62_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_63
       (.I0(\ADDStage1.mantissaMin0 [19]),
        .I1(addPostAddMantissa10__22_carry_i_81_n_0),
        .I2(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I3(\ADDStage1.mantissaMin0 [3]),
        .I4(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_82_n_0),
        .O(addPostAddMantissa10__22_carry_i_63_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10__22_carry_i_64
       (.I0(\ADDStage1.mantissaMin0 [18]),
        .I1(addPostAddMantissa10__22_carry_i_83_n_0),
        .I2(addPostAddMantissa10__22_carry_i_25__1_n_0),
        .I3(\ADDStage1.mantissaMin0 [2]),
        .I4(addPostAddMantissa10__22_carry_i_27__1_n_0),
        .I5(addPostAddMantissa10__22_carry_i_84_n_0),
        .O(addPostAddMantissa10__22_carry_i_64_n_0));
  LUT6 #(
    .INIT(64'hBABF8A8FBAB08A80)) 
    addPostAddMantissa10__22_carry_i_65
       (.I0(\ADDStage1.mantissaMin0 [21]),
        .I1(p_1_in),
        .I2(addALessThanB),
        .I3(p_0_in),
        .I4(\addDenormFlushedValA_reg_n_0_[21] ),
        .I5(\addDenormFlushedValB_reg_n_0_[21] ),
        .O(addPostAddMantissa10__22_carry_i_65_n_0));
  LUT6 #(
    .INIT(64'hBABF8A8FBAB08A80)) 
    addPostAddMantissa10__22_carry_i_66
       (.I0(\ADDStage1.mantissaMin0 [5]),
        .I1(p_1_in),
        .I2(addALessThanB),
        .I3(p_0_in),
        .I4(\addDenormFlushedValA_reg_n_0_[5] ),
        .I5(\addDenormFlushedValB_reg_n_0_[5] ),
        .O(addPostAddMantissa10__22_carry_i_66_n_0));
  LUT6 #(
    .INIT(64'hBABF8A8FBAB08A80)) 
    addPostAddMantissa10__22_carry_i_67
       (.I0(\ADDStage1.mantissaMin0 [17]),
        .I1(p_1_in),
        .I2(addALessThanB),
        .I3(p_0_in),
        .I4(\addDenormFlushedValA_reg_n_0_[17] ),
        .I5(\addDenormFlushedValB_reg_n_0_[17] ),
        .O(addPostAddMantissa10__22_carry_i_67_n_0));
  LUT6 #(
    .INIT(64'hBABF8A8FBAB08A80)) 
    addPostAddMantissa10__22_carry_i_68
       (.I0(\ADDStage1.mantissaMin0 [1]),
        .I1(p_1_in),
        .I2(addALessThanB),
        .I3(p_0_in),
        .I4(\addDenormFlushedValA_reg_n_0_[1] ),
        .I5(\addDenormFlushedValB_reg_n_0_[1] ),
        .O(addPostAddMantissa10__22_carry_i_68_n_0));
  LUT6 #(
    .INIT(64'hBABF8A8FBAB08A80)) 
    addPostAddMantissa10__22_carry_i_69
       (.I0(\ADDStage1.mantissaMin0 [16]),
        .I1(p_1_in),
        .I2(addALessThanB),
        .I3(p_0_in),
        .I4(\addDenormFlushedValA_reg_n_0_[16] ),
        .I5(\addDenormFlushedValB_reg_n_0_[16] ),
        .O(addPostAddMantissa10__22_carry_i_69_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_6__0
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[10] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[10] ),
        .O(addPostAddMantissa10__22_carry_i_6__0_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_6__1
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[3] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[3] ),
        .O(addPostAddMantissa10__22_carry_i_6__1_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_7
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[17] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[17] ),
        .O(addPostAddMantissa10__22_carry_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_70
       (.I0(\addDenormFlushedValA_reg_n_0_[0] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[0] ),
        .O(addPostAddMantissa10__22_carry_i_70_n_0));
  LUT6 #(
    .INIT(64'hBABF8A8FBAB08A80)) 
    addPostAddMantissa10__22_carry_i_71
       (.I0(\ADDStage1.mantissaMin0 [20]),
        .I1(p_1_in),
        .I2(addALessThanB),
        .I3(p_0_in),
        .I4(\addDenormFlushedValA_reg_n_0_[20] ),
        .I5(\addDenormFlushedValB_reg_n_0_[20] ),
        .O(addPostAddMantissa10__22_carry_i_71_n_0));
  LUT6 #(
    .INIT(64'hBABF8A8FBAB08A80)) 
    addPostAddMantissa10__22_carry_i_72
       (.I0(\ADDStage1.mantissaMin0 [4]),
        .I1(p_1_in),
        .I2(addALessThanB),
        .I3(p_0_in),
        .I4(\addDenormFlushedValA_reg_n_0_[4] ),
        .I5(\addDenormFlushedValB_reg_n_0_[4] ),
        .O(addPostAddMantissa10__22_carry_i_72_n_0));
  CARRY8 addPostAddMantissa10__22_carry_i_73
       (.CI(addPostAddMantissa10__22_carry_i_85_n_0),
        .CI_TOP(1'b0),
        .CO({addPostAddMantissa10__22_carry_i_73_n_0,addPostAddMantissa10__22_carry_i_73_n_1,addPostAddMantissa10__22_carry_i_73_n_2,addPostAddMantissa10__22_carry_i_73_n_3,addPostAddMantissa10__22_carry_i_73_n_4,addPostAddMantissa10__22_carry_i_73_n_5,addPostAddMantissa10__22_carry_i_73_n_6,addPostAddMantissa10__22_carry_i_73_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\ADDStage1.mantissaMin0 [8:1]),
        .S({addPostAddMantissa10__22_carry_i_86_n_0,addPostAddMantissa10__22_carry_i_87_n_0,addPostAddMantissa10__22_carry_i_88_n_0,addPostAddMantissa10__22_carry_i_89_n_0,addPostAddMantissa10__22_carry_i_90_n_0,addPostAddMantissa10__22_carry_i_91_n_0,addPostAddMantissa10__22_carry_i_92_n_0,addPostAddMantissa10__22_carry_i_93_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_74
       (.I0(\addDenormFlushedValA_reg_n_0_[7] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[7] ),
        .O(addPostAddMantissa10__22_carry_i_74_n_0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_75
       (.I0(\addDenormFlushedValA_reg_n_0_[22] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[22] ),
        .O(addPostAddMantissa10__22_carry_i_75_n_0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_76
       (.I0(\addDenormFlushedValA_reg_n_0_[6] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[6] ),
        .O(addPostAddMantissa10__22_carry_i_76_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_77
       (.I0(\addDenormFlushedValA_reg_n_0_[21] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[21] ),
        .O(addPostAddMantissa10__22_carry_i_77_n_0));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_78
       (.I0(\addDenormFlushedValA_reg_n_0_[5] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[5] ),
        .O(addPostAddMantissa10__22_carry_i_78_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_79
       (.I0(\addDenormFlushedValA_reg_n_0_[20] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[20] ),
        .O(addPostAddMantissa10__22_carry_i_79_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_7__0
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[9] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[9] ),
        .O(addPostAddMantissa10__22_carry_i_7__0_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_7__1
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[2] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[2] ),
        .O(addPostAddMantissa10__22_carry_i_7__1_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_8
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[16] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[16] ),
        .O(addPostAddMantissa10__22_carry_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_80
       (.I0(\addDenormFlushedValA_reg_n_0_[4] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[4] ),
        .O(addPostAddMantissa10__22_carry_i_80_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_81
       (.I0(\addDenormFlushedValA_reg_n_0_[19] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[19] ),
        .O(addPostAddMantissa10__22_carry_i_81_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_82
       (.I0(\addDenormFlushedValA_reg_n_0_[3] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[3] ),
        .O(addPostAddMantissa10__22_carry_i_82_n_0));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_83
       (.I0(\addDenormFlushedValA_reg_n_0_[18] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[18] ),
        .O(addPostAddMantissa10__22_carry_i_83_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10__22_carry_i_84
       (.I0(\addDenormFlushedValA_reg_n_0_[2] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[2] ),
        .O(addPostAddMantissa10__22_carry_i_84_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_85
       (.I0(\addDenormFlushedValB_reg_n_0_[0] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[0] ),
        .O(addPostAddMantissa10__22_carry_i_85_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_86
       (.I0(\addDenormFlushedValB_reg_n_0_[8] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[8] ),
        .O(addPostAddMantissa10__22_carry_i_86_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_87
       (.I0(\addDenormFlushedValB_reg_n_0_[7] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[7] ),
        .O(addPostAddMantissa10__22_carry_i_87_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_88
       (.I0(\addDenormFlushedValB_reg_n_0_[6] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[6] ),
        .O(addPostAddMantissa10__22_carry_i_88_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_89
       (.I0(\addDenormFlushedValB_reg_n_0_[5] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[5] ),
        .O(addPostAddMantissa10__22_carry_i_89_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_8__0
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[8] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[8] ),
        .O(addPostAddMantissa10__22_carry_i_8__0_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_8__1
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[1] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[1] ),
        .O(addPostAddMantissa10__22_carry_i_8__1_n_0));
  LUT6 #(
    .INIT(64'h6566656655556566)) 
    addPostAddMantissa10__22_carry_i_9
       (.I0(addPostAddMantissa10__22_carry_i_1__2_n_0),
        .I1(addPostAddMantissa10__22_carry_i_18__1_n_0),
        .I2(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I3(addPostAddMantissa10__22_carry_i_17_n_0),
        .I4(addPostAddMantissa10__22_carry_i_18_n_0),
        .I5(addPostAddMantissa10__22_carry_i_19__1_n_0),
        .O(addPostAddMantissa10__22_carry_i_9_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_90
       (.I0(\addDenormFlushedValB_reg_n_0_[4] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[4] ),
        .O(addPostAddMantissa10__22_carry_i_90_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_91
       (.I0(\addDenormFlushedValB_reg_n_0_[3] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[3] ),
        .O(addPostAddMantissa10__22_carry_i_91_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_92
       (.I0(\addDenormFlushedValB_reg_n_0_[2] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[2] ),
        .O(addPostAddMantissa10__22_carry_i_92_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10__22_carry_i_93
       (.I0(\addDenormFlushedValB_reg_n_0_[1] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[1] ),
        .O(addPostAddMantissa10__22_carry_i_93_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10__22_carry_i_9__0
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[0] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[0] ),
        .O(addPostAddMantissa10__22_carry_i_9__0_n_0));
  LUT5 #(
    .INIT(32'hE1E22D1D)) 
    addPostAddMantissa10__22_carry_i_9__1
       (.I0(addPostAddMantissa10__22_carry_i_17__0_n_0),
        .I1(addPostAddMantissa10__22_carry_i_22__1_n_0),
        .I2(p_0_in),
        .I3(addALessThanB),
        .I4(p_1_in),
        .O(addPostAddMantissa10__22_carry_i_9__1_n_0));
  LUT4 #(
    .INIT(16'h02A2)) 
    \addPostAddMantissa1[25]_i_1 
       (.I0(addMaxVal1),
        .I1(addExponentDeltaAMinusBShiftTooFar),
        .I2(addALessThanB),
        .I3(addExponentDeltaBMinusAShiftTooFar),
        .O(addPostAddMantissa1));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[0] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry_n_15),
        .Q(\addPostAddMantissa1_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[10] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__0_n_13),
        .Q(\addPostAddMantissa1_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[11] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__0_n_12),
        .Q(\addPostAddMantissa1_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[12] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__0_n_11),
        .Q(\addPostAddMantissa1_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[13] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__0_n_10),
        .Q(\addPostAddMantissa1_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[14] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__0_n_9),
        .Q(\addPostAddMantissa1_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[15] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__0_n_8),
        .Q(\addPostAddMantissa1_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[16] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__1_n_15),
        .Q(\addPostAddMantissa1_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[17] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__1_n_14),
        .Q(\addPostAddMantissa1_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[18] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__1_n_13),
        .Q(\addPostAddMantissa1_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[19] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__1_n_12),
        .Q(\addPostAddMantissa1_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[1] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry_n_14),
        .Q(\addPostAddMantissa1_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[20] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__1_n_11),
        .Q(\addPostAddMantissa1_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[21] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__1_n_10),
        .Q(\addPostAddMantissa1_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[22] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__1_n_9),
        .Q(\addPostAddMantissa1_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[23] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__1_n_8),
        .Q(\addPostAddMantissa1_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[24] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__2_n_15),
        .Q(\addPostAddMantissa1_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[25] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__2_n_14),
        .Q(\addPostAddMantissa1_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[2] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry_n_13),
        .Q(\addPostAddMantissa1_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[3] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry_n_12),
        .Q(\addPostAddMantissa1_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[4] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry_n_11),
        .Q(\addPostAddMantissa1_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[5] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry_n_10),
        .Q(\addPostAddMantissa1_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[6] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry_n_9),
        .Q(\addPostAddMantissa1_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[7] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry_n_8),
        .Q(\addPostAddMantissa1_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[8] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__0_n_15),
        .Q(\addPostAddMantissa1_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[9] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10__22_carry__0_n_14),
        .Q(\addPostAddMantissa1_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFF00AAAAE2E2E2E2)) 
    \addPostAddMantissa[0]_i_1 
       (.I0(\addPostAddMantissa1_reg_n_0_[0] ),
        .I1(\addPostAddMantissa1_reg_n_0_[24] ),
        .I2(\addPostAddMantissa1_reg_n_0_[1] ),
        .I3(\ADDStage2.postAddMantissa0 [1]),
        .I4(\ADDStage2.postAddMantissa0 [24]),
        .I5(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[10]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [11]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [10]),
        .I4(\addPostAddMantissa[10]_i_2_n_0 ),
        .O(\addPostAddMantissa[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[10]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[11] ),
        .I1(\addPostAddMantissa1_reg_n_0_[10] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[10]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[11]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [12]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [11]),
        .I4(\addPostAddMantissa[11]_i_2_n_0 ),
        .O(\addPostAddMantissa[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[11]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[12] ),
        .I1(\addPostAddMantissa1_reg_n_0_[11] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[12]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [13]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [12]),
        .I4(\addPostAddMantissa[12]_i_2_n_0 ),
        .O(\addPostAddMantissa[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[12]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[13] ),
        .I1(\addPostAddMantissa1_reg_n_0_[12] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[12]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[13]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [14]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [13]),
        .I4(\addPostAddMantissa[13]_i_2_n_0 ),
        .O(\addPostAddMantissa[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[13]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[14] ),
        .I1(\addPostAddMantissa1_reg_n_0_[13] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[13]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[14]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [15]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [14]),
        .I4(\addPostAddMantissa[14]_i_2_n_0 ),
        .O(\addPostAddMantissa[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[14]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[15] ),
        .I1(\addPostAddMantissa1_reg_n_0_[14] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[14]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[15]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [16]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [15]),
        .I4(\addPostAddMantissa[15]_i_2_n_0 ),
        .O(\addPostAddMantissa[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[15]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[16] ),
        .I1(\addPostAddMantissa1_reg_n_0_[15] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[16]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [17]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [16]),
        .I4(\addPostAddMantissa[16]_i_3_n_0 ),
        .O(\addPostAddMantissa[16]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[16]_i_10 
       (.I0(\addPostAddMantissa1_reg_n_0_[10] ),
        .O(\addPostAddMantissa[16]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[16]_i_11 
       (.I0(\addPostAddMantissa1_reg_n_0_[9] ),
        .O(\addPostAddMantissa[16]_i_11_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[16]_i_3 
       (.I0(\addPostAddMantissa1_reg_n_0_[17] ),
        .I1(\addPostAddMantissa1_reg_n_0_[16] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[16]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[16]_i_4 
       (.I0(\addPostAddMantissa1_reg_n_0_[16] ),
        .O(\addPostAddMantissa[16]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[16]_i_5 
       (.I0(\addPostAddMantissa1_reg_n_0_[15] ),
        .O(\addPostAddMantissa[16]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[16]_i_6 
       (.I0(\addPostAddMantissa1_reg_n_0_[14] ),
        .O(\addPostAddMantissa[16]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[16]_i_7 
       (.I0(\addPostAddMantissa1_reg_n_0_[13] ),
        .O(\addPostAddMantissa[16]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[16]_i_8 
       (.I0(\addPostAddMantissa1_reg_n_0_[12] ),
        .O(\addPostAddMantissa[16]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[16]_i_9 
       (.I0(\addPostAddMantissa1_reg_n_0_[11] ),
        .O(\addPostAddMantissa[16]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[17]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [18]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [17]),
        .I4(\addPostAddMantissa[17]_i_2_n_0 ),
        .O(\addPostAddMantissa[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[17]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[18] ),
        .I1(\addPostAddMantissa1_reg_n_0_[17] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[17]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[18]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [19]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [18]),
        .I4(\addPostAddMantissa[18]_i_2_n_0 ),
        .O(\addPostAddMantissa[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[18]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[19] ),
        .I1(\addPostAddMantissa1_reg_n_0_[18] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[18]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[19]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [20]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [19]),
        .I4(\addPostAddMantissa[19]_i_2_n_0 ),
        .O(\addPostAddMantissa[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[19]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[20] ),
        .I1(\addPostAddMantissa1_reg_n_0_[19] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[19]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[1]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [2]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [1]),
        .I4(\addPostAddMantissa[1]_i_2_n_0 ),
        .O(\addPostAddMantissa[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[1]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[2] ),
        .I1(\addPostAddMantissa1_reg_n_0_[1] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[20]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [21]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [20]),
        .I4(\addPostAddMantissa[20]_i_2_n_0 ),
        .O(\addPostAddMantissa[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[20]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[21] ),
        .I1(\addPostAddMantissa1_reg_n_0_[20] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[20]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[21]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [22]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [21]),
        .I4(\addPostAddMantissa[21]_i_2_n_0 ),
        .O(\addPostAddMantissa[21]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[21]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[22] ),
        .I1(\addPostAddMantissa1_reg_n_0_[21] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[21]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[22]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [23]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [22]),
        .I4(\addPostAddMantissa[22]_i_2_n_0 ),
        .O(\addPostAddMantissa[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[22]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[23] ),
        .I1(\addPostAddMantissa1_reg_n_0_[22] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[22]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[2]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [3]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [2]),
        .I4(\addPostAddMantissa[2]_i_2_n_0 ),
        .O(\addPostAddMantissa[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[2]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[3] ),
        .I1(\addPostAddMantissa1_reg_n_0_[2] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[3]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [4]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [3]),
        .I4(\addPostAddMantissa[3]_i_2_n_0 ),
        .O(\addPostAddMantissa[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[3]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[4] ),
        .I1(\addPostAddMantissa1_reg_n_0_[3] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[4]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [5]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [4]),
        .I4(\addPostAddMantissa[4]_i_2_n_0 ),
        .O(\addPostAddMantissa[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[4]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[5] ),
        .I1(\addPostAddMantissa1_reg_n_0_[4] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[5]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [6]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [5]),
        .I4(\addPostAddMantissa[5]_i_2_n_0 ),
        .O(\addPostAddMantissa[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[5]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[6] ),
        .I1(\addPostAddMantissa1_reg_n_0_[5] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[6]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [7]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [6]),
        .I4(\addPostAddMantissa[6]_i_2_n_0 ),
        .O(\addPostAddMantissa[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[6]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[7] ),
        .I1(\addPostAddMantissa1_reg_n_0_[6] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[7]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [8]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [7]),
        .I4(\addPostAddMantissa[7]_i_2_n_0 ),
        .O(\addPostAddMantissa[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[7]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[8] ),
        .I1(\addPostAddMantissa1_reg_n_0_[7] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[8]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [9]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [8]),
        .I4(\addPostAddMantissa[8]_i_3_n_0 ),
        .O(\addPostAddMantissa[8]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[8]_i_10 
       (.I0(\addPostAddMantissa1_reg_n_0_[3] ),
        .O(\addPostAddMantissa[8]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[8]_i_11 
       (.I0(\addPostAddMantissa1_reg_n_0_[2] ),
        .O(\addPostAddMantissa[8]_i_11_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[8]_i_12 
       (.I0(\addPostAddMantissa1_reg_n_0_[1] ),
        .O(\addPostAddMantissa[8]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[8]_i_3 
       (.I0(\addPostAddMantissa1_reg_n_0_[9] ),
        .I1(\addPostAddMantissa1_reg_n_0_[8] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[8]_i_4 
       (.I0(\addPostAddMantissa1_reg_n_0_[0] ),
        .O(\addPostAddMantissa[8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[8]_i_5 
       (.I0(\addPostAddMantissa1_reg_n_0_[8] ),
        .O(\addPostAddMantissa[8]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[8]_i_6 
       (.I0(\addPostAddMantissa1_reg_n_0_[7] ),
        .O(\addPostAddMantissa[8]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[8]_i_7 
       (.I0(\addPostAddMantissa1_reg_n_0_[6] ),
        .O(\addPostAddMantissa[8]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[8]_i_8 
       (.I0(\addPostAddMantissa1_reg_n_0_[5] ),
        .O(\addPostAddMantissa[8]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addPostAddMantissa[8]_i_9 
       (.I0(\addPostAddMantissa1_reg_n_0_[4] ),
        .O(\addPostAddMantissa[8]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[9]_i_1 
       (.I0(\ADDStage2.postAddMantissa0 [10]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [9]),
        .I4(\addPostAddMantissa[9]_i_2_n_0 ),
        .O(\addPostAddMantissa[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[9]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[10] ),
        .I1(\addPostAddMantissa1_reg_n_0_[9] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[0] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[0]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[10] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[10]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[11] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[11]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[12] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[12]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[13] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[13]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[14] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[14]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[15] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[15]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[16] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[16]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[16] ),
        .R(1'b0));
  CARRY8 \addPostAddMantissa_reg[16]_i_2 
       (.CI(\addPostAddMantissa_reg[8]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\addPostAddMantissa_reg[16]_i_2_n_0 ,\addPostAddMantissa_reg[16]_i_2_n_1 ,\addPostAddMantissa_reg[16]_i_2_n_2 ,\addPostAddMantissa_reg[16]_i_2_n_3 ,\addPostAddMantissa_reg[16]_i_2_n_4 ,\addPostAddMantissa_reg[16]_i_2_n_5 ,\addPostAddMantissa_reg[16]_i_2_n_6 ,\addPostAddMantissa_reg[16]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\ADDStage2.postAddMantissa0 [16:9]),
        .S({\addPostAddMantissa[16]_i_4_n_0 ,\addPostAddMantissa[16]_i_5_n_0 ,\addPostAddMantissa[16]_i_6_n_0 ,\addPostAddMantissa[16]_i_7_n_0 ,\addPostAddMantissa[16]_i_8_n_0 ,\addPostAddMantissa[16]_i_9_n_0 ,\addPostAddMantissa[16]_i_10_n_0 ,\addPostAddMantissa[16]_i_11_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[17] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[17]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[18] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[18]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[19] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[19]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[1] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[1]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[20] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[20]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[21] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[21]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[22] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[22]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[2] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[2]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[3] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[3]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[4] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[4]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[5] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[5]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[6] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[6]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[7] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[7]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[8] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[8]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[8] ),
        .R(1'b0));
  CARRY8 \addPostAddMantissa_reg[8]_i_2 
       (.CI(\addPostAddMantissa[8]_i_4_n_0 ),
        .CI_TOP(1'b0),
        .CO({\addPostAddMantissa_reg[8]_i_2_n_0 ,\addPostAddMantissa_reg[8]_i_2_n_1 ,\addPostAddMantissa_reg[8]_i_2_n_2 ,\addPostAddMantissa_reg[8]_i_2_n_3 ,\addPostAddMantissa_reg[8]_i_2_n_4 ,\addPostAddMantissa_reg[8]_i_2_n_5 ,\addPostAddMantissa_reg[8]_i_2_n_6 ,\addPostAddMantissa_reg[8]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\ADDStage2.postAddMantissa0 [8:1]),
        .S({\addPostAddMantissa[8]_i_5_n_0 ,\addPostAddMantissa[8]_i_6_n_0 ,\addPostAddMantissa[8]_i_7_n_0 ,\addPostAddMantissa[8]_i_8_n_0 ,\addPostAddMantissa[8]_i_9_n_0 ,\addPostAddMantissa[8]_i_10_n_0 ,\addPostAddMantissa[8]_i_11_n_0 ,\addPostAddMantissa[8]_i_12_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa_reg[9] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addPostAddMantissa[9]_i_1_n_0 ),
        .Q(\addPostAddMantissa_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFEFE)) 
    \addRenormalizeShiftAmount[0]_i_1 
       (.I0(\addRenormalizeShiftAmount[0]_i_2_n_0 ),
        .I1(\addRenormalizeShiftAmount[0]_i_3_n_0 ),
        .I2(\addRenormalizeShiftAmount[0]_i_4_n_0 ),
        .I3(\addPostAddMantissa1_reg_n_0_[16] ),
        .I4(\addRenormalizeShiftAmount[4]_i_7_n_0 ),
        .I5(\addRenormalizeShiftAmount[0]_i_5_n_0 ),
        .O(\addRenormalizeShiftAmount[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAEEFE)) 
    \addRenormalizeShiftAmount[0]_i_10 
       (.I0(\addPostAddMantissa1_reg_n_0_[10] ),
        .I1(\addPostAddMantissa1_reg_n_0_[8] ),
        .I2(\addRenormalizeShiftAmount[0]_i_12_n_0 ),
        .I3(\addPostAddMantissa1_reg_n_0_[7] ),
        .I4(\addPostAddMantissa1_reg_n_0_[9] ),
        .I5(\addPostAddMantissa1_reg_n_0_[11] ),
        .O(\addRenormalizeShiftAmount[0]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FF000400)) 
    \addRenormalizeShiftAmount[0]_i_11 
       (.I0(\addPostAddMantissa1_reg_n_0_[17] ),
        .I1(\addPostAddMantissa1_reg_n_0_[14] ),
        .I2(\addPostAddMantissa1_reg_n_0_[15] ),
        .I3(\addRenormalizeShiftAmount[0]_i_13_n_0 ),
        .I4(\addPostAddMantissa1_reg_n_0_[18] ),
        .I5(\addPostAddMantissa1_reg_n_0_[19] ),
        .O(\addRenormalizeShiftAmount[0]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF55551011)) 
    \addRenormalizeShiftAmount[0]_i_12 
       (.I0(\addPostAddMantissa1_reg_n_0_[5] ),
        .I1(\addPostAddMantissa1_reg_n_0_[3] ),
        .I2(\addPostAddMantissa1_reg_n_0_[2] ),
        .I3(\addPostAddMantissa1_reg_n_0_[1] ),
        .I4(\addPostAddMantissa1_reg_n_0_[4] ),
        .I5(\addPostAddMantissa1_reg_n_0_[6] ),
        .O(\addRenormalizeShiftAmount[0]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h0001)) 
    \addRenormalizeShiftAmount[0]_i_13 
       (.I0(\addPostAddMantissa1_reg_n_0_[23] ),
        .I1(\addPostAddMantissa1_reg_n_0_[24] ),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\addPostAddMantissa1_reg_n_0_[21] ),
        .O(\addRenormalizeShiftAmount[0]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h88C8)) 
    \addRenormalizeShiftAmount[0]_i_2 
       (.I0(\ADDStage2.postAddMantissa0 [16]),
        .I1(\addRenormalizeShiftAmount[4]_i_4_n_0 ),
        .I2(\ADDStage2.postAddMantissa0 [14]),
        .I3(\ADDStage2.postAddMantissa0 [15]),
        .O(\addRenormalizeShiftAmount[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h10101000)) 
    \addRenormalizeShiftAmount[0]_i_3 
       (.I0(\ADDStage2.postAddMantissa0 [13]),
        .I1(\ADDStage2.postAddMantissa0 [15]),
        .I2(\addRenormalizeShiftAmount[4]_i_4_n_0 ),
        .I3(\ADDStage2.postAddMantissa0 [12]),
        .I4(\addRenormalizeShiftAmount[0]_i_6_n_0 ),
        .O(\addRenormalizeShiftAmount[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00000000000000F2)) 
    \addRenormalizeShiftAmount[0]_i_4 
       (.I0(\addPostAddMantissa1_reg_n_0_[20] ),
        .I1(\addPostAddMantissa1_reg_n_0_[21] ),
        .I2(\addPostAddMantissa1_reg_n_0_[22] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .I4(\addPostAddMantissa1_reg_n_0_[24] ),
        .I5(\addPostAddMantissa1_reg_n_0_[23] ),
        .O(\addRenormalizeShiftAmount[0]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFAAFF08)) 
    \addRenormalizeShiftAmount[0]_i_5 
       (.I0(\addRenormalizeShiftAmount[2]_i_5_n_0 ),
        .I1(\ADDStage2.postAddMantissa0 [18]),
        .I2(\ADDStage2.postAddMantissa0 [19]),
        .I3(\addRenormalizeShiftAmount[0]_i_7_n_0 ),
        .I4(\ADDStage2.postAddMantissa0 [20]),
        .I5(\addRenormalizeShiftAmount[0]_i_8_n_0 ),
        .O(\addRenormalizeShiftAmount[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAEEFE)) 
    \addRenormalizeShiftAmount[0]_i_6 
       (.I0(\ADDStage2.postAddMantissa0 [10]),
        .I1(\ADDStage2.postAddMantissa0 [8]),
        .I2(\addRenormalizeShiftAmount[0]_i_9_n_0 ),
        .I3(\ADDStage2.postAddMantissa0 [7]),
        .I4(\ADDStage2.postAddMantissa0 [9]),
        .I5(\ADDStage2.postAddMantissa0 [11]),
        .O(\addRenormalizeShiftAmount[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h10101000)) 
    \addRenormalizeShiftAmount[0]_i_7 
       (.I0(\addPostAddMantissa1_reg_n_0_[13] ),
        .I1(\addPostAddMantissa1_reg_n_0_[15] ),
        .I2(\addRenormalizeShiftAmount[4]_i_7_n_0 ),
        .I3(\addPostAddMantissa1_reg_n_0_[12] ),
        .I4(\addRenormalizeShiftAmount[0]_i_10_n_0 ),
        .O(\addRenormalizeShiftAmount[0]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'hFFFF0020)) 
    \addRenormalizeShiftAmount[0]_i_8 
       (.I0(\ADDStage2.postAddMantissa0 [22]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [23]),
        .I4(\addRenormalizeShiftAmount[0]_i_11_n_0 ),
        .O(\addRenormalizeShiftAmount[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF55551011)) 
    \addRenormalizeShiftAmount[0]_i_9 
       (.I0(\ADDStage2.postAddMantissa0 [5]),
        .I1(\ADDStage2.postAddMantissa0 [3]),
        .I2(\ADDStage2.postAddMantissa0 [2]),
        .I3(\ADDStage2.postAddMantissa0 [1]),
        .I4(\ADDStage2.postAddMantissa0 [4]),
        .I5(\ADDStage2.postAddMantissa0 [6]),
        .O(\addRenormalizeShiftAmount[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBBBAAAAA)) 
    \addRenormalizeShiftAmount[1]_i_1 
       (.I0(\addRenormalizeShiftAmount[1]_i_2_n_0 ),
        .I1(\ADDStage2.postAddMantissa0 [22]),
        .I2(\ADDStage2.postAddMantissa0 [20]),
        .I3(\ADDStage2.postAddMantissa0 [21]),
        .I4(\addRenormalizeShiftAmount[1]_i_3_n_0 ),
        .I5(\addRenormalizeShiftAmount[1]_i_4_n_0 ),
        .O(\addRenormalizeShiftAmount[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1110111011101111)) 
    \addRenormalizeShiftAmount[1]_i_10 
       (.I0(\ADDStage2.postAddMantissa0 [7]),
        .I1(\ADDStage2.postAddMantissa0 [6]),
        .I2(\ADDStage2.postAddMantissa0 [4]),
        .I3(\ADDStage2.postAddMantissa0 [5]),
        .I4(\ADDStage2.postAddMantissa0 [2]),
        .I5(\ADDStage2.postAddMantissa0 [3]),
        .O(\addRenormalizeShiftAmount[1]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \addRenormalizeShiftAmount[1]_i_11 
       (.I0(\addPostAddMantissa1_reg_n_0_[19] ),
        .I1(\addPostAddMantissa1_reg_n_0_[18] ),
        .I2(\addPostAddMantissa1_reg_n_0_[22] ),
        .I3(\addPostAddMantissa1_reg_n_0_[23] ),
        .I4(\addPostAddMantissa1_reg_n_0_[24] ),
        .I5(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addRenormalizeShiftAmount[1]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF5554)) 
    \addRenormalizeShiftAmount[1]_i_12 
       (.I0(\addRenormalizeShiftAmount[1]_i_13_n_0 ),
        .I1(\addRenormalizeShiftAmount[1]_i_14_n_0 ),
        .I2(\addPostAddMantissa1_reg_n_0_[9] ),
        .I3(\addPostAddMantissa1_reg_n_0_[8] ),
        .I4(\addPostAddMantissa1_reg_n_0_[13] ),
        .I5(\addPostAddMantissa1_reg_n_0_[12] ),
        .O(\addRenormalizeShiftAmount[1]_i_12_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \addRenormalizeShiftAmount[1]_i_13 
       (.I0(\addPostAddMantissa1_reg_n_0_[10] ),
        .I1(\addPostAddMantissa1_reg_n_0_[11] ),
        .O(\addRenormalizeShiftAmount[1]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h1110111011101111)) 
    \addRenormalizeShiftAmount[1]_i_14 
       (.I0(\addPostAddMantissa1_reg_n_0_[7] ),
        .I1(\addPostAddMantissa1_reg_n_0_[6] ),
        .I2(\addPostAddMantissa1_reg_n_0_[4] ),
        .I3(\addPostAddMantissa1_reg_n_0_[5] ),
        .I4(\addPostAddMantissa1_reg_n_0_[2] ),
        .I5(\addPostAddMantissa1_reg_n_0_[3] ),
        .O(\addRenormalizeShiftAmount[1]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8AAA8A8A8A8)) 
    \addRenormalizeShiftAmount[1]_i_2 
       (.I0(\addRenormalizeShiftAmount[1]_i_5_n_0 ),
        .I1(\ADDStage2.postAddMantissa0 [16]),
        .I2(\ADDStage2.postAddMantissa0 [17]),
        .I3(\ADDStage2.postAddMantissa0 [15]),
        .I4(\ADDStage2.postAddMantissa0 [14]),
        .I5(\addRenormalizeShiftAmount[1]_i_6_n_0 ),
        .O(\addRenormalizeShiftAmount[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \addRenormalizeShiftAmount[1]_i_3 
       (.I0(\ADDStage2.postAddMantissa0 [24]),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .I2(\ADDStage2.postAddMantissa0 [23]),
        .O(\addRenormalizeShiftAmount[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00002220)) 
    \addRenormalizeShiftAmount[1]_i_4 
       (.I0(\addRenormalizeShiftAmount[1]_i_7_n_0 ),
        .I1(\addPostAddMantissa1_reg_n_0_[23] ),
        .I2(\addPostAddMantissa1_reg_n_0_[21] ),
        .I3(\addPostAddMantissa1_reg_n_0_[20] ),
        .I4(\addPostAddMantissa1_reg_n_0_[22] ),
        .I5(\addRenormalizeShiftAmount[1]_i_8_n_0 ),
        .O(\addRenormalizeShiftAmount[1]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \addRenormalizeShiftAmount[1]_i_5 
       (.I0(\ADDStage2.postAddMantissa0 [19]),
        .I1(\ADDStage2.postAddMantissa0 [18]),
        .I2(\ADDStage2.postAddMantissa0 [22]),
        .I3(\ADDStage2.postAddMantissa0 [23]),
        .I4(\addPostAddMantissa1_reg_n_0_[25] ),
        .I5(\ADDStage2.postAddMantissa0 [24]),
        .O(\addRenormalizeShiftAmount[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF5554)) 
    \addRenormalizeShiftAmount[1]_i_6 
       (.I0(\addRenormalizeShiftAmount[1]_i_9_n_0 ),
        .I1(\addRenormalizeShiftAmount[1]_i_10_n_0 ),
        .I2(\ADDStage2.postAddMantissa0 [9]),
        .I3(\ADDStage2.postAddMantissa0 [8]),
        .I4(\ADDStage2.postAddMantissa0 [13]),
        .I5(\ADDStage2.postAddMantissa0 [12]),
        .O(\addRenormalizeShiftAmount[1]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \addRenormalizeShiftAmount[1]_i_7 
       (.I0(\addPostAddMantissa1_reg_n_0_[24] ),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addRenormalizeShiftAmount[1]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'hA8A8A8AAA8A8A8A8)) 
    \addRenormalizeShiftAmount[1]_i_8 
       (.I0(\addRenormalizeShiftAmount[1]_i_11_n_0 ),
        .I1(\addPostAddMantissa1_reg_n_0_[16] ),
        .I2(\addPostAddMantissa1_reg_n_0_[17] ),
        .I3(\addPostAddMantissa1_reg_n_0_[15] ),
        .I4(\addPostAddMantissa1_reg_n_0_[14] ),
        .I5(\addRenormalizeShiftAmount[1]_i_12_n_0 ),
        .O(\addRenormalizeShiftAmount[1]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \addRenormalizeShiftAmount[1]_i_9 
       (.I0(\ADDStage2.postAddMantissa0 [10]),
        .I1(\ADDStage2.postAddMantissa0 [11]),
        .O(\addRenormalizeShiftAmount[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF000E0000)) 
    \addRenormalizeShiftAmount[2]_i_1 
       (.I0(\addRenormalizeShiftAmount[2]_i_2_n_0 ),
        .I1(\addRenormalizeShiftAmount[2]_i_3_n_0 ),
        .I2(\ADDStage2.postAddMantissa0 [22]),
        .I3(\ADDStage2.postAddMantissa0 [20]),
        .I4(\addRenormalizeShiftAmount[2]_i_5_n_0 ),
        .I5(\addRenormalizeShiftAmount[2]_i_6_n_0 ),
        .O(\addRenormalizeShiftAmount[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addRenormalizeShiftAmount[2]_i_10 
       (.I0(\addPostAddMantissa1_reg_n_0_[22] ),
        .O(\addRenormalizeShiftAmount[2]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addRenormalizeShiftAmount[2]_i_11 
       (.I0(\addPostAddMantissa1_reg_n_0_[21] ),
        .O(\addRenormalizeShiftAmount[2]_i_11_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addRenormalizeShiftAmount[2]_i_12 
       (.I0(\addPostAddMantissa1_reg_n_0_[20] ),
        .O(\addRenormalizeShiftAmount[2]_i_12_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addRenormalizeShiftAmount[2]_i_13 
       (.I0(\addPostAddMantissa1_reg_n_0_[19] ),
        .O(\addRenormalizeShiftAmount[2]_i_13_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addRenormalizeShiftAmount[2]_i_14 
       (.I0(\addPostAddMantissa1_reg_n_0_[18] ),
        .O(\addRenormalizeShiftAmount[2]_i_14_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addRenormalizeShiftAmount[2]_i_15 
       (.I0(\addPostAddMantissa1_reg_n_0_[17] ),
        .O(\addRenormalizeShiftAmount[2]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \addRenormalizeShiftAmount[2]_i_16 
       (.I0(\addPostAddMantissa1_reg_n_0_[22] ),
        .I1(\addPostAddMantissa1_reg_n_0_[20] ),
        .I2(\addPostAddMantissa1_reg_n_0_[21] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .I4(\addPostAddMantissa1_reg_n_0_[24] ),
        .I5(\addPostAddMantissa1_reg_n_0_[23] ),
        .O(\addRenormalizeShiftAmount[2]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAAAB)) 
    \addRenormalizeShiftAmount[2]_i_17 
       (.I0(\addRenormalizeShiftAmount[4]_i_11_n_0 ),
        .I1(\addPostAddMantissa1_reg_n_0_[7] ),
        .I2(\addPostAddMantissa1_reg_n_0_[6] ),
        .I3(\addPostAddMantissa1_reg_n_0_[5] ),
        .I4(\addPostAddMantissa1_reg_n_0_[4] ),
        .I5(\addRenormalizeShiftAmount[2]_i_18_n_0 ),
        .O(\addRenormalizeShiftAmount[2]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addRenormalizeShiftAmount[2]_i_18 
       (.I0(\addPostAddMantissa1_reg_n_0_[14] ),
        .I1(\addPostAddMantissa1_reg_n_0_[12] ),
        .I2(\addPostAddMantissa1_reg_n_0_[15] ),
        .I3(\addPostAddMantissa1_reg_n_0_[13] ),
        .O(\addRenormalizeShiftAmount[2]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAAAAB)) 
    \addRenormalizeShiftAmount[2]_i_2 
       (.I0(\addRenormalizeShiftAmount[4]_i_10_n_0 ),
        .I1(\ADDStage2.postAddMantissa0 [7]),
        .I2(\ADDStage2.postAddMantissa0 [6]),
        .I3(\ADDStage2.postAddMantissa0 [5]),
        .I4(\ADDStage2.postAddMantissa0 [4]),
        .I5(\addRenormalizeShiftAmount[2]_i_7_n_0 ),
        .O(\addRenormalizeShiftAmount[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addRenormalizeShiftAmount[2]_i_3 
       (.I0(\ADDStage2.postAddMantissa0 [18]),
        .I1(\ADDStage2.postAddMantissa0 [16]),
        .I2(\ADDStage2.postAddMantissa0 [19]),
        .I3(\ADDStage2.postAddMantissa0 [17]),
        .O(\addRenormalizeShiftAmount[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \addRenormalizeShiftAmount[2]_i_5 
       (.I0(\ADDStage2.postAddMantissa0 [23]),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .I2(\ADDStage2.postAddMantissa0 [24]),
        .I3(\ADDStage2.postAddMantissa0 [21]),
        .O(\addRenormalizeShiftAmount[2]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA8)) 
    \addRenormalizeShiftAmount[2]_i_6 
       (.I0(\addRenormalizeShiftAmount[2]_i_16_n_0 ),
        .I1(\addPostAddMantissa1_reg_n_0_[18] ),
        .I2(\addPostAddMantissa1_reg_n_0_[16] ),
        .I3(\addPostAddMantissa1_reg_n_0_[19] ),
        .I4(\addPostAddMantissa1_reg_n_0_[17] ),
        .I5(\addRenormalizeShiftAmount[2]_i_17_n_0 ),
        .O(\addRenormalizeShiftAmount[2]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addRenormalizeShiftAmount[2]_i_7 
       (.I0(\ADDStage2.postAddMantissa0 [14]),
        .I1(\ADDStage2.postAddMantissa0 [12]),
        .I2(\ADDStage2.postAddMantissa0 [15]),
        .I3(\ADDStage2.postAddMantissa0 [13]),
        .O(\addRenormalizeShiftAmount[2]_i_7_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addRenormalizeShiftAmount[2]_i_8 
       (.I0(\addPostAddMantissa1_reg_n_0_[24] ),
        .O(\addRenormalizeShiftAmount[2]_i_8_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \addRenormalizeShiftAmount[2]_i_9 
       (.I0(\addPostAddMantissa1_reg_n_0_[23] ),
        .O(\addRenormalizeShiftAmount[2]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFF80808080808080)) 
    \addRenormalizeShiftAmount[3]_i_1 
       (.I0(\addRenormalizeShiftAmount[4]_i_4_n_0 ),
        .I1(\addRenormalizeShiftAmount[4]_i_5_n_0 ),
        .I2(\addRenormalizeShiftAmount[4]_i_6_n_0 ),
        .I3(\addRenormalizeShiftAmount[4]_i_7_n_0 ),
        .I4(\addRenormalizeShiftAmount[4]_i_8_n_0 ),
        .I5(\addRenormalizeShiftAmount[4]_i_9_n_0 ),
        .O(\addRenormalizeShiftAmount[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0008)) 
    \addRenormalizeShiftAmount[4]_i_1 
       (.I0(addPipelineValidStage1),
        .I1(\addRenormalizeShiftAmount[4]_i_3_n_0 ),
        .I2(addEarlyOutBypassEnable1_reg_n_0),
        .I3(addSameNumberDifferentSigns1_reg_n_0),
        .O(addPostAddMantissa));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addRenormalizeShiftAmount[4]_i_10 
       (.I0(\ADDStage2.postAddMantissa0 [11]),
        .I1(\ADDStage2.postAddMantissa0 [10]),
        .I2(\ADDStage2.postAddMantissa0 [9]),
        .I3(\ADDStage2.postAddMantissa0 [8]),
        .O(\addRenormalizeShiftAmount[4]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addRenormalizeShiftAmount[4]_i_11 
       (.I0(\addPostAddMantissa1_reg_n_0_[11] ),
        .I1(\addPostAddMantissa1_reg_n_0_[10] ),
        .I2(\addPostAddMantissa1_reg_n_0_[9] ),
        .I3(\addPostAddMantissa1_reg_n_0_[8] ),
        .O(\addRenormalizeShiftAmount[4]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h08080808FF080808)) 
    \addRenormalizeShiftAmount[4]_i_2 
       (.I0(\addRenormalizeShiftAmount[4]_i_4_n_0 ),
        .I1(\addRenormalizeShiftAmount[4]_i_5_n_0 ),
        .I2(\addRenormalizeShiftAmount[4]_i_6_n_0 ),
        .I3(\addRenormalizeShiftAmount[4]_i_7_n_0 ),
        .I4(\addRenormalizeShiftAmount[4]_i_8_n_0 ),
        .I5(\addRenormalizeShiftAmount[4]_i_9_n_0 ),
        .O(\addRenormalizeShiftAmount[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF47FFFF)) 
    \addRenormalizeShiftAmount[4]_i_3 
       (.I0(\ADDStage2.postAddMantissa0 [24]),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addMaxVal1_reg_n_0_[23] ),
        .I4(\addMaxVal1_reg_n_0_[30] ),
        .I5(\addFinalExp[7]_i_2_n_0 ),
        .O(\addRenormalizeShiftAmount[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \addRenormalizeShiftAmount[4]_i_4 
       (.I0(\ADDStage2.postAddMantissa0 [21]),
        .I1(\ADDStage2.postAddMantissa0 [24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\ADDStage2.postAddMantissa0 [23]),
        .I4(\ADDStage2.postAddMantissa0 [19]),
        .I5(\ADDStage2.postAddMantissa0 [17]),
        .O(\addRenormalizeShiftAmount[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \addRenormalizeShiftAmount[4]_i_5 
       (.I0(\ADDStage2.postAddMantissa0 [20]),
        .I1(\ADDStage2.postAddMantissa0 [16]),
        .I2(\ADDStage2.postAddMantissa0 [22]),
        .I3(\ADDStage2.postAddMantissa0 [18]),
        .O(\addRenormalizeShiftAmount[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \addRenormalizeShiftAmount[4]_i_6 
       (.I0(\ADDStage2.postAddMantissa0 [13]),
        .I1(\ADDStage2.postAddMantissa0 [15]),
        .I2(\ADDStage2.postAddMantissa0 [12]),
        .I3(\ADDStage2.postAddMantissa0 [14]),
        .I4(\addRenormalizeShiftAmount[4]_i_10_n_0 ),
        .O(\addRenormalizeShiftAmount[4]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \addRenormalizeShiftAmount[4]_i_7 
       (.I0(\addPostAddMantissa1_reg_n_0_[21] ),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[23] ),
        .I4(\addPostAddMantissa1_reg_n_0_[19] ),
        .I5(\addPostAddMantissa1_reg_n_0_[17] ),
        .O(\addRenormalizeShiftAmount[4]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \addRenormalizeShiftAmount[4]_i_8 
       (.I0(\addPostAddMantissa1_reg_n_0_[20] ),
        .I1(\addPostAddMantissa1_reg_n_0_[16] ),
        .I2(\addPostAddMantissa1_reg_n_0_[22] ),
        .I3(\addPostAddMantissa1_reg_n_0_[18] ),
        .O(\addRenormalizeShiftAmount[4]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \addRenormalizeShiftAmount[4]_i_9 
       (.I0(\addPostAddMantissa1_reg_n_0_[13] ),
        .I1(\addPostAddMantissa1_reg_n_0_[15] ),
        .I2(\addPostAddMantissa1_reg_n_0_[12] ),
        .I3(\addPostAddMantissa1_reg_n_0_[14] ),
        .I4(\addRenormalizeShiftAmount[4]_i_11_n_0 ),
        .O(\addRenormalizeShiftAmount[4]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addRenormalizeShiftAmount_reg[0] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addRenormalizeShiftAmount[0]_i_1_n_0 ),
        .Q(R[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addRenormalizeShiftAmount_reg[1] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addRenormalizeShiftAmount[1]_i_1_n_0 ),
        .Q(R[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addRenormalizeShiftAmount_reg[2] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addRenormalizeShiftAmount[2]_i_1_n_0 ),
        .Q(R[2]),
        .R(1'b0));
  CARRY8 \addRenormalizeShiftAmount_reg[2]_i_4 
       (.CI(\addPostAddMantissa_reg[16]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_addRenormalizeShiftAmount_reg[2]_i_4_CO_UNCONNECTED [7],\addRenormalizeShiftAmount_reg[2]_i_4_n_1 ,\addRenormalizeShiftAmount_reg[2]_i_4_n_2 ,\addRenormalizeShiftAmount_reg[2]_i_4_n_3 ,\addRenormalizeShiftAmount_reg[2]_i_4_n_4 ,\addRenormalizeShiftAmount_reg[2]_i_4_n_5 ,\addRenormalizeShiftAmount_reg[2]_i_4_n_6 ,\addRenormalizeShiftAmount_reg[2]_i_4_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(\ADDStage2.postAddMantissa0 [24:17]),
        .S({\addRenormalizeShiftAmount[2]_i_8_n_0 ,\addRenormalizeShiftAmount[2]_i_9_n_0 ,\addRenormalizeShiftAmount[2]_i_10_n_0 ,\addRenormalizeShiftAmount[2]_i_11_n_0 ,\addRenormalizeShiftAmount[2]_i_12_n_0 ,\addRenormalizeShiftAmount[2]_i_13_n_0 ,\addRenormalizeShiftAmount[2]_i_14_n_0 ,\addRenormalizeShiftAmount[2]_i_15_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \addRenormalizeShiftAmount_reg[3] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addRenormalizeShiftAmount[3]_i_1_n_0 ),
        .Q(R[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addRenormalizeShiftAmount_reg[4] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addRenormalizeShiftAmount[4]_i_2_n_0 ),
        .Q(R[4]),
        .R(1'b0));
  CARRY8 addSameNumberDifferentSigns00_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({addSameNumberDifferentSigns00_carry_n_0,addSameNumberDifferentSigns00_carry_n_1,addSameNumberDifferentSigns00_carry_n_2,addSameNumberDifferentSigns00_carry_n_3,addSameNumberDifferentSigns00_carry_n_4,addSameNumberDifferentSigns00_carry_n_5,addSameNumberDifferentSigns00_carry_n_6,addSameNumberDifferentSigns00_carry_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_addSameNumberDifferentSigns00_carry_O_UNCONNECTED[7:0]),
        .S({addSameNumberDifferentSigns00_carry_i_1_n_0,addSameNumberDifferentSigns00_carry_i_2_n_0,addSameNumberDifferentSigns00_carry_i_3_n_0,addSameNumberDifferentSigns00_carry_i_4_n_0,addSameNumberDifferentSigns00_carry_i_5_n_0,addSameNumberDifferentSigns00_carry_i_6_n_0,addSameNumberDifferentSigns00_carry_i_7_n_0,addSameNumberDifferentSigns00_carry_i_8_n_0}));
  CARRY8 addSameNumberDifferentSigns00_carry__0
       (.CI(addSameNumberDifferentSigns00_carry_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_addSameNumberDifferentSigns00_carry__0_CO_UNCONNECTED[7:3],addSameNumberDifferentSigns00,addSameNumberDifferentSigns00_carry__0_n_6,addSameNumberDifferentSigns00_carry__0_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_addSameNumberDifferentSigns00_carry__0_O_UNCONNECTED[7:0]),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,addSameNumberDifferentSigns00_carry__0_i_1_n_0,addSameNumberDifferentSigns00_carry__0_i_2_n_0,addSameNumberDifferentSigns00_carry__0_i_3_n_0}));
  LUT4 #(
    .INIT(16'hD2DD)) 
    addSameNumberDifferentSigns00_carry__0_i_1
       (.I0(IN_B[30]),
        .I1(comBIsDenormal__6),
        .I2(comAIsDenormal__6),
        .I3(IN_A[30]),
        .O(addSameNumberDifferentSigns00_carry__0_i_1_n_0));
  LUT5 #(
    .INIT(32'hC0F06050)) 
    addSameNumberDifferentSigns00_carry__0_i_2
       (.I0(IN_B[29]),
        .I1(comAIsDenormal__6),
        .I2(addSameNumberDifferentSigns00_carry__0_i_4_n_0),
        .I3(IN_A[29]),
        .I4(comBIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry__0_i_2_n_0));
  LUT5 #(
    .INIT(32'hC0F06050)) 
    addSameNumberDifferentSigns00_carry__0_i_3
       (.I0(IN_B[26]),
        .I1(comAIsDenormal__6),
        .I2(addSameNumberDifferentSigns00_carry__0_i_5_n_0),
        .I3(IN_A[26]),
        .I4(comBIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFF003305059009)) 
    addSameNumberDifferentSigns00_carry__0_i_4
       (.I0(IN_A[27]),
        .I1(IN_B[27]),
        .I2(IN_A[28]),
        .I3(IN_B[28]),
        .I4(comBIsDenormal__6),
        .I5(comAIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry__0_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFF003305059009)) 
    addSameNumberDifferentSigns00_carry__0_i_5
       (.I0(IN_A[24]),
        .I1(IN_B[24]),
        .I2(IN_A[25]),
        .I3(IN_B[25]),
        .I4(comBIsDenormal__6),
        .I5(comAIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry__0_i_5_n_0));
  LUT5 #(
    .INIT(32'hC0F06050)) 
    addSameNumberDifferentSigns00_carry_i_1
       (.I0(IN_B[23]),
        .I1(comAIsDenormal__6),
        .I2(addSameNumberDifferentSigns00_carry_i_9_n_0),
        .I3(IN_A[23]),
        .I4(comBIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'hFFFF003305059009)) 
    addSameNumberDifferentSigns00_carry_i_10
       (.I0(IN_A[18]),
        .I1(IN_B[18]),
        .I2(IN_A[19]),
        .I3(IN_B[19]),
        .I4(comBIsDenormal__6),
        .I5(comAIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_10_n_0));
  LUT6 #(
    .INIT(64'hFFFF003305059009)) 
    addSameNumberDifferentSigns00_carry_i_11
       (.I0(IN_A[15]),
        .I1(IN_B[15]),
        .I2(IN_A[16]),
        .I3(IN_B[16]),
        .I4(comBIsDenormal__6),
        .I5(comAIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_11_n_0));
  LUT6 #(
    .INIT(64'hFFFF003305059009)) 
    addSameNumberDifferentSigns00_carry_i_12
       (.I0(IN_A[12]),
        .I1(IN_B[12]),
        .I2(IN_A[13]),
        .I3(IN_B[13]),
        .I4(comBIsDenormal__6),
        .I5(comAIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFFF003305059009)) 
    addSameNumberDifferentSigns00_carry_i_13
       (.I0(IN_A[9]),
        .I1(IN_B[9]),
        .I2(IN_A[10]),
        .I3(IN_B[10]),
        .I4(comBIsDenormal__6),
        .I5(comAIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_13_n_0));
  LUT6 #(
    .INIT(64'hFFFF003305059009)) 
    addSameNumberDifferentSigns00_carry_i_14
       (.I0(IN_A[6]),
        .I1(IN_B[6]),
        .I2(IN_A[7]),
        .I3(IN_B[7]),
        .I4(comBIsDenormal__6),
        .I5(comAIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_14_n_0));
  LUT6 #(
    .INIT(64'hFFFF003305059009)) 
    addSameNumberDifferentSigns00_carry_i_15
       (.I0(IN_A[3]),
        .I1(IN_B[3]),
        .I2(IN_A[4]),
        .I3(IN_B[4]),
        .I4(comBIsDenormal__6),
        .I5(comAIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_15_n_0));
  LUT6 #(
    .INIT(64'hFFFF003305059009)) 
    addSameNumberDifferentSigns00_carry_i_16
       (.I0(IN_A[0]),
        .I1(IN_B[0]),
        .I2(IN_A[1]),
        .I3(IN_B[1]),
        .I4(comBIsDenormal__6),
        .I5(comAIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_16_n_0));
  LUT5 #(
    .INIT(32'hC0F06050)) 
    addSameNumberDifferentSigns00_carry_i_2
       (.I0(IN_B[20]),
        .I1(comAIsDenormal__6),
        .I2(addSameNumberDifferentSigns00_carry_i_10_n_0),
        .I3(IN_A[20]),
        .I4(comBIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'hC0F06050)) 
    addSameNumberDifferentSigns00_carry_i_3
       (.I0(IN_B[17]),
        .I1(comAIsDenormal__6),
        .I2(addSameNumberDifferentSigns00_carry_i_11_n_0),
        .I3(IN_A[17]),
        .I4(comBIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'hC0F06050)) 
    addSameNumberDifferentSigns00_carry_i_4
       (.I0(IN_B[14]),
        .I1(comAIsDenormal__6),
        .I2(addSameNumberDifferentSigns00_carry_i_12_n_0),
        .I3(IN_A[14]),
        .I4(comBIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'hC0F06050)) 
    addSameNumberDifferentSigns00_carry_i_5
       (.I0(IN_B[11]),
        .I1(comAIsDenormal__6),
        .I2(addSameNumberDifferentSigns00_carry_i_13_n_0),
        .I3(IN_A[11]),
        .I4(comBIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_5_n_0));
  LUT5 #(
    .INIT(32'hC0F06050)) 
    addSameNumberDifferentSigns00_carry_i_6
       (.I0(IN_B[8]),
        .I1(comAIsDenormal__6),
        .I2(addSameNumberDifferentSigns00_carry_i_14_n_0),
        .I3(IN_A[8]),
        .I4(comBIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_6_n_0));
  LUT5 #(
    .INIT(32'hC0F06050)) 
    addSameNumberDifferentSigns00_carry_i_7
       (.I0(IN_B[5]),
        .I1(comAIsDenormal__6),
        .I2(addSameNumberDifferentSigns00_carry_i_15_n_0),
        .I3(IN_A[5]),
        .I4(comBIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_7_n_0));
  LUT5 #(
    .INIT(32'hC0F06050)) 
    addSameNumberDifferentSigns00_carry_i_8
       (.I0(IN_B[2]),
        .I1(comAIsDenormal__6),
        .I2(addSameNumberDifferentSigns00_carry_i_16_n_0),
        .I3(IN_A[2]),
        .I4(comBIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hFFFF003305059009)) 
    addSameNumberDifferentSigns00_carry_i_9
       (.I0(IN_A[21]),
        .I1(IN_B[21]),
        .I2(IN_A[22]),
        .I3(IN_B[22]),
        .I4(comBIsDenormal__6),
        .I5(comAIsDenormal__6),
        .O(addSameNumberDifferentSigns00_carry_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    addSameNumberDifferentSigns0_reg
       (.C(clk),
        .CE(IADD_GO),
        .D(addSameNumberDifferentSigns00),
        .Q(addSameNumberDifferentSigns0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFF28FF00002800)) 
    addSameNumberDifferentSigns1_i_1
       (.I0(addSameNumberDifferentSigns0),
        .I1(p_0_in),
        .I2(p_1_in),
        .I3(addPipelineValidStage0),
        .I4(addEarlyOutBypassEnable0__0),
        .I5(addSameNumberDifferentSigns1_reg_n_0),
        .O(addSameNumberDifferentSigns1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    addSameNumberDifferentSigns1_reg
       (.C(clk),
        .CE(1'b1),
        .D(addSameNumberDifferentSigns1_i_1_n_0),
        .Q(addSameNumberDifferentSigns1_reg_n_0),
        .R(1'b0));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 comALessThanB0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({comALessThanB0_carry_n_0,comALessThanB0_carry_n_1,comALessThanB0_carry_n_2,comALessThanB0_carry_n_3,comALessThanB0_carry_n_4,comALessThanB0_carry_n_5,comALessThanB0_carry_n_6,comALessThanB0_carry_n_7}),
        .DI({comALessThanB0_carry_i_1_n_0,comALessThanB0_carry_i_2__0_n_0,comALessThanB0_carry_i_3_n_0,comALessThanB0_carry_i_4__0_n_0,comALessThanB0_carry_i_5__0_n_0,comALessThanB0_carry_i_6_n_0,comALessThanB0_carry_i_7_n_0,comALessThanB0_carry_i_8_n_0}),
        .O(NLW_comALessThanB0_carry_O_UNCONNECTED[7:0]),
        .S({comALessThanB0_carry_i_9_n_0,comALessThanB0_carry_i_10__0_n_0,comALessThanB0_carry_i_11_n_0,comALessThanB0_carry_i_12__0_n_0,comALessThanB0_carry_i_13_n_0,comALessThanB0_carry_i_14_n_0,comALessThanB0_carry_i_15_n_0,comALessThanB0_carry_i_16_n_0}));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY8 comALessThanB0_carry__0
       (.CI(comALessThanB0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({comALessThanB,comALessThanB0_carry__0_n_1,comALessThanB0_carry__0_n_2,comALessThanB0_carry__0_n_3,comALessThanB0_carry__0_n_4,comALessThanB0_carry__0_n_5,comALessThanB0_carry__0_n_6,comALessThanB0_carry__0_n_7}),
        .DI({comALessThanB0_carry_i_1__0_n_0,comALessThanB0_carry_i_2_n_0,comALessThanB0_carry_i_3__0_n_0,comALessThanB0_carry_i_4_n_0,comALessThanB0_carry_i_5_n_0,comALessThanB0_carry_i_6__0_n_0,comALessThanB0_carry_i_7__0_n_0,comALessThanB0_carry_i_8__0_n_0}),
        .O(NLW_comALessThanB0_carry__0_O_UNCONNECTED[7:0]),
        .S({comALessThanB0_carry_i_9__0_n_0,comALessThanB0_carry_i_10_n_0,comALessThanB0_carry_i_11__0_n_0,comALessThanB0_carry_i_12_n_0,comALessThanB0_carry_i_13__0_n_0,comALessThanB0_carry_i_14__0_n_0,comALessThanB0_carry_i_15__0_n_0,comALessThanB0_carry_i_16__0_n_0}));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_1
       (.I0(IN_B[15]),
        .I1(IN_A[15]),
        .I2(IN_B[14]),
        .I3(IN_A[14]),
        .O(comALessThanB0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h8421)) 
    comALessThanB0_carry_i_10
       (.I0(IN_B[29]),
        .I1(IN_B[28]),
        .I2(IN_A[29]),
        .I3(IN_A[28]),
        .O(comALessThanB0_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_10__0
       (.I0(IN_A[12]),
        .I1(IN_B[12]),
        .I2(IN_B[13]),
        .I3(IN_A[13]),
        .O(comALessThanB0_carry_i_10__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_11
       (.I0(IN_A[10]),
        .I1(IN_B[10]),
        .I2(IN_B[11]),
        .I3(IN_A[11]),
        .O(comALessThanB0_carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_11__0
       (.I0(IN_A[27]),
        .I1(IN_B[27]),
        .I2(IN_B[26]),
        .I3(IN_A[26]),
        .O(comALessThanB0_carry_i_11__0_n_0));
  LUT4 #(
    .INIT(16'h8421)) 
    comALessThanB0_carry_i_12
       (.I0(IN_B[24]),
        .I1(IN_B[25]),
        .I2(IN_A[24]),
        .I3(IN_A[25]),
        .O(comALessThanB0_carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_12__0
       (.I0(IN_A[8]),
        .I1(IN_B[8]),
        .I2(IN_B[9]),
        .I3(IN_A[9]),
        .O(comALessThanB0_carry_i_12__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_13
       (.I0(IN_A[6]),
        .I1(IN_B[6]),
        .I2(IN_B[7]),
        .I3(IN_A[7]),
        .O(comALessThanB0_carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_13__0
       (.I0(IN_B[23]),
        .I1(IN_A[23]),
        .I2(IN_B[22]),
        .I3(IN_A[22]),
        .O(comALessThanB0_carry_i_13__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_14
       (.I0(IN_A[4]),
        .I1(IN_B[4]),
        .I2(IN_B[5]),
        .I3(IN_A[5]),
        .O(comALessThanB0_carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_14__0
       (.I0(IN_A[20]),
        .I1(IN_B[20]),
        .I2(IN_B[21]),
        .I3(IN_A[21]),
        .O(comALessThanB0_carry_i_14__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_15
       (.I0(IN_A[2]),
        .I1(IN_B[2]),
        .I2(IN_B[3]),
        .I3(IN_A[3]),
        .O(comALessThanB0_carry_i_15_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_15__0
       (.I0(IN_A[18]),
        .I1(IN_B[18]),
        .I2(IN_B[19]),
        .I3(IN_A[19]),
        .O(comALessThanB0_carry_i_15__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_16
       (.I0(IN_A[0]),
        .I1(IN_B[0]),
        .I2(IN_B[1]),
        .I3(IN_A[1]),
        .O(comALessThanB0_carry_i_16_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_16__0
       (.I0(IN_A[16]),
        .I1(IN_B[16]),
        .I2(IN_B[17]),
        .I3(IN_A[17]),
        .O(comALessThanB0_carry_i_16__0_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    comALessThanB0_carry_i_1__0
       (.I0(IN_B[30]),
        .I1(IN_A[30]),
        .O(comALessThanB0_carry_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h7510)) 
    comALessThanB0_carry_i_2
       (.I0(IN_A[29]),
        .I1(IN_A[28]),
        .I2(IN_B[28]),
        .I3(IN_B[29]),
        .O(comALessThanB0_carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_2__0
       (.I0(IN_B[13]),
        .I1(IN_A[13]),
        .I2(IN_B[12]),
        .I3(IN_A[12]),
        .O(comALessThanB0_carry_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_3
       (.I0(IN_B[11]),
        .I1(IN_A[11]),
        .I2(IN_B[10]),
        .I3(IN_A[10]),
        .O(comALessThanB0_carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_3__0
       (.I0(IN_B[27]),
        .I1(IN_A[27]),
        .I2(IN_B[26]),
        .I3(IN_A[26]),
        .O(comALessThanB0_carry_i_3__0_n_0));
  LUT4 #(
    .INIT(16'h7510)) 
    comALessThanB0_carry_i_4
       (.I0(IN_A[25]),
        .I1(IN_A[24]),
        .I2(IN_B[24]),
        .I3(IN_B[25]),
        .O(comALessThanB0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_4__0
       (.I0(IN_B[9]),
        .I1(IN_A[9]),
        .I2(IN_B[8]),
        .I3(IN_A[8]),
        .O(comALessThanB0_carry_i_4__0_n_0));
  LUT4 #(
    .INIT(16'h2F02)) 
    comALessThanB0_carry_i_5
       (.I0(IN_B[22]),
        .I1(IN_A[22]),
        .I2(IN_A[23]),
        .I3(IN_B[23]),
        .O(comALessThanB0_carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_5__0
       (.I0(IN_B[7]),
        .I1(IN_A[7]),
        .I2(IN_B[6]),
        .I3(IN_A[6]),
        .O(comALessThanB0_carry_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_6
       (.I0(IN_B[5]),
        .I1(IN_A[5]),
        .I2(IN_B[4]),
        .I3(IN_A[4]),
        .O(comALessThanB0_carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_6__0
       (.I0(IN_B[21]),
        .I1(IN_A[21]),
        .I2(IN_B[20]),
        .I3(IN_A[20]),
        .O(comALessThanB0_carry_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_7
       (.I0(IN_B[3]),
        .I1(IN_A[3]),
        .I2(IN_B[2]),
        .I3(IN_A[2]),
        .O(comALessThanB0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_7__0
       (.I0(IN_B[19]),
        .I1(IN_A[19]),
        .I2(IN_B[18]),
        .I3(IN_A[18]),
        .O(comALessThanB0_carry_i_7__0_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_8
       (.I0(IN_B[1]),
        .I1(IN_A[1]),
        .I2(IN_B[0]),
        .I3(IN_A[0]),
        .O(comALessThanB0_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_8__0
       (.I0(IN_B[17]),
        .I1(IN_A[17]),
        .I2(IN_B[16]),
        .I3(IN_A[16]),
        .O(comALessThanB0_carry_i_8__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_9
       (.I0(IN_A[14]),
        .I1(IN_B[14]),
        .I2(IN_B[15]),
        .I3(IN_A[15]),
        .O(comALessThanB0_carry_i_9_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    comALessThanB0_carry_i_9__0
       (.I0(IN_A[30]),
        .I1(IN_B[30]),
        .O(comALessThanB0_carry_i_9__0_n_0));
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
