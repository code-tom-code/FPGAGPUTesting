-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 18:01:05 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StandaloneFloatALU_M_0_2/MainDesign_StandaloneFloatALU_M_0_2_sim_netlist.vhdl
-- Design      : MainDesign_StandaloneFloatALU_M_0_2
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_StandaloneFloatALU_M_0_2_StandaloneFloatALU_MUL is
  port (
    OMUL : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IMUL_GO : in STD_LOGIC;
    clk : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_StandaloneFloatALU_M_0_2_StandaloneFloatALU_MUL : entity is "StandaloneFloatALU_MUL";
end MainDesign_StandaloneFloatALU_M_0_2_StandaloneFloatALU_MUL;

architecture STRUCTURE of MainDesign_StandaloneFloatALU_M_0_2_StandaloneFloatALU_MUL is
  signal \^omul\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal OMUL0_in : STD_LOGIC_VECTOR ( 30 downto 22 );
  signal OMUL1 : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal \OMUL[0]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[10]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[11]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[12]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[13]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[14]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[15]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[16]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[17]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[18]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[19]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[1]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[20]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[21]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[22]_i_2_n_0\ : STD_LOGIC;
  signal \OMUL[22]_i_3_n_0\ : STD_LOGIC;
  signal \OMUL[22]_i_4_n_0\ : STD_LOGIC;
  signal \OMUL[22]_i_5_n_0\ : STD_LOGIC;
  signal \OMUL[23]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[24]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[25]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[26]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[26]_i_2_n_0\ : STD_LOGIC;
  signal \OMUL[27]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[27]_i_2_n_0\ : STD_LOGIC;
  signal \OMUL[28]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[28]_i_2_n_0\ : STD_LOGIC;
  signal \OMUL[28]_i_3_n_0\ : STD_LOGIC;
  signal \OMUL[29]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[29]_i_2_n_0\ : STD_LOGIC;
  signal \OMUL[2]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[30]_i_2_n_0\ : STD_LOGIC;
  signal \OMUL[30]_i_3_n_0\ : STD_LOGIC;
  signal \OMUL[30]_i_4_n_0\ : STD_LOGIC;
  signal \OMUL[30]_i_5_n_0\ : STD_LOGIC;
  signal \OMUL[30]_i_6_n_0\ : STD_LOGIC;
  signal \OMUL[30]_i_7_n_0\ : STD_LOGIC;
  signal \OMUL[31]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[3]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[4]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[5]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[6]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[7]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[8]_i_1_n_0\ : STD_LOGIC;
  signal \OMUL[9]_i_1_n_0\ : STD_LOGIC;
  signal RESIZE0_in : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \mulEarlyOutBypass0[22]_i_10_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[22]_i_11_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[22]_i_1_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[22]_i_2_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[22]_i_3_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[22]_i_4_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[22]_i_6_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[22]_i_7_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[22]_i_8_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[22]_i_9_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_10_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_11_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_12_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_13_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_14_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_15_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_16_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_17_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_18_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_19_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_1_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_2_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_3_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_4_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_6_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_7_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_8_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[30]_i_9_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[31]_i_1_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0[31]_i_2_n_0\ : STD_LOGIC;
  signal \mulEarlyOutBypass0_reg_n_0_[22]\ : STD_LOGIC;
  signal \mulEarlyOutBypass0_reg_n_0_[30]\ : STD_LOGIC;
  signal \mulEarlyOutBypass0_reg_n_0_[31]\ : STD_LOGIC;
  signal mulEarlyOutBypass1 : STD_LOGIC_VECTOR ( 31 downto 22 );
  signal mulEarlyOutBypass2 : STD_LOGIC_VECTOR ( 31 downto 22 );
  signal mulEarlyOutBypass3 : STD_LOGIC_VECTOR ( 31 downto 22 );
  signal mulEarlyOutBypassEnable0_i_1_n_0 : STD_LOGIC;
  signal mulEarlyOutBypassEnable0_i_2_n_0 : STD_LOGIC;
  signal mulEarlyOutBypassEnable0_i_3_n_0 : STD_LOGIC;
  signal mulEarlyOutBypassEnable0_i_4_n_0 : STD_LOGIC;
  signal mulEarlyOutBypassEnable0_i_5_n_0 : STD_LOGIC;
  signal mulEarlyOutBypassEnable0_reg_n_0 : STD_LOGIC;
  signal mulEarlyOutBypassEnable1 : STD_LOGIC;
  signal mulEarlyOutBypassEnable2 : STD_LOGIC;
  signal mulEarlyOutBypassEnable3 : STD_LOGIC;
  signal mulPipelineValidStage0 : STD_LOGIC;
  signal mulPipelineValidStage1 : STD_LOGIC;
  signal mulPipelineValidStage2 : STD_LOGIC;
  signal mulPipelineValidStage3 : STD_LOGIC;
  signal mulResultExp0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \mulResultExp00_carry__0_n_15\ : STD_LOGIC;
  signal mulResultExp00_carry_i_10_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_11_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_12_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_13_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_14_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_15_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_16_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_17_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_18_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_19_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_1_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_20_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_i_9_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_n_0 : STD_LOGIC;
  signal mulResultExp00_carry_n_1 : STD_LOGIC;
  signal mulResultExp00_carry_n_10 : STD_LOGIC;
  signal mulResultExp00_carry_n_11 : STD_LOGIC;
  signal mulResultExp00_carry_n_12 : STD_LOGIC;
  signal mulResultExp00_carry_n_13 : STD_LOGIC;
  signal mulResultExp00_carry_n_14 : STD_LOGIC;
  signal mulResultExp00_carry_n_15 : STD_LOGIC;
  signal mulResultExp00_carry_n_2 : STD_LOGIC;
  signal mulResultExp00_carry_n_3 : STD_LOGIC;
  signal mulResultExp00_carry_n_4 : STD_LOGIC;
  signal mulResultExp00_carry_n_5 : STD_LOGIC;
  signal mulResultExp00_carry_n_6 : STD_LOGIC;
  signal mulResultExp00_carry_n_7 : STD_LOGIC;
  signal mulResultExp00_carry_n_8 : STD_LOGIC;
  signal mulResultExp00_carry_n_9 : STD_LOGIC;
  signal \mulResultExp0[8]_i_2_n_0\ : STD_LOGIC;
  signal \mulResultExp0[8]_i_3_n_0\ : STD_LOGIC;
  signal \mulResultExp0[8]_i_4_n_0\ : STD_LOGIC;
  signal \mulResultExp0[8]_i_5_n_0\ : STD_LOGIC;
  signal \mulResultExp0[8]_i_6_n_0\ : STD_LOGIC;
  signal \mulResultExp0_reg_n_0_[0]\ : STD_LOGIC;
  signal \mulResultExp0_reg_n_0_[1]\ : STD_LOGIC;
  signal \mulResultExp0_reg_n_0_[2]\ : STD_LOGIC;
  signal \mulResultExp0_reg_n_0_[3]\ : STD_LOGIC;
  signal \mulResultExp0_reg_n_0_[4]\ : STD_LOGIC;
  signal \mulResultExp0_reg_n_0_[5]\ : STD_LOGIC;
  signal \mulResultExp0_reg_n_0_[6]\ : STD_LOGIC;
  signal \mulResultExp0_reg_n_0_[7]\ : STD_LOGIC;
  signal \mulResultExp0_reg_n_0_[8]\ : STD_LOGIC;
  signal mulResultExp1 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal mulResultExp2 : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \mulResultExp3_reg_n_0_[0]\ : STD_LOGIC;
  signal \mulResultExp3_reg_n_0_[1]\ : STD_LOGIC;
  signal \mulResultExp3_reg_n_0_[2]\ : STD_LOGIC;
  signal \mulResultExp3_reg_n_0_[3]\ : STD_LOGIC;
  signal \mulResultExp3_reg_n_0_[4]\ : STD_LOGIC;
  signal \mulResultExp3_reg_n_0_[5]\ : STD_LOGIC;
  signal \mulResultExp3_reg_n_0_[6]\ : STD_LOGIC;
  signal \mulResultExp3_reg_n_0_[7]\ : STD_LOGIC;
  signal \mulResultExp3_reg_n_0_[8]\ : STD_LOGIC;
  signal mulResultMantissa1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal mulResultMantissa10_n_100 : STD_LOGIC;
  signal mulResultMantissa10_n_101 : STD_LOGIC;
  signal mulResultMantissa10_n_102 : STD_LOGIC;
  signal mulResultMantissa10_n_103 : STD_LOGIC;
  signal mulResultMantissa10_n_104 : STD_LOGIC;
  signal mulResultMantissa10_n_105 : STD_LOGIC;
  signal mulResultMantissa10_n_106 : STD_LOGIC;
  signal mulResultMantissa10_n_107 : STD_LOGIC;
  signal mulResultMantissa10_n_108 : STD_LOGIC;
  signal mulResultMantissa10_n_109 : STD_LOGIC;
  signal mulResultMantissa10_n_110 : STD_LOGIC;
  signal mulResultMantissa10_n_111 : STD_LOGIC;
  signal mulResultMantissa10_n_112 : STD_LOGIC;
  signal mulResultMantissa10_n_113 : STD_LOGIC;
  signal mulResultMantissa10_n_114 : STD_LOGIC;
  signal mulResultMantissa10_n_115 : STD_LOGIC;
  signal mulResultMantissa10_n_116 : STD_LOGIC;
  signal mulResultMantissa10_n_117 : STD_LOGIC;
  signal mulResultMantissa10_n_118 : STD_LOGIC;
  signal mulResultMantissa10_n_119 : STD_LOGIC;
  signal mulResultMantissa10_n_120 : STD_LOGIC;
  signal mulResultMantissa10_n_121 : STD_LOGIC;
  signal mulResultMantissa10_n_122 : STD_LOGIC;
  signal mulResultMantissa10_n_123 : STD_LOGIC;
  signal mulResultMantissa10_n_124 : STD_LOGIC;
  signal mulResultMantissa10_n_125 : STD_LOGIC;
  signal mulResultMantissa10_n_126 : STD_LOGIC;
  signal mulResultMantissa10_n_127 : STD_LOGIC;
  signal mulResultMantissa10_n_128 : STD_LOGIC;
  signal mulResultMantissa10_n_129 : STD_LOGIC;
  signal mulResultMantissa10_n_130 : STD_LOGIC;
  signal mulResultMantissa10_n_131 : STD_LOGIC;
  signal mulResultMantissa10_n_132 : STD_LOGIC;
  signal mulResultMantissa10_n_133 : STD_LOGIC;
  signal mulResultMantissa10_n_134 : STD_LOGIC;
  signal mulResultMantissa10_n_135 : STD_LOGIC;
  signal mulResultMantissa10_n_136 : STD_LOGIC;
  signal mulResultMantissa10_n_137 : STD_LOGIC;
  signal mulResultMantissa10_n_138 : STD_LOGIC;
  signal mulResultMantissa10_n_139 : STD_LOGIC;
  signal mulResultMantissa10_n_140 : STD_LOGIC;
  signal mulResultMantissa10_n_141 : STD_LOGIC;
  signal mulResultMantissa10_n_142 : STD_LOGIC;
  signal mulResultMantissa10_n_143 : STD_LOGIC;
  signal mulResultMantissa10_n_144 : STD_LOGIC;
  signal mulResultMantissa10_n_145 : STD_LOGIC;
  signal mulResultMantissa10_n_146 : STD_LOGIC;
  signal mulResultMantissa10_n_147 : STD_LOGIC;
  signal mulResultMantissa10_n_148 : STD_LOGIC;
  signal mulResultMantissa10_n_149 : STD_LOGIC;
  signal mulResultMantissa10_n_150 : STD_LOGIC;
  signal mulResultMantissa10_n_151 : STD_LOGIC;
  signal mulResultMantissa10_n_152 : STD_LOGIC;
  signal mulResultMantissa10_n_153 : STD_LOGIC;
  signal mulResultMantissa10_n_58 : STD_LOGIC;
  signal mulResultMantissa10_n_59 : STD_LOGIC;
  signal mulResultMantissa10_n_60 : STD_LOGIC;
  signal mulResultMantissa10_n_61 : STD_LOGIC;
  signal mulResultMantissa10_n_62 : STD_LOGIC;
  signal mulResultMantissa10_n_63 : STD_LOGIC;
  signal mulResultMantissa10_n_64 : STD_LOGIC;
  signal mulResultMantissa10_n_65 : STD_LOGIC;
  signal mulResultMantissa10_n_66 : STD_LOGIC;
  signal mulResultMantissa10_n_67 : STD_LOGIC;
  signal mulResultMantissa10_n_68 : STD_LOGIC;
  signal mulResultMantissa10_n_69 : STD_LOGIC;
  signal mulResultMantissa10_n_70 : STD_LOGIC;
  signal mulResultMantissa10_n_71 : STD_LOGIC;
  signal mulResultMantissa10_n_72 : STD_LOGIC;
  signal mulResultMantissa10_n_73 : STD_LOGIC;
  signal mulResultMantissa10_n_74 : STD_LOGIC;
  signal mulResultMantissa10_n_75 : STD_LOGIC;
  signal mulResultMantissa10_n_76 : STD_LOGIC;
  signal mulResultMantissa10_n_77 : STD_LOGIC;
  signal mulResultMantissa10_n_78 : STD_LOGIC;
  signal mulResultMantissa10_n_79 : STD_LOGIC;
  signal mulResultMantissa10_n_80 : STD_LOGIC;
  signal mulResultMantissa10_n_81 : STD_LOGIC;
  signal mulResultMantissa10_n_82 : STD_LOGIC;
  signal mulResultMantissa10_n_83 : STD_LOGIC;
  signal mulResultMantissa10_n_84 : STD_LOGIC;
  signal mulResultMantissa10_n_85 : STD_LOGIC;
  signal mulResultMantissa10_n_86 : STD_LOGIC;
  signal mulResultMantissa10_n_87 : STD_LOGIC;
  signal mulResultMantissa10_n_88 : STD_LOGIC;
  signal mulResultMantissa10_n_89 : STD_LOGIC;
  signal mulResultMantissa10_n_90 : STD_LOGIC;
  signal mulResultMantissa10_n_91 : STD_LOGIC;
  signal mulResultMantissa10_n_92 : STD_LOGIC;
  signal mulResultMantissa10_n_93 : STD_LOGIC;
  signal mulResultMantissa10_n_94 : STD_LOGIC;
  signal mulResultMantissa10_n_95 : STD_LOGIC;
  signal mulResultMantissa10_n_96 : STD_LOGIC;
  signal mulResultMantissa10_n_97 : STD_LOGIC;
  signal mulResultMantissa10_n_98 : STD_LOGIC;
  signal mulResultMantissa10_n_99 : STD_LOGIC;
  signal \mulResultMantissa1_reg__0\ : STD_LOGIC_VECTOR ( 47 downto 23 );
  signal mulResultMantissa1_reg_n_100 : STD_LOGIC;
  signal mulResultMantissa1_reg_n_101 : STD_LOGIC;
  signal mulResultMantissa1_reg_n_102 : STD_LOGIC;
  signal mulResultMantissa1_reg_n_103 : STD_LOGIC;
  signal mulResultMantissa1_reg_n_104 : STD_LOGIC;
  signal mulResultMantissa1_reg_n_105 : STD_LOGIC;
  signal mulResultMantissa2 : STD_LOGIC_VECTOR ( 47 downto 23 );
  signal mulResultSign0 : STD_LOGIC;
  signal mulResultSign0_i_1_n_0 : STD_LOGIC;
  signal mulResultSign1 : STD_LOGIC;
  signal mulResultSign2 : STD_LOGIC;
  signal mulResultSign3 : STD_LOGIC;
  signal p_2_in : STD_LOGIC_VECTOR ( 30 downto 22 );
  signal \NLW_mulResultExp00_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_mulResultExp00_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal NLW_mulResultMantissa10_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa10_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa10_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa10_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa10_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa10_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa10_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_mulResultMantissa10_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_mulResultMantissa10_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_mulResultMantissa10_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_mulResultMantissa1_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa1_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa1_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa1_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa1_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa1_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_mulResultMantissa1_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_mulResultMantissa1_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_mulResultMantissa1_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_mulResultMantissa1_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 31 );
  signal NLW_mulResultMantissa1_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_mulResultMantissa1_reg_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \OMUL[22]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \OMUL[26]_i_2\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \OMUL[27]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \OMUL[28]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \OMUL[28]_i_3\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \OMUL[29]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \OMUL[29]_i_2\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \OMUL[30]_i_6\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \mulEarlyOutBypass0[22]_i_10\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \mulEarlyOutBypass0[22]_i_11\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \mulEarlyOutBypass0[22]_i_2\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \mulEarlyOutBypass0[22]_i_4\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \mulEarlyOutBypass0[22]_i_8\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \mulEarlyOutBypass0[22]_i_9\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \mulEarlyOutBypass0[30]_i_2\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \mulEarlyOutBypass0[30]_i_3\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \mulEarlyOutBypass0[30]_i_5\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of mulEarlyOutBypassEnable0_i_2 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of mulEarlyOutBypassEnable0_i_3 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of mulEarlyOutBypassEnable0_i_4 : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of mulEarlyOutBypassEnable0_i_5 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of mulResultExp00_carry_i_17 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of mulResultExp00_carry_i_19 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of mulResultExp00_carry_i_20 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \mulResultExp0[8]_i_2\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \mulResultExp0[8]_i_3\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \mulResultExp0[8]_i_5\ : label is "soft_lutpair1";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of mulResultMantissa10 : label is "{SYNTH-11 {cell *THIS*}}";
  attribute SOFT_HLUTNM of mulResultSign0_i_1 : label is "soft_lutpair11";
