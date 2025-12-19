-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1_AR73068 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Thu Oct 10 00:37:59 2024
-- Host        : Dragon2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               D:/Xilinx/MyXilinxProjects/CPUDrivenGPUTest3/CPUDrivenGPUTest3.srcs/sources_1/bd/design_1/ip/design_1_IndexBufferCache_0_0/design_1_IndexBufferCache_0_0_sim_netlist.vhdl
-- Design      : design_1_IndexBufferCache_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcku5p-ffvb676-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_IndexBufferCache_0_0_IndexBufferCache is
  port (
    DBG_State : out STD_LOGIC_VECTOR ( 1 downto 0 );
    VBB_ReadData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VBB_ReadReady : out STD_LOGIC;
    IBCReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 24 downto 0 );
    IBCReadRequestsFIFO_wr_en : out STD_LOGIC;
    IBCReadResponsesFIFO_rd_en : out STD_LOGIC;
    IBCReadResponsesFIFO_empty : in STD_LOGIC;
    VBB_ReadEnable : in STD_LOGIC;
    VBB_InvalidateIndexCache : in STD_LOGIC;
    VBB_ReadAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    clk : in STD_LOGIC;
    IBCReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    IBCReadRequestsFIFO_full : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_IndexBufferCache_0_0_IndexBufferCache : entity is "IndexBufferCache";
end design_1_IndexBufferCache_0_0_IndexBufferCache;

architecture STRUCTURE of design_1_IndexBufferCache_0_0_IndexBufferCache is
  signal \^dbg_state\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \^dbg_state\ : signal is "yes";
  signal \FSM_onehot_currentState[1]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState[2]_i_2_n_0\ : STD_LOGIC;
  signal \FSM_onehot_currentState_reg_n_0_[0]\ : STD_LOGIC;
  attribute RTL_KEEP of \FSM_onehot_currentState_reg_n_0_[0]\ : signal is "yes";
  signal GetCurrentCacheIndexForAddress : STD_LOGIC_VECTOR ( 0 to 0 );
  signal \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\ : STD_LOGIC;
  signal IBCReadRequestsFIFO_wr_en_i_1_n_0 : STD_LOGIC;
  signal IBCReadResponsesFIFO_rd_en_i_1_n_0 : STD_LOGIC;
  signal \IsAddressInCurrentCache0_carry__0_i_1_n_0\ : STD_LOGIC;
  signal \IsAddressInCurrentCache0_carry__0_n_7\ : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_i_1_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_i_2_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_i_3_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_i_4_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_i_5_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_i_6_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_i_7_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_i_8_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_n_1 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_n_2 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_n_3 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_n_5 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_n_6 : STD_LOGIC;
  signal IsAddressInCurrentCache0_carry_n_7 : STD_LOGIC;
  signal IsAddressInCurrentCache1 : STD_LOGIC;
  signal IsAddressInCurrentCache10_out : STD_LOGIC;
  signal IsAddressInCurrentCache11_out : STD_LOGIC;
  signal \IsAddressInCurrentCache1_carry__0_i_1_n_0\ : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_i_1_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_i_2_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_i_3_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_i_4_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_i_5_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_i_6_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_i_7_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_i_8_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_n_0 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_n_1 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_n_2 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_n_3 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_n_5 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_n_6 : STD_LOGIC;
  signal IsAddressInCurrentCache1_carry_n_7 : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__0/i__carry_n_0\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__0/i__carry_n_1\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__0/i__carry_n_2\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__0/i__carry_n_3\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__0/i__carry_n_5\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__0/i__carry_n_6\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__0/i__carry_n_7\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__1/i__carry_n_0\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__1/i__carry_n_1\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__1/i__carry_n_2\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__1/i__carry_n_3\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__1/i__carry_n_5\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__1/i__carry_n_6\ : STD_LOGIC;
  signal \IsAddressInCurrentCache1_inferred__1/i__carry_n_7\ : STD_LOGIC;
  signal \IsAddressInCurrentCache__1\ : STD_LOGIC;
  signal ReadDataFromCacheLine : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ReadDataFromCacheLine0_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ReadDataFromCacheLine1_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal ReadDataFromCacheLine2_in : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \VBB_ReadData[0]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[0]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[0]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[0]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[0]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[0]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[0]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[0]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[10]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[10]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[10]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[10]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[10]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[10]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[10]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[10]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[11]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[11]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[11]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[11]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[11]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[11]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[11]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[11]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[12]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[12]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[12]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[12]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[12]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[12]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[12]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[12]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[13]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[13]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[13]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[13]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[13]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[13]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[13]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[13]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[14]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[14]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[14]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[14]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[14]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[14]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[14]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[14]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[15]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[15]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[15]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[15]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[15]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[15]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[15]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[15]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[16]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[17]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[18]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[19]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[1]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[1]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[1]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[1]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[1]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[1]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[1]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[1]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[20]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[21]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[22]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_18_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_19_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[23]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[24]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[24]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[24]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[24]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[24]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[24]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[24]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[24]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[24]_i_8_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[25]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[25]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[25]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[25]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[25]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[25]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[25]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[25]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[25]_i_8_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[26]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[26]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[26]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[26]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[26]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[26]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[26]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[26]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[26]_i_8_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[27]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[27]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[27]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[27]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[27]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[27]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[27]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[27]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[27]_i_8_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[28]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[28]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[28]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[28]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[28]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[28]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[28]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[28]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[28]_i_8_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[29]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[29]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[29]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[29]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[29]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[29]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[29]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[29]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[29]_i_8_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[2]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[2]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[2]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[2]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[2]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[2]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[2]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[2]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[30]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[30]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[30]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[30]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[30]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[30]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[30]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[30]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[30]_i_8_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_18_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_1_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_4_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_8_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[31]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[3]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[3]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[3]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[3]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[3]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[3]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[3]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[3]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[4]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[4]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[4]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[4]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[4]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[4]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[4]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[4]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[5]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[5]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[5]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[5]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[5]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[5]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[5]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[5]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[6]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[6]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[6]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[6]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[6]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[6]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[6]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[6]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[7]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[7]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[7]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[7]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[7]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[7]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[7]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[7]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[8]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[8]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[8]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[8]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[8]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[8]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[8]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[8]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[9]_i_10_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[9]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[9]_i_12_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[9]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[9]_i_14_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[9]_i_15_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[9]_i_16_n_0\ : STD_LOGIC;
  signal \VBB_ReadData[9]_i_17_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[0]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[0]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[0]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[10]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[10]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[10]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[11]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[11]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[11]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[12]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[12]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[12]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[13]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[13]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[13]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[14]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[14]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[14]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[15]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[15]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[15]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[16]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[16]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[16]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[17]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[17]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[17]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[18]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[18]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[18]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[19]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[19]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[19]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[1]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[1]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[1]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[20]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[20]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[20]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[21]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[21]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[21]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[22]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[22]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[22]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[23]_i_11_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[23]_i_8_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[23]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[24]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[24]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[24]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[25]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[25]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[25]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[26]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[26]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[26]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[27]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[27]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[27]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[28]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[28]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[28]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[29]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[29]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[29]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[2]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[2]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[2]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[30]_i_2_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[30]_i_3_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[30]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[31]_i_13_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[31]_i_5_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[31]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[3]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[3]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[3]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[4]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[4]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[4]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[5]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[5]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[5]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[6]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[6]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[6]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[7]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[7]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[7]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[8]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[8]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[8]_i_9_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[9]_i_6_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[9]_i_7_n_0\ : STD_LOGIC;
  signal \VBB_ReadData_reg[9]_i_9_n_0\ : STD_LOGIC;
  signal VBB_ReadReady_i_1_n_0 : STD_LOGIC;
  signal currentCache0BaseAddr : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal \currentCache0BaseAddr[24]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache0BaseAddr[24]_i_2_n_0\ : STD_LOGIC;
  signal currentCache0Data : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal currentCache0Data_0 : STD_LOGIC;
  signal currentCache1BaseAddr : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal \currentCache1BaseAddr[24]_i_1_n_0\ : STD_LOGIC;
  signal currentCache1BaseAddr_2 : STD_LOGIC;
  signal currentCache1Data : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal currentCache1Data_5 : STD_LOGIC;
  signal currentCache2BaseAddr : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal \currentCache2BaseAddr[0]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[10]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[11]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[12]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[13]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[14]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[15]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[16]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[17]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[18]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[19]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[1]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[20]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[21]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[22]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[23]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[24]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[24]_i_3_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[2]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[3]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[4]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[5]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[6]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[7]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[8]_i_1_n_0\ : STD_LOGIC;
  signal \currentCache2BaseAddr[9]_i_1_n_0\ : STD_LOGIC;
  signal currentCache2BaseAddr_3 : STD_LOGIC;
  signal currentCache2Data : STD_LOGIC_VECTOR ( 255 downto 0 );
  signal currentCache2Data_4 : STD_LOGIC;
  signal currentCache3BaseAddr : STD_LOGIC_VECTOR ( 24 downto 0 );
  signal \currentCache3BaseAddr[24]_i_1_n_0\ : STD_LOGIC;
  signal currentCache3BaseAddr_1 : STD_LOGIC;
  signal currentCache3Data : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[0]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[10]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[11]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[12]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[13]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[14]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[15]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[16]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[17]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[18]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[19]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[1]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[20]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[21]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[22]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[23]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[24]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[25]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[26]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[27]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[28]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[29]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[2]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[30]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[31]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[3]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[4]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[5]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[6]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[7]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[8]\ : STD_LOGIC;
  signal \currentCache3Data_reg_n_0_[9]\ : STD_LOGIC;
  signal data1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal data2 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal data3 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal data4 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal data5 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal data6 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal data7 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal \i__carry__0_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry__0_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_1__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_1_n_0\ : STD_LOGIC;
  signal \i__carry_i_2__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_2_n_0\ : STD_LOGIC;
  signal \i__carry_i_3__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_3_n_0\ : STD_LOGIC;
  signal \i__carry_i_4__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_4_n_0\ : STD_LOGIC;
  signal \i__carry_i_5__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_5_n_0\ : STD_LOGIC;
  signal \i__carry_i_6__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_6_n_0\ : STD_LOGIC;
  signal \i__carry_i_7__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_7_n_0\ : STD_LOGIC;
  signal \i__carry_i_8__0_n_0\ : STD_LOGIC;
  signal \i__carry_i_8_n_0\ : STD_LOGIC;
  signal \nextCacheLineWrite_reg_n_0_[0]\ : STD_LOGIC;
  signal \nextCacheLineWrite_reg_n_0_[1]\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal plusOp : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \ret__223\ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_IsAddressInCurrentCache0_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_IsAddressInCurrentCache0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_IsAddressInCurrentCache0_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_IsAddressInCurrentCache0_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_IsAddressInCurrentCache1_carry_CO_UNCONNECTED : STD_LOGIC_VECTOR ( 3 to 3 );
  signal NLW_IsAddressInCurrentCache1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_IsAddressInCurrentCache1_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_IsAddressInCurrentCache1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_IsAddressInCurrentCache1_inferred__0/i__carry_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_IsAddressInCurrentCache1_inferred__0/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_IsAddressInCurrentCache1_inferred__0/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_IsAddressInCurrentCache1_inferred__0/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_IsAddressInCurrentCache1_inferred__1/i__carry_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_IsAddressInCurrentCache1_inferred__1/i__carry_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_IsAddressInCurrentCache1_inferred__1/i__carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \NLW_IsAddressInCurrentCache1_inferred__1/i__carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_currentState_reg[0]\ : label is "initstate:001,readystate:010,waitformemreadstate:100,";
  attribute KEEP : string;
  attribute KEEP of \FSM_onehot_currentState_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_currentState_reg[1]\ : label is "initstate:001,readystate:010,waitformemreadstate:100,";
  attribute KEEP of \FSM_onehot_currentState_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_currentState_reg[2]\ : label is "initstate:001,readystate:010,waitformemreadstate:100,";
  attribute KEEP of \FSM_onehot_currentState_reg[2]\ : label is "yes";
  attribute x_interface_info : string;
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[10]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[11]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[12]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[13]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[14]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[15]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[16]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[17]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[18]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[19]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[20]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[21]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[22]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[23]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[24]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[25]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[26]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[27]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[28]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[29]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[5]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[6]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[7]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[8]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of \IBCReadRequestsFIFO_wr_data_reg[9]\ : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of IBCReadRequestsFIFO_wr_en_reg : label is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_EN";
  attribute x_interface_info of IBCReadResponsesFIFO_rd_en_reg : label is "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses RD_EN";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \VBB_ReadData[10]_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \VBB_ReadData[10]_i_3\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \VBB_ReadData[10]_i_4\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \VBB_ReadData[10]_i_5\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \VBB_ReadData[11]_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \VBB_ReadData[11]_i_3\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \VBB_ReadData[11]_i_4\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \VBB_ReadData[11]_i_5\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \VBB_ReadData[12]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \VBB_ReadData[12]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \VBB_ReadData[12]_i_4\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \VBB_ReadData[12]_i_5\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \VBB_ReadData[13]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \VBB_ReadData[13]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \VBB_ReadData[13]_i_4\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \VBB_ReadData[13]_i_5\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \VBB_ReadData[14]_i_2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \VBB_ReadData[14]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \VBB_ReadData[14]_i_4\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \VBB_ReadData[14]_i_5\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \VBB_ReadData[15]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \VBB_ReadData[15]_i_3\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \VBB_ReadData[15]_i_4\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \VBB_ReadData[15]_i_5\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \VBB_ReadData[16]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \VBB_ReadData[16]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \VBB_ReadData[16]_i_4\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \VBB_ReadData[16]_i_5\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \VBB_ReadData[17]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \VBB_ReadData[17]_i_3\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \VBB_ReadData[17]_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \VBB_ReadData[17]_i_5\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \VBB_ReadData[18]_i_2\ : label is "soft_lutpair25";
  attribute SOFT_HLUTNM of \VBB_ReadData[18]_i_3\ : label is "soft_lutpair26";
  attribute SOFT_HLUTNM of \VBB_ReadData[18]_i_4\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \VBB_ReadData[18]_i_5\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \VBB_ReadData[19]_i_2\ : label is "soft_lutpair31";
  attribute SOFT_HLUTNM of \VBB_ReadData[19]_i_3\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \VBB_ReadData[19]_i_4\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \VBB_ReadData[19]_i_5\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \VBB_ReadData[20]_i_2\ : label is "soft_lutpair30";
  attribute SOFT_HLUTNM of \VBB_ReadData[20]_i_3\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \VBB_ReadData[20]_i_4\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \VBB_ReadData[20]_i_5\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \VBB_ReadData[21]_i_2\ : label is "soft_lutpair29";
  attribute SOFT_HLUTNM of \VBB_ReadData[21]_i_3\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \VBB_ReadData[21]_i_4\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \VBB_ReadData[21]_i_5\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \VBB_ReadData[22]_i_2\ : label is "soft_lutpair28";
  attribute SOFT_HLUTNM of \VBB_ReadData[22]_i_3\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \VBB_ReadData[22]_i_4\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \VBB_ReadData[22]_i_5\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \VBB_ReadData[23]_i_2\ : label is "soft_lutpair27";
  attribute SOFT_HLUTNM of \VBB_ReadData[23]_i_3\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of \VBB_ReadData[23]_i_4\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \VBB_ReadData[23]_i_5\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \VBB_ReadData[23]_i_6\ : label is "soft_lutpair33";
  attribute SOFT_HLUTNM of \VBB_ReadData[23]_i_7\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \VBB_ReadData[31]_i_3\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \VBB_ReadData[31]_i_7\ : label is "soft_lutpair32";
  attribute SOFT_HLUTNM of \VBB_ReadData[8]_i_2\ : label is "soft_lutpair23";
  attribute SOFT_HLUTNM of \VBB_ReadData[8]_i_3\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \VBB_ReadData[8]_i_4\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \VBB_ReadData[8]_i_5\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \VBB_ReadData[9]_i_2\ : label is "soft_lutpair24";
  attribute SOFT_HLUTNM of \VBB_ReadData[9]_i_3\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \VBB_ReadData[9]_i_4\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \VBB_ReadData[9]_i_5\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \nextCacheLineWrite[0]_i_1\ : label is "soft_lutpair34";
  attribute SOFT_HLUTNM of \nextCacheLineWrite[1]_i_1\ : label is "soft_lutpair34";
begin
  DBG_State(1 downto 0) <= \^dbg_state\(1 downto 0);
\FSM_onehot_currentState[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[0]\,
      I1 => \^dbg_state\(1),
      O => \FSM_onehot_currentState[1]_i_1_n_0\
    );
\FSM_onehot_currentState[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EEEEEEFEEEEEEEEE"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[0]\,
      I1 => IBCReadResponsesFIFO_rd_en_i_1_n_0,
      I2 => \^dbg_state\(0),
      I3 => \IsAddressInCurrentCache__1\,
      I4 => IBCReadRequestsFIFO_full,
      I5 => \FSM_onehot_currentState[2]_i_2_n_0\,
      O => \FSM_onehot_currentState[2]_i_1_n_0\
    );
\FSM_onehot_currentState[2]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => VBB_ReadEnable,
      I1 => VBB_InvalidateIndexCache,
      O => \FSM_onehot_currentState[2]_i_2_n_0\
    );
\FSM_onehot_currentState_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_currentState[2]_i_1_n_0\,
      D => '0',
      Q => \FSM_onehot_currentState_reg_n_0_[0]\,
      R => '0'
    );
\FSM_onehot_currentState_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_currentState[2]_i_1_n_0\,
      D => \FSM_onehot_currentState[1]_i_1_n_0\,
      Q => \^dbg_state\(0),
      R => '0'
    );
\FSM_onehot_currentState_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \FSM_onehot_currentState[2]_i_1_n_0\,
      D => \^dbg_state\(0),
      Q => \^dbg_state\(1),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data[29]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000200"
    )
        port map (
      I0 => \^dbg_state\(0),
      I1 => \IsAddressInCurrentCache__1\,
      I2 => IBCReadRequestsFIFO_full,
      I3 => VBB_ReadEnable,
      I4 => VBB_InvalidateIndexCache,
      O => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\
    );
\IBCReadRequestsFIFO_wr_data_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(10),
      Q => IBCReadRequestsFIFO_wr_data(5),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(11),
      Q => IBCReadRequestsFIFO_wr_data(6),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(12),
      Q => IBCReadRequestsFIFO_wr_data(7),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(13),
      Q => IBCReadRequestsFIFO_wr_data(8),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(14),
      Q => IBCReadRequestsFIFO_wr_data(9),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(15),
      Q => IBCReadRequestsFIFO_wr_data(10),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(16),
      Q => IBCReadRequestsFIFO_wr_data(11),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(17),
      Q => IBCReadRequestsFIFO_wr_data(12),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(18),
      Q => IBCReadRequestsFIFO_wr_data(13),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(19),
      Q => IBCReadRequestsFIFO_wr_data(14),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(20),
      Q => IBCReadRequestsFIFO_wr_data(15),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(21),
      Q => IBCReadRequestsFIFO_wr_data(16),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(22),
      Q => IBCReadRequestsFIFO_wr_data(17),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(23),
      Q => IBCReadRequestsFIFO_wr_data(18),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(24),
      Q => IBCReadRequestsFIFO_wr_data(19),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(25),
      Q => IBCReadRequestsFIFO_wr_data(20),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(26),
      Q => IBCReadRequestsFIFO_wr_data(21),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(27),
      Q => IBCReadRequestsFIFO_wr_data(22),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(28),
      Q => IBCReadRequestsFIFO_wr_data(23),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(29),
      Q => IBCReadRequestsFIFO_wr_data(24),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(5),
      Q => IBCReadRequestsFIFO_wr_data(0),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(6),
      Q => IBCReadRequestsFIFO_wr_data(1),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(7),
      Q => IBCReadRequestsFIFO_wr_data(2),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(8),
      Q => IBCReadRequestsFIFO_wr_data(3),
      R => '0'
    );
\IBCReadRequestsFIFO_wr_data_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      D => VBB_ReadAddr(9),
      Q => IBCReadRequestsFIFO_wr_data(4),
      R => '0'
    );
IBCReadRequestsFIFO_wr_en_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \^dbg_state\(0),
      I1 => \FSM_onehot_currentState_reg_n_0_[0]\,
      I2 => \^dbg_state\(1),
      O => IBCReadRequestsFIFO_wr_en_i_1_n_0
    );
IBCReadRequestsFIFO_wr_en_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IBCReadRequestsFIFO_wr_en_i_1_n_0,
      D => \IBCReadRequestsFIFO_wr_data[29]_i_1_n_0\,
      Q => IBCReadRequestsFIFO_wr_en,
      R => '0'
    );
IBCReadResponsesFIFO_rd_en_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^dbg_state\(1),
      I1 => IBCReadResponsesFIFO_empty,
      O => IBCReadResponsesFIFO_rd_en_i_1_n_0
    );
IBCReadResponsesFIFO_rd_en_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IBCReadRequestsFIFO_wr_en_i_1_n_0,
      D => IBCReadResponsesFIFO_rd_en_i_1_n_0,
      Q => IBCReadResponsesFIFO_rd_en,
      R => '0'
    );
IsAddressInCurrentCache0_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => IsAddressInCurrentCache0_carry_n_0,
      CO(6) => IsAddressInCurrentCache0_carry_n_1,
      CO(5) => IsAddressInCurrentCache0_carry_n_2,
      CO(4) => IsAddressInCurrentCache0_carry_n_3,
      CO(3) => NLW_IsAddressInCurrentCache0_carry_CO_UNCONNECTED(3),
      CO(2) => IsAddressInCurrentCache0_carry_n_5,
      CO(1) => IsAddressInCurrentCache0_carry_n_6,
      CO(0) => IsAddressInCurrentCache0_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => NLW_IsAddressInCurrentCache0_carry_O_UNCONNECTED(7 downto 0),
      S(7) => IsAddressInCurrentCache0_carry_i_1_n_0,
      S(6) => IsAddressInCurrentCache0_carry_i_2_n_0,
      S(5) => IsAddressInCurrentCache0_carry_i_3_n_0,
      S(4) => IsAddressInCurrentCache0_carry_i_4_n_0,
      S(3) => IsAddressInCurrentCache0_carry_i_5_n_0,
      S(2) => IsAddressInCurrentCache0_carry_i_6_n_0,
      S(1) => IsAddressInCurrentCache0_carry_i_7_n_0,
      S(0) => IsAddressInCurrentCache0_carry_i_8_n_0
    );
\IsAddressInCurrentCache0_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => IsAddressInCurrentCache0_carry_n_0,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_IsAddressInCurrentCache0_carry__0_CO_UNCONNECTED\(7 downto 1),
      CO(0) => \IsAddressInCurrentCache0_carry__0_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \NLW_IsAddressInCurrentCache0_carry__0_O_UNCONNECTED\(7 downto 0),
      S(7 downto 1) => B"0000000",
      S(0) => \IsAddressInCurrentCache0_carry__0_i_1_n_0\
    );
\IsAddressInCurrentCache0_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => VBB_ReadAddr(29),
      I1 => currentCache3BaseAddr(24),
      O => \IsAddressInCurrentCache0_carry__0_i_1_n_0\
    );
IsAddressInCurrentCache0_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache3BaseAddr(21),
      I1 => VBB_ReadAddr(26),
      I2 => VBB_ReadAddr(28),
      I3 => currentCache3BaseAddr(23),
      I4 => VBB_ReadAddr(27),
      I5 => currentCache3BaseAddr(22),
      O => IsAddressInCurrentCache0_carry_i_1_n_0
    );
IsAddressInCurrentCache0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache3BaseAddr(18),
      I1 => VBB_ReadAddr(23),
      I2 => VBB_ReadAddr(25),
      I3 => currentCache3BaseAddr(20),
      I4 => VBB_ReadAddr(24),
      I5 => currentCache3BaseAddr(19),
      O => IsAddressInCurrentCache0_carry_i_2_n_0
    );
IsAddressInCurrentCache0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache3BaseAddr(15),
      I1 => VBB_ReadAddr(20),
      I2 => VBB_ReadAddr(22),
      I3 => currentCache3BaseAddr(17),
      I4 => VBB_ReadAddr(21),
      I5 => currentCache3BaseAddr(16),
      O => IsAddressInCurrentCache0_carry_i_3_n_0
    );
IsAddressInCurrentCache0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache3BaseAddr(12),
      I1 => VBB_ReadAddr(17),
      I2 => VBB_ReadAddr(19),
      I3 => currentCache3BaseAddr(14),
      I4 => VBB_ReadAddr(18),
      I5 => currentCache3BaseAddr(13),
      O => IsAddressInCurrentCache0_carry_i_4_n_0
    );
IsAddressInCurrentCache0_carry_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache3BaseAddr(9),
      I1 => VBB_ReadAddr(14),
      I2 => VBB_ReadAddr(16),
      I3 => currentCache3BaseAddr(11),
      I4 => VBB_ReadAddr(15),
      I5 => currentCache3BaseAddr(10),
      O => IsAddressInCurrentCache0_carry_i_5_n_0
    );
IsAddressInCurrentCache0_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache3BaseAddr(6),
      I1 => VBB_ReadAddr(11),
      I2 => VBB_ReadAddr(13),
      I3 => currentCache3BaseAddr(8),
      I4 => VBB_ReadAddr(12),
      I5 => currentCache3BaseAddr(7),
      O => IsAddressInCurrentCache0_carry_i_6_n_0
    );
IsAddressInCurrentCache0_carry_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache3BaseAddr(3),
      I1 => VBB_ReadAddr(8),
      I2 => VBB_ReadAddr(10),
      I3 => currentCache3BaseAddr(5),
      I4 => VBB_ReadAddr(9),
      I5 => currentCache3BaseAddr(4),
      O => IsAddressInCurrentCache0_carry_i_7_n_0
    );
IsAddressInCurrentCache0_carry_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache3BaseAddr(0),
      I1 => VBB_ReadAddr(5),
      I2 => VBB_ReadAddr(7),
      I3 => currentCache3BaseAddr(2),
      I4 => VBB_ReadAddr(6),
      I5 => currentCache3BaseAddr(1),
      O => IsAddressInCurrentCache0_carry_i_8_n_0
    );
IsAddressInCurrentCache1_carry: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => IsAddressInCurrentCache1_carry_n_0,
      CO(6) => IsAddressInCurrentCache1_carry_n_1,
      CO(5) => IsAddressInCurrentCache1_carry_n_2,
      CO(4) => IsAddressInCurrentCache1_carry_n_3,
      CO(3) => NLW_IsAddressInCurrentCache1_carry_CO_UNCONNECTED(3),
      CO(2) => IsAddressInCurrentCache1_carry_n_5,
      CO(1) => IsAddressInCurrentCache1_carry_n_6,
      CO(0) => IsAddressInCurrentCache1_carry_n_7,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => NLW_IsAddressInCurrentCache1_carry_O_UNCONNECTED(7 downto 0),
      S(7) => IsAddressInCurrentCache1_carry_i_1_n_0,
      S(6) => IsAddressInCurrentCache1_carry_i_2_n_0,
      S(5) => IsAddressInCurrentCache1_carry_i_3_n_0,
      S(4) => IsAddressInCurrentCache1_carry_i_4_n_0,
      S(3) => IsAddressInCurrentCache1_carry_i_5_n_0,
      S(2) => IsAddressInCurrentCache1_carry_i_6_n_0,
      S(1) => IsAddressInCurrentCache1_carry_i_7_n_0,
      S(0) => IsAddressInCurrentCache1_carry_i_8_n_0
    );
\IsAddressInCurrentCache1_carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => IsAddressInCurrentCache1_carry_n_0,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_IsAddressInCurrentCache1_carry__0_CO_UNCONNECTED\(7 downto 1),
      CO(0) => IsAddressInCurrentCache1,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \NLW_IsAddressInCurrentCache1_carry__0_O_UNCONNECTED\(7 downto 0),
      S(7 downto 1) => B"0000000",
      S(0) => \IsAddressInCurrentCache1_carry__0_i_1_n_0\
    );
\IsAddressInCurrentCache1_carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => VBB_ReadAddr(29),
      I1 => currentCache2BaseAddr(24),
      O => \IsAddressInCurrentCache1_carry__0_i_1_n_0\
    );
IsAddressInCurrentCache1_carry_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache2BaseAddr(21),
      I1 => VBB_ReadAddr(26),
      I2 => VBB_ReadAddr(28),
      I3 => currentCache2BaseAddr(23),
      I4 => VBB_ReadAddr(27),
      I5 => currentCache2BaseAddr(22),
      O => IsAddressInCurrentCache1_carry_i_1_n_0
    );
IsAddressInCurrentCache1_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache2BaseAddr(18),
      I1 => VBB_ReadAddr(23),
      I2 => VBB_ReadAddr(25),
      I3 => currentCache2BaseAddr(20),
      I4 => VBB_ReadAddr(24),
      I5 => currentCache2BaseAddr(19),
      O => IsAddressInCurrentCache1_carry_i_2_n_0
    );
IsAddressInCurrentCache1_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache2BaseAddr(15),
      I1 => VBB_ReadAddr(20),
      I2 => VBB_ReadAddr(22),
      I3 => currentCache2BaseAddr(17),
      I4 => VBB_ReadAddr(21),
      I5 => currentCache2BaseAddr(16),
      O => IsAddressInCurrentCache1_carry_i_3_n_0
    );
IsAddressInCurrentCache1_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache2BaseAddr(12),
      I1 => VBB_ReadAddr(17),
      I2 => VBB_ReadAddr(19),
      I3 => currentCache2BaseAddr(14),
      I4 => VBB_ReadAddr(18),
      I5 => currentCache2BaseAddr(13),
      O => IsAddressInCurrentCache1_carry_i_4_n_0
    );
IsAddressInCurrentCache1_carry_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache2BaseAddr(9),
      I1 => VBB_ReadAddr(14),
      I2 => VBB_ReadAddr(16),
      I3 => currentCache2BaseAddr(11),
      I4 => VBB_ReadAddr(15),
      I5 => currentCache2BaseAddr(10),
      O => IsAddressInCurrentCache1_carry_i_5_n_0
    );
IsAddressInCurrentCache1_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache2BaseAddr(6),
      I1 => VBB_ReadAddr(11),
      I2 => VBB_ReadAddr(13),
      I3 => currentCache2BaseAddr(8),
      I4 => VBB_ReadAddr(12),
      I5 => currentCache2BaseAddr(7),
      O => IsAddressInCurrentCache1_carry_i_6_n_0
    );
IsAddressInCurrentCache1_carry_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache2BaseAddr(3),
      I1 => VBB_ReadAddr(8),
      I2 => VBB_ReadAddr(10),
      I3 => currentCache2BaseAddr(5),
      I4 => VBB_ReadAddr(9),
      I5 => currentCache2BaseAddr(4),
      O => IsAddressInCurrentCache1_carry_i_7_n_0
    );
IsAddressInCurrentCache1_carry_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache2BaseAddr(0),
      I1 => VBB_ReadAddr(5),
      I2 => VBB_ReadAddr(7),
      I3 => currentCache2BaseAddr(2),
      I4 => VBB_ReadAddr(6),
      I5 => currentCache2BaseAddr(1),
      O => IsAddressInCurrentCache1_carry_i_8_n_0
    );
\IsAddressInCurrentCache1_inferred__0/i__carry\: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => \IsAddressInCurrentCache1_inferred__0/i__carry_n_0\,
      CO(6) => \IsAddressInCurrentCache1_inferred__0/i__carry_n_1\,
      CO(5) => \IsAddressInCurrentCache1_inferred__0/i__carry_n_2\,
      CO(4) => \IsAddressInCurrentCache1_inferred__0/i__carry_n_3\,
      CO(3) => \NLW_IsAddressInCurrentCache1_inferred__0/i__carry_CO_UNCONNECTED\(3),
      CO(2) => \IsAddressInCurrentCache1_inferred__0/i__carry_n_5\,
      CO(1) => \IsAddressInCurrentCache1_inferred__0/i__carry_n_6\,
      CO(0) => \IsAddressInCurrentCache1_inferred__0/i__carry_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \NLW_IsAddressInCurrentCache1_inferred__0/i__carry_O_UNCONNECTED\(7 downto 0),
      S(7) => \i__carry_i_1_n_0\,
      S(6) => \i__carry_i_2_n_0\,
      S(5) => \i__carry_i_3_n_0\,
      S(4) => \i__carry_i_4_n_0\,
      S(3) => \i__carry_i_5_n_0\,
      S(2) => \i__carry_i_6_n_0\,
      S(1) => \i__carry_i_7_n_0\,
      S(0) => \i__carry_i_8_n_0\
    );
\IsAddressInCurrentCache1_inferred__0/i__carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => \IsAddressInCurrentCache1_inferred__0/i__carry_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_IsAddressInCurrentCache1_inferred__0/i__carry__0_CO_UNCONNECTED\(7 downto 1),
      CO(0) => IsAddressInCurrentCache10_out,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \NLW_IsAddressInCurrentCache1_inferred__0/i__carry__0_O_UNCONNECTED\(7 downto 0),
      S(7 downto 1) => B"0000000",
      S(0) => \i__carry__0_i_1_n_0\
    );
