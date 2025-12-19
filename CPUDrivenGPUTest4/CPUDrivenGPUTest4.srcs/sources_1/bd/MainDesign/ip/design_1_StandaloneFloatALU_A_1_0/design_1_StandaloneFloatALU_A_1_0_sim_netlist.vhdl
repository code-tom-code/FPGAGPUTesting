-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:53:55 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_StandaloneFloatALU_A_1_0/design_1_StandaloneFloatALU_A_1_0_sim_netlist.vhdl
-- Design      : design_1_StandaloneFloatALU_A_1_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_StandaloneFloatALU_A_1_0_StandaloneFloatALU_ADD is
  port (
    OADD : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IADD_GO : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_StandaloneFloatALU_A_1_0_StandaloneFloatALU_ADD : entity is "StandaloneFloatALU_ADD";
end design_1_StandaloneFloatALU_A_1_0_StandaloneFloatALU_ADD;

architecture STRUCTURE of design_1_StandaloneFloatALU_A_1_0_StandaloneFloatALU_ADD is
  signal GetFloatIsNegative : STD_LOGIC;
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
  signal \OADD_Temp[30]_i_2_n_0\ : STD_LOGIC;
  signal \OADD_Temp[31]_i_1_n_0\ : STD_LOGIC;
  signal addALessThanB : STD_LOGIC;
  signal \addDenormFlushedValA[0]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[10]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[11]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[12]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[13]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[14]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[15]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[16]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[17]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[18]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[19]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[1]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[20]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[21]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[22]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[22]_i_2_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[22]_i_3_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[2]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[3]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[4]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[5]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[6]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[7]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[8]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValA[9]_i_1_n_0\ : STD_LOGIC;
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
  signal \addDenormFlushedValB[0]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[10]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[11]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[12]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[13]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[14]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[15]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[16]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[17]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[18]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[19]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[1]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[20]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[21]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[22]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[22]_i_2_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[22]_i_3_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[2]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[3]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[4]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[5]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[6]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[7]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[8]_i_1_n_0\ : STD_LOGIC;
  signal \addDenormFlushedValB[9]_i_1_n_0\ : STD_LOGIC;
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
  signal \addEarlyOutBypass0[0]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[0]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[10]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[10]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[10]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[11]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[11]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[11]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[12]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[12]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[12]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[13]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[13]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[13]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[14]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[14]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[14]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[15]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[15]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[15]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[16]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[16]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[16]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[17]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[17]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[17]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[18]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[18]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[18]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[19]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[19]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[19]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[1]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[1]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[1]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[20]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[20]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[20]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[21]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[21]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[21]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[21]_i_4_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[22]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[22]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[22]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[22]_i_4_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[22]_i_5_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[22]_i_6_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[23]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[24]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[25]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[26]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[27]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[28]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[29]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[2]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[2]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[2]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[2]_i_4_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[2]_i_5_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[2]_i_6_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[30]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[30]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[30]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[30]_i_4_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_10_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_11_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_12_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_13_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_14_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_15_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_16_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_17_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_18_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_19_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_20_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_4_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_5_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_6_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_7_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_8_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[31]_i_9_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[3]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[3]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[3]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[4]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[4]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[4]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[5]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[5]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[5]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[5]_i_4_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[6]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[6]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[6]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[7]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[7]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[7]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[7]_i_4_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[7]_i_5_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[7]_i_6_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[8]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[8]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[8]_i_3_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[9]_i_1_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[9]_i_2_n_0\ : STD_LOGIC;
  signal \addEarlyOutBypass0[9]_i_3_n_0\ : STD_LOGIC;
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
  signal addEarlyOutBypassEnable0 : STD_LOGIC;
  signal addEarlyOutBypassEnable0_i_1_n_0 : STD_LOGIC;
  signal addEarlyOutBypassEnable1_i_1_n_0 : STD_LOGIC;
  signal addEarlyOutBypassEnable1_reg_n_0 : STD_LOGIC;
  signal addEarlyOutBypassEnable2_i_1_n_0 : STD_LOGIC;
  signal addEarlyOutBypassEnable2_reg_n_0 : STD_LOGIC;
  signal addExponentDeltaAMinusB : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal addExponentDeltaAMinusB0 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal addExponentDeltaAMinusBShiftTooFar : STD_LOGIC;
  signal addExponentDeltaAMinusBShiftTooFar_i_1_n_0 : STD_LOGIC;
  signal addExponentDeltaAMinusBShiftTooFar_i_2_n_0 : STD_LOGIC;
  signal addExponentDeltaAMinusBShiftTooFar_i_3_n_0 : STD_LOGIC;
  signal addExponentDeltaAMinusBShiftTooFar_i_4_n_0 : STD_LOGIC;
  signal addExponentDeltaAMinusBShiftTooFar_i_5_n_0 : STD_LOGIC;
  signal \addExponentDeltaAMinusB[4]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[4]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[4]_i_4_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[4]_i_5_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[4]_i_6_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[4]_i_7_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[5]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[5]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[5]_i_4_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[7]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[7]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[7]_i_4_n_0\ : STD_LOGIC;
  signal \addExponentDeltaAMinusB[7]_i_5_n_0\ : STD_LOGIC;
  signal addExponentDeltaBMinusA : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal addExponentDeltaBMinusA0 : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal addExponentDeltaBMinusAShiftTooFar : STD_LOGIC;
  signal addExponentDeltaBMinusAShiftTooFar_i_1_n_0 : STD_LOGIC;
  signal addExponentDeltaBMinusAShiftTooFar_i_2_n_0 : STD_LOGIC;
  signal addExponentDeltaBMinusAShiftTooFar_i_3_n_0 : STD_LOGIC;
  signal addExponentDeltaBMinusAShiftTooFar_i_4_n_0 : STD_LOGIC;
  signal \addExponentDeltaBMinusA[4]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[4]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[4]_i_4_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[4]_i_5_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[5]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[5]_i_3_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[7]_i_2_n_0\ : STD_LOGIC;
  signal \addExponentDeltaBMinusA[7]_i_3_n_0\ : STD_LOGIC;
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
  signal addMaxVal1 : STD_LOGIC;
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
  signal addPostAddMantissa : STD_LOGIC;
  signal addPostAddMantissa1 : STD_LOGIC;
  signal addPostAddMantissa10 : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal \addPostAddMantissa10_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_13_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_14_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_15_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_16_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_17_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_18_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_19_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_20_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_21_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_22_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_23_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_24_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_25_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_26_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_27_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_28_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_29_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_30_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_31_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_32_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_33_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_34_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_35_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_n_1\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_n_2\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_n_3\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__0_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_10_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_11_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_12_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_13_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_14_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_15_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_16_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_17_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_18_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_19_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_20_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_21_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_22_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_23_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_24_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_25_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_26_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_27_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_28_n_3\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_28_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_28_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_28_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_29_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_30_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_31_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_32_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_33_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_34_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_35_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_36_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_37_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_38_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_39_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_3_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_4_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_5_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_6_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_7_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_8_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_i_9_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_n_1\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_n_2\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_n_3\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__1_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__2_i_1_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__2_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa10_carry__2_n_7\ : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_100_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_101_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_102_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_103_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_104_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_105_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_106_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_107_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_108_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_109_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_10_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_110_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_111_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_112_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_113_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_114_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_11_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_12_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_13_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_14_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_15_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_16_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_17_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_18_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_19_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_20_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_21_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_22_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_23_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_24_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_25_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_26_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_27_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_28_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_29_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_2_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_30_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_31_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_32_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_33_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_34_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_35_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_36_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_37_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_38_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_39_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_3_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_40_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_41_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_42_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_43_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_44_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_45_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_46_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_47_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_48_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_49_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_4_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_50_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_51_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_52_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_53_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_54_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_55_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_56_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_57_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_58_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_59_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_5_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_60_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_61_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_62_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_63_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_64_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_65_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_66_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_67_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_68_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_69_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_6_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_70_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_71_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_72_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_73_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_74_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_75_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_76_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_76_n_1 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_76_n_2 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_76_n_3 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_76_n_5 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_76_n_6 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_76_n_7 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_77_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_77_n_1 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_77_n_2 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_77_n_3 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_77_n_5 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_77_n_6 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_77_n_7 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_78_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_79_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_7_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_80_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_81_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_82_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_83_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_84_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_85_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_86_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_87_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_88_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_89_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_8_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_90_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_91_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_92_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_93_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_94_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_95_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_96_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_97_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_98_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_99_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_i_9_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_n_0 : STD_LOGIC;
  signal addPostAddMantissa10_carry_n_1 : STD_LOGIC;
  signal addPostAddMantissa10_carry_n_2 : STD_LOGIC;
  signal addPostAddMantissa10_carry_n_3 : STD_LOGIC;
  signal addPostAddMantissa10_carry_n_5 : STD_LOGIC;
  signal addPostAddMantissa10_carry_n_6 : STD_LOGIC;
  signal addPostAddMantissa10_carry_n_7 : STD_LOGIC;
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
  signal \addPostAddMantissa_reg[16]_i_2_n_5\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[16]_i_2_n_6\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[16]_i_2_n_7\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_1\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_2\ : STD_LOGIC;
  signal \addPostAddMantissa_reg[8]_i_2_n_3\ : STD_LOGIC;
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
  signal addRenormalizeShiftAmount : STD_LOGIC_VECTOR ( 4 downto 0 );
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
  signal \addRenormalizeShiftAmount_reg[2]_i_4_n_5\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount_reg[2]_i_4_n_6\ : STD_LOGIC;
  signal \addRenormalizeShiftAmount_reg[2]_i_4_n_7\ : STD_LOGIC;
  signal addSameNumberDifferentSigns0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00 : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_n_6\ : STD_LOGIC;
  signal \addSameNumberDifferentSigns00_carry__0_n_7\ : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_10_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_11_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_12_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_13_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_14_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_i_15_n_0 : STD_LOGIC;
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
  signal addSameNumberDifferentSigns00_carry_n_5 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_n_6 : STD_LOGIC;
  signal addSameNumberDifferentSigns00_carry_n_7 : STD_LOGIC;
  signal addSameNumberDifferentSigns1_i_1_n_0 : STD_LOGIC;
  signal addSameNumberDifferentSigns1_reg_n_0 : STD_LOGIC;
  signal comALessThanB : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_10_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_11_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_12_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_13_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_14_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_15_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_16_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_2_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_3_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_4_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_5_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_6_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_7_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_8_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_i_9_n_0\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_1\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_2\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_3\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_5\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_6\ : STD_LOGIC;
  signal \comALessThanB0_carry__0_n_7\ : STD_LOGIC;
  signal comALessThanB0_carry_i_10_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_11_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_12_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_13_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_14_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_15_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_16_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_1_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_2_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_3_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_4_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_5_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_6_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_7_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_8_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_i_9_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_n_0 : STD_LOGIC;
  signal comALessThanB0_carry_n_1 : STD_LOGIC;
  signal comALessThanB0_carry_n_2 : STD_LOGIC;
  signal comALessThanB0_carry_n_3 : STD_LOGIC;
  signal comALessThanB0_carry_n_5 : STD_LOGIC;
  signal comALessThanB0_carry_n_6 : STD_LOGIC;
  signal comALessThanB0_carry_n_7 : STD_LOGIC;
  signal mantissaMin0 : STD_LOGIC_VECTOR ( 23 downto 1 );
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal postAddMantissa0 : STD_LOGIC_VECTOR ( 24 downto 1 );
  signal NLW_addPostAddMantissa10_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_addPostAddMantissa10_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_addPostAddMantissa10_carry__1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_addPostAddMantissa10_carry__1_i_28_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_addPostAddMantissa10_carry__1_i_28_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \NLW_addPostAddMantissa10_carry__2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_addPostAddMantissa10_carry__2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 2 );
  signal NLW_addPostAddMantissa10_carry_i_76_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_addPostAddMantissa10_carry_i_77_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_addPostAddMantissa_reg[16]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_addPostAddMantissa_reg[8]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_addRenormalizeShiftAmount_reg[2]_i_4_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal NLW_addSameNumberDifferentSigns00_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_addSameNumberDifferentSigns00_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_addSameNumberDifferentSigns00_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 3 );
  signal \NLW_addSameNumberDifferentSigns00_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_comALessThanB0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_comALessThanB0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_comALessThanB0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_comALessThanB0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \OADD[0]_i_2\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \OADD[11]_i_2\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \OADD[12]_i_2\ : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \OADD[13]_i_2\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of \OADD[14]_i_2\ : label is "soft_lutpair114";
  attribute SOFT_HLUTNM of \OADD[15]_i_2\ : label is "soft_lutpair113";
  attribute SOFT_HLUTNM of \OADD[15]_i_4\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \OADD[16]_i_2\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \OADD[16]_i_4\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \OADD[17]_i_2\ : label is "soft_lutpair122";
  attribute SOFT_HLUTNM of \OADD[17]_i_4\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \OADD[18]_i_2\ : label is "soft_lutpair115";
  attribute SOFT_HLUTNM of \OADD[19]_i_2\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \OADD[1]_i_2\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \OADD[20]_i_2\ : label is "soft_lutpair120";
  attribute SOFT_HLUTNM of \OADD[21]_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \OADD[22]_i_4\ : label is "soft_lutpair37";
  attribute SOFT_HLUTNM of \OADD[22]_i_5\ : label is "soft_lutpair35";
  attribute SOFT_HLUTNM of \OADD[22]_i_6\ : label is "soft_lutpair39";
  attribute SOFT_HLUTNM of \OADD[22]_i_8\ : label is "soft_lutpair40";
  attribute SOFT_HLUTNM of \OADD[22]_i_9\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \OADD[25]_i_2\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \OADD[26]_i_1\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \OADD[27]_i_2\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \OADD[28]_i_2\ : label is "soft_lutpair63";
  attribute SOFT_HLUTNM of \OADD[2]_i_2\ : label is "soft_lutpair60";
  attribute SOFT_HLUTNM of \OADD[2]_i_3\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \OADD[31]_i_8\ : label is "soft_lutpair99";
  attribute SOFT_HLUTNM of \OADD[31]_i_9\ : label is "soft_lutpair64";
  attribute SOFT_HLUTNM of \OADD[8]_i_3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \OADD_Temp[23]_i_1\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \OADD_Temp[24]_i_1\ : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of \OADD_Temp[25]_i_1\ : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of \OADD_Temp[26]_i_1\ : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of \OADD_Temp[27]_i_1\ : label is "soft_lutpair126";
  attribute SOFT_HLUTNM of \OADD_Temp[28]_i_1\ : label is "soft_lutpair125";
  attribute SOFT_HLUTNM of \OADD_Temp[29]_i_1\ : label is "soft_lutpair124";
  attribute SOFT_HLUTNM of \OADD_Temp[30]_i_2\ : label is "soft_lutpair123";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[0]_i_1\ : label is "soft_lutpair127";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[10]_i_1\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[11]_i_1\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[12]_i_1\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[13]_i_1\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[14]_i_1\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[15]_i_1\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[16]_i_1\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[17]_i_1\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[18]_i_1\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[19]_i_1\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[1]_i_1\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[20]_i_1\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[21]_i_1\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[22]_i_1\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[2]_i_1\ : label is "soft_lutpair128";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[3]_i_1\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[4]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[5]_i_1\ : label is "soft_lutpair128";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[6]_i_1\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[7]_i_1\ : label is "soft_lutpair127";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[8]_i_1\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \addDenormFlushedValA[9]_i_1\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[10]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[11]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[12]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[13]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[14]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[15]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[16]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[17]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[18]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[19]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[1]_i_1\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[20]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[21]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[22]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[22]_i_3\ : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[2]_i_1\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[3]_i_1\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[4]_i_1\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[5]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[6]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[7]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[8]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \addDenormFlushedValB[9]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[0]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[10]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[10]_i_3\ : label is "soft_lutpair96";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[11]_i_2\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[11]_i_3\ : label is "soft_lutpair95";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[12]_i_2\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[12]_i_3\ : label is "soft_lutpair70";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[13]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[13]_i_3\ : label is "soft_lutpair82";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[14]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[15]_i_2\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[16]_i_2\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[16]_i_3\ : label is "soft_lutpair74";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[17]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[17]_i_3\ : label is "soft_lutpair87";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[18]_i_2\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[19]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[1]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[20]_i_2\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[20]_i_3\ : label is "soft_lutpair93";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[21]_i_2\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[21]_i_3\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[21]_i_4\ : label is "soft_lutpair94";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[22]_i_3\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[22]_i_4\ : label is "soft_lutpair88";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[22]_i_6\ : label is "soft_lutpair112";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[23]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[24]_i_1\ : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[2]_i_3\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[2]_i_4\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[2]_i_5\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[2]_i_6\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[30]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[30]_i_4\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_11\ : label is "soft_lutpair77";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_15\ : label is "soft_lutpair72";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_16\ : label is "soft_lutpair73";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_17\ : label is "soft_lutpair78";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_18\ : label is "soft_lutpair89";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_2\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_20\ : label is "soft_lutpair76";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_5\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_6\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_7\ : label is "soft_lutpair85";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[31]_i_8\ : label is "soft_lutpair98";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[3]_i_2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[3]_i_3\ : label is "soft_lutpair84";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[4]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[5]_i_2\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[5]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[5]_i_4\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[6]_i_2\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[6]_i_3\ : label is "soft_lutpair90";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[7]_i_2\ : label is "soft_lutpair116";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[7]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[7]_i_4\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[7]_i_5\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[7]_i_6\ : label is "soft_lutpair83";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[8]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[8]_i_3\ : label is "soft_lutpair75";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[9]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \addEarlyOutBypass0[9]_i_3\ : label is "soft_lutpair97";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[0]_i_1\ : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[10]_i_1\ : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[11]_i_1\ : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[12]_i_1\ : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[13]_i_1\ : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[14]_i_1\ : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[15]_i_1\ : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[16]_i_1\ : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[17]_i_1\ : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[18]_i_1\ : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[19]_i_1\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[20]_i_1\ : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[21]_i_1\ : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[22]_i_1\ : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[2]_i_1\ : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[3]_i_1\ : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[7]_i_1\ : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[8]_i_1\ : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of \addEarlyOutBypass1[9]_i_1\ : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of addExponentDeltaAMinusBShiftTooFar_i_5 : label is "soft_lutpair86";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[0]_i_1\ : label is "soft_lutpair79";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[1]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[4]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[4]_i_4\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[4]_i_6\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[4]_i_7\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[5]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[5]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[5]_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[7]_i_3\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \addExponentDeltaAMinusB[7]_i_5\ : label is "soft_lutpair36";
  attribute SOFT_HLUTNM of addExponentDeltaBMinusAShiftTooFar_i_4 : label is "soft_lutpair80";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[1]_i_1\ : label is "soft_lutpair91";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[4]_i_1\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[4]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[4]_i_5\ : label is "soft_lutpair92";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[5]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[5]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[5]_i_3\ : label is "soft_lutpair71";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[7]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \addExponentDeltaBMinusA[7]_i_3\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \addFinalExp[0]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \addFinalExp[1]_i_1\ : label is "soft_lutpair68";
  attribute SOFT_HLUTNM of \addFinalExp[3]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \addFinalExp[4]_i_1\ : label is "soft_lutpair69";
  attribute SOFT_HLUTNM of \addFinalExp[5]_i_2\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \addMaxVal1[23]_i_1\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \addMaxVal1[24]_i_1\ : label is "soft_lutpair121";
  attribute SOFT_HLUTNM of \addMaxVal1[25]_i_1\ : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \addMaxVal1[26]_i_1\ : label is "soft_lutpair119";
  attribute SOFT_HLUTNM of \addMaxVal1[27]_i_1\ : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of \addMaxVal1[28]_i_1\ : label is "soft_lutpair118";
  attribute SOFT_HLUTNM of \addMaxVal1[29]_i_1\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \addMaxVal1[30]_i_2\ : label is "soft_lutpair117";
  attribute SOFT_HLUTNM of \addPostAddMantissa10_carry__0_i_18\ : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of \addPostAddMantissa10_carry__0_i_35\ : label is "soft_lutpair56";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_24 : label is "soft_lutpair38";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_25 : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_33 : label is "soft_lutpair61";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_75 : label is "soft_lutpair48";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_78 : label is "soft_lutpair43";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_82 : label is "soft_lutpair47";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_83 : label is "soft_lutpair42";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_84 : label is "soft_lutpair45";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_85 : label is "soft_lutpair53";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_86 : label is "soft_lutpair41";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_87 : label is "soft_lutpair58";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_88 : label is "soft_lutpair50";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_89 : label is "soft_lutpair54";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_90 : label is "soft_lutpair46";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_91 : label is "soft_lutpair52";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_92 : label is "soft_lutpair44";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_93 : label is "soft_lutpair59";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_94 : label is "soft_lutpair51";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_95 : label is "soft_lutpair55";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_96 : label is "soft_lutpair57";
  attribute SOFT_HLUTNM of addPostAddMantissa10_carry_i_97 : label is "soft_lutpair49";
  attribute SOFT_HLUTNM of \addPostAddMantissa[10]_i_1\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \addPostAddMantissa[10]_i_2\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \addPostAddMantissa[11]_i_2\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \addPostAddMantissa[12]_i_2\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \addPostAddMantissa[13]_i_2\ : label is "soft_lutpair106";
  attribute SOFT_HLUTNM of \addPostAddMantissa[14]_i_2\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \addPostAddMantissa[15]_i_2\ : label is "soft_lutpair110";
  attribute SOFT_HLUTNM of \addPostAddMantissa[16]_i_3\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \addPostAddMantissa[17]_i_2\ : label is "soft_lutpair107";
  attribute SOFT_HLUTNM of \addPostAddMantissa[18]_i_2\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \addPostAddMantissa[19]_i_2\ : label is "soft_lutpair108";
  attribute SOFT_HLUTNM of \addPostAddMantissa[1]_i_2\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \addPostAddMantissa[20]_i_2\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \addPostAddMantissa[21]_i_2\ : label is "soft_lutpair111";
  attribute SOFT_HLUTNM of \addPostAddMantissa[22]_i_1\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \addPostAddMantissa[22]_i_2\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \addPostAddMantissa[2]_i_2\ : label is "soft_lutpair104";
  attribute SOFT_HLUTNM of \addPostAddMantissa[3]_i_2\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \addPostAddMantissa[4]_i_2\ : label is "soft_lutpair105";
  attribute SOFT_HLUTNM of \addPostAddMantissa[5]_i_2\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \addPostAddMantissa[6]_i_2\ : label is "soft_lutpair100";
  attribute SOFT_HLUTNM of \addPostAddMantissa[7]_i_2\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \addPostAddMantissa[8]_i_3\ : label is "soft_lutpair101";
  attribute SOFT_HLUTNM of \addPostAddMantissa[9]_i_2\ : label is "soft_lutpair102";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[0]_i_13\ : label is "soft_lutpair103";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[1]_i_13\ : label is "soft_lutpair109";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[1]_i_3\ : label is "soft_lutpair66";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[1]_i_7\ : label is "soft_lutpair81";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[1]_i_9\ : label is "soft_lutpair62";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[2]_i_18\ : label is "soft_lutpair65";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[2]_i_7\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[4]_i_6\ : label is "soft_lutpair67";
  attribute SOFT_HLUTNM of \addRenormalizeShiftAmount[4]_i_9\ : label is "soft_lutpair65";
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
      I5 => addRenormalizeShiftAmount(0),
      O => \OADD[0]_i_1_n_0\
    );