begin
  OMUL(31 downto 0) <= \^omul\(31 downto 0);
\OMUL[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(0),
      I2 => OMUL1(1),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[0]_i_1_n_0\
    );
\OMUL[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(10),
      I2 => OMUL1(11),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[10]_i_1_n_0\
    );
\OMUL[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(11),
      I2 => OMUL1(12),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[11]_i_1_n_0\
    );
\OMUL[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(12),
      I2 => OMUL1(13),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[12]_i_1_n_0\
    );
\OMUL[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(13),
      I2 => OMUL1(14),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[13]_i_1_n_0\
    );
\OMUL[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(14),
      I2 => OMUL1(15),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[14]_i_1_n_0\
    );
\OMUL[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(15),
      I2 => OMUL1(16),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[15]_i_1_n_0\
    );
\OMUL[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(16),
      I2 => OMUL1(17),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[16]_i_1_n_0\
    );
\OMUL[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(17),
      I2 => OMUL1(18),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[17]_i_1_n_0\
    );
\OMUL[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(18),
      I2 => OMUL1(19),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[18]_i_1_n_0\
    );
\OMUL[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(19),
      I2 => OMUL1(20),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[19]_i_1_n_0\
    );
\OMUL[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(1),
      I2 => OMUL1(2),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[1]_i_1_n_0\
    );
\OMUL[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(20),
      I2 => OMUL1(21),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[20]_i_1_n_0\
    );
\OMUL[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(21),
      I2 => OMUL1(22),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[21]_i_1_n_0\
    );
\OMUL[22]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAEAA"
    )
        port map (
      I0 => \OMUL[30]_i_4_n_0\,
      I1 => \mulResultExp3_reg_n_0_[7]\,
      I2 => \mulResultExp3_reg_n_0_[8]\,
      I3 => mulPipelineValidStage3,
      I4 => mulEarlyOutBypassEnable3,
      O => OMUL0_in(22)
    );
\OMUL[22]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFC0AA0000"
    )
        port map (
      I0 => OMUL1(22),
      I1 => \OMUL[22]_i_3_n_0\,
      I2 => OMUL1(23),
      I3 => OMUL1(24),
      I4 => \OMUL[30]_i_5_n_0\,
      I5 => \OMUL[22]_i_4_n_0\,
      O => \OMUL[22]_i_2_n_0\
    );
\OMUL[22]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFDF"
    )
        port map (
      I0 => \mulResultExp3_reg_n_0_[1]\,
      I1 => \mulResultExp3_reg_n_0_[8]\,
      I2 => \mulResultExp3_reg_n_0_[0]\,
      I3 => \OMUL[22]_i_5_n_0\,
      O => \OMUL[22]_i_3_n_0\
    );
\OMUL[22]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mulEarlyOutBypassEnable3,
      I1 => mulEarlyOutBypass3(22),
      O => \OMUL[22]_i_4_n_0\
    );