\IsAddressInCurrentCache1_inferred__1/i__carry\: unisim.vcomponents.CARRY8
     port map (
      CI => '1',
      CI_TOP => '0',
      CO(7) => \IsAddressInCurrentCache1_inferred__1/i__carry_n_0\,
      CO(6) => \IsAddressInCurrentCache1_inferred__1/i__carry_n_1\,
      CO(5) => \IsAddressInCurrentCache1_inferred__1/i__carry_n_2\,
      CO(4) => \IsAddressInCurrentCache1_inferred__1/i__carry_n_3\,
      CO(3) => \NLW_IsAddressInCurrentCache1_inferred__1/i__carry_CO_UNCONNECTED\(3),
      CO(2) => \IsAddressInCurrentCache1_inferred__1/i__carry_n_5\,
      CO(1) => \IsAddressInCurrentCache1_inferred__1/i__carry_n_6\,
      CO(0) => \IsAddressInCurrentCache1_inferred__1/i__carry_n_7\,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \NLW_IsAddressInCurrentCache1_inferred__1/i__carry_O_UNCONNECTED\(7 downto 0),
      S(7) => \i__carry_i_1__0_n_0\,
      S(6) => \i__carry_i_2__0_n_0\,
      S(5) => \i__carry_i_3__0_n_0\,
      S(4) => \i__carry_i_4__0_n_0\,
      S(3) => \i__carry_i_5__0_n_0\,
      S(2) => \i__carry_i_6__0_n_0\,
      S(1) => \i__carry_i_7__0_n_0\,
      S(0) => \i__carry_i_8__0_n_0\
    );
\IsAddressInCurrentCache1_inferred__1/i__carry__0\: unisim.vcomponents.CARRY8
     port map (
      CI => \IsAddressInCurrentCache1_inferred__1/i__carry_n_0\,
      CI_TOP => '0',
      CO(7 downto 1) => \NLW_IsAddressInCurrentCache1_inferred__1/i__carry__0_CO_UNCONNECTED\(7 downto 1),
      CO(0) => IsAddressInCurrentCache11_out,
      DI(7 downto 0) => B"00000000",
      O(7 downto 0) => \NLW_IsAddressInCurrentCache1_inferred__1/i__carry__0_O_UNCONNECTED\(7 downto 0),
      S(7 downto 1) => B"0000000",
      S(0) => \i__carry__0_i_1__0_n_0\
    );
\VBB_ReadData[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(0),
      I1 => ReadDataFromCacheLine2_in(0),
      I2 => ReadDataFromCacheLine(0),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(0),
      O => p_0_in(0)
    );
\VBB_ReadData[0]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(96),
      I1 => currentCache1Data(64),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(32),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(0),
      O => \VBB_ReadData[0]_i_10_n_0\
    );
\VBB_ReadData[0]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(224),
      I1 => currentCache1Data(192),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(160),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(128),
      O => \VBB_ReadData[0]_i_11_n_0\
    );
\VBB_ReadData[0]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(96),
      I1 => currentCache0Data(64),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(32),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(0),
      O => \VBB_ReadData[0]_i_12_n_0\
    );
\VBB_ReadData[0]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(224),
      I1 => currentCache0Data(192),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(160),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(128),
      O => \VBB_ReadData[0]_i_13_n_0\
    );
\VBB_ReadData[0]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(0),
      I1 => data2(0),
      I2 => VBB_ReadAddr(3),
      I3 => data1(0),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[0]\,
      O => \VBB_ReadData[0]_i_14_n_0\
    );
\VBB_ReadData[0]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(0),
      I1 => data6(0),
      I2 => VBB_ReadAddr(3),
      I3 => data5(0),
      I4 => VBB_ReadAddr(2),
      I5 => data4(0),
      O => \VBB_ReadData[0]_i_15_n_0\
    );
\VBB_ReadData[0]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(96),
      I1 => currentCache2Data(64),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(32),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(0),
      O => \VBB_ReadData[0]_i_16_n_0\
    );
\VBB_ReadData[0]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(224),
      I1 => currentCache2Data(192),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(160),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(128),
      O => \VBB_ReadData[0]_i_17_n_0\
    );
\VBB_ReadData[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[24]_i_2_n_0\,
      I1 => \VBB_ReadData_reg[8]_i_6_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[16]_i_6_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[0]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(0)
    );
\VBB_ReadData[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[24]_i_3_n_0\,
      I1 => \VBB_ReadData_reg[8]_i_7_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[16]_i_7_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[0]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(0)
    );
\VBB_ReadData[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ret__223\(24),
      I1 => \ret__223\(8),
      I2 => VBB_ReadAddr(0),
      I3 => \ret__223\(16),
      I4 => VBB_ReadAddr(1),
      I5 => \ret__223\(0),
      O => ReadDataFromCacheLine(0)
    );
\VBB_ReadData[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[24]_i_9_n_0\,
      I1 => \VBB_ReadData_reg[8]_i_9_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[16]_i_9_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[0]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(0)
    );
\VBB_ReadData[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(10),
      I1 => ReadDataFromCacheLine2_in(10),
      I2 => ReadDataFromCacheLine(10),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(10),
      O => p_0_in(10)
    );
\VBB_ReadData[10]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(106),
      I1 => currentCache1Data(74),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(42),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(10),
      O => \VBB_ReadData[10]_i_10_n_0\
    );
\VBB_ReadData[10]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(234),
      I1 => currentCache1Data(202),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(170),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(138),
      O => \VBB_ReadData[10]_i_11_n_0\
    );
\VBB_ReadData[10]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(106),
      I1 => currentCache0Data(74),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(42),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(10),
      O => \VBB_ReadData[10]_i_12_n_0\
    );
\VBB_ReadData[10]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(234),
      I1 => currentCache0Data(202),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(170),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(138),
      O => \VBB_ReadData[10]_i_13_n_0\
    );
\VBB_ReadData[10]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(10),
      I1 => data2(10),
      I2 => VBB_ReadAddr(3),
      I3 => data1(10),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[10]\,
      O => \VBB_ReadData[10]_i_14_n_0\
    );
\VBB_ReadData[10]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(10),
      I1 => data6(10),
      I2 => VBB_ReadAddr(3),
      I3 => data5(10),
      I4 => VBB_ReadAddr(2),
      I5 => data4(10),
      O => \VBB_ReadData[10]_i_15_n_0\
    );
\VBB_ReadData[10]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(106),
      I1 => currentCache2Data(74),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(42),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(10),
      O => \VBB_ReadData[10]_i_16_n_0\
    );
\VBB_ReadData[10]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(234),
      I1 => currentCache2Data(202),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(170),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(138),
      O => \VBB_ReadData[10]_i_17_n_0\
    );
\VBB_ReadData[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[18]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[26]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[10]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(10)
    );
\VBB_ReadData[10]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[18]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[26]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[10]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(10)
    );
\VBB_ReadData[10]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \ret__223\(18),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(26),
      I3 => VBB_ReadAddr(1),
      I4 => \ret__223\(10),
      O => ReadDataFromCacheLine(10)
    );
\VBB_ReadData[10]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[18]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[26]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[10]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(10)
    );
\VBB_ReadData[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(11),
      I1 => ReadDataFromCacheLine2_in(11),
      I2 => ReadDataFromCacheLine(11),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(11),
      O => p_0_in(11)
    );
\VBB_ReadData[11]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(107),
      I1 => currentCache1Data(75),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(43),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(11),
      O => \VBB_ReadData[11]_i_10_n_0\
    );
\VBB_ReadData[11]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(235),
      I1 => currentCache1Data(203),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(171),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(139),
      O => \VBB_ReadData[11]_i_11_n_0\
    );
\VBB_ReadData[11]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(107),
      I1 => currentCache0Data(75),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(43),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(11),
      O => \VBB_ReadData[11]_i_12_n_0\
    );
\VBB_ReadData[11]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(235),
      I1 => currentCache0Data(203),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(171),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(139),
      O => \VBB_ReadData[11]_i_13_n_0\
    );
\VBB_ReadData[11]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(11),
      I1 => data2(11),
      I2 => VBB_ReadAddr(3),
      I3 => data1(11),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[11]\,
      O => \VBB_ReadData[11]_i_14_n_0\
    );
\VBB_ReadData[11]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(11),
      I1 => data6(11),
      I2 => VBB_ReadAddr(3),
      I3 => data5(11),
      I4 => VBB_ReadAddr(2),
      I5 => data4(11),
      O => \VBB_ReadData[11]_i_15_n_0\
    );
\VBB_ReadData[11]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(107),
      I1 => currentCache2Data(75),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(43),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(11),
      O => \VBB_ReadData[11]_i_16_n_0\
    );
\VBB_ReadData[11]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(235),
      I1 => currentCache2Data(203),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(171),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(139),
      O => \VBB_ReadData[11]_i_17_n_0\
    );
\VBB_ReadData[11]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[19]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[27]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[11]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(11)
    );
\VBB_ReadData[11]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[19]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[27]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[11]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(11)
    );
\VBB_ReadData[11]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \ret__223\(19),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(27),
      I3 => VBB_ReadAddr(1),
      I4 => \ret__223\(11),
      O => ReadDataFromCacheLine(11)
    );
\VBB_ReadData[11]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[19]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[27]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[11]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(11)
    );
\VBB_ReadData[12]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(12),
      I1 => ReadDataFromCacheLine2_in(12),
      I2 => ReadDataFromCacheLine(12),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(12),
      O => p_0_in(12)
    );
\VBB_ReadData[12]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(108),
      I1 => currentCache1Data(76),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(44),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(12),
      O => \VBB_ReadData[12]_i_10_n_0\
    );
\VBB_ReadData[12]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(236),
      I1 => currentCache1Data(204),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(172),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(140),
      O => \VBB_ReadData[12]_i_11_n_0\
    );
\VBB_ReadData[12]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(108),
      I1 => currentCache0Data(76),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(44),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(12),
      O => \VBB_ReadData[12]_i_12_n_0\
    );
\VBB_ReadData[12]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(236),
      I1 => currentCache0Data(204),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(172),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(140),
      O => \VBB_ReadData[12]_i_13_n_0\
    );
\VBB_ReadData[12]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(12),
      I1 => data2(12),
      I2 => VBB_ReadAddr(3),
      I3 => data1(12),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[12]\,
      O => \VBB_ReadData[12]_i_14_n_0\
    );
\VBB_ReadData[12]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(12),
      I1 => data6(12),
      I2 => VBB_ReadAddr(3),
      I3 => data5(12),
      I4 => VBB_ReadAddr(2),
      I5 => data4(12),
      O => \VBB_ReadData[12]_i_15_n_0\
    );
\VBB_ReadData[12]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(108),
      I1 => currentCache2Data(76),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(44),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(12),
      O => \VBB_ReadData[12]_i_16_n_0\
    );
\VBB_ReadData[12]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(236),
      I1 => currentCache2Data(204),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(172),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(140),
      O => \VBB_ReadData[12]_i_17_n_0\
    );
\VBB_ReadData[12]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[20]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[28]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[12]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(12)
    );
\VBB_ReadData[12]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[20]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[28]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[12]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(12)
    );
\VBB_ReadData[12]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \ret__223\(20),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(28),
      I3 => VBB_ReadAddr(1),
      I4 => \ret__223\(12),
      O => ReadDataFromCacheLine(12)
    );
\VBB_ReadData[12]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[20]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[28]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[12]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(12)
    );
\VBB_ReadData[13]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(13),
      I1 => ReadDataFromCacheLine2_in(13),
      I2 => ReadDataFromCacheLine(13),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(13),
      O => p_0_in(13)
    );
\VBB_ReadData[13]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(109),
      I1 => currentCache1Data(77),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(45),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(13),
      O => \VBB_ReadData[13]_i_10_n_0\
    );
\VBB_ReadData[13]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(237),
      I1 => currentCache1Data(205),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(173),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(141),
      O => \VBB_ReadData[13]_i_11_n_0\
    );
\VBB_ReadData[13]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(109),
      I1 => currentCache0Data(77),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(45),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(13),
      O => \VBB_ReadData[13]_i_12_n_0\
    );
\VBB_ReadData[13]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(237),
      I1 => currentCache0Data(205),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(173),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(141),
      O => \VBB_ReadData[13]_i_13_n_0\
    );
\VBB_ReadData[13]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(13),
      I1 => data2(13),
      I2 => VBB_ReadAddr(3),
      I3 => data1(13),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[13]\,
      O => \VBB_ReadData[13]_i_14_n_0\
    );
\VBB_ReadData[13]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(13),
      I1 => data6(13),
      I2 => VBB_ReadAddr(3),
      I3 => data5(13),
      I4 => VBB_ReadAddr(2),
      I5 => data4(13),
      O => \VBB_ReadData[13]_i_15_n_0\
    );
\VBB_ReadData[13]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(109),
      I1 => currentCache2Data(77),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(45),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(13),
      O => \VBB_ReadData[13]_i_16_n_0\
    );
\VBB_ReadData[13]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(237),
      I1 => currentCache2Data(205),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(173),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(141),
      O => \VBB_ReadData[13]_i_17_n_0\
    );
\VBB_ReadData[13]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[21]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[29]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[13]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(13)
    );
\VBB_ReadData[13]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[21]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[29]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[13]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(13)
    );
\VBB_ReadData[13]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \ret__223\(21),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(29),
      I3 => VBB_ReadAddr(1),
      I4 => \ret__223\(13),
      O => ReadDataFromCacheLine(13)
    );
\VBB_ReadData[13]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[21]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[29]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[13]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(13)
    );
\VBB_ReadData[14]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(14),
      I1 => ReadDataFromCacheLine2_in(14),
      I2 => ReadDataFromCacheLine(14),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(14),
      O => p_0_in(14)
    );
\VBB_ReadData[14]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(110),
      I1 => currentCache1Data(78),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(46),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(14),
      O => \VBB_ReadData[14]_i_10_n_0\
    );
\VBB_ReadData[14]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(238),
      I1 => currentCache1Data(206),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(174),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(142),
      O => \VBB_ReadData[14]_i_11_n_0\
    );
\VBB_ReadData[14]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(110),
      I1 => currentCache0Data(78),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(46),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(14),
      O => \VBB_ReadData[14]_i_12_n_0\
    );
\VBB_ReadData[14]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(238),
      I1 => currentCache0Data(206),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(174),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(142),
      O => \VBB_ReadData[14]_i_13_n_0\
    );
\VBB_ReadData[14]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(14),
      I1 => data2(14),
      I2 => VBB_ReadAddr(3),
      I3 => data1(14),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[14]\,
      O => \VBB_ReadData[14]_i_14_n_0\
    );
\VBB_ReadData[14]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(14),
      I1 => data6(14),
      I2 => VBB_ReadAddr(3),
      I3 => data5(14),
      I4 => VBB_ReadAddr(2),
      I5 => data4(14),
      O => \VBB_ReadData[14]_i_15_n_0\
    );
\VBB_ReadData[14]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(110),
      I1 => currentCache2Data(78),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(46),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(14),
      O => \VBB_ReadData[14]_i_16_n_0\
    );
\VBB_ReadData[14]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(238),
      I1 => currentCache2Data(206),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(174),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(142),
      O => \VBB_ReadData[14]_i_17_n_0\
    );
\VBB_ReadData[14]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[22]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[30]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[14]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(14)
    );
\VBB_ReadData[14]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[22]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[30]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[14]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(14)
    );
\VBB_ReadData[14]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \ret__223\(22),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(30),
      I3 => VBB_ReadAddr(1),
      I4 => \ret__223\(14),
      O => ReadDataFromCacheLine(14)
    );
\VBB_ReadData[14]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[22]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[30]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[14]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(14)
    );
\VBB_ReadData[15]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(15),
      I1 => ReadDataFromCacheLine2_in(15),
      I2 => ReadDataFromCacheLine(15),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(15),
      O => p_0_in(15)
    );
\VBB_ReadData[15]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(111),
      I1 => currentCache1Data(79),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(47),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(15),
      O => \VBB_ReadData[15]_i_10_n_0\
    );
\VBB_ReadData[15]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(239),
      I1 => currentCache1Data(207),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(175),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(143),
      O => \VBB_ReadData[15]_i_11_n_0\
    );
\VBB_ReadData[15]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(111),
      I1 => currentCache0Data(79),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(47),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(15),
      O => \VBB_ReadData[15]_i_12_n_0\
    );
\VBB_ReadData[15]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(239),
      I1 => currentCache0Data(207),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(175),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(143),
      O => \VBB_ReadData[15]_i_13_n_0\
    );
\VBB_ReadData[15]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(15),
      I1 => data2(15),
      I2 => VBB_ReadAddr(3),
      I3 => data1(15),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[15]\,
      O => \VBB_ReadData[15]_i_14_n_0\
    );
\VBB_ReadData[15]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(15),
      I1 => data6(15),
      I2 => VBB_ReadAddr(3),
      I3 => data5(15),
      I4 => VBB_ReadAddr(2),
      I5 => data4(15),
      O => \VBB_ReadData[15]_i_15_n_0\
    );
\VBB_ReadData[15]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(111),
      I1 => currentCache2Data(79),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(47),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(15),
      O => \VBB_ReadData[15]_i_16_n_0\
    );
\VBB_ReadData[15]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(239),
      I1 => currentCache2Data(207),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(175),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(143),
      O => \VBB_ReadData[15]_i_17_n_0\
    );
\VBB_ReadData[15]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[23]_i_8_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[31]_i_5_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[15]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(15)
    );
\VBB_ReadData[15]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[23]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[31]_i_6_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[15]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(15)
    );
\VBB_ReadData[15]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \ret__223\(23),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(31),
      I3 => VBB_ReadAddr(1),
      I4 => \ret__223\(15),
      O => ReadDataFromCacheLine(15)
    );
\VBB_ReadData[15]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[23]_i_11_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[31]_i_13_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[15]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(15)
    );
\VBB_ReadData[16]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \VBB_ReadData[16]_i_2_n_0\,
      I1 => \VBB_ReadData[16]_i_3_n_0\,
      I2 => \VBB_ReadData[16]_i_4_n_0\,
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => \VBB_ReadData[16]_i_5_n_0\,
      O => p_0_in(16)
    );
\VBB_ReadData[16]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(112),
      I1 => currentCache1Data(80),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(48),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(16),
      O => \VBB_ReadData[16]_i_10_n_0\
    );
\VBB_ReadData[16]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(240),
      I1 => currentCache1Data(208),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(176),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(144),
      O => \VBB_ReadData[16]_i_11_n_0\
    );
\VBB_ReadData[16]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(112),
      I1 => currentCache0Data(80),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(48),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(16),
      O => \VBB_ReadData[16]_i_12_n_0\
    );
\VBB_ReadData[16]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(240),
      I1 => currentCache0Data(208),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(176),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(144),
      O => \VBB_ReadData[16]_i_13_n_0\
    );
\VBB_ReadData[16]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(16),
      I1 => data2(16),
      I2 => VBB_ReadAddr(3),
      I3 => data1(16),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[16]\,
      O => \VBB_ReadData[16]_i_14_n_0\
    );
\VBB_ReadData[16]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(16),
      I1 => data6(16),
      I2 => VBB_ReadAddr(3),
      I3 => data5(16),
      I4 => VBB_ReadAddr(2),
      I5 => data4(16),
      O => \VBB_ReadData[16]_i_15_n_0\
    );
\VBB_ReadData[16]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(112),
      I1 => currentCache2Data(80),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(48),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(16),
      O => \VBB_ReadData[16]_i_16_n_0\
    );
\VBB_ReadData[16]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(240),
      I1 => currentCache2Data(208),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(176),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(144),
      O => \VBB_ReadData[16]_i_17_n_0\
    );
\VBB_ReadData[16]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[16]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[24]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[16]_i_2_n_0\
    );
\VBB_ReadData[16]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[16]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[24]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[16]_i_3_n_0\
    );
\VBB_ReadData[16]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \ret__223\(16),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(24),
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[16]_i_4_n_0\
    );
\VBB_ReadData[16]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[16]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[24]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[16]_i_5_n_0\
    );
\VBB_ReadData[17]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \VBB_ReadData[17]_i_2_n_0\,
      I1 => \VBB_ReadData[17]_i_3_n_0\,
      I2 => \VBB_ReadData[17]_i_4_n_0\,
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => \VBB_ReadData[17]_i_5_n_0\,
      O => p_0_in(17)
    );
\VBB_ReadData[17]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(113),
      I1 => currentCache1Data(81),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(49),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(17),
      O => \VBB_ReadData[17]_i_10_n_0\
    );
\VBB_ReadData[17]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(241),
      I1 => currentCache1Data(209),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(177),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(145),
      O => \VBB_ReadData[17]_i_11_n_0\
    );
\VBB_ReadData[17]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(113),
      I1 => currentCache0Data(81),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(49),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(17),
      O => \VBB_ReadData[17]_i_12_n_0\
    );
\VBB_ReadData[17]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(241),
      I1 => currentCache0Data(209),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(177),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(145),
      O => \VBB_ReadData[17]_i_13_n_0\
    );
\VBB_ReadData[17]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(17),
      I1 => data2(17),
      I2 => VBB_ReadAddr(3),
      I3 => data1(17),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[17]\,
      O => \VBB_ReadData[17]_i_14_n_0\
    );
\VBB_ReadData[17]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(17),
      I1 => data6(17),
      I2 => VBB_ReadAddr(3),
      I3 => data5(17),
      I4 => VBB_ReadAddr(2),
      I5 => data4(17),
      O => \VBB_ReadData[17]_i_15_n_0\
    );
\VBB_ReadData[17]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(113),
      I1 => currentCache2Data(81),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(49),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(17),
      O => \VBB_ReadData[17]_i_16_n_0\
    );
\VBB_ReadData[17]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(241),
      I1 => currentCache2Data(209),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(177),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(145),
      O => \VBB_ReadData[17]_i_17_n_0\
    );
\VBB_ReadData[17]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[17]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[25]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[17]_i_2_n_0\
    );
\VBB_ReadData[17]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[17]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[25]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[17]_i_3_n_0\
    );
\VBB_ReadData[17]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \ret__223\(17),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(25),
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[17]_i_4_n_0\
    );
\VBB_ReadData[17]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[17]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[25]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[17]_i_5_n_0\
    );
\VBB_ReadData[18]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \VBB_ReadData[18]_i_2_n_0\,
      I1 => \VBB_ReadData[18]_i_3_n_0\,
      I2 => \VBB_ReadData[18]_i_4_n_0\,
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => \VBB_ReadData[18]_i_5_n_0\,
      O => p_0_in(18)
    );
\VBB_ReadData[18]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(114),
      I1 => currentCache1Data(82),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(50),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(18),
      O => \VBB_ReadData[18]_i_10_n_0\
    );
\VBB_ReadData[18]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(242),
      I1 => currentCache1Data(210),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(178),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(146),
      O => \VBB_ReadData[18]_i_11_n_0\
    );
\VBB_ReadData[18]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(114),
      I1 => currentCache0Data(82),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(50),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(18),
      O => \VBB_ReadData[18]_i_12_n_0\
    );
\VBB_ReadData[18]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(242),
      I1 => currentCache0Data(210),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(178),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(146),
      O => \VBB_ReadData[18]_i_13_n_0\
    );
\VBB_ReadData[18]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(18),
      I1 => data2(18),
      I2 => VBB_ReadAddr(3),
      I3 => data1(18),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[18]\,
      O => \VBB_ReadData[18]_i_14_n_0\
    );
\VBB_ReadData[18]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(18),
      I1 => data6(18),
      I2 => VBB_ReadAddr(3),
      I3 => data5(18),
      I4 => VBB_ReadAddr(2),
      I5 => data4(18),
      O => \VBB_ReadData[18]_i_15_n_0\
    );
\VBB_ReadData[18]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(114),
      I1 => currentCache2Data(82),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(50),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(18),
      O => \VBB_ReadData[18]_i_16_n_0\
    );
\VBB_ReadData[18]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(242),
      I1 => currentCache2Data(210),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(178),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(146),
      O => \VBB_ReadData[18]_i_17_n_0\
    );
\VBB_ReadData[18]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[18]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[26]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[18]_i_2_n_0\
    );
\VBB_ReadData[18]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[18]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[26]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[18]_i_3_n_0\
    );
\VBB_ReadData[18]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \ret__223\(18),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(26),
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[18]_i_4_n_0\
    );
\VBB_ReadData[18]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[18]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[26]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[18]_i_5_n_0\
    );
\VBB_ReadData[19]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \VBB_ReadData[19]_i_2_n_0\,
      I1 => \VBB_ReadData[19]_i_3_n_0\,
      I2 => \VBB_ReadData[19]_i_4_n_0\,
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => \VBB_ReadData[19]_i_5_n_0\,
      O => p_0_in(19)
    );
\VBB_ReadData[19]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(115),
      I1 => currentCache1Data(83),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(51),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(19),
      O => \VBB_ReadData[19]_i_10_n_0\
    );
\VBB_ReadData[19]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(243),
      I1 => currentCache1Data(211),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(179),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(147),
      O => \VBB_ReadData[19]_i_11_n_0\
    );
\VBB_ReadData[19]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(115),
      I1 => currentCache0Data(83),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(51),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(19),
      O => \VBB_ReadData[19]_i_12_n_0\
    );
\VBB_ReadData[19]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(243),
      I1 => currentCache0Data(211),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(179),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(147),
      O => \VBB_ReadData[19]_i_13_n_0\
    );
\VBB_ReadData[19]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(19),
      I1 => data2(19),
      I2 => VBB_ReadAddr(3),
      I3 => data1(19),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[19]\,
      O => \VBB_ReadData[19]_i_14_n_0\
    );
\VBB_ReadData[19]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(19),
      I1 => data6(19),
      I2 => VBB_ReadAddr(3),
      I3 => data5(19),
      I4 => VBB_ReadAddr(2),
      I5 => data4(19),
      O => \VBB_ReadData[19]_i_15_n_0\
    );
\VBB_ReadData[19]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(115),
      I1 => currentCache2Data(83),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(51),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(19),
      O => \VBB_ReadData[19]_i_16_n_0\
    );
\VBB_ReadData[19]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(243),
      I1 => currentCache2Data(211),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(179),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(147),
      O => \VBB_ReadData[19]_i_17_n_0\
    );
\VBB_ReadData[19]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[19]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[27]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[19]_i_2_n_0\
    );
\VBB_ReadData[19]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[19]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[27]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[19]_i_3_n_0\
    );
\VBB_ReadData[19]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \ret__223\(19),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(27),
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[19]_i_4_n_0\
    );
\VBB_ReadData[19]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[19]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[27]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[19]_i_5_n_0\
    );
\VBB_ReadData[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(1),
      I1 => ReadDataFromCacheLine2_in(1),
      I2 => ReadDataFromCacheLine(1),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(1),
      O => p_0_in(1)
    );
\VBB_ReadData[1]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(97),
      I1 => currentCache1Data(65),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(33),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(1),
      O => \VBB_ReadData[1]_i_10_n_0\
    );
\VBB_ReadData[1]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(225),
      I1 => currentCache1Data(193),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(161),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(129),
      O => \VBB_ReadData[1]_i_11_n_0\
    );
\VBB_ReadData[1]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(97),
      I1 => currentCache0Data(65),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(33),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(1),
      O => \VBB_ReadData[1]_i_12_n_0\
    );
\VBB_ReadData[1]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(225),
      I1 => currentCache0Data(193),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(161),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(129),
      O => \VBB_ReadData[1]_i_13_n_0\
    );
\VBB_ReadData[1]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(1),
      I1 => data2(1),
      I2 => VBB_ReadAddr(3),
      I3 => data1(1),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[1]\,
      O => \VBB_ReadData[1]_i_14_n_0\
    );
\VBB_ReadData[1]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(1),
      I1 => data6(1),
      I2 => VBB_ReadAddr(3),
      I3 => data5(1),
      I4 => VBB_ReadAddr(2),
      I5 => data4(1),
      O => \VBB_ReadData[1]_i_15_n_0\
    );
\VBB_ReadData[1]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(97),
      I1 => currentCache2Data(65),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(33),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(1),
      O => \VBB_ReadData[1]_i_16_n_0\
    );
\VBB_ReadData[1]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(225),
      I1 => currentCache2Data(193),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(161),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(129),
      O => \VBB_ReadData[1]_i_17_n_0\
    );
\VBB_ReadData[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[25]_i_2_n_0\,
      I1 => \VBB_ReadData_reg[9]_i_6_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[17]_i_6_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[1]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(1)
    );
\VBB_ReadData[1]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[25]_i_3_n_0\,
      I1 => \VBB_ReadData_reg[9]_i_7_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[17]_i_7_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[1]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(1)
    );
\VBB_ReadData[1]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ret__223\(25),
      I1 => \ret__223\(9),
      I2 => VBB_ReadAddr(0),
      I3 => \ret__223\(17),
      I4 => VBB_ReadAddr(1),
      I5 => \ret__223\(1),
      O => ReadDataFromCacheLine(1)
    );
\VBB_ReadData[1]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[25]_i_9_n_0\,
      I1 => \VBB_ReadData_reg[9]_i_9_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[17]_i_9_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[1]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(1)
    );
\VBB_ReadData[20]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \VBB_ReadData[20]_i_2_n_0\,
      I1 => \VBB_ReadData[20]_i_3_n_0\,
      I2 => \VBB_ReadData[20]_i_4_n_0\,
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => \VBB_ReadData[20]_i_5_n_0\,
      O => p_0_in(20)
    );
\VBB_ReadData[20]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(116),
      I1 => currentCache1Data(84),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(52),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(20),
      O => \VBB_ReadData[20]_i_10_n_0\
    );
\VBB_ReadData[20]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(244),
      I1 => currentCache1Data(212),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(180),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(148),
      O => \VBB_ReadData[20]_i_11_n_0\
    );
\VBB_ReadData[20]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(116),
      I1 => currentCache0Data(84),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(52),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(20),
      O => \VBB_ReadData[20]_i_12_n_0\
    );
\VBB_ReadData[20]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(244),
      I1 => currentCache0Data(212),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(180),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(148),
      O => \VBB_ReadData[20]_i_13_n_0\
    );
\VBB_ReadData[20]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(20),
      I1 => data2(20),
      I2 => VBB_ReadAddr(3),
      I3 => data1(20),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[20]\,
      O => \VBB_ReadData[20]_i_14_n_0\
    );
\VBB_ReadData[20]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(20),
      I1 => data6(20),
      I2 => VBB_ReadAddr(3),
      I3 => data5(20),
      I4 => VBB_ReadAddr(2),
      I5 => data4(20),
      O => \VBB_ReadData[20]_i_15_n_0\
    );
\VBB_ReadData[20]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(116),
      I1 => currentCache2Data(84),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(52),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(20),
      O => \VBB_ReadData[20]_i_16_n_0\
    );
\VBB_ReadData[20]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(244),
      I1 => currentCache2Data(212),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(180),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(148),
      O => \VBB_ReadData[20]_i_17_n_0\
    );
\VBB_ReadData[20]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[20]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[28]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[20]_i_2_n_0\
    );
\VBB_ReadData[20]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[20]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[28]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[20]_i_3_n_0\
    );
\VBB_ReadData[20]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \ret__223\(20),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(28),
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[20]_i_4_n_0\
    );
\VBB_ReadData[20]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[20]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[28]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[20]_i_5_n_0\
    );
\VBB_ReadData[21]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \VBB_ReadData[21]_i_2_n_0\,
      I1 => \VBB_ReadData[21]_i_3_n_0\,
      I2 => \VBB_ReadData[21]_i_4_n_0\,
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => \VBB_ReadData[21]_i_5_n_0\,
      O => p_0_in(21)
    );
\VBB_ReadData[21]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(117),
      I1 => currentCache1Data(85),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(53),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(21),
      O => \VBB_ReadData[21]_i_10_n_0\
    );
\VBB_ReadData[21]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(245),
      I1 => currentCache1Data(213),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(181),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(149),
      O => \VBB_ReadData[21]_i_11_n_0\
    );
\VBB_ReadData[21]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(117),
      I1 => currentCache0Data(85),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(53),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(21),
      O => \VBB_ReadData[21]_i_12_n_0\
    );
\VBB_ReadData[21]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(245),
      I1 => currentCache0Data(213),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(181),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(149),
      O => \VBB_ReadData[21]_i_13_n_0\
    );
\VBB_ReadData[21]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(21),
      I1 => data2(21),
      I2 => VBB_ReadAddr(3),
      I3 => data1(21),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[21]\,
      O => \VBB_ReadData[21]_i_14_n_0\
    );
\VBB_ReadData[21]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(21),
      I1 => data6(21),
      I2 => VBB_ReadAddr(3),
      I3 => data5(21),
      I4 => VBB_ReadAddr(2),
      I5 => data4(21),
      O => \VBB_ReadData[21]_i_15_n_0\
    );
\VBB_ReadData[21]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(117),
      I1 => currentCache2Data(85),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(53),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(21),
      O => \VBB_ReadData[21]_i_16_n_0\
    );
\VBB_ReadData[21]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(245),
      I1 => currentCache2Data(213),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(181),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(149),
      O => \VBB_ReadData[21]_i_17_n_0\
    );
\VBB_ReadData[21]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[21]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[29]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[21]_i_2_n_0\
    );
\VBB_ReadData[21]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[21]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[29]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[21]_i_3_n_0\
    );
\VBB_ReadData[21]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \ret__223\(21),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(29),
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[21]_i_4_n_0\
    );
\VBB_ReadData[21]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[21]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[29]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[21]_i_5_n_0\
    );
\VBB_ReadData[22]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \VBB_ReadData[22]_i_2_n_0\,
      I1 => \VBB_ReadData[22]_i_3_n_0\,
      I2 => \VBB_ReadData[22]_i_4_n_0\,
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => \VBB_ReadData[22]_i_5_n_0\,
      O => p_0_in(22)
    );
\VBB_ReadData[22]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(118),
      I1 => currentCache1Data(86),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(54),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(22),
      O => \VBB_ReadData[22]_i_10_n_0\
    );
