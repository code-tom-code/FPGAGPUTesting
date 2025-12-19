// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Thu Oct 10 00:46:17 2024
// Host        : Dragon2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_StandaloneFloatALU_A_0_0/design_1_StandaloneFloatALU_A_0_0_sim_netlist.v
// Design      : design_1_StandaloneFloatALU_A_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_StandaloneFloatALU_A_0_0,StandaloneFloatALU_ADD,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "StandaloneFloatALU_ADD,Vivado 2018.1_AR73068" *) 
(* NotValidForBitStream *)
module design_1_StandaloneFloatALU_A_0_0
   (clk,
    IN_A,
    IN_B,
    OADD,
    IADD_GO);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk" *) input clk;
  input [31:0]IN_A;
  input [31:0]IN_B;
  output [31:0]OADD;
  input IADD_GO;

  wire IADD_GO;
  wire [31:0]IN_A;
  wire [31:0]IN_B;
  wire [31:0]OADD;
  wire clk;

  design_1_StandaloneFloatALU_A_0_0_StandaloneFloatALU_ADD U0
       (.IADD_GO(IADD_GO),
        .IN_A(IN_A),
        .IN_B(IN_B),
        .OADD(OADD),
        .clk(clk));
endmodule

(* ORIG_REF_NAME = "StandaloneFloatALU_ADD" *) 
module design_1_StandaloneFloatALU_A_0_0_StandaloneFloatALU_ADD
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

  wire GetFloatIsNegative;
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
  wire \OADD_Temp[30]_i_2_n_0 ;
  wire \OADD_Temp[31]_i_1_n_0 ;
  wire addALessThanB;
  wire \addDenormFlushedValA[0]_i_1_n_0 ;
  wire \addDenormFlushedValA[10]_i_1_n_0 ;
  wire \addDenormFlushedValA[11]_i_1_n_0 ;
  wire \addDenormFlushedValA[12]_i_1_n_0 ;
  wire \addDenormFlushedValA[13]_i_1_n_0 ;
  wire \addDenormFlushedValA[14]_i_1_n_0 ;
  wire \addDenormFlushedValA[15]_i_1_n_0 ;
  wire \addDenormFlushedValA[16]_i_1_n_0 ;
  wire \addDenormFlushedValA[17]_i_1_n_0 ;
  wire \addDenormFlushedValA[18]_i_1_n_0 ;
  wire \addDenormFlushedValA[19]_i_1_n_0 ;
  wire \addDenormFlushedValA[1]_i_1_n_0 ;
  wire \addDenormFlushedValA[20]_i_1_n_0 ;
  wire \addDenormFlushedValA[21]_i_1_n_0 ;
  wire \addDenormFlushedValA[22]_i_1_n_0 ;
  wire \addDenormFlushedValA[22]_i_2_n_0 ;
  wire \addDenormFlushedValA[22]_i_3_n_0 ;
  wire \addDenormFlushedValA[2]_i_1_n_0 ;
  wire \addDenormFlushedValA[3]_i_1_n_0 ;
  wire \addDenormFlushedValA[4]_i_1_n_0 ;
  wire \addDenormFlushedValA[5]_i_1_n_0 ;
  wire \addDenormFlushedValA[6]_i_1_n_0 ;
  wire \addDenormFlushedValA[7]_i_1_n_0 ;
  wire \addDenormFlushedValA[8]_i_1_n_0 ;
  wire \addDenormFlushedValA[9]_i_1_n_0 ;
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
  wire \addDenormFlushedValB[0]_i_1_n_0 ;
  wire \addDenormFlushedValB[10]_i_1_n_0 ;
  wire \addDenormFlushedValB[11]_i_1_n_0 ;
  wire \addDenormFlushedValB[12]_i_1_n_0 ;
  wire \addDenormFlushedValB[13]_i_1_n_0 ;
  wire \addDenormFlushedValB[14]_i_1_n_0 ;
  wire \addDenormFlushedValB[15]_i_1_n_0 ;
  wire \addDenormFlushedValB[16]_i_1_n_0 ;
  wire \addDenormFlushedValB[17]_i_1_n_0 ;
  wire \addDenormFlushedValB[18]_i_1_n_0 ;
  wire \addDenormFlushedValB[19]_i_1_n_0 ;
  wire \addDenormFlushedValB[1]_i_1_n_0 ;
  wire \addDenormFlushedValB[20]_i_1_n_0 ;
  wire \addDenormFlushedValB[21]_i_1_n_0 ;
  wire \addDenormFlushedValB[22]_i_1_n_0 ;
  wire \addDenormFlushedValB[22]_i_2_n_0 ;
  wire \addDenormFlushedValB[22]_i_3_n_0 ;
  wire \addDenormFlushedValB[2]_i_1_n_0 ;
  wire \addDenormFlushedValB[3]_i_1_n_0 ;
  wire \addDenormFlushedValB[4]_i_1_n_0 ;
  wire \addDenormFlushedValB[5]_i_1_n_0 ;
  wire \addDenormFlushedValB[6]_i_1_n_0 ;
  wire \addDenormFlushedValB[7]_i_1_n_0 ;
  wire \addDenormFlushedValB[8]_i_1_n_0 ;
  wire \addDenormFlushedValB[9]_i_1_n_0 ;
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
  wire \addEarlyOutBypass0[0]_i_2_n_0 ;
  wire \addEarlyOutBypass0[0]_i_3_n_0 ;
  wire \addEarlyOutBypass0[10]_i_1_n_0 ;
  wire \addEarlyOutBypass0[10]_i_2_n_0 ;
  wire \addEarlyOutBypass0[10]_i_3_n_0 ;
  wire \addEarlyOutBypass0[11]_i_1_n_0 ;
  wire \addEarlyOutBypass0[11]_i_2_n_0 ;
  wire \addEarlyOutBypass0[11]_i_3_n_0 ;
  wire \addEarlyOutBypass0[12]_i_1_n_0 ;
  wire \addEarlyOutBypass0[12]_i_2_n_0 ;
  wire \addEarlyOutBypass0[12]_i_3_n_0 ;
  wire \addEarlyOutBypass0[13]_i_1_n_0 ;
  wire \addEarlyOutBypass0[13]_i_2_n_0 ;
  wire \addEarlyOutBypass0[13]_i_3_n_0 ;
  wire \addEarlyOutBypass0[14]_i_1_n_0 ;
  wire \addEarlyOutBypass0[14]_i_2_n_0 ;
  wire \addEarlyOutBypass0[14]_i_3_n_0 ;
  wire \addEarlyOutBypass0[15]_i_1_n_0 ;
  wire \addEarlyOutBypass0[15]_i_2_n_0 ;
  wire \addEarlyOutBypass0[15]_i_3_n_0 ;
  wire \addEarlyOutBypass0[16]_i_1_n_0 ;
  wire \addEarlyOutBypass0[16]_i_2_n_0 ;
  wire \addEarlyOutBypass0[16]_i_3_n_0 ;
  wire \addEarlyOutBypass0[17]_i_1_n_0 ;
  wire \addEarlyOutBypass0[17]_i_2_n_0 ;
  wire \addEarlyOutBypass0[17]_i_3_n_0 ;
  wire \addEarlyOutBypass0[18]_i_1_n_0 ;
  wire \addEarlyOutBypass0[18]_i_2_n_0 ;
  wire \addEarlyOutBypass0[18]_i_3_n_0 ;
  wire \addEarlyOutBypass0[19]_i_1_n_0 ;
  wire \addEarlyOutBypass0[19]_i_2_n_0 ;
  wire \addEarlyOutBypass0[19]_i_3_n_0 ;
  wire \addEarlyOutBypass0[1]_i_1_n_0 ;
  wire \addEarlyOutBypass0[1]_i_2_n_0 ;
  wire \addEarlyOutBypass0[1]_i_3_n_0 ;
  wire \addEarlyOutBypass0[20]_i_1_n_0 ;
  wire \addEarlyOutBypass0[20]_i_2_n_0 ;
  wire \addEarlyOutBypass0[20]_i_3_n_0 ;
  wire \addEarlyOutBypass0[21]_i_1_n_0 ;
  wire \addEarlyOutBypass0[21]_i_2_n_0 ;
  wire \addEarlyOutBypass0[21]_i_3_n_0 ;
  wire \addEarlyOutBypass0[21]_i_4_n_0 ;
  wire \addEarlyOutBypass0[22]_i_1_n_0 ;
  wire \addEarlyOutBypass0[22]_i_2_n_0 ;
  wire \addEarlyOutBypass0[22]_i_3_n_0 ;
  wire \addEarlyOutBypass0[22]_i_4_n_0 ;
  wire \addEarlyOutBypass0[22]_i_5_n_0 ;
  wire \addEarlyOutBypass0[22]_i_6_n_0 ;
  wire \addEarlyOutBypass0[23]_i_1_n_0 ;
  wire \addEarlyOutBypass0[24]_i_1_n_0 ;
  wire \addEarlyOutBypass0[25]_i_1_n_0 ;
  wire \addEarlyOutBypass0[26]_i_1_n_0 ;
  wire \addEarlyOutBypass0[27]_i_1_n_0 ;
  wire \addEarlyOutBypass0[28]_i_1_n_0 ;
  wire \addEarlyOutBypass0[29]_i_1_n_0 ;
  wire \addEarlyOutBypass0[2]_i_1_n_0 ;
  wire \addEarlyOutBypass0[2]_i_2_n_0 ;
  wire \addEarlyOutBypass0[2]_i_3_n_0 ;
  wire \addEarlyOutBypass0[2]_i_4_n_0 ;
  wire \addEarlyOutBypass0[2]_i_5_n_0 ;
  wire \addEarlyOutBypass0[2]_i_6_n_0 ;
  wire \addEarlyOutBypass0[30]_i_1_n_0 ;
  wire \addEarlyOutBypass0[30]_i_2_n_0 ;
  wire \addEarlyOutBypass0[30]_i_3_n_0 ;
  wire \addEarlyOutBypass0[30]_i_4_n_0 ;
  wire \addEarlyOutBypass0[31]_i_10_n_0 ;
  wire \addEarlyOutBypass0[31]_i_11_n_0 ;
  wire \addEarlyOutBypass0[31]_i_12_n_0 ;
  wire \addEarlyOutBypass0[31]_i_13_n_0 ;
  wire \addEarlyOutBypass0[31]_i_14_n_0 ;
  wire \addEarlyOutBypass0[31]_i_15_n_0 ;
  wire \addEarlyOutBypass0[31]_i_16_n_0 ;
  wire \addEarlyOutBypass0[31]_i_17_n_0 ;
  wire \addEarlyOutBypass0[31]_i_18_n_0 ;
  wire \addEarlyOutBypass0[31]_i_19_n_0 ;
  wire \addEarlyOutBypass0[31]_i_1_n_0 ;
  wire \addEarlyOutBypass0[31]_i_20_n_0 ;
  wire \addEarlyOutBypass0[31]_i_2_n_0 ;
  wire \addEarlyOutBypass0[31]_i_3_n_0 ;
  wire \addEarlyOutBypass0[31]_i_4_n_0 ;
  wire \addEarlyOutBypass0[31]_i_5_n_0 ;
  wire \addEarlyOutBypass0[31]_i_6_n_0 ;
  wire \addEarlyOutBypass0[31]_i_7_n_0 ;
  wire \addEarlyOutBypass0[31]_i_8_n_0 ;
  wire \addEarlyOutBypass0[31]_i_9_n_0 ;
  wire \addEarlyOutBypass0[3]_i_1_n_0 ;
  wire \addEarlyOutBypass0[3]_i_2_n_0 ;
  wire \addEarlyOutBypass0[3]_i_3_n_0 ;
  wire \addEarlyOutBypass0[4]_i_1_n_0 ;
  wire \addEarlyOutBypass0[4]_i_2_n_0 ;
  wire \addEarlyOutBypass0[4]_i_3_n_0 ;
  wire \addEarlyOutBypass0[5]_i_1_n_0 ;
  wire \addEarlyOutBypass0[5]_i_2_n_0 ;
  wire \addEarlyOutBypass0[5]_i_3_n_0 ;
  wire \addEarlyOutBypass0[5]_i_4_n_0 ;
  wire \addEarlyOutBypass0[6]_i_1_n_0 ;
  wire \addEarlyOutBypass0[6]_i_2_n_0 ;
  wire \addEarlyOutBypass0[6]_i_3_n_0 ;
  wire \addEarlyOutBypass0[7]_i_1_n_0 ;
  wire \addEarlyOutBypass0[7]_i_2_n_0 ;
  wire \addEarlyOutBypass0[7]_i_3_n_0 ;
  wire \addEarlyOutBypass0[7]_i_4_n_0 ;
  wire \addEarlyOutBypass0[7]_i_5_n_0 ;
  wire \addEarlyOutBypass0[7]_i_6_n_0 ;
  wire \addEarlyOutBypass0[8]_i_1_n_0 ;
  wire \addEarlyOutBypass0[8]_i_2_n_0 ;
  wire \addEarlyOutBypass0[8]_i_3_n_0 ;
  wire \addEarlyOutBypass0[9]_i_1_n_0 ;
  wire \addEarlyOutBypass0[9]_i_2_n_0 ;
  wire \addEarlyOutBypass0[9]_i_3_n_0 ;
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
  wire addEarlyOutBypassEnable0;
  wire addEarlyOutBypassEnable0_i_1_n_0;
  wire addEarlyOutBypassEnable1_i_1_n_0;
  wire addEarlyOutBypassEnable1_reg_n_0;
  wire addEarlyOutBypassEnable2_i_1_n_0;
  wire addEarlyOutBypassEnable2_reg_n_0;
  wire [7:0]addExponentDeltaAMinusB;
  wire [7:0]addExponentDeltaAMinusB0;
  wire addExponentDeltaAMinusBShiftTooFar;
  wire addExponentDeltaAMinusBShiftTooFar_i_1_n_0;
  wire addExponentDeltaAMinusBShiftTooFar_i_2_n_0;
  wire addExponentDeltaAMinusBShiftTooFar_i_3_n_0;
  wire addExponentDeltaAMinusBShiftTooFar_i_4_n_0;
  wire addExponentDeltaAMinusBShiftTooFar_i_5_n_0;
  wire \addExponentDeltaAMinusB[4]_i_2_n_0 ;
  wire \addExponentDeltaAMinusB[4]_i_3_n_0 ;
  wire \addExponentDeltaAMinusB[4]_i_4_n_0 ;
  wire \addExponentDeltaAMinusB[4]_i_5_n_0 ;
  wire \addExponentDeltaAMinusB[4]_i_6_n_0 ;
  wire \addExponentDeltaAMinusB[4]_i_7_n_0 ;
  wire \addExponentDeltaAMinusB[5]_i_2_n_0 ;
  wire \addExponentDeltaAMinusB[5]_i_3_n_0 ;
  wire \addExponentDeltaAMinusB[5]_i_4_n_0 ;
  wire \addExponentDeltaAMinusB[7]_i_2_n_0 ;
  wire \addExponentDeltaAMinusB[7]_i_3_n_0 ;
  wire \addExponentDeltaAMinusB[7]_i_4_n_0 ;
  wire \addExponentDeltaAMinusB[7]_i_5_n_0 ;
  wire [7:1]addExponentDeltaBMinusA;
  wire [7:1]addExponentDeltaBMinusA0;
  wire addExponentDeltaBMinusAShiftTooFar;
  wire addExponentDeltaBMinusAShiftTooFar_i_1_n_0;
  wire addExponentDeltaBMinusAShiftTooFar_i_2_n_0;
  wire addExponentDeltaBMinusAShiftTooFar_i_3_n_0;
  wire addExponentDeltaBMinusAShiftTooFar_i_4_n_0;
  wire \addExponentDeltaBMinusA[4]_i_2_n_0 ;
  wire \addExponentDeltaBMinusA[4]_i_3_n_0 ;
  wire \addExponentDeltaBMinusA[4]_i_4_n_0 ;
  wire \addExponentDeltaBMinusA[4]_i_5_n_0 ;
  wire \addExponentDeltaBMinusA[5]_i_2_n_0 ;
  wire \addExponentDeltaBMinusA[5]_i_3_n_0 ;
  wire \addExponentDeltaBMinusA[7]_i_2_n_0 ;
  wire \addExponentDeltaBMinusA[7]_i_3_n_0 ;
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
  wire addMaxVal1;
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
  wire addPostAddMantissa;
  wire addPostAddMantissa1;
  wire [25:0]addPostAddMantissa10;
  wire addPostAddMantissa10_carry__0_i_10_n_0;
  wire addPostAddMantissa10_carry__0_i_11_n_0;
  wire addPostAddMantissa10_carry__0_i_12_n_0;
  wire addPostAddMantissa10_carry__0_i_13_n_0;
  wire addPostAddMantissa10_carry__0_i_14_n_0;
  wire addPostAddMantissa10_carry__0_i_15_n_0;
  wire addPostAddMantissa10_carry__0_i_16_n_0;
  wire addPostAddMantissa10_carry__0_i_17_n_0;
  wire addPostAddMantissa10_carry__0_i_18_n_0;
  wire addPostAddMantissa10_carry__0_i_19_n_0;
  wire addPostAddMantissa10_carry__0_i_1_n_0;
  wire addPostAddMantissa10_carry__0_i_20_n_0;
  wire addPostAddMantissa10_carry__0_i_21_n_0;
  wire addPostAddMantissa10_carry__0_i_22_n_0;
  wire addPostAddMantissa10_carry__0_i_23_n_0;
  wire addPostAddMantissa10_carry__0_i_24_n_0;
  wire addPostAddMantissa10_carry__0_i_25_n_0;
  wire addPostAddMantissa10_carry__0_i_26_n_0;
  wire addPostAddMantissa10_carry__0_i_27_n_0;
  wire addPostAddMantissa10_carry__0_i_28_n_0;
  wire addPostAddMantissa10_carry__0_i_29_n_0;
  wire addPostAddMantissa10_carry__0_i_2_n_0;
  wire addPostAddMantissa10_carry__0_i_30_n_0;
  wire addPostAddMantissa10_carry__0_i_31_n_0;
  wire addPostAddMantissa10_carry__0_i_32_n_0;
  wire addPostAddMantissa10_carry__0_i_33_n_0;
  wire addPostAddMantissa10_carry__0_i_34_n_0;
  wire addPostAddMantissa10_carry__0_i_35_n_0;
  wire addPostAddMantissa10_carry__0_i_3_n_0;
  wire addPostAddMantissa10_carry__0_i_4_n_0;
  wire addPostAddMantissa10_carry__0_i_5_n_0;
  wire addPostAddMantissa10_carry__0_i_6_n_0;
  wire addPostAddMantissa10_carry__0_i_7_n_0;
  wire addPostAddMantissa10_carry__0_i_8_n_0;
  wire addPostAddMantissa10_carry__0_i_9_n_0;
  wire addPostAddMantissa10_carry__0_n_0;
  wire addPostAddMantissa10_carry__0_n_1;
  wire addPostAddMantissa10_carry__0_n_2;
  wire addPostAddMantissa10_carry__0_n_3;
  wire addPostAddMantissa10_carry__0_n_5;
  wire addPostAddMantissa10_carry__0_n_6;
  wire addPostAddMantissa10_carry__0_n_7;
  wire addPostAddMantissa10_carry__1_i_10_n_0;
  wire addPostAddMantissa10_carry__1_i_11_n_0;
  wire addPostAddMantissa10_carry__1_i_12_n_0;
  wire addPostAddMantissa10_carry__1_i_13_n_0;
  wire addPostAddMantissa10_carry__1_i_14_n_0;
  wire addPostAddMantissa10_carry__1_i_15_n_0;
  wire addPostAddMantissa10_carry__1_i_16_n_0;
  wire addPostAddMantissa10_carry__1_i_17_n_0;
  wire addPostAddMantissa10_carry__1_i_18_n_0;
  wire addPostAddMantissa10_carry__1_i_19_n_0;
  wire addPostAddMantissa10_carry__1_i_1_n_0;
  wire addPostAddMantissa10_carry__1_i_20_n_0;
  wire addPostAddMantissa10_carry__1_i_21_n_0;
  wire addPostAddMantissa10_carry__1_i_22_n_0;
  wire addPostAddMantissa10_carry__1_i_23_n_0;
  wire addPostAddMantissa10_carry__1_i_24_n_0;
  wire addPostAddMantissa10_carry__1_i_25_n_0;
  wire addPostAddMantissa10_carry__1_i_26_n_0;
  wire addPostAddMantissa10_carry__1_i_27_n_0;
  wire addPostAddMantissa10_carry__1_i_28_n_3;
  wire addPostAddMantissa10_carry__1_i_28_n_5;
  wire addPostAddMantissa10_carry__1_i_28_n_6;
  wire addPostAddMantissa10_carry__1_i_28_n_7;
  wire addPostAddMantissa10_carry__1_i_29_n_0;
  wire addPostAddMantissa10_carry__1_i_2_n_0;
  wire addPostAddMantissa10_carry__1_i_30_n_0;
  wire addPostAddMantissa10_carry__1_i_31_n_0;
  wire addPostAddMantissa10_carry__1_i_32_n_0;
  wire addPostAddMantissa10_carry__1_i_33_n_0;
  wire addPostAddMantissa10_carry__1_i_34_n_0;
  wire addPostAddMantissa10_carry__1_i_35_n_0;
  wire addPostAddMantissa10_carry__1_i_36_n_0;
  wire addPostAddMantissa10_carry__1_i_37_n_0;
  wire addPostAddMantissa10_carry__1_i_38_n_0;
  wire addPostAddMantissa10_carry__1_i_39_n_0;
  wire addPostAddMantissa10_carry__1_i_3_n_0;
  wire addPostAddMantissa10_carry__1_i_4_n_0;
  wire addPostAddMantissa10_carry__1_i_5_n_0;
  wire addPostAddMantissa10_carry__1_i_6_n_0;
  wire addPostAddMantissa10_carry__1_i_7_n_0;
  wire addPostAddMantissa10_carry__1_i_8_n_0;
  wire addPostAddMantissa10_carry__1_i_9_n_0;
  wire addPostAddMantissa10_carry__1_n_0;
  wire addPostAddMantissa10_carry__1_n_1;
  wire addPostAddMantissa10_carry__1_n_2;
  wire addPostAddMantissa10_carry__1_n_3;
  wire addPostAddMantissa10_carry__1_n_5;
  wire addPostAddMantissa10_carry__1_n_6;
  wire addPostAddMantissa10_carry__1_n_7;
  wire addPostAddMantissa10_carry__2_i_1_n_0;
  wire addPostAddMantissa10_carry__2_i_2_n_0;
  wire addPostAddMantissa10_carry__2_n_7;
  wire addPostAddMantissa10_carry_i_100_n_0;
  wire addPostAddMantissa10_carry_i_101_n_0;
  wire addPostAddMantissa10_carry_i_102_n_0;
  wire addPostAddMantissa10_carry_i_103_n_0;
  wire addPostAddMantissa10_carry_i_104_n_0;
  wire addPostAddMantissa10_carry_i_105_n_0;
  wire addPostAddMantissa10_carry_i_106_n_0;
  wire addPostAddMantissa10_carry_i_107_n_0;
  wire addPostAddMantissa10_carry_i_108_n_0;
  wire addPostAddMantissa10_carry_i_109_n_0;
  wire addPostAddMantissa10_carry_i_10_n_0;
  wire addPostAddMantissa10_carry_i_110_n_0;
  wire addPostAddMantissa10_carry_i_111_n_0;
  wire addPostAddMantissa10_carry_i_112_n_0;
  wire addPostAddMantissa10_carry_i_113_n_0;
  wire addPostAddMantissa10_carry_i_114_n_0;
  wire addPostAddMantissa10_carry_i_11_n_0;
  wire addPostAddMantissa10_carry_i_12_n_0;
  wire addPostAddMantissa10_carry_i_13_n_0;
  wire addPostAddMantissa10_carry_i_14_n_0;
  wire addPostAddMantissa10_carry_i_15_n_0;
  wire addPostAddMantissa10_carry_i_16_n_0;
  wire addPostAddMantissa10_carry_i_17_n_0;
  wire addPostAddMantissa10_carry_i_18_n_0;
  wire addPostAddMantissa10_carry_i_19_n_0;
  wire addPostAddMantissa10_carry_i_20_n_0;
  wire addPostAddMantissa10_carry_i_21_n_0;
  wire addPostAddMantissa10_carry_i_22_n_0;
  wire addPostAddMantissa10_carry_i_23_n_0;
  wire addPostAddMantissa10_carry_i_24_n_0;
  wire addPostAddMantissa10_carry_i_25_n_0;
  wire addPostAddMantissa10_carry_i_26_n_0;
  wire addPostAddMantissa10_carry_i_27_n_0;
  wire addPostAddMantissa10_carry_i_28_n_0;
  wire addPostAddMantissa10_carry_i_29_n_0;
  wire addPostAddMantissa10_carry_i_2_n_0;
  wire addPostAddMantissa10_carry_i_30_n_0;
  wire addPostAddMantissa10_carry_i_31_n_0;
  wire addPostAddMantissa10_carry_i_32_n_0;
  wire addPostAddMantissa10_carry_i_33_n_0;
  wire addPostAddMantissa10_carry_i_34_n_0;
  wire addPostAddMantissa10_carry_i_35_n_0;
  wire addPostAddMantissa10_carry_i_36_n_0;
  wire addPostAddMantissa10_carry_i_37_n_0;
  wire addPostAddMantissa10_carry_i_38_n_0;
  wire addPostAddMantissa10_carry_i_39_n_0;
  wire addPostAddMantissa10_carry_i_3_n_0;
  wire addPostAddMantissa10_carry_i_40_n_0;
  wire addPostAddMantissa10_carry_i_41_n_0;
  wire addPostAddMantissa10_carry_i_42_n_0;
  wire addPostAddMantissa10_carry_i_43_n_0;
  wire addPostAddMantissa10_carry_i_44_n_0;
  wire addPostAddMantissa10_carry_i_45_n_0;
  wire addPostAddMantissa10_carry_i_46_n_0;
  wire addPostAddMantissa10_carry_i_47_n_0;
  wire addPostAddMantissa10_carry_i_48_n_0;
  wire addPostAddMantissa10_carry_i_49_n_0;
  wire addPostAddMantissa10_carry_i_4_n_0;
  wire addPostAddMantissa10_carry_i_50_n_0;
  wire addPostAddMantissa10_carry_i_51_n_0;
  wire addPostAddMantissa10_carry_i_52_n_0;
  wire addPostAddMantissa10_carry_i_53_n_0;
  wire addPostAddMantissa10_carry_i_54_n_0;
  wire addPostAddMantissa10_carry_i_55_n_0;
  wire addPostAddMantissa10_carry_i_56_n_0;
  wire addPostAddMantissa10_carry_i_57_n_0;
  wire addPostAddMantissa10_carry_i_58_n_0;
  wire addPostAddMantissa10_carry_i_59_n_0;
  wire addPostAddMantissa10_carry_i_5_n_0;
  wire addPostAddMantissa10_carry_i_60_n_0;
  wire addPostAddMantissa10_carry_i_61_n_0;
  wire addPostAddMantissa10_carry_i_62_n_0;
  wire addPostAddMantissa10_carry_i_63_n_0;
  wire addPostAddMantissa10_carry_i_64_n_0;
  wire addPostAddMantissa10_carry_i_65_n_0;
  wire addPostAddMantissa10_carry_i_66_n_0;
  wire addPostAddMantissa10_carry_i_67_n_0;
  wire addPostAddMantissa10_carry_i_68_n_0;
  wire addPostAddMantissa10_carry_i_69_n_0;
  wire addPostAddMantissa10_carry_i_6_n_0;
  wire addPostAddMantissa10_carry_i_70_n_0;
  wire addPostAddMantissa10_carry_i_71_n_0;
  wire addPostAddMantissa10_carry_i_72_n_0;
  wire addPostAddMantissa10_carry_i_73_n_0;
  wire addPostAddMantissa10_carry_i_74_n_0;
  wire addPostAddMantissa10_carry_i_75_n_0;
  wire addPostAddMantissa10_carry_i_76_n_0;
  wire addPostAddMantissa10_carry_i_76_n_1;
  wire addPostAddMantissa10_carry_i_76_n_2;
  wire addPostAddMantissa10_carry_i_76_n_3;
  wire addPostAddMantissa10_carry_i_76_n_5;
  wire addPostAddMantissa10_carry_i_76_n_6;
  wire addPostAddMantissa10_carry_i_76_n_7;
  wire addPostAddMantissa10_carry_i_77_n_0;
  wire addPostAddMantissa10_carry_i_77_n_1;
  wire addPostAddMantissa10_carry_i_77_n_2;
  wire addPostAddMantissa10_carry_i_77_n_3;
  wire addPostAddMantissa10_carry_i_77_n_5;
  wire addPostAddMantissa10_carry_i_77_n_6;
  wire addPostAddMantissa10_carry_i_77_n_7;
  wire addPostAddMantissa10_carry_i_78_n_0;
  wire addPostAddMantissa10_carry_i_79_n_0;
  wire addPostAddMantissa10_carry_i_7_n_0;
  wire addPostAddMantissa10_carry_i_80_n_0;
  wire addPostAddMantissa10_carry_i_81_n_0;
  wire addPostAddMantissa10_carry_i_82_n_0;
  wire addPostAddMantissa10_carry_i_83_n_0;
  wire addPostAddMantissa10_carry_i_84_n_0;
  wire addPostAddMantissa10_carry_i_85_n_0;
  wire addPostAddMantissa10_carry_i_86_n_0;
  wire addPostAddMantissa10_carry_i_87_n_0;
  wire addPostAddMantissa10_carry_i_88_n_0;
  wire addPostAddMantissa10_carry_i_89_n_0;
  wire addPostAddMantissa10_carry_i_8_n_0;
  wire addPostAddMantissa10_carry_i_90_n_0;
  wire addPostAddMantissa10_carry_i_91_n_0;
  wire addPostAddMantissa10_carry_i_92_n_0;
  wire addPostAddMantissa10_carry_i_93_n_0;
  wire addPostAddMantissa10_carry_i_94_n_0;
  wire addPostAddMantissa10_carry_i_95_n_0;
  wire addPostAddMantissa10_carry_i_96_n_0;
  wire addPostAddMantissa10_carry_i_97_n_0;
  wire addPostAddMantissa10_carry_i_98_n_0;
  wire addPostAddMantissa10_carry_i_99_n_0;
  wire addPostAddMantissa10_carry_i_9_n_0;
  wire addPostAddMantissa10_carry_n_0;
  wire addPostAddMantissa10_carry_n_1;
  wire addPostAddMantissa10_carry_n_2;
  wire addPostAddMantissa10_carry_n_3;
  wire addPostAddMantissa10_carry_n_5;
  wire addPostAddMantissa10_carry_n_6;
  wire addPostAddMantissa10_carry_n_7;
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
  wire \addPostAddMantissa_reg[16]_i_2_n_5 ;
  wire \addPostAddMantissa_reg[16]_i_2_n_6 ;
  wire \addPostAddMantissa_reg[16]_i_2_n_7 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_0 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_1 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_2 ;
  wire \addPostAddMantissa_reg[8]_i_2_n_3 ;
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
  wire [4:0]addRenormalizeShiftAmount;
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
  wire \addRenormalizeShiftAmount_reg[2]_i_4_n_5 ;
  wire \addRenormalizeShiftAmount_reg[2]_i_4_n_6 ;
  wire \addRenormalizeShiftAmount_reg[2]_i_4_n_7 ;
  wire addSameNumberDifferentSigns0;
  wire addSameNumberDifferentSigns00;
  wire addSameNumberDifferentSigns00_carry__0_i_1_n_0;
  wire addSameNumberDifferentSigns00_carry__0_i_2_n_0;
  wire addSameNumberDifferentSigns00_carry__0_i_3_n_0;
  wire addSameNumberDifferentSigns00_carry__0_n_6;
  wire addSameNumberDifferentSigns00_carry__0_n_7;
  wire addSameNumberDifferentSigns00_carry_i_10_n_0;
  wire addSameNumberDifferentSigns00_carry_i_11_n_0;
  wire addSameNumberDifferentSigns00_carry_i_12_n_0;
  wire addSameNumberDifferentSigns00_carry_i_13_n_0;
  wire addSameNumberDifferentSigns00_carry_i_14_n_0;
  wire addSameNumberDifferentSigns00_carry_i_15_n_0;
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
  wire addSameNumberDifferentSigns00_carry_n_5;
  wire addSameNumberDifferentSigns00_carry_n_6;
  wire addSameNumberDifferentSigns00_carry_n_7;
  wire addSameNumberDifferentSigns1_i_1_n_0;
  wire addSameNumberDifferentSigns1_reg_n_0;
  wire clk;
  wire comALessThanB;
  wire comALessThanB0_carry__0_i_10_n_0;
  wire comALessThanB0_carry__0_i_11_n_0;
  wire comALessThanB0_carry__0_i_12_n_0;
  wire comALessThanB0_carry__0_i_13_n_0;
  wire comALessThanB0_carry__0_i_14_n_0;
  wire comALessThanB0_carry__0_i_15_n_0;
  wire comALessThanB0_carry__0_i_16_n_0;
  wire comALessThanB0_carry__0_i_1_n_0;
  wire comALessThanB0_carry__0_i_2_n_0;
  wire comALessThanB0_carry__0_i_3_n_0;
  wire comALessThanB0_carry__0_i_4_n_0;
  wire comALessThanB0_carry__0_i_5_n_0;
  wire comALessThanB0_carry__0_i_6_n_0;
  wire comALessThanB0_carry__0_i_7_n_0;
  wire comALessThanB0_carry__0_i_8_n_0;
  wire comALessThanB0_carry__0_i_9_n_0;
  wire comALessThanB0_carry__0_n_1;
  wire comALessThanB0_carry__0_n_2;
  wire comALessThanB0_carry__0_n_3;
  wire comALessThanB0_carry__0_n_5;
  wire comALessThanB0_carry__0_n_6;
  wire comALessThanB0_carry__0_n_7;
  wire comALessThanB0_carry_i_10_n_0;
  wire comALessThanB0_carry_i_11_n_0;
  wire comALessThanB0_carry_i_12_n_0;
  wire comALessThanB0_carry_i_13_n_0;
  wire comALessThanB0_carry_i_14_n_0;
  wire comALessThanB0_carry_i_15_n_0;
  wire comALessThanB0_carry_i_16_n_0;
  wire comALessThanB0_carry_i_1_n_0;
  wire comALessThanB0_carry_i_2_n_0;
  wire comALessThanB0_carry_i_3_n_0;
  wire comALessThanB0_carry_i_4_n_0;
  wire comALessThanB0_carry_i_5_n_0;
  wire comALessThanB0_carry_i_6_n_0;
  wire comALessThanB0_carry_i_7_n_0;
  wire comALessThanB0_carry_i_8_n_0;
  wire comALessThanB0_carry_i_9_n_0;
  wire comALessThanB0_carry_n_0;
  wire comALessThanB0_carry_n_1;
  wire comALessThanB0_carry_n_2;
  wire comALessThanB0_carry_n_3;
  wire comALessThanB0_carry_n_5;
  wire comALessThanB0_carry_n_6;
  wire comALessThanB0_carry_n_7;
  wire [23:1]mantissaMin0;
  wire p_0_in;
  wire p_1_in;
  wire [24:1]postAddMantissa0;
  wire [3:3]NLW_addPostAddMantissa10_carry_CO_UNCONNECTED;
  wire [3:3]NLW_addPostAddMantissa10_carry__0_CO_UNCONNECTED;
  wire [3:3]NLW_addPostAddMantissa10_carry__1_CO_UNCONNECTED;
  wire [7:3]NLW_addPostAddMantissa10_carry__1_i_28_CO_UNCONNECTED;
  wire [7:6]NLW_addPostAddMantissa10_carry__1_i_28_O_UNCONNECTED;
  wire [7:1]NLW_addPostAddMantissa10_carry__2_CO_UNCONNECTED;
  wire [7:2]NLW_addPostAddMantissa10_carry__2_O_UNCONNECTED;
  wire [3:3]NLW_addPostAddMantissa10_carry_i_76_CO_UNCONNECTED;
  wire [3:3]NLW_addPostAddMantissa10_carry_i_77_CO_UNCONNECTED;
  wire [3:3]\NLW_addPostAddMantissa_reg[16]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_addPostAddMantissa_reg[8]_i_2_CO_UNCONNECTED ;
  wire [7:3]\NLW_addRenormalizeShiftAmount_reg[2]_i_4_CO_UNCONNECTED ;
  wire [3:3]NLW_addSameNumberDifferentSigns00_carry_CO_UNCONNECTED;
  wire [7:0]NLW_addSameNumberDifferentSigns00_carry_O_UNCONNECTED;
  wire [7:3]NLW_addSameNumberDifferentSigns00_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_addSameNumberDifferentSigns00_carry__0_O_UNCONNECTED;
  wire [3:3]NLW_comALessThanB0_carry_CO_UNCONNECTED;
  wire [7:0]NLW_comALessThanB0_carry_O_UNCONNECTED;
  wire [3:3]NLW_comALessThanB0_carry__0_CO_UNCONNECTED;
  wire [7:0]NLW_comALessThanB0_carry__0_O_UNCONNECTED;

  LUT6 #(
    .INIT(64'hAAAA0000AAAAC000)) 
    \OADD[0]_i_1 
       (.I0(OADD_Temp[0]),
        .I1(\OADD[2]_i_3_n_0 ),
        .I2(\addPostAddMantissa_reg_n_0_[0] ),
        .I3(\OADD[0]_i_2_n_0 ),
        .I4(addEarlyOutBypassEnable2_reg_n_0),
        .I5(addRenormalizeShiftAmount[0]),
        .O(\OADD[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \OADD[0]_i_2 
       (.I0(addRenormalizeShiftAmount[4]),
        .I1(addRenormalizeShiftAmount[3]),
        .O(\OADD[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[10]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[11]_i_2_n_0 ),
        .I2(\OADD[10]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[10]),
        .O(\OADD[10]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \OADD[10]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[3] ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(\OADD[0]_i_2_n_0 ),
        .I3(\addPostAddMantissa_reg_n_0_[7] ),
        .I4(addRenormalizeShiftAmount[1]),
        .I5(\OADD[12]_i_3_n_0 ),
        .O(\OADD[10]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[11]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[12]_i_2_n_0 ),
        .I2(\OADD[11]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[11]),
        .O(\OADD[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[11]_i_2 
       (.I0(\OADD[11]_i_3_n_0 ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\OADD[13]_i_3_n_0 ),
        .O(\OADD[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000030300000BB88)) 
    \OADD[11]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[4] ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(\addPostAddMantissa_reg_n_0_[0] ),
        .I3(\addPostAddMantissa_reg_n_0_[8] ),
        .I4(addRenormalizeShiftAmount[4]),
        .I5(addRenormalizeShiftAmount[3]),
        .O(\OADD[11]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[12]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[13]_i_2_n_0 ),
        .I2(\OADD[12]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[12]),
        .O(\OADD[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[12]_i_2 
       (.I0(\OADD[12]_i_3_n_0 ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\OADD[14]_i_3_n_0 ),
        .O(\OADD[12]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000030300000BB88)) 
    \OADD[12]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[5] ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(\addPostAddMantissa_reg_n_0_[1] ),
        .I3(\addPostAddMantissa_reg_n_0_[9] ),
        .I4(addRenormalizeShiftAmount[4]),
        .I5(addRenormalizeShiftAmount[3]),
        .O(\OADD[12]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[13]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[14]_i_2_n_0 ),
        .I2(\OADD[13]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[13]),
        .O(\OADD[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[13]_i_2 
       (.I0(\OADD[13]_i_3_n_0 ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\OADD[15]_i_3_n_0 ),
        .O(\OADD[13]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000030300000BB88)) 
    \OADD[13]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[6] ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(\addPostAddMantissa_reg_n_0_[2] ),
        .I3(\addPostAddMantissa_reg_n_0_[10] ),
        .I4(addRenormalizeShiftAmount[4]),
        .I5(addRenormalizeShiftAmount[3]),
        .O(\OADD[13]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[14]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[15]_i_2_n_0 ),
        .I2(\OADD[14]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[14]),
        .O(\OADD[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[14]_i_2 
       (.I0(\OADD[14]_i_3_n_0 ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\OADD[16]_i_3_n_0 ),
        .O(\OADD[14]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h000030300000BB88)) 
    \OADD[14]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[7] ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(\addPostAddMantissa_reg_n_0_[3] ),
        .I3(\addPostAddMantissa_reg_n_0_[11] ),
        .I4(addRenormalizeShiftAmount[4]),
        .I5(addRenormalizeShiftAmount[3]),
        .O(\OADD[14]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[15]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[16]_i_2_n_0 ),
        .I2(\OADD[15]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[15]),
        .O(\OADD[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[15]_i_2 
       (.I0(\OADD[15]_i_3_n_0 ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\OADD[17]_i_3_n_0 ),
        .O(\OADD[15]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[15]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[0] ),
        .I1(\addPostAddMantissa_reg_n_0_[8] ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(\OADD[15]_i_4_n_0 ),
        .O(\OADD[15]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h0A0C)) 
    \OADD[15]_i_4 
       (.I0(\addPostAddMantissa_reg_n_0_[4] ),
        .I1(\addPostAddMantissa_reg_n_0_[12] ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .O(\OADD[15]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[16]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[17]_i_2_n_0 ),
        .I2(\OADD[16]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[16]),
        .O(\OADD[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[16]_i_2 
       (.I0(\OADD[16]_i_3_n_0 ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\OADD[18]_i_3_n_0 ),
        .O(\OADD[16]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[16]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[1] ),
        .I1(\addPostAddMantissa_reg_n_0_[9] ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(\OADD[16]_i_4_n_0 ),
        .O(\OADD[16]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h0A0C)) 
    \OADD[16]_i_4 
       (.I0(\addPostAddMantissa_reg_n_0_[5] ),
        .I1(\addPostAddMantissa_reg_n_0_[13] ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .O(\OADD[16]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[17]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[18]_i_2_n_0 ),
        .I2(\OADD[17]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[17]),
        .O(\OADD[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[17]_i_2 
       (.I0(\OADD[17]_i_3_n_0 ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\OADD[19]_i_3_n_0 ),
        .O(\OADD[17]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[17]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[2] ),
        .I1(\addPostAddMantissa_reg_n_0_[10] ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(\OADD[17]_i_4_n_0 ),
        .O(\OADD[17]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0A0C)) 
    \OADD[17]_i_4 
       (.I0(\addPostAddMantissa_reg_n_0_[6] ),
        .I1(\addPostAddMantissa_reg_n_0_[14] ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .O(\OADD[17]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[18]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[19]_i_2_n_0 ),
        .I2(\OADD[18]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[18]),
        .O(\OADD[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[18]_i_2 
       (.I0(\OADD[18]_i_3_n_0 ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\OADD[20]_i_3_n_0 ),
        .O(\OADD[18]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[18]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[3] ),
        .I1(\addPostAddMantissa_reg_n_0_[11] ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(\OADD[18]_i_4_n_0 ),
        .O(\OADD[18]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0A0C)) 
    \OADD[18]_i_4 
       (.I0(\addPostAddMantissa_reg_n_0_[7] ),
        .I1(\addPostAddMantissa_reg_n_0_[15] ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .O(\OADD[18]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[19]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[20]_i_2_n_0 ),
        .I2(\OADD[19]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[19]),
        .O(\OADD[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[19]_i_2 
       (.I0(\OADD[19]_i_3_n_0 ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\OADD[21]_i_3_n_0 ),
        .O(\OADD[19]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[19]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[4] ),
        .I1(\addPostAddMantissa_reg_n_0_[12] ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(\OADD[22]_i_4_n_0 ),
        .O(\OADD[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFE0400000E040)) 
    \OADD[1]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[2]_i_2_n_0 ),
        .I2(\OADD[2]_i_3_n_0 ),
        .I3(\OADD[1]_i_2_n_0 ),
        .I4(addEarlyOutBypassEnable2_reg_n_0),
        .I5(OADD_Temp[1]),
        .O(\OADD[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \OADD[1]_i_2 
       (.I0(addRenormalizeShiftAmount[3]),
        .I1(addRenormalizeShiftAmount[4]),
        .I2(\addPostAddMantissa_reg_n_0_[0] ),
        .O(\OADD[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[20]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[21]_i_2_n_0 ),
        .I2(\OADD[20]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[20]),
        .O(\OADD[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \OADD[20]_i_2 
       (.I0(\OADD[20]_i_3_n_0 ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\OADD[22]_i_10_n_0 ),
        .O(\OADD[20]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[20]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[5] ),
        .I1(\addPostAddMantissa_reg_n_0_[13] ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(\OADD[22]_i_9_n_0 ),
        .O(\OADD[20]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[21]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[22]_i_3_n_0 ),
        .I2(\OADD[21]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[21]),
        .O(\OADD[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    \OADD[21]_i_2 
       (.I0(\OADD[22]_i_4_n_0 ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(\OADD[22]_i_5_n_0 ),
        .I3(\OADD[21]_i_3_n_0 ),
        .I4(addRenormalizeShiftAmount[1]),
        .O(\OADD[21]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h0A0CFFFF0A0C0000)) 
    \OADD[21]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[6] ),
        .I1(\addPostAddMantissa_reg_n_0_[14] ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(\OADD[22]_i_7_n_0 ),
        .O(\OADD[21]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[22]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
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
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addRenormalizeShiftAmount[3]),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(\OADD[22]_i_11_n_0 ),
        .O(\OADD[22]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_11 
       (.I0(\addPostAddMantissa_reg_n_0_[19] ),
        .I1(\addPostAddMantissa_reg_n_0_[11] ),
        .I2(\addPostAddMantissa_reg_n_0_[3] ),
        .I3(addRenormalizeShiftAmount[4]),
        .I4(addRenormalizeShiftAmount[3]),
        .O(\OADD[22]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hB8B8B8B8FFCC3300)) 
    \OADD[22]_i_2 
       (.I0(\OADD[22]_i_4_n_0 ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(\OADD[22]_i_5_n_0 ),
        .I3(\OADD[22]_i_6_n_0 ),
        .I4(\OADD[22]_i_7_n_0 ),
        .I5(addRenormalizeShiftAmount[1]),
        .O(\OADD[22]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[22]_i_3 
       (.I0(addRenormalizeShiftAmount[2]),
        .I1(\OADD[22]_i_8_n_0 ),
        .I2(\OADD[22]_i_9_n_0 ),
        .I3(addRenormalizeShiftAmount[1]),
        .I4(\OADD[22]_i_10_n_0 ),
        .O(\OADD[22]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_4 
       (.I0(\addPostAddMantissa_reg_n_0_[16] ),
        .I1(\addPostAddMantissa_reg_n_0_[8] ),
        .I2(\addPostAddMantissa_reg_n_0_[0] ),
        .I3(addRenormalizeShiftAmount[4]),
        .I4(addRenormalizeShiftAmount[3]),
        .O(\OADD[22]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_5 
       (.I0(\addPostAddMantissa_reg_n_0_[20] ),
        .I1(\addPostAddMantissa_reg_n_0_[12] ),
        .I2(\addPostAddMantissa_reg_n_0_[4] ),
        .I3(addRenormalizeShiftAmount[4]),
        .I4(addRenormalizeShiftAmount[3]),
        .O(\OADD[22]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_6 
       (.I0(\addPostAddMantissa_reg_n_0_[22] ),
        .I1(\addPostAddMantissa_reg_n_0_[14] ),
        .I2(\addPostAddMantissa_reg_n_0_[6] ),
        .I3(addRenormalizeShiftAmount[4]),
        .I4(addRenormalizeShiftAmount[3]),
        .O(\OADD[22]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_7 
       (.I0(\addPostAddMantissa_reg_n_0_[18] ),
        .I1(\addPostAddMantissa_reg_n_0_[10] ),
        .I2(\addPostAddMantissa_reg_n_0_[2] ),
        .I3(addRenormalizeShiftAmount[4]),
        .I4(addRenormalizeShiftAmount[3]),
        .O(\OADD[22]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_8 
       (.I0(\addPostAddMantissa_reg_n_0_[21] ),
        .I1(\addPostAddMantissa_reg_n_0_[13] ),
        .I2(\addPostAddMantissa_reg_n_0_[5] ),
        .I3(addRenormalizeShiftAmount[4]),
        .I4(addRenormalizeShiftAmount[3]),
        .O(\OADD[22]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT5 #(
    .INIT(32'h00CCF0AA)) 
    \OADD[22]_i_9 
       (.I0(\addPostAddMantissa_reg_n_0_[17] ),
        .I1(\addPostAddMantissa_reg_n_0_[9] ),
        .I2(\addPostAddMantissa_reg_n_0_[1] ),
        .I3(addRenormalizeShiftAmount[4]),
        .I4(addRenormalizeShiftAmount[3]),
        .O(\OADD[22]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'hF909)) 
    \OADD[23]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(addFinalExp[0]),
        .I2(addEarlyOutBypassEnable2_reg_n_0),
        .I3(OADD_Temp[23]),
        .O(\OADD[23]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF969900009699)) 
    \OADD[24]_i_1 
       (.I0(addFinalExp[1]),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(addRenormalizeShiftAmount[0]),
        .I3(addFinalExp[0]),
        .I4(addEarlyOutBypassEnable2_reg_n_0),
        .I5(OADD_Temp[24]),
        .O(\OADD[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF690069)) 
    \OADD[25]_i_1 
       (.I0(addFinalExp[2]),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(\OADD[25]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[25]),
        .O(\OADD[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT4 #(
    .INIT(16'h2F02)) 
    \OADD[25]_i_2 
       (.I0(addFinalExp[0]),
        .I1(addRenormalizeShiftAmount[0]),
        .I2(addRenormalizeShiftAmount[1]),
        .I3(addFinalExp[1]),
        .O(\OADD[25]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT5 #(
    .INIT(32'hFF690069)) 
    \OADD[26]_i_1 
       (.I0(addFinalExp[3]),
        .I1(addRenormalizeShiftAmount[3]),
        .I2(\OADD[26]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[26]),
        .O(\OADD[26]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2F02FFFF00002F02)) 
    \OADD[26]_i_2 
       (.I0(addFinalExp[0]),
        .I1(addRenormalizeShiftAmount[0]),
        .I2(addRenormalizeShiftAmount[1]),
        .I3(addFinalExp[1]),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(addFinalExp[2]),
        .O(\OADD[26]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFF690069)) 
    \OADD[27]_i_1 
       (.I0(addFinalExp[4]),
        .I1(addRenormalizeShiftAmount[4]),
        .I2(\OADD[27]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[27]),
        .O(\OADD[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT3 #(
    .INIT(8'hB2)) 
    \OADD[27]_i_2 
       (.I0(\OADD[26]_i_2_n_0 ),
        .I1(addRenormalizeShiftAmount[3]),
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
  (* SOFT_HLUTNM = "soft_lutpair63" *) 
  LUT5 #(
    .INIT(32'hB2FF00B2)) 
    \OADD[28]_i_2 
       (.I0(\OADD[26]_i_2_n_0 ),
        .I1(addRenormalizeShiftAmount[3]),
        .I2(addFinalExp[3]),
        .I3(addRenormalizeShiftAmount[4]),
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
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[3]_i_2_n_0 ),
        .I2(\OADD[2]_i_2_n_0 ),
        .I3(\OADD[2]_i_3_n_0 ),
        .I4(addEarlyOutBypassEnable2_reg_n_0),
        .I5(OADD_Temp[2]),
        .O(\OADD[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT3 #(
    .INIT(8'h10)) 
    \OADD[2]_i_2 
       (.I0(addRenormalizeShiftAmount[3]),
        .I1(addRenormalizeShiftAmount[4]),
        .I2(\addPostAddMantissa_reg_n_0_[1] ),
        .O(\OADD[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \OADD[2]_i_3 
       (.I0(addRenormalizeShiftAmount[2]),
        .I1(addRenormalizeShiftAmount[1]),
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
        .I1(addRenormalizeShiftAmount[4]),
        .I2(addFinalExp[3]),
        .I3(addRenormalizeShiftAmount[3]),
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
        .I1(addRenormalizeShiftAmount[4]),
        .I2(addFinalExp[3]),
        .I3(addRenormalizeShiftAmount[3]),
        .I4(\OADD[31]_i_5_n_0 ),
        .I5(addFinalExp[5]),
        .O(\OADD[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00208208)) 
    \OADD[31]_i_4 
       (.I0(\OADD[31]_i_6_n_0 ),
        .I1(\OADD[31]_i_7_n_0 ),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(addFinalExp[4]),
        .I4(addFinalExp[5]),
        .O(\OADD[31]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hBF0BFFFF0000BF0B)) 
    \OADD[31]_i_5 
       (.I0(addFinalExp[0]),
        .I1(addRenormalizeShiftAmount[0]),
        .I2(addRenormalizeShiftAmount[1]),
        .I3(addFinalExp[1]),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(addFinalExp[2]),
        .O(\OADD[31]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h9204009200000400)) 
    \OADD[31]_i_6 
       (.I0(\OADD[31]_i_8_n_0 ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(addFinalExp[1]),
        .I3(addRenormalizeShiftAmount[2]),
        .I4(addFinalExp[2]),
        .I5(\OADD[31]_i_9_n_0 ),
        .O(\OADD[31]_i_6_n_0 ));
  LUT3 #(
    .INIT(8'hB2)) 
    \OADD[31]_i_7 
       (.I0(\OADD[31]_i_5_n_0 ),
        .I1(addRenormalizeShiftAmount[3]),
        .I2(addFinalExp[3]),
        .O(\OADD[31]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \OADD[31]_i_8 
       (.I0(addFinalExp[0]),
        .I1(addRenormalizeShiftAmount[0]),
        .O(\OADD[31]_i_8_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair64" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \OADD[31]_i_9 
       (.I0(addFinalExp[3]),
        .I1(addRenormalizeShiftAmount[3]),
        .O(\OADD[31]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[3]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[4]_i_2_n_0 ),
        .I2(\OADD[3]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[3]),
        .O(\OADD[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020200000300)) 
    \OADD[3]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[0] ),
        .I1(addRenormalizeShiftAmount[3]),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(\addPostAddMantissa_reg_n_0_[2] ),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(addRenormalizeShiftAmount[1]),
        .O(\OADD[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[4]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[5]_i_2_n_0 ),
        .I2(\OADD[4]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[4]),
        .O(\OADD[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000020200000300)) 
    \OADD[4]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[1] ),
        .I1(addRenormalizeShiftAmount[3]),
        .I2(addRenormalizeShiftAmount[4]),
        .I3(\addPostAddMantissa_reg_n_0_[3] ),
        .I4(addRenormalizeShiftAmount[2]),
        .I5(addRenormalizeShiftAmount[1]),
        .O(\OADD[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[5]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[6]_i_2_n_0 ),
        .I2(\OADD[5]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[5]),
        .O(\OADD[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h30BB000030880000)) 
    \OADD[5]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[2] ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\addPostAddMantissa_reg_n_0_[0] ),
        .I3(addRenormalizeShiftAmount[2]),
        .I4(\OADD[0]_i_2_n_0 ),
        .I5(\addPostAddMantissa_reg_n_0_[4] ),
        .O(\OADD[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCCCCF0AA)) 
    \OADD[6]_i_1 
       (.I0(\OADD[7]_i_2_n_0 ),
        .I1(OADD_Temp[6]),
        .I2(\OADD[6]_i_2_n_0 ),
        .I3(addRenormalizeShiftAmount[0]),
        .I4(addEarlyOutBypassEnable2_reg_n_0),
        .O(\OADD[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h30BB000030880000)) 
    \OADD[6]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[3] ),
        .I1(addRenormalizeShiftAmount[1]),
        .I2(\addPostAddMantissa_reg_n_0_[1] ),
        .I3(addRenormalizeShiftAmount[2]),
        .I4(\OADD[0]_i_2_n_0 ),
        .I5(\addPostAddMantissa_reg_n_0_[5] ),
        .O(\OADD[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[7]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[8]_i_2_n_0 ),
        .I2(\OADD[7]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[7]),
        .O(\OADD[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \OADD[7]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[0] ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(\OADD[0]_i_2_n_0 ),
        .I3(\addPostAddMantissa_reg_n_0_[4] ),
        .I4(addRenormalizeShiftAmount[1]),
        .I5(\OADD[7]_i_3_n_0 ),
        .O(\OADD[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h000B0008)) 
    \OADD[7]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[2] ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(addRenormalizeShiftAmount[3]),
        .I3(addRenormalizeShiftAmount[4]),
        .I4(\addPostAddMantissa_reg_n_0_[6] ),
        .O(\OADD[7]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[8]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[9]_i_2_n_0 ),
        .I2(\OADD[8]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[8]),
        .O(\OADD[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \OADD[8]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[1] ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(\OADD[0]_i_2_n_0 ),
        .I3(\addPostAddMantissa_reg_n_0_[5] ),
        .I4(addRenormalizeShiftAmount[1]),
        .I5(\OADD[8]_i_3_n_0 ),
        .O(\OADD[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h000B0008)) 
    \OADD[8]_i_3 
       (.I0(\addPostAddMantissa_reg_n_0_[3] ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(addRenormalizeShiftAmount[3]),
        .I3(addRenormalizeShiftAmount[4]),
        .I4(\addPostAddMantissa_reg_n_0_[7] ),
        .O(\OADD[8]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'hFFE400E4)) 
    \OADD[9]_i_1 
       (.I0(addRenormalizeShiftAmount[0]),
        .I1(\OADD[10]_i_2_n_0 ),
        .I2(\OADD[9]_i_2_n_0 ),
        .I3(addEarlyOutBypassEnable2_reg_n_0),
        .I4(OADD_Temp[9]),
        .O(\OADD[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hB080FFFFB0800000)) 
    \OADD[9]_i_2 
       (.I0(\addPostAddMantissa_reg_n_0_[2] ),
        .I1(addRenormalizeShiftAmount[2]),
        .I2(\OADD[0]_i_2_n_0 ),
        .I3(\addPostAddMantissa_reg_n_0_[6] ),
        .I4(addRenormalizeShiftAmount[1]),
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
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \OADD_Temp[23]_i_1 
       (.I0(addEarlyOutBypass1[23]),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .O(\OADD_Temp[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \OADD_Temp[24]_i_1 
       (.I0(addEarlyOutBypass1[24]),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .O(\OADD_Temp[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \OADD_Temp[25]_i_1 
       (.I0(addEarlyOutBypass1[25]),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .O(\OADD_Temp[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \OADD_Temp[26]_i_1 
       (.I0(addEarlyOutBypass1[26]),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .O(\OADD_Temp[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \OADD_Temp[27]_i_1 
       (.I0(addEarlyOutBypass1[27]),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .O(\OADD_Temp[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \OADD_Temp[28]_i_1 
       (.I0(addEarlyOutBypass1[28]),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .O(\OADD_Temp[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \OADD_Temp[29]_i_1 
       (.I0(addEarlyOutBypass1[29]),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .O(\OADD_Temp[29]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \OADD_Temp[30]_i_1 
       (.I0(\OADD_Temp[22]_i_2_n_0 ),
        .I1(addSameNumberDifferentSigns1_reg_n_0),
        .I2(addEarlyOutBypassEnable1_reg_n_0),
        .O(\OADD_Temp[30]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \OADD_Temp[30]_i_2 
       (.I0(addEarlyOutBypass1[30]),
        .I1(addEarlyOutBypassEnable1_reg_n_0),
        .O(\OADD_Temp[30]_i_2_n_0 ));
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
        .S(\OADD_Temp[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[24] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[24]_i_1_n_0 ),
        .Q(OADD_Temp[24]),
        .S(\OADD_Temp[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[25] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[25]_i_1_n_0 ),
        .Q(OADD_Temp[25]),
        .S(\OADD_Temp[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[26] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[26]_i_1_n_0 ),
        .Q(OADD_Temp[26]),
        .S(\OADD_Temp[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[27] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[27]_i_1_n_0 ),
        .Q(OADD_Temp[27]),
        .S(\OADD_Temp[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[28] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[28]_i_1_n_0 ),
        .Q(OADD_Temp[28]),
        .S(\OADD_Temp[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \OADD_Temp_reg[29] 
       (.C(clk),
        .CE(\OADD_Temp[22]_i_2_n_0 ),
        .D(\OADD_Temp[29]_i_1_n_0 ),
        .Q(OADD_Temp[29]),
        .S(\OADD_Temp[30]_i_1_n_0 ));
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
        .D(\OADD_Temp[30]_i_2_n_0 ),
        .Q(OADD_Temp[30]),
        .S(\OADD_Temp[30]_i_1_n_0 ));
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
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[0]_i_1 
       (.I0(IN_A[0]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[10]_i_1 
       (.I0(IN_A[10]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[11]_i_1 
       (.I0(IN_A[11]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[12]_i_1 
       (.I0(IN_A[12]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[13]_i_1 
       (.I0(IN_A[13]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[14]_i_1 
       (.I0(IN_A[14]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[15]_i_1 
       (.I0(IN_A[15]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[16]_i_1 
       (.I0(IN_A[16]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[17]_i_1 
       (.I0(IN_A[17]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[18]_i_1 
       (.I0(IN_A[18]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[19]_i_1 
       (.I0(IN_A[19]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[1]_i_1 
       (.I0(IN_A[1]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[20]_i_1 
       (.I0(IN_A[20]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[21]_i_1 
       (.I0(IN_A[21]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[22]_i_1 
       (.I0(IN_A[22]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \addDenormFlushedValA[22]_i_2 
       (.I0(IN_A[26]),
        .I1(IN_A[30]),
        .I2(IN_A[28]),
        .I3(IN_A[29]),
        .I4(\addDenormFlushedValA[22]_i_3_n_0 ),
        .O(\addDenormFlushedValA[22]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addDenormFlushedValA[22]_i_3 
       (.I0(IN_A[25]),
        .I1(IN_A[23]),
        .I2(IN_A[27]),
        .I3(IN_A[24]),
        .O(\addDenormFlushedValA[22]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[2]_i_1 
       (.I0(IN_A[2]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[3]_i_1 
       (.I0(IN_A[3]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[4]_i_1 
       (.I0(IN_A[4]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[5]_i_1 
       (.I0(IN_A[5]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[6]_i_1 
       (.I0(IN_A[6]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[7]_i_1 
       (.I0(IN_A[7]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[8]_i_1 
       (.I0(IN_A[8]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValA[9]_i_1 
       (.I0(IN_A[9]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addDenormFlushedValA[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[0] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[0]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[10] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[10]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[11] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[11]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[12] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[12]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[13] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[13]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[14] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[14]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[15] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[15]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[16] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[16]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[17] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[17]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[18] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[18]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[19] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[19]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[1] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[1]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[20] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[20]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[21] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[21]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[22] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[22]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[23] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[23]),
        .Q(\addDenormFlushedValA_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[24] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[24]),
        .Q(\addDenormFlushedValA_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[25] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[25]),
        .Q(\addDenormFlushedValA_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[26] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[26]),
        .Q(\addDenormFlushedValA_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[27] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[27]),
        .Q(\addDenormFlushedValA_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[28] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[28]),
        .Q(\addDenormFlushedValA_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[29] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[29]),
        .Q(\addDenormFlushedValA_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[2] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[2]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[30] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_A[30]),
        .Q(\addDenormFlushedValA_reg_n_0_[30] ),
        .R(1'b0));
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
        .D(\addDenormFlushedValA[3]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[4] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[4]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[5] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[5]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[6] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[6]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[7] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[7]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[8] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[8]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValA_reg[9] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValA[9]_i_1_n_0 ),
        .Q(\addDenormFlushedValA_reg_n_0_[9] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[0]_i_1 
       (.I0(IN_B[0]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[10]_i_1 
       (.I0(IN_B[10]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[11]_i_1 
       (.I0(IN_B[11]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[12]_i_1 
       (.I0(IN_B[12]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[13]_i_1 
       (.I0(IN_B[13]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[14]_i_1 
       (.I0(IN_B[14]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[15]_i_1 
       (.I0(IN_B[15]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[16]_i_1 
       (.I0(IN_B[16]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[17]_i_1 
       (.I0(IN_B[17]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[18]_i_1 
       (.I0(IN_B[18]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[19]_i_1 
       (.I0(IN_B[19]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[1]_i_1 
       (.I0(IN_B[1]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[20]_i_1 
       (.I0(IN_B[20]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[21]_i_1 
       (.I0(IN_B[21]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[22]_i_1 
       (.I0(IN_B[22]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00000001)) 
    \addDenormFlushedValB[22]_i_2 
       (.I0(IN_B[26]),
        .I1(IN_B[30]),
        .I2(IN_B[28]),
        .I3(IN_B[29]),
        .I4(\addDenormFlushedValB[22]_i_3_n_0 ),
        .O(\addDenormFlushedValB[22]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addDenormFlushedValB[22]_i_3 
       (.I0(IN_B[25]),
        .I1(IN_B[23]),
        .I2(IN_B[27]),
        .I3(IN_B[24]),
        .O(\addDenormFlushedValB[22]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[2]_i_1 
       (.I0(IN_B[2]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[3]_i_1 
       (.I0(IN_B[3]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[4]_i_1 
       (.I0(IN_B[4]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[5]_i_1 
       (.I0(IN_B[5]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[6]_i_1 
       (.I0(IN_B[6]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[7]_i_1 
       (.I0(IN_B[7]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[8]_i_1 
       (.I0(IN_B[8]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \addDenormFlushedValB[9]_i_1 
       (.I0(IN_B[9]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addDenormFlushedValB[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[0] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[0]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[10] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[10]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[11] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[11]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[12] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[12]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[13] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[13]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[14] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[14]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[15] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[15]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[16] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[16]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[17] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[17]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[18] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[18]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[19] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[19]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[1] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[1]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[20] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[20]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[21] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[21]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[22] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[22]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[23] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_B[23]),
        .Q(\addDenormFlushedValB_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[24] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_B[24]),
        .Q(\addDenormFlushedValB_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[25] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_B[25]),
        .Q(\addDenormFlushedValB_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[26] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_B[26]),
        .Q(\addDenormFlushedValB_reg_n_0_[26] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[27] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_B[27]),
        .Q(\addDenormFlushedValB_reg_n_0_[27] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[28] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_B[28]),
        .Q(\addDenormFlushedValB_reg_n_0_[28] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[29] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_B[29]),
        .Q(\addDenormFlushedValB_reg_n_0_[29] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[2] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[2]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[30] 
       (.C(clk),
        .CE(IADD_GO),
        .D(IN_B[30]),
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
        .D(\addDenormFlushedValB[3]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[4] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[4]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[5] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[5]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[6] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[6]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[7] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[7]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[8] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[8]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addDenormFlushedValB_reg[9] 
       (.C(clk),
        .CE(IADD_GO),
        .D(\addDenormFlushedValB[9]_i_1_n_0 ),
        .Q(\addDenormFlushedValB_reg_n_0_[9] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFACF0AC0)) 
    \addEarlyOutBypass0[0]_i_1 
       (.I0(IN_B[0]),
        .I1(IN_A[0]),
        .I2(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I3(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I4(\addEarlyOutBypass0[0]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8F8BBF8A8F8FFF8)) 
    \addEarlyOutBypass0[0]_i_2 
       (.I0(\addEarlyOutBypass0[2]_i_3_n_0 ),
        .I1(\addEarlyOutBypass0[2]_i_4_n_0 ),
        .I2(IN_A[0]),
        .I3(\addEarlyOutBypass0[2]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[0]_i_3_n_0 ),
        .I5(addSameNumberDifferentSigns00),
        .O(\addEarlyOutBypass0[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hBFB0BFBF)) 
    \addEarlyOutBypass0[0]_i_3 
       (.I0(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I1(IN_B[0]),
        .I2(comALessThanB),
        .I3(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I4(IN_A[0]),
        .O(\addEarlyOutBypass0[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[10]_i_1 
       (.I0(\addEarlyOutBypass0[10]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .I2(\addEarlyOutBypass0[10]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[21]_i_3_n_0 ),
        .I5(IN_A[10]),
        .O(\addEarlyOutBypass0[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hDDDDFF0F)) 
    \addEarlyOutBypass0[10]_i_2 
       (.I0(IN_B[10]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(IN_A[10]),
        .I3(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I4(comALessThanB),
        .O(\addEarlyOutBypass0[10]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT4 #(
    .INIT(16'h5808)) 
    \addEarlyOutBypass0[10]_i_3 
       (.I0(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I1(IN_A[10]),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_B[10]),
        .O(\addEarlyOutBypass0[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[11]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[11]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[11]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[22]_i_6_n_0 ),
        .I5(IN_A[11]),
        .O(\addEarlyOutBypass0[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[11]_i_2 
       (.I0(IN_B[11]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[11]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[11]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT4 #(
    .INIT(16'h5808)) 
    \addEarlyOutBypass0[11]_i_3 
       (.I0(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I1(IN_A[11]),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_B[11]),
        .O(\addEarlyOutBypass0[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[12]_i_1 
       (.I0(\addEarlyOutBypass0[12]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .I2(\addEarlyOutBypass0[12]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[22]_i_6_n_0 ),
        .I5(IN_A[12]),
        .O(\addEarlyOutBypass0[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hDDDDFF0F)) 
    \addEarlyOutBypass0[12]_i_2 
       (.I0(IN_B[12]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(IN_A[12]),
        .I3(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I4(comALessThanB),
        .O(\addEarlyOutBypass0[12]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT4 #(
    .INIT(16'h2C20)) 
    \addEarlyOutBypass0[12]_i_3 
       (.I0(IN_B[12]),
        .I1(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_A[12]),
        .O(\addEarlyOutBypass0[12]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[13]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[13]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[13]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[22]_i_6_n_0 ),
        .I5(IN_A[13]),
        .O(\addEarlyOutBypass0[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[13]_i_2 
       (.I0(IN_B[13]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[13]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[13]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT4 #(
    .INIT(16'h2C20)) 
    \addEarlyOutBypass0[13]_i_3 
       (.I0(IN_B[13]),
        .I1(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_A[13]),
        .O(\addEarlyOutBypass0[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[14]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[14]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[14]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[22]_i_6_n_0 ),
        .I5(IN_A[14]),
        .O(\addEarlyOutBypass0[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[14]_i_2 
       (.I0(IN_B[14]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[14]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[14]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2C20)) 
    \addEarlyOutBypass0[14]_i_3 
       (.I0(IN_B[14]),
        .I1(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_A[14]),
        .O(\addEarlyOutBypass0[14]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[15]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[15]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[15]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[22]_i_6_n_0 ),
        .I5(IN_A[15]),
        .O(\addEarlyOutBypass0[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[15]_i_2 
       (.I0(IN_B[15]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[15]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2C20)) 
    \addEarlyOutBypass0[15]_i_3 
       (.I0(IN_B[15]),
        .I1(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_A[15]),
        .O(\addEarlyOutBypass0[15]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[16]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[16]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[16]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[22]_i_6_n_0 ),
        .I5(IN_A[16]),
        .O(\addEarlyOutBypass0[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[16]_i_2 
       (.I0(IN_B[16]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[16]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[16]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT4 #(
    .INIT(16'h2C20)) 
    \addEarlyOutBypass0[16]_i_3 
       (.I0(IN_B[16]),
        .I1(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_A[16]),
        .O(\addEarlyOutBypass0[16]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[17]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[17]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[17]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[21]_i_3_n_0 ),
        .I5(IN_A[17]),
        .O(\addEarlyOutBypass0[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[17]_i_2 
       (.I0(IN_B[17]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[17]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[17]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT4 #(
    .INIT(16'h2C20)) 
    \addEarlyOutBypass0[17]_i_3 
       (.I0(IN_B[17]),
        .I1(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_A[17]),
        .O(\addEarlyOutBypass0[17]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[18]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[18]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[18]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[21]_i_3_n_0 ),
        .I5(IN_A[18]),
        .O(\addEarlyOutBypass0[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[18]_i_2 
       (.I0(IN_B[18]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[18]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[18]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2C20)) 
    \addEarlyOutBypass0[18]_i_3 
       (.I0(IN_B[18]),
        .I1(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_A[18]),
        .O(\addEarlyOutBypass0[18]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF4F4F444)) 
    \addEarlyOutBypass0[19]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[19]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I3(\addEarlyOutBypass0[21]_i_3_n_0 ),
        .I4(IN_A[19]),
        .I5(\addEarlyOutBypass0[19]_i_3_n_0 ),
        .O(\addEarlyOutBypass0[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[19]_i_2 
       (.I0(IN_B[19]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[19]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[19]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h2C20)) 
    \addEarlyOutBypass0[19]_i_3 
       (.I0(IN_B[19]),
        .I1(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_A[19]),
        .O(\addEarlyOutBypass0[19]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF4F4F444)) 
    \addEarlyOutBypass0[1]_i_1 
       (.I0(\addEarlyOutBypass0[1]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .I2(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I3(\addEarlyOutBypass0[21]_i_3_n_0 ),
        .I4(IN_A[1]),
        .I5(\addEarlyOutBypass0[1]_i_3_n_0 ),
        .O(\addEarlyOutBypass0[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT5 #(
    .INIT(32'hFF0FDDDD)) 
    \addEarlyOutBypass0[1]_i_2 
       (.I0(IN_A[1]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I2(IN_B[1]),
        .I3(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I4(comALessThanB),
        .O(\addEarlyOutBypass0[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h5808)) 
    \addEarlyOutBypass0[1]_i_3 
       (.I0(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I1(IN_A[1]),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_B[1]),
        .O(\addEarlyOutBypass0[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[20]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[20]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[20]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[22]_i_6_n_0 ),
        .I5(IN_A[20]),
        .O(\addEarlyOutBypass0[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[20]_i_2 
       (.I0(IN_B[20]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[20]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[20]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT4 #(
    .INIT(16'h2C20)) 
    \addEarlyOutBypass0[20]_i_3 
       (.I0(IN_B[20]),
        .I1(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_A[20]),
        .O(\addEarlyOutBypass0[20]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF4F4F444)) 
    \addEarlyOutBypass0[21]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[21]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I3(\addEarlyOutBypass0[21]_i_3_n_0 ),
        .I4(IN_A[21]),
        .I5(\addEarlyOutBypass0[21]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[21]_i_2 
       (.I0(IN_B[21]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[21]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[21]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \addEarlyOutBypass0[21]_i_3 
       (.I0(IN_B[31]),
        .I1(IN_A[31]),
        .I2(\addEarlyOutBypass0[31]_i_8_n_0 ),
        .O(\addEarlyOutBypass0[21]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT4 #(
    .INIT(16'h2C20)) 
    \addEarlyOutBypass0[21]_i_4 
       (.I0(IN_B[21]),
        .I1(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_A[21]),
        .O(\addEarlyOutBypass0[21]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[22]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[22]_i_3_n_0 ),
        .I2(\addEarlyOutBypass0[22]_i_4_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[22]_i_6_n_0 ),
        .I5(IN_A[22]),
        .O(\addEarlyOutBypass0[22]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFAEEA)) 
    \addEarlyOutBypass0[22]_i_2 
       (.I0(\addEarlyOutBypass0[31]_i_8_n_0 ),
        .I1(addSameNumberDifferentSigns00),
        .I2(IN_B[31]),
        .I3(IN_A[31]),
        .I4(\addEarlyOutBypass0[31]_i_7_n_0 ),
        .I5(\addEarlyOutBypass0[7]_i_3_n_0 ),
        .O(\addEarlyOutBypass0[22]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[22]_i_3 
       (.I0(IN_B[22]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[22]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[22]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT4 #(
    .INIT(16'h2C20)) 
    \addEarlyOutBypass0[22]_i_4 
       (.I0(IN_B[22]),
        .I1(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_A[22]),
        .O(\addEarlyOutBypass0[22]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \addEarlyOutBypass0[22]_i_5 
       (.I0(\addEarlyOutBypass0[31]_i_8_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_7_n_0 ),
        .O(\addEarlyOutBypass0[22]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \addEarlyOutBypass0[22]_i_6 
       (.I0(IN_B[31]),
        .I1(IN_A[31]),
        .I2(\addEarlyOutBypass0[31]_i_7_n_0 ),
        .O(\addEarlyOutBypass0[22]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT4 #(
    .INIT(16'h00E2)) 
    \addEarlyOutBypass0[23]_i_1 
       (.I0(IN_A[23]),
        .I1(comALessThanB),
        .I2(IN_B[23]),
        .I3(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT4 #(
    .INIT(16'h00E2)) 
    \addEarlyOutBypass0[24]_i_1 
       (.I0(IN_A[24]),
        .I1(comALessThanB),
        .I2(IN_B[24]),
        .I3(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[24]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \addEarlyOutBypass0[25]_i_1 
       (.I0(IN_A[25]),
        .I1(comALessThanB),
        .I2(IN_B[25]),
        .I3(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[25]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \addEarlyOutBypass0[26]_i_1 
       (.I0(IN_A[26]),
        .I1(comALessThanB),
        .I2(IN_B[26]),
        .I3(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[26]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \addEarlyOutBypass0[27]_i_1 
       (.I0(IN_A[27]),
        .I1(comALessThanB),
        .I2(IN_B[27]),
        .I3(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[27]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \addEarlyOutBypass0[28]_i_1 
       (.I0(IN_A[28]),
        .I1(comALessThanB),
        .I2(IN_B[28]),
        .I3(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[28]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \addEarlyOutBypass0[29]_i_1 
       (.I0(IN_A[29]),
        .I1(comALessThanB),
        .I2(IN_B[29]),
        .I3(\addEarlyOutBypass0[7]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFACF0AC0)) 
    \addEarlyOutBypass0[2]_i_1 
       (.I0(IN_B[2]),
        .I1(IN_A[2]),
        .I2(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I3(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I4(\addEarlyOutBypass0[2]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA8F8BBF8A8F8FFF8)) 
    \addEarlyOutBypass0[2]_i_2 
       (.I0(\addEarlyOutBypass0[2]_i_3_n_0 ),
        .I1(\addEarlyOutBypass0[2]_i_4_n_0 ),
        .I2(IN_A[2]),
        .I3(\addEarlyOutBypass0[2]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[2]_i_6_n_0 ),
        .I5(addSameNumberDifferentSigns00),
        .O(\addEarlyOutBypass0[2]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \addEarlyOutBypass0[2]_i_3 
       (.I0(\addEarlyOutBypass0[31]_i_9_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_10_n_0 ),
        .I3(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .O(\addEarlyOutBypass0[2]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \addEarlyOutBypass0[2]_i_4 
       (.I0(IN_A[31]),
        .I1(IN_B[31]),
        .O(\addEarlyOutBypass0[2]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    \addEarlyOutBypass0[2]_i_5 
       (.I0(\addEarlyOutBypass0[31]_i_9_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_10_n_0 ),
        .I3(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .O(\addEarlyOutBypass0[2]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'hBFB0BFBF)) 
    \addEarlyOutBypass0[2]_i_6 
       (.I0(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I1(IN_B[2]),
        .I2(comALessThanB),
        .I3(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I4(IN_A[2]),
        .O(\addEarlyOutBypass0[2]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hE000E0E0)) 
    \addEarlyOutBypass0[30]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I1(\addEarlyOutBypass0[7]_i_3_n_0 ),
        .I2(IADD_GO),
        .I3(\addEarlyOutBypass0[30]_i_3_n_0 ),
        .I4(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .O(\addEarlyOutBypass0[30]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \addEarlyOutBypass0[30]_i_2 
       (.I0(IN_A[30]),
        .I1(comALessThanB),
        .I2(IN_B[30]),
        .I3(\addEarlyOutBypass0[30]_i_4_n_0 ),
        .O(\addEarlyOutBypass0[30]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addEarlyOutBypass0[30]_i_3 
       (.I0(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I1(comALessThanB),
        .I2(\addDenormFlushedValB[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[30]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'hFF60)) 
    \addEarlyOutBypass0[30]_i_4 
       (.I0(IN_A[31]),
        .I1(IN_B[31]),
        .I2(addSameNumberDifferentSigns00),
        .I3(\addEarlyOutBypass0[31]_i_8_n_0 ),
        .O(\addEarlyOutBypass0[30]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hDFD50000)) 
    \addEarlyOutBypass0[31]_i_1 
       (.I0(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I4(IADD_GO),
        .O(\addEarlyOutBypass0[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \addEarlyOutBypass0[31]_i_10 
       (.I0(\addEarlyOutBypass0[31]_i_13_n_0 ),
        .I1(IN_B[21]),
        .I2(IN_B[5]),
        .I3(IN_B[8]),
        .I4(IN_B[6]),
        .I5(\addEarlyOutBypass0[31]_i_14_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_10_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addEarlyOutBypass0[31]_i_11 
       (.I0(IN_A[19]),
        .I1(IN_A[16]),
        .I2(IN_A[22]),
        .I3(IN_A[9]),
        .O(\addEarlyOutBypass0[31]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \addEarlyOutBypass0[31]_i_12 
       (.I0(\addEarlyOutBypass0[31]_i_15_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_16_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_17_n_0 ),
        .I3(IN_A[12]),
        .I4(IN_A[13]),
        .I5(IN_A[2]),
        .O(\addEarlyOutBypass0[31]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addEarlyOutBypass0[31]_i_13 
       (.I0(IN_B[19]),
        .I1(IN_B[16]),
        .I2(IN_B[22]),
        .I3(IN_B[9]),
        .O(\addEarlyOutBypass0[31]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \addEarlyOutBypass0[31]_i_14 
       (.I0(\addEarlyOutBypass0[31]_i_18_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_19_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_20_n_0 ),
        .I3(IN_B[12]),
        .I4(IN_B[13]),
        .I5(IN_B[2]),
        .O(\addEarlyOutBypass0[31]_i_14_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addEarlyOutBypass0[31]_i_15 
       (.I0(IN_A[18]),
        .I1(IN_A[7]),
        .I2(IN_A[17]),
        .I3(IN_A[1]),
        .O(\addEarlyOutBypass0[31]_i_15_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addEarlyOutBypass0[31]_i_16 
       (.I0(IN_A[14]),
        .I1(IN_A[11]),
        .I2(IN_A[20]),
        .I3(IN_A[10]),
        .O(\addEarlyOutBypass0[31]_i_16_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addEarlyOutBypass0[31]_i_17 
       (.I0(IN_A[15]),
        .I1(IN_A[4]),
        .I2(IN_A[3]),
        .I3(IN_A[0]),
        .O(\addEarlyOutBypass0[31]_i_17_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addEarlyOutBypass0[31]_i_18 
       (.I0(IN_B[18]),
        .I1(IN_B[7]),
        .I2(IN_B[17]),
        .I3(IN_B[1]),
        .O(\addEarlyOutBypass0[31]_i_18_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addEarlyOutBypass0[31]_i_19 
       (.I0(IN_B[14]),
        .I1(IN_B[11]),
        .I2(IN_B[20]),
        .I3(IN_B[10]),
        .O(\addEarlyOutBypass0[31]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h0FAACC0F)) 
    \addEarlyOutBypass0[31]_i_2 
       (.I0(IN_B[31]),
        .I1(IN_A[31]),
        .I2(\addEarlyOutBypass0[31]_i_4_n_0 ),
        .I3(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addEarlyOutBypass0[31]_i_20 
       (.I0(IN_B[15]),
        .I1(IN_B[4]),
        .I2(IN_B[3]),
        .I3(IN_B[0]),
        .O(\addEarlyOutBypass0[31]_i_20_n_0 ));
  LUT6 #(
    .INIT(64'h0000000010011111)) 
    \addEarlyOutBypass0[31]_i_3 
       (.I0(\addEarlyOutBypass0[7]_i_3_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_7_n_0 ),
        .I2(IN_A[31]),
        .I3(IN_B[31]),
        .I4(addSameNumberDifferentSigns00),
        .I5(\addEarlyOutBypass0[31]_i_8_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h00FF00FF0FFF0EDF)) 
    \addEarlyOutBypass0[31]_i_4 
       (.I0(comALessThanB),
        .I1(addSameNumberDifferentSigns00),
        .I2(IN_B[31]),
        .I3(IN_A[31]),
        .I4(\addEarlyOutBypass0[31]_i_8_n_0 ),
        .I5(\addEarlyOutBypass0[31]_i_7_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \addEarlyOutBypass0[31]_i_5 
       (.I0(IN_B[30]),
        .I1(\addExponentDeltaAMinusB[7]_i_2_n_0 ),
        .I2(IN_B[29]),
        .O(\addEarlyOutBypass0[31]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \addEarlyOutBypass0[31]_i_6 
       (.I0(IN_A[29]),
        .I1(\addExponentDeltaAMinusB[7]_i_4_n_0 ),
        .I2(IN_A[30]),
        .O(\addEarlyOutBypass0[31]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \addEarlyOutBypass0[31]_i_7 
       (.I0(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_9_n_0 ),
        .I3(\addEarlyOutBypass0[31]_i_10_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT4 #(
    .INIT(16'h0010)) 
    \addEarlyOutBypass0[31]_i_8 
       (.I0(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I2(\addEarlyOutBypass0[31]_i_10_n_0 ),
        .I3(\addEarlyOutBypass0[31]_i_9_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \addEarlyOutBypass0[31]_i_9 
       (.I0(\addEarlyOutBypass0[31]_i_11_n_0 ),
        .I1(IN_A[21]),
        .I2(IN_A[5]),
        .I3(IN_A[8]),
        .I4(IN_A[6]),
        .I5(\addEarlyOutBypass0[31]_i_12_n_0 ),
        .O(\addEarlyOutBypass0[31]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF4F4F444)) 
    \addEarlyOutBypass0[3]_i_1 
       (.I0(\addEarlyOutBypass0[3]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .I2(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I3(\addEarlyOutBypass0[21]_i_3_n_0 ),
        .I4(IN_A[3]),
        .I5(\addEarlyOutBypass0[3]_i_3_n_0 ),
        .O(\addEarlyOutBypass0[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT5 #(
    .INIT(32'hFF0FDDDD)) 
    \addEarlyOutBypass0[3]_i_2 
       (.I0(IN_A[3]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I2(IN_B[3]),
        .I3(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I4(comALessThanB),
        .O(\addEarlyOutBypass0[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT4 #(
    .INIT(16'h5808)) 
    \addEarlyOutBypass0[3]_i_3 
       (.I0(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I1(IN_A[3]),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_B[3]),
        .O(\addEarlyOutBypass0[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF4F4F444)) 
    \addEarlyOutBypass0[4]_i_1 
       (.I0(\addEarlyOutBypass0[4]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .I2(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I3(\addEarlyOutBypass0[21]_i_3_n_0 ),
        .I4(IN_A[4]),
        .I5(\addEarlyOutBypass0[4]_i_3_n_0 ),
        .O(\addEarlyOutBypass0[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT5 #(
    .INIT(32'hFF0FDDDD)) 
    \addEarlyOutBypass0[4]_i_2 
       (.I0(IN_A[4]),
        .I1(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I2(IN_B[4]),
        .I3(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I4(comALessThanB),
        .O(\addEarlyOutBypass0[4]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h5808)) 
    \addEarlyOutBypass0[4]_i_3 
       (.I0(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I1(IN_A[4]),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_B[4]),
        .O(\addEarlyOutBypass0[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8B88BBBB8B888B88)) 
    \addEarlyOutBypass0[5]_i_1 
       (.I0(\addEarlyOutBypass0[5]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[7]_i_3_n_0 ),
        .I2(\addEarlyOutBypass0[7]_i_4_n_0 ),
        .I3(\addEarlyOutBypass0[5]_i_3_n_0 ),
        .I4(\addEarlyOutBypass0[5]_i_4_n_0 ),
        .I5(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .O(\addEarlyOutBypass0[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addEarlyOutBypass0[5]_i_2 
       (.I0(IN_B[5]),
        .I1(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I2(IN_A[5]),
        .O(\addEarlyOutBypass0[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[5]_i_3 
       (.I0(IN_B[5]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[5]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[5]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'h5445)) 
    \addEarlyOutBypass0[5]_i_4 
       (.I0(IN_A[5]),
        .I1(\addEarlyOutBypass0[31]_i_7_n_0 ),
        .I2(IN_A[31]),
        .I3(IN_B[31]),
        .O(\addEarlyOutBypass0[5]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[6]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[6]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[6]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[21]_i_3_n_0 ),
        .I5(IN_A[6]),
        .O(\addEarlyOutBypass0[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[6]_i_2 
       (.I0(IN_B[6]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[6]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[6]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT4 #(
    .INIT(16'h5808)) 
    \addEarlyOutBypass0[6]_i_3 
       (.I0(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I1(IN_A[6]),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_B[6]),
        .O(\addEarlyOutBypass0[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8B88BBBB8B888B88)) 
    \addEarlyOutBypass0[7]_i_1 
       (.I0(\addEarlyOutBypass0[7]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[7]_i_3_n_0 ),
        .I2(\addEarlyOutBypass0[7]_i_4_n_0 ),
        .I3(\addEarlyOutBypass0[7]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[7]_i_6_n_0 ),
        .I5(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .O(\addEarlyOutBypass0[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addEarlyOutBypass0[7]_i_2 
       (.I0(IN_B[7]),
        .I1(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I2(IN_A[7]),
        .O(\addEarlyOutBypass0[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \addEarlyOutBypass0[7]_i_3 
       (.I0(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .O(\addEarlyOutBypass0[7]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hFFFFAEEA)) 
    \addEarlyOutBypass0[7]_i_4 
       (.I0(\addEarlyOutBypass0[31]_i_8_n_0 ),
        .I1(addSameNumberDifferentSigns00),
        .I2(IN_B[31]),
        .I3(IN_A[31]),
        .I4(\addEarlyOutBypass0[31]_i_7_n_0 ),
        .O(\addEarlyOutBypass0[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[7]_i_5 
       (.I0(IN_B[7]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[7]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT4 #(
    .INIT(16'h5445)) 
    \addEarlyOutBypass0[7]_i_6 
       (.I0(IN_A[7]),
        .I1(\addEarlyOutBypass0[31]_i_7_n_0 ),
        .I2(IN_A[31]),
        .I3(IN_B[31]),
        .O(\addEarlyOutBypass0[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFF4F4F444)) 
    \addEarlyOutBypass0[8]_i_1 
       (.I0(\addEarlyOutBypass0[8]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .I2(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I3(\addEarlyOutBypass0[21]_i_3_n_0 ),
        .I4(IN_A[8]),
        .I5(\addEarlyOutBypass0[8]_i_3_n_0 ),
        .O(\addEarlyOutBypass0[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hDDDDFF0F)) 
    \addEarlyOutBypass0[8]_i_2 
       (.I0(IN_B[8]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(IN_A[8]),
        .I3(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I4(comALessThanB),
        .O(\addEarlyOutBypass0[8]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT4 #(
    .INIT(16'h5808)) 
    \addEarlyOutBypass0[8]_i_3 
       (.I0(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I1(IN_A[8]),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_B[8]),
        .O(\addEarlyOutBypass0[8]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFF4FFF4FFF4F4F4)) 
    \addEarlyOutBypass0[9]_i_1 
       (.I0(\addEarlyOutBypass0[22]_i_2_n_0 ),
        .I1(\addEarlyOutBypass0[9]_i_2_n_0 ),
        .I2(\addEarlyOutBypass0[9]_i_3_n_0 ),
        .I3(\addEarlyOutBypass0[22]_i_5_n_0 ),
        .I4(\addEarlyOutBypass0[22]_i_6_n_0 ),
        .I5(IN_A[9]),
        .O(\addEarlyOutBypass0[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h20202F20)) 
    \addEarlyOutBypass0[9]_i_2 
       (.I0(IN_B[9]),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(IN_A[9]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(\addEarlyOutBypass0[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT4 #(
    .INIT(16'h5808)) 
    \addEarlyOutBypass0[9]_i_3 
       (.I0(\addEarlyOutBypass0[31]_i_5_n_0 ),
        .I1(IN_A[9]),
        .I2(\addEarlyOutBypass0[31]_i_6_n_0 ),
        .I3(IN_B[9]),
        .O(\addEarlyOutBypass0[9]_i_3_n_0 ));
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
  FDSE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[23] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[23]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[23]),
        .S(\addEarlyOutBypass0[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[24] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[24]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[24]),
        .S(\addEarlyOutBypass0[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[25] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[25]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[25]),
        .S(\addEarlyOutBypass0[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[26] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[26]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[26]),
        .S(\addEarlyOutBypass0[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[27] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[27]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[27]),
        .S(\addEarlyOutBypass0[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[28] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[28]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[28]),
        .S(\addEarlyOutBypass0[30]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[29] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[29]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[29]),
        .S(\addEarlyOutBypass0[30]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[2] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[2]_i_1_n_0 ),
        .Q(addEarlyOutBypass0[2]),
        .R(1'b0));
  FDSE #(
    .INIT(1'b0)) 
    \addEarlyOutBypass0_reg[30] 
       (.C(clk),
        .CE(\addEarlyOutBypass0[31]_i_1_n_0 ),
        .D(\addEarlyOutBypass0[30]_i_2_n_0 ),
        .Q(addEarlyOutBypass0[30]),
        .S(\addEarlyOutBypass0[30]_i_1_n_0 ));
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
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[0]_i_1 
       (.I0(addEarlyOutBypass0[0]),
        .I1(\addDenormFlushedValB_reg_n_0_[0] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[0] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[10]_i_1 
       (.I0(addEarlyOutBypass0[10]),
        .I1(\addDenormFlushedValB_reg_n_0_[10] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[10] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[11]_i_1 
       (.I0(addEarlyOutBypass0[11]),
        .I1(\addDenormFlushedValB_reg_n_0_[11] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[11] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[12]_i_1 
       (.I0(addEarlyOutBypass0[12]),
        .I1(\addDenormFlushedValB_reg_n_0_[12] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[12] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[13]_i_1 
       (.I0(addEarlyOutBypass0[13]),
        .I1(\addDenormFlushedValB_reg_n_0_[13] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[13] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[14]_i_1 
       (.I0(addEarlyOutBypass0[14]),
        .I1(\addDenormFlushedValB_reg_n_0_[14] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[14] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[15]_i_1 
       (.I0(addEarlyOutBypass0[15]),
        .I1(\addDenormFlushedValB_reg_n_0_[15] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[15] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[16]_i_1 
       (.I0(addEarlyOutBypass0[16]),
        .I1(\addDenormFlushedValB_reg_n_0_[16] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[16] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[17]_i_1 
       (.I0(addEarlyOutBypass0[17]),
        .I1(\addDenormFlushedValB_reg_n_0_[17] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[17] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[18]_i_1 
       (.I0(addEarlyOutBypass0[18]),
        .I1(\addDenormFlushedValB_reg_n_0_[18] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[18] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[20]_i_1 
       (.I0(addEarlyOutBypass0[20]),
        .I1(\addDenormFlushedValB_reg_n_0_[20] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[20] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[21]_i_1 
       (.I0(addEarlyOutBypass0[21]),
        .I1(\addDenormFlushedValB_reg_n_0_[21] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[21] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
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
    .INIT(32'hB8FFB800)) 
    \addEarlyOutBypass1[31]_i_1 
       (.I0(p_0_in),
        .I1(addALessThanB),
        .I2(p_1_in),
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
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[3]_i_1 
       (.I0(addEarlyOutBypass0[3]),
        .I1(\addDenormFlushedValB_reg_n_0_[3] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[3] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[4]_i_1 
       (.I0(addEarlyOutBypass0[4]),
        .I1(\addDenormFlushedValB_reg_n_0_[4] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[4] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[5]_i_1 
       (.I0(addEarlyOutBypass0[5]),
        .I1(\addDenormFlushedValB_reg_n_0_[5] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[5] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[6]_i_1 
       (.I0(addEarlyOutBypass0[6]),
        .I1(\addDenormFlushedValB_reg_n_0_[6] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[6] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[7]_i_1 
       (.I0(addEarlyOutBypass0[7]),
        .I1(\addDenormFlushedValB_reg_n_0_[7] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[7] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT5 #(
    .INIT(32'hCFC0AAAA)) 
    \addEarlyOutBypass1[8]_i_1 
       (.I0(addEarlyOutBypass0[8]),
        .I1(\addDenormFlushedValB_reg_n_0_[8] ),
        .I2(addALessThanB),
        .I3(\addDenormFlushedValA_reg_n_0_[8] ),
        .I4(\addEarlyOutBypass1[31]_i_2_n_0 ),
        .O(\addEarlyOutBypass1[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
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
    .INIT(64'hFC0CFFFFAAAAAAAA)) 
    addEarlyOutBypassEnable0_i_1
       (.I0(addEarlyOutBypassEnable0),
        .I1(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I2(comALessThanB),
        .I3(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I4(\addEarlyOutBypass0[31]_i_3_n_0 ),
        .I5(IADD_GO),
        .O(addEarlyOutBypassEnable0_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    addEarlyOutBypassEnable0_reg
       (.C(clk),
        .CE(1'b1),
        .D(addEarlyOutBypassEnable0_i_1_n_0),
        .Q(addEarlyOutBypassEnable0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    addEarlyOutBypassEnable1_i_1
       (.I0(addEarlyOutBypassEnable0),
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
    .INIT(64'hFFFFFFFFEEEFEEEE)) 
    addExponentDeltaAMinusBShiftTooFar_i_1
       (.I0(addExponentDeltaAMinusB0[7]),
        .I1(addExponentDeltaAMinusB0[5]),
        .I2(addExponentDeltaAMinusBShiftTooFar_i_2_n_0),
        .I3(addExponentDeltaAMinusBShiftTooFar_i_3_n_0),
        .I4(addExponentDeltaAMinusB0[4]),
        .I5(addExponentDeltaAMinusB0[6]),
        .O(addExponentDeltaAMinusBShiftTooFar_i_1_n_0));
  LUT6 #(
    .INIT(64'hA96A56955695A96A)) 
    addExponentDeltaAMinusBShiftTooFar_i_2
       (.I0(addExponentDeltaAMinusBShiftTooFar_i_4_n_0),
        .I1(IN_A[25]),
        .I2(addExponentDeltaAMinusBShiftTooFar_i_5_n_0),
        .I3(IN_B[25]),
        .I4(IN_A[26]),
        .I5(IN_B[26]),
        .O(addExponentDeltaAMinusBShiftTooFar_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    addExponentDeltaAMinusBShiftTooFar_i_3
       (.I0(IN_A[25]),
        .I1(IN_B[25]),
        .I2(IN_B[24]),
        .I3(IN_A[24]),
        .I4(IN_B[23]),
        .I5(IN_A[23]),
        .O(addExponentDeltaAMinusBShiftTooFar_i_3_n_0));
  LUT6 #(
    .INIT(64'hBF0BC0C0C0C0BF0B)) 
    addExponentDeltaAMinusBShiftTooFar_i_4
       (.I0(IN_A[23]),
        .I1(IN_B[23]),
        .I2(IN_B[24]),
        .I3(IN_A[24]),
        .I4(IN_A[25]),
        .I5(IN_B[25]),
        .O(addExponentDeltaAMinusBShiftTooFar_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT2 #(
    .INIT(4'h7)) 
    addExponentDeltaAMinusBShiftTooFar_i_5
       (.I0(IN_B[23]),
        .I1(IN_B[24]),
        .O(addExponentDeltaAMinusBShiftTooFar_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    addExponentDeltaAMinusBShiftTooFar_reg
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaAMinusBShiftTooFar_i_1_n_0),
        .Q(addExponentDeltaAMinusBShiftTooFar),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \addExponentDeltaAMinusB[0]_i_1 
       (.I0(IN_B[23]),
        .I1(IN_A[23]),
        .O(addExponentDeltaAMinusB0[0]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT4 #(
    .INIT(16'h4BB4)) 
    \addExponentDeltaAMinusB[1]_i_1 
       (.I0(IN_A[23]),
        .I1(IN_B[23]),
        .I2(IN_A[24]),
        .I3(IN_B[24]),
        .O(addExponentDeltaAMinusB0[1]));
  LUT6 #(
    .INIT(64'h44D4BB2BBB2B44D4)) 
    \addExponentDeltaAMinusB[2]_i_1 
       (.I0(IN_A[24]),
        .I1(IN_B[24]),
        .I2(IN_B[23]),
        .I3(IN_A[23]),
        .I4(IN_A[25]),
        .I5(IN_B[25]),
        .O(addExponentDeltaAMinusB0[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \addExponentDeltaAMinusB[3]_i_1 
       (.I0(addExponentDeltaAMinusBShiftTooFar_i_2_n_0),
        .O(addExponentDeltaAMinusB0[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h96969669)) 
    \addExponentDeltaAMinusB[4]_i_1 
       (.I0(IN_B[27]),
        .I1(\addExponentDeltaAMinusB[4]_i_2_n_0 ),
        .I2(IN_A[27]),
        .I3(\addExponentDeltaAMinusB[4]_i_3_n_0 ),
        .I4(\addExponentDeltaAMinusB[4]_i_4_n_0 ),
        .O(addExponentDeltaAMinusB0[4]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \addExponentDeltaAMinusB[4]_i_2 
       (.I0(IN_B[26]),
        .I1(IN_B[23]),
        .I2(IN_B[24]),
        .I3(IN_B[25]),
        .O(\addExponentDeltaAMinusB[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00D0F0FFD0DD00F0)) 
    \addExponentDeltaAMinusB[4]_i_3 
       (.I0(IN_A[25]),
        .I1(addExponentDeltaBMinusAShiftTooFar_i_4_n_0),
        .I2(\addExponentDeltaAMinusB[4]_i_5_n_0 ),
        .I3(IN_A[26]),
        .I4(\addExponentDeltaAMinusB[4]_i_6_n_0 ),
        .I5(IN_B[26]),
        .O(\addExponentDeltaAMinusB[4]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'h00008000)) 
    \addExponentDeltaAMinusB[4]_i_4 
       (.I0(IN_B[25]),
        .I1(IN_B[24]),
        .I2(IN_B[23]),
        .I3(IN_B[26]),
        .I4(\addExponentDeltaAMinusB[4]_i_7_n_0 ),
        .O(\addExponentDeltaAMinusB[4]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h1500355015403D54)) 
    \addExponentDeltaAMinusB[4]_i_5 
       (.I0(IN_A[25]),
        .I1(IN_B[23]),
        .I2(IN_B[24]),
        .I3(IN_B[25]),
        .I4(IN_A[24]),
        .I5(IN_A[23]),
        .O(\addExponentDeltaAMinusB[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \addExponentDeltaAMinusB[4]_i_6 
       (.I0(IN_B[25]),
        .I1(IN_B[24]),
        .I2(IN_B[23]),
        .O(\addExponentDeltaAMinusB[4]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \addExponentDeltaAMinusB[4]_i_7 
       (.I0(IN_A[25]),
        .I1(IN_A[23]),
        .I2(IN_A[24]),
        .I3(IN_A[26]),
        .O(\addExponentDeltaAMinusB[4]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h96969669)) 
    \addExponentDeltaAMinusB[5]_i_1 
       (.I0(IN_B[28]),
        .I1(\addExponentDeltaAMinusB[5]_i_2_n_0 ),
        .I2(IN_A[28]),
        .I3(\addExponentDeltaAMinusB[5]_i_3_n_0 ),
        .I4(\addExponentDeltaAMinusB[5]_i_4_n_0 ),
        .O(addExponentDeltaAMinusB0[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \addExponentDeltaAMinusB[5]_i_2 
       (.I0(IN_B[25]),
        .I1(IN_B[24]),
        .I2(IN_B[23]),
        .I3(IN_B[26]),
        .I4(IN_B[27]),
        .O(\addExponentDeltaAMinusB[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h45040445)) 
    \addExponentDeltaAMinusB[5]_i_3 
       (.I0(\addExponentDeltaAMinusB[4]_i_4_n_0 ),
        .I1(\addExponentDeltaAMinusB[4]_i_3_n_0 ),
        .I2(IN_A[27]),
        .I3(\addExponentDeltaAMinusB[4]_i_2_n_0 ),
        .I4(IN_B[27]),
        .O(\addExponentDeltaAMinusB[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \addExponentDeltaAMinusB[5]_i_4 
       (.I0(IN_B[27]),
        .I1(IN_B[26]),
        .I2(IN_B[23]),
        .I3(IN_B[24]),
        .I4(IN_B[25]),
        .I5(\addExponentDeltaBMinusA[5]_i_2_n_0 ),
        .O(\addExponentDeltaAMinusB[5]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h96699666)) 
    \addExponentDeltaAMinusB[6]_i_1 
       (.I0(IN_B[29]),
        .I1(IN_A[29]),
        .I2(\addExponentDeltaAMinusB[7]_i_3_n_0 ),
        .I3(\addExponentDeltaAMinusB[7]_i_2_n_0 ),
        .I4(\addExponentDeltaAMinusB[7]_i_4_n_0 ),
        .O(addExponentDeltaAMinusB0[6]));
  LUT6 #(
    .INIT(64'h00960F9FFF69F060)) 
    \addExponentDeltaAMinusB[7]_i_1 
       (.I0(IN_B[29]),
        .I1(IN_A[29]),
        .I2(\addExponentDeltaAMinusB[7]_i_2_n_0 ),
        .I3(\addExponentDeltaAMinusB[7]_i_3_n_0 ),
        .I4(\addExponentDeltaAMinusB[7]_i_4_n_0 ),
        .I5(\addExponentDeltaAMinusB[7]_i_5_n_0 ),
        .O(addExponentDeltaAMinusB0[7]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \addExponentDeltaAMinusB[7]_i_2 
       (.I0(IN_B[27]),
        .I1(IN_B[26]),
        .I2(IN_B[23]),
        .I3(IN_B[24]),
        .I4(IN_B[25]),
        .I5(IN_B[28]),
        .O(\addExponentDeltaAMinusB[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h45040445)) 
    \addExponentDeltaAMinusB[7]_i_3 
       (.I0(\addExponentDeltaAMinusB[5]_i_4_n_0 ),
        .I1(\addExponentDeltaAMinusB[5]_i_3_n_0 ),
        .I2(IN_A[28]),
        .I3(\addExponentDeltaAMinusB[5]_i_2_n_0 ),
        .I4(IN_B[28]),
        .O(\addExponentDeltaAMinusB[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \addExponentDeltaAMinusB[7]_i_4 
       (.I0(IN_A[27]),
        .I1(IN_A[25]),
        .I2(IN_A[23]),
        .I3(IN_A[24]),
        .I4(IN_A[26]),
        .I5(IN_A[28]),
        .O(\addExponentDeltaAMinusB[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h3693C96C)) 
    \addExponentDeltaAMinusB[7]_i_5 
       (.I0(IN_A[29]),
        .I1(IN_B[30]),
        .I2(\addExponentDeltaAMinusB[7]_i_2_n_0 ),
        .I3(IN_B[29]),
        .I4(IN_A[30]),
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
    .INIT(64'hFFFFFFFFEEEFEEEE)) 
    addExponentDeltaBMinusAShiftTooFar_i_1
       (.I0(addExponentDeltaBMinusA0[7]),
        .I1(addExponentDeltaBMinusA0[5]),
        .I2(addExponentDeltaAMinusBShiftTooFar_i_3_n_0),
        .I3(addExponentDeltaBMinusAShiftTooFar_i_2_n_0),
        .I4(addExponentDeltaBMinusA0[4]),
        .I5(addExponentDeltaBMinusA0[6]),
        .O(addExponentDeltaBMinusAShiftTooFar_i_1_n_0));
  LUT6 #(
    .INIT(64'h9969669696996966)) 
    addExponentDeltaBMinusAShiftTooFar_i_2
       (.I0(addExponentDeltaBMinusAShiftTooFar_i_3_n_0),
        .I1(IN_B[26]),
        .I2(addExponentDeltaBMinusAShiftTooFar_i_4_n_0),
        .I3(IN_A[25]),
        .I4(IN_A[26]),
        .I5(IN_B[25]),
        .O(addExponentDeltaBMinusAShiftTooFar_i_2_n_0));
  LUT6 #(
    .INIT(64'hBF0BC0C0C0C0BF0B)) 
    addExponentDeltaBMinusAShiftTooFar_i_3
       (.I0(IN_B[23]),
        .I1(IN_A[23]),
        .I2(IN_A[24]),
        .I3(IN_B[24]),
        .I4(IN_B[25]),
        .I5(IN_A[25]),
        .O(addExponentDeltaBMinusAShiftTooFar_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT2 #(
    .INIT(4'h7)) 
    addExponentDeltaBMinusAShiftTooFar_i_4
       (.I0(IN_A[23]),
        .I1(IN_A[24]),
        .O(addExponentDeltaBMinusAShiftTooFar_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    addExponentDeltaBMinusAShiftTooFar_reg
       (.C(clk),
        .CE(IADD_GO),
        .D(addExponentDeltaBMinusAShiftTooFar_i_1_n_0),
        .Q(addExponentDeltaBMinusAShiftTooFar),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT4 #(
    .INIT(16'h4BB4)) 
    \addExponentDeltaBMinusA[1]_i_1 
       (.I0(IN_B[23]),
        .I1(IN_A[23]),
        .I2(IN_A[24]),
        .I3(IN_B[24]),
        .O(addExponentDeltaBMinusA0[1]));
  LUT6 #(
    .INIT(64'h6966666699996966)) 
    \addExponentDeltaBMinusA[2]_i_1 
       (.I0(IN_A[25]),
        .I1(IN_B[25]),
        .I2(IN_B[23]),
        .I3(IN_A[23]),
        .I4(IN_A[24]),
        .I5(IN_B[24]),
        .O(addExponentDeltaBMinusA0[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \addExponentDeltaBMinusA[3]_i_1 
       (.I0(addExponentDeltaBMinusAShiftTooFar_i_2_n_0),
        .O(addExponentDeltaBMinusA0[3]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h9996)) 
    \addExponentDeltaBMinusA[4]_i_1 
       (.I0(\addExponentDeltaBMinusA[4]_i_2_n_0 ),
        .I1(IN_B[27]),
        .I2(\addExponentDeltaBMinusA[4]_i_3_n_0 ),
        .I3(\addExponentDeltaAMinusB[4]_i_4_n_0 ),
        .O(addExponentDeltaBMinusA0[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \addExponentDeltaBMinusA[4]_i_2 
       (.I0(IN_A[27]),
        .I1(IN_A[26]),
        .I2(IN_A[24]),
        .I3(IN_A[23]),
        .I4(IN_A[25]),
        .O(\addExponentDeltaBMinusA[4]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0FF00B000F0B0BB)) 
    \addExponentDeltaBMinusA[4]_i_3 
       (.I0(addExponentDeltaAMinusBShiftTooFar_i_5_n_0),
        .I1(IN_B[25]),
        .I2(\addExponentDeltaBMinusA[4]_i_4_n_0 ),
        .I3(IN_B[26]),
        .I4(\addExponentDeltaBMinusA[4]_i_5_n_0 ),
        .I5(IN_A[26]),
        .O(\addExponentDeltaBMinusA[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h01500FFF00007150)) 
    \addExponentDeltaBMinusA[4]_i_4 
       (.I0(IN_B[24]),
        .I1(IN_B[23]),
        .I2(IN_A[24]),
        .I3(IN_A[23]),
        .I4(IN_B[25]),
        .I5(IN_A[25]),
        .O(\addExponentDeltaBMinusA[4]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \addExponentDeltaBMinusA[4]_i_5 
       (.I0(IN_A[24]),
        .I1(IN_A[23]),
        .I2(IN_A[25]),
        .O(\addExponentDeltaBMinusA[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h96969669)) 
    \addExponentDeltaBMinusA[5]_i_1 
       (.I0(IN_A[28]),
        .I1(\addExponentDeltaBMinusA[5]_i_2_n_0 ),
        .I2(IN_B[28]),
        .I3(\addExponentDeltaBMinusA[5]_i_3_n_0 ),
        .I4(\addExponentDeltaAMinusB[5]_i_4_n_0 ),
        .O(addExponentDeltaBMinusA0[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \addExponentDeltaBMinusA[5]_i_2 
       (.I0(IN_A[26]),
        .I1(IN_A[24]),
        .I2(IN_A[23]),
        .I3(IN_A[25]),
        .I4(IN_A[27]),
        .O(\addExponentDeltaBMinusA[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT4 #(
    .INIT(16'h2302)) 
    \addExponentDeltaBMinusA[5]_i_3 
       (.I0(\addExponentDeltaBMinusA[4]_i_3_n_0 ),
        .I1(\addExponentDeltaAMinusB[4]_i_4_n_0 ),
        .I2(IN_B[27]),
        .I3(\addExponentDeltaBMinusA[4]_i_2_n_0 ),
        .O(\addExponentDeltaBMinusA[5]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h96966966)) 
    \addExponentDeltaBMinusA[6]_i_1 
       (.I0(IN_B[29]),
        .I1(IN_A[29]),
        .I2(\addExponentDeltaBMinusA[7]_i_2_n_0 ),
        .I3(\addExponentDeltaAMinusB[7]_i_2_n_0 ),
        .I4(\addExponentDeltaAMinusB[7]_i_4_n_0 ),
        .O(addExponentDeltaBMinusA0[6]));
  LUT6 #(
    .INIT(64'h00960F9FFF69F060)) 
    \addExponentDeltaBMinusA[7]_i_1 
       (.I0(IN_B[29]),
        .I1(IN_A[29]),
        .I2(\addExponentDeltaAMinusB[7]_i_4_n_0 ),
        .I3(\addExponentDeltaBMinusA[7]_i_2_n_0 ),
        .I4(\addExponentDeltaAMinusB[7]_i_2_n_0 ),
        .I5(\addExponentDeltaBMinusA[7]_i_3_n_0 ),
        .O(addExponentDeltaBMinusA0[7]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h23020223)) 
    \addExponentDeltaBMinusA[7]_i_2 
       (.I0(\addExponentDeltaBMinusA[5]_i_3_n_0 ),
        .I1(\addExponentDeltaAMinusB[5]_i_4_n_0 ),
        .I2(IN_B[28]),
        .I3(\addExponentDeltaBMinusA[5]_i_2_n_0 ),
        .I4(IN_A[28]),
        .O(\addExponentDeltaBMinusA[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'h3963C69C)) 
    \addExponentDeltaBMinusA[7]_i_3 
       (.I0(IN_B[29]),
        .I1(IN_A[30]),
        .I2(IN_A[29]),
        .I3(\addExponentDeltaAMinusB[7]_i_4_n_0 ),
        .I4(IN_B[30]),
        .O(\addExponentDeltaBMinusA[7]_i_3_n_0 ));
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
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h9A95)) 
    \addFinalExp[0]_i_1 
       (.I0(\addMaxVal1_reg_n_0_[23] ),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(\addPostAddMantissa1_reg_n_0_[24] ),
        .O(\addFinalExp[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT5 #(
    .INIT(32'h1015EFEA)) 
    \addFinalExp[1]_i_1 
       (.I0(\addMaxVal1_reg_n_0_[23] ),
        .I1(postAddMantissa0[24]),
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
        .I3(postAddMantissa0[24]),
        .I4(\addMaxVal1_reg_n_0_[23] ),
        .I5(\addMaxVal1_reg_n_0_[25] ),
        .O(\addFinalExp[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \addFinalExp[3]_i_1 
       (.I0(\addFinalExp[5]_i_2_n_0 ),
        .I1(\addMaxVal1_reg_n_0_[24] ),
        .I2(\addMaxVal1_reg_n_0_[25] ),
        .I3(\addMaxVal1_reg_n_0_[26] ),
        .O(\addFinalExp[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT4 #(
    .INIT(16'hFFE2)) 
    \addFinalExp[5]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[24] ),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .I2(postAddMantissa0[24]),
        .I3(\addMaxVal1_reg_n_0_[23] ),
        .O(\addFinalExp[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF001D0000FFE2)) 
    \addFinalExp[6]_i_1 
       (.I0(\addPostAddMantissa1_reg_n_0_[24] ),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .I2(postAddMantissa0[24]),
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
        .I4(postAddMantissa0[24]),
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
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[23]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[23] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[23] ),
        .O(\addMaxVal1[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[24]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[24] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[24] ),
        .O(\addMaxVal1[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[25]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[25] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[25] ),
        .O(\addMaxVal1[25]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[26]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[26] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[26] ),
        .O(\addMaxVal1[26]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[27]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[27] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[27] ),
        .O(\addMaxVal1[27]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \addMaxVal1[28]_i_1 
       (.I0(\addDenormFlushedValB_reg_n_0_[28] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[28] ),
        .O(\addMaxVal1[28]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
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
       (.I0(addEarlyOutBypassEnable0),
        .I1(addPipelineValidStage0),
        .I2(p_1_in),
        .I3(p_0_in),
        .I4(addSameNumberDifferentSigns0),
        .O(addMaxVal1));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
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
  CARRY8 addPostAddMantissa10_carry
       (.CI(GetFloatIsNegative),
        .CI_TOP(1'b0),
        .CO({addPostAddMantissa10_carry_n_0,addPostAddMantissa10_carry_n_1,addPostAddMantissa10_carry_n_2,addPostAddMantissa10_carry_n_3,NLW_addPostAddMantissa10_carry_CO_UNCONNECTED[3],addPostAddMantissa10_carry_n_5,addPostAddMantissa10_carry_n_6,addPostAddMantissa10_carry_n_7}),
        .DI({addPostAddMantissa10_carry_i_2_n_0,addPostAddMantissa10_carry_i_3_n_0,addPostAddMantissa10_carry_i_4_n_0,addPostAddMantissa10_carry_i_5_n_0,addPostAddMantissa10_carry_i_6_n_0,addPostAddMantissa10_carry_i_7_n_0,addPostAddMantissa10_carry_i_8_n_0,addPostAddMantissa10_carry_i_9_n_0}),
        .O(addPostAddMantissa10[7:0]),
        .S({addPostAddMantissa10_carry_i_10_n_0,addPostAddMantissa10_carry_i_11_n_0,addPostAddMantissa10_carry_i_12_n_0,addPostAddMantissa10_carry_i_13_n_0,addPostAddMantissa10_carry_i_14_n_0,addPostAddMantissa10_carry_i_15_n_0,addPostAddMantissa10_carry_i_16_n_0,addPostAddMantissa10_carry_i_17_n_0}));
  CARRY8 addPostAddMantissa10_carry__0
       (.CI(addPostAddMantissa10_carry_n_0),
        .CI_TOP(1'b0),
        .CO({addPostAddMantissa10_carry__0_n_0,addPostAddMantissa10_carry__0_n_1,addPostAddMantissa10_carry__0_n_2,addPostAddMantissa10_carry__0_n_3,NLW_addPostAddMantissa10_carry__0_CO_UNCONNECTED[3],addPostAddMantissa10_carry__0_n_5,addPostAddMantissa10_carry__0_n_6,addPostAddMantissa10_carry__0_n_7}),
        .DI({addPostAddMantissa10_carry__0_i_1_n_0,addPostAddMantissa10_carry__0_i_2_n_0,addPostAddMantissa10_carry__0_i_3_n_0,addPostAddMantissa10_carry__0_i_4_n_0,addPostAddMantissa10_carry__0_i_5_n_0,addPostAddMantissa10_carry__0_i_6_n_0,addPostAddMantissa10_carry__0_i_7_n_0,addPostAddMantissa10_carry__0_i_8_n_0}),
        .O(addPostAddMantissa10[15:8]),
        .S({addPostAddMantissa10_carry__0_i_9_n_0,addPostAddMantissa10_carry__0_i_10_n_0,addPostAddMantissa10_carry__0_i_11_n_0,addPostAddMantissa10_carry__0_i_12_n_0,addPostAddMantissa10_carry__0_i_13_n_0,addPostAddMantissa10_carry__0_i_14_n_0,addPostAddMantissa10_carry__0_i_15_n_0,addPostAddMantissa10_carry__0_i_16_n_0}));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__0_i_1
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[15] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[15] ),
        .O(addPostAddMantissa10_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__0_i_10
       (.I0(addPostAddMantissa10_carry__0_i_2_n_0),
        .I1(addPostAddMantissa10_carry__0_i_19_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__0_i_17_n_0),
        .O(addPostAddMantissa10_carry__0_i_10_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__0_i_11
       (.I0(addPostAddMantissa10_carry__0_i_3_n_0),
        .I1(addPostAddMantissa10_carry__0_i_20_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__0_i_19_n_0),
        .O(addPostAddMantissa10_carry__0_i_11_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__0_i_12
       (.I0(addPostAddMantissa10_carry__0_i_4_n_0),
        .I1(addPostAddMantissa10_carry__0_i_21_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__0_i_20_n_0),
        .O(addPostAddMantissa10_carry__0_i_12_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__0_i_13
       (.I0(addPostAddMantissa10_carry__0_i_5_n_0),
        .I1(addPostAddMantissa10_carry__0_i_22_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__0_i_21_n_0),
        .O(addPostAddMantissa10_carry__0_i_13_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__0_i_14
       (.I0(addPostAddMantissa10_carry__0_i_6_n_0),
        .I1(addPostAddMantissa10_carry__0_i_23_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__0_i_22_n_0),
        .O(addPostAddMantissa10_carry__0_i_14_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__0_i_15
       (.I0(addPostAddMantissa10_carry__0_i_7_n_0),
        .I1(addPostAddMantissa10_carry__0_i_24_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__0_i_23_n_0),
        .O(addPostAddMantissa10_carry__0_i_15_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__0_i_16
       (.I0(addPostAddMantissa10_carry__0_i_8_n_0),
        .I1(addPostAddMantissa10_carry_i_19_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__0_i_24_n_0),
        .O(addPostAddMantissa10_carry__0_i_16_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__0_i_17
       (.I0(addPostAddMantissa10_carry__0_i_25_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry__0_i_26_n_0),
        .O(addPostAddMantissa10_carry__0_i_17_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__0_i_18
       (.I0(addPostAddMantissa10_carry__0_i_27_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry__0_i_28_n_0),
        .O(addPostAddMantissa10_carry__0_i_18_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__0_i_19
       (.I0(addPostAddMantissa10_carry__0_i_28_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry__0_i_29_n_0),
        .O(addPostAddMantissa10_carry__0_i_19_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__0_i_2
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[14] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[14] ),
        .O(addPostAddMantissa10_carry__0_i_2_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__0_i_20
       (.I0(addPostAddMantissa10_carry__0_i_26_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry__0_i_30_n_0),
        .O(addPostAddMantissa10_carry__0_i_20_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__0_i_21
       (.I0(addPostAddMantissa10_carry__0_i_29_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry__0_i_31_n_0),
        .O(addPostAddMantissa10_carry__0_i_21_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__0_i_22
       (.I0(addPostAddMantissa10_carry__0_i_30_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry__0_i_32_n_0),
        .O(addPostAddMantissa10_carry__0_i_22_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__0_i_23
       (.I0(addPostAddMantissa10_carry__0_i_31_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry_i_35_n_0),
        .O(addPostAddMantissa10_carry__0_i_23_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__0_i_24
       (.I0(addPostAddMantissa10_carry__0_i_32_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry_i_31_n_0),
        .O(addPostAddMantissa10_carry__0_i_24_n_0));
  LUT6 #(
    .INIT(64'hFF00FB0BFF00F808)) 
    addPostAddMantissa10_carry__0_i_25
       (.I0(addPostAddMantissa10_carry_i_70_n_0),
        .I1(addPostAddMantissa10_carry_i_33_n_0),
        .I2(addPostAddMantissa10_carry_i_44_n_0),
        .I3(addPostAddMantissa10_carry__1_i_19_n_0),
        .I4(addPostAddMantissa10_carry__1_i_26_n_0),
        .I5(addPostAddMantissa10_carry_i_69_n_0),
        .O(addPostAddMantissa10_carry__0_i_25_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10_carry__0_i_26
       (.I0(addPostAddMantissa10_carry__1_i_19_n_0),
        .I1(addPostAddMantissa10_carry__0_i_33_n_0),
        .I2(addPostAddMantissa10_carry_i_33_n_0),
        .I3(addPostAddMantissa10_carry__0_i_34_n_0),
        .I4(addPostAddMantissa10_carry_i_44_n_0),
        .I5(addPostAddMantissa10_carry_i_58_n_0),
        .O(addPostAddMantissa10_carry__0_i_26_n_0));
  LUT6 #(
    .INIT(64'hFF00FB0BFF00F808)) 
    addPostAddMantissa10_carry__0_i_27
       (.I0(addPostAddMantissa10_carry__1_i_29_n_0),
        .I1(addPostAddMantissa10_carry_i_33_n_0),
        .I2(addPostAddMantissa10_carry_i_44_n_0),
        .I3(addPostAddMantissa10_carry__1_i_19_n_0),
        .I4(addPostAddMantissa10_carry__1_i_26_n_0),
        .I5(addPostAddMantissa10_carry_i_67_n_0),
        .O(addPostAddMantissa10_carry__0_i_27_n_0));
  LUT6 #(
    .INIT(64'hFF00FB0BFF00F808)) 
    addPostAddMantissa10_carry__0_i_28
       (.I0(addPostAddMantissa10_carry_i_73_n_0),
        .I1(addPostAddMantissa10_carry_i_33_n_0),
        .I2(addPostAddMantissa10_carry_i_44_n_0),
        .I3(addPostAddMantissa10_carry__1_i_19_n_0),
        .I4(addPostAddMantissa10_carry__1_i_26_n_0),
        .I5(addPostAddMantissa10_carry_i_72_n_0),
        .O(addPostAddMantissa10_carry__0_i_28_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10_carry__0_i_29
       (.I0(addPostAddMantissa10_carry__1_i_19_n_0),
        .I1(addPostAddMantissa10_carry_i_63_n_0),
        .I2(addPostAddMantissa10_carry_i_33_n_0),
        .I3(addPostAddMantissa10_carry_i_61_n_0),
        .I4(addPostAddMantissa10_carry_i_44_n_0),
        .I5(addPostAddMantissa10_carry_i_62_n_0),
        .O(addPostAddMantissa10_carry__0_i_29_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__0_i_3
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[13] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[13] ),
        .O(addPostAddMantissa10_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10_carry__0_i_30
       (.I0(addPostAddMantissa10_carry__1_i_19_n_0),
        .I1(addPostAddMantissa10_carry_i_55_n_0),
        .I2(addPostAddMantissa10_carry_i_33_n_0),
        .I3(addPostAddMantissa10_carry_i_53_n_0),
        .I4(addPostAddMantissa10_carry_i_44_n_0),
        .I5(addPostAddMantissa10_carry_i_54_n_0),
        .O(addPostAddMantissa10_carry__0_i_30_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10_carry__0_i_31
       (.I0(addPostAddMantissa10_carry__1_i_19_n_0),
        .I1(addPostAddMantissa10_carry_i_66_n_0),
        .I2(addPostAddMantissa10_carry_i_33_n_0),
        .I3(addPostAddMantissa10_carry_i_64_n_0),
        .I4(addPostAddMantissa10_carry_i_44_n_0),
        .I5(addPostAddMantissa10_carry_i_65_n_0),
        .O(addPostAddMantissa10_carry__0_i_31_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10_carry__0_i_32
       (.I0(addPostAddMantissa10_carry__0_i_34_n_0),
        .I1(addPostAddMantissa10_carry_i_58_n_0),
        .I2(addPostAddMantissa10_carry_i_33_n_0),
        .I3(addPostAddMantissa10_carry__0_i_33_n_0),
        .I4(addPostAddMantissa10_carry_i_44_n_0),
        .I5(addPostAddMantissa10_carry_i_43_n_0),
        .O(addPostAddMantissa10_carry__0_i_32_n_0));
  LUT5 #(
    .INIT(32'hF0F0E5E0)) 
    addPostAddMantissa10_carry__0_i_33
       (.I0(addPostAddMantissa10_carry__1_i_26_n_0),
        .I1(mantissaMin0[19]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__0_i_35_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry__0_i_33_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFB800470047)) 
    addPostAddMantissa10_carry__0_i_34
       (.I0(addExponentDeltaBMinusA[4]),
        .I1(addALessThanB),
        .I2(addExponentDeltaAMinusB[4]),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(mantissaMin0[23]),
        .I5(addPostAddMantissa10_carry__1_i_19_n_0),
        .O(addPostAddMantissa10_carry__0_i_34_n_0));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry__0_i_35
       (.I0(\addDenormFlushedValA_reg_n_0_[19] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[19] ),
        .O(addPostAddMantissa10_carry__0_i_35_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__0_i_4
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[12] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[12] ),
        .O(addPostAddMantissa10_carry__0_i_4_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__0_i_5
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[11] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[11] ),
        .O(addPostAddMantissa10_carry__0_i_5_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__0_i_6
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[10] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[10] ),
        .O(addPostAddMantissa10_carry__0_i_6_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__0_i_7
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[9] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[9] ),
        .O(addPostAddMantissa10_carry__0_i_7_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__0_i_8
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[8] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[8] ),
        .O(addPostAddMantissa10_carry__0_i_8_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__0_i_9
       (.I0(addPostAddMantissa10_carry__0_i_1_n_0),
        .I1(addPostAddMantissa10_carry__0_i_17_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__0_i_18_n_0),
        .O(addPostAddMantissa10_carry__0_i_9_n_0));
  CARRY8 addPostAddMantissa10_carry__1
       (.CI(addPostAddMantissa10_carry__0_n_0),
        .CI_TOP(1'b0),
        .CO({addPostAddMantissa10_carry__1_n_0,addPostAddMantissa10_carry__1_n_1,addPostAddMantissa10_carry__1_n_2,addPostAddMantissa10_carry__1_n_3,NLW_addPostAddMantissa10_carry__1_CO_UNCONNECTED[3],addPostAddMantissa10_carry__1_n_5,addPostAddMantissa10_carry__1_n_6,addPostAddMantissa10_carry__1_n_7}),
        .DI({addPostAddMantissa10_carry__1_i_1_n_0,addPostAddMantissa10_carry__1_i_2_n_0,addPostAddMantissa10_carry__1_i_3_n_0,addPostAddMantissa10_carry__1_i_4_n_0,addPostAddMantissa10_carry__1_i_5_n_0,addPostAddMantissa10_carry__1_i_6_n_0,addPostAddMantissa10_carry__1_i_7_n_0,addPostAddMantissa10_carry__1_i_8_n_0}),
        .O(addPostAddMantissa10[23:16]),
        .S({addPostAddMantissa10_carry__1_i_9_n_0,addPostAddMantissa10_carry__1_i_10_n_0,addPostAddMantissa10_carry__1_i_11_n_0,addPostAddMantissa10_carry__1_i_12_n_0,addPostAddMantissa10_carry__1_i_13_n_0,addPostAddMantissa10_carry__1_i_14_n_0,addPostAddMantissa10_carry__1_i_15_n_0,addPostAddMantissa10_carry__1_i_16_n_0}));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry__1_i_1
       (.I0(p_1_in),
        .I1(addALessThanB),
        .I2(p_0_in),
        .O(addPostAddMantissa10_carry__1_i_1_n_0));
  LUT6 #(
    .INIT(64'h55A556A65AAA56A6)) 
    addPostAddMantissa10_carry__1_i_10
       (.I0(addPostAddMantissa10_carry__1_i_2_n_0),
        .I1(addPostAddMantissa10_carry__1_i_18_n_0),
        .I2(addPostAddMantissa10_carry_i_24_n_0),
        .I3(addPostAddMantissa10_carry__1_i_19_n_0),
        .I4(addExponentDeltaAMinusB[0]),
        .I5(addPostAddMantissa10_carry__1_i_17_n_0),
        .O(addPostAddMantissa10_carry__1_i_10_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__1_i_11
       (.I0(addPostAddMantissa10_carry__1_i_3_n_0),
        .I1(addPostAddMantissa10_carry__1_i_20_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__1_i_21_n_0),
        .O(addPostAddMantissa10_carry__1_i_11_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__1_i_12
       (.I0(addPostAddMantissa10_carry__1_i_4_n_0),
        .I1(addPostAddMantissa10_carry__1_i_22_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__1_i_20_n_0),
        .O(addPostAddMantissa10_carry__1_i_12_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__1_i_13
       (.I0(addPostAddMantissa10_carry__1_i_5_n_0),
        .I1(addPostAddMantissa10_carry__1_i_23_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__1_i_22_n_0),
        .O(addPostAddMantissa10_carry__1_i_13_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__1_i_14
       (.I0(addPostAddMantissa10_carry__1_i_6_n_0),
        .I1(addPostAddMantissa10_carry__1_i_24_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__1_i_23_n_0),
        .O(addPostAddMantissa10_carry__1_i_14_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__1_i_15
       (.I0(addPostAddMantissa10_carry__1_i_7_n_0),
        .I1(addPostAddMantissa10_carry__1_i_25_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__1_i_24_n_0),
        .O(addPostAddMantissa10_carry__1_i_15_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry__1_i_16
       (.I0(addPostAddMantissa10_carry__1_i_8_n_0),
        .I1(addPostAddMantissa10_carry__0_i_18_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry__1_i_25_n_0),
        .O(addPostAddMantissa10_carry__1_i_16_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFE00010001)) 
    addPostAddMantissa10_carry__1_i_17
       (.I0(addPostAddMantissa10_carry_i_33_n_0),
        .I1(addPostAddMantissa10_carry_i_44_n_0),
        .I2(addPostAddMantissa10_carry__1_i_26_n_0),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(mantissaMin0[23]),
        .I5(addPostAddMantissa10_carry__1_i_19_n_0),
        .O(addPostAddMantissa10_carry__1_i_17_n_0));
  LUT5 #(
    .INIT(32'hF0F1F0E0)) 
    addPostAddMantissa10_carry__1_i_18
       (.I0(addPostAddMantissa10_carry_i_33_n_0),
        .I1(addPostAddMantissa10_carry_i_44_n_0),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry__1_i_29_n_0),
        .O(addPostAddMantissa10_carry__1_i_18_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry__1_i_19
       (.I0(p_1_in),
        .I1(addALessThanB),
        .I2(p_0_in),
        .O(addPostAddMantissa10_carry__1_i_19_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__1_i_2
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[22] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[22] ),
        .O(addPostAddMantissa10_carry__1_i_2_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__1_i_20
       (.I0(addPostAddMantissa10_carry__1_i_17_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry__1_i_30_n_0),
        .O(addPostAddMantissa10_carry__1_i_20_n_0));
  LUT6 #(
    .INIT(64'hFF00FF01FF00FE00)) 
    addPostAddMantissa10_carry__1_i_21
       (.I0(addPostAddMantissa10_carry_i_24_n_0),
        .I1(addPostAddMantissa10_carry_i_33_n_0),
        .I2(addPostAddMantissa10_carry_i_44_n_0),
        .I3(addPostAddMantissa10_carry__1_i_19_n_0),
        .I4(addPostAddMantissa10_carry__1_i_26_n_0),
        .I5(addPostAddMantissa10_carry__1_i_29_n_0),
        .O(addPostAddMantissa10_carry__1_i_21_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__1_i_22
       (.I0(addPostAddMantissa10_carry__1_i_18_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry__1_i_31_n_0),
        .O(addPostAddMantissa10_carry__1_i_22_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__1_i_23
       (.I0(addPostAddMantissa10_carry__1_i_30_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry__1_i_32_n_0),
        .O(addPostAddMantissa10_carry__1_i_23_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__1_i_24
       (.I0(addPostAddMantissa10_carry__1_i_31_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry__0_i_27_n_0),
        .O(addPostAddMantissa10_carry__1_i_24_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry__1_i_25
       (.I0(addPostAddMantissa10_carry__1_i_32_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry__0_i_25_n_0),
        .O(addPostAddMantissa10_carry__1_i_25_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry__1_i_26
       (.I0(addExponentDeltaBMinusA[4]),
        .I1(addALessThanB),
        .I2(addExponentDeltaAMinusB[4]),
        .O(addPostAddMantissa10_carry__1_i_26_n_0));
  LUT5 #(
    .INIT(32'h0000FFFE)) 
    addPostAddMantissa10_carry__1_i_27
       (.I0(addALessThanB),
        .I1(addExponentDeltaAMinusB[5]),
        .I2(addExponentDeltaAMinusB[6]),
        .I3(addExponentDeltaAMinusB[7]),
        .I4(addPostAddMantissa10_carry__1_i_33_n_0),
        .O(addPostAddMantissa10_carry__1_i_27_n_0));
  CARRY8 addPostAddMantissa10_carry__1_i_28
       (.CI(addPostAddMantissa10_carry_i_76_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_addPostAddMantissa10_carry__1_i_28_CO_UNCONNECTED[7],mantissaMin0[23],NLW_addPostAddMantissa10_carry__1_i_28_CO_UNCONNECTED[5],addPostAddMantissa10_carry__1_i_28_n_3,NLW_addPostAddMantissa10_carry__1_i_28_CO_UNCONNECTED[3],addPostAddMantissa10_carry__1_i_28_n_5,addPostAddMantissa10_carry__1_i_28_n_6,addPostAddMantissa10_carry__1_i_28_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_addPostAddMantissa10_carry__1_i_28_O_UNCONNECTED[7:6],mantissaMin0[22:17]}),
        .S({1'b0,1'b1,addPostAddMantissa10_carry__1_i_34_n_0,addPostAddMantissa10_carry__1_i_35_n_0,addPostAddMantissa10_carry__1_i_36_n_0,addPostAddMantissa10_carry__1_i_37_n_0,addPostAddMantissa10_carry__1_i_38_n_0,addPostAddMantissa10_carry__1_i_39_n_0}));
  LUT6 #(
    .INIT(64'hFFFFFF0000E200E2)) 
    addPostAddMantissa10_carry__1_i_29
       (.I0(\addDenormFlushedValB_reg_n_0_[22] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[22] ),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(mantissaMin0[22]),
        .I5(addPostAddMantissa10_carry__1_i_19_n_0),
        .O(addPostAddMantissa10_carry__1_i_29_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__1_i_3
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[21] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[21] ),
        .O(addPostAddMantissa10_carry__1_i_3_n_0));
  LUT5 #(
    .INIT(32'hF0F1F0E0)) 
    addPostAddMantissa10_carry__1_i_30
       (.I0(addPostAddMantissa10_carry_i_33_n_0),
        .I1(addPostAddMantissa10_carry_i_44_n_0),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry_i_70_n_0),
        .O(addPostAddMantissa10_carry__1_i_30_n_0));
  LUT5 #(
    .INIT(32'hF0F1F0E0)) 
    addPostAddMantissa10_carry__1_i_31
       (.I0(addPostAddMantissa10_carry_i_33_n_0),
        .I1(addPostAddMantissa10_carry_i_44_n_0),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry_i_73_n_0),
        .O(addPostAddMantissa10_carry__1_i_31_n_0));
  LUT6 #(
    .INIT(64'hFF00FB0BFF00F808)) 
    addPostAddMantissa10_carry__1_i_32
       (.I0(addPostAddMantissa10_carry_i_59_n_0),
        .I1(addPostAddMantissa10_carry_i_33_n_0),
        .I2(addPostAddMantissa10_carry_i_44_n_0),
        .I3(addPostAddMantissa10_carry__1_i_19_n_0),
        .I4(addPostAddMantissa10_carry__1_i_26_n_0),
        .I5(addPostAddMantissa10_carry_i_57_n_0),
        .O(addPostAddMantissa10_carry__1_i_32_n_0));
  LUT4 #(
    .INIT(16'h0004)) 
    addPostAddMantissa10_carry__1_i_33
       (.I0(addExponentDeltaBMinusA[5]),
        .I1(addALessThanB),
        .I2(addExponentDeltaBMinusA[7]),
        .I3(addExponentDeltaBMinusA[6]),
        .O(addPostAddMantissa10_carry__1_i_33_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry__1_i_34
       (.I0(\addDenormFlushedValB_reg_n_0_[22] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[22] ),
        .O(addPostAddMantissa10_carry__1_i_34_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry__1_i_35
       (.I0(\addDenormFlushedValB_reg_n_0_[21] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[21] ),
        .O(addPostAddMantissa10_carry__1_i_35_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry__1_i_36
       (.I0(\addDenormFlushedValB_reg_n_0_[20] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[20] ),
        .O(addPostAddMantissa10_carry__1_i_36_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry__1_i_37
       (.I0(\addDenormFlushedValB_reg_n_0_[19] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[19] ),
        .O(addPostAddMantissa10_carry__1_i_37_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry__1_i_38
       (.I0(\addDenormFlushedValB_reg_n_0_[18] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[18] ),
        .O(addPostAddMantissa10_carry__1_i_38_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry__1_i_39
       (.I0(\addDenormFlushedValB_reg_n_0_[17] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[17] ),
        .O(addPostAddMantissa10_carry__1_i_39_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__1_i_4
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[20] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[20] ),
        .O(addPostAddMantissa10_carry__1_i_4_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__1_i_5
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[19] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[19] ),
        .O(addPostAddMantissa10_carry__1_i_5_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__1_i_6
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[18] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[18] ),
        .O(addPostAddMantissa10_carry__1_i_6_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__1_i_7
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[17] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[17] ),
        .O(addPostAddMantissa10_carry__1_i_7_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry__1_i_8
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[16] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[16] ),
        .O(addPostAddMantissa10_carry__1_i_8_n_0));
  LUT6 #(
    .INIT(64'hF0F00F0FE1E22D1D)) 
    addPostAddMantissa10_carry__1_i_9
       (.I0(addPostAddMantissa10_carry__1_i_17_n_0),
        .I1(addPostAddMantissa10_carry_i_24_n_0),
        .I2(p_0_in),
        .I3(addALessThanB),
        .I4(p_1_in),
        .I5(addExponentDeltaAMinusB[0]),
        .O(addPostAddMantissa10_carry__1_i_9_n_0));
  CARRY8 addPostAddMantissa10_carry__2
       (.CI(addPostAddMantissa10_carry__1_n_0),
        .CI_TOP(1'b0),
        .CO({NLW_addPostAddMantissa10_carry__2_CO_UNCONNECTED[7:1],addPostAddMantissa10_carry__2_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addPostAddMantissa10_carry__2_i_1_n_0}),
        .O({NLW_addPostAddMantissa10_carry__2_O_UNCONNECTED[7:2],addPostAddMantissa10[25:24]}),
        .S({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,addPostAddMantissa10_carry__2_i_2_n_0}));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry__2_i_1
       (.I0(p_0_in),
        .I1(addALessThanB),
        .I2(p_1_in),
        .O(addPostAddMantissa10_carry__2_i_1_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    addPostAddMantissa10_carry__2_i_2
       (.I0(p_1_in),
        .I1(p_0_in),
        .O(addPostAddMantissa10_carry__2_i_2_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_1
       (.I0(p_0_in),
        .I1(addALessThanB),
        .I2(p_1_in),
        .O(GetFloatIsNegative));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry_i_10
       (.I0(addPostAddMantissa10_carry_i_2_n_0),
        .I1(addPostAddMantissa10_carry_i_18_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry_i_19_n_0),
        .O(addPostAddMantissa10_carry_i_10_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_100
       (.I0(\addDenormFlushedValB_reg_n_0_[14] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[14] ),
        .O(addPostAddMantissa10_carry_i_100_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_101
       (.I0(\addDenormFlushedValB_reg_n_0_[13] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[13] ),
        .O(addPostAddMantissa10_carry_i_101_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_102
       (.I0(\addDenormFlushedValB_reg_n_0_[12] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[12] ),
        .O(addPostAddMantissa10_carry_i_102_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_103
       (.I0(\addDenormFlushedValB_reg_n_0_[11] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[11] ),
        .O(addPostAddMantissa10_carry_i_103_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_104
       (.I0(\addDenormFlushedValB_reg_n_0_[10] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[10] ),
        .O(addPostAddMantissa10_carry_i_104_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_105
       (.I0(\addDenormFlushedValB_reg_n_0_[9] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[9] ),
        .O(addPostAddMantissa10_carry_i_105_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_106
       (.I0(\addDenormFlushedValB_reg_n_0_[0] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[0] ),
        .O(addPostAddMantissa10_carry_i_106_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_107
       (.I0(\addDenormFlushedValB_reg_n_0_[8] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[8] ),
        .O(addPostAddMantissa10_carry_i_107_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_108
       (.I0(\addDenormFlushedValB_reg_n_0_[7] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[7] ),
        .O(addPostAddMantissa10_carry_i_108_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_109
       (.I0(\addDenormFlushedValB_reg_n_0_[6] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[6] ),
        .O(addPostAddMantissa10_carry_i_109_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry_i_11
       (.I0(addPostAddMantissa10_carry_i_3_n_0),
        .I1(addPostAddMantissa10_carry_i_20_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry_i_18_n_0),
        .O(addPostAddMantissa10_carry_i_11_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_110
       (.I0(\addDenormFlushedValB_reg_n_0_[5] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[5] ),
        .O(addPostAddMantissa10_carry_i_110_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_111
       (.I0(\addDenormFlushedValB_reg_n_0_[4] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[4] ),
        .O(addPostAddMantissa10_carry_i_111_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_112
       (.I0(\addDenormFlushedValB_reg_n_0_[3] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[3] ),
        .O(addPostAddMantissa10_carry_i_112_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_113
       (.I0(\addDenormFlushedValB_reg_n_0_[2] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[2] ),
        .O(addPostAddMantissa10_carry_i_113_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_114
       (.I0(\addDenormFlushedValB_reg_n_0_[1] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[1] ),
        .O(addPostAddMantissa10_carry_i_114_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry_i_12
       (.I0(addPostAddMantissa10_carry_i_4_n_0),
        .I1(addPostAddMantissa10_carry_i_21_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry_i_20_n_0),
        .O(addPostAddMantissa10_carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h56A6)) 
    addPostAddMantissa10_carry_i_13
       (.I0(addPostAddMantissa10_carry_i_5_n_0),
        .I1(addPostAddMantissa10_carry_i_22_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry_i_21_n_0),
        .O(addPostAddMantissa10_carry_i_13_n_0));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    addPostAddMantissa10_carry_i_14
       (.I0(addPostAddMantissa10_carry_i_6_n_0),
        .I1(addPostAddMantissa10_carry_i_23_n_0),
        .I2(addPostAddMantissa10_carry_i_24_n_0),
        .I3(addPostAddMantissa10_carry_i_25_n_0),
        .I4(addExponentDeltaAMinusB[0]),
        .I5(addPostAddMantissa10_carry_i_22_n_0),
        .O(addPostAddMantissa10_carry_i_14_n_0));
  LUT6 #(
    .INIT(64'h565656A6A6A656A6)) 
    addPostAddMantissa10_carry_i_15
       (.I0(addPostAddMantissa10_carry_i_7_n_0),
        .I1(addPostAddMantissa10_carry_i_26_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry_i_23_n_0),
        .I4(addPostAddMantissa10_carry_i_24_n_0),
        .I5(addPostAddMantissa10_carry_i_25_n_0),
        .O(addPostAddMantissa10_carry_i_15_n_0));
  LUT6 #(
    .INIT(64'h565656A6A6A656A6)) 
    addPostAddMantissa10_carry_i_16
       (.I0(addPostAddMantissa10_carry_i_8_n_0),
        .I1(addPostAddMantissa10_carry_i_27_n_0),
        .I2(addExponentDeltaAMinusB[0]),
        .I3(addPostAddMantissa10_carry_i_28_n_0),
        .I4(addPostAddMantissa10_carry_i_24_n_0),
        .I5(addPostAddMantissa10_carry_i_29_n_0),
        .O(addPostAddMantissa10_carry_i_16_n_0));
  LUT6 #(
    .INIT(64'h555556A6AAAA56A6)) 
    addPostAddMantissa10_carry_i_17
       (.I0(addPostAddMantissa10_carry_i_9_n_0),
        .I1(addPostAddMantissa10_carry_i_30_n_0),
        .I2(addPostAddMantissa10_carry_i_24_n_0),
        .I3(addPostAddMantissa10_carry_i_28_n_0),
        .I4(addExponentDeltaAMinusB[0]),
        .I5(addPostAddMantissa10_carry_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_17_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10_carry_i_18
       (.I0(addPostAddMantissa10_carry_i_31_n_0),
        .I1(addPostAddMantissa10_carry_i_24_n_0),
        .I2(addPostAddMantissa10_carry_i_32_n_0),
        .I3(addPostAddMantissa10_carry_i_33_n_0),
        .I4(addPostAddMantissa10_carry_i_34_n_0),
        .O(addPostAddMantissa10_carry_i_18_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry_i_19
       (.I0(addPostAddMantissa10_carry_i_35_n_0),
        .I1(addExponentDeltaBMinusA[1]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[1]),
        .I4(addPostAddMantissa10_carry_i_36_n_0),
        .O(addPostAddMantissa10_carry_i_19_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry_i_2
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[7] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[7] ),
        .O(addPostAddMantissa10_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10_carry_i_20
       (.I0(addPostAddMantissa10_carry_i_36_n_0),
        .I1(addPostAddMantissa10_carry_i_24_n_0),
        .I2(addPostAddMantissa10_carry_i_37_n_0),
        .I3(addPostAddMantissa10_carry_i_33_n_0),
        .I4(addPostAddMantissa10_carry_i_38_n_0),
        .O(addPostAddMantissa10_carry_i_20_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10_carry_i_21
       (.I0(addPostAddMantissa10_carry_i_32_n_0),
        .I1(addPostAddMantissa10_carry_i_34_n_0),
        .I2(addPostAddMantissa10_carry_i_24_n_0),
        .I3(addPostAddMantissa10_carry_i_39_n_0),
        .I4(addPostAddMantissa10_carry_i_33_n_0),
        .I5(addPostAddMantissa10_carry_i_40_n_0),
        .O(addPostAddMantissa10_carry_i_21_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10_carry_i_22
       (.I0(addPostAddMantissa10_carry_i_37_n_0),
        .I1(addPostAddMantissa10_carry_i_38_n_0),
        .I2(addPostAddMantissa10_carry_i_24_n_0),
        .I3(addPostAddMantissa10_carry_i_41_n_0),
        .I4(addPostAddMantissa10_carry_i_33_n_0),
        .I5(addPostAddMantissa10_carry_i_42_n_0),
        .O(addPostAddMantissa10_carry_i_22_n_0));
  LUT5 #(
    .INIT(32'hFF00B8B8)) 
    addPostAddMantissa10_carry_i_23
       (.I0(addPostAddMantissa10_carry_i_43_n_0),
        .I1(addPostAddMantissa10_carry_i_44_n_0),
        .I2(addPostAddMantissa10_carry_i_45_n_0),
        .I3(addPostAddMantissa10_carry_i_34_n_0),
        .I4(addPostAddMantissa10_carry_i_33_n_0),
        .O(addPostAddMantissa10_carry_i_23_n_0));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_24
       (.I0(addExponentDeltaBMinusA[1]),
        .I1(addALessThanB),
        .I2(addExponentDeltaAMinusB[1]),
        .O(addPostAddMantissa10_carry_i_24_n_0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry_i_25
       (.I0(addPostAddMantissa10_carry_i_39_n_0),
        .I1(addExponentDeltaBMinusA[2]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[2]),
        .I4(addPostAddMantissa10_carry_i_40_n_0),
        .O(addPostAddMantissa10_carry_i_25_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10_carry_i_26
       (.I0(addPostAddMantissa10_carry_i_41_n_0),
        .I1(addPostAddMantissa10_carry_i_42_n_0),
        .I2(addPostAddMantissa10_carry_i_24_n_0),
        .I3(addPostAddMantissa10_carry_i_38_n_0),
        .I4(addPostAddMantissa10_carry_i_33_n_0),
        .I5(addPostAddMantissa10_carry_i_46_n_0),
        .O(addPostAddMantissa10_carry_i_26_n_0));
  LUT6 #(
    .INIT(64'hEFE0AFAFEFE0A0A0)) 
    addPostAddMantissa10_carry_i_27
       (.I0(addPostAddMantissa10_carry_i_47_n_0),
        .I1(addPostAddMantissa10_carry_i_34_n_0),
        .I2(addPostAddMantissa10_carry_i_24_n_0),
        .I3(addPostAddMantissa10_carry_i_40_n_0),
        .I4(addPostAddMantissa10_carry_i_33_n_0),
        .I5(addPostAddMantissa10_carry_i_48_n_0),
        .O(addPostAddMantissa10_carry_i_27_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10_carry_i_28
       (.I0(addPostAddMantissa10_carry_i_38_n_0),
        .I1(addPostAddMantissa10_carry_i_33_n_0),
        .I2(addPostAddMantissa10_carry_i_49_n_0),
        .I3(addPostAddMantissa10_carry_i_44_n_0),
        .I4(addPostAddMantissa10_carry_i_50_n_0),
        .O(addPostAddMantissa10_carry_i_28_n_0));
  LUT5 #(
    .INIT(32'hBABF8A80)) 
    addPostAddMantissa10_carry_i_29
       (.I0(addPostAddMantissa10_carry_i_41_n_0),
        .I1(addExponentDeltaBMinusA[2]),
        .I2(addALessThanB),
        .I3(addExponentDeltaAMinusB[2]),
        .I4(addPostAddMantissa10_carry_i_42_n_0),
        .O(addPostAddMantissa10_carry_i_29_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry_i_3
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[6] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[6] ),
        .O(addPostAddMantissa10_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10_carry_i_30
       (.I0(addPostAddMantissa10_carry_i_42_n_0),
        .I1(addPostAddMantissa10_carry_i_33_n_0),
        .I2(addPostAddMantissa10_carry_i_51_n_0),
        .I3(addPostAddMantissa10_carry_i_44_n_0),
        .I4(addPostAddMantissa10_carry_i_52_n_0),
        .O(addPostAddMantissa10_carry_i_30_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10_carry_i_31
       (.I0(addPostAddMantissa10_carry_i_53_n_0),
        .I1(addPostAddMantissa10_carry_i_54_n_0),
        .I2(addPostAddMantissa10_carry_i_33_n_0),
        .I3(addPostAddMantissa10_carry_i_55_n_0),
        .I4(addPostAddMantissa10_carry_i_44_n_0),
        .I5(addPostAddMantissa10_carry_i_56_n_0),
        .O(addPostAddMantissa10_carry_i_31_n_0));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    addPostAddMantissa10_carry_i_32
       (.I0(addPostAddMantissa10_carry__1_i_19_n_0),
        .I1(addPostAddMantissa10_carry__1_i_26_n_0),
        .I2(addPostAddMantissa10_carry_i_57_n_0),
        .I3(addPostAddMantissa10_carry_i_44_n_0),
        .I4(addPostAddMantissa10_carry_i_43_n_0),
        .O(addPostAddMantissa10_carry_i_32_n_0));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_33
       (.I0(addExponentDeltaBMinusA[2]),
        .I1(addALessThanB),
        .I2(addExponentDeltaAMinusB[2]),
        .O(addPostAddMantissa10_carry_i_33_n_0));
  LUT5 #(
    .INIT(32'hB888BBBB)) 
    addPostAddMantissa10_carry_i_34
       (.I0(addPostAddMantissa10_carry_i_58_n_0),
        .I1(addPostAddMantissa10_carry_i_44_n_0),
        .I2(addPostAddMantissa10_carry_i_59_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry_i_60_n_0),
        .O(addPostAddMantissa10_carry_i_34_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10_carry_i_35
       (.I0(addPostAddMantissa10_carry_i_61_n_0),
        .I1(addPostAddMantissa10_carry_i_62_n_0),
        .I2(addPostAddMantissa10_carry_i_33_n_0),
        .I3(addPostAddMantissa10_carry_i_63_n_0),
        .I4(addPostAddMantissa10_carry_i_44_n_0),
        .I5(addPostAddMantissa10_carry_i_49_n_0),
        .O(addPostAddMantissa10_carry_i_35_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    addPostAddMantissa10_carry_i_36
       (.I0(addPostAddMantissa10_carry_i_64_n_0),
        .I1(addPostAddMantissa10_carry_i_65_n_0),
        .I2(addPostAddMantissa10_carry_i_33_n_0),
        .I3(addPostAddMantissa10_carry_i_66_n_0),
        .I4(addPostAddMantissa10_carry_i_44_n_0),
        .I5(addPostAddMantissa10_carry_i_51_n_0),
        .O(addPostAddMantissa10_carry_i_36_n_0));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    addPostAddMantissa10_carry_i_37
       (.I0(addPostAddMantissa10_carry__1_i_19_n_0),
        .I1(addPostAddMantissa10_carry__1_i_26_n_0),
        .I2(addPostAddMantissa10_carry_i_67_n_0),
        .I3(addPostAddMantissa10_carry_i_44_n_0),
        .I4(addPostAddMantissa10_carry_i_49_n_0),
        .O(addPostAddMantissa10_carry_i_37_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10_carry_i_38
       (.I0(addPostAddMantissa10_carry_i_62_n_0),
        .I1(addPostAddMantissa10_carry_i_44_n_0),
        .I2(addPostAddMantissa10_carry__1_i_29_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry_i_68_n_0),
        .O(addPostAddMantissa10_carry_i_38_n_0));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    addPostAddMantissa10_carry_i_39
       (.I0(addPostAddMantissa10_carry__1_i_19_n_0),
        .I1(addPostAddMantissa10_carry__1_i_26_n_0),
        .I2(addPostAddMantissa10_carry_i_69_n_0),
        .I3(addPostAddMantissa10_carry_i_44_n_0),
        .I4(addPostAddMantissa10_carry_i_56_n_0),
        .O(addPostAddMantissa10_carry_i_39_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry_i_4
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[5] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[5] ),
        .O(addPostAddMantissa10_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10_carry_i_40
       (.I0(addPostAddMantissa10_carry_i_54_n_0),
        .I1(addPostAddMantissa10_carry_i_44_n_0),
        .I2(addPostAddMantissa10_carry_i_70_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry_i_71_n_0),
        .O(addPostAddMantissa10_carry_i_40_n_0));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    addPostAddMantissa10_carry_i_41
       (.I0(addPostAddMantissa10_carry__1_i_19_n_0),
        .I1(addPostAddMantissa10_carry__1_i_26_n_0),
        .I2(addPostAddMantissa10_carry_i_72_n_0),
        .I3(addPostAddMantissa10_carry_i_44_n_0),
        .I4(addPostAddMantissa10_carry_i_51_n_0),
        .O(addPostAddMantissa10_carry_i_41_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10_carry_i_42
       (.I0(addPostAddMantissa10_carry_i_65_n_0),
        .I1(addPostAddMantissa10_carry_i_44_n_0),
        .I2(addPostAddMantissa10_carry_i_73_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry_i_74_n_0),
        .O(addPostAddMantissa10_carry_i_42_n_0));
  LUT5 #(
    .INIT(32'hF0F0F0CA)) 
    addPostAddMantissa10_carry_i_43
       (.I0(addPostAddMantissa10_carry_i_75_n_0),
        .I1(mantissaMin0[11]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_43_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_44
       (.I0(addExponentDeltaBMinusA[3]),
        .I1(addALessThanB),
        .I2(addExponentDeltaAMinusB[3]),
        .O(addPostAddMantissa10_carry_i_44_n_0));
  LUT6 #(
    .INIT(64'hBB8BB88BBB88B888)) 
    addPostAddMantissa10_carry_i_45
       (.I0(addPostAddMantissa10_carry_i_57_n_0),
        .I1(addPostAddMantissa10_carry__1_i_26_n_0),
        .I2(addPostAddMantissa10_carry__1_i_27_n_0),
        .I3(addPostAddMantissa10_carry__1_i_19_n_0),
        .I4(mantissaMin0[3]),
        .I5(addPostAddMantissa10_carry_i_78_n_0),
        .O(addPostAddMantissa10_carry_i_45_n_0));
  LUT5 #(
    .INIT(32'hBBBBB888)) 
    addPostAddMantissa10_carry_i_46
       (.I0(addPostAddMantissa10_carry_i_49_n_0),
        .I1(addPostAddMantissa10_carry_i_44_n_0),
        .I2(addPostAddMantissa10_carry_i_67_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry_i_79_n_0),
        .O(addPostAddMantissa10_carry_i_46_n_0));
  LUT6 #(
    .INIT(64'h00000000FFF800F8)) 
    addPostAddMantissa10_carry_i_47
       (.I0(addPostAddMantissa10_carry_i_57_n_0),
        .I1(addPostAddMantissa10_carry__1_i_26_n_0),
        .I2(addPostAddMantissa10_carry_i_80_n_0),
        .I3(addPostAddMantissa10_carry_i_44_n_0),
        .I4(addPostAddMantissa10_carry_i_43_n_0),
        .I5(addPostAddMantissa10_carry_i_33_n_0),
        .O(addPostAddMantissa10_carry_i_47_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    addPostAddMantissa10_carry_i_48
       (.I0(addPostAddMantissa10_carry_i_56_n_0),
        .I1(addPostAddMantissa10_carry_i_44_n_0),
        .I2(addPostAddMantissa10_carry_i_69_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry_i_81_n_0),
        .O(addPostAddMantissa10_carry_i_48_n_0));
  LUT5 #(
    .INIT(32'hF0F0F0CA)) 
    addPostAddMantissa10_carry_i_49
       (.I0(addPostAddMantissa10_carry_i_82_n_0),
        .I1(mantissaMin0[10]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_49_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry_i_5
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[4] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[4] ),
        .O(addPostAddMantissa10_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'hBB8BB88BBB88B888)) 
    addPostAddMantissa10_carry_i_50
       (.I0(addPostAddMantissa10_carry_i_67_n_0),
        .I1(addPostAddMantissa10_carry__1_i_26_n_0),
        .I2(addPostAddMantissa10_carry__1_i_27_n_0),
        .I3(addPostAddMantissa10_carry__1_i_19_n_0),
        .I4(mantissaMin0[2]),
        .I5(addPostAddMantissa10_carry_i_83_n_0),
        .O(addPostAddMantissa10_carry_i_50_n_0));
  LUT5 #(
    .INIT(32'hF0F0F0CA)) 
    addPostAddMantissa10_carry_i_51
       (.I0(addPostAddMantissa10_carry_i_84_n_0),
        .I1(mantissaMin0[8]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_51_n_0));
  LUT6 #(
    .INIT(64'hFF00AFCFFF00A0C0)) 
    addPostAddMantissa10_carry_i_52
       (.I0(mantissaMin0[16]),
        .I1(addPostAddMantissa10_carry_i_85_n_0),
        .I2(addPostAddMantissa10_carry__1_i_26_n_0),
        .I3(addPostAddMantissa10_carry__1_i_19_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .I5(addPostAddMantissa10_carry_i_86_n_0),
        .O(addPostAddMantissa10_carry_i_52_n_0));
  LUT5 #(
    .INIT(32'hFFFA0404)) 
    addPostAddMantissa10_carry_i_53
       (.I0(addPostAddMantissa10_carry__1_i_26_n_0),
        .I1(addPostAddMantissa10_carry_i_87_n_0),
        .I2(addPostAddMantissa10_carry__1_i_27_n_0),
        .I3(mantissaMin0[21]),
        .I4(addPostAddMantissa10_carry__1_i_19_n_0),
        .O(addPostAddMantissa10_carry_i_53_n_0));
  LUT5 #(
    .INIT(32'hF0F0F0CA)) 
    addPostAddMantissa10_carry_i_54
       (.I0(addPostAddMantissa10_carry_i_88_n_0),
        .I1(mantissaMin0[13]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_54_n_0));
  LUT5 #(
    .INIT(32'hFFFA0404)) 
    addPostAddMantissa10_carry_i_55
       (.I0(addPostAddMantissa10_carry__1_i_26_n_0),
        .I1(addPostAddMantissa10_carry_i_89_n_0),
        .I2(addPostAddMantissa10_carry__1_i_27_n_0),
        .I3(mantissaMin0[17]),
        .I4(addPostAddMantissa10_carry__1_i_19_n_0),
        .O(addPostAddMantissa10_carry_i_55_n_0));
  LUT5 #(
    .INIT(32'hF0F0F0CA)) 
    addPostAddMantissa10_carry_i_56
       (.I0(addPostAddMantissa10_carry_i_90_n_0),
        .I1(mantissaMin0[9]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_56_n_0));
  LUT6 #(
    .INIT(64'hCCCCCCCCBBB888B8)) 
    addPostAddMantissa10_carry_i_57
       (.I0(mantissaMin0[19]),
        .I1(addPostAddMantissa10_carry__1_i_19_n_0),
        .I2(\addDenormFlushedValB_reg_n_0_[19] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValA_reg_n_0_[19] ),
        .I5(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_57_n_0));
  LUT5 #(
    .INIT(32'hF0F0F0CA)) 
    addPostAddMantissa10_carry_i_58
       (.I0(addPostAddMantissa10_carry_i_91_n_0),
        .I1(mantissaMin0[15]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_58_n_0));
  LUT5 #(
    .INIT(32'hEEE555E5)) 
    addPostAddMantissa10_carry_i_59
       (.I0(addPostAddMantissa10_carry__1_i_27_n_0),
        .I1(mantissaMin0[23]),
        .I2(p_0_in),
        .I3(addALessThanB),
        .I4(p_1_in),
        .O(addPostAddMantissa10_carry_i_59_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry_i_6
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[3] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[3] ),
        .O(addPostAddMantissa10_carry_i_6_n_0));
  LUT5 #(
    .INIT(32'hFFFF0F35)) 
    addPostAddMantissa10_carry_i_60
       (.I0(addPostAddMantissa10_carry_i_92_n_0),
        .I1(mantissaMin0[7]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(addPostAddMantissa10_carry__1_i_26_n_0),
        .O(addPostAddMantissa10_carry_i_60_n_0));
  LUT5 #(
    .INIT(32'hFFFA0404)) 
    addPostAddMantissa10_carry_i_61
       (.I0(addPostAddMantissa10_carry__1_i_26_n_0),
        .I1(addPostAddMantissa10_carry_i_93_n_0),
        .I2(addPostAddMantissa10_carry__1_i_27_n_0),
        .I3(mantissaMin0[22]),
        .I4(addPostAddMantissa10_carry__1_i_19_n_0),
        .O(addPostAddMantissa10_carry_i_61_n_0));
  LUT5 #(
    .INIT(32'hF0F0F0CA)) 
    addPostAddMantissa10_carry_i_62
       (.I0(addPostAddMantissa10_carry_i_94_n_0),
        .I1(mantissaMin0[14]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_62_n_0));
  LUT5 #(
    .INIT(32'hF0F0E5E0)) 
    addPostAddMantissa10_carry_i_63
       (.I0(addPostAddMantissa10_carry__1_i_26_n_0),
        .I1(mantissaMin0[18]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry_i_95_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_63_n_0));
  LUT5 #(
    .INIT(32'hFFFA0404)) 
    addPostAddMantissa10_carry_i_64
       (.I0(addPostAddMantissa10_carry__1_i_26_n_0),
        .I1(addPostAddMantissa10_carry_i_96_n_0),
        .I2(addPostAddMantissa10_carry__1_i_27_n_0),
        .I3(mantissaMin0[20]),
        .I4(addPostAddMantissa10_carry__1_i_19_n_0),
        .O(addPostAddMantissa10_carry_i_64_n_0));
  LUT5 #(
    .INIT(32'hF0F0F0CA)) 
    addPostAddMantissa10_carry_i_65
       (.I0(addPostAddMantissa10_carry_i_97_n_0),
        .I1(mantissaMin0[12]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_26_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_65_n_0));
  LUT5 #(
    .INIT(32'hF0F0E5E0)) 
    addPostAddMantissa10_carry_i_66
       (.I0(addPostAddMantissa10_carry__1_i_26_n_0),
        .I1(mantissaMin0[16]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry_i_85_n_0),
        .I4(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_66_n_0));
  LUT6 #(
    .INIT(64'hCCCCCCCCBBB888B8)) 
    addPostAddMantissa10_carry_i_67
       (.I0(mantissaMin0[18]),
        .I1(addPostAddMantissa10_carry__1_i_19_n_0),
        .I2(\addDenormFlushedValB_reg_n_0_[18] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValA_reg_n_0_[18] ),
        .I5(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_67_n_0));
  LUT6 #(
    .INIT(64'hFFFF00E2FF0000E2)) 
    addPostAddMantissa10_carry_i_68
       (.I0(\addDenormFlushedValB_reg_n_0_[6] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[6] ),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(addPostAddMantissa10_carry__1_i_19_n_0),
        .I5(mantissaMin0[6]),
        .O(addPostAddMantissa10_carry_i_68_n_0));
  LUT6 #(
    .INIT(64'hFFFFFF0000E200E2)) 
    addPostAddMantissa10_carry_i_69
       (.I0(\addDenormFlushedValB_reg_n_0_[17] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[17] ),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(mantissaMin0[17]),
        .I5(addPostAddMantissa10_carry__1_i_19_n_0),
        .O(addPostAddMantissa10_carry_i_69_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry_i_7
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[2] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[2] ),
        .O(addPostAddMantissa10_carry_i_7_n_0));
  LUT6 #(
    .INIT(64'hFFFFFF0000E200E2)) 
    addPostAddMantissa10_carry_i_70
       (.I0(\addDenormFlushedValB_reg_n_0_[21] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[21] ),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(mantissaMin0[21]),
        .I5(addPostAddMantissa10_carry__1_i_19_n_0),
        .O(addPostAddMantissa10_carry_i_70_n_0));
  LUT6 #(
    .INIT(64'hFFFF00E2FF0000E2)) 
    addPostAddMantissa10_carry_i_71
       (.I0(\addDenormFlushedValB_reg_n_0_[5] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[5] ),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(addPostAddMantissa10_carry__1_i_19_n_0),
        .I5(mantissaMin0[5]),
        .O(addPostAddMantissa10_carry_i_71_n_0));
  LUT6 #(
    .INIT(64'hCCCCCCCCBBB888B8)) 
    addPostAddMantissa10_carry_i_72
       (.I0(mantissaMin0[16]),
        .I1(addPostAddMantissa10_carry__1_i_19_n_0),
        .I2(\addDenormFlushedValB_reg_n_0_[16] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValA_reg_n_0_[16] ),
        .I5(addPostAddMantissa10_carry__1_i_27_n_0),
        .O(addPostAddMantissa10_carry_i_72_n_0));
  LUT6 #(
    .INIT(64'hFFFFFF0000E200E2)) 
    addPostAddMantissa10_carry_i_73
       (.I0(\addDenormFlushedValB_reg_n_0_[20] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[20] ),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(mantissaMin0[20]),
        .I5(addPostAddMantissa10_carry__1_i_19_n_0),
        .O(addPostAddMantissa10_carry_i_73_n_0));
  LUT6 #(
    .INIT(64'hFFFF00E2FF0000E2)) 
    addPostAddMantissa10_carry_i_74
       (.I0(\addDenormFlushedValB_reg_n_0_[4] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[4] ),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(addPostAddMantissa10_carry__1_i_19_n_0),
        .I5(mantissaMin0[4]),
        .O(addPostAddMantissa10_carry_i_74_n_0));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_75
       (.I0(\addDenormFlushedValA_reg_n_0_[11] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[11] ),
        .O(addPostAddMantissa10_carry_i_75_n_0));
  CARRY8 addPostAddMantissa10_carry_i_76
       (.CI(addPostAddMantissa10_carry_i_77_n_0),
        .CI_TOP(1'b0),
        .CO({addPostAddMantissa10_carry_i_76_n_0,addPostAddMantissa10_carry_i_76_n_1,addPostAddMantissa10_carry_i_76_n_2,addPostAddMantissa10_carry_i_76_n_3,NLW_addPostAddMantissa10_carry_i_76_CO_UNCONNECTED[3],addPostAddMantissa10_carry_i_76_n_5,addPostAddMantissa10_carry_i_76_n_6,addPostAddMantissa10_carry_i_76_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(mantissaMin0[16:9]),
        .S({addPostAddMantissa10_carry_i_98_n_0,addPostAddMantissa10_carry_i_99_n_0,addPostAddMantissa10_carry_i_100_n_0,addPostAddMantissa10_carry_i_101_n_0,addPostAddMantissa10_carry_i_102_n_0,addPostAddMantissa10_carry_i_103_n_0,addPostAddMantissa10_carry_i_104_n_0,addPostAddMantissa10_carry_i_105_n_0}));
  CARRY8 addPostAddMantissa10_carry_i_77
       (.CI(addPostAddMantissa10_carry_i_106_n_0),
        .CI_TOP(1'b0),
        .CO({addPostAddMantissa10_carry_i_77_n_0,addPostAddMantissa10_carry_i_77_n_1,addPostAddMantissa10_carry_i_77_n_2,addPostAddMantissa10_carry_i_77_n_3,NLW_addPostAddMantissa10_carry_i_77_CO_UNCONNECTED[3],addPostAddMantissa10_carry_i_77_n_5,addPostAddMantissa10_carry_i_77_n_6,addPostAddMantissa10_carry_i_77_n_7}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(mantissaMin0[8:1]),
        .S({addPostAddMantissa10_carry_i_107_n_0,addPostAddMantissa10_carry_i_108_n_0,addPostAddMantissa10_carry_i_109_n_0,addPostAddMantissa10_carry_i_110_n_0,addPostAddMantissa10_carry_i_111_n_0,addPostAddMantissa10_carry_i_112_n_0,addPostAddMantissa10_carry_i_113_n_0,addPostAddMantissa10_carry_i_114_n_0}));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_78
       (.I0(\addDenormFlushedValA_reg_n_0_[3] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[3] ),
        .O(addPostAddMantissa10_carry_i_78_n_0));
  LUT5 #(
    .INIT(32'h0000F0CA)) 
    addPostAddMantissa10_carry_i_79
       (.I0(addPostAddMantissa10_carry_i_83_n_0),
        .I1(mantissaMin0[2]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(addPostAddMantissa10_carry__1_i_26_n_0),
        .O(addPostAddMantissa10_carry_i_79_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry_i_8
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[1] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[1] ),
        .O(addPostAddMantissa10_carry_i_8_n_0));
  LUT5 #(
    .INIT(32'h0000F0CA)) 
    addPostAddMantissa10_carry_i_80
       (.I0(addPostAddMantissa10_carry_i_78_n_0),
        .I1(mantissaMin0[3]),
        .I2(addPostAddMantissa10_carry__1_i_19_n_0),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(addPostAddMantissa10_carry__1_i_26_n_0),
        .O(addPostAddMantissa10_carry_i_80_n_0));
  LUT6 #(
    .INIT(64'hFFFF00E2FF0000E2)) 
    addPostAddMantissa10_carry_i_81
       (.I0(\addDenormFlushedValB_reg_n_0_[1] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[1] ),
        .I3(addPostAddMantissa10_carry__1_i_27_n_0),
        .I4(addPostAddMantissa10_carry__1_i_19_n_0),
        .I5(mantissaMin0[1]),
        .O(addPostAddMantissa10_carry_i_81_n_0));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_82
       (.I0(\addDenormFlushedValA_reg_n_0_[10] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[10] ),
        .O(addPostAddMantissa10_carry_i_82_n_0));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_83
       (.I0(\addDenormFlushedValA_reg_n_0_[2] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[2] ),
        .O(addPostAddMantissa10_carry_i_83_n_0));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_84
       (.I0(\addDenormFlushedValA_reg_n_0_[8] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[8] ),
        .O(addPostAddMantissa10_carry_i_84_n_0));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_85
       (.I0(\addDenormFlushedValA_reg_n_0_[16] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[16] ),
        .O(addPostAddMantissa10_carry_i_85_n_0));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_86
       (.I0(\addDenormFlushedValA_reg_n_0_[0] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[0] ),
        .O(addPostAddMantissa10_carry_i_86_n_0));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_87
       (.I0(\addDenormFlushedValA_reg_n_0_[21] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[21] ),
        .O(addPostAddMantissa10_carry_i_87_n_0));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_88
       (.I0(\addDenormFlushedValA_reg_n_0_[13] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[13] ),
        .O(addPostAddMantissa10_carry_i_88_n_0));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_89
       (.I0(\addDenormFlushedValA_reg_n_0_[17] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[17] ),
        .O(addPostAddMantissa10_carry_i_89_n_0));
  LUT5 #(
    .INIT(32'h335ACC5A)) 
    addPostAddMantissa10_carry_i_9
       (.I0(p_1_in),
        .I1(p_0_in),
        .I2(\addDenormFlushedValA_reg_n_0_[0] ),
        .I3(addALessThanB),
        .I4(\addDenormFlushedValB_reg_n_0_[0] ),
        .O(addPostAddMantissa10_carry_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_90
       (.I0(\addDenormFlushedValA_reg_n_0_[9] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[9] ),
        .O(addPostAddMantissa10_carry_i_90_n_0));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_91
       (.I0(\addDenormFlushedValA_reg_n_0_[15] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[15] ),
        .O(addPostAddMantissa10_carry_i_91_n_0));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_92
       (.I0(\addDenormFlushedValA_reg_n_0_[7] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[7] ),
        .O(addPostAddMantissa10_carry_i_92_n_0));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_93
       (.I0(\addDenormFlushedValA_reg_n_0_[22] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[22] ),
        .O(addPostAddMantissa10_carry_i_93_n_0));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_94
       (.I0(\addDenormFlushedValA_reg_n_0_[14] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[14] ),
        .O(addPostAddMantissa10_carry_i_94_n_0));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_95
       (.I0(\addDenormFlushedValA_reg_n_0_[18] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[18] ),
        .O(addPostAddMantissa10_carry_i_95_n_0));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_96
       (.I0(\addDenormFlushedValA_reg_n_0_[20] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[20] ),
        .O(addPostAddMantissa10_carry_i_96_n_0));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    addPostAddMantissa10_carry_i_97
       (.I0(\addDenormFlushedValA_reg_n_0_[12] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValB_reg_n_0_[12] ),
        .O(addPostAddMantissa10_carry_i_97_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_98
       (.I0(\addDenormFlushedValB_reg_n_0_[16] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[16] ),
        .O(addPostAddMantissa10_carry_i_98_n_0));
  LUT3 #(
    .INIT(8'h1D)) 
    addPostAddMantissa10_carry_i_99
       (.I0(\addDenormFlushedValB_reg_n_0_[15] ),
        .I1(addALessThanB),
        .I2(\addDenormFlushedValA_reg_n_0_[15] ),
        .O(addPostAddMantissa10_carry_i_99_n_0));
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
        .D(addPostAddMantissa10[0]),
        .Q(\addPostAddMantissa1_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[10] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[10]),
        .Q(\addPostAddMantissa1_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[11] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[11]),
        .Q(\addPostAddMantissa1_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[12] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[12]),
        .Q(\addPostAddMantissa1_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[13] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[13]),
        .Q(\addPostAddMantissa1_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[14] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[14]),
        .Q(\addPostAddMantissa1_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[15] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[15]),
        .Q(\addPostAddMantissa1_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[16] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[16]),
        .Q(\addPostAddMantissa1_reg_n_0_[16] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[17] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[17]),
        .Q(\addPostAddMantissa1_reg_n_0_[17] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[18] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[18]),
        .Q(\addPostAddMantissa1_reg_n_0_[18] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[19] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[19]),
        .Q(\addPostAddMantissa1_reg_n_0_[19] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[1] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[1]),
        .Q(\addPostAddMantissa1_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[20] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[20]),
        .Q(\addPostAddMantissa1_reg_n_0_[20] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[21] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[21]),
        .Q(\addPostAddMantissa1_reg_n_0_[21] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[22] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[22]),
        .Q(\addPostAddMantissa1_reg_n_0_[22] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[23] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[23]),
        .Q(\addPostAddMantissa1_reg_n_0_[23] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[24] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[24]),
        .Q(\addPostAddMantissa1_reg_n_0_[24] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[25] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[25]),
        .Q(\addPostAddMantissa1_reg_n_0_[25] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[2] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[2]),
        .Q(\addPostAddMantissa1_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[3] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[3]),
        .Q(\addPostAddMantissa1_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[4] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[4]),
        .Q(\addPostAddMantissa1_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[5] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[5]),
        .Q(\addPostAddMantissa1_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[6] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[6]),
        .Q(\addPostAddMantissa1_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[7] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[7]),
        .Q(\addPostAddMantissa1_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[8] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[8]),
        .Q(\addPostAddMantissa1_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addPostAddMantissa1_reg[9] 
       (.C(clk),
        .CE(addPostAddMantissa1),
        .D(addPostAddMantissa10[9]),
        .Q(\addPostAddMantissa1_reg_n_0_[9] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFF00AAAAE2E2E2E2)) 
    \addPostAddMantissa[0]_i_1 
       (.I0(\addPostAddMantissa1_reg_n_0_[0] ),
        .I1(\addPostAddMantissa1_reg_n_0_[24] ),
        .I2(\addPostAddMantissa1_reg_n_0_[1] ),
        .I3(postAddMantissa0[1]),
        .I4(postAddMantissa0[24]),
        .I5(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[10]_i_1 
       (.I0(postAddMantissa0[11]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[10]),
        .I4(\addPostAddMantissa[10]_i_2_n_0 ),
        .O(\addPostAddMantissa[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
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
       (.I0(postAddMantissa0[12]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[11]),
        .I4(\addPostAddMantissa[11]_i_2_n_0 ),
        .O(\addPostAddMantissa[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
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
       (.I0(postAddMantissa0[13]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[12]),
        .I4(\addPostAddMantissa[12]_i_2_n_0 ),
        .O(\addPostAddMantissa[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
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
       (.I0(postAddMantissa0[14]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[13]),
        .I4(\addPostAddMantissa[13]_i_2_n_0 ),
        .O(\addPostAddMantissa[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
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
       (.I0(postAddMantissa0[15]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[14]),
        .I4(\addPostAddMantissa[14]_i_2_n_0 ),
        .O(\addPostAddMantissa[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
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
       (.I0(postAddMantissa0[16]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[15]),
        .I4(\addPostAddMantissa[15]_i_2_n_0 ),
        .O(\addPostAddMantissa[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
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
       (.I0(postAddMantissa0[17]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[16]),
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
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
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
       (.I0(postAddMantissa0[18]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[17]),
        .I4(\addPostAddMantissa[17]_i_2_n_0 ),
        .O(\addPostAddMantissa[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
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
       (.I0(postAddMantissa0[19]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[18]),
        .I4(\addPostAddMantissa[18]_i_2_n_0 ),
        .O(\addPostAddMantissa[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
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
       (.I0(postAddMantissa0[20]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[19]),
        .I4(\addPostAddMantissa[19]_i_2_n_0 ),
        .O(\addPostAddMantissa[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
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
       (.I0(postAddMantissa0[2]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[1]),
        .I4(\addPostAddMantissa[1]_i_2_n_0 ),
        .O(\addPostAddMantissa[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
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
       (.I0(postAddMantissa0[21]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[20]),
        .I4(\addPostAddMantissa[20]_i_2_n_0 ),
        .O(\addPostAddMantissa[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
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
       (.I0(postAddMantissa0[22]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[21]),
        .I4(\addPostAddMantissa[21]_i_2_n_0 ),
        .O(\addPostAddMantissa[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT4 #(
    .INIT(16'h00AC)) 
    \addPostAddMantissa[21]_i_2 
       (.I0(\addPostAddMantissa1_reg_n_0_[22] ),
        .I1(\addPostAddMantissa1_reg_n_0_[21] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addPostAddMantissa1_reg_n_0_[25] ),
        .O(\addPostAddMantissa[21]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT5 #(
    .INIT(32'hFFFFB080)) 
    \addPostAddMantissa[22]_i_1 
       (.I0(postAddMantissa0[23]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[22]),
        .I4(\addPostAddMantissa[22]_i_2_n_0 ),
        .O(\addPostAddMantissa[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
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
       (.I0(postAddMantissa0[3]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[2]),
        .I4(\addPostAddMantissa[2]_i_2_n_0 ),
        .O(\addPostAddMantissa[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
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
       (.I0(postAddMantissa0[4]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[3]),
        .I4(\addPostAddMantissa[3]_i_2_n_0 ),
        .O(\addPostAddMantissa[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
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
       (.I0(postAddMantissa0[5]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[4]),
        .I4(\addPostAddMantissa[4]_i_2_n_0 ),
        .O(\addPostAddMantissa[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
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
       (.I0(postAddMantissa0[6]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[5]),
        .I4(\addPostAddMantissa[5]_i_2_n_0 ),
        .O(\addPostAddMantissa[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
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
       (.I0(postAddMantissa0[7]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[6]),
        .I4(\addPostAddMantissa[6]_i_2_n_0 ),
        .O(\addPostAddMantissa[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
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
       (.I0(postAddMantissa0[8]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[7]),
        .I4(\addPostAddMantissa[7]_i_2_n_0 ),
        .O(\addPostAddMantissa[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
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
       (.I0(postAddMantissa0[9]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[8]),
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
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
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
       (.I0(postAddMantissa0[10]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[9]),
        .I4(\addPostAddMantissa[9]_i_2_n_0 ),
        .O(\addPostAddMantissa[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
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
        .CO({\addPostAddMantissa_reg[16]_i_2_n_0 ,\addPostAddMantissa_reg[16]_i_2_n_1 ,\addPostAddMantissa_reg[16]_i_2_n_2 ,\addPostAddMantissa_reg[16]_i_2_n_3 ,\NLW_addPostAddMantissa_reg[16]_i_2_CO_UNCONNECTED [3],\addPostAddMantissa_reg[16]_i_2_n_5 ,\addPostAddMantissa_reg[16]_i_2_n_6 ,\addPostAddMantissa_reg[16]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(postAddMantissa0[16:9]),
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
        .CO({\addPostAddMantissa_reg[8]_i_2_n_0 ,\addPostAddMantissa_reg[8]_i_2_n_1 ,\addPostAddMantissa_reg[8]_i_2_n_2 ,\addPostAddMantissa_reg[8]_i_2_n_3 ,\NLW_addPostAddMantissa_reg[8]_i_2_CO_UNCONNECTED [3],\addPostAddMantissa_reg[8]_i_2_n_5 ,\addPostAddMantissa_reg[8]_i_2_n_6 ,\addPostAddMantissa_reg[8]_i_2_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(postAddMantissa0[8:1]),
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
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
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
       (.I0(postAddMantissa0[16]),
        .I1(\addRenormalizeShiftAmount[4]_i_4_n_0 ),
        .I2(postAddMantissa0[14]),
        .I3(postAddMantissa0[15]),
        .O(\addRenormalizeShiftAmount[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h10101000)) 
    \addRenormalizeShiftAmount[0]_i_3 
       (.I0(postAddMantissa0[13]),
        .I1(postAddMantissa0[15]),
        .I2(\addRenormalizeShiftAmount[4]_i_4_n_0 ),
        .I3(postAddMantissa0[12]),
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
        .I1(postAddMantissa0[18]),
        .I2(postAddMantissa0[19]),
        .I3(\addRenormalizeShiftAmount[0]_i_7_n_0 ),
        .I4(postAddMantissa0[20]),
        .I5(\addRenormalizeShiftAmount[0]_i_8_n_0 ),
        .O(\addRenormalizeShiftAmount[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h00000000AAAAEEFE)) 
    \addRenormalizeShiftAmount[0]_i_6 
       (.I0(postAddMantissa0[10]),
        .I1(postAddMantissa0[8]),
        .I2(\addRenormalizeShiftAmount[0]_i_9_n_0 ),
        .I3(postAddMantissa0[7]),
        .I4(postAddMantissa0[9]),
        .I5(postAddMantissa0[11]),
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
  LUT5 #(
    .INIT(32'hFFFF0020)) 
    \addRenormalizeShiftAmount[0]_i_8 
       (.I0(postAddMantissa0[22]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[23]),
        .I4(\addRenormalizeShiftAmount[0]_i_11_n_0 ),
        .O(\addRenormalizeShiftAmount[0]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF55551011)) 
    \addRenormalizeShiftAmount[0]_i_9 
       (.I0(postAddMantissa0[5]),
        .I1(postAddMantissa0[3]),
        .I2(postAddMantissa0[2]),
        .I3(postAddMantissa0[1]),
        .I4(postAddMantissa0[4]),
        .I5(postAddMantissa0[6]),
        .O(\addRenormalizeShiftAmount[0]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFBBBAAAAA)) 
    \addRenormalizeShiftAmount[1]_i_1 
       (.I0(\addRenormalizeShiftAmount[1]_i_2_n_0 ),
        .I1(postAddMantissa0[22]),
        .I2(postAddMantissa0[20]),
        .I3(postAddMantissa0[21]),
        .I4(\addRenormalizeShiftAmount[1]_i_3_n_0 ),
        .I5(\addRenormalizeShiftAmount[1]_i_4_n_0 ),
        .O(\addRenormalizeShiftAmount[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1110111011101111)) 
    \addRenormalizeShiftAmount[1]_i_10 
       (.I0(postAddMantissa0[7]),
        .I1(postAddMantissa0[6]),
        .I2(postAddMantissa0[4]),
        .I3(postAddMantissa0[5]),
        .I4(postAddMantissa0[2]),
        .I5(postAddMantissa0[3]),
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
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
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
        .I1(postAddMantissa0[16]),
        .I2(postAddMantissa0[17]),
        .I3(postAddMantissa0[15]),
        .I4(postAddMantissa0[14]),
        .I5(\addRenormalizeShiftAmount[1]_i_6_n_0 ),
        .O(\addRenormalizeShiftAmount[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \addRenormalizeShiftAmount[1]_i_3 
       (.I0(postAddMantissa0[24]),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .I2(postAddMantissa0[23]),
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
       (.I0(postAddMantissa0[19]),
        .I1(postAddMantissa0[18]),
        .I2(postAddMantissa0[22]),
        .I3(postAddMantissa0[23]),
        .I4(\addPostAddMantissa1_reg_n_0_[25] ),
        .I5(postAddMantissa0[24]),
        .O(\addRenormalizeShiftAmount[1]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF5554)) 
    \addRenormalizeShiftAmount[1]_i_6 
       (.I0(\addRenormalizeShiftAmount[1]_i_9_n_0 ),
        .I1(\addRenormalizeShiftAmount[1]_i_10_n_0 ),
        .I2(postAddMantissa0[9]),
        .I3(postAddMantissa0[8]),
        .I4(postAddMantissa0[13]),
        .I5(postAddMantissa0[12]),
        .O(\addRenormalizeShiftAmount[1]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
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
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \addRenormalizeShiftAmount[1]_i_9 
       (.I0(postAddMantissa0[10]),
        .I1(postAddMantissa0[11]),
        .O(\addRenormalizeShiftAmount[1]_i_9_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF000E0000)) 
    \addRenormalizeShiftAmount[2]_i_1 
       (.I0(\addRenormalizeShiftAmount[2]_i_2_n_0 ),
        .I1(\addRenormalizeShiftAmount[2]_i_3_n_0 ),
        .I2(postAddMantissa0[22]),
        .I3(postAddMantissa0[20]),
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
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
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
        .I1(postAddMantissa0[7]),
        .I2(postAddMantissa0[6]),
        .I3(postAddMantissa0[5]),
        .I4(postAddMantissa0[4]),
        .I5(\addRenormalizeShiftAmount[2]_i_7_n_0 ),
        .O(\addRenormalizeShiftAmount[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addRenormalizeShiftAmount[2]_i_3 
       (.I0(postAddMantissa0[18]),
        .I1(postAddMantissa0[16]),
        .I2(postAddMantissa0[19]),
        .I3(postAddMantissa0[17]),
        .O(\addRenormalizeShiftAmount[2]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \addRenormalizeShiftAmount[2]_i_5 
       (.I0(postAddMantissa0[23]),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .I2(postAddMantissa0[24]),
        .I3(postAddMantissa0[21]),
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
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    \addRenormalizeShiftAmount[2]_i_7 
       (.I0(postAddMantissa0[14]),
        .I1(postAddMantissa0[12]),
        .I2(postAddMantissa0[15]),
        .I3(postAddMantissa0[13]),
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
       (.I0(postAddMantissa0[11]),
        .I1(postAddMantissa0[10]),
        .I2(postAddMantissa0[9]),
        .I3(postAddMantissa0[8]),
        .O(\addRenormalizeShiftAmount[4]_i_10_n_0 ));
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
       (.I0(postAddMantissa0[24]),
        .I1(\addPostAddMantissa1_reg_n_0_[25] ),
        .I2(\addPostAddMantissa1_reg_n_0_[24] ),
        .I3(\addMaxVal1_reg_n_0_[23] ),
        .I4(\addMaxVal1_reg_n_0_[30] ),
        .I5(\addFinalExp[7]_i_2_n_0 ),
        .O(\addRenormalizeShiftAmount[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    \addRenormalizeShiftAmount[4]_i_4 
       (.I0(postAddMantissa0[21]),
        .I1(postAddMantissa0[24]),
        .I2(\addPostAddMantissa1_reg_n_0_[25] ),
        .I3(postAddMantissa0[23]),
        .I4(postAddMantissa0[19]),
        .I5(postAddMantissa0[17]),
        .O(\addRenormalizeShiftAmount[4]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \addRenormalizeShiftAmount[4]_i_5 
       (.I0(postAddMantissa0[20]),
        .I1(postAddMantissa0[16]),
        .I2(postAddMantissa0[22]),
        .I3(postAddMantissa0[18]),
        .O(\addRenormalizeShiftAmount[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair67" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \addRenormalizeShiftAmount[4]_i_6 
       (.I0(postAddMantissa0[13]),
        .I1(postAddMantissa0[15]),
        .I2(postAddMantissa0[12]),
        .I3(postAddMantissa0[14]),
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
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
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
        .Q(addRenormalizeShiftAmount[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addRenormalizeShiftAmount_reg[1] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addRenormalizeShiftAmount[1]_i_1_n_0 ),
        .Q(addRenormalizeShiftAmount[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addRenormalizeShiftAmount_reg[2] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addRenormalizeShiftAmount[2]_i_1_n_0 ),
        .Q(addRenormalizeShiftAmount[2]),
        .R(1'b0));
  CARRY8 \addRenormalizeShiftAmount_reg[2]_i_4 
       (.CI(\addPostAddMantissa_reg[16]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\NLW_addRenormalizeShiftAmount_reg[2]_i_4_CO_UNCONNECTED [7],\addRenormalizeShiftAmount_reg[2]_i_4_n_1 ,\addRenormalizeShiftAmount_reg[2]_i_4_n_2 ,\addRenormalizeShiftAmount_reg[2]_i_4_n_3 ,\NLW_addRenormalizeShiftAmount_reg[2]_i_4_CO_UNCONNECTED [3],\addRenormalizeShiftAmount_reg[2]_i_4_n_5 ,\addRenormalizeShiftAmount_reg[2]_i_4_n_6 ,\addRenormalizeShiftAmount_reg[2]_i_4_n_7 }),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(postAddMantissa0[24:17]),
        .S({\addRenormalizeShiftAmount[2]_i_8_n_0 ,\addRenormalizeShiftAmount[2]_i_9_n_0 ,\addRenormalizeShiftAmount[2]_i_10_n_0 ,\addRenormalizeShiftAmount[2]_i_11_n_0 ,\addRenormalizeShiftAmount[2]_i_12_n_0 ,\addRenormalizeShiftAmount[2]_i_13_n_0 ,\addRenormalizeShiftAmount[2]_i_14_n_0 ,\addRenormalizeShiftAmount[2]_i_15_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \addRenormalizeShiftAmount_reg[3] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addRenormalizeShiftAmount[3]_i_1_n_0 ),
        .Q(addRenormalizeShiftAmount[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \addRenormalizeShiftAmount_reg[4] 
       (.C(clk),
        .CE(addPostAddMantissa),
        .D(\addRenormalizeShiftAmount[4]_i_2_n_0 ),
        .Q(addRenormalizeShiftAmount[4]),
        .R(1'b0));
  CARRY8 addSameNumberDifferentSigns00_carry
       (.CI(1'b1),
        .CI_TOP(1'b0),
        .CO({addSameNumberDifferentSigns00_carry_n_0,addSameNumberDifferentSigns00_carry_n_1,addSameNumberDifferentSigns00_carry_n_2,addSameNumberDifferentSigns00_carry_n_3,NLW_addSameNumberDifferentSigns00_carry_CO_UNCONNECTED[3],addSameNumberDifferentSigns00_carry_n_5,addSameNumberDifferentSigns00_carry_n_6,addSameNumberDifferentSigns00_carry_n_7}),
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
  LUT2 #(
    .INIT(4'h9)) 
    addSameNumberDifferentSigns00_carry__0_i_1
       (.I0(IN_B[30]),
        .I1(IN_A[30]),
        .O(addSameNumberDifferentSigns00_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    addSameNumberDifferentSigns00_carry__0_i_2
       (.I0(IN_B[28]),
        .I1(IN_A[28]),
        .I2(IN_B[29]),
        .I3(IN_A[29]),
        .I4(IN_A[27]),
        .I5(IN_B[27]),
        .O(addSameNumberDifferentSigns00_carry__0_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    addSameNumberDifferentSigns00_carry__0_i_3
       (.I0(IN_A[26]),
        .I1(IN_B[26]),
        .I2(IN_B[25]),
        .I3(IN_A[25]),
        .I4(IN_B[24]),
        .I5(IN_A[24]),
        .O(addSameNumberDifferentSigns00_carry__0_i_3_n_0));
  LUT6 #(
    .INIT(64'h0003000309000009)) 
    addSameNumberDifferentSigns00_carry_i_1
       (.I0(IN_A[22]),
        .I1(\addDenormFlushedValB[22]_i_1_n_0 ),
        .I2(addExponentDeltaAMinusB0[0]),
        .I3(\addDenormFlushedValB[21]_i_1_n_0 ),
        .I4(IN_A[21]),
        .I5(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'hFF05FF0500903309)) 
    addSameNumberDifferentSigns00_carry_i_10
       (.I0(IN_B[17]),
        .I1(IN_A[17]),
        .I2(IN_B[15]),
        .I3(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I4(IN_A[15]),
        .I5(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_10_n_0));
  LUT6 #(
    .INIT(64'hFF05FF0500903309)) 
    addSameNumberDifferentSigns00_carry_i_11
       (.I0(IN_B[14]),
        .I1(IN_A[14]),
        .I2(IN_B[12]),
        .I3(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I4(IN_A[12]),
        .I5(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_11_n_0));
  LUT6 #(
    .INIT(64'hFF05FF0500903309)) 
    addSameNumberDifferentSigns00_carry_i_12
       (.I0(IN_B[11]),
        .I1(IN_A[11]),
        .I2(IN_B[9]),
        .I3(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I4(IN_A[9]),
        .I5(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_12_n_0));
  LUT6 #(
    .INIT(64'hFF05FF0500903309)) 
    addSameNumberDifferentSigns00_carry_i_13
       (.I0(IN_B[8]),
        .I1(IN_A[8]),
        .I2(IN_B[6]),
        .I3(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I4(IN_A[6]),
        .I5(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_13_n_0));
  LUT6 #(
    .INIT(64'hFF05FF0500903309)) 
    addSameNumberDifferentSigns00_carry_i_14
       (.I0(IN_B[5]),
        .I1(IN_A[5]),
        .I2(IN_B[3]),
        .I3(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I4(IN_A[3]),
        .I5(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_14_n_0));
  LUT6 #(
    .INIT(64'hF0F50900F0F53039)) 
    addSameNumberDifferentSigns00_carry_i_15
       (.I0(IN_B[2]),
        .I1(IN_A[2]),
        .I2(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I3(IN_B[0]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .I5(IN_A[0]),
        .O(addSameNumberDifferentSigns00_carry_i_15_n_0));
  LUT5 #(
    .INIT(32'hA2A208A2)) 
    addSameNumberDifferentSigns00_carry_i_2
       (.I0(addSameNumberDifferentSigns00_carry_i_9_n_0),
        .I1(IN_B[19]),
        .I2(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I3(IN_A[19]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_2_n_0));
  LUT5 #(
    .INIT(32'hA2A208A2)) 
    addSameNumberDifferentSigns00_carry_i_3
       (.I0(addSameNumberDifferentSigns00_carry_i_10_n_0),
        .I1(IN_B[16]),
        .I2(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I3(IN_A[16]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_3_n_0));
  LUT5 #(
    .INIT(32'hA2A208A2)) 
    addSameNumberDifferentSigns00_carry_i_4
       (.I0(addSameNumberDifferentSigns00_carry_i_11_n_0),
        .I1(IN_B[13]),
        .I2(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I3(IN_A[13]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_4_n_0));
  LUT5 #(
    .INIT(32'hA2A208A2)) 
    addSameNumberDifferentSigns00_carry_i_5
       (.I0(addSameNumberDifferentSigns00_carry_i_12_n_0),
        .I1(IN_B[10]),
        .I2(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I3(IN_A[10]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_5_n_0));
  LUT5 #(
    .INIT(32'hA2A208A2)) 
    addSameNumberDifferentSigns00_carry_i_6
       (.I0(addSameNumberDifferentSigns00_carry_i_13_n_0),
        .I1(IN_B[7]),
        .I2(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I3(IN_A[7]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_6_n_0));
  LUT5 #(
    .INIT(32'hA2A208A2)) 
    addSameNumberDifferentSigns00_carry_i_7
       (.I0(addSameNumberDifferentSigns00_carry_i_14_n_0),
        .I1(IN_B[4]),
        .I2(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I3(IN_A[4]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_7_n_0));
  LUT5 #(
    .INIT(32'hA2A208A2)) 
    addSameNumberDifferentSigns00_carry_i_8
       (.I0(addSameNumberDifferentSigns00_carry_i_15_n_0),
        .I1(IN_B[1]),
        .I2(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I3(IN_A[1]),
        .I4(\addDenormFlushedValA[22]_i_2_n_0 ),
        .O(addSameNumberDifferentSigns00_carry_i_8_n_0));
  LUT6 #(
    .INIT(64'hFF05FF0500903309)) 
    addSameNumberDifferentSigns00_carry_i_9
       (.I0(IN_B[20]),
        .I1(IN_A[20]),
        .I2(IN_B[18]),
        .I3(\addDenormFlushedValB[22]_i_2_n_0 ),
        .I4(IN_A[18]),
        .I5(\addDenormFlushedValA[22]_i_2_n_0 ),
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
        .I4(addEarlyOutBypassEnable0),
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
  CARRY8 comALessThanB0_carry
       (.CI(1'b0),
        .CI_TOP(1'b0),
        .CO({comALessThanB0_carry_n_0,comALessThanB0_carry_n_1,comALessThanB0_carry_n_2,comALessThanB0_carry_n_3,NLW_comALessThanB0_carry_CO_UNCONNECTED[3],comALessThanB0_carry_n_5,comALessThanB0_carry_n_6,comALessThanB0_carry_n_7}),
        .DI({comALessThanB0_carry_i_1_n_0,comALessThanB0_carry_i_2_n_0,comALessThanB0_carry_i_3_n_0,comALessThanB0_carry_i_4_n_0,comALessThanB0_carry_i_5_n_0,comALessThanB0_carry_i_6_n_0,comALessThanB0_carry_i_7_n_0,comALessThanB0_carry_i_8_n_0}),
        .O(NLW_comALessThanB0_carry_O_UNCONNECTED[7:0]),
        .S({comALessThanB0_carry_i_9_n_0,comALessThanB0_carry_i_10_n_0,comALessThanB0_carry_i_11_n_0,comALessThanB0_carry_i_12_n_0,comALessThanB0_carry_i_13_n_0,comALessThanB0_carry_i_14_n_0,comALessThanB0_carry_i_15_n_0,comALessThanB0_carry_i_16_n_0}));
  CARRY8 comALessThanB0_carry__0
       (.CI(comALessThanB0_carry_n_0),
        .CI_TOP(1'b0),
        .CO({comALessThanB,comALessThanB0_carry__0_n_1,comALessThanB0_carry__0_n_2,comALessThanB0_carry__0_n_3,NLW_comALessThanB0_carry__0_CO_UNCONNECTED[3],comALessThanB0_carry__0_n_5,comALessThanB0_carry__0_n_6,comALessThanB0_carry__0_n_7}),
        .DI({comALessThanB0_carry__0_i_1_n_0,comALessThanB0_carry__0_i_2_n_0,comALessThanB0_carry__0_i_3_n_0,comALessThanB0_carry__0_i_4_n_0,comALessThanB0_carry__0_i_5_n_0,comALessThanB0_carry__0_i_6_n_0,comALessThanB0_carry__0_i_7_n_0,comALessThanB0_carry__0_i_8_n_0}),
        .O(NLW_comALessThanB0_carry__0_O_UNCONNECTED[7:0]),
        .S({comALessThanB0_carry__0_i_9_n_0,comALessThanB0_carry__0_i_10_n_0,comALessThanB0_carry__0_i_11_n_0,comALessThanB0_carry__0_i_12_n_0,comALessThanB0_carry__0_i_13_n_0,comALessThanB0_carry__0_i_14_n_0,comALessThanB0_carry__0_i_15_n_0,comALessThanB0_carry__0_i_16_n_0}));
  LUT2 #(
    .INIT(4'h2)) 
    comALessThanB0_carry__0_i_1
       (.I0(IN_B[30]),
        .I1(IN_A[30]),
        .O(comALessThanB0_carry__0_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry__0_i_10
       (.I0(IN_A[29]),
        .I1(IN_B[29]),
        .I2(IN_A[28]),
        .I3(IN_B[28]),
        .O(comALessThanB0_carry__0_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry__0_i_11
       (.I0(IN_A[26]),
        .I1(IN_B[26]),
        .I2(IN_A[27]),
        .I3(IN_B[27]),
        .O(comALessThanB0_carry__0_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry__0_i_12
       (.I0(IN_A[24]),
        .I1(IN_B[24]),
        .I2(IN_A[25]),
        .I3(IN_B[25]),
        .O(comALessThanB0_carry__0_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry__0_i_13
       (.I0(IN_A[23]),
        .I1(IN_B[23]),
        .I2(IN_A[22]),
        .I3(IN_B[22]),
        .O(comALessThanB0_carry__0_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry__0_i_14
       (.I0(IN_A[21]),
        .I1(IN_B[21]),
        .I2(IN_A[20]),
        .I3(IN_B[20]),
        .O(comALessThanB0_carry__0_i_14_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry__0_i_15
       (.I0(IN_A[19]),
        .I1(IN_B[19]),
        .I2(IN_A[18]),
        .I3(IN_B[18]),
        .O(comALessThanB0_carry__0_i_15_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry__0_i_16
       (.I0(IN_A[17]),
        .I1(IN_B[17]),
        .I2(IN_A[16]),
        .I3(IN_B[16]),
        .O(comALessThanB0_carry__0_i_16_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry__0_i_2
       (.I0(IN_B[29]),
        .I1(IN_A[29]),
        .I2(IN_B[28]),
        .I3(IN_A[28]),
        .O(comALessThanB0_carry__0_i_2_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry__0_i_3
       (.I0(IN_B[27]),
        .I1(IN_A[27]),
        .I2(IN_B[26]),
        .I3(IN_A[26]),
        .O(comALessThanB0_carry__0_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry__0_i_4
       (.I0(IN_B[25]),
        .I1(IN_A[25]),
        .I2(IN_B[24]),
        .I3(IN_A[24]),
        .O(comALessThanB0_carry__0_i_4_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry__0_i_5
       (.I0(IN_B[23]),
        .I1(IN_A[23]),
        .I2(IN_B[22]),
        .I3(IN_A[22]),
        .O(comALessThanB0_carry__0_i_5_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry__0_i_6
       (.I0(IN_B[21]),
        .I1(IN_A[21]),
        .I2(IN_B[20]),
        .I3(IN_A[20]),
        .O(comALessThanB0_carry__0_i_6_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry__0_i_7
       (.I0(IN_B[19]),
        .I1(IN_A[19]),
        .I2(IN_B[18]),
        .I3(IN_A[18]),
        .O(comALessThanB0_carry__0_i_7_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry__0_i_8
       (.I0(IN_B[17]),
        .I1(IN_A[17]),
        .I2(IN_B[16]),
        .I3(IN_A[16]),
        .O(comALessThanB0_carry__0_i_8_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    comALessThanB0_carry__0_i_9
       (.I0(IN_A[30]),
        .I1(IN_B[30]),
        .O(comALessThanB0_carry__0_i_9_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_1
       (.I0(IN_B[15]),
        .I1(IN_A[15]),
        .I2(IN_B[14]),
        .I3(IN_A[14]),
        .O(comALessThanB0_carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_10
       (.I0(IN_A[13]),
        .I1(IN_B[13]),
        .I2(IN_A[12]),
        .I3(IN_B[12]),
        .O(comALessThanB0_carry_i_10_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_11
       (.I0(IN_A[11]),
        .I1(IN_B[11]),
        .I2(IN_A[10]),
        .I3(IN_B[10]),
        .O(comALessThanB0_carry_i_11_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_12
       (.I0(IN_A[9]),
        .I1(IN_B[9]),
        .I2(IN_A[8]),
        .I3(IN_B[8]),
        .O(comALessThanB0_carry_i_12_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_13
       (.I0(IN_A[7]),
        .I1(IN_B[7]),
        .I2(IN_A[6]),
        .I3(IN_B[6]),
        .O(comALessThanB0_carry_i_13_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_14
       (.I0(IN_A[5]),
        .I1(IN_B[5]),
        .I2(IN_A[4]),
        .I3(IN_B[4]),
        .O(comALessThanB0_carry_i_14_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_15
       (.I0(IN_A[3]),
        .I1(IN_B[3]),
        .I2(IN_A[2]),
        .I3(IN_B[2]),
        .O(comALessThanB0_carry_i_15_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_16
       (.I0(IN_A[1]),
        .I1(IN_B[1]),
        .I2(IN_A[0]),
        .I3(IN_B[0]),
        .O(comALessThanB0_carry_i_16_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_2
       (.I0(IN_B[13]),
        .I1(IN_A[13]),
        .I2(IN_B[12]),
        .I3(IN_A[12]),
        .O(comALessThanB0_carry_i_2_n_0));
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
    comALessThanB0_carry_i_4
       (.I0(IN_B[9]),
        .I1(IN_A[9]),
        .I2(IN_B[8]),
        .I3(IN_A[8]),
        .O(comALessThanB0_carry_i_4_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_5
       (.I0(IN_B[7]),
        .I1(IN_A[7]),
        .I2(IN_B[6]),
        .I3(IN_A[6]),
        .O(comALessThanB0_carry_i_5_n_0));
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
    comALessThanB0_carry_i_7
       (.I0(IN_B[3]),
        .I1(IN_A[3]),
        .I2(IN_B[2]),
        .I3(IN_A[2]),
        .O(comALessThanB0_carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    comALessThanB0_carry_i_8
       (.I0(IN_B[1]),
        .I1(IN_A[1]),
        .I2(IN_B[0]),
        .I3(IN_A[0]),
        .O(comALessThanB0_carry_i_8_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    comALessThanB0_carry_i_9
       (.I0(IN_A[15]),
        .I1(IN_B[15]),
        .I2(IN_A[14]),
        .I3(IN_B[14]),
        .O(comALessThanB0_carry_i_9_n_0));
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