\OMUL[22]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFFFFFFFFFFFFF"
    )
        port map (
      I0 => \mulResultExp3_reg_n_0_[6]\,
      I1 => \mulResultExp3_reg_n_0_[5]\,
      I2 => \mulResultExp3_reg_n_0_[7]\,
      I3 => \mulResultExp3_reg_n_0_[2]\,
      I4 => \mulResultExp3_reg_n_0_[3]\,
      I5 => \mulResultExp3_reg_n_0_[4]\,
      O => \OMUL[22]_i_5_n_0\
    );
\OMUL[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FF828282"
    )
        port map (
      I0 => \OMUL[30]_i_5_n_0\,
      I1 => OMUL1(24),
      I2 => \mulResultExp3_reg_n_0_[0]\,
      I3 => mulEarlyOutBypassEnable3,
      I4 => mulEarlyOutBypass3(30),
      I5 => \OMUL[30]_i_4_n_0\,
      O => \OMUL[23]_i_1_n_0\
    );
\OMUL[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFA802"
    )
        port map (
      I0 => \OMUL[30]_i_5_n_0\,
      I1 => \mulResultExp3_reg_n_0_[0]\,
      I2 => OMUL1(24),
      I3 => \mulResultExp3_reg_n_0_[1]\,
      I4 => \OMUL[28]_i_3_n_0\,
      I5 => \OMUL[30]_i_4_n_0\,
      O => \OMUL[24]_i_1_n_0\
    );
\OMUL[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FF282828"
    )
        port map (
      I0 => \OMUL[30]_i_5_n_0\,
      I1 => \OMUL[26]_i_2_n_0\,
      I2 => \mulResultExp3_reg_n_0_[2]\,
      I3 => mulEarlyOutBypassEnable3,
      I4 => mulEarlyOutBypass3(30),
      I5 => \OMUL[30]_i_4_n_0\,
      O => \OMUL[25]_i_1_n_0\
    );
\OMUL[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFA208"
    )
        port map (
      I0 => \OMUL[30]_i_5_n_0\,
      I1 => \OMUL[26]_i_2_n_0\,
      I2 => \mulResultExp3_reg_n_0_[2]\,
      I3 => \mulResultExp3_reg_n_0_[3]\,
      I4 => \OMUL[28]_i_3_n_0\,
      I5 => \OMUL[30]_i_4_n_0\,
      O => \OMUL[26]_i_1_n_0\
    );
\OMUL[26]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => OMUL1(24),
      I1 => \mulResultExp3_reg_n_0_[0]\,
      I2 => \mulResultExp3_reg_n_0_[1]\,
      O => \OMUL[26]_i_2_n_0\
    );
\OMUL[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFA082"
    )
        port map (
      I0 => \OMUL[30]_i_5_n_0\,
      I1 => \OMUL[27]_i_2_n_0\,
      I2 => \mulResultExp3_reg_n_0_[4]\,
      I3 => OMUL1(24),
      I4 => \OMUL[28]_i_3_n_0\,
      I5 => \OMUL[30]_i_4_n_0\,
      O => \OMUL[27]_i_1_n_0\
    );
\OMUL[27]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \mulResultExp3_reg_n_0_[3]\,
      I1 => \mulResultExp3_reg_n_0_[2]\,
      I2 => \mulResultExp3_reg_n_0_[0]\,
      I3 => \mulResultExp3_reg_n_0_[1]\,
      O => \OMUL[27]_i_2_n_0\
    );
\OMUL[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFFFA802"
    )
        port map (
      I0 => \OMUL[30]_i_5_n_0\,
      I1 => OMUL1(24),
      I2 => \OMUL[28]_i_2_n_0\,
      I3 => \mulResultExp3_reg_n_0_[5]\,
      I4 => \OMUL[28]_i_3_n_0\,
      I5 => \OMUL[30]_i_4_n_0\,
      O => \OMUL[28]_i_1_n_0\
    );
\OMUL[28]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \mulResultExp3_reg_n_0_[4]\,
      I1 => \mulResultExp3_reg_n_0_[1]\,
      I2 => \mulResultExp3_reg_n_0_[0]\,
      I3 => \mulResultExp3_reg_n_0_[2]\,
      I4 => \mulResultExp3_reg_n_0_[3]\,
      O => \OMUL[28]_i_2_n_0\
    );
\OMUL[28]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => mulEarlyOutBypassEnable3,
      I1 => mulEarlyOutBypass3(30),
      O => \OMUL[28]_i_3_n_0\
    );
\OMUL[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F222"
    )
        port map (
      I0 => \OMUL[30]_i_5_n_0\,
      I1 => \OMUL[29]_i_2_n_0\,
      I2 => mulEarlyOutBypassEnable3,
      I3 => mulEarlyOutBypass3(30),
      I4 => \OMUL[30]_i_4_n_0\,
      O => \OMUL[29]_i_1_n_0\
    );
\OMUL[29]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5556"
    )
        port map (
      I0 => \mulResultExp3_reg_n_0_[6]\,
      I1 => OMUL1(24),
      I2 => \mulResultExp3_reg_n_0_[5]\,
      I3 => \OMUL[28]_i_2_n_0\,
      O => \OMUL[29]_i_2_n_0\
    );
\OMUL[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(2),
      I2 => OMUL1(3),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[2]_i_1_n_0\
    );
\OMUL[30]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => mulEarlyOutBypassEnable3,
      I1 => mulPipelineValidStage3,
      I2 => \mulResultExp3_reg_n_0_[8]\,
      I3 => \mulResultExp3_reg_n_0_[7]\,
      O => OMUL0_in(30)
    );
\OMUL[30]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => mulPipelineValidStage3,
      I1 => \OMUL[30]_i_4_n_0\,
      O => \OMUL[30]_i_2_n_0\
    );
\OMUL[30]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FF828282"
    )
        port map (
      I0 => \OMUL[30]_i_5_n_0\,
      I1 => \OMUL[30]_i_6_n_0\,
      I2 => \mulResultExp3_reg_n_0_[7]\,
      I3 => mulEarlyOutBypassEnable3,
      I4 => mulEarlyOutBypass3(30),
      I5 => \OMUL[30]_i_4_n_0\,
      O => \OMUL[30]_i_3_n_0\
    );
\OMUL[30]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40400040"
    )
        port map (
      I0 => mulEarlyOutBypassEnable3,
      I1 => mulPipelineValidStage3,
      I2 => \mulResultExp3_reg_n_0_[8]\,
      I3 => \mulResultExp3_reg_n_0_[7]\,
      I4 => \OMUL[30]_i_7_n_0\,
      O => \OMUL[30]_i_4_n_0\
    );
\OMUL[30]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0043"
    )
        port map (
      I0 => \OMUL[30]_i_7_n_0\,
      I1 => \mulResultExp3_reg_n_0_[7]\,
      I2 => \mulResultExp3_reg_n_0_[8]\,
      I3 => mulEarlyOutBypassEnable3,
      O => \OMUL[30]_i_5_n_0\
    );
\OMUL[30]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \mulResultExp3_reg_n_0_[5]\,
      I1 => \mulResultExp3_reg_n_0_[6]\,
      I2 => OMUL1(24),
      I3 => \OMUL[28]_i_2_n_0\,
      O => \OMUL[30]_i_6_n_0\
    );
\OMUL[30]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \mulResultExp3_reg_n_0_[5]\,
      I1 => \mulResultExp3_reg_n_0_[6]\,
      I2 => \mulResultExp3_reg_n_0_[1]\,
      I3 => \mulResultExp3_reg_n_0_[4]\,
      I4 => \mulResultExp3_reg_n_0_[3]\,
      I5 => \mulResultExp3_reg_n_0_[2]\,
      O => \OMUL[30]_i_7_n_0\
    );
\OMUL[31]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8FFB800"
    )
        port map (
      I0 => mulEarlyOutBypass3(31),
      I1 => mulEarlyOutBypassEnable3,
      I2 => mulResultSign3,
      I3 => mulPipelineValidStage3,
      I4 => \^omul\(31),
      O => \OMUL[31]_i_1_n_0\
    );
\OMUL[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(3),
      I2 => OMUL1(4),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[3]_i_1_n_0\
    );
\OMUL[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(4),
      I2 => OMUL1(5),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[4]_i_1_n_0\
    );
\OMUL[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(5),
      I2 => OMUL1(6),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[5]_i_1_n_0\
    );
\OMUL[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(6),
      I2 => OMUL1(7),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[6]_i_1_n_0\
    );
\OMUL[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(7),
      I2 => OMUL1(8),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[7]_i_1_n_0\
    );
\OMUL[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(8),
      I2 => OMUL1(9),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[8]_i_1_n_0\
    );
\OMUL[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FAEEAAEEAAAAAAAA"
    )
        port map (
      I0 => \OMUL[22]_i_4_n_0\,
      I1 => OMUL1(9),
      I2 => OMUL1(10),
      I3 => OMUL1(24),
      I4 => \OMUL[22]_i_3_n_0\,
      I5 => \OMUL[30]_i_5_n_0\,
      O => \OMUL[9]_i_1_n_0\
    );
\OMUL_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[0]_i_1_n_0\,
      Q => \^omul\(0),
      R => OMUL0_in(22)
    );
\OMUL_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[10]_i_1_n_0\,
      Q => \^omul\(10),
      R => OMUL0_in(22)
    );
\OMUL_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[11]_i_1_n_0\,
      Q => \^omul\(11),
      R => OMUL0_in(22)
    );
\OMUL_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[12]_i_1_n_0\,
      Q => \^omul\(12),
      R => OMUL0_in(22)
    );
\OMUL_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[13]_i_1_n_0\,
      Q => \^omul\(13),
      R => OMUL0_in(22)
    );
\OMUL_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[14]_i_1_n_0\,
      Q => \^omul\(14),
      R => OMUL0_in(22)
    );
\OMUL_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[15]_i_1_n_0\,
      Q => \^omul\(15),
      R => OMUL0_in(22)
    );
\OMUL_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[16]_i_1_n_0\,
      Q => \^omul\(16),
      R => OMUL0_in(22)
    );
\OMUL_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[17]_i_1_n_0\,
      Q => \^omul\(17),
      R => OMUL0_in(22)
    );
\OMUL_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[18]_i_1_n_0\,
      Q => \^omul\(18),
      R => OMUL0_in(22)
    );
\OMUL_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[19]_i_1_n_0\,
      Q => \^omul\(19),
      R => OMUL0_in(22)
    );