\VBB_ReadData[22]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(246),
      I1 => currentCache1Data(214),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(182),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(150),
      O => \VBB_ReadData[22]_i_11_n_0\
    );
\VBB_ReadData[22]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(118),
      I1 => currentCache0Data(86),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(54),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(22),
      O => \VBB_ReadData[22]_i_12_n_0\
    );
\VBB_ReadData[22]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(246),
      I1 => currentCache0Data(214),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(182),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(150),
      O => \VBB_ReadData[22]_i_13_n_0\
    );
\VBB_ReadData[22]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(22),
      I1 => data2(22),
      I2 => VBB_ReadAddr(3),
      I3 => data1(22),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[22]\,
      O => \VBB_ReadData[22]_i_14_n_0\
    );
\VBB_ReadData[22]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(22),
      I1 => data6(22),
      I2 => VBB_ReadAddr(3),
      I3 => data5(22),
      I4 => VBB_ReadAddr(2),
      I5 => data4(22),
      O => \VBB_ReadData[22]_i_15_n_0\
    );
\VBB_ReadData[22]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(118),
      I1 => currentCache2Data(86),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(54),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(22),
      O => \VBB_ReadData[22]_i_16_n_0\
    );
\VBB_ReadData[22]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(246),
      I1 => currentCache2Data(214),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(182),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(150),
      O => \VBB_ReadData[22]_i_17_n_0\
    );
\VBB_ReadData[22]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[22]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[30]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[22]_i_2_n_0\
    );
\VBB_ReadData[22]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[22]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[30]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[22]_i_3_n_0\
    );
\VBB_ReadData[22]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \ret__223\(22),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(30),
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[22]_i_4_n_0\
    );
\VBB_ReadData[22]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[22]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[30]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[22]_i_5_n_0\
    );
\VBB_ReadData[23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \VBB_ReadData[23]_i_2_n_0\,
      I1 => \VBB_ReadData[23]_i_3_n_0\,
      I2 => \VBB_ReadData[23]_i_4_n_0\,
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => \VBB_ReadData[23]_i_7_n_0\,
      O => p_0_in(23)
    );
\VBB_ReadData[23]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(119),
      I1 => currentCache1Data(87),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(55),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(23),
      O => \VBB_ReadData[23]_i_12_n_0\
    );
\VBB_ReadData[23]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(247),
      I1 => currentCache1Data(215),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(183),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(151),
      O => \VBB_ReadData[23]_i_13_n_0\
    );
\VBB_ReadData[23]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(119),
      I1 => currentCache0Data(87),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(55),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(23),
      O => \VBB_ReadData[23]_i_14_n_0\
    );
\VBB_ReadData[23]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(247),
      I1 => currentCache0Data(215),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(183),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(151),
      O => \VBB_ReadData[23]_i_15_n_0\
    );
\VBB_ReadData[23]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(23),
      I1 => data2(23),
      I2 => VBB_ReadAddr(3),
      I3 => data1(23),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[23]\,
      O => \VBB_ReadData[23]_i_16_n_0\
    );
\VBB_ReadData[23]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(23),
      I1 => data6(23),
      I2 => VBB_ReadAddr(3),
      I3 => data5(23),
      I4 => VBB_ReadAddr(2),
      I5 => data4(23),
      O => \VBB_ReadData[23]_i_17_n_0\
    );
\VBB_ReadData[23]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(119),
      I1 => currentCache2Data(87),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(55),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(23),
      O => \VBB_ReadData[23]_i_18_n_0\
    );
\VBB_ReadData[23]_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(247),
      I1 => currentCache2Data(215),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(183),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(151),
      O => \VBB_ReadData[23]_i_19_n_0\
    );
\VBB_ReadData[23]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[23]_i_8_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[31]_i_5_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[23]_i_2_n_0\
    );
\VBB_ReadData[23]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[23]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[31]_i_6_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[23]_i_3_n_0\
    );
\VBB_ReadData[23]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \ret__223\(23),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(31),
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[23]_i_4_n_0\
    );
\VBB_ReadData[23]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"0E"
    )
        port map (
      I0 => \IsAddressInCurrentCache0_carry__0_n_7\,
      I1 => IsAddressInCurrentCache1,
      I2 => IsAddressInCurrentCache10_out,
      O => \VBB_ReadData[23]_i_5_n_0\
    );
\VBB_ReadData[23]_i_6\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BA"
    )
        port map (
      I0 => IsAddressInCurrentCache10_out,
      I1 => IsAddressInCurrentCache1,
      I2 => \IsAddressInCurrentCache0_carry__0_n_7\,
      O => GetCurrentCacheIndexForAddress(0)
    );
\VBB_ReadData[23]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00E2"
    )
        port map (
      I0 => \VBB_ReadData_reg[23]_i_11_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[31]_i_13_n_0\,
      I3 => VBB_ReadAddr(1),
      O => \VBB_ReadData[23]_i_7_n_0\
    );
\VBB_ReadData[24]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCC808080"
    )
        port map (
      I0 => IsAddressInCurrentCache10_out,
      I1 => \VBB_ReadData[31]_i_4_n_0\,
      I2 => \VBB_ReadData_reg[24]_i_2_n_0\,
      I3 => \VBB_ReadData_reg[24]_i_3_n_0\,
      I4 => \VBB_ReadData[31]_i_7_n_0\,
      I5 => \VBB_ReadData[24]_i_4_n_0\,
      O => p_0_in(24)
    );
\VBB_ReadData[24]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(120),
      I1 => currentCache2Data(88),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(56),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(24),
      O => \VBB_ReadData[24]_i_11_n_0\
    );
\VBB_ReadData[24]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(248),
      I1 => currentCache2Data(216),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(184),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(152),
      O => \VBB_ReadData[24]_i_12_n_0\
    );
\VBB_ReadData[24]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(24),
      I1 => data2(24),
      I2 => VBB_ReadAddr(3),
      I3 => data1(24),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[24]\,
      O => \VBB_ReadData[24]_i_13_n_0\
    );
\VBB_ReadData[24]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(24),
      I1 => data6(24),
      I2 => VBB_ReadAddr(3),
      I3 => data5(24),
      I4 => VBB_ReadAddr(2),
      I5 => data4(24),
      O => \VBB_ReadData[24]_i_14_n_0\
    );
\VBB_ReadData[24]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2320202000000000"
    )
        port map (
      I0 => \VBB_ReadData_reg[24]_i_9_n_0\,
      I1 => IsAddressInCurrentCache10_out,
      I2 => IsAddressInCurrentCache1,
      I3 => \IsAddressInCurrentCache0_carry__0_n_7\,
      I4 => \ret__223\(24),
      I5 => \VBB_ReadData[31]_i_4_n_0\,
      O => \VBB_ReadData[24]_i_4_n_0\
    );
\VBB_ReadData[24]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(120),
      I1 => currentCache1Data(88),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(56),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(24),
      O => \VBB_ReadData[24]_i_5_n_0\
    );
\VBB_ReadData[24]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(248),
      I1 => currentCache1Data(216),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(184),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(152),
      O => \VBB_ReadData[24]_i_6_n_0\
    );
\VBB_ReadData[24]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(120),
      I1 => currentCache0Data(88),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(56),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(24),
      O => \VBB_ReadData[24]_i_7_n_0\
    );
\VBB_ReadData[24]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(248),
      I1 => currentCache0Data(216),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(184),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(152),
      O => \VBB_ReadData[24]_i_8_n_0\
    );
\VBB_ReadData[25]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCC808080"
    )
        port map (
      I0 => IsAddressInCurrentCache10_out,
      I1 => \VBB_ReadData[31]_i_4_n_0\,
      I2 => \VBB_ReadData_reg[25]_i_2_n_0\,
      I3 => \VBB_ReadData_reg[25]_i_3_n_0\,
      I4 => \VBB_ReadData[31]_i_7_n_0\,
      I5 => \VBB_ReadData[25]_i_4_n_0\,
      O => p_0_in(25)
    );
\VBB_ReadData[25]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(121),
      I1 => currentCache2Data(89),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(57),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(25),
      O => \VBB_ReadData[25]_i_11_n_0\
    );
\VBB_ReadData[25]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(249),
      I1 => currentCache2Data(217),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(185),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(153),
      O => \VBB_ReadData[25]_i_12_n_0\
    );
\VBB_ReadData[25]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(25),
      I1 => data2(25),
      I2 => VBB_ReadAddr(3),
      I3 => data1(25),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[25]\,
      O => \VBB_ReadData[25]_i_13_n_0\
    );
\VBB_ReadData[25]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(25),
      I1 => data6(25),
      I2 => VBB_ReadAddr(3),
      I3 => data5(25),
      I4 => VBB_ReadAddr(2),
      I5 => data4(25),
      O => \VBB_ReadData[25]_i_14_n_0\
    );
\VBB_ReadData[25]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2320202000000000"
    )
        port map (
      I0 => \VBB_ReadData_reg[25]_i_9_n_0\,
      I1 => IsAddressInCurrentCache10_out,
      I2 => IsAddressInCurrentCache1,
      I3 => \IsAddressInCurrentCache0_carry__0_n_7\,
      I4 => \ret__223\(25),
      I5 => \VBB_ReadData[31]_i_4_n_0\,
      O => \VBB_ReadData[25]_i_4_n_0\
    );
\VBB_ReadData[25]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(121),
      I1 => currentCache1Data(89),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(57),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(25),
      O => \VBB_ReadData[25]_i_5_n_0\
    );
\VBB_ReadData[25]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(249),
      I1 => currentCache1Data(217),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(185),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(153),
      O => \VBB_ReadData[25]_i_6_n_0\
    );
\VBB_ReadData[25]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(121),
      I1 => currentCache0Data(89),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(57),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(25),
      O => \VBB_ReadData[25]_i_7_n_0\
    );
\VBB_ReadData[25]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(249),
      I1 => currentCache0Data(217),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(185),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(153),
      O => \VBB_ReadData[25]_i_8_n_0\
    );
\VBB_ReadData[26]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCC808080"
    )
        port map (
      I0 => IsAddressInCurrentCache10_out,
      I1 => \VBB_ReadData[31]_i_4_n_0\,
      I2 => \VBB_ReadData_reg[26]_i_2_n_0\,
      I3 => \VBB_ReadData_reg[26]_i_3_n_0\,
      I4 => \VBB_ReadData[31]_i_7_n_0\,
      I5 => \VBB_ReadData[26]_i_4_n_0\,
      O => p_0_in(26)
    );
\VBB_ReadData[26]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(122),
      I1 => currentCache2Data(90),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(58),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(26),
      O => \VBB_ReadData[26]_i_11_n_0\
    );
\VBB_ReadData[26]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(250),
      I1 => currentCache2Data(218),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(186),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(154),
      O => \VBB_ReadData[26]_i_12_n_0\
    );
\VBB_ReadData[26]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(26),
      I1 => data2(26),
      I2 => VBB_ReadAddr(3),
      I3 => data1(26),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[26]\,
      O => \VBB_ReadData[26]_i_13_n_0\
    );
\VBB_ReadData[26]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(26),
      I1 => data6(26),
      I2 => VBB_ReadAddr(3),
      I3 => data5(26),
      I4 => VBB_ReadAddr(2),
      I5 => data4(26),
      O => \VBB_ReadData[26]_i_14_n_0\
    );
\VBB_ReadData[26]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2320202000000000"
    )
        port map (
      I0 => \VBB_ReadData_reg[26]_i_9_n_0\,
      I1 => IsAddressInCurrentCache10_out,
      I2 => IsAddressInCurrentCache1,
      I3 => \IsAddressInCurrentCache0_carry__0_n_7\,
      I4 => \ret__223\(26),
      I5 => \VBB_ReadData[31]_i_4_n_0\,
      O => \VBB_ReadData[26]_i_4_n_0\
    );
\VBB_ReadData[26]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(122),
      I1 => currentCache1Data(90),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(58),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(26),
      O => \VBB_ReadData[26]_i_5_n_0\
    );
\VBB_ReadData[26]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(250),
      I1 => currentCache1Data(218),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(186),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(154),
      O => \VBB_ReadData[26]_i_6_n_0\
    );
\VBB_ReadData[26]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(122),
      I1 => currentCache0Data(90),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(58),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(26),
      O => \VBB_ReadData[26]_i_7_n_0\
    );
\VBB_ReadData[26]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(250),
      I1 => currentCache0Data(218),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(186),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(154),
      O => \VBB_ReadData[26]_i_8_n_0\
    );
\VBB_ReadData[27]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCC808080"
    )
        port map (
      I0 => IsAddressInCurrentCache10_out,
      I1 => \VBB_ReadData[31]_i_4_n_0\,
      I2 => \VBB_ReadData_reg[27]_i_2_n_0\,
      I3 => \VBB_ReadData_reg[27]_i_3_n_0\,
      I4 => \VBB_ReadData[31]_i_7_n_0\,
      I5 => \VBB_ReadData[27]_i_4_n_0\,
      O => p_0_in(27)
    );
\VBB_ReadData[27]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(123),
      I1 => currentCache2Data(91),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(59),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(27),
      O => \VBB_ReadData[27]_i_11_n_0\
    );
\VBB_ReadData[27]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(251),
      I1 => currentCache2Data(219),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(187),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(155),
      O => \VBB_ReadData[27]_i_12_n_0\
    );
\VBB_ReadData[27]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(27),
      I1 => data2(27),
      I2 => VBB_ReadAddr(3),
      I3 => data1(27),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[27]\,
      O => \VBB_ReadData[27]_i_13_n_0\
    );
\VBB_ReadData[27]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(27),
      I1 => data6(27),
      I2 => VBB_ReadAddr(3),
      I3 => data5(27),
      I4 => VBB_ReadAddr(2),
      I5 => data4(27),
      O => \VBB_ReadData[27]_i_14_n_0\
    );
\VBB_ReadData[27]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2320202000000000"
    )
        port map (
      I0 => \VBB_ReadData_reg[27]_i_9_n_0\,
      I1 => IsAddressInCurrentCache10_out,
      I2 => IsAddressInCurrentCache1,
      I3 => \IsAddressInCurrentCache0_carry__0_n_7\,
      I4 => \ret__223\(27),
      I5 => \VBB_ReadData[31]_i_4_n_0\,
      O => \VBB_ReadData[27]_i_4_n_0\
    );
\VBB_ReadData[27]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(123),
      I1 => currentCache1Data(91),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(59),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(27),
      O => \VBB_ReadData[27]_i_5_n_0\
    );
\VBB_ReadData[27]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(251),
      I1 => currentCache1Data(219),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(187),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(155),
      O => \VBB_ReadData[27]_i_6_n_0\
    );
\VBB_ReadData[27]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(123),
      I1 => currentCache0Data(91),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(59),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(27),
      O => \VBB_ReadData[27]_i_7_n_0\
    );
\VBB_ReadData[27]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(251),
      I1 => currentCache0Data(219),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(187),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(155),
      O => \VBB_ReadData[27]_i_8_n_0\
    );
\VBB_ReadData[28]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCC808080"
    )
        port map (
      I0 => IsAddressInCurrentCache10_out,
      I1 => \VBB_ReadData[31]_i_4_n_0\,
      I2 => \VBB_ReadData_reg[28]_i_2_n_0\,
      I3 => \VBB_ReadData_reg[28]_i_3_n_0\,
      I4 => \VBB_ReadData[31]_i_7_n_0\,
      I5 => \VBB_ReadData[28]_i_4_n_0\,
      O => p_0_in(28)
    );
\VBB_ReadData[28]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(124),
      I1 => currentCache2Data(92),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(60),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(28),
      O => \VBB_ReadData[28]_i_11_n_0\
    );
\VBB_ReadData[28]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(252),
      I1 => currentCache2Data(220),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(188),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(156),
      O => \VBB_ReadData[28]_i_12_n_0\
    );
\VBB_ReadData[28]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(28),
      I1 => data2(28),
      I2 => VBB_ReadAddr(3),
      I3 => data1(28),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[28]\,
      O => \VBB_ReadData[28]_i_13_n_0\
    );
\VBB_ReadData[28]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(28),
      I1 => data6(28),
      I2 => VBB_ReadAddr(3),
      I3 => data5(28),
      I4 => VBB_ReadAddr(2),
      I5 => data4(28),
      O => \VBB_ReadData[28]_i_14_n_0\
    );
\VBB_ReadData[28]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2320202000000000"
    )
        port map (
      I0 => \VBB_ReadData_reg[28]_i_9_n_0\,
      I1 => IsAddressInCurrentCache10_out,
      I2 => IsAddressInCurrentCache1,
      I3 => \IsAddressInCurrentCache0_carry__0_n_7\,
      I4 => \ret__223\(28),
      I5 => \VBB_ReadData[31]_i_4_n_0\,
      O => \VBB_ReadData[28]_i_4_n_0\
    );
\VBB_ReadData[28]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(124),
      I1 => currentCache1Data(92),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(60),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(28),
      O => \VBB_ReadData[28]_i_5_n_0\
    );
\VBB_ReadData[28]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(252),
      I1 => currentCache1Data(220),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(188),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(156),
      O => \VBB_ReadData[28]_i_6_n_0\
    );
\VBB_ReadData[28]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(124),
      I1 => currentCache0Data(92),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(60),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(28),
      O => \VBB_ReadData[28]_i_7_n_0\
    );
\VBB_ReadData[28]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(252),
      I1 => currentCache0Data(220),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(188),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(156),
      O => \VBB_ReadData[28]_i_8_n_0\
    );
\VBB_ReadData[29]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCC808080"
    )
        port map (
      I0 => IsAddressInCurrentCache10_out,
      I1 => \VBB_ReadData[31]_i_4_n_0\,
      I2 => \VBB_ReadData_reg[29]_i_2_n_0\,
      I3 => \VBB_ReadData_reg[29]_i_3_n_0\,
      I4 => \VBB_ReadData[31]_i_7_n_0\,
      I5 => \VBB_ReadData[29]_i_4_n_0\,
      O => p_0_in(29)
    );
\VBB_ReadData[29]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(125),
      I1 => currentCache2Data(93),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(61),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(29),
      O => \VBB_ReadData[29]_i_11_n_0\
    );
\VBB_ReadData[29]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(253),
      I1 => currentCache2Data(221),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(189),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(157),
      O => \VBB_ReadData[29]_i_12_n_0\
    );
\VBB_ReadData[29]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(29),
      I1 => data2(29),
      I2 => VBB_ReadAddr(3),
      I3 => data1(29),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[29]\,
      O => \VBB_ReadData[29]_i_13_n_0\
    );
\VBB_ReadData[29]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(29),
      I1 => data6(29),
      I2 => VBB_ReadAddr(3),
      I3 => data5(29),
      I4 => VBB_ReadAddr(2),
      I5 => data4(29),
      O => \VBB_ReadData[29]_i_14_n_0\
    );
\VBB_ReadData[29]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2320202000000000"
    )
        port map (
      I0 => \VBB_ReadData_reg[29]_i_9_n_0\,
      I1 => IsAddressInCurrentCache10_out,
      I2 => IsAddressInCurrentCache1,
      I3 => \IsAddressInCurrentCache0_carry__0_n_7\,
      I4 => \ret__223\(29),
      I5 => \VBB_ReadData[31]_i_4_n_0\,
      O => \VBB_ReadData[29]_i_4_n_0\
    );
\VBB_ReadData[29]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(125),
      I1 => currentCache1Data(93),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(61),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(29),
      O => \VBB_ReadData[29]_i_5_n_0\
    );
\VBB_ReadData[29]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(253),
      I1 => currentCache1Data(221),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(189),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(157),
      O => \VBB_ReadData[29]_i_6_n_0\
    );
\VBB_ReadData[29]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(125),
      I1 => currentCache0Data(93),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(61),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(29),
      O => \VBB_ReadData[29]_i_7_n_0\
    );
\VBB_ReadData[29]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(253),
      I1 => currentCache0Data(221),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(189),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(157),
      O => \VBB_ReadData[29]_i_8_n_0\
    );
\VBB_ReadData[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(2),
      I1 => ReadDataFromCacheLine2_in(2),
      I2 => ReadDataFromCacheLine(2),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(2),
      O => p_0_in(2)
    );
\VBB_ReadData[2]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(98),
      I1 => currentCache1Data(66),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(34),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(2),
      O => \VBB_ReadData[2]_i_10_n_0\
    );
\VBB_ReadData[2]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(226),
      I1 => currentCache1Data(194),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(162),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(130),
      O => \VBB_ReadData[2]_i_11_n_0\
    );
\VBB_ReadData[2]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(98),
      I1 => currentCache0Data(66),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(34),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(2),
      O => \VBB_ReadData[2]_i_12_n_0\
    );
\VBB_ReadData[2]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(226),
      I1 => currentCache0Data(194),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(162),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(130),
      O => \VBB_ReadData[2]_i_13_n_0\
    );
\VBB_ReadData[2]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(2),
      I1 => data2(2),
      I2 => VBB_ReadAddr(3),
      I3 => data1(2),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[2]\,
      O => \VBB_ReadData[2]_i_14_n_0\
    );
\VBB_ReadData[2]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(2),
      I1 => data6(2),
      I2 => VBB_ReadAddr(3),
      I3 => data5(2),
      I4 => VBB_ReadAddr(2),
      I5 => data4(2),
      O => \VBB_ReadData[2]_i_15_n_0\
    );
\VBB_ReadData[2]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(98),
      I1 => currentCache2Data(66),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(34),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(2),
      O => \VBB_ReadData[2]_i_16_n_0\
    );
\VBB_ReadData[2]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(226),
      I1 => currentCache2Data(194),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(162),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(130),
      O => \VBB_ReadData[2]_i_17_n_0\
    );
\VBB_ReadData[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[26]_i_2_n_0\,
      I1 => \VBB_ReadData_reg[10]_i_6_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[18]_i_6_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[2]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(2)
    );
\VBB_ReadData[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[26]_i_3_n_0\,
      I1 => \VBB_ReadData_reg[10]_i_7_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[18]_i_7_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[2]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(2)
    );
\VBB_ReadData[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ret__223\(26),
      I1 => \ret__223\(10),
      I2 => VBB_ReadAddr(0),
      I3 => \ret__223\(18),
      I4 => VBB_ReadAddr(1),
      I5 => \ret__223\(2),
      O => ReadDataFromCacheLine(2)
    );
\VBB_ReadData[2]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[26]_i_9_n_0\,
      I1 => \VBB_ReadData_reg[10]_i_9_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[18]_i_9_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[2]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(2)
    );
\VBB_ReadData[30]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCC808080"
    )
        port map (
      I0 => IsAddressInCurrentCache10_out,
      I1 => \VBB_ReadData[31]_i_4_n_0\,
      I2 => \VBB_ReadData_reg[30]_i_2_n_0\,
      I3 => \VBB_ReadData_reg[30]_i_3_n_0\,
      I4 => \VBB_ReadData[31]_i_7_n_0\,
      I5 => \VBB_ReadData[30]_i_4_n_0\,
      O => p_0_in(30)
    );
\VBB_ReadData[30]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(126),
      I1 => currentCache2Data(94),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(62),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(30),
      O => \VBB_ReadData[30]_i_11_n_0\
    );
\VBB_ReadData[30]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(254),
      I1 => currentCache2Data(222),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(190),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(158),
      O => \VBB_ReadData[30]_i_12_n_0\
    );
\VBB_ReadData[30]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(30),
      I1 => data2(30),
      I2 => VBB_ReadAddr(3),
      I3 => data1(30),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[30]\,
      O => \VBB_ReadData[30]_i_13_n_0\
    );
\VBB_ReadData[30]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(30),
      I1 => data6(30),
      I2 => VBB_ReadAddr(3),
      I3 => data5(30),
      I4 => VBB_ReadAddr(2),
      I5 => data4(30),
      O => \VBB_ReadData[30]_i_14_n_0\
    );
\VBB_ReadData[30]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2320202000000000"
    )
        port map (
      I0 => \VBB_ReadData_reg[30]_i_9_n_0\,
      I1 => IsAddressInCurrentCache10_out,
      I2 => IsAddressInCurrentCache1,
      I3 => \IsAddressInCurrentCache0_carry__0_n_7\,
      I4 => \ret__223\(30),
      I5 => \VBB_ReadData[31]_i_4_n_0\,
      O => \VBB_ReadData[30]_i_4_n_0\
    );
\VBB_ReadData[30]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(126),
      I1 => currentCache1Data(94),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(62),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(30),
      O => \VBB_ReadData[30]_i_5_n_0\
    );
\VBB_ReadData[30]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(254),
      I1 => currentCache1Data(222),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(190),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(158),
      O => \VBB_ReadData[30]_i_6_n_0\
    );
\VBB_ReadData[30]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(126),
      I1 => currentCache0Data(94),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(62),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(30),
      O => \VBB_ReadData[30]_i_7_n_0\
    );
\VBB_ReadData[30]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(254),
      I1 => currentCache0Data(222),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(190),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(158),
      O => \VBB_ReadData[30]_i_8_n_0\
    );
\VBB_ReadData[31]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \^dbg_state\(0),
      I1 => VBB_InvalidateIndexCache,
      I2 => VBB_ReadEnable,
      I3 => \IsAddressInCurrentCache__1\,
      O => \VBB_ReadData[31]_i_1_n_0\
    );
\VBB_ReadData[31]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(255),
      I1 => currentCache1Data(223),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(191),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(159),
      O => \VBB_ReadData[31]_i_10_n_0\
    );
\VBB_ReadData[31]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(127),
      I1 => currentCache0Data(95),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(63),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(31),
      O => \VBB_ReadData[31]_i_11_n_0\
    );
\VBB_ReadData[31]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(255),
      I1 => currentCache0Data(223),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(191),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(159),
      O => \VBB_ReadData[31]_i_12_n_0\
    );
\VBB_ReadData[31]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(127),
      I1 => currentCache2Data(95),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(63),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(31),
      O => \VBB_ReadData[31]_i_15_n_0\
    );
\VBB_ReadData[31]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(255),
      I1 => currentCache2Data(223),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(191),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(159),
      O => \VBB_ReadData[31]_i_16_n_0\
    );
\VBB_ReadData[31]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(31),
      I1 => data2(31),
      I2 => VBB_ReadAddr(3),
      I3 => data1(31),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[31]\,
      O => \VBB_ReadData[31]_i_17_n_0\
    );
\VBB_ReadData[31]_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(31),
      I1 => data6(31),
      I2 => VBB_ReadAddr(3),
      I3 => data5(31),
      I4 => VBB_ReadAddr(2),
      I5 => data4(31),
      O => \VBB_ReadData[31]_i_18_n_0\
    );
\VBB_ReadData[31]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFCC808080"
    )
        port map (
      I0 => IsAddressInCurrentCache10_out,
      I1 => \VBB_ReadData[31]_i_4_n_0\,
      I2 => \VBB_ReadData_reg[31]_i_5_n_0\,
      I3 => \VBB_ReadData_reg[31]_i_6_n_0\,
      I4 => \VBB_ReadData[31]_i_7_n_0\,
      I5 => \VBB_ReadData[31]_i_8_n_0\,
      O => p_0_in(31)
    );
\VBB_ReadData[31]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => IsAddressInCurrentCache11_out,
      I1 => IsAddressInCurrentCache1,
      I2 => \IsAddressInCurrentCache0_carry__0_n_7\,
      I3 => IsAddressInCurrentCache10_out,
      O => \IsAddressInCurrentCache__1\
    );
\VBB_ReadData[31]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => VBB_ReadAddr(1),
      I1 => VBB_ReadAddr(0),
      O => \VBB_ReadData[31]_i_4_n_0\
    );
\VBB_ReadData[31]_i_7\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => IsAddressInCurrentCache10_out,
      I1 => IsAddressInCurrentCache1,
      I2 => \IsAddressInCurrentCache0_carry__0_n_7\,
      O => \VBB_ReadData[31]_i_7_n_0\
    );
\VBB_ReadData[31]_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2320202000000000"
    )
        port map (
      I0 => \VBB_ReadData_reg[31]_i_13_n_0\,
      I1 => IsAddressInCurrentCache10_out,
      I2 => IsAddressInCurrentCache1,
      I3 => \IsAddressInCurrentCache0_carry__0_n_7\,
      I4 => \ret__223\(31),
      I5 => \VBB_ReadData[31]_i_4_n_0\,
      O => \VBB_ReadData[31]_i_8_n_0\
    );
\VBB_ReadData[31]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(127),
      I1 => currentCache1Data(95),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(63),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(31),
      O => \VBB_ReadData[31]_i_9_n_0\
    );
\VBB_ReadData[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(3),
      I1 => ReadDataFromCacheLine2_in(3),
      I2 => ReadDataFromCacheLine(3),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(3),
      O => p_0_in(3)
    );
\VBB_ReadData[3]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(99),
      I1 => currentCache1Data(67),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(35),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(3),
      O => \VBB_ReadData[3]_i_10_n_0\
    );
\VBB_ReadData[3]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(227),
      I1 => currentCache1Data(195),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(163),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(131),
      O => \VBB_ReadData[3]_i_11_n_0\
    );
\VBB_ReadData[3]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(99),
      I1 => currentCache0Data(67),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(35),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(3),
      O => \VBB_ReadData[3]_i_12_n_0\
    );
\VBB_ReadData[3]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(227),
      I1 => currentCache0Data(195),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(163),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(131),
      O => \VBB_ReadData[3]_i_13_n_0\
    );
\VBB_ReadData[3]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(3),
      I1 => data2(3),
      I2 => VBB_ReadAddr(3),
      I3 => data1(3),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[3]\,
      O => \VBB_ReadData[3]_i_14_n_0\
    );
\VBB_ReadData[3]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(3),
      I1 => data6(3),
      I2 => VBB_ReadAddr(3),
      I3 => data5(3),
      I4 => VBB_ReadAddr(2),
      I5 => data4(3),
      O => \VBB_ReadData[3]_i_15_n_0\
    );
\VBB_ReadData[3]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(99),
      I1 => currentCache2Data(67),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(35),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(3),
      O => \VBB_ReadData[3]_i_16_n_0\
    );
\VBB_ReadData[3]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(227),
      I1 => currentCache2Data(195),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(163),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(131),
      O => \VBB_ReadData[3]_i_17_n_0\
    );
\VBB_ReadData[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[27]_i_2_n_0\,
      I1 => \VBB_ReadData_reg[11]_i_6_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[19]_i_6_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[3]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(3)
    );
\VBB_ReadData[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[27]_i_3_n_0\,
      I1 => \VBB_ReadData_reg[11]_i_7_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[19]_i_7_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[3]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(3)
    );
\VBB_ReadData[3]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ret__223\(27),
      I1 => \ret__223\(11),
      I2 => VBB_ReadAddr(0),
      I3 => \ret__223\(19),
      I4 => VBB_ReadAddr(1),
      I5 => \ret__223\(3),
      O => ReadDataFromCacheLine(3)
    );
\VBB_ReadData[3]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[27]_i_9_n_0\,
      I1 => \VBB_ReadData_reg[11]_i_9_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[19]_i_9_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[3]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(3)
    );
\VBB_ReadData[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(4),
      I1 => ReadDataFromCacheLine2_in(4),
      I2 => ReadDataFromCacheLine(4),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(4),
      O => p_0_in(4)
    );
\VBB_ReadData[4]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(100),
      I1 => currentCache1Data(68),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(36),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(4),
      O => \VBB_ReadData[4]_i_10_n_0\
    );
\VBB_ReadData[4]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(228),
      I1 => currentCache1Data(196),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(164),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(132),
      O => \VBB_ReadData[4]_i_11_n_0\
    );
\VBB_ReadData[4]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(100),
      I1 => currentCache0Data(68),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(36),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(4),
      O => \VBB_ReadData[4]_i_12_n_0\
    );
\VBB_ReadData[4]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(228),
      I1 => currentCache0Data(196),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(164),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(132),
      O => \VBB_ReadData[4]_i_13_n_0\
    );
\VBB_ReadData[4]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(4),
      I1 => data2(4),
      I2 => VBB_ReadAddr(3),
      I3 => data1(4),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[4]\,
      O => \VBB_ReadData[4]_i_14_n_0\
    );
\VBB_ReadData[4]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(4),
      I1 => data6(4),
      I2 => VBB_ReadAddr(3),
      I3 => data5(4),
      I4 => VBB_ReadAddr(2),
      I5 => data4(4),
      O => \VBB_ReadData[4]_i_15_n_0\
    );
\VBB_ReadData[4]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(100),
      I1 => currentCache2Data(68),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(36),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(4),
      O => \VBB_ReadData[4]_i_16_n_0\
    );
\VBB_ReadData[4]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(228),
      I1 => currentCache2Data(196),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(164),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(132),
      O => \VBB_ReadData[4]_i_17_n_0\
    );
\VBB_ReadData[4]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[28]_i_2_n_0\,
      I1 => \VBB_ReadData_reg[12]_i_6_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[20]_i_6_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[4]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(4)
    );
\VBB_ReadData[4]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[28]_i_3_n_0\,
      I1 => \VBB_ReadData_reg[12]_i_7_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[20]_i_7_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[4]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(4)
    );
\VBB_ReadData[4]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ret__223\(28),
      I1 => \ret__223\(12),
      I2 => VBB_ReadAddr(0),
      I3 => \ret__223\(20),
      I4 => VBB_ReadAddr(1),
      I5 => \ret__223\(4),
      O => ReadDataFromCacheLine(4)
    );
\VBB_ReadData[4]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[28]_i_9_n_0\,
      I1 => \VBB_ReadData_reg[12]_i_9_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[20]_i_9_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[4]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(4)
    );