\OADD[0]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => addRenormalizeShiftAmount(4),
      I1 => addRenormalizeShiftAmount(3),
      O => \OADD[0]_i_2_n_0\
    );
\OADD[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(2),
      I2 => \OADD[0]_i_2_n_0\,
      I3 => \addPostAddMantissa_reg_n_0_[7]\,
      I4 => addRenormalizeShiftAmount(1),
      I5 => \OADD[12]_i_3_n_0\,
      O => \OADD[10]_i_2_n_0\
    );
\OADD[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
      I2 => \OADD[13]_i_3_n_0\,
      O => \OADD[11]_i_2_n_0\
    );
\OADD[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000030300000BB88"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[4]\,
      I1 => addRenormalizeShiftAmount(2),
      I2 => \addPostAddMantissa_reg_n_0_[0]\,
      I3 => \addPostAddMantissa_reg_n_0_[8]\,
      I4 => addRenormalizeShiftAmount(4),
      I5 => addRenormalizeShiftAmount(3),
      O => \OADD[11]_i_3_n_0\
    );
\OADD[12]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
      I2 => \OADD[14]_i_3_n_0\,
      O => \OADD[12]_i_2_n_0\
    );
\OADD[12]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000030300000BB88"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[5]\,
      I1 => addRenormalizeShiftAmount(2),
      I2 => \addPostAddMantissa_reg_n_0_[1]\,
      I3 => \addPostAddMantissa_reg_n_0_[9]\,
      I4 => addRenormalizeShiftAmount(4),
      I5 => addRenormalizeShiftAmount(3),
      O => \OADD[12]_i_3_n_0\
    );
\OADD[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
      I2 => \OADD[15]_i_3_n_0\,
      O => \OADD[13]_i_2_n_0\
    );
\OADD[13]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000030300000BB88"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[6]\,
      I1 => addRenormalizeShiftAmount(2),
      I2 => \addPostAddMantissa_reg_n_0_[2]\,
      I3 => \addPostAddMantissa_reg_n_0_[10]\,
      I4 => addRenormalizeShiftAmount(4),
      I5 => addRenormalizeShiftAmount(3),
      O => \OADD[13]_i_3_n_0\
    );
\OADD[14]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
      I2 => \OADD[16]_i_3_n_0\,
      O => \OADD[14]_i_2_n_0\
    );
\OADD[14]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000030300000BB88"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[7]\,
      I1 => addRenormalizeShiftAmount(2),
      I2 => \addPostAddMantissa_reg_n_0_[3]\,
      I3 => \addPostAddMantissa_reg_n_0_[11]\,
      I4 => addRenormalizeShiftAmount(4),
      I5 => addRenormalizeShiftAmount(3),
      O => \OADD[14]_i_3_n_0\
    );
\OADD[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
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
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      I4 => addRenormalizeShiftAmount(2),
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
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      O => \OADD[15]_i_4_n_0\
    );
\OADD[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
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
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      I4 => addRenormalizeShiftAmount(2),
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
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      O => \OADD[16]_i_4_n_0\
    );
\OADD[17]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
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
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      I4 => addRenormalizeShiftAmount(2),
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
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      O => \OADD[17]_i_4_n_0\
    );
\OADD[18]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
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
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      I4 => addRenormalizeShiftAmount(2),
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
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      O => \OADD[18]_i_4_n_0\
    );
\OADD[19]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
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
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      I4 => addRenormalizeShiftAmount(2),
      I5 => \OADD[22]_i_4_n_0\,
      O => \OADD[19]_i_3_n_0\
    );
\OADD[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFE0400000E040"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I0 => addRenormalizeShiftAmount(3),
      I1 => addRenormalizeShiftAmount(4),
      I2 => \addPostAddMantissa_reg_n_0_[0]\,
      O => \OADD[1]_i_2_n_0\
    );
\OADD[20]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
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
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      I4 => addRenormalizeShiftAmount(2),
      I5 => \OADD[22]_i_9_n_0\,
      O => \OADD[20]_i_3_n_0\
    );
\OADD[21]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(2),
      I2 => \OADD[22]_i_5_n_0\,
      I3 => \OADD[21]_i_3_n_0\,
      I4 => addRenormalizeShiftAmount(1),
      O => \OADD[21]_i_2_n_0\
    );
\OADD[21]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0A0CFFFF0A0C0000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[6]\,
      I1 => \addPostAddMantissa_reg_n_0_[14]\,
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      I4 => addRenormalizeShiftAmount(2),
      I5 => \OADD[22]_i_7_n_0\,
      O => \OADD[21]_i_3_n_0\
    );
\OADD[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I2 => addRenormalizeShiftAmount(4),
      I3 => addRenormalizeShiftAmount(3),
      I4 => addRenormalizeShiftAmount(2),
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
      I3 => addRenormalizeShiftAmount(4),
      I4 => addRenormalizeShiftAmount(3),
      O => \OADD[22]_i_11_n_0\
    );
\OADD[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"B8B8B8B8FFCC3300"
    )
        port map (
      I0 => \OADD[22]_i_4_n_0\,
      I1 => addRenormalizeShiftAmount(2),
      I2 => \OADD[22]_i_5_n_0\,
      I3 => \OADD[22]_i_6_n_0\,
      I4 => \OADD[22]_i_7_n_0\,
      I5 => addRenormalizeShiftAmount(1),
      O => \OADD[22]_i_2_n_0\
    );
\OADD[22]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(2),
      I1 => \OADD[22]_i_8_n_0\,
      I2 => \OADD[22]_i_9_n_0\,
      I3 => addRenormalizeShiftAmount(1),
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
      I3 => addRenormalizeShiftAmount(4),
      I4 => addRenormalizeShiftAmount(3),
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
      I3 => addRenormalizeShiftAmount(4),
      I4 => addRenormalizeShiftAmount(3),
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
      I3 => addRenormalizeShiftAmount(4),
      I4 => addRenormalizeShiftAmount(3),
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
      I3 => addRenormalizeShiftAmount(4),
      I4 => addRenormalizeShiftAmount(3),
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
      I3 => addRenormalizeShiftAmount(4),
      I4 => addRenormalizeShiftAmount(3),
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
      I3 => addRenormalizeShiftAmount(4),
      I4 => addRenormalizeShiftAmount(3),
      O => \OADD[22]_i_9_n_0\
    );
\OADD[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F909"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
      I2 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(2),
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
      I1 => addRenormalizeShiftAmount(0),
      I2 => addRenormalizeShiftAmount(1),
      I3 => addFinalExp(1),
      O => \OADD[25]_i_2_n_0\
    );
\OADD[26]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF690069"
    )
        port map (
      I0 => addFinalExp(3),
      I1 => addRenormalizeShiftAmount(3),
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
      I1 => addRenormalizeShiftAmount(0),
      I2 => addRenormalizeShiftAmount(1),
      I3 => addFinalExp(1),
      I4 => addRenormalizeShiftAmount(2),
      I5 => addFinalExp(2),
      O => \OADD[26]_i_2_n_0\
    );
\OADD[27]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF690069"
    )
        port map (
      I0 => addFinalExp(4),
      I1 => addRenormalizeShiftAmount(4),
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
      I1 => addRenormalizeShiftAmount(3),
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
      I1 => addRenormalizeShiftAmount(3),
      I2 => addFinalExp(3),
      I3 => addRenormalizeShiftAmount(4),
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
      I0 => addRenormalizeShiftAmount(0),
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
      I0 => addRenormalizeShiftAmount(3),
      I1 => addRenormalizeShiftAmount(4),
      I2 => \addPostAddMantissa_reg_n_0_[1]\,
      O => \OADD[2]_i_2_n_0\
    );
\OADD[2]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => addRenormalizeShiftAmount(2),
      I1 => addRenormalizeShiftAmount(1),
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
      I1 => addRenormalizeShiftAmount(4),
      I2 => addFinalExp(3),
      I3 => addRenormalizeShiftAmount(3),
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
      I1 => addRenormalizeShiftAmount(4),
      I2 => addFinalExp(3),
      I3 => addRenormalizeShiftAmount(3),
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
      I2 => addRenormalizeShiftAmount(4),
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
      I1 => addRenormalizeShiftAmount(0),
      I2 => addRenormalizeShiftAmount(1),
      I3 => addFinalExp(1),
      I4 => addRenormalizeShiftAmount(2),
      I5 => addFinalExp(2),
      O => \OADD[31]_i_5_n_0\
    );
\OADD[31]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9204009200000400"
    )
        port map (
      I0 => \OADD[31]_i_8_n_0\,
      I1 => addRenormalizeShiftAmount(1),
      I2 => addFinalExp(1),
      I3 => addRenormalizeShiftAmount(2),
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
      I1 => addRenormalizeShiftAmount(3),
      I2 => addFinalExp(3),
      O => \OADD[31]_i_7_n_0\
    );
\OADD[31]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => addFinalExp(0),
      I1 => addRenormalizeShiftAmount(0),
      O => \OADD[31]_i_8_n_0\
    );
\OADD[31]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => addFinalExp(3),
      I1 => addRenormalizeShiftAmount(3),
      O => \OADD[31]_i_9_n_0\
    );
\OADD[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(3),
      I2 => addRenormalizeShiftAmount(4),
      I3 => \addPostAddMantissa_reg_n_0_[2]\,
      I4 => addRenormalizeShiftAmount(2),
      I5 => addRenormalizeShiftAmount(1),
      O => \OADD[3]_i_2_n_0\
    );
\OADD[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(3),
      I2 => addRenormalizeShiftAmount(4),
      I3 => \addPostAddMantissa_reg_n_0_[3]\,
      I4 => addRenormalizeShiftAmount(2),
      I5 => addRenormalizeShiftAmount(1),
      O => \OADD[4]_i_2_n_0\
    );
\OADD[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(1),
      I2 => \addPostAddMantissa_reg_n_0_[0]\,
      I3 => addRenormalizeShiftAmount(2),
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
      I3 => addRenormalizeShiftAmount(0),
      I4 => addEarlyOutBypassEnable2_reg_n_0,
      O => \OADD[6]_i_1_n_0\
    );
\OADD[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"30BB000030880000"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[3]\,
      I1 => addRenormalizeShiftAmount(1),
      I2 => \addPostAddMantissa_reg_n_0_[1]\,
      I3 => addRenormalizeShiftAmount(2),
      I4 => \OADD[0]_i_2_n_0\,
      I5 => \addPostAddMantissa_reg_n_0_[5]\,
      O => \OADD[6]_i_2_n_0\
    );
\OADD[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(2),
      I2 => \OADD[0]_i_2_n_0\,
      I3 => \addPostAddMantissa_reg_n_0_[4]\,
      I4 => addRenormalizeShiftAmount(1),
      I5 => \OADD[7]_i_3_n_0\,
      O => \OADD[7]_i_2_n_0\
    );
\OADD[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000B0008"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[2]\,
      I1 => addRenormalizeShiftAmount(2),
      I2 => addRenormalizeShiftAmount(3),
      I3 => addRenormalizeShiftAmount(4),
      I4 => \addPostAddMantissa_reg_n_0_[6]\,
      O => \OADD[7]_i_3_n_0\
    );
\OADD[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(2),
      I2 => \OADD[0]_i_2_n_0\,
      I3 => \addPostAddMantissa_reg_n_0_[5]\,
      I4 => addRenormalizeShiftAmount(1),
      I5 => \OADD[8]_i_3_n_0\,
      O => \OADD[8]_i_2_n_0\
    );
\OADD[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000B0008"
    )
        port map (
      I0 => \addPostAddMantissa_reg_n_0_[3]\,
      I1 => addRenormalizeShiftAmount(2),
      I2 => addRenormalizeShiftAmount(3),
      I3 => addRenormalizeShiftAmount(4),
      I4 => \addPostAddMantissa_reg_n_0_[7]\,
      O => \OADD[8]_i_3_n_0\
    );
\OADD[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFE400E4"
    )
        port map (
      I0 => addRenormalizeShiftAmount(0),
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
      I1 => addRenormalizeShiftAmount(2),
      I2 => \OADD[0]_i_2_n_0\,
      I3 => \addPostAddMantissa_reg_n_0_[6]\,
      I4 => addRenormalizeShiftAmount(1),
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
\OADD_Temp[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => addEarlyOutBypass1(23),
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      O => \OADD_Temp[23]_i_1_n_0\
    );
\OADD_Temp[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => addEarlyOutBypass1(24),
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      O => \OADD_Temp[24]_i_1_n_0\
    );
\OADD_Temp[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => addEarlyOutBypass1(25),
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      O => \OADD_Temp[25]_i_1_n_0\
    );
\OADD_Temp[26]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => addEarlyOutBypass1(26),
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      O => \OADD_Temp[26]_i_1_n_0\
    );
\OADD_Temp[27]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => addEarlyOutBypass1(27),
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      O => \OADD_Temp[27]_i_1_n_0\
    );
\OADD_Temp[28]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => addEarlyOutBypass1(28),
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      O => \OADD_Temp[28]_i_1_n_0\
    );
\OADD_Temp[29]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => addEarlyOutBypass1(29),
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      O => \OADD_Temp[29]_i_1_n_0\
    );
\OADD_Temp[30]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \OADD_Temp[22]_i_2_n_0\,
      I1 => addSameNumberDifferentSigns1_reg_n_0,
      I2 => addEarlyOutBypassEnable1_reg_n_0,
      O => \OADD_Temp[30]_i_1_n_0\
    );
\OADD_Temp[30]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => addEarlyOutBypass1(30),
      I1 => addEarlyOutBypassEnable1_reg_n_0,
      O => \OADD_Temp[30]_i_2_n_0\
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
      S => \OADD_Temp[30]_i_1_n_0\
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
      S => \OADD_Temp[30]_i_1_n_0\
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
      S => \OADD_Temp[30]_i_1_n_0\
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
      S => \OADD_Temp[30]_i_1_n_0\
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
      S => \OADD_Temp[30]_i_1_n_0\
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
      S => \OADD_Temp[30]_i_1_n_0\
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
      S => \OADD_Temp[30]_i_1_n_0\
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
      D => \OADD_Temp[30]_i_2_n_0\,
      Q => OADD_Temp(30),
      S => \OADD_Temp[30]_i_1_n_0\
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
\addDenormFlushedValA[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(0),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[0]_i_1_n_0\
    );
\addDenormFlushedValA[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(10),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[10]_i_1_n_0\
    );
\addDenormFlushedValA[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(11),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[11]_i_1_n_0\
    );
\addDenormFlushedValA[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(12),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[12]_i_1_n_0\
    );
\addDenormFlushedValA[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(13),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[13]_i_1_n_0\
    );
\addDenormFlushedValA[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(14),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[14]_i_1_n_0\
    );
\addDenormFlushedValA[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(15),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[15]_i_1_n_0\
    );
\addDenormFlushedValA[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(16),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[16]_i_1_n_0\
    );
\addDenormFlushedValA[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(17),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[17]_i_1_n_0\
    );
\addDenormFlushedValA[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(18),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[18]_i_1_n_0\
    );
\addDenormFlushedValA[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(19),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[19]_i_1_n_0\
    );
\addDenormFlushedValA[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(1),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[1]_i_1_n_0\
    );
\addDenormFlushedValA[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(20),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[20]_i_1_n_0\
    );
\addDenormFlushedValA[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(21),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[21]_i_1_n_0\
    );
\addDenormFlushedValA[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(22),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[22]_i_1_n_0\
    );
\addDenormFlushedValA[22]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => IN_A(26),
      I1 => IN_A(30),
      I2 => IN_A(28),
      I3 => IN_A(29),
      I4 => \addDenormFlushedValA[22]_i_3_n_0\,
      O => \addDenormFlushedValA[22]_i_2_n_0\
    );
\addDenormFlushedValA[22]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_A(23),
      I2 => IN_A(27),
      I3 => IN_A(24),
      O => \addDenormFlushedValA[22]_i_3_n_0\
    );
\addDenormFlushedValA[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(2),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[2]_i_1_n_0\
    );
\addDenormFlushedValA[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(3),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[3]_i_1_n_0\
    );
\addDenormFlushedValA[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(4),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[4]_i_1_n_0\
    );
\addDenormFlushedValA[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(5),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[5]_i_1_n_0\
    );
\addDenormFlushedValA[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(6),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[6]_i_1_n_0\
    );
\addDenormFlushedValA[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(7),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[7]_i_1_n_0\
    );
\addDenormFlushedValA[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(8),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[8]_i_1_n_0\
    );
\addDenormFlushedValA[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_A(9),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addDenormFlushedValA[9]_i_1_n_0\
    );
\addDenormFlushedValA_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[0]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[0]\,
      R => '0'
    );
\addDenormFlushedValA_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[10]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[10]\,
      R => '0'
    );
\addDenormFlushedValA_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[11]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[11]\,
      R => '0'
    );
\addDenormFlushedValA_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[12]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[12]\,
      R => '0'
    );
\addDenormFlushedValA_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[13]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[13]\,
      R => '0'
    );
\addDenormFlushedValA_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[14]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[14]\,
      R => '0'
    );
\addDenormFlushedValA_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[15]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[15]\,
      R => '0'
    );
\addDenormFlushedValA_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[16]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[16]\,
      R => '0'
    );
\addDenormFlushedValA_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[17]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[17]\,
      R => '0'
    );
\addDenormFlushedValA_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[18]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[18]\,
      R => '0'
    );
\addDenormFlushedValA_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[19]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[19]\,
      R => '0'
    );
\addDenormFlushedValA_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[1]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[1]\,
      R => '0'
    );
\addDenormFlushedValA_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[20]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[20]\,
      R => '0'
    );
\addDenormFlushedValA_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[21]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[21]\,
      R => '0'
    );
\addDenormFlushedValA_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[22]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[22]\,
      R => '0'
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
      R => '0'
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
      R => '0'
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
      R => '0'
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
      R => '0'
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
      R => '0'
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
      R => '0'
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
      R => '0'
    );
\addDenormFlushedValA_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[2]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[2]\,
      R => '0'
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
      R => '0'
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
      D => \addDenormFlushedValA[3]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[3]\,
      R => '0'
    );
\addDenormFlushedValA_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[4]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[4]\,
      R => '0'
    );
\addDenormFlushedValA_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[5]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[5]\,
      R => '0'
    );
\addDenormFlushedValA_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[6]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[6]\,
      R => '0'
    );
\addDenormFlushedValA_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[7]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[7]\,
      R => '0'
    );
\addDenormFlushedValA_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[8]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[8]\,
      R => '0'
    );
\addDenormFlushedValA_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValA[9]_i_1_n_0\,
      Q => \addDenormFlushedValA_reg_n_0_[9]\,
      R => '0'
    );
\addDenormFlushedValB[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(0),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[0]_i_1_n_0\
    );
\addDenormFlushedValB[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(10),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[10]_i_1_n_0\
    );
\addDenormFlushedValB[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(11),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[11]_i_1_n_0\
    );
\addDenormFlushedValB[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(12),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[12]_i_1_n_0\
    );
\addDenormFlushedValB[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(13),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[13]_i_1_n_0\
    );
\addDenormFlushedValB[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(14),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[14]_i_1_n_0\
    );
\addDenormFlushedValB[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(15),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[15]_i_1_n_0\
    );
\addDenormFlushedValB[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(16),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[16]_i_1_n_0\
    );
\addDenormFlushedValB[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(17),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[17]_i_1_n_0\
    );
\addDenormFlushedValB[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(18),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[18]_i_1_n_0\
    );
\addDenormFlushedValB[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(19),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[19]_i_1_n_0\
    );
\addDenormFlushedValB[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(1),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[1]_i_1_n_0\
    );
\addDenormFlushedValB[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(20),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[20]_i_1_n_0\
    );
\addDenormFlushedValB[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(21),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[21]_i_1_n_0\
    );
\addDenormFlushedValB[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(22),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[22]_i_1_n_0\
    );
\addDenormFlushedValB[22]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => IN_B(26),
      I1 => IN_B(30),
      I2 => IN_B(28),
      I3 => IN_B(29),
      I4 => \addDenormFlushedValB[22]_i_3_n_0\,
      O => \addDenormFlushedValB[22]_i_2_n_0\
    );
\addDenormFlushedValB[22]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_B(25),
      I1 => IN_B(23),
      I2 => IN_B(27),
      I3 => IN_B(24),
      O => \addDenormFlushedValB[22]_i_3_n_0\
    );
\addDenormFlushedValB[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(2),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[2]_i_1_n_0\
    );
\addDenormFlushedValB[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(3),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[3]_i_1_n_0\
    );
\addDenormFlushedValB[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(4),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[4]_i_1_n_0\
    );
\addDenormFlushedValB[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(5),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[5]_i_1_n_0\
    );
\addDenormFlushedValB[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(6),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[6]_i_1_n_0\
    );
\addDenormFlushedValB[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(7),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[7]_i_1_n_0\
    );
\addDenormFlushedValB[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(8),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[8]_i_1_n_0\
    );
\addDenormFlushedValB[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(9),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addDenormFlushedValB[9]_i_1_n_0\
    );