\OMUL_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[1]_i_1_n_0\,
      Q => \^omul\(1),
      R => OMUL0_in(22)
    );
\OMUL_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[20]_i_1_n_0\,
      Q => \^omul\(20),
      R => OMUL0_in(22)
    );
\OMUL_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[21]_i_1_n_0\,
      Q => \^omul\(21),
      R => OMUL0_in(22)
    );
\OMUL_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[22]_i_2_n_0\,
      Q => \^omul\(22),
      R => OMUL0_in(22)
    );
\OMUL_reg[23]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OMUL[30]_i_2_n_0\,
      D => \OMUL[23]_i_1_n_0\,
      Q => \^omul\(23),
      S => OMUL0_in(30)
    );
\OMUL_reg[24]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OMUL[30]_i_2_n_0\,
      D => \OMUL[24]_i_1_n_0\,
      Q => \^omul\(24),
      S => OMUL0_in(30)
    );
\OMUL_reg[25]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OMUL[30]_i_2_n_0\,
      D => \OMUL[25]_i_1_n_0\,
      Q => \^omul\(25),
      S => OMUL0_in(30)
    );
\OMUL_reg[26]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OMUL[30]_i_2_n_0\,
      D => \OMUL[26]_i_1_n_0\,
      Q => \^omul\(26),
      S => OMUL0_in(30)
    );
\OMUL_reg[27]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OMUL[30]_i_2_n_0\,
      D => \OMUL[27]_i_1_n_0\,
      Q => \^omul\(27),
      S => OMUL0_in(30)
    );
\OMUL_reg[28]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OMUL[30]_i_2_n_0\,
      D => \OMUL[28]_i_1_n_0\,
      Q => \^omul\(28),
      S => OMUL0_in(30)
    );
\OMUL_reg[29]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OMUL[30]_i_2_n_0\,
      D => \OMUL[29]_i_1_n_0\,
      Q => \^omul\(29),
      S => OMUL0_in(30)
    );
\OMUL_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[2]_i_1_n_0\,
      Q => \^omul\(2),
      R => OMUL0_in(22)
    );
\OMUL_reg[30]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \OMUL[30]_i_2_n_0\,
      D => \OMUL[30]_i_3_n_0\,
      Q => \^omul\(30),
      S => OMUL0_in(30)
    );
\OMUL_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \OMUL[31]_i_1_n_0\,
      Q => \^omul\(31),
      R => '0'
    );
\OMUL_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[3]_i_1_n_0\,
      Q => \^omul\(3),
      R => OMUL0_in(22)
    );
\OMUL_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[4]_i_1_n_0\,
      Q => \^omul\(4),
      R => OMUL0_in(22)
    );
\OMUL_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[5]_i_1_n_0\,
      Q => \^omul\(5),
      R => OMUL0_in(22)
    );
\OMUL_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[6]_i_1_n_0\,
      Q => \^omul\(6),
      R => OMUL0_in(22)
    );
\OMUL_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[7]_i_1_n_0\,
      Q => \^omul\(7),
      R => OMUL0_in(22)
    );
\OMUL_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[8]_i_1_n_0\,
      Q => \^omul\(8),
      R => OMUL0_in(22)
    );
\OMUL_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage3,
      D => \OMUL[9]_i_1_n_0\,
      Q => \^omul\(9),
      R => OMUL0_in(22)
    );
\mulEarlyOutBypass0[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAFAAAEAAAAAAAE"
    )
        port map (
      I0 => \mulEarlyOutBypass0[22]_i_2_n_0\,
      I1 => \mulEarlyOutBypass0_reg_n_0_[22]\,
      I2 => \mulEarlyOutBypass0[22]_i_3_n_0\,
      I3 => \mulEarlyOutBypass0[22]_i_4_n_0\,
      I4 => \mulEarlyOutBypass0[31]_i_2_n_0\,
      I5 => p_2_in(22),
      O => \mulEarlyOutBypass0[22]_i_1_n_0\
    );
\mulEarlyOutBypass0[22]_i_10\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => IN_A(30),
      I1 => IN_A(29),
      I2 => IN_A(24),
      O => \mulEarlyOutBypass0[22]_i_10_n_0\
    );
\mulEarlyOutBypass0[22]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => IMUL_GO,
      I1 => IN_A(23),
      O => \mulEarlyOutBypass0[22]_i_11_n_0\
    );
\mulEarlyOutBypass0[22]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \mulEarlyOutBypass0[30]_i_7_n_0\,
      I1 => IMUL_GO,
      I2 => mulEarlyOutBypassEnable0_i_5_n_0,
      I3 => mulEarlyOutBypassEnable0_i_3_n_0,
      O => \mulEarlyOutBypass0[22]_i_2_n_0\
    );
\mulEarlyOutBypass0[22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEFEEEEEEEEEE"
    )
        port map (
      I0 => \mulEarlyOutBypass0[22]_i_6_n_0\,
      I1 => \mulEarlyOutBypass0[22]_i_7_n_0\,
      I2 => \mulEarlyOutBypass0[30]_i_6_n_0\,
      I3 => IN_B(24),
      I4 => \mulEarlyOutBypass0[30]_i_7_n_0\,
      I5 => \mulEarlyOutBypass0[22]_i_8_n_0\,
      O => \mulEarlyOutBypass0[22]_i_3_n_0\
    );
\mulEarlyOutBypass0[22]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => \mulEarlyOutBypass0[30]_i_7_n_0\,
      I1 => IMUL_GO,
      I2 => mulEarlyOutBypassEnable0_i_5_n_0,
      I3 => \mulResultExp0[8]_i_3_n_0\,
      O => \mulEarlyOutBypass0[22]_i_4_n_0\
    );
\mulEarlyOutBypass0[22]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0F010F01FFFF0F01"
    )
        port map (
      I0 => \mulResultExp0[8]_i_2_n_0\,
      I1 => IN_A(23),
      I2 => mulEarlyOutBypassEnable0_i_4_n_0,
      I3 => \mulEarlyOutBypass0[30]_i_6_n_0\,
      I4 => \mulEarlyOutBypass0[30]_i_7_n_0\,
      I5 => mulEarlyOutBypassEnable0_i_5_n_0,
      O => p_2_in(22)
    );
\mulEarlyOutBypass0[22]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0808000808080808"
    )
        port map (
      I0 => IMUL_GO,
      I1 => \mulEarlyOutBypass0[22]_i_9_n_0\,
      I2 => \mulResultExp0[8]_i_6_n_0\,
      I3 => IN_A(23),
      I4 => \mulResultExp0[8]_i_4_n_0\,
      I5 => IN_A(30),
      O => \mulEarlyOutBypass0[22]_i_6_n_0\
    );
\mulEarlyOutBypass0[22]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1010001010101010"
    )
        port map (
      I0 => \mulResultExp0[8]_i_5_n_0\,
      I1 => \mulEarlyOutBypass0[22]_i_10_n_0\,
      I2 => \mulEarlyOutBypass0[22]_i_11_n_0\,
      I3 => IN_B(24),
      I4 => mulResultExp00_carry_i_18_n_0,
      I5 => IN_B(30),
      O => \mulEarlyOutBypass0[22]_i_7_n_0\
    );
\mulEarlyOutBypass0[22]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => IMUL_GO,
      I1 => IN_A(23),
      I2 => \mulResultExp0[8]_i_4_n_0\,
      I3 => IN_A(30),
      O => \mulEarlyOutBypass0[22]_i_8_n_0\
    );
\mulEarlyOutBypass0[22]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => IN_B(24),
      I1 => IN_B(30),
      O => \mulEarlyOutBypass0[22]_i_9_n_0\
    );
\mulEarlyOutBypass0[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88FF88F8888888F8"
    )
        port map (
      I0 => \mulEarlyOutBypass0[30]_i_2_n_0\,
      I1 => \mulEarlyOutBypass0[30]_i_3_n_0\,
      I2 => \mulEarlyOutBypass0_reg_n_0_[30]\,
      I3 => \mulEarlyOutBypass0[30]_i_4_n_0\,
      I4 => \mulEarlyOutBypass0[31]_i_2_n_0\,
      I5 => p_2_in(30),
      O => \mulEarlyOutBypass0[30]_i_1_n_0\
    );
\mulEarlyOutBypass0[30]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_B(10),
      I1 => IN_B(9),
      I2 => IN_B(12),
      I3 => IN_B(11),
      O => \mulEarlyOutBypass0[30]_i_10_n_0\
    );
\mulEarlyOutBypass0[30]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_B(14),
      I1 => IN_B(13),
      I2 => IN_B(16),
      I3 => IN_B(15),
      O => \mulEarlyOutBypass0[30]_i_11_n_0\
    );
\mulEarlyOutBypass0[30]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_B(6),
      I1 => IN_B(5),
      I2 => IN_B(8),
      I3 => IN_B(7),
      O => \mulEarlyOutBypass0[30]_i_12_n_0\
    );
\mulEarlyOutBypass0[30]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_B(2),
      I1 => IN_B(1),
      I2 => IN_B(4),
      I3 => IN_B(3),
      O => \mulEarlyOutBypass0[30]_i_13_n_0\
    );
\mulEarlyOutBypass0[30]_i_14\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(18),
      I1 => IN_A(17),
      I2 => IN_A(20),
      I3 => IN_A(19),
      O => \mulEarlyOutBypass0[30]_i_14_n_0\
    );
\mulEarlyOutBypass0[30]_i_15\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => IN_A(22),
      I1 => IN_A(21),
      I2 => IN_A(0),
      O => \mulEarlyOutBypass0[30]_i_15_n_0\
    );
\mulEarlyOutBypass0[30]_i_16\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(10),
      I1 => IN_A(9),
      I2 => IN_A(12),
      I3 => IN_A(11),
      O => \mulEarlyOutBypass0[30]_i_16_n_0\
    );
\mulEarlyOutBypass0[30]_i_17\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(14),
      I1 => IN_A(13),
      I2 => IN_A(16),
      I3 => IN_A(15),
      O => \mulEarlyOutBypass0[30]_i_17_n_0\
    );
\mulEarlyOutBypass0[30]_i_18\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(6),
      I1 => IN_A(5),
      I2 => IN_A(8),
      I3 => IN_A(7),
      O => \mulEarlyOutBypass0[30]_i_18_n_0\
    );