\VBB_ReadData[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(5),
      I1 => ReadDataFromCacheLine2_in(5),
      I2 => ReadDataFromCacheLine(5),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(5),
      O => p_0_in(5)
    );
\VBB_ReadData[5]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(101),
      I1 => currentCache1Data(69),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(37),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(5),
      O => \VBB_ReadData[5]_i_10_n_0\
    );
\VBB_ReadData[5]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(229),
      I1 => currentCache1Data(197),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(165),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(133),
      O => \VBB_ReadData[5]_i_11_n_0\
    );
\VBB_ReadData[5]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(101),
      I1 => currentCache0Data(69),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(37),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(5),
      O => \VBB_ReadData[5]_i_12_n_0\
    );
\VBB_ReadData[5]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(229),
      I1 => currentCache0Data(197),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(165),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(133),
      O => \VBB_ReadData[5]_i_13_n_0\
    );
\VBB_ReadData[5]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(5),
      I1 => data2(5),
      I2 => VBB_ReadAddr(3),
      I3 => data1(5),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[5]\,
      O => \VBB_ReadData[5]_i_14_n_0\
    );
\VBB_ReadData[5]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(5),
      I1 => data6(5),
      I2 => VBB_ReadAddr(3),
      I3 => data5(5),
      I4 => VBB_ReadAddr(2),
      I5 => data4(5),
      O => \VBB_ReadData[5]_i_15_n_0\
    );
\VBB_ReadData[5]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(101),
      I1 => currentCache2Data(69),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(37),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(5),
      O => \VBB_ReadData[5]_i_16_n_0\
    );
\VBB_ReadData[5]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(229),
      I1 => currentCache2Data(197),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(165),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(133),
      O => \VBB_ReadData[5]_i_17_n_0\
    );
\VBB_ReadData[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[29]_i_2_n_0\,
      I1 => \VBB_ReadData_reg[13]_i_6_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[21]_i_6_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[5]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(5)
    );
\VBB_ReadData[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[29]_i_3_n_0\,
      I1 => \VBB_ReadData_reg[13]_i_7_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[21]_i_7_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[5]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(5)
    );
\VBB_ReadData[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ret__223\(29),
      I1 => \ret__223\(13),
      I2 => VBB_ReadAddr(0),
      I3 => \ret__223\(21),
      I4 => VBB_ReadAddr(1),
      I5 => \ret__223\(5),
      O => ReadDataFromCacheLine(5)
    );
\VBB_ReadData[5]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[29]_i_9_n_0\,
      I1 => \VBB_ReadData_reg[13]_i_9_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[21]_i_9_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[5]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(5)
    );
\VBB_ReadData[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(6),
      I1 => ReadDataFromCacheLine2_in(6),
      I2 => ReadDataFromCacheLine(6),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(6),
      O => p_0_in(6)
    );
\VBB_ReadData[6]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(102),
      I1 => currentCache1Data(70),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(38),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(6),
      O => \VBB_ReadData[6]_i_10_n_0\
    );
\VBB_ReadData[6]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(230),
      I1 => currentCache1Data(198),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(166),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(134),
      O => \VBB_ReadData[6]_i_11_n_0\
    );
\VBB_ReadData[6]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(102),
      I1 => currentCache0Data(70),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(38),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(6),
      O => \VBB_ReadData[6]_i_12_n_0\
    );
\VBB_ReadData[6]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(230),
      I1 => currentCache0Data(198),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(166),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(134),
      O => \VBB_ReadData[6]_i_13_n_0\
    );
\VBB_ReadData[6]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(6),
      I1 => data2(6),
      I2 => VBB_ReadAddr(3),
      I3 => data1(6),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[6]\,
      O => \VBB_ReadData[6]_i_14_n_0\
    );
\VBB_ReadData[6]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(6),
      I1 => data6(6),
      I2 => VBB_ReadAddr(3),
      I3 => data5(6),
      I4 => VBB_ReadAddr(2),
      I5 => data4(6),
      O => \VBB_ReadData[6]_i_15_n_0\
    );
\VBB_ReadData[6]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(102),
      I1 => currentCache2Data(70),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(38),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(6),
      O => \VBB_ReadData[6]_i_16_n_0\
    );
\VBB_ReadData[6]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(230),
      I1 => currentCache2Data(198),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(166),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(134),
      O => \VBB_ReadData[6]_i_17_n_0\
    );
\VBB_ReadData[6]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[30]_i_2_n_0\,
      I1 => \VBB_ReadData_reg[14]_i_6_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[22]_i_6_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[6]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(6)
    );
\VBB_ReadData[6]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[30]_i_3_n_0\,
      I1 => \VBB_ReadData_reg[14]_i_7_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[22]_i_7_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[6]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(6)
    );
\VBB_ReadData[6]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ret__223\(30),
      I1 => \ret__223\(14),
      I2 => VBB_ReadAddr(0),
      I3 => \ret__223\(22),
      I4 => VBB_ReadAddr(1),
      I5 => \ret__223\(6),
      O => ReadDataFromCacheLine(6)
    );
\VBB_ReadData[6]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[30]_i_9_n_0\,
      I1 => \VBB_ReadData_reg[14]_i_9_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[22]_i_9_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[6]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(6)
    );
\VBB_ReadData[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(7),
      I1 => ReadDataFromCacheLine2_in(7),
      I2 => ReadDataFromCacheLine(7),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(7),
      O => p_0_in(7)
    );
\VBB_ReadData[7]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(103),
      I1 => currentCache1Data(71),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(39),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(7),
      O => \VBB_ReadData[7]_i_10_n_0\
    );
\VBB_ReadData[7]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(231),
      I1 => currentCache1Data(199),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(167),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(135),
      O => \VBB_ReadData[7]_i_11_n_0\
    );
\VBB_ReadData[7]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(103),
      I1 => currentCache0Data(71),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(39),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(7),
      O => \VBB_ReadData[7]_i_12_n_0\
    );
\VBB_ReadData[7]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(231),
      I1 => currentCache0Data(199),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(167),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(135),
      O => \VBB_ReadData[7]_i_13_n_0\
    );
\VBB_ReadData[7]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(7),
      I1 => data2(7),
      I2 => VBB_ReadAddr(3),
      I3 => data1(7),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[7]\,
      O => \VBB_ReadData[7]_i_14_n_0\
    );
\VBB_ReadData[7]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(7),
      I1 => data6(7),
      I2 => VBB_ReadAddr(3),
      I3 => data5(7),
      I4 => VBB_ReadAddr(2),
      I5 => data4(7),
      O => \VBB_ReadData[7]_i_15_n_0\
    );
\VBB_ReadData[7]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(103),
      I1 => currentCache2Data(71),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(39),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(7),
      O => \VBB_ReadData[7]_i_16_n_0\
    );
\VBB_ReadData[7]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(231),
      I1 => currentCache2Data(199),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(167),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(135),
      O => \VBB_ReadData[7]_i_17_n_0\
    );
\VBB_ReadData[7]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[31]_i_5_n_0\,
      I1 => \VBB_ReadData_reg[15]_i_6_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[23]_i_8_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[7]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(7)
    );
\VBB_ReadData[7]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[31]_i_6_n_0\,
      I1 => \VBB_ReadData_reg[15]_i_7_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[23]_i_9_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[7]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(7)
    );
\VBB_ReadData[7]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \ret__223\(31),
      I1 => \ret__223\(15),
      I2 => VBB_ReadAddr(0),
      I3 => \ret__223\(23),
      I4 => VBB_ReadAddr(1),
      I5 => \ret__223\(7),
      O => ReadDataFromCacheLine(7)
    );
\VBB_ReadData[7]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \VBB_ReadData_reg[31]_i_13_n_0\,
      I1 => \VBB_ReadData_reg[15]_i_9_n_0\,
      I2 => VBB_ReadAddr(0),
      I3 => \VBB_ReadData_reg[23]_i_11_n_0\,
      I4 => VBB_ReadAddr(1),
      I5 => \VBB_ReadData_reg[7]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(7)
    );
\VBB_ReadData[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(8),
      I1 => ReadDataFromCacheLine2_in(8),
      I2 => ReadDataFromCacheLine(8),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(8),
      O => p_0_in(8)
    );
\VBB_ReadData[8]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(104),
      I1 => currentCache1Data(72),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(40),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(8),
      O => \VBB_ReadData[8]_i_10_n_0\
    );
\VBB_ReadData[8]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(232),
      I1 => currentCache1Data(200),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(168),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(136),
      O => \VBB_ReadData[8]_i_11_n_0\
    );
\VBB_ReadData[8]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(104),
      I1 => currentCache0Data(72),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(40),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(8),
      O => \VBB_ReadData[8]_i_12_n_0\
    );
\VBB_ReadData[8]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(232),
      I1 => currentCache0Data(200),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(168),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(136),
      O => \VBB_ReadData[8]_i_13_n_0\
    );
\VBB_ReadData[8]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(8),
      I1 => data2(8),
      I2 => VBB_ReadAddr(3),
      I3 => data1(8),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[8]\,
      O => \VBB_ReadData[8]_i_14_n_0\
    );
\VBB_ReadData[8]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(8),
      I1 => data6(8),
      I2 => VBB_ReadAddr(3),
      I3 => data5(8),
      I4 => VBB_ReadAddr(2),
      I5 => data4(8),
      O => \VBB_ReadData[8]_i_15_n_0\
    );
\VBB_ReadData[8]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(104),
      I1 => currentCache2Data(72),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(40),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(8),
      O => \VBB_ReadData[8]_i_16_n_0\
    );
\VBB_ReadData[8]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(232),
      I1 => currentCache2Data(200),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(168),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(136),
      O => \VBB_ReadData[8]_i_17_n_0\
    );
\VBB_ReadData[8]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[16]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[24]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[8]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(8)
    );
\VBB_ReadData[8]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[16]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[24]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[8]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(8)
    );
\VBB_ReadData[8]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \ret__223\(16),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(24),
      I3 => VBB_ReadAddr(1),
      I4 => \ret__223\(8),
      O => ReadDataFromCacheLine(8)
    );
\VBB_ReadData[8]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[16]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[24]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[8]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(8)
    );
\VBB_ReadData[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => ReadDataFromCacheLine1_in(9),
      I1 => ReadDataFromCacheLine2_in(9),
      I2 => ReadDataFromCacheLine(9),
      I3 => \VBB_ReadData[23]_i_5_n_0\,
      I4 => GetCurrentCacheIndexForAddress(0),
      I5 => ReadDataFromCacheLine0_in(9),
      O => p_0_in(9)
    );
\VBB_ReadData[9]_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(105),
      I1 => currentCache1Data(73),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(41),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(9),
      O => \VBB_ReadData[9]_i_10_n_0\
    );
\VBB_ReadData[9]_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache1Data(233),
      I1 => currentCache1Data(201),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache1Data(169),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache1Data(137),
      O => \VBB_ReadData[9]_i_11_n_0\
    );
\VBB_ReadData[9]_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(105),
      I1 => currentCache0Data(73),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(41),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(9),
      O => \VBB_ReadData[9]_i_12_n_0\
    );
\VBB_ReadData[9]_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache0Data(233),
      I1 => currentCache0Data(201),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache0Data(169),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache0Data(137),
      O => \VBB_ReadData[9]_i_13_n_0\
    );
\VBB_ReadData[9]_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data3(9),
      I1 => data2(9),
      I2 => VBB_ReadAddr(3),
      I3 => data1(9),
      I4 => VBB_ReadAddr(2),
      I5 => \currentCache3Data_reg_n_0_[9]\,
      O => \VBB_ReadData[9]_i_14_n_0\
    );
\VBB_ReadData[9]_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => data7(9),
      I1 => data6(9),
      I2 => VBB_ReadAddr(3),
      I3 => data5(9),
      I4 => VBB_ReadAddr(2),
      I5 => data4(9),
      O => \VBB_ReadData[9]_i_15_n_0\
    );
\VBB_ReadData[9]_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(105),
      I1 => currentCache2Data(73),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(41),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(9),
      O => \VBB_ReadData[9]_i_16_n_0\
    );
\VBB_ReadData[9]_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => currentCache2Data(233),
      I1 => currentCache2Data(201),
      I2 => VBB_ReadAddr(3),
      I3 => currentCache2Data(169),
      I4 => VBB_ReadAddr(2),
      I5 => currentCache2Data(137),
      O => \VBB_ReadData[9]_i_17_n_0\
    );
\VBB_ReadData[9]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[17]_i_6_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[25]_i_2_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[9]_i_6_n_0\,
      O => ReadDataFromCacheLine1_in(9)
    );
\VBB_ReadData[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[17]_i_7_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[25]_i_3_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[9]_i_7_n_0\,
      O => ReadDataFromCacheLine2_in(9)
    );
\VBB_ReadData[9]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \ret__223\(17),
      I1 => VBB_ReadAddr(0),
      I2 => \ret__223\(25),
      I3 => VBB_ReadAddr(1),
      I4 => \ret__223\(9),
      O => ReadDataFromCacheLine(9)
    );
\VBB_ReadData[9]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"30BB3088"
    )
        port map (
      I0 => \VBB_ReadData_reg[17]_i_9_n_0\,
      I1 => VBB_ReadAddr(0),
      I2 => \VBB_ReadData_reg[25]_i_9_n_0\,
      I3 => VBB_ReadAddr(1),
      I4 => \VBB_ReadData_reg[9]_i_9_n_0\,
      O => ReadDataFromCacheLine0_in(9)
    );
\VBB_ReadData_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(0),
      Q => VBB_ReadData(0),
      R => '0'
    );
\VBB_ReadData_reg[0]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[0]_i_10_n_0\,
      I1 => \VBB_ReadData[0]_i_11_n_0\,
      O => \VBB_ReadData_reg[0]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[0]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[0]_i_12_n_0\,
      I1 => \VBB_ReadData[0]_i_13_n_0\,
      O => \VBB_ReadData_reg[0]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[0]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[0]_i_14_n_0\,
      I1 => \VBB_ReadData[0]_i_15_n_0\,
      O => \ret__223\(0),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[0]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[0]_i_16_n_0\,
      I1 => \VBB_ReadData[0]_i_17_n_0\,
      O => \VBB_ReadData_reg[0]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(10),
      Q => VBB_ReadData(10),
      R => '0'
    );
\VBB_ReadData_reg[10]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[10]_i_10_n_0\,
      I1 => \VBB_ReadData[10]_i_11_n_0\,
      O => \VBB_ReadData_reg[10]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[10]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[10]_i_12_n_0\,
      I1 => \VBB_ReadData[10]_i_13_n_0\,
      O => \VBB_ReadData_reg[10]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[10]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[10]_i_14_n_0\,
      I1 => \VBB_ReadData[10]_i_15_n_0\,
      O => \ret__223\(10),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[10]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[10]_i_16_n_0\,
      I1 => \VBB_ReadData[10]_i_17_n_0\,
      O => \VBB_ReadData_reg[10]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(11),
      Q => VBB_ReadData(11),
      R => '0'
    );
\VBB_ReadData_reg[11]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[11]_i_10_n_0\,
      I1 => \VBB_ReadData[11]_i_11_n_0\,
      O => \VBB_ReadData_reg[11]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[11]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[11]_i_12_n_0\,
      I1 => \VBB_ReadData[11]_i_13_n_0\,
      O => \VBB_ReadData_reg[11]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[11]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[11]_i_14_n_0\,
      I1 => \VBB_ReadData[11]_i_15_n_0\,
      O => \ret__223\(11),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[11]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[11]_i_16_n_0\,
      I1 => \VBB_ReadData[11]_i_17_n_0\,
      O => \VBB_ReadData_reg[11]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(12),
      Q => VBB_ReadData(12),
      R => '0'
    );
\VBB_ReadData_reg[12]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[12]_i_10_n_0\,
      I1 => \VBB_ReadData[12]_i_11_n_0\,
      O => \VBB_ReadData_reg[12]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[12]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[12]_i_12_n_0\,
      I1 => \VBB_ReadData[12]_i_13_n_0\,
      O => \VBB_ReadData_reg[12]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[12]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[12]_i_14_n_0\,
      I1 => \VBB_ReadData[12]_i_15_n_0\,
      O => \ret__223\(12),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[12]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[12]_i_16_n_0\,
      I1 => \VBB_ReadData[12]_i_17_n_0\,
      O => \VBB_ReadData_reg[12]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(13),
      Q => VBB_ReadData(13),
      R => '0'
    );
\VBB_ReadData_reg[13]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[13]_i_10_n_0\,
      I1 => \VBB_ReadData[13]_i_11_n_0\,
      O => \VBB_ReadData_reg[13]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[13]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[13]_i_12_n_0\,
      I1 => \VBB_ReadData[13]_i_13_n_0\,
      O => \VBB_ReadData_reg[13]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[13]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[13]_i_14_n_0\,
      I1 => \VBB_ReadData[13]_i_15_n_0\,
      O => \ret__223\(13),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[13]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[13]_i_16_n_0\,
      I1 => \VBB_ReadData[13]_i_17_n_0\,
      O => \VBB_ReadData_reg[13]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(14),
      Q => VBB_ReadData(14),
      R => '0'
    );
\VBB_ReadData_reg[14]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[14]_i_10_n_0\,
      I1 => \VBB_ReadData[14]_i_11_n_0\,
      O => \VBB_ReadData_reg[14]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[14]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[14]_i_12_n_0\,
      I1 => \VBB_ReadData[14]_i_13_n_0\,
      O => \VBB_ReadData_reg[14]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[14]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[14]_i_14_n_0\,
      I1 => \VBB_ReadData[14]_i_15_n_0\,
      O => \ret__223\(14),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[14]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[14]_i_16_n_0\,
      I1 => \VBB_ReadData[14]_i_17_n_0\,
      O => \VBB_ReadData_reg[14]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(15),
      Q => VBB_ReadData(15),
      R => '0'
    );
\VBB_ReadData_reg[15]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[15]_i_10_n_0\,
      I1 => \VBB_ReadData[15]_i_11_n_0\,
      O => \VBB_ReadData_reg[15]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[15]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[15]_i_12_n_0\,
      I1 => \VBB_ReadData[15]_i_13_n_0\,
      O => \VBB_ReadData_reg[15]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[15]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[15]_i_14_n_0\,
      I1 => \VBB_ReadData[15]_i_15_n_0\,
      O => \ret__223\(15),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[15]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[15]_i_16_n_0\,
      I1 => \VBB_ReadData[15]_i_17_n_0\,
      O => \VBB_ReadData_reg[15]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(16),
      Q => VBB_ReadData(16),
      R => '0'
    );
\VBB_ReadData_reg[16]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[16]_i_10_n_0\,
      I1 => \VBB_ReadData[16]_i_11_n_0\,
      O => \VBB_ReadData_reg[16]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[16]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[16]_i_12_n_0\,
      I1 => \VBB_ReadData[16]_i_13_n_0\,
      O => \VBB_ReadData_reg[16]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[16]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[16]_i_14_n_0\,
      I1 => \VBB_ReadData[16]_i_15_n_0\,
      O => \ret__223\(16),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[16]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[16]_i_16_n_0\,
      I1 => \VBB_ReadData[16]_i_17_n_0\,
      O => \VBB_ReadData_reg[16]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(17),
      Q => VBB_ReadData(17),
      R => '0'
    );
\VBB_ReadData_reg[17]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[17]_i_10_n_0\,
      I1 => \VBB_ReadData[17]_i_11_n_0\,
      O => \VBB_ReadData_reg[17]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[17]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[17]_i_12_n_0\,
      I1 => \VBB_ReadData[17]_i_13_n_0\,
      O => \VBB_ReadData_reg[17]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[17]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[17]_i_14_n_0\,
      I1 => \VBB_ReadData[17]_i_15_n_0\,
      O => \ret__223\(17),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[17]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[17]_i_16_n_0\,
      I1 => \VBB_ReadData[17]_i_17_n_0\,
      O => \VBB_ReadData_reg[17]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(18),
      Q => VBB_ReadData(18),
      R => '0'
    );
\VBB_ReadData_reg[18]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[18]_i_10_n_0\,
      I1 => \VBB_ReadData[18]_i_11_n_0\,
      O => \VBB_ReadData_reg[18]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[18]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[18]_i_12_n_0\,
      I1 => \VBB_ReadData[18]_i_13_n_0\,
      O => \VBB_ReadData_reg[18]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[18]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[18]_i_14_n_0\,
      I1 => \VBB_ReadData[18]_i_15_n_0\,
      O => \ret__223\(18),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[18]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[18]_i_16_n_0\,
      I1 => \VBB_ReadData[18]_i_17_n_0\,
      O => \VBB_ReadData_reg[18]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(19),
      Q => VBB_ReadData(19),
      R => '0'
    );
\VBB_ReadData_reg[19]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[19]_i_10_n_0\,
      I1 => \VBB_ReadData[19]_i_11_n_0\,
      O => \VBB_ReadData_reg[19]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[19]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[19]_i_12_n_0\,
      I1 => \VBB_ReadData[19]_i_13_n_0\,
      O => \VBB_ReadData_reg[19]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[19]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[19]_i_14_n_0\,
      I1 => \VBB_ReadData[19]_i_15_n_0\,
      O => \ret__223\(19),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[19]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[19]_i_16_n_0\,
      I1 => \VBB_ReadData[19]_i_17_n_0\,
      O => \VBB_ReadData_reg[19]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(1),
      Q => VBB_ReadData(1),
      R => '0'
    );
\VBB_ReadData_reg[1]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[1]_i_10_n_0\,
      I1 => \VBB_ReadData[1]_i_11_n_0\,
      O => \VBB_ReadData_reg[1]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[1]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[1]_i_12_n_0\,
      I1 => \VBB_ReadData[1]_i_13_n_0\,
      O => \VBB_ReadData_reg[1]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[1]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[1]_i_14_n_0\,
      I1 => \VBB_ReadData[1]_i_15_n_0\,
      O => \ret__223\(1),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[1]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[1]_i_16_n_0\,
      I1 => \VBB_ReadData[1]_i_17_n_0\,
      O => \VBB_ReadData_reg[1]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(20),
      Q => VBB_ReadData(20),
      R => '0'
    );
\VBB_ReadData_reg[20]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[20]_i_10_n_0\,
      I1 => \VBB_ReadData[20]_i_11_n_0\,
      O => \VBB_ReadData_reg[20]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[20]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[20]_i_12_n_0\,
      I1 => \VBB_ReadData[20]_i_13_n_0\,
      O => \VBB_ReadData_reg[20]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[20]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[20]_i_14_n_0\,
      I1 => \VBB_ReadData[20]_i_15_n_0\,
      O => \ret__223\(20),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[20]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[20]_i_16_n_0\,
      I1 => \VBB_ReadData[20]_i_17_n_0\,
      O => \VBB_ReadData_reg[20]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(21),
      Q => VBB_ReadData(21),
      R => '0'
    );
\VBB_ReadData_reg[21]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[21]_i_10_n_0\,
      I1 => \VBB_ReadData[21]_i_11_n_0\,
      O => \VBB_ReadData_reg[21]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[21]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[21]_i_12_n_0\,
      I1 => \VBB_ReadData[21]_i_13_n_0\,
      O => \VBB_ReadData_reg[21]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[21]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[21]_i_14_n_0\,
      I1 => \VBB_ReadData[21]_i_15_n_0\,
      O => \ret__223\(21),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[21]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[21]_i_16_n_0\,
      I1 => \VBB_ReadData[21]_i_17_n_0\,
      O => \VBB_ReadData_reg[21]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(22),
      Q => VBB_ReadData(22),
      R => '0'
    );
\VBB_ReadData_reg[22]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[22]_i_10_n_0\,
      I1 => \VBB_ReadData[22]_i_11_n_0\,
      O => \VBB_ReadData_reg[22]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[22]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[22]_i_12_n_0\,
      I1 => \VBB_ReadData[22]_i_13_n_0\,
      O => \VBB_ReadData_reg[22]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[22]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[22]_i_14_n_0\,
      I1 => \VBB_ReadData[22]_i_15_n_0\,
      O => \ret__223\(22),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[22]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[22]_i_16_n_0\,
      I1 => \VBB_ReadData[22]_i_17_n_0\,
      O => \VBB_ReadData_reg[22]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(23),
      Q => VBB_ReadData(23),
      R => '0'
    );
\VBB_ReadData_reg[23]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[23]_i_16_n_0\,
      I1 => \VBB_ReadData[23]_i_17_n_0\,
      O => \ret__223\(23),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[23]_i_11\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[23]_i_18_n_0\,
      I1 => \VBB_ReadData[23]_i_19_n_0\,
      O => \VBB_ReadData_reg[23]_i_11_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[23]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[23]_i_12_n_0\,
      I1 => \VBB_ReadData[23]_i_13_n_0\,
      O => \VBB_ReadData_reg[23]_i_8_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[23]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[23]_i_14_n_0\,
      I1 => \VBB_ReadData[23]_i_15_n_0\,
      O => \VBB_ReadData_reg[23]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(24),
      Q => VBB_ReadData(24),
      R => '0'
    );
\VBB_ReadData_reg[24]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[24]_i_13_n_0\,
      I1 => \VBB_ReadData[24]_i_14_n_0\,
      O => \ret__223\(24),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[24]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[24]_i_5_n_0\,
      I1 => \VBB_ReadData[24]_i_6_n_0\,
      O => \VBB_ReadData_reg[24]_i_2_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[24]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[24]_i_7_n_0\,
      I1 => \VBB_ReadData[24]_i_8_n_0\,
      O => \VBB_ReadData_reg[24]_i_3_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[24]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[24]_i_11_n_0\,
      I1 => \VBB_ReadData[24]_i_12_n_0\,
      O => \VBB_ReadData_reg[24]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(25),
      Q => VBB_ReadData(25),
      R => '0'
    );
\VBB_ReadData_reg[25]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[25]_i_13_n_0\,
      I1 => \VBB_ReadData[25]_i_14_n_0\,
      O => \ret__223\(25),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[25]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[25]_i_5_n_0\,
      I1 => \VBB_ReadData[25]_i_6_n_0\,
      O => \VBB_ReadData_reg[25]_i_2_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[25]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[25]_i_7_n_0\,
      I1 => \VBB_ReadData[25]_i_8_n_0\,
      O => \VBB_ReadData_reg[25]_i_3_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[25]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[25]_i_11_n_0\,
      I1 => \VBB_ReadData[25]_i_12_n_0\,
      O => \VBB_ReadData_reg[25]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(26),
      Q => VBB_ReadData(26),
      R => '0'
    );
\VBB_ReadData_reg[26]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[26]_i_13_n_0\,
      I1 => \VBB_ReadData[26]_i_14_n_0\,
      O => \ret__223\(26),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[26]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[26]_i_5_n_0\,
      I1 => \VBB_ReadData[26]_i_6_n_0\,
      O => \VBB_ReadData_reg[26]_i_2_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[26]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[26]_i_7_n_0\,
      I1 => \VBB_ReadData[26]_i_8_n_0\,
      O => \VBB_ReadData_reg[26]_i_3_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[26]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[26]_i_11_n_0\,
      I1 => \VBB_ReadData[26]_i_12_n_0\,
      O => \VBB_ReadData_reg[26]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(27),
      Q => VBB_ReadData(27),
      R => '0'
    );
\VBB_ReadData_reg[27]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[27]_i_13_n_0\,
      I1 => \VBB_ReadData[27]_i_14_n_0\,
      O => \ret__223\(27),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[27]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[27]_i_5_n_0\,
      I1 => \VBB_ReadData[27]_i_6_n_0\,
      O => \VBB_ReadData_reg[27]_i_2_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[27]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[27]_i_7_n_0\,
      I1 => \VBB_ReadData[27]_i_8_n_0\,
      O => \VBB_ReadData_reg[27]_i_3_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[27]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[27]_i_11_n_0\,
      I1 => \VBB_ReadData[27]_i_12_n_0\,
      O => \VBB_ReadData_reg[27]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(28),
      Q => VBB_ReadData(28),
      R => '0'
    );
\VBB_ReadData_reg[28]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[28]_i_13_n_0\,
      I1 => \VBB_ReadData[28]_i_14_n_0\,
      O => \ret__223\(28),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[28]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[28]_i_5_n_0\,
      I1 => \VBB_ReadData[28]_i_6_n_0\,
      O => \VBB_ReadData_reg[28]_i_2_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[28]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[28]_i_7_n_0\,
      I1 => \VBB_ReadData[28]_i_8_n_0\,
      O => \VBB_ReadData_reg[28]_i_3_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[28]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[28]_i_11_n_0\,
      I1 => \VBB_ReadData[28]_i_12_n_0\,
      O => \VBB_ReadData_reg[28]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(29),
      Q => VBB_ReadData(29),
      R => '0'
    );
\VBB_ReadData_reg[29]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[29]_i_13_n_0\,
      I1 => \VBB_ReadData[29]_i_14_n_0\,
      O => \ret__223\(29),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[29]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[29]_i_5_n_0\,
      I1 => \VBB_ReadData[29]_i_6_n_0\,
      O => \VBB_ReadData_reg[29]_i_2_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[29]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[29]_i_7_n_0\,
      I1 => \VBB_ReadData[29]_i_8_n_0\,
      O => \VBB_ReadData_reg[29]_i_3_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[29]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[29]_i_11_n_0\,
      I1 => \VBB_ReadData[29]_i_12_n_0\,
      O => \VBB_ReadData_reg[29]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(2),
      Q => VBB_ReadData(2),
      R => '0'
    );
\VBB_ReadData_reg[2]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[2]_i_10_n_0\,
      I1 => \VBB_ReadData[2]_i_11_n_0\,
      O => \VBB_ReadData_reg[2]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[2]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[2]_i_12_n_0\,
      I1 => \VBB_ReadData[2]_i_13_n_0\,
      O => \VBB_ReadData_reg[2]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[2]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[2]_i_14_n_0\,
      I1 => \VBB_ReadData[2]_i_15_n_0\,
      O => \ret__223\(2),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[2]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[2]_i_16_n_0\,
      I1 => \VBB_ReadData[2]_i_17_n_0\,
      O => \VBB_ReadData_reg[2]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(30),
      Q => VBB_ReadData(30),
      R => '0'
    );
\VBB_ReadData_reg[30]_i_10\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[30]_i_13_n_0\,
      I1 => \VBB_ReadData[30]_i_14_n_0\,
      O => \ret__223\(30),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[30]_i_2\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[30]_i_5_n_0\,
      I1 => \VBB_ReadData[30]_i_6_n_0\,
      O => \VBB_ReadData_reg[30]_i_2_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[30]_i_3\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[30]_i_7_n_0\,
      I1 => \VBB_ReadData[30]_i_8_n_0\,
      O => \VBB_ReadData_reg[30]_i_3_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[30]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[30]_i_11_n_0\,
      I1 => \VBB_ReadData[30]_i_12_n_0\,
      O => \VBB_ReadData_reg[30]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(31),
      Q => VBB_ReadData(31),
      R => '0'
    );
\VBB_ReadData_reg[31]_i_13\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[31]_i_15_n_0\,
      I1 => \VBB_ReadData[31]_i_16_n_0\,
      O => \VBB_ReadData_reg[31]_i_13_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[31]_i_14\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[31]_i_17_n_0\,
      I1 => \VBB_ReadData[31]_i_18_n_0\,
      O => \ret__223\(31),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[31]_i_5\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[31]_i_9_n_0\,
      I1 => \VBB_ReadData[31]_i_10_n_0\,
      O => \VBB_ReadData_reg[31]_i_5_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[31]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[31]_i_11_n_0\,
      I1 => \VBB_ReadData[31]_i_12_n_0\,
      O => \VBB_ReadData_reg[31]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(3),
      Q => VBB_ReadData(3),
      R => '0'
    );
\VBB_ReadData_reg[3]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[3]_i_10_n_0\,
      I1 => \VBB_ReadData[3]_i_11_n_0\,
      O => \VBB_ReadData_reg[3]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[3]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[3]_i_12_n_0\,
      I1 => \VBB_ReadData[3]_i_13_n_0\,
      O => \VBB_ReadData_reg[3]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[3]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[3]_i_14_n_0\,
      I1 => \VBB_ReadData[3]_i_15_n_0\,
      O => \ret__223\(3),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[3]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[3]_i_16_n_0\,
      I1 => \VBB_ReadData[3]_i_17_n_0\,
      O => \VBB_ReadData_reg[3]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(4),
      Q => VBB_ReadData(4),
      R => '0'
    );
\VBB_ReadData_reg[4]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[4]_i_10_n_0\,
      I1 => \VBB_ReadData[4]_i_11_n_0\,
      O => \VBB_ReadData_reg[4]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[4]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[4]_i_12_n_0\,
      I1 => \VBB_ReadData[4]_i_13_n_0\,
      O => \VBB_ReadData_reg[4]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[4]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[4]_i_14_n_0\,
      I1 => \VBB_ReadData[4]_i_15_n_0\,
      O => \ret__223\(4),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[4]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[4]_i_16_n_0\,
      I1 => \VBB_ReadData[4]_i_17_n_0\,
      O => \VBB_ReadData_reg[4]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(5),
      Q => VBB_ReadData(5),
      R => '0'
    );
\VBB_ReadData_reg[5]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[5]_i_10_n_0\,
      I1 => \VBB_ReadData[5]_i_11_n_0\,
      O => \VBB_ReadData_reg[5]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[5]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[5]_i_12_n_0\,
      I1 => \VBB_ReadData[5]_i_13_n_0\,
      O => \VBB_ReadData_reg[5]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[5]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[5]_i_14_n_0\,
      I1 => \VBB_ReadData[5]_i_15_n_0\,
      O => \ret__223\(5),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[5]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[5]_i_16_n_0\,
      I1 => \VBB_ReadData[5]_i_17_n_0\,
      O => \VBB_ReadData_reg[5]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(6),
      Q => VBB_ReadData(6),
      R => '0'
    );
