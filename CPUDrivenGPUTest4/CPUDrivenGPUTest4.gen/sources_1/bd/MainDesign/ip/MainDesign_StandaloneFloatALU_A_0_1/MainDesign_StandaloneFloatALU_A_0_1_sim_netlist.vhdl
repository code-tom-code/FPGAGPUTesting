-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:01:13 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StandaloneFloatALU_A_0_1/MainDesign_StandaloneFloatALU_A_0_1_sim_netlist.vhdl
-- Design      : MainDesign_StandaloneFloatALU_A_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_StandaloneFloatALU_A_0_1_StandaloneFloatALU_ADD is
  port (
    OADD : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IADD_GO : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_StandaloneFloatALU_A_0_1_StandaloneFloatALU_ADD : entity is "StandaloneFloatALU_ADD";
end MainDesign_StandaloneFloatALU_A_0_1_StandaloneFloatALU_ADD;

architecture STRUCTURE of MainDesign_StandaloneFloatALU_A_0_1_StandaloneFloatALU_ADD is
  signal \ADDStage1.mantissaMin0\ : STD_LOGIC_VECTOR ( 23 downto 1 );
  signal \ADDStage2.postAddMantissa0\ : STD_LOGIC_VECTOR ( 24 downto 1 );
  signal GetFloatIsINF013_in : STD_LOGIC;
  signal GetFloatIsINF015_in : STD_LOGIC;
  signal \GetFloatIsReal__5\ : STD_LOGIC;
  signal \OADD[0]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[0]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[10]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[10]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[11]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[11]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[11]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[12]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[12]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[12]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[13]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[13]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[13]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[14]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[14]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[14]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[15]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[15]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[15]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[15]_i_4_n_0\ : STD_LOGIC;
  signal \OADD[16]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[16]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[16]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[16]_i_4_n_0\ : STD_LOGIC;
  signal \OADD[17]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[17]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[17]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[17]_i_4_n_0\ : STD_LOGIC;
  signal \OADD[18]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[18]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[18]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[18]_i_4_n_0\ : STD_LOGIC;
  signal \OADD[19]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[19]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[19]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[1]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[1]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[20]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[20]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[20]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[21]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[21]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[21]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[22]_i_10_n_0\ : STD_LOGIC;
  signal \OADD[22]_i_11_n_0\ : STD_LOGIC;
  signal \OADD[22]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[22]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[22]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[22]_i_4_n_0\ : STD_LOGIC;
  signal \OADD[22]_i_5_n_0\ : STD_LOGIC;
  signal \OADD[22]_i_6_n_0\ : STD_LOGIC;
  signal \OADD[22]_i_7_n_0\ : STD_LOGIC;
  signal \OADD[22]_i_8_n_0\ : STD_LOGIC;
  signal \OADD[22]_i_9_n_0\ : STD_LOGIC;
  signal \OADD[23]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[24]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[25]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[25]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[26]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[26]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[27]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[27]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[28]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[28]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[29]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[2]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[2]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[2]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[30]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[30]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[31]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[31]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[31]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[31]_i_4_n_0\ : STD_LOGIC;
  signal \OADD[31]_i_5_n_0\ : STD_LOGIC;
  signal \OADD[31]_i_6_n_0\ : STD_LOGIC;
  signal \OADD[31]_i_7_n_0\ : STD_LOGIC;
  signal \OADD[31]_i_8_n_0\ : STD_LOGIC;
  signal \OADD[31]_i_9_n_0\ : STD_LOGIC;
  signal \OADD[3]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[3]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[4]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[4]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[5]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[5]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[6]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[6]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[7]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[7]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[7]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[8]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[8]_i_2_n_0\ : STD_LOGIC;
  signal \OADD[8]_i_3_n_0\ : STD_LOGIC;
  signal \OADD[9]_i_1_n_0\ : STD_LOGIC;
  signal \OADD[9]_i_2_n_0\ : STD_LOGIC;
  signal OADD_Temp : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \OADD_Temp[22]_i_1_n_0\ : STD_LOGIC;
  signal \OADD_Temp[22]_i_2_n_0\ : STD_LOGIC;
  signal \OADD_Temp[23]_i_1_n_0\ : STD_LOGIC;
  signal \OADD_Temp[24]_i_1_n_0\ : STD_LOGIC;
  signal \OADD_Temp[25]_i_1_n_0\ : STD_LOGIC;
  signal \OADD_Temp[26]_i_1_n_0\ : STD_LOGIC;
  signal \OADD_Temp[27]_i_1_n_0\ : STD_LOGIC;
  signal \OADD_Temp[28]_i_1_n_0\ : STD_LOGIC;
  signal \OADD_Temp[29]_i_1_n_0\ : STD_LOGIC;
  signal \OADD_Temp[30]_i_1_n_0\ : STD_LOGIC;
  signal \OADD_Temp[31]_i_1_n_0\ : STD_LOGIC;
  signal R : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal addALessThanB : STD_LOGIC;
  signal \addDenormFlushedValA[30]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[30]_i_3_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[0]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[10]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[11]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[12]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[13]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[14]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[15]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[16]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[17]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[18]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[19]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[1]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[20]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[21]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[22]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[23]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[24]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[25]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[26]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[27]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[28]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[29]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[2]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[30]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[3]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[4]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[5]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[6]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[7]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[8]\ : STD_LOGIC;
  signal \addDenormFlushedValA_reg_n_0_[9]\ : STD_LOGIC;
  signal \addDenormFlushedValB[30]_i_3_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[0]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[10]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[11]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[12]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[13]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[14]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[15]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[16]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[17]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[18]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[19]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[1]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[20]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[21]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[22]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[23]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[24]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[25]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[26]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[27]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[28]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[29]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[2]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[30]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[3]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[4]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[5]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[6]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[7]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[8]\ : STD_LOGIC;
  signal \addDenormFlushedValB_reg_n_0_[9]\ : STD_LOGIC;
  signal addEarlyOutBypass0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \addEarlyOutBypass0[0]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[10]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[11]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[12]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[13]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[14]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[15]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[16]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[17]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[18]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[19]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[1]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[20]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[21]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[22]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[23]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[24]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[25]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[26]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[27]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[28]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[29]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[2]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[30]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[30]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[30]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[30]_i_4_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[30]_i_5_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[30]_i_6_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_12_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_14_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_15_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_18_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_19_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_20_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_21_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_22_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_23_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_24_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_25_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_26_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_27_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_5_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_7_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_8_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_9_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[3]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[4]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[5]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[6]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[7]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[8]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[9]_i_1_n_0\ : STD_LOGIC;
  signal addEarlyOutBypass1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \addEarlyOutBypass1[0]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[10]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[11]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[12]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[13]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[14]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[15]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[16]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[17]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[18]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[19]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[1]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[20]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[21]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[22]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[23]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[24]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[25]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[26]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[27]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[28]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[29]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[2]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[30]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[31]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[31]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[3]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[4]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[5]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[6]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[7]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[8]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass1[9]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypassEnable00__0\ : STD_LOGIC;
  signal \addEarlyOutBypassEnable0120_out__0\ : STD_LOGIC;
  signal \addEarlyOutBypassEnable0123_out__0\ : STD_LOGIC;
  signal addEarlyOutBypassEnable013_out : STD_LOGIC;
  signal \addEarlyOutBypassEnable01__2\ : STD_LOGIC;
  signal \addEarlyOutBypassEnable0__0\ : STD_LOGIC;
  signal addEarlyOutBypassEnable0_i_1_n_0 : STD_LOGIC;
  signal addEarlyOutBypassEnable0_i_3_n_0 : STD_LOGIC;
  signal addEarlyOutBypassEnable0_i_4_n_0 : STD_LOGIC;
  signal addEarlyOutBypassEnable1_i_1_n_0 : STD_LOGIC;
  signal addEarlyOutBypassEnable1_reg_n_0 : STD_LOGIC;
  signal addEarlyOutBypassEnable2_i_1_n_0 : STD_LOGIC;
  signal addEarlyOutBypassEnable2_reg_n_0 : STD_LOGIC;
  signal addExponentDeltaAMinusB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal addExponentDeltaAMinusB0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal addExponentDeltaAMinusBShiftTooFar : STD_LOGIC;
  signal addExponentDeltaAMinusBShiftTooFar_i_1_n_0 : STD_LOGIC;
  signal addExponentDeltaAMinusBShiftTooFar_i_2_n_0 : STD_LOGIC;
  signal \addExponentDeltaAMinusB[3]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[3]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[4]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[4]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[5]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[5]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[7]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[7]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[7]_i_4_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[7]_i_5_n_0\ : STD_LOGIC;
  signal addExponentDeltaBMinusA : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal addExponentDeltaBMinusA0 : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal addExponentDeltaBMinusAShiftTooFar : STD_LOGIC;
  signal addExponentDeltaBMinusAShiftTooFar_i_1_n_0 : STD_LOGIC;
  signal addExponentDeltaBMinusAShiftTooFar_i_2_n_0 : STD_LOGIC;
  signal \addExponentDeltaBMinusA[3]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[3]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[4]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[4]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[5]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[5]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[7]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[7]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[7]_i_4_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[7]_i_5_n_0\ : STD_LOGIC;
  signal addFinalExp : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \addFinalExp[0]_i_1_n_0\ : STD_LOGIC;
  signal \addFinalExp[1]_i_1_n_0\ : STD_LOGIC;
  signal \addFinalExp[2]_i_1_n_0\ : STD_LOGIC;
  signal \addFinalExp[3]_i_1_n_0\ : STD_LOGIC;
  signal \addFinalExp[4]_i_1_n_0\ : STD_LOGIC;
  signal \addFinalExp[5]_i_1_n_0\ : STD_LOGIC;
  signal \addFinalExp[5]_i_2_n_0\ : STD_LOGIC;
  signal \addFinalExp[6]_i_1_n_0\ : STD_LOGIC;
  signal \addFinalExp[6]_i_2_n_0\ : STD_LOGIC;
  signal \addFinalExp[7]_i_1_n_0\ : STD_LOGIC;
  signal \addFinalExp[7]_i_2_n_0\ : STD_LOGIC;
  signal addFinalSignIsNeg_i_1_n_0 : STD_LOGIC;
  signal addFinalSignIsNeg_reg_n_0 : STD_LOGIC;
  signal addMaxVal1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \addMaxVal1[23]_i_1_n_0\ : STD_LOGIC;
  signal \addMaxVal1[24]_i_1_n_0\ : STD_LOGIC;
  signal \addMaxVal1[25]_i_1_n_0\ : STD_LOGIC;
  signal \addMaxVal1[26]_i_1_n_0\ : STD_LOGIC;
  signal \addMaxVal1[27]_i_1_n_0\ : STD_LOGIC;
  signal \addMaxVal1[28]_i_1_n_0\ : STD_LOGIC;
  signal \addMaxVal1[29]_i_1_n_0\ : STD_LOGIC;
  signal \addMaxVal1[30]_i_2_n_0\ : STD_LOGIC;
  signal \addMaxVal1_reg_n_0_[23]\ : STD_LOGIC;
  signal \addMaxVal1_reg_n_0_[24]\ : STD_LOGIC;
  signal \addMaxVal1_reg_n_0_[25]\ : STD_LOGIC;
  signal \addMaxVal1_reg_n_0_[26]\ : STD_LOGIC;
  signal \addMaxVal1_reg_n_0_[27]\ : STD_LOGIC;
  signal \addMaxVal1_reg_n_0_[28]\ : STD_LOGIC;
  signal \addMaxVal1_reg_n_0_[29]\ : STD_LOGIC;
  signal \addMaxVal1_reg_n_0_[30]\ : STD_LOGIC;
  signal addPipelineValidStage0 : STD_LOGIC;
  signal addPipelineValidStage1 : STD_LOGIC;
  signal addPipelineValidStage2 : STD_LOGIC;
  signal addPostAddMantissa : STD_LOGIC_VECTOR ( 0 to 0 );
  signal addPostAddMantissa1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \addPostAddMantissa10__22_carry__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_1\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_10\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_11\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_12\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_13\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_14\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_15\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_2\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_3\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_4\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_8\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__0_n_9\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_1\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_10\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_11\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_12\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_13\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_14\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_15\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_2\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_3\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_4\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_8\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__1_n_9\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__2_n_14\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__2_n_15\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry__2_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_10__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_10__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_10_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_11__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_11__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_11_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_12__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_12__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_12_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_13__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_13__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_13_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_14__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_14__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_14_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_15__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_15__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_15_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_16__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_16__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_16_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_17__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_17__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_17_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_18__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_18__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_18_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_19__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_19__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_19_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_1__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_1__2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_20__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_20__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_20_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_21__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_21__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_21_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_22__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_22__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_22_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_23__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_23__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_23_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_24__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_24__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_24_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_25__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_25__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_25_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_26__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_26__1_n_3\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_26__1_n_4\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_26__1_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_26__1_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_26__1_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_26_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_27__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_27__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_27_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_28__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_28__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_28_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_29__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_29__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_29_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_2__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_2__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_2__2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_30__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_30__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_30_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_31__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_31__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_31_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_32__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_32__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_32_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_33__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_33__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_33__1_n_1\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_33__1_n_2\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_33__1_n_3\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_33__1_n_4\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_33__1_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_33__1_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_33__1_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_33_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_34__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_34__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_34_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_35__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_35__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_35_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_36__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_36__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_36_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_37__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_37_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_38__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_38_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_39__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_39_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_3__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_3__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_3_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_40__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_40_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_41__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_41_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_42__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_42_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_43__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_43_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_44__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_44_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_45__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_45_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_46__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_46_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_47__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_47_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_48__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_48_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_49_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_4__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_4__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_4_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_50_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_51_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_52_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_53_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_54_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_55_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_56_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_57_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_58_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_59_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_5__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_5__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_5_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_60_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_61_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_62_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_63_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_64_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_65_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_66_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_67_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_68_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_69_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_6__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_6__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_6_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_70_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_71_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_72_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_73_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_73_n_1\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_73_n_2\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_73_n_3\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_73_n_4\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_73_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_73_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_73_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_74_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_75_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_76_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_77_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_78_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_79_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_7__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_7__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_7_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_80_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_81_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_82_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_83_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_84_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_85_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_86_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_87_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_88_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_89_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_8__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_8__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_8_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_90_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_91_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_92_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_93_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_9__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_9__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_i_9_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_1\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_10\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_11\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_12\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_13\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_14\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_15\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_2\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_3\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_4\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_8\ : STD_LOGIC;
  signal \addPostAddMantissa10__22_carry_n_9\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[0]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[10]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[11]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[12]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[13]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[14]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[15]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[16]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[17]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[18]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[19]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[1]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[20]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[21]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[22]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[23]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[24]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[25]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[2]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[3]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[4]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[5]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[6]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[7]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[8]\ : STD_LOGIC;
  signal \addPostAddMantissa1_reg_n_0_[9]\ : STD_LOGIC;
  signal \addPostAddMantissa[0]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[10]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[10]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[11]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[11]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[12]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[12]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[13]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[13]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[14]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[14]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[15]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[15]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[16]_i_10_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[16]_i_11_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[16]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[16]_i_3_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[16]_i_4_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[16]_i_5_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[16]_i_6_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[16]_i_7_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[16]_i_8_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[16]_i_9_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[17]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[17]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[18]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[18]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[19]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[19]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[1]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[1]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[20]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[20]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[21]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[21]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[22]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[22]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[2]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[2]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[3]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[3]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[4]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[4]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[5]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[5]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[6]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[6]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[7]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[7]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[8]_i_10_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[8]_i_11_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[8]_i_12_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[8]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[8]_i_3_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[8]_i_4_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[8]_i_5_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[8]_i_6_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[8]_i_7_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[8]_i_8_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[8]_i_9_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[9]_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa[9]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[16]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[16]_i_2_n_1\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[16]_i_2_n_2\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[16]_i_2_n_3\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[16]_i_2_n_4\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[16]_i_2_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[16]_i_2_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[16]_i_2_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_3\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_4\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[0]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[10]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[11]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[12]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[13]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[14]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[15]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[16]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[17]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[18]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[19]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[1]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[20]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[21]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[22]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[2]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[3]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[4]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[5]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[6]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[7]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[8]\ : STD_LOGIC;
  signal \addPostAddMantissa_reg_n_0_[9]\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_10_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_11_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_12_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_13_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_1_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_2_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_3_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_4_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_5_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_6_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_7_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_8_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[0]_i_9_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_10_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_11_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_12_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_13_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_14_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_1_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_2_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_3_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_4_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_5_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_6_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_7_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_8_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[1]_i_9_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_10_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_11_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_12_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_13_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_14_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_15_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_16_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_17_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_18_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_1_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_2_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_3_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_5_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_6_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_7_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_8_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[2]_i_9_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[3]_i_1_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[4]_i_10_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[4]_i_11_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[4]_i_2_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[4]_i_3_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[4]_i_4_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[4]_i_5_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[4]_i_6_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[4]_i_7_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[4]_i_8_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount[4]_i_9_n_0\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount_reg[2]_i_4_n_1\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount_reg[2]_i_4_n_2\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount_reg[2]_i_4_n_3\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount_reg[2]_i_4_n_4\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount_reg[2]_i_4_n_5\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount_reg[2]_i_4_n_6\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount_reg[2]_i_4_n_7\ : STD_LOGIC;
  signal addSameNumberDifferentSigns0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00 : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_n_6\ : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_n_7\ : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_10_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_11_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_12_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_13_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_14_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_15_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_16_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_1_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_2_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_3_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_4_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_5_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_6_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_7_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_8_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_9_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_n_1 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_n_2 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_n_3 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_n_4 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_n_5 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_n_6 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_n_7 : STD_LOGIC;
  signal addSameNumberDifferentSigns1_i_1_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns1_reg_n_0 : STD_LOGIC;
  signal \comAIsDenormal__6\ : STD_LOGIC;
  signal comALessThanB : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_1\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_2\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_3\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_4\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_5\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_6\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_7\ : STD_LOGIC;
  signal \comALessThanB0_carry_i_10__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_10_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_11__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_11_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_12__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_12_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_13__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_13_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_14__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_14_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_15__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_15_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_16__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_16_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_1__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_1_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_2__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_2_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_3__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_3_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_4__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_4_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_5__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_5_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_6__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_6_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_7__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_7_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_8__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_8_n_0 : STD_LOGIC;
  signal \comALessThanB0_carry_i_9__0_n_0\ : STD_LOGIC;
  signal comALessThanB0_carry_i_9_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_n_1 : STD_LOGIC;
  signal comALessThanB0_carry_n_2 : STD_LOGIC;
  signal comALessThanB0_carry_n_3 : STD_LOGIC;
  signal comALessThanB0_carry_n_4 : STD_LOGIC;
  signal comALessThanB0_carry_n_5 : STD_LOGIC;
  signal comALessThanB0_carry_n_6 : STD_LOGIC;
  signal comALessThanB0_carry_n_7 : STD_LOGIC;
  signal \comBIsDenormal__6\ : STD_LOGIC;
  signal data3 : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \in\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal \NLW_addPostAddMantissa10__22_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_addPostAddMantissa10__22_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal \NLW_addPostAddMantissa10__22_carry_i_26__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \NLW_addPostAddMantissa10__22_carry_i_26__1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \NLW_addRenormalizeShiftAmount_reg[2]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_addSameNumberDifferentSigns00_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_addSameNumberDifferentSigns00_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_addSameNumberDifferentSigns00_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_comALessThanB0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_comALessThanB0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \OADD[0]_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \OADD[11]_i_2\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \OADD[12]_i_2\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \OADD[13]_i_2\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \OADD[14]_i_2\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \OADD[15]_i_2\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \OADD[15]_i_4\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \OADD[16]_i_2\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \OADD[16]_i_4\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \OADD[17]_i_2\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \OADD[17]_i_4\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \OADD[18]_i_2\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \OADD[19]_i_2\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \OADD[1]_i_2\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \OADD[20]_i_2\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \OADD[21]_i_2\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \OADD[22]_i_11\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \OADD[22]_i_4\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \OADD[22]_i_5\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \OADD[22]_i_6\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \OADD[22]_i_8\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \OADD[22]_i_9\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \OADD[25]_i_2\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \OADD[26]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \OADD[27]_i_2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \OADD[28]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \OADD[2]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \OADD[2]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \OADD[31]_i_8\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \OADD[31]_i_9\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \OADD_Temp[23]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \OADD_Temp[24]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \OADD_Temp[25]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \OADD_Temp[26]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \OADD_Temp[27]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \OADD_Temp[28]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \OADD_Temp[29]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \OADD_Temp[30]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[30]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[0]_i_1\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[10]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[11]_i_1\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[12]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[13]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[14]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[15]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[16]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[17]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[18]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[19]_i_1\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[1]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[20]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[21]_i_1\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[22]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[23]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[24]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[25]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[26]_i_1\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[27]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[28]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[2]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[30]_i_1\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[30]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[3]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[4]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[5]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[6]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[7]_i_1\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[8]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[9]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[23]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[30]_i_5\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_10\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_12\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_14\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_20\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_24\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_25\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_4\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_6\ : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[15]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[18]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[19]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[20]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[21]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[22]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[3]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[4]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[5]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[6]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[7]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of addEarlyOutBypassEnable0_i_2 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of addEarlyOutBypassEnable0_i_3 : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[1]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[3]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[4]_i_2\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[5]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[7]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[1]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[3]_i_3\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[5]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[7]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \addFinalExp[0]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \addFinalExp[1]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \addFinalExp[3]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \addFinalExp[4]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \addFinalExp[5]_i_2\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \addMaxVal1[23]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \addMaxVal1[24]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \addMaxVal1[25]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \addMaxVal1[26]_i_1\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \addMaxVal1[27]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \addMaxVal1[28]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \addMaxVal1[29]_i_1\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \addMaxVal1[30]_i_2\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_18__1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_19__1\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_24__1\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_27\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_36__1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_40__0\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_42__0\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_70\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_74\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_75\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_76\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_77\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_78\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_79\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_80\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_81\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_82\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_83\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \addPostAddMantissa10__22_carry_i_84\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \addPostAddMantissa[10]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \addPostAddMantissa[10]_i_2\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \addPostAddMantissa[11]_i_2\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \addPostAddMantissa[12]_i_2\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \addPostAddMantissa[13]_i_2\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \addPostAddMantissa[14]_i_2\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \addPostAddMantissa[15]_i_2\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \addPostAddMantissa[16]_i_3\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \addPostAddMantissa[17]_i_2\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \addPostAddMantissa[18]_i_2\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \addPostAddMantissa[19]_i_2\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \addPostAddMantissa[1]_i_2\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \addPostAddMantissa[20]_i_2\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \addPostAddMantissa[22]_i_2\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \addPostAddMantissa[2]_i_2\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \addPostAddMantissa[3]_i_2\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \addPostAddMantissa[4]_i_2\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \addPostAddMantissa[5]_i_2\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \addPostAddMantissa[6]_i_2\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of \addPostAddMantissa[7]_i_2\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \addPostAddMantissa[8]_i_3\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \addPostAddMantissa[9]_i_2\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[0]_i_13\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[0]_i_8\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[1]_i_13\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[1]_i_3\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[1]_i_7\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[1]_i_9\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[2]_i_18\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[2]_i_7\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[4]_i_11\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[4]_i_6\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[4]_i_9\ : label is "soft_lutpair26";
  attribute COMPARATOR_THRESHOLD : integer;
  attribute COMPARATOR_THRESHOLD of comALessThanB0_carry : label is 11;
  attribute COMPARATOR_THRESHOLD of \comALessThanB0_carry__0\ : label is 11;
begin
\OADD[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA0000AAAAC000"
    )
        port map (
      I0 => OADD_Temp(0),
      I1 => \OADD[2]_i_3_n_0\,
      I2 => \addPostAddMantissa_reg_n_0_[0]\,
      I3 => \OADD[0]_i_2_n_0\,
      I4 => addEarlyOutBypassEnable2_reg_n_0,
      I5 => R(0),
      O => \OADD[0]_i_1_n_0\
    );
\OADD[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => R(4),
      I1 => R(3),
      O => \OADD[0]_i_2_n_0\
    );
\OADD[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[11]_i_2_n_0\,
      I2 => \OADD[10]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(10),
      O => \OADD[10]_i_1_n_0\
    );
\OADD[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B080FFFFB0800000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[3]\,
      I1 => R(2),
      I2 => \OADD[0]_i_2_n_0\,
      I3 => \addPostAddMantissa_reg_n_0_[7]\,
      I4 => R(1),
      I5 => \OADD[12]_i_3_n_0\,
      O => \OADD[10]_i_2_n_0\
    );
\OADD[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[12]_i_2_n_0\,
      I2 => \OADD[11]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(11),
      O => \OADD[11]_i_1_n_0\
    );
\OADD[11]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \OADD[11]_i_3_n_0\,
      I1 => R(1),
      I2 => \OADD[13]_i_3_n_0\,
      O => \OADD[11]_i_2_n_0\
    );
\OADD[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000030300000BB88"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[4]\,
      I1 => R(2),
      I2 => \addPostAddMantissa_reg_n_0_[0]\,
      I3 => \addPostAddMantissa_reg_n_0_[8]\,
      I4 => R(4),
      I5 => R(3),
      O => \OADD[11]_i_3_n_0\
    );
\OADD[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[13]_i_2_n_0\,
      I2 => \OADD[12]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(12),
      O => \OADD[12]_i_1_n_0\
    );
\OADD[12]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \OADD[12]_i_3_n_0\,
      I1 => R(1),
      I2 => \OADD[14]_i_3_n_0\,
      O => \OADD[12]_i_2_n_0\
    );
\OADD[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000030300000BB88"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[5]\,
      I1 => R(2),
      I2 => \addPostAddMantissa_reg_n_0_[1]\,
      I3 => \addPostAddMantissa_reg_n_0_[9]\,
      I4 => R(4),
      I5 => R(3),
      O => \OADD[12]_i_3_n_0\
    );
\OADD[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[14]_i_2_n_0\,
      I2 => \OADD[13]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(13),
      O => \OADD[13]_i_1_n_0\
    );
\OADD[13]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \OADD[13]_i_3_n_0\,
      I1 => R(1),
      I2 => \OADD[15]_i_3_n_0\,
      O => \OADD[13]_i_2_n_0\
    );
\OADD[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000030300000BB88"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[6]\,
      I1 => R(2),
      I2 => \addPostAddMantissa_reg_n_0_[2]\,
      I3 => \addPostAddMantissa_reg_n_0_[10]\,
      I4 => R(4),
      I5 => R(3),
      O => \OADD[13]_i_3_n_0\
    );
\OADD[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[15]_i_2_n_0\,
      I2 => \OADD[14]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(14),
      O => \OADD[14]_i_1_n_0\
    );
\OADD[14]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \OADD[14]_i_3_n_0\,
      I1 => R(1),
      I2 => \OADD[16]_i_3_n_0\,
      O => \OADD[14]_i_2_n_0\
    );
\OADD[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000030300000BB88"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[7]\,
      I1 => R(2),
      I2 => \addPostAddMantissa_reg_n_0_[3]\,
      I3 => \addPostAddMantissa_reg_n_0_[11]\,
      I4 => R(4),
      I5 => R(3),
      O => \OADD[14]_i_3_n_0\
    );
\OADD[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[16]_i_2_n_0\,
      I2 => \OADD[15]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(15),
      O => \OADD[15]_i_1_n_0\
    );
\OADD[15]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \OADD[15]_i_3_n_0\,
      I1 => R(1),
      I2 => \OADD[17]_i_3_n_0\,
      O => \OADD[15]_i_2_n_0\
    );
\OADD[15]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0CFFFF0A0C0000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[0]\,
      I1 => \addPostAddMantissa_reg_n_0_[8]\,
      I2 => R(4),
      I3 => R(3),
      I4 => R(2),
      I5 => \OADD[15]_i_4_n_0\,
      O => \OADD[15]_i_3_n_0\
    );
\OADD[15]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[4]\,
      I1 => \addPostAddMantissa_reg_n_0_[12]\,
      I2 => R(4),
      I3 => R(3),
      O => \OADD[15]_i_4_n_0\
    );
\OADD[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[17]_i_2_n_0\,
      I2 => \OADD[16]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(16),
      O => \OADD[16]_i_1_n_0\
    );
\OADD[16]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \OADD[16]_i_3_n_0\,
      I1 => R(1),
      I2 => \OADD[18]_i_3_n_0\,
      O => \OADD[16]_i_2_n_0\
    );
\OADD[16]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0CFFFF0A0C0000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[1]\,
      I1 => \addPostAddMantissa_reg_n_0_[9]\,
      I2 => R(4),
      I3 => R(3),
      I4 => R(2),
      I5 => \OADD[16]_i_4_n_0\,
      O => \OADD[16]_i_3_n_0\
    );