\mulEarlyOutBypass0[30]_i_19\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(2),
      I1 => IN_A(1),
      I2 => IN_A(4),
      I3 => IN_A(3),
      O => \mulEarlyOutBypass0[30]_i_19_n_0\
    );
\mulEarlyOutBypass0[30]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => mulEarlyOutBypassEnable0_i_4_n_0,
      I1 => \mulEarlyOutBypass0[30]_i_6_n_0\,
      O => \mulEarlyOutBypass0[30]_i_2_n_0\
    );
\mulEarlyOutBypass0[30]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => mulEarlyOutBypassEnable0_i_5_n_0,
      I1 => IMUL_GO,
      I2 => \mulEarlyOutBypass0[30]_i_7_n_0\,
      O => \mulEarlyOutBypass0[30]_i_3_n_0\
    );
\mulEarlyOutBypass0[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8888000088F80000"
    )
        port map (
      I0 => mulEarlyOutBypassEnable0_i_5_n_0,
      I1 => mulEarlyOutBypassEnable0_i_3_n_0,
      I2 => mulEarlyOutBypassEnable0_i_4_n_0,
      I3 => IN_A(23),
      I4 => IMUL_GO,
      I5 => \mulResultExp0[8]_i_2_n_0\,
      O => \mulEarlyOutBypass0[30]_i_4_n_0\
    );
\mulEarlyOutBypass0[30]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"55F4"
    )
        port map (
      I0 => mulEarlyOutBypassEnable0_i_4_n_0,
      I1 => \mulEarlyOutBypass0[30]_i_6_n_0\,
      I2 => \mulEarlyOutBypass0[30]_i_7_n_0\,
      I3 => mulEarlyOutBypassEnable0_i_5_n_0,
      O => p_2_in(30)
    );
\mulEarlyOutBypass0[30]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \mulEarlyOutBypass0[30]_i_8_n_0\,
      I1 => \mulEarlyOutBypass0[30]_i_9_n_0\,
      I2 => \mulEarlyOutBypass0[30]_i_10_n_0\,
      I3 => \mulEarlyOutBypass0[30]_i_11_n_0\,
      I4 => \mulEarlyOutBypass0[30]_i_12_n_0\,
      I5 => \mulEarlyOutBypass0[30]_i_13_n_0\,
      O => \mulEarlyOutBypass0[30]_i_6_n_0\
    );
\mulEarlyOutBypass0[30]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \mulEarlyOutBypass0[30]_i_14_n_0\,
      I1 => \mulEarlyOutBypass0[30]_i_15_n_0\,
      I2 => \mulEarlyOutBypass0[30]_i_16_n_0\,
      I3 => \mulEarlyOutBypass0[30]_i_17_n_0\,
      I4 => \mulEarlyOutBypass0[30]_i_18_n_0\,
      I5 => \mulEarlyOutBypass0[30]_i_19_n_0\,
      O => \mulEarlyOutBypass0[30]_i_7_n_0\
    );
\mulEarlyOutBypass0[30]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_B(18),
      I1 => IN_B(17),
      I2 => IN_B(20),
      I3 => IN_B(19),
      O => \mulEarlyOutBypass0[30]_i_8_n_0\
    );
\mulEarlyOutBypass0[30]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => IN_B(22),
      I1 => IN_B(21),
      I2 => IN_B(0),
      O => \mulEarlyOutBypass0[30]_i_9_n_0\
    );
\mulEarlyOutBypass0[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F60"
    )
        port map (
      I0 => IN_B(31),
      I1 => IN_A(31),
      I2 => \mulEarlyOutBypass0[31]_i_2_n_0\,
      I3 => \mulEarlyOutBypass0_reg_n_0_[31]\,
      O => \mulEarlyOutBypass0[31]_i_1_n_0\
    );
\mulEarlyOutBypass0[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF0000777F0000"
    )
        port map (
      I0 => mulEarlyOutBypassEnable0_i_4_n_0,
      I1 => mulEarlyOutBypassEnable0_i_5_n_0,
      I2 => IN_A(23),
      I3 => \mulResultExp0[8]_i_2_n_0\,
      I4 => IMUL_GO,
      I5 => mulEarlyOutBypassEnable0_i_3_n_0,
      O => \mulEarlyOutBypass0[31]_i_2_n_0\
    );
\mulEarlyOutBypass0_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \mulEarlyOutBypass0[22]_i_1_n_0\,
      Q => \mulEarlyOutBypass0_reg_n_0_[22]\,
      R => '0'
    );
\mulEarlyOutBypass0_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \mulEarlyOutBypass0[30]_i_1_n_0\,
      Q => \mulEarlyOutBypass0_reg_n_0_[30]\,
      R => '0'
    );
\mulEarlyOutBypass0_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \mulEarlyOutBypass0[31]_i_1_n_0\,
      Q => \mulEarlyOutBypass0_reg_n_0_[31]\,
      R => '0'
    );
\mulEarlyOutBypass1_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulEarlyOutBypass0_reg_n_0_[22]\,
      Q => mulEarlyOutBypass1(22),
      R => '0'
    );
\mulEarlyOutBypass1_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulEarlyOutBypass0_reg_n_0_[30]\,
      Q => mulEarlyOutBypass1(30),
      R => '0'
    );
\mulEarlyOutBypass1_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulEarlyOutBypass0_reg_n_0_[31]\,
      Q => mulEarlyOutBypass1(31),
      R => '0'
    );
\mulEarlyOutBypass2_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulEarlyOutBypass1(22),
      Q => mulEarlyOutBypass2(22),
      R => '0'
    );
\mulEarlyOutBypass2_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulEarlyOutBypass1(30),
      Q => mulEarlyOutBypass2(30),
      R => '0'
    );
\mulEarlyOutBypass2_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulEarlyOutBypass1(31),
      Q => mulEarlyOutBypass2(31),
      R => '0'
    );
\mulEarlyOutBypass3_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulEarlyOutBypass2(22),
      Q => mulEarlyOutBypass3(22),
      R => '0'
    );
\mulEarlyOutBypass3_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulEarlyOutBypass2(30),
      Q => mulEarlyOutBypass3(30),
      R => '0'
    );
\mulEarlyOutBypass3_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulEarlyOutBypass2(31),
      Q => mulEarlyOutBypass3(31),
      R => '0'
    );
mulEarlyOutBypassEnable0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEAEFEAEFEAEFEFE"
    )
        port map (
      I0 => mulEarlyOutBypassEnable0_i_2_n_0,
      I1 => mulEarlyOutBypassEnable0_reg_n_0,
      I2 => IMUL_GO,
      I3 => mulEarlyOutBypassEnable0_i_3_n_0,
      I4 => \mulResultExp0[8]_i_2_n_0\,
      I5 => IN_A(23),
      O => mulEarlyOutBypassEnable0_i_1_n_0
    );
mulEarlyOutBypassEnable0_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"70"
    )
        port map (
      I0 => mulEarlyOutBypassEnable0_i_4_n_0,
      I1 => mulEarlyOutBypassEnable0_i_5_n_0,
      I2 => IMUL_GO,
      O => mulEarlyOutBypassEnable0_i_2_n_0
    );
mulEarlyOutBypassEnable0_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => IN_B(30),
      I1 => IN_B(24),
      I2 => \mulResultExp0[8]_i_6_n_0\,
      O => mulEarlyOutBypassEnable0_i_3_n_0
    );
mulEarlyOutBypassEnable0_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => IN_B(30),
      I1 => mulResultExp00_carry_i_18_n_0,
      I2 => IN_B(24),
      O => mulEarlyOutBypassEnable0_i_4_n_0
    );
mulEarlyOutBypassEnable0_i_5: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => IN_A(30),
      I1 => \mulResultExp0[8]_i_4_n_0\,
      I2 => IN_A(23),
      O => mulEarlyOutBypassEnable0_i_5_n_0
    );
mulEarlyOutBypassEnable0_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => mulEarlyOutBypassEnable0_i_1_n_0,
      Q => mulEarlyOutBypassEnable0_reg_n_0,
      R => '0'
    );
mulEarlyOutBypassEnable1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => mulEarlyOutBypassEnable0_reg_n_0,
      Q => mulEarlyOutBypassEnable1,
      R => '0'
    );
mulEarlyOutBypassEnable2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulEarlyOutBypassEnable1,
      Q => mulEarlyOutBypassEnable2,
      R => '0'
    );
mulEarlyOutBypassEnable3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulEarlyOutBypassEnable2,
      Q => mulEarlyOutBypassEnable3,
      R => '0'
    );
mulPipelineValidStage0_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => IMUL_GO,
      Q => mulPipelineValidStage0,
      R => '0'
    );
mulPipelineValidStage1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => mulPipelineValidStage0,
      Q => mulPipelineValidStage1,
      R => '0'
    );
mulPipelineValidStage2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => mulPipelineValidStage1,
      Q => mulPipelineValidStage2,
      R => '0'
    );
mulPipelineValidStage3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => mulPipelineValidStage2,
      Q => mulPipelineValidStage3,
      R => '0'
    );
mulResultExp00_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => mulResultExp00_carry_n_0,
      CO(6) => mulResultExp00_carry_n_1,
      CO(5) => mulResultExp00_carry_n_2,
      CO(4) => mulResultExp00_carry_n_3,
      CO(3) => mulResultExp00_carry_n_4,
      CO(2) => mulResultExp00_carry_n_5,
      CO(1) => mulResultExp00_carry_n_6,
      CO(0) => mulResultExp00_carry_n_7,
      DI(7) => mulResultExp00_carry_i_1_n_0,
      DI(6 downto 0) => RESIZE0_in(6 downto 0),
      O(7) => mulResultExp00_carry_n_8,
      O(6) => mulResultExp00_carry_n_9,
      O(5) => mulResultExp00_carry_n_10,
      O(4) => mulResultExp00_carry_n_11,
      O(3) => mulResultExp00_carry_n_12,
      O(2) => mulResultExp00_carry_n_13,
      O(1) => mulResultExp00_carry_n_14,
      O(0) => mulResultExp00_carry_n_15,
      S(7) => mulResultExp00_carry_i_9_n_0,
      S(6) => mulResultExp00_carry_i_10_n_0,
      S(5) => mulResultExp00_carry_i_11_n_0,
      S(4) => mulResultExp00_carry_i_12_n_0,
      S(3) => mulResultExp00_carry_i_13_n_0,
      S(2) => mulResultExp00_carry_i_14_n_0,
      S(1) => mulResultExp00_carry_i_15_n_0,
      S(0) => mulResultExp00_carry_i_16_n_0
    );
