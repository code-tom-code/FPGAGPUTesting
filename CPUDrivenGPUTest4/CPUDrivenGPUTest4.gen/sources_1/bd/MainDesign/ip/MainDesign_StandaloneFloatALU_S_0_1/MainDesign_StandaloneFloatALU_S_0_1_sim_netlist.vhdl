-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
-- Date        : Sun Dec 21 17:59:11 2025
-- Host        : TomTop3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Tom/Documents/repos/FPGAGPUTesting/CPUDrivenGPUTest4/CPUDrivenGPUTest4.gen/sources_1/bd/MainDesign/ip/MainDesign_StandaloneFloatALU_S_0_1/MainDesign_StandaloneFloatALU_S_0_1_sim_netlist.vhdl
-- Design      : MainDesign_StandaloneFloatALU_S_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_StandaloneFloatALU_S_0_1_StandaloneFloatALU_SPEC is
  port (
    OSPEC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ISPEC_GO : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of MainDesign_StandaloneFloatALU_S_0_1_StandaloneFloatALU_SPEC : entity is "StandaloneFloatALU_SPEC";
end MainDesign_StandaloneFloatALU_S_0_1_StandaloneFloatALU_SPEC;

architecture STRUCTURE of MainDesign_StandaloneFloatALU_S_0_1_StandaloneFloatALU_SPEC is
  signal L : STD_LOGIC_VECTOR ( 30 downto 6 );
  signal \RcpLookupTable_Offsets[0]_1\ : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \RcpLookupTable_Slopes[0]_0\ : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_2_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_3_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_4_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_5_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_6_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_7_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_8_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_8_n_0\ : STD_LOGIC;
  signal \not\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal p_1_in : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal plusOp : STD_LOGIC_VECTOR ( 29 downto 7 );
  signal rAccum0 : STD_LOGIC;
  signal \rAccumProduct0__0_n_100\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_101\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_102\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_103\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_104\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_105\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_106\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_107\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_108\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_109\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_110\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_111\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_112\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_113\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_114\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_115\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_116\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_117\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_118\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_119\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_120\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_121\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_122\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_123\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_124\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_125\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_126\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_127\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_128\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_129\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_130\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_131\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_132\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_133\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_134\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_135\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_136\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_137\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_138\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_139\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_140\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_141\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_142\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_143\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_144\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_145\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_146\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_147\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_148\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_149\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_150\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_151\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_152\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_153\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_58\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_59\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_60\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_61\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_62\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_63\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_64\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_65\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_66\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_67\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_68\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_69\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_70\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_71\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_72\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_73\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_74\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_75\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_76\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_77\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_78\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_79\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_80\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_81\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_82\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_83\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_84\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_85\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_86\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_87\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_88\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_89\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_90\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_91\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_92\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_93\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_94\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_95\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_96\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_97\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_98\ : STD_LOGIC;
  signal \rAccumProduct0__0_n_99\ : STD_LOGIC;
  signal \rAccumProduct0__1\ : STD_LOGIC;
  signal rAccumProduct0_i_10_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_11_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_12_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_13_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_14_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_15_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_16_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_17_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_18_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_19_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_20_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_21_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_21_n_1 : STD_LOGIC;
  signal rAccumProduct0_i_21_n_2 : STD_LOGIC;
  signal rAccumProduct0_i_21_n_3 : STD_LOGIC;
  signal rAccumProduct0_i_21_n_4 : STD_LOGIC;
  signal rAccumProduct0_i_21_n_5 : STD_LOGIC;
  signal rAccumProduct0_i_21_n_6 : STD_LOGIC;
  signal rAccumProduct0_i_21_n_7 : STD_LOGIC;
  signal rAccumProduct0_i_22_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_23_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_24_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_25_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_26_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_27_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_28_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_29_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_2_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_2_n_1 : STD_LOGIC;
  signal rAccumProduct0_i_2_n_2 : STD_LOGIC;
  signal rAccumProduct0_i_2_n_3 : STD_LOGIC;
  signal rAccumProduct0_i_2_n_4 : STD_LOGIC;
  signal rAccumProduct0_i_2_n_5 : STD_LOGIC;
  signal rAccumProduct0_i_2_n_6 : STD_LOGIC;
  signal rAccumProduct0_i_2_n_7 : STD_LOGIC;
  signal rAccumProduct0_i_30_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_30_n_1 : STD_LOGIC;
  signal rAccumProduct0_i_30_n_2 : STD_LOGIC;
  signal rAccumProduct0_i_30_n_3 : STD_LOGIC;
  signal rAccumProduct0_i_30_n_4 : STD_LOGIC;
  signal rAccumProduct0_i_30_n_5 : STD_LOGIC;
  signal rAccumProduct0_i_30_n_6 : STD_LOGIC;
  signal rAccumProduct0_i_30_n_7 : STD_LOGIC;
  signal rAccumProduct0_i_31_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_32_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_33_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_34_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_35_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_36_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_37_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_38_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_39_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_3_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_3_n_1 : STD_LOGIC;
  signal rAccumProduct0_i_3_n_2 : STD_LOGIC;
  signal rAccumProduct0_i_3_n_3 : STD_LOGIC;
  signal rAccumProduct0_i_3_n_4 : STD_LOGIC;
  signal rAccumProduct0_i_3_n_5 : STD_LOGIC;
  signal rAccumProduct0_i_3_n_6 : STD_LOGIC;
  signal rAccumProduct0_i_3_n_7 : STD_LOGIC;
  signal rAccumProduct0_i_40_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_41_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_42_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_43_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_44_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_45_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_4_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_4_n_1 : STD_LOGIC;
  signal rAccumProduct0_i_4_n_2 : STD_LOGIC;
  signal rAccumProduct0_i_4_n_3 : STD_LOGIC;
  signal rAccumProduct0_i_4_n_4 : STD_LOGIC;
  signal rAccumProduct0_i_4_n_5 : STD_LOGIC;
  signal rAccumProduct0_i_4_n_6 : STD_LOGIC;
  signal rAccumProduct0_i_4_n_7 : STD_LOGIC;
  signal rAccumProduct0_i_5_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_6_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_7_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_8_n_0 : STD_LOGIC;
  signal rAccumProduct0_i_9_n_0 : STD_LOGIC;
  signal rAccumProduct0_n_100 : STD_LOGIC;
  signal rAccumProduct0_n_101 : STD_LOGIC;
  signal rAccumProduct0_n_102 : STD_LOGIC;
  signal rAccumProduct0_n_103 : STD_LOGIC;
  signal rAccumProduct0_n_104 : STD_LOGIC;
  signal rAccumProduct0_n_105 : STD_LOGIC;
  signal rAccumProduct0_n_106 : STD_LOGIC;
  signal rAccumProduct0_n_107 : STD_LOGIC;
  signal rAccumProduct0_n_108 : STD_LOGIC;
  signal rAccumProduct0_n_109 : STD_LOGIC;
  signal rAccumProduct0_n_110 : STD_LOGIC;
  signal rAccumProduct0_n_111 : STD_LOGIC;
  signal rAccumProduct0_n_112 : STD_LOGIC;
  signal rAccumProduct0_n_113 : STD_LOGIC;
  signal rAccumProduct0_n_114 : STD_LOGIC;
  signal rAccumProduct0_n_115 : STD_LOGIC;
  signal rAccumProduct0_n_116 : STD_LOGIC;
  signal rAccumProduct0_n_117 : STD_LOGIC;
  signal rAccumProduct0_n_118 : STD_LOGIC;
  signal rAccumProduct0_n_119 : STD_LOGIC;
  signal rAccumProduct0_n_120 : STD_LOGIC;
  signal rAccumProduct0_n_121 : STD_LOGIC;
  signal rAccumProduct0_n_122 : STD_LOGIC;
  signal rAccumProduct0_n_123 : STD_LOGIC;
  signal rAccumProduct0_n_124 : STD_LOGIC;
  signal rAccumProduct0_n_125 : STD_LOGIC;
  signal rAccumProduct0_n_126 : STD_LOGIC;
  signal rAccumProduct0_n_127 : STD_LOGIC;
  signal rAccumProduct0_n_128 : STD_LOGIC;
  signal rAccumProduct0_n_129 : STD_LOGIC;
  signal rAccumProduct0_n_130 : STD_LOGIC;
  signal rAccumProduct0_n_131 : STD_LOGIC;
  signal rAccumProduct0_n_132 : STD_LOGIC;
  signal rAccumProduct0_n_133 : STD_LOGIC;
  signal rAccumProduct0_n_134 : STD_LOGIC;
  signal rAccumProduct0_n_135 : STD_LOGIC;
  signal rAccumProduct0_n_136 : STD_LOGIC;
  signal rAccumProduct0_n_137 : STD_LOGIC;
  signal rAccumProduct0_n_138 : STD_LOGIC;
  signal rAccumProduct0_n_139 : STD_LOGIC;
  signal rAccumProduct0_n_140 : STD_LOGIC;
  signal rAccumProduct0_n_141 : STD_LOGIC;
  signal rAccumProduct0_n_142 : STD_LOGIC;
  signal rAccumProduct0_n_143 : STD_LOGIC;
  signal rAccumProduct0_n_144 : STD_LOGIC;
  signal rAccumProduct0_n_145 : STD_LOGIC;
  signal rAccumProduct0_n_146 : STD_LOGIC;
  signal rAccumProduct0_n_147 : STD_LOGIC;
  signal rAccumProduct0_n_148 : STD_LOGIC;
  signal rAccumProduct0_n_149 : STD_LOGIC;
  signal rAccumProduct0_n_150 : STD_LOGIC;
  signal rAccumProduct0_n_151 : STD_LOGIC;
  signal rAccumProduct0_n_152 : STD_LOGIC;
  signal rAccumProduct0_n_153 : STD_LOGIC;
  signal rAccumProduct0_n_58 : STD_LOGIC;
  signal rAccumProduct0_n_59 : STD_LOGIC;
  signal rAccumProduct0_n_60 : STD_LOGIC;
  signal rAccumProduct0_n_61 : STD_LOGIC;
  signal rAccumProduct0_n_62 : STD_LOGIC;
  signal rAccumProduct0_n_63 : STD_LOGIC;
  signal rAccumProduct0_n_64 : STD_LOGIC;
  signal rAccumProduct0_n_65 : STD_LOGIC;
  signal rAccumProduct0_n_66 : STD_LOGIC;
  signal rAccumProduct0_n_67 : STD_LOGIC;
  signal rAccumProduct0_n_68 : STD_LOGIC;
  signal rAccumProduct0_n_69 : STD_LOGIC;
  signal rAccumProduct0_n_70 : STD_LOGIC;
  signal rAccumProduct0_n_71 : STD_LOGIC;
  signal rAccumProduct0_n_72 : STD_LOGIC;
  signal rAccumProduct0_n_73 : STD_LOGIC;
  signal rAccumProduct0_n_74 : STD_LOGIC;
  signal rAccumProduct0_n_75 : STD_LOGIC;
  signal rAccumProduct0_n_76 : STD_LOGIC;
  signal rAccumProduct0_n_77 : STD_LOGIC;
  signal rAccumProduct0_n_78 : STD_LOGIC;
  signal rAccumProduct0_n_79 : STD_LOGIC;
  signal rAccumProduct0_n_80 : STD_LOGIC;
  signal rAccumProduct0_n_81 : STD_LOGIC;
  signal rAccumProduct0_n_82 : STD_LOGIC;
  signal rAccumProduct0_n_83 : STD_LOGIC;
  signal rAccumProduct0_n_84 : STD_LOGIC;
  signal rAccumProduct0_n_85 : STD_LOGIC;
  signal rAccumProduct0_n_86 : STD_LOGIC;
  signal rAccumProduct0_n_87 : STD_LOGIC;
  signal rAccumProduct0_n_88 : STD_LOGIC;
  signal rAccumProduct0_n_89 : STD_LOGIC;
  signal rAccumProduct0_n_90 : STD_LOGIC;
  signal rAccumProduct0_n_91 : STD_LOGIC;
  signal rAccumProduct0_n_92 : STD_LOGIC;
  signal rAccumProduct0_n_93 : STD_LOGIC;
  signal rAccumProduct0_n_94 : STD_LOGIC;
  signal rAccumProduct0_n_95 : STD_LOGIC;
  signal rAccumProduct0_n_96 : STD_LOGIC;
  signal rAccumProduct0_n_97 : STD_LOGIC;
  signal rAccumProduct0_n_98 : STD_LOGIC;
  signal rAccumProduct0_n_99 : STD_LOGIC;
  signal \rAccumProduct_reg[16]__0_n_0\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_100\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_101\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_102\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_103\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_104\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_105\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_58\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_59\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_60\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_61\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_62\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_63\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_64\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_65\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_66\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_67\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_68\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_69\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_70\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_71\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_72\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_73\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_74\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_75\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_76\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_77\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_78\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_79\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_80\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_81\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_82\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_83\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_84\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_85\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_86\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_87\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_88\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_89\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_90\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_91\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_92\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_93\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_94\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_95\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_96\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_97\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_98\ : STD_LOGIC;
  signal \rAccumProduct_reg__0_n_99\ : STD_LOGIC;
  signal \rAccumProduct_reg__1\ : STD_LOGIC_VECTOR ( 63 downto 48 );
  signal rAccumProduct_reg_i_1_n_1 : STD_LOGIC;
  signal rAccumProduct_reg_i_1_n_2 : STD_LOGIC;
  signal rAccumProduct_reg_i_1_n_3 : STD_LOGIC;
  signal rAccumProduct_reg_i_1_n_4 : STD_LOGIC;
  signal rAccumProduct_reg_i_1_n_5 : STD_LOGIC;
  signal rAccumProduct_reg_i_1_n_6 : STD_LOGIC;
  signal rAccumProduct_reg_i_1_n_7 : STD_LOGIC;
  signal rAccumProduct_reg_i_2_n_0 : STD_LOGIC;
  signal rAccumProduct_reg_i_3_n_0 : STD_LOGIC;
  signal rAccumProduct_reg_i_4_n_0 : STD_LOGIC;
  signal rAccumProduct_reg_i_5_n_0 : STD_LOGIC;
  signal rAccumProduct_reg_i_6_n_0 : STD_LOGIC;
  signal rAccumProduct_reg_i_7_n_0 : STD_LOGIC;
  signal rAccumProduct_reg_i_8_n_0 : STD_LOGIC;
  signal rAccumProduct_reg_i_9_n_0 : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[0]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[10]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[11]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[12]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[13]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[14]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[15]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[16]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[1]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[2]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[3]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[4]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[5]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[6]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[7]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[8]\ : STD_LOGIC;
  signal \rAccumProduct_reg_n_0_[9]\ : STD_LOGIC;
  signal rAccumProduct_reg_n_100 : STD_LOGIC;
  signal rAccumProduct_reg_n_101 : STD_LOGIC;
  signal rAccumProduct_reg_n_102 : STD_LOGIC;
  signal rAccumProduct_reg_n_103 : STD_LOGIC;
  signal rAccumProduct_reg_n_104 : STD_LOGIC;
  signal rAccumProduct_reg_n_105 : STD_LOGIC;
  signal rAccumProduct_reg_n_58 : STD_LOGIC;
  signal rAccumProduct_reg_n_59 : STD_LOGIC;
  signal rAccumProduct_reg_n_60 : STD_LOGIC;
  signal rAccumProduct_reg_n_61 : STD_LOGIC;
  signal rAccumProduct_reg_n_62 : STD_LOGIC;
  signal rAccumProduct_reg_n_63 : STD_LOGIC;
  signal rAccumProduct_reg_n_64 : STD_LOGIC;
  signal rAccumProduct_reg_n_65 : STD_LOGIC;
  signal rAccumProduct_reg_n_66 : STD_LOGIC;
  signal rAccumProduct_reg_n_67 : STD_LOGIC;
  signal rAccumProduct_reg_n_68 : STD_LOGIC;
  signal rAccumProduct_reg_n_69 : STD_LOGIC;
  signal rAccumProduct_reg_n_70 : STD_LOGIC;
  signal rAccumProduct_reg_n_71 : STD_LOGIC;
  signal rAccumProduct_reg_n_72 : STD_LOGIC;
  signal rAccumProduct_reg_n_73 : STD_LOGIC;
  signal rAccumProduct_reg_n_74 : STD_LOGIC;
  signal rAccumProduct_reg_n_75 : STD_LOGIC;
  signal rAccumProduct_reg_n_76 : STD_LOGIC;
  signal rAccumProduct_reg_n_77 : STD_LOGIC;
  signal rAccumProduct_reg_n_78 : STD_LOGIC;
  signal rAccumProduct_reg_n_79 : STD_LOGIC;
  signal rAccumProduct_reg_n_80 : STD_LOGIC;
  signal rAccumProduct_reg_n_81 : STD_LOGIC;
  signal rAccumProduct_reg_n_82 : STD_LOGIC;
  signal rAccumProduct_reg_n_83 : STD_LOGIC;
  signal rAccumProduct_reg_n_84 : STD_LOGIC;
  signal rAccumProduct_reg_n_85 : STD_LOGIC;
  signal rAccumProduct_reg_n_86 : STD_LOGIC;
  signal rAccumProduct_reg_n_87 : STD_LOGIC;
  signal rAccumProduct_reg_n_88 : STD_LOGIC;
  signal rAccumProduct_reg_n_89 : STD_LOGIC;
  signal rAccumProduct_reg_n_90 : STD_LOGIC;
  signal rAccumProduct_reg_n_91 : STD_LOGIC;
  signal rAccumProduct_reg_n_92 : STD_LOGIC;
  signal rAccumProduct_reg_n_93 : STD_LOGIC;
  signal rAccumProduct_reg_n_94 : STD_LOGIC;
  signal rAccumProduct_reg_n_95 : STD_LOGIC;
  signal rAccumProduct_reg_n_96 : STD_LOGIC;
  signal rAccumProduct_reg_n_97 : STD_LOGIC;
  signal rAccumProduct_reg_n_98 : STD_LOGIC;
  signal rAccumProduct_reg_n_99 : STD_LOGIC;
  signal \rAccum[15]_i_11_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_12_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_13_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_14_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_15_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_16_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_17_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_18_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_2_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_3_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_4_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_5_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_6_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_7_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_8_n_0\ : STD_LOGIC;
  signal \rAccum[15]_i_9_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_12_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_13_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_14_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_15_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_16_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_17_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_18_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_19_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_21_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_22_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_23_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_24_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_25_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_26_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_27_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_28_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_2_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_30_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_31_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_32_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_33_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_34_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_35_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_36_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_37_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_39_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_3_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_40_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_41_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_42_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_43_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_44_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_45_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_46_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_47_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_48_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_49_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_4_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_50_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_51_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_52_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_53_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_5_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_6_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_7_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_8_n_0\ : STD_LOGIC;
  signal \rAccum[7]_i_9_n_0\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_10_n_1\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_10_n_2\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_10_n_3\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_10_n_4\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_10_n_5\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_10_n_6\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_10_n_7\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_0\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_1\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_10\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_11\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_12\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_13\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_14\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_15\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_2\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_3\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_4\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_5\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_6\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_7\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_8\ : STD_LOGIC;
  signal \rAccum_reg[15]_i_1_n_9\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_0\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_1\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_10\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_11\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_12\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_13\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_14\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_15\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_2\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_3\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_4\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_5\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_6\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_7\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_8\ : STD_LOGIC;
  signal \rAccum_reg[23]_i_1_n_9\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_10\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_11\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_12\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_13\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_14\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_15\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_2\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_3\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_4\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_5\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_6\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_7\ : STD_LOGIC;
  signal \rAccum_reg[30]_i_2_n_9\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_10_n_0\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_10_n_1\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_10_n_2\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_10_n_3\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_10_n_4\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_10_n_5\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_10_n_6\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_10_n_7\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_11_n_0\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_11_n_1\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_11_n_2\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_11_n_3\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_11_n_4\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_11_n_5\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_11_n_6\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_11_n_7\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_1_n_0\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_1_n_1\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_1_n_2\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_1_n_3\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_1_n_4\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_1_n_5\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_1_n_6\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_1_n_7\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_1_n_8\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_1_n_9\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_20_n_0\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_20_n_1\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_20_n_2\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_20_n_3\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_20_n_4\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_20_n_5\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_20_n_6\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_20_n_7\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_29_n_0\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_29_n_1\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_29_n_2\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_29_n_3\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_29_n_4\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_29_n_5\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_29_n_6\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_29_n_7\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_38_n_0\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_38_n_1\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_38_n_2\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_38_n_3\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_38_n_4\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_38_n_5\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_38_n_6\ : STD_LOGIC;
  signal \rAccum_reg[7]_i_38_n_7\ : STD_LOGIC;
  signal rInitialGuess0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rInitialGuess00 : STD_LOGIC;
  signal rInitialGuess000_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \rInitialGuess00_inferred__0/i__carry__0_n_1\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry__0_n_2\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry__0_n_3\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry__0_n_4\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry__0_n_5\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry__0_n_6\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry__0_n_7\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry_n_4\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \rInitialGuess00_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal rInitialGuess1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rInitialGuess2 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rInitialGuess3 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \rProduct0__0\ : STD_LOGIC;
  signal rProduct0_n_100 : STD_LOGIC;
  signal rProduct0_n_101 : STD_LOGIC;
  signal rProduct0_n_102 : STD_LOGIC;
  signal rProduct0_n_103 : STD_LOGIC;
  signal rProduct0_n_104 : STD_LOGIC;
  signal rProduct0_n_105 : STD_LOGIC;
  signal rProduct0_n_106 : STD_LOGIC;
  signal rProduct0_n_107 : STD_LOGIC;
  signal rProduct0_n_108 : STD_LOGIC;
  signal rProduct0_n_109 : STD_LOGIC;
  signal rProduct0_n_110 : STD_LOGIC;
  signal rProduct0_n_111 : STD_LOGIC;
  signal rProduct0_n_112 : STD_LOGIC;
  signal rProduct0_n_113 : STD_LOGIC;
  signal rProduct0_n_114 : STD_LOGIC;
  signal rProduct0_n_115 : STD_LOGIC;
  signal rProduct0_n_116 : STD_LOGIC;
  signal rProduct0_n_117 : STD_LOGIC;
  signal rProduct0_n_118 : STD_LOGIC;
  signal rProduct0_n_119 : STD_LOGIC;
  signal rProduct0_n_120 : STD_LOGIC;
  signal rProduct0_n_121 : STD_LOGIC;
  signal rProduct0_n_122 : STD_LOGIC;
  signal rProduct0_n_123 : STD_LOGIC;
  signal rProduct0_n_124 : STD_LOGIC;
  signal rProduct0_n_125 : STD_LOGIC;
  signal rProduct0_n_126 : STD_LOGIC;
  signal rProduct0_n_127 : STD_LOGIC;
  signal rProduct0_n_128 : STD_LOGIC;
  signal rProduct0_n_129 : STD_LOGIC;
  signal rProduct0_n_130 : STD_LOGIC;
  signal rProduct0_n_131 : STD_LOGIC;
  signal rProduct0_n_132 : STD_LOGIC;
  signal rProduct0_n_133 : STD_LOGIC;
  signal rProduct0_n_134 : STD_LOGIC;
  signal rProduct0_n_135 : STD_LOGIC;
  signal rProduct0_n_136 : STD_LOGIC;
  signal rProduct0_n_137 : STD_LOGIC;
  signal rProduct0_n_138 : STD_LOGIC;
  signal rProduct0_n_139 : STD_LOGIC;
  signal rProduct0_n_140 : STD_LOGIC;
  signal rProduct0_n_141 : STD_LOGIC;
  signal rProduct0_n_142 : STD_LOGIC;
  signal rProduct0_n_143 : STD_LOGIC;
  signal rProduct0_n_144 : STD_LOGIC;
  signal rProduct0_n_145 : STD_LOGIC;
  signal rProduct0_n_146 : STD_LOGIC;
  signal rProduct0_n_147 : STD_LOGIC;
  signal rProduct0_n_148 : STD_LOGIC;
  signal rProduct0_n_149 : STD_LOGIC;
  signal rProduct0_n_150 : STD_LOGIC;
  signal rProduct0_n_151 : STD_LOGIC;
  signal rProduct0_n_152 : STD_LOGIC;
  signal rProduct0_n_153 : STD_LOGIC;
  signal rProduct0_n_58 : STD_LOGIC;
  signal rProduct0_n_59 : STD_LOGIC;
  signal rProduct0_n_60 : STD_LOGIC;
  signal rProduct0_n_61 : STD_LOGIC;
  signal rProduct0_n_62 : STD_LOGIC;
  signal rProduct0_n_63 : STD_LOGIC;
  signal rProduct0_n_64 : STD_LOGIC;
  signal rProduct0_n_65 : STD_LOGIC;
  signal rProduct0_n_66 : STD_LOGIC;
  signal rProduct0_n_67 : STD_LOGIC;
  signal rProduct0_n_68 : STD_LOGIC;
  signal rProduct0_n_69 : STD_LOGIC;
  signal rProduct0_n_70 : STD_LOGIC;
  signal rProduct0_n_71 : STD_LOGIC;
  signal rProduct0_n_72 : STD_LOGIC;
  signal rProduct0_n_73 : STD_LOGIC;
  signal rProduct0_n_74 : STD_LOGIC;
  signal rProduct0_n_75 : STD_LOGIC;
  signal rProduct0_n_76 : STD_LOGIC;
  signal rProduct0_n_77 : STD_LOGIC;
  signal rProduct0_n_78 : STD_LOGIC;
  signal rProduct0_n_79 : STD_LOGIC;
  signal rProduct0_n_80 : STD_LOGIC;
  signal rProduct0_n_81 : STD_LOGIC;
  signal rProduct0_n_82 : STD_LOGIC;
  signal rProduct0_n_83 : STD_LOGIC;
  signal rProduct0_n_84 : STD_LOGIC;
  signal rProduct0_n_85 : STD_LOGIC;
  signal rProduct0_n_86 : STD_LOGIC;
  signal rProduct0_n_87 : STD_LOGIC;
  signal rProduct0_n_88 : STD_LOGIC;
  signal rProduct0_n_89 : STD_LOGIC;
  signal rProduct0_n_90 : STD_LOGIC;
  signal rProduct0_n_91 : STD_LOGIC;
  signal rProduct0_n_92 : STD_LOGIC;
  signal rProduct0_n_93 : STD_LOGIC;
  signal rProduct0_n_94 : STD_LOGIC;
  signal rProduct0_n_95 : STD_LOGIC;
  signal rProduct0_n_96 : STD_LOGIC;
  signal rProduct0_n_97 : STD_LOGIC;
  signal rProduct0_n_98 : STD_LOGIC;
  signal rProduct0_n_99 : STD_LOGIC;
  signal \rProduct_reg__0\ : STD_LOGIC_VECTOR ( 47 downto 24 );
  signal rProduct_reg_n_100 : STD_LOGIC;
  signal rProduct_reg_n_101 : STD_LOGIC;
  signal rProduct_reg_n_102 : STD_LOGIC;
  signal rProduct_reg_n_103 : STD_LOGIC;
  signal rProduct_reg_n_104 : STD_LOGIC;
  signal rProduct_reg_n_105 : STD_LOGIC;
  signal rProduct_reg_n_58 : STD_LOGIC;
  signal rProduct_reg_n_59 : STD_LOGIC;
  signal rProduct_reg_n_60 : STD_LOGIC;
  signal rProduct_reg_n_61 : STD_LOGIC;
  signal rProduct_reg_n_62 : STD_LOGIC;
  signal rProduct_reg_n_63 : STD_LOGIC;
  signal rProduct_reg_n_64 : STD_LOGIC;
  signal rProduct_reg_n_65 : STD_LOGIC;
  signal rProduct_reg_n_66 : STD_LOGIC;
  signal rProduct_reg_n_67 : STD_LOGIC;
  signal rProduct_reg_n_68 : STD_LOGIC;
  signal rProduct_reg_n_69 : STD_LOGIC;
  signal rProduct_reg_n_70 : STD_LOGIC;
  signal rProduct_reg_n_71 : STD_LOGIC;
  signal rProduct_reg_n_72 : STD_LOGIC;
  signal rProduct_reg_n_73 : STD_LOGIC;
  signal rProduct_reg_n_74 : STD_LOGIC;
  signal rProduct_reg_n_99 : STD_LOGIC;
  signal rRefined0 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal rRefined00 : STD_LOGIC;
  signal \rRefined0[22]_i_2_n_0\ : STD_LOGIC;
  signal \rRefined0[22]_i_3_n_0\ : STD_LOGIC;
  signal \rRefined0[22]_i_4_n_0\ : STD_LOGIC;
  signal \rRefined0[22]_i_5_n_0\ : STD_LOGIC;
  signal \rRefined0[22]_i_6_n_0\ : STD_LOGIC;
  signal \rRefined0[22]_i_7_n_0\ : STD_LOGIC;
  signal \rRefined0[22]_i_8_n_0\ : STD_LOGIC;
  signal \rRefined0[30]_i_2_n_0\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_0\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_1\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_10\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_11\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_12\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_13\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_14\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_15\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_2\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_3\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_4\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_5\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_6\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_7\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_8\ : STD_LOGIC;
  signal \rRefined0_reg[22]_i_1_n_9\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_0\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_1\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_10\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_11\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_12\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_13\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_14\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_15\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_2\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_3\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_4\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_5\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_6\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_7\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_8\ : STD_LOGIC;
  signal \rRefined0_reg[30]_i_1_n_9\ : STD_LOGIC;
  signal \rRefined0_reg[31]_i_2_n_15\ : STD_LOGIC;
  signal rRefined1 : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal \rRefined2_reg_n_0_[0]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[10]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[11]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[12]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[13]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[14]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[15]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[16]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[17]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[18]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[19]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[1]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[20]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[21]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[22]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[23]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[24]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[25]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[26]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[27]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[28]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[29]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[2]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[30]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[3]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[4]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[5]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[6]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[7]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[8]\ : STD_LOGIC;
  signal \rRefined2_reg_n_0_[9]\ : STD_LOGIC;
  signal rRefined3 : STD_LOGIC_VECTOR ( 30 downto 0 );
  signal rcpLookupOffset0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \rcpLookupOffset0[14]_i_1_n_0\ : STD_LOGIC;
  signal rcpLookupOffset1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal rcpLookupSlope0 : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][0]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][19]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][1]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][20]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][21]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_10_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_11_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_12_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_13_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_6_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_7_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_8_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][22]_i_9_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][calculatedMantissa][2]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][rcpExponent][0]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][rcpExponent][0]_i_2_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][rcpExponent][1]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][rcpExponent][2]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][rcpExponent][3]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][rcpExponent][4]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][rcpExponent][4]_i_2_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][rcpExponent][5]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][rcpExponent][5]_i_2_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][rcpExponent][6]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][rcpExponent][7]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline[0][useEarlyOutBypass]_i_1_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[0][calculatedMantissa]\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \rcpPipeline_reg[0][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[0][rcpExponent]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \rcpPipeline_reg[0][rcpSign]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[0][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal \rcpPipeline_reg[10][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[10][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][0]_srl10_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][10]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][11]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][12]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][13]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][14]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][15]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][16]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][17]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][18]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][19]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][1]_srl10_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][20]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][21]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][22]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][2]_srl10_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][3]_srl10_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][4]_srl10_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][5]_srl10_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][6]_srl10_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][7]_srl10_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][8]_srl10_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][calculatedMantissa][9]_srl8_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[11][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal \rcpPipeline_reg[12][calculatedMantissa]\ : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal \rcpPipeline_reg[12][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[12][rcpExponent]\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \rcpPipeline_reg[12][rcpSign]\ : STD_LOGIC;
  signal \rcpPipeline_reg[12][useEarlyOutBypass]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[1][calculatedMantissa]\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \rcpPipeline_reg[1][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[1][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][10]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][11]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][12]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][13]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][14]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][15]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][16]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][17]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][18]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][19]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][20]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][21]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][22]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][calculatedMantissa][9]_srl2_n_0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[2][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal \rcpPipeline_reg[3][calculatedMantissa]\ : STD_LOGIC_VECTOR ( 22 downto 9 );
  signal \rcpPipeline_reg[3][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[3][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal \rcpPipeline_reg[4][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[4][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal \rcpPipeline_reg[5][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[5][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal \rcpPipeline_reg[6][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[6][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal \rcpPipeline_reg[7][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[7][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal \rcpPipeline_reg[8][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[8][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal \rcpPipeline_reg[9][pipeStageIsValid]__0\ : STD_LOGIC;
  signal \rcpPipeline_reg[9][useEarlyOutBypass_n_0_]\ : STD_LOGIC;
  signal rcpSigma00 : STD_LOGIC;
  signal rcpSqrSigma00 : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_100\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_101\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_102\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_103\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_104\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_105\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_106\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_107\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_108\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_109\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_110\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_111\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_112\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_113\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_114\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_115\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_116\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_117\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_118\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_119\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_120\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_121\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_122\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_123\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_124\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_125\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_126\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_127\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_128\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_129\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_130\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_131\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_132\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_133\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_134\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_135\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_136\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_137\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_138\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_139\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_140\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_141\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_142\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_143\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_144\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_145\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_146\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_147\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_148\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_149\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_150\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_151\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_152\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_153\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_58\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_59\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_60\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_61\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_62\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_63\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_64\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_65\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_66\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_67\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_68\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_69\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_70\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_71\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_72\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_73\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_74\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_75\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_76\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_77\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_78\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_79\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_80\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_81\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_82\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_83\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_84\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_85\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_86\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_87\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_88\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_89\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_90\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_91\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_92\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_93\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_94\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_95\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_96\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_97\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_98\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__0_n_99\ : STD_LOGIC;
  signal \rcpSqrSigma0Product0__1\ : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_100 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_101 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_102 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_103 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_104 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_105 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_106 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_107 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_108 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_109 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_110 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_111 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_112 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_113 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_114 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_115 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_116 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_117 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_118 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_119 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_120 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_121 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_122 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_123 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_124 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_125 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_126 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_127 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_128 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_129 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_130 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_131 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_132 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_133 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_134 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_135 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_136 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_137 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_138 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_139 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_140 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_141 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_142 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_143 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_144 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_145 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_146 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_147 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_148 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_149 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_150 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_151 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_152 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_153 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_58 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_59 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_60 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_61 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_62 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_63 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_64 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_65 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_66 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_67 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_68 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_69 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_70 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_71 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_72 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_73 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_74 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_75 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_76 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_77 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_78 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_79 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_80 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_81 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_82 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_83 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_84 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_85 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_86 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_87 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_88 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_89 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_90 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_91 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_92 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_93 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_94 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_95 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_96 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_97 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_98 : STD_LOGIC;
  signal rcpSqrSigma0Product0_n_99 : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg[16]__0_n_0\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_100\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_101\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_102\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_103\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_104\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_105\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_58\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_59\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_60\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_61\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_62\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_63\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_64\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_65\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_66\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_67\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_68\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_69\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_70\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_71\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_72\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_73\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_74\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_75\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_76\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_77\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_78\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_79\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_80\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_81\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_82\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_83\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_84\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_85\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_86\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_87\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_88\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_89\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_90\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_91\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_92\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_93\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_94\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_95\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_96\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_97\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_98\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__0_n_99\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg__1\ : STD_LOGIC_VECTOR ( 63 downto 32 );
  signal \rcpSqrSigma0Product_reg_n_0_[0]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[10]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[11]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[12]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[13]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[14]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[15]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[16]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[1]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[2]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[3]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[4]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[5]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[6]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[7]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[8]\ : STD_LOGIC;
  signal \rcpSqrSigma0Product_reg_n_0_[9]\ : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_100 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_101 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_102 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_103 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_104 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_105 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_58 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_59 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_60 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_61 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_62 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_63 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_64 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_65 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_66 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_67 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_68 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_69 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_70 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_71 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_72 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_73 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_74 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_75 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_76 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_77 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_78 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_79 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_80 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_81 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_82 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_83 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_84 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_85 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_86 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_87 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_88 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_89 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_90 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_91 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_92 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_93 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_94 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_95 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_96 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_97 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_98 : STD_LOGIC;
  signal rcpSqrSigma0Product_reg_n_99 : STD_LOGIC;
  signal resultMantissa : STD_LOGIC_VECTOR ( 22 downto 0 );
  signal resultMantissa0 : STD_LOGIC;
  signal \resultMantissa[5]_i_2_n_0\ : STD_LOGIC;
  signal \resultMantissa_reg[13]_i_1_n_0\ : STD_LOGIC;
  signal \resultMantissa_reg[13]_i_1_n_1\ : STD_LOGIC;
  signal \resultMantissa_reg[13]_i_1_n_2\ : STD_LOGIC;
  signal \resultMantissa_reg[13]_i_1_n_3\ : STD_LOGIC;
  signal \resultMantissa_reg[13]_i_1_n_4\ : STD_LOGIC;
  signal \resultMantissa_reg[13]_i_1_n_5\ : STD_LOGIC;
  signal \resultMantissa_reg[13]_i_1_n_6\ : STD_LOGIC;
  signal \resultMantissa_reg[13]_i_1_n_7\ : STD_LOGIC;
  signal \resultMantissa_reg[21]_i_1_n_0\ : STD_LOGIC;
  signal \resultMantissa_reg[21]_i_1_n_1\ : STD_LOGIC;
  signal \resultMantissa_reg[21]_i_1_n_2\ : STD_LOGIC;
  signal \resultMantissa_reg[21]_i_1_n_3\ : STD_LOGIC;
  signal \resultMantissa_reg[21]_i_1_n_4\ : STD_LOGIC;
  signal \resultMantissa_reg[21]_i_1_n_5\ : STD_LOGIC;
  signal \resultMantissa_reg[21]_i_1_n_6\ : STD_LOGIC;
  signal \resultMantissa_reg[21]_i_1_n_7\ : STD_LOGIC;
  signal \resultMantissa_reg[5]_i_1_n_0\ : STD_LOGIC;
  signal \resultMantissa_reg[5]_i_1_n_1\ : STD_LOGIC;
  signal \resultMantissa_reg[5]_i_1_n_2\ : STD_LOGIC;
  signal \resultMantissa_reg[5]_i_1_n_3\ : STD_LOGIC;
  signal \resultMantissa_reg[5]_i_1_n_4\ : STD_LOGIC;
  signal \resultMantissa_reg[5]_i_1_n_5\ : STD_LOGIC;
  signal \resultMantissa_reg[5]_i_1_n_6\ : STD_LOGIC;
  signal \resultMantissa_reg[5]_i_1_n_7\ : STD_LOGIC;
  signal \sigma0TempProduct0__0\ : STD_LOGIC;
  signal sigma0TempProduct0_n_100 : STD_LOGIC;
  signal sigma0TempProduct0_n_101 : STD_LOGIC;
  signal sigma0TempProduct0_n_102 : STD_LOGIC;
  signal sigma0TempProduct0_n_103 : STD_LOGIC;
  signal sigma0TempProduct0_n_104 : STD_LOGIC;
  signal sigma0TempProduct0_n_105 : STD_LOGIC;
  signal sigma0TempProduct0_n_106 : STD_LOGIC;
  signal sigma0TempProduct0_n_107 : STD_LOGIC;
  signal sigma0TempProduct0_n_108 : STD_LOGIC;
  signal sigma0TempProduct0_n_109 : STD_LOGIC;
  signal sigma0TempProduct0_n_110 : STD_LOGIC;
  signal sigma0TempProduct0_n_111 : STD_LOGIC;
  signal sigma0TempProduct0_n_112 : STD_LOGIC;
  signal sigma0TempProduct0_n_113 : STD_LOGIC;
  signal sigma0TempProduct0_n_114 : STD_LOGIC;
  signal sigma0TempProduct0_n_115 : STD_LOGIC;
  signal sigma0TempProduct0_n_116 : STD_LOGIC;
  signal sigma0TempProduct0_n_117 : STD_LOGIC;
  signal sigma0TempProduct0_n_118 : STD_LOGIC;
  signal sigma0TempProduct0_n_119 : STD_LOGIC;
  signal sigma0TempProduct0_n_120 : STD_LOGIC;
  signal sigma0TempProduct0_n_121 : STD_LOGIC;
  signal sigma0TempProduct0_n_122 : STD_LOGIC;
  signal sigma0TempProduct0_n_123 : STD_LOGIC;
  signal sigma0TempProduct0_n_124 : STD_LOGIC;
  signal sigma0TempProduct0_n_125 : STD_LOGIC;
  signal sigma0TempProduct0_n_126 : STD_LOGIC;
  signal sigma0TempProduct0_n_127 : STD_LOGIC;
  signal sigma0TempProduct0_n_128 : STD_LOGIC;
  signal sigma0TempProduct0_n_129 : STD_LOGIC;
  signal sigma0TempProduct0_n_130 : STD_LOGIC;
  signal sigma0TempProduct0_n_131 : STD_LOGIC;
  signal sigma0TempProduct0_n_132 : STD_LOGIC;
  signal sigma0TempProduct0_n_133 : STD_LOGIC;
  signal sigma0TempProduct0_n_134 : STD_LOGIC;
  signal sigma0TempProduct0_n_135 : STD_LOGIC;
  signal sigma0TempProduct0_n_136 : STD_LOGIC;
  signal sigma0TempProduct0_n_137 : STD_LOGIC;
  signal sigma0TempProduct0_n_138 : STD_LOGIC;
  signal sigma0TempProduct0_n_139 : STD_LOGIC;
  signal sigma0TempProduct0_n_140 : STD_LOGIC;
  signal sigma0TempProduct0_n_141 : STD_LOGIC;
  signal sigma0TempProduct0_n_142 : STD_LOGIC;
  signal sigma0TempProduct0_n_143 : STD_LOGIC;
  signal sigma0TempProduct0_n_144 : STD_LOGIC;
  signal sigma0TempProduct0_n_145 : STD_LOGIC;
  signal sigma0TempProduct0_n_146 : STD_LOGIC;
  signal sigma0TempProduct0_n_147 : STD_LOGIC;
  signal sigma0TempProduct0_n_148 : STD_LOGIC;
  signal sigma0TempProduct0_n_149 : STD_LOGIC;
  signal sigma0TempProduct0_n_150 : STD_LOGIC;
  signal sigma0TempProduct0_n_151 : STD_LOGIC;
  signal sigma0TempProduct0_n_152 : STD_LOGIC;
  signal sigma0TempProduct0_n_153 : STD_LOGIC;
  signal sigma0TempProduct0_n_58 : STD_LOGIC;
  signal sigma0TempProduct0_n_59 : STD_LOGIC;
  signal sigma0TempProduct0_n_60 : STD_LOGIC;
  signal sigma0TempProduct0_n_61 : STD_LOGIC;
  signal sigma0TempProduct0_n_62 : STD_LOGIC;
  signal sigma0TempProduct0_n_63 : STD_LOGIC;
  signal sigma0TempProduct0_n_64 : STD_LOGIC;
  signal sigma0TempProduct0_n_65 : STD_LOGIC;
  signal sigma0TempProduct0_n_66 : STD_LOGIC;
  signal sigma0TempProduct0_n_67 : STD_LOGIC;
  signal sigma0TempProduct0_n_68 : STD_LOGIC;
  signal sigma0TempProduct0_n_69 : STD_LOGIC;
  signal sigma0TempProduct0_n_70 : STD_LOGIC;
  signal sigma0TempProduct0_n_71 : STD_LOGIC;
  signal sigma0TempProduct0_n_72 : STD_LOGIC;
  signal sigma0TempProduct0_n_73 : STD_LOGIC;
  signal sigma0TempProduct0_n_74 : STD_LOGIC;
  signal sigma0TempProduct0_n_75 : STD_LOGIC;
  signal sigma0TempProduct0_n_76 : STD_LOGIC;
  signal sigma0TempProduct0_n_77 : STD_LOGIC;
  signal sigma0TempProduct0_n_78 : STD_LOGIC;
  signal sigma0TempProduct0_n_79 : STD_LOGIC;
  signal sigma0TempProduct0_n_80 : STD_LOGIC;
  signal sigma0TempProduct0_n_81 : STD_LOGIC;
  signal sigma0TempProduct0_n_82 : STD_LOGIC;
  signal sigma0TempProduct0_n_83 : STD_LOGIC;
  signal sigma0TempProduct0_n_84 : STD_LOGIC;
  signal sigma0TempProduct0_n_85 : STD_LOGIC;
  signal sigma0TempProduct0_n_86 : STD_LOGIC;
  signal sigma0TempProduct0_n_87 : STD_LOGIC;
  signal sigma0TempProduct0_n_88 : STD_LOGIC;
  signal sigma0TempProduct0_n_89 : STD_LOGIC;
  signal sigma0TempProduct0_n_90 : STD_LOGIC;
  signal sigma0TempProduct0_n_91 : STD_LOGIC;
  signal sigma0TempProduct0_n_92 : STD_LOGIC;
  signal sigma0TempProduct0_n_93 : STD_LOGIC;
  signal sigma0TempProduct0_n_94 : STD_LOGIC;
  signal sigma0TempProduct0_n_95 : STD_LOGIC;
  signal sigma0TempProduct0_n_96 : STD_LOGIC;
  signal sigma0TempProduct0_n_97 : STD_LOGIC;
  signal sigma0TempProduct0_n_98 : STD_LOGIC;
  signal sigma0TempProduct0_n_99 : STD_LOGIC;
  signal \sigma0TempProduct_reg_n_0_[10]\ : STD_LOGIC;
  signal \sigma0TempProduct_reg_n_0_[11]\ : STD_LOGIC;
  signal \sigma0TempProduct_reg_n_0_[12]\ : STD_LOGIC;
  signal \sigma0TempProduct_reg_n_0_[13]\ : STD_LOGIC;
  signal \sigma0TempProduct_reg_n_0_[14]\ : STD_LOGIC;
  signal \sigma0TempProduct_reg_n_0_[15]\ : STD_LOGIC;
  signal \sigma0TempProduct_reg_n_0_[16]\ : STD_LOGIC;
  signal \sigma0TempProduct_reg_n_0_[7]\ : STD_LOGIC;
  signal \sigma0TempProduct_reg_n_0_[8]\ : STD_LOGIC;
  signal \sigma0TempProduct_reg_n_0_[9]\ : STD_LOGIC;
  signal sigma0TempProduct_reg_n_100 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_101 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_102 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_103 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_104 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_105 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_58 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_59 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_60 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_61 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_62 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_63 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_64 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_65 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_66 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_67 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_68 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_69 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_70 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_71 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_72 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_73 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_74 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_75 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_76 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_77 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_78 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_79 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_80 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_81 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_82 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_83 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_84 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_85 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_86 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_87 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_88 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_89 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_90 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_91 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_92 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_93 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_94 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_95 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_96 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_97 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_98 : STD_LOGIC;
  signal sigma0TempProduct_reg_n_99 : STD_LOGIC;
  signal slopeMultiply0 : STD_LOGIC;
  signal \slopeMultiply_reg__15\ : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal slopeMultiply_reg_i_10_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_11_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_12_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_13_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_14_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_15_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_16_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_17_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_18_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_19_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_3_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_4_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_5_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_6_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_7_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_8_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_i_9_n_0 : STD_LOGIC;
  signal slopeMultiply_reg_n_100 : STD_LOGIC;
  signal slopeMultiply_reg_n_101 : STD_LOGIC;
  signal slopeMultiply_reg_n_102 : STD_LOGIC;
  signal slopeMultiply_reg_n_103 : STD_LOGIC;
  signal slopeMultiply_reg_n_104 : STD_LOGIC;
  signal slopeMultiply_reg_n_105 : STD_LOGIC;
  signal slopeMultiply_reg_n_74 : STD_LOGIC;
  signal slopeMultiply_reg_n_75 : STD_LOGIC;
  signal slopeMultiply_reg_n_76 : STD_LOGIC;
  signal slopeMultiply_reg_n_77 : STD_LOGIC;
  signal slopeMultiply_reg_n_78 : STD_LOGIC;
  signal slopeMultiply_reg_n_79 : STD_LOGIC;
  signal slopeMultiply_reg_n_80 : STD_LOGIC;
  signal slopeMultiply_reg_n_81 : STD_LOGIC;
  signal slopeMultiply_reg_n_82 : STD_LOGIC;
  signal slopeMultiply_reg_n_83 : STD_LOGIC;
  signal slopeMultiply_reg_n_84 : STD_LOGIC;
  signal slopeMultiply_reg_n_85 : STD_LOGIC;
  signal slopeMultiply_reg_n_86 : STD_LOGIC;
  signal slopeMultiply_reg_n_87 : STD_LOGIC;
  signal slopeMultiply_reg_n_88 : STD_LOGIC;
  signal slopeMultiply_reg_n_89 : STD_LOGIC;
  signal slopeMultiply_reg_n_90 : STD_LOGIC;
  signal slopeMultiply_reg_n_91 : STD_LOGIC;
  signal slopeMultiply_reg_n_92 : STD_LOGIC;
  signal slopeMultiply_reg_n_93 : STD_LOGIC;
  signal slopeMultiply_reg_n_94 : STD_LOGIC;
  signal slopeMultiply_reg_n_95 : STD_LOGIC;
  signal slopeMultiply_reg_n_96 : STD_LOGIC;
  signal slopeMultiply_reg_n_97 : STD_LOGIC;
  signal slopeMultiply_reg_n_98 : STD_LOGIC;
  signal slopeMultiply_reg_n_99 : STD_LOGIC;
  signal NLW_rAccumProduct0_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct0_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct0_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct0_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct0_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct0_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct0_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_rAccumProduct0_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_rAccumProduct0_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_rAccumProduct0_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_rAccumProduct0__0_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct0__0_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct0__0_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct0__0_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct0__0_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct0__0_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct0__0_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_rAccumProduct0__0_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_rAccumProduct0__0_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_rAccumProduct0__0_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_rAccumProduct0_i_21_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_rAccumProduct0_i_30_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_rAccumProduct_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rAccumProduct_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_rAccumProduct_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_rAccumProduct_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_rAccumProduct_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_rAccumProduct_reg_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_rAccumProduct_reg__0_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct_reg__0_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct_reg__0_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct_reg__0_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct_reg__0_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct_reg__0_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rAccumProduct_reg__0_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_rAccumProduct_reg__0_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_rAccumProduct_reg__0_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_rAccumProduct_reg__0_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_rAccumProduct_reg__0_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_rAccumProduct_reg_i_1_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_rAccum_reg[15]_i_10_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_rAccum_reg[30]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 6 );
  signal \NLW_rAccum_reg[30]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal \NLW_rAccum_reg[7]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \NLW_rAccum_reg[7]_i_11_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_rAccum_reg[7]_i_20_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_rAccum_reg[7]_i_29_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_rAccum_reg[7]_i_38_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_rInitialGuess00_inferred__0/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 to 7 );
  signal NLW_rProduct0_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct0_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct0_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct0_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct0_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct0_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct0_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_rProduct0_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_rProduct0_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_rProduct0_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_rProduct_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rProduct_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_rProduct_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_rProduct_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_rProduct_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_rProduct_reg_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_rRefined0_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_rRefined0_reg[31]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal NLW_rcpSqrSigma0Product0_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product0_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product0_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product0_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product0_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product0_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product0_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_rcpSqrSigma0Product0_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_rcpSqrSigma0Product0_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_rcpSqrSigma0Product0_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_rcpSqrSigma0Product0__0_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product0__0_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product0__0_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product0__0_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product0__0_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product0__0_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product0__0_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_rcpSqrSigma0Product0__0_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_rcpSqrSigma0Product0__0_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_rcpSqrSigma0Product0__0_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_rcpSqrSigma0Product_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_rcpSqrSigma0Product_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_rcpSqrSigma0Product_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_rcpSqrSigma0Product_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_rcpSqrSigma0Product_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_rcpSqrSigma0Product_reg_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_rcpSqrSigma0Product_reg__0_CARRYCASCOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product_reg__0_MULTSIGNOUT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product_reg__0_OVERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product_reg__0_PATTERNBDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product_reg__0_PATTERNDETECT_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product_reg__0_UNDERFLOW_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_rcpSqrSigma0Product_reg__0_ACOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal \NLW_rcpSqrSigma0Product_reg__0_BCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \NLW_rcpSqrSigma0Product_reg__0_CARRYOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_rcpSqrSigma0Product_reg__0_PCOUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal \NLW_rcpSqrSigma0Product_reg__0_XOROUT_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_resultMantissa_reg[22]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_resultMantissa_reg[22]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_resultMantissa_reg[5]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_sigma0TempProduct0_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct0_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct0_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct0_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct0_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct0_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct0_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_sigma0TempProduct0_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_sigma0TempProduct0_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_sigma0TempProduct0_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_sigma0TempProduct_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_sigma0TempProduct_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_sigma0TempProduct_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_sigma0TempProduct_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_sigma0TempProduct_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_sigma0TempProduct_reg_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_slopeMultiply_reg_CARRYCASCOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_slopeMultiply_reg_MULTSIGNOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_slopeMultiply_reg_OVERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_slopeMultiply_reg_PATTERNBDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_slopeMultiply_reg_PATTERNDETECT_UNCONNECTED : STD_LOGIC;
  signal NLW_slopeMultiply_reg_UNDERFLOW_UNCONNECTED : STD_LOGIC;
  signal NLW_slopeMultiply_reg_ACOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 29 downto 0 );
  signal NLW_slopeMultiply_reg_BCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal NLW_slopeMultiply_reg_CARRYOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_slopeMultiply_reg_P_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 32 );
  signal NLW_slopeMultiply_reg_PCOUT_UNCONNECTED : STD_LOGIC_VECTOR ( 47 downto 0 );
  signal NLW_slopeMultiply_reg_XOROUT_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \OSPEC[0]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \OSPEC[10]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \OSPEC[11]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \OSPEC[12]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \OSPEC[13]_i_1\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \OSPEC[14]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \OSPEC[15]_i_1\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \OSPEC[16]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \OSPEC[17]_i_1\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \OSPEC[18]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \OSPEC[19]_i_1\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \OSPEC[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \OSPEC[20]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \OSPEC[21]_i_1\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \OSPEC[2]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \OSPEC[3]_i_1\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \OSPEC[4]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \OSPEC[5]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \OSPEC[6]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \OSPEC[7]_i_1\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \OSPEC[8]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \OSPEC[9]_i_1\ : label is "soft_lutpair21";
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of rAccumProduct0 : label is "YES";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of rAccumProduct0 : label is "{SYNTH-10 {cell *THIS*} {string 16x18 4}}";
  attribute KEEP_HIERARCHY of \rAccumProduct0__0\ : label is "YES";
  attribute METHODOLOGY_DRC_VIOS of \rAccumProduct0__0\ : label is "{SYNTH-10 {cell *THIS*} {string 18x18 4}}";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of rAccumProduct0_i_2 : label is 35;
  attribute ADDER_THRESHOLD of rAccumProduct0_i_21 : label is 35;
  attribute ADDER_THRESHOLD of rAccumProduct0_i_3 : label is 35;
  attribute ADDER_THRESHOLD of rAccumProduct0_i_30 : label is 35;
  attribute ADDER_THRESHOLD of rAccumProduct0_i_4 : label is 35;
  attribute KEEP_HIERARCHY of rAccumProduct_reg : label is "YES";
  attribute METHODOLOGY_DRC_VIOS of rAccumProduct_reg : label is "{SYNTH-10 {cell *THIS*} {string 16x16 4}}";
  attribute KEEP_HIERARCHY of \rAccumProduct_reg__0\ : label is "YES";
  attribute METHODOLOGY_DRC_VIOS of \rAccumProduct_reg__0\ : label is "{SYNTH-10 {cell *THIS*} {string 18x16 4}}";
  attribute ADDER_THRESHOLD of rAccumProduct_reg_i_1 : label is 35;
  attribute ADDER_THRESHOLD of \rAccum_reg[15]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \rAccum_reg[15]_i_10\ : label is 35;
  attribute ADDER_THRESHOLD of \rAccum_reg[23]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \rAccum_reg[30]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \rAccum_reg[7]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \rAccum_reg[7]_i_10\ : label is 35;
  attribute ADDER_THRESHOLD of \rAccum_reg[7]_i_11\ : label is 35;
  attribute ADDER_THRESHOLD of \rAccum_reg[7]_i_20\ : label is 35;
  attribute ADDER_THRESHOLD of \rAccum_reg[7]_i_29\ : label is 35;
  attribute ADDER_THRESHOLD of \rAccum_reg[7]_i_38\ : label is 35;
  attribute ADDER_THRESHOLD of \rInitialGuess00_inferred__0/i__carry\ : label is 35;
  attribute ADDER_THRESHOLD of \rInitialGuess00_inferred__0/i__carry__0\ : label is 35;
  attribute KEEP_HIERARCHY of rProduct0 : label is "YES";
  attribute METHODOLOGY_DRC_VIOS of rProduct0 : label is "{SYNTH-11 {cell *THIS*}}";
  attribute KEEP_HIERARCHY of rProduct_reg : label is "YES";
  attribute ADDER_THRESHOLD of \rRefined0_reg[22]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \rRefined0_reg[30]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \rRefined0_reg[31]_i_2\ : label is 35;
  attribute SOFT_HLUTNM of \rcpLookupOffset0[0]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[10]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[11]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[12]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[13]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[1]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[3]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[4]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[5]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[6]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[7]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[8]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \rcpLookupOffset0[9]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \rcpPipeline[0][calculatedMantissa][22]_i_2\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \rcpPipeline[0][rcpExponent][0]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \rcpPipeline[0][rcpExponent][5]_i_2\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \rcpPipeline[0][rcpExponent][6]_i_1\ : label is "soft_lutpair0";
  attribute srl_bus_name : string;
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][0]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name : string;
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][0]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][0]_srl10 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][10]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][10]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][10]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][11]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][11]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][11]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][12]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][12]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][12]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][13]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][13]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][13]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][14]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][14]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][14]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][15]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][15]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][15]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][16]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][16]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][16]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][17]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][17]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][17]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][18]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][18]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][18]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][19]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][19]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][19]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][1]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][1]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][1]_srl10 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][20]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][20]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][20]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][21]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][21]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][21]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][22]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][22]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][22]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][2]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][2]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][2]_srl10 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][3]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][3]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][3]_srl10 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][4]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][4]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][4]_srl10 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][5]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][5]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][5]_srl10 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][6]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][6]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][6]_srl10 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][7]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][7]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][7]_srl10 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][8]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][8]_srl10\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][8]_srl10 ";
  attribute srl_bus_name of \rcpPipeline_reg[11][calculatedMantissa][9]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[11][calculatedMantissa][9]_srl8\ : label is "\U0/rcpPipeline_reg[11][calculatedMantissa][9]_srl8 ";
  attribute srl_bus_name of \rcpPipeline_reg[12][rcpExponent][0]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent] ";
  attribute srl_name of \rcpPipeline_reg[12][rcpExponent][0]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent][0]_srl12 ";
  attribute srl_bus_name of \rcpPipeline_reg[12][rcpExponent][1]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent] ";
  attribute srl_name of \rcpPipeline_reg[12][rcpExponent][1]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent][1]_srl12 ";
  attribute srl_bus_name of \rcpPipeline_reg[12][rcpExponent][2]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent] ";
  attribute srl_name of \rcpPipeline_reg[12][rcpExponent][2]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent][2]_srl12 ";
  attribute srl_bus_name of \rcpPipeline_reg[12][rcpExponent][3]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent] ";
  attribute srl_name of \rcpPipeline_reg[12][rcpExponent][3]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent][3]_srl12 ";
  attribute srl_bus_name of \rcpPipeline_reg[12][rcpExponent][4]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent] ";
  attribute srl_name of \rcpPipeline_reg[12][rcpExponent][4]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent][4]_srl12 ";
  attribute srl_bus_name of \rcpPipeline_reg[12][rcpExponent][5]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent] ";
  attribute srl_name of \rcpPipeline_reg[12][rcpExponent][5]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent][5]_srl12 ";
  attribute srl_bus_name of \rcpPipeline_reg[12][rcpExponent][6]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent] ";
  attribute srl_name of \rcpPipeline_reg[12][rcpExponent][6]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent][6]_srl12 ";
  attribute srl_bus_name of \rcpPipeline_reg[12][rcpExponent][7]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent] ";
  attribute srl_name of \rcpPipeline_reg[12][rcpExponent][7]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpExponent][7]_srl12 ";
  attribute srl_bus_name of \rcpPipeline_reg[12][rcpSign]_srl12\ : label is "\U0/rcpPipeline_reg[12] ";
  attribute srl_name of \rcpPipeline_reg[12][rcpSign]_srl12\ : label is "\U0/rcpPipeline_reg[12][rcpSign]_srl12 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][10]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][10]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][10]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][11]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][11]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][11]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][12]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][12]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][12]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][13]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][13]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][13]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][14]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][14]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][14]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][15]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][15]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][15]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][16]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][16]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][16]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][17]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][17]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][17]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][18]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][18]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][18]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][19]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][19]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][19]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][20]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][20]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][20]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][21]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][21]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][21]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][22]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][22]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][22]_srl2 ";
  attribute srl_bus_name of \rcpPipeline_reg[2][calculatedMantissa][9]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa] ";
  attribute srl_name of \rcpPipeline_reg[2][calculatedMantissa][9]_srl2\ : label is "\U0/rcpPipeline_reg[2][calculatedMantissa][9]_srl2 ";
  attribute KEEP_HIERARCHY of rcpSqrSigma0Product0 : label is "YES";
  attribute METHODOLOGY_DRC_VIOS of rcpSqrSigma0Product0 : label is "{SYNTH-10 {cell *THIS*} {string 16x18 4}}";
  attribute KEEP_HIERARCHY of \rcpSqrSigma0Product0__0\ : label is "YES";
  attribute METHODOLOGY_DRC_VIOS of \rcpSqrSigma0Product0__0\ : label is "{SYNTH-10 {cell *THIS*} {string 18x18 4}}";
  attribute KEEP_HIERARCHY of rcpSqrSigma0Product_reg : label is "YES";
  attribute METHODOLOGY_DRC_VIOS of rcpSqrSigma0Product_reg : label is "{SYNTH-10 {cell *THIS*} {string 16x16 4}}";
  attribute KEEP_HIERARCHY of \rcpSqrSigma0Product_reg__0\ : label is "YES";
  attribute METHODOLOGY_DRC_VIOS of \rcpSqrSigma0Product_reg__0\ : label is "{SYNTH-10 {cell *THIS*} {string 18x16 4}}";
  attribute ADDER_THRESHOLD of \resultMantissa_reg[13]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \resultMantissa_reg[21]_i_1\ : label is 35;
  attribute ADDER_THRESHOLD of \resultMantissa_reg[22]_i_2\ : label is 35;
  attribute ADDER_THRESHOLD of \resultMantissa_reg[5]_i_1\ : label is 35;
  attribute KEEP_HIERARCHY of sigma0TempProduct0 : label is "YES";
  attribute METHODOLOGY_DRC_VIOS of sigma0TempProduct0 : label is "{SYNTH-11 {cell *THIS*}}";
  attribute KEEP_HIERARCHY of sigma0TempProduct_reg : label is "YES";
  attribute KEEP_HIERARCHY of slopeMultiply_reg : label is "YES";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_19 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_20 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_21 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_22 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_23 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_24 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_25 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_26 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_27 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_28 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_29 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_30 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_31 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_32 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_33 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of slopeMultiply_reg_i_34 : label is "soft_lutpair6";