\OADD[16]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[5]\,
      I1 => \addPostAddMantissa_reg_n_0_[13]\,
      I2 => R(4),
      I3 => R(3),
      O => \OADD[16]_i_4_n_0\
    );
\OADD[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[18]_i_2_n_0\,
      I2 => \OADD[17]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(17),
      O => \OADD[17]_i_1_n_0\
    );
\OADD[17]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \OADD[17]_i_3_n_0\,
      I1 => R(1),
      I2 => \OADD[19]_i_3_n_0\,
      O => \OADD[17]_i_2_n_0\
    );
\OADD[17]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0CFFFF0A0C0000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[2]\,
      I1 => \addPostAddMantissa_reg_n_0_[10]\,
      I2 => R(4),
      I3 => R(3),
      I4 => R(2),
      I5 => \OADD[17]_i_4_n_0\,
      O => \OADD[17]_i_3_n_0\
    );
\OADD[17]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[6]\,
      I1 => \addPostAddMantissa_reg_n_0_[14]\,
      I2 => R(4),
      I3 => R(3),
      O => \OADD[17]_i_4_n_0\
    );
\OADD[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[19]_i_2_n_0\,
      I2 => \OADD[18]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(18),
      O => \OADD[18]_i_1_n_0\
    );
\OADD[18]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \OADD[18]_i_3_n_0\,
      I1 => R(1),
      I2 => \OADD[20]_i_3_n_0\,
      O => \OADD[18]_i_2_n_0\
    );
\OADD[18]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0CFFFF0A0C0000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[3]\,
      I1 => \addPostAddMantissa_reg_n_0_[11]\,
      I2 => R(4),
      I3 => R(3),
      I4 => R(2),
      I5 => \OADD[18]_i_4_n_0\,
      O => \OADD[18]_i_3_n_0\
    );
\OADD[18]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0A0C"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[7]\,
      I1 => \addPostAddMantissa_reg_n_0_[15]\,
      I2 => R(4),
      I3 => R(3),
      O => \OADD[18]_i_4_n_0\
    );
\OADD[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[20]_i_2_n_0\,
      I2 => \OADD[19]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(19),
      O => \OADD[19]_i_1_n_0\
    );
\OADD[19]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \OADD[19]_i_3_n_0\,
      I1 => R(1),
      I2 => \OADD[21]_i_3_n_0\,
      O => \OADD[19]_i_2_n_0\
    );
\OADD[19]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0CFFFF0A0C0000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[4]\,
      I1 => \addPostAddMantissa_reg_n_0_[12]\,
      I2 => R(4),
      I3 => R(3),
      I4 => R(2),
      I5 => \OADD[22]_i_4_n_0\,
      O => \OADD[19]_i_3_n_0\
    );
\OADD[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFE0400000E040"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[2]_i_2_n_0\,
      I2 => \OADD[2]_i_3_n_0\,
      I3 => \OADD[1]_i_2_n_0\,
      I4 => addEarlyOutBypassEnable2_reg_n_0,
      I5 => OADD_Temp(1),
      O => \OADD[1]_i_1_n_0\
    );
\OADD[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => R(3),
      I1 => R(4),
      I2 => \addPostAddMantissa_reg_n_0_[0]\,
      O => \OADD[1]_i_2_n_0\
    );
\OADD[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[21]_i_2_n_0\,
      I2 => \OADD[20]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(20),
      O => \OADD[20]_i_1_n_0\
    );
\OADD[20]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \OADD[20]_i_3_n_0\,
      I1 => R(1),
      I2 => \OADD[22]_i_10_n_0\,
      O => \OADD[20]_i_2_n_0\
    );
\OADD[20]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0CFFFF0A0C0000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[5]\,
      I1 => \addPostAddMantissa_reg_n_0_[13]\,
      I2 => R(4),
      I3 => R(3),
      I4 => R(2),
      I5 => \OADD[22]_i_9_n_0\,
      O => \OADD[20]_i_3_n_0\
    );
\OADD[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[22]_i_3_n_0\,
      I2 => \OADD[21]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(21),
      O => \OADD[21]_i_1_n_0\
    );
\OADD[21]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00B8B8"
    )
        port map (
      I0 => \OADD[22]_i_4_n_0\,
      I1 => R(2),
      I2 => \OADD[22]_i_5_n_0\,
      I3 => \OADD[21]_i_3_n_0\,
      I4 => R(1),
      O => \OADD[21]_i_2_n_0\
    );
\OADD[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0CFFFF0A0C0000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[6]\,
      I1 => \addPostAddMantissa_reg_n_0_[14]\,
      I2 => R(4),
      I3 => R(3),
      I4 => R(2),
      I5 => \OADD[22]_i_7_n_0\,
      O => \OADD[21]_i_3_n_0\
    );
\OADD[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[22]_i_2_n_0\,
      I2 => \OADD[22]_i_3_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(22),
      O => \OADD[22]_i_1_n_0\
    );
\OADD[22]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0CFFFF0A0C0000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[7]\,
      I1 => \addPostAddMantissa_reg_n_0_[15]\,
      I2 => R(4),
      I3 => R(3),
      I4 => R(2),
      I5 => \OADD[22]_i_11_n_0\,
      O => \OADD[22]_i_10_n_0\
    );
\OADD[22]_i_11\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[19]\,
      I1 => \addPostAddMantissa_reg_n_0_[11]\,
      I2 => \addPostAddMantissa_reg_n_0_[3]\,
      I3 => R(4),
      I4 => R(3),
      O => \OADD[22]_i_11_n_0\
    );
\OADD[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8FFCC3300"
    )
        port map (
      I0 => \OADD[22]_i_4_n_0\,
      I1 => R(2),
      I2 => \OADD[22]_i_5_n_0\,
      I3 => \OADD[22]_i_6_n_0\,
      I4 => \OADD[22]_i_7_n_0\,
      I5 => R(1),
      O => \OADD[22]_i_2_n_0\
    );
\OADD[22]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(2),
      I1 => \OADD[22]_i_8_n_0\,
      I2 => \OADD[22]_i_9_n_0\,
      I3 => R(1),
      I4 => \OADD[22]_i_10_n_0\,
      O => \OADD[22]_i_3_n_0\
    );
\OADD[22]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[16]\,
      I1 => \addPostAddMantissa_reg_n_0_[8]\,
      I2 => \addPostAddMantissa_reg_n_0_[0]\,
      I3 => R(4),
      I4 => R(3),
      O => \OADD[22]_i_4_n_0\
    );
\OADD[22]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[20]\,
      I1 => \addPostAddMantissa_reg_n_0_[12]\,
      I2 => \addPostAddMantissa_reg_n_0_[4]\,
      I3 => R(4),
      I4 => R(3),
      O => \OADD[22]_i_5_n_0\
    );
\OADD[22]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[22]\,
      I1 => \addPostAddMantissa_reg_n_0_[14]\,
      I2 => \addPostAddMantissa_reg_n_0_[6]\,
      I3 => R(4),
      I4 => R(3),
      O => \OADD[22]_i_6_n_0\
    );
\OADD[22]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[18]\,
      I1 => \addPostAddMantissa_reg_n_0_[10]\,
      I2 => \addPostAddMantissa_reg_n_0_[2]\,
      I3 => R(4),
      I4 => R(3),
      O => \OADD[22]_i_7_n_0\
    );
\OADD[22]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[21]\,
      I1 => \addPostAddMantissa_reg_n_0_[13]\,
      I2 => \addPostAddMantissa_reg_n_0_[5]\,
      I3 => R(4),
      I4 => R(3),
      O => \OADD[22]_i_8_n_0\
    );
\OADD[22]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00CCF0AA"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[17]\,
      I1 => \addPostAddMantissa_reg_n_0_[9]\,
      I2 => \addPostAddMantissa_reg_n_0_[1]\,
      I3 => R(4),
      I4 => R(3),
      O => \OADD[22]_i_9_n_0\
    );
\OADD[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => R(0),
      I1 => addFinalExp(0),
      I2 => addEarlyOutBypassEnable2_reg_n_0,
      I3 => OADD_Temp(23),
      O => \OADD[23]_i_1_n_0\
    );
\OADD[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF969900009699"
    )
        port map (
      I0 => addFinalExp(1),
      I1 => R(1),
      I2 => R(0),
      I3 => addFinalExp(0),
      I4 => addEarlyOutBypassEnable2_reg_n_0,
      I5 => OADD_Temp(24),
      O => \OADD[24]_i_1_n_0\
    );
\OADD[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF690069"
    )
        port map (
      I0 => addFinalExp(2),
      I1 => R(2),
      I2 => \OADD[25]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(25),
      O => \OADD[25]_i_1_n_0\
    );
\OADD[25]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => addFinalExp(0),
      I1 => R(0),
      I2 => R(1),
      I3 => addFinalExp(1),
      O => \OADD[25]_i_2_n_0\
    );
\OADD[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF690069"
    )
        port map (
      I0 => addFinalExp(3),
      I1 => R(3),
      I2 => \OADD[26]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(26),
      O => \OADD[26]_i_1_n_0\
    );
\OADD[26]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2F02FFFF00002F02"
    )
        port map (
      I0 => addFinalExp(0),
      I1 => R(0),
      I2 => R(1),
      I3 => addFinalExp(1),
      I4 => R(2),
      I5 => addFinalExp(2),
      O => \OADD[26]_i_2_n_0\
    );
\OADD[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF690069"
    )
        port map (
      I0 => addFinalExp(4),
      I1 => R(4),
      I2 => \OADD[27]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(27),
      O => \OADD[27]_i_1_n_0\
    );
\OADD[27]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \OADD[26]_i_2_n_0\,
      I1 => R(3),
      I2 => addFinalExp(3),
      O => \OADD[27]_i_2_n_0\
    );
\OADD[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => addFinalExp(5),
      I1 => \OADD[28]_i_2_n_0\,
      I2 => addEarlyOutBypassEnable2_reg_n_0,
      I3 => OADD_Temp(28),
      O => \OADD[28]_i_1_n_0\
    );
\OADD[28]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B2FF00B2"
    )
        port map (
      I0 => \OADD[26]_i_2_n_0\,
      I1 => R(3),
      I2 => addFinalExp(3),
      I3 => R(4),
      I4 => addFinalExp(4),
      O => \OADD[28]_i_2_n_0\
    );
\OADD[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => addFinalExp(6),
      I1 => \OADD[30]_i_2_n_0\,
      I2 => addEarlyOutBypassEnable2_reg_n_0,
      I3 => OADD_Temp(29),
      O => \OADD[29]_i_1_n_0\
    );
\OADD[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFE4440000E444"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[3]_i_2_n_0\,
      I2 => \OADD[2]_i_2_n_0\,
      I3 => \OADD[2]_i_3_n_0\,
      I4 => addEarlyOutBypassEnable2_reg_n_0,
      I5 => OADD_Temp(2),
      O => \OADD[2]_i_1_n_0\
    );
\OADD[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"10"
    )
        port map (
      I0 => R(3),
      I1 => R(4),
      I2 => \addPostAddMantissa_reg_n_0_[1]\,
      O => \OADD[2]_i_2_n_0\
    );
\OADD[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => R(2),
      I1 => R(1),
      O => \OADD[2]_i_3_n_0\
    );
\OADD[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF560056"
    )
        port map (
      I0 => addFinalExp(7),
      I1 => addFinalExp(6),
      I2 => \OADD[30]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(30),
      O => \OADD[30]_i_1_n_0\
    );
\OADD[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFB2BB22B2"
    )
        port map (
      I0 => addFinalExp(4),
      I1 => R(4),
      I2 => addFinalExp(3),
      I3 => R(3),
      I4 => \OADD[26]_i_2_n_0\,
      I5 => addFinalExp(5),
      O => \OADD[30]_i_2_n_0\
    );
\OADD[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0008080000000000"
    )
        port map (
      I0 => addFinalExp(7),
      I1 => addPipelineValidStage2,
      I2 => addEarlyOutBypassEnable2_reg_n_0,
      I3 => addFinalExp(6),
      I4 => \OADD[31]_i_3_n_0\,
      I5 => \OADD[31]_i_4_n_0\,
      O => \OADD[31]_i_1_n_0\
    );
\OADD[31]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => OADD_Temp(31),
      I1 => addEarlyOutBypassEnable2_reg_n_0,
      I2 => addFinalSignIsNeg_reg_n_0,
      O => \OADD[31]_i_2_n_0\
    );
\OADD[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFB2BB22B2"
    )
        port map (
      I0 => addFinalExp(4),
      I1 => R(4),
      I2 => addFinalExp(3),
      I3 => R(3),
      I4 => \OADD[31]_i_5_n_0\,
      I5 => addFinalExp(5),
      O => \OADD[31]_i_3_n_0\
    );
\OADD[31]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00208208"
    )
        port map (
      I0 => \OADD[31]_i_6_n_0\,
      I1 => \OADD[31]_i_7_n_0\,
      I2 => R(4),
      I3 => addFinalExp(4),
      I4 => addFinalExp(5),
      O => \OADD[31]_i_4_n_0\
    );
\OADD[31]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BF0BFFFF0000BF0B"
    )
        port map (
      I0 => addFinalExp(0),
      I1 => R(0),
      I2 => R(1),
      I3 => addFinalExp(1),
      I4 => R(2),
      I5 => addFinalExp(2),
      O => \OADD[31]_i_5_n_0\
    );
\OADD[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9204009200000400"
    )
        port map (
      I0 => \OADD[31]_i_8_n_0\,
      I1 => R(1),
      I2 => addFinalExp(1),
      I3 => R(2),
      I4 => addFinalExp(2),
      I5 => \OADD[31]_i_9_n_0\,
      O => \OADD[31]_i_6_n_0\
    );
\OADD[31]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B2"
    )
        port map (
      I0 => \OADD[31]_i_5_n_0\,
      I1 => R(3),
      I2 => addFinalExp(3),
      O => \OADD[31]_i_7_n_0\
    );
\OADD[31]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => addFinalExp(0),
      I1 => R(0),
      O => \OADD[31]_i_8_n_0\
    );
\OADD[31]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => addFinalExp(3),
      I1 => R(3),
      O => \OADD[31]_i_9_n_0\
    );
\OADD[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[4]_i_2_n_0\,
      I2 => \OADD[3]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(3),
      O => \OADD[3]_i_1_n_0\
    );
\OADD[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000020200000300"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[0]\,
      I1 => R(3),
      I2 => R(4),
      I3 => \addPostAddMantissa_reg_n_0_[2]\,
      I4 => R(2),
      I5 => R(1),
      O => \OADD[3]_i_2_n_0\
    );
\OADD[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[5]_i_2_n_0\,
      I2 => \OADD[4]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(4),
      O => \OADD[4]_i_1_n_0\
    );
\OADD[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000020200000300"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[1]\,
      I1 => R(3),
      I2 => R(4),
      I3 => \addPostAddMantissa_reg_n_0_[3]\,
      I4 => R(2),
      I5 => R(1),
      O => \OADD[4]_i_2_n_0\
    );
\OADD[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[6]_i_2_n_0\,
      I2 => \OADD[5]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(5),
      O => \OADD[5]_i_1_n_0\
    );
\OADD[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"30BB000030880000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[2]\,
      I1 => R(1),
      I2 => \addPostAddMantissa_reg_n_0_[0]\,
      I3 => R(2),
      I4 => \OADD[0]_i_2_n_0\,
      I5 => \addPostAddMantissa_reg_n_0_[4]\,
      O => \OADD[5]_i_2_n_0\
    );
\OADD[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CCCCF0AA"
    )
        port map (
      I0 => \OADD[7]_i_2_n_0\,
      I1 => OADD_Temp(6),
      I2 => \OADD[6]_i_2_n_0\,
      I3 => R(0),
      I4 => addEarlyOutBypassEnable2_reg_n_0,
      O => \OADD[6]_i_1_n_0\
    );
\OADD[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"30BB000030880000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[3]\,
      I1 => R(1),
      I2 => \addPostAddMantissa_reg_n_0_[1]\,
      I3 => R(2),
      I4 => \OADD[0]_i_2_n_0\,
      I5 => \addPostAddMantissa_reg_n_0_[5]\,
      O => \OADD[6]_i_2_n_0\
    );
\OADD[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[8]_i_2_n_0\,
      I2 => \OADD[7]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(7),
      O => \OADD[7]_i_1_n_0\
    );
\OADD[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B080FFFFB0800000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[0]\,
      I1 => R(2),
      I2 => \OADD[0]_i_2_n_0\,
      I3 => \addPostAddMantissa_reg_n_0_[4]\,
      I4 => R(1),
      I5 => \OADD[7]_i_3_n_0\,
      O => \OADD[7]_i_2_n_0\
    );
\OADD[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000B0008"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[2]\,
      I1 => R(2),
      I2 => R(3),
      I3 => R(4),
      I4 => \addPostAddMantissa_reg_n_0_[6]\,
      O => \OADD[7]_i_3_n_0\
    );
\OADD[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[9]_i_2_n_0\,
      I2 => \OADD[8]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(8),
      O => \OADD[8]_i_1_n_0\
    );
\OADD[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B080FFFFB0800000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[1]\,
      I1 => R(2),
      I2 => \OADD[0]_i_2_n_0\,
      I3 => \addPostAddMantissa_reg_n_0_[5]\,
      I4 => R(1),
      I5 => \OADD[8]_i_3_n_0\,
      O => \OADD[8]_i_2_n_0\
    );
\OADD[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000B0008"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[3]\,
      I1 => R(2),
      I2 => R(3),
      I3 => R(4),
      I4 => \addPostAddMantissa_reg_n_0_[7]\,
      O => \OADD[8]_i_3_n_0\
    );
\OADD[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => R(0),
      I1 => \OADD[10]_i_2_n_0\,
      I2 => \OADD[9]_i_2_n_0\,
      I3 => addEarlyOutBypassEnable2_reg_n_0,
      I4 => OADD_Temp(9),
      O => \OADD[9]_i_1_n_0\
    );
\OADD[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B080FFFFB0800000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[2]\,
      I1 => R(2),
      I2 => \OADD[0]_i_2_n_0\,
      I3 => \addPostAddMantissa_reg_n_0_[6]\,
      I4 => R(1),
      I5 => \OADD[11]_i_3_n_0\,
      O => \OADD[9]_i_2_n_0\
    );
\OADD_Temp[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \OADD_Temp[22]_i_2_n_0\,
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      O => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp[22]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FD00"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[4]_i_3_n_0\,
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      I2 => addSameNumberDifferentSigns1_reg_n_0,
      I3 => addPipelineValidStage1,
      O => \OADD_Temp[22]_i_2_n_0\
    );
\OADD_Temp[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => addSameNumberDifferentSigns1_reg_n_0,
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      I2 => addEarlyOutBypass1(23),
      O => \OADD_Temp[23]_i_1_n_0\
    );
\OADD_Temp[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => addSameNumberDifferentSigns1_reg_n_0,
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      I2 => addEarlyOutBypass1(24),
      O => \OADD_Temp[24]_i_1_n_0\
    );
\OADD_Temp[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => addSameNumberDifferentSigns1_reg_n_0,
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      I2 => addEarlyOutBypass1(25),
      O => \OADD_Temp[25]_i_1_n_0\
    );
\OADD_Temp[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => addSameNumberDifferentSigns1_reg_n_0,
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      I2 => addEarlyOutBypass1(26),
      O => \OADD_Temp[26]_i_1_n_0\
    );
\OADD_Temp[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => addSameNumberDifferentSigns1_reg_n_0,
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      I2 => addEarlyOutBypass1(27),
      O => \OADD_Temp[27]_i_1_n_0\
    );
\OADD_Temp[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => addSameNumberDifferentSigns1_reg_n_0,
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      I2 => addEarlyOutBypass1(28),
      O => \OADD_Temp[28]_i_1_n_0\
    );
\OADD_Temp[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => addSameNumberDifferentSigns1_reg_n_0,
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      I2 => addEarlyOutBypass1(29),
      O => \OADD_Temp[29]_i_1_n_0\
    );
\OADD_Temp[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"D1"
    )
        port map (
      I0 => addSameNumberDifferentSigns1_reg_n_0,
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      I2 => addEarlyOutBypass1(30),
      O => \OADD_Temp[30]_i_1_n_0\
    );
\OADD_Temp[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B88FFFF8B880000"
    )
        port map (
      I0 => addEarlyOutBypass1(31),
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      I2 => addSameNumberDifferentSigns1_reg_n_0,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      I4 => \OADD_Temp[22]_i_2_n_0\,
      I5 => OADD_Temp(31),
      O => \OADD_Temp[31]_i_1_n_0\
    );
\OADD_Temp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(0),
      Q => OADD_Temp(0),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(10),
      Q => OADD_Temp(10),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(11),
      Q => OADD_Temp(11),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(12),
      Q => OADD_Temp(12),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(13),
      Q => OADD_Temp(13),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(14),
      Q => OADD_Temp(14),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(15),
      Q => OADD_Temp(15),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(16),
      Q => OADD_Temp(16),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(17),
      Q => OADD_Temp(17),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(18),
      Q => OADD_Temp(18),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(19),
      Q => OADD_Temp(19),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(1),
      Q => OADD_Temp(1),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(20),
      Q => OADD_Temp(20),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(21),
      Q => OADD_Temp(21),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(22),
      Q => OADD_Temp(22),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[23]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => \OADD_Temp[23]_i_1_n_0\,
      Q => OADD_Temp(23),
      S => '0'
    );
\OADD_Temp_reg[24]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => \OADD_Temp[24]_i_1_n_0\,
      Q => OADD_Temp(24),
      S => '0'
    );
\OADD_Temp_reg[25]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => \OADD_Temp[25]_i_1_n_0\,
      Q => OADD_Temp(25),
      S => '0'
    );
\OADD_Temp_reg[26]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => \OADD_Temp[26]_i_1_n_0\,
      Q => OADD_Temp(26),
      S => '0'
    );
\OADD_Temp_reg[27]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => \OADD_Temp[27]_i_1_n_0\,
      Q => OADD_Temp(27),
      S => '0'
    );
\OADD_Temp_reg[28]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => \OADD_Temp[28]_i_1_n_0\,
      Q => OADD_Temp(28),
      S => '0'
    );
\OADD_Temp_reg[29]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => \OADD_Temp[29]_i_1_n_0\,
      Q => OADD_Temp(29),
      S => '0'
    );
\OADD_Temp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(2),
      Q => OADD_Temp(2),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[30]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => \OADD_Temp[30]_i_1_n_0\,
      Q => OADD_Temp(30),
      S => '0'
    );
\OADD_Temp_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \OADD_Temp[31]_i_1_n_0\,
      Q => OADD_Temp(31),
      R => '0'
    );
\OADD_Temp_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(3),
      Q => OADD_Temp(3),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(4),
      Q => OADD_Temp(4),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(5),
      Q => OADD_Temp(5),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(6),
      Q => OADD_Temp(6),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(7),
      Q => OADD_Temp(7),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(8),
      Q => OADD_Temp(8),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_Temp_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OADD_Temp[22]_i_2_n_0\,
      D => addEarlyOutBypass1(9),
      Q => OADD_Temp(9),
      R => \OADD_Temp[22]_i_1_n_0\
    );
\OADD_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[0]_i_1_n_0\,
      Q => OADD(0),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[10]_i_1_n_0\,
      Q => OADD(10),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[11]_i_1_n_0\,
      Q => OADD(11),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[12]_i_1_n_0\,
      Q => OADD(12),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[13]_i_1_n_0\,
      Q => OADD(13),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[14]_i_1_n_0\,
      Q => OADD(14),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[15]_i_1_n_0\,
      Q => OADD(15),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[16]_i_1_n_0\,
      Q => OADD(16),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[17]_i_1_n_0\,
      Q => OADD(17),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[18]_i_1_n_0\,
      Q => OADD(18),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[19]_i_1_n_0\,
      Q => OADD(19),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[1]_i_1_n_0\,
      Q => OADD(1),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[20]_i_1_n_0\,
      Q => OADD(20),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[21]_i_1_n_0\,
      Q => OADD(21),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[22]_i_1_n_0\,
      Q => OADD(22),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[23]_i_1_n_0\,
      Q => OADD(23),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[24]_i_1_n_0\,
      Q => OADD(24),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[25]_i_1_n_0\,
      Q => OADD(25),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[26]_i_1_n_0\,
      Q => OADD(26),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[27]_i_1_n_0\,
      Q => OADD(27),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[28]_i_1_n_0\,
      Q => OADD(28),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[29]_i_1_n_0\,
      Q => OADD(29),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[2]_i_1_n_0\,
      Q => OADD(2),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[30]_i_1_n_0\,
      Q => OADD(30),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[31]_i_2_n_0\,
      Q => OADD(31),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[3]_i_1_n_0\,
      Q => OADD(3),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[4]_i_1_n_0\,
      Q => OADD(4),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[5]_i_1_n_0\,
      Q => OADD(5),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[6]_i_1_n_0\,
      Q => OADD(6),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[7]_i_1_n_0\,
      Q => OADD(7),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[8]_i_1_n_0\,
      Q => OADD(8),
      R => \OADD[31]_i_1_n_0\
    );
\OADD_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPipelineValidStage2,
      D => \OADD[9]_i_1_n_0\,
      Q => OADD(9),
      R => \OADD[31]_i_1_n_0\
    );
addALessThanB_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => comALessThanB,
      Q => addALessThanB,
      R => '0'
    );
\addDenormFlushedValA[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \comAIsDenormal__6\,
      I1 => IADD_GO,
      O => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA[30]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => IN_A(27),
      I1 => IN_A(30),
      I2 => IN_A(28),
      I3 => IN_A(29),
      I4 => \addDenormFlushedValA[30]_i_3_n_0\,
      O => \comAIsDenormal__6\
    );
\addDenormFlushedValA[30]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => IN_A(24),
      I1 => IN_A(23),
      I2 => IN_A(26),
      I3 => IN_A(25),
      O => \addDenormFlushedValA[30]_i_3_n_0\
    );
\addDenormFlushedValA_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(0),
      Q => \addDenormFlushedValA_reg_n_0_[0]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(10),
      Q => \addDenormFlushedValA_reg_n_0_[10]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(11),
      Q => \addDenormFlushedValA_reg_n_0_[11]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(12),
      Q => \addDenormFlushedValA_reg_n_0_[12]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(13),
      Q => \addDenormFlushedValA_reg_n_0_[13]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(14),
      Q => \addDenormFlushedValA_reg_n_0_[14]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(15),
      Q => \addDenormFlushedValA_reg_n_0_[15]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(16),
      Q => \addDenormFlushedValA_reg_n_0_[16]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(17),
      Q => \addDenormFlushedValA_reg_n_0_[17]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(18),
      Q => \addDenormFlushedValA_reg_n_0_[18]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(19),
      Q => \addDenormFlushedValA_reg_n_0_[19]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(1),
      Q => \addDenormFlushedValA_reg_n_0_[1]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(20),
      Q => \addDenormFlushedValA_reg_n_0_[20]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(21),
      Q => \addDenormFlushedValA_reg_n_0_[21]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(22),
      Q => \addDenormFlushedValA_reg_n_0_[22]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(23),
      Q => \addDenormFlushedValA_reg_n_0_[23]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(24),
      Q => \addDenormFlushedValA_reg_n_0_[24]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(25),
      Q => \addDenormFlushedValA_reg_n_0_[25]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(26),
      Q => \addDenormFlushedValA_reg_n_0_[26]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(27),
      Q => \addDenormFlushedValA_reg_n_0_[27]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(28),
      Q => \addDenormFlushedValA_reg_n_0_[28]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(29),
      Q => \addDenormFlushedValA_reg_n_0_[29]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(2),
      Q => \addDenormFlushedValA_reg_n_0_[2]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(30),
      Q => \addDenormFlushedValA_reg_n_0_[30]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(31),
      Q => p_1_in,
      R => '0'
    );
\addDenormFlushedValA_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(3),
      Q => \addDenormFlushedValA_reg_n_0_[3]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(4),
      Q => \addDenormFlushedValA_reg_n_0_[4]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(5),
      Q => \addDenormFlushedValA_reg_n_0_[5]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(6),
      Q => \addDenormFlushedValA_reg_n_0_[6]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(7),
      Q => \addDenormFlushedValA_reg_n_0_[7]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(8),
      Q => \addDenormFlushedValA_reg_n_0_[8]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValA_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_A(9),
      Q => \addDenormFlushedValA_reg_n_0_[9]\,
      R => \addDenormFlushedValA[30]_i_1_n_0\
    );
\addDenormFlushedValB[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(0),
      I1 => \comBIsDenormal__6\,
      O => data3(0)
    );