\addDenormFlushedValB_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IADD_GO,
      D => \addDenormFlushedValB[0]_i_1_n_0\,
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
      D => \addDenormFlushedValB[10]_i_1_n_0\,
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
      D => \addDenormFlushedValB[11]_i_1_n_0\,
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
      D => \addDenormFlushedValB[12]_i_1_n_0\,
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
      D => \addDenormFlushedValB[13]_i_1_n_0\,
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
      D => \addDenormFlushedValB[14]_i_1_n_0\,
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
      D => \addDenormFlushedValB[15]_i_1_n_0\,
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
      D => \addDenormFlushedValB[16]_i_1_n_0\,
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
      D => \addDenormFlushedValB[17]_i_1_n_0\,
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
      D => \addDenormFlushedValB[18]_i_1_n_0\,
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
      D => \addDenormFlushedValB[19]_i_1_n_0\,
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
      D => \addDenormFlushedValB[1]_i_1_n_0\,
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
      D => \addDenormFlushedValB[20]_i_1_n_0\,
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
      D => \addDenormFlushedValB[21]_i_1_n_0\,
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
      D => \addDenormFlushedValB[22]_i_1_n_0\,
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
      D => IN_B(23),
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
      D => IN_B(24),
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
      D => IN_B(25),
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
      D => IN_B(26),
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
      D => IN_B(27),
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
      D => IN_B(28),
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
      D => IN_B(29),
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
      D => \addDenormFlushedValB[2]_i_1_n_0\,
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
      D => IN_B(30),
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
      D => \addDenormFlushedValB[3]_i_1_n_0\,
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
      D => \addDenormFlushedValB[4]_i_1_n_0\,
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
      D => \addDenormFlushedValB[5]_i_1_n_0\,
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
      D => \addDenormFlushedValB[6]_i_1_n_0\,
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
      D => \addDenormFlushedValB[7]_i_1_n_0\,
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
      D => \addDenormFlushedValB[8]_i_1_n_0\,
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
      D => \addDenormFlushedValB[9]_i_1_n_0\,
      Q => \addDenormFlushedValB_reg_n_0_[9]\,
      R => '0'
    );
\addEarlyOutBypass0[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FACF0AC0"
    )
        port map (
      I0 => IN_B(0),
      I1 => IN_A(0),
      I2 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I3 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I4 => \addEarlyOutBypass0[0]_i_2_n_0\,
      O => \addEarlyOutBypass0[0]_i_1_n_0\
    );
\addEarlyOutBypass0[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8F8BBF8A8F8FFF8"
    )
        port map (
      I0 => \addEarlyOutBypass0[2]_i_3_n_0\,
      I1 => \addEarlyOutBypass0[2]_i_4_n_0\,
      I2 => IN_A(0),
      I3 => \addEarlyOutBypass0[2]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[0]_i_3_n_0\,
      I5 => addSameNumberDifferentSigns00,
      O => \addEarlyOutBypass0[0]_i_2_n_0\
    );
\addEarlyOutBypass0[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFB0BFBF"
    )
        port map (
      I0 => \addDenormFlushedValB[22]_i_2_n_0\,
      I1 => IN_B(0),
      I2 => comALessThanB,
      I3 => \addDenormFlushedValA[22]_i_2_n_0\,
      I4 => IN_A(0),
      O => \addEarlyOutBypass0[0]_i_3_n_0\
    );
\addEarlyOutBypass0[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[10]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_3_n_0\,
      I2 => \addEarlyOutBypass0[10]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[21]_i_3_n_0\,
      I5 => IN_A(10),
      O => \addEarlyOutBypass0[10]_i_1_n_0\
    );
\addEarlyOutBypass0[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDDDFF0F"
    )
        port map (
      I0 => IN_B(10),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => IN_A(10),
      I3 => \addDenormFlushedValA[22]_i_2_n_0\,
      I4 => comALessThanB,
      O => \addEarlyOutBypass0[10]_i_2_n_0\
    );
\addEarlyOutBypass0[10]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5808"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I1 => IN_A(10),
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_B(10),
      O => \addEarlyOutBypass0[10]_i_3_n_0\
    );
\addEarlyOutBypass0[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[11]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[11]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[22]_i_6_n_0\,
      I5 => IN_A(11),
      O => \addEarlyOutBypass0[11]_i_1_n_0\
    );
\addEarlyOutBypass0[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(11),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(11),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[11]_i_2_n_0\
    );
\addEarlyOutBypass0[11]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5808"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I1 => IN_A(11),
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_B(11),
      O => \addEarlyOutBypass0[11]_i_3_n_0\
    );
\addEarlyOutBypass0[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[12]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_3_n_0\,
      I2 => \addEarlyOutBypass0[12]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[22]_i_6_n_0\,
      I5 => IN_A(12),
      O => \addEarlyOutBypass0[12]_i_1_n_0\
    );
\addEarlyOutBypass0[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDDDFF0F"
    )
        port map (
      I0 => IN_B(12),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => IN_A(12),
      I3 => \addDenormFlushedValA[22]_i_2_n_0\,
      I4 => comALessThanB,
      O => \addEarlyOutBypass0[12]_i_2_n_0\
    );
\addEarlyOutBypass0[12]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2C20"
    )
        port map (
      I0 => IN_B(12),
      I1 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_A(12),
      O => \addEarlyOutBypass0[12]_i_3_n_0\
    );
\addEarlyOutBypass0[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[13]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[13]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[22]_i_6_n_0\,
      I5 => IN_A(13),
      O => \addEarlyOutBypass0[13]_i_1_n_0\
    );
\addEarlyOutBypass0[13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(13),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(13),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[13]_i_2_n_0\
    );
\addEarlyOutBypass0[13]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2C20"
    )
        port map (
      I0 => IN_B(13),
      I1 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_A(13),
      O => \addEarlyOutBypass0[13]_i_3_n_0\
    );
\addEarlyOutBypass0[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[14]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[14]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[22]_i_6_n_0\,
      I5 => IN_A(14),
      O => \addEarlyOutBypass0[14]_i_1_n_0\
    );
\addEarlyOutBypass0[14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(14),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(14),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[14]_i_2_n_0\
    );
\addEarlyOutBypass0[14]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2C20"
    )
        port map (
      I0 => IN_B(14),
      I1 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_A(14),
      O => \addEarlyOutBypass0[14]_i_3_n_0\
    );
\addEarlyOutBypass0[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[15]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[15]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[22]_i_6_n_0\,
      I5 => IN_A(15),
      O => \addEarlyOutBypass0[15]_i_1_n_0\
    );
\addEarlyOutBypass0[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(15),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(15),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[15]_i_2_n_0\
    );
\addEarlyOutBypass0[15]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2C20"
    )
        port map (
      I0 => IN_B(15),
      I1 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_A(15),
      O => \addEarlyOutBypass0[15]_i_3_n_0\
    );
\addEarlyOutBypass0[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[16]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[16]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[22]_i_6_n_0\,
      I5 => IN_A(16),
      O => \addEarlyOutBypass0[16]_i_1_n_0\
    );
\addEarlyOutBypass0[16]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(16),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(16),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[16]_i_2_n_0\
    );
\addEarlyOutBypass0[16]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2C20"
    )
        port map (
      I0 => IN_B(16),
      I1 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_A(16),
      O => \addEarlyOutBypass0[16]_i_3_n_0\
    );
\addEarlyOutBypass0[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[17]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[17]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[21]_i_3_n_0\,
      I5 => IN_A(17),
      O => \addEarlyOutBypass0[17]_i_1_n_0\
    );
\addEarlyOutBypass0[17]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(17),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(17),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[17]_i_2_n_0\
    );
\addEarlyOutBypass0[17]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2C20"
    )
        port map (
      I0 => IN_B(17),
      I1 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_A(17),
      O => \addEarlyOutBypass0[17]_i_3_n_0\
    );
\addEarlyOutBypass0[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[18]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[18]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[21]_i_3_n_0\,
      I5 => IN_A(18),
      O => \addEarlyOutBypass0[18]_i_1_n_0\
    );
\addEarlyOutBypass0[18]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(18),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(18),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[18]_i_2_n_0\
    );
\addEarlyOutBypass0[18]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2C20"
    )
        port map (
      I0 => IN_B(18),
      I1 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_A(18),
      O => \addEarlyOutBypass0[18]_i_3_n_0\
    );
\addEarlyOutBypass0[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF4F4F444"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[19]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I3 => \addEarlyOutBypass0[21]_i_3_n_0\,
      I4 => IN_A(19),
      I5 => \addEarlyOutBypass0[19]_i_3_n_0\,
      O => \addEarlyOutBypass0[19]_i_1_n_0\
    );
\addEarlyOutBypass0[19]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(19),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(19),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[19]_i_2_n_0\
    );
\addEarlyOutBypass0[19]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2C20"
    )
        port map (
      I0 => IN_B(19),
      I1 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_A(19),
      O => \addEarlyOutBypass0[19]_i_3_n_0\
    );
\addEarlyOutBypass0[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF4F4F444"
    )
        port map (
      I0 => \addEarlyOutBypass0[1]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_3_n_0\,
      I2 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I3 => \addEarlyOutBypass0[21]_i_3_n_0\,
      I4 => IN_A(1),
      I5 => \addEarlyOutBypass0[1]_i_3_n_0\,
      O => \addEarlyOutBypass0[1]_i_1_n_0\
    );
\addEarlyOutBypass0[1]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF0FDDDD"
    )
        port map (
      I0 => IN_A(1),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      I2 => IN_B(1),
      I3 => \addDenormFlushedValB[22]_i_2_n_0\,
      I4 => comALessThanB,
      O => \addEarlyOutBypass0[1]_i_2_n_0\
    );
\addEarlyOutBypass0[1]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5808"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I1 => IN_A(1),
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_B(1),
      O => \addEarlyOutBypass0[1]_i_3_n_0\
    );
\addEarlyOutBypass0[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[20]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[20]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[22]_i_6_n_0\,
      I5 => IN_A(20),
      O => \addEarlyOutBypass0[20]_i_1_n_0\
    );
\addEarlyOutBypass0[20]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(20),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(20),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[20]_i_2_n_0\
    );
\addEarlyOutBypass0[20]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2C20"
    )
        port map (
      I0 => IN_B(20),
      I1 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_A(20),
      O => \addEarlyOutBypass0[20]_i_3_n_0\
    );
\addEarlyOutBypass0[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF4F4F444"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[21]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I3 => \addEarlyOutBypass0[21]_i_3_n_0\,
      I4 => IN_A(21),
      I5 => \addEarlyOutBypass0[21]_i_4_n_0\,
      O => \addEarlyOutBypass0[21]_i_1_n_0\
    );
\addEarlyOutBypass0[21]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(21),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(21),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[21]_i_2_n_0\
    );
\addEarlyOutBypass0[21]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"60"
    )
        port map (
      I0 => IN_B(31),
      I1 => IN_A(31),
      I2 => \addEarlyOutBypass0[31]_i_8_n_0\,
      O => \addEarlyOutBypass0[21]_i_3_n_0\
    );
\addEarlyOutBypass0[21]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2C20"
    )
        port map (
      I0 => IN_B(21),
      I1 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_A(21),
      O => \addEarlyOutBypass0[21]_i_4_n_0\
    );
\addEarlyOutBypass0[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[22]_i_3_n_0\,
      I2 => \addEarlyOutBypass0[22]_i_4_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[22]_i_6_n_0\,
      I5 => IN_A(22),
      O => \addEarlyOutBypass0[22]_i_1_n_0\
    );
\addEarlyOutBypass0[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAEEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_8_n_0\,
      I1 => addSameNumberDifferentSigns00,
      I2 => IN_B(31),
      I3 => IN_A(31),
      I4 => \addEarlyOutBypass0[31]_i_7_n_0\,
      I5 => \addEarlyOutBypass0[7]_i_3_n_0\,
      O => \addEarlyOutBypass0[22]_i_2_n_0\
    );
\addEarlyOutBypass0[22]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(22),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(22),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[22]_i_3_n_0\
    );
\addEarlyOutBypass0[22]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2C20"
    )
        port map (
      I0 => IN_B(22),
      I1 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_A(22),
      O => \addEarlyOutBypass0[22]_i_4_n_0\
    );
\addEarlyOutBypass0[22]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_8_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_7_n_0\,
      O => \addEarlyOutBypass0[22]_i_5_n_0\
    );
\addEarlyOutBypass0[22]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"06"
    )
        port map (
      I0 => IN_B(31),
      I1 => IN_A(31),
      I2 => \addEarlyOutBypass0[31]_i_7_n_0\,
      O => \addEarlyOutBypass0[22]_i_6_n_0\
    );
\addEarlyOutBypass0[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => IN_A(23),
      I1 => comALessThanB,
      I2 => IN_B(23),
      I3 => \addEarlyOutBypass0[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[23]_i_1_n_0\
    );
\addEarlyOutBypass0[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => IN_A(24),
      I1 => comALessThanB,
      I2 => IN_B(24),
      I3 => \addEarlyOutBypass0[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[24]_i_1_n_0\
    );
\addEarlyOutBypass0[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => IN_A(25),
      I1 => comALessThanB,
      I2 => IN_B(25),
      I3 => \addEarlyOutBypass0[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[25]_i_1_n_0\
    );
\addEarlyOutBypass0[26]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => IN_A(26),
      I1 => comALessThanB,
      I2 => IN_B(26),
      I3 => \addEarlyOutBypass0[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[26]_i_1_n_0\
    );
\addEarlyOutBypass0[27]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => IN_A(27),
      I1 => comALessThanB,
      I2 => IN_B(27),
      I3 => \addEarlyOutBypass0[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[27]_i_1_n_0\
    );
\addEarlyOutBypass0[28]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => IN_A(28),
      I1 => comALessThanB,
      I2 => IN_B(28),
      I3 => \addEarlyOutBypass0[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[28]_i_1_n_0\
    );
\addEarlyOutBypass0[29]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => IN_A(29),
      I1 => comALessThanB,
      I2 => IN_B(29),
      I3 => \addEarlyOutBypass0[7]_i_4_n_0\,
      O => \addEarlyOutBypass0[29]_i_1_n_0\
    );
\addEarlyOutBypass0[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FACF0AC0"
    )
        port map (
      I0 => IN_B(2),
      I1 => IN_A(2),
      I2 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I3 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I4 => \addEarlyOutBypass0[2]_i_2_n_0\,
      O => \addEarlyOutBypass0[2]_i_1_n_0\
    );
\addEarlyOutBypass0[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A8F8BBF8A8F8FFF8"
    )
        port map (
      I0 => \addEarlyOutBypass0[2]_i_3_n_0\,
      I1 => \addEarlyOutBypass0[2]_i_4_n_0\,
      I2 => IN_A(2),
      I3 => \addEarlyOutBypass0[2]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[2]_i_6_n_0\,
      I5 => addSameNumberDifferentSigns00,
      O => \addEarlyOutBypass0[2]_i_2_n_0\
    );
\addEarlyOutBypass0[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_9_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_10_n_0\,
      I3 => \addEarlyOutBypass0[31]_i_5_n_0\,
      O => \addEarlyOutBypass0[2]_i_3_n_0\
    );
\addEarlyOutBypass0[2]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => IN_A(31),
      I1 => IN_B(31),
      O => \addEarlyOutBypass0[2]_i_4_n_0\
    );
\addEarlyOutBypass0[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_9_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_10_n_0\,
      I3 => \addEarlyOutBypass0[31]_i_5_n_0\,
      O => \addEarlyOutBypass0[2]_i_5_n_0\
    );
\addEarlyOutBypass0[2]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BFB0BFBF"
    )
        port map (
      I0 => \addDenormFlushedValB[22]_i_2_n_0\,
      I1 => IN_B(2),
      I2 => comALessThanB,
      I3 => \addDenormFlushedValA[22]_i_2_n_0\,
      I4 => IN_A(2),
      O => \addEarlyOutBypass0[2]_i_6_n_0\
    );
\addEarlyOutBypass0[30]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E000E0E0"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I1 => \addEarlyOutBypass0[7]_i_3_n_0\,
      I2 => IADD_GO,
      I3 => \addEarlyOutBypass0[30]_i_3_n_0\,
      I4 => \addEarlyOutBypass0[31]_i_3_n_0\,
      O => \addEarlyOutBypass0[30]_i_1_n_0\
    );
\addEarlyOutBypass0[30]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => IN_A(30),
      I1 => comALessThanB,
      I2 => IN_B(30),
      I3 => \addEarlyOutBypass0[30]_i_4_n_0\,
      O => \addEarlyOutBypass0[30]_i_2_n_0\
    );
\addEarlyOutBypass0[30]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA[22]_i_2_n_0\,
      I1 => comALessThanB,
      I2 => \addDenormFlushedValB[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[30]_i_3_n_0\
    );
\addEarlyOutBypass0[30]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF60"
    )
        port map (
      I0 => IN_A(31),
      I1 => IN_B(31),
      I2 => addSameNumberDifferentSigns00,
      I3 => \addEarlyOutBypass0[31]_i_8_n_0\,
      O => \addEarlyOutBypass0[30]_i_4_n_0\
    );
\addEarlyOutBypass0[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFD50000"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_3_n_0\,
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => \addDenormFlushedValB[22]_i_2_n_0\,
      I4 => IADD_GO,
      O => \addEarlyOutBypass0[31]_i_1_n_0\
    );
\addEarlyOutBypass0[31]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_13_n_0\,
      I1 => IN_B(21),
      I2 => IN_B(5),
      I3 => IN_B(8),
      I4 => IN_B(6),
      I5 => \addEarlyOutBypass0[31]_i_14_n_0\,
      O => \addEarlyOutBypass0[31]_i_10_n_0\
    );
\addEarlyOutBypass0[31]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(19),
      I1 => IN_A(16),
      I2 => IN_A(22),
      I3 => IN_A(9),
      O => \addEarlyOutBypass0[31]_i_11_n_0\
    );
\addEarlyOutBypass0[31]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_15_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_16_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_17_n_0\,
      I3 => IN_A(12),
      I4 => IN_A(13),
      I5 => IN_A(2),
      O => \addEarlyOutBypass0[31]_i_12_n_0\
    );
\addEarlyOutBypass0[31]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_B(19),
      I1 => IN_B(16),
      I2 => IN_B(22),
      I3 => IN_B(9),
      O => \addEarlyOutBypass0[31]_i_13_n_0\
    );
\addEarlyOutBypass0[31]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_18_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_19_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_20_n_0\,
      I3 => IN_B(12),
      I4 => IN_B(13),
      I5 => IN_B(2),
      O => \addEarlyOutBypass0[31]_i_14_n_0\
    );
\addEarlyOutBypass0[31]_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(18),
      I1 => IN_A(7),
      I2 => IN_A(17),
      I3 => IN_A(1),
      O => \addEarlyOutBypass0[31]_i_15_n_0\
    );
\addEarlyOutBypass0[31]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(14),
      I1 => IN_A(11),
      I2 => IN_A(20),
      I3 => IN_A(10),
      O => \addEarlyOutBypass0[31]_i_16_n_0\
    );
\addEarlyOutBypass0[31]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(15),
      I1 => IN_A(4),
      I2 => IN_A(3),
      I3 => IN_A(0),
      O => \addEarlyOutBypass0[31]_i_17_n_0\
    );
\addEarlyOutBypass0[31]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_B(18),
      I1 => IN_B(7),
      I2 => IN_B(17),
      I3 => IN_B(1),
      O => \addEarlyOutBypass0[31]_i_18_n_0\
    );
\addEarlyOutBypass0[31]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_B(14),
      I1 => IN_B(11),
      I2 => IN_B(20),
      I3 => IN_B(10),
      O => \addEarlyOutBypass0[31]_i_19_n_0\
    );
\addEarlyOutBypass0[31]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FAACC0F"
    )
        port map (
      I0 => IN_B(31),
      I1 => IN_A(31),
      I2 => \addEarlyOutBypass0[31]_i_4_n_0\,
      I3 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[31]_i_6_n_0\,
      O => \addEarlyOutBypass0[31]_i_2_n_0\
    );
\addEarlyOutBypass0[31]_i_20\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_B(15),
      I1 => IN_B(4),
      I2 => IN_B(3),
      I3 => IN_B(0),
      O => \addEarlyOutBypass0[31]_i_20_n_0\
    );
\addEarlyOutBypass0[31]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000010011111"
    )
        port map (
      I0 => \addEarlyOutBypass0[7]_i_3_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_7_n_0\,
      I2 => IN_A(31),
      I3 => IN_B(31),
      I4 => addSameNumberDifferentSigns00,
      I5 => \addEarlyOutBypass0[31]_i_8_n_0\,
      O => \addEarlyOutBypass0[31]_i_3_n_0\
    );
\addEarlyOutBypass0[31]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FF00FF0FFF0EDF"
    )
        port map (
      I0 => comALessThanB,
      I1 => addSameNumberDifferentSigns00,
      I2 => IN_B(31),
      I3 => IN_A(31),
      I4 => \addEarlyOutBypass0[31]_i_8_n_0\,
      I5 => \addEarlyOutBypass0[31]_i_7_n_0\,
      O => \addEarlyOutBypass0[31]_i_4_n_0\
    );
\addEarlyOutBypass0[31]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => IN_B(30),
      I1 => \addExponentDeltaAMinusB[7]_i_2_n_0\,
      I2 => IN_B(29),
      O => \addEarlyOutBypass0[31]_i_5_n_0\
    );
\addEarlyOutBypass0[31]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => IN_A(29),
      I1 => \addExponentDeltaAMinusB[7]_i_4_n_0\,
      I2 => IN_A(30),
      O => \addEarlyOutBypass0[31]_i_6_n_0\
    );
\addEarlyOutBypass0[31]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_9_n_0\,
      I3 => \addEarlyOutBypass0[31]_i_10_n_0\,
      O => \addEarlyOutBypass0[31]_i_7_n_0\
    );
\addEarlyOutBypass0[31]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0010"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I2 => \addEarlyOutBypass0[31]_i_10_n_0\,
      I3 => \addEarlyOutBypass0[31]_i_9_n_0\,
      O => \addEarlyOutBypass0[31]_i_8_n_0\
    );
\addEarlyOutBypass0[31]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_11_n_0\,
      I1 => IN_A(21),
      I2 => IN_A(5),
      I3 => IN_A(8),
      I4 => IN_A(6),
      I5 => \addEarlyOutBypass0[31]_i_12_n_0\,
      O => \addEarlyOutBypass0[31]_i_9_n_0\
    );
\addEarlyOutBypass0[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF4F4F444"
    )
        port map (
      I0 => \addEarlyOutBypass0[3]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_3_n_0\,
      I2 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I3 => \addEarlyOutBypass0[21]_i_3_n_0\,
      I4 => IN_A(3),
      I5 => \addEarlyOutBypass0[3]_i_3_n_0\,
      O => \addEarlyOutBypass0[3]_i_1_n_0\
    );