begin
\OSPEC[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(0),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(0),
      O => p_1_in(0)
    );
\OSPEC[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(10),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(10),
      O => p_1_in(10)
    );
\OSPEC[11]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(11),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(11),
      O => p_1_in(11)
    );
\OSPEC[12]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(12),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(12),
      O => p_1_in(12)
    );
\OSPEC[13]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(13),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(13),
      O => p_1_in(13)
    );
\OSPEC[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(14),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(14),
      O => p_1_in(14)
    );
\OSPEC[15]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(15),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(15),
      O => p_1_in(15)
    );
\OSPEC[16]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(16),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(16),
      O => p_1_in(16)
    );
\OSPEC[17]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(17),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(17),
      O => p_1_in(17)
    );
\OSPEC[18]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(18),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(18),
      O => p_1_in(18)
    );
\OSPEC[19]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(19),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(19),
      O => p_1_in(19)
    );
\OSPEC[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(1),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(1),
      O => p_1_in(1)
    );
\OSPEC[20]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(20),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(20),
      O => p_1_in(20)
    );
\OSPEC[21]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(21),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(21),
      O => p_1_in(21)
    );
\OSPEC[22]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(22),
      O => p_1_in(22)
    );
\OSPEC[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(2),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(2),
      O => p_1_in(2)
    );
\OSPEC[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(3),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(3),
      O => p_1_in(3)
    );
\OSPEC[4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(4),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(4),
      O => p_1_in(4)
    );
\OSPEC[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(5),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(5),
      O => p_1_in(5)
    );
\OSPEC[6]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(6),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(6),
      O => p_1_in(6)
    );
\OSPEC[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(7),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(7),
      O => p_1_in(7)
    );
\OSPEC[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(8),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(8),
      O => p_1_in(8)
    );
\OSPEC[9]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => \rcpPipeline_reg[12][calculatedMantissa]\(9),
      I1 => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      I2 => resultMantissa(9),
      O => p_1_in(9)
    );
\OSPEC_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(0),
      Q => OSPEC(0),
      R => '0'
    );
\OSPEC_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(10),
      Q => OSPEC(10),
      R => '0'
    );
\OSPEC_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(11),
      Q => OSPEC(11),
      R => '0'
    );
\OSPEC_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(12),
      Q => OSPEC(12),
      R => '0'
    );
\OSPEC_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(13),
      Q => OSPEC(13),
      R => '0'
    );
\OSPEC_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(14),
      Q => OSPEC(14),
      R => '0'
    );
\OSPEC_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(15),
      Q => OSPEC(15),
      R => '0'
    );
\OSPEC_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(16),
      Q => OSPEC(16),
      R => '0'
    );
\OSPEC_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(17),
      Q => OSPEC(17),
      R => '0'
    );
\OSPEC_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(18),
      Q => OSPEC(18),
      R => '0'
    );
\OSPEC_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(19),
      Q => OSPEC(19),
      R => '0'
    );
\OSPEC_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(1),
      Q => OSPEC(1),
      R => '0'
    );
\OSPEC_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(20),
      Q => OSPEC(20),
      R => '0'
    );
\OSPEC_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(21),
      Q => OSPEC(21),
      R => '0'
    );
\OSPEC_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(22),
      Q => OSPEC(22),
      R => '0'
    );
\OSPEC_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => \rcpPipeline_reg[12][rcpExponent]\(0),
      Q => OSPEC(23),
      R => '0'
    );
\OSPEC_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => \rcpPipeline_reg[12][rcpExponent]\(1),
      Q => OSPEC(24),
      R => '0'
    );
\OSPEC_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => \rcpPipeline_reg[12][rcpExponent]\(2),
      Q => OSPEC(25),
      R => '0'
    );
\OSPEC_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => \rcpPipeline_reg[12][rcpExponent]\(3),
      Q => OSPEC(26),
      R => '0'
    );
\OSPEC_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => \rcpPipeline_reg[12][rcpExponent]\(4),
      Q => OSPEC(27),
      R => '0'
    );
\OSPEC_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => \rcpPipeline_reg[12][rcpExponent]\(5),
      Q => OSPEC(28),
      R => '0'
    );
\OSPEC_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => \rcpPipeline_reg[12][rcpExponent]\(6),
      Q => OSPEC(29),
      R => '0'
    );
\OSPEC_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(2),
      Q => OSPEC(2),
      R => '0'
    );
\OSPEC_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => \rcpPipeline_reg[12][rcpExponent]\(7),
      Q => OSPEC(30),
      R => '0'
    );
\OSPEC_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => \rcpPipeline_reg[12][rcpSign]\,
      Q => OSPEC(31),
      R => '0'
    );
\OSPEC_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(3),
      Q => OSPEC(3),
      R => '0'
    );
\OSPEC_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(4),
      Q => OSPEC(4),
      R => '0'
    );
\OSPEC_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(5),
      Q => OSPEC(5),
      R => '0'
    );
\OSPEC_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(6),
      Q => OSPEC(6),
      R => '0'
    );
\OSPEC_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(7),
      Q => OSPEC(7),
      R => '0'
    );
\OSPEC_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(8),
      Q => OSPEC(8),
      R => '0'
    );
\OSPEC_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      D => p_1_in(9),
      Q => OSPEC(9),
      R => '0'
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rcpLookupOffset1(15),
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rcpLookupOffset1(14),
      O => \i__carry__0_i_2_n_0\
    );
\i__carry__0_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rcpLookupOffset1(13),
      O => \i__carry__0_i_3_n_0\
    );
\i__carry__0_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rcpLookupOffset1(12),
      O => \i__carry__0_i_4_n_0\
    );
\i__carry__0_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(11),
      I1 => slopeMultiply_reg_n_74,
      O => \i__carry__0_i_5_n_0\
    );
\i__carry__0_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(10),
      I1 => slopeMultiply_reg_n_75,
      O => \i__carry__0_i_6_n_0\
    );
\i__carry__0_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(9),
      I1 => slopeMultiply_reg_n_76,
      O => \i__carry__0_i_7_n_0\
    );
\i__carry__0_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(8),
      I1 => slopeMultiply_reg_n_77,
      O => \i__carry__0_i_8_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(7),
      I1 => slopeMultiply_reg_n_78,
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(6),
      I1 => slopeMultiply_reg_n_79,
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(5),
      I1 => slopeMultiply_reg_n_80,
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(4),
      I1 => slopeMultiply_reg_n_81,
      O => \i__carry_i_4_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(3),
      I1 => slopeMultiply_reg_n_82,
      O => \i__carry_i_5_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(2),
      I1 => slopeMultiply_reg_n_83,
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(1),
      I1 => slopeMultiply_reg_n_84,
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => rcpLookupOffset1(0),
      I1 => slopeMultiply_reg_n_85,
      O => \i__carry_i_8_n_0\
    );