\addDenormFlushedValB[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(10),
      I1 => \comBIsDenormal__6\,
      O => data3(10)
    );
\addDenormFlushedValB[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(11),
      I1 => \comBIsDenormal__6\,
      O => data3(11)
    );
\addDenormFlushedValB[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(12),
      I1 => \comBIsDenormal__6\,
      O => data3(12)
    );
\addDenormFlushedValB[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(13),
      I1 => \comBIsDenormal__6\,
      O => data3(13)
    );
\addDenormFlushedValB[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(14),
      I1 => \comBIsDenormal__6\,
      O => data3(14)
    );
\addDenormFlushedValB[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(15),
      I1 => \comBIsDenormal__6\,
      O => data3(15)
    );
\addDenormFlushedValB[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(16),
      I1 => \comBIsDenormal__6\,
      O => data3(16)
    );
\addDenormFlushedValB[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(17),
      I1 => \comBIsDenormal__6\,
      O => data3(17)
    );
\addDenormFlushedValB[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(18),
      I1 => \comBIsDenormal__6\,
      O => data3(18)
    );
\addDenormFlushedValB[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(19),
      I1 => \comBIsDenormal__6\,
      O => data3(19)
    );
\addDenormFlushedValB[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(1),
      I1 => \comBIsDenormal__6\,
      O => data3(1)
    );
\addDenormFlushedValB[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(20),
      I1 => \comBIsDenormal__6\,
      O => data3(20)
    );
\addDenormFlushedValB[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(21),
      I1 => \comBIsDenormal__6\,
      O => data3(21)
    );
\addDenormFlushedValB[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(22),
      I1 => \comBIsDenormal__6\,
      O => data3(22)
    );
\addDenormFlushedValB[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(23),
      I1 => \comBIsDenormal__6\,
      O => data3(23)
    );
\addDenormFlushedValB[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(24),
      I1 => \comBIsDenormal__6\,
      O => data3(24)
    );
\addDenormFlushedValB[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(25),
      I1 => \comBIsDenormal__6\,
      O => data3(25)
    );
\addDenormFlushedValB[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(26),
      I1 => \comBIsDenormal__6\,
      O => data3(26)
    );
\addDenormFlushedValB[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(27),
      I1 => \comBIsDenormal__6\,
      O => data3(27)
    );
\addDenormFlushedValB[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(28),
      I1 => \comBIsDenormal__6\,
      O => data3(28)
    );
\addDenormFlushedValB[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(29),
      I1 => \comBIsDenormal__6\,
      O => data3(29)
    );
\addDenormFlushedValB[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(2),
      I1 => \comBIsDenormal__6\,
      O => data3(2)
    );
\addDenormFlushedValB[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(30),
      I1 => \comBIsDenormal__6\,
      O => data3(30)
    );
\addDenormFlushedValB[30]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => IN_B(27),
      I1 => IN_B(28),
      I2 => IN_B(29),
      I3 => IN_B(30),
      I4 => \addDenormFlushedValB[30]_i_3_n_0\,
      O => \comBIsDenormal__6\
    );
\addDenormFlushedValB[30]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => IN_B(24),
      I1 => IN_B(23),
      I2 => IN_B(26),
      I3 => IN_B(25),
      O => \addDenormFlushedValB[30]_i_3_n_0\
    );
\addDenormFlushedValB[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(3),
      I1 => \comBIsDenormal__6\,
      O => data3(3)
    );
\addDenormFlushedValB[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(4),
      I1 => \comBIsDenormal__6\,
      O => data3(4)
    );
\addDenormFlushedValB[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(5),
      I1 => \comBIsDenormal__6\,
      O => data3(5)
    );
\addDenormFlushedValB[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(6),
      I1 => \comBIsDenormal__6\,
      O => data3(6)
    );
\addDenormFlushedValB[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(7),
      I1 => \comBIsDenormal__6\,
      O => data3(7)
    );
\addDenormFlushedValB[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(8),
      I1 => \comBIsDenormal__6\,
      O => data3(8)
    );
\addDenormFlushedValB[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(9),
      I1 => \comBIsDenormal__6\,
      O => data3(9)
    );
\addDenormFlushedValB_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(0),
      Q => \addDenormFlushedValB_reg_n_0_[0]\,
      R => '0'
    );
\addDenormFlushedValB_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(10),
      Q => \addDenormFlushedValB_reg_n_0_[10]\,
      R => '0'
    );
\addDenormFlushedValB_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(11),
      Q => \addDenormFlushedValB_reg_n_0_[11]\,
      R => '0'
    );
\addDenormFlushedValB_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(12),
      Q => \addDenormFlushedValB_reg_n_0_[12]\,
      R => '0'
    );
\addDenormFlushedValB_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(13),
      Q => \addDenormFlushedValB_reg_n_0_[13]\,
      R => '0'
    );
\addDenormFlushedValB_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(14),
      Q => \addDenormFlushedValB_reg_n_0_[14]\,
      R => '0'
    );
\addDenormFlushedValB_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(15),
      Q => \addDenormFlushedValB_reg_n_0_[15]\,
      R => '0'
    );
\addDenormFlushedValB_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(16),
      Q => \addDenormFlushedValB_reg_n_0_[16]\,
      R => '0'
    );
\addDenormFlushedValB_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(17),
      Q => \addDenormFlushedValB_reg_n_0_[17]\,
      R => '0'
    );
\addDenormFlushedValB_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(18),
      Q => \addDenormFlushedValB_reg_n_0_[18]\,
      R => '0'
    );
\addDenormFlushedValB_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(19),
      Q => \addDenormFlushedValB_reg_n_0_[19]\,
      R => '0'
    );
\addDenormFlushedValB_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(1),
      Q => \addDenormFlushedValB_reg_n_0_[1]\,
      R => '0'
    );
\addDenormFlushedValB_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(20),
      Q => \addDenormFlushedValB_reg_n_0_[20]\,
      R => '0'
    );
\addDenormFlushedValB_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(21),
      Q => \addDenormFlushedValB_reg_n_0_[21]\,
      R => '0'
    );
\addDenormFlushedValB_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(22),
      Q => \addDenormFlushedValB_reg_n_0_[22]\,
      R => '0'
    );
\addDenormFlushedValB_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(23),
      Q => \addDenormFlushedValB_reg_n_0_[23]\,
      R => '0'
    );
\addDenormFlushedValB_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(24),
      Q => \addDenormFlushedValB_reg_n_0_[24]\,
      R => '0'
    );
\addDenormFlushedValB_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(25),
      Q => \addDenormFlushedValB_reg_n_0_[25]\,
      R => '0'
    );
\addDenormFlushedValB_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(26),
      Q => \addDenormFlushedValB_reg_n_0_[26]\,
      R => '0'
    );
\addDenormFlushedValB_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(27),
      Q => \addDenormFlushedValB_reg_n_0_[27]\,
      R => '0'
    );
\addDenormFlushedValB_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(28),
      Q => \addDenormFlushedValB_reg_n_0_[28]\,
      R => '0'
    );
\addDenormFlushedValB_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(29),
      Q => \addDenormFlushedValB_reg_n_0_[29]\,
      R => '0'
    );
\addDenormFlushedValB_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(2),
      Q => \addDenormFlushedValB_reg_n_0_[2]\,
      R => '0'
    );
\addDenormFlushedValB_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(30),
      Q => \addDenormFlushedValB_reg_n_0_[30]\,
      R => '0'
    );
\addDenormFlushedValB_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => IN_B(31),
      Q => p_0_in,
      R => '0'
    );
\addDenormFlushedValB_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(3),
      Q => \addDenormFlushedValB_reg_n_0_[3]\,
      R => '0'
    );
\addDenormFlushedValB_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(4),
      Q => \addDenormFlushedValB_reg_n_0_[4]\,
      R => '0'
    );
\addDenormFlushedValB_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(5),
      Q => \addDenormFlushedValB_reg_n_0_[5]\,
      R => '0'
    );
\addDenormFlushedValB_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(6),
      Q => \addDenormFlushedValB_reg_n_0_[6]\,
      R => '0'
    );
\addDenormFlushedValB_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(7),
      Q => \addDenormFlushedValB_reg_n_0_[7]\,
      R => '0'
    );
\addDenormFlushedValB_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(8),
      Q => \addDenormFlushedValB_reg_n_0_[8]\,
      R => '0'
    );
\addDenormFlushedValB_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => data3(9),
      Q => \addDenormFlushedValB_reg_n_0_[9]\,
      R => '0'
    );
\addEarlyOutBypass0[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(0),
      I3 => IN_A(0),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[0]_i_1_n_0\
    );
\addEarlyOutBypass0[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(10),
      I3 => IN_A(10),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[10]_i_1_n_0\
    );
\addEarlyOutBypass0[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(11),
      I3 => IN_A(11),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[11]_i_1_n_0\
    );
\addEarlyOutBypass0[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(12),
      I3 => IN_A(12),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[12]_i_1_n_0\
    );
\addEarlyOutBypass0[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(13),
      I3 => IN_A(13),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[13]_i_1_n_0\
    );
\addEarlyOutBypass0[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(14),
      I3 => IN_A(14),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[14]_i_1_n_0\
    );
\addEarlyOutBypass0[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(15),
      I3 => IN_A(15),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[15]_i_1_n_0\
    );
\addEarlyOutBypass0[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(16),
      I3 => IN_A(16),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[16]_i_1_n_0\
    );
\addEarlyOutBypass0[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(17),
      I3 => IN_A(17),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[17]_i_1_n_0\
    );
\addEarlyOutBypass0[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(18),
      I3 => IN_A(18),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[18]_i_1_n_0\
    );
\addEarlyOutBypass0[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(19),
      I3 => IN_A(19),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[19]_i_1_n_0\
    );
\addEarlyOutBypass0[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(1),
      I3 => IN_A(1),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[1]_i_1_n_0\
    );
\addEarlyOutBypass0[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(20),
      I3 => IN_A(20),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[20]_i_1_n_0\
    );
\addEarlyOutBypass0[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(21),
      I3 => IN_A(21),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[21]_i_1_n_0\
    );
\addEarlyOutBypass0[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(22),
      I3 => IN_A(22),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[22]_i_1_n_0\
    );
\addEarlyOutBypass0[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(23),
      I3 => IN_A(23),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[23]_i_1_n_0\
    );
\addEarlyOutBypass0[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(24),
      I3 => IN_A(24),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[24]_i_1_n_0\
    );
\addEarlyOutBypass0[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(25),
      I3 => IN_A(25),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[25]_i_1_n_0\
    );
\addEarlyOutBypass0[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(26),
      I3 => IN_A(26),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[26]_i_1_n_0\
    );
\addEarlyOutBypass0[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(27),
      I3 => IN_A(27),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[27]_i_1_n_0\
    );
\addEarlyOutBypass0[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(28),
      I3 => IN_A(28),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[28]_i_1_n_0\
    );
\addEarlyOutBypass0[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(29),
      I3 => IN_A(29),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[29]_i_1_n_0\
    );
\addEarlyOutBypass0[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(2),
      I3 => IN_A(2),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[2]_i_1_n_0\
    );
\addEarlyOutBypass0[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(30),
      I3 => IN_A(30),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[30]_i_1_n_0\
    );
\addEarlyOutBypass0[30]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000060"
    )
        port map (
      I0 => IN_B(31),
      I1 => IN_A(31),
      I2 => \addEarlyOutBypassEnable0120_out__0\,
      I3 => \addEarlyOutBypassEnable0123_out__0\,
      I4 => addEarlyOutBypassEnable013_out,
      I5 => \addEarlyOutBypassEnable01__2\,
      O => \addEarlyOutBypass0[30]_i_2_n_0\
    );
\addEarlyOutBypass0[30]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF040404"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_3_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_5_n_0\,
      I2 => addEarlyOutBypassEnable013_out,
      I3 => \GetFloatIsReal__5\,
      I4 => \addEarlyOutBypass0[31]_i_5_n_0\,
      O => \addEarlyOutBypass0[30]_i_3_n_0\
    );
\addEarlyOutBypass0[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00003332FFFFFFFE"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_6_n_0\,
      I1 => addEarlyOutBypassEnable013_out,
      I2 => \addEarlyOutBypassEnable0120_out__0\,
      I3 => \addEarlyOutBypassEnable0123_out__0\,
      I4 => \addEarlyOutBypassEnable01__2\,
      I5 => \GetFloatIsReal__5\,
      O => \addEarlyOutBypass0[30]_i_4_n_0\
    );
\addEarlyOutBypass0[30]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000D700"
    )
        port map (
      I0 => addSameNumberDifferentSigns00,
      I1 => IN_A(31),
      I2 => IN_B(31),
      I3 => comALessThanB,
      I4 => \comBIsDenormal__6\,
      O => \addEarlyOutBypass0[30]_i_5_n_0\
    );
\addEarlyOutBypass0[30]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00005115"
    )
        port map (
      I0 => comALessThanB,
      I1 => addSameNumberDifferentSigns00,
      I2 => IN_A(31),
      I3 => IN_B(31),
      I4 => \comAIsDenormal__6\,
      O => \addEarlyOutBypass0[30]_i_6_n_0\
    );
\addEarlyOutBypass0[31]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFD0000FAF80000"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_3_n_0\,
      I1 => \addEarlyOutBypassEnable0120_out__0\,
      I2 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I3 => \addEarlyOutBypassEnable0123_out__0\,
      I4 => IADD_GO,
      I5 => \addEarlyOutBypass0[31]_i_7_n_0\,
      O => \addEarlyOutBypass0[31]_i_1_n_0\
    );
\addEarlyOutBypass0[31]_i_10\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => IN_A(28),
      I1 => IN_A(29),
      I2 => IN_A(27),
      I3 => IN_A(30),
      I4 => \addExponentDeltaBMinusA[5]_i_2_n_0\,
      O => \GetFloatIsReal__5\
    );
\addEarlyOutBypass0[31]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_18_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_19_n_0\,
      I2 => IN_B(20),
      I3 => IN_B(22),
      I4 => IN_B(17),
      I5 => \addEarlyOutBypass0[31]_i_20_n_0\,
      O => GetFloatIsINF013_in
    );
\addEarlyOutBypass0[31]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => IN_B(30),
      I1 => IN_B(27),
      I2 => IN_B(29),
      I3 => IN_B(28),
      O => \addEarlyOutBypass0[31]_i_12_n_0\
    );
\addEarlyOutBypass0[31]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000008"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_21_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_22_n_0\,
      I2 => IN_A(20),
      I3 => IN_A(22),
      I4 => IN_A(17),
      I5 => \addEarlyOutBypass0[31]_i_23_n_0\,
      O => GetFloatIsINF015_in
    );
\addEarlyOutBypass0[31]_i_14\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => \addExponentDeltaBMinusA[5]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => IN_A(27),
      I3 => IN_A(29),
      I4 => IN_A(28),
      O => \addEarlyOutBypass0[31]_i_14_n_0\
    );
\addEarlyOutBypass0[31]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000800000000000"
    )
        port map (
      I0 => IN_B(28),
      I1 => IN_B(29),
      I2 => IN_B(27),
      I3 => IN_B(30),
      I4 => \addExponentDeltaAMinusB[5]_i_2_n_0\,
      I5 => \addEarlyOutBypass0[31]_i_14_n_0\,
      O => \addEarlyOutBypass0[31]_i_15_n_0\
    );
\addEarlyOutBypass0[31]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"888F888088808880"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_14_n_0\,
      I1 => GetFloatIsINF015_in,
      I2 => \addExponentDeltaAMinusB[5]_i_2_n_0\,
      I3 => \addEarlyOutBypass0[31]_i_12_n_0\,
      I4 => GetFloatIsINF013_in,
      I5 => \GetFloatIsReal__5\,
      O => addEarlyOutBypassEnable013_out
    );
\addEarlyOutBypass0[31]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"22202220222F2220"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_14_n_0\,
      I1 => GetFloatIsINF015_in,
      I2 => \addExponentDeltaAMinusB[5]_i_2_n_0\,
      I3 => \addEarlyOutBypass0[31]_i_12_n_0\,
      I4 => \GetFloatIsReal__5\,
      I5 => GetFloatIsINF013_in,
      O => \addEarlyOutBypassEnable01__2\
    );
\addEarlyOutBypass0[31]_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => IN_B(12),
      I1 => IN_B(13),
      I2 => IN_B(14),
      I3 => IN_B(15),
      I4 => \addEarlyOutBypass0[31]_i_24_n_0\,
      O => \addEarlyOutBypass0[31]_i_18_n_0\
    );
\addEarlyOutBypass0[31]_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => IN_B(2),
      I1 => IN_B(3),
      I2 => IN_B(0),
      I3 => IN_B(1),
      I4 => \addEarlyOutBypass0[31]_i_25_n_0\,
      O => \addEarlyOutBypass0[31]_i_19_n_0\
    );
\addEarlyOutBypass0[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFEFCFCFCFCFC"
    )
        port map (
      I0 => IN_B(31),
      I1 => \addEarlyOutBypass0[31]_i_8_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_9_n_0\,
      I3 => \GetFloatIsReal__5\,
      I4 => IN_A(31),
      I5 => \addEarlyOutBypass0[31]_i_5_n_0\,
      O => \addEarlyOutBypass0[31]_i_2_n_0\
    );
\addEarlyOutBypass0[31]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_B(19),
      I1 => IN_B(16),
      I2 => IN_B(21),
      I3 => IN_B(18),
      O => \addEarlyOutBypass0[31]_i_20_n_0\
    );
\addEarlyOutBypass0[31]_i_21\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => IN_A(12),
      I1 => IN_A(13),
      I2 => IN_A(14),
      I3 => IN_A(15),
      I4 => \addEarlyOutBypass0[31]_i_26_n_0\,
      O => \addEarlyOutBypass0[31]_i_21_n_0\
    );
\addEarlyOutBypass0[31]_i_22\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010000"
    )
        port map (
      I0 => IN_A(2),
      I1 => IN_A(3),
      I2 => IN_A(0),
      I3 => IN_A(1),
      I4 => \addEarlyOutBypass0[31]_i_27_n_0\,
      O => \addEarlyOutBypass0[31]_i_22_n_0\
    );
\addEarlyOutBypass0[31]_i_23\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(19),
      I1 => IN_A(16),
      I2 => IN_A(21),
      I3 => IN_A(18),
      O => \addEarlyOutBypass0[31]_i_23_n_0\
    );
\addEarlyOutBypass0[31]_i_24\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => IN_B(11),
      I1 => IN_B(10),
      I2 => IN_B(9),
      I3 => IN_B(8),
      O => \addEarlyOutBypass0[31]_i_24_n_0\
    );
\addEarlyOutBypass0[31]_i_25\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => IN_B(7),
      I1 => IN_B(6),
      I2 => IN_B(5),
      I3 => IN_B(4),
      O => \addEarlyOutBypass0[31]_i_25_n_0\
    );
\addEarlyOutBypass0[31]_i_26\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => IN_A(11),
      I1 => IN_A(10),
      I2 => IN_A(9),
      I3 => IN_A(8),
      O => \addEarlyOutBypass0[31]_i_26_n_0\
    );
\addEarlyOutBypass0[31]_i_27\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => IN_A(7),
      I1 => IN_A(6),
      I2 => IN_A(5),
      I3 => IN_A(4),
      O => \addEarlyOutBypass0[31]_i_27_n_0\
    );
\addEarlyOutBypass0[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000EFFF500040004"
    )
        port map (
      I0 => GetFloatIsINF013_in,
      I1 => \GetFloatIsReal__5\,
      I2 => \addEarlyOutBypass0[31]_i_12_n_0\,
      I3 => \addExponentDeltaAMinusB[5]_i_2_n_0\,
      I4 => GetFloatIsINF015_in,
      I5 => \addEarlyOutBypass0[31]_i_14_n_0\,
      O => \addEarlyOutBypass0[31]_i_3_n_0\
    );
\addEarlyOutBypass0[31]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_15_n_0\,
      I1 => GetFloatIsINF013_in,
      I2 => GetFloatIsINF015_in,
      O => \addEarlyOutBypassEnable0120_out__0\
    );
\addEarlyOutBypass0[31]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE02"
    )
        port map (
      I0 => \GetFloatIsReal__5\,
      I1 => \addEarlyOutBypass0[31]_i_12_n_0\,
      I2 => \addExponentDeltaAMinusB[5]_i_2_n_0\,
      I3 => \addEarlyOutBypass0[31]_i_14_n_0\,
      O => \addEarlyOutBypass0[31]_i_5_n_0\
    );
\addEarlyOutBypass0[31]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_15_n_0\,
      I1 => GetFloatIsINF013_in,
      I2 => GetFloatIsINF015_in,
      O => \addEarlyOutBypassEnable0123_out__0\
    );
\addEarlyOutBypass0[31]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E2FFFFE2E2E2E2E2"
    )
        port map (
      I0 => \comBIsDenormal__6\,
      I1 => comALessThanB,
      I2 => \comAIsDenormal__6\,
      I3 => IN_B(31),
      I4 => IN_A(31),
      I5 => addSameNumberDifferentSigns00,
      O => \addEarlyOutBypass0[31]_i_7_n_0\
    );
\addEarlyOutBypass0[31]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0054000000500000"
    )
        port map (
      I0 => addEarlyOutBypassEnable013_out,
      I1 => \addEarlyOutBypassEnable0120_out__0\,
      I2 => \addEarlyOutBypassEnable0123_out__0\,
      I3 => \addEarlyOutBypassEnable01__2\,
      I4 => IN_A(31),
      I5 => IN_B(31),
      O => \addEarlyOutBypass0[31]_i_8_n_0\
    );
\addEarlyOutBypass0[31]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000050005140"
    )
        port map (
      I0 => addEarlyOutBypassEnable013_out,
      I1 => comALessThanB,
      I2 => IN_B(31),
      I3 => IN_A(31),
      I4 => addSameNumberDifferentSigns00,
      I5 => \addEarlyOutBypass0[31]_i_3_n_0\,
      O => \addEarlyOutBypass0[31]_i_9_n_0\
    );
\addEarlyOutBypass0[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(3),
      I3 => IN_A(3),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[3]_i_1_n_0\
    );
\addEarlyOutBypass0[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(4),
      I3 => IN_A(4),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[4]_i_1_n_0\
    );
\addEarlyOutBypass0[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(5),
      I3 => IN_A(5),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[5]_i_1_n_0\
    );
\addEarlyOutBypass0[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(6),
      I3 => IN_A(6),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[6]_i_1_n_0\
    );
\addEarlyOutBypass0[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(7),
      I3 => IN_A(7),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[7]_i_1_n_0\
    );
\addEarlyOutBypass0[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(8),
      I3 => IN_A(8),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[8]_i_1_n_0\
    );
\addEarlyOutBypass0[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I2 => IN_B(9),
      I3 => IN_A(9),
      I4 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[9]_i_1_n_0\
    );
\addEarlyOutBypass0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[0]_i_1_n_0\,
      Q => addEarlyOutBypass0(0),
      R => '0'
    );
\addEarlyOutBypass0_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[10]_i_1_n_0\,
      Q => addEarlyOutBypass0(10),
      R => '0'
    );
\addEarlyOutBypass0_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[11]_i_1_n_0\,
      Q => addEarlyOutBypass0(11),
      R => '0'
    );
\addEarlyOutBypass0_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[12]_i_1_n_0\,
      Q => addEarlyOutBypass0(12),
      R => '0'
    );
\addEarlyOutBypass0_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[13]_i_1_n_0\,
      Q => addEarlyOutBypass0(13),
      R => '0'
    );
\addEarlyOutBypass0_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[14]_i_1_n_0\,
      Q => addEarlyOutBypass0(14),
      R => '0'
    );
\addEarlyOutBypass0_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[15]_i_1_n_0\,
      Q => addEarlyOutBypass0(15),
      R => '0'
    );
\addEarlyOutBypass0_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[16]_i_1_n_0\,
      Q => addEarlyOutBypass0(16),
      R => '0'
    );
\addEarlyOutBypass0_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[17]_i_1_n_0\,
      Q => addEarlyOutBypass0(17),
      R => '0'
    );
\addEarlyOutBypass0_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[18]_i_1_n_0\,
      Q => addEarlyOutBypass0(18),
      R => '0'
    );
\addEarlyOutBypass0_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[19]_i_1_n_0\,
      Q => addEarlyOutBypass0(19),
      R => '0'
    );
\addEarlyOutBypass0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[1]_i_1_n_0\,
      Q => addEarlyOutBypass0(1),
      R => '0'
    );
\addEarlyOutBypass0_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[20]_i_1_n_0\,
      Q => addEarlyOutBypass0(20),
      R => '0'
    );
\addEarlyOutBypass0_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[21]_i_1_n_0\,
      Q => addEarlyOutBypass0(21),
      R => '0'
    );
\addEarlyOutBypass0_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[22]_i_1_n_0\,
      Q => addEarlyOutBypass0(22),
      R => '0'
    );
\addEarlyOutBypass0_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[23]_i_1_n_0\,
      Q => addEarlyOutBypass0(23),
      R => '0'
    );
\addEarlyOutBypass0_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[24]_i_1_n_0\,
      Q => addEarlyOutBypass0(24),
      R => '0'
    );
\addEarlyOutBypass0_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[25]_i_1_n_0\,
      Q => addEarlyOutBypass0(25),
      R => '0'
    );
\addEarlyOutBypass0_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[26]_i_1_n_0\,
      Q => addEarlyOutBypass0(26),
      R => '0'
    );
\addEarlyOutBypass0_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[27]_i_1_n_0\,
      Q => addEarlyOutBypass0(27),
      R => '0'
    );
\addEarlyOutBypass0_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[28]_i_1_n_0\,
      Q => addEarlyOutBypass0(28),
      R => '0'
    );
\addEarlyOutBypass0_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[29]_i_1_n_0\,
      Q => addEarlyOutBypass0(29),
      R => '0'
    );
\addEarlyOutBypass0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[2]_i_1_n_0\,
      Q => addEarlyOutBypass0(2),
      R => '0'
    );
\addEarlyOutBypass0_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[30]_i_1_n_0\,
      Q => addEarlyOutBypass0(30),
      R => '0'
    );
\addEarlyOutBypass0_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[31]_i_2_n_0\,
      Q => addEarlyOutBypass0(31),
      R => '0'
    );
\addEarlyOutBypass0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[3]_i_1_n_0\,
      Q => addEarlyOutBypass0(3),
      R => '0'
    );
\addEarlyOutBypass0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[4]_i_1_n_0\,
      Q => addEarlyOutBypass0(4),
      R => '0'
    );
\addEarlyOutBypass0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[5]_i_1_n_0\,
      Q => addEarlyOutBypass0(5),
      R => '0'
    );
\addEarlyOutBypass0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[6]_i_1_n_0\,
      Q => addEarlyOutBypass0(6),
      R => '0'
    );
\addEarlyOutBypass0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[7]_i_1_n_0\,
      Q => addEarlyOutBypass0(7),
      R => '0'
    );
\addEarlyOutBypass0_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[8]_i_1_n_0\,
      Q => addEarlyOutBypass0(8),
      R => '0'
    );
\addEarlyOutBypass0_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[9]_i_1_n_0\,
      Q => addEarlyOutBypass0(9),
      R => '0'
    );
\addEarlyOutBypass1[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(0),
      I1 => \addDenormFlushedValB_reg_n_0_[0]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[0]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[0]_i_1_n_0\
    );
\addEarlyOutBypass1[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(10),
      I1 => \addDenormFlushedValB_reg_n_0_[10]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[10]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[10]_i_1_n_0\
    );
\addEarlyOutBypass1[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(11),
      I1 => \addDenormFlushedValB_reg_n_0_[11]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[11]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[11]_i_1_n_0\
    );
\addEarlyOutBypass1[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(12),
      I1 => \addDenormFlushedValB_reg_n_0_[12]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[12]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[12]_i_1_n_0\
    );
\addEarlyOutBypass1[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(13),
      I1 => \addDenormFlushedValB_reg_n_0_[13]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[13]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[13]_i_1_n_0\
    );
\addEarlyOutBypass1[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(14),
      I1 => \addDenormFlushedValB_reg_n_0_[14]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[14]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[14]_i_1_n_0\
    );
\addEarlyOutBypass1[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(15),
      I1 => \addDenormFlushedValB_reg_n_0_[15]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[15]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[15]_i_1_n_0\
    );
\addEarlyOutBypass1[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(16),
      I1 => \addDenormFlushedValB_reg_n_0_[16]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[16]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[16]_i_1_n_0\
    );
\addEarlyOutBypass1[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(17),
      I1 => \addDenormFlushedValB_reg_n_0_[17]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[17]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[17]_i_1_n_0\
    );