\addEarlyOutBypass0[3]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF0FDDDD"
    )
        port map (
      I0 => IN_A(3),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      I2 => IN_B(3),
      I3 => \addDenormFlushedValB[22]_i_2_n_0\,
      I4 => comALessThanB,
      O => \addEarlyOutBypass0[3]_i_2_n_0\
    );
\addEarlyOutBypass0[3]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5808"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I1 => IN_A(3),
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_B(3),
      O => \addEarlyOutBypass0[3]_i_3_n_0\
    );
\addEarlyOutBypass0[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF4F4F444"
    )
        port map (
      I0 => \addEarlyOutBypass0[4]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_3_n_0\,
      I2 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I3 => \addEarlyOutBypass0[21]_i_3_n_0\,
      I4 => IN_A(4),
      I5 => \addEarlyOutBypass0[4]_i_3_n_0\,
      O => \addEarlyOutBypass0[4]_i_1_n_0\
    );
\addEarlyOutBypass0[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF0FDDDD"
    )
        port map (
      I0 => IN_A(4),
      I1 => \addDenormFlushedValA[22]_i_2_n_0\,
      I2 => IN_B(4),
      I3 => \addDenormFlushedValB[22]_i_2_n_0\,
      I4 => comALessThanB,
      O => \addEarlyOutBypass0[4]_i_2_n_0\
    );
\addEarlyOutBypass0[4]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5808"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I1 => IN_A(4),
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_B(4),
      O => \addEarlyOutBypass0[4]_i_3_n_0\
    );
\addEarlyOutBypass0[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B88BBBB8B888B88"
    )
        port map (
      I0 => \addEarlyOutBypass0[5]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[7]_i_3_n_0\,
      I2 => \addEarlyOutBypass0[7]_i_4_n_0\,
      I3 => \addEarlyOutBypass0[5]_i_3_n_0\,
      I4 => \addEarlyOutBypass0[5]_i_4_n_0\,
      I5 => \addEarlyOutBypass0[22]_i_5_n_0\,
      O => \addEarlyOutBypass0[5]_i_1_n_0\
    );
\addEarlyOutBypass0[5]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => IN_B(5),
      I1 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I2 => IN_A(5),
      O => \addEarlyOutBypass0[5]_i_2_n_0\
    );
\addEarlyOutBypass0[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(5),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(5),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[5]_i_3_n_0\
    );
\addEarlyOutBypass0[5]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5445"
    )
        port map (
      I0 => IN_A(5),
      I1 => \addEarlyOutBypass0[31]_i_7_n_0\,
      I2 => IN_A(31),
      I3 => IN_B(31),
      O => \addEarlyOutBypass0[5]_i_4_n_0\
    );
\addEarlyOutBypass0[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[6]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[6]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[21]_i_3_n_0\,
      I5 => IN_A(6),
      O => \addEarlyOutBypass0[6]_i_1_n_0\
    );
\addEarlyOutBypass0[6]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(6),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(6),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[6]_i_2_n_0\
    );
\addEarlyOutBypass0[6]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5808"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I1 => IN_A(6),
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_B(6),
      O => \addEarlyOutBypass0[6]_i_3_n_0\
    );
\addEarlyOutBypass0[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8B88BBBB8B888B88"
    )
        port map (
      I0 => \addEarlyOutBypass0[7]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[7]_i_3_n_0\,
      I2 => \addEarlyOutBypass0[7]_i_4_n_0\,
      I3 => \addEarlyOutBypass0[7]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[7]_i_6_n_0\,
      I5 => \addEarlyOutBypass0[22]_i_5_n_0\,
      O => \addEarlyOutBypass0[7]_i_1_n_0\
    );
\addEarlyOutBypass0[7]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => IN_B(7),
      I1 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I2 => IN_A(7),
      O => \addEarlyOutBypass0[7]_i_2_n_0\
    );
\addEarlyOutBypass0[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_6_n_0\,
      O => \addEarlyOutBypass0[7]_i_3_n_0\
    );
\addEarlyOutBypass0[7]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFAEEA"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_8_n_0\,
      I1 => addSameNumberDifferentSigns00,
      I2 => IN_B(31),
      I3 => IN_A(31),
      I4 => \addEarlyOutBypass0[31]_i_7_n_0\,
      O => \addEarlyOutBypass0[7]_i_4_n_0\
    );
\addEarlyOutBypass0[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(7),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(7),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[7]_i_5_n_0\
    );
\addEarlyOutBypass0[7]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5445"
    )
        port map (
      I0 => IN_A(7),
      I1 => \addEarlyOutBypass0[31]_i_7_n_0\,
      I2 => IN_A(31),
      I3 => IN_B(31),
      O => \addEarlyOutBypass0[7]_i_6_n_0\
    );
\addEarlyOutBypass0[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFF4F4F444"
    )
        port map (
      I0 => \addEarlyOutBypass0[8]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[31]_i_3_n_0\,
      I2 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I3 => \addEarlyOutBypass0[21]_i_3_n_0\,
      I4 => IN_A(8),
      I5 => \addEarlyOutBypass0[8]_i_3_n_0\,
      O => \addEarlyOutBypass0[8]_i_1_n_0\
    );
\addEarlyOutBypass0[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DDDDFF0F"
    )
        port map (
      I0 => IN_B(8),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => IN_A(8),
      I3 => \addDenormFlushedValA[22]_i_2_n_0\,
      I4 => comALessThanB,
      O => \addEarlyOutBypass0[8]_i_2_n_0\
    );
\addEarlyOutBypass0[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5808"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I1 => IN_A(8),
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_B(8),
      O => \addEarlyOutBypass0[8]_i_3_n_0\
    );
\addEarlyOutBypass0[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF4FFF4FFF4F4F4"
    )
        port map (
      I0 => \addEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \addEarlyOutBypass0[9]_i_2_n_0\,
      I2 => \addEarlyOutBypass0[9]_i_3_n_0\,
      I3 => \addEarlyOutBypass0[22]_i_5_n_0\,
      I4 => \addEarlyOutBypass0[22]_i_6_n_0\,
      I5 => IN_A(9),
      O => \addEarlyOutBypass0[9]_i_1_n_0\
    );
\addEarlyOutBypass0[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20202F20"
    )
        port map (
      I0 => IN_B(9),
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => IN_A(9),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => \addEarlyOutBypass0[9]_i_2_n_0\
    );
\addEarlyOutBypass0[9]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5808"
    )
        port map (
      I0 => \addEarlyOutBypass0[31]_i_5_n_0\,
      I1 => IN_A(9),
      I2 => \addEarlyOutBypass0[31]_i_6_n_0\,
      I3 => IN_B(9),
      O => \addEarlyOutBypass0[9]_i_3_n_0\
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
\addEarlyOutBypass0_reg[23]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[23]_i_1_n_0\,
      Q => addEarlyOutBypass0(23),
      S => \addEarlyOutBypass0[30]_i_1_n_0\
    );
\addEarlyOutBypass0_reg[24]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[24]_i_1_n_0\,
      Q => addEarlyOutBypass0(24),
      S => \addEarlyOutBypass0[30]_i_1_n_0\
    );
\addEarlyOutBypass0_reg[25]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[25]_i_1_n_0\,
      Q => addEarlyOutBypass0(25),
      S => \addEarlyOutBypass0[30]_i_1_n_0\
    );
\addEarlyOutBypass0_reg[26]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[26]_i_1_n_0\,
      Q => addEarlyOutBypass0(26),
      S => \addEarlyOutBypass0[30]_i_1_n_0\
    );
\addEarlyOutBypass0_reg[27]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[27]_i_1_n_0\,
      Q => addEarlyOutBypass0(27),
      S => \addEarlyOutBypass0[30]_i_1_n_0\
    );
\addEarlyOutBypass0_reg[28]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[28]_i_1_n_0\,
      Q => addEarlyOutBypass0(28),
      S => \addEarlyOutBypass0[30]_i_1_n_0\
    );
\addEarlyOutBypass0_reg[29]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[29]_i_1_n_0\,
      Q => addEarlyOutBypass0(29),
      S => \addEarlyOutBypass0[30]_i_1_n_0\
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
\addEarlyOutBypass0_reg[30]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \addEarlyOutBypass0[31]_i_1_n_0\,
      D => \addEarlyOutBypass0[30]_i_2_n_0\,
      Q => addEarlyOutBypass0(30),
      S => \addEarlyOutBypass0[30]_i_1_n_0\
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
      INIT => X"B8FFB800"
    )
        port map (
      I0 => p_0_in,
      I1 => addALessThanB,
      I2 => p_1_in,
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
      I3 => addMaxVal1,
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
      INIT => X"FC0CFFFFAAAAAAAA"
    )
        port map (
      I0 => addEarlyOutBypassEnable0,
      I1 => \addDenormFlushedValB[22]_i_2_n_0\,
      I2 => comALessThanB,
      I3 => \addDenormFlushedValA[22]_i_2_n_0\,
      I4 => \addEarlyOutBypass0[31]_i_3_n_0\,
      I5 => IADD_GO,
      O => addEarlyOutBypassEnable0_i_1_n_0
    );
addEarlyOutBypassEnable0_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => addEarlyOutBypassEnable0_i_1_n_0,
      Q => addEarlyOutBypassEnable0,
      R => '0'
    );
addEarlyOutBypassEnable1_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => addEarlyOutBypassEnable0,
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
      INIT => X"FFFFFFFFEEEFEEEE"
    )
        port map (
      I0 => addExponentDeltaAMinusB0(7),
      I1 => addExponentDeltaAMinusB0(5),
      I2 => addExponentDeltaAMinusBShiftTooFar_i_2_n_0,
      I3 => addExponentDeltaAMinusBShiftTooFar_i_3_n_0,
      I4 => addExponentDeltaAMinusB0(4),
      I5 => addExponentDeltaAMinusB0(6),
      O => addExponentDeltaAMinusBShiftTooFar_i_1_n_0
    );
addExponentDeltaAMinusBShiftTooFar_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A96A56955695A96A"
    )
        port map (
      I0 => addExponentDeltaAMinusBShiftTooFar_i_4_n_0,
      I1 => IN_A(25),
      I2 => addExponentDeltaAMinusBShiftTooFar_i_5_n_0,
      I3 => IN_B(25),
      I4 => IN_A(26),
      I5 => IN_B(26),
      O => addExponentDeltaAMinusBShiftTooFar_i_2_n_0
    );
addExponentDeltaAMinusBShiftTooFar_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_B(25),
      I2 => IN_B(24),
      I3 => IN_A(24),
      I4 => IN_B(23),
      I5 => IN_A(23),
      O => addExponentDeltaAMinusBShiftTooFar_i_3_n_0
    );
addExponentDeltaAMinusBShiftTooFar_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BF0BC0C0C0C0BF0B"
    )
        port map (
      I0 => IN_A(23),
      I1 => IN_B(23),
      I2 => IN_B(24),
      I3 => IN_A(24),
      I4 => IN_A(25),
      I5 => IN_B(25),
      O => addExponentDeltaAMinusBShiftTooFar_i_4_n_0
    );
addExponentDeltaAMinusBShiftTooFar_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => IN_B(23),
      I1 => IN_B(24),
      O => addExponentDeltaAMinusBShiftTooFar_i_5_n_0
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
      I0 => IN_B(23),
      I1 => IN_A(23),
      O => addExponentDeltaAMinusB0(0)
    );
\addExponentDeltaAMinusB[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4BB4"
    )
        port map (
      I0 => IN_A(23),
      I1 => IN_B(23),
      I2 => IN_A(24),
      I3 => IN_B(24),
      O => addExponentDeltaAMinusB0(1)
    );
\addExponentDeltaAMinusB[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"44D4BB2BBB2B44D4"
    )
        port map (
      I0 => IN_A(24),
      I1 => IN_B(24),
      I2 => IN_B(23),
      I3 => IN_A(23),
      I4 => IN_A(25),
      I5 => IN_B(25),
      O => addExponentDeltaAMinusB0(2)
    );
\addExponentDeltaAMinusB[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => addExponentDeltaAMinusBShiftTooFar_i_2_n_0,
      O => addExponentDeltaAMinusB0(3)
    );
\addExponentDeltaAMinusB[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96969669"
    )
        port map (
      I0 => IN_B(27),
      I1 => \addExponentDeltaAMinusB[4]_i_2_n_0\,
      I2 => IN_A(27),
      I3 => \addExponentDeltaAMinusB[4]_i_3_n_0\,
      I4 => \addExponentDeltaAMinusB[4]_i_4_n_0\,
      O => addExponentDeltaAMinusB0(4)
    );
\addExponentDeltaAMinusB[4]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => IN_B(26),
      I1 => IN_B(23),
      I2 => IN_B(24),
      I3 => IN_B(25),
      O => \addExponentDeltaAMinusB[4]_i_2_n_0\
    );
\addExponentDeltaAMinusB[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00D0F0FFD0DD00F0"
    )
        port map (
      I0 => IN_A(25),
      I1 => addExponentDeltaBMinusAShiftTooFar_i_4_n_0,
      I2 => \addExponentDeltaAMinusB[4]_i_5_n_0\,
      I3 => IN_A(26),
      I4 => \addExponentDeltaAMinusB[4]_i_6_n_0\,
      I5 => IN_B(26),
      O => \addExponentDeltaAMinusB[4]_i_3_n_0\
    );
\addExponentDeltaAMinusB[4]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00008000"
    )
        port map (
      I0 => IN_B(25),
      I1 => IN_B(24),
      I2 => IN_B(23),
      I3 => IN_B(26),
      I4 => \addExponentDeltaAMinusB[4]_i_7_n_0\,
      O => \addExponentDeltaAMinusB[4]_i_4_n_0\
    );
\addExponentDeltaAMinusB[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1500355015403D54"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_B(23),
      I2 => IN_B(24),
      I3 => IN_B(25),
      I4 => IN_A(24),
      I5 => IN_A(23),
      O => \addExponentDeltaAMinusB[4]_i_5_n_0\
    );
\addExponentDeltaAMinusB[4]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => IN_B(25),
      I1 => IN_B(24),
      I2 => IN_B(23),
      O => \addExponentDeltaAMinusB[4]_i_6_n_0\
    );
\addExponentDeltaAMinusB[4]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_A(23),
      I2 => IN_A(24),
      I3 => IN_A(26),
      O => \addExponentDeltaAMinusB[4]_i_7_n_0\
    );
\addExponentDeltaAMinusB[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96969669"
    )
        port map (
      I0 => IN_B(28),
      I1 => \addExponentDeltaAMinusB[5]_i_2_n_0\,
      I2 => IN_A(28),
      I3 => \addExponentDeltaAMinusB[5]_i_3_n_0\,
      I4 => \addExponentDeltaAMinusB[5]_i_4_n_0\,
      O => addExponentDeltaAMinusB0(5)
    );
\addExponentDeltaAMinusB[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => IN_B(25),
      I1 => IN_B(24),
      I2 => IN_B(23),
      I3 => IN_B(26),
      I4 => IN_B(27),
      O => \addExponentDeltaAMinusB[5]_i_2_n_0\
    );
\addExponentDeltaAMinusB[5]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45040445"
    )
        port map (
      I0 => \addExponentDeltaAMinusB[4]_i_4_n_0\,
      I1 => \addExponentDeltaAMinusB[4]_i_3_n_0\,
      I2 => IN_A(27),
      I3 => \addExponentDeltaAMinusB[4]_i_2_n_0\,
      I4 => IN_B(27),
      O => \addExponentDeltaAMinusB[5]_i_3_n_0\
    );
\addExponentDeltaAMinusB[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => IN_B(27),
      I1 => IN_B(26),
      I2 => IN_B(23),
      I3 => IN_B(24),
      I4 => IN_B(25),
      I5 => \addExponentDeltaBMinusA[5]_i_2_n_0\,
      O => \addExponentDeltaAMinusB[5]_i_4_n_0\
    );
\addExponentDeltaAMinusB[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96699666"
    )
        port map (
      I0 => IN_B(29),
      I1 => IN_A(29),
      I2 => \addExponentDeltaAMinusB[7]_i_3_n_0\,
      I3 => \addExponentDeltaAMinusB[7]_i_2_n_0\,
      I4 => \addExponentDeltaAMinusB[7]_i_4_n_0\,
      O => addExponentDeltaAMinusB0(6)
    );
\addExponentDeltaAMinusB[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00960F9FFF69F060"
    )
        port map (
      I0 => IN_B(29),
      I1 => IN_A(29),
      I2 => \addExponentDeltaAMinusB[7]_i_2_n_0\,
      I3 => \addExponentDeltaAMinusB[7]_i_3_n_0\,
      I4 => \addExponentDeltaAMinusB[7]_i_4_n_0\,
      I5 => \addExponentDeltaAMinusB[7]_i_5_n_0\,
      O => addExponentDeltaAMinusB0(7)
    );
\addExponentDeltaAMinusB[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => IN_B(27),
      I1 => IN_B(26),
      I2 => IN_B(23),
      I3 => IN_B(24),
      I4 => IN_B(25),
      I5 => IN_B(28),
      O => \addExponentDeltaAMinusB[7]_i_2_n_0\
    );
\addExponentDeltaAMinusB[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"45040445"
    )
        port map (
      I0 => \addExponentDeltaAMinusB[5]_i_4_n_0\,
      I1 => \addExponentDeltaAMinusB[5]_i_3_n_0\,
      I2 => IN_A(28),
      I3 => \addExponentDeltaAMinusB[5]_i_2_n_0\,
      I4 => IN_B(28),
      O => \addExponentDeltaAMinusB[7]_i_3_n_0\
    );
\addExponentDeltaAMinusB[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => IN_A(27),
      I1 => IN_A(25),
      I2 => IN_A(23),
      I3 => IN_A(24),
      I4 => IN_A(26),
      I5 => IN_A(28),
      O => \addExponentDeltaAMinusB[7]_i_4_n_0\
    );
\addExponentDeltaAMinusB[7]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3693C96C"
    )
        port map (
      I0 => IN_A(29),
      I1 => IN_B(30),
      I2 => \addExponentDeltaAMinusB[7]_i_2_n_0\,
      I3 => IN_B(29),
      I4 => IN_A(30),
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
      INIT => X"FFFFFFFFEEEFEEEE"
    )
        port map (
      I0 => addExponentDeltaBMinusA0(7),
      I1 => addExponentDeltaBMinusA0(5),
      I2 => addExponentDeltaAMinusBShiftTooFar_i_3_n_0,
      I3 => addExponentDeltaBMinusAShiftTooFar_i_2_n_0,
      I4 => addExponentDeltaBMinusA0(4),
      I5 => addExponentDeltaBMinusA0(6),
      O => addExponentDeltaBMinusAShiftTooFar_i_1_n_0
    );
addExponentDeltaBMinusAShiftTooFar_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9969669696996966"
    )
        port map (
      I0 => addExponentDeltaBMinusAShiftTooFar_i_3_n_0,
      I1 => IN_B(26),
      I2 => addExponentDeltaBMinusAShiftTooFar_i_4_n_0,
      I3 => IN_A(25),
      I4 => IN_A(26),
      I5 => IN_B(25),
      O => addExponentDeltaBMinusAShiftTooFar_i_2_n_0
    );
addExponentDeltaBMinusAShiftTooFar_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BF0BC0C0C0C0BF0B"
    )
        port map (
      I0 => IN_B(23),
      I1 => IN_A(23),
      I2 => IN_A(24),
      I3 => IN_B(24),
      I4 => IN_B(25),
      I5 => IN_A(25),
      O => addExponentDeltaBMinusAShiftTooFar_i_3_n_0
    );
addExponentDeltaBMinusAShiftTooFar_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => IN_A(23),
      I1 => IN_A(24),
      O => addExponentDeltaBMinusAShiftTooFar_i_4_n_0
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
      INIT => X"4BB4"
    )
        port map (
      I0 => IN_B(23),
      I1 => IN_A(23),
      I2 => IN_A(24),
      I3 => IN_B(24),
      O => addExponentDeltaBMinusA0(1)
    );
\addExponentDeltaBMinusA[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6966666699996966"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_B(25),
      I2 => IN_B(23),
      I3 => IN_A(23),
      I4 => IN_A(24),
      I5 => IN_B(24),
      O => addExponentDeltaBMinusA0(2)
    );
\addExponentDeltaBMinusA[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => addExponentDeltaBMinusAShiftTooFar_i_2_n_0,
      O => addExponentDeltaBMinusA0(3)
    );
\addExponentDeltaBMinusA[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9996"
    )
        port map (
      I0 => \addExponentDeltaBMinusA[4]_i_2_n_0\,
      I1 => IN_B(27),
      I2 => \addExponentDeltaBMinusA[4]_i_3_n_0\,
      I3 => \addExponentDeltaAMinusB[4]_i_4_n_0\,
      O => addExponentDeltaBMinusA0(4)
    );
\addExponentDeltaBMinusA[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => IN_A(27),
      I1 => IN_A(26),
      I2 => IN_A(24),
      I3 => IN_A(23),
      I4 => IN_A(25),
      O => \addExponentDeltaBMinusA[4]_i_2_n_0\
    );
\addExponentDeltaBMinusA[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0FF00B000F0B0BB"
    )
        port map (
      I0 => addExponentDeltaAMinusBShiftTooFar_i_5_n_0,
      I1 => IN_B(25),
      I2 => \addExponentDeltaBMinusA[4]_i_4_n_0\,
      I3 => IN_B(26),
      I4 => \addExponentDeltaBMinusA[4]_i_5_n_0\,
      I5 => IN_A(26),
      O => \addExponentDeltaBMinusA[4]_i_3_n_0\
    );
\addExponentDeltaBMinusA[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01500FFF00007150"
    )
        port map (
      I0 => IN_B(24),
      I1 => IN_B(23),
      I2 => IN_A(24),
      I3 => IN_A(23),
      I4 => IN_B(25),
      I5 => IN_A(25),
      O => \addExponentDeltaBMinusA[4]_i_4_n_0\
    );
\addExponentDeltaBMinusA[4]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => IN_A(24),
      I1 => IN_A(23),
      I2 => IN_A(25),
      O => \addExponentDeltaBMinusA[4]_i_5_n_0\
    );
\addExponentDeltaBMinusA[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96969669"
    )
        port map (
      I0 => IN_A(28),
      I1 => \addExponentDeltaBMinusA[5]_i_2_n_0\,
      I2 => IN_B(28),
      I3 => \addExponentDeltaBMinusA[5]_i_3_n_0\,
      I4 => \addExponentDeltaAMinusB[5]_i_4_n_0\,
      O => addExponentDeltaBMinusA0(5)
    );