rAccumProduct0: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 2,
      BMULTSEL => "B",
      BREG => 2,
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
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => \rcpSqrSigma0Product_reg__1\(48 downto 32),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_rAccumProduct0_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 15) => B"000",
      B(14 downto 0) => rRefined0(31 downto 17),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_rAccumProduct0_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_rAccumProduct0_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_rAccumProduct0_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => rcpSqrSigma00,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => \rcpSqrSigma0Product0__1\,
      CEB2 => rcpSqrSigma00,
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
      MULTSIGNOUT => NLW_rAccumProduct0_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_rAccumProduct0_OVERFLOW_UNCONNECTED,
      P(47) => rAccumProduct0_n_58,
      P(46) => rAccumProduct0_n_59,
      P(45) => rAccumProduct0_n_60,
      P(44) => rAccumProduct0_n_61,
      P(43) => rAccumProduct0_n_62,
      P(42) => rAccumProduct0_n_63,
      P(41) => rAccumProduct0_n_64,
      P(40) => rAccumProduct0_n_65,
      P(39) => rAccumProduct0_n_66,
      P(38) => rAccumProduct0_n_67,
      P(37) => rAccumProduct0_n_68,
      P(36) => rAccumProduct0_n_69,
      P(35) => rAccumProduct0_n_70,
      P(34) => rAccumProduct0_n_71,
      P(33) => rAccumProduct0_n_72,
      P(32) => rAccumProduct0_n_73,
      P(31) => rAccumProduct0_n_74,
      P(30) => rAccumProduct0_n_75,
      P(29) => rAccumProduct0_n_76,
      P(28) => rAccumProduct0_n_77,
      P(27) => rAccumProduct0_n_78,
      P(26) => rAccumProduct0_n_79,
      P(25) => rAccumProduct0_n_80,
      P(24) => rAccumProduct0_n_81,
      P(23) => rAccumProduct0_n_82,
      P(22) => rAccumProduct0_n_83,
      P(21) => rAccumProduct0_n_84,
      P(20) => rAccumProduct0_n_85,
      P(19) => rAccumProduct0_n_86,
      P(18) => rAccumProduct0_n_87,
      P(17) => rAccumProduct0_n_88,
      P(16) => rAccumProduct0_n_89,
      P(15) => rAccumProduct0_n_90,
      P(14) => rAccumProduct0_n_91,
      P(13) => rAccumProduct0_n_92,
      P(12) => rAccumProduct0_n_93,
      P(11) => rAccumProduct0_n_94,
      P(10) => rAccumProduct0_n_95,
      P(9) => rAccumProduct0_n_96,
      P(8) => rAccumProduct0_n_97,
      P(7) => rAccumProduct0_n_98,
      P(6) => rAccumProduct0_n_99,
      P(5) => rAccumProduct0_n_100,
      P(4) => rAccumProduct0_n_101,
      P(3) => rAccumProduct0_n_102,
      P(2) => rAccumProduct0_n_103,
      P(1) => rAccumProduct0_n_104,
      P(0) => rAccumProduct0_n_105,
      PATTERNBDETECT => NLW_rAccumProduct0_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_rAccumProduct0_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => rAccumProduct0_n_106,
      PCOUT(46) => rAccumProduct0_n_107,
      PCOUT(45) => rAccumProduct0_n_108,
      PCOUT(44) => rAccumProduct0_n_109,
      PCOUT(43) => rAccumProduct0_n_110,
      PCOUT(42) => rAccumProduct0_n_111,
      PCOUT(41) => rAccumProduct0_n_112,
      PCOUT(40) => rAccumProduct0_n_113,
      PCOUT(39) => rAccumProduct0_n_114,
      PCOUT(38) => rAccumProduct0_n_115,
      PCOUT(37) => rAccumProduct0_n_116,
      PCOUT(36) => rAccumProduct0_n_117,
      PCOUT(35) => rAccumProduct0_n_118,
      PCOUT(34) => rAccumProduct0_n_119,
      PCOUT(33) => rAccumProduct0_n_120,
      PCOUT(32) => rAccumProduct0_n_121,
      PCOUT(31) => rAccumProduct0_n_122,
      PCOUT(30) => rAccumProduct0_n_123,
      PCOUT(29) => rAccumProduct0_n_124,
      PCOUT(28) => rAccumProduct0_n_125,
      PCOUT(27) => rAccumProduct0_n_126,
      PCOUT(26) => rAccumProduct0_n_127,
      PCOUT(25) => rAccumProduct0_n_128,
      PCOUT(24) => rAccumProduct0_n_129,
      PCOUT(23) => rAccumProduct0_n_130,
      PCOUT(22) => rAccumProduct0_n_131,
      PCOUT(21) => rAccumProduct0_n_132,
      PCOUT(20) => rAccumProduct0_n_133,
      PCOUT(19) => rAccumProduct0_n_134,
      PCOUT(18) => rAccumProduct0_n_135,
      PCOUT(17) => rAccumProduct0_n_136,
      PCOUT(16) => rAccumProduct0_n_137,
      PCOUT(15) => rAccumProduct0_n_138,
      PCOUT(14) => rAccumProduct0_n_139,
      PCOUT(13) => rAccumProduct0_n_140,
      PCOUT(12) => rAccumProduct0_n_141,
      PCOUT(11) => rAccumProduct0_n_142,
      PCOUT(10) => rAccumProduct0_n_143,
      PCOUT(9) => rAccumProduct0_n_144,
      PCOUT(8) => rAccumProduct0_n_145,
      PCOUT(7) => rAccumProduct0_n_146,
      PCOUT(6) => rAccumProduct0_n_147,
      PCOUT(5) => rAccumProduct0_n_148,
      PCOUT(4) => rAccumProduct0_n_149,
      PCOUT(3) => rAccumProduct0_n_150,
      PCOUT(2) => rAccumProduct0_n_151,
      PCOUT(1) => rAccumProduct0_n_152,
      PCOUT(0) => rAccumProduct0_n_153,
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
      UNDERFLOW => NLW_rAccumProduct0_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_rAccumProduct0_XOROUT_UNCONNECTED(7 downto 0)
    );
\rAccumProduct0__0\: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 2,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 2,
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
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => rRefined0(16 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_rAccumProduct0__0_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => '0',
      B(16 downto 0) => \rcpSqrSigma0Product_reg__1\(48 downto 32),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_rAccumProduct0__0_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_rAccumProduct0__0_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_rAccumProduct0__0_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => \rcpSqrSigma0Product0__1\,
      CEA2 => rcpSqrSigma00,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => rcpSqrSigma00,
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
      MULTSIGNOUT => \NLW_rAccumProduct0__0_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => \NLW_rAccumProduct0__0_OVERFLOW_UNCONNECTED\,
      P(47) => \rAccumProduct0__0_n_58\,
      P(46) => \rAccumProduct0__0_n_59\,
      P(45) => \rAccumProduct0__0_n_60\,
      P(44) => \rAccumProduct0__0_n_61\,
      P(43) => \rAccumProduct0__0_n_62\,
      P(42) => \rAccumProduct0__0_n_63\,
      P(41) => \rAccumProduct0__0_n_64\,
      P(40) => \rAccumProduct0__0_n_65\,
      P(39) => \rAccumProduct0__0_n_66\,
      P(38) => \rAccumProduct0__0_n_67\,
      P(37) => \rAccumProduct0__0_n_68\,
      P(36) => \rAccumProduct0__0_n_69\,
      P(35) => \rAccumProduct0__0_n_70\,
      P(34) => \rAccumProduct0__0_n_71\,
      P(33) => \rAccumProduct0__0_n_72\,
      P(32) => \rAccumProduct0__0_n_73\,
      P(31) => \rAccumProduct0__0_n_74\,
      P(30) => \rAccumProduct0__0_n_75\,
      P(29) => \rAccumProduct0__0_n_76\,
      P(28) => \rAccumProduct0__0_n_77\,
      P(27) => \rAccumProduct0__0_n_78\,
      P(26) => \rAccumProduct0__0_n_79\,
      P(25) => \rAccumProduct0__0_n_80\,
      P(24) => \rAccumProduct0__0_n_81\,
      P(23) => \rAccumProduct0__0_n_82\,
      P(22) => \rAccumProduct0__0_n_83\,
      P(21) => \rAccumProduct0__0_n_84\,
      P(20) => \rAccumProduct0__0_n_85\,
      P(19) => \rAccumProduct0__0_n_86\,
      P(18) => \rAccumProduct0__0_n_87\,
      P(17) => \rAccumProduct0__0_n_88\,
      P(16) => \rAccumProduct0__0_n_89\,
      P(15) => \rAccumProduct0__0_n_90\,
      P(14) => \rAccumProduct0__0_n_91\,
      P(13) => \rAccumProduct0__0_n_92\,
      P(12) => \rAccumProduct0__0_n_93\,
      P(11) => \rAccumProduct0__0_n_94\,
      P(10) => \rAccumProduct0__0_n_95\,
      P(9) => \rAccumProduct0__0_n_96\,
      P(8) => \rAccumProduct0__0_n_97\,
      P(7) => \rAccumProduct0__0_n_98\,
      P(6) => \rAccumProduct0__0_n_99\,
      P(5) => \rAccumProduct0__0_n_100\,
      P(4) => \rAccumProduct0__0_n_101\,
      P(3) => \rAccumProduct0__0_n_102\,
      P(2) => \rAccumProduct0__0_n_103\,
      P(1) => \rAccumProduct0__0_n_104\,
      P(0) => \rAccumProduct0__0_n_105\,
      PATTERNBDETECT => \NLW_rAccumProduct0__0_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_rAccumProduct0__0_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => \rAccumProduct0__0_n_106\,
      PCOUT(46) => \rAccumProduct0__0_n_107\,
      PCOUT(45) => \rAccumProduct0__0_n_108\,
      PCOUT(44) => \rAccumProduct0__0_n_109\,
      PCOUT(43) => \rAccumProduct0__0_n_110\,
      PCOUT(42) => \rAccumProduct0__0_n_111\,
      PCOUT(41) => \rAccumProduct0__0_n_112\,
      PCOUT(40) => \rAccumProduct0__0_n_113\,
      PCOUT(39) => \rAccumProduct0__0_n_114\,
      PCOUT(38) => \rAccumProduct0__0_n_115\,
      PCOUT(37) => \rAccumProduct0__0_n_116\,
      PCOUT(36) => \rAccumProduct0__0_n_117\,
      PCOUT(35) => \rAccumProduct0__0_n_118\,
      PCOUT(34) => \rAccumProduct0__0_n_119\,
      PCOUT(33) => \rAccumProduct0__0_n_120\,
      PCOUT(32) => \rAccumProduct0__0_n_121\,
      PCOUT(31) => \rAccumProduct0__0_n_122\,
      PCOUT(30) => \rAccumProduct0__0_n_123\,
      PCOUT(29) => \rAccumProduct0__0_n_124\,
      PCOUT(28) => \rAccumProduct0__0_n_125\,
      PCOUT(27) => \rAccumProduct0__0_n_126\,
      PCOUT(26) => \rAccumProduct0__0_n_127\,
      PCOUT(25) => \rAccumProduct0__0_n_128\,
      PCOUT(24) => \rAccumProduct0__0_n_129\,
      PCOUT(23) => \rAccumProduct0__0_n_130\,
      PCOUT(22) => \rAccumProduct0__0_n_131\,
      PCOUT(21) => \rAccumProduct0__0_n_132\,
      PCOUT(20) => \rAccumProduct0__0_n_133\,
      PCOUT(19) => \rAccumProduct0__0_n_134\,
      PCOUT(18) => \rAccumProduct0__0_n_135\,
      PCOUT(17) => \rAccumProduct0__0_n_136\,
      PCOUT(16) => \rAccumProduct0__0_n_137\,
      PCOUT(15) => \rAccumProduct0__0_n_138\,
      PCOUT(14) => \rAccumProduct0__0_n_139\,
      PCOUT(13) => \rAccumProduct0__0_n_140\,
      PCOUT(12) => \rAccumProduct0__0_n_141\,
      PCOUT(11) => \rAccumProduct0__0_n_142\,
      PCOUT(10) => \rAccumProduct0__0_n_143\,
      PCOUT(9) => \rAccumProduct0__0_n_144\,
      PCOUT(8) => \rAccumProduct0__0_n_145\,
      PCOUT(7) => \rAccumProduct0__0_n_146\,
      PCOUT(6) => \rAccumProduct0__0_n_147\,
      PCOUT(5) => \rAccumProduct0__0_n_148\,
      PCOUT(4) => \rAccumProduct0__0_n_149\,
      PCOUT(3) => \rAccumProduct0__0_n_150\,
      PCOUT(2) => \rAccumProduct0__0_n_151\,
      PCOUT(1) => \rAccumProduct0__0_n_152\,
      PCOUT(0) => \rAccumProduct0__0_n_153\,
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
      UNDERFLOW => \NLW_rAccumProduct0__0_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_rAccumProduct0__0_XOROUT_UNCONNECTED\(7 downto 0)
    );
rAccumProduct0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[8][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[8][useEarlyOutBypass_n_0_]\,
      O => rcpSqrSigma00
    );
rAccumProduct0_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_72\,
      I1 => rcpSqrSigma0Product_reg_n_89,
      O => rAccumProduct0_i_10_n_0
    );
rAccumProduct0_i_11: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_73\,
      I1 => rcpSqrSigma0Product_reg_n_90,
      O => rAccumProduct0_i_11_n_0
    );
rAccumProduct0_i_12: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_74\,
      I1 => rcpSqrSigma0Product_reg_n_91,
      O => rAccumProduct0_i_12_n_0
    );
rAccumProduct0_i_13: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_75\,
      I1 => rcpSqrSigma0Product_reg_n_92,
      O => rAccumProduct0_i_13_n_0
    );
rAccumProduct0_i_14: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_76\,
      I1 => rcpSqrSigma0Product_reg_n_93,
      O => rAccumProduct0_i_14_n_0
    );
rAccumProduct0_i_15: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_77\,
      I1 => rcpSqrSigma0Product_reg_n_94,
      O => rAccumProduct0_i_15_n_0
    );
rAccumProduct0_i_16: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_78\,
      I1 => rcpSqrSigma0Product_reg_n_95,
      O => rAccumProduct0_i_16_n_0
    );
rAccumProduct0_i_17: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_79\,
      I1 => rcpSqrSigma0Product_reg_n_96,
      O => rAccumProduct0_i_17_n_0
    );
rAccumProduct0_i_18: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_80\,
      I1 => rcpSqrSigma0Product_reg_n_97,
      O => rAccumProduct0_i_18_n_0
    );
rAccumProduct0_i_19: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_81\,
      I1 => rcpSqrSigma0Product_reg_n_98,
      O => rAccumProduct0_i_19_n_0
    );
rAccumProduct0_i_2: unisim.vcomponents.CARRY8
     port map (
      CI => rAccumProduct0_i_3_n_0,
      CI_TOP => '0',
      CO(7) => rAccumProduct0_i_2_n_0,
      CO(6) => rAccumProduct0_i_2_n_1,
      CO(5) => rAccumProduct0_i_2_n_2,
      CO(4) => rAccumProduct0_i_2_n_3,
      CO(3) => rAccumProduct0_i_2_n_4,
      CO(2) => rAccumProduct0_i_2_n_5,
      CO(1) => rAccumProduct0_i_2_n_6,
      CO(0) => rAccumProduct0_i_2_n_7,
      DI(7) => \rcpSqrSigma0Product_reg__0_n_67\,
      DI(6) => \rcpSqrSigma0Product_reg__0_n_68\,
      DI(5) => \rcpSqrSigma0Product_reg__0_n_69\,
      DI(4) => \rcpSqrSigma0Product_reg__0_n_70\,
      DI(3) => \rcpSqrSigma0Product_reg__0_n_71\,
      DI(2) => \rcpSqrSigma0Product_reg__0_n_72\,
      DI(1) => \rcpSqrSigma0Product_reg__0_n_73\,
      DI(0) => \rcpSqrSigma0Product_reg__0_n_74\,
      O(7 downto 0) => \rcpSqrSigma0Product_reg__1\(55 downto 48),
      S(7) => rAccumProduct0_i_5_n_0,
      S(6) => rAccumProduct0_i_6_n_0,
      S(5) => rAccumProduct0_i_7_n_0,
      S(4) => rAccumProduct0_i_8_n_0,
      S(3) => rAccumProduct0_i_9_n_0,
      S(2) => rAccumProduct0_i_10_n_0,
      S(1) => rAccumProduct0_i_11_n_0,
      S(0) => rAccumProduct0_i_12_n_0
    );
rAccumProduct0_i_20: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_82\,
      I1 => rcpSqrSigma0Product_reg_n_99,
      O => rAccumProduct0_i_20_n_0
    );
rAccumProduct0_i_21: unisim.vcomponents.CARRY8
     port map (
      CI => rAccumProduct0_i_30_n_0,
      CI_TOP => '0',
      CO(7) => rAccumProduct0_i_21_n_0,
      CO(6) => rAccumProduct0_i_21_n_1,
      CO(5) => rAccumProduct0_i_21_n_2,
      CO(4) => rAccumProduct0_i_21_n_3,
      CO(3) => rAccumProduct0_i_21_n_4,
      CO(2) => rAccumProduct0_i_21_n_5,
      CO(1) => rAccumProduct0_i_21_n_6,
      CO(0) => rAccumProduct0_i_21_n_7,
      DI(7) => \rcpSqrSigma0Product_reg__0_n_91\,
      DI(6) => \rcpSqrSigma0Product_reg__0_n_92\,
      DI(5) => \rcpSqrSigma0Product_reg__0_n_93\,
      DI(4) => \rcpSqrSigma0Product_reg__0_n_94\,
      DI(3) => \rcpSqrSigma0Product_reg__0_n_95\,
      DI(2) => \rcpSqrSigma0Product_reg__0_n_96\,
      DI(1) => \rcpSqrSigma0Product_reg__0_n_97\,
      DI(0) => \rcpSqrSigma0Product_reg__0_n_98\,
      O(7 downto 0) => NLW_rAccumProduct0_i_21_O_UNCONNECTED(7 downto 0),
      S(7) => rAccumProduct0_i_31_n_0,
      S(6) => rAccumProduct0_i_32_n_0,
      S(5) => rAccumProduct0_i_33_n_0,
      S(4) => rAccumProduct0_i_34_n_0,
      S(3) => rAccumProduct0_i_35_n_0,
      S(2) => rAccumProduct0_i_36_n_0,
      S(1) => rAccumProduct0_i_37_n_0,
      S(0) => rAccumProduct0_i_38_n_0
    );
rAccumProduct0_i_22: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_83\,
      I1 => rcpSqrSigma0Product_reg_n_100,
      O => rAccumProduct0_i_22_n_0
    );
rAccumProduct0_i_23: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_84\,
      I1 => rcpSqrSigma0Product_reg_n_101,
      O => rAccumProduct0_i_23_n_0
    );
rAccumProduct0_i_24: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_85\,
      I1 => rcpSqrSigma0Product_reg_n_102,
      O => rAccumProduct0_i_24_n_0
    );
rAccumProduct0_i_25: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_86\,
      I1 => rcpSqrSigma0Product_reg_n_103,
      O => rAccumProduct0_i_25_n_0
    );
rAccumProduct0_i_26: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_87\,
      I1 => rcpSqrSigma0Product_reg_n_104,
      O => rAccumProduct0_i_26_n_0
    );
rAccumProduct0_i_27: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_88\,
      I1 => rcpSqrSigma0Product_reg_n_105,
      O => rAccumProduct0_i_27_n_0
    );
rAccumProduct0_i_28: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_89\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[16]\,
      O => rAccumProduct0_i_28_n_0
    );
rAccumProduct0_i_29: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_90\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[15]\,
      O => rAccumProduct0_i_29_n_0
    );
rAccumProduct0_i_3: unisim.vcomponents.CARRY8
     port map (
      CI => rAccumProduct0_i_4_n_0,
      CI_TOP => '0',
      CO(7) => rAccumProduct0_i_3_n_0,
      CO(6) => rAccumProduct0_i_3_n_1,
      CO(5) => rAccumProduct0_i_3_n_2,
      CO(4) => rAccumProduct0_i_3_n_3,
      CO(3) => rAccumProduct0_i_3_n_4,
      CO(2) => rAccumProduct0_i_3_n_5,
      CO(1) => rAccumProduct0_i_3_n_6,
      CO(0) => rAccumProduct0_i_3_n_7,
      DI(7) => \rcpSqrSigma0Product_reg__0_n_75\,
      DI(6) => \rcpSqrSigma0Product_reg__0_n_76\,
      DI(5) => \rcpSqrSigma0Product_reg__0_n_77\,
      DI(4) => \rcpSqrSigma0Product_reg__0_n_78\,
      DI(3) => \rcpSqrSigma0Product_reg__0_n_79\,
      DI(2) => \rcpSqrSigma0Product_reg__0_n_80\,
      DI(1) => \rcpSqrSigma0Product_reg__0_n_81\,
      DI(0) => \rcpSqrSigma0Product_reg__0_n_82\,
      O(7 downto 0) => \rcpSqrSigma0Product_reg__1\(47 downto 40),
      S(7) => rAccumProduct0_i_13_n_0,
      S(6) => rAccumProduct0_i_14_n_0,
      S(5) => rAccumProduct0_i_15_n_0,
      S(4) => rAccumProduct0_i_16_n_0,
      S(3) => rAccumProduct0_i_17_n_0,
      S(2) => rAccumProduct0_i_18_n_0,
      S(1) => rAccumProduct0_i_19_n_0,
      S(0) => rAccumProduct0_i_20_n_0
    );
rAccumProduct0_i_30: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => rAccumProduct0_i_30_n_0,
      CO(6) => rAccumProduct0_i_30_n_1,
      CO(5) => rAccumProduct0_i_30_n_2,
      CO(4) => rAccumProduct0_i_30_n_3,
      CO(3) => rAccumProduct0_i_30_n_4,
      CO(2) => rAccumProduct0_i_30_n_5,
      CO(1) => rAccumProduct0_i_30_n_6,
      CO(0) => rAccumProduct0_i_30_n_7,
      DI(7) => \rcpSqrSigma0Product_reg__0_n_99\,
      DI(6) => \rcpSqrSigma0Product_reg__0_n_100\,
      DI(5) => \rcpSqrSigma0Product_reg__0_n_101\,
      DI(4) => \rcpSqrSigma0Product_reg__0_n_102\,
      DI(3) => \rcpSqrSigma0Product_reg__0_n_103\,
      DI(2) => \rcpSqrSigma0Product_reg__0_n_104\,
      DI(1) => \rcpSqrSigma0Product_reg__0_n_105\,
      DI(0) => '0',
      O(7 downto 0) => NLW_rAccumProduct0_i_30_O_UNCONNECTED(7 downto 0),
      S(7) => rAccumProduct0_i_39_n_0,
      S(6) => rAccumProduct0_i_40_n_0,
      S(5) => rAccumProduct0_i_41_n_0,
      S(4) => rAccumProduct0_i_42_n_0,
      S(3) => rAccumProduct0_i_43_n_0,
      S(2) => rAccumProduct0_i_44_n_0,
      S(1) => rAccumProduct0_i_45_n_0,
      S(0) => \rcpSqrSigma0Product_reg[16]__0_n_0\
    );
rAccumProduct0_i_31: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_91\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[14]\,
      O => rAccumProduct0_i_31_n_0
    );
rAccumProduct0_i_32: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_92\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[13]\,
      O => rAccumProduct0_i_32_n_0
    );
rAccumProduct0_i_33: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_93\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[12]\,
      O => rAccumProduct0_i_33_n_0
    );
rAccumProduct0_i_34: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_94\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[11]\,
      O => rAccumProduct0_i_34_n_0
    );
rAccumProduct0_i_35: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_95\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[10]\,
      O => rAccumProduct0_i_35_n_0
    );
rAccumProduct0_i_36: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_96\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[9]\,
      O => rAccumProduct0_i_36_n_0
    );
rAccumProduct0_i_37: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_97\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[8]\,
      O => rAccumProduct0_i_37_n_0
    );
rAccumProduct0_i_38: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_98\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[7]\,
      O => rAccumProduct0_i_38_n_0
    );
rAccumProduct0_i_39: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_99\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[6]\,
      O => rAccumProduct0_i_39_n_0
    );
rAccumProduct0_i_4: unisim.vcomponents.CARRY8
     port map (
      CI => rAccumProduct0_i_21_n_0,
      CI_TOP => '0',
      CO(7) => rAccumProduct0_i_4_n_0,
      CO(6) => rAccumProduct0_i_4_n_1,
      CO(5) => rAccumProduct0_i_4_n_2,
      CO(4) => rAccumProduct0_i_4_n_3,
      CO(3) => rAccumProduct0_i_4_n_4,
      CO(2) => rAccumProduct0_i_4_n_5,
      CO(1) => rAccumProduct0_i_4_n_6,
      CO(0) => rAccumProduct0_i_4_n_7,
      DI(7) => \rcpSqrSigma0Product_reg__0_n_83\,
      DI(6) => \rcpSqrSigma0Product_reg__0_n_84\,
      DI(5) => \rcpSqrSigma0Product_reg__0_n_85\,
      DI(4) => \rcpSqrSigma0Product_reg__0_n_86\,
      DI(3) => \rcpSqrSigma0Product_reg__0_n_87\,
      DI(2) => \rcpSqrSigma0Product_reg__0_n_88\,
      DI(1) => \rcpSqrSigma0Product_reg__0_n_89\,
      DI(0) => \rcpSqrSigma0Product_reg__0_n_90\,
      O(7 downto 0) => \rcpSqrSigma0Product_reg__1\(39 downto 32),
      S(7) => rAccumProduct0_i_22_n_0,
      S(6) => rAccumProduct0_i_23_n_0,
      S(5) => rAccumProduct0_i_24_n_0,
      S(4) => rAccumProduct0_i_25_n_0,
      S(3) => rAccumProduct0_i_26_n_0,
      S(2) => rAccumProduct0_i_27_n_0,
      S(1) => rAccumProduct0_i_28_n_0,
      S(0) => rAccumProduct0_i_29_n_0
    );
rAccumProduct0_i_40: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_100\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[5]\,
      O => rAccumProduct0_i_40_n_0
    );
rAccumProduct0_i_41: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_101\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[4]\,
      O => rAccumProduct0_i_41_n_0
    );
rAccumProduct0_i_42: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_102\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[3]\,
      O => rAccumProduct0_i_42_n_0
    );
rAccumProduct0_i_43: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_103\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[2]\,
      O => rAccumProduct0_i_43_n_0
    );
rAccumProduct0_i_44: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_104\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[1]\,
      O => rAccumProduct0_i_44_n_0
    );
rAccumProduct0_i_45: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_105\,
      I1 => \rcpSqrSigma0Product_reg_n_0_[0]\,
      O => rAccumProduct0_i_45_n_0
    );
rAccumProduct0_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_67\,
      I1 => rcpSqrSigma0Product_reg_n_84,
      O => rAccumProduct0_i_5_n_0
    );
rAccumProduct0_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_68\,
      I1 => rcpSqrSigma0Product_reg_n_85,
      O => rAccumProduct0_i_6_n_0
    );
rAccumProduct0_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_69\,
      I1 => rcpSqrSigma0Product_reg_n_86,
      O => rAccumProduct0_i_7_n_0
    );
rAccumProduct0_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_70\,
      I1 => rcpSqrSigma0Product_reg_n_87,
      O => rAccumProduct0_i_8_n_0
    );
rAccumProduct0_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_71\,
      I1 => rcpSqrSigma0Product_reg_n_88,
      O => rAccumProduct0_i_9_n_0
    );
\rAccumProduct[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[9][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[9][useEarlyOutBypass_n_0_]\,
      O => \rAccumProduct0__1\
    );
rAccumProduct_reg: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 2,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 2,
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
      A(29 downto 15) => B"000000000000000",
      A(14 downto 0) => rRefined0(31 downto 17),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_rAccumProduct_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 15) => B"000",
      B(14 downto 0) => \rcpSqrSigma0Product_reg__1\(63 downto 49),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_rAccumProduct_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_rAccumProduct_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_rAccumProduct_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => \rcpSqrSigma0Product0__1\,
      CEA2 => rcpSqrSigma00,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => rcpSqrSigma00,
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => \rAccumProduct0__1\,
      CLK => clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_rAccumProduct_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"001010101",
      OVERFLOW => NLW_rAccumProduct_reg_OVERFLOW_UNCONNECTED,
      P(47) => rAccumProduct_reg_n_58,
      P(46) => rAccumProduct_reg_n_59,
      P(45) => rAccumProduct_reg_n_60,
      P(44) => rAccumProduct_reg_n_61,
      P(43) => rAccumProduct_reg_n_62,
      P(42) => rAccumProduct_reg_n_63,
      P(41) => rAccumProduct_reg_n_64,
      P(40) => rAccumProduct_reg_n_65,
      P(39) => rAccumProduct_reg_n_66,
      P(38) => rAccumProduct_reg_n_67,
      P(37) => rAccumProduct_reg_n_68,
      P(36) => rAccumProduct_reg_n_69,
      P(35) => rAccumProduct_reg_n_70,
      P(34) => rAccumProduct_reg_n_71,
      P(33) => rAccumProduct_reg_n_72,
      P(32) => rAccumProduct_reg_n_73,
      P(31) => rAccumProduct_reg_n_74,
      P(30) => rAccumProduct_reg_n_75,
      P(29) => rAccumProduct_reg_n_76,
      P(28) => rAccumProduct_reg_n_77,
      P(27) => rAccumProduct_reg_n_78,
      P(26) => rAccumProduct_reg_n_79,
      P(25) => rAccumProduct_reg_n_80,
      P(24) => rAccumProduct_reg_n_81,
      P(23) => rAccumProduct_reg_n_82,
      P(22) => rAccumProduct_reg_n_83,
      P(21) => rAccumProduct_reg_n_84,
      P(20) => rAccumProduct_reg_n_85,
      P(19) => rAccumProduct_reg_n_86,
      P(18) => rAccumProduct_reg_n_87,
      P(17) => rAccumProduct_reg_n_88,
      P(16) => rAccumProduct_reg_n_89,
      P(15) => rAccumProduct_reg_n_90,
      P(14) => rAccumProduct_reg_n_91,
      P(13) => rAccumProduct_reg_n_92,
      P(12) => rAccumProduct_reg_n_93,
      P(11) => rAccumProduct_reg_n_94,
      P(10) => rAccumProduct_reg_n_95,
      P(9) => rAccumProduct_reg_n_96,
      P(8) => rAccumProduct_reg_n_97,
      P(7) => rAccumProduct_reg_n_98,
      P(6) => rAccumProduct_reg_n_99,
      P(5) => rAccumProduct_reg_n_100,
      P(4) => rAccumProduct_reg_n_101,
      P(3) => rAccumProduct_reg_n_102,
      P(2) => rAccumProduct_reg_n_103,
      P(1) => rAccumProduct_reg_n_104,
      P(0) => rAccumProduct_reg_n_105,
      PATTERNBDETECT => NLW_rAccumProduct_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_rAccumProduct_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => rAccumProduct0_n_106,
      PCIN(46) => rAccumProduct0_n_107,
      PCIN(45) => rAccumProduct0_n_108,
      PCIN(44) => rAccumProduct0_n_109,
      PCIN(43) => rAccumProduct0_n_110,
      PCIN(42) => rAccumProduct0_n_111,
      PCIN(41) => rAccumProduct0_n_112,
      PCIN(40) => rAccumProduct0_n_113,
      PCIN(39) => rAccumProduct0_n_114,
      PCIN(38) => rAccumProduct0_n_115,
      PCIN(37) => rAccumProduct0_n_116,
      PCIN(36) => rAccumProduct0_n_117,
      PCIN(35) => rAccumProduct0_n_118,
      PCIN(34) => rAccumProduct0_n_119,
      PCIN(33) => rAccumProduct0_n_120,
      PCIN(32) => rAccumProduct0_n_121,
      PCIN(31) => rAccumProduct0_n_122,
      PCIN(30) => rAccumProduct0_n_123,
      PCIN(29) => rAccumProduct0_n_124,
      PCIN(28) => rAccumProduct0_n_125,
      PCIN(27) => rAccumProduct0_n_126,
      PCIN(26) => rAccumProduct0_n_127,
      PCIN(25) => rAccumProduct0_n_128,
      PCIN(24) => rAccumProduct0_n_129,
      PCIN(23) => rAccumProduct0_n_130,
      PCIN(22) => rAccumProduct0_n_131,
      PCIN(21) => rAccumProduct0_n_132,
      PCIN(20) => rAccumProduct0_n_133,
      PCIN(19) => rAccumProduct0_n_134,
      PCIN(18) => rAccumProduct0_n_135,
      PCIN(17) => rAccumProduct0_n_136,
      PCIN(16) => rAccumProduct0_n_137,
      PCIN(15) => rAccumProduct0_n_138,
      PCIN(14) => rAccumProduct0_n_139,
      PCIN(13) => rAccumProduct0_n_140,
      PCIN(12) => rAccumProduct0_n_141,
      PCIN(11) => rAccumProduct0_n_142,
      PCIN(10) => rAccumProduct0_n_143,
      PCIN(9) => rAccumProduct0_n_144,
      PCIN(8) => rAccumProduct0_n_145,
      PCIN(7) => rAccumProduct0_n_146,
      PCIN(6) => rAccumProduct0_n_147,
      PCIN(5) => rAccumProduct0_n_148,
      PCIN(4) => rAccumProduct0_n_149,
      PCIN(3) => rAccumProduct0_n_150,
      PCIN(2) => rAccumProduct0_n_151,
      PCIN(1) => rAccumProduct0_n_152,
      PCIN(0) => rAccumProduct0_n_153,
      PCOUT(47 downto 0) => NLW_rAccumProduct_reg_PCOUT_UNCONNECTED(47 downto 0),
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
      UNDERFLOW => NLW_rAccumProduct_reg_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_rAccumProduct_reg_XOROUT_UNCONNECTED(7 downto 0)
    );
\rAccumProduct_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_105,
      Q => \rAccumProduct_reg_n_0_[0]\,
      R => '0'
    );
\rAccumProduct_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_95,
      Q => \rAccumProduct_reg_n_0_[10]\,
      R => '0'
    );
\rAccumProduct_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_94,
      Q => \rAccumProduct_reg_n_0_[11]\,
      R => '0'
    );
\rAccumProduct_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_93,
      Q => \rAccumProduct_reg_n_0_[12]\,
      R => '0'
    );
\rAccumProduct_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_92,
      Q => \rAccumProduct_reg_n_0_[13]\,
      R => '0'
    );
\rAccumProduct_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_91,
      Q => \rAccumProduct_reg_n_0_[14]\,
      R => '0'
    );