\addEarlyOutBypass1[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(18),
      I1 => \addDenormFlushedValB_reg_n_0_[18]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[18]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[18]_i_1_n_0\
    );
\addEarlyOutBypass1[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(19),
      I1 => \addDenormFlushedValB_reg_n_0_[19]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[19]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[19]_i_1_n_0\
    );
\addEarlyOutBypass1[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(1),
      I1 => \addDenormFlushedValB_reg_n_0_[1]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[1]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[1]_i_1_n_0\
    );
\addEarlyOutBypass1[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(20),
      I1 => \addDenormFlushedValB_reg_n_0_[20]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[20]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[20]_i_1_n_0\
    );
\addEarlyOutBypass1[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(21),
      I1 => \addDenormFlushedValB_reg_n_0_[21]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[21]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[21]_i_1_n_0\
    );
\addEarlyOutBypass1[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(22),
      I1 => \addDenormFlushedValB_reg_n_0_[22]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[22]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[22]_i_1_n_0\
    );
\addEarlyOutBypass1[23]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[23]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[23]\,
      I3 => \addEarlyOutBypass1[31]_i_2_n_0\,
      I4 => addEarlyOutBypass0(23),
      O => \addEarlyOutBypass1[23]_i_1_n_0\
    );
\addEarlyOutBypass1[24]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[24]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[24]\,
      I3 => \addEarlyOutBypass1[31]_i_2_n_0\,
      I4 => addEarlyOutBypass0(24),
      O => \addEarlyOutBypass1[24]_i_1_n_0\
    );
\addEarlyOutBypass1[25]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[25]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[25]\,
      I3 => \addEarlyOutBypass1[31]_i_2_n_0\,
      I4 => addEarlyOutBypass0(25),
      O => \addEarlyOutBypass1[25]_i_1_n_0\
    );
\addEarlyOutBypass1[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[26]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[26]\,
      I3 => \addEarlyOutBypass1[31]_i_2_n_0\,
      I4 => addEarlyOutBypass0(26),
      O => \addEarlyOutBypass1[26]_i_1_n_0\
    );
\addEarlyOutBypass1[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[27]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[27]\,
      I3 => \addEarlyOutBypass1[31]_i_2_n_0\,
      I4 => addEarlyOutBypass0(27),
      O => \addEarlyOutBypass1[27]_i_1_n_0\
    );
\addEarlyOutBypass1[28]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[28]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[28]\,
      I3 => \addEarlyOutBypass1[31]_i_2_n_0\,
      I4 => addEarlyOutBypass0(28),
      O => \addEarlyOutBypass1[28]_i_1_n_0\
    );
\addEarlyOutBypass1[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[29]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[29]\,
      I3 => \addEarlyOutBypass1[31]_i_2_n_0\,
      I4 => addEarlyOutBypass0(29),
      O => \addEarlyOutBypass1[29]_i_1_n_0\
    );
\addEarlyOutBypass1[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(2),
      I1 => \addDenormFlushedValB_reg_n_0_[2]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[2]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[2]_i_1_n_0\
    );
\addEarlyOutBypass1[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[30]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[30]\,
      I3 => \addEarlyOutBypass1[31]_i_2_n_0\,
      I4 => addEarlyOutBypass0(30),
      O => \addEarlyOutBypass1[30]_i_1_n_0\
    );
\addEarlyOutBypass1[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E2FFE200"
    )
        port map (
      I0 => p_1_in,
      I1 => addALessThanB,
      I2 => p_0_in,
      I3 => \addEarlyOutBypass1[31]_i_2_n_0\,
      I4 => addEarlyOutBypass0(31),
      O => \addEarlyOutBypass1[31]_i_1_n_0\
    );
\addEarlyOutBypass1[31]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E200"
    )
        port map (
      I0 => addExponentDeltaAMinusBShiftTooFar,
      I1 => addALessThanB,
      I2 => addExponentDeltaBMinusAShiftTooFar,
      I3 => addMaxVal1(0),
      O => \addEarlyOutBypass1[31]_i_2_n_0\
    );
\addEarlyOutBypass1[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(3),
      I1 => \addDenormFlushedValB_reg_n_0_[3]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[3]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[3]_i_1_n_0\
    );
\addEarlyOutBypass1[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(4),
      I1 => \addDenormFlushedValB_reg_n_0_[4]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[4]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[4]_i_1_n_0\
    );
\addEarlyOutBypass1[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(5),
      I1 => \addDenormFlushedValB_reg_n_0_[5]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[5]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[5]_i_1_n_0\
    );
\addEarlyOutBypass1[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(6),
      I1 => \addDenormFlushedValB_reg_n_0_[6]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[6]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[6]_i_1_n_0\
    );
\addEarlyOutBypass1[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(7),
      I1 => \addDenormFlushedValB_reg_n_0_[7]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[7]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[7]_i_1_n_0\
    );
\addEarlyOutBypass1[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(8),
      I1 => \addDenormFlushedValB_reg_n_0_[8]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[8]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[8]_i_1_n_0\
    );
\addEarlyOutBypass1[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFC0AAAA"
    )
        port map (
      I0 => addEarlyOutBypass0(9),
      I1 => \addDenormFlushedValB_reg_n_0_[9]\,
      I2 => addALessThanB,
      I3 => \addDenormFlushedValA_reg_n_0_[9]\,
      I4 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => \addEarlyOutBypass1[9]_i_1_n_0\
    );
\addEarlyOutBypass1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[0]_i_1_n_0\,
      Q => addEarlyOutBypass1(0),
      R => '0'
    );
\addEarlyOutBypass1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[10]_i_1_n_0\,
      Q => addEarlyOutBypass1(10),
      R => '0'
    );
\addEarlyOutBypass1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[11]_i_1_n_0\,
      Q => addEarlyOutBypass1(11),
      R => '0'
    );
\addEarlyOutBypass1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[12]_i_1_n_0\,
      Q => addEarlyOutBypass1(12),
      R => '0'
    );
\addEarlyOutBypass1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[13]_i_1_n_0\,
      Q => addEarlyOutBypass1(13),
      R => '0'
    );
\addEarlyOutBypass1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[14]_i_1_n_0\,
      Q => addEarlyOutBypass1(14),
      R => '0'
    );
\addEarlyOutBypass1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[15]_i_1_n_0\,
      Q => addEarlyOutBypass1(15),
      R => '0'
    );
\addEarlyOutBypass1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[16]_i_1_n_0\,
      Q => addEarlyOutBypass1(16),
      R => '0'
    );
\addEarlyOutBypass1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[17]_i_1_n_0\,
      Q => addEarlyOutBypass1(17),
      R => '0'
    );
\addEarlyOutBypass1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[18]_i_1_n_0\,
      Q => addEarlyOutBypass1(18),
      R => '0'
    );
\addEarlyOutBypass1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[19]_i_1_n_0\,
      Q => addEarlyOutBypass1(19),
      R => '0'
    );
\addEarlyOutBypass1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[1]_i_1_n_0\,
      Q => addEarlyOutBypass1(1),
      R => '0'
    );
\addEarlyOutBypass1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[20]_i_1_n_0\,
      Q => addEarlyOutBypass1(20),
      R => '0'
    );
\addEarlyOutBypass1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[21]_i_1_n_0\,
      Q => addEarlyOutBypass1(21),
      R => '0'
    );
\addEarlyOutBypass1_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[22]_i_1_n_0\,
      Q => addEarlyOutBypass1(22),
      R => '0'
    );
\addEarlyOutBypass1_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[23]_i_1_n_0\,
      Q => addEarlyOutBypass1(23),
      R => '0'
    );
\addEarlyOutBypass1_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[24]_i_1_n_0\,
      Q => addEarlyOutBypass1(24),
      R => '0'
    );
\addEarlyOutBypass1_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[25]_i_1_n_0\,
      Q => addEarlyOutBypass1(25),
      R => '0'
    );
\addEarlyOutBypass1_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[26]_i_1_n_0\,
      Q => addEarlyOutBypass1(26),
      R => '0'
    );
\addEarlyOutBypass1_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[27]_i_1_n_0\,
      Q => addEarlyOutBypass1(27),
      R => '0'
    );
\addEarlyOutBypass1_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[28]_i_1_n_0\,
      Q => addEarlyOutBypass1(28),
      R => '0'
    );
\addEarlyOutBypass1_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[29]_i_1_n_0\,
      Q => addEarlyOutBypass1(29),
      R => '0'
    );
\addEarlyOutBypass1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[2]_i_1_n_0\,
      Q => addEarlyOutBypass1(2),
      R => '0'
    );
\addEarlyOutBypass1_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[30]_i_1_n_0\,
      Q => addEarlyOutBypass1(30),
      R => '0'
    );
\addEarlyOutBypass1_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[31]_i_1_n_0\,
      Q => addEarlyOutBypass1(31),
      R => '0'
    );
\addEarlyOutBypass1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[3]_i_1_n_0\,
      Q => addEarlyOutBypass1(3),
      R => '0'
    );
\addEarlyOutBypass1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[4]_i_1_n_0\,
      Q => addEarlyOutBypass1(4),
      R => '0'
    );
\addEarlyOutBypass1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[5]_i_1_n_0\,
      Q => addEarlyOutBypass1(5),
      R => '0'
    );
\addEarlyOutBypass1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[6]_i_1_n_0\,
      Q => addEarlyOutBypass1(6),
      R => '0'
    );
\addEarlyOutBypass1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[7]_i_1_n_0\,
      Q => addEarlyOutBypass1(7),
      R => '0'
    );
\addEarlyOutBypass1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[8]_i_1_n_0\,
      Q => addEarlyOutBypass1(8),
      R => '0'
    );
\addEarlyOutBypass1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \addEarlyOutBypass1[9]_i_1_n_0\,
      Q => addEarlyOutBypass1(9),
      R => '0'
    );
addEarlyOutBypassEnable0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF0F0FFEEF0F0"
    )
        port map (
      I0 => \addEarlyOutBypassEnable0120_out__0\,
      I1 => \addEarlyOutBypassEnable00__0\,
      I2 => \addEarlyOutBypassEnable0__0\,
      I3 => addEarlyOutBypassEnable0_i_3_n_0,
      I4 => IADD_GO,
      I5 => addEarlyOutBypassEnable0_i_4_n_0,
      O => addEarlyOutBypassEnable0_i_1_n_0
    );
addEarlyOutBypassEnable0_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"28"
    )
        port map (
      I0 => addSameNumberDifferentSigns00,
      I1 => IN_A(31),
      I2 => IN_B(31),
      O => \addEarlyOutBypassEnable00__0\
    );
addEarlyOutBypassEnable0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \comAIsDenormal__6\,
      I1 => comALessThanB,
      I2 => \comBIsDenormal__6\,
      O => addEarlyOutBypassEnable0_i_3_n_0
    );
addEarlyOutBypassEnable0_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \addEarlyOutBypassEnable01__2\,
      I1 => addEarlyOutBypassEnable013_out,
      I2 => \addEarlyOutBypassEnable0123_out__0\,
      O => addEarlyOutBypassEnable0_i_4_n_0
    );
addEarlyOutBypassEnable0_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => addEarlyOutBypassEnable0_i_1_n_0,
      Q => \addEarlyOutBypassEnable0__0\,
      R => '0'
    );
addEarlyOutBypassEnable1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \addEarlyOutBypassEnable0__0\,
      I1 => \addEarlyOutBypass1[31]_i_2_n_0\,
      O => addEarlyOutBypassEnable1_i_1_n_0
    );
addEarlyOutBypassEnable1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => addEarlyOutBypassEnable1_i_1_n_0,
      Q => addEarlyOutBypassEnable1_reg_n_0,
      R => '0'
    );
addEarlyOutBypassEnable2_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFF0BBF0"
    )
        port map (
      I0 => addSameNumberDifferentSigns1_reg_n_0,
      I1 => \addRenormalizeShiftAmount[4]_i_3_n_0\,
      I2 => addEarlyOutBypassEnable2_reg_n_0,
      I3 => addPipelineValidStage1,
      I4 => addEarlyOutBypassEnable1_reg_n_0,
      O => addEarlyOutBypassEnable2_i_1_n_0
    );
addEarlyOutBypassEnable2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => addEarlyOutBypassEnable2_i_1_n_0,
      Q => addEarlyOutBypassEnable2_reg_n_0,
      R => '0'
    );
addExponentDeltaAMinusBShiftTooFar_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAAA"
    )
        port map (
      I0 => addExponentDeltaAMinusB0(7),
      I1 => addExponentDeltaAMinusB0(3),
      I2 => addExponentDeltaAMinusBShiftTooFar_i_2_n_0,
      I3 => addExponentDeltaAMinusB0(4),
      I4 => addExponentDeltaAMinusB0(5),
      I5 => addExponentDeltaAMinusB0(6),
      O => addExponentDeltaAMinusBShiftTooFar_i_1_n_0
    );
addExponentDeltaAMinusBShiftTooFar_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FFFF6FFFF6FFFF6"
    )
        port map (
      I0 => IN_B(25),
      I1 => IN_A(25),
      I2 => IN_B(24),
      I3 => IN_B(23),
      I4 => IN_A(24),
      I5 => IN_A(23),
      O => addExponentDeltaAMinusBShiftTooFar_i_2_n_0
    );
addExponentDeltaAMinusBShiftTooFar_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaAMinusBShiftTooFar_i_1_n_0,
      Q => addExponentDeltaAMinusBShiftTooFar,
      R => '0'
    );
\addExponentDeltaAMinusB[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => IN_A(23),
      I1 => IN_B(23),
      O => addExponentDeltaAMinusB0(0)
    );
\addExponentDeltaAMinusB[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"639C"
    )
        port map (
      I0 => IN_A(23),
      I1 => IN_A(24),
      I2 => IN_B(23),
      I3 => IN_B(24),
      O => addExponentDeltaAMinusB0(1)
    );
\addExponentDeltaAMinusB[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666966696969996"
    )
        port map (
      I0 => IN_B(25),
      I1 => IN_A(25),
      I2 => IN_B(24),
      I3 => IN_B(23),
      I4 => IN_A(23),
      I5 => IN_A(24),
      O => addExponentDeltaAMinusB0(2)
    );
\addExponentDeltaAMinusB[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"820A7DF57DF5820A"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_B(23),
      I2 => IN_B(25),
      I3 => IN_B(24),
      I4 => \addExponentDeltaAMinusB[3]_i_2_n_0\,
      I5 => \addExponentDeltaAMinusB[3]_i_3_n_0\,
      O => addExponentDeltaAMinusB0(3)
    );
\addExponentDeltaAMinusB[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F999609969996009"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_B(25),
      I2 => IN_B(23),
      I3 => IN_B(24),
      I4 => IN_A(24),
      I5 => IN_A(23),
      O => \addExponentDeltaAMinusB[3]_i_2_n_0\
    );
\addExponentDeltaAMinusB[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAA9555"
    )
        port map (
      I0 => IN_A(26),
      I1 => IN_B(23),
      I2 => IN_B(24),
      I3 => IN_B(25),
      I4 => IN_B(26),
      O => \addExponentDeltaAMinusB[3]_i_3_n_0\
    );
\addExponentDeltaAMinusB[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"659A59A69A65A659"
    )
        port map (
      I0 => IN_A(27),
      I1 => IN_B(26),
      I2 => \addExponentDeltaAMinusB[4]_i_2_n_0\,
      I3 => IN_B(27),
      I4 => IN_A(26),
      I5 => \addExponentDeltaAMinusB[4]_i_3_n_0\,
      O => addExponentDeltaAMinusB0(4)
    );
\addExponentDeltaAMinusB[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => IN_B(25),
      I1 => IN_B(24),
      I2 => IN_B(23),
      O => \addExponentDeltaAMinusB[4]_i_2_n_0\
    );
\addExponentDeltaAMinusB[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EBAFAAAA820A0000"
    )
        port map (
      I0 => \addExponentDeltaAMinusB[3]_i_2_n_0\,
      I1 => IN_B(24),
      I2 => IN_B(25),
      I3 => IN_B(23),
      I4 => IN_A(25),
      I5 => \addExponentDeltaAMinusB[3]_i_3_n_0\,
      O => \addExponentDeltaAMinusB[4]_i_3_n_0\
    );
\addExponentDeltaAMinusB[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"659A59A69A65A659"
    )
        port map (
      I0 => IN_A(28),
      I1 => IN_B(27),
      I2 => \addExponentDeltaAMinusB[5]_i_2_n_0\,
      I3 => IN_B(28),
      I4 => IN_A(27),
      I5 => \addExponentDeltaAMinusB[5]_i_3_n_0\,
      O => addExponentDeltaAMinusB0(5)
    );
\addExponentDeltaAMinusB[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => IN_B(23),
      I1 => IN_B(24),
      I2 => IN_B(25),
      I3 => IN_B(26),
      O => \addExponentDeltaAMinusB[5]_i_2_n_0\
    );
\addExponentDeltaAMinusB[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AE8A38203820AE8A"
    )
        port map (
      I0 => \addExponentDeltaAMinusB[4]_i_3_n_0\,
      I1 => \addExponentDeltaAMinusB[4]_i_2_n_0\,
      I2 => IN_B(26),
      I3 => IN_A(26),
      I4 => IN_A(27),
      I5 => IN_B(27),
      O => \addExponentDeltaAMinusB[5]_i_3_n_0\
    );
\addExponentDeltaAMinusB[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6966669696999969"
    )
        port map (
      I0 => IN_A(29),
      I1 => IN_B(29),
      I2 => IN_B(28),
      I3 => \addExponentDeltaAMinusB[7]_i_3_n_0\,
      I4 => IN_A(28),
      I5 => \addExponentDeltaAMinusB[7]_i_4_n_0\,
      O => addExponentDeltaAMinusB0(6)
    );
\addExponentDeltaAMinusB[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5115F77FAEEA0880"
    )
        port map (
      I0 => \addExponentDeltaAMinusB[7]_i_2_n_0\,
      I1 => IN_A(28),
      I2 => IN_B(28),
      I3 => \addExponentDeltaAMinusB[7]_i_3_n_0\,
      I4 => \addExponentDeltaAMinusB[7]_i_4_n_0\,
      I5 => \addExponentDeltaAMinusB[7]_i_5_n_0\,
      O => addExponentDeltaAMinusB0(7)
    );
\addExponentDeltaAMinusB[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"99996999"
    )
        port map (
      I0 => IN_A(29),
      I1 => IN_B(29),
      I2 => IN_B(28),
      I3 => IN_B(27),
      I4 => \addExponentDeltaAMinusB[5]_i_2_n_0\,
      O => \addExponentDeltaAMinusB[7]_i_2_n_0\
    );
\addExponentDeltaAMinusB[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => IN_B(26),
      I1 => IN_B(25),
      I2 => IN_B(24),
      I3 => IN_B(23),
      I4 => IN_B(27),
      O => \addExponentDeltaAMinusB[7]_i_3_n_0\
    );
\addExponentDeltaAMinusB[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AE8A38203820AE8A"
    )
        port map (
      I0 => \addExponentDeltaAMinusB[5]_i_3_n_0\,
      I1 => \addExponentDeltaAMinusB[5]_i_2_n_0\,
      I2 => IN_B(27),
      I3 => IN_A(27),
      I4 => IN_A(28),
      I5 => IN_B(28),
      O => \addExponentDeltaAMinusB[7]_i_4_n_0\
    );
\addExponentDeltaAMinusB[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C9CC6C6636339399"
    )
        port map (
      I0 => IN_A(29),
      I1 => IN_A(30),
      I2 => \addExponentDeltaAMinusB[7]_i_3_n_0\,
      I3 => IN_B(28),
      I4 => IN_B(29),
      I5 => IN_B(30),
      O => \addExponentDeltaAMinusB[7]_i_5_n_0\
    );
\addExponentDeltaAMinusB_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaAMinusB0(0),
      Q => addExponentDeltaAMinusB(0),
      R => '0'
    );
\addExponentDeltaAMinusB_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaAMinusB0(1),
      Q => addExponentDeltaAMinusB(1),
      R => '0'
    );
\addExponentDeltaAMinusB_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaAMinusB0(2),
      Q => addExponentDeltaAMinusB(2),
      R => '0'
    );
\addExponentDeltaAMinusB_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaAMinusB0(3),
      Q => addExponentDeltaAMinusB(3),
      R => '0'
    );
\addExponentDeltaAMinusB_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaAMinusB0(4),
      Q => addExponentDeltaAMinusB(4),
      R => '0'
    );
\addExponentDeltaAMinusB_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaAMinusB0(5),
      Q => addExponentDeltaAMinusB(5),
      R => '0'
    );
\addExponentDeltaAMinusB_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaAMinusB0(6),
      Q => addExponentDeltaAMinusB(6),
      R => '0'
    );
\addExponentDeltaAMinusB_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaAMinusB0(7),
      Q => addExponentDeltaAMinusB(7),
      R => '0'
    );
addExponentDeltaBMinusAShiftTooFar_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFEAAA"
    )
        port map (
      I0 => addExponentDeltaBMinusA0(7),
      I1 => addExponentDeltaBMinusA0(3),
      I2 => addExponentDeltaBMinusAShiftTooFar_i_2_n_0,
      I3 => addExponentDeltaBMinusA0(4),
      I4 => addExponentDeltaBMinusA0(5),
      I5 => addExponentDeltaBMinusA0(6),
      O => addExponentDeltaBMinusAShiftTooFar_i_1_n_0
    );
addExponentDeltaBMinusAShiftTooFar_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6FFFF6FFFF6FFFF6"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_B(25),
      I2 => IN_A(24),
      I3 => IN_A(23),
      I4 => IN_B(24),
      I5 => IN_B(23),
      O => addExponentDeltaBMinusAShiftTooFar_i_2_n_0
    );
addExponentDeltaBMinusAShiftTooFar_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaBMinusAShiftTooFar_i_1_n_0,
      Q => addExponentDeltaBMinusAShiftTooFar,
      R => '0'
    );
\addExponentDeltaBMinusA[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"639C"
    )
        port map (
      I0 => IN_B(23),
      I1 => IN_B(24),
      I2 => IN_A(23),
      I3 => IN_A(24),
      O => addExponentDeltaBMinusA0(1)
    );
\addExponentDeltaBMinusA[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6696666696999696"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_B(25),
      I2 => IN_A(24),
      I3 => IN_B(23),
      I4 => IN_A(23),
      I5 => IN_B(24),
      O => addExponentDeltaBMinusA0(2)
    );
\addExponentDeltaBMinusA[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"82227DDD7DDD8222"
    )
        port map (
      I0 => IN_B(25),
      I1 => IN_A(25),
      I2 => IN_A(24),
      I3 => IN_A(23),
      I4 => \addExponentDeltaBMinusA[3]_i_2_n_0\,
      I5 => \addExponentDeltaBMinusA[3]_i_3_n_0\,
      O => addExponentDeltaBMinusA0(3)
    );
\addExponentDeltaBMinusA[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F999609969996009"
    )
        port map (
      I0 => IN_B(25),
      I1 => IN_A(25),
      I2 => IN_A(23),
      I3 => IN_A(24),
      I4 => IN_B(24),
      I5 => IN_B(23),
      O => \addExponentDeltaBMinusA[3]_i_2_n_0\
    );
\addExponentDeltaBMinusA[3]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAA9555"
    )
        port map (
      I0 => IN_B(26),
      I1 => IN_A(25),
      I2 => IN_A(24),
      I3 => IN_A(23),
      I4 => IN_A(26),
      O => \addExponentDeltaBMinusA[3]_i_3_n_0\
    );
\addExponentDeltaBMinusA[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"659A59A69A65A659"
    )
        port map (
      I0 => IN_B(27),
      I1 => IN_A(26),
      I2 => \addExponentDeltaBMinusA[4]_i_2_n_0\,
      I3 => IN_A(27),
      I4 => IN_B(26),
      I5 => \addExponentDeltaBMinusA[4]_i_3_n_0\,
      O => addExponentDeltaBMinusA0(4)
    );
\addExponentDeltaBMinusA[4]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => IN_A(23),
      I1 => IN_A(24),
      I2 => IN_A(25),
      O => \addExponentDeltaBMinusA[4]_i_2_n_0\
    );
\addExponentDeltaBMinusA[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EABFAAAA802A0000"
    )
        port map (
      I0 => \addExponentDeltaBMinusA[3]_i_2_n_0\,
      I1 => IN_A(23),
      I2 => IN_A(24),
      I3 => IN_A(25),
      I4 => IN_B(25),
      I5 => \addExponentDeltaBMinusA[3]_i_3_n_0\,
      O => \addExponentDeltaBMinusA[4]_i_3_n_0\
    );
\addExponentDeltaBMinusA[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6696696699699699"
    )
        port map (
      I0 => IN_B(28),
      I1 => IN_A(28),
      I2 => \addExponentDeltaBMinusA[5]_i_2_n_0\,
      I3 => IN_A(27),
      I4 => IN_B(27),
      I5 => \addExponentDeltaBMinusA[5]_i_3_n_0\,
      O => addExponentDeltaBMinusA0(5)
    );
\addExponentDeltaBMinusA[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_A(24),
      I2 => IN_A(23),
      I3 => IN_A(26),
      O => \addExponentDeltaBMinusA[5]_i_2_n_0\
    );
\addExponentDeltaBMinusA[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AE8A38203820AE8A"
    )
        port map (
      I0 => \addExponentDeltaBMinusA[4]_i_3_n_0\,
      I1 => \addExponentDeltaBMinusA[4]_i_2_n_0\,
      I2 => IN_A(26),
      I3 => IN_B(26),
      I4 => IN_B(27),
      I5 => IN_A(27),
      O => \addExponentDeltaBMinusA[5]_i_3_n_0\
    );
\addExponentDeltaBMinusA[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5A96695AA56996A5"
    )
        port map (
      I0 => IN_B(29),
      I1 => \addExponentDeltaBMinusA[7]_i_3_n_0\,
      I2 => IN_A(29),
      I3 => IN_A(28),
      I4 => IN_B(28),
      I5 => \addExponentDeltaBMinusA[7]_i_4_n_0\,
      O => addExponentDeltaBMinusA0(6)
    );
\addExponentDeltaBMinusA[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5115F77FAEEA0880"
    )
        port map (
      I0 => \addExponentDeltaBMinusA[7]_i_2_n_0\,
      I1 => IN_B(28),
      I2 => \addExponentDeltaBMinusA[7]_i_3_n_0\,
      I3 => IN_A(28),
      I4 => \addExponentDeltaBMinusA[7]_i_4_n_0\,
      I5 => \addExponentDeltaBMinusA[7]_i_5_n_0\,
      O => addExponentDeltaBMinusA0(7)
    );
\addExponentDeltaBMinusA[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A659AA55"
    )
        port map (
      I0 => IN_B(29),
      I1 => IN_A(27),
      I2 => \addExponentDeltaBMinusA[5]_i_2_n_0\,
      I3 => IN_A(29),
      I4 => IN_A(28),
      O => \addExponentDeltaBMinusA[7]_i_2_n_0\
    );
\addExponentDeltaBMinusA[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => IN_A(26),
      I1 => IN_A(23),
      I2 => IN_A(24),
      I3 => IN_A(25),
      I4 => IN_A(27),
      O => \addExponentDeltaBMinusA[7]_i_3_n_0\
    );
\addExponentDeltaBMinusA[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AE8A38203820AE8A"
    )
        port map (
      I0 => \addExponentDeltaBMinusA[5]_i_3_n_0\,
      I1 => \addExponentDeltaBMinusA[5]_i_2_n_0\,
      I2 => IN_A(27),
      I3 => IN_B(27),
      I4 => IN_B(28),
      I5 => IN_A(28),
      O => \addExponentDeltaBMinusA[7]_i_4_n_0\
    );
\addExponentDeltaBMinusA[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C9CC6C6636339399"
    )
        port map (
      I0 => IN_B(29),
      I1 => IN_B(30),
      I2 => \addExponentDeltaBMinusA[7]_i_3_n_0\,
      I3 => IN_A(28),
      I4 => IN_A(29),
      I5 => IN_A(30),
      O => \addExponentDeltaBMinusA[7]_i_5_n_0\
    );
\addExponentDeltaBMinusA_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaBMinusA0(1),
      Q => addExponentDeltaBMinusA(1),
      R => '0'
    );
\addExponentDeltaBMinusA_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaBMinusA0(2),
      Q => addExponentDeltaBMinusA(2),
      R => '0'
    );
\addExponentDeltaBMinusA_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaBMinusA0(3),
      Q => addExponentDeltaBMinusA(3),
      R => '0'
    );
\addExponentDeltaBMinusA_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaBMinusA0(4),
      Q => addExponentDeltaBMinusA(4),
      R => '0'
    );