\VBB_ReadData_reg[6]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[6]_i_10_n_0\,
      I1 => \VBB_ReadData[6]_i_11_n_0\,
      O => \VBB_ReadData_reg[6]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[6]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[6]_i_12_n_0\,
      I1 => \VBB_ReadData[6]_i_13_n_0\,
      O => \VBB_ReadData_reg[6]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[6]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[6]_i_14_n_0\,
      I1 => \VBB_ReadData[6]_i_15_n_0\,
      O => \ret__223\(6),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[6]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[6]_i_16_n_0\,
      I1 => \VBB_ReadData[6]_i_17_n_0\,
      O => \VBB_ReadData_reg[6]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(7),
      Q => VBB_ReadData(7),
      R => '0'
    );
\VBB_ReadData_reg[7]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[7]_i_10_n_0\,
      I1 => \VBB_ReadData[7]_i_11_n_0\,
      O => \VBB_ReadData_reg[7]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[7]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[7]_i_12_n_0\,
      I1 => \VBB_ReadData[7]_i_13_n_0\,
      O => \VBB_ReadData_reg[7]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[7]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[7]_i_14_n_0\,
      I1 => \VBB_ReadData[7]_i_15_n_0\,
      O => \ret__223\(7),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[7]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[7]_i_16_n_0\,
      I1 => \VBB_ReadData[7]_i_17_n_0\,
      O => \VBB_ReadData_reg[7]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(8),
      Q => VBB_ReadData(8),
      R => '0'
    );
\VBB_ReadData_reg[8]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[8]_i_10_n_0\,
      I1 => \VBB_ReadData[8]_i_11_n_0\,
      O => \VBB_ReadData_reg[8]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[8]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[8]_i_12_n_0\,
      I1 => \VBB_ReadData[8]_i_13_n_0\,
      O => \VBB_ReadData_reg[8]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[8]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[8]_i_14_n_0\,
      I1 => \VBB_ReadData[8]_i_15_n_0\,
      O => \ret__223\(8),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[8]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[8]_i_16_n_0\,
      I1 => \VBB_ReadData[8]_i_17_n_0\,
      O => \VBB_ReadData_reg[8]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \VBB_ReadData[31]_i_1_n_0\,
      D => p_0_in(9),
      Q => VBB_ReadData(9),
      R => '0'
    );
\VBB_ReadData_reg[9]_i_6\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[9]_i_10_n_0\,
      I1 => \VBB_ReadData[9]_i_11_n_0\,
      O => \VBB_ReadData_reg[9]_i_6_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[9]_i_7\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[9]_i_12_n_0\,
      I1 => \VBB_ReadData[9]_i_13_n_0\,
      O => \VBB_ReadData_reg[9]_i_7_n_0\,
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[9]_i_8\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[9]_i_14_n_0\,
      I1 => \VBB_ReadData[9]_i_15_n_0\,
      O => \ret__223\(9),
      S => VBB_ReadAddr(4)
    );
\VBB_ReadData_reg[9]_i_9\: unisim.vcomponents.MUXF7
     port map (
      I0 => \VBB_ReadData[9]_i_16_n_0\,
      I1 => \VBB_ReadData[9]_i_17_n_0\,
      O => \VBB_ReadData_reg[9]_i_9_n_0\,
      S => VBB_ReadAddr(4)
    );
VBB_ReadReady_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444444440"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => VBB_ReadEnable,
      I2 => IsAddressInCurrentCache10_out,
      I3 => \IsAddressInCurrentCache0_carry__0_n_7\,
      I4 => IsAddressInCurrentCache1,
      I5 => IsAddressInCurrentCache11_out,
      O => VBB_ReadReady_i_1_n_0
    );
VBB_ReadReady_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => \^dbg_state\(0),
      D => VBB_ReadReady_i_1_n_0,
      Q => VBB_ReadReady,
      R => '0'
    );
\currentCache0BaseAddr[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A888"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[0]\,
      I1 => currentCache0Data_0,
      I2 => \^dbg_state\(0),
      I3 => VBB_InvalidateIndexCache,
      O => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => currentCache0Data_0,
      O => \currentCache0BaseAddr[24]_i_2_n_0\
    );
\currentCache0BaseAddr_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[0]_i_1_n_0\,
      Q => currentCache0BaseAddr(0),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[10]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[10]_i_1_n_0\,
      Q => currentCache0BaseAddr(10),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[11]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[11]_i_1_n_0\,
      Q => currentCache0BaseAddr(11),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[12]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[12]_i_1_n_0\,
      Q => currentCache0BaseAddr(12),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[13]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[13]_i_1_n_0\,
      Q => currentCache0BaseAddr(13),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[14]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[14]_i_1_n_0\,
      Q => currentCache0BaseAddr(14),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[15]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[15]_i_1_n_0\,
      Q => currentCache0BaseAddr(15),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[16]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[16]_i_1_n_0\,
      Q => currentCache0BaseAddr(16),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[17]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[17]_i_1_n_0\,
      Q => currentCache0BaseAddr(17),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[18]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[18]_i_1_n_0\,
      Q => currentCache0BaseAddr(18),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[19]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[19]_i_1_n_0\,
      Q => currentCache0BaseAddr(19),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[1]_i_1_n_0\,
      Q => currentCache0BaseAddr(1),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[20]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[20]_i_1_n_0\,
      Q => currentCache0BaseAddr(20),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[21]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[21]_i_1_n_0\,
      Q => currentCache0BaseAddr(21),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[22]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[22]_i_1_n_0\,
      Q => currentCache0BaseAddr(22),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[23]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[23]_i_1_n_0\,
      Q => currentCache0BaseAddr(23),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[24]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[24]_i_3_n_0\,
      Q => currentCache0BaseAddr(24),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[2]_i_1_n_0\,
      Q => currentCache0BaseAddr(2),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[3]_i_1_n_0\,
      Q => currentCache0BaseAddr(3),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[4]_i_1_n_0\,
      Q => currentCache0BaseAddr(4),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[5]_i_1_n_0\,
      Q => currentCache0BaseAddr(5),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[6]_i_1_n_0\,
      Q => currentCache0BaseAddr(6),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[7]_i_1_n_0\,
      Q => currentCache0BaseAddr(7),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[8]_i_1_n_0\,
      Q => currentCache0BaseAddr(8),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0BaseAddr_reg[9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => \currentCache0BaseAddr[24]_i_2_n_0\,
      D => \currentCache2BaseAddr[9]_i_1_n_0\,
      Q => currentCache0BaseAddr(9),
      S => \currentCache0BaseAddr[24]_i_1_n_0\
    );
\currentCache0Data[255]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0002"
    )
        port map (
      I0 => \^dbg_state\(1),
      I1 => IBCReadResponsesFIFO_empty,
      I2 => \nextCacheLineWrite_reg_n_0_[0]\,
      I3 => \nextCacheLineWrite_reg_n_0_[1]\,
      O => currentCache0Data_0
    );
\currentCache0Data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(0),
      Q => currentCache0Data(0),
      R => '0'
    );
\currentCache0Data_reg[100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(100),
      Q => currentCache0Data(100),
      R => '0'
    );
\currentCache0Data_reg[101]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(101),
      Q => currentCache0Data(101),
      R => '0'
    );
\currentCache0Data_reg[102]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(102),
      Q => currentCache0Data(102),
      R => '0'
    );
\currentCache0Data_reg[103]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(103),
      Q => currentCache0Data(103),
      R => '0'
    );
\currentCache0Data_reg[104]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(104),
      Q => currentCache0Data(104),
      R => '0'
    );
\currentCache0Data_reg[105]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(105),
      Q => currentCache0Data(105),
      R => '0'
    );
\currentCache0Data_reg[106]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(106),
      Q => currentCache0Data(106),
      R => '0'
    );
\currentCache0Data_reg[107]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(107),
      Q => currentCache0Data(107),
      R => '0'
    );
\currentCache0Data_reg[108]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(108),
      Q => currentCache0Data(108),
      R => '0'
    );
\currentCache0Data_reg[109]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(109),
      Q => currentCache0Data(109),
      R => '0'
    );
\currentCache0Data_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(10),
      Q => currentCache0Data(10),
      R => '0'
    );
\currentCache0Data_reg[110]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(110),
      Q => currentCache0Data(110),
      R => '0'
    );
\currentCache0Data_reg[111]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(111),
      Q => currentCache0Data(111),
      R => '0'
    );
\currentCache0Data_reg[112]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(112),
      Q => currentCache0Data(112),
      R => '0'
    );
\currentCache0Data_reg[113]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(113),
      Q => currentCache0Data(113),
      R => '0'
    );
\currentCache0Data_reg[114]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(114),
      Q => currentCache0Data(114),
      R => '0'
    );
\currentCache0Data_reg[115]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(115),
      Q => currentCache0Data(115),
      R => '0'
    );
\currentCache0Data_reg[116]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(116),
      Q => currentCache0Data(116),
      R => '0'
    );
\currentCache0Data_reg[117]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(117),
      Q => currentCache0Data(117),
      R => '0'
    );
\currentCache0Data_reg[118]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(118),
      Q => currentCache0Data(118),
      R => '0'
    );
\currentCache0Data_reg[119]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(119),
      Q => currentCache0Data(119),
      R => '0'
    );
\currentCache0Data_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(11),
      Q => currentCache0Data(11),
      R => '0'
    );
\currentCache0Data_reg[120]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(120),
      Q => currentCache0Data(120),
      R => '0'
    );
\currentCache0Data_reg[121]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(121),
      Q => currentCache0Data(121),
      R => '0'
    );
\currentCache0Data_reg[122]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(122),
      Q => currentCache0Data(122),
      R => '0'
    );
\currentCache0Data_reg[123]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(123),
      Q => currentCache0Data(123),
      R => '0'
    );
\currentCache0Data_reg[124]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(124),
      Q => currentCache0Data(124),
      R => '0'
    );
\currentCache0Data_reg[125]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(125),
      Q => currentCache0Data(125),
      R => '0'
    );
\currentCache0Data_reg[126]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(126),
      Q => currentCache0Data(126),
      R => '0'
    );
\currentCache0Data_reg[127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(127),
      Q => currentCache0Data(127),
      R => '0'
    );
\currentCache0Data_reg[128]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(128),
      Q => currentCache0Data(128),
      R => '0'
    );
\currentCache0Data_reg[129]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(129),
      Q => currentCache0Data(129),
      R => '0'
    );
\currentCache0Data_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(12),
      Q => currentCache0Data(12),
      R => '0'
    );
\currentCache0Data_reg[130]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(130),
      Q => currentCache0Data(130),
      R => '0'
    );
\currentCache0Data_reg[131]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(131),
      Q => currentCache0Data(131),
      R => '0'
    );
\currentCache0Data_reg[132]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(132),
      Q => currentCache0Data(132),
      R => '0'
    );
\currentCache0Data_reg[133]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(133),
      Q => currentCache0Data(133),
      R => '0'
    );
\currentCache0Data_reg[134]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(134),
      Q => currentCache0Data(134),
      R => '0'
    );
\currentCache0Data_reg[135]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(135),
      Q => currentCache0Data(135),
      R => '0'
    );
\currentCache0Data_reg[136]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(136),
      Q => currentCache0Data(136),
      R => '0'
    );
\currentCache0Data_reg[137]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(137),
      Q => currentCache0Data(137),
      R => '0'
    );
\currentCache0Data_reg[138]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(138),
      Q => currentCache0Data(138),
      R => '0'
    );
\currentCache0Data_reg[139]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(139),
      Q => currentCache0Data(139),
      R => '0'
    );
\currentCache0Data_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(13),
      Q => currentCache0Data(13),
      R => '0'
    );
\currentCache0Data_reg[140]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(140),
      Q => currentCache0Data(140),
      R => '0'
    );
\currentCache0Data_reg[141]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(141),
      Q => currentCache0Data(141),
      R => '0'
    );
\currentCache0Data_reg[142]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(142),
      Q => currentCache0Data(142),
      R => '0'
    );
\currentCache0Data_reg[143]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(143),
      Q => currentCache0Data(143),
      R => '0'
    );
\currentCache0Data_reg[144]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(144),
      Q => currentCache0Data(144),
      R => '0'
    );
\currentCache0Data_reg[145]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(145),
      Q => currentCache0Data(145),
      R => '0'
    );
\currentCache0Data_reg[146]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(146),
      Q => currentCache0Data(146),
      R => '0'
    );
\currentCache0Data_reg[147]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(147),
      Q => currentCache0Data(147),
      R => '0'
    );
\currentCache0Data_reg[148]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(148),
      Q => currentCache0Data(148),
      R => '0'
    );
\currentCache0Data_reg[149]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(149),
      Q => currentCache0Data(149),
      R => '0'
    );
\currentCache0Data_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(14),
      Q => currentCache0Data(14),
      R => '0'
    );
\currentCache0Data_reg[150]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(150),
      Q => currentCache0Data(150),
      R => '0'
    );
\currentCache0Data_reg[151]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(151),
      Q => currentCache0Data(151),
      R => '0'
    );
\currentCache0Data_reg[152]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(152),
      Q => currentCache0Data(152),
      R => '0'
    );
\currentCache0Data_reg[153]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(153),
      Q => currentCache0Data(153),
      R => '0'
    );
\currentCache0Data_reg[154]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(154),
      Q => currentCache0Data(154),
      R => '0'
    );
\currentCache0Data_reg[155]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(155),
      Q => currentCache0Data(155),
      R => '0'
    );
\currentCache0Data_reg[156]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(156),
      Q => currentCache0Data(156),
      R => '0'
    );
\currentCache0Data_reg[157]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(157),
      Q => currentCache0Data(157),
      R => '0'
    );
\currentCache0Data_reg[158]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(158),
      Q => currentCache0Data(158),
      R => '0'
    );
\currentCache0Data_reg[159]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(159),
      Q => currentCache0Data(159),
      R => '0'
    );
\currentCache0Data_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(15),
      Q => currentCache0Data(15),
      R => '0'
    );
\currentCache0Data_reg[160]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(160),
      Q => currentCache0Data(160),
      R => '0'
    );
\currentCache0Data_reg[161]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(161),
      Q => currentCache0Data(161),
      R => '0'
    );
\currentCache0Data_reg[162]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(162),
      Q => currentCache0Data(162),
      R => '0'
    );
\currentCache0Data_reg[163]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(163),
      Q => currentCache0Data(163),
      R => '0'
    );
\currentCache0Data_reg[164]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(164),
      Q => currentCache0Data(164),
      R => '0'
    );
\currentCache0Data_reg[165]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(165),
      Q => currentCache0Data(165),
      R => '0'
    );
\currentCache0Data_reg[166]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(166),
      Q => currentCache0Data(166),
      R => '0'
    );
\currentCache0Data_reg[167]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(167),
      Q => currentCache0Data(167),
      R => '0'
    );
\currentCache0Data_reg[168]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(168),
      Q => currentCache0Data(168),
      R => '0'
    );
\currentCache0Data_reg[169]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(169),
      Q => currentCache0Data(169),
      R => '0'
    );
\currentCache0Data_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(16),
      Q => currentCache0Data(16),
      R => '0'
    );
\currentCache0Data_reg[170]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(170),
      Q => currentCache0Data(170),
      R => '0'
    );
\currentCache0Data_reg[171]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(171),
      Q => currentCache0Data(171),
      R => '0'
    );
\currentCache0Data_reg[172]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(172),
      Q => currentCache0Data(172),
      R => '0'
    );
\currentCache0Data_reg[173]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(173),
      Q => currentCache0Data(173),
      R => '0'
    );
\currentCache0Data_reg[174]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(174),
      Q => currentCache0Data(174),
      R => '0'
    );
\currentCache0Data_reg[175]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(175),
      Q => currentCache0Data(175),
      R => '0'
    );
\currentCache0Data_reg[176]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(176),
      Q => currentCache0Data(176),
      R => '0'
    );
\currentCache0Data_reg[177]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(177),
      Q => currentCache0Data(177),
      R => '0'
    );
\currentCache0Data_reg[178]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(178),
      Q => currentCache0Data(178),
      R => '0'
    );
\currentCache0Data_reg[179]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(179),
      Q => currentCache0Data(179),
      R => '0'
    );
\currentCache0Data_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(17),
      Q => currentCache0Data(17),
      R => '0'
    );
\currentCache0Data_reg[180]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(180),
      Q => currentCache0Data(180),
      R => '0'
    );
\currentCache0Data_reg[181]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(181),
      Q => currentCache0Data(181),
      R => '0'
    );
\currentCache0Data_reg[182]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(182),
      Q => currentCache0Data(182),
      R => '0'
    );
\currentCache0Data_reg[183]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(183),
      Q => currentCache0Data(183),
      R => '0'
    );
\currentCache0Data_reg[184]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(184),
      Q => currentCache0Data(184),
      R => '0'
    );
\currentCache0Data_reg[185]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(185),
      Q => currentCache0Data(185),
      R => '0'
    );
\currentCache0Data_reg[186]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(186),
      Q => currentCache0Data(186),
      R => '0'
    );
\currentCache0Data_reg[187]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(187),
      Q => currentCache0Data(187),
      R => '0'
    );
\currentCache0Data_reg[188]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(188),
      Q => currentCache0Data(188),
      R => '0'
    );
\currentCache0Data_reg[189]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(189),
      Q => currentCache0Data(189),
      R => '0'
    );
\currentCache0Data_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(18),
      Q => currentCache0Data(18),
      R => '0'
    );
\currentCache0Data_reg[190]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(190),
      Q => currentCache0Data(190),
      R => '0'
    );
\currentCache0Data_reg[191]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(191),
      Q => currentCache0Data(191),
      R => '0'
    );
\currentCache0Data_reg[192]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(192),
      Q => currentCache0Data(192),
      R => '0'
    );
\currentCache0Data_reg[193]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(193),
      Q => currentCache0Data(193),
      R => '0'
    );
\currentCache0Data_reg[194]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(194),
      Q => currentCache0Data(194),
      R => '0'
    );
\currentCache0Data_reg[195]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(195),
      Q => currentCache0Data(195),
      R => '0'
    );
\currentCache0Data_reg[196]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(196),
      Q => currentCache0Data(196),
      R => '0'
    );
\currentCache0Data_reg[197]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(197),
      Q => currentCache0Data(197),
      R => '0'
    );
\currentCache0Data_reg[198]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(198),
      Q => currentCache0Data(198),
      R => '0'
    );
\currentCache0Data_reg[199]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(199),
      Q => currentCache0Data(199),
      R => '0'
    );
\currentCache0Data_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(19),
      Q => currentCache0Data(19),
      R => '0'
    );
\currentCache0Data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(1),
      Q => currentCache0Data(1),
      R => '0'
    );
\currentCache0Data_reg[200]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(200),
      Q => currentCache0Data(200),
      R => '0'
    );
\currentCache0Data_reg[201]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(201),
      Q => currentCache0Data(201),
      R => '0'
    );
\currentCache0Data_reg[202]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(202),
      Q => currentCache0Data(202),
      R => '0'
    );
\currentCache0Data_reg[203]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(203),
      Q => currentCache0Data(203),
      R => '0'
    );
\currentCache0Data_reg[204]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(204),
      Q => currentCache0Data(204),
      R => '0'
    );
\currentCache0Data_reg[205]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(205),
      Q => currentCache0Data(205),
      R => '0'
    );
\currentCache0Data_reg[206]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(206),
      Q => currentCache0Data(206),
      R => '0'
    );
\currentCache0Data_reg[207]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(207),
      Q => currentCache0Data(207),
      R => '0'
    );
\currentCache0Data_reg[208]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(208),
      Q => currentCache0Data(208),
      R => '0'
    );
\currentCache0Data_reg[209]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(209),
      Q => currentCache0Data(209),
      R => '0'
    );
\currentCache0Data_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(20),
      Q => currentCache0Data(20),
      R => '0'
    );
\currentCache0Data_reg[210]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(210),
      Q => currentCache0Data(210),
      R => '0'
    );
\currentCache0Data_reg[211]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(211),
      Q => currentCache0Data(211),
      R => '0'
    );
\currentCache0Data_reg[212]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(212),
      Q => currentCache0Data(212),
      R => '0'
    );
\currentCache0Data_reg[213]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(213),
      Q => currentCache0Data(213),
      R => '0'
    );
\currentCache0Data_reg[214]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(214),
      Q => currentCache0Data(214),
      R => '0'
    );
\currentCache0Data_reg[215]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(215),
      Q => currentCache0Data(215),
      R => '0'
    );
\currentCache0Data_reg[216]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(216),
      Q => currentCache0Data(216),
      R => '0'
    );
\currentCache0Data_reg[217]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(217),
      Q => currentCache0Data(217),
      R => '0'
    );
\currentCache0Data_reg[218]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(218),
      Q => currentCache0Data(218),
      R => '0'
    );
\currentCache0Data_reg[219]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(219),
      Q => currentCache0Data(219),
      R => '0'
    );
\currentCache0Data_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(21),
      Q => currentCache0Data(21),
      R => '0'
    );
\currentCache0Data_reg[220]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(220),
      Q => currentCache0Data(220),
      R => '0'
    );
\currentCache0Data_reg[221]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(221),
      Q => currentCache0Data(221),
      R => '0'
    );
\currentCache0Data_reg[222]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(222),
      Q => currentCache0Data(222),
      R => '0'
    );
\currentCache0Data_reg[223]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(223),
      Q => currentCache0Data(223),
      R => '0'
    );
\currentCache0Data_reg[224]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(224),
      Q => currentCache0Data(224),
      R => '0'
    );
\currentCache0Data_reg[225]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(225),
      Q => currentCache0Data(225),
      R => '0'
    );
\currentCache0Data_reg[226]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(226),
      Q => currentCache0Data(226),
      R => '0'
    );
\currentCache0Data_reg[227]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(227),
      Q => currentCache0Data(227),
      R => '0'
    );
\currentCache0Data_reg[228]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(228),
      Q => currentCache0Data(228),
      R => '0'
    );
\currentCache0Data_reg[229]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(229),
      Q => currentCache0Data(229),
      R => '0'
    );
\currentCache0Data_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(22),
      Q => currentCache0Data(22),
      R => '0'
    );
\currentCache0Data_reg[230]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(230),
      Q => currentCache0Data(230),
      R => '0'
    );
\currentCache0Data_reg[231]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(231),
      Q => currentCache0Data(231),
      R => '0'
    );
\currentCache0Data_reg[232]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(232),
      Q => currentCache0Data(232),
      R => '0'
    );
\currentCache0Data_reg[233]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(233),
      Q => currentCache0Data(233),
      R => '0'
    );
\currentCache0Data_reg[234]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(234),
      Q => currentCache0Data(234),
      R => '0'
    );
\currentCache0Data_reg[235]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(235),
      Q => currentCache0Data(235),
      R => '0'
    );
\currentCache0Data_reg[236]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(236),
      Q => currentCache0Data(236),
      R => '0'
    );
\currentCache0Data_reg[237]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(237),
      Q => currentCache0Data(237),
      R => '0'
    );
\currentCache0Data_reg[238]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(238),
      Q => currentCache0Data(238),
      R => '0'
    );
\currentCache0Data_reg[239]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(239),
      Q => currentCache0Data(239),
      R => '0'
    );
\currentCache0Data_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(23),
      Q => currentCache0Data(23),
      R => '0'
    );
\currentCache0Data_reg[240]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(240),
      Q => currentCache0Data(240),
      R => '0'
    );
\currentCache0Data_reg[241]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(241),
      Q => currentCache0Data(241),
      R => '0'
    );
\currentCache0Data_reg[242]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(242),
      Q => currentCache0Data(242),
      R => '0'
    );
\currentCache0Data_reg[243]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(243),
      Q => currentCache0Data(243),
      R => '0'
    );
\currentCache0Data_reg[244]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(244),
      Q => currentCache0Data(244),
      R => '0'
    );
\currentCache0Data_reg[245]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(245),
      Q => currentCache0Data(245),
      R => '0'
    );
\currentCache0Data_reg[246]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(246),
      Q => currentCache0Data(246),
      R => '0'
    );
\currentCache0Data_reg[247]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(247),
      Q => currentCache0Data(247),
      R => '0'
    );
\currentCache0Data_reg[248]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(248),
      Q => currentCache0Data(248),
      R => '0'
    );
\currentCache0Data_reg[249]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(249),
      Q => currentCache0Data(249),
      R => '0'
    );
\currentCache0Data_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(24),
      Q => currentCache0Data(24),
      R => '0'
    );
\currentCache0Data_reg[250]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(250),
      Q => currentCache0Data(250),
      R => '0'
    );
\currentCache0Data_reg[251]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(251),
      Q => currentCache0Data(251),
      R => '0'
    );
\currentCache0Data_reg[252]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(252),
      Q => currentCache0Data(252),
      R => '0'
    );
\currentCache0Data_reg[253]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(253),
      Q => currentCache0Data(253),
      R => '0'
    );
\currentCache0Data_reg[254]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(254),
      Q => currentCache0Data(254),
      R => '0'
    );
\currentCache0Data_reg[255]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(255),
      Q => currentCache0Data(255),
      R => '0'
    );
\currentCache0Data_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(25),
      Q => currentCache0Data(25),
      R => '0'
    );
\currentCache0Data_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(26),
      Q => currentCache0Data(26),
      R => '0'
    );
\currentCache0Data_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(27),
      Q => currentCache0Data(27),
      R => '0'
    );
\currentCache0Data_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(28),
      Q => currentCache0Data(28),
      R => '0'
    );
\currentCache0Data_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(29),
      Q => currentCache0Data(29),
      R => '0'
    );
\currentCache0Data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(2),
      Q => currentCache0Data(2),
      R => '0'
    );
\currentCache0Data_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(30),
      Q => currentCache0Data(30),
      R => '0'
    );
\currentCache0Data_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(31),
      Q => currentCache0Data(31),
      R => '0'
    );
\currentCache0Data_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(32),
      Q => currentCache0Data(32),
      R => '0'
    );
\currentCache0Data_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(33),
      Q => currentCache0Data(33),
      R => '0'
    );
\currentCache0Data_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(34),
      Q => currentCache0Data(34),
      R => '0'
    );
\currentCache0Data_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(35),
      Q => currentCache0Data(35),
      R => '0'
    );
\currentCache0Data_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(36),
      Q => currentCache0Data(36),
      R => '0'
    );
\currentCache0Data_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(37),
      Q => currentCache0Data(37),
      R => '0'
    );
\currentCache0Data_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(38),
      Q => currentCache0Data(38),
      R => '0'
    );
\currentCache0Data_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(39),
      Q => currentCache0Data(39),
      R => '0'
    );
\currentCache0Data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(3),
      Q => currentCache0Data(3),
      R => '0'
    );
\currentCache0Data_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(40),
      Q => currentCache0Data(40),
      R => '0'
    );
\currentCache0Data_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(41),
      Q => currentCache0Data(41),
      R => '0'
    );
\currentCache0Data_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(42),
      Q => currentCache0Data(42),
      R => '0'
    );
\currentCache0Data_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(43),
      Q => currentCache0Data(43),
      R => '0'
    );
\currentCache0Data_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(44),
      Q => currentCache0Data(44),
      R => '0'
    );
\currentCache0Data_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(45),
      Q => currentCache0Data(45),
      R => '0'
    );
\currentCache0Data_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(46),
      Q => currentCache0Data(46),
      R => '0'
    );
\currentCache0Data_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(47),
      Q => currentCache0Data(47),
      R => '0'
    );
\currentCache0Data_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(48),
      Q => currentCache0Data(48),
      R => '0'
    );
\currentCache0Data_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(49),
      Q => currentCache0Data(49),
      R => '0'
    );
\currentCache0Data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(4),
      Q => currentCache0Data(4),
      R => '0'
    );
\currentCache0Data_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(50),
      Q => currentCache0Data(50),
      R => '0'
    );
\currentCache0Data_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(51),
      Q => currentCache0Data(51),
      R => '0'
    );
\currentCache0Data_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(52),
      Q => currentCache0Data(52),
      R => '0'
    );
\currentCache0Data_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(53),
      Q => currentCache0Data(53),
      R => '0'
    );
\currentCache0Data_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(54),
      Q => currentCache0Data(54),
      R => '0'
    );
\currentCache0Data_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(55),
      Q => currentCache0Data(55),
      R => '0'
    );
\currentCache0Data_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(56),
      Q => currentCache0Data(56),
      R => '0'
    );
\currentCache0Data_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(57),
      Q => currentCache0Data(57),
      R => '0'
    );
\currentCache0Data_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(58),
      Q => currentCache0Data(58),
      R => '0'
    );
\currentCache0Data_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(59),
      Q => currentCache0Data(59),
      R => '0'
    );
\currentCache0Data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(5),
      Q => currentCache0Data(5),
      R => '0'
    );
\currentCache0Data_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(60),
      Q => currentCache0Data(60),
      R => '0'
    );
\currentCache0Data_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(61),
      Q => currentCache0Data(61),
      R => '0'
    );
\currentCache0Data_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(62),
      Q => currentCache0Data(62),
      R => '0'
    );
\currentCache0Data_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(63),
      Q => currentCache0Data(63),
      R => '0'
    );
\currentCache0Data_reg[64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(64),
      Q => currentCache0Data(64),
      R => '0'
    );
\currentCache0Data_reg[65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(65),
      Q => currentCache0Data(65),
      R => '0'
    );
\currentCache0Data_reg[66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(66),
      Q => currentCache0Data(66),
      R => '0'
    );
\currentCache0Data_reg[67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(67),
      Q => currentCache0Data(67),
      R => '0'
    );
\currentCache0Data_reg[68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(68),
      Q => currentCache0Data(68),
      R => '0'
    );
\currentCache0Data_reg[69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(69),
      Q => currentCache0Data(69),
      R => '0'
    );
\currentCache0Data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(6),
      Q => currentCache0Data(6),
      R => '0'
    );
\currentCache0Data_reg[70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(70),
      Q => currentCache0Data(70),
      R => '0'
    );
\currentCache0Data_reg[71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(71),
      Q => currentCache0Data(71),
      R => '0'
    );
\currentCache0Data_reg[72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(72),
      Q => currentCache0Data(72),
      R => '0'
    );
\currentCache0Data_reg[73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(73),
      Q => currentCache0Data(73),
      R => '0'
    );
\currentCache0Data_reg[74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(74),
      Q => currentCache0Data(74),
      R => '0'
    );
\currentCache0Data_reg[75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(75),
      Q => currentCache0Data(75),
      R => '0'
    );
\currentCache0Data_reg[76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(76),
      Q => currentCache0Data(76),
      R => '0'
    );
\currentCache0Data_reg[77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(77),
      Q => currentCache0Data(77),
      R => '0'
    );
\currentCache0Data_reg[78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(78),
      Q => currentCache0Data(78),
      R => '0'
    );
\currentCache0Data_reg[79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(79),
      Q => currentCache0Data(79),
      R => '0'
    );
\currentCache0Data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(7),
      Q => currentCache0Data(7),
      R => '0'
    );
\currentCache0Data_reg[80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(80),
      Q => currentCache0Data(80),
      R => '0'
    );
\currentCache0Data_reg[81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(81),
      Q => currentCache0Data(81),
      R => '0'
    );
\currentCache0Data_reg[82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(82),
      Q => currentCache0Data(82),
      R => '0'
    );
\currentCache0Data_reg[83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(83),
      Q => currentCache0Data(83),
      R => '0'
    );
\currentCache0Data_reg[84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(84),
      Q => currentCache0Data(84),
      R => '0'
    );
\currentCache0Data_reg[85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(85),
      Q => currentCache0Data(85),
      R => '0'
    );
\currentCache0Data_reg[86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(86),
      Q => currentCache0Data(86),
      R => '0'
    );
\currentCache0Data_reg[87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(87),
      Q => currentCache0Data(87),
      R => '0'
    );
\currentCache0Data_reg[88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(88),
      Q => currentCache0Data(88),
      R => '0'
    );
\currentCache0Data_reg[89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(89),
      Q => currentCache0Data(89),
      R => '0'
    );
\currentCache0Data_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(8),
      Q => currentCache0Data(8),
      R => '0'
    );
\currentCache0Data_reg[90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(90),
      Q => currentCache0Data(90),
      R => '0'
    );
\currentCache0Data_reg[91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(91),
      Q => currentCache0Data(91),
      R => '0'
    );
\currentCache0Data_reg[92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(92),
      Q => currentCache0Data(92),
      R => '0'
    );
\currentCache0Data_reg[93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(93),
      Q => currentCache0Data(93),
      R => '0'
    );
\currentCache0Data_reg[94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(94),
      Q => currentCache0Data(94),
      R => '0'
    );
\currentCache0Data_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(95),
      Q => currentCache0Data(95),
      R => '0'
    );
\currentCache0Data_reg[96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(96),
      Q => currentCache0Data(96),
      R => '0'
    );
\currentCache0Data_reg[97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(97),
      Q => currentCache0Data(97),
      R => '0'
    );
\currentCache0Data_reg[98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(98),
      Q => currentCache0Data(98),
      R => '0'
    );
\currentCache0Data_reg[99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(99),
      Q => currentCache0Data(99),
      R => '0'
    );
\currentCache0Data_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache0Data_0,
      D => IBCReadResponsesFIFO_rd_data(9),
      Q => currentCache0Data(9),
      R => '0'
    );