\rAccumProduct_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_90,
      Q => \rAccumProduct_reg_n_0_[15]\,
      R => '0'
    );
\rAccumProduct_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_89,
      Q => \rAccumProduct_reg_n_0_[16]\,
      R => '0'
    );
\rAccumProduct_reg[16]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rAccumProduct0__0_n_89\,
      Q => \rAccumProduct_reg[16]__0_n_0\,
      R => '0'
    );
\rAccumProduct_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_104,
      Q => \rAccumProduct_reg_n_0_[1]\,
      R => '0'
    );
\rAccumProduct_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_103,
      Q => \rAccumProduct_reg_n_0_[2]\,
      R => '0'
    );
\rAccumProduct_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_102,
      Q => \rAccumProduct_reg_n_0_[3]\,
      R => '0'
    );
\rAccumProduct_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_101,
      Q => \rAccumProduct_reg_n_0_[4]\,
      R => '0'
    );
\rAccumProduct_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_100,
      Q => \rAccumProduct_reg_n_0_[5]\,
      R => '0'
    );
\rAccumProduct_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_99,
      Q => \rAccumProduct_reg_n_0_[6]\,
      R => '0'
    );
\rAccumProduct_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_98,
      Q => \rAccumProduct_reg_n_0_[7]\,
      R => '0'
    );
\rAccumProduct_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_97,
      Q => \rAccumProduct_reg_n_0_[8]\,
      R => '0'
    );
\rAccumProduct_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => rAccumProduct0_n_96,
      Q => \rAccumProduct_reg_n_0_[9]\,
      R => '0'
    );
\rAccumProduct_reg__0\: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 2,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 2,
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
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => rRefined0(16 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_rAccumProduct_reg__0_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 15) => B"000",
      B(14 downto 0) => \rcpSqrSigma0Product_reg__1\(63 downto 49),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_rAccumProduct_reg__0_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_rAccumProduct_reg__0_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_rAccumProduct_reg__0_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => \rcpSqrSigma0Product0__1\,
      CEA2 => rcpSqrSigma00,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => rcpSqrSigma00,
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => \rAccumProduct0__1\,
      CLK => clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_rAccumProduct_reg__0_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"001010101",
      OVERFLOW => \NLW_rAccumProduct_reg__0_OVERFLOW_UNCONNECTED\,
      P(47) => \rAccumProduct_reg__0_n_58\,
      P(46) => \rAccumProduct_reg__0_n_59\,
      P(45) => \rAccumProduct_reg__0_n_60\,
      P(44) => \rAccumProduct_reg__0_n_61\,
      P(43) => \rAccumProduct_reg__0_n_62\,
      P(42) => \rAccumProduct_reg__0_n_63\,
      P(41) => \rAccumProduct_reg__0_n_64\,
      P(40) => \rAccumProduct_reg__0_n_65\,
      P(39) => \rAccumProduct_reg__0_n_66\,
      P(38) => \rAccumProduct_reg__0_n_67\,
      P(37) => \rAccumProduct_reg__0_n_68\,
      P(36) => \rAccumProduct_reg__0_n_69\,
      P(35) => \rAccumProduct_reg__0_n_70\,
      P(34) => \rAccumProduct_reg__0_n_71\,
      P(33) => \rAccumProduct_reg__0_n_72\,
      P(32) => \rAccumProduct_reg__0_n_73\,
      P(31) => \rAccumProduct_reg__0_n_74\,
      P(30) => \rAccumProduct_reg__0_n_75\,
      P(29) => \rAccumProduct_reg__0_n_76\,
      P(28) => \rAccumProduct_reg__0_n_77\,
      P(27) => \rAccumProduct_reg__0_n_78\,
      P(26) => \rAccumProduct_reg__0_n_79\,
      P(25) => \rAccumProduct_reg__0_n_80\,
      P(24) => \rAccumProduct_reg__0_n_81\,
      P(23) => \rAccumProduct_reg__0_n_82\,
      P(22) => \rAccumProduct_reg__0_n_83\,
      P(21) => \rAccumProduct_reg__0_n_84\,
      P(20) => \rAccumProduct_reg__0_n_85\,
      P(19) => \rAccumProduct_reg__0_n_86\,
      P(18) => \rAccumProduct_reg__0_n_87\,
      P(17) => \rAccumProduct_reg__0_n_88\,
      P(16) => \rAccumProduct_reg__0_n_89\,
      P(15) => \rAccumProduct_reg__0_n_90\,
      P(14) => \rAccumProduct_reg__0_n_91\,
      P(13) => \rAccumProduct_reg__0_n_92\,
      P(12) => \rAccumProduct_reg__0_n_93\,
      P(11) => \rAccumProduct_reg__0_n_94\,
      P(10) => \rAccumProduct_reg__0_n_95\,
      P(9) => \rAccumProduct_reg__0_n_96\,
      P(8) => \rAccumProduct_reg__0_n_97\,
      P(7) => \rAccumProduct_reg__0_n_98\,
      P(6) => \rAccumProduct_reg__0_n_99\,
      P(5) => \rAccumProduct_reg__0_n_100\,
      P(4) => \rAccumProduct_reg__0_n_101\,
      P(3) => \rAccumProduct_reg__0_n_102\,
      P(2) => \rAccumProduct_reg__0_n_103\,
      P(1) => \rAccumProduct_reg__0_n_104\,
      P(0) => \rAccumProduct_reg__0_n_105\,
      PATTERNBDETECT => \NLW_rAccumProduct_reg__0_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_rAccumProduct_reg__0_PATTERNDETECT_UNCONNECTED\,
      PCIN(47) => \rAccumProduct0__0_n_106\,
      PCIN(46) => \rAccumProduct0__0_n_107\,
      PCIN(45) => \rAccumProduct0__0_n_108\,
      PCIN(44) => \rAccumProduct0__0_n_109\,
      PCIN(43) => \rAccumProduct0__0_n_110\,
      PCIN(42) => \rAccumProduct0__0_n_111\,
      PCIN(41) => \rAccumProduct0__0_n_112\,
      PCIN(40) => \rAccumProduct0__0_n_113\,
      PCIN(39) => \rAccumProduct0__0_n_114\,
      PCIN(38) => \rAccumProduct0__0_n_115\,
      PCIN(37) => \rAccumProduct0__0_n_116\,
      PCIN(36) => \rAccumProduct0__0_n_117\,
      PCIN(35) => \rAccumProduct0__0_n_118\,
      PCIN(34) => \rAccumProduct0__0_n_119\,
      PCIN(33) => \rAccumProduct0__0_n_120\,
      PCIN(32) => \rAccumProduct0__0_n_121\,
      PCIN(31) => \rAccumProduct0__0_n_122\,
      PCIN(30) => \rAccumProduct0__0_n_123\,
      PCIN(29) => \rAccumProduct0__0_n_124\,
      PCIN(28) => \rAccumProduct0__0_n_125\,
      PCIN(27) => \rAccumProduct0__0_n_126\,
      PCIN(26) => \rAccumProduct0__0_n_127\,
      PCIN(25) => \rAccumProduct0__0_n_128\,
      PCIN(24) => \rAccumProduct0__0_n_129\,
      PCIN(23) => \rAccumProduct0__0_n_130\,
      PCIN(22) => \rAccumProduct0__0_n_131\,
      PCIN(21) => \rAccumProduct0__0_n_132\,
      PCIN(20) => \rAccumProduct0__0_n_133\,
      PCIN(19) => \rAccumProduct0__0_n_134\,
      PCIN(18) => \rAccumProduct0__0_n_135\,
      PCIN(17) => \rAccumProduct0__0_n_136\,
      PCIN(16) => \rAccumProduct0__0_n_137\,
      PCIN(15) => \rAccumProduct0__0_n_138\,
      PCIN(14) => \rAccumProduct0__0_n_139\,
      PCIN(13) => \rAccumProduct0__0_n_140\,
      PCIN(12) => \rAccumProduct0__0_n_141\,
      PCIN(11) => \rAccumProduct0__0_n_142\,
      PCIN(10) => \rAccumProduct0__0_n_143\,
      PCIN(9) => \rAccumProduct0__0_n_144\,
      PCIN(8) => \rAccumProduct0__0_n_145\,
      PCIN(7) => \rAccumProduct0__0_n_146\,
      PCIN(6) => \rAccumProduct0__0_n_147\,
      PCIN(5) => \rAccumProduct0__0_n_148\,
      PCIN(4) => \rAccumProduct0__0_n_149\,
      PCIN(3) => \rAccumProduct0__0_n_150\,
      PCIN(2) => \rAccumProduct0__0_n_151\,
      PCIN(1) => \rAccumProduct0__0_n_152\,
      PCIN(0) => \rAccumProduct0__0_n_153\,
      PCOUT(47 downto 0) => \NLW_rAccumProduct_reg__0_PCOUT_UNCONNECTED\(47 downto 0),
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
      UNDERFLOW => \NLW_rAccumProduct_reg__0_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_rAccumProduct_reg__0_XOROUT_UNCONNECTED\(7 downto 0)
    );
rAccumProduct_reg_i_1: unisim.vcomponents.CARRY8
     port map (
      CI => rAccumProduct0_i_2_n_0,
      CI_TOP => '0',
      CO(7) => NLW_rAccumProduct_reg_i_1_CO_UNCONNECTED(7),
      CO(6) => rAccumProduct_reg_i_1_n_1,
      CO(5) => rAccumProduct_reg_i_1_n_2,
      CO(4) => rAccumProduct_reg_i_1_n_3,
      CO(3) => rAccumProduct_reg_i_1_n_4,
      CO(2) => rAccumProduct_reg_i_1_n_5,
      CO(1) => rAccumProduct_reg_i_1_n_6,
      CO(0) => rAccumProduct_reg_i_1_n_7,
      DI(7) => '0',
      DI(6) => \rcpSqrSigma0Product_reg__0_n_60\,
      DI(5) => \rcpSqrSigma0Product_reg__0_n_61\,
      DI(4) => \rcpSqrSigma0Product_reg__0_n_62\,
      DI(3) => \rcpSqrSigma0Product_reg__0_n_63\,
      DI(2) => \rcpSqrSigma0Product_reg__0_n_64\,
      DI(1) => \rcpSqrSigma0Product_reg__0_n_65\,
      DI(0) => \rcpSqrSigma0Product_reg__0_n_66\,
      O(7 downto 0) => \rcpSqrSigma0Product_reg__1\(63 downto 56),
      S(7) => rAccumProduct_reg_i_2_n_0,
      S(6) => rAccumProduct_reg_i_3_n_0,
      S(5) => rAccumProduct_reg_i_4_n_0,
      S(4) => rAccumProduct_reg_i_5_n_0,
      S(3) => rAccumProduct_reg_i_6_n_0,
      S(2) => rAccumProduct_reg_i_7_n_0,
      S(1) => rAccumProduct_reg_i_8_n_0,
      S(0) => rAccumProduct_reg_i_9_n_0
    );
rAccumProduct_reg_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_59\,
      I1 => rcpSqrSigma0Product_reg_n_76,
      O => rAccumProduct_reg_i_2_n_0
    );
rAccumProduct_reg_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_60\,
      I1 => rcpSqrSigma0Product_reg_n_77,
      O => rAccumProduct_reg_i_3_n_0
    );
rAccumProduct_reg_i_4: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_61\,
      I1 => rcpSqrSigma0Product_reg_n_78,
      O => rAccumProduct_reg_i_4_n_0
    );
rAccumProduct_reg_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_62\,
      I1 => rcpSqrSigma0Product_reg_n_79,
      O => rAccumProduct_reg_i_5_n_0
    );
rAccumProduct_reg_i_6: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_63\,
      I1 => rcpSqrSigma0Product_reg_n_80,
      O => rAccumProduct_reg_i_6_n_0
    );
rAccumProduct_reg_i_7: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_64\,
      I1 => rcpSqrSigma0Product_reg_n_81,
      O => rAccumProduct_reg_i_7_n_0
    );
rAccumProduct_reg_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_65\,
      I1 => rcpSqrSigma0Product_reg_n_82,
      O => rAccumProduct_reg_i_8_n_0
    );
rAccumProduct_reg_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rcpSqrSigma0Product_reg__0_n_66\,
      I1 => rcpSqrSigma0Product_reg_n_83,
      O => rAccumProduct_reg_i_9_n_0
    );
\rAccum[15]_i_11\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_59\,
      I1 => rAccumProduct_reg_n_76,
      O => \rAccum[15]_i_11_n_0\
    );
\rAccum[15]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_60\,
      I1 => rAccumProduct_reg_n_77,
      O => \rAccum[15]_i_12_n_0\
    );
\rAccum[15]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_61\,
      I1 => rAccumProduct_reg_n_78,
      O => \rAccum[15]_i_13_n_0\
    );
\rAccum[15]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_62\,
      I1 => rAccumProduct_reg_n_79,
      O => \rAccum[15]_i_14_n_0\
    );
\rAccum[15]_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_63\,
      I1 => rAccumProduct_reg_n_80,
      O => \rAccum[15]_i_15_n_0\
    );
\rAccum[15]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_64\,
      I1 => rAccumProduct_reg_n_81,
      O => \rAccum[15]_i_16_n_0\
    );
\rAccum[15]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_65\,
      I1 => rAccumProduct_reg_n_82,
      O => \rAccum[15]_i_17_n_0\
    );
\rAccum[15]_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_66\,
      I1 => rAccumProduct_reg_n_83,
      O => \rAccum[15]_i_18_n_0\
    );
\rAccum[15]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(15),
      I1 => \rAccumProduct_reg__1\(63),
      O => \rAccum[15]_i_2_n_0\
    );
\rAccum[15]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(14),
      I1 => \rAccumProduct_reg__1\(62),
      O => \rAccum[15]_i_3_n_0\
    );
\rAccum[15]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(13),
      I1 => \rAccumProduct_reg__1\(61),
      O => \rAccum[15]_i_4_n_0\
    );
\rAccum[15]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(12),
      I1 => \rAccumProduct_reg__1\(60),
      O => \rAccum[15]_i_5_n_0\
    );
\rAccum[15]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(11),
      I1 => \rAccumProduct_reg__1\(59),
      O => \rAccum[15]_i_6_n_0\
    );
\rAccum[15]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(10),
      I1 => \rAccumProduct_reg__1\(58),
      O => \rAccum[15]_i_7_n_0\
    );
\rAccum[15]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(9),
      I1 => \rAccumProduct_reg__1\(57),
      O => \rAccum[15]_i_8_n_0\
    );
\rAccum[15]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(8),
      I1 => \rAccumProduct_reg__1\(56),
      O => \rAccum[15]_i_9_n_0\
    );
\rAccum[30]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[10][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[10][useEarlyOutBypass_n_0_]\,
      O => rAccum0
    );
\rAccum[7]_i_12\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_67\,
      I1 => rAccumProduct_reg_n_84,
      O => \rAccum[7]_i_12_n_0\
    );
\rAccum[7]_i_13\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_68\,
      I1 => rAccumProduct_reg_n_85,
      O => \rAccum[7]_i_13_n_0\
    );
\rAccum[7]_i_14\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_69\,
      I1 => rAccumProduct_reg_n_86,
      O => \rAccum[7]_i_14_n_0\
    );
\rAccum[7]_i_15\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_70\,
      I1 => rAccumProduct_reg_n_87,
      O => \rAccum[7]_i_15_n_0\
    );
\rAccum[7]_i_16\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_71\,
      I1 => rAccumProduct_reg_n_88,
      O => \rAccum[7]_i_16_n_0\
    );
\rAccum[7]_i_17\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_72\,
      I1 => rAccumProduct_reg_n_89,
      O => \rAccum[7]_i_17_n_0\
    );
\rAccum[7]_i_18\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_73\,
      I1 => rAccumProduct_reg_n_90,
      O => \rAccum[7]_i_18_n_0\
    );
\rAccum[7]_i_19\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_74\,
      I1 => rAccumProduct_reg_n_91,
      O => \rAccum[7]_i_19_n_0\
    );
\rAccum[7]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(7),
      I1 => \rAccumProduct_reg__1\(55),
      O => \rAccum[7]_i_2_n_0\
    );
\rAccum[7]_i_21\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_75\,
      I1 => rAccumProduct_reg_n_92,
      O => \rAccum[7]_i_21_n_0\
    );
\rAccum[7]_i_22\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_76\,
      I1 => rAccumProduct_reg_n_93,
      O => \rAccum[7]_i_22_n_0\
    );
\rAccum[7]_i_23\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_77\,
      I1 => rAccumProduct_reg_n_94,
      O => \rAccum[7]_i_23_n_0\
    );
\rAccum[7]_i_24\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_78\,
      I1 => rAccumProduct_reg_n_95,
      O => \rAccum[7]_i_24_n_0\
    );
\rAccum[7]_i_25\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_79\,
      I1 => rAccumProduct_reg_n_96,
      O => \rAccum[7]_i_25_n_0\
    );
\rAccum[7]_i_26\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_80\,
      I1 => rAccumProduct_reg_n_97,
      O => \rAccum[7]_i_26_n_0\
    );
\rAccum[7]_i_27\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_81\,
      I1 => rAccumProduct_reg_n_98,
      O => \rAccum[7]_i_27_n_0\
    );
\rAccum[7]_i_28\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_82\,
      I1 => rAccumProduct_reg_n_99,
      O => \rAccum[7]_i_28_n_0\
    );
\rAccum[7]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(6),
      I1 => \rAccumProduct_reg__1\(54),
      O => \rAccum[7]_i_3_n_0\
    );
\rAccum[7]_i_30\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_83\,
      I1 => rAccumProduct_reg_n_100,
      O => \rAccum[7]_i_30_n_0\
    );
\rAccum[7]_i_31\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_84\,
      I1 => rAccumProduct_reg_n_101,
      O => \rAccum[7]_i_31_n_0\
    );
\rAccum[7]_i_32\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_85\,
      I1 => rAccumProduct_reg_n_102,
      O => \rAccum[7]_i_32_n_0\
    );
\rAccum[7]_i_33\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_86\,
      I1 => rAccumProduct_reg_n_103,
      O => \rAccum[7]_i_33_n_0\
    );
\rAccum[7]_i_34\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_87\,
      I1 => rAccumProduct_reg_n_104,
      O => \rAccum[7]_i_34_n_0\
    );
\rAccum[7]_i_35\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_88\,
      I1 => rAccumProduct_reg_n_105,
      O => \rAccum[7]_i_35_n_0\
    );
\rAccum[7]_i_36\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_89\,
      I1 => \rAccumProduct_reg_n_0_[16]\,
      O => \rAccum[7]_i_36_n_0\
    );
\rAccum[7]_i_37\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_90\,
      I1 => \rAccumProduct_reg_n_0_[15]\,
      O => \rAccum[7]_i_37_n_0\
    );
\rAccum[7]_i_39\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_91\,
      I1 => \rAccumProduct_reg_n_0_[14]\,
      O => \rAccum[7]_i_39_n_0\
    );
\rAccum[7]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(5),
      I1 => \rAccumProduct_reg__1\(53),
      O => \rAccum[7]_i_4_n_0\
    );
\rAccum[7]_i_40\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_92\,
      I1 => \rAccumProduct_reg_n_0_[13]\,
      O => \rAccum[7]_i_40_n_0\
    );
\rAccum[7]_i_41\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_93\,
      I1 => \rAccumProduct_reg_n_0_[12]\,
      O => \rAccum[7]_i_41_n_0\
    );
\rAccum[7]_i_42\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_94\,
      I1 => \rAccumProduct_reg_n_0_[11]\,
      O => \rAccum[7]_i_42_n_0\
    );
\rAccum[7]_i_43\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_95\,
      I1 => \rAccumProduct_reg_n_0_[10]\,
      O => \rAccum[7]_i_43_n_0\
    );
\rAccum[7]_i_44\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_96\,
      I1 => \rAccumProduct_reg_n_0_[9]\,
      O => \rAccum[7]_i_44_n_0\
    );
\rAccum[7]_i_45\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_97\,
      I1 => \rAccumProduct_reg_n_0_[8]\,
      O => \rAccum[7]_i_45_n_0\
    );
\rAccum[7]_i_46\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_98\,
      I1 => \rAccumProduct_reg_n_0_[7]\,
      O => \rAccum[7]_i_46_n_0\
    );
\rAccum[7]_i_47\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_99\,
      I1 => \rAccumProduct_reg_n_0_[6]\,
      O => \rAccum[7]_i_47_n_0\
    );
\rAccum[7]_i_48\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_100\,
      I1 => \rAccumProduct_reg_n_0_[5]\,
      O => \rAccum[7]_i_48_n_0\
    );
\rAccum[7]_i_49\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_101\,
      I1 => \rAccumProduct_reg_n_0_[4]\,
      O => \rAccum[7]_i_49_n_0\
    );
\rAccum[7]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(4),
      I1 => \rAccumProduct_reg__1\(52),
      O => \rAccum[7]_i_5_n_0\
    );
\rAccum[7]_i_50\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_102\,
      I1 => \rAccumProduct_reg_n_0_[3]\,
      O => \rAccum[7]_i_50_n_0\
    );
\rAccum[7]_i_51\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_103\,
      I1 => \rAccumProduct_reg_n_0_[2]\,
      O => \rAccum[7]_i_51_n_0\
    );
\rAccum[7]_i_52\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_104\,
      I1 => \rAccumProduct_reg_n_0_[1]\,
      O => \rAccum[7]_i_52_n_0\
    );
\rAccum[7]_i_53\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \rAccumProduct_reg__0_n_105\,
      I1 => \rAccumProduct_reg_n_0_[0]\,
      O => \rAccum[7]_i_53_n_0\
    );
\rAccum[7]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(3),
      I1 => \rAccumProduct_reg__1\(51),
      O => \rAccum[7]_i_6_n_0\
    );
\rAccum[7]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(2),
      I1 => \rAccumProduct_reg__1\(50),
      O => \rAccum[7]_i_7_n_0\
    );
\rAccum[7]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(1),
      I1 => \rAccumProduct_reg__1\(49),
      O => \rAccum[7]_i_8_n_0\
    );
\rAccum[7]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rRefined3(0),
      I1 => \rAccumProduct_reg__1\(48),
      O => \rAccum[7]_i_9_n_0\
    );
\rAccum_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[15]_i_1_n_13\,
      Q => L(10),
      R => '0'
    );
\rAccum_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[15]_i_1_n_12\,
      Q => L(11),
      R => '0'
    );
\rAccum_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[15]_i_1_n_11\,
      Q => L(12),
      R => '0'
    );
\rAccum_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[15]_i_1_n_10\,
      Q => L(13),
      R => '0'
    );
\rAccum_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[15]_i_1_n_9\,
      Q => L(14),
      R => '0'
    );
\rAccum_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[15]_i_1_n_8\,
      Q => L(15),
      R => '0'
    );
\rAccum_reg[15]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \rAccum_reg[7]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \rAccum_reg[15]_i_1_n_0\,
      CO(6) => \rAccum_reg[15]_i_1_n_1\,
      CO(5) => \rAccum_reg[15]_i_1_n_2\,
      CO(4) => \rAccum_reg[15]_i_1_n_3\,
      CO(3) => \rAccum_reg[15]_i_1_n_4\,
      CO(2) => \rAccum_reg[15]_i_1_n_5\,
      CO(1) => \rAccum_reg[15]_i_1_n_6\,
      CO(0) => \rAccum_reg[15]_i_1_n_7\,
      DI(7 downto 0) => rRefined3(15 downto 8),
      O(7) => \rAccum_reg[15]_i_1_n_8\,
      O(6) => \rAccum_reg[15]_i_1_n_9\,
      O(5) => \rAccum_reg[15]_i_1_n_10\,
      O(4) => \rAccum_reg[15]_i_1_n_11\,
      O(3) => \rAccum_reg[15]_i_1_n_12\,
      O(2) => \rAccum_reg[15]_i_1_n_13\,
      O(1) => \rAccum_reg[15]_i_1_n_14\,
      O(0) => \rAccum_reg[15]_i_1_n_15\,
      S(7) => \rAccum[15]_i_2_n_0\,
      S(6) => \rAccum[15]_i_3_n_0\,
      S(5) => \rAccum[15]_i_4_n_0\,
      S(4) => \rAccum[15]_i_5_n_0\,
      S(3) => \rAccum[15]_i_6_n_0\,
      S(2) => \rAccum[15]_i_7_n_0\,
      S(1) => \rAccum[15]_i_8_n_0\,
      S(0) => \rAccum[15]_i_9_n_0\
    );
\rAccum_reg[15]_i_10\: unisim.vcomponents.CARRY8
     port map (
      CI => \rAccum_reg[7]_i_10_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_rAccum_reg[15]_i_10_CO_UNCONNECTED\(7),
      CO(6) => \rAccum_reg[15]_i_10_n_1\,
      CO(5) => \rAccum_reg[15]_i_10_n_2\,
      CO(4) => \rAccum_reg[15]_i_10_n_3\,
      CO(3) => \rAccum_reg[15]_i_10_n_4\,
      CO(2) => \rAccum_reg[15]_i_10_n_5\,
      CO(1) => \rAccum_reg[15]_i_10_n_6\,
      CO(0) => \rAccum_reg[15]_i_10_n_7\,
      DI(7) => '0',
      DI(6) => \rAccumProduct_reg__0_n_60\,
      DI(5) => \rAccumProduct_reg__0_n_61\,
      DI(4) => \rAccumProduct_reg__0_n_62\,
      DI(3) => \rAccumProduct_reg__0_n_63\,
      DI(2) => \rAccumProduct_reg__0_n_64\,
      DI(1) => \rAccumProduct_reg__0_n_65\,
      DI(0) => \rAccumProduct_reg__0_n_66\,
      O(7 downto 0) => \rAccumProduct_reg__1\(63 downto 56),
      S(7) => \rAccum[15]_i_11_n_0\,
      S(6) => \rAccum[15]_i_12_n_0\,
      S(5) => \rAccum[15]_i_13_n_0\,
      S(4) => \rAccum[15]_i_14_n_0\,
      S(3) => \rAccum[15]_i_15_n_0\,
      S(2) => \rAccum[15]_i_16_n_0\,
      S(1) => \rAccum[15]_i_17_n_0\,
      S(0) => \rAccum[15]_i_18_n_0\
    );
\rAccum_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[23]_i_1_n_15\,
      Q => L(16),
      R => '0'
    );
\rAccum_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[23]_i_1_n_14\,
      Q => L(17),
      R => '0'
    );
\rAccum_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[23]_i_1_n_13\,
      Q => L(18),
      R => '0'
    );
\rAccum_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[23]_i_1_n_12\,
      Q => L(19),
      R => '0'
    );
\rAccum_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[23]_i_1_n_11\,
      Q => L(20),
      R => '0'
    );
\rAccum_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[23]_i_1_n_10\,
      Q => L(21),
      R => '0'
    );
\rAccum_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[23]_i_1_n_9\,
      Q => L(22),
      R => '0'
    );
\rAccum_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[23]_i_1_n_8\,
      Q => L(23),
      R => '0'
    );
\rAccum_reg[23]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \rAccum_reg[15]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \rAccum_reg[23]_i_1_n_0\,
      CO(6) => \rAccum_reg[23]_i_1_n_1\,
      CO(5) => \rAccum_reg[23]_i_1_n_2\,
      CO(4) => \rAccum_reg[23]_i_1_n_3\,
      CO(3) => \rAccum_reg[23]_i_1_n_4\,
      CO(2) => \rAccum_reg[23]_i_1_n_5\,
      CO(1) => \rAccum_reg[23]_i_1_n_6\,
      CO(0) => \rAccum_reg[23]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \rAccum_reg[23]_i_1_n_8\,
      O(6) => \rAccum_reg[23]_i_1_n_9\,
      O(5) => \rAccum_reg[23]_i_1_n_10\,
      O(4) => \rAccum_reg[23]_i_1_n_11\,
      O(3) => \rAccum_reg[23]_i_1_n_12\,
      O(2) => \rAccum_reg[23]_i_1_n_13\,
      O(1) => \rAccum_reg[23]_i_1_n_14\,
      O(0) => \rAccum_reg[23]_i_1_n_15\,
      S(7 downto 0) => rRefined3(23 downto 16)
    );
\rAccum_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[30]_i_2_n_15\,
      Q => L(24),
      R => '0'
    );
\rAccum_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[30]_i_2_n_14\,
      Q => L(25),
      R => '0'
    );
\rAccum_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[30]_i_2_n_13\,
      Q => L(26),
      R => '0'
    );
\rAccum_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[30]_i_2_n_12\,
      Q => L(27),
      R => '0'
    );
\rAccum_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[30]_i_2_n_11\,
      Q => L(28),
      R => '0'
    );
\rAccum_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[30]_i_2_n_10\,
      Q => L(29),
      R => '0'
    );
\rAccum_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[30]_i_2_n_9\,
      Q => L(30),
      R => '0'
    );
\rAccum_reg[30]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => \rAccum_reg[23]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 6) => \NLW_rAccum_reg[30]_i_2_CO_UNCONNECTED\(7 downto 6),
      CO(5) => \rAccum_reg[30]_i_2_n_2\,
      CO(4) => \rAccum_reg[30]_i_2_n_3\,
      CO(3) => \rAccum_reg[30]_i_2_n_4\,
      CO(2) => \rAccum_reg[30]_i_2_n_5\,
      CO(1) => \rAccum_reg[30]_i_2_n_6\,
      CO(0) => \rAccum_reg[30]_i_2_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7) => \NLW_rAccum_reg[30]_i_2_O_UNCONNECTED\(7),
      O(6) => \rAccum_reg[30]_i_2_n_9\,
      O(5) => \rAccum_reg[30]_i_2_n_10\,
      O(4) => \rAccum_reg[30]_i_2_n_11\,
      O(3) => \rAccum_reg[30]_i_2_n_12\,
      O(2) => \rAccum_reg[30]_i_2_n_13\,
      O(1) => \rAccum_reg[30]_i_2_n_14\,
      O(0) => \rAccum_reg[30]_i_2_n_15\,
      S(7) => '0',
      S(6 downto 0) => rRefined3(30 downto 24)
    );
\rAccum_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[7]_i_1_n_9\,
      Q => L(6),
      R => '0'
    );
\rAccum_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[7]_i_1_n_8\,
      Q => L(7),
      R => '0'
    );
\rAccum_reg[7]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \rAccum_reg[7]_i_1_n_0\,
      CO(6) => \rAccum_reg[7]_i_1_n_1\,
      CO(5) => \rAccum_reg[7]_i_1_n_2\,
      CO(4) => \rAccum_reg[7]_i_1_n_3\,
      CO(3) => \rAccum_reg[7]_i_1_n_4\,
      CO(2) => \rAccum_reg[7]_i_1_n_5\,
      CO(1) => \rAccum_reg[7]_i_1_n_6\,
      CO(0) => \rAccum_reg[7]_i_1_n_7\,
      DI(7 downto 0) => rRefined3(7 downto 0),
      O(7) => \rAccum_reg[7]_i_1_n_8\,
      O(6) => \rAccum_reg[7]_i_1_n_9\,
      O(5 downto 0) => \NLW_rAccum_reg[7]_i_1_O_UNCONNECTED\(5 downto 0),
      S(7) => \rAccum[7]_i_2_n_0\,
      S(6) => \rAccum[7]_i_3_n_0\,
      S(5) => \rAccum[7]_i_4_n_0\,
      S(4) => \rAccum[7]_i_5_n_0\,
      S(3) => \rAccum[7]_i_6_n_0\,
      S(2) => \rAccum[7]_i_7_n_0\,
      S(1) => \rAccum[7]_i_8_n_0\,
      S(0) => \rAccum[7]_i_9_n_0\
    );
\rAccum_reg[7]_i_10\: unisim.vcomponents.CARRY8
     port map (
      CI => \rAccum_reg[7]_i_11_n_0\,
      CI_TOP => '0',
      CO(7) => \rAccum_reg[7]_i_10_n_0\,
      CO(6) => \rAccum_reg[7]_i_10_n_1\,
      CO(5) => \rAccum_reg[7]_i_10_n_2\,
      CO(4) => \rAccum_reg[7]_i_10_n_3\,
      CO(3) => \rAccum_reg[7]_i_10_n_4\,
      CO(2) => \rAccum_reg[7]_i_10_n_5\,
      CO(1) => \rAccum_reg[7]_i_10_n_6\,
      CO(0) => \rAccum_reg[7]_i_10_n_7\,
      DI(7) => \rAccumProduct_reg__0_n_67\,
      DI(6) => \rAccumProduct_reg__0_n_68\,
      DI(5) => \rAccumProduct_reg__0_n_69\,
      DI(4) => \rAccumProduct_reg__0_n_70\,
      DI(3) => \rAccumProduct_reg__0_n_71\,
      DI(2) => \rAccumProduct_reg__0_n_72\,
      DI(1) => \rAccumProduct_reg__0_n_73\,
      DI(0) => \rAccumProduct_reg__0_n_74\,
      O(7 downto 0) => \rAccumProduct_reg__1\(55 downto 48),
      S(7) => \rAccum[7]_i_12_n_0\,
      S(6) => \rAccum[7]_i_13_n_0\,
      S(5) => \rAccum[7]_i_14_n_0\,
      S(4) => \rAccum[7]_i_15_n_0\,
      S(3) => \rAccum[7]_i_16_n_0\,
      S(2) => \rAccum[7]_i_17_n_0\,
      S(1) => \rAccum[7]_i_18_n_0\,
      S(0) => \rAccum[7]_i_19_n_0\
    );
\rAccum_reg[7]_i_11\: unisim.vcomponents.CARRY8
     port map (
      CI => \rAccum_reg[7]_i_20_n_0\,
      CI_TOP => '0',
      CO(7) => \rAccum_reg[7]_i_11_n_0\,
      CO(6) => \rAccum_reg[7]_i_11_n_1\,
      CO(5) => \rAccum_reg[7]_i_11_n_2\,
      CO(4) => \rAccum_reg[7]_i_11_n_3\,
      CO(3) => \rAccum_reg[7]_i_11_n_4\,
      CO(2) => \rAccum_reg[7]_i_11_n_5\,
      CO(1) => \rAccum_reg[7]_i_11_n_6\,
      CO(0) => \rAccum_reg[7]_i_11_n_7\,
      DI(7) => \rAccumProduct_reg__0_n_75\,
      DI(6) => \rAccumProduct_reg__0_n_76\,
      DI(5) => \rAccumProduct_reg__0_n_77\,
      DI(4) => \rAccumProduct_reg__0_n_78\,
      DI(3) => \rAccumProduct_reg__0_n_79\,
      DI(2) => \rAccumProduct_reg__0_n_80\,
      DI(1) => \rAccumProduct_reg__0_n_81\,
      DI(0) => \rAccumProduct_reg__0_n_82\,
      O(7 downto 0) => \NLW_rAccum_reg[7]_i_11_O_UNCONNECTED\(7 downto 0),
      S(7) => \rAccum[7]_i_21_n_0\,
      S(6) => \rAccum[7]_i_22_n_0\,
      S(5) => \rAccum[7]_i_23_n_0\,
      S(4) => \rAccum[7]_i_24_n_0\,
      S(3) => \rAccum[7]_i_25_n_0\,
      S(2) => \rAccum[7]_i_26_n_0\,
      S(1) => \rAccum[7]_i_27_n_0\,
      S(0) => \rAccum[7]_i_28_n_0\
    );