\addExponentDeltaBMinusA_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaBMinusA0(5),
      Q => addExponentDeltaBMinusA(5),
      R => '0'
    );
\addExponentDeltaBMinusA_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaBMinusA0(6),
      Q => addExponentDeltaBMinusA(6),
      R => '0'
    );
\addExponentDeltaBMinusA_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addExponentDeltaBMinusA0(7),
      Q => addExponentDeltaBMinusA(7),
      R => '0'
    );
\addFinalExp[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9A95"
    )
        port map (
      I0 => \addMaxVal1_reg_n_0_[23]\,
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \addPostAddMantissa1_reg_n_0_[24]\,
      O => \addFinalExp[0]_i_1_n_0\
    );
\addFinalExp[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"1015EFEA"
    )
        port map (
      I0 => \addMaxVal1_reg_n_0_[23]\,
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \addPostAddMantissa1_reg_n_0_[24]\,
      I4 => \addMaxVal1_reg_n_0_[24]\,
      O => \addFinalExp[1]_i_1_n_0\
    );
\addFinalExp[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555557F7AAAAA808"
    )
        port map (
      I0 => \addMaxVal1_reg_n_0_[24]\,
      I1 => \addPostAddMantissa1_reg_n_0_[24]\,
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(24),
      I4 => \addMaxVal1_reg_n_0_[23]\,
      I5 => \addMaxVal1_reg_n_0_[25]\,
      O => \addFinalExp[2]_i_1_n_0\
    );
\addFinalExp[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \addFinalExp[5]_i_2_n_0\,
      I1 => \addMaxVal1_reg_n_0_[24]\,
      I2 => \addMaxVal1_reg_n_0_[25]\,
      I3 => \addMaxVal1_reg_n_0_[26]\,
      O => \addFinalExp[3]_i_1_n_0\
    );
\addFinalExp[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \addFinalExp[5]_i_2_n_0\,
      I1 => \addMaxVal1_reg_n_0_[25]\,
      I2 => \addMaxVal1_reg_n_0_[24]\,
      I3 => \addMaxVal1_reg_n_0_[26]\,
      I4 => \addMaxVal1_reg_n_0_[27]\,
      O => \addFinalExp[4]_i_1_n_0\
    );
\addFinalExp[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \addFinalExp[5]_i_2_n_0\,
      I1 => \addMaxVal1_reg_n_0_[26]\,
      I2 => \addMaxVal1_reg_n_0_[24]\,
      I3 => \addMaxVal1_reg_n_0_[25]\,
      I4 => \addMaxVal1_reg_n_0_[27]\,
      I5 => \addMaxVal1_reg_n_0_[28]\,
      O => \addFinalExp[5]_i_1_n_0\
    );
\addFinalExp[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFE2"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[24]\,
      I1 => \addPostAddMantissa1_reg_n_0_[25]\,
      I2 => \ADDStage2.postAddMantissa0\(24),
      I3 => \addMaxVal1_reg_n_0_[23]\,
      O => \addFinalExp[5]_i_2_n_0\
    );
\addFinalExp[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF001D0000FFE2"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[24]\,
      I1 => \addPostAddMantissa1_reg_n_0_[25]\,
      I2 => \ADDStage2.postAddMantissa0\(24),
      I3 => \addMaxVal1_reg_n_0_[23]\,
      I4 => \addFinalExp[6]_i_2_n_0\,
      I5 => \addMaxVal1_reg_n_0_[29]\,
      O => \addFinalExp[6]_i_1_n_0\
    );
\addFinalExp[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \addMaxVal1_reg_n_0_[27]\,
      I1 => \addMaxVal1_reg_n_0_[25]\,
      I2 => \addMaxVal1_reg_n_0_[24]\,
      I3 => \addMaxVal1_reg_n_0_[26]\,
      I4 => \addMaxVal1_reg_n_0_[28]\,
      O => \addFinalExp[6]_i_2_n_0\
    );
\addFinalExp[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6666666666633363"
    )
        port map (
      I0 => \addFinalExp[7]_i_2_n_0\,
      I1 => \addMaxVal1_reg_n_0_[30]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      I4 => \ADDStage2.postAddMantissa0\(24),
      I5 => \addMaxVal1_reg_n_0_[23]\,
      O => \addFinalExp[7]_i_1_n_0\
    );
\addFinalExp[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \addMaxVal1_reg_n_0_[28]\,
      I1 => \addMaxVal1_reg_n_0_[26]\,
      I2 => \addMaxVal1_reg_n_0_[24]\,
      I3 => \addMaxVal1_reg_n_0_[25]\,
      I4 => \addMaxVal1_reg_n_0_[27]\,
      I5 => \addMaxVal1_reg_n_0_[29]\,
      O => \addFinalExp[7]_i_2_n_0\
    );
\addFinalExp_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addFinalExp[0]_i_1_n_0\,
      Q => addFinalExp(0),
      R => '0'
    );
\addFinalExp_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addFinalExp[1]_i_1_n_0\,
      Q => addFinalExp(1),
      R => '0'
    );
\addFinalExp_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addFinalExp[2]_i_1_n_0\,
      Q => addFinalExp(2),
      R => '0'
    );
\addFinalExp_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addFinalExp[3]_i_1_n_0\,
      Q => addFinalExp(3),
      R => '0'
    );
\addFinalExp_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addFinalExp[4]_i_1_n_0\,
      Q => addFinalExp(4),
      R => '0'
    );
\addFinalExp_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addFinalExp[5]_i_1_n_0\,
      Q => addFinalExp(5),
      R => '0'
    );
\addFinalExp_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addFinalExp[6]_i_1_n_0\,
      Q => addFinalExp(6),
      R => '0'
    );
\addFinalExp_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addFinalExp[7]_i_1_n_0\,
      Q => addFinalExp(7),
      R => '0'
    );
addFinalSignIsNeg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFB0008"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[25]\,
      I1 => addPipelineValidStage1,
      I2 => addSameNumberDifferentSigns1_reg_n_0,
      I3 => addEarlyOutBypassEnable1_reg_n_0,
      I4 => addFinalSignIsNeg_reg_n_0,
      O => addFinalSignIsNeg_i_1_n_0
    );
addFinalSignIsNeg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => addFinalSignIsNeg_i_1_n_0,
      Q => addFinalSignIsNeg_reg_n_0,
      R => '0'
    );
\addMaxVal1[23]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[23]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[23]\,
      O => \addMaxVal1[23]_i_1_n_0\
    );
\addMaxVal1[24]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[24]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[24]\,
      O => \addMaxVal1[24]_i_1_n_0\
    );
\addMaxVal1[25]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[25]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[25]\,
      O => \addMaxVal1[25]_i_1_n_0\
    );
\addMaxVal1[26]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[26]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[26]\,
      O => \addMaxVal1[26]_i_1_n_0\
    );
\addMaxVal1[27]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[27]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[27]\,
      O => \addMaxVal1[27]_i_1_n_0\
    );
\addMaxVal1[28]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[28]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[28]\,
      O => \addMaxVal1[28]_i_1_n_0\
    );
\addMaxVal1[29]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[29]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[29]\,
      O => \addMaxVal1[29]_i_1_n_0\
    );
\addMaxVal1[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40044444"
    )
        port map (
      I0 => \addEarlyOutBypassEnable0__0\,
      I1 => addPipelineValidStage0,
      I2 => p_1_in,
      I3 => p_0_in,
      I4 => addSameNumberDifferentSigns0,
      O => addMaxVal1(0)
    );
\addMaxVal1[30]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[30]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[30]\,
      O => \addMaxVal1[30]_i_2_n_0\
    );
\addMaxVal1_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addMaxVal1(0),
      D => \addMaxVal1[23]_i_1_n_0\,
      Q => \addMaxVal1_reg_n_0_[23]\,
      R => '0'
    );
\addMaxVal1_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addMaxVal1(0),
      D => \addMaxVal1[24]_i_1_n_0\,
      Q => \addMaxVal1_reg_n_0_[24]\,
      R => '0'
    );
\addMaxVal1_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addMaxVal1(0),
      D => \addMaxVal1[25]_i_1_n_0\,
      Q => \addMaxVal1_reg_n_0_[25]\,
      R => '0'
    );
\addMaxVal1_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addMaxVal1(0),
      D => \addMaxVal1[26]_i_1_n_0\,
      Q => \addMaxVal1_reg_n_0_[26]\,
      R => '0'
    );
\addMaxVal1_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addMaxVal1(0),
      D => \addMaxVal1[27]_i_1_n_0\,
      Q => \addMaxVal1_reg_n_0_[27]\,
      R => '0'
    );
\addMaxVal1_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addMaxVal1(0),
      D => \addMaxVal1[28]_i_1_n_0\,
      Q => \addMaxVal1_reg_n_0_[28]\,
      R => '0'
    );
\addMaxVal1_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addMaxVal1(0),
      D => \addMaxVal1[29]_i_1_n_0\,
      Q => \addMaxVal1_reg_n_0_[29]\,
      R => '0'
    );
\addMaxVal1_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addMaxVal1(0),
      D => \addMaxVal1[30]_i_2_n_0\,
      Q => \addMaxVal1_reg_n_0_[30]\,
      R => '0'
    );
addPipelineValidStage0_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => IADD_GO,
      Q => addPipelineValidStage0,
      R => '0'
    );
addPipelineValidStage1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => addPipelineValidStage0,
      Q => addPipelineValidStage1,
      R => '0'
    );
addPipelineValidStage2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => addPipelineValidStage1,
      Q => addPipelineValidStage2,
      R => '0'
    );
\addPostAddMantissa10__22_carry\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa10__22_carry_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \addPostAddMantissa10__22_carry_n_0\,
      CO(6) => \addPostAddMantissa10__22_carry_n_1\,
      CO(5) => \addPostAddMantissa10__22_carry_n_2\,
      CO(4) => \addPostAddMantissa10__22_carry_n_3\,
      CO(3) => \addPostAddMantissa10__22_carry_n_4\,
      CO(2) => \addPostAddMantissa10__22_carry_n_5\,
      CO(1) => \addPostAddMantissa10__22_carry_n_6\,
      CO(0) => \addPostAddMantissa10__22_carry_n_7\,
      DI(7) => \addPostAddMantissa10__22_carry_i_2__1_n_0\,
      DI(6) => \addPostAddMantissa10__22_carry_i_3__1_n_0\,
      DI(5) => \addPostAddMantissa10__22_carry_i_4__1_n_0\,
      DI(4) => \addPostAddMantissa10__22_carry_i_5__1_n_0\,
      DI(3) => \addPostAddMantissa10__22_carry_i_6__1_n_0\,
      DI(2) => \addPostAddMantissa10__22_carry_i_7__1_n_0\,
      DI(1) => \addPostAddMantissa10__22_carry_i_8__1_n_0\,
      DI(0) => \addPostAddMantissa10__22_carry_i_9__0_n_0\,
      O(7) => \addPostAddMantissa10__22_carry_n_8\,
      O(6) => \addPostAddMantissa10__22_carry_n_9\,
      O(5) => \addPostAddMantissa10__22_carry_n_10\,
      O(4) => \addPostAddMantissa10__22_carry_n_11\,
      O(3) => \addPostAddMantissa10__22_carry_n_12\,
      O(2) => \addPostAddMantissa10__22_carry_n_13\,
      O(1) => \addPostAddMantissa10__22_carry_n_14\,
      O(0) => \addPostAddMantissa10__22_carry_n_15\,
      S(7) => \addPostAddMantissa10__22_carry_i_10__1_n_0\,
      S(6) => \addPostAddMantissa10__22_carry_i_11__1_n_0\,
      S(5) => \addPostAddMantissa10__22_carry_i_12__1_n_0\,
      S(4) => \addPostAddMantissa10__22_carry_i_13__1_n_0\,
      S(3) => \addPostAddMantissa10__22_carry_i_14__1_n_0\,
      S(2) => \addPostAddMantissa10__22_carry_i_15__1_n_0\,
      S(1) => \addPostAddMantissa10__22_carry_i_16__1_n_0\,
      S(0) => \addPostAddMantissa10__22_carry_i_17__1_n_0\
    );
\addPostAddMantissa10__22_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa10__22_carry_n_0\,
      CI_TOP => '0',
      CO(7) => \addPostAddMantissa10__22_carry__0_n_0\,
      CO(6) => \addPostAddMantissa10__22_carry__0_n_1\,
      CO(5) => \addPostAddMantissa10__22_carry__0_n_2\,
      CO(4) => \addPostAddMantissa10__22_carry__0_n_3\,
      CO(3) => \addPostAddMantissa10__22_carry__0_n_4\,
      CO(2) => \addPostAddMantissa10__22_carry__0_n_5\,
      CO(1) => \addPostAddMantissa10__22_carry__0_n_6\,
      CO(0) => \addPostAddMantissa10__22_carry__0_n_7\,
      DI(7) => \addPostAddMantissa10__22_carry_i_1__2_n_0\,
      DI(6) => \addPostAddMantissa10__22_carry_i_2__0_n_0\,
      DI(5) => \addPostAddMantissa10__22_carry_i_3__0_n_0\,
      DI(4) => \addPostAddMantissa10__22_carry_i_4__0_n_0\,
      DI(3) => \addPostAddMantissa10__22_carry_i_5__0_n_0\,
      DI(2) => \addPostAddMantissa10__22_carry_i_6__0_n_0\,
      DI(1) => \addPostAddMantissa10__22_carry_i_7__0_n_0\,
      DI(0) => \addPostAddMantissa10__22_carry_i_8__0_n_0\,
      O(7) => \addPostAddMantissa10__22_carry__0_n_8\,
      O(6) => \addPostAddMantissa10__22_carry__0_n_9\,
      O(5) => \addPostAddMantissa10__22_carry__0_n_10\,
      O(4) => \addPostAddMantissa10__22_carry__0_n_11\,
      O(3) => \addPostAddMantissa10__22_carry__0_n_12\,
      O(2) => \addPostAddMantissa10__22_carry__0_n_13\,
      O(1) => \addPostAddMantissa10__22_carry__0_n_14\,
      O(0) => \addPostAddMantissa10__22_carry__0_n_15\,
      S(7) => \addPostAddMantissa10__22_carry_i_9_n_0\,
      S(6) => \addPostAddMantissa10__22_carry_i_10__0_n_0\,
      S(5) => \addPostAddMantissa10__22_carry_i_11__0_n_0\,
      S(4) => \addPostAddMantissa10__22_carry_i_12__0_n_0\,
      S(3) => \addPostAddMantissa10__22_carry_i_13__0_n_0\,
      S(2) => \addPostAddMantissa10__22_carry_i_14__0_n_0\,
      S(1) => \addPostAddMantissa10__22_carry_i_15__0_n_0\,
      S(0) => \addPostAddMantissa10__22_carry_i_16__0_n_0\
    );
\addPostAddMantissa10__22_carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa10__22_carry__0_n_0\,
      CI_TOP => '0',
      CO(7) => \addPostAddMantissa10__22_carry__1_n_0\,
      CO(6) => \addPostAddMantissa10__22_carry__1_n_1\,
      CO(5) => \addPostAddMantissa10__22_carry__1_n_2\,
      CO(4) => \addPostAddMantissa10__22_carry__1_n_3\,
      CO(3) => \addPostAddMantissa10__22_carry__1_n_4\,
      CO(2) => \addPostAddMantissa10__22_carry__1_n_5\,
      CO(1) => \addPostAddMantissa10__22_carry__1_n_6\,
      CO(0) => \addPostAddMantissa10__22_carry__1_n_7\,
      DI(7) => \in\,
      DI(6) => \addPostAddMantissa10__22_carry_i_2_n_0\,
      DI(5) => \addPostAddMantissa10__22_carry_i_3_n_0\,
      DI(4) => \addPostAddMantissa10__22_carry_i_4_n_0\,
      DI(3) => \addPostAddMantissa10__22_carry_i_5_n_0\,
      DI(2) => \addPostAddMantissa10__22_carry_i_6_n_0\,
      DI(1) => \addPostAddMantissa10__22_carry_i_7_n_0\,
      DI(0) => \addPostAddMantissa10__22_carry_i_8_n_0\,
      O(7) => \addPostAddMantissa10__22_carry__1_n_8\,
      O(6) => \addPostAddMantissa10__22_carry__1_n_9\,
      O(5) => \addPostAddMantissa10__22_carry__1_n_10\,
      O(4) => \addPostAddMantissa10__22_carry__1_n_11\,
      O(3) => \addPostAddMantissa10__22_carry__1_n_12\,
      O(2) => \addPostAddMantissa10__22_carry__1_n_13\,
      O(1) => \addPostAddMantissa10__22_carry__1_n_14\,
      O(0) => \addPostAddMantissa10__22_carry__1_n_15\,
      S(7) => \addPostAddMantissa10__22_carry_i_9__1_n_0\,
      S(6) => \addPostAddMantissa10__22_carry_i_10_n_0\,
      S(5) => \addPostAddMantissa10__22_carry_i_11_n_0\,
      S(4) => \addPostAddMantissa10__22_carry_i_12_n_0\,
      S(3) => \addPostAddMantissa10__22_carry_i_13_n_0\,
      S(2) => \addPostAddMantissa10__22_carry_i_14_n_0\,
      S(1) => \addPostAddMantissa10__22_carry_i_15_n_0\,
      S(0) => \addPostAddMantissa10__22_carry_i_16_n_0\
    );
\addPostAddMantissa10__22_carry__2\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa10__22_carry__1_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_addPostAddMantissa10__22_carry__2_CO_UNCONNECTED\(7 downto 1),
      CO(0) => \addPostAddMantissa10__22_carry__2_n_7\,
      DI(7 downto 1) => B"0000000",
      DI(0) => \addPostAddMantissa10__22_carry_i_1__1_n_0\,
      O(7 downto 2) => \NLW_addPostAddMantissa10__22_carry__2_O_UNCONNECTED\(7 downto 2),
      O(1) => \addPostAddMantissa10__22_carry__2_n_14\,
      O(0) => \addPostAddMantissa10__22_carry__2_n_15\,
      S(7 downto 1) => B"0000001",
      S(0) => \addPostAddMantissa10__22_carry_i_2__2_n_0\
    );
\addPostAddMantissa10__22_carry_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E2"
    )
        port map (
      I0 => p_1_in,
      I1 => addALessThanB,
      I2 => p_0_in,
      O => \addPostAddMantissa10__22_carry_i_1_n_0\
    );
\addPostAddMantissa10__22_carry_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_2_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_17__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_18__0_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_10_n_0\
    );
\addPostAddMantissa10__22_carry_i_10__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_2__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_17_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_19_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_10__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_10__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_2__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_20_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_21_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_10__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_3_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_19__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_18__0_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_11_n_0\
    );
\addPostAddMantissa10__22_carry_i_11__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_3__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_19_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_20__0_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_11__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_11__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_3__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_21_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_23_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_11__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_4_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_19__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_20__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_12_n_0\
    );
\addPostAddMantissa10__22_carry_i_12__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_4__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_21__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_20__0_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_12__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_12__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_4__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_23_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_12__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_5_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_21__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_20__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_13_n_0\
    );
\addPostAddMantissa10__22_carry_i_13__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_5__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_21__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_22_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_13__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_13__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_5__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_25_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_13__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_6_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_22__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_21__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_14_n_0\
    );
\addPostAddMantissa10__22_carry_i_14__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_6__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_22_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_23__0_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_14__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_14__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_6__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_25_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_26_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_14__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_7_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_23__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_22__0_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_15_n_0\
    );
\addPostAddMantissa10__22_carry_i_15__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_7__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_24__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_23__0_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_15__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_15__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_7__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_27_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_26_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_15__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_8_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_18_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_23__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_16_n_0\
    );
\addPostAddMantissa10__22_carry_i_16__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_8__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_20_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__0_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_16__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_16__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_8__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_27_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_28_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_16__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__0_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_26__0_n_0\,
      O => \addPostAddMantissa10__22_carry_i_17_n_0\
    );
\addPostAddMantissa10__22_carry_i_17__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00010001"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_40__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I4 => \ADDStage1.mantissaMin0\(23),
      I5 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_17__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_17__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"56565556"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_9__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_29_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_28_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_17__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_27__0_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_28__0_n_0\,
      O => \addPostAddMantissa10__22_carry_i_18_n_0\
    );
\addPostAddMantissa10__22_carry_i_18__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F1F0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_40__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_28__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_18__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_18__1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A808"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_30__1_n_0\,
      I1 => p_0_in,
      I2 => addALessThanB,
      I3 => p_1_in,
      O => \addPostAddMantissa10__22_carry_i_18__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_28__0_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_29__0_n_0\,
      O => \addPostAddMantissa10__22_carry_i_19_n_0\
    );
\addPostAddMantissa10__22_carry_i_19__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FB0BFF00F808"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_29__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_40__0_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_30__0_n_0\,
      O => \addPostAddMantissa10__22_carry_i_19__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_19__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_30__1_n_0\,
      I1 => addExponentDeltaAMinusB(0),
      O => \addPostAddMantissa10__22_carry_i_19__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_1__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"47"
    )
        port map (
      I0 => p_0_in,
      I1 => addALessThanB,
      I2 => p_1_in,
      O => \in\
    );
\addPostAddMantissa10__22_carry_i_1__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => p_0_in,
      I1 => addALessThanB,
      I2 => p_1_in,
      O => \addPostAddMantissa10__22_carry_i_1__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_1__2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[15]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[15]\,
      O => \addPostAddMantissa10__22_carry_i_1__2_n_0\
    );
\addPostAddMantissa10__22_carry_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[22]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[22]\,
      O => \addPostAddMantissa10__22_carry_i_2_n_0\
    );
\addPostAddMantissa10__22_carry_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_31_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_32_n_0\,
      O => \addPostAddMantissa10__22_carry_i_20_n_0\
    );
\addPostAddMantissa10__22_carry_i_20__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_26__0_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_30_n_0\,
      O => \addPostAddMantissa10__22_carry_i_20__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_20__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FB0BFF00F808"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_28__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_40__0_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_31__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_20__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_21\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_33_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_34_n_0\,
      O => \addPostAddMantissa10__22_carry_i_21_n_0\
    );
\addPostAddMantissa10__22_carry_i_21__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_29__0_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_31__0_n_0\,
      O => \addPostAddMantissa10__22_carry_i_21__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_21__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CDC8FFFFCDC80000"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_30__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_40__0_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_32__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_21__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_22\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_30_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_32__0_n_0\,
      O => \addPostAddMantissa10__22_carry_i_22_n_0\
    );
\addPostAddMantissa10__22_carry_i_22__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CDC8FFFFCDC80000"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_31__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_40__0_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_27__0_n_0\,
      O => \addPostAddMantissa10__22_carry_i_22__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_22__1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => addExponentDeltaAMinusB(0),
      I1 => \addPostAddMantissa10__22_carry_i_30__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_22__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_23\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_32_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_35_n_0\,
      O => \addPostAddMantissa10__22_carry_i_23_n_0\
    );
\addPostAddMantissa10__22_carry_i_23__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_31__0_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_31_n_0\,
      O => \addPostAddMantissa10__22_carry_i_23__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_23__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_32__1_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_25__0_n_0\,
      O => \addPostAddMantissa10__22_carry_i_23__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_24\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_34_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_36_n_0\,
      O => \addPostAddMantissa10__22_carry_i_24_n_0\
    );
\addPostAddMantissa10__22_carry_i_24__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_32__0_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_33_n_0\,
      O => \addPostAddMantissa10__22_carry_i_24__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_24__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addExponentDeltaBMinusA(3),
      I1 => addALessThanB,
      I2 => addExponentDeltaAMinusB(3),
      O => \addPostAddMantissa10__22_carry_i_24__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_25\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_35_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_37_n_0\,
      O => \addPostAddMantissa10__22_carry_i_25_n_0\
    );
\addPostAddMantissa10__22_carry_i_25__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FB0BFF00F808"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_65_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_67_n_0\,
      O => \addPostAddMantissa10__22_carry_i_25__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_25__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addExponentDeltaBMinusA(4),
      I1 => addALessThanB,
      I2 => addExponentDeltaAMinusB(4),
      O => \addPostAddMantissa10__22_carry_i_25__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_26\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_36_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_38_n_0\,
      O => \addPostAddMantissa10__22_carry_i_26_n_0\
    );
\addPostAddMantissa10__22_carry_i_26__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_56_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_33__0_n_0\,
      O => \addPostAddMantissa10__22_carry_i_26__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_26__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa10__22_carry_i_33__1_n_0\,
      CI_TOP => '0',
      CO(7 downto 6) => \NLW_addPostAddMantissa10__22_carry_i_26__1_CO_UNCONNECTED\(7 downto 6),
      CO(5) => \ADDStage1.mantissaMin0\(23),
      CO(4) => \addPostAddMantissa10__22_carry_i_26__1_n_3\,
      CO(3) => \addPostAddMantissa10__22_carry_i_26__1_n_4\,
      CO(2) => \addPostAddMantissa10__22_carry_i_26__1_n_5\,
      CO(1) => \addPostAddMantissa10__22_carry_i_26__1_n_6\,
      CO(0) => \addPostAddMantissa10__22_carry_i_26__1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 6) => \NLW_addPostAddMantissa10__22_carry_i_26__1_O_UNCONNECTED\(7 downto 6),
      O(5 downto 0) => \ADDStage1.mantissaMin0\(22 downto 17),
      S(7 downto 6) => B"00",
      S(5) => \addPostAddMantissa10__22_carry_i_34__1_n_0\,
      S(4) => \addPostAddMantissa10__22_carry_i_35__1_n_0\,
      S(3) => \addPostAddMantissa10__22_carry_i_36__0_n_0\,
      S(2) => \addPostAddMantissa10__22_carry_i_37__0_n_0\,
      S(1) => \addPostAddMantissa10__22_carry_i_38__0_n_0\,
      S(0) => \addPostAddMantissa10__22_carry_i_39__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_27\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_37_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10__22_carry_i_39_n_0\,
      O => \addPostAddMantissa10__22_carry_i_27_n_0\
    );
\addPostAddMantissa10__22_carry_i_27__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FB0BFF00F808"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_34__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_35__0_n_0\,
      O => \addPostAddMantissa10__22_carry_i_27__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_27__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in,
      I1 => addALessThanB,
      I2 => p_0_in,
      O => \addPostAddMantissa10__22_carry_i_27__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_28\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_38_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_40__0_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_41_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_43_n_0\,
      O => \addPostAddMantissa10__22_carry_i_28_n_0\
    );
\addPostAddMantissa10__22_carry_i_28__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FB0BFF00F808"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_71_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_69_n_0\,
      O => \addPostAddMantissa10__22_carry_i_28__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_28__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(22),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[22]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[22]\,
      O => \addPostAddMantissa10__22_carry_i_28__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_44_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_45_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_40__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_39_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_29_n_0\
    );
\addPostAddMantissa10__22_carry_i_29__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_48_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_28__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_47_n_0\,
      O => \addPostAddMantissa10__22_carry_i_29__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_29__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFB8CF8B77744747"
    )
        port map (
      I0 => addExponentDeltaBMinusA(4),
      I1 => addALessThanB,
      I2 => addExponentDeltaAMinusB(4),
      I3 => \ADDStage1.mantissaMin0\(23),
      I4 => p_0_in,
      I5 => p_1_in,
      O => \addPostAddMantissa10__22_carry_i_29__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_2__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[14]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[14]\,
      O => \addPostAddMantissa10__22_carry_i_2__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_2__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[7]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[7]\,
      O => \addPostAddMantissa10__22_carry_i_2__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_2__2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      O => \addPostAddMantissa10__22_carry_i_2__2_n_0\
    );
\addPostAddMantissa10__22_carry_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[21]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[21]\,
      O => \addPostAddMantissa10__22_carry_i_3_n_0\
    );
\addPostAddMantissa10__22_carry_i_30\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_54_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_30__0_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_53_n_0\,
      O => \addPostAddMantissa10__22_carry_i_30_n_0\
    );
\addPostAddMantissa10__22_carry_i_30__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(21),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[21]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[21]\,
      O => \addPostAddMantissa10__22_carry_i_30__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_30__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => addExponentDeltaAMinusB(6),
      I1 => addExponentDeltaAMinusB(7),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(5),
      I4 => \addPostAddMantissa10__22_carry_i_46__0_n_0\,
      O => \addPostAddMantissa10__22_carry_i_30__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_31\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_28__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_47_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_48_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_49_n_0\,
      O => \addPostAddMantissa10__22_carry_i_31_n_0\
    );
\addPostAddMantissa10__22_carry_i_31__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_51_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_31__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_50_n_0\,
      O => \addPostAddMantissa10__22_carry_i_31__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_31__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(20),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[20]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[20]\,
      O => \addPostAddMantissa10__22_carry_i_31__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_32\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_31__1_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_50_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_51_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_52_n_0\,
      O => \addPostAddMantissa10__22_carry_i_32_n_0\
    );