\currentCache1BaseAddr[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A888"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[0]\,
      I1 => currentCache1Data_5,
      I2 => \^dbg_state\(0),
      I3 => VBB_InvalidateIndexCache,
      O => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => currentCache1Data_5,
      O => currentCache1BaseAddr_2
    );
\currentCache1BaseAddr_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[0]_i_1_n_0\,
      Q => currentCache1BaseAddr(0),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[10]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[10]_i_1_n_0\,
      Q => currentCache1BaseAddr(10),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[11]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[11]_i_1_n_0\,
      Q => currentCache1BaseAddr(11),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[12]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[12]_i_1_n_0\,
      Q => currentCache1BaseAddr(12),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[13]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[13]_i_1_n_0\,
      Q => currentCache1BaseAddr(13),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[14]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[14]_i_1_n_0\,
      Q => currentCache1BaseAddr(14),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[15]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[15]_i_1_n_0\,
      Q => currentCache1BaseAddr(15),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[16]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[16]_i_1_n_0\,
      Q => currentCache1BaseAddr(16),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[17]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[17]_i_1_n_0\,
      Q => currentCache1BaseAddr(17),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[18]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[18]_i_1_n_0\,
      Q => currentCache1BaseAddr(18),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[19]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[19]_i_1_n_0\,
      Q => currentCache1BaseAddr(19),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[1]_i_1_n_0\,
      Q => currentCache1BaseAddr(1),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[20]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[20]_i_1_n_0\,
      Q => currentCache1BaseAddr(20),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[21]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[21]_i_1_n_0\,
      Q => currentCache1BaseAddr(21),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[22]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[22]_i_1_n_0\,
      Q => currentCache1BaseAddr(22),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[23]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[23]_i_1_n_0\,
      Q => currentCache1BaseAddr(23),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[24]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[24]_i_3_n_0\,
      Q => currentCache1BaseAddr(24),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[2]_i_1_n_0\,
      Q => currentCache1BaseAddr(2),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[3]_i_1_n_0\,
      Q => currentCache1BaseAddr(3),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[4]_i_1_n_0\,
      Q => currentCache1BaseAddr(4),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[5]_i_1_n_0\,
      Q => currentCache1BaseAddr(5),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[6]_i_1_n_0\,
      Q => currentCache1BaseAddr(6),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[7]_i_1_n_0\,
      Q => currentCache1BaseAddr(7),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[8]_i_1_n_0\,
      Q => currentCache1BaseAddr(8),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1BaseAddr_reg[9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1BaseAddr_2,
      D => \currentCache2BaseAddr[9]_i_1_n_0\,
      Q => currentCache1BaseAddr(9),
      S => \currentCache1BaseAddr[24]_i_1_n_0\
    );
\currentCache1Data[255]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \^dbg_state\(1),
      I1 => IBCReadResponsesFIFO_empty,
      I2 => \nextCacheLineWrite_reg_n_0_[0]\,
      I3 => \nextCacheLineWrite_reg_n_0_[1]\,
      O => currentCache1Data_5
    );
\currentCache1Data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(0),
      Q => currentCache1Data(0),
      R => '0'
    );
\currentCache1Data_reg[100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(100),
      Q => currentCache1Data(100),
      R => '0'
    );
\currentCache1Data_reg[101]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(101),
      Q => currentCache1Data(101),
      R => '0'
    );
\currentCache1Data_reg[102]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(102),
      Q => currentCache1Data(102),
      R => '0'
    );
\currentCache1Data_reg[103]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(103),
      Q => currentCache1Data(103),
      R => '0'
    );
\currentCache1Data_reg[104]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(104),
      Q => currentCache1Data(104),
      R => '0'
    );
\currentCache1Data_reg[105]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(105),
      Q => currentCache1Data(105),
      R => '0'
    );
\currentCache1Data_reg[106]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(106),
      Q => currentCache1Data(106),
      R => '0'
    );
\currentCache1Data_reg[107]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(107),
      Q => currentCache1Data(107),
      R => '0'
    );
\currentCache1Data_reg[108]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(108),
      Q => currentCache1Data(108),
      R => '0'
    );
\currentCache1Data_reg[109]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(109),
      Q => currentCache1Data(109),
      R => '0'
    );
\currentCache1Data_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(10),
      Q => currentCache1Data(10),
      R => '0'
    );
\currentCache1Data_reg[110]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(110),
      Q => currentCache1Data(110),
      R => '0'
    );
\currentCache1Data_reg[111]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(111),
      Q => currentCache1Data(111),
      R => '0'
    );
\currentCache1Data_reg[112]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(112),
      Q => currentCache1Data(112),
      R => '0'
    );
\currentCache1Data_reg[113]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(113),
      Q => currentCache1Data(113),
      R => '0'
    );
\currentCache1Data_reg[114]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(114),
      Q => currentCache1Data(114),
      R => '0'
    );
\currentCache1Data_reg[115]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(115),
      Q => currentCache1Data(115),
      R => '0'
    );
\currentCache1Data_reg[116]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(116),
      Q => currentCache1Data(116),
      R => '0'
    );
\currentCache1Data_reg[117]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(117),
      Q => currentCache1Data(117),
      R => '0'
    );
\currentCache1Data_reg[118]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(118),
      Q => currentCache1Data(118),
      R => '0'
    );
\currentCache1Data_reg[119]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(119),
      Q => currentCache1Data(119),
      R => '0'
    );
\currentCache1Data_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(11),
      Q => currentCache1Data(11),
      R => '0'
    );
\currentCache1Data_reg[120]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(120),
      Q => currentCache1Data(120),
      R => '0'
    );
\currentCache1Data_reg[121]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(121),
      Q => currentCache1Data(121),
      R => '0'
    );
\currentCache1Data_reg[122]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(122),
      Q => currentCache1Data(122),
      R => '0'
    );
\currentCache1Data_reg[123]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(123),
      Q => currentCache1Data(123),
      R => '0'
    );
\currentCache1Data_reg[124]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(124),
      Q => currentCache1Data(124),
      R => '0'
    );
\currentCache1Data_reg[125]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(125),
      Q => currentCache1Data(125),
      R => '0'
    );
\currentCache1Data_reg[126]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(126),
      Q => currentCache1Data(126),
      R => '0'
    );
\currentCache1Data_reg[127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(127),
      Q => currentCache1Data(127),
      R => '0'
    );
\currentCache1Data_reg[128]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(128),
      Q => currentCache1Data(128),
      R => '0'
    );
\currentCache1Data_reg[129]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(129),
      Q => currentCache1Data(129),
      R => '0'
    );
\currentCache1Data_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(12),
      Q => currentCache1Data(12),
      R => '0'
    );
\currentCache1Data_reg[130]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(130),
      Q => currentCache1Data(130),
      R => '0'
    );
\currentCache1Data_reg[131]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(131),
      Q => currentCache1Data(131),
      R => '0'
    );
\currentCache1Data_reg[132]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(132),
      Q => currentCache1Data(132),
      R => '0'
    );
\currentCache1Data_reg[133]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(133),
      Q => currentCache1Data(133),
      R => '0'
    );
\currentCache1Data_reg[134]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(134),
      Q => currentCache1Data(134),
      R => '0'
    );
\currentCache1Data_reg[135]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(135),
      Q => currentCache1Data(135),
      R => '0'
    );
\currentCache1Data_reg[136]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(136),
      Q => currentCache1Data(136),
      R => '0'
    );
\currentCache1Data_reg[137]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(137),
      Q => currentCache1Data(137),
      R => '0'
    );
\currentCache1Data_reg[138]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(138),
      Q => currentCache1Data(138),
      R => '0'
    );
\currentCache1Data_reg[139]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(139),
      Q => currentCache1Data(139),
      R => '0'
    );
\currentCache1Data_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(13),
      Q => currentCache1Data(13),
      R => '0'
    );
\currentCache1Data_reg[140]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(140),
      Q => currentCache1Data(140),
      R => '0'
    );
\currentCache1Data_reg[141]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(141),
      Q => currentCache1Data(141),
      R => '0'
    );
\currentCache1Data_reg[142]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(142),
      Q => currentCache1Data(142),
      R => '0'
    );
\currentCache1Data_reg[143]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(143),
      Q => currentCache1Data(143),
      R => '0'
    );
\currentCache1Data_reg[144]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(144),
      Q => currentCache1Data(144),
      R => '0'
    );
\currentCache1Data_reg[145]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(145),
      Q => currentCache1Data(145),
      R => '0'
    );
\currentCache1Data_reg[146]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(146),
      Q => currentCache1Data(146),
      R => '0'
    );
\currentCache1Data_reg[147]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(147),
      Q => currentCache1Data(147),
      R => '0'
    );
\currentCache1Data_reg[148]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(148),
      Q => currentCache1Data(148),
      R => '0'
    );
\currentCache1Data_reg[149]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(149),
      Q => currentCache1Data(149),
      R => '0'
    );
\currentCache1Data_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(14),
      Q => currentCache1Data(14),
      R => '0'
    );
\currentCache1Data_reg[150]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(150),
      Q => currentCache1Data(150),
      R => '0'
    );
\currentCache1Data_reg[151]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(151),
      Q => currentCache1Data(151),
      R => '0'
    );
\currentCache1Data_reg[152]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(152),
      Q => currentCache1Data(152),
      R => '0'
    );
\currentCache1Data_reg[153]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(153),
      Q => currentCache1Data(153),
      R => '0'
    );
\currentCache1Data_reg[154]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(154),
      Q => currentCache1Data(154),
      R => '0'
    );
\currentCache1Data_reg[155]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(155),
      Q => currentCache1Data(155),
      R => '0'
    );
\currentCache1Data_reg[156]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(156),
      Q => currentCache1Data(156),
      R => '0'
    );
\currentCache1Data_reg[157]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(157),
      Q => currentCache1Data(157),
      R => '0'
    );
\currentCache1Data_reg[158]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(158),
      Q => currentCache1Data(158),
      R => '0'
    );
\currentCache1Data_reg[159]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(159),
      Q => currentCache1Data(159),
      R => '0'
    );
\currentCache1Data_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(15),
      Q => currentCache1Data(15),
      R => '0'
    );
\currentCache1Data_reg[160]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(160),
      Q => currentCache1Data(160),
      R => '0'
    );
\currentCache1Data_reg[161]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(161),
      Q => currentCache1Data(161),
      R => '0'
    );
\currentCache1Data_reg[162]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(162),
      Q => currentCache1Data(162),
      R => '0'
    );
\currentCache1Data_reg[163]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(163),
      Q => currentCache1Data(163),
      R => '0'
    );
\currentCache1Data_reg[164]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(164),
      Q => currentCache1Data(164),
      R => '0'
    );
\currentCache1Data_reg[165]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(165),
      Q => currentCache1Data(165),
      R => '0'
    );
\currentCache1Data_reg[166]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(166),
      Q => currentCache1Data(166),
      R => '0'
    );
\currentCache1Data_reg[167]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(167),
      Q => currentCache1Data(167),
      R => '0'
    );
\currentCache1Data_reg[168]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(168),
      Q => currentCache1Data(168),
      R => '0'
    );
\currentCache1Data_reg[169]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(169),
      Q => currentCache1Data(169),
      R => '0'
    );
\currentCache1Data_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(16),
      Q => currentCache1Data(16),
      R => '0'
    );
\currentCache1Data_reg[170]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(170),
      Q => currentCache1Data(170),
      R => '0'
    );
\currentCache1Data_reg[171]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(171),
      Q => currentCache1Data(171),
      R => '0'
    );
\currentCache1Data_reg[172]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(172),
      Q => currentCache1Data(172),
      R => '0'
    );
\currentCache1Data_reg[173]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(173),
      Q => currentCache1Data(173),
      R => '0'
    );
\currentCache1Data_reg[174]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(174),
      Q => currentCache1Data(174),
      R => '0'
    );
\currentCache1Data_reg[175]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(175),
      Q => currentCache1Data(175),
      R => '0'
    );
\currentCache1Data_reg[176]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(176),
      Q => currentCache1Data(176),
      R => '0'
    );
\currentCache1Data_reg[177]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(177),
      Q => currentCache1Data(177),
      R => '0'
    );
\currentCache1Data_reg[178]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(178),
      Q => currentCache1Data(178),
      R => '0'
    );
\currentCache1Data_reg[179]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(179),
      Q => currentCache1Data(179),
      R => '0'
    );
\currentCache1Data_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(17),
      Q => currentCache1Data(17),
      R => '0'
    );
\currentCache1Data_reg[180]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(180),
      Q => currentCache1Data(180),
      R => '0'
    );
\currentCache1Data_reg[181]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(181),
      Q => currentCache1Data(181),
      R => '0'
    );
\currentCache1Data_reg[182]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(182),
      Q => currentCache1Data(182),
      R => '0'
    );
\currentCache1Data_reg[183]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(183),
      Q => currentCache1Data(183),
      R => '0'
    );
\currentCache1Data_reg[184]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(184),
      Q => currentCache1Data(184),
      R => '0'
    );
\currentCache1Data_reg[185]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(185),
      Q => currentCache1Data(185),
      R => '0'
    );
\currentCache1Data_reg[186]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(186),
      Q => currentCache1Data(186),
      R => '0'
    );
\currentCache1Data_reg[187]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(187),
      Q => currentCache1Data(187),
      R => '0'
    );
\currentCache1Data_reg[188]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(188),
      Q => currentCache1Data(188),
      R => '0'
    );
\currentCache1Data_reg[189]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(189),
      Q => currentCache1Data(189),
      R => '0'
    );
\currentCache1Data_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(18),
      Q => currentCache1Data(18),
      R => '0'
    );
\currentCache1Data_reg[190]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(190),
      Q => currentCache1Data(190),
      R => '0'
    );
\currentCache1Data_reg[191]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(191),
      Q => currentCache1Data(191),
      R => '0'
    );
\currentCache1Data_reg[192]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(192),
      Q => currentCache1Data(192),
      R => '0'
    );
\currentCache1Data_reg[193]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(193),
      Q => currentCache1Data(193),
      R => '0'
    );
\currentCache1Data_reg[194]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(194),
      Q => currentCache1Data(194),
      R => '0'
    );
\currentCache1Data_reg[195]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(195),
      Q => currentCache1Data(195),
      R => '0'
    );
\currentCache1Data_reg[196]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(196),
      Q => currentCache1Data(196),
      R => '0'
    );
\currentCache1Data_reg[197]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(197),
      Q => currentCache1Data(197),
      R => '0'
    );
\currentCache1Data_reg[198]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(198),
      Q => currentCache1Data(198),
      R => '0'
    );
\currentCache1Data_reg[199]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(199),
      Q => currentCache1Data(199),
      R => '0'
    );
\currentCache1Data_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(19),
      Q => currentCache1Data(19),
      R => '0'
    );
\currentCache1Data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(1),
      Q => currentCache1Data(1),
      R => '0'
    );
\currentCache1Data_reg[200]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(200),
      Q => currentCache1Data(200),
      R => '0'
    );
\currentCache1Data_reg[201]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(201),
      Q => currentCache1Data(201),
      R => '0'
    );
\currentCache1Data_reg[202]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(202),
      Q => currentCache1Data(202),
      R => '0'
    );
\currentCache1Data_reg[203]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(203),
      Q => currentCache1Data(203),
      R => '0'
    );
\currentCache1Data_reg[204]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(204),
      Q => currentCache1Data(204),
      R => '0'
    );
\currentCache1Data_reg[205]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(205),
      Q => currentCache1Data(205),
      R => '0'
    );
\currentCache1Data_reg[206]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(206),
      Q => currentCache1Data(206),
      R => '0'
    );
\currentCache1Data_reg[207]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(207),
      Q => currentCache1Data(207),
      R => '0'
    );
\currentCache1Data_reg[208]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(208),
      Q => currentCache1Data(208),
      R => '0'
    );
\currentCache1Data_reg[209]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(209),
      Q => currentCache1Data(209),
      R => '0'
    );
\currentCache1Data_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(20),
      Q => currentCache1Data(20),
      R => '0'
    );
\currentCache1Data_reg[210]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(210),
      Q => currentCache1Data(210),
      R => '0'
    );
\currentCache1Data_reg[211]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(211),
      Q => currentCache1Data(211),
      R => '0'
    );
\currentCache1Data_reg[212]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(212),
      Q => currentCache1Data(212),
      R => '0'
    );
\currentCache1Data_reg[213]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(213),
      Q => currentCache1Data(213),
      R => '0'
    );
\currentCache1Data_reg[214]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(214),
      Q => currentCache1Data(214),
      R => '0'
    );
\currentCache1Data_reg[215]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(215),
      Q => currentCache1Data(215),
      R => '0'
    );
\currentCache1Data_reg[216]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(216),
      Q => currentCache1Data(216),
      R => '0'
    );
\currentCache1Data_reg[217]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(217),
      Q => currentCache1Data(217),
      R => '0'
    );
\currentCache1Data_reg[218]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(218),
      Q => currentCache1Data(218),
      R => '0'
    );
\currentCache1Data_reg[219]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(219),
      Q => currentCache1Data(219),
      R => '0'
    );
\currentCache1Data_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(21),
      Q => currentCache1Data(21),
      R => '0'
    );
\currentCache1Data_reg[220]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(220),
      Q => currentCache1Data(220),
      R => '0'
    );
\currentCache1Data_reg[221]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(221),
      Q => currentCache1Data(221),
      R => '0'
    );
\currentCache1Data_reg[222]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(222),
      Q => currentCache1Data(222),
      R => '0'
    );
\currentCache1Data_reg[223]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(223),
      Q => currentCache1Data(223),
      R => '0'
    );
\currentCache1Data_reg[224]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(224),
      Q => currentCache1Data(224),
      R => '0'
    );
\currentCache1Data_reg[225]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(225),
      Q => currentCache1Data(225),
      R => '0'
    );
\currentCache1Data_reg[226]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(226),
      Q => currentCache1Data(226),
      R => '0'
    );
\currentCache1Data_reg[227]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(227),
      Q => currentCache1Data(227),
      R => '0'
    );
\currentCache1Data_reg[228]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(228),
      Q => currentCache1Data(228),
      R => '0'
    );
\currentCache1Data_reg[229]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(229),
      Q => currentCache1Data(229),
      R => '0'
    );
\currentCache1Data_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(22),
      Q => currentCache1Data(22),
      R => '0'
    );
\currentCache1Data_reg[230]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(230),
      Q => currentCache1Data(230),
      R => '0'
    );
\currentCache1Data_reg[231]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(231),
      Q => currentCache1Data(231),
      R => '0'
    );
\currentCache1Data_reg[232]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(232),
      Q => currentCache1Data(232),
      R => '0'
    );
\currentCache1Data_reg[233]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(233),
      Q => currentCache1Data(233),
      R => '0'
    );
\currentCache1Data_reg[234]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(234),
      Q => currentCache1Data(234),
      R => '0'
    );
\currentCache1Data_reg[235]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(235),
      Q => currentCache1Data(235),
      R => '0'
    );
\currentCache1Data_reg[236]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(236),
      Q => currentCache1Data(236),
      R => '0'
    );
\currentCache1Data_reg[237]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(237),
      Q => currentCache1Data(237),
      R => '0'
    );
\currentCache1Data_reg[238]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(238),
      Q => currentCache1Data(238),
      R => '0'
    );
\currentCache1Data_reg[239]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(239),
      Q => currentCache1Data(239),
      R => '0'
    );
\currentCache1Data_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(23),
      Q => currentCache1Data(23),
      R => '0'
    );
\currentCache1Data_reg[240]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(240),
      Q => currentCache1Data(240),
      R => '0'
    );
\currentCache1Data_reg[241]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(241),
      Q => currentCache1Data(241),
      R => '0'
    );
\currentCache1Data_reg[242]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(242),
      Q => currentCache1Data(242),
      R => '0'
    );
\currentCache1Data_reg[243]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(243),
      Q => currentCache1Data(243),
      R => '0'
    );
\currentCache1Data_reg[244]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(244),
      Q => currentCache1Data(244),
      R => '0'
    );
\currentCache1Data_reg[245]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(245),
      Q => currentCache1Data(245),
      R => '0'
    );
\currentCache1Data_reg[246]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(246),
      Q => currentCache1Data(246),
      R => '0'
    );
\currentCache1Data_reg[247]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(247),
      Q => currentCache1Data(247),
      R => '0'
    );
\currentCache1Data_reg[248]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(248),
      Q => currentCache1Data(248),
      R => '0'
    );
\currentCache1Data_reg[249]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(249),
      Q => currentCache1Data(249),
      R => '0'
    );
\currentCache1Data_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(24),
      Q => currentCache1Data(24),
      R => '0'
    );
\currentCache1Data_reg[250]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(250),
      Q => currentCache1Data(250),
      R => '0'
    );
\currentCache1Data_reg[251]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(251),
      Q => currentCache1Data(251),
      R => '0'
    );
\currentCache1Data_reg[252]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(252),
      Q => currentCache1Data(252),
      R => '0'
    );
\currentCache1Data_reg[253]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(253),
      Q => currentCache1Data(253),
      R => '0'
    );
\currentCache1Data_reg[254]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(254),
      Q => currentCache1Data(254),
      R => '0'
    );
\currentCache1Data_reg[255]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(255),
      Q => currentCache1Data(255),
      R => '0'
    );
\currentCache1Data_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(25),
      Q => currentCache1Data(25),
      R => '0'
    );
\currentCache1Data_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(26),
      Q => currentCache1Data(26),
      R => '0'
    );
\currentCache1Data_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(27),
      Q => currentCache1Data(27),
      R => '0'
    );
\currentCache1Data_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(28),
      Q => currentCache1Data(28),
      R => '0'
    );
\currentCache1Data_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(29),
      Q => currentCache1Data(29),
      R => '0'
    );
\currentCache1Data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(2),
      Q => currentCache1Data(2),
      R => '0'
    );
\currentCache1Data_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(30),
      Q => currentCache1Data(30),
      R => '0'
    );
\currentCache1Data_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(31),
      Q => currentCache1Data(31),
      R => '0'
    );
\currentCache1Data_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(32),
      Q => currentCache1Data(32),
      R => '0'
    );
\currentCache1Data_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(33),
      Q => currentCache1Data(33),
      R => '0'
    );
\currentCache1Data_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(34),
      Q => currentCache1Data(34),
      R => '0'
    );
\currentCache1Data_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(35),
      Q => currentCache1Data(35),
      R => '0'
    );
\currentCache1Data_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(36),
      Q => currentCache1Data(36),
      R => '0'
    );
\currentCache1Data_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(37),
      Q => currentCache1Data(37),
      R => '0'
    );
\currentCache1Data_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(38),
      Q => currentCache1Data(38),
      R => '0'
    );
\currentCache1Data_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(39),
      Q => currentCache1Data(39),
      R => '0'
    );
\currentCache1Data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(3),
      Q => currentCache1Data(3),
      R => '0'
    );
\currentCache1Data_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(40),
      Q => currentCache1Data(40),
      R => '0'
    );
\currentCache1Data_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(41),
      Q => currentCache1Data(41),
      R => '0'
    );
\currentCache1Data_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(42),
      Q => currentCache1Data(42),
      R => '0'
    );
\currentCache1Data_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(43),
      Q => currentCache1Data(43),
      R => '0'
    );
\currentCache1Data_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(44),
      Q => currentCache1Data(44),
      R => '0'
    );
\currentCache1Data_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(45),
      Q => currentCache1Data(45),
      R => '0'
    );
\currentCache1Data_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(46),
      Q => currentCache1Data(46),
      R => '0'
    );
\currentCache1Data_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(47),
      Q => currentCache1Data(47),
      R => '0'
    );
\currentCache1Data_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(48),
      Q => currentCache1Data(48),
      R => '0'
    );
\currentCache1Data_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(49),
      Q => currentCache1Data(49),
      R => '0'
    );
\currentCache1Data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(4),
      Q => currentCache1Data(4),
      R => '0'
    );
\currentCache1Data_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(50),
      Q => currentCache1Data(50),
      R => '0'
    );
\currentCache1Data_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(51),
      Q => currentCache1Data(51),
      R => '0'
    );
\currentCache1Data_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(52),
      Q => currentCache1Data(52),
      R => '0'
    );
\currentCache1Data_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(53),
      Q => currentCache1Data(53),
      R => '0'
    );
\currentCache1Data_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(54),
      Q => currentCache1Data(54),
      R => '0'
    );
\currentCache1Data_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(55),
      Q => currentCache1Data(55),
      R => '0'
    );
\currentCache1Data_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(56),
      Q => currentCache1Data(56),
      R => '0'
    );
\currentCache1Data_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(57),
      Q => currentCache1Data(57),
      R => '0'
    );
\currentCache1Data_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(58),
      Q => currentCache1Data(58),
      R => '0'
    );
\currentCache1Data_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(59),
      Q => currentCache1Data(59),
      R => '0'
    );
\currentCache1Data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(5),
      Q => currentCache1Data(5),
      R => '0'
    );
\currentCache1Data_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(60),
      Q => currentCache1Data(60),
      R => '0'
    );
\currentCache1Data_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(61),
      Q => currentCache1Data(61),
      R => '0'
    );
\currentCache1Data_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(62),
      Q => currentCache1Data(62),
      R => '0'
    );
\currentCache1Data_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(63),
      Q => currentCache1Data(63),
      R => '0'
    );
\currentCache1Data_reg[64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(64),
      Q => currentCache1Data(64),
      R => '0'
    );
\currentCache1Data_reg[65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(65),
      Q => currentCache1Data(65),
      R => '0'
    );
\currentCache1Data_reg[66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(66),
      Q => currentCache1Data(66),
      R => '0'
    );
\currentCache1Data_reg[67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(67),
      Q => currentCache1Data(67),
      R => '0'
    );
\currentCache1Data_reg[68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(68),
      Q => currentCache1Data(68),
      R => '0'
    );
\currentCache1Data_reg[69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(69),
      Q => currentCache1Data(69),
      R => '0'
    );
\currentCache1Data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(6),
      Q => currentCache1Data(6),
      R => '0'
    );
\currentCache1Data_reg[70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(70),
      Q => currentCache1Data(70),
      R => '0'
    );
\currentCache1Data_reg[71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(71),
      Q => currentCache1Data(71),
      R => '0'
    );
\currentCache1Data_reg[72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(72),
      Q => currentCache1Data(72),
      R => '0'
    );
\currentCache1Data_reg[73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(73),
      Q => currentCache1Data(73),
      R => '0'
    );
\currentCache1Data_reg[74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(74),
      Q => currentCache1Data(74),
      R => '0'
    );
\currentCache1Data_reg[75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(75),
      Q => currentCache1Data(75),
      R => '0'
    );
\currentCache1Data_reg[76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(76),
      Q => currentCache1Data(76),
      R => '0'
    );
\currentCache1Data_reg[77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(77),
      Q => currentCache1Data(77),
      R => '0'
    );
\currentCache1Data_reg[78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(78),
      Q => currentCache1Data(78),
      R => '0'
    );
\currentCache1Data_reg[79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(79),
      Q => currentCache1Data(79),
      R => '0'
    );
\currentCache1Data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(7),
      Q => currentCache1Data(7),
      R => '0'
    );
\currentCache1Data_reg[80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(80),
      Q => currentCache1Data(80),
      R => '0'
    );
\currentCache1Data_reg[81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(81),
      Q => currentCache1Data(81),
      R => '0'
    );
\currentCache1Data_reg[82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(82),
      Q => currentCache1Data(82),
      R => '0'
    );
\currentCache1Data_reg[83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(83),
      Q => currentCache1Data(83),
      R => '0'
    );
\currentCache1Data_reg[84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(84),
      Q => currentCache1Data(84),
      R => '0'
    );
\currentCache1Data_reg[85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(85),
      Q => currentCache1Data(85),
      R => '0'
    );
\currentCache1Data_reg[86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(86),
      Q => currentCache1Data(86),
      R => '0'
    );
\currentCache1Data_reg[87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(87),
      Q => currentCache1Data(87),
      R => '0'
    );
\currentCache1Data_reg[88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(88),
      Q => currentCache1Data(88),
      R => '0'
    );
\currentCache1Data_reg[89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(89),
      Q => currentCache1Data(89),
      R => '0'
    );
\currentCache1Data_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(8),
      Q => currentCache1Data(8),
      R => '0'
    );
\currentCache1Data_reg[90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(90),
      Q => currentCache1Data(90),
      R => '0'
    );
\currentCache1Data_reg[91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(91),
      Q => currentCache1Data(91),
      R => '0'
    );
\currentCache1Data_reg[92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(92),
      Q => currentCache1Data(92),
      R => '0'
    );
\currentCache1Data_reg[93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(93),
      Q => currentCache1Data(93),
      R => '0'
    );
\currentCache1Data_reg[94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(94),
      Q => currentCache1Data(94),
      R => '0'
    );
\currentCache1Data_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(95),
      Q => currentCache1Data(95),
      R => '0'
    );
\currentCache1Data_reg[96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(96),
      Q => currentCache1Data(96),
      R => '0'
    );
\currentCache1Data_reg[97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(97),
      Q => currentCache1Data(97),
      R => '0'
    );
\currentCache1Data_reg[98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(98),
      Q => currentCache1Data(98),
      R => '0'
    );
\currentCache1Data_reg[99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(99),
      Q => currentCache1Data(99),
      R => '0'
    );
\currentCache1Data_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache1Data_5,
      D => IBCReadResponsesFIFO_rd_data(9),
      Q => currentCache1Data(9),
      R => '0'
    );
\currentCache2BaseAddr[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(5),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[0]_i_1_n_0\
    );
\currentCache2BaseAddr[10]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(15),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[10]_i_1_n_0\
    );
\currentCache2BaseAddr[11]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(16),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[11]_i_1_n_0\
    );
\currentCache2BaseAddr[12]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(17),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[12]_i_1_n_0\
    );
\currentCache2BaseAddr[13]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(18),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[13]_i_1_n_0\
    );
\currentCache2BaseAddr[14]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(19),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[14]_i_1_n_0\
    );
\currentCache2BaseAddr[15]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(20),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[15]_i_1_n_0\
    );
\currentCache2BaseAddr[16]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(21),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[16]_i_1_n_0\
    );
\currentCache2BaseAddr[17]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(22),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[17]_i_1_n_0\
    );
\currentCache2BaseAddr[18]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(23),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[18]_i_1_n_0\
    );
\currentCache2BaseAddr[19]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(24),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[19]_i_1_n_0\
    );
\currentCache2BaseAddr[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(6),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[1]_i_1_n_0\
    );
\currentCache2BaseAddr[20]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(25),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[20]_i_1_n_0\
    );
\currentCache2BaseAddr[21]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(26),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[21]_i_1_n_0\
    );
\currentCache2BaseAddr[22]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(27),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[22]_i_1_n_0\
    );
\currentCache2BaseAddr[23]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(28),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[23]_i_1_n_0\
    );
\currentCache2BaseAddr[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A888"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[0]\,
      I1 => currentCache2Data_4,
      I2 => \^dbg_state\(0),
      I3 => VBB_InvalidateIndexCache,
      O => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => currentCache2Data_4,
      O => currentCache2BaseAddr_3
    );
\currentCache2BaseAddr[24]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(29),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[24]_i_3_n_0\
    );
\currentCache2BaseAddr[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(7),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[2]_i_1_n_0\
    );
\currentCache2BaseAddr[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(8),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[3]_i_1_n_0\
    );
\currentCache2BaseAddr[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(9),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[4]_i_1_n_0\
    );
\currentCache2BaseAddr[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(10),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[5]_i_1_n_0\
    );
\currentCache2BaseAddr[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(11),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[6]_i_1_n_0\
    );
\currentCache2BaseAddr[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(12),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[7]_i_1_n_0\
    );
\currentCache2BaseAddr[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(13),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[8]_i_1_n_0\
    );
\currentCache2BaseAddr[9]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F888"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => VBB_ReadAddr(14),
      I3 => \^dbg_state\(1),
      O => \currentCache2BaseAddr[9]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[0]_i_1_n_0\,
      Q => currentCache2BaseAddr(0),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[10]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[10]_i_1_n_0\,
      Q => currentCache2BaseAddr(10),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[11]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[11]_i_1_n_0\,
      Q => currentCache2BaseAddr(11),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[12]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[12]_i_1_n_0\,
      Q => currentCache2BaseAddr(12),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[13]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[13]_i_1_n_0\,
      Q => currentCache2BaseAddr(13),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[14]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[14]_i_1_n_0\,
      Q => currentCache2BaseAddr(14),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[15]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[15]_i_1_n_0\,
      Q => currentCache2BaseAddr(15),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[16]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[16]_i_1_n_0\,
      Q => currentCache2BaseAddr(16),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[17]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[17]_i_1_n_0\,
      Q => currentCache2BaseAddr(17),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[18]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[18]_i_1_n_0\,
      Q => currentCache2BaseAddr(18),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[19]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[19]_i_1_n_0\,
      Q => currentCache2BaseAddr(19),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[1]_i_1_n_0\,
      Q => currentCache2BaseAddr(1),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[20]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[20]_i_1_n_0\,
      Q => currentCache2BaseAddr(20),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[21]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[21]_i_1_n_0\,
      Q => currentCache2BaseAddr(21),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[22]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[22]_i_1_n_0\,
      Q => currentCache2BaseAddr(22),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[23]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[23]_i_1_n_0\,
      Q => currentCache2BaseAddr(23),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[24]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[24]_i_3_n_0\,
      Q => currentCache2BaseAddr(24),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[2]_i_1_n_0\,
      Q => currentCache2BaseAddr(2),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[3]_i_1_n_0\,
      Q => currentCache2BaseAddr(3),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[4]_i_1_n_0\,
      Q => currentCache2BaseAddr(4),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[5]_i_1_n_0\,
      Q => currentCache2BaseAddr(5),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[6]_i_1_n_0\,
      Q => currentCache2BaseAddr(6),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[7]_i_1_n_0\,
      Q => currentCache2BaseAddr(7),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[8]_i_1_n_0\,
      Q => currentCache2BaseAddr(8),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2BaseAddr_reg[9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2BaseAddr_3,
      D => \currentCache2BaseAddr[9]_i_1_n_0\,
      Q => currentCache2BaseAddr(9),
      S => \currentCache2BaseAddr[24]_i_1_n_0\
    );