\addExponentDeltaBMinusA[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => IN_A(26),
      I1 => IN_A(24),
      I2 => IN_A(23),
      I3 => IN_A(25),
      I4 => IN_A(27),
      O => \addExponentDeltaBMinusA[5]_i_2_n_0\
    );
\addExponentDeltaBMinusA[5]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2302"
    )
        port map (
      I0 => \addExponentDeltaBMinusA[4]_i_3_n_0\,
      I1 => \addExponentDeltaAMinusB[4]_i_4_n_0\,
      I2 => IN_B(27),
      I3 => \addExponentDeltaBMinusA[4]_i_2_n_0\,
      O => \addExponentDeltaBMinusA[5]_i_3_n_0\
    );
\addExponentDeltaBMinusA[6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96966966"
    )
        port map (
      I0 => IN_B(29),
      I1 => IN_A(29),
      I2 => \addExponentDeltaBMinusA[7]_i_2_n_0\,
      I3 => \addExponentDeltaAMinusB[7]_i_2_n_0\,
      I4 => \addExponentDeltaAMinusB[7]_i_4_n_0\,
      O => addExponentDeltaBMinusA0(6)
    );
\addExponentDeltaBMinusA[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00960F9FFF69F060"
    )
        port map (
      I0 => IN_B(29),
      I1 => IN_A(29),
      I2 => \addExponentDeltaAMinusB[7]_i_4_n_0\,
      I3 => \addExponentDeltaBMinusA[7]_i_2_n_0\,
      I4 => \addExponentDeltaAMinusB[7]_i_2_n_0\,
      I5 => \addExponentDeltaBMinusA[7]_i_3_n_0\,
      O => addExponentDeltaBMinusA0(7)
    );
\addExponentDeltaBMinusA[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"23020223"
    )
        port map (
      I0 => \addExponentDeltaBMinusA[5]_i_3_n_0\,
      I1 => \addExponentDeltaAMinusB[5]_i_4_n_0\,
      I2 => IN_B(28),
      I3 => \addExponentDeltaBMinusA[5]_i_2_n_0\,
      I4 => IN_A(28),
      O => \addExponentDeltaBMinusA[7]_i_2_n_0\
    );
\addExponentDeltaBMinusA[7]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"3963C69C"
    )
        port map (
      I0 => IN_B(29),
      I1 => IN_A(30),
      I2 => IN_A(29),
      I3 => \addExponentDeltaAMinusB[7]_i_4_n_0\,
      I4 => IN_B(30),
      O => \addExponentDeltaBMinusA[7]_i_3_n_0\
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
      I1 => postAddMantissa0(24),
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
      I1 => postAddMantissa0(24),
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
      I3 => postAddMantissa0(24),
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
      I2 => postAddMantissa0(24),
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
      I2 => postAddMantissa0(24),
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
      I4 => postAddMantissa0(24),
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      I0 => addEarlyOutBypassEnable0,
      I1 => addPipelineValidStage0,
      I2 => p_1_in,
      I3 => p_0_in,
      I4 => addSameNumberDifferentSigns0,
      O => addMaxVal1
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
      CE => addMaxVal1,
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
      CE => addMaxVal1,
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
      CE => addMaxVal1,
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
      CE => addMaxVal1,
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
      CE => addMaxVal1,
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
      CE => addMaxVal1,
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
      CE => addMaxVal1,
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
      CE => addMaxVal1,
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
addPostAddMantissa10_carry: unisim.vcomponents.CARRY8
     port map (
      CI => GetFloatIsNegative,
      CI_TOP => '0',
      CO(7) => addPostAddMantissa10_carry_n_0,
      CO(6) => addPostAddMantissa10_carry_n_1,
      CO(5) => addPostAddMantissa10_carry_n_2,
      CO(4) => addPostAddMantissa10_carry_n_3,
      CO(3) => NLW_addPostAddMantissa10_carry_CO_UNCONNECTED(3),
      CO(2) => addPostAddMantissa10_carry_n_5,
      CO(1) => addPostAddMantissa10_carry_n_6,
      CO(0) => addPostAddMantissa10_carry_n_7,
      DI(7) => addPostAddMantissa10_carry_i_2_n_0,
      DI(6) => addPostAddMantissa10_carry_i_3_n_0,
      DI(5) => addPostAddMantissa10_carry_i_4_n_0,
      DI(4) => addPostAddMantissa10_carry_i_5_n_0,
      DI(3) => addPostAddMantissa10_carry_i_6_n_0,
      DI(2) => addPostAddMantissa10_carry_i_7_n_0,
      DI(1) => addPostAddMantissa10_carry_i_8_n_0,
      DI(0) => addPostAddMantissa10_carry_i_9_n_0,
      O(7 downto 0) => addPostAddMantissa10(7 downto 0),
      S(7) => addPostAddMantissa10_carry_i_10_n_0,
      S(6) => addPostAddMantissa10_carry_i_11_n_0,
      S(5) => addPostAddMantissa10_carry_i_12_n_0,
      S(4) => addPostAddMantissa10_carry_i_13_n_0,
      S(3) => addPostAddMantissa10_carry_i_14_n_0,
      S(2) => addPostAddMantissa10_carry_i_15_n_0,
      S(1) => addPostAddMantissa10_carry_i_16_n_0,
      S(0) => addPostAddMantissa10_carry_i_17_n_0
    );
\addPostAddMantissa10_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => addPostAddMantissa10_carry_n_0,
      CI_TOP => '0',
      CO(7) => \addPostAddMantissa10_carry__0_n_0\,
      CO(6) => \addPostAddMantissa10_carry__0_n_1\,
      CO(5) => \addPostAddMantissa10_carry__0_n_2\,
      CO(4) => \addPostAddMantissa10_carry__0_n_3\,
      CO(3) => \NLW_addPostAddMantissa10_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \addPostAddMantissa10_carry__0_n_5\,
      CO(1) => \addPostAddMantissa10_carry__0_n_6\,
      CO(0) => \addPostAddMantissa10_carry__0_n_7\,
      DI(7) => \addPostAddMantissa10_carry__0_i_1_n_0\,
      DI(6) => \addPostAddMantissa10_carry__0_i_2_n_0\,
      DI(5) => \addPostAddMantissa10_carry__0_i_3_n_0\,
      DI(4) => \addPostAddMantissa10_carry__0_i_4_n_0\,
      DI(3) => \addPostAddMantissa10_carry__0_i_5_n_0\,
      DI(2) => \addPostAddMantissa10_carry__0_i_6_n_0\,
      DI(1) => \addPostAddMantissa10_carry__0_i_7_n_0\,
      DI(0) => \addPostAddMantissa10_carry__0_i_8_n_0\,
      O(7 downto 0) => addPostAddMantissa10(15 downto 8),
      S(7) => \addPostAddMantissa10_carry__0_i_9_n_0\,
      S(6) => \addPostAddMantissa10_carry__0_i_10_n_0\,
      S(5) => \addPostAddMantissa10_carry__0_i_11_n_0\,
      S(4) => \addPostAddMantissa10_carry__0_i_12_n_0\,
      S(3) => \addPostAddMantissa10_carry__0_i_13_n_0\,
      S(2) => \addPostAddMantissa10_carry__0_i_14_n_0\,
      S(1) => \addPostAddMantissa10_carry__0_i_15_n_0\,
      S(0) => \addPostAddMantissa10_carry__0_i_16_n_0\
    );
\addPostAddMantissa10_carry__0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[15]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[15]\,
      O => \addPostAddMantissa10_carry__0_i_1_n_0\
    );
\addPostAddMantissa10_carry__0_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_2_n_0\,
      I1 => \addPostAddMantissa10_carry__0_i_19_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__0_i_17_n_0\,
      O => \addPostAddMantissa10_carry__0_i_10_n_0\
    );
\addPostAddMantissa10_carry__0_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_3_n_0\,
      I1 => \addPostAddMantissa10_carry__0_i_20_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__0_i_19_n_0\,
      O => \addPostAddMantissa10_carry__0_i_11_n_0\
    );
\addPostAddMantissa10_carry__0_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_4_n_0\,
      I1 => \addPostAddMantissa10_carry__0_i_21_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__0_i_20_n_0\,
      O => \addPostAddMantissa10_carry__0_i_12_n_0\
    );
\addPostAddMantissa10_carry__0_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_5_n_0\,
      I1 => \addPostAddMantissa10_carry__0_i_22_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__0_i_21_n_0\,
      O => \addPostAddMantissa10_carry__0_i_13_n_0\
    );
\addPostAddMantissa10_carry__0_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_6_n_0\,
      I1 => \addPostAddMantissa10_carry__0_i_23_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__0_i_22_n_0\,
      O => \addPostAddMantissa10_carry__0_i_14_n_0\
    );
\addPostAddMantissa10_carry__0_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_7_n_0\,
      I1 => \addPostAddMantissa10_carry__0_i_24_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__0_i_23_n_0\,
      O => \addPostAddMantissa10_carry__0_i_15_n_0\
    );
\addPostAddMantissa10_carry__0_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_8_n_0\,
      I1 => addPostAddMantissa10_carry_i_19_n_0,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__0_i_24_n_0\,
      O => \addPostAddMantissa10_carry__0_i_16_n_0\
    );
\addPostAddMantissa10_carry__0_i_17\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_25_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10_carry__0_i_26_n_0\,
      O => \addPostAddMantissa10_carry__0_i_17_n_0\
    );
\addPostAddMantissa10_carry__0_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_27_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10_carry__0_i_28_n_0\,
      O => \addPostAddMantissa10_carry__0_i_18_n_0\
    );
\addPostAddMantissa10_carry__0_i_19\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_28_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10_carry__0_i_29_n_0\,
      O => \addPostAddMantissa10_carry__0_i_19_n_0\
    );
\addPostAddMantissa10_carry__0_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[14]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[14]\,
      O => \addPostAddMantissa10_carry__0_i_2_n_0\
    );
\addPostAddMantissa10_carry__0_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_26_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10_carry__0_i_30_n_0\,
      O => \addPostAddMantissa10_carry__0_i_20_n_0\
    );
\addPostAddMantissa10_carry__0_i_21\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_29_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10_carry__0_i_31_n_0\,
      O => \addPostAddMantissa10_carry__0_i_21_n_0\
    );
\addPostAddMantissa10_carry__0_i_22\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_30_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10_carry__0_i_32_n_0\,
      O => \addPostAddMantissa10_carry__0_i_22_n_0\
    );
\addPostAddMantissa10_carry__0_i_23\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_31_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => addPostAddMantissa10_carry_i_35_n_0,
      O => \addPostAddMantissa10_carry__0_i_23_n_0\
    );
\addPostAddMantissa10_carry__0_i_24\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_32_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => addPostAddMantissa10_carry_i_31_n_0,
      O => \addPostAddMantissa10_carry__0_i_24_n_0\
    );
\addPostAddMantissa10_carry__0_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FB0BFF00F808"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_70_n_0,
      I1 => addPostAddMantissa10_carry_i_33_n_0,
      I2 => addPostAddMantissa10_carry_i_44_n_0,
      I3 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I5 => addPostAddMantissa10_carry_i_69_n_0,
      O => \addPostAddMantissa10_carry__0_i_25_n_0\
    );
\addPostAddMantissa10_carry__0_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I1 => \addPostAddMantissa10_carry__0_i_33_n_0\,
      I2 => addPostAddMantissa10_carry_i_33_n_0,
      I3 => \addPostAddMantissa10_carry__0_i_34_n_0\,
      I4 => addPostAddMantissa10_carry_i_44_n_0,
      I5 => addPostAddMantissa10_carry_i_58_n_0,
      O => \addPostAddMantissa10_carry__0_i_26_n_0\
    );
\addPostAddMantissa10_carry__0_i_27\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FB0BFF00F808"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_29_n_0\,
      I1 => addPostAddMantissa10_carry_i_33_n_0,
      I2 => addPostAddMantissa10_carry_i_44_n_0,
      I3 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I5 => addPostAddMantissa10_carry_i_67_n_0,
      O => \addPostAddMantissa10_carry__0_i_27_n_0\
    );
\addPostAddMantissa10_carry__0_i_28\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FB0BFF00F808"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_73_n_0,
      I1 => addPostAddMantissa10_carry_i_33_n_0,
      I2 => addPostAddMantissa10_carry_i_44_n_0,
      I3 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I5 => addPostAddMantissa10_carry_i_72_n_0,
      O => \addPostAddMantissa10_carry__0_i_28_n_0\
    );
\addPostAddMantissa10_carry__0_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I1 => addPostAddMantissa10_carry_i_63_n_0,
      I2 => addPostAddMantissa10_carry_i_33_n_0,
      I3 => addPostAddMantissa10_carry_i_61_n_0,
      I4 => addPostAddMantissa10_carry_i_44_n_0,
      I5 => addPostAddMantissa10_carry_i_62_n_0,
      O => \addPostAddMantissa10_carry__0_i_29_n_0\
    );
\addPostAddMantissa10_carry__0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[13]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[13]\,
      O => \addPostAddMantissa10_carry__0_i_3_n_0\
    );
\addPostAddMantissa10_carry__0_i_30\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I1 => addPostAddMantissa10_carry_i_55_n_0,
      I2 => addPostAddMantissa10_carry_i_33_n_0,
      I3 => addPostAddMantissa10_carry_i_53_n_0,
      I4 => addPostAddMantissa10_carry_i_44_n_0,
      I5 => addPostAddMantissa10_carry_i_54_n_0,
      O => \addPostAddMantissa10_carry__0_i_30_n_0\
    );
\addPostAddMantissa10_carry__0_i_31\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I1 => addPostAddMantissa10_carry_i_66_n_0,
      I2 => addPostAddMantissa10_carry_i_33_n_0,
      I3 => addPostAddMantissa10_carry_i_64_n_0,
      I4 => addPostAddMantissa10_carry_i_44_n_0,
      I5 => addPostAddMantissa10_carry_i_65_n_0,
      O => \addPostAddMantissa10_carry__0_i_31_n_0\
    );
\addPostAddMantissa10_carry__0_i_32\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_34_n_0\,
      I1 => addPostAddMantissa10_carry_i_58_n_0,
      I2 => addPostAddMantissa10_carry_i_33_n_0,
      I3 => \addPostAddMantissa10_carry__0_i_33_n_0\,
      I4 => addPostAddMantissa10_carry_i_44_n_0,
      I5 => addPostAddMantissa10_carry_i_43_n_0,
      O => \addPostAddMantissa10_carry__0_i_32_n_0\
    );
\addPostAddMantissa10_carry__0_i_33\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0E5E0"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I1 => mantissaMin0(19),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__0_i_35_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => \addPostAddMantissa10_carry__0_i_33_n_0\
    );
\addPostAddMantissa10_carry__0_i_34\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFB800470047"
    )
        port map (
      I0 => addExponentDeltaBMinusA(4),
      I1 => addALessThanB,
      I2 => addExponentDeltaAMinusB(4),
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => mantissaMin0(23),
      I5 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      O => \addPostAddMantissa10_carry__0_i_34_n_0\
    );
\addPostAddMantissa10_carry__0_i_35\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[19]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[19]\,
      O => \addPostAddMantissa10_carry__0_i_35_n_0\
    );
\addPostAddMantissa10_carry__0_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[12]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[12]\,
      O => \addPostAddMantissa10_carry__0_i_4_n_0\
    );
\addPostAddMantissa10_carry__0_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[11]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[11]\,
      O => \addPostAddMantissa10_carry__0_i_5_n_0\
    );
\addPostAddMantissa10_carry__0_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[10]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[10]\,
      O => \addPostAddMantissa10_carry__0_i_6_n_0\
    );
\addPostAddMantissa10_carry__0_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[9]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[9]\,
      O => \addPostAddMantissa10_carry__0_i_7_n_0\
    );
\addPostAddMantissa10_carry__0_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[8]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[8]\,
      O => \addPostAddMantissa10_carry__0_i_8_n_0\
    );
\addPostAddMantissa10_carry__0_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__0_i_1_n_0\,
      I1 => \addPostAddMantissa10_carry__0_i_17_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__0_i_18_n_0\,
      O => \addPostAddMantissa10_carry__0_i_9_n_0\
    );
\addPostAddMantissa10_carry__1\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa10_carry__0_n_0\,
      CI_TOP => '0',
      CO(7) => \addPostAddMantissa10_carry__1_n_0\,
      CO(6) => \addPostAddMantissa10_carry__1_n_1\,
      CO(5) => \addPostAddMantissa10_carry__1_n_2\,
      CO(4) => \addPostAddMantissa10_carry__1_n_3\,
      CO(3) => \NLW_addPostAddMantissa10_carry__1_CO_UNCONNECTED\(3),
      CO(2) => \addPostAddMantissa10_carry__1_n_5\,
      CO(1) => \addPostAddMantissa10_carry__1_n_6\,
      CO(0) => \addPostAddMantissa10_carry__1_n_7\,
      DI(7) => \addPostAddMantissa10_carry__1_i_1_n_0\,
      DI(6) => \addPostAddMantissa10_carry__1_i_2_n_0\,
      DI(5) => \addPostAddMantissa10_carry__1_i_3_n_0\,
      DI(4) => \addPostAddMantissa10_carry__1_i_4_n_0\,
      DI(3) => \addPostAddMantissa10_carry__1_i_5_n_0\,
      DI(2) => \addPostAddMantissa10_carry__1_i_6_n_0\,
      DI(1) => \addPostAddMantissa10_carry__1_i_7_n_0\,
      DI(0) => \addPostAddMantissa10_carry__1_i_8_n_0\,
      O(7 downto 0) => addPostAddMantissa10(23 downto 16),
      S(7) => \addPostAddMantissa10_carry__1_i_9_n_0\,
      S(6) => \addPostAddMantissa10_carry__1_i_10_n_0\,
      S(5) => \addPostAddMantissa10_carry__1_i_11_n_0\,
      S(4) => \addPostAddMantissa10_carry__1_i_12_n_0\,
      S(3) => \addPostAddMantissa10_carry__1_i_13_n_0\,
      S(2) => \addPostAddMantissa10_carry__1_i_14_n_0\,
      S(1) => \addPostAddMantissa10_carry__1_i_15_n_0\,
      S(0) => \addPostAddMantissa10_carry__1_i_16_n_0\
    );
\addPostAddMantissa10_carry__1_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => p_1_in,
      I1 => addALessThanB,
      I2 => p_0_in,
      O => \addPostAddMantissa10_carry__1_i_1_n_0\
    );
\addPostAddMantissa10_carry__1_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55A556A65AAA56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_2_n_0\,
      I1 => \addPostAddMantissa10_carry__1_i_18_n_0\,
      I2 => addPostAddMantissa10_carry_i_24_n_0,
      I3 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I4 => addExponentDeltaAMinusB(0),
      I5 => \addPostAddMantissa10_carry__1_i_17_n_0\,
      O => \addPostAddMantissa10_carry__1_i_10_n_0\
    );
\addPostAddMantissa10_carry__1_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_3_n_0\,
      I1 => \addPostAddMantissa10_carry__1_i_20_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__1_i_21_n_0\,
      O => \addPostAddMantissa10_carry__1_i_11_n_0\
    );
\addPostAddMantissa10_carry__1_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_4_n_0\,
      I1 => \addPostAddMantissa10_carry__1_i_22_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__1_i_20_n_0\,
      O => \addPostAddMantissa10_carry__1_i_12_n_0\
    );
\addPostAddMantissa10_carry__1_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_5_n_0\,
      I1 => \addPostAddMantissa10_carry__1_i_23_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__1_i_22_n_0\,
      O => \addPostAddMantissa10_carry__1_i_13_n_0\
    );
\addPostAddMantissa10_carry__1_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_6_n_0\,
      I1 => \addPostAddMantissa10_carry__1_i_24_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__1_i_23_n_0\,
      O => \addPostAddMantissa10_carry__1_i_14_n_0\
    );
\addPostAddMantissa10_carry__1_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_7_n_0\,
      I1 => \addPostAddMantissa10_carry__1_i_25_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__1_i_24_n_0\,
      O => \addPostAddMantissa10_carry__1_i_15_n_0\
    );
\addPostAddMantissa10_carry__1_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_8_n_0\,
      I1 => \addPostAddMantissa10_carry__0_i_18_n_0\,
      I2 => addExponentDeltaAMinusB(0),
      I3 => \addPostAddMantissa10_carry__1_i_25_n_0\,
      O => \addPostAddMantissa10_carry__1_i_16_n_0\
    );
\addPostAddMantissa10_carry__1_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFE00010001"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_33_n_0,
      I1 => addPostAddMantissa10_carry_i_44_n_0,
      I2 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => mantissaMin0(23),
      I5 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      O => \addPostAddMantissa10_carry__1_i_17_n_0\
    );
\addPostAddMantissa10_carry__1_i_18\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F1F0E0"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_33_n_0,
      I1 => addPostAddMantissa10_carry_i_44_n_0,
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_29_n_0\,
      O => \addPostAddMantissa10_carry__1_i_18_n_0\
    );
\addPostAddMantissa10_carry__1_i_19\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_1_in,
      I1 => addALessThanB,
      I2 => p_0_in,
      O => \addPostAddMantissa10_carry__1_i_19_n_0\
    );
\addPostAddMantissa10_carry__1_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[22]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[22]\,
      O => \addPostAddMantissa10_carry__1_i_2_n_0\
    );
\addPostAddMantissa10_carry__1_i_20\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_17_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10_carry__1_i_30_n_0\,
      O => \addPostAddMantissa10_carry__1_i_20_n_0\
    );
\addPostAddMantissa10_carry__1_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FF01FF00FE00"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_24_n_0,
      I1 => addPostAddMantissa10_carry_i_33_n_0,
      I2 => addPostAddMantissa10_carry_i_44_n_0,
      I3 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I5 => \addPostAddMantissa10_carry__1_i_29_n_0\,
      O => \addPostAddMantissa10_carry__1_i_21_n_0\
    );
\addPostAddMantissa10_carry__1_i_22\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_18_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10_carry__1_i_31_n_0\,
      O => \addPostAddMantissa10_carry__1_i_22_n_0\
    );
\addPostAddMantissa10_carry__1_i_23\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_30_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10_carry__1_i_32_n_0\,
      O => \addPostAddMantissa10_carry__1_i_23_n_0\
    );