\addPostAddMantissa10__22_carry_i_32__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_33__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_56_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_57_n_0\,
      O => \addPostAddMantissa10__22_carry_i_32__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_32__1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FB0FFF00F80C"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(23),
      I1 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_40_n_0\,
      O => \addPostAddMantissa10__22_carry_i_32__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_33\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_30__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_53_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_54_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_55_n_0\,
      O => \addPostAddMantissa10__22_carry_i_33_n_0\
    );
\addPostAddMantissa10__22_carry_i_33__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBF80F0FFBF80C0C"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(23),
      I1 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I3 => \ADDStage1.mantissaMin0\(15),
      I4 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_36__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_33__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_33__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa10__22_carry_i_73_n_0\,
      CI_TOP => '0',
      CO(7) => \addPostAddMantissa10__22_carry_i_33__1_n_0\,
      CO(6) => \addPostAddMantissa10__22_carry_i_33__1_n_1\,
      CO(5) => \addPostAddMantissa10__22_carry_i_33__1_n_2\,
      CO(4) => \addPostAddMantissa10__22_carry_i_33__1_n_3\,
      CO(3) => \addPostAddMantissa10__22_carry_i_33__1_n_4\,
      CO(2) => \addPostAddMantissa10__22_carry_i_33__1_n_5\,
      CO(1) => \addPostAddMantissa10__22_carry_i_33__1_n_6\,
      CO(0) => \addPostAddMantissa10__22_carry_i_33__1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \ADDStage1.mantissaMin0\(16 downto 9),
      S(7) => \addPostAddMantissa10__22_carry_i_41__0_n_0\,
      S(6) => \addPostAddMantissa10__22_carry_i_42_n_0\,
      S(5) => \addPostAddMantissa10__22_carry_i_43__0_n_0\,
      S(4) => \addPostAddMantissa10__22_carry_i_44__0_n_0\,
      S(3) => \addPostAddMantissa10__22_carry_i_45__0_n_0\,
      S(2) => \addPostAddMantissa10__22_carry_i_46_n_0\,
      S(1) => \addPostAddMantissa10__22_carry_i_47__0_n_0\,
      S(0) => \addPostAddMantissa10__22_carry_i_48__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_34\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_56_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_57_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_58_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_59_n_0\,
      O => \addPostAddMantissa10__22_carry_i_34_n_0\
    );
\addPostAddMantissa10__22_carry_i_34__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABF8A8FBAB08A80"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(22),
      I1 => p_1_in,
      I2 => addALessThanB,
      I3 => p_0_in,
      I4 => \addDenormFlushedValA_reg_n_0_[22]\,
      I5 => \addDenormFlushedValB_reg_n_0_[22]\,
      O => \addPostAddMantissa10__22_carry_i_34__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_34__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[22]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[22]\,
      O => \addPostAddMantissa10__22_carry_i_34__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_35\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_48_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_49_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_47_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_60_n_0\,
      O => \addPostAddMantissa10__22_carry_i_35_n_0\
    );
\addPostAddMantissa10__22_carry_i_35__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABF8A8FBAB08A80"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(18),
      I1 => p_1_in,
      I2 => addALessThanB,
      I3 => p_0_in,
      I4 => \addDenormFlushedValA_reg_n_0_[18]\,
      I5 => \addDenormFlushedValB_reg_n_0_[18]\,
      O => \addPostAddMantissa10__22_carry_i_35__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_35__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[21]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[21]\,
      O => \addPostAddMantissa10__22_carry_i_35__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_36\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_54_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_55_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_53_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_61_n_0\,
      O => \addPostAddMantissa10__22_carry_i_36_n_0\
    );
\addPostAddMantissa10__22_carry_i_36__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[20]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[20]\,
      O => \addPostAddMantissa10__22_carry_i_36__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_36__1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[15]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[15]\,
      O => \addPostAddMantissa10__22_carry_i_36__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_37\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_51_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_52_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_50_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_62_n_0\,
      O => \addPostAddMantissa10__22_carry_i_37_n_0\
    );
\addPostAddMantissa10__22_carry_i_37__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[19]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[19]\,
      O => \addPostAddMantissa10__22_carry_i_37__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_38\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_58_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_59_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_57_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_63_n_0\,
      O => \addPostAddMantissa10__22_carry_i_38_n_0\
    );
\addPostAddMantissa10__22_carry_i_38__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[18]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[18]\,
      O => \addPostAddMantissa10__22_carry_i_38__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_39\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_47_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_60_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_42__0_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_49_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_64_n_0\,
      O => \addPostAddMantissa10__22_carry_i_39_n_0\
    );
\addPostAddMantissa10__22_carry_i_39__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[17]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[17]\,
      O => \addPostAddMantissa10__22_carry_i_39__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_3__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[13]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[13]\,
      O => \addPostAddMantissa10__22_carry_i_3__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_3__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[6]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[6]\,
      O => \addPostAddMantissa10__22_carry_i_3__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[20]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[20]\,
      O => \addPostAddMantissa10__22_carry_i_4_n_0\
    );
\addPostAddMantissa10__22_carry_i_40\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABF8A8FBAB08A80"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(19),
      I1 => p_1_in,
      I2 => addALessThanB,
      I3 => p_0_in,
      I4 => \addDenormFlushedValA_reg_n_0_[19]\,
      I5 => \addDenormFlushedValB_reg_n_0_[19]\,
      O => \addPostAddMantissa10__22_carry_i_40_n_0\
    );
\addPostAddMantissa10__22_carry_i_40__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addExponentDeltaBMinusA(1),
      I1 => addALessThanB,
      I2 => addExponentDeltaAMinusB(1),
      O => \addPostAddMantissa10__22_carry_i_40__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_41\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_53_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_65_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_66_n_0\,
      O => \addPostAddMantissa10__22_carry_i_41_n_0\
    );
\addPostAddMantissa10__22_carry_i_41__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[16]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[16]\,
      O => \addPostAddMantissa10__22_carry_i_41__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_42\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[15]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[15]\,
      O => \addPostAddMantissa10__22_carry_i_42_n_0\
    );
\addPostAddMantissa10__22_carry_i_42__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addExponentDeltaBMinusA(2),
      I1 => addALessThanB,
      I2 => addExponentDeltaAMinusB(2),
      O => \addPostAddMantissa10__22_carry_i_42__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_43\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_55_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_67_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_68_n_0\,
      O => \addPostAddMantissa10__22_carry_i_43_n_0\
    );
\addPostAddMantissa10__22_carry_i_43__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[14]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[14]\,
      O => \addPostAddMantissa10__22_carry_i_43__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_44\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_52_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_69_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_70_n_0\,
      O => \addPostAddMantissa10__22_carry_i_44_n_0\
    );
\addPostAddMantissa10__22_carry_i_44__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[13]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[13]\,
      O => \addPostAddMantissa10__22_carry_i_44__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_45\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_50_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_24__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_71_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_72_n_0\,
      O => \addPostAddMantissa10__22_carry_i_45_n_0\
    );
\addPostAddMantissa10__22_carry_i_45__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[12]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[12]\,
      O => \addPostAddMantissa10__22_carry_i_45__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_46\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[11]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[11]\,
      O => \addPostAddMantissa10__22_carry_i_46_n_0\
    );
\addPostAddMantissa10__22_carry_i_46__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => addExponentDeltaBMinusA(6),
      I1 => addExponentDeltaBMinusA(5),
      I2 => addALessThanB,
      I3 => addExponentDeltaBMinusA(7),
      O => \addPostAddMantissa10__22_carry_i_46__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_47\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(14),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[14]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[14]\,
      O => \addPostAddMantissa10__22_carry_i_47_n_0\
    );
\addPostAddMantissa10__22_carry_i_47__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[10]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[10]\,
      O => \addPostAddMantissa10__22_carry_i_47__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_48\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(18),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[18]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[18]\,
      O => \addPostAddMantissa10__22_carry_i_48_n_0\
    );
\addPostAddMantissa10__22_carry_i_48__0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[9]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[9]\,
      O => \addPostAddMantissa10__22_carry_i_48__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_49\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(10),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[10]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[10]\,
      O => \addPostAddMantissa10__22_carry_i_49_n_0\
    );
\addPostAddMantissa10__22_carry_i_4__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[12]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[12]\,
      O => \addPostAddMantissa10__22_carry_i_4__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_4__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[5]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[5]\,
      O => \addPostAddMantissa10__22_carry_i_4__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[19]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[19]\,
      O => \addPostAddMantissa10__22_carry_i_5_n_0\
    );
\addPostAddMantissa10__22_carry_i_50\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(12),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[12]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[12]\,
      O => \addPostAddMantissa10__22_carry_i_50_n_0\
    );
\addPostAddMantissa10__22_carry_i_51\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(16),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[16]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[16]\,
      O => \addPostAddMantissa10__22_carry_i_51_n_0\
    );
\addPostAddMantissa10__22_carry_i_52\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(8),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[8]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[8]\,
      O => \addPostAddMantissa10__22_carry_i_52_n_0\
    );
\addPostAddMantissa10__22_carry_i_53\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(13),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[13]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[13]\,
      O => \addPostAddMantissa10__22_carry_i_53_n_0\
    );
\addPostAddMantissa10__22_carry_i_54\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(17),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[17]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[17]\,
      O => \addPostAddMantissa10__22_carry_i_54_n_0\
    );
\addPostAddMantissa10__22_carry_i_55\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(9),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[9]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[9]\,
      O => \addPostAddMantissa10__22_carry_i_55_n_0\
    );
\addPostAddMantissa10__22_carry_i_56\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(19),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[19]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[19]\,
      O => \addPostAddMantissa10__22_carry_i_56_n_0\
    );
\addPostAddMantissa10__22_carry_i_57\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(11),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[11]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[11]\,
      O => \addPostAddMantissa10__22_carry_i_57_n_0\
    );
\addPostAddMantissa10__22_carry_i_58\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E5E0E5E5E5E0E0E0"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I1 => \ADDStage1.mantissaMin0\(15),
      I2 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I3 => \addDenormFlushedValA_reg_n_0_[15]\,
      I4 => addALessThanB,
      I5 => \addDenormFlushedValB_reg_n_0_[15]\,
      O => \addPostAddMantissa10__22_carry_i_58_n_0\
    );
\addPostAddMantissa10__22_carry_i_59\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB8CC"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(23),
      I1 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I2 => \ADDStage1.mantissaMin0\(7),
      I3 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_74_n_0\,
      O => \addPostAddMantissa10__22_carry_i_59_n_0\
    );
\addPostAddMantissa10__22_carry_i_5__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[11]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[11]\,
      O => \addPostAddMantissa10__22_carry_i_5__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_5__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[4]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[4]\,
      O => \addPostAddMantissa10__22_carry_i_5__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[18]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[18]\,
      O => \addPostAddMantissa10__22_carry_i_6_n_0\
    );
\addPostAddMantissa10__22_carry_i_60\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(22),
      I1 => \addPostAddMantissa10__22_carry_i_75_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I3 => \ADDStage1.mantissaMin0\(6),
      I4 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_76_n_0\,
      O => \addPostAddMantissa10__22_carry_i_60_n_0\
    );
\addPostAddMantissa10__22_carry_i_61\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(21),
      I1 => \addPostAddMantissa10__22_carry_i_77_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I3 => \ADDStage1.mantissaMin0\(5),
      I4 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_78_n_0\,
      O => \addPostAddMantissa10__22_carry_i_61_n_0\
    );
\addPostAddMantissa10__22_carry_i_62\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(20),
      I1 => \addPostAddMantissa10__22_carry_i_79_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I3 => \ADDStage1.mantissaMin0\(4),
      I4 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_80_n_0\,
      O => \addPostAddMantissa10__22_carry_i_62_n_0\
    );
\addPostAddMantissa10__22_carry_i_63\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(19),
      I1 => \addPostAddMantissa10__22_carry_i_81_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I3 => \ADDStage1.mantissaMin0\(3),
      I4 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_82_n_0\,
      O => \addPostAddMantissa10__22_carry_i_63_n_0\
    );
\addPostAddMantissa10__22_carry_i_64\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(18),
      I1 => \addPostAddMantissa10__22_carry_i_83_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_25__1_n_0\,
      I3 => \ADDStage1.mantissaMin0\(2),
      I4 => \addPostAddMantissa10__22_carry_i_27__1_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_84_n_0\,
      O => \addPostAddMantissa10__22_carry_i_64_n_0\
    );
\addPostAddMantissa10__22_carry_i_65\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABF8A8FBAB08A80"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(21),
      I1 => p_1_in,
      I2 => addALessThanB,
      I3 => p_0_in,
      I4 => \addDenormFlushedValA_reg_n_0_[21]\,
      I5 => \addDenormFlushedValB_reg_n_0_[21]\,
      O => \addPostAddMantissa10__22_carry_i_65_n_0\
    );
\addPostAddMantissa10__22_carry_i_66\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABF8A8FBAB08A80"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(5),
      I1 => p_1_in,
      I2 => addALessThanB,
      I3 => p_0_in,
      I4 => \addDenormFlushedValA_reg_n_0_[5]\,
      I5 => \addDenormFlushedValB_reg_n_0_[5]\,
      O => \addPostAddMantissa10__22_carry_i_66_n_0\
    );
\addPostAddMantissa10__22_carry_i_67\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABF8A8FBAB08A80"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(17),
      I1 => p_1_in,
      I2 => addALessThanB,
      I3 => p_0_in,
      I4 => \addDenormFlushedValA_reg_n_0_[17]\,
      I5 => \addDenormFlushedValB_reg_n_0_[17]\,
      O => \addPostAddMantissa10__22_carry_i_67_n_0\
    );
\addPostAddMantissa10__22_carry_i_68\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABF8A8FBAB08A80"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(1),
      I1 => p_1_in,
      I2 => addALessThanB,
      I3 => p_0_in,
      I4 => \addDenormFlushedValA_reg_n_0_[1]\,
      I5 => \addDenormFlushedValB_reg_n_0_[1]\,
      O => \addPostAddMantissa10__22_carry_i_68_n_0\
    );
\addPostAddMantissa10__22_carry_i_69\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABF8A8FBAB08A80"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(16),
      I1 => p_1_in,
      I2 => addALessThanB,
      I3 => p_0_in,
      I4 => \addDenormFlushedValA_reg_n_0_[16]\,
      I5 => \addDenormFlushedValB_reg_n_0_[16]\,
      O => \addPostAddMantissa10__22_carry_i_69_n_0\
    );
\addPostAddMantissa10__22_carry_i_6__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[10]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[10]\,
      O => \addPostAddMantissa10__22_carry_i_6__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_6__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[3]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[3]\,
      O => \addPostAddMantissa10__22_carry_i_6__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[17]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[17]\,
      O => \addPostAddMantissa10__22_carry_i_7_n_0\
    );
\addPostAddMantissa10__22_carry_i_70\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[0]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[0]\,
      O => \addPostAddMantissa10__22_carry_i_70_n_0\
    );
\addPostAddMantissa10__22_carry_i_71\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABF8A8FBAB08A80"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(20),
      I1 => p_1_in,
      I2 => addALessThanB,
      I3 => p_0_in,
      I4 => \addDenormFlushedValA_reg_n_0_[20]\,
      I5 => \addDenormFlushedValB_reg_n_0_[20]\,
      O => \addPostAddMantissa10__22_carry_i_71_n_0\
    );
\addPostAddMantissa10__22_carry_i_72\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BABF8A8FBAB08A80"
    )
        port map (
      I0 => \ADDStage1.mantissaMin0\(4),
      I1 => p_1_in,
      I2 => addALessThanB,
      I3 => p_0_in,
      I4 => \addDenormFlushedValA_reg_n_0_[4]\,
      I5 => \addDenormFlushedValB_reg_n_0_[4]\,
      O => \addPostAddMantissa10__22_carry_i_72_n_0\
    );
\addPostAddMantissa10__22_carry_i_73\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa10__22_carry_i_85_n_0\,
      CI_TOP => '0',
      CO(7) => \addPostAddMantissa10__22_carry_i_73_n_0\,
      CO(6) => \addPostAddMantissa10__22_carry_i_73_n_1\,
      CO(5) => \addPostAddMantissa10__22_carry_i_73_n_2\,
      CO(4) => \addPostAddMantissa10__22_carry_i_73_n_3\,
      CO(3) => \addPostAddMantissa10__22_carry_i_73_n_4\,
      CO(2) => \addPostAddMantissa10__22_carry_i_73_n_5\,
      CO(1) => \addPostAddMantissa10__22_carry_i_73_n_6\,
      CO(0) => \addPostAddMantissa10__22_carry_i_73_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \ADDStage1.mantissaMin0\(8 downto 1),
      S(7) => \addPostAddMantissa10__22_carry_i_86_n_0\,
      S(6) => \addPostAddMantissa10__22_carry_i_87_n_0\,
      S(5) => \addPostAddMantissa10__22_carry_i_88_n_0\,
      S(4) => \addPostAddMantissa10__22_carry_i_89_n_0\,
      S(3) => \addPostAddMantissa10__22_carry_i_90_n_0\,
      S(2) => \addPostAddMantissa10__22_carry_i_91_n_0\,
      S(1) => \addPostAddMantissa10__22_carry_i_92_n_0\,
      S(0) => \addPostAddMantissa10__22_carry_i_93_n_0\
    );
\addPostAddMantissa10__22_carry_i_74\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[7]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[7]\,
      O => \addPostAddMantissa10__22_carry_i_74_n_0\
    );
\addPostAddMantissa10__22_carry_i_75\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[22]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[22]\,
      O => \addPostAddMantissa10__22_carry_i_75_n_0\
    );
\addPostAddMantissa10__22_carry_i_76\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[6]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[6]\,
      O => \addPostAddMantissa10__22_carry_i_76_n_0\
    );
\addPostAddMantissa10__22_carry_i_77\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[21]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[21]\,
      O => \addPostAddMantissa10__22_carry_i_77_n_0\
    );
\addPostAddMantissa10__22_carry_i_78\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[5]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[5]\,
      O => \addPostAddMantissa10__22_carry_i_78_n_0\
    );
\addPostAddMantissa10__22_carry_i_79\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[20]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[20]\,
      O => \addPostAddMantissa10__22_carry_i_79_n_0\
    );
\addPostAddMantissa10__22_carry_i_7__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[9]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[9]\,
      O => \addPostAddMantissa10__22_carry_i_7__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_7__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[2]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[2]\,
      O => \addPostAddMantissa10__22_carry_i_7__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[16]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[16]\,
      O => \addPostAddMantissa10__22_carry_i_8_n_0\
    );
\addPostAddMantissa10__22_carry_i_80\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[4]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[4]\,
      O => \addPostAddMantissa10__22_carry_i_80_n_0\
    );
\addPostAddMantissa10__22_carry_i_81\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[19]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[19]\,
      O => \addPostAddMantissa10__22_carry_i_81_n_0\
    );
\addPostAddMantissa10__22_carry_i_82\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[3]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[3]\,
      O => \addPostAddMantissa10__22_carry_i_82_n_0\
    );
\addPostAddMantissa10__22_carry_i_83\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[18]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[18]\,
      O => \addPostAddMantissa10__22_carry_i_83_n_0\
    );
\addPostAddMantissa10__22_carry_i_84\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[2]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[2]\,
      O => \addPostAddMantissa10__22_carry_i_84_n_0\
    );
\addPostAddMantissa10__22_carry_i_85\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[0]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[0]\,
      O => \addPostAddMantissa10__22_carry_i_85_n_0\
    );
\addPostAddMantissa10__22_carry_i_86\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[8]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[8]\,
      O => \addPostAddMantissa10__22_carry_i_86_n_0\
    );
\addPostAddMantissa10__22_carry_i_87\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[7]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[7]\,
      O => \addPostAddMantissa10__22_carry_i_87_n_0\
    );
\addPostAddMantissa10__22_carry_i_88\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[6]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[6]\,
      O => \addPostAddMantissa10__22_carry_i_88_n_0\
    );
\addPostAddMantissa10__22_carry_i_89\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[5]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[5]\,
      O => \addPostAddMantissa10__22_carry_i_89_n_0\
    );
\addPostAddMantissa10__22_carry_i_8__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[8]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[8]\,
      O => \addPostAddMantissa10__22_carry_i_8__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_8__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[1]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[1]\,
      O => \addPostAddMantissa10__22_carry_i_8__1_n_0\
    );
\addPostAddMantissa10__22_carry_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6566656655556566"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_1__2_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_18__1_n_0\,
      I2 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I3 => \addPostAddMantissa10__22_carry_i_17_n_0\,
      I4 => \addPostAddMantissa10__22_carry_i_18_n_0\,
      I5 => \addPostAddMantissa10__22_carry_i_19__1_n_0\,
      O => \addPostAddMantissa10__22_carry_i_9_n_0\
    );
\addPostAddMantissa10__22_carry_i_90\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[4]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[4]\,
      O => \addPostAddMantissa10__22_carry_i_90_n_0\
    );
\addPostAddMantissa10__22_carry_i_91\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[3]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[3]\,
      O => \addPostAddMantissa10__22_carry_i_91_n_0\
    );
\addPostAddMantissa10__22_carry_i_92\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[2]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[2]\,
      O => \addPostAddMantissa10__22_carry_i_92_n_0\
    );
\addPostAddMantissa10__22_carry_i_93\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[1]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[1]\,
      O => \addPostAddMantissa10__22_carry_i_93_n_0\
    );
\addPostAddMantissa10__22_carry_i_9__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[0]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[0]\,
      O => \addPostAddMantissa10__22_carry_i_9__0_n_0\
    );
\addPostAddMantissa10__22_carry_i_9__1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E1E22D1D"
    )
        port map (
      I0 => \addPostAddMantissa10__22_carry_i_17__0_n_0\,
      I1 => \addPostAddMantissa10__22_carry_i_22__1_n_0\,
      I2 => p_0_in,
      I3 => addALessThanB,
      I4 => p_1_in,
      O => \addPostAddMantissa10__22_carry_i_9__1_n_0\
    );
\addPostAddMantissa1[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => addMaxVal1(0),
      I1 => addExponentDeltaAMinusBShiftTooFar,
      I2 => addALessThanB,
      I3 => addExponentDeltaBMinusAShiftTooFar,
      O => addPostAddMantissa1(0)
    );
\addPostAddMantissa1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry_n_15\,
      Q => \addPostAddMantissa1_reg_n_0_[0]\,
      R => '0'
    );
\addPostAddMantissa1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__0_n_13\,
      Q => \addPostAddMantissa1_reg_n_0_[10]\,
      R => '0'
    );
\addPostAddMantissa1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__0_n_12\,
      Q => \addPostAddMantissa1_reg_n_0_[11]\,
      R => '0'
    );
\addPostAddMantissa1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__0_n_11\,
      Q => \addPostAddMantissa1_reg_n_0_[12]\,
      R => '0'
    );
\addPostAddMantissa1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__0_n_10\,
      Q => \addPostAddMantissa1_reg_n_0_[13]\,
      R => '0'
    );
\addPostAddMantissa1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__0_n_9\,
      Q => \addPostAddMantissa1_reg_n_0_[14]\,
      R => '0'
    );
\addPostAddMantissa1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__0_n_8\,
      Q => \addPostAddMantissa1_reg_n_0_[15]\,
      R => '0'
    );
\addPostAddMantissa1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__1_n_15\,
      Q => \addPostAddMantissa1_reg_n_0_[16]\,
      R => '0'
    );
\addPostAddMantissa1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__1_n_14\,
      Q => \addPostAddMantissa1_reg_n_0_[17]\,
      R => '0'
    );
\addPostAddMantissa1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__1_n_13\,
      Q => \addPostAddMantissa1_reg_n_0_[18]\,
      R => '0'
    );
\addPostAddMantissa1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__1_n_12\,
      Q => \addPostAddMantissa1_reg_n_0_[19]\,
      R => '0'
    );
\addPostAddMantissa1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry_n_14\,
      Q => \addPostAddMantissa1_reg_n_0_[1]\,
      R => '0'
    );
\addPostAddMantissa1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__1_n_11\,
      Q => \addPostAddMantissa1_reg_n_0_[20]\,
      R => '0'
    );
\addPostAddMantissa1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__1_n_10\,
      Q => \addPostAddMantissa1_reg_n_0_[21]\,
      R => '0'
    );
\addPostAddMantissa1_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__1_n_9\,
      Q => \addPostAddMantissa1_reg_n_0_[22]\,
      R => '0'
    );
\addPostAddMantissa1_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__1_n_8\,
      Q => \addPostAddMantissa1_reg_n_0_[23]\,
      R => '0'
    );
\addPostAddMantissa1_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__2_n_15\,
      Q => \addPostAddMantissa1_reg_n_0_[24]\,
      R => '0'
    );
\addPostAddMantissa1_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__2_n_14\,
      Q => \addPostAddMantissa1_reg_n_0_[25]\,
      R => '0'
    );
\addPostAddMantissa1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry_n_13\,
      Q => \addPostAddMantissa1_reg_n_0_[2]\,
      R => '0'
    );
\addPostAddMantissa1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry_n_12\,
      Q => \addPostAddMantissa1_reg_n_0_[3]\,
      R => '0'
    );
\addPostAddMantissa1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry_n_11\,
      Q => \addPostAddMantissa1_reg_n_0_[4]\,
      R => '0'
    );
\addPostAddMantissa1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry_n_10\,
      Q => \addPostAddMantissa1_reg_n_0_[5]\,
      R => '0'
    );
\addPostAddMantissa1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry_n_9\,
      Q => \addPostAddMantissa1_reg_n_0_[6]\,
      R => '0'
    );
\addPostAddMantissa1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry_n_8\,
      Q => \addPostAddMantissa1_reg_n_0_[7]\,
      R => '0'
    );
\addPostAddMantissa1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__0_n_15\,
      Q => \addPostAddMantissa1_reg_n_0_[8]\,
      R => '0'
    );
\addPostAddMantissa1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1(0),
      D => \addPostAddMantissa10__22_carry__0_n_14\,
      Q => \addPostAddMantissa1_reg_n_0_[9]\,
      R => '0'
    );
\addPostAddMantissa[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00AAAAE2E2E2E2"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[0]\,
      I1 => \addPostAddMantissa1_reg_n_0_[24]\,
      I2 => \addPostAddMantissa1_reg_n_0_[1]\,
      I3 => \ADDStage2.postAddMantissa0\(1),
      I4 => \ADDStage2.postAddMantissa0\(24),
      I5 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[0]_i_1_n_0\
    );
\addPostAddMantissa[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(11),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(10),
      I4 => \addPostAddMantissa[10]_i_2_n_0\,
      O => \addPostAddMantissa[10]_i_1_n_0\
    );
\addPostAddMantissa[10]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[11]\,
      I1 => \addPostAddMantissa1_reg_n_0_[10]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[10]_i_2_n_0\
    );
\addPostAddMantissa[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(12),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(11),
      I4 => \addPostAddMantissa[11]_i_2_n_0\,
      O => \addPostAddMantissa[11]_i_1_n_0\
    );
\addPostAddMantissa[11]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[12]\,
      I1 => \addPostAddMantissa1_reg_n_0_[11]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[11]_i_2_n_0\
    );
\addPostAddMantissa[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(13),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(12),
      I4 => \addPostAddMantissa[12]_i_2_n_0\,
      O => \addPostAddMantissa[12]_i_1_n_0\
    );
\addPostAddMantissa[12]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[13]\,
      I1 => \addPostAddMantissa1_reg_n_0_[12]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[12]_i_2_n_0\
    );
\addPostAddMantissa[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(14),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(13),
      I4 => \addPostAddMantissa[13]_i_2_n_0\,
      O => \addPostAddMantissa[13]_i_1_n_0\
    );
\addPostAddMantissa[13]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[14]\,
      I1 => \addPostAddMantissa1_reg_n_0_[13]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[13]_i_2_n_0\
    );
\addPostAddMantissa[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(15),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(14),
      I4 => \addPostAddMantissa[14]_i_2_n_0\,
      O => \addPostAddMantissa[14]_i_1_n_0\
    );
\addPostAddMantissa[14]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[15]\,
      I1 => \addPostAddMantissa1_reg_n_0_[14]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[14]_i_2_n_0\
    );
\addPostAddMantissa[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(16),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(15),
      I4 => \addPostAddMantissa[15]_i_2_n_0\,
      O => \addPostAddMantissa[15]_i_1_n_0\
    );
\addPostAddMantissa[15]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[16]\,
      I1 => \addPostAddMantissa1_reg_n_0_[15]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[15]_i_2_n_0\
    );