\rAccum_reg[7]_i_20\: unisim.vcomponents.CARRY8
     port map (
      CI => \rAccum_reg[7]_i_29_n_0\,
      CI_TOP => '0',
      CO(7) => \rAccum_reg[7]_i_20_n_0\,
      CO(6) => \rAccum_reg[7]_i_20_n_1\,
      CO(5) => \rAccum_reg[7]_i_20_n_2\,
      CO(4) => \rAccum_reg[7]_i_20_n_3\,
      CO(3) => \rAccum_reg[7]_i_20_n_4\,
      CO(2) => \rAccum_reg[7]_i_20_n_5\,
      CO(1) => \rAccum_reg[7]_i_20_n_6\,
      CO(0) => \rAccum_reg[7]_i_20_n_7\,
      DI(7) => \rAccumProduct_reg__0_n_83\,
      DI(6) => \rAccumProduct_reg__0_n_84\,
      DI(5) => \rAccumProduct_reg__0_n_85\,
      DI(4) => \rAccumProduct_reg__0_n_86\,
      DI(3) => \rAccumProduct_reg__0_n_87\,
      DI(2) => \rAccumProduct_reg__0_n_88\,
      DI(1) => \rAccumProduct_reg__0_n_89\,
      DI(0) => \rAccumProduct_reg__0_n_90\,
      O(7 downto 0) => \NLW_rAccum_reg[7]_i_20_O_UNCONNECTED\(7 downto 0),
      S(7) => \rAccum[7]_i_30_n_0\,
      S(6) => \rAccum[7]_i_31_n_0\,
      S(5) => \rAccum[7]_i_32_n_0\,
      S(4) => \rAccum[7]_i_33_n_0\,
      S(3) => \rAccum[7]_i_34_n_0\,
      S(2) => \rAccum[7]_i_35_n_0\,
      S(1) => \rAccum[7]_i_36_n_0\,
      S(0) => \rAccum[7]_i_37_n_0\
    );
\rAccum_reg[7]_i_29\: unisim.vcomponents.CARRY8
     port map (
      CI => \rAccum_reg[7]_i_38_n_0\,
      CI_TOP => '0',
      CO(7) => \rAccum_reg[7]_i_29_n_0\,
      CO(6) => \rAccum_reg[7]_i_29_n_1\,
      CO(5) => \rAccum_reg[7]_i_29_n_2\,
      CO(4) => \rAccum_reg[7]_i_29_n_3\,
      CO(3) => \rAccum_reg[7]_i_29_n_4\,
      CO(2) => \rAccum_reg[7]_i_29_n_5\,
      CO(1) => \rAccum_reg[7]_i_29_n_6\,
      CO(0) => \rAccum_reg[7]_i_29_n_7\,
      DI(7) => \rAccumProduct_reg__0_n_91\,
      DI(6) => \rAccumProduct_reg__0_n_92\,
      DI(5) => \rAccumProduct_reg__0_n_93\,
      DI(4) => \rAccumProduct_reg__0_n_94\,
      DI(3) => \rAccumProduct_reg__0_n_95\,
      DI(2) => \rAccumProduct_reg__0_n_96\,
      DI(1) => \rAccumProduct_reg__0_n_97\,
      DI(0) => \rAccumProduct_reg__0_n_98\,
      O(7 downto 0) => \NLW_rAccum_reg[7]_i_29_O_UNCONNECTED\(7 downto 0),
      S(7) => \rAccum[7]_i_39_n_0\,
      S(6) => \rAccum[7]_i_40_n_0\,
      S(5) => \rAccum[7]_i_41_n_0\,
      S(4) => \rAccum[7]_i_42_n_0\,
      S(3) => \rAccum[7]_i_43_n_0\,
      S(2) => \rAccum[7]_i_44_n_0\,
      S(1) => \rAccum[7]_i_45_n_0\,
      S(0) => \rAccum[7]_i_46_n_0\
    );
\rAccum_reg[7]_i_38\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \rAccum_reg[7]_i_38_n_0\,
      CO(6) => \rAccum_reg[7]_i_38_n_1\,
      CO(5) => \rAccum_reg[7]_i_38_n_2\,
      CO(4) => \rAccum_reg[7]_i_38_n_3\,
      CO(3) => \rAccum_reg[7]_i_38_n_4\,
      CO(2) => \rAccum_reg[7]_i_38_n_5\,
      CO(1) => \rAccum_reg[7]_i_38_n_6\,
      CO(0) => \rAccum_reg[7]_i_38_n_7\,
      DI(7) => \rAccumProduct_reg__0_n_99\,
      DI(6) => \rAccumProduct_reg__0_n_100\,
      DI(5) => \rAccumProduct_reg__0_n_101\,
      DI(4) => \rAccumProduct_reg__0_n_102\,
      DI(3) => \rAccumProduct_reg__0_n_103\,
      DI(2) => \rAccumProduct_reg__0_n_104\,
      DI(1) => \rAccumProduct_reg__0_n_105\,
      DI(0) => '0',
      O(7 downto 0) => \NLW_rAccum_reg[7]_i_38_O_UNCONNECTED\(7 downto 0),
      S(7) => \rAccum[7]_i_47_n_0\,
      S(6) => \rAccum[7]_i_48_n_0\,
      S(5) => \rAccum[7]_i_49_n_0\,
      S(4) => \rAccum[7]_i_50_n_0\,
      S(3) => \rAccum[7]_i_51_n_0\,
      S(2) => \rAccum[7]_i_52_n_0\,
      S(1) => \rAccum[7]_i_53_n_0\,
      S(0) => \rAccumProduct_reg[16]__0_n_0\
    );
\rAccum_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[15]_i_1_n_15\,
      Q => L(8),
      R => '0'
    );
\rAccum_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rAccum0,
      D => \rAccum_reg[15]_i_1_n_14\,
      Q => L(9),
      R => '0'
    );
\rInitialGuess00_inferred__0/i__carry\: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => \rInitialGuess00_inferred__0/i__carry_n_0\,
      CO(6) => \rInitialGuess00_inferred__0/i__carry_n_1\,
      CO(5) => \rInitialGuess00_inferred__0/i__carry_n_2\,
      CO(4) => \rInitialGuess00_inferred__0/i__carry_n_3\,
      CO(3) => \rInitialGuess00_inferred__0/i__carry_n_4\,
      CO(2) => \rInitialGuess00_inferred__0/i__carry_n_5\,
      CO(1) => \rInitialGuess00_inferred__0/i__carry_n_6\,
      CO(0) => \rInitialGuess00_inferred__0/i__carry_n_7\,
      DI(7 downto 0) => rcpLookupOffset1(7 downto 0),
      O(7 downto 0) => rInitialGuess000_in(7 downto 0),
      S(7) => \i__carry_i_1_n_0\,
      S(6) => \i__carry_i_2_n_0\,
      S(5) => \i__carry_i_3_n_0\,
      S(4) => \i__carry_i_4_n_0\,
      S(3) => \i__carry_i_5_n_0\,
      S(2) => \i__carry_i_6_n_0\,
      S(1) => \i__carry_i_7_n_0\,
      S(0) => \i__carry_i_8_n_0\
    );
\rInitialGuess00_inferred__0/i__carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => \rInitialGuess00_inferred__0/i__carry_n_0\,
      CI_TOP => '0',
      CO(7) => \NLW_rInitialGuess00_inferred__0/i__carry__0_CO_UNCONNECTED\(7),
      CO(6) => \rInitialGuess00_inferred__0/i__carry__0_n_1\,
      CO(5) => \rInitialGuess00_inferred__0/i__carry__0_n_2\,
      CO(4) => \rInitialGuess00_inferred__0/i__carry__0_n_3\,
      CO(3) => \rInitialGuess00_inferred__0/i__carry__0_n_4\,
      CO(2) => \rInitialGuess00_inferred__0/i__carry__0_n_5\,
      CO(1) => \rInitialGuess00_inferred__0/i__carry__0_n_6\,
      CO(0) => \rInitialGuess00_inferred__0/i__carry__0_n_7\,
      DI(7) => '0',
      DI(6 downto 0) => rcpLookupOffset1(14 downto 8),
      O(7 downto 0) => rInitialGuess000_in(15 downto 8),
      S(7) => \i__carry__0_i_1_n_0\,
      S(6) => \i__carry__0_i_2_n_0\,
      S(5) => \i__carry__0_i_3_n_0\,
      S(4) => \i__carry__0_i_4_n_0\,
      S(3) => \i__carry__0_i_5_n_0\,
      S(2) => \i__carry__0_i_6_n_0\,
      S(1) => \i__carry__0_i_7_n_0\,
      S(0) => \i__carry__0_i_8_n_0\
    );
\rInitialGuess0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(0),
      Q => rInitialGuess0(0),
      R => '0'
    );
\rInitialGuess0_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(10),
      Q => rInitialGuess0(10),
      R => '0'
    );
\rInitialGuess0_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(11),
      Q => rInitialGuess0(11),
      R => '0'
    );
\rInitialGuess0_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(12),
      Q => rInitialGuess0(12),
      R => '0'
    );
\rInitialGuess0_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(13),
      Q => rInitialGuess0(13),
      R => '0'
    );
\rInitialGuess0_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(14),
      Q => rInitialGuess0(14),
      R => '0'
    );
\rInitialGuess0_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(15),
      Q => rInitialGuess0(15),
      R => '0'
    );
\rInitialGuess0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(1),
      Q => rInitialGuess0(1),
      R => '0'
    );
\rInitialGuess0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(2),
      Q => rInitialGuess0(2),
      R => '0'
    );
\rInitialGuess0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(3),
      Q => rInitialGuess0(3),
      R => '0'
    );
\rInitialGuess0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(4),
      Q => rInitialGuess0(4),
      R => '0'
    );
\rInitialGuess0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(5),
      Q => rInitialGuess0(5),
      R => '0'
    );
\rInitialGuess0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(6),
      Q => rInitialGuess0(6),
      R => '0'
    );
\rInitialGuess0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(7),
      Q => rInitialGuess0(7),
      R => '0'
    );
\rInitialGuess0_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(8),
      Q => rInitialGuess0(8),
      R => '0'
    );
\rInitialGuess0_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rInitialGuess00,
      D => rInitialGuess000_in(9),
      Q => rInitialGuess0(9),
      R => '0'
    );
\rInitialGuess1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(0),
      Q => rInitialGuess1(0),
      R => '0'
    );
\rInitialGuess1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(10),
      Q => rInitialGuess1(10),
      R => '0'
    );
\rInitialGuess1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(11),
      Q => rInitialGuess1(11),
      R => '0'
    );
\rInitialGuess1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(12),
      Q => rInitialGuess1(12),
      R => '0'
    );
\rInitialGuess1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(13),
      Q => rInitialGuess1(13),
      R => '0'
    );
\rInitialGuess1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(14),
      Q => rInitialGuess1(14),
      R => '0'
    );
\rInitialGuess1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(15),
      Q => rInitialGuess1(15),
      R => '0'
    );
\rInitialGuess1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(1),
      Q => rInitialGuess1(1),
      R => '0'
    );
\rInitialGuess1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(2),
      Q => rInitialGuess1(2),
      R => '0'
    );
\rInitialGuess1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(3),
      Q => rInitialGuess1(3),
      R => '0'
    );
\rInitialGuess1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(4),
      Q => rInitialGuess1(4),
      R => '0'
    );
\rInitialGuess1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(5),
      Q => rInitialGuess1(5),
      R => '0'
    );
\rInitialGuess1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(6),
      Q => rInitialGuess1(6),
      R => '0'
    );
\rInitialGuess1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(7),
      Q => rInitialGuess1(7),
      R => '0'
    );
\rInitialGuess1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(8),
      Q => rInitialGuess1(8),
      R => '0'
    );
\rInitialGuess1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => rInitialGuess0(9),
      Q => rInitialGuess1(9),
      R => '0'
    );
\rInitialGuess2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(0),
      Q => rInitialGuess2(0),
      R => '0'
    );
\rInitialGuess2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(10),
      Q => rInitialGuess2(10),
      R => '0'
    );
\rInitialGuess2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(11),
      Q => rInitialGuess2(11),
      R => '0'
    );
\rInitialGuess2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(12),
      Q => rInitialGuess2(12),
      R => '0'
    );
\rInitialGuess2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(13),
      Q => rInitialGuess2(13),
      R => '0'
    );
\rInitialGuess2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(14),
      Q => rInitialGuess2(14),
      R => '0'
    );
\rInitialGuess2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(15),
      Q => rInitialGuess2(15),
      R => '0'
    );
\rInitialGuess2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(1),
      Q => rInitialGuess2(1),
      R => '0'
    );
\rInitialGuess2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(2),
      Q => rInitialGuess2(2),
      R => '0'
    );
\rInitialGuess2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(3),
      Q => rInitialGuess2(3),
      R => '0'
    );
\rInitialGuess2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(4),
      Q => rInitialGuess2(4),
      R => '0'
    );
\rInitialGuess2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(5),
      Q => rInitialGuess2(5),
      R => '0'
    );
\rInitialGuess2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(6),
      Q => rInitialGuess2(6),
      R => '0'
    );
\rInitialGuess2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(7),
      Q => rInitialGuess2(7),
      R => '0'
    );
\rInitialGuess2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(8),
      Q => rInitialGuess2(8),
      R => '0'
    );
\rInitialGuess2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSigma00,
      D => rInitialGuess1(9),
      Q => rInitialGuess2(9),
      R => '0'
    );
\rInitialGuess3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(0),
      Q => rInitialGuess3(0),
      R => '0'
    );
\rInitialGuess3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(10),
      Q => rInitialGuess3(10),
      R => '0'
    );
\rInitialGuess3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(11),
      Q => rInitialGuess3(11),
      R => '0'
    );
\rInitialGuess3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(12),
      Q => rInitialGuess3(12),
      R => '0'
    );
\rInitialGuess3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(13),
      Q => rInitialGuess3(13),
      R => '0'
    );
\rInitialGuess3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(14),
      Q => rInitialGuess3(14),
      R => '0'
    );
\rInitialGuess3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(15),
      Q => rInitialGuess3(15),
      R => '0'
    );
\rInitialGuess3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(1),
      Q => rInitialGuess3(1),
      R => '0'
    );
\rInitialGuess3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(2),
      Q => rInitialGuess3(2),
      R => '0'
    );
\rInitialGuess3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(3),
      Q => rInitialGuess3(3),
      R => '0'
    );
\rInitialGuess3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(4),
      Q => rInitialGuess3(4),
      R => '0'
    );
\rInitialGuess3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(5),
      Q => rInitialGuess3(5),
      R => '0'
    );
\rInitialGuess3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(6),
      Q => rInitialGuess3(6),
      R => '0'
    );
\rInitialGuess3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(7),
      Q => rInitialGuess3(7),
      R => '0'
    );
\rInitialGuess3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(8),
      Q => rInitialGuess3(8),
      R => '0'
    );
\rInitialGuess3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rProduct0__0\,
      D => rInitialGuess2(9),
      Q => rInitialGuess3(9),
      R => '0'
    );
rProduct0: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 2,
      BMULTSEL => "B",
      BREG => 2,
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
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => \not\(16 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_rProduct0_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 16) => B"00",
      B(15 downto 0) => rInitialGuess0(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_rProduct0_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_rProduct0_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_rProduct0_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => rcpSigma00,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => \sigma0TempProduct0__0\,
      CEB2 => rcpSigma00,
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
      MULTSIGNOUT => NLW_rProduct0_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_rProduct0_OVERFLOW_UNCONNECTED,
      P(47) => rProduct0_n_58,
      P(46) => rProduct0_n_59,
      P(45) => rProduct0_n_60,
      P(44) => rProduct0_n_61,
      P(43) => rProduct0_n_62,
      P(42) => rProduct0_n_63,
      P(41) => rProduct0_n_64,
      P(40) => rProduct0_n_65,
      P(39) => rProduct0_n_66,
      P(38) => rProduct0_n_67,
      P(37) => rProduct0_n_68,
      P(36) => rProduct0_n_69,
      P(35) => rProduct0_n_70,
      P(34) => rProduct0_n_71,
      P(33) => rProduct0_n_72,
      P(32) => rProduct0_n_73,
      P(31) => rProduct0_n_74,
      P(30) => rProduct0_n_75,
      P(29) => rProduct0_n_76,
      P(28) => rProduct0_n_77,
      P(27) => rProduct0_n_78,
      P(26) => rProduct0_n_79,
      P(25) => rProduct0_n_80,
      P(24) => rProduct0_n_81,
      P(23) => rProduct0_n_82,
      P(22) => rProduct0_n_83,
      P(21) => rProduct0_n_84,
      P(20) => rProduct0_n_85,
      P(19) => rProduct0_n_86,
      P(18) => rProduct0_n_87,
      P(17) => rProduct0_n_88,
      P(16) => rProduct0_n_89,
      P(15) => rProduct0_n_90,
      P(14) => rProduct0_n_91,
      P(13) => rProduct0_n_92,
      P(12) => rProduct0_n_93,
      P(11) => rProduct0_n_94,
      P(10) => rProduct0_n_95,
      P(9) => rProduct0_n_96,
      P(8) => rProduct0_n_97,
      P(7) => rProduct0_n_98,
      P(6) => rProduct0_n_99,
      P(5) => rProduct0_n_100,
      P(4) => rProduct0_n_101,
      P(3) => rProduct0_n_102,
      P(2) => rProduct0_n_103,
      P(1) => rProduct0_n_104,
      P(0) => rProduct0_n_105,
      PATTERNBDETECT => NLW_rProduct0_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_rProduct0_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => rProduct0_n_106,
      PCOUT(46) => rProduct0_n_107,
      PCOUT(45) => rProduct0_n_108,
      PCOUT(44) => rProduct0_n_109,
      PCOUT(43) => rProduct0_n_110,
      PCOUT(42) => rProduct0_n_111,
      PCOUT(41) => rProduct0_n_112,
      PCOUT(40) => rProduct0_n_113,
      PCOUT(39) => rProduct0_n_114,
      PCOUT(38) => rProduct0_n_115,
      PCOUT(37) => rProduct0_n_116,
      PCOUT(36) => rProduct0_n_117,
      PCOUT(35) => rProduct0_n_118,
      PCOUT(34) => rProduct0_n_119,
      PCOUT(33) => rProduct0_n_120,
      PCOUT(32) => rProduct0_n_121,
      PCOUT(31) => rProduct0_n_122,
      PCOUT(30) => rProduct0_n_123,
      PCOUT(29) => rProduct0_n_124,
      PCOUT(28) => rProduct0_n_125,
      PCOUT(27) => rProduct0_n_126,
      PCOUT(26) => rProduct0_n_127,
      PCOUT(25) => rProduct0_n_128,
      PCOUT(24) => rProduct0_n_129,
      PCOUT(23) => rProduct0_n_130,
      PCOUT(22) => rProduct0_n_131,
      PCOUT(21) => rProduct0_n_132,
      PCOUT(20) => rProduct0_n_133,
      PCOUT(19) => rProduct0_n_134,
      PCOUT(18) => rProduct0_n_135,
      PCOUT(17) => rProduct0_n_136,
      PCOUT(16) => rProduct0_n_137,
      PCOUT(15) => rProduct0_n_138,
      PCOUT(14) => rProduct0_n_139,
      PCOUT(13) => rProduct0_n_140,
      PCOUT(12) => rProduct0_n_141,
      PCOUT(11) => rProduct0_n_142,
      PCOUT(10) => rProduct0_n_143,
      PCOUT(9) => rProduct0_n_144,
      PCOUT(8) => rProduct0_n_145,
      PCOUT(7) => rProduct0_n_146,
      PCOUT(6) => rProduct0_n_147,
      PCOUT(5) => rProduct0_n_148,
      PCOUT(4) => rProduct0_n_149,
      PCOUT(3) => rProduct0_n_150,
      PCOUT(2) => rProduct0_n_151,
      PCOUT(1) => rProduct0_n_152,
      PCOUT(0) => rProduct0_n_153,
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
      UNDERFLOW => NLW_rProduct0_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_rProduct0_XOROUT_UNCONNECTED(7 downto 0)
    );
rProduct_reg: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 2,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 2,
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
      A(29 downto 16) => B"00000000000000",
      A(15 downto 0) => rInitialGuess0(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_rProduct_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 15) => B"000",
      B(14 downto 0) => \not\(31 downto 17),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_rProduct_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_rProduct_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_rProduct_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => \sigma0TempProduct0__0\,
      CEA2 => rcpSigma00,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => rcpSigma00,
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => \rProduct0__0\,
      CLK => clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_rProduct_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"001010101",
      OVERFLOW => NLW_rProduct_reg_OVERFLOW_UNCONNECTED,
      P(47) => rProduct_reg_n_58,
      P(46) => rProduct_reg_n_59,
      P(45) => rProduct_reg_n_60,
      P(44) => rProduct_reg_n_61,
      P(43) => rProduct_reg_n_62,
      P(42) => rProduct_reg_n_63,
      P(41) => rProduct_reg_n_64,
      P(40) => rProduct_reg_n_65,
      P(39) => rProduct_reg_n_66,
      P(38) => rProduct_reg_n_67,
      P(37) => rProduct_reg_n_68,
      P(36) => rProduct_reg_n_69,
      P(35) => rProduct_reg_n_70,
      P(34) => rProduct_reg_n_71,
      P(33) => rProduct_reg_n_72,
      P(32) => rProduct_reg_n_73,
      P(31) => rProduct_reg_n_74,
      P(30 downto 7) => \rProduct_reg__0\(47 downto 24),
      P(6) => rProduct_reg_n_99,
      P(5) => rProduct_reg_n_100,
      P(4) => rProduct_reg_n_101,
      P(3) => rProduct_reg_n_102,
      P(2) => rProduct_reg_n_103,
      P(1) => rProduct_reg_n_104,
      P(0) => rProduct_reg_n_105,
      PATTERNBDETECT => NLW_rProduct_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_rProduct_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => rProduct0_n_106,
      PCIN(46) => rProduct0_n_107,
      PCIN(45) => rProduct0_n_108,
      PCIN(44) => rProduct0_n_109,
      PCIN(43) => rProduct0_n_110,
      PCIN(42) => rProduct0_n_111,
      PCIN(41) => rProduct0_n_112,
      PCIN(40) => rProduct0_n_113,
      PCIN(39) => rProduct0_n_114,
      PCIN(38) => rProduct0_n_115,
      PCIN(37) => rProduct0_n_116,
      PCIN(36) => rProduct0_n_117,
      PCIN(35) => rProduct0_n_118,
      PCIN(34) => rProduct0_n_119,
      PCIN(33) => rProduct0_n_120,
      PCIN(32) => rProduct0_n_121,
      PCIN(31) => rProduct0_n_122,
      PCIN(30) => rProduct0_n_123,
      PCIN(29) => rProduct0_n_124,
      PCIN(28) => rProduct0_n_125,
      PCIN(27) => rProduct0_n_126,
      PCIN(26) => rProduct0_n_127,
      PCIN(25) => rProduct0_n_128,
      PCIN(24) => rProduct0_n_129,
      PCIN(23) => rProduct0_n_130,
      PCIN(22) => rProduct0_n_131,
      PCIN(21) => rProduct0_n_132,
      PCIN(20) => rProduct0_n_133,
      PCIN(19) => rProduct0_n_134,
      PCIN(18) => rProduct0_n_135,
      PCIN(17) => rProduct0_n_136,
      PCIN(16) => rProduct0_n_137,
      PCIN(15) => rProduct0_n_138,
      PCIN(14) => rProduct0_n_139,
      PCIN(13) => rProduct0_n_140,
      PCIN(12) => rProduct0_n_141,
      PCIN(11) => rProduct0_n_142,
      PCIN(10) => rProduct0_n_143,
      PCIN(9) => rProduct0_n_144,
      PCIN(8) => rProduct0_n_145,
      PCIN(7) => rProduct0_n_146,
      PCIN(6) => rProduct0_n_147,
      PCIN(5) => rProduct0_n_148,
      PCIN(4) => rProduct0_n_149,
      PCIN(3) => rProduct0_n_150,
      PCIN(2) => rProduct0_n_151,
      PCIN(1) => rProduct0_n_152,
      PCIN(0) => rProduct0_n_153,
      PCOUT(47 downto 0) => NLW_rProduct_reg_PCOUT_UNCONNECTED(47 downto 0),
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
      UNDERFLOW => NLW_rProduct_reg_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_rProduct_reg_XOROUT_UNCONNECTED(7 downto 0)
    );
rProduct_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[5][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[5][useEarlyOutBypass_n_0_]\,
      O => \rProduct0__0\
    );
\rRefined0[22]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rInitialGuess3(6),
      I1 => \rProduct_reg__0\(46),
      O => \rRefined0[22]_i_2_n_0\
    );
\rRefined0[22]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rInitialGuess3(5),
      I1 => \rProduct_reg__0\(45),
      O => \rRefined0[22]_i_3_n_0\
    );
\rRefined0[22]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rInitialGuess3(4),
      I1 => \rProduct_reg__0\(44),
      O => \rRefined0[22]_i_4_n_0\
    );
\rRefined0[22]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rInitialGuess3(3),
      I1 => \rProduct_reg__0\(43),
      O => \rRefined0[22]_i_5_n_0\
    );
\rRefined0[22]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rInitialGuess3(2),
      I1 => \rProduct_reg__0\(42),
      O => \rRefined0[22]_i_6_n_0\
    );
\rRefined0[22]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rInitialGuess3(1),
      I1 => \rProduct_reg__0\(41),
      O => \rRefined0[22]_i_7_n_0\
    );
\rRefined0[22]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rInitialGuess3(0),
      I1 => \rProduct_reg__0\(40),
      O => \rRefined0[22]_i_8_n_0\
    );
\rRefined0[30]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => rInitialGuess3(7),
      I1 => \rProduct_reg__0\(47),
      O => \rRefined0[30]_i_2_n_0\
    );
\rRefined0[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[6][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[6][useEarlyOutBypass_n_0_]\,
      O => rRefined00
    );
\rRefined0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(24),
      Q => rRefined0(0),
      R => '0'
    );
\rRefined0_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(34),
      Q => rRefined0(10),
      R => '0'
    );
\rRefined0_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(35),
      Q => rRefined0(11),
      R => '0'
    );
\rRefined0_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(36),
      Q => rRefined0(12),
      R => '0'
    );
\rRefined0_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(37),
      Q => rRefined0(13),
      R => '0'
    );
\rRefined0_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(38),
      Q => rRefined0(14),
      R => '0'
    );
\rRefined0_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[22]_i_1_n_15\,
      Q => rRefined0(15),
      R => '0'
    );
\rRefined0_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[22]_i_1_n_14\,
      Q => rRefined0(16),
      R => '0'
    );
\rRefined0_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[22]_i_1_n_13\,
      Q => rRefined0(17),
      R => '0'
    );
\rRefined0_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[22]_i_1_n_12\,
      Q => rRefined0(18),
      R => '0'
    );
\rRefined0_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[22]_i_1_n_11\,
      Q => rRefined0(19),
      R => '0'
    );
\rRefined0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(25),
      Q => rRefined0(1),
      R => '0'
    );
\rRefined0_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[22]_i_1_n_10\,
      Q => rRefined0(20),
      R => '0'
    );
\rRefined0_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[22]_i_1_n_9\,
      Q => rRefined0(21),
      R => '0'
    );
\rRefined0_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[22]_i_1_n_8\,
      Q => rRefined0(22),
      R => '0'
    );
\rRefined0_reg[22]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \rRefined0_reg[22]_i_1_n_0\,
      CO(6) => \rRefined0_reg[22]_i_1_n_1\,
      CO(5) => \rRefined0_reg[22]_i_1_n_2\,
      CO(4) => \rRefined0_reg[22]_i_1_n_3\,
      CO(3) => \rRefined0_reg[22]_i_1_n_4\,
      CO(2) => \rRefined0_reg[22]_i_1_n_5\,
      CO(1) => \rRefined0_reg[22]_i_1_n_6\,
      CO(0) => \rRefined0_reg[22]_i_1_n_7\,
      DI(7 downto 1) => rInitialGuess3(6 downto 0),
      DI(0) => '0',
      O(7) => \rRefined0_reg[22]_i_1_n_8\,
      O(6) => \rRefined0_reg[22]_i_1_n_9\,
      O(5) => \rRefined0_reg[22]_i_1_n_10\,
      O(4) => \rRefined0_reg[22]_i_1_n_11\,
      O(3) => \rRefined0_reg[22]_i_1_n_12\,
      O(2) => \rRefined0_reg[22]_i_1_n_13\,
      O(1) => \rRefined0_reg[22]_i_1_n_14\,
      O(0) => \rRefined0_reg[22]_i_1_n_15\,
      S(7) => \rRefined0[22]_i_2_n_0\,
      S(6) => \rRefined0[22]_i_3_n_0\,
      S(5) => \rRefined0[22]_i_4_n_0\,
      S(4) => \rRefined0[22]_i_5_n_0\,
      S(3) => \rRefined0[22]_i_6_n_0\,
      S(2) => \rRefined0[22]_i_7_n_0\,
      S(1) => \rRefined0[22]_i_8_n_0\,
      S(0) => \rProduct_reg__0\(39)
    );
\rRefined0_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[30]_i_1_n_15\,
      Q => rRefined0(23),
      R => '0'
    );
\rRefined0_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[30]_i_1_n_14\,
      Q => rRefined0(24),
      R => '0'
    );
\rRefined0_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[30]_i_1_n_13\,
      Q => rRefined0(25),
      R => '0'
    );
\rRefined0_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[30]_i_1_n_12\,
      Q => rRefined0(26),
      R => '0'
    );
\rRefined0_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[30]_i_1_n_11\,
      Q => rRefined0(27),
      R => '0'
    );
\rRefined0_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[30]_i_1_n_10\,
      Q => rRefined0(28),
      R => '0'
    );
\rRefined0_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[30]_i_1_n_9\,
      Q => rRefined0(29),
      R => '0'
    );
\rRefined0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(26),
      Q => rRefined0(2),
      R => '0'
    );
\rRefined0_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[30]_i_1_n_8\,
      Q => rRefined0(30),
      R => '0'
    );
\rRefined0_reg[30]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \rRefined0_reg[22]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \rRefined0_reg[30]_i_1_n_0\,
      CO(6) => \rRefined0_reg[30]_i_1_n_1\,
      CO(5) => \rRefined0_reg[30]_i_1_n_2\,
      CO(4) => \rRefined0_reg[30]_i_1_n_3\,
      CO(3) => \rRefined0_reg[30]_i_1_n_4\,
      CO(2) => \rRefined0_reg[30]_i_1_n_5\,
      CO(1) => \rRefined0_reg[30]_i_1_n_6\,
      CO(0) => \rRefined0_reg[30]_i_1_n_7\,
      DI(7 downto 1) => B"0000000",
      DI(0) => rInitialGuess3(7),
      O(7) => \rRefined0_reg[30]_i_1_n_8\,
      O(6) => \rRefined0_reg[30]_i_1_n_9\,
      O(5) => \rRefined0_reg[30]_i_1_n_10\,
      O(4) => \rRefined0_reg[30]_i_1_n_11\,
      O(3) => \rRefined0_reg[30]_i_1_n_12\,
      O(2) => \rRefined0_reg[30]_i_1_n_13\,
      O(1) => \rRefined0_reg[30]_i_1_n_14\,
      O(0) => \rRefined0_reg[30]_i_1_n_15\,
      S(7 downto 1) => rInitialGuess3(14 downto 8),
      S(0) => \rRefined0[30]_i_2_n_0\
    );
\rRefined0_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rRefined0_reg[31]_i_2_n_15\,
      Q => rRefined0(31),
      R => '0'
    );
\rRefined0_reg[31]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => \rRefined0_reg[30]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 0) => \NLW_rRefined0_reg[31]_i_2_CO_UNCONNECTED\(7 downto 0),
      DI(7 downto 0) => B"00000000",
      O(7 downto 1) => \NLW_rRefined0_reg[31]_i_2_O_UNCONNECTED\(7 downto 1),
      O(0) => \rRefined0_reg[31]_i_2_n_15\,
      S(7 downto 1) => B"0000000",
      S(0) => rInitialGuess3(15)
    );
\rRefined0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(27),
      Q => rRefined0(3),
      R => '0'
    );
\rRefined0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(28),
      Q => rRefined0(4),
      R => '0'
    );
\rRefined0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(29),
      Q => rRefined0(5),
      R => '0'
    );
\rRefined0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(30),
      Q => rRefined0(6),
      R => '0'
    );
\rRefined0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(31),
      Q => rRefined0(7),
      R => '0'
    );
\rRefined0_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(32),
      Q => rRefined0(8),
      R => '0'
    );
\rRefined0_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rRefined00,
      D => \rProduct_reg__0\(33),
      Q => rRefined0(9),
      R => '0'
    );
\rRefined1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(0),
      Q => rRefined1(0),
      R => '0'
    );
\rRefined1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(10),
      Q => rRefined1(10),
      R => '0'
    );
\rRefined1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(11),
      Q => rRefined1(11),
      R => '0'
    );
\rRefined1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(12),
      Q => rRefined1(12),
      R => '0'
    );
\rRefined1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(13),
      Q => rRefined1(13),
      R => '0'
    );
\rRefined1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(14),
      Q => rRefined1(14),
      R => '0'
    );
\rRefined1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(15),
      Q => rRefined1(15),
      R => '0'
    );
\rRefined1_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(16),
      Q => rRefined1(16),
      R => '0'
    );
\rRefined1_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(17),
      Q => rRefined1(17),
      R => '0'
    );
\rRefined1_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(18),
      Q => rRefined1(18),
      R => '0'
    );
\rRefined1_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(19),
      Q => rRefined1(19),
      R => '0'
    );
\rRefined1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(1),
      Q => rRefined1(1),
      R => '0'
    );
\rRefined1_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(20),
      Q => rRefined1(20),
      R => '0'
    );
\rRefined1_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(21),
      Q => rRefined1(21),
      R => '0'
    );
\rRefined1_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(22),
      Q => rRefined1(22),
      R => '0'
    );
\rRefined1_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(23),
      Q => rRefined1(23),
      R => '0'
    );
\rRefined1_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(24),
      Q => rRefined1(24),
      R => '0'
    );
\rRefined1_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(25),
      Q => rRefined1(25),
      R => '0'
    );
\rRefined1_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(26),
      Q => rRefined1(26),
      R => '0'
    );
\rRefined1_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(27),
      Q => rRefined1(27),
      R => '0'
    );
\rRefined1_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(28),
      Q => rRefined1(28),
      R => '0'
    );
\rRefined1_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(29),
      Q => rRefined1(29),
      R => '0'
    );
\rRefined1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(2),
      Q => rRefined1(2),
      R => '0'
    );