\currentCache2Data[255]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0020"
    )
        port map (
      I0 => \^dbg_state\(1),
      I1 => IBCReadResponsesFIFO_empty,
      I2 => \nextCacheLineWrite_reg_n_0_[1]\,
      I3 => \nextCacheLineWrite_reg_n_0_[0]\,
      O => currentCache2Data_4
    );
\currentCache2Data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(0),
      Q => currentCache2Data(0),
      R => '0'
    );
\currentCache2Data_reg[100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(100),
      Q => currentCache2Data(100),
      R => '0'
    );
\currentCache2Data_reg[101]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(101),
      Q => currentCache2Data(101),
      R => '0'
    );
\currentCache2Data_reg[102]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(102),
      Q => currentCache2Data(102),
      R => '0'
    );
\currentCache2Data_reg[103]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(103),
      Q => currentCache2Data(103),
      R => '0'
    );
\currentCache2Data_reg[104]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(104),
      Q => currentCache2Data(104),
      R => '0'
    );
\currentCache2Data_reg[105]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(105),
      Q => currentCache2Data(105),
      R => '0'
    );
\currentCache2Data_reg[106]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(106),
      Q => currentCache2Data(106),
      R => '0'
    );
\currentCache2Data_reg[107]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(107),
      Q => currentCache2Data(107),
      R => '0'
    );
\currentCache2Data_reg[108]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(108),
      Q => currentCache2Data(108),
      R => '0'
    );
\currentCache2Data_reg[109]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(109),
      Q => currentCache2Data(109),
      R => '0'
    );
\currentCache2Data_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(10),
      Q => currentCache2Data(10),
      R => '0'
    );
\currentCache2Data_reg[110]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(110),
      Q => currentCache2Data(110),
      R => '0'
    );
\currentCache2Data_reg[111]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(111),
      Q => currentCache2Data(111),
      R => '0'
    );
\currentCache2Data_reg[112]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(112),
      Q => currentCache2Data(112),
      R => '0'
    );
\currentCache2Data_reg[113]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(113),
      Q => currentCache2Data(113),
      R => '0'
    );
\currentCache2Data_reg[114]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(114),
      Q => currentCache2Data(114),
      R => '0'
    );
\currentCache2Data_reg[115]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(115),
      Q => currentCache2Data(115),
      R => '0'
    );
\currentCache2Data_reg[116]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(116),
      Q => currentCache2Data(116),
      R => '0'
    );
\currentCache2Data_reg[117]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(117),
      Q => currentCache2Data(117),
      R => '0'
    );
\currentCache2Data_reg[118]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(118),
      Q => currentCache2Data(118),
      R => '0'
    );
\currentCache2Data_reg[119]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(119),
      Q => currentCache2Data(119),
      R => '0'
    );
\currentCache2Data_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(11),
      Q => currentCache2Data(11),
      R => '0'
    );
\currentCache2Data_reg[120]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(120),
      Q => currentCache2Data(120),
      R => '0'
    );
\currentCache2Data_reg[121]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(121),
      Q => currentCache2Data(121),
      R => '0'
    );
\currentCache2Data_reg[122]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(122),
      Q => currentCache2Data(122),
      R => '0'
    );
\currentCache2Data_reg[123]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(123),
      Q => currentCache2Data(123),
      R => '0'
    );
\currentCache2Data_reg[124]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(124),
      Q => currentCache2Data(124),
      R => '0'
    );
\currentCache2Data_reg[125]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(125),
      Q => currentCache2Data(125),
      R => '0'
    );
\currentCache2Data_reg[126]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(126),
      Q => currentCache2Data(126),
      R => '0'
    );
\currentCache2Data_reg[127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(127),
      Q => currentCache2Data(127),
      R => '0'
    );
\currentCache2Data_reg[128]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(128),
      Q => currentCache2Data(128),
      R => '0'
    );
\currentCache2Data_reg[129]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(129),
      Q => currentCache2Data(129),
      R => '0'
    );
\currentCache2Data_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(12),
      Q => currentCache2Data(12),
      R => '0'
    );
\currentCache2Data_reg[130]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(130),
      Q => currentCache2Data(130),
      R => '0'
    );
\currentCache2Data_reg[131]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(131),
      Q => currentCache2Data(131),
      R => '0'
    );
\currentCache2Data_reg[132]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(132),
      Q => currentCache2Data(132),
      R => '0'
    );
\currentCache2Data_reg[133]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(133),
      Q => currentCache2Data(133),
      R => '0'
    );
\currentCache2Data_reg[134]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(134),
      Q => currentCache2Data(134),
      R => '0'
    );
\currentCache2Data_reg[135]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(135),
      Q => currentCache2Data(135),
      R => '0'
    );
\currentCache2Data_reg[136]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(136),
      Q => currentCache2Data(136),
      R => '0'
    );
\currentCache2Data_reg[137]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(137),
      Q => currentCache2Data(137),
      R => '0'
    );
\currentCache2Data_reg[138]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(138),
      Q => currentCache2Data(138),
      R => '0'
    );
\currentCache2Data_reg[139]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(139),
      Q => currentCache2Data(139),
      R => '0'
    );
\currentCache2Data_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(13),
      Q => currentCache2Data(13),
      R => '0'
    );
\currentCache2Data_reg[140]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(140),
      Q => currentCache2Data(140),
      R => '0'
    );
\currentCache2Data_reg[141]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(141),
      Q => currentCache2Data(141),
      R => '0'
    );
\currentCache2Data_reg[142]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(142),
      Q => currentCache2Data(142),
      R => '0'
    );
\currentCache2Data_reg[143]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(143),
      Q => currentCache2Data(143),
      R => '0'
    );
\currentCache2Data_reg[144]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(144),
      Q => currentCache2Data(144),
      R => '0'
    );
\currentCache2Data_reg[145]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(145),
      Q => currentCache2Data(145),
      R => '0'
    );
\currentCache2Data_reg[146]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(146),
      Q => currentCache2Data(146),
      R => '0'
    );
\currentCache2Data_reg[147]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(147),
      Q => currentCache2Data(147),
      R => '0'
    );
\currentCache2Data_reg[148]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(148),
      Q => currentCache2Data(148),
      R => '0'
    );
\currentCache2Data_reg[149]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(149),
      Q => currentCache2Data(149),
      R => '0'
    );
\currentCache2Data_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(14),
      Q => currentCache2Data(14),
      R => '0'
    );
\currentCache2Data_reg[150]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(150),
      Q => currentCache2Data(150),
      R => '0'
    );
\currentCache2Data_reg[151]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(151),
      Q => currentCache2Data(151),
      R => '0'
    );
\currentCache2Data_reg[152]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(152),
      Q => currentCache2Data(152),
      R => '0'
    );
\currentCache2Data_reg[153]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(153),
      Q => currentCache2Data(153),
      R => '0'
    );
\currentCache2Data_reg[154]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(154),
      Q => currentCache2Data(154),
      R => '0'
    );
\currentCache2Data_reg[155]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(155),
      Q => currentCache2Data(155),
      R => '0'
    );
\currentCache2Data_reg[156]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(156),
      Q => currentCache2Data(156),
      R => '0'
    );
\currentCache2Data_reg[157]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(157),
      Q => currentCache2Data(157),
      R => '0'
    );
\currentCache2Data_reg[158]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(158),
      Q => currentCache2Data(158),
      R => '0'
    );
\currentCache2Data_reg[159]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(159),
      Q => currentCache2Data(159),
      R => '0'
    );
\currentCache2Data_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(15),
      Q => currentCache2Data(15),
      R => '0'
    );
\currentCache2Data_reg[160]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(160),
      Q => currentCache2Data(160),
      R => '0'
    );
\currentCache2Data_reg[161]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(161),
      Q => currentCache2Data(161),
      R => '0'
    );
\currentCache2Data_reg[162]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(162),
      Q => currentCache2Data(162),
      R => '0'
    );
\currentCache2Data_reg[163]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(163),
      Q => currentCache2Data(163),
      R => '0'
    );
\currentCache2Data_reg[164]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(164),
      Q => currentCache2Data(164),
      R => '0'
    );
\currentCache2Data_reg[165]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(165),
      Q => currentCache2Data(165),
      R => '0'
    );
\currentCache2Data_reg[166]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(166),
      Q => currentCache2Data(166),
      R => '0'
    );
\currentCache2Data_reg[167]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(167),
      Q => currentCache2Data(167),
      R => '0'
    );
\currentCache2Data_reg[168]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(168),
      Q => currentCache2Data(168),
      R => '0'
    );
\currentCache2Data_reg[169]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(169),
      Q => currentCache2Data(169),
      R => '0'
    );
\currentCache2Data_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(16),
      Q => currentCache2Data(16),
      R => '0'
    );
\currentCache2Data_reg[170]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(170),
      Q => currentCache2Data(170),
      R => '0'
    );
\currentCache2Data_reg[171]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(171),
      Q => currentCache2Data(171),
      R => '0'
    );
\currentCache2Data_reg[172]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(172),
      Q => currentCache2Data(172),
      R => '0'
    );
\currentCache2Data_reg[173]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(173),
      Q => currentCache2Data(173),
      R => '0'
    );
\currentCache2Data_reg[174]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(174),
      Q => currentCache2Data(174),
      R => '0'
    );
\currentCache2Data_reg[175]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(175),
      Q => currentCache2Data(175),
      R => '0'
    );
\currentCache2Data_reg[176]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(176),
      Q => currentCache2Data(176),
      R => '0'
    );
\currentCache2Data_reg[177]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(177),
      Q => currentCache2Data(177),
      R => '0'
    );
\currentCache2Data_reg[178]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(178),
      Q => currentCache2Data(178),
      R => '0'
    );
\currentCache2Data_reg[179]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(179),
      Q => currentCache2Data(179),
      R => '0'
    );
\currentCache2Data_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(17),
      Q => currentCache2Data(17),
      R => '0'
    );
\currentCache2Data_reg[180]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(180),
      Q => currentCache2Data(180),
      R => '0'
    );
\currentCache2Data_reg[181]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(181),
      Q => currentCache2Data(181),
      R => '0'
    );
\currentCache2Data_reg[182]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(182),
      Q => currentCache2Data(182),
      R => '0'
    );
\currentCache2Data_reg[183]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(183),
      Q => currentCache2Data(183),
      R => '0'
    );
\currentCache2Data_reg[184]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(184),
      Q => currentCache2Data(184),
      R => '0'
    );
\currentCache2Data_reg[185]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(185),
      Q => currentCache2Data(185),
      R => '0'
    );
\currentCache2Data_reg[186]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(186),
      Q => currentCache2Data(186),
      R => '0'
    );
\currentCache2Data_reg[187]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(187),
      Q => currentCache2Data(187),
      R => '0'
    );
\currentCache2Data_reg[188]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(188),
      Q => currentCache2Data(188),
      R => '0'
    );
\currentCache2Data_reg[189]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(189),
      Q => currentCache2Data(189),
      R => '0'
    );
\currentCache2Data_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(18),
      Q => currentCache2Data(18),
      R => '0'
    );
\currentCache2Data_reg[190]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(190),
      Q => currentCache2Data(190),
      R => '0'
    );
\currentCache2Data_reg[191]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(191),
      Q => currentCache2Data(191),
      R => '0'
    );
\currentCache2Data_reg[192]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(192),
      Q => currentCache2Data(192),
      R => '0'
    );
\currentCache2Data_reg[193]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(193),
      Q => currentCache2Data(193),
      R => '0'
    );
\currentCache2Data_reg[194]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(194),
      Q => currentCache2Data(194),
      R => '0'
    );
\currentCache2Data_reg[195]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(195),
      Q => currentCache2Data(195),
      R => '0'
    );
\currentCache2Data_reg[196]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(196),
      Q => currentCache2Data(196),
      R => '0'
    );
\currentCache2Data_reg[197]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(197),
      Q => currentCache2Data(197),
      R => '0'
    );
\currentCache2Data_reg[198]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(198),
      Q => currentCache2Data(198),
      R => '0'
    );
\currentCache2Data_reg[199]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(199),
      Q => currentCache2Data(199),
      R => '0'
    );
\currentCache2Data_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(19),
      Q => currentCache2Data(19),
      R => '0'
    );
\currentCache2Data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(1),
      Q => currentCache2Data(1),
      R => '0'
    );
\currentCache2Data_reg[200]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(200),
      Q => currentCache2Data(200),
      R => '0'
    );
\currentCache2Data_reg[201]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(201),
      Q => currentCache2Data(201),
      R => '0'
    );
\currentCache2Data_reg[202]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(202),
      Q => currentCache2Data(202),
      R => '0'
    );
\currentCache2Data_reg[203]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(203),
      Q => currentCache2Data(203),
      R => '0'
    );
\currentCache2Data_reg[204]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(204),
      Q => currentCache2Data(204),
      R => '0'
    );
\currentCache2Data_reg[205]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(205),
      Q => currentCache2Data(205),
      R => '0'
    );
\currentCache2Data_reg[206]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(206),
      Q => currentCache2Data(206),
      R => '0'
    );
\currentCache2Data_reg[207]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(207),
      Q => currentCache2Data(207),
      R => '0'
    );
\currentCache2Data_reg[208]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(208),
      Q => currentCache2Data(208),
      R => '0'
    );
\currentCache2Data_reg[209]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(209),
      Q => currentCache2Data(209),
      R => '0'
    );
\currentCache2Data_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(20),
      Q => currentCache2Data(20),
      R => '0'
    );
\currentCache2Data_reg[210]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(210),
      Q => currentCache2Data(210),
      R => '0'
    );
\currentCache2Data_reg[211]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(211),
      Q => currentCache2Data(211),
      R => '0'
    );
\currentCache2Data_reg[212]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(212),
      Q => currentCache2Data(212),
      R => '0'
    );
\currentCache2Data_reg[213]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(213),
      Q => currentCache2Data(213),
      R => '0'
    );
\currentCache2Data_reg[214]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(214),
      Q => currentCache2Data(214),
      R => '0'
    );
\currentCache2Data_reg[215]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(215),
      Q => currentCache2Data(215),
      R => '0'
    );
\currentCache2Data_reg[216]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(216),
      Q => currentCache2Data(216),
      R => '0'
    );
\currentCache2Data_reg[217]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(217),
      Q => currentCache2Data(217),
      R => '0'
    );
\currentCache2Data_reg[218]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(218),
      Q => currentCache2Data(218),
      R => '0'
    );
\currentCache2Data_reg[219]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(219),
      Q => currentCache2Data(219),
      R => '0'
    );
\currentCache2Data_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(21),
      Q => currentCache2Data(21),
      R => '0'
    );
\currentCache2Data_reg[220]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(220),
      Q => currentCache2Data(220),
      R => '0'
    );
\currentCache2Data_reg[221]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(221),
      Q => currentCache2Data(221),
      R => '0'
    );
\currentCache2Data_reg[222]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(222),
      Q => currentCache2Data(222),
      R => '0'
    );
\currentCache2Data_reg[223]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(223),
      Q => currentCache2Data(223),
      R => '0'
    );
\currentCache2Data_reg[224]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(224),
      Q => currentCache2Data(224),
      R => '0'
    );
\currentCache2Data_reg[225]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(225),
      Q => currentCache2Data(225),
      R => '0'
    );
\currentCache2Data_reg[226]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(226),
      Q => currentCache2Data(226),
      R => '0'
    );
\currentCache2Data_reg[227]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(227),
      Q => currentCache2Data(227),
      R => '0'
    );
\currentCache2Data_reg[228]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(228),
      Q => currentCache2Data(228),
      R => '0'
    );
\currentCache2Data_reg[229]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(229),
      Q => currentCache2Data(229),
      R => '0'
    );
\currentCache2Data_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(22),
      Q => currentCache2Data(22),
      R => '0'
    );
\currentCache2Data_reg[230]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(230),
      Q => currentCache2Data(230),
      R => '0'
    );
\currentCache2Data_reg[231]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(231),
      Q => currentCache2Data(231),
      R => '0'
    );
\currentCache2Data_reg[232]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(232),
      Q => currentCache2Data(232),
      R => '0'
    );
\currentCache2Data_reg[233]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(233),
      Q => currentCache2Data(233),
      R => '0'
    );
\currentCache2Data_reg[234]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(234),
      Q => currentCache2Data(234),
      R => '0'
    );
\currentCache2Data_reg[235]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(235),
      Q => currentCache2Data(235),
      R => '0'
    );
\currentCache2Data_reg[236]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(236),
      Q => currentCache2Data(236),
      R => '0'
    );
\currentCache2Data_reg[237]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(237),
      Q => currentCache2Data(237),
      R => '0'
    );
\currentCache2Data_reg[238]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(238),
      Q => currentCache2Data(238),
      R => '0'
    );
\currentCache2Data_reg[239]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(239),
      Q => currentCache2Data(239),
      R => '0'
    );
\currentCache2Data_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(23),
      Q => currentCache2Data(23),
      R => '0'
    );
\currentCache2Data_reg[240]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(240),
      Q => currentCache2Data(240),
      R => '0'
    );
\currentCache2Data_reg[241]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(241),
      Q => currentCache2Data(241),
      R => '0'
    );
\currentCache2Data_reg[242]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(242),
      Q => currentCache2Data(242),
      R => '0'
    );
\currentCache2Data_reg[243]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(243),
      Q => currentCache2Data(243),
      R => '0'
    );
\currentCache2Data_reg[244]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(244),
      Q => currentCache2Data(244),
      R => '0'
    );
\currentCache2Data_reg[245]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(245),
      Q => currentCache2Data(245),
      R => '0'
    );
\currentCache2Data_reg[246]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(246),
      Q => currentCache2Data(246),
      R => '0'
    );
\currentCache2Data_reg[247]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(247),
      Q => currentCache2Data(247),
      R => '0'
    );
\currentCache2Data_reg[248]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(248),
      Q => currentCache2Data(248),
      R => '0'
    );
\currentCache2Data_reg[249]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(249),
      Q => currentCache2Data(249),
      R => '0'
    );
\currentCache2Data_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(24),
      Q => currentCache2Data(24),
      R => '0'
    );
\currentCache2Data_reg[250]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(250),
      Q => currentCache2Data(250),
      R => '0'
    );
\currentCache2Data_reg[251]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(251),
      Q => currentCache2Data(251),
      R => '0'
    );
\currentCache2Data_reg[252]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(252),
      Q => currentCache2Data(252),
      R => '0'
    );
\currentCache2Data_reg[253]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(253),
      Q => currentCache2Data(253),
      R => '0'
    );
\currentCache2Data_reg[254]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(254),
      Q => currentCache2Data(254),
      R => '0'
    );
\currentCache2Data_reg[255]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(255),
      Q => currentCache2Data(255),
      R => '0'
    );
\currentCache2Data_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(25),
      Q => currentCache2Data(25),
      R => '0'
    );
\currentCache2Data_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(26),
      Q => currentCache2Data(26),
      R => '0'
    );
\currentCache2Data_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(27),
      Q => currentCache2Data(27),
      R => '0'
    );
\currentCache2Data_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(28),
      Q => currentCache2Data(28),
      R => '0'
    );
\currentCache2Data_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(29),
      Q => currentCache2Data(29),
      R => '0'
    );
\currentCache2Data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(2),
      Q => currentCache2Data(2),
      R => '0'
    );
\currentCache2Data_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(30),
      Q => currentCache2Data(30),
      R => '0'
    );
\currentCache2Data_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(31),
      Q => currentCache2Data(31),
      R => '0'
    );
\currentCache2Data_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(32),
      Q => currentCache2Data(32),
      R => '0'
    );
\currentCache2Data_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(33),
      Q => currentCache2Data(33),
      R => '0'
    );
\currentCache2Data_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(34),
      Q => currentCache2Data(34),
      R => '0'
    );
\currentCache2Data_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(35),
      Q => currentCache2Data(35),
      R => '0'
    );
\currentCache2Data_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(36),
      Q => currentCache2Data(36),
      R => '0'
    );
\currentCache2Data_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(37),
      Q => currentCache2Data(37),
      R => '0'
    );
\currentCache2Data_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(38),
      Q => currentCache2Data(38),
      R => '0'
    );
\currentCache2Data_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(39),
      Q => currentCache2Data(39),
      R => '0'
    );
\currentCache2Data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(3),
      Q => currentCache2Data(3),
      R => '0'
    );
\currentCache2Data_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(40),
      Q => currentCache2Data(40),
      R => '0'
    );
\currentCache2Data_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(41),
      Q => currentCache2Data(41),
      R => '0'
    );
\currentCache2Data_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(42),
      Q => currentCache2Data(42),
      R => '0'
    );
\currentCache2Data_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(43),
      Q => currentCache2Data(43),
      R => '0'
    );
\currentCache2Data_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(44),
      Q => currentCache2Data(44),
      R => '0'
    );
\currentCache2Data_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(45),
      Q => currentCache2Data(45),
      R => '0'
    );
\currentCache2Data_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(46),
      Q => currentCache2Data(46),
      R => '0'
    );
\currentCache2Data_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(47),
      Q => currentCache2Data(47),
      R => '0'
    );
\currentCache2Data_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(48),
      Q => currentCache2Data(48),
      R => '0'
    );
\currentCache2Data_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(49),
      Q => currentCache2Data(49),
      R => '0'
    );
\currentCache2Data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(4),
      Q => currentCache2Data(4),
      R => '0'
    );
\currentCache2Data_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(50),
      Q => currentCache2Data(50),
      R => '0'
    );
\currentCache2Data_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(51),
      Q => currentCache2Data(51),
      R => '0'
    );
\currentCache2Data_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(52),
      Q => currentCache2Data(52),
      R => '0'
    );
\currentCache2Data_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(53),
      Q => currentCache2Data(53),
      R => '0'
    );
\currentCache2Data_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(54),
      Q => currentCache2Data(54),
      R => '0'
    );
\currentCache2Data_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(55),
      Q => currentCache2Data(55),
      R => '0'
    );
\currentCache2Data_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(56),
      Q => currentCache2Data(56),
      R => '0'
    );
\currentCache2Data_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(57),
      Q => currentCache2Data(57),
      R => '0'
    );
\currentCache2Data_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(58),
      Q => currentCache2Data(58),
      R => '0'
    );
\currentCache2Data_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(59),
      Q => currentCache2Data(59),
      R => '0'
    );
\currentCache2Data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(5),
      Q => currentCache2Data(5),
      R => '0'
    );
\currentCache2Data_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(60),
      Q => currentCache2Data(60),
      R => '0'
    );
\currentCache2Data_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(61),
      Q => currentCache2Data(61),
      R => '0'
    );
\currentCache2Data_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(62),
      Q => currentCache2Data(62),
      R => '0'
    );
\currentCache2Data_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(63),
      Q => currentCache2Data(63),
      R => '0'
    );
\currentCache2Data_reg[64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(64),
      Q => currentCache2Data(64),
      R => '0'
    );
\currentCache2Data_reg[65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(65),
      Q => currentCache2Data(65),
      R => '0'
    );
\currentCache2Data_reg[66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(66),
      Q => currentCache2Data(66),
      R => '0'
    );
\currentCache2Data_reg[67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(67),
      Q => currentCache2Data(67),
      R => '0'
    );
\currentCache2Data_reg[68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(68),
      Q => currentCache2Data(68),
      R => '0'
    );
\currentCache2Data_reg[69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(69),
      Q => currentCache2Data(69),
      R => '0'
    );
\currentCache2Data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(6),
      Q => currentCache2Data(6),
      R => '0'
    );
\currentCache2Data_reg[70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(70),
      Q => currentCache2Data(70),
      R => '0'
    );
\currentCache2Data_reg[71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(71),
      Q => currentCache2Data(71),
      R => '0'
    );
\currentCache2Data_reg[72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(72),
      Q => currentCache2Data(72),
      R => '0'
    );
\currentCache2Data_reg[73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(73),
      Q => currentCache2Data(73),
      R => '0'
    );
\currentCache2Data_reg[74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(74),
      Q => currentCache2Data(74),
      R => '0'
    );
\currentCache2Data_reg[75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(75),
      Q => currentCache2Data(75),
      R => '0'
    );
\currentCache2Data_reg[76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(76),
      Q => currentCache2Data(76),
      R => '0'
    );
\currentCache2Data_reg[77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(77),
      Q => currentCache2Data(77),
      R => '0'
    );
\currentCache2Data_reg[78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(78),
      Q => currentCache2Data(78),
      R => '0'
    );
\currentCache2Data_reg[79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(79),
      Q => currentCache2Data(79),
      R => '0'
    );
\currentCache2Data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(7),
      Q => currentCache2Data(7),
      R => '0'
    );
\currentCache2Data_reg[80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(80),
      Q => currentCache2Data(80),
      R => '0'
    );
\currentCache2Data_reg[81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(81),
      Q => currentCache2Data(81),
      R => '0'
    );
\currentCache2Data_reg[82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(82),
      Q => currentCache2Data(82),
      R => '0'
    );
\currentCache2Data_reg[83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(83),
      Q => currentCache2Data(83),
      R => '0'
    );
\currentCache2Data_reg[84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(84),
      Q => currentCache2Data(84),
      R => '0'
    );
\currentCache2Data_reg[85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(85),
      Q => currentCache2Data(85),
      R => '0'
    );
\currentCache2Data_reg[86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(86),
      Q => currentCache2Data(86),
      R => '0'
    );
\currentCache2Data_reg[87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(87),
      Q => currentCache2Data(87),
      R => '0'
    );
\currentCache2Data_reg[88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(88),
      Q => currentCache2Data(88),
      R => '0'
    );
\currentCache2Data_reg[89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(89),
      Q => currentCache2Data(89),
      R => '0'
    );
\currentCache2Data_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(8),
      Q => currentCache2Data(8),
      R => '0'
    );
\currentCache2Data_reg[90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(90),
      Q => currentCache2Data(90),
      R => '0'
    );
\currentCache2Data_reg[91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(91),
      Q => currentCache2Data(91),
      R => '0'
    );
\currentCache2Data_reg[92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(92),
      Q => currentCache2Data(92),
      R => '0'
    );
\currentCache2Data_reg[93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(93),
      Q => currentCache2Data(93),
      R => '0'
    );
\currentCache2Data_reg[94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(94),
      Q => currentCache2Data(94),
      R => '0'
    );
\currentCache2Data_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(95),
      Q => currentCache2Data(95),
      R => '0'
    );
\currentCache2Data_reg[96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(96),
      Q => currentCache2Data(96),
      R => '0'
    );
\currentCache2Data_reg[97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(97),
      Q => currentCache2Data(97),
      R => '0'
    );
\currentCache2Data_reg[98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(98),
      Q => currentCache2Data(98),
      R => '0'
    );
\currentCache2Data_reg[99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(99),
      Q => currentCache2Data(99),
      R => '0'
    );
\currentCache2Data_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache2Data_4,
      D => IBCReadResponsesFIFO_rd_data(9),
      Q => currentCache2Data(9),
      R => '0'
    );
\currentCache3BaseAddr[24]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A888"
    )
        port map (
      I0 => \FSM_onehot_currentState_reg_n_0_[0]\,
      I1 => currentCache3Data,
      I2 => \^dbg_state\(0),
      I3 => VBB_InvalidateIndexCache,
      O => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr[24]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"F8"
    )
        port map (
      I0 => VBB_InvalidateIndexCache,
      I1 => \^dbg_state\(0),
      I2 => currentCache3Data,
      O => currentCache3BaseAddr_1
    );
\currentCache3BaseAddr_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[0]_i_1_n_0\,
      Q => currentCache3BaseAddr(0),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[10]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[10]_i_1_n_0\,
      Q => currentCache3BaseAddr(10),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[11]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[11]_i_1_n_0\,
      Q => currentCache3BaseAddr(11),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[12]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[12]_i_1_n_0\,
      Q => currentCache3BaseAddr(12),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[13]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[13]_i_1_n_0\,
      Q => currentCache3BaseAddr(13),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[14]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[14]_i_1_n_0\,
      Q => currentCache3BaseAddr(14),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[15]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[15]_i_1_n_0\,
      Q => currentCache3BaseAddr(15),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[16]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[16]_i_1_n_0\,
      Q => currentCache3BaseAddr(16),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[17]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[17]_i_1_n_0\,
      Q => currentCache3BaseAddr(17),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[18]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[18]_i_1_n_0\,
      Q => currentCache3BaseAddr(18),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[19]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[19]_i_1_n_0\,
      Q => currentCache3BaseAddr(19),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[1]_i_1_n_0\,
      Q => currentCache3BaseAddr(1),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[20]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[20]_i_1_n_0\,
      Q => currentCache3BaseAddr(20),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[21]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[21]_i_1_n_0\,
      Q => currentCache3BaseAddr(21),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[22]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[22]_i_1_n_0\,
      Q => currentCache3BaseAddr(22),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[23]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[23]_i_1_n_0\,
      Q => currentCache3BaseAddr(23),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[24]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[24]_i_3_n_0\,
      Q => currentCache3BaseAddr(24),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[2]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[2]_i_1_n_0\,
      Q => currentCache3BaseAddr(2),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[3]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[3]_i_1_n_0\,
      Q => currentCache3BaseAddr(3),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[4]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[4]_i_1_n_0\,
      Q => currentCache3BaseAddr(4),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[5]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[5]_i_1_n_0\,
      Q => currentCache3BaseAddr(5),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[6]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[6]_i_1_n_0\,
      Q => currentCache3BaseAddr(6),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[7]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[7]_i_1_n_0\,
      Q => currentCache3BaseAddr(7),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[8]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[8]_i_1_n_0\,
      Q => currentCache3BaseAddr(8),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3BaseAddr_reg[9]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3BaseAddr_1,
      D => \currentCache2BaseAddr[9]_i_1_n_0\,
      Q => currentCache3BaseAddr(9),
      S => \currentCache3BaseAddr[24]_i_1_n_0\
    );
\currentCache3Data[255]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2000"
    )
        port map (
      I0 => \^dbg_state\(1),
      I1 => IBCReadResponsesFIFO_empty,
      I2 => \nextCacheLineWrite_reg_n_0_[0]\,
      I3 => \nextCacheLineWrite_reg_n_0_[1]\,
      O => currentCache3Data
    );
\currentCache3Data_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(0),
      Q => \currentCache3Data_reg_n_0_[0]\,
      R => '0'
    );
\currentCache3Data_reg[100]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(100),
      Q => data3(4),
      R => '0'
    );
\currentCache3Data_reg[101]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(101),
      Q => data3(5),
      R => '0'
    );
\currentCache3Data_reg[102]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(102),
      Q => data3(6),
      R => '0'
    );
\currentCache3Data_reg[103]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(103),
      Q => data3(7),
      R => '0'
    );
\currentCache3Data_reg[104]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(104),
      Q => data3(8),
      R => '0'
    );
\currentCache3Data_reg[105]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(105),
      Q => data3(9),
      R => '0'
    );
\currentCache3Data_reg[106]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(106),
      Q => data3(10),
      R => '0'
    );
\currentCache3Data_reg[107]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(107),
      Q => data3(11),
      R => '0'
    );
\currentCache3Data_reg[108]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(108),
      Q => data3(12),
      R => '0'
    );
\currentCache3Data_reg[109]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(109),
      Q => data3(13),
      R => '0'
    );
\currentCache3Data_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(10),
      Q => \currentCache3Data_reg_n_0_[10]\,
      R => '0'
    );
\currentCache3Data_reg[110]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(110),
      Q => data3(14),
      R => '0'
    );
\currentCache3Data_reg[111]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(111),
      Q => data3(15),
      R => '0'
    );
\currentCache3Data_reg[112]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(112),
      Q => data3(16),
      R => '0'
    );
\currentCache3Data_reg[113]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(113),
      Q => data3(17),
      R => '0'
    );
\currentCache3Data_reg[114]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(114),
      Q => data3(18),
      R => '0'
    );
\currentCache3Data_reg[115]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(115),
      Q => data3(19),
      R => '0'
    );
\currentCache3Data_reg[116]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(116),
      Q => data3(20),
      R => '0'
    );
\currentCache3Data_reg[117]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(117),
      Q => data3(21),
      R => '0'
    );
\currentCache3Data_reg[118]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(118),
      Q => data3(22),
      R => '0'
    );
\currentCache3Data_reg[119]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(119),
      Q => data3(23),
      R => '0'
    );
\currentCache3Data_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(11),
      Q => \currentCache3Data_reg_n_0_[11]\,
      R => '0'
    );
\currentCache3Data_reg[120]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(120),
      Q => data3(24),
      R => '0'
    );
\currentCache3Data_reg[121]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(121),
      Q => data3(25),
      R => '0'
    );
\currentCache3Data_reg[122]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(122),
      Q => data3(26),
      R => '0'
    );
\currentCache3Data_reg[123]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(123),
      Q => data3(27),
      R => '0'
    );
\currentCache3Data_reg[124]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(124),
      Q => data3(28),
      R => '0'
    );
\currentCache3Data_reg[125]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(125),
      Q => data3(29),
      R => '0'
    );
\currentCache3Data_reg[126]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(126),
      Q => data3(30),
      R => '0'
    );