\mulResultExp00_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => mulResultExp00_carry_n_0,
      CI_TOP => '0',
      CO(7 downto 0) => \NLW_mulResultExp00_carry__0_CO_UNCONNECTED\(7 downto 0),
      DI(7 downto 0) => B"00000000",
      O(7 downto 1) => \NLW_mulResultExp00_carry__0_O_UNCONNECTED\(7 downto 1),
      O(0) => \mulResultExp00_carry__0_n_15\,
      S(7 downto 0) => B"00000001"
    );
mulResultExp00_carry_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => \mulResultExp0[8]_i_4_n_0\,
      I1 => IN_A(23),
      I2 => IN_A(30),
      O => mulResultExp00_carry_i_1_n_0
    );
mulResultExp00_carry_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"59A6A65959A659A6"
    )
        port map (
      I0 => IN_A(29),
      I1 => IN_A(23),
      I2 => mulResultExp00_carry_i_17_n_0,
      I3 => IN_B(29),
      I4 => mulResultExp00_carry_i_19_n_0,
      I5 => IN_B(24),
      O => mulResultExp00_carry_i_10_n_0
    );
mulResultExp00_carry_i_11: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6966"
    )
        port map (
      I0 => RESIZE0_in(5),
      I1 => IN_B(28),
      I2 => mulResultExp00_carry_i_20_n_0,
      I3 => IN_B(24),
      O => mulResultExp00_carry_i_11_n_0
    );
mulResultExp00_carry_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9666666666666666"
    )
        port map (
      I0 => RESIZE0_in(4),
      I1 => IN_B(27),
      I2 => IN_B(26),
      I3 => IN_B(23),
      I4 => IN_B(25),
      I5 => IN_B(24),
      O => mulResultExp00_carry_i_12_n_0
    );
mulResultExp00_carry_i_13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"96666666"
    )
        port map (
      I0 => RESIZE0_in(3),
      I1 => IN_B(26),
      I2 => IN_B(25),
      I3 => IN_B(23),
      I4 => IN_B(24),
      O => mulResultExp00_carry_i_13_n_0
    );
mulResultExp00_carry_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6A95956A956A956A"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_A(23),
      I2 => IN_A(24),
      I3 => IN_B(25),
      I4 => IN_B(23),
      I5 => IN_B(24),
      O => mulResultExp00_carry_i_14_n_0
    );
mulResultExp00_carry_i_15: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6996"
    )
        port map (
      I0 => IN_A(24),
      I1 => IN_A(23),
      I2 => IN_B(24),
      I3 => IN_B(23),
      O => mulResultExp00_carry_i_15_n_0
    );
mulResultExp00_carry_i_16: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => IN_A(23),
      I1 => IN_B(23),
      O => mulResultExp00_carry_i_16_n_0
    );
mulResultExp00_carry_i_17: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => IN_A(27),
      I1 => IN_A(25),
      I2 => IN_A(24),
      I3 => IN_A(26),
      I4 => IN_A(28),
      O => mulResultExp00_carry_i_17_n_0
    );
mulResultExp00_carry_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => IN_B(28),
      I1 => IN_B(26),
      I2 => IN_B(23),
      I3 => IN_B(25),
      I4 => IN_B(27),
      I5 => IN_B(29),
      O => mulResultExp00_carry_i_18_n_0
    );
mulResultExp00_carry_i_19: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => IN_B(27),
      I1 => IN_B(25),
      I2 => IN_B(23),
      I3 => IN_B(26),
      I4 => IN_B(28),
      O => mulResultExp00_carry_i_19_n_0
    );
mulResultExp00_carry_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B4"
    )
        port map (
      I0 => mulResultExp00_carry_i_17_n_0,
      I1 => IN_A(23),
      I2 => IN_A(29),
      O => RESIZE0_in(6)
    );
mulResultExp00_carry_i_20: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => IN_B(26),
      I1 => IN_B(23),
      I2 => IN_B(25),
      I3 => IN_B(27),
      O => mulResultExp00_carry_i_20_n_0
    );
mulResultExp00_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => IN_A(26),
      I1 => IN_A(24),
      I2 => IN_A(25),
      I3 => IN_A(27),
      I4 => IN_A(23),
      I5 => IN_A(28),
      O => RESIZE0_in(5)
    );
mulResultExp00_carry_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_A(24),
      I2 => IN_A(26),
      I3 => IN_A(23),
      I4 => IN_A(27),
      O => RESIZE0_in(4)
    );
mulResultExp00_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => IN_A(24),
      I1 => IN_A(25),
      I2 => IN_A(23),
      I3 => IN_A(26),
      O => RESIZE0_in(3)
    );
mulResultExp00_carry_i_6: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => IN_A(24),
      I1 => IN_A(23),
      I2 => IN_A(25),
      O => RESIZE0_in(2)
    );
mulResultExp00_carry_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => IN_A(23),
      I1 => IN_A(24),
      O => RESIZE0_in(1)
    );
mulResultExp00_carry_i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => IN_A(23),
      O => RESIZE0_in(0)
    );
mulResultExp00_carry_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"59A6A65959A659A6"
    )
        port map (
      I0 => IN_A(30),
      I1 => IN_A(23),
      I2 => \mulResultExp0[8]_i_4_n_0\,
      I3 => IN_B(30),
      I4 => mulResultExp00_carry_i_18_n_0,
      I5 => IN_B(24),
      O => mulResultExp00_carry_i_9_n_0
    );
\mulResultExp0[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C080C0800080C080"
    )
        port map (
      I0 => \mulResultExp0[8]_i_2_n_0\,
      I1 => \mulResultExp0[8]_i_3_n_0\,
      I2 => IMUL_GO,
      I3 => IN_A(23),
      I4 => IN_A(30),
      I5 => \mulResultExp0[8]_i_4_n_0\,
      O => mulResultExp0(0)
    );
\mulResultExp0[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \mulResultExp0[8]_i_5_n_0\,
      I1 => IN_A(24),
      I2 => IN_A(29),
      I3 => IN_A(30),
      O => \mulResultExp0[8]_i_2_n_0\
    );
\mulResultExp0[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE3E"
    )
        port map (
      I0 => \mulResultExp0[8]_i_6_n_0\,
      I1 => IN_B(30),
      I2 => IN_B(24),
      I3 => mulResultExp00_carry_i_18_n_0,
      O => \mulResultExp0[8]_i_3_n_0\
    );
\mulResultExp0[8]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => IN_A(28),
      I1 => IN_A(26),
      I2 => IN_A(24),
      I3 => IN_A(25),
      I4 => IN_A(27),
      I5 => IN_A(29),
      O => \mulResultExp0[8]_i_4_n_0\
    );
\mulResultExp0[8]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(26),
      I1 => IN_A(25),
      I2 => IN_A(28),
      I3 => IN_A(27),
      O => \mulResultExp0[8]_i_5_n_0\
    );
\mulResultExp0[8]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => IN_B(28),
      I1 => IN_B(29),
      I2 => IN_B(26),
      I3 => IN_B(27),
      I4 => IN_B(25),
      I5 => IN_B(23),
      O => \mulResultExp0[8]_i_6_n_0\
    );
\mulResultExp0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulResultExp0(0),
      D => mulResultExp00_carry_n_15,
      Q => \mulResultExp0_reg_n_0_[0]\,
      R => '0'
    );
\mulResultExp0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulResultExp0(0),
      D => mulResultExp00_carry_n_14,
      Q => \mulResultExp0_reg_n_0_[1]\,
      R => '0'
    );
\mulResultExp0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulResultExp0(0),
      D => mulResultExp00_carry_n_13,
      Q => \mulResultExp0_reg_n_0_[2]\,
      R => '0'
    );
\mulResultExp0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulResultExp0(0),
      D => mulResultExp00_carry_n_12,
      Q => \mulResultExp0_reg_n_0_[3]\,
      R => '0'
    );
\mulResultExp0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulResultExp0(0),
      D => mulResultExp00_carry_n_11,
      Q => \mulResultExp0_reg_n_0_[4]\,
      R => '0'
    );
\mulResultExp0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulResultExp0(0),
      D => mulResultExp00_carry_n_10,
      Q => \mulResultExp0_reg_n_0_[5]\,
      R => '0'
    );
\mulResultExp0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulResultExp0(0),
      D => mulResultExp00_carry_n_9,
      Q => \mulResultExp0_reg_n_0_[6]\,
      R => '0'
    );
\mulResultExp0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulResultExp0(0),
      D => mulResultExp00_carry_n_8,
      Q => \mulResultExp0_reg_n_0_[7]\,
      R => '0'
    );
\mulResultExp0_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulResultExp0(0),
      D => \mulResultExp00_carry__0_n_15\,
      Q => \mulResultExp0_reg_n_0_[8]\,
      R => '0'
    );
\mulResultExp1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulResultExp0_reg_n_0_[0]\,
      Q => mulResultExp1(0),
      R => '0'
    );
\mulResultExp1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulResultExp0_reg_n_0_[1]\,
      Q => mulResultExp1(1),
      R => '0'
    );
\mulResultExp1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulResultExp0_reg_n_0_[2]\,
      Q => mulResultExp1(2),
      R => '0'
    );
\mulResultExp1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulResultExp0_reg_n_0_[3]\,
      Q => mulResultExp1(3),
      R => '0'
    );
\mulResultExp1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulResultExp0_reg_n_0_[4]\,
      Q => mulResultExp1(4),
      R => '0'
    );
\mulResultExp1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulResultExp0_reg_n_0_[5]\,
      Q => mulResultExp1(5),
      R => '0'
    );
\mulResultExp1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulResultExp0_reg_n_0_[6]\,
      Q => mulResultExp1(6),
      R => '0'
    );
\mulResultExp1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulResultExp0_reg_n_0_[7]\,
      Q => mulResultExp1(7),
      R => '0'
    );
\mulResultExp1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => \mulResultExp0_reg_n_0_[8]\,
      Q => mulResultExp1(8),
      R => '0'
    );
\mulResultExp2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulResultExp1(0),
      Q => mulResultExp2(0),
      R => '0'
    );