\rRefined1_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(30),
      Q => rRefined1(30),
      R => '0'
    );
\rRefined1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(3),
      Q => rRefined1(3),
      R => '0'
    );
\rRefined1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(4),
      Q => rRefined1(4),
      R => '0'
    );
\rRefined1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(5),
      Q => rRefined1(5),
      R => '0'
    );
\rRefined1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(6),
      Q => rRefined1(6),
      R => '0'
    );
\rRefined1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(7),
      Q => rRefined1(7),
      R => '0'
    );
\rRefined1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(8),
      Q => rRefined1(8),
      R => '0'
    );
\rRefined1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rRefined0(9),
      Q => rRefined1(9),
      R => '0'
    );
\rRefined2_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(0),
      Q => \rRefined2_reg_n_0_[0]\,
      R => '0'
    );
\rRefined2_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(10),
      Q => \rRefined2_reg_n_0_[10]\,
      R => '0'
    );
\rRefined2_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(11),
      Q => \rRefined2_reg_n_0_[11]\,
      R => '0'
    );
\rRefined2_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(12),
      Q => \rRefined2_reg_n_0_[12]\,
      R => '0'
    );
\rRefined2_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(13),
      Q => \rRefined2_reg_n_0_[13]\,
      R => '0'
    );
\rRefined2_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(14),
      Q => \rRefined2_reg_n_0_[14]\,
      R => '0'
    );
\rRefined2_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(15),
      Q => \rRefined2_reg_n_0_[15]\,
      R => '0'
    );
\rRefined2_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(16),
      Q => \rRefined2_reg_n_0_[16]\,
      R => '0'
    );
\rRefined2_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(17),
      Q => \rRefined2_reg_n_0_[17]\,
      R => '0'
    );
\rRefined2_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(18),
      Q => \rRefined2_reg_n_0_[18]\,
      R => '0'
    );
\rRefined2_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(19),
      Q => \rRefined2_reg_n_0_[19]\,
      R => '0'
    );
\rRefined2_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(1),
      Q => \rRefined2_reg_n_0_[1]\,
      R => '0'
    );
\rRefined2_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(20),
      Q => \rRefined2_reg_n_0_[20]\,
      R => '0'
    );
\rRefined2_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(21),
      Q => \rRefined2_reg_n_0_[21]\,
      R => '0'
    );
\rRefined2_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(22),
      Q => \rRefined2_reg_n_0_[22]\,
      R => '0'
    );
\rRefined2_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(23),
      Q => \rRefined2_reg_n_0_[23]\,
      R => '0'
    );
\rRefined2_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(24),
      Q => \rRefined2_reg_n_0_[24]\,
      R => '0'
    );
\rRefined2_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(25),
      Q => \rRefined2_reg_n_0_[25]\,
      R => '0'
    );
\rRefined2_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(26),
      Q => \rRefined2_reg_n_0_[26]\,
      R => '0'
    );
\rRefined2_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(27),
      Q => \rRefined2_reg_n_0_[27]\,
      R => '0'
    );
\rRefined2_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(28),
      Q => \rRefined2_reg_n_0_[28]\,
      R => '0'
    );
\rRefined2_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(29),
      Q => \rRefined2_reg_n_0_[29]\,
      R => '0'
    );
\rRefined2_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(2),
      Q => \rRefined2_reg_n_0_[2]\,
      R => '0'
    );
\rRefined2_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(30),
      Q => \rRefined2_reg_n_0_[30]\,
      R => '0'
    );
\rRefined2_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(3),
      Q => \rRefined2_reg_n_0_[3]\,
      R => '0'
    );
\rRefined2_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(4),
      Q => \rRefined2_reg_n_0_[4]\,
      R => '0'
    );
\rRefined2_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(5),
      Q => \rRefined2_reg_n_0_[5]\,
      R => '0'
    );
\rRefined2_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(6),
      Q => \rRefined2_reg_n_0_[6]\,
      R => '0'
    );
\rRefined2_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(7),
      Q => \rRefined2_reg_n_0_[7]\,
      R => '0'
    );
\rRefined2_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(8),
      Q => \rRefined2_reg_n_0_[8]\,
      R => '0'
    );
\rRefined2_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpSqrSigma00,
      D => rRefined1(9),
      Q => \rRefined2_reg_n_0_[9]\,
      R => '0'
    );
\rRefined3_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[0]\,
      Q => rRefined3(0),
      R => '0'
    );
\rRefined3_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[10]\,
      Q => rRefined3(10),
      R => '0'
    );
\rRefined3_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[11]\,
      Q => rRefined3(11),
      R => '0'
    );
\rRefined3_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[12]\,
      Q => rRefined3(12),
      R => '0'
    );
\rRefined3_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[13]\,
      Q => rRefined3(13),
      R => '0'
    );
\rRefined3_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[14]\,
      Q => rRefined3(14),
      R => '0'
    );
\rRefined3_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[15]\,
      Q => rRefined3(15),
      R => '0'
    );
\rRefined3_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[16]\,
      Q => rRefined3(16),
      R => '0'
    );
\rRefined3_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[17]\,
      Q => rRefined3(17),
      R => '0'
    );
\rRefined3_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[18]\,
      Q => rRefined3(18),
      R => '0'
    );
\rRefined3_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[19]\,
      Q => rRefined3(19),
      R => '0'
    );
\rRefined3_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[1]\,
      Q => rRefined3(1),
      R => '0'
    );
\rRefined3_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[20]\,
      Q => rRefined3(20),
      R => '0'
    );
\rRefined3_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[21]\,
      Q => rRefined3(21),
      R => '0'
    );
\rRefined3_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[22]\,
      Q => rRefined3(22),
      R => '0'
    );
\rRefined3_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[23]\,
      Q => rRefined3(23),
      R => '0'
    );
\rRefined3_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[24]\,
      Q => rRefined3(24),
      R => '0'
    );
\rRefined3_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[25]\,
      Q => rRefined3(25),
      R => '0'
    );
\rRefined3_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[26]\,
      Q => rRefined3(26),
      R => '0'
    );
\rRefined3_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[27]\,
      Q => rRefined3(27),
      R => '0'
    );
\rRefined3_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[28]\,
      Q => rRefined3(28),
      R => '0'
    );
\rRefined3_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[29]\,
      Q => rRefined3(29),
      R => '0'
    );
\rRefined3_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[2]\,
      Q => rRefined3(2),
      R => '0'
    );
\rRefined3_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[30]\,
      Q => rRefined3(30),
      R => '0'
    );
\rRefined3_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[3]\,
      Q => rRefined3(3),
      R => '0'
    );
\rRefined3_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[4]\,
      Q => rRefined3(4),
      R => '0'
    );
\rRefined3_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[5]\,
      Q => rRefined3(5),
      R => '0'
    );
\rRefined3_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[6]\,
      Q => rRefined3(6),
      R => '0'
    );
\rRefined3_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[7]\,
      Q => rRefined3(7),
      R => '0'
    );
\rRefined3_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[8]\,
      Q => rRefined3(8),
      R => '0'
    );
\rRefined3_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \rAccumProduct0__1\,
      D => \rRefined2_reg_n_0_[9]\,
      Q => rRefined3(9),
      R => '0'
    );
\rcpLookupOffset0[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C512"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Offsets[0]_1\(0)
    );
\rcpLookupOffset0[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B825"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Offsets[0]_1\(10)
    );
\rcpLookupOffset0[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08E7"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Offsets[0]_1\(11)
    );
\rcpLookupOffset0[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7619"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Offsets[0]_1\(12)
    );
\rcpLookupOffset0[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4353"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Offsets[0]_1\(13)
    );
\rcpLookupOffset0[14]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      O => \rcpLookupOffset0[14]_i_1_n_0\
    );
\rcpLookupOffset0[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BFB2"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Offsets[0]_1\(1)
    );
\rcpLookupOffset0[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BC3F"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Offsets[0]_1\(2)
    );
\rcpLookupOffset0[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"05B8"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Offsets[0]_1\(3)
    );
\rcpLookupOffset0[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8EDA"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Offsets[0]_1\(4)
    );
\rcpLookupOffset0[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"3BDC"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Offsets[0]_1\(5)
    );
\rcpLookupOffset0[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1B61"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Offsets[0]_1\(6)
    );
\rcpLookupOffset0[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"203F"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Offsets[0]_1\(7)
    );
\rcpLookupOffset0[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"08F9"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      O => \RcpLookupTable_Offsets[0]_1\(8)
    );
\rcpLookupOffset0[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"765B"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Offsets[0]_1\(9)
    );
\rcpLookupOffset0_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(0),
      Q => rcpLookupOffset0(0),
      R => '0'
    );
\rcpLookupOffset0_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(10),
      Q => rcpLookupOffset0(10),
      R => '0'
    );
\rcpLookupOffset0_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(11),
      Q => rcpLookupOffset0(11),
      R => '0'
    );
\rcpLookupOffset0_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(12),
      Q => rcpLookupOffset0(12),
      R => '0'
    );
\rcpLookupOffset0_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(13),
      Q => rcpLookupOffset0(13),
      R => '0'
    );
\rcpLookupOffset0_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \rcpLookupOffset0[14]_i_1_n_0\,
      Q => rcpLookupOffset0(14),
      R => '0'
    );
\rcpLookupOffset0_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => '1',
      Q => rcpLookupOffset0(15),
      R => '0'
    );
\rcpLookupOffset0_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(1),
      Q => rcpLookupOffset0(1),
      R => '0'
    );
\rcpLookupOffset0_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(2),
      Q => rcpLookupOffset0(2),
      R => '0'
    );
\rcpLookupOffset0_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(3),
      Q => rcpLookupOffset0(3),
      R => '0'
    );
\rcpLookupOffset0_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(4),
      Q => rcpLookupOffset0(4),
      R => '0'
    );
\rcpLookupOffset0_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(5),
      Q => rcpLookupOffset0(5),
      R => '0'
    );
\rcpLookupOffset0_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(6),
      Q => rcpLookupOffset0(6),
      R => '0'
    );
\rcpLookupOffset0_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(7),
      Q => rcpLookupOffset0(7),
      R => '0'
    );
\rcpLookupOffset0_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(8),
      Q => rcpLookupOffset0(8),
      R => '0'
    );
\rcpLookupOffset0_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => rcpLookupSlope0,
      D => \RcpLookupTable_Offsets[0]_1\(9),
      Q => rcpLookupOffset0(9),
      R => '0'
    );
\rcpLookupOffset1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(0),
      Q => rcpLookupOffset1(0),
      R => '0'
    );
\rcpLookupOffset1_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(10),
      Q => rcpLookupOffset1(10),
      R => '0'
    );
\rcpLookupOffset1_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(11),
      Q => rcpLookupOffset1(11),
      R => '0'
    );
\rcpLookupOffset1_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(12),
      Q => rcpLookupOffset1(12),
      R => '0'
    );
\rcpLookupOffset1_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(13),
      Q => rcpLookupOffset1(13),
      R => '0'
    );
\rcpLookupOffset1_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(14),
      Q => rcpLookupOffset1(14),
      R => '0'
    );
\rcpLookupOffset1_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(15),
      Q => rcpLookupOffset1(15),
      R => '0'
    );
\rcpLookupOffset1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(1),
      Q => rcpLookupOffset1(1),
      R => '0'
    );
\rcpLookupOffset1_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(2),
      Q => rcpLookupOffset1(2),
      R => '0'
    );
\rcpLookupOffset1_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(3),
      Q => rcpLookupOffset1(3),
      R => '0'
    );
\rcpLookupOffset1_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(4),
      Q => rcpLookupOffset1(4),
      R => '0'
    );
\rcpLookupOffset1_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(5),
      Q => rcpLookupOffset1(5),
      R => '0'
    );
\rcpLookupOffset1_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(6),
      Q => rcpLookupOffset1(6),
      R => '0'
    );
\rcpLookupOffset1_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(7),
      Q => rcpLookupOffset1(7),
      R => '0'
    );
\rcpLookupOffset1_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(8),
      Q => rcpLookupOffset1(8),
      R => '0'
    );
\rcpLookupOffset1_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => slopeMultiply0,
      D => rcpLookupOffset0(9),
      Q => rcpLookupOffset1(9),
      R => '0'
    );
\rcpPipeline[0][calculatedMantissa][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(0),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => \rcpPipeline[0][calculatedMantissa][0]_i_1_n_0\
    );
\rcpPipeline[0][calculatedMantissa][19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(19),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => \rcpPipeline[0][calculatedMantissa][19]_i_1_n_0\
    );
\rcpPipeline[0][calculatedMantissa][1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(1),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => \rcpPipeline[0][calculatedMantissa][1]_i_1_n_0\
    );
\rcpPipeline[0][calculatedMantissa][20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(20),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => \rcpPipeline[0][calculatedMantissa][20]_i_1_n_0\
    );
\rcpPipeline[0][calculatedMantissa][21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(21),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => \rcpPipeline[0][calculatedMantissa][21]_i_1_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(22),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => \rcpPipeline[0][calculatedMantissa][22]_i_1_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_10\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(16),
      I1 => IN_A(15),
      I2 => IN_A(6),
      I3 => IN_A(17),
      O => \rcpPipeline[0][calculatedMantissa][22]_i_10_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_11\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => IN_A(1),
      I1 => IN_A(2),
      I2 => IN_A(0),
      I3 => IN_A(3),
      O => \rcpPipeline[0][calculatedMantissa][22]_i_11_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_12\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(23),
      I1 => IN_A(25),
      I2 => IN_A(24),
      I3 => IN_A(27),
      O => \rcpPipeline[0][calculatedMantissa][22]_i_12_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_13\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => IN_A(30),
      I1 => IN_A(29),
      I2 => IN_A(28),
      I3 => IN_A(27),
      O => \rcpPipeline[0][calculatedMantissa][22]_i_13_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F7"
    )
        port map (
      I0 => IN_A(29),
      I1 => IN_A(23),
      I2 => \rcpPipeline[0][rcpExponent][0]_i_2_n_0\,
      O => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFEFFFFFFFF"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_6_n_0\,
      I1 => \rcpPipeline[0][calculatedMantissa][22]_i_7_n_0\,
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_8_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_9_n_0\,
      I4 => \rcpPipeline[0][calculatedMantissa][22]_i_10_n_0\,
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_11_n_0\,
      O => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => IN_A(26),
      I1 => IN_A(28),
      I2 => IN_A(29),
      I3 => IN_A(30),
      I4 => \rcpPipeline[0][calculatedMantissa][22]_i_12_n_0\,
      O => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF7FFF"
    )
        port map (
      I0 => IN_A(24),
      I1 => IN_A(23),
      I2 => IN_A(26),
      I3 => IN_A(25),
      I4 => \rcpPipeline[0][calculatedMantissa][22]_i_13_n_0\,
      O => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(20),
      I1 => IN_A(14),
      I2 => IN_A(19),
      I3 => IN_A(13),
      O => \rcpPipeline[0][calculatedMantissa][22]_i_6_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(8),
      I1 => IN_A(7),
      I2 => IN_A(22),
      I3 => IN_A(21),
      O => \rcpPipeline[0][calculatedMantissa][22]_i_7_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IN_A(11),
      I1 => IN_A(10),
      I2 => IN_A(4),
      I3 => IN_A(5),
      O => \rcpPipeline[0][calculatedMantissa][22]_i_8_n_0\
    );
\rcpPipeline[0][calculatedMantissa][22]_i_9\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => IN_A(18),
      I1 => IN_A(12),
      I2 => IN_A(9),
      O => \rcpPipeline[0][calculatedMantissa][22]_i_9_n_0\
    );
\rcpPipeline[0][calculatedMantissa][2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(2),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => \rcpPipeline[0][calculatedMantissa][2]_i_1_n_0\
    );
\rcpPipeline[0][rcpExponent][0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"08FFF700FFFFFFFF"
    )
        port map (
      I0 => IN_A(30),
      I1 => IN_A(29),
      I2 => \rcpPipeline[0][rcpExponent][0]_i_2_n_0\,
      I3 => IN_A(23),
      I4 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      O => \rcpPipeline[0][rcpExponent][0]_i_1_n_0\
    );
\rcpPipeline[0][rcpExponent][0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => IN_A(27),
      I1 => IN_A(24),
      I2 => IN_A(26),
      I3 => IN_A(25),
      I4 => IN_A(28),
      O => \rcpPipeline[0][rcpExponent][0]_i_2_n_0\
    );
\rcpPipeline[0][rcpExponent][1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"A988FFFF"
    )
        port map (
      I0 => IN_A(24),
      I1 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I2 => IN_A(23),
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      I4 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      O => \rcpPipeline[0][rcpExponent][1]_i_1_n_0\
    );
\rcpPipeline[0][rcpExponent][2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"E0C20E0E"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      I1 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I2 => IN_A(25),
      I3 => IN_A(23),
      I4 => IN_A(24),
      O => \rcpPipeline[0][rcpExponent][2]_i_1_n_0\
    );
\rcpPipeline[0][rcpExponent][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E0C20E0E0E0E0E0E"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      I1 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I2 => IN_A(26),
      I3 => IN_A(23),
      I4 => IN_A(25),
      I5 => IN_A(24),
      O => \rcpPipeline[0][rcpExponent][3]_i_1_n_0\
    );
\rcpPipeline[0][rcpExponent][4]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => ISPEC_GO,
      I1 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      O => \rcpPipeline[0][rcpExponent][4]_i_1_n_0\
    );
\rcpPipeline[0][rcpExponent][4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9595955555555555"
    )
        port map (
      I0 => IN_A(27),
      I1 => IN_A(24),
      I2 => IN_A(25),
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I4 => IN_A(23),
      I5 => IN_A(26),
      O => \rcpPipeline[0][rcpExponent][4]_i_2_n_0\
    );
\rcpPipeline[0][rcpExponent][5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0E0EE0C2"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      I1 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I2 => IN_A(28),
      I3 => IN_A(23),
      I4 => \rcpPipeline[0][rcpExponent][5]_i_2_n_0\,
      O => \rcpPipeline[0][rcpExponent][5]_i_1_n_0\
    );
\rcpPipeline[0][rcpExponent][5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => IN_A(25),
      I1 => IN_A(26),
      I2 => IN_A(24),
      I3 => IN_A(27),
      O => \rcpPipeline[0][rcpExponent][5]_i_2_n_0\
    );
\rcpPipeline[0][rcpExponent][6]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0E0EE0C2"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      I1 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I2 => IN_A(29),
      I3 => IN_A(23),
      I4 => \rcpPipeline[0][rcpExponent][0]_i_2_n_0\,
      O => \rcpPipeline[0][rcpExponent][6]_i_1_n_0\
    );
\rcpPipeline[0][rcpExponent][7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0EE00EC20E0E0E0E"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      I1 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I2 => IN_A(30),
      I3 => \rcpPipeline[0][rcpExponent][0]_i_2_n_0\,
      I4 => IN_A(23),
      I5 => IN_A(29),
      O => \rcpPipeline[0][rcpExponent][7]_i_1_n_0\
    );
\rcpPipeline[0][useEarlyOutBypass]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7F77FFFF4C44CCCC"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I1 => ISPEC_GO,
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I3 => IN_A(30),
      I4 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I5 => \rcpPipeline_reg[0][useEarlyOutBypass_n_0_]\,
      O => \rcpPipeline[0][useEarlyOutBypass]_i_1_n_0\
    );
\rcpPipeline_reg[0][calculatedMantissa][0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][calculatedMantissa][0]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][calculatedMantissa]\(0),
      R => '0'
    );
\rcpPipeline_reg[0][calculatedMantissa][19]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][calculatedMantissa][19]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      R => '0'
    );
\rcpPipeline_reg[0][calculatedMantissa][1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][calculatedMantissa][1]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][calculatedMantissa]\(1),
      R => '0'
    );
\rcpPipeline_reg[0][calculatedMantissa][20]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][calculatedMantissa][20]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      R => '0'
    );
\rcpPipeline_reg[0][calculatedMantissa][21]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][calculatedMantissa][21]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      R => '0'
    );
\rcpPipeline_reg[0][calculatedMantissa][22]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][calculatedMantissa][22]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      R => '0'
    );
\rcpPipeline_reg[0][calculatedMantissa][2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][calculatedMantissa][2]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][calculatedMantissa]\(2),
      R => '0'
    );
\rcpPipeline_reg[0][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => ISPEC_GO,
      Q => \rcpPipeline_reg[0][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[0][rcpExponent][0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][rcpExponent][0]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][rcpExponent]\(0),
      R => '0'
    );
\rcpPipeline_reg[0][rcpExponent][1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][rcpExponent][1]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][rcpExponent]\(1),
      R => '0'
    );
\rcpPipeline_reg[0][rcpExponent][2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][rcpExponent][2]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][rcpExponent]\(2),
      R => '0'
    );
\rcpPipeline_reg[0][rcpExponent][3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][rcpExponent][3]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][rcpExponent]\(3),
      R => '0'
    );
\rcpPipeline_reg[0][rcpExponent][4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][rcpExponent][4]_i_2_n_0\,
      Q => \rcpPipeline_reg[0][rcpExponent]\(4),
      R => \rcpPipeline[0][rcpExponent][4]_i_1_n_0\
    );
\rcpPipeline_reg[0][rcpExponent][5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][rcpExponent][5]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][rcpExponent]\(5),
      R => '0'
    );
\rcpPipeline_reg[0][rcpExponent][6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][rcpExponent][6]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][rcpExponent]\(6),
      R => '0'
    );
\rcpPipeline_reg[0][rcpExponent][7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => \rcpPipeline[0][rcpExponent][7]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][rcpExponent]\(7),
      R => '0'
    );
\rcpPipeline_reg[0][rcpSign]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => IN_A(31),
      Q => \rcpPipeline_reg[0][rcpSign]__0\,
      R => '0'
    );
\rcpPipeline_reg[0][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline[0][useEarlyOutBypass]_i_1_n_0\,
      Q => \rcpPipeline_reg[0][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
\rcpPipeline_reg[10][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[9][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[10][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[10][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[9][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[10][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
\rcpPipeline_reg[11][calculatedMantissa][0]_srl10\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[1][calculatedMantissa]\(0),
      Q => \rcpPipeline_reg[11][calculatedMantissa][0]_srl10_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][10]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(10),
      Q => \rcpPipeline_reg[11][calculatedMantissa][10]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][11]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(11),
      Q => \rcpPipeline_reg[11][calculatedMantissa][11]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][12]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(12),
      Q => \rcpPipeline_reg[11][calculatedMantissa][12]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][13]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(13),
      Q => \rcpPipeline_reg[11][calculatedMantissa][13]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][14]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(14),
      Q => \rcpPipeline_reg[11][calculatedMantissa][14]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][15]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(15),
      Q => \rcpPipeline_reg[11][calculatedMantissa][15]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][16]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(16),
      Q => \rcpPipeline_reg[11][calculatedMantissa][16]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][17]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(17),
      Q => \rcpPipeline_reg[11][calculatedMantissa][17]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][18]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(18),
      Q => \rcpPipeline_reg[11][calculatedMantissa][18]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][19]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(19),
      Q => \rcpPipeline_reg[11][calculatedMantissa][19]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][1]_srl10\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[1][calculatedMantissa]\(1),
      Q => \rcpPipeline_reg[11][calculatedMantissa][1]_srl10_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][20]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(20),
      Q => \rcpPipeline_reg[11][calculatedMantissa][20]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][21]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(21),
      Q => \rcpPipeline_reg[11][calculatedMantissa][21]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][22]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(22),
      Q => \rcpPipeline_reg[11][calculatedMantissa][22]_srl8_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][2]_srl10\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[1][calculatedMantissa]\(2),
      Q => \rcpPipeline_reg[11][calculatedMantissa][2]_srl10_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][3]_srl10\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[1][calculatedMantissa]\(3),
      Q => \rcpPipeline_reg[11][calculatedMantissa][3]_srl10_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][4]_srl10\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[1][calculatedMantissa]\(4),
      Q => \rcpPipeline_reg[11][calculatedMantissa][4]_srl10_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][5]_srl10\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[1][calculatedMantissa]\(5),
      Q => \rcpPipeline_reg[11][calculatedMantissa][5]_srl10_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][6]_srl10\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[1][calculatedMantissa]\(6),
      Q => \rcpPipeline_reg[11][calculatedMantissa][6]_srl10_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][7]_srl10\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[1][calculatedMantissa]\(7),
      Q => \rcpPipeline_reg[11][calculatedMantissa][7]_srl10_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][8]_srl10\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[1][calculatedMantissa]\(8),
      Q => \rcpPipeline_reg[11][calculatedMantissa][8]_srl10_n_0\
    );
\rcpPipeline_reg[11][calculatedMantissa][9]_srl8\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[3][calculatedMantissa]\(9),
      Q => \rcpPipeline_reg[11][calculatedMantissa][9]_srl8_n_0\
    );
\rcpPipeline_reg[11][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[10][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[11][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[11][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[10][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[11][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][0]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][0]_srl10_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(0),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][10]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][10]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(10),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][11]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][11]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(11),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][12]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][12]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(12),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][13]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][13]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(13),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][14]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][14]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(14),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][15]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][15]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(15),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][16]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][16]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(16),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][17]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][17]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(17),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][18]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][18]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(18),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][19]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][19]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(19),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][1]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][1]_srl10_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(1),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][20]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][20]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(20),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][21]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][21]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(21),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][22]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][22]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(22),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][2]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][2]_srl10_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(2),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][3]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][3]_srl10_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(3),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][4]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][4]_srl10_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(4),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][5]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][5]_srl10_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(5),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][6]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][6]_srl10_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(6),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][7]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][7]_srl10_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(7),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][8]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][8]_srl10_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(8),
      R => '0'
    );
\rcpPipeline_reg[12][calculatedMantissa][9]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][calculatedMantissa][9]_srl8_n_0\,
      Q => \rcpPipeline_reg[12][calculatedMantissa]\(9),
      R => '0'
    );
\rcpPipeline_reg[12][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[12][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[12][rcpExponent][0]_srl12\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][rcpExponent]\(0),
      Q => \rcpPipeline_reg[12][rcpExponent]\(0)
    );
\rcpPipeline_reg[12][rcpExponent][1]_srl12\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][rcpExponent]\(1),
      Q => \rcpPipeline_reg[12][rcpExponent]\(1)
    );
\rcpPipeline_reg[12][rcpExponent][2]_srl12\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][rcpExponent]\(2),
      Q => \rcpPipeline_reg[12][rcpExponent]\(2)
    );
\rcpPipeline_reg[12][rcpExponent][3]_srl12\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][rcpExponent]\(3),
      Q => \rcpPipeline_reg[12][rcpExponent]\(3)
    );
\rcpPipeline_reg[12][rcpExponent][4]_srl12\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][rcpExponent]\(4),
      Q => \rcpPipeline_reg[12][rcpExponent]\(4)
    );
\rcpPipeline_reg[12][rcpExponent][5]_srl12\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][rcpExponent]\(5),
      Q => \rcpPipeline_reg[12][rcpExponent]\(5)
    );
\rcpPipeline_reg[12][rcpExponent][6]_srl12\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][rcpExponent]\(6),
      Q => \rcpPipeline_reg[12][rcpExponent]\(6)
    );
\rcpPipeline_reg[12][rcpExponent][7]_srl12\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][rcpExponent]\(7),
      Q => \rcpPipeline_reg[12][rcpExponent]\(7)
    );
\rcpPipeline_reg[12][rcpSign]_srl12\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '1',
      A2 => '0',
      A3 => '1',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][rcpSign]__0\,
      Q => \rcpPipeline_reg[12][rcpSign]\
    );
\rcpPipeline_reg[12][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[11][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[12][useEarlyOutBypass]__0\,
      R => '0'
    );
\rcpPipeline_reg[1][calculatedMantissa][0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[0][calculatedMantissa]\(0),
      Q => \rcpPipeline_reg[1][calculatedMantissa]\(0),
      R => '0'
    );
\rcpPipeline_reg[1][calculatedMantissa][1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[0][calculatedMantissa]\(1),
      Q => \rcpPipeline_reg[1][calculatedMantissa]\(1),
      R => '0'
    );
\rcpPipeline_reg[1][calculatedMantissa][2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[0][calculatedMantissa]\(2),
      Q => \rcpPipeline_reg[1][calculatedMantissa]\(2),
      R => '0'
    );
\rcpPipeline_reg[1][calculatedMantissa][3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \slopeMultiply_reg__15\(0),
      Q => \rcpPipeline_reg[1][calculatedMantissa]\(3),
      R => '0'
    );
\rcpPipeline_reg[1][calculatedMantissa][4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \slopeMultiply_reg__15\(1),
      Q => \rcpPipeline_reg[1][calculatedMantissa]\(4),
      R => '0'
    );
\rcpPipeline_reg[1][calculatedMantissa][5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \slopeMultiply_reg__15\(2),
      Q => \rcpPipeline_reg[1][calculatedMantissa]\(5),
      R => '0'
    );
\rcpPipeline_reg[1][calculatedMantissa][6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \slopeMultiply_reg__15\(3),
      Q => \rcpPipeline_reg[1][calculatedMantissa]\(6),
      R => '0'
    );
\rcpPipeline_reg[1][calculatedMantissa][7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \slopeMultiply_reg__15\(4),
      Q => \rcpPipeline_reg[1][calculatedMantissa]\(7),
      R => '0'
    );
\rcpPipeline_reg[1][calculatedMantissa][8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \slopeMultiply_reg__15\(5),
      Q => \rcpPipeline_reg[1][calculatedMantissa]\(8),
      R => '0'
    );
\rcpPipeline_reg[1][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[0][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[1][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[1][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[0][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[1][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
\rcpPipeline_reg[2][calculatedMantissa][10]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \slopeMultiply_reg__15\(7),
      Q => \rcpPipeline_reg[2][calculatedMantissa][10]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][11]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \slopeMultiply_reg__15\(8),
      Q => \rcpPipeline_reg[2][calculatedMantissa][11]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][12]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \slopeMultiply_reg__15\(9),
      Q => \rcpPipeline_reg[2][calculatedMantissa][12]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][13]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \slopeMultiply_reg__15\(10),
      Q => \rcpPipeline_reg[2][calculatedMantissa][13]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][14]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \slopeMultiply_reg__15\(11),
      Q => \rcpPipeline_reg[2][calculatedMantissa][14]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][15]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \slopeMultiply_reg__15\(12),
      Q => \rcpPipeline_reg[2][calculatedMantissa][15]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][16]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \slopeMultiply_reg__15\(13),
      Q => \rcpPipeline_reg[2][calculatedMantissa][16]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][17]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \slopeMultiply_reg__15\(14),
      Q => \rcpPipeline_reg[2][calculatedMantissa][17]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][18]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \slopeMultiply_reg__15\(15),
      Q => \rcpPipeline_reg[2][calculatedMantissa][18]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][19]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      Q => \rcpPipeline_reg[2][calculatedMantissa][19]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][20]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      Q => \rcpPipeline_reg[2][calculatedMantissa][20]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][21]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      Q => \rcpPipeline_reg[2][calculatedMantissa][21]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][22]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      Q => \rcpPipeline_reg[2][calculatedMantissa][22]_srl2_n_0\
    );
\rcpPipeline_reg[2][calculatedMantissa][9]_srl2\: unisim.vcomponents.SRL16E
     port map (
      A0 => '1',
      A1 => '0',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => clk,
      D => \slopeMultiply_reg__15\(6),
      Q => \rcpPipeline_reg[2][calculatedMantissa][9]_srl2_n_0\
    );
\rcpPipeline_reg[2][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[1][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[2][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[2][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[1][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[2][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][10]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][10]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(10),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][11]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][11]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(11),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][12]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][12]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(12),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][13]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][13]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(13),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][14]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][14]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(14),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][15]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][15]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(15),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][16]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][16]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(16),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][17]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][17]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(17),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][18]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][18]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(18),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][19]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][19]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(19),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][20]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][20]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(20),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][21]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][21]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(21),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][22]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][22]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(22),
      R => '0'
    );
\rcpPipeline_reg[3][calculatedMantissa][9]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][calculatedMantissa][9]_srl2_n_0\,
      Q => \rcpPipeline_reg[3][calculatedMantissa]\(9),
      R => '0'
    );