\addPostAddMantissa[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(17),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(16),
      I4 => \addPostAddMantissa[16]_i_3_n_0\,
      O => \addPostAddMantissa[16]_i_1_n_0\
    );
\addPostAddMantissa[16]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[10]\,
      O => \addPostAddMantissa[16]_i_10_n_0\
    );
\addPostAddMantissa[16]_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[9]\,
      O => \addPostAddMantissa[16]_i_11_n_0\
    );
\addPostAddMantissa[16]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[17]\,
      I1 => \addPostAddMantissa1_reg_n_0_[16]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[16]_i_3_n_0\
    );
\addPostAddMantissa[16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[16]\,
      O => \addPostAddMantissa[16]_i_4_n_0\
    );
\addPostAddMantissa[16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[15]\,
      O => \addPostAddMantissa[16]_i_5_n_0\
    );
\addPostAddMantissa[16]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[14]\,
      O => \addPostAddMantissa[16]_i_6_n_0\
    );
\addPostAddMantissa[16]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[13]\,
      O => \addPostAddMantissa[16]_i_7_n_0\
    );
\addPostAddMantissa[16]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[12]\,
      O => \addPostAddMantissa[16]_i_8_n_0\
    );
\addPostAddMantissa[16]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[11]\,
      O => \addPostAddMantissa[16]_i_9_n_0\
    );
\addPostAddMantissa[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(18),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(17),
      I4 => \addPostAddMantissa[17]_i_2_n_0\,
      O => \addPostAddMantissa[17]_i_1_n_0\
    );
\addPostAddMantissa[17]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[18]\,
      I1 => \addPostAddMantissa1_reg_n_0_[17]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[17]_i_2_n_0\
    );
\addPostAddMantissa[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(19),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(18),
      I4 => \addPostAddMantissa[18]_i_2_n_0\,
      O => \addPostAddMantissa[18]_i_1_n_0\
    );
\addPostAddMantissa[18]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[19]\,
      I1 => \addPostAddMantissa1_reg_n_0_[18]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[18]_i_2_n_0\
    );
\addPostAddMantissa[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(20),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(19),
      I4 => \addPostAddMantissa[19]_i_2_n_0\,
      O => \addPostAddMantissa[19]_i_1_n_0\
    );
\addPostAddMantissa[19]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[20]\,
      I1 => \addPostAddMantissa1_reg_n_0_[19]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[19]_i_2_n_0\
    );
\addPostAddMantissa[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(2),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(1),
      I4 => \addPostAddMantissa[1]_i_2_n_0\,
      O => \addPostAddMantissa[1]_i_1_n_0\
    );
\addPostAddMantissa[1]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[2]\,
      I1 => \addPostAddMantissa1_reg_n_0_[1]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[1]_i_2_n_0\
    );
\addPostAddMantissa[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(21),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(20),
      I4 => \addPostAddMantissa[20]_i_2_n_0\,
      O => \addPostAddMantissa[20]_i_1_n_0\
    );
\addPostAddMantissa[20]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[21]\,
      I1 => \addPostAddMantissa1_reg_n_0_[20]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[20]_i_2_n_0\
    );
\addPostAddMantissa[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(22),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(21),
      I4 => \addPostAddMantissa[21]_i_2_n_0\,
      O => \addPostAddMantissa[21]_i_1_n_0\
    );
\addPostAddMantissa[21]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[22]\,
      I1 => \addPostAddMantissa1_reg_n_0_[21]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[21]_i_2_n_0\
    );
\addPostAddMantissa[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(23),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(22),
      I4 => \addPostAddMantissa[22]_i_2_n_0\,
      O => \addPostAddMantissa[22]_i_1_n_0\
    );
\addPostAddMantissa[22]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[23]\,
      I1 => \addPostAddMantissa1_reg_n_0_[22]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[22]_i_2_n_0\
    );
\addPostAddMantissa[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(3),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(2),
      I4 => \addPostAddMantissa[2]_i_2_n_0\,
      O => \addPostAddMantissa[2]_i_1_n_0\
    );
\addPostAddMantissa[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[3]\,
      I1 => \addPostAddMantissa1_reg_n_0_[2]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[2]_i_2_n_0\
    );
\addPostAddMantissa[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(4),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(3),
      I4 => \addPostAddMantissa[3]_i_2_n_0\,
      O => \addPostAddMantissa[3]_i_1_n_0\
    );
\addPostAddMantissa[3]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[4]\,
      I1 => \addPostAddMantissa1_reg_n_0_[3]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[3]_i_2_n_0\
    );
\addPostAddMantissa[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(5),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(4),
      I4 => \addPostAddMantissa[4]_i_2_n_0\,
      O => \addPostAddMantissa[4]_i_1_n_0\
    );
\addPostAddMantissa[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[5]\,
      I1 => \addPostAddMantissa1_reg_n_0_[4]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[4]_i_2_n_0\
    );
\addPostAddMantissa[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(6),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(5),
      I4 => \addPostAddMantissa[5]_i_2_n_0\,
      O => \addPostAddMantissa[5]_i_1_n_0\
    );
\addPostAddMantissa[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[6]\,
      I1 => \addPostAddMantissa1_reg_n_0_[5]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[5]_i_2_n_0\
    );
\addPostAddMantissa[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(7),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(6),
      I4 => \addPostAddMantissa[6]_i_2_n_0\,
      O => \addPostAddMantissa[6]_i_1_n_0\
    );
\addPostAddMantissa[6]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[7]\,
      I1 => \addPostAddMantissa1_reg_n_0_[6]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[6]_i_2_n_0\
    );
\addPostAddMantissa[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(8),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(7),
      I4 => \addPostAddMantissa[7]_i_2_n_0\,
      O => \addPostAddMantissa[7]_i_1_n_0\
    );
\addPostAddMantissa[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[8]\,
      I1 => \addPostAddMantissa1_reg_n_0_[7]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[7]_i_2_n_0\
    );
\addPostAddMantissa[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(9),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(8),
      I4 => \addPostAddMantissa[8]_i_3_n_0\,
      O => \addPostAddMantissa[8]_i_1_n_0\
    );
\addPostAddMantissa[8]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[3]\,
      O => \addPostAddMantissa[8]_i_10_n_0\
    );
\addPostAddMantissa[8]_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[2]\,
      O => \addPostAddMantissa[8]_i_11_n_0\
    );
\addPostAddMantissa[8]_i_12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[1]\,
      O => \addPostAddMantissa[8]_i_12_n_0\
    );
\addPostAddMantissa[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[9]\,
      I1 => \addPostAddMantissa1_reg_n_0_[8]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[8]_i_3_n_0\
    );
\addPostAddMantissa[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[0]\,
      O => \addPostAddMantissa[8]_i_4_n_0\
    );
\addPostAddMantissa[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[8]\,
      O => \addPostAddMantissa[8]_i_5_n_0\
    );
\addPostAddMantissa[8]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[7]\,
      O => \addPostAddMantissa[8]_i_6_n_0\
    );
\addPostAddMantissa[8]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[6]\,
      O => \addPostAddMantissa[8]_i_7_n_0\
    );
\addPostAddMantissa[8]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[5]\,
      O => \addPostAddMantissa[8]_i_8_n_0\
    );
\addPostAddMantissa[8]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[4]\,
      O => \addPostAddMantissa[8]_i_9_n_0\
    );
\addPostAddMantissa[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(10),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(9),
      I4 => \addPostAddMantissa[9]_i_2_n_0\,
      O => \addPostAddMantissa[9]_i_1_n_0\
    );
\addPostAddMantissa[9]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00AC"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[10]\,
      I1 => \addPostAddMantissa1_reg_n_0_[9]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[9]_i_2_n_0\
    );
\addPostAddMantissa_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[0]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[0]\,
      R => '0'
    );
\addPostAddMantissa_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[10]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[10]\,
      R => '0'
    );
\addPostAddMantissa_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[11]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[11]\,
      R => '0'
    );
\addPostAddMantissa_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[12]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[12]\,
      R => '0'
    );
\addPostAddMantissa_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[13]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[13]\,
      R => '0'
    );
\addPostAddMantissa_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[14]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[14]\,
      R => '0'
    );
\addPostAddMantissa_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[15]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[15]\,
      R => '0'
    );
\addPostAddMantissa_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[16]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[16]\,
      R => '0'
    );
\addPostAddMantissa_reg[16]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa_reg[8]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \addPostAddMantissa_reg[16]_i_2_n_0\,
      CO(6) => \addPostAddMantissa_reg[16]_i_2_n_1\,
      CO(5) => \addPostAddMantissa_reg[16]_i_2_n_2\,
      CO(4) => \addPostAddMantissa_reg[16]_i_2_n_3\,
      CO(3) => \addPostAddMantissa_reg[16]_i_2_n_4\,
      CO(2) => \addPostAddMantissa_reg[16]_i_2_n_5\,
      CO(1) => \addPostAddMantissa_reg[16]_i_2_n_6\,
      CO(0) => \addPostAddMantissa_reg[16]_i_2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \ADDStage2.postAddMantissa0\(16 downto 9),
      S(7) => \addPostAddMantissa[16]_i_4_n_0\,
      S(6) => \addPostAddMantissa[16]_i_5_n_0\,
      S(5) => \addPostAddMantissa[16]_i_6_n_0\,
      S(4) => \addPostAddMantissa[16]_i_7_n_0\,
      S(3) => \addPostAddMantissa[16]_i_8_n_0\,
      S(2) => \addPostAddMantissa[16]_i_9_n_0\,
      S(1) => \addPostAddMantissa[16]_i_10_n_0\,
      S(0) => \addPostAddMantissa[16]_i_11_n_0\
    );
\addPostAddMantissa_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[17]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[17]\,
      R => '0'
    );
\addPostAddMantissa_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[18]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[18]\,
      R => '0'
    );
\addPostAddMantissa_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[19]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[19]\,
      R => '0'
    );
\addPostAddMantissa_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[1]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[1]\,
      R => '0'
    );
\addPostAddMantissa_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[20]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[20]\,
      R => '0'
    );
\addPostAddMantissa_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[21]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[21]\,
      R => '0'
    );
\addPostAddMantissa_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[22]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[22]\,
      R => '0'
    );
\addPostAddMantissa_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[2]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[2]\,
      R => '0'
    );
\addPostAddMantissa_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[3]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[3]\,
      R => '0'
    );
\addPostAddMantissa_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[4]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[4]\,
      R => '0'
    );
\addPostAddMantissa_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[5]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[5]\,
      R => '0'
    );
\addPostAddMantissa_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[6]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[6]\,
      R => '0'
    );
\addPostAddMantissa_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[7]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[7]\,
      R => '0'
    );
\addPostAddMantissa_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[8]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[8]\,
      R => '0'
    );
\addPostAddMantissa_reg[8]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa[8]_i_4_n_0\,
      CI_TOP => '0',
      CO(7) => \addPostAddMantissa_reg[8]_i_2_n_0\,
      CO(6) => \addPostAddMantissa_reg[8]_i_2_n_1\,
      CO(5) => \addPostAddMantissa_reg[8]_i_2_n_2\,
      CO(4) => \addPostAddMantissa_reg[8]_i_2_n_3\,
      CO(3) => \addPostAddMantissa_reg[8]_i_2_n_4\,
      CO(2) => \addPostAddMantissa_reg[8]_i_2_n_5\,
      CO(1) => \addPostAddMantissa_reg[8]_i_2_n_6\,
      CO(0) => \addPostAddMantissa_reg[8]_i_2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \ADDStage2.postAddMantissa0\(8 downto 1),
      S(7) => \addPostAddMantissa[8]_i_5_n_0\,
      S(6) => \addPostAddMantissa[8]_i_6_n_0\,
      S(5) => \addPostAddMantissa[8]_i_7_n_0\,
      S(4) => \addPostAddMantissa[8]_i_8_n_0\,
      S(3) => \addPostAddMantissa[8]_i_9_n_0\,
      S(2) => \addPostAddMantissa[8]_i_10_n_0\,
      S(1) => \addPostAddMantissa[8]_i_11_n_0\,
      S(0) => \addPostAddMantissa[8]_i_12_n_0\
    );
\addPostAddMantissa_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addPostAddMantissa[9]_i_1_n_0\,
      Q => \addPostAddMantissa_reg_n_0_[9]\,
      R => '0'
    );
\addRenormalizeShiftAmount[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFEFE"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[0]_i_2_n_0\,
      I1 => \addRenormalizeShiftAmount[0]_i_3_n_0\,
      I2 => \addRenormalizeShiftAmount[0]_i_4_n_0\,
      I3 => \addPostAddMantissa1_reg_n_0_[16]\,
      I4 => \addRenormalizeShiftAmount[4]_i_7_n_0\,
      I5 => \addRenormalizeShiftAmount[0]_i_5_n_0\,
      O => \addRenormalizeShiftAmount[0]_i_1_n_0\
    );
\addRenormalizeShiftAmount[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAEEFE"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[10]\,
      I1 => \addPostAddMantissa1_reg_n_0_[8]\,
      I2 => \addRenormalizeShiftAmount[0]_i_12_n_0\,
      I3 => \addPostAddMantissa1_reg_n_0_[7]\,
      I4 => \addPostAddMantissa1_reg_n_0_[9]\,
      I5 => \addPostAddMantissa1_reg_n_0_[11]\,
      O => \addRenormalizeShiftAmount[0]_i_10_n_0\
    );
\addRenormalizeShiftAmount[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FF000400"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[17]\,
      I1 => \addPostAddMantissa1_reg_n_0_[14]\,
      I2 => \addPostAddMantissa1_reg_n_0_[15]\,
      I3 => \addRenormalizeShiftAmount[0]_i_13_n_0\,
      I4 => \addPostAddMantissa1_reg_n_0_[18]\,
      I5 => \addPostAddMantissa1_reg_n_0_[19]\,
      O => \addRenormalizeShiftAmount[0]_i_11_n_0\
    );
\addRenormalizeShiftAmount[0]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55551011"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[5]\,
      I1 => \addPostAddMantissa1_reg_n_0_[3]\,
      I2 => \addPostAddMantissa1_reg_n_0_[2]\,
      I3 => \addPostAddMantissa1_reg_n_0_[1]\,
      I4 => \addPostAddMantissa1_reg_n_0_[4]\,
      I5 => \addPostAddMantissa1_reg_n_0_[6]\,
      O => \addRenormalizeShiftAmount[0]_i_12_n_0\
    );
\addRenormalizeShiftAmount[0]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[23]\,
      I1 => \addPostAddMantissa1_reg_n_0_[24]\,
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \addPostAddMantissa1_reg_n_0_[21]\,
      O => \addRenormalizeShiftAmount[0]_i_13_n_0\
    );
\addRenormalizeShiftAmount[0]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"88C8"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(16),
      I1 => \addRenormalizeShiftAmount[4]_i_4_n_0\,
      I2 => \ADDStage2.postAddMantissa0\(14),
      I3 => \ADDStage2.postAddMantissa0\(15),
      O => \addRenormalizeShiftAmount[0]_i_2_n_0\
    );
\addRenormalizeShiftAmount[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10101000"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(13),
      I1 => \ADDStage2.postAddMantissa0\(15),
      I2 => \addRenormalizeShiftAmount[4]_i_4_n_0\,
      I3 => \ADDStage2.postAddMantissa0\(12),
      I4 => \addRenormalizeShiftAmount[0]_i_6_n_0\,
      O => \addRenormalizeShiftAmount[0]_i_3_n_0\
    );
\addRenormalizeShiftAmount[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000000000F2"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[20]\,
      I1 => \addPostAddMantissa1_reg_n_0_[21]\,
      I2 => \addPostAddMantissa1_reg_n_0_[22]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      I4 => \addPostAddMantissa1_reg_n_0_[24]\,
      I5 => \addPostAddMantissa1_reg_n_0_[23]\,
      O => \addRenormalizeShiftAmount[0]_i_4_n_0\
    );
\addRenormalizeShiftAmount[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFAAFF08"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[2]_i_5_n_0\,
      I1 => \ADDStage2.postAddMantissa0\(18),
      I2 => \ADDStage2.postAddMantissa0\(19),
      I3 => \addRenormalizeShiftAmount[0]_i_7_n_0\,
      I4 => \ADDStage2.postAddMantissa0\(20),
      I5 => \addRenormalizeShiftAmount[0]_i_8_n_0\,
      O => \addRenormalizeShiftAmount[0]_i_5_n_0\
    );
\addRenormalizeShiftAmount[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAEEFE"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(10),
      I1 => \ADDStage2.postAddMantissa0\(8),
      I2 => \addRenormalizeShiftAmount[0]_i_9_n_0\,
      I3 => \ADDStage2.postAddMantissa0\(7),
      I4 => \ADDStage2.postAddMantissa0\(9),
      I5 => \ADDStage2.postAddMantissa0\(11),
      O => \addRenormalizeShiftAmount[0]_i_6_n_0\
    );
\addRenormalizeShiftAmount[0]_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10101000"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[13]\,
      I1 => \addPostAddMantissa1_reg_n_0_[15]\,
      I2 => \addRenormalizeShiftAmount[4]_i_7_n_0\,
      I3 => \addPostAddMantissa1_reg_n_0_[12]\,
      I4 => \addRenormalizeShiftAmount[0]_i_10_n_0\,
      O => \addRenormalizeShiftAmount[0]_i_7_n_0\
    );
\addRenormalizeShiftAmount[0]_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0020"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(22),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(23),
      I4 => \addRenormalizeShiftAmount[0]_i_11_n_0\,
      O => \addRenormalizeShiftAmount[0]_i_8_n_0\
    );
\addRenormalizeShiftAmount[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55551011"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(5),
      I1 => \ADDStage2.postAddMantissa0\(3),
      I2 => \ADDStage2.postAddMantissa0\(2),
      I3 => \ADDStage2.postAddMantissa0\(1),
      I4 => \ADDStage2.postAddMantissa0\(4),
      I5 => \ADDStage2.postAddMantissa0\(6),
      O => \addRenormalizeShiftAmount[0]_i_9_n_0\
    );
\addRenormalizeShiftAmount[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBBBAAAAA"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[1]_i_2_n_0\,
      I1 => \ADDStage2.postAddMantissa0\(22),
      I2 => \ADDStage2.postAddMantissa0\(20),
      I3 => \ADDStage2.postAddMantissa0\(21),
      I4 => \addRenormalizeShiftAmount[1]_i_3_n_0\,
      I5 => \addRenormalizeShiftAmount[1]_i_4_n_0\,
      O => \addRenormalizeShiftAmount[1]_i_1_n_0\
    );
\addRenormalizeShiftAmount[1]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1110111011101111"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(7),
      I1 => \ADDStage2.postAddMantissa0\(6),
      I2 => \ADDStage2.postAddMantissa0\(4),
      I3 => \ADDStage2.postAddMantissa0\(5),
      I4 => \ADDStage2.postAddMantissa0\(2),
      I5 => \ADDStage2.postAddMantissa0\(3),
      O => \addRenormalizeShiftAmount[1]_i_10_n_0\
    );
\addRenormalizeShiftAmount[1]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[19]\,
      I1 => \addPostAddMantissa1_reg_n_0_[18]\,
      I2 => \addPostAddMantissa1_reg_n_0_[22]\,
      I3 => \addPostAddMantissa1_reg_n_0_[23]\,
      I4 => \addPostAddMantissa1_reg_n_0_[24]\,
      I5 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addRenormalizeShiftAmount[1]_i_11_n_0\
    );
\addRenormalizeShiftAmount[1]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF5554"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[1]_i_13_n_0\,
      I1 => \addRenormalizeShiftAmount[1]_i_14_n_0\,
      I2 => \addPostAddMantissa1_reg_n_0_[9]\,
      I3 => \addPostAddMantissa1_reg_n_0_[8]\,
      I4 => \addPostAddMantissa1_reg_n_0_[13]\,
      I5 => \addPostAddMantissa1_reg_n_0_[12]\,
      O => \addRenormalizeShiftAmount[1]_i_12_n_0\
    );
\addRenormalizeShiftAmount[1]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[10]\,
      I1 => \addPostAddMantissa1_reg_n_0_[11]\,
      O => \addRenormalizeShiftAmount[1]_i_13_n_0\
    );
\addRenormalizeShiftAmount[1]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1110111011101111"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[7]\,
      I1 => \addPostAddMantissa1_reg_n_0_[6]\,
      I2 => \addPostAddMantissa1_reg_n_0_[4]\,
      I3 => \addPostAddMantissa1_reg_n_0_[5]\,
      I4 => \addPostAddMantissa1_reg_n_0_[2]\,
      I5 => \addPostAddMantissa1_reg_n_0_[3]\,
      O => \addRenormalizeShiftAmount[1]_i_14_n_0\
    );
\addRenormalizeShiftAmount[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8A8A8AAA8A8A8A8"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[1]_i_5_n_0\,
      I1 => \ADDStage2.postAddMantissa0\(16),
      I2 => \ADDStage2.postAddMantissa0\(17),
      I3 => \ADDStage2.postAddMantissa0\(15),
      I4 => \ADDStage2.postAddMantissa0\(14),
      I5 => \addRenormalizeShiftAmount[1]_i_6_n_0\,
      O => \addRenormalizeShiftAmount[1]_i_2_n_0\
    );
\addRenormalizeShiftAmount[1]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(24),
      I1 => \addPostAddMantissa1_reg_n_0_[25]\,
      I2 => \ADDStage2.postAddMantissa0\(23),
      O => \addRenormalizeShiftAmount[1]_i_3_n_0\
    );
\addRenormalizeShiftAmount[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00002220"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[1]_i_7_n_0\,
      I1 => \addPostAddMantissa1_reg_n_0_[23]\,
      I2 => \addPostAddMantissa1_reg_n_0_[21]\,
      I3 => \addPostAddMantissa1_reg_n_0_[20]\,
      I4 => \addPostAddMantissa1_reg_n_0_[22]\,
      I5 => \addRenormalizeShiftAmount[1]_i_8_n_0\,
      O => \addRenormalizeShiftAmount[1]_i_4_n_0\
    );
\addRenormalizeShiftAmount[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000010000"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(19),
      I1 => \ADDStage2.postAddMantissa0\(18),
      I2 => \ADDStage2.postAddMantissa0\(22),
      I3 => \ADDStage2.postAddMantissa0\(23),
      I4 => \addPostAddMantissa1_reg_n_0_[25]\,
      I5 => \ADDStage2.postAddMantissa0\(24),
      O => \addRenormalizeShiftAmount[1]_i_5_n_0\
    );
\addRenormalizeShiftAmount[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF5554"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[1]_i_9_n_0\,
      I1 => \addRenormalizeShiftAmount[1]_i_10_n_0\,
      I2 => \ADDStage2.postAddMantissa0\(9),
      I3 => \ADDStage2.postAddMantissa0\(8),
      I4 => \ADDStage2.postAddMantissa0\(13),
      I5 => \ADDStage2.postAddMantissa0\(12),
      O => \addRenormalizeShiftAmount[1]_i_6_n_0\
    );
\addRenormalizeShiftAmount[1]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[24]\,
      I1 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addRenormalizeShiftAmount[1]_i_7_n_0\
    );
\addRenormalizeShiftAmount[1]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8A8A8AAA8A8A8A8"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[1]_i_11_n_0\,
      I1 => \addPostAddMantissa1_reg_n_0_[16]\,
      I2 => \addPostAddMantissa1_reg_n_0_[17]\,
      I3 => \addPostAddMantissa1_reg_n_0_[15]\,
      I4 => \addPostAddMantissa1_reg_n_0_[14]\,
      I5 => \addRenormalizeShiftAmount[1]_i_12_n_0\,
      O => \addRenormalizeShiftAmount[1]_i_8_n_0\
    );
\addRenormalizeShiftAmount[1]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(10),
      I1 => \ADDStage2.postAddMantissa0\(11),
      O => \addRenormalizeShiftAmount[1]_i_9_n_0\
    );
\addRenormalizeShiftAmount[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000E0000"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[2]_i_2_n_0\,
      I1 => \addRenormalizeShiftAmount[2]_i_3_n_0\,
      I2 => \ADDStage2.postAddMantissa0\(22),
      I3 => \ADDStage2.postAddMantissa0\(20),
      I4 => \addRenormalizeShiftAmount[2]_i_5_n_0\,
      I5 => \addRenormalizeShiftAmount[2]_i_6_n_0\,
      O => \addRenormalizeShiftAmount[2]_i_1_n_0\
    );
\addRenormalizeShiftAmount[2]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[22]\,
      O => \addRenormalizeShiftAmount[2]_i_10_n_0\
    );
\addRenormalizeShiftAmount[2]_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[21]\,
      O => \addRenormalizeShiftAmount[2]_i_11_n_0\
    );
\addRenormalizeShiftAmount[2]_i_12\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[20]\,
      O => \addRenormalizeShiftAmount[2]_i_12_n_0\
    );
\addRenormalizeShiftAmount[2]_i_13\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[19]\,
      O => \addRenormalizeShiftAmount[2]_i_13_n_0\
    );
\addRenormalizeShiftAmount[2]_i_14\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[18]\,
      O => \addRenormalizeShiftAmount[2]_i_14_n_0\
    );
\addRenormalizeShiftAmount[2]_i_15\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[17]\,
      O => \addRenormalizeShiftAmount[2]_i_15_n_0\
    );
\addRenormalizeShiftAmount[2]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[22]\,
      I1 => \addPostAddMantissa1_reg_n_0_[20]\,
      I2 => \addPostAddMantissa1_reg_n_0_[21]\,
      I3 => \addPostAddMantissa1_reg_n_0_[25]\,
      I4 => \addPostAddMantissa1_reg_n_0_[24]\,
      I5 => \addPostAddMantissa1_reg_n_0_[23]\,
      O => \addRenormalizeShiftAmount[2]_i_16_n_0\
    );
\addRenormalizeShiftAmount[2]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAAAAB"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[4]_i_11_n_0\,
      I1 => \addPostAddMantissa1_reg_n_0_[7]\,
      I2 => \addPostAddMantissa1_reg_n_0_[6]\,
      I3 => \addPostAddMantissa1_reg_n_0_[5]\,
      I4 => \addPostAddMantissa1_reg_n_0_[4]\,
      I5 => \addRenormalizeShiftAmount[2]_i_18_n_0\,
      O => \addRenormalizeShiftAmount[2]_i_17_n_0\
    );
\addRenormalizeShiftAmount[2]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[14]\,
      I1 => \addPostAddMantissa1_reg_n_0_[12]\,
      I2 => \addPostAddMantissa1_reg_n_0_[15]\,
      I3 => \addPostAddMantissa1_reg_n_0_[13]\,
      O => \addRenormalizeShiftAmount[2]_i_18_n_0\
    );
\addRenormalizeShiftAmount[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAAAAB"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[4]_i_10_n_0\,
      I1 => \ADDStage2.postAddMantissa0\(7),
      I2 => \ADDStage2.postAddMantissa0\(6),
      I3 => \ADDStage2.postAddMantissa0\(5),
      I4 => \ADDStage2.postAddMantissa0\(4),
      I5 => \addRenormalizeShiftAmount[2]_i_7_n_0\,
      O => \addRenormalizeShiftAmount[2]_i_2_n_0\
    );
\addRenormalizeShiftAmount[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(18),
      I1 => \ADDStage2.postAddMantissa0\(16),
      I2 => \ADDStage2.postAddMantissa0\(19),
      I3 => \ADDStage2.postAddMantissa0\(17),
      O => \addRenormalizeShiftAmount[2]_i_3_n_0\
    );
\addRenormalizeShiftAmount[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(23),
      I1 => \addPostAddMantissa1_reg_n_0_[25]\,
      I2 => \ADDStage2.postAddMantissa0\(24),
      I3 => \ADDStage2.postAddMantissa0\(21),
      O => \addRenormalizeShiftAmount[2]_i_5_n_0\
    );
\addRenormalizeShiftAmount[2]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA8"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[2]_i_16_n_0\,
      I1 => \addPostAddMantissa1_reg_n_0_[18]\,
      I2 => \addPostAddMantissa1_reg_n_0_[16]\,
      I3 => \addPostAddMantissa1_reg_n_0_[19]\,
      I4 => \addPostAddMantissa1_reg_n_0_[17]\,
      I5 => \addRenormalizeShiftAmount[2]_i_17_n_0\,
      O => \addRenormalizeShiftAmount[2]_i_6_n_0\
    );
\addRenormalizeShiftAmount[2]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(14),
      I1 => \ADDStage2.postAddMantissa0\(12),
      I2 => \ADDStage2.postAddMantissa0\(15),
      I3 => \ADDStage2.postAddMantissa0\(13),
      O => \addRenormalizeShiftAmount[2]_i_7_n_0\
    );