\addPostAddMantissa10_carry__1_i_24\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_31_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10_carry__0_i_27_n_0\,
      O => \addPostAddMantissa10_carry__1_i_24_n_0\
    );
\addPostAddMantissa10_carry__1_i_25\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_32_n_0\,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => \addPostAddMantissa10_carry__0_i_25_n_0\,
      O => \addPostAddMantissa10_carry__1_i_25_n_0\
    );
\addPostAddMantissa10_carry__1_i_26\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addExponentDeltaBMinusA(4),
      I1 => addALessThanB,
      I2 => addExponentDeltaAMinusB(4),
      O => \addPostAddMantissa10_carry__1_i_26_n_0\
    );
\addPostAddMantissa10_carry__1_i_27\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000FFFE"
    )
        port map (
      I0 => addALessThanB,
      I1 => addExponentDeltaAMinusB(5),
      I2 => addExponentDeltaAMinusB(6),
      I3 => addExponentDeltaAMinusB(7),
      I4 => \addPostAddMantissa10_carry__1_i_33_n_0\,
      O => \addPostAddMantissa10_carry__1_i_27_n_0\
    );
\addPostAddMantissa10_carry__1_i_28\: unisim.vcomponents.CARRY8
     port map (
      CI => addPostAddMantissa10_carry_i_76_n_0,
      CI_TOP => '0',
      CO(7) => \NLW_addPostAddMantissa10_carry__1_i_28_CO_UNCONNECTED\(7),
      CO(6) => mantissaMin0(23),
      CO(5) => \NLW_addPostAddMantissa10_carry__1_i_28_CO_UNCONNECTED\(5),
      CO(4) => \addPostAddMantissa10_carry__1_i_28_n_3\,
      CO(3) => \NLW_addPostAddMantissa10_carry__1_i_28_CO_UNCONNECTED\(3),
      CO(2) => \addPostAddMantissa10_carry__1_i_28_n_5\,
      CO(1) => \addPostAddMantissa10_carry__1_i_28_n_6\,
      CO(0) => \addPostAddMantissa10_carry__1_i_28_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 6) => \NLW_addPostAddMantissa10_carry__1_i_28_O_UNCONNECTED\(7 downto 6),
      O(5 downto 0) => mantissaMin0(22 downto 17),
      S(7 downto 6) => B"01",
      S(5) => \addPostAddMantissa10_carry__1_i_34_n_0\,
      S(4) => \addPostAddMantissa10_carry__1_i_35_n_0\,
      S(3) => \addPostAddMantissa10_carry__1_i_36_n_0\,
      S(2) => \addPostAddMantissa10_carry__1_i_37_n_0\,
      S(1) => \addPostAddMantissa10_carry__1_i_38_n_0\,
      S(0) => \addPostAddMantissa10_carry__1_i_39_n_0\
    );
\addPostAddMantissa10_carry__1_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF0000E200E2"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[22]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[22]\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => mantissaMin0(22),
      I5 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      O => \addPostAddMantissa10_carry__1_i_29_n_0\
    );
\addPostAddMantissa10_carry__1_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[21]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[21]\,
      O => \addPostAddMantissa10_carry__1_i_3_n_0\
    );
\addPostAddMantissa10_carry__1_i_30\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F1F0E0"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_33_n_0,
      I1 => addPostAddMantissa10_carry_i_44_n_0,
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => addPostAddMantissa10_carry_i_70_n_0,
      O => \addPostAddMantissa10_carry__1_i_30_n_0\
    );
\addPostAddMantissa10_carry__1_i_31\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F1F0E0"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_33_n_0,
      I1 => addPostAddMantissa10_carry_i_44_n_0,
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => addPostAddMantissa10_carry_i_73_n_0,
      O => \addPostAddMantissa10_carry__1_i_31_n_0\
    );
\addPostAddMantissa10_carry__1_i_32\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00FB0BFF00F808"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_59_n_0,
      I1 => addPostAddMantissa10_carry_i_33_n_0,
      I2 => addPostAddMantissa10_carry_i_44_n_0,
      I3 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I5 => addPostAddMantissa10_carry_i_57_n_0,
      O => \addPostAddMantissa10_carry__1_i_32_n_0\
    );
\addPostAddMantissa10_carry__1_i_33\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => addExponentDeltaBMinusA(5),
      I1 => addALessThanB,
      I2 => addExponentDeltaBMinusA(7),
      I3 => addExponentDeltaBMinusA(6),
      O => \addPostAddMantissa10_carry__1_i_33_n_0\
    );
\addPostAddMantissa10_carry__1_i_34\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[22]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[22]\,
      O => \addPostAddMantissa10_carry__1_i_34_n_0\
    );
\addPostAddMantissa10_carry__1_i_35\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[21]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[21]\,
      O => \addPostAddMantissa10_carry__1_i_35_n_0\
    );
\addPostAddMantissa10_carry__1_i_36\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[20]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[20]\,
      O => \addPostAddMantissa10_carry__1_i_36_n_0\
    );
\addPostAddMantissa10_carry__1_i_37\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[19]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[19]\,
      O => \addPostAddMantissa10_carry__1_i_37_n_0\
    );
\addPostAddMantissa10_carry__1_i_38\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[18]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[18]\,
      O => \addPostAddMantissa10_carry__1_i_38_n_0\
    );
\addPostAddMantissa10_carry__1_i_39\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[17]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[17]\,
      O => \addPostAddMantissa10_carry__1_i_39_n_0\
    );
\addPostAddMantissa10_carry__1_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[20]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[20]\,
      O => \addPostAddMantissa10_carry__1_i_4_n_0\
    );
\addPostAddMantissa10_carry__1_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[19]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[19]\,
      O => \addPostAddMantissa10_carry__1_i_5_n_0\
    );
\addPostAddMantissa10_carry__1_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[18]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[18]\,
      O => \addPostAddMantissa10_carry__1_i_6_n_0\
    );
\addPostAddMantissa10_carry__1_i_7\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[17]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[17]\,
      O => \addPostAddMantissa10_carry__1_i_7_n_0\
    );
\addPostAddMantissa10_carry__1_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[16]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[16]\,
      O => \addPostAddMantissa10_carry__1_i_8_n_0\
    );
\addPostAddMantissa10_carry__1_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F00F0FE1E22D1D"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_17_n_0\,
      I1 => addPostAddMantissa10_carry_i_24_n_0,
      I2 => p_0_in,
      I3 => addALessThanB,
      I4 => p_1_in,
      I5 => addExponentDeltaAMinusB(0),
      O => \addPostAddMantissa10_carry__1_i_9_n_0\
    );
\addPostAddMantissa10_carry__2\: unisim.vcomponents.CARRY8
     port map (
      CI => \addPostAddMantissa10_carry__1_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_addPostAddMantissa10_carry__2_CO_UNCONNECTED\(7 downto 1),
      CO(0) => \addPostAddMantissa10_carry__2_n_7\,
      DI(7 downto 1) => B"0000000",
      DI(0) => \addPostAddMantissa10_carry__2_i_1_n_0\,
      O(7 downto 2) => \NLW_addPostAddMantissa10_carry__2_O_UNCONNECTED\(7 downto 2),
      O(1 downto 0) => addPostAddMantissa10(25 downto 24),
      S(7 downto 1) => B"0000001",
      S(0) => \addPostAddMantissa10_carry__2_i_2_n_0\
    );
\addPostAddMantissa10_carry__2_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => p_0_in,
      I1 => addALessThanB,
      I2 => p_1_in,
      O => \addPostAddMantissa10_carry__2_i_1_n_0\
    );
\addPostAddMantissa10_carry__2_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      O => \addPostAddMantissa10_carry__2_i_2_n_0\
    );
addPostAddMantissa10_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => p_0_in,
      I1 => addALessThanB,
      I2 => p_1_in,
      O => GetFloatIsNegative
    );
addPostAddMantissa10_carry_i_10: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_2_n_0,
      I1 => addPostAddMantissa10_carry_i_18_n_0,
      I2 => addExponentDeltaAMinusB(0),
      I3 => addPostAddMantissa10_carry_i_19_n_0,
      O => addPostAddMantissa10_carry_i_10_n_0
    );
addPostAddMantissa10_carry_i_100: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[14]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[14]\,
      O => addPostAddMantissa10_carry_i_100_n_0
    );
addPostAddMantissa10_carry_i_101: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[13]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[13]\,
      O => addPostAddMantissa10_carry_i_101_n_0
    );
addPostAddMantissa10_carry_i_102: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[12]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[12]\,
      O => addPostAddMantissa10_carry_i_102_n_0
    );
addPostAddMantissa10_carry_i_103: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[11]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[11]\,
      O => addPostAddMantissa10_carry_i_103_n_0
    );
addPostAddMantissa10_carry_i_104: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[10]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[10]\,
      O => addPostAddMantissa10_carry_i_104_n_0
    );
addPostAddMantissa10_carry_i_105: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[9]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[9]\,
      O => addPostAddMantissa10_carry_i_105_n_0
    );
addPostAddMantissa10_carry_i_106: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[0]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[0]\,
      O => addPostAddMantissa10_carry_i_106_n_0
    );
addPostAddMantissa10_carry_i_107: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[8]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[8]\,
      O => addPostAddMantissa10_carry_i_107_n_0
    );
addPostAddMantissa10_carry_i_108: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[7]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[7]\,
      O => addPostAddMantissa10_carry_i_108_n_0
    );
addPostAddMantissa10_carry_i_109: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[6]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[6]\,
      O => addPostAddMantissa10_carry_i_109_n_0
    );
addPostAddMantissa10_carry_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_3_n_0,
      I1 => addPostAddMantissa10_carry_i_20_n_0,
      I2 => addExponentDeltaAMinusB(0),
      I3 => addPostAddMantissa10_carry_i_18_n_0,
      O => addPostAddMantissa10_carry_i_11_n_0
    );
addPostAddMantissa10_carry_i_110: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[5]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[5]\,
      O => addPostAddMantissa10_carry_i_110_n_0
    );
addPostAddMantissa10_carry_i_111: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[4]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[4]\,
      O => addPostAddMantissa10_carry_i_111_n_0
    );
addPostAddMantissa10_carry_i_112: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[3]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[3]\,
      O => addPostAddMantissa10_carry_i_112_n_0
    );
addPostAddMantissa10_carry_i_113: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[2]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[2]\,
      O => addPostAddMantissa10_carry_i_113_n_0
    );
addPostAddMantissa10_carry_i_114: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[1]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[1]\,
      O => addPostAddMantissa10_carry_i_114_n_0
    );
addPostAddMantissa10_carry_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_4_n_0,
      I1 => addPostAddMantissa10_carry_i_21_n_0,
      I2 => addExponentDeltaAMinusB(0),
      I3 => addPostAddMantissa10_carry_i_20_n_0,
      O => addPostAddMantissa10_carry_i_12_n_0
    );
addPostAddMantissa10_carry_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"56A6"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_5_n_0,
      I1 => addPostAddMantissa10_carry_i_22_n_0,
      I2 => addExponentDeltaAMinusB(0),
      I3 => addPostAddMantissa10_carry_i_21_n_0,
      O => addPostAddMantissa10_carry_i_13_n_0
    );
addPostAddMantissa10_carry_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_6_n_0,
      I1 => addPostAddMantissa10_carry_i_23_n_0,
      I2 => addPostAddMantissa10_carry_i_24_n_0,
      I3 => addPostAddMantissa10_carry_i_25_n_0,
      I4 => addExponentDeltaAMinusB(0),
      I5 => addPostAddMantissa10_carry_i_22_n_0,
      O => addPostAddMantissa10_carry_i_14_n_0
    );
addPostAddMantissa10_carry_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"565656A6A6A656A6"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_7_n_0,
      I1 => addPostAddMantissa10_carry_i_26_n_0,
      I2 => addExponentDeltaAMinusB(0),
      I3 => addPostAddMantissa10_carry_i_23_n_0,
      I4 => addPostAddMantissa10_carry_i_24_n_0,
      I5 => addPostAddMantissa10_carry_i_25_n_0,
      O => addPostAddMantissa10_carry_i_15_n_0
    );
addPostAddMantissa10_carry_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"565656A6A6A656A6"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_8_n_0,
      I1 => addPostAddMantissa10_carry_i_27_n_0,
      I2 => addExponentDeltaAMinusB(0),
      I3 => addPostAddMantissa10_carry_i_28_n_0,
      I4 => addPostAddMantissa10_carry_i_24_n_0,
      I5 => addPostAddMantissa10_carry_i_29_n_0,
      O => addPostAddMantissa10_carry_i_16_n_0
    );
addPostAddMantissa10_carry_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"555556A6AAAA56A6"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_9_n_0,
      I1 => addPostAddMantissa10_carry_i_30_n_0,
      I2 => addPostAddMantissa10_carry_i_24_n_0,
      I3 => addPostAddMantissa10_carry_i_28_n_0,
      I4 => addExponentDeltaAMinusB(0),
      I5 => addPostAddMantissa10_carry_i_27_n_0,
      O => addPostAddMantissa10_carry_i_17_n_0
    );
addPostAddMantissa10_carry_i_18: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_31_n_0,
      I1 => addPostAddMantissa10_carry_i_24_n_0,
      I2 => addPostAddMantissa10_carry_i_32_n_0,
      I3 => addPostAddMantissa10_carry_i_33_n_0,
      I4 => addPostAddMantissa10_carry_i_34_n_0,
      O => addPostAddMantissa10_carry_i_18_n_0
    );
addPostAddMantissa10_carry_i_19: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_35_n_0,
      I1 => addExponentDeltaBMinusA(1),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(1),
      I4 => addPostAddMantissa10_carry_i_36_n_0,
      O => addPostAddMantissa10_carry_i_19_n_0
    );
addPostAddMantissa10_carry_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[7]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[7]\,
      O => addPostAddMantissa10_carry_i_2_n_0
    );
addPostAddMantissa10_carry_i_20: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_36_n_0,
      I1 => addPostAddMantissa10_carry_i_24_n_0,
      I2 => addPostAddMantissa10_carry_i_37_n_0,
      I3 => addPostAddMantissa10_carry_i_33_n_0,
      I4 => addPostAddMantissa10_carry_i_38_n_0,
      O => addPostAddMantissa10_carry_i_20_n_0
    );
addPostAddMantissa10_carry_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_32_n_0,
      I1 => addPostAddMantissa10_carry_i_34_n_0,
      I2 => addPostAddMantissa10_carry_i_24_n_0,
      I3 => addPostAddMantissa10_carry_i_39_n_0,
      I4 => addPostAddMantissa10_carry_i_33_n_0,
      I5 => addPostAddMantissa10_carry_i_40_n_0,
      O => addPostAddMantissa10_carry_i_21_n_0
    );
addPostAddMantissa10_carry_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_37_n_0,
      I1 => addPostAddMantissa10_carry_i_38_n_0,
      I2 => addPostAddMantissa10_carry_i_24_n_0,
      I3 => addPostAddMantissa10_carry_i_41_n_0,
      I4 => addPostAddMantissa10_carry_i_33_n_0,
      I5 => addPostAddMantissa10_carry_i_42_n_0,
      O => addPostAddMantissa10_carry_i_22_n_0
    );
addPostAddMantissa10_carry_i_23: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF00B8B8"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_43_n_0,
      I1 => addPostAddMantissa10_carry_i_44_n_0,
      I2 => addPostAddMantissa10_carry_i_45_n_0,
      I3 => addPostAddMantissa10_carry_i_34_n_0,
      I4 => addPostAddMantissa10_carry_i_33_n_0,
      O => addPostAddMantissa10_carry_i_23_n_0
    );
addPostAddMantissa10_carry_i_24: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addExponentDeltaBMinusA(1),
      I1 => addALessThanB,
      I2 => addExponentDeltaAMinusB(1),
      O => addPostAddMantissa10_carry_i_24_n_0
    );
addPostAddMantissa10_carry_i_25: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_39_n_0,
      I1 => addExponentDeltaBMinusA(2),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(2),
      I4 => addPostAddMantissa10_carry_i_40_n_0,
      O => addPostAddMantissa10_carry_i_25_n_0
    );
addPostAddMantissa10_carry_i_26: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_41_n_0,
      I1 => addPostAddMantissa10_carry_i_42_n_0,
      I2 => addPostAddMantissa10_carry_i_24_n_0,
      I3 => addPostAddMantissa10_carry_i_38_n_0,
      I4 => addPostAddMantissa10_carry_i_33_n_0,
      I5 => addPostAddMantissa10_carry_i_46_n_0,
      O => addPostAddMantissa10_carry_i_26_n_0
    );
addPostAddMantissa10_carry_i_27: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFE0AFAFEFE0A0A0"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_47_n_0,
      I1 => addPostAddMantissa10_carry_i_34_n_0,
      I2 => addPostAddMantissa10_carry_i_24_n_0,
      I3 => addPostAddMantissa10_carry_i_40_n_0,
      I4 => addPostAddMantissa10_carry_i_33_n_0,
      I5 => addPostAddMantissa10_carry_i_48_n_0,
      O => addPostAddMantissa10_carry_i_27_n_0
    );
addPostAddMantissa10_carry_i_28: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_38_n_0,
      I1 => addPostAddMantissa10_carry_i_33_n_0,
      I2 => addPostAddMantissa10_carry_i_49_n_0,
      I3 => addPostAddMantissa10_carry_i_44_n_0,
      I4 => addPostAddMantissa10_carry_i_50_n_0,
      O => addPostAddMantissa10_carry_i_28_n_0
    );
addPostAddMantissa10_carry_i_29: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BABF8A80"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_41_n_0,
      I1 => addExponentDeltaBMinusA(2),
      I2 => addALessThanB,
      I3 => addExponentDeltaAMinusB(2),
      I4 => addPostAddMantissa10_carry_i_42_n_0,
      O => addPostAddMantissa10_carry_i_29_n_0
    );
addPostAddMantissa10_carry_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[6]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[6]\,
      O => addPostAddMantissa10_carry_i_3_n_0
    );
addPostAddMantissa10_carry_i_30: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_42_n_0,
      I1 => addPostAddMantissa10_carry_i_33_n_0,
      I2 => addPostAddMantissa10_carry_i_51_n_0,
      I3 => addPostAddMantissa10_carry_i_44_n_0,
      I4 => addPostAddMantissa10_carry_i_52_n_0,
      O => addPostAddMantissa10_carry_i_30_n_0
    );
addPostAddMantissa10_carry_i_31: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_53_n_0,
      I1 => addPostAddMantissa10_carry_i_54_n_0,
      I2 => addPostAddMantissa10_carry_i_33_n_0,
      I3 => addPostAddMantissa10_carry_i_55_n_0,
      I4 => addPostAddMantissa10_carry_i_44_n_0,
      I5 => addPostAddMantissa10_carry_i_56_n_0,
      O => addPostAddMantissa10_carry_i_31_n_0
    );
addPostAddMantissa10_carry_i_32: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I1 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I2 => addPostAddMantissa10_carry_i_57_n_0,
      I3 => addPostAddMantissa10_carry_i_44_n_0,
      I4 => addPostAddMantissa10_carry_i_43_n_0,
      O => addPostAddMantissa10_carry_i_32_n_0
    );
addPostAddMantissa10_carry_i_33: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addExponentDeltaBMinusA(2),
      I1 => addALessThanB,
      I2 => addExponentDeltaAMinusB(2),
      O => addPostAddMantissa10_carry_i_33_n_0
    );
addPostAddMantissa10_carry_i_34: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B888BBBB"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_58_n_0,
      I1 => addPostAddMantissa10_carry_i_44_n_0,
      I2 => addPostAddMantissa10_carry_i_59_n_0,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => addPostAddMantissa10_carry_i_60_n_0,
      O => addPostAddMantissa10_carry_i_34_n_0
    );
addPostAddMantissa10_carry_i_35: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_61_n_0,
      I1 => addPostAddMantissa10_carry_i_62_n_0,
      I2 => addPostAddMantissa10_carry_i_33_n_0,
      I3 => addPostAddMantissa10_carry_i_63_n_0,
      I4 => addPostAddMantissa10_carry_i_44_n_0,
      I5 => addPostAddMantissa10_carry_i_49_n_0,
      O => addPostAddMantissa10_carry_i_35_n_0
    );
addPostAddMantissa10_carry_i_36: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_64_n_0,
      I1 => addPostAddMantissa10_carry_i_65_n_0,
      I2 => addPostAddMantissa10_carry_i_33_n_0,
      I3 => addPostAddMantissa10_carry_i_66_n_0,
      I4 => addPostAddMantissa10_carry_i_44_n_0,
      I5 => addPostAddMantissa10_carry_i_51_n_0,
      O => addPostAddMantissa10_carry_i_36_n_0
    );
addPostAddMantissa10_carry_i_37: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I1 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I2 => addPostAddMantissa10_carry_i_67_n_0,
      I3 => addPostAddMantissa10_carry_i_44_n_0,
      I4 => addPostAddMantissa10_carry_i_49_n_0,
      O => addPostAddMantissa10_carry_i_37_n_0
    );
addPostAddMantissa10_carry_i_38: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_62_n_0,
      I1 => addPostAddMantissa10_carry_i_44_n_0,
      I2 => \addPostAddMantissa10_carry__1_i_29_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => addPostAddMantissa10_carry_i_68_n_0,
      O => addPostAddMantissa10_carry_i_38_n_0
    );
addPostAddMantissa10_carry_i_39: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I1 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I2 => addPostAddMantissa10_carry_i_69_n_0,
      I3 => addPostAddMantissa10_carry_i_44_n_0,
      I4 => addPostAddMantissa10_carry_i_56_n_0,
      O => addPostAddMantissa10_carry_i_39_n_0
    );
addPostAddMantissa10_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[5]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[5]\,
      O => addPostAddMantissa10_carry_i_4_n_0
    );
addPostAddMantissa10_carry_i_40: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_54_n_0,
      I1 => addPostAddMantissa10_carry_i_44_n_0,
      I2 => addPostAddMantissa10_carry_i_70_n_0,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => addPostAddMantissa10_carry_i_71_n_0,
      O => addPostAddMantissa10_carry_i_40_n_0
    );
addPostAddMantissa10_carry_i_41: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I1 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I2 => addPostAddMantissa10_carry_i_72_n_0,
      I3 => addPostAddMantissa10_carry_i_44_n_0,
      I4 => addPostAddMantissa10_carry_i_51_n_0,
      O => addPostAddMantissa10_carry_i_41_n_0
    );