\rcpPipeline_reg[3][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[3][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[3][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[2][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[3][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
\rcpPipeline_reg[4][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[3][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[4][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[4][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[3][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[4][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
\rcpPipeline_reg[5][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[4][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[5][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[5][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[4][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[5][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
\rcpPipeline_reg[6][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[5][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[6][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[6][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[5][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[6][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
\rcpPipeline_reg[7][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[6][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[7][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[7][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[6][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[7][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
\rcpPipeline_reg[8][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[7][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[8][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[8][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[7][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[8][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
\rcpPipeline_reg[9][pipeStageIsValid]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[8][pipeStageIsValid]__0\,
      Q => \rcpPipeline_reg[9][pipeStageIsValid]__0\,
      R => '0'
    );
\rcpPipeline_reg[9][useEarlyOutBypass]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => \rcpPipeline_reg[8][useEarlyOutBypass_n_0_]\,
      Q => \rcpPipeline_reg[9][useEarlyOutBypass_n_0_]\,
      R => '0'
    );
rcpSqrSigma0Product0: unisim.vcomponents.DSP48E2
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
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => \not\(16 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_rcpSqrSigma0Product0_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 15) => B"000",
      B(14 downto 0) => \not\(31 downto 17),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_rcpSqrSigma0Product0_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_rcpSqrSigma0Product0_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_rcpSqrSigma0Product0_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => rcpSigma00,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => rcpSigma00,
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
      MULTSIGNOUT => NLW_rcpSqrSigma0Product0_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_rcpSqrSigma0Product0_OVERFLOW_UNCONNECTED,
      P(47) => rcpSqrSigma0Product0_n_58,
      P(46) => rcpSqrSigma0Product0_n_59,
      P(45) => rcpSqrSigma0Product0_n_60,
      P(44) => rcpSqrSigma0Product0_n_61,
      P(43) => rcpSqrSigma0Product0_n_62,
      P(42) => rcpSqrSigma0Product0_n_63,
      P(41) => rcpSqrSigma0Product0_n_64,
      P(40) => rcpSqrSigma0Product0_n_65,
      P(39) => rcpSqrSigma0Product0_n_66,
      P(38) => rcpSqrSigma0Product0_n_67,
      P(37) => rcpSqrSigma0Product0_n_68,
      P(36) => rcpSqrSigma0Product0_n_69,
      P(35) => rcpSqrSigma0Product0_n_70,
      P(34) => rcpSqrSigma0Product0_n_71,
      P(33) => rcpSqrSigma0Product0_n_72,
      P(32) => rcpSqrSigma0Product0_n_73,
      P(31) => rcpSqrSigma0Product0_n_74,
      P(30) => rcpSqrSigma0Product0_n_75,
      P(29) => rcpSqrSigma0Product0_n_76,
      P(28) => rcpSqrSigma0Product0_n_77,
      P(27) => rcpSqrSigma0Product0_n_78,
      P(26) => rcpSqrSigma0Product0_n_79,
      P(25) => rcpSqrSigma0Product0_n_80,
      P(24) => rcpSqrSigma0Product0_n_81,
      P(23) => rcpSqrSigma0Product0_n_82,
      P(22) => rcpSqrSigma0Product0_n_83,
      P(21) => rcpSqrSigma0Product0_n_84,
      P(20) => rcpSqrSigma0Product0_n_85,
      P(19) => rcpSqrSigma0Product0_n_86,
      P(18) => rcpSqrSigma0Product0_n_87,
      P(17) => rcpSqrSigma0Product0_n_88,
      P(16) => rcpSqrSigma0Product0_n_89,
      P(15) => rcpSqrSigma0Product0_n_90,
      P(14) => rcpSqrSigma0Product0_n_91,
      P(13) => rcpSqrSigma0Product0_n_92,
      P(12) => rcpSqrSigma0Product0_n_93,
      P(11) => rcpSqrSigma0Product0_n_94,
      P(10) => rcpSqrSigma0Product0_n_95,
      P(9) => rcpSqrSigma0Product0_n_96,
      P(8) => rcpSqrSigma0Product0_n_97,
      P(7) => rcpSqrSigma0Product0_n_98,
      P(6) => rcpSqrSigma0Product0_n_99,
      P(5) => rcpSqrSigma0Product0_n_100,
      P(4) => rcpSqrSigma0Product0_n_101,
      P(3) => rcpSqrSigma0Product0_n_102,
      P(2) => rcpSqrSigma0Product0_n_103,
      P(1) => rcpSqrSigma0Product0_n_104,
      P(0) => rcpSqrSigma0Product0_n_105,
      PATTERNBDETECT => NLW_rcpSqrSigma0Product0_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_rcpSqrSigma0Product0_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => rcpSqrSigma0Product0_n_106,
      PCOUT(46) => rcpSqrSigma0Product0_n_107,
      PCOUT(45) => rcpSqrSigma0Product0_n_108,
      PCOUT(44) => rcpSqrSigma0Product0_n_109,
      PCOUT(43) => rcpSqrSigma0Product0_n_110,
      PCOUT(42) => rcpSqrSigma0Product0_n_111,
      PCOUT(41) => rcpSqrSigma0Product0_n_112,
      PCOUT(40) => rcpSqrSigma0Product0_n_113,
      PCOUT(39) => rcpSqrSigma0Product0_n_114,
      PCOUT(38) => rcpSqrSigma0Product0_n_115,
      PCOUT(37) => rcpSqrSigma0Product0_n_116,
      PCOUT(36) => rcpSqrSigma0Product0_n_117,
      PCOUT(35) => rcpSqrSigma0Product0_n_118,
      PCOUT(34) => rcpSqrSigma0Product0_n_119,
      PCOUT(33) => rcpSqrSigma0Product0_n_120,
      PCOUT(32) => rcpSqrSigma0Product0_n_121,
      PCOUT(31) => rcpSqrSigma0Product0_n_122,
      PCOUT(30) => rcpSqrSigma0Product0_n_123,
      PCOUT(29) => rcpSqrSigma0Product0_n_124,
      PCOUT(28) => rcpSqrSigma0Product0_n_125,
      PCOUT(27) => rcpSqrSigma0Product0_n_126,
      PCOUT(26) => rcpSqrSigma0Product0_n_127,
      PCOUT(25) => rcpSqrSigma0Product0_n_128,
      PCOUT(24) => rcpSqrSigma0Product0_n_129,
      PCOUT(23) => rcpSqrSigma0Product0_n_130,
      PCOUT(22) => rcpSqrSigma0Product0_n_131,
      PCOUT(21) => rcpSqrSigma0Product0_n_132,
      PCOUT(20) => rcpSqrSigma0Product0_n_133,
      PCOUT(19) => rcpSqrSigma0Product0_n_134,
      PCOUT(18) => rcpSqrSigma0Product0_n_135,
      PCOUT(17) => rcpSqrSigma0Product0_n_136,
      PCOUT(16) => rcpSqrSigma0Product0_n_137,
      PCOUT(15) => rcpSqrSigma0Product0_n_138,
      PCOUT(14) => rcpSqrSigma0Product0_n_139,
      PCOUT(13) => rcpSqrSigma0Product0_n_140,
      PCOUT(12) => rcpSqrSigma0Product0_n_141,
      PCOUT(11) => rcpSqrSigma0Product0_n_142,
      PCOUT(10) => rcpSqrSigma0Product0_n_143,
      PCOUT(9) => rcpSqrSigma0Product0_n_144,
      PCOUT(8) => rcpSqrSigma0Product0_n_145,
      PCOUT(7) => rcpSqrSigma0Product0_n_146,
      PCOUT(6) => rcpSqrSigma0Product0_n_147,
      PCOUT(5) => rcpSqrSigma0Product0_n_148,
      PCOUT(4) => rcpSqrSigma0Product0_n_149,
      PCOUT(3) => rcpSqrSigma0Product0_n_150,
      PCOUT(2) => rcpSqrSigma0Product0_n_151,
      PCOUT(1) => rcpSqrSigma0Product0_n_152,
      PCOUT(0) => rcpSqrSigma0Product0_n_153,
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
      UNDERFLOW => NLW_rcpSqrSigma0Product0_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_rcpSqrSigma0Product0_XOROUT_UNCONNECTED(7 downto 0)
    );
\rcpSqrSigma0Product0__0\: unisim.vcomponents.DSP48E2
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
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => \not\(16 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_rcpSqrSigma0Product0__0_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17) => '0',
      B(16 downto 0) => \not\(16 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_rcpSqrSigma0Product0__0_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_rcpSqrSigma0Product0__0_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_rcpSqrSigma0Product0__0_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => rcpSigma00,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => rcpSigma00,
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
      MULTSIGNOUT => \NLW_rcpSqrSigma0Product0__0_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => \NLW_rcpSqrSigma0Product0__0_OVERFLOW_UNCONNECTED\,
      P(47) => \rcpSqrSigma0Product0__0_n_58\,
      P(46) => \rcpSqrSigma0Product0__0_n_59\,
      P(45) => \rcpSqrSigma0Product0__0_n_60\,
      P(44) => \rcpSqrSigma0Product0__0_n_61\,
      P(43) => \rcpSqrSigma0Product0__0_n_62\,
      P(42) => \rcpSqrSigma0Product0__0_n_63\,
      P(41) => \rcpSqrSigma0Product0__0_n_64\,
      P(40) => \rcpSqrSigma0Product0__0_n_65\,
      P(39) => \rcpSqrSigma0Product0__0_n_66\,
      P(38) => \rcpSqrSigma0Product0__0_n_67\,
      P(37) => \rcpSqrSigma0Product0__0_n_68\,
      P(36) => \rcpSqrSigma0Product0__0_n_69\,
      P(35) => \rcpSqrSigma0Product0__0_n_70\,
      P(34) => \rcpSqrSigma0Product0__0_n_71\,
      P(33) => \rcpSqrSigma0Product0__0_n_72\,
      P(32) => \rcpSqrSigma0Product0__0_n_73\,
      P(31) => \rcpSqrSigma0Product0__0_n_74\,
      P(30) => \rcpSqrSigma0Product0__0_n_75\,
      P(29) => \rcpSqrSigma0Product0__0_n_76\,
      P(28) => \rcpSqrSigma0Product0__0_n_77\,
      P(27) => \rcpSqrSigma0Product0__0_n_78\,
      P(26) => \rcpSqrSigma0Product0__0_n_79\,
      P(25) => \rcpSqrSigma0Product0__0_n_80\,
      P(24) => \rcpSqrSigma0Product0__0_n_81\,
      P(23) => \rcpSqrSigma0Product0__0_n_82\,
      P(22) => \rcpSqrSigma0Product0__0_n_83\,
      P(21) => \rcpSqrSigma0Product0__0_n_84\,
      P(20) => \rcpSqrSigma0Product0__0_n_85\,
      P(19) => \rcpSqrSigma0Product0__0_n_86\,
      P(18) => \rcpSqrSigma0Product0__0_n_87\,
      P(17) => \rcpSqrSigma0Product0__0_n_88\,
      P(16) => \rcpSqrSigma0Product0__0_n_89\,
      P(15) => \rcpSqrSigma0Product0__0_n_90\,
      P(14) => \rcpSqrSigma0Product0__0_n_91\,
      P(13) => \rcpSqrSigma0Product0__0_n_92\,
      P(12) => \rcpSqrSigma0Product0__0_n_93\,
      P(11) => \rcpSqrSigma0Product0__0_n_94\,
      P(10) => \rcpSqrSigma0Product0__0_n_95\,
      P(9) => \rcpSqrSigma0Product0__0_n_96\,
      P(8) => \rcpSqrSigma0Product0__0_n_97\,
      P(7) => \rcpSqrSigma0Product0__0_n_98\,
      P(6) => \rcpSqrSigma0Product0__0_n_99\,
      P(5) => \rcpSqrSigma0Product0__0_n_100\,
      P(4) => \rcpSqrSigma0Product0__0_n_101\,
      P(3) => \rcpSqrSigma0Product0__0_n_102\,
      P(2) => \rcpSqrSigma0Product0__0_n_103\,
      P(1) => \rcpSqrSigma0Product0__0_n_104\,
      P(0) => \rcpSqrSigma0Product0__0_n_105\,
      PATTERNBDETECT => \NLW_rcpSqrSigma0Product0__0_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_rcpSqrSigma0Product0__0_PATTERNDETECT_UNCONNECTED\,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => \rcpSqrSigma0Product0__0_n_106\,
      PCOUT(46) => \rcpSqrSigma0Product0__0_n_107\,
      PCOUT(45) => \rcpSqrSigma0Product0__0_n_108\,
      PCOUT(44) => \rcpSqrSigma0Product0__0_n_109\,
      PCOUT(43) => \rcpSqrSigma0Product0__0_n_110\,
      PCOUT(42) => \rcpSqrSigma0Product0__0_n_111\,
      PCOUT(41) => \rcpSqrSigma0Product0__0_n_112\,
      PCOUT(40) => \rcpSqrSigma0Product0__0_n_113\,
      PCOUT(39) => \rcpSqrSigma0Product0__0_n_114\,
      PCOUT(38) => \rcpSqrSigma0Product0__0_n_115\,
      PCOUT(37) => \rcpSqrSigma0Product0__0_n_116\,
      PCOUT(36) => \rcpSqrSigma0Product0__0_n_117\,
      PCOUT(35) => \rcpSqrSigma0Product0__0_n_118\,
      PCOUT(34) => \rcpSqrSigma0Product0__0_n_119\,
      PCOUT(33) => \rcpSqrSigma0Product0__0_n_120\,
      PCOUT(32) => \rcpSqrSigma0Product0__0_n_121\,
      PCOUT(31) => \rcpSqrSigma0Product0__0_n_122\,
      PCOUT(30) => \rcpSqrSigma0Product0__0_n_123\,
      PCOUT(29) => \rcpSqrSigma0Product0__0_n_124\,
      PCOUT(28) => \rcpSqrSigma0Product0__0_n_125\,
      PCOUT(27) => \rcpSqrSigma0Product0__0_n_126\,
      PCOUT(26) => \rcpSqrSigma0Product0__0_n_127\,
      PCOUT(25) => \rcpSqrSigma0Product0__0_n_128\,
      PCOUT(24) => \rcpSqrSigma0Product0__0_n_129\,
      PCOUT(23) => \rcpSqrSigma0Product0__0_n_130\,
      PCOUT(22) => \rcpSqrSigma0Product0__0_n_131\,
      PCOUT(21) => \rcpSqrSigma0Product0__0_n_132\,
      PCOUT(20) => \rcpSqrSigma0Product0__0_n_133\,
      PCOUT(19) => \rcpSqrSigma0Product0__0_n_134\,
      PCOUT(18) => \rcpSqrSigma0Product0__0_n_135\,
      PCOUT(17) => \rcpSqrSigma0Product0__0_n_136\,
      PCOUT(16) => \rcpSqrSigma0Product0__0_n_137\,
      PCOUT(15) => \rcpSqrSigma0Product0__0_n_138\,
      PCOUT(14) => \rcpSqrSigma0Product0__0_n_139\,
      PCOUT(13) => \rcpSqrSigma0Product0__0_n_140\,
      PCOUT(12) => \rcpSqrSigma0Product0__0_n_141\,
      PCOUT(11) => \rcpSqrSigma0Product0__0_n_142\,
      PCOUT(10) => \rcpSqrSigma0Product0__0_n_143\,
      PCOUT(9) => \rcpSqrSigma0Product0__0_n_144\,
      PCOUT(8) => \rcpSqrSigma0Product0__0_n_145\,
      PCOUT(7) => \rcpSqrSigma0Product0__0_n_146\,
      PCOUT(6) => \rcpSqrSigma0Product0__0_n_147\,
      PCOUT(5) => \rcpSqrSigma0Product0__0_n_148\,
      PCOUT(4) => \rcpSqrSigma0Product0__0_n_149\,
      PCOUT(3) => \rcpSqrSigma0Product0__0_n_150\,
      PCOUT(2) => \rcpSqrSigma0Product0__0_n_151\,
      PCOUT(1) => \rcpSqrSigma0Product0__0_n_152\,
      PCOUT(0) => \rcpSqrSigma0Product0__0_n_153\,
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
      UNDERFLOW => \NLW_rcpSqrSigma0Product0__0_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_rcpSqrSigma0Product0__0_XOROUT_UNCONNECTED\(7 downto 0)
    );
rcpSqrSigma0Product0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[4][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[4][useEarlyOutBypass_n_0_]\,
      O => rcpSigma00
    );
rcpSqrSigma0Product0_i_10: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_92,
      O => \not\(23)
    );
rcpSqrSigma0Product0_i_11: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_93,
      O => \not\(22)
    );
rcpSqrSigma0Product0_i_12: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_94,
      O => \not\(21)
    );
rcpSqrSigma0Product0_i_13: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_95,
      O => \not\(20)
    );
rcpSqrSigma0Product0_i_14: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_96,
      O => \not\(19)
    );
rcpSqrSigma0Product0_i_15: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_97,
      O => \not\(18)
    );
rcpSqrSigma0Product0_i_16: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_98,
      O => \not\(17)
    );
rcpSqrSigma0Product0_i_17: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_99,
      O => \not\(16)
    );
rcpSqrSigma0Product0_i_18: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_100,
      O => \not\(15)
    );
rcpSqrSigma0Product0_i_19: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_101,
      O => \not\(14)
    );
rcpSqrSigma0Product0_i_2: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_84,
      O => \not\(31)
    );
rcpSqrSigma0Product0_i_20: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_102,
      O => \not\(13)
    );
rcpSqrSigma0Product0_i_21: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_103,
      O => \not\(12)
    );
rcpSqrSigma0Product0_i_22: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_104,
      O => \not\(11)
    );
rcpSqrSigma0Product0_i_23: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_105,
      O => \not\(10)
    );
rcpSqrSigma0Product0_i_24: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sigma0TempProduct_reg_n_0_[16]\,
      O => \not\(9)
    );
rcpSqrSigma0Product0_i_25: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sigma0TempProduct_reg_n_0_[15]\,
      O => \not\(8)
    );
rcpSqrSigma0Product0_i_26: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sigma0TempProduct_reg_n_0_[14]\,
      O => \not\(7)
    );
rcpSqrSigma0Product0_i_27: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sigma0TempProduct_reg_n_0_[13]\,
      O => \not\(6)
    );
rcpSqrSigma0Product0_i_28: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sigma0TempProduct_reg_n_0_[12]\,
      O => \not\(5)
    );
rcpSqrSigma0Product0_i_29: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sigma0TempProduct_reg_n_0_[11]\,
      O => \not\(4)
    );
rcpSqrSigma0Product0_i_3: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_85,
      O => \not\(30)
    );
rcpSqrSigma0Product0_i_30: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sigma0TempProduct_reg_n_0_[10]\,
      O => \not\(3)
    );
rcpSqrSigma0Product0_i_31: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sigma0TempProduct_reg_n_0_[9]\,
      O => \not\(2)
    );
rcpSqrSigma0Product0_i_32: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sigma0TempProduct_reg_n_0_[8]\,
      O => \not\(1)
    );
rcpSqrSigma0Product0_i_33: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \sigma0TempProduct_reg_n_0_[7]\,
      O => \not\(0)
    );
rcpSqrSigma0Product0_i_4: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_86,
      O => \not\(29)
    );
rcpSqrSigma0Product0_i_5: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_87,
      O => \not\(28)
    );
rcpSqrSigma0Product0_i_6: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_88,
      O => \not\(27)
    );
rcpSqrSigma0Product0_i_7: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_89,
      O => \not\(26)
    );
rcpSqrSigma0Product0_i_8: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_90,
      O => \not\(25)
    );
rcpSqrSigma0Product0_i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => sigma0TempProduct_reg_n_91,
      O => \not\(24)
    );
\rcpSqrSigma0Product[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[7][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[7][useEarlyOutBypass_n_0_]\,
      O => \rcpSqrSigma0Product0__1\
    );
rcpSqrSigma0Product_reg: unisim.vcomponents.DSP48E2
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
      A(29 downto 15) => B"000000000000000",
      A(14 downto 0) => \not\(31 downto 17),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_rcpSqrSigma0Product_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 15) => B"000",
      B(14 downto 0) => \not\(31 downto 17),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_rcpSqrSigma0Product_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_rcpSqrSigma0Product_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_rcpSqrSigma0Product_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => rcpSigma00,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => rcpSigma00,
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => \rcpSqrSigma0Product0__1\,
      CLK => clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_rcpSqrSigma0Product_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"001010101",
      OVERFLOW => NLW_rcpSqrSigma0Product_reg_OVERFLOW_UNCONNECTED,
      P(47) => rcpSqrSigma0Product_reg_n_58,
      P(46) => rcpSqrSigma0Product_reg_n_59,
      P(45) => rcpSqrSigma0Product_reg_n_60,
      P(44) => rcpSqrSigma0Product_reg_n_61,
      P(43) => rcpSqrSigma0Product_reg_n_62,
      P(42) => rcpSqrSigma0Product_reg_n_63,
      P(41) => rcpSqrSigma0Product_reg_n_64,
      P(40) => rcpSqrSigma0Product_reg_n_65,
      P(39) => rcpSqrSigma0Product_reg_n_66,
      P(38) => rcpSqrSigma0Product_reg_n_67,
      P(37) => rcpSqrSigma0Product_reg_n_68,
      P(36) => rcpSqrSigma0Product_reg_n_69,
      P(35) => rcpSqrSigma0Product_reg_n_70,
      P(34) => rcpSqrSigma0Product_reg_n_71,
      P(33) => rcpSqrSigma0Product_reg_n_72,
      P(32) => rcpSqrSigma0Product_reg_n_73,
      P(31) => rcpSqrSigma0Product_reg_n_74,
      P(30) => rcpSqrSigma0Product_reg_n_75,
      P(29) => rcpSqrSigma0Product_reg_n_76,
      P(28) => rcpSqrSigma0Product_reg_n_77,
      P(27) => rcpSqrSigma0Product_reg_n_78,
      P(26) => rcpSqrSigma0Product_reg_n_79,
      P(25) => rcpSqrSigma0Product_reg_n_80,
      P(24) => rcpSqrSigma0Product_reg_n_81,
      P(23) => rcpSqrSigma0Product_reg_n_82,
      P(22) => rcpSqrSigma0Product_reg_n_83,
      P(21) => rcpSqrSigma0Product_reg_n_84,
      P(20) => rcpSqrSigma0Product_reg_n_85,
      P(19) => rcpSqrSigma0Product_reg_n_86,
      P(18) => rcpSqrSigma0Product_reg_n_87,
      P(17) => rcpSqrSigma0Product_reg_n_88,
      P(16) => rcpSqrSigma0Product_reg_n_89,
      P(15) => rcpSqrSigma0Product_reg_n_90,
      P(14) => rcpSqrSigma0Product_reg_n_91,
      P(13) => rcpSqrSigma0Product_reg_n_92,
      P(12) => rcpSqrSigma0Product_reg_n_93,
      P(11) => rcpSqrSigma0Product_reg_n_94,
      P(10) => rcpSqrSigma0Product_reg_n_95,
      P(9) => rcpSqrSigma0Product_reg_n_96,
      P(8) => rcpSqrSigma0Product_reg_n_97,
      P(7) => rcpSqrSigma0Product_reg_n_98,
      P(6) => rcpSqrSigma0Product_reg_n_99,
      P(5) => rcpSqrSigma0Product_reg_n_100,
      P(4) => rcpSqrSigma0Product_reg_n_101,
      P(3) => rcpSqrSigma0Product_reg_n_102,
      P(2) => rcpSqrSigma0Product_reg_n_103,
      P(1) => rcpSqrSigma0Product_reg_n_104,
      P(0) => rcpSqrSigma0Product_reg_n_105,
      PATTERNBDETECT => NLW_rcpSqrSigma0Product_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_rcpSqrSigma0Product_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => rcpSqrSigma0Product0_n_106,
      PCIN(46) => rcpSqrSigma0Product0_n_107,
      PCIN(45) => rcpSqrSigma0Product0_n_108,
      PCIN(44) => rcpSqrSigma0Product0_n_109,
      PCIN(43) => rcpSqrSigma0Product0_n_110,
      PCIN(42) => rcpSqrSigma0Product0_n_111,
      PCIN(41) => rcpSqrSigma0Product0_n_112,
      PCIN(40) => rcpSqrSigma0Product0_n_113,
      PCIN(39) => rcpSqrSigma0Product0_n_114,
      PCIN(38) => rcpSqrSigma0Product0_n_115,
      PCIN(37) => rcpSqrSigma0Product0_n_116,
      PCIN(36) => rcpSqrSigma0Product0_n_117,
      PCIN(35) => rcpSqrSigma0Product0_n_118,
      PCIN(34) => rcpSqrSigma0Product0_n_119,
      PCIN(33) => rcpSqrSigma0Product0_n_120,
      PCIN(32) => rcpSqrSigma0Product0_n_121,
      PCIN(31) => rcpSqrSigma0Product0_n_122,
      PCIN(30) => rcpSqrSigma0Product0_n_123,
      PCIN(29) => rcpSqrSigma0Product0_n_124,
      PCIN(28) => rcpSqrSigma0Product0_n_125,
      PCIN(27) => rcpSqrSigma0Product0_n_126,
      PCIN(26) => rcpSqrSigma0Product0_n_127,
      PCIN(25) => rcpSqrSigma0Product0_n_128,
      PCIN(24) => rcpSqrSigma0Product0_n_129,
      PCIN(23) => rcpSqrSigma0Product0_n_130,
      PCIN(22) => rcpSqrSigma0Product0_n_131,
      PCIN(21) => rcpSqrSigma0Product0_n_132,
      PCIN(20) => rcpSqrSigma0Product0_n_133,
      PCIN(19) => rcpSqrSigma0Product0_n_134,
      PCIN(18) => rcpSqrSigma0Product0_n_135,
      PCIN(17) => rcpSqrSigma0Product0_n_136,
      PCIN(16) => rcpSqrSigma0Product0_n_137,
      PCIN(15) => rcpSqrSigma0Product0_n_138,
      PCIN(14) => rcpSqrSigma0Product0_n_139,
      PCIN(13) => rcpSqrSigma0Product0_n_140,
      PCIN(12) => rcpSqrSigma0Product0_n_141,
      PCIN(11) => rcpSqrSigma0Product0_n_142,
      PCIN(10) => rcpSqrSigma0Product0_n_143,
      PCIN(9) => rcpSqrSigma0Product0_n_144,
      PCIN(8) => rcpSqrSigma0Product0_n_145,
      PCIN(7) => rcpSqrSigma0Product0_n_146,
      PCIN(6) => rcpSqrSigma0Product0_n_147,
      PCIN(5) => rcpSqrSigma0Product0_n_148,
      PCIN(4) => rcpSqrSigma0Product0_n_149,
      PCIN(3) => rcpSqrSigma0Product0_n_150,
      PCIN(2) => rcpSqrSigma0Product0_n_151,
      PCIN(1) => rcpSqrSigma0Product0_n_152,
      PCIN(0) => rcpSqrSigma0Product0_n_153,
      PCOUT(47 downto 0) => NLW_rcpSqrSigma0Product_reg_PCOUT_UNCONNECTED(47 downto 0),
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
      UNDERFLOW => NLW_rcpSqrSigma0Product_reg_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_rcpSqrSigma0Product_reg_XOROUT_UNCONNECTED(7 downto 0)
    );
\rcpSqrSigma0Product_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_105,
      Q => \rcpSqrSigma0Product_reg_n_0_[0]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_95,
      Q => \rcpSqrSigma0Product_reg_n_0_[10]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_94,
      Q => \rcpSqrSigma0Product_reg_n_0_[11]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_93,
      Q => \rcpSqrSigma0Product_reg_n_0_[12]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_92,
      Q => \rcpSqrSigma0Product_reg_n_0_[13]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_91,
      Q => \rcpSqrSigma0Product_reg_n_0_[14]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_90,
      Q => \rcpSqrSigma0Product_reg_n_0_[15]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_89,
      Q => \rcpSqrSigma0Product_reg_n_0_[16]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[16]__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => \rcpSqrSigma0Product0__0_n_89\,
      Q => \rcpSqrSigma0Product_reg[16]__0_n_0\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_104,
      Q => \rcpSqrSigma0Product_reg_n_0_[1]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_103,
      Q => \rcpSqrSigma0Product_reg_n_0_[2]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_102,
      Q => \rcpSqrSigma0Product_reg_n_0_[3]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_101,
      Q => \rcpSqrSigma0Product_reg_n_0_[4]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_100,
      Q => \rcpSqrSigma0Product_reg_n_0_[5]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_99,
      Q => \rcpSqrSigma0Product_reg_n_0_[6]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_98,
      Q => \rcpSqrSigma0Product_reg_n_0_[7]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_97,
      Q => \rcpSqrSigma0Product_reg_n_0_[8]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \rcpSqrSigma0Product0__1\,
      D => rcpSqrSigma0Product0_n_96,
      Q => \rcpSqrSigma0Product_reg_n_0_[9]\,
      R => '0'
    );
\rcpSqrSigma0Product_reg__0\: unisim.vcomponents.DSP48E2
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
      A(29 downto 17) => B"0000000000000",
      A(16 downto 0) => \not\(16 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => \NLW_rcpSqrSigma0Product_reg__0_ACOUT_UNCONNECTED\(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 15) => B"000",
      B(14 downto 0) => \not\(31 downto 17),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => \NLW_rcpSqrSigma0Product_reg__0_BCOUT_UNCONNECTED\(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => \NLW_rcpSqrSigma0Product_reg__0_CARRYCASCOUT_UNCONNECTED\,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => \NLW_rcpSqrSigma0Product_reg__0_CARRYOUT_UNCONNECTED\(3 downto 0),
      CEA1 => '0',
      CEA2 => rcpSigma00,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => rcpSigma00,
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => \rcpSqrSigma0Product0__1\,
      CLK => clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => \NLW_rcpSqrSigma0Product_reg__0_MULTSIGNOUT_UNCONNECTED\,
      OPMODE(8 downto 0) => B"001010101",
      OVERFLOW => \NLW_rcpSqrSigma0Product_reg__0_OVERFLOW_UNCONNECTED\,
      P(47) => \rcpSqrSigma0Product_reg__0_n_58\,
      P(46) => \rcpSqrSigma0Product_reg__0_n_59\,
      P(45) => \rcpSqrSigma0Product_reg__0_n_60\,
      P(44) => \rcpSqrSigma0Product_reg__0_n_61\,
      P(43) => \rcpSqrSigma0Product_reg__0_n_62\,
      P(42) => \rcpSqrSigma0Product_reg__0_n_63\,
      P(41) => \rcpSqrSigma0Product_reg__0_n_64\,
      P(40) => \rcpSqrSigma0Product_reg__0_n_65\,
      P(39) => \rcpSqrSigma0Product_reg__0_n_66\,
      P(38) => \rcpSqrSigma0Product_reg__0_n_67\,
      P(37) => \rcpSqrSigma0Product_reg__0_n_68\,
      P(36) => \rcpSqrSigma0Product_reg__0_n_69\,
      P(35) => \rcpSqrSigma0Product_reg__0_n_70\,
      P(34) => \rcpSqrSigma0Product_reg__0_n_71\,
      P(33) => \rcpSqrSigma0Product_reg__0_n_72\,
      P(32) => \rcpSqrSigma0Product_reg__0_n_73\,
      P(31) => \rcpSqrSigma0Product_reg__0_n_74\,
      P(30) => \rcpSqrSigma0Product_reg__0_n_75\,
      P(29) => \rcpSqrSigma0Product_reg__0_n_76\,
      P(28) => \rcpSqrSigma0Product_reg__0_n_77\,
      P(27) => \rcpSqrSigma0Product_reg__0_n_78\,
      P(26) => \rcpSqrSigma0Product_reg__0_n_79\,
      P(25) => \rcpSqrSigma0Product_reg__0_n_80\,
      P(24) => \rcpSqrSigma0Product_reg__0_n_81\,
      P(23) => \rcpSqrSigma0Product_reg__0_n_82\,
      P(22) => \rcpSqrSigma0Product_reg__0_n_83\,
      P(21) => \rcpSqrSigma0Product_reg__0_n_84\,
      P(20) => \rcpSqrSigma0Product_reg__0_n_85\,
      P(19) => \rcpSqrSigma0Product_reg__0_n_86\,
      P(18) => \rcpSqrSigma0Product_reg__0_n_87\,
      P(17) => \rcpSqrSigma0Product_reg__0_n_88\,
      P(16) => \rcpSqrSigma0Product_reg__0_n_89\,
      P(15) => \rcpSqrSigma0Product_reg__0_n_90\,
      P(14) => \rcpSqrSigma0Product_reg__0_n_91\,
      P(13) => \rcpSqrSigma0Product_reg__0_n_92\,
      P(12) => \rcpSqrSigma0Product_reg__0_n_93\,
      P(11) => \rcpSqrSigma0Product_reg__0_n_94\,
      P(10) => \rcpSqrSigma0Product_reg__0_n_95\,
      P(9) => \rcpSqrSigma0Product_reg__0_n_96\,
      P(8) => \rcpSqrSigma0Product_reg__0_n_97\,
      P(7) => \rcpSqrSigma0Product_reg__0_n_98\,
      P(6) => \rcpSqrSigma0Product_reg__0_n_99\,
      P(5) => \rcpSqrSigma0Product_reg__0_n_100\,
      P(4) => \rcpSqrSigma0Product_reg__0_n_101\,
      P(3) => \rcpSqrSigma0Product_reg__0_n_102\,
      P(2) => \rcpSqrSigma0Product_reg__0_n_103\,
      P(1) => \rcpSqrSigma0Product_reg__0_n_104\,
      P(0) => \rcpSqrSigma0Product_reg__0_n_105\,
      PATTERNBDETECT => \NLW_rcpSqrSigma0Product_reg__0_PATTERNBDETECT_UNCONNECTED\,
      PATTERNDETECT => \NLW_rcpSqrSigma0Product_reg__0_PATTERNDETECT_UNCONNECTED\,
      PCIN(47) => \rcpSqrSigma0Product0__0_n_106\,
      PCIN(46) => \rcpSqrSigma0Product0__0_n_107\,
      PCIN(45) => \rcpSqrSigma0Product0__0_n_108\,
      PCIN(44) => \rcpSqrSigma0Product0__0_n_109\,
      PCIN(43) => \rcpSqrSigma0Product0__0_n_110\,
      PCIN(42) => \rcpSqrSigma0Product0__0_n_111\,
      PCIN(41) => \rcpSqrSigma0Product0__0_n_112\,
      PCIN(40) => \rcpSqrSigma0Product0__0_n_113\,
      PCIN(39) => \rcpSqrSigma0Product0__0_n_114\,
      PCIN(38) => \rcpSqrSigma0Product0__0_n_115\,
      PCIN(37) => \rcpSqrSigma0Product0__0_n_116\,
      PCIN(36) => \rcpSqrSigma0Product0__0_n_117\,
      PCIN(35) => \rcpSqrSigma0Product0__0_n_118\,
      PCIN(34) => \rcpSqrSigma0Product0__0_n_119\,
      PCIN(33) => \rcpSqrSigma0Product0__0_n_120\,
      PCIN(32) => \rcpSqrSigma0Product0__0_n_121\,
      PCIN(31) => \rcpSqrSigma0Product0__0_n_122\,
      PCIN(30) => \rcpSqrSigma0Product0__0_n_123\,
      PCIN(29) => \rcpSqrSigma0Product0__0_n_124\,
      PCIN(28) => \rcpSqrSigma0Product0__0_n_125\,
      PCIN(27) => \rcpSqrSigma0Product0__0_n_126\,
      PCIN(26) => \rcpSqrSigma0Product0__0_n_127\,
      PCIN(25) => \rcpSqrSigma0Product0__0_n_128\,
      PCIN(24) => \rcpSqrSigma0Product0__0_n_129\,
      PCIN(23) => \rcpSqrSigma0Product0__0_n_130\,
      PCIN(22) => \rcpSqrSigma0Product0__0_n_131\,
      PCIN(21) => \rcpSqrSigma0Product0__0_n_132\,
      PCIN(20) => \rcpSqrSigma0Product0__0_n_133\,
      PCIN(19) => \rcpSqrSigma0Product0__0_n_134\,
      PCIN(18) => \rcpSqrSigma0Product0__0_n_135\,
      PCIN(17) => \rcpSqrSigma0Product0__0_n_136\,
      PCIN(16) => \rcpSqrSigma0Product0__0_n_137\,
      PCIN(15) => \rcpSqrSigma0Product0__0_n_138\,
      PCIN(14) => \rcpSqrSigma0Product0__0_n_139\,
      PCIN(13) => \rcpSqrSigma0Product0__0_n_140\,
      PCIN(12) => \rcpSqrSigma0Product0__0_n_141\,
      PCIN(11) => \rcpSqrSigma0Product0__0_n_142\,
      PCIN(10) => \rcpSqrSigma0Product0__0_n_143\,
      PCIN(9) => \rcpSqrSigma0Product0__0_n_144\,
      PCIN(8) => \rcpSqrSigma0Product0__0_n_145\,
      PCIN(7) => \rcpSqrSigma0Product0__0_n_146\,
      PCIN(6) => \rcpSqrSigma0Product0__0_n_147\,
      PCIN(5) => \rcpSqrSigma0Product0__0_n_148\,
      PCIN(4) => \rcpSqrSigma0Product0__0_n_149\,
      PCIN(3) => \rcpSqrSigma0Product0__0_n_150\,
      PCIN(2) => \rcpSqrSigma0Product0__0_n_151\,
      PCIN(1) => \rcpSqrSigma0Product0__0_n_152\,
      PCIN(0) => \rcpSqrSigma0Product0__0_n_153\,
      PCOUT(47 downto 0) => \NLW_rcpSqrSigma0Product_reg__0_PCOUT_UNCONNECTED\(47 downto 0),
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
      UNDERFLOW => \NLW_rcpSqrSigma0Product_reg__0_UNDERFLOW_UNCONNECTED\,
      XOROUT(7 downto 0) => \NLW_rcpSqrSigma0Product_reg__0_XOROUT_UNCONNECTED\(7 downto 0)
    );
\resultMantissa[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[11][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[11][useEarlyOutBypass_n_0_]\,
      O => resultMantissa0
    );
\resultMantissa[5]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => L(7),
      O => \resultMantissa[5]_i_2_n_0\
    );
\resultMantissa_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(7),
      Q => resultMantissa(0),
      R => '0'
    );