\mulResultExp2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulResultExp1(1),
      Q => mulResultExp2(1),
      R => '0'
    );
\mulResultExp2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulResultExp1(2),
      Q => mulResultExp2(2),
      R => '0'
    );
\mulResultExp2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulResultExp1(3),
      Q => mulResultExp2(3),
      R => '0'
    );
\mulResultExp2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulResultExp1(4),
      Q => mulResultExp2(4),
      R => '0'
    );
\mulResultExp2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulResultExp1(5),
      Q => mulResultExp2(5),
      R => '0'
    );
\mulResultExp2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulResultExp1(6),
      Q => mulResultExp2(6),
      R => '0'
    );
\mulResultExp2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulResultExp1(7),
      Q => mulResultExp2(7),
      R => '0'
    );
\mulResultExp2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulResultExp1(8),
      Q => mulResultExp2(8),
      R => '0'
    );
\mulResultExp3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultExp2(0),
      Q => \mulResultExp3_reg_n_0_[0]\,
      R => '0'
    );
\mulResultExp3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultExp2(1),
      Q => \mulResultExp3_reg_n_0_[1]\,
      R => '0'
    );
\mulResultExp3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultExp2(2),
      Q => \mulResultExp3_reg_n_0_[2]\,
      R => '0'
    );
\mulResultExp3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultExp2(3),
      Q => \mulResultExp3_reg_n_0_[3]\,
      R => '0'
    );
\mulResultExp3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultExp2(4),
      Q => \mulResultExp3_reg_n_0_[4]\,
      R => '0'
    );
\mulResultExp3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultExp2(5),
      Q => \mulResultExp3_reg_n_0_[5]\,
      R => '0'
    );
\mulResultExp3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultExp2(6),
      Q => \mulResultExp3_reg_n_0_[6]\,
      R => '0'
    );
\mulResultExp3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultExp2(7),
      Q => \mulResultExp3_reg_n_0_[7]\,
      R => '0'
    );
\mulResultExp3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultExp2(8),
      Q => \mulResultExp3_reg_n_0_[8]\,
      R => '0'
    );
mulResultMantissa10: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BMULTSEL => "B",
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 0,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 23) => B"0000001",
      A(22 downto 0) => IN_B(22 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_mulResultMantissa10_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => '0',
      B(16 downto 0) => IN_A(16 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_mulResultMantissa10_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_mulResultMantissa10_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_mulResultMantissa10_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => mulResultExp0(0),
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => mulResultExp0(0),
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => '0',
      CLK => clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_mulResultMantissa10_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_mulResultMantissa10_OVERFLOW_UNCONNECTED,
      P(47) => mulResultMantissa10_n_58,
      P(46) => mulResultMantissa10_n_59,
      P(45) => mulResultMantissa10_n_60,
      P(44) => mulResultMantissa10_n_61,
      P(43) => mulResultMantissa10_n_62,
      P(42) => mulResultMantissa10_n_63,
      P(41) => mulResultMantissa10_n_64,
      P(40) => mulResultMantissa10_n_65,
      P(39) => mulResultMantissa10_n_66,
      P(38) => mulResultMantissa10_n_67,
      P(37) => mulResultMantissa10_n_68,
      P(36) => mulResultMantissa10_n_69,
      P(35) => mulResultMantissa10_n_70,
      P(34) => mulResultMantissa10_n_71,
      P(33) => mulResultMantissa10_n_72,
      P(32) => mulResultMantissa10_n_73,
      P(31) => mulResultMantissa10_n_74,
      P(30) => mulResultMantissa10_n_75,
      P(29) => mulResultMantissa10_n_76,
      P(28) => mulResultMantissa10_n_77,
      P(27) => mulResultMantissa10_n_78,
      P(26) => mulResultMantissa10_n_79,
      P(25) => mulResultMantissa10_n_80,
      P(24) => mulResultMantissa10_n_81,
      P(23) => mulResultMantissa10_n_82,
      P(22) => mulResultMantissa10_n_83,
      P(21) => mulResultMantissa10_n_84,
      P(20) => mulResultMantissa10_n_85,
      P(19) => mulResultMantissa10_n_86,
      P(18) => mulResultMantissa10_n_87,
      P(17) => mulResultMantissa10_n_88,
      P(16) => mulResultMantissa10_n_89,
      P(15) => mulResultMantissa10_n_90,
      P(14) => mulResultMantissa10_n_91,
      P(13) => mulResultMantissa10_n_92,
      P(12) => mulResultMantissa10_n_93,
      P(11) => mulResultMantissa10_n_94,
      P(10) => mulResultMantissa10_n_95,
      P(9) => mulResultMantissa10_n_96,
      P(8) => mulResultMantissa10_n_97,
      P(7) => mulResultMantissa10_n_98,
      P(6) => mulResultMantissa10_n_99,
      P(5) => mulResultMantissa10_n_100,
      P(4) => mulResultMantissa10_n_101,
      P(3) => mulResultMantissa10_n_102,
      P(2) => mulResultMantissa10_n_103,
      P(1) => mulResultMantissa10_n_104,
      P(0) => mulResultMantissa10_n_105,
      PATTERNBDETECT => NLW_mulResultMantissa10_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_mulResultMantissa10_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => mulResultMantissa10_n_106,
      PCOUT(46) => mulResultMantissa10_n_107,
      PCOUT(45) => mulResultMantissa10_n_108,
      PCOUT(44) => mulResultMantissa10_n_109,
      PCOUT(43) => mulResultMantissa10_n_110,
      PCOUT(42) => mulResultMantissa10_n_111,
      PCOUT(41) => mulResultMantissa10_n_112,
      PCOUT(40) => mulResultMantissa10_n_113,
      PCOUT(39) => mulResultMantissa10_n_114,
      PCOUT(38) => mulResultMantissa10_n_115,
      PCOUT(37) => mulResultMantissa10_n_116,
      PCOUT(36) => mulResultMantissa10_n_117,
      PCOUT(35) => mulResultMantissa10_n_118,
      PCOUT(34) => mulResultMantissa10_n_119,
      PCOUT(33) => mulResultMantissa10_n_120,
      PCOUT(32) => mulResultMantissa10_n_121,
      PCOUT(31) => mulResultMantissa10_n_122,
      PCOUT(30) => mulResultMantissa10_n_123,
      PCOUT(29) => mulResultMantissa10_n_124,
      PCOUT(28) => mulResultMantissa10_n_125,
      PCOUT(27) => mulResultMantissa10_n_126,
      PCOUT(26) => mulResultMantissa10_n_127,
      PCOUT(25) => mulResultMantissa10_n_128,
      PCOUT(24) => mulResultMantissa10_n_129,
      PCOUT(23) => mulResultMantissa10_n_130,
      PCOUT(22) => mulResultMantissa10_n_131,
      PCOUT(21) => mulResultMantissa10_n_132,
      PCOUT(20) => mulResultMantissa10_n_133,
      PCOUT(19) => mulResultMantissa10_n_134,
      PCOUT(18) => mulResultMantissa10_n_135,
      PCOUT(17) => mulResultMantissa10_n_136,
      PCOUT(16) => mulResultMantissa10_n_137,
      PCOUT(15) => mulResultMantissa10_n_138,
      PCOUT(14) => mulResultMantissa10_n_139,
      PCOUT(13) => mulResultMantissa10_n_140,
      PCOUT(12) => mulResultMantissa10_n_141,
      PCOUT(11) => mulResultMantissa10_n_142,
      PCOUT(10) => mulResultMantissa10_n_143,
      PCOUT(9) => mulResultMantissa10_n_144,
      PCOUT(8) => mulResultMantissa10_n_145,
      PCOUT(7) => mulResultMantissa10_n_146,
      PCOUT(6) => mulResultMantissa10_n_147,
      PCOUT(5) => mulResultMantissa10_n_148,
      PCOUT(4) => mulResultMantissa10_n_149,
      PCOUT(3) => mulResultMantissa10_n_150,
      PCOUT(2) => mulResultMantissa10_n_151,
      PCOUT(1) => mulResultMantissa10_n_152,
      PCOUT(0) => mulResultMantissa10_n_153,
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_mulResultMantissa10_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_mulResultMantissa10_XOROUT_UNCONNECTED(7 downto 0)
    );
mulResultMantissa1_reg: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 1,
      BMULTSEL => "B",
      BREG => 1,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 1,
      DREG => 1,
      INMODEREG => 0,
      MASK => X"3FFFFFFFFFFF",
      MREG => 0,
      OPMODEREG => 0,
      PATTERN => X"000000000000",
      PREADDINSEL => "A",
      PREG => 1,
      RND => X"000000000000",
      SEL_MASK => "MASK",
      SEL_PATTERN => "PATTERN",
      USE_MULT => "MULTIPLY",
      USE_PATTERN_DETECT => "NO_PATDET",
      USE_SIMD => "ONE48",
      USE_WIDEXOR => "FALSE",
      XORSIMD => "XOR24_48_96"
    )
        port map (
      A(29 downto 23) => B"0000001",
      A(22 downto 0) => IN_B(22 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_mulResultMantissa1_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 6) => B"000000000001",
      B(5 downto 0) => IN_A(22 downto 17),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_mulResultMantissa1_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_mulResultMantissa1_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_mulResultMantissa1_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => mulResultExp0(0),
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => mulResultExp0(0),
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => mulResultMantissa1(0),
      CLK => clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_mulResultMantissa1_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"001010101",
      OVERFLOW => NLW_mulResultMantissa1_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 31) => NLW_mulResultMantissa1_reg_P_UNCONNECTED(47 downto 31),
      P(30 downto 6) => \mulResultMantissa1_reg__0\(47 downto 23),
      P(5) => mulResultMantissa1_reg_n_100,
      P(4) => mulResultMantissa1_reg_n_101,
      P(3) => mulResultMantissa1_reg_n_102,
      P(2) => mulResultMantissa1_reg_n_103,
      P(1) => mulResultMantissa1_reg_n_104,
      P(0) => mulResultMantissa1_reg_n_105,
      PATTERNBDETECT => NLW_mulResultMantissa1_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_mulResultMantissa1_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => mulResultMantissa10_n_106,
      PCIN(46) => mulResultMantissa10_n_107,
      PCIN(45) => mulResultMantissa10_n_108,
      PCIN(44) => mulResultMantissa10_n_109,
      PCIN(43) => mulResultMantissa10_n_110,
      PCIN(42) => mulResultMantissa10_n_111,
      PCIN(41) => mulResultMantissa10_n_112,
      PCIN(40) => mulResultMantissa10_n_113,
      PCIN(39) => mulResultMantissa10_n_114,
      PCIN(38) => mulResultMantissa10_n_115,
      PCIN(37) => mulResultMantissa10_n_116,
      PCIN(36) => mulResultMantissa10_n_117,
      PCIN(35) => mulResultMantissa10_n_118,
      PCIN(34) => mulResultMantissa10_n_119,
      PCIN(33) => mulResultMantissa10_n_120,
      PCIN(32) => mulResultMantissa10_n_121,
      PCIN(31) => mulResultMantissa10_n_122,
      PCIN(30) => mulResultMantissa10_n_123,
      PCIN(29) => mulResultMantissa10_n_124,
      PCIN(28) => mulResultMantissa10_n_125,
      PCIN(27) => mulResultMantissa10_n_126,
      PCIN(26) => mulResultMantissa10_n_127,
      PCIN(25) => mulResultMantissa10_n_128,
      PCIN(24) => mulResultMantissa10_n_129,
      PCIN(23) => mulResultMantissa10_n_130,
      PCIN(22) => mulResultMantissa10_n_131,
      PCIN(21) => mulResultMantissa10_n_132,
      PCIN(20) => mulResultMantissa10_n_133,
      PCIN(19) => mulResultMantissa10_n_134,
      PCIN(18) => mulResultMantissa10_n_135,
      PCIN(17) => mulResultMantissa10_n_136,
      PCIN(16) => mulResultMantissa10_n_137,
      PCIN(15) => mulResultMantissa10_n_138,
      PCIN(14) => mulResultMantissa10_n_139,
      PCIN(13) => mulResultMantissa10_n_140,
      PCIN(12) => mulResultMantissa10_n_141,
      PCIN(11) => mulResultMantissa10_n_142,
      PCIN(10) => mulResultMantissa10_n_143,
      PCIN(9) => mulResultMantissa10_n_144,
      PCIN(8) => mulResultMantissa10_n_145,
      PCIN(7) => mulResultMantissa10_n_146,
      PCIN(6) => mulResultMantissa10_n_147,
      PCIN(5) => mulResultMantissa10_n_148,
      PCIN(4) => mulResultMantissa10_n_149,
      PCIN(3) => mulResultMantissa10_n_150,
      PCIN(2) => mulResultMantissa10_n_151,
      PCIN(1) => mulResultMantissa10_n_152,
      PCIN(0) => mulResultMantissa10_n_153,
      PCOUT(47 downto 0) => NLW_mulResultMantissa1_reg_PCOUT_UNCONNECTED(47 downto 0),
      RSTA => '0',
      RSTALLCARRYIN => '0',
      RSTALUMODE => '0',
      RSTB => '0',
      RSTC => '0',
      RSTCTRL => '0',
      RSTD => '0',
      RSTINMODE => '0',
      RSTM => '0',
      RSTP => '0',
      UNDERFLOW => NLW_mulResultMantissa1_reg_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_mulResultMantissa1_reg_XOROUT_UNCONNECTED(7 downto 0)
    );