addPostAddMantissa10_carry_i_42: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_65_n_0,
      I1 => addPostAddMantissa10_carry_i_44_n_0,
      I2 => addPostAddMantissa10_carry_i_73_n_0,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => addPostAddMantissa10_carry_i_74_n_0,
      O => addPostAddMantissa10_carry_i_42_n_0
    );
addPostAddMantissa10_carry_i_43: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0CA"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_75_n_0,
      I1 => mantissaMin0(11),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_43_n_0
    );
addPostAddMantissa10_carry_i_44: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addExponentDeltaBMinusA(3),
      I1 => addALessThanB,
      I2 => addExponentDeltaAMinusB(3),
      O => addPostAddMantissa10_carry_i_44_n_0
    );
addPostAddMantissa10_carry_i_45: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB8BB88BBB88B888"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_57_n_0,
      I1 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I2 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I4 => mantissaMin0(3),
      I5 => addPostAddMantissa10_carry_i_78_n_0,
      O => addPostAddMantissa10_carry_i_45_n_0
    );
addPostAddMantissa10_carry_i_46: unisim.vcomponents.LUT5
    generic map(
      INIT => X"BBBBB888"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_49_n_0,
      I1 => addPostAddMantissa10_carry_i_44_n_0,
      I2 => addPostAddMantissa10_carry_i_67_n_0,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => addPostAddMantissa10_carry_i_79_n_0,
      O => addPostAddMantissa10_carry_i_46_n_0
    );
addPostAddMantissa10_carry_i_47: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFF800F8"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_57_n_0,
      I1 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I2 => addPostAddMantissa10_carry_i_80_n_0,
      I3 => addPostAddMantissa10_carry_i_44_n_0,
      I4 => addPostAddMantissa10_carry_i_43_n_0,
      I5 => addPostAddMantissa10_carry_i_33_n_0,
      O => addPostAddMantissa10_carry_i_47_n_0
    );
addPostAddMantissa10_carry_i_48: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_56_n_0,
      I1 => addPostAddMantissa10_carry_i_44_n_0,
      I2 => addPostAddMantissa10_carry_i_69_n_0,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => addPostAddMantissa10_carry_i_81_n_0,
      O => addPostAddMantissa10_carry_i_48_n_0
    );
addPostAddMantissa10_carry_i_49: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0CA"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_82_n_0,
      I1 => mantissaMin0(10),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_49_n_0
    );
addPostAddMantissa10_carry_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[4]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[4]\,
      O => addPostAddMantissa10_carry_i_5_n_0
    );
addPostAddMantissa10_carry_i_50: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BB8BB88BBB88B888"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_67_n_0,
      I1 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I2 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I4 => mantissaMin0(2),
      I5 => addPostAddMantissa10_carry_i_83_n_0,
      O => addPostAddMantissa10_carry_i_50_n_0
    );
addPostAddMantissa10_carry_i_51: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0CA"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_84_n_0,
      I1 => mantissaMin0(8),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_51_n_0
    );
addPostAddMantissa10_carry_i_52: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00AFCFFF00A0C0"
    )
        port map (
      I0 => mantissaMin0(16),
      I1 => addPostAddMantissa10_carry_i_85_n_0,
      I2 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I5 => addPostAddMantissa10_carry_i_86_n_0,
      O => addPostAddMantissa10_carry_i_52_n_0
    );
addPostAddMantissa10_carry_i_53: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFA0404"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I1 => addPostAddMantissa10_carry_i_87_n_0,
      I2 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I3 => mantissaMin0(21),
      I4 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      O => addPostAddMantissa10_carry_i_53_n_0
    );
addPostAddMantissa10_carry_i_54: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0CA"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_88_n_0,
      I1 => mantissaMin0(13),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_54_n_0
    );
addPostAddMantissa10_carry_i_55: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFA0404"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I1 => addPostAddMantissa10_carry_i_89_n_0,
      I2 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I3 => mantissaMin0(17),
      I4 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      O => addPostAddMantissa10_carry_i_55_n_0
    );
addPostAddMantissa10_carry_i_56: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0CA"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_90_n_0,
      I1 => mantissaMin0(9),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_56_n_0
    );
addPostAddMantissa10_carry_i_57: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCBBB888B8"
    )
        port map (
      I0 => mantissaMin0(19),
      I1 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I2 => \addDenormFlushedValB_reg_n_0_[19]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValA_reg_n_0_[19]\,
      I5 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_57_n_0
    );
addPostAddMantissa10_carry_i_58: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0CA"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_91_n_0,
      I1 => mantissaMin0(15),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_58_n_0
    );
addPostAddMantissa10_carry_i_59: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EEE555E5"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I1 => mantissaMin0(23),
      I2 => p_0_in,
      I3 => addALessThanB,
      I4 => p_1_in,
      O => addPostAddMantissa10_carry_i_59_n_0
    );
addPostAddMantissa10_carry_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[3]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[3]\,
      O => addPostAddMantissa10_carry_i_6_n_0
    );
addPostAddMantissa10_carry_i_60: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0F35"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_92_n_0,
      I1 => mantissaMin0(7),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      O => addPostAddMantissa10_carry_i_60_n_0
    );
addPostAddMantissa10_carry_i_61: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFA0404"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I1 => addPostAddMantissa10_carry_i_93_n_0,
      I2 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I3 => mantissaMin0(22),
      I4 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      O => addPostAddMantissa10_carry_i_61_n_0
    );
addPostAddMantissa10_carry_i_62: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0CA"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_94_n_0,
      I1 => mantissaMin0(14),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_62_n_0
    );
addPostAddMantissa10_carry_i_63: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0E5E0"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I1 => mantissaMin0(18),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => addPostAddMantissa10_carry_i_95_n_0,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_63_n_0
    );
addPostAddMantissa10_carry_i_64: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFA0404"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I1 => addPostAddMantissa10_carry_i_96_n_0,
      I2 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I3 => mantissaMin0(20),
      I4 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      O => addPostAddMantissa10_carry_i_64_n_0
    );
addPostAddMantissa10_carry_i_65: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0F0CA"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_97_n_0,
      I1 => mantissaMin0(12),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_65_n_0
    );
addPostAddMantissa10_carry_i_66: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F0F0E5E0"
    )
        port map (
      I0 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      I1 => mantissaMin0(16),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => addPostAddMantissa10_carry_i_85_n_0,
      I4 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_66_n_0
    );
addPostAddMantissa10_carry_i_67: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCBBB888B8"
    )
        port map (
      I0 => mantissaMin0(18),
      I1 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I2 => \addDenormFlushedValB_reg_n_0_[18]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValA_reg_n_0_[18]\,
      I5 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_67_n_0
    );
addPostAddMantissa10_carry_i_68: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF00E2FF0000E2"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[6]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[6]\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I5 => mantissaMin0(6),
      O => addPostAddMantissa10_carry_i_68_n_0
    );
addPostAddMantissa10_carry_i_69: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF0000E200E2"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[17]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[17]\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => mantissaMin0(17),
      I5 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      O => addPostAddMantissa10_carry_i_69_n_0
    );
addPostAddMantissa10_carry_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[2]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[2]\,
      O => addPostAddMantissa10_carry_i_7_n_0
    );
addPostAddMantissa10_carry_i_70: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF0000E200E2"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[21]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[21]\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => mantissaMin0(21),
      I5 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      O => addPostAddMantissa10_carry_i_70_n_0
    );
addPostAddMantissa10_carry_i_71: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF00E2FF0000E2"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[5]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[5]\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I5 => mantissaMin0(5),
      O => addPostAddMantissa10_carry_i_71_n_0
    );
addPostAddMantissa10_carry_i_72: unisim.vcomponents.LUT6
    generic map(
      INIT => X"CCCCCCCCBBB888B8"
    )
        port map (
      I0 => mantissaMin0(16),
      I1 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I2 => \addDenormFlushedValB_reg_n_0_[16]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValA_reg_n_0_[16]\,
      I5 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      O => addPostAddMantissa10_carry_i_72_n_0
    );
addPostAddMantissa10_carry_i_73: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF0000E200E2"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[20]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[20]\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => mantissaMin0(20),
      I5 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      O => addPostAddMantissa10_carry_i_73_n_0
    );
addPostAddMantissa10_carry_i_74: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF00E2FF0000E2"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[4]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[4]\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I5 => mantissaMin0(4),
      O => addPostAddMantissa10_carry_i_74_n_0
    );
addPostAddMantissa10_carry_i_75: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[11]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[11]\,
      O => addPostAddMantissa10_carry_i_75_n_0
    );
addPostAddMantissa10_carry_i_76: unisim.vcomponents.CARRY8
     port map (
      CI => addPostAddMantissa10_carry_i_77_n_0,
      CI_TOP => '0',
      CO(7) => addPostAddMantissa10_carry_i_76_n_0,
      CO(6) => addPostAddMantissa10_carry_i_76_n_1,
      CO(5) => addPostAddMantissa10_carry_i_76_n_2,
      CO(4) => addPostAddMantissa10_carry_i_76_n_3,
      CO(3) => NLW_addPostAddMantissa10_carry_i_76_CO_UNCONNECTED(3),
      CO(2) => addPostAddMantissa10_carry_i_76_n_5,
      CO(1) => addPostAddMantissa10_carry_i_76_n_6,
      CO(0) => addPostAddMantissa10_carry_i_76_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => mantissaMin0(16 downto 9),
      S(7) => addPostAddMantissa10_carry_i_98_n_0,
      S(6) => addPostAddMantissa10_carry_i_99_n_0,
      S(5) => addPostAddMantissa10_carry_i_100_n_0,
      S(4) => addPostAddMantissa10_carry_i_101_n_0,
      S(3) => addPostAddMantissa10_carry_i_102_n_0,
      S(2) => addPostAddMantissa10_carry_i_103_n_0,
      S(1) => addPostAddMantissa10_carry_i_104_n_0,
      S(0) => addPostAddMantissa10_carry_i_105_n_0
    );
addPostAddMantissa10_carry_i_77: unisim.vcomponents.CARRY8
     port map (
      CI => addPostAddMantissa10_carry_i_106_n_0,
      CI_TOP => '0',
      CO(7) => addPostAddMantissa10_carry_i_77_n_0,
      CO(6) => addPostAddMantissa10_carry_i_77_n_1,
      CO(5) => addPostAddMantissa10_carry_i_77_n_2,
      CO(4) => addPostAddMantissa10_carry_i_77_n_3,
      CO(3) => NLW_addPostAddMantissa10_carry_i_77_CO_UNCONNECTED(3),
      CO(2) => addPostAddMantissa10_carry_i_77_n_5,
      CO(1) => addPostAddMantissa10_carry_i_77_n_6,
      CO(0) => addPostAddMantissa10_carry_i_77_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => mantissaMin0(8 downto 1),
      S(7) => addPostAddMantissa10_carry_i_107_n_0,
      S(6) => addPostAddMantissa10_carry_i_108_n_0,
      S(5) => addPostAddMantissa10_carry_i_109_n_0,
      S(4) => addPostAddMantissa10_carry_i_110_n_0,
      S(3) => addPostAddMantissa10_carry_i_111_n_0,
      S(2) => addPostAddMantissa10_carry_i_112_n_0,
      S(1) => addPostAddMantissa10_carry_i_113_n_0,
      S(0) => addPostAddMantissa10_carry_i_114_n_0
    );
addPostAddMantissa10_carry_i_78: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[3]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[3]\,
      O => addPostAddMantissa10_carry_i_78_n_0
    );
addPostAddMantissa10_carry_i_79: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F0CA"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_83_n_0,
      I1 => mantissaMin0(2),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      O => addPostAddMantissa10_carry_i_79_n_0
    );
addPostAddMantissa10_carry_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[1]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[1]\,
      O => addPostAddMantissa10_carry_i_8_n_0
    );
addPostAddMantissa10_carry_i_80: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F0CA"
    )
        port map (
      I0 => addPostAddMantissa10_carry_i_78_n_0,
      I1 => mantissaMin0(3),
      I2 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_26_n_0\,
      O => addPostAddMantissa10_carry_i_80_n_0
    );
addPostAddMantissa10_carry_i_81: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF00E2FF0000E2"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[1]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[1]\,
      I3 => \addPostAddMantissa10_carry__1_i_27_n_0\,
      I4 => \addPostAddMantissa10_carry__1_i_19_n_0\,
      I5 => mantissaMin0(1),
      O => addPostAddMantissa10_carry_i_81_n_0
    );
addPostAddMantissa10_carry_i_82: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[10]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[10]\,
      O => addPostAddMantissa10_carry_i_82_n_0
    );
addPostAddMantissa10_carry_i_83: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[2]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[2]\,
      O => addPostAddMantissa10_carry_i_83_n_0
    );
addPostAddMantissa10_carry_i_84: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[8]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[8]\,
      O => addPostAddMantissa10_carry_i_84_n_0
    );
addPostAddMantissa10_carry_i_85: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[16]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[16]\,
      O => addPostAddMantissa10_carry_i_85_n_0
    );
addPostAddMantissa10_carry_i_86: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[0]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[0]\,
      O => addPostAddMantissa10_carry_i_86_n_0
    );
addPostAddMantissa10_carry_i_87: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[21]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[21]\,
      O => addPostAddMantissa10_carry_i_87_n_0
    );
addPostAddMantissa10_carry_i_88: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[13]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[13]\,
      O => addPostAddMantissa10_carry_i_88_n_0
    );
addPostAddMantissa10_carry_i_89: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[17]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[17]\,
      O => addPostAddMantissa10_carry_i_89_n_0
    );
addPostAddMantissa10_carry_i_9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"335ACC5A"
    )
        port map (
      I0 => p_1_in,
      I1 => p_0_in,
      I2 => \addDenormFlushedValA_reg_n_0_[0]\,
      I3 => addALessThanB,
      I4 => \addDenormFlushedValB_reg_n_0_[0]\,
      O => addPostAddMantissa10_carry_i_9_n_0
    );
addPostAddMantissa10_carry_i_90: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[9]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[9]\,
      O => addPostAddMantissa10_carry_i_90_n_0
    );
addPostAddMantissa10_carry_i_91: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[15]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[15]\,
      O => addPostAddMantissa10_carry_i_91_n_0
    );
addPostAddMantissa10_carry_i_92: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[7]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[7]\,
      O => addPostAddMantissa10_carry_i_92_n_0
    );
addPostAddMantissa10_carry_i_93: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[22]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[22]\,
      O => addPostAddMantissa10_carry_i_93_n_0
    );
addPostAddMantissa10_carry_i_94: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[14]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[14]\,
      O => addPostAddMantissa10_carry_i_94_n_0
    );
addPostAddMantissa10_carry_i_95: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[18]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[18]\,
      O => addPostAddMantissa10_carry_i_95_n_0
    );
addPostAddMantissa10_carry_i_96: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[20]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[20]\,
      O => addPostAddMantissa10_carry_i_96_n_0
    );
addPostAddMantissa10_carry_i_97: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \addDenormFlushedValA_reg_n_0_[12]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValB_reg_n_0_[12]\,
      O => addPostAddMantissa10_carry_i_97_n_0
    );
addPostAddMantissa10_carry_i_98: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[16]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[16]\,
      O => addPostAddMantissa10_carry_i_98_n_0
    );
addPostAddMantissa10_carry_i_99: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1D"
    )
        port map (
      I0 => \addDenormFlushedValB_reg_n_0_[15]\,
      I1 => addALessThanB,
      I2 => \addDenormFlushedValA_reg_n_0_[15]\,
      O => addPostAddMantissa10_carry_i_99_n_0
    );
\addPostAddMantissa1[25]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"02A2"
    )
        port map (
      I0 => addMaxVal1,
      I1 => addExponentDeltaAMinusBShiftTooFar,
      I2 => addALessThanB,
      I3 => addExponentDeltaBMinusAShiftTooFar,
      O => addPostAddMantissa1
    );
\addPostAddMantissa1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(0),
      Q => \addPostAddMantissa1_reg_n_0_[0]\,
      R => '0'
    );
\addPostAddMantissa1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(10),
      Q => \addPostAddMantissa1_reg_n_0_[10]\,
      R => '0'
    );
\addPostAddMantissa1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(11),
      Q => \addPostAddMantissa1_reg_n_0_[11]\,
      R => '0'
    );
\addPostAddMantissa1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(12),
      Q => \addPostAddMantissa1_reg_n_0_[12]\,
      R => '0'
    );
\addPostAddMantissa1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(13),
      Q => \addPostAddMantissa1_reg_n_0_[13]\,
      R => '0'
    );
\addPostAddMantissa1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(14),
      Q => \addPostAddMantissa1_reg_n_0_[14]\,
      R => '0'
    );
\addPostAddMantissa1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(15),
      Q => \addPostAddMantissa1_reg_n_0_[15]\,
      R => '0'
    );
\addPostAddMantissa1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(16),
      Q => \addPostAddMantissa1_reg_n_0_[16]\,
      R => '0'
    );
\addPostAddMantissa1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(17),
      Q => \addPostAddMantissa1_reg_n_0_[17]\,
      R => '0'
    );
\addPostAddMantissa1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(18),
      Q => \addPostAddMantissa1_reg_n_0_[18]\,
      R => '0'
    );
\addPostAddMantissa1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(19),
      Q => \addPostAddMantissa1_reg_n_0_[19]\,
      R => '0'
    );
\addPostAddMantissa1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(1),
      Q => \addPostAddMantissa1_reg_n_0_[1]\,
      R => '0'
    );
\addPostAddMantissa1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(20),
      Q => \addPostAddMantissa1_reg_n_0_[20]\,
      R => '0'
    );
\addPostAddMantissa1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(21),
      Q => \addPostAddMantissa1_reg_n_0_[21]\,
      R => '0'
    );
\addPostAddMantissa1_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(22),
      Q => \addPostAddMantissa1_reg_n_0_[22]\,
      R => '0'
    );
\addPostAddMantissa1_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(23),
      Q => \addPostAddMantissa1_reg_n_0_[23]\,
      R => '0'
    );
\addPostAddMantissa1_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(24),
      Q => \addPostAddMantissa1_reg_n_0_[24]\,
      R => '0'
    );
\addPostAddMantissa1_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(25),
      Q => \addPostAddMantissa1_reg_n_0_[25]\,
      R => '0'
    );
\addPostAddMantissa1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(2),
      Q => \addPostAddMantissa1_reg_n_0_[2]\,
      R => '0'
    );
\addPostAddMantissa1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(3),
      Q => \addPostAddMantissa1_reg_n_0_[3]\,
      R => '0'
    );
\addPostAddMantissa1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(4),
      Q => \addPostAddMantissa1_reg_n_0_[4]\,
      R => '0'
    );
\addPostAddMantissa1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(5),
      Q => \addPostAddMantissa1_reg_n_0_[5]\,
      R => '0'
    );
\addPostAddMantissa1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(6),
      Q => \addPostAddMantissa1_reg_n_0_[6]\,
      R => '0'
    );
\addPostAddMantissa1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(7),
      Q => \addPostAddMantissa1_reg_n_0_[7]\,
      R => '0'
    );
\addPostAddMantissa1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(8),
      Q => \addPostAddMantissa1_reg_n_0_[8]\,
      R => '0'
    );
\addPostAddMantissa1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa1,
      D => addPostAddMantissa10(9),
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
      I3 => postAddMantissa0(1),
      I4 => postAddMantissa0(24),
      I5 => \addPostAddMantissa1_reg_n_0_[25]\,
      O => \addPostAddMantissa[0]_i_1_n_0\
    );
\addPostAddMantissa[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFB080"
    )
        port map (
      I0 => postAddMantissa0(11),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(10),
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
      I0 => postAddMantissa0(12),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(11),
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
      I0 => postAddMantissa0(13),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(12),
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
      I0 => postAddMantissa0(14),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(13),
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
      I0 => postAddMantissa0(15),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(14),
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
      I0 => postAddMantissa0(16),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(15),
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
      I0 => postAddMantissa0(17),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(16),
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
      I0 => postAddMantissa0(18),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(17),
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
      I0 => postAddMantissa0(19),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(18),
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
      I0 => postAddMantissa0(20),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(19),
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
      I0 => postAddMantissa0(2),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(1),
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
      I0 => postAddMantissa0(21),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(20),
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
      I0 => postAddMantissa0(22),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(21),
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
      I0 => postAddMantissa0(23),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(22),
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
      I0 => postAddMantissa0(3),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(2),
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
      I0 => postAddMantissa0(4),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(3),
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
      I0 => postAddMantissa0(5),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(4),
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
      I0 => postAddMantissa0(6),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(5),
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
      I0 => postAddMantissa0(7),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(6),
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
      I0 => postAddMantissa0(8),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(7),
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
      I0 => postAddMantissa0(9),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(8),
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
      I0 => postAddMantissa0(10),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(9),
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CO(3) => \NLW_addPostAddMantissa_reg[16]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \addPostAddMantissa_reg[16]_i_2_n_5\,
      CO(1) => \addPostAddMantissa_reg[16]_i_2_n_6\,
      CO(0) => \addPostAddMantissa_reg[16]_i_2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => postAddMantissa0(16 downto 9),
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CE => addPostAddMantissa,
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
      CO(3) => \NLW_addPostAddMantissa_reg[8]_i_2_CO_UNCONNECTED\(3),
      CO(2) => \addPostAddMantissa_reg[8]_i_2_n_5\,
      CO(1) => \addPostAddMantissa_reg[8]_i_2_n_6\,
      CO(0) => \addPostAddMantissa_reg[8]_i_2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => postAddMantissa0(8 downto 1),
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
      CE => addPostAddMantissa,
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
      I0 => postAddMantissa0(16),
      I1 => \addRenormalizeShiftAmount[4]_i_4_n_0\,
      I2 => postAddMantissa0(14),
      I3 => postAddMantissa0(15),
      O => \addRenormalizeShiftAmount[0]_i_2_n_0\
    );
\addRenormalizeShiftAmount[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10101000"
    )
        port map (
      I0 => postAddMantissa0(13),
      I1 => postAddMantissa0(15),
      I2 => \addRenormalizeShiftAmount[4]_i_4_n_0\,
      I3 => postAddMantissa0(12),
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
      I1 => postAddMantissa0(18),
      I2 => postAddMantissa0(19),
      I3 => \addRenormalizeShiftAmount[0]_i_7_n_0\,
      I4 => postAddMantissa0(20),
      I5 => \addRenormalizeShiftAmount[0]_i_8_n_0\,
      O => \addRenormalizeShiftAmount[0]_i_5_n_0\
    );