\resultMantissa_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(17),
      Q => resultMantissa(10),
      R => '0'
    );
\resultMantissa_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(18),
      Q => resultMantissa(11),
      R => '0'
    );
\resultMantissa_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(19),
      Q => resultMantissa(12),
      R => '0'
    );
\resultMantissa_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(20),
      Q => resultMantissa(13),
      R => '0'
    );
\resultMantissa_reg[13]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \resultMantissa_reg[5]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \resultMantissa_reg[13]_i_1_n_0\,
      CO(6) => \resultMantissa_reg[13]_i_1_n_1\,
      CO(5) => \resultMantissa_reg[13]_i_1_n_2\,
      CO(4) => \resultMantissa_reg[13]_i_1_n_3\,
      CO(3) => \resultMantissa_reg[13]_i_1_n_4\,
      CO(2) => \resultMantissa_reg[13]_i_1_n_5\,
      CO(1) => \resultMantissa_reg[13]_i_1_n_6\,
      CO(0) => \resultMantissa_reg[13]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => plusOp(20 downto 13),
      S(7 downto 0) => L(21 downto 14)
    );
\resultMantissa_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(21),
      Q => resultMantissa(14),
      R => '0'
    );
\resultMantissa_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(22),
      Q => resultMantissa(15),
      R => '0'
    );
\resultMantissa_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(23),
      Q => resultMantissa(16),
      R => '0'
    );
\resultMantissa_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(24),
      Q => resultMantissa(17),
      R => '0'
    );
\resultMantissa_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(25),
      Q => resultMantissa(18),
      R => '0'
    );
\resultMantissa_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(26),
      Q => resultMantissa(19),
      R => '0'
    );
\resultMantissa_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(8),
      Q => resultMantissa(1),
      R => '0'
    );
\resultMantissa_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(27),
      Q => resultMantissa(20),
      R => '0'
    );
\resultMantissa_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(28),
      Q => resultMantissa(21),
      R => '0'
    );
\resultMantissa_reg[21]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => \resultMantissa_reg[13]_i_1_n_0\,
      CI_TOP => '0',
      CO(7) => \resultMantissa_reg[21]_i_1_n_0\,
      CO(6) => \resultMantissa_reg[21]_i_1_n_1\,
      CO(5) => \resultMantissa_reg[21]_i_1_n_2\,
      CO(4) => \resultMantissa_reg[21]_i_1_n_3\,
      CO(3) => \resultMantissa_reg[21]_i_1_n_4\,
      CO(2) => \resultMantissa_reg[21]_i_1_n_5\,
      CO(1) => \resultMantissa_reg[21]_i_1_n_6\,
      CO(0) => \resultMantissa_reg[21]_i_1_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => plusOp(28 downto 21),
      S(7 downto 0) => L(29 downto 22)
    );
\resultMantissa_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(29),
      Q => resultMantissa(22),
      R => '0'
    );
\resultMantissa_reg[22]_i_2\: unisim.vcomponents.CARRY8
     port map (
      CI => \resultMantissa_reg[21]_i_1_n_0\,
      CI_TOP => '0',
      CO(7 downto 0) => \NLW_resultMantissa_reg[22]_i_2_CO_UNCONNECTED\(7 downto 0),
      DI(7 downto 0) => B"00000000",
      O(7 downto 1) => \NLW_resultMantissa_reg[22]_i_2_O_UNCONNECTED\(7 downto 1),
      O(0) => plusOp(29),
      S(7 downto 1) => B"0000000",
      S(0) => L(30)
    );
\resultMantissa_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(9),
      Q => resultMantissa(2),
      R => '0'
    );
\resultMantissa_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(10),
      Q => resultMantissa(3),
      R => '0'
    );
\resultMantissa_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(11),
      Q => resultMantissa(4),
      R => '0'
    );
\resultMantissa_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(12),
      Q => resultMantissa(5),
      R => '0'
    );
\resultMantissa_reg[5]_i_1\: unisim.vcomponents.CARRY8
     port map (
      CI => '0',
      CI_TOP => '0',
      CO(7) => \resultMantissa_reg[5]_i_1_n_0\,
      CO(6) => \resultMantissa_reg[5]_i_1_n_1\,
      CO(5) => \resultMantissa_reg[5]_i_1_n_2\,
      CO(4) => \resultMantissa_reg[5]_i_1_n_3\,
      CO(3) => \resultMantissa_reg[5]_i_1_n_4\,
      CO(2) => \resultMantissa_reg[5]_i_1_n_5\,
      CO(1) => \resultMantissa_reg[5]_i_1_n_6\,
      CO(0) => \resultMantissa_reg[5]_i_1_n_7\,
      DI(7 downto 2) => B"000000",
      DI(1) => L(7),
      DI(0) => '0',
      O(7 downto 2) => plusOp(12 downto 7),
      O(1 downto 0) => \NLW_resultMantissa_reg[5]_i_1_O_UNCONNECTED\(1 downto 0),
      S(7 downto 2) => L(13 downto 8),
      S(1) => \resultMantissa[5]_i_2_n_0\,
      S(0) => L(6)
    );
\resultMantissa_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(13),
      Q => resultMantissa(6),
      R => '0'
    );
\resultMantissa_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(14),
      Q => resultMantissa(7),
      R => '0'
    );
\resultMantissa_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(15),
      Q => resultMantissa(8),
      R => '0'
    );
\resultMantissa_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => resultMantissa0,
      D => plusOp(16),
      Q => resultMantissa(9),
      R => '0'
    );
sigma0TempProduct0: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 2,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 2,
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
      A(29 downto 17) => B"0000000000000",
      A(16 downto 8) => \rcpPipeline_reg[1][calculatedMantissa]\(8 downto 0),
      A(7 downto 0) => B"00000000",
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_sigma0TempProduct0_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 16) => B"00",
      B(15 downto 0) => rInitialGuess000_in(15 downto 0),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_sigma0TempProduct0_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_sigma0TempProduct0_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_sigma0TempProduct0_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '1',
      CEA2 => '1',
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => rInitialGuess00,
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
      MULTSIGNOUT => NLW_sigma0TempProduct0_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_sigma0TempProduct0_OVERFLOW_UNCONNECTED,
      P(47) => sigma0TempProduct0_n_58,
      P(46) => sigma0TempProduct0_n_59,
      P(45) => sigma0TempProduct0_n_60,
      P(44) => sigma0TempProduct0_n_61,
      P(43) => sigma0TempProduct0_n_62,
      P(42) => sigma0TempProduct0_n_63,
      P(41) => sigma0TempProduct0_n_64,
      P(40) => sigma0TempProduct0_n_65,
      P(39) => sigma0TempProduct0_n_66,
      P(38) => sigma0TempProduct0_n_67,
      P(37) => sigma0TempProduct0_n_68,
      P(36) => sigma0TempProduct0_n_69,
      P(35) => sigma0TempProduct0_n_70,
      P(34) => sigma0TempProduct0_n_71,
      P(33) => sigma0TempProduct0_n_72,
      P(32) => sigma0TempProduct0_n_73,
      P(31) => sigma0TempProduct0_n_74,
      P(30) => sigma0TempProduct0_n_75,
      P(29) => sigma0TempProduct0_n_76,
      P(28) => sigma0TempProduct0_n_77,
      P(27) => sigma0TempProduct0_n_78,
      P(26) => sigma0TempProduct0_n_79,
      P(25) => sigma0TempProduct0_n_80,
      P(24) => sigma0TempProduct0_n_81,
      P(23) => sigma0TempProduct0_n_82,
      P(22) => sigma0TempProduct0_n_83,
      P(21) => sigma0TempProduct0_n_84,
      P(20) => sigma0TempProduct0_n_85,
      P(19) => sigma0TempProduct0_n_86,
      P(18) => sigma0TempProduct0_n_87,
      P(17) => sigma0TempProduct0_n_88,
      P(16) => sigma0TempProduct0_n_89,
      P(15) => sigma0TempProduct0_n_90,
      P(14) => sigma0TempProduct0_n_91,
      P(13) => sigma0TempProduct0_n_92,
      P(12) => sigma0TempProduct0_n_93,
      P(11) => sigma0TempProduct0_n_94,
      P(10) => sigma0TempProduct0_n_95,
      P(9) => sigma0TempProduct0_n_96,
      P(8) => sigma0TempProduct0_n_97,
      P(7) => sigma0TempProduct0_n_98,
      P(6) => sigma0TempProduct0_n_99,
      P(5) => sigma0TempProduct0_n_100,
      P(4) => sigma0TempProduct0_n_101,
      P(3) => sigma0TempProduct0_n_102,
      P(2) => sigma0TempProduct0_n_103,
      P(1) => sigma0TempProduct0_n_104,
      P(0) => sigma0TempProduct0_n_105,
      PATTERNBDETECT => NLW_sigma0TempProduct0_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_sigma0TempProduct0_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47) => sigma0TempProduct0_n_106,
      PCOUT(46) => sigma0TempProduct0_n_107,
      PCOUT(45) => sigma0TempProduct0_n_108,
      PCOUT(44) => sigma0TempProduct0_n_109,
      PCOUT(43) => sigma0TempProduct0_n_110,
      PCOUT(42) => sigma0TempProduct0_n_111,
      PCOUT(41) => sigma0TempProduct0_n_112,
      PCOUT(40) => sigma0TempProduct0_n_113,
      PCOUT(39) => sigma0TempProduct0_n_114,
      PCOUT(38) => sigma0TempProduct0_n_115,
      PCOUT(37) => sigma0TempProduct0_n_116,
      PCOUT(36) => sigma0TempProduct0_n_117,
      PCOUT(35) => sigma0TempProduct0_n_118,
      PCOUT(34) => sigma0TempProduct0_n_119,
      PCOUT(33) => sigma0TempProduct0_n_120,
      PCOUT(32) => sigma0TempProduct0_n_121,
      PCOUT(31) => sigma0TempProduct0_n_122,
      PCOUT(30) => sigma0TempProduct0_n_123,
      PCOUT(29) => sigma0TempProduct0_n_124,
      PCOUT(28) => sigma0TempProduct0_n_125,
      PCOUT(27) => sigma0TempProduct0_n_126,
      PCOUT(26) => sigma0TempProduct0_n_127,
      PCOUT(25) => sigma0TempProduct0_n_128,
      PCOUT(24) => sigma0TempProduct0_n_129,
      PCOUT(23) => sigma0TempProduct0_n_130,
      PCOUT(22) => sigma0TempProduct0_n_131,
      PCOUT(21) => sigma0TempProduct0_n_132,
      PCOUT(20) => sigma0TempProduct0_n_133,
      PCOUT(19) => sigma0TempProduct0_n_134,
      PCOUT(18) => sigma0TempProduct0_n_135,
      PCOUT(17) => sigma0TempProduct0_n_136,
      PCOUT(16) => sigma0TempProduct0_n_137,
      PCOUT(15) => sigma0TempProduct0_n_138,
      PCOUT(14) => sigma0TempProduct0_n_139,
      PCOUT(13) => sigma0TempProduct0_n_140,
      PCOUT(12) => sigma0TempProduct0_n_141,
      PCOUT(11) => sigma0TempProduct0_n_142,
      PCOUT(10) => sigma0TempProduct0_n_143,
      PCOUT(9) => sigma0TempProduct0_n_144,
      PCOUT(8) => sigma0TempProduct0_n_145,
      PCOUT(7) => sigma0TempProduct0_n_146,
      PCOUT(6) => sigma0TempProduct0_n_147,
      PCOUT(5) => sigma0TempProduct0_n_148,
      PCOUT(4) => sigma0TempProduct0_n_149,
      PCOUT(3) => sigma0TempProduct0_n_150,
      PCOUT(2) => sigma0TempProduct0_n_151,
      PCOUT(1) => sigma0TempProduct0_n_152,
      PCOUT(0) => sigma0TempProduct0_n_153,
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
      UNDERFLOW => NLW_sigma0TempProduct0_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_sigma0TempProduct0_XOROUT_UNCONNECTED(7 downto 0)
    );
sigma0TempProduct0_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[2][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[2][useEarlyOutBypass_n_0_]\,
      O => rInitialGuess00
    );
\sigma0TempProduct[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[3][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[3][useEarlyOutBypass_n_0_]\,
      O => \sigma0TempProduct0__0\
    );
sigma0TempProduct_reg: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 0,
      BMULTSEL => "B",
      BREG => 0,
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
      A(29 downto 16) => B"00000000000000",
      A(15 downto 0) => rInitialGuess000_in(15 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_sigma0TempProduct_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 14) => B"0001",
      B(13 downto 0) => \rcpPipeline_reg[3][calculatedMantissa]\(22 downto 9),
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_sigma0TempProduct_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_sigma0TempProduct_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_sigma0TempProduct_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => rInitialGuess00,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => '0',
      CEB2 => '0',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => \sigma0TempProduct0__0\,
      CLK => clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_sigma0TempProduct_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"001010101",
      OVERFLOW => NLW_sigma0TempProduct_reg_OVERFLOW_UNCONNECTED,
      P(47) => sigma0TempProduct_reg_n_58,
      P(46) => sigma0TempProduct_reg_n_59,
      P(45) => sigma0TempProduct_reg_n_60,
      P(44) => sigma0TempProduct_reg_n_61,
      P(43) => sigma0TempProduct_reg_n_62,
      P(42) => sigma0TempProduct_reg_n_63,
      P(41) => sigma0TempProduct_reg_n_64,
      P(40) => sigma0TempProduct_reg_n_65,
      P(39) => sigma0TempProduct_reg_n_66,
      P(38) => sigma0TempProduct_reg_n_67,
      P(37) => sigma0TempProduct_reg_n_68,
      P(36) => sigma0TempProduct_reg_n_69,
      P(35) => sigma0TempProduct_reg_n_70,
      P(34) => sigma0TempProduct_reg_n_71,
      P(33) => sigma0TempProduct_reg_n_72,
      P(32) => sigma0TempProduct_reg_n_73,
      P(31) => sigma0TempProduct_reg_n_74,
      P(30) => sigma0TempProduct_reg_n_75,
      P(29) => sigma0TempProduct_reg_n_76,
      P(28) => sigma0TempProduct_reg_n_77,
      P(27) => sigma0TempProduct_reg_n_78,
      P(26) => sigma0TempProduct_reg_n_79,
      P(25) => sigma0TempProduct_reg_n_80,
      P(24) => sigma0TempProduct_reg_n_81,
      P(23) => sigma0TempProduct_reg_n_82,
      P(22) => sigma0TempProduct_reg_n_83,
      P(21) => sigma0TempProduct_reg_n_84,
      P(20) => sigma0TempProduct_reg_n_85,
      P(19) => sigma0TempProduct_reg_n_86,
      P(18) => sigma0TempProduct_reg_n_87,
      P(17) => sigma0TempProduct_reg_n_88,
      P(16) => sigma0TempProduct_reg_n_89,
      P(15) => sigma0TempProduct_reg_n_90,
      P(14) => sigma0TempProduct_reg_n_91,
      P(13) => sigma0TempProduct_reg_n_92,
      P(12) => sigma0TempProduct_reg_n_93,
      P(11) => sigma0TempProduct_reg_n_94,
      P(10) => sigma0TempProduct_reg_n_95,
      P(9) => sigma0TempProduct_reg_n_96,
      P(8) => sigma0TempProduct_reg_n_97,
      P(7) => sigma0TempProduct_reg_n_98,
      P(6) => sigma0TempProduct_reg_n_99,
      P(5) => sigma0TempProduct_reg_n_100,
      P(4) => sigma0TempProduct_reg_n_101,
      P(3) => sigma0TempProduct_reg_n_102,
      P(2) => sigma0TempProduct_reg_n_103,
      P(1) => sigma0TempProduct_reg_n_104,
      P(0) => sigma0TempProduct_reg_n_105,
      PATTERNBDETECT => NLW_sigma0TempProduct_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_sigma0TempProduct_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47) => sigma0TempProduct0_n_106,
      PCIN(46) => sigma0TempProduct0_n_107,
      PCIN(45) => sigma0TempProduct0_n_108,
      PCIN(44) => sigma0TempProduct0_n_109,
      PCIN(43) => sigma0TempProduct0_n_110,
      PCIN(42) => sigma0TempProduct0_n_111,
      PCIN(41) => sigma0TempProduct0_n_112,
      PCIN(40) => sigma0TempProduct0_n_113,
      PCIN(39) => sigma0TempProduct0_n_114,
      PCIN(38) => sigma0TempProduct0_n_115,
      PCIN(37) => sigma0TempProduct0_n_116,
      PCIN(36) => sigma0TempProduct0_n_117,
      PCIN(35) => sigma0TempProduct0_n_118,
      PCIN(34) => sigma0TempProduct0_n_119,
      PCIN(33) => sigma0TempProduct0_n_120,
      PCIN(32) => sigma0TempProduct0_n_121,
      PCIN(31) => sigma0TempProduct0_n_122,
      PCIN(30) => sigma0TempProduct0_n_123,
      PCIN(29) => sigma0TempProduct0_n_124,
      PCIN(28) => sigma0TempProduct0_n_125,
      PCIN(27) => sigma0TempProduct0_n_126,
      PCIN(26) => sigma0TempProduct0_n_127,
      PCIN(25) => sigma0TempProduct0_n_128,
      PCIN(24) => sigma0TempProduct0_n_129,
      PCIN(23) => sigma0TempProduct0_n_130,
      PCIN(22) => sigma0TempProduct0_n_131,
      PCIN(21) => sigma0TempProduct0_n_132,
      PCIN(20) => sigma0TempProduct0_n_133,
      PCIN(19) => sigma0TempProduct0_n_134,
      PCIN(18) => sigma0TempProduct0_n_135,
      PCIN(17) => sigma0TempProduct0_n_136,
      PCIN(16) => sigma0TempProduct0_n_137,
      PCIN(15) => sigma0TempProduct0_n_138,
      PCIN(14) => sigma0TempProduct0_n_139,
      PCIN(13) => sigma0TempProduct0_n_140,
      PCIN(12) => sigma0TempProduct0_n_141,
      PCIN(11) => sigma0TempProduct0_n_142,
      PCIN(10) => sigma0TempProduct0_n_143,
      PCIN(9) => sigma0TempProduct0_n_144,
      PCIN(8) => sigma0TempProduct0_n_145,
      PCIN(7) => sigma0TempProduct0_n_146,
      PCIN(6) => sigma0TempProduct0_n_147,
      PCIN(5) => sigma0TempProduct0_n_148,
      PCIN(4) => sigma0TempProduct0_n_149,
      PCIN(3) => sigma0TempProduct0_n_150,
      PCIN(2) => sigma0TempProduct0_n_151,
      PCIN(1) => sigma0TempProduct0_n_152,
      PCIN(0) => sigma0TempProduct0_n_153,
      PCOUT(47 downto 0) => NLW_sigma0TempProduct_reg_PCOUT_UNCONNECTED(47 downto 0),
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
      UNDERFLOW => NLW_sigma0TempProduct_reg_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_sigma0TempProduct_reg_XOROUT_UNCONNECTED(7 downto 0)
    );
\sigma0TempProduct_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => sigma0TempProduct0_n_95,
      Q => \sigma0TempProduct_reg_n_0_[10]\,
      R => '0'
    );
\sigma0TempProduct_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => sigma0TempProduct0_n_94,
      Q => \sigma0TempProduct_reg_n_0_[11]\,
      R => '0'
    );
\sigma0TempProduct_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => sigma0TempProduct0_n_93,
      Q => \sigma0TempProduct_reg_n_0_[12]\,
      R => '0'
    );
\sigma0TempProduct_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => sigma0TempProduct0_n_92,
      Q => \sigma0TempProduct_reg_n_0_[13]\,
      R => '0'
    );
\sigma0TempProduct_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => sigma0TempProduct0_n_91,
      Q => \sigma0TempProduct_reg_n_0_[14]\,
      R => '0'
    );
\sigma0TempProduct_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => sigma0TempProduct0_n_90,
      Q => \sigma0TempProduct_reg_n_0_[15]\,
      R => '0'
    );
\sigma0TempProduct_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => sigma0TempProduct0_n_89,
      Q => \sigma0TempProduct_reg_n_0_[16]\,
      R => '0'
    );
\sigma0TempProduct_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => sigma0TempProduct0_n_98,
      Q => \sigma0TempProduct_reg_n_0_[7]\,
      R => '0'
    );
\sigma0TempProduct_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => sigma0TempProduct0_n_97,
      Q => \sigma0TempProduct_reg_n_0_[8]\,
      R => '0'
    );
\sigma0TempProduct_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => \sigma0TempProduct0__0\,
      D => sigma0TempProduct0_n_96,
      Q => \sigma0TempProduct_reg_n_0_[9]\,
      R => '0'
    );
slopeMultiply_reg: unisim.vcomponents.DSP48E2
    generic map(
      ACASCREG => 1,
      ADREG => 1,
      ALUMODEREG => 0,
      AMULTSEL => "A",
      AREG => 1,
      AUTORESET_PATDET => "NO_RESET",
      AUTORESET_PRIORITY => "RESET",
      A_INPUT => "DIRECT",
      BCASCREG => 2,
      BMULTSEL => "B",
      BREG => 2,
      B_INPUT => "DIRECT",
      CARRYINREG => 0,
      CARRYINSELREG => 0,
      CREG => 0,
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
      A(29 downto 16) => B"00000000000000",
      A(15) => slopeMultiply_reg_i_19_n_0,
      A(14 downto 0) => \RcpLookupTable_Slopes[0]_0\(14 downto 0),
      ACIN(29 downto 0) => B"000000000000000000000000000000",
      ACOUT(29 downto 0) => NLW_slopeMultiply_reg_ACOUT_UNCONNECTED(29 downto 0),
      ALUMODE(3 downto 0) => B"0000",
      B(17 downto 16) => B"00",
      B(15) => slopeMultiply_reg_i_3_n_0,
      B(14) => slopeMultiply_reg_i_4_n_0,
      B(13) => slopeMultiply_reg_i_5_n_0,
      B(12) => slopeMultiply_reg_i_6_n_0,
      B(11) => slopeMultiply_reg_i_7_n_0,
      B(10) => slopeMultiply_reg_i_8_n_0,
      B(9) => slopeMultiply_reg_i_9_n_0,
      B(8) => slopeMultiply_reg_i_10_n_0,
      B(7) => slopeMultiply_reg_i_11_n_0,
      B(6) => slopeMultiply_reg_i_12_n_0,
      B(5) => slopeMultiply_reg_i_13_n_0,
      B(4) => slopeMultiply_reg_i_14_n_0,
      B(3) => slopeMultiply_reg_i_15_n_0,
      B(2) => slopeMultiply_reg_i_16_n_0,
      B(1) => slopeMultiply_reg_i_17_n_0,
      B(0) => slopeMultiply_reg_i_18_n_0,
      BCIN(17 downto 0) => B"000000000000000000",
      BCOUT(17 downto 0) => NLW_slopeMultiply_reg_BCOUT_UNCONNECTED(17 downto 0),
      C(47 downto 0) => B"111111111111111111111111111111111111111111111111",
      CARRYCASCIN => '0',
      CARRYCASCOUT => NLW_slopeMultiply_reg_CARRYCASCOUT_UNCONNECTED,
      CARRYIN => '0',
      CARRYINSEL(2 downto 0) => B"000",
      CARRYOUT(3 downto 0) => NLW_slopeMultiply_reg_CARRYOUT_UNCONNECTED(3 downto 0),
      CEA1 => '0',
      CEA2 => rcpLookupSlope0,
      CEAD => '0',
      CEALUMODE => '0',
      CEB1 => ISPEC_GO,
      CEB2 => '1',
      CEC => '0',
      CECARRYIN => '0',
      CECTRL => '0',
      CED => '0',
      CEINMODE => '0',
      CEM => '0',
      CEP => slopeMultiply0,
      CLK => clk,
      D(26 downto 0) => B"000000000000000000000000000",
      INMODE(4 downto 0) => B"00000",
      MULTSIGNIN => '0',
      MULTSIGNOUT => NLW_slopeMultiply_reg_MULTSIGNOUT_UNCONNECTED,
      OPMODE(8 downto 0) => B"000000101",
      OVERFLOW => NLW_slopeMultiply_reg_OVERFLOW_UNCONNECTED,
      P(47 downto 32) => NLW_slopeMultiply_reg_P_UNCONNECTED(47 downto 32),
      P(31) => slopeMultiply_reg_n_74,
      P(30) => slopeMultiply_reg_n_75,
      P(29) => slopeMultiply_reg_n_76,
      P(28) => slopeMultiply_reg_n_77,
      P(27) => slopeMultiply_reg_n_78,
      P(26) => slopeMultiply_reg_n_79,
      P(25) => slopeMultiply_reg_n_80,
      P(24) => slopeMultiply_reg_n_81,
      P(23) => slopeMultiply_reg_n_82,
      P(22) => slopeMultiply_reg_n_83,
      P(21) => slopeMultiply_reg_n_84,
      P(20) => slopeMultiply_reg_n_85,
      P(19) => slopeMultiply_reg_n_86,
      P(18) => slopeMultiply_reg_n_87,
      P(17) => slopeMultiply_reg_n_88,
      P(16) => slopeMultiply_reg_n_89,
      P(15) => slopeMultiply_reg_n_90,
      P(14) => slopeMultiply_reg_n_91,
      P(13) => slopeMultiply_reg_n_92,
      P(12) => slopeMultiply_reg_n_93,
      P(11) => slopeMultiply_reg_n_94,
      P(10) => slopeMultiply_reg_n_95,
      P(9) => slopeMultiply_reg_n_96,
      P(8) => slopeMultiply_reg_n_97,
      P(7) => slopeMultiply_reg_n_98,
      P(6) => slopeMultiply_reg_n_99,
      P(5) => slopeMultiply_reg_n_100,
      P(4) => slopeMultiply_reg_n_101,
      P(3) => slopeMultiply_reg_n_102,
      P(2) => slopeMultiply_reg_n_103,
      P(1) => slopeMultiply_reg_n_104,
      P(0) => slopeMultiply_reg_n_105,
      PATTERNBDETECT => NLW_slopeMultiply_reg_PATTERNBDETECT_UNCONNECTED,
      PATTERNDETECT => NLW_slopeMultiply_reg_PATTERNDETECT_UNCONNECTED,
      PCIN(47 downto 0) => B"000000000000000000000000000000000000000000000000",
      PCOUT(47 downto 0) => NLW_slopeMultiply_reg_PCOUT_UNCONNECTED(47 downto 0),
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
      UNDERFLOW => NLW_slopeMultiply_reg_UNDERFLOW_UNCONNECTED,
      XOROUT(7 downto 0) => NLW_slopeMultiply_reg_XOROUT_UNCONNECTED(7 downto 0)
    );
\slopeMultiply_reg__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_4_n_0,
      Q => \slopeMultiply_reg__15\(14),
      R => '0'
    );
\slopeMultiply_reg__1\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_5_n_0,
      Q => \slopeMultiply_reg__15\(13),
      R => '0'
    );
\slopeMultiply_reg__10\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_14_n_0,
      Q => \slopeMultiply_reg__15\(4),
      R => '0'
    );
\slopeMultiply_reg__11\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_15_n_0,
      Q => \slopeMultiply_reg__15\(3),
      R => '0'
    );
\slopeMultiply_reg__12\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_16_n_0,
      Q => \slopeMultiply_reg__15\(2),
      R => '0'
    );
\slopeMultiply_reg__13\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_17_n_0,
      Q => \slopeMultiply_reg__15\(1),
      R => '0'
    );
\slopeMultiply_reg__14\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_18_n_0,
      Q => \slopeMultiply_reg__15\(0),
      R => '0'
    );
\slopeMultiply_reg__2\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_6_n_0,
      Q => \slopeMultiply_reg__15\(12),
      R => '0'
    );
\slopeMultiply_reg__3\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_7_n_0,
      Q => \slopeMultiply_reg__15\(11),
      R => '0'
    );
\slopeMultiply_reg__4\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_8_n_0,
      Q => \slopeMultiply_reg__15\(10),
      R => '0'
    );
\slopeMultiply_reg__5\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_9_n_0,
      Q => \slopeMultiply_reg__15\(9),
      R => '0'
    );
\slopeMultiply_reg__6\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_10_n_0,
      Q => \slopeMultiply_reg__15\(8),
      R => '0'
    );
\slopeMultiply_reg__7\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_11_n_0,
      Q => \slopeMultiply_reg__15\(7),
      R => '0'
    );
\slopeMultiply_reg__8\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_12_n_0,
      Q => \slopeMultiply_reg__15\(6),
      R => '0'
    );
\slopeMultiply_reg__9\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_3_n_0,
      Q => \slopeMultiply_reg__15\(15),
      R => '0'
    );
\slopeMultiply_reg__9__0\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => ISPEC_GO,
      D => slopeMultiply_reg_i_13_n_0,
      Q => \slopeMultiply_reg__15\(5),
      R => '0'
    );
slopeMultiply_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[0][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[0][useEarlyOutBypass_n_0_]\,
      O => rcpLookupSlope0
    );
slopeMultiply_reg_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(11),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_10_n_0
    );
slopeMultiply_reg_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(10),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_11_n_0
    );
slopeMultiply_reg_i_12: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(9),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_12_n_0
    );
slopeMultiply_reg_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(8),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_13_n_0
    );
slopeMultiply_reg_i_14: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(7),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_14_n_0
    );
slopeMultiply_reg_i_15: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(6),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_15_n_0
    );
slopeMultiply_reg_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(5),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_16_n_0
    );
slopeMultiply_reg_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(4),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_17_n_0
    );
slopeMultiply_reg_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(3),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_18_n_0
    );
slopeMultiply_reg_i_19: unisim.vcomponents.LUT4
    generic map(
      INIT => X"007F"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      O => slopeMultiply_reg_i_19_n_0
    );
slopeMultiply_reg_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \rcpPipeline_reg[1][pipeStageIsValid]__0\,
      I1 => \rcpPipeline_reg[1][useEarlyOutBypass_n_0_]\,
      O => slopeMultiply0
    );
slopeMultiply_reg_i_20: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EBAB"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Slopes[0]_0\(14)
    );
slopeMultiply_reg_i_21: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5213"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Slopes[0]_0\(13)
    );
slopeMultiply_reg_i_22: unisim.vcomponents.LUT4
    generic map(
      INIT => X"613D"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Slopes[0]_0\(12)
    );
slopeMultiply_reg_i_23: unisim.vcomponents.LUT4
    generic map(
      INIT => X"07B4"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Slopes[0]_0\(11)
    );
slopeMultiply_reg_i_24: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7B76"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Slopes[0]_0\(10)
    );
slopeMultiply_reg_i_25: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E990"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Slopes[0]_0\(9)
    );
slopeMultiply_reg_i_26: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0C72"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Slopes[0]_0\(8)
    );
slopeMultiply_reg_i_27: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5A65"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Slopes[0]_0\(7)
    );
slopeMultiply_reg_i_28: unisim.vcomponents.LUT4
    generic map(
      INIT => X"1EA1"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Slopes[0]_0\(6)
    );
slopeMultiply_reg_i_29: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4AD7"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      O => \RcpLookupTable_Slopes[0]_0\(5)
    );
slopeMultiply_reg_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(18),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_3_n_0
    );
slopeMultiply_reg_i_30: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EEEB"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      O => \RcpLookupTable_Slopes[0]_0\(4)
    );
slopeMultiply_reg_i_31: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4A56"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Slopes[0]_0\(3)
    );
slopeMultiply_reg_i_32: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2768"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Slopes[0]_0\(2)
    );
slopeMultiply_reg_i_33: unisim.vcomponents.LUT4
    generic map(
      INIT => X"504E"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      O => \RcpLookupTable_Slopes[0]_0\(1)
    );
slopeMultiply_reg_i_34: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BCD3"
    )
        port map (
      I0 => \rcpPipeline_reg[0][calculatedMantissa]\(22),
      I1 => \rcpPipeline_reg[0][calculatedMantissa]\(21),
      I2 => \rcpPipeline_reg[0][calculatedMantissa]\(20),
      I3 => \rcpPipeline_reg[0][calculatedMantissa]\(19),
      O => \RcpLookupTable_Slopes[0]_0\(0)
    );
slopeMultiply_reg_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(17),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_4_n_0
    );
slopeMultiply_reg_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(16),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_5_n_0
    );
slopeMultiply_reg_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(15),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_6_n_0
    );
slopeMultiply_reg_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(14),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_7_n_0
    );
slopeMultiply_reg_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(13),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_8_n_0
    );
slopeMultiply_reg_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FE000000FE00F000"
    )
        port map (
      I0 => \rcpPipeline[0][calculatedMantissa][22]_i_2_n_0\,
      I1 => IN_A(30),
      I2 => \rcpPipeline[0][calculatedMantissa][22]_i_3_n_0\,
      I3 => \rcpPipeline[0][calculatedMantissa][22]_i_4_n_0\,
      I4 => IN_A(12),
      I5 => \rcpPipeline[0][calculatedMantissa][22]_i_5_n_0\,
      O => slopeMultiply_reg_i_9_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity MainDesign_StandaloneFloatALU_S_0_1 is
  port (
    clk : in STD_LOGIC;
    IN_A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    OSPEC : out STD_LOGIC_VECTOR ( 31 downto 0 );
    ISPEC_GO : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of MainDesign_StandaloneFloatALU_S_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of MainDesign_StandaloneFloatALU_S_0_1 : entity is "MainDesign_StandaloneFloatALU_S_0_1,StandaloneFloatALU_SPEC,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of MainDesign_StandaloneFloatALU_S_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of MainDesign_StandaloneFloatALU_S_0_1 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of MainDesign_StandaloneFloatALU_S_0_1 : entity is "StandaloneFloatALU_SPEC,Vivado 2025.2";
end MainDesign_StandaloneFloatALU_S_0_1;

architecture STRUCTURE of MainDesign_StandaloneFloatALU_S_0_1 is
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of clk : signal is "slave clk";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN MainDesign_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
begin
U0: entity work.MainDesign_StandaloneFloatALU_S_0_1_StandaloneFloatALU_SPEC
     port map (
      IN_A(31 downto 0) => IN_A(31 downto 0),
      ISPEC_GO => ISPEC_GO,
      OSPEC(31 downto 0) => OSPEC(31 downto 0),
      clk => clk
    );
end STRUCTURE;