mulResultMantissa1_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => mulPipelineValidStage0,
      I1 => mulEarlyOutBypassEnable0_reg_n_0,
      O => mulResultMantissa1(0)
    );
\mulResultMantissa2_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(23),
      Q => mulResultMantissa2(23),
      R => '0'
    );
\mulResultMantissa2_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(24),
      Q => mulResultMantissa2(24),
      R => '0'
    );
\mulResultMantissa2_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(25),
      Q => mulResultMantissa2(25),
      R => '0'
    );
\mulResultMantissa2_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(26),
      Q => mulResultMantissa2(26),
      R => '0'
    );
\mulResultMantissa2_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(27),
      Q => mulResultMantissa2(27),
      R => '0'
    );
\mulResultMantissa2_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(28),
      Q => mulResultMantissa2(28),
      R => '0'
    );
\mulResultMantissa2_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(29),
      Q => mulResultMantissa2(29),
      R => '0'
    );
\mulResultMantissa2_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(30),
      Q => mulResultMantissa2(30),
      R => '0'
    );
\mulResultMantissa2_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(31),
      Q => mulResultMantissa2(31),
      R => '0'
    );
\mulResultMantissa2_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(32),
      Q => mulResultMantissa2(32),
      R => '0'
    );
\mulResultMantissa2_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(33),
      Q => mulResultMantissa2(33),
      R => '0'
    );
\mulResultMantissa2_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(34),
      Q => mulResultMantissa2(34),
      R => '0'
    );
\mulResultMantissa2_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(35),
      Q => mulResultMantissa2(35),
      R => '0'
    );
\mulResultMantissa2_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(36),
      Q => mulResultMantissa2(36),
      R => '0'
    );
\mulResultMantissa2_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(37),
      Q => mulResultMantissa2(37),
      R => '0'
    );
\mulResultMantissa2_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(38),
      Q => mulResultMantissa2(38),
      R => '0'
    );
\mulResultMantissa2_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(39),
      Q => mulResultMantissa2(39),
      R => '0'
    );
\mulResultMantissa2_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(40),
      Q => mulResultMantissa2(40),
      R => '0'
    );
\mulResultMantissa2_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(41),
      Q => mulResultMantissa2(41),
      R => '0'
    );
\mulResultMantissa2_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(42),
      Q => mulResultMantissa2(42),
      R => '0'
    );
\mulResultMantissa2_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(43),
      Q => mulResultMantissa2(43),
      R => '0'
    );
\mulResultMantissa2_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(44),
      Q => mulResultMantissa2(44),
      R => '0'
    );
\mulResultMantissa2_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(45),
      Q => mulResultMantissa2(45),
      R => '0'
    );
\mulResultMantissa2_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(46),
      Q => mulResultMantissa2(46),
      R => '0'
    );
\mulResultMantissa2_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => \mulResultMantissa1_reg__0\(47),
      Q => mulResultMantissa2(47),
      R => '0'
    );
\mulResultMantissa3_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(23),
      Q => OMUL1(0),
      R => '0'
    );
\mulResultMantissa3_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(24),
      Q => OMUL1(1),
      R => '0'
    );
\mulResultMantissa3_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(25),
      Q => OMUL1(2),
      R => '0'
    );
\mulResultMantissa3_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(26),
      Q => OMUL1(3),
      R => '0'
    );
\mulResultMantissa3_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(27),
      Q => OMUL1(4),
      R => '0'
    );
\mulResultMantissa3_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(28),
      Q => OMUL1(5),
      R => '0'
    );
\mulResultMantissa3_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(29),
      Q => OMUL1(6),
      R => '0'
    );
\mulResultMantissa3_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(30),
      Q => OMUL1(7),
      R => '0'
    );
\mulResultMantissa3_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(31),
      Q => OMUL1(8),
      R => '0'
    );
\mulResultMantissa3_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(32),
      Q => OMUL1(9),
      R => '0'
    );
\mulResultMantissa3_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(33),
      Q => OMUL1(10),
      R => '0'
    );
\mulResultMantissa3_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(34),
      Q => OMUL1(11),
      R => '0'
    );
\mulResultMantissa3_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(35),
      Q => OMUL1(12),
      R => '0'
    );
\mulResultMantissa3_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(36),
      Q => OMUL1(13),
      R => '0'
    );
\mulResultMantissa3_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(37),
      Q => OMUL1(14),
      R => '0'
    );
\mulResultMantissa3_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(38),
      Q => OMUL1(15),
      R => '0'
    );
\mulResultMantissa3_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(39),
      Q => OMUL1(16),
      R => '0'
    );
\mulResultMantissa3_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(40),
      Q => OMUL1(17),
      R => '0'
    );
\mulResultMantissa3_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(41),
      Q => OMUL1(18),
      R => '0'
    );
\mulResultMantissa3_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(42),
      Q => OMUL1(19),
      R => '0'
    );
\mulResultMantissa3_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(43),
      Q => OMUL1(20),
      R => '0'
    );
\mulResultMantissa3_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(44),
      Q => OMUL1(21),
      R => '0'
    );
\mulResultMantissa3_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(45),
      Q => OMUL1(22),
      R => '0'
    );
\mulResultMantissa3_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(46),
      Q => OMUL1(23),
      R => '0'
    );
\mulResultMantissa3_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultMantissa2(47),
      Q => OMUL1(24),
      R => '0'
    );
mulResultSign0_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6F60"
    )
        port map (
      I0 => IN_B(31),
      I1 => IN_A(31),
      I2 => IMUL_GO,
      I3 => mulResultSign0,
      O => mulResultSign0_i_1_n_0
    );
mulResultSign0_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => mulResultSign0_i_1_n_0,
      Q => mulResultSign0,
      R => '0'
    );
mulResultSign1_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage0,
      D => mulResultSign0,
      Q => mulResultSign1,
      R => '0'
    );
mulResultSign2_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage1,
      D => mulResultSign1,
      Q => mulResultSign2,
      R => '0'
    );
mulResultSign3_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => mulPipelineValidStage2,
      D => mulResultSign2,
      Q => mulResultSign3,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_StandaloneFloatALU_M_0_2 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    IN_B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OMUL : out STD_LOGIC_VECTOR ( 31 downto 0 );
    IMUL_GO : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_StandaloneFloatALU_M_0_2 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_StandaloneFloatALU_M_0_2 : entity is "MainDesign_StandaloneFloatALU_M_0_2,StandaloneFloatALU_MUL,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_StandaloneFloatALU_M_0_2 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_StandaloneFloatALU_M_0_2 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_StandaloneFloatALU_M_0_2 : entity is "StandaloneFloatALU_MUL,Vivado 2025.2";
end MainDesign_StandaloneFloatALU_M_0_2;

architecture STRUCTURE of MainDesign_StandaloneFloatALU_M_0_2 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
begin
U0: entity work.MainDesign_StandaloneFloatALU_M_0_2_StandaloneFloatALU_MUL
     port map (
      IMUL_GO => IMUL_GO,
      IN_A(31 downto 0) => IN_A(31 downto 0),
      IN_B(31 downto 0) => IN_B(31 downto 0),
      OMUL(31 downto 0) => OMUL(31 downto 0),
      clk => clk
    );
end STRUCTURE;