\currentCache3Data_reg[127]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(127),
      Q => data3(31),
      R => '0'
    );
\currentCache3Data_reg[128]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(128),
      Q => data4(0),
      R => '0'
    );
\currentCache3Data_reg[129]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(129),
      Q => data4(1),
      R => '0'
    );
\currentCache3Data_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(12),
      Q => \currentCache3Data_reg_n_0_[12]\,
      R => '0'
    );
\currentCache3Data_reg[130]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(130),
      Q => data4(2),
      R => '0'
    );
\currentCache3Data_reg[131]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(131),
      Q => data4(3),
      R => '0'
    );
\currentCache3Data_reg[132]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(132),
      Q => data4(4),
      R => '0'
    );
\currentCache3Data_reg[133]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(133),
      Q => data4(5),
      R => '0'
    );
\currentCache3Data_reg[134]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(134),
      Q => data4(6),
      R => '0'
    );
\currentCache3Data_reg[135]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(135),
      Q => data4(7),
      R => '0'
    );
\currentCache3Data_reg[136]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(136),
      Q => data4(8),
      R => '0'
    );
\currentCache3Data_reg[137]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(137),
      Q => data4(9),
      R => '0'
    );
\currentCache3Data_reg[138]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(138),
      Q => data4(10),
      R => '0'
    );
\currentCache3Data_reg[139]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(139),
      Q => data4(11),
      R => '0'
    );
\currentCache3Data_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(13),
      Q => \currentCache3Data_reg_n_0_[13]\,
      R => '0'
    );
\currentCache3Data_reg[140]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(140),
      Q => data4(12),
      R => '0'
    );
\currentCache3Data_reg[141]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(141),
      Q => data4(13),
      R => '0'
    );
\currentCache3Data_reg[142]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(142),
      Q => data4(14),
      R => '0'
    );
\currentCache3Data_reg[143]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(143),
      Q => data4(15),
      R => '0'
    );
\currentCache3Data_reg[144]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(144),
      Q => data4(16),
      R => '0'
    );
\currentCache3Data_reg[145]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(145),
      Q => data4(17),
      R => '0'
    );
\currentCache3Data_reg[146]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(146),
      Q => data4(18),
      R => '0'
    );
\currentCache3Data_reg[147]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(147),
      Q => data4(19),
      R => '0'
    );
\currentCache3Data_reg[148]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(148),
      Q => data4(20),
      R => '0'
    );
\currentCache3Data_reg[149]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(149),
      Q => data4(21),
      R => '0'
    );
\currentCache3Data_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(14),
      Q => \currentCache3Data_reg_n_0_[14]\,
      R => '0'
    );
\currentCache3Data_reg[150]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(150),
      Q => data4(22),
      R => '0'
    );
\currentCache3Data_reg[151]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(151),
      Q => data4(23),
      R => '0'
    );
\currentCache3Data_reg[152]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(152),
      Q => data4(24),
      R => '0'
    );
\currentCache3Data_reg[153]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(153),
      Q => data4(25),
      R => '0'
    );
\currentCache3Data_reg[154]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(154),
      Q => data4(26),
      R => '0'
    );
\currentCache3Data_reg[155]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(155),
      Q => data4(27),
      R => '0'
    );
\currentCache3Data_reg[156]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(156),
      Q => data4(28),
      R => '0'
    );
\currentCache3Data_reg[157]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(157),
      Q => data4(29),
      R => '0'
    );
\currentCache3Data_reg[158]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(158),
      Q => data4(30),
      R => '0'
    );
\currentCache3Data_reg[159]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(159),
      Q => data4(31),
      R => '0'
    );
\currentCache3Data_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(15),
      Q => \currentCache3Data_reg_n_0_[15]\,
      R => '0'
    );
\currentCache3Data_reg[160]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(160),
      Q => data5(0),
      R => '0'
    );
\currentCache3Data_reg[161]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(161),
      Q => data5(1),
      R => '0'
    );
\currentCache3Data_reg[162]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(162),
      Q => data5(2),
      R => '0'
    );
\currentCache3Data_reg[163]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(163),
      Q => data5(3),
      R => '0'
    );
\currentCache3Data_reg[164]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(164),
      Q => data5(4),
      R => '0'
    );
\currentCache3Data_reg[165]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(165),
      Q => data5(5),
      R => '0'
    );
\currentCache3Data_reg[166]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(166),
      Q => data5(6),
      R => '0'
    );
\currentCache3Data_reg[167]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(167),
      Q => data5(7),
      R => '0'
    );
\currentCache3Data_reg[168]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(168),
      Q => data5(8),
      R => '0'
    );
\currentCache3Data_reg[169]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(169),
      Q => data5(9),
      R => '0'
    );
\currentCache3Data_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(16),
      Q => \currentCache3Data_reg_n_0_[16]\,
      R => '0'
    );
\currentCache3Data_reg[170]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(170),
      Q => data5(10),
      R => '0'
    );
\currentCache3Data_reg[171]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(171),
      Q => data5(11),
      R => '0'
    );
\currentCache3Data_reg[172]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(172),
      Q => data5(12),
      R => '0'
    );
\currentCache3Data_reg[173]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(173),
      Q => data5(13),
      R => '0'
    );
\currentCache3Data_reg[174]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(174),
      Q => data5(14),
      R => '0'
    );
\currentCache3Data_reg[175]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(175),
      Q => data5(15),
      R => '0'
    );
\currentCache3Data_reg[176]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(176),
      Q => data5(16),
      R => '0'
    );
\currentCache3Data_reg[177]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(177),
      Q => data5(17),
      R => '0'
    );
\currentCache3Data_reg[178]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(178),
      Q => data5(18),
      R => '0'
    );
\currentCache3Data_reg[179]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(179),
      Q => data5(19),
      R => '0'
    );
\currentCache3Data_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(17),
      Q => \currentCache3Data_reg_n_0_[17]\,
      R => '0'
    );
\currentCache3Data_reg[180]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(180),
      Q => data5(20),
      R => '0'
    );
\currentCache3Data_reg[181]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(181),
      Q => data5(21),
      R => '0'
    );
\currentCache3Data_reg[182]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(182),
      Q => data5(22),
      R => '0'
    );
\currentCache3Data_reg[183]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(183),
      Q => data5(23),
      R => '0'
    );
\currentCache3Data_reg[184]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(184),
      Q => data5(24),
      R => '0'
    );
\currentCache3Data_reg[185]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(185),
      Q => data5(25),
      R => '0'
    );
\currentCache3Data_reg[186]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(186),
      Q => data5(26),
      R => '0'
    );
\currentCache3Data_reg[187]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(187),
      Q => data5(27),
      R => '0'
    );
\currentCache3Data_reg[188]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(188),
      Q => data5(28),
      R => '0'
    );
\currentCache3Data_reg[189]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(189),
      Q => data5(29),
      R => '0'
    );
\currentCache3Data_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(18),
      Q => \currentCache3Data_reg_n_0_[18]\,
      R => '0'
    );
\currentCache3Data_reg[190]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(190),
      Q => data5(30),
      R => '0'
    );
\currentCache3Data_reg[191]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(191),
      Q => data5(31),
      R => '0'
    );
\currentCache3Data_reg[192]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(192),
      Q => data6(0),
      R => '0'
    );
\currentCache3Data_reg[193]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(193),
      Q => data6(1),
      R => '0'
    );
\currentCache3Data_reg[194]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(194),
      Q => data6(2),
      R => '0'
    );
\currentCache3Data_reg[195]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(195),
      Q => data6(3),
      R => '0'
    );
\currentCache3Data_reg[196]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(196),
      Q => data6(4),
      R => '0'
    );
\currentCache3Data_reg[197]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(197),
      Q => data6(5),
      R => '0'
    );
\currentCache3Data_reg[198]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(198),
      Q => data6(6),
      R => '0'
    );
\currentCache3Data_reg[199]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(199),
      Q => data6(7),
      R => '0'
    );
\currentCache3Data_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(19),
      Q => \currentCache3Data_reg_n_0_[19]\,
      R => '0'
    );
\currentCache3Data_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(1),
      Q => \currentCache3Data_reg_n_0_[1]\,
      R => '0'
    );
\currentCache3Data_reg[200]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(200),
      Q => data6(8),
      R => '0'
    );
\currentCache3Data_reg[201]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(201),
      Q => data6(9),
      R => '0'
    );
\currentCache3Data_reg[202]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(202),
      Q => data6(10),
      R => '0'
    );
\currentCache3Data_reg[203]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(203),
      Q => data6(11),
      R => '0'
    );
\currentCache3Data_reg[204]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(204),
      Q => data6(12),
      R => '0'
    );
\currentCache3Data_reg[205]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(205),
      Q => data6(13),
      R => '0'
    );
\currentCache3Data_reg[206]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(206),
      Q => data6(14),
      R => '0'
    );
\currentCache3Data_reg[207]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(207),
      Q => data6(15),
      R => '0'
    );
\currentCache3Data_reg[208]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(208),
      Q => data6(16),
      R => '0'
    );
\currentCache3Data_reg[209]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(209),
      Q => data6(17),
      R => '0'
    );
\currentCache3Data_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(20),
      Q => \currentCache3Data_reg_n_0_[20]\,
      R => '0'
    );
\currentCache3Data_reg[210]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(210),
      Q => data6(18),
      R => '0'
    );
\currentCache3Data_reg[211]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(211),
      Q => data6(19),
      R => '0'
    );
\currentCache3Data_reg[212]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(212),
      Q => data6(20),
      R => '0'
    );
\currentCache3Data_reg[213]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(213),
      Q => data6(21),
      R => '0'
    );
\currentCache3Data_reg[214]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(214),
      Q => data6(22),
      R => '0'
    );
\currentCache3Data_reg[215]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(215),
      Q => data6(23),
      R => '0'
    );
\currentCache3Data_reg[216]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(216),
      Q => data6(24),
      R => '0'
    );
\currentCache3Data_reg[217]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(217),
      Q => data6(25),
      R => '0'
    );
\currentCache3Data_reg[218]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(218),
      Q => data6(26),
      R => '0'
    );
\currentCache3Data_reg[219]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(219),
      Q => data6(27),
      R => '0'
    );
\currentCache3Data_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(21),
      Q => \currentCache3Data_reg_n_0_[21]\,
      R => '0'
    );
\currentCache3Data_reg[220]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(220),
      Q => data6(28),
      R => '0'
    );
\currentCache3Data_reg[221]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(221),
      Q => data6(29),
      R => '0'
    );
\currentCache3Data_reg[222]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(222),
      Q => data6(30),
      R => '0'
    );
\currentCache3Data_reg[223]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(223),
      Q => data6(31),
      R => '0'
    );
\currentCache3Data_reg[224]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(224),
      Q => data7(0),
      R => '0'
    );
\currentCache3Data_reg[225]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(225),
      Q => data7(1),
      R => '0'
    );
\currentCache3Data_reg[226]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(226),
      Q => data7(2),
      R => '0'
    );
\currentCache3Data_reg[227]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(227),
      Q => data7(3),
      R => '0'
    );
\currentCache3Data_reg[228]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(228),
      Q => data7(4),
      R => '0'
    );
\currentCache3Data_reg[229]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(229),
      Q => data7(5),
      R => '0'
    );
\currentCache3Data_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(22),
      Q => \currentCache3Data_reg_n_0_[22]\,
      R => '0'
    );
\currentCache3Data_reg[230]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(230),
      Q => data7(6),
      R => '0'
    );
\currentCache3Data_reg[231]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(231),
      Q => data7(7),
      R => '0'
    );
\currentCache3Data_reg[232]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(232),
      Q => data7(8),
      R => '0'
    );
\currentCache3Data_reg[233]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(233),
      Q => data7(9),
      R => '0'
    );
\currentCache3Data_reg[234]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(234),
      Q => data7(10),
      R => '0'
    );
\currentCache3Data_reg[235]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(235),
      Q => data7(11),
      R => '0'
    );
\currentCache3Data_reg[236]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(236),
      Q => data7(12),
      R => '0'
    );
\currentCache3Data_reg[237]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(237),
      Q => data7(13),
      R => '0'
    );
\currentCache3Data_reg[238]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(238),
      Q => data7(14),
      R => '0'
    );
\currentCache3Data_reg[239]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(239),
      Q => data7(15),
      R => '0'
    );
\currentCache3Data_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(23),
      Q => \currentCache3Data_reg_n_0_[23]\,
      R => '0'
    );
\currentCache3Data_reg[240]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(240),
      Q => data7(16),
      R => '0'
    );
\currentCache3Data_reg[241]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(241),
      Q => data7(17),
      R => '0'
    );
\currentCache3Data_reg[242]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(242),
      Q => data7(18),
      R => '0'
    );
\currentCache3Data_reg[243]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(243),
      Q => data7(19),
      R => '0'
    );
\currentCache3Data_reg[244]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(244),
      Q => data7(20),
      R => '0'
    );
\currentCache3Data_reg[245]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(245),
      Q => data7(21),
      R => '0'
    );
\currentCache3Data_reg[246]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(246),
      Q => data7(22),
      R => '0'
    );
\currentCache3Data_reg[247]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(247),
      Q => data7(23),
      R => '0'
    );
\currentCache3Data_reg[248]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(248),
      Q => data7(24),
      R => '0'
    );
\currentCache3Data_reg[249]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(249),
      Q => data7(25),
      R => '0'
    );
\currentCache3Data_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(24),
      Q => \currentCache3Data_reg_n_0_[24]\,
      R => '0'
    );
\currentCache3Data_reg[250]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(250),
      Q => data7(26),
      R => '0'
    );
\currentCache3Data_reg[251]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(251),
      Q => data7(27),
      R => '0'
    );
\currentCache3Data_reg[252]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(252),
      Q => data7(28),
      R => '0'
    );
\currentCache3Data_reg[253]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(253),
      Q => data7(29),
      R => '0'
    );
\currentCache3Data_reg[254]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(254),
      Q => data7(30),
      R => '0'
    );
\currentCache3Data_reg[255]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(255),
      Q => data7(31),
      R => '0'
    );
\currentCache3Data_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(25),
      Q => \currentCache3Data_reg_n_0_[25]\,
      R => '0'
    );
\currentCache3Data_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(26),
      Q => \currentCache3Data_reg_n_0_[26]\,
      R => '0'
    );
\currentCache3Data_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(27),
      Q => \currentCache3Data_reg_n_0_[27]\,
      R => '0'
    );
\currentCache3Data_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(28),
      Q => \currentCache3Data_reg_n_0_[28]\,
      R => '0'
    );
\currentCache3Data_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(29),
      Q => \currentCache3Data_reg_n_0_[29]\,
      R => '0'
    );
\currentCache3Data_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(2),
      Q => \currentCache3Data_reg_n_0_[2]\,
      R => '0'
    );
\currentCache3Data_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(30),
      Q => \currentCache3Data_reg_n_0_[30]\,
      R => '0'
    );
\currentCache3Data_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(31),
      Q => \currentCache3Data_reg_n_0_[31]\,
      R => '0'
    );
\currentCache3Data_reg[32]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(32),
      Q => data1(0),
      R => '0'
    );
\currentCache3Data_reg[33]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(33),
      Q => data1(1),
      R => '0'
    );
\currentCache3Data_reg[34]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(34),
      Q => data1(2),
      R => '0'
    );
\currentCache3Data_reg[35]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(35),
      Q => data1(3),
      R => '0'
    );
\currentCache3Data_reg[36]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(36),
      Q => data1(4),
      R => '0'
    );
\currentCache3Data_reg[37]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(37),
      Q => data1(5),
      R => '0'
    );
\currentCache3Data_reg[38]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(38),
      Q => data1(6),
      R => '0'
    );
\currentCache3Data_reg[39]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(39),
      Q => data1(7),
      R => '0'
    );
\currentCache3Data_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(3),
      Q => \currentCache3Data_reg_n_0_[3]\,
      R => '0'
    );
\currentCache3Data_reg[40]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(40),
      Q => data1(8),
      R => '0'
    );
\currentCache3Data_reg[41]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(41),
      Q => data1(9),
      R => '0'
    );
\currentCache3Data_reg[42]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(42),
      Q => data1(10),
      R => '0'
    );
\currentCache3Data_reg[43]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(43),
      Q => data1(11),
      R => '0'
    );
\currentCache3Data_reg[44]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(44),
      Q => data1(12),
      R => '0'
    );
\currentCache3Data_reg[45]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(45),
      Q => data1(13),
      R => '0'
    );
\currentCache3Data_reg[46]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(46),
      Q => data1(14),
      R => '0'
    );
\currentCache3Data_reg[47]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(47),
      Q => data1(15),
      R => '0'
    );
\currentCache3Data_reg[48]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(48),
      Q => data1(16),
      R => '0'
    );
\currentCache3Data_reg[49]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(49),
      Q => data1(17),
      R => '0'
    );
\currentCache3Data_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(4),
      Q => \currentCache3Data_reg_n_0_[4]\,
      R => '0'
    );
\currentCache3Data_reg[50]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(50),
      Q => data1(18),
      R => '0'
    );
\currentCache3Data_reg[51]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(51),
      Q => data1(19),
      R => '0'
    );
\currentCache3Data_reg[52]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(52),
      Q => data1(20),
      R => '0'
    );
\currentCache3Data_reg[53]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(53),
      Q => data1(21),
      R => '0'
    );
\currentCache3Data_reg[54]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(54),
      Q => data1(22),
      R => '0'
    );
\currentCache3Data_reg[55]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(55),
      Q => data1(23),
      R => '0'
    );
\currentCache3Data_reg[56]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(56),
      Q => data1(24),
      R => '0'
    );
\currentCache3Data_reg[57]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(57),
      Q => data1(25),
      R => '0'
    );
\currentCache3Data_reg[58]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(58),
      Q => data1(26),
      R => '0'
    );
\currentCache3Data_reg[59]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(59),
      Q => data1(27),
      R => '0'
    );
\currentCache3Data_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(5),
      Q => \currentCache3Data_reg_n_0_[5]\,
      R => '0'
    );
\currentCache3Data_reg[60]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(60),
      Q => data1(28),
      R => '0'
    );
\currentCache3Data_reg[61]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(61),
      Q => data1(29),
      R => '0'
    );
\currentCache3Data_reg[62]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(62),
      Q => data1(30),
      R => '0'
    );
\currentCache3Data_reg[63]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(63),
      Q => data1(31),
      R => '0'
    );
\currentCache3Data_reg[64]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(64),
      Q => data2(0),
      R => '0'
    );
\currentCache3Data_reg[65]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(65),
      Q => data2(1),
      R => '0'
    );
\currentCache3Data_reg[66]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(66),
      Q => data2(2),
      R => '0'
    );
\currentCache3Data_reg[67]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(67),
      Q => data2(3),
      R => '0'
    );
\currentCache3Data_reg[68]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(68),
      Q => data2(4),
      R => '0'
    );
\currentCache3Data_reg[69]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(69),
      Q => data2(5),
      R => '0'
    );
\currentCache3Data_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(6),
      Q => \currentCache3Data_reg_n_0_[6]\,
      R => '0'
    );
\currentCache3Data_reg[70]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(70),
      Q => data2(6),
      R => '0'
    );
\currentCache3Data_reg[71]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(71),
      Q => data2(7),
      R => '0'
    );
\currentCache3Data_reg[72]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(72),
      Q => data2(8),
      R => '0'
    );
\currentCache3Data_reg[73]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(73),
      Q => data2(9),
      R => '0'
    );
\currentCache3Data_reg[74]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(74),
      Q => data2(10),
      R => '0'
    );
\currentCache3Data_reg[75]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(75),
      Q => data2(11),
      R => '0'
    );
\currentCache3Data_reg[76]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(76),
      Q => data2(12),
      R => '0'
    );
\currentCache3Data_reg[77]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(77),
      Q => data2(13),
      R => '0'
    );
\currentCache3Data_reg[78]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(78),
      Q => data2(14),
      R => '0'
    );
\currentCache3Data_reg[79]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(79),
      Q => data2(15),
      R => '0'
    );
\currentCache3Data_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(7),
      Q => \currentCache3Data_reg_n_0_[7]\,
      R => '0'
    );
\currentCache3Data_reg[80]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(80),
      Q => data2(16),
      R => '0'
    );
\currentCache3Data_reg[81]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(81),
      Q => data2(17),
      R => '0'
    );
\currentCache3Data_reg[82]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(82),
      Q => data2(18),
      R => '0'
    );
\currentCache3Data_reg[83]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(83),
      Q => data2(19),
      R => '0'
    );
\currentCache3Data_reg[84]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(84),
      Q => data2(20),
      R => '0'
    );
\currentCache3Data_reg[85]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(85),
      Q => data2(21),
      R => '0'
    );
\currentCache3Data_reg[86]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(86),
      Q => data2(22),
      R => '0'
    );
\currentCache3Data_reg[87]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(87),
      Q => data2(23),
      R => '0'
    );
\currentCache3Data_reg[88]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(88),
      Q => data2(24),
      R => '0'
    );
\currentCache3Data_reg[89]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(89),
      Q => data2(25),
      R => '0'
    );
\currentCache3Data_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(8),
      Q => \currentCache3Data_reg_n_0_[8]\,
      R => '0'
    );
\currentCache3Data_reg[90]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(90),
      Q => data2(26),
      R => '0'
    );
\currentCache3Data_reg[91]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(91),
      Q => data2(27),
      R => '0'
    );
\currentCache3Data_reg[92]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(92),
      Q => data2(28),
      R => '0'
    );
\currentCache3Data_reg[93]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(93),
      Q => data2(29),
      R => '0'
    );
\currentCache3Data_reg[94]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(94),
      Q => data2(30),
      R => '0'
    );
\currentCache3Data_reg[95]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(95),
      Q => data2(31),
      R => '0'
    );
\currentCache3Data_reg[96]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(96),
      Q => data3(0),
      R => '0'
    );
\currentCache3Data_reg[97]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(97),
      Q => data3(1),
      R => '0'
    );
\currentCache3Data_reg[98]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(98),
      Q => data3(2),
      R => '0'
    );
\currentCache3Data_reg[99]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(99),
      Q => data3(3),
      R => '0'
    );
\currentCache3Data_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => clk,
      CE => currentCache3Data,
      D => IBCReadResponsesFIFO_rd_data(9),
      Q => \currentCache3Data_reg_n_0_[9]\,
      R => '0'
    );
\i__carry__0_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => VBB_ReadAddr(29),
      I1 => currentCache1BaseAddr(24),
      O => \i__carry__0_i_1_n_0\
    );
\i__carry__0_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => VBB_ReadAddr(29),
      I1 => currentCache0BaseAddr(24),
      O => \i__carry__0_i_1__0_n_0\
    );
\i__carry_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache1BaseAddr(21),
      I1 => VBB_ReadAddr(26),
      I2 => VBB_ReadAddr(28),
      I3 => currentCache1BaseAddr(23),
      I4 => VBB_ReadAddr(27),
      I5 => currentCache1BaseAddr(22),
      O => \i__carry_i_1_n_0\
    );
\i__carry_i_1__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache0BaseAddr(21),
      I1 => VBB_ReadAddr(26),
      I2 => VBB_ReadAddr(28),
      I3 => currentCache0BaseAddr(23),
      I4 => VBB_ReadAddr(27),
      I5 => currentCache0BaseAddr(22),
      O => \i__carry_i_1__0_n_0\
    );
\i__carry_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache1BaseAddr(18),
      I1 => VBB_ReadAddr(23),
      I2 => VBB_ReadAddr(25),
      I3 => currentCache1BaseAddr(20),
      I4 => VBB_ReadAddr(24),
      I5 => currentCache1BaseAddr(19),
      O => \i__carry_i_2_n_0\
    );
\i__carry_i_2__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache0BaseAddr(18),
      I1 => VBB_ReadAddr(23),
      I2 => VBB_ReadAddr(25),
      I3 => currentCache0BaseAddr(20),
      I4 => VBB_ReadAddr(24),
      I5 => currentCache0BaseAddr(19),
      O => \i__carry_i_2__0_n_0\
    );
\i__carry_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache1BaseAddr(15),
      I1 => VBB_ReadAddr(20),
      I2 => VBB_ReadAddr(22),
      I3 => currentCache1BaseAddr(17),
      I4 => VBB_ReadAddr(21),
      I5 => currentCache1BaseAddr(16),
      O => \i__carry_i_3_n_0\
    );
\i__carry_i_3__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache0BaseAddr(15),
      I1 => VBB_ReadAddr(20),
      I2 => VBB_ReadAddr(22),
      I3 => currentCache0BaseAddr(17),
      I4 => VBB_ReadAddr(21),
      I5 => currentCache0BaseAddr(16),
      O => \i__carry_i_3__0_n_0\
    );
\i__carry_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache1BaseAddr(12),
      I1 => VBB_ReadAddr(17),
      I2 => VBB_ReadAddr(19),
      I3 => currentCache1BaseAddr(14),
      I4 => VBB_ReadAddr(18),
      I5 => currentCache1BaseAddr(13),
      O => \i__carry_i_4_n_0\
    );
\i__carry_i_4__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache0BaseAddr(12),
      I1 => VBB_ReadAddr(17),
      I2 => VBB_ReadAddr(19),
      I3 => currentCache0BaseAddr(14),
      I4 => VBB_ReadAddr(18),
      I5 => currentCache0BaseAddr(13),
      O => \i__carry_i_4__0_n_0\
    );
\i__carry_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache1BaseAddr(9),
      I1 => VBB_ReadAddr(14),
      I2 => VBB_ReadAddr(16),
      I3 => currentCache1BaseAddr(11),
      I4 => VBB_ReadAddr(15),
      I5 => currentCache1BaseAddr(10),
      O => \i__carry_i_5_n_0\
    );
\i__carry_i_5__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache0BaseAddr(9),
      I1 => VBB_ReadAddr(14),
      I2 => VBB_ReadAddr(16),
      I3 => currentCache0BaseAddr(11),
      I4 => VBB_ReadAddr(15),
      I5 => currentCache0BaseAddr(10),
      O => \i__carry_i_5__0_n_0\
    );
\i__carry_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache1BaseAddr(6),
      I1 => VBB_ReadAddr(11),
      I2 => VBB_ReadAddr(13),
      I3 => currentCache1BaseAddr(8),
      I4 => VBB_ReadAddr(12),
      I5 => currentCache1BaseAddr(7),
      O => \i__carry_i_6_n_0\
    );
\i__carry_i_6__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache0BaseAddr(6),
      I1 => VBB_ReadAddr(11),
      I2 => VBB_ReadAddr(13),
      I3 => currentCache0BaseAddr(8),
      I4 => VBB_ReadAddr(12),
      I5 => currentCache0BaseAddr(7),
      O => \i__carry_i_6__0_n_0\
    );
\i__carry_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache1BaseAddr(3),
      I1 => VBB_ReadAddr(8),
      I2 => VBB_ReadAddr(10),
      I3 => currentCache1BaseAddr(5),
      I4 => VBB_ReadAddr(9),
      I5 => currentCache1BaseAddr(4),
      O => \i__carry_i_7_n_0\
    );
\i__carry_i_7__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache0BaseAddr(3),
      I1 => VBB_ReadAddr(8),
      I2 => VBB_ReadAddr(10),
      I3 => currentCache0BaseAddr(5),
      I4 => VBB_ReadAddr(9),
      I5 => currentCache0BaseAddr(4),
      O => \i__carry_i_7__0_n_0\
    );
\i__carry_i_8\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache1BaseAddr(0),
      I1 => VBB_ReadAddr(5),
      I2 => VBB_ReadAddr(7),
      I3 => currentCache1BaseAddr(2),
      I4 => VBB_ReadAddr(6),
      I5 => currentCache1BaseAddr(1),
      O => \i__carry_i_8_n_0\
    );
\i__carry_i_8__0\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => currentCache0BaseAddr(0),
      I1 => VBB_ReadAddr(5),
      I2 => VBB_ReadAddr(7),
      I3 => currentCache0BaseAddr(2),
      I4 => VBB_ReadAddr(6),
      I5 => currentCache0BaseAddr(1),
      O => \i__carry_i_8__0_n_0\
    );
\nextCacheLineWrite[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \nextCacheLineWrite_reg_n_0_[0]\,
      O => plusOp(0)
    );
\nextCacheLineWrite[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \nextCacheLineWrite_reg_n_0_[0]\,
      I1 => \nextCacheLineWrite_reg_n_0_[1]\,
      O => plusOp(1)
    );
\nextCacheLineWrite_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IBCReadResponsesFIFO_rd_en_i_1_n_0,
      D => plusOp(0),
      Q => \nextCacheLineWrite_reg_n_0_[0]\,
      R => '0'
    );
\nextCacheLineWrite_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => IBCReadResponsesFIFO_rd_en_i_1_n_0,
      D => plusOp(1),
      Q => \nextCacheLineWrite_reg_n_0_[1]\,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_IndexBufferCache_0_0 is
  port (
    clk : in STD_LOGIC;
    VBB_ReadEnable : in STD_LOGIC;
    VBB_ReadAddr : in STD_LOGIC_VECTOR ( 29 downto 0 );
    VBB_ReadData : out STD_LOGIC_VECTOR ( 31 downto 0 );
    VBB_ReadReady : out STD_LOGIC;
    VBB_InvalidateIndexCache : in STD_LOGIC;
    IBCReadRequestsFIFO_full : in STD_LOGIC;
    IBCReadRequestsFIFO_wr_data : out STD_LOGIC_VECTOR ( 29 downto 0 );
    IBCReadRequestsFIFO_wr_en : out STD_LOGIC;
    IBCReadResponsesFIFO_rd_data : in STD_LOGIC_VECTOR ( 255 downto 0 );
    IBCReadResponsesFIFO_empty : in STD_LOGIC;
    IBCReadResponsesFIFO_rd_en : out STD_LOGIC;
    DBG_State : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DBG_IBCReadRequestsFIFO_full : out STD_LOGIC;
    DBG_IBCReadResponsesFIFO_empty : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_IndexBufferCache_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_IndexBufferCache_0_0 : entity is "design_1_IndexBufferCache_0_0,IndexBufferCache,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_IndexBufferCache_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_IndexBufferCache_0_0 : entity is "IndexBufferCache,Vivado 2018.1_AR73068";
end design_1_IndexBufferCache_0_0;

architecture STRUCTURE of design_1_IndexBufferCache_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^ibcreadrequestsfifo_full\ : STD_LOGIC;
  signal \^ibcreadrequestsfifo_wr_data\ : STD_LOGIC_VECTOR ( 29 downto 5 );
  signal \^ibcreadresponsesfifo_empty\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of IBCReadRequestsFIFO_full : signal is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests FULL";
  attribute x_interface_info of IBCReadRequestsFIFO_wr_en : signal is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_EN";
  attribute x_interface_info of IBCReadResponsesFIFO_empty : signal is "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses EMPTY";
  attribute x_interface_info of IBCReadResponsesFIFO_rd_en : signal is "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses RD_EN";
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 333250000, PHASE 0.00, CLK_DOMAIN design_1_ddr4_0_1_c0_ddr4_ui_clk";
  attribute x_interface_info of IBCReadRequestsFIFO_wr_data : signal is "xilinx.com:interface:fifo_write:1.0 IBCacheReadRequests WR_DATA";
  attribute x_interface_info of IBCReadResponsesFIFO_rd_data : signal is "xilinx.com:interface:fifo_read:1.0 IBCacheReadResponses RD_DATA";
begin
  DBG_IBCReadRequestsFIFO_full <= \^ibcreadrequestsfifo_full\;
  DBG_IBCReadResponsesFIFO_empty <= \^ibcreadresponsesfifo_empty\;
  IBCReadRequestsFIFO_wr_data(29 downto 5) <= \^ibcreadrequestsfifo_wr_data\(29 downto 5);
  IBCReadRequestsFIFO_wr_data(4) <= \<const0>\;
  IBCReadRequestsFIFO_wr_data(3) <= \<const0>\;
  IBCReadRequestsFIFO_wr_data(2) <= \<const0>\;
  IBCReadRequestsFIFO_wr_data(1) <= \<const0>\;
  IBCReadRequestsFIFO_wr_data(0) <= \<const0>\;
  \^ibcreadrequestsfifo_full\ <= IBCReadRequestsFIFO_full;
  \^ibcreadresponsesfifo_empty\ <= IBCReadResponsesFIFO_empty;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
U0: entity work.design_1_IndexBufferCache_0_0_IndexBufferCache
     port map (
      DBG_State(1 downto 0) => DBG_State(1 downto 0),
      IBCReadRequestsFIFO_full => \^ibcreadrequestsfifo_full\,
      IBCReadRequestsFIFO_wr_data(24 downto 0) => \^ibcreadrequestsfifo_wr_data\(29 downto 5),
      IBCReadRequestsFIFO_wr_en => IBCReadRequestsFIFO_wr_en,
      IBCReadResponsesFIFO_empty => \^ibcreadresponsesfifo_empty\,
      IBCReadResponsesFIFO_rd_data(255 downto 0) => IBCReadResponsesFIFO_rd_data(255 downto 0),
      IBCReadResponsesFIFO_rd_en => IBCReadResponsesFIFO_rd_en,
      VBB_InvalidateIndexCache => VBB_InvalidateIndexCache,
      VBB_ReadAddr(29 downto 0) => VBB_ReadAddr(29 downto 0),
      VBB_ReadData(31 downto 0) => VBB_ReadData(31 downto 0),
      VBB_ReadEnable => VBB_ReadEnable,
      VBB_ReadReady => VBB_ReadReady,
      clk => clk
    );
end STRUCTURE;