\addRenormalizeShiftAmount[2]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[24]\,
      O => \addRenormalizeShiftAmount[2]_i_8_n_0\
    );
\addRenormalizeShiftAmount[2]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[23]\,
      O => \addRenormalizeShiftAmount[2]_i_9_n_0\
    );
\addRenormalizeShiftAmount[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF80808080808080"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[4]_i_4_n_0\,
      I1 => \addRenormalizeShiftAmount[4]_i_5_n_0\,
      I2 => \addRenormalizeShiftAmount[4]_i_6_n_0\,
      I3 => \addRenormalizeShiftAmount[4]_i_7_n_0\,
      I4 => \addRenormalizeShiftAmount[4]_i_8_n_0\,
      I5 => \addRenormalizeShiftAmount[4]_i_9_n_0\,
      O => \addRenormalizeShiftAmount[3]_i_1_n_0\
    );
\addRenormalizeShiftAmount[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => addPipelineValidStage1,
      I1 => \addRenormalizeShiftAmount[4]_i_3_n_0\,
      I2 => addEarlyOutBypassEnable1_reg_n_0,
      I3 => addSameNumberDifferentSigns1_reg_n_0,
      O => addPostAddMantissa(0)
    );
\addRenormalizeShiftAmount[4]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(11),
      I1 => \ADDStage2.postAddMantissa0\(10),
      I2 => \ADDStage2.postAddMantissa0\(9),
      I3 => \ADDStage2.postAddMantissa0\(8),
      O => \addRenormalizeShiftAmount[4]_i_10_n_0\
    );
\addRenormalizeShiftAmount[4]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[11]\,
      I1 => \addPostAddMantissa1_reg_n_0_[10]\,
      I2 => \addPostAddMantissa1_reg_n_0_[9]\,
      I3 => \addPostAddMantissa1_reg_n_0_[8]\,
      O => \addRenormalizeShiftAmount[4]_i_11_n_0\
    );
\addRenormalizeShiftAmount[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08080808FF080808"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[4]_i_4_n_0\,
      I1 => \addRenormalizeShiftAmount[4]_i_5_n_0\,
      I2 => \addRenormalizeShiftAmount[4]_i_6_n_0\,
      I3 => \addRenormalizeShiftAmount[4]_i_7_n_0\,
      I4 => \addRenormalizeShiftAmount[4]_i_8_n_0\,
      I5 => \addRenormalizeShiftAmount[4]_i_9_n_0\,
      O => \addRenormalizeShiftAmount[4]_i_2_n_0\
    );
\addRenormalizeShiftAmount[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFF47FFFF"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(24),
      I1 => \addPostAddMantissa1_reg_n_0_[25]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addMaxVal1_reg_n_0_[23]\,
      I4 => \addMaxVal1_reg_n_0_[30]\,
      I5 => \addFinalExp[7]_i_2_n_0\,
      O => \addRenormalizeShiftAmount[4]_i_3_n_0\
    );
\addRenormalizeShiftAmount[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000010"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(21),
      I1 => \ADDStage2.postAddMantissa0\(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => \ADDStage2.postAddMantissa0\(23),
      I4 => \ADDStage2.postAddMantissa0\(19),
      I5 => \ADDStage2.postAddMantissa0\(17),
      O => \addRenormalizeShiftAmount[4]_i_4_n_0\
    );
\addRenormalizeShiftAmount[4]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(20),
      I1 => \ADDStage2.postAddMantissa0\(16),
      I2 => \ADDStage2.postAddMantissa0\(22),
      I3 => \ADDStage2.postAddMantissa0\(18),
      O => \addRenormalizeShiftAmount[4]_i_5_n_0\
    );
\addRenormalizeShiftAmount[4]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \ADDStage2.postAddMantissa0\(13),
      I1 => \ADDStage2.postAddMantissa0\(15),
      I2 => \ADDStage2.postAddMantissa0\(12),
      I3 => \ADDStage2.postAddMantissa0\(14),
      I4 => \addRenormalizeShiftAmount[4]_i_10_n_0\,
      O => \addRenormalizeShiftAmount[4]_i_6_n_0\
    );
\addRenormalizeShiftAmount[4]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[21]\,
      I1 => \addPostAddMantissa1_reg_n_0_[25]\,
      I2 => \addPostAddMantissa1_reg_n_0_[24]\,
      I3 => \addPostAddMantissa1_reg_n_0_[23]\,
      I4 => \addPostAddMantissa1_reg_n_0_[19]\,
      I5 => \addPostAddMantissa1_reg_n_0_[17]\,
      O => \addRenormalizeShiftAmount[4]_i_7_n_0\
    );
\addRenormalizeShiftAmount[4]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[20]\,
      I1 => \addPostAddMantissa1_reg_n_0_[16]\,
      I2 => \addPostAddMantissa1_reg_n_0_[22]\,
      I3 => \addPostAddMantissa1_reg_n_0_[18]\,
      O => \addRenormalizeShiftAmount[4]_i_8_n_0\
    );
\addRenormalizeShiftAmount[4]_i_9\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \addPostAddMantissa1_reg_n_0_[13]\,
      I1 => \addPostAddMantissa1_reg_n_0_[15]\,
      I2 => \addPostAddMantissa1_reg_n_0_[12]\,
      I3 => \addPostAddMantissa1_reg_n_0_[14]\,
      I4 => \addRenormalizeShiftAmount[4]_i_11_n_0\,
      O => \addRenormalizeShiftAmount[4]_i_9_n_0\
    );
\addRenormalizeShiftAmount_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addRenormalizeShiftAmount[0]_i_1_n_0\,
      Q => R(0),
      R => '0'
    );
\addRenormalizeShiftAmount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addRenormalizeShiftAmount[1]_i_1_n_0\,
      Q => R(1),
      R => '0'
    );
\addRenormalizeShiftAmount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addRenormalizeShiftAmount[2]_i_1_n_0\,
      Q => R(2),
      R => '0'
    );
\addRenormalizeShiftAmount_reg[2]_i_4\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa_reg[16]_i_2_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_addRenormalizeShiftAmount_reg[2]_i_4_CO_UNCONNECTED\(7),
      CO(6) => \addRenormalizeShiftAmount_reg[2]_i_4_n_1\,
      CO(5) => \addRenormalizeShiftAmount_reg[2]_i_4_n_2\,
      CO(4) => \addRenormalizeShiftAmount_reg[2]_i_4_n_3\,
      CO(3) => \addRenormalizeShiftAmount_reg[2]_i_4_n_4\,
      CO(2) => \addRenormalizeShiftAmount_reg[2]_i_4_n_5\,
      CO(1) => \addRenormalizeShiftAmount_reg[2]_i_4_n_6\,
      CO(0) => \addRenormalizeShiftAmount_reg[2]_i_4_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \ADDStage2.postAddMantissa0\(24 downto 17),
      S(7) => \addRenormalizeShiftAmount[2]_i_8_n_0\,
      S(6) => \addRenormalizeShiftAmount[2]_i_9_n_0\,
      S(5) => \addRenormalizeShiftAmount[2]_i_10_n_0\,
      S(4) => \addRenormalizeShiftAmount[2]_i_11_n_0\,
      S(3) => \addRenormalizeShiftAmount[2]_i_12_n_0\,
      S(2) => \addRenormalizeShiftAmount[2]_i_13_n_0\,
      S(1) => \addRenormalizeShiftAmount[2]_i_14_n_0\,
      S(0) => \addRenormalizeShiftAmount[2]_i_15_n_0\
    );
\addRenormalizeShiftAmount_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addRenormalizeShiftAmount[3]_i_1_n_0\,
      Q => R(3),
      R => '0'
    );
\addRenormalizeShiftAmount_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa(0),
      D => \addRenormalizeShiftAmount[4]_i_2_n_0\,
      Q => R(4),
      R => '0'
    );
addSameNumberDifferentSigns00_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => addSameNumberDifferentSigns00_carry_n_0,
      CO(6) => addSameNumberDifferentSigns00_carry_n_1,
      CO(5) => addSameNumberDifferentSigns00_carry_n_2,
      CO(4) => addSameNumberDifferentSigns00_carry_n_3,
      CO(3) => addSameNumberDifferentSigns00_carry_n_4,
      CO(2) => addSameNumberDifferentSigns00_carry_n_5,
      CO(1) => addSameNumberDifferentSigns00_carry_n_6,
      CO(0) => addSameNumberDifferentSigns00_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => NLW_addSameNumberDifferentSigns00_carry_O_UNCONNECTED(7 downto 0),
      S(7) => addSameNumberDifferentSigns00_carry_i_1_n_0,
      S(6) => addSameNumberDifferentSigns00_carry_i_2_n_0,
      S(5) => addSameNumberDifferentSigns00_carry_i_3_n_0,
      S(4) => addSameNumberDifferentSigns00_carry_i_4_n_0,
      S(3) => addSameNumberDifferentSigns00_carry_i_5_n_0,
      S(2) => addSameNumberDifferentSigns00_carry_i_6_n_0,
      S(1) => addSameNumberDifferentSigns00_carry_i_7_n_0,
      S(0) => addSameNumberDifferentSigns00_carry_i_8_n_0
    );
\addSameNumberDifferentSigns00_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => addSameNumberDifferentSigns00_carry_n_0,
      CI_TOP => '0',
      CO(7 downto 3) => \NLW_addSameNumberDifferentSigns00_carry__0_CO_UNCONNECTED\(7 downto 3),
      CO(2) => addSameNumberDifferentSigns00,
      CO(1) => \addSameNumberDifferentSigns00_carry__0_n_6\,
      CO(0) => \addSameNumberDifferentSigns00_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \NLW_addSameNumberDifferentSigns00_carry__0_O_UNCONNECTED\(7 downto 0),
      S(7 downto 3) => B"00000",
      S(2) => \addSameNumberDifferentSigns00_carry__0_i_1_n_0\,
      S(1) => \addSameNumberDifferentSigns00_carry__0_i_2_n_0\,
      S(0) => \addSameNumberDifferentSigns00_carry__0_i_3_n_0\
    );
\addSameNumberDifferentSigns00_carry__0_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"D2DD"
    )
        port map (
      I0 => IN_B(30),
      I1 => \comBIsDenormal__6\,
      I2 => \comAIsDenormal__6\,
      I3 => IN_A(30),
      O => \addSameNumberDifferentSigns00_carry__0_i_1_n_0\
    );
\addSameNumberDifferentSigns00_carry__0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0F06050"
    )
        port map (
      I0 => IN_B(29),
      I1 => \comAIsDenormal__6\,
      I2 => \addSameNumberDifferentSigns00_carry__0_i_4_n_0\,
      I3 => IN_A(29),
      I4 => \comBIsDenormal__6\,
      O => \addSameNumberDifferentSigns00_carry__0_i_2_n_0\
    );
\addSameNumberDifferentSigns00_carry__0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0F06050"
    )
        port map (
      I0 => IN_B(26),
      I1 => \comAIsDenormal__6\,
      I2 => \addSameNumberDifferentSigns00_carry__0_i_5_n_0\,
      I3 => IN_A(26),
      I4 => \comBIsDenormal__6\,
      O => \addSameNumberDifferentSigns00_carry__0_i_3_n_0\
    );
\addSameNumberDifferentSigns00_carry__0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF003305059009"
    )
        port map (
      I0 => IN_A(27),
      I1 => IN_B(27),
      I2 => IN_A(28),
      I3 => IN_B(28),
      I4 => \comBIsDenormal__6\,
      I5 => \comAIsDenormal__6\,
      O => \addSameNumberDifferentSigns00_carry__0_i_4_n_0\
    );
\addSameNumberDifferentSigns00_carry__0_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF003305059009"
    )
        port map (
      I0 => IN_A(24),
      I1 => IN_B(24),
      I2 => IN_A(25),
      I3 => IN_B(25),
      I4 => \comBIsDenormal__6\,
      I5 => \comAIsDenormal__6\,
      O => \addSameNumberDifferentSigns00_carry__0_i_5_n_0\
    );
addSameNumberDifferentSigns00_carry_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0F06050"
    )
        port map (
      I0 => IN_B(23),
      I1 => \comAIsDenormal__6\,
      I2 => addSameNumberDifferentSigns00_carry_i_9_n_0,
      I3 => IN_A(23),
      I4 => \comBIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_1_n_0
    );
addSameNumberDifferentSigns00_carry_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF003305059009"
    )
        port map (
      I0 => IN_A(18),
      I1 => IN_B(18),
      I2 => IN_A(19),
      I3 => IN_B(19),
      I4 => \comBIsDenormal__6\,
      I5 => \comAIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_10_n_0
    );
addSameNumberDifferentSigns00_carry_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF003305059009"
    )
        port map (
      I0 => IN_A(15),
      I1 => IN_B(15),
      I2 => IN_A(16),
      I3 => IN_B(16),
      I4 => \comBIsDenormal__6\,
      I5 => \comAIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_11_n_0
    );
addSameNumberDifferentSigns00_carry_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF003305059009"
    )
        port map (
      I0 => IN_A(12),
      I1 => IN_B(12),
      I2 => IN_A(13),
      I3 => IN_B(13),
      I4 => \comBIsDenormal__6\,
      I5 => \comAIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_12_n_0
    );
addSameNumberDifferentSigns00_carry_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF003305059009"
    )
        port map (
      I0 => IN_A(9),
      I1 => IN_B(9),
      I2 => IN_A(10),
      I3 => IN_B(10),
      I4 => \comBIsDenormal__6\,
      I5 => \comAIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_13_n_0
    );
addSameNumberDifferentSigns00_carry_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF003305059009"
    )
        port map (
      I0 => IN_A(6),
      I1 => IN_B(6),
      I2 => IN_A(7),
      I3 => IN_B(7),
      I4 => \comBIsDenormal__6\,
      I5 => \comAIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_14_n_0
    );
addSameNumberDifferentSigns00_carry_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF003305059009"
    )
        port map (
      I0 => IN_A(3),
      I1 => IN_B(3),
      I2 => IN_A(4),
      I3 => IN_B(4),
      I4 => \comBIsDenormal__6\,
      I5 => \comAIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_15_n_0
    );
addSameNumberDifferentSigns00_carry_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF003305059009"
    )
        port map (
      I0 => IN_A(0),
      I1 => IN_B(0),
      I2 => IN_A(1),
      I3 => IN_B(1),
      I4 => \comBIsDenormal__6\,
      I5 => \comAIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_16_n_0
    );
addSameNumberDifferentSigns00_carry_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0F06050"
    )
        port map (
      I0 => IN_B(20),
      I1 => \comAIsDenormal__6\,
      I2 => addSameNumberDifferentSigns00_carry_i_10_n_0,
      I3 => IN_A(20),
      I4 => \comBIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_2_n_0
    );
addSameNumberDifferentSigns00_carry_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0F06050"
    )
        port map (
      I0 => IN_B(17),
      I1 => \comAIsDenormal__6\,
      I2 => addSameNumberDifferentSigns00_carry_i_11_n_0,
      I3 => IN_A(17),
      I4 => \comBIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_3_n_0
    );
addSameNumberDifferentSigns00_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0F06050"
    )
        port map (
      I0 => IN_B(14),
      I1 => \comAIsDenormal__6\,
      I2 => addSameNumberDifferentSigns00_carry_i_12_n_0,
      I3 => IN_A(14),
      I4 => \comBIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_4_n_0
    );
addSameNumberDifferentSigns00_carry_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0F06050"
    )
        port map (
      I0 => IN_B(11),
      I1 => \comAIsDenormal__6\,
      I2 => addSameNumberDifferentSigns00_carry_i_13_n_0,
      I3 => IN_A(11),
      I4 => \comBIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_5_n_0
    );
addSameNumberDifferentSigns00_carry_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0F06050"
    )
        port map (
      I0 => IN_B(8),
      I1 => \comAIsDenormal__6\,
      I2 => addSameNumberDifferentSigns00_carry_i_14_n_0,
      I3 => IN_A(8),
      I4 => \comBIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_6_n_0
    );
addSameNumberDifferentSigns00_carry_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0F06050"
    )
        port map (
      I0 => IN_B(5),
      I1 => \comAIsDenormal__6\,
      I2 => addSameNumberDifferentSigns00_carry_i_15_n_0,
      I3 => IN_A(5),
      I4 => \comBIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_7_n_0
    );
addSameNumberDifferentSigns00_carry_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"C0F06050"
    )
        port map (
      I0 => IN_B(2),
      I1 => \comAIsDenormal__6\,
      I2 => addSameNumberDifferentSigns00_carry_i_16_n_0,
      I3 => IN_A(2),
      I4 => \comBIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_8_n_0
    );
addSameNumberDifferentSigns00_carry_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF003305059009"
    )
        port map (
      I0 => IN_A(21),
      I1 => IN_B(21),
      I2 => IN_A(22),
      I3 => IN_B(22),
      I4 => \comBIsDenormal__6\,
      I5 => \comAIsDenormal__6\,
      O => addSameNumberDifferentSigns00_carry_i_9_n_0
    );
addSameNumberDifferentSigns0_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => addSameNumberDifferentSigns00,
      Q => addSameNumberDifferentSigns0,
      R => '0'
    );
addSameNumberDifferentSigns1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF28FF00002800"
    )
        port map (
      I0 => addSameNumberDifferentSigns0,
      I1 => p_0_in,
      I2 => p_1_in,
      I3 => addPipelineValidStage0,
      I4 => \addEarlyOutBypassEnable0__0\,
      I5 => addSameNumberDifferentSigns1_reg_n_0,
      O => addSameNumberDifferentSigns1_i_1_n_0
    );
addSameNumberDifferentSigns1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => addSameNumberDifferentSigns1_i_1_n_0,
      Q => addSameNumberDifferentSigns1_reg_n_0,
      R => '0'
    );
comALessThanB0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => comALessThanB0_carry_n_0,
      CO(6) => comALessThanB0_carry_n_1,
      CO(5) => comALessThanB0_carry_n_2,
      CO(4) => comALessThanB0_carry_n_3,
      CO(3) => comALessThanB0_carry_n_4,
      CO(2) => comALessThanB0_carry_n_5,
      CO(1) => comALessThanB0_carry_n_6,
      CO(0) => comALessThanB0_carry_n_7,
      DI(7) => comALessThanB0_carry_i_1_n_0,
      DI(6) => \comALessThanB0_carry_i_2__0_n_0\,
      DI(5) => comALessThanB0_carry_i_3_n_0,
      DI(4) => \comALessThanB0_carry_i_4__0_n_0\,
      DI(3) => \comALessThanB0_carry_i_5__0_n_0\,
      DI(2) => comALessThanB0_carry_i_6_n_0,
      DI(1) => comALessThanB0_carry_i_7_n_0,
      DI(0) => comALessThanB0_carry_i_8_n_0,
      O(7 downto 0) => NLW_comALessThanB0_carry_O_UNCONNECTED(7 downto 0),
      S(7) => comALessThanB0_carry_i_9_n_0,
      S(6) => \comALessThanB0_carry_i_10__0_n_0\,
      S(5) => comALessThanB0_carry_i_11_n_0,
      S(4) => \comALessThanB0_carry_i_12__0_n_0\,
      S(3) => comALessThanB0_carry_i_13_n_0,
      S(2) => comALessThanB0_carry_i_14_n_0,
      S(1) => comALessThanB0_carry_i_15_n_0,
      S(0) => comALessThanB0_carry_i_16_n_0
    );
\comALessThanB0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => comALessThanB0_carry_n_0,
      CI_TOP => '0',
      CO(7) => comALessThanB,
      CO(6) => \comALessThanB0_carry__0_n_1\,
      CO(5) => \comALessThanB0_carry__0_n_2\,
      CO(4) => \comALessThanB0_carry__0_n_3\,
      CO(3) => \comALessThanB0_carry__0_n_4\,
      CO(2) => \comALessThanB0_carry__0_n_5\,
      CO(1) => \comALessThanB0_carry__0_n_6\,
      CO(0) => \comALessThanB0_carry__0_n_7\,
      DI(7) => \comALessThanB0_carry_i_1__0_n_0\,
      DI(6) => comALessThanB0_carry_i_2_n_0,
      DI(5) => \comALessThanB0_carry_i_3__0_n_0\,
      DI(4) => comALessThanB0_carry_i_4_n_0,
      DI(3) => comALessThanB0_carry_i_5_n_0,
      DI(2) => \comALessThanB0_carry_i_6__0_n_0\,
      DI(1) => \comALessThanB0_carry_i_7__0_n_0\,
      DI(0) => \comALessThanB0_carry_i_8__0_n_0\,
      O(7 downto 0) => \NLW_comALessThanB0_carry__0_O_UNCONNECTED\(7 downto 0),
      S(7) => \comALessThanB0_carry_i_9__0_n_0\,
      S(6) => comALessThanB0_carry_i_10_n_0,
      S(5) => \comALessThanB0_carry_i_11__0_n_0\,
      S(4) => comALessThanB0_carry_i_12_n_0,
      S(3) => \comALessThanB0_carry_i_13__0_n_0\,
      S(2) => \comALessThanB0_carry_i_14__0_n_0\,
      S(1) => \comALessThanB0_carry_i_15__0_n_0\,
      S(0) => \comALessThanB0_carry_i_16__0_n_0\
    );
comALessThanB0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(15),
      I1 => IN_A(15),
      I2 => IN_B(14),
      I3 => IN_A(14),
      O => comALessThanB0_carry_i_1_n_0
    );
comALessThanB0_carry_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8421"
    )
        port map (
      I0 => IN_B(29),
      I1 => IN_B(28),
      I2 => IN_A(29),
      I3 => IN_A(28),
      O => comALessThanB0_carry_i_10_n_0
    );
\comALessThanB0_carry_i_10__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(12),
      I1 => IN_B(12),
      I2 => IN_B(13),
      I3 => IN_A(13),
      O => \comALessThanB0_carry_i_10__0_n_0\
    );
comALessThanB0_carry_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(10),
      I1 => IN_B(10),
      I2 => IN_B(11),
      I3 => IN_A(11),
      O => comALessThanB0_carry_i_11_n_0
    );
\comALessThanB0_carry_i_11__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(27),
      I1 => IN_B(27),
      I2 => IN_B(26),
      I3 => IN_A(26),
      O => \comALessThanB0_carry_i_11__0_n_0\
    );
comALessThanB0_carry_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8421"
    )
        port map (
      I0 => IN_B(24),
      I1 => IN_B(25),
      I2 => IN_A(24),
      I3 => IN_A(25),
      O => comALessThanB0_carry_i_12_n_0
    );
\comALessThanB0_carry_i_12__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(8),
      I1 => IN_B(8),
      I2 => IN_B(9),
      I3 => IN_A(9),
      O => \comALessThanB0_carry_i_12__0_n_0\
    );
comALessThanB0_carry_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(6),
      I1 => IN_B(6),
      I2 => IN_B(7),
      I3 => IN_A(7),
      O => comALessThanB0_carry_i_13_n_0
    );
\comALessThanB0_carry_i_13__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_B(23),
      I1 => IN_A(23),
      I2 => IN_B(22),
      I3 => IN_A(22),
      O => \comALessThanB0_carry_i_13__0_n_0\
    );
comALessThanB0_carry_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(4),
      I1 => IN_B(4),
      I2 => IN_B(5),
      I3 => IN_A(5),
      O => comALessThanB0_carry_i_14_n_0
    );
\comALessThanB0_carry_i_14__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(20),
      I1 => IN_B(20),
      I2 => IN_B(21),
      I3 => IN_A(21),
      O => \comALessThanB0_carry_i_14__0_n_0\
    );
comALessThanB0_carry_i_15: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(2),
      I1 => IN_B(2),
      I2 => IN_B(3),
      I3 => IN_A(3),
      O => comALessThanB0_carry_i_15_n_0
    );
\comALessThanB0_carry_i_15__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(18),
      I1 => IN_B(18),
      I2 => IN_B(19),
      I3 => IN_A(19),
      O => \comALessThanB0_carry_i_15__0_n_0\
    );
comALessThanB0_carry_i_16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(0),
      I1 => IN_B(0),
      I2 => IN_B(1),
      I3 => IN_A(1),
      O => comALessThanB0_carry_i_16_n_0
    );
\comALessThanB0_carry_i_16__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(16),
      I1 => IN_B(16),
      I2 => IN_B(17),
      I3 => IN_A(17),
      O => \comALessThanB0_carry_i_16__0_n_0\
    );
\comALessThanB0_carry_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(30),
      I1 => IN_A(30),
      O => \comALessThanB0_carry_i_1__0_n_0\
    );
comALessThanB0_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7510"
    )
        port map (
      I0 => IN_A(29),
      I1 => IN_A(28),
      I2 => IN_B(28),
      I3 => IN_B(29),
      O => comALessThanB0_carry_i_2_n_0
    );
\comALessThanB0_carry_i_2__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(13),
      I1 => IN_A(13),
      I2 => IN_B(12),
      I3 => IN_A(12),
      O => \comALessThanB0_carry_i_2__0_n_0\
    );
comALessThanB0_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(11),
      I1 => IN_A(11),
      I2 => IN_B(10),
      I3 => IN_A(10),
      O => comALessThanB0_carry_i_3_n_0
    );
\comALessThanB0_carry_i_3__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(27),
      I1 => IN_A(27),
      I2 => IN_B(26),
      I3 => IN_A(26),
      O => \comALessThanB0_carry_i_3__0_n_0\
    );
comALessThanB0_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7510"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_A(24),
      I2 => IN_B(24),
      I3 => IN_B(25),
      O => comALessThanB0_carry_i_4_n_0
    );
\comALessThanB0_carry_i_4__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(9),
      I1 => IN_A(9),
      I2 => IN_B(8),
      I3 => IN_A(8),
      O => \comALessThanB0_carry_i_4__0_n_0\
    );
comALessThanB0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2F02"
    )
        port map (
      I0 => IN_B(22),
      I1 => IN_A(22),
      I2 => IN_A(23),
      I3 => IN_B(23),
      O => comALessThanB0_carry_i_5_n_0
    );
\comALessThanB0_carry_i_5__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(7),
      I1 => IN_A(7),
      I2 => IN_B(6),
      I3 => IN_A(6),
      O => \comALessThanB0_carry_i_5__0_n_0\
    );
comALessThanB0_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(5),
      I1 => IN_A(5),
      I2 => IN_B(4),
      I3 => IN_A(4),
      O => comALessThanB0_carry_i_6_n_0
    );
\comALessThanB0_carry_i_6__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(21),
      I1 => IN_A(21),
      I2 => IN_B(20),
      I3 => IN_A(20),
      O => \comALessThanB0_carry_i_6__0_n_0\
    );
comALessThanB0_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(3),
      I1 => IN_A(3),
      I2 => IN_B(2),
      I3 => IN_A(2),
      O => comALessThanB0_carry_i_7_n_0
    );
\comALessThanB0_carry_i_7__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(19),
      I1 => IN_A(19),
      I2 => IN_B(18),
      I3 => IN_A(18),
      O => \comALessThanB0_carry_i_7__0_n_0\
    );
comALessThanB0_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(1),
      I1 => IN_A(1),
      I2 => IN_B(0),
      I3 => IN_A(0),
      O => comALessThanB0_carry_i_8_n_0
    );
\comALessThanB0_carry_i_8__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(17),
      I1 => IN_A(17),
      I2 => IN_B(16),
      I3 => IN_A(16),
      O => \comALessThanB0_carry_i_8__0_n_0\
    );
comALessThanB0_carry_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(14),
      I1 => IN_B(14),
      I2 => IN_B(15),
      I3 => IN_A(15),
      O => comALessThanB0_carry_i_9_n_0
    );
\comALessThanB0_carry_i_9__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => IN_A(30),
      I1 => IN_B(30),
      O => \comALessThanB0_carry_i_9__0_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_StandaloneFloatALU_A_0_1 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OADD : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IADD_GO : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_StandaloneFloatALU_A_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_StandaloneFloatALU_A_0_1 : entity is "MainDesign_StandaloneFloatALU_A_0_1,StandaloneFloatALU_ADD,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_StandaloneFloatALU_A_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_StandaloneFloatALU_A_0_1 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_StandaloneFloatALU_A_0_1 : entity is "StandaloneFloatALU_ADD,Vivado 2025.2";
end MainDesign_StandaloneFloatALU_A_0_1;

architecture STRUCTURE of MainDesign_StandaloneFloatALU_A_0_1 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
begin
U0: entity work.MainDesign_StandaloneFloatALU_A_0_1_StandaloneFloatALU_ADD
     port map (
      IADD_GO => IADD_GO,
      IN_A(31 downto 0) => IN_A(31 downto 0),
      IN_B(31 downto 0) => IN_B(31 downto 0),
      OADD(31 downto 0) => OADD(31 downto 0),
      clk => clk
    );
end STRUCTURE;