\addRenormalizeShiftAmount[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AAAAEEFE"
    )
        port map (
      I0 => postAddMantissa0(10),
      I1 => postAddMantissa0(8),
      I2 => \addRenormalizeShiftAmount[0]_i_9_n_0\,
      I3 => postAddMantissa0(7),
      I4 => postAddMantissa0(9),
      I5 => postAddMantissa0(11),
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
      I0 => postAddMantissa0(22),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(23),
      I4 => \addRenormalizeShiftAmount[0]_i_11_n_0\,
      O => \addRenormalizeShiftAmount[0]_i_8_n_0\
    );
\addRenormalizeShiftAmount[0]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF55551011"
    )
        port map (
      I0 => postAddMantissa0(5),
      I1 => postAddMantissa0(3),
      I2 => postAddMantissa0(2),
      I3 => postAddMantissa0(1),
      I4 => postAddMantissa0(4),
      I5 => postAddMantissa0(6),
      O => \addRenormalizeShiftAmount[0]_i_9_n_0\
    );
\addRenormalizeShiftAmount[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFBBBAAAAA"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[1]_i_2_n_0\,
      I1 => postAddMantissa0(22),
      I2 => postAddMantissa0(20),
      I3 => postAddMantissa0(21),
      I4 => \addRenormalizeShiftAmount[1]_i_3_n_0\,
      I5 => \addRenormalizeShiftAmount[1]_i_4_n_0\,
      O => \addRenormalizeShiftAmount[1]_i_1_n_0\
    );
\addRenormalizeShiftAmount[1]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1110111011101111"
    )
        port map (
      I0 => postAddMantissa0(7),
      I1 => postAddMantissa0(6),
      I2 => postAddMantissa0(4),
      I3 => postAddMantissa0(5),
      I4 => postAddMantissa0(2),
      I5 => postAddMantissa0(3),
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
      I1 => postAddMantissa0(16),
      I2 => postAddMantissa0(17),
      I3 => postAddMantissa0(15),
      I4 => postAddMantissa0(14),
      I5 => \addRenormalizeShiftAmount[1]_i_6_n_0\,
      O => \addRenormalizeShiftAmount[1]_i_2_n_0\
    );
\addRenormalizeShiftAmount[1]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => postAddMantissa0(24),
      I1 => \addPostAddMantissa1_reg_n_0_[25]\,
      I2 => postAddMantissa0(23),
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
      I0 => postAddMantissa0(19),
      I1 => postAddMantissa0(18),
      I2 => postAddMantissa0(22),
      I3 => postAddMantissa0(23),
      I4 => \addPostAddMantissa1_reg_n_0_[25]\,
      I5 => postAddMantissa0(24),
      O => \addRenormalizeShiftAmount[1]_i_5_n_0\
    );
\addRenormalizeShiftAmount[1]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF5554"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[1]_i_9_n_0\,
      I1 => \addRenormalizeShiftAmount[1]_i_10_n_0\,
      I2 => postAddMantissa0(9),
      I3 => postAddMantissa0(8),
      I4 => postAddMantissa0(13),
      I5 => postAddMantissa0(12),
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
      I0 => postAddMantissa0(10),
      I1 => postAddMantissa0(11),
      O => \addRenormalizeShiftAmount[1]_i_9_n_0\
    );
\addRenormalizeShiftAmount[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF000E0000"
    )
        port map (
      I0 => \addRenormalizeShiftAmount[2]_i_2_n_0\,
      I1 => \addRenormalizeShiftAmount[2]_i_3_n_0\,
      I2 => postAddMantissa0(22),
      I3 => postAddMantissa0(20),
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
      I1 => postAddMantissa0(7),
      I2 => postAddMantissa0(6),
      I3 => postAddMantissa0(5),
      I4 => postAddMantissa0(4),
      I5 => \addRenormalizeShiftAmount[2]_i_7_n_0\,
      O => \addRenormalizeShiftAmount[2]_i_2_n_0\
    );
\addRenormalizeShiftAmount[2]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => postAddMantissa0(18),
      I1 => postAddMantissa0(16),
      I2 => postAddMantissa0(19),
      I3 => postAddMantissa0(17),
      O => \addRenormalizeShiftAmount[2]_i_3_n_0\
    );
\addRenormalizeShiftAmount[2]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => postAddMantissa0(23),
      I1 => \addPostAddMantissa1_reg_n_0_[25]\,
      I2 => postAddMantissa0(24),
      I3 => postAddMantissa0(21),
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
      I0 => postAddMantissa0(14),
      I1 => postAddMantissa0(12),
      I2 => postAddMantissa0(15),
      I3 => postAddMantissa0(13),
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
      O => addPostAddMantissa
    );
\addRenormalizeShiftAmount[4]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => postAddMantissa0(11),
      I1 => postAddMantissa0(10),
      I2 => postAddMantissa0(9),
      I3 => postAddMantissa0(8),
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
      I0 => postAddMantissa0(24),
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
      I0 => postAddMantissa0(21),
      I1 => postAddMantissa0(24),
      I2 => \addPostAddMantissa1_reg_n_0_[25]\,
      I3 => postAddMantissa0(23),
      I4 => postAddMantissa0(19),
      I5 => postAddMantissa0(17),
      O => \addRenormalizeShiftAmount[4]_i_4_n_0\
    );
\addRenormalizeShiftAmount[4]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => postAddMantissa0(20),
      I1 => postAddMantissa0(16),
      I2 => postAddMantissa0(22),
      I3 => postAddMantissa0(18),
      O => \addRenormalizeShiftAmount[4]_i_5_n_0\
    );
\addRenormalizeShiftAmount[4]_i_6\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => postAddMantissa0(13),
      I1 => postAddMantissa0(15),
      I2 => postAddMantissa0(12),
      I3 => postAddMantissa0(14),
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
      CE => addPostAddMantissa,
      D => \addRenormalizeShiftAmount[0]_i_1_n_0\,
      Q => addRenormalizeShiftAmount(0),
      R => '0'
    );
\addRenormalizeShiftAmount_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa,
      D => \addRenormalizeShiftAmount[1]_i_1_n_0\,
      Q => addRenormalizeShiftAmount(1),
      R => '0'
    );
\addRenormalizeShiftAmount_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa,
      D => \addRenormalizeShiftAmount[2]_i_1_n_0\,
      Q => addRenormalizeShiftAmount(2),
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
      CO(3) => \NLW_addRenormalizeShiftAmount_reg[2]_i_4_CO_UNCONNECTED\(3),
      CO(2) => \addRenormalizeShiftAmount_reg[2]_i_4_n_5\,
      CO(1) => \addRenormalizeShiftAmount_reg[2]_i_4_n_6\,
      CO(0) => \addRenormalizeShiftAmount_reg[2]_i_4_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => postAddMantissa0(24 downto 17),
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
      CE => addPostAddMantissa,
      D => \addRenormalizeShiftAmount[3]_i_1_n_0\,
      Q => addRenormalizeShiftAmount(3),
      R => '0'
    );
\addRenormalizeShiftAmount_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => addPostAddMantissa,
      D => \addRenormalizeShiftAmount[4]_i_2_n_0\,
      Q => addRenormalizeShiftAmount(4),
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
      CO(3) => NLW_addSameNumberDifferentSigns00_carry_CO_UNCONNECTED(3),
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
\addSameNumberDifferentSigns00_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => IN_B(30),
      I1 => IN_A(30),
      O => \addSameNumberDifferentSigns00_carry__0_i_1_n_0\
    );
\addSameNumberDifferentSigns00_carry__0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => IN_B(28),
      I1 => IN_A(28),
      I2 => IN_B(29),
      I3 => IN_A(29),
      I4 => IN_A(27),
      I5 => IN_B(27),
      O => \addSameNumberDifferentSigns00_carry__0_i_2_n_0\
    );
\addSameNumberDifferentSigns00_carry__0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => IN_A(26),
      I1 => IN_B(26),
      I2 => IN_B(25),
      I3 => IN_A(25),
      I4 => IN_B(24),
      I5 => IN_A(24),
      O => \addSameNumberDifferentSigns00_carry__0_i_3_n_0\
    );
addSameNumberDifferentSigns00_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0003000309000009"
    )
        port map (
      I0 => IN_A(22),
      I1 => \addDenormFlushedValB[22]_i_1_n_0\,
      I2 => addExponentDeltaAMinusB0(0),
      I3 => \addDenormFlushedValB[21]_i_1_n_0\,
      I4 => IN_A(21),
      I5 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_1_n_0
    );
addSameNumberDifferentSigns00_carry_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF05FF0500903309"
    )
        port map (
      I0 => IN_B(17),
      I1 => IN_A(17),
      I2 => IN_B(15),
      I3 => \addDenormFlushedValB[22]_i_2_n_0\,
      I4 => IN_A(15),
      I5 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_10_n_0
    );
addSameNumberDifferentSigns00_carry_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF05FF0500903309"
    )
        port map (
      I0 => IN_B(14),
      I1 => IN_A(14),
      I2 => IN_B(12),
      I3 => \addDenormFlushedValB[22]_i_2_n_0\,
      I4 => IN_A(12),
      I5 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_11_n_0
    );
addSameNumberDifferentSigns00_carry_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF05FF0500903309"
    )
        port map (
      I0 => IN_B(11),
      I1 => IN_A(11),
      I2 => IN_B(9),
      I3 => \addDenormFlushedValB[22]_i_2_n_0\,
      I4 => IN_A(9),
      I5 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_12_n_0
    );
addSameNumberDifferentSigns00_carry_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF05FF0500903309"
    )
        port map (
      I0 => IN_B(8),
      I1 => IN_A(8),
      I2 => IN_B(6),
      I3 => \addDenormFlushedValB[22]_i_2_n_0\,
      I4 => IN_A(6),
      I5 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_13_n_0
    );
addSameNumberDifferentSigns00_carry_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF05FF0500903309"
    )
        port map (
      I0 => IN_B(5),
      I1 => IN_A(5),
      I2 => IN_B(3),
      I3 => \addDenormFlushedValB[22]_i_2_n_0\,
      I4 => IN_A(3),
      I5 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_14_n_0
    );
addSameNumberDifferentSigns00_carry_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F50900F0F53039"
    )
        port map (
      I0 => IN_B(2),
      I1 => IN_A(2),
      I2 => \addDenormFlushedValB[22]_i_2_n_0\,
      I3 => IN_B(0),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      I5 => IN_A(0),
      O => addSameNumberDifferentSigns00_carry_i_15_n_0
    );
addSameNumberDifferentSigns00_carry_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2A208A2"
    )
        port map (
      I0 => addSameNumberDifferentSigns00_carry_i_9_n_0,
      I1 => IN_B(19),
      I2 => \addDenormFlushedValB[22]_i_2_n_0\,
      I3 => IN_A(19),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_2_n_0
    );
addSameNumberDifferentSigns00_carry_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2A208A2"
    )
        port map (
      I0 => addSameNumberDifferentSigns00_carry_i_10_n_0,
      I1 => IN_B(16),
      I2 => \addDenormFlushedValB[22]_i_2_n_0\,
      I3 => IN_A(16),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_3_n_0
    );
addSameNumberDifferentSigns00_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2A208A2"
    )
        port map (
      I0 => addSameNumberDifferentSigns00_carry_i_11_n_0,
      I1 => IN_B(13),
      I2 => \addDenormFlushedValB[22]_i_2_n_0\,
      I3 => IN_A(13),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_4_n_0
    );
addSameNumberDifferentSigns00_carry_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2A208A2"
    )
        port map (
      I0 => addSameNumberDifferentSigns00_carry_i_12_n_0,
      I1 => IN_B(10),
      I2 => \addDenormFlushedValB[22]_i_2_n_0\,
      I3 => IN_A(10),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_5_n_0
    );
addSameNumberDifferentSigns00_carry_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2A208A2"
    )
        port map (
      I0 => addSameNumberDifferentSigns00_carry_i_13_n_0,
      I1 => IN_B(7),
      I2 => \addDenormFlushedValB[22]_i_2_n_0\,
      I3 => IN_A(7),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_6_n_0
    );
addSameNumberDifferentSigns00_carry_i_7: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2A208A2"
    )
        port map (
      I0 => addSameNumberDifferentSigns00_carry_i_14_n_0,
      I1 => IN_B(4),
      I2 => \addDenormFlushedValB[22]_i_2_n_0\,
      I3 => IN_A(4),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_7_n_0
    );
addSameNumberDifferentSigns00_carry_i_8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A2A208A2"
    )
        port map (
      I0 => addSameNumberDifferentSigns00_carry_i_15_n_0,
      I1 => IN_B(1),
      I2 => \addDenormFlushedValB[22]_i_2_n_0\,
      I3 => IN_A(1),
      I4 => \addDenormFlushedValA[22]_i_2_n_0\,
      O => addSameNumberDifferentSigns00_carry_i_8_n_0
    );
addSameNumberDifferentSigns00_carry_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF05FF0500903309"
    )
        port map (
      I0 => IN_B(20),
      I1 => IN_A(20),
      I2 => IN_B(18),
      I3 => \addDenormFlushedValB[22]_i_2_n_0\,
      I4 => IN_A(18),
      I5 => \addDenormFlushedValA[22]_i_2_n_0\,
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
      I4 => addEarlyOutBypassEnable0,
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
      CO(3) => NLW_comALessThanB0_carry_CO_UNCONNECTED(3),
      CO(2) => comALessThanB0_carry_n_5,
      CO(1) => comALessThanB0_carry_n_6,
      CO(0) => comALessThanB0_carry_n_7,
      DI(7) => comALessThanB0_carry_i_1_n_0,
      DI(6) => comALessThanB0_carry_i_2_n_0,
      DI(5) => comALessThanB0_carry_i_3_n_0,
      DI(4) => comALessThanB0_carry_i_4_n_0,
      DI(3) => comALessThanB0_carry_i_5_n_0,
      DI(2) => comALessThanB0_carry_i_6_n_0,
      DI(1) => comALessThanB0_carry_i_7_n_0,
      DI(0) => comALessThanB0_carry_i_8_n_0,
      O(7 downto 0) => NLW_comALessThanB0_carry_O_UNCONNECTED(7 downto 0),
      S(7) => comALessThanB0_carry_i_9_n_0,
      S(6) => comALessThanB0_carry_i_10_n_0,
      S(5) => comALessThanB0_carry_i_11_n_0,
      S(4) => comALessThanB0_carry_i_12_n_0,
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
      CO(3) => \NLW_comALessThanB0_carry__0_CO_UNCONNECTED\(3),
      CO(2) => \comALessThanB0_carry__0_n_5\,
      CO(1) => \comALessThanB0_carry__0_n_6\,
      CO(0) => \comALessThanB0_carry__0_n_7\,
      DI(7) => \comALessThanB0_carry__0_i_1_n_0\,
      DI(6) => \comALessThanB0_carry__0_i_2_n_0\,
      DI(5) => \comALessThanB0_carry__0_i_3_n_0\,
      DI(4) => \comALessThanB0_carry__0_i_4_n_0\,
      DI(3) => \comALessThanB0_carry__0_i_5_n_0\,
      DI(2) => \comALessThanB0_carry__0_i_6_n_0\,
      DI(1) => \comALessThanB0_carry__0_i_7_n_0\,
      DI(0) => \comALessThanB0_carry__0_i_8_n_0\,
      O(7 downto 0) => \NLW_comALessThanB0_carry__0_O_UNCONNECTED\(7 downto 0),
      S(7) => \comALessThanB0_carry__0_i_9_n_0\,
      S(6) => \comALessThanB0_carry__0_i_10_n_0\,
      S(5) => \comALessThanB0_carry__0_i_11_n_0\,
      S(4) => \comALessThanB0_carry__0_i_12_n_0\,
      S(3) => \comALessThanB0_carry__0_i_13_n_0\,
      S(2) => \comALessThanB0_carry__0_i_14_n_0\,
      S(1) => \comALessThanB0_carry__0_i_15_n_0\,
      S(0) => \comALessThanB0_carry__0_i_16_n_0\
    );
\comALessThanB0_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IN_B(30),
      I1 => IN_A(30),
      O => \comALessThanB0_carry__0_i_1_n_0\
    );
\comALessThanB0_carry__0_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(29),
      I1 => IN_B(29),
      I2 => IN_A(28),
      I3 => IN_B(28),
      O => \comALessThanB0_carry__0_i_10_n_0\
    );
\comALessThanB0_carry__0_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(26),
      I1 => IN_B(26),
      I2 => IN_A(27),
      I3 => IN_B(27),
      O => \comALessThanB0_carry__0_i_11_n_0\
    );
\comALessThanB0_carry__0_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(24),
      I1 => IN_B(24),
      I2 => IN_A(25),
      I3 => IN_B(25),
      O => \comALessThanB0_carry__0_i_12_n_0\
    );
\comALessThanB0_carry__0_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(23),
      I1 => IN_B(23),
      I2 => IN_A(22),
      I3 => IN_B(22),
      O => \comALessThanB0_carry__0_i_13_n_0\
    );
\comALessThanB0_carry__0_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(21),
      I1 => IN_B(21),
      I2 => IN_A(20),
      I3 => IN_B(20),
      O => \comALessThanB0_carry__0_i_14_n_0\
    );
\comALessThanB0_carry__0_i_15\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(19),
      I1 => IN_B(19),
      I2 => IN_A(18),
      I3 => IN_B(18),
      O => \comALessThanB0_carry__0_i_15_n_0\
    );
\comALessThanB0_carry__0_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(17),
      I1 => IN_B(17),
      I2 => IN_A(16),
      I3 => IN_B(16),
      O => \comALessThanB0_carry__0_i_16_n_0\
    );
\comALessThanB0_carry__0_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(29),
      I1 => IN_A(29),
      I2 => IN_B(28),
      I3 => IN_A(28),
      O => \comALessThanB0_carry__0_i_2_n_0\
    );
\comALessThanB0_carry__0_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(27),
      I1 => IN_A(27),
      I2 => IN_B(26),
      I3 => IN_A(26),
      O => \comALessThanB0_carry__0_i_3_n_0\
    );
\comALessThanB0_carry__0_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(25),
      I1 => IN_A(25),
      I2 => IN_B(24),
      I3 => IN_A(24),
      O => \comALessThanB0_carry__0_i_4_n_0\
    );
\comALessThanB0_carry__0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(23),
      I1 => IN_A(23),
      I2 => IN_B(22),
      I3 => IN_A(22),
      O => \comALessThanB0_carry__0_i_5_n_0\
    );
\comALessThanB0_carry__0_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(21),
      I1 => IN_A(21),
      I2 => IN_B(20),
      I3 => IN_A(20),
      O => \comALessThanB0_carry__0_i_6_n_0\
    );
\comALessThanB0_carry__0_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(19),
      I1 => IN_A(19),
      I2 => IN_B(18),
      I3 => IN_A(18),
      O => \comALessThanB0_carry__0_i_7_n_0\
    );
\comALessThanB0_carry__0_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(17),
      I1 => IN_A(17),
      I2 => IN_B(16),
      I3 => IN_A(16),
      O => \comALessThanB0_carry__0_i_8_n_0\
    );
\comALessThanB0_carry__0_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => IN_A(30),
      I1 => IN_B(30),
      O => \comALessThanB0_carry__0_i_9_n_0\
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
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(13),
      I1 => IN_B(13),
      I2 => IN_A(12),
      I3 => IN_B(12),
      O => comALessThanB0_carry_i_10_n_0
    );
comALessThanB0_carry_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(11),
      I1 => IN_B(11),
      I2 => IN_A(10),
      I3 => IN_B(10),
      O => comALessThanB0_carry_i_11_n_0
    );
comALessThanB0_carry_i_12: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(9),
      I1 => IN_B(9),
      I2 => IN_A(8),
      I3 => IN_B(8),
      O => comALessThanB0_carry_i_12_n_0
    );
comALessThanB0_carry_i_13: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(7),
      I1 => IN_B(7),
      I2 => IN_A(6),
      I3 => IN_B(6),
      O => comALessThanB0_carry_i_13_n_0
    );
comALessThanB0_carry_i_14: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(5),
      I1 => IN_B(5),
      I2 => IN_A(4),
      I3 => IN_B(4),
      O => comALessThanB0_carry_i_14_n_0
    );
comALessThanB0_carry_i_15: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(3),
      I1 => IN_B(3),
      I2 => IN_A(2),
      I3 => IN_B(2),
      O => comALessThanB0_carry_i_15_n_0
    );
comALessThanB0_carry_i_16: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(1),
      I1 => IN_B(1),
      I2 => IN_A(0),
      I3 => IN_B(0),
      O => comALessThanB0_carry_i_16_n_0
    );
comALessThanB0_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(13),
      I1 => IN_A(13),
      I2 => IN_B(12),
      I3 => IN_A(12),
      O => comALessThanB0_carry_i_2_n_0
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
comALessThanB0_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(9),
      I1 => IN_A(9),
      I2 => IN_B(8),
      I3 => IN_A(8),
      O => comALessThanB0_carry_i_4_n_0
    );
comALessThanB0_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => IN_B(7),
      I1 => IN_A(7),
      I2 => IN_B(6),
      I3 => IN_A(6),
      O => comALessThanB0_carry_i_5_n_0
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
comALessThanB0_carry_i_9: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => IN_A(15),
      I1 => IN_B(15),
      I2 => IN_A(14),
      I3 => IN_B(14),
      O => comALessThanB0_carry_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_StandaloneFloatALU_A_1_0 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OADD : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IADD_GO : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_StandaloneFloatALU_A_1_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_StandaloneFloatALU_A_1_0 : entity is "design_1_StandaloneFloatALU_A_1_0,StandaloneFloatALU_ADD,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_StandaloneFloatALU_A_1_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_StandaloneFloatALU_A_1_0 : entity is "StandaloneFloatALU_ADD,Vivado 2018.1_AR73068";
end design_1_StandaloneFloatALU_A_1_0;

architecture STRUCTURE of design_1_StandaloneFloatALU_A_1_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
begin
U0: entity work.design_1_StandaloneFloatALU_A_1_0_StandaloneFloatALU_ADD
     port map (
      IADD_GO => IADD_GO,
      IN_A(31 downto 0) => IN_A(31 downto 0),
      IN_B(31 downto 0) => IN_B(31 downto 0),
      OADD(31 downto 0) => OADD(31 downto 0),
      clk => clk
    );
end STRUCTURE;
